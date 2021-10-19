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
module ct_vfmau_mult_compressor(
  carry,
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  dp_xx_ex1_double,
  dp_xx_ex1_half,
  dp_xx_ex1_single,
  forever_cpuclk,
  mult1_ex1_op0_half0_hidden_bit,
  mult1_ex1_op0_hidden_bit,
  mult1_ex1_op1_half0_hidden_bit,
  mult1_ex1_op1_hidden_bit,
  op0_frac,
  op1_frac,
  pad_yy_icg_scan_en,
  pipe_down,
  simd_half0_product,
  sum
);

// &Ports; @32
input            cp0_vfpu_icg_en;               
input            cp0_yy_clk_en;                 
input            dp_xx_ex1_double;              
input            dp_xx_ex1_half;                
input            dp_xx_ex1_single;              
input            forever_cpuclk;                
input            mult1_ex1_op0_half0_hidden_bit; 
input            mult1_ex1_op0_hidden_bit;      
input            mult1_ex1_op1_half0_hidden_bit; 
input            mult1_ex1_op1_hidden_bit;      
input   [51 :0]  op0_frac;                      
input   [51 :0]  op1_frac;                      
input            pad_yy_icg_scan_en;            
input            pipe_down;                     
output  [105:0]  carry;                         
output  [21 :0]  simd_half0_product;            
output  [105:0]  sum;                           

// &Regs; @33
reg     [79 :0]  c0_reg;                        
reg     [81 :0]  c1_reg;                        
reg     [67 :0]  c2_reg;                        
reg     [79 :0]  s0_reg;                        
reg     [81 :0]  s1_reg;                        
reg     [67 :0]  s2_reg;                        

// &Wires; @34
wire    [61 :0]  c0_0;                          
wire    [63 :0]  c0_1;                          
wire    [63 :0]  c0_2;                          
wire    [63 :0]  c0_3;                          
wire    [63 :0]  c0_4;                          
wire    [63 :0]  c0_5;                          
wire    [59 :0]  c0_6;                          
wire    [15 :0]  c0_7;                          
wire    [69 :0]  c1_0;                          
wire    [71 :0]  c1_1;                          
wire    [71 :0]  c1_2;                          
wire    [71 :0]  c1_3;                          
wire    [59 :0]  c1_4;                          
wire    [21 :0]  c1_5;                          
wire    [79 :0]  c2_0;                          
wire    [81 :0]  c2_1;                          
wire    [67 :0]  c2_2;                          
wire    [103:0]  c3_0;                          
wire    [67 :0]  c3_1;                          
wire    [105:0]  c4_0;                          
wire    [105:0]  carry;                         
wire             compresor_ex1_ex2_pipe_clk;    
wire             compressor_ex1_ex2_pipedown;   
wire    [61 :0]  cout0_0;                       
wire    [63 :0]  cout0_1;                       
wire    [63 :0]  cout0_2;                       
wire    [63 :0]  cout0_3;                       
wire    [63 :0]  cout0_4;                       
wire    [63 :0]  cout0_5;                       
wire    [15 :0]  cout0_7;                       
wire    [59 :0]  cout1_4;                       
wire    [21 :0]  cout1_5;                       
wire    [79 :0]  cout2_0;                       
wire    [81 :0]  cout2_1;                       
wire    [105:0]  cout4_0;                       
wire             cp0_vfpu_icg_en;               
wire             cp0_yy_clk_en;                 
wire             dp_xx_ex1_double;              
wire             dp_xx_ex1_half;                
wire             dp_xx_ex1_single;              
wire             forever_cpuclk;                
wire    [1  :0]  h0;                            
wire    [1  :0]  h1;                            
wire    [1  :0]  h10;                           
wire    [1  :0]  h11;                           
wire    [1  :0]  h12;                           
wire    [1  :0]  h13;                           
wire    [1  :0]  h14;                           
wire    [1  :0]  h15;                           
wire    [1  :0]  h16;                           
wire    [1  :0]  h17;                           
wire    [1  :0]  h18;                           
wire    [1  :0]  h19;                           
wire    [1  :0]  h2;                            
wire    [1  :0]  h20;                           
wire    [1  :0]  h21;                           
wire    [1  :0]  h22;                           
wire    [1  :0]  h23;                           
wire    [1  :0]  h24;                           
wire    [1  :0]  h25;                           
wire    [1  :0]  h26;                           
wire    [1  :0]  h26_data;                      
wire    [1  :0]  h3;                            
wire    [1  :0]  h4;                            
wire    [1  :0]  h5;                            
wire    [1  :0]  h6;                            
wire    [1  :0]  h7;                            
wire    [1  :0]  h8;                            
wire    [1  :0]  h9;                            
wire             mult1_ex1_op0_half0_hidden_bit; 
wire             mult1_ex1_op0_hidden_bit;      
wire             mult1_ex1_op1_half0_hidden_bit; 
wire             mult1_ex1_op1_hidden_bit;      
wire    [53 :0]  multiplicand;                  
wire    [53 :0]  multiplier;                    
wire    [2  :0]  multiplier_code0;              
wire    [51 :0]  op0_frac;                      
wire             op0_frac_half0_hidden;         
wire             op0_frac_hidden;               
wire    [51 :0]  op1_frac;                      
wire             op1_frac_half0_hidden;         
wire             op1_frac_hidden;               
wire             oper_doub;                     
wire             oper_half;                     
wire             oper_half0_norm;               
wire             oper_norm;                     
wire             oper_sing;                     
wire    [61 :0]  p0_0;                          
wire    [61 :0]  p0_1;                          
wire    [61 :0]  p0_2;                          
wire    [61 :0]  p0_3;                          
wire    [61 :0]  p0_cin;                        
wire    [63 :0]  p1_0;                          
wire    [63 :0]  p1_1;                          
wire    [63 :0]  p1_2;                          
wire    [63 :0]  p1_3;                          
wire    [63 :0]  p1_cin;                        
wire    [63 :0]  p2_0;                          
wire    [63 :0]  p2_1;                          
wire    [63 :0]  p2_2;                          
wire    [63 :0]  p2_3;                          
wire    [63 :0]  p2_cin;                        
wire    [63 :0]  p3_0;                          
wire    [63 :0]  p3_1;                          
wire    [63 :0]  p3_2;                          
wire    [63 :0]  p3_3;                          
wire    [63 :0]  p3_cin;                        
wire    [63 :0]  p4_0;                          
wire    [63 :0]  p4_1;                          
wire    [63 :0]  p4_2;                          
wire    [63 :0]  p4_3;                          
wire    [63 :0]  p4_cin;                        
wire    [63 :0]  p5_0;                          
wire    [63 :0]  p5_1;                          
wire    [63 :0]  p5_2;                          
wire    [63 :0]  p5_3;                          
wire    [63 :0]  p5_cin;                        
wire    [59 :0]  p6_0;                          
wire    [59 :0]  p6_1;                          
wire    [59 :0]  p6_2;                          
wire    [15 :0]  p7_0;                          
wire    [15 :0]  p7_1;                          
wire    [15 :0]  p7_2;                          
wire    [15 :0]  p7_3;                          
wire    [15 :0]  p7_cin;                        
wire             pad_yy_icg_scan_en;            
wire    [53 :0]  part_product0;                 
wire    [53 :0]  part_product1;                 
wire    [53 :0]  part_product10;                
wire    [53 :0]  part_product11;                
wire    [53 :0]  part_product12;                
wire    [53 :0]  part_product13;                
wire    [53 :0]  part_product14;                
wire    [53 :0]  part_product15;                
wire    [53 :0]  part_product16;                
wire    [53 :0]  part_product17;                
wire    [53 :0]  part_product18;                
wire    [53 :0]  part_product19;                
wire    [53 :0]  part_product2;                 
wire    [53 :0]  part_product20;                
wire    [53 :0]  part_product21;                
wire    [53 :0]  part_product22;                
wire    [53 :0]  part_product23;                
wire    [53 :0]  part_product24;                
wire    [53 :0]  part_product25;                
wire    [53 :0]  part_product26;                
wire    [53 :0]  part_product3;                 
wire    [51 :0]  part_product30;                
wire    [51 :0]  part_product31;                
wire    [9  :0]  part_product38;                
wire    [9  :0]  part_product39;                
wire    [53 :0]  part_product4;                 
wire    [53 :0]  part_product5;                 
wire    [53 :0]  part_product6;                 
wire    [53 :0]  part_product7;                 
wire    [53 :0]  part_product8;                 
wire    [53 :0]  part_product9;                 
wire             pipe_down;                     
wire    [69 :0]  q0_0;                          
wire    [69 :0]  q0_1;                          
wire    [69 :0]  q0_2;                          
wire    [71 :0]  q1_0;                          
wire    [71 :0]  q1_1;                          
wire    [71 :0]  q1_2;                          
wire    [71 :0]  q2_0;                          
wire    [71 :0]  q2_1;                          
wire    [71 :0]  q2_2;                          
wire    [71 :0]  q3_0;                          
wire    [71 :0]  q3_1;                          
wire    [71 :0]  q3_2;                          
wire    [59 :0]  q4_0;                          
wire    [59 :0]  q4_1;                          
wire    [59 :0]  q4_2;                          
wire    [59 :0]  q4_3;                          
wire    [59 :0]  q4_cin;                        
wire    [21 :0]  q5_0;                          
wire    [21 :0]  q5_1;                          
wire    [21 :0]  q5_2;                          
wire    [21 :0]  q5_3;                          
wire    [21 :0]  q5_cin;                        
wire    [79 :0]  r0_0;                          
wire    [79 :0]  r0_1;                          
wire    [79 :0]  r0_2;                          
wire    [79 :0]  r0_3;                          
wire    [79 :0]  r0_cin;                        
wire    [81 :0]  r1_0;                          
wire    [81 :0]  r1_1;                          
wire    [81 :0]  r1_2;                          
wire    [81 :0]  r1_3;                          
wire    [81 :0]  r1_cin;                        
wire    [61 :0]  s0_0;                          
wire    [63 :0]  s0_1;                          
wire    [63 :0]  s0_2;                          
wire    [63 :0]  s0_3;                          
wire    [63 :0]  s0_4;                          
wire    [63 :0]  s0_5;                          
wire    [59 :0]  s0_6;                          
wire    [15 :0]  s0_7;                          
wire    [69 :0]  s1_0;                          
wire    [71 :0]  s1_1;                          
wire    [71 :0]  s1_2;                          
wire    [71 :0]  s1_3;                          
wire    [59 :0]  s1_4;                          
wire    [21 :0]  s1_5;                          
wire    [79 :0]  s2_0;                          
wire    [81 :0]  s2_1;                          
wire    [67 :0]  s2_2;                          
wire    [103:0]  s3_0;                          
wire    [67 :0]  s3_1;                          
wire    [105:0]  s4_0;                          
wire    [26 :0]  sign_not;                      
wire    [21 :0]  simd_half0_product;            
wire    [105:0]  sum;                           
wire    [103:0]  v0_0;                          
wire    [103:0]  v0_1;                          
wire    [103:0]  v0_2;                          
wire    [67 :0]  v1_0;                          
wire    [67 :0]  v1_1;                          
wire    [67 :0]  v1_2;                          
wire    [105:0]  w0_0;                          
wire    [105:0]  w0_1;                          
wire    [105:0]  w0_2;                          
wire    [105:0]  w0_3;                          
wire    [105:0]  w0_cin;                        

