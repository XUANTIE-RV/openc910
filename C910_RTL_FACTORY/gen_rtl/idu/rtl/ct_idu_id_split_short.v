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
module ct_idu_id_split_short(
  dp_split_short_bkpta_inst,
  dp_split_short_bkptb_inst,
  dp_split_short_inst,
  dp_split_short_no_spec,
  dp_split_short_pc,
  dp_split_short_type,
  dp_split_short_vl,
  dp_split_short_vl_pred,
  dp_split_short_vlmul,
  dp_split_short_vsew,
  split_short_dp_dep_info,
  split_short_dp_inst0_data,
  split_short_dp_inst1_data
);

// &Ports; @26
input            dp_split_short_bkpta_inst; 
input            dp_split_short_bkptb_inst; 
input   [31 :0]  dp_split_short_inst;      
input            dp_split_short_no_spec;   
input   [14 :0]  dp_split_short_pc;        
input   [6  :0]  dp_split_short_type;      
input   [7  :0]  dp_split_short_vl;        
input            dp_split_short_vl_pred;   
input   [1  :0]  dp_split_short_vlmul;     
input   [2  :0]  dp_split_short_vsew;      
output  [3  :0]  split_short_dp_dep_info;  
output  [177:0]  split_short_dp_inst0_data; 
output  [177:0]  split_short_dp_inst1_data; 

// &Regs; @27
reg     [177:0]  fp_inst0_data;            
reg     [177:0]  fp_inst1_data;            
reg     [177:0]  jal_inst0_data;           
reg     [177:0]  jal_inst1_data;           
reg     [2  :0]  lsd_func3;                
reg     [177:0]  lsd_inst0_load_data;      
reg     [177:0]  lsd_inst0_store_data;     
reg     [177:0]  lsd_inst1_load_data;      
reg     [177:0]  lsd_inst1_store_data;     
reg     [7  :0]  lsi_imm;                  
reg     [177:0]  lsi_inst0_data;           
reg     [177:0]  lsi_inst1_load_data;      
reg     [177:0]  lsi_inst1_store_data;     
reg     [177:0]  split_short_dp_inst0_data; 
reg     [177:0]  split_short_dp_inst1_data; 
reg     [177:0]  vec_mpop_inst0_data;      
reg     [177:0]  vec_mpop_inst1_data;      
reg     [177:0]  vec_norm_inst0_data;      
reg     [177:0]  vec_norm_inst1_data;      
reg     [9  :0]  vec_norm_pipe;            
reg     [177:0]  vec_vext_inst0_data;      
reg     [177:0]  vec_vext_inst1_data;      

// &Wires; @28
wire             dp_split_short_bkpta_inst; 
wire             dp_split_short_bkptb_inst; 
wire    [31 :0]  dp_split_short_inst;      
wire             dp_split_short_no_spec;   
wire    [14 :0]  dp_split_short_pc;        
wire    [6  :0]  dp_split_short_type;      
wire    [7  :0]  dp_split_short_vl;        
wire             dp_split_short_vl_pred;   
wire    [1  :0]  dp_split_short_vlmul;     
wire    [2  :0]  dp_split_short_vsew;      
wire             fp_cvt_type0;             
wire             fp_cvt_type0_l;           
wire             fp_cvt_type0_w;           
wire             fp_cvt_type1;             
wire             fp_cvt_type1_l;           
wire             fp_cvt_type1_w;           
wire    [3  :0]  fp_dep_info;              
wire    [31 :0]  fp_inst;                  
wire    [31 :0]  fp_inst0_op;              
wire    [31 :0]  fp_inst1_op;              
wire             jal_cjalr;                
wire    [3  :0]  jal_dep_info;             
wire    [31 :0]  jal_inst;                 
wire             jal_jal;                  
wire    [3  :0]  lsd_dep_info;             
wire    [31 :0]  lsd_inst;                 
wire    [177:0]  lsd_inst0_data;           
wire    [11 :0]  lsd_inst0_offset;         
wire    [177:0]  lsd_inst1_data;           
wire    [11 :0]  lsd_inst1_offset;         
wire             lsd_load;                 
wire             lsd_word;                 
wire    [3  :0]  lsi_dep_info;             
wire    [31 :0]  lsi_inst;                 
wire    [177:0]  lsi_inst1_data;           
wire             lsi_load;                 
wire    [11 :0]  lsi_offset;               
wire             lsi_post;                 
wire    [3  :0]  mpop_dep_info;            
wire    [3  :0]  norm_dep_info;            
wire    [3  :0]  split_short_dp_dep_info;  
wire    [177:0]  split_short_inst0_data;   
wire    [177:0]  split_short_inst1_data;   
wire    [3  :0]  vec_dep_info;             
wire    [31 :0]  vec_inst;                 
wire    [177:0]  vec_inst0_data;           
wire    [177:0]  vec_inst1_data;           
wire             vec_inst_adc;             
wire             vec_inst_cmp;             
wire             vec_inst_div;             
wire             vec_inst_ereg;            
wire             vec_inst_mac;             
wire             vec_inst_madd;            
wire             vec_inst_red;             
wire             vec_inst_sat;             
wire             vec_inst_sht;             
wire    [2  :0]  vec_inst_type;            
wire    [31 :0]  vec_mpop_inst0_op;        
wire    [31 :0]  vec_mpop_inst1_op;        
wire             vec_narr_sat;             
wire             vec_narr_sht;             
wire    [5  :0]  vec_norm_destv_offset;    
wire    [5  :0]  vec_norm_destv_offset_tmp; 
wire    [4  :0]  vec_norm_destv_vreg_0;    
wire    [4  :0]  vec_norm_destv_vreg_1;    
wire             vec_norm_div;             
wire             vec_norm_inst_vmla;       
wire             vec_norm_mac;             
wire             vec_norm_mul;             
wire             vec_norm_sat;             
wire             vec_norm_sht;             
wire    [5  :0]  vec_norm_srcv0_offset;    
wire             vec_norm_srcv0_vld;       
wire    [4  :0]  vec_norm_srcv0_vreg_0;    
wire    [4  :0]  vec_norm_srcv0_vreg_0_tmp; 
wire    [4  :0]  vec_norm_srcv0_vreg_1;    
wire    [4  :0]  vec_norm_srcv0_vreg_1_tmp; 
wire    [5  :0]  vec_norm_srcv1_offset;    
wire             vec_norm_srcv1_vld;       
wire    [4  :0]  vec_norm_srcv1_vreg_0;    
wire    [4  :0]  vec_norm_srcv1_vreg_0_tmp; 
wire    [4  :0]  vec_norm_srcv1_vreg_1;    
wire    [4  :0]  vec_norm_srcv1_vreg_1_tmp; 
wire             vec_norm_srcv2_vld;       
wire             vec_norm_srcvm_vld;       
wire             vec_opfvv;                
wire             vec_opivi;                
wire             vec_opivv;                
wire             vec_opmvv;                
wire             vec_src_switch;           
wire             vec_type_cmp;             
wire             vec_type_fcvt;            
wire             vec_type_fcvt_narr;       
wire             vec_type_fcvt_norm;       
wire             vec_type_fcvt_wide;       
wire             vec_type_fdiv;            
wire             vec_type_fmac;            
wire             vec_type_narr;            
wire             vec_type_narr_0;          
wire             vec_type_narr_1;          
wire             vec_type_narr_2;          
wire             vec_type_norm_0_2;        
wire             vec_type_norm_0_3;        
wire             vec_type_norm_0_4;        
wire             vec_type_norm_0_5;        
wire             vec_type_norm_0_7;        
wire             vec_type_norm_0_9;        
wire             vec_type_norm_0_a;        
wire             vec_type_norm_0_b;        
wire             vec_type_norm_1_0;        
wire             vec_type_norm_1_1;        
wire             vec_type_norm_1_2;        
wire             vec_type_norm_1_3;        
wire             vec_type_norm_2_1;        
wire             vec_type_norm_2_3;        
wire             vec_type_norm_2_4;        
wire             vec_type_norm_2_6;        
wire             vec_type_norm_2_7;        
wire             vec_type_norm_2_a;        
wire             vec_type_norm_2_b;        
wire             vec_type_norm_2_c;        
wire             vec_type_redu;            
wire             vec_type_wide;            
wire             vec_type_wide_0;          
wire             vec_type_wide_1;          
wire             vec_type_wide_2;          
wire             vec_type_wide_3;          
wire             vec_type_wide_4;          
wire             vec_type_wide_5;          
wire             vec_type_wide_6;          
wire             vec_type_wide_7;          
wire             vec_type_wide_8;          
wire             vec_type_wide_9;          
wire    [31 :0]  vec_vext_inst0_op;        
wire    [31 :0]  vec_vext_inst1_op;        
wire             vec_wide_mac;             
wire             vec_wide_mul;             
wire             vec_wide_sat;             
wire    [3  :0]  vext_dep_info;            
wire             x_vfunary0_vld_narr;      
wire             x_vfunary0_vld_norm;      
wire             x_vfunary0_vld_wide;      



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                 IR data path parameters
//----------------------------------------------------------
parameter IR_WIDTH            = 178;

