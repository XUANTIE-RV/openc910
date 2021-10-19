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

// &ModuleBeg; @26
module ct_idu_ir_decd(
  x_alu_short,
  x_bar,
  x_bar_type,
  x_csr,
  x_ecall,
  x_fp,
  x_illegal,
  x_load,
  x_mfvr,
  x_mtvr,
  x_opcode,
  x_pcall,
  x_pcfifo,
  x_rts,
  x_store,
  x_str,
  x_sync,
  x_type_alu,
  x_type_staddr,
  x_type_vload,
  x_unit_stride,
  x_vamo,
  x_vdiv,
  x_vec,
  x_viq_srcv12_switch,
  x_vmla_short,
  x_vmla_type,
  x_vmul,
  x_vmul_unsplit,
  x_vsetvl,
  x_vsetvli,
  x_vsew
);

// &Ports; @27
input           x_illegal;             
input   [31:0]  x_opcode;              
input           x_type_alu;            
input           x_type_staddr;         
input           x_type_vload;          
input   [2 :0]  x_vsew;                
output          x_alu_short;           
output          x_bar;                 
output  [3 :0]  x_bar_type;            
output          x_csr;                 
output          x_ecall;               
output          x_fp;                  
output          x_load;                
output          x_mfvr;                
output          x_mtvr;                
output          x_pcall;               
output          x_pcfifo;              
output          x_rts;                 
output          x_store;               
output          x_str;                 
output          x_sync;                
output          x_unit_stride;         
output          x_vamo;                
output          x_vdiv;                
output          x_vec;                 
output          x_viq_srcv12_switch;   
output          x_vmla_short;          
output  [2 :0]  x_vmla_type;           
output          x_vmul;                
output          x_vmul_unsplit;        
output          x_vsetvl;              
output          x_vsetvli;             

// &Regs; @28

// &Wires; @29
wire            decd_alu_short;        
wire            decd_bar;              
wire    [3 :0]  decd_bar_type;         
wire            decd_bar_type_sel;     
wire            decd_cmp_inst;         
wire            decd_csr;              
wire            decd_ecall;            
wire            decd_fmac_doub;        
wire            decd_fmac_half;        
wire            decd_fmac_sing;        
wire            decd_fp_inst;          
wire            decd_load;             
wire            decd_mfvr;             
wire            decd_mtvr;             
wire            decd_narr_vsft;        
wire            decd_opfvf;            
wire            decd_opfvv;            
wire            decd_opivi;            
wire            decd_opivv;            
wire            decd_opivx;            
wire            decd_opmvv;            
wire            decd_opmvx;            
wire            decd_pcall;            
wire            decd_pcfifo;           
wire            decd_permu;            
wire            decd_redu_vlgc;        
wire            decd_redu_vsum;        
wire            decd_return;           
wire            decd_rts;              
wire            decd_sca_fmac;         
wire            decd_sca_fmac_doub;    
wire            decd_sca_fmac_half;    
wire            decd_sca_fmac_sing;    
wire            decd_store;            
wire            decd_str;              
wire            decd_sub_call;         
wire            decd_sync;             
wire            decd_unit_stride;      
wire            decd_vamo;             
wire            decd_vdiv;             
wire            decd_vec_fmac;         
wire            decd_vec_fmac_doub;    
wire            decd_vec_fmac_half;    
wire            decd_vec_fmac_sing;    
wire            decd_vec_inst;         
wire            decd_vec_other;        
wire            decd_viq_srcv12_switch; 
wire            decd_vmac_norm;        
wire            decd_vmac_wide;        
wire            decd_vmla_short;       
wire    [2 :0]  decd_vmla_type;        
wire            decd_vmul;             
wire            decd_vmul_norm;        
wire            decd_vmul_unsplit;     
wire            decd_vmul_wide;        
wire            decd_vsetvl;           
wire            decd_vsetvli;          
wire            x_alu_short;           
wire            x_bar;                 
wire    [3 :0]  x_bar_type;            
wire            x_csr;                 
wire            x_ecall;               
wire            x_fp;                  
wire            x_illegal;             
wire            x_load;                
wire            x_mfvr;                
wire            x_mtvr;                
wire    [31:0]  x_opcode;              
wire            x_pcall;               
wire            x_pcfifo;              
wire            x_rts;                 
wire            x_store;               
wire            x_str;                 
wire            x_sync;                
wire            x_type_alu;            
wire            x_type_staddr;         
wire            x_type_vload;          
wire            x_unit_stride;         
wire            x_vamo;                
wire            x_vdiv;                
wire            x_vec;                 
wire            x_viq_srcv12_switch;   
wire            x_vmla_short;          
wire    [2 :0]  x_vmla_type;           
wire            x_vmul;                
wire            x_vmul_unsplit;        
wire            x_vsetvl;              
wire            x_vsetvli;             
wire    [2 :0]  x_vsew;                



