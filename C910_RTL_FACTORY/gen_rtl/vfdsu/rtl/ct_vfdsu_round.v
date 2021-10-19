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
module ct_vfdsu_round(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ex3_pipedown,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  total_qt_rt_58,
  vfdsu_ex2_of_rm_lfn,
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
  vfdsu_ex3_uf,
  vfdsu_ex4_denorm_to_tiny_frac,
  vfdsu_ex4_double,
  vfdsu_ex4_dz,
  vfdsu_ex4_expnt_rst,
  vfdsu_ex4_frac,
  vfdsu_ex4_nv,
  vfdsu_ex4_nx,
  vfdsu_ex4_of,
  vfdsu_ex4_of_rst_lfn,
  vfdsu_ex4_potnt_norm,
  vfdsu_ex4_potnt_of,
  vfdsu_ex4_potnt_uf,
  vfdsu_ex4_qnan_f,
  vfdsu_ex4_qnan_sign,
  vfdsu_ex4_result_inf,
  vfdsu_ex4_result_lfn,
  vfdsu_ex4_result_nor,
  vfdsu_ex4_result_qnan,
  vfdsu_ex4_result_sign,
  vfdsu_ex4_result_zero,
  vfdsu_ex4_rslt_denorm,
  vfdsu_ex4_single,
  vfdsu_ex4_uf
);

// &Ports; @23
input           cp0_vfpu_icg_en;                      
input           cp0_yy_clk_en;                        
input           cpurst_b;                             
input           ex3_pipedown;                         
input           forever_cpuclk;                       
input           pad_yy_icg_scan_en;                   
input   [57:0]  total_qt_rt_58;                       
input           vfdsu_ex2_of_rm_lfn;                  
input   [12:0]  vfdsu_ex3_doub_expnt_rst;             
input           vfdsu_ex3_double;                     
input           vfdsu_ex3_dz;                         
input   [12:0]  vfdsu_ex3_half_expnt_rst;             
input           vfdsu_ex3_id_srt_skip;                
input           vfdsu_ex3_nv;                         
input           vfdsu_ex3_of;                         
input           vfdsu_ex3_potnt_of;                   
input           vfdsu_ex3_potnt_uf;                   
input   [51:0]  vfdsu_ex3_qnan_f;                     
input           vfdsu_ex3_qnan_sign;                  
input           vfdsu_ex3_rem_sign;                   
input           vfdsu_ex3_rem_zero;                   
input   [52:0]  vfdsu_ex3_result_denorm_round_add_num; 
input           vfdsu_ex3_result_inf;                 
input           vfdsu_ex3_result_lfn;                 
input           vfdsu_ex3_result_qnan;                
input           vfdsu_ex3_result_sign;                
input           vfdsu_ex3_result_zero;                
input   [2 :0]  vfdsu_ex3_rm;                         
input           vfdsu_ex3_rslt_denorm;                
input   [8 :0]  vfdsu_ex3_sing_expnt_rst;             
input           vfdsu_ex3_single;                     
input           vfdsu_ex3_uf;                         
output          vfdsu_ex4_denorm_to_tiny_frac;        
output          vfdsu_ex4_double;                     
output          vfdsu_ex4_dz;                         
output  [12:0]  vfdsu_ex4_expnt_rst;                  
output  [54:0]  vfdsu_ex4_frac;                       
output          vfdsu_ex4_nv;                         
output          vfdsu_ex4_nx;                         
output          vfdsu_ex4_of;                         
output          vfdsu_ex4_of_rst_lfn;                 
output  [1 :0]  vfdsu_ex4_potnt_norm;                 
output          vfdsu_ex4_potnt_of;                   
output          vfdsu_ex4_potnt_uf;                   
output  [51:0]  vfdsu_ex4_qnan_f;                     
output          vfdsu_ex4_qnan_sign;                  
output          vfdsu_ex4_result_inf;                 
output          vfdsu_ex4_result_lfn;                 
output          vfdsu_ex4_result_nor;                 
output          vfdsu_ex4_result_qnan;                
output          vfdsu_ex4_result_sign;                
output          vfdsu_ex4_result_zero;                
output          vfdsu_ex4_rslt_denorm;                
output          vfdsu_ex4_single;                     
output          vfdsu_ex4_uf;                         

// &Regs; @24
reg             denorm_to_tiny_frac;                  
reg             double_denorm_lst_frac;               
reg     [54:0]  frac_add1_op1;                        
reg             frac_add_1;                           
reg             frac_orig;                            
reg     [54:0]  frac_sub1_op1;                        
reg             frac_sub_1;                           
reg             half_denorm_lst_frac;                 
reg     [56:0]  qt_result_double_denorm_for_round;    
reg     [13:0]  qt_result_half_denorm_for_round;      
reg     [27:0]  qt_result_single_denorm_for_round;    
reg             single_denorm_lst_frac;               
reg             vfdsu_ex4_denorm_to_tiny_frac;        
reg             vfdsu_ex4_double;                     
reg             vfdsu_ex4_dz;                         
reg     [12:0]  vfdsu_ex4_expnt_rst;                  
reg     [54:0]  vfdsu_ex4_frac;                       
reg             vfdsu_ex4_nv;                         
reg             vfdsu_ex4_nx;                         
reg             vfdsu_ex4_of;                         
reg             vfdsu_ex4_of_rst_lfn;                 
reg     [1 :0]  vfdsu_ex4_potnt_norm;                 
reg             vfdsu_ex4_potnt_of;                   
reg             vfdsu_ex4_potnt_uf;                   
reg     [51:0]  vfdsu_ex4_qnan_f;                     
reg             vfdsu_ex4_qnan_sign;                  
reg             vfdsu_ex4_result_inf;                 
reg             vfdsu_ex4_result_lfn;                 
reg             vfdsu_ex4_result_nor;                 
reg             vfdsu_ex4_result_qnan;                
reg             vfdsu_ex4_result_sign;                
reg             vfdsu_ex4_result_zero;                
reg             vfdsu_ex4_rslt_denorm;                
reg             vfdsu_ex4_single;                     
reg             vfdsu_ex4_uf;                         

