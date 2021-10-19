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

// &ModuleBeg; @26
module ct_idu_rf_fwd(
  cp0_idu_src2_fwd_disable,
  cp0_idu_srcv2_fwd_disable,
  dp_fwd_rf_pipe0_src0_preg,
  dp_fwd_rf_pipe0_src1_preg,
  dp_fwd_rf_pipe1_mla,
  dp_fwd_rf_pipe1_src0_preg,
  dp_fwd_rf_pipe1_src1_preg,
  dp_fwd_rf_pipe2_src0_preg,
  dp_fwd_rf_pipe2_src1_preg,
  dp_fwd_rf_pipe3_src0_preg,
  dp_fwd_rf_pipe3_src1_preg,
  dp_fwd_rf_pipe4_src0_preg,
  dp_fwd_rf_pipe4_src1_preg,
  dp_fwd_rf_pipe5_src0_preg,
  dp_fwd_rf_pipe5_srcv0_vreg,
  dp_fwd_rf_pipe6_srcv0_vreg,
  dp_fwd_rf_pipe6_srcv1_vreg,
  dp_fwd_rf_pipe6_srcv2_vreg,
  dp_fwd_rf_pipe6_srcvm_vreg,
  dp_fwd_rf_pipe6_vmla,
  dp_fwd_rf_pipe7_srcv0_vreg,
  dp_fwd_rf_pipe7_srcv1_vreg,
  dp_fwd_rf_pipe7_srcv2_vreg,
  dp_fwd_rf_pipe7_srcvm_vreg,
  dp_fwd_rf_pipe7_vmla,
  fwd_dp_rf_pipe0_src0_data,
  fwd_dp_rf_pipe0_src0_no_fwd,
  fwd_dp_rf_pipe0_src1_data,
  fwd_dp_rf_pipe0_src1_no_fwd,
  fwd_dp_rf_pipe1_src0_data,
  fwd_dp_rf_pipe1_src0_no_fwd,
  fwd_dp_rf_pipe1_src1_data,
  fwd_dp_rf_pipe1_src1_no_fwd,
  fwd_dp_rf_pipe2_src0_data,
  fwd_dp_rf_pipe2_src0_no_fwd,
  fwd_dp_rf_pipe2_src1_data,
  fwd_dp_rf_pipe2_src1_no_fwd,
  fwd_dp_rf_pipe3_src0_data,
  fwd_dp_rf_pipe3_src0_no_fwd,
  fwd_dp_rf_pipe3_src1_data,
  fwd_dp_rf_pipe3_src1_no_fwd,
  fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla,
  fwd_dp_rf_pipe3_srcvm_vreg_vr0_data,
  fwd_dp_rf_pipe3_srcvm_vreg_vr1_data,
  fwd_dp_rf_pipe4_src0_data,
  fwd_dp_rf_pipe4_src0_no_fwd,
  fwd_dp_rf_pipe4_src1_data,
  fwd_dp_rf_pipe4_src1_no_fwd,
  fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla,
  fwd_dp_rf_pipe4_srcvm_vreg_vr0_data,
  fwd_dp_rf_pipe4_srcvm_vreg_vr1_data,
  fwd_dp_rf_pipe5_src0_data,
  fwd_dp_rf_pipe5_src0_no_fwd,
  fwd_dp_rf_pipe5_src0_no_fwd_expt_mla,
  fwd_dp_rf_pipe5_srcv0_no_fwd,
  fwd_dp_rf_pipe5_srcv0_vreg_fr_data,
  fwd_dp_rf_pipe5_srcv0_vreg_vr0_data,
  fwd_dp_rf_pipe5_srcv0_vreg_vr1_data,
  fwd_dp_rf_pipe6_srcv0_no_fwd,
  fwd_dp_rf_pipe6_srcv0_vreg_fr_data,
  fwd_dp_rf_pipe6_srcv0_vreg_vr0_data,
  fwd_dp_rf_pipe6_srcv0_vreg_vr1_data,
  fwd_dp_rf_pipe6_srcv1_no_fwd,
  fwd_dp_rf_pipe6_srcv1_vreg_fr_data,
  fwd_dp_rf_pipe6_srcv1_vreg_vr0_data,
  fwd_dp_rf_pipe6_srcv1_vreg_vr1_data,
  fwd_dp_rf_pipe6_srcv2_no_fwd,
  fwd_dp_rf_pipe6_srcv2_vreg_fr_data,
  fwd_dp_rf_pipe6_srcv2_vreg_vr0_data,
  fwd_dp_rf_pipe6_srcv2_vreg_vr1_data,
  fwd_dp_rf_pipe6_srcvm_no_fwd,
  fwd_dp_rf_pipe6_srcvm_vreg_vr0_data,
  fwd_dp_rf_pipe6_srcvm_vreg_vr1_data,
  fwd_dp_rf_pipe7_srcv0_no_fwd,
  fwd_dp_rf_pipe7_srcv0_vreg_fr_data,
  fwd_dp_rf_pipe7_srcv0_vreg_vr0_data,
  fwd_dp_rf_pipe7_srcv0_vreg_vr1_data,
  fwd_dp_rf_pipe7_srcv1_no_fwd,
  fwd_dp_rf_pipe7_srcv1_vreg_fr_data,
  fwd_dp_rf_pipe7_srcv1_vreg_vr0_data,
  fwd_dp_rf_pipe7_srcv1_vreg_vr1_data,
  fwd_dp_rf_pipe7_srcv2_no_fwd,
  fwd_dp_rf_pipe7_srcv2_vreg_fr_data,
  fwd_dp_rf_pipe7_srcv2_vreg_vr0_data,
  fwd_dp_rf_pipe7_srcv2_vreg_vr1_data,
  fwd_dp_rf_pipe7_srcvm_no_fwd,
  fwd_dp_rf_pipe7_srcvm_vreg_vr0_data,
  fwd_dp_rf_pipe7_srcvm_vreg_vr1_data,
  iu_idu_ex1_pipe0_fwd_preg,
  iu_idu_ex1_pipe0_fwd_preg_data,
  iu_idu_ex1_pipe0_fwd_preg_vld,
  iu_idu_ex1_pipe1_fwd_preg,
  iu_idu_ex1_pipe1_fwd_preg_data,
  iu_idu_ex1_pipe1_fwd_preg_vld,
  iu_idu_ex2_pipe0_wb_preg,
  iu_idu_ex2_pipe0_wb_preg_data,
  iu_idu_ex2_pipe0_wb_preg_vld,
  iu_idu_ex2_pipe1_wb_preg,
  iu_idu_ex2_pipe1_wb_preg_data,
  iu_idu_ex2_pipe1_wb_preg_vld,
  iu_idu_pipe1_mla_src2_no_fwd,
  lsu_idu_da_pipe3_fwd_preg,
  lsu_idu_da_pipe3_fwd_preg_data,
  lsu_idu_da_pipe3_fwd_preg_vld,
  lsu_idu_da_pipe3_fwd_vreg,
  lsu_idu_da_pipe3_fwd_vreg_fr_data,
  lsu_idu_da_pipe3_fwd_vreg_vld,
  lsu_idu_da_pipe3_fwd_vreg_vr0_data,
  lsu_idu_da_pipe3_fwd_vreg_vr1_data,
  lsu_idu_wb_pipe3_fwd_vreg,
  lsu_idu_wb_pipe3_fwd_vreg_vld,
  lsu_idu_wb_pipe3_wb_preg,
  lsu_idu_wb_pipe3_wb_preg_data,
  lsu_idu_wb_pipe3_wb_preg_vld,
  lsu_idu_wb_pipe3_wb_vreg_fr_data,
  lsu_idu_wb_pipe3_wb_vreg_vr0_data,
  lsu_idu_wb_pipe3_wb_vreg_vr1_data,
  vfpu_idu_ex3_pipe6_fwd_vreg,
  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data,
  vfpu_idu_ex3_pipe6_fwd_vreg_vld,
  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data,
  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data,
  vfpu_idu_ex3_pipe7_fwd_vreg,
  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data,
  vfpu_idu_ex3_pipe7_fwd_vreg_vld,
  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data,
  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data,
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
  vfpu_idu_ex5_pipe6_wb_vreg_fr_data,
  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data,
  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data,
  vfpu_idu_ex5_pipe7_fwd_vreg,
  vfpu_idu_ex5_pipe7_fwd_vreg_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_fr_data,
  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data,
  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data,
  vfpu_idu_pipe6_vmla_srcv2_no_fwd,
  vfpu_idu_pipe7_vmla_srcv2_no_fwd
);

