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
module ct_idu_id_decd_special(
  cp0_idu_cskyee,
  cp0_idu_frm,
  cp0_idu_fs,
  x_fence,
  x_fence_type,
  x_inst,
  x_split,
  x_split_long_type,
  x_split_potnt,
  x_split_short,
  x_split_short_potnt,
  x_split_short_type
);

// &Ports; @26
input           cp0_idu_cskyee;     
input   [2 :0]  cp0_idu_frm;        
input   [1 :0]  cp0_idu_fs;         
input   [31:0]  x_inst;             
output          x_fence;            
output  [2 :0]  x_fence_type;       
output          x_split;            
output  [9 :0]  x_split_long_type;  
output  [2 :0]  x_split_potnt;      
output          x_split_short;      
output  [2 :0]  x_split_short_potnt; 
output  [6 :0]  x_split_short_type; 

// &Regs; @27

// &Wires; @28
wire            cp0_idu_cskyee;     
wire    [2 :0]  cp0_idu_frm;        
wire    [1 :0]  cp0_idu_fs;         
wire            hfence_inst;        
wire            x_fence;            
wire    [2 :0]  x_fence_type;       
wire    [31:0]  x_inst;             
wire            x_split;            
wire    [9 :0]  x_split_long_type;  
wire    [2 :0]  x_split_potnt;      
wire            x_split_short;      
wire    [2 :0]  x_split_short_potnt; 
wire    [6 :0]  x_split_short_type; 



// &Force("bus","x_inst",31,0); @31
//==========================================================
//                 Decode Split Short Type
//==========================================================
// &Force("output","x_split_short_type"); @35
//----------------------------------------------------------
//                 Instruction Split Short
//----------------------------------------------------------
assign x_split_short   = |x_split_short_type[6:0];

