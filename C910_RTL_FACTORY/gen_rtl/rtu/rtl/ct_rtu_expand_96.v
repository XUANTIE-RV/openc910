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
module ct_rtu_expand_96(
  x_num,
  x_num_expand
);

// &Ports; @25
input   [6 :0]  x_num;       
output  [95:0]  x_num_expand; 

// &Regs; @26

// &Wires; @27
wire    [6 :0]  x_num;       
wire    [95:0]  x_num_expand; 


//==========================================================
//       expand 7 bits number to 96 bits one-hot number
//==========================================================
assign x_num_expand[0]  = (x_num[6:0] == 7'd0);
assign x_num_expand[1]  = (x_num[6:0] == 7'd1);
assign x_num_expand[2]  = (x_num[6:0] == 7'd2);
assign x_num_expand[3]  = (x_num[6:0] == 7'd3);
assign x_num_expand[4]  = (x_num[6:0] == 7'd4);
assign x_num_expand[5]  = (x_num[6:0] == 7'd5);
assign x_num_expand[6]  = (x_num[6:0] == 7'd6);
assign x_num_expand[7]  = (x_num[6:0] == 7'd7);
assign x_num_expand[8]  = (x_num[6:0] == 7'd8);
assign x_num_expand[9]  = (x_num[6:0] == 7'd9);
assign x_num_expand[10] = (x_num[6:0] == 7'd10);
assign x_num_expand[11] = (x_num[6:0] == 7'd11);
assign x_num_expand[12] = (x_num[6:0] == 7'd12);
assign x_num_expand[13] = (x_num[6:0] == 7'd13);
assign x_num_expand[14] = (x_num[6:0] == 7'd14);
assign x_num_expand[15] = (x_num[6:0] == 7'd15);
assign x_num_expand[16] = (x_num[6:0] == 7'd16);
assign x_num_expand[17] = (x_num[6:0] == 7'd17);
assign x_num_expand[18] = (x_num[6:0] == 7'd18);
assign x_num_expand[19] = (x_num[6:0] == 7'd19);
assign x_num_expand[20] = (x_num[6:0] == 7'd20);
assign x_num_expand[21] = (x_num[6:0] == 7'd21);
assign x_num_expand[22] = (x_num[6:0] == 7'd22);
assign x_num_expand[23] = (x_num[6:0] == 7'd23);
assign x_num_expand[24] = (x_num[6:0] == 7'd24);
assign x_num_expand[25] = (x_num[6:0] == 7'd25);
assign x_num_expand[26] = (x_num[6:0] == 7'd26);
assign x_num_expand[27] = (x_num[6:0] == 7'd27);
assign x_num_expand[28] = (x_num[6:0] == 7'd28);
assign x_num_expand[29] = (x_num[6:0] == 7'd29);
assign x_num_expand[30] = (x_num[6:0] == 7'd30);
assign x_num_expand[31] = (x_num[6:0] == 7'd31);
assign x_num_expand[32] = (x_num[6:0] == 7'd32);
assign x_num_expand[33] = (x_num[6:0] == 7'd33);
assign x_num_expand[34] = (x_num[6:0] == 7'd34);
assign x_num_expand[35] = (x_num[6:0] == 7'd35);
assign x_num_expand[36] = (x_num[6:0] == 7'd36);
assign x_num_expand[37] = (x_num[6:0] == 7'd37);
assign x_num_expand[38] = (x_num[6:0] == 7'd38);
assign x_num_expand[39] = (x_num[6:0] == 7'd39);
assign x_num_expand[40] = (x_num[6:0] == 7'd40);
assign x_num_expand[41] = (x_num[6:0] == 7'd41);
assign x_num_expand[42] = (x_num[6:0] == 7'd42);
assign x_num_expand[43] = (x_num[6:0] == 7'd43);
assign x_num_expand[44] = (x_num[6:0] == 7'd44);
assign x_num_expand[45] = (x_num[6:0] == 7'd45);
assign x_num_expand[46] = (x_num[6:0] == 7'd46);
assign x_num_expand[47] = (x_num[6:0] == 7'd47);
assign x_num_expand[48] = (x_num[6:0] == 7'd48);
assign x_num_expand[49] = (x_num[6:0] == 7'd49);
assign x_num_expand[50] = (x_num[6:0] == 7'd50);
assign x_num_expand[51] = (x_num[6:0] == 7'd51);
assign x_num_expand[52] = (x_num[6:0] == 7'd52);
assign x_num_expand[53] = (x_num[6:0] == 7'd53);
assign x_num_expand[54] = (x_num[6:0] == 7'd54);
assign x_num_expand[55] = (x_num[6:0] == 7'd55);
assign x_num_expand[56] = (x_num[6:0] == 7'd56);
assign x_num_expand[57] = (x_num[6:0] == 7'd57);
assign x_num_expand[58] = (x_num[6:0] == 7'd58);
assign x_num_expand[59] = (x_num[6:0] == 7'd59);
assign x_num_expand[60] = (x_num[6:0] == 7'd60);
assign x_num_expand[61] = (x_num[6:0] == 7'd61);
assign x_num_expand[62] = (x_num[6:0] == 7'd62);
assign x_num_expand[63] = (x_num[6:0] == 7'd63);
assign x_num_expand[64] = (x_num[6:0] == 7'd64);
assign x_num_expand[65] = (x_num[6:0] == 7'd65);
assign x_num_expand[66] = (x_num[6:0] == 7'd66);
assign x_num_expand[67] = (x_num[6:0] == 7'd67);
assign x_num_expand[68] = (x_num[6:0] == 7'd68);
assign x_num_expand[69] = (x_num[6:0] == 7'd69);
assign x_num_expand[70] = (x_num[6:0] == 7'd70);
assign x_num_expand[71] = (x_num[6:0] == 7'd71);
assign x_num_expand[72] = (x_num[6:0] == 7'd72);
assign x_num_expand[73] = (x_num[6:0] == 7'd73);
assign x_num_expand[74] = (x_num[6:0] == 7'd74);
assign x_num_expand[75] = (x_num[6:0] == 7'd75);
assign x_num_expand[76] = (x_num[6:0] == 7'd76);
assign x_num_expand[77] = (x_num[6:0] == 7'd77);
assign x_num_expand[78] = (x_num[6:0] == 7'd78);
assign x_num_expand[79] = (x_num[6:0] == 7'd79);
assign x_num_expand[80] = (x_num[6:0] == 7'd80);
assign x_num_expand[81] = (x_num[6:0] == 7'd81);
assign x_num_expand[82] = (x_num[6:0] == 7'd82);
assign x_num_expand[83] = (x_num[6:0] == 7'd83);
assign x_num_expand[84] = (x_num[6:0] == 7'd84);
assign x_num_expand[85] = (x_num[6:0] == 7'd85);
assign x_num_expand[86] = (x_num[6:0] == 7'd86);
assign x_num_expand[87] = (x_num[6:0] == 7'd87);
assign x_num_expand[88] = (x_num[6:0] == 7'd88);
assign x_num_expand[89] = (x_num[6:0] == 7'd89);
assign x_num_expand[90] = (x_num[6:0] == 7'd90);
assign x_num_expand[91] = (x_num[6:0] == 7'd91);
assign x_num_expand[92] = (x_num[6:0] == 7'd92);
assign x_num_expand[93] = (x_num[6:0] == 7'd93);
assign x_num_expand[94] = (x_num[6:0] == 7'd94);
assign x_num_expand[95] = (x_num[6:0] == 7'd95);

// &ModuleEnd; @129
endmodule