parameter IR_VL_PRED          = 177;
parameter IR_VL               = 176;
parameter IR_VMB              = 168;
parameter IR_PC               = 167;
parameter IR_VSEW             = 152;
parameter IR_VLMUL            = 149;
parameter IR_FMLA             = 147;
parameter IR_SPLIT_NUM        = 146;
parameter IR_NO_SPEC          = 139;
parameter IR_MLA              = 138;
parameter IR_DST_X0           = 137;
parameter IR_ILLEGAL          = 136;
parameter IR_SPLIT_LAST       = 135;
parameter IR_VMLA             = 134;
parameter IR_IID_PLUS         = 133;
parameter IR_BKPTB_INST       = 129;
parameter IR_BKPTA_INST       = 128;
parameter IR_FMOV             = 127;
parameter IR_MOV              = 126;
parameter IR_EXPT             = 125;
parameter IR_LENGTH           = 118;
parameter IR_INTMASK          = 117;
parameter IR_SPLIT            = 116;
parameter IR_INST_TYPE        = 115;
parameter IR_DSTV_REG         = 105;
parameter IR_DSTV_VLD         = 99;
parameter IR_SRCVM_VLD        = 98;
parameter IR_SRCV2_VLD        = 97;
parameter IR_SRCV1_REG        = 96;
parameter IR_SRCV1_VLD        = 90;
parameter IR_SRCV0_REG        = 89;
parameter IR_SRCV0_VLD        = 83;
parameter IR_DSTE_VLD         = 82;
parameter IR_DSTF_REG         = 81;
parameter IR_DSTF_VLD         = 75;
parameter IR_SRCF2_REG        = 74;
parameter IR_SRCF2_VLD        = 68;
parameter IR_SRCF1_REG        = 67;
parameter IR_SRCF1_VLD        = 61;
parameter IR_SRCF0_REG        = 60;
parameter IR_SRCF0_VLD        = 54;
parameter IR_DST_REG          = 53;
parameter IR_DST_VLD          = 47;
parameter IR_SRC2_VLD         = 46;
parameter IR_SRC1_REG         = 45;
parameter IR_SRC1_VLD         = 39;
parameter IR_SRC0_REG         = 38;
parameter IR_SRC0_VLD         = 32;
parameter IR_OPCODE           = 31;

//----------------------------------------------------------
//                   Type parameters
//----------------------------------------------------------
parameter ALU      = 10'b0000000001;
parameter BJU      = 10'b0000000010;
parameter MULT     = 10'b0000000100;
parameter DIV      = 10'b0000001000;
parameter LSU_P5   = 10'b0000110000;
parameter LSU      = 10'b0000010000;
parameter PIPE67   = 10'b0001000000;
parameter PIPE6    = 10'b0010000000;
parameter PIPE7    = 10'b0100000000;
parameter SPECIAL  = 10'b1000000000;

//==========================================================
//                    jal instructions 
//==========================================================
//----------------------------------------------------------
//                     Contrl Signals
//----------------------------------------------------------
assign jal_inst[31:0]     = dp_split_short_inst[31:0];

assign jal_jal            = (jal_inst[6:0] == 7'b1101111);
assign jal_cjalr          = (jal_inst[1:0] == 2'b10);

assign jal_dep_info[1:0]  = 2'b11; //preg_dep_mask[1:0]
assign jal_dep_info[2]    = 1'b0;  //vreg_dep_mask
assign jal_dep_info[3]    = 1'b0;  //srcv1_dep_mask

//----------------------------------------------------------
//                  Split Instruction 0
//----------------------------------------------------------
//split inst 0: pseudo_auipc rd/r1, 4/2
// &CombBeg; @122
always @( jal_inst[11:7]
       or jal_cjalr)
begin
  jal_inst0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  jal_inst0_data[31:20]                       = (jal_cjalr) ? 12'd2 : 12'd4;
  jal_inst0_data[19:12]                       = 8'b0;
  jal_inst0_data[11:7]                        = (jal_cjalr) ? 5'd1 : jal_inst[11:7];
  jal_inst0_data[6:0]                         = 7'b0011111;

  jal_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9] = SPECIAL;
  jal_inst0_data[IR_DST_VLD]                  = 1'b1;
  jal_inst0_data[IR_DST_REG:IR_DST_REG-5]     = (jal_cjalr) ? 6'd1 : {1'b0,jal_inst[11:7]};
  jal_inst0_data[IR_SPLIT]                    = 1'b1;
  jal_inst0_data[IR_LENGTH]                   = !jal_cjalr;
  jal_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]   = 4'b1;
  end
// &CombEnd; @137
end

//----------------------------------------------------------
//                  Split Instruction 1
//----------------------------------------------------------
//split inst 1: jal r0, imm20 / jalr r0, rs1, imm12/0x0
// &CombBeg; @143
always @( jal_jal
       or jal_cjalr
       or jal_inst[31:0])
begin
  jal_inst1_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  jal_inst1_data[31:20]                       = (jal_cjalr) ? 12'b0 : jal_inst[31:20];
  jal_inst1_data[19:12]                       = jal_inst[19:12];
  jal_inst1_data[11:7]                        = jal_inst[11:7];
  jal_inst1_data[6:0]                         = jal_inst[6:0];

  jal_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9] = BJU;
  jal_inst1_data[IR_SRC0_VLD]                 = !jal_jal;
  jal_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5]   = (jal_cjalr) ? {1'b0,jal_inst[11:7]}
                                                            : {1'b0,jal_inst[19:15]};
  jal_inst1_data[IR_LENGTH]                   = !jal_cjalr;
  end
// &CombEnd; @157
end

//==========================================================
//                    lsi instructions 
//==========================================================
//----------------------------------------------------------
//                     Contrl Signals
//----------------------------------------------------------
assign lsi_inst[31:0]     = dp_split_short_inst[31:0];

assign lsi_load           = !lsi_inst[12];
assign lsi_post           = lsi_inst[28];

// &CombBeg; @170
always @( lsi_inst[26:20])
begin
  case(lsi_inst[26:25])
    2'b00:  lsi_imm[7:0]  = {{3{lsi_inst[24]}},lsi_inst[24:20]};
    2'b01:  lsi_imm[7:0]  = {{2{lsi_inst[24]}},lsi_inst[24:20],1'b0};
    2'b10:  lsi_imm[7:0]  = {lsi_inst[24],lsi_inst[24:20],2'b0};
    2'b11:  lsi_imm[7:0]  = {lsi_inst[24:20],3'b0};
    default:lsi_imm[7:0]  = {8{1'bx}};
  endcase
// &CombEnd; @178
end

assign lsi_offset[11:0]   = lsi_post ? 12'b0 : {{4{lsi_imm[7]}},lsi_imm[7:0]};

assign lsi_dep_info[1:0]  = 2'b11; //preg_dep_mask[1:0]
assign lsi_dep_info[2]    = 1'b0;  //vreg_dep_mask
assign lsi_dep_info[3]    = 1'b0;  //srcv1_dep_mask

//----------------------------------------------------------
//                  Split Instruction 0
//----------------------------------------------------------
//split inst 1: addi rs1,rs1,sign_ext(imm5<<imm2)
// &CombBeg; @190
always @( lsi_imm[7:0]
       or lsi_inst[19:15])
begin
  lsi_inst0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  lsi_inst0_data[31:20]                       = {{4{lsi_imm[7]}},lsi_imm[7:0]};
  lsi_inst0_data[19:15]                       = lsi_inst[19:15];
  lsi_inst0_data[14:12]                       = 3'b0;
  lsi_inst0_data[11:7]                        = lsi_inst[19:15];
  lsi_inst0_data[6:0]                         = 7'b0010011;

  lsi_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9] = ALU;
  lsi_inst0_data[IR_SRC0_VLD]                 = 1'b1;
  lsi_inst0_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,lsi_inst[19:15]};
  lsi_inst0_data[IR_DST_VLD]                  = 1'b1;
  lsi_inst0_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,lsi_inst[19:15]};
  lsi_inst0_data[IR_SPLIT]                    = 1'b1;
  lsi_inst0_data[IR_LENGTH]                   = 1'b1;
  lsi_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]   = 4'b1;
  end