// &Wires; @25
wire            cp0_vfpu_icg_en;                      
wire            cp0_yy_clk_en;                        
wire            cpurst_b;                             
wire            ex3_denorm_eq;                        
wire            ex3_denorm_gr;                        
wire            ex3_denorm_lst_frac;                  
wire            ex3_denorm_nx;                        
wire            ex3_denorm_plus;                      
wire            ex3_denorm_potnt_norm;                
wire            ex3_denorm_zero;                      
wire            ex3_doub_denorm_plus;                 
wire            ex3_doub_denorm_potnt_norm;           
wire            ex3_doub_eq;                          
wire            ex3_doub_gr;                          
wire            ex3_doub_rst_eq_1;                    
wire            ex3_doub_zero;                        
wire            ex3_double_denorm_eq;                 
wire            ex3_double_denorm_gr;                 
wire            ex3_double_denorm_zero;               
wire            ex3_double_low_not_zero;              
wire    [12:0]  ex3_expnt_adjst;                      
wire    [12:0]  ex3_expnt_adjust_result;              
wire            ex3_half_denorm_eq;                   
wire            ex3_half_denorm_gr;                   
wire            ex3_half_denorm_plus;                 
wire            ex3_half_denorm_potnt_norm;           
wire            ex3_half_denorm_zero;                 
wire            ex3_half_eq;                          
wire            ex3_half_gr;                          
wire            ex3_half_low_not_zero;                
wire            ex3_half_rst_eq_1;                    
wire            ex3_half_zero;                        
wire            ex3_nx;                               
wire            ex3_pipe_clk;                         
wire            ex3_pipe_clk_en;                      
wire            ex3_pipedown;                         
wire    [1 :0]  ex3_potnt_norm;                       
wire            ex3_qt_doub_lo2_not0;                 
wire            ex3_qt_doub_lo3_not0;                 
wire            ex3_qt_eq;                            
wire            ex3_qt_gr;                            
wire            ex3_qt_half_lo2_not0;                 
wire            ex3_qt_half_lo3_not0;                 
wire            ex3_qt_sing_lo3_not0;                 
wire            ex3_qt_sing_lo4_not0;                 
wire            ex3_qt_zero;                          
wire            ex3_rslt_denorm;                      
wire            ex3_rst_eq_1;                         
wire            ex3_rst_nor;                          
wire            ex3_sing_denorm_plus;                 
wire            ex3_sing_denorm_potnt_norm;           
wire            ex3_sing_eq;                          
wire            ex3_sing_gr;                          
wire            ex3_sing_rst_eq_1;                    
wire            ex3_sing_zero;                        
wire            ex3_single_denorm_eq;                 
wire            ex3_single_denorm_gr;                 
wire            ex3_single_denorm_zero;               
wire            ex3_single_low_not_zero;              
wire            forever_cpuclk;                       
wire    [54:0]  frac_add1_op1_with_denorm;            
wire    [54:0]  frac_add1_rst;                        
wire            frac_denorm_rdn_add_1;                
wire            frac_denorm_rdn_sub_1;                
wire            frac_denorm_rmm_add_1;                
wire            frac_denorm_rne_add_1;                
wire            frac_denorm_rtz_sub_1;                
wire            frac_denorm_rup_add_1;                
wire            frac_denorm_rup_sub_1;                
wire    [54:0]  frac_final_rst;                       
wire            frac_rdn_add_1;                       
wire            frac_rdn_sub_1;                       
wire            frac_rmm_add_1;                       
wire            frac_rne_add_1;                       
wire            frac_rtz_sub_1;                       
wire            frac_rup_add_1;                       
wire            frac_rup_sub_1;                       
wire    [54:0]  frac_sub1_op1_with_denorm;            
wire    [54:0]  frac_sub1_rst;                        
wire            pad_yy_icg_scan_en;                   
wire    [57:0]  total_qt_rt_58;                       
wire            vfdsu_ex2_of_rm_lfn;                  
wire    [12:0]  vfdsu_ex3_doub_expnt_rst;             
wire            vfdsu_ex3_double;                     
wire            vfdsu_ex3_dz;                         
wire    [12:0]  vfdsu_ex3_expnt_rst;                  
wire    [12:0]  vfdsu_ex3_half_expnt_rst;             
wire            vfdsu_ex3_id_srt_skip;                
wire            vfdsu_ex3_nv;                         
wire            vfdsu_ex3_of;                         
wire            vfdsu_ex3_potnt_of;                   
wire            vfdsu_ex3_potnt_uf;                   
wire    [51:0]  vfdsu_ex3_qnan_f;                     
wire            vfdsu_ex3_qnan_sign;                  
wire            vfdsu_ex3_rem_sign;                   
wire            vfdsu_ex3_rem_zero;                   
wire    [52:0]  vfdsu_ex3_result_denorm_round_add_num; 
wire            vfdsu_ex3_result_inf;                 
wire            vfdsu_ex3_result_lfn;                 
wire            vfdsu_ex3_result_qnan;                
wire            vfdsu_ex3_result_sign;                
wire            vfdsu_ex3_result_zero;                
wire    [2 :0]  vfdsu_ex3_rm;                         
wire            vfdsu_ex3_rslt_denorm;                
wire    [8 :0]  vfdsu_ex3_sing_expnt_rst;             
wire            vfdsu_ex3_single;                     
wire            vfdsu_ex3_uf;                         


//=======================Round Rule=========================
//1/8 <= x < 1/4, 1/2 <= y < 1, => 1/8 < z < 1/2
//q[57:0] represent the fraction part result of quotient, q[57] for 1/2
//Thus the first "1" in 58 bit quotient will be in q[56] or q[55]
//For Double Float
//29 round to get 58 bit quotient, 52+1 bit as valid result, other for round
//if q[56] is 1, q[56:4] as 1.xxxx valid result, [3:0] for round
//if q[56] is 0, q[55:3] as 1.xxxx valid result, [2:0] for round
//For Single Float
//15 round to get 30 bit quotient, 23+1 bit as valid result, other for round
//if q[56] is 1, q[56:33] as 1.xxxx valid result, [32:28] for round
//if q[56] is 0, q[55:32] as 1.xxxx valid result, [31:28] for round
assign ex3_qt_half_lo3_not0 = |total_qt_rt_58[44:42];
assign ex3_qt_half_lo2_not0 = |total_qt_rt_58[43:42];
assign ex3_half_gr       = total_qt_rt_58[56] 
                              ? total_qt_rt_58[45] && ex3_qt_half_lo3_not0
                              : total_qt_rt_58[44] && ex3_qt_half_lo2_not0;
assign ex3_half_eq          = (total_qt_rt_58[56])
                            ?  total_qt_rt_58[45] && !ex3_qt_sing_lo4_not0 
                            :  total_qt_rt_58[44] && !ex3_qt_sing_lo3_not0;
assign ex3_half_zero        = (total_qt_rt_58[56])
                            ? ~|total_qt_rt_58[45:42]
                            : ~|total_qt_rt_58[44:42];
