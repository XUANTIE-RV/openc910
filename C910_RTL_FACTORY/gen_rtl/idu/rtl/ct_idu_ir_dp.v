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
module ct_idu_ir_dp(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_ir_inst0_vld,
  ctrl_id_pipedown_gateclk,
  ctrl_ir_stall,
  dp_ctrl_ir_inst0_bar,
  dp_ctrl_ir_inst0_ctrl_info,
  dp_ctrl_ir_inst0_dst_vld,
  dp_ctrl_ir_inst0_dst_x0,
  dp_ctrl_ir_inst0_dste_vld,
  dp_ctrl_ir_inst0_dstf_vld,
  dp_ctrl_ir_inst0_dstv_vld,
  dp_ctrl_ir_inst0_hpcp_type,
  dp_ctrl_ir_inst1_bar,
  dp_ctrl_ir_inst1_ctrl_info,
  dp_ctrl_ir_inst1_dst_vld,
  dp_ctrl_ir_inst1_dst_x0,
  dp_ctrl_ir_inst1_dste_vld,
  dp_ctrl_ir_inst1_dstf_vld,
  dp_ctrl_ir_inst1_dstv_vld,
  dp_ctrl_ir_inst1_hpcp_type,
  dp_ctrl_ir_inst2_bar,
  dp_ctrl_ir_inst2_ctrl_info,
  dp_ctrl_ir_inst2_dst_vld,
  dp_ctrl_ir_inst2_dst_x0,
  dp_ctrl_ir_inst2_dste_vld,
  dp_ctrl_ir_inst2_dstf_vld,
  dp_ctrl_ir_inst2_dstv_vld,
  dp_ctrl_ir_inst2_hpcp_type,
  dp_ctrl_ir_inst3_bar,
  dp_ctrl_ir_inst3_ctrl_info,
  dp_ctrl_ir_inst3_dst_vld,
  dp_ctrl_ir_inst3_dst_x0,
  dp_ctrl_ir_inst3_dste_vld,
  dp_ctrl_ir_inst3_dstf_vld,
  dp_ctrl_ir_inst3_dstv_vld,
  dp_ctrl_ir_inst3_hpcp_type,
  dp_frt_inst0_dst_ereg,
  dp_frt_inst0_dst_freg,
  dp_frt_inst0_dste_vld,
  dp_frt_inst0_dstf_reg,
  dp_frt_inst0_dstf_vld,
  dp_frt_inst0_fmla,
  dp_frt_inst0_fmov,
  dp_frt_inst0_srcf0_reg,
  dp_frt_inst0_srcf0_vld,
  dp_frt_inst0_srcf1_reg,
  dp_frt_inst0_srcf1_vld,
  dp_frt_inst0_srcf2_reg,
  dp_frt_inst0_srcf2_vld,
  dp_frt_inst1_dst_ereg,
  dp_frt_inst1_dst_freg,
  dp_frt_inst1_dste_vld,
  dp_frt_inst1_dstf_reg,
  dp_frt_inst1_dstf_vld,
  dp_frt_inst1_fmla,
  dp_frt_inst1_fmov,
  dp_frt_inst1_srcf0_reg,
  dp_frt_inst1_srcf0_vld,
  dp_frt_inst1_srcf1_reg,
  dp_frt_inst1_srcf1_vld,
  dp_frt_inst1_srcf2_reg,
  dp_frt_inst1_srcf2_vld,
  dp_frt_inst2_dst_ereg,
  dp_frt_inst2_dst_freg,
  dp_frt_inst2_dste_vld,
  dp_frt_inst2_dstf_reg,
  dp_frt_inst2_dstf_vld,
  dp_frt_inst2_fmla,
  dp_frt_inst2_fmov,
  dp_frt_inst2_srcf0_reg,
  dp_frt_inst2_srcf0_vld,
  dp_frt_inst2_srcf1_reg,
  dp_frt_inst2_srcf1_vld,
  dp_frt_inst2_srcf2_reg,
  dp_frt_inst2_srcf2_vld,
  dp_frt_inst3_dst_ereg,
  dp_frt_inst3_dst_freg,
  dp_frt_inst3_dste_vld,
  dp_frt_inst3_dstf_reg,
  dp_frt_inst3_dstf_vld,
  dp_frt_inst3_fmla,
  dp_frt_inst3_srcf0_reg,
  dp_frt_inst3_srcf0_vld,
  dp_frt_inst3_srcf1_reg,
  dp_frt_inst3_srcf1_vld,
  dp_frt_inst3_srcf2_reg,
  dp_frt_inst3_srcf2_vld,
  dp_id_pipedown_dep_info,
  dp_id_pipedown_inst0_data,
  dp_id_pipedown_inst1_data,
  dp_id_pipedown_inst2_data,
  dp_id_pipedown_inst3_data,
  dp_ir_inst01_src_match,
  dp_ir_inst02_src_match,
  dp_ir_inst03_src_match,
  dp_ir_inst0_data,
  dp_ir_inst12_src_match,
  dp_ir_inst13_src_match,
  dp_ir_inst1_data,
  dp_ir_inst23_src_match,
  dp_ir_inst2_data,
  dp_ir_inst3_data,
  dp_rt_dep_info,
  dp_rt_inst0_dst_preg,
  dp_rt_inst0_dst_reg,
  dp_rt_inst0_dst_vld,
  dp_rt_inst0_mla,
  dp_rt_inst0_mov,
  dp_rt_inst0_src0_reg,
  dp_rt_inst0_src0_vld,
  dp_rt_inst0_src1_reg,
  dp_rt_inst0_src1_vld,
  dp_rt_inst0_src2_vld,
  dp_rt_inst1_dst_preg,
  dp_rt_inst1_dst_reg,
  dp_rt_inst1_dst_vld,
  dp_rt_inst1_mla,
  dp_rt_inst1_mov,
  dp_rt_inst1_src0_reg,
  dp_rt_inst1_src0_vld,
  dp_rt_inst1_src1_reg,
  dp_rt_inst1_src1_vld,
  dp_rt_inst1_src2_vld,
  dp_rt_inst2_dst_preg,
  dp_rt_inst2_dst_reg,
  dp_rt_inst2_dst_vld,
  dp_rt_inst2_mla,
  dp_rt_inst2_mov,
  dp_rt_inst2_src0_reg,
  dp_rt_inst2_src0_vld,
  dp_rt_inst2_src1_reg,
  dp_rt_inst2_src1_vld,
  dp_rt_inst2_src2_vld,
  dp_rt_inst3_dst_preg,
  dp_rt_inst3_dst_reg,
  dp_rt_inst3_dst_vld,
  dp_rt_inst3_mla,
  dp_rt_inst3_src0_reg,
  dp_rt_inst3_src0_vld,
  dp_rt_inst3_src1_reg,
  dp_rt_inst3_src1_vld,
  dp_rt_inst3_src2_vld,
  dp_vrt_inst0_dst_vreg,
  dp_vrt_inst0_dstv_reg,
  dp_vrt_inst0_dstv_vld,
  dp_vrt_inst0_srcv0_reg,
  dp_vrt_inst0_srcv0_vld,
  dp_vrt_inst0_srcv1_reg,
  dp_vrt_inst0_srcv1_vld,
  dp_vrt_inst0_srcv2_vld,
  dp_vrt_inst0_srcvm_vld,
  dp_vrt_inst0_vmla,
  dp_vrt_inst1_dst_vreg,
  dp_vrt_inst1_dstv_reg,
  dp_vrt_inst1_dstv_vld,
  dp_vrt_inst1_srcv0_reg,
  dp_vrt_inst1_srcv0_vld,
  dp_vrt_inst1_srcv1_reg,
  dp_vrt_inst1_srcv1_vld,
  dp_vrt_inst1_srcv2_vld,
  dp_vrt_inst1_srcvm_vld,
  dp_vrt_inst1_vmla,
  dp_vrt_inst2_dst_vreg,
  dp_vrt_inst2_dstv_reg,
  dp_vrt_inst2_dstv_vld,
  dp_vrt_inst2_srcv0_reg,
  dp_vrt_inst2_srcv0_vld,
  dp_vrt_inst2_srcv1_reg,
  dp_vrt_inst2_srcv1_vld,
  dp_vrt_inst2_srcv2_vld,
  dp_vrt_inst2_srcvm_vld,
  dp_vrt_inst2_vmla,
  dp_vrt_inst3_dst_vreg,
  dp_vrt_inst3_dstv_reg,
  dp_vrt_inst3_dstv_vld,
  dp_vrt_inst3_srcv0_reg,
  dp_vrt_inst3_srcv0_vld,
  dp_vrt_inst3_srcv1_reg,
  dp_vrt_inst3_srcv1_vld,
  dp_vrt_inst3_srcv2_vld,
  dp_vrt_inst3_srcvm_vld,
  dp_vrt_inst3_vmla,
  forever_cpuclk,
  frt_dp_inst01_srcf2_match,
  frt_dp_inst02_srcf2_match,
  frt_dp_inst03_srcf2_match,
  frt_dp_inst0_rel_ereg,
  frt_dp_inst0_rel_freg,
  frt_dp_inst0_srcf0_data,
  frt_dp_inst0_srcf1_data,
  frt_dp_inst0_srcf2_data,
  frt_dp_inst12_srcf2_match,
  frt_dp_inst13_srcf2_match,
  frt_dp_inst1_rel_ereg,
  frt_dp_inst1_rel_freg,
  frt_dp_inst1_srcf0_data,
  frt_dp_inst1_srcf1_data,
  frt_dp_inst1_srcf2_data,
  frt_dp_inst23_srcf2_match,
  frt_dp_inst2_rel_ereg,
  frt_dp_inst2_rel_freg,
  frt_dp_inst2_srcf0_data,
  frt_dp_inst2_srcf1_data,
  frt_dp_inst2_srcf2_data,
  frt_dp_inst3_rel_ereg,
  frt_dp_inst3_rel_freg,
  frt_dp_inst3_srcf0_data,
  frt_dp_inst3_srcf1_data,
  frt_dp_inst3_srcf2_data,
  pad_yy_icg_scan_en,
  rt_dp_inst01_src_match,
  rt_dp_inst02_src_match,
  rt_dp_inst03_src_match,
  rt_dp_inst0_rel_preg,
  rt_dp_inst0_src0_data,
  rt_dp_inst0_src1_data,
  rt_dp_inst0_src2_data,
  rt_dp_inst12_src_match,
  rt_dp_inst13_src_match,
  rt_dp_inst1_rel_preg,
  rt_dp_inst1_src0_data,
  rt_dp_inst1_src1_data,
  rt_dp_inst1_src2_data,
  rt_dp_inst23_src_match,
  rt_dp_inst2_rel_preg,
  rt_dp_inst2_src0_data,
  rt_dp_inst2_src1_data,
  rt_dp_inst2_src2_data,
  rt_dp_inst3_rel_preg,
  rt_dp_inst3_src0_data,
  rt_dp_inst3_src1_data,
  rt_dp_inst3_src2_data,
  rtu_idu_alloc_ereg0,
  rtu_idu_alloc_ereg1,
  rtu_idu_alloc_ereg2,
  rtu_idu_alloc_ereg3,
  rtu_idu_alloc_freg0,
  rtu_idu_alloc_freg1,
  rtu_idu_alloc_freg2,
  rtu_idu_alloc_freg3,
  rtu_idu_alloc_preg0,
  rtu_idu_alloc_preg1,
  rtu_idu_alloc_preg2,
  rtu_idu_alloc_preg3,
  rtu_idu_alloc_vreg0,
  rtu_idu_alloc_vreg1,
  rtu_idu_alloc_vreg2,
  rtu_idu_alloc_vreg3,
  vrt_dp_inst01_srcv2_match,
  vrt_dp_inst02_srcv2_match,
  vrt_dp_inst03_srcv2_match,
  vrt_dp_inst0_rel_vreg,
  vrt_dp_inst0_srcv0_data,
  vrt_dp_inst0_srcv1_data,
  vrt_dp_inst0_srcv2_data,
  vrt_dp_inst0_srcvm_data,
  vrt_dp_inst12_srcv2_match,
  vrt_dp_inst13_srcv2_match,
  vrt_dp_inst1_rel_vreg,
  vrt_dp_inst1_srcv0_data,
  vrt_dp_inst1_srcv1_data,
  vrt_dp_inst1_srcv2_data,
  vrt_dp_inst1_srcvm_data,
  vrt_dp_inst23_srcv2_match,
  vrt_dp_inst2_rel_vreg,
  vrt_dp_inst2_srcv0_data,
  vrt_dp_inst2_srcv1_data,
  vrt_dp_inst2_srcv2_data,
  vrt_dp_inst2_srcvm_data,
  vrt_dp_inst3_rel_vreg,
  vrt_dp_inst3_srcv0_data,
  vrt_dp_inst3_srcv1_data,
  vrt_dp_inst3_srcv2_data,
  vrt_dp_inst3_srcvm_data
);

// &Ports; @27
input            cp0_idu_icg_en;            
input            cp0_yy_clk_en;             
input            cpurst_b;                  
input            ctrl_dp_ir_inst0_vld;      
input            ctrl_id_pipedown_gateclk;  
input            ctrl_ir_stall;             
input   [16 :0]  dp_id_pipedown_dep_info;   
input   [177:0]  dp_id_pipedown_inst0_data; 
input   [177:0]  dp_id_pipedown_inst1_data; 
input   [177:0]  dp_id_pipedown_inst2_data; 
input   [177:0]  dp_id_pipedown_inst3_data; 
input            forever_cpuclk;            
input            frt_dp_inst01_srcf2_match; 
input            frt_dp_inst02_srcf2_match; 
input            frt_dp_inst03_srcf2_match; 
input   [4  :0]  frt_dp_inst0_rel_ereg;     
input   [6  :0]  frt_dp_inst0_rel_freg;     
input   [8  :0]  frt_dp_inst0_srcf0_data;   
input   [8  :0]  frt_dp_inst0_srcf1_data;   
input   [9  :0]  frt_dp_inst0_srcf2_data;   
input            frt_dp_inst12_srcf2_match; 
input            frt_dp_inst13_srcf2_match; 
input   [4  :0]  frt_dp_inst1_rel_ereg;     
input   [6  :0]  frt_dp_inst1_rel_freg;     
input   [8  :0]  frt_dp_inst1_srcf0_data;   
input   [8  :0]  frt_dp_inst1_srcf1_data;   
input   [9  :0]  frt_dp_inst1_srcf2_data;   
input            frt_dp_inst23_srcf2_match; 
input   [4  :0]  frt_dp_inst2_rel_ereg;     
input   [6  :0]  frt_dp_inst2_rel_freg;     
input   [8  :0]  frt_dp_inst2_srcf0_data;   
input   [8  :0]  frt_dp_inst2_srcf1_data;   
input   [9  :0]  frt_dp_inst2_srcf2_data;   
input   [4  :0]  frt_dp_inst3_rel_ereg;     
input   [6  :0]  frt_dp_inst3_rel_freg;     
input   [8  :0]  frt_dp_inst3_srcf0_data;   
input   [8  :0]  frt_dp_inst3_srcf1_data;   
input   [9  :0]  frt_dp_inst3_srcf2_data;   
input            pad_yy_icg_scan_en;        
input   [2  :0]  rt_dp_inst01_src_match;    
input   [2  :0]  rt_dp_inst02_src_match;    
input   [2  :0]  rt_dp_inst03_src_match;    
input   [6  :0]  rt_dp_inst0_rel_preg;      
input   [8  :0]  rt_dp_inst0_src0_data;     
input   [8  :0]  rt_dp_inst0_src1_data;     
input   [9  :0]  rt_dp_inst0_src2_data;     
input   [2  :0]  rt_dp_inst12_src_match;    
input   [2  :0]  rt_dp_inst13_src_match;    
input   [6  :0]  rt_dp_inst1_rel_preg;      
input   [8  :0]  rt_dp_inst1_src0_data;     
input   [8  :0]  rt_dp_inst1_src1_data;     
input   [9  :0]  rt_dp_inst1_src2_data;     
input   [2  :0]  rt_dp_inst23_src_match;    
input   [6  :0]  rt_dp_inst2_rel_preg;      
input   [8  :0]  rt_dp_inst2_src0_data;     
input   [8  :0]  rt_dp_inst2_src1_data;     
input   [9  :0]  rt_dp_inst2_src2_data;     
input   [6  :0]  rt_dp_inst3_rel_preg;      
input   [8  :0]  rt_dp_inst3_src0_data;     
input   [8  :0]  rt_dp_inst3_src1_data;     
input   [9  :0]  rt_dp_inst3_src2_data;     
input   [4  :0]  rtu_idu_alloc_ereg0;       
input   [4  :0]  rtu_idu_alloc_ereg1;       
input   [4  :0]  rtu_idu_alloc_ereg2;       
input   [4  :0]  rtu_idu_alloc_ereg3;       
input   [5  :0]  rtu_idu_alloc_freg0;       
input   [5  :0]  rtu_idu_alloc_freg1;       
input   [5  :0]  rtu_idu_alloc_freg2;       
input   [5  :0]  rtu_idu_alloc_freg3;       
input   [6  :0]  rtu_idu_alloc_preg0;       
input   [6  :0]  rtu_idu_alloc_preg1;       
input   [6  :0]  rtu_idu_alloc_preg2;       
input   [6  :0]  rtu_idu_alloc_preg3;       
input   [5  :0]  rtu_idu_alloc_vreg0;       
input   [5  :0]  rtu_idu_alloc_vreg1;       
input   [5  :0]  rtu_idu_alloc_vreg2;       
input   [5  :0]  rtu_idu_alloc_vreg3;       
input            vrt_dp_inst01_srcv2_match; 
input            vrt_dp_inst02_srcv2_match; 
input            vrt_dp_inst03_srcv2_match; 
input   [6  :0]  vrt_dp_inst0_rel_vreg;     
input   [8  :0]  vrt_dp_inst0_srcv0_data;   
input   [8  :0]  vrt_dp_inst0_srcv1_data;   
input   [9  :0]  vrt_dp_inst0_srcv2_data;   
input   [8  :0]  vrt_dp_inst0_srcvm_data;   
input            vrt_dp_inst12_srcv2_match; 
input            vrt_dp_inst13_srcv2_match; 
input   [6  :0]  vrt_dp_inst1_rel_vreg;     
input   [8  :0]  vrt_dp_inst1_srcv0_data;   
input   [8  :0]  vrt_dp_inst1_srcv1_data;   
input   [9  :0]  vrt_dp_inst1_srcv2_data;   
input   [8  :0]  vrt_dp_inst1_srcvm_data;   
input            vrt_dp_inst23_srcv2_match; 
input   [6  :0]  vrt_dp_inst2_rel_vreg;     
input   [8  :0]  vrt_dp_inst2_srcv0_data;   
input   [8  :0]  vrt_dp_inst2_srcv1_data;   
input   [9  :0]  vrt_dp_inst2_srcv2_data;   
input   [8  :0]  vrt_dp_inst2_srcvm_data;   
input   [6  :0]  vrt_dp_inst3_rel_vreg;     
input   [8  :0]  vrt_dp_inst3_srcv0_data;   
input   [8  :0]  vrt_dp_inst3_srcv1_data;   
input   [9  :0]  vrt_dp_inst3_srcv2_data;   
input   [8  :0]  vrt_dp_inst3_srcvm_data;   
output           dp_ctrl_ir_inst0_bar;      
output  [12 :0]  dp_ctrl_ir_inst0_ctrl_info; 
output           dp_ctrl_ir_inst0_dst_vld;  
output           dp_ctrl_ir_inst0_dst_x0;   
output           dp_ctrl_ir_inst0_dste_vld; 
output           dp_ctrl_ir_inst0_dstf_vld; 
output           dp_ctrl_ir_inst0_dstv_vld; 
output  [6  :0]  dp_ctrl_ir_inst0_hpcp_type; 
output           dp_ctrl_ir_inst1_bar;      
output  [12 :0]  dp_ctrl_ir_inst1_ctrl_info; 
output           dp_ctrl_ir_inst1_dst_vld;  
output           dp_ctrl_ir_inst1_dst_x0;   
output           dp_ctrl_ir_inst1_dste_vld; 
output           dp_ctrl_ir_inst1_dstf_vld; 
output           dp_ctrl_ir_inst1_dstv_vld; 
output  [6  :0]  dp_ctrl_ir_inst1_hpcp_type; 
output           dp_ctrl_ir_inst2_bar;      
output  [12 :0]  dp_ctrl_ir_inst2_ctrl_info; 
output           dp_ctrl_ir_inst2_dst_vld;  
output           dp_ctrl_ir_inst2_dst_x0;   
output           dp_ctrl_ir_inst2_dste_vld; 
output           dp_ctrl_ir_inst2_dstf_vld; 
output           dp_ctrl_ir_inst2_dstv_vld; 
output  [6  :0]  dp_ctrl_ir_inst2_hpcp_type; 
output           dp_ctrl_ir_inst3_bar;      
output  [12 :0]  dp_ctrl_ir_inst3_ctrl_info; 
output           dp_ctrl_ir_inst3_dst_vld;  
output           dp_ctrl_ir_inst3_dst_x0;   
output           dp_ctrl_ir_inst3_dste_vld; 
output           dp_ctrl_ir_inst3_dstf_vld; 
output           dp_ctrl_ir_inst3_dstv_vld; 
output  [6  :0]  dp_ctrl_ir_inst3_hpcp_type; 
output  [4  :0]  dp_frt_inst0_dst_ereg;     
output  [5  :0]  dp_frt_inst0_dst_freg;     
output           dp_frt_inst0_dste_vld;     
output  [5  :0]  dp_frt_inst0_dstf_reg;     
output           dp_frt_inst0_dstf_vld;     
output           dp_frt_inst0_fmla;         
output           dp_frt_inst0_fmov;         
output  [5  :0]  dp_frt_inst0_srcf0_reg;    
output           dp_frt_inst0_srcf0_vld;    
output  [5  :0]  dp_frt_inst0_srcf1_reg;    
output           dp_frt_inst0_srcf1_vld;    
output  [5  :0]  dp_frt_inst0_srcf2_reg;    
output           dp_frt_inst0_srcf2_vld;    
output  [4  :0]  dp_frt_inst1_dst_ereg;     
output  [5  :0]  dp_frt_inst1_dst_freg;     
output           dp_frt_inst1_dste_vld;     
output  [5  :0]  dp_frt_inst1_dstf_reg;     
output           dp_frt_inst1_dstf_vld;     
output           dp_frt_inst1_fmla;         
output           dp_frt_inst1_fmov;         
output  [5  :0]  dp_frt_inst1_srcf0_reg;    
output           dp_frt_inst1_srcf0_vld;    
output  [5  :0]  dp_frt_inst1_srcf1_reg;    
output           dp_frt_inst1_srcf1_vld;    
output  [5  :0]  dp_frt_inst1_srcf2_reg;    
output           dp_frt_inst1_srcf2_vld;    
output  [4  :0]  dp_frt_inst2_dst_ereg;     
output  [5  :0]  dp_frt_inst2_dst_freg;     
output           dp_frt_inst2_dste_vld;     
output  [5  :0]  dp_frt_inst2_dstf_reg;     
output           dp_frt_inst2_dstf_vld;     
output           dp_frt_inst2_fmla;         
output           dp_frt_inst2_fmov;         
output  [5  :0]  dp_frt_inst2_srcf0_reg;    
output           dp_frt_inst2_srcf0_vld;    
output  [5  :0]  dp_frt_inst2_srcf1_reg;    
output           dp_frt_inst2_srcf1_vld;    
output  [5  :0]  dp_frt_inst2_srcf2_reg;    
output           dp_frt_inst2_srcf2_vld;    
output  [4  :0]  dp_frt_inst3_dst_ereg;     
output  [5  :0]  dp_frt_inst3_dst_freg;     
output           dp_frt_inst3_dste_vld;     
output  [5  :0]  dp_frt_inst3_dstf_reg;     
output           dp_frt_inst3_dstf_vld;     
output           dp_frt_inst3_fmla;         
output  [5  :0]  dp_frt_inst3_srcf0_reg;    
output           dp_frt_inst3_srcf0_vld;    
output  [5  :0]  dp_frt_inst3_srcf1_reg;    
output           dp_frt_inst3_srcf1_vld;    
output  [5  :0]  dp_frt_inst3_srcf2_reg;    
output           dp_frt_inst3_srcf2_vld;    
output  [3  :0]  dp_ir_inst01_src_match;    
output  [3  :0]  dp_ir_inst02_src_match;    
output  [3  :0]  dp_ir_inst03_src_match;    
output  [270:0]  dp_ir_inst0_data;          
output  [3  :0]  dp_ir_inst12_src_match;    
output  [3  :0]  dp_ir_inst13_src_match;    
output  [270:0]  dp_ir_inst1_data;          
output  [3  :0]  dp_ir_inst23_src_match;    
output  [270:0]  dp_ir_inst2_data;          
output  [270:0]  dp_ir_inst3_data;          
output  [16 :0]  dp_rt_dep_info;            
output  [6  :0]  dp_rt_inst0_dst_preg;      
output  [5  :0]  dp_rt_inst0_dst_reg;       
output           dp_rt_inst0_dst_vld;       
output           dp_rt_inst0_mla;           
output           dp_rt_inst0_mov;           
output  [5  :0]  dp_rt_inst0_src0_reg;      
output           dp_rt_inst0_src0_vld;      
output  [5  :0]  dp_rt_inst0_src1_reg;      
output           dp_rt_inst0_src1_vld;      
output           dp_rt_inst0_src2_vld;      
output  [6  :0]  dp_rt_inst1_dst_preg;      
output  [5  :0]  dp_rt_inst1_dst_reg;       
output           dp_rt_inst1_dst_vld;       
output           dp_rt_inst1_mla;           
output           dp_rt_inst1_mov;           
output  [5  :0]  dp_rt_inst1_src0_reg;      
output           dp_rt_inst1_src0_vld;      
output  [5  :0]  dp_rt_inst1_src1_reg;      
output           dp_rt_inst1_src1_vld;      
output           dp_rt_inst1_src2_vld;      
output  [6  :0]  dp_rt_inst2_dst_preg;      
output  [5  :0]  dp_rt_inst2_dst_reg;       
output           dp_rt_inst2_dst_vld;       
output           dp_rt_inst2_mla;           
output           dp_rt_inst2_mov;           
output  [5  :0]  dp_rt_inst2_src0_reg;      
output           dp_rt_inst2_src0_vld;      
output  [5  :0]  dp_rt_inst2_src1_reg;      
output           dp_rt_inst2_src1_vld;      
output           dp_rt_inst2_src2_vld;      
output  [6  :0]  dp_rt_inst3_dst_preg;      
output  [5  :0]  dp_rt_inst3_dst_reg;       
output           dp_rt_inst3_dst_vld;       
output           dp_rt_inst3_mla;           
output  [5  :0]  dp_rt_inst3_src0_reg;      
output           dp_rt_inst3_src0_vld;      
output  [5  :0]  dp_rt_inst3_src1_reg;      
output           dp_rt_inst3_src1_vld;      
output           dp_rt_inst3_src2_vld;      
output  [5  :0]  dp_vrt_inst0_dst_vreg;     
output  [5  :0]  dp_vrt_inst0_dstv_reg;     
output           dp_vrt_inst0_dstv_vld;     
output  [5  :0]  dp_vrt_inst0_srcv0_reg;    
output           dp_vrt_inst0_srcv0_vld;    
output  [5  :0]  dp_vrt_inst0_srcv1_reg;    
output           dp_vrt_inst0_srcv1_vld;    
output           dp_vrt_inst0_srcv2_vld;    
output           dp_vrt_inst0_srcvm_vld;    
output           dp_vrt_inst0_vmla;         
output  [5  :0]  dp_vrt_inst1_dst_vreg;     
output  [5  :0]  dp_vrt_inst1_dstv_reg;     
output           dp_vrt_inst1_dstv_vld;     
output  [5  :0]  dp_vrt_inst1_srcv0_reg;    
output           dp_vrt_inst1_srcv0_vld;    
output  [5  :0]  dp_vrt_inst1_srcv1_reg;    
output           dp_vrt_inst1_srcv1_vld;    
output           dp_vrt_inst1_srcv2_vld;    
output           dp_vrt_inst1_srcvm_vld;    
output           dp_vrt_inst1_vmla;         
output  [5  :0]  dp_vrt_inst2_dst_vreg;     
output  [5  :0]  dp_vrt_inst2_dstv_reg;     
output           dp_vrt_inst2_dstv_vld;     
output  [5  :0]  dp_vrt_inst2_srcv0_reg;    
output           dp_vrt_inst2_srcv0_vld;    
output  [5  :0]  dp_vrt_inst2_srcv1_reg;    
output           dp_vrt_inst2_srcv1_vld;    
output           dp_vrt_inst2_srcv2_vld;    
output           dp_vrt_inst2_srcvm_vld;    
output           dp_vrt_inst2_vmla;         
output  [5  :0]  dp_vrt_inst3_dst_vreg;     
output  [5  :0]  dp_vrt_inst3_dstv_reg;     
output           dp_vrt_inst3_dstv_vld;     
output  [5  :0]  dp_vrt_inst3_srcv0_reg;    
output           dp_vrt_inst3_srcv0_vld;    
output  [5  :0]  dp_vrt_inst3_srcv1_reg;    
output           dp_vrt_inst3_srcv1_vld;    
output           dp_vrt_inst3_srcv2_vld;    
output           dp_vrt_inst3_srcvm_vld;    
output           dp_vrt_inst3_vmla;         

