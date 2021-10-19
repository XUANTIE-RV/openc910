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

// &ModuleBeg; @23
module ct_vfmau_mult_simd_half(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_mult_ex1_op0_slicex_halfy,
  dp_mult_ex1_op0_slicex_halfy_high,
  dp_mult_ex1_op1_slicex_halfy,
  dp_mult_ex1_op1_slicex_halfy_high,
  dp_mult_ex1_op2_slicex_halfy,
  dp_mult_ex1_op2_slicex_halfy_high,
  dp_mult_op2_slicex_vl_halfy_mask,
  dp_mult_op2_slicex_vm_halfy_mask,
  dp_xx_ex1_fma,
  dp_xx_ex1_half,
  dp_xx_ex1_neg,
  dp_xx_ex1_rm,
  dp_xx_ex1_simd,
  dp_xx_ex1_sub,
  dp_xx_ex1_widen,
  dp_xx_ex2_fma,
  dp_xx_ex2_half,
  dp_xx_ex2_rm,
  dp_xx_ex2_simd,
  dp_xx_ex3_rm,
  forever_cpuclk,
  halfy_ex1_op0_hidden_bit,
  halfy_ex1_op1_hidden_bit,
  halfy_fma_expt,
  halfy_fma_result,
  halfy_mult_expt,
  halfy_mult_result,
  mult1_simd_halfy_sel,
  mult_ex1_ex2_half_pipedown,
  mult_ex2_ex3_half_pipedown,
  mult_ex3_ex4_half_pipedown,
  pad_yy_icg_scan_en,
  pipe6_pipex_ex4_fmla_fwd_vld,
  pipe6_vfmau_ex4_fmla_slicex_halfy_data,
  pipe7_pipex_ex4_fmla_fwd_vld,
  pipe7_vfmau_ex4_fmla_slicex_halfy_data,
  simd_halfy_product,
  slicex_dp_halfy_mult_id,
  vfpu_yy_xx_dqnan
);

// &Ports; @24
input           cp0_vfpu_icg_en;                       
input           cp0_yy_clk_en;                         
input           cpurst_b;                              
input   [15:0]  dp_mult_ex1_op0_slicex_halfy;          
input   [47:0]  dp_mult_ex1_op0_slicex_halfy_high;     
input   [15:0]  dp_mult_ex1_op1_slicex_halfy;          
input   [47:0]  dp_mult_ex1_op1_slicex_halfy_high;     
input   [31:0]  dp_mult_ex1_op2_slicex_halfy;          
input   [47:0]  dp_mult_ex1_op2_slicex_halfy_high;     
input           dp_mult_op2_slicex_vl_halfy_mask;      
input           dp_mult_op2_slicex_vm_halfy_mask;      
input           dp_xx_ex1_fma;                         
input           dp_xx_ex1_half;                        
input           dp_xx_ex1_neg;                         
input   [2 :0]  dp_xx_ex1_rm;                          
input           dp_xx_ex1_simd;                        
input           dp_xx_ex1_sub;                         
input           dp_xx_ex1_widen;                       
input           dp_xx_ex2_fma;                         
input           dp_xx_ex2_half;                        
input   [2 :0]  dp_xx_ex2_rm;                          
input           dp_xx_ex2_simd;                        
input   [2 :0]  dp_xx_ex3_rm;                          
input           forever_cpuclk;                        
input           mult1_simd_halfy_sel;                  
input           mult_ex1_ex2_half_pipedown;            
input           mult_ex2_ex3_half_pipedown;            
input           mult_ex3_ex4_half_pipedown;            
input           pad_yy_icg_scan_en;                    
input           pipe6_pipex_ex4_fmla_fwd_vld;          
input   [15:0]  pipe6_vfmau_ex4_fmla_slicex_halfy_data; 
input           pipe7_pipex_ex4_fmla_fwd_vld;          
input   [15:0]  pipe7_vfmau_ex4_fmla_slicex_halfy_data; 
input   [21:0]  simd_halfy_product;                    
input           vfpu_yy_xx_dqnan;                      
output          halfy_ex1_op0_hidden_bit;              
output          halfy_ex1_op1_hidden_bit;              
output  [4 :0]  halfy_fma_expt;                        
output  [15:0]  halfy_fma_result;                      
output  [4 :0]  halfy_mult_expt;                       
output  [15:0]  halfy_mult_result;                     
output          slicex_dp_halfy_mult_id;               

// &Regs; @25
reg             mult_ex1_ex2_sticky1;                  
reg     [6 :0]  mult_ex1_fma_id_adjust;                
reg     [4 :0]  mult_ex1_offset_adjust;                
reg     [31:0]  mult_ex1_op2;                          
reg     [36:0]  mult_ex1_op2_shift_result;             
reg             mult_ex1_sticky1;                      
reg     [15:0]  mult_ex2_abnorm_result;                
reg             mult_ex2_add1;                         
reg     [4 :0]  mult_ex2_expnt_offset;                 
reg     [4 :0]  mult_ex2_expt;                         
reg     [6 :0]  mult_ex2_fma_expnt_diff;               
reg             mult_ex2_fmla_ex4_fwd_vld;             
reg     [37:0]  mult_ex2_frac_result;                  
reg     [3 :0]  mult_ex2_id_offset;                    
reg     [1 :0]  mult_ex2_l2_sa_offset;                 
reg     [21:0]  mult_ex2_lshift_result;                
reg     [6 :0]  mult_ex2_mult_expnt_plus_3_result;     
reg     [6 :0]  mult_ex2_mult_expnt_result;            
reg     [21:0]  mult_ex2_mult_frac;                    
reg     [6 :0]  mult_ex2_mult_id_adjust;               
reg     [15:0]  mult_ex2_mult_result;                  
reg             mult_ex2_mult_result_sign;             
reg             mult_ex2_of_result_lfn;                
reg             mult_ex2_op0_id;                       
reg             mult_ex2_op1_id;                       
reg     [4 :0]  mult_ex2_op2_expnt;                    
reg     [9 :0]  mult_ex2_op2_frac;                     
reg             mult_ex2_op2_id;                       
reg     [36:0]  mult_ex2_op2_shift_result;             
reg             mult_ex2_op2_sign;                     
reg             mult_ex2_op_id;                        
reg             mult_ex2_potnt_of;                     
reg             mult_ex2_result_abnorm;                
reg     [21:0]  mult_ex2_rshift_result;                
reg     [12:0]  mult_ex2_rshit_out;                    
reg     [36:0]  mult_ex2_sa_op2;                       
reg     [6 :0]  mult_ex2_sa_result;                    
reg             mult_ex2_simd_half_sel;                
reg             mult_ex2_sticky1;                      
reg             mult_ex2_sub_vld;                      
reg     [15:0]  mult_ex3_abnorm_result;                
reg     [6 :0]  mult_ex3_expnt_result;                 
reg     [4 :0]  mult_ex3_expt;                         
reg     [6 :0]  mult_ex3_fma_expnt;                    
reg     [37:0]  mult_ex3_fma_expnt_shift;              
reg     [37:0]  mult_ex3_fma_norm_result;              
reg             mult_ex3_fma_of_result_lfn;            
reg             mult_ex3_fma_sign;                     
reg     [37:0]  mult_ex3_frac_result;                  
reg     [4 :0]  mult_ex3_lza_result;                   
reg             mult_ex3_lza_result_zero;              
reg             mult_ex3_result_abnorm;                
reg             mult_ex3_simd_half_sel;                
reg             mult_ex3_sticky1;                      
reg             mult_ex3_sub_vld;                      
reg     [4 :0]  mult_ex4_fma_expt;                     
reg     [15:0]  mult_ex4_fma_result;                   