assign ex3_half_rst_eq_1    = total_qt_rt_58[56] && ~|total_qt_rt_58[55:46];       
assign ex3_half_denorm_plus = !total_qt_rt_58[56] && (vfdsu_ex3_expnt_rst[12:0] == 13'h1ff2);
assign ex3_half_denorm_potnt_norm = total_qt_rt_58[56] && (vfdsu_ex3_expnt_rst[12:0] == 13'h1ff1);
assign vfdsu_ex3_expnt_rst[12:0]  = vfdsu_ex3_half_expnt_rst[12:0];
// &Force("bus","total_qt_rt_58",57,0); @54
assign ex3_qt_doub_lo3_not0 = |total_qt_rt_58[2:0]; 
assign ex3_qt_doub_lo2_not0 = |total_qt_rt_58[1:0]; 
assign ex3_qt_sing_lo4_not0 = |total_qt_rt_58[31:28];
assign ex3_qt_sing_lo3_not0 = |total_qt_rt_58[30:28];
//the quotient round bits great than "10000"(ronnd bits 10..0)
assign ex3_doub_gr          = (total_qt_rt_58[56])
                            ?  total_qt_rt_58[3] && ex3_qt_doub_lo3_not0
                            :  total_qt_rt_58[2] && ex3_qt_doub_lo2_not0;
assign ex3_sing_gr          = (total_qt_rt_58[56])
                            ?  total_qt_rt_58[32] && ex3_qt_sing_lo4_not0
                            :  total_qt_rt_58[31] && ex3_qt_sing_lo3_not0;

//the quotient round bits is equal to "10000"(ronnd bits 10..0)
assign ex3_doub_eq          = (total_qt_rt_58[56])
                            ?  total_qt_rt_58[3] && !ex3_qt_doub_lo3_not0 
                            :  total_qt_rt_58[2] && !ex3_qt_doub_lo2_not0;
assign ex3_sing_eq          = (total_qt_rt_58[56])
                            ?  total_qt_rt_58[32] && !ex3_qt_sing_lo4_not0 
                            :  total_qt_rt_58[31] && !ex3_qt_sing_lo3_not0;
//the quotient round bits is zero
assign ex3_doub_zero        = (total_qt_rt_58[56])
                            ? ~|total_qt_rt_58[3:0]
                            : ~|total_qt_rt_58[2:0];
assign ex3_sing_zero        = (total_qt_rt_58[56])
                            ? ~|total_qt_rt_58[32:28]
                            : ~|total_qt_rt_58[31:28];
//quotient is 1.00000..00 need special dealt with in the following
assign ex3_doub_rst_eq_1    = total_qt_rt_58[56] && ~|total_qt_rt_58[55:4];
assign ex3_sing_rst_eq_1    = total_qt_rt_58[56] && ~|total_qt_rt_58[55:33];
// for denormal result, first select the quotation num for rounding
//  specially for the result e=-126 and e=-1022,the denorm depends on the
//  MSB of the quotient
assign ex3_doub_denorm_plus       = !total_qt_rt_58[56] && (vfdsu_ex3_expnt_rst[12:0] == 13'h1c02);
assign ex3_sing_denorm_plus       = !total_qt_rt_58[56] && (vfdsu_ex3_expnt_rst[12:0] == 13'h1f82);

assign ex3_doub_denorm_potnt_norm = total_qt_rt_58[56] && (vfdsu_ex3_expnt_rst[12:0] == 13'h1c01);
assign ex3_sing_denorm_potnt_norm = total_qt_rt_58[56] && (vfdsu_ex3_expnt_rst[12:0] == 13'h1f81);
assign ex3_rslt_denorm            = ex3_denorm_plus || vfdsu_ex3_rslt_denorm;
assign ex3_denorm_potnt_norm      = vfdsu_ex3_double ? ex3_doub_denorm_potnt_norm :
                                                       vfdsu_ex3_single ? ex3_sing_denorm_potnt_norm
                                                                        : ex3_half_denorm_potnt_norm;
assign ex3_rst_eq_1         = (vfdsu_ex3_double)? ex3_doub_rst_eq_1 :
                               vfdsu_ex3_single ? ex3_sing_rst_eq_1 : ex3_half_rst_eq_1;
assign ex3_qt_eq            = (vfdsu_ex3_double)? ex3_doub_eq :
                               vfdsu_ex3_single ? ex3_sing_eq : ex3_half_eq;
assign ex3_qt_gr            = (vfdsu_ex3_double)? ex3_doub_gr :
                               vfdsu_ex3_single ? ex3_sing_gr : ex3_half_gr;
assign ex3_qt_zero          = (vfdsu_ex3_double)? ex3_doub_zero :
                               vfdsu_ex3_single ? ex3_sing_zero : ex3_half_zero;
assign ex3_denorm_plus            = (vfdsu_ex3_double)  ? ex3_doub_denorm_plus 
                                    : vfdsu_ex3_single ? ex3_sing_denorm_plus
                                                       : ex3_half_denorm_plus;
                             
// &CombBeg; @108
always @( vfdsu_ex3_doub_expnt_rst[12:0]
       or total_qt_rt_58[56:0])
begin
case(vfdsu_ex3_doub_expnt_rst[12:0])
  13'h1c02:begin qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[3:0], 53'b0}; 
                 double_denorm_lst_frac =  total_qt_rt_58[4];
						end//-1022 1
  13'h1c01:begin qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[4:0], 52'b0}; //-1023 0
                 double_denorm_lst_frac =  total_qt_rt_58[5];
						end//-1022 1
  13'h1c00:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[5:0], 51'b0}; //-1024 -1
                 double_denorm_lst_frac =  total_qt_rt_58[6];
						end//-1022 1
  13'h1bff:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[6:0], 50'b0}; //-1025 -2
                 double_denorm_lst_frac =  total_qt_rt_58[7];
						end//-1022 1
  13'h1bfe:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[7:0], 49'b0}; //-1026 -3
                 double_denorm_lst_frac =  total_qt_rt_58[8];
						end//-1022 1
  13'h1bfd:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[8:0], 48'b0}; //-1027 -4
                 double_denorm_lst_frac =  total_qt_rt_58[9];
						end//-1022 1
  13'h1bfc:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[9:0], 47'b0}; //-1028 -5
                 double_denorm_lst_frac =  total_qt_rt_58[10];
						end//-1022 1
  13'h1bfb:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[10:0],46'b0}; //-1029 -6
                 double_denorm_lst_frac =  total_qt_rt_58[11];
						end//-1022 1
  13'h1bfa:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[11:0],45'b0}; //-1030 -7
                 double_denorm_lst_frac =  total_qt_rt_58[12];
						end//-1022 1
  13'h1bf9:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[12:0],44'b0}; //-1031 -8
                 double_denorm_lst_frac =  total_qt_rt_58[13];
						end//-1022 1
  13'h1bf8:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[13:0],43'b0}; //-1032 -9
                 double_denorm_lst_frac =  total_qt_rt_58[14];
						end//-1022 1
  13'h1bf7:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[14:0],42'b0}; //-1033 -10
                 double_denorm_lst_frac =  total_qt_rt_58[15];
						end//-1022 1
  13'h1bf6:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[15:0],41'b0}; //-1034 -11
                 double_denorm_lst_frac =  total_qt_rt_58[16];
						end//-1022 1
  13'h1bf5:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[16:0],40'b0}; //-1035 -12
                 double_denorm_lst_frac =  total_qt_rt_58[17];
						end//-1022 1
  13'h1bf4:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[17:0],39'b0}; //-1036 -13   
                 double_denorm_lst_frac =  total_qt_rt_58[18];
						end//-1022 1
  13'h1bf3:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[18:0],38'b0}; // -1037
                 double_denorm_lst_frac =  total_qt_rt_58[19];
						end//-1022 1
  13'h1bf2:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[19:0],37'b0}; //-1038
                 double_denorm_lst_frac =  total_qt_rt_58[20];
						end//-1022 1
  13'h1bf1:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[20:0],36'b0}; //-1039
                 double_denorm_lst_frac =  total_qt_rt_58[21];
						end//-1022 1
  13'h1bf0:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[21:0],35'b0}; //-1040
                 double_denorm_lst_frac =  total_qt_rt_58[22];
						end//-1022 1
  13'h1bef:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[22:0],34'b0}; //-1041
                 double_denorm_lst_frac =  total_qt_rt_58[23];
						end//-1022 1
  13'h1bee:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[23:0],33'b0}; //-1042
                 double_denorm_lst_frac =  total_qt_rt_58[24];
						end//-1022 1
  13'h1bed:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[24:0],32'b0}; //-1043
                 double_denorm_lst_frac =  total_qt_rt_58[25];
						end//-1022 1
  13'h1bec:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[25:0],31'b0}; //-1044
                 double_denorm_lst_frac =  total_qt_rt_58[26];
						end//-1022 1
  13'h1beb:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[26:0],30'b0}; //-1045
                 double_denorm_lst_frac =  total_qt_rt_58[27];
						end//-1022 1
  13'h1bea:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[27:0],29'b0}; //-1046
                 double_denorm_lst_frac =  total_qt_rt_58[28];
						end//-1022 1
  13'h1be9:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[28:0],28'b0}; //-1047
                 double_denorm_lst_frac =  total_qt_rt_58[29];
						end//-1022 1
  13'h1be8:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[29:0],27'b0}; //-1048
                 double_denorm_lst_frac =  total_qt_rt_58[30];
						end//-1022 1
  13'h1be7:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[30:0],26'b0}; //-1049
                 double_denorm_lst_frac =  total_qt_rt_58[31];
						end//-1022 1
  13'h1be6:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[31:0],25'b0}; //-1050
                 double_denorm_lst_frac =  total_qt_rt_58[32];
						end//-1022 1
  13'h1be5:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[32:0],24'b0}; //-1056
                 double_denorm_lst_frac =  total_qt_rt_58[33];
						end//-1022 1
  13'h1be4:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[33:0],23'b0}; //-1052
                 double_denorm_lst_frac =  total_qt_rt_58[34];
						end//-1022 1
  13'h1be3:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[34:0],22'b0}; //-1053
                 double_denorm_lst_frac =  total_qt_rt_58[35];
						end//-1022 1
  13'h1be2:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[35:0],21'b0}; //-1054
                 double_denorm_lst_frac =  total_qt_rt_58[36];
						end//-1022 1
  13'h1be1:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[36:0],20'b0}; //-1055
                 double_denorm_lst_frac =  total_qt_rt_58[37];
						end//-1022 1
  13'h1be0:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[37:0],19'b0}; //-1056
                 double_denorm_lst_frac =  total_qt_rt_58[38];
						end//-1022 1
  13'h1bdf:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[38:0],18'b0}; //-1057
                 double_denorm_lst_frac =  total_qt_rt_58[39];
						end//-1022 1
  13'h1bde:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[39:0],17'b0}; //-1058
                 double_denorm_lst_frac =  total_qt_rt_58[40];
						end//-1022 1
  13'h1bdd:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[40:0],16'b0}; //-1059
                 double_denorm_lst_frac =  total_qt_rt_58[41];
						end//-1022 1
  13'h1bdc:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[41:0],15'b0}; //-1060
                 double_denorm_lst_frac =  total_qt_rt_58[42];
						end//-1022 1
  13'h1bdb:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[42:0],14'b0}; //-1061
                 double_denorm_lst_frac =  total_qt_rt_58[43];
						end//-1022 1
  13'h1bda:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[43:0],13'b0}; //-1062
                 double_denorm_lst_frac =  total_qt_rt_58[44];
						end//-1022 1
  13'h1bd9:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[44:0],12'b0}; //-1063
                 double_denorm_lst_frac =  total_qt_rt_58[45];
						end//-1022 1
  13'h1bd8:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[45:0],11'b0}; //-1064
                 double_denorm_lst_frac =  total_qt_rt_58[46];
						end//-1022 1
  13'h1bd7:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[46:0],10'b0}; //-1065
                 double_denorm_lst_frac =  total_qt_rt_58[47];
						end//-1022 1
  13'h1bd6:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[47:0],9'b0};  //-1066
                 double_denorm_lst_frac =  total_qt_rt_58[48];
						end//-1022 1
  13'h1bd5:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[48:0],8'b0};  //-1067
                 double_denorm_lst_frac =  total_qt_rt_58[49];
						end//-1022 1
  13'h1bd4:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[49:0],7'b0};  //-1068
                 double_denorm_lst_frac =  total_qt_rt_58[50];
						end//-1022 1
  13'h1bd3:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[50:0],6'b0};  //-1069
                 double_denorm_lst_frac =  total_qt_rt_58[51];
						end//-1022 1
  13'h1bd2:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[51:0],5'b0};  //-1070
                 double_denorm_lst_frac =  total_qt_rt_58[52];
						end//-1022 1
  13'h1bd1:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[52:0],4'b0};  //-1071
                 double_denorm_lst_frac =  total_qt_rt_58[53];
						end//-1022 1
  13'h1bd0:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[53:0],3'b0};  //-1072
                 double_denorm_lst_frac =  total_qt_rt_58[54];
						end//-1022 1
  13'h1bcf:begin  qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[54:0],2'b0};  //-1073
                 double_denorm_lst_frac =  total_qt_rt_58[55];
						end//-1022 1
  13'h1bce:begin qt_result_double_denorm_for_round[56:0] = {total_qt_rt_58[55:0],1'b0};
                 double_denorm_lst_frac =  total_qt_rt_58[56];
						end//-1022 1
  default:begin qt_result_double_denorm_for_round[56:0] = total_qt_rt_58[56:0];
                 double_denorm_lst_frac =  1'b0;
						end//-1022 1

