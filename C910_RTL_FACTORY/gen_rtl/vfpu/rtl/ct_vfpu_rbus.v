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
module ct_vfpu_rbus(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ex1_pipe6_data_vld,
  ctrl_ex1_pipe6_data_vld_dup0,
  ctrl_ex1_pipe6_data_vld_dup1,
  ctrl_ex1_pipe6_data_vld_dup2,
  ctrl_ex1_pipe7_data_vld,
  ctrl_ex1_pipe7_data_vld_dup0,
  ctrl_ex1_pipe7_data_vld_dup1,
  ctrl_ex1_pipe7_data_vld_dup2,
  ctrl_ex2_pipe6_data_vld,
  ctrl_ex2_pipe6_data_vld_dup0,
  ctrl_ex2_pipe6_data_vld_dup1,
  ctrl_ex2_pipe6_data_vld_dup2,
  ctrl_ex2_pipe7_data_vld,
  ctrl_ex2_pipe7_data_vld_dup0,
  ctrl_ex2_pipe7_data_vld_dup1,
  ctrl_ex2_pipe7_data_vld_dup2,
  ctrl_ex3_pipe6_data_vld,
  ctrl_ex3_pipe6_data_vld_dup0,
  ctrl_ex3_pipe6_data_vld_dup1,
  ctrl_ex3_pipe6_data_vld_dup2,
  ctrl_ex3_pipe6_fwd_vld,
  ctrl_ex3_pipe7_data_vld,
  ctrl_ex3_pipe7_data_vld_dup0,
  ctrl_ex3_pipe7_data_vld_dup1,
  ctrl_ex3_pipe7_data_vld_dup2,
  ctrl_ex3_pipe7_fwd_vld,
  ctrl_ex4_pipe6_fwd_vld,
  ctrl_ex4_pipe7_fwd_vld,
  ctrl_ex4_pipe7_inst_vld,
  ctrl_ex5_pipe6_clk,
  ctrl_ex5_pipe7_clk,
  dp_ex3_pipe6_dst_vreg,
  dp_ex3_pipe6_freg_data,
  dp_ex3_pipe7_dst_vreg,
  dp_ex3_pipe7_freg_data,
  dp_ex4_pipe6_dst_ereg,
  dp_ex4_pipe6_dst_vreg,
  dp_ex4_pipe6_normal_dste_wb_vld,
  dp_ex4_pipe6_normal_dstv_wb_vld,
  dp_ex4_pipe7_dst_ereg,
  dp_ex4_pipe7_dst_vreg,
  dp_ex4_pipe7_dste_vld,
  dp_ex4_pipe7_dstv_vld,
  dp_ex5_pipe6_ereg_data_pre,
  dp_ex5_pipe6_freg_data_pre,
  dp_ex5_pipe7_ereg_data_pre,
  dp_ex5_pipe7_freg_data_pre,
  dp_rbus_pipe6_ex1_vreg,
  dp_rbus_pipe6_ex1_vreg_dup0,
  dp_rbus_pipe6_ex1_vreg_dup1,
  dp_rbus_pipe6_ex1_vreg_dup2,
  dp_rbus_pipe6_ex2_vreg,
  dp_rbus_pipe6_ex2_vreg_dup0,
  dp_rbus_pipe6_ex2_vreg_dup1,
  dp_rbus_pipe6_ex2_vreg_dup2,
  dp_rbus_pipe6_ex3_vreg_dup0,
  dp_rbus_pipe6_ex3_vreg_dup1,
  dp_rbus_pipe6_ex3_vreg_dup2,
  dp_rbus_pipe6_ex3_vreg_dup3,
  dp_rbus_pipe7_ex1_vreg,
  dp_rbus_pipe7_ex1_vreg_dup0,
  dp_rbus_pipe7_ex1_vreg_dup1,
  dp_rbus_pipe7_ex1_vreg_dup2,
  dp_rbus_pipe7_ex2_vreg,
  dp_rbus_pipe7_ex2_vreg_dup0,
  dp_rbus_pipe7_ex2_vreg_dup1,
  dp_rbus_pipe7_ex2_vreg_dup2,
  dp_rbus_pipe7_ex3_vreg_dup0,
  dp_rbus_pipe7_ex3_vreg_dup1,
  dp_rbus_pipe7_ex3_vreg_dup2,
  dp_rbus_pipe7_ex3_vreg_dup3,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  pipe6_rbus_ex1_fmla_data_vld,
  pipe6_rbus_ex1_fmla_data_vld_dup0,
  pipe6_rbus_ex1_fmla_data_vld_dup1,
  pipe6_rbus_ex1_fmla_data_vld_dup2,
  pipe6_rbus_ex2_fmla_data_vld,
  pipe6_rbus_ex2_fmla_data_vld_dup0,
  pipe6_rbus_ex2_fmla_data_vld_dup1,
  pipe6_rbus_ex2_fmla_data_vld_dup2,
  pipe6_rbus_pipe6_fmla_no_fwd,
  pipe6_rbus_pipe7_fmla_no_fwd,
  pipe6_rbus_vfmau_ereg_wb_data,
  pipe6_rbus_vfmau_ereg_wb_vld,
  pipe6_rbus_vfmau_freg_wb_data,
  pipe6_rbus_vfmau_vreg_wb_vld,
  pipe7_rbus_ex1_fmla_data_vld,
  pipe7_rbus_ex1_fmla_data_vld_dup0,
  pipe7_rbus_ex1_fmla_data_vld_dup1,
  pipe7_rbus_ex1_fmla_data_vld_dup2,
  pipe7_rbus_ex2_fmla_data_vld,
  pipe7_rbus_ex2_fmla_data_vld_dup0,
  pipe7_rbus_ex2_fmla_data_vld_dup1,
  pipe7_rbus_ex2_fmla_data_vld_dup2,
  pipe7_rbus_pipe6_fmla_no_fwd,
  pipe7_rbus_pipe7_fmla_no_fwd,
  pipe7_rbus_vfmau_ereg_wb_data,
  pipe7_rbus_vfmau_ereg_wb_vld,
  pipe7_rbus_vfmau_freg_wb_data,
  pipe7_rbus_vfmau_vreg_wb_vld,
  rtu_yy_xx_flush,
  vdsp_vfpu_pipe6_inside_fwd_aval,
  vdsp_vfpu_pipe7_inside_fwd_aval,
  vfpu_idu_ex1_pipe6_data_vld_dup0,
  vfpu_idu_ex1_pipe6_data_vld_dup1,
  vfpu_idu_ex1_pipe6_data_vld_dup2,
  vfpu_idu_ex1_pipe6_data_vld_dup3,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dup0,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dup1,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dup2,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dup3,
  vfpu_idu_ex1_pipe6_vreg_dup0,
  vfpu_idu_ex1_pipe6_vreg_dup1,
  vfpu_idu_ex1_pipe6_vreg_dup2,
  vfpu_idu_ex1_pipe6_vreg_dup3,
  vfpu_idu_ex1_pipe7_data_vld_dup0,
  vfpu_idu_ex1_pipe7_data_vld_dup1,
  vfpu_idu_ex1_pipe7_data_vld_dup2,
  vfpu_idu_ex1_pipe7_data_vld_dup3,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dup0,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dup1,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dup2,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dup3,
  vfpu_idu_ex1_pipe7_vreg_dup0,
  vfpu_idu_ex1_pipe7_vreg_dup1,
  vfpu_idu_ex1_pipe7_vreg_dup2,
  vfpu_idu_ex1_pipe7_vreg_dup3,
  vfpu_idu_ex2_pipe6_data_vld_dup0,
  vfpu_idu_ex2_pipe6_data_vld_dup1,
  vfpu_idu_ex2_pipe6_data_vld_dup2,
  vfpu_idu_ex2_pipe6_data_vld_dup3,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dup0,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dup1,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dup2,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dup3,
  vfpu_idu_ex2_pipe6_vreg_dup0,
  vfpu_idu_ex2_pipe6_vreg_dup1,
  vfpu_idu_ex2_pipe6_vreg_dup2,
  vfpu_idu_ex2_pipe6_vreg_dup3,
  vfpu_idu_ex2_pipe7_data_vld_dup0,
  vfpu_idu_ex2_pipe7_data_vld_dup1,
  vfpu_idu_ex2_pipe7_data_vld_dup2,
  vfpu_idu_ex2_pipe7_data_vld_dup3,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dup0,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dup1,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dup2,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dup3,
  vfpu_idu_ex2_pipe7_vreg_dup0,
  vfpu_idu_ex2_pipe7_vreg_dup1,
  vfpu_idu_ex2_pipe7_vreg_dup2,
  vfpu_idu_ex2_pipe7_vreg_dup3,
  vfpu_idu_ex3_pipe6_data_vld_dup0,
  vfpu_idu_ex3_pipe6_data_vld_dup1,
  vfpu_idu_ex3_pipe6_data_vld_dup2,
  vfpu_idu_ex3_pipe6_data_vld_dup3,
  vfpu_idu_ex3_pipe6_fwd_vreg,
  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data,
  vfpu_idu_ex3_pipe6_fwd_vreg_vld,
  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data,
  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data,
  vfpu_idu_ex3_pipe6_vreg_dup0,
  vfpu_idu_ex3_pipe6_vreg_dup1,
  vfpu_idu_ex3_pipe6_vreg_dup2,
  vfpu_idu_ex3_pipe6_vreg_dup3,
  vfpu_idu_ex3_pipe7_data_vld_dup0,
  vfpu_idu_ex3_pipe7_data_vld_dup1,
  vfpu_idu_ex3_pipe7_data_vld_dup2,
  vfpu_idu_ex3_pipe7_data_vld_dup3,
  vfpu_idu_ex3_pipe7_fwd_vreg,
  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data,
  vfpu_idu_ex3_pipe7_fwd_vreg_vld,
  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data,
  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data,
  vfpu_idu_ex3_pipe7_vreg_dup0,
  vfpu_idu_ex3_pipe7_vreg_dup1,
  vfpu_idu_ex3_pipe7_vreg_dup2,
  vfpu_idu_ex3_pipe7_vreg_dup3,
  vfpu_idu_ex4_pipe6_fwd_vreg,
  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data,
  vfpu_idu_ex4_pipe6_fwd_vreg_vld,
  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data,
  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data,
  vfpu_idu_ex4_pipe7_fwd_vreg,
  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data,
  vfpu_idu_ex4_pipe7_fwd_vreg_vld,
  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data,
  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data,
  vfpu_idu_ex5_pipe6_fwd_vreg,
  vfpu_idu_ex5_pipe6_fwd_vreg_vld,
  vfpu_idu_ex5_pipe6_wb_ereg,
  vfpu_idu_ex5_pipe6_wb_ereg_data,
  vfpu_idu_ex5_pipe6_wb_ereg_vld,
  vfpu_idu_ex5_pipe6_wb_vreg_dup0,
  vfpu_idu_ex5_pipe6_wb_vreg_dup1,
  vfpu_idu_ex5_pipe6_wb_vreg_dup2,
  vfpu_idu_ex5_pipe6_wb_vreg_dup3,
  vfpu_idu_ex5_pipe6_wb_vreg_fr_data,
  vfpu_idu_ex5_pipe6_wb_vreg_fr_expand,
  vfpu_idu_ex5_pipe6_wb_vreg_fr_vld,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3,
  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data,
  vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand,
  vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld,
  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data,
  vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand,
  vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld,
  vfpu_idu_ex5_pipe7_fwd_vreg,
  vfpu_idu_ex5_pipe7_fwd_vreg_vld,
  vfpu_idu_ex5_pipe7_wb_ereg,
  vfpu_idu_ex5_pipe7_wb_ereg_data,
  vfpu_idu_ex5_pipe7_wb_ereg_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_dup0,
  vfpu_idu_ex5_pipe7_wb_vreg_dup1,
  vfpu_idu_ex5_pipe7_wb_vreg_dup2,
  vfpu_idu_ex5_pipe7_wb_vreg_dup3,
  vfpu_idu_ex5_pipe7_wb_vreg_fr_data,
  vfpu_idu_ex5_pipe7_wb_vreg_fr_expand,
  vfpu_idu_ex5_pipe7_wb_vreg_fr_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3,
  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data,
  vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand,
  vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data,
  vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand,
  vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld,
  vfpu_idu_pipe6_vmla_srcv2_no_fwd,
  vfpu_idu_pipe7_vmla_srcv2_no_fwd,
  vfpu_rtu_ex5_pipe6_ereg_wb_vld,
  vfpu_rtu_ex5_pipe6_wb_ereg,
  vfpu_rtu_ex5_pipe6_wb_vreg_expand,
  vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld,
  vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld,
  vfpu_rtu_ex5_pipe7_ereg_wb_vld,
  vfpu_rtu_ex5_pipe7_wb_ereg,
  vfpu_rtu_ex5_pipe7_wb_vreg_expand,
  vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld,
  vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld
);

