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
module ct_vfdsu_prepare(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ex1_div,
  ex1_divisor,
  ex1_double,
  ex1_pipedown,
  ex1_remainder,
  ex1_scalar,
  ex1_single,
  ex1_sqrt,
  ex1_src0,
  ex1_src1,
  ex1_static_rm,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  vfdsu_ex2_div,
  vfdsu_ex2_double,
  vfdsu_ex2_dz,
  vfdsu_ex2_expnt_add0,
  vfdsu_ex2_expnt_add1,
  vfdsu_ex2_nv,
  vfdsu_ex2_of_rm_lfn,
  vfdsu_ex2_op0_norm,
  vfdsu_ex2_op1_norm,
  vfdsu_ex2_qnan_f,
  vfdsu_ex2_qnan_sign,
  vfdsu_ex2_result_inf,
  vfdsu_ex2_result_qnan,
  vfdsu_ex2_result_sign,
  vfdsu_ex2_result_zero,
  vfdsu_ex2_rm,
  vfdsu_ex2_single,
  vfdsu_ex2_sqrt,
  vfdsu_ex2_srt_skip,
  vfpu_yy_xx_dqnan,
  vfpu_yy_xx_rm
);

// &Ports; @23
input           cp0_vfpu_icg_en;          
input           cp0_yy_clk_en;            
input           cpurst_b;                 
input           ex1_div;                  
input           ex1_double;               
input           ex1_pipedown;             
input           ex1_scalar;               
input           ex1_single;               
input           ex1_sqrt;                 
input   [63:0]  ex1_src0;                 
input   [63:0]  ex1_src1;                 
input   [2 :0]  ex1_static_rm;            
input           forever_cpuclk;           
input           pad_yy_icg_scan_en;       
input           vfpu_yy_xx_dqnan;         
input   [2 :0]  vfpu_yy_xx_rm;            
output  [52:0]  ex1_divisor;              
output  [59:0]  ex1_remainder;            
output          vfdsu_ex2_div;            
output          vfdsu_ex2_double;         
output          vfdsu_ex2_dz;             
output  [12:0]  vfdsu_ex2_expnt_add0;     
output  [12:0]  vfdsu_ex2_expnt_add1;     
output          vfdsu_ex2_nv;             
output          vfdsu_ex2_of_rm_lfn;      
output          vfdsu_ex2_op0_norm;       
output          vfdsu_ex2_op1_norm;       
output  [51:0]  vfdsu_ex2_qnan_f;         
output          vfdsu_ex2_qnan_sign;      
output          vfdsu_ex2_result_inf;     
output          vfdsu_ex2_result_qnan;    
output          vfdsu_ex2_result_sign;    
output          vfdsu_ex2_result_zero;    
output  [2 :0]  vfdsu_ex2_rm;             
output          vfdsu_ex2_single;         
output          vfdsu_ex2_sqrt;           
output          vfdsu_ex2_srt_skip;       

// &Regs; @24
reg     [12:0]  ex1_expnt_adder_op1;      
reg             ex1_of_result_lfn;        
reg     [51:0]  ex1_qnan_f;               
reg             ex1_qnan_sign;            
reg             vfdsu_ex2_div;            
reg             vfdsu_ex2_double;         
reg             vfdsu_ex2_dz;             
reg     [12:0]  vfdsu_ex2_expnt_add0;     
reg     [12:0]  vfdsu_ex2_expnt_add1;     
reg             vfdsu_ex2_nv;             
reg             vfdsu_ex2_of_rm_lfn;      
reg             vfdsu_ex2_op0_norm;       
reg             vfdsu_ex2_op1_norm;       
reg     [51:0]  vfdsu_ex2_qnan_f;         
reg             vfdsu_ex2_qnan_sign;      
reg             vfdsu_ex2_result_inf;     
reg             vfdsu_ex2_result_qnan;    
reg             vfdsu_ex2_result_sign;    
reg             vfdsu_ex2_result_zero;    
reg     [2 :0]  vfdsu_ex2_rm;             
reg             vfdsu_ex2_single;         
reg             vfdsu_ex2_sqrt;           
reg             vfdsu_ex2_srt_skip;       

