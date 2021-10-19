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
module ct_fcnvt_double_dp(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_ex1_src,
  ex1_dest_double,
  ex1_dest_float,
  ex1_dest_single,
  ex1_narrow,
  ex1_pipedown,
  ex1_rm,
  ex1_scalar,
  ex1_sover,
  ex1_src_double,
  ex1_src_float,
  ex1_src_l16,
  ex1_src_l32,
  ex1_src_l64,
  ex1_src_si,
  ex1_src_single,
  ex1_widden,
  ex2_dest_double,
  ex2_dest_float,
  ex2_dest_half,
  ex2_dest_l16,
  ex2_dest_l32,
  ex2_dest_l64,
  ex2_dest_l8,
  ex2_dest_si,
  ex2_dest_single,
  ex2_pipedown,
  ex2_src_float,
  fcnvt_ex3_expt,
  fcnvt_ex3_result,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  vfpu_yy_xx_dqnan
);

// &Ports; @22
input           cp0_vfpu_icg_en;                
input           cp0_yy_clk_en;                  
input           cpurst_b;                       
input   [63:0]  dp_ex1_src;                     
input           ex1_dest_double;                
input           ex1_dest_float;                 
input           ex1_dest_single;                
input           ex1_narrow;                     
input           ex1_pipedown;                   
input   [4 :0]  ex1_rm;                         
input           ex1_scalar;                     
input           ex1_sover;                      
input           ex1_src_double;                 
input           ex1_src_float;                  
input           ex1_src_l16;                    
input           ex1_src_l32;                    
input           ex1_src_l64;                    
input           ex1_src_si;                     
input           ex1_src_single;                 
input           ex1_widden;                     
input           ex2_dest_double;                
input           ex2_dest_float;                 
input           ex2_dest_half;                  
input           ex2_dest_l16;                   
input           ex2_dest_l32;                   
input           ex2_dest_l64;                   
input           ex2_dest_l8;                    
input           ex2_dest_si;                    
input           ex2_dest_single;                
input           ex2_pipedown;                   
input           ex2_src_float;                  
input           forever_cpuclk;                 
input           pad_yy_icg_scan_en;             
input           vfpu_yy_xx_dqnan;               
output  [4 :0]  fcnvt_ex3_expt;                 
output  [63:0]  fcnvt_ex3_result;               

// &Regs; @23
reg     [11:0]  ex2_eadder_bias;                
reg     [11:0]  ex2_eadder_bias1;               
reg     [11:0]  ex2_expnt;                      
reg     [53:0]  ex2_f_tail;                     
reg     [52:0]  ex2_frac;                       
reg     [63:0]  ex2_half_result;                
reg     [63:0]  ex2_int;                        
reg     [53:0]  ex2_int_tail;                   
reg     [52:0]  ex2_itof_c_in;                  
reg             ex2_itof_neg;                   
reg             ex2_itof_tail_eq_0p5;           
reg             ex2_itof_tail_gt_0p5;           
reg             ex2_itof_tail_zero;             
reg             ex2_narrow_denorm;              
reg             ex2_sign;                       
reg     [63:0]  ex2_single_result;              
reg     [3 :0]  ex3_expt;                       
reg     [63:0]  ex3_result;                     
reg             fcnvt_ex2_opa_is_0;             
reg             fcnvt_ex2_opa_is_cnan;          
reg             fcnvt_ex2_opa_is_inf;           
reg             fcnvt_ex2_opa_is_qnan;          
reg             fcnvt_ex2_opa_is_snan;          
reg     [4 :0]  fcnvt_ex2_rm;                   

