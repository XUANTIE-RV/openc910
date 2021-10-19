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
module ct_idu_rf_prf_vregfile(
  dp_prf_rf_pipe5_srcv0_vreg,
  dp_prf_rf_pipe6_srcv0_vreg,
  dp_prf_rf_pipe6_srcv1_vreg,
  dp_prf_rf_pipe6_srcv2_vreg,
  dp_prf_rf_pipe6_srcvm_vreg,
  dp_prf_rf_pipe7_srcv0_vreg,
  dp_prf_rf_pipe7_srcv1_vreg,
  dp_prf_rf_pipe7_srcv2_vreg,
  dp_prf_rf_pipe7_srcvm_vreg,
  lsu_idu_wb_pipe3_wb_vreg_data,
  lsu_idu_wb_pipe3_wb_vreg_expand,
  lsu_idu_wb_pipe3_wb_vreg_vld,
  prf_dp_rf_pipe5_srcv0_vreg_data,
  prf_dp_rf_pipe6_srcv0_vreg_data,
  prf_dp_rf_pipe6_srcv1_vreg_data,
  prf_dp_rf_pipe6_srcv2_vreg_data,
  prf_dp_rf_pipe6_srcvm_vreg_data,
  prf_dp_rf_pipe7_srcv0_vreg_data,
  prf_dp_rf_pipe7_srcv1_vreg_data,
  prf_dp_rf_pipe7_srcv2_vreg_data,
  prf_dp_rf_pipe7_srcvm_vreg_data,
  vfpu_idu_ex5_pipe6_wb_vreg_data,
  vfpu_idu_ex5_pipe6_wb_vreg_expand,
  vfpu_idu_ex5_pipe6_wb_vreg_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_data,
  vfpu_idu_ex5_pipe7_wb_vreg_expand,
  vfpu_idu_ex5_pipe7_wb_vreg_vld
);

// &Ports; @26
input   [5 :0]  dp_prf_rf_pipe5_srcv0_vreg;     
input   [5 :0]  dp_prf_rf_pipe6_srcv0_vreg;     
input   [5 :0]  dp_prf_rf_pipe6_srcv1_vreg;     
input   [5 :0]  dp_prf_rf_pipe6_srcv2_vreg;     
input   [5 :0]  dp_prf_rf_pipe6_srcvm_vreg;     
input   [5 :0]  dp_prf_rf_pipe7_srcv0_vreg;     
input   [5 :0]  dp_prf_rf_pipe7_srcv1_vreg;     
input   [5 :0]  dp_prf_rf_pipe7_srcv2_vreg;     
input   [5 :0]  dp_prf_rf_pipe7_srcvm_vreg;     
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_data;  
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_expand; 
input           lsu_idu_wb_pipe3_wb_vreg_vld;   
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_data; 
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_expand; 
input           vfpu_idu_ex5_pipe6_wb_vreg_vld; 
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_data; 
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_expand; 
input           vfpu_idu_ex5_pipe7_wb_vreg_vld; 
output  [63:0]  prf_dp_rf_pipe5_srcv0_vreg_data; 
output  [63:0]  prf_dp_rf_pipe6_srcv0_vreg_data; 
output  [63:0]  prf_dp_rf_pipe6_srcv1_vreg_data; 
output  [63:0]  prf_dp_rf_pipe6_srcv2_vreg_data; 
output  [63:0]  prf_dp_rf_pipe6_srcvm_vreg_data; 
output  [63:0]  prf_dp_rf_pipe7_srcv0_vreg_data; 
output  [63:0]  prf_dp_rf_pipe7_srcv1_vreg_data; 
output  [63:0]  prf_dp_rf_pipe7_srcv2_vreg_data; 
output  [63:0]  prf_dp_rf_pipe7_srcvm_vreg_data; 

// &Regs; @27

// &Wires; @28
wire    [63:0]  prf_dp_rf_pipe5_srcv0_vreg_data; 
wire    [63:0]  prf_dp_rf_pipe6_srcv0_vreg_data; 
wire    [63:0]  prf_dp_rf_pipe6_srcv1_vreg_data; 
wire    [63:0]  prf_dp_rf_pipe6_srcv2_vreg_data; 
wire    [63:0]  prf_dp_rf_pipe6_srcvm_vreg_data; 
wire    [63:0]  prf_dp_rf_pipe7_srcv0_vreg_data; 
wire    [63:0]  prf_dp_rf_pipe7_srcv1_vreg_data; 
wire    [63:0]  prf_dp_rf_pipe7_srcv2_vreg_data; 
wire    [63:0]  prf_dp_rf_pipe7_srcvm_vreg_data; 