// &Ports; @27
input           cp0_idu_src2_fwd_disable;              
input           cp0_idu_srcv2_fwd_disable;             
input   [6 :0]  dp_fwd_rf_pipe0_src0_preg;             
input   [6 :0]  dp_fwd_rf_pipe0_src1_preg;             
input           dp_fwd_rf_pipe1_mla;                   
input   [6 :0]  dp_fwd_rf_pipe1_src0_preg;             
input   [6 :0]  dp_fwd_rf_pipe1_src1_preg;             
input   [6 :0]  dp_fwd_rf_pipe2_src0_preg;             
input   [6 :0]  dp_fwd_rf_pipe2_src1_preg;             
input   [6 :0]  dp_fwd_rf_pipe3_src0_preg;             
input   [6 :0]  dp_fwd_rf_pipe3_src1_preg;             
input   [6 :0]  dp_fwd_rf_pipe4_src0_preg;             
input   [6 :0]  dp_fwd_rf_pipe4_src1_preg;             
input   [6 :0]  dp_fwd_rf_pipe5_src0_preg;             
input   [6 :0]  dp_fwd_rf_pipe5_srcv0_vreg;            
input   [6 :0]  dp_fwd_rf_pipe6_srcv0_vreg;            
input   [6 :0]  dp_fwd_rf_pipe6_srcv1_vreg;            
input   [6 :0]  dp_fwd_rf_pipe6_srcv2_vreg;            
input   [6 :0]  dp_fwd_rf_pipe6_srcvm_vreg;            
input           dp_fwd_rf_pipe6_vmla;                  
input   [6 :0]  dp_fwd_rf_pipe7_srcv0_vreg;            
input   [6 :0]  dp_fwd_rf_pipe7_srcv1_vreg;            
input   [6 :0]  dp_fwd_rf_pipe7_srcv2_vreg;            
input   [6 :0]  dp_fwd_rf_pipe7_srcvm_vreg;            
input           dp_fwd_rf_pipe7_vmla;                  
input   [6 :0]  iu_idu_ex1_pipe0_fwd_preg;             
input   [63:0]  iu_idu_ex1_pipe0_fwd_preg_data;        
input           iu_idu_ex1_pipe0_fwd_preg_vld;         
input   [6 :0]  iu_idu_ex1_pipe1_fwd_preg;             
input   [63:0]  iu_idu_ex1_pipe1_fwd_preg_data;        
input           iu_idu_ex1_pipe1_fwd_preg_vld;         
input   [6 :0]  iu_idu_ex2_pipe0_wb_preg;              
input   [63:0]  iu_idu_ex2_pipe0_wb_preg_data;         
input           iu_idu_ex2_pipe0_wb_preg_vld;          
input   [6 :0]  iu_idu_ex2_pipe1_wb_preg;              
input   [63:0]  iu_idu_ex2_pipe1_wb_preg_data;         
input           iu_idu_ex2_pipe1_wb_preg_vld;          
input           iu_idu_pipe1_mla_src2_no_fwd;          
input   [6 :0]  lsu_idu_da_pipe3_fwd_preg;             
input   [63:0]  lsu_idu_da_pipe3_fwd_preg_data;        
input           lsu_idu_da_pipe3_fwd_preg_vld;         
input   [6 :0]  lsu_idu_da_pipe3_fwd_vreg;             
input   [63:0]  lsu_idu_da_pipe3_fwd_vreg_fr_data;     
input           lsu_idu_da_pipe3_fwd_vreg_vld;         
input   [63:0]  lsu_idu_da_pipe3_fwd_vreg_vr0_data;    
input   [63:0]  lsu_idu_da_pipe3_fwd_vreg_vr1_data;    
input   [6 :0]  lsu_idu_wb_pipe3_fwd_vreg;             
input           lsu_idu_wb_pipe3_fwd_vreg_vld;         
input   [6 :0]  lsu_idu_wb_pipe3_wb_preg;              
input   [63:0]  lsu_idu_wb_pipe3_wb_preg_data;         
input           lsu_idu_wb_pipe3_wb_preg_vld;          
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_fr_data;      
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr0_data;     
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr1_data;     
input   [6 :0]  vfpu_idu_ex3_pipe6_fwd_vreg;           
input   [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data;   
input           vfpu_idu_ex3_pipe6_fwd_vreg_vld;       
input   [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data;  
input   [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data;  
input   [6 :0]  vfpu_idu_ex3_pipe7_fwd_vreg;           
input   [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data;   
input           vfpu_idu_ex3_pipe7_fwd_vreg_vld;       
input   [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data;  
input   [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data;  
input   [6 :0]  vfpu_idu_ex4_pipe6_fwd_vreg;           
input   [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data;   
input           vfpu_idu_ex4_pipe6_fwd_vreg_vld;       
input   [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data;  
input   [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data;  
input   [6 :0]  vfpu_idu_ex4_pipe7_fwd_vreg;           
input   [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data;   
input           vfpu_idu_ex4_pipe7_fwd_vreg_vld;       
input   [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data;  
input   [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data;  
input   [6 :0]  vfpu_idu_ex5_pipe6_fwd_vreg;           
input           vfpu_idu_ex5_pipe6_fwd_vreg_vld;       
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_data;    
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data;   
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data;   
input   [6 :0]  vfpu_idu_ex5_pipe7_fwd_vreg;           
input           vfpu_idu_ex5_pipe7_fwd_vreg_vld;       
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_data;    
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data;   
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data;   
input           vfpu_idu_pipe6_vmla_srcv2_no_fwd;      
input           vfpu_idu_pipe7_vmla_srcv2_no_fwd;      
output  [63:0]  fwd_dp_rf_pipe0_src0_data;             
output          fwd_dp_rf_pipe0_src0_no_fwd;           
output  [63:0]  fwd_dp_rf_pipe0_src1_data;             
output          fwd_dp_rf_pipe0_src1_no_fwd;           
output  [63:0]  fwd_dp_rf_pipe1_src0_data;             
output          fwd_dp_rf_pipe1_src0_no_fwd;           
output  [63:0]  fwd_dp_rf_pipe1_src1_data;             
output          fwd_dp_rf_pipe1_src1_no_fwd;           
output  [63:0]  fwd_dp_rf_pipe2_src0_data;             
output          fwd_dp_rf_pipe2_src0_no_fwd;           
output  [63:0]  fwd_dp_rf_pipe2_src1_data;             
output          fwd_dp_rf_pipe2_src1_no_fwd;           
output  [63:0]  fwd_dp_rf_pipe3_src0_data;             
output          fwd_dp_rf_pipe3_src0_no_fwd;           
output  [63:0]  fwd_dp_rf_pipe3_src1_data;             
output          fwd_dp_rf_pipe3_src1_no_fwd;           
output          fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla; 
output  [63:0]  fwd_dp_rf_pipe3_srcvm_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe3_srcvm_vreg_vr1_data;   
output  [63:0]  fwd_dp_rf_pipe4_src0_data;             
output          fwd_dp_rf_pipe4_src0_no_fwd;           
output  [63:0]  fwd_dp_rf_pipe4_src1_data;             
output          fwd_dp_rf_pipe4_src1_no_fwd;           
output          fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla; 
output  [63:0]  fwd_dp_rf_pipe4_srcvm_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe4_srcvm_vreg_vr1_data;   
output  [63:0]  fwd_dp_rf_pipe5_src0_data;             
output          fwd_dp_rf_pipe5_src0_no_fwd;           
output          fwd_dp_rf_pipe5_src0_no_fwd_expt_mla;  
output          fwd_dp_rf_pipe5_srcv0_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe5_srcv0_vreg_fr_data;    
output  [63:0]  fwd_dp_rf_pipe5_srcv0_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe5_srcv0_vreg_vr1_data;   
output          fwd_dp_rf_pipe6_srcv0_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe6_srcv0_vreg_fr_data;    
output  [63:0]  fwd_dp_rf_pipe6_srcv0_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe6_srcv0_vreg_vr1_data;   
output          fwd_dp_rf_pipe6_srcv1_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe6_srcv1_vreg_fr_data;    
output  [63:0]  fwd_dp_rf_pipe6_srcv1_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe6_srcv1_vreg_vr1_data;   
output          fwd_dp_rf_pipe6_srcv2_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe6_srcv2_vreg_fr_data;    
output  [63:0]  fwd_dp_rf_pipe6_srcv2_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe6_srcv2_vreg_vr1_data;   
output          fwd_dp_rf_pipe6_srcvm_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe6_srcvm_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe6_srcvm_vreg_vr1_data;   
output          fwd_dp_rf_pipe7_srcv0_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe7_srcv0_vreg_fr_data;    
output  [63:0]  fwd_dp_rf_pipe7_srcv0_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe7_srcv0_vreg_vr1_data;   
output          fwd_dp_rf_pipe7_srcv1_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe7_srcv1_vreg_fr_data;    
output  [63:0]  fwd_dp_rf_pipe7_srcv1_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe7_srcv1_vreg_vr1_data;   
output          fwd_dp_rf_pipe7_srcv2_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe7_srcv2_vreg_fr_data;    
output  [63:0]  fwd_dp_rf_pipe7_srcv2_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe7_srcv2_vreg_vr1_data;   
output          fwd_dp_rf_pipe7_srcvm_no_fwd;          
output  [63:0]  fwd_dp_rf_pipe7_srcvm_vreg_vr0_data;   
output  [63:0]  fwd_dp_rf_pipe7_srcvm_vreg_vr1_data;   

// &Regs; @28

// &Wires; @29
wire            cp0_idu_src2_fwd_disable;              
wire            cp0_idu_srcv2_fwd_disable;             
wire    [6 :0]  dp_fwd_rf_pipe0_src0_preg;             
wire    [6 :0]  dp_fwd_rf_pipe0_src1_preg;             
wire            dp_fwd_rf_pipe1_mla;                   
wire    [6 :0]  dp_fwd_rf_pipe1_src0_preg;             
wire    [6 :0]  dp_fwd_rf_pipe1_src1_preg;             
wire    [6 :0]  dp_fwd_rf_pipe2_src0_preg;             
wire    [6 :0]  dp_fwd_rf_pipe2_src1_preg;             
wire    [6 :0]  dp_fwd_rf_pipe3_src0_preg;             
wire    [6 :0]  dp_fwd_rf_pipe3_src1_preg;             
wire    [6 :0]  dp_fwd_rf_pipe4_src0_preg;             
wire    [6 :0]  dp_fwd_rf_pipe4_src1_preg;             
wire    [6 :0]  dp_fwd_rf_pipe5_src0_preg;             
wire    [6 :0]  dp_fwd_rf_pipe5_srcv0_vreg;            
wire    [6 :0]  dp_fwd_rf_pipe6_srcv0_vreg;            
wire    [6 :0]  dp_fwd_rf_pipe6_srcv1_vreg;            
wire    [6 :0]  dp_fwd_rf_pipe6_srcv2_vreg;            
wire    [6 :0]  dp_fwd_rf_pipe6_srcvm_vreg;            
wire            dp_fwd_rf_pipe6_vmla;                  
wire    [6 :0]  dp_fwd_rf_pipe7_srcv0_vreg;            
wire    [6 :0]  dp_fwd_rf_pipe7_srcv1_vreg;            
wire    [6 :0]  dp_fwd_rf_pipe7_srcv2_vreg;            
wire    [6 :0]  dp_fwd_rf_pipe7_srcvm_vreg;            
wire            dp_fwd_rf_pipe7_vmla;                  
wire    [63:0]  fwd_dp_rf_pipe0_src0_data;             
wire            fwd_dp_rf_pipe0_src0_no_fwd;           
wire    [63:0]  fwd_dp_rf_pipe0_src1_data;             
wire            fwd_dp_rf_pipe0_src1_no_fwd;           
wire    [63:0]  fwd_dp_rf_pipe1_src0_data;             
wire            fwd_dp_rf_pipe1_src0_no_fwd;           
wire    [63:0]  fwd_dp_rf_pipe1_src1_data;             
wire            fwd_dp_rf_pipe1_src1_no_fwd;           
wire    [63:0]  fwd_dp_rf_pipe2_src0_data;             
wire            fwd_dp_rf_pipe2_src0_no_fwd;           
wire    [63:0]  fwd_dp_rf_pipe2_src1_data;             
wire            fwd_dp_rf_pipe2_src1_no_fwd;           
wire    [63:0]  fwd_dp_rf_pipe3_src0_data;             
wire            fwd_dp_rf_pipe3_src0_no_fwd;           
wire    [63:0]  fwd_dp_rf_pipe3_src1_data;             
wire            fwd_dp_rf_pipe3_src1_no_fwd;           
wire            fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla; 
wire            fwd_dp_rf_pipe3_srcvm_no_fwd_vr0;      
wire            fwd_dp_rf_pipe3_srcvm_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe3_srcvm_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe3_srcvm_vreg_vr1_data;   
wire    [63:0]  fwd_dp_rf_pipe4_src0_data;             
wire            fwd_dp_rf_pipe4_src0_no_fwd;           
wire    [63:0]  fwd_dp_rf_pipe4_src1_data;             
wire            fwd_dp_rf_pipe4_src1_no_fwd;           
wire            fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla; 
wire            fwd_dp_rf_pipe4_srcvm_no_fwd_vr0;      
wire            fwd_dp_rf_pipe4_srcvm_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe4_srcvm_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe4_srcvm_vreg_vr1_data;   
wire    [63:0]  fwd_dp_rf_pipe5_src0_data;             
wire            fwd_dp_rf_pipe5_src0_no_fwd;           
wire            fwd_dp_rf_pipe5_src0_no_fwd_expt_mla;  
wire            fwd_dp_rf_pipe5_src0_no_fwd_raw;       
wire            fwd_dp_rf_pipe5_srcv0_no_fwd;          
wire            fwd_dp_rf_pipe5_srcv0_no_fwd_vr0;      
wire            fwd_dp_rf_pipe5_srcv0_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe5_srcv0_vreg_fr_data;    
wire    [63:0]  fwd_dp_rf_pipe5_srcv0_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe5_srcv0_vreg_vr1_data;   
wire            fwd_dp_rf_pipe6_srcv0_no_fwd;          
wire            fwd_dp_rf_pipe6_srcv0_no_fwd_vr0;      
wire            fwd_dp_rf_pipe6_srcv0_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe6_srcv0_vreg_fr_data;    
wire    [63:0]  fwd_dp_rf_pipe6_srcv0_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe6_srcv0_vreg_vr1_data;   
wire            fwd_dp_rf_pipe6_srcv1_no_fwd;          
wire            fwd_dp_rf_pipe6_srcv1_no_fwd_vr0;      
wire            fwd_dp_rf_pipe6_srcv1_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe6_srcv1_vreg_fr_data;    
wire    [63:0]  fwd_dp_rf_pipe6_srcv1_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe6_srcv1_vreg_vr1_data;   
wire            fwd_dp_rf_pipe6_srcv2_no_fwd;          
wire            fwd_dp_rf_pipe6_srcv2_no_fwd_fr;       
wire            fwd_dp_rf_pipe6_srcv2_no_fwd_vr0;      
wire            fwd_dp_rf_pipe6_srcv2_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe6_srcv2_vreg_fr_data;    
wire    [63:0]  fwd_dp_rf_pipe6_srcv2_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe6_srcv2_vreg_vr1_data;   
wire            fwd_dp_rf_pipe6_srcvm_no_fwd;          
wire            fwd_dp_rf_pipe6_srcvm_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe6_srcvm_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe6_srcvm_vreg_vr1_data;   
wire            fwd_dp_rf_pipe7_srcv0_no_fwd;          
wire            fwd_dp_rf_pipe7_srcv0_no_fwd_vr0;      
wire            fwd_dp_rf_pipe7_srcv0_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe7_srcv0_vreg_fr_data;    
wire    [63:0]  fwd_dp_rf_pipe7_srcv0_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe7_srcv0_vreg_vr1_data;   
wire            fwd_dp_rf_pipe7_srcv1_no_fwd;          
wire            fwd_dp_rf_pipe7_srcv1_no_fwd_vr0;      
wire            fwd_dp_rf_pipe7_srcv1_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe7_srcv1_vreg_fr_data;    
wire    [63:0]  fwd_dp_rf_pipe7_srcv1_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe7_srcv1_vreg_vr1_data;   
wire            fwd_dp_rf_pipe7_srcv2_no_fwd;          
wire            fwd_dp_rf_pipe7_srcv2_no_fwd_fr;       
wire            fwd_dp_rf_pipe7_srcv2_no_fwd_vr0;      
wire            fwd_dp_rf_pipe7_srcv2_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe7_srcv2_vreg_fr_data;    
wire    [63:0]  fwd_dp_rf_pipe7_srcv2_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe7_srcv2_vreg_vr1_data;   
wire            fwd_dp_rf_pipe7_srcvm_no_fwd;          
wire            fwd_dp_rf_pipe7_srcvm_no_fwd_vr1;      
wire    [63:0]  fwd_dp_rf_pipe7_srcvm_vreg_vr0_data;   
wire    [63:0]  fwd_dp_rf_pipe7_srcvm_vreg_vr1_data;   
wire    [6 :0]  iu_idu_ex1_pipe0_fwd_preg;             
wire    [63:0]  iu_idu_ex1_pipe0_fwd_preg_data;        
wire            iu_idu_ex1_pipe0_fwd_preg_vld;         
wire    [6 :0]  iu_idu_ex1_pipe1_fwd_preg;             
wire    [63:0]  iu_idu_ex1_pipe1_fwd_preg_data;        
wire            iu_idu_ex1_pipe1_fwd_preg_vld;         
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg;              
wire    [63:0]  iu_idu_ex2_pipe0_wb_preg_data;         
wire            iu_idu_ex2_pipe0_wb_preg_vld;          
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg;              
wire    [63:0]  iu_idu_ex2_pipe1_wb_preg_data;         
wire            iu_idu_ex2_pipe1_wb_preg_vld;          
wire            iu_idu_pipe1_mla_src2_no_fwd;          
wire    [6 :0]  lsu_idu_da_pipe3_fwd_preg;             
wire    [63:0]  lsu_idu_da_pipe3_fwd_preg_data;        
wire            lsu_idu_da_pipe3_fwd_preg_vld;         
wire    [6 :0]  lsu_idu_da_pipe3_fwd_vreg;             
wire    [63:0]  lsu_idu_da_pipe3_fwd_vreg_fr_data;     
wire            lsu_idu_da_pipe3_fwd_vreg_vld;         
wire    [63:0]  lsu_idu_da_pipe3_fwd_vreg_vr0_data;    
wire    [63:0]  lsu_idu_da_pipe3_fwd_vreg_vr1_data;    
wire    [6 :0]  lsu_idu_wb_pipe3_fwd_vreg;             
wire            lsu_idu_wb_pipe3_fwd_vreg_vld;         
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg;              
wire    [63:0]  lsu_idu_wb_pipe3_wb_preg_data;         
wire            lsu_idu_wb_pipe3_wb_preg_vld;          
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_fr_data;      
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr0_data;     
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr1_data;     
wire    [6 :0]  vfpu_idu_ex3_pipe6_fwd_vreg;           
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data;   
wire            vfpu_idu_ex3_pipe6_fwd_vreg_vld;       
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data;  
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data;  
wire    [6 :0]  vfpu_idu_ex3_pipe7_fwd_vreg;           
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data;   
wire            vfpu_idu_ex3_pipe7_fwd_vreg_vld;       
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data;  
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data;  
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
wire    [6 :0]  vfpu_idu_ex5_pipe6_fwd_vreg;           
wire            vfpu_idu_ex5_pipe6_fwd_vreg_vld;       
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_data;    
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data;   
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data;   
wire    [6 :0]  vfpu_idu_ex5_pipe7_fwd_vreg;           
wire            vfpu_idu_ex5_pipe7_fwd_vreg_vld;       
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_data;    
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data;   
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data;   
wire            vfpu_idu_pipe6_vmla_srcv2_no_fwd;      
wire            vfpu_idu_pipe7_vmla_srcv2_no_fwd;      



//==========================================================
//                      Pipe0 Forward
//==========================================================
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe0_src0"); @35
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe0_src0 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe0_src0_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe0_src0_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe0_src0_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe0_src0_preg[6:0]), @36
//          .x_src_data              (fwd_dp_rf_pipe0_src0_data[63:0]), @37
//          .x_src_no_fwd            (fwd_dp_rf_pipe0_src0_no_fwd)); @38
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe0_src1"); @39
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe0_src1 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe0_src1_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe0_src1_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe0_src1_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe0_src1_preg[6:0]), @40
//          .x_src_data              (fwd_dp_rf_pipe0_src1_data[63:0]), @41
//          .x_src_no_fwd            (fwd_dp_rf_pipe0_src1_no_fwd)); @42

//==========================================================
//                      Pipe1 Forward
//==========================================================
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe1_src0"); @47
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe1_src0 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe1_src0_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe1_src0_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe1_src0_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe1_src0_preg[6:0]), @48
//          .x_src_data              (fwd_dp_rf_pipe1_src0_data[63:0]), @49
//          .x_src_no_fwd            (fwd_dp_rf_pipe1_src0_no_fwd)); @50
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe1_src1"); @51
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe1_src1 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe1_src1_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe1_src1_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe1_src1_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe1_src1_preg[6:0]), @52
//          .x_src_data              (fwd_dp_rf_pipe1_src1_data[63:0]), @53
//          .x_src_no_fwd            (fwd_dp_rf_pipe1_src1_no_fwd)); @54

//==========================================================
//                      Pipe2 Forward
//==========================================================
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe2_src0"); @59
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe2_src0 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe2_src0_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe2_src0_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe2_src0_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe2_src0_preg[6:0]), @60
//          .x_src_data              (fwd_dp_rf_pipe2_src0_data[63:0]), @61
//          .x_src_no_fwd            (fwd_dp_rf_pipe2_src0_no_fwd)); @62
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe2_src1"); @63
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe2_src1 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe2_src1_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe2_src1_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe2_src1_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe2_src1_preg[6:0]), @64
//          .x_src_data              (fwd_dp_rf_pipe2_src1_data[63:0]), @65
//          .x_src_no_fwd            (fwd_dp_rf_pipe2_src1_no_fwd)); @66

//==========================================================
//                      Pipe3 Forward
//==========================================================
//----------------------------------------------------------
//                     Scalar Source
//----------------------------------------------------------
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe3_src0"); @74
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe3_src0 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe3_src0_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe3_src0_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe3_src0_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe3_src0_preg[6:0]), @75
//          .x_src_data              (fwd_dp_rf_pipe3_src0_data[63:0]), @76
//          .x_src_no_fwd            (fwd_dp_rf_pipe3_src0_no_fwd)); @77
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe3_src1"); @78
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe3_src1 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe3_src1_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe3_src1_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe3_src1_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe3_src1_preg[6:0]), @79
//          .x_src_data              (fwd_dp_rf_pipe3_src1_data[63:0]), @80
//          .x_src_no_fwd            (fwd_dp_rf_pipe3_src1_no_fwd)); @81

//----------------------------------------------------------
//                     Vector Source M
//----------------------------------------------------------
//timing optimiation: cannot fwd from vfpu to lsu srcvm
// &Force ("nonport","fwd_dp_rf_pipe3_srcvm_no_fwd_vr1"); @87
// &ConnRule(s/_data/_vr0_data/); @88
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe3_srcvm"); @89
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe3_srcvm (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe3_srcvm_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe3_srcvm_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcv2_vreg[6:0]          )
);

// &Connect(.x_srcv_reg                      (dp_fwd_rf_pipe6_srcv2_vreg[6:0]), @90
//          .x_srcv_data                     (fwd_dp_rf_pipe3_srcvm_vreg_vr0_data[63:0]), @91
//          .x_srcv_no_fwd                   (fwd_dp_rf_pipe3_srcvm_no_fwd_vr0), @92
//          .vfpu_idu_ex3_pipe6_fwd_vreg_vld (1'b0), @93
//          .vfpu_idu_ex4_pipe6_fwd_vreg_vld (1'b0), @94
//          .vfpu_idu_ex5_pipe6_fwd_vreg_vld (1'b0), @95
//          .vfpu_idu_ex3_pipe7_fwd_vreg_vld (1'b0), @96
//          .vfpu_idu_ex4_pipe7_fwd_vreg_vld (1'b0), @97
//          .vfpu_idu_ex5_pipe7_fwd_vreg_vld (1'b0), @98
//          .vfpu_idu_ex3_pipe6_fwd_vreg     (7'b0), @99
//          .vfpu_idu_ex4_pipe6_fwd_vreg     (7'b0), @100
//          .vfpu_idu_ex5_pipe6_fwd_vreg     (7'b0), @101
//          .vfpu_idu_ex3_pipe7_fwd_vreg     (7'b0), @102
//          .vfpu_idu_ex4_pipe7_fwd_vreg     (7'b0), @103
//          .vfpu_idu_ex5_pipe7_fwd_vreg     (7'b0) @104
//         ); @105
// &ConnRule(s/_data/_vr1_data/); @106
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe3_srcvm"); @107
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe3_srcvm (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe3_srcvm_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe3_srcvm_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcv2_vreg[6:0]          )
);

// &Connect(.x_srcv_reg                      (dp_fwd_rf_pipe6_srcv2_vreg[6:0]), @108
//          .x_srcv_data                     (fwd_dp_rf_pipe3_srcvm_vreg_vr1_data[63:0]), @109
//          .x_srcv_no_fwd                   (fwd_dp_rf_pipe3_srcvm_no_fwd_vr1), @110
//          .vfpu_idu_ex3_pipe6_fwd_vreg_vld (1'b0), @111
//          .vfpu_idu_ex4_pipe6_fwd_vreg_vld (1'b0), @112
//          .vfpu_idu_ex5_pipe6_fwd_vreg_vld (1'b0), @113
//          .vfpu_idu_ex3_pipe7_fwd_vreg_vld (1'b0), @114
//          .vfpu_idu_ex4_pipe7_fwd_vreg_vld (1'b0), @115
//          .vfpu_idu_ex5_pipe7_fwd_vreg_vld (1'b0), @116
//          .vfpu_idu_ex3_pipe6_fwd_vreg     (7'b0), @117
//          .vfpu_idu_ex4_pipe6_fwd_vreg     (7'b0), @118
//          .vfpu_idu_ex5_pipe6_fwd_vreg     (7'b0), @119
//          .vfpu_idu_ex3_pipe7_fwd_vreg     (7'b0), @120
//          .vfpu_idu_ex4_pipe7_fwd_vreg     (7'b0), @121
//          .vfpu_idu_ex5_pipe7_fwd_vreg     (7'b0) @122
//         ); @123

assign fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla = fwd_dp_rf_pipe3_srcvm_no_fwd_vr0;

//==========================================================
//                      Pipe4 Forward
//==========================================================
//----------------------------------------------------------
//                     Scalar Source
//----------------------------------------------------------
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe4_src0"); @133
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe4_src0 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe4_src0_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe4_src0_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe4_src0_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe4_src0_preg[6:0]), @134
//          .x_src_data              (fwd_dp_rf_pipe4_src0_data[63:0]), @135
//          .x_src_no_fwd            (fwd_dp_rf_pipe4_src0_no_fwd)); @136
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe4_src1"); @137
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe4_src1 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe4_src1_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe4_src1_no_fwd    ),
  .x_src_reg                       (dp_fwd_rf_pipe4_src1_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe4_src1_preg[6:0]), @138
