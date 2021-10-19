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

module multiplier_65x65_3_stage(
pipe1_clk,
pipe2_clk,
cpurst_b,
pipe1_down,
pipe2_down,
multiplicand,
multiplier,
addend,
sub_vld,
product
);

input  [64:0]  multiplicand;
input  [64:0]  multiplier;
input  [64:0]  addend;
input          sub_vld;
input          pipe1_clk;
input          pipe2_clk;
input          cpurst_b;
input          pipe1_down;
input          pipe2_down;
output [129:0] product;

wire   [64:0]  multiplicand_not;
wire   [65:0]  part_product0, part_product1, part_product2, part_product3;
wire   [65:0]  part_product4, part_product5, part_product6, part_product7;
wire   [65:0]  part_product8, part_product9, part_product10,part_product11;
wire   [65:0]  part_product12,part_product13,part_product14,part_product15;
wire   [65:0]  part_product16,part_product17,part_product18,part_product19;
wire   [65:0]  part_product20,part_product21,part_product22,part_product23;
wire   [65:0]  part_product24,part_product25,part_product26,part_product27;
wire   [65:0]  part_product28,part_product29,part_product30,part_product31;
wire   [65:0]  part_product32;
wire   [63:0]  part_product33;
wire   [ 1:0]  h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16,h17,h18,h19,h20,h21,h22,h23,h24,h25,h26,h27,h28,h29,h30,h31,h32;
wire   [32:0]  sign_not;

//for calculate a-b*c, mult calculate can be extend as:
//  (~multiplicand + 1) * multiplier
//= ~multiplicand * multiplier + multiplier
assign multiplicand_not[64:0] = (sub_vld)
                              ? ~multiplicand[64:0]
                              : multiplicand[64:0];
