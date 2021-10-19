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

// &ModuleBeg; @26
module ct_lsu_dcache_top(
  cp0_lsu_icg_en,
  dcache_lsu_ld_data_bank0_dout,
  dcache_lsu_ld_data_bank1_dout,
  dcache_lsu_ld_data_bank2_dout,
  dcache_lsu_ld_data_bank3_dout,
  dcache_lsu_ld_data_bank4_dout,
  dcache_lsu_ld_data_bank5_dout,
  dcache_lsu_ld_data_bank6_dout,
  dcache_lsu_ld_data_bank7_dout,
  dcache_lsu_ld_tag_dout,
  dcache_lsu_st_dirty_dout,
  dcache_lsu_st_tag_dout,
  forever_cpuclk,
  lsu_dcache_ld_data_gateclk_en,
  lsu_dcache_ld_data_gwen_b,
  lsu_dcache_ld_data_high_din,
  lsu_dcache_ld_data_high_idx,
  lsu_dcache_ld_data_low_din,
  lsu_dcache_ld_data_low_idx,
  lsu_dcache_ld_data_sel_b,
  lsu_dcache_ld_data_wen_b,
  lsu_dcache_ld_tag_din,
  lsu_dcache_ld_tag_gateclk_en,
  lsu_dcache_ld_tag_gwen_b,
  lsu_dcache_ld_tag_idx,
  lsu_dcache_ld_tag_sel_b,
  lsu_dcache_ld_tag_wen_b,
  lsu_dcache_st_dirty_din,
  lsu_dcache_st_dirty_gateclk_en,
  lsu_dcache_st_dirty_gwen_b,
  lsu_dcache_st_dirty_idx,
  lsu_dcache_st_dirty_sel_b,
  lsu_dcache_st_dirty_wen_b,
  lsu_dcache_st_tag_din,
  lsu_dcache_st_tag_gateclk_en,
  lsu_dcache_st_tag_gwen_b,
  lsu_dcache_st_tag_idx,
  lsu_dcache_st_tag_sel_b,
  lsu_dcache_st_tag_wen_b,
  pad_yy_icg_scan_en
);

// &Ports; @27
input            cp0_lsu_icg_en;                
input            forever_cpuclk;                
input   [7  :0]  lsu_dcache_ld_data_gateclk_en; 
input   [7  :0]  lsu_dcache_ld_data_gwen_b;     
input   [127:0]  lsu_dcache_ld_data_high_din;   
input   [10 :0]  lsu_dcache_ld_data_high_idx;   
input   [127:0]  lsu_dcache_ld_data_low_din;    
input   [10 :0]  lsu_dcache_ld_data_low_idx;    
input   [7  :0]  lsu_dcache_ld_data_sel_b;      
input   [31 :0]  lsu_dcache_ld_data_wen_b;      
input   [53 :0]  lsu_dcache_ld_tag_din;         
input            lsu_dcache_ld_tag_gateclk_en;  
input            lsu_dcache_ld_tag_gwen_b;      
input   [8  :0]  lsu_dcache_ld_tag_idx;         
input            lsu_dcache_ld_tag_sel_b;       
input   [1  :0]  lsu_dcache_ld_tag_wen_b;       
input   [6  :0]  lsu_dcache_st_dirty_din;       
input            lsu_dcache_st_dirty_gateclk_en; 
input            lsu_dcache_st_dirty_gwen_b;    
input   [8  :0]  lsu_dcache_st_dirty_idx;       
input            lsu_dcache_st_dirty_sel_b;     
input   [6  :0]  lsu_dcache_st_dirty_wen_b;     
input   [51 :0]  lsu_dcache_st_tag_din;         
input            lsu_dcache_st_tag_gateclk_en;  
input            lsu_dcache_st_tag_gwen_b;      
input   [8  :0]  lsu_dcache_st_tag_idx;         
input            lsu_dcache_st_tag_sel_b;       
input   [1  :0]  lsu_dcache_st_tag_wen_b;       
input            pad_yy_icg_scan_en;            
output  [31 :0]  dcache_lsu_ld_data_bank0_dout; 
output  [31 :0]  dcache_lsu_ld_data_bank1_dout; 
output  [31 :0]  dcache_lsu_ld_data_bank2_dout; 
output  [31 :0]  dcache_lsu_ld_data_bank3_dout; 
output  [31 :0]  dcache_lsu_ld_data_bank4_dout; 
output  [31 :0]  dcache_lsu_ld_data_bank5_dout; 
output  [31 :0]  dcache_lsu_ld_data_bank6_dout; 
output  [31 :0]  dcache_lsu_ld_data_bank7_dout; 
output  [53 :0]  dcache_lsu_ld_tag_dout;        
output  [6  :0]  dcache_lsu_st_dirty_dout;      
output  [51 :0]  dcache_lsu_st_tag_dout;        

