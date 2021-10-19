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
module ct_ifu_precode(
  inst_data,
  pre_code
);

// &Ports; @23
input   [127:0]  inst_data;  
output  [31 :0]  pre_code;   

// &Regs; @24

// &Wires; @25
wire             h1_ab_br;   
wire             h1_br;      
wire             h1_bry0;    
wire             h1_bry1;    
wire             h1_bry1_32; 
wire    [15 :0]  h1_data;    
wire    [3  :0]  h1_pre_code; 
wire             h2_ab_br;   
wire             h2_br;      
wire             h2_bry0;    
wire             h2_bry0_32; 
wire             h2_bry1;    
wire             h2_bry1_16; 
wire             h2_bry1_32; 
wire    [15 :0]  h2_data;    
wire    [3  :0]  h2_pre_code; 
wire             h3_ab_br;   
wire             h3_br;      
wire             h3_bry0;    
wire             h3_bry0_16; 
wire             h3_bry0_32; 
wire             h3_bry1;    
wire             h3_bry1_16; 
wire             h3_bry1_32; 
wire    [15 :0]  h3_data;    
wire    [3  :0]  h3_pre_code; 
wire             h4_ab_br;   
wire             h4_br;      
wire             h4_bry0;    
wire             h4_bry0_16; 
wire             h4_bry0_32; 
wire             h4_bry1;    
wire             h4_bry1_16; 
wire             h4_bry1_32; 
wire    [15 :0]  h4_data;    
wire    [3  :0]  h4_pre_code; 
wire             h5_ab_br;   
wire             h5_br;      
wire             h5_bry0;    
wire             h5_bry0_16; 
wire             h5_bry0_32; 
wire             h5_bry1;    
wire             h5_bry1_16; 
wire             h5_bry1_32; 
wire    [15 :0]  h5_data;    
wire    [3  :0]  h5_pre_code; 
wire             h6_ab_br;   
wire             h6_br;      
wire             h6_bry0;    
wire             h6_bry0_16; 
wire             h6_bry0_32; 
wire             h6_bry1;    
wire             h6_bry1_16; 
wire             h6_bry1_32; 
wire    [15 :0]  h6_data;    
wire    [3  :0]  h6_pre_code; 
wire             h7_ab_br;   
wire             h7_br;      
wire             h7_bry0;    
wire             h7_bry0_16; 
wire             h7_bry0_32; 
wire             h7_bry1;    
wire             h7_bry1_16; 
wire             h7_bry1_32; 
wire    [15 :0]  h7_data;    
wire    [3  :0]  h7_pre_code; 
wire             h8_ab_br;   
wire             h8_br;      
wire             h8_bry0;    
wire             h8_bry0_16; 
wire             h8_bry0_32; 
wire             h8_bry1;    
wire             h8_bry1_16; 
wire             h8_bry1_32; 
wire    [15 :0]  h8_data;    
wire    [3  :0]  h8_pre_code; 
wire    [127:0]  inst_data;  
wire    [31 :0]  pre_code;   


//==========================================================
//                  Precode Information
//==========================================================
//pre_code[23:21] -- {h1_br, h1_bry1, h1_bry0} -- inst_data[127:112]
//pre_code[20:18] -- {h2_br, h2_bry1, h2_bry0} -- inst_data[111: 96]
//pre_code[17:15] -- {h3_br, h3_bry1, h3_bry0} -- inst_data[ 95: 80]
//pre_code[14:12] -- {h4_br, h4_bry1, h4_bry0} -- inst_data[ 79: 64]
//pre_code[11: 9] -- {h5_br, h5_bry1, h5_bry0} -- inst_data[ 63: 48]
//pre_code[ 8: 6] -- {h6_br, h6_bry1, h6_bry0} -- inst_data[ 47: 32]
//pre_code[ 5: 3] -- {h7_br, h7_bry1, h7_bry0} -- inst_data[ 31: 16]
//pre_code[ 2: 0] -- {h8_br, h8_bry1, h8_bry0} -- inst_data[ 15:  0]

assign h1_data[15:0] = inst_data[127:112];
assign h2_data[15:0] = inst_data[111: 96];
assign h3_data[15:0] = inst_data[ 95: 80];
assign h4_data[15:0] = inst_data[ 79: 64];
assign h5_data[15:0] = inst_data[ 63: 48];
assign h6_data[15:0] = inst_data[ 47: 32];
assign h7_data[15:0] = inst_data[ 31: 16];
assign h8_data[15:0] = inst_data[ 15:  0];

