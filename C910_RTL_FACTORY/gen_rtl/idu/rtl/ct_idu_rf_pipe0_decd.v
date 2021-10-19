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
module ct_idu_rf_pipe0_decd(
  pipe0_decd_eu_sel,
  pipe0_decd_expt_vld,
  pipe0_decd_func,
  pipe0_decd_imm,
  pipe0_decd_opcode,
  pipe0_decd_sel,
  pipe0_decd_src1_imm
);

// &Ports; @28
input           pipe0_decd_expt_vld; 
input   [31:0]  pipe0_decd_opcode;  
output  [3 :0]  pipe0_decd_eu_sel;  
output  [4 :0]  pipe0_decd_func;    
output  [5 :0]  pipe0_decd_imm;     
output  [20:0]  pipe0_decd_sel;     
output  [63:0]  pipe0_decd_src1_imm; 

// &Regs; @29
reg     [3 :0]  decd_16_eu_sel;     
reg     [4 :0]  decd_16_func;       
reg     [20:0]  decd_16_sel;        
reg     [3 :0]  decd_32_eu_sel;     
reg     [4 :0]  decd_32_func;       
reg     [20:0]  decd_32_sel;        
reg     [3 :0]  pipe0_decd_eu_sel;  
reg     [4 :0]  pipe0_decd_func;    
reg     [20:0]  pipe0_decd_sel;     
reg     [63:0]  pipe0_decd_src1_imm; 

// &Wires; @30
wire    [9 :0]  decd_caddi4spn_imm; 
wire    [9 :0]  decd_caddisp_imm;   
wire            decd_expt_vld;      
wire    [5 :0]  decd_ext_offset;    
wire    [4 :0]  decd_imm_sel;       
wire    [31:0]  decd_op;            
wire            pipe0_decd_expt_vld; 
wire    [5 :0]  pipe0_decd_imm;     
wire    [31:0]  pipe0_decd_opcode;  



//==========================================================
//                    Rename Input
//==========================================================
assign decd_op[31:0] = pipe0_decd_opcode[31:0];
assign decd_expt_vld = pipe0_decd_expt_vld;