// &Wires; @24
wire            cp0_vfpu_icg_en;                
wire            cp0_yy_clk_en;                  
wire            cpurst_b;                       
wire    [22:0]  denorm_frac;                    
wire            double_expnt_add;               
wire            double_float_low_frac_all1;     
wire            double_float_norm_frac_all1;    
wire            double_neg_float_low_frac_all1; 
wire            double_norm_float_low_frac_all1; 
wire    [63:0]  dp_ex1_src;                     
wire            dqnan_out_sel;                  
wire            dqnan_prop_snan;                
wire            ex1_denorm;                     
wire            ex1_dest_double;                
wire            ex1_dest_float;                 
wire            ex1_dest_single;                
wire    [52:0]  ex1_double_cvt_frac;            
wire    [53:0]  ex1_double_cvt_tail;            
wire            ex1_double_narrow_denorm;       
wire    [23:0]  ex1_double_narrow_frac;         
wire            ex1_double_narrow_sover_denrom; 
wire    [53:0]  ex1_double_narrow_tail;         
wire            ex1_double_sover_denorm;        
wire    [10:0]  ex1_double_sover_frac;          
wire    [53:0]  ex1_double_sover_tail;          
wire    [10:0]  ex1_dtoh_sh_f_v;                
wire    [53:0]  ex1_dtoh_sh_f_x;                
wire    [23:0]  ex1_dtos_sh_f_v;                
wire    [53:0]  ex1_dtos_sh_f_x;                
wire    [11:0]  ex1_e_without_bias;             
wire    [11:0]  ex1_exp_bias;                   
wire    [52:0]  ex1_f_nm;                       
wire    [52:0]  ex1_f_trans;                    
wire            ex1_ff1_sh_c_in;                
wire    [5 :0]  ex1_ff1_sh_cnt;                 
wire    [5 :0]  ex1_ff1_sh_cnt_p1;              
wire    [52:0]  ex1_ff1_sh_d_add_1;             
wire            ex1_ff1_sh_d_c_eq_0p5;          
wire            ex1_ff1_sh_d_c_gt_0p5;          
wire            ex1_ff1_sh_d_c_zero;            
wire    [23:0]  ex1_ff1_sh_f_v;                 
wire    [39:0]  ex1_ff1_sh_f_x;                 
wire    [52:0]  ex1_ff1_sh_h_add_1;             
wire            ex1_ff1_sh_h_c_eq_0p5;          
wire            ex1_ff1_sh_h_c_gt_0p5;          
wire            ex1_ff1_sh_h_c_zero;            
wire    [52:0]  ex1_ff1_sh_s_add_1;             
wire            ex1_ff1_sh_s_c_eq_0p5;          
wire            ex1_ff1_sh_s_c_gt_0p5;          
wire            ex1_ff1_sh_s_c_zero;            
wire    [11:0]  ex1_final_expnt;                
wire    [52:0]  ex1_final_frac;                 
wire            ex1_final_sign;                 
wire    [53:0]  ex1_final_tail;                 
wire    [63:0]  ex1_fsh_i_v_nm;                 
wire    [53:0]  ex1_fsh_i_x_nm;                 
wire    [52:0]  ex1_fsh_src;                    
wire    [63:0]  ex1_ftoi_int;                   
wire    [53:0]  ex1_ftoi_int_tail;              
wire    [5 :0]  ex1_htos_sh_cnt;                
wire    [10:0]  ex1_htos_sh_f_v;                
wire    [63:0]  ex1_i_trans;                    
wire    [52:0]  ex1_itof_c_in;                  
wire    [52:0]  ex1_itof_c_in_pre;              
wire            ex1_itof_tail_eq_0p5;           
wire            ex1_itof_tail_eq_0p5_pre;       
wire            ex1_itof_tail_gt_0p5;           
wire            ex1_itof_tail_gt_0p5_pre;       
wire            ex1_itof_tail_zero;             
wire            ex1_itof_tail_zero_pre;         
wire            ex1_narrow;                     
wire            ex1_narrow_denorm;              
wire            ex1_narrow_sover;               
wire            ex1_norm_opa_is_0;              
wire            ex1_norm_opa_is_cnan;           
wire            ex1_norm_opa_is_inf;            
wire            ex1_norm_opa_is_qnan;           
wire            ex1_norm_opa_is_snan;           
wire            ex1_norm_opa_scalar_cnan;       
wire    [10:0]  ex1_norm_src_e;                 
wire    [10:0]  ex1_norm_src_e_d;               
wire    [10:0]  ex1_norm_src_e_h;               
wire    [10:0]  ex1_norm_src_e_s;               
wire    [51:0]  ex1_norm_src_f;                 
wire    [51:0]  ex1_norm_src_f_d;               
wire    [51:0]  ex1_norm_src_f_h;               
wire    [51:0]  ex1_norm_src_f_s;               
wire            ex1_norm_src_sign;              
wire            ex1_opa_is_0;                   
wire            ex1_opa_is_cnan;                
wire            ex1_opa_is_inf;                 
wire            ex1_opa_is_qnan;                
wire            ex1_opa_is_snan;                
wire            ex1_opa_scalar_cnan;            
wire            ex1_pipe_clk;                   
wire            ex1_pipe_clk_en;                
wire            ex1_pipedown;                   
wire    [4 :0]  ex1_rm;                         
wire            ex1_scalar;                     
wire            ex1_single_narrow_denorm;       
wire    [10:0]  ex1_single_narrow_frac;         
wire    [24:0]  ex1_single_narrow_tail;         
wire            ex1_sover;                      
wire    [31:0]  ex1_src;                        
wire            ex1_src_double;                 
wire    [10:0]  ex1_src_e;                      
wire    [51:0]  ex1_src_f;                      
wire            ex1_src_float;                  
wire    [7 :0]  ex1_src_i_b;                    
wire    [15:0]  ex1_src_i_h;                    
wire    [31:0]  ex1_src_i_w;                    
wire    [63:0]  ex1_src_i_x;                    
wire            ex1_src_l16;                    
wire            ex1_src_l32;                    
wire            ex1_src_l64;                    
wire            ex1_src_neg_shf;                
wire            ex1_src_si;                     
wire            ex1_src_sign;                   
wire            ex1_src_single;                 
wire    [11:0]  ex1_stod_sh_cnt;                
wire    [23:0]  ex1_stod_sh_f_v;                
wire    [10:0]  ex1_stoh_sh_f_v;                
wire    [24:0]  ex1_stoh_sh_f_x;                
wire            ex1_widden;                     
wire            ex1_widden_denorm;              
wire    [11:0]  ex1_widden_denorm_expnt;        
wire    [23:0]  ex1_widden_denorm_frac;         
wire            ex2_dest_double;                
wire            ex2_dest_float;                 
wire            ex2_dest_half;                  
wire    [63:0]  ex2_dest_int_result;            
wire            ex2_dest_l16;                   
wire            ex2_dest_l32;                   
wire            ex2_dest_l64;                   
wire            ex2_dest_l8;                    
wire            ex2_dest_sel_float;             
wire            ex2_dest_si;                    
wire            ex2_dest_single;                
wire    [51:0]  ex2_double_frac;                
wire    [63:0]  ex2_double_norm_result;         
wire    [51:0]  ex2_double_qnan_f;              
wire    [63:0]  ex2_double_result;              
wire            ex2_double_result_inf;          
wire            ex2_expnt_add1;                 
wire    [11:0]  ex2_expnt_bias_tmp;             
wire    [11:0]  ex2_expnt_bias_tmp1;            
wire    [3 :0]  ex2_expt;                       
wire            ex2_f_nv;                       
wire            ex2_fcnvt_split_inst;           
wire            ex2_final_ix;                   
wire    [63:0]  ex2_float_result;               
wire            ex2_float_x_zero;               
wire            ex2_frac_lst;                   
wire            ex2_frac_result_sign;           
wire            ex2_frac_round_add;             
wire            ex2_half_denorm;                
wire            ex2_half_expnt_of;              
wire            ex2_half_expnt_uf;              
wire    [9 :0]  ex2_half_frac;                  
wire            ex2_half_nor_inf;               
wire    [63:0]  ex2_half_norm_result;           
wire            ex2_half_of;                    
wire    [9 :0]  ex2_half_qnan_f;                
wire            ex2_half_result_inf;            
wire            ex2_half_result_lfn;            
wire            ex2_half_uf;                    
wire    [63:0]  ex2_int_l16_result;             
wire    [63:0]  ex2_int_l32_result;             
wire    [63:0]  ex2_int_l64_result;             
wire    [63:0]  ex2_int_l8_result;              
wire            ex2_int_lst;                    
wire            ex2_int_nv;                     
wire    [63:0]  ex2_int_result;                 
wire    [63:0]  ex2_int_rnd_adder_p1;           
wire    [52:0]  ex2_itof_neg_frac;              
wire    [52:0]  ex2_itof_neg_frac_p1;           
wire            ex2_itof_neg_round_add;         
wire            ex2_ix;                         
wire    [11:0]  ex2_norm_expnt;                 
wire            ex2_nv;                         
wire            ex2_of;                         
wire    [52:0]  ex2_orig_frac;                  
wire            ex2_pipe_clk;                   
wire            ex2_pipe_clk_en;                
wire            ex2_pipedown;                   
wire    [63:0]  ex2_qnan_a_src2_d_result;       
wire    [63:0]  ex2_qnan_a_src2_h_result;       
wire    [63:0]  ex2_qnan_a_src2_s_result;       
wire            ex2_r_is_qnan;                  
wire            ex2_r_is_qnan_a_src2;           
wire            ex2_r_sel_src2;                 
wire            ex2_rm_rdn;                     
wire            ex2_rm_rmm;                     
wire            ex2_rm_rne;                     
wire            ex2_rm_rtz;                     
wire            ex2_rm_rup;                     
wire    [63:0]  ex2_rnd_adder_f_src0;           
wire    [63:0]  ex2_rnd_adder_f_src1;           
wire    [63:0]  ex2_rnd_adder_i_src0;           
wire    [63:0]  ex2_rnd_adder_i_src1;           
wire    [63:0]  ex2_rnd_adder_p1;               
wire    [52:0]  ex2_rnd_frac_adder_p1;          
wire            ex2_rnd_lst;                    
wire            ex2_round_add;                  
wire            ex2_single_denorm;              
wire            ex2_single_expnt_of;            
wire            ex2_single_expnt_uf;            
wire    [22:0]  ex2_single_frac;                
wire            ex2_single_nor_inf;             
wire    [63:0]  ex2_single_norm_result;         
wire            ex2_single_of;                  
wire    [22:0]  ex2_single_qnan_f;              
wire            ex2_single_result_inf;          
wire            ex2_single_result_lfn;          
wire            ex2_single_uf;                  
wire            ex2_src_float;                  
wire    [53:0]  ex2_tail;                       
wire            ex2_tosi16_neg_exp_crit_of;     
wire            ex2_tosi16_neg_exp_of;          
wire            ex2_tosi16_of;                  
wire            ex2_tosi16_pos_exp_crit_of;     
wire            ex2_tosi16_pos_exp_of;          
wire            ex2_tosi16_uf;                  
wire            ex2_tosi32_neg_exp_crit_of;     
wire            ex2_tosi32_neg_exp_of;          
wire            ex2_tosi32_of;                  
wire            ex2_tosi32_pos_exp_crit_of;     
wire            ex2_tosi32_pos_exp_of;          
wire            ex2_tosi32_uf;                  
wire            ex2_tosi64_neg_crit_exp_of;     
wire            ex2_tosi64_neg_exp_of;          
wire            ex2_tosi64_of;                  
wire            ex2_tosi64_pos_exp_of;          
wire            ex2_tosi64_uf;                  
wire            ex2_tosi8_neg_exp_crit_of;      
wire            ex2_tosi8_neg_exp_of;           
wire            ex2_tosi8_of;                   
wire            ex2_tosi8_pos_exp_crit_of;      
wire            ex2_tosi8_pos_exp_of;           
wire            ex2_tosi8_uf;                   
wire    [63:0]  ex2_total_result;               
wire            ex2_toui16_exp_crit_of;         
wire            ex2_toui16_exp_of;              
wire            ex2_toui16_of;                  
wire            ex2_toui16_uf;                  
wire            ex2_toui32_exp_crit_of;         
wire            ex2_toui32_exp_of;              
wire            ex2_toui32_of;                  
wire            ex2_toui32_uf;                  
wire            ex2_toui64_of;                  
wire            ex2_toui64_uf;                  
wire            ex2_toui8_exp_crit_of;          
wire            ex2_toui8_exp_of;               
wire            ex2_toui8_of;                   
wire            ex2_toui8_uf;                   
wire    [15:0]  ex2_u16_result;                 
wire    [31:0]  ex2_u32_result;                 
wire    [63:0]  ex2_u64_result;                 
wire    [7 :0]  ex2_u8_result;                  
wire            ex2_uf;                         
wire    [63:0]  ex2_uint_result;                
wire            ex2_x_eq_0p5;                   
wire            ex2_x_gt_0p5;                   
wire            ex2_x_zero;                     
wire    [4 :0]  fcnvt_ex3_expt;                 
wire    [63:0]  fcnvt_ex3_result;               
wire            float_dest_special;             
wire            forever_cpuclk;                 
wire    [52:0]  ftof_narrow_frac;               
wire    [53:0]  ftof_narrow_tail;               
wire    [9 :0]  h_denorm_frac;                  
wire            half_expnt_add;                 
wire            half_float_low_frac_all1;       
wire            half_float_norm_frac_all1;      
wire            half_neg_float_low_frac_all1;   
wire            half_norm_expnt_add;            
wire            half_norm_float_low_frac_all1;  
wire            int_dest_max_si16;              
wire            int_dest_max_si32;              
wire            int_dest_max_si64;              
wire            int_dest_max_si8;               
wire            int_dest_max_ui16;              
wire            int_dest_max_ui32;              
wire            int_dest_max_ui64;              
wire            int_dest_max_ui8;               
wire            int_dest_min_si16;              
wire            int_dest_min_si32;              
wire            int_dest_min_si64;              
wire            int_dest_min_si8;               
wire    [15:0]  int_s16_result;                 
wire    [31:0]  int_s32_result;                 
wire    [63:0]  int_s64_result;                 
wire    [7 :0]  int_s8_result;                  
wire    [52:0]  itof_dest_double_frac;          
wire    [53:0]  itof_dest_double_tail;          
wire    [52:0]  itof_dest_frac;                 
wire    [52:0]  itof_dest_frac_pre;             
wire    [52:0]  itof_dest_half_frac;            
wire    [53:0]  itof_dest_half_tail;            
wire    [52:0]  itof_dest_single_frac;          
wire    [53:0]  itof_dest_single_tail;          
wire    [53:0]  itof_dest_tail;                 
wire    [53:0]  itof_dest_tail_pre;             
wire    [11:0]  itof_expnt;                     
wire            norm_ea_is_0;                   
wire            norm_ea_is_nan_inf;             
wire            norm_fa_gt_0;                   
wire            norm_fa_is_0;                   
wire            norm_fa_msb_is_1;               
wire            norm_ia_is_0;                   
wire            pad_yy_icg_scan_en;             
wire            single_expnt_add;               
wire            single_float_low_frac_all1;     
wire            single_float_norm_frac_all1;    
wire            single_neg_float_low_frac_all1; 
wire            single_norm_expnt_add;          
wire            single_norm_float_low_frac_all1; 
wire            vfpu_yy_xx_dqnan;               