// &Regs; @28

// &Wires; @29
wire             cp0_lsu_icg_en;                
wire    [31 :0]  dcache_lsu_ld_data_bank0_dout; 
wire    [31 :0]  dcache_lsu_ld_data_bank1_dout; 
wire    [31 :0]  dcache_lsu_ld_data_bank2_dout; 
wire    [31 :0]  dcache_lsu_ld_data_bank3_dout; 
wire    [31 :0]  dcache_lsu_ld_data_bank4_dout; 
wire    [31 :0]  dcache_lsu_ld_data_bank5_dout; 
wire    [31 :0]  dcache_lsu_ld_data_bank6_dout; 
wire    [31 :0]  dcache_lsu_ld_data_bank7_dout; 
wire    [53 :0]  dcache_lsu_ld_tag_dout;        
wire    [6  :0]  dcache_lsu_st_dirty_dout;      
wire    [51 :0]  dcache_lsu_st_tag_dout;        
wire             forever_cpuclk;                
wire    [7  :0]  lsu_dcache_ld_data_gateclk_en; 
wire    [7  :0]  lsu_dcache_ld_data_gwen_b;     
wire    [127:0]  lsu_dcache_ld_data_high_din;   
wire    [10 :0]  lsu_dcache_ld_data_high_idx;   
wire    [127:0]  lsu_dcache_ld_data_low_din;    
wire    [10 :0]  lsu_dcache_ld_data_low_idx;    
wire    [7  :0]  lsu_dcache_ld_data_sel_b;      
wire    [31 :0]  lsu_dcache_ld_data_wen_b;      
wire    [53 :0]  lsu_dcache_ld_tag_din;         
wire             lsu_dcache_ld_tag_gateclk_en;  
wire             lsu_dcache_ld_tag_gwen_b;      
wire    [8  :0]  lsu_dcache_ld_tag_idx;         
wire             lsu_dcache_ld_tag_sel_b;       
wire    [1  :0]  lsu_dcache_ld_tag_wen_b;       
wire    [6  :0]  lsu_dcache_st_dirty_din;       
wire             lsu_dcache_st_dirty_gateclk_en; 
wire             lsu_dcache_st_dirty_gwen_b;    
wire    [8  :0]  lsu_dcache_st_dirty_idx;       
wire             lsu_dcache_st_dirty_sel_b;     
wire    [6  :0]  lsu_dcache_st_dirty_wen_b;     
wire    [51 :0]  lsu_dcache_st_tag_din;         
wire             lsu_dcache_st_tag_gateclk_en;  
wire             lsu_dcache_st_tag_gwen_b;      
wire    [8  :0]  lsu_dcache_st_tag_idx;         
wire             lsu_dcache_st_tag_sel_b;       
wire    [1  :0]  lsu_dcache_st_tag_wen_b;       
wire             pad_yy_icg_scan_en;            


//==========================================================
//                Instance dcache array
//==========================================================
//---------------------tag and dirty------------------------
// &Instance("ct_lsu_dcache_ld_tag_array", "x_ct_lsu_dcache_ld_tag_array"); @35
ct_lsu_dcache_ld_tag_array  x_ct_lsu_dcache_ld_tag_array (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .tag_din                      (lsu_dcache_ld_tag_din       ),
  .tag_dout                     (dcache_lsu_ld_tag_dout      ),
  .tag_gateclk_en               (lsu_dcache_ld_tag_gateclk_en),
  .tag_gwen_b                   (lsu_dcache_ld_tag_gwen_b    ),
  .tag_idx                      (lsu_dcache_ld_tag_idx       ),
  .tag_sel_b                    (lsu_dcache_ld_tag_sel_b     ),
  .tag_wen_b                    (lsu_dcache_ld_tag_wen_b     )
);

