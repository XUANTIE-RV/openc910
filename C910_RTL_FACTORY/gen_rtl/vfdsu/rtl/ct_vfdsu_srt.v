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
module ct_vfdsu_srt(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ex1_div,
  ex1_divisor,
  ex1_pipedown,
  ex1_remainder,
  ex1_sqrt,
  ex2_pipedown,
  ex2_srt_first_round,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  srt_ctrl_rem_zero,
  srt_ctrl_skip_srt,
  srt_secd_round,
  srt_sm_on,
  total_qt_rt_58,
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
  vfdsu_ex3_doub_expnt_rst,
  vfdsu_ex3_double,
  vfdsu_ex3_dz,
  vfdsu_ex3_half_expnt_rst,
  vfdsu_ex3_id_srt_skip,
  vfdsu_ex3_nv,
  vfdsu_ex3_of,
  vfdsu_ex3_potnt_of,
  vfdsu_ex3_potnt_uf,
  vfdsu_ex3_qnan_f,
  vfdsu_ex3_qnan_sign,
  vfdsu_ex3_rem_sign,
  vfdsu_ex3_rem_zero,
  vfdsu_ex3_result_denorm_round_add_num,
  vfdsu_ex3_result_inf,
  vfdsu_ex3_result_lfn,
  vfdsu_ex3_result_qnan,
  vfdsu_ex3_result_sign,
  vfdsu_ex3_result_zero,
  vfdsu_ex3_rm,
  vfdsu_ex3_rslt_denorm,
  vfdsu_ex3_sing_expnt_rst,
  vfdsu_ex3_single,
  vfdsu_ex3_uf
);

// &Ports; @23
input           cp0_vfpu_icg_en;                       
input           cp0_yy_clk_en;                         
input           cpurst_b;                              
input           ex1_div;                               
input   [52:0]  ex1_divisor;                           
input           ex1_pipedown;                          
input   [59:0]  ex1_remainder;                         
input           ex1_sqrt;                              
input           ex2_pipedown;                          
input           ex2_srt_first_round;                   
input           forever_cpuclk;                        
input           pad_yy_icg_scan_en;                    
input           srt_secd_round;                        
input           srt_sm_on;                             
input           vfdsu_ex2_div;                         
input           vfdsu_ex2_double;                      
input           vfdsu_ex2_dz;                          
input   [12:0]  vfdsu_ex2_expnt_add0;                  
input   [12:0]  vfdsu_ex2_expnt_add1;                  
input           vfdsu_ex2_nv;                          
input           vfdsu_ex2_of_rm_lfn;                   
input           vfdsu_ex2_op0_norm;                    
input           vfdsu_ex2_op1_norm;                    
input   [51:0]  vfdsu_ex2_qnan_f;                      
input           vfdsu_ex2_qnan_sign;                   
input           vfdsu_ex2_result_inf;                  
input           vfdsu_ex2_result_qnan;                 
input           vfdsu_ex2_result_sign;                 
input           vfdsu_ex2_result_zero;                 
input   [2 :0]  vfdsu_ex2_rm;                          
input           vfdsu_ex2_single;                      
input           vfdsu_ex2_sqrt;                        
input           vfdsu_ex2_srt_skip;                    
output          srt_ctrl_rem_zero;                     
output          srt_ctrl_skip_srt;                     
output  [57:0]  total_qt_rt_58;                        
output  [12:0]  vfdsu_ex3_doub_expnt_rst;              
output          vfdsu_ex3_double;                      
output          vfdsu_ex3_dz;                          
output  [12:0]  vfdsu_ex3_half_expnt_rst;              
output          vfdsu_ex3_id_srt_skip;                 
output          vfdsu_ex3_nv;                          
output          vfdsu_ex3_of;                          
output          vfdsu_ex3_potnt_of;                    
output          vfdsu_ex3_potnt_uf;                    
output  [51:0]  vfdsu_ex3_qnan_f;                      
output          vfdsu_ex3_qnan_sign;                   
output          vfdsu_ex3_rem_sign;                    
output          vfdsu_ex3_rem_zero;                    
output  [52:0]  vfdsu_ex3_result_denorm_round_add_num; 
output          vfdsu_ex3_result_inf;                  
output          vfdsu_ex3_result_lfn;                  
output          vfdsu_ex3_result_qnan;                 
output          vfdsu_ex3_result_sign;                 
output          vfdsu_ex3_result_zero;                 
output  [2 :0]  vfdsu_ex3_rm;                          
output          vfdsu_ex3_rslt_denorm;                 
output  [8 :0]  vfdsu_ex3_sing_expnt_rst;              
output          vfdsu_ex3_single;                      
output          vfdsu_ex3_uf;                          