// &Regs; @28
reg     [16 :0]  ir_dep_info;               
reg     [177:0]  ir_inst0_data;             
reg     [177:0]  ir_inst1_data;             
reg     [177:0]  ir_inst2_data;             
reg     [177:0]  ir_inst3_data;             

// &Wires; @29
wire             cp0_idu_icg_en;            
wire             cp0_yy_clk_en;             
wire             cpurst_b;                  
wire             ctrl_dp_ir_inst0_vld;      
wire             ctrl_id_pipedown_gateclk;  
wire             ctrl_ir_stall;             
wire             dp_ctrl_ir_inst0_bar;      
wire    [12 :0]  dp_ctrl_ir_inst0_ctrl_info; 
wire             dp_ctrl_ir_inst0_dst_vld;  
wire             dp_ctrl_ir_inst0_dst_x0;   
wire             dp_ctrl_ir_inst0_dste_vld; 
wire             dp_ctrl_ir_inst0_dstf_vld; 
wire             dp_ctrl_ir_inst0_dstv_vld; 
wire    [6  :0]  dp_ctrl_ir_inst0_hpcp_type; 
wire             dp_ctrl_ir_inst1_bar;      
wire    [12 :0]  dp_ctrl_ir_inst1_ctrl_info; 
wire             dp_ctrl_ir_inst1_dst_vld;  
wire             dp_ctrl_ir_inst1_dst_x0;   
wire             dp_ctrl_ir_inst1_dste_vld; 
wire             dp_ctrl_ir_inst1_dstf_vld; 
wire             dp_ctrl_ir_inst1_dstv_vld; 
wire    [6  :0]  dp_ctrl_ir_inst1_hpcp_type; 
wire             dp_ctrl_ir_inst2_bar;      
wire    [12 :0]  dp_ctrl_ir_inst2_ctrl_info; 
wire             dp_ctrl_ir_inst2_dst_vld;  
wire             dp_ctrl_ir_inst2_dst_x0;   
wire             dp_ctrl_ir_inst2_dste_vld; 
wire             dp_ctrl_ir_inst2_dstf_vld; 
wire             dp_ctrl_ir_inst2_dstv_vld; 
wire    [6  :0]  dp_ctrl_ir_inst2_hpcp_type; 
wire             dp_ctrl_ir_inst3_bar;      
wire    [12 :0]  dp_ctrl_ir_inst3_ctrl_info; 
wire             dp_ctrl_ir_inst3_dst_vld;  
wire             dp_ctrl_ir_inst3_dst_x0;   
wire             dp_ctrl_ir_inst3_dste_vld; 
wire             dp_ctrl_ir_inst3_dstf_vld; 
wire             dp_ctrl_ir_inst3_dstv_vld; 
wire    [6  :0]  dp_ctrl_ir_inst3_hpcp_type; 
wire    [4  :0]  dp_frt_inst0_dst_ereg;     
wire    [5  :0]  dp_frt_inst0_dst_freg;     
wire             dp_frt_inst0_dste_vld;     
wire    [5  :0]  dp_frt_inst0_dstf_reg;     
wire             dp_frt_inst0_dstf_vld;     
wire             dp_frt_inst0_fmla;         
wire             dp_frt_inst0_fmov;         
wire    [5  :0]  dp_frt_inst0_srcf0_reg;    
wire             dp_frt_inst0_srcf0_vld;    
wire    [5  :0]  dp_frt_inst0_srcf1_reg;    
wire             dp_frt_inst0_srcf1_vld;    
wire    [5  :0]  dp_frt_inst0_srcf2_reg;    
wire             dp_frt_inst0_srcf2_vld;    
wire    [4  :0]  dp_frt_inst1_dst_ereg;     
wire    [5  :0]  dp_frt_inst1_dst_freg;     
wire             dp_frt_inst1_dste_vld;     
wire    [5  :0]  dp_frt_inst1_dstf_reg;     
wire             dp_frt_inst1_dstf_vld;     
wire             dp_frt_inst1_fmla;         
wire             dp_frt_inst1_fmov;         
wire    [5  :0]  dp_frt_inst1_srcf0_reg;    
wire             dp_frt_inst1_srcf0_vld;    
wire    [5  :0]  dp_frt_inst1_srcf1_reg;    
wire             dp_frt_inst1_srcf1_vld;    
wire    [5  :0]  dp_frt_inst1_srcf2_reg;    
wire             dp_frt_inst1_srcf2_vld;    
wire    [4  :0]  dp_frt_inst2_dst_ereg;     
wire    [5  :0]  dp_frt_inst2_dst_freg;     
wire             dp_frt_inst2_dste_vld;     
wire    [5  :0]  dp_frt_inst2_dstf_reg;     
wire             dp_frt_inst2_dstf_vld;     
wire             dp_frt_inst2_fmla;         
wire             dp_frt_inst2_fmov;         
wire    [5  :0]  dp_frt_inst2_srcf0_reg;    
wire             dp_frt_inst2_srcf0_vld;    
wire    [5  :0]  dp_frt_inst2_srcf1_reg;    
wire             dp_frt_inst2_srcf1_vld;    
wire    [5  :0]  dp_frt_inst2_srcf2_reg;    
wire             dp_frt_inst2_srcf2_vld;    
wire    [4  :0]  dp_frt_inst3_dst_ereg;     
wire    [5  :0]  dp_frt_inst3_dst_freg;     
wire             dp_frt_inst3_dste_vld;     
wire    [5  :0]  dp_frt_inst3_dstf_reg;     
wire             dp_frt_inst3_dstf_vld;     
wire             dp_frt_inst3_fmla;         
wire    [5  :0]  dp_frt_inst3_srcf0_reg;    
wire             dp_frt_inst3_srcf0_vld;    
wire    [5  :0]  dp_frt_inst3_srcf1_reg;    
wire             dp_frt_inst3_srcf1_vld;    
wire    [5  :0]  dp_frt_inst3_srcf2_reg;    
wire             dp_frt_inst3_srcf2_vld;    
wire    [16 :0]  dp_id_pipedown_dep_info;   
wire    [177:0]  dp_id_pipedown_inst0_data; 
wire    [177:0]  dp_id_pipedown_inst1_data; 
wire    [177:0]  dp_id_pipedown_inst2_data; 
wire    [177:0]  dp_id_pipedown_inst3_data; 
wire    [3  :0]  dp_ir_inst01_src_match;    
wire    [3  :0]  dp_ir_inst02_src_match;    
wire    [3  :0]  dp_ir_inst03_src_match;    
wire    [270:0]  dp_ir_inst0_data;          
wire    [3  :0]  dp_ir_inst12_src_match;    
wire    [3  :0]  dp_ir_inst13_src_match;    
wire    [270:0]  dp_ir_inst1_data;          
wire    [3  :0]  dp_ir_inst23_src_match;    
wire    [270:0]  dp_ir_inst2_data;          
wire    [270:0]  dp_ir_inst3_data;          
wire    [16 :0]  dp_rt_dep_info;            
wire    [6  :0]  dp_rt_inst0_dst_preg;      
wire    [5  :0]  dp_rt_inst0_dst_reg;       
wire             dp_rt_inst0_dst_vld;       
wire             dp_rt_inst0_mla;           
wire             dp_rt_inst0_mov;           
wire    [5  :0]  dp_rt_inst0_src0_reg;      
wire             dp_rt_inst0_src0_vld;      
wire    [5  :0]  dp_rt_inst0_src1_reg;      
wire             dp_rt_inst0_src1_vld;      
wire             dp_rt_inst0_src2_vld;      
wire    [6  :0]  dp_rt_inst1_dst_preg;      
wire    [5  :0]  dp_rt_inst1_dst_reg;       
wire             dp_rt_inst1_dst_vld;       
wire             dp_rt_inst1_mla;           
wire             dp_rt_inst1_mov;           
wire    [5  :0]  dp_rt_inst1_src0_reg;      
wire             dp_rt_inst1_src0_vld;      
wire    [5  :0]  dp_rt_inst1_src1_reg;      
wire             dp_rt_inst1_src1_vld;      
wire             dp_rt_inst1_src2_vld;      
wire    [6  :0]  dp_rt_inst2_dst_preg;      
wire    [5  :0]  dp_rt_inst2_dst_reg;       
wire             dp_rt_inst2_dst_vld;       
wire             dp_rt_inst2_mla;           
wire             dp_rt_inst2_mov;           
wire    [5  :0]  dp_rt_inst2_src0_reg;      
wire             dp_rt_inst2_src0_vld;      
wire    [5  :0]  dp_rt_inst2_src1_reg;      
wire             dp_rt_inst2_src1_vld;      
wire             dp_rt_inst2_src2_vld;      
wire    [6  :0]  dp_rt_inst3_dst_preg;      
wire    [5  :0]  dp_rt_inst3_dst_reg;       
wire             dp_rt_inst3_dst_vld;       
wire             dp_rt_inst3_mla;           
wire    [5  :0]  dp_rt_inst3_src0_reg;      
wire             dp_rt_inst3_src0_vld;      
wire    [5  :0]  dp_rt_inst3_src1_reg;      
wire             dp_rt_inst3_src1_vld;      
wire             dp_rt_inst3_src2_vld;      
wire    [5  :0]  dp_vrt_inst0_dst_vreg;     
wire    [5  :0]  dp_vrt_inst0_dstv_reg;     
wire             dp_vrt_inst0_dstv_vld;     
wire    [5  :0]  dp_vrt_inst0_srcv0_reg;    
wire             dp_vrt_inst0_srcv0_vld;    
wire    [5  :0]  dp_vrt_inst0_srcv1_reg;    
wire             dp_vrt_inst0_srcv1_vld;    
wire             dp_vrt_inst0_srcv2_vld;    
wire             dp_vrt_inst0_srcvm_vld;    
wire             dp_vrt_inst0_vmla;         
wire    [5  :0]  dp_vrt_inst1_dst_vreg;     
wire    [5  :0]  dp_vrt_inst1_dstv_reg;     
wire             dp_vrt_inst1_dstv_vld;     
wire    [5  :0]  dp_vrt_inst1_srcv0_reg;    
wire             dp_vrt_inst1_srcv0_vld;    
wire    [5  :0]  dp_vrt_inst1_srcv1_reg;    
wire             dp_vrt_inst1_srcv1_vld;    
wire             dp_vrt_inst1_srcv2_vld;    
wire             dp_vrt_inst1_srcvm_vld;    
wire             dp_vrt_inst1_vmla;         
wire    [5  :0]  dp_vrt_inst2_dst_vreg;     
wire    [5  :0]  dp_vrt_inst2_dstv_reg;     
wire             dp_vrt_inst2_dstv_vld;     
wire    [5  :0]  dp_vrt_inst2_srcv0_reg;    
wire             dp_vrt_inst2_srcv0_vld;    
wire    [5  :0]  dp_vrt_inst2_srcv1_reg;    
wire             dp_vrt_inst2_srcv1_vld;    
wire             dp_vrt_inst2_srcv2_vld;    
wire             dp_vrt_inst2_srcvm_vld;    
wire             dp_vrt_inst2_vmla;         
wire    [5  :0]  dp_vrt_inst3_dst_vreg;     
wire    [5  :0]  dp_vrt_inst3_dstv_reg;     
wire             dp_vrt_inst3_dstv_vld;     
wire    [5  :0]  dp_vrt_inst3_srcv0_reg;    
wire             dp_vrt_inst3_srcv0_vld;    
wire    [5  :0]  dp_vrt_inst3_srcv1_reg;    
wire             dp_vrt_inst3_srcv1_vld;    
wire             dp_vrt_inst3_srcv2_vld;    
wire             dp_vrt_inst3_srcvm_vld;    
wire             dp_vrt_inst3_vmla;         
wire             forever_cpuclk;            
wire             frt_dp_inst01_srcf2_match; 
wire             frt_dp_inst02_srcf2_match; 
wire             frt_dp_inst03_srcf2_match; 
wire    [4  :0]  frt_dp_inst0_rel_ereg;     
wire    [6  :0]  frt_dp_inst0_rel_freg;     
wire    [8  :0]  frt_dp_inst0_srcf0_data;   
wire    [8  :0]  frt_dp_inst0_srcf1_data;   
wire    [9  :0]  frt_dp_inst0_srcf2_data;   
wire             frt_dp_inst12_srcf2_match; 
wire             frt_dp_inst13_srcf2_match; 
wire    [4  :0]  frt_dp_inst1_rel_ereg;     
wire    [6  :0]  frt_dp_inst1_rel_freg;     
wire    [8  :0]  frt_dp_inst1_srcf0_data;   
wire    [8  :0]  frt_dp_inst1_srcf1_data;   
wire    [9  :0]  frt_dp_inst1_srcf2_data;   
wire             frt_dp_inst23_srcf2_match; 
wire    [4  :0]  frt_dp_inst2_rel_ereg;     
wire    [6  :0]  frt_dp_inst2_rel_freg;     
wire    [8  :0]  frt_dp_inst2_srcf0_data;   
wire    [8  :0]  frt_dp_inst2_srcf1_data;   
wire    [9  :0]  frt_dp_inst2_srcf2_data;   
wire    [4  :0]  frt_dp_inst3_rel_ereg;     
wire    [6  :0]  frt_dp_inst3_rel_freg;     
wire    [8  :0]  frt_dp_inst3_srcf0_data;   
wire    [8  :0]  frt_dp_inst3_srcf1_data;   
wire    [9  :0]  frt_dp_inst3_srcf2_data;   
wire             ir_inst0_alu_short;        
wire             ir_inst0_bar;              
wire    [3  :0]  ir_inst0_bar_type;         
wire             ir_inst0_csr;              
wire    [4  :0]  ir_inst0_dst_ereg;         
wire    [5  :0]  ir_inst0_dst_freg;         
wire    [6  :0]  ir_inst0_dst_preg;         
wire    [5  :0]  ir_inst0_dst_vreg;         
wire             ir_inst0_dstv_imp;         
wire             ir_inst0_ecall;            
wire             ir_inst0_fp;               
wire             ir_inst0_illegal;          
wire             ir_inst0_lch_preg;         
wire             ir_inst0_load;             
wire             ir_inst0_mfvr;             
wire             ir_inst0_mtvr;             
wire    [31 :0]  ir_inst0_opcode;           
wire             ir_inst0_pcall;            
wire             ir_inst0_pcfifo;           
wire             ir_inst0_rts;              
wire             ir_inst0_store;            
wire             ir_inst0_str;              
wire             ir_inst0_sync;             
wire             ir_inst0_type_alu;         
wire             ir_inst0_type_staddr;      
wire             ir_inst0_type_vload;       
wire             ir_inst0_unit_stride;      
wire             ir_inst0_vamo;             
wire             ir_inst0_vdiv;             
wire             ir_inst0_vec;              
wire             ir_inst0_viq_srcv12_switch; 
wire             ir_inst0_vmla_short;       
wire    [2  :0]  ir_inst0_vmla_type;        
wire             ir_inst0_vmul;             
wire             ir_inst0_vmul_unsplit;     
wire             ir_inst0_vsetvl;           
wire             ir_inst0_vsetvli;          
wire    [2  :0]  ir_inst0_vsew;             
wire             ir_inst1_alu_short;        
wire             ir_inst1_bar;              
wire    [3  :0]  ir_inst1_bar_type;         
wire             ir_inst1_csr;              
wire    [4  :0]  ir_inst1_dst_ereg;         
wire    [5  :0]  ir_inst1_dst_freg;         
wire    [6  :0]  ir_inst1_dst_preg;         
wire    [5  :0]  ir_inst1_dst_vreg;         
wire             ir_inst1_dstv_imp;         
wire             ir_inst1_ecall;            
wire             ir_inst1_fp;               
wire             ir_inst1_illegal;          
wire             ir_inst1_lch_preg;         
wire             ir_inst1_load;             
wire             ir_inst1_mfvr;             
wire             ir_inst1_mtvr;             
wire    [31 :0]  ir_inst1_opcode;           
wire             ir_inst1_pcall;            
wire             ir_inst1_pcfifo;           
wire             ir_inst1_rts;              
wire             ir_inst1_store;            
wire             ir_inst1_str;              
wire             ir_inst1_sync;             
wire             ir_inst1_type_alu;         
wire             ir_inst1_type_staddr;      
wire             ir_inst1_type_vload;       
wire             ir_inst1_unit_stride;      
wire             ir_inst1_vamo;             
wire             ir_inst1_vdiv;             
wire             ir_inst1_vec;              
wire             ir_inst1_viq_srcv12_switch; 
wire             ir_inst1_vmla_short;       
wire    [2  :0]  ir_inst1_vmla_type;        
wire             ir_inst1_vmul;             
wire             ir_inst1_vmul_unsplit;     
wire             ir_inst1_vsetvl;           
wire             ir_inst1_vsetvli;          
wire    [2  :0]  ir_inst1_vsew;             
wire             ir_inst2_alu_short;        
wire             ir_inst2_bar;              
wire    [3  :0]  ir_inst2_bar_type;         
wire             ir_inst2_csr;              
wire    [4  :0]  ir_inst2_dst_ereg;         
wire    [5  :0]  ir_inst2_dst_freg;         
wire    [6  :0]  ir_inst2_dst_preg;         
wire    [5  :0]  ir_inst2_dst_vreg;         
wire             ir_inst2_dstv_imp;         
wire             ir_inst2_ecall;            
wire             ir_inst2_fp;               
wire             ir_inst2_illegal;          
wire             ir_inst2_lch_preg;         
wire             ir_inst2_load;             
wire             ir_inst2_mfvr;             
wire             ir_inst2_mtvr;             
wire    [31 :0]  ir_inst2_opcode;           
wire             ir_inst2_pcall;            
wire             ir_inst2_pcfifo;           
wire             ir_inst2_rts;              
wire             ir_inst2_store;            
wire             ir_inst2_str;              
wire             ir_inst2_sync;             
wire             ir_inst2_type_alu;         
wire             ir_inst2_type_staddr;      
wire             ir_inst2_type_vload;       
wire             ir_inst2_unit_stride;      
wire             ir_inst2_vamo;             
wire             ir_inst2_vdiv;             
wire             ir_inst2_vec;              
wire             ir_inst2_viq_srcv12_switch; 
wire             ir_inst2_vmla_short;       
wire    [2  :0]  ir_inst2_vmla_type;        
wire             ir_inst2_vmul;             
wire             ir_inst2_vmul_unsplit;     
wire             ir_inst2_vsetvl;           
wire             ir_inst2_vsetvli;          
wire    [2  :0]  ir_inst2_vsew;             
wire             ir_inst3_alu_short;        
wire             ir_inst3_bar;              
wire    [3  :0]  ir_inst3_bar_type;         
wire             ir_inst3_csr;              
wire    [4  :0]  ir_inst3_dst_ereg;         
wire    [5  :0]  ir_inst3_dst_freg;         
wire    [6  :0]  ir_inst3_dst_preg;         
wire    [5  :0]  ir_inst3_dst_vreg;         
wire             ir_inst3_dstv_imp;         
wire             ir_inst3_ecall;            
wire             ir_inst3_fp;               
wire             ir_inst3_illegal;          
wire             ir_inst3_lch_preg;         
wire             ir_inst3_load;             
wire             ir_inst3_mfvr;             
wire             ir_inst3_mtvr;             
wire    [31 :0]  ir_inst3_opcode;           
wire             ir_inst3_pcall;            
wire             ir_inst3_pcfifo;           
wire             ir_inst3_rts;              
wire             ir_inst3_store;            
wire             ir_inst3_str;              
wire             ir_inst3_sync;             
wire             ir_inst3_type_alu;         
wire             ir_inst3_type_staddr;      
wire             ir_inst3_type_vload;       
wire             ir_inst3_unit_stride;      
wire             ir_inst3_vamo;             
wire             ir_inst3_vdiv;             
wire             ir_inst3_vec;              
wire             ir_inst3_viq_srcv12_switch; 
wire             ir_inst3_vmla_short;       
wire    [2  :0]  ir_inst3_vmla_type;        
wire             ir_inst3_vmul;             
wire             ir_inst3_vmul_unsplit;     
wire             ir_inst3_vsetvl;           
wire             ir_inst3_vsetvli;          
wire    [2  :0]  ir_inst3_vsew;             
wire             ir_inst_clk;               
wire             ir_inst_clk_en;            
wire    [6  :0]  ir_pipedown_inst0_dst_preg; 
wire    [6  :0]  ir_pipedown_inst1_dst_preg; 
wire    [6  :0]  ir_pipedown_inst2_dst_preg; 
wire    [6  :0]  ir_pipedown_inst3_dst_preg; 
wire    [4  :0]  ir_rt_inst0_dst_ereg;      
wire    [6  :0]  ir_rt_inst0_dst_vreg;      
wire             ir_rt_inst0_dste_vld;      
wire    [4  :0]  ir_rt_inst0_dstv_reg;      
wire             ir_rt_inst0_dstv_vld;      
wire    [4  :0]  ir_rt_inst0_rel_ereg;      
wire    [6  :0]  ir_rt_inst0_rel_vreg;      
wire    [8  :0]  ir_rt_inst0_srcv0_data;    
wire             ir_rt_inst0_srcv0_vld;     
wire    [8  :0]  ir_rt_inst0_srcv1_data;    
wire             ir_rt_inst0_srcv1_vld;     
wire    [9  :0]  ir_rt_inst0_srcv2_data;    
wire             ir_rt_inst0_srcv2_vld;     
wire    [8  :0]  ir_rt_inst0_srcvm_data;    
wire             ir_rt_inst0_srcvm_vld;     
wire             ir_rt_inst0_vmla;          
wire    [4  :0]  ir_rt_inst1_dst_ereg;      
wire    [6  :0]  ir_rt_inst1_dst_vreg;      
wire             ir_rt_inst1_dste_vld;      
wire    [4  :0]  ir_rt_inst1_dstv_reg;      
wire             ir_rt_inst1_dstv_vld;      
wire    [4  :0]  ir_rt_inst1_rel_ereg;      
wire    [6  :0]  ir_rt_inst1_rel_vreg;      
wire    [8  :0]  ir_rt_inst1_srcv0_data;    
wire             ir_rt_inst1_srcv0_vld;     
wire    [8  :0]  ir_rt_inst1_srcv1_data;    
wire             ir_rt_inst1_srcv1_vld;     
wire    [9  :0]  ir_rt_inst1_srcv2_data;    
wire             ir_rt_inst1_srcv2_vld;     
wire    [8  :0]  ir_rt_inst1_srcvm_data;    
wire             ir_rt_inst1_srcvm_vld;     
wire             ir_rt_inst1_vmla;          
wire    [4  :0]  ir_rt_inst2_dst_ereg;      
wire    [6  :0]  ir_rt_inst2_dst_vreg;      
wire             ir_rt_inst2_dste_vld;      
wire    [4  :0]  ir_rt_inst2_dstv_reg;      
wire             ir_rt_inst2_dstv_vld;      
wire    [4  :0]  ir_rt_inst2_rel_ereg;      
wire    [6  :0]  ir_rt_inst2_rel_vreg;      
wire    [8  :0]  ir_rt_inst2_srcv0_data;    
wire             ir_rt_inst2_srcv0_vld;     
wire    [8  :0]  ir_rt_inst2_srcv1_data;    
wire             ir_rt_inst2_srcv1_vld;     
wire    [9  :0]  ir_rt_inst2_srcv2_data;    
wire             ir_rt_inst2_srcv2_vld;     
wire    [8  :0]  ir_rt_inst2_srcvm_data;    
wire             ir_rt_inst2_srcvm_vld;     
wire             ir_rt_inst2_vmla;          
wire    [4  :0]  ir_rt_inst3_dst_ereg;      
wire    [6  :0]  ir_rt_inst3_dst_vreg;      
wire             ir_rt_inst3_dste_vld;      
wire    [4  :0]  ir_rt_inst3_dstv_reg;      
wire             ir_rt_inst3_dstv_vld;      
wire    [4  :0]  ir_rt_inst3_rel_ereg;      
wire    [6  :0]  ir_rt_inst3_rel_vreg;      
wire    [8  :0]  ir_rt_inst3_srcv0_data;    
wire             ir_rt_inst3_srcv0_vld;     
wire    [8  :0]  ir_rt_inst3_srcv1_data;    
wire             ir_rt_inst3_srcv1_vld;     
wire    [9  :0]  ir_rt_inst3_srcv2_data;    
wire             ir_rt_inst3_srcv2_vld;     
wire    [8  :0]  ir_rt_inst3_srcvm_data;    
wire             ir_rt_inst3_srcvm_vld;     
wire             ir_rt_inst3_vmla;          
wire             pad_yy_icg_scan_en;        
wire    [2  :0]  rt_dp_inst01_src_match;    
wire    [2  :0]  rt_dp_inst02_src_match;    
wire    [2  :0]  rt_dp_inst03_src_match;    
wire    [6  :0]  rt_dp_inst0_rel_preg;      
wire    [8  :0]  rt_dp_inst0_src0_data;     
wire    [8  :0]  rt_dp_inst0_src1_data;     
wire    [9  :0]  rt_dp_inst0_src2_data;     
wire    [2  :0]  rt_dp_inst12_src_match;    
wire    [2  :0]  rt_dp_inst13_src_match;    
wire    [6  :0]  rt_dp_inst1_rel_preg;      
wire    [8  :0]  rt_dp_inst1_src0_data;     
wire    [8  :0]  rt_dp_inst1_src1_data;     
wire    [9  :0]  rt_dp_inst1_src2_data;     
wire    [2  :0]  rt_dp_inst23_src_match;    
wire    [6  :0]  rt_dp_inst2_rel_preg;      
wire    [8  :0]  rt_dp_inst2_src0_data;     
wire    [8  :0]  rt_dp_inst2_src1_data;     
wire    [9  :0]  rt_dp_inst2_src2_data;     
wire    [6  :0]  rt_dp_inst3_rel_preg;      
wire    [8  :0]  rt_dp_inst3_src0_data;     
wire    [8  :0]  rt_dp_inst3_src1_data;     
wire    [9  :0]  rt_dp_inst3_src2_data;     
wire    [4  :0]  rtu_idu_alloc_ereg0;       
wire    [4  :0]  rtu_idu_alloc_ereg1;       
wire    [4  :0]  rtu_idu_alloc_ereg2;       
wire    [4  :0]  rtu_idu_alloc_ereg3;       
wire    [5  :0]  rtu_idu_alloc_freg0;       
wire    [5  :0]  rtu_idu_alloc_freg1;       
wire    [5  :0]  rtu_idu_alloc_freg2;       
wire    [5  :0]  rtu_idu_alloc_freg3;       
wire    [6  :0]  rtu_idu_alloc_preg0;       
wire    [6  :0]  rtu_idu_alloc_preg1;       
wire    [6  :0]  rtu_idu_alloc_preg2;       
wire    [6  :0]  rtu_idu_alloc_preg3;       
wire    [5  :0]  rtu_idu_alloc_vreg0;       
wire    [5  :0]  rtu_idu_alloc_vreg1;       
wire    [5  :0]  rtu_idu_alloc_vreg2;       
wire    [5  :0]  rtu_idu_alloc_vreg3;       
wire             vrt_dp_inst01_srcv2_match; 
wire             vrt_dp_inst02_srcv2_match; 
wire             vrt_dp_inst03_srcv2_match; 
wire    [6  :0]  vrt_dp_inst0_rel_vreg;     
wire    [8  :0]  vrt_dp_inst0_srcv0_data;   
wire    [8  :0]  vrt_dp_inst0_srcv1_data;   
wire    [9  :0]  vrt_dp_inst0_srcv2_data;   
wire    [8  :0]  vrt_dp_inst0_srcvm_data;   
wire             vrt_dp_inst12_srcv2_match; 
wire             vrt_dp_inst13_srcv2_match; 
wire    [6  :0]  vrt_dp_inst1_rel_vreg;     
wire    [8  :0]  vrt_dp_inst1_srcv0_data;   
wire    [8  :0]  vrt_dp_inst1_srcv1_data;   
wire    [9  :0]  vrt_dp_inst1_srcv2_data;   
wire    [8  :0]  vrt_dp_inst1_srcvm_data;   
wire             vrt_dp_inst23_srcv2_match; 
wire    [6  :0]  vrt_dp_inst2_rel_vreg;     
wire    [8  :0]  vrt_dp_inst2_srcv0_data;   
wire    [8  :0]  vrt_dp_inst2_srcv1_data;   
wire    [9  :0]  vrt_dp_inst2_srcv2_data;   
wire    [8  :0]  vrt_dp_inst2_srcvm_data;   
wire    [6  :0]  vrt_dp_inst3_rel_vreg;     
wire    [8  :0]  vrt_dp_inst3_srcv0_data;   
wire    [8  :0]  vrt_dp_inst3_srcv1_data;   
wire    [9  :0]  vrt_dp_inst3_srcv2_data;   
wire    [8  :0]  vrt_dp_inst3_srcvm_data;   



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                 IR data path parameters
//----------------------------------------------------------
parameter IR_WIDTH            = 178;