// &Wires; @25
wire            cp0_vfpu_icg_en;          
wire            cp0_yy_clk_en;            
wire            cpurst_b;                 
wire            div_sign;                 
wire            ex1_div;                  
wire            ex1_div_dz;               
wire    [52:0]  ex1_div_noid_nor_srt_op0; 
wire    [52:0]  ex1_div_noid_nor_srt_op1; 
wire    [52:0]  ex1_div_nor_srt_op0;      
wire    [52:0]  ex1_div_nor_srt_op1;      
wire            ex1_div_nv;               
wire    [12:0]  ex1_div_op0_expnt;        
wire    [12:0]  ex1_div_op1_expnt;        
wire            ex1_div_rst_inf;          
wire            ex1_div_rst_qnan;         
wire            ex1_div_rst_zero;         
wire    [52:0]  ex1_div_srt_op0;          
wire    [52:0]  ex1_div_srt_op1;          
wire    [52:0]  ex1_divisor;              
wire            ex1_doub_expnt0_max;      
wire            ex1_doub_expnt0_zero;     
wire            ex1_doub_expnt1_max;      
wire            ex1_doub_expnt1_zero;     
wire            ex1_doub_frac0_all0;      
wire            ex1_doub_frac1_all0;      
wire            ex1_double;               
wire            ex1_dz;                   
wire            ex1_expnt0_max;           
wire            ex1_expnt0_zero;          
wire            ex1_expnt1_max;           
wire            ex1_expnt1_zero;          
wire    [12:0]  ex1_expnt_adder_op0;      
wire            ex1_frac0_all0;           
wire            ex1_frac0_msb;            
wire            ex1_frac1_all0;           
wire            ex1_frac1_msb;            
wire            ex1_half_expnt0_max;      
wire            ex1_half_expnt0_zero;     
wire            ex1_half_expnt1_max;      
wire            ex1_half_expnt1_zero;     
wire            ex1_half_frac0_all0;      
wire            ex1_half_frac1_all0;      
wire            ex1_nv;                   
wire            ex1_op0_cnan;             
wire    [51:0]  ex1_op0_f;                
wire            ex1_op0_id;               
wire            ex1_op0_id_nor;           
wire            ex1_op0_inf;              
wire            ex1_op0_is_qnan;          
wire            ex1_op0_is_snan;          
wire            ex1_op0_norm;             
wire            ex1_op0_qnan;             
wire            ex1_op0_sign;             
wire            ex1_op0_snan;             
wire            ex1_op0_tt_zero;          
wire            ex1_op0_zero;             
wire            ex1_op1_cnan;             
wire    [51:0]  ex1_op1_f;                
wire            ex1_op1_id;               
wire            ex1_op1_id_nor;           
wire            ex1_op1_inf;              
wire            ex1_op1_is_qnan;          
wire            ex1_op1_is_snan;          
wire            ex1_op1_norm;             
wire            ex1_op1_qnan;             
wire            ex1_op1_sign;             
wire            ex1_op1_snan;             
wire            ex1_op1_tt_zero;          
wire            ex1_op1_zero;             
wire    [63:0]  ex1_oper0;                
wire    [51:0]  ex1_oper0_frac;           
wire            ex1_oper0_high_all1;      
wire    [12:0]  ex1_oper0_id_expnt;       
wire    [51:0]  ex1_oper0_id_frac;        
wire    [63:0]  ex1_oper1;                
wire    [51:0]  ex1_oper1_frac;           
wire            ex1_oper1_high_all1;      
wire    [12:0]  ex1_oper1_id_expnt;       
wire    [51:0]  ex1_oper1_id_frac;        
wire            ex1_pipe_clk;             
wire            ex1_pipe_clk_en;          
wire            ex1_pipedown;             
wire    [59:0]  ex1_remainder;            
wire            ex1_result_inf;           
wire            ex1_result_qnan;          
wire            ex1_result_sign;          
wire            ex1_result_zero;          
wire    [2 :0]  ex1_rm;                   
wire            ex1_rst_default_qnan;     
wire            ex1_scalar;               
wire            ex1_sing_expnt0_max;      
wire            ex1_sing_expnt0_zero;     
wire            ex1_sing_expnt1_max;      
wire            ex1_sing_expnt1_zero;     
wire            ex1_sing_frac0_all0;      
wire            ex1_sing_frac1_all0;      
wire            ex1_single;               
wire            ex1_sqrt;                 
wire            ex1_sqrt_expnt_odd;       
wire            ex1_sqrt_expnt_result_odd; 
wire            ex1_sqrt_nv;              
wire    [12:0]  ex1_sqrt_op1_expnt;       
wire            ex1_sqrt_rst_inf;         
wire            ex1_sqrt_rst_qnan;        
wire            ex1_sqrt_rst_zero;        
wire    [52:0]  ex1_sqrt_srt_op0;         
wire    [63:0]  ex1_src0;                 
wire    [63:0]  ex1_src1;                 
wire            ex1_srt_skip;             
wire    [2 :0]  ex1_static_rm;            
wire            forever_cpuclk;           
wire            pad_yy_icg_scan_en;       
wire    [59:0]  sqrt_remainder;           
wire            sqrt_sign;                
wire            vfpu_yy_xx_dqnan;         
wire    [2 :0]  vfpu_yy_xx_rm;            


//======================Operator prepare====================
//VECTOR_SIMD