// &Depend("compressor_32.v"); @35
// &Depend("compressor_42.v"); @36
// &Depend("booth_code_v1.v"); @37

//data preparation
assign oper_doub = dp_xx_ex1_double;
assign oper_sing = dp_xx_ex1_single;
assign oper_half = dp_xx_ex1_half;

assign op0_frac_hidden = mult1_ex1_op0_hidden_bit;
assign op1_frac_hidden = mult1_ex1_op1_hidden_bit;

assign op0_frac_half0_hidden = mult1_ex1_op0_half0_hidden_bit;
assign op1_frac_half0_hidden = mult1_ex1_op1_half0_hidden_bit;

//data arrangement
// scalar double : 51:0
// scalar single : 22:0
// scalar half   : 9 :0
assign multiplicand[53:0] = {2'b0,op0_frac[51:0]};
assign multiplier[53:0]   = {2'b0,op1_frac[51:0]};

assign multiplier_code0[2:0] = {multiplier[1:0],1'b0};
//==========================================================
//                     EX1 stage 
//==========================================================
//----------------------------------------------------------
//                    booth code
//----------------------------------------------------------
//use booth code to generate 27 partial products
//&Instance('#53',"booth_code","x_booth_code0");  
booth_code_v1 #(53) x_booth_code0(
         .A         (multiplicand[52:0]   ),   
         .code      (multiplier_code0[2:0]),   
         .product   (part_product0[53:0]  ), 
         .h         (h0                   ), 
         .sn        (sign_not[0]         )); 

booth_code_v1 #(53) x_booth_code1(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[ 3: 1]   ),  
         .product   (part_product1[53:0] ), 
         .h         (h1                  ), 
         .sn        (sign_not[1]         ));
       
booth_code_v1 #(53) x_booth_code2(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[ 5: 3]   ),  
         .product   (part_product2[53:0] ), 
         .h         (h2                  ),    
         .sn        (sign_not[2])        );

booth_code_v1 #(53) x_booth_code3(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[ 7: 5]   ),  
         .product   (part_product3[53:0] ), 
         .h         (h3                  ),    
         .sn        (sign_not[3])        );