//==========================================================
//                     Output Decode
//==========================================================
//CAUTION!!!
//illegal instruction keeps its opcode when pipedown from id stage
//ir decode should consider id stage illegal instruction
assign x_load              = !x_illegal && decd_load;
assign x_store             = !x_illegal && decd_store;
assign x_rts               = !x_illegal && decd_rts;
assign x_pcall             = !x_illegal && decd_pcall;
assign x_pcfifo            = !x_illegal && decd_pcfifo;
assign x_bar               = !x_illegal && decd_bar;
assign x_bar_type[3:0]     = {4{!x_illegal}} & decd_bar_type[3:0];
assign x_vdiv              = !x_illegal && decd_vdiv;
assign x_mfvr              = !x_illegal && decd_mfvr;
assign x_mtvr              = !x_illegal && decd_mtvr;
assign x_vmla_type[2:0]    = {3{!x_illegal}} & decd_vmla_type[2:0];
assign x_str               = !x_illegal && decd_str;
assign x_alu_short         = !x_illegal && decd_alu_short;
assign x_vmla_short        = !x_illegal && decd_vmla_short;
assign x_vmul_unsplit      = !x_illegal && decd_vmul_unsplit;
assign x_vmul              = !x_illegal && decd_vmul;
assign x_vsetvli           = !x_illegal && decd_vsetvli;
assign x_vsetvl            = !x_illegal && decd_vsetvl;
assign x_viq_srcv12_switch = !x_illegal && decd_viq_srcv12_switch;
assign x_unit_stride       = !x_illegal && decd_unit_stride;
assign x_vamo              = !x_illegal && decd_vamo;
assign x_vec               = !x_illegal && decd_vec_inst;
assign x_fp                = !x_illegal && decd_fp_inst;
assign x_csr               = !x_illegal && decd_csr;
assign x_sync              = !x_illegal && decd_sync;
assign x_ecall             = !x_illegal && decd_ecall;

