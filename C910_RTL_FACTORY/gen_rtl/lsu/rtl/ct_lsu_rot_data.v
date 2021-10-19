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
module ct_lsu_rot_data(
  data_in,
  data_settle_out,
  rot_sel
);

// &Ports; @24
input   [127:0]  data_in;        
input   [7  :0]  rot_sel;        
output  [127:0]  data_settle_out; 

// &Regs; @25
reg     [63 :0]  data_settle;    

// &Wires; @26
wire    [63 :0]  data;           
wire    [127:0]  data_in;        
wire    [63 :0]  data_rot0;      
wire    [63 :0]  data_rot1;      
wire    [63 :0]  data_rot2;      
wire    [63 :0]  data_rot3;      
wire    [63 :0]  data_rot4;      
wire    [63 :0]  data_rot5;      
wire    [63 :0]  data_rot6;      
wire    [63 :0]  data_rot7;      
wire    [127:0]  data_settle_out; 
wire    [7  :0]  rot_sel;        


// &CombBeg; @48
// &CombEnd; @68
assign data[63:0]       = data_in[63:0]
                          | data_in[127:64];

assign data_rot0[63:0]  = data[63:0];
assign data_rot1[63:0]  = {data[7:0],data[63:8]};
assign data_rot2[63:0]  = {data[15:0],data[63:16]};
assign data_rot3[63:0]  = {data[23:0],data[63:24]};
assign data_rot4[63:0]  = {data[31:0],data[63:32]};
assign data_rot5[63:0]  = {data[39:0],data[63:40]};
assign data_rot6[63:0]  = {data[47:0],data[63:48]};
assign data_rot7[63:0]  = {data[55:0],data[63:56]};

// &CombBeg; @85
always @( data_rot5[63:0]
       or rot_sel[7:0]
       or data_rot0[63:0]
       or data_rot3[63:0]
       or data_rot6[63:0]
       or data_rot4[63:0]
       or data_rot1[63:0]
       or data_rot7[63:0]
       or data_rot2[63:0])
begin
case(rot_sel[7:0])
  8'h01:data_settle[63:0] = data_rot0[63:0];
  8'h02:data_settle[63:0] = data_rot1[63:0];
  8'h04:data_settle[63:0] = data_rot2[63:0];
  8'h08:data_settle[63:0] = data_rot3[63:0];
  8'h10:data_settle[63:0] = data_rot4[63:0];
  8'h20:data_settle[63:0] = data_rot5[63:0];
  8'h40:data_settle[63:0] = data_rot6[63:0];
  8'h80:data_settle[63:0] = data_rot7[63:0];
  default: data_settle[63:0] = {64{1'bx}};
endcase
// &CombEnd; @97
end

assign data_settle_out[127:0] = {64'b0,data_settle[63:0]};

// &ModuleEnd; @102
endmodule


