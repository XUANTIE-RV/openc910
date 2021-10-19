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
module ct_idu_rf_pipe3_decd(
  pipe3_decd_atomic,
  pipe3_decd_inst_fls,
  pipe3_decd_inst_ldr,
  pipe3_decd_inst_size,
  pipe3_decd_inst_type,
  pipe3_decd_lsfifo,
  pipe3_decd_off_0_extend,
  pipe3_decd_offset,
  pipe3_decd_offset_plus,
  pipe3_decd_opcode,
  pipe3_decd_shift,
  pipe3_decd_sign_extend
);

// &Ports; @28
input   [31:0]  pipe3_decd_opcode;      
output          pipe3_decd_atomic;      
output          pipe3_decd_inst_fls;    
output          pipe3_decd_inst_ldr;    
output  [1 :0]  pipe3_decd_inst_size;   
output  [1 :0]  pipe3_decd_inst_type;   
output          pipe3_decd_lsfifo;      
output          pipe3_decd_off_0_extend; 
output  [11:0]  pipe3_decd_offset;      
output  [12:0]  pipe3_decd_offset_plus; 
output  [3 :0]  pipe3_decd_shift;       
output          pipe3_decd_sign_extend; 

// &Regs; @29
reg     [3 :0]  ldr_shift;              
reg             pipe3_decd_atomic;      
reg             pipe3_decd_inst_fls;    
reg             pipe3_decd_inst_ldr;    
reg     [1 :0]  pipe3_decd_inst_size;   
reg     [1 :0]  pipe3_decd_inst_type;   
reg             pipe3_decd_inst_vls;    
reg             pipe3_decd_lsfifo;      
reg             pipe3_decd_off_0_extend; 
reg     [11:0]  pipe3_decd_offset;      
reg     [3 :0]  pipe3_decd_shift;       
reg             pipe3_decd_sign_extend; 

// &Wires; @30
wire    [31:0]  decd_op;                
wire    [12:0]  pipe3_decd_offset_plus; 
wire    [31:0]  pipe3_decd_opcode;      


parameter BYTE        = 2'b00,
          HALF        = 2'b01,
          WORD        = 2'b10,
          DWORD       = 2'b11;

//==========================================================
//                    Rename Input
//==========================================================
assign decd_op[31:0] = pipe3_decd_opcode[31:0];

//==========================================================
//              Decode for offset shift
//==========================================================
// &CombBeg; @45
always @( decd_op[26:25])
begin
ldr_shift[3:0] = 4'b0;
case(decd_op[26:25])
  2'b00:ldr_shift[0] = 1'b1;
  2'b01:ldr_shift[1] = 1'b1;
  2'b10:ldr_shift[2] = 1'b1;
  2'b11:ldr_shift[3] = 1'b1;
  default:ldr_shift[3:0] = 4'b0;
endcase
// &CombEnd; @54
end

//==========================================================
//                       Decode
//==========================================================
// &CombBeg; @59
always @( decd_op[31:0]
       or ldr_shift[3:0])
begin
casez(decd_op[31:0])
//------------------------normal----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????000?????0000011:  //lb
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b00;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????001?????0000011:  //lh
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b01;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????010?????0000011:  //lw
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????100?????0000011:  //lbu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b00;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????101?????0000011:  //lhu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b01;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????110?????0000011:  //lwu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????011?????0000011:  //ld
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
//------------------------atomic----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b00010??00000?????010?????0101111:  //lr.w
  begin
    pipe3_decd_atomic         = 1'b1;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b01;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00001????????????010?????0101111,  //amoswap.w
  32'b00000????????????010?????0101111,  //amoadd .w
  32'b00100????????????010?????0101111,  //amoxor .w
  32'b01100????????????010?????0101111,  //amoand .w
  32'b01000????????????010?????0101111,  //amoor  .w
  32'b10000????????????010?????0101111,  //amomin .w
  32'b10100????????????010?????0101111,  //amomax .w
  32'b11000????????????010?????0101111,  //amominu.w
  32'b11100????????????010?????0101111:  //amomaxu.w
  begin
    pipe3_decd_atomic         = 1'b1;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00010??00000?????011?????0101111:  //lr.d
  begin
    pipe3_decd_atomic         = 1'b1;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b01;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00001????????????011?????0101111,  //amoswap.d
  32'b00000????????????011?????0101111,  //amoadd .d
  32'b00100????????????011?????0101111,  //amoxor .d
  32'b01100????????????011?????0101111,  //amoand .d
  32'b01000????????????011?????0101111,  //amoor  .d
  32'b10000????????????011?????0101111,  //amomin .d
  32'b10100????????????011?????0101111,  //amomax .d
  32'b11000????????????011?????0101111,  //amominu.d
  32'b11100????????????011?????0101111:  //amomaxu.d
  begin
    pipe3_decd_atomic         = 1'b1;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b0;
  end