parameter IR_VL_PRED          = 177;
parameter IR_VL               = 176;
parameter IR_VMB              = 168;
parameter IR_PC               = 167;
parameter IR_VSEW             = 152;
parameter IR_VLMUL            = 149;
parameter IR_FMLA             = 147;
parameter IR_SPLIT_NUM        = 146;
parameter IR_NO_SPEC          = 139;
parameter IR_MLA              = 138;
parameter IR_DST_X0           = 137;
parameter IR_ILLEGAL          = 136;
parameter IR_SPLIT_LAST       = 135;
parameter IR_VMLA             = 134;
parameter IR_IID_PLUS         = 133;
parameter IR_BKPTB_INST       = 129;
parameter IR_BKPTA_INST       = 128;
parameter IR_FMOV             = 127;
parameter IR_MOV              = 126;
parameter IR_EXPT             = 125;
parameter IR_LENGTH           = 118;
parameter IR_INTMASK          = 117;
parameter IR_SPLIT            = 116;
parameter IR_INST_TYPE        = 115;
parameter IR_DSTV_REG         = 105;
parameter IR_DSTV_VLD         = 99;
parameter IR_SRCVM_VLD        = 98;
parameter IR_SRCV2_VLD        = 97;
parameter IR_SRCV1_REG        = 96;
parameter IR_SRCV1_VLD        = 90;
parameter IR_SRCV0_REG        = 89;
parameter IR_SRCV0_VLD        = 83;
parameter IR_DSTE_VLD         = 82;
parameter IR_DSTF_REG         = 81;
parameter IR_DSTF_VLD         = 75;
parameter IR_SRCF2_REG        = 74;
parameter IR_SRCF2_VLD        = 68;
parameter IR_SRCF1_REG        = 67;
parameter IR_SRCF1_VLD        = 61;
parameter IR_SRCF0_REG        = 60;
parameter IR_SRCF0_VLD        = 54;
parameter IR_DST_REG          = 53;
parameter IR_DST_VLD          = 47;
parameter IR_SRC2_VLD         = 46;
parameter IR_SRC1_REG         = 45;
parameter IR_SRC1_VLD         = 39;
parameter IR_SRC0_REG         = 38;
parameter IR_SRC0_VLD         = 32;
parameter IR_OPCODE           = 31;

//----------------------------------------------------------
//                   Dep info parameters
//----------------------------------------------------------
parameter DEP_WIDTH             = 17;

parameter DEP_INST01_SRC0_MASK  = 0;
parameter DEP_INST01_SRC1_MASK  = 1;
parameter DEP_INST12_SRC0_MASK  = 2;
parameter DEP_INST12_SRC1_MASK  = 3;
parameter DEP_INST23_SRC0_MASK  = 4;
parameter DEP_INST23_SRC1_MASK  = 5;
parameter DEP_INST02_PREG_MASK  = 6;
parameter DEP_INST13_PREG_MASK  = 7;
parameter DEP_INST01_VREG_MASK  = 8;
parameter DEP_INST12_VREG_MASK  = 9;
parameter DEP_INST23_VREG_MASK  = 10;
parameter DEP_INST13_VREG_MASK  = 11;
parameter DEP_INST02_VREG_MASK  = 12;
parameter DEP_INST03_VREG_MASK  = 13;
parameter DEP_INST01_SRCV1_MASK = 14;
parameter DEP_INST12_SRCV1_MASK = 15;
parameter DEP_INST23_SRCV1_MASK = 16;

//----------------------------------------------------------
//                 IS ctrl path parameters
//----------------------------------------------------------
parameter IS_CTRL_WIDTH       = 13;

parameter IS_CTRL_VMB         = 12;
parameter IS_CTRL_PIPE7       = 11;
parameter IS_CTRL_PIPE6       = 10;
parameter IS_CTRL_PIPE67      = 9;
parameter IS_CTRL_SPECIAL     = 8;
parameter IS_CTRL_STADDR      = 7;
parameter IS_CTRL_INTMASK     = 6;
parameter IS_CTRL_SPLIT       = 5;
parameter IS_CTRL_LSU         = 4;
parameter IS_CTRL_BJU         = 3;
parameter IS_CTRL_DIV         = 2;
parameter IS_CTRL_MULT        = 1;
parameter IS_CTRL_ALU         = 0;

//----------------------------------------------------------
//                 IR/IS pipeline select
//----------------------------------------------------------
parameter IS_WIDTH             = 271;

