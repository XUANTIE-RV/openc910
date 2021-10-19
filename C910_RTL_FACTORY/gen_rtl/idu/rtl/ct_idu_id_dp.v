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
module ct_idu_id_dp(
  cp0_idu_cskyee,
  cp0_idu_frm,
  cp0_idu_fs,
  cp0_idu_icg_en,
  cp0_idu_vill,
  cp0_idu_vs,
  cp0_idu_vstart,
  cp0_idu_zero_delay_move_disable,
  cp0_yy_clk_en,
  cp0_yy_hyper,
  cpurst_b,
  ctrl_dp_id_debug_id_pipedown3,
  ctrl_dp_id_inst0_vld,
  ctrl_dp_id_inst1_vld,
  ctrl_dp_id_inst2_vld,
  ctrl_dp_id_pipedown_1_inst,
  ctrl_dp_id_pipedown_2_inst,
  ctrl_dp_id_pipedown_3_inst,
  ctrl_dp_id_stall,
  ctrl_split_long_id_inst_vld,
  ctrl_split_long_id_stall,
  dp_ctrl_id_inst0_fence,
  dp_ctrl_id_inst0_normal,
  dp_ctrl_id_inst0_split_long,
  dp_ctrl_id_inst0_split_short,
  dp_ctrl_id_inst1_fence,
  dp_ctrl_id_inst1_normal,
  dp_ctrl_id_inst1_split_long,
  dp_ctrl_id_inst1_split_short,
  dp_ctrl_id_inst2_fence,
  dp_ctrl_id_inst2_normal,
  dp_ctrl_id_inst2_split_long,
  dp_ctrl_id_inst2_split_short,
  dp_fence_id_bkpta_inst,
  dp_fence_id_bkptb_inst,
  dp_fence_id_fence_type,
  dp_fence_id_inst,
  dp_fence_id_pc,
  dp_fence_id_vl,
  dp_fence_id_vl_pred,
  dp_fence_id_vlmul,
  dp_fence_id_vsew,
  dp_id_pipedown_dep_info,
  dp_id_pipedown_inst0_data,
  dp_id_pipedown_inst1_data,
  dp_id_pipedown_inst2_data,
  dp_id_pipedown_inst3_data,
  fence_dp_inst0_data,
  fence_dp_inst1_data,
  fence_dp_inst2_data,
  forever_cpuclk,
  idu_had_id_inst0_info,
  idu_had_id_inst1_info,
  idu_had_id_inst2_info,
  ifu_idu_ib_inst0_data,
  ifu_idu_ib_inst1_data,
  ifu_idu_ib_inst2_data,
  ifu_idu_ib_pipedown_gateclk,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  split_long_ctrl_id_stall,
  split_long_ctrl_inst_vld
);

// &Ports; @28
input            cp0_idu_cskyee;                 
input   [2  :0]  cp0_idu_frm;                    
input   [1  :0]  cp0_idu_fs;                     
input            cp0_idu_icg_en;                 
input            cp0_idu_vill;                   
input   [1  :0]  cp0_idu_vs;                     
input   [6  :0]  cp0_idu_vstart;                 
input            cp0_idu_zero_delay_move_disable; 
input            cp0_yy_clk_en;                  
input            cp0_yy_hyper;                   
input            cpurst_b;                       
input            ctrl_dp_id_debug_id_pipedown3;  
input            ctrl_dp_id_inst0_vld;           
input            ctrl_dp_id_inst1_vld;           
input            ctrl_dp_id_inst2_vld;           
input            ctrl_dp_id_pipedown_1_inst;     
input            ctrl_dp_id_pipedown_2_inst;     
input            ctrl_dp_id_pipedown_3_inst;     
input            ctrl_dp_id_stall;               
input            ctrl_split_long_id_inst_vld;    
input            ctrl_split_long_id_stall;       
input   [177:0]  fence_dp_inst0_data;            
input   [177:0]  fence_dp_inst1_data;            
input   [177:0]  fence_dp_inst2_data;            
input            forever_cpuclk;                 
input   [72 :0]  ifu_idu_ib_inst0_data;          
input   [72 :0]  ifu_idu_ib_inst1_data;          
input   [72 :0]  ifu_idu_ib_inst2_data;          
input            ifu_idu_ib_pipedown_gateclk;    
input            iu_yy_xx_cancel;                
input            pad_yy_icg_scan_en;             
input            rtu_idu_flush_fe;               
output           dp_ctrl_id_inst0_fence;         
output           dp_ctrl_id_inst0_normal;        
output           dp_ctrl_id_inst0_split_long;    
output           dp_ctrl_id_inst0_split_short;   
output           dp_ctrl_id_inst1_fence;         
output           dp_ctrl_id_inst1_normal;        
output           dp_ctrl_id_inst1_split_long;    
output           dp_ctrl_id_inst1_split_short;   
output           dp_ctrl_id_inst2_fence;         
output           dp_ctrl_id_inst2_normal;        
output           dp_ctrl_id_inst2_split_long;    
output           dp_ctrl_id_inst2_split_short;   
output           dp_fence_id_bkpta_inst;         
output           dp_fence_id_bkptb_inst;         
output  [2  :0]  dp_fence_id_fence_type;         
output  [31 :0]  dp_fence_id_inst;               
output  [14 :0]  dp_fence_id_pc;                 
output  [7  :0]  dp_fence_id_vl;                 
output           dp_fence_id_vl_pred;            
output  [1  :0]  dp_fence_id_vlmul;              
output  [2  :0]  dp_fence_id_vsew;               
output  [16 :0]  dp_id_pipedown_dep_info;        
output  [177:0]  dp_id_pipedown_inst0_data;      
output  [177:0]  dp_id_pipedown_inst1_data;      
output  [177:0]  dp_id_pipedown_inst2_data;      
output  [177:0]  dp_id_pipedown_inst3_data;      
output  [39 :0]  idu_had_id_inst0_info;          
output  [39 :0]  idu_had_id_inst1_info;          
output  [39 :0]  idu_had_id_inst2_info;          
output           split_long_ctrl_id_stall;       
output  [3  :0]  split_long_ctrl_inst_vld;       

// &Regs; @29
reg     [31 :0]  debug_id_inst0;                 
reg     [7  :0]  debug_id_inst0_info;            
reg     [31 :0]  debug_id_inst1;                 
reg     [7  :0]  debug_id_inst1_info;            
reg     [31 :0]  debug_id_inst2;                 
reg     [7  :0]  debug_id_inst2_info;            
reg     [16 :0]  dp_id_pipedown_dep_info;        
reg     [177:0]  dp_id_pipedown_inst1_data;      
reg     [177:0]  dp_id_pipedown_inst2_data;      
reg     [177:0]  dp_id_pipedown_inst3_data;      
reg     [177:0]  id_decd_inst0_data;             
reg     [177:0]  id_decd_inst1_data;             
reg     [177:0]  id_decd_inst2_data;             
reg     [177:0]  id_expt_inst0_data;             
reg     [4  :0]  id_expt_inst0_expt_vec;         
reg     [177:0]  id_expt_inst1_data;             
reg     [4  :0]  id_expt_inst1_expt_vec;         
reg     [177:0]  id_expt_inst2_data;             
reg     [4  :0]  id_expt_inst2_expt_vec;         
reg     [16 :0]  id_inst01_split_short_dep_info; 
reg     [72 :0]  id_inst0_data;                  
reg     [16 :0]  id_inst0_split_short_dep_info;  
reg     [72 :0]  id_inst1_data;                  
reg     [16 :0]  id_inst1_split_short_dep_info;  
reg     [72 :0]  id_inst2_data;                  
reg     [16 :0]  id_inst2_split_short_dep_info;  
reg     [16 :0]  id_split_long_dep_info;         
reg     [177:0]  id_split_long_inst0_data;       
reg     [177:0]  id_split_long_inst1_data;       
reg     [177:0]  id_split_long_inst2_data;       
reg     [177:0]  id_split_long_inst3_data;       
reg     [3  :0]  id_split_short0_dep_info;       
reg     [177:0]  id_split_short0_inst0_data;     
reg     [177:0]  id_split_short0_inst1_data;     
reg     [3  :0]  id_split_short1_dep_info;       
reg     [177:0]  id_split_short1_inst0_data;     
reg     [177:0]  id_split_short1_inst1_data;     
reg     [3  :0]  id_split_short2_dep_info;       
reg     [177:0]  id_split_short2_inst0_data;     
reg     [177:0]  id_split_short2_inst1_data;     

