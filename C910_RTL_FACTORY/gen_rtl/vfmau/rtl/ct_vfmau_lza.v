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
module ct_vfmau_lza(
  addend,
  lza_result,
  sub_vld,
  summand
);

// &Ports; @24
input   [107:0]  addend;            
input            sub_vld;           
input   [107:0]  summand;           
output  [6  :0]  lza_result;        

// &Regs; @25
reg     [3  :0]  high_l2_set0_encod; 
reg     [3  :0]  high_l2_set1_encod; 
reg     [3  :0]  high_l2_set2_encod; 
reg     [3  :0]  high_l2_set3_encod; 
reg     [5  :0]  high_l3_set0_encod; 
reg     [3  :0]  low_l2_set0_encod; 
reg     [3  :0]  low_l2_set1_encod; 
reg     [3  :0]  low_l2_set2_encod; 
reg     [5  :0]  low_l3_set0_encod; 

// &Wires; @26
wire    [107:0]  addend;            
wire    [107:0]  carry_d;           
wire    [107:0]  carry_g;           
wire    [107:0]  carry_p;           
wire    [31 :0]  high_l1_encod;     
wire    [15 :0]  high_l1_vld;       
wire    [7  :0]  high_l2_encod;     
wire    [3  :0]  high_l2_vld;       
wire    [1  :0]  high_l3_encod;     
wire             high_l3_vld;       
wire    [21 :0]  low_l1_encod;      
wire    [10 :0]  low_l1_vld;        
wire    [5  :0]  low_l2_encod;      
wire    [2  :0]  low_l2_vld;        
wire    [1  :0]  low_l3_encod;      
wire             low_l3_vld;        
wire    [6  :0]  lza_l4_encod;      
wire    [107:0]  lza_precod;        
wire    [6  :0]  lza_result;        
wire             lza_result_vld;    
wire             sub_vld;           
wire    [107:0]  summand;           


//==========================================================
//                   Signal Pre-encode
//==========================================================
//----------------------------------------------------------
//                   Signal preparation
//----------------------------------------------------------
// carry_p: carry propagete
// carry_g: carry generate
// carry_d: carry delete
assign carry_p[107:0] = summand[107:0] ^ addend[107:0];
assign carry_g[107:0] = summand[107:0] & addend[107:0];
assign carry_d[107:0] = ~(summand[107:0] | addend[107:0]);
//----------------------------------------------------------
//                   Signal decode
//----------------------------------------------------------
//pre-predecode for leading zero anticipation
assign lza_precod[0] = 
    carry_p[1] && (carry_g[0] && sub_vld || carry_d[0])
 || !carry_p[1] && (carry_d[0] && sub_vld || carry_g[0]);

assign lza_precod[107] = 
    sub_vld && (carry_g[107] && !carry_d[106] || carry_d[107] && !carry_g[106])
 || !sub_vld && (carry_d[107] && !carry_d[106] || !carry_d[107]);

assign lza_precod[106:1] = 
    carry_p[107:2] & (carry_g[106:1] & ~carry_d[105:0] | carry_d[106:1] & ~carry_g[105:0])
 | ~carry_p[107:2] & (carry_g[106:1] & ~carry_g[105:0] | carry_d[106:1] & ~carry_d[105:0]);


//==========================================================
//                     LZA coding
//==========================================================
//----------------------------------------------------------
//                  high 64-bit lza encoder
//----------------------------------------------------------
//first level : 64:16 compressor , 16 4:2 lza_compressor
// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_0"); @64
ct_vfmau_lza_42  x_ct_vfmau_lza_42_0 (
  .lza_p0              (high_l1_encod[0]   ),
  .lza_p1              (high_l1_encod[1]   ),
  .lza_precod          (lza_precod[107:104]),
  .lza_vld             (high_l1_vld[15]    )
);

