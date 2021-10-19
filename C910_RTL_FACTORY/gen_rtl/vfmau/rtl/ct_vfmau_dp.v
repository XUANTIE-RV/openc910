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

// &ModuleBeg; @24
module ct_vfmau_dp(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_ex5_fma_wb_vld,
  ctrl_ex1_ex2_en,
  ctrl_ex1_inst_vld,
  ctrl_ex2_inst_vld,
  ctrl_ex3_inst_vld,
  ctrl_ex4_inst_vld,
  ctrl_ex5_inst_vld,
  dp_mult1_ex1_op0_slice0,
  dp_mult1_ex1_op0_slice0_high,
  dp_mult1_ex1_op1_slice0,
  dp_mult1_ex1_op1_slice0_high,
  dp_mult1_ex1_op2_slice0,
  dp_mult1_ex1_op2_slice0_high,
  dp_mult1_op2_slice0_vl_mask,
  dp_mult1_op2_slice0_vm_mask,
  dp_mult_ex1_op0_slice0_half0,
  dp_mult_ex1_op0_slice0_half0_high,
  dp_mult_ex1_op1_slice0_half0,
  dp_mult_ex1_op1_slice0_half0_high,
  dp_mult_ex1_op2_slice0_half0,
  dp_mult_ex1_op2_slice0_half0_high,
  dp_mult_op2_slice0_vl_half0_mask,
  dp_mult_op2_slice0_vm_half0_mask,
  dp_vfmau_ex1_pipex_dst_vreg,
  dp_vfmau_ex1_pipex_imm0,
  dp_vfmau_pipe6_mla_srcv2_vld,
  dp_vfmau_pipe6_mla_srcv2_vreg,
  dp_vfmau_pipe6_mla_type,
  dp_vfmau_pipe7_mla_srcv2_vld,
  dp_vfmau_pipe7_mla_srcv2_vreg,
  dp_vfmau_pipe7_mla_type,
  dp_vfmau_pipex_inst_type,
  dp_vfmau_pipex_sel,
  dp_vfmau_pipex_vfmau_sel,
  dp_vfmau_rf_pipex_sel,
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
  dp_xx_ex4_fma,
  dp_xx_ex4_half,
  dp_xx_ex4_mult_id,
  dp_xx_ex4_rm,
  forever_cpuclk,
  idu_vfpu_rf_pipex_func,
  idu_vfpu_rf_pipex_gateclk_sel,
  idu_vfpu_rf_pipex_srcv0_fr,
  idu_vfpu_rf_pipex_srcv1_fr,
  idu_vfpu_rf_pipex_srcv2_fr,
  pad_yy_icg_scan_en,
  pipex_dp_ex1_mult_id,
  pipex_dp_ex3_vfmau_ereg_data,
  pipex_dp_ex3_vfmau_freg_data,
  pipex_dp_ex4_vfmau_ereg_data,
  pipex_dp_ex4_vfmau_freg_data,
  pipex_pipe6_ex4_fmla_fwd_vld,
  pipex_pipe6_ex5_ex1_fmla_fwd_vld,
  pipex_pipe6_ex5_ex2_fmla_fwd_vld,
  pipex_pipe7_ex4_fmla_fwd_vld,
  pipex_pipe7_ex5_ex1_fmla_fwd_vld,
  pipex_pipe7_ex5_ex2_fmla_fwd_vld,
  pipex_rbus_ex1_fmla_data_vld,
  pipex_rbus_ex1_fmla_data_vld_dup0,
  pipex_rbus_ex1_fmla_data_vld_dup1,
  pipex_rbus_ex1_fmla_data_vld_dup2,
  pipex_rbus_ex2_fmla_data_vld,
  pipex_rbus_ex2_fmla_data_vld_dup0,
  pipex_rbus_ex2_fmla_data_vld_dup1,
  pipex_rbus_ex2_fmla_data_vld_dup2,
  pipex_rbus_pipe6_fmla_no_fwd,
  pipex_rbus_pipe7_fmla_no_fwd,
  pipex_rbus_vfmau_ereg_wb_data,
  pipex_rbus_vfmau_ereg_wb_vld,
  pipex_rbus_vfmau_freg_wb_data,
  pipex_rbus_vfmau_vreg_wb_vld,
  pipex_vfmau_ex4_fmla_slice0_half0_data,
  pipex_vfmau_ex5_fmla_slice0_data,
  rtu_yy_xx_flush,
  slice0_dp_half0_mult_id,
  slice0_dp_mult1_mult_id,
  slice0_mult1_dp_ex3_mult_expt,
  slice0_mult1_dp_ex3_mult_result,
  slice0_mult1_dp_ex4_expt,
  slice0_mult1_dp_ex4_half_fma_result,
  slice0_mult1_dp_ex4_mult_result,
  slice0_mult1_dp_ex5_fma_expt,
  slice0_mult1_dp_ex5_fma_result,
  slice0_mult1_dp_ex5_fwd_data,
  vfpu_yy_xx_rm
);

