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
module ct_rtu_expand_64(
  x_num,
  x_num_expand
);

// &Ports; @25
input   [5 :0]  x_num;       
output  [63:0]  x_num_expand; 

// &Regs; @26

// &Wires; @27
wire    [5 :0]  x_num;       
wire    [63:0]  x_num_expand; 


//==========================================================
//       expand 6 bits number to 64 bits one-hot number
//==========================================================
assign x_num_expand[0]  = (x_num[5:0] == 6'd0);
assign x_num_expand[1]  = (x_num[5:0] == 6'd1);
assign x_num_expand[2]  = (x_num[5:0] == 6'd2);
assign x_num_expand[3]  = (x_num[5:0] == 6'd3);
assign x_num_expand[4]  = (x_num[5:0] == 6'd4);
assign x_num_expand[5]  = (x_num[5:0] == 6'd5);
assign x_num_expand[6]  = (x_num[5:0] == 6'd6);
assign x_num_expand[7]  = (x_num[5:0] == 6'd7);
assign x_num_expand[8]  = (x_num[5:0] == 6'd8);
assign x_num_expand[9]  = (x_num[5:0] == 6'd9);
assign x_num_expand[10] = (x_num[5:0] == 6'd10);
assign x_num_expand[11] = (x_num[5:0] == 6'd11);
assign x_num_expand[12] = (x_num[5:0] == 6'd12);
assign x_num_expand[13] = (x_num[5:0] == 6'd13);
assign x_num_expand[14] = (x_num[5:0] == 6'd14);
assign x_num_expand[15] = (x_num[5:0] == 6'd15);
assign x_num_expand[16] = (x_num[5:0] == 6'd16);
assign x_num_expand[17] = (x_num[5:0] == 6'd17);
assign x_num_expand[18] = (x_num[5:0] == 6'd18);
assign x_num_expand[19] = (x_num[5:0] == 6'd19);
assign x_num_expand[20] = (x_num[5:0] == 6'd20);
assign x_num_expand[21] = (x_num[5:0] == 6'd21);
assign x_num_expand[22] = (x_num[5:0] == 6'd22);
assign x_num_expand[23] = (x_num[5:0] == 6'd23);
assign x_num_expand[24] = (x_num[5:0] == 6'd24);
assign x_num_expand[25] = (x_num[5:0] == 6'd25);
assign x_num_expand[26] = (x_num[5:0] == 6'd26);
assign x_num_expand[27] = (x_num[5:0] == 6'd27);
assign x_num_expand[28] = (x_num[5:0] == 6'd28);
assign x_num_expand[29] = (x_num[5:0] == 6'd29);
assign x_num_expand[30] = (x_num[5:0] == 6'd30);
assign x_num_expand[31] = (x_num[5:0] == 6'd31);
assign x_num_expand[32] = (x_num[5:0] == 6'd32);
assign x_num_expand[33] = (x_num[5:0] == 6'd33);
assign x_num_expand[34] = (x_num[5:0] == 6'd34);
assign x_num_expand[35] = (x_num[5:0] == 6'd35);
assign x_num_expand[36] = (x_num[5:0] == 6'd36);
assign x_num_expand[37] = (x_num[5:0] == 6'd37);
assign x_num_expand[38] = (x_num[5:0] == 6'd38);
assign x_num_expand[39] = (x_num[5:0] == 6'd39);
assign x_num_expand[40] = (x_num[5:0] == 6'd40);
assign x_num_expand[41] = (x_num[5:0] == 6'd41);
assign x_num_expand[42] = (x_num[5:0] == 6'd42);
assign x_num_expand[43] = (x_num[5:0] == 6'd43);
assign x_num_expand[44] = (x_num[5:0] == 6'd44);
assign x_num_expand[45] = (x_num[5:0] == 6'd45);
assign x_num_expand[46] = (x_num[5:0] == 6'd46);
assign x_num_expand[47] = (x_num[5:0] == 6'd47);
assign x_num_expand[48] = (x_num[5:0] == 6'd48);
assign x_num_expand[49] = (x_num[5:0] == 6'd49);
assign x_num_expand[50] = (x_num[5:0] == 6'd50);
assign x_num_expand[51] = (x_num[5:0] == 6'd51);
assign x_num_expand[52] = (x_num[5:0] == 6'd52);
assign x_num_expand[53] = (x_num[5:0] == 6'd53);
assign x_num_expand[54] = (x_num[5:0] == 6'd54);
assign x_num_expand[55] = (x_num[5:0] == 6'd55);
assign x_num_expand[56] = (x_num[5:0] == 6'd56);
assign x_num_expand[57] = (x_num[5:0] == 6'd57);
assign x_num_expand[58] = (x_num[5:0] == 6'd58);
assign x_num_expand[59] = (x_num[5:0] == 6'd59);
assign x_num_expand[60] = (x_num[5:0] == 6'd60);
assign x_num_expand[61] = (x_num[5:0] == 6'd61);
assign x_num_expand[62] = (x_num[5:0] == 6'd62);
assign x_num_expand[63] = (x_num[5:0] == 6'd63);

// &ModuleEnd; @97
endmodule