// &Regs; @24
reg     [52:0]  ex2_result_double_denorm_round_add_num; 
reg     [52:0]  ex2_result_half_denorm_round_add_num;  
reg     [52:0]  ex2_result_single_denorm_round_add_num; 
reg     [12:0]  vfdsu_ex3_doub_expnt_rst;              
reg             vfdsu_ex3_double;                      
reg             vfdsu_ex3_dz;                          
reg     [12:0]  vfdsu_ex3_half_expnt_rst;              
reg             vfdsu_ex3_id_srt_skip;                 
reg             vfdsu_ex3_nv;                          
reg             vfdsu_ex3_of;                          
reg             vfdsu_ex3_potnt_of;                    
reg             vfdsu_ex3_potnt_uf;                    
reg     [51:0]  vfdsu_ex3_qnan_f;                      
reg             vfdsu_ex3_qnan_sign;                   
reg             vfdsu_ex3_rem_sign;                    
reg     [52:0]  vfdsu_ex3_result_denorm_round_add_num; 
reg             vfdsu_ex3_result_inf;                  
reg             vfdsu_ex3_result_lfn;                  
reg             vfdsu_ex3_result_qnan;                 
reg             vfdsu_ex3_result_sign;                 
reg             vfdsu_ex3_result_zero;                 
reg     [2 :0]  vfdsu_ex3_rm;                          
reg             vfdsu_ex3_rslt_denorm;                 
reg     [8 :0]  vfdsu_ex3_sing_expnt_rst;              
reg             vfdsu_ex3_single;                      
reg             vfdsu_ex3_uf;                          

// &Wires; @25
wire            cp0_vfpu_icg_en;                       
wire            cp0_yy_clk_en;                         
wire            cpurst_b;                              
wire            ex1_div;                               
wire    [52:0]  ex1_divisor;                           
wire            ex1_pipedown;                          
wire    [59:0]  ex1_remainder;                         
wire            ex1_sqrt;                              
wire            ex2_div_of;                            
wire            ex2_div_uf;                            
wire            ex2_doub_expnt_of;                     
wire            ex2_doub_expnt_uf;                     
wire            ex2_doub_potnt_of;                     
wire            ex2_doub_potnt_uf;                     
wire            ex2_double_id_nor_srt_skip;            
wire            ex2_expnt_of;                          
wire    [12:0]  ex2_expnt_result;                      
wire            ex2_expnt_uf;                          
wire            ex2_half_expnt_of;                     
wire            ex2_half_expnt_uf;                     
wire            ex2_half_id_nor_srt_skip;              
wire            ex2_half_potnt_of;                     
wire            ex2_half_potnt_uf;                     
wire            ex2_id_nor_srt_skip;                   
wire            ex2_of;                                
wire            ex2_of_plus;                           
wire            ex2_pipe_clk;                          
wire            ex2_pipe_clk_en;                       
wire            ex2_pipedown;                          
wire            ex2_potnt_of;                          
wire            ex2_potnt_of_pre;                      
wire            ex2_potnt_uf;                          
wire            ex2_potnt_uf_pre;                      
wire    [52:0]  ex2_result_denorm_round_add_num;       
wire            ex2_result_inf;                        
wire            ex2_result_lfn;                        
wire            ex2_result_qnan;                       
wire            ex2_result_zero;                       
wire            ex2_rslt_denorm;                       
wire            ex2_sing_expnt_of;                     
wire            ex2_sing_expnt_uf;                     
wire            ex2_sing_potnt_of;                     
wire            ex2_sing_potnt_uf;                     
wire            ex2_single_id_nor_srt_skip;            
wire    [12:0]  ex2_sqrt_expnt_result;                 
wire            ex2_srt_first_round;                   
wire            ex2_uf;                                
wire            ex2_uf_plus;                           
wire            forever_cpuclk;                        
wire    [6 :0]  initial_bound_sel_in;                  
wire    [55:0]  initial_divisor_in;                    
wire    [60:0]  initial_remainder_in;                  
wire            initial_srt_en;                        
wire            initial_srt_sel_div_in;                
wire            initial_srt_sel_sqrt_in;               
wire            pad_yy_icg_scan_en;                    
wire            srt_ctrl_rem_zero;                     
wire            srt_ctrl_skip_srt;                     
wire            srt_first_round;                       
wire    [60:0]  srt_remainder;                         
wire    [59:0]  srt_remainder_out;                     
wire            srt_remainder_sign;                    
wire            srt_secd_round;                        
wire            srt_sm_on;                             
wire    [57:0]  total_qt_rt;                           
wire    [57:0]  total_qt_rt_58;                        
wire    [57:0]  vdiv_qt_rt;                            
wire            vfdsu_ex2_div;                         
wire            vfdsu_ex2_double;                      
wire            vfdsu_ex2_dz;                          
wire    [12:0]  vfdsu_ex2_expnt_add0;                  
wire    [12:0]  vfdsu_ex2_expnt_add1;                  
wire    [12:0]  vfdsu_ex2_expnt_rst;                   
wire            vfdsu_ex2_nv;                          
wire            vfdsu_ex2_of_rm_lfn;                   
wire            vfdsu_ex2_op0_norm;                    
wire            vfdsu_ex2_op1_norm;                    
wire    [51:0]  vfdsu_ex2_qnan_f;                      
wire            vfdsu_ex2_qnan_sign;                   
wire            vfdsu_ex2_result_inf;                  
wire            vfdsu_ex2_result_qnan;                 
wire            vfdsu_ex2_result_sign;                 
wire            vfdsu_ex2_result_zero;                 
wire    [2 :0]  vfdsu_ex2_rm;                          
wire            vfdsu_ex2_single;                      
wire            vfdsu_ex2_sqrt;                        
wire            vfdsu_ex2_srt_skip;                    
wire            vfdsu_ex3_rem_zero;                    


