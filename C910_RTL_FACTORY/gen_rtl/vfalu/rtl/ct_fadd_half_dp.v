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
module ct_fadd_half_dp(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ex1_cmp_result,
  ex1_op_add,
  ex1_op_cmp,
  ex1_op_feq,
  ex1_op_fle,
  ex1_op_flt,
  ex1_op_fne,
  ex1_op_ford,
  ex1_op_maxnm,
  ex1_op_minnm,
  ex1_op_sub,
  ex1_pipedown,
  ex1_scalar,
  ex2_op_add,
  ex2_op_cmp,
  ex2_op_fle,
  ex2_op_flt,
  ex2_op_maxnm,
  ex2_op_minnm,
  ex2_op_sub,
  ex2_pipedown,
  ex2_rm_rdn,
  ex2_rm_rmm,
  ex2_rm_rne,
  ex2_rm_rtz,
  ex2_rm_rup,
  ex3_expt,
  ex3_result,
  fadd_ctrl_src0,
  fadd_ctrl_src1,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  vfpu_yy_xx_dqnan
);

// &Ports; @23
input           cp0_vfpu_icg_en;                    
input           cp0_yy_clk_en;                      
input           cpurst_b;                           
input           ex1_op_add;                         
input           ex1_op_cmp;                         
input           ex1_op_feq;                         
input           ex1_op_fle;                         
input           ex1_op_flt;                         
input           ex1_op_fne;                         
input           ex1_op_ford;                        
input           ex1_op_maxnm;                       
input           ex1_op_minnm;                       
input           ex1_op_sub;                         
input           ex1_pipedown;                       
input           ex1_scalar;                         
input           ex2_op_add;                         
input           ex2_op_cmp;                         
input           ex2_op_fle;                         
input           ex2_op_flt;                         
input           ex2_op_maxnm;                       
input           ex2_op_minnm;                       
input           ex2_op_sub;                         
input           ex2_pipedown;                       
input           ex2_rm_rdn;                         
input           ex2_rm_rmm;                         
input           ex2_rm_rne;                         
input           ex2_rm_rtz;                         
input           ex2_rm_rup;                         
input   [63:0]  fadd_ctrl_src0;                     
input   [63:0]  fadd_ctrl_src1;                     
input           forever_cpuclk;                     
input           pad_yy_icg_scan_en;                 
input           vfpu_yy_xx_dqnan;                   
output          ex1_cmp_result;                     
output  [4 :0]  ex3_expt;                           
output  [15:0]  ex3_result;                         

// &Regs; @24
reg     [10:0]  ex1_f1_v_nm;                        
reg     [11:0]  ex1_f1_x_nm;                        
reg     [4 :0]  ex1_src0_e;                         
reg     [10:0]  ex1_src0_f;                         
reg     [10:0]  ex1_src0_f_4ex2;                    
reg             ex1_src0_is_0;                      
reg             ex1_src0_is_cnan;                   
reg             ex1_src0_is_dn;                     
reg             ex1_src0_is_inf;                    
reg             ex1_src0_is_lfn;                    
reg             ex1_src0_is_nm;                     
reg             ex1_src0_is_qnan;                   
reg             ex1_src0_is_snan;                   
reg             ex1_src0_is_snm;                    
reg             ex1_src0_s;                         
reg     [4 :0]  ex1_src1_e;                         
reg     [10:0]  ex1_src1_f;                         
reg     [10:0]  ex1_src1_f_4ex2;                    
reg             ex1_src1_is_0;                      
reg             ex1_src1_is_cnan;                   
reg             ex1_src1_is_dn;                     
reg             ex1_src1_is_inf;                    
reg             ex1_src1_is_lfn;                    
reg             ex1_src1_is_nm;                     
reg             ex1_src1_is_qnan;                   
reg             ex1_src1_is_snan;                   
reg             ex1_src1_is_snm;                    
reg             ex1_src1_s;                         
reg     [4 :0]  ex2_bypass_e;                       
reg     [9 :0]  ex2_bypass_f;                       
reg     [10:0]  ex2_close_dn_shift;                 
reg     [15:0]  ex2_max_nm_result;                  
reg     [15:0]  ex2_min_nm_result;                  
reg     [15:0]  ex2_nor_result;                     
reg     [9 :0]  ex2_qnan_f;                         
reg             ex2_qnan_s;                         
reg     [15:0]  ex2_spe_result;                     
reg     [15:0]  ex3_result;                         
reg             fadd_ex2_act_add;                   
reg             fadd_ex2_act_s;                     
reg             fadd_ex2_act_sub;                   
reg             fadd_ex2_bypass_sel;                
reg             fadd_ex2_close_ed1;                 
reg     [5 :0]  fadd_ex2_close_ff1;                 
reg     [11:0]  fadd_ex2_close_ff1_onehot;          
reg             fadd_ex2_close_sel;                 
reg             fadd_ex2_close_shift;               
reg             fadd_ex2_close_sign;                
reg     [11:0]  fadd_ex2_close_sum;                 
reg     [11:0]  fadd_ex2_close_sum_m1;              
reg             fadd_ex2_cmp_result;                
reg     [11:0]  fadd_ex2_f1_x_far;                  
reg     [12:0]  fadd_ex2_far_adder0;                
reg     [12:0]  fadd_ex2_far_adder1;                
reg     [4 :0]  fadd_ex2_src0_e;                    
reg     [10:0]  fadd_ex2_src0_f;                    
reg     [8 :0]  fadd_ex2_src0_is;                   
reg             fadd_ex2_src0_s;                    
reg     [4 :0]  fadd_ex2_src1_e;                    
reg     [10:0]  fadd_ex2_src1_f;                    
reg     [8 :0]  fadd_ex2_src1_is;                   
reg             fadd_ex2_src1_s;                    
reg             fadd_ex2_src_both_denorm;           
reg             fadd_ex2_src_change;                
reg     [4 :0]  fadd_ex3_expt;                      
reg     [15:0]  fadd_ex3_nor_result_l;              
reg             fadd_ex3_r_nor;                     
reg             fadd_ex3_r_spe;                     
reg     [15:0]  fadd_ex3_spe_result_l;              