//==========================================================
//                       Immediate
//==========================================================
//----------------------------------------------------------
//                   Immediate Selection
//----------------------------------------------------------
//32 bit imm20
assign decd_imm_sel[0]   = (decd_op[6:0] == 7'b0110111)
                        || (decd_op[6:0] == 7'b0010111);
//32 bit imm12
assign decd_imm_sel[1]   = (decd_op[1:0] == 2'b11)
                           && !decd_imm_sel[0];
//16 bit imm6
assign decd_imm_sel[2]   = (decd_op[1:0] != 2'b11)
                           && !decd_imm_sel[3]
                           && !decd_imm_sel[4];
//16 bit caddisp
assign decd_imm_sel[3]   = ({decd_op[15:13],decd_op[11:7],
                             decd_op[1:0]} == 10'b011_00010_01);
//16 bit caddi4spn
assign decd_imm_sel[4]   = ({decd_op[15:13],decd_op[1:0]}
                            == 5'b000_00);

//----------------------------------------------------------
//                   Source 1 immediate
//----------------------------------------------------------
assign decd_caddisp_imm[9:0]   = {decd_op[12],decd_op[4:3],
                                  decd_op[5], decd_op[2],
                                  decd_op[6], 4'b0};

assign decd_caddi4spn_imm[9:0] = {decd_op[10:7],decd_op[12:11],
                                  decd_op[5], decd_op[6],2'b0};

// &CombBeg; @72
always @( decd_op[6:2]
       or decd_imm_sel[4:0]
       or decd_op[31:12]
       or decd_caddi4spn_imm[9:0]
       or decd_caddisp_imm[9:0])
begin
  case(decd_imm_sel[4:0])
    5'h01  : pipe0_decd_src1_imm[63:0] = {44'b0, decd_op[31:12]};
    5'h02  : pipe0_decd_src1_imm[63:0] = {{52{decd_op[31]}},decd_op[31:20]};
    5'h04  : pipe0_decd_src1_imm[63:0] = {{58{decd_op[12]}},
                                              decd_op[12],decd_op[6:2]};
    5'h08  : pipe0_decd_src1_imm[63:0] = {{54{decd_caddisp_imm[9]}},
                                              decd_caddisp_imm[9:0]};
    5'h10  : pipe0_decd_src1_imm[63:0] = {54'b0, decd_caddi4spn_imm[9:0]};
    default: pipe0_decd_src1_imm[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @83
end

//----------------------------------------------------------
//                     Source immediate
//----------------------------------------------------------
assign decd_ext_offset[5:0] = decd_op[31:26] - decd_op[25:20];

assign pipe0_decd_imm[5:0]  = decd_op[13] ? decd_ext_offset[5:0]
                                          : {4'b0,decd_op[26:25]};

//==========================================================
//      Full Decoder for function and operand prepare
//==========================================================
//----------------------------------------------------------
//                Execution Units Define
//----------------------------------------------------------
parameter EU_WIDTH              = 4;

parameter ALU                   = 4'b0001;
parameter DIV                   = 4'b0010;
parameter SPECIAL               = 4'b0100;
parameter CP0                   = 4'b1000;

parameter ALU_SEL               = 21;

parameter NON_ALU               = 21'h0;

parameter ADDER_ADD             = 21'h000001;
parameter ADDER_ADDW            = 21'h000002;
parameter ADDER_SUB             = 21'h000004;
parameter ADDER_SUBW            = 21'h000008;
parameter ADDER_SLT             = 21'h000010;
parameter SHIFTER_SL            = 21'h000020;
parameter SHIFTER_SR            = 21'h000040;
parameter SHIFTER_SLW           = 21'h000080;
parameter SHIFTER_SRW           = 21'h000100;
parameter SHIFTER_EXT           = 21'h000200;
parameter LOGIC_AND             = 21'h000400;
parameter LOGIC_OR              = 21'h000800;
parameter LOGIC_XOR             = 21'h001000;
parameter LOGIC_LUI             = 21'h002000;
parameter LOGIC_CLI             = 21'h004000;
parameter MISC_MV               = 21'h008000;
parameter MISC_TSTNBZ           = 21'h010000;
parameter MISC_TST              = 21'h020000;
parameter MISC_FF1              = 21'h040000;
parameter MISC_REV              = 21'h080000;
parameter MISC_REVW             = 21'h100000;

parameter ADDER_MAX             = 21'h01;
parameter ADDER_MAXW            = 21'h02;
parameter ADDER_MIN             = 21'h04;
parameter ADDER_MINW            = 21'h08;
parameter ADDER_ADDSL           = 21'h20;

parameter SPECIAL_NOP           = 5'b00000;
parameter SPECIAL_ECALL         = 5'b00010;
parameter SPECIAL_EBREAK        = 5'b00011;
parameter SPECIAL_AUIPC         = 5'b00100;
parameter SPECIAL_PSEUDO_AUIPC  = 5'b00101;
parameter SPECIAL_VSETVLI       = 5'b00110;
parameter SPECIAL_VSETVL        = 5'b00111;

//----------------------------------------------------------
//                  Rename for Output
//----------------------------------------------------------
// &CombBeg; @149
always @( decd_16_sel[20:0]
       or decd_16_func[4:0]
       or decd_expt_vld
       or decd_32_sel[20:0]
       or decd_32_func[4:0]
       or decd_op[1:0]
       or decd_16_eu_sel[3:0]
       or decd_32_eu_sel[3:0])
begin
  if(decd_expt_vld) begin
    pipe0_decd_eu_sel[EU_WIDTH-1:0] = SPECIAL;
    pipe0_decd_func[4:0]            = SPECIAL_NOP;
    pipe0_decd_sel[ALU_SEL-1:0]     = NON_ALU;
  end
  else if(decd_op[1:0] == 2'b11) begin
    pipe0_decd_eu_sel[EU_WIDTH-1:0] = decd_32_eu_sel[EU_WIDTH-1:0];
    pipe0_decd_func[4:0]            = decd_32_func[4:0];
    pipe0_decd_sel[ALU_SEL-1:0]     = decd_32_sel[ALU_SEL-1:0];
  end
  else begin
    pipe0_decd_eu_sel[EU_WIDTH-1:0] = decd_16_eu_sel[EU_WIDTH-1:0];
    pipe0_decd_func[4:0]            = decd_16_func[4:0];
    pipe0_decd_sel[ALU_SEL-1:0]     = decd_16_sel[ALU_SEL-1:0];
  end
// &CombEnd; @165
end

//----------------------------------------------------------
//                  16 bit FUll Decoder
//----------------------------------------------------------
// &CombBeg; @170
always @( decd_op[15:0])
begin
  //initialize decoded information value

  casez({decd_op[15:10], decd_op[6:5], decd_op[1:0]})
    //16-bits instructions decode logic
    10'b000???_??00:begin //c.addi4spn
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00000;
      decd_16_sel[ALU_SEL-1:0]             = ADDER_ADD;
      end
    10'b000???_??01:begin //c.addi / c.nop
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00000;
      decd_16_sel[ALU_SEL-1:0]             = ADDER_ADD;
      end
    10'b001???_??01:begin //c.addiw
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00001;
      decd_16_sel[ALU_SEL-1:0]             = ADDER_ADDW;
      end
    10'b010???_??01:begin //c.li
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b10000;
      decd_16_sel[ALU_SEL-1:0]             = LOGIC_CLI;
      end
    10'b011???_??01:begin //c.addi16sp, c.lui
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = (decd_op[11:7] == 5'd2)
                                             ? 5'b00000 : 5'b01000;
      decd_16_sel[ALU_SEL-1:0]             = (decd_op[11:7] == 5'd2)
                                             ? ADDER_ADD : LOGIC_LUI;
      end
    10'b100?00_??01:begin //c.srli
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00001;
      decd_16_sel[ALU_SEL-1:0]             = SHIFTER_SR;
      end
    10'b100?01_??01:begin //c.srai
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00011;
      decd_16_sel[ALU_SEL-1:0]             = SHIFTER_SR;
      end
    10'b100?10_??01:begin //c.andi
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00001;
      decd_16_sel[ALU_SEL-1:0]             = LOGIC_AND;
      end
    10'b100011_0001:begin //c.sub
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00010;
      decd_16_sel[ALU_SEL-1:0]             = ADDER_SUB;
      end
    10'b100011_0101:begin //c.xor
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00100;
      decd_16_sel[ALU_SEL-1:0]             = LOGIC_XOR;
      end
    10'b100011_1001:begin //c.or
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00010;
      decd_16_sel[ALU_SEL-1:0]             = LOGIC_OR;
      end
    10'b100011_1101:begin //c.and
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00001;
      decd_16_sel[ALU_SEL-1:0]             = LOGIC_AND;
      end
    10'b100111_0001:begin //c.subw
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00011;
      decd_16_sel[ALU_SEL-1:0]             = ADDER_SUBW;
      end
    10'b100111_0101:begin //c.addw
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00001;
      decd_16_sel[ALU_SEL-1:0]             = ADDER_ADDW;
      end
    10'b000???_??10:begin //c.slli
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00000;
      decd_16_sel[ALU_SEL-1:0]             = SHIFTER_SL;
      end
    10'b1000??_??10:begin //c.mv
      decd_16_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_16_func[4:0]                    = 5'b00000;
      decd_16_sel[ALU_SEL-1:0]             = MISC_MV;
      end
    10'b1001??_??10:begin //c.add //c.ebreak
      decd_16_eu_sel[EU_WIDTH-1:0]         = (decd_op[6:2] == 5'b0)
                                             ? SPECIAL : ALU;
      decd_16_func[4:0]                    = (decd_op[6:2] == 5'b0)
                                             ? SPECIAL_EBREAK : 5'b00000;
      decd_16_sel[ALU_SEL-1:0]             = (decd_op[6:2] == 5'b0)
                                             ? NON_ALU : ADDER_ADD;
      end
    default:begin                //invalid instruction
      decd_16_eu_sel[EU_WIDTH-1:0]         = {EU_WIDTH{1'b0}};
      decd_16_func[4:0]                    = 5'b0;
      decd_16_sel[ALU_SEL-1:0]             = NON_ALU;
    end
  endcase
// &CombEnd; @271
end

//----------------------------------------------------------
//                   32 bits Full Decoder
//----------------------------------------------------------
// &CombBeg; @276
always @( decd_op[6:2]
       or decd_op[31:25]
       or decd_op[20]
       or decd_op[14:12])
begin
  //initialize decoded information value
  casez({decd_op[31:25], decd_op[14:12], decd_op[6:2]})
    15'b??????????01101:begin //lui
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b01000;
      decd_32_sel[ALU_SEL-1:0]             = LOGIC_LUI;
      end
    15'b??????????00101:begin //auipc
      decd_32_eu_sel[EU_WIDTH-1:0]         = SPECIAL;
      decd_32_func[4:0]                    = SPECIAL_AUIPC;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b??????????00111:begin //pseudo auipc
      decd_32_eu_sel[EU_WIDTH-1:0]         = SPECIAL;
      decd_32_func[4:0]                    = SPECIAL_PSEUDO_AUIPC;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b???????00000100:begin //addi
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00000;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_ADD;
      end
    15'b???????01000100:begin //slti
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00110;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_SLT;
      end
    15'b???????01100100:begin //sltiu
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b01110;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_SLT;
      end
    15'b???????10000100:begin //xori
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00100;
      decd_32_sel[ALU_SEL-1:0]             = LOGIC_XOR;
      end
    15'b???????11000100:begin //ori
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00010;
      decd_32_sel[ALU_SEL-1:0]             = LOGIC_OR;
      end
    15'b???????11100100:begin //andi
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00001;
      decd_32_sel[ALU_SEL-1:0]             = LOGIC_AND;
      end
    15'b000000?00100100:begin //slli
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00000;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SL;
      end
    15'b000000?10100100:begin //srli
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00001;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SR;
      end
    15'b010000?10100100:begin //srai
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00011;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SR;
      end
    15'b???????00000110:begin //addiw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00001;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_ADDW;
      end
    15'b000000000100110:begin //slliw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00100;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SLW;
      end
    15'b000000010100110:begin //srliw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00101;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SRW;
      end
    15'b010000010100110:begin //sraiw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00111;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SRW;
      end
    15'b000000000001110:begin //addw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00001;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_ADDW;
      end
    15'b010000000001110:begin //subw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00011;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_SUBW;
      end
    15'b000000000101110:begin //sllw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00100;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SLW;
      end
    15'b000000010101110:begin //srlw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00101;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SRW;
      end
    15'b010000010101110:begin //sraw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00111;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SRW;
      end
    15'b000000000001100:begin //add
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00000;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_ADD;
      end
    15'b010000000001100:begin //sub
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00010;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_SUB;
      end
    15'b000000000101100:begin //sll
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00000;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SL;
      end
    15'b000000001001100:begin //slt
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00110;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_SLT;
      end
    15'b010000001001100:begin //pseudo_min
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b10100;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_MIN;
      end
    15'b011000001001100:begin //pseudo_max
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b10000;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_MAX;
      end
    15'b010000001001110:begin //pseudo_minw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b10101;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_MINW;
      end
    15'b011000001001110:begin //pseudo_maxw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b10001;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_MAXW;
      end
    15'b000000001101100:begin //sltu
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b01110;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_SLT;
      end
    15'b010000001101100:begin //pseudo_minu
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b11100;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_MIN;
      end
    15'b011000001101100:begin //pseudo_maxu
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b11000;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_MAX;
      end
    15'b010000001101110:begin //pseudo_minuw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b11101;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_MINW;
      end
    15'b011000001101110:begin //pseudo_maxuw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b11001;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_MAXW;
      end
    15'b000000010001100:begin //xor
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00100;
      decd_32_sel[ALU_SEL-1:0]             = LOGIC_XOR;
      end
    15'b000000010101100:begin //srl
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00001;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SR;
      end
    15'b010000010101100:begin //sra
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00011;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SR;
      end
    15'b000000011001100:begin //or
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00010;
      decd_32_sel[ALU_SEL-1:0]             = LOGIC_OR;
      end
    15'b000000011101100:begin //and
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00001;
      decd_32_sel[ALU_SEL-1:0]             = LOGIC_AND;
      end
    15'b000000110001100:begin //div
      decd_32_eu_sel[EU_WIDTH-1:0]         = DIV;
      decd_32_func[4:0]                    = 5'b00101;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000000110101100:begin //divu
      decd_32_eu_sel[EU_WIDTH-1:0]         = DIV;
      decd_32_func[4:0]                    = 5'b00100;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000000111001100:begin //rem
      decd_32_eu_sel[EU_WIDTH-1:0]         = DIV;
      decd_32_func[4:0]                    = 5'b01001;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000000111101100:begin //remu
      decd_32_eu_sel[EU_WIDTH-1:0]         = DIV;
      decd_32_func[4:0]                    = 5'b01000;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000000110001110:begin //divw
      decd_32_eu_sel[EU_WIDTH-1:0]         = DIV;
      decd_32_func[4:0]                    = 5'b00111;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000000110101110:begin //divuw
      decd_32_eu_sel[EU_WIDTH-1:0]         = DIV;
      decd_32_func[4:0]                    = 5'b00110;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000000111001110:begin //remw
      decd_32_eu_sel[EU_WIDTH-1:0]         = DIV;
      decd_32_func[4:0]                    = 5'b01011;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000000111101110:begin //remuw
      decd_32_eu_sel[EU_WIDTH-1:0]         = DIV;
      decd_32_func[4:0]                    = 5'b01010;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000000000011100:begin //ecall ebreak
      decd_32_eu_sel[EU_WIDTH-1:0]         = SPECIAL;
      decd_32_func[4:0]                    = (decd_op[20])
                                             ? SPECIAL_EBREAK : SPECIAL_ECALL;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b000100000011100:begin //sret wfi
      //deal in fence
      decd_32_eu_sel[EU_WIDTH-1:0]         = CP0;
      decd_32_func[4:0]                    = (decd_op[20])
                                             ? 5'b01001 :5'b01000;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b001100000011100:begin //mret
      //deal in fence
      decd_32_eu_sel[EU_WIDTH-1:0]         = CP0;
      decd_32_func[4:0]                    = 5'b01010;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b???????00111100:begin //csrrw
      //deal in fence
      decd_32_eu_sel[EU_WIDTH-1:0]         = CP0;
      decd_32_func[4:0]                    = 5'b10000;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b???????01011100:begin //csrrs
      //deal in fence
      decd_32_eu_sel[EU_WIDTH-1:0]         = CP0;
      decd_32_func[4:0]                    = 5'b10001;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b???????01111100:begin //csrrc
      //deal in fence
      decd_32_eu_sel[EU_WIDTH-1:0]         = CP0;
      decd_32_func[4:0]                    = 5'b10010;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b???????10111100:begin //csrwi
      //deal in fence
      decd_32_eu_sel[EU_WIDTH-1:0]         = CP0;
      decd_32_func[4:0]                    = 5'b10011;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b???????11011100:begin //csrsi
      //deal in fence
      decd_32_eu_sel[EU_WIDTH-1:0]         = CP0;
      decd_32_func[4:0]                    = 5'b10100;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b???????11111100:begin //csrci
      //deal in fence
      decd_32_eu_sel[EU_WIDTH-1:0]         = CP0;
      decd_32_func[4:0]                    = 5'b10101;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b111101000010100:begin //fmv.h.x
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b10000;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b111100000010100:begin //fmv.w.x
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00001;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b111100100010100:begin //fmv.d.x
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00010;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b00000??00100010:begin //addsl
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00111;
      decd_32_sel[ALU_SEL-1:0]             = ADDER_ADDSL;
      end
    15'b000100?00100010:begin //srri
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b10001;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SR;
      end
    15'b000101?00100010:begin //srriw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b10101;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_SRW;
      end
    15'b100000000100010:begin //tstnbz
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00100;
      decd_32_sel[ALU_SEL-1:0]             = MISC_TSTNBZ;
      end
    15'b100000100100010:begin //rev
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b01000;
      decd_32_sel[ALU_SEL-1:0]             = MISC_REV;
      end
    15'b100001000100010:begin //ff0
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00111;
      decd_32_sel[ALU_SEL-1:0]             = MISC_FF1;
      end
    15'b100001100100010:begin //ff1
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00110;
      decd_32_sel[ALU_SEL-1:0]             = MISC_FF1;
      end
    15'b100010?00100010:begin //tst
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00101;
      decd_32_sel[ALU_SEL-1:0]             = MISC_TST;
      end
    15'b100100000100010:begin //revw
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b01001;
      decd_32_sel[ALU_SEL-1:0]             = MISC_REVW;
      end
    15'b010000000100010:begin //mveqz
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00010;
      decd_32_sel[ALU_SEL-1:0]             = MISC_MV;
      end
    15'b010000100100010:begin //mvnez
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00011;
      decd_32_sel[ALU_SEL-1:0]             = MISC_MV;
      end
    15'b???????01000010:begin //ext
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b01110;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_EXT;
      end
    15'b???????01100010:begin //extu
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b01010;
      decd_32_sel[ALU_SEL-1:0]             = SHIFTER_EXT;
      end
    15'b010111110010101:begin //vmv.vx
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b01000;
      decd_32_sel[ALU_SEL-1:0]             = MISC_MV;
      end
    15'b001101111010101:begin //vmv.s.x
      decd_32_eu_sel[EU_WIDTH-1:0]         = ALU;
      decd_32_func[4:0]                    = 5'b00100;
      decd_32_sel[ALU_SEL-1:0]             = MISC_MV;
      end
    15'b0??????11110101:begin //vsetvli
      decd_32_eu_sel[EU_WIDTH-1:0]         = SPECIAL;
      decd_32_func[4:0]                    = SPECIAL_VSETVLI;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    15'b100000011110101:begin //vsetvl
      decd_32_eu_sel[EU_WIDTH-1:0]         = SPECIAL;
      decd_32_func[4:0]                    = SPECIAL_VSETVL;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
      end
    default:begin                //invalid instruction
      decd_32_eu_sel[EU_WIDTH-1:0]         = SPECIAL;
      decd_32_func[4:0]                    = SPECIAL_NOP;
      decd_32_sel[ALU_SEL-1:0]             = NON_ALU;
    end
  endcase
// &CombEnd; @675
end

// &ModuleEnd; @677
endmodule