// &Wires; @26
wire            cp0_vfpu_icg_en;                       
wire            cp0_yy_clk_en;                         
wire            cpurst_b;                              
wire    [15:0]  dp_mult_ex1_op0_slicex_halfy;          
wire    [47:0]  dp_mult_ex1_op0_slicex_halfy_high;     
wire    [15:0]  dp_mult_ex1_op1_slicex_halfy;          
wire    [47:0]  dp_mult_ex1_op1_slicex_halfy_high;     
wire    [31:0]  dp_mult_ex1_op2_slicex_halfy;          
wire    [47:0]  dp_mult_ex1_op2_slicex_halfy_high;     
wire            dp_mult_op2_slicex_vl_halfy_mask;      
wire            dp_mult_op2_slicex_vm_halfy_mask;      
wire            dp_xx_ex1_fma;                         
wire            dp_xx_ex1_half;                        
wire            dp_xx_ex1_neg;                         
wire    [2 :0]  dp_xx_ex1_rm;                          
wire            dp_xx_ex1_simd;                        
wire            dp_xx_ex1_sub;                         
wire            dp_xx_ex1_widen;                       
wire            dp_xx_ex2_fma;                         
wire            dp_xx_ex2_half;                        
wire    [2 :0]  dp_xx_ex2_rm;                          
wire            dp_xx_ex2_simd;                        
wire    [2 :0]  dp_xx_ex3_rm;                          
wire            forever_cpuclk;                        
wire            halfy_ex1_op0_hidden_bit;              
wire            halfy_ex1_op1_hidden_bit;              
wire    [4 :0]  halfy_fma_expt;                        
wire    [15:0]  halfy_fma_result;                      
wire    [4 :0]  halfy_mult_expt;                       
wire    [15:0]  halfy_mult_result;                     
wire            mult1_simd_halfy_sel;                  
wire    [38:0]  mult2_ex2_addr0;                       
wire    [38:0]  mult2_ex2_addr1;                       
wire    [15:0]  mult_ex1_abnorm_result;                
wire            mult_ex1_ex2_half_pipedown;            
wire            mult_ex1_expnt0_inf;                   
wire            mult_ex1_expnt0_zero;                  
wire            mult_ex1_expnt1_inf;                   
wire            mult_ex1_expnt1_zero;                  
wire            mult_ex1_expnt2_half_inf;              
wire            mult_ex1_expnt2_inf;                   
wire            mult_ex1_expnt2_sing_inf;              
wire            mult_ex1_expnt2_zero;                  
wire    [4 :0]  mult_ex1_expnt_addr_op0;               
wire    [4 :0]  mult_ex1_expnt_addr_op1;               
wire    [9 :0]  mult_ex1_expnt_bias;                   
wire            mult_ex1_expnt_of;                     
wire    [4 :0]  mult_ex1_expnt_offset;                 
wire    [9 :0]  mult_ex1_expnt_plus_3_bias;            
wire            mult_ex1_expnt_potnt_of;               
wire    [4 :0]  mult_ex1_expt;                         
wire    [6 :0]  mult_ex1_fma_expnt_diff;               
wire            mult_ex1_fmla_ex4_fwd_vld;             
wire            mult_ex1_frac0_all_zero;               
wire            mult_ex1_frac1_all_zero;               
wire            mult_ex1_frac2_all_zero;               
wire    [3 :0]  mult_ex1_id_lshift_offset;             
wire    [3 :0]  mult_ex1_id_offset;                    
wire    [1 :0]  mult_ex1_l2_sa_offset;                 
wire            mult_ex1_l2_sa_vld;                    
wire    [9 :0]  mult_ex1_mult_expnt_plus_3_result;     
wire    [9 :0]  mult_ex1_mult_expnt_result;            
wire            mult_ex1_mult_result_sign;             
wire    [22:0]  mult_ex1_nan_result;                   
wire            mult_ex1_nv;                           
wire            mult_ex1_nx;                           
wire            mult_ex1_of;                           
wire            mult_ex1_op0_cnan;                     
wire    [4 :0]  mult_ex1_op0_expnt;                    
wire    [3 :0]  mult_ex1_op0_ff1_result;               
wire    [9 :0]  mult_ex1_op0_frac;                     
wire            mult_ex1_op0_high_vld;                 
wire            mult_ex1_op0_id;                       
wire    [3 :0]  mult_ex1_op0_id_offset;                
wire            mult_ex1_op0_inf;                      
wire            mult_ex1_op0_norm;                     
wire            mult_ex1_op0_qnan;                     
wire    [22:0]  mult_ex1_op0_qnan_result;              
wire            mult_ex1_op0_sign;                     
wire            mult_ex1_op0_snan;                     
wire            mult_ex1_op0_zero;                     
wire            mult_ex1_op1_cnan;                     
wire    [4 :0]  mult_ex1_op1_expnt;                    
wire    [3 :0]  mult_ex1_op1_ff1_result;               
wire    [9 :0]  mult_ex1_op1_frac;                     
wire            mult_ex1_op1_high_vld;                 
wire            mult_ex1_op1_id;                       
wire    [3 :0]  mult_ex1_op1_id_offset;                
wire            mult_ex1_op1_inf;                      
wire            mult_ex1_op1_norm;                     
wire            mult_ex1_op1_qnan;                     
wire    [22:0]  mult_ex1_op1_qnan_result;              
wire            mult_ex1_op1_sign;                     
wire            mult_ex1_op1_snan;                     
wire            mult_ex1_op1_zero;                     
wire            mult_ex1_op2_cnan;                     
wire    [7 :0]  mult_ex1_op2_expnt;                    
wire    [22:0]  mult_ex1_op2_frac;                     
wire            mult_ex1_op2_high_vld;                 
wire            mult_ex1_op2_id;                       
wire    [23:0]  mult_ex1_op2_id_frac;                  
wire            mult_ex1_op2_inf;                      
wire            mult_ex1_op2_norm;                     
wire            mult_ex1_op2_qnan;                     
wire    [22:0]  mult_ex1_op2_qnan_result;              
wire    [36:0]  mult_ex1_op2_shift_aft;                
wire    [36:0]  mult_ex1_op2_shift_pre;                
wire            mult_ex1_op2_sign;                     
wire            mult_ex1_op2_snan;                     
wire            mult_ex1_op2_zero;                     
wire            mult_ex1_op_id;                        
wire            mult_ex1_op_qnan;                      
wire            mult_ex1_op_qnan_select;               
wire            mult_ex1_op_snan;                      
wire            mult_ex1_op_snan_select;               
wire            mult_ex1_potnt_of;                     
wire    [22:0]  mult_ex1_qnan_result;                  
wire            mult_ex1_result_abnorm;                
wire            mult_ex1_result_inf;                   
wire            mult_ex1_result_inf_sign;              
wire            mult_ex1_result_op2;                   
wire            mult_ex1_result_op2_sign;              
wire            mult_ex1_result_qnan;                  
wire            mult_ex1_result_zero;                  
wire            mult_ex1_result_zero_sign;             
wire            mult_ex1_sa_ge_37;                     
wire            mult_ex1_sa_lt_0;                      
wire    [6 :0]  mult_ex1_sa_result;                    
wire    [22:0]  mult_ex1_snan_result;                  
wire            mult_ex1_sub_vld;                      
wire    [38:0]  mult_ex2_addr_plus_1_result;           
wire    [38:0]  mult_ex2_addr_result;                  
wire            mult_ex2_eq;                           
wire            mult_ex2_ex3_half_pipedown;            
wire            mult_ex2_expnt_diff_ge_neg2;           
wire    [6 :0]  mult_ex2_expnt_final_result;           
wire            mult_ex2_expnt_plus1;                  
wire    [6 :0]  mult_ex2_expnt_plus1_result;           
wire            mult_ex2_expnt_plus2;                  
wire    [6 :0]  mult_ex2_expnt_plus2_result;           
wire    [15:0]  mult_ex2_fma_abnorm_result;            
wire    [6 :0]  mult_ex2_fma_expnt;                    
wire    [4 :0]  mult_ex2_fma_expt;                     
wire    [6 :0]  mult_ex2_fma_mult_expnt;               
wire    [6 :0]  mult_ex2_fma_op2_expnt;                
wire            mult_ex2_fma_result_abnorm;            
wire            mult_ex2_fma_sign;                     
wire    [9 :0]  mult_ex2_frac_10;                      
wire            mult_ex2_frac_result_add;              
wire            mult_ex2_frac_result_negate;           
wire    [37:0]  mult_ex2_frac_result_shift;            
wire            mult_ex2_frac_result_sub;              
wire            mult_ex2_frac_shift_11;                
wire            mult_ex2_gr;                           
wire    [23:0]  mult_ex2_lza_addend;                   
wire    [4 :0]  mult_ex2_lza_result;                   
wire            mult_ex2_lza_result_zero;              
wire    [23:0]  mult_ex2_lza_summand;                  
wire    [6 :0]  mult_ex2_mult_expnt_shift;             
wire    [4 :0]  mult_ex2_mult_expt;                    
wire    [11:0]  mult_ex2_mult_frac_result;             
wire    [11:0]  mult_ex2_mult_frac_round_op0;          
wire    [11:0]  mult_ex2_mult_frac_round_op1;          
wire    [11:0]  mult_ex2_mult_frac_round_result;       
wire    [21:0]  mult_ex2_mult_frac_shift;              
wire            mult_ex2_mult_mask;                    
wire            mult_ex2_mult_result_abnorm;           
wire            mult_ex2_mult_result_inf;              
wire            mult_ex2_mult_result_lfn;              
wire            mult_ex2_mult_result_norm;             
wire            mult_ex2_mult_rshift_sticky;           
wire            mult_ex2_nx;                           
wire            mult_ex2_of;                           
wire    [6 :0]  mult_ex2_op2_expnt_adjust;             
wire    [6 :0]  mult_ex2_op2_expnt_bias;               
wire            mult_ex2_result_mask;                  
wire            mult_ex2_rshift_sel;                   
wire    [15:0]  mult_ex2_rst_abnorm;                   
wire            mult_ex2_rst_gbit;                     
wire    [15:0]  mult_ex2_rst_inf;                      
wire    [15:0]  mult_ex2_rst_lfn;                      
wire            mult_ex2_rst_lsb;                      
wire    [15:0]  mult_ex2_rst_masked;                   
wire    [15:0]  mult_ex2_rst_norm;                     
wire            mult_ex2_rst_rsbit;                    
wire            mult_ex2_uf;                           
wire            mult_ex2_zero;                         
wire    [15:0]  mult_ex3_ex4_fma_result;               
wire            mult_ex3_ex4_half_pipedown;            
wire            mult_ex3_ex4_result_abnorm;            
wire            mult_ex3_exp_shift_sel;                
wire    [6 :0]  mult_ex3_expnt_adder0;                 
wire    [6 :0]  mult_ex3_expnt_adder1;                 
wire            mult_ex3_expnt_eq_lza_plus1;           
wire            mult_ex3_expnt_is_0;                   
wire            mult_ex3_expnt_is_1;                   
wire            mult_ex3_expnt_le_lza;                 
wire    [6 :0]  mult_ex3_expnt_lza_shift;              
wire            mult_ex3_expnt_of;                     
wire    [4 :0]  mult_ex3_expt_result;                  
wire    [15:0]  mult_ex3_fma_abnorm_result;            
wire            mult_ex3_fma_expnt_m1;                 
wire    [6 :0]  mult_ex3_fma_expnt_m1_result;          
wire            mult_ex3_fma_expnt_nx;                 
wire            mult_ex3_fma_expnt_of;                 
wire            mult_ex3_fma_expnt_p1;                 
wire    [6 :0]  mult_ex3_fma_expnt_p1_result;          
wire    [6 :0]  mult_ex3_fma_expnt_result;             
wire            mult_ex3_fma_expnt_uf;                 
wire    [37:0]  mult_ex3_fma_frac;                     
wire    [10:0]  mult_ex3_fma_frac_result;              
wire    [11:0]  mult_ex3_fma_frac_round_add;           
wire    [10:0]  mult_ex3_fma_frac_round_result;        
wire    [37:0]  mult_ex3_fma_norm_shift;               
wire            mult_ex3_fma_result_inf;               
wire            mult_ex3_fma_result_lfn;               
wire            mult_ex3_fma_zero_sign;                
wire            mult_ex3_frac_nx;                      
wire            mult_ex3_grs_zero;                     
wire            mult_ex3_potnt_add_of;                 
wire            mult_ex3_potnt_add_uf;                 
wire            mult_ex3_potnt_sub_of;                 
wire            mult_ex3_potnt_sub_uf;                 
wire            mult_ex3_result_zero;                  
wire            mult_ex3_rst_add1;                     
wire            mult_ex3_rst_gbit;                     
wire            mult_ex3_rst_ge;                       
wire            mult_ex3_rst_gr;                       
wire    [15:0]  mult_ex3_rst_inf;                      
wire    [15:0]  mult_ex3_rst_lfn;                      
wire            mult_ex3_rst_lsb;                      
wire            mult_ex3_rst_rsbit;                    
wire    [15:0]  mult_ex3_rst_zero;                     
wire            pad_yy_icg_scan_en;                    
wire            pipe6_pipex_ex4_fmla_fwd_vld;          
wire    [15:0]  pipe6_vfmau_ex4_fmla_slicex_halfy_data; 
wire            pipe7_pipex_ex4_fmla_fwd_vld;          
wire    [15:0]  pipe7_vfmau_ex4_fmla_slicex_halfy_data; 
wire            simd_ex1_ex2_pipe_clk;                 
wire            simd_ex1_ex2_pipedown;                 
wire            simd_ex2_ex3_pipe_clk;                 
wire            simd_ex2_ex3_pipedown;                 
wire            simd_ex3_ex4_pipe_clk;                 
wire            simd_ex3_ex4_pipedown;                 
wire    [21:0]  simd_halfy_product;                    
wire            slicex_dp_halfy_mult_id;               
wire            vfpu_yy_xx_dqnan;                      


// &Depend("cpu_cfig.h"); @28

// &Force("bus","dp_xx_ex3_oper_size",2,0); @30
// &Force("bus","dp_xx_ex2_oper_size",2,0); @31

//==========================================================
//                    EX1  Stage
//==========================================================
//----------------------------------------------------------
//                 Operand Operation
//----------------------------------------------------------
//src0 operand
assign mult_ex1_op0_sign       = dp_mult_ex1_op0_slicex_halfy[15];
assign mult_ex1_op0_expnt[4:0] = dp_mult_ex1_op0_slicex_halfy[14:10];
assign mult_ex1_op0_frac[9:0]  = dp_mult_ex1_op0_slicex_halfy[9:0];

//src1 operand
assign mult_ex1_op1_sign       = dp_mult_ex1_op1_slicex_halfy[15];
assign mult_ex1_op1_expnt[4:0] = dp_mult_ex1_op1_slicex_halfy[14:10];
assign mult_ex1_op1_frac[9:0]  = dp_mult_ex1_op1_slicex_halfy[9:0];

//src2 operand
assign mult_ex1_op2_sign       = mult_ex1_op2[31];
assign mult_ex1_op2_expnt[7:0] = mult_ex1_op2[30:23];
assign mult_ex1_op2_frac[22:0] = mult_ex1_op2[22:0];


// &CombBeg; @55
always @( pipe7_vfmau_ex4_fmla_slicex_halfy_data[15:0]
       or pipe7_pipex_ex4_fmla_fwd_vld
       or dp_xx_ex1_fma
       or dp_mult_ex1_op2_slicex_halfy[31:0]
       or pipe6_pipex_ex4_fmla_fwd_vld
       or pipe6_vfmau_ex4_fmla_slicex_halfy_data[15:0])
begin
case({pipe6_pipex_ex4_fmla_fwd_vld,
      pipe7_pipex_ex4_fmla_fwd_vld})
  2'b10  : mult_ex1_op2[31:0] = {pipe6_vfmau_ex4_fmla_slicex_halfy_data[15],3'b0,pipe6_vfmau_ex4_fmla_slicex_halfy_data[14:0],13'b0};
  2'b01  : mult_ex1_op2[31:0] = {pipe7_vfmau_ex4_fmla_slicex_halfy_data[15],3'b0,pipe7_vfmau_ex4_fmla_slicex_halfy_data[14:0],13'b0};
  default: mult_ex1_op2[31:0] = dp_mult_ex1_op2_slicex_halfy[31:0] & {32{dp_xx_ex1_fma}};
endcase
// &CombEnd; @62
end


assign mult_ex1_fmla_ex4_fwd_vld   = dp_xx_ex1_fma
                                  && (pipe6_pipex_ex4_fmla_fwd_vld
                                     || pipe7_pipex_ex4_fmla_fwd_vld);

//the sign of multply 1 results
assign mult_ex1_mult_result_sign = mult_ex1_op0_sign
                                 ^ mult_ex1_op1_sign
                                 ^ dp_xx_ex1_neg;

//we always regard the sign of A*B is positive,so when execute 
//src0*src1 +/- src2, the add or sub operation is decided by 
//sign(src0*src1) and sign(src2) and =/-
//if sign(src0*src1) ^ sign(src2)^sub_vld == 1, execute sub, src2 will opposite
//if sign(src0*src1) ^ sign(src2)^sub_vld == 0, execute add, src2 won't opposite
//the opposite operation will do at EX2
assign mult_ex1_sub_vld = (mult_ex1_mult_result_sign
                        ^ mult_ex1_op2_sign
                        ^ dp_xx_ex1_sub
                        ^ dp_xx_ex1_neg)
                       && dp_xx_ex1_fma;