// &Ports; @25
input           cp0_vfpu_icg_en;                       
input           cp0_yy_clk_en;                         
input           cpurst_b;                              
input           ctrl_dp_ex5_fma_wb_vld;                
input           ctrl_ex1_ex2_en;                       
input           ctrl_ex1_inst_vld;                     
input           ctrl_ex2_inst_vld;                     
input           ctrl_ex3_inst_vld;                     
input           ctrl_ex4_inst_vld;                     
input           ctrl_ex5_inst_vld;                     
input   [6 :0]  dp_vfmau_ex1_pipex_dst_vreg;           
input   [2 :0]  dp_vfmau_ex1_pipex_imm0;               
input           dp_vfmau_pipe6_mla_srcv2_vld;          
input   [6 :0]  dp_vfmau_pipe6_mla_srcv2_vreg;         
input   [2 :0]  dp_vfmau_pipe6_mla_type;               
input           dp_vfmau_pipe7_mla_srcv2_vld;          
input   [6 :0]  dp_vfmau_pipe7_mla_srcv2_vreg;         
input   [2 :0]  dp_vfmau_pipe7_mla_type;               
input   [5 :0]  dp_vfmau_pipex_inst_type;              
input           dp_vfmau_pipex_sel;                    
input           dp_vfmau_pipex_vfmau_sel;              
input           dp_vfmau_rf_pipex_sel;                 
input           forever_cpuclk;                        
input   [19:0]  idu_vfpu_rf_pipex_func;                
input           idu_vfpu_rf_pipex_gateclk_sel;         
input   [63:0]  idu_vfpu_rf_pipex_srcv0_fr;            
input   [63:0]  idu_vfpu_rf_pipex_srcv1_fr;            
input   [63:0]  idu_vfpu_rf_pipex_srcv2_fr;            
input           pad_yy_icg_scan_en;                    
input           rtu_yy_xx_flush;                       
input           slice0_dp_half0_mult_id;               
input           slice0_dp_mult1_mult_id;               
input   [4 :0]  slice0_mult1_dp_ex3_mult_expt;         
input   [63:0]  slice0_mult1_dp_ex3_mult_result;       
input   [4 :0]  slice0_mult1_dp_ex4_expt;              
input   [15:0]  slice0_mult1_dp_ex4_half_fma_result;   
input   [63:0]  slice0_mult1_dp_ex4_mult_result;       
input   [4 :0]  slice0_mult1_dp_ex5_fma_expt;          
input   [63:0]  slice0_mult1_dp_ex5_fma_result;        
input   [67:0]  slice0_mult1_dp_ex5_fwd_data;          
input   [2 :0]  vfpu_yy_xx_rm;                         
output  [63:0]  dp_mult1_ex1_op0_slice0;               
output  [31:0]  dp_mult1_ex1_op0_slice0_high;          
output  [63:0]  dp_mult1_ex1_op1_slice0;               
output  [31:0]  dp_mult1_ex1_op1_slice0_high;          
output  [63:0]  dp_mult1_ex1_op2_slice0;               
output  [31:0]  dp_mult1_ex1_op2_slice0_high;          
output          dp_mult1_op2_slice0_vl_mask;           
output          dp_mult1_op2_slice0_vm_mask;           
output  [15:0]  dp_mult_ex1_op0_slice0_half0;          
output  [47:0]  dp_mult_ex1_op0_slice0_half0_high;     
output  [15:0]  dp_mult_ex1_op1_slice0_half0;          
output  [47:0]  dp_mult_ex1_op1_slice0_half0_high;     
output  [31:0]  dp_mult_ex1_op2_slice0_half0;          
output  [47:0]  dp_mult_ex1_op2_slice0_half0_high;     
output          dp_mult_op2_slice0_vl_half0_mask;      
output          dp_mult_op2_slice0_vm_half0_mask;      
output          dp_xx_ex1_double;                      
output          dp_xx_ex1_fma;                         
output          dp_xx_ex1_half;                        
output          dp_xx_ex1_neg;                         
output  [51:0]  dp_xx_ex1_op0_frac;                    
output  [51:0]  dp_xx_ex1_op1_frac;                    
output  [2 :0]  dp_xx_ex1_rm;                          
output          dp_xx_ex1_simd;                        
output          dp_xx_ex1_single;                      
output          dp_xx_ex1_sub;                         
output          dp_xx_ex1_widen;                       
output          dp_xx_ex2_double;                      
output          dp_xx_ex2_fma;                         
output          dp_xx_ex2_half;                        
output          dp_xx_ex2_mult_id;                     
output          dp_xx_ex2_neg;                         
output  [2 :0]  dp_xx_ex2_rm;                          
output          dp_xx_ex2_simd;                        
output          dp_xx_ex2_sub;                         
output          dp_xx_ex2_widen;                       
output          dp_xx_ex3_double;                      
output          dp_xx_ex3_fma;                         
output          dp_xx_ex3_half;                        
output          dp_xx_ex3_mult_id;                     
output  [2 :0]  dp_xx_ex3_rm;                          
output          dp_xx_ex3_simd;                        
output          dp_xx_ex3_widen;                       
output          dp_xx_ex4_double;                      
output          dp_xx_ex4_fma;                         
output          dp_xx_ex4_half;                        
output          dp_xx_ex4_mult_id;                     
output  [2 :0]  dp_xx_ex4_rm;                          
output          pipex_dp_ex1_mult_id;                  
output  [4 :0]  pipex_dp_ex3_vfmau_ereg_data;          
output  [63:0]  pipex_dp_ex3_vfmau_freg_data;          
output  [4 :0]  pipex_dp_ex4_vfmau_ereg_data;          
output  [63:0]  pipex_dp_ex4_vfmau_freg_data;          
output          pipex_pipe6_ex4_fmla_fwd_vld;          
output          pipex_pipe6_ex5_ex1_fmla_fwd_vld;      
output          pipex_pipe6_ex5_ex2_fmla_fwd_vld;      
output          pipex_pipe7_ex4_fmla_fwd_vld;          
output          pipex_pipe7_ex5_ex1_fmla_fwd_vld;      
output          pipex_pipe7_ex5_ex2_fmla_fwd_vld;      
output          pipex_rbus_ex1_fmla_data_vld;          
output          pipex_rbus_ex1_fmla_data_vld_dup0;     
output          pipex_rbus_ex1_fmla_data_vld_dup1;     
output          pipex_rbus_ex1_fmla_data_vld_dup2;     
output          pipex_rbus_ex2_fmla_data_vld;          
output          pipex_rbus_ex2_fmla_data_vld_dup0;     
output          pipex_rbus_ex2_fmla_data_vld_dup1;     
output          pipex_rbus_ex2_fmla_data_vld_dup2;     
output          pipex_rbus_pipe6_fmla_no_fwd;          
output          pipex_rbus_pipe7_fmla_no_fwd;          
output  [4 :0]  pipex_rbus_vfmau_ereg_wb_data;         
output          pipex_rbus_vfmau_ereg_wb_vld;          
output  [63:0]  pipex_rbus_vfmau_freg_wb_data;         
output          pipex_rbus_vfmau_vreg_wb_vld;          
output  [15:0]  pipex_vfmau_ex4_fmla_slice0_half0_data; 
output  [67:0]  pipex_vfmau_ex5_fmla_slice0_data;      

// &Regs; @26
reg     [63:0]  dp_mult1_ex1_op0_slice0;               
reg     [63:0]  dp_mult1_ex1_op1_slice0;               
reg     [63:0]  dp_mult1_ex1_op2_slice0;               
reg     [8 :0]  ex1_func;                              
reg     [63:0]  ex1_srcv0_slice0;                      
reg     [51:0]  ex1_srcv0_slice0_frac;                 
reg     [63:0]  ex1_srcv1_slice0;                      
reg     [51:0]  ex1_srcv1_slice0_frac;                 
reg     [63:0]  ex1_srcv2_slice0;                      
reg             ex2_double;                            
reg     [6 :0]  ex2_dst_vreg;                          
reg             ex2_fma;                               
reg             ex2_fmla_data_vld;                     
reg             ex2_fmla_data_vld_dup0;                
reg             ex2_fmla_data_vld_dup1;                
reg             ex2_fmla_data_vld_dup2;                
reg     [2 :0]  ex2_fmla_type;                         
reg             ex2_half;                              
reg             ex2_mult_id;                           
reg             ex2_neg;                               
reg     [2 :0]  ex2_rm;                                
reg             ex2_single;                            
reg             ex2_sub;                               
reg             ex3_double;                            
reg     [6 :0]  ex3_dst_vreg;                          
reg             ex3_fma;                               
reg     [2 :0]  ex3_fmla_type;                         
reg             ex3_half;                              
reg             ex3_mult_id;                           
reg             ex3_neg;                               
reg     [2 :0]  ex3_rm;                                
reg             ex3_single;                            
reg             ex4_double;                            
reg     [6 :0]  ex4_dst_vreg;                          
reg             ex4_fma;                               
reg     [2 :0]  ex4_fmla_type;                         
reg             ex4_half;                              
reg             ex4_mult_id;                           
reg             ex4_neg;                               
reg             ex4_pipe6_fmla_fwd_vld;                
reg             ex4_pipe7_fmla_fwd_vld;                
reg     [2 :0]  ex4_rm;                                
reg             ex4_single;                            
reg     [6 :0]  ex5_dst_vreg;                          
reg             ex5_pipe6_ex1_fmla_fwd_vld;            
reg             ex5_pipe6_ex2_fmla_fwd_vld;            
reg             ex5_pipe7_ex1_fmla_fwd_vld;            
reg             ex5_pipe7_ex2_fmla_fwd_vld;            
reg             pipex_rbus_ex1_fmla_data_vld;          
reg             pipex_rbus_ex1_fmla_data_vld_dup0;     
reg             pipex_rbus_ex1_fmla_data_vld_dup1;     
reg             pipex_rbus_ex1_fmla_data_vld_dup2;     
reg     [51:0]  rf_fr_frac_mask;                       