// &CombEnd; @208
end

//----------------------------------------------------------
//               Split Instruction 1 : load
//----------------------------------------------------------
//split inst 0: lb/lh/lw/ld/lbu/lhu/lwu rd,(rs1),sign_ext(imm5<<imm2)
// &CombBeg; @214
always @( lsi_inst[11:7]
       or lsi_offset[11:0]
       or lsi_inst[19:15]
       or lsi_inst[31:29])
begin
  lsi_inst1_load_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  lsi_inst1_load_data[31:20]                       = lsi_offset[11:0];
  lsi_inst1_load_data[19:15]                       = lsi_inst[19:15];
  lsi_inst1_load_data[14:12]                       = lsi_inst[31:29];
  lsi_inst1_load_data[11:7]                        = lsi_inst[11:7];
  lsi_inst1_load_data[6:0]                         = 7'b0000011;

  lsi_inst1_load_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  lsi_inst1_load_data[IR_SRC0_VLD]                 = 1'b1;
  lsi_inst1_load_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,lsi_inst[19:15]};
  lsi_inst1_load_data[IR_DST_VLD]                  = 1'b1;
  lsi_inst1_load_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,lsi_inst[11:7]};
  lsi_inst1_load_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @230
end

//----------------------------------------------------------
//               Split Instruction 1 : store
//----------------------------------------------------------
//split inst 0: sb/sh/sw/sd/sbu/shu/swu rs2,(rs1),sign_ext(imm5<<imm2)
// &CombBeg; @236
always @( lsi_inst[11:7]
       or lsi_offset[11:0]
       or lsi_inst[19:15]
       or lsi_inst[31:29])
begin
  lsi_inst1_store_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  lsi_inst1_store_data[31:25]                       = lsi_offset[11:5];
  lsi_inst1_store_data[24:20]                       = lsi_inst[11:7];
  lsi_inst1_store_data[19:15]                       = lsi_inst[19:15];
  lsi_inst1_store_data[14:12]                       = lsi_inst[31:29];
  lsi_inst1_store_data[11:7]                        = lsi_offset[4:0];
  lsi_inst1_store_data[6:0]                         = 7'b0100011;

  lsi_inst1_store_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU_P5;
  lsi_inst1_store_data[IR_SRC0_VLD]                 = 1'b1;
  lsi_inst1_store_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,lsi_inst[19:15]};
  lsi_inst1_store_data[IR_SRC1_VLD]                 = 1'b1;
  lsi_inst1_store_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,lsi_inst[11:7]};
  lsi_inst1_store_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @253
end

//----------------------------------------------------------
//                 Split Instruction Data
//----------------------------------------------------------
assign lsi_inst1_data[IR_WIDTH-1:0] = lsi_load
                                      ? lsi_inst1_load_data[IR_WIDTH-1:0]
                                      : lsi_inst1_store_data[IR_WIDTH-1:0];

//==========================================================
//                    lsd instructions 
//==========================================================
//----------------------------------------------------------
//                     Contrl Signals
//----------------------------------------------------------
assign lsd_inst[31:0]     = dp_split_short_inst[31:0];

assign lsd_load           = !lsd_inst[12];
assign lsd_word           = !lsd_inst[27];

// &CombBeg; @273
always @( lsd_inst[28:27])
begin
  case(lsd_inst[28:27])
    2'b00:  lsd_func3[2:0] = 3'b010;
    2'b10:  lsd_func3[2:0] = 3'b110;
    2'b11:  lsd_func3[2:0] = 3'b011;
    default:lsd_func3[2:0] = {3{1'bx}};
  endcase
// &CombEnd; @280
end

assign lsd_inst0_offset[11:0] = lsd_word ? {7'b0,lsd_inst[26:25],3'b0}
                                         : {6'b0,lsd_inst[26:25],4'b0};
assign lsd_inst1_offset[11:0] = lsd_word ? lsd_inst0_offset[11:0] + {8'b0,4'd4}
                                         : lsd_inst0_offset[11:0] + {8'b0,4'd8};

assign lsd_dep_info[1:0]  = 2'b11; //preg_dep_mask[1:0]
assign lsd_dep_info[2]    = 1'b0;  //vreg_dep_mask
assign lsd_dep_info[3]    = 1'b0;  //srcv1_dep_mask

//----------------------------------------------------------
//               Split Instruction 0 : load
//----------------------------------------------------------
//split inst 0: lw/ld/lwu rd,(rs1),sign_ext(imm5<<imm2)
// &CombBeg; @295
always @( lsd_inst[11:7]
       or lsd_func3[2:0]
       or lsd_inst[19:15]
       or lsd_inst0_offset[11:0])
begin
  lsd_inst0_load_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  lsd_inst0_load_data[31:20]                       = lsd_inst0_offset[11:0];
  lsd_inst0_load_data[19:15]                       = lsd_inst[19:15];
  lsd_inst0_load_data[14:12]                       = lsd_func3[2:0];
  lsd_inst0_load_data[11:7]                        = lsd_inst[11:7];
  lsd_inst0_load_data[6:0]                         = 7'b0000011;

  lsd_inst0_load_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  lsd_inst0_load_data[IR_SRC0_VLD]                 = 1'b1;
  lsd_inst0_load_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,lsd_inst[19:15]};
  lsd_inst0_load_data[IR_DST_VLD]                  = 1'b1;
  lsd_inst0_load_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,lsd_inst[11:7]};
  lsd_inst0_load_data[IR_SPLIT]                    = 1'b1;
  lsd_inst0_load_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @312
end

//----------------------------------------------------------
//               Split Instruction 0 : store
//----------------------------------------------------------
//split inst 0: sw/sd/swu rs2,(rs1),sign_ext(imm5<<imm2)
// &CombBeg; @318
always @( lsd_inst[11:7]
       or lsd_func3[2:0]
       or lsd_inst[19:15]
       or lsd_inst0_offset[11:0])
begin
  lsd_inst0_store_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  lsd_inst0_store_data[31:25]                       = lsd_inst0_offset[11:5];
  lsd_inst0_store_data[24:20]                       = lsd_inst[11:7];
  lsd_inst0_store_data[19:15]                       = lsd_inst[19:15];
  lsd_inst0_store_data[14:12]                       = lsd_func3[2:0];
  lsd_inst0_store_data[11:7]                        = lsd_inst0_offset[4:0];
  lsd_inst0_store_data[6:0]                         = 7'b0100011;

  lsd_inst0_store_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU_P5;
  lsd_inst0_store_data[IR_SRC0_VLD]                 = 1'b1;
  lsd_inst0_store_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,lsd_inst[19:15]};
  lsd_inst0_store_data[IR_SRC1_VLD]                 = 1'b1;
  lsd_inst0_store_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,lsd_inst[11:7]};
  lsd_inst0_store_data[IR_SPLIT]                    = 1'b1;
  lsd_inst0_store_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @336
end

//----------------------------------------------------------
//               Split Instruction 1 : load
//----------------------------------------------------------
//split inst 1: lw/ld/lwu rd+1,(rs1),sign_ext(imm5<<imm2+4/8)
// &CombBeg; @342
always @( lsd_inst[24:15]
       or lsd_func3[2:0]
       or lsd_inst1_offset[11:0])
begin
  lsd_inst1_load_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  lsd_inst1_load_data[31:20]                       = lsd_inst1_offset[11:0];
  lsd_inst1_load_data[19:15]                       = lsd_inst[19:15];
  lsd_inst1_load_data[14:12]                       = lsd_func3[2:0];
  lsd_inst1_load_data[11:7]                        = lsd_inst[24:20];
  lsd_inst1_load_data[6:0]                         = 7'b0000011;

  lsd_inst1_load_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  lsd_inst1_load_data[IR_SRC0_VLD]                 = 1'b1;
  lsd_inst1_load_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,lsd_inst[19:15]};
  lsd_inst1_load_data[IR_DST_VLD]                  = 1'b1;
  lsd_inst1_load_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,lsd_inst[24:20]};
  lsd_inst1_load_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @358
end

//----------------------------------------------------------
//               Split Instruction 1 : store
//----------------------------------------------------------
//split inst 1: sw/sd/swu rs2+1,(rs1),sign_ext(imm5<<imm2+4/8)
// &CombBeg; @364
always @( lsd_inst1_offset[11:0]
       or lsd_func3[2:0]
       or lsd_inst[24:15])