//exponent max detection
assign mult_ex1_expnt0_inf = &mult_ex1_op0_expnt[4:0];
assign mult_ex1_expnt1_inf = &mult_ex1_op1_expnt[4:0];
assign mult_ex1_expnt2_inf = (dp_xx_ex1_widen)
                           ? mult_ex1_expnt2_sing_inf
                           : mult_ex1_expnt2_half_inf;

assign mult_ex1_expnt2_sing_inf = &mult_ex1_op2_expnt[7:0];
assign mult_ex1_expnt2_half_inf = &mult_ex1_op2_expnt[4:0];

//exponent zero
assign mult_ex1_expnt0_zero = ~|mult_ex1_op0_expnt[4:0];
assign mult_ex1_expnt1_zero = ~|mult_ex1_op1_expnt[4:0];
assign mult_ex1_expnt2_zero = (~|mult_ex1_op2_expnt[7:0]) && !mult_ex1_op2_cnan;

//fraction zero
assign mult_ex1_frac0_all_zero   = ~|mult_ex1_op0_frac[9:0];
assign mult_ex1_frac1_all_zero   = ~|mult_ex1_op1_frac[9:0];
assign mult_ex1_frac2_all_zero   = ~|mult_ex1_op2_frac[22:0];

//fraction hidden bit
//for timing consideration,hidden bit calculation is simplied,
//but when fraction is zero,the result is abnormal,we deal with special
//path.
assign halfy_ex1_op0_hidden_bit = !mult_ex1_expnt0_zero;
assign halfy_ex1_op1_hidden_bit = !mult_ex1_expnt1_zero;

assign mult_ex1_op0_high_vld   = (&dp_mult_ex1_op0_slicex_halfy_high[47:0]) || dp_xx_ex1_simd;
assign mult_ex1_op1_high_vld   = (&dp_mult_ex1_op1_slicex_halfy_high[47:0]) || dp_xx_ex1_simd;
assign mult_ex1_op2_high_vld   = mult_ex1_fmla_ex4_fwd_vld ||(&dp_mult_ex1_op2_slicex_halfy_high[47:0]) || dp_xx_ex1_simd;

//----------------------------------------------------------
//                 Operand Special Number
//----------------------------------------------------------
// infinity number
assign mult_ex1_op0_inf  = mult_ex1_expnt0_inf && mult_ex1_frac0_all_zero && !mult_ex1_op0_cnan;
assign mult_ex1_op1_inf  = mult_ex1_expnt1_inf && mult_ex1_frac1_all_zero && !mult_ex1_op1_cnan;
assign mult_ex1_op2_inf  = mult_ex1_expnt2_inf && mult_ex1_frac2_all_zero && !mult_ex1_op2_cnan;

//zero
assign mult_ex1_op0_zero = mult_ex1_expnt0_zero && mult_ex1_frac0_all_zero && !mult_ex1_op0_cnan;
assign mult_ex1_op1_zero = mult_ex1_expnt1_zero && mult_ex1_frac1_all_zero && !mult_ex1_op1_cnan;
assign mult_ex1_op2_zero = mult_ex1_expnt2_zero && mult_ex1_frac2_all_zero && !mult_ex1_op2_cnan;

//denormalize number
assign mult_ex1_op0_id   = mult_ex1_expnt0_zero && ~mult_ex1_frac0_all_zero;
assign mult_ex1_op1_id   = mult_ex1_expnt1_zero && ~mult_ex1_frac1_all_zero;
assign mult_ex1_op2_id   = mult_ex1_expnt2_zero && ~mult_ex1_frac2_all_zero;


//when single and high not valid NaN-boxing ,data will be canonical-Nan
assign mult_ex1_op0_cnan  = dp_xx_ex1_half && !mult_ex1_op0_high_vld; 
assign mult_ex1_op1_cnan  = dp_xx_ex1_half && !mult_ex1_op1_high_vld; 
assign mult_ex1_op2_cnan  = dp_xx_ex1_half && !mult_ex1_op2_high_vld && dp_xx_ex1_fma; 

//sNaN
assign mult_ex1_op0_snan = mult_ex1_expnt0_inf
                        && !mult_ex1_op0_cnan
                        && !mult_ex1_frac0_all_zero
                        && !mult_ex1_op0_frac[9];  //msb of frac

assign mult_ex1_op1_snan = mult_ex1_expnt1_inf
                        && !mult_ex1_op1_cnan
                        && !mult_ex1_frac1_all_zero
                        && !mult_ex1_op1_frac[9];  //msb of frac

assign mult_ex1_op2_snan = mult_ex1_expnt2_inf
                        && !mult_ex1_op2_cnan
                        && !mult_ex1_frac2_all_zero
                        && !mult_ex1_op2_frac[22];  //msb of frac

//qNaN
assign mult_ex1_op0_qnan = mult_ex1_expnt0_inf && mult_ex1_op0_frac[9]  || mult_ex1_op0_cnan; 
assign mult_ex1_op1_qnan = mult_ex1_expnt1_inf && mult_ex1_op1_frac[9]  || mult_ex1_op1_cnan; 
assign mult_ex1_op2_qnan = mult_ex1_expnt2_inf && mult_ex1_op2_frac[22] || mult_ex1_op2_cnan;

assign mult_ex1_op_id    = mult_ex1_op0_id
                        || mult_ex1_op1_id
                        || mult_ex1_op2_id;

assign mult_ex1_op_snan  = mult_ex1_op0_snan
                        || mult_ex1_op1_snan
                        || mult_ex1_op2_snan;

assign mult_ex1_op_qnan  = mult_ex1_op0_qnan
                        || mult_ex1_op1_qnan
                        || mult_ex1_op2_qnan;

//----------------------------------------------------------
//                    Exponent  Adding
//----------------------------------------------------------
assign mult_ex1_expnt_addr_op0[4:0] = mult_ex1_op0_expnt[4:0];
assign mult_ex1_expnt_addr_op1[4:0] = mult_ex1_op1_expnt[4:0];

assign mult_ex1_expnt_bias[9:0]          = (dp_xx_ex1_widen)
                                         ? 10'h61    //97
                                         : 10'h3f1;  //-15 
assign mult_ex1_expnt_plus_3_bias[9:0]   = (dp_xx_ex1_widen)
                                         ? 10'h64   //100
                                         : 10'h3f4;  //-12