// &Connect(.lza_precod     (lza_precod[107:104]  ), @65
//          .lza_vld        (high_l1_vld[15]    ), @66
//          .lza_p0         (high_l1_encod[0]  ), @67
//          .lza_p1         (high_l1_encod[1]  )); @68

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_1"); @70
ct_vfmau_lza_42  x_ct_vfmau_lza_42_1 (
  .lza_p0              (high_l1_encod[2]   ),
  .lza_p1              (high_l1_encod[3]   ),
  .lza_precod          (lza_precod[103:100]),
  .lza_vld             (high_l1_vld[14]    )
);

// &Connect(.lza_precod     (lza_precod[103:100]  ), @71
//          .lza_vld        (high_l1_vld[14]    ), @72
//          .lza_p0         (high_l1_encod[2]  ), @73
//          .lza_p1         (high_l1_encod[3]  )); @74

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_2"); @76
ct_vfmau_lza_42  x_ct_vfmau_lza_42_2 (
  .lza_p0            (high_l1_encod[4] ),
  .lza_p1            (high_l1_encod[5] ),
  .lza_precod        (lza_precod[99:96]),
  .lza_vld           (high_l1_vld[13]  )
);

// &Connect(.lza_precod     (lza_precod[99:96]  ), @77
//          .lza_vld        (high_l1_vld[13]     ), @78
//          .lza_p0         (high_l1_encod[4]   ), @79
//          .lza_p1         (high_l1_encod[5]   )); @80

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_3"); @82
ct_vfmau_lza_42  x_ct_vfmau_lza_42_3 (
  .lza_p0            (high_l1_encod[6] ),
  .lza_p1            (high_l1_encod[7] ),
  .lza_precod        (lza_precod[95:92]),
  .lza_vld           (high_l1_vld[12]  )
);

// &Connect(.lza_precod     (lza_precod[95:92] ), @83
//          .lza_vld        (high_l1_vld[12]     ), @84
//          .lza_p0         (high_l1_encod[6]   ), @85
//          .lza_p1         (high_l1_encod[7]   )); @86

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_4"); @88
ct_vfmau_lza_42  x_ct_vfmau_lza_42_4 (
  .lza_p0            (high_l1_encod[8] ),
  .lza_p1            (high_l1_encod[9] ),
  .lza_precod        (lza_precod[91:88]),
  .lza_vld           (high_l1_vld[11]  )
);

// &Connect(.lza_precod     (lza_precod[91:88] ), @89
//          .lza_vld        (high_l1_vld[11]     ), @90
//          .lza_p0         (high_l1_encod[8]   ), @91
//          .lza_p1         (high_l1_encod[9]   )); @92

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_5"); @94
ct_vfmau_lza_42  x_ct_vfmau_lza_42_5 (
  .lza_p0            (high_l1_encod[10]),
  .lza_p1            (high_l1_encod[11]),
  .lza_precod        (lza_precod[87:84]),
  .lza_vld           (high_l1_vld[10]  )
);

// &Connect(.lza_precod     (lza_precod[87:84] ), @95
//          .lza_vld        (high_l1_vld[10]     ), @96
//          .lza_p0         (high_l1_encod[10]  ), @97
//          .lza_p1         (high_l1_encod[11]  )); @98

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_6"); @100
ct_vfmau_lza_42  x_ct_vfmau_lza_42_6 (
  .lza_p0            (high_l1_encod[12]),
  .lza_p1            (high_l1_encod[13]),
  .lza_precod        (lza_precod[83:80]),
  .lza_vld           (high_l1_vld[9]   )
);

// &Connect(.lza_precod     (lza_precod[83:80] ), @101
//          .lza_vld        (high_l1_vld[9]     ), @102
//          .lza_p0         (high_l1_encod[12]  ), @103
//          .lza_p1         (high_l1_encod[13]  )); @104

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_7"); @106
ct_vfmau_lza_42  x_ct_vfmau_lza_42_7 (
  .lza_p0            (high_l1_encod[14]),
  .lza_p1            (high_l1_encod[15]),
  .lza_precod        (lza_precod[79:76]),
  .lza_vld           (high_l1_vld[8]   )
);