// &Wires; @27
wire            cp0_vfpu_icg_en;                       
wire            cp0_yy_clk_en;                         
wire            cpurst_b;                              
wire            ctrl_dp_ex5_fma_wb_vld;                
wire            ctrl_ex1_ex2_en;                       
wire            ctrl_ex1_inst_vld;                     
wire            ctrl_ex2_inst_vld;                     
wire            ctrl_ex3_inst_vld;                     
wire            ctrl_ex4_inst_vld;                     
wire            ctrl_ex5_inst_vld;                     
wire            dp_ex1_ex2_pipe_clk;                   
wire            dp_ex2_ex3_pipe_clk;                   
wire            dp_ex3_ex4_pipe_clk;                   
wire            dp_ex4_ex5_pipe_clk;                   
wire    [31:0]  dp_mult1_ex1_op0_slice0_high;          
wire    [31:0]  dp_mult1_ex1_op1_slice0_high;          
wire    [31:0]  dp_mult1_ex1_op2_slice0_high;          
wire            dp_mult1_op2_slice0_vl_mask;           
wire            dp_mult1_op2_slice0_vm_mask;           
wire    [15:0]  dp_mult_ex1_op0_slice0_half0;          
wire    [47:0]  dp_mult_ex1_op0_slice0_half0_high;     
wire    [15:0]  dp_mult_ex1_op1_slice0_half0;          
wire    [47:0]  dp_mult_ex1_op1_slice0_half0_high;     
wire    [31:0]  dp_mult_ex1_op2_slice0_half0;          
wire    [47:0]  dp_mult_ex1_op2_slice0_half0_high;     
wire            dp_mult_op2_slice0_vl_half0_mask;      
wire            dp_mult_op2_slice0_vm_half0_mask;      
wire    [6 :0]  dp_vfmau_ex1_pipex_dst_vreg;           
wire    [2 :0]  dp_vfmau_ex1_pipex_imm0;               
wire            dp_vfmau_pipe6_mla_srcv2_vld;          
wire    [6 :0]  dp_vfmau_pipe6_mla_srcv2_vreg;         
wire    [2 :0]  dp_vfmau_pipe6_mla_type;               
wire            dp_vfmau_pipe7_mla_srcv2_vld;          
wire    [6 :0]  dp_vfmau_pipe7_mla_srcv2_vreg;         
wire    [2 :0]  dp_vfmau_pipe7_mla_type;               
wire    [5 :0]  dp_vfmau_pipex_inst_type;              
wire            dp_vfmau_pipex_sel;                    
wire            dp_vfmau_pipex_vfmau_sel;              
wire            dp_vfmau_rf_pipex_sel;                 
wire            dp_xx_ex1_double;                      
wire            dp_xx_ex1_fma;                         
wire            dp_xx_ex1_half;                        
wire            dp_xx_ex1_neg;                         
wire    [51:0]  dp_xx_ex1_op0_frac;                    
wire    [51:0]  dp_xx_ex1_op1_frac;                    
wire    [2 :0]  dp_xx_ex1_rm;                          
wire            dp_xx_ex1_simd;                        
wire            dp_xx_ex1_single;                      
wire            dp_xx_ex1_sub;                         
wire            dp_xx_ex1_widen;                       
wire            dp_xx_ex2_double;                      
wire            dp_xx_ex2_fma;                         
wire            dp_xx_ex2_half;                        
wire            dp_xx_ex2_mult_id;                     
wire            dp_xx_ex2_neg;                         
wire    [2 :0]  dp_xx_ex2_rm;                          
wire            dp_xx_ex2_simd;                        
wire            dp_xx_ex2_sub;                         
wire            dp_xx_ex2_widen;                       
wire            dp_xx_ex3_double;                      
wire            dp_xx_ex3_fma;                         
wire            dp_xx_ex3_half;                        
wire            dp_xx_ex3_mult_id;                     
wire    [2 :0]  dp_xx_ex3_rm;                          
wire            dp_xx_ex3_simd;                        
wire            dp_xx_ex3_widen;                       
wire            dp_xx_ex4_double;                      
wire            dp_xx_ex4_fma;                         
wire            dp_xx_ex4_half;                        
wire            dp_xx_ex4_mult_id;                     
wire    [2 :0]  dp_xx_ex4_rm;                          
wire            ex1_double;                            
wire    [6 :0]  ex1_dst_vreg;                          
wire            ex1_dynamic_rm_select;                 
wire            ex1_ex2_clk;                           
wire            ex1_fma;                               
wire            ex1_half;                              
wire    [1 :0]  ex1_inst_size;                         
wire            ex1_mult_id;                           
wire    [1 :0]  ex1_mult_id_mask;                      
wire            ex1_neg;                               
wire    [2 :0]  ex1_rm;                                
wire            ex1_simd;                              
wire            ex1_single;                            
wire            ex1_srcv_change;                       
wire    [2 :0]  ex1_static_rm;                         
wire            ex1_sub;                               
wire            ex2_fma_data_vld_pre;                  
wire            ex3_fmla_pipe6_dst_hit;                
wire            ex3_fmla_pipe6_size_hit;               
wire            ex3_fmla_pipe6_type_hit;               
wire            ex3_fmla_pipe7_dst_hit;                
wire            ex3_fmla_pipe7_size_hit;               
wire            ex3_fmla_pipe7_type_hit;               
wire            ex3_pipe6_fmla_fwd_cmp;                
wire            ex3_pipe7_fmla_fwd_cmp;                
wire            ex4_fmla_pipe6_dst_hit;                
wire            ex4_fmla_pipe6_size_hit;               
wire            ex4_fmla_pipe6_type_hit;               
wire            ex4_fmla_pipe7_dst_hit;                
wire            ex4_fmla_pipe7_size_hit;               
wire            ex4_fmla_pipe7_type_hit;               
wire            ex4_pipe6_fmla_fwd_cmp;                
wire            ex4_pipe7_fmla_fwd_cmp;                
wire            fmla_ex3_en;                           
wire            fmla_ex3_ex4_clk;                      
wire            fmla_ex4_en;                           
wire            fmla_ex4_ex5_clk;                      
wire            forever_cpuclk;                        
wire    [19:0]  idu_vfpu_rf_pipex_func;                
wire            idu_vfpu_rf_pipex_gateclk_sel;         
wire    [63:0]  idu_vfpu_rf_pipex_srcv0_fr;            
wire    [63:0]  idu_vfpu_rf_pipex_srcv1_fr;            
wire    [63:0]  idu_vfpu_rf_pipex_srcv2_fr;            
wire            pad_yy_icg_scan_en;                    
wire            pipex_dp_ex1_mult_id;                  
wire    [4 :0]  pipex_dp_ex3_vfmau_ereg_data;          
wire    [63:0]  pipex_dp_ex3_vfmau_freg_data;          
wire    [4 :0]  pipex_dp_ex4_vfmau_ereg_data;          
wire    [63:0]  pipex_dp_ex4_vfmau_freg_data;          
wire            pipex_pipe6_ex4_fmla_fwd_vld;          
wire            pipex_pipe6_ex5_ex1_fmla_fwd_vld;      
wire            pipex_pipe6_ex5_ex2_fmla_fwd_vld;      
wire            pipex_pipe7_ex4_fmla_fwd_vld;          
wire            pipex_pipe7_ex5_ex1_fmla_fwd_vld;      
wire            pipex_pipe7_ex5_ex2_fmla_fwd_vld;      
wire            pipex_rbus_ex2_fmla_data_vld;          
wire            pipex_rbus_ex2_fmla_data_vld_dup0;     
wire            pipex_rbus_ex2_fmla_data_vld_dup1;     
wire            pipex_rbus_ex2_fmla_data_vld_dup2;     
wire            pipex_rbus_pipe6_fmla_no_fwd;          
wire            pipex_rbus_pipe7_fmla_no_fwd;          
wire    [4 :0]  pipex_rbus_vfmau_ereg_wb_data;         
wire            pipex_rbus_vfmau_ereg_wb_vld;          
wire    [63:0]  pipex_rbus_vfmau_freg_wb_data;         
wire            pipex_rbus_vfmau_vreg_wb_vld;          
wire    [15:0]  pipex_vfmau_ex4_fmla_slice0_half0_data; 
wire    [67:0]  pipex_vfmau_ex5_fmla_slice0_data;      
wire            rf_ex1_clk;                            
wire            rf_ex1_clk_en;                         
wire            rf_ex1_pipe_clk;                       
wire            rf_fma_fwd_vld;                        
wire            rf_fmla_data_vld;                      
wire    [8 :0]  rf_func;                               
wire    [5 :0]  rf_inst_type;                          
wire            rf_inst_vld;                           
wire    [63:0]  rf_srcv0_fr;                           
wire    [63:0]  rf_srcv0_slice0;                       
wire    [51:0]  rf_srcv0_slice0_frac;                  
wire    [63:0]  rf_srcv1_fr;                           
wire    [63:0]  rf_srcv1_slice0;                       
wire    [51:0]  rf_srcv1_slice0_frac;                  
wire    [63:0]  rf_srcv2_fr;                           
wire    [63:0]  rf_srcv2_slice0;                       
wire            rtu_yy_xx_flush;                       
wire            slice0_dp_half0_mult_id;               
wire            slice0_dp_mult1_mult_id;               
wire    [4 :0]  slice0_mult1_dp_ex3_mult_expt;         
wire    [63:0]  slice0_mult1_dp_ex3_mult_result;       
wire    [4 :0]  slice0_mult1_dp_ex4_expt;              
wire    [15:0]  slice0_mult1_dp_ex4_half_fma_result;   
wire    [63:0]  slice0_mult1_dp_ex4_mult_result;       
wire    [4 :0]  slice0_mult1_dp_ex5_fma_expt;          
wire    [63:0]  slice0_mult1_dp_ex5_fma_result;        
wire    [67:0]  slice0_mult1_dp_ex5_fwd_data;          
wire    [2 :0]  vfpu_yy_xx_rm;                         