//          .x_src_data              (fwd_dp_rf_pipe4_src1_data[63:0]), @139
//          .x_src_no_fwd            (fwd_dp_rf_pipe4_src1_no_fwd)); @140

//----------------------------------------------------------
//                     Vector Source M
//----------------------------------------------------------
//timing optimiation: cannot fwd from vfpu to lsu srcvm
// &Force ("nonport","fwd_dp_rf_pipe4_srcvm_no_fwd_vr1"); @146
// &ConnRule(s/_data/_vr0_data/); @147
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe4_srcvm"); @148
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe4_srcvm (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe4_srcvm_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe4_srcvm_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcv2_vreg[6:0]          )
);

// &Connect(.x_srcv_reg                      (dp_fwd_rf_pipe7_srcv2_vreg[6:0]), @149
//          .x_srcv_data                     (fwd_dp_rf_pipe4_srcvm_vreg_vr0_data[63:0]), @150
//          .x_srcv_no_fwd                   (fwd_dp_rf_pipe4_srcvm_no_fwd_vr0), @151
//          .vfpu_idu_ex3_pipe7_fwd_vreg_vld (1'b0), @152
//          .vfpu_idu_ex4_pipe7_fwd_vreg_vld (1'b0), @153
//          .vfpu_idu_ex5_pipe7_fwd_vreg_vld (1'b0), @154
//          .vfpu_idu_ex3_pipe7_fwd_vreg_vld (1'b0), @155
//          .vfpu_idu_ex4_pipe7_fwd_vreg_vld (1'b0), @156
//          .vfpu_idu_ex5_pipe7_fwd_vreg_vld (1'b0), @157
//          .vfpu_idu_ex3_pipe7_fwd_vreg     (7'b0), @158
//          .vfpu_idu_ex4_pipe7_fwd_vreg     (7'b0), @159
//          .vfpu_idu_ex5_pipe7_fwd_vreg     (7'b0), @160
//          .vfpu_idu_ex3_pipe7_fwd_vreg     (7'b0), @161
//          .vfpu_idu_ex4_pipe7_fwd_vreg     (7'b0), @162
//          .vfpu_idu_ex5_pipe7_fwd_vreg     (7'b0) @163
//         ); @164
// &ConnRule(s/_data/_vr1_data/); @165
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe4_srcvm"); @166
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe4_srcvm (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (7'b0                                     ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (1'b0                                     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe4_srcvm_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe4_srcvm_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcv2_vreg[6:0]          )
);