// &Connect(.lza_precod     (lza_precod[79:76] ), @107
//          .lza_vld        (high_l1_vld[8]     ), @108
//          .lza_p0         (high_l1_encod[14]  ), @109
//          .lza_p1         (high_l1_encod[15]  )); @110

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_8"); @112
ct_vfmau_lza_42  x_ct_vfmau_lza_42_8 (
  .lza_p0            (high_l1_encod[16]),
  .lza_p1            (high_l1_encod[17]),
  .lza_precod        (lza_precod[75:72]),
  .lza_vld           (high_l1_vld[7]   )
);

// &Connect(.lza_precod     (lza_precod[75:72] ), @113
//          .lza_vld        (high_l1_vld[7]     ), @114
//          .lza_p0         (high_l1_encod[16]  ), @115
//          .lza_p1         (high_l1_encod[17]  )); @116

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_9"); @118
ct_vfmau_lza_42  x_ct_vfmau_lza_42_9 (
  .lza_p0            (high_l1_encod[18]),
  .lza_p1            (high_l1_encod[19]),
  .lza_precod        (lza_precod[71:68]),
  .lza_vld           (high_l1_vld[6]   )
);

// &Connect(.lza_precod     (lza_precod[71:68] ), @119
//          .lza_vld        (high_l1_vld[6]     ), @120
//          .lza_p0         (high_l1_encod[18]  ), @121
//          .lza_p1         (high_l1_encod[19]  )); @122

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_10"); @124
ct_vfmau_lza_42  x_ct_vfmau_lza_42_10 (
  .lza_p0            (high_l1_encod[20]),
  .lza_p1            (high_l1_encod[21]),
  .lza_precod        (lza_precod[67:64]),
  .lza_vld           (high_l1_vld[5]   )
);

// &Connect(.lza_precod     (lza_precod[67:64] ), @125
//          .lza_vld        (high_l1_vld[5]    ), @126
//          .lza_p0         (high_l1_encod[20]  ), @127
//          .lza_p1         (high_l1_encod[21]  )); @128

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_11"); @130
ct_vfmau_lza_42  x_ct_vfmau_lza_42_11 (
  .lza_p0            (high_l1_encod[22]),
  .lza_p1            (high_l1_encod[23]),
  .lza_precod        (lza_precod[63:60]),
  .lza_vld           (high_l1_vld[4]   )
);

// &Connect(.lza_precod     (lza_precod[63:60] ), @131
//          .lza_vld        (high_l1_vld[4]    ), @132
//          .lza_p0         (high_l1_encod[22]  ), @133
//          .lza_p1         (high_l1_encod[23]  )); @134

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_12"); @136
ct_vfmau_lza_42  x_ct_vfmau_lza_42_12 (
  .lza_p0            (high_l1_encod[24]),
  .lza_p1            (high_l1_encod[25]),
  .lza_precod        (lza_precod[59:56]),
  .lza_vld           (high_l1_vld[3]   )
);

// &Connect(.lza_precod     (lza_precod[59:56] ), @137
//          .lza_vld        (high_l1_vld[3]    ), @138
//          .lza_p0         (high_l1_encod[24]  ), @139
//          .lza_p1         (high_l1_encod[25]  )); @140

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_13"); @142
ct_vfmau_lza_42  x_ct_vfmau_lza_42_13 (
  .lza_p0            (high_l1_encod[26]),
  .lza_p1            (high_l1_encod[27]),
  .lza_precod        (lza_precod[55:52]),
  .lza_vld           (high_l1_vld[2]   )
);

// &Connect(.lza_precod     (lza_precod[55:52] ), @143
//          .lza_vld        (high_l1_vld[2]    ), @144
//          .lza_p0         (high_l1_encod[26]  ), @145
//          .lza_p1         (high_l1_encod[27]  )); @146

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_14"); @148
ct_vfmau_lza_42  x_ct_vfmau_lza_42_14 (
  .lza_p0            (high_l1_encod[28]),
  .lza_p1            (high_l1_encod[29]),
  .lza_precod        (lza_precod[51:48]),
  .lza_vld           (high_l1_vld[1]   )
);