begin
  lsd_inst1_store_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  lsd_inst1_store_data[31:25]                       = lsd_inst1_offset[11:5];
  lsd_inst1_store_data[24:20]                       = lsd_inst[24:20];
  lsd_inst1_store_data[19:15]                       = lsd_inst[19:15];
  lsd_inst1_store_data[14:12]                       = lsd_func3[2:0];
  lsd_inst1_store_data[11:7]                        = lsd_inst1_offset[4:0];
  lsd_inst1_store_data[6:0]                         = 7'b0100011;

  lsd_inst1_store_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU_P5;
  lsd_inst1_store_data[IR_SRC0_VLD]                 = 1'b1;
  lsd_inst1_store_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,lsd_inst[19:15]};
  lsd_inst1_store_data[IR_SRC1_VLD]                 = 1'b1;
  lsd_inst1_store_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,lsd_inst[24:20]};
  lsd_inst1_store_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @381
end

//----------------------------------------------------------
//                 Split Instruction Data
//----------------------------------------------------------
assign lsd_inst0_data[IR_WIDTH-1:0] = lsd_load
                                      ? lsd_inst0_load_data[IR_WIDTH-1:0]
                                      : lsd_inst0_store_data[IR_WIDTH-1:0];
assign lsd_inst1_data[IR_WIDTH-1:0] = lsd_load
                                      ? lsd_inst1_load_data[IR_WIDTH-1:0]
                                      : lsd_inst1_store_data[IR_WIDTH-1:0];

//==========================================================
//                  fp instruction
//==========================================================
//----------------------------------------------------------
//                     Contrl Signals
//----------------------------------------------------------
assign fp_inst[31:0]     = dp_split_short_inst[31:0];

//assign fp_compare        = fp_inst[31:27] == 5'b10100;
assign fp_cvt_type0      = fp_inst[31:27] == 5'b11000; //convert FP to integer
assign fp_cvt_type1      = fp_inst[31:27] == 5'b11010; //convert integer to FP
assign fp_cvt_type0_w    = {fp_inst[31:27],fp_inst[21]} == 6'b110000;
assign fp_cvt_type0_l    = {fp_inst[31:27],fp_inst[21]} == 6'b110001;
assign fp_cvt_type1_w    = {fp_inst[31:27],fp_inst[21]} == 6'b110100;
assign fp_cvt_type1_l    = {fp_inst[31:27],fp_inst[21]} == 6'b110101;

assign fp_dep_info[1:0]  = 2'b0;  //preg_dep_mask[1:0]
assign fp_dep_info[2]    = 1'b0;  //vreg_dep_mask
assign fp_dep_info[3]    = 1'b0;  //srcv1_dep_mask

//----------------------------------------------------------
//               Split Instruction 0 : fp inst
//----------------------------------------------------------
//split inst 0: compare   : pseudo feq.t/flt.t.fle.t
//              cvt_type0 : pseudo fcvt.w.t/fcvt.wu.t/fcvt.l.t/fcvt.lu.dt
//              cvt_type1 : pseudo fmv.w.x/fmv.d.x
assign fp_inst0_op[31:12]      =
//   {20{fp_compare}}     & fp_inst[31:12]
   {20{fp_cvt_type0}}   & fp_inst[31:12]
 | {20{fp_cvt_type1_w}} & {12'b111100000000,fp_inst[19:15],3'b000}
 | {20{fp_cvt_type1_l}} & {12'b111100100000,fp_inst[19:15],3'b000};

assign fp_inst0_op[11:0]       = 12'b11010011;

// &CombBeg; @427
always @( fp_inst0_op[31:0]
       or fp_cvt_type1
       or fp_inst[19:15])