parameter IS_VL_PRED           = 270;
parameter IS_VL                = 269;
parameter IS_LCH_PREG          = 261;
parameter IS_VAMO              = 260;
parameter IS_UNIT_STRIDE       = 259;
parameter IS_VMB               = 258;
parameter IS_DSTV_IMP          = 257;
parameter IS_VIQ_SRCV12_SWITCH = 256;
parameter IS_VSETVL            = 255;
parameter IS_VSETVLI           = 254;
parameter IS_VSEW              = 253;
parameter IS_VLMUL             = 250;
parameter IS_VMUL              = 248;
parameter IS_VMUL_UNSPLIT      = 247;
parameter IS_VMLA_SHORT        = 246;
parameter IS_VMLA_TYPE         = 245;
parameter IS_SPLIT_NUM         = 242;
parameter IS_NO_SPEC           = 235;
parameter IS_ALU_SHORT         = 234;
parameter IS_MLA               = 233;
parameter IS_STR               = 232;
parameter IS_SPLIT_LAST        = 231;
parameter IS_MFVR              = 230;
parameter IS_MTVR              = 229;
parameter IS_VMLA              = 228;
parameter IS_VDIV              = 227;
parameter IS_PIPE7             = 226;
parameter IS_PIPE6             = 225;
parameter IS_PIPE67            = 224;
parameter IS_IID_PLUS          = 223;
parameter IS_BKPTB_INST        = 219;
parameter IS_BKPTA_INST        = 218;
parameter IS_EXPT              = 217;
parameter IS_RTS               = 210;
parameter IS_SPECIAL           = 209;
parameter IS_LSU               = 208;
parameter IS_DIV               = 207;
parameter IS_MULT              = 206;
parameter IS_INTMASK           = 205;
parameter IS_SPLIT             = 204;
parameter IS_LENGTH            = 203;
parameter IS_PCFIFO            = 202;
parameter IS_PCALL             = 201;
parameter IS_BJU               = 200;
parameter IS_LSU_PC            = 199;
parameter IS_BAR_TYPE          = 184;
parameter IS_BAR               = 180;
parameter IS_STADDR            = 179;
parameter IS_STORE             = 178;
parameter IS_LOAD              = 177;
parameter IS_ALU               = 176;
parameter IS_DST_REL_EREG      = 175;
parameter IS_DST_EREG          = 170;
parameter IS_DST_REL_VREG      = 165;
parameter IS_DST_VREG          = 158;
parameter IS_DSTV_REG          = 151;
parameter IS_SRCVM_LSU_MATCH   = 146;
parameter IS_SRCVM_BP_RDY      = 145;
parameter IS_SRCVM_DATA        = 143;
parameter IS_SRCVM_VREG        = 143;
parameter IS_SRCVM_WB          = 136;
parameter IS_SRCV2_LSU_MATCH   = 134;
parameter IS_SRCV2_BP_RDY      = 133;
parameter IS_SRCV2_DATA        = 131;
parameter IS_SRCV2_VREG        = 130;
parameter IS_SRCV2_WB          = 123;
parameter IS_SRCV1_LSU_MATCH   = 121;
parameter IS_SRCV1_BP_RDY      = 120;
parameter IS_SRCV1_DATA        = 118;
parameter IS_SRCV1_VREG        = 118;
parameter IS_SRCV1_WB          = 111;
parameter IS_SRCV0_LSU_MATCH   = 109;
parameter IS_SRCV0_BP_RDY      = 108;
parameter IS_SRCV0_DATA        = 106;
parameter IS_SRCV0_VREG        = 106;
parameter IS_SRCV0_WB          = 99;
parameter IS_DSTE_VLD          = 97;
parameter IS_DSTV_VLD          = 96;
parameter IS_SRCVM_VLD         = 95;
parameter IS_SRCV2_VLD         = 94;
parameter IS_SRCV1_VLD         = 93;
parameter IS_SRCV0_VLD         = 92;
parameter IS_DST_REL_PREG      = 91;
parameter IS_DST_PREG          = 84;
parameter IS_DST_REG           = 77;
parameter IS_SRC2_LSU_MATCH    = 72;
parameter IS_SRC2_BP_RDY       = 71;
parameter IS_SRC2_DATA         = 69;
parameter IS_SRC2_PREG         = 68;
parameter IS_SRC2_WB           = 61;
parameter IS_SRC1_LSU_MATCH    = 59;
parameter IS_SRC1_BP_RDY       = 58;
parameter IS_SRC1_DATA         = 56;
parameter IS_SRC1_PREG         = 56;
parameter IS_SRC1_WB           = 49;
parameter IS_SRC0_LSU_MATCH    = 47;
parameter IS_SRC0_BP_RDY       = 46;
parameter IS_SRC0_DATA         = 44;
parameter IS_SRC0_PREG         = 44;
parameter IS_SRC0_WB           = 37;
parameter IS_DST_VLD           = 35;
parameter IS_SRC2_VLD          = 34;
parameter IS_SRC1_VLD          = 33;
parameter IS_SRC0_VLD          = 32;
parameter IS_OPCODE            = 31;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign ir_inst_clk_en = ctrl_id_pipedown_gateclk
                        || ctrl_dp_ir_inst0_vld;
// &Instance("gated_clk_cell", "x_ir_inst_gated_clk"); @248
gated_clk_cell  x_ir_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ir_inst_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ir_inst_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @249
//          .external_en (1'b0), @250
//          .global_en   (cp0_yy_clk_en), @251
//          .module_en   (cp0_idu_icg_en), @252
//          .local_en    (ir_inst_clk_en), @253
//          .clk_out     (ir_inst_clk)); @254

//==========================================================
//                IR/IS pipeline registers
//==========================================================
always @(posedge ir_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ir_inst0_data[IR_WIDTH-1:0] <= {IR_WIDTH{1'b0}};
    ir_inst1_data[IR_WIDTH-1:0] <= {IR_WIDTH{1'b0}};
    ir_inst2_data[IR_WIDTH-1:0] <= {IR_WIDTH{1'b0}};
    ir_inst3_data[IR_WIDTH-1:0] <= {IR_WIDTH{1'b0}};
    ir_dep_info[DEP_WIDTH-1:0]  <= {DEP_WIDTH{1'b0}};
  end
  else if(!ctrl_ir_stall) begin
    ir_inst0_data[IR_WIDTH-1:0] <= dp_id_pipedown_inst0_data[IR_WIDTH-1:0];
    ir_inst1_data[IR_WIDTH-1:0] <= dp_id_pipedown_inst1_data[IR_WIDTH-1:0];
    ir_inst2_data[IR_WIDTH-1:0] <= dp_id_pipedown_inst2_data[IR_WIDTH-1:0];
    ir_inst3_data[IR_WIDTH-1:0] <= dp_id_pipedown_inst3_data[IR_WIDTH-1:0];
    ir_dep_info[DEP_WIDTH-1:0]  <= dp_id_pipedown_dep_info[DEP_WIDTH-1:0];
  end
  else begin
    ir_inst0_data[IR_WIDTH-1:0] <= ir_inst0_data[IR_WIDTH-1:0];
    ir_inst1_data[IR_WIDTH-1:0] <= ir_inst1_data[IR_WIDTH-1:0];
    ir_inst2_data[IR_WIDTH-1:0] <= ir_inst2_data[IR_WIDTH-1:0];
    ir_inst3_data[IR_WIDTH-1:0] <= ir_inst3_data[IR_WIDTH-1:0];
    ir_dep_info[DEP_WIDTH-1:0]  <= ir_dep_info[DEP_WIDTH-1:0];
  end
end

//==========================================================
//                Prepare IR control data
//==========================================================
assign dp_ctrl_ir_inst0_dst_x0      = ir_inst0_data[IR_DST_X0];
assign dp_ctrl_ir_inst1_dst_x0      = ir_inst1_data[IR_DST_X0];
assign dp_ctrl_ir_inst2_dst_x0      = ir_inst2_data[IR_DST_X0];
assign dp_ctrl_ir_inst3_dst_x0      = ir_inst3_data[IR_DST_X0];

assign dp_ctrl_ir_inst0_dst_vld     = ir_inst0_data[IR_DST_VLD];
assign dp_ctrl_ir_inst1_dst_vld     = ir_inst1_data[IR_DST_VLD];
assign dp_ctrl_ir_inst2_dst_vld     = ir_inst2_data[IR_DST_VLD];
assign dp_ctrl_ir_inst3_dst_vld     = ir_inst3_data[IR_DST_VLD];
                                                       
assign dp_ctrl_ir_inst0_dstv_vld    = ir_inst0_data[IR_DSTV_VLD];
assign dp_ctrl_ir_inst1_dstv_vld    = ir_inst1_data[IR_DSTV_VLD];
assign dp_ctrl_ir_inst2_dstv_vld    = ir_inst2_data[IR_DSTV_VLD];
assign dp_ctrl_ir_inst3_dstv_vld    = ir_inst3_data[IR_DSTV_VLD];
                                                       
assign dp_ctrl_ir_inst0_dste_vld    = ir_inst0_data[IR_DSTE_VLD];
assign dp_ctrl_ir_inst1_dste_vld    = ir_inst1_data[IR_DSTE_VLD];
assign dp_ctrl_ir_inst2_dste_vld    = ir_inst2_data[IR_DSTE_VLD];
assign dp_ctrl_ir_inst3_dste_vld    = ir_inst3_data[IR_DSTE_VLD];
                                                       
assign dp_ctrl_ir_inst0_dstf_vld    = ir_inst0_data[IR_DSTF_VLD];
assign dp_ctrl_ir_inst1_dstf_vld    = ir_inst1_data[IR_DSTF_VLD];
assign dp_ctrl_ir_inst2_dstf_vld    = ir_inst2_data[IR_DSTF_VLD];
assign dp_ctrl_ir_inst3_dstf_vld    = ir_inst3_data[IR_DSTF_VLD];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_ALU]     = ir_inst0_data[IR_INST_TYPE-9];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_ALU]     = ir_inst1_data[IR_INST_TYPE-9];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_ALU]     = ir_inst2_data[IR_INST_TYPE-9];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_ALU]     = ir_inst3_data[IR_INST_TYPE-9];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_MULT]    = ir_inst0_data[IR_INST_TYPE-7];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_MULT]    = ir_inst1_data[IR_INST_TYPE-7];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_MULT]    = ir_inst2_data[IR_INST_TYPE-7];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_MULT]    = ir_inst3_data[IR_INST_TYPE-7];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_DIV]     = ir_inst0_data[IR_INST_TYPE-6];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_DIV]     = ir_inst1_data[IR_INST_TYPE-6];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_DIV]     = ir_inst2_data[IR_INST_TYPE-6];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_DIV]     = ir_inst3_data[IR_INST_TYPE-6];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_BJU]     = ir_inst0_data[IR_INST_TYPE-8];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_BJU]     = ir_inst1_data[IR_INST_TYPE-8];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_BJU]     = ir_inst2_data[IR_INST_TYPE-8];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_BJU]     = ir_inst3_data[IR_INST_TYPE-8];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_LSU]     = ir_inst0_data[IR_INST_TYPE-5];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_LSU]     = ir_inst1_data[IR_INST_TYPE-5];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_LSU]     = ir_inst2_data[IR_INST_TYPE-5];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_LSU]     = ir_inst3_data[IR_INST_TYPE-5];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_SPLIT]   = ir_inst0_data[IR_SPLIT];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_SPLIT]   = ir_inst1_data[IR_SPLIT];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_SPLIT]   = ir_inst2_data[IR_SPLIT];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_SPLIT]   = ir_inst3_data[IR_SPLIT];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_INTMASK] = ir_inst0_data[IR_INTMASK];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_INTMASK] = ir_inst1_data[IR_INTMASK];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_INTMASK] = ir_inst2_data[IR_INTMASK];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_INTMASK] = ir_inst3_data[IR_INTMASK];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_STADDR]  = ir_inst0_data[IR_INST_TYPE-4];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_STADDR]  = ir_inst1_data[IR_INST_TYPE-4];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_STADDR]  = ir_inst2_data[IR_INST_TYPE-4];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_STADDR]  = ir_inst3_data[IR_INST_TYPE-4];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_SPECIAL] = ir_inst0_data[IR_INST_TYPE];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_SPECIAL] = ir_inst1_data[IR_INST_TYPE];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_SPECIAL] = ir_inst2_data[IR_INST_TYPE];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_SPECIAL] = ir_inst3_data[IR_INST_TYPE];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_PIPE67]  = ir_inst0_data[IR_INST_TYPE-3];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_PIPE67]  = ir_inst1_data[IR_INST_TYPE-3];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_PIPE67]  = ir_inst2_data[IR_INST_TYPE-3];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_PIPE67]  = ir_inst3_data[IR_INST_TYPE-3];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_PIPE6]   = ir_inst0_data[IR_INST_TYPE-2];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_PIPE6]   = ir_inst1_data[IR_INST_TYPE-2];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_PIPE6]   = ir_inst2_data[IR_INST_TYPE-2];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_PIPE6]   = ir_inst3_data[IR_INST_TYPE-2];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_PIPE7]   = ir_inst0_data[IR_INST_TYPE-1];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_PIPE7]   = ir_inst1_data[IR_INST_TYPE-1];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_PIPE7]   = ir_inst2_data[IR_INST_TYPE-1];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_PIPE7]   = ir_inst3_data[IR_INST_TYPE-1];

assign dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_VMB]     = ir_inst0_data[IR_VMB];
assign dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_VMB]     = ir_inst1_data[IR_VMB];
assign dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_VMB]     = ir_inst2_data[IR_VMB];
assign dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_VMB]     = ir_inst3_data[IR_VMB];
//alu
assign dp_ctrl_ir_inst0_hpcp_type[0] = ir_inst0_data[IR_INST_TYPE-9]
                                    || ir_inst0_data[IR_INST_TYPE-7]
                                    || ir_inst0_data[IR_INST_TYPE-6];
assign dp_ctrl_ir_inst1_hpcp_type[0] = ir_inst1_data[IR_INST_TYPE-9]
                                    || ir_inst1_data[IR_INST_TYPE-7]
                                    || ir_inst1_data[IR_INST_TYPE-6];
assign dp_ctrl_ir_inst2_hpcp_type[0] = ir_inst2_data[IR_INST_TYPE-9]
                                    || ir_inst2_data[IR_INST_TYPE-7]
                                    || ir_inst2_data[IR_INST_TYPE-6];
assign dp_ctrl_ir_inst3_hpcp_type[0] = ir_inst3_data[IR_INST_TYPE-9]
                                    || ir_inst3_data[IR_INST_TYPE-7]
                                    || ir_inst3_data[IR_INST_TYPE-6];
//lsu
assign dp_ctrl_ir_inst0_hpcp_type[1] = ir_inst0_data[IR_INST_TYPE-5];
assign dp_ctrl_ir_inst1_hpcp_type[1] = ir_inst1_data[IR_INST_TYPE-5];
assign dp_ctrl_ir_inst2_hpcp_type[1] = ir_inst2_data[IR_INST_TYPE-5];
assign dp_ctrl_ir_inst3_hpcp_type[1] = ir_inst3_data[IR_INST_TYPE-5];

assign dp_ctrl_ir_inst0_hpcp_type[2] = ir_inst0_vec;
assign dp_ctrl_ir_inst1_hpcp_type[2] = ir_inst1_vec;
assign dp_ctrl_ir_inst2_hpcp_type[2] = ir_inst2_vec;
assign dp_ctrl_ir_inst3_hpcp_type[2] = ir_inst3_vec;

assign dp_ctrl_ir_inst0_hpcp_type[3] = ir_inst0_csr;
assign dp_ctrl_ir_inst1_hpcp_type[3] = ir_inst1_csr;
assign dp_ctrl_ir_inst2_hpcp_type[3] = ir_inst2_csr;
assign dp_ctrl_ir_inst3_hpcp_type[3] = ir_inst3_csr;

assign dp_ctrl_ir_inst0_hpcp_type[4] = ir_inst0_ecall;
assign dp_ctrl_ir_inst1_hpcp_type[4] = ir_inst1_ecall;
assign dp_ctrl_ir_inst2_hpcp_type[4] = ir_inst2_ecall;
assign dp_ctrl_ir_inst3_hpcp_type[4] = ir_inst3_ecall;

assign dp_ctrl_ir_inst0_hpcp_type[5] = ir_inst0_sync;
assign dp_ctrl_ir_inst1_hpcp_type[5] = ir_inst1_sync;
assign dp_ctrl_ir_inst2_hpcp_type[5] = ir_inst2_sync;
assign dp_ctrl_ir_inst3_hpcp_type[5] = ir_inst3_sync;

assign dp_ctrl_ir_inst0_hpcp_type[6] = ir_inst0_fp;
assign dp_ctrl_ir_inst1_hpcp_type[6] = ir_inst1_fp;
assign dp_ctrl_ir_inst2_hpcp_type[6] = ir_inst2_fp;
assign dp_ctrl_ir_inst3_hpcp_type[6] = ir_inst3_fp;

//==========================================================
//               Assign ptag, creg and lsu pc
//==========================================================
assign ir_inst0_dst_preg[6:0]       = {7{!ir_inst0_data[IR_DST_X0]}} & rtu_idu_alloc_preg0[6:0];
assign ir_inst1_dst_preg[6:0]       = {7{!ir_inst1_data[IR_DST_X0]}} & rtu_idu_alloc_preg1[6:0];
assign ir_inst2_dst_preg[6:0]       = {7{!ir_inst2_data[IR_DST_X0]}} & rtu_idu_alloc_preg2[6:0];
assign ir_inst3_dst_preg[6:0]       = {7{!ir_inst3_data[IR_DST_X0]}} & rtu_idu_alloc_preg3[6:0];

assign ir_inst0_dst_vreg[5:0]       = rtu_idu_alloc_vreg0[5:0];
assign ir_inst1_dst_vreg[5:0]       = rtu_idu_alloc_vreg1[5:0];
assign ir_inst2_dst_vreg[5:0]       = rtu_idu_alloc_vreg2[5:0];
assign ir_inst3_dst_vreg[5:0]       = rtu_idu_alloc_vreg3[5:0];

assign ir_inst0_dst_freg[5:0]       = rtu_idu_alloc_freg0[5:0];
assign ir_inst1_dst_freg[5:0]       = rtu_idu_alloc_freg1[5:0];
assign ir_inst2_dst_freg[5:0]       = rtu_idu_alloc_freg2[5:0];
assign ir_inst3_dst_freg[5:0]       = rtu_idu_alloc_freg3[5:0];

assign ir_inst0_dst_ereg[4:0]       = rtu_idu_alloc_ereg0[4:0];
assign ir_inst1_dst_ereg[4:0]       = rtu_idu_alloc_ereg1[4:0];
assign ir_inst2_dst_ereg[4:0]       = rtu_idu_alloc_ereg2[4:0];
assign ir_inst3_dst_ereg[4:0]       = rtu_idu_alloc_ereg3[4:0];

//power optimization: mask pipedown index if dst not valid
assign ir_pipedown_inst0_dst_preg[6:0]  = {7{ir_inst0_data[IR_DST_VLD]}} & ir_inst0_dst_preg[6:0];
assign ir_pipedown_inst1_dst_preg[6:0]  = {7{ir_inst1_data[IR_DST_VLD]}} & ir_inst1_dst_preg[6:0];
assign ir_pipedown_inst2_dst_preg[6:0]  = {7{ir_inst2_data[IR_DST_VLD]}} & ir_inst2_dst_preg[6:0];
assign ir_pipedown_inst3_dst_preg[6:0]  = {7{ir_inst3_data[IR_DST_VLD]}} & ir_inst3_dst_preg[6:0];

//==========================================================
//                Prepare Rename Table data
//==========================================================
//----------------------------------------------------------
//                 Dependency Information
//----------------------------------------------------------
assign dp_rt_dep_info[DEP_WIDTH-1:0]  = ir_dep_info[DEP_WIDTH-1:0];

assign ir_inst0_dstv_imp              = ir_inst0_data[IR_DSTF_REG]
                                        || ir_inst0_data[IR_DSTV_REG];
assign ir_inst1_dstv_imp              = ir_inst1_data[IR_DSTF_REG]
                                        || ir_inst1_data[IR_DSTV_REG];
assign ir_inst2_dstv_imp              = ir_inst2_data[IR_DSTF_REG]
                                        || ir_inst2_data[IR_DSTV_REG];
assign ir_inst3_dstv_imp              = ir_inst3_data[IR_DSTF_REG]
                                        || ir_inst3_data[IR_DSTV_REG];

//----------------------------------------------------------
//                       RT signals
//----------------------------------------------------------
assign dp_rt_inst0_dst_vld            = ir_inst0_data[IR_DST_VLD];
assign dp_rt_inst1_dst_vld            = ir_inst1_data[IR_DST_VLD];
assign dp_rt_inst2_dst_vld            = ir_inst2_data[IR_DST_VLD];
assign dp_rt_inst3_dst_vld            = ir_inst3_data[IR_DST_VLD];

assign dp_rt_inst0_dst_reg[5:0]       = ir_inst0_data[IR_DST_REG:IR_DST_REG-5];
assign dp_rt_inst1_dst_reg[5:0]       = ir_inst1_data[IR_DST_REG:IR_DST_REG-5];
assign dp_rt_inst2_dst_reg[5:0]       = ir_inst2_data[IR_DST_REG:IR_DST_REG-5];
assign dp_rt_inst3_dst_reg[5:0]       = ir_inst3_data[IR_DST_REG:IR_DST_REG-5];

assign dp_rt_inst0_dst_preg[6:0]      = ir_inst0_dst_preg[6:0];
assign dp_rt_inst1_dst_preg[6:0]      = ir_inst1_dst_preg[6:0];
assign dp_rt_inst2_dst_preg[6:0]      = ir_inst2_dst_preg[6:0];
assign dp_rt_inst3_dst_preg[6:0]      = ir_inst3_dst_preg[6:0];

assign dp_rt_inst0_src0_vld           = ir_inst0_data[IR_SRC0_VLD];
assign dp_rt_inst1_src0_vld           = ir_inst1_data[IR_SRC0_VLD];
assign dp_rt_inst2_src0_vld           = ir_inst2_data[IR_SRC0_VLD];
assign dp_rt_inst3_src0_vld           = ir_inst3_data[IR_SRC0_VLD];

assign dp_rt_inst0_src0_reg[5:0]      = ir_inst0_data[IR_SRC0_REG:IR_SRC0_REG-5];
assign dp_rt_inst1_src0_reg[5:0]      = ir_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5];
assign dp_rt_inst2_src0_reg[5:0]      = ir_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5];
assign dp_rt_inst3_src0_reg[5:0]      = ir_inst3_data[IR_SRC0_REG:IR_SRC0_REG-5];