// &Wires; @30
wire             cp0_idu_cskyee;                 
wire    [2  :0]  cp0_idu_frm;                    
wire    [1  :0]  cp0_idu_fs;                     
wire             cp0_idu_icg_en;                 
wire             cp0_idu_vill;                   
wire    [1  :0]  cp0_idu_vs;                     
wire    [6  :0]  cp0_idu_vstart;                 
wire             cp0_idu_zero_delay_move_disable; 
wire             cp0_yy_clk_en;                  
wire             cp0_yy_hyper;                   
wire             cpurst_b;                       
wire             ctrl_dp_id_debug_id_pipedown3;  
wire             ctrl_dp_id_inst0_vld;           
wire             ctrl_dp_id_inst1_vld;           
wire             ctrl_dp_id_inst2_vld;           
wire             ctrl_dp_id_pipedown_1_inst;     
wire             ctrl_dp_id_pipedown_2_inst;     
wire             ctrl_dp_id_pipedown_3_inst;     
wire             ctrl_dp_id_stall;               
wire             ctrl_split_long_id_inst_vld;    
wire             ctrl_split_long_id_stall;       
wire             debug_id_inst_clk;              
wire             debug_id_inst_clk_en;           
wire             dp_ctrl_id_inst0_fence;         
wire             dp_ctrl_id_inst0_normal;        
wire             dp_ctrl_id_inst0_split_long;    
wire             dp_ctrl_id_inst0_split_short;   
wire             dp_ctrl_id_inst1_fence;         
wire             dp_ctrl_id_inst1_normal;        
wire             dp_ctrl_id_inst1_split_long;    
wire             dp_ctrl_id_inst1_split_short;   
wire             dp_ctrl_id_inst2_fence;         
wire             dp_ctrl_id_inst2_normal;        
wire             dp_ctrl_id_inst2_split_long;    
wire             dp_ctrl_id_inst2_split_short;   
wire             dp_fence_id_bkpta_inst;         
wire             dp_fence_id_bkptb_inst;         
wire    [2  :0]  dp_fence_id_fence_type;         
wire    [31 :0]  dp_fence_id_inst;               
wire    [14 :0]  dp_fence_id_pc;                 
wire    [7  :0]  dp_fence_id_vl;                 
wire             dp_fence_id_vl_pred;            
wire    [1  :0]  dp_fence_id_vlmul;              
wire    [2  :0]  dp_fence_id_vsew;               
wire    [72 :0]  dp_ib_inst0_data;               
wire    [72 :0]  dp_ib_inst1_data;               
wire    [72 :0]  dp_ib_inst2_data;               
wire    [72 :0]  dp_id_inst0_data;               
wire    [7  :0]  dp_id_inst0_info;               
wire             dp_id_inst0_normal;             
wire    [72 :0]  dp_id_inst1_data;               
wire    [7  :0]  dp_id_inst1_info;               
wire             dp_id_inst1_normal;             
wire    [72 :0]  dp_id_inst2_data;               
wire    [7  :0]  dp_id_inst2_info;               
wire             dp_id_inst2_normal;             
wire    [177:0]  dp_id_pipedown_inst0_data;      
wire    [177:0]  fence_dp_inst0_data;            
wire    [177:0]  fence_dp_inst1_data;            
wire    [177:0]  fence_dp_inst2_data;            
wire             forever_cpuclk;                 
wire             id_expt_inst0_expt_vld;         
wire             id_expt_inst0_high_hw_expt;     
wire             id_expt_inst1_expt_vld;         
wire             id_expt_inst1_high_hw_expt;     
wire             id_expt_inst2_expt_vld;         
wire             id_expt_inst2_high_hw_expt;     
wire    [4  :0]  id_inst0_dst_reg;               
wire             id_inst0_dst_vld;               
wire             id_inst0_dst_x0;                
wire             id_inst0_dste_vld;              
wire    [4  :0]  id_inst0_dstf_reg;              
wire             id_inst0_dstf_vld;              
wire    [4  :0]  id_inst0_dstv_reg;              
wire             id_inst0_dstv_vld;              
wire    [2  :0]  id_inst0_fence_type;            
wire             id_inst0_fmla;                  
wire             id_inst0_fmov;                  
wire             id_inst0_illegal;               
wire    [31 :0]  id_inst0_inst;                  
wire    [9  :0]  id_inst0_inst_type;             
wire             id_inst0_length;                
wire             id_inst0_mla;                   
wire             id_inst0_mov;                   
wire    [9  :0]  id_inst0_split_long_type;       
wire    [6  :0]  id_inst0_split_short_type;      
wire    [4  :0]  id_inst0_src0_reg;              
wire             id_inst0_src0_vld;              
wire    [4  :0]  id_inst0_src1_reg;              
wire             id_inst0_src1_vld;              
wire             id_inst0_src2_vld;              
wire    [4  :0]  id_inst0_srcf0_reg;             
wire             id_inst0_srcf0_vld;             
wire    [4  :0]  id_inst0_srcf1_reg;             
wire             id_inst0_srcf1_vld;             
wire    [4  :0]  id_inst0_srcf2_reg;             
wire             id_inst0_srcf2_vld;             
wire    [4  :0]  id_inst0_srcv0_reg;             
wire             id_inst0_srcv0_vld;             
wire    [4  :0]  id_inst0_srcv1_reg;             
wire             id_inst0_srcv1_vld;             
wire             id_inst0_srcv2_vld;             
wire             id_inst0_srcvm_vld;             
wire    [7  :0]  id_inst0_vl;                    
wire    [1  :0]  id_inst0_vlmul;                 
wire             id_inst0_vmb;                   
wire             id_inst0_vmla;                  
wire    [1  :0]  id_inst0_vsew;                  
wire    [4  :0]  id_inst1_dst_reg;               
wire             id_inst1_dst_vld;               
wire             id_inst1_dst_x0;                
wire             id_inst1_dste_vld;              
wire    [4  :0]  id_inst1_dstf_reg;              
wire             id_inst1_dstf_vld;              
wire    [4  :0]  id_inst1_dstv_reg;              
wire             id_inst1_dstv_vld;              
wire    [2  :0]  id_inst1_fence_type;            
wire             id_inst1_fmla;                  
wire             id_inst1_fmov;                  
wire             id_inst1_illegal;               
wire    [31 :0]  id_inst1_inst;                  
wire    [9  :0]  id_inst1_inst_type;             
wire             id_inst1_length;                
wire             id_inst1_mla;                   
wire             id_inst1_mov;                   
wire    [9  :0]  id_inst1_split_long_type;       
wire    [6  :0]  id_inst1_split_short_type;      
wire    [4  :0]  id_inst1_src0_reg;              
wire             id_inst1_src0_vld;              
wire    [4  :0]  id_inst1_src1_reg;              
wire             id_inst1_src1_vld;              
wire             id_inst1_src2_vld;              
wire    [4  :0]  id_inst1_srcf0_reg;             
wire             id_inst1_srcf0_vld;             
wire    [4  :0]  id_inst1_srcf1_reg;             
wire             id_inst1_srcf1_vld;             
wire    [4  :0]  id_inst1_srcf2_reg;             
wire             id_inst1_srcf2_vld;             
wire    [4  :0]  id_inst1_srcv0_reg;             
wire             id_inst1_srcv0_vld;             
wire    [4  :0]  id_inst1_srcv1_reg;             
wire             id_inst1_srcv1_vld;             
wire             id_inst1_srcv2_vld;             
wire             id_inst1_srcvm_vld;             
wire    [7  :0]  id_inst1_vl;                    
wire    [1  :0]  id_inst1_vlmul;                 
wire             id_inst1_vmb;                   
wire             id_inst1_vmla;                  
wire    [1  :0]  id_inst1_vsew;                  
wire    [4  :0]  id_inst2_dst_reg;               
wire             id_inst2_dst_vld;               
wire             id_inst2_dst_x0;                
wire             id_inst2_dste_vld;              
wire    [4  :0]  id_inst2_dstf_reg;              
wire             id_inst2_dstf_vld;              
wire    [4  :0]  id_inst2_dstv_reg;              
wire             id_inst2_dstv_vld;              
wire    [2  :0]  id_inst2_fence_type;            
wire             id_inst2_fmla;                  
wire             id_inst2_fmov;                  
wire             id_inst2_illegal;               
wire    [31 :0]  id_inst2_inst;                  
wire    [9  :0]  id_inst2_inst_type;             
wire             id_inst2_length;                
wire             id_inst2_mla;                   
wire             id_inst2_mov;                   
wire    [9  :0]  id_inst2_split_long_type;       
wire    [6  :0]  id_inst2_split_short_type;      
wire    [4  :0]  id_inst2_src0_reg;              
wire             id_inst2_src0_vld;              
wire    [4  :0]  id_inst2_src1_reg;              
wire             id_inst2_src1_vld;              
wire             id_inst2_src2_vld;              
wire    [4  :0]  id_inst2_srcf0_reg;             
wire             id_inst2_srcf0_vld;             
wire    [4  :0]  id_inst2_srcf1_reg;             
wire             id_inst2_srcf1_vld;             
wire    [4  :0]  id_inst2_srcf2_reg;             
wire             id_inst2_srcf2_vld;             
wire    [4  :0]  id_inst2_srcv0_reg;             
wire             id_inst2_srcv0_vld;             
wire    [4  :0]  id_inst2_srcv1_reg;             
wire             id_inst2_srcv1_vld;             
wire             id_inst2_srcv2_vld;             
wire             id_inst2_srcvm_vld;             
wire    [7  :0]  id_inst2_vl;                    
wire    [1  :0]  id_inst2_vlmul;                 
wire             id_inst2_vmb;                   
wire             id_inst2_vmla;                  
wire    [1  :0]  id_inst2_vsew;                  
wire             id_inst_clk;                    
wire             id_inst_clk_en;                 
wire    [177:0]  id_normal_inst0_data;           
wire    [177:0]  id_normal_inst1_data;           
wire    [177:0]  id_normal_inst2_data;           
wire    [39 :0]  idu_had_id_inst0_info;          
wire    [39 :0]  idu_had_id_inst1_info;          
wire    [39 :0]  idu_had_id_inst2_info;          
wire    [72 :0]  ifu_idu_ib_inst0_data;          
wire    [72 :0]  ifu_idu_ib_inst1_data;          
wire    [72 :0]  ifu_idu_ib_inst2_data;          
wire             ifu_idu_ib_pipedown_gateclk;    
wire             iu_yy_xx_cancel;                
wire             pad_yy_icg_scan_en;             
wire             rtu_idu_flush_fe;               
wire             split_long_ctrl_id_stall;       
wire    [3  :0]  split_long_ctrl_inst_vld;       
wire    [16 :0]  split_long_dp_dep_info;         
wire    [177:0]  split_long_dp_inst0_data;       
wire    [177:0]  split_long_dp_inst1_data;       
wire    [177:0]  split_long_dp_inst2_data;       
wire    [177:0]  split_long_dp_inst3_data;       
wire    [3  :0]  split_short0_dp_dep_info;       
wire    [177:0]  split_short0_dp_inst0_data;     
wire    [177:0]  split_short0_dp_inst1_data;     
wire    [3  :0]  split_short1_dp_dep_info;       
wire    [177:0]  split_short1_dp_inst0_data;     
wire    [177:0]  split_short1_dp_inst1_data;     
wire    [3  :0]  split_short2_dp_dep_info;       
wire    [177:0]  split_short2_dp_inst0_data;     
wire    [177:0]  split_short2_dp_inst1_data;     



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                 ID data path parameters
//----------------------------------------------------------
parameter ID_WIDTH            = 73;

parameter ID_VL_PRED          = 72;
parameter ID_VL               = 71;
parameter ID_PC               = 63;
parameter ID_VSEW             = 48;
parameter ID_VLMUL            = 45;
parameter ID_NO_SPEC          = 43;
parameter ID_BKPTA_INST       = 42;
parameter ID_BKPTB_INST       = 41;
parameter ID_SPLIT_SHORT      = 40;
parameter ID_FENCE            = 39;
parameter ID_SPLIT_LONG       = 38;
parameter ID_HIGH_HW_EXPT     = 37;
parameter ID_EXPT_VEC         = 36;
parameter ID_EXPT_VLD         = 32;
parameter ID_OPCODE           = 31;

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
//                   Dep info parameters
//----------------------------------------------------------
parameter DEP_WIDTH             = 17;

parameter DEP_INST01_SRC0_MASK  = 0;
parameter DEP_INST01_SRC1_MASK  = 1;
parameter DEP_INST12_SRC0_MASK  = 2;
parameter DEP_INST12_SRC1_MASK  = 3;
parameter DEP_INST23_SRC0_MASK  = 4;
parameter DEP_INST23_SRC1_MASK  = 5;
parameter DEP_INST02_PREG_MASK  = 6;
parameter DEP_INST13_PREG_MASK  = 7;
parameter DEP_INST01_VREG_MASK  = 8;
parameter DEP_INST12_VREG_MASK  = 9;
parameter DEP_INST23_VREG_MASK  = 10;
parameter DEP_INST13_VREG_MASK  = 11;
parameter DEP_INST02_VREG_MASK  = 12;
parameter DEP_INST03_VREG_MASK  = 13;
parameter DEP_INST01_SRCV1_MASK = 14;
parameter DEP_INST12_SRCV1_MASK = 15;
parameter DEP_INST23_SRCV1_MASK = 16;

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
//                ID/IR pipeline registers
//==========================================================
//----------------------------------------------------------
//            ID Pipedown Instruction Selection
//----------------------------------------------------------
assign dp_ib_inst0_data[ID_WIDTH-1:0] = ifu_idu_ib_inst0_data[ID_WIDTH-1:0];
assign dp_ib_inst1_data[ID_WIDTH-1:0] = ifu_idu_ib_inst1_data[ID_WIDTH-1:0];
assign dp_ib_inst2_data[ID_WIDTH-1:0] = ifu_idu_ib_inst2_data[ID_WIDTH-1:0];

//----------------------------------------------------------
//            ID Pipedown Instruction Selection
//----------------------------------------------------------
assign dp_id_inst0_data[ID_WIDTH-1:0] =
    {ID_WIDTH{ctrl_dp_id_pipedown_1_inst}} & id_inst1_data[ID_WIDTH-1:0]
  | {ID_WIDTH{ctrl_dp_id_pipedown_2_inst}} & id_inst2_data[ID_WIDTH-1:0]
  | {ID_WIDTH{ctrl_dp_id_pipedown_3_inst}} & dp_ib_inst0_data[ID_WIDTH-1:0];
assign dp_id_inst1_data[ID_WIDTH-1:0] =
    {ID_WIDTH{ctrl_dp_id_pipedown_1_inst}} & id_inst2_data[ID_WIDTH-1:0]
  | {ID_WIDTH{ctrl_dp_id_pipedown_2_inst}} & dp_ib_inst0_data[ID_WIDTH-1:0]
  | {ID_WIDTH{ctrl_dp_id_pipedown_3_inst}} & dp_ib_inst1_data[ID_WIDTH-1:0];
assign dp_id_inst2_data[ID_WIDTH-1:0] =
    {ID_WIDTH{ctrl_dp_id_pipedown_1_inst}} & dp_ib_inst0_data[ID_WIDTH-1:0]
  | {ID_WIDTH{ctrl_dp_id_pipedown_2_inst}} & dp_ib_inst1_data[ID_WIDTH-1:0]
  | {ID_WIDTH{ctrl_dp_id_pipedown_3_inst}} & dp_ib_inst2_data[ID_WIDTH-1:0];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign id_inst_clk_en = ifu_idu_ib_pipedown_gateclk
                        || ctrl_dp_id_inst0_vld;