booth_code_v1 #(53) x_booth_code4(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[9: 7]    ),  
         .product   (part_product4[53:0] ), 
         .h         (h4                  ),    
         .sn        (sign_not[4])        );

booth_code_v1 #(53) x_booth_code5(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[11: 9]   ),  
         .product   (part_product5[53:0] ), 
         .h         (h5                  ),    
         .sn        (sign_not[5]         ));

booth_code_v1 #(53) x_booth_code6(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[13: 11]  ),  
         .product   (part_product6[53:0] ), 
         .h         (h6                  ),    
         .sn        (sign_not[6])        );

booth_code_v1 #(53) x_booth_code7(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[15: 13]  ),  
         .product   (part_product7[53:0] ), 
         .h         (h7                  ),    
         .sn        (sign_not[7])        );

booth_code_v1 #(53) x_booth_code8(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[17: 15]  ),  
         .product   (part_product8[53:0] ), 
         .h         (h8                  ),    
         .sn        (sign_not[8])        );

booth_code_v1 #(53) x_booth_code9(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[19: 17]  ),  
         .product   (part_product9[53:0] ), 
         .h         (h9                  ),    
         .sn        (sign_not[9])        );

booth_code_v1 #(53) x_booth_code10(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[21: 19]  ),  
         .product   (part_product10[53:0]), 
         .h         (h10                 ),    
         .sn        (sign_not[10])       );

booth_code_v1 #(53) x_booth_code11(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[23: 21]  ),  
         .product   (part_product11[53:0]), 
         .h         (h11                 ),    
         .sn        (sign_not[11])       );

booth_code_v1 #(53) x_booth_code12(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[25: 23]  ),  
         .product   (part_product12[53:0]), 
         .h         (h12                 ),    
         .sn        (sign_not[12])       );

booth_code_v1 #(53) x_booth_code13(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[27: 25]  ),  
         .product   (part_product13[53:0]), 
         .h         (h13                 ),    
         .sn        (sign_not[13])       );

booth_code_v1 #(53) x_booth_code14(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[29: 27]  ),  
         .product   (part_product14[53:0]), 
         .h         (h14                 ),    
         .sn        (sign_not[14])       );

booth_code_v1 #(53) x_booth_code15(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[31: 29]  ),  
         .product   (part_product15[53:0]), 
         .h         (h15                 ),    
         .sn        (sign_not[15])       );

booth_code_v1 #(53) x_booth_code16(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[33: 31]  ),  
         .product   (part_product16[53:0]), 
         .h         (h16                 ),    
         .sn        (sign_not[16])       );

booth_code_v1 #(53) x_booth_code17(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[35: 33]  ),  
         .product   (part_product17[53:0]), 
         .h         (h17                 ),    
         .sn        (sign_not[17])       );
booth_code_v1 #(53) x_booth_code18(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[37: 35]  ),  
         .product   (part_product18[53:0]), 
         .h         (h18                 ),    
         .sn        (sign_not[18])       );
booth_code_v1 #(53) x_booth_code19(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[39: 37]  ),  
         .product   (part_product19[53:0]), 
         .h         (h19                 ),    
         .sn        (sign_not[19])       );

booth_code_v1 #(53) x_booth_code20(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[41: 39]  ),  
         .product   (part_product20[53:0]), 
         .h         (h20                 ),    
         .sn        (sign_not[20])       );

booth_code_v1 #(53) x_booth_code21(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[43: 41]  ),  
         .product   (part_product21[53:0]), 
         .h         (h21                 ),    
         .sn        (sign_not[21])       );

booth_code_v1 #(53) x_booth_code22(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[45: 43]  ),  
         .product   (part_product22[53:0]), 
         .h         (h22                 ),    
         .sn        (sign_not[22])       );

booth_code_v1 #(53) x_booth_code23(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[47: 45]  ),  
         .product   (part_product23[53:0]), 
         .h         (h23                 ),    
         .sn        (sign_not[23])       );

booth_code_v1 #(53) x_booth_code24(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[49: 47]  ),  
         .product   (part_product24[53:0]), 
         .h         (h24                 ),    
         .sn        (sign_not[24])       );

booth_code_v1 #(53) x_booth_code25(
         .A         (multiplicand[52:0]  ),
         .code      (multiplier[51: 49]  ),  
         .product   (part_product25[53:0]), 
         .h         (h25                 ),    
         .sn        (sign_not[25])       );

booth_code_v1 #(53) x_booth_code26(
         .A         (multiplicand[52:0]     ),
         .code      (multiplier[53: 51]     ),  
         .product   (part_product26[53:0]   ), 
         .h         (h26                    ),    
         .sn        (sign_not[26])          );

assign h26_data[1:0] = h26[1:0];
// &Force("nonport","multiplicand"); @254
// &Force("nonport","part_product0"); @255
// &Force("nonport","part_product1"); @256
// &Force("nonport","part_product2"); @257
// &Force("nonport","part_product3"); @258
// &Force("nonport","part_product4"); @259
// &Force("nonport","part_product5"); @260
// &Force("nonport","part_product6"); @261
// &Force("nonport","part_product7"); @262
// &Force("nonport","part_product8"); @263
// &Force("nonport","part_product9"); @264
// &Force("nonport","part_product10"); @265
// &Force("nonport","part_product11"); @266
// &Force("nonport","part_product12"); @267
// &Force("nonport","part_product13"); @268
// &Force("nonport","part_product14"); @269
// &Force("nonport","part_product15"); @270
// &Force("nonport","part_product16"); @271
// &Force("nonport","part_product17"); @272
// &Force("nonport","part_product18"); @273
// &Force("nonport","part_product19"); @274
// &Force("nonport","part_product20"); @275
// &Force("nonport","part_product21"); @276
// &Force("nonport","part_product22"); @277
// &Force("nonport","part_product23"); @278
// &Force("nonport","part_product24"); @279
// &Force("nonport","part_product25"); @280
// &Force("nonport","part_product26"); @281
// &Force("nonport","h0"); @282
// &Force("nonport","h1"); @283
// &Force("nonport","h2"); @284
// &Force("nonport","h3"); @285
// &Force("nonport","h4"); @286
// &Force("nonport","h5"); @287
// &Force("nonport","h6"); @288
// &Force("nonport","h7"); @289
// &Force("nonport","h8"); @290
// &Force("nonport","h9"); @291
// &Force("nonport","h10"); @292
// &Force("nonport","h11"); @293
// &Force("nonport","h12"); @294
// &Force("nonport","h13"); @295
// &Force("nonport","h14"); @296
// &Force("nonport","h15"); @297
// &Force("nonport","h16"); @298
// &Force("nonport","h17"); @299
// &Force("nonport","h18"); @300
// &Force("nonport","h19"); @301
// &Force("nonport","h20"); @302
// &Force("nonport","h21"); @303
// &Force("nonport","h22"); @304
// &Force("nonport","h23"); @305
// &Force("nonport","h24"); @306
// &Force("nonport","h25"); @307
// &Force("nonport","h26"); @308
// &Force("nonport","h26_data"); @309
// &Force("nonport","sign_not"); @310
// &Force("nonport","multiplier_code0"); @311


