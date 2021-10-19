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

// &ModuleBeg; @25
module ct_ifu_decd_normal(
  cp0_ifu_vl,
  cp0_ifu_vsetvli_pred_disable,
  x_auipc,
  x_br,
  x_branch,
  x_chgflw,
  x_con_br,
  x_dst_vld,
  x_ind_br,
  x_inst,
  x_jal,
  x_jalr,
  x_ld,
  x_offset,
  x_pc_oper,
  x_pcall,
  x_preturn,
  x_st,
  x_vlmax,
  x_vlmul,
  x_vsetvli,
  x_vsew
);

// &Ports; @26
input   [7 :0]  cp0_ifu_vl;                  
input           cp0_ifu_vsetvli_pred_disable; 
input           x_br;                        
input   [31:0]  x_inst;                      
output          x_auipc;                     
output          x_branch;                    
output          x_chgflw;                    
output          x_con_br;                    
output          x_dst_vld;                   
output          x_ind_br;                    
output          x_jal;                       
output          x_jalr;                      
output          x_ld;                        
output  [20:0]  x_offset;                    
output          x_pc_oper;                   
output          x_pcall;                     
output          x_preturn;                   
output          x_st;                        
output  [7 :0]  x_vlmax;                     
output  [1 :0]  x_vlmul;                     
output          x_vsetvli;                   
output  [2 :0]  x_vsew;                      

// &Regs; @27

// &Wires; @28
wire    [7 :0]  cp0_ifu_vl;                  
wire            cp0_ifu_vsetvli_pred_disable; 
wire            x_ab_br;                     
wire            x_auipc;                     
wire            x_br;                        
wire            x_branch;                    
wire            x_chgflw;                    
wire            x_con_br;                    
wire            x_dst_vld;                   
wire            x_ind_br;                    
wire    [31:0]  x_inst;                      
wire            x_jal;                       
wire            x_jalr;                      
wire            x_ld;                        
wire    [20:0]  x_offset;                    
wire    [20:0]  x_offset_12_ab_br;           
wire            x_offset_12_ab_br_vld;       
wire    [20:0]  x_offset_12_ind_br;          
wire            x_offset_12_ind_br_vld;      
wire    [20:0]  x_offset_13_con_br;          
wire            x_offset_13_con_br_vld;      
wire    [20:0]  x_offset_21_ab_br;           
wire            x_offset_21_ab_br_vld;       
wire    [20:0]  x_offset_9_con_br;           
wire            x_offset_9_con_br_vld;       
wire            x_pc_oper;                   
wire            x_pcall;                     
wire            x_preturn;                   
wire            x_st;                        
wire    [7 :0]  x_vlmax;                     
wire    [1 :0]  x_vlmul;                     
wire            x_vsetvli;                   
wire    [2 :0]  x_vsew;                      



//==========================================================
//                   Decode Normal Type
//==========================================================
// &Force("bus","x_inst",31,0); @34