//====================EX2 Expt info=========================
//EX1 only detect of/uf under id condition
//EX2 will deal with other condition

//When input is normal, overflow when E1-E2 > 128/1024
//here we mov the expnt result calculation into second stage

assign vfdsu_ex2_expnt_rst[12:0] =  (vfdsu_ex2_sqrt)
                                    ? ex2_sqrt_expnt_result[12:0]
                                    : ex2_expnt_result[12:0];
assign ex2_sqrt_expnt_result[12:0] = {ex2_expnt_result[12],
                                      ex2_expnt_result[12:1]};
assign ex2_expnt_result[12:0]  = vfdsu_ex2_expnt_add0[12:0] - vfdsu_ex2_expnt_add1[12:0];
assign ex2_doub_expnt_of = ~vfdsu_ex2_expnt_rst[12] && (vfdsu_ex2_expnt_rst[11] 
                                                        || (vfdsu_ex2_expnt_rst[10] &&
                                                            |vfdsu_ex2_expnt_rst[9:0]));
assign ex2_sing_expnt_of = ~vfdsu_ex2_expnt_rst[9] && (vfdsu_ex2_expnt_rst[8] 
                                                      || (vfdsu_ex2_expnt_rst[7]  &&
                                                          |vfdsu_ex2_expnt_rst[6:0]));

assign ex2_half_expnt_of = ~vfdsu_ex2_expnt_rst[6] && (vfdsu_ex2_expnt_rst[5] 
                                                      || (vfdsu_ex2_expnt_rst[4]  &&
                                                          |vfdsu_ex2_expnt_rst[3:0]));
assign ex2_expnt_of      = vfdsu_ex2_double ? ex2_doub_expnt_of :
                                              vfdsu_ex2_single  ? ex2_sing_expnt_of
                                                                : ex2_half_expnt_of;
assign ex2_potnt_of_pre  = vfdsu_ex2_double ? ex2_doub_potnt_of :
                           vfdsu_ex2_single ? ex2_sing_potnt_of : ex2_half_potnt_of;   
assign ex2_potnt_uf_pre  = vfdsu_ex2_double ? ex2_doub_potnt_uf : 
                           vfdsu_ex2_single ? ex2_sing_potnt_uf : ex2_half_potnt_uf;
assign ex2_expnt_uf      = vfdsu_ex2_double ? ex2_doub_expnt_uf :
                           vfdsu_ex2_single ? ex2_sing_expnt_uf : ex2_half_expnt_uf;
assign ex2_id_nor_srt_skip   = vfdsu_ex2_double ? ex2_double_id_nor_srt_skip :
                               vfdsu_ex2_single ? ex2_single_id_nor_srt_skip
                                                : ex2_half_id_nor_srt_skip; 
assign ex2_result_denorm_round_add_num[52:0] = vfdsu_ex2_double ? 
                                               ex2_result_double_denorm_round_add_num[52:0] :
                                               vfdsu_ex2_single ? 
                                               ex2_result_single_denorm_round_add_num[52:0] :
                                               ex2_result_half_denorm_round_add_num[52:0];
                                             
                                                      
//potential overflow when E1-E2 = 128/1024
assign ex2_doub_potnt_of = ~vfdsu_ex2_expnt_rst[12] && 
                           ~vfdsu_ex2_expnt_rst[11] &&
                            vfdsu_ex2_expnt_rst[10] &&
                          ~|vfdsu_ex2_expnt_rst[9:0];
assign ex2_sing_potnt_of = ~vfdsu_ex2_expnt_rst[9]  &&
                           ~vfdsu_ex2_expnt_rst[8]  &&
                            vfdsu_ex2_expnt_rst[7]  &&
                          ~|vfdsu_ex2_expnt_rst[6:0];
assign ex2_half_potnt_of = ~vfdsu_ex2_expnt_rst[6]  &&
                           ~vfdsu_ex2_expnt_rst[5]  &&
                            vfdsu_ex2_expnt_rst[4]  &&
                          ~|vfdsu_ex2_expnt_rst[3:0];  
assign ex2_potnt_of      = ex2_potnt_of_pre && 
                           vfdsu_ex2_op0_norm && 
                           vfdsu_ex2_op1_norm && 
                           vfdsu_ex2_div;