// &Ports; @23
input           cp0_vfpu_icg_en;                      
input           cp0_yy_clk_en;                        
input           cpurst_b;                             
input           ctrl_ex1_pipe6_data_vld;              
input           ctrl_ex1_pipe6_data_vld_dup0;         
input           ctrl_ex1_pipe6_data_vld_dup1;         
input           ctrl_ex1_pipe6_data_vld_dup2;         
input           ctrl_ex1_pipe7_data_vld;              
input           ctrl_ex1_pipe7_data_vld_dup0;         
input           ctrl_ex1_pipe7_data_vld_dup1;         
input           ctrl_ex1_pipe7_data_vld_dup2;         
input           ctrl_ex2_pipe6_data_vld;              
input           ctrl_ex2_pipe6_data_vld_dup0;         
input           ctrl_ex2_pipe6_data_vld_dup1;         
input           ctrl_ex2_pipe6_data_vld_dup2;         
input           ctrl_ex2_pipe7_data_vld;              
input           ctrl_ex2_pipe7_data_vld_dup0;         
input           ctrl_ex2_pipe7_data_vld_dup1;         
input           ctrl_ex2_pipe7_data_vld_dup2;         
input           ctrl_ex3_pipe6_data_vld;              
input           ctrl_ex3_pipe6_data_vld_dup0;         
input           ctrl_ex3_pipe6_data_vld_dup1;         
input           ctrl_ex3_pipe6_data_vld_dup2;         
input           ctrl_ex3_pipe6_fwd_vld;               
input           ctrl_ex3_pipe7_data_vld;              
input           ctrl_ex3_pipe7_data_vld_dup0;         
input           ctrl_ex3_pipe7_data_vld_dup1;         
input           ctrl_ex3_pipe7_data_vld_dup2;         
input           ctrl_ex3_pipe7_fwd_vld;               
input           ctrl_ex4_pipe6_fwd_vld;               
input           ctrl_ex4_pipe7_fwd_vld;               
input           ctrl_ex4_pipe7_inst_vld;              
input           ctrl_ex5_pipe6_clk;                   
input           ctrl_ex5_pipe7_clk;                   
input   [6 :0]  dp_ex3_pipe6_dst_vreg;                
input   [63:0]  dp_ex3_pipe6_freg_data;               
input   [6 :0]  dp_ex3_pipe7_dst_vreg;                
input   [63:0]  dp_ex3_pipe7_freg_data;               
input   [4 :0]  dp_ex4_pipe6_dst_ereg;                
input   [6 :0]  dp_ex4_pipe6_dst_vreg;                
input           dp_ex4_pipe6_normal_dste_wb_vld;      
input           dp_ex4_pipe6_normal_dstv_wb_vld;      
input   [4 :0]  dp_ex4_pipe7_dst_ereg;                
input   [6 :0]  dp_ex4_pipe7_dst_vreg;                
input           dp_ex4_pipe7_dste_vld;                
input           dp_ex4_pipe7_dstv_vld;                
input   [4 :0]  dp_ex5_pipe6_ereg_data_pre;           
input   [63:0]  dp_ex5_pipe6_freg_data_pre;           
input   [4 :0]  dp_ex5_pipe7_ereg_data_pre;           
input   [63:0]  dp_ex5_pipe7_freg_data_pre;           
input   [6 :0]  dp_rbus_pipe6_ex1_vreg;               
input   [6 :0]  dp_rbus_pipe6_ex1_vreg_dup0;          
input   [6 :0]  dp_rbus_pipe6_ex1_vreg_dup1;          
input   [6 :0]  dp_rbus_pipe6_ex1_vreg_dup2;          
input   [6 :0]  dp_rbus_pipe6_ex2_vreg;               
input   [6 :0]  dp_rbus_pipe6_ex2_vreg_dup0;          
input   [6 :0]  dp_rbus_pipe6_ex2_vreg_dup1;          
input   [6 :0]  dp_rbus_pipe6_ex2_vreg_dup2;          
input   [6 :0]  dp_rbus_pipe6_ex3_vreg_dup0;          
input   [6 :0]  dp_rbus_pipe6_ex3_vreg_dup1;          
input   [6 :0]  dp_rbus_pipe6_ex3_vreg_dup2;          
input   [6 :0]  dp_rbus_pipe6_ex3_vreg_dup3;          
input   [6 :0]  dp_rbus_pipe7_ex1_vreg;               
input   [6 :0]  dp_rbus_pipe7_ex1_vreg_dup0;          
input   [6 :0]  dp_rbus_pipe7_ex1_vreg_dup1;          
input   [6 :0]  dp_rbus_pipe7_ex1_vreg_dup2;          
input   [6 :0]  dp_rbus_pipe7_ex2_vreg;               
input   [6 :0]  dp_rbus_pipe7_ex2_vreg_dup0;          
input   [6 :0]  dp_rbus_pipe7_ex2_vreg_dup1;          
input   [6 :0]  dp_rbus_pipe7_ex2_vreg_dup2;          
input   [6 :0]  dp_rbus_pipe7_ex3_vreg_dup0;          
input   [6 :0]  dp_rbus_pipe7_ex3_vreg_dup1;          
input   [6 :0]  dp_rbus_pipe7_ex3_vreg_dup2;          
input   [6 :0]  dp_rbus_pipe7_ex3_vreg_dup3;          
input           forever_cpuclk;                       
input           pad_yy_icg_scan_en;                   
input           pipe6_rbus_ex1_fmla_data_vld;         
input           pipe6_rbus_ex1_fmla_data_vld_dup0;    
input           pipe6_rbus_ex1_fmla_data_vld_dup1;    
input           pipe6_rbus_ex1_fmla_data_vld_dup2;    
input           pipe6_rbus_ex2_fmla_data_vld;         
input           pipe6_rbus_ex2_fmla_data_vld_dup0;    
input           pipe6_rbus_ex2_fmla_data_vld_dup1;    
input           pipe6_rbus_ex2_fmla_data_vld_dup2;    
input           pipe6_rbus_pipe6_fmla_no_fwd;         
input           pipe6_rbus_pipe7_fmla_no_fwd;         
input   [4 :0]  pipe6_rbus_vfmau_ereg_wb_data;        
input           pipe6_rbus_vfmau_ereg_wb_vld;         
input   [63:0]  pipe6_rbus_vfmau_freg_wb_data;        
input           pipe6_rbus_vfmau_vreg_wb_vld;         
input           pipe7_rbus_ex1_fmla_data_vld;         
input           pipe7_rbus_ex1_fmla_data_vld_dup0;    
input           pipe7_rbus_ex1_fmla_data_vld_dup1;    
input           pipe7_rbus_ex1_fmla_data_vld_dup2;    
input           pipe7_rbus_ex2_fmla_data_vld;         
input           pipe7_rbus_ex2_fmla_data_vld_dup0;    
input           pipe7_rbus_ex2_fmla_data_vld_dup1;    
input           pipe7_rbus_ex2_fmla_data_vld_dup2;    
input           pipe7_rbus_pipe6_fmla_no_fwd;         
input           pipe7_rbus_pipe7_fmla_no_fwd;         
input   [4 :0]  pipe7_rbus_vfmau_ereg_wb_data;        
input           pipe7_rbus_vfmau_ereg_wb_vld;         
input   [63:0]  pipe7_rbus_vfmau_freg_wb_data;        
input           pipe7_rbus_vfmau_vreg_wb_vld;         
input           rtu_yy_xx_flush;                      
input           vdsp_vfpu_pipe6_inside_fwd_aval;      
input           vdsp_vfpu_pipe7_inside_fwd_aval;      
output          vfpu_idu_ex1_pipe6_data_vld_dup0;     
output          vfpu_idu_ex1_pipe6_data_vld_dup1;     
output          vfpu_idu_ex1_pipe6_data_vld_dup2;     
output          vfpu_idu_ex1_pipe6_data_vld_dup3;     
output          vfpu_idu_ex1_pipe6_fmla_data_vld_dup0; 
output          vfpu_idu_ex1_pipe6_fmla_data_vld_dup1; 
output          vfpu_idu_ex1_pipe6_fmla_data_vld_dup2; 
output          vfpu_idu_ex1_pipe6_fmla_data_vld_dup3; 
output  [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup0;         
output  [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup1;         
output  [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup2;         
output  [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup3;         
output          vfpu_idu_ex1_pipe7_data_vld_dup0;     
output          vfpu_idu_ex1_pipe7_data_vld_dup1;     
output          vfpu_idu_ex1_pipe7_data_vld_dup2;     
output          vfpu_idu_ex1_pipe7_data_vld_dup3;     
output          vfpu_idu_ex1_pipe7_fmla_data_vld_dup0; 
output          vfpu_idu_ex1_pipe7_fmla_data_vld_dup1; 
output          vfpu_idu_ex1_pipe7_fmla_data_vld_dup2; 
output          vfpu_idu_ex1_pipe7_fmla_data_vld_dup3; 
output  [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup0;         
output  [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup1;         
output  [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup2;         
output  [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup3;         
output          vfpu_idu_ex2_pipe6_data_vld_dup0;     
output          vfpu_idu_ex2_pipe6_data_vld_dup1;     
output          vfpu_idu_ex2_pipe6_data_vld_dup2;     
output          vfpu_idu_ex2_pipe6_data_vld_dup3;     
output          vfpu_idu_ex2_pipe6_fmla_data_vld_dup0; 
output          vfpu_idu_ex2_pipe6_fmla_data_vld_dup1; 
output          vfpu_idu_ex2_pipe6_fmla_data_vld_dup2; 
output          vfpu_idu_ex2_pipe6_fmla_data_vld_dup3; 
output  [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup0;         
output  [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup1;         
output  [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup2;         
output  [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup3;         
output          vfpu_idu_ex2_pipe7_data_vld_dup0;     
output          vfpu_idu_ex2_pipe7_data_vld_dup1;     
output          vfpu_idu_ex2_pipe7_data_vld_dup2;     
output          vfpu_idu_ex2_pipe7_data_vld_dup3;     
output          vfpu_idu_ex2_pipe7_fmla_data_vld_dup0; 
output          vfpu_idu_ex2_pipe7_fmla_data_vld_dup1; 
output          vfpu_idu_ex2_pipe7_fmla_data_vld_dup2; 
output          vfpu_idu_ex2_pipe7_fmla_data_vld_dup3; 
output  [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup0;         
output  [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup1;         
output  [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup2;         
output  [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup3;         
output          vfpu_idu_ex3_pipe6_data_vld_dup0;     
output          vfpu_idu_ex3_pipe6_data_vld_dup1;     
output          vfpu_idu_ex3_pipe6_data_vld_dup2;     
output          vfpu_idu_ex3_pipe6_data_vld_dup3;     
output  [6 :0]  vfpu_idu_ex3_pipe6_fwd_vreg;          
output  [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data;  
output          vfpu_idu_ex3_pipe6_fwd_vreg_vld;      
output  [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data; 
output  [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data; 
output  [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup0;         
output  [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup1;         
output  [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup2;         
output  [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup3;         
output          vfpu_idu_ex3_pipe7_data_vld_dup0;     
output          vfpu_idu_ex3_pipe7_data_vld_dup1;     
output          vfpu_idu_ex3_pipe7_data_vld_dup2;     
output          vfpu_idu_ex3_pipe7_data_vld_dup3;     
output  [6 :0]  vfpu_idu_ex3_pipe7_fwd_vreg;          
output  [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data;  
output          vfpu_idu_ex3_pipe7_fwd_vreg_vld;      
output  [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data; 
output  [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data; 
output  [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup0;         
output  [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup1;         
output  [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup2;         
output  [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup3;         
output  [6 :0]  vfpu_idu_ex4_pipe6_fwd_vreg;          
output  [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data;  
output          vfpu_idu_ex4_pipe6_fwd_vreg_vld;      
output  [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data; 
output  [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data; 
output  [6 :0]  vfpu_idu_ex4_pipe7_fwd_vreg;          
output  [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data;  
output          vfpu_idu_ex4_pipe7_fwd_vreg_vld;      
output  [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data; 
output  [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data; 
output  [6 :0]  vfpu_idu_ex5_pipe6_fwd_vreg;          
output          vfpu_idu_ex5_pipe6_fwd_vreg_vld;      
output  [4 :0]  vfpu_idu_ex5_pipe6_wb_ereg;           
output  [5 :0]  vfpu_idu_ex5_pipe6_wb_ereg_data;      
output          vfpu_idu_ex5_pipe6_wb_ereg_vld;       
output  [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup0;      
output  [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup1;      
output  [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup2;      
output  [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup3;      
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_data;   
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_expand; 
output          vfpu_idu_ex5_pipe6_wb_vreg_fr_vld;    
output          vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0;  
output          vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1;  
output          vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2;  
output          vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3;  
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data;  
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand; 
output          vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld;   
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data;  
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand; 
output          vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld;   
output  [6 :0]  vfpu_idu_ex5_pipe7_fwd_vreg;          
output          vfpu_idu_ex5_pipe7_fwd_vreg_vld;      
output  [4 :0]  vfpu_idu_ex5_pipe7_wb_ereg;           
output  [5 :0]  vfpu_idu_ex5_pipe7_wb_ereg_data;      
output          vfpu_idu_ex5_pipe7_wb_ereg_vld;       
output  [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup0;      
output  [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup1;      
output  [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup2;      
output  [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup3;      
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_data;   
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_expand; 
output          vfpu_idu_ex5_pipe7_wb_vreg_fr_vld;    
output          vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0;  
output          vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1;  
output          vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2;  
output          vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3;  
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data;  
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand; 
output          vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld;   
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data;  
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand; 
output          vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld;   
output          vfpu_idu_pipe6_vmla_srcv2_no_fwd;     
output          vfpu_idu_pipe7_vmla_srcv2_no_fwd;     
output          vfpu_rtu_ex5_pipe6_ereg_wb_vld;       
output  [4 :0]  vfpu_rtu_ex5_pipe6_wb_ereg;           
output  [63:0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand;    
output          vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld;    
output          vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld;    
output          vfpu_rtu_ex5_pipe7_ereg_wb_vld;       
output  [4 :0]  vfpu_rtu_ex5_pipe7_wb_ereg;           
output  [63:0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand;    
output          vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld;    
output          vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld;    

// &Regs; @24
reg             rbus_pipe6_ereg_wb_vld;               
reg             rbus_pipe6_vreg_fr_wb_vld;            
reg             rbus_pipe6_vreg_wb_vld;               
reg             rbus_pipe6_vreg_wb_vld_dup0;          
reg             rbus_pipe6_vreg_wb_vld_dup1;          
reg             rbus_pipe6_vreg_wb_vld_dup2;          
reg     [4 :0]  rbus_pipe6_wb_ereg;                   
reg     [4 :0]  rbus_pipe6_wb_ereg_data;              
reg     [63:0]  rbus_pipe6_wb_freg_data;              
reg     [6 :0]  rbus_pipe6_wb_vreg;                   
reg     [6 :0]  rbus_pipe6_wb_vreg_dup0;              
reg     [6 :0]  rbus_pipe6_wb_vreg_dup1;              
reg     [6 :0]  rbus_pipe6_wb_vreg_dup2;              
reg     [6 :0]  rbus_pipe6_wb_vreg_dup3;              
reg     [63:0]  rbus_pipe6_wb_vreg_expand;            
reg             rbus_pipe7_ereg_wb_vld;               
reg             rbus_pipe7_vreg_fr_wb_vld;            
reg             rbus_pipe7_vreg_wb_vld;               
reg             rbus_pipe7_vreg_wb_vld_dup0;          
reg             rbus_pipe7_vreg_wb_vld_dup1;          
reg             rbus_pipe7_vreg_wb_vld_dup2;          
reg     [4 :0]  rbus_pipe7_wb_ereg;                   
reg     [4 :0]  rbus_pipe7_wb_ereg_data;              
reg     [63:0]  rbus_pipe7_wb_freg_data;              
reg     [6 :0]  rbus_pipe7_wb_vreg;                   
reg     [6 :0]  rbus_pipe7_wb_vreg_dup0;              
reg     [6 :0]  rbus_pipe7_wb_vreg_dup1;              
reg     [6 :0]  rbus_pipe7_wb_vreg_dup2;              
reg     [6 :0]  rbus_pipe7_wb_vreg_dup3;              
reg     [63:0]  rbus_pipe7_wb_vreg_expand;            

// &Wires; @25
wire            cp0_vfpu_icg_en;                      
wire            cp0_yy_clk_en;                        
wire            cpurst_b;                             
wire            ctrl_ex1_pipe6_data_vld;              
wire            ctrl_ex1_pipe6_data_vld_dup0;         
wire            ctrl_ex1_pipe6_data_vld_dup1;         
wire            ctrl_ex1_pipe6_data_vld_dup2;         
wire            ctrl_ex1_pipe7_data_vld;              
wire            ctrl_ex1_pipe7_data_vld_dup0;         
wire            ctrl_ex1_pipe7_data_vld_dup1;         
wire            ctrl_ex1_pipe7_data_vld_dup2;         
wire            ctrl_ex2_pipe6_data_vld;              
wire            ctrl_ex2_pipe6_data_vld_dup0;         
wire            ctrl_ex2_pipe6_data_vld_dup1;         
wire            ctrl_ex2_pipe6_data_vld_dup2;         
wire            ctrl_ex2_pipe7_data_vld;              
wire            ctrl_ex2_pipe7_data_vld_dup0;         
wire            ctrl_ex2_pipe7_data_vld_dup1;         
wire            ctrl_ex2_pipe7_data_vld_dup2;         
wire            ctrl_ex3_pipe6_data_vld;              
wire            ctrl_ex3_pipe6_data_vld_dup0;         
wire            ctrl_ex3_pipe6_data_vld_dup1;         
wire            ctrl_ex3_pipe6_data_vld_dup2;         
wire            ctrl_ex3_pipe6_fwd_vld;               
wire            ctrl_ex3_pipe7_data_vld;              
wire            ctrl_ex3_pipe7_data_vld_dup0;         
wire            ctrl_ex3_pipe7_data_vld_dup1;         
wire            ctrl_ex3_pipe7_data_vld_dup2;         
wire            ctrl_ex3_pipe7_fwd_vld;               
wire            ctrl_ex4_pipe6_fwd_vld;               
wire            ctrl_ex4_pipe7_fwd_vld;               
wire            ctrl_ex4_pipe7_inst_vld;              
wire            ctrl_ex5_pipe6_clk;                   
wire            ctrl_ex5_pipe7_clk;                   
wire    [6 :0]  dp_ex3_pipe6_dst_vreg;                
wire    [63:0]  dp_ex3_pipe6_freg_data;               
wire    [6 :0]  dp_ex3_pipe7_dst_vreg;                
wire    [63:0]  dp_ex3_pipe7_freg_data;               
wire    [4 :0]  dp_ex4_pipe6_dst_ereg;                
wire    [6 :0]  dp_ex4_pipe6_dst_vreg;                
wire            dp_ex4_pipe6_normal_dste_wb_vld;      
wire            dp_ex4_pipe6_normal_dstv_wb_vld;      
wire    [4 :0]  dp_ex4_pipe7_dst_ereg;                
wire    [6 :0]  dp_ex4_pipe7_dst_vreg;                
wire            dp_ex4_pipe7_dste_vld;                
wire            dp_ex4_pipe7_dstv_vld;                
wire    [4 :0]  dp_ex5_pipe6_ereg_data_pre;           
wire    [63:0]  dp_ex5_pipe6_freg_data_pre;           
wire    [4 :0]  dp_ex5_pipe7_ereg_data_pre;           
wire    [63:0]  dp_ex5_pipe7_freg_data_pre;           
wire    [6 :0]  dp_rbus_pipe6_ex1_vreg;               
wire    [6 :0]  dp_rbus_pipe6_ex1_vreg_dup0;          
wire    [6 :0]  dp_rbus_pipe6_ex1_vreg_dup1;          
wire    [6 :0]  dp_rbus_pipe6_ex1_vreg_dup2;          
wire    [6 :0]  dp_rbus_pipe6_ex2_vreg;               
wire    [6 :0]  dp_rbus_pipe6_ex2_vreg_dup0;          
wire    [6 :0]  dp_rbus_pipe6_ex2_vreg_dup1;          
wire    [6 :0]  dp_rbus_pipe6_ex2_vreg_dup2;          
wire    [6 :0]  dp_rbus_pipe6_ex3_vreg_dup0;          
wire    [6 :0]  dp_rbus_pipe6_ex3_vreg_dup1;          
wire    [6 :0]  dp_rbus_pipe6_ex3_vreg_dup2;          
wire    [6 :0]  dp_rbus_pipe6_ex3_vreg_dup3;          
wire    [6 :0]  dp_rbus_pipe7_ex1_vreg;               
wire    [6 :0]  dp_rbus_pipe7_ex1_vreg_dup0;          
wire    [6 :0]  dp_rbus_pipe7_ex1_vreg_dup1;          
wire    [6 :0]  dp_rbus_pipe7_ex1_vreg_dup2;          
wire    [6 :0]  dp_rbus_pipe7_ex2_vreg;               
wire    [6 :0]  dp_rbus_pipe7_ex2_vreg_dup0;          
wire    [6 :0]  dp_rbus_pipe7_ex2_vreg_dup1;          
wire    [6 :0]  dp_rbus_pipe7_ex2_vreg_dup2;          
wire    [6 :0]  dp_rbus_pipe7_ex3_vreg_dup0;          
wire    [6 :0]  dp_rbus_pipe7_ex3_vreg_dup1;          
wire    [6 :0]  dp_rbus_pipe7_ex3_vreg_dup2;          
wire    [6 :0]  dp_rbus_pipe7_ex3_vreg_dup3;          
wire            forever_cpuclk;                       
wire            pad_yy_icg_scan_en;                   
wire            pipe6_rbus_ex1_fmla_data_vld;         
wire            pipe6_rbus_ex1_fmla_data_vld_dup0;    
wire            pipe6_rbus_ex1_fmla_data_vld_dup1;    
wire            pipe6_rbus_ex1_fmla_data_vld_dup2;    
wire            pipe6_rbus_ex2_fmla_data_vld;         
wire            pipe6_rbus_ex2_fmla_data_vld_dup0;    
wire            pipe6_rbus_ex2_fmla_data_vld_dup1;    
wire            pipe6_rbus_ex2_fmla_data_vld_dup2;    
wire            pipe6_rbus_pipe6_fmla_no_fwd;         
wire            pipe6_rbus_pipe7_fmla_no_fwd;         
wire    [4 :0]  pipe6_rbus_vfmau_ereg_wb_data;        
wire            pipe6_rbus_vfmau_ereg_wb_vld;         
wire    [63:0]  pipe6_rbus_vfmau_freg_wb_data;        
wire            pipe6_rbus_vfmau_vreg_wb_vld;         
wire            pipe7_rbus_ex1_fmla_data_vld;         
wire            pipe7_rbus_ex1_fmla_data_vld_dup0;    
wire            pipe7_rbus_ex1_fmla_data_vld_dup1;    
wire            pipe7_rbus_ex1_fmla_data_vld_dup2;    
wire            pipe7_rbus_ex2_fmla_data_vld;         
wire            pipe7_rbus_ex2_fmla_data_vld_dup0;    
wire            pipe7_rbus_ex2_fmla_data_vld_dup1;    
wire            pipe7_rbus_ex2_fmla_data_vld_dup2;    
wire            pipe7_rbus_pipe6_fmla_no_fwd;         
wire            pipe7_rbus_pipe7_fmla_no_fwd;         
wire    [4 :0]  pipe7_rbus_vfmau_ereg_wb_data;        
wire            pipe7_rbus_vfmau_ereg_wb_vld;         
wire    [63:0]  pipe7_rbus_vfmau_freg_wb_data;        
wire            pipe7_rbus_vfmau_vreg_wb_vld;         
wire            rbus_ex5_pipe6_ereg_clk;              
wire            rbus_ex5_pipe6_ereg_en;               
wire            rbus_ex5_pipe6_vreg_clk;              
wire            rbus_ex5_pipe6_vreg_en;               
wire            rbus_ex5_pipe7_ereg_clk;              
wire            rbus_ex5_pipe7_ereg_en;               
wire            rbus_ex5_pipe7_vreg_clk;              
wire            rbus_ex5_pipe7_vreg_en;               
wire    [4 :0]  rbus_pipe6_ereg;                      
wire    [4 :0]  rbus_pipe6_ereg_data;                 
wire            rbus_pipe6_ereg_data_vld;             
wire    [63:0]  rbus_pipe6_freg_data;                 
wire    [6 :0]  rbus_pipe6_vreg;                      
wire            rbus_pipe6_vreg_data_vld;             
wire    [63:0]  rbus_pipe6_vreg_expand;               
wire            rbus_pipe6_vreg_vr_wb_vld;            
wire    [4 :0]  rbus_pipe7_ereg;                      
wire    [4 :0]  rbus_pipe7_ereg_data;                 
wire            rbus_pipe7_ereg_data_vld;             
wire    [63:0]  rbus_pipe7_freg_data;                 
wire    [6 :0]  rbus_pipe7_vreg;                      
wire            rbus_pipe7_vreg_data_vld;             
wire    [63:0]  rbus_pipe7_vreg_expand;               
wire            rbus_pipe7_vreg_vr_wb_vld;            
wire            rtu_yy_xx_flush;                      
wire            vdsp_vfpu_pipe6_inside_fwd_aval;      
wire            vdsp_vfpu_pipe7_inside_fwd_aval;      
wire            vfpu_idu_ex1_pipe6_data_vld_dup0;     
wire            vfpu_idu_ex1_pipe6_data_vld_dup1;     
wire            vfpu_idu_ex1_pipe6_data_vld_dup2;     
wire            vfpu_idu_ex1_pipe6_data_vld_dup3;     
wire            vfpu_idu_ex1_pipe6_fmla_data_vld_dup0; 
wire            vfpu_idu_ex1_pipe6_fmla_data_vld_dup1; 
wire            vfpu_idu_ex1_pipe6_fmla_data_vld_dup2; 
wire            vfpu_idu_ex1_pipe6_fmla_data_vld_dup3; 
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup0;         
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup1;         
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup2;         
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup3;         
wire            vfpu_idu_ex1_pipe7_data_vld_dup0;     
wire            vfpu_idu_ex1_pipe7_data_vld_dup1;     
wire            vfpu_idu_ex1_pipe7_data_vld_dup2;     
wire            vfpu_idu_ex1_pipe7_data_vld_dup3;     
wire            vfpu_idu_ex1_pipe7_fmla_data_vld_dup0; 
wire            vfpu_idu_ex1_pipe7_fmla_data_vld_dup1; 
wire            vfpu_idu_ex1_pipe7_fmla_data_vld_dup2; 
wire            vfpu_idu_ex1_pipe7_fmla_data_vld_dup3; 
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup0;         
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup1;         
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup2;         
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup3;         
wire            vfpu_idu_ex2_pipe6_data_vld_dup0;     
wire            vfpu_idu_ex2_pipe6_data_vld_dup1;     
wire            vfpu_idu_ex2_pipe6_data_vld_dup2;     
wire            vfpu_idu_ex2_pipe6_data_vld_dup3;     
wire            vfpu_idu_ex2_pipe6_fmla_data_vld_dup0; 
wire            vfpu_idu_ex2_pipe6_fmla_data_vld_dup1; 
wire            vfpu_idu_ex2_pipe6_fmla_data_vld_dup2; 
wire            vfpu_idu_ex2_pipe6_fmla_data_vld_dup3; 
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup0;         
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup1;         
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup2;         
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup3;         
wire            vfpu_idu_ex2_pipe7_data_vld_dup0;     
wire            vfpu_idu_ex2_pipe7_data_vld_dup1;     
wire            vfpu_idu_ex2_pipe7_data_vld_dup2;     
wire            vfpu_idu_ex2_pipe7_data_vld_dup3;     
wire            vfpu_idu_ex2_pipe7_fmla_data_vld_dup0; 
wire            vfpu_idu_ex2_pipe7_fmla_data_vld_dup1; 
wire            vfpu_idu_ex2_pipe7_fmla_data_vld_dup2; 
wire            vfpu_idu_ex2_pipe7_fmla_data_vld_dup3; 
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup0;         
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup1;         
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup2;         
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup3;         
wire            vfpu_idu_ex3_pipe6_data_vld_dup0;     
wire            vfpu_idu_ex3_pipe6_data_vld_dup1;     
wire            vfpu_idu_ex3_pipe6_data_vld_dup2;     
wire            vfpu_idu_ex3_pipe6_data_vld_dup3;     
wire    [6 :0]  vfpu_idu_ex3_pipe6_fwd_vreg;          
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data;  
wire            vfpu_idu_ex3_pipe6_fwd_vreg_vld;      
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data; 
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data; 
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup0;         
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup1;         
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup2;         
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup3;         
wire            vfpu_idu_ex3_pipe7_data_vld_dup0;     
wire            vfpu_idu_ex3_pipe7_data_vld_dup1;     
wire            vfpu_idu_ex3_pipe7_data_vld_dup2;     
wire            vfpu_idu_ex3_pipe7_data_vld_dup3;     
wire    [6 :0]  vfpu_idu_ex3_pipe7_fwd_vreg;          
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data;  
wire            vfpu_idu_ex3_pipe7_fwd_vreg_vld;      
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data; 
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data; 
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup0;         
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup1;         
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup2;         
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup3;         
wire    [6 :0]  vfpu_idu_ex4_pipe6_fwd_vreg;          
wire    [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data;  
wire            vfpu_idu_ex4_pipe6_fwd_vreg_vld;      
wire    [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data; 
wire    [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data; 
wire    [6 :0]  vfpu_idu_ex4_pipe7_fwd_vreg;          
wire    [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data;  
wire            vfpu_idu_ex4_pipe7_fwd_vreg_vld;      
wire    [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data; 
wire    [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data; 
wire    [63:0]  vfpu_idu_ex5_pipe6_freg_wb_data;      
wire    [6 :0]  vfpu_idu_ex5_pipe6_fwd_vreg;          
wire            vfpu_idu_ex5_pipe6_fwd_vreg_vld;      
wire    [4 :0]  vfpu_idu_ex5_pipe6_wb_ereg;           
wire    [5 :0]  vfpu_idu_ex5_pipe6_wb_ereg_data;      
wire            vfpu_idu_ex5_pipe6_wb_ereg_vld;       
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup0;      
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup1;      
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup2;      
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup3;      
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_data;   
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_expand; 
wire            vfpu_idu_ex5_pipe6_wb_vreg_fr_vld;    
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0;  
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1;  
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2;  
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3;  
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data;  
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand; 
wire            vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld;   
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data;  
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand; 
wire            vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld;   
wire    [63:0]  vfpu_idu_ex5_pipe7_freg_wb_data;      
wire    [6 :0]  vfpu_idu_ex5_pipe7_fwd_vreg;          
wire            vfpu_idu_ex5_pipe7_fwd_vreg_vld;      
wire    [4 :0]  vfpu_idu_ex5_pipe7_wb_ereg;           
wire    [5 :0]  vfpu_idu_ex5_pipe7_wb_ereg_data;      
wire            vfpu_idu_ex5_pipe7_wb_ereg_vld;       
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup0;      
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup1;      
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup2;      
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup3;      
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_data;   
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_expand; 
wire            vfpu_idu_ex5_pipe7_wb_vreg_fr_vld;    
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0;  
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1;  
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2;  
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3;  
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data;  
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand; 
wire            vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld;   
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data;  
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand; 
wire            vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld;   
wire            vfpu_idu_pipe6_vmla_srcv2_no_fwd;     
wire            vfpu_idu_pipe7_vmla_srcv2_no_fwd;     
wire            vfpu_rtu_ex5_pipe6_ereg_wb_vld;       
wire    [4 :0]  vfpu_rtu_ex5_pipe6_wb_ereg;           
wire    [63:0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand;    
wire            vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld;    
wire            vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld;    
wire            vfpu_rtu_ex5_pipe7_ereg_wb_vld;       
wire    [4 :0]  vfpu_rtu_ex5_pipe7_wb_ereg;           
wire    [63:0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand;    
wire            vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld;    
wire            vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld;    


parameter FPR_MSB = 63;
parameter SILEN   = 64;
parameter VREG    = 7;
//==========================================================
//               Pipe6 FPR result Data Path
//==========================================================
//----------------------------------------------------------
//                      Dest Ready 
//----------------------------------------------------------
//ex1 freg ready:
assign vfpu_idu_ex1_pipe6_data_vld_dup0       = ctrl_ex1_pipe6_data_vld     ;
assign vfpu_idu_ex1_pipe6_data_vld_dup1       = ctrl_ex1_pipe6_data_vld_dup0;
assign vfpu_idu_ex1_pipe6_data_vld_dup2       = ctrl_ex1_pipe6_data_vld_dup1;
assign vfpu_idu_ex1_pipe6_data_vld_dup3       = ctrl_ex1_pipe6_data_vld_dup2;
assign vfpu_idu_ex1_pipe6_vreg_dup0[VREG-1:0] = dp_rbus_pipe6_ex1_vreg[VREG-1:0];
assign vfpu_idu_ex1_pipe6_vreg_dup1[VREG-1:0] = dp_rbus_pipe6_ex1_vreg_dup0[VREG-1:0];
assign vfpu_idu_ex1_pipe6_vreg_dup2[VREG-1:0] = dp_rbus_pipe6_ex1_vreg_dup1[VREG-1:0];
assign vfpu_idu_ex1_pipe6_vreg_dup3[VREG-1:0] = dp_rbus_pipe6_ex1_vreg_dup2[VREG-1:0];

//ex2 freg ready
assign vfpu_idu_ex2_pipe6_data_vld_dup0       = ctrl_ex2_pipe6_data_vld     ;
assign vfpu_idu_ex2_pipe6_data_vld_dup1       = ctrl_ex2_pipe6_data_vld_dup0;
assign vfpu_idu_ex2_pipe6_data_vld_dup2       = ctrl_ex2_pipe6_data_vld_dup1;
assign vfpu_idu_ex2_pipe6_data_vld_dup3       = ctrl_ex2_pipe6_data_vld_dup2;
assign vfpu_idu_ex2_pipe6_vreg_dup0[VREG-1:0] = dp_rbus_pipe6_ex2_vreg[VREG-1:0];
assign vfpu_idu_ex2_pipe6_vreg_dup1[VREG-1:0] = dp_rbus_pipe6_ex2_vreg_dup0[VREG-1:0];
assign vfpu_idu_ex2_pipe6_vreg_dup2[VREG-1:0] = dp_rbus_pipe6_ex2_vreg_dup1[VREG-1:0];
assign vfpu_idu_ex2_pipe6_vreg_dup3[VREG-1:0] = dp_rbus_pipe6_ex2_vreg_dup2[VREG-1:0];

//ex3 freg ready
assign vfpu_idu_ex3_pipe6_data_vld_dup0       = ctrl_ex3_pipe6_data_vld     ;
assign vfpu_idu_ex3_pipe6_data_vld_dup1       = ctrl_ex3_pipe6_data_vld_dup0;
assign vfpu_idu_ex3_pipe6_data_vld_dup2       = ctrl_ex3_pipe6_data_vld_dup1;
assign vfpu_idu_ex3_pipe6_data_vld_dup3       = ctrl_ex3_pipe6_data_vld_dup2;
assign vfpu_idu_ex3_pipe6_vreg_dup0[VREG-1:0] = dp_rbus_pipe6_ex3_vreg_dup0[VREG-1:0];
assign vfpu_idu_ex3_pipe6_vreg_dup1[VREG-1:0] = dp_rbus_pipe6_ex3_vreg_dup1[VREG-1:0];
assign vfpu_idu_ex3_pipe6_vreg_dup2[VREG-1:0] = dp_rbus_pipe6_ex3_vreg_dup2[VREG-1:0];
assign vfpu_idu_ex3_pipe6_vreg_dup3[VREG-1:0] = dp_rbus_pipe6_ex3_vreg_dup3[VREG-1:0];

//----------------------------------------------------------
//                      Forward Signals 
//----------------------------------------------------------
//ex1 forward:
assign vfpu_idu_ex1_pipe6_fmla_data_vld_dup0 = pipe6_rbus_ex1_fmla_data_vld; 
assign vfpu_idu_ex1_pipe6_fmla_data_vld_dup1 = pipe6_rbus_ex1_fmla_data_vld_dup0; 
assign vfpu_idu_ex1_pipe6_fmla_data_vld_dup2 = pipe6_rbus_ex1_fmla_data_vld_dup1; 
assign vfpu_idu_ex1_pipe6_fmla_data_vld_dup3 = pipe6_rbus_ex1_fmla_data_vld_dup2; 

//ex2 forward:
assign vfpu_idu_ex2_pipe6_fmla_data_vld_dup0 = pipe6_rbus_ex2_fmla_data_vld;
assign vfpu_idu_ex2_pipe6_fmla_data_vld_dup1 = pipe6_rbus_ex2_fmla_data_vld_dup0;
assign vfpu_idu_ex2_pipe6_fmla_data_vld_dup2 = pipe6_rbus_ex2_fmla_data_vld_dup1;
assign vfpu_idu_ex2_pipe6_fmla_data_vld_dup3 = pipe6_rbus_ex2_fmla_data_vld_dup2;

//ex3 forward:
assign vfpu_idu_ex3_pipe6_fwd_vreg_vld                = ctrl_ex3_pipe6_fwd_vld;
assign vfpu_idu_ex3_pipe6_fwd_vreg_fr_data[FPR_MSB:0] = dp_ex3_pipe6_freg_data[FPR_MSB:0];
assign vfpu_idu_ex3_pipe6_fwd_vreg[VREG-1:0]          = dp_ex3_pipe6_dst_vreg[VREG-1:0];


//ex4 forward:
assign vfpu_idu_ex4_pipe6_fwd_vreg_vld                = ctrl_ex4_pipe6_fwd_vld;
assign vfpu_idu_ex4_pipe6_fwd_vreg_fr_data[FPR_MSB:0] = dp_ex5_pipe6_freg_data_pre[FPR_MSB:0];
assign vfpu_idu_ex4_pipe6_fwd_vreg[VREG-1:0]          = dp_ex4_pipe6_dst_vreg[VREG-1:0];

//----------------------------------------------------------
//                     No Forward Signals 
//----------------------------------------------------------
assign vfpu_idu_pipe6_vmla_srcv2_no_fwd = pipe6_rbus_pipe6_fmla_no_fwd
                                       && pipe7_rbus_pipe6_fmla_no_fwd
                                       && !vdsp_vfpu_pipe6_inside_fwd_aval;
//----------------------------------------------------------
//              Result Valid Control Signal
//----------------------------------------------------------
assign rbus_pipe6_vreg_data_vld = dp_ex4_pipe6_normal_dstv_wb_vld;

//----------------------------------------------------------
//                   Write Back Valid
//----------------------------------------------------------
always @(posedge ctrl_ex5_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rbus_pipe6_vreg_wb_vld <= 1'b0;
    rbus_pipe6_vreg_wb_vld_dup0 <= 1'b0;
    rbus_pipe6_vreg_wb_vld_dup1 <= 1'b0;
    rbus_pipe6_vreg_wb_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    rbus_pipe6_vreg_wb_vld <= 1'b0;
    rbus_pipe6_vreg_wb_vld_dup0 <= 1'b0;
    rbus_pipe6_vreg_wb_vld_dup1 <= 1'b0;
    rbus_pipe6_vreg_wb_vld_dup2 <= 1'b0;
  end
  else begin
    rbus_pipe6_vreg_wb_vld <= rbus_pipe6_vreg_data_vld;
    rbus_pipe6_vreg_wb_vld_dup0 <= rbus_pipe6_vreg_data_vld;
    rbus_pipe6_vreg_wb_vld_dup1 <= rbus_pipe6_vreg_data_vld;
    rbus_pipe6_vreg_wb_vld_dup2 <= rbus_pipe6_vreg_data_vld;
  end
end

always @(posedge ctrl_ex5_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rbus_pipe6_vreg_fr_wb_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    rbus_pipe6_vreg_fr_wb_vld <= 1'b0;
  else
    rbus_pipe6_vreg_fr_wb_vld <= rbus_pipe6_vreg_data_vld && !rbus_pipe6_vreg[VREG-1];
end
assign rbus_pipe6_vreg_vr_wb_vld = 1'b0;

//output to IDU
assign vfpu_idu_ex5_pipe6_fwd_vreg_vld    = rbus_pipe6_vreg_wb_vld;

assign vfpu_idu_ex5_pipe6_wb_vreg_fr_vld  = rbus_pipe6_vreg_fr_wb_vld;
assign vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld = rbus_pipe6_vreg_vr_wb_vld;
assign vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld = rbus_pipe6_vreg_vr_wb_vld;

assign vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0     = rbus_pipe6_vreg_wb_vld;
assign vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1     = rbus_pipe6_vreg_wb_vld_dup0;
assign vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2     = rbus_pipe6_vreg_wb_vld_dup1;
assign vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3     = rbus_pipe6_vreg_wb_vld_dup2;
//output to RTU
assign vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld  = rbus_pipe6_vreg_fr_wb_vld;
assign vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld  = rbus_pipe6_vreg_vr_wb_vld;

//----------------------------------------------------------
//                Write Back Vreg Data Selection
//----------------------------------------------------------
assign rbus_pipe6_vreg[VREG-1:0]       = dp_ex4_pipe6_dst_vreg[VREG-1:0];
assign rbus_pipe6_freg_data[FPR_MSB:0] = dp_ex5_pipe6_freg_data_pre[FPR_MSB:0]; 

// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_rbus_pipe6_vreg"); @176
ct_rtu_expand_64  x_ct_rtu_expand_64_rbus_pipe6_vreg (
  .x_num                        (rbus_pipe6_vreg[5:0]        ),
  .x_num_expand                 (rbus_pipe6_vreg_expand[63:0])
);

// &Connect( .x_num        (rbus_pipe6_vreg[5:0]), @177
//           .x_num_expand (rbus_pipe6_vreg_expand[63:0]));  @178

//----------------------------------------------------------
//                   Write Back Vreg Data
//----------------------------------------------------------
assign rbus_ex5_pipe6_vreg_en =  rbus_pipe6_vreg_data_vld;
//  &Instance("gated_clk_cell", "x_rbus_ex5_pipe6_vreg_gated_clk"); @184
gated_clk_cell  x_rbus_ex5_pipe6_vreg_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (rbus_ex5_pipe6_vreg_clk),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (rbus_ex5_pipe6_vreg_en ),
  .module_en               (cp0_vfpu_icg_en        ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

//  &Connect(.clk_in      (forever_cpuclk         ), @185
//           .external_en (1'b0                   ), @186
//           .global_en   (cp0_yy_clk_en          ), @187
//           .module_en   (cp0_vfpu_icg_en        ), @188
//           .local_en    (rbus_ex5_pipe6_vreg_en ), @189
//           .clk_out     (rbus_ex5_pipe6_vreg_clk)); @190

always @(posedge rbus_ex5_pipe6_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rbus_pipe6_wb_vreg[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe6_wb_vreg_dup0[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe6_wb_vreg_dup1[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe6_wb_vreg_dup2[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe6_wb_vreg_dup3[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe6_wb_vreg_expand[63:0] <= 64'b0;
  end
  else if(rbus_pipe6_vreg_data_vld) begin
    rbus_pipe6_wb_vreg[VREG-1:0]    <= rbus_pipe6_vreg[VREG-1:0];
    rbus_pipe6_wb_vreg_dup0[VREG-1:0]    <= rbus_pipe6_vreg[VREG-1:0];
    rbus_pipe6_wb_vreg_dup1[VREG-1:0]    <= rbus_pipe6_vreg[VREG-1:0];
    rbus_pipe6_wb_vreg_dup2[VREG-1:0]    <= rbus_pipe6_vreg[VREG-1:0];
    rbus_pipe6_wb_vreg_dup3[VREG-1:0]    <= rbus_pipe6_vreg[VREG-1:0];
    rbus_pipe6_wb_vreg_expand[63:0] <= rbus_pipe6_vreg_expand[63:0];
  end
  else begin
    rbus_pipe6_wb_vreg[VREG-1:0]    <= rbus_pipe6_wb_vreg[VREG-1:0];               
    rbus_pipe6_wb_vreg_dup0[VREG-1:0]    <= rbus_pipe6_wb_vreg_dup0[VREG-1:0];               
    rbus_pipe6_wb_vreg_dup1[VREG-1:0]    <= rbus_pipe6_wb_vreg_dup1[VREG-1:0];               
    rbus_pipe6_wb_vreg_dup2[VREG-1:0]    <= rbus_pipe6_wb_vreg_dup2[VREG-1:0];               
    rbus_pipe6_wb_vreg_dup3[VREG-1:0]    <= rbus_pipe6_wb_vreg_dup3[VREG-1:0];               
    rbus_pipe6_wb_vreg_expand[63:0] <= rbus_pipe6_wb_vreg_expand[63:0];       
  end
end

always @(posedge rbus_ex5_pipe6_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) 
    rbus_pipe6_wb_freg_data[FPR_MSB:0] <= {FPR_MSB+1{1'b0}};
  else if(rbus_pipe6_vreg_data_vld && !rbus_pipe6_vreg[VREG-1]) 
    rbus_pipe6_wb_freg_data[FPR_MSB:0] <= rbus_pipe6_freg_data[FPR_MSB:0] ;
  else 
    rbus_pipe6_wb_freg_data[FPR_MSB:0] <= rbus_pipe6_wb_freg_data[FPR_MSB:0];
end

//output to idu
assign vfpu_idu_ex5_pipe6_wb_vreg_dup0[VREG-1:0]       = rbus_pipe6_wb_vreg_dup0[VREG-1:0];
assign vfpu_idu_ex5_pipe6_wb_vreg_dup1[VREG-1:0]       = rbus_pipe6_wb_vreg_dup1[VREG-1:0];
assign vfpu_idu_ex5_pipe6_wb_vreg_dup2[VREG-1:0]       = rbus_pipe6_wb_vreg_dup2[VREG-1:0];
assign vfpu_idu_ex5_pipe6_wb_vreg_dup3[VREG-1:0]       = rbus_pipe6_wb_vreg_dup3[VREG-1:0];
assign vfpu_idu_ex5_pipe6_fwd_vreg[VREG-1:0]      = rbus_pipe6_wb_vreg[VREG-1:0];
assign vfpu_idu_ex5_pipe6_wb_vreg_fr_expand[63:0] = rbus_pipe6_wb_vreg_expand[63:0];

assign vfpu_idu_ex5_pipe6_freg_wb_data[FPR_MSB:0] = (pipe6_rbus_vfmau_vreg_wb_vld)
                                                  ? pipe6_rbus_vfmau_freg_wb_data[FPR_MSB:0]
                                                  : rbus_pipe6_wb_freg_data[FPR_MSB:0];

assign vfpu_idu_ex5_pipe6_wb_vreg_fr_data[FPR_MSB:0] = vfpu_idu_ex5_pipe6_freg_wb_data[FPR_MSB:0];

assign vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand[63:0]   = rbus_pipe6_wb_vreg_expand[63:0];
assign vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand[63:0]   = rbus_pipe6_wb_vreg_expand[63:0];


// //&Force("output","vfpu_idu_ex5_pipe6_freg_wb_data");   @248
//output to rtu
assign vfpu_rtu_ex5_pipe6_wb_vreg_expand[63:0] = rbus_pipe6_wb_vreg_expand[63:0];



//==========================================================
//               Pipe6 ereg result Data Path
//==========================================================
//----------------------------------------------------------
//              Result Valid Control Signal
//----------------------------------------------------------
assign rbus_pipe6_ereg_data_vld = dp_ex4_pipe6_normal_dste_wb_vld;

//----------------------------------------------------------
//                   Write Back Valid
//----------------------------------------------------------
always @(posedge ctrl_ex5_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rbus_pipe6_ereg_wb_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    rbus_pipe6_ereg_wb_vld <= 1'b0;
  else
    rbus_pipe6_ereg_wb_vld <= rbus_pipe6_ereg_data_vld;
end
//output to IDU
assign vfpu_idu_ex5_pipe6_wb_ereg_vld = rbus_pipe6_ereg_wb_vld;
//output to RTU
assign vfpu_rtu_ex5_pipe6_ereg_wb_vld = rbus_pipe6_ereg_wb_vld;

//----------------------------------------------------------
//                Write Back Vreg Data Selection
//----------------------------------------------------------
assign rbus_pipe6_ereg[4:0]      = dp_ex4_pipe6_dst_ereg[4:0];
assign rbus_pipe6_ereg_data[4:0] = dp_ex5_pipe6_ereg_data_pre[4:0];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rbus_ex5_pipe6_ereg_en =  rbus_pipe6_ereg_data_vld;
//  &Instance("gated_clk_cell", "x_rbus_ex5_pipe6_ereg_gated_clk"); @299
gated_clk_cell  x_rbus_ex5_pipe6_ereg_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (rbus_ex5_pipe6_ereg_clk),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (rbus_ex5_pipe6_ereg_en ),
  .module_en               (cp0_vfpu_icg_en        ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

//  &Connect(.clk_in      (forever_cpuclk          ), @300
//           .external_en (1'b0                    ), @301
//           .global_en   (cp0_yy_clk_en           ), @302
//           .module_en   (cp0_vfpu_icg_en         ), @303
//           .local_en    (rbus_ex5_pipe6_ereg_en  ), @304
//           .clk_out     (rbus_ex5_pipe6_ereg_clk )); @305

//----------------------------------------------------------
//                   Write Back Vreg Data
//----------------------------------------------------------
always @(posedge rbus_ex5_pipe6_ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rbus_pipe6_wb_ereg[4:0]      <= 5'b0;
    rbus_pipe6_wb_ereg_data[4:0] <= 5'b0;
  end
  else if(rbus_pipe6_ereg_data_vld) begin
    rbus_pipe6_wb_ereg[4:0]      <= rbus_pipe6_ereg[4:0];
    rbus_pipe6_wb_ereg_data[4:0] <= rbus_pipe6_ereg_data[4:0];
  end
  else begin
    rbus_pipe6_wb_ereg[4:0]      <= rbus_pipe6_wb_ereg[4:0];               
    rbus_pipe6_wb_ereg_data[4:0] <= rbus_pipe6_wb_ereg_data[4:0];
  end
end

//output to idu
assign vfpu_idu_ex5_pipe6_wb_ereg[4:0]      = rbus_pipe6_wb_ereg[4:0];

assign vfpu_idu_ex5_pipe6_wb_ereg_data[4:0] = (pipe6_rbus_vfmau_ereg_wb_vld) 
                                            ? pipe6_rbus_vfmau_ereg_wb_data[4:0]
                                            : rbus_pipe6_wb_ereg_data[4:0];

// &Force("output","vfpu_idu_ex5_pipe6_wb_ereg_data");   @333
// &Force("output","vfpu_idu_ex5_pipe6_wb_ereg");   @334

//output to rtu
assign vfpu_rtu_ex5_pipe6_wb_ereg[4:0] = vfpu_idu_ex5_pipe6_wb_ereg[4:0];


//==========================================================
//               Pipe7 VGPR result Data Path
//==========================================================
//----------------------------------------------------------
//                      Dest Ready 
//----------------------------------------------------------
//ex1 freg ready:
assign vfpu_idu_ex1_pipe7_data_vld_dup0       = ctrl_ex1_pipe7_data_vld;
assign vfpu_idu_ex1_pipe7_data_vld_dup1       = ctrl_ex1_pipe7_data_vld_dup0;
assign vfpu_idu_ex1_pipe7_data_vld_dup2       = ctrl_ex1_pipe7_data_vld_dup1;
assign vfpu_idu_ex1_pipe7_data_vld_dup3       = ctrl_ex1_pipe7_data_vld_dup2;
assign vfpu_idu_ex1_pipe7_vreg_dup0[VREG-1:0] = dp_rbus_pipe7_ex1_vreg[VREG-1:0];
assign vfpu_idu_ex1_pipe7_vreg_dup1[VREG-1:0] = dp_rbus_pipe7_ex1_vreg_dup0[VREG-1:0];
assign vfpu_idu_ex1_pipe7_vreg_dup2[VREG-1:0] = dp_rbus_pipe7_ex1_vreg_dup1[VREG-1:0];
assign vfpu_idu_ex1_pipe7_vreg_dup3[VREG-1:0] = dp_rbus_pipe7_ex1_vreg_dup2[VREG-1:0];

//ex2 freg ready
assign vfpu_idu_ex2_pipe7_data_vld_dup0       = ctrl_ex2_pipe7_data_vld;
assign vfpu_idu_ex2_pipe7_data_vld_dup1       = ctrl_ex2_pipe7_data_vld_dup0;
assign vfpu_idu_ex2_pipe7_data_vld_dup2       = ctrl_ex2_pipe7_data_vld_dup1;
assign vfpu_idu_ex2_pipe7_data_vld_dup3       = ctrl_ex2_pipe7_data_vld_dup2;
assign vfpu_idu_ex2_pipe7_vreg_dup0[VREG-1:0] = dp_rbus_pipe7_ex2_vreg[VREG-1:0];
assign vfpu_idu_ex2_pipe7_vreg_dup1[VREG-1:0] = dp_rbus_pipe7_ex2_vreg_dup0[VREG-1:0];
assign vfpu_idu_ex2_pipe7_vreg_dup2[VREG-1:0] = dp_rbus_pipe7_ex2_vreg_dup1[VREG-1:0];
assign vfpu_idu_ex2_pipe7_vreg_dup3[VREG-1:0] = dp_rbus_pipe7_ex2_vreg_dup2[VREG-1:0];

//ex3 freg ready
assign vfpu_idu_ex3_pipe7_data_vld_dup0       = ctrl_ex3_pipe7_data_vld;
assign vfpu_idu_ex3_pipe7_data_vld_dup1       = ctrl_ex3_pipe7_data_vld_dup0;
assign vfpu_idu_ex3_pipe7_data_vld_dup2       = ctrl_ex3_pipe7_data_vld_dup1;
assign vfpu_idu_ex3_pipe7_data_vld_dup3       = ctrl_ex3_pipe7_data_vld_dup2;
assign vfpu_idu_ex3_pipe7_vreg_dup0[VREG-1:0] = dp_rbus_pipe7_ex3_vreg_dup0[VREG-1:0];
assign vfpu_idu_ex3_pipe7_vreg_dup1[VREG-1:0] = dp_rbus_pipe7_ex3_vreg_dup1[VREG-1:0];
assign vfpu_idu_ex3_pipe7_vreg_dup2[VREG-1:0] = dp_rbus_pipe7_ex3_vreg_dup2[VREG-1:0];
assign vfpu_idu_ex3_pipe7_vreg_dup3[VREG-1:0] = dp_rbus_pipe7_ex3_vreg_dup3[VREG-1:0];

//----------------------------------------------------------
//                      Forward Signals 
//----------------------------------------------------------
assign vfpu_idu_ex1_pipe7_fmla_data_vld_dup0 = pipe7_rbus_ex1_fmla_data_vld;
assign vfpu_idu_ex1_pipe7_fmla_data_vld_dup1 = pipe7_rbus_ex1_fmla_data_vld_dup0;
assign vfpu_idu_ex1_pipe7_fmla_data_vld_dup2 = pipe7_rbus_ex1_fmla_data_vld_dup1;
assign vfpu_idu_ex1_pipe7_fmla_data_vld_dup3 = pipe7_rbus_ex1_fmla_data_vld_dup2;
//ex2 forward:
assign vfpu_idu_ex2_pipe7_fmla_data_vld_dup0 = pipe7_rbus_ex2_fmla_data_vld;
assign vfpu_idu_ex2_pipe7_fmla_data_vld_dup1 = pipe7_rbus_ex2_fmla_data_vld_dup0;
assign vfpu_idu_ex2_pipe7_fmla_data_vld_dup2 = pipe7_rbus_ex2_fmla_data_vld_dup1;
assign vfpu_idu_ex2_pipe7_fmla_data_vld_dup3 = pipe7_rbus_ex2_fmla_data_vld_dup2;

//ex3 forward:
assign vfpu_idu_ex3_pipe7_fwd_vreg_vld                = ctrl_ex3_pipe7_fwd_vld;
assign vfpu_idu_ex3_pipe7_fwd_vreg[VREG-1:0]          = dp_ex3_pipe7_dst_vreg[VREG-1:0];
assign vfpu_idu_ex3_pipe7_fwd_vreg_fr_data[FPR_MSB:0] = dp_ex3_pipe7_freg_data[FPR_MSB:0];

//ex4 forward:
assign vfpu_idu_ex4_pipe7_fwd_vreg_vld                = ctrl_ex4_pipe7_fwd_vld;
assign vfpu_idu_ex4_pipe7_fwd_vreg[VREG-1:0]          = dp_ex4_pipe7_dst_vreg[VREG-1:0];
assign vfpu_idu_ex4_pipe7_fwd_vreg_fr_data[FPR_MSB:0] = dp_ex5_pipe7_freg_data_pre[FPR_MSB:0];

//----------------------------------------------------------
//                     No Forward Signals 
//----------------------------------------------------------
assign vfpu_idu_pipe7_vmla_srcv2_no_fwd = pipe6_rbus_pipe7_fmla_no_fwd
                                       && pipe7_rbus_pipe7_fmla_no_fwd
                                       && !vdsp_vfpu_pipe7_inside_fwd_aval;

//----------------------------------------------------------
//              Result Valid Control Signal
//----------------------------------------------------------
assign rbus_pipe7_vreg_data_vld = ctrl_ex4_pipe7_inst_vld
                               && dp_ex4_pipe7_dstv_vld;


//----------------------------------------------------------
//                   Write Back Valid
//----------------------------------------------------------
always @(posedge ctrl_ex5_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rbus_pipe7_vreg_wb_vld <= 1'b0;
    rbus_pipe7_vreg_wb_vld_dup0 <= 1'b0;
    rbus_pipe7_vreg_wb_vld_dup1 <= 1'b0;
    rbus_pipe7_vreg_wb_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    rbus_pipe7_vreg_wb_vld <= 1'b0;
    rbus_pipe7_vreg_wb_vld_dup0 <= 1'b0;
    rbus_pipe7_vreg_wb_vld_dup1 <= 1'b0;
    rbus_pipe7_vreg_wb_vld_dup2 <= 1'b0;
  end
  else begin
    rbus_pipe7_vreg_wb_vld <= rbus_pipe7_vreg_data_vld;
    rbus_pipe7_vreg_wb_vld_dup0 <= rbus_pipe7_vreg_data_vld;
    rbus_pipe7_vreg_wb_vld_dup1 <= rbus_pipe7_vreg_data_vld;
    rbus_pipe7_vreg_wb_vld_dup2 <= rbus_pipe7_vreg_data_vld;
  end
end
always @(posedge ctrl_ex5_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rbus_pipe7_vreg_fr_wb_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    rbus_pipe7_vreg_fr_wb_vld <= 1'b0;
  else
    rbus_pipe7_vreg_fr_wb_vld <= rbus_pipe7_vreg_data_vld && !rbus_pipe7_vreg[VREG-1];
end
assign rbus_pipe7_vreg_vr_wb_vld = 1'b0;

//output to IDU
assign vfpu_idu_ex5_pipe7_fwd_vreg_vld    = rbus_pipe7_vreg_wb_vld;

assign vfpu_idu_ex5_pipe7_wb_vreg_fr_vld  = rbus_pipe7_vreg_fr_wb_vld;
assign vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld = rbus_pipe7_vreg_vr_wb_vld;
assign vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld = rbus_pipe7_vreg_vr_wb_vld;

assign vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0    = rbus_pipe7_vreg_wb_vld;
assign vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1    = rbus_pipe7_vreg_wb_vld_dup0;
assign vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2    = rbus_pipe7_vreg_wb_vld_dup1;
assign vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3    = rbus_pipe7_vreg_wb_vld_dup2;
//output to RTU
assign vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld = rbus_pipe7_vreg_fr_wb_vld;
assign vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld = rbus_pipe7_vreg_vr_wb_vld;



//----------------------------------------------------------
//                Write Back Vreg Data Selection
//----------------------------------------------------------
assign rbus_pipe7_vreg[VREG-1:0]       = dp_ex4_pipe7_dst_vreg[VREG-1:0];
assign rbus_pipe7_freg_data[FPR_MSB:0] = dp_ex5_pipe7_freg_data_pre[FPR_MSB:0];

// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_rbus_pipe7_vreg"); @492
ct_rtu_expand_64  x_ct_rtu_expand_64_rbus_pipe7_vreg (
  .x_num                        (rbus_pipe7_vreg[5:0]        ),
  .x_num_expand                 (rbus_pipe7_vreg_expand[63:0])
);

// &Connect( .x_num        (rbus_pipe7_vreg[5:0]), @493
//           .x_num_expand (rbus_pipe7_vreg_expand[63:0])); @494

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rbus_ex5_pipe7_vreg_en =  rbus_pipe7_vreg_data_vld;
//  &Instance("gated_clk_cell", "x_rbus_ex5_pipe7_vreg_gated_clk"); @500
gated_clk_cell  x_rbus_ex5_pipe7_vreg_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (rbus_ex5_pipe7_vreg_clk),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (rbus_ex5_pipe7_vreg_en ),
  .module_en               (cp0_vfpu_icg_en        ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

//  &Connect(.clk_in      (forever_cpuclk), @501
//           .external_en (1'b0), @502
//           .global_en   (cp0_yy_clk_en), @503
//           .module_en   (cp0_vfpu_icg_en), @504
//           .local_en    (rbus_ex5_pipe7_vreg_en), @505
//           .clk_out     (rbus_ex5_pipe7_vreg_clk)); @506

//----------------------------------------------------------
//                   Write Back Vreg Data
//----------------------------------------------------------
always @(posedge rbus_ex5_pipe7_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rbus_pipe7_wb_vreg[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe7_wb_vreg_dup0[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe7_wb_vreg_dup1[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe7_wb_vreg_dup2[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe7_wb_vreg_dup3[VREG-1:0]    <= {VREG{1'b0}};
    rbus_pipe7_wb_vreg_expand[63:0] <= 64'b0;
  end
  else if(rbus_pipe7_vreg_data_vld) begin
    rbus_pipe7_wb_vreg[VREG-1:0]    <= rbus_pipe7_vreg[VREG-1:0];
    rbus_pipe7_wb_vreg_dup0[VREG-1:0]    <= rbus_pipe7_vreg[VREG-1:0];
    rbus_pipe7_wb_vreg_dup1[VREG-1:0]    <= rbus_pipe7_vreg[VREG-1:0];
    rbus_pipe7_wb_vreg_dup2[VREG-1:0]    <= rbus_pipe7_vreg[VREG-1:0];
    rbus_pipe7_wb_vreg_dup3[VREG-1:0]    <= rbus_pipe7_vreg[VREG-1:0];
    rbus_pipe7_wb_vreg_expand[63:0] <= rbus_pipe7_vreg_expand[63:0];
  end
  else begin
    rbus_pipe7_wb_vreg[VREG-1:0]    <= rbus_pipe7_wb_vreg[VREG-1:0];               
    rbus_pipe7_wb_vreg_dup0[VREG-1:0]    <= rbus_pipe7_wb_vreg_dup0[VREG-1:0];               
    rbus_pipe7_wb_vreg_dup1[VREG-1:0]    <= rbus_pipe7_wb_vreg_dup1[VREG-1:0];               
    rbus_pipe7_wb_vreg_dup2[VREG-1:0]    <= rbus_pipe7_wb_vreg_dup2[VREG-1:0];               
    rbus_pipe7_wb_vreg_dup3[VREG-1:0]    <= rbus_pipe7_wb_vreg_dup3[VREG-1:0];               
    rbus_pipe7_wb_vreg_expand[63:0] <= rbus_pipe7_wb_vreg_expand[63:0];       
  end
end

always @(posedge rbus_ex5_pipe7_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rbus_pipe7_wb_freg_data[FPR_MSB:0] <= {FPR_MSB+1{1'b0}};
  else if(rbus_pipe7_vreg_data_vld && !rbus_pipe7_vreg[VREG-1]) 
    rbus_pipe7_wb_freg_data[FPR_MSB:0] <= rbus_pipe7_freg_data[FPR_MSB:0];
  else 
    rbus_pipe7_wb_freg_data[FPR_MSB:0] <= rbus_pipe7_wb_freg_data[FPR_MSB:0];
end
//output to idu
assign vfpu_idu_ex5_pipe7_fwd_vreg[VREG-1:0]      = rbus_pipe7_wb_vreg[VREG-1:0];
assign vfpu_idu_ex5_pipe7_freg_wb_data[FPR_MSB:0] = (pipe7_rbus_vfmau_vreg_wb_vld)
                                                  ? pipe7_rbus_vfmau_freg_wb_data[FPR_MSB:0]
                                                  : rbus_pipe7_wb_freg_data[FPR_MSB:0];

assign vfpu_idu_ex5_pipe7_wb_vreg_fr_data[FPR_MSB:0] = vfpu_idu_ex5_pipe7_freg_wb_data[FPR_MSB:0];
assign vfpu_idu_ex5_pipe7_wb_vreg_fr_expand[63:0]    = rbus_pipe7_wb_vreg_expand[63:0];

assign vfpu_idu_ex5_pipe7_wb_vreg_dup0[VREG-1:0]          = rbus_pipe7_wb_vreg_dup0[VREG-1:0];
assign vfpu_idu_ex5_pipe7_wb_vreg_dup1[VREG-1:0]          = rbus_pipe7_wb_vreg_dup1[VREG-1:0];
assign vfpu_idu_ex5_pipe7_wb_vreg_dup2[VREG-1:0]          = rbus_pipe7_wb_vreg_dup2[VREG-1:0];
assign vfpu_idu_ex5_pipe7_wb_vreg_dup3[VREG-1:0]          = rbus_pipe7_wb_vreg_dup3[VREG-1:0];
assign vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand[63:0]   = rbus_pipe7_wb_vreg_expand[63:0];
assign vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand[63:0]   = rbus_pipe7_wb_vreg_expand[63:0];

//output to rtu
assign vfpu_rtu_ex5_pipe7_wb_vreg_expand[63:0] = rbus_pipe7_wb_vreg_expand[63:0];


//==========================================================
//               Pipe7 ereg result Data Path
//==========================================================
//----------------------------------------------------------
//              Result Valid Control Signal
//----------------------------------------------------------
assign rbus_pipe7_ereg_data_vld = ctrl_ex4_pipe7_inst_vld
                               && dp_ex4_pipe7_dste_vld;

//----------------------------------------------------------
//                   Write Back Valid
//----------------------------------------------------------
always @(posedge ctrl_ex5_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rbus_pipe7_ereg_wb_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    rbus_pipe7_ereg_wb_vld <= 1'b0;
  else
    rbus_pipe7_ereg_wb_vld <= rbus_pipe7_ereg_data_vld;
end
//output to IDU
assign vfpu_idu_ex5_pipe7_wb_ereg_vld = rbus_pipe7_ereg_wb_vld;
//output to RTU
assign vfpu_rtu_ex5_pipe7_ereg_wb_vld = rbus_pipe7_ereg_wb_vld;
//----------------------------------------------------------
//                Write Back Vreg Data Selection
//----------------------------------------------------------
assign rbus_pipe7_ereg[4:0]      = dp_ex4_pipe7_dst_ereg[4:0];
assign rbus_pipe7_ereg_data[4:0] = dp_ex5_pipe7_ereg_data_pre[4:0];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rbus_ex5_pipe7_ereg_en =  rbus_pipe7_ereg_data_vld;
//  &Instance("gated_clk_cell", "x_rbus_ex5_pipe7_ereg_gated_clk"); @613
gated_clk_cell  x_rbus_ex5_pipe7_ereg_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (rbus_ex5_pipe7_ereg_clk),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (rbus_ex5_pipe7_ereg_en ),
  .module_en               (cp0_vfpu_icg_en        ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

//  &Connect(.clk_in      (forever_cpuclk          ), @614
//           .external_en (1'b0                    ), @615
//           .global_en   (cp0_yy_clk_en           ), @616
//           .module_en   (cp0_vfpu_icg_en         ), @617
//           .local_en    (rbus_ex5_pipe7_ereg_en  ), @618
//           .clk_out     (rbus_ex5_pipe7_ereg_clk )); @619

//----------------------------------------------------------
//                   Write Back Vreg Data
//----------------------------------------------------------
always @(posedge rbus_ex5_pipe7_ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rbus_pipe7_wb_ereg[4:0]      <= 5'b0;
    rbus_pipe7_wb_ereg_data[4:0] <= 5'b0;
  end
  else if(rbus_pipe7_ereg_data_vld) begin
    rbus_pipe7_wb_ereg[4:0]      <= rbus_pipe7_ereg[4:0];
    rbus_pipe7_wb_ereg_data[4:0] <= rbus_pipe7_ereg_data[4:0];
  end
  else begin
    rbus_pipe7_wb_ereg[4:0]      <= rbus_pipe7_wb_ereg[4:0];               
    rbus_pipe7_wb_ereg_data[4:0] <= rbus_pipe7_wb_ereg_data[4:0];
  end
end

//output to idu
assign vfpu_idu_ex5_pipe7_wb_ereg[4:0]      = rbus_pipe7_wb_ereg[4:0];

assign vfpu_idu_ex5_pipe7_wb_ereg_data[4:0] = (pipe7_rbus_vfmau_ereg_wb_vld) 
                                            ? pipe7_rbus_vfmau_ereg_wb_data[4:0]
                                            : rbus_pipe7_wb_ereg_data[4:0];

// &Force("output","vfpu_idu_ex5_pipe7_wb_ereg_data");   @647
// &Force("output","vfpu_idu_ex5_pipe7_wb_ereg");   @648
//output to rtu
assign vfpu_rtu_ex5_pipe7_wb_ereg[4:0] = vfpu_idu_ex5_pipe7_wb_ereg[4:0];



//ex3 forward:
assign vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data[SILEN-1:0] = {SILEN{1'b0}};
assign vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data[SILEN-1:0] = {SILEN{1'b0}}; 

//ex4 forward:
assign vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data[SILEN-1:0] = {SILEN{1'b0}};
assign vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data[SILEN-1:0] = {SILEN{1'b0}};

//ex5 forward:
assign vfpu_idu_ex5_pipe6_wb_vreg_vr0_data[SILEN-1:0] = {SILEN{1'b0}};
assign vfpu_idu_ex5_pipe6_wb_vreg_vr1_data[SILEN-1:0] = {SILEN{1'b0}};

assign vfpu_idu_ex5_pipe6_wb_ereg_data[5] = 1'b0;

//ex3 forward:
assign vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data[SILEN-1:0] = {SILEN{1'b0}};
assign vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data[SILEN-1:0] = {SILEN{1'b0}}; 

//ex4 forward:
assign vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data[SILEN-1:0] = {SILEN{1'b0}};
assign vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data[SILEN-1:0] = {SILEN{1'b0}};

//ex5 forward:
assign vfpu_idu_ex5_pipe7_wb_vreg_vr0_data[SILEN-1:0] = {SILEN{1'b0}};
assign vfpu_idu_ex5_pipe7_wb_vreg_vr1_data[SILEN-1:0] = {SILEN{1'b0}};

assign vfpu_idu_ex5_pipe7_wb_ereg_data[5] = 1'b0;


// &ModuleEnd; @863
endmodule


