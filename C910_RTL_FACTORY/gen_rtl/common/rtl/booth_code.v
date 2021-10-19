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

//================================================================
// Booth Code
//================================================================

module booth_code(
A,       // mulitplicand
code,    // booth code
product, // partial product
h,      
sn       // partial_sign
);
parameter B_SIZE = 53;

input  [B_SIZE-1:0] A;
input  [ 2:0] code;
output [B_SIZE:0] product;
output [ 1:0] h;
output        sn;

reg    [B_SIZE:0] product;
reg    [ 1:0] h;
reg           sn;

wire A_sign;

assign A_sign = A[B_SIZE-1]; 

always @(A[B_SIZE-1:0]
      or code[2:0]
      or A_sign) 
begin
  case(code[2:0])
    3'b000 : product[B_SIZE:0] = {B_SIZE+1{1'b0}};
    3'b001 : product[B_SIZE:0] = { A_sign       , A[B_SIZE-1:0]};
    3'b010 : product[B_SIZE:0] = { A_sign       , A[B_SIZE-1:0]};
    3'b011 : product[B_SIZE:0] = { A[B_SIZE-1:0],1'b0          };
    3'b100 : product[B_SIZE:0] = {~A[B_SIZE-1:0],1'b1          };
    3'b101 : product[B_SIZE:0] = { ~A_sign      ,~A[B_SIZE-1:0]};
    3'b110 : product[B_SIZE:0] = { ~A_sign      ,~A[B_SIZE-1:0]};
    3'b111 : product[B_SIZE:0] = {B_SIZE+1{1'b0}};
    default: product[B_SIZE:0] = {B_SIZE+1{1'bx}};
  endcase
end

always @(code[2:0]
      or A_sign)
begin
  case(code[2:0])
    3'b000 : sn =  1'b1;
    3'b001 : sn = ~A_sign;
    3'b010 : sn = ~A_sign;
    3'b011 : sn = ~A_sign;
    3'b100 : sn =  A_sign;
    3'b101 : sn =  A_sign;
    3'b110 : sn =  A_sign;
    3'b111 : sn =  1'b1;
  endcase
end

always @(code[2:0]) 
begin
  case(code[2:0])
    3'b000 : h[1:0] = 2'b00;
    3'b001 : h[1:0] = 2'b00;
    3'b010 : h[1:0] = 2'b00;
    3'b011 : h[1:0] = 2'b00;
    3'b100 : h[1:0] = 2'b01;
    3'b101 : h[1:0] = 2'b01;
    3'b110 : h[1:0] = 2'b01;
    3'b111 : h[1:0] = 2'b00;
    default: h[1:0] = {2{1'bx}};
  endcase
end

endmodule