assign ex1_oper0[63:0]             = ex1_src0[63:0];
assign ex1_oper1[63:0]             = ex1_src1[63:0];


//Sign bit prepare
assign ex1_op0_sign                =  ex1_double ? ex1_oper0[63] :
                                      ex1_single ? ex1_oper0[31] : ex1_oper0[15]; 
assign ex1_op1_sign                =  ex1_double ? ex1_oper1[63] :
                                      ex1_single ? ex1_oper1[31] : ex1_oper1[15]; 
assign div_sign                    = ex1_op0_sign ^ ex1_op1_sign;
assign sqrt_sign                   = ex1_op0_sign;
assign ex1_result_sign             = (ex1_div)
                                   ? div_sign 
                                   : sqrt_sign;
//exponent max
assign ex1_doub_expnt0_max         = &ex1_oper0[62:52];
assign ex1_sing_expnt0_max         = &ex1_oper0[30:23];
assign ex1_doub_expnt1_max         = &ex1_oper1[62:52];
assign ex1_sing_expnt1_max         = &ex1_oper1[30:23];
assign ex1_half_expnt0_max         = &ex1_oper0[14:10];
assign ex1_half_expnt1_max         = &ex1_oper1[14:10];
assign ex1_expnt0_max              = ex1_double ? ex1_doub_expnt0_max :
                                     ex1_single ? ex1_sing_expnt0_max : ex1_half_expnt0_max;
assign ex1_expnt1_max              = ex1_double ? ex1_doub_expnt1_max :
                                     ex1_single ? ex1_sing_expnt1_max : ex1_half_expnt1_max;
             
//exponent zero
assign ex1_doub_expnt0_zero        = ~|ex1_oper0[62:52];
assign ex1_sing_expnt0_zero        = ~|ex1_oper0[30:23];
assign ex1_doub_expnt1_zero        = ~|ex1_oper1[62:52];
assign ex1_sing_expnt1_zero        = ~|ex1_oper1[30:23];
assign ex1_half_expnt0_zero        = ~|ex1_oper0[14:10];
assign ex1_half_expnt1_zero        = ~|ex1_oper1[14:10];
assign ex1_expnt0_zero             = ex1_double ? ex1_doub_expnt0_zero :
                                     ex1_single ? ex1_sing_expnt0_zero : ex1_half_expnt0_zero;
assign ex1_expnt1_zero             = ex1_double ? ex1_doub_expnt1_zero :
                                     ex1_single ? ex1_sing_expnt1_zero : ex1_half_expnt1_zero; 
//fraction zero
assign ex1_doub_frac0_all0         = ~|ex1_oper0[51:0];
assign ex1_sing_frac0_all0         = ~|ex1_oper0[22:0];
assign ex1_doub_frac1_all0         = ~|ex1_oper1[51:0];
assign ex1_sing_frac1_all0         = ~|ex1_oper1[22:0];
assign ex1_half_frac0_all0         = ~|ex1_oper0[9:0];
assign ex1_half_frac1_all0         = ~|ex1_oper1[9:0];
assign ex1_frac0_all0              = ex1_double ? ex1_doub_frac0_all0 :
                                     ex1_single ? ex1_sing_frac0_all0 : ex1_half_frac0_all0;   
assign ex1_frac1_all0              = ex1_double ? ex1_doub_frac1_all0 :
                                     ex1_single ? ex1_sing_frac1_all0 : ex1_half_frac1_all0;   
assign ex1_frac0_msb               = ex1_double ? ex1_oper0[51] :
                                     ex1_single ? ex1_oper0[22] : ex1_oper0[9];
assign ex1_frac1_msb               = ex1_double ? ex1_oper1[51] :
                                     ex1_single ? ex1_oper1[22] : ex1_oper1[9]; 
assign ex1_oper0_high_all1         = ex1_single ? &ex1_oper0[63:32] : &ex1_oper0[63:16]; 
assign ex1_oper1_high_all1         = ex1_single ? &ex1_oper1[63:32] : &ex1_oper1[63:16];
 

//infinity number
assign  ex1_op0_inf                = ex1_expnt0_max && 
                                     ex1_frac0_all0 &&
                                    ~ex1_op0_cnan;
assign  ex1_op1_inf                = ex1_expnt1_max && 
                                     ex1_frac1_all0 &&
                                    ~ex1_op1_cnan;
//zero
assign ex1_op0_zero                = ex1_expnt0_zero && 
                                     ex1_frac0_all0  &&
                                    ~ex1_op0_cnan;
assign ex1_op1_zero                = ex1_expnt1_zero && 
                                     ex1_frac1_all0  &&
                                    ~ex1_op1_cnan;
//denormalize number
assign ex1_op0_id                  =  ex1_expnt0_zero && 
                                     ~ex1_frac0_all0  &&
                                     ~ex1_op0_cnan;