//==========================================================
//                      Short ALU
//==========================================================
//Long ALU do not forward data in EX1
assign decd_alu_short =
  x_type_alu
  && !(({x_opcode[31:25],x_opcode[14:12],x_opcode[6:0]} == 17'b0100000_010_0110011) //pseudo_min
    || ({x_opcode[31:25],x_opcode[14:12],x_opcode[6:0]} == 17'b0110000_010_0110011) //pseudo_max
    || ({x_opcode[31:25],x_opcode[14:12],x_opcode[6:0]} == 17'b0100000_010_0111011) //pseudo_minw
    || ({x_opcode[31:25],x_opcode[14:12],x_opcode[6:0]} == 17'b0110000_010_0111011) //pseudo_maxw
    || ({x_opcode[31:25],x_opcode[14:12],x_opcode[6:0]} == 17'b0100000_011_0110011) //pseudo_minu
    || ({x_opcode[31:25],x_opcode[14:12],x_opcode[6:0]} == 17'b0110000_011_0110011) //pseudo_maxu
    || ({x_opcode[31:25],x_opcode[14:12],x_opcode[6:0]} == 17'b0100000_011_0111011) //pseudo_minuw
    || ({x_opcode[31:25],x_opcode[14:12],x_opcode[6:0]} == 17'b0110000_011_0111011) //pseudo_maxuw
    || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00000_001_0001011)); //addsl

//==========================================================
//                   Load and Store
//==========================================================
//----------------------------------------------------------
//                   Load Instruction
//----------------------------------------------------------
//control whether inst issue to pipe3 or pipe4
assign decd_load  =
     ({x_opcode[15:13],x_opcode[1:0]} == 5'b001_00) //c.fld
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b010_00) //c.lw
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b011_00) //c.ld
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b001_10) //c.fldsp
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b010_10) //c.lwsp
     && (x_opcode[11:7] != 5'b0)
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b011_10) //c.ldsp
     && (x_opcode[11:7] != 5'b0)
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_0000011) //lb
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b001_0000011) //lh
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b010_0000011) //lw
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b011_0000011) //ld
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b100_0000011) //lbu
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b101_0000011) //lhu
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b110_0000011) //lwu
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b001_0000111) //flh
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b010_0000111) //flw
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b011_0000111) //fld
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_0000111) //vld.b
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b101_0000111) //vld.h
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b110_0000111) //vld.w
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b111_0000111) //vld.sew
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00000_100_0001011) //lrb
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00100_100_0001011) //lrh
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01000_100_0001011) //lrw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01100_100_0001011) //lrd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b10000_100_0001011) //lrbu
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b10100_100_0001011) //lrhu
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b11000_100_0001011) //lrwu
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00010_100_0001011) //lurb
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00110_100_0001011) //lurh
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01010_100_0001011) //lurw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01110_100_0001011) //lurd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b10010_100_0001011) //lurbu
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b10110_100_0001011) //lurhu
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b11010_100_0001011) //lurwu
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00010_010_0101111) //lr.w
     && (x_opcode[24:20] == 5'b0)
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00010_011_0101111) //lr.d
     && (x_opcode[24:20] == 5'b0)
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01000_110_0001011) //flrw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01100_110_0001011) //flrd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01010_110_0001011) //flurw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01110_110_0001011) //flurd
  || (x_opcode[14] ? x_type_vload : !x_type_staddr)
     && (({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00000_10_0101111) //(v)amoadd.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00001_10_0101111) //(v)amoswap.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00100_10_0101111) //(v)amoxor.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01100_10_0101111) //(v)amoand.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01000_10_0101111) //(v)amoor.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10000_10_0101111) //(v)amomin.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10100_10_0101111) //(v)amomax.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11000_10_0101111) //(v)amominu.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11100_10_0101111) //(v)amomaxu.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00000_11_0101111) //(v)amoadd.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00001_11_0101111) //(v)amoswap.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00100_11_0101111) //(v)amoxor.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01100_11_0101111) //(v)amoand.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01000_11_0101111) //(v)amoor.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10000_11_0101111) //(v)amomin.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10100_11_0101111) //(v)amomax.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11000_11_0101111) //(v)amominu.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11100_11_0101111)); //(v)amomaxu.d

//----------------------------------------------------------
//                   Store Instruction
//----------------------------------------------------------
//control whether inst issue to pipe3 or pipe4
assign decd_store =
     ({x_opcode[15:13],x_opcode[1:0]} == 5'b101_00) //c.fsd
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b110_00) //c.sw
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b111_00) //c.sd
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b101_10) //c.fsdsp
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b110_10) //c.swsp
  || ({x_opcode[15:13],x_opcode[1:0]} == 5'b111_10) //c.sdsp
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_0100011) //sb
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b001_0100011) //sh
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b010_0100011) //sw
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b011_0100011) //sd
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b001_0100111) //fsh
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b010_0100111) //fsw
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b011_0100111) //fsd
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_0100111) //vst.b
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b101_0100111) //vst.h
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b110_0100111) //vst.w
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b111_0100111) //vst.sew
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00000_101_0001011) //srb
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00100_101_0001011) //srh
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01000_101_0001011) //srw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01100_101_0001011) //srd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00010_101_0001011) //surb
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00110_101_0001011) //surh
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01010_101_0001011) //surw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01110_101_0001011) //surd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01000_111_0001011) //fsrw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01100_111_0001011) //fsrd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01010_111_0001011) //fsurw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01110_111_0001011) //fsurd
//  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_0001111) //fence
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b001_0001111) //fence.i
  || ({x_opcode[31:25],x_opcode[14:0]} == 22'b0001001_000000001110011)  //sfence.vma
  || ({x_opcode[31:25],x_opcode[14:0]} == 22'b0010001_000000001110011)  //hfence.vvma
  || ({x_opcode[31:25],x_opcode[14:0]} == 22'b0110001_000000001110011)  //hfence.gvma
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00011_010_0101111) //sc.w
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00011_011_0101111) //sc.d
  || (x_opcode[14:0] == 15'b000_00000_0001011) //cache extension instruction
  || (x_opcode[14] ?  !x_type_vload : x_type_staddr)
     && (({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00000_10_0101111) //(v)amoadd.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00001_10_0101111) //(v)amoswap.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00100_10_0101111) //(v)amoxor.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01100_10_0101111) //(v)amoand.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01000_10_0101111) //(v)amoor.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10000_10_0101111) //(v)amomin.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10100_10_0101111) //(v)amomax.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11000_10_0101111) //(v)amominu.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11100_10_0101111) //(v)amomaxu.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00000_11_0101111) //(v)amoadd.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00001_11_0101111) //(v)amoswap.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00100_11_0101111) //(v)amoxor.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01100_11_0101111) //(v)amoand.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01000_11_0101111) //(v)amoor.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10000_11_0101111) //(v)amomin.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10100_11_0101111) //(v)amomax.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11000_11_0101111) //(v)amominu.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11100_11_0101111)); //(v)amomaxu.d

//----------------------------------------------------------
//               Reg Offset Store Instruction
//----------------------------------------------------------
assign decd_str =
     ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00000_101_0001011) //srb
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00100_101_0001011) //srh
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01000_101_0001011) //srw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01100_101_0001011) //srd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00010_101_0001011) //surb
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00110_101_0001011) //surh
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01010_101_0001011) //surw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01110_101_0001011) //surd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01000_111_0001011) //fsrw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01100_111_0001011) //fsrd
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01010_111_0001011) //fsurw
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b01110_111_0001011);//fsurd