// &Connect(.lza_precod     (lza_precod[51:48] ), @149
//          .lza_vld        (high_l1_vld[1]    ), @150
//          .lza_p0         (high_l1_encod[28]  ), @151
//          .lza_p1         (high_l1_encod[29]  )); @152

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_15"); @154
ct_vfmau_lza_42  x_ct_vfmau_lza_42_15 (
  .lza_p0            (high_l1_encod[30]),
  .lza_p1            (high_l1_encod[31]),
  .lza_precod        (lza_precod[47:44]),
  .lza_vld           (high_l1_vld[0]   )
);

// &Connect(.lza_precod     (lza_precod[47:44] ), @155
//          .lza_vld        (high_l1_vld[0]    ), @156
//          .lza_p0         (high_l1_encod[30]  ), @157
//          .lza_p1         (high_l1_encod[31]  )); @158

//second level : 16:4 compressor , 4 4:2 lza_compressor
// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_16"); @161
ct_vfmau_lza_42  x_ct_vfmau_lza_42_16 (
  .lza_p0             (high_l2_encod[0]  ),
  .lza_p1             (high_l2_encod[1]  ),
  .lza_precod         (high_l1_vld[15:12]),
  .lza_vld            (high_l2_vld[3]    )
);

// &Connect(.lza_precod     (high_l1_vld[15:12]  ), @162
//          .lza_vld        (high_l2_vld[3]    ), @163
//          .lza_p0         (high_l2_encod[0]  ), @164
//          .lza_p1         (high_l2_encod[1]  )); @165

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_17"); @167
ct_vfmau_lza_42  x_ct_vfmau_lza_42_17 (
  .lza_p0            (high_l2_encod[2] ),
  .lza_p1            (high_l2_encod[3] ),
  .lza_precod        (high_l1_vld[11:8]),
  .lza_vld           (high_l2_vld[2]   )
);

// &Connect(.lza_precod     (high_l1_vld[11:8]  ), @168
//          .lza_vld        (high_l2_vld[2]    ), @169
//          .lza_p0         (high_l2_encod[2]  ), @170
//          .lza_p1         (high_l2_encod[3]  )); @171

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_18"); @173
ct_vfmau_lza_42  x_ct_vfmau_lza_42_18 (
  .lza_p0           (high_l2_encod[4]),
  .lza_p1           (high_l2_encod[5]),
  .lza_precod       (high_l1_vld[7:4]),
  .lza_vld          (high_l2_vld[1]  )
);

// &Connect(.lza_precod     (high_l1_vld[7:4] ), @174
//          .lza_vld        (high_l2_vld[1]    ), @175
//          .lza_p0         (high_l2_encod[4]  ), @176
//          .lza_p1         (high_l2_encod[5]  )); @177

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_19"); @179
ct_vfmau_lza_42  x_ct_vfmau_lza_42_19 (
  .lza_p0           (high_l2_encod[6]),
  .lza_p1           (high_l2_encod[7]),
  .lza_precod       (high_l1_vld[3:0]),
  .lza_vld          (high_l2_vld[0]  )
);

// &Connect(.lza_precod     (high_l1_vld[3:0]), @180
//          .lza_vld        (high_l2_vld[0]    ), @181
//          .lza_p0         (high_l2_encod[6]  ), @182
//          .lza_p1         (high_l2_encod[7]  )); @183


// &CombBeg; @186
always @( high_l1_encod[3:0]
       or high_l2_encod[1:0]
       or high_l1_encod[7:4])