assign mult_ex1_mult_expnt_result[9:0]   = {5'b0,mult_ex1_expnt_addr_op0[4:0]}
                                         + {5'b0,mult_ex1_expnt_addr_op1[4:0]}
                                         + mult_ex1_expnt_bias[9:0];

//for fused multiply add ,when diff>=-2.select E0+E1-bias+3 as initial exponent 
assign mult_ex1_mult_expnt_plus_3_result[9:0] = {5'b0,mult_ex1_expnt_addr_op0[4:0]}
                                              + {5'b0,mult_ex1_expnt_addr_op1[4:0]}
                                              + mult_ex1_expnt_plus_3_bias[9:0];

assign mult_ex1_expnt_offset[4:0]        = (mult_ex1_op_id)
                                         ? mult_ex1_mult_expnt_result[4:0]
                                         : mult_ex1_mult_expnt_result[4:0] - 5'b1;


assign slicex_dp_halfy_mult_id = dp_xx_ex1_half
                              && dp_xx_ex1_widen
                              && mult_ex1_op0_norm
                              && mult_ex1_op1_norm
                              && mult_ex1_op_id;

//calculate for select fma exponent
// &CombBeg; @214
always @( mult_ex1_op2_id
       or mult_ex1_op1_id
       or mult_ex1_op0_id)
begin
  case({mult_ex1_op2_id
       ,mult_ex1_op1_id
       ,mult_ex1_op0_id})
   3'b000 : mult_ex1_fma_id_adjust[6:0] = 7'h0;    //0
   3'b001 : mult_ex1_fma_id_adjust[6:0] = 7'h1;    //1
   3'b010 : mult_ex1_fma_id_adjust[6:0] = 7'h1;    //1
   3'b011 : mult_ex1_fma_id_adjust[6:0] = 7'h2;    //2
   3'b100 : mult_ex1_fma_id_adjust[6:0] = 7'h7f;   //-1
   3'b101 : mult_ex1_fma_id_adjust[6:0] = 7'h0;    //0
   3'b110 : mult_ex1_fma_id_adjust[6:0] = 7'h0;    //0
   3'b111 : mult_ex1_fma_id_adjust[6:0] = 7'h1;    //1
   default: mult_ex1_fma_id_adjust[6:0] = {7{1'bx}}; 
 endcase
// &CombEnd; @228
end

assign mult_ex1_fma_expnt_diff[6:0]  = {mult_ex1_mult_expnt_result[6:0]}
                                     + mult_ex1_fma_id_adjust[6:0]
                                     - {2'b0,mult_ex1_op2_expnt[4:0]};

//----------------------------------------------------------
//                 Denormal Data Preprocessing
//----------------------------------------------------------
//when multiply contain denomal input,Calculate leading zero num.
// &Instance("ct_vfmau_ff1_10bit","x_ct_vfmau_op0_ff1"); @238
ct_vfmau_ff1_10bit  x_ct_vfmau_op0_ff1 (
  .ff1_data                (mult_ex1_op0_frac      ),
  .ff1_result              (mult_ex1_op0_ff1_result)
);

// &Connect( .ff1_data    (mult_ex1_op0_frac      ), @239
//           .ff1_result  (mult_ex1_op0_ff1_result) @240
//         ); @241

// &Instance("ct_vfmau_ff1_10bit","x_ct_vfmau_op1_ff1"); @243
ct_vfmau_ff1_10bit  x_ct_vfmau_op1_ff1 (
  .ff1_data                (mult_ex1_op1_frac      ),
  .ff1_result              (mult_ex1_op1_ff1_result)
);

// &Connect( .ff1_data    (mult_ex1_op1_frac      ), @244
//           .ff1_result  (mult_ex1_op1_ff1_result) @245
//         ); @246

//with multiple 0 ahead,we should result frac result
//Note:
//when DN*DN,if operation is Non-Widen,the result must trigger underflow,
//so,only simd half should only consider  DN*NM 
assign mult_ex1_op0_id_offset[3:0] = (mult_ex1_op0_id) 
                                   ? mult_ex1_op0_ff1_result[3:0]
                                   : 4'b0;
        
assign mult_ex1_op1_id_offset[3:0] = (mult_ex1_op1_id) 
                                   ? mult_ex1_op1_ff1_result[3:0]
                                   : 4'b0;

assign mult_ex1_id_offset[3:0] = 
   {4{mult_ex1_op0_id}} & mult_ex1_op0_id_offset[3:0]
 | {4{mult_ex1_op1_id}} & mult_ex1_op1_id_offset[3:0];

//for NM*DM,the exponent > 0,but fraction should adjust.
//like NM*NM,we can find first 1 in DM's fraction ,and shift 
//left to make fraction behave normal,but if shift left offset
//is bigger than mult exponent,the exponent <0,we should adjust
//exponent >=0,so we should select shift offset.
// &Force("nonport","mult_ex1_id_lshift_offset"); @269
// &Force("nonport","mult_ex1_id_offset"); @270
//csky vperl_off
assign mult_ex1_id_lshift_offset[3:0] = ($signed({3'b0,mult_ex1_id_offset[3:0]}) >$signed(mult_ex1_mult_expnt_result[6:0]))
                                      ? mult_ex1_mult_expnt_result[3:0]
                                      : mult_ex1_id_offset[3:0];
//csky vperl_on

//----------------------------------------------------------
//                     Shift  Alignment
//----------------------------------------------------------
//1. shift amount preparation 
//      |<-------- 11 --------->|
//      +---+   +---------------+
// C:   | 1 | . |               |
//      +---+   +---------------+---+---+
//              |               | g | r |<------------------- 22  ------------------->|
//              |               +---+---+---+---+   +---------------------------------+
// AXB:         |                       |   |   | . |                                 | G R
//              |                       +---+---+   +---------------------------------+
//              |<------------ 14 ------------->|

// SA : shift alignmnet
// SA  = offset - (e2-(e0+e1))
//     = E0 + E1 - E2 - bias + offset
// for timing consideration and source use,SA is calcuated as follows:
// EX1 stage : 1. calculate  (E0 + E1 -bias) 
//             2. calculate (E0 + E1 - bias)-E2
// EX2 stage : calculate (E0 + E1- E2 - bias) + offset
// &CombBeg; @298
always @( mult_ex1_op2_id
       or mult_ex1_op1_id
       or mult_ex1_op0_id)
begin
  case({mult_ex1_op2_id
       ,mult_ex1_op1_id
       ,mult_ex1_op0_id})
    3'b000 : mult_ex1_offset_adjust[4:0] = 5'he;  //14
    3'b001 : mult_ex1_offset_adjust[4:0] = 5'hf;  //15
    3'b010 : mult_ex1_offset_adjust[4:0] = 5'hf;  //15
    3'b011 : mult_ex1_offset_adjust[4:0] = 5'h10; //16
    3'b100 : mult_ex1_offset_adjust[4:0] = 5'hd;  //13
    3'b101 : mult_ex1_offset_adjust[4:0] = 5'he;  //14
    3'b110 : mult_ex1_offset_adjust[4:0] = 5'he;  //14
    3'b111 : mult_ex1_offset_adjust[4:0] = 5'hf;  //15
    default: mult_ex1_offset_adjust[4:0] = {5{1'bx}};
  endcase
// &CombEnd; @312
end
assign mult_ex1_sa_result[6:0]  = {mult_ex1_mult_expnt_result[6:0]}
                                + {2'b0,mult_ex1_offset_adjust[4:0]}
                                - {2'b0,mult_ex1_op2_expnt[4:0]};
// &CombBeg; @317
// &CombEnd; @326
// &CombBeg; @332
// &CombEnd; @341



//when op2 is denormalized num or zero,the hidden bit is 0
//Note:when op2 is cnan,the result is cnan,result will select abnorm result,so
//shift alignment result has no sense
assign mult_ex1_op2_id_frac[23]   = !mult_ex1_expnt2_zero && dp_xx_ex1_fma;
assign mult_ex1_op2_id_frac[22:0] = mult_ex1_op2_frac[22:0];

//for Timing consideration, EX1 only shift 0~16 bit
assign mult_ex1_op2_shift_pre[36:0] = {mult_ex1_op2_id_frac[23:13],26'b0};
assign mult_ex1_op2_shift_aft[36:0] = mult_ex1_op2_shift_pre[36:0]>> mult_ex1_sa_result[3:0];


//aligned result select
assign mult_ex1_sa_lt_0  = mult_ex1_sa_result[6];
// &Force("nonport","mult_ex1_sa_ge_37"); @364
//csky vperl_off
assign mult_ex1_sa_ge_37 = $signed(mult_ex1_sa_result[6:0]) > 36;
//csky vperl_on

assign mult_ex1_l2_sa_vld = !mult_ex1_sa_lt_0
                         && !mult_ex1_sa_ge_37;
assign mult_ex1_l2_sa_offset[1:0] = (mult_ex1_l2_sa_vld)        
                                  ? mult_ex1_sa_result[5:4]
                                  : 2'b0;
// &CombBeg; @374
always @( mult_ex1_op2_shift_aft[36:0]
       or mult_ex1_sa_lt_0
       or mult_ex1_op2_shift_pre[36:0]
       or mult_ex1_sa_ge_37)
begin
case({mult_ex1_sa_lt_0,mult_ex1_sa_ge_37})
  2'b10  : mult_ex1_op2_shift_result[36:0] = mult_ex1_op2_shift_pre[36:0];
  2'b01  : mult_ex1_op2_shift_result[36:0] = 37'b0;
  default: mult_ex1_op2_shift_result[36:0] = mult_ex1_op2_shift_aft[36:0];
endcase
// &CombEnd; @380
end

//sticky calculation 
//1.  26 <sa < 37 sticky = |frac_shift_out
//2.  sa<=26  
//3.  sa>=37  sa = 0,the result won't be used
// &CombBeg; @386
always @( mult_ex1_op2_id_frac[22:13]
       or mult_ex1_sa_result[5:0])
begin
  case(mult_ex1_sa_result[5:0])
    6'd27: mult_ex1_sticky1 = mult_ex1_op2_id_frac[13];
    6'd28: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[14:13];
    6'd29: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[15:13];
    6'd30: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[16:13];
    6'd31: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[17:13];
    6'd32: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[18:13];
    6'd33: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[19:13];
    6'd34: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[20:13];
    6'd35: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[21:13];
    6'd36: mult_ex1_sticky1 = |mult_ex1_op2_id_frac[22:13];
    default: mult_ex1_sticky1 = 1'b0;
  endcase
// &CombEnd; @400
end

// &CombBeg; @402
always @( mult_ex1_sa_lt_0
       or mult_ex1_op2_id_frac[23:13]
       or mult_ex1_sa_ge_37
       or mult_ex1_sticky1)
begin
case({mult_ex1_sa_lt_0,mult_ex1_sa_ge_37})
  2'b10  : mult_ex1_ex2_sticky1 = 1'b0;
  2'b01  : mult_ex1_ex2_sticky1 = |mult_ex1_op2_id_frac[23:13];
  default: mult_ex1_ex2_sticky1 = mult_ex1_sticky1;
endcase
// &CombEnd; @408
end

//----------------------------------------------------------
//                  Exception Detection
//----------------------------------------------------------
assign mult_ex1_op0_norm = !mult_ex1_op0_zero
                        && !mult_ex1_expnt0_inf
                        && !mult_ex1_op0_cnan;

assign mult_ex1_op1_norm = !mult_ex1_op1_zero
                        && !mult_ex1_expnt1_inf
                        && !mult_ex1_op1_cnan;

assign mult_ex1_op2_norm = !mult_ex1_op2_zero
                        && !mult_ex1_expnt2_inf
                        && !mult_ex1_op2_cnan;


//1. IO exception contain:
//(1) input is sNaN 
//(2) 0*inf /inf*0,except special inst
//(3) denorm *inf / inf*denorm  FM=0,expcept special inst
//(4) for FMA inst: inf - inf  
assign mult_ex1_nv = mult_ex1_op_snan   //sNan
                  || (mult_ex1_op0_zero //0*inf
                     && mult_ex1_op1_inf) 
                  || (mult_ex1_op1_zero //inf*0 
                     && mult_ex1_op0_inf)
                  || (mult_ex1_op0_inf  //inf*F -inf 
                     && mult_ex1_op1_norm
                     && mult_ex1_op2_inf
                     && mult_ex1_sub_vld)
                  || (mult_ex1_op1_inf  //F*inf -inf
                     && mult_ex1_op0_norm
                     && mult_ex1_op2_inf
                     && mult_ex1_sub_vld)
                  || (mult_ex1_op0_inf  //inf*inf -inf
                     && mult_ex1_op1_inf
                     && mult_ex1_op2_inf
                     && mult_ex1_sub_vld);

                      
//2. OF exception: for normal multiply
// single: E0+E1 - bias >=255
// &Force("nonport","mult_ex1_expnt_of"); @452
//csky vperl_off
assign mult_ex1_expnt_of = $signed(mult_ex1_mult_expnt_result[6:0])>30;
//csky vperl_on
                         
assign mult_ex1_of            = !dp_xx_ex1_fma
                              && mult_ex1_expnt_of
                              && mult_ex1_op0_norm
                              && mult_ex1_op1_norm;

//3 UD exception: for normal multiply
// single: E0+E1 - bias < 0
//undeflow will be judged at ex3/ex2

//4. NX exception
assign mult_ex1_nx            = mult_ex1_of;

//5. potential overflow
//single: E0+E1-bias = 31
assign mult_ex1_expnt_potnt_of = (mult_ex1_mult_expnt_result[4:0] == 5'h1e); 

assign mult_ex1_potnt_of       = !dp_xx_ex1_fma
                               && mult_ex1_op0_norm
                               && mult_ex1_op1_norm
                               && mult_ex1_expnt_potnt_of;

assign mult_ex1_expt[4:0]      = {mult_ex1_nv,1'b0,mult_ex1_of,1'b0, mult_ex1_nx};   


//----------------------------------------------------------
//                  Special Result
//----------------------------------------------------------
assign mult_ex1_result_qnan = mult_ex1_op_qnan
                           || mult_ex1_nv;

assign mult_ex1_result_op2  = 
       dp_xx_ex1_fma
    && !mult_ex1_result_qnan
    && mult_ex1_op2_norm
    && (mult_ex1_op0_zero || mult_ex1_op1_zero);

assign mult_ex1_result_inf  = 
    !mult_ex1_result_qnan
 && (mult_ex1_op0_inf || mult_ex1_op1_inf || mult_ex1_op2_inf);

assign mult_ex1_result_zero = 
    !mult_ex1_result_qnan 
    && !dp_xx_ex1_fma
    && (mult_ex1_op0_zero || mult_ex1_op1_zero)
 || !mult_ex1_result_qnan 
    && dp_xx_ex1_fma 
    && mult_ex1_op2_zero
    && (mult_ex1_op0_zero || mult_ex1_op1_zero);

assign mult_ex1_result_abnorm  =  mult_ex1_result_qnan
                               || mult_ex1_result_op2
                               || mult_ex1_result_inf
                               || mult_ex1_result_zero;

assign mult_ex1_op_snan_select  = mult_ex1_op_snan && vfpu_yy_xx_dqnan;
assign mult_ex1_op_qnan_select  = mult_ex1_op_qnan && vfpu_yy_xx_dqnan;

//when contain nan input and DNAN = 0, the result will qNaN,
//the output priority is:
// 1. sNaN > qNaN
// 2. src0 > src1 > src2
assign mult_ex1_op0_qnan_result[22:0] = (mult_ex1_op0_cnan)
                                      ? 23'b0
                                      : {mult_ex1_op0_sign,mult_ex1_op0_frac[8:0],13'b0};
assign mult_ex1_op1_qnan_result[22:0] = (mult_ex1_op1_cnan)
                                      ? 23'b0
                                      : {mult_ex1_op1_sign,mult_ex1_op1_frac[8:0],13'b0};
assign mult_ex1_op2_qnan_result[22:0] = (mult_ex1_op1_cnan)
                                      ? 23'b0
                                      : {mult_ex1_op2_sign,mult_ex1_op2_frac[21:0]};

assign mult_ex1_snan_result[22:0] = (mult_ex1_op0_snan) 
                                 ? {mult_ex1_op0_sign,mult_ex1_op0_frac[8:0],13'b0}
                                 : (mult_ex1_op1_snan)
                                   ? {mult_ex1_op1_sign,mult_ex1_op1_frac[8:0],13'b0}
                                   : {mult_ex1_op2_sign,mult_ex1_op2_frac[21:0]};

assign mult_ex1_qnan_result[22:0] = (mult_ex1_op0_qnan) 
                                 ? mult_ex1_op0_qnan_result[22:0]
                                 : (mult_ex1_op1_qnan)
                                   ? mult_ex1_op1_qnan_result[22:0]
                                   : mult_ex1_op2_qnan_result[22:0];

assign mult_ex1_nan_result[22:0]  = (mult_ex1_op_snan_select)
                                 ? mult_ex1_snan_result[22:0]
                                 : (mult_ex1_op_qnan_select)
                                   ? mult_ex1_qnan_result[22:0]
                                   : 23'b0;

assign mult_ex1_result_op2_sign  = mult_ex1_mult_result_sign
                                 ^ mult_ex1_sub_vld;

assign mult_ex1_result_zero_sign = (mult_ex1_sub_vld)
                                 ? (dp_xx_ex1_rm[2:0] == 3'b10) //RDN
                                 : mult_ex1_mult_result_sign;

assign mult_ex1_result_inf_sign  = 
     mult_ex1_op2_inf && (mult_ex1_mult_result_sign ^ mult_ex1_sub_vld)
 || (mult_ex1_op0_inf|| mult_ex1_op1_inf) && mult_ex1_mult_result_sign;

assign mult_ex1_abnorm_result[15:0] = 
    {16{mult_ex1_result_qnan}}    & {mult_ex1_nan_result[22],6'h3f,mult_ex1_nan_result[21:13]}
  | {16{mult_ex1_result_op2}}     & {mult_ex1_result_op2_sign,mult_ex1_op2_expnt[4:0],mult_ex1_op2_frac[22:13]}
  | {16{mult_ex1_result_inf}}     & {mult_ex1_result_inf_sign,5'h1f,10'b0}
  | {16{mult_ex1_result_zero}}    & {mult_ex1_result_zero_sign,15'b0};


//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
// &Instance("gated_clk_cell", "x_simd_ex1_ex2_gated_clk"); @632
gated_clk_cell  x_simd_ex1_ex2_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (simd_ex1_ex2_pipe_clk),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (simd_ex1_ex2_pipedown),
  .module_en             (cp0_vfpu_icg_en      ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in      (forever_cpuclk        ), @633
//           .external_en (1'b0                 ), @634
//           .global_en   (cp0_yy_clk_en        ), @635
//           .module_en   (cp0_vfpu_icg_en       ), @636
//           .local_en    (simd_ex1_ex2_pipedown), @637
//           .clk_out     (simd_ex1_ex2_pipe_clk)); @638

assign simd_ex1_ex2_pipedown = mult_ex1_ex2_half_pipedown
                            && mult1_simd_halfy_sel;

always @(posedge simd_ex1_ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mult_ex2_mult_expnt_result[6:0]        <= 7'b0;
    mult_ex2_mult_expnt_plus_3_result[6:0] <= 7'b0;
    mult_ex2_fma_expnt_diff[6:0]           <= 7'b0;
    mult_ex2_id_offset[3:0]                <= 4'b0;
    mult_ex2_sub_vld                       <= 1'b0;
    mult_ex2_mult_result_sign              <= 1'b0;
    mult_ex2_op2_expnt[4:0]                <= 5'b0;
    mult_ex2_op2_sign                      <= 1'b0;
    mult_ex2_op2_frac[9:0]                 <= 10'b0;
    mult_ex2_op2_shift_result[36:0]        <= 37'b0;
    mult_ex2_sticky1                       <= 1'b0;
    mult_ex2_expt[4:0]                     <= 5'b0;
    mult_ex2_result_abnorm                 <= 1'b0;
    mult_ex2_abnorm_result[15:0]           <= 16'b0;
    mult_ex2_potnt_of                      <= 1'b0;
    mult_ex2_op_id                         <= 1'b0;
    mult_ex2_op0_id                        <= 1'b0; 
    mult_ex2_op1_id                        <= 1'b0; 
    mult_ex2_op2_id                        <= 1'b0; 
    mult_ex2_mult_frac[21:0]               <= 22'b0;
    mult_ex2_expnt_offset[4:0]             <= 5'b0;
    mult_ex2_sa_result[6:0]                <= 7'b0;
    mult_ex2_simd_half_sel                 <= 1'b0;
    mult_ex2_fmla_ex4_fwd_vld              <= 1'b0;
    mult_ex2_l2_sa_offset[1:0]             <= 2'b0;
  end
  else if(simd_ex1_ex2_pipedown)
  begin
    mult_ex2_mult_expnt_result[6:0]        <= mult_ex1_mult_expnt_result[6:0];
    mult_ex2_mult_expnt_plus_3_result[6:0] <= mult_ex1_mult_expnt_plus_3_result[6:0];
    mult_ex2_fma_expnt_diff[6:0]           <= mult_ex1_fma_expnt_diff[6:0];
    mult_ex2_id_offset[3:0]                <= mult_ex1_id_lshift_offset[3:0];
    mult_ex2_sub_vld                       <= mult_ex1_sub_vld;
    mult_ex2_mult_result_sign              <= mult_ex1_mult_result_sign;
    mult_ex2_op2_expnt[4:0]                <= mult_ex1_op2_expnt[4:0];
    mult_ex2_op2_sign                      <= mult_ex1_op2_sign;
    mult_ex2_op2_frac[9:0]                 <= mult_ex1_op2_frac[22:13];
    mult_ex2_op2_shift_result[36:0]        <= mult_ex1_op2_shift_result[36:0];
    mult_ex2_sticky1                       <= mult_ex1_ex2_sticky1;
    mult_ex2_expt[4:0]                     <= mult_ex1_expt[4:0];
    mult_ex2_result_abnorm                 <= mult_ex1_result_abnorm;
    mult_ex2_abnorm_result[15:0]           <= mult_ex1_abnorm_result[15:0];
    mult_ex2_potnt_of                      <= mult_ex1_potnt_of;
    mult_ex2_op_id                         <= mult_ex1_op_id;
    mult_ex2_op0_id                        <= mult_ex1_op0_id; 
    mult_ex2_op1_id                        <= mult_ex1_op1_id; 
    mult_ex2_op2_id                        <= mult_ex1_op2_id; 
    mult_ex2_mult_frac[21:0]               <= simd_halfy_product[21:0];
    mult_ex2_expnt_offset[4:0]             <= mult_ex1_expnt_offset[4:0];
    mult_ex2_sa_result[6:0]                <= mult_ex1_sa_result[6:0];
    mult_ex2_simd_half_sel                 <= mult1_simd_halfy_sel;
    mult_ex2_fmla_ex4_fwd_vld              <= mult_ex1_fmla_ex4_fwd_vld;
    mult_ex2_l2_sa_offset[1:0]             <= mult_ex1_l2_sa_offset[1:0];
  end
  else
  begin
    mult_ex2_mult_expnt_result[6:0]        <= mult_ex2_mult_expnt_result[6:0];
    mult_ex2_mult_expnt_plus_3_result[6:0] <= mult_ex2_mult_expnt_plus_3_result[6:0];
    mult_ex2_fma_expnt_diff[6:0]           <= mult_ex2_fma_expnt_diff[6:0];
    mult_ex2_id_offset[3:0]                <= mult_ex2_id_offset[3:0];
    mult_ex2_sub_vld                       <= mult_ex2_sub_vld;
    mult_ex2_mult_result_sign              <= mult_ex2_mult_result_sign;
    mult_ex2_op2_expnt[4:0]                <= mult_ex2_op2_expnt[4:0];
    mult_ex2_op2_sign                      <= mult_ex2_op2_sign;
    mult_ex2_op2_frac[9:0]                 <= mult_ex2_op2_frac[9:0];
    mult_ex2_op2_shift_result[36:0]        <= mult_ex2_op2_shift_result[36:0];
    mult_ex2_sticky1                       <= mult_ex2_sticky1;
    mult_ex2_expt[4:0]                     <= mult_ex2_expt[4:0];
    mult_ex2_result_abnorm                 <= mult_ex2_result_abnorm;
    mult_ex2_abnorm_result[15:0]           <= mult_ex2_abnorm_result[15:0];
    mult_ex2_potnt_of                      <= mult_ex2_potnt_of;
    mult_ex2_op_id                         <= mult_ex2_op_id;
    mult_ex2_op0_id                        <= mult_ex1_op0_id; 
    mult_ex2_op1_id                        <= mult_ex1_op1_id; 
    mult_ex2_op2_id                        <= mult_ex1_op2_id; 
    mult_ex2_mult_frac[21:0]               <= mult_ex2_mult_frac[21:0];
    mult_ex2_expnt_offset[4:0]             <= mult_ex2_expnt_offset[4:0];
    mult_ex2_sa_result[6:0]                <= mult_ex2_sa_result[6:0];
    mult_ex2_simd_half_sel                 <= mult_ex2_simd_half_sel;
    mult_ex2_fmla_ex4_fwd_vld              <= mult_ex2_fmla_ex4_fwd_vld;
    mult_ex2_l2_sa_offset[1:0]             <= mult_ex2_l2_sa_offset[1:0];
  end
end
    
//==========================================================
//                    EX2  Stage
//==========================================================
//----------------------------------------------------------
//               Normal Multiply Rounding
//----------------------------------------------------------
//For multiply:
//  (a) NM*DM : exponent > 0 : shift left let first one ahead
//              exponent < 0 : shift right to let exponent 0
//  (b) NM*NM : exponent > 0 : no shift
//              exponent < 0 : shift right to let expnent 0
//  (c) DM*DM : shift right 
//  exponent>0
// &CombBeg; @744
always @( mult_ex2_id_offset[3:0]
       or mult_ex2_mult_frac[21:0])
begin
case(mult_ex2_id_offset[3:0])
  4'd0   :mult_ex2_lshift_result[21:0] = mult_ex2_mult_frac[21:0];
  4'd1   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[20:0],1'b0};
  4'd2   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[19:0],2'b0};
  4'd3   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[18:0],3'b0};
  4'd4   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[17:0],4'b0};
  4'd5   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[16:0],5'b0};
  4'd6   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[15:0],6'b0};
  4'd7   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[14:0],7'b0};
  4'd8   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[13:0],8'b0};
  4'd9   :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[12:0],9'b0};
  4'd10  :mult_ex2_lshift_result[21:0] = {mult_ex2_mult_frac[11:0],10'b0};
  default:mult_ex2_lshift_result[21:0] = 22'b0;
endcase
// &CombEnd; @759
end

// &CombBeg; @761
always @( mult_ex2_mult_frac[21:0]
       or mult_ex2_expnt_offset[4:0])
begin
case(mult_ex2_expnt_offset[4:0])
  5'b11111: begin  //-1
    mult_ex2_rshift_result[21:0] = {1'b0,mult_ex2_mult_frac[21:1]};
    mult_ex2_rshit_out[12:0]     = {12'b0,mult_ex2_mult_frac[0]};
  end
  5'b11110: begin  //-2
    mult_ex2_rshift_result[21:0] = {2'b0,mult_ex2_mult_frac[21:2]};
    mult_ex2_rshit_out[12:0]     = {11'b0,mult_ex2_mult_frac[1:0]};
  end
  5'b11101: begin  //-3
    mult_ex2_rshift_result[21:0] = {3'b0,mult_ex2_mult_frac[21:3]};
    mult_ex2_rshit_out[12:0]     = {10'b0,mult_ex2_mult_frac[2:0]};
  end
  5'b11100: begin  //-4
    mult_ex2_rshift_result[21:0] = {4'b0,mult_ex2_mult_frac[21:4]};
    mult_ex2_rshit_out[12:0]     = {9'b0,mult_ex2_mult_frac[3:0]};
  end
  5'b11011: begin  //-5
    mult_ex2_rshift_result[21:0] = {5'b0,mult_ex2_mult_frac[21:5]};
    mult_ex2_rshit_out[12:0]     = {8'b0,mult_ex2_mult_frac[4:0]};
  end
  5'b11010: begin  //-6
    mult_ex2_rshift_result[21:0] = {6'b0,mult_ex2_mult_frac[21:6]};
    mult_ex2_rshit_out[12:0]     = {7'b0,mult_ex2_mult_frac[5:0]};
  end
  5'b11001: begin  //-7
    mult_ex2_rshift_result[21:0] = {7'b0,mult_ex2_mult_frac[21:7]};
    mult_ex2_rshit_out[12:0]     = {6'b0,mult_ex2_mult_frac[6:0]};
  end
  5'b11000: begin  //-8
    mult_ex2_rshift_result[21:0] = {8'b0,mult_ex2_mult_frac[21:8]};
    mult_ex2_rshit_out[12:0]     = {5'b0,mult_ex2_mult_frac[7:0]};
  end
  5'b10111: begin  //-9
    mult_ex2_rshift_result[21:0] = {9'b0,mult_ex2_mult_frac[21:9]};
    mult_ex2_rshit_out[12:0]     = {4'b0,mult_ex2_mult_frac[8:0]};
  end
  5'b10110: begin  //-10
    mult_ex2_rshift_result[21:0] = {10'b0,mult_ex2_mult_frac[21:10]};
    mult_ex2_rshit_out[12:0]     = {3'b0,mult_ex2_mult_frac[9:0]};
  end
  5'b10101: begin  //-11
    mult_ex2_rshift_result[21:0] = {11'b0,mult_ex2_mult_frac[21:11]};
    mult_ex2_rshit_out[12:0]     = {2'b0,mult_ex2_mult_frac[10:0]};
  end
  5'b10100: begin  //-12
    mult_ex2_rshift_result[21:0] = {12'b0,mult_ex2_mult_frac[21:12]};
    mult_ex2_rshit_out[12:0]     = {1'b0,mult_ex2_mult_frac[11:0]};
  end
  5'b10011: begin  //-13
    mult_ex2_rshift_result[21:0] = {13'b0,mult_ex2_mult_frac[21:13]};
    mult_ex2_rshit_out[12:0]     = mult_ex2_mult_frac[12:0];
  end
  default:begin
    mult_ex2_rshift_result[21:0] = 22'b0;
    mult_ex2_rshit_out[12:0]     = {12'b0,{|mult_ex2_mult_frac[21:0]}};
  end
endcase
// &CombEnd; @820
end

assign mult_ex2_rshift_sel  = mult_ex2_mult_expnt_result[6]
                           || (~|mult_ex2_mult_expnt_result[6:0]) && !mult_ex2_op_id;

assign mult_ex2_mult_frac_shift[21:0] = (mult_ex2_rshift_sel)     
                                      ? mult_ex2_rshift_result[21:0]
                                      : mult_ex2_lshift_result[21:0];

assign mult_ex2_mult_expnt_shift[6:0] = (mult_ex2_rshift_sel)   
                                      ? 7'b0
                                      : (mult_ex2_mult_expnt_result[6:0] - {3'b0,mult_ex2_id_offset[3:0]});
    
assign mult_ex2_mult_rshift_sticky    = (mult_ex2_rshift_sel)
                                      ? |mult_ex2_rshit_out[12:0]
                                      : 1'b0; 

//----------------------------------------------------------
//                  Normal Multiply Rounding
//----------------------------------------------------------
//frac reuslt lsb:
assign mult_ex2_rst_lsb   = (mult_ex2_mult_frac_shift[21])
                          ? mult_ex2_mult_frac_shift[11]
                          : mult_ex2_mult_frac_shift[10];

//frac result guard bit
assign mult_ex2_rst_gbit  = (mult_ex2_mult_frac_shift[21])
                          ? mult_ex2_mult_frac_shift[10]
                          : mult_ex2_mult_frac_shift[9];

//frac result sticky bit contain:
//1. round bit
//2. sticky bit
assign mult_ex2_rst_rsbit = (mult_ex2_mult_frac_shift[21])
                          ? |mult_ex2_mult_frac_shift[9:0] || mult_ex2_mult_rshift_sticky
                          : |mult_ex2_mult_frac_shift[8:0] || mult_ex2_mult_rshift_sticky;
                                      
//greate than 1000.....
assign mult_ex2_gr      = mult_ex2_rst_gbit
                       && mult_ex2_rst_rsbit;
//Equal to 1000...
assign mult_ex2_eq      = mult_ex2_rst_gbit
                       && !mult_ex2_rst_rsbit;

//Equal to 0
assign mult_ex2_zero    = !mult_ex2_rst_gbit
                       && !mult_ex2_rst_rsbit;

//the round selct signal
// &CombBeg; @869
always @( mult_ex2_eq
       or mult_ex2_zero
       or mult_ex2_rst_lsb
       or dp_xx_ex2_rm[2:0]
       or mult_ex2_gr
       or mult_ex2_mult_result_sign)
begin
  case(dp_xx_ex2_rm[2:0])
    3'b000 :  //round to nearest
             mult_ex2_add1   = mult_ex2_gr || (mult_ex2_eq && mult_ex2_rst_lsb);
    3'b001 :  //round to zero 
             mult_ex2_add1   = 1'b0;
    3'b010 :  //round to positive infinity
             mult_ex2_add1   = !mult_ex2_zero && mult_ex2_mult_result_sign;
    3'b011 :  //round to negative infinity
             mult_ex2_add1   = !mult_ex2_zero && !mult_ex2_mult_result_sign;
    3'b100 :  //round to nearest, ties to magnitude
             mult_ex2_add1   = mult_ex2_gr || mult_ex2_eq;
    default: mult_ex2_add1   = 1'b0;
  endcase
// &CombEnd; @883
end

assign mult_ex2_mult_frac_round_op0[11:0] = mult_ex2_mult_frac_shift[21:10];
assign mult_ex2_mult_frac_round_op1[11:0] = {10'b0,mult_ex2_mult_frac_shift[21],!mult_ex2_mult_frac_shift[21]};

assign mult_ex2_mult_frac_round_result[11:0] = mult_ex2_mult_frac_round_op0[11:0]
                                             + mult_ex2_mult_frac_round_op1[11:0];
                                             

//the expont will add 1:
//1. when signle frac_result[47] is 1,exponent will add 1
//2. when round result generate carry,exponent will add 1
//3. when generate exponte zero,exponent will add 1
assign mult_ex2_expnt_plus1             = mult_ex2_mult_frac_shift[21] && !mult_ex2_op_id
                                       || mult_ex2_mult_frac_result[11] && !mult_ex2_op_id
                                       || !mult_ex2_mult_frac_shift[21]
                                          && !((|mult_ex2_mult_expnt_shift[6:0]) && !mult_ex2_op_id) 
                                          && mult_ex2_mult_frac_result[10]
                                          && !mult_ex2_mult_frac_result[11];

assign mult_ex2_expnt_plus2             = mult_ex2_op_id
                                       && !mult_ex2_rshift_sel
                                       && mult_ex2_mult_frac_result[11]; 

assign mult_ex2_expnt_plus1_result[6:0] = mult_ex2_mult_expnt_shift[6:0] + 7'b1;
assign mult_ex2_expnt_plus2_result[6:0] = mult_ex2_mult_expnt_shift[6:0] + 7'b10;

assign mult_ex2_mult_frac_result[11:0]  = (mult_ex2_add1)
                                        ? mult_ex2_mult_frac_round_result[11:0]
                                        : mult_ex2_mult_frac_shift[21:10];

assign mult_ex2_frac_10[9:0]            = (mult_ex2_mult_frac_result[11])
                                        ? mult_ex2_mult_frac_result[10:1]
                                        : mult_ex2_mult_frac_result[9:0];

assign mult_ex2_expnt_final_result[6:0] = (mult_ex2_expnt_plus2)
                                        ? mult_ex2_expnt_plus2_result[6:0]
                                        : (mult_ex2_expnt_plus1)
                                          ? mult_ex2_expnt_plus1_result[6:0]
                                          : mult_ex2_mult_expnt_shift[6:0];

//----------------------------------------------------------
//               Normal Multiply Exception
//----------------------------------------------------------
assign mult_ex2_of = mult_ex2_potnt_of 
                   && mult_ex2_mult_frac_result[11]
                   && !mult_ex2_result_abnorm
                   && !dp_xx_ex2_fma;

assign mult_ex2_uf =  (mult_ex2_mult_expnt_shift[6:0] == 7'b0)
                   && !(|mult_ex2_mult_frac_result[11:10])
                   && !mult_ex2_result_abnorm
                   && !dp_xx_ex2_fma
                   && !mult_ex2_zero; 

assign mult_ex2_nx = mult_ex2_of 
                  || mult_ex2_uf
                  || !mult_ex2_result_abnorm
                     && !mult_ex2_zero
                     && !dp_xx_ex2_fma;

assign mult_ex2_mult_expt[4:3] = mult_ex2_expt[4:3];                      
assign mult_ex2_mult_expt[2]   = mult_ex2_expt[2] | mult_ex2_of;
assign mult_ex2_mult_expt[1]   = (mult_ex2_expt[1] | mult_ex2_uf); 
assign mult_ex2_mult_expt[0]   = mult_ex2_expt[0] | mult_ex2_nx;

//----------------------------------------------------------
//               Normal Multiply Output
//----------------------------------------------------------
// &CombBeg; @952
always @( dp_xx_ex2_rm[2:0]
       or mult_ex2_mult_result_sign)
begin
  case(dp_xx_ex2_rm[2:0])
    3'b000 : mult_ex2_of_result_lfn  = 1'b0;
    3'b001 : mult_ex2_of_result_lfn  = 1'b1;
    3'b010 : mult_ex2_of_result_lfn  = !mult_ex2_mult_result_sign;
    3'b011 : mult_ex2_of_result_lfn  = mult_ex2_mult_result_sign;
    3'b100 : mult_ex2_of_result_lfn  = 1'b0;
    default: mult_ex2_of_result_lfn  = 1'bx;
  endcase
// &CombEnd; @961
end

assign mult_ex2_result_mask      = (dp_mult_op2_slicex_vl_halfy_mask
                                    || dp_mult_op2_slicex_vm_halfy_mask)
                                 && dp_xx_ex2_simd;

assign mult_ex2_mult_result_inf  = mult_ex2_mult_expt[2]
                                && !mult_ex2_of_result_lfn
                                && !mult_ex2_result_mask;

assign mult_ex2_mult_result_lfn  = mult_ex2_mult_expt[2]
                                 && mult_ex2_of_result_lfn
                                 && !mult_ex2_result_mask;

assign mult_ex2_mult_result_norm = !mult_ex2_result_abnorm
                                && !mult_ex2_mult_result_inf
                                && !mult_ex2_mult_result_lfn
                                && !mult_ex2_result_mask;

assign mult_ex2_mult_result_abnorm = mult_ex2_result_abnorm
                                 && !mult_ex2_result_mask;

//prepare the results value
assign mult_ex2_rst_abnorm[15:0] = mult_ex2_abnorm_result[15:0];
assign mult_ex2_rst_inf[15:0]    = {mult_ex2_mult_result_sign,5'h1f,10'b0};
assign mult_ex2_rst_lfn[15:0]    = {mult_ex2_mult_result_sign,5'h1e,{10{1'b1}}};
assign mult_ex2_rst_norm[15:0]   = {mult_ex2_mult_result_sign ,mult_ex2_expnt_final_result[4:0],mult_ex2_frac_10[9:0]};
assign mult_ex2_rst_masked[15:0] = 16'b0;


//result_back
// &CombBeg; @1000
always @( mult_ex2_rst_inf[15:0]
       or mult_ex2_mult_result_abnorm
       or mult_ex2_rst_masked[15:0]
       or mult_ex2_mult_result_norm
       or mult_ex2_mult_result_inf
       or mult_ex2_rst_lfn[15:0]
       or mult_ex2_rst_norm[15:0]
       or mult_ex2_result_mask
       or mult_ex2_rst_abnorm[15:0]
       or mult_ex2_mult_result_lfn)
begin
  case({mult_ex2_result_mask
     , mult_ex2_mult_result_abnorm
     , mult_ex2_mult_result_inf
     , mult_ex2_mult_result_lfn
     , mult_ex2_mult_result_norm})
     5'b10000: mult_ex2_mult_result[15:0] = mult_ex2_rst_masked[15:0];
     5'b01000: mult_ex2_mult_result[15:0] = mult_ex2_rst_abnorm[15:0];
     5'b00100: mult_ex2_mult_result[15:0] = mult_ex2_rst_inf[15:0];
     5'b00010: mult_ex2_mult_result[15:0] = mult_ex2_rst_lfn[15:0];
     5'b00001: mult_ex2_mult_result[15:0] = mult_ex2_rst_norm[15:0];
     default: mult_ex2_mult_result[15:0] = {16{1'bx}};
   endcase
// &CombEnd; @1013
end
assign mult_ex2_mult_mask      = dp_xx_ex2_half && mult_ex2_simd_half_sel && !mult_ex2_result_mask;
assign halfy_mult_result[15:0] = mult_ex2_mult_result[15:0];
assign halfy_mult_expt[4:0]    = mult_ex2_mult_expt[4:0] & {5{mult_ex2_mult_mask}};


//----------------------------------------------------------
//                   FMA Fraction Add
//----------------------------------------------------------
// &CombBeg; @1028
always @( mult_ex2_op2_shift_result[36:0]
       or mult_ex2_l2_sa_offset[1:0])
begin
case(mult_ex2_l2_sa_offset[1:0])
  2'b00  : mult_ex2_sa_op2[36:0] = mult_ex2_op2_shift_result[36:0];
  2'b01  : mult_ex2_sa_op2[36:0] = {16'b0,mult_ex2_op2_shift_result[36:16]};
  2'b10  : mult_ex2_sa_op2[36:0] = {32'b0,mult_ex2_op2_shift_result[36:32]};
  default: mult_ex2_sa_op2[36:0] = {37{1'bx}};
endcase
// &CombEnd; @1035
end

assign mult2_ex2_addr0[38:0]              = {14'b0,mult_ex2_mult_frac[21:0],3'b0}; 
assign mult2_ex2_addr1[38:0]              = (mult_ex2_sub_vld)
                                          ? ~{1'b0,mult_ex2_sa_op2[36:0],mult_ex2_sticky1}
                                          : {1'b0,mult_ex2_sa_op2[36:0],mult_ex2_sticky1};
assign mult_ex2_addr_result[38:0]         = mult2_ex2_addr0[38:0] + mult2_ex2_addr1[38:0];
assign mult_ex2_addr_plus_1_result[38:0]  = mult2_ex2_addr0[38:0] + mult2_ex2_addr1[38:0] + 1'b1;

//the FMA result can be:
//1. Add operation: choose a+b as result
//2. Sub operation and a>=b,choose a+b+1 as result
//3. Sub operation and a<b, choose ~(a+b) as result
assign mult_ex2_frac_result_add    = !mult_ex2_sub_vld;
assign mult_ex2_frac_result_negate = mult_ex2_addr_plus_1_result[38]  && mult_ex2_sub_vld;
assign mult_ex2_frac_result_sub    = !mult_ex2_addr_plus_1_result[38] && mult_ex2_sub_vld;

// &CombBeg; @1052
always @( mult_ex2_addr_result[37:0]
       or mult_ex2_frac_result_sub
       or mult_ex2_frac_result_negate
       or mult_ex2_addr_plus_1_result[37:0]
       or mult_ex2_frac_result_add)
begin
  case({mult_ex2_frac_result_add,
        mult_ex2_frac_result_negate,
        mult_ex2_frac_result_sub})
    3'b100:  mult_ex2_frac_result[37:0] = mult_ex2_addr_result[37:0];
    3'b010:  mult_ex2_frac_result[37:0] = ~mult_ex2_addr_result[37:0];
    3'b001:  mult_ex2_frac_result[37:0] = mult_ex2_addr_plus_1_result[37:0];
    default: mult_ex2_frac_result[37:0] = {38{1'bx}};
  endcase
// &CombEnd; @1061
end

assign mult_ex2_expnt_diff_ge_neg2      = &mult_ex2_fma_expnt_diff[6:1]
                                       || !mult_ex2_fma_expnt_diff[6];  
assign mult_ex2_frac_shift_11           = mult_ex2_expnt_diff_ge_neg2;
assign mult_ex2_frac_result_shift[37:0] = (mult_ex2_frac_shift_11)
                                        ? {mult_ex2_frac_result[26:0],11'b0}
                                        : mult_ex2_frac_result[37:0];

//----------------------------------------------------------
//                  Leading Zero Anticipation
//----------------------------------------------------------
assign mult_ex2_lza_summand[23:0] = (mult_ex2_expnt_diff_ge_neg2)
                                  ? {2'b0,mult_ex2_mult_frac[21:0]}
                                  : {13'b0,mult_ex2_mult_frac[21:11]};
assign mult_ex2_lza_addend[23:0]  = (mult_ex2_expnt_diff_ge_neg2)
                                  ? mult2_ex2_addr1[26:3]
                                  : mult2_ex2_addr1[37:14];

// &Instance("ct_vfmau_lza_simd_half","x_ct_vfmau_lza_simd_half"); @1080
ct_vfmau_lza_simd_half  x_ct_vfmau_lza_simd_half (
  .addend                   (mult_ex2_lza_addend     ),
  .lza_result               (mult_ex2_lza_result     ),
  .lza_result_zero          (mult_ex2_lza_result_zero),
  .sub_vld                  (mult_ex2_sub_vld        ),
  .summand                  (mult_ex2_lza_summand    )
);

// &Connect(.summand           (mult_ex2_lza_summand      ), @1081
//          .addend            (mult_ex2_lza_addend       ), @1082
//          .lza_result        (mult_ex2_lza_result       ), @1083
//          .sub_vld           (mult_ex2_sub_vld          ), @1084
//          .lza_result_zero   (mult_ex2_lza_result_zero  )); @1085

//----------------------------------------------------------
//                 FMA Data Preparation 
//----------------------------------------------------------
assign mult_ex2_fma_sign = mult_ex2_mult_result_sign
                         ^ mult_ex2_frac_result_negate; 

//expont prepare                          
assign mult_ex2_op2_expnt_adjust[6:0] = (mult_ex2_op2_id)
                                      ? 7'b1
                                      : {2'b0,mult_ex2_op2_expnt[4:0]};
assign mult_ex2_op2_expnt_bias[6:0]   = (mult_ex2_sa_result[6])
                                      ? 7'b0
                                      : mult_ex2_sa_result[6:0];                                           
assign mult_ex2_fma_op2_expnt[6:0]    = mult_ex2_op2_expnt_adjust[6:0]
                                      + mult_ex2_op2_expnt_bias[6:0]; 

// &CombBeg; @1103
always @( mult_ex2_op1_id
       or mult_ex2_op0_id)
begin
case({mult_ex2_op0_id,mult_ex2_op1_id})
  2'b11  : mult_ex2_mult_id_adjust[6:0] = 7'b10;
  2'b10  : mult_ex2_mult_id_adjust[6:0] = 7'b01;
  2'b01  : mult_ex2_mult_id_adjust[6:0] = 7'b01;
  2'b00  : mult_ex2_mult_id_adjust[6:0] = 7'b00; 
  default: mult_ex2_mult_id_adjust[6:0] = {7{1'bx}};
endcase
// &CombEnd; @1111
end

assign mult_ex2_fma_mult_expnt[6:0] = mult_ex2_mult_expnt_plus_3_result[6:0]
                                    + mult_ex2_mult_id_adjust[6:0];

assign mult_ex2_fma_expnt[6:0] = (mult_ex2_expnt_diff_ge_neg2)
                               ? mult_ex2_fma_mult_expnt[6:0]
                               : mult_ex2_fma_op2_expnt[6:0];


//----------------------------------------------------------
//                 Special Result
//----------------------------------------------------------
assign mult_ex2_fma_result_abnorm       = mult_ex2_result_abnorm
                                       || mult_ex2_result_mask;
assign mult_ex2_fma_abnorm_result[15:0] = (mult_ex2_result_mask)
                                        ? mult_ex2_rst_masked[15:0]
                                        : mult_ex2_abnorm_result[15:0];

assign mult_ex2_fma_expt[4:0]           = mult_ex2_expt[4:0] & {5{~mult_ex2_result_mask}};

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_simd_ex2_ex3_gated_clk"); @1135
gated_clk_cell  x_simd_ex2_ex3_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (simd_ex2_ex3_pipe_clk),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (simd_ex2_ex3_pipedown),
  .module_en             (cp0_vfpu_icg_en      ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

//  &Connect(.clk_in      (forever_cpuclk       ), @1136
//           .external_en (1'b0                 ), @1137
//           .global_en   (cp0_yy_clk_en        ), @1138
//           .module_en   (cp0_vfpu_icg_en       ), @1139
//           .local_en    (simd_ex2_ex3_pipedown), @1140
//           .clk_out     (simd_ex2_ex3_pipe_clk)); @1141

assign simd_ex2_ex3_pipedown = mult_ex2_ex3_half_pipedown
                            && mult_ex2_simd_half_sel;

always @(posedge simd_ex2_ex3_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mult_ex3_expnt_result[6:0]   <= 7'b0;
    mult_ex3_expt[4:0]           <= 5'b0;
    mult_ex3_sticky1             <= 1'b0;
    mult_ex3_fma_sign            <= 1'b0;
    mult_ex3_frac_result[37:0]   <= 38'b0;
    mult_ex3_sub_vld             <= 1'b0;
    mult_ex3_lza_result[4:0]     <= 5'b0;
    mult_ex3_result_abnorm       <= 1'b0;
    mult_ex3_abnorm_result[15:0] <= 16'b0;
    mult_ex3_lza_result_zero     <= 1'b0;
    mult_ex3_simd_half_sel       <= 1'b0;
  end
  else if(simd_ex2_ex3_pipedown)
  begin
    mult_ex3_expnt_result[6:0]   <= mult_ex2_fma_expnt[6:0];
    mult_ex3_expt[4:0]           <= mult_ex2_fma_expt[4:0];
    mult_ex3_sticky1             <= mult_ex2_sticky1;
    mult_ex3_fma_sign            <= mult_ex2_fma_sign;
    mult_ex3_frac_result[37:0]   <= mult_ex2_frac_result_shift[37:0];
    mult_ex3_sub_vld             <= mult_ex2_sub_vld;
    mult_ex3_lza_result[4:0]     <= mult_ex2_lza_result[4:0];
    mult_ex3_result_abnorm       <= mult_ex2_fma_result_abnorm;
    mult_ex3_abnorm_result[15:0] <= mult_ex2_fma_abnorm_result[15:0];
    mult_ex3_lza_result_zero     <= mult_ex2_lza_result_zero;
    mult_ex3_simd_half_sel       <= mult_ex2_simd_half_sel;
  end
  else
  begin
    mult_ex3_expnt_result[6:0]   <= mult_ex3_expnt_result[6:0];
    mult_ex3_expt[4:0]           <= mult_ex3_expt[4:0];
    mult_ex3_sticky1             <= mult_ex3_sticky1;
    mult_ex3_fma_sign            <= mult_ex3_fma_sign;
    mult_ex3_frac_result[37:0]   <= mult_ex3_frac_result[37:0];
    mult_ex3_sub_vld             <= mult_ex3_sub_vld;
    mult_ex3_lza_result[4:0]     <= mult_ex3_lza_result[4:0];
    mult_ex3_result_abnorm       <= mult_ex3_result_abnorm;
    mult_ex3_abnorm_result[15:0] <= mult_ex3_abnorm_result[15:0];
    mult_ex3_lza_result_zero     <= mult_ex3_lza_result_zero;
    mult_ex3_simd_half_sel       <= mult_ex3_simd_half_sel;
  end
end

//==========================================================
//                    EX3  Stage
//==========================================================
//----------------------------------------------------------
//            Fused Multiply-Add Normalization
//----------------------------------------------------------
//1. normalized shift
// &CombBeg; @1199
always @( mult_ex3_lza_result[4:0]
       or mult_ex3_frac_result[37:0])
begin
case(mult_ex3_lza_result[4:0])
  5'd0   : mult_ex3_fma_norm_result[37:0] = mult_ex3_frac_result[37:0];
  5'd1   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[36:0],1'b0};
  5'd2   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[35:0],2'b0};
  5'd3   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[34:0],3'b0};
  5'd4   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[33:0],4'b0};
  5'd5   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[32:0],5'b0};
  5'd6   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[31:0],6'b0};
  5'd7   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[30:0],7'b0};
  5'd8   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[29:0],8'b0};
  5'd9   : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[28:0],9'b0};
  5'd10  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[27:0],10'b0};
  5'd11  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[26:0],11'b0};
  5'd12  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[25:0],12'b0};
  5'd13  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[24:0],13'b0};
  5'd14  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[23:0],14'b0};
  5'd15  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[22:0],15'b0};
  5'd16  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[21:0],16'b0};
  5'd17  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[20:0],17'b0};
  5'd18  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[19:0],18'b0};
  5'd19  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[18:0],19'b0};
  5'd20  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[17:0],20'b0};
  5'd21  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[16:0],21'b0};
  5'd22  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[15:0],22'b0};
  5'd23  : mult_ex3_fma_norm_result[37:0] = {mult_ex3_frac_result[14:0],23'b0};
  default: mult_ex3_fma_norm_result[37:0] = 38'b0;
endcase
// &CombEnd; @1227
end

// &CombBeg; @1229
always @( mult_ex3_expnt_result[4:0]
       or mult_ex3_frac_result[37:0])
begin
case(mult_ex3_expnt_result[4:0])
  5'd0   : mult_ex3_fma_expnt_shift[37:0] = {1'b0,mult_ex3_frac_result[37:1]};
  5'd1   : mult_ex3_fma_expnt_shift[37:0] = mult_ex3_frac_result[37:0];
  5'd2   : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[36:0],1'b0};
  5'd3   : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[35:0],2'b0};
  5'd4   : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[34:0],3'b0};
  5'd5   : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[33:0],4'b0};
  5'd6   : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[32:0],5'b0};
  5'd7   : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[31:0],6'b0};
  5'd8   : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[30:0],7'b0};
  5'd9   : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[29:0],8'b0};
  5'd10  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[28:0],9'b0};
  5'd11  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[27:0],10'b0};
  5'd12  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[26:0],11'b0};
  5'd13  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[25:0],12'b0};
  5'd14  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[24:0],13'b0};
  5'd15  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[23:0],14'b0};
  5'd16  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[22:0],15'b0};
  5'd17  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[21:0],16'b0};
  5'd18  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[20:0],17'b0};
  5'd19  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[19:0],18'b0};
  5'd20  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[18:0],19'b0};
  5'd21  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[17:0],20'b0};
  5'd22  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[16:0],21'b0};
  5'd23  : mult_ex3_fma_expnt_shift[37:0] = {mult_ex3_frac_result[15:0],22'b0};
  default: mult_ex3_fma_expnt_shift[37:0] = 38'b0;
endcase
// &CombEnd; @1257
end

assign mult_ex3_expnt_adder0[6:0]    = mult_ex3_expnt_result[6:0];
assign mult_ex3_expnt_adder1[6:0]    = (mult_ex3_lza_result_zero)
                                     ? 7'h18 //24
                                     : {2'h0,mult_ex3_lza_result[4:0]};
assign mult_ex3_expnt_lza_shift[6:0] = mult_ex3_expnt_adder0[6:0]
                                     - mult_ex3_expnt_adder1[6:0];
                                       
assign mult_ex3_expnt_is_0           = ~(|mult_ex3_expnt_result[6:0]);
assign mult_ex3_expnt_is_1           = ~(|mult_ex3_expnt_result[6:1])
                                     && mult_ex3_expnt_result[0];
assign mult_ex3_expnt_eq_lza_plus1   = ~(|mult_ex3_expnt_lza_shift[6:1])
                                     && mult_ex3_expnt_lza_shift[0];
assign mult_ex3_expnt_le_lza         = mult_ex3_expnt_lza_shift[6]
                                    || ~(|mult_ex3_expnt_lza_shift[6:0]); 

// The following conditions will select exponent as shift index
// 1. E <= lza
// 2. E == lza+1 but there is 1-bit prediciton error for lza result
// 3. E == 1
assign mult_ex3_exp_shift_sel = mult_ex3_expnt_le_lza
                             || mult_ex3_expnt_eq_lza_plus1 && !mult_ex3_fma_norm_result[37]
                             || mult_ex3_expnt_is_1;

assign mult_ex3_fma_norm_shift[37:0] = (mult_ex3_fma_norm_result[37])
                                     ? mult_ex3_fma_norm_result[37:0]
                                     : {mult_ex3_fma_norm_result[36:0],1'b0};
assign mult_ex3_fma_frac[37:0]       = (mult_ex3_exp_shift_sel)
                                     ? mult_ex3_fma_expnt_shift[37:0]
                                     : mult_ex3_fma_norm_shift[37:0];

assign mult_ex3_rst_lsb   = mult_ex3_fma_frac[27];
assign mult_ex3_rst_gbit  = mult_ex3_fma_frac[26];
assign mult_ex3_rst_rsbit = (|mult_ex3_fma_frac[25:0]) 
                         || mult_ex3_sticky1
                         || (mult_ex3_expnt_is_0 && mult_ex3_frac_result[0] && !mult_ex3_exp_shift_sel);

assign mult_ex3_rst_gr   = mult_ex3_rst_gbit && mult_ex3_rst_rsbit;
assign mult_ex3_rst_ge   = mult_ex3_rst_gbit;
assign mult_ex3_grs_zero = !mult_ex3_rst_gbit && !mult_ex3_rst_rsbit;

assign mult_ex3_rst_add1 = 
    (dp_xx_ex3_rm[2:0] == 3'b000) & mult_ex3_rst_gr 
  | (dp_xx_ex3_rm[2:0] == 3'b000) & (mult_ex3_rst_ge && mult_ex3_rst_lsb) //for timing
  | (dp_xx_ex3_rm[2:0] == 3'b010) & (!mult_ex3_grs_zero && mult_ex3_fma_sign)
  | (dp_xx_ex3_rm[2:0] == 3'b011) & (!mult_ex3_grs_zero && !mult_ex3_fma_sign)
  | (dp_xx_ex3_rm[2:0] == 3'b100) & mult_ex3_rst_ge;  


assign mult_ex3_fma_frac_round_add[11:0]    = {1'b0,mult_ex3_fma_frac[37:27]} + 1'b1;
assign mult_ex3_fma_frac_round_result[10:0] = (&mult_ex3_fma_frac[37:27])
                                            ? mult_ex3_fma_frac_round_add[11:1]
                                            : mult_ex3_fma_frac_round_add[10:0];

assign mult_ex3_fma_frac_result[10:0] = (mult_ex3_rst_add1)
                                      ? mult_ex3_fma_frac_round_result[10:0]
                                      : mult_ex3_fma_frac[37:27];

//expont calculate
assign mult_ex3_fma_expnt_result[6:0]    = (mult_ex3_exp_shift_sel)
                                         ? {6'b0,!mult_ex3_expnt_is_0}
                                         : mult_ex3_expnt_lza_shift[6:0];
assign mult_ex3_fma_expnt_m1_result[6:0] = mult_ex3_fma_expnt_result[6:0] + 7'b1111111;
assign mult_ex3_fma_expnt_p1_result[6:0] = mult_ex3_fma_expnt_result[6:0] + 7'b1;

assign mult_ex3_fma_expnt_m1 = (mult_ex3_exp_shift_sel
                               && !mult_ex3_expnt_is_0
                               && !mult_ex3_fma_frac_result[10])
                            || (!mult_ex3_exp_shift_sel
                                && !mult_ex3_fma_norm_result[37]);

assign mult_ex3_fma_expnt_p1 = (mult_ex3_exp_shift_sel
                                && mult_ex3_rst_add1
                                && mult_ex3_fma_frac_round_add[11])
                            || (!mult_ex3_exp_shift_sel
                                && mult_ex3_rst_add1
                                && mult_ex3_fma_frac_round_add[11]);


// &CombBeg; @1337
always @( mult_ex3_fma_expnt_m1
       or mult_ex3_fma_expnt_p1_result[6:0]
       or mult_ex3_fma_expnt_result[6:0]
       or mult_ex3_fma_expnt_m1_result[6:0]
       or mult_ex3_fma_expnt_p1)
begin
case({mult_ex3_fma_expnt_m1,mult_ex3_fma_expnt_p1})
  2'b00  : mult_ex3_fma_expnt[6:0] = mult_ex3_fma_expnt_result[6:0];
  2'b01  : mult_ex3_fma_expnt[6:0] = mult_ex3_fma_expnt_p1_result[6:0]; 
  2'b10  : mult_ex3_fma_expnt[6:0] = mult_ex3_fma_expnt_m1_result[6:0]; 
  2'b11  : mult_ex3_fma_expnt[6:0] = mult_ex3_fma_expnt_result[6:0];
 default : mult_ex3_fma_expnt[6:0] = {7{1'bx}};
endcase 
// &CombEnd;                                 @1345
end

assign mult_ex3_expnt_of     = !mult_ex3_fma_expnt_result[6]
                            && mult_ex3_fma_expnt_result[5]
                            && !mult_ex3_result_abnorm
                            && !mult_ex3_result_zero;

assign mult_ex3_potnt_sub_of = (mult_ex3_fma_expnt_result[6:0] == 7'h1f)
                            && !mult_ex3_result_abnorm
                            && !mult_ex3_result_zero;
                                
assign mult_ex3_potnt_add_of = (mult_ex3_fma_expnt_result[6:0] == 7'h1e)
                            && !mult_ex3_result_abnorm
                            && !mult_ex3_result_zero;
                                
//1. Exp>=256
//2. Exp == 255 && !exp_sub1
//3. Exp == 254 && exp_plus1
assign mult_ex3_fma_expnt_of = mult_ex3_expnt_of
                            || mult_ex3_potnt_sub_of 
                               && (!mult_ex3_fma_expnt_m1
                                   || mult_ex3_fma_expnt_m1
                                      && mult_ex3_fma_expnt_p1)
                            || mult_ex3_potnt_add_of 
                               && !mult_ex3_fma_expnt_m1 
                               && mult_ex3_fma_expnt_p1;
                                   
//UF exception
assign mult_ex3_potnt_add_uf = ~(|mult_ex3_fma_expnt_result[6:0])
                                 && !mult_ex3_fma_expnt_p1
                              || ~(|mult_ex3_fma_expnt_result[6:1])
                                 && mult_ex3_fma_expnt_result[0]                                
                                 && !mult_ex3_fma_expnt_p1
                                 && !mult_ex3_fma_frac_result[10];

assign mult_ex3_potnt_sub_uf = ~(|mult_ex3_fma_expnt_result[6:1])
                              && mult_ex3_fma_expnt_result[0] 
                              && !mult_ex3_fma_expnt_p1
                              && mult_ex3_fma_expnt_m1;

assign mult_ex3_fma_expnt_uf = (mult_ex3_potnt_add_uf
                               || mult_ex3_potnt_sub_uf)
                            && !mult_ex3_result_abnorm
                            && !mult_ex3_result_zero
                            && !mult_ex3_grs_zero;

//NX exception                              
assign mult_ex3_frac_nx       = !mult_ex3_result_abnorm && !mult_ex3_grs_zero;
assign mult_ex3_fma_expnt_nx  = mult_ex3_fma_expnt_of
                             || mult_ex3_fma_expnt_uf
                             || mult_ex3_frac_nx;

assign mult_ex3_expt_result[4:0] = mult_ex3_expt[4:0] 
                                | {2'b0,mult_ex3_fma_expnt_of,mult_ex3_fma_expnt_uf,mult_ex3_fma_expnt_nx};

//----------------------------------------------------------
//                    FMA Special Result
//----------------------------------------------------------
//overflow round
// &CombBeg; @1404
always @( dp_xx_ex3_rm[2:0]
       or mult_ex3_fma_sign)
begin
  case(dp_xx_ex3_rm[2:0])
    3'b000:  mult_ex3_fma_of_result_lfn  = 1'b0;
    3'b001:  mult_ex3_fma_of_result_lfn  = 1'b1;
    3'b010:  mult_ex3_fma_of_result_lfn  = !mult_ex3_fma_sign;
    3'b011:  mult_ex3_fma_of_result_lfn  = mult_ex3_fma_sign;
    3'b100:  mult_ex3_fma_of_result_lfn  = 1'b0;
    default: mult_ex3_fma_of_result_lfn = 1'bx;
  endcase
// &CombEnd; @1413
end

//the inf/lfn result can merge to abnorm result ahead,the 
//contrl signal will decide wether choose it or not
assign mult_ex3_fma_result_inf = !mult_ex3_result_abnorm
                              && !mult_ex3_result_zero
                              && !mult_ex3_fma_of_result_lfn
                              && mult_ex3_fma_expnt_of;
assign mult_ex3_fma_result_lfn = !mult_ex3_result_abnorm
                              && !mult_ex3_result_zero
                              && mult_ex3_fma_of_result_lfn
                              && mult_ex3_fma_expnt_of;

assign mult_ex3_result_zero    = !(|mult_ex3_frac_result[37:0])
                              && !mult_ex3_sticky1
                              && !mult_ex3_result_abnorm;

assign mult_ex3_ex4_result_abnorm = mult_ex3_result_abnorm
                                 || mult_ex3_result_zero
                                 || mult_ex3_fma_expnt_of;

assign mult_ex3_rst_inf[15:0] = {mult_ex3_fma_sign,5'h1f,10'b0};
assign mult_ex3_rst_lfn[15:0] = {mult_ex3_fma_sign,5'h1e,{10{1'b1}}};

assign mult_ex3_fma_zero_sign = (mult_ex3_sub_vld)
                              ? (dp_xx_ex3_rm[2:0] == 3'b010)
                              : mult_ex3_fma_sign;

assign mult_ex3_rst_zero[15:0] = {mult_ex3_fma_zero_sign,15'b0};

assign mult_ex3_fma_abnorm_result[15:0] =
    {16{mult_ex3_result_abnorm}}  & mult_ex3_abnorm_result[15:0]
  | {16{mult_ex3_result_zero}}    & mult_ex3_rst_zero[15:0]
  | {16{mult_ex3_fma_result_inf}} & mult_ex3_rst_inf[15:0]
  | {16{mult_ex3_fma_result_lfn}} & mult_ex3_rst_lfn[15:0];

assign mult_ex3_ex4_fma_result[15:0] = (mult_ex3_ex4_result_abnorm)
                                      ? mult_ex3_fma_abnorm_result[15:0]
                                      : {mult_ex3_fma_sign,mult_ex3_fma_expnt[4:0],mult_ex3_fma_frac_result[9:0]};


//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
// &Instance("gated_clk_cell", "x_simd_ex3_ex4_gated_clk"); @1457
gated_clk_cell  x_simd_ex3_ex4_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (simd_ex3_ex4_pipe_clk),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (simd_ex3_ex4_pipedown),
  .module_en             (cp0_vfpu_icg_en      ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in      (forever_cpuclk       ), @1458
//           .external_en (1'b0                 ), @1459
//           .global_en   (cp0_yy_clk_en        ), @1460
//           .module_en   (cp0_vfpu_icg_en       ), @1461
//           .local_en    (simd_ex3_ex4_pipedown), @1462
//           .clk_out     (simd_ex3_ex4_pipe_clk)); @1463

assign simd_ex3_ex4_pipedown = mult_ex3_ex4_half_pipedown
                            && mult_ex3_simd_half_sel;

always @(posedge simd_ex3_ex4_pipe_clk)
begin
if(simd_ex3_ex4_pipedown)
  begin
    mult_ex4_fma_expt[4:0]    <= mult_ex3_expt_result[4:0];
    mult_ex4_fma_result[15:0] <= mult_ex3_ex4_fma_result[15:0];
  end
  else
  begin
    mult_ex4_fma_expt[4:0]    <= mult_ex4_fma_expt[4:0];
    mult_ex4_fma_result[15:0] <= mult_ex4_fma_result[15:0];
  end
end

assign halfy_fma_expt[4:0]    = mult_ex4_fma_expt[4:0];
assign halfy_fma_result[15:0] = mult_ex4_fma_result[15:0];
  
// &ModuleEnd; @1490
endmodule


