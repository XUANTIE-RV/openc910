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

// &ModuleBeg; @22
module ct_fadd_onehot_sel_h(
  data_in,
  onehot,
  result
);

// &Ports; @23
input   [11:0]  data_in; 
input   [11:0]  onehot;  
output  [11:0]  result;  

// &Regs; @24
reg     [11:0]  result_h; 

// &Wires; @25
wire    [11:0]  data_in; 
wire    [11:0]  onehot;  
wire    [11:0]  result;  


// &Force("bus","data_in",11,0); @27
// &CombBeg; @28
always @( onehot[11:0]
       or data_in[11:0])
begin
case(onehot[11:0])
  12'h800 : result_h[11:0] = data_in[11:0];
  12'h400 : result_h[11:0] = {data_in[10:0],1'b0};
  12'h200 : result_h[11:0] = {data_in[9:0],2'b0};
  12'h100 : result_h[11:0] = {data_in[8:0],2'b0,1'b0};
  12'h080 : result_h[11:0] = {data_in[7:0],2'b0,2'b0};
  12'h040 : result_h[11:0] = {data_in[6:0],2'b0,3'b0};
  12'h020 : result_h[11:0] = {data_in[5:0],2'b0,4'b0};
  12'h010 : result_h[11:0] = {data_in[4:0],2'b0,5'b0};
  12'h008 : result_h[11:0] = {data_in[3:0],2'b0,6'b0};
  12'h004 : result_h[11:0] = {data_in[2:0],2'b0,7'b0};
  12'h002 : result_h[11:0] = {data_in[1:0],2'b0,8'b0};
  12'h001 : result_h[11:0] = {data_in[0],2'b0,9'b0};
  12'h000 : result_h[11:0] = 12'b0;
  default               : result_h[11:0] = {12{1'bx}};
endcase
// &CombEnd; @45
end
assign result[11:0] = result_h[11:0];

// &ModuleEnd; @48
endmodule


