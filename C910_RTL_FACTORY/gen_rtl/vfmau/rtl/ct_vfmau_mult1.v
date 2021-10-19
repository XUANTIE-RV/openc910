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
module ct_vfmau_mult1(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_mult1_ex1_clk_en,
  dp_mult1_ex1_op0_slicex,
  dp_mult1_ex1_op0_slicex_high,
  dp_mult1_ex1_op1_slicex,
  dp_mult1_ex1_op1_slicex_high,
  dp_mult1_ex1_op2_slicex,
  dp_mult1_ex1_op2_slicex_high,
  dp_mult1_ex2_clk_en,
  dp_mult1_ex3_clk_en,
  dp_mult1_ex4_clk_en,
  dp_mult1_op2_slicex_vl_mask,
  dp_mult1_op2_slicex_vm_mask,
  dp_mult_ex1_op0_slicex_half0,
  dp_mult_ex1_op0_slicex_half0_high,
  dp_mult_ex1_op1_slicex_half0,
  dp_mult_ex1_op1_slicex_half0_high,
  dp_mult_ex1_op2_slicex_half0,
  dp_mult_ex1_op2_slicex_half0_high,
  dp_mult_op2_slicex_vl_half0_mask,
  dp_mult_op2_slicex_vm_half0_mask,
  dp_xx_ex1_double,
  dp_xx_ex1_fma,
  dp_xx_ex1_half,
  dp_xx_ex1_neg,
  dp_xx_ex1_op0_frac,
  dp_xx_ex1_op1_frac,
  dp_xx_ex1_rm,
  dp_xx_ex1_simd,
  dp_xx_ex1_single,
  dp_xx_ex1_sub,
  dp_xx_ex1_widen,
  dp_xx_ex2_double,
  dp_xx_ex2_fma,
  dp_xx_ex2_half,
  dp_xx_ex2_mult_id,
  dp_xx_ex2_neg,
  dp_xx_ex2_rm,
  dp_xx_ex2_simd,
  dp_xx_ex2_sub,
  dp_xx_ex2_widen,
  dp_xx_ex3_double,
  dp_xx_ex3_fma,
  dp_xx_ex3_half,
  dp_xx_ex3_mult_id,
  dp_xx_ex3_rm,
  dp_xx_ex3_simd,
  dp_xx_ex3_widen,
  dp_xx_ex4_double,
  dp_xx_ex4_half,
  dp_xx_ex4_rm,
  forever_cpuclk,
  mult1_ex1_ex2_pipedown,
  mult1_ex2_ex3_pipedown,
  mult1_ex3_ex4_pipedown,
  mult1_ex4_ex5_pipedown,
  mult_ex1_ex2_half_pipedown,
  mult_ex2_ex3_half_pipedown,
  mult_ex3_ex4_half_pipedown,
  mult_ex4_ex5_half_pipedown,
  pad_yy_icg_scan_en,
  pipe6_pipex_ex4_fmla_fwd_vld,
  pipe6_pipex_ex5_ex1_fmla_fwd_vld,
  pipe6_pipex_ex5_ex2_fmla_fwd_vld,
  pipe6_vfmau_ex4_fmla_slicex_half0_data,
  pipe6_vfmau_ex5_fmla_slicex_data,
  pipe7_pipex_ex4_fmla_fwd_vld,
  pipe7_pipex_ex5_ex1_fmla_fwd_vld,
  pipe7_pipex_ex5_ex2_fmla_fwd_vld,
  pipe7_vfmau_ex4_fmla_slicex_half0_data,
  pipe7_vfmau_ex5_fmla_slicex_data,
  slicex_dp_half0_mult_id,
  slicex_dp_mult1_mult_id,
  slicex_mult1_dp_ex3_mult_expt,
  slicex_mult1_dp_ex3_mult_result,
  slicex_mult1_dp_ex4_expt,
  slicex_mult1_dp_ex4_half_fma_result,
  slicex_mult1_dp_ex4_mult_result,
  slicex_mult1_dp_ex5_fma_expt,
  slicex_mult1_dp_ex5_fma_result,
  slicex_mult1_dp_ex5_fwd_data,
  vfpu_yy_xx_dqnan
);

// &Ports; @24
input            cp0_vfpu_icg_en;                       
input            cp0_yy_clk_en;                         
input            cpurst_b;                              
input            dp_mult1_ex1_clk_en;                   
input   [63 :0]  dp_mult1_ex1_op0_slicex;               
input   [31 :0]  dp_mult1_ex1_op0_slicex_high;          
input   [63 :0]  dp_mult1_ex1_op1_slicex;               
input   [31 :0]  dp_mult1_ex1_op1_slicex_high;          
input   [63 :0]  dp_mult1_ex1_op2_slicex;               
input   [31 :0]  dp_mult1_ex1_op2_slicex_high;          
input            dp_mult1_ex2_clk_en;                   
input            dp_mult1_ex3_clk_en;                   
input            dp_mult1_ex4_clk_en;                   
input            dp_mult1_op2_slicex_vl_mask;           
input            dp_mult1_op2_slicex_vm_mask;           
input   [15 :0]  dp_mult_ex1_op0_slicex_half0;          
input   [47 :0]  dp_mult_ex1_op0_slicex_half0_high;     
input   [15 :0]  dp_mult_ex1_op1_slicex_half0;          
input   [47 :0]  dp_mult_ex1_op1_slicex_half0_high;     
input   [31 :0]  dp_mult_ex1_op2_slicex_half0;          
input   [47 :0]  dp_mult_ex1_op2_slicex_half0_high;     
input            dp_mult_op2_slicex_vl_half0_mask;      
input            dp_mult_op2_slicex_vm_half0_mask;      
input            dp_xx_ex1_double;                      
input            dp_xx_ex1_fma;                         
input            dp_xx_ex1_half;                        
input            dp_xx_ex1_neg;                         
input   [51 :0]  dp_xx_ex1_op0_frac;                    
input   [51 :0]  dp_xx_ex1_op1_frac;                    
input   [2  :0]  dp_xx_ex1_rm;                          
input            dp_xx_ex1_simd;                        
input            dp_xx_ex1_single;                      
input            dp_xx_ex1_sub;                         
input            dp_xx_ex1_widen;                       
input            dp_xx_ex2_double;                      
input            dp_xx_ex2_fma;                         
input            dp_xx_ex2_half;                        
input            dp_xx_ex2_mult_id;                     
input            dp_xx_ex2_neg;                         
input   [2  :0]  dp_xx_ex2_rm;                          
input            dp_xx_ex2_simd;                        
input            dp_xx_ex2_sub;                         
input            dp_xx_ex2_widen;                       
input            dp_xx_ex3_double;                      
input            dp_xx_ex3_fma;                         
input            dp_xx_ex3_half;                        
input            dp_xx_ex3_mult_id;                     
input   [2  :0]  dp_xx_ex3_rm;                          
input            dp_xx_ex3_simd;                        
input            dp_xx_ex3_widen;                       
input            dp_xx_ex4_double;                      
input            dp_xx_ex4_half;                        
input   [2  :0]  dp_xx_ex4_rm;                          
input            forever_cpuclk;                        
input            mult1_ex1_ex2_pipedown;                
input            mult1_ex2_ex3_pipedown;                
input            mult1_ex3_ex4_pipedown;                
input            mult1_ex4_ex5_pipedown;                
input            mult_ex1_ex2_half_pipedown;            
input            mult_ex2_ex3_half_pipedown;            
input            mult_ex3_ex4_half_pipedown;            
input            mult_ex4_ex5_half_pipedown;            
input            pad_yy_icg_scan_en;                    
input            pipe6_pipex_ex4_fmla_fwd_vld;          
input            pipe6_pipex_ex5_ex1_fmla_fwd_vld;      
input            pipe6_pipex_ex5_ex2_fmla_fwd_vld;      
input   [15 :0]  pipe6_vfmau_ex4_fmla_slicex_half0_data; 
input   [67 :0]  pipe6_vfmau_ex5_fmla_slicex_data;      
input            pipe7_pipex_ex4_fmla_fwd_vld;          
input            pipe7_pipex_ex5_ex1_fmla_fwd_vld;      
input            pipe7_pipex_ex5_ex2_fmla_fwd_vld;      
input   [15 :0]  pipe7_vfmau_ex4_fmla_slicex_half0_data; 
input   [67 :0]  pipe7_vfmau_ex5_fmla_slicex_data;      
input            vfpu_yy_xx_dqnan;                      
output           slicex_dp_half0_mult_id;               
output           slicex_dp_mult1_mult_id;               
output  [4  :0]  slicex_mult1_dp_ex3_mult_expt;         
output  [63 :0]  slicex_mult1_dp_ex3_mult_result;       
output  [4  :0]  slicex_mult1_dp_ex4_expt;              
output  [15 :0]  slicex_mult1_dp_ex4_half_fma_result;   
output  [63 :0]  slicex_mult1_dp_ex4_mult_result;       
output  [4  :0]  slicex_mult1_dp_ex5_fma_expt;          
output  [63 :0]  slicex_mult1_dp_ex5_fma_result;        
output  [67 :0]  slicex_mult1_dp_ex5_fwd_data;          

// &Regs; @25
reg     [12 :0]  mult1_ex1_expnt_bias;                  
reg     [12 :0]  mult1_ex1_expnt_plus_3_bias;           
reg     [12 :0]  mult1_ex1_mult_id_adjust;              
reg     [51 :0]  mult1_ex2_dqnan_result;                
reg     [12 :0]  mult1_ex2_expnt;                       
reg     [12 :0]  mult1_ex2_expnt_sa_pre;                
reg              mult1_ex2_fmla_ex4_fwd_vld;            
reg              mult1_ex2_fmla_ex5_fwd_vld;            
reg     [12 :0]  mult1_ex2_mult_expnt_plus_3_result;    
reg     [12 :0]  mult1_ex2_mult_expnt_result;           
reg     [12 :0]  mult1_ex2_mult_id_adjust;              
reg              mult1_ex2_mult_result_sign;            
reg              mult1_ex2_op0_id;                      
reg              mult1_ex2_op0_inf;                     
reg              mult1_ex2_op0_norm;                    
reg              mult1_ex2_op0_zero;                    
reg              mult1_ex2_op1_id;                      
reg              mult1_ex2_op1_inf;                     
reg              mult1_ex2_op1_norm;                    
reg              mult1_ex2_op1_zero;                    
reg              mult1_ex2_op2_cnan_pre;                
reg     [10 :0]  mult1_ex2_op2_expnt_pre;               
reg              mult1_ex2_op2_expnt_zero_pre;          
reg     [51 :0]  mult1_ex2_op2_frac_pre;                
reg              mult1_ex2_op2_inf_pre;                 
reg     [162:0]  mult1_ex2_op2_l1_shift;                
reg     [162:0]  mult1_ex2_op2_l2_shift;                
reg     [162:0]  mult1_ex2_op2_l3_shift;                
reg              mult1_ex2_op2_qnan_pre;                
reg     [162:0]  mult1_ex2_op2_shift_sel;               
reg              mult1_ex2_op2_sign_pre;                
reg              mult1_ex2_op2_snan_pre;                
reg              mult1_ex2_op_id;                       
reg              mult1_ex2_op_qnan;                     
reg              mult1_ex2_op_snan;                     
reg     [51 :0]  mult1_ex2_qnan_result;                 
reg              mult1_ex2_sticky1;                     
reg     [63 :0]  mult1_ex3_abnorm_result;               
reg              mult1_ex3_add1;                        
reg     [163:0]  mult1_ex3_carry;                       
reg     [12 :0]  mult1_ex3_expnt;                       
reg              mult1_ex3_expnt_diff_ge_neg2;          
reg              mult1_ex3_expnt_diff_ge_neg2_dup;      
reg              mult1_ex3_expnt_zero;                  
reg     [4  :0]  mult1_ex3_expt;                        
reg     [163:0]  mult1_ex3_frac_result;                 
reg     [4  :0]  mult1_ex3_half_expt;                   
reg     [63 :0]  mult1_ex3_half_mult_result;            
reg     [105:0]  mult1_ex3_mult_frac;                   
reg              mult1_ex3_mult_result_sign;            
reg              mult1_ex3_of_result_lfn;               
reg              mult1_ex3_op_id;                       
reg              mult1_ex3_potnt_of;                    
reg              mult1_ex3_result_abnorm;               
reg     [3  :0]  mult1_ex3_special_type;                
reg              mult1_ex3_sticky1;                     
reg              mult1_ex3_sub_vld;                     
reg     [105:0]  mult1_ex3_sum;                         
reg     [63 :0]  mult1_ex4_abnorm_result;               
reg     [12 :0]  mult1_ex4_expnt_result;                
reg     [4  :0]  mult1_ex4_expt;                        
reg     [110:0]  mult1_ex4_fma_expnt_temp;              
reg     [110:0]  mult1_ex4_fma_norm_temp;               
reg              mult1_ex4_fma_of_result_lfn;           
reg              mult1_ex4_fma_sign;                    
reg     [110:0]  mult1_ex4_frac_result_shift0;          
reg     [110:0]  mult1_ex4_frac_result_shift1;          
reg              mult1_ex4_half_fma;                    
reg     [6  :0]  mult1_ex4_lza_result;                  
reg     [63 :0]  mult1_ex4_mult_result;                 
reg              mult1_ex4_result_abnorm;               
reg              mult1_ex4_simd;                        
reg     [3  :0]  mult1_ex4_special_type;                
reg              mult1_ex4_sticky1;                     
reg              mult1_ex4_sub_vld;                     
reg     [63 :0]  mult1_ex5_abnorm_result;               
reg              mult1_ex5_double;                      
reg              mult1_ex5_expnt0_id;                   
reg              mult1_ex5_expnt1_id;                   
reg     [4  :0]  mult1_ex5_expt0_result;                
reg     [4  :0]  mult1_ex5_expt1_result;                
reg              mult1_ex5_fma_expnt0_p1;               
reg     [10 :0]  mult1_ex5_fma_expnt0_result0;          
reg     [10 :0]  mult1_ex5_fma_expnt0_result1;          
reg              mult1_ex5_fma_expnt1_p1;               
reg     [10 :0]  mult1_ex5_fma_expnt1_result0;          
reg     [10 :0]  mult1_ex5_fma_expnt1_result1;          
reg     [52 :0]  mult1_ex5_fma_frac0_result;            
reg     [52 :0]  mult1_ex5_fma_frac1_result;            
reg              mult1_ex5_fma_of;                      
reg              mult1_ex5_fma_result_inf;              
reg              mult1_ex5_fma_rst0_sel;                
reg              mult1_ex5_fma_sign;                    
reg              mult1_ex5_result_abnorm;               
reg     [3  :0]  mult1_ex5_special_type;                
reg     [63 :0]  slicex_mult1_dp_ex4_mult_result;       