assign dp_rt_inst0_src1_vld           = ir_inst0_data[IR_SRC1_VLD];
assign dp_rt_inst1_src1_vld           = ir_inst1_data[IR_SRC1_VLD];
assign dp_rt_inst2_src1_vld           = ir_inst2_data[IR_SRC1_VLD];
assign dp_rt_inst3_src1_vld           = ir_inst3_data[IR_SRC1_VLD];

assign dp_rt_inst0_src1_reg[5:0]      = ir_inst0_data[IR_SRC1_REG:IR_SRC1_REG-5];
assign dp_rt_inst1_src1_reg[5:0]      = ir_inst1_data[IR_SRC1_REG:IR_SRC1_REG-5];
assign dp_rt_inst2_src1_reg[5:0]      = ir_inst2_data[IR_SRC1_REG:IR_SRC1_REG-5];
assign dp_rt_inst3_src1_reg[5:0]      = ir_inst3_data[IR_SRC1_REG:IR_SRC1_REG-5];

assign dp_rt_inst0_src2_vld           = ir_inst0_data[IR_SRC2_VLD];
assign dp_rt_inst1_src2_vld           = ir_inst1_data[IR_SRC2_VLD];
assign dp_rt_inst2_src2_vld           = ir_inst2_data[IR_SRC2_VLD];
assign dp_rt_inst3_src2_vld           = ir_inst3_data[IR_SRC2_VLD];

assign dp_rt_inst0_mla                = ir_inst0_data[IR_MLA];
assign dp_rt_inst1_mla                = ir_inst1_data[IR_MLA];
assign dp_rt_inst2_mla                = ir_inst2_data[IR_MLA];
assign dp_rt_inst3_mla                = ir_inst3_data[IR_MLA];

assign dp_rt_inst0_mov                = ir_inst0_data[IR_MOV];
assign dp_rt_inst1_mov                = ir_inst1_data[IR_MOV];
assign dp_rt_inst2_mov                = ir_inst2_data[IR_MOV];

//----------------------------------------------------------
//                      FRT signals
//----------------------------------------------------------
assign dp_frt_inst0_dstf_vld           = ir_inst0_data[IR_DSTF_VLD];
assign dp_frt_inst1_dstf_vld           = ir_inst1_data[IR_DSTF_VLD];
assign dp_frt_inst2_dstf_vld           = ir_inst2_data[IR_DSTF_VLD];
assign dp_frt_inst3_dstf_vld           = ir_inst3_data[IR_DSTF_VLD];

assign dp_frt_inst0_dstf_reg[5:0]      = ir_inst0_data[IR_DSTF_REG:IR_DSTF_REG-5];
assign dp_frt_inst1_dstf_reg[5:0]      = ir_inst1_data[IR_DSTF_REG:IR_DSTF_REG-5];
assign dp_frt_inst2_dstf_reg[5:0]      = ir_inst2_data[IR_DSTF_REG:IR_DSTF_REG-5];
assign dp_frt_inst3_dstf_reg[5:0]      = ir_inst3_data[IR_DSTF_REG:IR_DSTF_REG-5];

assign dp_frt_inst0_dst_freg[5:0]      = ir_inst0_dst_freg[5:0];
assign dp_frt_inst1_dst_freg[5:0]      = ir_inst1_dst_freg[5:0];
assign dp_frt_inst2_dst_freg[5:0]      = ir_inst2_dst_freg[5:0];
assign dp_frt_inst3_dst_freg[5:0]      = ir_inst3_dst_freg[5:0];

assign dp_frt_inst0_dste_vld           = ir_inst0_data[IR_DSTE_VLD];
assign dp_frt_inst1_dste_vld           = ir_inst1_data[IR_DSTE_VLD];
assign dp_frt_inst2_dste_vld           = ir_inst2_data[IR_DSTE_VLD];
assign dp_frt_inst3_dste_vld           = ir_inst3_data[IR_DSTE_VLD];

assign dp_frt_inst0_dst_ereg[4:0]      = ir_inst0_dst_ereg[4:0];
assign dp_frt_inst1_dst_ereg[4:0]      = ir_inst1_dst_ereg[4:0];
assign dp_frt_inst2_dst_ereg[4:0]      = ir_inst2_dst_ereg[4:0];
assign dp_frt_inst3_dst_ereg[4:0]      = ir_inst3_dst_ereg[4:0];

assign dp_frt_inst0_srcf0_vld          = ir_inst0_data[IR_SRCF0_VLD];
assign dp_frt_inst1_srcf0_vld          = ir_inst1_data[IR_SRCF0_VLD];
assign dp_frt_inst2_srcf0_vld          = ir_inst2_data[IR_SRCF0_VLD];
assign dp_frt_inst3_srcf0_vld          = ir_inst3_data[IR_SRCF0_VLD];

assign dp_frt_inst0_srcf0_reg[5:0]     = ir_inst0_data[IR_SRCF0_REG:IR_SRCF0_REG-5];
assign dp_frt_inst1_srcf0_reg[5:0]     = ir_inst1_data[IR_SRCF0_REG:IR_SRCF0_REG-5];
assign dp_frt_inst2_srcf0_reg[5:0]     = ir_inst2_data[IR_SRCF0_REG:IR_SRCF0_REG-5];
assign dp_frt_inst3_srcf0_reg[5:0]     = ir_inst3_data[IR_SRCF0_REG:IR_SRCF0_REG-5];

assign dp_frt_inst0_srcf1_vld          = ir_inst0_data[IR_SRCF1_VLD];
assign dp_frt_inst1_srcf1_vld          = ir_inst1_data[IR_SRCF1_VLD];
assign dp_frt_inst2_srcf1_vld          = ir_inst2_data[IR_SRCF1_VLD];
assign dp_frt_inst3_srcf1_vld          = ir_inst3_data[IR_SRCF1_VLD];

assign dp_frt_inst0_srcf1_reg[5:0]     = ir_inst0_data[IR_SRCF1_REG:IR_SRCF1_REG-5];
assign dp_frt_inst1_srcf1_reg[5:0]     = ir_inst1_data[IR_SRCF1_REG:IR_SRCF1_REG-5];
assign dp_frt_inst2_srcf1_reg[5:0]     = ir_inst2_data[IR_SRCF1_REG:IR_SRCF1_REG-5];
assign dp_frt_inst3_srcf1_reg[5:0]     = ir_inst3_data[IR_SRCF1_REG:IR_SRCF1_REG-5];

assign dp_frt_inst0_srcf2_vld          = ir_inst0_data[IR_SRCF2_VLD];
assign dp_frt_inst1_srcf2_vld          = ir_inst1_data[IR_SRCF2_VLD];
assign dp_frt_inst2_srcf2_vld          = ir_inst2_data[IR_SRCF2_VLD];
assign dp_frt_inst3_srcf2_vld          = ir_inst3_data[IR_SRCF2_VLD];

assign dp_frt_inst0_srcf2_reg[5:0]     = ir_inst0_data[IR_SRCF2_REG:IR_SRCF2_REG-5];
assign dp_frt_inst1_srcf2_reg[5:0]     = ir_inst1_data[IR_SRCF2_REG:IR_SRCF2_REG-5];
assign dp_frt_inst2_srcf2_reg[5:0]     = ir_inst2_data[IR_SRCF2_REG:IR_SRCF2_REG-5];
assign dp_frt_inst3_srcf2_reg[5:0]     = ir_inst3_data[IR_SRCF2_REG:IR_SRCF2_REG-5];

assign dp_frt_inst0_fmla               = ir_inst0_data[IR_FMLA];
assign dp_frt_inst1_fmla               = ir_inst1_data[IR_FMLA];
assign dp_frt_inst2_fmla               = ir_inst2_data[IR_FMLA];
assign dp_frt_inst3_fmla               = ir_inst3_data[IR_FMLA];

assign dp_frt_inst0_fmov               = ir_inst0_data[IR_FMOV];
assign dp_frt_inst1_fmov               = ir_inst1_data[IR_FMOV];
assign dp_frt_inst2_fmov               = ir_inst2_data[IR_FMOV];

//----------------------------------------------------------
//                      VRT signals
//----------------------------------------------------------
assign dp_vrt_inst0_dstv_vld           = ir_inst0_data[IR_DSTV_VLD];
assign dp_vrt_inst1_dstv_vld           = ir_inst1_data[IR_DSTV_VLD];
assign dp_vrt_inst2_dstv_vld           = ir_inst2_data[IR_DSTV_VLD];
assign dp_vrt_inst3_dstv_vld           = ir_inst3_data[IR_DSTV_VLD];

assign dp_vrt_inst0_dstv_reg[5:0]      = ir_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5];
assign dp_vrt_inst1_dstv_reg[5:0]      = ir_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5];
assign dp_vrt_inst2_dstv_reg[5:0]      = ir_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5];
assign dp_vrt_inst3_dstv_reg[5:0]      = ir_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5];

assign dp_vrt_inst0_dst_vreg[5:0]      = ir_inst0_dst_vreg[5:0];
assign dp_vrt_inst1_dst_vreg[5:0]      = ir_inst1_dst_vreg[5:0];
assign dp_vrt_inst2_dst_vreg[5:0]      = ir_inst2_dst_vreg[5:0];
assign dp_vrt_inst3_dst_vreg[5:0]      = ir_inst3_dst_vreg[5:0];

assign dp_vrt_inst0_srcv0_vld          = ir_inst0_data[IR_SRCV0_VLD];
assign dp_vrt_inst1_srcv0_vld          = ir_inst1_data[IR_SRCV0_VLD];
assign dp_vrt_inst2_srcv0_vld          = ir_inst2_data[IR_SRCV0_VLD];
assign dp_vrt_inst3_srcv0_vld          = ir_inst3_data[IR_SRCV0_VLD];

assign dp_vrt_inst0_srcv0_reg[5:0]     = ir_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5];
assign dp_vrt_inst1_srcv0_reg[5:0]     = ir_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5];
assign dp_vrt_inst2_srcv0_reg[5:0]     = ir_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5];
assign dp_vrt_inst3_srcv0_reg[5:0]     = ir_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5];

assign dp_vrt_inst0_srcv1_vld          = ir_inst0_data[IR_SRCV1_VLD];
assign dp_vrt_inst1_srcv1_vld          = ir_inst1_data[IR_SRCV1_VLD];
assign dp_vrt_inst2_srcv1_vld          = ir_inst2_data[IR_SRCV1_VLD];
assign dp_vrt_inst3_srcv1_vld          = ir_inst3_data[IR_SRCV1_VLD];

assign dp_vrt_inst0_srcv1_reg[5:0]     = ir_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5];
assign dp_vrt_inst1_srcv1_reg[5:0]     = ir_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5];
assign dp_vrt_inst2_srcv1_reg[5:0]     = ir_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5];
assign dp_vrt_inst3_srcv1_reg[5:0]     = ir_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5];

assign dp_vrt_inst0_srcv2_vld          = ir_inst0_data[IR_SRCV2_VLD];
assign dp_vrt_inst1_srcv2_vld          = ir_inst1_data[IR_SRCV2_VLD];
assign dp_vrt_inst2_srcv2_vld          = ir_inst2_data[IR_SRCV2_VLD];
assign dp_vrt_inst3_srcv2_vld          = ir_inst3_data[IR_SRCV2_VLD];

assign dp_vrt_inst0_srcvm_vld          = ir_inst0_data[IR_SRCVM_VLD];
assign dp_vrt_inst1_srcvm_vld          = ir_inst1_data[IR_SRCVM_VLD];
assign dp_vrt_inst2_srcvm_vld          = ir_inst2_data[IR_SRCVM_VLD];
assign dp_vrt_inst3_srcvm_vld          = ir_inst3_data[IR_SRCVM_VLD];

assign dp_vrt_inst0_vmla               = ir_inst0_data[IR_VMLA];
assign dp_vrt_inst1_vmla               = ir_inst1_data[IR_VMLA];
assign dp_vrt_inst2_vmla               = ir_inst2_data[IR_VMLA];
assign dp_vrt_inst3_vmla               = ir_inst3_data[IR_VMLA];

//==========================================================
//                    FRT / VRT MUX
//==========================================================
//----------------------------------------------------------
//                      IR Inst 0
//----------------------------------------------------------
assign ir_rt_inst0_srcv0_vld        = ir_inst0_data[IR_SRCF0_VLD] || ir_inst0_data[IR_SRCV0_VLD];
assign ir_rt_inst0_srcv1_vld        = ir_inst0_data[IR_SRCF1_VLD] || ir_inst0_data[IR_SRCV1_VLD];
assign ir_rt_inst0_srcv2_vld        = ir_inst0_data[IR_SRCF2_VLD] || ir_inst0_data[IR_SRCV2_VLD];
assign ir_rt_inst0_srcvm_vld        = ir_inst0_data[IR_SRCVM_VLD];
assign ir_rt_inst0_dstv_vld         = ir_inst0_data[IR_DSTF_VLD] || ir_inst0_data[IR_DSTV_VLD];
assign ir_rt_inst0_dste_vld         = ir_inst0_data[IR_DSTE_VLD];
assign ir_rt_inst0_vmla             = ir_inst0_data[IR_FMLA] || ir_inst0_data[IR_VMLA];

assign ir_rt_inst0_srcv0_data[8:0]  = ir_inst0_data[IR_SRCV0_VLD]
                                      ? vrt_dp_inst0_srcv0_data[8:0]
                                      : frt_dp_inst0_srcf0_data[8:0];
assign ir_rt_inst0_srcv1_data[8:0]  = ir_inst0_data[IR_SRCV1_VLD]
                                      ? vrt_dp_inst0_srcv1_data[8:0]
                                      : frt_dp_inst0_srcf1_data[8:0];
assign ir_rt_inst0_srcv2_data[9:0]  = ir_inst0_data[IR_SRCV2_VLD]
                                      ? vrt_dp_inst0_srcv2_data[9:0]
                                      : frt_dp_inst0_srcf2_data[9:0];
assign ir_rt_inst0_srcvm_data[8:0]  = vrt_dp_inst0_srcvm_data[8:0];

assign ir_rt_inst0_dstv_reg[4:0]    = ir_inst0_data[IR_DSTV_VLD]
                                      ? ir_inst0_data[IR_DSTV_REG-1:IR_DSTV_REG-5]
                                      : ir_inst0_data[IR_DSTF_REG-1:IR_DSTF_REG-5];