//for denormal input:
//double
assign part_product30[51:0] = (op0_frac_hidden) ? op1_frac[51:0] : 52'b0;
assign part_product31[51:0] = (op1_frac_hidden) ? op0_frac[51:0] : 52'b0;
assign oper_norm            = op0_frac_hidden  && op1_frac_hidden;

//half simd0
assign part_product38[9:0]  = (op0_frac_half0_hidden) ? op1_frac[9:0] : 10'b0;
assign part_product39[9:0]  = (op1_frac_half0_hidden) ? op0_frac[9:0] : 10'b0;
assign oper_half0_norm      = op0_frac_half0_hidden && op1_frac_half0_hidden;

//the compressor for each type multiply are:
//1. scalar double/single:
//   EX1 : 4:2 compressor -> 3:2 compressor -> 4:2 compressor
//   EX2 : 3:2 compressor -> 4:2 compressor

//3. scalar half:
//   EX1 : 4:2 compressor -> 4:2 compressor
//   EX2 : add
  
//----------------------------------------------------------
//                    L1 compressor
//----------------------------------------------------------
// first level compressor:
// components: 11 4:2 compressor
//------------------------- P0 ----------------------------------------
assign p0_0[12:0]  = part_product0[12:0];
assign p0_0[15:13] = (oper_half) ? {sign_not[0],{2{!sign_not[0]}}} : part_product0[15:13];
assign p0_0[24:16] = {9{!oper_half}} & part_product0[24:16];
assign p0_0[27:25] = (oper_sing) ? {sign_not[0],{2{!sign_not[0]}}} : part_product0[27:25];
assign p0_0[53:28] = {26{oper_doub}} & part_product0[53:28];
assign p0_0[56:54] = {3{oper_doub}}  & {sign_not[0],{2{!sign_not[0]}}};
assign p0_0[61:57] = 5'b0;