begin
  fp_inst0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  fp_inst0_data[IR_OPCODE:IR_OPCODE-31]      = fp_inst0_op[31:0];

  fp_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9] = (fp_cvt_type1) ? ALU 
                                               :  PIPE7;
  fp_inst0_data[IR_SRC0_VLD]                 = fp_cvt_type1;
  fp_inst0_data[IR_SRC0_REG:IR_SRC0_REG-5]   = (fp_cvt_type1) ? {1'b0,fp_inst[19:15]} : 6'b0;
  fp_inst0_data[IR_SRCF0_VLD]                = !fp_cvt_type1;
  fp_inst0_data[IR_SRCF0_REG:IR_SRCF0_REG-5] = (!fp_cvt_type1) ? {1'b0,fp_inst[19:15]} : 6'b0;
  fp_inst0_data[IR_SRCF1_VLD]                = 1'b0;
  fp_inst0_data[IR_SRCF1_REG:IR_SRCF1_REG-5] = 6'b0;
  fp_inst0_data[IR_DSTF_VLD]                 = 1'b1;
  fp_inst0_data[IR_DSTF_REG:IR_DSTF_REG-5]   = 6'd32;
  fp_inst0_data[IR_DSTE_VLD]                 = !fp_cvt_type1;
  fp_inst0_data[IR_SPLIT]                    = 1'b1;
  fp_inst0_data[IR_LENGTH]                   = 1'b1;
  fp_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]   = 4'd1;
  end
// &CombEnd; @447
end

//----------------------------------------------------------
//              Split Instruction 1 : fp_inst
//----------------------------------------------------------
//split inst 1: compare   : fmv.x.w
//              cvt_type0 : fmv.x.w/fmv.x.d
//              cvt_type1 : fcvt.t.w/fcvt.t.wu/fcvt.t.l/fcvt.t.lu
assign fp_inst1_op[31:20]      =
   //{12{fp_compare}}     & {12'b111000000000}  //fmv.x.w
  {12{fp_cvt_type1}}   & fp_inst[31:20]      //fcvt
 | {12{fp_cvt_type0_w}} & {12'b111000000000}  //fmv.x.w
 | {12{fp_cvt_type0_l}} & {12'b111000100000}; //fmv.x.d

assign fp_inst1_op[19:15]      = 5'b1;
assign fp_inst1_op[14:0]       = 
  // {15{fp_compare}}     & {3'b0,fp_inst[11:7],7'b1010011}  //fmv.x.w
  {15{fp_cvt_type1}}   & fp_inst[14:0]      //fcvt
 | {15{fp_cvt_type0_w}} & {3'b0,fp_inst[11:7],7'b1010011}  //fmv.x.w
 | {15{fp_cvt_type0_l}} & {3'b0,fp_inst[11:7],7'b1010011}; //fmv.x.d

// &CombBeg; @468
always @( fp_inst[11:7]
       or fp_inst1_op[31:0]
       or fp_cvt_type1)
begin
  fp_inst1_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  fp_inst1_data[IR_OPCODE:IR_OPCODE-31]      = fp_inst1_op[31:0];

  fp_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9] = (fp_cvt_type1) ? PIPE7: PIPE67;
  fp_inst1_data[IR_DST_VLD]                  = !fp_cvt_type1;
  fp_inst1_data[IR_DST_REG:IR_DST_REG-5]     = (!fp_cvt_type1) ? {1'b0,fp_inst[11:7]} : 6'b0;
  fp_inst1_data[IR_SRCF0_VLD]                = 1'b1;
  fp_inst1_data[IR_SRCF0_REG:IR_SRCF0_REG-5] = 6'd32;
  fp_inst1_data[IR_DSTF_VLD]                 = fp_cvt_type1;
  fp_inst1_data[IR_DSTF_REG:IR_DSTF_REG-5]   = (fp_cvt_type1) ? {1'b0,fp_inst[11:7]} : 6'b0;
  fp_inst1_data[IR_DSTE_VLD]                 = fp_cvt_type1;
  fp_inst1_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @483
end

//==========================================================
//                  vector instruction
//==========================================================
//----------------------------------------------------------
//           normal vector split variables initial value
//----------------------------------------------------------
assign vec_inst[31:0]     =  dp_split_short_inst[31:0];

assign vec_opivv          =  vec_inst[14:12] == 3'b000;
assign vec_opivi          =  vec_inst[14:12] == 3'b011;
assign vec_opmvv          =  vec_inst[14:12] == 3'b010;
assign vec_opfvv          =  vec_inst[14:12] == 3'b001;
//----------------------------------------------------------
//                  narrowing inst
//----------------------------------------------------------
assign vec_type_narr_0    = (vec_inst[31:27] == 5'b10110) && (vec_opivv || vec_opivi);//narrow shift
assign vec_type_narr_1    = (vec_inst[31:27] == 5'b10111) && (vec_opivv || vec_opivi);//sat narrow shift
assign vec_type_narr_2    = (vec_inst[31:26] == 6'b100010) && (x_vfunary0_vld_narr) && (vec_opfvv);//narrow fcvt

assign vec_type_narr      = (vec_type_narr_0 || vec_type_narr_1 || vec_type_narr_2); 
assign vec_narr_sat       =  vec_type_narr_1;
assign vec_narr_sht       =  vec_type_narr_0 || vec_type_narr_1;

assign x_vfunary0_vld_narr = (vec_inst[19:15] == 5'b10000) //vfncvt.xu.f.v
                           ||(vec_inst[19:15] == 5'b10001) //vfncvt.x.f.v
                           ||(vec_inst[19:15] == 5'b10010) //vfncvt.f.xu.v
                           ||(vec_inst[19:15] == 5'b10011) //vfncvt.f.x.v
                           ||(vec_inst[19:15] == 5'b10100);//vfncvt.f.f.v

assign vec_type_fcvt_narr = vec_type_narr_2;
//----------------------------------------------------------
//                  widening inst
//----------------------------------------------------------
assign vec_type_wide_0    = (vec_inst[31:28] == 4'b1111)  && (vec_opivv);   //sat widening fix-point mac inst
assign vec_type_wide_1    = (vec_inst[31:28] == 4'b1100)  && (vec_opmvv);   //widening integer alu inst
assign vec_type_wide_2    = (vec_inst[31:28] == 4'b1101)  && (vec_opmvv);   //src widening integer alu inst
assign vec_type_wide_3    = (vec_inst[31:28] == 4'b1110)  && (vec_opmvv);   //widening integer mult inst
assign vec_type_wide_4    = (vec_inst[31:28] == 4'b1111)  && (vec_opmvv);   //widening integer mac inst
assign vec_type_wide_5    = (vec_inst[31:28] == 4'b1100)  && !vec_inst[26] && (vec_opfvv); //wide add/sub
assign vec_type_wide_6    = (vec_inst[31:28] == 4'b1101)  && (vec_opfvv); //src wide add/sub
assign vec_type_wide_7    = (vec_inst[31:26] == 6'b111000)&& (vec_opfvv); //vfwmul
assign vec_type_wide_8    = (vec_inst[31:28] == 4'b1111)  && (vec_opfvv);  //wide mac
assign vec_type_wide_9    = (vec_inst[31:26] == 6'b100010)&& (x_vfunary0_vld_wide) && (vec_opfvv);//widening fcvt

assign vec_type_wide      = (vec_type_wide_0 || vec_type_wide_1 || 
                             vec_type_wide_2 || vec_type_wide_3 ||
                             vec_type_wide_4 || vec_type_wide_5 ||
                             vec_type_wide_6 || vec_type_wide_7 || 
                             vec_type_wide_8 || vec_type_wide_9);

assign vec_wide_sat       =  vec_type_wide_0;
assign vec_wide_mac       =  vec_type_wide_0 || vec_type_wide_4;
assign vec_wide_mul       =  vec_type_wide_0 || vec_type_wide_3 || vec_type_wide_4;

assign x_vfunary0_vld_wide = (vec_inst[19:15] == 5'b01000) //vfwcvt.xu.f.v
                           ||(vec_inst[19:15] == 5'b01001) //vfwcvt.x.f.v
                           ||(vec_inst[19:15] == 5'b01010) //vfwcvt.f.xu.v
                           ||(vec_inst[19:15] == 5'b01011) //vfwcvt.f.x.v
                           ||(vec_inst[19:15] == 5'b01100);//vfwcvt.f.f.v

assign vec_type_fcvt_wide = vec_type_wide_9;

//----------------------------------------------------------
//                  normal inst
//----------------------------------------------------------
//assign vec_type_norm_0_0  = (vec_opivv || vec_opivi) && (vec_inst[31:29]== 3'b000) ; //add/sub max/min
//assign vec_type_norm_0_1  = (vec_opivv || vec_opivi) && (vec_inst[31:28]== 4'b0010); //and or xor
assign vec_type_norm_0_2  = (vec_opivv || vec_opivi) && (vec_inst[31:28]== 4'b0100); //adc
assign vec_type_norm_0_3  = (vec_opivv || vec_opivi) && (vec_inst[31:26]== 6'b010111); //merge mv
assign vec_type_norm_0_4  = (vec_opivv || vec_opivi) && (vec_inst[31:29]== 3'b011); //compare
assign vec_type_norm_0_5  = (vec_opivv || vec_opivi) && (vec_inst[31:28]== 4'b1000); //sat add
//assign vec_type_norm_0_6  = (vec_opivv || vec_opivi) && (vec_inst[31:26]== 6'b100100); //aadd
assign vec_type_norm_0_7  = (vec_opivv || vec_opivi) && (vec_inst[31:26]== 6'b100101); //sll
//assign vec_type_norm_0_8  = (vec_opivv || vec_opivi) && (vec_inst[31:26]== 6'b100110); //asub
assign vec_type_norm_0_9  = (vec_opivv || vec_opivi) && (vec_inst[31:26]== 6'b100111); //smul
assign vec_type_norm_0_a  = (vec_opivv || vec_opivi) && (vec_inst[31:27]== 5'b10100); //shift
assign vec_type_norm_0_b  = (vec_opivv || vec_opivi) && (vec_inst[31:27]== 5'b10101); //sat shift
//assign vec_type_norm_0    = (vec_type_norm_0_0 || vec_type_norm_0_1 || 
//                             vec_type_norm_0_2 || vec_type_norm_0_3 ||
//                             vec_type_norm_0_4 || vec_type_norm_0_5 ||
//                             vec_type_norm_0_6 || vec_type_norm_0_7 ||
//                             vec_type_norm_0_8 || vec_type_norm_0_9 ||
//                             vec_type_norm_0_a || vec_type_norm_0_b);

assign vec_type_norm_1_0  = (vec_opmvv) && (vec_inst[31:28]== 4'b1000);//div
assign vec_type_norm_1_1  = (vec_opmvv) && (vec_inst[31:28]== 4'b1001);//mult
assign vec_type_norm_1_2  = (vec_opmvv) && (vec_inst[31:29]== 3'b101);//mac
assign vec_type_norm_1_3  = (vec_opmvv) && (vec_inst[31:26]== 6'b010110) 
                                        && (vec_inst[19:16]== 4'b1000); //viota vid

//assign vec_type_norm_1    = (vec_type_norm_1_0 || vec_type_norm_1_1 ||
//                             vec_type_norm_1_2 || vec_type_norm_1_3 );
//
//assign vec_type_norm      = (vec_type_norm_0 || vec_type_norm_1 ); 

assign x_vfunary0_vld_norm = (vec_inst[19:15] == 5'b00000) //vfcvt.xu.f.v
                           ||(vec_inst[19:15] == 5'b00001) //vfcvt.x.f.v
                           ||(vec_inst[19:15] == 5'b00010) //vfcvt.f.xu.v
                           ||(vec_inst[19:15] == 5'b00011);//vfcvt.f.x.v
//assign vec_type_norm_2_0  = (vec_opfvv) && (vec_inst[31:29]== 3'b000) && !vec_inst[26];//add/sub max/min
assign vec_type_norm_2_1  = (vec_opfvv) && (vec_inst[31:28]== 4'b0010); //inject
assign vec_type_norm_2_3  = (vec_opfvv) && (vec_inst[31:29]== 3'b011);//compare
assign vec_type_norm_2_4  = (vec_opfvv) && (vec_inst[31:26]== 6'b100000);//fdiv
assign vec_type_norm_2_6  = (vec_opfvv) && (vec_inst[31:26]== 6'b100011) && !vec_inst[19];//fsqrt
assign vec_type_norm_2_7  = (vec_opfvv) && (vec_inst[31:26]== 6'b100011) &&  vec_inst[19];//fclass
//assign vec_type_norm_2_8  = (vec_opfvv) && (vec_inst[31:26]== 6'b100100);//vfmul
assign vec_type_norm_2_a  = (vec_opfvv) && (vec_inst[31:28]== 4'b1011);//vfmac
assign vec_type_norm_2_b  = (vec_opfvv) && (vec_inst[31:26]== 6'b100010) &&(x_vfunary0_vld_norm);
assign vec_type_norm_2_c  = (vec_opfvv) && (vec_inst[31:28]== 4'b1010);//vfmadd

assign vec_type_fcvt_norm = vec_type_norm_2_b;

assign vec_type_fdiv       = vec_type_norm_2_4 || vec_type_norm_2_6;
assign vec_type_fmac       = vec_type_wide_8   || vec_type_norm_2_a;
assign vec_type_fcvt       = vec_type_fcvt_narr|| vec_type_fcvt_wide|| vec_type_fcvt_norm;

assign vec_norm_mul       =  vec_type_norm_0_9 || vec_type_norm_1_1 || vec_type_norm_1_2;
assign vec_norm_sht       =  vec_type_norm_0_7 || vec_type_norm_0_a || vec_type_norm_0_b;
assign vec_norm_div       =  vec_type_norm_1_0;

assign vec_norm_sat       = vec_type_norm_0_5 || vec_type_norm_0_9;

assign vec_norm_mac       = vec_type_norm_1_2;

//----------------------------------------------------------
//                  reduction inst
//----------------------------------------------------------
assign vec_type_redu      =(vec_inst[31:27]==5'b11000) && vec_opivv ||
                           (vec_inst[31:29]==3'b000)   && vec_opmvv;

//----------------------------------------------------------
//                  all normal inst info
//----------------------------------------------------------
assign vec_inst_sat       = vec_narr_sat || vec_wide_sat || vec_norm_sat;

assign vec_inst_mac       = vec_wide_mac || vec_norm_mac;

assign vec_inst_sht       = vec_narr_sht || vec_norm_sht;

assign vec_inst_div       = vec_norm_div || vec_type_fdiv; 

assign vec_inst_adc       = vec_type_norm_0_2;

assign vec_inst_red       = vec_type_redu;

assign vec_inst_cmp       = vec_type_norm_0_2 && vec_inst[26] || vec_type_norm_0_4;

assign vec_inst_madd      =  vec_type_norm_2_c;

assign vec_norm_inst_vmla = vec_inst_mac || vec_narr_sht  || vec_inst_red || 
                            vec_inst_cmp || vec_type_fmac || vec_type_fcvt;

assign vec_inst_ereg      =(vec_opfvv) 
                        && !vec_type_norm_2_1    //fsgnj
                        && !vec_type_norm_2_7;   //fclass
// &CombBeg; @640
always @( vec_norm_mul
       or vec_type_fcvt
       or vec_inst_div
       or vec_inst_red
       or vec_inst_sht)
begin
case({vec_inst_red,vec_inst_sht,vec_inst_div,vec_norm_mul,vec_type_fcvt})
 5'b00001:vec_norm_pipe[9:0] = PIPE7;
 5'b00010:vec_norm_pipe[9:0] = PIPE7;
 5'b00100:vec_norm_pipe[9:0] = PIPE6;
 5'b01000:vec_norm_pipe[9:0] = PIPE6;
 5'b10000:vec_norm_pipe[9:0] = PIPE6;
 default :vec_norm_pipe[9:0] = PIPE67;
endcase
// &CombEnd; @649
end

assign vec_norm_srcv0_vld = !(vec_type_norm_0_3 && vec_inst[25]) && //vmv
                            !(vec_type_norm_1_3 && vec_inst[15]);   //vid

assign vec_norm_srcv1_vld = !vec_type_norm_1_3 && !vec_opivi  //viota,vid or V-I inst
                    //     && !vec_type_fcvt     //fcvt
                         && !vec_type_norm_2_6  //fsqrt 
                         && !vec_type_norm_2_7; //fclass

assign vec_norm_srcv2_vld = (!vec_inst[25] && !vec_inst_red) || vec_norm_mac || vec_wide_mac || vec_type_fmac || vec_inst_madd;
assign vec_norm_srcvm_vld = !vec_inst[25] || vec_inst_adc;  

assign vec_norm_srcv0_offset[5:0] =(vec_type_wide_0 || vec_type_wide_1 
                                 || vec_type_wide_3 || vec_type_wide_4 
                                 || vec_type_wide_5 || vec_type_wide_7
                                 || vec_type_wide_8 || vec_type_wide_9 || 
                                   vec_type_norm_1_3)
                                   ? {3'b000,3'b000} 
                                   : {3'b001,3'b000};

assign vec_norm_srcv1_offset[5:0] =(vec_type_wide || vec_type_narr)
                                   ? {3'b000,3'b000} 
                                   : {3'b001,3'b000};

assign vec_norm_destv_offset_tmp[5:0] =(vec_type_narr)
                                      ? {3'b000,3'b000} 
                                      : {3'b001,3'b000};

assign vec_type_cmp = vec_inst_cmp || vec_type_norm_2_3;

assign vec_norm_destv_offset[5:0] = (vec_type_cmp || vec_type_redu)
                                      ? 6'b0 : vec_norm_destv_offset_tmp[5:0];

assign vec_norm_srcv0_vreg_0_tmp[4:0] = vec_inst[24:20] | {2'b0,vec_norm_srcv0_offset[2 :0]};
assign vec_norm_srcv0_vreg_1_tmp[4:0] = vec_inst[24:20] | {2'b0,vec_norm_srcv0_offset[5 :3]};

assign vec_norm_srcv1_vreg_0_tmp[4:0] = vec_inst[19:15] | {2'b0,vec_norm_srcv1_offset[2 :0]};
assign vec_norm_srcv1_vreg_1_tmp[4:0] = vec_inst[19:15] | {2'b0,vec_norm_srcv1_offset[5 :3]};

assign vec_norm_srcv0_vreg_0[4:0] = vec_src_switch ?  vec_norm_srcv1_vreg_0_tmp[4:0]: vec_norm_srcv0_vreg_0_tmp[4:0];
assign vec_norm_srcv0_vreg_1[4:0] = vec_src_switch ?  vec_norm_srcv1_vreg_1_tmp[4:0]: vec_norm_srcv0_vreg_1_tmp[4:0];

assign vec_norm_srcv1_vreg_0[4:0] = vec_type_fcvt ? vec_norm_destv_vreg_0[4:0] : vec_src_switch ?  vec_norm_srcv0_vreg_0_tmp[4:0]: vec_norm_srcv1_vreg_0_tmp[4:0];
assign vec_norm_srcv1_vreg_1[4:0] = vec_type_fcvt ? vec_norm_destv_vreg_1[4:0] : vec_src_switch ?  vec_norm_srcv0_vreg_1_tmp[4:0]: vec_norm_srcv1_vreg_1_tmp[4:0];

assign vec_norm_destv_vreg_0[4:0] = vec_inst[11: 7] | {2'b0,vec_norm_destv_offset[2 :0]};
assign vec_norm_destv_vreg_1[4:0] = vec_inst[11: 7] | {2'b0,vec_norm_destv_offset[5 :3]};

assign vec_src_switch = ((vec_inst[31:26]==6'b000010)                   //vsub
                      || (vec_inst[31:26]==6'b010010)                   //vsbc
                      || (vec_inst[31:26]==6'b010011)                   //vmsbc
                      || (vec_inst[31:26]==6'b011010)                   //vmsltu
                      || (vec_inst[31:26]==6'b011011)                   //vmslt
                      || (vec_inst[31:26]==6'b100010)                   //vssubu
                      || (vec_inst[31:26]==6'b100011)                   //vssub
                      || (vec_inst[31:26]==6'b100110))&& vec_opivv      //vasub
                      ||((vec_inst[31:26]==6'b110010)                   //vwsubu
                      || (vec_inst[31:26]==6'b110011)                   //vwsub
                      || (vec_inst[31:26]==6'b110110)                   //vwsubu.w
                      || (vec_inst[31:26]==6'b110111)                   //vwsub.w
                      || (vec_inst[31:26]==6'b101001)                   //vmadd
                      || (vec_inst[31:26]==6'b101011))&& vec_opmvv      //vnmsub
                      ||((vec_inst[31:29]==3'b101)                      //vfmacc
                      || (vec_inst[31:28]==4'b1111)) && vec_opfvv;      //vfwmacc
//----------------------------------------------------------
//                  normal inst 0
//----------------------------------------------------------
// &CombBeg; @717
always @( vec_wide_mac
       or vec_norm_pipe[9:0]
       or vec_norm_inst_vmla
       or vec_norm_srcv1_vld
       or vec_norm_srcv0_vld
       or vec_inst_red
       or vec_norm_srcv2_vld
       or vec_norm_srcv1_vreg_0[4:0]
       or vec_wide_mul
       or vec_norm_srcvm_vld
       or vec_norm_srcv0_vreg_0[4:0]
       or vec_inst_sat
       or vec_inst[31:0]
       or vec_norm_destv_vreg_0[4:0]
       or vec_type_narr
       or vec_inst_ereg
       or vec_type_cmp)
begin
  vec_norm_inst0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_norm_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9] = (vec_wide_mul || vec_wide_mac) ? PIPE7 : vec_norm_pipe[9:0];
  vec_norm_inst0_data[IR_SPLIT_NUM-6]              = 1'b0;
  vec_norm_inst0_data[IR_OPCODE:IR_OPCODE-31]      = vec_inst[31:0];
  vec_norm_inst0_data[IR_SRCV0_VLD]                = vec_norm_srcv0_vld;
  vec_norm_inst0_data[IR_SRCV1_VLD]                = vec_norm_srcv1_vld;
  vec_norm_inst0_data[IR_SRCV2_VLD]                = vec_norm_srcv2_vld || vec_type_narr || vec_type_cmp;
  vec_norm_inst0_data[IR_SRCVM_VLD]                = vec_norm_srcvm_vld;
  vec_norm_inst0_data[IR_DSTV_VLD]                 = 1'b1;
  vec_norm_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5] = {1'b0,vec_norm_srcv0_vreg_0[4:0]};
  vec_norm_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5] = {1'b0,vec_norm_srcv1_vreg_0[4:0]};
  vec_norm_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]   = vec_inst_red ? 6'b100001 : {1'b0,vec_norm_destv_vreg_0[4:0]};
  vec_norm_inst0_data[IR_DSTE_VLD]                 = vec_inst_sat || vec_inst_ereg;
  vec_norm_inst0_data[IR_VMLA]                     = vec_norm_inst_vmla;
  vec_norm_inst0_data[IR_IID_PLUS-3]               = vec_inst_red;
  vec_norm_inst0_data[IR_INTMASK]                  = 1'b1;
  vec_norm_inst0_data[IR_SPLIT]                    = 1'b1;
  vec_norm_inst0_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @738
end

//----------------------------------------------------------
//                  normal inst 1
//----------------------------------------------------------
// &CombBeg; @743
always @( vec_wide_mac
       or vec_norm_pipe[9:0]
       or vec_norm_inst_vmla
       or vec_norm_srcv1_vld
       or vec_norm_srcv0_vreg_1[4:0]
       or vec_norm_srcv0_vld
       or vec_norm_destv_vreg_1[4:0]
       or vec_norm_srcv2_vld
       or vec_inst_red
       or vec_wide_mul
       or vec_norm_srcvm_vld
       or vec_inst_sat
       or vec_inst[31:0]
       or vec_inst_ereg
       or vec_type_narr
       or vec_type_cmp
       or vec_norm_srcv1_vreg_1[4:0])
begin
  vec_norm_inst1_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_norm_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9] = (vec_wide_mul || vec_wide_mac) ? PIPE6 : vec_norm_pipe[9:0];
  vec_norm_inst1_data[IR_SPLIT_NUM-6]              = 1'b1;
  vec_norm_inst1_data[IR_OPCODE:IR_OPCODE-31]      = vec_inst[31:0];
  vec_norm_inst1_data[IR_SRCV0_VLD]                = vec_norm_srcv0_vld;
  vec_norm_inst1_data[IR_SRCV1_VLD]                = vec_norm_srcv1_vld;
  vec_norm_inst1_data[IR_SRCV2_VLD]                = vec_norm_srcv2_vld || vec_type_narr || vec_type_cmp;
  vec_norm_inst1_data[IR_SRCVM_VLD]                = vec_norm_srcvm_vld;
  vec_norm_inst1_data[IR_DSTV_VLD]                 = 1'b1;
  vec_norm_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5] = {1'b0,vec_norm_srcv0_vreg_1[4:0]};
  vec_norm_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5] = vec_inst_red ? 6'b100001 : {1'b0,vec_norm_srcv1_vreg_1[4:0]};
  vec_norm_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]   = {1'b0,vec_norm_destv_vreg_1[4:0]};
  vec_norm_inst1_data[IR_DSTE_VLD]                 = vec_inst_sat || vec_inst_ereg;
  vec_norm_inst1_data[IR_VMLA]                     = vec_norm_inst_vmla;
  vec_norm_inst1_data[IR_SPLIT]                    = 1'b0;
  vec_norm_inst1_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @762
end

assign norm_dep_info[1:0]  = 2'b0;  //preg_dep_mask[1:0]
assign norm_dep_info[2]    = 1'b0;  //vreg_dep_mask
assign norm_dep_info[3]    = vec_narr_sht;  //srcv1_dep_mask

//----------------------------------------------------------
//                  mpop inst
//----------------------------------------------------------
//assign vec_inst_mpop      = (vec_inst[31:27]==5'b01010) && vec_opmvv; //vmpopc.m vmfirst.m
//----------------------------------------------------------
//                  mpop inst 0
//----------------------------------------------------------
assign vec_mpop_inst0_op[31:0]  = vec_inst[31:0];
// &CombBeg; @776
always @( vec_mpop_inst0_op[31:0]
       or vec_inst[25:20])
begin
  vec_mpop_inst0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_mpop_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9] = PIPE67;
  vec_mpop_inst0_data[IR_OPCODE:IR_OPCODE-31]      = vec_mpop_inst0_op[31:0];
  vec_mpop_inst0_data[IR_SRCV0_VLD]                = 1'b1;
  vec_mpop_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5] ={1'b0,vec_inst[24:20]};
  vec_mpop_inst0_data[IR_SRCVM_VLD]                =!vec_inst[25];
  vec_mpop_inst0_data[IR_DSTV_VLD]                 = 1'b1;
  vec_mpop_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]   = 6'b100000;
  vec_mpop_inst0_data[IR_INTMASK]                  = 1'b1;
  vec_mpop_inst0_data[IR_SPLIT]                    = 1'b1;
  vec_mpop_inst0_data[IR_LENGTH]                   = 1'b1;
  vec_mpop_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]   = 4'b1;
  end
// &CombEnd; @791
end

//----------------------------------------------------------
//                  mpop inst 1: mfvr (vext.x.v(rs1==0))
//----------------------------------------------------------
assign vec_mpop_inst1_op[31:26]  = 6'b001100;
assign vec_mpop_inst1_op[25]     = 1'b1;
assign vec_mpop_inst1_op[24:20]  = vec_inst[24:20];
assign vec_mpop_inst1_op[19:15]  = 5'b0;//set index=0
assign vec_mpop_inst1_op[14: 0]  = vec_inst[14:0];

// &CombBeg; @802
always @( vec_mpop_inst1_op[31:0]
       or vec_inst[11:7])
begin
  vec_mpop_inst1_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_mpop_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9] = PIPE67;
  vec_mpop_inst1_data[IR_SPLIT_NUM-6]              = 1'b1;
  vec_mpop_inst1_data[IR_OPCODE:IR_OPCODE-31]      = vec_mpop_inst1_op[31:0];
  vec_mpop_inst1_data[IR_SRCV0_VLD]                = 1'b1;
  vec_mpop_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5] = 6'b100000;
  vec_mpop_inst1_data[IR_DST_VLD]                  = 1'b1;
  vec_mpop_inst1_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,vec_inst[11:7]};
  vec_mpop_inst1_data[IR_SPLIT]                    = 1'b0;
  vec_mpop_inst1_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @815
end

assign mpop_dep_info[1:0]  = 2'b0;  //preg_dep_mask[1:0]
assign mpop_dep_info[2]    = 1'b0;  //vreg_dep_mask
assign mpop_dep_info[3]    = 1'b0;  //srcv1_dep_mask

//----------------------------------------------------------
//                  vext inst
//----------------------------------------------------------
//assign vec_inst_vext      = (vec_inst[31:26]==6'b001100) && !(vec_inst[19:15]==5'b0) && vec_opmvv; //vext with rs1>0
//----------------------------------------------------------
//                  vext inst 0: mtvr (vmv.s.x)
//----------------------------------------------------------
assign vec_vext_inst0_op[31:26]  = 6'b001101;
assign vec_vext_inst0_op[25]     = vec_inst[25];
assign vec_vext_inst0_op[24:20]  = 5'b0;
assign vec_vext_inst0_op[19:15]  = vec_inst[19:15];
assign vec_vext_inst0_op[14:12]  = 3'b110;
assign vec_vext_inst0_op[11: 0]  = vec_inst[11: 0];
// &CombBeg; @834
always @( vec_vext_inst0_op[31:0]
       or vec_inst[19:15])
begin
  vec_vext_inst0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_vext_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9] = ALU;
  vec_vext_inst0_data[IR_OPCODE:IR_OPCODE-31]      = vec_vext_inst0_op[31:0];
  vec_vext_inst0_data[IR_SRC0_VLD]                 = 1'b1;
  vec_vext_inst0_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,vec_inst[19:15]};
  vec_vext_inst0_data[IR_DSTV_VLD]                 = 1'b1;
  vec_vext_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]   = 6'b100000;
  vec_vext_inst0_data[IR_INTMASK]                  = 1'b1;
  vec_vext_inst0_data[IR_SPLIT]                    = 1'b1;
  vec_vext_inst0_data[IR_LENGTH]                   = 1'b1;
  vec_vext_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]   = 4'b1;
  end
// &CombEnd; @848
end

//----------------------------------------------------------
//                  vext inst 1: vext
//----------------------------------------------------------
assign vec_vext_inst1_op[31: 0]  = vec_inst[31: 0];
// &CombBeg; @854
always @( vec_vext_inst1_op[31:0]
       or vec_inst[24:20]
       or vec_inst[11:7])
begin
  vec_vext_inst1_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_vext_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9] = PIPE67;
  vec_vext_inst1_data[IR_OPCODE:IR_OPCODE-31]      = vec_vext_inst1_op[31:0];
  vec_vext_inst1_data[IR_SRCV0_VLD]                = 1'b1;
  vec_vext_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5] = {1'b0,vec_inst[24:20]};
  vec_vext_inst1_data[IR_SRCV1_VLD]                = 1'b1; //srcv1 is from tmp register result
  vec_vext_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5] = 6'b100000;
  vec_vext_inst1_data[IR_DST_VLD]                  = 1'b1;
  vec_vext_inst1_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,vec_inst[11:7]};
  vec_vext_inst1_data[IR_SPLIT]                    = 1'b0;
  vec_vext_inst1_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @868
end

assign vext_dep_info[1:0]  = 2'b0; //preg_dep_mask[1:0]
assign vext_dep_info[2]    = 1'b0;  //vreg_dep_mask
assign vext_dep_info[3]    = 1'b0;  //srcv1_dep_mask

assign vec_inst_type[2:0] = dp_split_short_type[6:4];

assign vec_inst0_data[IR_WIDTH-1:0] = {IR_WIDTH{vec_inst_type[0]}} & vec_norm_inst0_data[IR_WIDTH-1:0] |
                                      {IR_WIDTH{vec_inst_type[1]}} & vec_mpop_inst0_data[IR_WIDTH-1:0] |
                                      {IR_WIDTH{vec_inst_type[2]}} & vec_vext_inst0_data[IR_WIDTH-1:0];

assign vec_inst1_data[IR_WIDTH-1:0] = {IR_WIDTH{vec_inst_type[0]}} & vec_norm_inst1_data[IR_WIDTH-1:0] |
                                      {IR_WIDTH{vec_inst_type[1]}} & vec_mpop_inst1_data[IR_WIDTH-1:0] |
                                      {IR_WIDTH{vec_inst_type[2]}} & vec_vext_inst1_data[IR_WIDTH-1:0];

assign vec_dep_info[3:0] = {4{vec_inst_type[0]}} & norm_dep_info[3:0] |
                           {4{vec_inst_type[1]}} & mpop_dep_info[3:0] |
                           {4{vec_inst_type[2]}} & vext_dep_info[3:0];

//==========================================================
//               Split Instructions Selection
//==========================================================
//----------------------------------------------------------
//              MUX between split instructions
//----------------------------------------------------------
assign split_short_inst0_data[IR_WIDTH-1:0] =
         {IR_WIDTH{dp_split_short_type[0]}}  &   jal_inst0_data[IR_WIDTH-1:0]
       | {IR_WIDTH{dp_split_short_type[1]}}  &   fp_inst0_data[IR_WIDTH-1:0]
       | {IR_WIDTH{dp_split_short_type[2]}}  &   lsi_inst0_data[IR_WIDTH-1:0]
       | {IR_WIDTH{dp_split_short_type[3]}}  &   lsd_inst0_data[IR_WIDTH-1:0]
       |                                         vec_inst0_data[IR_WIDTH-1:0];

assign split_short_inst1_data[IR_WIDTH-1:0] =
         {IR_WIDTH{dp_split_short_type[0]}}  &   jal_inst1_data[IR_WIDTH-1:0]
       | {IR_WIDTH{dp_split_short_type[1]}}  &   fp_inst1_data[IR_WIDTH-1:0]
       | {IR_WIDTH{dp_split_short_type[2]}}  &   lsi_inst1_data[IR_WIDTH-1:0]
       | {IR_WIDTH{dp_split_short_type[3]}}  &   lsd_inst1_data[IR_WIDTH-1:0] 
       |                                         vec_inst1_data[IR_WIDTH-1:0];

assign split_short_dp_dep_info[3:0] =
         {4{dp_split_short_type[0]}}  &   jal_dep_info[3:0]
       | {4{dp_split_short_type[1]}}  &   fp_dep_info[3:0]
       | {4{dp_split_short_type[2]}}  &   lsi_dep_info[3:0]
       | {4{dp_split_short_type[3]}}  &   lsd_dep_info[3:0] 
       |                                  vec_dep_info[3:0];

//----------------------------------------------------------
//             Re-Pack into IR data path form
//----------------------------------------------------------
// &CombBeg; @918
always @( vec_inst_type[2]
       or dp_split_short_bkptb_inst
       or dp_split_short_vsew[2:0]
       or split_short_inst0_data[177:0]
       or dp_split_short_no_spec
       or dp_split_short_vlmul[1:0]
       or dp_split_short_bkpta_inst
       or dp_split_short_vl[7:0]
       or dp_split_short_vl_pred
       or dp_split_short_pc[14:0])
begin
  split_short_dp_inst0_data[IR_WIDTH-1:0]              = split_short_inst0_data[IR_WIDTH-1:0];
  if(1'b1) begin
  split_short_dp_inst0_data[IR_DST_X0]                 = (split_short_inst0_data[IR_DST_REG:IR_DST_REG-5]
                                                          == 6'd0);
  split_short_dp_inst0_data[IR_SPLIT_LAST]             = !split_short_inst0_data[IR_SPLIT];
  split_short_dp_inst0_data[IR_BKPTB_INST]             = dp_split_short_bkptb_inst;
  split_short_dp_inst0_data[IR_BKPTA_INST]             = dp_split_short_bkpta_inst;
  split_short_dp_inst0_data[IR_NO_SPEC]                = dp_split_short_no_spec;
  split_short_dp_inst0_data[IR_VLMUL:IR_VLMUL-1]       = dp_split_short_vlmul[1:0];
  split_short_dp_inst0_data[IR_VSEW:IR_VSEW-2]         = vec_inst_type[2] ? 3'b011 : dp_split_short_vsew[2:0];
  split_short_dp_inst0_data[IR_VL:IR_VL-7]             = dp_split_short_vl[7:0];
  split_short_dp_inst0_data[IR_VL_PRED]                = dp_split_short_vl_pred;
  split_short_dp_inst0_data[IR_PC:IR_PC-14]            = dp_split_short_pc[14:0];
  end
// &CombEnd; @933
end

// &CombBeg; @935
always @( dp_split_short_bkptb_inst
       or dp_split_short_vsew[2:0]
       or dp_split_short_no_spec
       or dp_split_short_vlmul[1:0]
       or split_short_inst1_data[177:0]
       or dp_split_short_bkpta_inst
       or dp_split_short_vl[7:0]
       or dp_split_short_vl_pred
       or dp_split_short_pc[14:0])
begin
  split_short_dp_inst1_data[IR_WIDTH-1:0]              = split_short_inst1_data[IR_WIDTH-1:0];
  if(1'b1) begin
  split_short_dp_inst1_data[IR_DST_X0]                 = (split_short_inst1_data[IR_DST_REG:IR_DST_REG-5] 
                                                          == 6'd0);
  split_short_dp_inst1_data[IR_SPLIT_LAST]             = !split_short_inst1_data[IR_SPLIT];
  split_short_dp_inst1_data[IR_BKPTB_INST]             = dp_split_short_bkptb_inst;
  split_short_dp_inst1_data[IR_BKPTA_INST]             = dp_split_short_bkpta_inst;
  split_short_dp_inst1_data[IR_NO_SPEC]                = dp_split_short_no_spec;
  split_short_dp_inst1_data[IR_VLMUL:IR_VLMUL-1]       = dp_split_short_vlmul[1:0];
  split_short_dp_inst1_data[IR_VSEW:IR_VSEW-2]         = dp_split_short_vsew[2:0];
  split_short_dp_inst1_data[IR_VL:IR_VL-7]             = dp_split_short_vl[7:0];
  split_short_dp_inst1_data[IR_VL_PRED]                = dp_split_short_vl_pred;
  split_short_dp_inst1_data[IR_PC:IR_PC-14]            = dp_split_short_pc[14:0];
  end
// &CombEnd; @950
end

// &ModuleEnd; @952
endmodule