// &Wires; @25
wire            cp0_vfpu_icg_en;                    
wire            cp0_yy_clk_en;                      
wire            cpurst_b;                           
wire    [5 :0]  e_adder0_src0;                      
wire    [5 :0]  e_adder0_src1;                      
wire    [5 :0]  e_adder0_sum;                       
wire    [5 :0]  e_adder1_src0;                      
wire    [5 :0]  e_adder1_src1;                      
wire    [5 :0]  e_adder1_sum;                       
wire    [4 :0]  ea;                                 
wire            ea_gt_0;                            
wire            ea_is_0;                            
wire            ea_is_1;                            
wire            ea_is_lfn;                          
wire            ea_is_nan_inf;                      
wire            ea_is_norm;                         
wire            ea_lt_nan_inf;                      
wire    [4 :0]  eb;                                 
wire            eb_gt_0;                            
wire            eb_is_0;                            
wire            eb_is_1;                            
wire            eb_is_lfn;                          
wire            eb_is_nan_inf;                      
wire            eb_is_norm;                         
wire            eb_lt_nan_inf;                      
wire            ex1_act_add;                        
wire            ex1_act_s;                          
wire            ex1_act_sub;                        
wire            ex1_bypass_sel;                     
wire    [10:0]  ex1_close_adder0_s0;                
wire    [11:0]  ex1_close_adder0_s1_a;              
wire    [11:0]  ex1_close_adder0_s1_b;              
wire    [10:0]  ex1_close_adder1_s0;                
wire    [11:0]  ex1_close_adder1_s1_a;              
wire    [11:0]  ex1_close_adder1_s1_b;              
wire            ex1_close_ed1;                      
wire            ex1_close_f_eq;                     
wire    [5 :0]  ex1_close_ff1;                      
wire    [11:0]  ex1_close_ff1_onehot;               
wire    [10:0]  ex1_close_ff1_onehot_s0;            
wire    [11:0]  ex1_close_ff1_onehot_s1;            
wire    [11:0]  ex1_close_ff1_onehot_s1_a;          
wire    [11:0]  ex1_close_ff1_onehot_s1_b;          
wire    [3 :0]  ex1_close_ff1_s0;                   
wire    [3 :0]  ex1_close_ff1_s1;                   
wire    [5 :0]  ex1_close_ff1_s1_a;                 
wire    [5 :0]  ex1_close_ff1_s1_b;                 
wire            ex1_close_op_chg_s0;                
wire            ex1_close_op_chg_s1_a;              
wire            ex1_close_op_chg_s1_b;              
wire            ex1_close_sel;                      
wire            ex1_close_shift;                    
wire            ex1_close_sign;                     
wire    [11:0]  ex1_close_sum;                      
wire    [11:0]  ex1_close_sum_m1;                   
wire    [11:0]  ex1_close_sum_m1_s1;                
wire    [11:0]  ex1_close_sum_m1_s1_a;              
wire    [11:0]  ex1_close_sum_m1_s1_b;              
wire    [10:0]  ex1_close_sum_s0;                   
wire    [11:0]  ex1_close_sum_s1;                   
wire    [11:0]  ex1_close_sum_s1_a;                 
wire    [11:0]  ex1_close_sum_s1_b;                 
wire            ex1_cmp_feq;                        
wire            ex1_cmp_fle;                        
wire            ex1_cmp_flt;                        
wire            ex1_cmp_fne;                        
wire            ex1_cmp_ford;                       
wire            ex1_cmp_nv;                         
wire            ex1_cmp_result;                     
wire            ex1_cmp_sel;                        
wire            ex1_cmp_sub;                        
wire            ex1_e_eq;                           
wire    [4 :0]  ex1_ed;                             
wire            ex1_ed_gt_25s_54d;                  
wire            ex1_ed_gt_26s_55d;                  
wire            ex1_ed_is_0;                        
wire            ex1_ed_is_1;                        
wire            ex1_ed_lt_2;                        
wire            ex1_es;                             
wire    [10:0]  ex1_f1_v_far;                       
wire    [11:0]  ex1_f1_x_far;                       
wire            ex1_f_eq;                           
wire    [12:0]  ex1_far_adder0;                     
wire    [12:0]  ex1_far_adder1;                     
wire            ex1_op_add;                         
wire            ex1_op_cmp;                         
wire            ex1_op_feq;                         
wire            ex1_op_fle;                         
wire            ex1_op_flt;                         
wire            ex1_op_fne;                         
wire            ex1_op_ford;                        
wire            ex1_op_maxnm;                       
wire            ex1_op_minnm;                       
wire            ex1_op_sub;                         
wire            ex1_pipe_clk;                       
wire            ex1_pipe_clk_en;                    
wire            ex1_pipedown;                       
wire            ex1_scalar;                         
wire            ex1_sign;                           
wire            ex1_src0_eq_0;                      
wire            ex1_src0_eq_src1;                   
wire    [8 :0]  ex1_src0_is;                        
wire            ex1_src1_eq_0;                      
wire    [8 :0]  ex1_src1_is;                        
wire            ex1_src_both_denorm;                
wire            ex2_act_add;                        
wire            ex2_act_s;                          
wire            ex2_act_sub;                        
wire            ex2_bypass_dec1;                    
wire    [10:0]  ex2_bypass_f_dec1;                  
wire    [10:0]  ex2_bypass_f_inc1;                  
wire            ex2_bypass_inc1;                    
wire            ex2_bypass_nx;                      
wire            ex2_bypass_of;                      
wire            ex2_bypass_r_is_inf;                
wire            ex2_bypass_r_is_lfn;                
wire            ex2_bypass_sel;                     
wire            ex2_bypass_sign;                    
wire            ex2_close_dec1;                     
wire            ex2_close_dec1_rdn;                 
wire            ex2_close_dec1_rmm;                 
wire            ex2_close_dec1_rne;                 
wire            ex2_close_dec1_rtz;                 
wire            ex2_close_dec1_rup;                 
wire    [5 :0]  ex2_close_dn_diff;                  
wire    [4 :0]  ex2_close_dn_e;                     
wire            ex2_close_dn_sel;                   
wire    [11:0]  ex2_close_dn_shift_pre;             
wire    [5 :0]  ex2_close_e;                        
wire    [5 :0]  ex2_close_e_2;                      
wire    [5 :0]  ex2_close_e_3;                      
wire    [5 :0]  ex2_close_e_4;                      
wire    [9 :0]  ex2_close_f;                        
wire    [11:0]  ex2_close_f_2_p0;                   
wire            ex2_close_f_eq;                     
wire    [5 :0]  ex2_close_ff1_e_adder0_2;           
wire    [5 :0]  ex2_close_ff1_e_adder0_3;           
wire    [5 :0]  ex2_close_ff1_e_adder0_4;           
wire    [5 :0]  ex2_close_ff1_e_adder1;             
wire    [11:0]  ex2_close_ff1_onehot;               
wire    [11:0]  ex2_close_ff1_onehot_2;             
wire            ex2_close_inc0;                     
wire            ex2_close_inc0_rdn;                 
wire            ex2_close_inc0_rmm;                 
wire            ex2_close_inc0_rne;                 
wire            ex2_close_inc0_rtz;                 
wire            ex2_close_inc0_rup;                 
wire            ex2_close_l;                        
wire    [9 :0]  ex2_close_m1_f;                     
wire            ex2_close_nx;                       
wire            ex2_close_r_is_0;                   
wire            ex2_close_sel;                      
wire    [10:0]  ex2_close_sft_f;                    
wire            ex2_close_sign;                     
wire    [11:0]  ex2_close_sum;                      
wire            ex2_close_sum_b0;                   
wire    [11:0]  ex2_close_sum_m1;                   
wire            ex2_cmp_result;                     
wire    [4 :0]  ex2_expt;                           
wire            ex2_expt_nv;                        
wire            ex2_expt_nx;                        
wire            ex2_expt_of;                        
wire    [4 :0]  ex2_expt_pre;                       
wire    [11:0]  ex2_f1_x_far;                       
wire            ex2_far_add_rd1_inc0;               
wire            ex2_far_add_rd1_inc0_rdn;           
wire            ex2_far_add_rd1_inc0_rmm;           
wire            ex2_far_add_rd1_inc0_rne;           
wire    [11:0]  ex2_far_add_rd1_inc0_rslt;          
wire            ex2_far_add_rd1_inc0_rtz;           
wire            ex2_far_add_rd1_inc0_rup;           
wire            ex2_far_add_rd1_inc1;               
wire            ex2_far_add_rd1_inc1_rdn;           
wire            ex2_far_add_rd1_inc1_rmm;           
wire            ex2_far_add_rd1_inc1_rne;           
wire    [11:0]  ex2_far_add_rd1_inc1_rslt;          
wire            ex2_far_add_rd1_inc1_rtz;           
wire            ex2_far_add_rd1_inc1_rup;           
wire    [11:0]  ex2_far_add_rd1_result;             
wire            ex2_far_add_rd2_inc0;               
wire            ex2_far_add_rd2_inc0_rdn;           
wire            ex2_far_add_rd2_inc0_rmm;           
wire            ex2_far_add_rd2_inc0_rne;           
wire    [11:0]  ex2_far_add_rd2_inc0_rslt;          
wire            ex2_far_add_rd2_inc0_rtz;           
wire            ex2_far_add_rd2_inc0_rup;           
wire            ex2_far_add_rd2_inc1;               
wire            ex2_far_add_rd2_inc1_rdn;           
wire            ex2_far_add_rd2_inc1_rmm;           
wire            ex2_far_add_rd2_inc1_rne;           
wire    [11:0]  ex2_far_add_rd2_inc1_rslt;          
wire            ex2_far_add_rd2_inc1_rtz;           
wire            ex2_far_add_rd2_inc1_rup;           
wire    [11:0]  ex2_far_add_rd2_result;             
wire    [11:0]  ex2_far_add_sum;                    
wire    [11:0]  ex2_far_add_sum_add2;               
wire    [12:0]  ex2_far_adder0;                     
wire    [12:0]  ex2_far_adder1;                     
wire    [4 :0]  ex2_far_e_val_m;                    
wire    [4 :0]  ex2_far_e_val_p;                    
wire    [4 :0]  ex2_far_e_val_s;                    
wire    [4 :0]  ex2_far_half_add_expnt;             
wire    [11:0]  ex2_far_half_add_result;            
wire    [4 :0]  ex2_far_half_expnt;                 
wire    [10:0]  ex2_far_half_result;                
wire    [11:0]  ex2_far_half_result_t;              
wire    [4 :0]  ex2_far_half_sub_expnt;             
wire    [11:0]  ex2_far_half_sub_result;            
wire            ex2_far_lfn_sel;                    
wire            ex2_far_nor_nx;                     
wire            ex2_far_nx;                         
wire            ex2_far_of;                         
wire            ex2_far_r_is_inf;                   
wire            ex2_far_r_is_lfn;                   
wire            ex2_far_sel;                        
wire            ex2_far_sign;                       
wire            ex2_far_sub_rd1_dec1;               
wire            ex2_far_sub_rd1_dec1_rdn;           
wire            ex2_far_sub_rd1_dec1_rmm;           
wire            ex2_far_sub_rd1_dec1_rne;           
wire    [11:0]  ex2_far_sub_rd1_dec1_rslt;          
wire            ex2_far_sub_rd1_dec1_rtz;           
wire            ex2_far_sub_rd1_dec1_rup;           
wire            ex2_far_sub_rd1_inc0;               
wire            ex2_far_sub_rd1_inc0_rdn;           
wire            ex2_far_sub_rd1_inc0_rmm;           
wire            ex2_far_sub_rd1_inc0_rne;           
wire    [11:0]  ex2_far_sub_rd1_inc0_rslt;          
wire            ex2_far_sub_rd1_inc0_rtz;           
wire            ex2_far_sub_rd1_inc0_rup;           
wire            ex2_far_sub_rd1_inc1;               
wire            ex2_far_sub_rd1_inc1_rdn;           
wire            ex2_far_sub_rd1_inc1_rmm;           
wire            ex2_far_sub_rd1_inc1_rne;           
wire    [11:0]  ex2_far_sub_rd1_inc1_rslt;          
wire            ex2_far_sub_rd1_inc1_rtz;           
wire            ex2_far_sub_rd1_inc1_rup;           
wire    [11:0]  ex2_far_sub_rd1_result;             
wire            ex2_far_sub_rd2_dec1;               
wire            ex2_far_sub_rd2_dec1_rdn;           
wire            ex2_far_sub_rd2_dec1_rmm;           
wire            ex2_far_sub_rd2_dec1_rne;           
wire    [11:0]  ex2_far_sub_rd2_dec1_rslt;          
wire            ex2_far_sub_rd2_dec1_rtz;           
wire            ex2_far_sub_rd2_dec1_rup;           
wire            ex2_far_sub_rd2_inc0;               
wire            ex2_far_sub_rd2_inc0_rdn;           
wire            ex2_far_sub_rd2_inc0_rmm;           
wire            ex2_far_sub_rd2_inc0_rne;           
wire    [11:0]  ex2_far_sub_rd2_inc0_rslt;          
wire            ex2_far_sub_rd2_inc0_rtz;           
wire            ex2_far_sub_rd2_inc0_rup;           
wire            ex2_far_sub_rd2_inc1;               
wire            ex2_far_sub_rd2_inc1_rdn;           
wire            ex2_far_sub_rd2_inc1_rmm;           
wire            ex2_far_sub_rd2_inc1_rne;           
wire    [11:0]  ex2_far_sub_rd2_inc1_rslt;          
wire            ex2_far_sub_rd2_inc1_rtz;           
wire            ex2_far_sub_rd2_inc1_rup;           
wire    [11:0]  ex2_far_sub_rd2_result;             
wire    [11:0]  ex2_far_sub_sum;                    
wire    [11:0]  ex2_far_sub_sum_add1;               
wire    [11:0]  ex2_far_sub_sum_sub1;               
wire            ex2_final_r_nor;                    
wire            ex2_final_r_spe;                    
wire            ex2_half_nor_nx;                    
wire    [4 :0]  ex2_nor_expt;                       
wire    [15:0]  ex2_nor_r_bypass;                   
wire    [15:0]  ex2_nor_r_close;                    
wire    [15:0]  ex2_nor_r_far;                      
wire    [15:0]  ex2_nor_result_f;                   
wire            ex2_op_add;                         
wire            ex2_op_cmp;                         
wire            ex2_op_fle;                         
wire            ex2_op_flt;                         
wire            ex2_op_maxnm;                       
wire            ex2_op_minnm;                       
wire            ex2_op_sel;                         
wire            ex2_op_sub;                         
wire            ex2_pipe_clk;                       
wire            ex2_pipe_clk_en;                    
wire            ex2_pipedown;                       
wire    [15:0]  ex2_qnan_a_src2_result;             
wire            ex2_r_0_sign;                       
wire            ex2_r_is_0;                         
wire            ex2_r_is_dn;                        
wire            ex2_r_is_inf;                       
wire            ex2_r_is_lfn;                       
wire            ex2_r_is_qnan_a_src2;               
wire            ex2_r_sel_src2;                     
wire            ex2_rm_rdn;                         
wire            ex2_rm_rmm;                         
wire            ex2_rm_rne;                         
wire            ex2_rm_rtz;                         
wire            ex2_rm_rup;                         
wire    [15:0]  ex2_sel_result;                     
wire            ex2_sign;                           
wire    [15:0]  ex2_spe_r_0;                        
wire    [15:0]  ex2_spe_r_dn;                       
wire    [15:0]  ex2_spe_r_inf;                      
wire    [15:0]  ex2_spe_r_lfn;                      
wire    [15:0]  ex2_spe_r_qnan;                     
wire            ex2_spe_r_sel;                      
wire    [15:0]  ex2_spe_result_f;                   
wire    [4 :0]  ex2_src0_e;                         
wire    [4 :0]  ex2_src0_e_fm;                      
wire            ex2_src0_emax;                      
wire    [10:0]  ex2_src0_f;                         
wire            ex2_src0_f_1p0_0;                   
wire            ex2_src0_f_1p1_1;                   
wire            ex2_src0_is_0;                      
wire            ex2_src0_is_cnan;                   
wire            ex2_src0_is_cnan_org;               
wire            ex2_src0_is_inf;                    
wire            ex2_src0_is_qnan;                   
wire            ex2_src0_is_qnan_org;               
wire            ex2_src0_is_snan;                   
wire    [8 :0]  ex2_src0_qnan_f;                    
wire            ex2_src0_qnan_s;                    
wire            ex2_src0_s;                         
wire    [4 :0]  ex2_src1_e;                         
wire    [4 :0]  ex2_src1_e_fm;                      
wire    [10:0]  ex2_src1_f;                         
wire            ex2_src1_is_0;                      
wire            ex2_src1_is_cnan;                   
wire            ex2_src1_is_cnan_org;               
wire            ex2_src1_is_inf;                    
wire            ex2_src1_is_qnan;                   
wire            ex2_src1_is_qnan_org;               
wire            ex2_src1_is_snan;                   
wire    [8 :0]  ex2_src1_qnan_f;                    
wire            ex2_src1_qnan_s;                    
wire            ex2_src1_s;                         
wire            ex2_src_change;                     
wire            ex2_unord_nv;                       
wire            ex2_unord_sel;                      
wire            ex2_unorder_nv;                     
wire    [4 :0]  ex3_expt;                           
wire    [9 :0]  fa;                                 
wire            fa_gt_0;                            
wire            fa_is_0;                            
wire            fa_is_all_1;                        
wire            fa_msb_is_1;                        
wire    [10:0]  fa_nm;                              
wire    [10:0]  fa_nm_4ex2;                         
wire    [63:0]  fadd_ctrl_src0;                     
wire    [63:0]  fadd_ctrl_src1;                     
wire            fadd_ex2_src_widden_both_denorm_add; 
wire    [15:0]  fadd_ex3_nor_result;                
wire    [15:0]  fadd_ex3_spe_result;                
wire            far_part_s;                         
wire    [9 :0]  fb;                                 
wire            fb_gt_0;                            
wire            fb_is_0;                            
wire            fb_is_all_1;                        
wire            fb_msb_is_1;                        
wire    [10:0]  fb_nm;                              
wire    [10:0]  fb_nm_4ex2;                         
wire            forever_cpuclk;                     
wire            opa_high_is_1;                      
wire            opa_is_0;                           
wire            opa_is_cnan;                        
wire            opa_is_dn;                          
wire            opa_is_dn_no_flush;                 
wire            opa_is_inf;                         
wire            opa_is_lfn;                         
wire            opa_is_nan;                         
wire            opa_is_nm;                          
wire            opa_is_qnan;                        
wire            opa_is_snan;                        
wire            opa_is_snm;                         
wire            opb_high_is_1;                      
wire            opb_is_0;                           
wire            opb_is_cnan;                        
wire            opb_is_dn;                          
wire            opb_is_dn_no_flush;                 
wire            opb_is_inf;                         
wire            opb_is_lfn;                         
wire            opb_is_nan;                         
wire            opb_is_nm;                          
wire            opb_is_qnan;                        
wire            opb_is_snan;                        
wire            opb_is_snm;                         
wire            pad_yy_icg_scan_en;                 
wire            sa;                                 
wire            sb;                                 
wire            vfpu_yy_xx_dqnan;                   



//===============Single and Double Merge====================
assign sa       =  fadd_ctrl_src0[15];
assign ea[4:0]  =  {fadd_ctrl_src0[14:10]};
assign fa[9:0]  =  {fadd_ctrl_src0[9:0]};
assign sb       =  fadd_ctrl_src1[15];
assign eb[4:0]  =  {fadd_ctrl_src1[14:10]};
assign fb[9:0]  =  {fadd_ctrl_src1[9:0]};                               


//=====================Operator Type========================
//type of operand a
assign ea_is_lfn     = ea[4:0] == 5'h1e;
assign ea_is_nan_inf = ea[4:0] == 5'h1f;
assign fa_is_all_1   = &fa[9:0];                        
assign ea_lt_nan_inf = (~&ea[4:0]);
assign fa_msb_is_1   = fa[9];
assign opa_high_is_1 = &fadd_ctrl_src0[63:16];
assign opa_is_cnan   = ex1_scalar && !opa_high_is_1;                     

assign ea_gt_0       = |ea[4:0];
assign ea_is_0       = ~|ea[4:0];
assign ea_is_1       = (~|ea[4:1]) && ea[0];
assign ea_is_norm    = ea_gt_0;                     
assign fa_gt_0       = |fa[9:0];
assign fa_is_0       = ~|fa[9:0];
assign opa_is_snan   = ea_is_nan_inf && (!fa_msb_is_1) && fa_gt_0 && !opa_is_cnan; 
assign opa_is_qnan   = ea_is_nan_inf && fa_msb_is_1    || opa_is_cnan;
assign opa_is_nan    = opa_is_snan   || opa_is_qnan;
assign opa_is_inf    = ea_is_nan_inf && fa_is_0       && !opa_is_cnan;                   
assign opa_is_lfn    = ea_is_lfn     && fa_is_all_1   && !opa_is_cnan;                   
assign opa_is_nm     = ea_gt_0       && ea_lt_nan_inf && !opa_is_cnan;                   
assign opa_is_dn     = ea_is_0       && fa_gt_0       && !opa_is_cnan;                         
assign opa_is_0      = ea_is_0       && fa_is_0       && !opa_is_cnan;                         
assign opa_is_snm    = ea_is_1       && !opa_is_cnan;
assign opa_is_dn_no_flush = opa_is_dn;

//type of operand b
assign eb_is_lfn     = &eb[4:1] && ~eb[0];
assign eb_is_nan_inf = &eb[4:0];
assign eb_lt_nan_inf = ~&eb[4:0];
assign fb_is_all_1   = &fb[9:0];
assign fb_msb_is_1   = fb[9];
assign opb_high_is_1 = &fadd_ctrl_src1[63:16];
assign opb_is_cnan   = ex1_scalar && !opb_high_is_1;                  
assign eb_gt_0       = |eb[4:0];
assign eb_is_0       = ~|eb[4:0];
assign eb_is_1       = (~|eb[4:1]) && eb[0];
assign eb_is_norm    = eb_gt_0;                                          
assign fb_gt_0       = |fb[9:0];
assign fb_is_0       = ~|fb[9:0];

assign opb_is_snan   = eb_is_nan_inf && (!fb_msb_is_1) && fb_gt_0 && !opb_is_cnan; 
assign opb_is_qnan   = eb_is_nan_inf && fb_msb_is_1    || opb_is_cnan;   
assign opb_is_nan    = opb_is_snan   || opb_is_qnan;
assign opb_is_inf    = eb_is_nan_inf && fb_is_0       && !opb_is_cnan;                   
assign opb_is_lfn    = eb_is_lfn     && fb_is_all_1   && !opb_is_cnan;                   
assign opb_is_nm     = eb_gt_0       && eb_lt_nan_inf && !opb_is_cnan;                   
assign opb_is_dn     = eb_is_0       && fb_gt_0       && !opb_is_cnan;                         
assign opb_is_0      = eb_is_0       && fb_is_0       && !opb_is_cnan;                         
assign opb_is_snm    = eb_is_1;
assign opb_is_dn_no_flush = opb_is_dn;

//====================Fraction Denormal=====================
//Denormal Fraction will be flush to 1.000...00
//Will select by DN signal
assign fa_nm[10:0] = ea_is_norm ? {1'b1,fa[9:0]} : {fa[9:0],1'b0};

assign fb_nm[10:0] = eb_is_norm ? {1'b1,fb[9:0]} : {fb[9:0],1'b0};

assign fa_nm_4ex2[10:0] = {ea_is_norm,fa[9:0]};

assign fb_nm_4ex2[10:0] = {eb_is_norm,fb[9:0]};
//=======================Exponent Sub=======================
// two adders in parallel, 
// the sign of the result of adder 0 is used to select
//   e_adder0_sum = Ea - Eb;
//   e_adder1_sum = Eb - Ea;
// we just need to positive one