// &Instance("gated_clk_cell", "x_id_inst_gated_clk"); @180
gated_clk_cell  x_id_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (id_inst_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (id_inst_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @181
//          .external_en (1'b0), @182
//          .global_en   (cp0_yy_clk_en), @183
//          .module_en   (cp0_idu_icg_en), @184
//          .local_en    (id_inst_clk_en), @185
//          .clk_out     (id_inst_clk)); @186

//----------------------------------------------------------
//                ID/IR pipeline registers
//----------------------------------------------------------
always @(posedge id_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    id_inst0_data[ID_WIDTH-1:0] <= {ID_WIDTH{1'b0}};
    id_inst1_data[ID_WIDTH-1:0] <= {ID_WIDTH{1'b0}};
    id_inst2_data[ID_WIDTH-1:0] <= {ID_WIDTH{1'b0}};
  end
  else if(!ctrl_dp_id_stall) begin
    id_inst0_data[ID_WIDTH-1:0] <= dp_id_inst0_data[ID_WIDTH-1:0];
    id_inst1_data[ID_WIDTH-1:0] <= dp_id_inst1_data[ID_WIDTH-1:0];
    id_inst2_data[ID_WIDTH-1:0] <= dp_id_inst2_data[ID_WIDTH-1:0];
  end
  else begin
    id_inst0_data[ID_WIDTH-1:0] <= id_inst0_data[ID_WIDTH-1:0];
    id_inst1_data[ID_WIDTH-1:0] <= id_inst1_data[ID_WIDTH-1:0];
    id_inst2_data[ID_WIDTH-1:0] <= id_inst2_data[ID_WIDTH-1:0];
  end
end

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign debug_id_inst_clk_en = ctrl_dp_id_debug_id_pipedown3;
// &Instance("gated_clk_cell", "x_debug_id_inst_gated_clk"); @214
gated_clk_cell  x_debug_id_inst_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (debug_id_inst_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (debug_id_inst_clk_en),
  .module_en            (cp0_idu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in      (forever_cpuclk), @215
//          .external_en (1'b0), @216
//          .global_en   (cp0_yy_clk_en), @217
//          .module_en   (cp0_idu_icg_en), @218
//          .local_en    (debug_id_inst_clk_en), @219
//          .clk_out     (debug_id_inst_clk)); @220

//----------------------------------------------------------
//               ID inst opcode for debug
//----------------------------------------------------------
always @(posedge debug_id_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    debug_id_inst0[31:0] <= 32'b0;
    debug_id_inst1[31:0] <= 32'b0;
    debug_id_inst2[31:0] <= 32'b0;
  end
  else if(ctrl_dp_id_debug_id_pipedown3) begin
    debug_id_inst0[31:0] <= id_inst0_data[31:0];
    debug_id_inst1[31:0] <= id_inst1_data[31:0];
    debug_id_inst2[31:0] <= id_inst2_data[31:0];
  end
  else begin
    debug_id_inst0[31:0] <= debug_id_inst0[31:0];
    debug_id_inst1[31:0] <= debug_id_inst1[31:0];
    debug_id_inst2[31:0] <= debug_id_inst2[31:0];
  end
end

assign idu_had_id_inst0_info[31:0] = debug_id_inst0[31:0];
assign idu_had_id_inst1_info[31:0] = debug_id_inst1[31:0];
assign idu_had_id_inst2_info[31:0] = debug_id_inst2[31:0];

//----------------------------------------------------------
//                ID inst info for debug
//----------------------------------------------------------
assign dp_id_inst0_info[0]   = id_inst0_data[32];
assign dp_id_inst0_info[1]   = id_inst0_data[39];
assign dp_id_inst0_info[2]   = id_inst0_data[40];
assign dp_id_inst0_info[3]   = id_inst0_data[41];
assign dp_id_inst0_info[7:4] = 4'b0;

assign dp_id_inst1_info[0]   = id_inst1_data[32];
assign dp_id_inst1_info[1]   = id_inst1_data[39];
assign dp_id_inst1_info[2]   = id_inst1_data[40];
assign dp_id_inst1_info[3]   = id_inst1_data[41];
assign dp_id_inst1_info[7:4] = 4'b0;

assign dp_id_inst2_info[0]   = id_inst2_data[32];
assign dp_id_inst2_info[1]   = id_inst2_data[39];
assign dp_id_inst2_info[2]   = id_inst2_data[40];
assign dp_id_inst2_info[3]   = id_inst2_data[41];
assign dp_id_inst2_info[7:4] = 4'b0;

always @(posedge debug_id_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    debug_id_inst0_info[7:0] <= 8'b0;
    debug_id_inst1_info[7:0] <= 8'b0;
    debug_id_inst2_info[7:0] <= 8'b0;
  end
  else if(ctrl_dp_id_debug_id_pipedown3) begin
    debug_id_inst0_info[7:0] <= dp_id_inst0_info[7:0];
    debug_id_inst1_info[7:0] <= dp_id_inst1_info[7:0];
    debug_id_inst2_info[7:0] <= dp_id_inst2_info[7:0];
  end
  else begin
    debug_id_inst0_info[7:0] <= debug_id_inst0_info[7:0];
    debug_id_inst1_info[7:0] <= debug_id_inst1_info[7:0];
    debug_id_inst2_info[7:0] <= debug_id_inst2_info[7:0];
  end
end

assign idu_had_id_inst0_info[39:32] = debug_id_inst0_info[7:0];
assign idu_had_id_inst1_info[39:32] = debug_id_inst1_info[7:0];
assign idu_had_id_inst2_info[39:32] = debug_id_inst2_info[7:0];

//----------------------------------------------------------
//               Type signals for Control Path
//----------------------------------------------------------
//fence and split exclude expt
//bkpt, ifu expt and illegal treat as normal
assign dp_id_inst0_normal      =    !id_inst0_data[ID_FENCE]
                                 && !id_inst0_data[ID_SPLIT_SHORT]
                                 && !id_inst0_data[ID_SPLIT_LONG];
assign dp_id_inst1_normal      =    !id_inst1_data[ID_FENCE]
                                 && !id_inst1_data[ID_SPLIT_SHORT]
                                 && !id_inst1_data[ID_SPLIT_LONG];
assign dp_id_inst2_normal      =    !id_inst2_data[ID_FENCE]
                                 && !id_inst2_data[ID_SPLIT_SHORT]
                                 && !id_inst2_data[ID_SPLIT_LONG];

//output rename for control path
assign dp_ctrl_id_inst0_fence       = id_inst0_data[ID_FENCE];
assign dp_ctrl_id_inst1_fence       = id_inst1_data[ID_FENCE];
assign dp_ctrl_id_inst2_fence       = id_inst2_data[ID_FENCE];

assign dp_ctrl_id_inst0_split_short = id_inst0_data[ID_SPLIT_SHORT];
assign dp_ctrl_id_inst1_split_short = id_inst1_data[ID_SPLIT_SHORT];
assign dp_ctrl_id_inst2_split_short = id_inst2_data[ID_SPLIT_SHORT];

assign dp_ctrl_id_inst0_split_long  = id_inst0_data[ID_SPLIT_LONG];
assign dp_ctrl_id_inst1_split_long  = id_inst1_data[ID_SPLIT_LONG];
assign dp_ctrl_id_inst2_split_long  = id_inst2_data[ID_SPLIT_LONG];

assign dp_ctrl_id_inst0_normal      = dp_id_inst0_normal;
assign dp_ctrl_id_inst1_normal      = dp_id_inst1_normal;
assign dp_ctrl_id_inst2_normal      = dp_id_inst2_normal;

//==========================================================
//                    Normal Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of ID Decoder
//----------------------------------------------------------
assign id_inst0_inst[31:0] = id_inst0_data[ID_OPCODE:ID_OPCODE-31];
assign id_inst1_inst[31:0] = id_inst1_data[ID_OPCODE:ID_OPCODE-31];
assign id_inst2_inst[31:0] = id_inst2_data[ID_OPCODE:ID_OPCODE-31];

assign id_inst0_vsew[1:0]  = id_inst0_data[ID_VSEW-1:ID_VSEW-2];
assign id_inst1_vsew[1:0]  = id_inst1_data[ID_VSEW-1:ID_VSEW-2];
assign id_inst2_vsew[1:0]  = id_inst2_data[ID_VSEW-1:ID_VSEW-2];

assign id_inst0_vlmul[1:0] = id_inst0_data[ID_VLMUL:ID_VLMUL-1];
assign id_inst1_vlmul[1:0] = id_inst1_data[ID_VLMUL:ID_VLMUL-1];
assign id_inst2_vlmul[1:0] = id_inst2_data[ID_VLMUL:ID_VLMUL-1];

assign id_inst0_vl[7:0]    = id_inst0_data[ID_VL:ID_VL-7];
assign id_inst1_vl[7:0]    = id_inst1_data[ID_VL:ID_VL-7];
assign id_inst2_vl[7:0]    = id_inst2_data[ID_VL:ID_VL-7];

// &ConnRule(s/^x_/id_inst0_/); @346
// &Instance("ct_idu_id_decd", "x_ct_idu_id_decd0"); @347
ct_idu_id_decd  x_ct_idu_id_decd0 (
  .cp0_idu_cskyee                  (cp0_idu_cskyee                 ),
  .cp0_idu_frm                     (cp0_idu_frm                    ),
  .cp0_idu_fs                      (cp0_idu_fs                     ),
  .cp0_idu_vill                    (cp0_idu_vill                   ),
  .cp0_idu_vs                      (cp0_idu_vs                     ),
  .cp0_idu_vstart                  (cp0_idu_vstart                 ),
  .cp0_idu_zero_delay_move_disable (cp0_idu_zero_delay_move_disable),
  .cp0_yy_hyper                    (cp0_yy_hyper                   ),
  .x_dst_reg                       (id_inst0_dst_reg               ),
  .x_dst_vld                       (id_inst0_dst_vld               ),
  .x_dst_x0                        (id_inst0_dst_x0                ),
  .x_dste_vld                      (id_inst0_dste_vld              ),
  .x_dstf_reg                      (id_inst0_dstf_reg              ),
  .x_dstf_vld                      (id_inst0_dstf_vld              ),
  .x_dstv_reg                      (id_inst0_dstv_reg              ),
  .x_dstv_vld                      (id_inst0_dstv_vld              ),
  .x_fence_type                    (id_inst0_fence_type            ),
  .x_fmla                          (id_inst0_fmla                  ),
  .x_fmov                          (id_inst0_fmov                  ),
  .x_illegal                       (id_inst0_illegal               ),
  .x_inst                          (id_inst0_inst                  ),
  .x_inst_type                     (id_inst0_inst_type             ),
  .x_length                        (id_inst0_length                ),
  .x_mla                           (id_inst0_mla                   ),
  .x_mov                           (id_inst0_mov                   ),
  .x_split_long_type               (id_inst0_split_long_type       ),
  .x_split_short_type              (id_inst0_split_short_type      ),
  .x_src0_reg                      (id_inst0_src0_reg              ),
  .x_src0_vld                      (id_inst0_src0_vld              ),
  .x_src1_reg                      (id_inst0_src1_reg              ),
  .x_src1_vld                      (id_inst0_src1_vld              ),
  .x_src2_vld                      (id_inst0_src2_vld              ),
  .x_srcf0_reg                     (id_inst0_srcf0_reg             ),
  .x_srcf0_vld                     (id_inst0_srcf0_vld             ),
  .x_srcf1_reg                     (id_inst0_srcf1_reg             ),
  .x_srcf1_vld                     (id_inst0_srcf1_vld             ),
  .x_srcf2_reg                     (id_inst0_srcf2_reg             ),
  .x_srcf2_vld                     (id_inst0_srcf2_vld             ),
  .x_srcv0_reg                     (id_inst0_srcv0_reg             ),
  .x_srcv0_vld                     (id_inst0_srcv0_vld             ),
  .x_srcv1_reg                     (id_inst0_srcv1_reg             ),
  .x_srcv1_vld                     (id_inst0_srcv1_vld             ),
  .x_srcv2_vld                     (id_inst0_srcv2_vld             ),
  .x_srcvm_vld                     (id_inst0_srcvm_vld             ),
  .x_vl                            (id_inst0_vl                    ),
  .x_vlmul                         (id_inst0_vlmul                 ),
  .x_vmb                           (id_inst0_vmb                   ),
  .x_vmla                          (id_inst0_vmla                  ),
  .x_vsew                          (id_inst0_vsew                  )
);

// &ConnRule(s/^x_/id_inst1_/); @348
// &Instance("ct_idu_id_decd", "x_ct_idu_id_decd1"); @349
ct_idu_id_decd  x_ct_idu_id_decd1 (
  .cp0_idu_cskyee                  (cp0_idu_cskyee                 ),
  .cp0_idu_frm                     (cp0_idu_frm                    ),
  .cp0_idu_fs                      (cp0_idu_fs                     ),
  .cp0_idu_vill                    (cp0_idu_vill                   ),
  .cp0_idu_vs                      (cp0_idu_vs                     ),
  .cp0_idu_vstart                  (cp0_idu_vstart                 ),
  .cp0_idu_zero_delay_move_disable (cp0_idu_zero_delay_move_disable),
  .cp0_yy_hyper                    (cp0_yy_hyper                   ),
  .x_dst_reg                       (id_inst1_dst_reg               ),
  .x_dst_vld                       (id_inst1_dst_vld               ),
  .x_dst_x0                        (id_inst1_dst_x0                ),
  .x_dste_vld                      (id_inst1_dste_vld              ),
  .x_dstf_reg                      (id_inst1_dstf_reg              ),
  .x_dstf_vld                      (id_inst1_dstf_vld              ),
  .x_dstv_reg                      (id_inst1_dstv_reg              ),
  .x_dstv_vld                      (id_inst1_dstv_vld              ),
  .x_fence_type                    (id_inst1_fence_type            ),
  .x_fmla                          (id_inst1_fmla                  ),
  .x_fmov                          (id_inst1_fmov                  ),
  .x_illegal                       (id_inst1_illegal               ),
  .x_inst                          (id_inst1_inst                  ),
  .x_inst_type                     (id_inst1_inst_type             ),
  .x_length                        (id_inst1_length                ),
  .x_mla                           (id_inst1_mla                   ),
  .x_mov                           (id_inst1_mov                   ),
  .x_split_long_type               (id_inst1_split_long_type       ),
  .x_split_short_type              (id_inst1_split_short_type      ),
  .x_src0_reg                      (id_inst1_src0_reg              ),
  .x_src0_vld                      (id_inst1_src0_vld              ),
  .x_src1_reg                      (id_inst1_src1_reg              ),
  .x_src1_vld                      (id_inst1_src1_vld              ),
  .x_src2_vld                      (id_inst1_src2_vld              ),
  .x_srcf0_reg                     (id_inst1_srcf0_reg             ),
  .x_srcf0_vld                     (id_inst1_srcf0_vld             ),
  .x_srcf1_reg                     (id_inst1_srcf1_reg             ),
  .x_srcf1_vld                     (id_inst1_srcf1_vld             ),
  .x_srcf2_reg                     (id_inst1_srcf2_reg             ),
  .x_srcf2_vld                     (id_inst1_srcf2_vld             ),
  .x_srcv0_reg                     (id_inst1_srcv0_reg             ),
  .x_srcv0_vld                     (id_inst1_srcv0_vld             ),
  .x_srcv1_reg                     (id_inst1_srcv1_reg             ),
  .x_srcv1_vld                     (id_inst1_srcv1_vld             ),
  .x_srcv2_vld                     (id_inst1_srcv2_vld             ),
  .x_srcvm_vld                     (id_inst1_srcvm_vld             ),
  .x_vl                            (id_inst1_vl                    ),
  .x_vlmul                         (id_inst1_vlmul                 ),
  .x_vmb                           (id_inst1_vmb                   ),
  .x_vmla                          (id_inst1_vmla                  ),
  .x_vsew                          (id_inst1_vsew                  )
);

// &ConnRule(s/^x_/id_inst2_/); @350
// &Instance("ct_idu_id_decd", "x_ct_idu_id_decd2"); @351
ct_idu_id_decd  x_ct_idu_id_decd2 (
  .cp0_idu_cskyee                  (cp0_idu_cskyee                 ),
  .cp0_idu_frm                     (cp0_idu_frm                    ),
  .cp0_idu_fs                      (cp0_idu_fs                     ),
  .cp0_idu_vill                    (cp0_idu_vill                   ),
  .cp0_idu_vs                      (cp0_idu_vs                     ),
  .cp0_idu_vstart                  (cp0_idu_vstart                 ),
  .cp0_idu_zero_delay_move_disable (cp0_idu_zero_delay_move_disable),
  .cp0_yy_hyper                    (cp0_yy_hyper                   ),
  .x_dst_reg                       (id_inst2_dst_reg               ),
  .x_dst_vld                       (id_inst2_dst_vld               ),
  .x_dst_x0                        (id_inst2_dst_x0                ),
  .x_dste_vld                      (id_inst2_dste_vld              ),
  .x_dstf_reg                      (id_inst2_dstf_reg              ),
  .x_dstf_vld                      (id_inst2_dstf_vld              ),
  .x_dstv_reg                      (id_inst2_dstv_reg              ),
  .x_dstv_vld                      (id_inst2_dstv_vld              ),
  .x_fence_type                    (id_inst2_fence_type            ),
  .x_fmla                          (id_inst2_fmla                  ),
  .x_fmov                          (id_inst2_fmov                  ),
  .x_illegal                       (id_inst2_illegal               ),
  .x_inst                          (id_inst2_inst                  ),
  .x_inst_type                     (id_inst2_inst_type             ),
  .x_length                        (id_inst2_length                ),
  .x_mla                           (id_inst2_mla                   ),
  .x_mov                           (id_inst2_mov                   ),
  .x_split_long_type               (id_inst2_split_long_type       ),
  .x_split_short_type              (id_inst2_split_short_type      ),
  .x_src0_reg                      (id_inst2_src0_reg              ),
  .x_src0_vld                      (id_inst2_src0_vld              ),
  .x_src1_reg                      (id_inst2_src1_reg              ),
  .x_src1_vld                      (id_inst2_src1_vld              ),
  .x_src2_vld                      (id_inst2_src2_vld              ),
  .x_srcf0_reg                     (id_inst2_srcf0_reg             ),
  .x_srcf0_vld                     (id_inst2_srcf0_vld             ),
  .x_srcf1_reg                     (id_inst2_srcf1_reg             ),
  .x_srcf1_vld                     (id_inst2_srcf1_vld             ),
  .x_srcf2_reg                     (id_inst2_srcf2_reg             ),
  .x_srcf2_vld                     (id_inst2_srcf2_vld             ),
  .x_srcv0_reg                     (id_inst2_srcv0_reg             ),
  .x_srcv0_vld                     (id_inst2_srcv0_vld             ),
  .x_srcv1_reg                     (id_inst2_srcv1_reg             ),
  .x_srcv1_vld                     (id_inst2_srcv1_vld             ),
  .x_srcv2_vld                     (id_inst2_srcv2_vld             ),
  .x_srcvm_vld                     (id_inst2_srcvm_vld             ),
  .x_vl                            (id_inst2_vl                    ),
  .x_vlmul                         (id_inst2_vlmul                 ),
  .x_vmb                           (id_inst2_vmb                   ),
  .x_vmla                          (id_inst2_vmla                  ),
  .x_vsew                          (id_inst2_vsew                  )
);


// &Force ("nonport","id_inst1_fence_type"); @353
// &Force ("nonport","id_inst2_fence_type"); @354
assign dp_fence_id_fence_type[2:0] = id_inst0_fence_type[2:0];

//----------------------------------------------------------
//            Rename ID stage normal inst data
//----------------------------------------------------------
// &CombBeg; @360
always @( id_inst0_dst_reg[4:0]
       or id_inst0_srcv1_reg[4:0]
       or id_inst0_src1_vld
       or id_inst0_dstv_vld
       or id_inst0_length
       or id_inst0_dst_vld
       or id_inst0_srcf2_vld
       or id_inst0_srcv2_vld
       or id_inst0_data[72:41]
       or id_inst0_fmla
       or id_inst0_src1_reg[4:0]
       or id_inst0_srcf0_vld
       or id_inst0_data[31:0]
       or id_inst0_srcf1_reg[4:0]
       or id_inst0_srcf1_vld
       or id_inst0_src2_vld
       or id_inst0_src0_vld
       or id_inst0_mov
       or id_inst0_dstv_reg[4:0]
       or id_inst0_srcv1_vld
       or id_inst0_srcv0_vld
       or id_inst0_srcf0_reg[4:0]
       or id_inst0_srcvm_vld
       or id_inst0_srcv0_reg[4:0]
       or id_inst0_mla
       or id_inst0_dste_vld
       or id_inst0_src0_reg[4:0]
       or id_inst0_srcf2_reg[4:0]
       or id_inst0_inst_type[9:0]
       or id_inst0_dstf_vld
       or id_inst0_dst_x0
       or id_inst0_dstf_reg[4:0]
       or id_inst0_fmov
       or id_inst0_vmb
       or id_inst0_vmla)
begin
  id_decd_inst0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  id_decd_inst0_data[IR_VL_PRED]                  = id_inst0_data[ID_VL_PRED];
  id_decd_inst0_data[IR_VL:IR_VL-7]               = id_inst0_data[ID_VL:ID_VL-7];
  id_decd_inst0_data[IR_VMB]                      = id_inst0_vmb;
  id_decd_inst0_data[IR_PC:IR_PC-14]              = id_inst0_data[ID_PC:ID_PC-14];
  id_decd_inst0_data[IR_VSEW:IR_VSEW-2]           = id_inst0_data[ID_VSEW:ID_VSEW-2];
  id_decd_inst0_data[IR_VLMUL:IR_VLMUL-1]         = id_inst0_data[ID_VLMUL:ID_VLMUL-1];
  id_decd_inst0_data[IR_FMLA]                     = id_inst0_fmla;
  id_decd_inst0_data[IR_NO_SPEC]                  = id_inst0_data[ID_NO_SPEC];
  id_decd_inst0_data[IR_MLA]                      = id_inst0_mla;
  id_decd_inst0_data[IR_SRC2_VLD]                 = id_inst0_src2_vld;
  id_decd_inst0_data[IR_DST_X0]                   = id_inst0_dst_x0;
  id_decd_inst0_data[IR_VMLA]                     = id_inst0_vmla;
  id_decd_inst0_data[IR_BKPTB_INST]               = id_inst0_data[ID_BKPTB_INST];
  id_decd_inst0_data[IR_BKPTA_INST]               = id_inst0_data[ID_BKPTA_INST];
  id_decd_inst0_data[IR_FMOV]                     = id_inst0_fmov;
  id_decd_inst0_data[IR_MOV]                      = id_inst0_mov;
  id_decd_inst0_data[IR_LENGTH]                   = id_inst0_length;
  id_decd_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9] = id_inst0_inst_type[9:0];
  id_decd_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]   = {1'b0,id_inst0_dstv_reg[4:0]};
  id_decd_inst0_data[IR_DSTV_VLD]                 = id_inst0_dstv_vld;
  id_decd_inst0_data[IR_SRCVM_VLD]                = id_inst0_srcvm_vld;
  id_decd_inst0_data[IR_SRCV2_VLD]                = id_inst0_srcv2_vld;
  id_decd_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5] = {1'b0,id_inst0_srcv1_reg[4:0]};
  id_decd_inst0_data[IR_SRCV1_VLD]                = id_inst0_srcv1_vld;
  id_decd_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5] = {1'b0,id_inst0_srcv0_reg[4:0]};
  id_decd_inst0_data[IR_SRCV0_VLD]                = id_inst0_srcv0_vld;
  id_decd_inst0_data[IR_DSTE_VLD]                 = id_inst0_dste_vld;
  id_decd_inst0_data[IR_DSTF_REG:IR_DSTF_REG-5]   = {1'b0,id_inst0_dstf_reg[4:0]};
  id_decd_inst0_data[IR_DSTF_VLD]                 = id_inst0_dstf_vld;
  id_decd_inst0_data[IR_SRCF2_REG:IR_SRCF2_REG-5] = {1'b0,id_inst0_srcf2_reg[4:0]};
  id_decd_inst0_data[IR_SRCF2_VLD]                = id_inst0_srcf2_vld;
  id_decd_inst0_data[IR_SRCF1_REG:IR_SRCF1_REG-5] = {1'b0,id_inst0_srcf1_reg[4:0]};
  id_decd_inst0_data[IR_SRCF1_VLD]                = id_inst0_srcf1_vld;
  id_decd_inst0_data[IR_SRCF0_REG:IR_SRCF0_REG-5] = {1'b0,id_inst0_srcf0_reg[4:0]};
  id_decd_inst0_data[IR_SRCF0_VLD]                = id_inst0_srcf0_vld;
  id_decd_inst0_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,id_inst0_dst_reg[4:0]};
  id_decd_inst0_data[IR_DST_VLD]                  = id_inst0_dst_vld;
  id_decd_inst0_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,id_inst0_src1_reg[4:0]};
  id_decd_inst0_data[IR_SRC1_VLD]                 = id_inst0_src1_vld;
  id_decd_inst0_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,id_inst0_src0_reg[4:0]};
  id_decd_inst0_data[IR_SRC0_VLD]                 = id_inst0_src0_vld;
  id_decd_inst0_data[IR_OPCODE:IR_OPCODE-31]      = id_inst0_data[ID_OPCODE:ID_OPCODE-31];
  end
// &CombEnd; @406
end

// &CombBeg; @408
always @( id_inst1_srcv1_reg[4:0]
       or id_inst1_src1_vld
       or id_inst1_length
       or id_inst1_dstv_vld
       or id_inst1_dste_vld
       or id_inst1_dstf_reg[4:0]
       or id_inst1_dst_reg[4:0]
       or id_inst1_inst_type[9:0]
       or id_inst1_fmla
       or id_inst1_srcf2_reg[4:0]
       or id_inst1_vmb
       or id_inst1_fmov
       or id_inst1_vmla
       or id_inst1_srcf0_vld
       or id_inst1_data[45:41]
       or id_inst1_mov
       or id_inst1_mla
       or id_inst1_src2_vld
       or id_inst1_srcf1_vld
       or id_inst1_srcf1_reg[4:0]
       or id_inst1_srcv0_vld
       or id_inst1_srcv0_reg[4:0]
       or id_inst1_srcvm_vld
       or id_inst1_dstv_reg[4:0]
       or id_inst1_dst_vld
       or id_inst1_data[31:0]
       or id_inst1_dst_x0
       or id_inst1_src0_reg[4:0]
       or id_inst1_data[72:46]
       or id_inst1_dstf_vld
       or id_inst1_srcf0_reg[4:0]
       or id_inst1_srcf2_vld
       or id_inst1_srcv2_vld
       or id_inst1_src0_vld
       or id_inst1_srcv1_vld
       or id_inst1_src1_reg[4:0])
begin
  id_decd_inst1_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  id_decd_inst1_data[IR_VL_PRED]                  = id_inst1_data[ID_VL_PRED];
  id_decd_inst1_data[IR_VL:IR_VL-7]               = id_inst1_data[ID_VL:ID_VL-7];
  id_decd_inst1_data[IR_VMB]                      = id_inst1_vmb;
  id_decd_inst1_data[IR_PC:IR_PC-14]              = id_inst1_data[ID_PC:ID_PC-14];
  id_decd_inst1_data[IR_VSEW:IR_VSEW-2]           = id_inst1_data[ID_VSEW:ID_VSEW-2];
  id_decd_inst1_data[IR_VLMUL:IR_VLMUL-1]         = id_inst1_data[ID_VLMUL:ID_VLMUL-1];
  id_decd_inst1_data[IR_FMLA]                     = id_inst1_fmla;
  id_decd_inst1_data[IR_NO_SPEC]                  = id_inst1_data[ID_NO_SPEC];
  id_decd_inst1_data[IR_MLA]                      = id_inst1_mla;
  id_decd_inst1_data[IR_SRC2_VLD]                 = id_inst1_src2_vld;
  id_decd_inst1_data[IR_DST_X0]                   = id_inst1_dst_x0;
  id_decd_inst1_data[IR_VMLA]                     = id_inst1_vmla;
  id_decd_inst1_data[IR_BKPTB_INST]               = id_inst1_data[ID_BKPTB_INST];
  id_decd_inst1_data[IR_BKPTA_INST]               = id_inst1_data[ID_BKPTA_INST];
  id_decd_inst1_data[IR_FMOV]                     = id_inst1_fmov;
  id_decd_inst1_data[IR_MOV]                      = id_inst1_mov;
  id_decd_inst1_data[IR_LENGTH]                   = id_inst1_length;
  id_decd_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9] = id_inst1_inst_type[9:0];
  id_decd_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]   = {1'b0,id_inst1_dstv_reg[4:0]};
  id_decd_inst1_data[IR_DSTV_VLD]                 = id_inst1_dstv_vld;
  id_decd_inst1_data[IR_SRCVM_VLD]                = id_inst1_srcvm_vld;
  id_decd_inst1_data[IR_SRCV2_VLD]                = id_inst1_srcv2_vld;
  id_decd_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5] = {1'b0,id_inst1_srcv1_reg[4:0]};
  id_decd_inst1_data[IR_SRCV1_VLD]                = id_inst1_srcv1_vld;
  id_decd_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5] = {1'b0,id_inst1_srcv0_reg[4:0]};
  id_decd_inst1_data[IR_SRCV0_VLD]                = id_inst1_srcv0_vld;
  id_decd_inst1_data[IR_DSTE_VLD]                 = id_inst1_dste_vld;
  id_decd_inst1_data[IR_DSTF_REG:IR_DSTF_REG-5]   = {1'b0,id_inst1_dstf_reg[4:0]};
  id_decd_inst1_data[IR_DSTF_VLD]                 = id_inst1_dstf_vld;
  id_decd_inst1_data[IR_SRCF2_REG:IR_SRCF2_REG-5] = {1'b0,id_inst1_srcf2_reg[4:0]};
  id_decd_inst1_data[IR_SRCF2_VLD]                = id_inst1_srcf2_vld;
  id_decd_inst1_data[IR_SRCF1_REG:IR_SRCF1_REG-5] = {1'b0,id_inst1_srcf1_reg[4:0]};
  id_decd_inst1_data[IR_SRCF1_VLD]                = id_inst1_srcf1_vld;
  id_decd_inst1_data[IR_SRCF0_REG:IR_SRCF0_REG-5] = {1'b0,id_inst1_srcf0_reg[4:0]};
  id_decd_inst1_data[IR_SRCF0_VLD]                = id_inst1_srcf0_vld;
  id_decd_inst1_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,id_inst1_dst_reg[4:0]};
  id_decd_inst1_data[IR_DST_VLD]                  = id_inst1_dst_vld;
  id_decd_inst1_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,id_inst1_src1_reg[4:0]};
  id_decd_inst1_data[IR_SRC1_VLD]                 = id_inst1_src1_vld;
  id_decd_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,id_inst1_src0_reg[4:0]};
  id_decd_inst1_data[IR_SRC0_VLD]                 = id_inst1_src0_vld;
  id_decd_inst1_data[IR_OPCODE:IR_OPCODE-31]      = id_inst1_data[ID_OPCODE:ID_OPCODE-31];
  end
// &CombEnd; @454
end

// &CombBeg; @456
always @( id_inst2_srcf1_reg[4:0]
       or id_inst2_srcv0_vld
       or id_inst2_src0_reg[4:0]
       or id_inst2_srcv1_reg[4:0]
       or id_inst2_dste_vld
       or id_inst2_srcv1_vld
       or id_inst2_srcvm_vld
       or id_inst2_vmla
       or id_inst2_length
       or id_inst2_srcv2_vld
       or id_inst2_dst_x0
       or id_inst2_dstf_reg[4:0]
       or id_inst2_vmb
       or id_inst2_dst_reg[4:0]
       or id_inst2_src2_vld
       or id_inst2_dst_vld
       or id_inst2_data[31:0]
       or id_inst2_src1_vld
       or id_inst2_src0_vld
       or id_inst2_dstv_vld
       or id_inst2_srcv0_reg[4:0]
       or id_inst2_data[72:41]
       or id_inst2_mov
       or id_inst2_dstv_reg[4:0]
       or id_inst2_srcf2_reg[4:0]
       or id_inst2_fmov
       or id_inst2_fmla
       or id_inst2_src1_reg[4:0]
       or id_inst2_dstf_vld
       or id_inst2_srcf2_vld
       or id_inst2_mla
       or id_inst2_srcf0_reg[4:0]
       or id_inst2_srcf1_vld
       or id_inst2_srcf0_vld
       or id_inst2_inst_type[9:0])
begin
  id_decd_inst2_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  id_decd_inst2_data[IR_VL_PRED]                  = id_inst2_data[ID_VL_PRED];
  id_decd_inst2_data[IR_VL:IR_VL-7]               = id_inst2_data[ID_VL:ID_VL-7];
  id_decd_inst2_data[IR_VMB]                      = id_inst2_vmb;
  id_decd_inst2_data[IR_PC:IR_PC-14]              = id_inst2_data[ID_PC:ID_PC-14];
  id_decd_inst2_data[IR_VSEW:IR_VSEW-2]           = id_inst2_data[ID_VSEW:ID_VSEW-2];
  id_decd_inst2_data[IR_VLMUL:IR_VLMUL-1]         = id_inst2_data[ID_VLMUL:ID_VLMUL-1];
  id_decd_inst2_data[IR_FMLA]                     = id_inst2_fmla;
  id_decd_inst2_data[IR_NO_SPEC]                  = id_inst2_data[ID_NO_SPEC];
  id_decd_inst2_data[IR_MLA]                      = id_inst2_mla;
  id_decd_inst2_data[IR_SRC2_VLD]                 = id_inst2_src2_vld;
  id_decd_inst2_data[IR_DST_X0]                   = id_inst2_dst_x0;
  id_decd_inst2_data[IR_VMLA]                     = id_inst2_vmla;
  id_decd_inst2_data[IR_BKPTB_INST]               = id_inst2_data[ID_BKPTB_INST];
  id_decd_inst2_data[IR_BKPTA_INST]               = id_inst2_data[ID_BKPTA_INST];
  id_decd_inst2_data[IR_FMOV]                     = id_inst2_fmov;
  id_decd_inst2_data[IR_MOV]                      = id_inst2_mov;
  id_decd_inst2_data[IR_LENGTH]                   = id_inst2_length;
  id_decd_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9] = id_inst2_inst_type[9:0];
  id_decd_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]   = {1'b0,id_inst2_dstv_reg[4:0]};
  id_decd_inst2_data[IR_DSTV_VLD]                 = id_inst2_dstv_vld;
  id_decd_inst2_data[IR_SRCVM_VLD]                = id_inst2_srcvm_vld;
  id_decd_inst2_data[IR_SRCV2_VLD]                = id_inst2_srcv2_vld;
  id_decd_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5] = {1'b0,id_inst2_srcv1_reg[4:0]};
  id_decd_inst2_data[IR_SRCV1_VLD]                = id_inst2_srcv1_vld;
  id_decd_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5] = {1'b0,id_inst2_srcv0_reg[4:0]};
  id_decd_inst2_data[IR_SRCV0_VLD]                = id_inst2_srcv0_vld;
  id_decd_inst2_data[IR_DSTE_VLD]                 = id_inst2_dste_vld;
  id_decd_inst2_data[IR_DSTF_REG:IR_DSTF_REG-5]   = {1'b0,id_inst2_dstf_reg[4:0]};
  id_decd_inst2_data[IR_DSTF_VLD]                 = id_inst2_dstf_vld;
  id_decd_inst2_data[IR_SRCF2_REG:IR_SRCF2_REG-5] = {1'b0,id_inst2_srcf2_reg[4:0]};
  id_decd_inst2_data[IR_SRCF2_VLD]                = id_inst2_srcf2_vld;
  id_decd_inst2_data[IR_SRCF1_REG:IR_SRCF1_REG-5] = {1'b0,id_inst2_srcf1_reg[4:0]};
  id_decd_inst2_data[IR_SRCF1_VLD]                = id_inst2_srcf1_vld;
  id_decd_inst2_data[IR_SRCF0_REG:IR_SRCF0_REG-5] = {1'b0,id_inst2_srcf0_reg[4:0]};
  id_decd_inst2_data[IR_SRCF0_VLD]                = id_inst2_srcf0_vld;
  id_decd_inst2_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,id_inst2_dst_reg[4:0]};
  id_decd_inst2_data[IR_DST_VLD]                  = id_inst2_dst_vld;
  id_decd_inst2_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,id_inst2_src1_reg[4:0]};
  id_decd_inst2_data[IR_SRC1_VLD]                 = id_inst2_src1_vld;
  id_decd_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,id_inst2_src0_reg[4:0]};
  id_decd_inst2_data[IR_SRC0_VLD]                 = id_inst2_src0_vld;
  id_decd_inst2_data[IR_OPCODE:IR_OPCODE-31]      = id_inst2_data[ID_OPCODE:ID_OPCODE-31];
  end
// &CombEnd; @502
end

//----------------------------------------------------------
//            normal expt inst expt data select
//----------------------------------------------------------
//ifu expt inst, illegal and bkpt treat as normal inst
//add control path for power optimization
assign id_expt_inst0_expt_vld      = ctrl_dp_id_inst0_vld
                                     && (id_inst0_data[ID_EXPT_VLD]
                                      || id_inst0_illegal);
assign id_expt_inst1_expt_vld      = ctrl_dp_id_inst1_vld
                                     && (id_inst1_data[ID_EXPT_VLD]
                                      || id_inst1_illegal);
assign id_expt_inst2_expt_vld      = ctrl_dp_id_inst2_vld
                                     && (id_inst2_data[ID_EXPT_VLD]
                                      || id_inst2_illegal);

assign id_expt_inst0_high_hw_expt  = id_inst0_data[ID_EXPT_VLD]
                                     && id_inst0_data[ID_HIGH_HW_EXPT];
assign id_expt_inst1_high_hw_expt  = id_inst1_data[ID_EXPT_VLD]
                                     && id_inst1_data[ID_HIGH_HW_EXPT];
assign id_expt_inst2_high_hw_expt  = id_inst2_data[ID_EXPT_VLD]
                                     && id_inst2_data[ID_HIGH_HW_EXPT];

// &CombBeg; @526
always @( id_inst0_data[36:32])
begin
  if(id_inst0_data[ID_EXPT_VLD])
    id_expt_inst0_expt_vec[4:0]    = {1'b0,id_inst0_data[ID_EXPT_VEC:ID_EXPT_VEC-3]};
  else //illegal
    id_expt_inst0_expt_vec[4:0]    = 5'd2;
// &CombEnd; @531
end
// &CombBeg; @532
always @( id_inst1_data[36:32])
begin
  if(id_inst1_data[ID_EXPT_VLD])
    id_expt_inst1_expt_vec[4:0]    = {1'b0,id_inst1_data[ID_EXPT_VEC:ID_EXPT_VEC-3]};
  else //illegal
    id_expt_inst1_expt_vec[4:0]    = 5'd2;
// &CombEnd; @537
end
// &CombBeg; @538
always @( id_inst2_data[36:32])
begin
  if(id_inst2_data[ID_EXPT_VLD])
    id_expt_inst2_expt_vec[4:0]    = {1'b0,id_inst2_data[ID_EXPT_VEC:ID_EXPT_VEC-3]};
  else //illegal
    id_expt_inst2_expt_vec[4:0]    = 5'd2;
// &CombEnd; @543
end

//----------------------------------------------------------
//            Rename ID stage expt inst data
//----------------------------------------------------------
// &CombBeg; @548
always @( id_inst0_data[72:64]
       or id_expt_inst0_expt_vld
       or id_inst0_length
       or id_inst0_data[31:0]
       or id_inst0_data[48:44]
       or id_expt_inst0_expt_vec[4:0]
       or id_expt_inst0_high_hw_expt
       or id_inst0_illegal
       or id_inst0_data[42:41])
begin
  id_expt_inst0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  id_expt_inst0_data[IR_VL_PRED]                  = id_inst0_data[ID_VL_PRED];
  id_expt_inst0_data[IR_VL:IR_VL-7]               = id_inst0_data[ID_VL:ID_VL-7];
  id_expt_inst0_data[IR_VSEW:IR_VSEW-2]           = id_inst0_data[ID_VSEW:ID_VSEW-2];
  id_expt_inst0_data[IR_VLMUL:IR_VLMUL-1]         = id_inst0_data[ID_VLMUL:ID_VLMUL-1];
  id_expt_inst0_data[IR_ILLEGAL]                  = id_inst0_illegal;
  id_expt_inst0_data[IR_BKPTB_INST]               = id_inst0_data[ID_BKPTB_INST];
  id_expt_inst0_data[IR_BKPTA_INST]               = id_inst0_data[ID_BKPTA_INST];
  id_expt_inst0_data[IR_EXPT]                     = id_expt_inst0_high_hw_expt;
  id_expt_inst0_data[IR_EXPT-1:IR_EXPT-5]         = id_expt_inst0_expt_vec[4:0];
  id_expt_inst0_data[IR_EXPT-6]                   = id_expt_inst0_expt_vld;
  id_expt_inst0_data[IR_LENGTH]                   = id_inst0_length;
  id_expt_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9] = SPECIAL;
  id_expt_inst0_data[IR_OPCODE:IR_OPCODE-31]      = id_inst0_data[ID_OPCODE:ID_OPCODE-31];
  end
// &CombEnd; @565
end

// &CombBeg; @567
always @( id_inst1_length
       or id_expt_inst1_expt_vld
       or id_expt_inst1_expt_vec[4:0]
       or id_expt_inst1_high_hw_expt
       or id_inst1_data[72:64]
       or id_inst1_data[42:41]
       or id_inst1_data[31:0]
       or id_inst1_data[48:44]
       or id_inst1_illegal)
begin
  id_expt_inst1_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  id_expt_inst1_data[IR_VL_PRED]                  = id_inst1_data[ID_VL_PRED];
  id_expt_inst1_data[IR_VL:IR_VL-7]               = id_inst1_data[ID_VL:ID_VL-7];
  id_expt_inst1_data[IR_VSEW:IR_VSEW-2]           = id_inst1_data[ID_VSEW:ID_VSEW-2];
  id_expt_inst1_data[IR_VLMUL:IR_VLMUL-1]         = id_inst1_data[ID_VLMUL:ID_VLMUL-1];
  id_expt_inst1_data[IR_ILLEGAL]                  = id_inst1_illegal;
  id_expt_inst1_data[IR_BKPTB_INST]               = id_inst1_data[ID_BKPTB_INST];
  id_expt_inst1_data[IR_BKPTA_INST]               = id_inst1_data[ID_BKPTA_INST];
  id_expt_inst1_data[IR_EXPT]                     = id_expt_inst1_high_hw_expt;
  id_expt_inst1_data[IR_EXPT-1:IR_EXPT-5]         = id_expt_inst1_expt_vec[4:0];
  id_expt_inst1_data[IR_EXPT-6]                   = id_expt_inst1_expt_vld;
  id_expt_inst1_data[IR_LENGTH]                   = id_inst1_length;
  id_expt_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9] = SPECIAL;
  id_expt_inst1_data[IR_OPCODE:IR_OPCODE-31]      = id_inst1_data[ID_OPCODE:ID_OPCODE-31];
  end
// &CombEnd; @584
end

// &CombBeg; @586
always @( id_inst2_data[42:41]
       or id_inst2_data[48:44]
       or id_inst2_length
       or id_expt_inst2_expt_vec[4:0]
       or id_inst2_data[31:0]
       or id_expt_inst2_high_hw_expt
       or id_inst2_data[72:64]
       or id_expt_inst2_expt_vld
       or id_inst2_illegal)
begin
  id_expt_inst2_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  id_expt_inst2_data[IR_VL_PRED]                  = id_inst2_data[ID_VL_PRED];
  id_expt_inst2_data[IR_VL:IR_VL-7]               = id_inst2_data[ID_VL:ID_VL-7];
  id_expt_inst2_data[IR_VSEW:IR_VSEW-2]           = id_inst2_data[ID_VSEW:ID_VSEW-2];
  id_expt_inst2_data[IR_VLMUL:IR_VLMUL-1]         = id_inst2_data[ID_VLMUL:ID_VLMUL-1];
  id_expt_inst2_data[IR_ILLEGAL]                  = id_inst2_illegal;
  id_expt_inst2_data[IR_BKPTB_INST]               = id_inst2_data[ID_BKPTB_INST];
  id_expt_inst2_data[IR_BKPTA_INST]               = id_inst2_data[ID_BKPTA_INST];
  id_expt_inst2_data[IR_EXPT]                     = id_expt_inst2_high_hw_expt;
  id_expt_inst2_data[IR_EXPT-1:IR_EXPT-5]         = id_expt_inst2_expt_vec[4:0];
  id_expt_inst2_data[IR_EXPT-6]                   = id_expt_inst2_expt_vld;
  id_expt_inst2_data[IR_LENGTH]                   = id_inst2_length;
  id_expt_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9] = SPECIAL;
  id_expt_inst2_data[IR_OPCODE:IR_OPCODE-31]      = id_inst2_data[ID_OPCODE:ID_OPCODE-31];
  end
// &CombEnd; @603
end

//----------------------------------------------------------
//               Normal inst data selection
//----------------------------------------------------------
assign id_normal_inst0_data[IR_WIDTH-1:0] = (id_expt_inst0_expt_vld)
                                            ? id_expt_inst0_data[IR_WIDTH-1:0]
                                            : id_decd_inst0_data[IR_WIDTH-1:0];
assign id_normal_inst1_data[IR_WIDTH-1:0] = (id_expt_inst1_expt_vld)
                                            ? id_expt_inst1_data[IR_WIDTH-1:0]
                                            : id_decd_inst1_data[IR_WIDTH-1:0];
assign id_normal_inst2_data[IR_WIDTH-1:0] = (id_expt_inst2_expt_vld)
                                            ? id_expt_inst2_data[IR_WIDTH-1:0]
                                            : id_decd_inst2_data[IR_WIDTH-1:0];

//==========================================================
//                    Split Data Path
//==========================================================
//----------------------------------------------------------
//                Instance of long split
//----------------------------------------------------------
// &Force ("nonport","id_inst1_split_long_type"); @624
// &Force ("nonport","id_inst2_split_long_type"); @625
//long split inst is always from id inst0
//exception information come from ID decoded info
// &Instance("ct_idu_id_split_long", "x_ct_idu_id_split_long"); @628
ct_idu_id_split_long  x_ct_idu_id_split_long (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_idu_vstart                (cp0_idu_vstart               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_split_long_id_inst_vld   (ctrl_split_long_id_inst_vld  ),
  .ctrl_split_long_id_stall      (ctrl_split_long_id_stall     ),
  .dp_split_long_bkpta_inst      (id_inst0_data[42]            ),
  .dp_split_long_bkptb_inst      (id_inst0_data[41]            ),
  .dp_split_long_inst            (id_inst0_data[31:0]          ),
  .dp_split_long_no_spec         (id_inst0_data[43]            ),
  .dp_split_long_pc              (id_inst0_data[63:49]         ),
  .dp_split_long_type            (id_inst0_split_long_type[9:0]),
  .dp_split_long_vl              (id_inst0_data[71:64]         ),
  .dp_split_long_vl_pred         (id_inst0_data[72]            ),
  .dp_split_long_vlmul           (id_inst0_data[45:44]         ),
  .dp_split_long_vsew            (id_inst0_data[48:46]         ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_yy_xx_cancel               (iu_yy_xx_cancel              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .split_long_ctrl_id_stall      (split_long_ctrl_id_stall     ),
  .split_long_ctrl_inst_vld      (split_long_ctrl_inst_vld     ),
  .split_long_dp_dep_info        (split_long_dp_dep_info       ),
  .split_long_dp_inst0_data      (split_long_dp_inst0_data     ),
  .split_long_dp_inst1_data      (split_long_dp_inst1_data     ),
  .split_long_dp_inst2_data      (split_long_dp_inst2_data     ),
  .split_long_dp_inst3_data      (split_long_dp_inst3_data     )
);

// &Connect(.dp_split_long_inst       (id_inst0_data[ID_OPCODE:ID_OPCODE-31]), @629
//          .dp_split_long_type       (id_inst0_split_long_type[9:0]), @630
//          .dp_split_long_bkpta_inst (id_inst0_data[ID_BKPTA_INST]), @631
//          .dp_split_long_bkptb_inst (id_inst0_data[ID_BKPTB_INST]), @632
//          .dp_split_long_no_spec    (id_inst0_data[ID_NO_SPEC]), @633
//          .dp_split_long_vlmul      (id_inst0_data[ID_VLMUL:ID_VLMUL-1]), @634
//          .dp_split_long_vsew       (id_inst0_data[ID_VSEW:ID_VSEW-2]), @635
//          .dp_split_long_vl         (id_inst0_data[ID_VL:ID_VL-7]), @636
//          .dp_split_long_vl_pred    (id_inst0_data[ID_VL_PRED]), @637
//          .dp_split_long_pc         (id_inst0_data[ID_PC:ID_PC-14]) @638
//         ); @639

// &CombBeg; @641
always @( split_long_dp_inst0_data[177:0]
       or split_long_dp_inst3_data[177:0]
       or id_expt_inst0_expt_vld
       or split_long_dp_inst1_data[177:0]
       or split_long_dp_inst2_data[177:0]
       or split_long_dp_dep_info[16:0]
       or id_expt_inst0_data[177:0])
begin
  if(!id_expt_inst0_expt_vld) begin
    id_split_long_inst0_data[IR_WIDTH-1:0] = split_long_dp_inst0_data[IR_WIDTH-1:0];
    id_split_long_inst1_data[IR_WIDTH-1:0] = split_long_dp_inst1_data[IR_WIDTH-1:0];
    id_split_long_inst2_data[IR_WIDTH-1:0] = split_long_dp_inst2_data[IR_WIDTH-1:0];
    id_split_long_inst3_data[IR_WIDTH-1:0] = split_long_dp_inst3_data[IR_WIDTH-1:0];
    id_split_long_dep_info[DEP_WIDTH-1:0]  = split_long_dp_dep_info[DEP_WIDTH-1:0];
  end
  else begin
    id_split_long_inst0_data[IR_WIDTH-1:0] = id_expt_inst0_data[IR_WIDTH-1:0];
    id_split_long_inst1_data[IR_WIDTH-1:0] = id_expt_inst0_data[IR_WIDTH-1:0];
    id_split_long_inst2_data[IR_WIDTH-1:0] = id_expt_inst0_data[IR_WIDTH-1:0];
    id_split_long_inst3_data[IR_WIDTH-1:0] = id_expt_inst0_data[IR_WIDTH-1:0];
    id_split_long_dep_info[DEP_WIDTH-1:0]  = {DEP_WIDTH{1'b0}};
  end
// &CombEnd; @656
end

//----------------------------------------------------------
//                Instance of short split
//----------------------------------------------------------
//exception information come from ID decoded info
// &ConnRule(s/^split_short_dp/split_short0_dp/); @662
// &Instance("ct_idu_id_split_short", "x_ct_idu_id_split_short0"); @663
ct_idu_id_split_short  x_ct_idu_id_split_short0 (
  .dp_split_short_bkpta_inst      (id_inst0_data[42]             ),
  .dp_split_short_bkptb_inst      (id_inst0_data[41]             ),
  .dp_split_short_inst            (id_inst0_data[31:0]           ),
  .dp_split_short_no_spec         (id_inst0_data[43]             ),
  .dp_split_short_pc              (id_inst0_data[63:49]          ),
  .dp_split_short_type            (id_inst0_split_short_type[6:0]),
  .dp_split_short_vl              (id_inst0_data[71:64]          ),
  .dp_split_short_vl_pred         (id_inst0_data[72]             ),
  .dp_split_short_vlmul           (id_inst0_data[45:44]          ),
  .dp_split_short_vsew            (id_inst0_data[48:46]          ),
  .split_short_dp_dep_info        (split_short0_dp_dep_info      ),
  .split_short_dp_inst0_data      (split_short0_dp_inst0_data    ),
  .split_short_dp_inst1_data      (split_short0_dp_inst1_data    )
);

// &Connect(.dp_split_short_inst       (id_inst0_data[ID_OPCODE:ID_OPCODE-31]), @664
//          .dp_split_short_type       (id_inst0_split_short_type[6:0]), @665
//          .dp_split_short_bkpta_inst (id_inst0_data[ID_BKPTA_INST]), @666
//          .dp_split_short_bkptb_inst (id_inst0_data[ID_BKPTB_INST]), @667
//          .dp_split_short_no_spec    (id_inst0_data[ID_NO_SPEC]), @668
//          .dp_split_short_vlmul      (id_inst0_data[ID_VLMUL:ID_VLMUL-1]), @669
//          .dp_split_short_vsew       (id_inst0_data[ID_VSEW:ID_VSEW-2]), @670
//          .dp_split_short_vl         (id_inst0_data[ID_VL:ID_VL-7]), @671
//          .dp_split_short_vl_pred    (id_inst0_data[ID_VL_PRED]), @672
//          .dp_split_short_pc         (id_inst0_data[ID_PC:ID_PC-14]) @673
//         ); @674
// &ConnRule(s/^split_short_dp/split_short1_dp/); @675
// &Instance("ct_idu_id_split_short", "x_ct_idu_id_split_short1"); @676
ct_idu_id_split_short  x_ct_idu_id_split_short1 (
  .dp_split_short_bkpta_inst      (id_inst1_data[42]             ),
  .dp_split_short_bkptb_inst      (id_inst1_data[41]             ),
  .dp_split_short_inst            (id_inst1_data[31:0]           ),
  .dp_split_short_no_spec         (id_inst1_data[43]             ),
  .dp_split_short_pc              (id_inst1_data[63:49]          ),
  .dp_split_short_type            (id_inst1_split_short_type[6:0]),
  .dp_split_short_vl              (id_inst1_data[71:64]          ),
  .dp_split_short_vl_pred         (id_inst1_data[72]             ),
  .dp_split_short_vlmul           (id_inst1_data[45:44]          ),
  .dp_split_short_vsew            (id_inst1_data[48:46]          ),
  .split_short_dp_dep_info        (split_short1_dp_dep_info      ),
  .split_short_dp_inst0_data      (split_short1_dp_inst0_data    ),
  .split_short_dp_inst1_data      (split_short1_dp_inst1_data    )
);

// &Connect(.dp_split_short_inst       (id_inst1_data[ID_OPCODE:ID_OPCODE-31]), @677
//          .dp_split_short_type       (id_inst1_split_short_type[6:0]), @678
//          .dp_split_short_bkpta_inst (id_inst1_data[ID_BKPTA_INST]), @679
//          .dp_split_short_bkptb_inst (id_inst1_data[ID_BKPTB_INST]), @680
//          .dp_split_short_no_spec    (id_inst1_data[ID_NO_SPEC]), @681
//          .dp_split_short_vlmul      (id_inst1_data[ID_VLMUL:ID_VLMUL-1]), @682
//          .dp_split_short_vsew       (id_inst1_data[ID_VSEW:ID_VSEW-2]), @683
//          .dp_split_short_vl         (id_inst1_data[ID_VL:ID_VL-7]), @684
//          .dp_split_short_vl_pred    (id_inst1_data[ID_VL_PRED]), @685
//          .dp_split_short_pc         (id_inst1_data[ID_PC:ID_PC-14]) @686
//         ); @687
// &ConnRule(s/^split_short_dp/split_short2_dp/); @688
// &Instance("ct_idu_id_split_short", "x_ct_idu_id_split_short2"); @689
ct_idu_id_split_short  x_ct_idu_id_split_short2 (
  .dp_split_short_bkpta_inst      (id_inst2_data[42]             ),
  .dp_split_short_bkptb_inst      (id_inst2_data[41]             ),
  .dp_split_short_inst            (id_inst2_data[31:0]           ),
  .dp_split_short_no_spec         (id_inst2_data[43]             ),
  .dp_split_short_pc              (id_inst2_data[63:49]          ),
  .dp_split_short_type            (id_inst2_split_short_type[6:0]),
  .dp_split_short_vl              (id_inst2_data[71:64]          ),
  .dp_split_short_vl_pred         (id_inst2_data[72]             ),
  .dp_split_short_vlmul           (id_inst2_data[45:44]          ),
  .dp_split_short_vsew            (id_inst2_data[48:46]          ),
  .split_short_dp_dep_info        (split_short2_dp_dep_info      ),
  .split_short_dp_inst0_data      (split_short2_dp_inst0_data    ),
  .split_short_dp_inst1_data      (split_short2_dp_inst1_data    )
);

// &Connect(.dp_split_short_inst       (id_inst2_data[ID_OPCODE:ID_OPCODE-31]), @690
//          .dp_split_short_type       (id_inst2_split_short_type[6:0]), @691
//          .dp_split_short_bkpta_inst (id_inst2_data[ID_BKPTA_INST]), @692
//          .dp_split_short_bkptb_inst (id_inst2_data[ID_BKPTB_INST]), @693
//          .dp_split_short_no_spec    (id_inst2_data[ID_NO_SPEC]), @694
//          .dp_split_short_vlmul      (id_inst2_data[ID_VLMUL:ID_VLMUL-1]), @695
//          .dp_split_short_vsew       (id_inst2_data[ID_VSEW:ID_VSEW-2]), @696
//          .dp_split_short_vl         (id_inst2_data[ID_VL:ID_VL-7]), @697
//          .dp_split_short_vl_pred    (id_inst2_data[ID_VL_PRED]), @698
//          .dp_split_short_pc         (id_inst2_data[ID_PC:ID_PC-14]) @699
//         ); @700

// &CombBeg; @702
always @( split_short0_dp_inst1_data[177:0]
       or id_expt_inst0_expt_vld
       or split_short0_dp_inst0_data[177:0]
       or id_expt_inst0_data[177:0]
       or split_short0_dp_dep_info[3:0])
begin
  if(!id_expt_inst0_expt_vld) begin
    id_split_short0_inst0_data[IR_WIDTH-1:0] = split_short0_dp_inst0_data[IR_WIDTH-1:0];
    id_split_short0_inst1_data[IR_WIDTH-1:0] = split_short0_dp_inst1_data[IR_WIDTH-1:0];
    id_split_short0_dep_info[3:0]            = split_short0_dp_dep_info[3:0];
  end
  else begin
    id_split_short0_inst0_data[IR_WIDTH-1:0] = id_expt_inst0_data[IR_WIDTH-1:0];
    id_split_short0_inst1_data[IR_WIDTH-1:0] = id_expt_inst0_data[IR_WIDTH-1:0];
    id_split_short0_dep_info[3:0]            = 4'b0;
  end
// &CombEnd; @713
end

// &CombBeg; @715
always @( id_expt_inst1_expt_vld
       or split_short1_dp_dep_info[3:0]
       or split_short1_dp_inst1_data[177:0]
       or split_short1_dp_inst0_data[177:0]
       or id_expt_inst1_data[177:0])
begin
  if(!id_expt_inst1_expt_vld) begin
    id_split_short1_inst0_data[IR_WIDTH-1:0] = split_short1_dp_inst0_data[IR_WIDTH-1:0];
    id_split_short1_inst1_data[IR_WIDTH-1:0] = split_short1_dp_inst1_data[IR_WIDTH-1:0];
    id_split_short1_dep_info[3:0]            = split_short1_dp_dep_info[3:0];
  end
  else begin
    id_split_short1_inst0_data[IR_WIDTH-1:0] = id_expt_inst1_data[IR_WIDTH-1:0];
    id_split_short1_inst1_data[IR_WIDTH-1:0] = id_expt_inst1_data[IR_WIDTH-1:0];
    id_split_short1_dep_info[3:0]            = 4'b0;
  end
// &CombEnd; @726
end

// &CombBeg; @728
always @( split_short2_dp_dep_info[3:0]
       or split_short2_dp_inst1_data[177:0]
       or split_short2_dp_inst0_data[177:0]
       or id_expt_inst2_data[177:0]
       or id_expt_inst2_expt_vld)
begin
  if(!id_expt_inst2_expt_vld) begin
    id_split_short2_inst0_data[IR_WIDTH-1:0] = split_short2_dp_inst0_data[IR_WIDTH-1:0];
    id_split_short2_inst1_data[IR_WIDTH-1:0] = split_short2_dp_inst1_data[IR_WIDTH-1:0];
    id_split_short2_dep_info[3:0]            = split_short2_dp_dep_info[3:0];
  end
  else begin
    id_split_short2_inst0_data[IR_WIDTH-1:0] = id_expt_inst2_data[IR_WIDTH-1:0];
    id_split_short2_inst1_data[IR_WIDTH-1:0] = id_expt_inst2_data[IR_WIDTH-1:0];
    id_split_short2_dep_info[3:0]            = 4'b0;
  end
// &CombEnd; @739
end

//==========================================================
//                    Fence Data Path
//==========================================================
//----------------------------------------------------------
//              Select ID instruction for fence
//----------------------------------------------------------
assign dp_fence_id_inst[31:0]     = id_inst0_data[ID_OPCODE:ID_OPCODE-31];
assign dp_fence_id_bkpta_inst     = id_inst0_data[ID_BKPTA_INST];
assign dp_fence_id_bkptb_inst     = id_inst0_data[ID_BKPTB_INST];
assign dp_fence_id_vlmul[1:0]     = id_inst0_data[ID_VLMUL:ID_VLMUL-1];
assign dp_fence_id_vsew[2:0]      = id_inst0_data[ID_VSEW:ID_VSEW-2];
assign dp_fence_id_vl[7:0]        = id_inst0_data[ID_VL:ID_VL-7];
assign dp_fence_id_vl_pred        = id_inst0_data[ID_VL_PRED];
assign dp_fence_id_pc[14:0]       = id_inst0_data[ID_PC:ID_PC-14];

//==========================================================
//             ID pipedown inst data selection
//==========================================================
//----------------------------------------------------------
//                  Select inst 0 data
//----------------------------------------------------------
assign dp_id_pipedown_inst0_data[IR_WIDTH-1:0] =
    {IR_WIDTH{dp_id_inst0_normal}}            & id_normal_inst0_data[IR_WIDTH-1:0]
  | {IR_WIDTH{id_inst0_data[ID_SPLIT_SHORT]}} & id_split_short0_inst0_data[IR_WIDTH-1:0]
  | {IR_WIDTH{id_inst0_data[ID_SPLIT_LONG]}}  & id_split_long_inst0_data[IR_WIDTH-1:0]
  | {IR_WIDTH{id_inst0_data[ID_FENCE]}}       & fence_dp_inst0_data[IR_WIDTH-1:0];

//----------------------------------------------------------
//                  Select inst 1 data
//----------------------------------------------------------
// &CombBeg; @771
always @( id_split_short0_inst1_data[177:0]
       or id_split_short1_inst0_data[177:0]
       or id_split_long_inst1_data[177:0]
       or id_inst0_data[40:38]
       or id_inst1_data[40]
       or id_normal_inst1_data[177:0]
       or fence_dp_inst1_data[177:0])
begin
  //if inst0 is fence
  if(id_inst0_data[ID_FENCE])
    dp_id_pipedown_inst1_data[IR_WIDTH-1:0] = fence_dp_inst1_data[IR_WIDTH-1:0];
  //if inst0 is split
  else if(id_inst0_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst1_data[IR_WIDTH-1:0] = id_split_short0_inst1_data[IR_WIDTH-1:0];
  else if(id_inst0_data[ID_SPLIT_LONG])
    dp_id_pipedown_inst1_data[IR_WIDTH-1:0] = id_split_long_inst1_data[IR_WIDTH-1:0];
  //if inst1 is split
  else if(id_inst1_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst1_data[IR_WIDTH-1:0] = id_split_short1_inst0_data[IR_WIDTH-1:0];
  else
    dp_id_pipedown_inst1_data[IR_WIDTH-1:0] = id_normal_inst1_data[IR_WIDTH-1:0];
// &CombEnd; @785
end

//----------------------------------------------------------
//                  Select inst 2 data
//----------------------------------------------------------
// &CombBeg; @790
always @( id_split_short1_inst0_data[177:0]
       or fence_dp_inst2_data[177:0]
       or id_inst0_data[40:38]
       or id_split_short1_inst1_data[177:0]
       or id_normal_inst2_data[177:0]
       or id_split_short2_inst0_data[177:0]
       or id_inst1_data[40]
       or id_split_long_inst2_data[177:0]
       or id_normal_inst1_data[177:0]
       or id_inst2_data[40])
begin
  //if inst0 is fence
  if(id_inst0_data[ID_FENCE])
    dp_id_pipedown_inst2_data[IR_WIDTH-1:0] = fence_dp_inst2_data[IR_WIDTH-1:0];
  //if inst0 is split
  else if(id_inst0_data[ID_SPLIT_LONG])
    dp_id_pipedown_inst2_data[IR_WIDTH-1:0] = id_split_long_inst2_data[IR_WIDTH-1:0];
  else if(id_inst0_data[ID_SPLIT_SHORT] && id_inst1_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst2_data[IR_WIDTH-1:0] = id_split_short1_inst0_data[IR_WIDTH-1:0];
  else if(id_inst0_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst2_data[IR_WIDTH-1:0] = id_normal_inst1_data[IR_WIDTH-1:0];
  //if inst1 is split
  else if(id_inst1_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst2_data[IR_WIDTH-1:0] = id_split_short1_inst1_data[IR_WIDTH-1:0];
  //if inst2 is split
  else if(id_inst2_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst2_data[IR_WIDTH-1:0] = id_split_short2_inst0_data[IR_WIDTH-1:0];
  else
    dp_id_pipedown_inst2_data[IR_WIDTH-1:0] = id_normal_inst2_data[IR_WIDTH-1:0];
// &CombEnd; @809
end

//----------------------------------------------------------
//                  Select inst 3 data
//----------------------------------------------------------
// &CombBeg; @814
always @( id_inst0_data[38]
       or id_split_short1_inst1_data[177:0]
       or id_normal_inst2_data[177:0]
       or id_inst0_data[40]
       or id_inst1_data[40]
       or id_split_short2_inst1_data[177:0]
       or id_split_long_inst3_data[177:0])
begin
  //if inst0 is split
  if(id_inst0_data[ID_SPLIT_LONG])
    dp_id_pipedown_inst3_data[IR_WIDTH-1:0] = id_split_long_inst3_data[IR_WIDTH-1:0];
  else if(id_inst0_data[ID_SPLIT_SHORT] && id_inst1_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst3_data[IR_WIDTH-1:0] = id_split_short1_inst1_data[IR_WIDTH-1:0];
  else if(id_inst0_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst3_data[IR_WIDTH-1:0] = id_normal_inst2_data[IR_WIDTH-1:0];
  //if inst1 is split
  else if(id_inst1_data[ID_SPLIT_SHORT])
    dp_id_pipedown_inst3_data[IR_WIDTH-1:0] = id_normal_inst2_data[IR_WIDTH-1:0];
  //if inst2 is split
  else
    dp_id_pipedown_inst3_data[IR_WIDTH-1:0] = id_split_short2_inst1_data[IR_WIDTH-1:0];
// &CombEnd; @828
end

//----------------------------------------------------------
//                   Select dep info
//----------------------------------------------------------
// &CombBeg; @833
always @( id_split_short0_dep_info[3:0]
       or id_split_short1_dep_info[3:0])
begin
  id_inst01_split_short_dep_info[DEP_WIDTH-1:0]         = {DEP_WIDTH{1'b0}};
  if(1'b1) begin
  id_inst01_split_short_dep_info[DEP_INST01_SRC0_MASK]  = id_split_short0_dep_info[0];
  id_inst01_split_short_dep_info[DEP_INST01_SRC1_MASK]  = id_split_short0_dep_info[1];
  id_inst01_split_short_dep_info[DEP_INST01_VREG_MASK]  = id_split_short0_dep_info[2];
  id_inst01_split_short_dep_info[DEP_INST01_SRCV1_MASK] = id_split_short0_dep_info[3];

  id_inst01_split_short_dep_info[DEP_INST23_SRC0_MASK]  = id_split_short1_dep_info[0];
  id_inst01_split_short_dep_info[DEP_INST23_SRC1_MASK]  = id_split_short1_dep_info[1];
  id_inst01_split_short_dep_info[DEP_INST23_VREG_MASK]  = id_split_short1_dep_info[2];
  id_inst01_split_short_dep_info[DEP_INST23_SRCV1_MASK] = id_split_short1_dep_info[3];
  end
// &CombEnd; @846
end

// &CombBeg; @848
always @( id_split_short0_dep_info[3:0])
begin
  id_inst0_split_short_dep_info[DEP_WIDTH-1:0]         = {DEP_WIDTH{1'b0}};
  if(1'b1) begin
  id_inst0_split_short_dep_info[DEP_INST01_SRC0_MASK]  = id_split_short0_dep_info[0];
  id_inst0_split_short_dep_info[DEP_INST01_SRC1_MASK]  = id_split_short0_dep_info[1];
  id_inst0_split_short_dep_info[DEP_INST01_VREG_MASK]  = id_split_short0_dep_info[2];
  id_inst0_split_short_dep_info[DEP_INST01_SRCV1_MASK] = id_split_short0_dep_info[3];
  end
// &CombEnd; @856
end

// &CombBeg; @858
always @( id_split_short1_dep_info[3:0])
begin
  id_inst1_split_short_dep_info[DEP_WIDTH-1:0]         = {DEP_WIDTH{1'b0}};
  if(1'b1) begin
  id_inst1_split_short_dep_info[DEP_INST12_SRC0_MASK]  = id_split_short1_dep_info[0];
  id_inst1_split_short_dep_info[DEP_INST12_SRC1_MASK]  = id_split_short1_dep_info[1];
  id_inst1_split_short_dep_info[DEP_INST12_VREG_MASK]  = id_split_short1_dep_info[2];
  id_inst1_split_short_dep_info[DEP_INST12_SRCV1_MASK] = id_split_short1_dep_info[3];
  end
// &CombEnd; @866
end

// &CombBeg; @868
always @( id_split_short2_dep_info[3:0])
begin
  id_inst2_split_short_dep_info[DEP_WIDTH-1:0]         = {DEP_WIDTH{1'b0}};
  if(1'b1) begin
  id_inst2_split_short_dep_info[DEP_INST23_SRC0_MASK]  = id_split_short2_dep_info[0];
  id_inst2_split_short_dep_info[DEP_INST23_SRC1_MASK]  = id_split_short2_dep_info[1];
  id_inst2_split_short_dep_info[DEP_INST23_VREG_MASK]  = id_split_short2_dep_info[2];
  id_inst2_split_short_dep_info[DEP_INST23_SRCV1_MASK] = id_split_short2_dep_info[3];
  end
// &CombEnd; @876
end

// &CombBeg; @878
always @( id_inst2_split_short_dep_info[16:0]
       or id_inst01_split_short_dep_info[16:0]
       or id_inst0_data[38]
       or id_inst0_data[40]
       or id_inst1_data[40]
       or id_inst1_split_short_dep_info[16:0]
       or id_split_long_dep_info[16:0]
       or id_inst0_split_short_dep_info[16:0]
       or id_inst2_data[40])
begin
  //if inst0 is split
  if(id_inst0_data[ID_SPLIT_LONG])
    dp_id_pipedown_dep_info[DEP_WIDTH-1:0] = id_split_long_dep_info[DEP_WIDTH-1:0];
  else if(id_inst0_data[ID_SPLIT_SHORT] && id_inst1_data[ID_SPLIT_SHORT])
    dp_id_pipedown_dep_info[DEP_WIDTH-1:0] = id_inst01_split_short_dep_info[DEP_WIDTH-1:0];
  else if(id_inst0_data[ID_SPLIT_SHORT])
    dp_id_pipedown_dep_info[DEP_WIDTH-1:0] = id_inst0_split_short_dep_info[DEP_WIDTH-1:0];
  //if inst1 is split
  else if(id_inst1_data[ID_SPLIT_SHORT])
    dp_id_pipedown_dep_info[DEP_WIDTH-1:0] = id_inst1_split_short_dep_info[DEP_WIDTH-1:0];
  //if inst2 is split
  else if(id_inst2_data[ID_SPLIT_SHORT])
    dp_id_pipedown_dep_info[DEP_WIDTH-1:0] = id_inst2_split_short_dep_info[DEP_WIDTH-1:0];
  else
    dp_id_pipedown_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};
// &CombEnd; @894
end

// &ModuleEnd; @896
endmodule


