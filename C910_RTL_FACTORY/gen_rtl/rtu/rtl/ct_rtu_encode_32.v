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
module ct_rtu_encode_32(
  x_num,
  x_num_expand
);

// &Ports; @25
input   [31:0]  x_num_expand; 
output  [4 :0]  x_num;       

// &Regs; @26

// &Wires; @27
wire    [4 :0]  x_num;       
wire    [31:0]  x_num_expand; 


//==========================================================
//  encode 32 bits one-hot number to 5 bits binary number
//==========================================================
assign x_num[4:0] =
           {5{x_num_expand[0]}}  & 5'd0
         | {5{x_num_expand[1]}}  & 5'd1
         | {5{x_num_expand[2]}}  & 5'd2
         | {5{x_num_expand[3]}}  & 5'd3
         | {5{x_num_expand[4]}}  & 5'd4
         | {5{x_num_expand[5]}}  & 5'd5
         | {5{x_num_expand[6]}}  & 5'd6
         | {5{x_num_expand[7]}}  & 5'd7
         | {5{x_num_expand[8]}}  & 5'd8
         | {5{x_num_expand[9]}}  & 5'd9
         | {5{x_num_expand[10]}} & 5'd10
         | {5{x_num_expand[11]}} & 5'd11
         | {5{x_num_expand[12]}} & 5'd12
         | {5{x_num_expand[13]}} & 5'd13
         | {5{x_num_expand[14]}} & 5'd14
         | {5{x_num_expand[15]}} & 5'd15
         | {5{x_num_expand[16]}} & 5'd16
         | {5{x_num_expand[17]}} & 5'd17
         | {5{x_num_expand[18]}} & 5'd18
         | {5{x_num_expand[19]}} & 5'd19
         | {5{x_num_expand[20]}} & 5'd20
         | {5{x_num_expand[21]}} & 5'd21
         | {5{x_num_expand[22]}} & 5'd22
         | {5{x_num_expand[23]}} & 5'd23
         | {5{x_num_expand[24]}} & 5'd24
         | {5{x_num_expand[25]}} & 5'd25
         | {5{x_num_expand[26]}} & 5'd26
         | {5{x_num_expand[27]}} & 5'd27
         | {5{x_num_expand[28]}} & 5'd28
         | {5{x_num_expand[29]}} & 5'd29
         | {5{x_num_expand[30]}} & 5'd30
         | {5{x_num_expand[31]}} & 5'd31;

// &ModuleEnd; @66
endmodule


