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
module ct_idu_is_pipe_entry(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe6_vmla_lch_vld_dupx,
  ctrl_xx_rf_pipe7_vmla_lch_vld_dupx,
  dp_xx_rf_pipe0_dst_preg_dupx,
  dp_xx_rf_pipe1_dst_preg_dupx,
  dp_xx_rf_pipe6_dst_vreg_dupx,
  dp_xx_rf_pipe7_dst_vreg_dupx,
  forever_cpuclk,
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_vld_dupx,
  iu_idu_ex2_pipe1_mult_inst_vld_dupx,
  iu_idu_ex2_pipe1_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_vld_dupx,
  lsu_idu_ag_pipe3_load_inst_vld,
  lsu_idu_ag_pipe3_preg_dupx,
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dupx,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx,
  lsu_idu_dc_pipe3_load_inst_vld_dupx,
  lsu_idu_dc_pipe3_preg_dupx,
  lsu_idu_dc_pipe3_vload_fwd_inst_vld,
  lsu_idu_dc_pipe3_vload_inst_vld_dupx,
  lsu_idu_dc_pipe3_vreg_dupx,
  lsu_idu_wb_pipe3_wb_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_vld_dupx,
  lsu_idu_wb_pipe3_wb_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  vfpu_idu_ex1_pipe6_data_vld_dupx,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dupx,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe6_vreg_dupx,
  vfpu_idu_ex1_pipe7_data_vld_dupx,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx,
  vfpu_idu_ex1_pipe7_vreg_dupx,
  vfpu_idu_ex2_pipe6_data_vld_dupx,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dupx,
  vfpu_idu_ex2_pipe6_vreg_dupx,
  vfpu_idu_ex2_pipe7_data_vld_dupx,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dupx,
  vfpu_idu_ex2_pipe7_vreg_dupx,
  vfpu_idu_ex3_pipe6_data_vld_dupx,
  vfpu_idu_ex3_pipe6_vreg_dupx,
  vfpu_idu_ex3_pipe7_data_vld_dupx,
  vfpu_idu_ex3_pipe7_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx,
  x_create_data,
  x_create_dp_en,
  x_create_gateclk_en,
  x_entry_vld,
  x_read_data
);