assign ir_rt_inst0_dst_vreg[6:0]    = 
         {7{ir_inst0_data[IR_DSTV_VLD]}} & {1'b1, ir_inst0_dst_vreg[5:0]}
       | {7{ir_inst0_data[IR_DSTF_VLD]}} & {1'b0, ir_inst0_dst_freg[5:0]};
assign ir_rt_inst0_rel_vreg[6:0]    = ir_inst0_data[IR_DSTV_VLD]
                                      ? vrt_dp_inst0_rel_vreg[6:0]
                                      : frt_dp_inst0_rel_freg[6:0];
assign ir_rt_inst0_dst_ereg[4:0]    = {5{ir_inst0_data[IR_DSTE_VLD]}}
                                      & ir_inst0_dst_ereg[4:0];
assign ir_rt_inst0_rel_ereg[4:0]    = frt_dp_inst0_rel_ereg[4:0];

//----------------------------------------------------------
//                      IR Inst 1
//----------------------------------------------------------
assign ir_rt_inst1_srcv0_vld        = ir_inst1_data[IR_SRCF0_VLD] || ir_inst1_data[IR_SRCV0_VLD];
assign ir_rt_inst1_srcv1_vld        = ir_inst1_data[IR_SRCF1_VLD] || ir_inst1_data[IR_SRCV1_VLD];
assign ir_rt_inst1_srcv2_vld        = ir_inst1_data[IR_SRCF2_VLD] || ir_inst1_data[IR_SRCV2_VLD];
assign ir_rt_inst1_srcvm_vld        = ir_inst1_data[IR_SRCVM_VLD];
assign ir_rt_inst1_dstv_vld         = ir_inst1_data[IR_DSTF_VLD] || ir_inst1_data[IR_DSTV_VLD];
assign ir_rt_inst1_dste_vld         = ir_inst1_data[IR_DSTE_VLD];
assign ir_rt_inst1_vmla             = ir_inst1_data[IR_FMLA] || ir_inst1_data[IR_VMLA];

assign ir_rt_inst1_srcv0_data[8:0]  = ir_inst1_data[IR_SRCV0_VLD]
                                      ? vrt_dp_inst1_srcv0_data[8:0]
                                      : frt_dp_inst1_srcf0_data[8:0];
assign ir_rt_inst1_srcv1_data[8:0]  = ir_inst1_data[IR_SRCV1_VLD]
                                      ? vrt_dp_inst1_srcv1_data[8:0]
                                      : frt_dp_inst1_srcf1_data[8:0];
assign ir_rt_inst1_srcv2_data[9:0]  = ir_inst1_data[IR_SRCV2_VLD]
                                      ? vrt_dp_inst1_srcv2_data[9:0]
                                      : frt_dp_inst1_srcf2_data[9:0];
assign ir_rt_inst1_srcvm_data[8:0]  = vrt_dp_inst1_srcvm_data[8:0];
assign ir_rt_inst1_dstv_reg[4:0]    = ir_inst1_data[IR_DSTV_VLD]
                                      ? ir_inst1_data[IR_DSTV_REG-1:IR_DSTV_REG-5]
                                      : ir_inst1_data[IR_DSTF_REG-1:IR_DSTF_REG-5];
assign ir_rt_inst1_dst_vreg[6:0]    = 
         {7{ir_inst1_data[IR_DSTV_VLD]}} & {1'b1, ir_inst1_dst_vreg[5:0]}
       | {7{ir_inst1_data[IR_DSTF_VLD]}} & {1'b0, ir_inst1_dst_freg[5:0]};
assign ir_rt_inst1_rel_vreg[6:0]    = ir_inst1_data[IR_DSTV_VLD]
                                      ? vrt_dp_inst1_rel_vreg[6:0]
                                      : frt_dp_inst1_rel_freg[6:0];
assign ir_rt_inst1_dst_ereg[4:0]    = {5{ir_inst1_data[IR_DSTE_VLD]}}
                                      & ir_inst1_dst_ereg[4:0];
assign ir_rt_inst1_rel_ereg[4:0]    = frt_dp_inst1_rel_ereg[4:0];

//----------------------------------------------------------
//                      IR Inst 2
//----------------------------------------------------------
assign ir_rt_inst2_srcv0_vld        = ir_inst2_data[IR_SRCF0_VLD] || ir_inst2_data[IR_SRCV0_VLD];
assign ir_rt_inst2_srcv1_vld        = ir_inst2_data[IR_SRCF1_VLD] || ir_inst2_data[IR_SRCV1_VLD];
assign ir_rt_inst2_srcv2_vld        = ir_inst2_data[IR_SRCF2_VLD] || ir_inst2_data[IR_SRCV2_VLD];
assign ir_rt_inst2_srcvm_vld        = ir_inst2_data[IR_SRCVM_VLD];
assign ir_rt_inst2_dstv_vld         = ir_inst2_data[IR_DSTF_VLD] || ir_inst2_data[IR_DSTV_VLD];
assign ir_rt_inst2_dste_vld         = ir_inst2_data[IR_DSTE_VLD];
assign ir_rt_inst2_vmla             = ir_inst2_data[IR_FMLA] || ir_inst2_data[IR_VMLA];

assign ir_rt_inst2_srcv0_data[8:0]  = ir_inst2_data[IR_SRCV0_VLD]
                                      ? vrt_dp_inst2_srcv0_data[8:0]
                                      : frt_dp_inst2_srcf0_data[8:0];
assign ir_rt_inst2_srcv1_data[8:0]  = ir_inst2_data[IR_SRCV1_VLD]
                                      ? vrt_dp_inst2_srcv1_data[8:0]
                                      : frt_dp_inst2_srcf1_data[8:0];
assign ir_rt_inst2_srcv2_data[9:0]  = ir_inst2_data[IR_SRCV2_VLD]
                                      ? vrt_dp_inst2_srcv2_data[9:0]
                                      : frt_dp_inst2_srcf2_data[9:0];
assign ir_rt_inst2_srcvm_data[8:0]  = vrt_dp_inst2_srcvm_data[8:0];
assign ir_rt_inst2_dstv_reg[4:0]    = ir_inst2_data[IR_DSTV_VLD]
                                      ? ir_inst2_data[IR_DSTV_REG-1:IR_DSTV_REG-5]
                                      : ir_inst2_data[IR_DSTF_REG-1:IR_DSTF_REG-5];
assign ir_rt_inst2_dst_vreg[6:0]    = 
         {7{ir_inst2_data[IR_DSTV_VLD]}} & {1'b1, ir_inst2_dst_vreg[5:0]}
       | {7{ir_inst2_data[IR_DSTF_VLD]}} & {1'b0, ir_inst2_dst_freg[5:0]};
assign ir_rt_inst2_rel_vreg[6:0]    = ir_inst2_data[IR_DSTV_VLD]
                                      ? vrt_dp_inst2_rel_vreg[6:0]
                                      : frt_dp_inst2_rel_freg[6:0];
assign ir_rt_inst2_dst_ereg[4:0]    = {5{ir_inst2_data[IR_DSTE_VLD]}}
                                      & ir_inst2_dst_ereg[4:0];
assign ir_rt_inst2_rel_ereg[4:0]    = frt_dp_inst2_rel_ereg[4:0];

//----------------------------------------------------------
//                      IR Inst 3
//----------------------------------------------------------
assign ir_rt_inst3_srcv0_vld        = ir_inst3_data[IR_SRCF0_VLD] || ir_inst3_data[IR_SRCV0_VLD];
assign ir_rt_inst3_srcv1_vld        = ir_inst3_data[IR_SRCF1_VLD] || ir_inst3_data[IR_SRCV1_VLD];
assign ir_rt_inst3_srcv2_vld        = ir_inst3_data[IR_SRCF2_VLD] || ir_inst3_data[IR_SRCV2_VLD];
assign ir_rt_inst3_srcvm_vld        = ir_inst3_data[IR_SRCVM_VLD];
assign ir_rt_inst3_dstv_vld         = ir_inst3_data[IR_DSTF_VLD] || ir_inst3_data[IR_DSTV_VLD];
assign ir_rt_inst3_dste_vld         = ir_inst3_data[IR_DSTE_VLD];
assign ir_rt_inst3_vmla             = ir_inst3_data[IR_FMLA] || ir_inst3_data[IR_VMLA];

assign ir_rt_inst3_srcv0_data[8:0]  = ir_inst3_data[IR_SRCV0_VLD]
                                      ? vrt_dp_inst3_srcv0_data[8:0]
                                      : frt_dp_inst3_srcf0_data[8:0];
assign ir_rt_inst3_srcv1_data[8:0]  = ir_inst3_data[IR_SRCV1_VLD]
                                      ? vrt_dp_inst3_srcv1_data[8:0]
                                      : frt_dp_inst3_srcf1_data[8:0];
assign ir_rt_inst3_srcv2_data[9:0]  = ir_inst3_data[IR_SRCV2_VLD]
                                      ? vrt_dp_inst3_srcv2_data[9:0]
                                      : frt_dp_inst3_srcf2_data[9:0];
assign ir_rt_inst3_srcvm_data[8:0]  = vrt_dp_inst3_srcvm_data[8:0];
assign ir_rt_inst3_dstv_reg[4:0]    = ir_inst3_data[IR_DSTV_VLD]
                                      ? ir_inst3_data[IR_DSTV_REG-1:IR_DSTV_REG-5]
                                      : ir_inst3_data[IR_DSTF_REG-1:IR_DSTF_REG-5];
assign ir_rt_inst3_dst_vreg[6:0]    = 
         {7{ir_inst3_data[IR_DSTV_VLD]}} & {1'b1, ir_inst3_dst_vreg[5:0]}
       | {7{ir_inst3_data[IR_DSTF_VLD]}} & {1'b0, ir_inst3_dst_freg[5:0]};
assign ir_rt_inst3_rel_vreg[6:0]    = ir_inst3_data[IR_DSTV_VLD]
                                      ? vrt_dp_inst3_rel_vreg[6:0]
                                      : frt_dp_inst3_rel_freg[6:0];
assign ir_rt_inst3_dst_ereg[4:0]    = {5{ir_inst3_data[IR_DSTE_VLD]}}
                                      & ir_inst3_dst_ereg[4:0];
assign ir_rt_inst3_rel_ereg[4:0]    = frt_dp_inst3_rel_ereg[4:0];

//----------------------------------------------------------
//                      source match
//----------------------------------------------------------
assign dp_ir_inst01_src_match[3] = frt_dp_inst01_srcf2_match || vrt_dp_inst01_srcv2_match;
assign dp_ir_inst02_src_match[3] = frt_dp_inst02_srcf2_match || vrt_dp_inst02_srcv2_match;
assign dp_ir_inst03_src_match[3] = frt_dp_inst03_srcf2_match || vrt_dp_inst03_srcv2_match;
assign dp_ir_inst12_src_match[3] = frt_dp_inst12_srcf2_match || vrt_dp_inst12_srcv2_match;
assign dp_ir_inst13_src_match[3] = frt_dp_inst13_srcf2_match || vrt_dp_inst13_srcv2_match;
assign dp_ir_inst23_src_match[3] = frt_dp_inst23_srcf2_match || vrt_dp_inst23_srcv2_match;

assign dp_ir_inst01_src_match[2:0] = rt_dp_inst01_src_match[2:0];
assign dp_ir_inst02_src_match[2:0] = rt_dp_inst02_src_match[2:0];
assign dp_ir_inst03_src_match[2:0] = rt_dp_inst03_src_match[2:0];
assign dp_ir_inst12_src_match[2:0] = rt_dp_inst12_src_match[2:0];
assign dp_ir_inst13_src_match[2:0] = rt_dp_inst13_src_match[2:0];
assign dp_ir_inst23_src_match[2:0] = rt_dp_inst23_src_match[2:0];

//==========================================================
//                   Instance IR Decoder
//==========================================================
assign ir_inst0_opcode[31:0]     = ir_inst0_data[IR_OPCODE:IR_OPCODE-31];
assign ir_inst1_opcode[31:0]     = ir_inst1_data[IR_OPCODE:IR_OPCODE-31];
assign ir_inst2_opcode[31:0]     = ir_inst2_data[IR_OPCODE:IR_OPCODE-31];
assign ir_inst3_opcode[31:0]     = ir_inst3_data[IR_OPCODE:IR_OPCODE-31];

assign ir_inst0_illegal          = ir_inst0_data[IR_ILLEGAL];
assign ir_inst1_illegal          = ir_inst1_data[IR_ILLEGAL];
assign ir_inst2_illegal          = ir_inst2_data[IR_ILLEGAL];
assign ir_inst3_illegal          = ir_inst3_data[IR_ILLEGAL];

assign ir_inst0_type_staddr      = ir_inst0_data[IR_INST_TYPE-4];
assign ir_inst1_type_staddr      = ir_inst1_data[IR_INST_TYPE-4];
assign ir_inst2_type_staddr      = ir_inst2_data[IR_INST_TYPE-4];
assign ir_inst3_type_staddr      = ir_inst3_data[IR_INST_TYPE-4];

assign ir_inst0_type_alu         = ir_inst0_data[IR_INST_TYPE-9];
assign ir_inst1_type_alu         = ir_inst1_data[IR_INST_TYPE-9];
assign ir_inst2_type_alu         = ir_inst2_data[IR_INST_TYPE-9];
assign ir_inst3_type_alu         = ir_inst3_data[IR_INST_TYPE-9];
//amo vload

assign ir_inst0_type_vload       = ir_inst0_data[IR_VMB];
assign ir_inst1_type_vload       = ir_inst1_data[IR_VMB];
assign ir_inst2_type_vload       = ir_inst2_data[IR_VMB];
assign ir_inst3_type_vload       = ir_inst3_data[IR_VMB];

assign ir_inst0_vsew[2:0]        = ir_inst0_data[IR_VSEW:IR_VSEW-2];
assign ir_inst1_vsew[2:0]        = ir_inst1_data[IR_VSEW:IR_VSEW-2];
assign ir_inst2_vsew[2:0]        = ir_inst2_data[IR_VSEW:IR_VSEW-2];
assign ir_inst3_vsew[2:0]        = ir_inst3_data[IR_VSEW:IR_VSEW-2];

// &ConnRule(s/^x_/ir_inst0_/); @829
// &Instance("ct_idu_ir_decd", "x_ct_idu_ir_decd0"); @830
ct_idu_ir_decd  x_ct_idu_ir_decd0 (
  .x_alu_short                (ir_inst0_alu_short        ),
  .x_bar                      (ir_inst0_bar              ),
  .x_bar_type                 (ir_inst0_bar_type         ),
  .x_csr                      (ir_inst0_csr              ),
  .x_ecall                    (ir_inst0_ecall            ),
  .x_fp                       (ir_inst0_fp               ),
  .x_illegal                  (ir_inst0_illegal          ),
  .x_load                     (ir_inst0_load             ),
  .x_mfvr                     (ir_inst0_mfvr             ),
  .x_mtvr                     (ir_inst0_mtvr             ),
  .x_opcode                   (ir_inst0_opcode           ),
  .x_pcall                    (ir_inst0_pcall            ),
  .x_pcfifo                   (ir_inst0_pcfifo           ),
  .x_rts                      (ir_inst0_rts              ),
  .x_store                    (ir_inst0_store            ),
  .x_str                      (ir_inst0_str              ),
  .x_sync                     (ir_inst0_sync             ),
  .x_type_alu                 (ir_inst0_type_alu         ),
  .x_type_staddr              (ir_inst0_type_staddr      ),
  .x_type_vload               (ir_inst0_type_vload       ),
  .x_unit_stride              (ir_inst0_unit_stride      ),
  .x_vamo                     (ir_inst0_vamo             ),
  .x_vdiv                     (ir_inst0_vdiv             ),
  .x_vec                      (ir_inst0_vec              ),
  .x_viq_srcv12_switch        (ir_inst0_viq_srcv12_switch),
  .x_vmla_short               (ir_inst0_vmla_short       ),
  .x_vmla_type                (ir_inst0_vmla_type        ),
  .x_vmul                     (ir_inst0_vmul             ),
  .x_vmul_unsplit             (ir_inst0_vmul_unsplit     ),
  .x_vsetvl                   (ir_inst0_vsetvl           ),
  .x_vsetvli                  (ir_inst0_vsetvli          ),
  .x_vsew                     (ir_inst0_vsew             )
);

// &ConnRule(s/^x_/ir_inst1_/); @831
// &Instance("ct_idu_ir_decd", "x_ct_idu_ir_decd1"); @832
ct_idu_ir_decd  x_ct_idu_ir_decd1 (
  .x_alu_short                (ir_inst1_alu_short        ),
  .x_bar                      (ir_inst1_bar              ),
  .x_bar_type                 (ir_inst1_bar_type         ),
  .x_csr                      (ir_inst1_csr              ),
  .x_ecall                    (ir_inst1_ecall            ),
  .x_fp                       (ir_inst1_fp               ),
  .x_illegal                  (ir_inst1_illegal          ),
  .x_load                     (ir_inst1_load             ),
  .x_mfvr                     (ir_inst1_mfvr             ),
  .x_mtvr                     (ir_inst1_mtvr             ),
  .x_opcode                   (ir_inst1_opcode           ),
  .x_pcall                    (ir_inst1_pcall            ),
  .x_pcfifo                   (ir_inst1_pcfifo           ),
  .x_rts                      (ir_inst1_rts              ),
  .x_store                    (ir_inst1_store            ),
  .x_str                      (ir_inst1_str              ),
  .x_sync                     (ir_inst1_sync             ),
  .x_type_alu                 (ir_inst1_type_alu         ),
  .x_type_staddr              (ir_inst1_type_staddr      ),
  .x_type_vload               (ir_inst1_type_vload       ),
  .x_unit_stride              (ir_inst1_unit_stride      ),
  .x_vamo                     (ir_inst1_vamo             ),
  .x_vdiv                     (ir_inst1_vdiv             ),
  .x_vec                      (ir_inst1_vec              ),
  .x_viq_srcv12_switch        (ir_inst1_viq_srcv12_switch),
  .x_vmla_short               (ir_inst1_vmla_short       ),
  .x_vmla_type                (ir_inst1_vmla_type        ),
  .x_vmul                     (ir_inst1_vmul             ),
  .x_vmul_unsplit             (ir_inst1_vmul_unsplit     ),
  .x_vsetvl                   (ir_inst1_vsetvl           ),
  .x_vsetvli                  (ir_inst1_vsetvli          ),
  .x_vsew                     (ir_inst1_vsew             )
);

// &ConnRule(s/^x_/ir_inst2_/); @833
// &Instance("ct_idu_ir_decd", "x_ct_idu_ir_decd2"); @834
ct_idu_ir_decd  x_ct_idu_ir_decd2 (
  .x_alu_short                (ir_inst2_alu_short        ),
  .x_bar                      (ir_inst2_bar              ),
  .x_bar_type                 (ir_inst2_bar_type         ),
  .x_csr                      (ir_inst2_csr              ),
  .x_ecall                    (ir_inst2_ecall            ),
  .x_fp                       (ir_inst2_fp               ),
  .x_illegal                  (ir_inst2_illegal          ),
  .x_load                     (ir_inst2_load             ),
  .x_mfvr                     (ir_inst2_mfvr             ),
  .x_mtvr                     (ir_inst2_mtvr             ),
  .x_opcode                   (ir_inst2_opcode           ),
  .x_pcall                    (ir_inst2_pcall            ),
  .x_pcfifo                   (ir_inst2_pcfifo           ),
  .x_rts                      (ir_inst2_rts              ),
  .x_store                    (ir_inst2_store            ),
  .x_str                      (ir_inst2_str              ),
  .x_sync                     (ir_inst2_sync             ),
  .x_type_alu                 (ir_inst2_type_alu         ),
  .x_type_staddr              (ir_inst2_type_staddr      ),
  .x_type_vload               (ir_inst2_type_vload       ),
  .x_unit_stride              (ir_inst2_unit_stride      ),
  .x_vamo                     (ir_inst2_vamo             ),
  .x_vdiv                     (ir_inst2_vdiv             ),
  .x_vec                      (ir_inst2_vec              ),
  .x_viq_srcv12_switch        (ir_inst2_viq_srcv12_switch),
  .x_vmla_short               (ir_inst2_vmla_short       ),
  .x_vmla_type                (ir_inst2_vmla_type        ),
  .x_vmul                     (ir_inst2_vmul             ),
  .x_vmul_unsplit             (ir_inst2_vmul_unsplit     ),
  .x_vsetvl                   (ir_inst2_vsetvl           ),
  .x_vsetvli                  (ir_inst2_vsetvli          ),
  .x_vsew                     (ir_inst2_vsew             )
);

// &ConnRule(s/^x_/ir_inst3_/); @835
// &Instance("ct_idu_ir_decd", "x_ct_idu_ir_decd3"); @836
ct_idu_ir_decd  x_ct_idu_ir_decd3 (
  .x_alu_short                (ir_inst3_alu_short        ),
  .x_bar                      (ir_inst3_bar              ),
  .x_bar_type                 (ir_inst3_bar_type         ),
  .x_csr                      (ir_inst3_csr              ),
  .x_ecall                    (ir_inst3_ecall            ),
  .x_fp                       (ir_inst3_fp               ),
  .x_illegal                  (ir_inst3_illegal          ),
  .x_load                     (ir_inst3_load             ),
  .x_mfvr                     (ir_inst3_mfvr             ),
  .x_mtvr                     (ir_inst3_mtvr             ),
  .x_opcode                   (ir_inst3_opcode           ),
  .x_pcall                    (ir_inst3_pcall            ),
  .x_pcfifo                   (ir_inst3_pcfifo           ),
  .x_rts                      (ir_inst3_rts              ),
  .x_store                    (ir_inst3_store            ),
  .x_str                      (ir_inst3_str              ),
  .x_sync                     (ir_inst3_sync             ),
  .x_type_alu                 (ir_inst3_type_alu         ),
  .x_type_staddr              (ir_inst3_type_staddr      ),
  .x_type_vload               (ir_inst3_type_vload       ),
  .x_unit_stride              (ir_inst3_unit_stride      ),
  .x_vamo                     (ir_inst3_vamo             ),
  .x_vdiv                     (ir_inst3_vdiv             ),
  .x_vec                      (ir_inst3_vec              ),
  .x_viq_srcv12_switch        (ir_inst3_viq_srcv12_switch),
  .x_vmla_short               (ir_inst3_vmla_short       ),
  .x_vmla_type                (ir_inst3_vmla_type        ),
  .x_vmul                     (ir_inst3_vmul             ),
  .x_vmul_unsplit             (ir_inst3_vmul_unsplit     ),
  .x_vsetvl                   (ir_inst3_vsetvl           ),
  .x_vsetvli                  (ir_inst3_vsetvli          ),
  .x_vsew                     (ir_inst3_vsew             )
);


//==========================================================
//                 Rename for IS data path
//==========================================================
//load inst will create 
//except lrw and split load (last split will create)
//pop inst do not create lsfifo
assign dp_ctrl_ir_inst0_bar      = ir_inst0_bar;
assign dp_ctrl_ir_inst1_bar      = ir_inst1_bar;
assign dp_ctrl_ir_inst2_bar      = ir_inst2_bar;
assign dp_ctrl_ir_inst3_bar      = ir_inst3_bar;

//==========================================================
//               Prepare RF Launch Signal
//==========================================================
//timing optimization:
//prepare rf launch signal at ir
assign ir_inst0_lch_preg = ir_inst0_data[IR_DST_VLD]
                           && (ir_inst0_data[IR_INST_TYPE-9] //alu
                            || ir_inst0_data[IR_INST_TYPE]); //special
assign ir_inst1_lch_preg = ir_inst1_data[IR_DST_VLD]
                           && (ir_inst1_data[IR_INST_TYPE-9] //alu
                            || ir_inst1_data[IR_INST_TYPE]); //special
assign ir_inst2_lch_preg = ir_inst2_data[IR_DST_VLD]
                           && (ir_inst2_data[IR_INST_TYPE-9] //alu
                            || ir_inst2_data[IR_INST_TYPE]); //special
assign ir_inst3_lch_preg = ir_inst3_data[IR_DST_VLD]
                           && (ir_inst3_data[IR_INST_TYPE-9] //alu
                            || ir_inst3_data[IR_INST_TYPE]); //special

//==========================================================
//                 Rename for IS data path
//==========================================================
//----------------------------------------------------------
//                   Data path rename
//----------------------------------------------------------
assign dp_ir_inst0_data[IS_VL_PRED]                        = ir_inst0_data[IR_VL_PRED];
assign dp_ir_inst0_data[IS_VL:IS_VL-7]                     = ir_inst0_data[IR_VL:IR_VL-7];
assign dp_ir_inst0_data[IS_LCH_PREG]                       = ir_inst0_lch_preg;
assign dp_ir_inst0_data[IS_VAMO]                           = ir_inst0_vamo;
assign dp_ir_inst0_data[IS_UNIT_STRIDE]                    = ir_inst0_unit_stride;
assign dp_ir_inst0_data[IS_VMB]                            = ir_inst0_data[IR_VMB];
assign dp_ir_inst0_data[IS_DSTV_IMP]                       = ir_inst0_dstv_imp;
assign dp_ir_inst0_data[IS_VIQ_SRCV12_SWITCH]              = ir_inst0_viq_srcv12_switch;
assign dp_ir_inst0_data[IS_VSETVL]                         = ir_inst0_vsetvl;
assign dp_ir_inst0_data[IS_VSETVLI]                        = ir_inst0_vsetvli;
assign dp_ir_inst0_data[IS_VSEW:IS_VSEW-2]                 = ir_inst0_data[IR_VSEW:IR_VSEW-2];
assign dp_ir_inst0_data[IS_VLMUL:IS_VLMUL-1]               = ir_inst0_data[IR_VLMUL:IR_VLMUL-1];
assign dp_ir_inst0_data[IS_VMUL]                           = ir_inst0_vmul;
assign dp_ir_inst0_data[IS_VMUL_UNSPLIT]                   = ir_inst0_vmul_unsplit;
assign dp_ir_inst0_data[IS_VMLA_SHORT]                     = ir_inst0_vmla_short;
assign dp_ir_inst0_data[IS_VMLA_TYPE:IS_VMLA_TYPE-2]       = ir_inst0_vmla_type[2:0];
assign dp_ir_inst0_data[IS_SPLIT_NUM:IS_SPLIT_NUM-6]       = ir_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6];
assign dp_ir_inst0_data[IS_NO_SPEC]                        = ir_inst0_data[IR_NO_SPEC];
assign dp_ir_inst0_data[IS_ALU_SHORT]                      = ir_inst0_alu_short;
assign dp_ir_inst0_data[IS_MLA]                            = ir_inst0_data[IR_MLA];
assign dp_ir_inst0_data[IS_STR]                            = ir_inst0_str;
assign dp_ir_inst0_data[IS_SPLIT_LAST]                     = ir_inst0_data[IR_SPLIT_LAST];
assign dp_ir_inst0_data[IS_MFVR]                           = ir_inst0_mfvr;
assign dp_ir_inst0_data[IS_MTVR]                           = ir_inst0_mtvr;
assign dp_ir_inst0_data[IS_VMLA]                           = ir_rt_inst0_vmla;
assign dp_ir_inst0_data[IS_VDIV]                           = ir_inst0_vdiv;
assign dp_ir_inst0_data[IS_PIPE7]                          = ir_inst0_data[IR_INST_TYPE-1];//pipe7
assign dp_ir_inst0_data[IS_PIPE6]                          = ir_inst0_data[IR_INST_TYPE-2];//pipe6
assign dp_ir_inst0_data[IS_PIPE67]                         = ir_inst0_data[IR_INST_TYPE-3];//pipe67
assign dp_ir_inst0_data[IS_IID_PLUS:IS_IID_PLUS-3]         = ir_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3];
assign dp_ir_inst0_data[IS_BKPTB_INST]                     = ir_inst0_data[IR_BKPTB_INST];
assign dp_ir_inst0_data[IS_BKPTA_INST]                     = ir_inst0_data[IR_BKPTA_INST];
assign dp_ir_inst0_data[IS_EXPT:IS_EXPT-6]                 = ir_inst0_data[IR_EXPT:IR_EXPT-6];
assign dp_ir_inst0_data[IS_RTS]                            = ir_inst0_rts;
assign dp_ir_inst0_data[IS_SPECIAL]                        = ir_inst0_data[IR_INST_TYPE];//special
assign dp_ir_inst0_data[IS_LSU]                            = ir_inst0_data[IR_INST_TYPE-5];//lsu
assign dp_ir_inst0_data[IS_DIV]                            = ir_inst0_data[IR_INST_TYPE-6];//div
assign dp_ir_inst0_data[IS_MULT]                           = ir_inst0_data[IR_INST_TYPE-7];//mult
assign dp_ir_inst0_data[IS_INTMASK]                        = ir_inst0_data[IR_INTMASK];
assign dp_ir_inst0_data[IS_SPLIT]                          = ir_inst0_data[IR_SPLIT];
assign dp_ir_inst0_data[IS_LENGTH]                         = ir_inst0_data[IR_LENGTH];
assign dp_ir_inst0_data[IS_PCFIFO]                         = ir_inst0_pcfifo;
assign dp_ir_inst0_data[IS_PCALL]                          = ir_inst0_pcall;
assign dp_ir_inst0_data[IS_BJU]                            = ir_inst0_data[IR_INST_TYPE-8];//bju
assign dp_ir_inst0_data[IS_LSU_PC:IS_LSU_PC-14]            = ir_inst0_data[IR_PC:IR_PC-14];
assign dp_ir_inst0_data[IS_BAR_TYPE:IS_BAR_TYPE-3]         = ir_inst0_bar_type[3:0];
assign dp_ir_inst0_data[IS_BAR]                            = ir_inst0_bar;
assign dp_ir_inst0_data[IS_STADDR]                         = ir_inst0_data[IR_INST_TYPE-4];//staddr
assign dp_ir_inst0_data[IS_STORE]                          = ir_inst0_store;
assign dp_ir_inst0_data[IS_LOAD]                           = ir_inst0_load;
assign dp_ir_inst0_data[IS_ALU]                            = ir_inst0_data[IR_INST_TYPE-9];//alu
assign dp_ir_inst0_data[IS_DST_REL_EREG:IS_DST_REL_EREG-4] = ir_rt_inst0_rel_ereg[4:0];
assign dp_ir_inst0_data[IS_DST_EREG:IS_DST_EREG-4]         = ir_rt_inst0_dst_ereg[4:0];
assign dp_ir_inst0_data[IS_DST_REL_VREG:IS_DST_REL_VREG-6] = ir_rt_inst0_rel_vreg[6:0];
assign dp_ir_inst0_data[IS_DST_VREG:IS_DST_VREG-6]         = ir_rt_inst0_dst_vreg[6:0];
assign dp_ir_inst0_data[IS_DSTV_REG:IS_DSTV_REG-4]         = ir_rt_inst0_dstv_reg[4:0];
assign dp_ir_inst0_data[IS_SRCVM_LSU_MATCH]                = 1'b0; //srcvm lsu match for issue
assign dp_ir_inst0_data[IS_SRCVM_BP_RDY:IS_SRCVM_BP_RDY-1] = 2'b0; //srcvm rdy for issue/bypass
assign dp_ir_inst0_data[IS_SRCVM_DATA:IS_SRCVM_DATA-8]     = ir_rt_inst0_srcvm_data[8:0];
assign dp_ir_inst0_data[IS_SRCV2_LSU_MATCH]                = 1'b0; //srcv2 lsu match for issue
assign dp_ir_inst0_data[IS_SRCV2_BP_RDY:IS_SRCV2_BP_RDY-1] = 2'b0; //srcv2 rdy for issue/bypass
assign dp_ir_inst0_data[IS_SRCV2_DATA:IS_SRCV2_DATA-9]     = ir_rt_inst0_srcv2_data[9:0];
assign dp_ir_inst0_data[IS_SRCV1_LSU_MATCH]                = 1'b0; //srcv1 lsu match for issue
assign dp_ir_inst0_data[IS_SRCV1_BP_RDY:IS_SRCV1_BP_RDY-1] = 2'b0; //srcv1 rdy for issue/bypass
assign dp_ir_inst0_data[IS_SRCV1_DATA:IS_SRCV1_DATA-8]     = ir_rt_inst0_srcv1_data[8:0];
assign dp_ir_inst0_data[IS_SRCV0_LSU_MATCH]                = 1'b0; //srcv0 lsu match for issue
assign dp_ir_inst0_data[IS_SRCV0_BP_RDY:IS_SRCV0_BP_RDY-1] = 2'b0; //srcv0 rdy for issue/bypass
assign dp_ir_inst0_data[IS_SRCV0_DATA:IS_SRCV0_DATA-8]     = ir_rt_inst0_srcv0_data[8:0];
assign dp_ir_inst0_data[IS_DSTE_VLD]                       = ir_rt_inst0_dste_vld;
assign dp_ir_inst0_data[IS_DSTV_VLD]                       = ir_rt_inst0_dstv_vld;
assign dp_ir_inst0_data[IS_SRCVM_VLD]                      = ir_rt_inst0_srcvm_vld;
assign dp_ir_inst0_data[IS_SRCV2_VLD]                      = ir_rt_inst0_srcv2_vld;
assign dp_ir_inst0_data[IS_SRCV1_VLD]                      = ir_rt_inst0_srcv1_vld;
assign dp_ir_inst0_data[IS_SRCV0_VLD]                      = ir_rt_inst0_srcv0_vld;
assign dp_ir_inst0_data[IS_DST_REL_PREG:IS_DST_REL_PREG-6] = rt_dp_inst0_rel_preg[6:0];
assign dp_ir_inst0_data[IS_DST_PREG:IS_DST_PREG-6]         = ir_pipedown_inst0_dst_preg[6:0];
assign dp_ir_inst0_data[IS_DST_REG:IS_DST_REG-4]           = ir_inst0_data[IR_DST_REG-1:IR_DST_REG-5];
assign dp_ir_inst0_data[IS_SRC2_LSU_MATCH]                 = 1'b0; //src2 lsu match for issue
assign dp_ir_inst0_data[IS_SRC2_BP_RDY:IS_SRC2_BP_RDY-1]   = 2'b0; //src2 rdy for issue/bypass
assign dp_ir_inst0_data[IS_SRC2_DATA:IS_SRC2_DATA-9]       = rt_dp_inst0_src2_data[9:0];
assign dp_ir_inst0_data[IS_SRC1_LSU_MATCH]                 = 1'b0; //src1 lsu match for issue
assign dp_ir_inst0_data[IS_SRC1_BP_RDY:IS_SRC1_BP_RDY-1]   = 2'b0; //src1 rdy for issue/bypass
assign dp_ir_inst0_data[IS_SRC1_DATA:IS_SRC1_DATA-8]       = rt_dp_inst0_src1_data[8:0];
assign dp_ir_inst0_data[IS_SRC0_LSU_MATCH]                 = 1'b0; //src0 lsu match for issue
assign dp_ir_inst0_data[IS_SRC0_BP_RDY:IS_SRC0_BP_RDY-1]   = 2'b0; //src0 rdy for issue/bypass
assign dp_ir_inst0_data[IS_SRC0_DATA:IS_SRC0_DATA-8]       = rt_dp_inst0_src0_data[8:0];
assign dp_ir_inst0_data[IS_DST_VLD]                        = ir_inst0_data[IR_DST_VLD];
assign dp_ir_inst0_data[IS_SRC2_VLD]                       = ir_inst0_data[IR_SRC2_VLD];
assign dp_ir_inst0_data[IS_SRC1_VLD]                       = ir_inst0_data[IR_SRC1_VLD];
assign dp_ir_inst0_data[IS_SRC0_VLD]                       = ir_inst0_data[IR_SRC0_VLD];
assign dp_ir_inst0_data[IS_OPCODE:IS_OPCODE-31]            = ir_inst0_data[IR_OPCODE:IR_OPCODE-31];

assign dp_ir_inst1_data[IS_VL_PRED]                        = ir_inst1_data[IR_VL_PRED];
assign dp_ir_inst1_data[IS_VL:IS_VL-7]                     = ir_inst1_data[IR_VL:IR_VL-7];
assign dp_ir_inst1_data[IS_LCH_PREG]                       = ir_inst1_lch_preg;
assign dp_ir_inst1_data[IS_VAMO]                           = ir_inst1_vamo;
assign dp_ir_inst1_data[IS_UNIT_STRIDE]                    = ir_inst1_unit_stride;
assign dp_ir_inst1_data[IS_VMB]                            = ir_inst1_data[IR_VMB];
assign dp_ir_inst1_data[IS_DSTV_IMP]                       = ir_inst1_dstv_imp;
assign dp_ir_inst1_data[IS_VIQ_SRCV12_SWITCH]              = ir_inst1_viq_srcv12_switch;
assign dp_ir_inst1_data[IS_VSETVL]                         = ir_inst1_vsetvl;
assign dp_ir_inst1_data[IS_VSETVLI]                        = ir_inst1_vsetvli;
assign dp_ir_inst1_data[IS_VSEW:IS_VSEW-2]                 = ir_inst1_data[IR_VSEW:IR_VSEW-2];
assign dp_ir_inst1_data[IS_VLMUL:IS_VLMUL-1]               = ir_inst1_data[IR_VLMUL:IR_VLMUL-1];
assign dp_ir_inst1_data[IS_VMUL]                           = ir_inst1_vmul;
assign dp_ir_inst1_data[IS_VMUL_UNSPLIT]                   = ir_inst1_vmul_unsplit;
assign dp_ir_inst1_data[IS_VMLA_SHORT]                     = ir_inst1_vmla_short;
assign dp_ir_inst1_data[IS_VMLA_TYPE:IS_VMLA_TYPE-2]       = ir_inst1_vmla_type[2:0];
assign dp_ir_inst1_data[IS_SPLIT_NUM:IS_SPLIT_NUM-6]       = ir_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6];
assign dp_ir_inst1_data[IS_NO_SPEC]                        = ir_inst1_data[IR_NO_SPEC];
assign dp_ir_inst1_data[IS_ALU_SHORT]                      = ir_inst1_alu_short;
assign dp_ir_inst1_data[IS_MLA]                            = ir_inst1_data[IR_MLA];
assign dp_ir_inst1_data[IS_STR]                            = ir_inst1_str;
assign dp_ir_inst1_data[IS_SPLIT_LAST]                     = ir_inst1_data[IR_SPLIT_LAST];
assign dp_ir_inst1_data[IS_MFVR]                           = ir_inst1_mfvr;
assign dp_ir_inst1_data[IS_MTVR]                           = ir_inst1_mtvr;
assign dp_ir_inst1_data[IS_VMLA]                           = ir_rt_inst1_vmla;
assign dp_ir_inst1_data[IS_VDIV]                           = ir_inst1_vdiv;
assign dp_ir_inst1_data[IS_PIPE7]                          = ir_inst1_data[IR_INST_TYPE-1];//pipe7
assign dp_ir_inst1_data[IS_PIPE6]                          = ir_inst1_data[IR_INST_TYPE-2];//pipe6
assign dp_ir_inst1_data[IS_PIPE67]                         = ir_inst1_data[IR_INST_TYPE-3];//pipe67
assign dp_ir_inst1_data[IS_IID_PLUS:IS_IID_PLUS-3]         = ir_inst1_data[IR_IID_PLUS:IR_IID_PLUS-3];
assign dp_ir_inst1_data[IS_BKPTB_INST]                     = ir_inst1_data[IR_BKPTB_INST];
assign dp_ir_inst1_data[IS_BKPTA_INST]                     = ir_inst1_data[IR_BKPTA_INST];
assign dp_ir_inst1_data[IS_EXPT:IS_EXPT-6]                 = ir_inst1_data[IR_EXPT:IR_EXPT-6];
assign dp_ir_inst1_data[IS_RTS]                            = ir_inst1_rts;
assign dp_ir_inst1_data[IS_SPECIAL]                        = ir_inst1_data[IR_INST_TYPE];//special
assign dp_ir_inst1_data[IS_LSU]                            = ir_inst1_data[IR_INST_TYPE-5];//lsu
assign dp_ir_inst1_data[IS_DIV]                            = ir_inst1_data[IR_INST_TYPE-6];//div
assign dp_ir_inst1_data[IS_MULT]                           = ir_inst1_data[IR_INST_TYPE-7];//mult
assign dp_ir_inst1_data[IS_INTMASK]                        = ir_inst1_data[IR_INTMASK];
assign dp_ir_inst1_data[IS_SPLIT]                          = ir_inst1_data[IR_SPLIT];
assign dp_ir_inst1_data[IS_LENGTH]                         = ir_inst1_data[IR_LENGTH];
assign dp_ir_inst1_data[IS_PCFIFO]                         = ir_inst1_pcfifo;
assign dp_ir_inst1_data[IS_PCALL]                          = ir_inst1_pcall;
assign dp_ir_inst1_data[IS_BJU]                            = ir_inst1_data[IR_INST_TYPE-8];//bju
assign dp_ir_inst1_data[IS_LSU_PC:IS_LSU_PC-14]            = ir_inst1_data[IR_PC:IR_PC-14];
assign dp_ir_inst1_data[IS_BAR_TYPE:IS_BAR_TYPE-3]         = ir_inst1_bar_type[3:0];
assign dp_ir_inst1_data[IS_BAR]                            = ir_inst1_bar;
assign dp_ir_inst1_data[IS_STADDR]                         = ir_inst1_data[IR_INST_TYPE-4];//staddr
assign dp_ir_inst1_data[IS_STORE]                          = ir_inst1_store;
assign dp_ir_inst1_data[IS_LOAD]                           = ir_inst1_load;
assign dp_ir_inst1_data[IS_ALU]                            = ir_inst1_data[IR_INST_TYPE-9];//alu
assign dp_ir_inst1_data[IS_DST_REL_EREG:IS_DST_REL_EREG-4] = ir_rt_inst1_rel_ereg[4:0];
assign dp_ir_inst1_data[IS_DST_EREG:IS_DST_EREG-4]         = ir_rt_inst1_dst_ereg[4:0];
assign dp_ir_inst1_data[IS_DST_REL_VREG:IS_DST_REL_VREG-6] = ir_rt_inst1_rel_vreg[6:0];
assign dp_ir_inst1_data[IS_DST_VREG:IS_DST_VREG-6]         = ir_rt_inst1_dst_vreg[6:0];
assign dp_ir_inst1_data[IS_DSTV_REG:IS_DSTV_REG-4]         = ir_rt_inst1_dstv_reg[4:0];
assign dp_ir_inst1_data[IS_SRCVM_LSU_MATCH]                = 1'b0; //srcvm lsu match for issue
assign dp_ir_inst1_data[IS_SRCVM_BP_RDY:IS_SRCVM_BP_RDY-1] = 2'b0; //srcvm rdy for issue/bypass
assign dp_ir_inst1_data[IS_SRCVM_DATA:IS_SRCVM_DATA-8]     = ir_rt_inst1_srcvm_data[8:0];
assign dp_ir_inst1_data[IS_SRCV2_LSU_MATCH]                = 1'b0; //srcv2 lsu match for issue
assign dp_ir_inst1_data[IS_SRCV2_BP_RDY:IS_SRCV2_BP_RDY-1] = 2'b0; //srcv2 rdy for issue/bypass
assign dp_ir_inst1_data[IS_SRCV2_DATA:IS_SRCV2_DATA-9]     = ir_rt_inst1_srcv2_data[9:0];
assign dp_ir_inst1_data[IS_SRCV1_LSU_MATCH]                = 1'b0; //srcv1 lsu match for issue
assign dp_ir_inst1_data[IS_SRCV1_BP_RDY:IS_SRCV1_BP_RDY-1] = 2'b0; //srcv1 rdy for issue/bypass
assign dp_ir_inst1_data[IS_SRCV1_DATA:IS_SRCV1_DATA-8]     = ir_rt_inst1_srcv1_data[8:0];
assign dp_ir_inst1_data[IS_SRCV0_LSU_MATCH]                = 1'b0; //srcv0 lsu match for issue
assign dp_ir_inst1_data[IS_SRCV0_BP_RDY:IS_SRCV0_BP_RDY-1] = 2'b0; //srcv0 rdy for issue/bypass
assign dp_ir_inst1_data[IS_SRCV0_DATA:IS_SRCV0_DATA-8]     = ir_rt_inst1_srcv0_data[8:0];
assign dp_ir_inst1_data[IS_DSTE_VLD]                       = ir_rt_inst1_dste_vld;
assign dp_ir_inst1_data[IS_DSTV_VLD]                       = ir_rt_inst1_dstv_vld;
assign dp_ir_inst1_data[IS_SRCVM_VLD]                      = ir_rt_inst1_srcvm_vld;
assign dp_ir_inst1_data[IS_SRCV2_VLD]                      = ir_rt_inst1_srcv2_vld;
assign dp_ir_inst1_data[IS_SRCV1_VLD]                      = ir_rt_inst1_srcv1_vld;
assign dp_ir_inst1_data[IS_SRCV0_VLD]                      = ir_rt_inst1_srcv0_vld;
assign dp_ir_inst1_data[IS_DST_REL_PREG:IS_DST_REL_PREG-6] = rt_dp_inst1_rel_preg[6:0];
assign dp_ir_inst1_data[IS_DST_PREG:IS_DST_PREG-6]         = ir_pipedown_inst1_dst_preg[6:0];
assign dp_ir_inst1_data[IS_DST_REG:IS_DST_REG-4]           = ir_inst1_data[IR_DST_REG-1:IR_DST_REG-5];
assign dp_ir_inst1_data[IS_SRC2_LSU_MATCH]                 = 1'b0; //src2 lsu match for issue
assign dp_ir_inst1_data[IS_SRC2_BP_RDY:IS_SRC2_BP_RDY-1]   = 2'b0; //src2 rdy for issue/bypass
assign dp_ir_inst1_data[IS_SRC2_DATA:IS_SRC2_DATA-9]       = rt_dp_inst1_src2_data[9:0];
assign dp_ir_inst1_data[IS_SRC1_LSU_MATCH]                 = 1'b0; //src1 lsu match for issue
assign dp_ir_inst1_data[IS_SRC1_BP_RDY:IS_SRC1_BP_RDY-1]   = 2'b0; //src1 rdy for issue/bypass
assign dp_ir_inst1_data[IS_SRC1_DATA:IS_SRC1_DATA-8]       = rt_dp_inst1_src1_data[8:0];
assign dp_ir_inst1_data[IS_SRC0_LSU_MATCH]                 = 1'b0; //src0 lsu match for issue
assign dp_ir_inst1_data[IS_SRC0_BP_RDY:IS_SRC0_BP_RDY-1]   = 2'b0; //src0 rdy for issue/bypass
assign dp_ir_inst1_data[IS_SRC0_DATA:IS_SRC0_DATA-8]       = rt_dp_inst1_src0_data[8:0];
assign dp_ir_inst1_data[IS_DST_VLD]                        = ir_inst1_data[IR_DST_VLD];
assign dp_ir_inst1_data[IS_SRC2_VLD]                       = ir_inst1_data[IR_SRC2_VLD];
assign dp_ir_inst1_data[IS_SRC1_VLD]                       = ir_inst1_data[IR_SRC1_VLD];
assign dp_ir_inst1_data[IS_SRC0_VLD]                       = ir_inst1_data[IR_SRC0_VLD];
assign dp_ir_inst1_data[IS_OPCODE:IS_OPCODE-31]            = ir_inst1_data[IR_OPCODE:IR_OPCODE-31];

assign dp_ir_inst2_data[IS_VL_PRED]                        = ir_inst2_data[IR_VL_PRED];
assign dp_ir_inst2_data[IS_VL:IS_VL-7]                     = ir_inst2_data[IR_VL:IR_VL-7];
assign dp_ir_inst2_data[IS_LCH_PREG]                       = ir_inst2_lch_preg;
assign dp_ir_inst2_data[IS_VAMO]                           = ir_inst2_vamo;
assign dp_ir_inst2_data[IS_UNIT_STRIDE]                    = ir_inst2_unit_stride;
assign dp_ir_inst2_data[IS_VMB]                            = ir_inst2_data[IR_VMB];
assign dp_ir_inst2_data[IS_DSTV_IMP]                       = ir_inst2_dstv_imp;
assign dp_ir_inst2_data[IS_VIQ_SRCV12_SWITCH]              = ir_inst2_viq_srcv12_switch;
assign dp_ir_inst2_data[IS_VSETVL]                         = ir_inst2_vsetvl;
assign dp_ir_inst2_data[IS_VSETVLI]                        = ir_inst2_vsetvli;
assign dp_ir_inst2_data[IS_VSEW:IS_VSEW-2]                 = ir_inst2_data[IR_VSEW:IR_VSEW-2];
assign dp_ir_inst2_data[IS_VLMUL:IS_VLMUL-1]               = ir_inst2_data[IR_VLMUL:IR_VLMUL-1];
assign dp_ir_inst2_data[IS_VMUL]                           = ir_inst2_vmul;
assign dp_ir_inst2_data[IS_VMUL_UNSPLIT]                   = ir_inst2_vmul_unsplit;
assign dp_ir_inst2_data[IS_VMLA_SHORT]                     = ir_inst2_vmla_short;
assign dp_ir_inst2_data[IS_VMLA_TYPE:IS_VMLA_TYPE-2]       = ir_inst2_vmla_type[2:0];
assign dp_ir_inst2_data[IS_SPLIT_NUM:IS_SPLIT_NUM-6]       = ir_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6];
assign dp_ir_inst2_data[IS_NO_SPEC]                        = ir_inst2_data[IR_NO_SPEC];
assign dp_ir_inst2_data[IS_ALU_SHORT]                      = ir_inst2_alu_short;
assign dp_ir_inst2_data[IS_MLA]                            = ir_inst2_data[IR_MLA];
assign dp_ir_inst2_data[IS_STR]                            = ir_inst2_str;
assign dp_ir_inst2_data[IS_SPLIT_LAST]                     = ir_inst2_data[IR_SPLIT_LAST];
assign dp_ir_inst2_data[IS_MFVR]                           = ir_inst2_mfvr;
assign dp_ir_inst2_data[IS_MTVR]                           = ir_inst2_mtvr;
assign dp_ir_inst2_data[IS_VMLA]                           = ir_rt_inst2_vmla;
assign dp_ir_inst2_data[IS_VDIV]                           = ir_inst2_vdiv;
assign dp_ir_inst2_data[IS_PIPE7]                          = ir_inst2_data[IR_INST_TYPE-1];//pipe7
assign dp_ir_inst2_data[IS_PIPE6]                          = ir_inst2_data[IR_INST_TYPE-2];//pipe6
assign dp_ir_inst2_data[IS_PIPE67]                         = ir_inst2_data[IR_INST_TYPE-3];//pipe67
assign dp_ir_inst2_data[IS_IID_PLUS:IS_IID_PLUS-3]         = ir_inst2_data[IR_IID_PLUS:IR_IID_PLUS-3];
assign dp_ir_inst2_data[IS_BKPTB_INST]                     = ir_inst2_data[IR_BKPTB_INST];
assign dp_ir_inst2_data[IS_BKPTA_INST]                     = ir_inst2_data[IR_BKPTA_INST];
assign dp_ir_inst2_data[IS_EXPT:IS_EXPT-6]                 = ir_inst2_data[IR_EXPT:IR_EXPT-6];
assign dp_ir_inst2_data[IS_RTS]                            = ir_inst2_rts;
assign dp_ir_inst2_data[IS_SPECIAL]                        = ir_inst2_data[IR_INST_TYPE];//special
assign dp_ir_inst2_data[IS_LSU]                            = ir_inst2_data[IR_INST_TYPE-5];//lsu
assign dp_ir_inst2_data[IS_DIV]                            = ir_inst2_data[IR_INST_TYPE-6];//div
assign dp_ir_inst2_data[IS_MULT]                           = ir_inst2_data[IR_INST_TYPE-7];//mult
assign dp_ir_inst2_data[IS_INTMASK]                        = ir_inst2_data[IR_INTMASK];
assign dp_ir_inst2_data[IS_SPLIT]                          = ir_inst2_data[IR_SPLIT];
assign dp_ir_inst2_data[IS_LENGTH]                         = ir_inst2_data[IR_LENGTH];
assign dp_ir_inst2_data[IS_PCFIFO]                         = ir_inst2_pcfifo;
assign dp_ir_inst2_data[IS_PCALL]                          = ir_inst2_pcall;
assign dp_ir_inst2_data[IS_BJU]                            = ir_inst2_data[IR_INST_TYPE-8];//bju
assign dp_ir_inst2_data[IS_LSU_PC:IS_LSU_PC-14]            = ir_inst2_data[IR_PC:IR_PC-14];
assign dp_ir_inst2_data[IS_BAR_TYPE:IS_BAR_TYPE-3]         = ir_inst2_bar_type[3:0];
assign dp_ir_inst2_data[IS_BAR]                            = ir_inst2_bar;
assign dp_ir_inst2_data[IS_STADDR]                         = ir_inst2_data[IR_INST_TYPE-4];//staddr
assign dp_ir_inst2_data[IS_STORE]                          = ir_inst2_store;
assign dp_ir_inst2_data[IS_LOAD]                           = ir_inst2_load;
assign dp_ir_inst2_data[IS_ALU]                            = ir_inst2_data[IR_INST_TYPE-9];//alu
assign dp_ir_inst2_data[IS_DST_REL_EREG:IS_DST_REL_EREG-4] = ir_rt_inst2_rel_ereg[4:0];
assign dp_ir_inst2_data[IS_DST_EREG:IS_DST_EREG-4]         = ir_rt_inst2_dst_ereg[4:0];
assign dp_ir_inst2_data[IS_DST_REL_VREG:IS_DST_REL_VREG-6] = ir_rt_inst2_rel_vreg[6:0];
assign dp_ir_inst2_data[IS_DST_VREG:IS_DST_VREG-6]         = ir_rt_inst2_dst_vreg[6:0];
assign dp_ir_inst2_data[IS_DSTV_REG:IS_DSTV_REG-4]         = ir_rt_inst2_dstv_reg[4:0];
assign dp_ir_inst2_data[IS_SRCVM_LSU_MATCH]                = 1'b0; //srcvm lsu match for issue
assign dp_ir_inst2_data[IS_SRCVM_BP_RDY:IS_SRCVM_BP_RDY-1] = 2'b0; //srcvm rdy for issue/bypass
assign dp_ir_inst2_data[IS_SRCVM_DATA:IS_SRCVM_DATA-8]     = ir_rt_inst2_srcvm_data[8:0];
assign dp_ir_inst2_data[IS_SRCV2_LSU_MATCH]                = 1'b0; //srcv2 lsu match for issue
assign dp_ir_inst2_data[IS_SRCV2_BP_RDY:IS_SRCV2_BP_RDY-1] = 2'b0; //srcv2 rdy for issue/bypass
assign dp_ir_inst2_data[IS_SRCV2_DATA:IS_SRCV2_DATA-9]     = ir_rt_inst2_srcv2_data[9:0];
assign dp_ir_inst2_data[IS_SRCV1_LSU_MATCH]                = 1'b0; //srcv1 lsu match for issue
assign dp_ir_inst2_data[IS_SRCV1_BP_RDY:IS_SRCV1_BP_RDY-1] = 2'b0; //srcv1 rdy for issue/bypass
assign dp_ir_inst2_data[IS_SRCV1_DATA:IS_SRCV1_DATA-8]     = ir_rt_inst2_srcv1_data[8:0];
assign dp_ir_inst2_data[IS_SRCV0_LSU_MATCH]                = 1'b0; //srcv0 lsu match for issue
assign dp_ir_inst2_data[IS_SRCV0_BP_RDY:IS_SRCV0_BP_RDY-1] = 2'b0; //srcv0 rdy for issue/bypass
assign dp_ir_inst2_data[IS_SRCV0_DATA:IS_SRCV0_DATA-8]     = ir_rt_inst2_srcv0_data[8:0];
assign dp_ir_inst2_data[IS_DSTE_VLD]                       = ir_rt_inst2_dste_vld;
assign dp_ir_inst2_data[IS_DSTV_VLD]                       = ir_rt_inst2_dstv_vld;
assign dp_ir_inst2_data[IS_SRCVM_VLD]                      = ir_rt_inst2_srcvm_vld;
assign dp_ir_inst2_data[IS_SRCV2_VLD]                      = ir_rt_inst2_srcv2_vld;
assign dp_ir_inst2_data[IS_SRCV1_VLD]                      = ir_rt_inst2_srcv1_vld;
assign dp_ir_inst2_data[IS_SRCV0_VLD]                      = ir_rt_inst2_srcv0_vld;
assign dp_ir_inst2_data[IS_DST_REL_PREG:IS_DST_REL_PREG-6] = rt_dp_inst2_rel_preg[6:0];
assign dp_ir_inst2_data[IS_DST_PREG:IS_DST_PREG-6]         = ir_pipedown_inst2_dst_preg[6:0];
assign dp_ir_inst2_data[IS_DST_REG:IS_DST_REG-4]           = ir_inst2_data[IR_DST_REG-1:IR_DST_REG-5];
assign dp_ir_inst2_data[IS_SRC2_LSU_MATCH]                 = 1'b0; //src2 lsu match for issue
assign dp_ir_inst2_data[IS_SRC2_BP_RDY:IS_SRC2_BP_RDY-1]   = 2'b0; //src2 rdy for issue/bypass
assign dp_ir_inst2_data[IS_SRC2_DATA:IS_SRC2_DATA-9]       = rt_dp_inst2_src2_data[9:0];
assign dp_ir_inst2_data[IS_SRC1_LSU_MATCH]                 = 1'b0; //src1 lsu match for issue
assign dp_ir_inst2_data[IS_SRC1_BP_RDY:IS_SRC1_BP_RDY-1]   = 2'b0; //src1 rdy for issue/bypass
assign dp_ir_inst2_data[IS_SRC1_DATA:IS_SRC1_DATA-8]       = rt_dp_inst2_src1_data[8:0];
assign dp_ir_inst2_data[IS_SRC0_LSU_MATCH]                 = 1'b0; //src0 lsu match for issue
assign dp_ir_inst2_data[IS_SRC0_BP_RDY:IS_SRC0_BP_RDY-1]   = 2'b0; //src0 rdy for issue/bypass
assign dp_ir_inst2_data[IS_SRC0_DATA:IS_SRC0_DATA-8]       = rt_dp_inst2_src0_data[8:0];
assign dp_ir_inst2_data[IS_DST_VLD]                        = ir_inst2_data[IR_DST_VLD];
assign dp_ir_inst2_data[IS_SRC2_VLD]                       = ir_inst2_data[IR_SRC2_VLD];
assign dp_ir_inst2_data[IS_SRC1_VLD]                       = ir_inst2_data[IR_SRC1_VLD];
assign dp_ir_inst2_data[IS_SRC0_VLD]                       = ir_inst2_data[IR_SRC0_VLD];
assign dp_ir_inst2_data[IS_OPCODE:IS_OPCODE-31]            = ir_inst2_data[IR_OPCODE:IR_OPCODE-31];

assign dp_ir_inst3_data[IS_VL_PRED]                        = ir_inst3_data[IR_VL_PRED];
assign dp_ir_inst3_data[IS_VL:IS_VL-7]                     = ir_inst3_data[IR_VL:IR_VL-7];
assign dp_ir_inst3_data[IS_LCH_PREG]                       = ir_inst3_lch_preg;
assign dp_ir_inst3_data[IS_VAMO]                           = ir_inst3_vamo;
assign dp_ir_inst3_data[IS_UNIT_STRIDE]                    = ir_inst3_unit_stride;
assign dp_ir_inst3_data[IS_VMB]                            = ir_inst3_data[IR_VMB];
assign dp_ir_inst3_data[IS_DSTV_IMP]                       = ir_inst3_dstv_imp;
assign dp_ir_inst3_data[IS_VIQ_SRCV12_SWITCH]              = ir_inst3_viq_srcv12_switch;
assign dp_ir_inst3_data[IS_VSETVL]                         = ir_inst3_vsetvl;
assign dp_ir_inst3_data[IS_VSETVLI]                        = ir_inst3_vsetvli;
assign dp_ir_inst3_data[IS_VSEW:IS_VSEW-2]                 = ir_inst3_data[IR_VSEW:IR_VSEW-2];
assign dp_ir_inst3_data[IS_VLMUL:IS_VLMUL-1]               = ir_inst3_data[IR_VLMUL:IR_VLMUL-1];
assign dp_ir_inst3_data[IS_VMUL]                           = ir_inst3_vmul;
assign dp_ir_inst3_data[IS_VMUL_UNSPLIT]                   = ir_inst3_vmul_unsplit;
assign dp_ir_inst3_data[IS_VMLA_SHORT]                     = ir_inst3_vmla_short;
assign dp_ir_inst3_data[IS_VMLA_TYPE:IS_VMLA_TYPE-2]       = ir_inst3_vmla_type[2:0];
assign dp_ir_inst3_data[IS_SPLIT_NUM:IS_SPLIT_NUM-6]       = ir_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6];
assign dp_ir_inst3_data[IS_NO_SPEC]                        = ir_inst3_data[IR_NO_SPEC];
assign dp_ir_inst3_data[IS_ALU_SHORT]                      = ir_inst3_alu_short;
assign dp_ir_inst3_data[IS_MLA]                            = ir_inst3_data[IR_MLA];
assign dp_ir_inst3_data[IS_STR]                            = ir_inst3_str;
assign dp_ir_inst3_data[IS_SPLIT_LAST]                     = ir_inst3_data[IR_SPLIT_LAST];
assign dp_ir_inst3_data[IS_MFVR]                           = ir_inst3_mfvr;
assign dp_ir_inst3_data[IS_MTVR]                           = ir_inst3_mtvr;
assign dp_ir_inst3_data[IS_VMLA]                           = ir_rt_inst3_vmla;
assign dp_ir_inst3_data[IS_VDIV]                           = ir_inst3_vdiv;
assign dp_ir_inst3_data[IS_PIPE7]                          = ir_inst3_data[IR_INST_TYPE-1];//pipe7
assign dp_ir_inst3_data[IS_PIPE6]                          = ir_inst3_data[IR_INST_TYPE-2];//pipe6
assign dp_ir_inst3_data[IS_PIPE67]                         = ir_inst3_data[IR_INST_TYPE-3];//pipe67
assign dp_ir_inst3_data[IS_IID_PLUS:IS_IID_PLUS-3]         = ir_inst3_data[IR_IID_PLUS:IR_IID_PLUS-3];
assign dp_ir_inst3_data[IS_BKPTB_INST]                     = ir_inst3_data[IR_BKPTB_INST];
assign dp_ir_inst3_data[IS_BKPTA_INST]                     = ir_inst3_data[IR_BKPTA_INST];
assign dp_ir_inst3_data[IS_EXPT:IS_EXPT-6]                 = ir_inst3_data[IR_EXPT:IR_EXPT-6];
assign dp_ir_inst3_data[IS_RTS]                            = ir_inst3_rts;
assign dp_ir_inst3_data[IS_SPECIAL]                        = ir_inst3_data[IR_INST_TYPE];//special
assign dp_ir_inst3_data[IS_LSU]                            = ir_inst3_data[IR_INST_TYPE-5];//lsu
assign dp_ir_inst3_data[IS_DIV]                            = ir_inst3_data[IR_INST_TYPE-6];//div
assign dp_ir_inst3_data[IS_MULT]                           = ir_inst3_data[IR_INST_TYPE-7];//mult
assign dp_ir_inst3_data[IS_INTMASK]                        = ir_inst3_data[IR_INTMASK];
assign dp_ir_inst3_data[IS_SPLIT]                          = ir_inst3_data[IR_SPLIT];
assign dp_ir_inst3_data[IS_LENGTH]                         = ir_inst3_data[IR_LENGTH];
assign dp_ir_inst3_data[IS_PCFIFO]                         = ir_inst3_pcfifo;
assign dp_ir_inst3_data[IS_PCALL]                          = ir_inst3_pcall;
assign dp_ir_inst3_data[IS_BJU]                            = ir_inst3_data[IR_INST_TYPE-8];//bju
assign dp_ir_inst3_data[IS_LSU_PC:IS_LSU_PC-14]            = ir_inst3_data[IR_PC:IR_PC-14];
assign dp_ir_inst3_data[IS_BAR_TYPE:IS_BAR_TYPE-3]         = ir_inst3_bar_type[3:0];
assign dp_ir_inst3_data[IS_BAR]                            = ir_inst3_bar;
assign dp_ir_inst3_data[IS_STADDR]                         = ir_inst3_data[IR_INST_TYPE-4];//staddr
assign dp_ir_inst3_data[IS_STORE]                          = ir_inst3_store;
assign dp_ir_inst3_data[IS_LOAD]                           = ir_inst3_load;
assign dp_ir_inst3_data[IS_ALU]                            = ir_inst3_data[IR_INST_TYPE-9];//alu
assign dp_ir_inst3_data[IS_DST_REL_EREG:IS_DST_REL_EREG-4] = ir_rt_inst3_rel_ereg[4:0];
assign dp_ir_inst3_data[IS_DST_EREG:IS_DST_EREG-4]         = ir_rt_inst3_dst_ereg[4:0];
assign dp_ir_inst3_data[IS_DST_REL_VREG:IS_DST_REL_VREG-6] = ir_rt_inst3_rel_vreg[6:0];
assign dp_ir_inst3_data[IS_DST_VREG:IS_DST_VREG-6]         = ir_rt_inst3_dst_vreg[6:0];
assign dp_ir_inst3_data[IS_DSTV_REG:IS_DSTV_REG-4]         = ir_rt_inst3_dstv_reg[4:0];
assign dp_ir_inst3_data[IS_SRCVM_LSU_MATCH]                = 1'b0; //srcvm lsu match for issue
assign dp_ir_inst3_data[IS_SRCVM_BP_RDY:IS_SRCVM_BP_RDY-1] = 2'b0; //srcvm rdy for issue/bypass
assign dp_ir_inst3_data[IS_SRCVM_DATA:IS_SRCVM_DATA-8]     = ir_rt_inst3_srcvm_data[8:0];
assign dp_ir_inst3_data[IS_SRCV2_LSU_MATCH]                = 1'b0; //srcv2 lsu match for issue
assign dp_ir_inst3_data[IS_SRCV2_BP_RDY:IS_SRCV2_BP_RDY-1] = 2'b0; //srcv2 rdy for issue/bypass
assign dp_ir_inst3_data[IS_SRCV2_DATA:IS_SRCV2_DATA-9]     = ir_rt_inst3_srcv2_data[9:0];
assign dp_ir_inst3_data[IS_SRCV1_LSU_MATCH]                = 1'b0; //srcv1 lsu match for issue
assign dp_ir_inst3_data[IS_SRCV1_BP_RDY:IS_SRCV1_BP_RDY-1] = 2'b0; //srcv1 rdy for issue/bypass
assign dp_ir_inst3_data[IS_SRCV1_DATA:IS_SRCV1_DATA-8]     = ir_rt_inst3_srcv1_data[8:0];
assign dp_ir_inst3_data[IS_SRCV0_LSU_MATCH]                = 1'b0; //srcv0 lsu match for issue
assign dp_ir_inst3_data[IS_SRCV0_BP_RDY:IS_SRCV0_BP_RDY-1] = 2'b0; //srcv0 rdy for issue/bypass
assign dp_ir_inst3_data[IS_SRCV0_DATA:IS_SRCV0_DATA-8]     = ir_rt_inst3_srcv0_data[8:0];
assign dp_ir_inst3_data[IS_DSTE_VLD]                       = ir_rt_inst3_dste_vld;
assign dp_ir_inst3_data[IS_DSTV_VLD]                       = ir_rt_inst3_dstv_vld;
assign dp_ir_inst3_data[IS_SRCVM_VLD]                      = ir_rt_inst3_srcvm_vld;
assign dp_ir_inst3_data[IS_SRCV2_VLD]                      = ir_rt_inst3_srcv2_vld;
assign dp_ir_inst3_data[IS_SRCV1_VLD]                      = ir_rt_inst3_srcv1_vld;
assign dp_ir_inst3_data[IS_SRCV0_VLD]                      = ir_rt_inst3_srcv0_vld;
assign dp_ir_inst3_data[IS_DST_REL_PREG:IS_DST_REL_PREG-6] = rt_dp_inst3_rel_preg[6:0];
assign dp_ir_inst3_data[IS_DST_PREG:IS_DST_PREG-6]         = ir_pipedown_inst3_dst_preg[6:0];
assign dp_ir_inst3_data[IS_DST_REG:IS_DST_REG-4]           = ir_inst3_data[IR_DST_REG-1:IR_DST_REG-5];
assign dp_ir_inst3_data[IS_SRC2_LSU_MATCH]                 = 1'b0; //src2 lsu match for issue
assign dp_ir_inst3_data[IS_SRC2_BP_RDY:IS_SRC2_BP_RDY-1]   = 2'b0; //src2 rdy for issue/bypass
assign dp_ir_inst3_data[IS_SRC2_DATA:IS_SRC2_DATA-9]       = rt_dp_inst3_src2_data[9:0];
assign dp_ir_inst3_data[IS_SRC1_LSU_MATCH]                 = 1'b0; //src1 lsu match for issue
assign dp_ir_inst3_data[IS_SRC1_BP_RDY:IS_SRC1_BP_RDY-1]   = 2'b0; //src1 rdy for issue/bypass
assign dp_ir_inst3_data[IS_SRC1_DATA:IS_SRC1_DATA-8]       = rt_dp_inst3_src1_data[8:0];
assign dp_ir_inst3_data[IS_SRC0_LSU_MATCH]                 = 1'b0; //src0 lsu match for issue
assign dp_ir_inst3_data[IS_SRC0_BP_RDY:IS_SRC0_BP_RDY-1]   = 2'b0; //src0 rdy for issue/bypass
assign dp_ir_inst3_data[IS_SRC0_DATA:IS_SRC0_DATA-8]       = rt_dp_inst3_src0_data[8:0];
assign dp_ir_inst3_data[IS_DST_VLD]                        = ir_inst3_data[IR_DST_VLD];
assign dp_ir_inst3_data[IS_SRC2_VLD]                       = ir_inst3_data[IR_SRC2_VLD];
assign dp_ir_inst3_data[IS_SRC1_VLD]                       = ir_inst3_data[IR_SRC1_VLD];
assign dp_ir_inst3_data[IS_SRC0_VLD]                       = ir_inst3_data[IR_SRC0_VLD];
assign dp_ir_inst3_data[IS_OPCODE:IS_OPCODE-31]            = ir_inst3_data[IR_OPCODE:IR_OPCODE-31];

// &ModuleEnd; @1241
endmodule