assign p0_1[14:0]  = {part_product1[12:0],h0[1:0]};
assign p0_1[16:15] = (oper_half) ? {1'b1,sign_not[1]} : part_product1[14:13];
assign p0_1[26:17] = {10{!oper_half}} & part_product1[24:15];
assign p0_1[28:27] = (oper_sing) ? {1'b1,sign_not[1]} : part_product1[26:25];
assign p0_1[55:29] = {27{oper_doub}}  & part_product1[53:27];
assign p0_1[57:56] = {2{oper_doub}}   & {1'b1,sign_not[1]};
assign p0_1[61:58] = 4'b0;

assign p0_2[16:0]  = {part_product2[12:0],h1[1:0],2'b0};
assign p0_2[18:17] = (oper_half) ? {1'b1,sign_not[2]} : part_product2[14:13];
assign p0_2[28:19] = {10{!oper_half}} & part_product2[24:15];
assign p0_2[30:29] = (oper_sing) ? {1'b1,sign_not[2]} : part_product2[26:25];
assign p0_2[57:31] = {27{oper_doub}}  & part_product2[53:27];
assign p0_2[59:58] = {2{oper_doub}}   & {1'b1,sign_not[2]};
assign p0_2[61:60] = 2'b0;

assign p0_3[18:0]  = {part_product3[12:0],h2[1:0],4'b0};
assign p0_3[20:19] = (oper_half) ? {1'b1,sign_not[3]} : part_product3[14:13];
assign p0_3[30:21] = {10{!oper_half}} & part_product3[24:15];
assign p0_3[32:31] = (oper_sing) ? {1'b1,sign_not[3]} : part_product3[26:25];
assign p0_3[59:33] = {27{oper_doub}}  & part_product3[53:27];
assign p0_3[61:60] = {2{oper_doub}}   & {1'b1,sign_not[3]};

assign p0_cin[61:0] = {cout0_0[60:0],1'b0};

//------------------------- P1 ---------------------------------------
assign p1_0[14:0]  = {part_product4[12:0],h3[1:0]};
assign p1_0[16:15] = (oper_half) ? {1'b1,sign_not[4]} : part_product4[14:13];
assign p1_0[26:17] = {10{!oper_half}} & part_product4[24:15];
assign p1_0[28:27] = (oper_sing) ? {1'b1,sign_not[4]} : part_product4[26:25];
assign p1_0[55:29] = {27{oper_doub}}  & part_product4[53:27];
assign p1_0[57:56] = {2{oper_doub}}   & {1'b1,sign_not[4]};
assign p1_0[63:58] = 6'b0;

assign p1_1[16:0]  = {part_product5[12:0],h4[1:0],2'b0};
assign p1_1[18:17] = (oper_half) ? {1'b1,sign_not[5]} : part_product5[14:13];
assign p1_1[28:19] = {10{!oper_half}} & part_product5[24:15];
assign p1_1[30:29] = (oper_sing) ? {1'b1,sign_not[5]} : part_product5[26:25];
assign p1_1[57:31] = {27{oper_doub}}  & part_product5[53:27];
assign p1_1[59:58] = {2{oper_doub}}   & {1'b1,sign_not[5]};
assign p1_1[63:60] = 4'b0;

assign p1_2[30:0]  = {part_product6[24:0],h5[1:0],4'b0};
assign p1_2[32:31] = (oper_sing) ? {1'b1,sign_not[6]} : part_product6[26:25];
assign p1_2[59:33] = {27{oper_doub}}  & part_product6[53:27];
assign p1_2[61:60] = {2{oper_doub}}   & {1'b1,sign_not[6]};
assign p1_2[63:62] = 2'b0;

assign p1_3[32:0]  = {part_product7[24:0],h6[1:0],6'b0};
assign p1_3[34:33] = (oper_sing) ? {1'b1,sign_not[7]} : part_product7[26:25];
assign p1_3[61:35] = {27{oper_doub}}  & part_product7[53:27];
assign p1_3[63:62] = {2{oper_doub}}   & {1'b1,sign_not[7]};

assign p1_cin[63:0] = {cout0_1[62:0],1'b0};

//------------------------- P2 ---------------------------------------
assign p2_0[26:0]  = {part_product8[24:0],h7[1:0]};
assign p2_0[28:27] = (oper_sing) ? {1'b1,sign_not[8]} : part_product8[26:25];
assign p2_0[55:29] = {27{oper_doub}}  & part_product8[53:27];
assign p2_0[57:56] = {2{oper_doub}}   & {1'b1,sign_not[8]};
assign p2_0[63:58] = 6'b0;

assign p2_1[28:0]  = {part_product9[24:0],h8[1:0],2'b0};
assign p2_1[30:29] = (oper_sing) ? {1'b1,sign_not[9]} : part_product9[26:25];
assign p2_1[57:31] = {27{oper_doub}}  & part_product9[53:27];
assign p2_1[59:58] = {2{oper_doub}}   & {1'b1,sign_not[9]};
assign p2_1[63:60] = 4'b0;

assign p2_2[30:0]  = {part_product10[24:0],h9[1:0],4'b0};
assign p2_2[32:31] = (oper_sing) ? {1'b1,sign_not[10]} : part_product10[26:25];
assign p2_2[59:33] = {27{oper_doub}}  & part_product10[53:27];
assign p2_2[61:60] = {2{oper_doub}}   & {1'b1,sign_not[10]};
assign p2_2[63:62] = 2'b0;

assign p2_3[32:0]  = {part_product11[24:0],h10[1:0],6'b0};
assign p2_3[34:33] = (oper_sing) ? {1'b1,sign_not[11]} : part_product11[26:25];
assign p2_3[61:35] = {27{oper_doub}}  & part_product11[53:27];
assign p2_3[63:62] = {2{oper_doub}}   & {1'b1,sign_not[11]};

assign p2_cin[63:0] = {cout0_2[62:0],1'b0};
//------------------------- P3 ---------------------------------------
assign p3_0[26:0]  = {part_product12[24:0],h11[1:0]};
assign p3_0[28:27] = (oper_sing) ? {1'b1,sign_not[12]} : part_product12[26:25];
assign p3_0[30:29] = {2{!oper_sing}}  & part_product12[28:27]; 
assign p3_0[55:31] = {25{oper_doub}}  & part_product12[53:29];
assign p3_0[57:56] = {2{oper_doub}}   & {1'b1,sign_not[12]};
assign p3_0[63:58] = 6'b0;

assign p3_1[28:0]  = {part_product13[24:0],h12[1:0],2'b0};
assign p3_1[30:29] = (oper_sing) ? {1'b1,sign_not[13]} : part_product13[26:25];
assign p3_1[57:31] = {27{oper_doub}}  & part_product13[53:27];
assign p3_1[59:58] = {2{oper_doub}}   & {1'b1,sign_not[13]};
assign p3_1[63:60] = 4'b0;

assign p3_2[63:0]  = {2'b0,1'b1,sign_not[14],part_product14[53:0],h13[1:0],4'b0};
assign p3_3[63:0]  = {1'b1,sign_not[15],part_product15[53:0],h14[1:0],6'b0};
assign p3_cin[63:0]= {cout0_3[62:0],1'b0};

//------------------------- P4 ---------------------------------------
assign p4_0[63:0]  = {6'b0,1'b1,sign_not[16],part_product16[53:0],h15[1:0]};
assign p4_1[63:0]  = {4'b0,1'b1,sign_not[17],part_product17[53:0],h16[1:0],2'b0}; 
assign p4_2[63:0]  = {2'b0,1'b1,sign_not[18],part_product18[53:0],h17[1:0],4'b0};
assign p4_3[63:0]  = {     1'b1,sign_not[19],part_product19[53:0],h18[1:0],6'b0};
assign p4_cin[63:0]= {cout0_4[62:0],1'b0};

//------------------------- P5 ---------------------------------------
assign p5_0[63:0]  = {6'b0,1'b1,sign_not[20],part_product20[53:0],h19[1:0]};
assign p5_1[63:0]  = {4'b0,1'b1,sign_not[21],part_product21[53:0],h20[1:0],2'b0};
assign p5_2[63:0]  = {2'b0,1'b1,sign_not[22],part_product22[53:0],h21[1:0],4'b0};
assign p5_3[63:0]  = {     1'b1,sign_not[23],part_product23[53:0],h22[1:0],6'b0};
assign p5_cin[63:0] = {cout0_5[62:0],1'b0};

//------------------------- P6 ---------------------------------------
assign p6_0[59:0]  = {2'b0,1'b1,sign_not[24],part_product24[53:0],h23[1:0]};
assign p6_1[59:0]  = {     1'b1,sign_not[25],part_product25[53:0],h24[1:0],2'b0};
assign p6_2[59:0]  = {                       part_product26[53:0],h25[1:0],4'b0};

//------------------------- P7 ---------------------------------------
//half simd0
assign p7_0[15:0]   = {sign_not[4],part_product4[12:0],h3[1:0]};
assign p7_1[15:0]   = {part_product5[11:0],h4[1:0],2'b0};
assign p7_2[15:0]   = {1'b0,oper_half0_norm,part_product38[9:0],4'b0};
assign p7_3[15:0]   = {2'b0,part_product39[9:0],4'b0};
assign p7_cin[15:0] = {cout0_7[14:0],1'b0};

compressor_42 #(62) x_comp0_0(.p0   (p0_0[61:0]), 
                            .p1   (p0_1[61:0]),
                            .p2   (p0_2[61:0]), 
                            .p3   (p0_3[61:0]),
                            .cin  (p0_cin[61:0]),
                            .s    (s0_0[61:0]), 
                            .ca   (c0_0[61:0]),
                            .cout (cout0_0[61:0]));

compressor_42 #(64) x_comp0_1(.p0   (p1_0[63:0]), 
                            .p1   (p1_1[63:0]),
                            .p2   (p1_2[63:0]), 
                            .p3   (p1_3[63:0]),
                            .cin  (p1_cin[63:0]),
                            .s    (s0_1[63:0]), 
                            .ca   (c0_1[63:0]),
                            .cout (cout0_1[63:0]));

compressor_42 #(64) x_comp0_2(.p0   (p2_0[63:0]), 
                            .p1   (p2_1[63:0]),
                            .p2   (p2_2[63:0]), 
                            .p3   (p2_3[63:0]),
                            .cin  (p2_cin[63:0]),
                            .s    (s0_2[63:0]), 
                            .ca   (c0_2[63:0]),
                            .cout (cout0_2[63:0]));

compressor_42 #(64) x_comp0_3(.p0   (p3_0[63:0]), 
                            .p1   (p3_1[63:0]),
                            .p2   (p3_2[63:0]), 
                            .p3   (p3_3[63:0]),
                            .cin  (p3_cin[63:0]),
                            .s    (s0_3[63:0]), 
                            .ca   (c0_3[63:0]),
                            .cout (cout0_3[63:0]));

compressor_42 #(64) x_comp0_4(.p0   (p4_0[63:0]), 
                            .p1   (p4_1[63:0]),
                            .p2   (p4_2[63:0]), 
                            .p3   (p4_3[63:0]),
                            .cin  (p4_cin[63:0]),
                            .s    (s0_4[63:0]), 
                            .ca   (c0_4[63:0]),
                            .cout (cout0_4[63:0]));

compressor_42 #(64) x_comp0_5(.p0   (p5_0[63:0]), 
                            .p1   (p5_1[63:0]),
                            .p2   (p5_2[63:0]), 
                            .p3   (p5_3[63:0]),
                            .cin  (p5_cin[63:0]),
                            .s    (s0_5[63:0]), 
                            .ca   (c0_5[63:0]),
                            .cout (cout0_5[63:0]));

compressor_32 #(60) x_comp0_6(.a    (p6_0[59:0]), 
                            .b    (p6_1[59:0]),
                            .c    (p6_2[59:0]), 
                            .s    (s0_6[59:0]), 
                            .ca   (c0_6[59:0]));

compressor_42 #(16) x_comp0_7(.p0   (p7_0[15:0]), 
                            .p1   (p7_1[15:0]),
                            .p2   (p7_2[15:0]), 
                            .p3   (p7_3[15:0]),
                            .cin  (p7_cin[15:0]),
                            .s    (s0_7[15:0]), 
                            .ca   (c0_7[15:0]),
                            .cout (cout0_7[15:0]));

//----------------------------------------------------------
//                    L2 compressor
//----------------------------------------------------------
// second level compressor:
// components : 4 3:2 compressor and 5 4:2 compressor
assign q0_0[69:0]   = {8'b0,s0_0[61:0]};
assign q0_1[69:0]   = {7'b0,c0_0[61:0],1'b0};
assign q0_2[69:0]   = {s0_1[63:0],6'b0};

assign q1_0[71:0]   = {8'b0,c0_1[63:0]};
assign q1_1[71:0]   = {1'b0,s0_2[63:0],7'b0};
assign q1_2[71:0]   = {c0_2[63:0],8'b0};

assign q2_0[71:0]   = {8'b0,s0_3[63:0]};
assign q2_1[71:0]   = {7'b0,c0_3[63:0],1'b0};
assign q2_2[71:0]   = {s0_4[63:0],8'b0};

assign q3_0[71:0]   = {8'b0,c0_4[63:0]};
assign q3_1[71:7]   = {1'b0,s0_5[63:0]};
assign q3_1[6:0]    = (oper_sing) ? part_product30[14:8] : 7'b0;
assign q3_2[71:7]   = {c0_5[63:0],1'b0};
assign q3_2[6:0]    = (oper_sing) ? part_product31[14:8] : 7'b0;

assign q4_0[59:0]   = s0_6[59:0];
assign q4_1[59:0]   = {c0_6[58:0],1'b0};
assign q4_2[5:0]    = 6'b0;
assign q4_2[57:6]   = (oper_doub) ? part_product30[51:0] : 52'b0;
assign q4_2[59:58]  = 2'b0;
assign q4_3[5:0]    = 6'b0;
assign q4_3[57:6]   = (oper_doub) ? part_product31[51:0] : 52'b0;
assign q4_3[58]     = oper_doub & oper_norm;
assign q4_3[59]     = 1'b0;
assign q4_cin[59:0] = {cout1_4[58:0],1'b0};

assign q5_0[21:0]   = {1'b0,s0_0[20:0]};
assign q5_1[21:0]   = {c0_0[20:0],1'b0};
assign q5_2[21:0]   = {s0_7[15:0],6'b0};
assign q5_3[21:0]   = {c0_7[14:0],7'b0};
assign q5_cin[21:0] = {cout1_5[20:0],1'b0};


compressor_32 #(70) x_comp1_0(.a (q0_0[69:0]), .b (q0_1[69:0]), .c (q0_2[69:0]), .s (s1_0[69:0]), .ca (c1_0[69:0]));
compressor_32 #(72) x_comp1_1(.a (q1_0[71:0]), .b (q1_1[71:0]), .c (q1_2[71:0]), .s (s1_1[71:0]), .ca (c1_1[71:0]));
compressor_32 #(72) x_comp1_2(.a (q2_0[71:0]), .b (q2_1[71:0]), .c (q2_2[71:0]), .s (s1_2[71:0]), .ca (c1_2[71:0])); 
compressor_32 #(72) x_comp1_3(.a (q3_0[71:0]), .b (q3_1[71:0]), .c (q3_2[71:0]), .s (s1_3[71:0]), .ca (c1_3[71:0])); 

compressor_42 #(60) x_comp1_4(.p0   (q4_0[59:0]), 
                            .p1   (q4_1[59:0]),
                            .p2   (q4_2[59:0]), 
                            .p3   (q4_3[59:0]),
                            .cin  (q4_cin[59:0]),
                            .s    (s1_4[59:0]), 
                            .ca   (c1_4[59:0]),
                            .cout (cout1_4[59:0]));

compressor_42 #(22) x_comp1_5(.p0   (q5_0[21:0]), 
                            .p1   (q5_1[21:0]),
                            .p2   (q5_2[21:0]), 
                            .p3   (q5_3[21:0]),
                            .cin  (q5_cin[21:0]),
                            .s    (s1_5[21:0]), 
                            .ca   (c1_5[21:0]),
                            .cout (cout1_5[21:0]));

//----------------------------------------------------------
//                    L3 compressor
//----------------------------------------------------------
// third level compressor:
// components: 2 4:2 compressor
assign r0_0[79:0]   = {10'b0,s1_0[69:0]};
assign r0_1[79:0]   = {9'b0,c1_0[69:0],1'b0};
assign r0_2[79:0]   = {1'b0,s1_1[71:0],7'b0};
assign r0_3[79:0]   = {c1_1[71:0],8'b0};
assign r0_cin[79:0] = {cout2_0[78:0],1'b0};


assign r1_0[81:0]   = {10'b0,s1_2[71:0]};
assign r1_1[81:0]   = {9'b0,c1_2[71:0],1'b0};
assign r1_2[0]      = 1'b0;
assign r1_2[8:1]    = (oper_sing) ? part_product30[7:0] : 8'b0;
assign r1_2[81:9]   = {1'b0,s1_3[71:0]};
assign r1_3[0]      = 1'b0;
assign r1_3[8:1]    = (oper_sing) ? part_product31[7:0] : 8'b0;
assign r1_3[81:9]   = {c1_3[71:0],1'b0};
assign r1_cin[81:0] = {cout2_1[80:0],1'b0};

compressor_42 #(80) x_comp2_0(.p0   (r0_0[79:0]), 
                            .p1   (r0_1[79:0]),
                            .p2   (r0_2[79:0]), 
                            .p3   (r0_3[79:0]),
                            .cin  (r0_cin[79:0]),
                            .s    (s2_0[79:0]), 
                            .ca   (c2_0[79:0]),
                            .cout (cout2_0[79:0]));

compressor_42 #(82) x_comp2_1(.p0   (r1_0[81:0]), 
                            .p1   (r1_1[81:0]),
                            .p2   (r1_2[81:0]), 
                            .p3   (r1_3[81:0]),
                            .cin  (r1_cin[81:0]),
                            .s    (s2_1[81:0]), 
                            .ca   (c2_1[81:0]),
                            .cout (cout2_1[81:0]));

assign s2_2[67:0] = (oper_sing)
                  ? {s1_4[59:0],part_product30[22:15]}
                  : {s1_4[59:0],8'b0};

assign c2_2[67:0] = (oper_sing)
                  ? {c1_4[58:0],oper_norm,part_product31[22:15]}
                  : {c1_4[58:0],9'b0};

//calculate simd half result
assign simd_half0_product[21:0] = s1_5[21:0] + {c1_5[20:0],1'b0};
// &Force("output","simd_half0_product"); @656

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
// &Instance("gated_clk_cell", "x_compressor_ex1_ex2_gated_clk"); @661
gated_clk_cell  x_compressor_ex1_ex2_gated_clk (
  .clk_in                      (forever_cpuclk             ),
  .clk_out                     (compresor_ex1_ex2_pipe_clk ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (compressor_ex1_ex2_pipedown),
  .module_en                   (cp0_vfpu_icg_en            ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in      (forever_cpuclk        ), @662
//           .external_en (1'b0                 ), @663
//           .global_en   (cp0_yy_clk_en        ), @664
//           .module_en   (cp0_vfpu_icg_en      ), @665
//           .local_en    (compressor_ex1_ex2_pipedown), @666
//           .clk_out     (compresor_ex1_ex2_pipe_clk)); @667

assign compressor_ex1_ex2_pipedown = pipe_down;

always @(posedge compresor_ex1_ex2_pipe_clk)
begin
  if(compressor_ex1_ex2_pipedown) begin
    s0_reg[79:0]        <= s2_0[79:0];
    c0_reg[79:0]        <= c2_0[79:0];
    s1_reg[81:0]        <= s2_1[81:0];
    c1_reg[81:0]        <= c2_1[81:0];
    s2_reg[67:0]        <= s2_2[67:0];
    c2_reg[67:0]        <= c2_2[67:0];
  end
  else begin
    s0_reg[79:0]        <= s0_reg[79:0];
    c0_reg[79:0]        <= c0_reg[79:0];
    s1_reg[81:0]        <= s1_reg[81:0];
    c1_reg[81:0]        <= c1_reg[81:0];
    s2_reg[67:0]        <= s2_reg[67:0];
    c2_reg[67:0]        <= c2_reg[67:0];
   end
end

//==========================================================
//                     EX2 stage 
//==========================================================
//----------------------------------------------------------
//                    L4 compressor
//----------------------------------------------------------
// forth level compressor:
// components: 2 3:2 compressor
assign v0_0[103:0] = {24'b0,s0_reg[79:0]};
assign v0_1[103:0] = {23'b0,c0_reg[79:0],1'b0};
assign v0_2[103:0] = {s1_reg[81:0],22'b0};

assign v1_0[67:0]  = {1'b0,c1_reg[81:15]};
assign v1_1[67:0]  = s2_reg[67:0];
assign v1_2[67:0]  = c2_reg[67:0];

compressor_32 #(104) x_comp3_0(.a  (v0_0[103:0]), 
                             .b  (v0_1[103:0]), 
                             .c  (v0_2[103:0]), 
                             .s  (s3_0[103:0]), 
                             .ca (c3_0[103:0]));

compressor_32 #(68)  x_comp3_1(.a  (v1_0[67:0]), 
                             .b  (v1_1[67:0]), 
                             .c  (v1_2[67:0]), 
                             .s  (s3_1[67:0]), 
                             .ca (c3_1[67:0]));

//----------------------------------------------------------
//                    L5 compressor
//----------------------------------------------------------
// fifth level compressor:
// components: 1 4:2 compressor
assign w0_0[105:0]   = {2'b0,s3_0[103:0]};
assign w0_1[105:0]   = {1'b0,c3_0[103:0],1'b0};
assign w0_2[105:0]   = {s3_1[67:0],c1_reg[14:0],23'b0};
assign w0_3[105:0]   = {c3_1[66:0],39'b0};
assign w0_cin[105:0] = {cout4_0[104:0],1'b0};

compressor_42 #(106) x_comp4_0(.p0   (w0_0[105:0]), 
                             .p1   (w0_1[105:0]),
                             .p2   (w0_2[105:0]), 
                             .p3   (w0_3[105:0]),
                             .cin  (w0_cin[105:0]),
                             .s    (s4_0[105:0]), 
                             .ca   (c4_0[105:0]),
                             .cout (cout4_0[105:0]));





assign sum[105: 0]  = s4_0[105:0] ;
assign carry[105:0] = {c4_0[104:0],1'b0};

// &Force("nonport","p0_0"); @746
// &Force("nonport","p1_0"); @747
// &Force("nonport","p2_0"); @748
// &Force("nonport","p3_0"); @749
// &Force("nonport","p4_0"); @750
// &Force("nonport","p5_0"); @751
// &Force("nonport","p6_0"); @752
// &Force("nonport","p7_0"); @753
// &Force("nonport","p8_0"); @754
// &Force("nonport","p9_0"); @755
// &Force("nonport","p10_0"); @756
// &Force("nonport","p11_0"); @757
// &Force("nonport","p12_0"); @758
// &Force("nonport","p0_1"); @759
// &Force("nonport","p1_1"); @760
// &Force("nonport","p2_1"); @761
// &Force("nonport","p3_1"); @762
// &Force("nonport","p4_1"); @763
// &Force("nonport","p5_1"); @764
// &Force("nonport","p6_1"); @765
// &Force("nonport","p7_1"); @766
// &Force("nonport","p8_1"); @767
// &Force("nonport","p9_1"); @768
// &Force("nonport","p10_1"); @769
// &Force("nonport","p11_1"); @770
// &Force("nonport","p12_1"); @771
// &Force("nonport","p0_2"); @772
// &Force("nonport","p1_2"); @773
// &Force("nonport","p2_2"); @774
// &Force("nonport","p3_2"); @775
// &Force("nonport","p4_2"); @776
// &Force("nonport","p5_2"); @777
// &Force("nonport","p6_2"); @778
// &Force("nonport","p7_2"); @779
// &Force("nonport","p8_2"); @780
// &Force("nonport","p9_2"); @781
// &Force("nonport","p10_2"); @782
// &Force("nonport","p11_2"); @783
// &Force("nonport","p12_2"); @784
// &Force("nonport","p0_3"); @785
// &Force("nonport","p1_3"); @786
// &Force("nonport","p2_3"); @787
// &Force("nonport","p3_3"); @788
// &Force("nonport","p4_3"); @789
// &Force("nonport","p5_3"); @790
// &Force("nonport","p6_3"); @791
// &Force("nonport","p7_3"); @792
// &Force("nonport","p8_3"); @793
// &Force("nonport","p9_3"); @794
// &Force("nonport","p10_3"); @795
// &Force("nonport","p11_3"); @796
// &Force("nonport","p12_3"); @797
// &Force("nonport","s0_0"); @798
// &Force("nonport","s0_1"); @799
// &Force("nonport","s0_2"); @800
// &Force("nonport","s0_3"); @801
// &Force("nonport","s0_4"); @802
// &Force("nonport","s0_5"); @803
// &Force("nonport","s0_6"); @804
// &Force("nonport","s0_7"); @805
// &Force("nonport","s0_8"); @806
// &Force("nonport","s0_9"); @807
// &Force("nonport","s0_10"); @808
// &Force("nonport","s0_11"); @809
// &Force("nonport","s0_12"); @810
// &Force("nonport","c0_0"); @811
// &Force("nonport","c0_1"); @812
// &Force("nonport","c0_2"); @813
// &Force("nonport","c0_3"); @814
// &Force("nonport","c0_4"); @815
// &Force("nonport","c0_5"); @816
// &Force("nonport","c0_6"); @817
// &Force("nonport","c0_7"); @818
// &Force("nonport","c0_8"); @819
// &Force("nonport","c0_9"); @820
// &Force("nonport","c0_10"); @821
// &Force("nonport","c0_11"); @822
// &Force("nonport","c0_12"); @823
// &Force("nonport","p0_cin"); @824
// &Force("nonport","p1_cin"); @825
// &Force("nonport","p2_cin"); @826
// &Force("nonport","p3_cin"); @827
// &Force("nonport","p4_cin"); @828
// &Force("nonport","p5_cin"); @829
// &Force("nonport","p6_cin"); @830
// &Force("nonport","p7_cin"); @831
// &Force("nonport","p8_cin"); @832
// &Force("nonport","p9_cin"); @833
// &Force("nonport","p10_cin"); @834
// &Force("nonport","p11_cin"); @835
// &Force("nonport","p12_cin"); @836
// &Force("nonport","cout0_0"); @837
// &Force("nonport","cout0_1"); @838
// &Force("nonport","cout0_2"); @839
// &Force("nonport","cout0_3"); @840
// &Force("nonport","cout0_4"); @841
// &Force("nonport","cout0_5"); @842
// &Force("nonport","cout0_6"); @843
// &Force("nonport","cout0_7"); @844
// &Force("nonport","cout0_8"); @845
// &Force("nonport","cout0_9"); @846
// &Force("nonport","cout0_10"); @847
// &Force("nonport","cout0_11"); @848
// &Force("nonport","cout0_12"); @849
// &Force("nonport","q0_0"); @850
// &Force("nonport","q1_0"); @851
// &Force("nonport","q2_0"); @852
// &Force("nonport","q3_0"); @853
// &Force("nonport","q4_0"); @854
// &Force("nonport","q5_0"); @855
// &Force("nonport","q6_0"); @856
// &Force("nonport","q7_0"); @857
// &Force("nonport","q8_0"); @858
// &Force("nonport","q0_1"); @859
// &Force("nonport","q1_1"); @860
// &Force("nonport","q2_1"); @861
// &Force("nonport","q3_1"); @862
// &Force("nonport","q4_1"); @863
// &Force("nonport","q5_1"); @864
// &Force("nonport","q6_1"); @865
// &Force("nonport","q7_1"); @866
// &Force("nonport","q8_1"); @867
// &Force("nonport","q0_2"); @868
// &Force("nonport","q1_2"); @869
// &Force("nonport","q2_2"); @870
// &Force("nonport","q3_2"); @871
// &Force("nonport","q4_2"); @872
// &Force("nonport","q5_2"); @873
// &Force("nonport","q6_2"); @874
// &Force("nonport","q7_2"); @875
// &Force("nonport","q8_2"); @876
// &Force("nonport","q4_3"); @877
// &Force("nonport","q5_3"); @878
// &Force("nonport","q6_3"); @879
// &Force("nonport","q7_3"); @880
// &Force("nonport","q8_3"); @881
// &Force("nonport","s1_0"); @882
// &Force("nonport","s1_1"); @883
// &Force("nonport","s1_2"); @884
// &Force("nonport","s1_3"); @885
// &Force("nonport","s1_4"); @886
// &Force("nonport","s1_5"); @887
// &Force("nonport","s1_6"); @888
// &Force("nonport","s1_7"); @889
// &Force("nonport","s1_8"); @890
// &Force("nonport","c1_0"); @891
// &Force("nonport","c1_1"); @892
// &Force("nonport","c1_2"); @893
// &Force("nonport","c1_3"); @894
// &Force("nonport","c1_4"); @895
// &Force("nonport","c1_5"); @896
// &Force("nonport","c1_6"); @897
// &Force("nonport","c1_7"); @898
// &Force("nonport","c1_8"); @899
// &Force("nonport","q4_cin"); @900
// &Force("nonport","q5_cin"); @901
// &Force("nonport","q6_cin"); @902
// &Force("nonport","q7_cin"); @903
// &Force("nonport","q8_cin"); @904
// &Force("nonport","cout1_4"); @905
// &Force("nonport","cout1_5"); @906
// &Force("nonport","cout1_6"); @907
// &Force("nonport","cout1_7"); @908
// &Force("nonport","cout1_8"); @909
// &Force("nonport","r0_0"); @910
// &Force("nonport","r1_0"); @911
// &Force("nonport","r0_1"); @912
// &Force("nonport","r1_1"); @913
// &Force("nonport","r0_2"); @914
// &Force("nonport","r1_2"); @915
// &Force("nonport","r0_3"); @916
// &Force("nonport","r1_3"); @917
// &Force("nonport","s2_0"); @918
// &Force("nonport","s2_1"); @919
// &Force("nonport","c2_0"); @920
// &Force("nonport","c2_1"); @921
// &Force("nonport","r0_cin"); @922
// &Force("nonport","r1_cin"); @923
// &Force("nonport","cout2_0"); @924
// &Force("nonport","cout2_1"); @925
// &Force("nonport","v0_0"); @926
// &Force("nonport","v0_1"); @927
// &Force("nonport","v0_2"); @928
// &Force("nonport","s3_0"); @929
// &Force("nonport","c3_0"); @930
// &Force("nonport","v1_0"); @931
// &Force("nonport","v1_1"); @932
// &Force("nonport","v1_2"); @933
// &Force("nonport","s3_1"); @934
// &Force("nonport","c3_1"); @935
// &Force("nonport","w0_0"); @936
// &Force("nonport","w0_1"); @937
// &Force("nonport","w0_2"); @938
// &Force("nonport","w0_3"); @939
// &Force("nonport","s4_0"); @940
// &Force("nonport","c4_0"); @941
// &Force("nonport","w0_cin"); @942
// &Force("nonport","cout4_0"); @943


// &ModuleEnd; @946
endmodule