// partial product
booth_code #(65) x_booth_code0 (.A(multiplicand_not),.code({multiplier[1:0],1'b0}),  .product(part_product0), .h(h0), .sn(sign_not[0]));
booth_code #(65) x_booth_code1 (.A(multiplicand_not),.code(multiplier[ 3: 1]),       .product(part_product1), .h(h1), .sn(sign_not[1]));
booth_code #(65) x_booth_code2 (.A(multiplicand_not),.code(multiplier[ 5: 3]),       .product(part_product2), .h(h2), .sn(sign_not[2]));
booth_code #(65) x_booth_code3 (.A(multiplicand_not),.code(multiplier[ 7: 5]),       .product(part_product3), .h(h3), .sn(sign_not[3]));
booth_code #(65) x_booth_code4 (.A(multiplicand_not),.code(multiplier[ 9: 7]),       .product(part_product4), .h(h4), .sn(sign_not[4]));
booth_code #(65) x_booth_code5 (.A(multiplicand_not),.code(multiplier[11: 9]),       .product(part_product5), .h(h5), .sn(sign_not[5]));
booth_code #(65) x_booth_code6 (.A(multiplicand_not),.code(multiplier[13:11]),       .product(part_product6), .h(h6), .sn(sign_not[6]));
booth_code #(65) x_booth_code7 (.A(multiplicand_not),.code(multiplier[15:13]),       .product(part_product7), .h(h7), .sn(sign_not[7]));
booth_code #(65) x_booth_code8 (.A(multiplicand_not),.code(multiplier[17:15]),       .product(part_product8), .h(h8), .sn(sign_not[8]));
booth_code #(65) x_booth_code9 (.A(multiplicand_not),.code(multiplier[19:17]),       .product(part_product9), .h(h9), .sn(sign_not[9]));
booth_code #(65) x_booth_code10(.A(multiplicand_not),.code(multiplier[21:19]),       .product(part_product10),.h(h10),.sn(sign_not[10]));
booth_code #(65) x_booth_code11(.A(multiplicand_not),.code(multiplier[23:21]),       .product(part_product11),.h(h11),.sn(sign_not[11]));
booth_code #(65) x_booth_code12(.A(multiplicand_not),.code(multiplier[25:23]),       .product(part_product12),.h(h12),.sn(sign_not[12]));
booth_code #(65) x_booth_code13(.A(multiplicand_not),.code(multiplier[27:25]),       .product(part_product13),.h(h13),.sn(sign_not[13]));
booth_code #(65) x_booth_code14(.A(multiplicand_not),.code(multiplier[29:27]),       .product(part_product14),.h(h14),.sn(sign_not[14]));
booth_code #(65) x_booth_code15(.A(multiplicand_not),.code(multiplier[31:29]),       .product(part_product15),.h(h15),.sn(sign_not[15]));
booth_code #(65) x_booth_code16(.A(multiplicand_not),.code(multiplier[33:31]),       .product(part_product16),.h(h16),.sn(sign_not[16]));
booth_code #(65) x_booth_code17(.A(multiplicand_not),.code(multiplier[35:33]),       .product(part_product17),.h(h17),.sn(sign_not[17]));
booth_code #(65) x_booth_code18(.A(multiplicand_not),.code(multiplier[37:35]),       .product(part_product18),.h(h18),.sn(sign_not[18]));
booth_code #(65) x_booth_code19(.A(multiplicand_not),.code(multiplier[39:37]),       .product(part_product19),.h(h19),.sn(sign_not[19]));
booth_code #(65) x_booth_code20(.A(multiplicand_not),.code(multiplier[41:39]),       .product(part_product20),.h(h20),.sn(sign_not[20]));
booth_code #(65) x_booth_code21(.A(multiplicand_not),.code(multiplier[43:41]),       .product(part_product21),.h(h21),.sn(sign_not[21]));
booth_code #(65) x_booth_code22(.A(multiplicand_not),.code(multiplier[45:43]),       .product(part_product22),.h(h22),.sn(sign_not[22]));
booth_code #(65) x_booth_code23(.A(multiplicand_not),.code(multiplier[47:45]),       .product(part_product23),.h(h23),.sn(sign_not[23]));
booth_code #(65) x_booth_code24(.A(multiplicand_not),.code(multiplier[49:47]),       .product(part_product24),.h(h24),.sn(sign_not[24]));
booth_code #(65) x_booth_code25(.A(multiplicand_not),.code(multiplier[51:49]),       .product(part_product25),.h(h25),.sn(sign_not[25]));
booth_code #(65) x_booth_code26(.A(multiplicand_not),.code(multiplier[53:51]),       .product(part_product26),.h(h26),.sn(sign_not[26]));
booth_code #(65) x_booth_code27(.A(multiplicand_not),.code(multiplier[55:53]),       .product(part_product27),.h(h27),.sn(sign_not[27]));
booth_code #(65) x_booth_code28(.A(multiplicand_not),.code(multiplier[57:55]),       .product(part_product28),.h(h28),.sn(sign_not[28]));
booth_code #(65) x_booth_code29(.A(multiplicand_not),.code(multiplier[59:57]),       .product(part_product29),.h(h29),.sn(sign_not[29]));
booth_code #(65) x_booth_code30(.A(multiplicand_not),.code(multiplier[61:59]),       .product(part_product30),.h(h30),.sn(sign_not[30]));
booth_code #(65) x_booth_code31(.A(multiplicand_not),.code(multiplier[63:61]),       .product(part_product31),.h(h31),.sn(sign_not[31]));
booth_code #(65) x_booth_code32(.A(multiplicand_not),.code({multiplier[64],multiplier[64:63]}), .product(part_product32),.h(h32),.sn(sign_not[32]));

//for a-b*c(mult sub),regard multiplier as one part product
assign part_product33[63:0]    = (sub_vld) 
                               ? multiplier[63:0]
                               : 64'b0;

//----------------------------------------------------------
//                    L1 compressor
//----------------------------------------------------------
// first level compressor:
// components: 8 4:2 compressor
// result: 34 partial products -> 18 paritial products
wire [72:0] p0_0,p0_1,p0_2,p0_3,p0_cin,cout0_0;
wire [74:0] p1_0,p1_1,p1_2,p1_3,p1_cin,cout0_1;
wire [74:0] p2_0,p2_1,p2_2,p2_3,p2_cin,cout0_2;
wire [74:0] p3_0,p3_1,p3_2,p3_3,p3_cin,cout0_3;
wire [74:0] p4_0,p4_1,p4_2,p4_3,p4_cin,cout0_4;
wire [74:0] p5_0,p5_1,p5_2,p5_3,p5_cin,cout0_5;
wire [74:0] p6_0,p6_1,p6_2,p6_3,p6_cin,cout0_6;
wire [74:0] p7_0,p7_1,p7_2,p7_3,p7_cin,cout0_7;