// &Connect( @36
//           .tag_gateclk_en         (lsu_dcache_ld_tag_gateclk_en   ), @37
//           .tag_dout               (dcache_lsu_ld_tag_dout         ), @38
//           .tag_sel_b              (lsu_dcache_ld_tag_sel_b        ), @39
//           .tag_wen_b              (lsu_dcache_ld_tag_wen_b        ), @40
//           .tag_din                (lsu_dcache_ld_tag_din          ), @41
//           .tag_idx                (lsu_dcache_ld_tag_idx          ), @42
//           .tag_gwen_b             (lsu_dcache_ld_tag_gwen_b       )); @43

// &Instance("ct_lsu_dcache_tag_array", "x_ct_lsu_dcache_st_tag_array"); @45
ct_lsu_dcache_tag_array  x_ct_lsu_dcache_st_tag_array (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .tag_din                      (lsu_dcache_st_tag_din       ),
  .tag_dout                     (dcache_lsu_st_tag_dout      ),
  .tag_gateclk_en               (lsu_dcache_st_tag_gateclk_en),
  .tag_gwen_b                   (lsu_dcache_st_tag_gwen_b    ),
  .tag_idx                      (lsu_dcache_st_tag_idx       ),
  .tag_sel_b                    (lsu_dcache_st_tag_sel_b     ),
  .tag_wen_b                    (lsu_dcache_st_tag_wen_b     )
);

// &Connect( @46
//           .tag_gateclk_en         (lsu_dcache_st_tag_gateclk_en   ), @47
//           .tag_dout               (dcache_lsu_st_tag_dout         ), @48
//           .tag_sel_b              (lsu_dcache_st_tag_sel_b        ), @49
//           .tag_wen_b              (lsu_dcache_st_tag_wen_b        ), @50
//           .tag_din                (lsu_dcache_st_tag_din          ), @51
//           .tag_idx                (lsu_dcache_st_tag_idx          ), @52
//           .tag_gwen_b             (lsu_dcache_st_tag_gwen_b       )); @53

// &Instance("ct_lsu_dcache_dirty_array", "x_ct_lsu_dcache_st_dirty_array"); @55
ct_lsu_dcache_dirty_array  x_ct_lsu_dcache_st_dirty_array (
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .dirty_din                      (lsu_dcache_st_dirty_din       ),
  .dirty_dout                     (dcache_lsu_st_dirty_dout      ),
  .dirty_gateclk_en               (lsu_dcache_st_dirty_gateclk_en),
  .dirty_gwen_b                   (lsu_dcache_st_dirty_gwen_b    ),
  .dirty_idx                      (lsu_dcache_st_dirty_idx       ),
  .dirty_sel_b                    (lsu_dcache_st_dirty_sel_b     ),
  .dirty_wen_b                    (lsu_dcache_st_dirty_wen_b     ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            )
);

// &Connect( @56
//           .dirty_gateclk_en       (lsu_dcache_st_dirty_gateclk_en ), @57
//           .dirty_dout             (dcache_lsu_st_dirty_dout       ), @58
//           .dirty_sel_b            (lsu_dcache_st_dirty_sel_b      ), @59
//           .dirty_wen_b            (lsu_dcache_st_dirty_wen_b      ), @60
//           .dirty_din              (lsu_dcache_st_dirty_din        ), @61
//           .dirty_idx              (lsu_dcache_st_dirty_idx        ), @62
//           .dirty_gwen_b           (lsu_dcache_st_dirty_gwen_b     )); @63