endcase                                                                     
// &CombEnd; @274
end
//denomal result, check for rounding further optimization can be done in
//future
assign ex3_double_denorm_eq      = qt_result_double_denorm_for_round[56] 
                                   &&  !ex3_double_low_not_zero;
assign ex3_double_low_not_zero   = |qt_result_double_denorm_for_round[55:0];
assign ex3_double_denorm_gr      = qt_result_double_denorm_for_round[56] 
                                   &&  ex3_double_low_not_zero;
assign ex3_double_denorm_zero    = !qt_result_double_denorm_for_round[56] 
                                   &&  !ex3_double_low_not_zero;

// &CombBeg; @285
always @( vfdsu_ex3_sing_expnt_rst[8:0]
       or total_qt_rt_58[56:28])
begin
case(vfdsu_ex3_sing_expnt_rst[8:0])
  9'h182:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[32:28],23'b0}; //-126 1
                single_denorm_lst_frac =  total_qt_rt_58[33];
			 		end//-1022 1
  9'h181:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[33:28],22'b0}; //-127 0
                single_denorm_lst_frac =  total_qt_rt_58[34];
			 		end//-1022 1
  9'h180:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[34:28],21'b0}; //-128 -1
                single_denorm_lst_frac =  total_qt_rt_58[35];
			 		end//-1022 1
  9'h17f:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[35:28],20'b0}; //-129 -2
                single_denorm_lst_frac =  total_qt_rt_58[36];
			 		end//-1022 1
  9'h17e:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[36:28],19'b0}; //-90 -3
                single_denorm_lst_frac =  total_qt_rt_58[37];
			 		end//-1022 1
  9'h17d:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[37:28],18'b0}; //-91 -4
                single_denorm_lst_frac =  total_qt_rt_58[38];
			 		end//-1022 1
  9'h17c:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[38:28],17'b0}; //-92 -5
                single_denorm_lst_frac =  total_qt_rt_58[39];
			 		end//-1022 1
  9'h17b:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[39:28],16'b0}; //-93 -6
                single_denorm_lst_frac =  total_qt_rt_58[40];
			 		end//-1022 1
  9'h17a:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[40:28],15'b0}; //-94 -7
                single_denorm_lst_frac =  total_qt_rt_58[41];
			 		end//-1022 1
  9'h179:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[41:28],14'b0}; //-95 -8
                single_denorm_lst_frac =  total_qt_rt_58[42];
			 		end//-1022 1
  9'h178:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[42:28],13'b0}; //-96 -9
                single_denorm_lst_frac =  total_qt_rt_58[43];
			 		end//-1022 1
  9'h177:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[43:28],12'b0}; //-97 -10
                single_denorm_lst_frac =  total_qt_rt_58[44];
			 		end//-1022 1
  9'h176:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[44:28],11'b0}; //-98 -11
                single_denorm_lst_frac =  total_qt_rt_58[45];
			 		end//-1022 1
  9'h175:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[45:28],10'b0}; //-99 -12
                single_denorm_lst_frac =  total_qt_rt_58[46];
			 		end//-1022 1
  9'h174:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[46:28],9'b0}; //-140 -9   
                single_denorm_lst_frac =  total_qt_rt_58[47];
			 		end//-1022 1
  9'h173:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[47:28],8'b0}; // -141
                single_denorm_lst_frac =  total_qt_rt_58[48];
			 		end//-1022 1
  9'h172:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[48:28],7'b0};//-142
                single_denorm_lst_frac =  total_qt_rt_58[49];
			 		end//-1022 1
  9'h171:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[49:28],6'b0};//-143
                single_denorm_lst_frac =  total_qt_rt_58[50];
			 		end//-1022 1
  9'h170:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[50:28],5'b0}; //-144
                single_denorm_lst_frac =  total_qt_rt_58[51];
			 		end//-1022 1
  9'h16f:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[51:28],4'b0}; //-145
                single_denorm_lst_frac =  total_qt_rt_58[52];
			 		end//-1022 1
  9'h16e:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[52:28],3'b0}; //-146
                single_denorm_lst_frac =  total_qt_rt_58[53];
			 		end//-1022 1
  9'h16d:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[53:28],2'b0}; //-147
                single_denorm_lst_frac =  total_qt_rt_58[54];
			 		end//-1022 1
  9'h16c:begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[54:28],1'b0}; //-148
                single_denorm_lst_frac =  total_qt_rt_58[55];
			 		end//-1022 1
  9'h16b: begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[55:28]};
                 single_denorm_lst_frac = total_qt_rt_58[56] ;
						end//-1022 1
  default:  begin qt_result_single_denorm_for_round[27:0] = {total_qt_rt_58[56:29]};
                 single_denorm_lst_frac = 1'b0;
						end//-1022 1