//----------------------------------------------------------
//               Fence lr/sc amo Instruction
//----------------------------------------------------------
assign decd_sync =
     (x_opcode[31:0] == 32'h0180000b)  //sync
  || (x_opcode[31:0] == 32'h0190000b)  //sync.s
  || (x_opcode[31:0] == 32'h01a0000b)  //sync.i
  || (x_opcode[31:0] == 32'h01b0000b)  //sync.is
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_0001111) //fence
  || ({x_opcode[14:12],x_opcode[6:0]} == 10'b001_0001111) //fence.i
  || ({x_opcode[31:25],x_opcode[14:0]} == 22'b0001001_000000001110011)  //sfence.vma
  || ({x_opcode[31:25],x_opcode[14:0]} == 22'b0010001_000000001110011)  //hfence.vvma
  || ({x_opcode[31:25],x_opcode[14:0]} == 22'b0110001_000000001110011)  //hfence.gvma
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00010_010_0101111) //lr.w
     && (x_opcode[24:20] == 5'b0)
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00010_011_0101111) //lr.d
     && (x_opcode[24:20] == 5'b0)
  || (x_opcode[14] ? x_type_vload : !x_type_staddr)
     && (({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00000_10_0101111) //(v)amoadd.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00001_10_0101111) //(v)amoswap.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00100_10_0101111) //(v)amoxor.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01100_10_0101111) //(v)amoand.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01000_10_0101111) //(v)amoor.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10000_10_0101111) //(v)amomin.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10100_10_0101111) //(v)amomax.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11000_10_0101111) //(v)amominu.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11100_10_0101111) //(v)amomaxu.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00000_11_0101111) //(v)amoadd.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00001_11_0101111) //(v)amoswap.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00100_11_0101111) //(v)amoxor.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01100_11_0101111) //(v)amoand.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01000_11_0101111) //(v)amoor.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10000_11_0101111) //(v)amomin.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10100_11_0101111) //(v)amomax.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11000_11_0101111) //(v)amominu.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11100_11_0101111)) //(v)amomaxu.d
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00011_010_0101111) //sc.w
  || ({x_opcode[31:27],x_opcode[14:12],x_opcode[6:0]} == 15'b00011_011_0101111) //sc.d
  || (x_opcode[14] ?  !x_type_vload : x_type_staddr)
     && (({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00000_10_0101111) //(v)amoadd.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00001_10_0101111) //(v)amoswap.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00100_10_0101111) //(v)amoxor.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01100_10_0101111) //(v)amoand.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01000_10_0101111) //(v)amoor.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10000_10_0101111) //(v)amomin.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10100_10_0101111) //(v)amomax.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11000_10_0101111) //(v)amominu.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11100_10_0101111) //(v)amomaxu.w
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00000_11_0101111) //(v)amoadd.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00001_11_0101111) //(v)amoswap.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b00100_11_0101111) //(v)amoxor.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01100_11_0101111) //(v)amoand.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b01000_11_0101111) //(v)amoor.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10000_11_0101111) //(v)amomin.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b10100_11_0101111) //(v)amomax.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11000_11_0101111) //(v)amominu.d
      || ({x_opcode[31:27],x_opcode[13:12],x_opcode[6:0]} == 14'b11100_11_0101111)); //(v)amomaxu.d

//==========================================================
//                   BJU Information
//==========================================================
//----------------------------------------------------------
//            Return Stack Related Instruction
//----------------------------------------------------------
assign decd_return = 
     ({x_opcode[15:12], x_opcode[1:0]} == 6'b1000_10) //c.jr x1/x5
     && (x_opcode[6:2] == 5'b0)
     && ((x_opcode[11:7] == 5'd1) || (x_opcode[11:7] == 5'd5))
  || ({x_opcode[15:12], x_opcode[1:0]} == 6'b1001_10) //c.jalr x5
     && (x_opcode[11:7] == 5'd5) && (x_opcode[6:2] == 5'b0)
  || ({x_opcode[14:12], x_opcode[6:0]} == 10'b000_1100111) //jalr x1/x5
     && ((x_opcode[19:15] == 5'd1) || (x_opcode[19:15] == 5'd5))
     && (x_opcode[19:15] != x_opcode[11:7]);

assign decd_sub_call =
     ({x_opcode[15:12], x_opcode[1:0]} == 6'b1001_10) //c.jalr
     && (x_opcode[11:7] != 5'b0) && (x_opcode[6:2] == 5'b0)
  || (x_opcode[6:0] == 7'b1101111) //jal x1/x5
     && ((x_opcode[11:7] == 5'd1) || (x_opcode[11:7] == 5'd5))
  || ({x_opcode[14:12], x_opcode[6:0]} == 10'b000_1100111) //jalr x1/x5
     && ((x_opcode[11:7] == 5'd1) || (x_opcode[11:7] == 5'd5));

assign decd_rts    = decd_return;

assign decd_pcall  = decd_sub_call;

//----------------------------------------------------------
//                    PCFIFO Instruction
//----------------------------------------------------------
assign decd_pcfifo = ({x_opcode[15:13],x_opcode[1:0]} == 5'b101_01) //c.j
               || ({x_opcode[15:13],x_opcode[1:0]} == 5'b110_01) //c.beqz
               || ({x_opcode[15:13],x_opcode[1:0]} == 5'b111_01) //c.bnez
               || ({x_opcode[15:12],x_opcode[1:0]} == 6'b1000_10) //c.jr
                  && (x_opcode[11:7] != 5'b0)
                  && (x_opcode[6:2] == 5'b0)
               || ({x_opcode[15:12],x_opcode[1:0]} == 6'b1001_10) //c.jalr
                  && (x_opcode[11:7] != 5'b0)
                  && (x_opcode[6:2] == 5'b0)
               || (x_opcode[6:0] == 7'b1101111) //jal
               || ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_1100111) //jalr
               || ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_1100011) //beq
               || ({x_opcode[14:12],x_opcode[6:0]} == 10'b001_1100011) //bne
               || ({x_opcode[14:12],x_opcode[6:0]} == 10'b100_1100011) //blt
               || ({x_opcode[14:12],x_opcode[6:0]} == 10'b101_1100011) //bge
               || ({x_opcode[14:12],x_opcode[6:0]} == 10'b110_1100011) //bltu
               || ({x_opcode[14:12],x_opcode[6:0]} == 10'b111_1100011) //bgeu
               || (x_opcode[6:0] == 7'b0010111)  //auipc
               || (x_opcode[6:0] == 7'b0011111); //pseudo auipc


//==========================================================
//                   Barrier Instruction
//==========================================================
assign decd_bar = ({x_opcode[14:12],x_opcode[6:0]} == 10'b000_0001111); //fence
//treat all bar_type as 1111 except 1010 to preven
//lsiq issue dead lock
assign decd_bar_type_sel  =  (x_opcode[26] || x_opcode[24])
                         && !(x_opcode[27] || x_opcode[25])
                         &&  (x_opcode[22] || x_opcode[20])
                         && !(x_opcode[23] || x_opcode[21]);
assign decd_bar_type[3:0] = (decd_bar_type_sel)
                            ? 4'b1010 : 4'b1111;

//==========================================================
//                  Special Instruction
//==========================================================
assign decd_csr = (x_opcode[6:0] == 7'b1110011)
                  && (x_opcode[14:12] != 3'b000);
assign decd_ecall = (x_opcode[31:0] == 32'h00000073);

//==========================================================
//                    Vector Instruction
//==========================================================
//CAUTION!!!
//illegal instruction keeps its opcode when pipedown from id stage
//ir decode should consider id stage illegal instruction
assign decd_vec_inst = (x_opcode[6:0]==7'b1010111);
assign decd_fp_inst  = (x_opcode[6:0] == 7'b1010011)
                   || ({x_opcode[6:4],x_opcode[1:0]} == 5'b10011);
assign decd_opivv    = (x_opcode[14:12] == 3'b000);
assign decd_opivx    = (x_opcode[14:12] == 3'b100);
assign decd_opivi    = (x_opcode[14:12] == 3'b011);
assign decd_opmvv    = (x_opcode[14:12] == 3'b010);
assign decd_opmvx    = (x_opcode[14:12] == 3'b110);
assign decd_opfvv    = (x_opcode[14:12] == 3'b001);
assign decd_opfvf    = (x_opcode[14:12] == 3'b101);

assign decd_vdiv = ({x_opcode[31:27],x_opcode[6:0]}  == 12'b00011_1010011)  //fdiv.t
                || ({x_opcode[31:27],x_opcode[6:0]}  == 12'b01011_1010011)  //fsqrt.t
                ||  (x_opcode[31:28]== 4'b1000) &&   //vdiv vdivu vrem vremu
                    (decd_opmvv || decd_opmvx) && decd_vec_inst 
                ||  (x_opcode[31:26]== 6'b100000) &&   //vfdiv 
                    (decd_opfvv || decd_opfvf) && decd_vec_inst
                ||  (x_opcode[31:26]== 6'b100001) &&   //vfrdiv 
                    (              decd_opfvf) && decd_vec_inst
                ||  (x_opcode[31:26]== 6'b100011) &&   //vfsqrt 
                    (decd_opfvv                 ) && (x_opcode[19:15]==5'b00000) && decd_vec_inst;

assign decd_mfvr = ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111000000000_000_1010011) //fmv.x.w
                || ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111001000000_000_1010011) //fmv.x.h
                || ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111000000000_001_1010011) //fclass.s
                || ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111001000000_001_1010011) //fclass.h
                || ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111000100000_000_1010011) //fmv.x.d
                || ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111000100000_001_1010011) //fclass.w
                ||  (x_opcode[31:25] == 7'b001100_1) && (x_opcode[14:12]== 3'b010) && decd_vec_inst //vext
                ||  (x_opcode[31:25] == 7'b0010001) && (x_opcode[19:12]== 8'b00000_001) && decd_vec_inst //vfmv.f.s
                ||  (x_opcode[31:25] == 7'b1010001) && (x_opcode[14:12]==3'b010) && (x_opcode[6:0]==7'b1010011) //feq.d
                ||  (x_opcode[31:25] == 7'b1010001) && (x_opcode[14:12]==3'b001) && (x_opcode[6:0]==7'b1010011) //flt.d
                ||  (x_opcode[31:25] == 7'b1010001) && (x_opcode[14:12]==3'b000) && (x_opcode[6:0]==7'b1010011) //fle.d
                ||  (x_opcode[31:25] == 7'b1010000) && (x_opcode[14:12]==3'b010) && (x_opcode[6:0]==7'b1010011) //feq.s
                ||  (x_opcode[31:25] == 7'b1010000) && (x_opcode[14:12]==3'b001) && (x_opcode[6:0]==7'b1010011) //flt.s
                ||  (x_opcode[31:25] == 7'b1010000) && (x_opcode[14:12]==3'b000) && (x_opcode[6:0]==7'b1010011) //fle.s
                ||  (x_opcode[31:25] == 7'b1010010) && (x_opcode[14:12]==3'b010) && (x_opcode[6:0]==7'b1010011) //feq.h
                ||  (x_opcode[31:25] == 7'b1010010) && (x_opcode[14:12]==3'b001) && (x_opcode[6:0]==7'b1010011) //flt.h
                ||  (x_opcode[31:25] == 7'b1010010) && (x_opcode[14:12]==3'b000) && (x_opcode[6:0]==7'b1010011); //fle.h

assign decd_mtvr = ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111100000000_000_1010011) //fmv.w.x
                || ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111101000000_000_1010011) //fmv.h.x
                || ({x_opcode[31:20],x_opcode[14:12],x_opcode[6:0]} == 22'b111100100000_000_1010011)  //fmv.d.x
                ||  (x_opcode[31:20]== 12'b001101_1_00000) && decd_opmvx && decd_vec_inst //vmv.s.x
                ||  (x_opcode[31:20]== 12'b010111_1_00000) && decd_opivx && decd_vec_inst //vmv.v.x
                ||  (x_opcode[31:20]== 12'b001100_1_00000) && decd_opfvf && decd_vec_inst; //vfmv.s.f
//type info for vfpu internal forward
assign decd_vmla_type[2:0] = {3{decd_vmac_norm && !(x_opcode[31:28]== 4'b1010)}} & 3'b110  //vmla_type[2]==1 is used specially for integer vmac inst 
                            |{3{decd_vmac_wide}} & 3'b110 
                            |{3{decd_redu_vsum}} & 3'b101 
                            |{3{decd_vec_other}} & 3'b100
                            |{3{decd_fmac_half}} & 3'b011
                            |{3{decd_fmac_sing}} & 3'b010
                            |{3{decd_fmac_doub}} & 3'b001;

assign decd_redu_vsum =  (x_opcode[31:27]== 5'b10011)        //vwredusumu vwredusm
                       && decd_opivv && decd_vec_inst
                      ||((x_opcode[31:26]== 6'b000000)      // vredsum
                      || (x_opcode[31:28]== 4'b0001))      // vredminu vredmin vredmaxu vredmax
                       && decd_opmvv && decd_vec_inst;

assign decd_redu_vlgc = ((x_opcode[31:26]== 6'b000001)
                       ||(x_opcode[31:26]== 6'b000010)
                       ||(x_opcode[31:26]== 6'b000011))  //vredand vredor vredxor
                      && decd_opmvv && decd_vec_inst;

assign decd_narr_vsft =  (x_opcode[31:28]== 4'b1011)     //vnsrl vnsra vnclipu vnclip
                      && (decd_opivv || decd_opivx || decd_opivi) && decd_vec_inst;

assign decd_cmp_inst  =  (x_opcode[31:29]==3'b011)       //compare inst
                      && (decd_opivv || decd_opivx || decd_opivi) && decd_vec_inst;

assign decd_permu = (x_opcode[31:26]==6'b001100) //vrgather
                &&  (decd_opivv || decd_opivx || decd_opivi) && decd_vec_inst
                ||  (x_opcode[31:27]==5'b00111) //vslide
                &&  (decd_opivx || decd_opivi || decd_opmvx) && decd_vec_inst
                ||  (x_opcode[31:26]==6'b010111)//vcompress
                &&   decd_opmvv && decd_vec_inst;

assign decd_vec_other =  decd_redu_vlgc || decd_narr_vsft || decd_cmp_inst || decd_permu;

assign decd_vec_fmac  = ((x_opcode[31:28] == 4'b1011) ||(x_opcode[31:28] == 4'b1111))
                     && (decd_opfvv || decd_opfvf) ;
assign decd_sca_fmac  = ({x_opcode[6:4],x_opcode[1:0]} == 5'b100_11);

assign decd_vec_fmac_half = (x_vsew[2:0] == 3'b001) && !(&x_opcode[31:28]);
assign decd_vec_fmac_sing = (x_vsew[2:0] == 3'b010) && !(&x_opcode[31:28]);
assign decd_vec_fmac_doub = (x_vsew[2:0] == 3'b011) && !(&x_opcode[31:28])
                         || (x_vsew[2:0] == 3'b010) && (&x_opcode[31:28]);
assign decd_sca_fmac_half = (x_opcode[26:25] == 2'b10); 
assign decd_sca_fmac_sing = (x_opcode[26:25] == 2'b00); 
assign decd_sca_fmac_doub = (x_opcode[26:25] == 2'b01);

assign decd_fmac_half     = decd_sca_fmac_half && decd_sca_fmac
                         || decd_vec_fmac_half && decd_vec_fmac; 
assign decd_fmac_sing     = decd_sca_fmac_sing && decd_sca_fmac
                         || decd_vec_fmac_sing && decd_vec_fmac; 
assign decd_fmac_doub     = decd_sca_fmac_doub && decd_sca_fmac
                         || decd_vec_fmac_doub && decd_vec_fmac; 

//vfpu back to back issue
assign decd_vmla_short = decd_redu_vsum ||decd_redu_vlgc || decd_narr_vsft 
                      || decd_cmp_inst || decd_permu;
                     //||decd_vmac_norm || decd_vmac_wide;

//pipe7 vmul_unsplit will lch fail pipe6 vmul
assign decd_vmul_unsplit = decd_vmul_norm || decd_vmac_norm;

assign decd_vmul_norm = (x_opcode[31:26]== 6'b100111)        //vsmul
                    &&  (decd_opivv || decd_opivx) && decd_vec_inst
                     || (x_opcode[31:28]== 4'b1001)        //vmulhu vmul vmulhsu vmulh
                    &&  (decd_opmvv || decd_opmvx) && decd_vec_inst;

assign decd_vmac_norm =((x_opcode[31:26]== 6'b101001)      // vmadd
                      ||(x_opcode[31:26]== 6'b101011)      // vnmsub
                      ||(x_opcode[31:26]== 6'b101101)      // vmacc
                      ||(x_opcode[31:26]== 6'b101111))     // vnmsac
                    &&  (decd_opmvv || decd_opmvx) && decd_vec_inst;

assign decd_vmul_wide =((x_opcode[31:26]== 6'b111000)
                      ||(x_opcode[31:27]== 5'b11101)) // vwmulu vwmulsu vwmul
                    &&  (decd_opmvv || decd_opmvx) && decd_vec_inst;

assign decd_vmac_wide = (x_opcode[31:28]== 4'b1111)      //vwsmaccu vwsmacc vwsmaccsu vwsmaccus
                    &&  (decd_opivv || decd_opivx) && decd_vec_inst
                    ||  (x_opcode[31:28]== 4'b1111)      // vwmaccu vwmacc vwmaccsu vwmaccus
                    &&  (decd_opmvv || decd_opmvx) && decd_vec_inst;

assign decd_vmul = decd_vmul_norm || decd_vmul_wide || decd_vmac_norm || decd_vmac_wide;

assign decd_vsetvli = (x_opcode[31]== 1'b0) && (x_opcode[14:12]==3'b111) && (x_opcode[6:0]==7'b1010111);

assign decd_vsetvl  = (x_opcode[31:25]== 7'b100_0000) && (x_opcode[14:12]==3'b111) && (x_opcode[6:0]==7'b1010111);

assign decd_viq_srcv12_switch = ((x_opcode[31:26]== 6'b101001)||(x_opcode[31:26]== 6'b101011)) //vmadd vmnsub
                                &&  (decd_opmvv || decd_opmvx) && decd_vec_inst                //vfmadd
                             || ((x_opcode[31:28]== 4'b1010) && (decd_opfvv || decd_opfvf)) && decd_vec_inst 
                             || (x_opcode[31:26] == 6'b100010) && decd_opfvv && decd_vec_inst;

assign decd_unit_stride = (x_opcode[27:26]== 2'b0) && (x_opcode[31:29]== 3'b000);

assign decd_vamo = (x_opcode[6:0]== 7'b0101111) || |x_opcode[31:29];  //zvlsseg also use this signal for vmb

// &ModuleEnd; @511
endmodule


