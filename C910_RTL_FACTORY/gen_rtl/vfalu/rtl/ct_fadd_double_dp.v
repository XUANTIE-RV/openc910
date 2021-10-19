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
module ct_fadd_double_dp(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ex1_as_double,
  ex1_as_single,
  ex1_cmp_result,
  ex1_double,
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
  ex1_single,
  ex2_double,
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
  ex2_single,
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
input           ex1_as_double;                  
input           ex1_as_single;                  
input           ex1_double;                     
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
input           ex1_single;                     
input           ex2_double;                     
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
input           ex2_single;                     
input   [63:0]  fadd_ctrl_src0;                 
input   [63:0]  fadd_ctrl_src1;                 
input           forever_cpuclk;                 
input           pad_yy_icg_scan_en;             
input           vfpu_yy_xx_dqnan;               
output          ex1_cmp_result;                 
output  [4 :0]  ex3_expt;                       
output  [63:0]  ex3_result;                     

// &Regs; @24
reg     [52:0]  ex1_f1_v_nm;                    
reg     [52:0]  ex1_f1_v_nm_pre;                
reg     [53:0]  ex1_f1_x_nm;                    
reg     [53:0]  ex1_f1_x_nm_pre;                
reg     [10:0]  ex1_src0_e;                     
reg     [52:0]  ex1_src0_f;                     
reg     [52:0]  ex1_src0_f_4ex2;                
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
reg     [10:0]  ex1_src1_e;                     
reg     [52:0]  ex1_src1_f;                     
reg     [52:0]  ex1_src1_f_4ex2;                
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
reg     [10:0]  ex2_bypass_e;                   
reg     [51:0]  ex2_bypass_f;                   
reg     [52:0]  ex2_close_dn_shift;             
reg     [63:0]  ex2_max_nm_result;              
reg     [63:0]  ex2_min_nm_result;              
reg     [63:0]  ex2_nor_result;                 
reg     [51:0]  ex2_qnan_f;                     
reg             ex2_qnan_s;                     
reg     [63:0]  ex2_spe_result;                 
reg     [63:0]  ex3_result;                     
reg             fadd_ex2_act_add;               
reg             fadd_ex2_act_s;                 
reg             fadd_ex2_act_sub;               
reg             fadd_ex2_bypass_sel;            
reg     [5 :0]  fadd_ex2_close_ff1;             
reg     [53:0]  fadd_ex2_close_ff1_onehot;      
reg             fadd_ex2_close_sel;             
reg             fadd_ex2_close_sign;            
reg     [53:0]  fadd_ex2_close_sum;             
reg             fadd_ex2_cmp_result;            
reg             fadd_ex2_ed_is_1;               
reg     [53:0]  fadd_ex2_f1_x_far;              
reg     [54:0]  fadd_ex2_far_adder0;            
reg     [54:0]  fadd_ex2_far_adder1;            
reg     [11:0]  fadd_ex2_src0_e;                
reg     [52:0]  fadd_ex2_src0_f;                
reg     [8 :0]  fadd_ex2_src0_is;               
reg             fadd_ex2_src0_s;                
reg     [11:0]  fadd_ex2_src1_e;                
reg     [52:0]  fadd_ex2_src1_f;                
reg     [8 :0]  fadd_ex2_src1_is;               
reg             fadd_ex2_src1_s;                
reg             fadd_ex2_src_both_denorm;       
reg             fadd_ex2_src_change;            
reg     [4 :0]  fadd_ex3_expt;                  
reg     [63:0]  fadd_ex3_nor_result;            
reg             fadd_ex3_r_nor;                 
reg             fadd_ex3_r_spe;                 
reg     [63:0]  fadd_ex3_spe_result;            

// &Wires; @25
wire    [53:0]  close_add1_oper2;               
wire            cp0_vfpu_icg_en;                
wire            cp0_yy_clk_en;                  
wire            cpurst_b;                       
wire    [11:0]  double_e_contrary_diff;         
wire    [11:0]  double_e_diff;                  
wire    [11:0]  double_pos_e_d;                 
wire    [10:0]  ea;                             
wire            ea_gt_0;                        
wire            ea_is_0;                        
wire            ea_is_1;                        
wire            ea_is_lfn;                      
wire            ea_is_nan_inf;                  
wire            ea_is_norm;                     
wire            ea_lt_nan_inf;                  
wire    [10:0]  eb;                             
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
wire            ex1_as_double;                  
wire            ex1_as_single;                  
wire            ex1_bypass_sel;                 
wire    [52:0]  ex1_close_adder0_s0;            
wire    [53:0]  ex1_close_adder0_s1_a;          
wire    [53:0]  ex1_close_adder0_s1_b;          
wire    [52:0]  ex1_close_adder1_s0;            
wire    [53:0]  ex1_close_adder1_s1_a;          
wire    [53:0]  ex1_close_adder1_s1_b;          
wire            ex1_close_f_eq;                 
wire    [5 :0]  ex1_close_ff1;                  
wire    [53:0]  ex1_close_ff1_onehot;           
wire    [53:0]  ex1_close_ff1_onehot_s0;        
wire    [53:0]  ex1_close_ff1_onehot_s1;        
wire    [53:0]  ex1_close_ff1_onehot_s1_a;      
wire    [53:0]  ex1_close_ff1_onehot_s1_b;      
wire    [5 :0]  ex1_close_ff1_s0;               
wire    [5 :0]  ex1_close_ff1_s1;               
wire    [5 :0]  ex1_close_ff1_s1_a;             
wire    [5 :0]  ex1_close_ff1_s1_b;             
wire    [52:0]  ex1_close_norm_ff1_onehot_s0;   
wire    [53:0]  ex1_close_norm_ff1_onehot_s1;   
wire    [5 :0]  ex1_close_norm_ff1_s0;          
wire    [5 :0]  ex1_close_norm_ff1_s1;          
wire            ex1_close_norm_op_chg_s0;       
wire    [52:0]  ex1_close_norm_sum_s0;          
wire    [53:0]  ex1_close_norm_sum_s1;          
wire            ex1_close_op_chg_s0;            
wire            ex1_close_op_chg_s1_a;          
wire            ex1_close_op_chg_s1_b;          
wire            ex1_close_sel;                  
wire            ex1_close_shift;                
wire            ex1_close_sign;                 
wire    [53:0]  ex1_close_sum;                  
wire    [53:0]  ex1_close_sum_s0;               
wire    [52:0]  ex1_close_sum_s0_a_b;           
wire    [52:0]  ex1_close_sum_s0_b_a;           
wire    [53:0]  ex1_close_sum_s1;               
wire    [53:0]  ex1_close_sum_s1_a;             
wire    [53:0]  ex1_close_sum_s1_b;             
wire            ex1_cmp_feq;                    
wire            ex1_cmp_fle;                    
wire            ex1_cmp_flt;                    
wire            ex1_cmp_fne;                    
wire            ex1_cmp_ford;                   
wire            ex1_cmp_nv;                     
wire            ex1_cmp_result;                 
wire            ex1_cmp_sel;                    
wire            ex1_cmp_sub;                    
wire            ex1_double;                     
wire            ex1_e_eq;                       
wire    [10:0]  ex1_ed;                         
wire            ex1_ed_gt_25s_54d;              
wire            ex1_ed_gt_26s_55d;              
wire            ex1_ed_is_1;                    
wire            ex1_ed_lt_2;                    
wire            ex1_es;                         
wire    [52:0]  ex1_f1_v_far;                   
wire    [53:0]  ex1_f1_x_far;                   
wire            ex1_f_eq;                       
wire    [54:0]  ex1_far_adder0;                 
wire    [54:0]  ex1_far_adder1;                 
wire            ex1_nor_es;                     
wire    [52:0]  ex1_norm_close_adder0_s0;       
wire    [53:0]  ex1_norm_close_adder0_s1_a;     
wire    [53:0]  ex1_norm_close_adder0_s1_b;     
wire    [52:0]  ex1_norm_close_adder1_s0;       
wire    [53:0]  ex1_norm_close_adder1_s1_a;     
wire    [53:0]  ex1_norm_close_adder1_s1_b;     
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
wire            ex1_single;                     
wire    [11:0]  ex1_src0_e_final;               
wire            ex1_src0_eq_0;                  
wire            ex1_src0_eq_src1;               
wire    [8 :0]  ex1_src0_is;                    
wire    [11:0]  ex1_src1_e_final;               
wire            ex1_src1_eq_0;                  
wire    [8 :0]  ex1_src1_is;                    
wire            ex1_src_both_denorm;            
wire            ex2_act_add;                    
wire            ex2_act_s;                      
wire            ex2_act_sub;                    
wire            ex2_bypass_dec1;                
wire    [51:0]  ex2_bypass_f_1p0_n_dec;         
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
wire    [11:0]  ex2_close_dn_diff;              
wire    [10:0]  ex2_close_dn_e;                 
wire            ex2_close_dn_sel;               
wire            ex2_close_dn_sel_nor;           
wire    [53:0]  ex2_close_dn_shift_pre;         
wire    [11:0]  ex2_close_e;                    
wire    [11:0]  ex2_close_e_2;                  
wire    [11:0]  ex2_close_e_3;                  
wire    [11:0]  ex2_close_e_4;                  
wire    [51:0]  ex2_close_f;                    
wire    [53:0]  ex2_close_f_2_p0;               
wire            ex2_close_f_eq;                 
wire    [11:0]  ex2_close_ff1_e_adder0_2;       
wire    [11:0]  ex2_close_ff1_e_adder0_3;       
wire    [11:0]  ex2_close_ff1_e_adder0_4;       
wire    [11:0]  ex2_close_ff1_e_adder1;         
wire    [53:0]  ex2_close_ff1_onehot;           
wire            ex2_close_inc0;                 
wire            ex2_close_inc0_rdn;             
wire            ex2_close_inc0_rmm;             
wire            ex2_close_inc0_rne;             
wire            ex2_close_inc0_rtz;             
wire            ex2_close_inc0_rup;             
wire            ex2_close_l;                    
wire    [51:0]  ex2_close_m1_f;                 
wire            ex2_close_nx;                   
wire            ex2_close_r_is_0;               
wire            ex2_close_sel;                  
wire    [51:0]  ex2_close_sft_f;                
wire            ex2_close_sign;                 
wire    [53:0]  ex2_close_sum;                  
wire            ex2_close_sum_b0;               
wire    [53:0]  ex2_close_sum_m1;               
wire            ex2_cmp_result;                 
wire            ex2_double;                     
wire            ex2_double_nor_nx;              
wire    [4 :0]  ex2_expt;                       
wire            ex2_expt_nv;                    
wire            ex2_expt_nx;                    
wire            ex2_expt_of;                    
wire    [4 :0]  ex2_expt_pre;                   
wire    [53:0]  ex2_f1_x_far;                   
wire            ex2_far_add_rd1_inc0;           
wire            ex2_far_add_rd1_inc0_rdn;       
wire            ex2_far_add_rd1_inc0_rmm;       
wire            ex2_far_add_rd1_inc0_rne;       
wire    [53:0]  ex2_far_add_rd1_inc0_rslt;      
wire            ex2_far_add_rd1_inc0_rtz;       
wire            ex2_far_add_rd1_inc0_rup;       
wire            ex2_far_add_rd1_inc1;           
wire            ex2_far_add_rd1_inc1_rdn;       
wire            ex2_far_add_rd1_inc1_rmm;       
wire            ex2_far_add_rd1_inc1_rne;       
wire    [53:0]  ex2_far_add_rd1_inc1_rslt;      
wire            ex2_far_add_rd1_inc1_rtz;       
wire            ex2_far_add_rd1_inc1_rup;       
wire    [53:0]  ex2_far_add_rd1_result;         
wire            ex2_far_add_rd2_inc0;           
wire            ex2_far_add_rd2_inc0_rdn;       
wire            ex2_far_add_rd2_inc0_rmm;       
wire            ex2_far_add_rd2_inc0_rne;       
wire    [53:0]  ex2_far_add_rd2_inc0_rslt;      
wire            ex2_far_add_rd2_inc0_rtz;       
wire            ex2_far_add_rd2_inc0_rup;       
wire            ex2_far_add_rd2_inc1;           
wire            ex2_far_add_rd2_inc1_rdn;       
wire            ex2_far_add_rd2_inc1_rmm;       
wire            ex2_far_add_rd2_inc1_rne;       
wire    [53:0]  ex2_far_add_rd2_inc1_rslt;      
wire            ex2_far_add_rd2_inc1_rtz;       
wire            ex2_far_add_rd2_inc1_rup;       
wire    [53:0]  ex2_far_add_rd2_result;         
wire    [53:0]  ex2_far_add_sum;                
wire    [53:0]  ex2_far_add_sum_add2;           
wire    [54:0]  ex2_far_adder0;                 
wire    [54:0]  ex2_far_adder1;                 
wire    [10:0]  ex2_far_doub_add_expnt;         
wire    [53:0]  ex2_far_doub_add_result;        
wire    [10:0]  ex2_far_doub_expnt;             
wire    [52:0]  ex2_far_doub_result;            
wire    [53:0]  ex2_far_doub_result_t;          
wire    [10:0]  ex2_far_doub_sub_expnt;         
wire    [53:0]  ex2_far_doub_sub_result;        
wire    [11:0]  ex2_far_e_val_m;                
wire    [11:0]  ex2_far_e_val_p;                
wire    [11:0]  ex2_far_e_val_s;                
wire            ex2_far_lfn_sel;                
wire            ex2_far_nx;                     
wire            ex2_far_of;                     
wire            ex2_far_r_is_inf;               
wire            ex2_far_r_is_lfn;               
wire            ex2_far_sel;                    
wire            ex2_far_sign;                   
wire    [10:0]  ex2_far_sing_add_expnt;         
wire    [24:0]  ex2_far_sing_add_result;        
wire    [10:0]  ex2_far_sing_expnt;             
wire    [23:0]  ex2_far_sing_result;            
wire    [24:0]  ex2_far_sing_result_t;          
wire    [10:0]  ex2_far_sing_sub_expnt;         
wire    [24:0]  ex2_far_sing_sub_result;        
wire            ex2_far_sub_rd1_dec1;           
wire            ex2_far_sub_rd1_dec1_rdn;       
wire            ex2_far_sub_rd1_dec1_rmm;       
wire            ex2_far_sub_rd1_dec1_rne;       
wire    [53:0]  ex2_far_sub_rd1_dec1_rslt;      
wire            ex2_far_sub_rd1_dec1_rtz;       
wire            ex2_far_sub_rd1_dec1_rup;       
wire            ex2_far_sub_rd1_inc0;           
wire            ex2_far_sub_rd1_inc0_rdn;       
wire            ex2_far_sub_rd1_inc0_rmm;       
wire            ex2_far_sub_rd1_inc0_rne;       
wire    [53:0]  ex2_far_sub_rd1_inc0_rslt;      
wire            ex2_far_sub_rd1_inc0_rtz;       
wire            ex2_far_sub_rd1_inc0_rup;       
wire            ex2_far_sub_rd1_inc1;           
wire            ex2_far_sub_rd1_inc1_rdn;       
wire            ex2_far_sub_rd1_inc1_rmm;       
wire            ex2_far_sub_rd1_inc1_rne;       
wire    [53:0]  ex2_far_sub_rd1_inc1_rslt;      
wire            ex2_far_sub_rd1_inc1_rtz;       
wire            ex2_far_sub_rd1_inc1_rup;       
wire    [53:0]  ex2_far_sub_rd1_result;         
wire            ex2_far_sub_rd2_dec1;           
wire            ex2_far_sub_rd2_dec1_rdn;       
wire            ex2_far_sub_rd2_dec1_rmm;       
wire            ex2_far_sub_rd2_dec1_rne;       
wire    [53:0]  ex2_far_sub_rd2_dec1_rslt;      
wire            ex2_far_sub_rd2_dec1_rtz;       
wire            ex2_far_sub_rd2_dec1_rup;       
wire            ex2_far_sub_rd2_inc0;           
wire            ex2_far_sub_rd2_inc0_rdn;       
wire            ex2_far_sub_rd2_inc0_rmm;       
wire            ex2_far_sub_rd2_inc0_rne;       
wire    [53:0]  ex2_far_sub_rd2_inc0_rslt;      
wire            ex2_far_sub_rd2_inc0_rtz;       
wire            ex2_far_sub_rd2_inc0_rup;       
wire            ex2_far_sub_rd2_inc1;           
wire            ex2_far_sub_rd2_inc1_rdn;       
wire            ex2_far_sub_rd2_inc1_rmm;       
wire            ex2_far_sub_rd2_inc1_rne;       
wire    [53:0]  ex2_far_sub_rd2_inc1_rslt;      
wire            ex2_far_sub_rd2_inc1_rtz;       
wire            ex2_far_sub_rd2_inc1_rup;       
wire    [53:0]  ex2_far_sub_rd2_result;         
wire    [53:0]  ex2_far_sub_sum;                
wire    [53:0]  ex2_far_sub_sum_add1;           
wire    [53:0]  ex2_far_sub_sum_sub1;           
wire            ex2_final_r_nor;                
wire            ex2_final_r_spe;                
wire    [63:0]  ex2_nor_r_bypass;               
wire    [63:0]  ex2_nor_r_close;                
wire    [63:0]  ex2_nor_r_far;                  
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
wire    [63:0]  ex2_qnan_a_src2_result;         
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
wire    [63:0]  ex2_sel_result;                 
wire            ex2_sign;                       
wire            ex2_single;                     
wire            ex2_single_nor_nx;              
wire    [63:0]  ex2_spe_r_0;                    
wire    [63:0]  ex2_spe_r_dn;                   
wire    [63:0]  ex2_spe_r_inf;                  
wire    [63:0]  ex2_spe_r_lfn;                  
wire    [63:0]  ex2_spe_r_qnan;                 
wire            ex2_spe_r_sel;                  
wire    [11:0]  ex2_src0_e;                     
wire    [10:0]  ex2_src0_e_fm;                  
wire            ex2_src0_emax;                  
wire    [52:0]  ex2_src0_f;                     
wire            ex2_src0_f_1p0_0;               
wire            ex2_src0_f_1p1_1;               
wire            ex2_src0_is_0;                  
wire            ex2_src0_is_cnan;               
wire            ex2_src0_is_cnan_org;           
wire            ex2_src0_is_dn;                 
wire            ex2_src0_is_inf;                
wire            ex2_src0_is_qnan;               
wire            ex2_src0_is_qnan_org;           
wire            ex2_src0_is_snan;               
wire    [50:0]  ex2_src0_qnan_f;                
wire            ex2_src0_qnan_s;                
wire            ex2_src0_s;                     
wire    [11:0]  ex2_src1_e;                     
wire    [10:0]  ex2_src1_e_fm;                  
wire    [52:0]  ex2_src1_f;                     
wire            ex2_src1_is_0;                  
wire            ex2_src1_is_cnan;               
wire            ex2_src1_is_cnan_org;           
wire            ex2_src1_is_inf;                
wire            ex2_src1_is_qnan;               
wire            ex2_src1_is_qnan_org;           
wire            ex2_src1_is_snan;               
wire    [50:0]  ex2_src1_qnan_f;                
wire            ex2_src1_qnan_s;                
wire            ex2_src1_s;                     
wire            ex2_src_change;                 
wire            ex2_unord_nv;                   
wire            ex2_unord_sel;                  
wire            ex2_unorder_nv;                 
wire    [4 :0]  ex3_expt;                       
wire    [51:0]  fa;                             
wire            fa_gt_0;                        
wire            fa_is_0;                        
wire            fa_is_all_1;                    
wire            fa_msb_is_1;                    
wire    [52:0]  fa_nm;                          
wire    [52:0]  fa_nm_4ex2;                     
wire    [63:0]  fadd_ctrl_src0;                 
wire    [63:0]  fadd_ctrl_src1;                 
wire            far_part_s;                     
wire    [51:0]  fb;                             
wire            fb_gt_0;                        
wire            fb_is_0;                        
wire            fb_is_all_1;                    
wire            fb_msb_is_1;                    
wire    [52:0]  fb_nm;                          
wire    [52:0]  fb_nm_4ex2;                     
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
wire    [8 :0]  single_e_contrary_diff;         
wire    [8 :0]  single_e_diff;                  
wire    [8 :0]  single_pos_e_d;                 
wire            vfpu_yy_xx_dqnan;               
wire    [10:0]  widden_merge_ea;                
wire    [10:0]  widden_merge_eb;                
wire            widden_merge_opa_is_0;          
wire            widden_merge_opa_is_cnan;       
wire            widden_merge_opa_is_dn;         
wire            widden_merge_opa_is_dn_no_flush; 
wire            widden_merge_opa_is_inf;        
wire            widden_merge_opa_is_lfn;        
wire            widden_merge_opa_is_nan;        
wire            widden_merge_opa_is_nm;         
wire            widden_merge_opa_is_qnan;       
wire            widden_merge_opa_is_snan;       
wire            widden_merge_opa_is_snm;        
wire            widden_merge_opb_is_0;          
wire            widden_merge_opb_is_cnan;       
wire            widden_merge_opb_is_dn;         
wire            widden_merge_opb_is_dn_no_flush; 
wire            widden_merge_opb_is_inf;        
wire            widden_merge_opb_is_lfn;        
wire            widden_merge_opb_is_nan;        
wire            widden_merge_opb_is_nm;         
wire            widden_merge_opb_is_qnan;       
wire            widden_merge_opb_is_snan;       
wire            widden_merge_opb_is_snm;        
wire            widden_merge_sa;                
wire            widden_merge_sb;                

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

//===============Single and Double Merge====================
assign sa       = (ex1_double) 
                ? fadd_ctrl_src0[63] 
                : fadd_ctrl_src0[31];
assign ea[10:0] = (ex1_double) 
                ? fadd_ctrl_src0[62:52] 
                : {3'b0, fadd_ctrl_src0[30:23]};

assign fa[51:0] = (ex1_double) 
                ? fadd_ctrl_src0[51:0] 
                : {29'b0, fadd_ctrl_src0[22:0]};

assign sb       = (ex1_double) 
                ? fadd_ctrl_src1[63] 
                : fadd_ctrl_src1[31];
assign eb[10:0] = (ex1_double) 
                ? fadd_ctrl_src1[62:52] 
                : {3'b0, fadd_ctrl_src1[30:23]};
assign fb[51:0] = (ex1_double) 
                ? fadd_ctrl_src1[51:0]  
                : {29'b0, fadd_ctrl_src1[22:0]};
//=====================Operator Type========================
//type of operand a
assign ea_is_lfn     = (ex1_double)
                     ? (&ea[10:1]) && (~ea[0])
                     : (&ea[7:1])  && (~ea[0]);
assign ea_is_nan_inf = (ex1_double)
                     ? (&ea[10:0])
                     : (&ea[7:0]);
assign ea_lt_nan_inf = (ex1_double)
                     ? (~&ea[10:0])
                     : (~&ea[7:0]);
assign fa_is_all_1   = (ex1_double)
                     ? (&fa[51:0])
                     : (&fa[22:0]);
assign fa_msb_is_1   = fa[51] &&  ex1_double || 
                       fa[22] && !ex1_double;
assign opa_high_is_1 = &fadd_ctrl_src0[63:32];
assign opa_is_cnan   = ex1_scalar && !ex1_double && !opa_high_is_1;

assign ea_gt_0       = |ea[10:0];
assign ea_is_0       = ~|ea[10:0];
assign ea_is_1       = (~|ea[10:1]) && ea[0];
assign ea_is_norm    = ea_gt_0;                     
assign fa_gt_0       = |fa[51:0];
assign fa_is_0       = ~|fa[51:0];
assign opa_is_snan   = ea_is_nan_inf && (!fa_msb_is_1) && fa_gt_0 && !opa_is_cnan; 
assign opa_is_qnan   = ea_is_nan_inf && fa_msb_is_1    || opa_is_cnan;
assign opa_is_nan    = opa_is_snan   || opa_is_qnan;
assign opa_is_inf    = ea_is_nan_inf && fa_is_0       && !opa_is_cnan;                   
assign opa_is_lfn    = ea_is_lfn     && fa_is_all_1   && !opa_is_cnan;                   
assign opa_is_nm     = ea_gt_0       && ea_lt_nan_inf && !opa_is_cnan;                   
assign opa_is_dn     = ea_is_0       && fa_gt_0       && !opa_is_cnan;                         
assign opa_is_0      = ea_is_0       && fa_is_0       && !opa_is_cnan;                         
assign opa_is_snm    = ea_is_1       && !opa_is_cnan ;
assign opa_is_dn_no_flush = opa_is_dn;

//type of operand b


assign eb_is_lfn     = (ex1_double)
                     ? (&eb[10:1]) && (~eb[0])
                     : (&eb[7:1])  && (~eb[0]);
assign eb_is_nan_inf = (ex1_double)
                     ? (&eb[10:0])
                     : (&eb[7:0]);
assign eb_lt_nan_inf = (ex1_double)
                     ? (~&eb[10:0])
                     : (~&eb[7:0]);
assign fb_is_all_1   = (ex1_double)
                     ? (&fb[51:0])
                     : (&fb[22:0]);
assign fb_msb_is_1   = fb[51] &&  ex1_double || 
                       fb[22] && !ex1_double;
assign opb_high_is_1 = &fadd_ctrl_src1[63:32];                   
assign opb_is_cnan   = ex1_scalar&&!ex1_double && !opb_high_is_1;

assign eb_gt_0       = |eb[10:0];
assign eb_is_0       = ~|eb[10:0];
assign eb_is_1       = (~|eb[10:1]) && eb[0];
assign eb_is_norm    = eb_gt_0;                                          
assign fb_gt_0       = |fb[51:0];
assign fb_is_0       = ~|fb[51:0];

assign opb_is_snan   = eb_is_nan_inf && (!fb_msb_is_1) && fb_gt_0 && !opb_is_cnan; 
assign opb_is_qnan   = eb_is_nan_inf && fb_msb_is_1    || opb_is_cnan;   
assign opb_is_nan    = opb_is_snan   || opb_is_qnan;
assign opb_is_inf    = eb_is_nan_inf && fb_is_0       && !opb_is_cnan;                   
assign opb_is_lfn    = eb_is_lfn     && fb_is_all_1   && !opb_is_cnan;                   
assign opb_is_nm     = eb_gt_0       && eb_lt_nan_inf && !opb_is_cnan;                   
assign opb_is_dn     = eb_is_0       && fb_gt_0       && !opb_is_cnan;                         
assign opb_is_0      = eb_is_0       && fb_is_0       && !opb_is_cnan;                         
assign opb_is_snm    = eb_is_1 && !opb_is_cnan;
assign opb_is_dn_no_flush = opb_is_dn;

//====================Fraction Denormal=====================
//Denormal Fraction will be flush to 1.000...00
//Will select by DN signal
//for the widden operation, we here using another input source.
// we only reuse the shift logic
//// single widden source operation
//
//
assign fa_nm_4ex2[52:0] = (ex1_double)
                          ? {      ea_is_norm,fa[51:0]}
                          : {29'b0,ea_is_norm,fa[22:0]};
assign fa_nm[52:0]      = (ex1_double)
                          ? ea_is_norm ? {      1'b1,fa[51:0]} : {fa[51:0],1'b0}
                          : ea_is_norm ? {29'b0,1'b1,fa[22:0]} : {29'b0,fa[22:0],1'b0};
assign fb_nm_4ex2[52:0] = (ex1_double)
                          ? {      eb_is_norm,fb[51:0]}
                          : {29'b0,eb_is_norm,fb[22:0]};
assign fb_nm[52:0]      = (ex1_double)
                          ? eb_is_norm ? {      1'b1,fb[51:0]} : {fb[51:0],1'b0}
                          : eb_is_norm ? {29'b0,1'b1,fb[22:0]} : {29'b0,fb[22:0],1'b0};
                          
//=======================Exponent Sub=======================
// two adders in parallel, 
// the sign of the result of adder 0 is used to select
//   e_adder0_sum = Ea - Eb;
//   e_adder1_sum = Eb - Ea;
// we just need to positive one

//Adder Prepare
//double adder
// &Force("nonport","double_e_diff"); @180
// &Force("nonport","double_e_contrary_diff"); @181
// &Force("nonport","single_e_diff"); @182
// &Force("nonport","single_e_contrary_diff"); @183
//csky vperl_off
assign double_e_diff[11:0]                = $unsigned($signed({1'b0,fadd_ctrl_src0[62:52]}) - $signed({1'b0,fadd_ctrl_src1[62:52]}));
assign double_e_contrary_diff[11:0]       = $unsigned($signed({1'b0,fadd_ctrl_src1[62:52]}) - $signed({1'b0,fadd_ctrl_src0[62:52]}));
assign single_e_diff[8:0]                 = $unsigned($signed({1'b0,fadd_ctrl_src0[30:23]}) - $signed({1'b0,fadd_ctrl_src1[30:23]}));
assign single_e_contrary_diff[8:0]        = $unsigned($signed({1'b0,fadd_ctrl_src1[30:23]}) - $signed({1'b0,fadd_ctrl_src0[30:23]}));
//csky vperl_on
assign double_pos_e_d[11:0]               = double_e_diff[11] ? double_e_contrary_diff[11:0] : double_e_diff[11:0];
assign single_pos_e_d[8:0]                = single_e_diff[8] ? single_e_contrary_diff[8:0] : single_e_diff[8:0];


assign ex1_nor_es                         = ex1_es;
assign ex1_es                             = ex1_double & double_e_diff[11] |
                                            ex1_single & single_e_diff[8];

assign ex1_ed[10:0]                       = {11{ex1_double}} & double_pos_e_d[10:0] |
                                            {11{ex1_single}} & {2'b0,single_pos_e_d[8:0]};



//======================Operand Exchange====================
//The Operand with larger E will be set as src0
//when Ea == Eb, Opb may larger than Opas
assign widden_merge_opa_is_nm          = opa_is_nm;
assign widden_merge_opa_is_nan         = opa_is_nan;
assign widden_merge_opa_is_dn_no_flush = opa_is_dn_no_flush;
assign widden_merge_opa_is_snan        =  opa_is_snan;
assign widden_merge_opa_is_qnan        =  opa_is_qnan;
assign widden_merge_opa_is_cnan        =  opa_is_cnan;
assign widden_merge_opa_is_inf         =  opa_is_inf;
assign widden_merge_opa_is_lfn         =  opa_is_lfn;
assign widden_merge_opa_is_dn          =  opa_is_dn;
assign widden_merge_opa_is_0           =  opa_is_0;
assign widden_merge_opa_is_snm         =  opa_is_snm;

assign widden_merge_opb_is_dn_no_flush = opb_is_dn_no_flush;
assign widden_merge_opb_is_snan        =  opb_is_snan;
assign widden_merge_opb_is_nan         =  opb_is_nan;
assign widden_merge_opb_is_qnan        =  opb_is_qnan;
assign widden_merge_opb_is_cnan        =  opb_is_cnan;
assign widden_merge_opb_is_inf         =  opb_is_inf;
assign widden_merge_opb_is_lfn         =  opb_is_lfn;
assign widden_merge_opb_is_nm          =  opb_is_nm;
assign widden_merge_opb_is_dn          =  opb_is_dn;
assign widden_merge_opb_is_0           =  opb_is_0;
assign widden_merge_opb_is_snm         =  opb_is_snm;
assign widden_merge_ea[10:0]           =  ea[10:0];
assign widden_merge_sa                 = sa;
assign widden_merge_eb[10:0]           =  eb[10:0];
assign widden_merge_sb                 = sb;


// &CombBeg; @235
always @( fa_nm_4ex2[52:0]
       or widden_merge_ea[10:0]
       or widden_merge_opa_is_dn_no_flush
       or widden_merge_opa_is_inf
       or widden_merge_opb_is_0
       or widden_merge_opa_is_nm
       or widden_merge_opb_is_nm
       or widden_merge_opb_is_lfn
       or fb_nm_4ex2[52:0]
       or ex1_es
       or widden_merge_opa_is_0
       or fa_nm[52:0]
       or widden_merge_sa
       or widden_merge_opa_is_cnan
       or widden_merge_opb_is_snm
       or widden_merge_opa_is_snan
       or widden_merge_sb
       or widden_merge_opb_is_dn
       or widden_merge_opb_is_snan
       or widden_merge_opa_is_lfn
       or widden_merge_opb_is_nan
       or widden_merge_opb_is_inf
       or widden_merge_opa_is_nan
       or widden_merge_opa_is_dn
       or fb_nm[52:0]
       or widden_merge_opa_is_qnan
       or widden_merge_opb_is_qnan
       or widden_merge_opb_is_dn_no_flush
       or widden_merge_opa_is_snm
       or widden_merge_opb_is_cnan
       or widden_merge_eb[10:0])
begin
if(!ex1_es)//E sub positive
begin
  ex1_src0_s       = widden_merge_sa;
  ex1_src0_e[10:0] = widden_merge_ea[10:0];
  ex1_src0_f[52:0] = (widden_merge_opa_is_nm || widden_merge_opa_is_nan || widden_merge_opa_is_dn_no_flush) 
                   ? fa_nm[52:0] 
                   : 53'b0;
  ex1_src0_f_4ex2[52:0] = (widden_merge_opa_is_nm || widden_merge_opa_is_nan || widden_merge_opa_is_dn_no_flush) 
                   ? fa_nm_4ex2[52:0] 
                   : 53'b0;
  ex1_src1_s       = widden_merge_sb;
  ex1_src1_e[10:0] = widden_merge_eb[10:0];
  ex1_src1_f[52:0] = (widden_merge_opb_is_nm || widden_merge_opb_is_nan || widden_merge_opb_is_dn_no_flush) 
                   ? fb_nm[52:0] 
                   : 53'b0;
  ex1_src1_f_4ex2[52:0] = (widden_merge_opb_is_nm || widden_merge_opb_is_nan || widden_merge_opb_is_dn_no_flush) 
                   ? fb_nm_4ex2[52:0] 
                   : 53'b0;
  ex1_src0_is_snan = widden_merge_opa_is_snan;
  ex1_src0_is_qnan = widden_merge_opa_is_qnan; 
  ex1_src0_is_cnan = widden_merge_opa_is_cnan;
  ex1_src0_is_inf  = widden_merge_opa_is_inf; 
  ex1_src0_is_lfn  = widden_merge_opa_is_lfn; 
  ex1_src0_is_nm   = widden_merge_opa_is_nm; 
  ex1_src0_is_dn   = widden_merge_opa_is_dn; 
  ex1_src0_is_0    = widden_merge_opa_is_0; 
  ex1_src0_is_snm  = widden_merge_opa_is_snm; 
  ex1_src1_is_snan = widden_merge_opb_is_snan;
  ex1_src1_is_qnan = widden_merge_opb_is_qnan; 
  ex1_src1_is_cnan = widden_merge_opb_is_cnan;
  ex1_src1_is_inf  = widden_merge_opb_is_inf; 
  ex1_src1_is_lfn  = widden_merge_opb_is_lfn; 
  ex1_src1_is_nm   = widden_merge_opb_is_nm; 
  ex1_src1_is_dn   = widden_merge_opb_is_dn; 
  ex1_src1_is_0    = widden_merge_opb_is_0; 
  ex1_src1_is_snm  = widden_merge_opb_is_snm; 
end
else//E sub negative
begin
  ex1_src1_s       = widden_merge_sa;
  ex1_src1_e[10:0] = widden_merge_ea[10:0];
  ex1_src1_f[52:0] = (widden_merge_opa_is_nm || widden_merge_opa_is_nan || widden_merge_opa_is_dn_no_flush)
                   ? fa_nm[52:0]
                   : 53'b0;
  ex1_src1_f_4ex2[52:0] = (widden_merge_opa_is_nm || widden_merge_opa_is_nan || widden_merge_opa_is_dn_no_flush) 
                   ? fa_nm_4ex2[52:0] 
                   : 53'b0;                 
  ex1_src0_s       = widden_merge_sb;
  ex1_src0_e[10:0] = widden_merge_eb[10:0]; 
  ex1_src0_f[52:0] = (widden_merge_opb_is_nm || widden_merge_opb_is_nan || widden_merge_opb_is_dn_no_flush)
                   ? fb_nm[52:0]
                   : 53'b0;
  ex1_src0_f_4ex2[52:0] = (widden_merge_opb_is_nm || widden_merge_opb_is_nan || widden_merge_opb_is_dn_no_flush)
                   ? fb_nm_4ex2[52:0]
                   : 53'b0;
                 
  ex1_src1_is_snan = widden_merge_opa_is_snan;
  ex1_src1_is_qnan = widden_merge_opa_is_qnan; 
  ex1_src1_is_cnan = widden_merge_opa_is_cnan;
  ex1_src1_is_inf  = widden_merge_opa_is_inf; 
  ex1_src1_is_lfn  = widden_merge_opa_is_lfn; 
  ex1_src1_is_nm   = widden_merge_opa_is_nm; 
  ex1_src1_is_dn   = widden_merge_opa_is_dn; 
  ex1_src1_is_0    = widden_merge_opa_is_0; 
  ex1_src1_is_snm  = widden_merge_opa_is_snm; 
  ex1_src0_is_snan = widden_merge_opb_is_snan;
  ex1_src0_is_qnan = widden_merge_opb_is_qnan; 
  ex1_src0_is_inf  = widden_merge_opb_is_inf; 
  ex1_src0_is_cnan = widden_merge_opb_is_cnan;
  ex1_src0_is_lfn  = widden_merge_opb_is_lfn; 
  ex1_src0_is_nm   = widden_merge_opb_is_nm; 
  ex1_src0_is_dn   = widden_merge_opb_is_dn; 
  ex1_src0_is_0    = widden_merge_opb_is_0; 
  ex1_src0_is_snm  = widden_merge_opb_is_snm; 
end
// &CombEnd; @311
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

assign ex1_ed_gt_25s_54d  =  ex1_as_double  & ex1_ed[10:0] >  11'h36  | 
                             ex1_as_single  & ex1_ed[10:0] >  11'h19 ;
assign ex1_ed_gt_26s_55d  =  ex1_as_double  & ex1_ed[10:0] >  11'h37 |
                             ex1_as_single  & ex1_ed[10:0] >  11'h1a ;

//==========================================================
//                     EX1 CLOSE PATH
//==========================================================
//Close Path Condition:
//  Actually sub operation && Ed<=1
assign ex1_close_sel      = ex1_act_sub && ex1_ed_lt_2;
assign ex1_ed_lt_2        = ~|ex1_ed[10:1];
assign ex1_ed_is_1        = (~|ex1_ed[10:1]) && ex1_ed[0];
//assign ex1_ed_is_0        = (~|ex1_ed[10:0]);
//src0 eq src1 not care sign bit
//assign ex1_close_e_eq     = ex1_ed_is_0;
//assign ex1_close_src_eq   = ex1_close_e_eq && 
//                            (ex1_src0_s ^~ ex1_src1_s) && 
//                            (ex1_src0_f[52:0] == ex1_src1_f[52:0]) || 
//                             ex1_src0_eq_0 && ex1_src1_eq_0;
//Fraction Align
//src_1 fraction need shift right by 1 if
//  Ed is 1 && !(S1_is_dn && S0_is_nm)
//  Other special condition will be dealt in other way
//here

//assign ex1_close_shift    = (ex1_ed_is_1) && 
//                           !(ex1_src0_is_nm && (ea_is_0 || eb_is_0) && !ex1_widden 
//                              || ex1_widden && (widden_ea_is_0 || widden_eb_is_0));

assign ex1_close_shift    = (ex1_ed_is_1) && 
                           !(ex1_src0_is_nm && (ea_is_0 || eb_is_0));

//Fraction Adder operand prepare
//s0 for no shift right by one
//s1 for    shift right by one

assign ex1_close_adder0_s0[52:0]         =   ex1_norm_close_adder0_s0[52:0];
assign ex1_close_adder1_s0[52:0]         =   ex1_norm_close_adder1_s0[52:0];    
assign ex1_close_adder0_s1_a[53:0]       =   ex1_norm_close_adder0_s1_a[53:0];
assign ex1_close_adder1_s1_a[53:0]       =   ex1_norm_close_adder1_s1_a[53:0];   
assign ex1_close_adder0_s1_b[53:0]       =   ex1_norm_close_adder0_s1_b[53:0];
assign ex1_close_adder1_s1_b[53:0]       =   ex1_norm_close_adder1_s1_b[53:0];
 //Fraction Adder S0
assign ex1_norm_close_adder0_s0[52:0]       =  {53{ex1_double}}  & {|fadd_ctrl_src0[62:52], fadd_ctrl_src0[51:0]} |
                                               {53{ex1_single}}  & {|fadd_ctrl_src0[30:23], fadd_ctrl_src0[22:0], 29'b0};
assign ex1_norm_close_adder1_s0[52:0]       =  {53{ex1_double}}  & {|fadd_ctrl_src1[62:52], fadd_ctrl_src1[51:0]} |
                                               {53{ex1_single}}  & {|fadd_ctrl_src1[30:23], fadd_ctrl_src1[22:0], 29'b0};
//Fraction Adder S1 src1_d is smaller
assign ex1_norm_close_adder0_s1_a[53:0]     =  {54{ex1_double}}  & {1'b1, fadd_ctrl_src0[51:0],1'b0} |
                                               {54{ex1_single}}  & {1'b1, fadd_ctrl_src0[22:0], 30'b0};
assign ex1_norm_close_adder1_s1_a[53:0]     =  {54{ex1_double}}  & {1'b0, 1'b1, fadd_ctrl_src1[51:0]} |
                                               {54{ex1_single}}  & {1'b0,1'b1, fadd_ctrl_src1[22:0], 29'b0};
//Fraction Adder S1 src0_d is smaller
assign ex1_norm_close_adder0_s1_b[53:0]     =  {54{ex1_double}}  & {1'b1, fadd_ctrl_src1[51:0], 1'b0} |
                                               {54{ex1_single}}  & {1'b1, fadd_ctrl_src1[22:0], 30'b0};
assign ex1_norm_close_adder1_s1_b[53:0]     =  {54{ex1_double}} & {1'b0, 1'b1, fadd_ctrl_src0[51:0]} |
                                               {54{ex1_single}} & {1'b0, 1'b1, fadd_ctrl_src0[22:0], 29'b0};

// &Instance("ct_fadd_close_s0_d","x_ct_fadd_close_s0_d"); @398
ct_fadd_close_s0_d  x_ct_fadd_close_s0_d (
  .close_adder0                 (ex1_close_adder0_s0         ),
  .close_adder1                 (ex1_close_adder1_s0         ),
  .close_eq                     (ex1_close_f_eq              ),
  .close_op_chg                 (ex1_close_norm_op_chg_s0    ),
  .close_sum_a_b                (ex1_close_sum_s0_a_b        ),
  .close_sum_b_a                (ex1_close_sum_s0_b_a        ),
  .ff1_pred                     (ex1_close_norm_ff1_s0       ),
  .ff1_pred_onehot              (ex1_close_norm_ff1_onehot_s0)
);

// &Connect( @399
//           .src0_e_is_0     (ea_is_0                     ) @400
//           .close_adder0    (ex1_close_adder0_s0         ), @401
//           .close_adder1    (ex1_close_adder1_s0         ), @402
//           .close_sum_a_b   (ex1_close_sum_s0_a_b        ), @403
//           .close_sum_b_a   (ex1_close_sum_s0_b_a        ), @404
// //          .close_sum_m1    (ex1_close_sum_m1_s0         ), @405
//           .ff1_pred_onehot (ex1_close_norm_ff1_onehot_s0     ), @406
//           .ff1_pred        (ex1_close_norm_ff1_s0            ), @407
//           .close_op_chg    (ex1_close_norm_op_chg_s0         ), @408
//           .close_eq        (ex1_close_f_eq) @409
//         ); @410

// &Instance("ct_fadd_close_s1_d","x_ct_fadd_close_s1_d_a"); @412
ct_fadd_close_s1_d  x_ct_fadd_close_s1_d_a (
  .close_adder0              (ex1_close_adder0_s1_a    ),
  .close_adder1              (ex1_close_adder1_s1_a    ),
  .close_op_chg              (ex1_close_op_chg_s1_a    ),
  .close_sum                 (ex1_close_sum_s1_a       ),
  .ex1_double                (ex1_double               ),
  .ex1_single                (ex1_single               ),
  .ff1_pred                  (ex1_close_ff1_s1_a       ),
  .ff1_pred_onehot           (ex1_close_ff1_onehot_s1_a)
);

// &Connect( @413
//           .src0_e_is_0     (ea_is_0                     ) @414
//           .src1_e_is_0     (eb_is_0                     ), @415
//           .close_adder0    (ex1_close_adder0_s1_a       ), @416
//           .close_adder1    (ex1_close_adder1_s1_a       ), @417
//           .close_sum       (ex1_close_sum_s1_a          ), @418
// //          .close_sum_m1    (ex1_close_sum_m1_s1_a       ), @419
//           .ff1_pred_onehot (ex1_close_ff1_onehot_s1_a   ), @420
//           .ff1_pred        (ex1_close_ff1_s1_a          ), @421
//           .close_op_chg    (ex1_close_op_chg_s1_a       ) @422
//         ); @423
// &Force("nonport","ex1_close_op_chg_s1_a"); @424

// &Instance("ct_fadd_close_s1_d","x_ct_fadd_close_s1_d_b"); @426
ct_fadd_close_s1_d  x_ct_fadd_close_s1_d_b (
  .close_adder0              (ex1_close_adder0_s1_b    ),
  .close_adder1              (ex1_close_adder1_s1_b    ),
  .close_op_chg              (ex1_close_op_chg_s1_b    ),
  .close_sum                 (ex1_close_sum_s1_b       ),
  .ex1_double                (ex1_double               ),
  .ex1_single                (ex1_single               ),
  .ff1_pred                  (ex1_close_ff1_s1_b       ),
  .ff1_pred_onehot           (ex1_close_ff1_onehot_s1_b)
);

// &Connect( @427
//           .src0_e_is_0     (eb_is_0                     ) @428
//           .src1_e_is_0     (ea_is_0                     ), @429
//           .close_adder0    (ex1_close_adder0_s1_b       ), @430
//           .close_adder1    (ex1_close_adder1_s1_b       ), @431
//           .close_sum       (ex1_close_sum_s1_b          ), @432
// //          .close_sum_m1    (ex1_close_sum_m1_s1_b       ), @433
//           .ff1_pred_onehot (ex1_close_ff1_onehot_s1_b   ), @434
//           .ff1_pred        (ex1_close_ff1_s1_b          ), @435
//           .close_op_chg    (ex1_close_op_chg_s1_b       ) @436
//         ); @437
// &Force("nonport","ex1_close_op_chg_s1_b"); @438

//Merge S0 and S1
//Design for timing...
//
//
assign ex1_close_sum_s0[53:0]         = {ex1_close_norm_sum_s0[52:0],1'b0};
assign ex1_close_norm_sum_s0[52:0]    = ~ex1_close_norm_op_chg_s0 ? ex1_close_sum_s0_a_b[52:0] : ex1_close_sum_s0_b_a[52:0];
assign ex1_close_norm_sum_s1[53:0]    = ~ex1_nor_es ? ex1_close_sum_s1_a[53:0] : ex1_close_sum_s1_b[53:0];
assign ex1_close_sum_s1[53:0]         = ex1_close_norm_sum_s1[53:0];

assign ex1_close_norm_ff1_onehot_s1[53:0]   = ~ex1_nor_es ? ex1_close_ff1_onehot_s1_a[53:0] 
                                                           : ex1_close_ff1_onehot_s1_b[53:0];
assign ex1_close_norm_ff1_s1[5:0]           = ~ex1_nor_es ? ex1_close_ff1_s1_a[5:0] : ex1_close_ff1_s1_b[5:0];
assign ex1_close_op_chg_s0                  = ex1_close_norm_op_chg_s0;
//assign ex1_close_sum[53:0]             = (ex1_close_shift)
//                                       ?  ex1_close_sum_s1[53:0]
//                                       : ex1_widden ? {ex1_widden_close_sum_s0[23:0],30'b0} : {ex1_close_sum_s0[52:0],1'b0};
//
////Merge ex1_close_sum_s1                                       
//assign ex1_close_sum_s1[53:0]          = (~ex1_es)
//                                       ? ex1_widden ? {ex1_widden_close_sum_s1_a[24:0],29'b0} : ex1_close_sum_s1_a[53:0]
//                                       : ex1_widden ? {ex1_widden_close_sum_s1_b[24:0],29'b0} : ex1_close_sum_s1_b[53:0];

assign ex1_close_ff1_onehot_s1[53:0]   = ex1_close_norm_ff1_onehot_s1[53:0];

assign ex1_close_ff1_s1[5:0]           = ex1_close_norm_ff1_s1[5:0];

assign ex1_close_ff1_onehot_s0[53:0]   = {ex1_close_norm_ff1_onehot_s0[52:0],1'b0};

assign ex1_close_ff1_s0[5:0]           = ex1_close_norm_ff1_s0[5:0];

assign ex1_close_ff1[5:0]              = ex1_close_shift ? ex1_close_ff1_s1[5:0] : ex1_close_ff1_s0[5:0];
assign ex1_close_ff1_onehot[53:0]      = ex1_close_shift ? ex1_close_ff1_onehot_s1[53:0] 
                                                         : ex1_close_ff1_onehot_s0[53:0];
assign ex1_close_sum[53:0]             = ex1_close_shift ? ex1_close_sum_s1[53:0] 
                                                         : ex1_close_sum_s0[53:0];
//When 1.xxx -0.1xxxx|1, should special treated
//assign ex1_close_adder0_s1[52:0]       = (~ex1_es1
//                                       ? ex1_widd1n ? {ex1_widden_close_src0_frac_s1_a[24:0],28'b0} :  ex1_close_adder0_s1_a[52:0]
//                                       : ex1_widden ? {ex1_widden_close_src0_frac_s1_b[24:0],28'b0} :  ex1_close_adder0_s1_b[52:0];
//assign ex1_close_adder1_s1[52:0]       = (~ex1_es)
//                                       ? ex1_widden ? {ex1_widden_close_src1_frac_s1_a[24:0],28'b0} :  ex1_close_adder1_s1_a[52:0]
//                                       : ex1_widden ? {ex1_widden_close_src1_frac_s1_a[24:0],28'b0} :  ex1_close_adder1_s1_b[52:0];
// &Force("nonport","ex1_widden_close_op_chg_s0"); @482
// &Force("nonport","ex1_widden_close_op_chg_s1_a"); @483
// &Force("nonport","ex1_widden_close_op_chg_s1_b"); @484
//ex1_close_sign
assign ex1_close_sign                  = ((ex1_close_op_chg_s0) && !ex1_ed_is_1)
                                       ? !ex1_act_s
                                       :  ex1_act_s;


// the first stage, we move the compare result generation to the first stage
assign ex1_cmp_nv       = (opa_is_snan || opb_is_snan) || 
                          (opa_is_qnan || opb_is_qnan);


assign ex1_cmp_feq  = !opa_is_snan && 
                      !opb_is_snan &&  
                      !opa_is_qnan && 
                      !opb_is_qnan &&
                      ex1_src0_eq_src1;
assign ex1_cmp_fne  = !ex1_cmp_feq;
assign ex1_e_eq     = ex1_double && !double_e_diff[11] 
                                 && !double_e_contrary_diff[11] || 
                      ex1_single && !single_e_diff[8] 
                                 && !single_e_contrary_diff[8];
assign ex1_f_eq         = ex1_close_f_eq;
assign ex1_src0_eq_src1 = (sa ^~ sb) && ex1_f_eq && ex1_e_eq || ex1_src0_eq_0 && ex1_src1_eq_0;
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
// &Force("output","ex1_cmp_result"); @525
//assign ex1_f1_x_close                  = (ex1_close_shift)
//                                       ? ex1_f1_x_close_s1
//                                       : ex1_f1_x_close_s0;
//
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

//====================NM low part shift=====================
// &CombBeg; @548
always @( ex1_src1_f[52:0]
       or ex1_ed[2:0])
begin
case(ex1_ed[2:0])
  3'd0    : begin
    ex1_f1_v_nm_pre[52:0] = {       ex1_src1_f[52:0]};
    ex1_f1_x_nm_pre[53:0] = 54'b0;
  end
  3'd1    : begin
    ex1_f1_v_nm_pre[52:0] = {1'b0,  ex1_src1_f[52:1]};
    ex1_f1_x_nm_pre[53:0] = {ex1_src1_f[0],    53'b0};
  end
  3'd2    : begin
    ex1_f1_v_nm_pre[52:0] = {2'b0,  ex1_src1_f[52:2]};
    ex1_f1_x_nm_pre[53:0] = {ex1_src1_f[1:0],  52'b0};
  end
  3'd3    : begin
    ex1_f1_v_nm_pre[52:0] = {3'b0,  ex1_src1_f[52:3]};
    ex1_f1_x_nm_pre[53:0] = {ex1_src1_f[2:0],  51'b0};
  end
  3'd4    : begin
    ex1_f1_v_nm_pre[52:0] = {4'b0,  ex1_src1_f[52:4]};
    ex1_f1_x_nm_pre[53:0] = {ex1_src1_f[3:0],  50'b0};
  end
  3'd5    : begin
    ex1_f1_v_nm_pre[52:0] = {5'b0,  ex1_src1_f[52:5]};
    ex1_f1_x_nm_pre[53:0] = {ex1_src1_f[4:0],  49'b0};
  end
  3'd6    : begin
    ex1_f1_v_nm_pre[52:0] = {6'b0,  ex1_src1_f[52:6]};
    ex1_f1_x_nm_pre[53:0] = {ex1_src1_f[5:0],  48'b0};
  end
  3'd7    : begin
    ex1_f1_v_nm_pre[52:0] = {7'b0,  ex1_src1_f[52:7]};
    ex1_f1_x_nm_pre[53:0] = {ex1_src1_f[6:0],  47'b0};
  end
  default : begin
    ex1_f1_v_nm_pre[52:0] = {53{1'bx}};
    ex1_f1_x_nm_pre[53:0] = {54{1'bx}};
  end
endcase
// &CombEnd; @587
end

//====================NM high part shift====================
//shift x8
// &CombBeg; @591
always @( ex1_f1_v_nm_pre[52:0]
       or ex1_f1_x_nm_pre[53:0]
       or ex1_ed[5:3])
begin
case(ex1_ed[5:3])
  3'd0    : begin
    ex1_f1_v_nm[52:0] = {                        ex1_f1_v_nm_pre[52: 0]};
    ex1_f1_x_nm[53:0] = {                        ex1_f1_x_nm_pre[53: 0]};
  end
  3'd1    : begin
    ex1_f1_v_nm[52:0] = { 8'b0,                  ex1_f1_v_nm_pre[52: 8]};
    ex1_f1_x_nm[53:0] = {ex1_f1_v_nm_pre[ 7: 0], ex1_f1_x_nm_pre[53: 8]};
  end
  3'd2    : begin
    ex1_f1_v_nm[52:0] = {16'b0,                  ex1_f1_v_nm_pre[52:16]};
    ex1_f1_x_nm[53:0] = {ex1_f1_v_nm_pre[15: 0], ex1_f1_x_nm_pre[53:16]};
  end
  3'd3    : begin
    ex1_f1_v_nm[52:0] = {24'b0,                  ex1_f1_v_nm_pre[52:24]};
    ex1_f1_x_nm[53:0] = {ex1_f1_v_nm_pre[23: 0], ex1_f1_x_nm_pre[53:24]};
  end
  3'd4    : begin
    ex1_f1_v_nm[52:0] = {32'b0,                  ex1_f1_v_nm_pre[52:32]};
    ex1_f1_x_nm[53:0] = {ex1_f1_v_nm_pre[31: 0], ex1_f1_x_nm_pre[53:32]};
  end
  3'd5    : begin
    ex1_f1_v_nm[52:0] = {40'b0,                  ex1_f1_v_nm_pre[52:40]};
    ex1_f1_x_nm[53:0] = {ex1_f1_v_nm_pre[39: 0], ex1_f1_x_nm_pre[53:40]};
  end
  3'd6    : begin
    ex1_f1_v_nm[52:0] = {48'b0,                  ex1_f1_v_nm_pre[52:48]};
    ex1_f1_x_nm[53:0] = {ex1_f1_v_nm_pre[47: 0], ex1_f1_x_nm_pre[53:48]};
  end
  default : begin
    ex1_f1_v_nm[52:0] = {53{1'bx}};
    ex1_f1_x_nm[53:0] = {54{1'bx}};
  end
endcase
// &CombEnd; @626
end
//for the widden 2 operation , the src0 maybe denormal number, so here
//the denormal number should be widden to normal number.
//



//Fraction Value after Align
//assign 
assign ex1_f1_v_far[52:0] = ex1_f1_v_nm[52:0];
assign ex1_f1_x_far[53:0] = ex1_f1_x_nm[53:0];
assign ex1_src_both_denorm = ea_is_0 && eb_is_0;
// for far path , when widden operation, the operand should be seperate
// treatd


assign ex1_src0_e_final[11:0]= {1'b0,ex1_src0_e[10:0]};
assign ex1_src1_e_final[11:0]= {1'b0,ex1_src1_e[10:0]};
assign ex1_far_adder0[54:0]  = {1'b0, ex1_src0_f[52:0],1'b0};
assign ex1_far_adder1[54:0]  = {1'b0, ex1_f1_v_far[52:0],ex1_f1_x_far[53]};

//======================Flop to EX2=========================
//gate clk
// &Instance("gated_clk_cell","x_ex1_pipe_clk"); @649
gated_clk_cell  x_ex1_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @650
//           .clk_out        (ex1_pipe_clk),//Out Clock @651
//           .external_en    (1'b0), @652
//           .global_en      (cp0_yy_clk_en), @653
//           .local_en       (ex1_pipe_clk_en),//Local Condition @654
//           .module_en      (cp0_vfpu_icg_en) @655
//         ); @656
assign ex1_pipe_clk_en = ex1_pipedown;

always @(posedge ex1_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    fadd_ex2_far_adder0[54:0]           <= 55'b0;
    fadd_ex2_far_adder1[54:0]           <= 55'b0;
    fadd_ex2_f1_x_far[53:0]             <= 54'b0;
    fadd_ex2_bypass_sel                 <=  1'b0;
    fadd_ex2_close_sel                  <=  1'b0;
    fadd_ex2_act_add                    <=  1'b0;
    fadd_ex2_act_sub                    <=  1'b0;
    fadd_ex2_act_s                      <=  1'b0;
    fadd_ex2_ed_is_1                    <=  1'b0;
    fadd_ex2_src0_f[52:0]               <= 53'b0;
    fadd_ex2_src1_f[52:0]               <= 53'b0;
    fadd_ex2_src0_e[11:0]               <= 12'b0;
    fadd_ex2_src1_e[11:0]               <= 12'b0;
    fadd_ex2_src0_s                     <=  1'b0;
    fadd_ex2_src1_s                     <=  1'b0;
    fadd_ex2_src0_is[8:0]               <=  9'b0;
    fadd_ex2_src1_is[8:0]               <=  9'b0;
    fadd_ex2_close_sign                 <=  1'b0;
    fadd_ex2_src_change                 <=  1'b0;
    fadd_ex2_close_sum[53:0]            <= 54'b0;
    fadd_ex2_close_ff1_onehot[53:0]     <= 54'b0;
    fadd_ex2_close_ff1[5:0]             <= 6'b0;
    fadd_ex2_src_both_denorm            <= 1'b0;
    fadd_ex2_cmp_result                 <= 1'b0;
  end
  else if(ex1_pipedown)
  begin
    fadd_ex2_far_adder0[54:0]           <= ex1_far_adder0[54:0];
    fadd_ex2_far_adder1[54:0]           <= ex1_far_adder1[54:0];
    fadd_ex2_f1_x_far[53:0]             <= ex1_f1_x_far[53:0];
    fadd_ex2_bypass_sel                 <= ex1_bypass_sel;
    fadd_ex2_close_sel                  <= ex1_close_sel;
    fadd_ex2_act_add                    <= ex1_act_add;
    fadd_ex2_act_sub                    <= ex1_act_sub;
    fadd_ex2_act_s                      <= ex1_act_s;
    fadd_ex2_ed_is_1                    <= ex1_ed_is_1;
    fadd_ex2_src0_f[52:0]               <= ex1_src0_f_4ex2[52:0];
    fadd_ex2_src1_f[52:0]               <= ex1_src1_f_4ex2[52:0];
    fadd_ex2_src0_e[11:0]               <= ex1_src0_e_final[11:0];
    fadd_ex2_src1_e[11:0]               <= ex1_src1_e_final[11:0];
    fadd_ex2_src0_s                     <= ex1_src0_s;
    fadd_ex2_src1_s                     <= ex1_src1_s;
    fadd_ex2_src0_is[8:0]               <= ex1_src0_is[8:0];
    fadd_ex2_src1_is[8:0]               <= ex1_src1_is[8:0];
    fadd_ex2_close_sign                 <= ex1_close_sign;
    fadd_ex2_src_change                 <= ex1_es;
    fadd_ex2_close_sum[53:0]            <= ex1_close_sum[53:0] ;
    fadd_ex2_close_ff1_onehot[53:0]     <= ex1_close_ff1_onehot[53:0];
    fadd_ex2_close_ff1[5:0]             <= ex1_close_ff1[5:0];
    fadd_ex2_src_both_denorm            <= ex1_src_both_denorm;
    fadd_ex2_cmp_result                 <= ex1_cmp_result;
  end
  else
  begin
    fadd_ex2_far_adder0[54:0]           <= fadd_ex2_far_adder0[54:0];
    fadd_ex2_far_adder1[54:0]           <= fadd_ex2_far_adder1[54:0];
    fadd_ex2_f1_x_far[53:0]             <= fadd_ex2_f1_x_far[53:0];
    fadd_ex2_bypass_sel                 <= fadd_ex2_bypass_sel;
    fadd_ex2_close_sel                  <= fadd_ex2_close_sel;
    fadd_ex2_act_add                    <= fadd_ex2_act_add;
    fadd_ex2_act_sub                    <= fadd_ex2_act_sub;
    fadd_ex2_act_s                      <= fadd_ex2_act_s;
    fadd_ex2_ed_is_1                    <= fadd_ex2_ed_is_1;
    fadd_ex2_src0_f[52:0]               <= fadd_ex2_src0_f[52:0];
    fadd_ex2_src1_f[52:0]               <= fadd_ex2_src1_f[52:0];
    fadd_ex2_src0_e[11:0]               <= fadd_ex2_src0_e[11:0];
    fadd_ex2_src1_e[11:0]               <= fadd_ex2_src1_e[11:0];
    fadd_ex2_src0_s                     <= fadd_ex2_src0_s;
    fadd_ex2_src1_s                     <= fadd_ex2_src1_s;
    fadd_ex2_src0_is[8:0]               <= fadd_ex2_src0_is[8:0];
    fadd_ex2_src1_is[8:0]               <= fadd_ex2_src1_is[8:0];
    fadd_ex2_close_sign                 <= fadd_ex2_close_sign;
    fadd_ex2_src_change                 <= fadd_ex2_src_change;
    fadd_ex2_close_sum[53:0]            <= fadd_ex2_close_sum[53:0] ;
    fadd_ex2_close_ff1_onehot[53:0]     <= fadd_ex2_close_ff1_onehot[53:0];
    fadd_ex2_close_ff1[5:0]             <= fadd_ex2_close_ff1[5:0];
    fadd_ex2_src_both_denorm            <= fadd_ex2_src_both_denorm;
    fadd_ex2_cmp_result                 <= fadd_ex2_cmp_result;

  end
end

//EX2 Signal Prepare
assign ex2_act_add        = fadd_ex2_act_add;
assign ex2_act_sub        = fadd_ex2_act_sub;
assign ex2_act_s          = fadd_ex2_act_s;
assign ex2_src0_f[52:0]   = fadd_ex2_src0_f[52:0];
assign ex2_src1_f[52:0]   = fadd_ex2_src1_f[52:0];
assign ex2_src0_e[11:0]   = fadd_ex2_src0_e[11:0];
assign ex2_src1_e[11:0]   = fadd_ex2_src1_e[11:0];
assign ex2_src0_s         = fadd_ex2_src0_s;
assign ex2_src1_s         = fadd_ex2_src1_s;
assign ex2_close_sel      = fadd_ex2_close_sel;
assign ex2_bypass_sel     = fadd_ex2_bypass_sel;
assign ex2_far_sel        = !fadd_ex2_bypass_sel && 
                            !ex2_close_sel;
assign ex2_src_change     = fadd_ex2_src_change;

assign ex2_src0_is_cnan   = fadd_ex2_src0_is[7];
assign ex2_src0_is_snan   = fadd_ex2_src0_is[6];
assign ex2_src0_is_qnan   = fadd_ex2_src0_is[5];
assign ex2_src0_is_inf    = fadd_ex2_src0_is[4];
assign ex2_src0_is_0      = fadd_ex2_src0_is[0];
assign ex2_src0_is_dn     = fadd_ex2_src0_is[1];
assign ex2_src1_is_cnan   = fadd_ex2_src1_is[7];
assign ex2_src1_is_snan   = fadd_ex2_src1_is[6];
assign ex2_src1_is_qnan   = fadd_ex2_src1_is[5];
assign ex2_src1_is_inf    = fadd_ex2_src1_is[4];
assign ex2_src1_is_0      = fadd_ex2_src1_is[0];
assign ex2_cmp_result     = fadd_ex2_cmp_result;


assign ex2_f1_x_far[53:0]   = fadd_ex2_f1_x_far[53:0];
assign ex2_far_adder0[54:0] = fadd_ex2_far_adder0[54:0];
assign ex2_far_adder1[54:0] = fadd_ex2_far_adder1[54:0];

assign ex2_close_sign                 = fadd_ex2_close_sign;
assign ex2_close_sum[53:0]            = {fadd_ex2_close_sum[53:0]};
assign ex2_close_ff1_onehot[53:0]     = fadd_ex2_close_ff1_onehot[53:0];

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
assign ex2_src0_f_1p0_0             = (ex2_double && (ex2_src0_f[52:0] == 53'h10_0000_0000_0000) ||
                                       ex2_single && (ex2_src0_f[23:0] == 24'h80_0000)) 
                                       && !ex2_src0_is_dn;
assign ex2_src0_f_1p1_1             =  ex2_double && &ex2_src0_f[52:0]  ||
                                       ex2_single && &ex2_src0_f[23:0];
assign ex2_src0_emax                =  ex2_double && (ex2_src0_e[11:0] == 12'h7fe) ||
                                       ex2_single && (ex2_src0_e[11:0] == 12'hfe) && (~ex2_src0_is_cnan);
assign ex2_bypass_f_1p0_n_dec[51:0] = {52{ex2_double}} & {52{1'b1}} |
                                      {52{ex2_single}} & {29'b0,{23{1'b1}}};
//Bypass Path Calculate result
// &CombBeg; @826
always @( ex2_src0_e[10:0]
       or ex2_src1_is_0
       or ex2_src0_f_1p0_0
       or ex2_bypass_inc1
       or ex2_bypass_dec1
       or ex2_bypass_f_1p0_n_dec[51:0]
       or ex2_src0_f_1p1_1
       or ex2_src0_f[51:0])
begin
if(ex2_src1_is_0)
begin
  ex2_bypass_f[51:0] = ex2_src0_f[51:0];
  ex2_bypass_e[10:0] = ex2_src0_e[10:0];
end
else if(ex2_src0_f_1p0_0 && ex2_bypass_dec1)
begin
  ex2_bypass_f[51:0] = ex2_bypass_f_1p0_n_dec[51:0];
  ex2_bypass_e[10:0] = ex2_src0_e[10:0] - 11'b1;
end
else if(ex2_src0_f_1p1_1 && ex2_bypass_inc1)
begin
  ex2_bypass_f[51:0] = 52'b0;
  ex2_bypass_e[10:0] = ex2_src0_e[10:0] + 11'b1;
end
else
begin
  ex2_bypass_f[51:0] = (ex2_bypass_inc1)
                     ? ex2_src0_f[51:0] + 52'b1
                     : (ex2_bypass_dec1)
                       ? ex2_src0_f[51:0] - 52'b1
                       : ex2_src0_f[51:0];
  ex2_bypass_e[10:0] = ex2_src0_e[10:0];
end
// &CombEnd; @851
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
//                     EX2 FAR PATH
//==========================================================
//EX2 FAR WAY will deal act_add and act_sub with ed>=2

//Need fraction adder to generate sum/sum_p1/sum_m1 in parallel
// here is totally differen rounding from the previous 
// design
// for add, there will be only round add 1, no sum 1 
// we extend the width of the adder, 
// &Force("nonport","ex2_far_add_sum"); @882
// &Force("nonport","ex2_far_add_sum_add2"); @883
// &Force("nonport","ex2_far_sub_sum"); @884
// &Force("nonport","ex2_far_sub_sum_sub1"); @885
// &Force("nonport","ex2_far_sub_sum_add1"); @886
// &Force("nonport","ex2_far_adder0"); @887
// &Force("nonport","ex2_far_adder1"); @888

//csky vperl_off
assign ex2_far_add_sum[53:0]      = $unsigned($signed(ex2_far_adder0[54:1]) + $signed(ex2_far_adder1[54:1]));
assign ex2_far_add_sum_add2[53:0] = $unsigned($signed(ex2_far_adder0[54:1]) + $signed(ex2_far_adder1[54:1]) + $signed(54'b10));
// for the sub ,we ignore the last valid bit, 
// when the result became 0.1xxxx, in this case, there will only need six
// adder.
assign ex2_far_sub_sum[53:0]      = $unsigned($signed(ex2_far_adder0[53:0]) - $signed(ex2_far_adder1[53:0]));
assign ex2_far_sub_sum_sub1[53:0] = $unsigned($signed(ex2_far_adder0[53:0]) - $signed(ex2_far_adder1[53:0]) - $signed(53'b10));
assign ex2_far_sub_sum_add1[53:0] = $unsigned($signed(ex2_far_adder0[53:0]) - $signed(ex2_far_adder1[53:0]) + $signed(53'b10));
//csky vperl_on

// add round, 
// inorder to minumize the area, we only used add2 result to provide add1
// result
// add inc 1 round
// the result will be 1.xxx
assign far_part_s                  = |ex2_f1_x_far[51:0];
assign ex2_far_add_rd1_inc1_rne    = ex2_far_add_sum[0] && ex2_f1_x_far[53] && ~far_part_s && ~ex2_f1_x_far[52] ||
                                     ex2_f1_x_far[53] && (far_part_s || ex2_f1_x_far[52]);
assign ex2_far_add_rd1_inc0_rne    = !ex2_far_add_rd1_inc1_rne;
assign ex2_far_add_rd1_inc1_rtz    = 1'b0;
assign ex2_far_add_rd1_inc0_rtz    = 1'b1;
assign ex2_far_add_rd1_inc1_rdn    = ex2_far_sign && (far_part_s || ex2_f1_x_far[52] || ex2_f1_x_far[53]);
assign ex2_far_add_rd1_inc0_rdn    = !ex2_far_add_rd1_inc1_rdn;
assign ex2_far_add_rd1_inc1_rup    = !ex2_far_sign && (far_part_s || ex2_f1_x_far[52] || ex2_f1_x_far[53]);
assign ex2_far_add_rd1_inc0_rup    = !ex2_far_add_rd1_inc1_rup;
assign ex2_far_add_rd1_inc1_rmm    = ex2_f1_x_far[53];
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
assign ex2_far_add_rd1_inc1_rslt[53:0] = ex2_far_add_sum[0] ? {ex2_far_add_sum_add2[53:1],1'b0} 
                                                            : {ex2_far_add_sum[53:1],1'b1};
assign ex2_far_add_rd1_inc0_rslt[53:0] = ex2_far_add_sum[53:0];     

assign ex2_far_add_rd1_result[53:0]    = {54{ex2_act_add && ex2_far_add_rd1_inc1}} & ex2_far_add_rd1_inc1_rslt[53:0] |
                                         {54{ex2_act_add && ex2_far_add_rd1_inc0}} & ex2_far_add_rd1_inc0_rslt[53:0];
//add inc 2 round
//the result will be 1x.xx
assign ex2_far_add_rd2_inc1_rne    = ex2_far_add_sum[1] && (ex2_far_add_sum[0] && ~|ex2_f1_x_far[53:52] && ~far_part_s) ||
                                     ex2_far_add_sum[0] && (|ex2_f1_x_far[53:52] || far_part_s);
assign ex2_far_add_rd2_inc0_rne    = !ex2_far_add_rd2_inc1_rne;
assign ex2_far_add_rd2_inc1_rtz    = 1'b0;
assign ex2_far_add_rd2_inc0_rtz    = 1'b1;
assign ex2_far_add_rd2_inc1_rdn    = ex2_far_sign && (far_part_s || |ex2_f1_x_far[53:52] || ex2_far_add_sum[0]);
assign ex2_far_add_rd2_inc0_rdn    = !ex2_far_add_rd2_inc1_rdn;
assign ex2_far_add_rd2_inc1_rup    = !ex2_far_sign && (far_part_s || |ex2_f1_x_far[53:52] || ex2_far_add_sum[0]);
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

assign ex2_far_add_rd2_inc0_rslt[53:0] = ex2_far_add_sum[53:0];
assign ex2_far_add_rd2_inc1_rslt[53:0] = ex2_far_add_sum_add2[53:0];
assign ex2_far_add_rd2_result[53:0]    = {54{ex2_act_add && ex2_far_add_rd2_inc1}} & ex2_far_add_rd2_inc1_rslt[53:0] |
                                         {54{ex2_act_add && ex2_far_add_rd2_inc0}} & ex2_far_add_rd2_inc0_rslt[53:0];
assign ex2_far_doub_add_result[53:0]   = fadd_ex2_src_both_denorm || ex2_far_add_sum[53] ? ex2_far_add_rd2_result[53:0]
                                                                                         : ex2_far_add_rd1_result[53:0]; 
assign ex2_far_sing_add_result[24:0]   = fadd_ex2_src_both_denorm || ex2_far_add_sum[24] ? ex2_far_add_rd2_result[24:0]
                                                                                         : ex2_far_add_rd1_result[24:0];
assign ex2_far_doub_add_expnt[10:0]    = ex2_far_doub_add_result[53] ? ex2_far_e_val_p[10:0]  
                                                         : ex2_far_e_val_m[10:0];
assign ex2_far_sing_add_expnt[10:0]    = ex2_far_sing_add_result[24] ? ex2_far_e_val_p[10:0]  
                                                         : ex2_far_e_val_m[10:0];
                                                             
//subtraction pos1 round
// the tail is used to rounding 

// adder0 1.xxxxxxxx..,0
// adder1      xxxxxxx,x,ex2_f1_x_far
// sum              xx,x,xxxxx
// the result is 1.xxxx
assign ex2_far_sub_rd1_inc1_rne    = ex2_far_sub_sum[1] &&  ex2_far_sub_sum[0] && ~ex2_f1_x_far[52] && ~far_part_s;
assign ex2_far_sub_rd1_inc0_rne    = !ex2_far_sub_rd1_inc1_rne;
assign ex2_far_sub_rd1_dec1_rne    = 1'b0;
assign ex2_far_sub_rd1_inc1_rtz    = 1'b0;
assign ex2_far_sub_rd1_inc0_rtz    = !ex2_far_sub_rd1_dec1_rtz;
assign ex2_far_sub_rd1_dec1_rtz    = !ex2_far_sub_sum[0] && (ex2_f1_x_far[52] || far_part_s);
assign ex2_far_sub_rd1_inc1_rdn    =  ex2_far_sign && ex2_far_sub_sum[0];
assign ex2_far_sub_rd1_inc0_rdn    = !ex2_far_sign && (ex2_far_sub_sum[0] || ~ex2_f1_x_far[52] && ~far_part_s) ||
                                      ex2_far_sign && !ex2_far_sub_sum[0] ;
assign ex2_far_sub_rd1_dec1_rdn    =  !ex2_far_sub_rd1_inc1_rdn && !ex2_far_sub_rd1_inc0_rdn;
assign ex2_far_sub_rd1_inc1_rup    = !ex2_far_sign && ex2_far_sub_sum[0];
assign ex2_far_sub_rd1_inc0_rup    = ex2_far_sign && (ex2_far_sub_sum[0] || ~ex2_f1_x_far[52] && ~far_part_s) ||
                                     !ex2_far_sign && !ex2_far_sub_sum[0] ;
assign ex2_far_sub_rd1_dec1_rup    = !ex2_far_sub_rd1_inc1_rup && !ex2_far_sub_rd1_inc0_rup;
assign ex2_far_sub_rd1_inc1_rmm    = ex2_far_sub_sum[0] && ~ex2_f1_x_far[52] && ~far_part_s;
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

assign ex2_far_sub_rd1_dec1_rslt[53:0] = ex2_far_sub_sum_sub1[53:0];
assign ex2_far_sub_rd1_inc0_rslt[53:0] = ex2_far_sub_sum[53:0];
assign ex2_far_sub_rd1_inc1_rslt[53:0] = ex2_far_sub_sum_add1[53:0];
assign ex2_far_sub_rd1_result[53:0]    = {54{!ex2_act_add && ex2_far_sub_rd1_inc1}} & ex2_far_sub_rd1_inc1_rslt[53:0] |
                                         {54{!ex2_act_add && ex2_far_sub_rd1_inc0}} & ex2_far_sub_rd1_inc0_rslt[53:0] |
                                         {54{!ex2_act_add && ex2_far_sub_rd1_dec1}} & ex2_far_sub_rd1_dec1_rslt[53:0];
                                                                                            

// adder0 1.xxxxxxxx.0,
// adder1      xxxxxxx,ex2_f1_x_far[53:0]
// sum             xxx,xxxxx
// the result is 0.1xxxxxx
assign ex2_far_sub_rd2_inc1_rne    = 1'b0;
assign ex2_far_sub_rd2_inc0_rne    = !ex2_far_sub_sum[0] && ex2_f1_x_far[52] && ~far_part_s ||
                                     !ex2_f1_x_far[52];
assign ex2_far_sub_rd2_dec1_rne    = !ex2_far_sub_rd2_inc0_rne;
assign ex2_far_sub_rd2_inc1_rtz    = 1'b0;
assign ex2_far_sub_rd2_inc0_rtz    = !ex2_far_sub_rd2_dec1_rtz;
assign ex2_far_sub_rd2_dec1_rtz    = (ex2_f1_x_far[52] || far_part_s);
assign ex2_far_sub_rd2_inc1_rdn    =  1'b0;
assign ex2_far_sub_rd2_inc0_rdn    = ex2_far_sign || ~ex2_f1_x_far[52] && ~far_part_s;
assign ex2_far_sub_rd2_dec1_rdn    = !ex2_far_sub_rd2_inc0_rdn;
assign ex2_far_sub_rd2_inc1_rup    = 1'b0;
assign ex2_far_sub_rd2_inc0_rup    = !ex2_far_sign || ~ex2_f1_x_far[52] && ~far_part_s;
assign ex2_far_sub_rd2_dec1_rup    = !ex2_far_sub_rd2_inc0_rup;
assign ex2_far_sub_rd2_inc1_rmm    = 1'b0;
assign ex2_far_sub_rd2_inc0_rmm    = !ex2_far_sub_rd2_dec1_rmm;
assign ex2_far_sub_rd2_dec1_rmm    =  ex2_f1_x_far[52] && far_part_s;

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

assign ex2_far_sub_rd2_dec1_rslt[53:0] = ex2_far_sub_sum[0] ? {ex2_far_sub_sum[53:1],1'b0} 
                                                            : {ex2_far_sub_sum_sub1[53:1],1'b1};
assign ex2_far_sub_rd2_inc0_rslt[53:0] = ex2_far_sub_sum[53:0];
assign ex2_far_sub_rd2_inc1_rslt[53:0] = ex2_far_sub_sum[0] ? {ex2_far_sub_sum_add1[53:1],1'b0}
                                                            : {ex2_far_sub_sum[53:1],1'b1};
assign ex2_far_sub_rd2_result[53:0]    = {54{!ex2_act_add && ex2_far_sub_rd2_inc1}} & ex2_far_sub_rd2_inc1_rslt[53:0] |
                                         {54{!ex2_act_add && ex2_far_sub_rd2_inc0}} & ex2_far_sub_rd2_inc0_rslt[53:0] |
                                         {54{!ex2_act_add && ex2_far_sub_rd2_dec1}} & ex2_far_sub_rd2_dec1_rslt[53:0];
// there is a cornercase
// which the ex2_far_sub_sum is 1.000000000,and ex2_f_x_val is not zero, 
// in this case the round bit should be the second situation, even though 
// the ex2_far_sub_sum[53] is 1.
assign ex2_far_doub_sub_result[53:0]   = ex2_far_sub_sum[53] && (ex2_far_sub_sum_sub1[53] || ex2_far_sub_sum[0])  ? ex2_far_sub_rd1_result[53:0]
                                                                                         : ex2_far_sub_rd2_result[53:0];
assign ex2_far_sing_sub_result[24:0]   = ex2_far_sub_sum[24] && (ex2_far_sub_sum_sub1[24] || ex2_far_sub_sum[0]) ? ex2_far_sub_rd1_result[24:0]
                                                             : ex2_far_sub_rd2_result[24:0];
assign ex2_far_doub_sub_expnt[10:0]    = ex2_far_doub_sub_result[53] ? ex2_far_e_val_m[10:0]  
                                                             : ex2_far_e_val_s[10:0];
assign ex2_far_sing_sub_expnt[10:0]    = ex2_far_sing_sub_result[24] ? ex2_far_e_val_m[10:0]  
                                                             : ex2_far_e_val_s[10:0];   
assign ex2_far_doub_result_t[53:0]       = ex2_far_doub_sub_result[53:0] |
                                         ex2_far_doub_add_result[53:0];  
assign ex2_far_sing_result_t[24:0]       = ex2_far_sing_sub_result[24:0] |
                                         ex2_far_sing_add_result[24:0];
assign ex2_far_doub_result[52:0]       =  fadd_ex2_src_both_denorm || ex2_far_doub_result_t[53] ? ex2_far_doub_result_t[53:1]
                                                                      : ex2_far_doub_result_t[52:0];
assign ex2_far_sing_result[23:0]       =  fadd_ex2_src_both_denorm || ex2_far_sing_result_t[24] ? ex2_far_sing_result_t[24:1]
                                                                      : ex2_far_doub_result_t[23:0];
assign ex2_far_doub_expnt[10:0]        = ex2_act_add ? ex2_far_doub_add_expnt[10:0]
                                                     : ex2_far_doub_sub_expnt[10:0];
assign ex2_far_sing_expnt[10:0]        = ex2_act_add ? ex2_far_sing_add_expnt[10:0]
                                                     : ex2_far_sing_sub_expnt[10:0];
assign ex2_far_e_val_s[11:0] =  ex2_src0_e[11:0] - 12'b1;
assign ex2_far_e_val_m[11:0] =  ex2_src0_e[11:0];
assign ex2_far_e_val_p[11:0] =  ex2_src0_e[11:0] + 12'b1;

//assign ex2_far_e_
//  
//
//assign ex2_far_e[10:0]       = {11{ex2_far_e_sub }}    & ex2_far_e_val_s[10:0] | 
//                               {11{ex2_far_e_main}}    & ex2_far_e_val_m[10:0] | 
//                               {11{ex2_far_e_plus}}    & ex2_far_e_val_p[10:0] |
//                               {11{ex2_far_e_plus_dn}} & ex2_far_e_val_dn[10:0];                             

assign ex2_far_sign  = ex2_act_s;

//Far Path Expt result
//ex2_far_of when emax && e need plus by 1
assign ex2_far_of = ex2_src0_emax && !ex2_src1_is_cnan && ex2_act_add && 
                    (ex2_double && (ex2_far_add_sum[53] || ex2_far_add_rd1_result[53]) ||
                     ex2_single && ex2_far_doub_add_result[24]);
//ex2_far_uf when e is zero, which will not happen in far path,
//dn+dn is exact,it will not cause uf
//assign ex2_far_uf = 1'b0;
//ex2_far_nx when uf/of/round bit not zero
//assign ex2_far_nx = |ex2_f1_x_far[53:0];
assign ex2_double_nor_nx = ((ex2_act_add && (ex2_f1_x_far[53]||ex2_far_add_sum[53]&&ex2_far_add_sum[0]) || !ex2_act_add && ex2_far_sub_sum[53] && ex2_far_sub_sum[0]) || |ex2_f1_x_far[52:0]);
assign ex2_single_nor_nx = ((ex2_act_add && (ex2_f1_x_far[53]||ex2_far_add_sum[24]&&ex2_far_add_sum[0]) || !ex2_act_add && ex2_far_sub_sum[24] && ex2_far_sub_sum[0]) || |ex2_f1_x_far[52:0]);

assign ex2_far_nx = //ex2_far_uf || 
                    ex2_far_of ||
                   !ex2_src0_is_cnan &&
                   !ex2_src1_is_cnan &&
                   (ex2_double&&ex2_double_nor_nx ||
                    ex2_single&&ex2_single_nor_nx);
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
assign ex2_close_dn_shift_pre[53:0] = ex2_close_sum[53:0];
// &CombBeg; @1149
always @( ex2_close_dn_shift_pre[53:0]
       or ex2_src0_e[10:0])
begin
case(ex2_src0_e[10:0])
  11'd0 : ex2_close_dn_shift[52:0] = ex2_close_dn_shift_pre[53:1];
  11'd1 : ex2_close_dn_shift[52:0] = ex2_close_dn_shift_pre[53:1];
  11'd2 : ex2_close_dn_shift[52:0] = ex2_close_dn_shift_pre[52:0];
  11'd3 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[51:0],1'b0};
  11'd4 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[50:0],2'b0};
  11'd5 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[49:0],3'b0};
  11'd6 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[48:0],4'b0};
  11'd7 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[47:0],5'b0};
  11'd8 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[46:0],6'b0};
  11'd9 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[45:0],7'b0};
  11'd10 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[44:0],8'b0};
  11'd11 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[43:0],9'b0};
  11'd12 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[42:0],10'b0};
  11'd13 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[41:0],11'b0};
  11'd14 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[40:0],12'b0};
  11'd15 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[39:0],13'b0};
  11'd16 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[38:0],14'b0};
  11'd17 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[37:0],15'b0};
  11'd18 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[36:0],16'b0};
  11'd19 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[35:0],17'b0};
  11'd20 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[34:0],18'b0};
  11'd21 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[33:0],19'b0};
  11'd22 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[32:0],20'b0};
  11'd23 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[31:0],21'b0};
  11'd24 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[30:0],22'b0};
  11'd25 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[29:0],23'b0};
  11'd26 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[28:0],24'b0};
  11'd27 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[27:0],25'b0};
  11'd28 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[26:0],26'b0};
  11'd29 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[25:0],27'b0};
  11'd30 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[24:0],28'b0};
  11'd31 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[23:0],29'b0};
  11'd32 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[22:0],30'b0};
  11'd33 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[21:0],31'b0};
  11'd34 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[20:0],32'b0};
  11'd35 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[19:0],33'b0};
  11'd36 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[18:0],34'b0};
  11'd37 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[17:0],35'b0};
  11'd38 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[16:0],36'b0};
  11'd39 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[15:0],37'b0};
  11'd40 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[14:0],38'b0};
  11'd41 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[13:0],39'b0};
  11'd42 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[12:0],40'b0};
  11'd43 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[11:0],41'b0};
  11'd44 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[10:0],42'b0};
  11'd45 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[9:0],43'b0};
  11'd46 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[8:0],44'b0};
  11'd47 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[7:0],45'b0};
  11'd48 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[6:0],46'b0};
  11'd49 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[5:0],47'b0};
  11'd50 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[4:0],48'b0};
  11'd51 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[3:0],49'b0};
  11'd52 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[2:0],50'b0};
  11'd53 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[1:0],51'b0};
  11'd54 : ex2_close_dn_shift[52:0] = {ex2_close_dn_shift_pre[0],52'b0};
  default: ex2_close_dn_shift[52:0] = 53'b0;
endcase
// &CombEnd; @1208
end

//shift fraction according to exponent:
//1. src0_exp ==0, exponent is zero
//2. src0_exp>=1, shift fraction by exponen,and make exponent equal to 1
//note: dn result GRS will all equal to zero,so no rounding is necessory
//assign fadd_ex2_close_ff1[5:0] = fadd_ex2_close_shift ? fadd_ex2_close_ff1_s1[5:0]
//                                                      : fadd_ex2_close_ff1_s0[5:0];
assign ex2_close_dn_diff[11:0] = {1'b0,ex2_src0_e[10:0]} - {6'b0,fadd_ex2_close_ff1[5:0]};
assign ex2_close_dn_sel_nor    = ex2_close_dn_diff[11] 
                              || (~|ex2_close_dn_diff[11:0])
                              || (~|ex2_close_dn_diff[11:1]) && ex2_close_dn_diff[0];
assign ex2_close_dn_sel       =  ex2_close_dn_sel_nor;      
assign ex2_close_dn_e[10:0]    = (~|ex2_src0_e[10:0])  //src0 equal zer0
                               ? 11'b0
                               : {10'b0,ex2_close_dn_shift[52]}; 


//After rounding, The first 1 will appear on n+1,n,n-1,n-2 four location in total
assign ex2_close_ff1_e_adder0_2[11:0] = {1'b0,ex2_src0_e[10:0]};
assign ex2_close_ff1_e_adder0_3[11:0] = {1'b0,ex2_src0_e[10:0]} - 12'b1;
assign ex2_close_ff1_e_adder0_4[11:0] = {1'b0,ex2_src0_e[10:0]} - 12'b10;

assign ex2_close_ff1_e_adder1[11:0] = {12{ex2_close_ff1_onehot[53]}} & 12'b0000_0000_0000 | 
                                      {12{ex2_close_ff1_onehot[52]}} & 12'b1111_1111_1111 | 
                                      {12{ex2_close_ff1_onehot[51]}} & 12'b1111_1111_1110 | 
                                      {12{ex2_close_ff1_onehot[50]}} & 12'b1111_1111_1101 | 
                                      {12{ex2_close_ff1_onehot[49]}} & 12'b1111_1111_1100 | 
                                      {12{ex2_close_ff1_onehot[48]}} & 12'b1111_1111_1011 | 
                                      {12{ex2_close_ff1_onehot[47]}} & 12'b1111_1111_1010 | 
                                      {12{ex2_close_ff1_onehot[46]}} & 12'b1111_1111_1001 | 
                                      {12{ex2_close_ff1_onehot[45]}} & 12'b1111_1111_1000 | 
                                      {12{ex2_close_ff1_onehot[44]}} & 12'b1111_1111_0111 | 
                                      {12{ex2_close_ff1_onehot[43]}} & 12'b1111_1111_0110 | 
                                      {12{ex2_close_ff1_onehot[42]}} & 12'b1111_1111_0101 | 
                                      {12{ex2_close_ff1_onehot[41]}} & 12'b1111_1111_0100 | 
                                      {12{ex2_close_ff1_onehot[40]}} & 12'b1111_1111_0011 | 
                                      {12{ex2_close_ff1_onehot[39]}} & 12'b1111_1111_0010 | 
                                      {12{ex2_close_ff1_onehot[38]}} & 12'b1111_1111_0001 | 
                                      {12{ex2_close_ff1_onehot[37]}} & 12'b1111_1111_0000 | 
                                      {12{ex2_close_ff1_onehot[36]}} & 12'b1111_1110_1111 | 
                                      {12{ex2_close_ff1_onehot[35]}} & 12'b1111_1110_1110 | 
                                      {12{ex2_close_ff1_onehot[34]}} & 12'b1111_1110_1101 | 
                                      {12{ex2_close_ff1_onehot[33]}} & 12'b1111_1110_1100 | 
                                      {12{ex2_close_ff1_onehot[32]}} & 12'b1111_1110_1011 | 
                                      {12{ex2_close_ff1_onehot[31]}} & 12'b1111_1110_1010 | 
                                      {12{ex2_close_ff1_onehot[30]}} & 12'b1111_1110_1001 | 
                                      {12{ex2_close_ff1_onehot[29]}} & 12'b1111_1110_1000 | 
                                      {12{ex2_close_ff1_onehot[28]}} & 12'b1111_1110_0111 | 
                                      {12{ex2_close_ff1_onehot[27]}} & 12'b1111_1110_0110 | 
                                      {12{ex2_close_ff1_onehot[26]}} & 12'b1111_1110_0101 | 
                                      {12{ex2_close_ff1_onehot[25]}} & 12'b1111_1110_0100 | 
                                      {12{ex2_close_ff1_onehot[24]}} & 12'b1111_1110_0011 | 
                                      {12{ex2_close_ff1_onehot[23]}} & 12'b1111_1110_0010 | 
                                      {12{ex2_close_ff1_onehot[22]}} & 12'b1111_1110_0001 | 
                                      {12{ex2_close_ff1_onehot[21]}} & 12'b1111_1110_0000 | 
                                      {12{ex2_close_ff1_onehot[20]}} & 12'b1111_1101_1111 | 
                                      {12{ex2_close_ff1_onehot[19]}} & 12'b1111_1101_1110 | 
                                      {12{ex2_close_ff1_onehot[18]}} & 12'b1111_1101_1101 | 
                                      {12{ex2_close_ff1_onehot[17]}} & 12'b1111_1101_1100 | 
                                      {12{ex2_close_ff1_onehot[16]}} & 12'b1111_1101_1011 | 
                                      {12{ex2_close_ff1_onehot[15]}} & 12'b1111_1101_1010 | 
                                      {12{ex2_close_ff1_onehot[14]}} & 12'b1111_1101_1001 | 
                                      {12{ex2_close_ff1_onehot[13]}} & 12'b1111_1101_1000 | 
                                      {12{ex2_close_ff1_onehot[12]}} & 12'b1111_1101_0111 | 
                                      {12{ex2_close_ff1_onehot[11]}} & 12'b1111_1101_0110 | 
                                      {12{ex2_close_ff1_onehot[10]}} & 12'b1111_1101_0101 | 
                                      {12{ex2_close_ff1_onehot[ 9]}} & 12'b1111_1101_0100 | 
                                      {12{ex2_close_ff1_onehot[ 8]}} & 12'b1111_1101_0011 | 
                                      {12{ex2_close_ff1_onehot[ 7]}} & 12'b1111_1101_0010 | 
                                      {12{ex2_close_ff1_onehot[ 6]}} & 12'b1111_1101_0001 | 
                                      {12{ex2_close_ff1_onehot[ 5]}} & 12'b1111_1101_0000 | 
                                      {12{ex2_close_ff1_onehot[ 4]}} & 12'b1111_1100_1111 | 
                                      {12{ex2_close_ff1_onehot[ 3]}} & 12'b1111_1100_1110 | 
                                      {12{ex2_close_ff1_onehot[ 2]}} & 12'b1111_1100_1101 | 
                                      {12{ex2_close_ff1_onehot[ 1]}} & 12'b1111_1100_1100 |
                                      {12{ex2_close_ff1_onehot[ 0]}} & 12'b1111_1100_1011;


assign ex2_close_e_2[11:0] = ex2_close_ff1_e_adder0_2[11:0] + ex2_close_ff1_e_adder1[11:0];
assign ex2_close_e_3[11:0] = ex2_close_ff1_e_adder0_3[11:0] + ex2_close_ff1_e_adder1[11:0];
assign ex2_close_e_4[11:0] = ex2_close_ff1_e_adder0_4[11:0] + ex2_close_ff1_e_adder1[11:0];


//Round prepare Logic
//  |MSB|... ...|LSB|Guard|Round|Sticky...|
//  L for LSB,    is the last valid bit
//  G for Guard,  is the first rounding bit
//  R for Round,  is the second rounding bit
//  S for Sticky, is logic or of rest rounding bit
//Close Path R and S bit always be zero
assign ex2_close_l = (ex2_double) &&  ex2_close_sum[1]  ||
                      ex2_single  &&  ex2_close_sum[30];
  
                  
//assign ex2_close_g =  ex2_f1_x_close;
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
//assign ex2_close_inc0_rne = !ex2_close_dec1_rne;
//assign ex2_close_dec1_rne = ex2_close_g && (ex2_close_l || ex2_close_e_m1) || 
//                            ex2_close_sp_dec1;
//
//assign ex2_close_inc0_rtz = !ex2_close_dec1_rtz;
//assign ex2_close_dec1_rtz = ex2_close_g;
//
//assign ex2_close_inc0_rup = !ex2_close_dec1_rup;
//assign ex2_close_dec1_rup = ex2_close_g && (ex2_close_sign || ex2_close_e_m1) || 
//                           ex2_close_sp_dec1;
//
////assign ex2_close_inc1_rm = 1'b0;
//assign ex2_close_inc0_rdn = !ex2_close_dec1_rdn;
//assign ex2_close_dec1_rdn = ex2_close_g && (!ex2_close_sign || ex2_close_e_m1) || 
//                           ex2_close_sp_dec1;
//
//assign ex2_close_inc0_rmm = !ex2_close_dec1_rmm;
//assign ex2_close_dec1_rmm = ex2_close_g && ex2_close_e_m1 || 
//                            ex2_close_sp_dec1;

//just reuse the name of the dec , actually, it is add
assign ex2_close_sum_b0     = ex2_single && ex2_close_sum[29] || ex2_double && ex2_close_sum[0];
assign ex2_close_inc0_rne   = !ex2_close_dec1_rne;
assign ex2_close_dec1_rne   = ex2_close_sum[53] && ex2_close_l && ex2_close_sum_b0;

assign ex2_close_inc0_rtz  = 1'b1;
assign ex2_close_dec1_rtz  = 1'b0;

assign ex2_close_inc0_rup  = !ex2_close_dec1_rup;
assign ex2_close_dec1_rup  = !ex2_close_sign && ex2_close_sum[53] && ex2_close_sum_b0;

assign ex2_close_inc0_rdn  = !ex2_close_dec1_rdn;
assign ex2_close_dec1_rdn  =  ex2_close_sign && ex2_close_sum[53] && ex2_close_sum_b0;

assign ex2_close_inc0_rmm  = !ex2_close_dec1_rmm;
assign ex2_close_dec1_rmm  = ex2_close_sum[53] && ex2_close_sum_b0;

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
//From the round select logic, we can find that the add1 will only happen to
//the situation when ex2_close_sum[53] is 1
// so the shift logic will only happen to ex2_close_sum.

//According to FF1 Location to Get Result Fraction
//Because close path act_sub, G round bit must be 1
//Thus we shift "0" in to f_result
//ex2_close_f_p0
// &Instance("ct_fadd_onehot_sel_d","x_ct_fadd_onehot_sel_d_p0_1"); @1380
ct_fadd_onehot_sel_d  x_ct_fadd_onehot_sel_d_p0_1 (
  .data_in                    (ex2_close_sum[53:0]       ),
  .onehot                     (ex2_close_ff1_onehot[53:0]),
  .result                     (ex2_close_f_2_p0[53:0]    )
);

// &Connect( @1381
//          .onehot      (ex2_close_ff1_onehot[53:0]), @1382
//          .data_in     (ex2_close_sum[53:0]), @1383
//          .result      (ex2_close_f_2_p0[53:0]) @1384
//         ); @1385
        
//here ,no need to calulate the sum_add1 in the first stage
assign close_add1_oper2[53:0]  = {54{ex2_double}} & 54'b10 |
                                 {54{ex2_single}} & {24'b1,30'b0};
                               
assign ex2_close_sum_m1[53:0]  =  fadd_ex2_close_sum[53:0] +  close_add1_oper2[53:0];                            
assign ex2_close_sft_f[51:0] = ex2_close_f_2_p0[53] ? ex2_close_f_2_p0[52:1] :
                               ex2_close_f_2_p0[52] ? {ex2_close_f_2_p0[51:0]}
                                                    : {ex2_close_f_2_p0[50:0],1'b0};
assign ex2_close_m1_f[51:0]  = ex2_close_sum_m1[52:1];
                               
assign ex2_close_f[51:0]   = {52{ex2_close_inc0}} & ex2_close_sft_f[51:0] |
                             {52{ex2_close_dec1}} & ex2_close_m1_f[51:0];
assign ex2_close_e[11:0] = ex2_close_f_2_p0[53] ? ex2_close_e_2[11:0] :
                           ex2_close_f_2_p0[52] ? ex2_close_e_3[11:0] 
                                             : ex2_close_e_4[11:0];  

//DN sub Zero, Special condition
//assign ex2_close_r_is_snm = ex2_src0_is_snm && ex2_src1_is_0 || 
//                            ex2_src1_is_snm && ex2_src0_is_0;
//Close Path Expt result
//ex2_close_of will never happen
//assign ex2_close_of = 1'b0;
//ex2_close_uf when e is zero or less than zero
//ex2_close_r_is_0 when (ed==0) && (src0_f == src1_f)
//ex2_close_nx when uf/of/round bit not zero
//assign ex2_close_nx = ex2_close_g && !ex2_close_e_dec;
assign ex2_close_nx   = ex2_close_sum[53] && (ex2_double && ex2_close_sum[0] || ex2_single && ex2_close_sum[29]);
//Far Path Special result
//ex2_close_r_is_lfn will never happen
//assign ex2_close_r_is_lfn = 1'b0;
//ex2_close_r_is_inf will never happen
//assign ex2_close_r_is_inf = 1'b0;
//ex2_close_r_is_inf when ex2_close_uf
assign ex2_close_r_is_0   = !fadd_ex2_ed_is_1 && 
                             ex2_close_f_eq;
assign ex2_close_f_eq     = (ex2_src0_f[52:0] == ex2_src1_f[52:0]);

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
                       (ex2_src0_is_inf  && ex2_src1_is_inf)  && ex2_act_sub ||
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
                       ex2_far_r_is_lfn    && ex2_far_sel) && !ex2_r_sel_src2 && !ex2_op_sel;
//EX2_r_is_0
//  1.src0_is_0 && src1_is_0
//  2.sct_sub && src0_eq_src1(Only Close path will happen)
assign ex2_r_is_0    = (ex2_src0_is_0 && ex2_src1_is_0    || 
                       ex2_close_sel && ex2_close_r_is_0) && 
                      !ex2_r_is_qnan_a_src2 && !ex2_op_sel;
//EX2_r_is_snm
//assign ex2_r_is_snm  = ex2_close_sel && ex2_close_r_is_snm && !ex2_r_is_qnan_a_src2;
//EX2_r_is_dn
//  1.close way E less or equal to zero
assign ex2_r_is_dn   = ex2_close_sel         &&
                       ex2_close_dn_sel      && 
                       !ex2_r_is_0            &&
                       !ex2_r_is_qnan_a_src2  && !ex2_op_sel;

//EX2_sign
assign ex2_sign      = ex2_bypass_sel && ex2_bypass_sign || 
                       ex2_close_sel  && ex2_close_sign  || 
                       ex2_far_sel    && ex2_far_sign;


//EX2_special Result
assign ex2_src0_is_cnan_org  = (ex2_src_change) ? ex2_src1_is_cnan : ex2_src0_is_cnan; 
assign ex2_src0_is_qnan_org  = (ex2_src_change) ? ex2_src1_is_qnan : ex2_src0_is_qnan;
assign ex2_src1_is_cnan_org  = (ex2_src_change) ? ex2_src0_is_cnan : ex2_src1_is_cnan; 
assign ex2_src1_is_qnan_org  = (ex2_src_change) ? ex2_src0_is_qnan : ex2_src1_is_qnan;
assign ex2_src0_qnan_f[50:0] = (ex2_src_change) ? ex2_src1_f[50:0] : ex2_src0_f[50:0];
assign ex2_src1_qnan_f[50:0] = (ex2_src_change) ? ex2_src0_f[50:0] : ex2_src1_f[50:0];
assign ex2_src0_qnan_s       = (ex2_src_change) ? ex2_src1_s : ex2_src0_s;
assign ex2_src1_qnan_s       = (ex2_src_change) ? ex2_src0_s : ex2_src1_s;
// &CombBeg; @1480
always @( ex2_src1_qnan_f[50:0]
       or ex2_src1_is_qnan_org
       or vfpu_yy_xx_dqnan
       or ex2_src0_is_snan
       or ex2_src1_is_cnan_org
       or ex2_src0_is_cnan_org
       or ex2_single
       or ex2_src1_f[50:0]
       or ex2_src0_is_qnan_org
       or ex2_double
       or ex2_src0_f[50:0]
       or ex2_src1_is_snan
       or ex2_src0_qnan_f[50:0])
begin
if(ex2_src0_is_snan && vfpu_yy_xx_dqnan)
  ex2_qnan_f[51:0] =  {52{ex2_double}}  & {1'b1,ex2_src0_f[50:0]} |
                      {52{ex2_single}}  & {29'b0,1'b1,ex2_src0_f[21:0]};
else if(ex2_src1_is_snan && vfpu_yy_xx_dqnan)
  ex2_qnan_f[51:0] =  {52{ex2_double}} & {1'b1,ex2_src1_f[50:0]} |
                      {52{ex2_single}} & {29'b0,1'b1,ex2_src1_f[21:0]};
else if(ex2_src0_is_cnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_f[51:0] =  {52{ex2_double}} & {1'b1,51'b0} |
                      {52{ex2_single}} & {29'b0,1'b1,22'b0} ;
else if(ex2_src0_is_qnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_f[51:0] = {52{ex2_double}} & {1'b1,ex2_src0_qnan_f[50:0]} |
                     {52{ex2_single}} & {29'b0,1'b1,ex2_src0_qnan_f[21:0]};
else if(ex2_src1_is_cnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_f[51:0] = {52{ex2_double}} & {1'b1,51'b0} |
                     {52{ex2_single}} & {29'b0,1'b1,22'b0};
else if(ex2_src1_is_qnan_org && vfpu_yy_xx_dqnan)
  ex2_qnan_f[51:0] = {52{ex2_double}} & {1'b1,ex2_src1_qnan_f[50:0]} |
                     {52{ex2_single}} & {29'b0,1'b1,ex2_src1_qnan_f[21:0]};
else
  ex2_qnan_f[51:0] = {52{ex2_double}} & {1'b1,51'b0} |
                     {52{ex2_single}} & {29'b0,1'b1,22'b0} ;
// &CombEnd; @1502
end
  
// &CombBeg; @1504
always @( ex2_src1_is_qnan_org
       or vfpu_yy_xx_dqnan
       or ex2_src1_s
       or ex2_src0_is_snan
       or ex2_src1_is_cnan_org
       or ex2_src0_qnan_s
       or ex2_src1_qnan_s
       or ex2_src0_is_cnan_org
       or ex2_src0_is_qnan_org
       or ex2_src0_s
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
// &CombEnd; @1519
end


//Special Result Select Condition
assign ex2_spe_r_sel   = ex2_r_is_qnan_a_src2 || 
                         ex2_r_is_inf         || 
                         ex2_r_is_lfn         || 
                         ex2_r_is_dn          ||
                         ex2_r_is_0;
assign ex2_r_0_sign    = ex2_op_add && 
                        ((ex2_src0_s && ex2_src1_s) || 
                         (ex2_src0_s || ex2_src1_s) && ex2_rm_rdn) || 
                         ex2_op_sub && 
                        ((ex2_src0_s && !ex2_src1_s) || 
                         (ex2_src0_s || !ex2_src1_s) && ex2_rm_rdn);
assign ex2_spe_r_qnan[63:0] = {64{ex2_double}} & {               ex2_qnan_s,{11{1'b1}}, ex2_qnan_f[51:0]} |
                              {64{ex2_single}} & {32'hffffffff,  ex2_qnan_s,{ 8{1'b1}}, ex2_qnan_f[22:0]};
assign ex2_spe_r_inf[63:0]  = {64{ex2_double}} &  {               ex2_sign, {11{1'b1}}, 52'b0} |
                              {64{ex2_single}} &  {32'hffffffff,  ex2_sign, { 8{1'b1}}, 23'b0};
assign ex2_spe_r_lfn[63:0]  = {64{ex2_double}} & {               ex2_sign, {{10{1'b1}},1'b0}, {52{1'b1}}} |
                              {64{ex2_single}} & {32'hffffffff,  ex2_sign, {{ 7{1'b1}},1'b0}, {23{1'b1}}};
//assign ex2_spe_r_src0_snm[63:0] = {64{ex2_double}} & {               ex2_sign, 11'b1, ex2_src0_f[51:0]} |
//                                  {64{ex2_single}} & {32'hffffffff,  ex2_sign, 8'b1,  ex2_src0_f[22:0]}; 
//assign ex2_spe_r_src1_snm[63:0] = {64{ex2_double}} & {               ex2_sign, 11'b1, ex2_src1_f[51:0]} |
//                                  {64{ex2_single}} & {32'hffffffff,  ex2_sign, 8'b1,  ex2_src1_f[22:0]};
//assign ex2_spe_r_snm[63:0]  = (ex2_src0_is_snm) ? ex2_spe_r_src0_snm[63:0] 
//                                                : ex2_spe_r_src1_snm[63:0];
assign ex2_spe_r_0[63:0]    = {64{ex2_double}} & {               ex2_r_0_sign, 63'b0} |
                              {64{ex2_single}} & {32'hffffffff,  ex2_r_0_sign, 31'b0};
assign ex2_spe_r_dn[63:0]   = {64{ex2_double}} & {             ex2_sign,ex2_close_dn_e[10:0],ex2_close_dn_shift[51:0]} |
                              {64{ex2_single}} & {32'hffffffff,ex2_sign,ex2_close_dn_e[7:0],ex2_close_dn_shift[51:29]};
//Merge Special Result
// &CombBeg; @1551
always @( ex2_r_is_qnan_a_src2
       or ex2_spe_r_inf[63:0]
       or ex2_op_sel
       or ex2_spe_r_0[63:0]
       or ex2_spe_r_dn[63:0]
       or ex2_r_is_lfn
       or ex2_qnan_a_src2_result[63:0]
       or ex2_spe_r_lfn[63:0]
       or ex2_r_is_0
       or ex2_r_is_inf
       or ex2_r_is_dn)
begin
case({ex2_r_is_qnan_a_src2 || ex2_op_sel,ex2_r_is_inf,ex2_r_is_lfn,ex2_r_is_dn,ex2_r_is_0})
  5'b10000 : ex2_spe_result[63:0] = ex2_qnan_a_src2_result[63:0];
  5'b01000 : ex2_spe_result[63:0] = ex2_spe_r_inf[63:0];
  5'b00100 : ex2_spe_result[63:0] = ex2_spe_r_lfn[63:0];
  5'b00010 : ex2_spe_result[63:0] = ex2_spe_r_dn[63:0];
  5'b00001 : ex2_spe_result[63:0] = ex2_spe_r_0[63:0];
  default   : ex2_spe_result[63:0] = {64{1'bx}};
endcase
// &CombEnd; @1560
end
assign ex2_r_sel_src2 = 1'b0;
assign ex2_qnan_a_src2_result[63:0] = ex2_op_sel     ? ex2_sel_result[63:0] :ex2_spe_r_qnan[63:0];



//EX2_normal Result
assign ex2_nor_r_bypass[63:0] =  {64{ex2_double}} & {ex2_sign, ex2_bypass_e[10:0], ex2_bypass_f[51:0]} |
                                 {64{ex2_single}} & {32'hffffffff,  ex2_sign, 
                                                    ex2_bypass_e[ 7:0], ex2_bypass_f[22:0]};
assign ex2_nor_r_far[63:0]    = {64{ex2_double}} & { ex2_sign, ex2_far_doub_expnt[10:0], ex2_far_doub_result[51:0]} |
                                {64{ex2_single}} & {32'hffffffff,  ex2_sign,
                                                    ex2_far_sing_expnt[ 7:0], ex2_far_sing_result[22:0]};
assign ex2_nor_r_close[63:0]  = {64{ex2_double}} & {ex2_sign, ex2_close_e[10:0], ex2_close_f[51: 0]} |
                                {64{ex2_single}} & {32'hffffffff,  ex2_sign, ex2_close_e[ 7:0], ex2_close_f[51:29]} ;
// &CombBeg; @1582
always @( ex2_bypass_sel
       or ex2_close_sel
       or ex2_nor_r_far[63:0]
       or ex2_nor_r_bypass[63:0]
       or ex2_nor_r_close[63:0]
       or ex2_far_sel)
begin
case({ex2_bypass_sel,ex2_far_sel,ex2_close_sel})
  3'b100  : ex2_nor_result[63:0] = ex2_nor_r_bypass[63:0];
  3'b010  : ex2_nor_result[63:0] = ex2_nor_r_far[63:0];
  3'b001  : ex2_nor_result[63:0] = ex2_nor_r_close[63:0];
  default : ex2_nor_result[63:0] = {64{1'bx}};
endcase
// &CombEnd; @1589
end

//MAXNM/MINNM Result
//MAX & MIN Inst result should also obey flush mode
assign ex2_src0_e_fm[10:0] = ex2_src0_e[10:0];
assign ex2_src1_e_fm[10:0] = ex2_src1_e[10:0];
// &CombBeg; @1595
always @( ex2_src_change
       or ex2_src1_s
       or ex2_src0_is_snan
       or ex2_src0_f[51:0]
       or ex2_src1_is_qnan
       or ex2_qnan_s
       or ex2_sign
       or ex2_src1_e_fm[10:0]
       or ex2_src1_is_0
       or ex2_single
       or ex2_src0_s
       or ex2_double
       or ex2_src1_f[51:0]
       or ex2_src0_is_0
       or ex2_src0_is_qnan
       or ex2_qnan_f[51:0]
       or ex2_src0_e_fm[10:0]
       or ex2_src1_is_snan)
begin
if(ex2_src0_is_snan || ex2_src1_is_snan || 
   ex2_src0_is_qnan && ex2_src1_is_qnan)
ex2_max_nm_result[63:0] =  {64{ex2_double}} & {ex2_qnan_s, {11{1'b1}}, ex2_qnan_f[51:0]} |
                           {64{ex2_single}} & {32'hffffffff, ex2_qnan_s, { 8{1'b1}}, ex2_qnan_f[22:0]};
else if(ex2_src0_is_0 && ex2_src1_is_0)
ex2_max_nm_result[63:0] = {64{ex2_double}} & {              {ex2_src0_s & ex2_src1_s}, {11'b0}, 52'b0} |
                          {64{ex2_single}} & {32'hffffffff, {ex2_src0_s & ex2_src1_s}, { 8'b0}, 23'b0};
else if(ex2_src0_is_qnan)
ex2_max_nm_result[63:0] = {64{ex2_double}} & {              ex2_src1_s, ex2_src1_e_fm[10:0], ex2_src1_f[51:0]}|
                          {64{ex2_single}} & {32'hffffffff, ex2_src1_s, ex2_src1_e_fm[ 7:0], ex2_src1_f[22:0]};
else if(ex2_src1_is_qnan)
ex2_max_nm_result[63:0] = {64{ex2_double}} & {              ex2_src0_s, ex2_src0_e_fm[10:0], ex2_src0_f[51:0]}|
                          {64{ex2_single}} & {32'hffffffff, ex2_src0_s, ex2_src0_e_fm[ 7:0], ex2_src0_f[22:0]};
else if(ex2_sign ^ ex2_src_change)
ex2_max_nm_result[63:0] = {64{ex2_double}} & {              ex2_src1_s, ex2_src1_e_fm[10:0], ex2_src1_f[51:0]}|
                          {64{ex2_single}} & {32'hffffffff, ex2_src1_s, ex2_src1_e_fm[ 7:0], ex2_src1_f[22:0]};
else //if(!ex2_sign ^ ex2_src_change)
ex2_max_nm_result[63:0] = {64{ex2_double}} & {              ex2_src0_s, ex2_src0_e_fm[10:0], ex2_src0_f[51:0]}|
                          {64{ex2_single}} & {32'hffffffff, ex2_src0_s, ex2_src0_e_fm[ 7:0], ex2_src0_f[22:0]};
// &CombEnd; @1615
end

//MINNM
// &CombBeg; @1618
always @( ex2_src_change
       or ex2_src1_s
       or ex2_src0_is_snan
       or ex2_src0_f[51:0]
       or ex2_src1_is_qnan
       or ex2_qnan_s
       or ex2_sign
       or ex2_src1_e_fm[10:0]
       or ex2_src1_is_0
       or ex2_single
       or ex2_src0_s
       or ex2_double
       or ex2_src1_f[51:0]
       or ex2_src0_is_0
       or ex2_src0_is_qnan
       or ex2_qnan_f[51:0]
       or ex2_src0_e_fm[10:0]
       or ex2_src1_is_snan)
begin
if(ex2_src0_is_snan || ex2_src1_is_snan || 
   ex2_src0_is_qnan && ex2_src1_is_qnan)
ex2_min_nm_result[63:0] = {64{ex2_double}} & {              ex2_qnan_s, {11{1'b1}}, ex2_qnan_f[51:0]} |
                          {64{ex2_single}} & {32'hffffffff, ex2_qnan_s, { 8{1'b1}}, ex2_qnan_f[22:0]};
else if(ex2_src0_is_0 && ex2_src1_is_0)
ex2_min_nm_result[63:0] = {64{ex2_double}} & {              {ex2_src0_s | ex2_src1_s}, {11'b0}, 52'b0}|
                          {64{ex2_single}} & {32'hffffffff, {ex2_src0_s | ex2_src1_s}, { 8'b0}, 23'b0};
else if(ex2_src0_is_qnan)
ex2_min_nm_result[63:0] = {64{ex2_double}} & {              ex2_src1_s, ex2_src1_e_fm[10:0], ex2_src1_f[51:0]}|
                          {64{ex2_single}} & {32'hffffffff, ex2_src1_s, ex2_src1_e_fm[ 7:0], ex2_src1_f[22:0]};
else if(ex2_src1_is_qnan)
ex2_min_nm_result[63:0] = {64{ex2_double}} & {              ex2_src0_s, ex2_src0_e_fm[10:0], ex2_src0_f[51:0]}|
                          {64{ex2_single}} & {32'hffffffff, ex2_src0_s, ex2_src0_e_fm[ 7:0], ex2_src0_f[22:0]};
else if(!ex2_sign ^ ex2_src_change)
ex2_min_nm_result[63:0] = {64{ex2_double}} & {              ex2_src1_s, ex2_src1_e_fm[10:0], ex2_src1_f[51:0]}|
                          {64{ex2_single}} & {32'hffffffff, ex2_src1_s, ex2_src1_e_fm[ 7:0], ex2_src1_f[22:0]};
else //if(ex2_sign ^ ex2_src_change)
ex2_min_nm_result[63:0] = {64{ex2_double}} & {              ex2_src0_s, ex2_src0_e_fm[10:0], ex2_src0_f[51:0]}|
                          {64{ex2_single}} & {32'hffffffff, ex2_src0_s, ex2_src0_e_fm[ 7:0], ex2_src0_f[22:0]};
// &CombEnd; @1638
end
  
//EX2_cmp Result
//assign ex2_src0_eq_src1 = ex2_close_f_eq && (ex2_src0_e[10:0]==ex2_src1_e[10:0]) && (ex2_src0_s ^~ ex2_src1_s) ||
//                         ex2_src0_is_0 && ex2_src1_is_0;
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
//
//assign ex2_cmp_fle  = (ex2_sign || ex2_src0_eq_src1) && !ex2_cmp_nv;
//
//assign ex2_cmp_flt  = (ex2_sign && !ex2_src0_eq_src1) && 
//                      !ex2_cmp_nv;
//assign ex2_cmp_ford = !ex2_src0_is_snan &&
//                      !ex2_src1_is_snan &&  
//                      !ex2_src0_is_qnan && 
//                      !ex2_src1_is_qnan;  
//
////Merge Final C Result
//assign ex2_cmp_result = ex2_op_feq && ex2_cmp_feq || 
//                        ex2_op_fle && ex2_cmp_fle || 
//                        ex2_op_flt && ex2_cmp_flt ||
//                        ex2_op_fne && ex2_cmp_fne ||
//                        ex2_op_ford && ex2_cmp_ford;
// for the unorder reduction add operation , 
// we will select the result when one of the operand is masked off
// &CombBeg; @1676
// &CombEnd; @1681
assign ex2_sel_result[63:0] = {64{ex2_op_maxnm}} & ex2_max_nm_result[63:0] | 
                              {64{ex2_op_minnm}} & ex2_min_nm_result[63:0] |
                              {64{ex2_op_cmp}}   & {63'b0,ex2_cmp_result};
assign ex2_op_sel       = ex2_op_maxnm || ex2_op_minnm || ex2_op_cmp; 
assign ex2_unord_sel    = 1'b0;
assign ex2_unorder_nv = 1'b0;
//EX2 Select INS Result

//EX2 Result Sel Onehot Signal
assign ex2_final_r_spe  =  ex2_spe_r_sel || ex2_op_sel;
assign ex2_final_r_nor  = !ex2_spe_r_sel && !ex2_op_sel;

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
                     !ex2_src0_is_inf && !ex2_src1_is_inf)&&!ex2_unord_sel;

//ex2_expt_of
//  1.E result add to all 1
assign ex2_expt_of = ((ex2_bypass_of && ex2_bypass_sel || 
                      ex2_far_of    && ex2_far_sel)   && 
                     !ex2_r_is_qnan_a_src2 )&&!ex2_unord_sel;

//Merge expt
assign ex2_expt_pre[4:0] = {ex2_expt_nv,
                            1'b0, //dz
                            ex2_expt_of,
                            1'b0,
                            ex2_expt_nx};
assign ex2_expt[4:0]     = ex2_expt_pre[4:0]            &
                           {2'b11,{3{~ex2_op_sel}}}     &
                           {2'b11,{3{~ex2_op_cmp}}};

//======================Pipe to EX3=========================
//gate clk
// &Instance("gated_clk_cell","x_ex2_pipe_clk"); @1785
gated_clk_cell  x_ex2_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @1786
//           .clk_out        (ex2_pipe_clk),//Out Clock @1787
//           .external_en    (1'b0), @1788
//           .global_en      (cp0_yy_clk_en), @1789
//           .local_en       (ex2_pipe_clk_en),//Local Condition @1790
//           .module_en      (cp0_vfpu_icg_en) @1791
//         ); @1792
assign ex2_pipe_clk_en = ex2_pipedown;
always @(posedge ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    fadd_ex3_r_spe            <=  1'b0;
    fadd_ex3_r_nor            <=  1'b0;
    fadd_ex3_spe_result[63:0] <= 64'b0;
    fadd_ex3_nor_result[63:0] <= 64'b0;    
    fadd_ex3_expt[4:0]        <=  5'b0;
  end
  else if(ex2_pipedown)
  begin
    fadd_ex3_r_spe            <= ex2_final_r_spe;
    fadd_ex3_r_nor            <= ex2_final_r_nor;    
    fadd_ex3_spe_result[63:0] <= ex2_spe_result[63:0];
    fadd_ex3_nor_result[63:0] <= ex2_nor_result[63:0];
    fadd_ex3_expt[4:0]        <= ex2_expt[4:0];
  end
  else
  begin
    fadd_ex3_r_spe            <= fadd_ex3_r_spe;
    fadd_ex3_r_nor            <= fadd_ex3_r_nor;     
    fadd_ex3_spe_result[63:0] <= fadd_ex3_spe_result[63:0];
    fadd_ex3_nor_result[63:0] <= fadd_ex3_nor_result[63:0];
    fadd_ex3_expt[4:0]        <= fadd_ex3_expt[4:0];
  end
end

// &CombBeg; @1822
always @( fadd_ex3_nor_result[63:0]
       or fadd_ex3_r_spe
       or fadd_ex3_r_nor
       or fadd_ex3_spe_result[63:0])
begin
case({fadd_ex3_r_spe,fadd_ex3_r_nor})
  2'b10  : ex3_result[63:0] = fadd_ex3_spe_result[63:0];
  2'b01  : ex3_result[63:0] = fadd_ex3_nor_result[63:0];
  default : ex3_result[63:0] = {64{1'bx}};
endcase
// &CombEnd; @1828
end

assign ex3_expt[4:0]              = fadd_ex3_expt[4:0];
// &ModuleEnd; @1831
endmodule



