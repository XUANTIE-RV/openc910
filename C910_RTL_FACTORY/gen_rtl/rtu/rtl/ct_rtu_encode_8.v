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
module ct_rtu_encode_8(
  x_num,
  x_num_expand
);

// &Ports; @25
input   [7:0]  x_num_expand; 
output  [2:0]  x_num;       

// &Regs; @26

// &Wires; @27
wire    [2:0]  x_num;       
wire    [7:0]  x_num_expand; 


//==========================================================
//  encode 8 bits one-hot number to 3 bits binary number
//==========================================================
assign x_num[2:0] =
           {3{x_num_expand[0]}} & 3'd0
         | {3{x_num_expand[1]}} & 3'd1
         | {3{x_num_expand[2]}} & 3'd2
         | {3{x_num_expand[3]}} & 3'd3
         | {3{x_num_expand[4]}} & 3'd4
         | {3{x_num_expand[5]}} & 3'd5
         | {3{x_num_expand[6]}} & 3'd6
         | {3{x_num_expand[7]}} & 3'd7;

// &ModuleEnd; @42
endmodule