//------------------------float-----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????001?????0000111:  //flh
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b01;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????010?????0000111:  //flw
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????011?????0000111:  //fld
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = decd_op[31:20];
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
//------------------------short-----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????001???????????00:  //c.fld
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = {4'b0,decd_op[6:5],decd_op[12:10],3'b0};
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????010???????????00:  //c.lw
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = {5'b0,decd_op[5],decd_op[12:10],decd_op[6],2'b0};
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????011???????????00:  //c.ld
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = {4'b0,decd_op[6:5],decd_op[12:10],3'b0};
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????001???????????10:  //c.fldsp
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = {3'b0,decd_op[4:2],decd_op[12],decd_op[6:5],3'b0};
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????010???????????10:  //c.lwsp
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = {4'b0,decd_op[3:2],decd_op[12],decd_op[6:4],2'b0};
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????011???????????10:  //c.ldsp
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = {3'b0,decd_op[4:2],decd_op[12],decd_op[6:5],3'b0};
    pipe3_decd_shift[3:0]     = 4'b1;
    pipe3_decd_inst_ldr       = 1'b0;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000????????????100?????0001011:  //lrb
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b00;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00100????????????100?????0001011:  //lrh
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b01;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01000????????????100?????0001011:  //lrw
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01100????????????100?????0001011:  //lrd
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b10000????????????100?????0001011:  //lrbu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b00;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b10100????????????100?????0001011:  //lrhu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b01;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b11000????????????100?????0001011:  //lrwu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00010????????????100?????0001011:  //lurb
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b00;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00110????????????100?????0001011:  //lurh
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b01;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01010????????????100?????0001011:  //lurw
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01110????????????100?????0001011:  //lurd
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b10010????????????100?????0001011:  //lurbu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b00;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b10110????????????100?????0001011:  //lurhu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b01;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b11010????????????100?????0001011:  //lurwu
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b0;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end
 //  ..28..24..20..16..12...8...4...0
  32'b01000????????????110?????0001011:  //flrw
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01100????????????110?????0001011:  //flrd
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b0;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01010????????????110?????0001011:  //flurw
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b1;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b10;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01110????????????110?????0001011:  //flurd
  begin
    pipe3_decd_atomic         = 1'b0;
    pipe3_decd_sign_extend    = 1'b0;
    pipe3_decd_inst_type[1:0] = 2'b00;
    pipe3_decd_inst_size[1:0] = 2'b11;
    pipe3_decd_inst_fls       = 1'b1;
    pipe3_decd_inst_vls       = 1'b0;
    pipe3_decd_offset[11:0]   = 12'b0;
    pipe3_decd_shift[3:0]     = ldr_shift[3:0];
    pipe3_decd_inst_ldr       = 1'b1;
    pipe3_decd_off_0_extend   = 1'b1;
    pipe3_decd_lsfifo         = 1'b1;
  end

  ////  ..28..24..20..16..12...8...4...0
  //32'b????????????????????????????????:  //template
  //begin
  //  pipe3_decd_atomic         = 1'b0;
  //  pipe3_decd_sign_extend    = 1'b0;
  //  pipe3_decd_inst_type[1:0] = 2'b00;
  //  pipe3_decd_inst_size[1:0] = 2'b00;
  //  pipe3_decd_inst_fls       = 1'b0;
  //  pipe3_decd_inst_vls       = 1'b0;
  //  pipe3_decd_offset[11:0]   = 12'b0;
  //  pipe3_decd_shift[3:0]     = 4'b1;
  //  pipe3_decd_inst_ldr       = 1'b0;
  //  pipe3_decd_off_0_extend   = 1'b0;
  //end
  default:
  begin
    pipe3_decd_atomic         = 1'bx;
    pipe3_decd_sign_extend    = 1'bx;
    pipe3_decd_inst_type[1:0] = {2{1'bx}};
    pipe3_decd_inst_size[1:0] = {2{1'bx}};
    pipe3_decd_inst_fls       = 1'bx;
    pipe3_decd_inst_vls       = 1'bx;
    pipe3_decd_offset[11:0]   = {12{1'bx}};
    pipe3_decd_shift[3:0]     = {4{1'bx}};
    pipe3_decd_inst_ldr       = 1'bx;
    pipe3_decd_off_0_extend   = 1'bx;
    pipe3_decd_lsfifo         = 1'bx;
  end
endcase
// &CombEnd; @1045
end

// &Force("output","pipe3_decd_offset"); @1047
assign pipe3_decd_offset_plus[12:0] = {pipe3_decd_offset[11],pipe3_decd_offset[11:0]}
                                      + 13'h10;

//for vector decode
// &Force("output","pipe3_decd_inst_vls"); @1053
// &Force("output","pipe3_decd_atomic"); @1054
// &Force("output","pipe3_decd_unit_stride"); @1055
// &Force("output","pipe3_decd_inst_fof"); @1056
// &Force("output","pipe3_decd_vmask_vld"); @1057
// &CombBeg; @1082
// &CombEnd; @1092
// &CombBeg; @1098
// &CombEnd; @1106
// &CombBeg; @1115
// &CombEnd; @1123
// &CombBeg; @1129
// &CombEnd; @1143
// &CombBeg; @1145
// &CombEnd; @1165
// &Force("nonport","pipe3_decd_inst_vls"); @1167


// &ModuleEnd; @1171
endmodule