// &Depend("cpu_cfig.h"); @29
// &Force("bus","idu_vfpu_rf_pipex_func",19,0); @30

//==========================================================
//                     RF data path
//==========================================================
assign rf_srcv0_fr[63:0] = idu_vfpu_rf_pipex_srcv0_fr[63:0];
assign rf_srcv1_fr[63:0] = idu_vfpu_rf_pipex_srcv1_fr[63:0];
assign rf_srcv2_fr[63:0] = idu_vfpu_rf_pipex_srcv2_fr[63:0];

assign rf_srcv0_slice0[63:0] = rf_srcv0_fr[63:0];
assign rf_srcv1_slice0[63:0] = rf_srcv1_fr[63:0];
assign rf_srcv2_slice0[63:0] = rf_srcv2_fr[63:0];

//  &Instance("gated_clk_cell", "x_rf_ex1_gated_clk"); @72
gated_clk_cell  x_rf_ex1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_ex1_pipe_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_inst_vld       ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk        ), @73
//           .external_en (1'b0                  ), @74
//           .global_en   (cp0_yy_clk_en         ), @75
//           .module_en   (cp0_vfpu_icg_en       ), @76
//           .local_en    (rf_inst_vld           ), @77
//           .clk_out     (rf_ex1_pipe_clk      )); @78
assign rf_inst_vld  = dp_vfmau_pipex_sel && dp_vfmau_pipex_vfmau_sel;


always@(posedge rf_ex1_pipe_clk)
begin
  if(rf_inst_vld)
  begin
    ex1_srcv0_slice0[63:0] <= rf_srcv0_slice0[63:0];
    ex1_srcv1_slice0[63:0] <= rf_srcv1_slice0[63:0];
    ex1_srcv2_slice0[63:0] <= rf_srcv2_slice0[63:0];
  end
  else
  begin
    ex1_srcv0_slice0[63:0] <= ex1_srcv0_slice0[63:0];
    ex1_srcv1_slice0[63:0] <= ex1_srcv1_slice0[63:0];
    ex1_srcv2_slice0[63:0] <= ex1_srcv2_slice0[63:0];
  end
end


//For Timing Considration,operate data mask for frac of compressor;
//Inst Type:
//Bit 0: Scalar Double
//Bit 1: Scalar Single
//Bit 2: Scalar Half
//Bit 3: Vector Double
//Bit 4: Vector Single
//Bit 5: Vector Half
// &CombBeg; @128
// &CombEnd; @135
// &CombBeg; @137
// &CombEnd; @144
assign rf_inst_type[5:0] = dp_vfmau_pipex_inst_type[5:0];
// &CombBeg; @178
always @( rf_inst_type[2:0])
begin
case(rf_inst_type[2:0])
  3'b001 : rf_fr_frac_mask[51:0] = 52'hf_ffff_ffff_ffff;
  3'b010 : rf_fr_frac_mask[51:0] = 52'h0_0000_007f_ffff;
  3'b100 : rf_fr_frac_mask[51:0] = 52'h0_0000_0000_03ff;
  default: rf_fr_frac_mask[51:0] = 52'h0;
endcase
// &CombEnd; @185
end

assign rf_srcv0_slice0_frac[51:0] = rf_fr_frac_mask[51:0] & rf_srcv0_fr[51:0];
assign rf_srcv1_slice0_frac[51:0] = rf_fr_frac_mask[51:0] & rf_srcv1_fr[51:0];

always@(posedge rf_ex1_pipe_clk)
begin
  if(rf_inst_vld)
  begin
    ex1_srcv0_slice0_frac[51:0] <= rf_srcv0_slice0_frac[51:0];
    ex1_srcv1_slice0_frac[51:0] <= rf_srcv1_slice0_frac[51:0];
  end
  else
  begin
    ex1_srcv0_slice0_frac[51:0] <= ex1_srcv0_slice0_frac[51:0];
    ex1_srcv1_slice0_frac[51:0] <= ex1_srcv1_slice0_frac[51:0];
  end
end
assign dp_xx_ex1_op0_frac[51:0] = ex1_srcv0_slice0_frac[51:0];
assign dp_xx_ex1_op1_frac[51:0] = ex1_srcv1_slice0_frac[51:0];