//----------------------------------------------------------
//                      jal with dest
//----------------------------------------------------------
assign x_split_short_type[0] = ({x_inst[15:12], x_inst[6:0]} == 11'b1001_0000010)
                               && (x_inst[11:7] != 5'd0) //c.jalr
                            || (x_inst[6:0] == 7'b1101111)
                               && (x_inst[11:7] != 5'd0) //jalr
                            || ({x_inst[14:12],x_inst[6:0]} == 10'b000_1100111)
                               && (x_inst[11:7] != 5'd0); //jalr

//----------------------------------------------------------
//                  FP compare and convert
//----------------------------------------------------------
assign x_split_short_type[1] = ( ({x_inst[31:27],x_inst[24:22],x_inst[6:0]} == 15'b11000_000_1010011)
                               || ({x_inst[31:27],x_inst[24:22],x_inst[6:0]} == 15'b11010_000_1010011))
                            && !(cp0_idu_fs[1:0] == 2'b00)                                //fs bit   
                            && !((x_inst[14:12] == 3'b101) || (x_inst[14:12] == 3'b110))  //illegal
                            && !((x_inst[14:12] == 3'b111)
                                  && ((cp0_idu_frm[2:0] == 3'b101)
                                      ||(cp0_idu_frm[2:0] == 3'b110)
                                      ||(cp0_idu_frm[2:0] == 3'b111)));

//----------------------------------------------------------
//                  Indexed Load and Store
//----------------------------------------------------------
assign x_split_short_type[2] =
  cp0_idu_cskyee
  && (({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00001_100_0001011) //lbib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00011_100_0001011) //lbia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00101_100_0001011) //lhib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00111_100_0001011) //lhia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01001_100_0001011) //lwib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01011_100_0001011) //lwia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01101_100_0001011) //ldib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01111_100_0001011) //ldia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10001_100_0001011) //lbuib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10011_100_0001011) //lbuia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10101_100_0001011) //lhuib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10111_100_0001011) //lhuia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11001_100_0001011) //lwuib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11011_100_0001011) //lwuia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00001_101_0001011) //sbib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00011_101_0001011) //sbia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00101_101_0001011) //shib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00111_101_0001011) //shia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01001_101_0001011) //swib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01011_101_0001011) //swia
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01101_101_0001011) //sdib
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01111_101_0001011));//sdia

//----------------------------------------------------------
//                  Indexed Load and Store
//----------------------------------------------------------
assign x_split_short_type[3] =
  cp0_idu_cskyee
  && (({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11100_100_0001011) //lwd
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11110_100_0001011) //lwud
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11111_100_0001011) //ldd
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11100_101_0001011) //swd
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b11111_101_0001011));//sdd


assign x_split_short_potnt[0]   = |x_split_short_type[3:0];
assign x_split_short_potnt[2:1] = 2'b0;
assign x_split_short_type[6:4]  = 3'b0;
//==========================================================
//                 Decode Split long Type
//==========================================================
// &Force("output","x_split_long_type"); @314
//----------------------------------------------------------
//                Instruction Split Long
//----------------------------------------------------------
assign x_split         = |x_split_long_type[9:0];

//----------------------------------------------------------
//               Atomic Load / Store / AMO
//----------------------------------------------------------
assign x_split_long_type[0] = ({x_inst[14:13],x_inst[6:0]} == 9'b01_0101111)
                              && (({x_inst[31:27],x_inst[24:20]}
                                   == 10'b00010_00000) //lr.w/d
                               || (x_inst[31:27] == 5'b00011) //sc.w/d
                               || (x_inst[31:27] == 5'b00000) //amoadd.w/d
                               || (x_inst[31:27] == 5'b00001) //amoswap.w/d
                               || (x_inst[31:27] == 5'b00100) //amoxor.w/d
                               || (x_inst[31:27] == 5'b01000) //amoor.w/d
                               || (x_inst[31:27] == 5'b01100) //amoand.w/d
                               || (x_inst[31:27] == 5'b10000) //amomin.w/d
                               || (x_inst[31:27] == 5'b10100) //amomax.w/d
                               || (x_inst[31:27] == 5'b11000) //amominu.w/d
                               || (x_inst[31:27] == 5'b11100)); //amomaxu.w/d

assign x_split_potnt[0]     = x_split_long_type[0];
assign x_split_potnt[2:1]   = 2'b0;
assign x_split_long_type[1] = 1'b0;//normal vector inst
assign x_split_long_type[2] = 1'b0;//permute inst
assign x_split_long_type[3] = 1'b0;//vfreduction inst
assign x_split_long_type[4] = 1'b0;//stride vec load store inst
assign x_split_long_type[5] = 1'b0;//index vec load store inst
assign x_split_long_type[6] = 1'b0;//vector amo
assign x_split_long_type[7] = 1'b0;//zvlsseg unit
assign x_split_long_type[8] = 1'b0;//zvlsseg stride
assign x_split_long_type[9] = 1'b0;//zvlsseg index
//==========================================================
//                Decode Fence Instruction
//==========================================================
// &Force("output","x_fence_type"); @431
//----------------------------------------------------------
//                   Instruction Fence
//----------------------------------------------------------
assign x_fence         = |x_fence_type[2:0];

//----------------------------------------------------------
//                   Fence.i Instruction
//----------------------------------------------------------
assign x_fence_type[0] = cp0_idu_cskyee
                      && ((x_inst[31:0] == 32'h0180000b)  //sync
                       || (x_inst[31:0] == 32'h0190000b)  //sync.s
                       || (x_inst[31:0] == 32'h01a0000b)  //sync.i
                       || (x_inst[31:0] == 32'h01b0000b)  //sync.is
                       || (x_inst[31:0] == 32'h0010000b)  //dcache.call
                       || (x_inst[31:0] == 32'h0020000b)  //dcache.iall
                       || (x_inst[31:0] == 32'h0030000b));//dcache.ciall

//----------------------------------------------------------
//                    CP0 Instruction
//----------------------------------------------------------
assign x_fence_type[1] = (x_inst[31:0] == 32'h10200073) //sret
//                      || (x_inst[31:0] == 32'h00000073) //ecall
//                      || (x_inst[31:0] == 32'h00100073) //ebreak
                      || (x_inst[31:0] == 32'h30200073) //mret
                      || (x_inst[31:0] == 32'h10500073) //wfi
//                      || (x_inst[15:0] == 16'h9002) //c.ebreak
                      || ({x_inst[14:12],x_inst[6:0]} == 10'b001_1110011) //csrrw
                      || ({x_inst[14:12],x_inst[6:0]} == 10'b010_1110011) //csrrs
                      || ({x_inst[14:12],x_inst[6:0]} == 10'b011_1110011) //csrrc
                      || ({x_inst[14:12],x_inst[6:0]} == 10'b101_1110011) //csrwi
                      || ({x_inst[14:12],x_inst[6:0]} == 10'b110_1110011) //csrsi
                      || ({x_inst[14:12],x_inst[6:0]} == 10'b111_1110011); //csrci

//----------------------------------------------------------
//                   sfence Instruction
//----------------------------------------------------------
assign hfence_inst = 1'b0;
assign x_fence_type[2] = ({x_inst[14:12],x_inst[6:0]} == 10'b001_0001111) //fence.i
                      || ({x_inst[31:25],x_inst[14:0]}
                         == 22'b0001001_000000001110011) //sfence.vma
                      || hfence_inst;


// &ModuleEnd; @484
endmodule


