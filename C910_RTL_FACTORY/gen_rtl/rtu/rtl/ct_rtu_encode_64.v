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
module ct_rtu_encode_64(
  x_num,
  x_num_expand
);

// &Ports; @25
input   [63:0]  x_num_expand; 
output  [5 :0]  x_num;       

// &Regs; @26

// &Wires; @27
wire    [5 :0]  x_num;       
wire    [63:0]  x_num_expand; 


//==========================================================
//  encode 64 bits one-hot number to 6 bits binary number
//==========================================================
assign x_num[5:0] =
           {6{x_num_expand[0]}}  & 6'd0
         | {6{x_num_expand[1]}}  & 6'd1
         | {6{x_num_expand[2]}}  & 6'd2
         | {6{x_num_expand[3]}}  & 6'd3
         | {6{x_num_expand[4]}}  & 6'd4
         | {6{x_num_expand[5]}}  & 6'd5
         | {6{x_num_expand[6]}}  & 6'd6
         | {6{x_num_expand[7]}}  & 6'd7
         | {6{x_num_expand[8]}}  & 6'd8
         | {6{x_num_expand[9]}}  & 6'd9
         | {6{x_num_expand[10]}} & 6'd10
         | {6{x_num_expand[11]}} & 6'd11
         | {6{x_num_expand[12]}} & 6'd12
         | {6{x_num_expand[13]}} & 6'd13
         | {6{x_num_expand[14]}} & 6'd14
         | {6{x_num_expand[15]}} & 6'd15
         | {6{x_num_expand[16]}} & 6'd16
         | {6{x_num_expand[17]}} & 6'd17
         | {6{x_num_expand[18]}} & 6'd18
         | {6{x_num_expand[19]}} & 6'd19
         | {6{x_num_expand[20]}} & 6'd20
         | {6{x_num_expand[21]}} & 6'd21
         | {6{x_num_expand[22]}} & 6'd22
         | {6{x_num_expand[23]}} & 6'd23
         | {6{x_num_expand[24]}} & 6'd24
         | {6{x_num_expand[25]}} & 6'd25
         | {6{x_num_expand[26]}} & 6'd26
         | {6{x_num_expand[27]}} & 6'd27
         | {6{x_num_expand[28]}} & 6'd28
         | {6{x_num_expand[29]}} & 6'd29
         | {6{x_num_expand[30]}} & 6'd30
         | {6{x_num_expand[31]}} & 6'd31
         | {6{x_num_expand[32]}} & 6'd32
         | {6{x_num_expand[33]}} & 6'd33
         | {6{x_num_expand[34]}} & 6'd34
         | {6{x_num_expand[35]}} & 6'd35
         | {6{x_num_expand[36]}} & 6'd36
         | {6{x_num_expand[37]}} & 6'd37
         | {6{x_num_expand[38]}} & 6'd38
         | {6{x_num_expand[39]}} & 6'd39
         | {6{x_num_expand[40]}} & 6'd40
         | {6{x_num_expand[41]}} & 6'd41
         | {6{x_num_expand[42]}} & 6'd42
         | {6{x_num_expand[43]}} & 6'd43
         | {6{x_num_expand[44]}} & 6'd44
         | {6{x_num_expand[45]}} & 6'd45
         | {6{x_num_expand[46]}} & 6'd46
         | {6{x_num_expand[47]}} & 6'd47
         | {6{x_num_expand[48]}} & 6'd48
         | {6{x_num_expand[49]}} & 6'd49
         | {6{x_num_expand[50]}} & 6'd50
         | {6{x_num_expand[51]}} & 6'd51
         | {6{x_num_expand[52]}} & 6'd52
         | {6{x_num_expand[53]}} & 6'd53
         | {6{x_num_expand[54]}} & 6'd54
         | {6{x_num_expand[55]}} & 6'd55
         | {6{x_num_expand[56]}} & 6'd56
         | {6{x_num_expand[57]}} & 6'd57
         | {6{x_num_expand[58]}} & 6'd58
         | {6{x_num_expand[59]}} & 6'd59
         | {6{x_num_expand[60]}} & 6'd60
         | {6{x_num_expand[61]}} & 6'd61
         | {6{x_num_expand[62]}} & 6'd62
         | {6{x_num_expand[63]}} & 6'd63;

// &ModuleEnd; @98
endmodule