//Adder Prepare
assign e_adder0_src0[5:0] = {1'b0,  ea[4:0]};
assign e_adder0_src1[5:0] = {1'b1, ~eb[4:0]};
assign e_adder1_src0[5:0] = {1'b1, ~ea[4:0]};
assign e_adder1_src1[5:0] = {1'b0,  eb[4:0]};
//Sub Operation
assign e_adder0_sum[5:0] = e_adder0_src0[5:0] + e_adder0_src1[5:0] + 6'b1;
assign e_adder1_sum[5:0] = e_adder1_src0[5:0] + e_adder1_src1[5:0] + 6'b1;
//Sub Result
assign ex1_es             = e_adder0_sum[5];
assign ex1_ed[4:0]       = (ex1_es) 
                          ? e_adder1_sum[4:0] 
                          : e_adder0_sum[4:0];
//==========================================================
//                     Valid Add/Sub
//==========================================================
//According to origin operate and sign of two oprand
//Get to valid operate
//  Add/sub  |   S0  |   S1  |  Result  |
//    Add        +       +        Add
//    Add        +       -        Sub
//    Add        -       +        Sub
//    Add        -       -        Add
//    Sub        +       +        Sub
//    Sub        +       -        Add
//    Sub        -       +        Add
//    Sub        -       -        Sub
//Ex1 Actural Operation
assign ex1_act_add = (ex1_op_add) && 
                     (ex1_src0_s  ^~ ex1_src1_s) || 
                     (ex1_op_sub  || ex1_op_cmp  || ex1_cmp_sel) && 
                     (ex1_src0_s  ^  ex1_src1_s);
assign ex1_act_sub = (ex1_op_add) && 
                     (ex1_src0_s  ^  ex1_src1_s) || 
                     (ex1_op_sub  || ex1_op_cmp  || ex1_cmp_sel) && 
                     (ex1_src0_s  ^~ ex1_src1_s);
assign ex1_act_s   = (ex1_es && ex1_cmp_sub)
                   ? ~ex1_src0_s
                   : ex1_src0_s;                   
assign ex1_cmp_sub = ex1_op_sub || ex1_op_cmp || ex1_cmp_sel;                   
assign ex1_cmp_sel = ex1_op_maxnm || ex1_op_minnm;


//======================Operand Exchange====================
//The Operand with larger E will be set as src0
//when Ea == Eb, Opb may larger than Opa
// &CombBeg; @157
always @( fb_nm[10:0]
       or eb[4:0]
       or opb_is_nm
       or opa_is_lfn
       or opb_is_nan
       or opb_is_dn_no_flush
       or opa_is_inf
       or ex1_es
       or fa_nm[10:0]
       or fa_nm_4ex2[10:0]
       or sa
       or opa_is_cnan
       or opa_is_dn
       or opb_is_cnan
       or opa_is_snan
       or opb_is_lfn
       or sb
       or opb_is_0
       or ea[4:0]
       or opa_is_qnan
       or opb_is_snan
       or opb_is_inf
       or opb_is_dn
       or opa_is_nm
       or opa_is_nan
       or opa_is_dn_no_flush
       or opa_is_snm
       or opb_is_qnan
       or opb_is_snm
       or fb_nm_4ex2[10:0]
       or opa_is_0)
begin
if(!ex1_es)//E sub positive
begin
  ex1_src0_s       = sa;
  ex1_src0_e[4:0] = ea[4:0];
  ex1_src0_f[10:0] = (opa_is_nm || opa_is_nan || opa_is_dn_no_flush) 
                   ? fa_nm[10:0] 
                   : 11'b0;
  ex1_src0_f_4ex2[10:0] = (opa_is_nm || opa_is_nan || opa_is_dn_no_flush) 
                   ? fa_nm_4ex2[10:0] 
                   : 11'b0;                  
  ex1_src1_s       = sb;
  ex1_src1_e[4:0] = eb[4:0];
  ex1_src1_f[10:0] = (opb_is_nm || opb_is_nan ||opb_is_dn_no_flush) 
                   ? fb_nm[10:0] 
                   : 11'b0;
  ex1_src1_f_4ex2[10:0] = (opb_is_nm || opb_is_nan ||opb_is_dn_no_flush) 
                   ? fb_nm_4ex2[10:0] 
                   : 11'b0;
  ex1_src0_is_snan = opa_is_snan;
  ex1_src0_is_qnan = opa_is_qnan; 
  ex1_src0_is_cnan = opa_is_cnan;
  ex1_src0_is_inf  = opa_is_inf; 
  ex1_src0_is_lfn  = opa_is_lfn; 
  ex1_src0_is_nm   = opa_is_nm; 
  ex1_src0_is_dn   = opa_is_dn; 
  ex1_src0_is_0    = opa_is_0; 
  ex1_src0_is_snm  = opa_is_snm; 
  ex1_src1_is_snan = opb_is_snan;
  ex1_src1_is_qnan = opb_is_qnan; 
  ex1_src1_is_cnan = opb_is_cnan;
  ex1_src1_is_inf  = opb_is_inf; 
  ex1_src1_is_lfn  = opb_is_lfn; 
  ex1_src1_is_nm   = opb_is_nm; 
  ex1_src1_is_dn   = opb_is_dn; 
  ex1_src1_is_0    = opb_is_0; 
  ex1_src1_is_snm  = opb_is_snm; 
end
else//E sub negative
begin
  ex1_src1_s       = sa;
  ex1_src1_e[4:0] = ea[4:0];
  ex1_src1_f[10:0] = (opa_is_nm || opa_is_nan || opa_is_dn_no_flush)
                   ? fa_nm[10:0]
                   : 11'b0;
  ex1_src1_f_4ex2[10:0] = (opa_is_nm || opa_is_nan || opa_is_dn_no_flush)
                   ? fa_nm_4ex2[10:0]
                   : 11'b0;
                 
  ex1_src0_s       = sb;
  ex1_src0_e[4:0] = eb[4:0]; 
  ex1_src0_f[10:0] = (opb_is_nm || opb_is_nan || opb_is_dn_no_flush)
                   ? fb_nm[10:0]
                   : 11'b0;
  ex1_src0_f_4ex2[10:0] = (opb_is_nm || opb_is_nan || opb_is_dn_no_flush)
                   ? fb_nm_4ex2[10:0]
                   : 11'b0;

  ex1_src1_is_snan = opa_is_snan;
  ex1_src1_is_qnan = opa_is_qnan; 
  ex1_src1_is_cnan = opa_is_cnan;
  ex1_src1_is_inf  = opa_is_inf; 
  ex1_src1_is_lfn  = opa_is_lfn; 
  ex1_src1_is_nm   = opa_is_nm; 
  ex1_src1_is_dn   = opa_is_dn; 
  ex1_src1_is_0    = opa_is_0; 
  ex1_src1_is_snm  = opa_is_snm; 
  ex1_src0_is_snan = opb_is_snan;
  ex1_src0_is_qnan = opb_is_qnan; 
  ex1_src0_is_inf  = opb_is_inf; 
  ex1_src0_is_cnan = opb_is_cnan;
  ex1_src0_is_lfn  = opb_is_lfn; 
  ex1_src0_is_nm   = opb_is_nm; 
  ex1_src0_is_dn   = opb_is_dn; 
  ex1_src0_is_0    = opb_is_0; 
  ex1_src0_is_snm  = opb_is_snm; 
end
// &CombEnd; @234
end

//Src_eq_0 Logic
//src0_eq_0 when:
//  ex1_src0_is_0 || ex1_src0_is_dn && !fm
//src1_eq_0 when
//  ex1_src1_is_0 || ex1_src1_is_dn && !fm || 
//  CMPZ operation
assign ex1_src0_eq_0    = ex1_src0_is_0; 
assign ex1_src1_eq_0    = ex1_src1_is_0;

assign ex1_src0_is[8:0] = {ex1_src0_is_snm,  ex1_src0_is_cnan, ex1_src0_is_snan,
                           ex1_src0_is_qnan, ex1_src0_is_inf,  ex1_src0_is_lfn,
                           ex1_src0_is_nm,   ex1_src0_is_dn,  ex1_src0_eq_0};
assign ex1_src1_is[8:0] = {ex1_src1_is_snm,  ex1_src1_is_cnan, ex1_src1_is_snan, 
                           ex1_src1_is_qnan, ex1_src1_is_inf,  ex1_src1_is_lfn,
                           ex1_src1_is_nm,   ex1_src1_is_dn,  ex1_src1_eq_0};


//==========================================================
//                     EX1 BYPASS PATH
//==========================================================
//Bypass Path Condition:
//  1.Single : ed>=26 && S1_nm || ed>=27 && S1_dn
//  2.Double : ed>=55 && S1_nm || ed>=56 && S1_dn
assign ex1_bypass_sel     = ex1_ed_gt_25s_54d &&  ex1_src1_is_nm || 
                            ex1_ed_gt_26s_55d && !ex1_src1_is_nm;
assign ex1_ed_gt_25s_54d  = ex1_ed[4:0] > 5'hc;
assign ex1_ed_gt_26s_55d  = ex1_ed[4:0] > 5'hd;

//==========================================================
//                     EX1 CLOSE PATH
//==========================================================
// for widden denorm add, we will using the close path to reuse the 
// shift logic of the second stage of close path
//
// &Instance("ct_fadd_widden_add_ff1_half","x_ct_fadd_widden_add_ff1_half"); @272
// &Connect( @273
//         .fa              (fa                          ), @274
//         .fb              (fb                          ), @275
//         .sum             (widden_denormal_add         ), @276
//         .ff1_pred_onehot (widden_denormal_add_pred_ff1) @277
// ); @278
assign ex1_close_sel      = ex1_act_sub && ex1_ed_lt_2;
assign ex1_ed_lt_2        = ~|ex1_ed[4:1];
assign ex1_ed_is_1        = (~|ex1_ed[4:1]) && ex1_ed[0];
assign ex1_ed_is_0        = (~|ex1_ed[4:0]);
//src0 eq src1 not care sign bit
//assign ex1_close_e_eq     = ex1_ed_is_0;
//assign ex1_close_src_eq   = ex1_close_e_eq && 
//                            (ex1_src0_s ^~ ex1_src1_s) && 
//                            (ex1_src0_f[10:0] == ex1_src1_f[10:0]) || 
//                             ex1_src0_eq_0 && ex1_src1_eq_0;
//Fraction Align
//src_1 fraction need shift right by 1 if
//  Ed is 1 && !(S1_is_dn && S0_is_nm)
//  Other special condition will be dealt in other way
assign ex1_close_shift    = (ex1_ed_is_1) && 
                           !(ex1_src0_is_nm && (ea_is_0||eb_is_0));
assign ex1_close_ed1      = ex1_ed_is_1;
//Fraction Adder operand prepare
//s0 for no shift right by one
//s1 for    shift right by one
//assign ex1_f1_x_close_s0               = 1'b0;
//assign ex1_f1_x_close_s1               = ex1_src1_f[0];

 //Fraction Adder S0
assign ex1_close_adder0_s0[10:0]       = {ea_is_norm, fadd_ctrl_src0[9:0]};      
assign ex1_close_adder1_s0[10:0]       = {eb_is_norm, fadd_ctrl_src1[9:0]};
//Fraction Adder S1 src1_d is smaller
assign ex1_close_adder0_s1_a[11:0]     = {1'b1,fadd_ctrl_src0[9:0],1'b0};
assign ex1_close_adder1_s1_a[11:0]     = {1'b0, 1'b1, fadd_ctrl_src1[9:0]};
//Fraction Adder S1 src0_d is smaller
assign ex1_close_adder0_s1_b[11:0]     = {1'b1, fadd_ctrl_src1[9:0],1'b0};
assign ex1_close_adder1_s1_b[11:0]     = {1'b0, 1'b1, fadd_ctrl_src0[9:0]};
// &Instance("ct_fadd_close_s0_h","x_ct_fadd_close_s0_h"); @318
ct_fadd_close_s0_h  x_ct_fadd_close_s0_h (
  .close_adder0            (ex1_close_adder0_s0    ),
  .close_adder1            (ex1_close_adder1_s0    ),
  .close_eq                (ex1_close_f_eq         ),
  .close_op_chg            (ex1_close_op_chg_s0    ),
  .close_sum               (ex1_close_sum_s0       ),
  .ff1_pred                (ex1_close_ff1_s0       ),
  .ff1_pred_onehot         (ex1_close_ff1_onehot_s0)
);

// &Connect( @319
//           .src0_e_is_0     (ea_is_0                     ) @320
//           .close_adder0    (ex1_close_adder0_s0         ), @321
//           .close_adder1    (ex1_close_adder1_s0         ), @322
//           .close_sum       (ex1_close_sum_s0            ), @323
//           .ff1_pred_onehot (ex1_close_ff1_onehot_s0     ), @324
//           .ff1_pred        (ex1_close_ff1_s0            ), @325
//           .close_op_chg    (ex1_close_op_chg_s0         ), @326
//           .close_eq        (ex1_close_f_eq              ) @327
//         ); @328

// &Instance("ct_fadd_close_s1_h","x_ct_fadd_close_s1_h_a"); @330
ct_fadd_close_s1_h  x_ct_fadd_close_s1_h_a (
  .close_adder0              (ex1_close_adder0_s1_a    ),
  .close_adder1              (ex1_close_adder1_s1_a    ),
  .close_op_chg              (ex1_close_op_chg_s1_a    ),
  .close_sum                 (ex1_close_sum_s1_a       ),
  .close_sum_m1              (ex1_close_sum_m1_s1_a    ),
  .ff1_pred                  (ex1_close_ff1_s1_a       ),
  .ff1_pred_onehot           (ex1_close_ff1_onehot_s1_a)
);

// &Connect( @331
//           .src0_e_is_0     (ea_is_0                     ) @332
//           .src1_e_is_0     (eb_is_0                     ), @333
//           .close_adder0    (ex1_close_adder0_s1_a       ), @334
//           .close_adder1    (ex1_close_adder1_s1_a       ), @335
//           .close_sum       (ex1_close_sum_s1_a          ), @336
//           .close_sum_m1    (ex1_close_sum_m1_s1_a       ), @337
//           .ff1_pred_onehot (ex1_close_ff1_onehot_s1_a   ), @338
//           .ff1_pred        (ex1_close_ff1_s1_a          ), @339
//           .close_op_chg    (ex1_close_op_chg_s1_a       ) @340
//         ); @341
// &Force("nonport","ex1_close_op_chg_s1_a"); @342

// &Instance("ct_fadd_close_s1_h","x_ct_fadd_close_s1_h_b"); @344
ct_fadd_close_s1_h  x_ct_fadd_close_s1_h_b (
  .close_adder0              (ex1_close_adder0_s1_b    ),
  .close_adder1              (ex1_close_adder1_s1_b    ),
  .close_op_chg              (ex1_close_op_chg_s1_b    ),
  .close_sum                 (ex1_close_sum_s1_b       ),
  .close_sum_m1              (ex1_close_sum_m1_s1_b    ),
  .ff1_pred                  (ex1_close_ff1_s1_b       ),
  .ff1_pred_onehot           (ex1_close_ff1_onehot_s1_b)
);

// &Connect( @345
//           .src0_e_is_0     (eb_is_0                     ) @346
//           .src1_e_is_0     (ea_is_0                     ), @347
//           .close_adder0    (ex1_close_adder0_s1_b       ), @348
//           .close_adder1    (ex1_close_adder1_s1_b       ), @349
//           .close_sum       (ex1_close_sum_s1_b          ), @350
//           .close_sum_m1    (ex1_close_sum_m1_s1_b       ), @351
//           .ff1_pred_onehot (ex1_close_ff1_onehot_s1_b   ), @352
//           .ff1_pred        (ex1_close_ff1_s1_b          ), @353
//           .close_op_chg    (ex1_close_op_chg_s1_b       ) @354
//         ); @355
// &Force("nonport","ex1_close_op_chg_s1_b"); @356

//Merge S0 and S1
//Design for timing...
assign ex1_close_sum_m1[11:0]          = ex1_close_sum_m1_s1[11:0];

//Merge ex1_close_sum_s1                                       
assign ex1_close_sum_s1[11:0]          = (~ex1_es)
                                       ? ex1_close_sum_s1_a[11:0]
                                       : ex1_close_sum_s1_b[11:0];
assign ex1_close_sum_m1_s1[11:0]       = (~ex1_es)
                                       ? ex1_close_sum_m1_s1_a[11:0]
                                       : ex1_close_sum_m1_s1_b[11:0];                                 

assign ex1_close_ff1_onehot_s1[11:0]   = (~ex1_es)
                                       ? ex1_close_ff1_onehot_s1_a[11:0]
                                       : ex1_close_ff1_onehot_s1_b[11:0];

assign ex1_close_ff1_s1[3:0]           = (~ex1_es)
                                       ? ex1_close_ff1_s1_a[3:0]
                                       : ex1_close_ff1_s1_b[3:0];



assign ex1_close_ff1[5:0]              = (ex1_close_shift)
                                       ? {2'b0,ex1_close_ff1_s1[3:0]}
                                       : {2'b0,ex1_close_ff1_s0[3:0]};

//When 1.xxx -0.1xxxx|1, should special treated
//assign ex1_close_sp_dec1               = (ex1_close_adder0_s1[9:0] == ex1_close_adder1_s1[9:0]) && 
//                                          ex1_close_adder0_s1[10]   && ex1_src1_f[0] && 
//                                          ex1_close_shift;
//assign ex1_close_adder0_s1[11:0]       = (~ex1_es)
//                                       ? ex1_close_adder0_s1_a[11:0]
//                                       : ex1_close_adder0_s1_b[11:0];
//assign ex1_close_adder1_s1[11:0]       = (~ex1_es)
//                                       ? ex1_close_adder1_s1_a[11:0]
//                                       : ex1_close_adder1_s1_b[11:0];
//ex1_close_sign
assign ex1_close_sign                  = (ex1_close_op_chg_s0 && !ex1_ed_is_1)
                                       ? !ex1_act_s
                                       :  ex1_act_s;
assign ex1_close_ff1_onehot[11:0]      = (ex1_close_shift)
                                       ? ex1_close_ff1_onehot_s1[11:0]
                                       : {ex1_close_ff1_onehot_s0[10:0],1'b0};

assign ex1_close_sum[11:0]             = (ex1_close_shift)
                                       ? ex1_close_sum_s1[11:0]
                                       : {ex1_close_sum_s0[10:0],1'b0};



// the first stage, we move the compare result generation to the first stage
assign ex1_cmp_nv       = (opa_is_snan || opb_is_snan) || 
                          (opa_is_qnan || opb_is_qnan);


assign ex1_cmp_feq  = !opa_is_snan && 
                      !opb_is_snan &&  
                      !opa_is_qnan && 
                      !opb_is_qnan &&
                      ex1_src0_eq_src1;
assign ex1_cmp_fne  = !ex1_cmp_feq;
assign ex1_e_eq     = ex1_ed_is_0;
assign ex1_f_eq         = ex1_close_f_eq;
assign ex1_src0_eq_src1 = (sb ^~ sa) && ex1_f_eq && ex1_e_eq  || ex1_src0_eq_0 && ex1_src1_eq_0;
assign ex1_sign         = ex1_close_sel ? ex1_close_sign : ex1_act_s;
//assign ex1_sign     = 
assign ex1_cmp_fle  = (ex1_sign || ex1_src0_eq_src1) && !ex1_cmp_nv;

assign ex1_cmp_flt  = (ex1_sign && !ex1_src0_eq_src1) && 
                      !ex1_cmp_nv;
assign ex1_cmp_ford = !opa_is_snan &&
                      !opb_is_snan &&  
                      !opa_is_qnan && 
                      !opb_is_qnan;  

//Merge Final C Result
assign ex1_cmp_result = ex1_op_feq && ex1_cmp_feq || 
                        ex1_op_fle && ex1_cmp_fle || 
                        ex1_op_flt && ex1_cmp_flt ||
                        ex1_op_fne && ex1_cmp_fne ||
                        ex1_op_ford && ex1_cmp_ford;
// &Force("output","ex1_cmp_result");                       @459
//assign ex1_f1_x_close                  = (ex1_close_shift)
//                                       ? ex1_f1_x_close_s1
//                                       : ex1_f1_x_close_s0;

//==========================================================
//                       EX1 FAR PATH
//==========================================================
//Far Path Condition:
//  Not bypass_sel     && 
//  Not close_sel      &&
//  Not special_result

//Fraction Align
//ex1_far_shift_dn_sel
//s0_is_nm && s1_is_dn && fm==1

//f2_v for fraction not shift out
//f2_x for fraction shift out
//Just need to deal with 0 <= ed <= 55
//For timing, spilt shift to two part
//====================DN low part shift=====================
//assign ex1_f1_v_dn_pre[24:0] =  {ex1_src1_f[23:0],1'b0} >> ex1_ed[4:0];
//assign ex1_f1_x_dn[24:0] =  {ex1_src1_f[23:0],1'b0} << (5'd25-ex1_ed[4:0]);



//====================NM low part shift=====================
// &CombBeg; @487
always @( ex1_src1_f[10:0]
       or ex1_ed[4:0])
begin
case(ex1_ed[4:0])
  5'd0    : begin
    ex1_f1_v_nm[10:0] = {       ex1_src1_f[10:0]};
    ex1_f1_x_nm[11:0] = 12'b0;
  end
  5'd1    : begin
    ex1_f1_v_nm[10:0] = {1'b0,  ex1_src1_f[10:1]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[0],    11'b0};
  end
  5'd2    : begin
    ex1_f1_v_nm[10:0] = {2'b0,  ex1_src1_f[10:2]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[1:0],  10'b0};
  end
  5'd3    : begin
    ex1_f1_v_nm[10:0] = {3'b0,  ex1_src1_f[10:3]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[2:0],  9'b0};
  end
  5'd4    : begin
    ex1_f1_v_nm[10:0] = {4'b0,  ex1_src1_f[10:4]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[3:0],  8'b0};
  end
  5'd5    : begin
    ex1_f1_v_nm[10:0] = {5'b0,  ex1_src1_f[10:5]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[4:0],  7'b0};
  end
  5'd6    : begin
    ex1_f1_v_nm[10:0] = {6'b0,  ex1_src1_f[10:6]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[5:0],  6'b0};
  end
  5'd7    : begin
    ex1_f1_v_nm[10:0] = {7'b0,  ex1_src1_f[10:7]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[6:0],  5'b0};
  end
  5'd8    : begin
    ex1_f1_v_nm[10:0] = {8'b0,  ex1_src1_f[10:8]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[7:0],  4'b0};
  end
  5'd9    : begin
    ex1_f1_v_nm[10:0] = {9'b0,  ex1_src1_f[10:9]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[8:0],  3'b0};
  end
  5'd10    : begin
    ex1_f1_v_nm[10:0] = {10'b0,  ex1_src1_f[10]};
    ex1_f1_x_nm[11:0] = {ex1_src1_f[9:0],  2'b0};
  end

  5'd11    : begin
    ex1_f1_v_nm[10:0] = 11'b0;
    ex1_f1_x_nm[11:0] = {ex1_src1_f[10:0],  1'b0};
  end

  5'd12    : begin
    ex1_f1_v_nm[10:0] = 11'b0;
    ex1_f1_x_nm[11:0] = {1'b0,ex1_src1_f[10:0]};
  end
  5'd13    : begin
    ex1_f1_v_nm[10:0] = 11'b0;
    ex1_f1_x_nm[11:0] = {2'b0,ex1_src1_f[10:1]};
  end
  default : begin
    ex1_f1_v_nm[10:0] = {11{1'b0}};
    ex1_f1_x_nm[11:0] = {12{1'b0}};
  end
endcase
// &CombEnd; @552
end
assign ex1_src_both_denorm = ea_is_0 && eb_is_0;
//Fraction Value after Align
//assign 
assign ex1_f1_v_far[10:0] = ex1_f1_v_nm[10:0];
assign ex1_f1_x_far[11:0] = ex1_f1_x_nm[11:0];

assign ex1_far_adder0[12:0]  = {1'b0, ex1_src0_f[10:0],1'b0};
assign ex1_far_adder1[12:0]  = {1'b0, ex1_f1_v_far[10:0],ex1_f1_x_nm[11]};

//======================Flop to EX2=========================
//gate clk
// &Instance("gated_clk_cell","x_ex1_pipe_clk"); @564
gated_clk_cell  x_ex1_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @565
//           .clk_out        (ex1_pipe_clk),//Out Clock @566
//           .external_en    (1'b0), @567
//           .global_en      (cp0_yy_clk_en), @568
//           .local_en       (ex1_pipe_clk_en),//Local Condition @569
//           .module_en      (cp0_vfpu_icg_en) @570
//         ); @571
assign ex1_pipe_clk_en = ex1_pipedown;

always @(posedge ex1_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    fadd_ex2_far_adder0[12:0]           <= 13'b0;
    fadd_ex2_far_adder1[12:0]           <= 13'b0;
    fadd_ex2_f1_x_far[11:0]             <= 12'b0;
    fadd_ex2_bypass_sel                 <=  1'b0;
    fadd_ex2_close_sel                  <=  1'b0;
    //fadd_ex2_close_src_eq               <=  1'b0;
    fadd_ex2_act_add                    <=  1'b0;
    fadd_ex2_act_sub                    <=  1'b0;
    fadd_ex2_act_s                      <=  1'b0;
    fadd_ex2_close_shift                <=  1'b0;
    fadd_ex2_src0_f[10:0]               <= 11'b0;
    fadd_ex2_src1_f[10:0]               <= 11'b0;
    fadd_ex2_src0_e[4:0]                <=  5'b0;
    fadd_ex2_src1_e[4:0]                <=  5'b0;
    fadd_ex2_src0_s                     <=  1'b0;
    fadd_ex2_src1_s                     <=  1'b0;
    fadd_ex2_src0_is[8:0]               <=  9'b0;
    fadd_ex2_src1_is[8:0]               <=  9'b0;
    fadd_ex2_close_sign                 <=  1'b0;
    fadd_ex2_src_change                 <=  1'b0;
    fadd_ex2_close_sum[11:0]            <= 12'b0;
    fadd_ex2_close_sum_m1[11:0]         <= 12'b0;
    fadd_ex2_close_ff1_onehot[11:0]     <= 12'b0;
    fadd_ex2_close_ff1[5:0]             <= 6'b0;
    fadd_ex2_src_both_denorm            <= 1'b0;
    fadd_ex2_close_ed1                  <= 1'b0;
    fadd_ex2_cmp_result                 <= 1'b0;
  end
  else if(ex1_pipedown)
  begin
    fadd_ex2_far_adder0[12:0]           <= ex1_far_adder0[12:0];
    fadd_ex2_far_adder1[12:0]           <= ex1_far_adder1[12:0];
    fadd_ex2_f1_x_far[11:0]             <= ex1_f1_x_far[11:0];
    fadd_ex2_bypass_sel                 <= ex1_bypass_sel;
    fadd_ex2_close_sel                  <= ex1_close_sel;
    //fadd_ex2_close_src_eq               <= ex1_close_src_eq;
    fadd_ex2_act_add                    <= ex1_act_add;
    fadd_ex2_act_sub                    <= ex1_act_sub;
    fadd_ex2_act_s                      <= ex1_act_s;
    fadd_ex2_close_shift                <= ex1_close_shift;
    fadd_ex2_src0_f[10:0]               <= ex1_src0_f_4ex2[10:0];
    fadd_ex2_src1_f[10:0]               <= ex1_src1_f_4ex2[10:0];
    fadd_ex2_src0_e[4:0]                <= ex1_src0_e[4:0];
    fadd_ex2_src1_e[4:0]                <= ex1_src1_e[4:0];
    fadd_ex2_src0_s                     <= ex1_src0_s;
    fadd_ex2_src1_s                     <= ex1_src1_s;
    fadd_ex2_src0_is[8:0]               <= ex1_src0_is[8:0];
    fadd_ex2_src1_is[8:0]               <= ex1_src1_is[8:0];
    fadd_ex2_close_sign                 <= ex1_close_sign;
    fadd_ex2_src_change                 <= ex1_es;
    fadd_ex2_close_sum[11:0]            <= ex1_close_sum[11:0];
    fadd_ex2_close_sum_m1[11:0]         <= ex1_close_sum_m1[11:0];
    fadd_ex2_close_ff1_onehot[11:0]     <= ex1_close_ff1_onehot[11:0];
    fadd_ex2_close_ff1[5:0]             <= ex1_close_ff1[5:0];
    fadd_ex2_src_both_denorm            <= ex1_src_both_denorm;
    fadd_ex2_close_ed1                  <= ex1_close_ed1;
    fadd_ex2_cmp_result                 <= ex1_cmp_result;
  end
  else
  begin
    fadd_ex2_far_adder0[12:0]           <= fadd_ex2_far_adder0[12:0];
    fadd_ex2_far_adder1[12:0]           <= fadd_ex2_far_adder1[12:0];
    fadd_ex2_f1_x_far[11:0]             <= fadd_ex2_f1_x_far[11:0];
    fadd_ex2_bypass_sel                 <= fadd_ex2_bypass_sel;
    fadd_ex2_close_sel                  <= fadd_ex2_close_sel;
    //fadd_ex2_close_src_eq               <= fadd_ex2_close_src_eq;
    fadd_ex2_act_add                    <= fadd_ex2_act_add;
    fadd_ex2_act_sub                    <= fadd_ex2_act_sub;
    fadd_ex2_act_s                      <= fadd_ex2_act_s;
    fadd_ex2_close_shift                <= fadd_ex2_close_shift;
    fadd_ex2_src0_f[10:0]               <= fadd_ex2_src0_f[10:0];
    fadd_ex2_src1_f[10:0]               <= fadd_ex2_src1_f[10:0];
    fadd_ex2_src0_e[4:0]               <= fadd_ex2_src0_e[4:0];
    fadd_ex2_src1_e[4:0]               <= fadd_ex2_src1_e[4:0];
    fadd_ex2_src0_s                     <= fadd_ex2_src0_s;
    fadd_ex2_src1_s                     <= fadd_ex2_src1_s;
    fadd_ex2_src0_is[8:0]               <= fadd_ex2_src0_is[8:0];
    fadd_ex2_src1_is[8:0]               <= fadd_ex2_src1_is[8:0];
    fadd_ex2_close_sign                 <= fadd_ex2_close_sign;
    fadd_ex2_src_change                 <= fadd_ex2_src_change;
    fadd_ex2_close_sum[11:0]            <= fadd_ex2_close_sum[11:0];
    fadd_ex2_close_sum_m1[11:0]         <= fadd_ex2_close_sum_m1[11:0];
    fadd_ex2_close_ff1_onehot[11:0]     <= fadd_ex2_close_ff1_onehot[11:0];
    fadd_ex2_close_ff1[5:0]             <= fadd_ex2_close_ff1[5:0];
    fadd_ex2_src_both_denorm            <= fadd_ex2_src_both_denorm;
    fadd_ex2_close_ed1                  <= fadd_ex2_close_ed1;
    fadd_ex2_cmp_result                 <= fadd_ex2_cmp_result;
  end
end

//EX2 Signal Prepare
assign ex2_act_add        = fadd_ex2_act_add;
assign ex2_act_sub        = fadd_ex2_act_sub;
assign ex2_act_s          = fadd_ex2_act_s;
assign ex2_src0_f[10:0]   = fadd_ex2_src0_f[10:0];
assign ex2_src1_f[10:0]   = fadd_ex2_src1_f[10:0];
assign ex2_src0_e[4:0]   = fadd_ex2_src0_e[4:0];
assign ex2_src1_e[4:0]   = fadd_ex2_src1_e[4:0];
assign ex2_src0_s         = fadd_ex2_src0_s;
assign ex2_src1_s         = fadd_ex2_src1_s;
assign ex2_close_sel      = fadd_ex2_close_sel;
assign ex2_bypass_sel     = fadd_ex2_bypass_sel;
assign ex2_far_sel        = !fadd_ex2_bypass_sel && 
                            !ex2_close_sel;
//assign ex2_close_src_eq   = fadd_ex2_close_src_eq;
assign ex2_src_change     = fadd_ex2_src_change;

//assign ex2_src0_is_snm    = fadd_ex2_src0_is[8];
assign ex2_src0_is_cnan   = fadd_ex2_src0_is[7];
assign ex2_src0_is_snan   = fadd_ex2_src0_is[6];
assign ex2_src0_is_qnan   = fadd_ex2_src0_is[5];
assign ex2_src0_is_inf    = fadd_ex2_src0_is[4];
assign ex2_src0_is_0      = fadd_ex2_src0_is[0];
//assign ex2_src1_is_snm    = fadd_ex2_src1_is[8];
assign ex2_src1_is_cnan   = fadd_ex2_src1_is[7];
assign ex2_src1_is_snan   = fadd_ex2_src1_is[6];
assign ex2_src1_is_qnan   = fadd_ex2_src1_is[5];
assign ex2_src1_is_inf    = fadd_ex2_src1_is[4];
assign ex2_src1_is_0      = fadd_ex2_src1_is[0];


assign ex2_f1_x_far[11:0]   = fadd_ex2_f1_x_far[11:0];
assign ex2_far_adder0[12:0] = fadd_ex2_far_adder0[12:0];
assign ex2_far_adder1[12:0] = fadd_ex2_far_adder1[12:0];

assign ex2_cmp_result       = fadd_ex2_cmp_result;
//assign ex2_close_sp_dec1              = fadd_ex2_close_sp_dec1;
assign ex2_close_sign                 = fadd_ex2_close_sign;
assign ex2_close_sum[11:0]            = {fadd_ex2_close_sum[11:0]};
assign ex2_close_sum_m1[11:0]         = {fadd_ex2_close_sum_m1[11:0]};
assign ex2_close_ff1_onehot[11:0]     = fadd_ex2_close_ff1_onehot[11:0];

//==========================================================
//                     EX2 BYPASS PATH
//==========================================================
//EX2 BYPASS WAY will round src0 to get final result
//RNE : INC 0
//RTZ : DEC1 when !sign0(+) && Sub || sign0(-) && Sub
//RDN : INC1 when  sign0(-) && Add  example: -(5+1.2) -6 -> -7
//      DEC1 when !sign0(+) && Sub  example: +(5-1.2) +3 -> +4
//RUP : INC1 when !sign0(+) && Add  example: +(5+1.2) +6 -> +7
//      DEC1 when  sign0(-) && Sub  example: -(5-1.2) -4 -> -3
//RNN : INC 0
assign ex2_bypass_inc1  = ex2_rm_rup && 
                         !ex2_act_s && ex2_act_add || 
                          ex2_rm_rdn && 
                          ex2_act_s && ex2_act_add;
assign ex2_bypass_dec1  = ex2_rm_rup && 
                          ex2_act_s && ex2_act_sub || 
                          ex2_rm_rdn && 
                         !ex2_act_s && ex2_act_sub || 
                          ex2_rm_rtz && 
                          ex2_act_sub;

//Rounding Conner Condition
//1.Fraction is 1p00...00, when DEC1, will become 0p11...11
//  It should shift left by one
//  This condition "1" not "0" should be shift in
//  Because round bit always little than "0.5"
// (Other Path round bit larger or equal to 0.5 shouold shift "0" in)
//  E sub by 1
//2.Fraction is 1p11...11, when INC1, will become 10p00...00
//  It should shift right by one
//  E add by 1
//  EMAX add 1 will cause overflow and result is INF
assign ex2_src0_f_1p0_0  = ex2_src0_f[10] && (~|ex2_src0_f[9:0]);
assign ex2_src0_f_1p1_1  =  &ex2_src0_f[10:0];
assign ex2_src0_emax     = (ex2_src0_e[ 4:0]== 5'h1e) && (~ex2_src0_is_cnan);

assign ex2_bypass_f_inc1[10:0]  =  ex2_src0_f[10:0] + 11'b1;
assign ex2_bypass_f_dec1[10:0]  =  ex2_src0_f[10:0] - 11'b1;    
//Bypass Path Calculate result
// &CombBeg; @762
always @( ex2_src1_is_0
       or ex2_src0_f_1p0_0
       or ex2_src0_e[4:0]
       or ex2_bypass_f_inc1[9:0]
       or ex2_bypass_inc1
       or ex2_bypass_dec1
       or ex2_src0_f_1p1_1
       or ex2_bypass_f_dec1[9:0]
       or ex2_src0_f[9:0])
begin
if(ex2_src1_is_0)
begin
  ex2_bypass_f[9:0] = ex2_src0_f[9:0];
  ex2_bypass_e[4:0] = ex2_src0_e[4:0];
end
else if(ex2_src0_f_1p0_0 && ex2_bypass_dec1)
begin
  ex2_bypass_f[9:0] = {{10{1'b1}}};
  ex2_bypass_e[4:0] = ex2_src0_e[4:0] - 5'b1;
end
else if(ex2_src0_f_1p1_1 && ex2_bypass_inc1)
begin
  ex2_bypass_f[9:0] = 10'b0;
  ex2_bypass_e[4:0] = ex2_src0_e[4:0] + 5'b1;
end
else
begin
  ex2_bypass_f[9:0] = (ex2_bypass_inc1)
                     ? ex2_bypass_f_inc1[9:0]
                     : (ex2_bypass_dec1)
                       ? ex2_bypass_f_dec1[9:0]
                       : ex2_src0_f[9:0];
  ex2_bypass_e[4:0] = ex2_src0_e[4:0];
end
// &CombEnd; @787
end
assign ex2_bypass_sign = ex2_act_s;

//Bypass Path Expt detect
assign ex2_bypass_of = ex2_src0_f_1p1_1 && 
                       ex2_bypass_inc1  && 
                      !ex2_src1_is_0    &&
                       ex2_src0_emax;
assign ex2_bypass_nx = !ex2_src1_is_0;
//Bypass Path Special result
assign ex2_bypass_r_is_inf = ex2_src0_f_1p1_1 && 
                             ex2_bypass_inc1  && 
                            !ex2_src1_is_0    &&
                            !ex2_src1_is_cnan &&
                             ex2_src0_emax;
assign ex2_bypass_r_is_lfn = ex2_src0_f_1p1_1 && 
                            !ex2_bypass_inc1  && 
                            !ex2_bypass_dec1  &&
                            !ex2_src1_is_cnan && 
                             ex2_src0_emax;
//==========================================================
// EX2 for widden path, the rounding will be different 
//==========================================================
// the situation 1.xxxxxx00000000000
//                       00001.xxxxx,xxxxx
// the round and 
//round prepare for the rounding
//{g,r,s}
// &CombBeg; @818
// &CombEnd; @834
// &CombBeg; @978
// &CombEnd; @996
// &CombBeg; @1055
// &CombEnd; @1065
//==========================================================
//                     EX2 FAR PATH
//==========================================================
//EX2 FAR WAY will deal act_add and act_sub with ed>=2
//Need fraction adder to generate sum/sum_p1/sum_m1 in parallel
// here is totally differen rounding from the previous 
// design
// for add, there will be only round add 1, no sum 1 
// we extend the width of the adder, 
// &Force("nonport","ex2_far_add_sum"); @1096
// &Force("nonport","ex2_far_add_sum_add2"); @1097
// &Force("nonport","ex2_far_sub_sum"); @1098
// &Force("nonport","ex2_far_sub_sum_sub1"); @1099
// &Force("nonport","ex2_far_sub_sum_add1"); @1100
// &Force("nonport","ex2_far_adder0"); @1101
// &Force("nonport","ex2_far_adder1"); @1102

//csky vperl_off
assign ex2_far_add_sum[11:0]      = $unsigned($signed(ex2_far_adder0[12:1]) + $signed(ex2_far_adder1[12:1]));
assign ex2_far_add_sum_add2[11:0] = $unsigned($signed(ex2_far_adder0[12:1]) + $signed(ex2_far_adder1[12:1]) + $signed(12'b10));
// for the sub ,we ignore the last valid bit, 
// when the result became 0.1xxxx, in this case, there will only need six
// adder.
assign ex2_far_sub_sum[11:0]      = $unsigned($signed(ex2_far_adder0[11:0]) - $signed(ex2_far_adder1[11:0]));
assign ex2_far_sub_sum_sub1[11:0] = $unsigned($signed(ex2_far_adder0[11:0]) - $signed(ex2_far_adder1[11:0]) - $signed(11'b10));
assign ex2_far_sub_sum_add1[11:0] = $unsigned($signed(ex2_far_adder0[11:0]) - $signed(ex2_far_adder1[11:0]) + $signed(11'b10));
//csky vperl_on

// add round, 
// inorder to minumize the area, we only used add2 result to provide add1
// result
// add inc 1 round
// the result will be 1.xxx
assign far_part_s                  = |ex2_f1_x_far[9:0];
assign ex2_far_add_rd1_inc1_rne    = ex2_far_add_sum[0] && ex2_f1_x_far[11] && ~far_part_s && ~ex2_f1_x_far[10] ||
                                     ex2_f1_x_far[11] && (far_part_s || ex2_f1_x_far[10]);
assign ex2_far_add_rd1_inc0_rne    = !ex2_far_add_rd1_inc1_rne;
assign ex2_far_add_rd1_inc1_rtz    = 1'b0;
assign ex2_far_add_rd1_inc0_rtz    = 1'b1;
assign ex2_far_add_rd1_inc1_rdn    = ex2_far_sign && (far_part_s || ex2_f1_x_far[10] || ex2_f1_x_far[11]);
assign ex2_far_add_rd1_inc0_rdn    = !ex2_far_add_rd1_inc1_rdn;
assign ex2_far_add_rd1_inc1_rup    = !ex2_far_sign && (far_part_s || ex2_f1_x_far[10] || ex2_f1_x_far[11]);
assign ex2_far_add_rd1_inc0_rup    = !ex2_far_add_rd1_inc1_rup;
assign ex2_far_add_rd1_inc1_rmm    = ex2_f1_x_far[11];
assign ex2_far_add_rd1_inc0_rmm    = !ex2_far_add_rd1_inc1_rmm;

assign ex2_far_add_rd1_inc1        = ex2_rm_rne && ex2_far_add_rd1_inc1_rne || 
                                     ex2_rm_rtz && ex2_far_add_rd1_inc1_rtz ||
                                     ex2_rm_rdn && ex2_far_add_rd1_inc1_rdn ||
                                     ex2_rm_rup && ex2_far_add_rd1_inc1_rup ||
                                     ex2_rm_rmm && ex2_far_add_rd1_inc1_rmm;
assign ex2_far_add_rd1_inc0        = ex2_rm_rne && ex2_far_add_rd1_inc0_rne || 
                                     ex2_rm_rtz && ex2_far_add_rd1_inc0_rtz ||
                                     ex2_rm_rdn && ex2_far_add_rd1_inc0_rdn ||
                                     ex2_rm_rup && ex2_far_add_rd1_inc0_rup ||
                                     ex2_rm_rmm && ex2_far_add_rd1_inc0_rmm;

// inorder to save the area, we will use the add2 value and orignal value to
// calculate the inc1 result
// 1.xxxxxxxxpa
//  .00xxxxxxpb
assign ex2_far_add_rd1_inc1_rslt[11:0] = ex2_far_add_sum[0] ? {ex2_far_add_sum_add2[11:1],1'b0} 
                                                            : {ex2_far_add_sum[11:1],1'b1};
assign ex2_far_add_rd1_inc0_rslt[11:0] = ex2_far_add_sum[11:0];     

assign ex2_far_add_rd1_result[11:0]    = {12{ex2_act_add && ex2_far_add_rd1_inc1}} & ex2_far_add_rd1_inc1_rslt[11:0] |
                                         {12{ex2_act_add && ex2_far_add_rd1_inc0}} & ex2_far_add_rd1_inc0_rslt[11:0];
//add inc 2 round
//the result will be 1x.xx
assign ex2_far_add_rd2_inc1_rne    = ex2_far_add_sum[1] && (ex2_far_add_sum[0] && ~|ex2_f1_x_far[11:10] && ~far_part_s) ||
                                     ex2_far_add_sum[0] && (|ex2_f1_x_far[11:10] || far_part_s);
assign ex2_far_add_rd2_inc0_rne    = !ex2_far_add_rd2_inc1_rne;
assign ex2_far_add_rd2_inc1_rtz    = 1'b0;
assign ex2_far_add_rd2_inc0_rtz    = 1'b1;
assign ex2_far_add_rd2_inc1_rdn    = ex2_far_sign && (far_part_s || |ex2_f1_x_far[11:10] || ex2_far_add_sum[0]);
assign ex2_far_add_rd2_inc0_rdn    = !ex2_far_add_rd2_inc1_rdn;
assign ex2_far_add_rd2_inc1_rup    = !ex2_far_sign && (far_part_s || |ex2_f1_x_far[11:10] || ex2_far_add_sum[0]);
assign ex2_far_add_rd2_inc0_rup    = !ex2_far_add_rd2_inc1_rup;
assign ex2_far_add_rd2_inc1_rmm    = ex2_far_add_sum[0];
assign ex2_far_add_rd2_inc0_rmm    = !ex2_far_add_rd2_inc1_rmm;

assign ex2_far_add_rd2_inc1        = ex2_rm_rne && ex2_far_add_rd2_inc1_rne || 
                                     ex2_rm_rtz && ex2_far_add_rd2_inc1_rtz ||
                                     ex2_rm_rdn && ex2_far_add_rd2_inc1_rdn ||
                                     ex2_rm_rup && ex2_far_add_rd2_inc1_rup ||
                                     ex2_rm_rmm && ex2_far_add_rd2_inc1_rmm;
assign ex2_far_add_rd2_inc0        = ex2_rm_rne && ex2_far_add_rd2_inc0_rne || 
                                     ex2_rm_rtz && ex2_far_add_rd2_inc0_rtz ||
                                     ex2_rm_rdn && ex2_far_add_rd2_inc0_rdn ||
                                     ex2_rm_rup && ex2_far_add_rd2_inc0_rup ||
                                     ex2_rm_rmm && ex2_far_add_rd2_inc0_rmm;

assign ex2_far_add_rd2_inc0_rslt[11:0] = ex2_far_add_sum[11:0];
assign ex2_far_add_rd2_inc1_rslt[11:0] = ex2_far_add_sum_add2[11:0];
assign ex2_far_add_rd2_result[11:0]    = {12{ex2_act_add && ex2_far_add_rd2_inc1}} & ex2_far_add_rd2_inc1_rslt[11:0] |
                                         {12{ex2_act_add && ex2_far_add_rd2_inc0}} & ex2_far_add_rd2_inc0_rslt[11:0];

assign ex2_far_half_add_result[11:0]   = fadd_ex2_src_both_denorm || ex2_far_add_sum[11] ? ex2_far_add_rd2_result[11:0]
                                                                                         : ex2_far_add_rd1_result[11:0];
assign ex2_far_half_add_expnt[4:0]    = ex2_far_half_add_result[11] ? ex2_far_e_val_p[4:0]  
                                                                    : ex2_far_e_val_m[4:0];
                                                             
//subtraction pos1 round
// the tail is used to rounding 

// adder0 1.xxxxxxxx..,0
// adder1      xxxxxxx,x,ex2_f1_x_far
// sum              xx,x,xxxxx
// the result is 1.xxxx
assign ex2_far_sub_rd1_inc1_rne    = ex2_far_sub_sum[1] &&  ex2_far_sub_sum[0] && ~ex2_f1_x_far[10] && ~far_part_s;
assign ex2_far_sub_rd1_inc0_rne    = !ex2_far_sub_rd1_inc1_rne;
assign ex2_far_sub_rd1_dec1_rne    = 1'b0;
assign ex2_far_sub_rd1_inc1_rtz    = 1'b0;
assign ex2_far_sub_rd1_inc0_rtz    = !ex2_far_sub_rd1_dec1_rtz;
assign ex2_far_sub_rd1_dec1_rtz    = !ex2_far_sub_sum[0] && (ex2_f1_x_far[10] || far_part_s);
assign ex2_far_sub_rd1_inc1_rdn    =  ex2_far_sign && ex2_far_sub_sum[0];
assign ex2_far_sub_rd1_inc0_rdn    = !ex2_far_sign && (ex2_far_sub_sum[0] || ~ex2_f1_x_far[10] && ~far_part_s) ||
                                      ex2_far_sign && !ex2_far_sub_sum[0] ;
assign ex2_far_sub_rd1_dec1_rdn    =  !ex2_far_sub_rd1_inc1_rdn && !ex2_far_sub_rd1_inc0_rdn;
assign ex2_far_sub_rd1_inc1_rup    = !ex2_far_sign && ex2_far_sub_sum[0];
assign ex2_far_sub_rd1_inc0_rup    = ex2_far_sign && (ex2_far_sub_sum[0] || ~ex2_f1_x_far[10] && ~far_part_s) ||
                                     !ex2_far_sign && !ex2_far_sub_sum[0] ;
assign ex2_far_sub_rd1_dec1_rup    = !ex2_far_sub_rd1_inc1_rup && !ex2_far_sub_rd1_inc0_rup;
assign ex2_far_sub_rd1_inc1_rmm    = ex2_far_sub_sum[0] && ~ex2_f1_x_far[10] && ~far_part_s;
assign ex2_far_sub_rd1_inc0_rmm    = !ex2_far_sub_rd1_inc1_rmm;
assign ex2_far_sub_rd1_dec1_rmm    = 1'b0;

assign ex2_far_sub_rd1_inc1        = ex2_rm_rne && ex2_far_sub_rd1_inc1_rne || 
                                     ex2_rm_rtz && ex2_far_sub_rd1_inc1_rtz ||
                                     ex2_rm_rdn && ex2_far_sub_rd1_inc1_rdn ||
                                     ex2_rm_rup && ex2_far_sub_rd1_inc1_rup ||
                                     ex2_rm_rmm && ex2_far_sub_rd1_inc1_rmm;
assign ex2_far_sub_rd1_inc0        = ex2_rm_rne && ex2_far_sub_rd1_inc0_rne || 
                                     ex2_rm_rtz && ex2_far_sub_rd1_inc0_rtz ||
                                     ex2_rm_rdn && ex2_far_sub_rd1_inc0_rdn ||
                                     ex2_rm_rup && ex2_far_sub_rd1_inc0_rup ||
                                     ex2_rm_rmm && ex2_far_sub_rd1_inc0_rmm;
assign ex2_far_sub_rd1_dec1        = ex2_rm_rne && ex2_far_sub_rd1_dec1_rne || 
                                     ex2_rm_rtz && ex2_far_sub_rd1_dec1_rtz ||
                                     ex2_rm_rdn && ex2_far_sub_rd1_dec1_rdn ||
                                     ex2_rm_rup && ex2_far_sub_rd1_dec1_rup ||
                                     ex2_rm_rmm && ex2_far_sub_rd1_dec1_rmm;

assign ex2_far_sub_rd1_dec1_rslt[11:0] = ex2_far_sub_sum_sub1[11:0];
assign ex2_far_sub_rd1_inc0_rslt[11:0] = ex2_far_sub_sum[11:0];
assign ex2_far_sub_rd1_inc1_rslt[11:0] = ex2_far_sub_sum_add1[11:0];
assign ex2_far_sub_rd1_result[11:0]    = {12{!ex2_act_add && ex2_far_sub_rd1_inc1}} & ex2_far_sub_rd1_inc1_rslt[11:0] |
                                         {12{!ex2_act_add && ex2_far_sub_rd1_inc0}} & ex2_far_sub_rd1_inc0_rslt[11:0] |
                                         {12{!ex2_act_add && ex2_far_sub_rd1_dec1}} & ex2_far_sub_rd1_dec1_rslt[11:0];
                                                                                            

// adder0 1.xxxxxxxx.0,
// adder1      xxxxxxx,ex2_f1_x_far[11:0]
// sum             xxx,xxxxx
// the result is 0.1xxxxxx
assign ex2_far_sub_rd2_inc1_rne    = 1'b0;
assign ex2_far_sub_rd2_inc0_rne    = !ex2_far_sub_sum[0] && ex2_f1_x_far[10] && ~far_part_s ||
                                     !ex2_f1_x_far[10];
assign ex2_far_sub_rd2_dec1_rne    = !ex2_far_sub_rd2_inc0_rne;
assign ex2_far_sub_rd2_inc1_rtz    = 1'b0;
assign ex2_far_sub_rd2_inc0_rtz    = !ex2_far_sub_rd2_dec1_rtz;
assign ex2_far_sub_rd2_dec1_rtz    = (ex2_f1_x_far[10] || far_part_s);
assign ex2_far_sub_rd2_inc1_rdn    =  1'b0;
assign ex2_far_sub_rd2_inc0_rdn    = ex2_far_sign || ~ex2_f1_x_far[10] && ~far_part_s;
assign ex2_far_sub_rd2_dec1_rdn    = !ex2_far_sub_rd2_inc0_rdn;
assign ex2_far_sub_rd2_inc1_rup    = 1'b0;
assign ex2_far_sub_rd2_inc0_rup    = !ex2_far_sign || ~ex2_f1_x_far[10] && ~far_part_s;
assign ex2_far_sub_rd2_dec1_rup    = !ex2_far_sub_rd2_inc0_rup;
assign ex2_far_sub_rd2_inc1_rmm    = 1'b0;
assign ex2_far_sub_rd2_inc0_rmm    = !ex2_far_sub_rd2_dec1_rmm;
assign ex2_far_sub_rd2_dec1_rmm    =  ex2_f1_x_far[10] && far_part_s;

assign ex2_far_sub_rd2_inc1        = ex2_rm_rne && ex2_far_sub_rd2_inc1_rne || 
                                     ex2_rm_rtz && ex2_far_sub_rd2_inc1_rtz ||
                                     ex2_rm_rdn && ex2_far_sub_rd2_inc1_rdn ||
                                     ex2_rm_rup && ex2_far_sub_rd2_inc1_rup ||
                                     ex2_rm_rmm && ex2_far_sub_rd2_inc1_rmm;
assign ex2_far_sub_rd2_inc0        = ex2_rm_rne && ex2_far_sub_rd2_inc0_rne || 
                                     ex2_rm_rtz && ex2_far_sub_rd2_inc0_rtz ||
                                     ex2_rm_rdn && ex2_far_sub_rd2_inc0_rdn ||
                                     ex2_rm_rup && ex2_far_sub_rd2_inc0_rup ||
                                     ex2_rm_rmm && ex2_far_sub_rd2_inc0_rmm;
assign ex2_far_sub_rd2_dec1        = ex2_rm_rne && ex2_far_sub_rd2_dec1_rne || 
                                     ex2_rm_rtz && ex2_far_sub_rd2_dec1_rtz ||
                                     ex2_rm_rdn && ex2_far_sub_rd2_dec1_rdn ||
                                     ex2_rm_rup && ex2_far_sub_rd2_dec1_rup ||
                                     ex2_rm_rmm && ex2_far_sub_rd2_dec1_rmm;

assign ex2_far_sub_rd2_dec1_rslt[11:0] = ex2_far_sub_sum[0] ? {ex2_far_sub_sum[11:1],1'b0} 
                                                            : {ex2_far_sub_sum_sub1[11:1],1'b1};
assign ex2_far_sub_rd2_inc0_rslt[11:0] = ex2_far_sub_sum[11:0];
assign ex2_far_sub_rd2_inc1_rslt[11:0] = ex2_far_sub_sum[0] ? {ex2_far_sub_sum_add1[11:1],1'b0}
                                                            : {ex2_far_sub_sum[11:1],1'b1};
assign ex2_far_sub_rd2_result[11:0]    = {12{!ex2_act_add && ex2_far_sub_rd2_inc1}} & ex2_far_sub_rd2_inc1_rslt[11:0] |
                                         {12{!ex2_act_add && ex2_far_sub_rd2_inc0}} & ex2_far_sub_rd2_inc0_rslt[11:0] |
                                         {12{!ex2_act_add && ex2_far_sub_rd2_dec1}} & ex2_far_sub_rd2_dec1_rslt[11:0];
// there is a cornercase
// which the ex2_far_sub_sum is 1.000000000,and ex2_f_x_val is not zero, 
// in this case the round bit should be the second situation, even though 
// the ex2_far_sub_sum[11] is 1.

assign ex2_far_half_sub_result[11:0]   = ex2_far_sub_sum[11] && (ex2_far_sub_sum_sub1[11] || ex2_far_sub_sum[0]) ? ex2_far_sub_rd1_result[11:0]
                                                                                                                 : ex2_far_sub_rd2_result[11:0];

assign ex2_far_half_sub_expnt[4:0]    = ex2_far_half_sub_result[11] ? ex2_far_e_val_m[4:0]  
                                                                     : ex2_far_e_val_s[4:0];   

assign ex2_far_half_result_t[11:0]     = ex2_far_half_sub_result[11:0] |
                                         ex2_far_half_add_result[11:0];

assign ex2_far_half_result[10:0]       =  fadd_ex2_src_both_denorm || ex2_far_half_result_t[11] ? ex2_far_half_result_t[11:1]
                                                                      : ex2_far_half_result_t[10:0];

assign ex2_far_half_expnt[4:0]        = ex2_act_add ? ex2_far_half_add_expnt[4:0]
                                                     : ex2_far_half_sub_expnt[4:0];

assign ex2_far_e_val_s[4:0] =  ex2_src0_e[4:0] - 5'b1;
assign ex2_far_e_val_m[4:0] =  ex2_src0_e[4:0] ; 
assign ex2_far_e_val_p[4:0] =  ex2_src0_e[4:0] + 5'b1 ;

                         

assign ex2_far_sign  = ex2_act_s;

//Far Path Expt result
//ex2_far_of when emax && e need plus by 1
assign ex2_far_of = ex2_src0_emax && !ex2_src1_is_cnan && ex2_act_add && 
                    ex2_far_half_add_result[11];

//ex2_far_uf when e is zero, which will not happen in far path,
//dn+dn is exact,it will not cause uf
//assign ex2_far_uf = 1'b0;
//ex2_far_nx when uf/of/round bit not zero
//Far Path Special result

assign ex2_half_nor_nx = ((ex2_act_add && (ex2_f1_x_far[11]||ex2_far_add_sum[11]&&ex2_far_add_sum[0]) || 
                          !ex2_act_add && ex2_far_sub_sum[11] && ex2_far_sub_sum[0]) 
                         || |ex2_f1_x_far[10:0]);
assign ex2_far_nor_nx   = ex2_half_nor_nx;
assign ex2_far_nx = //ex2_far_uf || 
                    ex2_far_of ||
                   !ex2_src0_is_cnan &&
                   !ex2_src1_is_cnan &&
                   ex2_far_nor_nx;
//Far Path Special result
//ex2_far_r_is_lfn when ex2_far_of && not round INC1
assign ex2_far_r_is_lfn = ex2_far_of &&  ex2_far_lfn_sel;
//ex2_far_r_is_inf when ex2_far_of && not round INC1
assign ex2_far_r_is_inf = ex2_far_of && !ex2_far_lfn_sel;
//ex2_far_r_is_0 will never happen in far path
//assign ex2_far_r_is_0   = 1'b0;
//ex2_far_lfn_sel when 
//  1.rz           || 
//  2.rp && act_s  ||
//  3.rm && !act_s
assign ex2_far_lfn_sel = ex2_rm_rtz               || 
                         ex2_rm_rup &&  ex2_act_s || 
                         ex2_rm_rdn && !ex2_act_s;

//==========================================================
//                     EX2 CLOSE PATH
//==========================================================
//for denormal result,we should adust fraction according exponent:
assign ex2_close_dn_shift_pre[11:0] = ex2_close_sum[11:0];                                    
// &CombBeg; @1351
always @( ex2_close_dn_shift_pre[11:0]
       or ex2_src0_e[4:0])
begin
case(ex2_src0_e[4:0])
  5'd0 : ex2_close_dn_shift[10:0] = ex2_close_dn_shift_pre[11:1];
  5'd1 : ex2_close_dn_shift[10:0] = ex2_close_dn_shift_pre[11:1];
  5'd2 : ex2_close_dn_shift[10:0] = ex2_close_dn_shift_pre[10:0];
  5'd3 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[9:0],1'b0};
  5'd4 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[8:0],2'b0};
  5'd5 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[7:0],3'b0};
  5'd6 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[6:0],4'b0};
  5'd7 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[5:0],5'b0};
  5'd8 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[4:0],6'b0};
  5'd9 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[3:0],7'b0};
  5'd10 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[2:0],8'b0};
  5'd11 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[1:0],9'b0};
  5'd12 : ex2_close_dn_shift[10:0] = {ex2_close_dn_shift_pre[0],10'b0};
  default: ex2_close_dn_shift[10:0] = 11'b0;
endcase
// &CombEnd; @1368
end

//shift fraction according to exponent:
//1. src0_exp ==0, exponent is zero
//2. src0_exp>=1, shift fraction by exponen,and make exponent equal to 1
//note: dn result GRS will all equal to zero,so no rounding is necessory
assign ex2_close_dn_diff[5:0] = {1'b0,ex2_src0_e[4:0]} - {2'b0,fadd_ex2_close_ff1[3:0]};
assign ex2_close_dn_sel        = ex2_close_dn_diff[5] 
                              || (~|ex2_close_dn_diff[5:0])
                              || (~|ex2_close_dn_diff[5:1]) && ex2_close_dn_diff[0];
assign ex2_close_dn_e[4:0]    = (~|ex2_src0_e[4:0])  //src0 equal zer0
                               ? 5'b0
                               : {4'b0,ex2_close_dn_shift[10]}; 


//After rounding, The first 1 will appear on n+1,n,n-1,n-2 four location in total
//assign ex2_close_ff1_onehot_1[54:0] = {ex2_close_ff1_onehot[53:0],1'b0};
assign ex2_close_ff1_onehot_2[11:0] = {ex2_close_ff1_onehot[11:0]};


//e_result = e_bias + (+1/0/-1/-2) + ex2_close_ff1_e_adder1[11:0]
//assign ex2_close_ff1_e_adder0_1[11:0] = {1'b0,ex2_src0_e[10:0]} + 12'b1;
assign ex2_close_ff1_e_adder0_2[5:0] = ~|ex2_src0_e[4:0] ? 6'b1 : {1'b0,ex2_src0_e[4:0]};
assign ex2_close_ff1_e_adder0_3[5:0] = ~|ex2_src0_e[4:0] ? 6'b0 : {1'b0,ex2_src0_e[4:0]} - 5'b1;
assign ex2_close_ff1_e_adder0_4[5:0] = ~|ex2_src0_e[4:0] ? 6'b111111 : {1'b0,ex2_src0_e[4:0]} - 5'b10;

assign ex2_close_ff1_e_adder1[5:0] =  {6{ex2_close_ff1_onehot[11]}} & 6'b00_0000 | 
                                      {6{ex2_close_ff1_onehot[10]}}  & 6'b11_1111 | 
                                      {6{ex2_close_ff1_onehot[9]}}  & 6'b11_1110 | 
                                      {6{ex2_close_ff1_onehot[8]}}  & 6'b11_1101 | 
                                      {6{ex2_close_ff1_onehot[7]}}  & 6'b11_1100 | 
                                      {6{ex2_close_ff1_onehot[6]}}  & 6'b11_1011 | 
                                      {6{ex2_close_ff1_onehot[5]}}  & 6'b11_1010 | 
                                      {6{ex2_close_ff1_onehot[4]}}  & 6'b11_1001 | 
                                      {6{ex2_close_ff1_onehot[3]}}  & 6'b11_1000 | 
                                      {6{ex2_close_ff1_onehot[2]}}  & 6'b11_0111 | 
                                      {6{ex2_close_ff1_onehot[1]}}  & 6'b11_0110 |
                                      {6{ex2_close_ff1_onehot[0]}}  & 6'b11_0101;



//assign ex2_close_e_1[11:0] = ex2_close_ff1_e_adder0_1[11:0] + ex2_close_ff1_e_adder1[11:0];
assign ex2_close_e_2[5:0] = ex2_close_ff1_e_adder0_2[5:0] + ex2_close_ff1_e_adder1[5:0];
assign ex2_close_e_3[5:0] = ex2_close_ff1_e_adder0_3[5:0] + ex2_close_ff1_e_adder1[5:0];
assign ex2_close_e_4[5:0] = ex2_close_ff1_e_adder0_4[5:0] + ex2_close_ff1_e_adder1[5:0];

//Round prepare Logic
//  |MSB|... ...|LSB|Guard|Round|Sticky...|
//  L for LSB,    is the last valid bit
//  G for Guard,  is the first rounding bit
//  R for Round,  is the second rounding bit
//  S for Sticky, is logic or of rest rounding bit
//Close Path R and S bit always be zero
  
//assign ex2_close_r =  1'b0;
//assign ex2_close_s =  1'b0;

//Round Logic
//RNE : 
//  DEC1 When G && L
//  INC0 When other case
//Cornor case when r is 1p00..00 && g=1, final result should dec1
//R is 0p11..11
//RTZ : 
//  DEC1 When G
//  INC0 When other case
//RUP : 
//  DEC1 When acr_s && G
//  INC0 when other case
//RDN : 
//  DEC1 When !acr_s && G
//  INC0 When other case
//
assign ex2_close_l = ex2_close_sum[1];
assign ex2_close_sum_b0     = ex2_close_sum[0];
assign ex2_close_inc0_rne   = !ex2_close_dec1_rne;
assign ex2_close_dec1_rne   = ex2_close_sum[11] && ex2_close_l && ex2_close_sum_b0;

assign ex2_close_inc0_rtz  = 1'b1;
assign ex2_close_dec1_rtz  = 1'b0;

assign ex2_close_inc0_rup  = !ex2_close_dec1_rup;
assign ex2_close_dec1_rup  = !ex2_close_sign && ex2_close_sum[11] && ex2_close_sum_b0;

assign ex2_close_inc0_rdn  = !ex2_close_dec1_rdn;
assign ex2_close_dec1_rdn  =  ex2_close_sign && ex2_close_sum[11] && ex2_close_sum_b0;

assign ex2_close_inc0_rmm  = !ex2_close_dec1_rmm;
assign ex2_close_dec1_rmm  = ex2_close_sum[11] && ex2_close_sum_b0;


assign ex2_close_inc0    = ex2_rm_rne && ex2_close_inc0_rne || 
                           ex2_rm_rtz && ex2_close_inc0_rtz || 
                           ex2_rm_rup && ex2_close_inc0_rup || 
                           ex2_rm_rdn && ex2_close_inc0_rdn || 
                           ex2_rm_rmm && ex2_close_inc0_rmm;

assign ex2_close_dec1    = ex2_rm_rne && ex2_close_dec1_rne || 
                           ex2_rm_rtz && ex2_close_dec1_rtz || 
                           ex2_rm_rup && ex2_close_dec1_rup || 
                           ex2_rm_rdn && ex2_close_dec1_rdn || 
                           ex2_rm_rmm && ex2_close_dec1_rmm;

//According to FF1 Location to Get Result Fraction
//Because close path act_sub, G round bit must be 1
//Thus we shift "0" in to f_result
//ex2_close_f_p0
//&Instance("ct_fadd_onehot_sel_d","x_ct_fadd_onehot_sel_d_p0_1");
// //&Connect( @1476
// //         .onehot      (ex2_close_ff1_onehot_1[54:0]), @1477
// //         .data_in     (ex2_close_sum[54:0]), @1478
// //         .result      (ex2_close_f_1_p0[52:0]) @1479
// //        ); @1480
// &Instance("ct_fadd_onehot_sel_h","x_ct_fadd_onehot_sel_h_p0_2"); @1481
ct_fadd_onehot_sel_h  x_ct_fadd_onehot_sel_h_p0_2 (
  .data_in                (ex2_close_sum         ),
  .onehot                 (ex2_close_ff1_onehot_2),
  .result                 (ex2_close_f_2_p0      )
);

// &Connect( @1482
//          .onehot      (ex2_close_ff1_onehot_2), @1483
//          .data_in     (ex2_close_sum), @1484
//          .result      (ex2_close_f_2_p0) @1485
//         ); @1486
assign ex2_close_sft_f[10:0] = ex2_close_f_2_p0[11] ? ex2_close_f_2_p0[10:0] :
                               ex2_close_f_2_p0[10] ? {ex2_close_f_2_p0[9:0],1'b0}
                                                    : {ex2_close_f_2_p0[8:0],2'b0};
assign ex2_close_m1_f[9:0]  = ex2_close_sum_m1[10:1];
                               
assign ex2_close_f[9:0]     = {10{ex2_close_inc0}} & ex2_close_sft_f[10:1] |
                               {10{ex2_close_dec1}} & ex2_close_m1_f[9:0];
assign ex2_close_e[5:0]      = ex2_close_f_2_p0[11] ? ex2_close_e_2[5:0] :
                               ex2_close_f_2_p0[10] ? ex2_close_e_3[5:0] 
                                                    : ex2_close_e_4[5:0];  
//DN sub Zero, Special condition
//assign ex2_close_r_is_snm = ex2_src0_is_snm && ex2_src1_is_0 || 
//                            ex2_src1_is_snm && ex2_src0_is_0;
//Close Path Expt result
//ex2_close_of will never happen
//assign ex2_close_of = 1'b0;
//ex2_close_uf when e is zero or less than zero
//ex2_close_r_is_0 when (ed==0) && (src0_f == src1_f)
//ex2_close_nx when uf/of/round bit not zero
assign ex2_close_nx = ex2_close_sum[11] && ex2_close_sum[0] ;


//Far Path Special result
//ex2_close_r_is_lfn will never happen
//assign ex2_close_r_is_lfn = 1'b0;
//ex2_close_r_is_inf will never happen
//assign ex2_close_r_is_inf = 1'b0;
//ex2_close_r_is_inf when ex2_close_uf
assign ex2_close_r_is_0   = !fadd_ex2_close_ed1 &&
                             ex2_close_f_eq;
assign ex2_close_f_eq     = (ex2_src0_f[10:0] == ex2_src1_f[10:0]);
                            

//==========================================================
//                   EX2 Special Result
//=========================================================
//EX2_r_is_qNaN
//  1.src0_is_qnan || src1_is_qnan || 
//  2.(op_add || op_sub) && (src0_is_snan || src1_is_snan)
//  3.(op_add || op_sub) && (src0_is_inf  || src1_is_inf ) && 
//    !ex2_act_sub
assign ex2_r_is_qnan_a_src2 = (ex2_src0_is_snan || ex2_src1_is_snan) || 
                              (ex2_src0_is_qnan || ex2_src1_is_qnan) || 
                              (ex2_src0_is_inf  && ex2_src1_is_inf)  && ex2_act_sub||
                              ex2_r_sel_src2;
//EX2_r_is_INF
//  1.(src0_is_inf || src1_is_inf) && !qnan
//  2.bypass_inf
//  3.far_inf
//  4.close_inf(Never Happen)
assign ex2_r_is_inf  = ((ex2_src0_is_inf  || ex2_src1_is_inf)  && 
                      !(ex2_src0_is_qnan || ex2_src1_is_qnan) && 
                      !(ex2_src0_is_snan || ex2_src1_is_snan) && 
                      !((ex2_src0_is_inf && ex2_src1_is_inf)  && ex2_act_sub) || 
                       ex2_bypass_r_is_inf && ex2_bypass_sel || 
                       ex2_far_r_is_inf    && ex2_far_sel) && !ex2_r_sel_src2 && !ex2_op_sel;
//EX2_r_is_LFN
assign ex2_r_is_lfn  = (ex2_bypass_r_is_lfn && ex2_bypass_sel || 
                       ex2_far_r_is_lfn    && ex2_far_sel) && !ex2_r_sel_src2&& !ex2_op_sel;
//EX2_r_is_0
//  1.src0_is_0 && src1_is_0
//  2.sct_sub && src0_eq_src1(Only Close path will happen)
assign fadd_ex2_src_widden_both_denorm_add = 1'b0;

assign ex2_r_is_0    = (ex2_src0_is_0 && ex2_src1_is_0    || 
                       ex2_close_sel && ex2_close_r_is_0 && !fadd_ex2_src_widden_both_denorm_add) && 
                      !ex2_r_is_qnan_a_src2 && !ex2_op_sel;
//EX2_r_is_snm
//assign ex2_r_is_snm  = ex2_close_sel && ex2_close_r_is_snm && !ex2_r_is_qnan_a_src2;
//EX2_r_is_dn
//  1.close way E less or equal to zero
assign ex2_r_is_dn   = ex2_close_sel         &&
                       ex2_close_dn_sel      && 
                       !ex2_r_is_qnan_a_src2 &&
                       !ex2_close_r_is_0     && !ex2_op_sel;

//EX2_sign
assign ex2_sign      = ex2_bypass_sel && ex2_bypass_sign || 
                       ex2_close_sel  && ex2_close_sign  || 
                       ex2_far_sel    && ex2_far_sign;


//EX2_special Result
assign ex2_src0_is_cnan_org  = (ex2_src_change) ? ex2_src1_is_cnan : ex2_src0_is_cnan; 
assign ex2_src0_is_qnan_org  = (ex2_src_change) ? ex2_src1_is_qnan : ex2_src0_is_qnan;
assign ex2_src1_is_cnan_org  = (ex2_src_change) ? ex2_src0_is_cnan : ex2_src1_is_cnan; 
assign ex2_src1_is_qnan_org  = (ex2_src_change) ? ex2_src0_is_qnan : ex2_src1_is_qnan;
assign ex2_src0_qnan_f[8:0] = (ex2_src_change) ? ex2_src1_f[8:0] : ex2_src0_f[8:0];
assign ex2_src1_qnan_f[8:0] = (ex2_src_change) ? ex2_src0_f[8:0] : ex2_src1_f[8:0];
assign ex2_src0_qnan_s       = (ex2_src_change) ? ex2_src1_s : ex2_src0_s;
assign ex2_src1_qnan_s       = (ex2_src_change) ? ex2_src0_s : ex2_src1_s;
// &CombBeg; @1581
always @( ex2_src0_is_cnan_org
       or ex2_src1_qnan_f[8:0]
       or ex2_src1_is_qnan_org
       or ex2_src0_f[8:0]
       or ex2_src0_is_qnan_org
       or vfpu_yy_xx_dqnan
       or ex2_src0_is_snan
       or ex2_src0_qnan_f[8:0]
       or ex2_src1_is_cnan_org
       or ex2_src1_f[8:0]
       or ex2_src1_is_snan)
begin
if(ex2_src0_is_snan && vfpu_yy_xx_dqnan)
  ex2_qnan_f[9:0] = {1'b1,ex2_src0_f[8:0]};
else if(ex2_src1_is_snan && vfpu_yy_xx_dqnan)
  ex2_qnan_f[9:0] = {1'b1,ex2_src1_f[8:0]};
else if(ex2_src0_is_cnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_f[9:0] = {1'b1,9'b0};
else if(ex2_src0_is_qnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_f[9:0] = {1'b1,ex2_src0_qnan_f[8:0]};
else if(ex2_src1_is_cnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_f[9:0] = {1'b1,9'b0};
else if(ex2_src1_is_qnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_f[9:0] = {1'b1,ex2_src1_qnan_f[8:0]};
else
  ex2_qnan_f[9:0] = {1'b1,9'b0};
// &CombEnd; @1596
end
  
// &CombBeg; @1598
always @( ex2_src0_is_cnan_org
       or ex2_src1_is_qnan_org
       or ex2_src0_is_qnan_org
       or ex2_src0_s
       or vfpu_yy_xx_dqnan
       or ex2_src1_s
       or ex2_src0_is_snan
       or ex2_src1_is_cnan_org
       or ex2_src0_qnan_s
       or ex2_src1_qnan_s
       or ex2_src1_is_snan)
begin
if(ex2_src0_is_snan && vfpu_yy_xx_dqnan)
  ex2_qnan_s = ex2_src0_s;
else if(ex2_src1_is_snan && vfpu_yy_xx_dqnan)
  ex2_qnan_s = ex2_src1_s;
else if(ex2_src0_is_cnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_s = 1'b0;
else if(ex2_src0_is_qnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_s = ex2_src0_qnan_s;
else if(ex2_src1_is_cnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_s = 1'b0;
else if(ex2_src1_is_qnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_s = ex2_src1_qnan_s;
else
  ex2_qnan_s = 1'b0;
// &CombEnd; @1613
end


//Special Result Select Condition
assign ex2_spe_r_sel   = ex2_r_is_qnan_a_src2 || 
                         ex2_r_is_inf  || 
                         ex2_r_is_lfn  || 
                         //ex2_r_is_snm  || 
                         ex2_r_is_dn   || 
                         ex2_r_is_0;
assign ex2_r_0_sign    = ex2_op_add && 
                        ((ex2_src0_s && ex2_src1_s) || 
                         (ex2_src0_s || ex2_src1_s) && ex2_rm_rdn) || 
                         ex2_op_sub && 
                        ((ex2_src0_s && !ex2_src1_s) || 
                         (ex2_src0_s || !ex2_src1_s) && ex2_rm_rdn);

assign ex2_spe_r_qnan[15:0] = {ex2_qnan_s,{ 5{1'b1}}, ex2_qnan_f[9:0]};
assign ex2_spe_r_inf[15:0]  = {ex2_sign, { 5{1'b1}}, 10'b0};
assign ex2_spe_r_lfn[15:0]  = {ex2_sign, {{ 4{1'b1}},1'b0}, {10{1'b1}}};
//assign ex2_spe_r_snm[15:0]  = (ex2_src0_is_snm)
//                            ? { ex2_sign, 5'b1,  ex2_src0_f[9:0]}
//                            : { ex2_sign, 5'b1,  ex2_src1_f[9:0]};
assign ex2_spe_r_0[15:0]    = {ex2_r_0_sign, 15'b0};
assign ex2_spe_r_dn[15:0]   = {ex2_sign,ex2_close_dn_e[4:0],ex2_close_dn_shift[9:0]};

//Merge Special Result
// &CombBeg; @1640
always @( ex2_r_is_qnan_a_src2
       or ex2_spe_r_dn[15:0]
       or ex2_spe_r_0[15:0]
       or ex2_spe_r_lfn[15:0]
       or ex2_op_sel
       or ex2_spe_r_inf[15:0]
       or ex2_r_is_0
       or ex2_r_is_inf
       or ex2_qnan_a_src2_result[15:0]
       or ex2_r_is_dn
       or ex2_r_is_lfn)
begin
case({ex2_r_is_qnan_a_src2 || ex2_op_sel,ex2_r_is_inf,ex2_r_is_lfn,ex2_r_is_dn,ex2_r_is_0})
  5'b10000 : ex2_spe_result[15:0] = ex2_qnan_a_src2_result[15:0];
  5'b01000 : ex2_spe_result[15:0] = ex2_spe_r_inf[15:0];
  5'b00100 : ex2_spe_result[15:0] = ex2_spe_r_lfn[15:0];
  5'b00010 : ex2_spe_result[15:0] = ex2_spe_r_dn[15:0];
  5'b00001 : ex2_spe_result[15:0] = ex2_spe_r_0[15:0];
  default   : ex2_spe_result[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1649
end
assign ex2_r_sel_src2 = 1'b0;
assign ex2_qnan_a_src2_result[15:0] = ex2_op_sel     ? ex2_sel_result[15:0]: ex2_spe_r_qnan[15:0];
//EX2_normal Result
assign ex2_nor_r_bypass[15:0] = {ex2_sign, 
                                 ex2_bypass_e[ 4:0], ex2_bypass_f[9:0]};
assign ex2_nor_r_far[15:0]    = {ex2_sign,
                                 ex2_far_half_expnt[ 4:0], ex2_far_half_result[9:0]};
assign ex2_nor_r_close[15:0]  = {ex2_sign,ex2_close_e[ 4:0], ex2_close_f[9:0]};
               
// &CombBeg; @1666
always @( ex2_bypass_sel
       or ex2_close_sel
       or ex2_nor_r_far[15:0]
       or ex2_far_sel
       or ex2_nor_r_bypass[15:0]
       or ex2_nor_r_close[15:0])
begin
case({ex2_bypass_sel,ex2_far_sel,ex2_close_sel})
  3'b100  : ex2_nor_result[15:0] = ex2_nor_r_bypass[15:0];
  3'b010  : ex2_nor_result[15:0] = ex2_nor_r_far[15:0];
  3'b001  : ex2_nor_result[15:0] = ex2_nor_r_close[15:0];
  default : ex2_nor_result[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1673
end

//MAXNM/MINNM Result
//MAX & MIN Inst result should also obey flush mode
assign ex2_src0_e_fm[4:0] = ex2_src0_e[4:0];
assign ex2_src1_e_fm[4:0] = ex2_src1_e[4:0];
// &CombBeg; @1679
always @( ex2_qnan_s
       or ex2_sign
       or ex2_src_change
       or ex2_src1_is_0
       or ex2_qnan_f[9:0]
       or ex2_src0_s
       or ex2_src1_s
       or ex2_src0_e_fm[4:0]
       or ex2_src0_is_snan
       or ex2_src0_is_0
       or ex2_src1_e_fm[4:0]
       or ex2_src0_is_qnan
       or ex2_src0_f[9:0]
       or ex2_src1_is_snan
       or ex2_src1_f[9:0]
       or ex2_src1_is_qnan)
begin
if(ex2_src0_is_snan || ex2_src1_is_snan || 
   ex2_src0_is_qnan && ex2_src1_is_qnan)
ex2_max_nm_result[15:0] = { ex2_qnan_s, { 5{1'b1}}, ex2_qnan_f[9:0]};
else if(ex2_src0_is_0 && ex2_src1_is_0)
ex2_max_nm_result[15:0] = { {ex2_src0_s & ex2_src1_s}, { 5'b0}, 10'b0};
else if(ex2_src0_is_qnan)
ex2_max_nm_result[15:0] = { ex2_src1_s, ex2_src1_e_fm[4:0], ex2_src1_f[9:0]};
else if(ex2_src1_is_qnan)
ex2_max_nm_result[15:0] = { ex2_src0_s, ex2_src0_e_fm[4:0], ex2_src0_f[9:0]};                        
else if(ex2_sign ^ ex2_src_change)
ex2_max_nm_result[15:0] = { ex2_src1_s, ex2_src1_e_fm[ 4:0], ex2_src1_f[9:0]};
else //if(!ex2_sign ^ ex2_src_change)
ex2_max_nm_result[15:0] = { ex2_src0_s, ex2_src0_e_fm[ 4:0], ex2_src0_f[9:0]};                        
// &CombEnd; @1693
end

//MINNM
// &CombBeg; @1696
always @( ex2_qnan_s
       or ex2_sign
       or ex2_src_change
       or ex2_src1_is_0
       or ex2_qnan_f[9:0]
       or ex2_src0_s
       or ex2_src1_s
       or ex2_src0_e_fm[4:0]
       or ex2_src0_is_snan
       or ex2_src0_is_0
       or ex2_src1_e_fm[4:0]
       or ex2_src0_is_qnan
       or ex2_src0_f[9:0]
       or ex2_src1_is_snan
       or ex2_src1_f[9:0]
       or ex2_src1_is_qnan)
begin
if(ex2_src0_is_snan || ex2_src1_is_snan || 
   ex2_src0_is_qnan && ex2_src1_is_qnan)
ex2_min_nm_result[15:0] = { ex2_qnan_s, { 5{1'b1}}, ex2_qnan_f[9:0]};
else if(ex2_src0_is_0 && ex2_src1_is_0)
ex2_min_nm_result[15:0] = { {ex2_src0_s | ex2_src1_s}, { 5'b0}, 10'b0};
else if(ex2_src0_is_qnan)
ex2_min_nm_result[15:0] = { ex2_src1_s, ex2_src1_e_fm[4:0], ex2_src1_f[9:0]};
else if(ex2_src1_is_qnan)
ex2_min_nm_result[15:0] = { ex2_src0_s, ex2_src0_e_fm[4:0], ex2_src0_f[9:0]};                        
else if(!ex2_sign ^ ex2_src_change)
ex2_min_nm_result[15:0] = { ex2_src1_s, ex2_src1_e_fm[4:0], ex2_src1_f[9:0]};
else //if(ex2_sign ^ ex2_src_change)
ex2_min_nm_result[15:0] = { ex2_src0_s, ex2_src0_e_fm[4:0], ex2_src0_f[9:0]};                        
// &CombEnd; @1710
end
  
//EX2_cmp Result
//assign ex2_src0_eq_src1 = ex2_close_src_eq;
//assign ex2_cmp_nv       = (ex2_src0_is_snan || ex2_src1_is_snan) || 
//                          (ex2_src0_is_qnan || ex2_src1_is_qnan);
//
//
//assign ex2_cmp_feq  = !ex2_src0_is_snan && 
//                      !ex2_src1_is_snan &&  
//                      !ex2_src0_is_qnan && 
//                      !ex2_src1_is_qnan &&
//                      ex2_src0_eq_src1;
//assign ex2_cmp_fne  = !ex2_src0_is_snan && 
//                      !ex2_src1_is_snan &&  
//                      !ex2_src0_is_qnan && 
//                      !ex2_src1_is_qnan &&
//                      !ex2_src0_eq_src1;
//assign ex2_cmp_ford = !ex2_src0_is_snan && 
//                      !ex2_src1_is_snan &&  
//                      !ex2_src0_is_qnan && 
//                      !ex2_src1_is_qnan;
//assign ex2_cmp_fle  = (ex2_sign || ex2_src0_eq_src1) && !ex2_cmp_nv;
//
//assign ex2_cmp_flt  = (ex2_sign && !ex2_src0_eq_src1) && 
//                      !ex2_cmp_nv;
//
////Merge Final C Result
//assign ex2_cmp_result = ex2_op_feq && ex2_cmp_feq || 
//                        ex2_op_fle && ex2_cmp_fle || 
//                        ex2_op_flt && ex2_cmp_flt ||
//                        ex2_op_fne && ex2_cmp_fne ||
//                        ex2_op_ford&& ex2_cmp_ford;
// for the unorder reduction add operation , 
// we will select the result when one of the operand is masked off
// &CombBeg; @1746
// &CombEnd; @1751
assign ex2_sel_result[15:0] = {16{ex2_op_maxnm}} & ex2_max_nm_result[15:0] | 
                              {16{ex2_op_minnm}} & ex2_min_nm_result[15:0] |
                              {16{ex2_op_cmp}}   & {15'b0,ex2_cmp_result};
assign ex2_op_sel       = ex2_op_maxnm || ex2_op_minnm || ex2_op_cmp; 
assign ex2_unord_sel    = 1'b0;
assign ex2_unorder_nv = 1'b0;
assign ex2_final_r_spe  = ex2_spe_r_sel || ex2_op_sel;
assign ex2_final_r_nor  = !ex2_spe_r_sel && !ex2_op_sel;
//EX2 Result Sel Onehot Signal
//assign ex2_final_r_cmp  =  ex2_op_sel;

//==========================================================
//                        EX2 Expt                          
//==========================================================
//ex2_expt_nv
//  1.Add/Sub Operation
//    src0_is_snan || src1_is_snan        || 
//    src0_is_inf  && src1_is_inf && act_sub
//  2.CMP/CMPZ
//    src0_is_snan || src1_is_snan        ||
//    (src0_is_qnan || src1_is_qnan) && (op_cmp || op_cmpz) && (!cmp_not_eq)
assign ex2_unord_nv = ex2_unorder_nv;
assign ex2_expt_nv = ((ex2_src0_is_snan || ex2_src1_is_snan) || 
                     (ex2_op_add || ex2_op_sub) && 
                     (ex2_src0_is_inf && ex2_src1_is_inf) && 
                     (ex2_act_sub)                      || 
                     (ex2_op_fle || ex2_op_flt) && 
                     (ex2_src0_is_qnan || ex2_src1_is_qnan)) && !ex2_unord_sel || ex2_unord_nv; 

//ex2_expt_nx
//  1.ex2_uf                              || 
//  2.ex2_of                              || 
//  3.round bit not zero || 1xpxxx make tail 1 lose
assign ex2_expt_nx = ((ex2_bypass_nx && ex2_bypass_sel || 
                      ex2_close_nx  && ex2_close_sel  || 
                      ex2_far_nx    && ex2_far_sel    || 
                      ex2_expt_of)  && 
                     !ex2_r_is_qnan_a_src2 && 
                     !ex2_src0_is_inf && !ex2_src1_is_inf) && !ex2_unord_sel;

//ex2_expt_of
//  1.E result add to all 1
assign ex2_expt_of = ((ex2_bypass_of && ex2_bypass_sel || 
                      ex2_far_of    && ex2_far_sel)   && 
                     !ex2_r_is_qnan_a_src2) && !ex2_unord_sel;

//Merge expt
assign ex2_expt_pre[4:0] = {ex2_expt_nv,
                            1'b0, //dz
                            ex2_expt_of,
                            1'b0,
                            ex2_expt_nx};
assign ex2_nor_expt[4:0]     = ex2_expt_pre[4:0]            &
                           {2'b11,{3{~ex2_op_sel}}}     &
                           {2'b11,{3{~ex2_op_cmp}}};

//======================Pipe to EX3=========================
//gate clk
// &Instance("gated_clk_cell","x_ex2_pipe_clk"); @1843
gated_clk_cell  x_ex2_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @1844
//           .clk_out        (ex2_pipe_clk),//Out Clock @1845
//           .external_en    (1'b0), @1846
//           .global_en      (cp0_yy_clk_en), @1847
//           .local_en       (ex2_pipe_clk_en),//Local Condition @1848
//           .module_en      (cp0_vfpu_icg_en) @1849
//         ); @1850
assign ex2_pipe_clk_en = ex2_pipedown;
assign ex2_spe_result_f[15:0] = {ex2_spe_result[15:0]};
assign ex2_nor_result_f[15:0] = {ex2_nor_result[15:0]};
assign ex2_expt[4:0]   = ex2_nor_expt[4:0];
always @(posedge ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    fadd_ex3_r_spe              <=  1'b0;
    fadd_ex3_r_nor              <=  1'b0;
    fadd_ex3_spe_result_l[15:0] <= 16'b0;
    fadd_ex3_nor_result_l[15:0] <= 16'b0;    
    fadd_ex3_expt[4:0]          <=  5'b0;
  end
  else if(ex2_pipedown)
  begin
    fadd_ex3_r_spe              <= ex2_final_r_spe;
    fadd_ex3_r_nor              <= ex2_final_r_nor;    
    fadd_ex3_spe_result_l[15:0] <= ex2_spe_result_f[15:0];
    fadd_ex3_nor_result_l[15:0] <= ex2_nor_result_f[15:0];
    fadd_ex3_expt[4:0]          <= ex2_expt[4:0];
  end
  else
  begin
    fadd_ex3_r_spe              <= fadd_ex3_r_spe;
    fadd_ex3_r_nor              <= fadd_ex3_r_nor;     
    fadd_ex3_spe_result_l[15:0] <= fadd_ex3_spe_result_l[15:0];
    fadd_ex3_nor_result_l[15:0] <= fadd_ex3_nor_result_l[15:0];
    fadd_ex3_expt[4:0]          <= fadd_ex3_expt[4:0];
  end
end
assign fadd_ex3_spe_result[15:0] = {fadd_ex3_spe_result_l[15:0]};
assign fadd_ex3_nor_result[15:0] = {fadd_ex3_nor_result_l[15:0]};

// &CombBeg; @1889
always @( fadd_ex3_nor_result[15:0]
       or fadd_ex3_spe_result[15:0]
       or fadd_ex3_r_spe
       or fadd_ex3_r_nor)
begin
case({fadd_ex3_r_spe,fadd_ex3_r_nor})
  2'b10  : ex3_result[15:0] = fadd_ex3_spe_result[15:0];
  2'b01  : ex3_result[15:0] = fadd_ex3_nor_result[15:0];
  default : ex3_result[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1895
end

assign ex3_expt[4:0]     = fadd_ex3_expt[4:0];

// &Force("output","ex3_expt"); @1899


// &Instance("gated_clk_cell","x_ex2_widden_pipe_clk"); @1903
// &Connect( .clk_in         (forever_cpuclk), @1904
//           .clk_out        (ex2_widden_pipe_clk),//Out Clock @1905
//           .external_en    (1'b0), @1906
//           .global_en      (cp0_yy_clk_en), @1907
//           .local_en       (ex2_widden_pipe_clk_en),//Local Condition @1908
//           .module_en      (cp0_vfpu_icg_en) @1909
//         ); @1910
// &ModuleEnd; @2011
endmodule