endcase
// &CombEnd;  @363
end
//rounding evaluation for single denormalize number 
assign ex3_single_denorm_eq      = qt_result_single_denorm_for_round[27] 
                                   &&  !ex3_single_low_not_zero;
assign ex3_single_low_not_zero   = |qt_result_single_denorm_for_round[26:0];
assign ex3_single_denorm_gr      = qt_result_single_denorm_for_round[27] 
                                   &&  ex3_single_low_not_zero;
assign ex3_single_denorm_zero    = !qt_result_single_denorm_for_round[27] 
                                   && !ex3_single_low_not_zero;
// &CombBeg; @372
always @( total_qt_rt_58[56:42]
       or vfdsu_ex3_half_expnt_rst[12:0])
begin
case(vfdsu_ex3_half_expnt_rst[12:0])
  13'h1ff2:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[45:42],10'b0}; //-14 1
                 half_denorm_lst_frac =  total_qt_rt_58[46];
						end//-1022 1
  13'h1ff1:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[46:42],9'b0}; //-15 0
                 half_denorm_lst_frac =  total_qt_rt_58[47];
						end//-1022 1
  13'h1ff0:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[47:42],8'b0}; //-16 -1
                 half_denorm_lst_frac =  total_qt_rt_58[48];
						end//-1022 1
  13'h1fef:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[48:42],7'b0}; //-17 -2
                 half_denorm_lst_frac =  total_qt_rt_58[49];
						end//-1022 1
  13'h1fee:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[49:42],6'b0}; //-18 -3
                 half_denorm_lst_frac =  total_qt_rt_58[50];
						end//-1022 1
  13'h1fed:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[50:42],5'b0}; //-19 -4
                 half_denorm_lst_frac =  total_qt_rt_58[51];
						end//-1022 1
  13'h1fec:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[51:42],4'b0}; //-20 -5
                 half_denorm_lst_frac =  total_qt_rt_58[52];
						end//-1022 1
  13'h1feb:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[52:42],3'b0}; //-21 -6
                 half_denorm_lst_frac =  total_qt_rt_58[53];
						end//-1022 1
  13'h1fea:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[53:42],2'b0}; //-22 -7
                 half_denorm_lst_frac =  total_qt_rt_58[54];
						end//-1022 1
  13'h1fe9:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[54:42],1'b0}; //-23 -8
                 half_denorm_lst_frac =  total_qt_rt_58[55];
						end//-1022 1
  13'h1fe8:begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[55:42]}; //-24 -9
                 half_denorm_lst_frac =  total_qt_rt_58[56];
						end//-1022 1
  default:  begin qt_result_half_denorm_for_round[13:0] = {total_qt_rt_58[56:43]};
                 half_denorm_lst_frac = 1'b0;
						end//-1022 1
endcase
// &CombEnd;  @411
end
//rounding evaluation for single denormalize number 
assign ex3_half_denorm_eq      = qt_result_half_denorm_for_round[13] 
                                   &&  !ex3_half_low_not_zero;