assign ex1_op1_id                  =  ex1_expnt1_zero && 
                                     ~ex1_frac1_all0  &&
                                     ~ex1_op1_cnan;
//assign ex1_op0_id_fm1              =  vfpu_yy_xx_fm[1]  &&
//                                      vfpu_yy_xx_fm[0]  && 
//                                      ex1_op0_id;
//assign ex1_op1_id_fm1              =  vfpu_yy_xx_fm[1]  &&
//                                      vfpu_yy_xx_fm[0]  && 
//                                      ex1_op1_id;
//assign ex1_op0_id_fm0              =  vfpu_yy_xx_fm[1]   &&
//                                      !vfpu_yy_xx_fm[0]  && 
//                                      ex1_op0_id;
//assign ex1_op1_id_fm0              =  vfpu_yy_xx_fm[1]   &&
//                                      !vfpu_yy_xx_fm[0]  && 
//                                      ex1_op1_id;
assign ex1_op0_id_nor              = ex1_op0_id;
assign ex1_op1_id_nor              = ex1_op1_id;

//cNaN
assign ex1_op0_cnan                =  ex1_scalar  &&
                                      !ex1_double &&
                                      !ex1_oper0_high_all1;
                                      
assign ex1_op1_cnan                =  ex1_scalar  && 
                                      !ex1_double &&
                                      !ex1_oper1_high_all1;

//sNaN
assign ex1_op0_snan                =  ex1_expnt0_max &&
                                     ~ex1_frac0_all0 &&
                                     ~ex1_frac0_msb  &&
                                     ~ex1_op0_cnan;
assign ex1_op1_snan                =  ex1_expnt1_max &&
                                     ~ex1_frac1_all0 &&
                                     ~ex1_frac1_msb  &&
                                     ~ex1_op1_cnan;

//qNaN
assign ex1_op0_qnan                = (ex1_expnt0_max && 
                                      ex1_frac0_msb) ||
                                      ex1_op0_cnan;
assign ex1_op1_qnan                = (ex1_expnt1_max && 
                                      ex1_frac1_msb) ||
                                      ex1_op1_cnan;
//=====================find first one=======================
// this is for the denormal number
// &Instance("ct_vfdsu_ff1","x_frac0_expnt"); @150
ct_vfdsu_ff1  x_frac0_expnt (
  .fanc_shift_num           (ex1_oper0_id_frac[51:0] ),
  .frac_bin_val             (ex1_oper0_id_expnt[12:0]),
  .frac_num                 (ex1_oper0_frac[51:0]    )
);

// &Connect(.frac_num(ex1_oper0_frac[51:0])); @151
// &Connect(.frac_bin_val(ex1_oper0_id_expnt[12:0])); @152
// &Connect(.fanc_shift_num(ex1_oper0_id_frac[51:0])); @153

// &Instance("ct_vfdsu_ff1","x_frac1_expnt"); @155
ct_vfdsu_ff1  x_frac1_expnt (
  .fanc_shift_num           (ex1_oper1_id_frac[51:0] ),
  .frac_bin_val             (ex1_oper1_id_expnt[12:0]),
  .frac_num                 (ex1_oper1_frac[51:0]    )
);