// &Ports; @27
input            cp0_idu_icg_en;                         
input            cp0_yy_clk_en;                          
input            cpurst_b;                               
input            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input            ctrl_xx_rf_pipe6_vmla_lch_vld_dupx;     
input            ctrl_xx_rf_pipe7_vmla_lch_vld_dupx;     
input   [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
input   [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
input   [6  :0]  dp_xx_rf_pipe6_dst_vreg_dupx;           
input   [6  :0]  dp_xx_rf_pipe7_dst_vreg_dupx;           
input            forever_cpuclk;                         
input            iu_idu_div_inst_vld;                    
input   [6  :0]  iu_idu_div_preg_dupx;                   
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
input            iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
input            iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
input   [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
input            iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
input            lsu_idu_ag_pipe3_load_inst_vld;         
input   [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
input            lsu_idu_ag_pipe3_vload_inst_vld;        
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;             
input            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
input            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
input            lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
input            lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;             
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
input            lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
input            pad_yy_icg_scan_en;                     
input            rtu_idu_flush_fe;                       
input            rtu_idu_flush_is;                       
input            vfpu_idu_ex1_pipe6_data_vld_dupx;       
input            vfpu_idu_ex1_pipe6_fmla_data_vld_dupx;  
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input   [6  :0]  vfpu_idu_ex1_pipe6_vreg_dupx;           
input            vfpu_idu_ex1_pipe7_data_vld_dupx;       
input            vfpu_idu_ex1_pipe7_fmla_data_vld_dupx;  
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
input   [6  :0]  vfpu_idu_ex1_pipe7_vreg_dupx;           
input            vfpu_idu_ex2_pipe6_data_vld_dupx;       
input            vfpu_idu_ex2_pipe6_fmla_data_vld_dupx;  
input   [6  :0]  vfpu_idu_ex2_pipe6_vreg_dupx;           
input            vfpu_idu_ex2_pipe7_data_vld_dupx;       
input            vfpu_idu_ex2_pipe7_fmla_data_vld_dupx;  
input   [6  :0]  vfpu_idu_ex2_pipe7_vreg_dupx;           
input            vfpu_idu_ex3_pipe6_data_vld_dupx;       
input   [6  :0]  vfpu_idu_ex3_pipe6_vreg_dupx;           
input            vfpu_idu_ex3_pipe7_data_vld_dupx;       
input   [6  :0]  vfpu_idu_ex3_pipe7_vreg_dupx;           
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
input   [270:0]  x_create_data;                          
input            x_create_dp_en;                         
input            x_create_gateclk_en;                    
input            x_entry_vld;                            
output  [270:0]  x_read_data;                            

// &Regs; @28
reg              entry_alu;                              
reg              entry_alu_short;                        
reg              entry_bar;                              
reg     [3  :0]  entry_bar_type;                         
reg              entry_bju;                              
reg              entry_bkpta_inst;                       
reg              entry_bkptb_inst;                       
reg              entry_div;                              
reg     [4  :0]  entry_dst_ereg;                         
reg     [6  :0]  entry_dst_preg;                         
reg     [4  :0]  entry_dst_reg;                          
reg     [4  :0]  entry_dst_rel_ereg;                     
reg     [6  :0]  entry_dst_rel_preg;                     
reg     [6  :0]  entry_dst_rel_vreg;                     
reg              entry_dst_vld;                          
reg     [6  :0]  entry_dst_vreg;                         
reg              entry_dste_vld;                         
reg              entry_dstv_imp;                         
reg     [4  :0]  entry_dstv_reg;                         
reg              entry_dstv_vld;                         
reg     [6  :0]  entry_expt;                             
reg     [3  :0]  entry_iid_plus;                         
reg              entry_intmask;                          
reg              entry_lch_preg;                         
reg              entry_length;                           
reg              entry_load;                             
reg              entry_lsu;                              
reg     [14 :0]  entry_lsu_pc;                           
reg              entry_mfvr;                             
reg              entry_mla;                              
reg              entry_mtvr;                             
reg              entry_mult;                             
reg              entry_no_spec;                          
reg     [31 :0]  entry_opcode;                           
reg              entry_pcall;                            
reg              entry_pcfifo;                           
reg              entry_pipe6;                            
reg              entry_pipe67;                           
reg              entry_pipe7;                            
reg              entry_rts;                              
reg              entry_special;                          
reg              entry_split;                            
reg              entry_split_last;                       
reg     [6  :0]  entry_split_num;                        
reg              entry_src0_vld;                         
reg              entry_src1_vld;                         
reg              entry_src2_vld;                         
reg              entry_srcv0_vld;                        
reg              entry_srcv1_vld;                        
reg              entry_srcv2_vld;                        
reg              entry_srcvm_vld;                        
reg              entry_staddr;                           
reg              entry_store;                            
reg              entry_str;                              
reg              entry_unit_stride;                      
reg              entry_vamo;                             
reg              entry_vdiv;                             
reg              entry_viq_srcv12_switch;                
reg     [7  :0]  entry_vl;                               
reg              entry_vl_pred;                          
reg     [1  :0]  entry_vlmul;                            
reg              entry_vmb;                              
reg              entry_vmla;                             
reg              entry_vmla_short;                       
reg     [2  :0]  entry_vmla_type;                        
reg              entry_vmul;                             
reg              entry_vmul_unsplit;                     
reg              entry_vsetvl;                           
reg              entry_vsetvli;                          
reg     [2  :0]  entry_vsew;                             

// &Wires; @29
wire             alu0_reg_fwd_vld;                       
wire             alu1_reg_fwd_vld;                       
wire             cp0_idu_icg_en;                         
wire             cp0_yy_clk_en;                          
wire             cpurst_b;                               
wire             create_clk;                             
wire             create_clk_en;                          
wire             create_ereg_clk;                        
wire             create_ereg_clk_en;                     
wire             create_other_clk;                       
wire             create_other_clk_en;                    
wire             create_preg_clk;                        
wire             create_preg_clk_en;                     
wire             create_src0_gateclk_en;                 
wire             create_src1_gateclk_en;                 
wire             create_src2_gateclk_en;                 
wire             create_srcv0_gateclk_en;                
wire             create_srcv1_gateclk_en;                
wire             create_srcv2_gateclk_en;                
wire             create_srcvm_gateclk_en;                
wire             create_vreg_clk;                        
wire             create_vreg_clk_en;                     
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dupx;     
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dupx;     
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire    [6  :0]  dp_xx_rf_pipe6_dst_vreg_dupx;           
wire    [6  :0]  dp_xx_rf_pipe7_dst_vreg_dupx;           
wire             forever_cpuclk;                         
wire             gateclk_entry_vld;                      
wire             iu_idu_div_inst_vld;                    
wire    [6  :0]  iu_idu_div_preg_dupx;                   
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire             iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire             iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire             iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire             lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire             lsu_idu_ag_pipe3_vload_inst_vld;        
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;             
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire             lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire             lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
wire             lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;             
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire             lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
wire             mla_reg_fwd_vld;                        
wire             pad_yy_icg_scan_en;                     
wire             rtu_idu_flush_fe;                       
wire             rtu_idu_flush_is;                       
wire             vfpu0_vreg_fwd_vld;                     
wire             vfpu1_vreg_fwd_vld;                     
wire             vfpu_idu_ex1_pipe6_data_vld_dupx;       
wire             vfpu_idu_ex1_pipe6_fmla_data_vld_dupx;  
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_vreg_dupx;           
wire             vfpu_idu_ex1_pipe7_data_vld_dupx;       
wire             vfpu_idu_ex1_pipe7_fmla_data_vld_dupx;  
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_vreg_dupx;           
wire             vfpu_idu_ex2_pipe6_data_vld_dupx;       
wire             vfpu_idu_ex2_pipe6_fmla_data_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex2_pipe6_vreg_dupx;           
wire             vfpu_idu_ex2_pipe7_data_vld_dupx;       
wire             vfpu_idu_ex2_pipe7_fmla_data_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex2_pipe7_vreg_dupx;           
wire             vfpu_idu_ex3_pipe6_data_vld_dupx;       
wire    [6  :0]  vfpu_idu_ex3_pipe6_vreg_dupx;           
wire             vfpu_idu_ex3_pipe7_data_vld_dupx;       
wire    [6  :0]  vfpu_idu_ex3_pipe7_vreg_dupx;           
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
wire    [270:0]  x_create_data;                          
wire             x_create_dp_en;                         
wire             x_create_gateclk_en;                    
wire    [9  :0]  x_create_src0_data;                     
wire    [9  :0]  x_create_src1_data;                     
wire    [10 :0]  x_create_src2_data;                     
wire    [9  :0]  x_create_srcv0_data;                    
wire    [9  :0]  x_create_srcv1_data;                    
wire    [10 :0]  x_create_srcv2_data;                    
wire    [9  :0]  x_create_srcvm_data;                    
wire             x_entry_vld;                            
wire    [270:0]  x_read_data;                            
wire    [11 :0]  x_read_src0_data;                       
wire    [11 :0]  x_read_src1_data;                       
wire    [12 :0]  x_read_src2_data;                       
wire    [11 :0]  x_read_srcv0_data;                      
wire    [11 :0]  x_read_srcv1_data;                      
wire    [12 :0]  x_read_srcv2_data;                      
wire    [11 :0]  x_read_srcvm_data;                      



//==========================================================
//                 IR/IS pipeline select
//==========================================================
parameter IS_WIDTH             = 271;

parameter IS_VL_PRED           = 270;
parameter IS_VL                = 269;
parameter IS_LCH_PREG          = 261;
parameter IS_VAMO              = 260;
parameter IS_UNIT_STRIDE       = 259;
parameter IS_VMB               = 258;
parameter IS_DSTV_IMP          = 257;
parameter IS_VIQ_SRCV12_SWITCH = 256;
parameter IS_VSETVL            = 255;
parameter IS_VSETVLI           = 254;
parameter IS_VSEW              = 253;
parameter IS_VLMUL             = 250;
parameter IS_VMUL              = 248;
parameter IS_VMUL_UNSPLIT      = 247;
parameter IS_VMLA_SHORT        = 246;
parameter IS_VMLA_TYPE         = 245;
parameter IS_SPLIT_NUM         = 242;
parameter IS_NO_SPEC           = 235;
parameter IS_ALU_SHORT         = 234;
parameter IS_MLA               = 233;
parameter IS_STR               = 232;
parameter IS_SPLIT_LAST        = 231;
parameter IS_MFVR              = 230;
parameter IS_MTVR              = 229;
parameter IS_VMLA              = 228;
parameter IS_VDIV              = 227;
parameter IS_PIPE7             = 226;
parameter IS_PIPE6             = 225;
parameter IS_PIPE67            = 224;
parameter IS_IID_PLUS          = 223;
parameter IS_BKPTB_INST        = 219;
parameter IS_BKPTA_INST        = 218;
parameter IS_EXPT              = 217;
parameter IS_RTS               = 210;
parameter IS_SPECIAL           = 209;
parameter IS_LSU               = 208;
parameter IS_DIV               = 207;
parameter IS_MULT              = 206;
parameter IS_INTMASK           = 205;
parameter IS_SPLIT             = 204;
parameter IS_LENGTH            = 203;
parameter IS_PCFIFO            = 202;
parameter IS_PCALL             = 201;
parameter IS_BJU               = 200;
parameter IS_LSU_PC            = 199;
parameter IS_BAR_TYPE          = 184;
parameter IS_BAR               = 180;
parameter IS_STADDR            = 179;
parameter IS_STORE             = 178;
parameter IS_LOAD              = 177;
parameter IS_ALU               = 176;
parameter IS_DST_REL_EREG      = 175;
parameter IS_DST_EREG          = 170;
parameter IS_DST_REL_VREG      = 165;
parameter IS_DST_VREG          = 158;
parameter IS_DSTV_REG          = 151;
parameter IS_SRCVM_LSU_MATCH   = 146;
parameter IS_SRCVM_BP_RDY      = 145;
parameter IS_SRCVM_DATA        = 143;
parameter IS_SRCVM_VREG        = 143;
parameter IS_SRCVM_WB          = 136;
parameter IS_SRCV2_LSU_MATCH   = 134;
parameter IS_SRCV2_BP_RDY      = 133;
parameter IS_SRCV2_DATA        = 131;
parameter IS_SRCV2_VREG        = 130;
parameter IS_SRCV2_WB          = 123;
parameter IS_SRCV1_LSU_MATCH   = 121;
parameter IS_SRCV1_BP_RDY      = 120;
parameter IS_SRCV1_DATA        = 118;
parameter IS_SRCV1_VREG        = 118;
parameter IS_SRCV1_WB          = 111;
parameter IS_SRCV0_LSU_MATCH   = 109;
parameter IS_SRCV0_BP_RDY      = 108;
parameter IS_SRCV0_DATA        = 106;
parameter IS_SRCV0_VREG        = 106;
parameter IS_SRCV0_WB          = 99;
parameter IS_DSTE_VLD          = 97;
parameter IS_DSTV_VLD          = 96;
parameter IS_SRCVM_VLD         = 95;
parameter IS_SRCV2_VLD         = 94;
parameter IS_SRCV1_VLD         = 93;
parameter IS_SRCV0_VLD         = 92;
parameter IS_DST_REL_PREG      = 91;
parameter IS_DST_PREG          = 84;
parameter IS_DST_REG           = 77;
parameter IS_SRC2_LSU_MATCH    = 72;
parameter IS_SRC2_BP_RDY       = 71;
parameter IS_SRC2_DATA         = 69;
parameter IS_SRC2_PREG         = 68;
parameter IS_SRC2_WB           = 61;
parameter IS_SRC1_LSU_MATCH    = 59;
parameter IS_SRC1_BP_RDY       = 58;
parameter IS_SRC1_DATA         = 56;
parameter IS_SRC1_PREG         = 56;
parameter IS_SRC1_WB           = 49;
parameter IS_SRC0_LSU_MATCH    = 47;
parameter IS_SRC0_BP_RDY       = 46;
parameter IS_SRC0_DATA         = 44;
parameter IS_SRC0_PREG         = 44;
parameter IS_SRC0_WB           = 37;
parameter IS_DST_VLD           = 35;
parameter IS_SRC2_VLD          = 34;
parameter IS_SRC1_VLD          = 33;
parameter IS_SRC0_VLD          = 32;
parameter IS_OPCODE            = 31;

//==========================================================
//                 Instance of Gated Cell
//==========================================================
assign create_clk_en = x_create_gateclk_en;
// &Instance("gated_clk_cell", "x_create_gated_clk"); @147
gated_clk_cell  x_create_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_clk_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @148
//          .external_en (1'b0), @149
//          .global_en   (cp0_yy_clk_en), @150
//          .module_en   (cp0_idu_icg_en), @151
//          .local_en    (create_clk_en), @152
//          .clk_out     (create_clk)); @153

assign create_preg_clk_en = x_create_gateclk_en && x_create_data[IS_DST_VLD];
// &Instance("gated_clk_cell", "x_create_preg_gated_clk"); @156
gated_clk_cell  x_create_preg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_preg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_preg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @157
//          .external_en (1'b0), @158
//          .global_en   (cp0_yy_clk_en), @159
//          .module_en   (cp0_idu_icg_en), @160
//          .local_en    (create_preg_clk_en), @161
//          .clk_out     (create_preg_clk)); @162

assign create_vreg_clk_en = x_create_gateclk_en && x_create_data[IS_DSTV_VLD];
// &Instance("gated_clk_cell", "x_create_vreg_gated_clk"); @165
gated_clk_cell  x_create_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_vreg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_vreg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @166
//          .external_en (1'b0), @167
//          .global_en   (cp0_yy_clk_en), @168
//          .module_en   (cp0_idu_icg_en), @169
//          .local_en    (create_vreg_clk_en), @170
//          .clk_out     (create_vreg_clk)); @171

assign create_ereg_clk_en = x_create_gateclk_en && x_create_data[IS_DSTE_VLD];
// &Instance("gated_clk_cell", "x_create_ereg_gated_clk"); @174
gated_clk_cell  x_create_ereg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_ereg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_ereg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @175
//          .external_en (1'b0), @176
//          .global_en   (cp0_yy_clk_en), @177
//          .module_en   (cp0_idu_icg_en), @178
//          .local_en    (create_ereg_clk_en), @179
//          .clk_out     (create_ereg_clk)); @180

assign create_other_clk_en = x_create_gateclk_en
                             && (x_create_data[IS_BAR]
                              || x_create_data[IS_EXPT-6]); //expt_vld
// &Instance("gated_clk_cell", "x_create_other_gated_clk"); @185
gated_clk_cell  x_create_other_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (create_other_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (create_other_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @186
//          .external_en (1'b0), @187
//          .global_en   (cp0_yy_clk_en), @188
//          .module_en   (cp0_idu_icg_en), @189
//          .local_en    (create_other_clk_en), @190
//          .clk_out     (create_other_clk)); @191

//if entry is not valid, shut down dep info clock
assign gateclk_entry_vld = x_entry_vld;

//==========================================================
//                 Instruction Information
//==========================================================
always @(posedge create_preg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    entry_dst_reg[4:0]       <= 5'b0;
    entry_dst_preg[6:0]      <= 7'b0;
    entry_dst_rel_preg[6:0]  <= 7'b0;
  end
  else if(x_create_dp_en) begin
    entry_dst_reg[4:0]       <= x_create_data[IS_DST_REG:IS_DST_REG-4];
    entry_dst_preg[6:0]      <= x_create_data[IS_DST_PREG:IS_DST_PREG-6];
    entry_dst_rel_preg[6:0]  <= x_create_data[IS_DST_REL_PREG:IS_DST_REL_PREG-6];
  end
  else begin
    entry_dst_reg[4:0]       <= entry_dst_reg[4:0];
    entry_dst_preg[6:0]      <= entry_dst_preg[6:0];
    entry_dst_rel_preg[6:0]  <= entry_dst_rel_preg[6:0];
  end
end

always @(posedge create_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    entry_dstv_reg[4:0]      <= 5'b0;
    entry_dst_vreg[6:0]      <= 7'b0;
    entry_dst_rel_vreg[6:0]  <= 7'b0;
  end
  else if(x_create_dp_en) begin
    entry_dstv_reg[4:0]      <= x_create_data[IS_DSTV_REG:IS_DSTV_REG-4];
    entry_dst_vreg[6:0]      <= x_create_data[IS_DST_VREG:IS_DST_VREG-6];
    entry_dst_rel_vreg[6:0]  <= x_create_data[IS_DST_REL_VREG:IS_DST_REL_VREG-6];
  end
  else begin
    entry_dstv_reg[4:0]      <= entry_dstv_reg[4:0];
    entry_dst_vreg[6:0]      <= entry_dst_vreg[6:0];
    entry_dst_rel_vreg[6:0]  <= entry_dst_rel_vreg[6:0];
  end
end

always @(posedge create_ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    entry_dst_ereg[4:0]      <= 5'b0;
    entry_dst_rel_ereg[4:0]  <= 5'b0;
  end
  else if(x_create_dp_en) begin
    entry_dst_ereg[4:0]      <= x_create_data[IS_DST_EREG:IS_DST_EREG-4];
    entry_dst_rel_ereg[4:0]  <= x_create_data[IS_DST_REL_EREG:IS_DST_REL_EREG-4];
  end
  else begin
    entry_dst_ereg[4:0]      <= entry_dst_ereg[4:0];
    entry_dst_rel_ereg[4:0]  <= entry_dst_rel_ereg[4:0];
  end
end

always @(posedge create_other_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    entry_bar_type[3:0]      <= 4'b0;
    entry_expt[6:1]          <= 6'b0;
  end
  else if(x_create_dp_en) begin
    entry_bar_type[3:0]      <= x_create_data[IS_BAR_TYPE:IS_BAR_TYPE-3];
    entry_expt[6:1]          <= x_create_data[IS_EXPT:IS_EXPT-5];
  end
  else begin
    entry_bar_type[3:0]      <= entry_bar_type[3:0];
    entry_expt[6:1]          <= entry_expt[6:1];
  end
end

always @(posedge create_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    entry_opcode[31:0]       <= 32'b0;
    entry_expt[0]            <= 1'b0;
    entry_src0_vld           <= 1'b0;
    entry_src1_vld           <= 1'b0;
    entry_src2_vld           <= 1'b0;
    entry_dst_vld            <= 1'b0;
    entry_srcv0_vld          <= 1'b0;
    entry_srcv1_vld          <= 1'b0;
    entry_srcv2_vld          <= 1'b0;
    entry_srcvm_vld          <= 1'b0;
    entry_dstv_vld           <= 1'b0;
    entry_dste_vld           <= 1'b0;
    entry_alu                <= 1'b0;
    entry_load               <= 1'b0;
    entry_store              <= 1'b0;
    entry_staddr             <= 1'b0;
    entry_bar                <= 1'b0;
    entry_lsu_pc[14:0]       <= 15'b0;
    entry_bju                <= 1'b0;
    entry_pcall              <= 1'b0;
    entry_pcfifo             <= 1'b0;
    entry_length             <= 1'b0;
    entry_split              <= 1'b0;
    entry_intmask            <= 1'b0;
    entry_mult               <= 1'b0;
    entry_div                <= 1'b0;
    entry_lsu                <= 1'b0;
    entry_special            <= 1'b0;
    entry_rts                <= 1'b0;
    entry_bkpta_inst         <= 1'b0;
    entry_bkptb_inst         <= 1'b0;
    entry_iid_plus[3:0]      <= 4'b0;
    entry_pipe67             <= 1'b0;
    entry_pipe6              <= 1'b0;
    entry_pipe7              <= 1'b0;
    entry_vdiv               <= 1'b0;
    entry_vmla               <= 1'b0;
    entry_mtvr               <= 1'b0;
    entry_mfvr               <= 1'b0;
    entry_split_last         <= 1'b0;
    entry_str                <= 1'b0;
    entry_mla                <= 1'b0;
    entry_alu_short          <= 1'b0;
    entry_no_spec            <= 1'b0;
    entry_split_num[6:0]     <= 7'b0;
    entry_vmla_type[2:0]     <= 3'b0;
    entry_vmla_short         <= 1'b0;
    entry_vmul_unsplit       <= 1'b0;
    entry_vmul               <= 1'b0;
    entry_vlmul[1:0]         <= 2'b0;
    entry_vsew[2:0]          <= 3'b0;
    entry_vl[7:0]            <= 8'b0;
    entry_vl_pred            <= 1'b0;
    entry_vsetvli            <= 1'b0;
    entry_vsetvl             <= 1'b0;
    entry_viq_srcv12_switch  <= 1'b0;
    entry_dstv_imp           <= 1'b0;
    entry_vmb                <= 1'b0;
    entry_unit_stride        <= 1'b0;
    entry_vamo               <= 1'b0;
    entry_lch_preg           <= 1'b0;
  end
  else if(x_create_dp_en) begin
    entry_opcode[31:0]       <= x_create_data[IS_OPCODE:IS_OPCODE-31];
    entry_expt[0]            <= x_create_data[IS_EXPT-6];
    entry_src0_vld           <= x_create_data[IS_SRC0_VLD];
    entry_src1_vld           <= x_create_data[IS_SRC1_VLD];
    entry_src2_vld           <= x_create_data[IS_SRC2_VLD];
    entry_dst_vld            <= x_create_data[IS_DST_VLD];
    entry_srcv0_vld          <= x_create_data[IS_SRCV0_VLD];
    entry_srcv1_vld          <= x_create_data[IS_SRCV1_VLD];
    entry_srcv2_vld          <= x_create_data[IS_SRCV2_VLD];
    entry_srcvm_vld          <= x_create_data[IS_SRCVM_VLD];
    entry_dstv_vld           <= x_create_data[IS_DSTV_VLD];
    entry_dste_vld           <= x_create_data[IS_DSTE_VLD];
    entry_alu                <= x_create_data[IS_ALU];
    entry_load               <= x_create_data[IS_LOAD];
    entry_store              <= x_create_data[IS_STORE];
    entry_staddr             <= x_create_data[IS_STADDR];
    entry_bar                <= x_create_data[IS_BAR];
    entry_lsu_pc[14:0]       <= x_create_data[IS_LSU_PC:IS_LSU_PC-14];
    entry_bju                <= x_create_data[IS_BJU];
    entry_pcall              <= x_create_data[IS_PCALL];
    entry_pcfifo             <= x_create_data[IS_PCFIFO];
    entry_length             <= x_create_data[IS_LENGTH];
    entry_split              <= x_create_data[IS_SPLIT];
    entry_intmask            <= x_create_data[IS_INTMASK];
    entry_mult               <= x_create_data[IS_MULT];
    entry_div                <= x_create_data[IS_DIV];
    entry_lsu                <= x_create_data[IS_LSU];
    entry_special            <= x_create_data[IS_SPECIAL];
    entry_rts                <= x_create_data[IS_RTS];
    entry_bkpta_inst         <= x_create_data[IS_BKPTA_INST];
    entry_bkptb_inst         <= x_create_data[IS_BKPTB_INST];
    entry_iid_plus[3:0]      <= x_create_data[IS_IID_PLUS:IS_IID_PLUS-3];
    entry_pipe67             <= x_create_data[IS_PIPE67];
    entry_pipe6              <= x_create_data[IS_PIPE6];
    entry_pipe7              <= x_create_data[IS_PIPE7];
    entry_vdiv               <= x_create_data[IS_VDIV];
    entry_vmla               <= x_create_data[IS_VMLA];
    entry_mtvr               <= x_create_data[IS_MTVR];
    entry_mfvr               <= x_create_data[IS_MFVR];
    entry_split_last         <= x_create_data[IS_SPLIT_LAST];
    entry_str                <= x_create_data[IS_STR];
    entry_mla                <= x_create_data[IS_MLA];
    entry_alu_short          <= x_create_data[IS_ALU_SHORT];
    entry_no_spec            <= x_create_data[IS_NO_SPEC];
    entry_split_num[6:0]     <= x_create_data[IS_SPLIT_NUM:IS_SPLIT_NUM-6];
    entry_vmla_type[2:0]     <= x_create_data[IS_VMLA_TYPE:IS_VMLA_TYPE-2];
    entry_vmla_short         <= x_create_data[IS_VMLA_SHORT];
    entry_vmul_unsplit       <= x_create_data[IS_VMUL_UNSPLIT];
    entry_vmul               <= x_create_data[IS_VMUL];
    entry_vlmul[1:0]         <= x_create_data[IS_VLMUL:IS_VLMUL-1];
    entry_vsew[2:0]          <= x_create_data[IS_VSEW:IS_VSEW-2];
    entry_vl[7:0]            <= x_create_data[IS_VL:IS_VL-7];
    entry_vl_pred            <= x_create_data[IS_VL_PRED];
    entry_vsetvli            <= x_create_data[IS_VSETVLI];
    entry_vsetvl             <= x_create_data[IS_VSETVL];
    entry_viq_srcv12_switch  <= x_create_data[IS_VIQ_SRCV12_SWITCH];
    entry_dstv_imp           <= x_create_data[IS_DSTV_IMP];
    entry_vmb                <= x_create_data[IS_VMB];
    entry_unit_stride        <= x_create_data[IS_UNIT_STRIDE];
    entry_vamo               <= x_create_data[IS_VAMO];
    entry_lch_preg           <= x_create_data[IS_LCH_PREG];
  end
  else begin
    entry_opcode[31:0]       <= entry_opcode[31:0];
    entry_expt[0]            <= entry_expt[0];
    entry_src0_vld           <= entry_src0_vld;
    entry_src1_vld           <= entry_src1_vld;
    entry_src2_vld           <= entry_src2_vld;
    entry_dst_vld            <= entry_dst_vld;
    entry_srcv0_vld          <= entry_srcv0_vld;
    entry_srcv1_vld          <= entry_srcv1_vld;
    entry_srcv2_vld          <= entry_srcv2_vld;
    entry_srcvm_vld          <= entry_srcvm_vld;
    entry_dstv_vld           <= entry_dstv_vld;
    entry_dste_vld           <= entry_dste_vld;
    entry_alu                <= entry_alu;
    entry_load               <= entry_load;
    entry_store              <= entry_store;
    entry_staddr             <= entry_staddr;
    entry_bar                <= entry_bar;
    entry_lsu_pc[14:0]       <= entry_lsu_pc[14:0];
    entry_bju                <= entry_bju;
    entry_pcall              <= entry_pcall;
    entry_pcfifo             <= entry_pcfifo;
    entry_length             <= entry_length;
    entry_split              <= entry_split;
    entry_intmask            <= entry_intmask;
    entry_mult               <= entry_mult;
    entry_div                <= entry_div;
    entry_lsu                <= entry_lsu;
    entry_special            <= entry_special;
    entry_rts                <= entry_rts;
    entry_bkpta_inst         <= entry_bkpta_inst;
    entry_bkptb_inst         <= entry_bkptb_inst;
    entry_iid_plus[3:0]      <= entry_iid_plus[3:0];
    entry_pipe67             <= entry_pipe67;
    entry_pipe6              <= entry_pipe6;
    entry_pipe7              <= entry_pipe7;
    entry_vdiv               <= entry_vdiv;
    entry_vmla               <= entry_vmla;
    entry_mtvr               <= entry_mtvr;
    entry_mfvr               <= entry_mfvr;
    entry_split_last         <= entry_split_last;
    entry_str                <= entry_str;
    entry_mla                <= entry_mla;
    entry_alu_short          <= entry_alu_short;
    entry_no_spec            <= entry_no_spec;
    entry_split_num[6:0]     <= entry_split_num[6:0];
    entry_vmla_type[2:0]     <= entry_vmla_type[2:0];
    entry_vmla_short         <= entry_vmla_short;
    entry_vmul_unsplit       <= entry_vmul_unsplit;
    entry_vmul               <= entry_vmul;
    entry_vlmul[1:0]         <= entry_vlmul[1:0];
    entry_vsew[2:0]          <= entry_vsew[2:0];
    entry_vl[7:0]            <= entry_vl[7:0];
    entry_vl_pred            <= entry_vl_pred;
    entry_vsetvli            <= entry_vsetvli;
    entry_vsetvl             <= entry_vsetvl;
    entry_viq_srcv12_switch  <= entry_viq_srcv12_switch;
    entry_dstv_imp           <= entry_dstv_imp;
    entry_vmb                <= entry_vmb;
    entry_unit_stride        <= entry_unit_stride;
    entry_vamo               <= entry_vamo;
    entry_lch_preg           <= entry_lch_preg;
  end
end

//rename for read output
assign x_read_data[IS_OPCODE:IS_OPCODE-31]            = entry_opcode[31:0];
assign x_read_data[IS_SRC0_VLD]                       = entry_src0_vld;
assign x_read_data[IS_SRC1_VLD]                       = entry_src1_vld;
assign x_read_data[IS_SRC2_VLD]                       = entry_src2_vld;
assign x_read_data[IS_DST_VLD]                        = entry_dst_vld;
assign x_read_data[IS_SRCV0_VLD]                      = entry_srcv0_vld;
assign x_read_data[IS_SRCV1_VLD]                      = entry_srcv1_vld;
assign x_read_data[IS_SRCV2_VLD]                      = entry_srcv2_vld;
assign x_read_data[IS_SRCVM_VLD]                      = entry_srcvm_vld;
assign x_read_data[IS_DSTV_VLD]                       = entry_dstv_vld;
assign x_read_data[IS_DSTE_VLD]                       = entry_dste_vld;
assign x_read_data[IS_DST_REG:IS_DST_REG-4]           = entry_dst_reg[4:0];
assign x_read_data[IS_DST_PREG:IS_DST_PREG-6]         = entry_dst_preg[6:0];
assign x_read_data[IS_DST_REL_PREG:IS_DST_REL_PREG-6] = entry_dst_rel_preg[6:0];
assign x_read_data[IS_DSTV_REG:IS_DSTV_REG-4]         = entry_dstv_reg[4:0];
assign x_read_data[IS_DST_VREG:IS_DST_VREG-6]         = entry_dst_vreg[6:0];
assign x_read_data[IS_DST_REL_VREG:IS_DST_REL_VREG-6] = entry_dst_rel_vreg[6:0];
assign x_read_data[IS_DST_EREG:IS_DST_EREG-4]         = entry_dst_ereg[4:0];
assign x_read_data[IS_DST_REL_EREG:IS_DST_REL_EREG-4] = entry_dst_rel_ereg[4:0];
assign x_read_data[IS_ALU]                            = entry_alu;
assign x_read_data[IS_LOAD]                           = entry_load;
assign x_read_data[IS_STORE]                          = entry_store;
assign x_read_data[IS_STADDR]                         = entry_staddr;
assign x_read_data[IS_BAR]                            = entry_bar;
assign x_read_data[IS_BAR_TYPE:IS_BAR_TYPE-3]         = entry_bar_type[3:0];
assign x_read_data[IS_LSU_PC:IS_LSU_PC-14]            = entry_lsu_pc[14:0];
assign x_read_data[IS_BJU]                            = entry_bju;
assign x_read_data[IS_PCALL]                          = entry_pcall;
assign x_read_data[IS_PCFIFO]                         = entry_pcfifo;
assign x_read_data[IS_LENGTH]                         = entry_length;
assign x_read_data[IS_SPLIT]                          = entry_split;
assign x_read_data[IS_INTMASK]                        = entry_intmask;
assign x_read_data[IS_MULT]                           = entry_mult;
assign x_read_data[IS_DIV]                            = entry_div;
assign x_read_data[IS_LSU]                            = entry_lsu;
assign x_read_data[IS_SPECIAL]                        = entry_special;
assign x_read_data[IS_RTS]                            = entry_rts;
assign x_read_data[IS_EXPT:IS_EXPT-6]                 = entry_expt[6:0];
assign x_read_data[IS_BKPTA_INST]                     = entry_bkpta_inst;
assign x_read_data[IS_BKPTB_INST]                     = entry_bkptb_inst;
assign x_read_data[IS_IID_PLUS:IS_IID_PLUS-3]         = entry_iid_plus[3:0];
assign x_read_data[IS_PIPE67]                         = entry_pipe67;
assign x_read_data[IS_PIPE6]                          = entry_pipe6;
assign x_read_data[IS_PIPE7]                          = entry_pipe7;
assign x_read_data[IS_VDIV]                           = entry_vdiv;
assign x_read_data[IS_VMLA]                           = entry_vmla;
assign x_read_data[IS_MTVR]                           = entry_mtvr;
assign x_read_data[IS_MFVR]                           = entry_mfvr;
assign x_read_data[IS_SPLIT_LAST]                     = entry_split_last;
assign x_read_data[IS_STR]                            = entry_str;
assign x_read_data[IS_MLA]                            = entry_mla;
assign x_read_data[IS_ALU_SHORT]                      = entry_alu_short;
assign x_read_data[IS_NO_SPEC]                        = entry_no_spec;
assign x_read_data[IS_SPLIT_NUM:IS_SPLIT_NUM-6]       = entry_split_num[6:0];
assign x_read_data[IS_VMLA_TYPE:IS_VMLA_TYPE-2]       = entry_vmla_type[2:0];
assign x_read_data[IS_VMLA_SHORT]                     = entry_vmla_short;
assign x_read_data[IS_VMUL_UNSPLIT]                   = entry_vmul_unsplit;
assign x_read_data[IS_VMUL]                           = entry_vmul;
assign x_read_data[IS_VLMUL:IS_VLMUL-1]               = entry_vlmul[1:0];
assign x_read_data[IS_VSEW:IS_VSEW-2]                 = entry_vsew[2:0];
assign x_read_data[IS_VL:IS_VL-7]                     = entry_vl[7:0];
assign x_read_data[IS_VL_PRED]                        = entry_vl_pred;
assign x_read_data[IS_VSETVLI]                        = entry_vsetvli;
assign x_read_data[IS_VSETVL]                         = entry_vsetvl;
assign x_read_data[IS_VIQ_SRCV12_SWITCH]              = entry_viq_srcv12_switch;
assign x_read_data[IS_DSTV_IMP]                       = entry_dstv_imp;
assign x_read_data[IS_VMB]                            = entry_vmb;
assign x_read_data[IS_UNIT_STRIDE]                    = entry_unit_stride;
assign x_read_data[IS_VAMO]                           = entry_vamo;
assign x_read_data[IS_LCH_PREG]                       = entry_lch_preg;

//==========================================================
//              Source Dependency Information
//==========================================================
assign alu0_reg_fwd_vld  = 1'b0;
assign alu1_reg_fwd_vld  = 1'b0;
assign mla_reg_fwd_vld   = 1'b0;
assign vfpu0_vreg_fwd_vld = 1'b0;
assign vfpu1_vreg_fwd_vld = 1'b0;

assign x_create_src0_data[9]        = x_create_data[IS_SRC0_LSU_MATCH];
assign x_create_src0_data[8:0]      = x_create_data[IS_SRC0_DATA:IS_SRC0_DATA-8];
assign x_create_src1_data[9]        = x_create_data[IS_SRC1_LSU_MATCH];
assign x_create_src1_data[8:0]      = x_create_data[IS_SRC1_DATA:IS_SRC1_DATA-8];
assign x_create_src2_data[10]       = x_create_data[IS_SRC2_LSU_MATCH];
assign x_create_src2_data[9:0]      = x_create_data[IS_SRC2_DATA:IS_SRC2_DATA-9];

assign x_create_srcv0_data[9]       = x_create_data[IS_SRCV0_LSU_MATCH];
assign x_create_srcv0_data[8:0]     = x_create_data[IS_SRCV0_DATA:IS_SRCV0_DATA-8];
assign x_create_srcv1_data[9]       = x_create_data[IS_SRCV1_LSU_MATCH];
assign x_create_srcv1_data[8:0]     = x_create_data[IS_SRCV1_DATA:IS_SRCV1_DATA-8];
assign x_create_srcv2_data[10]      = x_create_data[IS_SRCV2_LSU_MATCH];
assign x_create_srcv2_data[9:0]     = x_create_data[IS_SRCV2_DATA:IS_SRCV2_DATA-9];
assign x_create_srcvm_data[9]       = x_create_data[IS_SRCVM_LSU_MATCH];
assign x_create_srcvm_data[8:0]     = x_create_data[IS_SRCVM_DATA:IS_SRCVM_DATA-8];

assign x_read_data[IS_SRC2_LSU_MATCH]                  = x_read_src2_data[12];
assign x_read_data[IS_SRC2_BP_RDY:IS_SRC2_BP_RDY-11]   = x_read_src2_data[11:0];
assign x_read_data[IS_SRC1_LSU_MATCH]                  = x_read_src1_data[11];
assign x_read_data[IS_SRC1_BP_RDY:IS_SRC1_BP_RDY-10]   = x_read_src1_data[10:0];
assign x_read_data[IS_SRC0_LSU_MATCH]                  = x_read_src0_data[11];
assign x_read_data[IS_SRC0_BP_RDY:IS_SRC0_BP_RDY-10]   = x_read_src0_data[10:0];

assign x_read_data[IS_SRCVM_LSU_MATCH]                 = x_read_srcvm_data[11];
assign x_read_data[IS_SRCVM_BP_RDY:IS_SRCVM_BP_RDY-10] = x_read_srcvm_data[10:0];
assign x_read_data[IS_SRCV2_LSU_MATCH]                 = x_read_srcv2_data[12];
assign x_read_data[IS_SRCV2_BP_RDY:IS_SRCV2_BP_RDY-11] = x_read_srcv2_data[11:0];
assign x_read_data[IS_SRCV1_LSU_MATCH]                 = x_read_srcv1_data[11];
assign x_read_data[IS_SRCV1_BP_RDY:IS_SRCV1_BP_RDY-10] = x_read_srcv1_data[10:0];
assign x_read_data[IS_SRCV0_LSU_MATCH]                 = x_read_srcv0_data[11];
assign x_read_data[IS_SRCV0_BP_RDY:IS_SRCV0_BP_RDY-10] = x_read_srcv0_data[10:0];

//------------------------source 0--------------------------
assign create_src0_gateclk_en = x_create_gateclk_en && x_create_data[IS_SRC0_VLD];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_pipe0_src0_entry"); @577
ct_idu_dep_reg_entry  x_ct_idu_is_pipe0_src0_entry (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (x_create_src0_data[9:0]                ),
  .x_gateclk_idx_write_en                  (create_src0_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (1'b0                                   ),
  .x_read_data                             (x_read_src0_data[11:0]                 ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @578
//          .x_write_en               (x_create_dp_en), @579
//          .x_gateclk_write_en       (x_create_gateclk_en), @580
//          .x_gateclk_idx_write_en   (create_src0_gateclk_en), @581
//          .x_create_data            (x_create_src0_data[9:0]), @582
//          .x_read_data              (x_read_src0_data[11:0]), @583
//          .x_rdy_clr                (1'b0) @584
//         ); @585

//------------------------source 1--------------------------
assign create_src1_gateclk_en = x_create_gateclk_en && x_create_data[IS_SRC1_VLD];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_pipe0_src1_entry"); @589
ct_idu_dep_reg_entry  x_ct_idu_is_pipe0_src1_entry (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (x_create_src1_data[9:0]                ),
  .x_gateclk_idx_write_en                  (create_src1_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (1'b0                                   ),
  .x_read_data                             (x_read_src1_data[11:0]                 ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @590
//          .x_write_en               (x_create_dp_en), @591
//          .x_gateclk_write_en       (x_create_gateclk_en), @592
//          .x_gateclk_idx_write_en   (create_src1_gateclk_en), @593
//          .x_create_data            (x_create_src1_data[9:0]), @594
//          .x_read_data              (x_read_src1_data[11:0]), @595
//          .x_rdy_clr                (1'b0) @596
//         ); @597

//------------------------source 2--------------------------
assign create_src2_gateclk_en = x_create_gateclk_en && x_create_data[IS_SRC2_VLD];
// &Instance("ct_idu_dep_reg_src2_entry", "x_ct_idu_is_pipe0_src2_entry"); @601
ct_idu_dep_reg_src2_entry  x_ct_idu_is_pipe0_src2_entry (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (x_create_src2_data[10:0]               ),
  .x_entry_mla                             (entry_mla                              ),
  .x_gateclk_idx_write_en                  (create_src2_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (1'b0                                   ),
  .x_read_data                             (x_read_src2_data[12:0]                 ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @602
//          .x_write_en               (x_create_dp_en), @603
//          .x_gateclk_write_en       (x_create_gateclk_en), @604
//          .x_gateclk_idx_write_en   (create_src2_gateclk_en), @605
//          .x_create_data            (x_create_src2_data[10:0]), @606
//          .x_read_data              (x_read_src2_data[12:0]), @607
//          .x_entry_mla              (entry_mla), @608
//          .x_rdy_clr                (1'b0) @609
//         ); @610

//-----------------------source v 0-------------------------
assign create_srcv0_gateclk_en = x_create_gateclk_en && x_create_data[IS_SRCV0_VLD];
// &Instance("ct_idu_dep_vreg_entry", "x_ct_idu_is_pipe0_srcv0_entry"); @614
ct_idu_dep_vreg_entry  x_ct_idu_is_pipe0_srcv0_entry (
  .cp0_idu_icg_en                       (cp0_idu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .gateclk_entry_vld                    (gateclk_entry_vld                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld      (lsu_idu_ag_pipe3_vload_inst_vld     ),
  .lsu_idu_ag_pipe3_vreg_dupx           (lsu_idu_ag_pipe3_vreg_dupx          ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld  (lsu_idu_dc_pipe3_vload_fwd_inst_vld ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx (lsu_idu_dc_pipe3_vload_inst_vld_dupx),
  .lsu_idu_dc_pipe3_vreg_dupx           (lsu_idu_dc_pipe3_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx        (lsu_idu_wb_pipe3_wb_vreg_dupx       ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx    (lsu_idu_wb_pipe3_wb_vreg_vld_dupx   ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx     (vfpu_idu_ex1_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex1_pipe6_vreg_dupx         (vfpu_idu_ex1_pipe6_vreg_dupx        ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx     (vfpu_idu_ex1_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex1_pipe7_vreg_dupx         (vfpu_idu_ex1_pipe7_vreg_dupx        ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx     (vfpu_idu_ex2_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex2_pipe6_vreg_dupx         (vfpu_idu_ex2_pipe6_vreg_dupx        ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx     (vfpu_idu_ex2_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex2_pipe7_vreg_dupx         (vfpu_idu_ex2_pipe7_vreg_dupx        ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx     (vfpu_idu_ex3_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex3_pipe6_vreg_dupx         (vfpu_idu_ex3_pipe6_vreg_dupx        ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx     (vfpu_idu_ex3_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex3_pipe7_vreg_dupx         (vfpu_idu_ex3_pipe7_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx      (vfpu_idu_ex5_pipe6_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx      (vfpu_idu_ex5_pipe7_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx ),
  .x_create_data                        (x_create_srcv0_data[9:0]            ),
  .x_gateclk_idx_write_en               (create_srcv0_gateclk_en             ),
  .x_gateclk_write_en                   (x_create_gateclk_en                 ),
  .x_rdy_clr                            (1'b0                                ),
  .x_read_data                          (x_read_srcv0_data[11:0]             ),
  .x_write_en                           (x_create_dp_en                      )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @615
//          .x_write_en               (x_create_dp_en), @616
//          .x_gateclk_write_en       (x_create_gateclk_en), @617
//          .x_gateclk_idx_write_en   (create_srcv0_gateclk_en), @618
//          .x_create_data            (x_create_srcv0_data[9:0]), @619
//          .x_read_data              (x_read_srcv0_data[11:0]), @620
//          .x_rdy_clr                (1'b0) @621
//         ); @622

//-----------------------source v 1-------------------------
assign create_srcv1_gateclk_en = x_create_gateclk_en && x_create_data[IS_SRCV1_VLD];
// &Instance("ct_idu_dep_vreg_entry", "x_ct_idu_is_pipe0_srcv1_entry"); @626
ct_idu_dep_vreg_entry  x_ct_idu_is_pipe0_srcv1_entry (
  .cp0_idu_icg_en                       (cp0_idu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .gateclk_entry_vld                    (gateclk_entry_vld                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld      (lsu_idu_ag_pipe3_vload_inst_vld     ),
  .lsu_idu_ag_pipe3_vreg_dupx           (lsu_idu_ag_pipe3_vreg_dupx          ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld  (lsu_idu_dc_pipe3_vload_fwd_inst_vld ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx (lsu_idu_dc_pipe3_vload_inst_vld_dupx),
  .lsu_idu_dc_pipe3_vreg_dupx           (lsu_idu_dc_pipe3_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx        (lsu_idu_wb_pipe3_wb_vreg_dupx       ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx    (lsu_idu_wb_pipe3_wb_vreg_vld_dupx   ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx     (vfpu_idu_ex1_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex1_pipe6_vreg_dupx         (vfpu_idu_ex1_pipe6_vreg_dupx        ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx     (vfpu_idu_ex1_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex1_pipe7_vreg_dupx         (vfpu_idu_ex1_pipe7_vreg_dupx        ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx     (vfpu_idu_ex2_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex2_pipe6_vreg_dupx         (vfpu_idu_ex2_pipe6_vreg_dupx        ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx     (vfpu_idu_ex2_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex2_pipe7_vreg_dupx         (vfpu_idu_ex2_pipe7_vreg_dupx        ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx     (vfpu_idu_ex3_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex3_pipe6_vreg_dupx         (vfpu_idu_ex3_pipe6_vreg_dupx        ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx     (vfpu_idu_ex3_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex3_pipe7_vreg_dupx         (vfpu_idu_ex3_pipe7_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx      (vfpu_idu_ex5_pipe6_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx      (vfpu_idu_ex5_pipe7_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx ),
  .x_create_data                        (x_create_srcv1_data[9:0]            ),
  .x_gateclk_idx_write_en               (create_srcv1_gateclk_en             ),
  .x_gateclk_write_en                   (x_create_gateclk_en                 ),
  .x_rdy_clr                            (1'b0                                ),
  .x_read_data                          (x_read_srcv1_data[11:0]             ),
  .x_write_en                           (x_create_dp_en                      )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @627
//          .x_write_en               (x_create_dp_en), @628
//          .x_gateclk_write_en       (x_create_gateclk_en), @629
//          .x_gateclk_idx_write_en   (create_srcv1_gateclk_en), @630
//          .x_create_data            (x_create_srcv1_data[9:0]), @631
//          .x_read_data              (x_read_srcv1_data[11:0]), @632
//          .x_rdy_clr                (1'b0) @633
//         ); @634

//-----------------------source v 2-------------------------
assign create_srcv2_gateclk_en = x_create_gateclk_en && x_create_data[IS_SRCV2_VLD];
// &Instance("ct_idu_dep_vreg_srcv2_entry", "x_ct_idu_is_pipe0_srcv2_entry"); @638
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_is_pipe0_srcv2_entry (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (x_create_srcv2_data[10:0]            ),
  .x_entry_vmla                          (entry_vmla                           ),
  .x_gateclk_idx_write_en                (create_srcv2_gateclk_en              ),
  .x_gateclk_write_en                    (x_create_gateclk_en                  ),
  .x_rdy_clr                             (1'b0                                 ),
  .x_read_data                           (x_read_srcv2_data[12:0]              ),
  .x_write_en                            (x_create_dp_en                       )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @639
//          .x_write_en               (x_create_dp_en), @640
//          .x_gateclk_write_en       (x_create_gateclk_en), @641
//          .x_gateclk_idx_write_en   (create_srcv2_gateclk_en), @642
//          .x_create_data            (x_create_srcv2_data[10:0]), @643
//          .x_read_data              (x_read_srcv2_data[12:0]), @644
//          .x_entry_vmla             (entry_vmla), @645
//          .x_rdy_clr                (1'b0) @646
//         ); @647

//-----------------------source v m-------------------------
assign create_srcvm_gateclk_en = x_create_gateclk_en && x_create_data[IS_SRCVM_VLD];
// &Instance("ct_idu_dep_vreg_entry", "x_ct_idu_is_pipe0_srcvm_entry"); @651
ct_idu_dep_vreg_entry  x_ct_idu_is_pipe0_srcvm_entry (
  .cp0_idu_icg_en                       (cp0_idu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .gateclk_entry_vld                    (gateclk_entry_vld                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld      (lsu_idu_ag_pipe3_vload_inst_vld     ),
  .lsu_idu_ag_pipe3_vreg_dupx           (lsu_idu_ag_pipe3_vreg_dupx          ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld  (lsu_idu_dc_pipe3_vload_fwd_inst_vld ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx (lsu_idu_dc_pipe3_vload_inst_vld_dupx),
  .lsu_idu_dc_pipe3_vreg_dupx           (lsu_idu_dc_pipe3_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx        (lsu_idu_wb_pipe3_wb_vreg_dupx       ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx    (lsu_idu_wb_pipe3_wb_vreg_vld_dupx   ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx     (vfpu_idu_ex1_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex1_pipe6_vreg_dupx         (vfpu_idu_ex1_pipe6_vreg_dupx        ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx     (vfpu_idu_ex1_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex1_pipe7_vreg_dupx         (vfpu_idu_ex1_pipe7_vreg_dupx        ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx     (vfpu_idu_ex2_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex2_pipe6_vreg_dupx         (vfpu_idu_ex2_pipe6_vreg_dupx        ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx     (vfpu_idu_ex2_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex2_pipe7_vreg_dupx         (vfpu_idu_ex2_pipe7_vreg_dupx        ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx     (vfpu_idu_ex3_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex3_pipe6_vreg_dupx         (vfpu_idu_ex3_pipe6_vreg_dupx        ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx     (vfpu_idu_ex3_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex3_pipe7_vreg_dupx         (vfpu_idu_ex3_pipe7_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx      (vfpu_idu_ex5_pipe6_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx      (vfpu_idu_ex5_pipe7_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx ),
  .x_create_data                        (x_create_srcvm_data[9:0]            ),
  .x_gateclk_idx_write_en               (create_srcvm_gateclk_en             ),
  .x_gateclk_write_en                   (x_create_gateclk_en                 ),
  .x_rdy_clr                            (1'b0                                ),
  .x_read_data                          (x_read_srcvm_data[11:0]             ),
  .x_write_en                           (x_create_dp_en                      )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @652
//          .x_write_en               (x_create_dp_en), @653
//          .x_gateclk_write_en       (x_create_gateclk_en), @654
//          .x_gateclk_idx_write_en   (create_srcvm_gateclk_en), @655
//          .x_create_data            (x_create_srcvm_data[9:0]), @656
//          .x_read_data              (x_read_srcvm_data[11:0]), @657
//          .x_rdy_clr                (1'b0) @658
//         ); @659


// &ModuleEnd; @662
endmodule