// &Wires; @26
wire    [2  :0]  bias_select;                           
wire    [105:0]  compressor_mult1_carry;                
wire    [105:0]  compressor_mult1_sum;                  
wire             cp0_vfpu_icg_en;                       
wire             cp0_yy_clk_en;                         
wire             cpurst_b;                              
wire             dp_mult1_ex1_clk_en;                   
wire    [63 :0]  dp_mult1_ex1_op0_slicex;               
wire    [31 :0]  dp_mult1_ex1_op0_slicex_high;          
wire    [63 :0]  dp_mult1_ex1_op1_slicex;               
wire    [31 :0]  dp_mult1_ex1_op1_slicex_high;          
wire    [63 :0]  dp_mult1_ex1_op2_slicex;               
wire    [31 :0]  dp_mult1_ex1_op2_slicex_high;          
wire             dp_mult1_ex2_clk_en;                   
wire             dp_mult1_ex3_clk_en;                   
wire             dp_mult1_ex4_clk_en;                   
wire             dp_mult1_op2_slicex_vl_mask;           
wire             dp_mult1_op2_slicex_vm_mask;           
wire    [15 :0]  dp_mult_ex1_op0_slicex_half0;          
wire    [47 :0]  dp_mult_ex1_op0_slicex_half0_high;     
wire    [15 :0]  dp_mult_ex1_op1_slicex_half0;          
wire    [47 :0]  dp_mult_ex1_op1_slicex_half0_high;     
wire    [31 :0]  dp_mult_ex1_op2_slicex_half0;          
wire    [47 :0]  dp_mult_ex1_op2_slicex_half0_high;     
wire             dp_mult_op2_slicex_vl_half0_mask;      
wire             dp_mult_op2_slicex_vm_half0_mask;      
wire             dp_xx_ex1_double;                      
wire             dp_xx_ex1_fma;                         
wire             dp_xx_ex1_half;                        
wire             dp_xx_ex1_neg;                         
wire    [51 :0]  dp_xx_ex1_op0_frac;                    
wire    [51 :0]  dp_xx_ex1_op1_frac;                    
wire    [2  :0]  dp_xx_ex1_rm;                          
wire             dp_xx_ex1_simd;                        
wire             dp_xx_ex1_single;                      
wire             dp_xx_ex1_sub;                         
wire             dp_xx_ex1_widen;                       
wire             dp_xx_ex2_double;                      
wire             dp_xx_ex2_fma;                         
wire             dp_xx_ex2_half;                        
wire             dp_xx_ex2_mult_id;                     
wire             dp_xx_ex2_neg;                         
wire    [2  :0]  dp_xx_ex2_rm;                          
wire             dp_xx_ex2_simd;                        
wire             dp_xx_ex2_sub;                         
wire             dp_xx_ex2_widen;                       
wire             dp_xx_ex3_double;                      
wire             dp_xx_ex3_fma;                         
wire             dp_xx_ex3_half;                        
wire             dp_xx_ex3_mult_id;                     
wire    [2  :0]  dp_xx_ex3_rm;                          
wire             dp_xx_ex3_simd;                        
wire             dp_xx_ex3_widen;                       
wire             dp_xx_ex4_double;                      
wire             dp_xx_ex4_half;                        
wire    [2  :0]  dp_xx_ex4_rm;                          
wire             forever_cpuclk;                        
wire             half0_ex1_op0_hidden_bit;              
wire             half0_ex1_op1_hidden_bit;              
wire    [4  :0]  half0_fma_expt;                        
wire    [15 :0]  half0_fma_result;                      
wire    [4  :0]  half0_mult_expt;                       
wire    [15 :0]  half0_mult_result;                     
wire             mult1_ex1_doub_expnt0_inf;             
wire             mult1_ex1_doub_expnt1_inf;             
wire             mult1_ex1_doub_expnt2_inf;             
wire    [51 :0]  mult1_ex1_dqnan_result;                
wire             mult1_ex1_ex2_clk_en;                  
wire             mult1_ex1_ex2_pipe_clk;                
wire             mult1_ex1_ex2_pipedown;                
wire             mult1_ex1_expnt0_inf;                  
wire             mult1_ex1_expnt0_zero;                 
wire             mult1_ex1_expnt1_inf;                  
wire             mult1_ex1_expnt1_zero;                 
wire             mult1_ex1_expnt2_inf;                  
wire             mult1_ex1_expnt2_zero;                 
wire    [10 :0]  mult1_ex1_expnt_addr_op0;              
wire    [10 :0]  mult1_ex1_expnt_addr_op1;              
wire    [12 :0]  mult1_ex1_expnt_sa_pre;                
wire             mult1_ex1_fmla_ex4_fwd_vld;            
wire             mult1_ex1_fmla_ex5_fwd_vld;            
wire             mult1_ex1_frac0_all_zero;              
wire             mult1_ex1_frac1_all_zero;              
wire             mult1_ex1_frac2_all_zero;              
wire    [12 :0]  mult1_ex1_mult_expnt_plus_3_result;    
wire    [12 :0]  mult1_ex1_mult_expnt_result;           
wire             mult1_ex1_mult_result_sign;            
wire             mult1_ex1_op0_cnan;                    
wire    [10 :0]  mult1_ex1_op0_expnt;                   
wire    [51 :0]  mult1_ex1_op0_frac;                    
wire             mult1_ex1_op0_half0_hidden_bit;        
wire             mult1_ex1_op0_hidden_bit;              
wire             mult1_ex1_op0_high_vld;                
wire             mult1_ex1_op0_id;                      
wire             mult1_ex1_op0_inf;                     
wire             mult1_ex1_op0_norm;                    
wire             mult1_ex1_op0_qnan;                    
wire    [51 :0]  mult1_ex1_op0_qnan_result;             
wire             mult1_ex1_op0_sign;                    
wire             mult1_ex1_op0_snan;                    
wire    [51 :0]  mult1_ex1_op0_snan_result;             
wire             mult1_ex1_op0_zero;                    
wire             mult1_ex1_op1_cnan;                    
wire    [10 :0]  mult1_ex1_op1_expnt;                   
wire    [51 :0]  mult1_ex1_op1_frac;                    
wire             mult1_ex1_op1_half0_hidden_bit;        
wire             mult1_ex1_op1_hidden_bit;              
wire             mult1_ex1_op1_high_vld;                
wire             mult1_ex1_op1_id;                      
wire             mult1_ex1_op1_inf;                     
wire             mult1_ex1_op1_norm;                    
wire             mult1_ex1_op1_qnan;                    
wire    [51 :0]  mult1_ex1_op1_qnan_result;             
wire             mult1_ex1_op1_sign;                    
wire             mult1_ex1_op1_snan;                    
wire    [51 :0]  mult1_ex1_op1_snan_result;             
wire             mult1_ex1_op1_zero;                    
wire             mult1_ex1_op2_cnan;                    
wire    [10 :0]  mult1_ex1_op2_expnt;                   
wire    [51 :0]  mult1_ex1_op2_frac;                    
wire    [63 :0]  mult1_ex1_op2_fwd_data;                
wire             mult1_ex1_op2_high_vld;                
wire             mult1_ex1_op2_inf;                     
wire             mult1_ex1_op2_qnan;                    
wire             mult1_ex1_op2_sign;                    
wire             mult1_ex1_op2_snan;                    
wire             mult1_ex1_op_id;                       
wire             mult1_ex1_op_qnan;                     
wire             mult1_ex1_op_snan;                     
wire    [51 :0]  mult1_ex1_qnan_result;                 
wire             mult1_ex1_sing_expnt0_inf;             
wire             mult1_ex1_sing_expnt1_inf;             
wire             mult1_ex1_sing_expnt2_inf;             
wire    [51 :0]  mult1_ex1_snan_result;                 
wire    [63 :0]  mult1_ex2_abnorm_result;               
wire    [4  :0]  mult1_ex2_c0_sa_12_8;                  
wire    [3  :0]  mult1_ex2_c0_sa_4_2;                   
wire    [3  :0]  mult1_ex2_c0_sa_7_5;                   
wire    [4  :0]  mult1_ex2_c1_sa_12_8;                  
wire    [3  :0]  mult1_ex2_c1_sa_4_2;                   
wire    [3  :0]  mult1_ex2_c1_sa_7_5;                   
wire    [163:0]  mult1_ex2_carry;                       
wire    [63 :0]  mult1_ex2_doub_abnorm_result;          
wire             mult1_ex2_doub_expnt_of;               
wire    [63 :0]  mult1_ex2_doub_masked_result;          
wire             mult1_ex2_doub_potnt_of;               
wire             mult1_ex2_ex3_clk_en;                  
wire             mult1_ex2_ex3_pipe_clk;                
wire             mult1_ex2_ex3_pipedown;                
wire             mult1_ex2_ex3_special_pipe_clk;        
wire             mult1_ex2_ex3_special_pipedown;        
wire             mult1_ex2_ex3_sticky1;                 
wire    [12 :0]  mult1_ex2_expnt_diff;                  
wire             mult1_ex2_expnt_diff_ge_neg2;          
wire             mult1_ex2_expnt_of;                    
wire             mult1_ex2_expnt_potnt_of;              
wire    [2  :0]  mult1_ex2_expnt_select;                
wire    [4  :0]  mult1_ex2_expt;                        
wire    [12 :0]  mult1_ex2_fma_mult_expnt;              
wire    [12 :0]  mult1_ex2_fma_op2_expnt;               
wire    [4  :0]  mult1_ex2_half_expt;                   
wire    [63 :0]  mult1_ex2_half_mult_result;            
wire    [105:0]  mult1_ex2_mult_carry;                  
wire             mult1_ex2_mult_expnt_zero;             
wire    [105:0]  mult1_ex2_mult_frac;                   
wire    [105:0]  mult1_ex2_mult_frac_adder;             
wire    [105:0]  mult1_ex2_mult_sum;                    
wire    [51 :0]  mult1_ex2_nan_result;                  
wire             mult1_ex2_nv;                          
wire             mult1_ex2_nx;                          
wire             mult1_ex2_of;                          
wire             mult1_ex2_op2_cnan;                    
wire    [10 :0]  mult1_ex2_op2_expnt;                   
wire    [10 :0]  mult1_ex2_op2_expnt_adjust;            
wire             mult1_ex2_op2_expnt_zero;              
wire    [52 :0]  mult1_ex2_op2_frac;                    
wire             mult1_ex2_op2_frac_zero;               
wire    [67 :0]  mult1_ex2_op2_fwd_data;                
wire             mult1_ex2_op2_id;                      
wire             mult1_ex2_op2_inf;                     
wire             mult1_ex2_op2_qnan;                    
wire    [51 :0]  mult1_ex2_op2_qnan_result;             
wire    [162:0]  mult1_ex2_op2_sa_result;               
wire    [162:0]  mult1_ex2_op2_shift_pre;               
wire             mult1_ex2_op2_sign;                    
wire             mult1_ex2_op2_snan;                    
wire    [51 :0]  mult1_ex2_op2_snan_result;             
wire             mult1_ex2_op2_zero;                    
wire             mult1_ex2_potnt_nv;                    
wire             mult1_ex2_potnt_of;                    
wire             mult1_ex2_result_abnorm;               
wire             mult1_ex2_result_inf;                  
wire             mult1_ex2_result_inf_sign;             
wire             mult1_ex2_result_mask;                 
wire             mult1_ex2_result_op2;                  
wire             mult1_ex2_result_op2_sign;             
wire             mult1_ex2_result_qnan;                 
wire             mult1_ex2_result_zero;                 
wire             mult1_ex2_result_zero_sign;            
wire    [4  :0]  mult1_ex2_sa_12_8;                     
wire    [2  :0]  mult1_ex2_sa_1_0;                      
wire    [3  :0]  mult1_ex2_sa_4_2;                      
wire    [3  :0]  mult1_ex2_sa_7_5;                      
wire    [12 :0]  mult1_ex2_sa_addr_op0;                 
wire    [12 :0]  mult1_ex2_sa_addr_op1;                 
wire             mult1_ex2_sa_ge_163;                   
wire             mult1_ex2_sa_lt_0;                     
wire    [12 :0]  mult1_ex2_sa_result;                   
wire    [31 :0]  mult1_ex2_sing_abnorm_result;          
wire             mult1_ex2_sing_expnt_of;               
wire    [31 :0]  mult1_ex2_sing_masked_result;          
wire             mult1_ex2_sing_potnt_of;               
wire    [3  :0]  mult1_ex2_special_type;                
wire             mult1_ex2_sub_vld;                     
wire    [105:0]  mult1_ex2_sum;                         
wire             mult1_ex3_abnorm;                      
wire    [164:0]  mult1_ex3_addr0;                       
wire    [164:0]  mult1_ex3_addr1;                       
wire    [164:0]  mult1_ex3_addr_plus_1_result;          
wire    [164:0]  mult1_ex3_addr_result;                 
wire    [63 :0]  mult1_ex3_doub_rst_abnorm;             
wire    [63 :0]  mult1_ex3_doub_rst_inf;                
wire    [63 :0]  mult1_ex3_doub_rst_lfn;                
wire    [63 :0]  mult1_ex3_doub_rst_norm;               
wire             mult1_ex3_double_eq;                   
wire             mult1_ex3_double_gr;                   
wire             mult1_ex3_double_zero;                 
wire             mult1_ex3_eq;                          
wire    [63 :0]  mult1_ex3_ex4_abnorm_result;           
wire             mult1_ex3_ex4_clk_en;                  
wire    [4  :0]  mult1_ex3_ex4_expt;                    
wire             mult1_ex3_ex4_pipe_clk;                
wire             mult1_ex3_ex4_pipedown;                
wire             mult1_ex3_ex4_result_abnorm;           
wire             mult1_ex3_ex4_special_pipe_clk;        
wire             mult1_ex3_ex4_special_pipedown;        
wire             mult1_ex3_ex4_sticky1;                 
wire    [10 :0]  mult1_ex3_expnt_final_result;          
wire             mult1_ex3_expnt_plus1;                 
wire    [10 :0]  mult1_ex3_expnt_plus1_result;          
wire             mult1_ex3_fma_sign;                    
wire    [51 :0]  mult1_ex3_frac_52;                     
wire             mult1_ex3_frac_result_add;             
wire             mult1_ex3_frac_result_neg;             
wire    [110:0]  mult1_ex3_frac_result_shift;           
wire             mult1_ex3_frac_result_sub;             
wire             mult1_ex3_frac_shift_53;               
wire             mult1_ex3_gr;                          
wire             mult1_ex3_half_fma;                    
wire    [107:0]  mult1_ex3_lza_addend;                  
wire    [6  :0]  mult1_ex3_lza_result;                  
wire    [107:0]  mult1_ex3_lza_summand;                 
wire             mult1_ex3_mult_doub_sticky;            
wire    [53 :0]  mult1_ex3_mult_frac_result;            
wire    [53 :0]  mult1_ex3_mult_frac_round_addr;        
wire    [53 :0]  mult1_ex3_mult_frac_round_op0;         
wire    [53 :0]  mult1_ex3_mult_frac_round_op1;         
wire    [53 :0]  mult1_ex3_mult_frac_round_result;      
wire    [105:0]  mult1_ex3_mult_frac_shift;             
wire             mult1_ex3_mult_result_inf_pre;         
wire             mult1_ex3_mult_result_lfn_pre;         
wire             mult1_ex3_mult_sing_sticky;            
wire             mult1_ex3_nx;                          
wire             mult1_ex3_of;                          
wire             mult1_ex3_rshift_sel;                  
wire             mult1_ex3_rst_105_select;              
wire    [63 :0]  mult1_ex3_rst_abnorm;                  
wire             mult1_ex3_rst_doub_gbit;               
wire             mult1_ex3_rst_doub_lsb;                
wire             mult1_ex3_rst_doub_rsbit;              
wire    [63 :0]  mult1_ex3_rst_inf;                     
wire    [63 :0]  mult1_ex3_rst_lfn;                     
wire             mult1_ex3_rst_lsb;                     
wire    [63 :0]  mult1_ex3_rst_norm;                    
wire             mult1_ex3_rst_sing_gbit;               
wire             mult1_ex3_rst_sing_lsb;                
wire             mult1_ex3_rst_sing_rsbit;              
wire    [63 :0]  mult1_ex3_sing_rst_abnorm;             
wire    [31 :0]  mult1_ex3_sing_rst_high;               
wire    [63 :0]  mult1_ex3_sing_rst_inf;                
wire    [63 :0]  mult1_ex3_sing_rst_lfn;                
wire    [63 :0]  mult1_ex3_sing_rst_norm;               
wire             mult1_ex3_single_eq;                   
wire             mult1_ex3_single_gr;                   
wire             mult1_ex3_single_zero;                 
wire             mult1_ex3_uf;                          
wire             mult1_ex3_zero;                        
wire             mult1_ex4_doub_expnt1_of;              
wire             mult1_ex4_doub_potnt1_add_of;          
wire             mult1_ex4_doub_potnt1_sub_of;          
wire    [63 :0]  mult1_ex4_doub_rst_inf;                
wire    [63 :0]  mult1_ex4_doub_rst_lfn;                
wire    [63 :0]  mult1_ex4_ex5_abnorm_result;           
wire             mult1_ex4_ex5_clk_en;                  
wire             mult1_ex4_ex5_pipe_clk;                
wire             mult1_ex4_ex5_pipedown;                
wire             mult1_ex4_ex5_result_abnorm;           
wire             mult1_ex4_ex5_special_pipe_clk;        
wire             mult1_ex4_ex5_special_pipedown;        
wire    [3  :0]  mult1_ex4_ex5_special_type;            
wire             mult1_ex4_exp_shift_sel;               
wire             mult1_ex4_expnt1_of;                   
wire    [12 :0]  mult1_ex4_expnt_adder0;                
wire    [12 :0]  mult1_ex4_expnt_adder1;                
wire             mult1_ex4_expnt_eq_lza_plus1;          
wire             mult1_ex4_expnt_is_0;                  
wire             mult1_ex4_expnt_is_1;                  
wire             mult1_ex4_expnt_le_lza;                
wire             mult1_ex4_expnt_lshift_64;             
wire    [12 :0]  mult1_ex4_expnt_lza_shift;             
wire    [4  :0]  mult1_ex4_expt0_result;                
wire    [4  :0]  mult1_ex4_expt1_result;                
wire             mult1_ex4_fma_expnt0_id;               
wire             mult1_ex4_fma_expnt0_m1;               
wire    [10 :0]  mult1_ex4_fma_expnt0_m1_result;        
wire             mult1_ex4_fma_expnt0_nx;               
wire             mult1_ex4_fma_expnt0_p1;               
wire    [10 :0]  mult1_ex4_fma_expnt0_p1_result;        
wire    [10 :0]  mult1_ex4_fma_expnt0_result;           
wire    [10 :0]  mult1_ex4_fma_expnt0_result0;          
wire    [10 :0]  mult1_ex4_fma_expnt0_result1;          
wire             mult1_ex4_fma_expnt0_uf;               
wire             mult1_ex4_fma_expnt1_id;               
wire             mult1_ex4_fma_expnt1_m1;               
wire    [10 :0]  mult1_ex4_fma_expnt1_m1_result;        
wire             mult1_ex4_fma_expnt1_nx;               
wire             mult1_ex4_fma_expnt1_of;               
wire             mult1_ex4_fma_expnt1_p1;               
wire    [10 :0]  mult1_ex4_fma_expnt1_p1_result;        
wire    [12 :0]  mult1_ex4_fma_expnt1_result;           
wire    [10 :0]  mult1_ex4_fma_expnt1_result0;          
wire    [10 :0]  mult1_ex4_fma_expnt1_result1;          
wire             mult1_ex4_fma_expnt1_uf;               
wire    [110:0]  mult1_ex4_fma_expnt_shift;             
wire    [52 :0]  mult1_ex4_fma_frac0_result;            
wire    [53 :0]  mult1_ex4_fma_frac0_round_add;         
wire    [52 :0]  mult1_ex4_fma_frac0_round_op0;         
wire    [52 :0]  mult1_ex4_fma_frac0_round_result;      
wire    [52 :0]  mult1_ex4_fma_frac1_result;            
wire    [53 :0]  mult1_ex4_fma_frac1_round_add;         
wire    [52 :0]  mult1_ex4_fma_frac1_round_op0;         
wire    [52 :0]  mult1_ex4_fma_frac1_round_result;      
wire    [110:0]  mult1_ex4_fma_lza_shift;               
wire    [110:0]  mult1_ex4_fma_lza_shift64;             
wire    [110:0]  mult1_ex4_fma_norm_result;             
wire             mult1_ex4_fma_result_inf;              
wire             mult1_ex4_fma_result_inf_pre;          
wire             mult1_ex4_fma_result_lfn_pre;          
wire             mult1_ex4_fma_zero_sign;               
wire             mult1_ex4_frac0_nx;                    
wire             mult1_ex4_frac1_nx;                    
wire             mult1_ex4_lza_lshift_64;               
wire             mult1_ex4_mult_result_abnormal;        
wire             mult1_ex4_mult_result_half_fma;        
wire             mult1_ex4_potnt0_add_uf;               
wire             mult1_ex4_potnt0_sub_uf;               
wire             mult1_ex4_potnt1_add_of;               
wire             mult1_ex4_potnt1_add_uf;               
wire             mult1_ex4_potnt1_sub_of;               
wire             mult1_ex4_potnt1_sub_uf;               
wire             mult1_ex4_result_zero;                 
wire             mult1_ex4_rshift_sticky;               
wire             mult1_ex4_rst0_add1;                   
wire             mult1_ex4_rst0_doub_gbit;              
wire             mult1_ex4_rst0_doub_ge;                
wire             mult1_ex4_rst0_doub_gr;                
wire             mult1_ex4_rst0_doub_lsb;               
wire             mult1_ex4_rst0_doub_rsbit;             
wire             mult1_ex4_rst0_doub_zero;              
wire             mult1_ex4_rst0_ge;                     
wire             mult1_ex4_rst0_gr;                     
wire             mult1_ex4_rst0_lsb;                    
wire             mult1_ex4_rst0_sing_gbit;              
wire             mult1_ex4_rst0_sing_ge;                
wire             mult1_ex4_rst0_sing_gr;                
wire             mult1_ex4_rst0_sing_lsb;               
wire             mult1_ex4_rst0_sing_rsbit;             
wire             mult1_ex4_rst0_sing_zero;              
wire             mult1_ex4_rst0_zero;                   
wire             mult1_ex4_rst1_add1;                   
wire             mult1_ex4_rst1_doub_gbit;              
wire             mult1_ex4_rst1_doub_ge;                
wire             mult1_ex4_rst1_doub_gr;                
wire             mult1_ex4_rst1_doub_lsb;               
wire             mult1_ex4_rst1_doub_rsbit;             
wire             mult1_ex4_rst1_doub_zero;              
wire             mult1_ex4_rst1_ge;                     
wire             mult1_ex4_rst1_gr;                     
wire             mult1_ex4_rst1_lsb;                    
wire             mult1_ex4_rst1_sing_gbit;              
wire             mult1_ex4_rst1_sing_ge;                
wire             mult1_ex4_rst1_sing_gr;                
wire             mult1_ex4_rst1_sing_lsb;               
wire             mult1_ex4_rst1_sing_rsbit;             
wire             mult1_ex4_rst1_sing_zero;              
wire             mult1_ex4_rst1_zero;                   
wire    [63 :0]  mult1_ex4_rst_abnorm;                  
wire    [63 :0]  mult1_ex4_rst_half_fma;                
wire    [63 :0]  mult1_ex4_rst_inf;                     
wire    [63 :0]  mult1_ex4_rst_lfn;                     
wire    [63 :0]  mult1_ex4_rst_norm;                    
wire    [63 :0]  mult1_ex4_rst_zero;                    
wire             mult1_ex4_sing_expnt1_of;              
wire             mult1_ex4_sing_potnt1_add_of;          
wire             mult1_ex4_sing_potnt1_sub_of;          
wire    [31 :0]  mult1_ex4_sing_rst_high;               
wire    [63 :0]  mult1_ex4_sing_rst_inf;                
wire    [63 :0]  mult1_ex4_sing_rst_lfn;                
wire    [63 :0]  mult1_ex5_doub_rst_norm;               
wire    [10 :0]  mult1_ex5_fma_expnt0_result;           
wire    [10 :0]  mult1_ex5_fma_expnt1_result;           
wire             mult1_ex5_fma_expnt_id;                
wire    [10 :0]  mult1_ex5_fma_expnt_result;            
wire    [4  :0]  mult1_ex5_fma_expt_result;             
wire    [52 :0]  mult1_ex5_fma_frac_result;             
wire    [63 :0]  mult1_ex5_fma_result;                  
wire             mult1_ex5_fma_result_abnorm;           
wire    [63 :0]  mult1_ex5_fwd_abnorm;                  
wire    [67 :0]  mult1_ex5_fwd_data;                    
wire    [63 :0]  mult1_ex5_fwd_norm;                    
wire    [63 :0]  mult1_ex5_rst_abnorm;                  
wire    [63 :0]  mult1_ex5_rst_norm;                    
wire    [63 :0]  mult1_ex5_sing_fwd_norm;               
wire    [31 :0]  mult1_ex5_sing_rst_high;               
wire    [63 :0]  mult1_ex5_sing_rst_norm;               
wire             mult1_simd_half0_sel;                  
wire             mult_ex1_ex2_half_pipedown;            
wire             mult_ex2_ex3_half_pipedown;            
wire             mult_ex3_ex4_half_pipedown;            
wire             mult_ex4_ex5_half_pipedown;            
wire             pad_yy_icg_scan_en;                    
wire             pipe6_pipex_ex4_fmla_fwd_vld;          
wire             pipe6_pipex_ex5_ex1_fmla_fwd_vld;      
wire             pipe6_pipex_ex5_ex2_fmla_fwd_vld;      
wire    [15 :0]  pipe6_vfmau_ex4_fmla_slicex_half0_data; 
wire    [67 :0]  pipe6_vfmau_ex5_fmla_slicex_data;      
wire             pipe7_pipex_ex4_fmla_fwd_vld;          
wire             pipe7_pipex_ex5_ex1_fmla_fwd_vld;      
wire             pipe7_pipex_ex5_ex2_fmla_fwd_vld;      
wire    [15 :0]  pipe7_vfmau_ex4_fmla_slicex_half0_data; 
wire    [67 :0]  pipe7_vfmau_ex5_fmla_slicex_data;      
wire             simd_half0_fma_mask;                   
wire    [21 :0]  simd_half0_product;                    
wire             slicex_dp_half0_mult_id;               
wire             slicex_dp_mult1_mult_id;               
wire    [4  :0]  slicex_mult1_dp_ex3_mult_expt;         
wire    [63 :0]  slicex_mult1_dp_ex3_mult_result;       
wire    [4  :0]  slicex_mult1_dp_ex4_expt;              
wire    [15 :0]  slicex_mult1_dp_ex4_half_fma_result;   
wire    [4  :0]  slicex_mult1_dp_ex5_fma_expt;          
wire    [63 :0]  slicex_mult1_dp_ex5_fma_result;        
wire    [67 :0]  slicex_mult1_dp_ex5_fwd_data;          
wire             vfpu_yy_xx_dqnan;                      


// &Depend("cpu_cfig.h"); @28

//==========================================================
//                    EX1  Stage
//==========================================================
//----------------------------------------------------------
//                 Operand Operation
//----------------------------------------------------------
//src0 operand
assign mult1_ex1_op0_sign        = dp_mult1_ex1_op0_slicex[63];
assign mult1_ex1_op0_expnt[10:0] = dp_mult1_ex1_op0_slicex[62:52];
assign mult1_ex1_op0_frac[51:0]  = dp_mult1_ex1_op0_slicex[51:0];

//src1 operand
assign mult1_ex1_op1_sign        = dp_mult1_ex1_op1_slicex[63];
assign mult1_ex1_op1_expnt[10:0] = dp_mult1_ex1_op1_slicex[62:52];
assign mult1_ex1_op1_frac[51:0]  = dp_mult1_ex1_op1_slicex[51:0];

//src2 operand
//Src2 can fwd from EX4 and EX5,but only Ex5 can offer complete
//information,so we will select op2 data at EX2 when EX4 fwd valid
// &Force("bus","pipe6_vfmau_ex5_fmla_slice0_data",67,0); @50
// &Force("bus","pipe7_vfmau_ex5_fmla_slice0_data",67,0); @51
// &CombBeg; @52
// &CombEnd; @62
assign mult1_ex1_op2_fwd_data[63:0] = 
   {64{pipe6_pipex_ex5_ex1_fmla_fwd_vld}} & pipe6_vfmau_ex5_fmla_slicex_data[63:0]
 | {64{pipe7_pipex_ex5_ex1_fmla_fwd_vld}} & pipe7_vfmau_ex5_fmla_slicex_data[63:0];

assign mult1_ex1_fmla_ex5_fwd_vld    = dp_xx_ex1_fma
                                    && (pipe6_pipex_ex5_ex1_fmla_fwd_vld
                                       || pipe7_pipex_ex5_ex1_fmla_fwd_vld);
assign mult1_ex1_fmla_ex4_fwd_vld    = dp_xx_ex1_fma
                                    && (pipe6_pipex_ex4_fmla_fwd_vld
                                        || pipe7_pipex_ex4_fmla_fwd_vld);

assign mult1_ex1_op2_sign        = (mult1_ex1_fmla_ex5_fwd_vld)
                                 ? mult1_ex1_op2_fwd_data[63]
                                 : dp_mult1_ex1_op2_slicex[63] && dp_xx_ex1_fma;
assign mult1_ex1_op2_expnt[10:0] = (mult1_ex1_fmla_ex5_fwd_vld)
                                 ? mult1_ex1_op2_fwd_data[62:52]
                                 : dp_mult1_ex1_op2_slicex[62:52] & {11{dp_xx_ex1_fma}};
assign mult1_ex1_op2_frac[51:0]  = (mult1_ex1_fmla_ex5_fwd_vld)
                                 ? mult1_ex1_op2_fwd_data[51:0]
                                 : dp_mult1_ex1_op2_slicex[51:0] & {52{dp_xx_ex1_fma}};

//the sign of multply 1 results
assign mult1_ex1_mult_result_sign = mult1_ex1_op0_sign
                                  ^ mult1_ex1_op1_sign
                                  ^ dp_xx_ex1_neg;

//exponent max detection
assign mult1_ex1_doub_expnt0_inf = &mult1_ex1_op0_expnt[10:0];
assign mult1_ex1_sing_expnt0_inf = &mult1_ex1_op0_expnt[7:0];