// &Instance("gated_clk_cell", "x_vreg_gated_clk"); @38
// &Connect(.clk_in      (forever_cpuclk), @39
//          .external_en (1'b0), @40
//          .global_en   (cp0_yy_clk_en), @41
//          .module_en   (cp0_idu_icg_en), @42
//          .local_en    (vreg_clk_en), @43
//          .clk_out     (vreg_top_clk)); @44
// &ConnRule(s/^x_/vreg0_/); @49
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg0"); @50
// &ConnRule(s/^x_/vreg1_/); @51
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg1"); @52
// &ConnRule(s/^x_/vreg2_/); @53
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg2"); @54
// &ConnRule(s/^x_/vreg3_/); @55
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg3"); @56
// &ConnRule(s/^x_/vreg4_/); @57
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg4"); @58
// &ConnRule(s/^x_/vreg5_/); @59
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg5"); @60
// &ConnRule(s/^x_/vreg6_/); @61
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg6"); @62
// &ConnRule(s/^x_/vreg7_/); @63
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg7"); @64
// &ConnRule(s/^x_/vreg8_/); @65
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg8"); @66
// &ConnRule(s/^x_/vreg9_/); @67
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg9"); @68
// &ConnRule(s/^x_/vreg10_/); @69
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg10"); @70
// &ConnRule(s/^x_/vreg11_/); @71
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg11"); @72
// &ConnRule(s/^x_/vreg12_/); @73
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg12"); @74
// &ConnRule(s/^x_/vreg13_/); @75
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg13"); @76
// &ConnRule(s/^x_/vreg14_/); @77
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg14"); @78
// &ConnRule(s/^x_/vreg15_/); @79
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg15"); @80
// &ConnRule(s/^x_/vreg16_/); @81
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg16"); @82
// &ConnRule(s/^x_/vreg17_/); @83
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg17"); @84
// &ConnRule(s/^x_/vreg18_/); @85
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg18"); @86
// &ConnRule(s/^x_/vreg19_/); @87
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg19"); @88
// &ConnRule(s/^x_/vreg20_/); @89
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg20"); @90
// &ConnRule(s/^x_/vreg21_/); @91
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg21"); @92
// &ConnRule(s/^x_/vreg22_/); @93
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg22"); @94
// &ConnRule(s/^x_/vreg23_/); @95
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg23"); @96
// &ConnRule(s/^x_/vreg24_/); @97
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg24"); @98
// &ConnRule(s/^x_/vreg25_/); @99
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg25"); @100
// &ConnRule(s/^x_/vreg26_/); @101
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg26"); @102
// &ConnRule(s/^x_/vreg27_/); @103
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg27"); @104
// &ConnRule(s/^x_/vreg28_/); @105
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg28"); @106
// &ConnRule(s/^x_/vreg29_/); @107
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg29"); @108
// &ConnRule(s/^x_/vreg30_/); @109
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg30"); @110
// &ConnRule(s/^x_/vreg31_/); @111
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg31"); @112
// &ConnRule(s/^x_/vreg32_/); @113
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg32"); @114
// &ConnRule(s/^x_/vreg33_/); @115
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg33"); @116
// &ConnRule(s/^x_/vreg34_/); @117
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg34"); @118
// &ConnRule(s/^x_/vreg35_/); @119
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg35"); @120
// &ConnRule(s/^x_/vreg36_/); @121
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg36"); @122
// &ConnRule(s/^x_/vreg37_/); @123
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg37"); @124
// &ConnRule(s/^x_/vreg38_/); @125
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg38"); @126
// &ConnRule(s/^x_/vreg39_/); @127
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg39"); @128
// &ConnRule(s/^x_/vreg40_/); @129
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg40"); @130
// &ConnRule(s/^x_/vreg41_/); @131
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg41"); @132
// &ConnRule(s/^x_/vreg42_/); @133
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg42"); @134
// &ConnRule(s/^x_/vreg43_/); @135
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg43"); @136
// &ConnRule(s/^x_/vreg44_/); @137
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg44"); @138
// &ConnRule(s/^x_/vreg45_/); @139
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg45"); @140
// &ConnRule(s/^x_/vreg46_/); @141
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg46"); @142
// &ConnRule(s/^x_/vreg47_/); @143
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg47"); @144
// &ConnRule(s/^x_/vreg48_/); @145
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg48"); @146
// &ConnRule(s/^x_/vreg49_/); @147
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg49"); @148
// &ConnRule(s/^x_/vreg50_/); @149
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg50"); @150
// &ConnRule(s/^x_/vreg51_/); @151
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg51"); @152
// &ConnRule(s/^x_/vreg52_/); @153
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg52"); @154
// &ConnRule(s/^x_/vreg53_/); @155
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg53"); @156
// &ConnRule(s/^x_/vreg54_/); @157
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg54"); @158
// &ConnRule(s/^x_/vreg55_/); @159
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg55"); @160
// &ConnRule(s/^x_/vreg56_/); @161
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg56"); @162
// &ConnRule(s/^x_/vreg57_/); @163
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg57"); @164
// &ConnRule(s/^x_/vreg58_/); @165
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg58"); @166
// &ConnRule(s/^x_/vreg59_/); @167
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg59"); @168
// &ConnRule(s/^x_/vreg60_/); @169
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg60"); @170
// &ConnRule(s/^x_/vreg61_/); @171
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg61"); @172
// &ConnRule(s/^x_/vreg62_/); @173
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg62"); @174
// &ConnRule(s/^x_/vreg63_/); @175
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg63"); @176
// &CombBeg; @260
// &CombEnd; @328
// &CombBeg; @333
// &CombEnd; @401
// &CombBeg; @406
// &CombEnd; @474
// &CombBeg; @479
// &CombEnd; @547
// &CombBeg; @552
// &CombEnd; @620
// &CombBeg; @625
// &CombEnd; @693
// &CombBeg; @698
// &CombEnd; @766
// &CombBeg; @771
// &CombEnd; @839
// &CombBeg; @844
// &CombEnd; @912
// &Force("bus","dp_prf_rf_pipe5_srcv0_vreg",5,0); @915
// &Force("bus","dp_prf_rf_pipe6_srcv0_vreg",5,0); @916
// &Force("bus","dp_prf_rf_pipe6_srcv1_vreg",5,0); @917
// &Force("bus","dp_prf_rf_pipe6_srcv2_vreg",5,0); @918
// &Force("bus","dp_prf_rf_pipe6_srcvm_vreg",5,0); @919
// &Force("bus","dp_prf_rf_pipe7_srcv0_vreg",5,0); @920
// &Force("bus","dp_prf_rf_pipe7_srcv1_vreg",5,0); @921
// &Force("bus","dp_prf_rf_pipe7_srcv2_vreg",5,0); @922
// &Force("bus","dp_prf_rf_pipe7_srcvm_vreg",5,0); @923
// &Force("bus","lsu_idu_wb_pipe3_wb_vreg_data",63,0); @924
// &Force("bus","lsu_idu_wb_pipe3_wb_vreg_expand",63,0); @925
// &Force("bus","vfpu_idu_ex5_pipe6_wb_vreg_data",63,0); @926
// &Force("bus","vfpu_idu_ex5_pipe6_wb_vreg_expand",63,0); @927
// &Force("bus","vfpu_idu_ex5_pipe7_wb_vreg_data",63,0); @928
// &Force("bus","vfpu_idu_ex5_pipe7_wb_vreg_expand",63,0); @929