assign ex3_half_low_not_zero   = |qt_result_half_denorm_for_round[12:0];
assign ex3_half_denorm_gr      = qt_result_half_denorm_for_round[13] 
                                   &&  ex3_half_low_not_zero;
assign ex3_half_denorm_zero    = !qt_result_half_denorm_for_round[13] 
                                   && !ex3_half_low_not_zero;

assign ex3_denorm_eq             = vfdsu_ex3_double ? ex3_double_denorm_eq :
                                   vfdsu_ex3_single ? ex3_single_denorm_eq : ex3_half_denorm_eq;
assign ex3_denorm_gr             = vfdsu_ex3_double ? ex3_double_denorm_gr :
                                   vfdsu_ex3_single ? ex3_single_denorm_gr : ex3_half_denorm_gr;
assign ex3_denorm_zero           = vfdsu_ex3_double ? ex3_double_denorm_zero :
                                   vfdsu_ex3_single ? ex3_single_denorm_zero : ex3_half_denorm_zero;
assign ex3_denorm_lst_frac       = vfdsu_ex3_double ? double_denorm_lst_frac :
                                   vfdsu_ex3_single ? single_denorm_lst_frac : half_denorm_lst_frac;
  
//Different Round Mode with different rounding rule
//Here we call rounding bit as "rb", remainder as "rem"
//RNE : 
//  1.+1 : rb>10000 || rb==10000 && rem>0
//  2. 0 : Rest Condition
//  3.-1 : Never occur
//RTZ : 
//  1.+1 : Never occur
//  2. 0 : Rest Condition
//  3.-1 : rb=10000 && rem<0
//RDN : 
//  1.+1 : Q>0 Never occur   ; Q<0 Rest condition
//  2. 0 : Q>0 Rest condition; Q<0 Rem<0 && rb=0 
//  3.-1 : Q>0 Rem<0 && rb=0 ; Q<0 Never occur
//RUP : 
//  1.+1 : Q>0 Rest Condition; Q<0 Never occur
//  2. 0 : Q>0 Rem<0 && rb=0 ; Q<0 Rest condition
//  3.-1 : Q>0 Never occur   ; Q<0 Rem<0 && rb=0 
//RMM : 
//  1.+1 : rb>10000 || rb==10000 && rem>0
//  2. 0 : Rest Condition
//  3.-1 : Never occur
assign frac_rne_add_1 = ex3_qt_gr || 
                       (ex3_qt_eq && !vfdsu_ex3_rem_sign); 
assign frac_rtz_sub_1 = ex3_qt_zero && vfdsu_ex3_rem_sign;
assign frac_rup_add_1 = !vfdsu_ex3_result_sign && 
                       (!ex3_qt_zero || 
                       (!vfdsu_ex3_rem_sign && !vfdsu_ex3_rem_zero)); 
assign frac_rup_sub_1 = vfdsu_ex3_result_sign && 
                       (ex3_qt_zero && vfdsu_ex3_rem_sign);
assign frac_rdn_add_1 = vfdsu_ex3_result_sign && 
                       (!ex3_qt_zero || 
                       (!vfdsu_ex3_rem_sign && !vfdsu_ex3_rem_zero));
assign frac_rdn_sub_1 = !vfdsu_ex3_result_sign &&
                       (ex3_qt_zero && vfdsu_ex3_rem_sign);
assign frac_rmm_add_1 = ex3_qt_gr || 
                       (ex3_qt_eq && !vfdsu_ex3_rem_sign); 
//denormal result 
assign frac_denorm_rne_add_1 = ex3_denorm_gr || 
                               (ex3_denorm_eq && 
                               ((vfdsu_ex3_rem_zero &&
                                ex3_denorm_lst_frac) ||
                               (!vfdsu_ex3_rem_zero && 
                                !vfdsu_ex3_rem_sign)));
assign frac_denorm_rtz_sub_1 = ex3_denorm_zero && vfdsu_ex3_rem_sign;
assign frac_denorm_rup_add_1 = !vfdsu_ex3_result_sign && 
                               (!ex3_denorm_zero || 
                               (!vfdsu_ex3_rem_sign && !vfdsu_ex3_rem_zero)); 
assign frac_denorm_rup_sub_1 = vfdsu_ex3_result_sign && 
                       (ex3_denorm_zero && vfdsu_ex3_rem_sign);
assign frac_denorm_rdn_add_1 = vfdsu_ex3_result_sign && 
                       (!ex3_denorm_zero || 
                       (!vfdsu_ex3_rem_sign && !vfdsu_ex3_rem_zero));
assign frac_denorm_rdn_sub_1 = !vfdsu_ex3_result_sign &&
                       (ex3_denorm_zero && vfdsu_ex3_rem_sign);
assign frac_denorm_rmm_add_1 = ex3_denorm_gr || 
                       (ex3_denorm_eq && !vfdsu_ex3_rem_sign);

//RM select
// &CombBeg; @489
always @( vfdsu_ex3_result_sign
       or frac_rtz_sub_1
       or frac_rdn_add_1
       or frac_denorm_rtz_sub_1
       or frac_rup_sub_1
       or frac_denorm_rmm_add_1
       or frac_denorm_rne_add_1
       or frac_rmm_add_1
       or frac_denorm_rdn_add_1
       or frac_rne_add_1
       or frac_denorm_rdn_sub_1
       or frac_rup_add_1
       or frac_denorm_rup_sub_1
       or frac_rdn_sub_1
       or ex3_rslt_denorm
       or vfdsu_ex3_rm[2:0]
       or frac_denorm_rup_add_1
       or vfdsu_ex3_id_srt_skip)