assign mult1_ex1_doub_expnt1_inf = &mult1_ex1_op1_expnt[10:0];
assign mult1_ex1_sing_expnt1_inf = &mult1_ex1_op1_expnt[7:0];

assign mult1_ex1_doub_expnt2_inf = &mult1_ex1_op2_expnt[10:0];
assign mult1_ex1_sing_expnt2_inf = &mult1_ex1_op2_expnt[7:0];

assign mult1_ex1_expnt0_inf      = (dp_xx_ex1_double)
                                 ? mult1_ex1_doub_expnt0_inf
                                 : mult1_ex1_sing_expnt0_inf;

assign mult1_ex1_expnt1_inf      = (dp_xx_ex1_double)
                                 ? mult1_ex1_doub_expnt1_inf
                                 : mult1_ex1_sing_expnt1_inf;
assign mult1_ex1_expnt2_inf      = (dp_xx_ex1_double) //widen single or double
                                 ? mult1_ex1_doub_expnt2_inf
                                 : mult1_ex1_sing_expnt2_inf;

//exponent zero
assign mult1_ex1_expnt0_zero    = ~|mult1_ex1_op0_expnt[10:0];
assign mult1_ex1_expnt1_zero    = ~|mult1_ex1_op1_expnt[10:0];
assign mult1_ex1_expnt2_zero    = ~|mult1_ex1_op2_expnt[10:0];

//fraction zero
assign mult1_ex1_frac0_all_zero = ~|mult1_ex1_op0_frac[51:0];
assign mult1_ex1_frac1_all_zero = ~|mult1_ex1_op1_frac[51:0];
assign mult1_ex1_frac2_all_zero = ~|mult1_ex1_op2_frac[51:0];

//fraction hidden bit
//for timing consideration,hidden bit calculation is simplied,
//but when fraction is zero,the result is abnormal,we deal with special
//path.
assign mult1_ex1_op0_hidden_bit = !(mult1_ex1_expnt0_zero);
assign mult1_ex1_op1_hidden_bit = !(mult1_ex1_expnt1_zero);

assign mult1_ex1_op0_high_vld   = (&dp_mult1_ex1_op0_slicex_high[31:0]) || dp_xx_ex1_simd;
assign mult1_ex1_op1_high_vld   = (&dp_mult1_ex1_op1_slicex_high[31:0]) || dp_xx_ex1_simd ;
assign mult1_ex1_op2_high_vld   = mult1_ex1_fmla_ex5_fwd_vld ||(&dp_mult1_ex1_op2_slicex_high[31:0]) || dp_xx_ex1_simd;

//----------------------------------------------------------
//                 Operand Special Number
//----------------------------------------------------------
//Norm
assign mult1_ex1_op0_norm  = !mult1_ex1_op0_zero && !mult1_ex1_expnt0_inf && !mult1_ex1_op0_cnan;
assign mult1_ex1_op1_norm  = !mult1_ex1_op1_zero && !mult1_ex1_expnt1_inf && !mult1_ex1_op1_cnan;

// infinity number
assign mult1_ex1_op0_inf   = mult1_ex1_expnt0_inf && mult1_ex1_frac0_all_zero && !mult1_ex1_op0_cnan;
assign mult1_ex1_op1_inf   = mult1_ex1_expnt1_inf && mult1_ex1_frac1_all_zero && !mult1_ex1_op1_cnan;
assign mult1_ex1_op2_inf   = mult1_ex1_expnt2_inf && mult1_ex1_frac2_all_zero && !mult1_ex1_op2_cnan && dp_xx_ex1_fma;

//zero
assign mult1_ex1_op0_zero  = mult1_ex1_expnt0_zero && mult1_ex1_frac0_all_zero && !mult1_ex1_op0_cnan;
assign mult1_ex1_op1_zero  = mult1_ex1_expnt1_zero && mult1_ex1_frac1_all_zero && !mult1_ex1_op1_cnan;

//denormalize number
assign mult1_ex1_op0_id    = mult1_ex1_expnt0_zero && ~mult1_ex1_frac0_all_zero && !mult1_ex1_op0_cnan;
assign mult1_ex1_op1_id    = mult1_ex1_expnt1_zero && ~mult1_ex1_frac1_all_zero && !mult1_ex1_op1_cnan;

//when single high not valid NaN-boxing ,data will be canonical-NaN
assign mult1_ex1_op0_cnan  = dp_xx_ex1_single && !mult1_ex1_op0_high_vld; 
assign mult1_ex1_op1_cnan  = dp_xx_ex1_single && !mult1_ex1_op1_high_vld; 
assign mult1_ex1_op2_cnan  = dp_xx_ex1_single && !mult1_ex1_op2_high_vld && dp_xx_ex1_fma && !dp_xx_ex1_widen; 

//sNaN
assign mult1_ex1_op0_snan  = mult1_ex1_expnt0_inf
                          && !mult1_ex1_op0_cnan
                          && !mult1_ex1_frac0_all_zero
                          && !mult1_ex1_op0_frac[51];  //msb of frac

assign mult1_ex1_op1_snan  = mult1_ex1_expnt1_inf
                          && !mult1_ex1_op1_cnan
                          && !mult1_ex1_frac1_all_zero
                          && !mult1_ex1_op1_frac[51];  //msb of frac

//when EX4 fwd valid,op2 can't be snan                          
assign mult1_ex1_op2_snan  = mult1_ex1_expnt2_inf
                          && !mult1_ex1_op2_cnan
                          && !mult1_ex1_frac2_all_zero
                          && !mult1_ex1_op2_frac[51];  //msb of frac

//qNaN
assign mult1_ex1_op0_qnan  = mult1_ex1_expnt0_inf && mult1_ex1_op0_frac[51] || mult1_ex1_op0_cnan; 
assign mult1_ex1_op1_qnan  = mult1_ex1_expnt1_inf && mult1_ex1_op1_frac[51] || mult1_ex1_op1_cnan; 
assign mult1_ex1_op2_qnan  = mult1_ex1_expnt2_inf && mult1_ex1_op2_frac[51] || mult1_ex1_op2_cnan;

assign mult1_ex1_op_id     = mult1_ex1_op0_id
                          || mult1_ex1_op1_id;

assign mult1_ex1_op_snan   = mult1_ex1_op0_snan
                          || mult1_ex1_op1_snan;

assign mult1_ex1_op_qnan   = mult1_ex1_op0_qnan
                          || mult1_ex1_op1_qnan;

//----------------------------------------------------------
//                    Exponent  Adding
//----------------------------------------------------------
assign mult1_ex1_expnt_addr_op0[10:0] = mult1_ex1_op0_expnt[10:0];
assign mult1_ex1_expnt_addr_op1[10:0] = mult1_ex1_op1_expnt[10:0];

//the mult bias is defined as follows:
//1. double      : bias = -1023
//2. single      : bias = -127
//3. single_widen: bias = 1023-127-127= 569
assign bias_select[2] = dp_xx_ex1_double;
assign bias_select[1] = dp_xx_ex1_single && !dp_xx_ex1_widen;
assign bias_select[0] = dp_xx_ex1_single && dp_xx_ex1_widen;