//When input is normal, underflow when E1-E2 <= -127/-1023/-15
assign ex2_doub_expnt_uf = vfdsu_ex2_expnt_rst[12] && (vfdsu_ex2_expnt_rst[11:0] <= 12'hc01);
assign ex2_sing_expnt_uf = vfdsu_ex2_expnt_rst[12] && (vfdsu_ex2_expnt_rst[11:0] <= 12'hf81);
assign ex2_half_expnt_uf = vfdsu_ex2_expnt_rst[12] && (vfdsu_ex2_expnt_rst[11:0] <= 12'hff1);
assign ex2_half_potnt_uf = &vfdsu_ex2_expnt_rst[6:4]   &&
                          ~|vfdsu_ex2_expnt_rst[3:2]   &&
                            vfdsu_ex2_expnt_rst[1]     &&
                           !vfdsu_ex2_expnt_rst[0];


//potential underflow when E1-E2 = -126/-1022
assign ex2_doub_potnt_uf = &vfdsu_ex2_expnt_rst[12:10] &&
                          ~|vfdsu_ex2_expnt_rst[9:2]   &&
                            vfdsu_ex2_expnt_rst[1]     && 
                           !vfdsu_ex2_expnt_rst[0];
assign ex2_sing_potnt_uf = &vfdsu_ex2_expnt_rst[9:7]   &&
                          ~|vfdsu_ex2_expnt_rst[6:2]   &&
                            vfdsu_ex2_expnt_rst[1]     &&
                           !vfdsu_ex2_expnt_rst[0];

assign ex2_potnt_uf      = (ex2_potnt_uf_pre && 
                            vfdsu_ex2_op0_norm && 
                            vfdsu_ex2_op1_norm &&
                            vfdsu_ex2_div)     ||
                           (ex2_potnt_uf_pre   && 
                            vfdsu_ex2_op0_norm);

//========================EX2 Overflow======================
//ex2 overflow when 
//  1.op0 & op1 both norm && expnt overflow
//  2.ex1_id_of
assign ex2_of      = ex2_of_plus;
assign ex2_of_plus = ex2_div_of  && vfdsu_ex2_div; 
assign ex2_div_of  = vfdsu_ex2_op0_norm && 
                     vfdsu_ex2_op1_norm && 
                     ex2_expnt_of;

//=======================EX2 Underflow======================
//ex2 underflow when 
//  1.op0 & op1 both norm && expnt underflow
//  2.ex1_id_uf
//  and detect when to skip the srt, here, we have further optmization
assign ex2_uf      = ex2_uf_plus;
assign ex2_uf_plus = ex2_div_uf  && vfdsu_ex2_div; 
assign ex2_div_uf  = vfdsu_ex2_op0_norm && 
                     vfdsu_ex2_op1_norm && 
                     ex2_expnt_uf;
assign ex2_double_id_nor_srt_skip =  vfdsu_ex2_expnt_rst[12] 
                                     && (vfdsu_ex2_expnt_rst[11:0]<12'hbcd);
assign ex2_single_id_nor_srt_skip =  vfdsu_ex2_expnt_rst[12] 
                                     && (vfdsu_ex2_expnt_rst[11:0]<12'hf6a);
assign ex2_half_id_nor_srt_skip   =  vfdsu_ex2_expnt_rst[12] 
                                     && (vfdsu_ex2_expnt_rst[11:0]<12'hfe7);
assign ex2_rslt_denorm            = ex2_uf;

//=======================EX2 skip srt iteration======================
assign srt_ctrl_skip_srt   =  ex2_of || ex2_id_nor_srt_skip
                                     || vfdsu_ex2_srt_skip;
//===============ex2 round prepare for denormal round======
// &CombBeg; @146
always @( vfdsu_ex2_expnt_rst[12:0])
begin
case(vfdsu_ex2_expnt_rst[12:0])
  13'h1c02:ex2_result_double_denorm_round_add_num[52:0] = 53'h1; //-1022 1
  13'h1c01:ex2_result_double_denorm_round_add_num[52:0] = 53'h2; //-1023 0
  13'h1c00:ex2_result_double_denorm_round_add_num[52:0] = 53'h4; //-1024 -1
  13'h1bff:ex2_result_double_denorm_round_add_num[52:0] = 53'h8; //-1025 -2
  13'h1bfe:ex2_result_double_denorm_round_add_num[52:0] = 53'h10; //-1026 -3
  13'h1bfd:ex2_result_double_denorm_round_add_num[52:0] = 53'h20; //-1027 -4
  13'h1bfc:ex2_result_double_denorm_round_add_num[52:0] = 53'h40; //-1028 -5
  13'h1bfb:ex2_result_double_denorm_round_add_num[52:0] = 53'h80; //-1029 -6
  13'h1bfa:ex2_result_double_denorm_round_add_num[52:0] = 53'h100; //-1030 -7
  13'h1bf9:ex2_result_double_denorm_round_add_num[52:0] = 53'h200; //-1031 -8
  13'h1bf8:ex2_result_double_denorm_round_add_num[52:0] = 53'h400; //-1032 -9
  13'h1bf7:ex2_result_double_denorm_round_add_num[52:0] = 53'h800; //-1033 -10
  13'h1bf6:ex2_result_double_denorm_round_add_num[52:0] = 53'h1000; //-1034 -11
  13'h1bf5:ex2_result_double_denorm_round_add_num[52:0] = 53'h2000; //-1035 -12
  13'h1bf4:ex2_result_double_denorm_round_add_num[52:0] = 53'h4000; //-1036 -13   
  13'h1bf3:ex2_result_double_denorm_round_add_num[52:0] = 53'h8000; // -1037
  13'h1bf2:ex2_result_double_denorm_round_add_num[52:0] = 53'h10000;//-1038
  13'h1bf1:ex2_result_double_denorm_round_add_num[52:0] = 53'h20000;//-1039
  13'h1bf0:ex2_result_double_denorm_round_add_num[52:0] = 53'h40000; //-1040
  13'h1bef:ex2_result_double_denorm_round_add_num[52:0] = 53'h80000; //-1041
  13'h1bee:ex2_result_double_denorm_round_add_num[52:0] = 53'h100000; //-1042
  13'h1bed:ex2_result_double_denorm_round_add_num[52:0] = 53'h200000; //-1043
  13'h1bec:ex2_result_double_denorm_round_add_num[52:0] = 53'h400000; //-1044
  13'h1beb:ex2_result_double_denorm_round_add_num[52:0] = 53'h800000; //-1045
  13'h1bea:ex2_result_double_denorm_round_add_num[52:0] = 53'h1000000;//-1046
  13'h1be9:ex2_result_double_denorm_round_add_num[52:0] = 53'h2000000;//-1047
  13'h1be8:ex2_result_double_denorm_round_add_num[52:0] = 53'h4000000; //-1048
  13'h1be7:ex2_result_double_denorm_round_add_num[52:0] = 53'h8000000; //-1049
  13'h1be6:ex2_result_double_denorm_round_add_num[52:0] = 53'h10000000;//-1050
  13'h1be5:ex2_result_double_denorm_round_add_num[52:0] = 53'h20000000; //-1051
  13'h1be4:ex2_result_double_denorm_round_add_num[52:0] = 53'h40000000; //-1052
  13'h1be3:ex2_result_double_denorm_round_add_num[52:0] = 53'h80000000; //-1053
  13'h1be2:ex2_result_double_denorm_round_add_num[52:0] = 53'h100000000; //-1054
  13'h1be1:ex2_result_double_denorm_round_add_num[52:0] = 53'h200000000; //-1055
  13'h1be0:ex2_result_double_denorm_round_add_num[52:0] = 53'h400000000; //-1056
  13'h1bdf:ex2_result_double_denorm_round_add_num[52:0] = 53'h800000000; //-1057
  13'h1bde:ex2_result_double_denorm_round_add_num[52:0] = 53'h1000000000; //-1058
  13'h1bdd:ex2_result_double_denorm_round_add_num[52:0] = 53'h2000000000; //-1059
  13'h1bdc:ex2_result_double_denorm_round_add_num[52:0] = 53'h4000000000; //-1060
  13'h1bdb:ex2_result_double_denorm_round_add_num[52:0] = 53'h8000000000; //-1061
  13'h1bda:ex2_result_double_denorm_round_add_num[52:0] = 53'h10000000000; //-1062
  13'h1bd9:ex2_result_double_denorm_round_add_num[52:0] = 53'h20000000000; //-1063
  13'h1bd8:ex2_result_double_denorm_round_add_num[52:0] = 53'h40000000000; //-1064
  13'h1bd7:ex2_result_double_denorm_round_add_num[52:0] = 53'h80000000000; //-1065
  13'h1bd6:ex2_result_double_denorm_round_add_num[52:0] = 53'h100000000000; //-1066
  13'h1bd5:ex2_result_double_denorm_round_add_num[52:0] = 53'h200000000000; //-1067
  13'h1bd4:ex2_result_double_denorm_round_add_num[52:0] = 53'h400000000000; //-1068
  13'h1bd3:ex2_result_double_denorm_round_add_num[52:0] = 53'h800000000000; //-1069
  13'h1bd2:ex2_result_double_denorm_round_add_num[52:0] = 53'h1000000000000;//-1070
  13'h1bd1:ex2_result_double_denorm_round_add_num[52:0] = 53'h2000000000000; //-1071
  13'h1bd0:ex2_result_double_denorm_round_add_num[52:0] = 53'h4000000000000; //-1072
  13'h1bcf:ex2_result_double_denorm_round_add_num[52:0] = 53'h8000000000000; //-1073
  13'h1bce:ex2_result_double_denorm_round_add_num[52:0] = 53'h10000000000000; //-1073
  default: ex2_result_double_denorm_round_add_num[52:0] = 53'h0;
endcase
// &CombEnd; @203
end
// &CombBeg; @204
always @( vfdsu_ex2_expnt_rst[12:0])
begin
case(vfdsu_ex2_expnt_rst[12:0])
  13'h1f82:ex2_result_single_denorm_round_add_num[52:0] = 53'h20000000; //-126 1
  13'h1f81:ex2_result_single_denorm_round_add_num[52:0] = 53'h40000000; //-127 0
  13'h1f80:ex2_result_single_denorm_round_add_num[52:0] = 53'h80000000; //-128 -1
  13'h1f7f:ex2_result_single_denorm_round_add_num[52:0] = 53'h100000000; //-129 -2
  13'h1f7e:ex2_result_single_denorm_round_add_num[52:0] = 53'h200000000; //-130 -3
  13'h1f7d:ex2_result_single_denorm_round_add_num[52:0] = 53'h400000000; //-131 -4
  13'h1f7c:ex2_result_single_denorm_round_add_num[52:0] = 53'h800000000; //-132 -5
  13'h1f7b:ex2_result_single_denorm_round_add_num[52:0] = 53'h1000000000; //-133 -6
  13'h1f7a:ex2_result_single_denorm_round_add_num[52:0] = 53'h2000000000; //-134 -7
  13'h1f79:ex2_result_single_denorm_round_add_num[52:0] = 53'h4000000000; //-135 -8
  13'h1f78:ex2_result_single_denorm_round_add_num[52:0] = 53'h8000000000; //-136 -9
  13'h1f77:ex2_result_single_denorm_round_add_num[52:0] = 53'h10000000000; //-137 -10
  13'h1f76:ex2_result_single_denorm_round_add_num[52:0] = 53'h20000000000; //-138 -11
  13'h1f75:ex2_result_single_denorm_round_add_num[52:0] = 53'h40000000000; //-139 -12
  13'h1f74:ex2_result_single_denorm_round_add_num[52:0] = 53'h80000000000; //-140 -13   
  13'h1f73:ex2_result_single_denorm_round_add_num[52:0] = 53'h100000000000; // -141 -14
  13'h1f72:ex2_result_single_denorm_round_add_num[52:0] = 53'h200000000000;//-142  -15
  13'h1f71:ex2_result_single_denorm_round_add_num[52:0] = 53'h400000000000;//-143 -16
  13'h1f70:ex2_result_single_denorm_round_add_num[52:0] = 53'h800000000000; //-144 -17
  13'h1f6f:ex2_result_single_denorm_round_add_num[52:0] = 53'h1000000000000; //-145 -18
  13'h1f6e:ex2_result_single_denorm_round_add_num[52:0] = 53'h2000000000000; //-146 -19
  13'h1f6d:ex2_result_single_denorm_round_add_num[52:0] = 53'h4000000000000; //-147 -20
  13'h1f6c:ex2_result_single_denorm_round_add_num[52:0] = 53'h8000000000000; //-148 -21
  13'h1f6b:ex2_result_single_denorm_round_add_num[52:0] = 53'h10000000000000; //-148 -22
  default: ex2_result_single_denorm_round_add_num[52:0] = 53'h0;  // -23
endcase
// &CombEnd; @232
end
// &CombBeg; @233
always @( vfdsu_ex2_expnt_rst[12:0])
begin
case(vfdsu_ex2_expnt_rst[12:0])
  13'h1ff2:ex2_result_half_denorm_round_add_num[52:0] = 53'h40000000000; //-14 1
  13'h1ff1:ex2_result_half_denorm_round_add_num[52:0] = 53'h80000000000; //-15 0
  13'h1ff0:ex2_result_half_denorm_round_add_num[52:0] = 53'h100000000000; //-16 -1
  13'h1fef:ex2_result_half_denorm_round_add_num[52:0] = 53'h200000000000; //-17 -2
  13'h1fee:ex2_result_half_denorm_round_add_num[52:0] = 53'h400000000000; //-18 -3
  13'h1fed:ex2_result_half_denorm_round_add_num[52:0] = 53'h800000000000; //-19 -4
  13'h1fec:ex2_result_half_denorm_round_add_num[52:0] = 53'h1000000000000; //-20 -5
  13'h1feb:ex2_result_half_denorm_round_add_num[52:0] = 53'h2000000000000; //-21 -6
  13'h1fea:ex2_result_half_denorm_round_add_num[52:0] = 53'h4000000000000; //-22 -7
  13'h1fe9:ex2_result_half_denorm_round_add_num[52:0] = 53'h8000000000000; //-23 -8
  13'h1fe8:ex2_result_half_denorm_round_add_num[52:0] = 53'h10000000000000; //-24 -9
  default: ex2_result_half_denorm_round_add_num[52:0] = 53'h0;  // -23
endcase
// &CombEnd; @248
end

//===================special result========================
assign ex2_result_zero = vfdsu_ex2_result_zero;
assign ex2_result_qnan = vfdsu_ex2_result_qnan;
assign ex2_result_inf  = vfdsu_ex2_result_inf || 
                         ex2_of_plus && !vfdsu_ex2_of_rm_lfn;
assign ex2_result_lfn  =  
                         ex2_of_plus &&  vfdsu_ex2_of_rm_lfn;



//====================Pipe to EX3===========================
//gate clk
// &Instance("gated_clk_cell","x_ex2_pipe_clk"); @262
gated_clk_cell  x_ex2_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @263
//           .clk_out        (ex2_pipe_clk),//Out Clock @264
//           .external_en    (1'b0), @265
//           .global_en      (cp0_yy_clk_en), @266
//           .local_en       (ex2_pipe_clk_en),//Local Condition @267
//           .module_en      (cp0_vfpu_icg_en) @268
//         ); @269
assign ex2_pipe_clk_en = ex2_pipedown;

always @(posedge ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    vfdsu_ex3_result_zero     <= 1'b0;
    vfdsu_ex3_result_qnan     <= 1'b0;
    vfdsu_ex3_result_inf      <= 1'b0;
    vfdsu_ex3_result_lfn      <= 1'b0;
    vfdsu_ex3_of              <= 1'b0;
    vfdsu_ex3_uf              <= 1'b0;
    vfdsu_ex3_nv              <= 1'b0;
    vfdsu_ex3_dz              <= 1'b0;
    vfdsu_ex3_potnt_of        <= 1'b0;
    vfdsu_ex3_potnt_uf        <= 1'b0;
    vfdsu_ex3_rem_sign        <= 1'b0;
//    vfdsu_ex3_rem_zero        <= 1'b0;
    vfdsu_ex3_doub_expnt_rst[12:0] <= 13'b0;
    vfdsu_ex3_sing_expnt_rst[8:0] <= 9'b0;
    vfdsu_ex3_half_expnt_rst[12:0] <= 13'b0;
    vfdsu_ex3_result_sign     <= 1'b0;
    vfdsu_ex3_qnan_sign       <= 1'b0;    
    vfdsu_ex3_qnan_f[51:0]    <= 52'b0;
    vfdsu_ex3_rm[2:0]         <= 3'b0;
    vfdsu_ex3_result_denorm_round_add_num[52:0] 
                              <= 53'b0;
    vfdsu_ex3_rslt_denorm     <= 1'b0;
    vfdsu_ex3_id_srt_skip     <= 1'b0;
    vfdsu_ex3_double          <=  1'b0;
    vfdsu_ex3_single          <=  1'b0;
  end
  else if(ex2_pipedown)
  begin
    vfdsu_ex3_result_zero     <= ex2_result_zero; 
    vfdsu_ex3_result_qnan     <= ex2_result_qnan;
    vfdsu_ex3_result_inf      <= ex2_result_inf;
    vfdsu_ex3_result_lfn      <= ex2_result_lfn; 
    vfdsu_ex3_of              <= ex2_of;
    vfdsu_ex3_uf              <= ex2_uf;
    vfdsu_ex3_nv              <= vfdsu_ex2_nv;
    vfdsu_ex3_dz              <= vfdsu_ex2_dz;
    vfdsu_ex3_potnt_of        <= ex2_potnt_of;
    vfdsu_ex3_potnt_uf        <= ex2_potnt_uf;
    vfdsu_ex3_rem_sign        <= srt_remainder_sign;
    //vfdsu_ex3_rem_zero        <= srt_remainder_zero;
    vfdsu_ex3_doub_expnt_rst[12:0] <= vfdsu_ex2_expnt_rst[12:0];
    vfdsu_ex3_sing_expnt_rst[8:0] <= vfdsu_ex2_expnt_rst[8:0];
    vfdsu_ex3_half_expnt_rst[12:0] <= vfdsu_ex2_expnt_rst[12:0];
    vfdsu_ex3_result_sign     <= vfdsu_ex2_result_sign;
    vfdsu_ex3_qnan_sign       <= vfdsu_ex2_qnan_sign;    
    vfdsu_ex3_qnan_f[51:0]    <= vfdsu_ex2_qnan_f[51:0];
    vfdsu_ex3_rm[2:0]         <= vfdsu_ex2_rm[2:0];
    vfdsu_ex3_result_denorm_round_add_num[52:0] 
                              <= ex2_result_denorm_round_add_num[52:0];
    vfdsu_ex3_rslt_denorm     <= ex2_rslt_denorm;
    vfdsu_ex3_id_srt_skip     <= ex2_id_nor_srt_skip;
    vfdsu_ex3_double          <= vfdsu_ex2_double;
    vfdsu_ex3_single          <= vfdsu_ex2_single;
  end
  else
  begin
    vfdsu_ex3_result_zero     <= vfdsu_ex3_result_zero; 
    vfdsu_ex3_result_qnan     <= vfdsu_ex3_result_qnan;
    vfdsu_ex3_result_inf      <= vfdsu_ex3_result_inf;
    vfdsu_ex3_result_lfn      <= vfdsu_ex3_result_lfn;
    vfdsu_ex3_of              <= vfdsu_ex3_of;
    vfdsu_ex3_uf              <= vfdsu_ex3_uf;
    vfdsu_ex3_nv              <= vfdsu_ex3_nv;
    vfdsu_ex3_dz              <= vfdsu_ex3_dz;
    vfdsu_ex3_potnt_of        <= vfdsu_ex3_potnt_of;
    vfdsu_ex3_potnt_uf        <= vfdsu_ex3_potnt_uf;
    vfdsu_ex3_rem_sign        <= vfdsu_ex3_rem_sign;
    //vfdsu_ex3_rem_zero        <= vfdsu_ex3_rem_zero;
    vfdsu_ex3_doub_expnt_rst[12:0] <= vfdsu_ex3_doub_expnt_rst[12:0];
    vfdsu_ex3_sing_expnt_rst[8:0] <= vfdsu_ex3_sing_expnt_rst[8:0];
    vfdsu_ex3_half_expnt_rst[12:0] <= vfdsu_ex3_half_expnt_rst[12:0];
    vfdsu_ex3_result_sign     <= vfdsu_ex3_result_sign;
    vfdsu_ex3_qnan_sign       <= vfdsu_ex3_qnan_sign;     
    vfdsu_ex3_qnan_f[51:0]    <= vfdsu_ex3_qnan_f[51:0];
    vfdsu_ex3_rm[2:0]         <= vfdsu_ex3_rm[2:0];
    vfdsu_ex3_result_denorm_round_add_num[52:0] 
                              <= vfdsu_ex3_result_denorm_round_add_num[52:0];
    vfdsu_ex3_rslt_denorm     <=  vfdsu_ex3_rslt_denorm;
    vfdsu_ex3_id_srt_skip    <=  vfdsu_ex3_id_srt_skip;
    vfdsu_ex3_double          <= vfdsu_ex3_double;
    vfdsu_ex3_single          <= vfdsu_ex3_single;
  end
end
assign vfdsu_ex3_rem_zero       =  ~|srt_remainder[60:0];
assign srt_ctrl_rem_zero        =  vfdsu_ex3_rem_zero;
// &Force("output","vfdsu_ex3_potnt_of"); @365
// &Force("output","vfdsu_ex3_potnt_uf"); @366
// &Force("output","vfdsu_ex3_rem_sign"); @367
// &Force("output","vfdsu_ex3_rem_zero"); @368
// &Force("output","vfdsu_ex3_result_zero"); @369
// &Force("output","vfdsu_ex3_result_qnan"); @370
// &Force("output","vfdsu_ex3_result_inf"); @371
// &Force("output","vfdsu_ex3_result_lfn"); @372
// &Force("output","vfdsu_ex3_dz"); @373
// &Force("output","vfdsu_ex3_nv"); @374
// &Force("output","vfdsu_ex3_of"); @375
// &Force("output","vfdsu_ex3_uf"); @376
// &Force("output","vfdsu_ex3_result_sign"); @377
// &Force("output","vfdsu_ex3_doub_expnt_rst"); @378
// &Force("output","vfdsu_ex3_sing_expnt_rst"); @379
// &Force("output","vfdsu_ex3_half_expnt_rst"); @380
// &Force("output","vfdsu_ex3_qnan_sign"); @381
// &Force("output","vfdsu_ex3_qnan_f"); @382
// &Force("output","vfdsu_ex3_rm"); @383
// &Force("output","vfdsu_ex3_result_denorm_round_add_num"); @384
// &Force("output","vfdsu_ex3_rslt_denorm"); @385
// &Force("output","vfdsu_ex3_id_srt_skip"); @386
// &Force("output","vfdsu_ex3_single"); @387
// &Force("output","vfdsu_ex3_double"); @388

//==========================================================
//    SRT Remainder & Divisor for Quotient/Root Generate
//==========================================================
// &Instance("ct_vfdsu_srt_radix16_with_sqrt_for_vdsp"); @411
// &Connect(.srt_sm_on    (srt_sm_on_all)); @412
// &Force("bus","ex1_remainder",59,0); @414
// &Force("bus","srt_remainder_out",69,0); @415
// &Force("nonport","srt_remainder_out"); @422
// &Force("nonport","vdiv_qt_rt"); @423
assign initial_divisor_in[55:0]   = {ex1_divisor[52:0],3'b000}; 

assign initial_remainder_in[60:0] = {2'b00,ex1_remainder[59:1]};

assign initial_bound_sel_in[6:0]  = ex1_div ? initial_divisor_in[55:49]:{7{1'b0}};

assign initial_srt_en             = ex1_pipedown;
assign initial_srt_sel_div_in     = ex1_div;
assign initial_srt_sel_sqrt_in    = ex1_sqrt;

assign srt_first_round            = ex2_srt_first_round;

// &Instance("ct_vfdsu_srt_radix16_with_sqrt"); @436
ct_vfdsu_srt_radix16_with_sqrt  x_ct_vfdsu_srt_radix16_with_sqrt (
  .cp0_vfpu_icg_en         (cp0_vfpu_icg_en        ),
  .cp0_yy_clk_en           (cp0_yy_clk_en          ),
  .cpurst_b                (cpurst_b               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .initial_bound_sel_in    (initial_bound_sel_in   ),
  .initial_divisor_in      (initial_divisor_in     ),
  .initial_remainder_in    (initial_remainder_in   ),
  .initial_srt_en          (initial_srt_en         ),
  .initial_srt_sel_div_in  (initial_srt_sel_div_in ),
  .initial_srt_sel_sqrt_in (initial_srt_sel_sqrt_in),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .srt_first_round         (srt_first_round        ),
  .srt_remainder           (srt_remainder          ),
  .srt_remainder_out       (srt_remainder_out      ),
  .srt_remainder_sign      (srt_remainder_sign     ),
  .srt_secd_round          (srt_secd_round         ),
  .srt_sm_on               (srt_sm_on              ),
  .total_qt_rt             (total_qt_rt            ),
  .vdiv_qt_rt              (vdiv_qt_rt             )
);


// &Force("bus","ex1_remainder",59,0); @438

assign total_qt_rt_58[57:0] = {total_qt_rt[57:2],2'b00};

// &ModuleEnd; @443
endmodule