begin
case(vfdsu_ex3_rm[2:0])
  3'b000://round to nearst,ties to even
  begin 
    frac_add_1          =  ex3_rslt_denorm ? frac_denorm_rne_add_1 : frac_rne_add_1;
    frac_sub_1          =  1'b0;
    frac_orig           =  ex3_rslt_denorm ? !frac_denorm_rne_add_1 : !frac_rne_add_1;
    denorm_to_tiny_frac =  vfdsu_ex3_id_srt_skip ? 1'b0 : frac_denorm_rne_add_1;
  end
  3'b001:// round to 0
  begin 
    frac_add_1           =  1'b0;
    frac_sub_1           =  ex3_rslt_denorm ? frac_denorm_rtz_sub_1 : frac_rtz_sub_1;
    frac_orig            =  ex3_rslt_denorm ? !frac_denorm_rtz_sub_1 : !frac_rtz_sub_1;
    denorm_to_tiny_frac  = 1'b0;
  end
  3'b010://round to -inf
  begin 
    frac_add_1          =  ex3_rslt_denorm ? frac_denorm_rdn_add_1 : frac_rdn_add_1;
    frac_sub_1          =  ex3_rslt_denorm ? frac_denorm_rdn_sub_1 : frac_rdn_sub_1;
    frac_orig           =  ex3_rslt_denorm ? !frac_denorm_rdn_add_1 && !frac_denorm_rdn_sub_1 
                                           : !frac_rdn_add_1 && !frac_rdn_sub_1;
    denorm_to_tiny_frac = vfdsu_ex3_id_srt_skip ? vfdsu_ex3_result_sign 
                                                : frac_denorm_rdn_add_1;
  end
  3'b011://round to +inf
  begin 
    frac_add_1          =  ex3_rslt_denorm ? frac_denorm_rup_add_1 : frac_rup_add_1;
    frac_sub_1          =  ex3_rslt_denorm ? frac_denorm_rup_sub_1 : frac_rup_sub_1; 
    frac_orig           =  ex3_rslt_denorm ? !frac_denorm_rup_add_1 && !frac_denorm_rup_sub_1 
                                           : !frac_rup_add_1 && !frac_rup_sub_1; 
    denorm_to_tiny_frac = vfdsu_ex3_id_srt_skip ? !vfdsu_ex3_result_sign 
                                                : frac_denorm_rup_add_1;
  end
  3'b100://round to nearest,ties to max magnitude
  begin 
    frac_add_1          = ex3_rslt_denorm ? frac_denorm_rmm_add_1 : frac_rmm_add_1;
    frac_sub_1          = 1'b0;
    frac_orig           = ex3_rslt_denorm ? !frac_denorm_rmm_add_1 : !frac_rmm_add_1;
    denorm_to_tiny_frac = vfdsu_ex3_id_srt_skip ? 1'b0 : frac_denorm_rmm_add_1;
  end
  default: 
  begin 
    frac_add_1          = 1'b0;
    frac_sub_1          = 1'b0;
    frac_orig           = 1'b0;
    denorm_to_tiny_frac = 1'b0;
  end
endcase
// &CombEnd; @538
end
//Add 1 or Sub 1 constant
// &CombBeg; @540
always @( total_qt_rt_58[56]
       or vfdsu_ex3_single
       or vfdsu_ex3_double)
