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

// &ModuleBeg; @27
module ct_idu_rf_pipe2_decd(
  pipe2_decd_func,
  pipe2_decd_offset,
  pipe2_decd_opcode,
  pipe2_decd_src1_imm
);

// &Ports; @28
input   [31:0]  pipe2_decd_opcode;  
output  [7 :0]  pipe2_decd_func;    
output  [20:0]  pipe2_decd_offset;  
output  [63:0]  pipe2_decd_src1_imm; 

// &Regs; @29
reg     [7 :0]  decd_16_func;       
reg     [7 :0]  decd_32_func;       
reg     [20:0]  pipe2_decd_offset;  

// &Wires; @30
wire    [5 :0]  decd_imm_sel;       
wire    [31:0]  decd_op;            
wire    [7 :0]  pipe2_decd_func;    
wire    [31:0]  pipe2_decd_opcode;  
wire    [63:0]  pipe2_decd_src1_imm; 



//==========================================================
//                    Rename Input
//==========================================================
assign decd_op[31:0] = pipe2_decd_opcode[31:0];

//==========================================================
//                       Immediate
//==========================================================
//----------------------------------------------------------
//                   Source 1 immediate
//----------------------------------------------------------
assign pipe2_decd_src1_imm[63:0] = 64'b0;

//----------------------------------------------------------
//                    Offset Selection
//----------------------------------------------------------
//32 bit imm20
assign decd_imm_sel[0]   = (decd_op[3:0] == 4'b1111);
//32 bit imm12
assign decd_imm_sel[1]   = (decd_op[3:0] == 4'b0111);
//32 bit imm13
assign decd_imm_sel[2]   = (decd_op[3:0] == 4'b0011);
//16 bit imm12
assign decd_imm_sel[3]   = ({decd_op[15:14],decd_op[1:0]} == 4'b10_01);
//16 bit imm9
assign decd_imm_sel[4]   = ({decd_op[15:14],decd_op[1:0]} == 4'b11_01);
//16 bit 0
assign decd_imm_sel[5]   = (decd_op[1:0] == 2'b10);

//----------------------------------------------------------
//                     Offset immediate
//----------------------------------------------------------
// &CombBeg; @65
always @( decd_op[31:2]
       or decd_imm_sel[5:0])
begin
  case(decd_imm_sel[5:0])
    6'h01  : pipe2_decd_offset[20:0] = {decd_op[31],decd_op[19:12],
                                        decd_op[20], decd_op[30:21],1'b0};
    6'h02  : pipe2_decd_offset[20:0] = {{9{decd_op[31]}},decd_op[31:20]};
    6'h04  : pipe2_decd_offset[20:0] = {{8{decd_op[31]}},decd_op[31],
                                        decd_op[7], decd_op[30:25],
                                        decd_op[11:8],1'b0};
    6'h08  : pipe2_decd_offset[20:0] = {{9{decd_op[12]}},decd_op[12],
                                        decd_op[8], decd_op[10:9],
                                        decd_op[6], decd_op[7],
                                        decd_op[2], decd_op[11],
                                        decd_op[5:3],1'b0};
    6'h10  : pipe2_decd_offset[20:0] = {{12{decd_op[12]}},decd_op[12],
                                        decd_op[6:5], decd_op[2],
                                        decd_op[11:10], decd_op[4:3],1'b0};
    6'h20  : pipe2_decd_offset[20:0] = 21'b0;
    default: pipe2_decd_offset[20:0] = {21{1'bx}};
  endcase
// &CombEnd; @84
end

//==========================================================
//      Full Decoder for function and operand prepare
//==========================================================
//----------------------------------------------------------
//                  Rename for Output
//----------------------------------------------------------
assign pipe2_decd_func[7:0]            = (decd_op[1:0] == 2'b11)
                                         ? decd_32_func[7:0]
                                         : decd_16_func[7:0];

//----------------------------------------------------------
//                  16 bit FUll Decoder
//----------------------------------------------------------
// &CombBeg; @99
always @( decd_op[6:5]
       or decd_op[1:0]
       or decd_op[15:10])
begin
  //initialize decoded information value
  casez({decd_op[15:10], decd_op[6:5], decd_op[1:0]})
    //16-bits instructions decode logic
    10'b101???_??01: //c.j
      decd_16_func[7:0]                 = 8'b01_000000;
    10'b110???_??01: //c.beqz
      decd_16_func[7:0]                 = 8'b00_100000;
    10'b111???_??01: //c.bnez
      decd_16_func[7:0]                 = 8'b00_010000;
    10'b1000??_??10: //c.jr
      decd_16_func[7:0]                 = 8'b10_000000;
    10'b1001??_??10: //c.jalr
      decd_16_func[7:0]                 = 8'b10_000000;
    default:         //invalid instruction
      decd_16_func[7:0]                 = 8'b0;
  endcase
// &CombEnd; @116
end

//----------------------------------------------------------
//                   32 bits Full Decoder
//----------------------------------------------------------
// &CombBeg; @121
always @( decd_op[6:2]
       or decd_op[31:25]
       or decd_op[14:12])
begin
  //initialize decoded information value
  casez({decd_op[31:25], decd_op[14:12], decd_op[6:2]})
    //32-bits instructions decode logic
    15'b??????????11011: //jal (dst_vld deal in split)
      decd_32_func[7:0]                 = 8'b01000000;
    15'b???????00011001: //jalr (dst_vld deal in split)
      decd_32_func[7:0]                 = 8'b10000000;
    15'b???????00011000: //beq
      decd_32_func[7:0]                 = 8'b00100000;
    15'b???????00111000: //bne
      decd_32_func[7:0]                 = 8'b00_010000;
    15'b???????10011000: //blt
      decd_32_func[7:0]                 = 8'b00001000;
    15'b???????10111000: //bge
      decd_32_func[7:0]                 = 8'b00000010;
    15'b???????11011000: //bltu
      decd_32_func[7:0]                 = 8'b00000100;
    15'b???????11111000: //bgeu
      decd_32_func[7:0]                 = 8'b00000001;
    default:               //invalid instruction
      decd_32_func[7:0]                 = 8'b0;
  endcase
// &CombEnd; @144
end

// &ModuleEnd; @146
endmodule