// &Force("input","dp_prf_rf_pipe5_srcv0_vreg"); @931
// &Force("input","dp_prf_rf_pipe6_srcv0_vreg"); @932
// &Force("input","dp_prf_rf_pipe6_srcv1_vreg"); @933
// &Force("input","dp_prf_rf_pipe6_srcv2_vreg"); @934
// &Force("input","dp_prf_rf_pipe6_srcvm_vreg"); @935
// &Force("input","dp_prf_rf_pipe7_srcv0_vreg"); @936
// &Force("input","dp_prf_rf_pipe7_srcv1_vreg"); @937
// &Force("input","dp_prf_rf_pipe7_srcv2_vreg"); @938
// &Force("input","dp_prf_rf_pipe7_srcvm_vreg"); @939
// &Force("input","lsu_idu_wb_pipe3_wb_vreg_data"); @940
// &Force("input","lsu_idu_wb_pipe3_wb_vreg_vld"); @941
// &Force("input","lsu_idu_wb_pipe3_wb_vreg_expand"); @942
// &Force("input","vfpu_idu_ex5_pipe6_wb_vreg_data"); @943
// &Force("input","vfpu_idu_ex5_pipe6_wb_vreg_vld"); @944
// &Force("input","vfpu_idu_ex5_pipe6_wb_vreg_expand"); @945
// &Force("input","vfpu_idu_ex5_pipe7_wb_vreg_data"); @946
// &Force("input","vfpu_idu_ex5_pipe7_wb_vreg_vld"); @947
// &Force("input","vfpu_idu_ex5_pipe7_wb_vreg_expand"); @948

assign prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = 64'b0;
assign prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = 64'b0;
assign prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = 64'b0;
assign prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = 64'b0;
assign prf_dp_rf_pipe6_srcvm_vreg_data[63:0] = 64'b0;
assign prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = 64'b0;
assign prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = 64'b0;
assign prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = 64'b0;
assign prf_dp_rf_pipe7_srcvm_vreg_data[63:0] = 64'b0;


// &ModuleEnd; @962
endmodule


