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
module ct_vfmau_ff1_10bit(
  ff1_data,
  ff1_result
);

// &Ports; @24
input   [9:0]  ff1_data;  
output  [3:0]  ff1_result; 

// &Regs; @25
reg     [3:0]  ff1_result; 

// &Wires; @26
wire    [9:0]  ff1_data;  


// &CombBeg; @28
always @( ff1_data[9:0])
begin
casez(ff1_data[9:0])
  10'b1?????????: ff1_result[3:0] = 4'd1;
  10'b01????????: ff1_result[3:0] = 4'd2;
  10'b001???????: ff1_result[3:0] = 4'd3;
  10'b0001??????: ff1_result[3:0] = 4'd4;
  10'b00001?????: ff1_result[3:0] = 4'd5;
  10'b000001????: ff1_result[3:0] = 4'd6;
  10'b0000001???: ff1_result[3:0] = 4'd7;
  10'b00000001??: ff1_result[3:0] = 4'd8;
  10'b000000001?: ff1_result[3:0] = 4'd9;
  10'b0000000001: ff1_result[3:0] = 4'd10;
  default       : ff1_result[3:0] = {4{1'bx}};
endcase
// &CombEnd; @42
end

// &ModuleEnd; @44
endmodule