assign p0_0[72:0]   = {4'b0,sign_not[0],{2{!sign_not[0]}},part_product0[65:0]}; //0
assign p0_1[72:0]   = {4'b0,sign_not[1],part_product1[65:0],h0[1:0]};
assign p0_2[72:0]   = {2'b0,sign_not[2],part_product2[65:0],h1[1:0],2'b0};
assign p0_3[72:0]   = {sign_not[3],part_product3[65:0],h2[1:0],3'b0,1'b0};  
assign p0_cin[72:0] = {cout0_0[71:0],1'b0}; 

assign p1_0[74:0]   = {6'b0,sign_not[4],part_product4[65:0],h3[1:0]};
assign p1_1[74:0]   = {4'b0,sign_not[5],part_product5[65:0],h4[1:0],2'b0};
assign p1_2[74:0]   = {2'b0,sign_not[6],part_product6[65:0],h5[1:0],4'b0};
assign p1_3[74:0]   = {sign_not[7],part_product7[65:0],h6[1:0],6'b0};
assign p1_cin[74:0] = {cout0_1[73:0],1'b0}; 

assign p2_0[74:0]   = {6'b0,sign_not[8],part_product8[65:0],h7[1:0]};
assign p2_1[74:0]   = {4'b0,sign_not[9],part_product9[65:0],h8[1:0],2'b0};
assign p2_2[74:0]   = {2'b0,sign_not[10],part_product10[65:0],h9[1:0],4'b0};
assign p2_3[74:0]   = {sign_not[11],part_product11[65:0],h10[1:0],6'b0};
assign p2_cin[74:0] = {cout0_2[73:0],1'b0}; 

assign p3_0[74:0]   = {6'b0,sign_not[12],part_product12[65:0],h11[1:0]};
assign p3_1[74:0]   = {4'b0,sign_not[13],part_product13[65:0],h12[1:0],2'b0};
assign p3_2[74:0]   = {2'b0,sign_not[14],part_product14[65:0],h13[1:0],4'b0};
assign p3_3[74:0]   = {sign_not[15],part_product15[65:0],h14[1:0],6'b0};
assign p3_cin[74:0] = {cout0_3[73:0],1'b0}; 

assign p4_0[74:0]   = {6'b0,sign_not[16],part_product16[65:0],h15[1:0]};
assign p4_1[74:0]   = {4'b0,sign_not[17],part_product17[65:0],h16[1:0],2'b0};
assign p4_2[74:0]   = {2'b0,sign_not[18],part_product18[65:0],h17[1:0],4'b0};
assign p4_3[74:0]   = {sign_not[19],part_product19[65:0],h18[1:0],6'b0};
assign p4_cin[74:0] = {cout0_4[73:0],1'b0}; 

assign p5_0[74:0]   = {6'b0,sign_not[20],part_product20[65:0],h19[1:0]};
assign p5_1[74:0]   = {4'b0,sign_not[21],part_product21[65:0],h20[1:0],2'b0};
assign p5_2[74:0]   = {2'b0,sign_not[22],part_product22[65:0],h21[1:0],4'b0};
assign p5_3[74:0]   = {sign_not[23],part_product23[65:0],h22[1:0],6'b0};
assign p5_cin[74:0] = {cout0_5[73:0],1'b0}; 

assign p6_0[74:0]   = {6'b0,sign_not[24],part_product24[65:0],h23[1:0]};
assign p6_1[74:0]   = {4'b0,sign_not[25],part_product25[65:0],h24[1:0],2'b0};
assign p6_2[74:0]   = {2'b0,sign_not[26],part_product26[65:0],h25[1:0],4'b0};
assign p6_3[74:0]   = {sign_not[27],part_product27[65:0],h26[1:0],6'b0};
assign p6_cin[74:0] = {cout0_6[73:0],1'b0}; 

assign p7_0[74:0]   = {6'b0,sign_not[28],part_product28[65:0],h27[1:0]};
assign p7_1[74:0]   = {4'b0,sign_not[29],part_product29[65:0],h28[1:0],2'b0};
assign p7_2[74:0]   = {2'b0,sign_not[30],part_product30[65:0],h29[1:0],4'b0};
assign p7_3[74:0]   = {sign_not[31],part_product31[65:0],h30[1:0],6'b0};
assign p7_cin[74:0] = {cout0_7[73:0],1'b0}; 

wire [72:0] s0_0,c0_0;
wire [74:0] s0_1,c0_1;
wire [74:0] s0_2,c0_2;
wire [74:0] s0_3,c0_3;
wire [74:0] s0_4,c0_4;
wire [74:0] s0_5,c0_5;
wire [74:0] s0_6,c0_6;
wire [74:0] s0_7,c0_7;

compressor_42 #(73) x_comp0_0(.p0   (p0_0[72:0]), 
                            .p1   (p0_1[72:0]),
                            .p2   (p0_2[72:0]), 
                            .p3   (p0_3[72:0]),
                            .cin  (p0_cin[72:0]),
                            .s    (s0_0[72:0]), 
                            .ca   (c0_0[72:0]),
                            .cout (cout0_0[72:0]));

compressor_42 #(75) x_comp0_1(.p0   (p1_0[74:0]), 
                            .p1   (p1_1[74:0]),
                            .p2   (p1_2[74:0]), 
                            .p3   (p1_3[74:0]),
                            .cin  (p1_cin[74:0]),
                            .s    (s0_1[74:0]), 
                            .ca   (c0_1[74:0]),
                            .cout (cout0_1[74:0]));

compressor_42 #(75) x_comp0_2(.p0   (p2_0[74:0]), 
                            .p1   (p2_1[74:0]),
                            .p2   (p2_2[74:0]), 
                            .p3   (p2_3[74:0]),
                            .cin  (p2_cin[74:0]),
                            .s    (s0_2[74:0]), 
                            .ca   (c0_2[74:0]),
                            .cout (cout0_2[74:0]));

compressor_42 #(75) x_comp0_3(.p0   (p3_0[74:0]), 
                            .p1   (p3_1[74:0]),
                            .p2   (p3_2[74:0]), 
                            .p3   (p3_3[74:0]),
                            .cin  (p3_cin[74:0]),
                            .s    (s0_3[74:0]), 
                            .ca   (c0_3[74:0]),
                            .cout (cout0_3[74:0]));

compressor_42 #(75) x_comp0_4(.p0   (p4_0[74:0]), 
                            .p1   (p4_1[74:0]),
                            .p2   (p4_2[74:0]), 
                            .p3   (p4_3[74:0]),
                            .cin  (p4_cin[74:0]),
                            .s    (s0_4[74:0]), 
                            .ca   (c0_4[74:0]),
                            .cout (cout0_4[74:0]));

compressor_42 #(75) x_comp0_5(.p0   (p5_0[74:0]), 
                            .p1   (p5_1[74:0]),
                            .p2   (p5_2[74:0]), 
                            .p3   (p5_3[74:0]),
                            .cin  (p5_cin[74:0]),
                            .s    (s0_5[74:0]), 
                            .ca   (c0_5[74:0]),
                            .cout (cout0_5[74:0]));

compressor_42 #(75) x_comp0_6(.p0   (p6_0[74:0]), 
                            .p1   (p6_1[74:0]),
                            .p2   (p6_2[74:0]), 
                            .p3   (p6_3[74:0]),
                            .cin  (p6_cin[74:0]),
                            .s    (s0_6[74:0]), 
                            .ca   (c0_6[74:0]),
                            .cout (cout0_6[74:0]));
                          
compressor_42 #(75) x_comp0_7(.p0   (p7_0[74:0]), 
                            .p1   (p7_1[74:0]),
                            .p2   (p7_2[74:0]), 
                            .p3   (p7_3[74:0]),
                            .cin  (p7_cin[74:0]),
                            .s    (s0_7[74:0]), 
                            .ca   (c0_7[74:0]),
                            .cout (cout0_7[74:0]));

//----------------------------------------------------------
//                    L2 compressor
//----------------------------------------------------------
// second level compressor:
// components: 6 3:2 compressor
// result: 18 partial products -> 12 paritial products
wire [80:0] q0_0,q0_1,q0_2;
wire [82:0] q1_0,q1_1,q1_2;
wire [82:0] q2_0,q2_1,q2_2;
wire [82:0] q3_0,q3_1,q3_2;
wire [82:0] q4_0,q4_1,q4_2;
wire [74:0] q5_0,q5_1,q5_2;

assign q0_0[80:0] = {8'b0,s0_0[72:0]};
assign q0_1[80:0] = {7'b0,c0_0[72:0],1'b0};
assign q0_2[80:0] = {s0_1[74:0],6'b0};

assign q1_0[82:0] = {8'b0,c0_1[74:0]};
assign q1_1[82:0] = {1'b0,s0_2[74:0],7'b0};
assign q1_2[82:0] = {c0_2[74:0],8'b0};

assign q2_0[82:0] = {8'b0,s0_3[74:0]};
assign q2_1[82:0] = {7'b0,c0_3[74:0],1'b0};
assign q2_2[82:0] = {s0_4[74:0],8'b0};

assign q3_0[82:0] = {8'b0,c0_4[74:0]};
assign q3_1[82:0] = {1'b0,s0_5[74:0],7'b0};
assign q3_2[82:0] = {c0_5[74:0],8'b0};

assign q4_0[82:0] = {8'b0,s0_6[74:0]};
assign q4_1[82:0] = {7'b0,c0_6[74:0],1'b0};
assign q4_2[82:0] = {s0_7[74:0],8'b0};

assign q5_0[74:0] = c0_7[74:0];
assign q5_1[74:0] = {part_product32[65:0],h31[1:0],7'b0};
assign q5_2[74:0] = {{31{2'b10}},2'b0,h32[1:0],part_product33[63:55]};

wire [80:0] s1_0,c1_0;
wire [82:0] s1_1,c1_1;
wire [82:0] s1_2,c1_2;
wire [82:0] s1_3,c1_3;
wire [82:0] s1_4,c1_4;
wire [74:0] s1_5,c1_5;

compressor_32 #(81) x_comp1_0(.a (q0_0[80:0]), .b (q0_1[80:0]), .c (q0_2[80:0]), .s (s1_0[80:0]), .ca (c1_0[80:0]));  
compressor_32 #(83) x_comp1_1(.a (q1_0[82:0]), .b (q1_1[82:0]), .c (q1_2[82:0]), .s (s1_1[82:0]), .ca (c1_1[82:0]));      
compressor_32 #(83) x_comp1_2(.a (q2_0[82:0]), .b (q2_1[82:0]), .c (q2_2[82:0]), .s (s1_2[82:0]), .ca (c1_2[82:0]));        
compressor_32 #(83) x_comp1_3(.a (q3_0[82:0]), .b (q3_1[82:0]), .c (q3_2[82:0]), .s (s1_3[82:0]), .ca (c1_3[82:0]));        
compressor_32 #(83) x_comp1_4(.a (q4_0[82:0]), .b (q4_1[82:0]), .c (q4_2[82:0]), .s (s1_4[82:0]), .ca (c1_4[82:0]));        
compressor_32 #(75) x_comp1_5(.a (q5_0[74:0]), .b (q5_1[74:0]), .c (q5_2[74:0]), .s (s1_5[74:0]), .ca (c1_5[74:0]));  


reg [80:0] s0_reg,c0_reg;
reg [82:0] s1_reg,c1_reg;
reg [82:0] s2_reg,c2_reg;
reg [82:0] s3_reg,c3_reg;
reg [82:0] s4_reg,c4_reg;
reg [74:0] s5_reg,c5_reg;
reg [54:0] s6_reg;

always @(posedge pipe1_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    s0_reg[80:0] <= 81'b0;
    s1_reg[82:0] <= 83'b0;
    s2_reg[82:0] <= 83'b0;
    s3_reg[82:0] <= 83'b0;
    s4_reg[82:0] <= 83'b0;
    s5_reg[74:0] <= 75'b0;
    s6_reg[54:0] <= 55'b0;
    c0_reg[80:0] <= 81'b0;
    c1_reg[82:0] <= 83'b0;
    c2_reg[82:0] <= 83'b0;
    c3_reg[82:0] <= 83'b0;
    c4_reg[82:0] <= 83'b0;
    c5_reg[74:0] <= 75'b0;
  end
  else if(pipe1_down) begin
    s0_reg[80:0] <= s1_0[80:0];
    s1_reg[82:0] <= s1_1[82:0];
    s2_reg[82:0] <= s1_2[82:0];
    s3_reg[82:0] <= s1_3[82:0];
    s4_reg[82:0] <= s1_4[82:0];
    s5_reg[74:0] <= s1_5[74:0];
    s6_reg[54:0] <= part_product33[54:0];
    c0_reg[80:0] <= c1_0[80:0];
    c1_reg[82:0] <= c1_1[82:0];
    c2_reg[82:0] <= c1_2[82:0];
    c3_reg[82:0] <= c1_3[82:0];
    c4_reg[82:0] <= c1_4[82:0];
    c5_reg[74:0] <= c1_5[74:0];
  end
  else begin
    s0_reg[80:0] <= s0_reg[80:0];
    s1_reg[82:0] <= s1_reg[82:0];
    s2_reg[82:0] <= s2_reg[82:0];
    s3_reg[82:0] <= s3_reg[82:0];
    s4_reg[82:0] <= s4_reg[82:0];
    s5_reg[74:0] <= s5_reg[74:0];
    s6_reg[54:0] <= s6_reg[54:0];
    c0_reg[80:0] <= c0_reg[80:0];
    c1_reg[82:0] <= c1_reg[82:0];
    c2_reg[82:0] <= c2_reg[82:0];
    c3_reg[82:0] <= c3_reg[82:0];
    c4_reg[82:0] <= c4_reg[82:0];
    c5_reg[74:0] <= c5_reg[74:0];
  end
end

//----------------------------------------------------------
//                    L3 compressor
//----------------------------------------------------------
// third level compressor:
// components: 3 4:2 compressor
// result: 12 partial products -> 6 paritial products
wire [90:0] r0_0,r0_1,r0_2,r0_3,r0_cin,cout2_0;
wire [92:0] r1_0,r1_1,r1_2,r1_3,r1_cin,cout2_1;
wire [83:0] r2_0,r2_1,r2_2,r2_3,r2_cin,cout2_2;

assign r0_0[90:0]   = {10'b0,s0_reg[80:0]};
assign r0_1[90:0]   = {9'b0,c0_reg[80:0],1'b0};
assign r0_2[90:0]   = {1'b0,s1_reg[82:0],7'b0};
assign r0_3[90:0]   = {c1_reg[82:0],8'b0};
assign r0_cin[90:0] = {cout2_0[89:0],1'b0};

assign r1_0[92:0]   = {10'b0,s2_reg[82:0]};
assign r1_1[92:0]   = {9'b0,c2_reg[82:0],1'b0};
assign r1_2[92:0]   = {1'b0,s3_reg[82:0],9'b0};
assign r1_3[92:0]   = {c3_reg[82:0],10'b0};
assign r1_cin[92:0] = {cout2_1[91:0],1'b0};

assign r2_0[83:0]   = {1'b0,s4_reg[82:0]};
assign r2_1[83:0]   = {c4_reg[82:0],1'b0};
assign r2_2[83:0]   = {s5_reg[74:0],9'b0};
assign r2_3[83:0]   = {c5_reg[73:0],1'b0,s6_reg[54:46]};
assign r2_cin[83:0] = {cout2_2[82:0],1'b0};

wire [90:0] s2_0,c2_0;
wire [92:0] s2_1,c2_1;
wire [83:0] s2_2,c2_2;

compressor_42 #(91) x_comp2_0(.p0   (r0_0[90:0]), 
                            .p1   (r0_1[90:0]),
                            .p2   (r0_2[90:0]), 
                            .p3   (r0_3[90:0]),
                            .cin  (r0_cin[90:0]),
                            .s    (s2_0[90:0]), 
                            .ca   (c2_0[90:0]),
                            .cout (cout2_0[90:0]));

compressor_42 #(93) x_comp2_1(.p0   (r1_0[92:0]), 
                            .p1   (r1_1[92:0]),
                            .p2   (r1_2[92:0]), 
                            .p3   (r1_3[92:0]),
                            .cin  (r1_cin[92:0]),
                            .s    (s2_1[92:0]), 
                            .ca   (c2_1[92:0]),
                            .cout (cout2_1[92:0]));

compressor_42 #(84) x_comp2_2(.p0   (r2_0[83:0]), 
                            .p1   (r2_1[83:0]),
                            .p2   (r2_2[83:0]), 
                            .p3   (r2_3[83:0]),
                            .cin  (r2_cin[83:0]),
                            .s    (s2_2[83:0]), 
                            .ca   (c2_2[83:0]),
                            .cout (cout2_2[83:0]));

//----------------------------------------------------------
//                    L4 compressor
//----------------------------------------------------------
// forth level compressor:
// components: 2 3:2 compressor
// result: 6 partial products -> 4 paritial products
wire [114:0] t0_0,t0_1,t0_2;
wire [106:0] t1_0,t1_1,t1_2;

assign t0_0[114:0] = {24'b0,s2_0[90:0]};
assign t0_1[114:0] = {23'b0,c2_0[90:0],1'b0};
assign t0_2[114:0] = {s2_1[92:0],22'b0};

assign t1_0[106:0] = {14'b0,c2_1[92:0]};
assign t1_1[106:0] = {s2_2[83:0],23'b0};
assign t1_2[106:0] = {c2_2[82:0],1'b0,s6_reg[45:23]};

wire [114:0] s3_0,c3_0;
wire [106:0] s3_1,c3_1;
compressor_32 #(115) x_comp3_0(.a (t0_0[114:0]), .b (t0_1[114:0]), .c (t0_2[114:0]), .s (s3_0[114:0]), .ca (c3_0[114:0]));  
compressor_32 #(107) x_comp3_1(.a (t1_0[106:0]), .b (t1_1[106:0]), .c (t1_2[106:0]), .s (s3_1[106:0]), .ca (c3_1[106:0]));  


//----------------------------------------------------------
//                    L5 compressor
//----------------------------------------------------------
// fifth level compressor:
// components: 1 4:2 compressor
// result: 4 partial products -> 2 paritial products
wire [129:0] v0_0,v0_1,v0_2,v0_3,v0_cin,cout4_0;

assign v0_0[129:0]   = {15'b0, s3_0[114:0]};
assign v0_1[129:0]   = {14'b0, c3_0[114:0],1'b0};
assign v0_2[129:0]   = {       s3_1[106:0],23'b0};
assign v0_3[129:0]   = {       c3_1[105:0],1'b0,s6_reg[22:0]};
assign v0_cin[129:0] = {       cout4_0[128:0],1'b0};

wire [129:0] s4_0,c4_0;
compressor_42 #(130) x_comp4_1(.p0  (v0_0[129:0]), 
                            .p1   (v0_1[129:0]),
                            .p2   (v0_2[129:0]), 
                            .p3   (v0_3[129:0]),
                            .cin  (v0_cin[129:0]),
                            .s    (s4_0[129:0]), 
                            .ca   (c4_0[129:0]),
                            .cout (cout4_0[129:0]));

reg [129:0] sum,carry;
reg [63:0]  addend_reg;

always @(posedge pipe2_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    sum[129:0]       <= 130'b0;
    carry[129:0]     <= 130'b0;
    addend_reg[63:0] <= 64'b0;
  end
  else if(pipe2_down) begin
    sum[129:0]       <= s4_0[129:0];
    carry[129:0]     <= c4_0[129:0];
    addend_reg[63:0] <= addend[63:0];
  end
  else begin
    sum[129:0]       <= sum[129:0];
    carry[129:0]     <= carry[129:0];
    addend_reg[63:0] <= addend_reg[63:0];
  end
end

//----------------------------------------------------------
//                    L6 compressor
//----------------------------------------------------------
// sixth level compressor:
// components: 1 3:2 compressor
// result: 3 partial products -> 2 paritial products
wire [63:0]  w0_0,w0_1,w0_2;
wire [63:0]  s5_0,c5_0;

assign w0_0[63:0] = sum[63:0]; 
assign w0_1[63:0] = {carry[62:0],1'b0};
assign w0_2[63:0] = addend_reg[63:0];

compressor_32 #(64) x_comp5_0(
  .a  (w0_0[63:0]), 
  .b  (w0_1[63:0]), 
  .c  (w0_2[63:0]), 
  .s  (s5_0[63:0]), 
  .ca (c5_0[63:0]));  

wire [129:0] product_mult;
wire [63:0]  product_mult_add;

assign product_mult[129:0]    = sum[129:0] + {carry[128:0],1'b0};
assign product_mult_add[63:0] = s5_0[63:0] + {c5_0[62:0],1'b0};

//final result:
//mult_add: only low 64-bit result is valid
//mult: all 129 bit is valid,
assign product[129:0] = {product_mult[129:64],product_mult_add[63:0]};

endmodule