//-------------------------data-----------------------------
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank0_array"); @67
// &Connect( @68
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[0]   ), @69
//           .data_dout              (dcache_lsu_ld_data_bank0_dout      ), @70
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[0]        ), @71
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[3:0]      ), @72
//           .data_din               (lsu_dcache_ld_data_low_din[38:0]   ), @73
//           .data_idx               (lsu_dcache_ld_data_low_idx         ), @74
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[0]       )); @75
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank1_array"); @77
// &Connect( @78
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[1]   ), @79
//           .data_dout              (dcache_lsu_ld_data_bank1_dout      ), @80
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[1]        ), @81
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[7:4]      ), @82
//           .data_din               (lsu_dcache_ld_data_low_din[77:39]  ), @83
//           .data_idx               (lsu_dcache_ld_data_low_idx         ), @84
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[1]       )); @85
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank2_array"); @87
// &Connect( @88
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[2]   ), @89
//           .data_dout              (dcache_lsu_ld_data_bank2_dout      ), @90
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[2]        ), @91
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[11:8]     ), @92
//           .data_din               (lsu_dcache_ld_data_low_din[116:78]  ), @93
//           .data_idx               (lsu_dcache_ld_data_low_idx         ), @94
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[2]       )); @95
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank3_array"); @97
// &Connect( @98
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[3]   ), @99
//           .data_dout              (dcache_lsu_ld_data_bank3_dout      ), @100
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[3]        ), @101
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[15:12]    ), @102
//           .data_din               (lsu_dcache_ld_data_low_din[155:117] ), @103
//           .data_idx               (lsu_dcache_ld_data_low_idx         ), @104
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[3]       )); @105
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank4_array"); @107
// &Connect( @108
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[4]   ), @109
//           .data_dout              (dcache_lsu_ld_data_bank4_dout      ), @110
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[4]        ), @111
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[19:16]    ), @112
//           .data_din               (lsu_dcache_ld_data_high_din[38:0]  ), @113
//           .data_idx               (lsu_dcache_ld_data_high_idx        ), @114
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[4]       )); @115
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank5_array"); @117
// &Connect( @118
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[5]   ), @119
//           .data_dout              (dcache_lsu_ld_data_bank5_dout      ), @120
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[5]        ), @121
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[23:20]    ), @122
//           .data_din               (lsu_dcache_ld_data_high_din[77:39] ), @123
//           .data_idx               (lsu_dcache_ld_data_high_idx        ), @124
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[5]       )); @125
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank6_array"); @127
// &Connect( @128
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[6]   ), @129
//           .data_dout              (dcache_lsu_ld_data_bank6_dout      ), @130
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[6]        ), @131
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[27:24]    ), @132
//           .data_din               (lsu_dcache_ld_data_high_din[116:78] ), @133
//           .data_idx               (lsu_dcache_ld_data_high_idx        ), @134
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[6]       )); @135
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank7_array"); @137
// &Connect( @138
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[7]   ), @139
//           .data_dout              (dcache_lsu_ld_data_bank7_dout      ), @140
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[7]        ), @141
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[31:28]    ), @142
//           .data_din               (lsu_dcache_ld_data_high_din[155:117]), @143
//           .data_idx               (lsu_dcache_ld_data_high_idx        ), @144
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[7]       )); @145
// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank0_array"); @147
ct_lsu_dcache_data_array  x_ct_lsu_dcache_ld_data_bank0_array (
  .cp0_lsu_icg_en                   (cp0_lsu_icg_en                  ),
  .data_din                         (lsu_dcache_ld_data_low_din[31:0]),
  .data_dout                        (dcache_lsu_ld_data_bank0_dout   ),
  .data_gateclk_en                  (lsu_dcache_ld_data_gateclk_en[0]),
  .data_gwen_b                      (lsu_dcache_ld_data_gwen_b[0]    ),
  .data_idx                         (lsu_dcache_ld_data_low_idx      ),
  .data_sel_b                       (lsu_dcache_ld_data_sel_b[0]     ),
  .data_wen_b                       (lsu_dcache_ld_data_wen_b[3:0]   ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              )
);

// &Connect( @148
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[0]   ), @149
//           .data_dout              (dcache_lsu_ld_data_bank0_dout      ), @150
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[0]        ), @151
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[3:0]      ), @152
//           .data_din               (lsu_dcache_ld_data_low_din[31:0]   ), @153
//           .data_idx               (lsu_dcache_ld_data_low_idx         ), @154
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[0]       )); @155

// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank1_array"); @157
ct_lsu_dcache_data_array  x_ct_lsu_dcache_ld_data_bank1_array (
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .data_din                          (lsu_dcache_ld_data_low_din[63:32]),
  .data_dout                         (dcache_lsu_ld_data_bank1_dout    ),
  .data_gateclk_en                   (lsu_dcache_ld_data_gateclk_en[1] ),
  .data_gwen_b                       (lsu_dcache_ld_data_gwen_b[1]     ),
  .data_idx                          (lsu_dcache_ld_data_low_idx       ),
  .data_sel_b                        (lsu_dcache_ld_data_sel_b[1]      ),
  .data_wen_b                        (lsu_dcache_ld_data_wen_b[7:4]    ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               )
);

// &Connect( @158
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[1]   ), @159
//           .data_dout              (dcache_lsu_ld_data_bank1_dout      ), @160
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[1]        ), @161
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[7:4]      ), @162
//           .data_din               (lsu_dcache_ld_data_low_din[63:32]  ), @163
//           .data_idx               (lsu_dcache_ld_data_low_idx         ), @164
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[1]       )); @165

// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank2_array"); @167
ct_lsu_dcache_data_array  x_ct_lsu_dcache_ld_data_bank2_array (
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .data_din                          (lsu_dcache_ld_data_low_din[95:64]),
  .data_dout                         (dcache_lsu_ld_data_bank2_dout    ),
  .data_gateclk_en                   (lsu_dcache_ld_data_gateclk_en[2] ),
  .data_gwen_b                       (lsu_dcache_ld_data_gwen_b[2]     ),
  .data_idx                          (lsu_dcache_ld_data_low_idx       ),
  .data_sel_b                        (lsu_dcache_ld_data_sel_b[2]      ),
  .data_wen_b                        (lsu_dcache_ld_data_wen_b[11:8]   ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               )
);

// &Connect( @168
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[2]   ), @169
//           .data_dout              (dcache_lsu_ld_data_bank2_dout      ), @170
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[2]        ), @171
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[11:8]     ), @172
//           .data_din               (lsu_dcache_ld_data_low_din[95:64]  ), @173
//           .data_idx               (lsu_dcache_ld_data_low_idx         ), @174
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[2]       )); @175

// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank3_array"); @177
ct_lsu_dcache_data_array  x_ct_lsu_dcache_ld_data_bank3_array (
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .data_din                           (lsu_dcache_ld_data_low_din[127:96]),
  .data_dout                          (dcache_lsu_ld_data_bank3_dout     ),
  .data_gateclk_en                    (lsu_dcache_ld_data_gateclk_en[3]  ),
  .data_gwen_b                        (lsu_dcache_ld_data_gwen_b[3]      ),
  .data_idx                           (lsu_dcache_ld_data_low_idx        ),
  .data_sel_b                         (lsu_dcache_ld_data_sel_b[3]       ),
  .data_wen_b                         (lsu_dcache_ld_data_wen_b[15:12]   ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                )
);

// &Connect( @178
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[3]   ), @179
//           .data_dout              (dcache_lsu_ld_data_bank3_dout      ), @180
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[3]        ), @181
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[15:12]    ), @182
//           .data_din               (lsu_dcache_ld_data_low_din[127:96] ), @183
//           .data_idx               (lsu_dcache_ld_data_low_idx         ), @184
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[3]       )); @185

// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank4_array"); @187
ct_lsu_dcache_data_array  x_ct_lsu_dcache_ld_data_bank4_array (
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .data_din                          (lsu_dcache_ld_data_high_din[31:0]),
  .data_dout                         (dcache_lsu_ld_data_bank4_dout    ),
  .data_gateclk_en                   (lsu_dcache_ld_data_gateclk_en[4] ),
  .data_gwen_b                       (lsu_dcache_ld_data_gwen_b[4]     ),
  .data_idx                          (lsu_dcache_ld_data_high_idx      ),
  .data_sel_b                        (lsu_dcache_ld_data_sel_b[4]      ),
  .data_wen_b                        (lsu_dcache_ld_data_wen_b[19:16]  ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               )
);