begin
case(high_l2_encod[1:0])
  2'b00   :  high_l2_set0_encod[3:0] = {2'b00,high_l1_encod[1:0]};
  2'b01   :  high_l2_set0_encod[3:0] = {2'b01,high_l1_encod[3:2]};
  2'b10   :  high_l2_set0_encod[3:0] = {2'b10,high_l1_encod[5:4]};
  2'b11   :  high_l2_set0_encod[3:0] = {2'b11,high_l1_encod[7:6]};
  default :  high_l2_set0_encod[3:0] = {4{1'bx}};
  endcase
// &CombEnd; @194
end

// &CombBeg; @196
always @( high_l2_encod[3:2]
       or high_l1_encod[15:8])
begin
case(high_l2_encod[3:2])
  2'b00   :  high_l2_set1_encod[3:0] = {2'b00,high_l1_encod[9:8]};
  2'b01   :  high_l2_set1_encod[3:0] = {2'b01,high_l1_encod[11:10]};
  2'b10   :  high_l2_set1_encod[3:0] = {2'b10,high_l1_encod[13:12]};
  2'b11   :  high_l2_set1_encod[3:0] = {2'b11,high_l1_encod[15:14]};
  default :  high_l2_set1_encod[3:0] = {4{1'bx}};
  endcase
// &CombEnd; @204
end

// &CombBeg; @206
always @( high_l1_encod[23:18]
       or high_l1_encod[17:16]
       or high_l2_encod[5:4])
begin
case(high_l2_encod[5:4])
  2'b00   :  high_l2_set2_encod[3:0] = {2'b00,high_l1_encod[17:16]};
  2'b01   :  high_l2_set2_encod[3:0] = {2'b01,high_l1_encod[19:18]};
  2'b10   :  high_l2_set2_encod[3:0] = {2'b10,high_l1_encod[21:20]};
  2'b11   :  high_l2_set2_encod[3:0] = {2'b11,high_l1_encod[23:22]};
  default :  high_l2_set2_encod[3:0] = {4{1'bx}};
  endcase
// &CombEnd; @214
end

// &CombBeg; @216
always @( high_l1_encod[31:26]
       or high_l1_encod[25:24]
       or high_l2_encod[7:6])
begin
case(high_l2_encod[7:6])
  2'b00   :  high_l2_set3_encod[3:0] = {2'b00,high_l1_encod[25:24]};
  2'b01   :  high_l2_set3_encod[3:0] = {2'b01,high_l1_encod[27:26]};
  2'b10   :  high_l2_set3_encod[3:0] = {2'b10,high_l1_encod[29:28]};
  2'b11   :  high_l2_set3_encod[3:0] = {2'b11,high_l1_encod[31:30]};
  default :  high_l2_set3_encod[3:0] = {4{1'bx}};
  endcase
// &CombEnd; @224
end

//third level : :4:1 compressor , 1 4:2 lza_compressor
// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_20"); @227
ct_vfmau_lza_42  x_ct_vfmau_lza_42_20 (
  .lza_p0           (high_l3_encod[0]),
  .lza_p1           (high_l3_encod[1]),
  .lza_precod       (high_l2_vld[3:0]),
  .lza_vld          (high_l3_vld     )
);

// &Connect(.lza_precod     (high_l2_vld[3:0]), @228
//          .lza_vld        (high_l3_vld    ), @229
//          .lza_p0         (high_l3_encod[0]  ), @230
//          .lza_p1         (high_l3_encod[1]  )); @231

// &CombBeg; @233
always @( high_l2_set2_encod[3:0]
       or high_l3_encod[1:0]
       or high_l2_set3_encod[3:0]
       or high_l2_set1_encod[3:0]
       or high_l2_set0_encod[3:0])
begin
case(high_l3_encod[1:0])
  2'b00   :  high_l3_set0_encod[5:0] = {2'b00,high_l2_set0_encod[3:0]};
  2'b01   :  high_l3_set0_encod[5:0] = {2'b01,high_l2_set1_encod[3:0]};
  2'b10   :  high_l3_set0_encod[5:0] = {2'b10,high_l2_set2_encod[3:0]};
  2'b11   :  high_l3_set0_encod[5:0] = {2'b11,high_l2_set3_encod[3:0]};
  default :  high_l3_set0_encod[5:0] = {6{1'bx}};
  endcase
// &CombEnd; @241
end

   
//----------------------------------------------------------
//                  low 44-bit lza encoder
//----------------------------------------------------------
//first level : 44:11 compressor , 11 4:2 lza_compressor
// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_21"); @248
ct_vfmau_lza_42  x_ct_vfmau_lza_42_21 (
  .lza_p0            (low_l1_encod[0]  ),
  .lza_p1            (low_l1_encod[1]  ),
  .lza_precod        (lza_precod[43:40]),
  .lza_vld           (low_l1_vld[10]   )
);

// &Connect(.lza_precod     (lza_precod[43:40]  ), @249
//          .lza_vld        (low_l1_vld[10]     ), @250
//          .lza_p0         (low_l1_encod[0]   ), @251
//          .lza_p1         (low_l1_encod[1]   )); @252

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_22"); @254
ct_vfmau_lza_42  x_ct_vfmau_lza_42_22 (
  .lza_p0            (low_l1_encod[2]  ),
  .lza_p1            (low_l1_encod[3]  ),
  .lza_precod        (lza_precod[39:36]),
  .lza_vld           (low_l1_vld[9]    )
);

// &Connect(.lza_precod     (lza_precod[39:36]  ), @255
//          .lza_vld        (low_l1_vld[9]     ), @256
//          .lza_p0         (low_l1_encod[2]   ), @257
//          .lza_p1         (low_l1_encod[3]   )); @258

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_23"); @260
ct_vfmau_lza_42  x_ct_vfmau_lza_42_23 (
  .lza_p0            (low_l1_encod[4]  ),
  .lza_p1            (low_l1_encod[5]  ),
  .lza_precod        (lza_precod[35:32]),
  .lza_vld           (low_l1_vld[8]    )
);

// &Connect(.lza_precod     (lza_precod[35:32]  ), @261
//          .lza_vld        (low_l1_vld[8]     ), @262
//          .lza_p0         (low_l1_encod[4]   ), @263
//          .lza_p1         (low_l1_encod[5]   )); @264

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_24"); @266
ct_vfmau_lza_42  x_ct_vfmau_lza_42_24 (
  .lza_p0            (low_l1_encod[6]  ),
  .lza_p1            (low_l1_encod[7]  ),
  .lza_precod        (lza_precod[31:28]),
  .lza_vld           (low_l1_vld[7]    )
);

// &Connect(.lza_precod     (lza_precod[31:28]  ), @267
//          .lza_vld        (low_l1_vld[7]     ), @268
//          .lza_p0         (low_l1_encod[6]   ), @269
//          .lza_p1         (low_l1_encod[7]   )); @270

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_25"); @272
ct_vfmau_lza_42  x_ct_vfmau_lza_42_25 (
  .lza_p0            (low_l1_encod[8]  ),
  .lza_p1            (low_l1_encod[9]  ),
  .lza_precod        (lza_precod[27:24]),
  .lza_vld           (low_l1_vld[6]    )
);

// &Connect(.lza_precod     (lza_precod[27:24]  ), @273
//          .lza_vld        (low_l1_vld[6]     ), @274
//          .lza_p0         (low_l1_encod[8]   ), @275
//          .lza_p1         (low_l1_encod[9]   )); @276

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_26"); @278
ct_vfmau_lza_42  x_ct_vfmau_lza_42_26 (
  .lza_p0            (low_l1_encod[10] ),
  .lza_p1            (low_l1_encod[11] ),
  .lza_precod        (lza_precod[23:20]),
  .lza_vld           (low_l1_vld[5]    )
);

// &Connect(.lza_precod     (lza_precod[23:20]  ), @279
//          .lza_vld        (low_l1_vld[5]     ), @280
//          .lza_p0         (low_l1_encod[10]  ), @281
//          .lza_p1         (low_l1_encod[11]  )); @282

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_27"); @284
ct_vfmau_lza_42  x_ct_vfmau_lza_42_27 (
  .lza_p0            (low_l1_encod[12] ),
  .lza_p1            (low_l1_encod[13] ),
  .lza_precod        (lza_precod[19:16]),
  .lza_vld           (low_l1_vld[4]    )
);

// &Connect(.lza_precod     (lza_precod[19:16]  ), @285
//          .lza_vld        (low_l1_vld[4]     ), @286
//          .lza_p0         (low_l1_encod[12]  ), @287
//          .lza_p1         (low_l1_encod[13]  )); @288

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_28"); @290
ct_vfmau_lza_42  x_ct_vfmau_lza_42_28 (
  .lza_p0            (low_l1_encod[14] ),
  .lza_p1            (low_l1_encod[15] ),
  .lza_precod        (lza_precod[15:12]),
  .lza_vld           (low_l1_vld[3]    )
);

// &Connect(.lza_precod     (lza_precod[15:12]  ), @291
//          .lza_vld        (low_l1_vld[3]     ), @292
//          .lza_p0         (low_l1_encod[14]  ), @293
//          .lza_p1         (low_l1_encod[15]  )); @294

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_29"); @296
ct_vfmau_lza_42  x_ct_vfmau_lza_42_29 (
  .lza_p0           (low_l1_encod[16]),
  .lza_p1           (low_l1_encod[17]),
  .lza_precod       (lza_precod[11:8]),
  .lza_vld          (low_l1_vld[2]   )
);

// &Connect(.lza_precod     (lza_precod[11:8]  ), @297
//          .lza_vld        (low_l1_vld[2]     ), @298
//          .lza_p0         (low_l1_encod[16]  ), @299
//          .lza_p1         (low_l1_encod[17]  )); @300

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_30"); @302
ct_vfmau_lza_42  x_ct_vfmau_lza_42_30 (
  .lza_p0           (low_l1_encod[18]),
  .lza_p1           (low_l1_encod[19]),
  .lza_precod       (lza_precod[7:4] ),
  .lza_vld          (low_l1_vld[1]   )
);

// &Connect(.lza_precod     (lza_precod[7:4]), @303
//          .lza_vld        (low_l1_vld[1]     ), @304
//          .lza_p0         (low_l1_encod[18]  ), @305
//          .lza_p1         (low_l1_encod[19]  )); @306

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_31"); @308
ct_vfmau_lza_42  x_ct_vfmau_lza_42_31 (
  .lza_p0           (low_l1_encod[20]),
  .lza_p1           (low_l1_encod[21]),
  .lza_precod       (lza_precod[3:0] ),
  .lza_vld          (low_l1_vld[0]   )
);

// &Connect(.lza_precod     (lza_precod[3:0]), @309
//          .lza_vld        (low_l1_vld[0]    ), @310
//          .lza_p0         (low_l1_encod[20]  ), @311
//          .lza_p1         (low_l1_encod[21]  )); @312


//second level : 11:3 compressor , 2 4:2 lza_compressor,1 3:2 lza_compressor
// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_32"); @316
ct_vfmau_lza_42  x_ct_vfmau_lza_42_32 (
  .lza_p0           (low_l2_encod[0] ),
  .lza_p1           (low_l2_encod[1] ),
  .lza_precod       (low_l1_vld[10:7]),
  .lza_vld          (low_l2_vld[2]   )
);

// &Connect(.lza_precod     (low_l1_vld[10:7]  ), @317
//          .lza_vld        (low_l2_vld[2]    ), @318
//          .lza_p0         (low_l2_encod[0]  ), @319
//          .lza_p1         (low_l2_encod[1]  )); @320

// &Instance("ct_vfmau_lza_42","x_ct_vfmau_lza_42_33"); @322
ct_vfmau_lza_42  x_ct_vfmau_lza_42_33 (
  .lza_p0          (low_l2_encod[2]),
  .lza_p1          (low_l2_encod[3]),
  .lza_precod      (low_l1_vld[6:3]),
  .lza_vld         (low_l2_vld[1]  )
);

// &Connect(.lza_precod     (low_l1_vld[6:3]  ), @323
//          .lza_vld        (low_l2_vld[1]    ), @324
//          .lza_p0         (low_l2_encod[2]  ), @325
//          .lza_p1         (low_l2_encod[3]  )); @326

// &Instance("ct_vfmau_lza_32","x_ct_vfmau_lza_32_0"); @328
ct_vfmau_lza_32  x_ct_vfmau_lza_32_0 (
  .lza_p0          (low_l2_encod[4]),
  .lza_p1          (low_l2_encod[5]),
  .lza_precod      (low_l1_vld[2:0]),
  .lza_vld         (low_l2_vld[0]  )
);

// &Connect(.lza_precod     (low_l1_vld[2:0] ), @329
//          .lza_vld        (low_l2_vld[0]    ), @330
//          .lza_p0         (low_l2_encod[4]  ), @331
//          .lza_p1         (low_l2_encod[5]  )); @332

// &CombBeg; @334
always @( low_l1_encod[1:0]
       or low_l2_encod[1:0]
       or low_l1_encod[7:2])
begin
case(low_l2_encod[1:0])
  2'b00   :  low_l2_set0_encod[3:0] = {2'b00,low_l1_encod[1:0]};
  2'b01   :  low_l2_set0_encod[3:0] = {2'b01,low_l1_encod[3:2]};
  2'b10   :  low_l2_set0_encod[3:0] = {2'b10,low_l1_encod[5:4]};
  2'b11   :  low_l2_set0_encod[3:0] = {2'b11,low_l1_encod[7:6]};
  default :  low_l2_set0_encod[3:0] = {4{1'bx}};
  endcase
// &CombEnd; @342
end

// &CombBeg; @344
always @( low_l2_encod[3:2]
       or low_l1_encod[15:8])
begin
case(low_l2_encod[3:2])
  2'b00   :  low_l2_set1_encod[3:0] = {2'b00,low_l1_encod[9:8]};
  2'b01   :  low_l2_set1_encod[3:0] = {2'b01,low_l1_encod[11:10]};
  2'b10   :  low_l2_set1_encod[3:0] = {2'b10,low_l1_encod[13:12]};
  2'b11   :  low_l2_set1_encod[3:0] = {2'b11,low_l1_encod[15:14]};
  default :  low_l2_set1_encod[3:0] = {4{1'bx}};
  endcase
// &CombEnd; @352
end

// &CombBeg; @354
always @( low_l2_encod[5:4]
       or low_l1_encod[21:16])
begin
case(low_l2_encod[5:4])
  2'b00   :  low_l2_set2_encod[3:0] = {2'b00,low_l1_encod[17:16]};
  2'b01   :  low_l2_set2_encod[3:0] = {2'b01,low_l1_encod[19:18]};
  2'b10   :  low_l2_set2_encod[3:0] = {2'b10,low_l1_encod[21:20]};
  default :  low_l2_set2_encod[3:0] = {4{1'bx}};
  endcase
// &CombEnd; @361
end

//third level : 3:1 compressor , 1 3:2 lza_compressor
// &Instance("ct_vfmau_lza_32","x_ct_vfmau_lza_32_1"); @364
ct_vfmau_lza_32  x_ct_vfmau_lza_32_1 (
  .lza_p0          (low_l3_encod[0]),
  .lza_p1          (low_l3_encod[1]),
  .lza_precod      (low_l2_vld[2:0]),
  .lza_vld         (low_l3_vld     )
);

// &Connect(.lza_precod     (low_l2_vld[2:0]), @365
//          .lza_vld        (low_l3_vld    ), @366
//          .lza_p0         (low_l3_encod[0]  ), @367
//          .lza_p1         (low_l3_encod[1]  )); @368

// &CombBeg; @370
always @( low_l3_encod[1:0]
       or low_l2_set2_encod[3:0]
       or low_l2_set1_encod[3:0]
       or low_l2_set0_encod[3:0])
begin
case(low_l3_encod[1:0])
  2'b00   :  low_l3_set0_encod[5:0] = {2'b00,low_l2_set0_encod[3:0]};
  2'b01   :  low_l3_set0_encod[5:0] = {2'b01,low_l2_set1_encod[3:0]};
  2'b10   :  low_l3_set0_encod[5:0] = {2'b10,low_l2_set2_encod[3:0]};
  default :  low_l3_set0_encod[5:0] = 6'b0;
  endcase
// &CombEnd; @377
end

//----------------------------------------------------------
//                  108-bit lza encoder result 
//----------------------------------------------------------
assign lza_l4_encod[6:0] = (high_l3_vld)
                           ? {1'b0,high_l3_set0_encod[5:0]}
                           : {1'b1,low_l3_set0_encod[5:0]};
assign lza_result_vld  = high_l3_vld || low_l3_vld;
assign lza_result[6:0] = (lza_result_vld)
                       ? lza_l4_encod[6:0]
                       : 7'd108;

// &ModuleEnd; @390
endmodule