// &Connect(.frac_num(ex1_oper1_frac[51:0])); @156
// &Connect(.frac_bin_val(ex1_oper1_id_expnt[12:0])); @157
// &Connect(.fanc_shift_num(ex1_oper1_id_frac[51:0])); @158
assign ex1_oper0_frac[51:0] = ex1_double ? ex1_oper0[51:0] :
                                           ex1_single ? {ex1_oper0[22:0],29'b0}
                                                      : {ex1_oper0[9:0],42'b0};
assign ex1_oper1_frac[51:0] = ex1_double ? ex1_oper1[51:0] :
                                           ex1_single ? {ex1_oper1[22:0],29'b0}
                                                      : {ex1_oper1[9:0],42'b0};
//=====================exponent add=========================
//exponent number 0
assign ex1_div_op0_expnt[12:0]     = ex1_double ? {2'b0,ex1_oper0[62:52]} : 
                                                  ex1_single ? {5'b0,ex1_oper0[30:23]}
                                                             : {8'b0,ex1_oper0[14:10]};
assign ex1_expnt_adder_op0[12:0]   = ex1_op0_id_nor ? ex1_oper0_id_expnt[12:0]
                                                    : ex1_div_op0_expnt[12:0];
//exponent number 1
assign ex1_div_op1_expnt[12:0]  = ex1_double ? {2'b0,ex1_oper1[62:52]} :
                                               ex1_single ? {5'b0,ex1_oper1[30:23]}
                                                          : {8'b0,ex1_oper1[14:10]};
assign ex1_sqrt_op1_expnt[12:0] = ex1_double ? {3'b0,{10{1'b1}}} : //'d1023
                                               ex1_single ? {6'b0,{7{1'b1}}} //'d127
                                                          : {9'b0,{4{1'b1}}}; //'d15
  
// &CombBeg;  @180
always @( ex1_oper1_id_expnt[12:0]
       or ex1_div
       or ex1_op1_id_nor
       or ex1_sqrt_op1_expnt[12:0]
       or ex1_sqrt
       or ex1_div_op1_expnt[12:0])
begin
case({ex1_div,ex1_sqrt})
  2'b10:   ex1_expnt_adder_op1[12:0] = ex1_op1_id_nor ? ex1_oper1_id_expnt[12:0]
                                                  : ex1_div_op1_expnt[12:0];
  2'b01:   ex1_expnt_adder_op1[12:0] = ex1_sqrt_op1_expnt[12:0];
  default: ex1_expnt_adder_op1[12:0] = 13'b0;
endcase
// &CombEnd; @187
end
//expnt0 sub expnt1
assign ex1_sqrt_expnt_result_odd =  ex1_expnt_adder_op0[0] ^ ex1_expnt_adder_op1[0];


//======================EX1 expt detect=====================
//ex1_id_detect
//any opration is zero
// no input denormalize exception anymore
//
//ex1_nv_detect
//div_nv
//  1.any operation is sNaN
//  2.0/0(include DN flush to zero)
//  3.inf/inf
//sqrt_nv
//  1.any operation is sNaN
//  2.operation sign is 1 && operation is not zero/qNaN
assign ex1_nv      = ex1_div  && ex1_div_nv  || 
                     ex1_sqrt && ex1_sqrt_nv;
//ex1_div_nv
assign ex1_div_nv  = ex1_op0_snan || 
                     ex1_op1_snan || 
                    (ex1_op0_tt_zero && ex1_op1_tt_zero)|| 
                    (ex1_op0_inf && ex1_op1_inf);
assign ex1_op0_tt_zero = ex1_op0_zero;
assign ex1_op1_tt_zero = ex1_op1_zero;
//ex1_sqrt_nv
assign ex1_sqrt_nv = ex1_op0_snan || 
                     ex1_op0_sign && 
                    (ex1_op0_norm || 
                     ex1_op0_inf );
assign ex1_op0_norm = !ex1_expnt0_zero && !ex1_expnt0_max && !ex1_op0_cnan || ex1_op0_id_nor ;
assign ex1_op1_norm = !ex1_expnt1_zero && !ex1_expnt1_max && !ex1_op1_cnan || ex1_op1_id_nor; 

//ex1_of_detect
//div_of
//  1.only detect id overflow case
//assign ex1_of      = ex1_div && ex1_div_of;
//assign ex1_div_of  = ex1_op1_id_fm1 && 
//                     ex1_op0_norm && 
//                     ex1_div_id_of;
//
////ex1_uf_detect
////div_uf
////  1.only detect id underflow case
//assign ex1_uf      = ex1_div && ex1_div_uf;
//assign ex1_div_uf  = ex1_op0_id && 
//                     ex1_op1_norm && 
//                     ex1_div_id_uf;
//ex1_dz_detect
//div_dz
//  1.op0 is normal && op1 zero
assign ex1_dz      = ex1_div && ex1_div_dz;
assign ex1_div_dz  = ex1_op1_tt_zero && ex1_op0_norm;

//===================sqrt exponent prepare==================
//sqrt exponent prepare
//afert E sub, div E by 2
//assign ex1_sqrt_expnt_result[12:0] = {ex1_expnt_result[12],
//                                      ex1_expnt_result[12:1]};
//ex1_sqrt_expnt_odd
//fraction will shift left by 1
assign ex1_sqrt_expnt_odd          = ex1_sqrt_expnt_result_odd;

//===================special cal result=====================
//ex1 result is zero
//div_zero
//  1.op0 is zero && op1 is normal
//  2.op0 is zero/normal && op1 is inf
//sqrt_zero
//  1.op0 is zero
assign ex1_result_zero   = ex1_div_rst_zero  && ex1_div  || 
                           ex1_sqrt_rst_zero && ex1_sqrt;
assign ex1_div_rst_zero  = (ex1_op0_tt_zero && ex1_op1_norm ) || 
                           (!ex1_expnt0_max && !ex1_op0_cnan && ex1_op1_inf);
assign ex1_sqrt_rst_zero = ex1_op0_tt_zero;

//ex1 result is qNaN
//ex1_nv
//div_qnan
//  1.op0 is qnan || op1 is qnan
//sqrt_qnan
//  1.op0 is qnan
assign ex1_result_qnan   = ex1_div_rst_qnan  && ex1_div  || 
                           ex1_sqrt_rst_qnan && ex1_sqrt || 
                           ex1_nv;
assign ex1_div_rst_qnan  = ex1_op0_qnan || 
                           ex1_op1_qnan;
assign ex1_sqrt_rst_qnan = ex1_op0_qnan;

//ex1_rst_default_qnan
//0/0, inf/inf, sqrt negative should get default qNaN
assign ex1_rst_default_qnan = (ex1_div && ex1_op0_zero && ex1_op1_zero) || 
                              (ex1_div && ex1_op0_inf  && ex1_op1_inf)  || 
                              (ex1_sqrt&& ex1_op0_sign && (ex1_op0_norm || ex1_op0_inf));

//ex1 result is inf
//ex1_dz
//
//div_inf
//  1.op0 is inf && op1 is normal/zero
//sqrt_inf
//  1.op0 is inf
assign ex1_result_inf    = ex1_div_rst_inf  && ex1_div  || 
                           ex1_sqrt_rst_inf && ex1_sqrt || 
                           ex1_dz ;
assign ex1_div_rst_inf   = ex1_op0_inf && !ex1_expnt1_max && !ex1_op1_cnan;
assign ex1_sqrt_rst_inf  = ex1_op0_inf && !ex1_op0_sign;

//ex1 result is lfn
//ex1_of && round result toward not inc 1

assign ex1_rm[2:0]       = ((ex1_static_rm[2:0] == 3'b111)|| !ex1_scalar)
                         ? vfpu_yy_xx_rm[2:0]
                         : ex1_static_rm[2:0];
//RNE : Always inc 1 because round to nearest of 1.111...11
//RTZ : Always not inc 1
//RUP : Always not inc 1 when posetive
//RDN : Always not inc 1 when negative
//RMM : Always inc 1 because round to max magnitude
// &CombBeg; @308
always @( ex1_rm[2:0]
       or ex1_result_sign)
begin
case(ex1_rm[2:0])
  3'b000  : ex1_of_result_lfn = 1'b0;
  3'b001  : ex1_of_result_lfn = 1'b1;
  3'b010  : ex1_of_result_lfn = !ex1_result_sign;
  3'b011  : ex1_of_result_lfn = ex1_result_sign;
  3'b100  : ex1_of_result_lfn = 1'b0;
  default: ex1_of_result_lfn = 1'b0;
endcase
// &CombEnd; @317
end

//EX1 Remainder
//div  : 1/8  <= x < 1/4
//sqrt : 1/16 <= x < 1/4
assign ex1_remainder[59:0] = {60{ex1_div }} & {5'b0,ex1_div_srt_op0[52:0],2'b0} | 
                             {60{ex1_sqrt}} & sqrt_remainder[59:0];

//EX1 Divisor
//1/2 <= y < 1
assign ex1_divisor[52:0]   = ex1_div_srt_op1[52:0];

//ex1_div_srt_op0
assign ex1_div_srt_op0[52:0]     = ex1_div_nor_srt_op0[52:0];
//ex1_div_srt_op1
assign ex1_div_srt_op1[52:0]     =  ex1_div_nor_srt_op1[52:0];
//ex1_div_nor_srt_op0
assign ex1_div_noid_nor_srt_op0[52:0] = ex1_double ? {1'b1,ex1_oper0[51:0]} :
                                                     ex1_single ? {1'b1,ex1_oper0[22:0],29'b0}
                                                                : {1'b1,ex1_oper0[9:0],42'b0};
assign ex1_div_noid_nor_srt_op1[52:0] = ex1_double ? {1'b1,ex1_oper1[51:0]} :
                                                     ex1_single ? {1'b1,ex1_oper1[22:0],29'b0}
                                                                : {1'b1,ex1_oper1[9:0],42'b0};
assign ex1_div_nor_srt_op0[52:0] = ex1_op0_id_nor ? {ex1_oper0_id_frac[51:0],1'b0} 
                                                  : ex1_div_noid_nor_srt_op0[52:0];
//ex1_div_nor_srt_op1
assign ex1_div_nor_srt_op1[52:0] = ex1_op1_id_nor ? {ex1_oper1_id_frac[51:0],1'b0} 
                                                  : ex1_div_noid_nor_srt_op1[52:0];
//sqrt_remainder
assign sqrt_remainder[59:0]      = (ex1_sqrt_expnt_odd)
                                 ? {5'b0,ex1_sqrt_srt_op0[52:0],2'b0}
                                 : {6'b0,ex1_sqrt_srt_op0[52:0],1'b0};
//ex1_sqrt_srt_op0
assign ex1_sqrt_srt_op0[52:0]    = ex1_div_srt_op0[52:0];

//Default_qnan/Standard_qnan Select
assign ex1_op0_is_snan      = ex1_op0_snan;
assign ex1_op1_is_snan      = ex1_op1_snan && ex1_div;
assign ex1_op0_is_qnan      = ex1_op0_qnan;
assign ex1_op1_is_qnan      = ex1_op1_qnan && ex1_div;
assign ex1_op0_f[51:0]      = (ex1_op0_cnan) ? 52'b0: ex1_oper0[51:0];
assign ex1_op1_f[51:0]      = (ex1_op1_cnan) ? 52'b0: ex1_oper1[51:0];
// &CombBeg; @359
always @( ex1_op0_is_snan
       or ex1_op0_is_qnan
       or ex1_op0_f[51:0]
       or ex1_rst_default_qnan
       or ex1_op1_f[51:0]
       or vfpu_yy_xx_dqnan
       or ex1_op1_is_snan
       or ex1_op1_is_qnan)
begin
if(ex1_rst_default_qnan)
  ex1_qnan_f[51:0] = {1'b1, 51'b0};
else if(ex1_op0_is_snan && vfpu_yy_xx_dqnan)
  ex1_qnan_f[51:0] = ex1_op0_f[51:0];
else if(ex1_op1_is_snan && vfpu_yy_xx_dqnan)
  ex1_qnan_f[51:0] = ex1_op1_f[51:0];
else if(ex1_op0_is_qnan && vfpu_yy_xx_dqnan)
  ex1_qnan_f[51:0] = ex1_op0_f[51:0];
else if(ex1_op1_is_qnan && vfpu_yy_xx_dqnan)
  ex1_qnan_f[51:0] = ex1_op1_f[51:0];
else
  ex1_qnan_f[51:0] = {1'b1, 51'b0};
// &CombEnd; @372
end

// &CombBeg; @374
always @( ex1_op0_is_snan
       or ex1_op0_cnan
       or ex1_op0_is_qnan
       or ex1_op1_sign
       or ex1_op0_sign
       or ex1_rst_default_qnan
       or vfpu_yy_xx_dqnan
       or ex1_op1_cnan
       or ex1_op1_is_snan
       or ex1_op1_is_qnan)
begin
if(ex1_rst_default_qnan)
  ex1_qnan_sign = 1'b0;
else if(ex1_op0_is_snan && vfpu_yy_xx_dqnan)
  ex1_qnan_sign = ex1_op0_sign;
else if(ex1_op1_is_snan && vfpu_yy_xx_dqnan)
  ex1_qnan_sign = ex1_op1_sign;
else if(ex1_op0_is_qnan && vfpu_yy_xx_dqnan)
  ex1_qnan_sign = ex1_op0_sign && !ex1_op0_cnan;
else if(ex1_op1_is_qnan && vfpu_yy_xx_dqnan)
  ex1_qnan_sign = ex1_op1_sign && !ex1_op1_cnan;
else
  ex1_qnan_sign = 1'b0;
// &CombEnd; @387
end


//========================Pipe to EX2=======================
//exponent register cal result
//assign ex1_srt_expnt_rst[12:0] = (ex1_sqrt)
//                               ? ex1_sqrt_expnt_result[12:0]
//                               : ex1_expnt_result[12:0];
//Special result should skip SRT logic
assign ex1_srt_skip = ex1_result_zero || 
                      ex1_result_qnan || 
                      ex1_result_inf;
//gate clk
// &Instance("gated_clk_cell","x_ex1_pipe_clk"); @400
gated_clk_cell  x_ex1_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @401
//           .clk_out        (ex1_pipe_clk),//Out Clock @402
//           .external_en    (1'b0), @403
//           .global_en      (cp0_yy_clk_en), @404
//           .local_en       (ex1_pipe_clk_en),//Local Condition @405
//           .module_en      (cp0_vfpu_icg_en) @406
//         ); @407
assign ex1_pipe_clk_en = ex1_pipedown;

always @(posedge ex1_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    vfdsu_ex2_result_zero     <=  1'b0; 
    vfdsu_ex2_result_qnan     <=  1'b0; 
    vfdsu_ex2_result_inf      <=  1'b0; 
    vfdsu_ex2_result_sign     <=  1'b0; 
    vfdsu_ex2_op0_norm        <=  1'b0; 
    vfdsu_ex2_op1_norm        <=  1'b0; 
    vfdsu_ex2_expnt_add0[12:0] <= 13'b0; 
    vfdsu_ex2_expnt_add1[12:0] <= 13'b0; 
    vfdsu_ex2_nv              <=  1'b0; 
    vfdsu_ex2_dz              <=  1'b0; 
    vfdsu_ex2_srt_skip        <=  1'b0; 
    vfdsu_ex2_of_rm_lfn       <=  1'b0;
    vfdsu_ex2_qnan_sign       <=  1'b0;
    vfdsu_ex2_qnan_f[51:0]    <= 52'b0;
    vfdsu_ex2_rm[2:0]         <=  3'b0;
    vfdsu_ex2_div             <=  1'b0;
    vfdsu_ex2_sqrt            <=  1'b0;
    vfdsu_ex2_double          <=  1'b0;
    vfdsu_ex2_single          <=  1'b0;
  end
  else if(ex1_pipedown)
  begin
    vfdsu_ex2_result_zero     <= ex1_result_zero; 
    vfdsu_ex2_result_qnan     <= ex1_result_qnan; 
    vfdsu_ex2_result_inf      <= ex1_result_inf; 
    vfdsu_ex2_result_sign     <= ex1_result_sign; 
    vfdsu_ex2_op0_norm        <= ex1_op0_norm; 
    vfdsu_ex2_op1_norm        <= ex1_op1_norm; 
    vfdsu_ex2_expnt_add0[12:0] <= ex1_expnt_adder_op0[12:0];
    vfdsu_ex2_expnt_add1[12:0] <= ex1_expnt_adder_op1[12:0];
    vfdsu_ex2_nv              <= ex1_nv; 
    vfdsu_ex2_dz              <= ex1_dz; 
    vfdsu_ex2_srt_skip        <= ex1_srt_skip; 
    vfdsu_ex2_of_rm_lfn       <= ex1_of_result_lfn;
    vfdsu_ex2_qnan_sign       <= ex1_qnan_sign;
    vfdsu_ex2_qnan_f[51:0]    <= ex1_qnan_f[51:0];
    vfdsu_ex2_rm[2:0]         <= ex1_rm[2:0];
    vfdsu_ex2_div             <= ex1_div;
    vfdsu_ex2_sqrt            <= ex1_sqrt;
    vfdsu_ex2_double          <= ex1_double;
    vfdsu_ex2_single          <= ex1_single;
  end
  else
  begin
    vfdsu_ex2_result_zero     <= vfdsu_ex2_result_zero; 
    vfdsu_ex2_result_qnan     <= vfdsu_ex2_result_qnan; 
    vfdsu_ex2_result_inf      <= vfdsu_ex2_result_inf; 
    vfdsu_ex2_result_sign     <= vfdsu_ex2_result_sign; 
    vfdsu_ex2_op0_norm        <= vfdsu_ex2_op0_norm; 
    vfdsu_ex2_op1_norm        <= vfdsu_ex2_op1_norm; 
    vfdsu_ex2_expnt_add0[12:0] <= vfdsu_ex2_expnt_add0[12:0]; 
    vfdsu_ex2_expnt_add1[12:0] <= vfdsu_ex2_expnt_add1[12:0]; 
    vfdsu_ex2_nv              <= vfdsu_ex2_nv; 
    vfdsu_ex2_dz              <= vfdsu_ex2_dz; 
    vfdsu_ex2_srt_skip        <= vfdsu_ex2_srt_skip; 
    vfdsu_ex2_of_rm_lfn       <= vfdsu_ex2_of_rm_lfn;
    vfdsu_ex2_qnan_sign       <= vfdsu_ex2_qnan_sign;
    vfdsu_ex2_qnan_f[51:0]    <= vfdsu_ex2_qnan_f[51:0];
    vfdsu_ex2_rm[2:0]         <= vfdsu_ex2_rm[2:0];
    vfdsu_ex2_div             <= vfdsu_ex2_div;
    vfdsu_ex2_sqrt            <= vfdsu_ex2_sqrt;
    vfdsu_ex2_double          <= vfdsu_ex2_double;
    vfdsu_ex2_single          <= vfdsu_ex2_single;
  end
end

// &Force("output","vfdsu_ex2_op0_norm"); @480
// &Force("output","vfdsu_ex2_op1_norm"); @481
// &Force("output","vfdsu_ex2_dz"); @482
// &Force("output","vfdsu_ex2_nv"); @483
// &Force("output","vfdsu_ex2_srt_skip"); @484
// &Force("output","vfdsu_ex2_of_rm_lfn"); @485
// &Force("output","vfdsu_ex2_result_inf"); @486
// &Force("output","vfdsu_ex2_result_qnan"); @487
// &Force("output","vfdsu_ex2_result_zero"); @488
// //&Force("output","vfdsu_ex2_expnt_rst"); @489
// &Force("output","vfdsu_ex2_result_sign"); @490
// &Force("output","vfdsu_ex2_qnan_f"); @491
// &Force("output","vfdsu_ex2_qnan_sign"); @492
// &Force("output","vfdsu_ex2_rm"); @493
// &Force("output","vfdsu_ex2_div"); @494
// &Force("output","vfdsu_ex2_sqrt"); @495
// &Force("output","vfdsu_ex2_double"); @496
// &Force("output","vfdsu_ex2_single"); @497
// &Force("output","vfdsu_ex2_expnt_add0"); @498
// &Force("output","vfdsu_ex2_expnt_add1"); @499

// &ModuleEnd; @501
endmodule