// &Connect( @188
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[4]   ), @189
//           .data_dout              (dcache_lsu_ld_data_bank4_dout      ), @190
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[4]        ), @191
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[19:16]    ), @192
//           .data_din               (lsu_dcache_ld_data_high_din[31:0]  ), @193
//           .data_idx               (lsu_dcache_ld_data_high_idx        ), @194
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[4]       )); @195

// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank5_array"); @197
ct_lsu_dcache_data_array  x_ct_lsu_dcache_ld_data_bank5_array (
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .data_din                           (lsu_dcache_ld_data_high_din[63:32]),
  .data_dout                          (dcache_lsu_ld_data_bank5_dout     ),
  .data_gateclk_en                    (lsu_dcache_ld_data_gateclk_en[5]  ),
  .data_gwen_b                        (lsu_dcache_ld_data_gwen_b[5]      ),
  .data_idx                           (lsu_dcache_ld_data_high_idx       ),
  .data_sel_b                         (lsu_dcache_ld_data_sel_b[5]       ),
  .data_wen_b                         (lsu_dcache_ld_data_wen_b[23:20]   ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                )
);

// &Connect( @198
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[5]   ), @199
//           .data_dout              (dcache_lsu_ld_data_bank5_dout      ), @200
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[5]        ), @201
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[23:20]    ), @202
//           .data_din               (lsu_dcache_ld_data_high_din[63:32] ), @203
//           .data_idx               (lsu_dcache_ld_data_high_idx        ), @204
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[5]       )); @205

// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank6_array"); @207
ct_lsu_dcache_data_array  x_ct_lsu_dcache_ld_data_bank6_array (
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .data_din                           (lsu_dcache_ld_data_high_din[95:64]),
  .data_dout                          (dcache_lsu_ld_data_bank6_dout     ),
  .data_gateclk_en                    (lsu_dcache_ld_data_gateclk_en[6]  ),
  .data_gwen_b                        (lsu_dcache_ld_data_gwen_b[6]      ),
  .data_idx                           (lsu_dcache_ld_data_high_idx       ),
  .data_sel_b                         (lsu_dcache_ld_data_sel_b[6]       ),
  .data_wen_b                         (lsu_dcache_ld_data_wen_b[27:24]   ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                )
);

// &Connect( @208
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[6]   ), @209
//           .data_dout              (dcache_lsu_ld_data_bank6_dout      ), @210
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[6]        ), @211
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[27:24]    ), @212
//           .data_din               (lsu_dcache_ld_data_high_din[95:64] ), @213
//           .data_idx               (lsu_dcache_ld_data_high_idx        ), @214
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[6]       )); @215

// &Instance("ct_lsu_dcache_data_array", "x_ct_lsu_dcache_ld_data_bank7_array"); @217
ct_lsu_dcache_data_array  x_ct_lsu_dcache_ld_data_bank7_array (
  .cp0_lsu_icg_en                      (cp0_lsu_icg_en                     ),
  .data_din                            (lsu_dcache_ld_data_high_din[127:96]),
  .data_dout                           (dcache_lsu_ld_data_bank7_dout      ),
  .data_gateclk_en                     (lsu_dcache_ld_data_gateclk_en[7]   ),
  .data_gwen_b                         (lsu_dcache_ld_data_gwen_b[7]       ),
  .data_idx                            (lsu_dcache_ld_data_high_idx        ),
  .data_sel_b                          (lsu_dcache_ld_data_sel_b[7]        ),
  .data_wen_b                          (lsu_dcache_ld_data_wen_b[31:28]    ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 )
);

// &Connect( @218
//           .data_gateclk_en        (lsu_dcache_ld_data_gateclk_en[7]   ), @219
//           .data_dout              (dcache_lsu_ld_data_bank7_dout      ), @220
//           .data_sel_b             (lsu_dcache_ld_data_sel_b[7]        ), @221
//           .data_wen_b             (lsu_dcache_ld_data_wen_b[31:28]    ), @222
//           .data_din               (lsu_dcache_ld_data_high_din[127:96]), @223
//           .data_idx               (lsu_dcache_ld_data_high_idx        ), @224
//           .data_gwen_b            (lsu_dcache_ld_data_gwen_b[7]       )); @225

// &ModuleEnd; @228
endmodule


