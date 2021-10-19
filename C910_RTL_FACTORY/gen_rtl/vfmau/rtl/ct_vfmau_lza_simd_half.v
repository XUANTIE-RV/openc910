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
module ct_vfmau_lza_simd_half(
  addend,
  lza_result,
  lza_result_zero,
  sub_vld,
  summand
);

// &Ports; @24
input   [23:0]  addend;         
input           sub_vld;        
input   [23:0]  summand;        
output  [4 :0]  lza_result;     
output          lza_result_zero; 

// &Regs; @25
reg     [4 :0]  lza_result;     

// &Wires; @26
wire    [23:0]  addend;         
wire    [23:0]  carry_d;        
wire    [23:0]  carry_g;        
wire    [23:0]  carry_p;        
wire    [23:0]  lza_precod;     
wire            lza_result_zero; 
wire            sub_vld;        
wire    [23:0]  summand;        


//==========================================================
//                   Signal Pre-encode
//==========================================================
//----------------------------------------------------------
//                   Signal preparation
//----------------------------------------------------------
// carry_p: carry propagete
// carry_g: carry generate
// carry_d: carry delete
assign carry_p[23:0] = summand[23:0] ^ addend[23:0];
assign carry_g[23:0] = summand[23:0] & addend[23:0];
assign carry_d[23:0] = ~(summand[23:0] | addend[23:0]);
//----------------------------------------------------------
//                   Signal decode
//----------------------------------------------------------
//pre-predecode for leading zero anticipation
assign lza_precod[0] = 
     carry_p[1] && (carry_g[0] && sub_vld || carry_d[0])
 || !carry_p[1] && (carry_d[0] && sub_vld || carry_g[0]);

assign lza_precod[23] = 
     sub_vld && (carry_g[23] && !carry_d[22] || carry_d[23] && !carry_g[22])
 || !sub_vld && (carry_d[23] && !carry_d[22] || !carry_d[23]);

assign lza_precod[22:1] = 
    carry_p[23:2] & (carry_g[22:1] & ~carry_d[21:0] | carry_d[22:1] & ~carry_g[21:0])
 | ~carry_p[23:2] & (carry_g[22:1] & ~carry_g[21:0] | carry_d[22:1] & ~carry_d[21:0]);

//==========================================================
//                     LZA coding
//==========================================================
// &CombBeg; @59
always @( lza_precod[23:0])
begin
casez(lza_precod[23:0])
  24'b1???????????????????????:lza_result[4:0] = 5'd0;
  24'b01??????????????????????:lza_result[4:0] = 5'd1;
  24'b001?????????????????????:lza_result[4:0] = 5'd2;
  24'b0001????????????????????:lza_result[4:0] = 5'd3;
  24'b00001???????????????????:lza_result[4:0] = 5'd4;
  24'b000001??????????????????:lza_result[4:0] = 5'd5;
  24'b0000001?????????????????:lza_result[4:0] = 5'd6;
  24'b00000001????????????????:lza_result[4:0] = 5'd7;
  24'b000000001???????????????:lza_result[4:0] = 5'd8;
  24'b0000000001??????????????:lza_result[4:0] = 5'd9;
  24'b00000000001?????????????:lza_result[4:0] = 5'd10;
  24'b000000000001????????????:lza_result[4:0] = 5'd11;
  24'b0000000000001???????????:lza_result[4:0] = 5'd12;
  24'b00000000000001??????????:lza_result[4:0] = 5'd13;
  24'b000000000000001?????????:lza_result[4:0] = 5'd14;
  24'b0000000000000001????????:lza_result[4:0] = 5'd15;
  24'b00000000000000001???????:lza_result[4:0] = 5'd16;
  24'b000000000000000001??????:lza_result[4:0] = 5'd17;
  24'b0000000000000000001?????:lza_result[4:0] = 5'd18;
  24'b00000000000000000001????:lza_result[4:0] = 5'd19;
  24'b000000000000000000001???:lza_result[4:0] = 5'd20;
  24'b0000000000000000000001??:lza_result[4:0] = 5'd21;
  24'b00000000000000000000001?:lza_result[4:0] = 5'd22;
  24'b000000000000000000000001:lza_result[4:0] = 5'd23;
  default                     :lza_result[4:0] = 5'd24;
endcase
// &CombEnd; @87
end

assign lza_result_zero = ~|lza_precod[23:0];

// &ModuleEnd; @91
endmodule


