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

// &ModuleBeg; @24
module ct_rtu_encode_96(
  x_num,
  x_num_expand
);

// &Ports; @25
input   [95:0]  x_num_expand; 
output  [6 :0]  x_num;       

// &Regs; @26

// &Wires; @27
wire    [6 :0]  x_num;       
wire    [95:0]  x_num_expand; 


//==========================================================
//  encode 96 bits one-hot number to 7 bits binary number
//==========================================================
assign x_num[6:0] =
           {7{x_num_expand[0]}}  & 7'd0
         | {7{x_num_expand[1]}}  & 7'd1
         | {7{x_num_expand[2]}}  & 7'd2
         | {7{x_num_expand[3]}}  & 7'd3
         | {7{x_num_expand[4]}}  & 7'd4
         | {7{x_num_expand[5]}}  & 7'd5
         | {7{x_num_expand[6]}}  & 7'd6
         | {7{x_num_expand[7]}}  & 7'd7
         | {7{x_num_expand[8]}}  & 7'd8
         | {7{x_num_expand[9]}}  & 7'd9
         | {7{x_num_expand[10]}} & 7'd10
         | {7{x_num_expand[11]}} & 7'd11
         | {7{x_num_expand[12]}} & 7'd12
         | {7{x_num_expand[13]}} & 7'd13
         | {7{x_num_expand[14]}} & 7'd14
         | {7{x_num_expand[15]}} & 7'd15
         | {7{x_num_expand[16]}} & 7'd16
         | {7{x_num_expand[17]}} & 7'd17
         | {7{x_num_expand[18]}} & 7'd18
         | {7{x_num_expand[19]}} & 7'd19
         | {7{x_num_expand[20]}} & 7'd20
         | {7{x_num_expand[21]}} & 7'd21
         | {7{x_num_expand[22]}} & 7'd22
         | {7{x_num_expand[23]}} & 7'd23
         | {7{x_num_expand[24]}} & 7'd24
         | {7{x_num_expand[25]}} & 7'd25
         | {7{x_num_expand[26]}} & 7'd26
         | {7{x_num_expand[27]}} & 7'd27
         | {7{x_num_expand[28]}} & 7'd28
         | {7{x_num_expand[29]}} & 7'd29
         | {7{x_num_expand[30]}} & 7'd30
         | {7{x_num_expand[31]}} & 7'd31
         | {7{x_num_expand[32]}} & 7'd32
         | {7{x_num_expand[33]}} & 7'd33
         | {7{x_num_expand[34]}} & 7'd34
         | {7{x_num_expand[35]}} & 7'd35
         | {7{x_num_expand[36]}} & 7'd36
         | {7{x_num_expand[37]}} & 7'd37
         | {7{x_num_expand[38]}} & 7'd38
         | {7{x_num_expand[39]}} & 7'd39
         | {7{x_num_expand[40]}} & 7'd40
         | {7{x_num_expand[41]}} & 7'd41
         | {7{x_num_expand[42]}} & 7'd42
         | {7{x_num_expand[43]}} & 7'd43
         | {7{x_num_expand[44]}} & 7'd44
         | {7{x_num_expand[45]}} & 7'd45
         | {7{x_num_expand[46]}} & 7'd46
         | {7{x_num_expand[47]}} & 7'd47
         | {7{x_num_expand[48]}} & 7'd48
         | {7{x_num_expand[49]}} & 7'd49
         | {7{x_num_expand[50]}} & 7'd50
         | {7{x_num_expand[51]}} & 7'd51
         | {7{x_num_expand[52]}} & 7'd52
         | {7{x_num_expand[53]}} & 7'd53
         | {7{x_num_expand[54]}} & 7'd54
         | {7{x_num_expand[55]}} & 7'd55
         | {7{x_num_expand[56]}} & 7'd56
         | {7{x_num_expand[57]}} & 7'd57
         | {7{x_num_expand[58]}} & 7'd58
         | {7{x_num_expand[59]}} & 7'd59
         | {7{x_num_expand[60]}} & 7'd60
         | {7{x_num_expand[61]}} & 7'd61
         | {7{x_num_expand[62]}} & 7'd62
         | {7{x_num_expand[63]}} & 7'd63
         | {7{x_num_expand[64]}} & 7'd64
         | {7{x_num_expand[65]}} & 7'd65
         | {7{x_num_expand[66]}} & 7'd66
         | {7{x_num_expand[67]}} & 7'd67
         | {7{x_num_expand[68]}} & 7'd68
         | {7{x_num_expand[69]}} & 7'd69
         | {7{x_num_expand[70]}} & 7'd70
         | {7{x_num_expand[71]}} & 7'd71
         | {7{x_num_expand[72]}} & 7'd72
         | {7{x_num_expand[73]}} & 7'd73
         | {7{x_num_expand[74]}} & 7'd74
         | {7{x_num_expand[75]}} & 7'd75
         | {7{x_num_expand[76]}} & 7'd76
         | {7{x_num_expand[77]}} & 7'd77
         | {7{x_num_expand[78]}} & 7'd78
         | {7{x_num_expand[79]}} & 7'd79
         | {7{x_num_expand[80]}} & 7'd80
         | {7{x_num_expand[81]}} & 7'd81
         | {7{x_num_expand[82]}} & 7'd82
         | {7{x_num_expand[83]}} & 7'd83
         | {7{x_num_expand[84]}} & 7'd84
         | {7{x_num_expand[85]}} & 7'd85
         | {7{x_num_expand[86]}} & 7'd86
         | {7{x_num_expand[87]}} & 7'd87
         | {7{x_num_expand[88]}} & 7'd88
         | {7{x_num_expand[89]}} & 7'd89
         | {7{x_num_expand[90]}} & 7'd90
         | {7{x_num_expand[91]}} & 7'd91
         | {7{x_num_expand[92]}} & 7'd92
         | {7{x_num_expand[93]}} & 7'd93
         | {7{x_num_expand[94]}} & 7'd94
         | {7{x_num_expand[95]}} & 7'd95;

// &ModuleEnd; @130
endmodule