//Hn_ab_br
assign x_ab_br = x_br && 
                 (
                   (x_inst[2:1] == 2'b11) ||         //jal
                   ({x_inst[14],x_inst[1]} == 2'b00) //c.j
                 );
//Hn_con_br
assign x_con_br = x_br && 
                  (
                    (x_inst[2:1] == 2'b01) ||         //32-bit con-br
                    ({x_inst[14],x_inst[1]} == 2'b10) //16-bit con-br
                  );
// &Force("output","x_con_br"); @48

//Hn_auipc
assign x_auipc = (x_inst[6:0] == 7'b0010111); //auipc
// &Force("output","x_auipc"); @52

//Hn_pc_oper
assign x_pc_oper = x_br ||
                 ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111) ||                            //jalr
                 ({x_inst[15:13],x_inst[6:0]} == 10'b100_00000_10) && (x_inst[11:7] != 5'b0) || //c.jr/c.jalr
                 (x_inst[6:0] == 7'b0010111);                                                   //auipc
// &Force("output","x_pc_oper"); @59
                  
//Hn_chgflw_not_br
//contain all the chgflw inst except con_br
assign x_chgflw = ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111) ||                            //jalr
                  ({x_inst[15:13],x_inst[6:0]} == 10'b100_00000_10) && (x_inst[11:7] != 5'b0) || //c.jr/c.jalr
                  x_ab_br;
// &Force("output","x_chgflw"); @66

//Hn_branch
//contain all the branch inst include con_br
assign x_branch = ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111) ||                            //jalr
                  ({x_inst[15:13],x_inst[6:0]} == 10'b100_00000_10) && (x_inst[11:7] != 5'b0) || //c.jr/c.jalr
                  x_br;
// &Force("output","x_branch"); @73
                
//Hn_jal
assign x_jal = (x_inst[6:0] == 7'b1101111) ||               //jal
                ({x_inst[15:13], x_inst[1:0]} == 5'b10101); //c.j
// &Force("output","x_jal"); @78

//Hn_jalr
assign x_jalr = ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111) ||                          //jalr
                ({x_inst[15:13],x_inst[6:0]} == 10'b100_00000_10) && (x_inst[11:7] != 5'b0); //c.jr/c.jalr
// &Force("output","x_jalr"); @83

//Hn_dst_vld
assign x_dst_vld = ((x_inst[6:0] == 7'b1101111) || ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111)) && (x_inst[11:7] != 5'b0)
                || ({x_inst[15:12],x_inst[6:0]} == 11'b1001_00000_10) && (x_inst[11:7] != 5'b0);


//==========================================================
//                   Decode Indrect Branch
//==========================================================
//Pcall and Preturn judgement
//      +-------+-------+--------+--------------+
//      |   rd  |  rs1  | rs1=rd | RAS action   |
//      +-------+-------+--------+--------------+
//      | !link | !link |    -   | none         |
//      +-------+-------+--------+--------------+
//      | !link | link  |    -   | pop          |
//      +-------+-------+--------+--------------+
//      | link  | !link |    -   | push         |
//      +-------+-------+--------+--------------+
//      | link  | link  |    0   | push and pop |
//      +-------+-------+--------+--------------+
//      | link  | link  |    1   | push         |
//      +-------+-------+--------+--------------+


//Hn_pcall 
//1. jalr: rd == x1 or rd == x5
//2. jal : rd == x1 or rd == x5
//3. c.jalr
assign x_pcall = (
                  ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111) && //jalr
                  (
                   (x_inst[11:7] == 5'b00001) ||
                   (x_inst[11:7] == 5'b00101)
                  )
                 ) || 
                 (
                  (x_inst[6:0] == 7'b1101111) && //jal
                  (     
                   (x_inst[11:7] == 5'b00001) ||
                   (x_inst[11:7] == 5'b00101)
                  )
                 ) ||
                 (
                   ({x_inst[15:12],x_inst[6:0]} == 11'b1001_00000_10) && //c.jalr 
                   (x_inst[11:7] != 5'b0)
                 ); 

//Hn_preturn
//1. jalr: when rs1 == x1 or rs1 == x5 and rs1!=rd
//2. c.jr: when rs1 ==x1 or rs1 == x5
//3. c.jalr: when rs1 == x5(c.jalr use x1 as default rd) 
assign x_preturn = (
                    ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111) && //jalr
                    (x_inst[11:7] != x_inst[19:15]) &&
                    (
                     (x_inst[19:15] == 5'b00001) ||
                     (x_inst[19:15] == 5'b00101)
                    ) &&
                    (x_inst[31:20] == 12'b0)
                   ) ||
                   (
                    ({x_inst[15:12],x_inst[6:0]} == 11'b1000_00000_10) &&  //c.jr
                    (
                     (x_inst[11:7] == 5'b00001) ||
                     (x_inst[11:7] == 5'b00101)
                    ) &&
                     (x_inst[11:7] != 5'b00000)
                   ) ||
                   (
                     ({x_inst[15:12],x_inst[6:0]} == 11'b1001_00000_10) && //c.jalr 
                     (x_inst[11:7] == 5'b00101)
                   ); 


//Hn_ind_jmp
assign x_ind_br  = (
                    ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111) && //jalr
                    (
                     ( 
                      ((x_inst[19:15] != 5'b1) &&
                       (x_inst[19:15] != 5'b00101)
                      ) ||
                      (x_inst[31:20] != 12'b0)
                     ) ||
                     (x_inst[11:7] == x_inst[19:15])
                    )
                   ) ||
                   (
                    ({x_inst[15:12],x_inst[6:0]} == 11'b1000_00000_10) &&  //c.jr
                    !(x_inst[11:7] == 5'b00001) &&
                    !(x_inst[11:7] == 5'b00101) &&
                    !(x_inst[11:7] == 5'b0)
                   ) ||
                   (
                     ({x_inst[15:12],x_inst[6:0]} == 11'b1001_00000_10) && //c.jalr 
                     !(x_inst[11:7] == 5'b00101) && !(x_inst[11:7] == 5'b0)
                   ); 
                

//==========================================================
//                   Decode Store Inst
//==========================================================
// &Force("bus","x_inst",31,0); @187
assign x_st =  ({x_inst[14:12],x_inst[6:0]} == 10'b000_0100011) //sb
           ||  ({x_inst[14:12],x_inst[6:0]} == 10'b001_0100011) //sh
           ||  ({x_inst[14:12],x_inst[6:0]} == 10'b010_0100011) //sw
           ||  ({x_inst[14:12],x_inst[6:0]} == 10'b011_0100011) //sd
           ||  (x_inst[6:0] == 7'b0100111) //fsh/fsw/fsd/vfst
           ||  ({x_inst[15:13],x_inst[1:0]} == 5'b101_00) //c.fsd
           ||  ({x_inst[15:13],x_inst[1:0]} == 5'b110_00) //c.sw
           ||  ({x_inst[15:13],x_inst[1:0]} == 5'b111_00) //c.sd
           ||  ({x_inst[15:13],x_inst[1:0]} == 5'b101_10) //c.fsdsp
           ||  ({x_inst[15:13],x_inst[1:0]} == 5'b110_10) //c.swsp
           ||  ({x_inst[15:13],x_inst[1:0]} == 5'b111_10) //c.sdsp
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00000_101_0001011) //srb
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00100_101_0001011) //srh
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01000_101_0001011) //srw
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01100_101_0001011) //srd
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00010_101_0001011) //surb
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00110_101_0001011) //surh
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01010_101_0001011) //surw
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01110_101_0001011) //surd
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00001_101_0001011) //sbib
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00011_101_0001011) //sbia
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00101_101_0001011) //shib
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00111_101_0001011) //shia
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01001_101_0001011) //swib
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01011_101_0001011) //swia
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01101_101_0001011) //sdib
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01111_101_0001011) //sdia
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11100_101_0001011) //swd
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11111_101_0001011) //sdd
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01000_111_0001011) //fsrw
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01100_111_0001011) //fsrd
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01010_111_0001011) //fsurw
           ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01110_111_0001011); //fsurd



//==========================================================
//                 Decode lsfifo Instruction
//==========================================================
assign x_ld=({x_inst[14:12],x_inst[6:0]} == 10'b000_0000011) //lb
        ||  ({x_inst[14:12],x_inst[6:0]} == 10'b001_0000011) //lh
        ||  ({x_inst[14:12],x_inst[6:0]} == 10'b010_0000011) //lw
        ||  ({x_inst[14:12],x_inst[6:0]} == 10'b011_0000011) //ld
        ||  ({x_inst[14:12],x_inst[6:0]} == 10'b100_0000011) //lbu
        ||  ({x_inst[14:12],x_inst[6:0]} == 10'b101_0000011) //lhu
        ||  ({x_inst[14:12],x_inst[6:0]} == 10'b110_0000011) //lwu
        ||  (x_inst[6:0] == 7'b0000111) //flh/flw/fld/vfld
        ||  ({x_inst[15:13],x_inst[1:0]} == 5'b001_00) //c.fld
        ||  ({x_inst[15:13],x_inst[1:0]} == 5'b010_00) //c.lw
        ||  ({x_inst[15:13],x_inst[1:0]} == 5'b011_00) //c.ld
        ||  ({x_inst[15:13],x_inst[1:0]} == 5'b001_10) //c.fldsp
        ||  ({x_inst[15:13],x_inst[1:0]} == 5'b010_10) //c.lwsp
            && (x_inst[11:7] != 5'b0)
        ||  ({x_inst[15:13],x_inst[1:0]} == 5'b011_10) //c.ldsp
            && (x_inst[11:7] != 5'b0)
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00000_100_0001011) //lrb
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00100_100_0001011) //lrh
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01000_100_0001011) //lrw
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01100_100_0001011) //lrd
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10000_100_0001011) //lrbu
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10100_100_0001011) //lrhu
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11000_100_0001011) //lrwu
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00010_100_0001011) //lurb
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00110_100_0001011) //lurh
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01010_100_0001011) //lurw
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01110_100_0001011) //lurd
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10010_100_0001011) //lurbu
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10110_100_0001011) //lurhu
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11010_100_0001011) //lurwu
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00001_100_0001011) //lbib
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00011_100_0001011) //lbia
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00101_100_0001011) //lhib
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00111_100_0001011) //lhia
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01001_100_0001011) //lwib
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01011_100_0001011) //lwia
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01101_100_0001011) //ldib
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01111_100_0001011) //ldia
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10001_100_0001011) //lbuib
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10011_100_0001011) //lbuia
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10101_100_0001011) //lhuib
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10111_100_0001011) //lhuia
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11001_100_0001011) //lwuib
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11011_100_0001011) //lwuia
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11100_100_0001011) //lwd
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11110_100_0001011) //lwud
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11111_100_0001011) //ldd
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01000_110_0001011) //flrw
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01100_110_0001011) //flrd
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01010_110_0001011) //flurw
        ||  ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01110_110_0001011); //flurd