// &Connect(.x_srcv_reg                      (dp_fwd_rf_pipe7_srcv2_vreg[6:0]), @167
//          .x_srcv_data                     (fwd_dp_rf_pipe4_srcvm_vreg_vr1_data[63:0]), @168
//          .x_srcv_no_fwd                   (fwd_dp_rf_pipe4_srcvm_no_fwd_vr1), @169
//          .vfpu_idu_ex3_pipe7_fwd_vreg_vld (1'b0), @170
//          .vfpu_idu_ex4_pipe7_fwd_vreg_vld (1'b0), @171
//          .vfpu_idu_ex5_pipe7_fwd_vreg_vld (1'b0), @172
//          .vfpu_idu_ex3_pipe7_fwd_vreg_vld (1'b0), @173
//          .vfpu_idu_ex4_pipe7_fwd_vreg_vld (1'b0), @174
//          .vfpu_idu_ex5_pipe7_fwd_vreg_vld (1'b0), @175
//          .vfpu_idu_ex3_pipe7_fwd_vreg     (7'b0), @176
//          .vfpu_idu_ex4_pipe7_fwd_vreg     (7'b0), @177
//          .vfpu_idu_ex5_pipe7_fwd_vreg     (7'b0), @178
//          .vfpu_idu_ex3_pipe7_fwd_vreg     (7'b0), @179
//          .vfpu_idu_ex4_pipe7_fwd_vreg     (7'b0), @180
//          .vfpu_idu_ex5_pipe7_fwd_vreg     (7'b0) @181
//         ); @182