begin
case({total_qt_rt_58[56],vfdsu_ex3_double,vfdsu_ex3_single})
  3'b001: 
  begin
    frac_add1_op1[54:0] = {2'b0,24'b1,29'b0};
    frac_sub1_op1[54:0] = {2'b11,{24{1'b1}},29'b0};
  end
  3'b010: 
  begin
    frac_add1_op1[54:0] = 55'b1;
    frac_sub1_op1[54:0] = {55{1'b1}};
  end
  3'b101: 
  begin
    frac_add1_op1[54:0] = {25'b1,30'b0};
    frac_sub1_op1[54:0] = {{25{1'b1}},30'b0};
  end
  3'b110: 
  begin
    frac_add1_op1[54:0] = 55'b10;
    frac_sub1_op1[54:0] = {{54{1'b1}},1'b0};
  end
  3'b100:
  begin
    frac_add1_op1[54:0] = {12'b1,43'b0};
    frac_sub1_op1[54:0] = {{12{1'b1}},43'b0};
  end
  3'b000:
  begin
    frac_add1_op1[54:0] = {13'b1,42'b0};
    frac_sub1_op1[54:0] = {{13{1'b1}},42'b0};
  end
  default:
  begin
    frac_add1_op1[54:0] = 55'b0;
    frac_sub1_op1[54:0] = 55'b0;
  end
endcase
// &CombEnd; @578
end
//Add 1 or Sub1 final result
//Conner case when quotient is 0.010000...00 and remainder is negative,
//The real quotient is actually 0.00fff..ff, 
//The final result will need to sub 1 when
//RN : Never occur
//RP : sign of quotient is -
//RM : sign of quotient is +
assign frac_add1_rst[54:0]             = {1'b0,total_qt_rt_58[56:3]} +
                                         frac_add1_op1_with_denorm[54:0];
assign frac_add1_op1_with_denorm[54:0] = ex3_rslt_denorm ? 
                                  {1'b0,vfdsu_ex3_result_denorm_round_add_num[52:0],1'b0} :
                                  frac_add1_op1[54:0];      
assign frac_sub1_rst[54:0]             = (ex3_rst_eq_1)
                                       ? {2'b0,{53{1'b1}}}
                                       : {1'b0,total_qt_rt_58[56:3]} +
                                         frac_sub1_op1_with_denorm[54:0] + {54'b0,ex3_rslt_denorm};
assign frac_sub1_op1_with_denorm[54:0] = ex3_rslt_denorm ?
                                ~{1'b0,vfdsu_ex3_result_denorm_round_add_num[52:0],1'b0} :
                                frac_sub1_op1[54:0];
assign frac_final_rst[54:0]           = (frac_add1_rst[54:0]         & {55{frac_add_1}}) |
                                        (frac_sub1_rst[54:0]         & {55{frac_sub_1}}) |
                                        ({1'b0,total_qt_rt_58[56:3]} & {55{frac_orig}});

//===============Pipe down signal prepare===================
assign ex3_rst_nor = !vfdsu_ex3_result_zero && 
                     !vfdsu_ex3_result_qnan && 
                     !vfdsu_ex3_result_inf  && 
                     !vfdsu_ex3_result_lfn;
assign ex3_nx      = ex3_rst_nor && 
                    (!ex3_qt_zero || !vfdsu_ex3_rem_zero || ex3_denorm_nx);
assign ex3_denorm_nx = ex3_rslt_denorm && (!ex3_denorm_zero ||  !vfdsu_ex3_rem_zero);
//Adjust expnt
//Div:Actural expnt should plus 1 when op0 is id, sub 1 when op1 id
assign ex3_expnt_adjst[12:0] = vfdsu_ex3_double ? 13'h3ff: vfdsu_ex3_single ? 13'h7f : 13'hf;
assign ex3_expnt_adjust_result[12:0] = vfdsu_ex3_expnt_rst[12:0] + 
                                       ex3_expnt_adjst[12:0];
//this information is for the packing, which determin the result is normal
//numer or not;
assign ex3_potnt_norm[1:0]    = {ex3_denorm_plus,ex3_denorm_potnt_norm};
//=======================Pipe to EX4========================
//gate clk
// &Instance("gated_clk_cell","x_ex3_pipe_clk"); @620
gated_clk_cell  x_ex3_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex3_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex3_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @621
//           .clk_out        (ex3_pipe_clk),//Out Clock @622
//           .external_en    (1'b0), @623
//           .global_en      (cp0_yy_clk_en), @624
//           .local_en       (ex3_pipe_clk_en),//Local Condition @625
//           .module_en      (cp0_vfpu_icg_en) @626
//         ); @627
assign ex3_pipe_clk_en = ex3_pipedown;

always @(posedge ex3_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    vfdsu_ex4_result_zero     <=  1'b0;
    vfdsu_ex4_result_qnan     <=  1'b0;
    vfdsu_ex4_result_inf      <=  1'b0;
    vfdsu_ex4_result_lfn      <=  1'b0;
    vfdsu_ex4_result_sign     <=  1'b0;
    vfdsu_ex4_potnt_of        <=  1'b0;
    vfdsu_ex4_potnt_uf        <=  1'b0;
    vfdsu_ex4_result_nor      <=  1'b0;
    vfdsu_ex4_expnt_rst[12:0] <= 13'b0;
    vfdsu_ex4_nv              <=  1'b0; 
    vfdsu_ex4_nx              <=  1'b0; 
    vfdsu_ex4_uf              <=  1'b0; 
    vfdsu_ex4_of              <=  1'b0; 
    vfdsu_ex4_dz              <=  1'b0; 
    vfdsu_ex4_of_rst_lfn      <=  1'b0;
    vfdsu_ex4_frac[54:0]      <= 55'b0;
    vfdsu_ex4_qnan_sign       <=  1'b0;    
    vfdsu_ex4_qnan_f[51:0]    <= 52'b0;
    vfdsu_ex4_rslt_denorm     <= 1'b0;
    vfdsu_ex4_denorm_to_tiny_frac
                              <= 1'b0;
    vfdsu_ex4_potnt_norm[1:0] <= 2'b0;
    vfdsu_ex4_double          <= 1'b0;
    vfdsu_ex4_single          <= 1'b0;

  end
  else if(ex3_pipedown)
  begin
    vfdsu_ex4_result_zero     <= vfdsu_ex3_result_zero;
    vfdsu_ex4_result_qnan     <= vfdsu_ex3_result_qnan;
    vfdsu_ex4_result_inf      <= vfdsu_ex3_result_inf;
    vfdsu_ex4_result_lfn      <= vfdsu_ex3_result_lfn;
    vfdsu_ex4_result_sign     <= vfdsu_ex3_result_sign;
    vfdsu_ex4_potnt_of        <= vfdsu_ex3_potnt_of;
    vfdsu_ex4_potnt_uf        <= vfdsu_ex3_potnt_uf;
    vfdsu_ex4_result_nor      <= ex3_rst_nor;
    vfdsu_ex4_expnt_rst[12:0] <= ex3_expnt_adjust_result[12:0];
    vfdsu_ex4_nv              <= vfdsu_ex3_nv; 
    vfdsu_ex4_nx              <= ex3_nx; 
    vfdsu_ex4_uf              <= vfdsu_ex3_uf; 
    vfdsu_ex4_of              <= vfdsu_ex3_of; 
    vfdsu_ex4_dz              <= vfdsu_ex3_dz; 
    vfdsu_ex4_of_rst_lfn      <= vfdsu_ex2_of_rm_lfn;
    vfdsu_ex4_frac[54:0]      <= frac_final_rst[54:0];
    vfdsu_ex4_qnan_sign       <= vfdsu_ex3_qnan_sign;    
    vfdsu_ex4_qnan_f[51:0]    <= vfdsu_ex3_qnan_f[51:0];
    vfdsu_ex4_rslt_denorm     <= ex3_rslt_denorm;
    vfdsu_ex4_denorm_to_tiny_frac 
                              <= denorm_to_tiny_frac;
    vfdsu_ex4_potnt_norm[1:0] <= ex3_potnt_norm[1:0];
    vfdsu_ex4_double          <= vfdsu_ex3_double;
    vfdsu_ex4_single          <= vfdsu_ex3_single;
  end
  else
  begin
    vfdsu_ex4_result_zero     <= vfdsu_ex4_result_zero;
    vfdsu_ex4_result_qnan     <= vfdsu_ex4_result_qnan;
    vfdsu_ex4_result_inf      <= vfdsu_ex4_result_inf;
    vfdsu_ex4_result_lfn      <= vfdsu_ex4_result_lfn;
    vfdsu_ex4_result_sign     <= vfdsu_ex4_result_sign;
    vfdsu_ex4_potnt_of        <= vfdsu_ex4_potnt_of;
    vfdsu_ex4_potnt_uf        <= vfdsu_ex4_potnt_uf;
    vfdsu_ex4_result_nor      <= vfdsu_ex4_result_nor;
    vfdsu_ex4_expnt_rst[12:0] <= vfdsu_ex4_expnt_rst[12:0];
    vfdsu_ex4_nv              <= vfdsu_ex4_nv; 
    vfdsu_ex4_nx              <= vfdsu_ex4_nx; 
    vfdsu_ex4_uf              <= vfdsu_ex4_uf; 
    vfdsu_ex4_of              <= vfdsu_ex4_of; 
    vfdsu_ex4_dz              <= vfdsu_ex4_dz; 
    vfdsu_ex4_of_rst_lfn      <= vfdsu_ex4_of_rst_lfn;
    vfdsu_ex4_frac[54:0]      <= vfdsu_ex4_frac[54:0];
    vfdsu_ex4_qnan_sign       <= vfdsu_ex4_qnan_sign;
    vfdsu_ex4_qnan_f[51:0]    <= vfdsu_ex4_qnan_f[51:0];
    vfdsu_ex4_rslt_denorm     <= vfdsu_ex4_rslt_denorm;
    vfdsu_ex4_denorm_to_tiny_frac 
                              <= vfdsu_ex4_denorm_to_tiny_frac;
    vfdsu_ex4_potnt_norm[1:0] <= vfdsu_ex4_potnt_norm[1:0];
    vfdsu_ex4_double          <= vfdsu_ex4_double;
    vfdsu_ex4_single          <= vfdsu_ex4_single;
  end  
end    

// &Force("output","vfdsu_ex4_result_nor"); @716
// &Force("output","vfdsu_ex4_nx"); @717
// &Force("output","vfdsu_ex4_nv"); @718
// &Force("output","vfdsu_ex4_uf"); @719
// &Force("output","vfdsu_ex4_of"); @720
// &Force("output","vfdsu_ex4_dz"); @721
// &Force("output","vfdsu_ex4_result_sign"); @722
// &Force("output","vfdsu_ex4_of_rst_lfn"); @723
// &Force("output","vfdsu_ex4_potnt_of"); @724
// &Force("output","vfdsu_ex4_potnt_uf"); @725
// &Force("output","vfdsu_ex4_result_inf"); @726
// &Force("output","vfdsu_ex4_result_lfn"); @727
// &Force("output","vfdsu_ex4_result_qnan"); @728
// &Force("output","vfdsu_ex4_result_zero"); @729
// &Force("output","vfdsu_ex4_frac"); @730
// &Force("output","vfdsu_ex4_expnt_rst"); @731
// &Force("output","vfdsu_ex4_qnan_sign"); @732
// &Force("output","vfdsu_ex4_qnan_f"); @733
// &Force("output","vfdsu_ex4_rslt_denorm"); @734
// &Force("output","vfdsu_ex4_denorm_to_tiny_frac"); @735
// &Force("output","vfdsu_ex4_potnt_norm"); @736
// &Force("output","vfdsu_ex4_double"); @737
// &Force("output","vfdsu_ex4_single"); @738
// &ModuleEnd; @739
endmodule