//==========================================================
//                   Decode Vtype Inst
//==========================================================
//vsetvli inst :
//-----+----------------+---------+-------+-------+---------------+
//  31 |30            20|19     15|14   12|11    7|6            0 |
//   1 |   zimm[10:0]   |   rs1   | 1 1 1 |   rd  | 1 0 1 0 1 1 1 |
//-----+----------------+---------+-------+-------+---------------+
assign x_vsetvli = !x_inst[31]
                && (x_inst[14:12] == 3'b111)
                && (x_inst[6:0] == 7'b1010111);

//vlmul & vsew
//zimm[10:0]:
//10:7:  Reserverd
// 6:5:  vediv, Used for EDIV extention,reserved for xuantie910
// 4:2:  vsew,standard element width setting
// 1:0:  vlmul,vector register group multiplier setting
assign x_vsew[2:0]  = x_inst[24:22];
assign x_vlmul[1:0] = x_inst[21:20]; 
assign x_vlmax[7:0] = (cp0_ifu_vsetvli_pred_disable) 
                      ? cp0_ifu_vl[7:0]
                      : ((8'b00010000 >> x_inst[23:22]) <<x_inst[21:20]);

//==========================================================
//                 Decode Immediate Offset
//==========================================================
assign x_offset_21_ab_br_vld   = (x_inst[6:0] == 7'b1101111); //JAL
assign x_offset_21_ab_br[20:0] = {
                                  x_inst[31],  
                                  x_inst[19:12], 
                                  x_inst[20],
                                  x_inst[30:21],
                                  1'b0
                                 };

assign x_offset_12_ind_br_vld   = (x_inst[6:0] == 7'b1100111); //JARL
assign x_offset_12_ind_br[20:0] = {
                                   {9{x_inst[31]}},
                                   x_inst[31:20]
                                  };

assign x_offset_13_con_br_vld   = (x_inst[6:0] == 7'b1100011); //BEQ/BNE/BLT/BGE/BLTU/BGEU
assign x_offset_13_con_br[20:0] = {
                                   {9{x_inst[31]}},
                                    x_inst[7],
                                    x_inst[30:25],
                                    x_inst[11:8],
                                    1'b0
                                  };

assign x_offset_12_ab_br_vld    = ({x_inst[15:13],x_inst[1:0]} == 5'b10101); //C.J
assign x_offset_12_ab_br[20:0]  = {
                                   {10{x_inst[12]}},
                                   x_inst[8],
                                   x_inst[10:9],
                                   x_inst[6],
                                   x_inst[7],
                                   x_inst[2],
                                   x_inst[11],
                                   x_inst[5:3],
                                   1'b0
                                  };

assign x_offset_9_con_br_vld    = ({x_inst[15:14],x_inst[1:0]} == 4'b1101); //C.BEQZ/C.BNEZ
assign x_offset_9_con_br[20:0]  = {
                                   {13{x_inst[12]}},
                                   x_inst[6:5],
                                   x_inst[2],
                                   x_inst[11:10],
                                   x_inst[4:3],
                                   1'b0
                                  };

//default will choose 0 as C.J/C.JARL result                                        
assign x_offset[20:0] = 
    {21{x_offset_21_ab_br_vld}}  & x_offset_21_ab_br[20:0]
  | {21{x_offset_12_ind_br_vld}} & x_offset_12_ind_br[20:0]
  | {21{x_offset_13_con_br_vld}} & x_offset_13_con_br[20:0]
  | {21{x_offset_12_ab_br_vld}}  & x_offset_12_ab_br[20:0]
  | {21{x_offset_9_con_br_vld}}  & x_offset_9_con_br[20:0];

// &ModuleEnd; @361
endmodule