assign fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla = fwd_dp_rf_pipe4_srcvm_no_fwd_vr0;

//==========================================================
//                      Pipe5 Forward
//==========================================================
//----------------------------------------------------------
//                     Scalar Source 0
//----------------------------------------------------------
// &Instance("ct_idu_rf_fwd_preg","x_ct_idu_rf_fwd_preg_pipe5_src0"); @192
ct_idu_rf_fwd_preg  x_ct_idu_rf_fwd_preg_pipe5_src0 (
  .iu_idu_ex1_pipe0_fwd_preg       (iu_idu_ex1_pipe0_fwd_preg      ),
  .iu_idu_ex1_pipe0_fwd_preg_data  (iu_idu_ex1_pipe0_fwd_preg_data ),
  .iu_idu_ex1_pipe0_fwd_preg_vld   (iu_idu_ex1_pipe0_fwd_preg_vld  ),
  .iu_idu_ex1_pipe1_fwd_preg       (iu_idu_ex1_pipe1_fwd_preg      ),
  .iu_idu_ex1_pipe1_fwd_preg_data  (iu_idu_ex1_pipe1_fwd_preg_data ),
  .iu_idu_ex1_pipe1_fwd_preg_vld   (iu_idu_ex1_pipe1_fwd_preg_vld  ),
  .iu_idu_ex2_pipe0_wb_preg        (iu_idu_ex2_pipe0_wb_preg       ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg        (iu_idu_ex2_pipe1_wb_preg       ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_da_pipe3_fwd_preg       (lsu_idu_da_pipe3_fwd_preg      ),
  .lsu_idu_da_pipe3_fwd_preg_data  (lsu_idu_da_pipe3_fwd_preg_data ),
  .lsu_idu_da_pipe3_fwd_preg_vld   (lsu_idu_da_pipe3_fwd_preg_vld  ),
  .lsu_idu_wb_pipe3_wb_preg        (lsu_idu_wb_pipe3_wb_preg       ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .x_src_data                      (fwd_dp_rf_pipe5_src0_data[63:0]),
  .x_src_no_fwd                    (fwd_dp_rf_pipe5_src0_no_fwd_raw),
  .x_src_reg                       (dp_fwd_rf_pipe5_src0_preg[6:0] )
);

// &Connect(.x_src_reg               (dp_fwd_rf_pipe5_src0_preg[6:0]), @193
//          .x_src_data              (fwd_dp_rf_pipe5_src0_data[63:0]), @194
//          .x_src_no_fwd            (fwd_dp_rf_pipe5_src0_no_fwd_raw)); @195

assign fwd_dp_rf_pipe5_src0_no_fwd = fwd_dp_rf_pipe5_src0_no_fwd_raw
                                     && (!dp_fwd_rf_pipe1_mla
                                          || iu_idu_pipe1_mla_src2_no_fwd
                                          || cp0_idu_src2_fwd_disable);
assign fwd_dp_rf_pipe5_src0_no_fwd_expt_mla = fwd_dp_rf_pipe5_src0_no_fwd_raw;

//----------------------------------------------------------
//                     Vector Source 0
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe5_srcv0_no_fwd_vr0"); @206
// &Force ("nonport","fwd_dp_rf_pipe5_srcv0_no_fwd_vr1"); @207
// &ConnRule(s/_data/_fr_data/); @208
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_fr_pipe5_srcv0"); @209
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_fr_pipe5_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                (lsu_idu_da_pipe3_fwd_vreg               ),
  .lsu_idu_da_pipe3_fwd_vreg_data           (lsu_idu_da_pipe3_fwd_vreg_fr_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld            (lsu_idu_da_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_fwd_vreg                (lsu_idu_wb_pipe3_fwd_vreg               ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld            (lsu_idu_wb_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_wb_vreg_data            (lsu_idu_wb_pipe3_wb_vreg_fr_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg              (vfpu_idu_ex3_pipe6_fwd_vreg             ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data         (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld          (vfpu_idu_ex3_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex3_pipe7_fwd_vreg              (vfpu_idu_ex3_pipe7_fwd_vreg             ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data         (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld          (vfpu_idu_ex3_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe6_fwd_vreg              (vfpu_idu_ex4_pipe6_fwd_vreg             ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data         (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld          (vfpu_idu_ex4_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe7_fwd_vreg              (vfpu_idu_ex4_pipe7_fwd_vreg             ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data         (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld          (vfpu_idu_ex4_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_fwd_vreg              (vfpu_idu_ex5_pipe6_fwd_vreg             ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld          (vfpu_idu_ex5_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data          (vfpu_idu_ex5_pipe6_wb_vreg_fr_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg              (vfpu_idu_ex5_pipe7_fwd_vreg             ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld          (vfpu_idu_ex5_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data          (vfpu_idu_ex5_pipe7_wb_vreg_fr_data      ),
  .x_srcv_data                              (fwd_dp_rf_pipe5_srcv0_vreg_fr_data[63:0]),
  .x_srcv_no_fwd                            (fwd_dp_rf_pipe5_srcv0_no_fwd            ),
  .x_srcv_reg                               (dp_fwd_rf_pipe5_srcv0_vreg[6:0]         )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe5_srcv0_vreg[6:0]), @210
//          .x_srcv_data              (fwd_dp_rf_pipe5_srcv0_vreg_fr_data[63:0]), @211
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe5_srcv0_no_fwd)); @212
// &ConnRule(s/_data/_vr0_data/); @213
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe5_srcv0"); @214
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe5_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe5_srcv0_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe5_srcv0_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe5_srcv0_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe5_srcv0_vreg[6:0]), @215
//          .x_srcv_data              (fwd_dp_rf_pipe5_srcv0_vreg_vr0_data[63:0]), @216
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe5_srcv0_no_fwd_vr0)); @217
// &ConnRule(s/_data/_vr1_data/); @218
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe5_srcv0"); @219
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe5_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe5_srcv0_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe5_srcv0_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe5_srcv0_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe5_srcv0_vreg[6:0]), @220
//          .x_srcv_data              (fwd_dp_rf_pipe5_srcv0_vreg_vr1_data[63:0]), @221
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe5_srcv0_no_fwd_vr1)); @222

//==========================================================
//                      Pipe6 Forward
//==========================================================
//----------------------------------------------------------
//                     Vector Source 0
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe6_srcv0_no_fwd_vr0"); @230
// &Force ("nonport","fwd_dp_rf_pipe6_srcv0_no_fwd_vr1"); @231
// &ConnRule(s/_data/_fr_data/); @232
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_fr_pipe6_srcv0"); @233
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_fr_pipe6_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                (lsu_idu_da_pipe3_fwd_vreg               ),
  .lsu_idu_da_pipe3_fwd_vreg_data           (lsu_idu_da_pipe3_fwd_vreg_fr_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld            (lsu_idu_da_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_fwd_vreg                (lsu_idu_wb_pipe3_fwd_vreg               ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld            (lsu_idu_wb_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_wb_vreg_data            (lsu_idu_wb_pipe3_wb_vreg_fr_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg              (vfpu_idu_ex3_pipe6_fwd_vreg             ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data         (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld          (vfpu_idu_ex3_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex3_pipe7_fwd_vreg              (vfpu_idu_ex3_pipe7_fwd_vreg             ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data         (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld          (vfpu_idu_ex3_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe6_fwd_vreg              (vfpu_idu_ex4_pipe6_fwd_vreg             ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data         (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld          (vfpu_idu_ex4_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe7_fwd_vreg              (vfpu_idu_ex4_pipe7_fwd_vreg             ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data         (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld          (vfpu_idu_ex4_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_fwd_vreg              (vfpu_idu_ex5_pipe6_fwd_vreg             ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld          (vfpu_idu_ex5_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data          (vfpu_idu_ex5_pipe6_wb_vreg_fr_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg              (vfpu_idu_ex5_pipe7_fwd_vreg             ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld          (vfpu_idu_ex5_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data          (vfpu_idu_ex5_pipe7_wb_vreg_fr_data      ),
  .x_srcv_data                              (fwd_dp_rf_pipe6_srcv0_vreg_fr_data[63:0]),
  .x_srcv_no_fwd                            (fwd_dp_rf_pipe6_srcv0_no_fwd            ),
  .x_srcv_reg                               (dp_fwd_rf_pipe6_srcv0_vreg[6:0]         )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv0_vreg[6:0]), @234
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv0_vreg_fr_data[63:0]), @235
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv0_no_fwd)); @236
// &ConnRule(s/_data/_vr0_data/); @237
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe6_srcv0"); @238
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe6_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe6_srcv0_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe6_srcv0_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcv0_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv0_vreg[6:0]), @239
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv0_vreg_vr0_data[63:0]), @240
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv0_no_fwd_vr0)); @241
// &ConnRule(s/_data/_vr1_data/); @242
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe6_srcv0"); @243
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe6_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe6_srcv0_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe6_srcv0_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcv0_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv0_vreg[6:0]), @244
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv0_vreg_vr1_data[63:0]), @245
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv0_no_fwd_vr1)); @246

//----------------------------------------------------------
//                     Vector Source 1
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe6_srcv1_no_fwd_vr0"); @251
// &Force ("nonport","fwd_dp_rf_pipe6_srcv1_no_fwd_vr1"); @252
// &ConnRule(s/_data/_fr_data/); @253
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_fr_pipe6_srcv1"); @254
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_fr_pipe6_srcv1 (
  .lsu_idu_da_pipe3_fwd_vreg                (lsu_idu_da_pipe3_fwd_vreg               ),
  .lsu_idu_da_pipe3_fwd_vreg_data           (lsu_idu_da_pipe3_fwd_vreg_fr_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld            (lsu_idu_da_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_fwd_vreg                (lsu_idu_wb_pipe3_fwd_vreg               ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld            (lsu_idu_wb_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_wb_vreg_data            (lsu_idu_wb_pipe3_wb_vreg_fr_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg              (vfpu_idu_ex3_pipe6_fwd_vreg             ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data         (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld          (vfpu_idu_ex3_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex3_pipe7_fwd_vreg              (vfpu_idu_ex3_pipe7_fwd_vreg             ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data         (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld          (vfpu_idu_ex3_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe6_fwd_vreg              (vfpu_idu_ex4_pipe6_fwd_vreg             ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data         (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld          (vfpu_idu_ex4_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe7_fwd_vreg              (vfpu_idu_ex4_pipe7_fwd_vreg             ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data         (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld          (vfpu_idu_ex4_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_fwd_vreg              (vfpu_idu_ex5_pipe6_fwd_vreg             ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld          (vfpu_idu_ex5_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data          (vfpu_idu_ex5_pipe6_wb_vreg_fr_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg              (vfpu_idu_ex5_pipe7_fwd_vreg             ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld          (vfpu_idu_ex5_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data          (vfpu_idu_ex5_pipe7_wb_vreg_fr_data      ),
  .x_srcv_data                              (fwd_dp_rf_pipe6_srcv1_vreg_fr_data[63:0]),
  .x_srcv_no_fwd                            (fwd_dp_rf_pipe6_srcv1_no_fwd            ),
  .x_srcv_reg                               (dp_fwd_rf_pipe6_srcv1_vreg[6:0]         )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv1_vreg[6:0]), @255
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv1_vreg_fr_data[63:0]), @256
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv1_no_fwd)); @257
// &ConnRule(s/_data/_vr0_data/); @258
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe6_srcv1"); @259
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe6_srcv1 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe6_srcv1_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe6_srcv1_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcv1_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv1_vreg[6:0]), @260
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv1_vreg_vr0_data[63:0]), @261
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv1_no_fwd_vr0)); @262
// &ConnRule(s/_data/_vr1_data/); @263
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe6_srcv1"); @264
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe6_srcv1 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe6_srcv1_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe6_srcv1_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcv1_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv1_vreg[6:0]), @265
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv1_vreg_vr1_data[63:0]), @266
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv1_no_fwd_vr1)); @267

//----------------------------------------------------------
//                     Vector Source 2
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe6_srcv2_no_fwd_vr0"); @272
// &Force ("nonport","fwd_dp_rf_pipe6_srcv2_no_fwd_vr1"); @273
// &ConnRule(s/_data/_fr_data/); @274
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_fr_pipe6_srcv2"); @275
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_fr_pipe6_srcv2 (
  .lsu_idu_da_pipe3_fwd_vreg                (lsu_idu_da_pipe3_fwd_vreg               ),
  .lsu_idu_da_pipe3_fwd_vreg_data           (lsu_idu_da_pipe3_fwd_vreg_fr_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld            (lsu_idu_da_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_fwd_vreg                (lsu_idu_wb_pipe3_fwd_vreg               ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld            (lsu_idu_wb_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_wb_vreg_data            (lsu_idu_wb_pipe3_wb_vreg_fr_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg              (vfpu_idu_ex3_pipe6_fwd_vreg             ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data         (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld          (vfpu_idu_ex3_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex3_pipe7_fwd_vreg              (vfpu_idu_ex3_pipe7_fwd_vreg             ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data         (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld          (vfpu_idu_ex3_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe6_fwd_vreg              (vfpu_idu_ex4_pipe6_fwd_vreg             ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data         (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld          (vfpu_idu_ex4_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe7_fwd_vreg              (vfpu_idu_ex4_pipe7_fwd_vreg             ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data         (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld          (vfpu_idu_ex4_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_fwd_vreg              (vfpu_idu_ex5_pipe6_fwd_vreg             ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld          (vfpu_idu_ex5_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data          (vfpu_idu_ex5_pipe6_wb_vreg_fr_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg              (vfpu_idu_ex5_pipe7_fwd_vreg             ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld          (vfpu_idu_ex5_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data          (vfpu_idu_ex5_pipe7_wb_vreg_fr_data      ),
  .x_srcv_data                              (fwd_dp_rf_pipe6_srcv2_vreg_fr_data[63:0]),
  .x_srcv_no_fwd                            (fwd_dp_rf_pipe6_srcv2_no_fwd_fr         ),
  .x_srcv_reg                               (dp_fwd_rf_pipe6_srcv2_vreg[6:0]         )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv2_vreg[6:0]), @276
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv2_vreg_fr_data[63:0]), @277
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv2_no_fwd_fr)); @278
// &ConnRule(s/_data/_vr0_data/); @279
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe6_srcv2"); @280
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe6_srcv2 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe6_srcv2_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe6_srcv2_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcv2_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv2_vreg[6:0]), @281
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv2_vreg_vr0_data[63:0]), @282
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv2_no_fwd_vr0)); @283
// &ConnRule(s/_data/_vr1_data/); @284
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe6_srcv2"); @285
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe6_srcv2 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe6_srcv2_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe6_srcv2_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcv2_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcv2_vreg[6:0]), @286
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcv2_vreg_vr1_data[63:0]), @287
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcv2_no_fwd_vr1)); @288
//vfpu internal forward
assign fwd_dp_rf_pipe6_srcv2_no_fwd = fwd_dp_rf_pipe6_srcv2_no_fwd_fr
                                      && (!dp_fwd_rf_pipe6_vmla
                                          || vfpu_idu_pipe6_vmla_srcv2_no_fwd
                                          || cp0_idu_srcv2_fwd_disable);

//----------------------------------------------------------
//                     Vector Source M
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe6_srcvm_no_fwd_vr1"); @298
// &ConnRule(s/_data/_vr0_data/); @299
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe6_srcvm"); @300
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe6_srcvm (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe6_srcvm_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe6_srcvm_no_fwd             ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcvm_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcvm_vreg[6:0]), @301
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcvm_vreg_vr0_data[63:0]), @302
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcvm_no_fwd)); @303
// &ConnRule(s/_data/_vr1_data/); @304
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe6_srcvm"); @305
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe6_srcvm (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe6_srcvm_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe6_srcvm_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe6_srcvm_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe6_srcvm_vreg[6:0]), @306
//          .x_srcv_data              (fwd_dp_rf_pipe6_srcvm_vreg_vr1_data[63:0]), @307
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe6_srcvm_no_fwd_vr1)); @308

//==========================================================
//                      Pipe7 Forward
//==========================================================
//----------------------------------------------------------
//                     Vector Source 0
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe7_srcv0_no_fwd_vr0"); @316
// &Force ("nonport","fwd_dp_rf_pipe7_srcv0_no_fwd_vr1"); @317
// &ConnRule(s/_data/_fr_data/); @318
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_fr_pipe7_srcv0"); @319
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_fr_pipe7_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                (lsu_idu_da_pipe3_fwd_vreg               ),
  .lsu_idu_da_pipe3_fwd_vreg_data           (lsu_idu_da_pipe3_fwd_vreg_fr_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld            (lsu_idu_da_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_fwd_vreg                (lsu_idu_wb_pipe3_fwd_vreg               ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld            (lsu_idu_wb_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_wb_vreg_data            (lsu_idu_wb_pipe3_wb_vreg_fr_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg              (vfpu_idu_ex3_pipe6_fwd_vreg             ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data         (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld          (vfpu_idu_ex3_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex3_pipe7_fwd_vreg              (vfpu_idu_ex3_pipe7_fwd_vreg             ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data         (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld          (vfpu_idu_ex3_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe6_fwd_vreg              (vfpu_idu_ex4_pipe6_fwd_vreg             ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data         (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld          (vfpu_idu_ex4_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe7_fwd_vreg              (vfpu_idu_ex4_pipe7_fwd_vreg             ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data         (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld          (vfpu_idu_ex4_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_fwd_vreg              (vfpu_idu_ex5_pipe6_fwd_vreg             ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld          (vfpu_idu_ex5_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data          (vfpu_idu_ex5_pipe6_wb_vreg_fr_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg              (vfpu_idu_ex5_pipe7_fwd_vreg             ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld          (vfpu_idu_ex5_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data          (vfpu_idu_ex5_pipe7_wb_vreg_fr_data      ),
  .x_srcv_data                              (fwd_dp_rf_pipe7_srcv0_vreg_fr_data[63:0]),
  .x_srcv_no_fwd                            (fwd_dp_rf_pipe7_srcv0_no_fwd            ),
  .x_srcv_reg                               (dp_fwd_rf_pipe7_srcv0_vreg[6:0]         )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv0_vreg[6:0]), @320
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv0_vreg_fr_data[63:0]), @321
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv0_no_fwd)); @322
// &ConnRule(s/_data/_vr0_data/); @323
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe7_srcv0"); @324
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe7_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe7_srcv0_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe7_srcv0_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcv0_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv0_vreg[6:0]), @325
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv0_vreg_vr0_data[63:0]), @326
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv0_no_fwd_vr0)); @327
// &ConnRule(s/_data/_vr1_data/); @328
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe7_srcv0"); @329
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe7_srcv0 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe7_srcv0_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe7_srcv0_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcv0_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv0_vreg[6:0]), @330
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv0_vreg_vr1_data[63:0]), @331
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv0_no_fwd_vr1)); @332

//----------------------------------------------------------
//                     Vector Source 1
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe7_srcv1_no_fwd_vr0"); @337
// &Force ("nonport","fwd_dp_rf_pipe7_srcv1_no_fwd_vr1"); @338
// &ConnRule(s/_data/_fr_data/); @339
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_fr_pipe7_srcv1"); @340
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_fr_pipe7_srcv1 (
  .lsu_idu_da_pipe3_fwd_vreg                (lsu_idu_da_pipe3_fwd_vreg               ),
  .lsu_idu_da_pipe3_fwd_vreg_data           (lsu_idu_da_pipe3_fwd_vreg_fr_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld            (lsu_idu_da_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_fwd_vreg                (lsu_idu_wb_pipe3_fwd_vreg               ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld            (lsu_idu_wb_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_wb_vreg_data            (lsu_idu_wb_pipe3_wb_vreg_fr_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg              (vfpu_idu_ex3_pipe6_fwd_vreg             ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data         (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld          (vfpu_idu_ex3_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex3_pipe7_fwd_vreg              (vfpu_idu_ex3_pipe7_fwd_vreg             ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data         (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld          (vfpu_idu_ex3_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe6_fwd_vreg              (vfpu_idu_ex4_pipe6_fwd_vreg             ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data         (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld          (vfpu_idu_ex4_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe7_fwd_vreg              (vfpu_idu_ex4_pipe7_fwd_vreg             ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data         (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld          (vfpu_idu_ex4_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_fwd_vreg              (vfpu_idu_ex5_pipe6_fwd_vreg             ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld          (vfpu_idu_ex5_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data          (vfpu_idu_ex5_pipe6_wb_vreg_fr_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg              (vfpu_idu_ex5_pipe7_fwd_vreg             ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld          (vfpu_idu_ex5_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data          (vfpu_idu_ex5_pipe7_wb_vreg_fr_data      ),
  .x_srcv_data                              (fwd_dp_rf_pipe7_srcv1_vreg_fr_data[63:0]),
  .x_srcv_no_fwd                            (fwd_dp_rf_pipe7_srcv1_no_fwd            ),
  .x_srcv_reg                               (dp_fwd_rf_pipe7_srcv1_vreg[6:0]         )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv1_vreg[6:0]), @341
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv1_vreg_fr_data[63:0]), @342
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv1_no_fwd)); @343
// &ConnRule(s/_data/_vr0_data/); @344
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe7_srcv1"); @345
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe7_srcv1 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe7_srcv1_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe7_srcv1_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcv1_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv1_vreg[6:0]), @346
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv1_vreg_vr0_data[63:0]), @347
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv1_no_fwd_vr0)); @348
// &ConnRule(s/_data/_vr1_data/); @349
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe7_srcv1"); @350
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe7_srcv1 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe7_srcv1_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe7_srcv1_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcv1_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv1_vreg[6:0]), @351
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv1_vreg_vr1_data[63:0]), @352
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv1_no_fwd_vr1)); @353

//----------------------------------------------------------
//                     Vector Source 2
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe7_srcv2_no_fwd_vr0"); @358
// &Force ("nonport","fwd_dp_rf_pipe7_srcv2_no_fwd_vr1"); @359
// &ConnRule(s/_data/_fr_data/); @360
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_fr_pipe7_srcv2"); @361
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_fr_pipe7_srcv2 (
  .lsu_idu_da_pipe3_fwd_vreg                (lsu_idu_da_pipe3_fwd_vreg               ),
  .lsu_idu_da_pipe3_fwd_vreg_data           (lsu_idu_da_pipe3_fwd_vreg_fr_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld            (lsu_idu_da_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_fwd_vreg                (lsu_idu_wb_pipe3_fwd_vreg               ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld            (lsu_idu_wb_pipe3_fwd_vreg_vld           ),
  .lsu_idu_wb_pipe3_wb_vreg_data            (lsu_idu_wb_pipe3_wb_vreg_fr_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg              (vfpu_idu_ex3_pipe6_fwd_vreg             ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data         (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld          (vfpu_idu_ex3_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex3_pipe7_fwd_vreg              (vfpu_idu_ex3_pipe7_fwd_vreg             ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data         (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld          (vfpu_idu_ex3_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe6_fwd_vreg              (vfpu_idu_ex4_pipe6_fwd_vreg             ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data         (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld          (vfpu_idu_ex4_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex4_pipe7_fwd_vreg              (vfpu_idu_ex4_pipe7_fwd_vreg             ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data         (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld          (vfpu_idu_ex4_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_fwd_vreg              (vfpu_idu_ex5_pipe6_fwd_vreg             ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld          (vfpu_idu_ex5_pipe6_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data          (vfpu_idu_ex5_pipe6_wb_vreg_fr_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg              (vfpu_idu_ex5_pipe7_fwd_vreg             ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld          (vfpu_idu_ex5_pipe7_fwd_vreg_vld         ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data          (vfpu_idu_ex5_pipe7_wb_vreg_fr_data      ),
  .x_srcv_data                              (fwd_dp_rf_pipe7_srcv2_vreg_fr_data[63:0]),
  .x_srcv_no_fwd                            (fwd_dp_rf_pipe7_srcv2_no_fwd_fr         ),
  .x_srcv_reg                               (dp_fwd_rf_pipe7_srcv2_vreg[6:0]         )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv2_vreg[6:0]), @362
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv2_vreg_fr_data[63:0]), @363
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv2_no_fwd_fr)); @364
// &ConnRule(s/_data/_vr0_data/); @365
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe7_srcv2"); @366
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe7_srcv2 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe7_srcv2_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe7_srcv2_no_fwd_vr0         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcv2_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv2_vreg[6:0]), @367
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv2_vreg_vr0_data[63:0]), @368
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv2_no_fwd_vr0)); @369
// &ConnRule(s/_data/_vr1_data/); @370
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe7_srcv2"); @371
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe7_srcv2 (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe7_srcv2_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe7_srcv2_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcv2_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcv2_vreg[6:0]), @372
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcv2_vreg_vr1_data[63:0]), @373
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcv2_no_fwd_vr1)); @374
//vfpu internal forward
assign fwd_dp_rf_pipe7_srcv2_no_fwd = fwd_dp_rf_pipe7_srcv2_no_fwd_fr
                                      && (!dp_fwd_rf_pipe7_vmla
                                          || vfpu_idu_pipe7_vmla_srcv2_no_fwd
                                          || cp0_idu_srcv2_fwd_disable);

//----------------------------------------------------------
//                     Vector Source M
//----------------------------------------------------------
// &Force ("nonport","fwd_dp_rf_pipe7_srcvm_no_fwd_vr1"); @384
// &ConnRule(s/_data/_vr0_data/); @385
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr0_pipe7_srcvm"); @386
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr0_pipe7_srcvm (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr0_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr0_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe7_srcvm_vreg_vr0_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe7_srcvm_no_fwd             ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcvm_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcvm_vreg[6:0]), @387
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcvm_vreg_vr0_data[63:0]), @388
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcvm_no_fwd)); @389
// &ConnRule(s/_data/_vr1_data/); @390
// &Instance("ct_idu_rf_fwd_vreg","x_ct_idu_rf_fwd_vreg_vr1_pipe7_srcvm"); @391
ct_idu_rf_fwd_vreg  x_ct_idu_rf_fwd_vreg_vr1_pipe7_srcvm (
  .lsu_idu_da_pipe3_fwd_vreg                 (lsu_idu_da_pipe3_fwd_vreg                ),
  .lsu_idu_da_pipe3_fwd_vreg_data            (lsu_idu_da_pipe3_fwd_vreg_vr1_data       ),
  .lsu_idu_da_pipe3_fwd_vreg_vld             (lsu_idu_da_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_fwd_vreg                 (lsu_idu_wb_pipe3_fwd_vreg                ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld             (lsu_idu_wb_pipe3_fwd_vreg_vld            ),
  .lsu_idu_wb_pipe3_wb_vreg_data             (lsu_idu_wb_pipe3_wb_vreg_vr1_data        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg               (vfpu_idu_ex3_pipe6_fwd_vreg              ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_data          (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld           (vfpu_idu_ex3_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg               (vfpu_idu_ex3_pipe7_fwd_vreg              ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_data          (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld           (vfpu_idu_ex3_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg               (vfpu_idu_ex4_pipe6_fwd_vreg              ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_data          (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld           (vfpu_idu_ex4_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg               (vfpu_idu_ex4_pipe7_fwd_vreg              ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_data          (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data     ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld           (vfpu_idu_ex4_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg               (vfpu_idu_ex5_pipe6_fwd_vreg              ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld           (vfpu_idu_ex5_pipe6_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data           (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data      ),
  .vfpu_idu_ex5_pipe7_fwd_vreg               (vfpu_idu_ex5_pipe7_fwd_vreg              ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld           (vfpu_idu_ex5_pipe7_fwd_vreg_vld          ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data           (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data      ),
  .x_srcv_data                               (fwd_dp_rf_pipe7_srcvm_vreg_vr1_data[63:0]),
  .x_srcv_no_fwd                             (fwd_dp_rf_pipe7_srcvm_no_fwd_vr1         ),
  .x_srcv_reg                                (dp_fwd_rf_pipe7_srcvm_vreg[6:0]          )
);

// &Connect(.x_srcv_reg               (dp_fwd_rf_pipe7_srcvm_vreg[6:0]), @392
//          .x_srcv_data              (fwd_dp_rf_pipe7_srcvm_vreg_vr1_data[63:0]), @393
//          .x_srcv_no_fwd            (fwd_dp_rf_pipe7_srcvm_no_fwd_vr1)); @394

// &ModuleEnd; @396
endmodule