//hn_br
assign h1_br = (h1_data[6:0] == 7'b1101111) || //jal
               ({h1_data[14:12],h1_data[6:0]} == 10'b000_1100011) || //beq
               ({h1_data[14:12],h1_data[6:0]} == 10'b001_1100011) || //bne
               ({h1_data[14:12],h1_data[6:0]} == 10'b100_1100011) || //blt
               ({h1_data[14:12],h1_data[6:0]} == 10'b101_1100011) || //bge
               ({h1_data[14:12],h1_data[6:0]} == 10'b110_1100011) || //bltu
               ({h1_data[14:12],h1_data[6:0]} == 10'b111_1100011) || //bgeu
               ({h1_data[15:14],h1_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
               ({h1_data[15:13],h1_data[1:0]} == 5'b10101); //c.j 

assign h2_br = (h2_data[6:0] == 7'b1101111) || //jal
               ({h2_data[14:12],h2_data[6:0]} == 10'b000_1100011) || //beq
               ({h2_data[14:12],h2_data[6:0]} == 10'b001_1100011) || //bne
               ({h2_data[14:12],h2_data[6:0]} == 10'b100_1100011) || //blt
               ({h2_data[14:12],h2_data[6:0]} == 10'b101_1100011) || //bge
               ({h2_data[14:12],h2_data[6:0]} == 10'b110_1100011) || //bltu
               ({h2_data[14:12],h2_data[6:0]} == 10'b111_1100011) || //bgeu
               ({h2_data[15:14],h2_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
               ({h2_data[15:13],h2_data[1:0]} == 5'b10101); //c.j 

assign h3_br = (h3_data[6:0] == 7'b1101111) || //jal
               ({h3_data[14:12],h3_data[6:0]} == 10'b000_1100011) || //beq
               ({h3_data[14:12],h3_data[6:0]} == 10'b001_1100011) || //bne
               ({h3_data[14:12],h3_data[6:0]} == 10'b100_1100011) || //blt
               ({h3_data[14:12],h3_data[6:0]} == 10'b101_1100011) || //bge
               ({h3_data[14:12],h3_data[6:0]} == 10'b110_1100011) || //bltu
               ({h3_data[14:12],h3_data[6:0]} == 10'b111_1100011) || //bgeu
               ({h3_data[15:14],h3_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
               ({h3_data[15:13],h3_data[1:0]} == 5'b10101); //c.j 

assign h4_br = (h4_data[6:0] == 7'b1101111) || //jal
               ({h4_data[14:12],h4_data[6:0]} == 10'b000_1100011) || //beq
               ({h4_data[14:12],h4_data[6:0]} == 10'b001_1100011) || //bne
               ({h4_data[14:12],h4_data[6:0]} == 10'b100_1100011) || //blt
               ({h4_data[14:12],h4_data[6:0]} == 10'b101_1100011) || //bge
               ({h4_data[14:12],h4_data[6:0]} == 10'b110_1100011) || //bltu
               ({h4_data[14:12],h4_data[6:0]} == 10'b111_1100011) || //bgeu
               ({h4_data[15:14],h4_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
               ({h4_data[15:13],h4_data[1:0]} == 5'b10101); //c.j 

assign h5_br = (h5_data[6:0] == 7'b1101111) || //jal
               ({h5_data[14:12],h5_data[6:0]} == 10'b000_1100011) || //beq
               ({h5_data[14:12],h5_data[6:0]} == 10'b001_1100011) || //bne
               ({h5_data[14:12],h5_data[6:0]} == 10'b100_1100011) || //blt
               ({h5_data[14:12],h5_data[6:0]} == 10'b101_1100011) || //bge
               ({h5_data[14:12],h5_data[6:0]} == 10'b110_1100011) || //bltu
               ({h5_data[14:12],h5_data[6:0]} == 10'b111_1100011) || //bgeu
               ({h5_data[15:14],h5_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
               ({h5_data[15:13],h5_data[1:0]} == 5'b10101); //c.j 

assign h6_br = (h6_data[6:0] == 7'b1101111) || //jal
               ({h6_data[14:12],h6_data[6:0]} == 10'b000_1100011) || //beq
               ({h6_data[14:12],h6_data[6:0]} == 10'b001_1100011) || //bne
               ({h6_data[14:12],h6_data[6:0]} == 10'b100_1100011) || //blt
               ({h6_data[14:12],h6_data[6:0]} == 10'b101_1100011) || //bge
               ({h6_data[14:12],h6_data[6:0]} == 10'b110_1100011) || //bltu
               ({h6_data[14:12],h6_data[6:0]} == 10'b111_1100011) || //bgeu
               ({h6_data[15:14],h6_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
               ({h6_data[15:13],h6_data[1:0]} == 5'b10101); //c.j 

assign h7_br = (h7_data[6:0] == 7'b1101111) || //jal
               ({h7_data[14:12],h7_data[6:0]} == 10'b000_1100011) || //beq
               ({h7_data[14:12],h7_data[6:0]} == 10'b001_1100011) || //bne
               ({h7_data[14:12],h7_data[6:0]} == 10'b100_1100011) || //blt
               ({h7_data[14:12],h7_data[6:0]} == 10'b101_1100011) || //bge
               ({h7_data[14:12],h7_data[6:0]} == 10'b110_1100011) || //bltu
               ({h7_data[14:12],h7_data[6:0]} == 10'b111_1100011) || //bgeu
               ({h7_data[15:14],h7_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
               ({h7_data[15:13],h7_data[1:0]} == 5'b10101); //c.j 

assign h8_br = (h8_data[6:0] == 7'b1101111) || //jal
               ({h8_data[14:12],h8_data[6:0]} == 10'b000_1100011) || //beq
               ({h8_data[14:12],h8_data[6:0]} == 10'b001_1100011) || //bne
               ({h8_data[14:12],h8_data[6:0]} == 10'b100_1100011) || //blt
               ({h8_data[14:12],h8_data[6:0]} == 10'b101_1100011) || //bge
               ({h8_data[14:12],h8_data[6:0]} == 10'b110_1100011) || //bltu
               ({h8_data[14:12],h8_data[6:0]} == 10'b111_1100011) || //bgeu
               ({h8_data[15:14],h8_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
               ({h8_data[15:13],h8_data[1:0]} == 5'b10101); //c.j 

//hn_ab_br
assign h1_ab_br = (h1_data[6:0] == 7'b1101111) || //jal
                  ({h1_data[15:13],h1_data[1:0]} == 5'b10101); //c.j 

assign h2_ab_br = (h2_data[6:0] == 7'b1101111) || //jal
                  ({h2_data[15:13],h2_data[1:0]} == 5'b10101); //c.j 

assign h3_ab_br = (h3_data[6:0] == 7'b1101111) || //jal
                  ({h3_data[15:13],h3_data[1:0]} == 5'b10101); //c.j 

assign h4_ab_br = (h4_data[6:0] == 7'b1101111) || //jal
                  ({h4_data[15:13],h4_data[1:0]} == 5'b10101); //c.j 

assign h5_ab_br = (h5_data[6:0] == 7'b1101111) || //jal
                  ({h5_data[15:13],h5_data[1:0]} == 5'b10101); //c.j 

assign h6_ab_br = (h6_data[6:0] == 7'b1101111) || //jal
                  ({h6_data[15:13],h6_data[1:0]} == 5'b10101); //c.j 

assign h7_ab_br = (h7_data[6:0] == 7'b1101111) || //jal
                  ({h7_data[15:13],h7_data[1:0]} == 5'b10101); //c.j 

assign h8_ab_br = (h8_data[6:0] == 7'b1101111) || //jal
                  ({h8_data[15:13],h8_data[1:0]} == 5'b10101); //c.j 

//hn_bry1 : suppose h1 is the start of one inst
assign h1_bry1_32 = (h1_data[1:0] == 2'b11);
assign h1_bry1    = 1'b1;

assign h2_bry1_32 = (h2_data[1:0] == 2'b11) && !h1_bry1_32;
assign h2_bry1_16 = !(h2_data[1:0] == 2'b11) && !h1_bry1_32;
assign h2_bry1    = h2_bry1_32 || h2_bry1_16;

assign h3_bry1_32 = (h3_data[1:0] == 2'b11) && !h2_bry1_32;
assign h3_bry1_16 = !(h3_data[1:0] == 2'b11) && !h2_bry1_32;
assign h3_bry1    = h3_bry1_32 || h3_bry1_16;

assign h4_bry1_32 = (h4_data[1:0] == 2'b11) && !h3_bry1_32;
assign h4_bry1_16 = !(h4_data[1:0] == 2'b11) && !h3_bry1_32;
assign h4_bry1    = h4_bry1_32 || h4_bry1_16;

assign h5_bry1_32 = (h5_data[1:0] == 2'b11) && !h4_bry1_32;
assign h5_bry1_16 = !(h5_data[1:0] == 2'b11) && !h4_bry1_32;
assign h5_bry1    = h5_bry1_32 || h5_bry1_16;

assign h6_bry1_32 = (h6_data[1:0] == 2'b11) && !h5_bry1_32;
assign h6_bry1_16 = !(h6_data[1:0] == 2'b11) && !h5_bry1_32;
assign h6_bry1    = h6_bry1_32 || h6_bry1_16;

assign h7_bry1_32 = (h7_data[1:0] == 2'b11) && !h6_bry1_32;
assign h7_bry1_16 = !(h7_data[1:0] == 2'b11) && !h6_bry1_32;
assign h7_bry1    = h7_bry1_32 || h7_bry1_16;

assign h8_bry1_32 = (h8_data[1:0] == 2'b11) && !h7_bry1_32;
assign h8_bry1_16 = !(h8_data[1:0] == 2'b11) && !h7_bry1_32;
assign h8_bry1    = h8_bry1_32 || h8_bry1_16;

//hn_bry0 : suppose h1 is not the start of one inst
assign h1_bry0    = 1'b0;

assign h2_bry0_32 = (h2_data[1:0] == 2'b11);
assign h2_bry0    = 1'b1;

assign h3_bry0_32 = (h3_data[1:0] == 2'b11) && !h2_bry0_32;
assign h3_bry0_16 = !(h3_data[1:0] == 2'b11) && !h2_bry0_32;
assign h3_bry0    = h3_bry0_32 || h3_bry0_16;

assign h4_bry0_32 = (h4_data[1:0] == 2'b11) && !h3_bry0_32;
assign h4_bry0_16 = !(h4_data[1:0] == 2'b11) && !h3_bry0_32;
assign h4_bry0    = h4_bry0_32 || h4_bry0_16;

assign h5_bry0_32 = (h5_data[1:0] == 2'b11) && !h4_bry0_32;
assign h5_bry0_16 = !(h5_data[1:0] == 2'b11) && !h4_bry0_32;
assign h5_bry0    = h5_bry0_32 || h5_bry0_16;

assign h6_bry0_32 = (h6_data[1:0] == 2'b11) && !h5_bry0_32;
assign h6_bry0_16 = !(h6_data[1:0] == 2'b11) && !h5_bry0_32;
assign h6_bry0    = h6_bry0_32 || h6_bry0_16;

assign h7_bry0_32 = (h7_data[1:0] == 2'b11) && !h6_bry0_32;
assign h7_bry0_16 = !(h7_data[1:0] == 2'b11) && !h6_bry0_32;
assign h7_bry0    = h7_bry0_32 || h7_bry0_16;

assign h8_bry0_32 = (h8_data[1:0] == 2'b11) && !h7_bry0_32;
assign h8_bry0_16 = !(h8_data[1:0] == 2'b11) && !h7_bry0_32;
assign h8_bry0    = h8_bry0_32 || h8_bry0_16;

//Merge
assign h1_pre_code[3:0] = {h1_ab_br,h1_br, h1_bry1, h1_bry0};
assign h2_pre_code[3:0] = {h2_ab_br,h2_br, h2_bry1, h2_bry0};
assign h3_pre_code[3:0] = {h3_ab_br,h3_br, h3_bry1, h3_bry0};
assign h4_pre_code[3:0] = {h4_ab_br,h4_br, h4_bry1, h4_bry0};
assign h5_pre_code[3:0] = {h5_ab_br,h5_br, h5_bry1, h5_bry0};
assign h6_pre_code[3:0] = {h6_ab_br,h6_br, h6_bry1, h6_bry0};
assign h7_pre_code[3:0] = {h7_ab_br,h7_br, h7_bry1, h7_bry0};
assign h8_pre_code[3:0] = {h8_ab_br,h8_br, h8_bry1, h8_bry0};

assign pre_code[31:0] = {h1_pre_code[3:0],
                         h2_pre_code[3:0],
                         h3_pre_code[3:0],
                         h4_pre_code[3:0],
                         h5_pre_code[3:0],
                         h6_pre_code[3:0],
                         h7_pre_code[3:0],
                         h8_pre_code[3:0]};

// &ModuleEnd; @235
endmodule