//==========================================================
//EX1 Stage:
//  1. Operator Normalize
//  2. FTOI Path
//  3. ITOF Path
//  4. FTOF WIDDEN  
//  5. FTOF NARROW  both are for denormal 
//==========================================================
assign ex1_norm_src_e_d[10:0] = dp_ex1_src[62:52];
assign ex1_norm_src_e_s[10:0] = {3'b0, dp_ex1_src[30:23]};
assign ex1_norm_src_f_d[51:0] = dp_ex1_src[51:0];
assign ex1_norm_src_f_s[51:0] = {dp_ex1_src[22:0],29'b0};
assign ex1_norm_src_e_h[10:0] = {6'b0,dp_ex1_src[14:10]};
assign ex1_norm_src_f_h[51:0] = {dp_ex1_src[9:0],42'b0};
assign ex1_norm_src_e[10:0]   = (ex1_src_double) ? ex1_norm_src_e_d[10:0] :
                                 ex1_src_single  ? ex1_norm_src_e_s[10:0]
                                                 : ex1_norm_src_e_h[10:0];
assign ex1_norm_src_f[51:0]   = (ex1_src_double) ?  ex1_norm_src_f_d[51:0] :
                                 ex1_src_single  ?  ex1_norm_src_f_s[51:0]
                                                 :  ex1_norm_src_f_h[51:0];
assign norm_ea_is_0         = ~|ex1_norm_src_e[10:0];
assign norm_ea_is_nan_inf   =  (ex1_src_double) ?  (&ex1_norm_src_e[10:0]) :
                                ex1_src_single  ?  (&ex1_norm_src_e[7:0])  : &ex1_norm_src_e[4:0];
assign norm_fa_gt_0         =  |ex1_norm_src_f[51:0];
assign norm_fa_is_0         = ~|ex1_norm_src_f[51:0];
assign norm_fa_msb_is_1     =  ex1_norm_src_f[51];
assign norm_ia_is_0         = ex1_src_l64 ? ~|dp_ex1_src[63:0] :
                              ex1_src_l32 ? ~|dp_ex1_src[31:0] :
                              ex1_src_l16 ? ~|dp_ex1_src[15:0] :
                                            ~|dp_ex1_src[7:0];
assign ex1_norm_src_sign   = ex1_src_l64 ? dp_ex1_src[63] : 
                             ex1_src_l32 ? dp_ex1_src[31] : 
                             ex1_src_l16 ? dp_ex1_src[15]
                                         : dp_ex1_src[7];  
//Float Operator Type Detect
assign ex1_norm_opa_is_0    = norm_ea_is_0       && norm_fa_is_0        && ex1_src_float && !ex1_norm_opa_is_cnan|| 
                              norm_ia_is_0       && !ex1_src_float;//integer
assign ex1_norm_opa_is_inf  = norm_ea_is_nan_inf && norm_fa_is_0        && ex1_src_float && !ex1_norm_opa_is_cnan;
assign ex1_norm_opa_scalar_cnan = ex1_src_single ? ~&dp_ex1_src[63:32] : !ex1_src_double && ~&dp_ex1_src[63:16];
assign ex1_norm_opa_is_cnan = ex1_norm_opa_scalar_cnan && ex1_scalar;
assign ex1_norm_opa_is_qnan = norm_ea_is_nan_inf && norm_fa_msb_is_1    && ex1_src_float || ex1_norm_opa_is_cnan;
assign ex1_norm_opa_is_snan = norm_ea_is_nan_inf && (!norm_fa_msb_is_1) && norm_fa_gt_0 && ex1_src_float && !ex1_norm_opa_is_cnan;
assign ex1_src_e[10:0]            = ex1_norm_src_e[10:0];
assign ex1_src_f[51:0]            = ex1_norm_src_f[51:0];
assign ex1_exp_bias[11:0]         = ex1_src_double ? 12'hC01 :
                                    ex1_src_single ? 12'hF81 : 12'hFF1;  
assign ex1_src_sign       = ex1_norm_src_sign;
//Float Operator Type Detect
assign ex1_opa_is_0        = ex1_norm_opa_is_0;
assign ex1_opa_is_inf      = ex1_norm_opa_is_inf;
assign ex1_opa_scalar_cnan = ex1_norm_opa_scalar_cnan;
assign ex1_opa_is_cnan     = ex1_opa_scalar_cnan;
assign ex1_opa_is_qnan     = ex1_norm_opa_is_qnan;
assign ex1_opa_is_snan     = ex1_norm_opa_is_snan;
assign ex1_src[31:0]      =  dp_ex1_src[31:0];

//======================
// exponent adjust 
//======================

assign  ex1_e_without_bias[11:0] = {1'b0,ex1_src_e[10:0]} + ex1_exp_bias[11:0];

//=========================
//FTOI Path
//=========================
//cacluate the integer number

assign ex1_f_trans[52:0]   = ex1_f_nm[52:0];
assign ex1_f_nm[52:0]      = {(~ex1_opa_is_0),ex1_src_f[51:0]};

// &Instance("ct_fcnvt_ftoi_sh","x_ct_fcnvt_ftoi_sh"); @156
ct_fcnvt_ftoi_sh  x_ct_fcnvt_ftoi_sh (
  .fsh_cnt                 (ex1_e_without_bias[6:0]),
  .fsh_i_v_nm              (ex1_fsh_i_v_nm         ),
  .fsh_i_x_nm              (ex1_fsh_i_x_nm         ),
  .fsh_src                 (ex1_fsh_src            )
);

// &Connect( @157
//           .fsh_cnt    (ex1_e_without_bias[6:0]), @158
//           .fsh_src    (ex1_fsh_src), @159
//           .fsh_i_v_nm (ex1_fsh_i_v_nm), @160
//           .fsh_i_x_nm (ex1_fsh_i_x_nm) @161
//         ); @162
assign ex1_fsh_src[52:0]       = ex1_f_trans[52:0];
assign ex1_ftoi_int[63:0]      = ex1_e_without_bias[11] ? 64'b0 : ex1_fsh_i_v_nm[63:0];
assign ex1_ftoi_int_tail[53:0] = ex1_e_without_bias[11] && ex1_e_without_bias[10:0] != 11'h7ff ? {1'b0,ex1_fsh_src[52:0]} : ex1_fsh_i_x_nm[53:0];
//=========================
// ITOF Path
//=========================
// need to get the expnt number
// also for fraction


assign ex1_src_neg_shf    = ex1_src_sign && ex1_src_si;

// integer preparation
assign ex1_src_i_h[15:0]    = ex1_src[15] && ex1_src_si ? {~ex1_src[15:0]} : ex1_src[15:0];
assign ex1_src_i_b[7:0]     = ex1_src_si && ex1_src[7]  ? ~ex1_src[7:0] : ex1_src[7:0];
assign ex1_src_i_w[31:0]    = ex1_src_si && ex1_src[31] ? ~ex1_src[31:0] : ex1_src[31:0];
assign ex1_src_i_x[63:0]    = dp_ex1_src[63] && ex1_src_si ? ~dp_ex1_src[63:0] : dp_ex1_src[63:0];
assign ex1_i_trans[63:0]      = ex1_src_l64 ? ex1_src_i_x[63:0] :
                              ex1_src_l32 ? {32'b0,ex1_src_i_w[31:0]} : 
                              ex1_src_l16 ? {48'b0,ex1_src_i_h[15:0]} : {56'b0,ex1_src_i_b[7:0]};



// &Instance("ct_fcnvt_itof_sh","x_ct_fcnvt_itof_sh"); @186
ct_fcnvt_itof_sh  x_ct_fcnvt_itof_sh (
  .ff1_sh_c_in           (ex1_ff1_sh_c_in      ),
  .ff1_sh_cnt            (ex1_ff1_sh_cnt       ),
  .ff1_sh_cnt_p1         (ex1_ff1_sh_cnt_p1    ),
  .ff1_sh_d_add_1        (ex1_ff1_sh_d_add_1   ),
  .ff1_sh_d_c_eq_0p5     (ex1_ff1_sh_d_c_eq_0p5),
  .ff1_sh_d_c_gt_0p5     (ex1_ff1_sh_d_c_gt_0p5),
  .ff1_sh_d_c_zero       (ex1_ff1_sh_d_c_zero  ),
  .ff1_sh_f_v            (ex1_ff1_sh_f_v       ),
  .ff1_sh_f_x            (ex1_ff1_sh_f_x       ),
  .ff1_sh_h_add_1        (ex1_ff1_sh_h_add_1   ),
  .ff1_sh_h_c_eq_0p5     (ex1_ff1_sh_h_c_eq_0p5),
  .ff1_sh_h_c_gt_0p5     (ex1_ff1_sh_h_c_gt_0p5),
  .ff1_sh_h_c_zero       (ex1_ff1_sh_h_c_zero  ),
  .ff1_sh_s_add_1        (ex1_ff1_sh_s_add_1   ),
  .ff1_sh_s_c_eq_0p5     (ex1_ff1_sh_s_c_eq_0p5),
  .ff1_sh_s_c_gt_0p5     (ex1_ff1_sh_s_c_gt_0p5),
  .ff1_sh_s_c_zero       (ex1_ff1_sh_s_c_zero  ),
  .ff1_sh_src            (ex1_i_trans[63:0]    )
);

// &Connect( @187
//           .ff1_sh_src       (ex1_i_trans[63:0]), @188
//           .ff1_sh_cnt       (ex1_ff1_sh_cnt   ), @189
//           .ff1_sh_f_v       (ex1_ff1_sh_f_v   ), @190
//           .ff1_sh_f_x       (ex1_ff1_sh_f_x   ), @191
//           .ff1_sh_c_in      (ex1_ff1_sh_c_in  ), @192
//           .ff1_sh_cnt_p1    (ex1_ff1_sh_cnt_p1), @193
//           .ff1_sh_d_add_1   (ex1_ff1_sh_d_add_1), @194
//           .ff1_sh_d_c_zero  (ex1_ff1_sh_d_c_zero),   @195
//           .ff1_sh_d_c_eq_0p5(ex1_ff1_sh_d_c_eq_0p5), @196
//           .ff1_sh_d_c_gt_0p5(ex1_ff1_sh_d_c_gt_0p5), @197
//           .ff1_sh_s_add_1   (ex1_ff1_sh_s_add_1), @198
//           .ff1_sh_s_c_zero  (ex1_ff1_sh_s_c_zero),   @199
//           .ff1_sh_s_c_eq_0p5(ex1_ff1_sh_s_c_eq_0p5), @200
//           .ff1_sh_s_c_gt_0p5(ex1_ff1_sh_s_c_gt_0p5), @201
//           .ff1_sh_h_add_1   (ex1_ff1_sh_h_add_1), @202
//           .ff1_sh_h_c_zero  (ex1_ff1_sh_h_c_zero),   @203
//           .ff1_sh_h_c_eq_0p5(ex1_ff1_sh_h_c_eq_0p5), @204
//           .ff1_sh_h_c_gt_0p5(ex1_ff1_sh_h_c_gt_0p5) @205
//         ); @206
//assign ex1_dest_double    = ex1_src_l64 && !ex1_widden && !ex1_narrow
//                            || ex1_src_l32 && ex1_widden;
//assign ex1_dest_single    = ex1_src_l32 && !ex1_widden && !ex1_narrow
//                            || !ex1_src_l64 && !ex1_src_l32 && ex1_widden
//                            || ex1_src_l64 && ex1_narrow;
//assign ex1_dest_half      = ex1_src_l32  && ex1_narrow 
//                            || !ex1_src_l64 && !ex1_src_l32 && !ex1_widden && !ex1_narrow
//                            || !ex1_src_l64 && !ex1_src_l32 && !ex1_src_l16 && ex1_widden;

assign itof_dest_double_frac[52:0]  = {ex1_ff1_sh_f_v[23:0],ex1_ff1_sh_f_x[39:11]};
assign itof_dest_double_tail[53:0]  = {ex1_ff1_sh_f_x[10:0],43'b0};

assign itof_dest_single_frac[52:0]  = {ex1_ff1_sh_f_v[23:0],29'b0};
assign itof_dest_single_tail[53:0]  = {ex1_ff1_sh_f_x[39:0],14'b0};

assign itof_dest_half_frac[52:0]    = {ex1_ff1_sh_f_v[23:13],42'b0};
assign itof_dest_half_tail[53:0]    = {ex1_ff1_sh_f_v[12:0],ex1_ff1_sh_f_x[39:0],1'b0};

assign itof_dest_frac_pre[52:0]     = ex1_dest_double ? itof_dest_double_frac[52:0] :
                                      ex1_dest_single ? itof_dest_single_frac[52:0]
                                                      : itof_dest_half_frac[52:0];
assign itof_dest_tail_pre[53:0]     = ex1_dest_double ? itof_dest_double_tail[53:0] : 
                                      ex1_dest_single ? itof_dest_single_tail[53:0]
                                                      : itof_dest_half_tail[53:0];
// here the negative integer, will have the carry in,
// for the timing consideration, the carry in is special treated after
// the shift
assign itof_dest_frac[52:0]         = ex1_src_neg_shf && ex1_ff1_sh_c_in ? 53'h10_0000_0000_0000
                                      : itof_dest_frac_pre[52:0];
assign itof_dest_tail[53:0]         = ex1_src_neg_shf && ex1_ff1_sh_c_in ? 54'h0 :
                                      itof_dest_tail_pre[53:0]; 
assign itof_expnt[11:0]             = ex1_src_neg_shf && ex1_ff1_sh_c_in ? {6'b0,ex1_ff1_sh_cnt_p1[5:0]} 
                                      : {6'b0,ex1_ff1_sh_cnt[5:0]};
assign ex1_itof_c_in_pre[52:0]          = ex1_dest_double ? ex1_ff1_sh_d_add_1[52:0] :
                                          ex1_dest_single ? ex1_ff1_sh_s_add_1[52:0]
                                                      : ex1_ff1_sh_h_add_1[52:0];
assign ex1_itof_tail_zero_pre           = ex1_dest_double ? ex1_ff1_sh_d_c_zero :
                                          ex1_dest_single ? ex1_ff1_sh_s_c_zero
                                                          : ex1_ff1_sh_h_c_zero;
assign ex1_itof_tail_eq_0p5_pre           = ex1_dest_double ? ex1_ff1_sh_d_c_eq_0p5 :
                                            ex1_dest_single ? ex1_ff1_sh_s_c_eq_0p5
                                                            : ex1_ff1_sh_h_c_eq_0p5;
assign ex1_itof_tail_gt_0p5_pre           = ex1_dest_double ? ex1_ff1_sh_d_c_gt_0p5 :
                                            ex1_dest_single ? ex1_ff1_sh_s_c_gt_0p5
                                                            : ex1_ff1_sh_h_c_gt_0p5;
assign ex1_itof_c_in[52:0]                = ex1_src_neg_shf && ex1_ff1_sh_c_in ? 53'b0 : ex1_itof_c_in_pre[52:0];
assign ex1_itof_tail_zero                 = ex1_src_neg_shf && ex1_ff1_sh_c_in ? 1'b1 : ex1_itof_tail_zero_pre;
assign ex1_itof_tail_eq_0p5               = ex1_src_neg_shf && ex1_ff1_sh_c_in ? 1'b0 : ex1_itof_tail_eq_0p5_pre;
assign ex1_itof_tail_gt_0p5               = ex1_src_neg_shf && ex1_ff1_sh_c_in ? 1'b0 : ex1_itof_tail_gt_0p5_pre;

//=========================
// FTOF Path
//=========================
//special treat for  widden 
//and narrow calculation
// 
//widden path, need to dealing with the denorm num
// here combine the single and half precision

assign  denorm_frac[22:0]  = ex1_src_f[51:29];
assign h_denorm_frac[9:0]  = ex1_src_f[51:42];
// &Instance("ct_fcnvt_stod_sh","x_ct_fcnvt_stod_sh"); @268
ct_fcnvt_stod_sh  x_ct_fcnvt_stod_sh (
  .stod_sh_cnt       (ex1_stod_sh_cnt  ),
  .stod_sh_f_v       (ex1_stod_sh_f_v  ),
  .stod_sh_src       (denorm_frac[22:0])
);

// &Connect( @269
//           .stod_sh_src  (denorm_frac[22:0]  ), @270
//           .stod_sh_f_v  (ex1_stod_sh_f_v), @271
//           .stod_sh_cnt  (ex1_stod_sh_cnt) @272
//         ); @273
// &Instance("ct_fcnvt_htos_sh","x_ct_fcnvt_htos_sh"); @274
ct_fcnvt_htos_sh  x_ct_fcnvt_htos_sh (
  .htos_sh_cnt        (ex1_htos_sh_cnt   ),
  .htos_sh_f_v        (ex1_htos_sh_f_v   ),
  .htos_sh_src        (h_denorm_frac[9:0])
);

// &Connect( @275
//           .htos_sh_src  (h_denorm_frac[9:0]  ), @276
//           .htos_sh_f_v  (ex1_htos_sh_f_v), @277
//           .htos_sh_cnt  (ex1_htos_sh_cnt) @278
//         ); @279
        
assign ex1_denorm               =  (ex1_src_e[10:0] == 11'b0);
assign ex1_widden_denorm        =  (ex1_sover&&ex1_src_l16 || ex1_widden) && ex1_denorm;
assign ex1_widden_denorm_expnt[11:0]   =  ex1_src_l32 ? ex1_stod_sh_cnt[11:0] : {{6{1'b1}},ex1_htos_sh_cnt[5:0]};
assign ex1_widden_denorm_frac[23:0]    =  ex1_src_l32 ? ex1_stod_sh_f_v[23:0] : {ex1_htos_sh_f_v[10:0],13'b0};
// for narrow path, need to dealing withe the fraction
// when it become denormal for dest length.
// here we don't combine together.
// &Instance("ct_fcnvt_dtos_sh","x_ct_fcnvt_dtos_sh"); @288
ct_fcnvt_dtos_sh  x_ct_fcnvt_dtos_sh (
  .dtos_sh_cnt       (dp_ex1_src[62:52]),
  .dtos_sh_f_v       (ex1_dtos_sh_f_v  ),
  .dtos_sh_f_x       (ex1_dtos_sh_f_x  ),
  .dtos_sh_src       (dp_ex1_src[51:0] )
);

// &Connect( @289
//           .dtos_sh_src  (dp_ex1_src[51:0]  ), @290
//           .dtos_sh_cnt  (dp_ex1_src[62:52] ), @291
//           .dtos_sh_f_v  (ex1_dtos_sh_f_v), @292
//           .dtos_sh_f_x  (ex1_dtos_sh_f_x) @293
//         ); @294
// &Instance("ct_fcnvt_stoh_sh","x_ct_fcnvt_stoh_sh"); @295
ct_fcnvt_stoh_sh  x_ct_fcnvt_stoh_sh (
  .stoh_sh_cnt     (ex1_src[30:23] ),
  .stoh_sh_f_v     (ex1_stoh_sh_f_v),
  .stoh_sh_f_x     (ex1_stoh_sh_f_x),
  .stoh_sh_src     (ex1_src[22:0]  )
);

// &Connect( @296
//           .stoh_sh_src  (ex1_src[22:0]  ), @297
//           .stoh_sh_cnt  (ex1_src[30:23] ), @298
//           .stoh_sh_f_v  (ex1_stoh_sh_f_v), @299
//           .stoh_sh_f_x  (ex1_stoh_sh_f_x) @300
//         ); @301
// &Instance("ct_fcnvt_dtoh_sh","x_ct_fcnvt_dtoh_sh"); @302
ct_fcnvt_dtoh_sh  x_ct_fcnvt_dtoh_sh (
  .dtos_sh_cnt       (dp_ex1_src[62:52]),
  .dtos_sh_f_v       (ex1_dtoh_sh_f_v  ),
  .dtos_sh_f_x       (ex1_dtoh_sh_f_x  ),
  .dtos_sh_src       (dp_ex1_src[51:0] )
);

// &Connect( @303
//           .dtos_sh_src  (dp_ex1_src[51:0]  ), @304
//           .dtos_sh_cnt  (dp_ex1_src[62:52] ), @305
//           .dtos_sh_f_v  (ex1_dtoh_sh_f_v), @306
//           .dtos_sh_f_x  (ex1_dtoh_sh_f_x) @307
//         ); @308

assign ex1_double_narrow_denorm         = dp_ex1_src[62:52] < 11'h381; //896
assign ex1_double_sover_denorm          = dp_ex1_src[62:52] < 11'h3f1; //1008
assign ex1_double_narrow_frac[23:0]     = ex1_double_narrow_denorm ? ex1_dtos_sh_f_v[23:0]
                                                                   : {1'b1,dp_ex1_src[51:29]};
assign ex1_double_narrow_tail[53:0]     = ex1_double_narrow_denorm ? ex1_dtos_sh_f_x[53:0]
                                                                   : {dp_ex1_src[28:0],25'b0};
assign ex1_double_sover_frac[10:0]      = ex1_double_sover_denorm ? ex1_dtoh_sh_f_v[10:0]
                                                                  : {1'b1,dp_ex1_src[51:42]};
assign ex1_double_sover_tail[53:0]      = ex1_double_sover_denorm ? ex1_dtoh_sh_f_x[53:0]
                                                                  : {dp_ex1_src[41:0],12'b0};
assign ex1_double_cvt_frac[52:0]        = {53{ex1_narrow}} & {ex1_double_narrow_frac[23:0],29'b0} |
                                          {53{ex1_sover}}  & {ex1_double_sover_frac[10:0],42'b0};
assign ex1_double_cvt_tail[53:0]        = {54{ex1_narrow}} & {ex1_double_narrow_tail[53:0]} |
                                          {54{ex1_sover}}  & {ex1_double_sover_tail[53:0]};
                                        
assign ex1_single_narrow_denorm         = ex1_src[30:23] < 8'h71; //112
assign ex1_single_narrow_frac[10:0]     = ex1_single_narrow_denorm ? ex1_stoh_sh_f_v[10:0]
                                                                   : {1'b1,ex1_src[22:13]};
assign ex1_single_narrow_tail[24:0]     = ex1_single_narrow_denorm ? ex1_stoh_sh_f_x[24:0]
                                                                   : {ex1_src[12:0],12'b0};

assign ftof_narrow_frac[52:0]           = ex1_src_double ? {ex1_double_cvt_frac[52:0]}
                                                         : {ex1_single_narrow_frac[10:0],42'b0};
assign ftof_narrow_tail[53:0]           = ex1_src_double ? {ex1_double_cvt_tail[53:0]}
                                                         : {ex1_single_narrow_tail[24:0],29'b0};
assign ex1_narrow_sover                 = ex1_narrow || ex1_sover && ex1_src_double;
//pipe to ex2 single 
//float result
//fraction
assign ex1_final_frac[52:0]             = !ex1_src_float ? itof_dest_frac[52:0] :
                                           ex1_narrow_sover  ? ftof_narrow_frac[52:0] :
                                           ex1_widden_denorm ? {ex1_widden_denorm_frac[23:0],29'b0}
                                                         : {!ex1_denorm,ex1_src_f[51:0]};
assign ex1_final_tail[53:0]             =  !ex1_src_float ? itof_dest_tail[53:0] :
                                            ex1_narrow_sover  ? ftof_narrow_tail[53:0]
                                                         : {54'b0};
//exponent
//
assign ex1_final_expnt[11:0]            = !ex1_src_float     ? itof_expnt[11:0] :
                                           ex1_widden_denorm ? ex1_widden_denorm_expnt[11:0]
                                                             : ex1_e_without_bias[11:0];
assign ex1_final_sign                   = ex1_src_sign && !(ex1_src_float 
                                                             && !ex1_dest_float  
                                                             && (ex1_opa_is_0) 
                                                          || !ex1_src_float && !ex1_src_si);
assign ex1_double_narrow_sover_denrom   = ex1_narrow && ex1_double_narrow_denorm ||
                                          ex1_sover  && ex1_double_sover_denorm;  
assign ex1_narrow_denorm                = ex1_src_float && (ex1_src_double ? ex1_double_narrow_sover_denrom
                                                                           : ex1_single_narrow_denorm);
//gate clk
// &Instance("gated_clk_cell","x_ex1_pipe_clk"); @360
gated_clk_cell  x_ex1_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @361
//           .clk_out        (ex1_pipe_clk),//Out Clock @362
//           .external_en    (1'b0), @363
//           .global_en      (cp0_yy_clk_en), @364
//           .local_en       (ex1_pipe_clk_en),//Local Condition @365
//           .module_en      (cp0_vfpu_icg_en) @366
//         ); @367
assign ex1_pipe_clk_en = ex1_pipedown;

always @(posedge ex1_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex2_expnt[11:0]               <= 12'b0;
    ex2_frac[52:0]                <= 53'b0;
    ex2_f_tail[53:0]              <= 54'b0;
    ex2_int[63:0]                 <= 64'b0;
    ex2_int_tail[53:0]            <= 54'b0;
    fcnvt_ex2_opa_is_0            <=  1'b0;
   // fcnvt_ex2_opa_is_dn           <=  1'b0;
    fcnvt_ex2_opa_is_inf          <=  1'b0;
    fcnvt_ex2_opa_is_cnan         <=  1'b0;
    fcnvt_ex2_opa_is_qnan         <=  1'b0;
    fcnvt_ex2_opa_is_snan         <=  1'b0;
    ex2_sign                      <=  1'b0;
    ex2_narrow_denorm             <=  1'b0;
    fcnvt_ex2_rm[4:0]             <=  5'b0;
    ex2_itof_c_in[52:0]           <=  53'b0;
    ex2_itof_tail_zero            <=  1'b0;
    ex2_itof_tail_eq_0p5          <=  1'b0;
    ex2_itof_tail_gt_0p5          <=  1'b0;
    ex2_itof_neg                  <=  1'b0;
  end
  else if(ex1_pipedown)
  begin
    ex2_expnt[11:0]               <= ex1_final_expnt[11:0];
    ex2_frac[52:0]                <= ex1_final_frac[52:0];
    ex2_f_tail[53:0]              <= ex1_final_tail[53:0];
    ex2_int[63:0]                 <= ex1_ftoi_int[63:0];
    ex2_int_tail[53:0]            <= ex1_ftoi_int_tail[53:0];
    fcnvt_ex2_opa_is_0            <= ex1_opa_is_0;
    //fcnvt_ex2_opa_is_dn           <= ex1_opa_is_dn;
    fcnvt_ex2_opa_is_inf          <= ex1_opa_is_inf;
    fcnvt_ex2_opa_is_cnan         <= ex1_opa_is_cnan;
    fcnvt_ex2_opa_is_qnan         <= ex1_opa_is_qnan;
    fcnvt_ex2_opa_is_snan         <= ex1_opa_is_snan;
    fcnvt_ex2_rm[4:0]             <= ex1_rm[4:0];
    ex2_sign                      <= ex1_final_sign;
    ex2_narrow_denorm             <= ex1_narrow_denorm;
    ex2_itof_c_in[52:0]           <= ex1_itof_c_in[52:0];
    ex2_itof_tail_zero            <= ex1_itof_tail_zero;
    ex2_itof_tail_eq_0p5          <= ex1_itof_tail_eq_0p5;
    ex2_itof_tail_gt_0p5          <= ex1_itof_tail_gt_0p5;
    ex2_itof_neg                  <= ex1_src_neg_shf;
  end
end

//==========================================================
//EX2 Stage:
//  1. fraction round
//  2. of uf 
//  3. Int result and int round
//==========================================================
//special for itof negative input
assign ex2_itof_neg_frac[52:0]     =  ex2_frac[52:0] + ex2_itof_c_in[52:0];
assign ex2_itof_neg_frac_p1[52:0]  =  ex2_frac[52:0] + ex2_itof_c_in[52:0] 
                                                     + ex2_rnd_adder_f_src1[52:0];
assign ex2_itof_neg_round_add      =  (ex2_rm_rdn  && ex2_sign    && (!ex2_itof_tail_zero)) ||
                       (ex2_rm_rmm) && (ex2_itof_tail_gt_0p5 || ex2_itof_tail_eq_0p5)   ||
                       (ex2_rm_rne  && (ex2_itof_tail_gt_0p5 || (ex2_itof_tail_eq_0p5 && ex2_rnd_lst)));

assign ex2_frac_round_add          = ex2_itof_neg ?  ex2_itof_neg_round_add
                                                  : ex2_round_add;

//rounding 
//fraction rounding
assign ex2_tail[53:0]  = ex2_dest_float ? ex2_f_tail[53:0] : ex2_int_tail[53:0];
assign ex2_x_zero      = ~|ex2_tail[53:0];
assign ex2_x_eq_0p5    = ex2_tail[53] && (~|ex2_tail[52:0]);
assign ex2_x_gt_0p5    = ex2_tail[53] && (|ex2_tail[52:0]);
//Rounding mode select
assign ex2_rm_rne   = fcnvt_ex2_rm[0];
assign ex2_rm_rtz   = fcnvt_ex2_rm[1];
assign ex2_rm_rup   = fcnvt_ex2_rm[2];
assign ex2_rm_rdn   = fcnvt_ex2_rm[3];
assign ex2_rm_rmm   = fcnvt_ex2_rm[4];

assign ex2_int_lst   = ex2_int[0];
assign ex2_frac_lst  = ex2_dest_double ? ex2_frac[0] :
                       ex2_dest_single ? ex2_frac[29] : ex2_frac[42];
assign ex2_rnd_lst   = ex2_dest_float  ? ex2_frac_lst : ex2_int_lst;


assign ex2_round_add = (ex2_rm_rup  && !ex2_sign && (!ex2_x_zero))      ||
                       (ex2_rm_rdn  && ex2_sign    && (!ex2_x_zero)) ||
                       (ex2_rm_rmm) && (ex2_x_gt_0p5 || ex2_x_eq_0p5)   ||
                       (ex2_rm_rne  && (ex2_x_gt_0p5 || (ex2_x_eq_0p5 && ex2_rnd_lst)));

//round adder source operand
assign ex2_rnd_adder_f_src0[63:0] = {11'b0,ex2_frac[52:0]};

assign ex2_rnd_adder_f_src1[63:0] = ex2_dest_double ? 64'b1 :
                                    ex2_dest_single ? {10'b0,25'b1,29'b0} : {10'b0,12'b1,42'b0};

assign ex2_rnd_adder_i_src0[63:0] = ex2_dest_si && ex2_sign ? ~ex2_int[63:0]
                                                            : ex2_int[63:0];
//assign ex2_rnd_adder_i_src1[63:0] = {63'b0,(ex2_dest_si && ex2_sign) ^ ex2_round_add};
assign ex2_rnd_adder_i_src1[63:0] = 64'b1;
//assign ex2_rnd_adder_src0[63:0]   = ex2_dest_float ? ex2_rnd_adder_f_src0[63:0]
//                                                   : ex2_rnd_adder_i_src0[63:0];
//
//assign ex2_rnd_adder_src1[63:0]   = ex2_dest_float ? ex2_rnd_adder_f_src1[63:0]
//                                                   : ex2_rnd_adder_i_src1[63:0];
//here for timing, we seperate the float round and int round
assign ex2_rnd_adder_p1[63:0]     = ex2_rnd_adder_f_src0[63:0] + ex2_rnd_adder_f_src1[63:0];

assign ex2_int_rnd_adder_p1[63:0] = ex2_rnd_adder_i_src0[63:0] + ex2_rnd_adder_i_src1[63:0];

//expnt adder source operancd

// &CombBeg; @481
always @( ex2_dest_double
       or ex2_dest_single)
begin
  if (ex2_dest_double) begin
    ex2_eadder_bias[11:0]  = 12'd1023;
    ex2_eadder_bias1[11:0] = 12'd1024;
  end
  else if(ex2_dest_single) begin
    ex2_eadder_bias[11:0]  = 12'd127;
    ex2_eadder_bias1[11:0] = 12'd128;
  end
  else begin
    ex2_eadder_bias[11:0]  = 12'd15;
    ex2_eadder_bias1[11:0] = 12'd16;
  end
// &CombEnd; @494
end
assign ex2_expnt_bias_tmp[11:0]  = ex2_expnt[11:0] + ex2_eadder_bias[11:0];
assign ex2_expnt_bias_tmp1[11:0] = ex2_expnt[11:0] + ex2_eadder_bias1[11:0];

assign ex2_expnt_add1            = ex2_dest_double ? double_expnt_add :
                                   ex2_dest_single ? single_expnt_add : half_expnt_add;
assign ex2_norm_expnt[11:0]      = ex2_expnt_add1 ? ex2_expnt_bias_tmp1[11:0]
                                                  : ex2_expnt_bias_tmp[11:0];

//final normal fraction result
assign ex2_rnd_frac_adder_p1[52:0]  = ex2_itof_neg ? ex2_itof_neg_frac_p1[52:0] 
                                                   : ex2_rnd_adder_p1[52:0];
assign ex2_orig_frac[52:0]          = ex2_itof_neg ? ex2_itof_neg_frac[52:0]
                                                   : ex2_frac[52:0];

assign ex2_double_frac[51:0]      = ex2_frac_round_add ? ex2_rnd_frac_adder_p1[51:0]
                                                       : ex2_orig_frac[51:0];
assign ex2_single_frac[22:0]      = ex2_frac_round_add ? ex2_rnd_frac_adder_p1[51:29]
                                                       : ex2_orig_frac[51:29];
assign ex2_half_frac[9:0]         = ex2_frac_round_add ? ex2_rnd_frac_adder_p1[51:42]
                                                      : ex2_orig_frac[51:42]; 
//result denormal
assign ex2_single_denorm          = ex2_norm_expnt[11];
assign ex2_half_denorm            = ex2_norm_expnt[11];

//normal fraction result
assign ex2_double_norm_result[63:0]    = {ex2_sign,ex2_norm_expnt[10:0],ex2_double_frac[51:0]};
assign ex2_single_norm_result[63:0]    = ex2_single_denorm ? {32'hffffffff,ex2_sign,
                                                         8'b0,ex2_single_frac[22:0]} 
                                     :
                                     {32'hffffffff,ex2_sign,
                                     ex2_norm_expnt[7:0],ex2_single_frac[22:0]};
assign ex2_half_norm_result[63:0]      = ex2_half_denorm ? {48'hffffffffffff,ex2_sign,
                                     5'b0,ex2_half_frac[9:0]} :
                                     {48'hffffffffffff,ex2_sign,
                                     ex2_norm_expnt[4:0],ex2_half_frac[9:0]};
// normal integer result
assign ex2_int_result[63:0]       = ex2_sign ^ ex2_round_add ? ex2_int_rnd_adder_p1[63:0] 
                                                             : ex2_rnd_adder_i_src0[63:0];
assign ex2_uint_result[63:0]      = (ex2_round_add ? ex2_int_rnd_adder_p1[63:0]
                                                   : ex2_rnd_adder_i_src0[63:0])
                                    & {64{!ex2_sign}} ;

//exception  
// for the special result, we seperate out the special 
// value, such as the carry in for the expnt, and the 
// carry in cause the expnt of/uf
assign double_norm_float_low_frac_all1= &ex2_frac[51:0];
assign single_norm_float_low_frac_all1= &ex2_frac[51:29];
assign half_norm_float_low_frac_all1  = &ex2_frac[51:42];
assign double_neg_float_low_frac_all1 = &(ex2_frac[51:0]  |  ex2_itof_c_in[51:0]); 
assign single_neg_float_low_frac_all1 = &(ex2_frac[51:29]  | ex2_itof_c_in[51:29]);
assign half_neg_float_low_frac_all1   = &(ex2_frac[51:42] | ex2_itof_c_in[51:42]);
assign double_float_low_frac_all1     = ex2_itof_neg ? double_neg_float_low_frac_all1
                                                     : double_norm_float_low_frac_all1;
assign single_float_low_frac_all1     = ex2_itof_neg ? single_neg_float_low_frac_all1
                                                     : single_norm_float_low_frac_all1;
assign half_float_low_frac_all1       = ex2_itof_neg ? half_neg_float_low_frac_all1
                                                     : half_norm_float_low_frac_all1;
assign double_float_norm_frac_all1    = ex2_frac[52] && double_float_low_frac_all1;
assign single_float_norm_frac_all1    = ex2_frac[52] && single_float_low_frac_all1;
assign half_float_norm_frac_all1      = ex2_frac[52] && half_float_low_frac_all1;
assign single_norm_expnt_add          = single_float_norm_frac_all1 && ex2_frac_round_add;
assign half_norm_expnt_add            = half_float_norm_frac_all1 && ex2_frac_round_add;
assign double_expnt_add               = (ex2_narrow_denorm && double_float_low_frac_all1 
                                           || double_float_norm_frac_all1) && ex2_frac_round_add;
assign single_expnt_add               = (ex2_narrow_denorm && single_float_low_frac_all1 
                                           || single_float_norm_frac_all1) && ex2_frac_round_add;
assign half_expnt_add                 = (ex2_narrow_denorm && half_float_low_frac_all1 
                                           || half_float_norm_frac_all1) && ex2_frac_round_add;

assign float_dest_special         = fcnvt_ex2_opa_is_snan 
                                    || fcnvt_ex2_opa_is_qnan 
                                    || fcnvt_ex2_opa_is_cnan
                                    || fcnvt_ex2_opa_is_inf
                                    || fcnvt_ex2_opa_is_0;

assign ex2_single_expnt_of        = !ex2_expnt[11] && (ex2_expnt[11:0] >= 12'h080) ||
                                    !ex2_expnt[11] && (ex2_expnt[11:0] == 12'h07f) && single_norm_expnt_add;
assign ex2_half_expnt_of          = !ex2_expnt[11] && (ex2_expnt[11:0] >= 12'h010) ||
                                    !ex2_expnt[11] && (ex2_expnt[11:0] == 12'h0f ) && half_norm_expnt_add;




assign ex2_single_of              = ex2_single_expnt_of && !float_dest_special;
assign ex2_half_of                = ex2_half_expnt_of && !float_dest_special;

                                                    
                                                    
assign ex2_of                     = ex2_dest_single &&   ex2_single_of ||
                                    ex2_dest_half   &&   ex2_half_of ;

assign ex2_single_expnt_uf        = ex2_narrow_denorm && !(single_float_low_frac_all1 && ex2_frac_round_add);
assign ex2_half_expnt_uf          = ex2_narrow_denorm && !(half_float_low_frac_all1 && ex2_frac_round_add);
                                    

assign ex2_single_uf              = ex2_single_expnt_uf && !float_dest_special && ex2_dest_single && ex2_ix && !ex2_nv;
assign ex2_half_uf                = ex2_half_expnt_uf && !float_dest_special && ex2_dest_half && ex2_ix && !ex2_nv;

assign ex2_uf                     = ex2_dest_float && (ex2_single_uf || ex2_half_uf);
assign ex2_float_x_zero           = ex2_itof_neg ? ex2_itof_tail_zero : ex2_x_zero;
assign ex2_ix                     = !ex2_float_x_zero && !float_dest_special;
assign ex2_f_nv                   = ex2_src_float && (fcnvt_ex2_opa_is_snan || fcnvt_ex2_opa_is_qnan && !ex2_dest_float);
//                                                      || fcnvt_ex2_opa_is_qnan);

assign ex2_tosi64_pos_exp_of      = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd62) || fcnvt_ex2_opa_is_inf;
assign ex2_tosi64_neg_exp_of      = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd63) || fcnvt_ex2_opa_is_inf;
assign ex2_tosi64_neg_crit_exp_of = !ex2_expnt[11] && (ex2_expnt[10:0] == 11'd63);
assign ex2_tosi64_of              = !ex2_sign && ex2_tosi64_pos_exp_of && ex2_dest_l64 && ex2_dest_si;
assign ex2_tosi64_uf              = ex2_sign && (ex2_tosi64_neg_exp_of || 
                                                ex2_tosi64_neg_crit_exp_of && !ex2_int_result[63]) 
                                             && ex2_dest_l64 && ex2_dest_si;


assign ex2_toui64_of              = !ex2_sign && (!ex2_expnt[11] && (ex2_expnt[10:0] > 11'd63) 
                                                  || fcnvt_ex2_opa_is_inf)
                                    && ex2_dest_l64 && !ex2_dest_si;
assign ex2_toui64_uf              = ex2_sign && (!ex2_expnt[11] || ex2_round_add) 
                                    && ex2_dest_l64 && !ex2_dest_si;


assign ex2_tosi32_pos_exp_of          = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd30) || fcnvt_ex2_opa_is_inf; 
assign ex2_tosi32_pos_exp_crit_of     =  ex2_expnt[11:0] == 12'd30;

assign ex2_tosi32_neg_exp_of          = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd31) || fcnvt_ex2_opa_is_inf; 
assign ex2_tosi32_neg_exp_crit_of     =  ex2_expnt[11:0] == 12'd31;

assign ex2_tosi32_of              =  ex2_dest_l32 && ex2_dest_si 
                                     && !ex2_sign && ((ex2_int_result[31] && ex2_tosi32_pos_exp_crit_of) 
                                                       || ex2_tosi32_pos_exp_of);
assign ex2_tosi32_uf              = ex2_dest_l32 && ex2_dest_si 
                                     && ex2_sign && ((!ex2_int_result[31]&& ex2_tosi32_neg_exp_crit_of) 
                                                  || ex2_tosi32_neg_exp_of);

assign ex2_toui32_exp_of          = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd31) || fcnvt_ex2_opa_is_inf; 
assign ex2_toui32_exp_crit_of     = ex2_expnt[11:0] == 12'd31;
assign ex2_toui32_of              = ex2_dest_l32 && !ex2_dest_si 
                                    && !ex2_sign && (ex2_int_result[32] && ex2_toui32_exp_crit_of
                                                      || ex2_toui32_exp_of);
assign ex2_toui32_uf              = ex2_dest_l32 && !ex2_dest_si 
                                    && ex2_sign && (!ex2_expnt[11] || ex2_round_add); 

assign ex2_tosi16_pos_exp_of      = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd14) || fcnvt_ex2_opa_is_inf; 
assign ex2_tosi16_pos_exp_crit_of =  ex2_expnt[11:0] == 12'd14;
assign ex2_tosi16_neg_exp_of      = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd15) || fcnvt_ex2_opa_is_inf; 
assign ex2_tosi16_neg_exp_crit_of =  ex2_expnt[11:0] == 12'd15;

assign ex2_tosi16_of              = ex2_dest_l16 && ex2_dest_si 
                                    && !ex2_sign && (ex2_int_result[15] && ex2_tosi16_pos_exp_crit_of 
                                                 || ex2_tosi16_pos_exp_of);
assign ex2_tosi16_uf              = ex2_dest_l16 && ex2_dest_si 
                                    && ex2_sign && (!ex2_int_result[15] && ex2_tosi16_neg_exp_crit_of 
                                                 || ex2_tosi16_neg_exp_of);

assign ex2_toui16_exp_of          = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd15) || fcnvt_ex2_opa_is_inf; 
assign ex2_toui16_exp_crit_of     = ex2_expnt[11:0] == 12'd15;

assign ex2_toui16_of              = ex2_dest_l16 && !ex2_dest_si 
                                    && !ex2_sign && (ex2_int_result[16] && ex2_toui16_exp_crit_of 
                                                 || ex2_toui16_exp_of);
assign ex2_toui16_uf              = ex2_dest_l16 && !ex2_dest_si 
                                    && ex2_sign && (!ex2_expnt[11] || ex2_round_add); 

assign ex2_tosi8_pos_exp_of          = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd6) || fcnvt_ex2_opa_is_inf; 
assign ex2_tosi8_pos_exp_crit_of     = ex2_expnt[11:0] == 12'd6;
assign ex2_tosi8_neg_exp_of          = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd7) || fcnvt_ex2_opa_is_inf; 
assign ex2_tosi8_neg_exp_crit_of     = ex2_expnt[11:0] == 12'd7;

assign ex2_tosi8_of              = ex2_dest_l8 && ex2_dest_si 
                                    && !ex2_sign && (ex2_int_result[7] && ex2_tosi8_pos_exp_crit_of 
                                                 || ex2_tosi8_pos_exp_of);
assign ex2_tosi8_uf              = ex2_dest_l8 && ex2_dest_si 
                                    && ex2_sign && (!ex2_int_result[7] && ex2_tosi8_neg_exp_crit_of 
                                                 || ex2_tosi8_neg_exp_of);

assign ex2_toui8_exp_of          = !ex2_expnt[11] && (ex2_expnt[10:0] > 11'd7)|| fcnvt_ex2_opa_is_inf; 
assign ex2_toui8_exp_crit_of     = ex2_expnt[11:0] == 12'd7;
assign ex2_toui8_of              = ex2_dest_l8 && !ex2_dest_si 
                                    && !ex2_sign && (ex2_int_result[8] && ex2_toui8_exp_crit_of 
                                                 || ex2_toui8_exp_of);
assign ex2_toui8_uf              = ex2_dest_l8 && !ex2_dest_si 
                                    && ex2_sign && (!ex2_expnt[11] || ex2_round_add); 

assign ex2_int_nv                = ex2_tosi64_of || ex2_tosi64_uf 
                                   || ex2_toui64_of || ex2_toui64_uf
                                   || ex2_tosi32_of || ex2_tosi32_uf
                                   || ex2_toui32_of || ex2_toui32_uf
                                   || ex2_tosi16_of || ex2_tosi16_uf
                                   || ex2_toui16_of || ex2_toui16_uf
                                   || ex2_tosi8_of || ex2_tosi8_uf
                                   || ex2_toui8_of || ex2_toui8_uf;
assign ex2_nv                    = !ex2_dest_float && ex2_int_nv || ex2_f_nv;

assign ex2_final_ix              = !ex2_nv & (ex2_ix||ex2_of);
assign ex2_expt[3:0]             = {ex2_nv, 
                                    ex2_of, 
                                    ex2_uf, 
                                    ex2_final_ix};

//float result 
assign ex2_single_result_lfn      = ex2_single_of && (ex2_rm_rtz ||
                                                      ex2_rm_rup && ex2_sign ||
                                                      ex2_rm_rdn && !ex2_sign);
assign ex2_single_nor_inf         = ex2_single_of && !(ex2_rm_rtz ||
                                                      ex2_rm_rup && ex2_sign ||
                                                      ex2_rm_rdn && !ex2_sign); 
assign ex2_single_result_inf      = ex2_dest_single && (fcnvt_ex2_opa_is_inf || ex2_single_nor_inf);
assign ex2_half_result_lfn        = ex2_half_of && (ex2_rm_rtz ||
                                                      ex2_rm_rup && ex2_sign ||
                                                      ex2_rm_rdn && !ex2_sign);
assign ex2_half_nor_inf           = ex2_half_of && !(ex2_rm_rtz ||
                                                      ex2_rm_rup && ex2_sign ||
                                                      ex2_rm_rdn && !ex2_sign);


assign ex2_half_result_inf        = !ex2_dest_double && !ex2_dest_single 
                                     && (fcnvt_ex2_opa_is_inf || ex2_half_nor_inf);
assign ex2_double_result_inf      = ex2_dest_double && fcnvt_ex2_opa_is_inf;
assign ex2_r_is_qnan_a_src2       = fcnvt_ex2_opa_is_snan || fcnvt_ex2_opa_is_qnan || ex2_r_sel_src2; 
assign ex2_r_is_qnan              = fcnvt_ex2_opa_is_snan || fcnvt_ex2_opa_is_qnan;
assign dqnan_out_sel              = vfpu_yy_xx_dqnan && 
                                    (fcnvt_ex2_opa_is_snan 
                                      || fcnvt_ex2_opa_is_qnan && !fcnvt_ex2_opa_is_cnan);
assign dqnan_prop_snan            = fcnvt_ex2_opa_is_snan && ex2_fcnvt_split_inst;                                    
assign ex2_double_qnan_f[51:0]    = dqnan_out_sel ? {!dqnan_prop_snan,ex2_frac[50:0]}
                                                  : {1'b1,51'b0};
assign ex2_single_qnan_f[22:0]    = dqnan_out_sel ? {!dqnan_prop_snan,ex2_frac[50:29]}
                                                  : {1'b1,22'b0};
assign ex2_half_qnan_f[9:0]       = dqnan_out_sel ? {1'b1,ex2_frac[50:42]}
                                                  : {1'b1,9'b0};  
assign ex2_frac_result_sign       = ex2_r_is_qnan_a_src2 && !vfpu_yy_xx_dqnan || fcnvt_ex2_opa_is_cnan ? 1'b0 : ex2_sign;
assign ex2_r_sel_src2                 = 1'b0;
assign ex2_qnan_a_src2_d_result[63:0] = {ex2_frac_result_sign,11'h7ff,
                                                          ex2_double_qnan_f[51:0]};
assign ex2_qnan_a_src2_s_result[63:0] = {32'hffffffff,ex2_frac_result_sign,8'hff,
                                                          ex2_single_qnan_f[22:0]};    
assign ex2_qnan_a_src2_h_result[63:0] = {48'hffffffffffff,ex2_frac_result_sign,5'h1f,
                                                          ex2_half_qnan_f[9:0]};
assign ex2_fcnvt_split_inst           = 1'b0;
assign ex2_double_result[63:0]    = ex2_r_is_qnan_a_src2 ? 
                                    ex2_qnan_a_src2_d_result[63:0]
                                     : 
                                    ex2_double_result_inf && !ex2_r_sel_src2 ?
                                    {ex2_sign,11'h7ff,52'b0}
                                    : fcnvt_ex2_opa_is_0 && !ex2_r_sel_src2 ? {ex2_sign,63'b0} :
                                    ex2_double_norm_result[63:0];

// &CombBeg; @754
always @( ex2_single_result_inf
       or ex2_qnan_a_src2_s_result[63:0]
       or ex2_r_sel_src2
       or ex2_r_is_qnan_a_src2
       or fcnvt_ex2_opa_is_0
       or ex2_sign
       or ex2_single_norm_result[63:0]
       or ex2_single_result_lfn)
begin
case({ex2_single_result_inf && !ex2_r_sel_src2,ex2_single_result_lfn && !ex2_r_sel_src2,ex2_r_is_qnan_a_src2,fcnvt_ex2_opa_is_0 && !ex2_r_sel_src2})
  4'b1000:ex2_single_result[63:0]    = {32'hffffffff,ex2_sign,8'hff,23'b0};
  4'b0100:ex2_single_result[63:0]    = {32'hffffffff,ex2_sign,8'hfe,{23{1'b1}}};
  4'b0010:ex2_single_result[63:0]    = ex2_qnan_a_src2_s_result[63:0];
  4'b0001:ex2_single_result[63:0]    = {32'hffffffff,  ex2_sign,31'b0};                               
  default:ex2_single_result[63:0]   = ex2_single_norm_result[63:0];
endcase                              
// &CombEnd; @762
end
// &CombBeg; @763
always @( ex2_qnan_a_src2_h_result[63:0]
       or ex2_half_result_inf
       or ex2_r_sel_src2
       or ex2_r_is_qnan_a_src2
       or fcnvt_ex2_opa_is_0
       or ex2_sign
       or ex2_half_result_lfn
       or ex2_half_norm_result[63:0])
begin
case({ex2_half_result_inf && !ex2_r_sel_src2,ex2_half_result_lfn && !ex2_r_sel_src2,ex2_r_is_qnan_a_src2,fcnvt_ex2_opa_is_0 && !ex2_r_sel_src2})
  4'b1000:ex2_half_result[63:0]    = {48'hffffffffffff,ex2_sign,5'h1f,10'b0};
  4'b0100:ex2_half_result[63:0]    = {48'hffffffffffff,ex2_sign,5'h1e,{10{1'b1}}};
  4'b0010:ex2_half_result[63:0]    = ex2_qnan_a_src2_h_result[63:0];
  4'b0001:  ex2_half_result[63:0]  = {48'hffffffffffff,  ex2_sign,15'b0};
  default:ex2_half_result[63:0]    = ex2_half_norm_result[63:0];
endcase                              
// &CombEnd; @771
end
assign ex2_float_result[63:0]     = ex2_dest_double ? ex2_double_result[63:0] :
                                    ex2_dest_single ? ex2_single_result[63:0]
                                                    : ex2_half_result[63:0];
//int result
assign int_dest_max_si64          = ex2_dest_si && (ex2_tosi64_of || ex2_r_is_qnan);
assign int_dest_min_si64          = ex2_dest_si && ex2_tosi64_uf;
assign int_s64_result[63:0]       = int_dest_max_si64 ? {1'b0,{63{1'b1}}} :
                                    int_dest_min_si64 ? {1'b1,63'b0} 
                                                      : ex2_int_result[63:0];
                                    
assign int_dest_max_ui64          = !ex2_dest_si && (ex2_toui64_of || ex2_r_is_qnan);
assign ex2_u64_result[63:0]       = int_dest_max_ui64 ? {64{1'b1}} :
                                    ex2_toui64_uf     ? {64{1'b0}}
                                                      : ex2_uint_result[63:0];
assign ex2_int_l64_result[63:0]   = ex2_dest_si ? int_s64_result[63:0]
                                                : ex2_u64_result[63:0];
assign int_dest_max_si32          = ex2_dest_si && (ex2_tosi32_of || ex2_r_is_qnan);
assign int_dest_min_si32          = ex2_dest_si && ex2_tosi32_uf;

assign int_s32_result[31:0]       = int_dest_max_si32 ? {1'b0,{31{1'b1}}} :
                                    int_dest_min_si32 ? {1'b1,31'b0} 
                                                      : ex2_int_result[31:0];
                                    
assign int_dest_max_ui32          = !ex2_dest_si && (ex2_toui32_of || ex2_r_is_qnan);
assign ex2_u32_result[31:0]       = int_dest_max_ui32 ? {32{1'b1}} :
                                    ex2_toui32_uf     ? {32{1'b0}}
                                                      : ex2_uint_result[31:0];
assign ex2_int_l32_result[63:0]   = ex2_dest_si ? {32'b0,int_s32_result[31:0]}
                                                : {32'b0,ex2_u32_result[31:0]};
assign int_dest_max_si16          = ex2_dest_si && (ex2_tosi16_of || ex2_r_is_qnan);
assign int_dest_min_si16          = ex2_dest_si && ex2_tosi16_uf;
assign int_dest_max_ui16          = !ex2_dest_si && (ex2_toui16_of || ex2_r_is_qnan);
assign int_s16_result[15:0]       = int_dest_max_si16 ? {1'b0,{15{1'b1}}} :
                                    int_dest_min_si16 ? {1'b1,15'b0} 
                                                      : ex2_int_result[15:0];
assign ex2_int_l16_result[63:0]   = ex2_dest_si ? {48'b0,int_s16_result[15:0]}
                                                : {48'b0,ex2_u16_result[15:0]};
                                    
assign ex2_u16_result[15:0]       = int_dest_max_ui16 ? {16{1'b1}} :
                                    ex2_toui16_uf     ? {16{1'b0}}
                                                      : ex2_uint_result[15:0];
assign int_dest_max_si8           =  ex2_dest_si && (ex2_tosi8_of || ex2_r_is_qnan);
assign int_dest_min_si8           =  ex2_dest_si && ex2_tosi8_uf;
assign int_s8_result[7:0]         = int_dest_max_si8 ? {1'b0,{7{1'b1}}} :
                                    int_dest_min_si8 ? {1'b1,7'b0} 
                                                      : ex2_int_result[7:0];
assign ex2_int_l8_result[63:0]    = ex2_dest_si ? {56'b0,int_s8_result[7:0]}
                                                : {56'b0,ex2_u8_result[7:0]};
                                    
assign int_dest_max_ui8          = !ex2_dest_si && (ex2_toui8_of || ex2_r_is_qnan);
assign ex2_u8_result[7:0]        = int_dest_max_ui8 ? {8{1'b1}} :
                                   ex2_toui8_uf     ? {8{1'b0}}
                                                      : ex2_uint_result[7:0];
assign ex2_dest_int_result[63:0] = ex2_dest_l64 ? ex2_int_l64_result[63:0] :
                                   ex2_dest_l32 ? ex2_int_l32_result[63:0] :
                                   ex2_dest_l8 ? ex2_int_l8_result[63:0] 
                                               : ex2_int_l16_result[63:0];
assign ex2_dest_sel_float        = ex2_dest_float || ex2_r_sel_src2;
assign ex2_total_result[63:0]    = ex2_dest_sel_float ? ex2_float_result[63:0]
                                                      : ex2_dest_int_result[63:0];
                                          
//=======================Pipe to EX3========================
//gate clk
// &Instance("gated_clk_cell","x_ex2_pipe_clk"); @835
gated_clk_cell  x_ex2_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @836
//           .clk_out        (ex2_pipe_clk),//Out Clock @837
//           .external_en    (1'b0), @838
//           .global_en      (cp0_yy_clk_en), @839
//           .local_en       (ex2_pipe_clk_en),//Local Condition @840
//           .module_en      (cp0_vfpu_icg_en) @841
//         ); @842
assign ex2_pipe_clk_en = ex2_pipedown;

always @(posedge ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex3_expt[3:0]                <= 4'b0;
    ex3_result[63:0]             <= 64'b0;
  end
  else if(ex2_pipedown)
  begin
    ex3_expt[3:0]                <= ex2_expt[3:0];
    ex3_result[63:0]             <= ex2_total_result[63:0];
  end 
end
assign fcnvt_ex3_result[63:0]          = ex3_result[63:0];
assign fcnvt_ex3_expt[4:0]             = {ex3_expt[3], 1'b0, ex3_expt[2:0]}; 

// &ModuleEnd; @861
endmodule