// &CombBeg; @209
always @( bias_select[2:0])
begin
case(bias_select[2:0])
  3'b100 : mult1_ex1_expnt_bias[12:0] = 13'h1c01; //-1023
  3'b010 : mult1_ex1_expnt_bias[12:0] = 13'h1f81; //-127
  3'b001 : mult1_ex1_expnt_bias[12:0] = 13'h0301; //769
  default: mult1_ex1_expnt_bias[12:0] = {13{1'bx}};
endcase
// &CombEnd; @216
end

//for fused multiply add inst,the initial expnt may be
//1. diff>=-2: E0+E1-bias+3 
//2. diff< -2: E2
// &CombBeg; @221
always @( bias_select[2:0])
begin
case(bias_select[2:0])
  3'b100 : mult1_ex1_expnt_plus_3_bias[12:0] = 13'h1c04; //-1020
  3'b010 : mult1_ex1_expnt_plus_3_bias[12:0] = 13'h1f84; //-124
  3'b001 : mult1_ex1_expnt_plus_3_bias[12:0] = 13'h0304; //772
  default: mult1_ex1_expnt_plus_3_bias[12:0] = {13{1'bx}};
endcase
// &CombEnd;   @228
end

assign mult1_ex1_mult_expnt_result[12:0] = {2'b0,mult1_ex1_expnt_addr_op0[10:0]}
                                         + {2'b0,mult1_ex1_expnt_addr_op1[10:0]}
                                         + mult1_ex1_expnt_bias[12:0];

assign mult1_ex1_mult_expnt_plus_3_result[12:0] = {2'b0,mult1_ex1_expnt_addr_op0[10:0]}
                                                + {2'b0,mult1_ex1_expnt_addr_op1[10:0]}
                                                + mult1_ex1_expnt_plus_3_bias[12:0];

//mult id contain:
//1. op0 or op2 contain ID
//2. mult expont < 0                                                
assign slicex_dp_mult1_mult_id = (mult1_ex1_op_id 
                                  || mult1_ex1_mult_expnt_result[12]) 
                              && mult1_ex1_op0_norm
                              && mult1_ex1_op1_norm;

//----------------------------------------------------------
//               Shift  Alignment Preparation
//----------------------------------------------------------
//1. shift amount preparation 
//      |<-------- 53 --------->|
//      +---+   +---------------+
// C:   | 1 | . |               |
//      +---+   +---------------+---+---+
//              |               | g | r |<------------------- 106 ------------------->|
//              |               +---+---+---+---+   +---------------------------------+
// AXB:         |                       |   |   | . |                                 |
//              |                       +---+---+   +---------------------------------+
//              |<------------ 56 ------------->|

// SA : shift alignment
// SA  = offset - (e2-(e0+e1))
//     = E0 + E1 - E2 - bias + offset
// for timing consideration and source use,SA is calcuated as follows:
// EX1 stage : 1. calculate  (E0 + E1 -bias)+offset
// EX2 stage : calculate (E0 + E1 - bias +offset) -E2
//for timing consideration,use 
//For multiply, when input contains denormal data, exponent should add
//1 or 2 
// &CombBeg; @278
always @( mult1_ex1_op0_id
       or mult1_ex1_op1_id)
begin
case({mult1_ex1_op0_id,mult1_ex1_op1_id})
  2'b11  : mult1_ex1_mult_id_adjust[12:0] = 13'b10;
  2'b10  : mult1_ex1_mult_id_adjust[12:0] = 13'b01;
  2'b01  : mult1_ex1_mult_id_adjust[12:0] = 13'b01;
  2'b00  : mult1_ex1_mult_id_adjust[12:0] = 13'b00; 
  default: mult1_ex1_mult_id_adjust[12:0] = {13{1'bx}};
endcase
// &CombEnd; @286
end

assign  mult1_ex1_expnt_sa_pre[12:0] = mult1_ex1_mult_expnt_result[12:0]
                                     + mult1_ex1_mult_id_adjust[12:0]
                                     + 13'd56;

//----------------------------------------------------------
//                multiply calculation
//----------------------------------------------------------
// &Instance("ct_vfmau_mult_compressor_simd","x_ct_vfmau_mult_compressor_simd"); @308
// &Connect(.cpurst_b        (cpurst_b                  ), @309
//          .op0_frac        (dp_xx_ex1_op0_slicex_frac ), @310
//          .op1_frac        (dp_xx_ex1_op1_slicex_frac ), @311
//          .pipe_down       (mult1_ex1_ex2_pipedown    ), @312
//          .simd_pipedown   (mult_ex1_ex2_sing_pipedown), @313
//          .sum             (compressor_mult1_sum        ), @314
//          .carry           (compressor_mult1_carry      )); @315
// &Instance("ct_vfmau_mult_compressor","x_ct_vfmau_mult_compressor"); @318
ct_vfmau_mult_compressor  x_ct_vfmau_mult_compressor (
  .carry                          (compressor_mult1_carry        ),
  .cp0_vfpu_icg_en                (cp0_vfpu_icg_en               ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .dp_xx_ex1_double               (dp_xx_ex1_double              ),
  .dp_xx_ex1_half                 (dp_xx_ex1_half                ),
  .dp_xx_ex1_single               (dp_xx_ex1_single              ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .mult1_ex1_op0_half0_hidden_bit (mult1_ex1_op0_half0_hidden_bit),
  .mult1_ex1_op0_hidden_bit       (mult1_ex1_op0_hidden_bit      ),
  .mult1_ex1_op1_half0_hidden_bit (mult1_ex1_op1_half0_hidden_bit),
  .mult1_ex1_op1_hidden_bit       (mult1_ex1_op1_hidden_bit      ),
  .op0_frac                       (dp_xx_ex1_op0_frac            ),
  .op1_frac                       (dp_xx_ex1_op1_frac            ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .pipe_down                      (mult1_ex1_ex2_pipedown        ),
  .simd_half0_product             (simd_half0_product            ),
  .sum                            (compressor_mult1_sum          )
);

// &Connect(.cpurst_b        (cpurst_b                ), @319
//          .op0_frac        (dp_xx_ex1_op0_frac      ), @320
//          .op1_frac        (dp_xx_ex1_op1_frac      ), @321
//          .pipe_down       (mult1_ex1_ex2_pipedown  ), @322
//          .sum             (compressor_mult1_sum    ), @323
//          .carry           (compressor_mult1_carry  )); @324

//----------------------------------------------------------
//                 NaN Result Selection
//----------------------------------------------------------
//when contain nan input and DNAN = 0, the result will qNaN,
//the output priority is:
// 1. sNaN > qNaN
// 2. src0 > src1 > src2
assign mult1_ex1_op0_snan_result[51:0] = {mult1_ex1_op0_sign,mult1_ex1_op0_frac[50:0]};
assign mult1_ex1_op1_snan_result[51:0] = {mult1_ex1_op1_sign,mult1_ex1_op1_frac[50:0]};
assign mult1_ex1_op0_qnan_result[51:0] = (mult1_ex1_op0_cnan)
                                       ? 52'h0
                                       : {mult1_ex1_op0_sign,mult1_ex1_op0_frac[50:0]};
assign mult1_ex1_op1_qnan_result[51:0] = (mult1_ex1_op1_cnan)
                                       ? 52'h0
                                       : {mult1_ex1_op1_sign,mult1_ex1_op1_frac[50:0]};
assign mult1_ex1_snan_result[51:0] = (mult1_ex1_op0_snan) 
                                   ? mult1_ex1_op0_snan_result[51:0]
                                   : mult1_ex1_op1_snan_result[51:0];
assign mult1_ex1_qnan_result[51:0] = (mult1_ex1_op0_qnan) 
                                   ? mult1_ex1_op0_qnan_result[51:0]
                                   : mult1_ex1_op1_qnan_result[51:0];
assign mult1_ex1_dqnan_result[51:0] = (mult1_ex1_op_snan)
                                    ? mult1_ex1_snan_result[51:0]
                                    : mult1_ex1_qnan_result[51:0];

// &CombBeg; @419
// &CombEnd; @427
// &CombBeg; @429
// &CombEnd; @438

//data selction signal for ex2


//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_mult1_ex1_ex2_gated_clk"); @498
gated_clk_cell  x_mult1_ex1_ex2_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (mult1_ex1_ex2_pipe_clk),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (mult1_ex1_ex2_clk_en  ),
  .module_en              (cp0_vfpu_icg_en       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

//  &Connect(.clk_in      (forever_cpuclk        ), @499
//           .external_en (1'b0                  ), @500
//           .global_en   (cp0_yy_clk_en         ), @501
//           .module_en   (cp0_vfpu_icg_en       ), @502
//           .local_en    (mult1_ex1_ex2_clk_en  ), @503
//           .clk_out     (mult1_ex1_ex2_pipe_clk)); @504

assign mult1_ex1_ex2_clk_en = mult1_ex1_ex2_pipedown && dp_mult1_ex1_clk_en;

always @(posedge mult1_ex1_ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mult1_ex2_op0_inf                        <= 1'b0;
    mult1_ex2_op1_inf                        <= 1'b0;
    mult1_ex2_op0_norm                       <= 1'b0;
    mult1_ex2_op1_norm                       <= 1'b0;
    mult1_ex2_op0_zero                       <= 1'b0;  
    mult1_ex2_op1_zero                       <= 1'b0;  
    mult1_ex2_op0_id                         <= 1'b0;
    mult1_ex2_op1_id                         <= 1'b0;
    mult1_ex2_op_id                          <= 1'b0;
    mult1_ex2_op_snan                        <= 1'b0;
    mult1_ex2_op_qnan                        <= 1'b0;
    mult1_ex2_op2_frac_pre[51:0]             <= 52'b0;
    mult1_ex2_op2_expnt_pre[10:0]            <= 11'b0;
    mult1_ex2_op2_sign_pre                   <= 1'b0;
    mult1_ex2_op2_inf_pre                    <= 1'b0;
    mult1_ex2_op2_expnt_zero_pre             <= 1'b0;
    mult1_ex2_op2_qnan_pre                   <= 1'b0;
    mult1_ex2_op2_cnan_pre                   <= 1'b0;
    mult1_ex2_op2_snan_pre                   <= 1'b0;
    mult1_ex2_mult_result_sign               <= 1'b0;
    mult1_ex2_mult_expnt_result[12:0]        <= 13'b0;
    mult1_ex2_mult_expnt_plus_3_result[12:0] <= 13'b0;
    mult1_ex2_expnt_sa_pre[12:0]             <= 13'b0;
    mult1_ex2_dqnan_result[51:0]             <= 52'b0;
    mult1_ex2_fmla_ex4_fwd_vld               <= 1'b0;
    mult1_ex2_fmla_ex5_fwd_vld               <= 1'b0;
  end
 else if(mult1_ex1_ex2_pipedown)
 begin
    mult1_ex2_op0_inf                        <= mult1_ex1_op0_inf;
    mult1_ex2_op1_inf                        <= mult1_ex1_op1_inf;
    mult1_ex2_op0_norm                       <= mult1_ex1_op0_norm;
    mult1_ex2_op1_norm                       <= mult1_ex1_op1_norm;
    mult1_ex2_op0_zero                       <= mult1_ex1_op0_zero;  
    mult1_ex2_op1_zero                       <= mult1_ex1_op1_zero;  
    mult1_ex2_op0_id                         <= mult1_ex1_op0_id;
    mult1_ex2_op1_id                         <= mult1_ex1_op1_id;
    mult1_ex2_op_id                          <= mult1_ex1_op_id;
    mult1_ex2_op_snan                        <= mult1_ex1_op_snan;
    mult1_ex2_op_qnan                        <= mult1_ex1_op_qnan;
    mult1_ex2_op2_frac_pre[51:0]             <= mult1_ex1_op2_frac[51:0];
    mult1_ex2_op2_expnt_pre[10:0]            <= mult1_ex1_op2_expnt[10:0];
    mult1_ex2_op2_sign_pre                   <= mult1_ex1_op2_sign;
    mult1_ex2_op2_inf_pre                    <= mult1_ex1_op2_inf;
    mult1_ex2_op2_expnt_zero_pre             <= mult1_ex1_expnt2_zero;
    mult1_ex2_op2_qnan_pre                   <= mult1_ex1_op2_qnan;
    mult1_ex2_op2_cnan_pre                   <= mult1_ex1_op2_cnan;
    mult1_ex2_op2_snan_pre                   <= mult1_ex1_op2_snan;
    mult1_ex2_mult_result_sign               <= mult1_ex1_mult_result_sign;
    mult1_ex2_mult_expnt_result[12:0]        <= mult1_ex1_mult_expnt_result[12:0];
    mult1_ex2_mult_expnt_plus_3_result[12:0] <= mult1_ex1_mult_expnt_plus_3_result[12:0];
    mult1_ex2_expnt_sa_pre[12:0]             <= mult1_ex1_expnt_sa_pre[12:0];
    mult1_ex2_dqnan_result[51:0]             <= mult1_ex1_dqnan_result[51:0];
    mult1_ex2_fmla_ex4_fwd_vld               <= mult1_ex1_fmla_ex4_fwd_vld;
    mult1_ex2_fmla_ex5_fwd_vld               <= mult1_ex1_fmla_ex5_fwd_vld;
 end
 else
 begin
    mult1_ex2_op0_inf                        <= mult1_ex2_op0_inf;
    mult1_ex2_op1_inf                        <= mult1_ex2_op1_inf;
    mult1_ex2_op0_norm                       <= mult1_ex2_op0_norm;
    mult1_ex2_op1_norm                       <= mult1_ex2_op1_norm;
    mult1_ex2_op0_zero                       <= mult1_ex2_op0_zero;  
    mult1_ex2_op1_zero                       <= mult1_ex2_op1_zero;  
    mult1_ex2_op0_id                         <= mult1_ex2_op0_id;
    mult1_ex2_op1_id                         <= mult1_ex2_op1_id;
    mult1_ex2_op_id                          <= mult1_ex2_op_id;
    mult1_ex2_op_snan                        <= mult1_ex2_op_snan;
    mult1_ex2_op_qnan                        <= mult1_ex2_op_qnan;
    mult1_ex2_op2_frac_pre[51:0]             <= mult1_ex2_op2_frac_pre[51:0];
    mult1_ex2_op2_expnt_pre[10:0]            <= mult1_ex2_op2_expnt_pre[10:0];
    mult1_ex2_op2_sign_pre                   <= mult1_ex2_op2_sign_pre;
    mult1_ex2_op2_inf_pre                    <= mult1_ex2_op2_inf_pre;
    mult1_ex2_op2_expnt_zero_pre             <= mult1_ex2_op2_expnt_zero_pre;
    mult1_ex2_op2_qnan_pre                   <= mult1_ex2_op2_qnan_pre;
    mult1_ex2_op2_cnan_pre                   <= mult1_ex2_op2_cnan_pre;
    mult1_ex2_op2_snan_pre                   <= mult1_ex2_op2_snan_pre;
    mult1_ex2_mult_result_sign               <= mult1_ex2_mult_result_sign;
    mult1_ex2_mult_expnt_result[12:0]        <= mult1_ex2_mult_expnt_result[12:0];
    mult1_ex2_mult_expnt_plus_3_result[12:0] <= mult1_ex2_mult_expnt_plus_3_result[12:0];
    mult1_ex2_expnt_sa_pre[12:0]             <= mult1_ex2_expnt_sa_pre[12:0];
    mult1_ex2_dqnan_result[51:0]             <= mult1_ex2_dqnan_result[51:0];
    mult1_ex2_fmla_ex4_fwd_vld               <= mult1_ex2_fmla_ex4_fwd_vld;
    mult1_ex2_fmla_ex5_fwd_vld               <= mult1_ex2_fmla_ex5_fwd_vld;
  end
end
    
//==========================================================
//                    EX2  Stage
//==========================================================
//Op2 Data Selection
parameter FWD_WIDTH = 68;
parameter FRAC      = 0;
parameter EXPNT     = 52;
parameter SIGN      = 63;
parameter INF       = 64;
parameter EXPNT_ZERO= 65;
parameter QNAN      = 66; 
parameter SNAN      = 67; 
assign mult1_ex2_op2_fwd_data[FWD_WIDTH-1:0] = 
    {FWD_WIDTH{pipe6_pipex_ex5_ex2_fmla_fwd_vld}} & pipe6_vfmau_ex5_fmla_slicex_data[FWD_WIDTH-1:0]
  | {FWD_WIDTH{pipe7_pipex_ex5_ex2_fmla_fwd_vld}} & pipe7_vfmau_ex5_fmla_slicex_data[FWD_WIDTH-1:0];

assign mult1_ex2_op2_inf         = (mult1_ex2_fmla_ex4_fwd_vld) 
                                 ? mult1_ex2_op2_fwd_data[INF]
                                 : mult1_ex2_op2_inf_pre;
assign mult1_ex2_op2_expnt_zero  = (mult1_ex2_fmla_ex4_fwd_vld)
                                 ? mult1_ex2_op2_fwd_data[EXPNT_ZERO]
                                 : mult1_ex2_op2_expnt_zero_pre;
assign mult1_ex2_op2_qnan        = (mult1_ex2_fmla_ex4_fwd_vld)
                                 ? mult1_ex2_op2_fwd_data[QNAN]
                                 : mult1_ex2_op2_qnan_pre;
assign mult1_ex2_op2_snan        = (mult1_ex2_fmla_ex4_fwd_vld)
                                 ? mult1_ex2_op2_fwd_data[SNAN]
                                 : mult1_ex2_op2_snan_pre;
assign mult1_ex2_op2_cnan        = (mult1_ex2_fmla_ex4_fwd_vld)
                                 ? 1'b0
                                 : mult1_ex2_op2_cnan_pre;
assign mult1_ex2_op2_sign        = (mult1_ex2_fmla_ex4_fwd_vld)   
                                 ? mult1_ex2_op2_fwd_data[SIGN]
                                 : mult1_ex2_op2_sign_pre;
assign mult1_ex2_op2_expnt[10:0] = (mult1_ex2_fmla_ex4_fwd_vld) 
                                 ? mult1_ex2_op2_fwd_data[EXPNT+10:EXPNT]
                                 : mult1_ex2_op2_expnt_pre[10:0];
assign mult1_ex2_op2_frac[52]    = (mult1_ex2_fmla_ex4_fwd_vld)
                                 ? !mult1_ex2_op2_fwd_data[EXPNT_ZERO] 
                                 : !mult1_ex2_op2_expnt_zero_pre;
assign mult1_ex2_op2_frac[51:0]  = (mult1_ex2_fmla_ex4_fwd_vld)
                                 ? mult1_ex2_op2_fwd_data[FRAC+51:FRAC]
                                 : mult1_ex2_op2_frac_pre[51:0];
assign mult1_ex2_op2_frac_zero   = ~(|mult1_ex2_op2_frac[51:0]);
assign mult1_ex2_op2_id          = mult1_ex2_op2_expnt_zero
                                && !mult1_ex2_op2_frac_zero
                                && !mult1_ex2_op2_cnan;
assign mult1_ex2_op2_zero        = mult1_ex2_op2_expnt_zero
                                && mult1_ex2_op2_frac_zero
                                && !mult1_ex2_op2_cnan;

assign mult1_ex2_sub_vld         = (mult1_ex2_mult_result_sign
                                    ^ mult1_ex2_op2_sign
                                    ^ dp_xx_ex2_sub
                                    ^ dp_xx_ex2_neg)
                                 && dp_xx_ex2_fma;

//----------------------------------------------------------
//                 Exponent Select
//----------------------------------------------------------
//For multiply, when input contains denormal data, exponent should add
//1 or 2 
// &CombBeg; @706
always @( mult1_ex2_op0_id
       or mult1_ex2_op1_id)
begin
case({mult1_ex2_op0_id,mult1_ex2_op1_id})
  2'b11  : mult1_ex2_mult_id_adjust[12:0] = 13'b10;
  2'b10  : mult1_ex2_mult_id_adjust[12:0] = 13'b01;
  2'b01  : mult1_ex2_mult_id_adjust[12:0] = 13'b01;
  2'b00  : mult1_ex2_mult_id_adjust[12:0] = 13'b00; 
  default: mult1_ex2_mult_id_adjust[12:0] = {13{1'bx}};
endcase
// &CombEnd; @714
end

//FMA Exponent
//(1) Calculate E0+E1-E2-Bias 
//(2) Determine whether E0+E1-E2-Bias>=-2
//(3) Calculate two type result:
//    (a) E0+E1-E2-Bias>=-2: Exponent_mult
//    (b) E0+E1-E2-Bias< -2: Exponent_op2  
assign mult1_ex2_expnt_diff[12:0] = mult1_ex2_mult_expnt_result[12:0]
                                  - {2'b0,mult1_ex2_op2_expnt[10:0]}
                                  + mult1_ex2_mult_id_adjust[12:0];

// &Force ("nonport","mult1_ex2_expnt_diff"); @726
// &Force ("nonport","mult1_ex2_expnt_diff_ge_neg2"); @727
//csky vperl_off
assign mult1_ex2_expnt_diff_ge_neg2 = (mult1_ex2_expnt_diff[12:0] == 13'h1ffe) && !mult1_ex2_op2_id //=-2
                                   || ($signed(mult1_ex2_expnt_diff[12:0]) > -2);  
//csky vperl_on

//E0+E1-E2-Bias>=-2: Exponent_mult
//exponent mult should adjusted according denormal input
assign mult1_ex2_fma_mult_expnt[12:0] = mult1_ex2_mult_expnt_plus_3_result[12:0]
                                      + mult1_ex2_mult_id_adjust[12:0];
///E0+E1-E2-Bias<-2: Exponent_op2
//exponent_op2 should adjusted according denormal input
assign mult1_ex2_op2_expnt_adjust[10:0] = (mult1_ex2_op2_id)
                                        ? 11'b1
                                        : mult1_ex2_op2_expnt[10:0];
assign mult1_ex2_fma_op2_expnt[12:0]    = (mult1_ex2_sa_result[12])
                                        ? {2'b0,mult1_ex2_op2_expnt_adjust[10:0]}
                                        : mult1_ex2_expnt_sa_pre[12:0]; 

//EX2 exponent can come from:
//1. Normal Multiply        : ex2_expnt = Exponent_mult
//2. Fused Multiply-add      
//  (a) E0+E1-E2-Bias >= -2 : ex2_expnt = Exponent_mult
//  (b) E0+E1-E2-Bias <-2   : ex2_expnt = Exponent_op2
assign mult1_ex2_expnt_select[0] = !dp_xx_ex2_fma && !dp_xx_ex2_mult_id;
assign mult1_ex2_expnt_select[1] = (dp_xx_ex2_fma || dp_xx_ex2_mult_id) && mult1_ex2_expnt_diff_ge_neg2;
assign mult1_ex2_expnt_select[2] = (dp_xx_ex2_fma || dp_xx_ex2_mult_id) && !mult1_ex2_expnt_diff_ge_neg2;

// &CombBeg; @755
always @( mult1_ex2_fma_mult_expnt[12:0]
       or mult1_ex2_mult_expnt_result[12:0]
       or mult1_ex2_expnt_select[2:0]
       or mult1_ex2_fma_op2_expnt[12:0])
begin
case(mult1_ex2_expnt_select[2:0])
  3'b001 : mult1_ex2_expnt[12:0] = mult1_ex2_mult_expnt_result[12:0];
  3'b010 : mult1_ex2_expnt[12:0] = mult1_ex2_fma_mult_expnt[12:0];
  3'b100 : mult1_ex2_expnt[12:0] = mult1_ex2_fma_op2_expnt[12:0];
  default: mult1_ex2_expnt[12:0] = {13{1'bx}};
endcase 
// &CombEnd; @762
end

assign mult1_ex2_mult_expnt_zero = ~(|mult1_ex2_mult_expnt_result[12:0]);

//----------------------------------------------------------
//                 Exception Detection
//----------------------------------------------------------
//1. IO exception contain:
//(1) input is sNaN 
//(2) 0xinf /inf*0
//(3) denorm *inf / inf*denorm  FM=0
//(4) for FMA inst: inf - inf  
assign mult1_ex2_potnt_nv = mult1_ex2_op_snan   //sNan
                         || mult1_ex2_op2_snan
                         || (mult1_ex2_op0_zero //0*inf
                            && mult1_ex2_op1_inf)
                         || (mult1_ex2_op1_zero //inf*0 
                            && mult1_ex2_op0_inf)
                         || (mult1_ex2_op0_inf  //inf*F -inf 
                            && mult1_ex2_op1_norm
                            && mult1_ex2_op2_inf
                            && mult1_ex2_sub_vld)
                         || (mult1_ex2_op1_inf  //F*inf -inf
                            && mult1_ex2_op0_norm
                            && mult1_ex2_op2_inf
                            && mult1_ex2_sub_vld)
                         || (mult1_ex2_op0_inf  //inf*inf -inf
                            && mult1_ex2_op1_inf
                            && mult1_ex2_op2_inf
                            && mult1_ex2_sub_vld);

// &Force("bus","dp_xx_ex2_oper_size",2,0); @795
assign mult1_ex2_nv = mult1_ex2_potnt_nv && !dp_xx_ex2_half;

//2. OF exception: for normal multiply
// single: E0+E1 - bias >=255
// double: E0+E1 - bias >= 2047
// &Force("nonport","mult1_ex2_doub_expnt_of"); @806
// &Force("nonport","mult1_ex2_sing_expnt_of"); @807
//csky vperl_off
assign mult1_ex2_doub_expnt_of = $signed(mult1_ex2_mult_expnt_result[12:0])>2046;
assign mult1_ex2_sing_expnt_of = $signed(mult1_ex2_mult_expnt_result[12:0])>254;
//csky vperl_on

assign mult1_ex2_expnt_of      = (dp_xx_ex2_double)
                               ? mult1_ex2_doub_expnt_of
                               : mult1_ex2_sing_expnt_of;

assign mult1_ex2_of            = !dp_xx_ex2_fma
                              && mult1_ex2_expnt_of
                              && mult1_ex2_op0_norm
                              && mult1_ex2_op1_norm
                              && !dp_xx_ex2_half;                               

//3 UD exception: for normal multiply
// single: E0+E1 - bias < 0
// double: E0+E1 - bias < 0
//undeflow will be judged at ex3/ex4

//4. IX exception
assign mult1_ex2_nx            = mult1_ex2_of;


//----------------------------------------------------------
//              Potential Exception Detection
//----------------------------------------------------------
//1. potential overflow
//single: E0+E1-bias = 254(0xfe)
//double: E0+E1-bias = 2046(0x7fe)
assign mult1_ex2_doub_potnt_of = (mult1_ex2_mult_expnt_result[12:0] == 13'h7fe);
assign mult1_ex2_sing_potnt_of = (mult1_ex2_mult_expnt_result[12:0] == 13'hfe);

assign mult1_ex2_expnt_potnt_of = (dp_xx_ex2_double)
                                ? mult1_ex2_doub_potnt_of
                                : mult1_ex2_sing_potnt_of;

assign mult1_ex2_potnt_of       = !dp_xx_ex2_fma
                               && mult1_ex2_op0_norm
                               && mult1_ex2_op1_norm
                               && mult1_ex2_expnt_potnt_of;

assign mult1_ex2_expt[4:0]     = { mult1_ex2_nv,1'b0,mult1_ex2_of,1'b0,mult1_ex2_nx};

//----------------------------------------------------------
//                    Shift Alignment 
//----------------------------------------------------------
//                                                        E  offset
//                                                        |     |
//                                                    +-------------+
//                                                  +-| 2-bit adder |   
//                                                  | +-------------+     +---------+
//                                   +-----------+  |        |            | 4:1 mux | 
//                                   |   3-bit   |  |        +----------->| 0,1,2,3 |
//                                 +-| dual addr |<-+                     +---------+
//                                 | +-----------+                             |
//                  +-----------+  |       |                        +----------------------+
//                  |   3-bit   |  |       +----------------------->|       8:1 mux        |
//                +-| dual addr |<-+                                | 0,4,8,12,16,20,24,28 |
//                | +-----------+                                   +----------------------+
// +-----------+  |      |                                                     |
// |   5-bit   |  |      |                                           +--------------------+  
// | dual addr |<-+      +------------------------------------------>|       6:1 mux      |
// +-----------+                                                     | 0,32,64,96,128,160 |
//       |                                                           +--------------------+
//       |                                                                     |
//       +                                                                     |                   
//       |                                                            no shift | 
//       |                  +----------+                                    |  |  | 
//       +----------------->| SA <= 0  |-----------+                    +---------------+
//                          +----------+           |                    |               | 
//                                                 +------------------->|    2:1 mux    |
//                                                                      +---------------+
assign mult1_ex2_sa_addr_op0[12:0] = mult1_ex2_expnt_sa_pre[12:0];
assign mult1_ex2_sa_addr_op1[12:0] = {2'b11,~mult1_ex2_op2_expnt[10:0]};

//SA[1:0]
assign mult1_ex2_sa_1_0[2:0]   = {1'b0,mult1_ex2_sa_addr_op0[1:0]}
                               + {1'b0,mult1_ex2_sa_addr_op1[1:0]}
                               + {2'b0,~mult1_ex2_op2_expnt_zero};

//SA[4:2]
assign mult1_ex2_c0_sa_4_2[3:0] = {1'b0,mult1_ex2_sa_addr_op0[4:2]}
                                + {1'b0,mult1_ex2_sa_addr_op1[4:2]};
assign mult1_ex2_c1_sa_4_2[3:0] = {1'b0,mult1_ex2_sa_addr_op0[4:2]}
                                + {1'b0,mult1_ex2_sa_addr_op1[4:2]}
                                + 4'b1;

// the msb is carry bit which is just used for another dual adder
assign mult1_ex2_sa_4_2[3:0]    = mult1_ex2_sa_1_0[2]
                                ? mult1_ex2_c1_sa_4_2[3:0]
                                : mult1_ex2_c0_sa_4_2[3:0];

//SA[7:5]
assign mult1_ex2_c0_sa_7_5[3:0] = {1'b0,mult1_ex2_sa_addr_op0[7:5]}
                                + {1'b0,mult1_ex2_sa_addr_op1[7:5]};
assign mult1_ex2_c1_sa_7_5[3:0] = {1'b0,mult1_ex2_sa_addr_op0[7:5]}
                                + {1'b0,mult1_ex2_sa_addr_op1[7:5]}
                                + 4'b1;
// the msb is carry bit which is just used for another dual adder
assign mult1_ex2_sa_7_5[3:0]    = mult1_ex2_sa_4_2[3]
                                ? mult1_ex2_c1_sa_7_5[3:0]
                                : mult1_ex2_c0_sa_7_5[3:0];

//SA[12:8]
assign mult1_ex2_c0_sa_12_8[4:0] = mult1_ex2_sa_addr_op0[12:8]
                                 + mult1_ex2_sa_addr_op1[12:8];
assign mult1_ex2_c1_sa_12_8[4:0] = mult1_ex2_sa_addr_op0[12:8]
                                 + mult1_ex2_sa_addr_op1[12:8]
                                 + 5'b1;
assign mult1_ex2_sa_12_8[4:0]    = mult1_ex2_sa_7_5[3]
                                 ? mult1_ex2_c1_sa_12_8[4:0]
                                 : mult1_ex2_c0_sa_12_8[4:0];

assign mult1_ex2_sa_result[12:0] = {mult1_ex2_sa_12_8[4:0]
                                   ,mult1_ex2_sa_7_5[2:0]
                                   ,mult1_ex2_sa_4_2[2:0]
                                   ,mult1_ex2_sa_1_0[1:0]};

//shift data preparation
// the lowest 2 bit is reserved for Guard and Round bit
assign mult1_ex2_op2_shift_pre[162:0] = {mult1_ex2_op2_frac[52:0],110'b0};
//first level shift
// &CombBeg; @958
always @( mult1_ex2_op2_shift_pre[162:0]
       or mult1_ex2_sa_1_0[1:0])
begin
  case(mult1_ex2_sa_1_0[1:0])
    2'b00  :mult1_ex2_op2_l1_shift[162:0] = mult1_ex2_op2_shift_pre[162:0];
    2'b01  :mult1_ex2_op2_l1_shift[162:0] = {1'b0,mult1_ex2_op2_shift_pre[162:1]};
    2'b10  :mult1_ex2_op2_l1_shift[162:0] = {2'b0,mult1_ex2_op2_shift_pre[162:2]};
    2'b11  :mult1_ex2_op2_l1_shift[162:0] = {3'b0,mult1_ex2_op2_shift_pre[162:3]};
    default:mult1_ex2_op2_l1_shift[162:0] = 163'b0;
  endcase
// &CombEnd; @966
end



//second level shift
// &CombBeg; @971
always @( mult1_ex2_sa_4_2[2:0]
       or mult1_ex2_op2_l1_shift[162:0])
begin
  case(mult1_ex2_sa_4_2[2:0])
    3'b000 :mult1_ex2_op2_l2_shift[162:0] = mult1_ex2_op2_l1_shift[162:0];
    3'b001 :mult1_ex2_op2_l2_shift[162:0] = {4'b0,mult1_ex2_op2_l1_shift[162:4]};
    3'b010 :mult1_ex2_op2_l2_shift[162:0] = {8'b0,mult1_ex2_op2_l1_shift[162:8]};
    3'b011 :mult1_ex2_op2_l2_shift[162:0] = {12'b0,mult1_ex2_op2_l1_shift[162:12]};
    3'b100 :mult1_ex2_op2_l2_shift[162:0] = {16'b0,mult1_ex2_op2_l1_shift[162:16]};
    3'b101 :mult1_ex2_op2_l2_shift[162:0] = {20'b0,mult1_ex2_op2_l1_shift[162:20]};
    3'b110 :mult1_ex2_op2_l2_shift[162:0] = {24'b0,mult1_ex2_op2_l1_shift[162:24]};
    3'b111 :mult1_ex2_op2_l2_shift[162:0] = {28'b0,mult1_ex2_op2_l1_shift[162:28]};
    default:mult1_ex2_op2_l2_shift[162:0] = 163'b0;
  endcase
// &CombEnd; @983
end

//third level shift
// &CombBeg; @986
always @( mult1_ex2_sa_7_5[2:0]
       or mult1_ex2_op2_l2_shift[162:0])
begin
  case(mult1_ex2_sa_7_5[2:0])
    3'b000 :mult1_ex2_op2_l3_shift[162:0] = mult1_ex2_op2_l2_shift[162:0];
    3'b001 :mult1_ex2_op2_l3_shift[162:0] = {32'b0,mult1_ex2_op2_l2_shift[162:32]};
    3'b010 :mult1_ex2_op2_l3_shift[162:0] = {64'b0,mult1_ex2_op2_l2_shift[162:64]};
    3'b011 :mult1_ex2_op2_l3_shift[162:0] = {96'b0,mult1_ex2_op2_l2_shift[162:96]};
    3'b100 :mult1_ex2_op2_l3_shift[162:0] = {128'b0,mult1_ex2_op2_l2_shift[162:128]};
    3'b101 :mult1_ex2_op2_l3_shift[162:0] = {160'b0,mult1_ex2_op2_l2_shift[162:160]};
    default:mult1_ex2_op2_l3_shift[162:0] = 163'b0;
  endcase
// &CombEnd; @996
end

assign mult1_ex2_sa_lt_0   = mult1_ex2_sa_result[12];
// &Force("nonport","mult1_ex2_sa_ge_163"); @999
//csky vperl_off
assign mult1_ex2_sa_ge_163 = $signed(mult1_ex2_sa_result[12:0]) > 162;
//csky vperl_on
// &CombBeg; @1003
always @( mult1_ex2_sa_lt_0
       or mult1_ex2_sa_ge_163
       or mult1_ex2_op2_l3_shift[162:0]
       or mult1_ex2_op2_frac[52:0])
begin
case({mult1_ex2_sa_lt_0,mult1_ex2_sa_ge_163})
  2'b10  : mult1_ex2_op2_shift_sel[162:0] = {mult1_ex2_op2_frac[52:0],110'b0};
  2'b01  : mult1_ex2_op2_shift_sel[162:0] = 163'b0;
  default: mult1_ex2_op2_shift_sel[162:0] = mult1_ex2_op2_l3_shift[162:0];
endcase
// &CombEnd; @1009
end

assign mult1_ex2_op2_sa_result[162:0] = (mult1_ex2_sub_vld) 
                                      ? ~mult1_ex2_op2_shift_sel[162:0]
                                      : mult1_ex2_op2_shift_sel[162:0];

//sticky calculation 
//1.  110 <sa < 163 sticky = |frac_shift_out
//2.  sa<=110  sa = 0
//3.  sa>=161 sa = 0,the result won't be used
// &CombBeg; @1019
always @( mult1_ex2_sa_result[7:0]
       or mult1_ex2_op2_frac[51:0])
begin
  case(mult1_ex2_sa_result[7:0])
    8'd111: mult1_ex2_sticky1 = mult1_ex2_op2_frac[0];
    8'd112: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[1:0];
    8'd113: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[2:0];
    8'd114: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[3:0];
    8'd115: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[4:0];
    8'd116: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[5:0];
    8'd117: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[6:0];
    8'd118: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[7:0];
    8'd119: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[8:0];
    8'd120: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[9:0];
    8'd121: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[10:0];
    8'd122: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[11:0];
    8'd123: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[12:0];
    8'd124: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[13:0];
    8'd125: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[14:0];
    8'd126: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[15:0];
    8'd127: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[16:0];
    8'd128: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[17:0];
    8'd129: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[18:0];
    8'd130: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[19:0];
    8'd131: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[20:0];
    8'd132: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[21:0];
    8'd133: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[22:0];
    8'd134: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[23:0];
    8'd135: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[24:0];
    8'd136: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[25:0];
    8'd137: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[26:0];
    8'd138: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[27:0];
    8'd139: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[28:0];
    8'd140: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[29:0];
    8'd141: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[30:0];
    8'd142: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[31:0];
    8'd143: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[32:0];
    8'd144: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[33:0];
    8'd145: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[34:0];
    8'd146: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[35:0];
    8'd147: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[36:0];
    8'd148: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[37:0];
    8'd149: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[38:0];
    8'd150: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[39:0];
    8'd151: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[40:0];
    8'd152: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[41:0];
    8'd153: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[42:0];
    8'd154: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[43:0];
    8'd155: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[44:0];
    8'd156: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[45:0];
    8'd157: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[46:0];
    8'd158: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[47:0];
    8'd159: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[48:0];
    8'd160: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[49:0];
    8'd161: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[50:0];
    8'd162: mult1_ex2_sticky1 = |mult1_ex2_op2_frac[51:0];
    default: mult1_ex2_sticky1 = 1'b0;
  endcase
// &CombEnd; @1075
end

assign mult1_ex2_ex3_sticky1 = (mult1_ex2_sa_lt_0)
                               ? 1'b0
                               : (mult1_ex2_sa_ge_163)
                                 ? |mult1_ex2_op2_frac[52:0]
                                 : mult1_ex2_sticky1;
                                 
//----------------------------------------------------------
//                 EX2 Mult result
//----------------------------------------------------------
// &CombBeg; @1087
// &CombEnd; @1095
// &CombBeg; @1098
// &CombEnd; @1107
// &CombBeg; @1109
// &CombEnd; @1118
assign mult1_ex2_mult_sum[105:0]        = (dp_xx_ex2_double)   
                                        ? compressor_mult1_sum[105:0]                                       
                                        : {compressor_mult1_sum[47:0],58'b0};
assign mult1_ex2_mult_carry[105:0]      = (dp_xx_ex2_double)
                                        ? compressor_mult1_carry[105:0]
                                        : {compressor_mult1_carry[47:0],58'b0};
assign mult1_ex2_mult_frac_adder[105:0] = mult1_ex2_mult_sum[105:0] + mult1_ex2_mult_carry[105:0];
assign mult1_ex2_mult_frac[105:0]       = mult1_ex2_mult_frac_adder[105:0]; 
assign mult1_ex2_sum[105:0]        = mult1_ex2_mult_frac[105:0];                                    
assign mult1_ex2_carry[163:1]      = mult1_ex2_op2_sa_result[162:0];
assign mult1_ex2_carry[0]          = (mult1_ex2_sub_vld)
                                   ? ~mult1_ex2_ex3_sticky1
                                   : mult1_ex2_ex3_sticky1;                                   


//----------------------------------------------------------
//                  Special Result
//----------------------------------------------------------
assign mult1_ex2_result_mask   = (dp_mult1_op2_slicex_vm_mask 
                                  || dp_mult1_op2_slicex_vl_mask)
                               && dp_xx_ex2_simd;

assign mult1_ex2_result_qnan    = (mult1_ex2_op_qnan
                                   || mult1_ex2_op2_cnan
                                   || mult1_ex2_op2_qnan
                                   || mult1_ex2_nv)
                                && !mult1_ex2_result_mask
                                && !(dp_xx_ex2_half && !dp_xx_ex2_widen);
//special: op2 is zero,result is zero
assign mult1_ex2_result_op2     = 
    dp_xx_ex2_fma
 && !mult1_ex2_result_mask
 && !mult1_ex2_result_qnan
 && !mult1_ex2_op2_zero
 && !mult1_ex2_op2_inf
 && !(dp_xx_ex2_half && !dp_xx_ex2_widen)
 && (mult1_ex2_op0_zero || mult1_ex2_op1_zero);

// &CombBeg; @1177
always @( mult1_ex2_op_qnan
       or mult1_ex2_dqnan_result[51:0]
       or mult1_ex2_op2_snan_result[51:0]
       or mult1_ex2_op2_qnan
       or mult1_ex2_op2_qnan_result[51:0]
       or mult1_ex2_op2_snan
       or mult1_ex2_op_snan)
begin
casez({mult1_ex2_op_snan,
      mult1_ex2_op2_snan,
      mult1_ex2_op_qnan,
      mult1_ex2_op2_qnan})
  4'b1???: mult1_ex2_qnan_result[51:0] = mult1_ex2_dqnan_result[51:0];
  4'b01??: mult1_ex2_qnan_result[51:0] = mult1_ex2_op2_snan_result[51:0];
  4'b001?: mult1_ex2_qnan_result[51:0] = mult1_ex2_dqnan_result[51:0];
  4'b0001: mult1_ex2_qnan_result[51:0] = mult1_ex2_op2_qnan_result[51:0];
  default: mult1_ex2_qnan_result[51:0] = 52'b0;
endcase
// &CombEnd; @1188
end
assign mult1_ex2_op2_snan_result[51:0] = {mult1_ex2_op2_sign,mult1_ex2_op2_frac[50:0]};
assign mult1_ex2_op2_qnan_result[51:0] = (mult1_ex2_op2_cnan)
                                       ? 52'b0
                                       : {mult1_ex2_op2_sign,mult1_ex2_op2_frac[50:0]};

assign mult1_ex2_nan_result[51:0]      = (vfpu_yy_xx_dqnan)
                                       ? mult1_ex2_qnan_result[51:0]
                                       : 52'b0;

assign mult1_ex2_result_inf     = 
    !mult1_ex2_result_qnan
 && !mult1_ex2_result_mask
 && !(dp_xx_ex2_half && !dp_xx_ex2_widen)
 && (mult1_ex2_op0_inf || mult1_ex2_op1_inf || mult1_ex2_op2_inf);

assign mult1_ex2_result_zero    = 
       !mult1_ex2_result_qnan
    && !mult1_ex2_result_mask
    && !(dp_xx_ex2_half && !dp_xx_ex2_widen)
    && mult1_ex2_op2_zero
    && (mult1_ex2_op0_zero || mult1_ex2_op1_zero);

assign mult1_ex2_result_abnorm    =  mult1_ex2_result_qnan
                                  || mult1_ex2_result_op2
                                  || mult1_ex2_result_inf
                                  || mult1_ex2_result_zero
                                  || mult1_ex2_result_mask;

assign mult1_ex2_result_op2_sign  = mult1_ex2_mult_result_sign
                                  ^ mult1_ex2_sub_vld;

assign mult1_ex2_result_zero_sign = (mult1_ex2_sub_vld)
                                  ? (dp_xx_ex2_rm[2:0] == 3'b10) //RDN
                                  : mult1_ex2_mult_result_sign;

assign mult1_ex2_result_inf_sign  = 
    mult1_ex2_op2_inf && (mult1_ex2_mult_result_sign ^ mult1_ex2_sub_vld)
 || (mult1_ex2_op0_inf|| mult1_ex2_op1_inf) && mult1_ex2_mult_result_sign;


assign mult1_ex2_doub_masked_result[63:0] = 64'b0;
assign mult1_ex2_sing_masked_result[31:0] = 32'b0; 

assign mult1_ex2_sing_abnorm_result[31:0] = 
    {32{mult1_ex2_result_qnan}} & {mult1_ex2_nan_result[51],9'h1ff,mult1_ex2_nan_result[50:29]}
  | {32{mult1_ex2_result_mask}} & mult1_ex2_sing_masked_result[31:0]
  | {32{mult1_ex2_result_op2}}  & {mult1_ex2_result_op2_sign,mult1_ex2_op2_expnt[7:0],mult1_ex2_op2_frac[51:29]}
  | {32{mult1_ex2_result_inf}}  & {mult1_ex2_result_inf_sign,8'hff,23'b0}
  | {32{mult1_ex2_result_zero}} & {mult1_ex2_result_zero_sign,31'b0};

assign mult1_ex2_doub_abnorm_result[63:0] = 
    {64{mult1_ex2_result_qnan}} & {mult1_ex2_nan_result[51],12'hfff,mult1_ex2_nan_result[50:0]}
  | {64{mult1_ex2_result_mask}} & mult1_ex2_doub_masked_result[63:0]
  | {64{mult1_ex2_result_op2}}  & {mult1_ex2_result_op2_sign,mult1_ex2_op2_expnt[10:0],mult1_ex2_op2_frac[51:0]}
  | {64{mult1_ex2_result_inf}}  & {mult1_ex2_result_inf_sign,11'h7ff,52'b0}
  | {64{mult1_ex2_result_zero}} & {mult1_ex2_result_zero_sign,63'b0};


assign mult1_ex2_abnorm_result[63:0] = (dp_xx_ex2_double)
                                     ? mult1_ex2_doub_abnorm_result[63:0]
                                     : {32'hffffffff,mult1_ex2_sing_abnorm_result[31:0]};


assign mult1_ex2_half_mult_result[63:0] = {48'hffffffffffff,half0_mult_result[15:0]};
assign mult1_ex2_half_expt[4:0]         = half0_mult_expt[4:0];

//BIT0: INF
//BIT1: EXPNT_ZERO
//BIT2: QNAN
//BIT3: SNAN
assign mult1_ex2_special_type[0] = mult1_ex2_result_inf 
                                || mult1_ex2_result_mask && !dp_mult1_op2_slicex_vl_mask && mult1_ex2_op2_inf;
assign mult1_ex2_special_type[1] = mult1_ex2_result_mask && !dp_mult1_op2_slicex_vl_mask && mult1_ex2_op2_expnt_zero
                                || mult1_ex2_result_mask && dp_mult1_op2_slicex_vl_mask
                                || mult1_ex2_result_op2  && mult1_ex2_op2_expnt_zero
                                || mult1_ex2_result_zero;
assign mult1_ex2_special_type[2] = mult1_ex2_result_qnan
                                || mult1_ex2_result_mask && !dp_mult1_op2_slicex_vl_mask && mult1_ex2_op2_qnan;
assign mult1_ex2_special_type[3] = mult1_ex2_result_mask && !dp_mult1_op2_slicex_vl_mask && mult1_ex2_op2_snan;

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_mult1_ex2_ex3_gated_clk"); @1307
gated_clk_cell  x_mult1_ex2_ex3_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (mult1_ex2_ex3_pipe_clk),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (mult1_ex2_ex3_clk_en  ),
  .module_en              (cp0_vfpu_icg_en       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

//  &Connect(.clk_in      (forever_cpuclk), @1308
//           .external_en (1'b0), @1309
//           .global_en   (cp0_yy_clk_en), @1310
//           .module_en   (cp0_vfpu_icg_en), @1311
//           .local_en    (mult1_ex2_ex3_clk_en), @1312
//           .clk_out     (mult1_ex2_ex3_pipe_clk)); @1313

assign mult1_ex2_ex3_clk_en = mult1_ex2_ex3_pipedown && dp_mult1_ex2_clk_en;

//  &Instance("gated_clk_cell", "x_mult1_ex2_ex3_special_gated_clk"); @1317
gated_clk_cell  x_mult1_ex2_ex3_special_gated_clk (
  .clk_in                         (forever_cpuclk                ),
  .clk_out                        (mult1_ex2_ex3_special_pipe_clk),
  .external_en                    (1'b0                          ),
  .global_en                      (cp0_yy_clk_en                 ),
  .local_en                       (mult1_ex2_ex3_special_pipedown),
  .module_en                      (cp0_vfpu_icg_en               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            )
);

//  &Connect(.clk_in      (forever_cpuclk), @1318
//           .external_en (1'b0), @1319
//           .global_en   (cp0_yy_clk_en), @1320
//           .module_en   (cp0_vfpu_icg_en), @1321
//           .local_en    (mult1_ex2_ex3_special_pipedown), @1322
//           .clk_out     (mult1_ex2_ex3_special_pipe_clk)); @1323

assign mult1_ex2_ex3_special_pipedown = (mult_ex2_ex3_half_pipedown ^ mult1_ex2_ex3_pipedown)
                                     && dp_mult1_ex2_clk_en; 

//----------------------------------------------------------
//                 EX2 EX3 pipedown data
//----------------------------------------------------------
always @(posedge mult1_ex2_ex3_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mult1_ex3_potnt_of               <= 1'b0;
    mult1_ex3_sticky1                <= 1'b0;
    mult1_ex3_op_id                  <= 1'b0;
    mult1_ex3_sub_vld                <= 1'b0;
    mult1_ex3_expnt_diff_ge_neg2     <= 1'b0;
    mult1_ex3_expnt_diff_ge_neg2_dup <= 1'b0;
    mult1_ex3_mult_result_sign       <= 1'b0;
    mult1_ex3_expnt[12:0]            <= 13'b0;
    mult1_ex3_mult_frac[105:0]       <= 106'b0;
    mult1_ex3_sum[105:0]             <= 106'b0;
    mult1_ex3_carry[163:0]           <= 164'b0;
    mult1_ex3_expnt_zero             <= 1'b0;
  end
  else if(mult1_ex2_ex3_pipedown)
  begin
    mult1_ex3_potnt_of               <= mult1_ex2_potnt_of;         
    mult1_ex3_sticky1                <= mult1_ex2_ex3_sticky1; 
    mult1_ex3_op_id                  <= mult1_ex2_op_id;    
    mult1_ex3_sub_vld                <= mult1_ex2_sub_vld;      
    mult1_ex3_expnt_diff_ge_neg2     <= mult1_ex2_expnt_diff_ge_neg2;
    mult1_ex3_expnt_diff_ge_neg2_dup <= mult1_ex2_expnt_diff_ge_neg2;
    mult1_ex3_mult_result_sign       <= mult1_ex2_mult_result_sign; 
    mult1_ex3_expnt[12:0]            <= mult1_ex2_expnt[12:0];      
    mult1_ex3_mult_frac[105:0]       <= mult1_ex2_mult_frac[105:0];       
    mult1_ex3_sum[105:0]             <= mult1_ex2_sum[105:0];       
    mult1_ex3_carry[163:0]           <= mult1_ex2_carry[163:0]; 
    mult1_ex3_expnt_zero             <= mult1_ex2_mult_expnt_zero;
  end
  else
  begin
    mult1_ex3_potnt_of               <= mult1_ex3_potnt_of;         
    mult1_ex3_sticky1                <= mult1_ex3_sticky1;         
    mult1_ex3_op_id                  <= mult1_ex3_op_id;    
    mult1_ex3_sub_vld                <= mult1_ex3_sub_vld;        
    mult1_ex3_expnt_diff_ge_neg2     <= mult1_ex3_expnt_diff_ge_neg2;
    mult1_ex3_expnt_diff_ge_neg2_dup <= mult1_ex3_expnt_diff_ge_neg2_dup;
    mult1_ex3_mult_result_sign       <= mult1_ex3_mult_result_sign; 
    mult1_ex3_expnt[12:0]            <= mult1_ex3_expnt[12:0];      
    mult1_ex3_mult_frac[105:0]       <= mult1_ex3_mult_frac[105:0];       
    mult1_ex3_sum[105:0]             <= mult1_ex3_sum[105:0];       
    mult1_ex3_carry[163:0]           <= mult1_ex3_carry[163:0];     
    mult1_ex3_expnt_zero             <= mult1_ex3_expnt_zero;
  end
end

always @(posedge mult1_ex2_ex3_special_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mult1_ex3_result_abnorm          <= 1'b0;
    mult1_ex3_expt[4:0]              <= 5'b0;
    mult1_ex3_abnorm_result[63:0]    <= 64'b0;
    mult1_ex3_half_mult_result[63:0] <= 64'b0;
    mult1_ex3_half_expt[4:0]         <= 5'b0;
    mult1_ex3_special_type[3:0]      <= 4'b0;
  end
  else if(mult1_ex2_ex3_special_pipedown)
  begin
    mult1_ex3_result_abnorm          <= mult1_ex2_result_abnorm;      
    mult1_ex3_abnorm_result[63:0]    <= mult1_ex2_abnorm_result[63:0];
    mult1_ex3_expt[4:0]              <= mult1_ex2_expt[4:0];        
    mult1_ex3_half_mult_result[63:0] <= mult1_ex2_half_mult_result[63:0];
    mult1_ex3_half_expt[4:0]         <= mult1_ex2_half_expt[4:0];
    mult1_ex3_special_type[3:0]      <= mult1_ex2_special_type[3:0];
  end
  else
  begin
    mult1_ex3_result_abnorm          <= mult1_ex3_result_abnorm;      
    mult1_ex3_abnorm_result[63:0]    <= mult1_ex3_abnorm_result[63:0];
    mult1_ex3_expt[4:0]              <= mult1_ex3_expt[4:0];        
    mult1_ex3_half_mult_result[63:0] <= mult1_ex3_half_mult_result[63:0];
    mult1_ex3_half_expt[4:0]         <= mult1_ex3_half_expt[4:0];
    mult1_ex3_special_type[3:0]      <= mult1_ex3_special_type[3:0];
  end
end

//==========================================================
//                    EX3  Stage
//==========================================================
//----------------------------------------------------------
//                   Half Mult Output
//----------------------------------------------------------
assign slicex_mult1_dp_ex3_mult_result[63:0] = mult1_ex3_half_mult_result[63:0];
assign slicex_mult1_dp_ex3_mult_expt[4:0]    = mult1_ex3_half_expt[4:0];

//----------------------------------------------------------
//                   Fraction Add
//----------------------------------------------------------
//For timing consideration,we calculate a+b and a+b+1 at the same time
//noted that the lsb is sticky bit, add this bit to adder is to solve one
//satuation:when FMA is sub operation and the sitkcy bit is 1, the adder
//result should sub 1,when add this bit,we can generate valid borrow bit
assign mult1_ex3_addr0[164:0] = {mult1_ex3_sub_vld,55'b0,mult1_ex3_sum[105:0],3'b0};
assign mult1_ex3_addr1[164:0] = {1'b0,mult1_ex3_carry[163:0]};

assign mult1_ex3_addr_result[164:0]        = mult1_ex3_addr0[164:0] + mult1_ex3_addr1[164:0];
assign mult1_ex3_addr_plus_1_result[164:0] = mult1_ex3_addr0[164:0] + mult1_ex3_addr1[164:0] + 1'b1;

//the FMA result can be:
//1. Add operation: choose a+b as result
//2. Sub operation and a>=b,choose a+b+1 as result
//3. Sub operation and a<b, choose ~(a+b) as result
assign mult1_ex3_frac_result_add = !mult1_ex3_sub_vld;
assign mult1_ex3_frac_result_neg = mult1_ex3_addr_plus_1_result[164] && mult1_ex3_sub_vld;
assign mult1_ex3_frac_result_sub = !mult1_ex3_addr_plus_1_result[164] && mult1_ex3_sub_vld;

// &CombBeg; @1441
always @( mult1_ex3_frac_result_neg
       or mult1_ex3_frac_result_add
       or mult1_ex3_addr_plus_1_result[163:0]
       or mult1_ex3_frac_result_sub
       or mult1_ex3_addr_result[163:0])
begin
case({mult1_ex3_frac_result_add,
      mult1_ex3_frac_result_neg,
      mult1_ex3_frac_result_sub})
 3'b100:  mult1_ex3_frac_result[163:0] = mult1_ex3_addr_result[163:0];
 3'b010:  mult1_ex3_frac_result[163:0] = ~mult1_ex3_addr_result[163:0];
 3'b001:  mult1_ex3_frac_result[163:0] = mult1_ex3_addr_plus_1_result[163:0];
 default: mult1_ex3_frac_result[163:0] = {164{1'bx}};
 endcase
// &CombEnd; @1450
end

assign mult1_ex3_frac_shift_53            = mult1_ex3_expnt_diff_ge_neg2; 
assign mult1_ex3_frac_result_shift[110:0] = (mult1_ex3_frac_shift_53)
                                          ? mult1_ex3_frac_result[110:0]
                                          : mult1_ex3_frac_result[163:53];

assign mult1_ex3_ex4_sticky1 = (mult1_ex3_expnt_diff_ge_neg2)
                             ? mult1_ex3_sticky1 
                             : mult1_ex3_sticky1 || (|mult1_ex3_sum[49:0]);

//----------------------------------------------------------
//                  Leading Zero Anticipation
//----------------------------------------------------------
assign mult1_ex3_lza_summand[107:0] = (mult1_ex3_expnt_diff_ge_neg2_dup) 
                                    ? {2'b0,mult1_ex3_sum[105:0]}
                                    : {55'b0,mult1_ex3_sum[105:53]};

assign mult1_ex3_lza_addend[107:0]  = (mult1_ex3_expnt_diff_ge_neg2_dup) 
                                     ? mult1_ex3_carry[110:3]
                                     : mult1_ex3_carry[163:56];

// &Instance("ct_vfmau_lza","x_ct_vfmau_lza"); @1472
ct_vfmau_lza  x_ct_vfmau_lza (
  .addend                (mult1_ex3_lza_addend ),
  .lza_result            (mult1_ex3_lza_result ),
  .sub_vld               (mult1_ex3_sub_vld    ),
  .summand               (mult1_ex3_lza_summand)
);

// &Connect(.summand           (mult1_ex3_lza_summand      ), @1473
//          .addend            (mult1_ex3_lza_addend       ), @1474
//          .lza_result        (mult1_ex3_lza_result       ), @1475
//          .sub_vld           (mult1_ex3_sub_vld          )); @1476

//----------------------------------------------------------
//                 FMA Data Preparation 
//----------------------------------------------------------
assign mult1_ex3_fma_sign = mult1_ex3_mult_result_sign
                          ^ mult1_ex3_frac_result_neg;

//----------------------------------------------------------
//               Normal Multiply Rounding
//----------------------------------------------------------
assign mult1_ex3_rshift_sel             = mult1_ex3_expnt_zero;
assign mult1_ex3_mult_frac_shift[105:0] = (mult1_ex3_rshift_sel)
                                        ? {1'b0,mult1_ex3_mult_frac[105:1]}
                                        : mult1_ex3_mult_frac[105:0];
assign mult1_ex3_mult_doub_sticky = mult1_ex3_rshift_sel && mult1_ex3_mult_frac[0];
assign mult1_ex3_mult_sing_sticky = mult1_ex3_rshift_sel && mult1_ex3_mult_frac[58];

assign mult1_ex3_rst_105_select = mult1_ex3_mult_frac_shift[105];

//frac reuslt lsb:
assign mult1_ex3_rst_doub_lsb   = (mult1_ex3_rst_105_select)
                                ? mult1_ex3_mult_frac_shift[53]
                                : mult1_ex3_mult_frac_shift[52];
assign mult1_ex3_rst_sing_lsb   = (mult1_ex3_rst_105_select)
                                ? mult1_ex3_mult_frac_shift[82]
                                : mult1_ex3_mult_frac_shift[81];

assign mult1_ex3_rst_lsb        = (dp_xx_ex3_double)
                                ? mult1_ex3_rst_doub_lsb
                                : mult1_ex3_rst_sing_lsb;

//frac result guard bit
assign mult1_ex3_rst_doub_gbit  = (mult1_ex3_rst_105_select)
                                ? mult1_ex3_mult_frac_shift[52]
                                : mult1_ex3_mult_frac_shift[51];
assign mult1_ex3_rst_sing_gbit  = (mult1_ex3_rst_105_select)
                                ? mult1_ex3_mult_frac_shift[81]
                                : mult1_ex3_mult_frac_shift[80];

//frac result sticky bit contain:
//1. round bit
//2. sticky bit
assign mult1_ex3_rst_doub_rsbit = (mult1_ex3_rst_105_select)
                                ? |mult1_ex3_mult_frac_shift[51:0] || mult1_ex3_mult_doub_sticky
                                : |mult1_ex3_mult_frac_shift[50:0] || mult1_ex3_mult_doub_sticky;
assign mult1_ex3_rst_sing_rsbit = (mult1_ex3_rst_105_select)
                                ? |mult1_ex3_mult_frac_shift[80:58] || mult1_ex3_mult_sing_sticky 
                                : |mult1_ex3_mult_frac_shift[79:58] || mult1_ex3_mult_sing_sticky;
                                      
//greate than 1000.....
assign mult1_ex3_double_gr      = mult1_ex3_rst_doub_gbit
                               && mult1_ex3_rst_doub_rsbit;
assign mult1_ex3_single_gr      = mult1_ex3_rst_sing_gbit
                               && mult1_ex3_rst_sing_rsbit;
assign mult1_ex3_gr             = (dp_xx_ex3_double)
                                ? mult1_ex3_double_gr
                                : mult1_ex3_single_gr;

//Equal to 1000...
assign mult1_ex3_double_eq      = mult1_ex3_rst_doub_gbit
                               && !mult1_ex3_rst_doub_rsbit;
assign mult1_ex3_single_eq      = mult1_ex3_rst_sing_gbit
                               && !mult1_ex3_rst_sing_rsbit;
assign mult1_ex3_eq             = (dp_xx_ex3_double)
                                ? mult1_ex3_double_eq
                                : mult1_ex3_single_eq;

//Equal to 0
assign mult1_ex3_double_zero    = !mult1_ex3_rst_doub_gbit
                               && !mult1_ex3_rst_doub_rsbit;
assign mult1_ex3_single_zero    = !mult1_ex3_rst_sing_gbit
                               && !mult1_ex3_rst_sing_rsbit;
assign mult1_ex3_zero           = (dp_xx_ex3_double)
                                ? mult1_ex3_double_zero
                                : mult1_ex3_single_zero;

//the round selct signal
// &CombBeg; @1554
always @( mult1_ex3_zero
       or mult1_ex3_gr
       or mult1_ex3_rst_lsb
       or mult1_ex3_eq
       or mult1_ex3_mult_result_sign
       or dp_xx_ex3_rm[2:0])
begin
  case(dp_xx_ex3_rm[2:0])
    3'b000 :  //round to nearest,ties to even
             mult1_ex3_add1   = mult1_ex3_gr || (mult1_ex3_eq && mult1_ex3_rst_lsb);
    3'b001 :  //round to zero 
             mult1_ex3_add1   = 1'b0;
    3'b010 :  //round to negative infinity
             mult1_ex3_add1   = !mult1_ex3_zero && mult1_ex3_mult_result_sign;
    3'b011 :  //round to positive infinity
             mult1_ex3_add1   = !mult1_ex3_zero && !mult1_ex3_mult_result_sign;
    3'b100 :  //round to neart, ties to max magnitude
             mult1_ex3_add1   = mult1_ex3_gr || mult1_ex3_eq;
    default: mult1_ex3_add1   = 1'b0;
  endcase
// &CombEnd; @1568
end

assign mult1_ex3_mult_frac_round_op0[53:0]    = (dp_xx_ex3_double)
                                              ? mult1_ex3_mult_frac_shift[105:52]
                                              : {29'b0,mult1_ex3_mult_frac_shift[105:81]};

assign mult1_ex3_mult_frac_round_op1[53:0]    = (mult1_ex3_rst_105_select)
                                              ? {52'b0,2'b10}
                                              : {53'b0,1'b1};

assign mult1_ex3_mult_frac_round_addr[53:0]   = mult1_ex3_mult_frac_round_op0[53:0]
                                              + mult1_ex3_mult_frac_round_op1[53:0];

assign mult1_ex3_mult_frac_round_result[53:0] = (dp_xx_ex3_double)
                                              ? mult1_ex3_mult_frac_round_addr[53:0]
                                              : {mult1_ex3_mult_frac_round_addr[24:0],29'b0};

assign mult1_ex3_mult_frac_result[53:0]  = (mult1_ex3_add1 && !dp_xx_ex3_widen)
                                         ? mult1_ex3_mult_frac_round_result[53:0]
                                         : mult1_ex3_mult_frac_shift[105:52];

assign mult1_ex3_frac_52[51:0]           = (mult1_ex3_mult_frac_result[53])
                                         ? mult1_ex3_mult_frac_result[52:1]
                                         : mult1_ex3_mult_frac_result[51:0];

//the expont will add 1:
//1. when double frac_result[105] is 1, exponent will add 1
//2. when signle frac_result[47] is 1,exponent will add 1
//3. when round result generate carry,exponent will add 1
assign mult1_ex3_expnt_plus1              = mult1_ex3_mult_frac_shift[105]
                                         || mult1_ex3_mult_frac_result[53]
                                         || mult1_ex3_mult_frac_result[52] && mult1_ex3_rshift_sel;
assign mult1_ex3_expnt_plus1_result[10:0] = mult1_ex3_expnt[10:0] + 11'b1;

assign mult1_ex3_expnt_final_result[10:0] = (mult1_ex3_expnt_plus1) 
                                          ? mult1_ex3_expnt_plus1_result[10:0]
                                          : mult1_ex3_expnt[10:0];

//----------------------------------------------------------
//               Normal Multiply Exception
//----------------------------------------------------------
assign mult1_ex3_of = mult1_ex3_potnt_of 
                   && mult1_ex3_mult_frac_result[53]
                   && !mult1_ex3_result_abnorm
                   && !dp_xx_ex3_fma
                   && !(dp_xx_ex3_half && !dp_xx_ex3_widen)
                   && !dp_xx_ex3_widen
                   && !dp_xx_ex3_mult_id;

assign mult1_ex3_uf = (mult1_ex3_expnt[12:0] == 13'b0)
                   && !(|mult1_ex3_mult_frac_result[53:52])
                   && !mult1_ex3_result_abnorm
                   && !dp_xx_ex3_fma
                   && !(dp_xx_ex3_half && !dp_xx_ex3_widen)
                   && !dp_xx_ex3_widen
                   && !mult1_ex3_zero
                   && !dp_xx_ex3_mult_id;


assign mult1_ex3_nx = mult1_ex3_of 
                   || mult1_ex3_uf
                   || !mult1_ex3_result_abnorm
                      && !mult1_ex3_zero
                      && !(dp_xx_ex3_half && !dp_xx_ex3_widen)
                      && !dp_xx_ex3_widen
                      && !dp_xx_ex3_fma
                      && !dp_xx_ex3_mult_id;

assign mult1_ex3_ex4_expt[4:3]  = mult1_ex3_expt[4:3];                      
assign mult1_ex3_ex4_expt[2]    = mult1_ex3_expt[2] | mult1_ex3_of;
assign mult1_ex3_ex4_expt[1]    = mult1_ex3_expt[1] | mult1_ex3_uf; 
assign mult1_ex3_ex4_expt[0]    = mult1_ex3_expt[0] | mult1_ex3_nx;

//----------------------------------------------------------
//               Normal Multiply Output
//----------------------------------------------------------
// &CombBeg; @1644
always @( mult1_ex3_mult_result_sign
       or dp_xx_ex3_rm[2:0])
begin
  case(dp_xx_ex3_rm[2:0])
    3'b000  : mult1_ex3_of_result_lfn  = 1'b0;
    3'b001  : mult1_ex3_of_result_lfn  = 1'b1;
    3'b010  : mult1_ex3_of_result_lfn  = !mult1_ex3_mult_result_sign;
    3'b011  : mult1_ex3_of_result_lfn  = mult1_ex3_mult_result_sign;
    3'b100  : mult1_ex3_of_result_lfn  = 1'b0;
    default : mult1_ex3_of_result_lfn = 1'bx;
  endcase
// &CombEnd; @1653
end

assign mult1_ex3_mult_result_inf_pre  = !mult1_ex3_of_result_lfn
                                     && !mult1_ex3_result_abnorm
                                     && !mult1_ex3_half_fma
                                     && !dp_xx_ex3_fma;

assign mult1_ex3_mult_result_lfn_pre  = mult1_ex3_of_result_lfn
                                    && !mult1_ex3_result_abnorm
                                    && !mult1_ex3_half_fma
                                    && !dp_xx_ex3_fma;

assign mult1_ex3_abnorm               = mult1_ex3_result_abnorm
                                     && !mult1_ex3_half_fma;

assign mult1_ex3_half_fma             = dp_xx_ex3_half && !dp_xx_ex3_widen;

//prepare the results value
// &Force("bus","dp_xx_ex3_oper_size",2,0); @1672
assign mult1_ex3_sing_rst_high[31:0] = 32'hffffffff;
assign mult1_ex3_doub_rst_inf[63:0]  = {                              mult1_ex3_mult_result_sign,11'h7ff,52'b0};
assign mult1_ex3_sing_rst_inf[63:0]  = {mult1_ex3_sing_rst_high[31:0],mult1_ex3_mult_result_sign,8'hff,23'b0};

assign mult1_ex3_doub_rst_lfn[63:0]  = {                              mult1_ex3_mult_result_sign,11'h7fe,{52{1'b1}}};
assign mult1_ex3_sing_rst_lfn[63:0]  = {mult1_ex3_sing_rst_high[31:0],mult1_ex3_mult_result_sign,8'hfe,{23{1'b1}}};

assign mult1_ex3_doub_rst_norm[63:0] = {                              mult1_ex3_mult_result_sign,mult1_ex3_expnt_final_result[10:0],mult1_ex3_frac_52[51:0]};
assign mult1_ex3_sing_rst_norm[63:0] = {mult1_ex3_sing_rst_high[31:0],mult1_ex3_mult_result_sign,mult1_ex3_expnt_final_result[7:0],mult1_ex3_frac_52[51:29]};

assign mult1_ex3_doub_rst_abnorm[63:0] = mult1_ex3_abnorm_result[63:0];
assign mult1_ex3_sing_rst_abnorm[63:0] = {mult1_ex3_sing_rst_high[31:0],mult1_ex3_abnorm_result[31:0]};

//results
assign mult1_ex3_rst_inf[63:0]    = (dp_xx_ex3_double) //double or single widen
                                  ? mult1_ex3_doub_rst_inf[63:0]
                                  : mult1_ex3_sing_rst_inf[63:0];

assign mult1_ex3_rst_lfn[63:0]    = (dp_xx_ex3_double) //double or single widen
                                  ? mult1_ex3_doub_rst_lfn[63:0]
                                  : mult1_ex3_sing_rst_lfn[63:0];

assign mult1_ex3_rst_norm[63:0]   = (dp_xx_ex3_double) //double or single widen
                                  ? mult1_ex3_doub_rst_norm[63:0]
                                  : mult1_ex3_sing_rst_norm[63:0];

assign mult1_ex3_rst_abnorm[63:0] = (dp_xx_ex3_double) 
                                  ? mult1_ex3_doub_rst_abnorm[63:0]
                                  : mult1_ex3_sing_rst_abnorm[63:0];

assign mult1_ex3_ex4_abnorm_result[63:0] =
    {64{mult1_ex3_abnorm}}              & mult1_ex3_rst_abnorm[63:0]
  | {64{mult1_ex3_mult_result_inf_pre}} & mult1_ex3_rst_inf[63:0]
  | {64{mult1_ex3_mult_result_lfn_pre}} & mult1_ex3_rst_lfn[63:0];

assign mult1_ex3_ex4_result_abnorm = mult1_ex3_abnorm;

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_mult1_ex3_ex4_gated_clk"); @1737
gated_clk_cell  x_mult1_ex3_ex4_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (mult1_ex3_ex4_pipe_clk),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (mult1_ex3_ex4_clk_en  ),
  .module_en              (cp0_vfpu_icg_en       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

//  &Connect(.clk_in      (forever_cpuclk        ), @1738
//           .external_en (1'b0                  ), @1739
//           .global_en   (cp0_yy_clk_en         ), @1740
//           .module_en   (cp0_vfpu_icg_en       ), @1741
//           .local_en    (mult1_ex3_ex4_clk_en  ), @1742
//           .clk_out     (mult1_ex3_ex4_pipe_clk)); @1743

assign mult1_ex3_ex4_clk_en = mult1_ex3_ex4_pipedown && dp_mult1_ex3_clk_en;

//  &Instance("gated_clk_cell", "x_mult1_ex3_ex4_special_gated_clk"); @1747
gated_clk_cell  x_mult1_ex3_ex4_special_gated_clk (
  .clk_in                         (forever_cpuclk                ),
  .clk_out                        (mult1_ex3_ex4_special_pipe_clk),
  .external_en                    (1'b0                          ),
  .global_en                      (cp0_yy_clk_en                 ),
  .local_en                       (mult1_ex3_ex4_special_pipedown),
  .module_en                      (cp0_vfpu_icg_en               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            )
);

//  &Connect(.clk_in      (forever_cpuclk), @1748
//           .external_en (1'b0), @1749
//           .global_en   (cp0_yy_clk_en), @1750
//           .module_en   (cp0_vfpu_icg_en), @1751
//           .local_en    (mult1_ex3_ex4_special_pipedown), @1752
//           .clk_out     (mult1_ex3_ex4_special_pipe_clk)); @1753

assign mult1_ex3_ex4_special_pipedown = (mult_ex3_ex4_half_pipedown ^ mult1_ex3_ex4_pipedown)
                                     && dp_mult1_ex3_clk_en;

always @(posedge mult1_ex3_ex4_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mult1_ex4_mult_result[63:0]         <= 64'b0;    
    mult1_ex4_sticky1                   <= 1'b0;
    mult1_ex4_fma_sign                  <= 1'b0;
    mult1_ex4_frac_result_shift0[110:0] <= 111'b0;
    mult1_ex4_frac_result_shift1[110:0] <= 111'b0;
    mult1_ex4_expnt_result[12:0]        <= 13'b0;
    mult1_ex4_sub_vld                   <= 1'b0;
    mult1_ex4_lza_result[6:0]           <= 7'b0;
  end
  else if(mult1_ex3_ex4_pipedown)
  begin
    mult1_ex4_mult_result[63:0]         <= mult1_ex3_rst_norm[63:0];    
    mult1_ex4_sticky1                   <= mult1_ex3_ex4_sticky1;
    mult1_ex4_fma_sign                  <= mult1_ex3_fma_sign;
    mult1_ex4_frac_result_shift0[110:0] <= mult1_ex3_frac_result_shift[110:0];
    mult1_ex4_frac_result_shift1[110:0] <= mult1_ex3_frac_result_shift[110:0];
    mult1_ex4_expnt_result[12:0]        <= mult1_ex3_expnt[12:0];
    mult1_ex4_sub_vld                   <= mult1_ex3_sub_vld;
    mult1_ex4_lza_result[6:0]           <= mult1_ex3_lza_result[6:0];
  end
  else
  begin
    mult1_ex4_mult_result[63:0]         <= mult1_ex4_mult_result[63:0];    
    mult1_ex4_sticky1                   <= mult1_ex4_sticky1;                  
    mult1_ex4_fma_sign                  <= mult1_ex4_fma_sign;
    mult1_ex4_frac_result_shift0[110:0] <= mult1_ex4_frac_result_shift0[110:0]; 
    mult1_ex4_frac_result_shift1[110:0] <= mult1_ex4_frac_result_shift1[110:0]; 
    mult1_ex4_expnt_result[12:0]        <= mult1_ex4_expnt_result[12:0];
    mult1_ex4_sub_vld                   <= mult1_ex4_sub_vld;
    mult1_ex4_lza_result[6:0]           <= mult1_ex4_lza_result[6:0];          
  end
end

always @(posedge mult1_ex3_ex4_special_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mult1_ex4_simd                <= 1'b0;
    mult1_ex4_expt[4:0]           <= 5'b0;
    mult1_ex4_half_fma            <= 1'b0;
    mult1_ex4_result_abnorm       <= 1'b0;
    mult1_ex4_abnorm_result[63:0] <= 64'b0;
    mult1_ex4_special_type[3:0]   <= 4'b0;
  end
  else if(mult1_ex3_ex4_special_pipedown)
  begin
    mult1_ex4_simd                <= dp_xx_ex3_simd;
    mult1_ex4_expt[4:0]           <= mult1_ex3_ex4_expt[4:0];
    mult1_ex4_half_fma            <= mult1_ex3_half_fma;
    mult1_ex4_result_abnorm       <= mult1_ex3_ex4_result_abnorm;
    mult1_ex4_abnorm_result[63:0] <= mult1_ex3_ex4_abnorm_result[63:0];
    mult1_ex4_special_type[3:0]   <= mult1_ex3_special_type[3:0];
  end
  else
  begin
    mult1_ex4_simd                <= mult1_ex4_simd;
    mult1_ex4_expt[4:0]           <= mult1_ex4_expt[4:0];                
    mult1_ex4_half_fma            <= mult1_ex4_half_fma;
    mult1_ex4_result_abnorm       <= mult1_ex4_result_abnorm;
    mult1_ex4_abnorm_result[63:0] <= mult1_ex4_abnorm_result[63:0];
    mult1_ex4_special_type[3:0]   <= mult1_ex4_special_type[3:0];
  end
end

//==========================================================
//                    EX4  Stage
//==========================================================
//----------------------------------------------------------
//               Normal Multiply Output
//----------------------------------------------------------
assign mult1_ex4_mult_result_abnormal = mult1_ex4_result_abnorm || mult1_ex4_expt[2];
assign mult1_ex4_mult_result_half_fma = mult1_ex4_half_fma;

//output
assign mult1_ex4_rst_abnorm[63:0] = mult1_ex4_abnorm_result[63:0];
assign mult1_ex4_rst_norm[63:0]   = mult1_ex4_mult_result[63:0];
assign mult1_ex4_rst_half_fma[63:0] = {48'hffffffffffff,half0_fma_result[15:0]};

// &CombBeg; @1847
always @( mult1_ex4_rst_norm[63:0]
       or mult1_ex4_rst_half_fma[63:0]
       or mult1_ex4_mult_result_half_fma
       or mult1_ex4_rst_abnorm[63:0]
       or mult1_ex4_mult_result_abnormal)
begin
  case({mult1_ex4_mult_result_abnormal
     ,mult1_ex4_mult_result_half_fma})
     2'b10  : slicex_mult1_dp_ex4_mult_result[63:0] = mult1_ex4_rst_abnorm[63:0];
     2'b01  : slicex_mult1_dp_ex4_mult_result[63:0] = mult1_ex4_rst_half_fma[63:0];
     default: slicex_mult1_dp_ex4_mult_result[63:0] = mult1_ex4_rst_norm[63:0];
   endcase
// &CombEnd; @1854
end

//----------------------------------------------------------
//            Output Multiply Expt Information 
//----------------------------------------------------------
//Expt information
assign simd_half0_fma_mask = dp_xx_ex4_half;
assign slicex_mult1_dp_ex4_half_fma_result[15:0] = mult1_ex4_rst_half_fma[15:0]; 
assign slicex_mult1_dp_ex4_expt[4:0]             = mult1_ex4_expt[4:0]
                                                 | half0_fma_expt[4:0] & {5{simd_half0_fma_mask}};

//----------------------------------------------------------
//            Fused Multiply-Add Normalization
//----------------------------------------------------------
//1. normalized shift
// &CombBeg; @1882
always @( mult1_ex4_frac_result_shift0[110:0]
       or mult1_ex4_lza_result[5:0])
begin
case(mult1_ex4_lza_result[5:0])
   6'd0   : mult1_ex4_fma_norm_temp[110:0] = mult1_ex4_frac_result_shift0[110:0];
   6'd1   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[109:0],1'b0};
   6'd2   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[108:0],2'b0};
   6'd3   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[107:0],3'b0};
   6'd4   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[106:0],4'b0};
   6'd5   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[105:0],5'b0};
   6'd6   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[104:0],6'b0};
   6'd7   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[103:0],7'b0};
   6'd8   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[102:0],8'b0};
   6'd9   : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[101:0],9'b0};
   6'd10  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[100:0],10'b0};
   6'd11  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[99:0],11'b0};
   6'd12  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[98:0],12'b0};
   6'd13  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[97:0],13'b0};
   6'd14  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[96:0],14'b0};
   6'd15  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[95:0],15'b0};
   6'd16  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[94:0],16'b0};
   6'd17  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[93:0],17'b0};
   6'd18  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[92:0],18'b0};
   6'd19  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[91:0],19'b0};
   6'd20  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[90:0],20'b0};
   6'd21  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[89:0],21'b0};
   6'd22  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[88:0],22'b0};
   6'd23  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[87:0],23'b0};
   6'd24  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[86:0],24'b0};
   6'd25  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[85:0],25'b0};
   6'd26  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[84:0],26'b0};
   6'd27  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[83:0],27'b0};
   6'd28  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[82:0],28'b0};
   6'd29  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[81:0],29'b0};
   6'd30  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[80:0],30'b0};
   6'd31  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[79:0],31'b0};
   6'd32  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[78:0],32'b0};
   6'd33  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[77:0],33'b0};
   6'd34  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[76:0],34'b0};
   6'd35  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[75:0],35'b0};
   6'd36  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[74:0],36'b0};
   6'd37  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[73:0],37'b0};
   6'd38  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[72:0],38'b0};
   6'd39  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[71:0],39'b0};
   6'd40  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[70:0],40'b0};
   6'd41  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[69:0],41'b0};
   6'd42  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[68:0],42'b0};
   6'd43  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[67:0],43'b0};
   6'd44  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[66:0],44'b0};
   6'd45  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[65:0],45'b0};
   6'd46  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[64:0],46'b0};
   6'd47  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[63:0],47'b0};
   6'd48  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[62:0],48'b0};
   6'd49  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[61:0],49'b0};
   6'd50  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[60:0],50'b0};
   6'd51  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[59:0],51'b0};
   6'd52  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[58:0],52'b0};
   6'd53  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[57:0],53'b0};
   6'd54  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[56:0],54'b0};
   6'd55  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[55:0],55'b0};
   6'd56  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[54:0],56'b0};
   6'd57  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[53:0],57'b0};
   6'd58  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[52:0],58'b0};
   6'd59  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[51:0],59'b0};
   6'd60  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[50:0],60'b0};
   6'd61  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[49:0],61'b0};
   6'd62  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[48:0],62'b0};
   6'd63  : mult1_ex4_fma_norm_temp[110:0] = {mult1_ex4_frac_result_shift0[47:0],63'b0};
   default: mult1_ex4_fma_norm_temp[110:0] = {111{1'bx}};
endcase
// &CombEnd; @1950
end

assign mult1_ex4_lza_lshift_64          = mult1_ex4_lza_result[6];
assign mult1_ex4_fma_norm_result[110:0] = (mult1_ex4_lza_lshift_64)
                                        ? {mult1_ex4_fma_norm_temp[46:0],64'b0}
                                        : mult1_ex4_fma_norm_temp[110:0];

//For support denormal result:
//use exponent shift  
// &CombBeg; @1959
always @( mult1_ex4_frac_result_shift1[110:0]
       or mult1_ex4_expnt_result[5:0])
begin
case(mult1_ex4_expnt_result[5:0])
  6'd0:   mult1_ex4_fma_expnt_temp[110:0] = {1'b0,mult1_ex4_frac_result_shift1[110:1]};
  6'd1:   mult1_ex4_fma_expnt_temp[110:0] = mult1_ex4_frac_result_shift1[110:0];
  6'd2:   mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[109:0],1'b0};
  6'd3:   mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[108:0],2'b0};
  6'd4:   mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[107:0],3'b0};
  6'd5:   mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[106:0],4'b0};
  6'd6:   mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[105:0],5'b0};
  6'd7:   mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[104:0],6'b0};
  6'd8:   mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[103:0],7'b0};
  6'd9:   mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[102:0],8'b0};
  6'd10:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[101:0],9'b0};
  6'd11:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[100:0],10'b0};
  6'd12:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[99:0],11'b0};
  6'd13:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[98:0],12'b0};
  6'd14:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[97:0],13'b0};
  6'd15:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[96:0],14'b0};
  6'd16:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[95:0],15'b0};
  6'd17:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[94:0],16'b0};
  6'd18:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[93:0],17'b0};
  6'd19:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[92:0],18'b0};
  6'd20:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[91:0],19'b0};
  6'd21:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[90:0],20'b0};
  6'd22:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[89:0],21'b0};
  6'd23:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[88:0],22'b0};
  6'd24:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[87:0],23'b0};
  6'd25:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[86:0],24'b0};
  6'd26:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[85:0],25'b0};
  6'd27:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[84:0],26'b0};
  6'd28:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[83:0],27'b0};
  6'd29:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[82:0],28'b0};
  6'd30:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[81:0],29'b0};
  6'd31:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[80:0],30'b0};
  6'd32:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[79:0],31'b0};
  6'd33:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[78:0],32'b0};
  6'd34:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[77:0],33'b0};
  6'd35:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[76:0],34'b0};
  6'd36:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[75:0],35'b0};
  6'd37:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[74:0],36'b0};
  6'd38:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[73:0],37'b0};
  6'd39:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[72:0],38'b0};
  6'd40:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[71:0],39'b0};
  6'd41:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[70:0],40'b0};
  6'd42:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[69:0],41'b0};
  6'd43:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[68:0],42'b0};
  6'd44:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[67:0],43'b0};
  6'd45:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[66:0],44'b0};
  6'd46:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[65:0],45'b0};
  6'd47:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[64:0],46'b0};
  6'd48:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[63:0],47'b0};
  6'd49:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[62:0],48'b0};
  6'd50:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[61:0],49'b0};
  6'd51:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[60:0],50'b0};
  6'd52:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[59:0],51'b0};
  6'd53:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[58:0],52'b0};
  6'd54:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[57:0],53'b0};
  6'd55:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[56:0],54'b0};
  6'd56:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[55:0],55'b0};
  6'd57:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[54:0],56'b0};
  6'd58:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[53:0],57'b0};
  6'd59:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[52:0],58'b0};
  6'd60:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[51:0],59'b0};
  6'd61:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[50:0],60'b0};
  6'd62:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[49:0],61'b0};
  6'd63:  mult1_ex4_fma_expnt_temp[110:0] = {mult1_ex4_frac_result_shift1[48:0],62'b0};
  default: mult1_ex4_fma_expnt_temp[110:0] = {111{1'bx}};
endcase
// &CombEnd; @2027
end

assign mult1_ex4_expnt_lshift_64        = mult1_ex4_expnt_result[6];
assign mult1_ex4_fma_expnt_shift[110:0] = (mult1_ex4_expnt_result[6])
                                        ? {mult1_ex4_fma_expnt_temp[46:0],64'b0}
                                        : mult1_ex4_fma_expnt_temp[110:0];


//consider timing, we calculate exponent shift result and lza shift result at same time,
//and select result at EX5
assign mult1_ex4_expnt_adder0[12:0]     = mult1_ex4_expnt_result[12:0];
assign mult1_ex4_expnt_adder1[12:0]     = {6'h0,mult1_ex4_lza_result[6:0]};
assign mult1_ex4_expnt_lza_shift[12:0] = mult1_ex4_expnt_adder0[12:0]
                                       - mult1_ex4_expnt_adder1[12:0];
assign mult1_ex4_expnt_is_0             = ~(|mult1_ex4_expnt_result[12:0]);
assign mult1_ex4_expnt_is_1             = ~(|mult1_ex4_expnt_result[12:1])
                                         && mult1_ex4_expnt_result[0];
assign mult1_ex4_expnt_eq_lza_plus1     = ~(|mult1_ex4_expnt_lza_shift[12:1]) 
                                       && mult1_ex4_expnt_lza_shift[0];
assign mult1_ex4_expnt_le_lza           = mult1_ex4_expnt_lza_shift[12]
                                       || ~(|mult1_ex4_expnt_lza_shift[12:0]); 

// The following conditions will select exponent as shift index
// 1. E <= lza
// 2. E == lza+1 but there is 1-bit prediciton error for lza result
// 3. E == 1
assign mult1_ex4_exp_shift_sel = mult1_ex4_expnt_le_lza
                              || mult1_ex4_expnt_eq_lza_plus1 && !mult1_ex4_fma_norm_result[110]
                              || mult1_ex4_expnt_is_1;

//----------------------------------------------------------
//                 Exponent Shift Pipe
//----------------------------------------------------------
//frac reuslt lsb:
assign mult1_ex4_rst0_doub_lsb  = mult1_ex4_fma_expnt_temp[58];
assign mult1_ex4_rst0_sing_lsb  = mult1_ex4_fma_expnt_temp[87];

assign mult1_ex4_rst0_lsb       = (dp_xx_ex4_double)
                                ? mult1_ex4_rst0_doub_lsb
                                : mult1_ex4_rst0_sing_lsb;

//frac result guard bit
assign mult1_ex4_rst0_doub_gbit = mult1_ex4_fma_expnt_temp[57] && !mult1_ex4_expnt_lshift_64;
assign mult1_ex4_rst0_sing_gbit = mult1_ex4_fma_expnt_temp[86] && !mult1_ex4_expnt_lshift_64;

//frac result sticky bit
assign mult1_ex4_rshift_sticky   = mult1_ex4_expnt_is_0 && mult1_ex4_frac_result_shift0[0];
assign mult1_ex4_rst0_doub_rsbit = (|mult1_ex4_fma_expnt_temp[56:0]) && !mult1_ex4_expnt_lshift_64 || mult1_ex4_sticky1 || mult1_ex4_rshift_sticky;
assign mult1_ex4_rst0_sing_rsbit = (|mult1_ex4_fma_expnt_temp[85:0]) && !mult1_ex4_expnt_lshift_64 || mult1_ex4_sticky1 || mult1_ex4_rshift_sticky;

//Great than 1000....
assign mult1_ex4_rst0_doub_gr = mult1_ex4_rst0_doub_gbit && mult1_ex4_rst0_doub_rsbit;
assign mult1_ex4_rst0_sing_gr = mult1_ex4_rst0_sing_gbit && mult1_ex4_rst0_sing_rsbit;

assign mult1_ex4_rst0_gr      = (dp_xx_ex4_double)
                              ? mult1_ex4_rst0_doub_gr
                              : mult1_ex4_rst0_sing_gr;

//Great or equal than 10000
assign mult1_ex4_rst0_doub_ge = mult1_ex4_rst0_doub_gbit;
assign mult1_ex4_rst0_sing_ge = mult1_ex4_rst0_sing_gbit;

assign mult1_ex4_rst0_ge      = (dp_xx_ex4_double)
                              ? mult1_ex4_rst0_doub_ge
                              : mult1_ex4_rst0_sing_ge;
//Equal to zero
assign mult1_ex4_rst0_doub_zero = !mult1_ex4_rst0_doub_gbit && !mult1_ex4_rst0_doub_rsbit;
assign mult1_ex4_rst0_sing_zero = !mult1_ex4_rst0_sing_gbit && !mult1_ex4_rst0_sing_rsbit;

assign mult1_ex4_rst0_zero      = (dp_xx_ex4_double)
                                ? mult1_ex4_rst0_doub_zero
                                : mult1_ex4_rst0_sing_zero;

assign mult1_ex4_rst0_add1 = 
    (dp_xx_ex4_rm[2:0] == 3'b000) & mult1_ex4_rst0_gr 
  | (dp_xx_ex4_rm[2:0] == 3'b000) & (mult1_ex4_rst0_ge && mult1_ex4_rst0_lsb) //for timing
  | (dp_xx_ex4_rm[2:0] == 3'b010) & (!mult1_ex4_rst0_zero && mult1_ex4_fma_sign)
  | (dp_xx_ex4_rm[2:0] == 3'b011) & (!mult1_ex4_rst0_zero && !mult1_ex4_fma_sign)
  | (dp_xx_ex4_rm[2:0] == 3'b100) & mult1_ex4_rst0_ge;
  
assign mult1_ex4_fma_frac0_round_op0[52:0]    = (dp_xx_ex4_double)
                                              ? mult1_ex4_fma_expnt_temp[110:58]
                                              : {mult1_ex4_fma_expnt_temp[110:87],29'h1fffffff};

//pre-calculate round result
assign mult1_ex4_fma_frac0_round_add[53:0]    = {1'b0,mult1_ex4_fma_frac0_round_op0[52:0]} + 1'b1;
assign mult1_ex4_fma_frac0_round_result[52:0] = (mult1_ex4_fma_frac0_round_add[53])
                                               ? mult1_ex4_fma_frac0_round_add[53:1]
                                               : mult1_ex4_fma_frac0_round_add[52:0];
//fraction final result
assign mult1_ex4_fma_frac0_result[52:0] = (mult1_ex4_rst0_add1 && !mult1_ex4_expnt_lshift_64)
                                        ? mult1_ex4_fma_frac0_round_result[52:0]
                                        : mult1_ex4_fma_expnt_shift[110:58];

assign mult1_ex4_fma_expnt0_result[10:0]    = (mult1_ex4_expnt_is_0)
                                            ? 11'b0
                                            : 11'b1;

assign mult1_ex4_fma_expnt0_m1_result[10:0] = (mult1_ex4_expnt_is_0)
                                            ? 11'b111_1111_1111
                                            : 11'b0;
assign mult1_ex4_fma_expnt0_p1_result[10:0] = (mult1_ex4_expnt_is_0)
                                            ? 11'b1
                                            : 11'b10;

assign mult1_ex4_fma_expnt0_m1 = !mult1_ex4_expnt_is_0
                              && !mult1_ex4_fma_frac0_result[52];
assign mult1_ex4_fma_expnt0_p1 = mult1_ex4_rst0_add1
                              && !mult1_ex4_expnt_lshift_64
                              && (&mult1_ex4_fma_frac0_round_add[52:0]);

assign mult1_ex4_fma_expnt0_result0[10:0] = (mult1_ex4_fma_expnt0_m1)
                                          ? mult1_ex4_fma_expnt0_m1_result[10:0]
                                          : mult1_ex4_fma_expnt0_result[10:0]; 
assign mult1_ex4_fma_expnt0_result1[10:0] = (mult1_ex4_fma_expnt0_m1)
                                          ? mult1_ex4_fma_expnt0_result[10:0]
                                          : mult1_ex4_fma_expnt0_p1_result[10:0]; 

//FMA exception
//OF exception:
//when select expnt shift pipe, overflow can't happen;
//assign mult1_ex4_fma_expnt0_of = 1'b0;

//UF exception
assign mult1_ex4_potnt0_add_uf = mult1_ex4_expnt_is_0 
                                 && !mult1_ex4_fma_expnt0_p1
                              || !mult1_ex4_expnt_is_0                                 
                                 && !mult1_ex4_fma_expnt0_p1
                                 && !mult1_ex4_fma_frac0_result[52];

assign mult1_ex4_potnt0_sub_uf = !mult1_ex4_expnt_is_0
                              && !mult1_ex4_fma_expnt0_p1
                              && mult1_ex4_fma_expnt0_m1;

assign mult1_ex4_fma_expnt0_id = (mult1_ex4_potnt0_add_uf
                                  || mult1_ex4_potnt0_sub_uf)
                              && !mult1_ex4_result_abnorm
                              && !mult1_ex4_result_zero;
                              
assign mult1_ex4_fma_expnt0_uf = mult1_ex4_fma_expnt0_id && !mult1_ex4_rst0_zero;

//NX exception                              
assign mult1_ex4_frac0_nx      = !mult1_ex4_result_abnorm && !mult1_ex4_rst0_zero;
assign mult1_ex4_fma_expnt0_nx = mult1_ex4_fma_expnt0_uf
                              || mult1_ex4_frac0_nx;
assign mult1_ex4_expt0_result[4:0] = mult1_ex4_expt[4:0] 
                                  | {3'b0,mult1_ex4_fma_expnt0_uf,mult1_ex4_fma_expnt0_nx};
//----------------------------------------------------------
//                    Lza Shift Pipe
//----------------------------------------------------------
assign mult1_ex4_fma_lza_shift[110:0] = (mult1_ex4_fma_norm_result[110])
                                       ? mult1_ex4_fma_norm_result[110:0]
                                       : {mult1_ex4_fma_norm_result[109:0],1'b0};

assign mult1_ex4_fma_lza_shift64[110:0] = (mult1_ex4_fma_norm_temp[110])
                                        ? mult1_ex4_fma_norm_temp[110:0]
                                        : {mult1_ex4_fma_norm_temp[109:0],1'b0};

//frac reuslt lsb:
assign mult1_ex4_rst1_doub_lsb  = mult1_ex4_fma_lza_shift64[58];
assign mult1_ex4_rst1_sing_lsb  = mult1_ex4_fma_lza_shift64[87];
assign mult1_ex4_rst1_lsb       = (dp_xx_ex4_double)
                                 ? mult1_ex4_rst1_doub_lsb
                                 : mult1_ex4_rst1_sing_lsb;

//frac result guard bit
assign mult1_ex4_rst1_doub_gbit = mult1_ex4_fma_lza_shift64[57] && !mult1_ex4_lza_lshift_64;
assign mult1_ex4_rst1_sing_gbit = mult1_ex4_fma_lza_shift64[86] && !mult1_ex4_lza_lshift_64;

//frac result sticky bit
assign mult1_ex4_rst1_doub_rsbit = (|mult1_ex4_fma_lza_shift64[56:0]) && !mult1_ex4_lza_lshift_64 || mult1_ex4_sticky1;
assign mult1_ex4_rst1_sing_rsbit = (|mult1_ex4_fma_lza_shift64[85:0]) && !mult1_ex4_lza_lshift_64 || mult1_ex4_sticky1;

//Great than 1000....
assign mult1_ex4_rst1_doub_gr = mult1_ex4_rst1_doub_gbit && mult1_ex4_rst1_doub_rsbit;
assign mult1_ex4_rst1_sing_gr = mult1_ex4_rst1_sing_gbit && mult1_ex4_rst1_sing_rsbit;

assign mult1_ex4_rst1_gr      = (dp_xx_ex4_double)
                              ? mult1_ex4_rst1_doub_gr
                              : mult1_ex4_rst1_sing_gr;

//Great or equal than 10000
assign mult1_ex4_rst1_doub_ge = mult1_ex4_rst1_doub_gbit;
assign mult1_ex4_rst1_sing_ge = mult1_ex4_rst1_sing_gbit;

assign mult1_ex4_rst1_ge      = (dp_xx_ex4_double)
                              ? mult1_ex4_rst1_doub_ge
                              : mult1_ex4_rst1_sing_ge;
//Equal to zero
assign mult1_ex4_rst1_doub_zero = !mult1_ex4_rst1_doub_gbit && !mult1_ex4_rst1_doub_rsbit;
assign mult1_ex4_rst1_sing_zero = !mult1_ex4_rst1_sing_gbit && !mult1_ex4_rst1_sing_rsbit;

assign mult1_ex4_rst1_zero      = (dp_xx_ex4_double)
                                ? mult1_ex4_rst1_doub_zero
                                : mult1_ex4_rst1_sing_zero;

assign mult1_ex4_rst1_add1 = 
    (dp_xx_ex4_rm[2:0] == 3'b000) & mult1_ex4_rst1_gr 
  | (dp_xx_ex4_rm[2:0] == 3'b000) & (mult1_ex4_rst1_ge && mult1_ex4_rst1_lsb) //for timing
  | (dp_xx_ex4_rm[2:0] == 3'b010) & (!mult1_ex4_rst1_zero && mult1_ex4_fma_sign)
  | (dp_xx_ex4_rm[2:0] == 3'b011) & (!mult1_ex4_rst1_zero && !mult1_ex4_fma_sign)
  | (dp_xx_ex4_rm[2:0] == 3'b100) & mult1_ex4_rst1_ge;
  
assign mult1_ex4_fma_frac1_round_op0[52:0]    = (dp_xx_ex4_double)
                                                ? mult1_ex4_fma_lza_shift64[110:58]
                                                : {mult1_ex4_fma_lza_shift64[110:87],29'h1fffffff};

//pre-calculate round result
assign mult1_ex4_fma_frac1_round_add[53:0]    = {1'b0,mult1_ex4_fma_frac1_round_op0[52:0]} + 1'b1;
assign mult1_ex4_fma_frac1_round_result[52:0] = (mult1_ex4_fma_frac1_round_add[53])
                                               ? mult1_ex4_fma_frac1_round_add[53:1]
                                               : mult1_ex4_fma_frac1_round_add[52:0];
//fraction final result
assign mult1_ex4_fma_frac1_result[52:0] = (mult1_ex4_rst1_add1 && !mult1_ex4_lza_lshift_64)
                                        ? mult1_ex4_fma_frac1_round_result[52:0]
                                        : mult1_ex4_fma_lza_shift[110:58];


//exponent calcaulate
assign mult1_ex4_fma_expnt1_result[12:0]    = mult1_ex4_expnt_lza_shift[12:0];
assign mult1_ex4_fma_expnt1_m1_result[10:0] = mult1_ex4_expnt_lza_shift[10:0] 
                                            + 11'b111_1111_1111;
assign mult1_ex4_fma_expnt1_p1_result[10:0] = mult1_ex4_expnt_lza_shift[10:0]
                                            + 11'b1;

assign mult1_ex4_fma_expnt1_m1 = !mult1_ex4_fma_norm_result[110];
assign mult1_ex4_fma_expnt1_p1 = mult1_ex4_rst1_add1
                              && !mult1_ex4_lza_lshift_64
                              && mult1_ex4_fma_frac1_round_add[53];

assign mult1_ex4_fma_expnt1_result0[10:0] = (mult1_ex4_fma_expnt1_m1)
                                          ? mult1_ex4_fma_expnt1_m1_result[10:0]
                                          : mult1_ex4_fma_expnt1_result[10:0]; 
assign mult1_ex4_fma_expnt1_result1[10:0] = (mult1_ex4_fma_expnt1_m1)
                                          ? mult1_ex4_fma_expnt1_result[10:0]
                                          : mult1_ex4_fma_expnt1_p1_result[10:0]; 

//FMA exception
//OF exception:
assign mult1_ex4_doub_expnt1_of     = !mult1_ex4_fma_expnt1_result[12]
                                   && mult1_ex4_fma_expnt1_result[11]
                                   && !mult1_ex4_result_abnorm
                                   && !mult1_ex4_result_zero; 

assign mult1_ex4_doub_potnt1_sub_of = !mult1_ex4_fma_expnt1_result[12]
                                   && !mult1_ex4_fma_expnt1_result[11]
                                   && (&mult1_ex4_fma_expnt1_result[10:0])
                                   && !mult1_ex4_result_abnorm
                                   && !mult1_ex4_result_zero;

assign mult1_ex4_doub_potnt1_add_of = !mult1_ex4_fma_expnt1_result[12]
                                   && !mult1_ex4_fma_expnt1_result[11]
                                   && (&mult1_ex4_fma_expnt1_result[10:1])
                                   && !mult1_ex4_fma_expnt1_result[0]
                                   && !mult1_ex4_result_abnorm
                                   && !mult1_ex4_result_zero;

assign mult1_ex4_sing_expnt1_of     = !mult1_ex4_fma_expnt1_result[12]
                                   && (|mult1_ex4_fma_expnt1_result[11:8])
                                   && !mult1_ex4_result_abnorm
                                   && !mult1_ex4_result_zero;

assign mult1_ex4_sing_potnt1_sub_of = !mult1_ex4_fma_expnt1_result[12]
                                   && !(|mult1_ex4_fma_expnt1_result[11:8])
                                   && (&mult1_ex4_fma_expnt1_result[7:0])
                                   && !mult1_ex4_result_abnorm
                                   && !mult1_ex4_result_zero;

assign mult1_ex4_sing_potnt1_add_of = !mult1_ex4_fma_expnt1_result[12]
                                   && !(|mult1_ex4_fma_expnt1_result[11:8])
                                   && (&mult1_ex4_fma_expnt1_result[7:1])
                                   && !mult1_ex4_fma_expnt1_result[0]
                                   && !mult1_ex4_result_abnorm
                                   && !mult1_ex4_result_zero;

assign mult1_ex4_expnt1_of          = (dp_xx_ex4_double)
                                    ? mult1_ex4_doub_expnt1_of
                                    : mult1_ex4_sing_expnt1_of;

assign mult1_ex4_potnt1_add_of      = (dp_xx_ex4_double)
                                    ? mult1_ex4_doub_potnt1_add_of
                                    : mult1_ex4_sing_potnt1_add_of;

assign mult1_ex4_potnt1_sub_of      = (dp_xx_ex4_double)
                                    ? mult1_ex4_doub_potnt1_sub_of
                                    : mult1_ex4_sing_potnt1_sub_of;

assign mult1_ex4_fma_expnt1_of      = mult1_ex4_expnt1_of
                                   || mult1_ex4_potnt1_sub_of 
                                      && (!mult1_ex4_fma_expnt1_m1
                                          || mult1_ex4_fma_expnt1_m1
                                             && mult1_ex4_fma_expnt1_p1)
                                   || mult1_ex4_potnt1_add_of 
                                      && !mult1_ex4_fma_expnt1_m1 
                                      && mult1_ex4_fma_expnt1_p1;

//UF exception
assign mult1_ex4_potnt1_add_uf = ~(|mult1_ex4_fma_expnt1_result[12:0])
                                 && !mult1_ex4_fma_expnt1_p1
                              || ~(|mult1_ex4_fma_expnt1_result[12:1])
                                 && mult1_ex4_fma_expnt1_result[0]                                
                                 && !mult1_ex4_fma_expnt1_p1
                                 && !mult1_ex4_fma_frac1_result[52];

assign mult1_ex4_potnt1_sub_uf = ~(|mult1_ex4_fma_expnt1_result[12:1])
                              && mult1_ex4_fma_expnt1_result[0] 
                              && !mult1_ex4_fma_expnt1_p1
                              && mult1_ex4_fma_expnt1_m1;

assign mult1_ex4_fma_expnt1_id = (mult1_ex4_potnt1_add_uf
                                   || mult1_ex4_potnt1_sub_uf)
                                && !mult1_ex4_result_abnorm
                                && !mult1_ex4_result_zero;
                             
assign mult1_ex4_fma_expnt1_uf = mult1_ex4_fma_expnt1_id && !mult1_ex4_rst1_zero;

//NX exception                              
assign mult1_ex4_frac1_nx      = !mult1_ex4_result_abnorm && !mult1_ex4_rst1_zero;
assign mult1_ex4_fma_expnt1_nx = mult1_ex4_fma_expnt1_of
                              || mult1_ex4_fma_expnt1_uf
                              || mult1_ex4_frac1_nx;
assign mult1_ex4_expt1_result[4:0] = mult1_ex4_expt[4:0]
                                  | {2'b0,mult1_ex4_fma_expnt1_of,mult1_ex4_fma_expnt1_uf,mult1_ex4_fma_expnt1_nx};

//----------------------------------------------------------
//                    FMA Special Result
//----------------------------------------------------------
//overflow round
// &CombBeg; @2367
always @( dp_xx_ex4_rm[2:0]
       or mult1_ex4_fma_sign)
begin
  case(dp_xx_ex4_rm[2:0])
    3'b000: mult1_ex4_fma_of_result_lfn  = 1'b0;
    3'b001: mult1_ex4_fma_of_result_lfn  = 1'b1;
    3'b010: mult1_ex4_fma_of_result_lfn  = !mult1_ex4_fma_sign;
    3'b011: mult1_ex4_fma_of_result_lfn  = mult1_ex4_fma_sign;
    3'b100: mult1_ex4_fma_of_result_lfn  = 1'b0;
    default: mult1_ex4_fma_of_result_lfn = 1'bx;
  endcase
// &CombEnd; @2376
end

//the inf/lfn result can merge to abnorm result ahead,the 
//contrl signal will decide wether choose it or not
assign mult1_ex4_fma_result_inf_pre = !mult1_ex4_result_abnorm
                                   && !mult1_ex4_result_zero
                                   && !mult1_ex4_fma_of_result_lfn;
assign mult1_ex4_fma_result_lfn_pre = !mult1_ex4_result_abnorm
                                   && !mult1_ex4_result_zero
                                   && mult1_ex4_fma_of_result_lfn;
//the real lfn/inf signal
assign mult1_ex4_fma_result_inf    = mult1_ex4_fma_expnt1_of
                                  && !mult1_ex4_exp_shift_sel
                                  && mult1_ex4_fma_result_inf_pre;

assign mult1_ex4_result_zero        = !(|mult1_ex4_frac_result_shift0[110:0])
                                   && !mult1_ex4_sticky1
                                   && !mult1_ex4_result_abnorm;

assign mult1_ex4_ex5_result_abnorm  = mult1_ex4_result_abnorm
                                   || mult1_ex4_result_zero;

assign mult1_ex4_sing_rst_high[31:0] = 32'hffffffff;

assign mult1_ex4_doub_rst_inf[63:0] = {                              mult1_ex4_fma_sign,11'h7ff,52'b0};
assign mult1_ex4_sing_rst_inf[63:0] = {mult1_ex4_sing_rst_high[31:0],mult1_ex4_fma_sign,8'hff,23'b0};

assign mult1_ex4_doub_rst_lfn[63:0] = {                              mult1_ex4_fma_sign,11'h7fe,{52{1'b1}}};
assign mult1_ex4_sing_rst_lfn[63:0] = {mult1_ex4_sing_rst_high[31:0],mult1_ex4_fma_sign,8'hfe,{23{1'b1}}};

assign mult1_ex4_fma_zero_sign      = (mult1_ex4_sub_vld)
                                    ? (dp_xx_ex4_rm[2:0] == 3'b010)
                                    : mult1_ex4_fma_sign;


assign mult1_ex4_rst_inf[63:0]      = (dp_xx_ex4_double)
                                    ? mult1_ex4_doub_rst_inf[63:0]
                                    : mult1_ex4_sing_rst_inf[63:0];
assign mult1_ex4_rst_lfn[63:0]      = (dp_xx_ex4_double)
                                    ? mult1_ex4_doub_rst_lfn[63:0]
                                    : mult1_ex4_sing_rst_lfn[63:0];

assign mult1_ex4_rst_zero[63:0]     = (dp_xx_ex4_double)
                                    ? {mult1_ex4_fma_zero_sign,63'b0}
                                    : {mult1_ex4_sing_rst_high[31:0],mult1_ex4_fma_zero_sign,31'b0};

assign mult1_ex4_ex5_abnorm_result[63:0] =
    {64{mult1_ex4_result_abnorm}}      & mult1_ex4_abnorm_result[63:0]
  | {64{mult1_ex4_result_zero}}        & mult1_ex4_rst_zero[63:0]
  | {64{mult1_ex4_fma_result_inf_pre}} & mult1_ex4_rst_inf[63:0]
  | {64{mult1_ex4_fma_result_lfn_pre}} & mult1_ex4_rst_lfn[63:0];

assign mult1_ex4_ex5_special_type[0]   = mult1_ex4_special_type[0];
assign mult1_ex4_ex5_special_type[1]   = mult1_ex4_special_type[1] || mult1_ex4_result_zero;
assign mult1_ex4_ex5_special_type[3:2] = mult1_ex4_special_type[3:2];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_mult1_ex4_ex5_gated_clk"); @2454
gated_clk_cell  x_mult1_ex4_ex5_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (mult1_ex4_ex5_pipe_clk),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (mult1_ex4_ex5_clk_en  ),
  .module_en              (cp0_vfpu_icg_en       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

//  &Connect(.clk_in      (forever_cpuclk        ), @2455
//           .external_en (1'b0                  ), @2456
//           .global_en   (cp0_yy_clk_en         ), @2457
//           .module_en   (cp0_vfpu_icg_en       ), @2458
//           .local_en    (mult1_ex4_ex5_clk_en  ), @2459
//           .clk_out     (mult1_ex4_ex5_pipe_clk)); @2460

assign mult1_ex4_ex5_clk_en = mult1_ex4_ex5_pipedown && dp_mult1_ex4_clk_en;

//  &Instance("gated_clk_cell", "x_mult1_ex4_ex5_special_gated_clk"); @2464
gated_clk_cell  x_mult1_ex4_ex5_special_gated_clk (
  .clk_in                         (forever_cpuclk                ),
  .clk_out                        (mult1_ex4_ex5_special_pipe_clk),
  .external_en                    (1'b0                          ),
  .global_en                      (cp0_yy_clk_en                 ),
  .local_en                       (mult1_ex4_ex5_special_pipedown),
  .module_en                      (cp0_vfpu_icg_en               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            )
);

//  &Connect(.clk_in      (forever_cpuclk), @2465
//           .external_en (1'b0), @2466
//           .global_en   (cp0_yy_clk_en), @2467
//           .module_en   (cp0_vfpu_icg_en), @2468
//           .local_en    (mult1_ex4_ex5_special_pipedown), @2469
//           .clk_out     (mult1_ex4_ex5_special_pipe_clk)); @2470

assign mult1_ex4_ex5_special_pipedown = (mult_ex4_ex5_half_pipedown ^ mult1_ex4_ex5_pipedown)
                                     && dp_mult1_ex4_clk_en;

always @(posedge mult1_ex4_ex5_pipe_clk)
begin
if(mult1_ex4_ex5_pipedown)
  begin
    mult1_ex5_double                   <= dp_xx_ex4_double;
    mult1_ex5_fma_sign                 <= mult1_ex4_fma_sign;
    mult1_ex5_fma_expnt0_p1            <= mult1_ex4_fma_expnt0_p1;
    mult1_ex5_fma_frac0_result[52:0]   <= mult1_ex4_fma_frac0_result[52:0];
    mult1_ex5_fma_expnt0_result0[10:0] <= mult1_ex4_fma_expnt0_result0[10:0];
    mult1_ex5_fma_expnt0_result1[10:0] <= mult1_ex4_fma_expnt0_result1[10:0];
    mult1_ex5_fma_expnt1_p1            <= mult1_ex4_fma_expnt1_p1;
    mult1_ex5_fma_frac1_result[52:0]   <= mult1_ex4_fma_frac1_result[52:0];
    mult1_ex5_fma_expnt1_result0[10:0] <= mult1_ex4_fma_expnt1_result0[10:0];
    mult1_ex5_fma_expnt1_result1[10:0] <= mult1_ex4_fma_expnt1_result1[10:0];
  end
  else
  begin
    mult1_ex5_double                   <= mult1_ex5_double;
    mult1_ex5_fma_sign                 <= mult1_ex5_fma_sign;
    mult1_ex5_fma_expnt0_p1            <= mult1_ex5_fma_expnt0_p1;
    mult1_ex5_fma_frac0_result[52:0]   <= mult1_ex5_fma_frac0_result[52:0];
    mult1_ex5_fma_expnt0_result0[10:0] <= mult1_ex5_fma_expnt0_result0[10:0];
    mult1_ex5_fma_expnt0_result1[10:0] <= mult1_ex5_fma_expnt0_result1[10:0];
    mult1_ex5_fma_expnt1_p1            <= mult1_ex5_fma_expnt1_p1;
    mult1_ex5_fma_frac1_result[52:0]   <= mult1_ex5_fma_frac1_result[52:0];
    mult1_ex5_fma_expnt1_result0[10:0] <= mult1_ex5_fma_expnt1_result0[10:0];
    mult1_ex5_fma_expnt1_result1[10:0] <= mult1_ex5_fma_expnt1_result1[10:0];
  end
end

always @(posedge mult1_ex4_ex5_special_pipe_clk)
begin
if(mult1_ex4_ex5_special_pipedown)
  begin
    mult1_ex5_fma_rst0_sel             <= mult1_ex4_exp_shift_sel;
    mult1_ex5_expt0_result[4:0]        <= mult1_ex4_expt0_result[4:0];
    mult1_ex5_expt1_result[4:0]        <= mult1_ex4_expt1_result[4:0];
    mult1_ex5_expnt0_id                <= mult1_ex4_fma_expnt0_id;
    mult1_ex5_expnt1_id                <= mult1_ex4_fma_expnt1_id;
    mult1_ex5_result_abnorm            <= mult1_ex4_ex5_result_abnorm;
    mult1_ex5_abnorm_result[63:0]      <= mult1_ex4_ex5_abnorm_result[63:0];
    mult1_ex5_special_type[3:0]        <= mult1_ex4_ex5_special_type[3:0];
    mult1_ex5_fma_result_inf           <= mult1_ex4_fma_result_inf;
    mult1_ex5_fma_of                   <= mult1_ex4_fma_expnt1_of;
  end
  else
  begin
    mult1_ex5_fma_rst0_sel             <= mult1_ex5_fma_rst0_sel;
    mult1_ex5_expt0_result[4:0]        <= mult1_ex5_expt0_result[4:0];
    mult1_ex5_expt1_result[4:0]        <= mult1_ex5_expt1_result[4:0];
    mult1_ex5_expnt0_id                <= mult1_ex5_expnt0_id;
    mult1_ex5_expnt1_id                <= mult1_ex5_expnt1_id;
    mult1_ex5_result_abnorm            <= mult1_ex5_result_abnorm;
    mult1_ex5_abnorm_result[63:0]      <= mult1_ex5_abnorm_result[63:0];
    mult1_ex5_special_type[3:0]        <= mult1_ex5_special_type[3:0];
    mult1_ex5_fma_result_inf           <= mult1_ex5_fma_result_inf;
    mult1_ex5_fma_of                   <= mult1_ex5_fma_of;
  end
end

//==========================================================
//                    Ex5  Stage
//==========================================================
assign mult1_ex5_fma_expt_result[4:0] = (mult1_ex5_fma_rst0_sel)
                                      ? mult1_ex5_expt0_result[4:0]
                                      : mult1_ex5_expt1_result[4:0]; 
assign mult1_ex5_fma_expnt_id         = (mult1_ex5_fma_rst0_sel)
                                      ? mult1_ex5_expnt0_id
                                      : mult1_ex5_expnt1_id;

assign mult1_ex5_fma_expnt0_result[10:0] = (mult1_ex5_fma_expnt0_p1)
                                         ? mult1_ex5_fma_expnt0_result1[10:0]
                                         : mult1_ex5_fma_expnt0_result0[10:0];
assign mult1_ex5_fma_expnt1_result[10:0] = (mult1_ex5_fma_expnt1_p1)
                                         ? mult1_ex5_fma_expnt1_result1[10:0]
                                         : mult1_ex5_fma_expnt1_result0[10:0];
assign mult1_ex5_fma_expnt_result[10:0]  = (mult1_ex5_fma_rst0_sel)
                                         ? mult1_ex5_fma_expnt0_result[10:0]
                                         : mult1_ex5_fma_expnt1_result[10:0]; 
assign mult1_ex5_fma_frac_result[52:0]   = (mult1_ex5_fma_rst0_sel)
                                         ? mult1_ex5_fma_frac0_result[52:0]
                                         : mult1_ex5_fma_frac1_result[52:0];

assign mult1_ex5_fma_result_abnorm = mult1_ex5_result_abnorm || mult1_ex5_fma_of; 

//prepare the results value
assign mult1_ex5_sing_rst_high[31:0] = 32'hffffffff;


assign mult1_ex5_doub_rst_norm[63:0] = {mult1_ex5_fma_sign,mult1_ex5_fma_expnt_result[10:0],mult1_ex5_fma_frac_result[51:0]};
assign mult1_ex5_sing_rst_norm[63:0] = {mult1_ex5_sing_rst_high[31:0],mult1_ex5_fma_sign,mult1_ex5_fma_expnt_result[7:0],mult1_ex5_fma_frac_result[51:29]};

assign mult1_ex5_sing_fwd_norm[63:0] = {mult1_ex5_fma_sign,3'b0,mult1_ex5_fma_expnt_result[7:0],mult1_ex5_fma_frac_result[51:29],29'b0}; 

//results
assign mult1_ex5_rst_abnorm[63:0] = mult1_ex5_abnorm_result[63:0];
assign mult1_ex5_fwd_abnorm[63:0] = (mult1_ex5_double)
                                  ? mult1_ex5_rst_abnorm[63:0]
                                  : {mult1_ex5_rst_abnorm[31],3'b0,mult1_ex5_rst_abnorm[30:0],29'b0};

assign mult1_ex5_rst_norm[63:0]   = (mult1_ex5_double)
                                  ? mult1_ex5_doub_rst_norm[63:0]
                                  : mult1_ex5_sing_rst_norm[63:0];
assign mult1_ex5_fwd_norm[63:0]   = (mult1_ex5_double)
                                  ? mult1_ex5_doub_rst_norm[63:0]
                                  : mult1_ex5_sing_fwd_norm[63:0];

assign mult1_ex5_fma_result[63:0] = (mult1_ex5_fma_result_abnorm)
                                  ? mult1_ex5_rst_abnorm[63:0]
                                  : mult1_ex5_rst_norm[63:0];

//Wb data
assign slicex_mult1_dp_ex5_fma_result[63:0] = mult1_ex5_fma_result[63:0];
assign slicex_mult1_dp_ex5_fma_expt[4:0]    = mult1_ex5_fma_expt_result[4:0];

//Fwd data
assign mult1_ex5_fwd_data[INF]         = mult1_ex5_special_type[0] 
                                      || mult1_ex5_fma_result_inf;
assign mult1_ex5_fwd_data[EXPNT_ZERO]  = mult1_ex5_special_type[1]
                                      || mult1_ex5_fma_expnt_id;
assign mult1_ex5_fwd_data[QNAN]  = mult1_ex5_special_type[2];
assign mult1_ex5_fwd_data[SNAN]  = mult1_ex5_special_type[3];  

assign mult1_ex5_fwd_data[63:0]  = (mult1_ex5_fma_result_abnorm)
                                 ? mult1_ex5_fwd_abnorm[63:0]
                                 : mult1_ex5_fwd_norm[63:0];

assign slicex_mult1_dp_ex5_fwd_data[FWD_WIDTH-1:0] = mult1_ex5_fwd_data[FWD_WIDTH-1:0];

//==========================================================
//                    SIMD Part
//==========================================================
// &Force("bus","dp_xx_ex1_oper_size",2,0); @2617
// &Force("output","slicex_sing1_sum"); @2618
// &Force("output","slicex_sing1_carry"); @2619
// &Instance("ct_vfmau_mult_simd_single","x_ct_vfmau_mult_simd_single"); @2620
// &Connect( .dp_mult_slicem     (dp_mult1_slicem), @2621
//           .dp_mult_slicen     (dp_mult1_slicen), @2622
//           .dp_mult_ex1_clk_en (dp_mult1_ex1_clk_en), @2623
//           .dp_mult_ex2_clk_en (dp_mult1_ex2_clk_en), @2624
//           .dp_mult_ex3_clk_en (dp_mult1_ex3_clk_en), @2625
//           .dp_mult_ex4_clk_en (dp_mult1_ex4_clk_en) @2626
//          ); @2627
// &ConnRule(s/halfy/half0/); @2633
// &Instance("ct_vfmau_mult_simd_half","x_ct_vfmau_mult_simd_half0"); @2634
// &Force("nonport","slicex_simd_half0_hts_data"); @2635
// &ConnRule(s/halfy/half1/); @2637
// &Instance("ct_vfmau_mult_simd_half","x_ct_vfmau_mult_simd_half1"); @2638
// &Force("nonport","slicex_simd_half1_htd_data"); @2639
// &ConnRule(s/halfy/half2/); @2641
// &Instance("ct_vfmau_mult_simd_half","x_ct_vfmau_mult_simd_half2"); @2642
// &Force("nonport","slicex_simd_half2_hts_data"); @2643
// &ConnRule(s/halfy/half3/); @2645
// &Instance("ct_vfmau_mult_simd_half","x_ct_vfmau_mult_simd_half3"); @2646
// &Force("nonport","slicex_simd_half3_htd_data"); @2647
assign mult1_simd_half0_sel = 1'b1; 
// &ConnRule(s/halfy/half0/); @2651
// &Instance("ct_vfmau_mult_simd_half","x_ct_vfmau_mult_half"); @2652
ct_vfmau_mult_simd_half  x_ct_vfmau_mult_half (
  .cp0_vfpu_icg_en                        (cp0_vfpu_icg_en                       ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .dp_mult_ex1_op0_slicex_halfy           (dp_mult_ex1_op0_slicex_half0          ),
  .dp_mult_ex1_op0_slicex_halfy_high      (dp_mult_ex1_op0_slicex_half0_high     ),
  .dp_mult_ex1_op1_slicex_halfy           (dp_mult_ex1_op1_slicex_half0          ),
  .dp_mult_ex1_op1_slicex_halfy_high      (dp_mult_ex1_op1_slicex_half0_high     ),
  .dp_mult_ex1_op2_slicex_halfy           (dp_mult_ex1_op2_slicex_half0          ),
  .dp_mult_ex1_op2_slicex_halfy_high      (dp_mult_ex1_op2_slicex_half0_high     ),
  .dp_mult_op2_slicex_vl_halfy_mask       (dp_mult_op2_slicex_vl_half0_mask      ),
  .dp_mult_op2_slicex_vm_halfy_mask       (dp_mult_op2_slicex_vm_half0_mask      ),
  .dp_xx_ex1_fma                          (dp_xx_ex1_fma                         ),
  .dp_xx_ex1_half                         (dp_xx_ex1_half                        ),
  .dp_xx_ex1_neg                          (dp_xx_ex1_neg                         ),
  .dp_xx_ex1_rm                           (dp_xx_ex1_rm                          ),
  .dp_xx_ex1_simd                         (dp_xx_ex1_simd                        ),
  .dp_xx_ex1_sub                          (dp_xx_ex1_sub                         ),
  .dp_xx_ex1_widen                        (dp_xx_ex1_widen                       ),
  .dp_xx_ex2_fma                          (dp_xx_ex2_fma                         ),
  .dp_xx_ex2_half                         (dp_xx_ex2_half                        ),
  .dp_xx_ex2_rm                           (dp_xx_ex2_rm                          ),
  .dp_xx_ex2_simd                         (dp_xx_ex2_simd                        ),
  .dp_xx_ex3_rm                           (dp_xx_ex3_rm                          ),
  .forever_cpuclk                         (forever_cpuclk                        ),
  .halfy_ex1_op0_hidden_bit               (half0_ex1_op0_hidden_bit              ),
  .halfy_ex1_op1_hidden_bit               (half0_ex1_op1_hidden_bit              ),
  .halfy_fma_expt                         (half0_fma_expt                        ),
  .halfy_fma_result                       (half0_fma_result                      ),
  .halfy_mult_expt                        (half0_mult_expt                       ),
  .halfy_mult_result                      (half0_mult_result                     ),
  .mult1_simd_halfy_sel                   (mult1_simd_half0_sel                  ),
  .mult_ex1_ex2_half_pipedown             (mult_ex1_ex2_half_pipedown            ),
  .mult_ex2_ex3_half_pipedown             (mult_ex2_ex3_half_pipedown            ),
  .mult_ex3_ex4_half_pipedown             (mult_ex3_ex4_half_pipedown            ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .pipe6_pipex_ex4_fmla_fwd_vld           (pipe6_pipex_ex4_fmla_fwd_vld          ),
  .pipe6_vfmau_ex4_fmla_slicex_halfy_data (pipe6_vfmau_ex4_fmla_slicex_half0_data),
  .pipe7_pipex_ex4_fmla_fwd_vld           (pipe7_pipex_ex4_fmla_fwd_vld          ),
  .pipe7_vfmau_ex4_fmla_slicex_halfy_data (pipe7_vfmau_ex4_fmla_slicex_half0_data),
  .simd_halfy_product                     (simd_half0_product                    ),
  .slicex_dp_halfy_mult_id                (slicex_dp_half0_mult_id               ),
  .vfpu_yy_xx_dqnan                       (vfpu_yy_xx_dqnan                      )
);

assign mult1_ex1_op0_half0_hidden_bit = half0_ex1_op0_hidden_bit;
assign mult1_ex1_op1_half0_hidden_bit = half0_ex1_op1_hidden_bit;

// &ModuleEnd; @2657
endmodule