assign rf_func[8:0] = {idu_vfpu_rf_pipex_func[19:16],idu_vfpu_rf_pipex_func[4:0]};
always@(posedge rf_ex1_pipe_clk)
begin
  if(rf_inst_vld)
    ex1_func[8:0] <= rf_func[8:0];
  else
    ex1_func[8:0] <= ex1_func[8:0];
end

//==========================================================
//                     EX1 data path
//==========================================================
//----------------------------------------------------------
//                    common data path
//----------------------------------------------------------
//multiply EX1 data path
assign ex1_static_rm[2:0]  = dp_vfmau_ex1_pipex_imm0[2:0];
assign ex1_dst_vreg[6:0]   = dp_vfmau_ex1_pipex_dst_vreg[6:0];
assign ex1_half            = ex1_func[7];
assign ex1_single          = ex1_func[6];
assign ex1_double          = ex1_func[5];
assign ex1_fma             = ex1_func[0]; 
assign ex1_sub             = ex1_func[1];
assign ex1_neg             = ex1_func[2];

//Rounding mode
assign ex1_dynamic_rm_select = (ex1_static_rm[2:0] == 3'b111) || ex1_simd; 
assign ex1_rm[2:0]           = (ex1_dynamic_rm_select)
                             ? vfpu_yy_xx_rm[2:0]
                             : ex1_static_rm[2:0];
assign ex1_mult_id_mask[0]   = ex1_double || ex1_single;
assign ex1_mult_id_mask[1]   = ex1_half;
assign ex1_mult_id           = ctrl_ex1_inst_vld
                            && !ex1_fma
                            && (slice0_dp_mult1_mult_id     && ex1_mult_id_mask[0] 
                                || slice0_dp_half0_mult_id  && ex1_mult_id_mask[1]
                               );

assign pipex_dp_ex1_mult_id  = ex1_mult_id;

// &Force("bus","dp_vfmau_ex1_pipex_split_count",5,0); @305
assign ex1_simd        = 1'b0;
assign ex1_srcv_change = 1'b0;
assign dp_xx_ex1_simd  = 1'b0;
assign dp_xx_ex1_widen = 1'b0;
//output to each mult
assign dp_xx_ex1_rm[2:0]        = ex1_rm[2:0];
assign dp_xx_ex1_double         = ex1_double; 
assign dp_xx_ex1_single         = ex1_single; 
assign dp_xx_ex1_half           = ex1_half; 
assign dp_xx_ex1_fma            = ex1_fma;    
assign dp_xx_ex1_sub            = ex1_sub;    
assign dp_xx_ex1_neg            = ex1_neg;   

//----------------------------------------------------------
//                 multiplier data prepration
//----------------------------------------------------------
assign ex1_inst_size[1:0] = ex1_func[6:5];
// &CombBeg; @334
always @( ex1_srcv0_slice0[63:0]
       or ex1_inst_size[1:0])
begin
case(ex1_inst_size[1:0])
  2'b10:   dp_mult1_ex1_op0_slice0[63:0] = {ex1_srcv0_slice0[31],3'b0,ex1_srcv0_slice0[30:0],29'b0}; //single
  2'b01:   dp_mult1_ex1_op0_slice0[63:0] = ex1_srcv0_slice0[63:0];                                   //double
  default: dp_mult1_ex1_op0_slice0[63:0] = {64{1'bx}};
endcase
// &CombEnd; @340
end

// &CombBeg; @342
always @( ex1_srcv1_slice0[63:0]
       or ex1_inst_size[1:0])
begin
case(ex1_inst_size[1:0])
  2'b10:   dp_mult1_ex1_op1_slice0[63:0] = {ex1_srcv1_slice0[31],3'b0,ex1_srcv1_slice0[30:0],29'b0}; //single
  2'b01:   dp_mult1_ex1_op1_slice0[63:0] = ex1_srcv1_slice0[63:0];                                   //double
  default: dp_mult1_ex1_op1_slice0[63:0] = {64{1'bx}};
endcase
// &CombEnd; @348
end

// &CombBeg; @351
// &CombEnd; @357
// &CombBeg; @359
always @( ex1_srcv2_slice0[63:0]
       or ex1_inst_size[1:0])
begin
case(ex1_inst_size[1:0])
  2'b10:   dp_mult1_ex1_op2_slice0[63:0] = {ex1_srcv2_slice0[31],3'b0,ex1_srcv2_slice0[30:0],29'b0}; //single
  2'b01:   dp_mult1_ex1_op2_slice0[63:0] = ex1_srcv2_slice0[63:0];                                   //double
  default: dp_mult1_ex1_op2_slice0[63:0] = 64'b0;
endcase
// &CombEnd; @365
end

assign dp_mult1_ex1_op0_slice0_high[31:0] = ex1_srcv0_slice0[63:32];
assign dp_mult1_ex1_op1_slice0_high[31:0] = ex1_srcv1_slice0[63:32];
assign dp_mult1_ex1_op2_slice0_high[31:0] = ex1_srcv2_slice0[63:32];
                                          
// &CombBeg; @425
// &CombEnd; @431
// &CombBeg; @433
// &CombEnd; @439
// &CombBeg; @441
// &CombEnd; @448
assign dp_mult_ex1_op0_slice0_half0[15:0]  = ex1_srcv0_slice0[15:0];
assign dp_mult_ex1_op1_slice0_half0[15:0]  = ex1_srcv1_slice0[15:0];
assign dp_mult_ex1_op2_slice0_half0[31:0]  = {ex1_srcv2_slice0[15],3'b0,ex1_srcv2_slice0[14:0],13'b0};

assign dp_mult_ex1_op0_slice0_half0_high[47:0] = ex1_srcv0_slice0[63:16]; 
assign dp_mult_ex1_op1_slice0_half0_high[47:0] = ex1_srcv1_slice0[63:16]; 
assign dp_mult_ex1_op2_slice0_half0_high[47:0] = ex1_srcv2_slice0[63:16]; 


//==========================================================
//                    EX2  Stage
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_dp_ex1_ex2_gated_clk"); @519
gated_clk_cell  x_dp_ex1_ex2_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (dp_ex1_ex2_pipe_clk),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (ctrl_ex1_inst_vld  ),
  .module_en           (cp0_vfpu_icg_en    ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

//  &Connect(.clk_in      (forever_cpuclk        ), @520
//           .external_en (1'b0                  ), @521
//           .global_en   (cp0_yy_clk_en         ), @522
//           .module_en   (cp0_vfpu_icg_en       ), @523
//           .local_en    (ctrl_ex1_inst_vld     ), @524
//           .clk_out     (dp_ex1_ex2_pipe_clk   )); @525

always @(posedge dp_ex1_ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex2_dst_vreg[6:0]  <= 7'b0;
    ex2_rm[2:0]        <= 3'b0; 
    ex2_single         <= 1'b0;
    ex2_double         <= 1'b0;
    ex2_half           <= 1'b0;
    ex2_fma            <= 1'b0;
    ex2_sub            <= 1'b0;
    ex2_neg            <= 1'b0;
    ex2_mult_id        <= 1'b0;
  end
 else if(ctrl_ex1_inst_vld) 
 begin
    ex2_dst_vreg[6:0]  <= ex1_dst_vreg[6:0];
    ex2_rm[2:0]        <= ex1_rm[2:0];
    ex2_single         <= ex1_single;
    ex2_double         <= ex1_double;
    ex2_half           <= ex1_half;
    ex2_fma            <= ex1_fma;
    ex2_sub            <= ex1_sub;
    ex2_neg            <= ex1_neg;
    ex2_mult_id        <= ex1_mult_id;
  end
  else
  begin
    ex2_dst_vreg[6:0]  <= ex2_dst_vreg[6:0];
    ex2_rm[2:0]        <= ex2_rm[2:0];
    ex2_single         <= ex2_single;
    ex2_double         <= ex2_double;
    ex2_half           <= ex2_half;
    ex2_fma            <= ex2_fma;
    ex2_sub            <= ex2_sub;
    ex2_neg            <= ex2_neg;
    ex2_mult_id        <= ex2_mult_id;
  end
end

// &CombBeg; @596
// &CombEnd; @603
// &CombBeg; @612
always @( ex2_double
       or ex2_single
       or ex2_half)
begin
case({ex2_half,
      ex2_single,
      ex2_double})
  3'b001 : ex2_fmla_type[2:0] = 3'b001;
  3'b010 : ex2_fmla_type[2:0] = 3'b010;
  3'b100 : ex2_fmla_type[2:0] = 3'b011;
  default: ex2_fmla_type[2:0] = {3{1'bx}};
endcase
// &CombEnd; @621
end

assign dp_xx_ex2_widen  = 1'b0;
assign dp_xx_ex2_simd   = 1'b0;
assign dp_xx_ex2_double = ex2_double; 

//output to each mult
assign dp_xx_ex2_half    = ex2_half;
assign dp_xx_ex2_fma     = ex2_fma;   
assign dp_xx_ex2_rm[2:0] = ex2_rm[2:0];
assign dp_xx_ex2_sub     = ex2_sub;
assign dp_xx_ex2_neg     = ex2_neg;
assign dp_xx_ex2_mult_id  = ex2_mult_id;

//==========================================================
//                    EX3  Stage
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_dp_ex2_ex3_gated_clk"); @642
gated_clk_cell  x_dp_ex2_ex3_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (dp_ex2_ex3_pipe_clk),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (ctrl_ex2_inst_vld  ),
  .module_en           (cp0_vfpu_icg_en    ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

//  &Connect(.clk_in      (forever_cpuclk        ), @643
//           .external_en (1'b0                  ), @644
//           .global_en   (cp0_yy_clk_en         ), @645
//           .module_en   (cp0_vfpu_icg_en        ), @646
//           .local_en    (ctrl_ex2_inst_vld     ), @647
//           .clk_out     (dp_ex2_ex3_pipe_clk   )); @648

always @(posedge dp_ex2_ex3_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex3_dst_vreg[6:0]  <= 7'b0;
    ex3_fmla_type[2:0] <= 3'b0;
    ex3_rm[2:0]        <= 3'b0;
    ex3_single         <= 1'b0;
    ex3_double         <= 1'b0;
    ex3_half           <= 1'b0;
    ex3_fma            <= 1'b0;
    ex3_neg            <= 1'b0;
    ex3_mult_id        <= 1'b0;
  end
 else if(ctrl_ex2_inst_vld) 
 begin
    ex3_dst_vreg[6:0]  <= ex2_dst_vreg[6:0];
    ex3_fmla_type[2:0] <= ex2_fmla_type[2:0];
    ex3_rm[2:0]        <= ex2_rm[2:0]; 
    ex3_single         <= ex2_single;
    ex3_double         <= ex2_double;
    ex3_half           <= ex2_half;
    ex3_fma            <= ex2_fma;
    ex3_neg            <= ex2_neg;
    ex3_mult_id        <= ex2_mult_id;
  end
  else
  begin
    ex3_dst_vreg[6:0]  <= ex3_dst_vreg[6:0];
    ex3_fmla_type[2:0] <= ex3_fmla_type[2:0];
    ex3_rm[2:0]        <= ex3_rm[2:0]; 
    ex3_single         <= ex3_single;
    ex3_double         <= ex3_double;
    ex3_half           <= ex3_half;
    ex3_fma            <= ex3_fma;
    ex3_neg            <= ex3_neg;
    ex3_mult_id        <= ex3_mult_id;
  end
end

assign dp_xx_ex3_widen  = 1'b0;
assign dp_xx_ex3_simd   = 1'b0;

//output to each mult
assign dp_xx_ex3_rm[2:0] = ex3_rm[2:0];
assign dp_xx_ex3_double  = ex3_double; 
assign dp_xx_ex3_half    = ex3_half;
assign dp_xx_ex3_fma     = ex3_fma; 
assign dp_xx_ex3_mult_id = ex3_mult_id;

//==========================================================
//                    EX4  Stage
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_dp_ex3_ex4_gated_clk"); @733
gated_clk_cell  x_dp_ex3_ex4_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (dp_ex3_ex4_pipe_clk),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (ctrl_ex3_inst_vld  ),
  .module_en           (cp0_vfpu_icg_en    ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

//  &Connect(.clk_in      (forever_cpuclk        ), @734
//           .external_en (1'b0                  ), @735
//           .global_en   (cp0_yy_clk_en         ), @736
//           .module_en   (cp0_vfpu_icg_en        ), @737
//           .local_en    (ctrl_ex3_inst_vld     ), @738
//           .clk_out     (dp_ex3_ex4_pipe_clk   )); @739

always @(posedge dp_ex3_ex4_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex4_dst_vreg[6:0]  <= 7'b0;
    ex4_fmla_type[2:0] <= 3'b0;
    ex4_single         <= 1'b0;
    ex4_double         <= 1'b0;
    ex4_half           <= 1'b0;
    ex4_fma            <= 1'b0;
    ex4_neg            <= 1'b0;
    ex4_rm[2:0]        <= 3'b0;
    ex4_mult_id        <= 1'b0;
  end
 else if(ctrl_ex3_inst_vld) 
 begin
    ex4_dst_vreg[6:0]  <= ex3_dst_vreg[6:0];
    ex4_fmla_type[2:0] <= ex3_fmla_type[2:0];
    ex4_single         <= ex3_single;
    ex4_double         <= ex3_double;
    ex4_half           <= ex3_half;
    ex4_fma            <= ex3_fma;
    ex4_neg            <= ex3_neg;
    ex4_rm[2:0]        <= ex3_rm[2:0];
    ex4_mult_id        <= ex3_mult_id;
  end
  else
  begin
    ex4_dst_vreg[6:0]  <= ex4_dst_vreg[6:0];
    ex4_fmla_type[2:0] <= ex4_fmla_type[2:0];
    ex4_single         <= ex4_single;
    ex4_double         <= ex4_double;
    ex4_half           <= ex4_half;
    ex4_fma            <= ex4_fma;
    ex4_neg            <= ex4_neg;
    ex4_rm[2:0]        <= ex4_rm[2:0];
    ex4_mult_id        <= ex4_mult_id;
  end
end

assign dp_xx_ex4_half    = ex4_half;

//output to each mult
assign dp_xx_ex4_double  = ex4_double; 
assign dp_xx_ex4_fma     = ex4_fma;
assign dp_xx_ex4_rm[2:0] = ex4_rm[2:0];
assign dp_xx_ex4_mult_id = ex4_mult_id;


//==========================================================
//                    EX5  Stage
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
//  &Instance("gated_clk_cell", "x_dp_ex4_ex5_gated_clk"); @826
gated_clk_cell  x_dp_ex4_ex5_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (dp_ex4_ex5_pipe_clk),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (ctrl_ex4_inst_vld  ),
  .module_en           (cp0_vfpu_icg_en    ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

//  &Connect(.clk_in      (forever_cpuclk        ), @827
//           .external_en (1'b0                  ), @828
//           .global_en   (cp0_yy_clk_en         ), @829
//           .module_en   (cp0_vfpu_icg_en        ), @830
//           .local_en    (ctrl_ex4_inst_vld     ), @831
//           .clk_out     (dp_ex4_ex5_pipe_clk   )); @832

always @(posedge dp_ex4_ex5_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex5_dst_vreg[6:0] <= 7'b0;
  end
 else if(ctrl_ex4_inst_vld) 
 begin
    ex5_dst_vreg[6:0] <= ex4_dst_vreg[6:0];
  end
  else
  begin
    ex5_dst_vreg[6:0] <= ex5_dst_vreg[6:0];
  end
end


//output to each mult
//assign dp_xx_ex5_double = ex5_double;

assign dp_mult1_op2_slice0_vm_mask      = 1'b0;
assign dp_mult1_op2_slice0_vl_mask      = 1'b0;
assign dp_mult_op2_slice0_vm_half0_mask = 1'b0;
assign dp_mult_op2_slice0_vl_half0_mask = 1'b0;

//==========================================================
//                    Fwd signal
//==========================================================
//EX3
assign pipex_dp_ex3_vfmau_freg_data[63:0]   = slice0_mult1_dp_ex3_mult_result[63:0];
assign pipex_dp_ex3_vfmau_ereg_data[4:0]    = slice0_mult1_dp_ex3_mult_expt[4:0];

//EX4
assign pipex_dp_ex4_vfmau_freg_data[63:0]   = slice0_mult1_dp_ex4_mult_result[63:0];
assign pipex_dp_ex4_vfmau_ereg_data[4:0]    = slice0_mult1_dp_ex4_expt[4:0];

//EX5
assign pipex_rbus_vfmau_vreg_wb_vld = ctrl_dp_ex5_fma_wb_vld;
assign pipex_rbus_vfmau_ereg_wb_vld = ctrl_dp_ex5_fma_wb_vld;

assign pipex_rbus_vfmau_freg_wb_data[63:0] = slice0_mult1_dp_ex5_fma_result[63:0];
assign pipex_rbus_vfmau_ereg_wb_data[4:0]  = slice0_mult1_dp_ex5_fma_expt[4:0];

//==========================================================
//                    Fmla Fwd signal
//==========================================================
//----------------------------------------------------------
//                    EX1 fmla fwd
//----------------------------------------------------------
// &Instance("gated_clk_cell", "x_rf_ex1_pipe_gated_clk"); @970
gated_clk_cell  x_rf_ex1_pipe_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_ex1_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_ex1_clk_en     ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk  ), @971
//          .external_en (1'b0            ), @972
//          .global_en   (cp0_yy_clk_en   ), @973
//          .module_en   (cp0_vfpu_icg_en ), @974
//          .local_en    (rf_ex1_clk_en ), @975
//          .clk_out     (rf_ex1_clk)); @976

assign rf_ex1_clk_en = idu_vfpu_rf_pipex_gateclk_sel
                    || ctrl_ex1_inst_vld;

assign rf_fma_fwd_vld   = idu_vfpu_rf_pipex_func[0] && !idu_vfpu_rf_pipex_func[4];
assign rf_fmla_data_vld = dp_vfmau_rf_pipex_sel && rf_fma_fwd_vld;

always@(posedge rf_ex1_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    pipex_rbus_ex1_fmla_data_vld      <= 1'b0;
    pipex_rbus_ex1_fmla_data_vld_dup0 <= 1'b0;
    pipex_rbus_ex1_fmla_data_vld_dup1 <= 1'b0;
    pipex_rbus_ex1_fmla_data_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    pipex_rbus_ex1_fmla_data_vld      <= 1'b0;
    pipex_rbus_ex1_fmla_data_vld_dup0 <= 1'b0;
    pipex_rbus_ex1_fmla_data_vld_dup1 <= 1'b0;
    pipex_rbus_ex1_fmla_data_vld_dup2 <= 1'b0;
  end
  else  
  begin
    pipex_rbus_ex1_fmla_data_vld      <= rf_fmla_data_vld;
    pipex_rbus_ex1_fmla_data_vld_dup0 <= rf_fmla_data_vld;
    pipex_rbus_ex1_fmla_data_vld_dup1 <= rf_fmla_data_vld;
    pipex_rbus_ex1_fmla_data_vld_dup2 <= rf_fmla_data_vld;
  end
end

//----------------------------------------------------------
//                    EX2 fmla fwd
//----------------------------------------------------------
// &Instance("gated_clk_cell", "x_ex1_ex2_gated_clk"); @1010
gated_clk_cell  x_ex1_ex2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_ex2_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex1_ex2_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk  ), @1011
//          .external_en (1'b0            ), @1012
//          .global_en   (cp0_yy_clk_en   ), @1013
//          .module_en   (cp0_vfpu_icg_en ), @1014
//          .local_en    (ctrl_ex1_ex2_en ), @1015
//          .clk_out     (ex1_ex2_clk)); @1016

assign ex2_fma_data_vld_pre = ctrl_ex1_inst_vld
                           && ex1_fma
                           && !ex1_srcv_change;
 
always@(posedge ex1_ex2_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ex2_fmla_data_vld <= 1'b0;
    ex2_fmla_data_vld_dup0 <= 1'b0;
    ex2_fmla_data_vld_dup1 <= 1'b0;
    ex2_fmla_data_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    ex2_fmla_data_vld <= 1'b0;
    ex2_fmla_data_vld_dup0 <= 1'b0;
    ex2_fmla_data_vld_dup1 <= 1'b0;
    ex2_fmla_data_vld_dup2 <= 1'b0;
  end
  else begin
    ex2_fmla_data_vld <= ex2_fma_data_vld_pre;
    ex2_fmla_data_vld_dup0 <= ex2_fma_data_vld_pre;
    ex2_fmla_data_vld_dup1 <= ex2_fma_data_vld_pre;
    ex2_fmla_data_vld_dup2 <= ex2_fma_data_vld_pre;
  end
end
assign pipex_rbus_ex2_fmla_data_vld = ex2_fmla_data_vld;
assign pipex_rbus_ex2_fmla_data_vld_dup0 = ex2_fmla_data_vld_dup0;
assign pipex_rbus_ex2_fmla_data_vld_dup1 = ex2_fmla_data_vld_dup1;
assign pipex_rbus_ex2_fmla_data_vld_dup2 = ex2_fmla_data_vld_dup2;
 

//----------------------------------------------------------
//                    EX2 fmla fwd
//----------------------------------------------------------
assign ex3_fmla_pipe6_dst_hit  = (dp_vfmau_pipe6_mla_srcv2_vreg[6:0] == ex3_dst_vreg[6:0]);
//Only Half inst can support widen at EX3 stage
assign ex3_fmla_pipe6_size_hit = dp_vfmau_pipe6_mla_type[2:0] == ex3_fmla_type[2:0];
assign ex3_fmla_pipe6_type_hit = ctrl_ex3_inst_vld 
                              && ex3_fma 
                              && dp_vfmau_pipe6_mla_srcv2_vld; 

assign ex3_fmla_pipe7_dst_hit  = (dp_vfmau_pipe7_mla_srcv2_vreg[6:0] == ex3_dst_vreg[6:0]);
assign ex3_fmla_pipe7_size_hit = dp_vfmau_pipe7_mla_type[2:0] == ex3_fmla_type[2:0]; 
assign ex3_fmla_pipe7_type_hit = ctrl_ex3_inst_vld 
                              && ex3_fma
                              && dp_vfmau_pipe7_mla_srcv2_vld; 
                                   
assign ex3_pipe6_fmla_fwd_cmp  = ex3_fmla_pipe6_dst_hit && ex3_fmla_pipe6_size_hit && ex3_fmla_pipe6_type_hit; 
assign ex3_pipe7_fmla_fwd_cmp  = ex3_fmla_pipe7_dst_hit && ex3_fmla_pipe7_size_hit && ex3_fmla_pipe7_type_hit; 


assign fmla_ex3_en = ctrl_ex3_inst_vld
                  || ctrl_ex4_inst_vld;

//  &Instance("gated_clk_cell", "x_fmla_ex3_ex4_gated_clk"); @1072
gated_clk_cell  x_fmla_ex3_ex4_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fmla_ex3_ex4_clk  ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fmla_ex3_en       ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk  ), @1073
//           .external_en (1'b0            ), @1074
//           .global_en   (cp0_yy_clk_en   ), @1075
//           .module_en   (cp0_vfpu_icg_en  ), @1076
//           .local_en    (fmla_ex3_en     ), @1077
//           .clk_out     (fmla_ex3_ex4_clk)); @1078

always @(posedge fmla_ex3_ex4_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex4_pipe6_fmla_fwd_vld <= 1'b0;
    ex4_pipe7_fmla_fwd_vld <= 1'b0;
  end
 else if(rtu_yy_xx_flush)
 begin
    ex4_pipe6_fmla_fwd_vld <= 1'b0;
    ex4_pipe7_fmla_fwd_vld <= 1'b0;
 end
 else 
 begin
    ex4_pipe6_fmla_fwd_vld <= ex3_pipe6_fmla_fwd_cmp;
    ex4_pipe7_fmla_fwd_vld <= ex3_pipe7_fmla_fwd_cmp;
  end
end   
//----------------------------------------------------------
//                    EX4 fmla fwd
//----------------------------------------------------------
//fmla fwd data
assign pipex_vfmau_ex4_fmla_slice0_half0_data[15:0]  = slice0_mult1_dp_ex4_half_fma_result[15:0];

//fmla fwd vld
assign ex4_fmla_pipe6_dst_hit  = (dp_vfmau_pipe6_mla_srcv2_vreg[6:0] == ex4_dst_vreg[6:0]);
assign ex4_fmla_pipe6_size_hit = (dp_vfmau_pipe6_mla_type[2:0] == ex4_fmla_type[2:0]) 
                              && !ex4_half;
assign ex4_fmla_pipe6_type_hit = ctrl_ex4_inst_vld 
                              && ex4_fma
                              && dp_vfmau_pipe6_mla_srcv2_vld;
                                   

assign ex4_fmla_pipe7_dst_hit  = (dp_vfmau_pipe7_mla_srcv2_vreg[6:0] == ex4_dst_vreg[6:0]);
assign ex4_fmla_pipe7_size_hit = (dp_vfmau_pipe7_mla_type[2:0] == ex4_fmla_type[2:0]) 
                              && !ex4_half;
assign ex4_fmla_pipe7_type_hit = ctrl_ex4_inst_vld 
                              && ex4_fma
                              && dp_vfmau_pipe7_mla_srcv2_vld; 

assign ex4_pipe6_fmla_fwd_cmp  = ex4_fmla_pipe6_dst_hit && ex4_fmla_pipe6_size_hit && ex4_fmla_pipe6_type_hit; 
assign ex4_pipe7_fmla_fwd_cmp  = ex4_fmla_pipe7_dst_hit && ex4_fmla_pipe7_size_hit && ex4_fmla_pipe7_type_hit; 

assign pipex_rbus_pipe6_fmla_no_fwd = !ex4_pipe6_fmla_fwd_cmp && !ex3_pipe6_fmla_fwd_cmp;
assign pipex_rbus_pipe7_fmla_no_fwd = !ex4_pipe7_fmla_fwd_cmp && !ex3_pipe7_fmla_fwd_cmp;

assign pipex_pipe6_ex4_fmla_fwd_vld = ex4_pipe6_fmla_fwd_vld;
assign pipex_pipe7_ex4_fmla_fwd_vld = ex4_pipe7_fmla_fwd_vld;

assign fmla_ex4_en = ctrl_ex4_inst_vld
                  || ctrl_ex5_inst_vld;

// &Instance("gated_clk_cell", "x_fmla_ex4_ex5_gated_clk"); @1160
gated_clk_cell  x_fmla_ex4_ex5_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fmla_ex4_ex5_clk  ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fmla_ex4_en       ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk  ), @1161
//           .external_en (1'b0            ), @1162
//           .global_en   (cp0_yy_clk_en   ), @1163
//           .module_en   (cp0_vfpu_icg_en  ), @1164
//           .local_en    (fmla_ex4_en     ), @1165
//           .clk_out     (fmla_ex4_ex5_clk)); @1166

always @(posedge fmla_ex4_ex5_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex5_pipe6_ex1_fmla_fwd_vld <= 1'b0;
    ex5_pipe7_ex1_fmla_fwd_vld <= 1'b0;
    ex5_pipe6_ex2_fmla_fwd_vld <= 1'b0; 
    ex5_pipe7_ex2_fmla_fwd_vld <= 1'b0; 
  end
  else if(rtu_yy_xx_flush)
  begin
    ex5_pipe6_ex1_fmla_fwd_vld <= 1'b0; 
    ex5_pipe7_ex1_fmla_fwd_vld <= 1'b0;
    ex5_pipe6_ex2_fmla_fwd_vld <= 1'b0; 
    ex5_pipe7_ex2_fmla_fwd_vld <= 1'b0; 
  end
  else
  begin
    ex5_pipe6_ex1_fmla_fwd_vld <= ex4_pipe6_fmla_fwd_cmp; 
    ex5_pipe7_ex1_fmla_fwd_vld <= ex4_pipe7_fmla_fwd_cmp;
    ex5_pipe6_ex2_fmla_fwd_vld <= ex4_pipe6_fmla_fwd_vld; 
    ex5_pipe7_ex2_fmla_fwd_vld <= ex4_pipe7_fmla_fwd_vld; 
  end
end

//----------------------------------------------------------
//                    EX5 fmla fwd
//----------------------------------------------------------
assign pipex_pipe6_ex5_ex1_fmla_fwd_vld = ex5_pipe6_ex1_fmla_fwd_vld;
assign pipex_pipe7_ex5_ex1_fmla_fwd_vld = ex5_pipe7_ex1_fmla_fwd_vld;
assign pipex_pipe6_ex5_ex2_fmla_fwd_vld = ex5_pipe6_ex2_fmla_fwd_vld;
assign pipex_pipe7_ex5_ex2_fmla_fwd_vld = ex5_pipe7_ex2_fmla_fwd_vld;

assign pipex_vfmau_ex5_fmla_slice0_data[67:0]      = slice0_mult1_dp_ex5_fwd_data[67:0];


// &ModuleEnd; @1213
endmodule



