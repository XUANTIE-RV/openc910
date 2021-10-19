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

module compressor_42(p0,p1,p2,p3,cin,s,ca,cout);
parameter B_SIZE = 8;
  
input  [B_SIZE-1:0] p0;
input  [B_SIZE-1:0] p1;
input  [B_SIZE-1:0] p2;
input  [B_SIZE-1:0] p3;
input  [B_SIZE-1:0] cin;
output [B_SIZE-1:0] s;
output [B_SIZE-1:0] ca;
output [B_SIZE-1:0] cout;

wire   [B_SIZE-1:0]  xor0;
wire   [B_SIZE-1:0]  xor1;
wire   [B_SIZE-1:0]  xor2;
wire   [B_SIZE-1:0]  s;
wire   [B_SIZE-1:0]  ca;
wire   [B_SIZE-1:0]  cout;

assign xor0[B_SIZE-1:0] = p0[B_SIZE-1:0] ^ p1[B_SIZE-1:0];
assign xor1[B_SIZE-1:0] = p2[B_SIZE-1:0] ^ p3[B_SIZE-1:0];
assign xor2[B_SIZE-1:0] = xor1[B_SIZE-1:0] ^ xor0[B_SIZE-1:0];

//cout is used for input cin
assign cout[B_SIZE-1:0] = xor0[B_SIZE-1:0] & p2[B_SIZE-1:0]
                        | (~xor0[B_SIZE-1:0] & p0[B_SIZE-1:0]);
assign s[B_SIZE-1:0]    = xor2[B_SIZE-1:0] ^ cin[B_SIZE-1:0];
assign ca[B_SIZE-1:0]   = xor2[B_SIZE-1:0] & cin[B_SIZE-1:0]
                        | ~xor2[B_SIZE-1:0] & p3[B_SIZE-1:0];

endmodule
