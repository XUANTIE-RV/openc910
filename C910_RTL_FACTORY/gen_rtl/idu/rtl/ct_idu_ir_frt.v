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

// &ModuleBeg; @25
module ct_idu_ir_frt(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ir_stall,
  ctrl_rt_inst0_vld,
  ctrl_rt_inst1_vld,
  ctrl_rt_inst2_vld,
  ctrl_rt_inst3_vld,
  ctrl_xx_rf_pipe6_vmla_lch_vld_dupx,
  ctrl_xx_rf_pipe7_vmla_lch_vld_dupx,
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
  dp_rt_dep_info,
  dp_xx_rf_pipe6_dst_vreg_dupx,
  dp_xx_rf_pipe7_dst_vreg_dupx,
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
  ifu_xx_sync_reset,
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dupx,
  lsu_idu_dc_pipe3_vload_inst_vld_dupx,
  lsu_idu_dc_pipe3_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_idu_rt_recover_ereg,
  rtu_idu_rt_recover_freg,
  rtu_yy_xx_flush,
  vfpu_idu_ex1_pipe6_data_vld_dupx,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dupx,
  vfpu_idu_ex1_pipe6_vreg_dupx,
  vfpu_idu_ex1_pipe7_data_vld_dupx,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dupx,
  vfpu_idu_ex1_pipe7_vreg_dupx,
  vfpu_idu_ex2_pipe6_data_vld_dupx,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dupx,
  vfpu_idu_ex2_pipe6_vreg_dupx,
  vfpu_idu_ex2_pipe7_data_vld_dupx,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dupx,
  vfpu_idu_ex2_pipe7_vreg_dupx,
  vfpu_idu_ex3_pipe6_data_vld_dupx,
  vfpu_idu_ex3_pipe6_vreg_dupx,
  vfpu_idu_ex3_pipe7_data_vld_dupx,
  vfpu_idu_ex3_pipe7_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx
);

// &Ports; @26
input            cp0_idu_icg_en;                       
input            cp0_yy_clk_en;                        
input            cpurst_b;                             
input            ctrl_ir_stall;                        
input            ctrl_rt_inst0_vld;                    
input            ctrl_rt_inst1_vld;                    
input            ctrl_rt_inst2_vld;                    
input            ctrl_rt_inst3_vld;                    
input            ctrl_xx_rf_pipe6_vmla_lch_vld_dupx;   
input            ctrl_xx_rf_pipe7_vmla_lch_vld_dupx;   
input   [4  :0]  dp_frt_inst0_dst_ereg;                
input   [5  :0]  dp_frt_inst0_dst_freg;                
input            dp_frt_inst0_dste_vld;                
input   [5  :0]  dp_frt_inst0_dstf_reg;                
input            dp_frt_inst0_dstf_vld;                
input            dp_frt_inst0_fmla;                    
input            dp_frt_inst0_fmov;                    
input   [5  :0]  dp_frt_inst0_srcf0_reg;               
input            dp_frt_inst0_srcf0_vld;               
input   [5  :0]  dp_frt_inst0_srcf1_reg;               
input            dp_frt_inst0_srcf1_vld;               
input   [5  :0]  dp_frt_inst0_srcf2_reg;               
input            dp_frt_inst0_srcf2_vld;               
input   [4  :0]  dp_frt_inst1_dst_ereg;                
input   [5  :0]  dp_frt_inst1_dst_freg;                
input            dp_frt_inst1_dste_vld;                
input   [5  :0]  dp_frt_inst1_dstf_reg;                
input            dp_frt_inst1_dstf_vld;                
input            dp_frt_inst1_fmla;                    
input            dp_frt_inst1_fmov;                    
input   [5  :0]  dp_frt_inst1_srcf0_reg;               
input            dp_frt_inst1_srcf0_vld;               
input   [5  :0]  dp_frt_inst1_srcf1_reg;               
input            dp_frt_inst1_srcf1_vld;               
input   [5  :0]  dp_frt_inst1_srcf2_reg;               
input            dp_frt_inst1_srcf2_vld;               
input   [4  :0]  dp_frt_inst2_dst_ereg;                
input   [5  :0]  dp_frt_inst2_dst_freg;                
input            dp_frt_inst2_dste_vld;                
input   [5  :0]  dp_frt_inst2_dstf_reg;                
input            dp_frt_inst2_dstf_vld;                
input            dp_frt_inst2_fmla;                    
input            dp_frt_inst2_fmov;                    
input   [5  :0]  dp_frt_inst2_srcf0_reg;               
input            dp_frt_inst2_srcf0_vld;               
input   [5  :0]  dp_frt_inst2_srcf1_reg;               
input            dp_frt_inst2_srcf1_vld;               
input   [5  :0]  dp_frt_inst2_srcf2_reg;               
input            dp_frt_inst2_srcf2_vld;               
input   [4  :0]  dp_frt_inst3_dst_ereg;                
input   [5  :0]  dp_frt_inst3_dst_freg;                
input            dp_frt_inst3_dste_vld;                
input   [5  :0]  dp_frt_inst3_dstf_reg;                
input            dp_frt_inst3_dstf_vld;                
input            dp_frt_inst3_fmla;                    
input   [5  :0]  dp_frt_inst3_srcf0_reg;               
input            dp_frt_inst3_srcf0_vld;               
input   [5  :0]  dp_frt_inst3_srcf1_reg;               
input            dp_frt_inst3_srcf1_vld;               
input   [5  :0]  dp_frt_inst3_srcf2_reg;               
input            dp_frt_inst3_srcf2_vld;               
input   [16 :0]  dp_rt_dep_info;                       
input   [6  :0]  dp_xx_rf_pipe6_dst_vreg_dupx;         
input   [6  :0]  dp_xx_rf_pipe7_dst_vreg_dupx;         
input            forever_cpuclk;                       
input            ifu_xx_sync_reset;                    
input            lsu_idu_ag_pipe3_vload_inst_vld;      
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;           
input            lsu_idu_dc_pipe3_vload_inst_vld_dupx; 
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;           
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;        
input            lsu_idu_wb_pipe3_wb_vreg_vld_dupx;    
input            pad_yy_icg_scan_en;                   
input            rtu_idu_flush_fe;                     
input            rtu_idu_flush_is;                     
input   [4  :0]  rtu_idu_rt_recover_ereg;              
input   [191:0]  rtu_idu_rt_recover_freg;              
input            rtu_yy_xx_flush;                      
input            vfpu_idu_ex1_pipe6_data_vld_dupx;     
input            vfpu_idu_ex1_pipe6_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex1_pipe6_vreg_dupx;         
input            vfpu_idu_ex1_pipe7_data_vld_dupx;     
input            vfpu_idu_ex1_pipe7_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex1_pipe7_vreg_dupx;         
input            vfpu_idu_ex2_pipe6_data_vld_dupx;     
input            vfpu_idu_ex2_pipe6_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex2_pipe6_vreg_dupx;         
input            vfpu_idu_ex2_pipe7_data_vld_dupx;     
input            vfpu_idu_ex2_pipe7_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex2_pipe7_vreg_dupx;         
input            vfpu_idu_ex3_pipe6_data_vld_dupx;     
input   [6  :0]  vfpu_idu_ex3_pipe6_vreg_dupx;         
input            vfpu_idu_ex3_pipe7_data_vld_dupx;     
input   [6  :0]  vfpu_idu_ex3_pipe7_vreg_dupx;         
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;      
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;  
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;      
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;  
output           frt_dp_inst01_srcf2_match;            
output           frt_dp_inst02_srcf2_match;            
output           frt_dp_inst03_srcf2_match;            
output  [4  :0]  frt_dp_inst0_rel_ereg;                
output  [6  :0]  frt_dp_inst0_rel_freg;                
output  [8  :0]  frt_dp_inst0_srcf0_data;              
output  [8  :0]  frt_dp_inst0_srcf1_data;              
output  [9  :0]  frt_dp_inst0_srcf2_data;              
output           frt_dp_inst12_srcf2_match;            
output           frt_dp_inst13_srcf2_match;            
output  [4  :0]  frt_dp_inst1_rel_ereg;                
output  [6  :0]  frt_dp_inst1_rel_freg;                
output  [8  :0]  frt_dp_inst1_srcf0_data;              
output  [8  :0]  frt_dp_inst1_srcf1_data;              
output  [9  :0]  frt_dp_inst1_srcf2_data;              
output           frt_dp_inst23_srcf2_match;            
output  [4  :0]  frt_dp_inst2_rel_ereg;                
output  [6  :0]  frt_dp_inst2_rel_freg;                
output  [8  :0]  frt_dp_inst2_srcf0_data;              
output  [8  :0]  frt_dp_inst2_srcf1_data;              
output  [9  :0]  frt_dp_inst2_srcf2_data;              
output  [4  :0]  frt_dp_inst3_rel_ereg;                
output  [6  :0]  frt_dp_inst3_rel_freg;                
output  [8  :0]  frt_dp_inst3_srcf0_data;              
output  [8  :0]  frt_dp_inst3_srcf1_data;              
output  [9  :0]  frt_dp_inst3_srcf2_data;              

// &Regs; @27
reg     [4  :0]  ereg;                                 
reg              frt_dp_inst01_srcf2_match;            
reg              frt_dp_inst02_srcf2_match;            
reg              frt_dp_inst03_srcf2_match;            
reg              frt_dp_inst12_srcf2_match;            
reg              frt_dp_inst13_srcf2_match;            
reg     [6  :0]  frt_dp_inst1_rel_freg;                
reg     [8  :0]  frt_dp_inst1_srcf0_data;              
reg     [8  :0]  frt_dp_inst1_srcf1_data;              
reg     [9  :0]  frt_dp_inst1_srcf2_data;              
reg              frt_dp_inst23_srcf2_match;            
reg     [4  :0]  frt_dp_inst2_rel_ereg;                
reg     [6  :0]  frt_dp_inst2_rel_freg;                
reg     [8  :0]  frt_dp_inst2_srcf0_data;              
reg     [8  :0]  frt_dp_inst2_srcf1_data;              
reg     [9  :0]  frt_dp_inst2_srcf2_data;              
reg     [4  :0]  frt_dp_inst3_rel_ereg;                
reg     [6  :0]  frt_dp_inst3_rel_freg;                
reg     [8  :0]  frt_dp_inst3_srcf0_data;              
reg     [8  :0]  frt_dp_inst3_srcf1_data;              
reg     [9  :0]  frt_dp_inst3_srcf2_data;              
reg     [5  :0]  frt_inst1_fmov_dst_freg;              
reg              frt_inst1_fmov_dst_match_inst0;       
reg              frt_inst1_fmov_dst_mla_rdy;           
reg              frt_inst1_fmov_dst_rdy;               
reg              frt_inst1_fmov_dst_wb;                
reg     [5  :0]  frt_inst2_dst_freg;                   
reg              frt_inst2_dst_mla_rdy;                
reg              frt_inst2_dst_rdy;                    
reg              frt_inst2_dst_wb;                     
reg              frt_inst2_fmov_match_inst0;           
reg              frt_inst2_fmov_match_inst1;           
reg              frt_inst2_fmov_match_inst2;           
reg     [5  :0]  inst0_dstf_read_freg;                 
reg     [12 :0]  inst0_srcf0_read_data;                
reg     [12 :0]  inst0_srcf1_read_data;                
reg     [12 :0]  inst0_srcf2_read_data;                
reg     [12 :0]  inst1_dstf_read_data;                 
reg     [12 :0]  inst1_srcf0_read_data;                
reg     [12 :0]  inst1_srcf1_read_data;                
reg     [12 :0]  inst1_srcf2_read_data;                
reg     [5  :0]  inst2_dstf_read_freg;                 
reg     [12 :0]  inst2_srcf0_read_data;                
reg     [12 :0]  inst2_srcf1_read_data;                
reg     [12 :0]  inst2_srcf2_read_data;                
reg     [12 :0]  inst3_dstf_read_data;                 
reg     [12 :0]  inst3_srcf0_read_data;                
reg     [12 :0]  inst3_srcf1_read_data;                
reg     [12 :0]  inst3_srcf2_read_data;                
reg     [5  :0]  reg_0_create_freg;                    
reg     [5  :0]  reg_10_create_freg;                   
reg     [5  :0]  reg_11_create_freg;                   
reg     [5  :0]  reg_12_create_freg;                   
reg     [5  :0]  reg_13_create_freg;                   
reg     [5  :0]  reg_14_create_freg;                   
reg     [5  :0]  reg_15_create_freg;                   
reg     [5  :0]  reg_16_create_freg;                   
reg     [5  :0]  reg_17_create_freg;                   
reg     [5  :0]  reg_18_create_freg;                   
reg     [5  :0]  reg_19_create_freg;                   
reg     [5  :0]  reg_1_create_freg;                    
reg     [5  :0]  reg_20_create_freg;                   
reg     [5  :0]  reg_21_create_freg;                   
reg     [5  :0]  reg_22_create_freg;                   
reg     [5  :0]  reg_23_create_freg;                   
reg     [5  :0]  reg_24_create_freg;                   
reg     [5  :0]  reg_25_create_freg;                   
reg     [5  :0]  reg_26_create_freg;                   
reg     [5  :0]  reg_27_create_freg;                   
reg     [5  :0]  reg_28_create_freg;                   
reg     [5  :0]  reg_29_create_freg;                   
reg     [5  :0]  reg_2_create_freg;                    
reg     [5  :0]  reg_30_create_freg;                   
reg     [5  :0]  reg_31_create_freg;                   
reg     [5  :0]  reg_32_create_freg;                   
reg     [5  :0]  reg_3_create_freg;                    
reg     [5  :0]  reg_4_create_freg;                    
reg     [5  :0]  reg_5_create_freg;                    
reg     [5  :0]  reg_6_create_freg;                    
reg     [5  :0]  reg_7_create_freg;                    
reg     [5  :0]  reg_8_create_freg;                    
reg     [5  :0]  reg_9_create_freg;                    
reg     [4  :0]  reg_e_create_ereg;                    

// &Wires; @28
wire             cp0_idu_icg_en;                       
wire             cp0_yy_clk_en;                        
wire             cpurst_b;                             
wire             ctrl_ir_stall;                        
wire             ctrl_rt_inst0_vld;                    
wire             ctrl_rt_inst1_vld;                    
wire             ctrl_rt_inst2_vld;                    
wire             ctrl_rt_inst3_vld;                    
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dupx;   
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dupx;   
wire    [4  :0]  dp_frt_inst0_dst_ereg;                
wire    [5  :0]  dp_frt_inst0_dst_freg;                
wire             dp_frt_inst0_dste_vld;                
wire    [5  :0]  dp_frt_inst0_dstf_reg;                
wire    [4  :0]  dp_frt_inst0_dstf_reg_lsb;            
wire    [31 :0]  dp_frt_inst0_dstf_reg_lsb_expand;     
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
wire    [4  :0]  dp_frt_inst1_dstf_reg_lsb;            
wire    [31 :0]  dp_frt_inst1_dstf_reg_lsb_expand;     
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
wire    [4  :0]  dp_frt_inst2_dstf_reg_lsb;            
wire    [31 :0]  dp_frt_inst2_dstf_reg_lsb_expand;     
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
wire    [4  :0]  dp_frt_inst3_dstf_reg_lsb;            
wire    [31 :0]  dp_frt_inst3_dstf_reg_lsb_expand;     
wire             dp_frt_inst3_dstf_vld;                
wire             dp_frt_inst3_fmla;                    
wire    [5  :0]  dp_frt_inst3_srcf0_reg;               
wire             dp_frt_inst3_srcf0_vld;               
wire    [5  :0]  dp_frt_inst3_srcf1_reg;               
wire             dp_frt_inst3_srcf1_vld;               
wire    [5  :0]  dp_frt_inst3_srcf2_reg;               
wire             dp_frt_inst3_srcf2_vld;               
wire    [16 :0]  dp_rt_dep_info;                       
wire    [6  :0]  dp_xx_rf_pipe6_dst_vreg_dupx;         
wire    [6  :0]  dp_xx_rf_pipe7_dst_vreg_dupx;         
wire             e_clk;                                
wire             e_clk_en;                             
wire             e_write0_en;                          
wire             e_write1_en;                          
wire             e_write2_en;                          
wire             e_write3_en;                          
wire             forever_cpuclk;                       
wire             freg_entry_no_rdy;                    
wire             frt_clk_en;                           
wire    [4  :0]  frt_dp_inst0_rel_ereg;                
wire    [6  :0]  frt_dp_inst0_rel_freg;                
wire    [8  :0]  frt_dp_inst0_srcf0_data;              
wire    [8  :0]  frt_dp_inst0_srcf1_data;              
wire    [9  :0]  frt_dp_inst0_srcf2_data;              
wire    [4  :0]  frt_dp_inst1_rel_ereg;                
wire             frt_inst0_fmov_bypass_over_inst1;     
wire    [5  :0]  frt_inst0_fmov_dst_freg;              
wire             frt_inst0_fmov_dst_mla_rdy;           
wire             frt_inst0_fmov_dst_rdy;               
wire             frt_inst0_fmov_dst_wb;                
wire             frt_inst1_dste_match_inst0;           
wire             frt_inst1_dstf_match_inst0;           
wire             frt_inst1_srcf0_match_inst0;          
wire             frt_inst1_srcf1_match_inst0;          
wire             frt_inst1_srcf2_match_inst0;          
wire             frt_inst2_dste_match_inst0;           
wire             frt_inst2_dste_match_inst1;           
wire             frt_inst2_dstf_match_inst0;           
wire             frt_inst2_dstf_match_inst1;           
wire             frt_inst2_srcf0_match_inst0;          
wire             frt_inst2_srcf0_match_inst1;          
wire             frt_inst2_srcf1_match_inst0;          
wire             frt_inst2_srcf1_match_inst1;          
wire             frt_inst2_srcf2_match_inst0;          
wire             frt_inst2_srcf2_match_inst1;          
wire             frt_inst3_dste_match_inst0;           
wire             frt_inst3_dste_match_inst1;           
wire             frt_inst3_dste_match_inst2;           
wire             frt_inst3_dstf_match_inst0;           
wire             frt_inst3_dstf_match_inst1;           
wire             frt_inst3_dstf_match_inst2;           
wire             frt_inst3_srcf0_match_inst0;          
wire             frt_inst3_srcf0_match_inst1;          
wire             frt_inst3_srcf0_match_inst2;          
wire             frt_inst3_srcf1_match_inst0;          
wire             frt_inst3_srcf1_match_inst1;          
wire             frt_inst3_srcf1_match_inst2;          
wire             frt_inst3_srcf2_match_inst0;          
wire             frt_inst3_srcf2_match_inst1;          
wire             frt_inst3_srcf2_match_inst2;          
wire    [4  :0]  frt_recover_updt_ereg;                
wire    [191:0]  frt_recover_updt_freg;                
wire             frt_recover_updt_vld;                 
wire    [191:0]  frt_reset_updt_freg;                  
wire             frt_top_clk;                          
wire             gateclk_entry_vld;                    
wire             ifu_xx_sync_reset;                    
wire             inst0_gateclk_write_en;               
wire    [5  :0]  inst0_srcf0_read_freg;                
wire             inst0_srcf0_read_mla_rdy;             
wire             inst0_srcf0_read_rdy;                 
wire             inst0_srcf0_read_wb;                  
wire    [5  :0]  inst0_srcf1_read_freg;                
wire             inst0_srcf1_read_rdy;                 
wire             inst0_srcf1_read_wb;                  
wire    [5  :0]  inst0_srcf2_read_freg;                
wire             inst0_srcf2_read_mla_rdy;             
wire             inst0_srcf2_read_rdy;                 
wire             inst0_srcf2_read_wb;                  
wire             inst0_write_en;                       
wire    [5  :0]  inst1_dstf_read_freg;                 
wire             inst1_gateclk_write_en;               
wire    [5  :0]  inst1_srcf0_read_freg;                
wire             inst1_srcf0_read_mla_rdy;             
wire             inst1_srcf0_read_rdy;                 
wire             inst1_srcf0_read_wb;                  
wire    [5  :0]  inst1_srcf1_read_freg;                
wire             inst1_srcf1_read_rdy;                 
wire             inst1_srcf1_read_wb;                  
wire    [5  :0]  inst1_srcf2_read_freg;                
wire             inst1_srcf2_read_mla_rdy;             
wire             inst1_srcf2_read_rdy;                 
wire             inst1_srcf2_read_wb;                  
wire             inst1_write_en;                       
wire             inst2_gateclk_write_en;               
wire    [5  :0]  inst2_srcf0_read_freg;                
wire             inst2_srcf0_read_mla_rdy;             
wire             inst2_srcf0_read_rdy;                 
wire             inst2_srcf0_read_wb;                  
wire    [5  :0]  inst2_srcf1_read_freg;                
wire             inst2_srcf1_read_rdy;                 
wire             inst2_srcf1_read_wb;                  
wire    [5  :0]  inst2_srcf2_read_freg;                
wire             inst2_srcf2_read_mla_rdy;             
wire             inst2_srcf2_read_rdy;                 
wire             inst2_srcf2_read_wb;                  
wire             inst2_write_en;                       
wire    [5  :0]  inst3_dstf_read_freg;                 
wire             inst3_gateclk_write_en;               
wire    [5  :0]  inst3_srcf0_read_freg;                
wire             inst3_srcf0_read_rdy;                 
wire             inst3_srcf0_read_wb;                  
wire    [5  :0]  inst3_srcf1_read_freg;                
wire             inst3_srcf1_read_rdy;                 
wire             inst3_srcf1_read_wb;                  
wire    [5  :0]  inst3_srcf2_read_freg;                
wire             inst3_srcf2_read_mla_rdy;             
wire             inst3_srcf2_read_rdy;                 
wire             inst3_srcf2_read_wb;                  
wire             inst3_write_en;                       
wire             lsu_idu_ag_pipe3_vload_inst_vld;      
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;           
wire             lsu_idu_dc_pipe3_vload_fwd_inst_vld;  
wire             lsu_idu_dc_pipe3_vload_inst_vld_dupx; 
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;           
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;        
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dupx;    
wire             pad_yy_icg_scan_en;                   
wire             r_vld;                                
wire    [10 :0]  reg_0_create_data;                    
wire             reg_0_entry_vmla;                     
wire             reg_0_gateclk_idx_write_en;           
wire             reg_0_gateclk_write_en;               
wire             reg_0_rdy_clr;                        
wire    [12 :0]  reg_0_read_data;                      
wire             reg_0_write_en;                       
wire    [10 :0]  reg_10_create_data;                   
wire             reg_10_entry_vmla;                    
wire             reg_10_gateclk_idx_write_en;          
wire             reg_10_gateclk_write_en;              
wire             reg_10_rdy_clr;                       
wire    [12 :0]  reg_10_read_data;                     
wire             reg_10_write_en;                      
wire    [10 :0]  reg_11_create_data;                   
wire             reg_11_entry_vmla;                    
wire             reg_11_gateclk_idx_write_en;          
wire             reg_11_gateclk_write_en;              
wire             reg_11_rdy_clr;                       
wire    [12 :0]  reg_11_read_data;                     
wire             reg_11_write_en;                      
wire    [10 :0]  reg_12_create_data;                   
wire             reg_12_entry_vmla;                    
wire             reg_12_gateclk_idx_write_en;          
wire             reg_12_gateclk_write_en;              
wire             reg_12_rdy_clr;                       
wire    [12 :0]  reg_12_read_data;                     
wire             reg_12_write_en;                      
wire    [10 :0]  reg_13_create_data;                   
wire             reg_13_entry_vmla;                    
wire             reg_13_gateclk_idx_write_en;          
wire             reg_13_gateclk_write_en;              
wire             reg_13_rdy_clr;                       
wire    [12 :0]  reg_13_read_data;                     
wire             reg_13_write_en;                      
wire    [10 :0]  reg_14_create_data;                   
wire             reg_14_entry_vmla;                    
wire             reg_14_gateclk_idx_write_en;          
wire             reg_14_gateclk_write_en;              
wire             reg_14_rdy_clr;                       
wire    [12 :0]  reg_14_read_data;                     
wire             reg_14_write_en;                      
wire    [10 :0]  reg_15_create_data;                   
wire             reg_15_entry_vmla;                    
wire             reg_15_gateclk_idx_write_en;          
wire             reg_15_gateclk_write_en;              
wire             reg_15_rdy_clr;                       
wire    [12 :0]  reg_15_read_data;                     
wire             reg_15_write_en;                      
wire    [10 :0]  reg_16_create_data;                   
wire             reg_16_entry_vmla;                    
wire             reg_16_gateclk_idx_write_en;          
wire             reg_16_gateclk_write_en;              
wire             reg_16_rdy_clr;                       
wire    [12 :0]  reg_16_read_data;                     
wire             reg_16_write_en;                      
wire    [10 :0]  reg_17_create_data;                   
wire             reg_17_entry_vmla;                    
wire             reg_17_gateclk_idx_write_en;          
wire             reg_17_gateclk_write_en;              
wire             reg_17_rdy_clr;                       
wire    [12 :0]  reg_17_read_data;                     
wire             reg_17_write_en;                      
wire    [10 :0]  reg_18_create_data;                   
wire             reg_18_entry_vmla;                    
wire             reg_18_gateclk_idx_write_en;          
wire             reg_18_gateclk_write_en;              
wire             reg_18_rdy_clr;                       
wire    [12 :0]  reg_18_read_data;                     
wire             reg_18_write_en;                      
wire    [10 :0]  reg_19_create_data;                   
wire             reg_19_entry_vmla;                    
wire             reg_19_gateclk_idx_write_en;          
wire             reg_19_gateclk_write_en;              
wire             reg_19_rdy_clr;                       
wire    [12 :0]  reg_19_read_data;                     
wire             reg_19_write_en;                      
wire    [10 :0]  reg_1_create_data;                    
wire             reg_1_entry_vmla;                     
wire             reg_1_gateclk_idx_write_en;           
wire             reg_1_gateclk_write_en;               
wire             reg_1_rdy_clr;                        
wire    [12 :0]  reg_1_read_data;                      
wire             reg_1_write_en;                       
wire    [10 :0]  reg_20_create_data;                   
wire             reg_20_entry_vmla;                    
wire             reg_20_gateclk_idx_write_en;          
wire             reg_20_gateclk_write_en;              
wire             reg_20_rdy_clr;                       
wire    [12 :0]  reg_20_read_data;                     
wire             reg_20_write_en;                      
wire    [10 :0]  reg_21_create_data;                   
wire             reg_21_entry_vmla;                    
wire             reg_21_gateclk_idx_write_en;          
wire             reg_21_gateclk_write_en;              
wire             reg_21_rdy_clr;                       
wire    [12 :0]  reg_21_read_data;                     
wire             reg_21_write_en;                      
wire    [10 :0]  reg_22_create_data;                   
wire             reg_22_entry_vmla;                    
wire             reg_22_gateclk_idx_write_en;          
wire             reg_22_gateclk_write_en;              
wire             reg_22_rdy_clr;                       
wire    [12 :0]  reg_22_read_data;                     
wire             reg_22_write_en;                      
wire    [10 :0]  reg_23_create_data;                   
wire             reg_23_entry_vmla;                    
wire             reg_23_gateclk_idx_write_en;          
wire             reg_23_gateclk_write_en;              
wire             reg_23_rdy_clr;                       
wire    [12 :0]  reg_23_read_data;                     
wire             reg_23_write_en;                      
wire    [10 :0]  reg_24_create_data;                   
wire             reg_24_entry_vmla;                    
wire             reg_24_gateclk_idx_write_en;          
wire             reg_24_gateclk_write_en;              
wire             reg_24_rdy_clr;                       
wire    [12 :0]  reg_24_read_data;                     
wire             reg_24_write_en;                      
wire    [10 :0]  reg_25_create_data;                   
wire             reg_25_entry_vmla;                    
wire             reg_25_gateclk_idx_write_en;          
wire             reg_25_gateclk_write_en;              
wire             reg_25_rdy_clr;                       
wire    [12 :0]  reg_25_read_data;                     
wire             reg_25_write_en;                      
wire    [10 :0]  reg_26_create_data;                   
wire             reg_26_entry_vmla;                    
wire             reg_26_gateclk_idx_write_en;          
wire             reg_26_gateclk_write_en;              
wire             reg_26_rdy_clr;                       
wire    [12 :0]  reg_26_read_data;                     
wire             reg_26_write_en;                      
wire    [10 :0]  reg_27_create_data;                   
wire             reg_27_entry_vmla;                    
wire             reg_27_gateclk_idx_write_en;          
wire             reg_27_gateclk_write_en;              
wire             reg_27_rdy_clr;                       
wire    [12 :0]  reg_27_read_data;                     
wire             reg_27_write_en;                      
wire    [10 :0]  reg_28_create_data;                   
wire             reg_28_entry_vmla;                    
wire             reg_28_gateclk_idx_write_en;          
wire             reg_28_gateclk_write_en;              
wire             reg_28_rdy_clr;                       
wire    [12 :0]  reg_28_read_data;                     
wire             reg_28_write_en;                      
wire    [10 :0]  reg_29_create_data;                   
wire             reg_29_entry_vmla;                    
wire             reg_29_gateclk_idx_write_en;          
wire             reg_29_gateclk_write_en;              
wire             reg_29_rdy_clr;                       
wire    [12 :0]  reg_29_read_data;                     
wire             reg_29_write_en;                      
wire    [10 :0]  reg_2_create_data;                    
wire             reg_2_entry_vmla;                     
wire             reg_2_gateclk_idx_write_en;           
wire             reg_2_gateclk_write_en;               
wire             reg_2_rdy_clr;                        
wire    [12 :0]  reg_2_read_data;                      
wire             reg_2_write_en;                       
wire    [10 :0]  reg_30_create_data;                   
wire             reg_30_entry_vmla;                    
wire             reg_30_gateclk_idx_write_en;          
wire             reg_30_gateclk_write_en;              
wire             reg_30_rdy_clr;                       
wire    [12 :0]  reg_30_read_data;                     
wire             reg_30_write_en;                      
wire    [10 :0]  reg_31_create_data;                   
wire             reg_31_entry_vmla;                    
wire             reg_31_gateclk_idx_write_en;          
wire             reg_31_gateclk_write_en;              
wire             reg_31_rdy_clr;                       
wire    [12 :0]  reg_31_read_data;                     
wire             reg_31_write_en;                      
wire    [10 :0]  reg_32_create_data;                   
wire             reg_32_entry_vmla;                    
wire             reg_32_gateclk_idx_write_en;          
wire             reg_32_gateclk_write_en;              
wire             reg_32_rdy_clr;                       
wire    [12 :0]  reg_32_read_data;                     
wire             reg_32_write_en;                      
wire    [10 :0]  reg_3_create_data;                    
wire             reg_3_entry_vmla;                     
wire             reg_3_gateclk_idx_write_en;           
wire             reg_3_gateclk_write_en;               
wire             reg_3_rdy_clr;                        
wire    [12 :0]  reg_3_read_data;                      
wire             reg_3_write_en;                       
wire    [10 :0]  reg_4_create_data;                    
wire             reg_4_entry_vmla;                     
wire             reg_4_gateclk_idx_write_en;           
wire             reg_4_gateclk_write_en;               
wire             reg_4_rdy_clr;                        
wire    [12 :0]  reg_4_read_data;                      
wire             reg_4_write_en;                       
wire    [10 :0]  reg_5_create_data;                    
wire             reg_5_entry_vmla;                     
wire             reg_5_gateclk_idx_write_en;           
wire             reg_5_gateclk_write_en;               
wire             reg_5_rdy_clr;                        
wire    [12 :0]  reg_5_read_data;                      
wire             reg_5_write_en;                       
wire    [10 :0]  reg_6_create_data;                    
wire             reg_6_entry_vmla;                     
wire             reg_6_gateclk_idx_write_en;           
wire             reg_6_gateclk_write_en;               
wire             reg_6_rdy_clr;                        
wire    [12 :0]  reg_6_read_data;                      
wire             reg_6_write_en;                       
wire    [10 :0]  reg_7_create_data;                    
wire             reg_7_entry_vmla;                     
wire             reg_7_gateclk_idx_write_en;           
wire             reg_7_gateclk_write_en;               
wire             reg_7_rdy_clr;                        
wire    [12 :0]  reg_7_read_data;                      
wire             reg_7_write_en;                       
wire    [10 :0]  reg_8_create_data;                    
wire             reg_8_entry_vmla;                     
wire             reg_8_gateclk_idx_write_en;           
wire             reg_8_gateclk_write_en;               
wire             reg_8_rdy_clr;                        
wire    [12 :0]  reg_8_read_data;                      
wire             reg_8_write_en;                       
wire    [10 :0]  reg_9_create_data;                    
wire             reg_9_entry_vmla;                     
wire             reg_9_gateclk_idx_write_en;           
wire             reg_9_gateclk_write_en;               
wire             reg_9_rdy_clr;                        
wire    [12 :0]  reg_9_read_data;                      
wire             reg_9_write_en;                       
wire             reg_e_gateclk_write_en;               
wire    [4  :0]  reg_e_read_ereg;                      
wire             reg_e_write_en;                       
wire    [32 :0]  reg_gateclk_write0_en;                
wire    [32 :0]  reg_gateclk_write1_en;                
wire    [32 :0]  reg_gateclk_write2_en;                
wire    [32 :0]  reg_gateclk_write3_en;                
wire    [32 :0]  reg_gateclk_write_en;                 
wire    [32 :0]  reg_read_rdy_bypass;                  
wire    [32 :0]  reg_write0_en;                        
wire    [32 :0]  reg_write1_en;                        
wire    [32 :0]  reg_write2_en;                        
wire    [32 :0]  reg_write3_en;                        
wire    [32 :0]  reg_write_en;                         
wire             rtu_idu_flush_fe;                     
wire             rtu_idu_flush_is;                     
wire    [4  :0]  rtu_idu_rt_recover_ereg;              
wire    [191:0]  rtu_idu_rt_recover_freg;              
wire             rtu_yy_xx_flush;                      
wire             vfpu0_vreg_fwd_vld;                   
wire             vfpu1_vreg_fwd_vld;                   
wire             vfpu_idu_ex1_pipe6_data_vld_dupx;     
wire             vfpu_idu_ex1_pipe6_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex1_pipe6_vreg_dupx;         
wire             vfpu_idu_ex1_pipe7_data_vld_dupx;     
wire             vfpu_idu_ex1_pipe7_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex1_pipe7_vreg_dupx;         
wire             vfpu_idu_ex2_pipe6_data_vld_dupx;     
wire             vfpu_idu_ex2_pipe6_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex2_pipe6_vreg_dupx;         
wire             vfpu_idu_ex2_pipe7_data_vld_dupx;     
wire             vfpu_idu_ex2_pipe7_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex2_pipe7_vreg_dupx;         
wire             vfpu_idu_ex3_pipe6_data_vld_dupx;     
wire    [6  :0]  vfpu_idu_ex3_pipe6_vreg_dupx;         
wire             vfpu_idu_ex3_pipe7_data_vld_dupx;     
wire    [6  :0]  vfpu_idu_ex3_pipe7_vreg_dupx;         
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;      
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;      
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;  


//==========================================================
//                       Parameters
//==========================================================
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

// &Force("bus","dp_rt_dep_info",DEP_WIDTH-1,0); @56

//==========================================================
//                 Top Mudule Gated Cell
//==========================================================
assign frt_clk_en = rtu_idu_flush_fe
                    || rtu_idu_flush_is
                    || vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx
                    || vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx
                    || lsu_idu_wb_pipe3_wb_vreg_vld_dupx
                    || inst0_gateclk_write_en
                    || inst1_gateclk_write_en
                    || inst2_gateclk_write_en
                    || inst3_gateclk_write_en
                    || frt_recover_updt_vld
                    || freg_entry_no_rdy;
// &Instance("gated_clk_cell", "x_frt_gated_clk"); @72
gated_clk_cell  x_frt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (frt_top_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (frt_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @73
//          .external_en (1'b0), @74
//          .global_en   (cp0_yy_clk_en), @75
//          .module_en   (cp0_idu_icg_en), @76
//          .local_en    (frt_clk_en), @77
//          .clk_out     (frt_top_clk)); @78

//==========================================================
//                   Instance Entries
//==========================================================
//------------------------Registers-------------------------
// &ConnRule(s/^x_/reg_0_/); @84
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_0"); @85
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_0 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_0_create_data                    ),
  .x_entry_vmla                          (reg_0_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_0_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_0_gateclk_write_en               ),
  .x_rdy_clr                             (reg_0_rdy_clr                        ),
  .x_read_data                           (reg_0_read_data                      ),
  .x_write_en                            (reg_0_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @86
// &ConnRule(s/^x_/reg_1_/); @87
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_1"); @88
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_1 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_1_create_data                    ),
  .x_entry_vmla                          (reg_1_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_1_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_1_gateclk_write_en               ),
  .x_rdy_clr                             (reg_1_rdy_clr                        ),
  .x_read_data                           (reg_1_read_data                      ),
  .x_write_en                            (reg_1_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @89
// &ConnRule(s/^x_/reg_2_/); @90
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_2"); @91
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_2 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_2_create_data                    ),
  .x_entry_vmla                          (reg_2_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_2_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_2_gateclk_write_en               ),
  .x_rdy_clr                             (reg_2_rdy_clr                        ),
  .x_read_data                           (reg_2_read_data                      ),
  .x_write_en                            (reg_2_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @92
// &ConnRule(s/^x_/reg_3_/); @93
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_3"); @94
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_3 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_3_create_data                    ),
  .x_entry_vmla                          (reg_3_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_3_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_3_gateclk_write_en               ),
  .x_rdy_clr                             (reg_3_rdy_clr                        ),
  .x_read_data                           (reg_3_read_data                      ),
  .x_write_en                            (reg_3_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @95
// &ConnRule(s/^x_/reg_4_/); @96
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_4"); @97
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_4 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_4_create_data                    ),
  .x_entry_vmla                          (reg_4_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_4_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_4_gateclk_write_en               ),
  .x_rdy_clr                             (reg_4_rdy_clr                        ),
  .x_read_data                           (reg_4_read_data                      ),
  .x_write_en                            (reg_4_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @98
// &ConnRule(s/^x_/reg_5_/); @99
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_5"); @100
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_5 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_5_create_data                    ),
  .x_entry_vmla                          (reg_5_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_5_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_5_gateclk_write_en               ),
  .x_rdy_clr                             (reg_5_rdy_clr                        ),
  .x_read_data                           (reg_5_read_data                      ),
  .x_write_en                            (reg_5_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @101
// &ConnRule(s/^x_/reg_6_/); @102
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_6"); @103
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_6 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_6_create_data                    ),
  .x_entry_vmla                          (reg_6_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_6_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_6_gateclk_write_en               ),
  .x_rdy_clr                             (reg_6_rdy_clr                        ),
  .x_read_data                           (reg_6_read_data                      ),
  .x_write_en                            (reg_6_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @104
// &ConnRule(s/^x_/reg_7_/); @105
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_7"); @106
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_7 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_7_create_data                    ),
  .x_entry_vmla                          (reg_7_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_7_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_7_gateclk_write_en               ),
  .x_rdy_clr                             (reg_7_rdy_clr                        ),
  .x_read_data                           (reg_7_read_data                      ),
  .x_write_en                            (reg_7_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @107
// &ConnRule(s/^x_/reg_8_/); @108
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_8"); @109
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_8 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_8_create_data                    ),
  .x_entry_vmla                          (reg_8_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_8_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_8_gateclk_write_en               ),
  .x_rdy_clr                             (reg_8_rdy_clr                        ),
  .x_read_data                           (reg_8_read_data                      ),
  .x_write_en                            (reg_8_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @110
// &ConnRule(s/^x_/reg_9_/); @111
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_9"); @112
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_9 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_9_create_data                    ),
  .x_entry_vmla                          (reg_9_entry_vmla                     ),
  .x_gateclk_idx_write_en                (reg_9_gateclk_idx_write_en           ),
  .x_gateclk_write_en                    (reg_9_gateclk_write_en               ),
  .x_rdy_clr                             (reg_9_rdy_clr                        ),
  .x_read_data                           (reg_9_read_data                      ),
  .x_write_en                            (reg_9_write_en                       )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @113
// &ConnRule(s/^x_/reg_10_/); @114
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_10"); @115
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_10 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_10_create_data                   ),
  .x_entry_vmla                          (reg_10_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_10_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_10_gateclk_write_en              ),
  .x_rdy_clr                             (reg_10_rdy_clr                       ),
  .x_read_data                           (reg_10_read_data                     ),
  .x_write_en                            (reg_10_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @116
// &ConnRule(s/^x_/reg_11_/); @117
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_11"); @118
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_11 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_11_create_data                   ),
  .x_entry_vmla                          (reg_11_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_11_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_11_gateclk_write_en              ),
  .x_rdy_clr                             (reg_11_rdy_clr                       ),
  .x_read_data                           (reg_11_read_data                     ),
  .x_write_en                            (reg_11_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @119
// &ConnRule(s/^x_/reg_12_/); @120
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_12"); @121
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_12 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_12_create_data                   ),
  .x_entry_vmla                          (reg_12_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_12_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_12_gateclk_write_en              ),
  .x_rdy_clr                             (reg_12_rdy_clr                       ),
  .x_read_data                           (reg_12_read_data                     ),
  .x_write_en                            (reg_12_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @122
// &ConnRule(s/^x_/reg_13_/); @123
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_13"); @124
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_13 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_13_create_data                   ),
  .x_entry_vmla                          (reg_13_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_13_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_13_gateclk_write_en              ),
  .x_rdy_clr                             (reg_13_rdy_clr                       ),
  .x_read_data                           (reg_13_read_data                     ),
  .x_write_en                            (reg_13_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @125
// &ConnRule(s/^x_/reg_14_/); @126
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_14"); @127
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_14 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_14_create_data                   ),
  .x_entry_vmla                          (reg_14_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_14_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_14_gateclk_write_en              ),
  .x_rdy_clr                             (reg_14_rdy_clr                       ),
  .x_read_data                           (reg_14_read_data                     ),
  .x_write_en                            (reg_14_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @128
// &ConnRule(s/^x_/reg_15_/); @129
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_15"); @130
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_15 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_15_create_data                   ),
  .x_entry_vmla                          (reg_15_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_15_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_15_gateclk_write_en              ),
  .x_rdy_clr                             (reg_15_rdy_clr                       ),
  .x_read_data                           (reg_15_read_data                     ),
  .x_write_en                            (reg_15_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @131
// &ConnRule(s/^x_/reg_16_/); @132
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_16"); @133
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_16 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_16_create_data                   ),
  .x_entry_vmla                          (reg_16_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_16_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_16_gateclk_write_en              ),
  .x_rdy_clr                             (reg_16_rdy_clr                       ),
  .x_read_data                           (reg_16_read_data                     ),
  .x_write_en                            (reg_16_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @134
// &ConnRule(s/^x_/reg_17_/); @135
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_17"); @136
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_17 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_17_create_data                   ),
  .x_entry_vmla                          (reg_17_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_17_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_17_gateclk_write_en              ),
  .x_rdy_clr                             (reg_17_rdy_clr                       ),
  .x_read_data                           (reg_17_read_data                     ),
  .x_write_en                            (reg_17_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @137
// &ConnRule(s/^x_/reg_18_/); @138
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_18"); @139
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_18 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_18_create_data                   ),
  .x_entry_vmla                          (reg_18_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_18_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_18_gateclk_write_en              ),
  .x_rdy_clr                             (reg_18_rdy_clr                       ),
  .x_read_data                           (reg_18_read_data                     ),
  .x_write_en                            (reg_18_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @140
// &ConnRule(s/^x_/reg_19_/); @141
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_19"); @142
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_19 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_19_create_data                   ),
  .x_entry_vmla                          (reg_19_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_19_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_19_gateclk_write_en              ),
  .x_rdy_clr                             (reg_19_rdy_clr                       ),
  .x_read_data                           (reg_19_read_data                     ),
  .x_write_en                            (reg_19_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @143
// &ConnRule(s/^x_/reg_20_/); @144
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_20"); @145
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_20 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_20_create_data                   ),
  .x_entry_vmla                          (reg_20_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_20_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_20_gateclk_write_en              ),
  .x_rdy_clr                             (reg_20_rdy_clr                       ),
  .x_read_data                           (reg_20_read_data                     ),
  .x_write_en                            (reg_20_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @146
// &ConnRule(s/^x_/reg_21_/); @147
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_21"); @148
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_21 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_21_create_data                   ),
  .x_entry_vmla                          (reg_21_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_21_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_21_gateclk_write_en              ),
  .x_rdy_clr                             (reg_21_rdy_clr                       ),
  .x_read_data                           (reg_21_read_data                     ),
  .x_write_en                            (reg_21_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @149
// &ConnRule(s/^x_/reg_22_/); @150
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_22"); @151
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_22 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_22_create_data                   ),
  .x_entry_vmla                          (reg_22_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_22_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_22_gateclk_write_en              ),
  .x_rdy_clr                             (reg_22_rdy_clr                       ),
  .x_read_data                           (reg_22_read_data                     ),
  .x_write_en                            (reg_22_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @152
// &ConnRule(s/^x_/reg_23_/); @153
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_23"); @154
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_23 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_23_create_data                   ),
  .x_entry_vmla                          (reg_23_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_23_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_23_gateclk_write_en              ),
  .x_rdy_clr                             (reg_23_rdy_clr                       ),
  .x_read_data                           (reg_23_read_data                     ),
  .x_write_en                            (reg_23_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @155
// &ConnRule(s/^x_/reg_24_/); @156
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_24"); @157
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_24 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_24_create_data                   ),
  .x_entry_vmla                          (reg_24_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_24_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_24_gateclk_write_en              ),
  .x_rdy_clr                             (reg_24_rdy_clr                       ),
  .x_read_data                           (reg_24_read_data                     ),
  .x_write_en                            (reg_24_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @158
// &ConnRule(s/^x_/reg_25_/); @159
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_25"); @160
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_25 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_25_create_data                   ),
  .x_entry_vmla                          (reg_25_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_25_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_25_gateclk_write_en              ),
  .x_rdy_clr                             (reg_25_rdy_clr                       ),
  .x_read_data                           (reg_25_read_data                     ),
  .x_write_en                            (reg_25_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @161
// &ConnRule(s/^x_/reg_26_/); @162
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_26"); @163
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_26 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_26_create_data                   ),
  .x_entry_vmla                          (reg_26_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_26_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_26_gateclk_write_en              ),
  .x_rdy_clr                             (reg_26_rdy_clr                       ),
  .x_read_data                           (reg_26_read_data                     ),
  .x_write_en                            (reg_26_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @164
// &ConnRule(s/^x_/reg_27_/); @165
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_27"); @166
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_27 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_27_create_data                   ),
  .x_entry_vmla                          (reg_27_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_27_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_27_gateclk_write_en              ),
  .x_rdy_clr                             (reg_27_rdy_clr                       ),
  .x_read_data                           (reg_27_read_data                     ),
  .x_write_en                            (reg_27_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @167
// &ConnRule(s/^x_/reg_28_/); @168
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_28"); @169
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_28 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_28_create_data                   ),
  .x_entry_vmla                          (reg_28_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_28_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_28_gateclk_write_en              ),
  .x_rdy_clr                             (reg_28_rdy_clr                       ),
  .x_read_data                           (reg_28_read_data                     ),
  .x_write_en                            (reg_28_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @170
// &ConnRule(s/^x_/reg_29_/); @171
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_29"); @172
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_29 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_29_create_data                   ),
  .x_entry_vmla                          (reg_29_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_29_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_29_gateclk_write_en              ),
  .x_rdy_clr                             (reg_29_rdy_clr                       ),
  .x_read_data                           (reg_29_read_data                     ),
  .x_write_en                            (reg_29_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @173
// &ConnRule(s/^x_/reg_30_/); @174
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_30"); @175
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_30 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_30_create_data                   ),
  .x_entry_vmla                          (reg_30_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_30_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_30_gateclk_write_en              ),
  .x_rdy_clr                             (reg_30_rdy_clr                       ),
  .x_read_data                           (reg_30_read_data                     ),
  .x_write_en                            (reg_30_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @176
// &ConnRule(s/^x_/reg_31_/); @177
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_31"); @178
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_31 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_31_create_data                   ),
  .x_entry_vmla                          (reg_31_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_31_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_31_gateclk_write_en              ),
  .x_rdy_clr                             (reg_31_rdy_clr                       ),
  .x_read_data                           (reg_31_read_data                     ),
  .x_write_en                            (reg_31_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @179
// &ConnRule(s/^x_/reg_32_/); @180
// &Instance("ct_idu_dep_vreg_srcv2_entry","x_ct_idu_ir_frt_entry_freg_32"); @181
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_ir_frt_entry_freg_32 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (frt_top_clk                          ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (vfpu0_vreg_fwd_vld                   ),
  .vfpu1_vreg_fwd_vld                    (vfpu1_vreg_fwd_vld                   ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (reg_32_create_data                   ),
  .x_entry_vmla                          (reg_32_entry_vmla                    ),
  .x_gateclk_idx_write_en                (reg_32_gateclk_idx_write_en          ),
  .x_gateclk_write_en                    (reg_32_gateclk_write_en              ),
  .x_rdy_clr                             (reg_32_rdy_clr                       ),
  .x_read_data                           (reg_32_read_data                     ),
  .x_write_en                            (reg_32_write_en                      )
);

// &Connect(.forever_cpuclk(frt_top_clk)); @182

assign reg_0_rdy_clr  = 1'b0;
assign reg_1_rdy_clr  = 1'b0;
assign reg_2_rdy_clr  = 1'b0;
assign reg_3_rdy_clr  = 1'b0;
assign reg_4_rdy_clr  = 1'b0;
assign reg_5_rdy_clr  = 1'b0;
assign reg_6_rdy_clr  = 1'b0;
assign reg_7_rdy_clr  = 1'b0;
assign reg_8_rdy_clr  = 1'b0;
assign reg_9_rdy_clr  = 1'b0;
assign reg_10_rdy_clr = 1'b0;
assign reg_11_rdy_clr = 1'b0;
assign reg_12_rdy_clr = 1'b0;
assign reg_13_rdy_clr = 1'b0;
assign reg_14_rdy_clr = 1'b0;
assign reg_15_rdy_clr = 1'b0;
assign reg_16_rdy_clr = 1'b0;
assign reg_17_rdy_clr = 1'b0;
assign reg_18_rdy_clr = 1'b0;
assign reg_19_rdy_clr = 1'b0;
assign reg_20_rdy_clr = 1'b0;
assign reg_21_rdy_clr = 1'b0;
assign reg_22_rdy_clr = 1'b0;
assign reg_23_rdy_clr = 1'b0;
assign reg_24_rdy_clr = 1'b0;
assign reg_25_rdy_clr = 1'b0;
assign reg_26_rdy_clr = 1'b0;
assign reg_27_rdy_clr = 1'b0;
assign reg_28_rdy_clr = 1'b0;
assign reg_29_rdy_clr = 1'b0;
assign reg_30_rdy_clr = 1'b0;
assign reg_31_rdy_clr = 1'b0;
assign reg_32_rdy_clr = 1'b0;

assign reg_0_entry_vmla  = 1'b1;
assign reg_1_entry_vmla  = 1'b1;
assign reg_2_entry_vmla  = 1'b1;
assign reg_3_entry_vmla  = 1'b1;
assign reg_4_entry_vmla  = 1'b1;
assign reg_5_entry_vmla  = 1'b1;
assign reg_6_entry_vmla  = 1'b1;
assign reg_7_entry_vmla  = 1'b1;
assign reg_8_entry_vmla  = 1'b1;
assign reg_9_entry_vmla  = 1'b1;
assign reg_10_entry_vmla = 1'b1;
assign reg_11_entry_vmla = 1'b1;
assign reg_12_entry_vmla = 1'b1;
assign reg_13_entry_vmla = 1'b1;
assign reg_14_entry_vmla = 1'b1;
assign reg_15_entry_vmla = 1'b1;
assign reg_16_entry_vmla = 1'b1;
assign reg_17_entry_vmla = 1'b1;
assign reg_18_entry_vmla = 1'b1;
assign reg_19_entry_vmla = 1'b1;
assign reg_20_entry_vmla = 1'b1;
assign reg_21_entry_vmla = 1'b1;
assign reg_22_entry_vmla = 1'b1;
assign reg_23_entry_vmla = 1'b1;
assign reg_24_entry_vmla = 1'b1;
assign reg_25_entry_vmla = 1'b1;
assign reg_26_entry_vmla = 1'b1;
assign reg_27_entry_vmla = 1'b1;
assign reg_28_entry_vmla = 1'b1;
assign reg_29_entry_vmla = 1'b1;
assign reg_30_entry_vmla = 1'b1;
assign reg_31_entry_vmla = 1'b1;
assign reg_32_entry_vmla = 1'b1;

//--------------------bypass ready signal-------------------
//ir insts do not need issue bypass singal, only is insts need
//set bypass ready to 0 for timing
assign vfpu0_vreg_fwd_vld = 1'b0;
assign vfpu1_vreg_fwd_vld = 1'b0;
assign lsu_idu_dc_pipe3_vload_fwd_inst_vld = 1'b0;

//------------------------Source E--------------------------
//no dependency for ereg, only record ereg for dest release
assign e_clk_en = reg_e_gateclk_write_en;
// &Instance("gated_clk_cell", "x_e_gated_clk"); @262
gated_clk_cell  x_e_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (e_clk             ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (e_clk_en          ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @263
//          .external_en (1'b0), @264
//          .global_en   (cp0_yy_clk_en), @265
//          .module_en   (cp0_idu_icg_en), @266
//          .local_en    (e_clk_en), @267
//          .clk_out     (e_clk)); @268
always @(posedge e_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ereg[4:0] <= 5'b0;
  else if(reg_e_write_en)
    ereg[4:0] <= reg_e_create_ereg[4:0];
  else
    ereg[4:0] <= ereg[4:0];
end
assign reg_e_read_ereg[4:0] = ereg[4:0];

//==========================================================
//                 For Top Gated Cell
//==========================================================
assign reg_read_rdy_bypass[0]  = reg_0_read_data[11];
assign reg_read_rdy_bypass[1]  = reg_1_read_data[11];
assign reg_read_rdy_bypass[2]  = reg_2_read_data[11];
assign reg_read_rdy_bypass[3]  = reg_3_read_data[11];
assign reg_read_rdy_bypass[4]  = reg_4_read_data[11];
assign reg_read_rdy_bypass[5]  = reg_5_read_data[11];
assign reg_read_rdy_bypass[6]  = reg_6_read_data[11];
assign reg_read_rdy_bypass[7]  = reg_7_read_data[11];
assign reg_read_rdy_bypass[8]  = reg_8_read_data[11];
assign reg_read_rdy_bypass[9]  = reg_9_read_data[11];
assign reg_read_rdy_bypass[10] = reg_10_read_data[11];
assign reg_read_rdy_bypass[11] = reg_11_read_data[11];
assign reg_read_rdy_bypass[12] = reg_12_read_data[11];
assign reg_read_rdy_bypass[13] = reg_13_read_data[11];
assign reg_read_rdy_bypass[14] = reg_14_read_data[11];
assign reg_read_rdy_bypass[15] = reg_15_read_data[11];
assign reg_read_rdy_bypass[16] = reg_16_read_data[11];
assign reg_read_rdy_bypass[17] = reg_17_read_data[11];
assign reg_read_rdy_bypass[18] = reg_18_read_data[11];
assign reg_read_rdy_bypass[19] = reg_19_read_data[11];
assign reg_read_rdy_bypass[20] = reg_20_read_data[11];
assign reg_read_rdy_bypass[21] = reg_21_read_data[11];
assign reg_read_rdy_bypass[22] = reg_22_read_data[11];
assign reg_read_rdy_bypass[23] = reg_23_read_data[11];
assign reg_read_rdy_bypass[24] = reg_24_read_data[11];
assign reg_read_rdy_bypass[25] = reg_25_read_data[11];
assign reg_read_rdy_bypass[26] = reg_26_read_data[11];
assign reg_read_rdy_bypass[27] = reg_27_read_data[11];
assign reg_read_rdy_bypass[28] = reg_28_read_data[11];
assign reg_read_rdy_bypass[29] = reg_29_read_data[11];
assign reg_read_rdy_bypass[30] = reg_30_read_data[11];
assign reg_read_rdy_bypass[31] = reg_31_read_data[11];
assign reg_read_rdy_bypass[32] = reg_32_read_data[11];

assign freg_entry_no_rdy       = !(&reg_read_rdy_bypass[32:0]);

//==========================================================
//                      Write Port      
//==========================================================
//--------------------ir inst write enable------------------
assign dp_frt_inst0_dstf_reg_lsb[4:0] = dp_frt_inst0_dstf_reg[4:0];
assign dp_frt_inst1_dstf_reg_lsb[4:0] = dp_frt_inst1_dstf_reg[4:0];
assign dp_frt_inst2_dstf_reg_lsb[4:0] = dp_frt_inst2_dstf_reg[4:0];
assign dp_frt_inst3_dstf_reg_lsb[4:0] = dp_frt_inst3_dstf_reg[4:0];

// &ConnRule(s/^x_num/dp_frt_inst0_dstf_reg_lsb/); @328
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dp_frt_inst0_dstf_reg_lsb"); @329
ct_rtu_expand_32  x_ct_rtu_expand_32_dp_frt_inst0_dstf_reg_lsb (
  .x_num                            (dp_frt_inst0_dstf_reg_lsb       ),
  .x_num_expand                     (dp_frt_inst0_dstf_reg_lsb_expand)
);

// &ConnRule(s/^x_num/dp_frt_inst1_dstf_reg_lsb/); @330
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dp_frt_inst1_dstf_reg_lsb"); @331
ct_rtu_expand_32  x_ct_rtu_expand_32_dp_frt_inst1_dstf_reg_lsb (
  .x_num                            (dp_frt_inst1_dstf_reg_lsb       ),
  .x_num_expand                     (dp_frt_inst1_dstf_reg_lsb_expand)
);

// &ConnRule(s/^x_num/dp_frt_inst2_dstf_reg_lsb/); @332
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dp_frt_inst2_dstf_reg_lsb"); @333
ct_rtu_expand_32  x_ct_rtu_expand_32_dp_frt_inst2_dstf_reg_lsb (
  .x_num                            (dp_frt_inst2_dstf_reg_lsb       ),
  .x_num_expand                     (dp_frt_inst2_dstf_reg_lsb_expand)
);

// &ConnRule(s/^x_num/dp_frt_inst3_dstf_reg_lsb/); @334
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dp_frt_inst3_dstf_reg_lsb"); @335
ct_rtu_expand_32  x_ct_rtu_expand_32_dp_frt_inst3_dstf_reg_lsb (
  .x_num                            (dp_frt_inst3_dstf_reg_lsb       ),
  .x_num_expand                     (dp_frt_inst3_dstf_reg_lsb_expand)
);


//if no write back, write port 0 not enable
assign inst0_write_en              = ctrl_rt_inst0_vld
                                     && !ctrl_ir_stall
                                     && !frt_recover_updt_vld
                                     &&  dp_frt_inst0_dstf_vld;
assign reg_write0_en[31:0]         = dp_frt_inst0_dstf_reg_lsb_expand[31:0]
                                     & {32{inst0_write_en && !dp_frt_inst0_dstf_reg[5]}};
assign reg_write0_en[32]           = dp_frt_inst0_dstf_reg_lsb_expand[0]
                                     && inst0_write_en && dp_frt_inst0_dstf_reg[5];
//gateclk write en ignore stall signal
assign inst0_gateclk_write_en      = ctrl_rt_inst0_vld
                                     && !frt_recover_updt_vld
                                     &&  dp_frt_inst0_dstf_vld;
assign reg_gateclk_write0_en[31:0] = dp_frt_inst0_dstf_reg_lsb_expand[31:0] 
                                     & {32{inst0_gateclk_write_en && !dp_frt_inst0_dstf_reg[5]}};
assign reg_gateclk_write0_en[32]   = dp_frt_inst0_dstf_reg_lsb_expand[0] 
                                     && inst0_gateclk_write_en && dp_frt_inst0_dstf_reg[5];
//f write enable
assign e_write0_en                 = ctrl_rt_inst0_vld
                                     && !frt_recover_updt_vld
                                     && !ctrl_ir_stall
                                     && dp_frt_inst0_dste_vld;

//if no write back, write port 1 not enable
assign inst1_write_en              = ctrl_rt_inst1_vld
                                     && !ctrl_ir_stall
                                     && !frt_recover_updt_vld
                                     &&  dp_frt_inst1_dstf_vld;
assign reg_write1_en[31:0]         = dp_frt_inst1_dstf_reg_lsb_expand[31:0]
                                     & {32{inst1_write_en && !dp_frt_inst1_dstf_reg[5]}};
assign reg_write1_en[32]           = dp_frt_inst1_dstf_reg_lsb_expand[0]
                                     && inst1_write_en && dp_frt_inst1_dstf_reg[5];
//gateclk write en ignore stall signal
assign inst1_gateclk_write_en      = ctrl_rt_inst1_vld
                                     && !frt_recover_updt_vld
                                     &&  dp_frt_inst1_dstf_vld;
assign reg_gateclk_write1_en[31:0] = dp_frt_inst1_dstf_reg_lsb_expand[31:0] 
                                     & {32{inst1_gateclk_write_en && !dp_frt_inst1_dstf_reg[5]}};
assign reg_gateclk_write1_en[32]   = dp_frt_inst1_dstf_reg_lsb_expand[0] 
                                     && inst1_gateclk_write_en && dp_frt_inst1_dstf_reg[5];
//f write enable
assign e_write1_en                 = ctrl_rt_inst1_vld
                                     && !frt_recover_updt_vld
                                     && !ctrl_ir_stall
                                     && dp_frt_inst1_dste_vld;

//if no write back, write port 2 not enable
assign inst2_write_en              = ctrl_rt_inst2_vld
                                     && !ctrl_ir_stall
                                     && !frt_recover_updt_vld
                                     &&  dp_frt_inst2_dstf_vld;
assign reg_write2_en[31:0]         = dp_frt_inst2_dstf_reg_lsb_expand[31:0]
                                     & {32{inst2_write_en && !dp_frt_inst2_dstf_reg[5]}};
assign reg_write2_en[32]           = dp_frt_inst2_dstf_reg_lsb_expand[0]
                                     && inst2_write_en && dp_frt_inst2_dstf_reg[5];
//gateclk write en ignore stall signal
assign inst2_gateclk_write_en      = ctrl_rt_inst2_vld
                                     && !frt_recover_updt_vld
                                     &&  dp_frt_inst2_dstf_vld;
assign reg_gateclk_write2_en[31:0] = dp_frt_inst2_dstf_reg_lsb_expand[31:0] 
                                     & {32{inst2_gateclk_write_en && !dp_frt_inst2_dstf_reg[5]}};
assign reg_gateclk_write2_en[32]   = dp_frt_inst2_dstf_reg_lsb_expand[0] 
                                     && inst2_gateclk_write_en && dp_frt_inst2_dstf_reg[5];
//f write enable
assign e_write2_en                 = ctrl_rt_inst2_vld
                                     && !frt_recover_updt_vld
                                     && !ctrl_ir_stall
                                     && dp_frt_inst2_dste_vld;

//if no write back, write port 3 not enable
assign inst3_write_en              = ctrl_rt_inst3_vld
                                     && !ctrl_ir_stall
                                     && !frt_recover_updt_vld
                                     &&  dp_frt_inst3_dstf_vld;
assign reg_write3_en[31:0]         = dp_frt_inst3_dstf_reg_lsb_expand[31:0]
                                     & {32{inst3_write_en && !dp_frt_inst3_dstf_reg[5]}};
assign reg_write3_en[32]           = dp_frt_inst3_dstf_reg_lsb_expand[0]
                                     && inst3_write_en && dp_frt_inst3_dstf_reg[5];
//gateclk write en ignore stall signal
assign inst3_gateclk_write_en      = ctrl_rt_inst3_vld
                                     && !frt_recover_updt_vld
                                     &&  dp_frt_inst3_dstf_vld;
assign reg_gateclk_write3_en[31:0] = dp_frt_inst3_dstf_reg_lsb_expand[31:0] 
                                     & {32{inst3_gateclk_write_en && !dp_frt_inst3_dstf_reg[5]}};
assign reg_gateclk_write3_en[32]   = dp_frt_inst3_dstf_reg_lsb_expand[0] 
                                     && inst3_gateclk_write_en && dp_frt_inst3_dstf_reg[5];
//f write enable
assign e_write3_en                 = ctrl_rt_inst3_vld
                                     && !frt_recover_updt_vld
                                     && !ctrl_ir_stall
                                     && dp_frt_inst3_dste_vld;

//-------------flush and reset write enable-----------------
//reset: build initial mappings (fr0~fr31 <-> f0~f31)
//flush: recover mappings from rtu pst
assign frt_reset_updt_freg[191:0] = 
         {6'd31, 6'd30, 6'd29, 6'd28, 6'd27, 6'd26, 6'd25, 6'd24,
          6'd23, 6'd22, 6'd21, 6'd20, 6'd19, 6'd18, 6'd17, 6'd16,
          6'd15, 6'd14, 6'd13, 6'd12, 6'd11, 6'd10, 6'd9,  6'd8,
          6'd7,  6'd6,  6'd5,  6'd4,  6'd3,  6'd2,  6'd1,  6'd0};
assign frt_recover_updt_vld         = ifu_xx_sync_reset
                                      || rtu_yy_xx_flush;
assign frt_recover_updt_freg[191:0] = (ifu_xx_sync_reset)
                                     ? frt_reset_updt_freg[191:0]
                                     : rtu_idu_rt_recover_freg[191:0];
assign frt_recover_updt_ereg[4:0]   = (ifu_xx_sync_reset) 
                                     ? 5'd0 : rtu_idu_rt_recover_ereg[4:0]; 

//-----------------------Write value------------------------
//generate write enable signal
assign reg_write_en[32:0] = {33{frt_recover_updt_vld}}
                            | reg_write0_en[32:0]
                            | reg_write1_en[32:0]
                            | reg_write2_en[32:0]
                            | reg_write3_en[32:0];

assign reg_0_write_en  = reg_write_en[0];
assign reg_1_write_en  = reg_write_en[1];
assign reg_2_write_en  = reg_write_en[2];
assign reg_3_write_en  = reg_write_en[3];
assign reg_4_write_en  = reg_write_en[4];
assign reg_5_write_en  = reg_write_en[5];
assign reg_6_write_en  = reg_write_en[6];
assign reg_7_write_en  = reg_write_en[7];
assign reg_8_write_en  = reg_write_en[8];
assign reg_9_write_en  = reg_write_en[9];
assign reg_10_write_en = reg_write_en[10];
assign reg_11_write_en = reg_write_en[11];
assign reg_12_write_en = reg_write_en[12];
assign reg_13_write_en = reg_write_en[13];
assign reg_14_write_en = reg_write_en[14];
assign reg_15_write_en = reg_write_en[15];
assign reg_16_write_en = reg_write_en[16];
assign reg_17_write_en = reg_write_en[17];
assign reg_18_write_en = reg_write_en[18];
assign reg_19_write_en = reg_write_en[19];
assign reg_20_write_en = reg_write_en[20];
assign reg_21_write_en = reg_write_en[21];
assign reg_22_write_en = reg_write_en[22];
assign reg_23_write_en = reg_write_en[23];
assign reg_24_write_en = reg_write_en[24];
assign reg_25_write_en = reg_write_en[25];
assign reg_26_write_en = reg_write_en[26];
assign reg_27_write_en = reg_write_en[27];
assign reg_28_write_en = reg_write_en[28];
assign reg_29_write_en = reg_write_en[29];
assign reg_30_write_en = reg_write_en[30];
assign reg_31_write_en = reg_write_en[31];
assign reg_32_write_en = reg_write_en[32];
assign reg_e_write_en  = frt_recover_updt_vld
                         || e_write0_en || e_write1_en
                         || e_write2_en || e_write3_en;

assign gateclk_entry_vld = 1'b1;
//the gate cell enable write signal use gate clock instruction valid
//instead of dstf_vld for timing optimization
assign reg_gateclk_write_en[32:0] = {33{frt_recover_updt_vld}}
                                    | reg_gateclk_write0_en[32:0]
                                    | reg_gateclk_write1_en[32:0]
                                    | reg_gateclk_write2_en[32:0]
                                    | reg_gateclk_write3_en[32:0];

assign reg_0_gateclk_write_en  = reg_gateclk_write_en[0];
assign reg_1_gateclk_write_en  = reg_gateclk_write_en[1];
assign reg_2_gateclk_write_en  = reg_gateclk_write_en[2];
assign reg_3_gateclk_write_en  = reg_gateclk_write_en[3];
assign reg_4_gateclk_write_en  = reg_gateclk_write_en[4];
assign reg_5_gateclk_write_en  = reg_gateclk_write_en[5];
assign reg_6_gateclk_write_en  = reg_gateclk_write_en[6];
assign reg_7_gateclk_write_en  = reg_gateclk_write_en[7];
assign reg_8_gateclk_write_en  = reg_gateclk_write_en[8];
assign reg_9_gateclk_write_en  = reg_gateclk_write_en[9];
assign reg_10_gateclk_write_en = reg_gateclk_write_en[10];
assign reg_11_gateclk_write_en = reg_gateclk_write_en[11];
assign reg_12_gateclk_write_en = reg_gateclk_write_en[12];
assign reg_13_gateclk_write_en = reg_gateclk_write_en[13];
assign reg_14_gateclk_write_en = reg_gateclk_write_en[14];
assign reg_15_gateclk_write_en = reg_gateclk_write_en[15];
assign reg_16_gateclk_write_en = reg_gateclk_write_en[16];
assign reg_17_gateclk_write_en = reg_gateclk_write_en[17];
assign reg_18_gateclk_write_en = reg_gateclk_write_en[18];
assign reg_19_gateclk_write_en = reg_gateclk_write_en[19];
assign reg_20_gateclk_write_en = reg_gateclk_write_en[20];
assign reg_21_gateclk_write_en = reg_gateclk_write_en[21];
assign reg_22_gateclk_write_en = reg_gateclk_write_en[22];
assign reg_23_gateclk_write_en = reg_gateclk_write_en[23];
assign reg_24_gateclk_write_en = reg_gateclk_write_en[24];
assign reg_25_gateclk_write_en = reg_gateclk_write_en[25];
assign reg_26_gateclk_write_en = reg_gateclk_write_en[26];
assign reg_27_gateclk_write_en = reg_gateclk_write_en[27];
assign reg_28_gateclk_write_en = reg_gateclk_write_en[28];
assign reg_29_gateclk_write_en = reg_gateclk_write_en[29];
assign reg_30_gateclk_write_en = reg_gateclk_write_en[30];
assign reg_31_gateclk_write_en = reg_gateclk_write_en[31];
assign reg_32_gateclk_write_en = reg_gateclk_write_en[32];

assign reg_e_gateclk_write_en = frt_recover_updt_vld
                                || ctrl_rt_inst0_vld && dp_frt_inst0_dste_vld
                                || ctrl_rt_inst1_vld && dp_frt_inst1_dste_vld
                                || ctrl_rt_inst2_vld && dp_frt_inst2_dste_vld
                                || ctrl_rt_inst3_vld && dp_frt_inst3_dste_vld;

assign reg_0_gateclk_idx_write_en  = reg_gateclk_write_en[0];
assign reg_1_gateclk_idx_write_en  = reg_gateclk_write_en[1];
assign reg_2_gateclk_idx_write_en  = reg_gateclk_write_en[2];
assign reg_3_gateclk_idx_write_en  = reg_gateclk_write_en[3];
assign reg_4_gateclk_idx_write_en  = reg_gateclk_write_en[4];
assign reg_5_gateclk_idx_write_en  = reg_gateclk_write_en[5];
assign reg_6_gateclk_idx_write_en  = reg_gateclk_write_en[6];
assign reg_7_gateclk_idx_write_en  = reg_gateclk_write_en[7];
assign reg_8_gateclk_idx_write_en  = reg_gateclk_write_en[8];
assign reg_9_gateclk_idx_write_en  = reg_gateclk_write_en[9];
assign reg_10_gateclk_idx_write_en = reg_gateclk_write_en[10];
assign reg_11_gateclk_idx_write_en = reg_gateclk_write_en[11];
assign reg_12_gateclk_idx_write_en = reg_gateclk_write_en[12];
assign reg_13_gateclk_idx_write_en = reg_gateclk_write_en[13];
assign reg_14_gateclk_idx_write_en = reg_gateclk_write_en[14];
assign reg_15_gateclk_idx_write_en = reg_gateclk_write_en[15];
assign reg_16_gateclk_idx_write_en = reg_gateclk_write_en[16];
assign reg_17_gateclk_idx_write_en = reg_gateclk_write_en[17];
assign reg_18_gateclk_idx_write_en = reg_gateclk_write_en[18];
assign reg_19_gateclk_idx_write_en = reg_gateclk_write_en[19];
assign reg_20_gateclk_idx_write_en = reg_gateclk_write_en[20];
assign reg_21_gateclk_idx_write_en = reg_gateclk_write_en[21];
assign reg_22_gateclk_idx_write_en = reg_gateclk_write_en[22];
assign reg_23_gateclk_idx_write_en = reg_gateclk_write_en[23];
assign reg_24_gateclk_idx_write_en = reg_gateclk_write_en[24];
assign reg_25_gateclk_idx_write_en = reg_gateclk_write_en[25];
assign reg_26_gateclk_idx_write_en = reg_gateclk_write_en[26];
assign reg_27_gateclk_idx_write_en = reg_gateclk_write_en[27];
assign reg_28_gateclk_idx_write_en = reg_gateclk_write_en[28];
assign reg_29_gateclk_idx_write_en = reg_gateclk_write_en[29];
assign reg_30_gateclk_idx_write_en = reg_gateclk_write_en[30];
assign reg_31_gateclk_idx_write_en = reg_gateclk_write_en[31];
assign reg_32_gateclk_idx_write_en = reg_gateclk_write_en[32];

//------------------------write data------------------------
//freg valid always initial as 0, except recover from pst
//the write back data path use gateclk wen, ignoring id stall
//priority is 3>2>1>0>pst_update
// &CombBeg; @577
always @( reg_gateclk_write2_en[0]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write1_en[0]
       or frt_recover_updt_freg[5:0]
       or reg_gateclk_write3_en[0]
       or reg_gateclk_write0_en[0]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[0])
    reg_0_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[0])
    reg_0_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[0])
    reg_0_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[0])
    reg_0_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_0_create_freg[5:0] = frt_recover_updt_freg[5:0];
// &CombEnd; @588
end
// &CombBeg; @589
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write2_en[1]
       or frt_recover_updt_freg[11:6]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write0_en[1]
       or reg_gateclk_write1_en[1]
       or reg_gateclk_write3_en[1])
begin
  if(reg_gateclk_write3_en[1])
    reg_1_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[1])
    reg_1_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[1])
    reg_1_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[1])
    reg_1_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_1_create_freg[5:0] = frt_recover_updt_freg[11:6];
// &CombEnd; @600
end
// &CombBeg; @601
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write3_en[2]
       or reg_gateclk_write0_en[2]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write1_en[2]
       or frt_recover_updt_freg[17:12]
       or reg_gateclk_write2_en[2])
begin
  if(reg_gateclk_write3_en[2])
    reg_2_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[2])
    reg_2_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[2])
    reg_2_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[2])
    reg_2_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_2_create_freg[5:0] = frt_recover_updt_freg[17:12];
// &CombEnd; @612
end
// &CombBeg; @613
always @( dp_frt_inst3_dst_freg[5:0]
       or reg_gateclk_write0_en[3]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write3_en[3]
       or reg_gateclk_write1_en[3]
       or reg_gateclk_write2_en[3]
       or dp_frt_inst2_dst_freg[5:0]
       or frt_recover_updt_freg[23:18])
begin
  if(reg_gateclk_write3_en[3])
    reg_3_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[3])
    reg_3_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[3])
    reg_3_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[3])
    reg_3_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_3_create_freg[5:0] = frt_recover_updt_freg[23:18];
// &CombEnd; @624
end
// &CombBeg; @625
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write3_en[4]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[4]
       or reg_gateclk_write1_en[4]
       or reg_gateclk_write2_en[4]
       or frt_recover_updt_freg[29:24]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[4])
    reg_4_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[4])
    reg_4_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[4])
    reg_4_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[4])
    reg_4_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_4_create_freg[5:0] = frt_recover_updt_freg[29:24];
// &CombEnd; @636
end
// &CombBeg; @637
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write1_en[5]
       or reg_gateclk_write3_en[5]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write2_en[5]
       or reg_gateclk_write0_en[5]
       or frt_recover_updt_freg[35:30]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[5])
    reg_5_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[5])
    reg_5_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[5])
    reg_5_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[5])
    reg_5_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_5_create_freg[5:0] = frt_recover_updt_freg[35:30];
// &CombEnd; @648
end
// &CombBeg; @649
always @( frt_recover_updt_freg[41:36]
       or dp_frt_inst3_dst_freg[5:0]
       or reg_gateclk_write1_en[6]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write3_en[6]
       or reg_gateclk_write0_en[6]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write2_en[6])
begin
  if(reg_gateclk_write3_en[6])
    reg_6_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[6])
    reg_6_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[6])
    reg_6_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[6])
    reg_6_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_6_create_freg[5:0] = frt_recover_updt_freg[41:36];
// &CombEnd; @660
end
// &CombBeg; @661
always @( reg_gateclk_write1_en[7]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write2_en[7]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[7]
       or dp_frt_inst2_dst_freg[5:0]
       or frt_recover_updt_freg[47:42]
       or reg_gateclk_write3_en[7])
begin
  if(reg_gateclk_write3_en[7])
    reg_7_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[7])
    reg_7_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[7])
    reg_7_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[7])
    reg_7_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_7_create_freg[5:0] = frt_recover_updt_freg[47:42];
// &CombEnd; @672
end
// &CombBeg; @673
always @( dp_frt_inst3_dst_freg[5:0]
       or frt_recover_updt_freg[53:48]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write2_en[8]
       or reg_gateclk_write1_en[8]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[8]
       or reg_gateclk_write3_en[8]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[8])
    reg_8_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[8])
    reg_8_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[8])
    reg_8_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[8])
    reg_8_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_8_create_freg[5:0] = frt_recover_updt_freg[53:48];
// &CombEnd; @684
end
// &CombBeg; @685
always @( reg_gateclk_write3_en[9]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write1_en[9]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[9]
       or dp_frt_inst2_dst_freg[5:0]
       or frt_recover_updt_freg[59:54]
       or reg_gateclk_write2_en[9])
begin
  if(reg_gateclk_write3_en[9])
    reg_9_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[9])
    reg_9_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[9])
    reg_9_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[9])
    reg_9_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_9_create_freg[5:0] = frt_recover_updt_freg[59:54];
// &CombEnd; @696
end
// &CombBeg; @697
always @( reg_gateclk_write2_en[10]
       or dp_frt_inst3_dst_freg[5:0]
       or frt_recover_updt_freg[65:60]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write0_en[10]
       or reg_gateclk_write1_en[10]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write3_en[10]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[10])
    reg_10_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[10])
    reg_10_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[10])
    reg_10_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[10])
    reg_10_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_10_create_freg[5:0] = frt_recover_updt_freg[65:60];
// &CombEnd; @708
end
// &CombBeg; @709
always @( frt_recover_updt_freg[71:66]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write2_en[11]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write0_en[11]
       or reg_gateclk_write1_en[11]
       or reg_gateclk_write3_en[11])
begin
  if(reg_gateclk_write3_en[11])
    reg_11_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[11])
    reg_11_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[11])
    reg_11_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[11])
    reg_11_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_11_create_freg[5:0] = frt_recover_updt_freg[71:66];
// &CombEnd; @720
end
// &CombBeg; @721
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write1_en[12]
       or frt_recover_updt_freg[77:72]
       or reg_gateclk_write3_en[12]
       or reg_gateclk_write2_en[12]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write0_en[12])
begin
  if(reg_gateclk_write3_en[12])
    reg_12_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[12])
    reg_12_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[12])
    reg_12_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[12])
    reg_12_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_12_create_freg[5:0] = frt_recover_updt_freg[77:72];
// &CombEnd; @732
end
// &CombBeg; @733
always @( dp_frt_inst3_dst_freg[5:0]
       or frt_recover_updt_freg[83:78]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write2_en[13]
       or reg_gateclk_write1_en[13]
       or reg_gateclk_write3_en[13]
       or reg_gateclk_write0_en[13]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[13])
    reg_13_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[13])
    reg_13_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[13])
    reg_13_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[13])
    reg_13_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_13_create_freg[5:0] = frt_recover_updt_freg[83:78];
// &CombEnd; @744
end
// &CombBeg; @745
always @( reg_gateclk_write0_en[14]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write3_en[14]
       or reg_gateclk_write2_en[14]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write1_en[14]
       or frt_recover_updt_freg[89:84]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[14])
    reg_14_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[14])
    reg_14_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[14])
    reg_14_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[14])
    reg_14_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_14_create_freg[5:0] = frt_recover_updt_freg[89:84];
// &CombEnd; @756
end
// &CombBeg; @757
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write2_en[15]
       or reg_gateclk_write0_en[15]
       or dp_frt_inst2_dst_freg[5:0]
       or frt_recover_updt_freg[95:90]
       or reg_gateclk_write1_en[15]
       or reg_gateclk_write3_en[15])
begin
  if(reg_gateclk_write3_en[15])
    reg_15_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[15])
    reg_15_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[15])
    reg_15_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[15])
    reg_15_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_15_create_freg[5:0] = frt_recover_updt_freg[95:90];
// &CombEnd; @768
end
// &CombBeg; @769
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write1_en[16]
       or reg_gateclk_write0_en[16]
       or reg_gateclk_write3_en[16]
       or frt_recover_updt_freg[101:96]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write2_en[16])
begin
  if(reg_gateclk_write3_en[16])
    reg_16_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[16])
    reg_16_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[16])
    reg_16_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[16])
    reg_16_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_16_create_freg[5:0] = frt_recover_updt_freg[101:96];
// &CombEnd; @780
end
// &CombBeg; @781
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write2_en[17]
       or reg_gateclk_write1_en[17]
       or reg_gateclk_write0_en[17]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write3_en[17]
       or frt_recover_updt_freg[107:102])
begin
  if(reg_gateclk_write3_en[17])
    reg_17_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[17])
    reg_17_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[17])
    reg_17_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[17])
    reg_17_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_17_create_freg[5:0] = frt_recover_updt_freg[107:102];
// &CombEnd; @792
end
// &CombBeg; @793
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write3_en[18]
       or frt_recover_updt_freg[113:108]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write2_en[18]
       or reg_gateclk_write0_en[18]
       or reg_gateclk_write1_en[18])
begin
  if(reg_gateclk_write3_en[18])
    reg_18_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[18])
    reg_18_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[18])
    reg_18_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[18])
    reg_18_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_18_create_freg[5:0] = frt_recover_updt_freg[113:108];
// &CombEnd; @804
end
// &CombBeg; @805
always @( reg_gateclk_write1_en[19]
       or reg_gateclk_write0_en[19]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or frt_recover_updt_freg[119:114]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write3_en[19]
       or reg_gateclk_write2_en[19])
begin
  if(reg_gateclk_write3_en[19])
    reg_19_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[19])
    reg_19_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[19])
    reg_19_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[19])
    reg_19_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_19_create_freg[5:0] = frt_recover_updt_freg[119:114];
// &CombEnd; @816
end
// &CombBeg; @817
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write0_en[20]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write3_en[20]
       or frt_recover_updt_freg[125:120]
       or reg_gateclk_write1_en[20]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write2_en[20])
begin
  if(reg_gateclk_write3_en[20])
    reg_20_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[20])
    reg_20_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[20])
    reg_20_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[20])
    reg_20_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_20_create_freg[5:0] = frt_recover_updt_freg[125:120];
// &CombEnd; @828
end
// &CombBeg; @829
always @( reg_gateclk_write3_en[21]
       or frt_recover_updt_freg[131:126]
       or dp_frt_inst3_dst_freg[5:0]
       or reg_gateclk_write0_en[21]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write1_en[21]
       or reg_gateclk_write2_en[21]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[21])
    reg_21_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[21])
    reg_21_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[21])
    reg_21_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[21])
    reg_21_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_21_create_freg[5:0] = frt_recover_updt_freg[131:126];
// &CombEnd; @840
end
// &CombBeg; @841
always @( reg_gateclk_write1_en[22]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or frt_recover_updt_freg[137:132]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[22]
       or reg_gateclk_write3_en[22]
       or reg_gateclk_write2_en[22]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[22])
    reg_22_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[22])
    reg_22_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[22])
    reg_22_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[22])
    reg_22_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_22_create_freg[5:0] = frt_recover_updt_freg[137:132];
// &CombEnd; @852
end
// &CombBeg; @853
always @( dp_frt_inst3_dst_freg[5:0]
       or reg_gateclk_write0_en[23]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write1_en[23]
       or dp_frt_inst2_dst_freg[5:0]
       or frt_recover_updt_freg[143:138]
       or reg_gateclk_write2_en[23]
       or reg_gateclk_write3_en[23])
begin
  if(reg_gateclk_write3_en[23])
    reg_23_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[23])
    reg_23_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[23])
    reg_23_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[23])
    reg_23_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_23_create_freg[5:0] = frt_recover_updt_freg[143:138];
// &CombEnd; @864
end
// &CombBeg; @865
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or frt_recover_updt_freg[149:144]
       or reg_gateclk_write0_en[24]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write2_en[24]
       or reg_gateclk_write1_en[24]
       or reg_gateclk_write3_en[24])
begin
  if(reg_gateclk_write3_en[24])
    reg_24_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[24])
    reg_24_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[24])
    reg_24_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[24])
    reg_24_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_24_create_freg[5:0] = frt_recover_updt_freg[149:144];
// &CombEnd; @876
end
// &CombBeg; @877
always @( dp_frt_inst3_dst_freg[5:0]
       or reg_gateclk_write2_en[25]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write3_en[25]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write1_en[25]
       or frt_recover_updt_freg[155:150]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write0_en[25])
begin
  if(reg_gateclk_write3_en[25])
    reg_25_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[25])
    reg_25_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[25])
    reg_25_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[25])
    reg_25_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_25_create_freg[5:0] = frt_recover_updt_freg[155:150];
// &CombEnd; @888
end
// &CombBeg; @889
always @( reg_gateclk_write1_en[26]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[26]
       or reg_gateclk_write3_en[26]
       or frt_recover_updt_freg[161:156]
       or reg_gateclk_write2_en[26]
       or dp_frt_inst2_dst_freg[5:0])
begin
  if(reg_gateclk_write3_en[26])
    reg_26_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[26])
    reg_26_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[26])
    reg_26_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[26])
    reg_26_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_26_create_freg[5:0] = frt_recover_updt_freg[161:156];
// &CombEnd; @900
end
// &CombBeg; @901
always @( reg_gateclk_write3_en[27]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write1_en[27]
       or frt_recover_updt_freg[167:162]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write0_en[27]
       or reg_gateclk_write2_en[27])
begin
  if(reg_gateclk_write3_en[27])
    reg_27_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[27])
    reg_27_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[27])
    reg_27_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[27])
    reg_27_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_27_create_freg[5:0] = frt_recover_updt_freg[167:162];
// &CombEnd; @912
end
// &CombBeg; @913
always @( dp_frt_inst3_dst_freg[5:0]
       or reg_gateclk_write3_en[28]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write2_en[28]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[28]
       or frt_recover_updt_freg[173:168]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write1_en[28])
begin
  if(reg_gateclk_write3_en[28])
    reg_28_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[28])
    reg_28_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[28])
    reg_28_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[28])
    reg_28_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_28_create_freg[5:0] = frt_recover_updt_freg[173:168];
// &CombEnd; @924
end
// &CombBeg; @925
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or reg_gateclk_write3_en[29]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[29]
       or reg_gateclk_write2_en[29]
       or frt_recover_updt_freg[179:174]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write1_en[29])
begin
  if(reg_gateclk_write3_en[29])
    reg_29_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[29])
    reg_29_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[29])
    reg_29_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[29])
    reg_29_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_29_create_freg[5:0] = frt_recover_updt_freg[179:174];
// &CombEnd; @936
end
// &CombBeg; @937
always @( frt_recover_updt_freg[185:180]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write3_en[30]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write1_en[30]
       or reg_gateclk_write0_en[30]
       or reg_gateclk_write2_en[30])
begin
  if(reg_gateclk_write3_en[30])
    reg_30_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[30])
    reg_30_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[30])
    reg_30_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[30])
    reg_30_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_30_create_freg[5:0] = frt_recover_updt_freg[185:180];
// &CombEnd; @948
end
// &CombBeg; @949
always @( reg_gateclk_write2_en[31]
       or dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write3_en[31]
       or reg_gateclk_write0_en[31]
       or reg_gateclk_write1_en[31]
       or dp_frt_inst2_dst_freg[5:0]
       or frt_recover_updt_freg[191:186])
begin
  if(reg_gateclk_write3_en[31])
    reg_31_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[31])
    reg_31_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[31])
    reg_31_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[31])
    reg_31_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_31_create_freg[5:0] = frt_recover_updt_freg[191:186];
// &CombEnd; @960
end
// &CombBeg; @961
always @( dp_frt_inst3_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or reg_gateclk_write0_en[32]
       or reg_gateclk_write2_en[32]
       or reg_gateclk_write3_en[32]
       or dp_frt_inst2_dst_freg[5:0]
       or reg_gateclk_write1_en[32])
begin
  if(reg_gateclk_write3_en[32])
    reg_32_create_freg[5:0] = dp_frt_inst3_dst_freg[5:0];
  else if(reg_gateclk_write2_en[32])
    reg_32_create_freg[5:0] = dp_frt_inst2_dst_freg[5:0];
  else if(reg_gateclk_write1_en[32])
    reg_32_create_freg[5:0] = dp_frt_inst1_dst_freg[5:0];
  else if(reg_gateclk_write0_en[32])
    reg_32_create_freg[5:0] = dp_frt_inst0_dst_freg[5:0];
  else
    reg_32_create_freg[5:0] = 6'd0;
// &CombEnd; @972
end

//write back valid always initial as 0, except recover from pst
//ready bit always initial as 0, except recover from pst
assign r_vld = frt_recover_updt_vld;
assign reg_0_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_0_create_freg[5:0] ,{2{r_vld}}};
assign reg_1_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_1_create_freg[5:0] ,{2{r_vld}}};
assign reg_2_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_2_create_freg[5:0] ,{2{r_vld}}};
assign reg_3_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_3_create_freg[5:0] ,{2{r_vld}}};
assign reg_4_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_4_create_freg[5:0] ,{2{r_vld}}};
assign reg_5_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_5_create_freg[5:0] ,{2{r_vld}}};
assign reg_6_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_6_create_freg[5:0] ,{2{r_vld}}};
assign reg_7_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_7_create_freg[5:0] ,{2{r_vld}}};
assign reg_8_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_8_create_freg[5:0] ,{2{r_vld}}};
assign reg_9_create_data[10:0]  = {1'b0,r_vld,1'b0,reg_9_create_freg[5:0] ,{2{r_vld}}};
assign reg_10_create_data[10:0] = {1'b0,r_vld,1'b0,reg_10_create_freg[5:0],{2{r_vld}}};
assign reg_11_create_data[10:0] = {1'b0,r_vld,1'b0,reg_11_create_freg[5:0],{2{r_vld}}};
assign reg_12_create_data[10:0] = {1'b0,r_vld,1'b0,reg_12_create_freg[5:0],{2{r_vld}}};
assign reg_13_create_data[10:0] = {1'b0,r_vld,1'b0,reg_13_create_freg[5:0],{2{r_vld}}};
assign reg_14_create_data[10:0] = {1'b0,r_vld,1'b0,reg_14_create_freg[5:0],{2{r_vld}}};
assign reg_15_create_data[10:0] = {1'b0,r_vld,1'b0,reg_15_create_freg[5:0],{2{r_vld}}};
assign reg_16_create_data[10:0] = {1'b0,r_vld,1'b0,reg_16_create_freg[5:0],{2{r_vld}}};
assign reg_17_create_data[10:0] = {1'b0,r_vld,1'b0,reg_17_create_freg[5:0],{2{r_vld}}};
assign reg_18_create_data[10:0] = {1'b0,r_vld,1'b0,reg_18_create_freg[5:0],{2{r_vld}}};
assign reg_19_create_data[10:0] = {1'b0,r_vld,1'b0,reg_19_create_freg[5:0],{2{r_vld}}};
assign reg_20_create_data[10:0] = {1'b0,r_vld,1'b0,reg_20_create_freg[5:0],{2{r_vld}}};
assign reg_21_create_data[10:0] = {1'b0,r_vld,1'b0,reg_21_create_freg[5:0],{2{r_vld}}};
assign reg_22_create_data[10:0] = {1'b0,r_vld,1'b0,reg_22_create_freg[5:0],{2{r_vld}}};
assign reg_23_create_data[10:0] = {1'b0,r_vld,1'b0,reg_23_create_freg[5:0],{2{r_vld}}};
assign reg_24_create_data[10:0] = {1'b0,r_vld,1'b0,reg_24_create_freg[5:0],{2{r_vld}}};
assign reg_25_create_data[10:0] = {1'b0,r_vld,1'b0,reg_25_create_freg[5:0],{2{r_vld}}};
assign reg_26_create_data[10:0] = {1'b0,r_vld,1'b0,reg_26_create_freg[5:0],{2{r_vld}}};
assign reg_27_create_data[10:0] = {1'b0,r_vld,1'b0,reg_27_create_freg[5:0],{2{r_vld}}};
assign reg_28_create_data[10:0] = {1'b0,r_vld,1'b0,reg_28_create_freg[5:0],{2{r_vld}}};
assign reg_29_create_data[10:0] = {1'b0,r_vld,1'b0,reg_29_create_freg[5:0],{2{r_vld}}};
assign reg_30_create_data[10:0] = {1'b0,r_vld,1'b0,reg_30_create_freg[5:0],{2{r_vld}}};
assign reg_31_create_data[10:0] = {1'b0,r_vld,1'b0,reg_31_create_freg[5:0],{2{r_vld}}};
assign reg_32_create_data[10:0] = {1'b0,r_vld,1'b0,reg_32_create_freg[5:0],{2{r_vld}}};

// &CombBeg; @1011
always @( ctrl_rt_inst0_vld
       or ctrl_rt_inst3_vld
       or ctrl_rt_inst1_vld
       or frt_recover_updt_ereg[4:0]
       or dp_frt_inst3_dste_vld
       or frt_recover_updt_vld
       or ctrl_rt_inst2_vld
       or dp_frt_inst2_dst_ereg[4:0]
       or dp_frt_inst2_dste_vld
       or dp_frt_inst0_dste_vld
       or dp_frt_inst3_dst_ereg[4:0]
       or dp_frt_inst0_dst_ereg[4:0]
       or dp_frt_inst1_dst_ereg[4:0]
       or dp_frt_inst1_dste_vld)
begin
  if(ctrl_rt_inst3_vld && dp_frt_inst3_dste_vld && !frt_recover_updt_vld)
    reg_e_create_ereg[4:0] = dp_frt_inst3_dst_ereg[4:0];
  else if(ctrl_rt_inst2_vld && dp_frt_inst2_dste_vld && !frt_recover_updt_vld)
    reg_e_create_ereg[4:0] = dp_frt_inst2_dst_ereg[4:0];
  else if(ctrl_rt_inst1_vld && dp_frt_inst1_dste_vld && !frt_recover_updt_vld)
    reg_e_create_ereg[4:0] = dp_frt_inst1_dst_ereg[4:0];
  else if(ctrl_rt_inst0_vld && dp_frt_inst0_dste_vld && !frt_recover_updt_vld)
    reg_e_create_ereg[4:0] = dp_frt_inst0_dst_ereg[4:0];
  else
    reg_e_create_ereg[4:0] = frt_recover_updt_ereg[4:0];
// &CombEnd; @1022
end

//==========================================================
//                       Read Port
//==========================================================
//-----------------instruction 0 source 0-------------------
// &CombBeg; @1028
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or dp_frt_inst0_srcf0_reg[5:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst0_srcf0_reg[5:0])
    6'd0   : inst0_srcf0_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst0_srcf0_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst0_srcf0_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst0_srcf0_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst0_srcf0_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst0_srcf0_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst0_srcf0_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst0_srcf0_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst0_srcf0_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst0_srcf0_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst0_srcf0_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst0_srcf0_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst0_srcf0_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst0_srcf0_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst0_srcf0_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst0_srcf0_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst0_srcf0_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst0_srcf0_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst0_srcf0_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst0_srcf0_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst0_srcf0_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst0_srcf0_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst0_srcf0_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst0_srcf0_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst0_srcf0_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst0_srcf0_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst0_srcf0_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst0_srcf0_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst0_srcf0_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst0_srcf0_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst0_srcf0_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst0_srcf0_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst0_srcf0_read_data[12:0] = reg_32_read_data[12:0];
    default: inst0_srcf0_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1065
end

assign inst0_srcf0_read_rdy       = inst0_srcf0_read_data[0];
assign inst0_srcf0_read_wb        = inst0_srcf0_read_data[1];
assign inst0_srcf0_read_freg[5:0] = inst0_srcf0_read_data[7:2];
assign inst0_srcf0_read_mla_rdy   = inst0_srcf0_read_data[9];

assign frt_dp_inst0_srcf0_data[0]   = inst0_srcf0_read_rdy
                                     || !dp_frt_inst0_srcf0_vld;
assign frt_dp_inst0_srcf0_data[1]   = inst0_srcf0_read_wb
                                     || !dp_frt_inst0_srcf0_vld;
assign frt_dp_inst0_srcf0_data[8:2] = {1'b0,inst0_srcf0_read_freg[5:0]};

//if inst0 is mov, bypass srcf0 dep info to inst in same packet
assign frt_inst0_fmov_dst_rdy       = inst0_srcf0_read_rdy;
assign frt_inst0_fmov_dst_mla_rdy   = inst0_srcf0_read_mla_rdy;
assign frt_inst0_fmov_dst_wb        = inst0_srcf0_read_wb;
assign frt_inst0_fmov_dst_freg[5:0] = inst0_srcf0_read_freg[5:0];

//-----------------instruction 0 source 1-------------------
// &CombBeg; @1085
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or dp_frt_inst0_srcf1_reg[5:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst0_srcf1_reg[5:0])
    6'd0   : inst0_srcf1_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst0_srcf1_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst0_srcf1_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst0_srcf1_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst0_srcf1_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst0_srcf1_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst0_srcf1_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst0_srcf1_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst0_srcf1_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst0_srcf1_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst0_srcf1_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst0_srcf1_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst0_srcf1_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst0_srcf1_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst0_srcf1_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst0_srcf1_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst0_srcf1_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst0_srcf1_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst0_srcf1_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst0_srcf1_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst0_srcf1_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst0_srcf1_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst0_srcf1_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst0_srcf1_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst0_srcf1_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst0_srcf1_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst0_srcf1_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst0_srcf1_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst0_srcf1_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst0_srcf1_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst0_srcf1_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst0_srcf1_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst0_srcf1_read_data[12:0] = reg_32_read_data[12:0];
    default: inst0_srcf1_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1122
end

assign inst0_srcf1_read_rdy       = inst0_srcf1_read_data[0];
assign inst0_srcf1_read_wb        = inst0_srcf1_read_data[1];
assign inst0_srcf1_read_freg[5:0] = inst0_srcf1_read_data[7:2];

assign frt_dp_inst0_srcf1_data[0]   = inst0_srcf1_read_rdy
                                       || !dp_frt_inst0_srcf1_vld;
assign frt_dp_inst0_srcf1_data[1]   = inst0_srcf1_read_wb
                                       || !dp_frt_inst0_srcf1_vld;
assign frt_dp_inst0_srcf1_data[8:2] = {1'b0,inst0_srcf1_read_freg[5:0]};

//-----------------instruction 0 source 2-------------------
// &CombBeg; @1135
always @( dp_frt_inst0_srcf2_reg[5:0]
       or reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst0_srcf2_reg[5:0])
    6'd0   : inst0_srcf2_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst0_srcf2_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst0_srcf2_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst0_srcf2_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst0_srcf2_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst0_srcf2_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst0_srcf2_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst0_srcf2_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst0_srcf2_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst0_srcf2_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst0_srcf2_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst0_srcf2_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst0_srcf2_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst0_srcf2_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst0_srcf2_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst0_srcf2_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst0_srcf2_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst0_srcf2_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst0_srcf2_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst0_srcf2_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst0_srcf2_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst0_srcf2_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst0_srcf2_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst0_srcf2_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst0_srcf2_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst0_srcf2_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst0_srcf2_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst0_srcf2_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst0_srcf2_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst0_srcf2_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst0_srcf2_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst0_srcf2_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst0_srcf2_read_data[12:0] = reg_32_read_data[12:0];
    default: inst0_srcf2_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1172
end

assign inst0_srcf2_read_rdy       = inst0_srcf2_read_data[0];
assign inst0_srcf2_read_wb        = inst0_srcf2_read_data[1];
assign inst0_srcf2_read_freg[5:0] = inst0_srcf2_read_data[7:2];
assign inst0_srcf2_read_mla_rdy   = inst0_srcf2_read_data[9];

assign frt_dp_inst0_srcf2_data[9]   = inst0_srcf2_read_rdy
                                      || !dp_frt_inst0_srcf2_vld;
assign frt_dp_inst0_srcf2_data[0]   = inst0_srcf2_read_mla_rdy
                                      && dp_frt_inst0_fmla
                                      || !dp_frt_inst0_srcf2_vld;
assign frt_dp_inst0_srcf2_data[1]   = inst0_srcf2_read_wb
                                      || !dp_frt_inst0_srcf2_vld;
assign frt_dp_inst0_srcf2_data[8:2] = {1'b0,inst0_srcf2_read_freg[5:0]};

//-----------instruction 0 dest reg (for release)-----------
// &CombBeg; @1189
always @( reg_27_read_data[7:2]
       or reg_12_read_data[7:2]
       or reg_25_read_data[7:2]
       or reg_1_read_data[7:2]
       or reg_16_read_data[7:2]
       or reg_10_read_data[7:2]
       or reg_2_read_data[7:2]
       or reg_21_read_data[7:2]
       or reg_20_read_data[7:2]
       or reg_28_read_data[7:2]
       or reg_22_read_data[7:2]
       or reg_11_read_data[7:2]
       or reg_6_read_data[7:2]
       or reg_19_read_data[7:2]
       or reg_26_read_data[7:2]
       or reg_30_read_data[7:2]
       or reg_7_read_data[7:2]
       or reg_31_read_data[7:2]
       or reg_3_read_data[7:2]
       or reg_8_read_data[7:2]
       or reg_0_read_data[7:2]
       or dp_frt_inst0_dstf_reg[5:0]
       or reg_4_read_data[7:2]
       or reg_18_read_data[7:2]
       or reg_9_read_data[7:2]
       or reg_32_read_data[7:2]
       or reg_29_read_data[7:2]
       or reg_23_read_data[7:2]
       or reg_13_read_data[7:2]
       or reg_24_read_data[7:2]
       or reg_5_read_data[7:2]
       or reg_14_read_data[7:2]
       or reg_17_read_data[7:2]
       or reg_15_read_data[7:2])
begin
  case (dp_frt_inst0_dstf_reg[5:0])
    6'd0   : inst0_dstf_read_freg[5:0] = reg_0_read_data[7:2];
    6'd1   : inst0_dstf_read_freg[5:0] = reg_1_read_data[7:2];
    6'd2   : inst0_dstf_read_freg[5:0] = reg_2_read_data[7:2];
    6'd3   : inst0_dstf_read_freg[5:0] = reg_3_read_data[7:2];
    6'd4   : inst0_dstf_read_freg[5:0] = reg_4_read_data[7:2];
    6'd5   : inst0_dstf_read_freg[5:0] = reg_5_read_data[7:2];
    6'd6   : inst0_dstf_read_freg[5:0] = reg_6_read_data[7:2];
    6'd7   : inst0_dstf_read_freg[5:0] = reg_7_read_data[7:2];
    6'd8   : inst0_dstf_read_freg[5:0] = reg_8_read_data[7:2];
    6'd9   : inst0_dstf_read_freg[5:0] = reg_9_read_data[7:2];
    6'd10  : inst0_dstf_read_freg[5:0] = reg_10_read_data[7:2];
    6'd11  : inst0_dstf_read_freg[5:0] = reg_11_read_data[7:2];
    6'd12  : inst0_dstf_read_freg[5:0] = reg_12_read_data[7:2];
    6'd13  : inst0_dstf_read_freg[5:0] = reg_13_read_data[7:2];
    6'd14  : inst0_dstf_read_freg[5:0] = reg_14_read_data[7:2];
    6'd15  : inst0_dstf_read_freg[5:0] = reg_15_read_data[7:2];
    6'd16  : inst0_dstf_read_freg[5:0] = reg_16_read_data[7:2];
    6'd17  : inst0_dstf_read_freg[5:0] = reg_17_read_data[7:2];
    6'd18  : inst0_dstf_read_freg[5:0] = reg_18_read_data[7:2];
    6'd19  : inst0_dstf_read_freg[5:0] = reg_19_read_data[7:2];
    6'd20  : inst0_dstf_read_freg[5:0] = reg_20_read_data[7:2];
    6'd21  : inst0_dstf_read_freg[5:0] = reg_21_read_data[7:2];
    6'd22  : inst0_dstf_read_freg[5:0] = reg_22_read_data[7:2];
    6'd23  : inst0_dstf_read_freg[5:0] = reg_23_read_data[7:2];
    6'd24  : inst0_dstf_read_freg[5:0] = reg_24_read_data[7:2];
    6'd25  : inst0_dstf_read_freg[5:0] = reg_25_read_data[7:2];
    6'd26  : inst0_dstf_read_freg[5:0] = reg_26_read_data[7:2];
    6'd27  : inst0_dstf_read_freg[5:0] = reg_27_read_data[7:2];
    6'd28  : inst0_dstf_read_freg[5:0] = reg_28_read_data[7:2];
    6'd29  : inst0_dstf_read_freg[5:0] = reg_29_read_data[7:2];
    6'd30  : inst0_dstf_read_freg[5:0] = reg_30_read_data[7:2];
    6'd31  : inst0_dstf_read_freg[5:0] = reg_31_read_data[7:2];
    6'd32  : inst0_dstf_read_freg[5:0] = reg_32_read_data[7:2];
    default: inst0_dstf_read_freg[5:0] = {6{1'bx}};
  endcase
// &CombEnd; @1226
end

//if dst is for implicit dependency, the rel_freg will be
//the dst freg of its result
assign frt_dp_inst0_rel_freg[6:0] = dp_frt_inst0_dstf_reg[5]
                                    ? {1'b0,dp_frt_inst0_dst_freg[5:0]}
                                    : {1'b0,inst0_dstf_read_freg[5:0]};

//------------instruction 0 dest c (for release)------------
assign frt_dp_inst0_rel_ereg[4:0] = reg_e_read_ereg[4:0];

//-----------------instruction 1 source 0-------------------
// &CombBeg; @1238
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or dp_frt_inst1_srcf0_reg[5:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst1_srcf0_reg[5:0])
    6'd0   : inst1_srcf0_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst1_srcf0_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst1_srcf0_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst1_srcf0_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst1_srcf0_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst1_srcf0_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst1_srcf0_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst1_srcf0_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst1_srcf0_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst1_srcf0_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst1_srcf0_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst1_srcf0_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst1_srcf0_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst1_srcf0_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst1_srcf0_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst1_srcf0_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst1_srcf0_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst1_srcf0_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst1_srcf0_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst1_srcf0_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst1_srcf0_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst1_srcf0_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst1_srcf0_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst1_srcf0_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst1_srcf0_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst1_srcf0_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst1_srcf0_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst1_srcf0_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst1_srcf0_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst1_srcf0_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst1_srcf0_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst1_srcf0_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst1_srcf0_read_data[12:0] = reg_32_read_data[12:0];
    default: inst1_srcf0_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1275
end

assign inst1_srcf0_read_rdy       = inst1_srcf0_read_data[0];
assign inst1_srcf0_read_wb        = inst1_srcf0_read_data[1];
assign inst1_srcf0_read_freg[5:0] = inst1_srcf0_read_data[7:2];
assign inst1_srcf0_read_mla_rdy   = inst1_srcf0_read_data[9];

//if source register index of instruction 0 is same with
//destination register index of instruction 1, dependency
//information is bypass from instruction 0 value
//the normal source in split instruction with implicit dependency
//should not match split destination
assign frt_inst1_srcf0_match_inst0 =
            ctrl_rt_inst1_vld && dp_frt_inst1_srcf0_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst1_srcf0_reg[5:0])
         && !dp_rt_dep_info[DEP_INST01_VREG_MASK];

// &CombBeg; @1293
always @( inst1_srcf0_read_rdy
       or dp_frt_inst1_srcf0_vld
       or dp_frt_inst0_dst_freg[5:0]
       or inst1_srcf0_read_wb
       or frt_inst0_fmov_dst_rdy
       or inst1_srcf0_read_freg[5:0]
       or dp_frt_inst0_fmov
       or frt_inst1_srcf0_match_inst0
       or frt_inst0_fmov_dst_wb
       or frt_inst0_fmov_dst_freg[5:0])
begin
  if(frt_inst1_srcf0_match_inst0 && dp_frt_inst0_fmov) begin
    frt_dp_inst1_srcf0_data[0]   = frt_inst0_fmov_dst_rdy;
    frt_dp_inst1_srcf0_data[1]   = frt_inst0_fmov_dst_wb;
    frt_dp_inst1_srcf0_data[8:2] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};
  end
  else if(frt_inst1_srcf0_match_inst0) begin
    frt_dp_inst1_srcf0_data[0]   = 1'b0;
    frt_dp_inst1_srcf0_data[1]   = 1'b0;
    frt_dp_inst1_srcf0_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  end
  else begin
    frt_dp_inst1_srcf0_data[0]   = inst1_srcf0_read_rdy
                                   || !dp_frt_inst1_srcf0_vld;
    frt_dp_inst1_srcf0_data[1]   = inst1_srcf0_read_wb
                                   || !dp_frt_inst1_srcf0_vld;
    frt_dp_inst1_srcf0_data[8:2] = {1'b0,inst1_srcf0_read_freg[5:0]};
  end
// &CombEnd; @1311
end

//if inst1 is mov, bypass srcf0 dep info to inst in same packet
// &CombBeg; @1314
always @( inst1_srcf0_read_rdy
       or inst1_srcf0_read_mla_rdy
       or dp_frt_inst0_dst_freg[5:0]
       or inst1_srcf0_read_wb
       or inst1_srcf0_read_freg[5:0]
       or frt_inst1_srcf0_match_inst0)
begin
  if(frt_inst1_srcf0_match_inst0) begin
    frt_inst1_fmov_dst_rdy         = 1'b0;
    frt_inst1_fmov_dst_mla_rdy     = 1'b0;
    frt_inst1_fmov_dst_wb          = 1'b0;
    frt_inst1_fmov_dst_freg[5:0]   = dp_frt_inst0_dst_freg[5:0];
    frt_inst1_fmov_dst_match_inst0 = 1'b1;
  end
  else begin
    frt_inst1_fmov_dst_rdy         = inst1_srcf0_read_rdy;
    frt_inst1_fmov_dst_mla_rdy     = inst1_srcf0_read_mla_rdy;
    frt_inst1_fmov_dst_wb          = inst1_srcf0_read_wb;
    frt_inst1_fmov_dst_freg[5:0]   = inst1_srcf0_read_freg[5:0];
    frt_inst1_fmov_dst_match_inst0 = 1'b0;
  end
// &CombEnd; @1329
end

//-----------------instruction 1 source 1-------------------
// &CombBeg; @1332
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or dp_frt_inst1_srcf1_reg[5:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst1_srcf1_reg[5:0])
    6'd0   : inst1_srcf1_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst1_srcf1_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst1_srcf1_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst1_srcf1_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst1_srcf1_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst1_srcf1_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst1_srcf1_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst1_srcf1_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst1_srcf1_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst1_srcf1_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst1_srcf1_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst1_srcf1_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst1_srcf1_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst1_srcf1_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst1_srcf1_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst1_srcf1_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst1_srcf1_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst1_srcf1_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst1_srcf1_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst1_srcf1_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst1_srcf1_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst1_srcf1_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst1_srcf1_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst1_srcf1_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst1_srcf1_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst1_srcf1_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst1_srcf1_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst1_srcf1_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst1_srcf1_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst1_srcf1_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst1_srcf1_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst1_srcf1_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst1_srcf1_read_data[12:0] = reg_32_read_data[12:0];
    default: inst1_srcf1_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1369
end

assign inst1_srcf1_read_rdy       = inst1_srcf1_read_data[0];
assign inst1_srcf1_read_wb        = inst1_srcf1_read_data[1];
assign inst1_srcf1_read_freg[5:0] = inst1_srcf1_read_data[7:2];

//if source register index of instruction 0 is same with
//destination register index of instruction 1, dependency
//information is bypass from instruction 0 value
//the normal source in split instruction with implicit dependency
//should not match split destination
//source 1 will never be splited
assign frt_inst1_srcf1_match_inst0 =
            ctrl_rt_inst1_vld && dp_frt_inst1_srcf1_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst1_srcf1_reg[5:0])
         && !(dp_rt_dep_info[DEP_INST01_VREG_MASK]
           || dp_rt_dep_info[DEP_INST01_SRCV1_MASK]);

// &CombBeg; @1388
always @( dp_frt_inst0_dst_freg[5:0]
       or frt_inst0_fmov_dst_rdy
       or inst1_srcf1_read_wb
       or dp_frt_inst1_srcf1_vld
       or inst1_srcf1_read_freg[5:0]
       or dp_frt_inst0_fmov
       or frt_inst0_fmov_dst_wb
       or frt_inst0_fmov_dst_freg[5:0]
       or frt_inst1_srcf1_match_inst0
       or inst1_srcf1_read_rdy)
begin
  if(frt_inst1_srcf1_match_inst0 && dp_frt_inst0_fmov) begin
    frt_dp_inst1_srcf1_data[0]   = frt_inst0_fmov_dst_rdy;
    frt_dp_inst1_srcf1_data[1]   = frt_inst0_fmov_dst_wb;
    frt_dp_inst1_srcf1_data[8:2] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};
  end
  else if(frt_inst1_srcf1_match_inst0) begin
    frt_dp_inst1_srcf1_data[0]   = 1'b0;
    frt_dp_inst1_srcf1_data[1]   = 1'b0;
    frt_dp_inst1_srcf1_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  end
  else begin
    frt_dp_inst1_srcf1_data[0]   = inst1_srcf1_read_rdy
                                   || !dp_frt_inst1_srcf1_vld;
    frt_dp_inst1_srcf1_data[1]   = inst1_srcf1_read_wb
                                   || !dp_frt_inst1_srcf1_vld;
    frt_dp_inst1_srcf1_data[8:2] = {1'b0,inst1_srcf1_read_freg[5:0]};
  end
// &CombEnd; @1406
end

//-----------------instruction 1 source 2-------------------
// &CombBeg; @1409
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or dp_frt_inst1_srcf2_reg[5:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst1_srcf2_reg[5:0])
    6'd0   : inst1_srcf2_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst1_srcf2_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst1_srcf2_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst1_srcf2_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst1_srcf2_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst1_srcf2_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst1_srcf2_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst1_srcf2_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst1_srcf2_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst1_srcf2_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst1_srcf2_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst1_srcf2_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst1_srcf2_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst1_srcf2_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst1_srcf2_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst1_srcf2_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst1_srcf2_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst1_srcf2_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst1_srcf2_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst1_srcf2_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst1_srcf2_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst1_srcf2_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst1_srcf2_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst1_srcf2_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst1_srcf2_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst1_srcf2_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst1_srcf2_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst1_srcf2_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst1_srcf2_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst1_srcf2_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst1_srcf2_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst1_srcf2_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst1_srcf2_read_data[12:0] = reg_32_read_data[12:0];
    default: inst1_srcf2_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1446
end

assign inst1_srcf2_read_rdy       = inst1_srcf2_read_data[0];
assign inst1_srcf2_read_wb        = inst1_srcf2_read_data[1];
assign inst1_srcf2_read_freg[5:0] = inst1_srcf2_read_data[7:2];
assign inst1_srcf2_read_mla_rdy   = inst1_srcf2_read_data[9];

//if source register index of instruction 0 is same with
//destination register index of instruction 1, dependency
//information is bypass from instruction 0 value
//the normal source in split instruction with implicit dependency
//should not match split destination
//source 1 will never be splited
assign frt_inst1_srcf2_match_inst0 =
            ctrl_rt_inst1_vld && dp_frt_inst1_srcf2_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst1_srcf2_reg[5:0])
         && !dp_rt_dep_info[DEP_INST01_VREG_MASK];

// &CombBeg; @1465
always @( frt_inst1_srcf2_match_inst0
       or dp_frt_inst0_dst_freg[5:0]
       or frt_inst0_fmov_dst_rdy
       or dp_frt_inst0_fmov
       or frt_inst0_fmov_dst_mla_rdy
       or frt_inst0_fmov_dst_wb
       or inst1_srcf2_read_mla_rdy
       or frt_inst0_fmov_dst_freg[5:0]
       or dp_frt_inst1_fmla
       or dp_frt_inst1_srcf2_vld
       or inst1_srcf2_read_freg[5:0]
       or inst1_srcf2_read_rdy
       or inst1_srcf2_read_wb)
begin
  if(frt_inst1_srcf2_match_inst0 && dp_frt_inst0_fmov) begin
    frt_dp_inst1_srcf2_data[9]   = frt_inst0_fmov_dst_rdy;
    frt_dp_inst1_srcf2_data[0]   = frt_inst0_fmov_dst_mla_rdy;
    frt_dp_inst1_srcf2_data[1]   = frt_inst0_fmov_dst_wb;
    frt_dp_inst1_srcf2_data[8:2] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};

    frt_dp_inst01_srcf2_match    = 1'b0;
  end
  else if(frt_inst1_srcf2_match_inst0) begin
    frt_dp_inst1_srcf2_data[9]   = 1'b0;
    frt_dp_inst1_srcf2_data[0]   = 1'b0;
    frt_dp_inst1_srcf2_data[1]   = 1'b0;
    frt_dp_inst1_srcf2_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};

    frt_dp_inst01_srcf2_match    = 1'b1;
  end
  else begin
    frt_dp_inst1_srcf2_data[9]   = inst1_srcf2_read_rdy
                                   || !dp_frt_inst1_srcf2_vld;
    frt_dp_inst1_srcf2_data[0]   = inst1_srcf2_read_mla_rdy
                                   && dp_frt_inst1_fmla
                                   || !dp_frt_inst1_srcf2_vld;
    frt_dp_inst1_srcf2_data[1]   = inst1_srcf2_read_wb
                                   || !dp_frt_inst1_srcf2_vld;
    frt_dp_inst1_srcf2_data[8:2] = {1'b0,inst1_srcf2_read_freg[5:0]};

    frt_dp_inst01_srcf2_match    = 1'b0;
  end
// &CombEnd; @1494
end

//-----------instruction 1 dest reg (for release)-----------
// &CombBeg; @1497
always @( dp_frt_inst1_dstf_reg[5:0]
       or reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst1_dstf_reg[5:0])
    6'd0   : inst1_dstf_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst1_dstf_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst1_dstf_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst1_dstf_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst1_dstf_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst1_dstf_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst1_dstf_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst1_dstf_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst1_dstf_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst1_dstf_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst1_dstf_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst1_dstf_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst1_dstf_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst1_dstf_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst1_dstf_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst1_dstf_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst1_dstf_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst1_dstf_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst1_dstf_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst1_dstf_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst1_dstf_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst1_dstf_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst1_dstf_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst1_dstf_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst1_dstf_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst1_dstf_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst1_dstf_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst1_dstf_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst1_dstf_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst1_dstf_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst1_dstf_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst1_dstf_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst1_dstf_read_data[12:0] = reg_32_read_data[12:0];
    default: inst1_dstf_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1534
end

assign inst1_dstf_read_freg[5:0] = inst1_dstf_read_data[7:2];

//if destination register index of instruction 0 is same with
//destination register index of instruction 1, dependency
//information is bypass from instruction 0 value
//the normal destination in split instruction with implicit dependency
//should not match split destination
//split destination should not match split/normal destination
assign frt_inst1_dstf_match_inst0 =
            ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst1_dstf_reg[5:0]);

//if dst is for implicit dependency, the rel_freg will be
//the dst freg of its result
// &CombBeg; @1551
always @( inst1_dstf_read_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or frt_inst1_dstf_match_inst0
       or dp_frt_inst1_dstf_reg[5])
begin
  if(dp_frt_inst1_dstf_reg[5])
    frt_dp_inst1_rel_freg[6:0] = {1'b0,dp_frt_inst1_dst_freg[5:0]};
  else if(frt_inst1_dstf_match_inst0)
    frt_dp_inst1_rel_freg[6:0] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  else
    frt_dp_inst1_rel_freg[6:0] = {1'b0,inst1_dstf_read_freg[5:0]};
// &CombEnd; @1558
end

//------------instruction 1 dest f (for release)------------
//if instruction 1 gets destination f and instruction 0 gets
//destination f, dependency information is bypass from 
//instruction 0 value
assign frt_inst1_dste_match_inst0 = 
            ctrl_rt_inst1_vld && dp_frt_inst1_dste_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dste_vld;

assign frt_dp_inst1_rel_ereg[4:0] = (frt_inst1_dste_match_inst0)
                                   ? dp_frt_inst0_dst_ereg[4:0]
                                   : reg_e_read_ereg[4:0];

//-----------------instruction 2 source 0-------------------
// &CombBeg; @1573
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or dp_frt_inst2_srcf0_reg[5:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst2_srcf0_reg[5:0])
    6'd0   : inst2_srcf0_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst2_srcf0_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst2_srcf0_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst2_srcf0_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst2_srcf0_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst2_srcf0_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst2_srcf0_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst2_srcf0_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst2_srcf0_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst2_srcf0_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst2_srcf0_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst2_srcf0_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst2_srcf0_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst2_srcf0_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst2_srcf0_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst2_srcf0_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst2_srcf0_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst2_srcf0_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst2_srcf0_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst2_srcf0_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst2_srcf0_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst2_srcf0_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst2_srcf0_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst2_srcf0_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst2_srcf0_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst2_srcf0_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst2_srcf0_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst2_srcf0_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst2_srcf0_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst2_srcf0_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst2_srcf0_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst2_srcf0_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst2_srcf0_read_data[12:0] = reg_32_read_data[12:0];
    default: inst2_srcf0_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1610
end

assign inst2_srcf0_read_rdy       = inst2_srcf0_read_data[0];
assign inst2_srcf0_read_wb        = inst2_srcf0_read_data[1];
assign inst2_srcf0_read_freg[5:0] = inst2_srcf0_read_data[7:2];
assign inst2_srcf0_read_mla_rdy   = inst2_srcf0_read_data[9];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
//no implicity dependency across two insts, the split src
//can only adjacent split dest
assign frt_inst2_srcf0_match_inst0 =
            ctrl_rt_inst2_vld && dp_frt_inst2_srcf0_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst2_srcf0_reg[5:0])
         && !dp_rt_dep_info[DEP_INST02_VREG_MASK];
assign frt_inst2_srcf0_match_inst1 =
            ctrl_rt_inst2_vld && dp_frt_inst2_srcf0_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && (dp_frt_inst1_dstf_reg[5:0] == dp_frt_inst2_srcf0_reg[5:0])
         && !dp_rt_dep_info[DEP_INST12_VREG_MASK];

//if inst1 dest is same with inst0 (mov) srcf0, inst1 may release mov srcf0
//before inst2 src gets mov srcf0 value, so disable mov bypass in this condition
assign frt_inst0_fmov_bypass_over_inst1 =
            dp_frt_inst0_fmov
            && !(dp_frt_inst1_dstf_vld
                 && (dp_frt_inst0_srcf0_reg[5:0] == dp_frt_inst1_dstf_reg[5:0]));

// &CombBeg; @1640
always @( frt_inst1_fmov_dst_rdy
       or inst2_srcf0_read_wb
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or dp_frt_inst1_fmov
       or inst2_srcf0_read_rdy
       or frt_inst0_fmov_dst_rdy
       or inst2_srcf0_read_freg[5:0]
       or dp_frt_inst2_srcf0_vld
       or frt_inst2_srcf0_match_inst0
       or frt_inst2_srcf0_match_inst1
       or frt_inst0_fmov_dst_wb
       or frt_inst1_fmov_dst_freg[5:0]
       or frt_inst0_fmov_dst_freg[5:0]
       or frt_inst1_fmov_dst_wb
       or frt_inst0_fmov_bypass_over_inst1)
begin
  if(frt_inst2_srcf0_match_inst1 && dp_frt_inst1_fmov) begin
    frt_dp_inst2_srcf0_data[0]   = frt_inst1_fmov_dst_rdy;
    frt_dp_inst2_srcf0_data[1]   = frt_inst1_fmov_dst_wb;
    frt_dp_inst2_srcf0_data[8:2] = {1'b0,frt_inst1_fmov_dst_freg[5:0]};
  end
  else if(frt_inst2_srcf0_match_inst1) begin
    frt_dp_inst2_srcf0_data[0]   = 1'b0;
    frt_dp_inst2_srcf0_data[1]   = 1'b0;
    frt_dp_inst2_srcf0_data[8:2] = {1'b0,dp_frt_inst1_dst_freg[5:0]};
  end
  else if(frt_inst2_srcf0_match_inst0 && frt_inst0_fmov_bypass_over_inst1) begin
    frt_dp_inst2_srcf0_data[0]   = frt_inst0_fmov_dst_rdy;
    frt_dp_inst2_srcf0_data[1]   = frt_inst0_fmov_dst_wb;
    frt_dp_inst2_srcf0_data[8:2] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};
  end
  else if(frt_inst2_srcf0_match_inst0) begin
    frt_dp_inst2_srcf0_data[0]   = 1'b0;
    frt_dp_inst2_srcf0_data[1]   = 1'b0;
    frt_dp_inst2_srcf0_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  end
  else begin
    frt_dp_inst2_srcf0_data[0]   = inst2_srcf0_read_rdy
                                   || !dp_frt_inst2_srcf0_vld;
    frt_dp_inst2_srcf0_data[1]   = inst2_srcf0_read_wb
                                   || !dp_frt_inst2_srcf0_vld;
    frt_dp_inst2_srcf0_data[8:2] = {1'b0,inst2_srcf0_read_freg[5:0]};
  end
// &CombEnd; @1668
end

//if inst2 is mov, bypass srcf0 dep info to inst in same packet
// &CombBeg; @1671
always @( dp_frt_inst2_fmov
       or dp_frt_inst2_dst_freg[5:0]
       or inst2_srcf0_read_wb
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or inst2_srcf0_read_rdy
       or inst2_srcf0_read_freg[5:0]
       or inst2_srcf0_read_mla_rdy
       or frt_inst2_srcf0_match_inst0
       or frt_inst2_srcf0_match_inst1)
begin
  if(dp_frt_inst2_fmov && frt_inst2_srcf0_match_inst1) begin
    frt_inst2_dst_rdy          = 1'b0;
    frt_inst2_dst_mla_rdy      = 1'b0;
    frt_inst2_dst_wb           = 1'b0;
    frt_inst2_dst_freg[5:0]    = dp_frt_inst1_dst_freg[5:0];

    frt_inst2_fmov_match_inst0 = 1'b0;
    frt_inst2_fmov_match_inst1 = 1'b1;
    frt_inst2_fmov_match_inst2 = 1'b0;
  end
  else if(dp_frt_inst2_fmov && frt_inst2_srcf0_match_inst0) begin
    frt_inst2_dst_rdy          = 1'b0;
    frt_inst2_dst_mla_rdy      = 1'b0;
    frt_inst2_dst_wb           = 1'b0;
    frt_inst2_dst_freg[5:0]    = dp_frt_inst0_dst_freg[5:0];

    frt_inst2_fmov_match_inst0 = 1'b1;
    frt_inst2_fmov_match_inst1 = 1'b0;
    frt_inst2_fmov_match_inst2 = 1'b0;
  end
  else if(dp_frt_inst2_fmov) begin
    frt_inst2_dst_rdy          = inst2_srcf0_read_rdy;
    frt_inst2_dst_mla_rdy      = inst2_srcf0_read_mla_rdy;
    frt_inst2_dst_wb           = inst2_srcf0_read_wb;
    frt_inst2_dst_freg[5:0]    = inst2_srcf0_read_freg[5:0];

    frt_inst2_fmov_match_inst0 = 1'b0;
    frt_inst2_fmov_match_inst1 = 1'b0;
    frt_inst2_fmov_match_inst2 = 1'b0;
  end
  else begin
    frt_inst2_dst_rdy          = 1'b0;
    frt_inst2_dst_mla_rdy      = 1'b0;
    frt_inst2_dst_wb           = 1'b0;
    frt_inst2_dst_freg[5:0]    = dp_frt_inst2_dst_freg[5:0];

    frt_inst2_fmov_match_inst0 = 1'b0;
    frt_inst2_fmov_match_inst1 = 1'b0;
    frt_inst2_fmov_match_inst2 = 1'b1;
  end
// &CombEnd; @1712
end

//-----------------instruction 2 source 1-------------------
// &CombBeg; @1715
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or dp_frt_inst2_srcf1_reg[5:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst2_srcf1_reg[5:0])
    6'd0   : inst2_srcf1_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst2_srcf1_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst2_srcf1_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst2_srcf1_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst2_srcf1_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst2_srcf1_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst2_srcf1_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst2_srcf1_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst2_srcf1_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst2_srcf1_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst2_srcf1_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst2_srcf1_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst2_srcf1_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst2_srcf1_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst2_srcf1_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst2_srcf1_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst2_srcf1_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst2_srcf1_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst2_srcf1_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst2_srcf1_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst2_srcf1_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst2_srcf1_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst2_srcf1_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst2_srcf1_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst2_srcf1_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst2_srcf1_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst2_srcf1_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst2_srcf1_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst2_srcf1_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst2_srcf1_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst2_srcf1_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst2_srcf1_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst2_srcf1_read_data[12:0] = reg_32_read_data[12:0];
    default: inst2_srcf1_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1752
end

assign inst2_srcf1_read_rdy       = inst2_srcf1_read_data[0];
assign inst2_srcf1_read_wb        = inst2_srcf1_read_data[1];
assign inst2_srcf1_read_freg[5:0] = inst2_srcf1_read_data[7:2];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
assign frt_inst2_srcf1_match_inst0 =
            ctrl_rt_inst2_vld && dp_frt_inst2_srcf1_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst2_srcf1_reg[5:0])
         && !dp_rt_dep_info[DEP_INST02_VREG_MASK];
assign frt_inst2_srcf1_match_inst1 =
            ctrl_rt_inst2_vld && dp_frt_inst2_srcf1_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && (dp_frt_inst1_dstf_reg[5:0] == dp_frt_inst2_srcf1_reg[5:0])
         && !(dp_rt_dep_info[DEP_INST12_VREG_MASK]
           || dp_rt_dep_info[DEP_INST12_SRCV1_MASK]);

// &CombBeg; @1773
always @( frt_inst1_fmov_dst_rdy
       or frt_inst2_srcf1_match_inst0
       or dp_frt_inst2_srcf1_vld
       or inst2_srcf1_read_wb
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or inst2_srcf1_read_freg[5:0]
       or dp_frt_inst1_fmov
       or frt_inst0_fmov_dst_rdy
       or inst2_srcf1_read_rdy
       or frt_inst2_srcf1_match_inst1
       or frt_inst0_fmov_dst_wb
       or frt_inst1_fmov_dst_freg[5:0]
       or frt_inst0_fmov_dst_freg[5:0]
       or frt_inst1_fmov_dst_wb
       or frt_inst0_fmov_bypass_over_inst1)
begin
  if(frt_inst2_srcf1_match_inst1 && dp_frt_inst1_fmov) begin
    frt_dp_inst2_srcf1_data[0]   = frt_inst1_fmov_dst_rdy;
    frt_dp_inst2_srcf1_data[1]   = frt_inst1_fmov_dst_wb;
    frt_dp_inst2_srcf1_data[8:2] = {1'b0,frt_inst1_fmov_dst_freg[5:0]};
  end
  else if(frt_inst2_srcf1_match_inst1) begin
    frt_dp_inst2_srcf1_data[0]   = 1'b0;
    frt_dp_inst2_srcf1_data[1]   = 1'b0;
    frt_dp_inst2_srcf1_data[8:2] = {1'b0,dp_frt_inst1_dst_freg[5:0]};
  end
  else if(frt_inst2_srcf1_match_inst0 && frt_inst0_fmov_bypass_over_inst1) begin
    frt_dp_inst2_srcf1_data[0]   = frt_inst0_fmov_dst_rdy;
    frt_dp_inst2_srcf1_data[1]   = frt_inst0_fmov_dst_wb;
    frt_dp_inst2_srcf1_data[8:2] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};
  end
  else if(frt_inst2_srcf1_match_inst0) begin
    frt_dp_inst2_srcf1_data[0]   = 1'b0;
    frt_dp_inst2_srcf1_data[1]   = 1'b0;
    frt_dp_inst2_srcf1_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  end
  else begin
    frt_dp_inst2_srcf1_data[0]   = inst2_srcf1_read_rdy
                                   || !dp_frt_inst2_srcf1_vld;
    frt_dp_inst2_srcf1_data[1]   = inst2_srcf1_read_wb
                                   || !dp_frt_inst2_srcf1_vld;
    frt_dp_inst2_srcf1_data[8:2] = {1'b0,inst2_srcf1_read_freg[5:0]};
  end
// &CombEnd; @1801
end

//-----------------instruction 2 source 2-------------------
// &CombBeg; @1804
always @( reg_28_read_data[12:0]
       or dp_frt_inst2_srcf2_reg[5:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst2_srcf2_reg[5:0])
    6'd0   : inst2_srcf2_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst2_srcf2_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst2_srcf2_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst2_srcf2_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst2_srcf2_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst2_srcf2_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst2_srcf2_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst2_srcf2_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst2_srcf2_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst2_srcf2_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst2_srcf2_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst2_srcf2_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst2_srcf2_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst2_srcf2_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst2_srcf2_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst2_srcf2_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst2_srcf2_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst2_srcf2_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst2_srcf2_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst2_srcf2_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst2_srcf2_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst2_srcf2_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst2_srcf2_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst2_srcf2_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst2_srcf2_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst2_srcf2_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst2_srcf2_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst2_srcf2_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst2_srcf2_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst2_srcf2_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst2_srcf2_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst2_srcf2_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst2_srcf2_read_data[12:0] = reg_32_read_data[12:0];
    default: inst2_srcf2_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1841
end

assign inst2_srcf2_read_rdy       = inst2_srcf2_read_data[0];
assign inst2_srcf2_read_wb        = inst2_srcf2_read_data[1];
assign inst2_srcf2_read_freg[5:0] = inst2_srcf2_read_data[7:2];
assign inst2_srcf2_read_mla_rdy   = inst2_srcf2_read_data[9];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
assign frt_inst2_srcf2_match_inst0 =
            ctrl_rt_inst2_vld && dp_frt_inst2_srcf2_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst2_srcf2_reg[5:0])
         && !dp_rt_dep_info[DEP_INST02_VREG_MASK];
assign frt_inst2_srcf2_match_inst1 =
            ctrl_rt_inst2_vld && dp_frt_inst2_srcf2_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && (dp_frt_inst1_dstf_reg[5:0] == dp_frt_inst2_srcf2_reg[5:0])
         && !dp_rt_dep_info[DEP_INST12_VREG_MASK];

// &CombBeg; @1862
always @( frt_inst1_fmov_dst_rdy
       or dp_frt_inst2_srcf2_vld
       or frt_inst1_fmov_dst_match_inst0
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or dp_frt_inst1_fmov
       or frt_inst0_fmov_dst_rdy
       or inst2_srcf2_read_wb
       or frt_inst2_srcf2_match_inst0
       or frt_inst1_fmov_dst_mla_rdy
       or inst2_srcf2_read_mla_rdy
       or frt_inst0_fmov_dst_mla_rdy
       or inst2_srcf2_read_rdy
       or inst2_srcf2_read_freg[5:0]
       or frt_inst0_fmov_dst_wb
       or frt_inst2_srcf2_match_inst1
       or frt_inst1_fmov_dst_freg[5:0]
       or frt_inst0_fmov_dst_freg[5:0]
       or dp_frt_inst2_fmla
       or frt_inst1_fmov_dst_wb
       or frt_inst0_fmov_bypass_over_inst1)
begin
  if(frt_inst2_srcf2_match_inst1 && dp_frt_inst1_fmov) begin
    frt_dp_inst2_srcf2_data[9]   = frt_inst1_fmov_dst_rdy;
    frt_dp_inst2_srcf2_data[0]   = frt_inst1_fmov_dst_mla_rdy;
    frt_dp_inst2_srcf2_data[1]   = frt_inst1_fmov_dst_wb;
    frt_dp_inst2_srcf2_data[8:2] = {1'b0,frt_inst1_fmov_dst_freg[5:0]};

    frt_dp_inst12_srcf2_match    = 1'b0;
    frt_dp_inst02_srcf2_match    = frt_inst1_fmov_dst_match_inst0;
  end
  else if(frt_inst2_srcf2_match_inst1) begin
    frt_dp_inst2_srcf2_data[9]   = 1'b0;
    frt_dp_inst2_srcf2_data[0]   = 1'b0;
    frt_dp_inst2_srcf2_data[1]   = 1'b0;
    frt_dp_inst2_srcf2_data[8:2] = {1'b0,dp_frt_inst1_dst_freg[5:0]};

    frt_dp_inst12_srcf2_match    = 1'b1;
    frt_dp_inst02_srcf2_match    = 1'b0;
  end
  else if(frt_inst2_srcf2_match_inst0 && frt_inst0_fmov_bypass_over_inst1) begin
    frt_dp_inst2_srcf2_data[9]   = frt_inst0_fmov_dst_rdy;
    frt_dp_inst2_srcf2_data[0]   = frt_inst0_fmov_dst_mla_rdy;
    frt_dp_inst2_srcf2_data[1]   = frt_inst0_fmov_dst_wb;
    frt_dp_inst2_srcf2_data[8:2] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};

    frt_dp_inst12_srcf2_match    = 1'b0;
    frt_dp_inst02_srcf2_match    = 1'b0;
  end
  else if(frt_inst2_srcf2_match_inst0) begin
    frt_dp_inst2_srcf2_data[9]   = 1'b0;
    frt_dp_inst2_srcf2_data[0]   = 1'b0;
    frt_dp_inst2_srcf2_data[1]   = 1'b0;
    frt_dp_inst2_srcf2_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};

    frt_dp_inst12_srcf2_match    = 1'b0;
    frt_dp_inst02_srcf2_match    = 1'b1;
  end
  else begin
    frt_dp_inst2_srcf2_data[9]   = inst2_srcf2_read_rdy
                                   || !dp_frt_inst2_srcf2_vld;
    frt_dp_inst2_srcf2_data[0]   = inst2_srcf2_read_mla_rdy
                                   && dp_frt_inst2_fmla
                                   || !dp_frt_inst2_srcf2_vld;
    frt_dp_inst2_srcf2_data[1]   = inst2_srcf2_read_wb
                                   || !dp_frt_inst2_srcf2_vld;
    frt_dp_inst2_srcf2_data[8:2] = {1'b0,inst2_srcf2_read_freg[5:0]};

    frt_dp_inst12_srcf2_match    = 1'b0;
    frt_dp_inst02_srcf2_match    = 1'b0;
  end
// &CombEnd; @1912
end

//-----------instruction 2 dest reg (for release)-----------
// &CombBeg; @1915
always @( reg_27_read_data[7:2]
       or reg_12_read_data[7:2]
       or reg_25_read_data[7:2]
       or reg_1_read_data[7:2]
       or reg_16_read_data[7:2]
       or reg_10_read_data[7:2]
       or reg_2_read_data[7:2]
       or reg_21_read_data[7:2]
       or reg_20_read_data[7:2]
       or reg_28_read_data[7:2]
       or reg_22_read_data[7:2]
       or reg_11_read_data[7:2]
       or reg_6_read_data[7:2]
       or reg_19_read_data[7:2]
       or reg_26_read_data[7:2]
       or reg_30_read_data[7:2]
       or reg_7_read_data[7:2]
       or reg_31_read_data[7:2]
       or reg_3_read_data[7:2]
       or reg_8_read_data[7:2]
       or reg_0_read_data[7:2]
       or dp_frt_inst2_dstf_reg[5:0]
       or reg_4_read_data[7:2]
       or reg_18_read_data[7:2]
       or reg_9_read_data[7:2]
       or reg_32_read_data[7:2]
       or reg_29_read_data[7:2]
       or reg_23_read_data[7:2]
       or reg_13_read_data[7:2]
       or reg_24_read_data[7:2]
       or reg_5_read_data[7:2]
       or reg_14_read_data[7:2]
       or reg_17_read_data[7:2]
       or reg_15_read_data[7:2])
begin
  case (dp_frt_inst2_dstf_reg[5:0])
    6'd0   : inst2_dstf_read_freg[5:0] = reg_0_read_data[7:2];
    6'd1   : inst2_dstf_read_freg[5:0] = reg_1_read_data[7:2];
    6'd2   : inst2_dstf_read_freg[5:0] = reg_2_read_data[7:2];
    6'd3   : inst2_dstf_read_freg[5:0] = reg_3_read_data[7:2];
    6'd4   : inst2_dstf_read_freg[5:0] = reg_4_read_data[7:2];
    6'd5   : inst2_dstf_read_freg[5:0] = reg_5_read_data[7:2];
    6'd6   : inst2_dstf_read_freg[5:0] = reg_6_read_data[7:2];
    6'd7   : inst2_dstf_read_freg[5:0] = reg_7_read_data[7:2];
    6'd8   : inst2_dstf_read_freg[5:0] = reg_8_read_data[7:2];
    6'd9   : inst2_dstf_read_freg[5:0] = reg_9_read_data[7:2];
    6'd10  : inst2_dstf_read_freg[5:0] = reg_10_read_data[7:2];
    6'd11  : inst2_dstf_read_freg[5:0] = reg_11_read_data[7:2];
    6'd12  : inst2_dstf_read_freg[5:0] = reg_12_read_data[7:2];
    6'd13  : inst2_dstf_read_freg[5:0] = reg_13_read_data[7:2];
    6'd14  : inst2_dstf_read_freg[5:0] = reg_14_read_data[7:2];
    6'd15  : inst2_dstf_read_freg[5:0] = reg_15_read_data[7:2];
    6'd16  : inst2_dstf_read_freg[5:0] = reg_16_read_data[7:2];
    6'd17  : inst2_dstf_read_freg[5:0] = reg_17_read_data[7:2];
    6'd18  : inst2_dstf_read_freg[5:0] = reg_18_read_data[7:2];
    6'd19  : inst2_dstf_read_freg[5:0] = reg_19_read_data[7:2];
    6'd20  : inst2_dstf_read_freg[5:0] = reg_20_read_data[7:2];
    6'd21  : inst2_dstf_read_freg[5:0] = reg_21_read_data[7:2];
    6'd22  : inst2_dstf_read_freg[5:0] = reg_22_read_data[7:2];
    6'd23  : inst2_dstf_read_freg[5:0] = reg_23_read_data[7:2];
    6'd24  : inst2_dstf_read_freg[5:0] = reg_24_read_data[7:2];
    6'd25  : inst2_dstf_read_freg[5:0] = reg_25_read_data[7:2];
    6'd26  : inst2_dstf_read_freg[5:0] = reg_26_read_data[7:2];
    6'd27  : inst2_dstf_read_freg[5:0] = reg_27_read_data[7:2];
    6'd28  : inst2_dstf_read_freg[5:0] = reg_28_read_data[7:2];
    6'd29  : inst2_dstf_read_freg[5:0] = reg_29_read_data[7:2];
    6'd30  : inst2_dstf_read_freg[5:0] = reg_30_read_data[7:2];
    6'd31  : inst2_dstf_read_freg[5:0] = reg_31_read_data[7:2];
    6'd32  : inst2_dstf_read_freg[5:0] = reg_32_read_data[7:2];
    default: inst2_dstf_read_freg[5:0] = {6{1'bx}};
  endcase
// &CombEnd; @1952
end

//source register dependency information may bypass from
//older instruction that are in the same packet
//normal destination should not match split destination
//split destination should not match split/normal destination
assign frt_inst2_dstf_match_inst0 =
            ctrl_rt_inst2_vld && dp_frt_inst2_dstf_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst2_dstf_reg[5:0]);
assign frt_inst2_dstf_match_inst1 =
            ctrl_rt_inst2_vld && dp_frt_inst2_dstf_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && (dp_frt_inst1_dstf_reg[5:0] == dp_frt_inst2_dstf_reg[5:0]);

// &CombBeg; @1967
always @( inst2_dstf_read_freg[5:0]
       or frt_inst2_dstf_match_inst1
       or frt_inst2_dstf_match_inst0
       or dp_frt_inst2_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or dp_frt_inst2_dstf_reg[5])
begin
  if(dp_frt_inst2_dstf_reg[5])
    frt_dp_inst2_rel_freg[6:0] = {1'b0,dp_frt_inst2_dst_freg[5:0]};
  else if(frt_inst2_dstf_match_inst1)
    frt_dp_inst2_rel_freg[6:0] = {1'b0,dp_frt_inst1_dst_freg[5:0]};
  else if(frt_inst2_dstf_match_inst0)
    frt_dp_inst2_rel_freg[6:0] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  else
    frt_dp_inst2_rel_freg[6:0] = {1'b0,inst2_dstf_read_freg[5:0]};
// &CombEnd; @1976
end

//------------instruction 2 dest f (for release)------------
//source register dependency information may bypass from
//older instruction that are in the same packet
assign frt_inst2_dste_match_inst0 =
            ctrl_rt_inst2_vld && dp_frt_inst2_dste_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dste_vld;
assign frt_inst2_dste_match_inst1 =
            ctrl_rt_inst2_vld && dp_frt_inst2_dste_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dste_vld;

// &CombBeg; @1988
always @( dp_frt_inst0_dst_ereg[4:0]
       or reg_e_read_ereg[4:0]
       or dp_frt_inst1_dst_ereg[4:0]
       or frt_inst2_dste_match_inst1
       or frt_inst2_dste_match_inst0)
begin
  if(frt_inst2_dste_match_inst1)
    frt_dp_inst2_rel_ereg[4:0] = dp_frt_inst1_dst_ereg[4:0];
  else if(frt_inst2_dste_match_inst0)
    frt_dp_inst2_rel_ereg[4:0] = dp_frt_inst0_dst_ereg[4:0];
  else
    frt_dp_inst2_rel_ereg[4:0] = reg_e_read_ereg[4:0];
// &CombEnd; @1995
end

//-----------------instruction 3 source 0-------------------
// &CombBeg; @1998
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or dp_frt_inst3_srcf0_reg[5:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst3_srcf0_reg[5:0])
    6'd0   : inst3_srcf0_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst3_srcf0_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst3_srcf0_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst3_srcf0_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst3_srcf0_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst3_srcf0_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst3_srcf0_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst3_srcf0_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst3_srcf0_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst3_srcf0_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst3_srcf0_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst3_srcf0_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst3_srcf0_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst3_srcf0_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst3_srcf0_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst3_srcf0_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst3_srcf0_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst3_srcf0_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst3_srcf0_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst3_srcf0_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst3_srcf0_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst3_srcf0_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst3_srcf0_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst3_srcf0_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst3_srcf0_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst3_srcf0_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst3_srcf0_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst3_srcf0_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst3_srcf0_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst3_srcf0_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst3_srcf0_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst3_srcf0_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst3_srcf0_read_data[12:0] = reg_32_read_data[12:0];
    default: inst3_srcf0_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @2035
end

assign inst3_srcf0_read_rdy       = inst3_srcf0_read_data[0];
assign inst3_srcf0_read_wb        = inst3_srcf0_read_data[1];
assign inst3_srcf0_read_freg[5:0] = inst3_srcf0_read_data[7:2];

//source register dependency information may bypass from
//older instruction that are in the same packet
//the normal source in split instruction with implicit dependency
//should not match split destination
//no implicity dependency across two insts, the split src
//can only adjacent split dest

assign frt_inst3_srcf0_match_inst0 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf0_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst3_srcf0_reg[5:0])
         && !dp_rt_dep_info[DEP_INST03_VREG_MASK];
assign frt_inst3_srcf0_match_inst1 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf0_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && (dp_frt_inst1_dstf_reg[5:0] == dp_frt_inst3_srcf0_reg[5:0])
         && !dp_rt_dep_info[DEP_INST13_VREG_MASK];
assign frt_inst3_srcf0_match_inst2 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf0_vld
         && ctrl_rt_inst2_vld && dp_frt_inst2_dstf_vld
         && (dp_frt_inst2_dstf_reg[5:0] == dp_frt_inst3_srcf0_reg[5:0])
         && !dp_rt_dep_info[DEP_INST23_VREG_MASK];

////if inst2 dest is same with inst0 (mov) srcf0, inst2 may release mov srcf0
////before inst3 src gets mov srcf0 value, so disable mov bypass in this condition
//assign frt_inst0_fmov_bypass_over_inst2 =
//            dp_frt_inst0_fmov
//         && !(dp_frt_inst2_dstf_vld
//             && (dp_frt_inst0_srcf0_reg[5:0] == dp_frt_inst2_dstf_reg[5:0]));
//
////if inst2 dest is same with inst1 (mov) srcf0, inst2 may release mov srcf0
////before inst3 src gets mov srcf0 value, so disable mov bypass in this condition
//assign frt_inst1_fmov_bypass_over_inst2 =
//            dp_frt_inst1_fmov
//         && !(dp_frt_inst2_dstf_vld
//             && (dp_frt_inst1_srcf0_reg[5:0] == dp_frt_inst2_dstf_reg[5:0]));

// &CombBeg; @2078
always @( inst3_srcf0_read_freg[5:0]
       or inst3_srcf0_read_wb
       or dp_frt_inst1_dst_freg[5:0]
       or frt_inst3_srcf0_match_inst1
       or dp_frt_inst0_dst_freg[5:0]
       or frt_inst3_srcf0_match_inst2
       or frt_inst3_srcf0_match_inst0
       or dp_frt_inst3_srcf0_vld
       or frt_inst2_dst_wb
       or frt_inst2_dst_rdy
       or inst3_srcf0_read_rdy
       or frt_inst2_dst_freg[5:0])
begin
  if(frt_inst3_srcf0_match_inst2) begin
    frt_dp_inst3_srcf0_data[0]   = frt_inst2_dst_rdy;
    frt_dp_inst3_srcf0_data[1]   = frt_inst2_dst_wb;
    frt_dp_inst3_srcf0_data[8:2] = {1'b0,frt_inst2_dst_freg[5:0]};
  end
//  else if(frt_inst3_srcf0_match_inst1 && frt_inst1_fmov_bypass_over_inst2) begin
//    frt_dp_inst3_srcf0_data[0]   = frt_inst1_fmov_dst_rdy;
//    frt_dp_inst3_srcf0_data[1]   = frt_inst1_fmov_dst_wb;
//    frt_dp_inst3_srcf0_data[8:2] = {1'b0,frt_inst1_fmov_dst_freg[5:0]};
//  end
  else if(frt_inst3_srcf0_match_inst1) begin
    frt_dp_inst3_srcf0_data[0]   = 1'b0;
    frt_dp_inst3_srcf0_data[1]   = 1'b0;
    frt_dp_inst3_srcf0_data[8:2] = {1'b0,dp_frt_inst1_dst_freg[5:0]};
  end
//  else if(frt_inst3_srcf0_match_inst0 && frt_inst0_fmov_bypass_over_inst1
//                                     && frt_inst0_fmov_bypass_over_inst2) begin
//    frt_dp_inst3_srcf0_data[0]   = frt_inst0_fmov_dst_rdy;
//    frt_dp_inst3_srcf0_data[1]   = frt_inst0_fmov_dst_wb;
//    frt_dp_inst3_srcf0_data[8:2] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};
//  end
  else if(frt_inst3_srcf0_match_inst0) begin
    frt_dp_inst3_srcf0_data[0]   = 1'b0;
    frt_dp_inst3_srcf0_data[1]   = 1'b0;
    frt_dp_inst3_srcf0_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  end
  else begin
    frt_dp_inst3_srcf0_data[0]   = inst3_srcf0_read_rdy
                                   || !dp_frt_inst3_srcf0_vld;
    frt_dp_inst3_srcf0_data[1]   = inst3_srcf0_read_wb
                                   || !dp_frt_inst3_srcf0_vld;
    frt_dp_inst3_srcf0_data[8:2] = {1'b0,inst3_srcf0_read_freg[5:0]};
  end
// &CombEnd; @2112
end

//-----------------instruction 3 source 1-------------------
// &CombBeg; @2115
always @( dp_frt_inst3_srcf1_reg[5:0]
       or reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst3_srcf1_reg[5:0])
    6'd0   : inst3_srcf1_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst3_srcf1_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst3_srcf1_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst3_srcf1_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst3_srcf1_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst3_srcf1_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst3_srcf1_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst3_srcf1_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst3_srcf1_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst3_srcf1_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst3_srcf1_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst3_srcf1_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst3_srcf1_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst3_srcf1_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst3_srcf1_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst3_srcf1_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst3_srcf1_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst3_srcf1_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst3_srcf1_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst3_srcf1_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst3_srcf1_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst3_srcf1_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst3_srcf1_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst3_srcf1_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst3_srcf1_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst3_srcf1_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst3_srcf1_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst3_srcf1_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst3_srcf1_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst3_srcf1_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst3_srcf1_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst3_srcf1_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst3_srcf1_read_data[12:0] = reg_32_read_data[12:0];
    default: inst3_srcf1_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @2152
end

assign inst3_srcf1_read_rdy       = inst3_srcf1_read_data[0];
assign inst3_srcf1_read_wb        = inst3_srcf1_read_data[1];
assign inst3_srcf1_read_freg[5:0] = inst3_srcf1_read_data[7:2];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
assign frt_inst3_srcf1_match_inst0 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf1_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst3_srcf1_reg[5:0])
         && !dp_rt_dep_info[DEP_INST03_VREG_MASK];
assign frt_inst3_srcf1_match_inst1 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf1_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && (dp_frt_inst1_dstf_reg[5:0] == dp_frt_inst3_srcf1_reg[5:0])
         && !dp_rt_dep_info[DEP_INST13_VREG_MASK];
assign frt_inst3_srcf1_match_inst2 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf1_vld
         && ctrl_rt_inst2_vld && dp_frt_inst2_dstf_vld
         && (dp_frt_inst2_dstf_reg[5:0] == dp_frt_inst3_srcf1_reg[5:0])
         && !(dp_rt_dep_info[DEP_INST23_VREG_MASK]
           || dp_rt_dep_info[DEP_INST23_SRCV1_MASK]);

// &CombBeg; @2178
always @( inst3_srcf1_read_freg[5:0]
       or inst3_srcf1_read_rdy
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or frt_inst3_srcf1_match_inst0
       or dp_frt_inst3_srcf1_vld
       or frt_inst3_srcf1_match_inst2
       or inst3_srcf1_read_wb
       or frt_inst3_srcf1_match_inst1
       or frt_inst2_dst_wb
       or frt_inst2_dst_rdy
       or frt_inst2_dst_freg[5:0])
begin
  if(frt_inst3_srcf1_match_inst2) begin
    frt_dp_inst3_srcf1_data[0]   = frt_inst2_dst_rdy;
    frt_dp_inst3_srcf1_data[1]   = frt_inst2_dst_wb;
    frt_dp_inst3_srcf1_data[8:2] = {1'b0,frt_inst2_dst_freg[5:0]};
  end
//  else if(frt_inst3_srcf1_match_inst1 && frt_inst1_fmov_bypass_over_inst2) begin
//    frt_dp_inst3_srcf1_data[0]   = frt_inst1_fmov_dst_rdy;
//    frt_dp_inst3_srcf1_data[1]   = frt_inst1_fmov_dst_wb;
//    frt_dp_inst3_srcf1_data[8:2] = {1'b0,frt_inst1_fmov_dst_freg[5:0]};
//  end
  else if(frt_inst3_srcf1_match_inst1) begin
    frt_dp_inst3_srcf1_data[0]   = 1'b0;
    frt_dp_inst3_srcf1_data[1]   = 1'b0;
    frt_dp_inst3_srcf1_data[8:2] = {1'b0,dp_frt_inst1_dst_freg[5:0]};
  end
//  else if(frt_inst3_srcf1_match_inst0 && frt_inst0_fmov_bypass_over_inst1
//                                     && frt_inst0_fmov_bypass_over_inst2) begin
//    frt_dp_inst3_srcf1_data[0]   = frt_inst0_fmov_dst_rdy;
//    frt_dp_inst3_srcf1_data[1]   = frt_inst0_fmov_dst_wb;
//    frt_dp_inst3_srcf1_data[8:2] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};
//  end
  else if(frt_inst3_srcf1_match_inst0) begin
    frt_dp_inst3_srcf1_data[0]   = 1'b0;
    frt_dp_inst3_srcf1_data[1]   = 1'b0;
    frt_dp_inst3_srcf1_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  end
  else begin
    frt_dp_inst3_srcf1_data[0]   = inst3_srcf1_read_rdy
                                   || !dp_frt_inst3_srcf1_vld;
    frt_dp_inst3_srcf1_data[1]   = inst3_srcf1_read_wb
                                   || !dp_frt_inst3_srcf1_vld;
    frt_dp_inst3_srcf1_data[8:2] = {1'b0,inst3_srcf1_read_freg[5:0]};
  end
// &CombEnd; @2212
end

//-----------------instruction 3 source 2-------------------
// &CombBeg; @2215
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or dp_frt_inst3_srcf2_reg[5:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst3_srcf2_reg[5:0])
    6'd0   : inst3_srcf2_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst3_srcf2_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst3_srcf2_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst3_srcf2_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst3_srcf2_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst3_srcf2_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst3_srcf2_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst3_srcf2_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst3_srcf2_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst3_srcf2_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst3_srcf2_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst3_srcf2_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst3_srcf2_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst3_srcf2_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst3_srcf2_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst3_srcf2_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst3_srcf2_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst3_srcf2_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst3_srcf2_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst3_srcf2_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst3_srcf2_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst3_srcf2_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst3_srcf2_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst3_srcf2_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst3_srcf2_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst3_srcf2_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst3_srcf2_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst3_srcf2_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst3_srcf2_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst3_srcf2_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst3_srcf2_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst3_srcf2_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst3_srcf2_read_data[12:0] = reg_32_read_data[12:0];
    default: inst3_srcf2_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @2252
end

assign inst3_srcf2_read_rdy       = inst3_srcf2_read_data[0];
assign inst3_srcf2_read_wb        = inst3_srcf2_read_data[1];
assign inst3_srcf2_read_freg[5:0] = inst3_srcf2_read_data[7:2];
assign inst3_srcf2_read_mla_rdy   = inst3_srcf2_read_data[9];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
assign frt_inst3_srcf2_match_inst0 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf2_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst3_srcf2_reg[5:0])
         && !dp_rt_dep_info[DEP_INST03_VREG_MASK];
assign frt_inst3_srcf2_match_inst1 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf2_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && (dp_frt_inst1_dstf_reg[5:0] == dp_frt_inst3_srcf2_reg[5:0])
         && !dp_rt_dep_info[DEP_INST13_VREG_MASK];
assign frt_inst3_srcf2_match_inst2 =
            ctrl_rt_inst3_vld && dp_frt_inst3_srcf2_vld
         && ctrl_rt_inst2_vld && dp_frt_inst2_dstf_vld
         && (dp_frt_inst2_dstf_reg[5:0] == dp_frt_inst3_srcf2_reg[5:0])
         && !dp_rt_dep_info[DEP_INST23_VREG_MASK];

// &CombBeg; @2278
always @( frt_inst3_srcf2_match_inst1
       or frt_inst2_dst_mla_rdy
       or dp_frt_inst1_dst_freg[5:0]
       or dp_frt_inst0_dst_freg[5:0]
       or frt_inst3_srcf2_match_inst0
       or dp_frt_inst3_srcf2_vld
       or inst3_srcf2_read_rdy
       or frt_inst2_fmov_match_inst1
       or frt_inst3_srcf2_match_inst2
       or inst3_srcf2_read_wb
       or inst3_srcf2_read_mla_rdy
       or dp_frt_inst3_fmla
       or frt_inst2_fmov_match_inst0
       or frt_inst2_fmov_match_inst2
       or frt_inst2_dst_rdy
       or frt_inst2_dst_wb
       or inst3_srcf2_read_freg[5:0]
       or frt_inst2_dst_freg[5:0])
begin
  if(frt_inst3_srcf2_match_inst2) begin
    frt_dp_inst3_srcf2_data[9]   = frt_inst2_dst_rdy;
    frt_dp_inst3_srcf2_data[0]   = frt_inst2_dst_mla_rdy;
    frt_dp_inst3_srcf2_data[1]   = frt_inst2_dst_wb;
    frt_dp_inst3_srcf2_data[8:2] = {1'b0,frt_inst2_dst_freg[5:0]};

    frt_dp_inst23_srcf2_match    = frt_inst2_fmov_match_inst2;
    frt_dp_inst13_srcf2_match    = frt_inst2_fmov_match_inst1;
    frt_dp_inst03_srcf2_match    = frt_inst2_fmov_match_inst0;
  end
//  else if(frt_inst3_srcf2_match_inst1 && frt_inst1_fmov_bypass_over_inst2) begin
//    frt_dp_inst3_srcf2_data[9]   = frt_inst1_fmov_dst_rdy;
//    frt_dp_inst3_srcf2_data[0]   = frt_inst1_fmov_dst_mla_rdy;
//    frt_dp_inst3_srcf2_data[1]   = frt_inst1_fmov_dst_wb;
//    frt_dp_inst3_srcf2_data[5:0] = {1'b0,frt_inst1_fmov_dst_freg[5:0]};
//  end
  else if(frt_inst3_srcf2_match_inst1) begin
    frt_dp_inst3_srcf2_data[9]   = 1'b0;
    frt_dp_inst3_srcf2_data[0]   = 1'b0;
    frt_dp_inst3_srcf2_data[1]   = 1'b0;
    frt_dp_inst3_srcf2_data[8:2] = {1'b0,dp_frt_inst1_dst_freg[5:0]};

    frt_dp_inst23_srcf2_match    = 1'b0;
    frt_dp_inst13_srcf2_match    = 1'b1;
    frt_dp_inst03_srcf2_match    = 1'b0;
  end
//  else if(frt_inst3_srcf2_match_inst0 && frt_inst0_fmov_bypass_over_inst1
//                                     && frt_inst0_fmov_bypass_over_inst2) begin
//    frt_dp_inst3_srcf2_data[9]   = frt_inst0_fmov_dst_rdy;
//    frt_dp_inst3_srcf2_data[0]   = frt_inst0_fmov_dst_mla_rdy;
//    frt_dp_inst3_srcf2_data[1]   = frt_inst0_fmov_dst_wb;
//    frt_dp_inst3_srcf2_data[5:0] = {1'b0,frt_inst0_fmov_dst_freg[5:0]};
//  end
  else if(frt_inst3_srcf2_match_inst0) begin
    frt_dp_inst3_srcf2_data[9]   = 1'b0;
    frt_dp_inst3_srcf2_data[0]   = 1'b0;
    frt_dp_inst3_srcf2_data[1]   = 1'b0;
    frt_dp_inst3_srcf2_data[8:2] = {1'b0,dp_frt_inst0_dst_freg[5:0]};

    frt_dp_inst23_srcf2_match    = 1'b0;
    frt_dp_inst13_srcf2_match    = 1'b0;
    frt_dp_inst03_srcf2_match    = 1'b1;
  end
  else begin
    frt_dp_inst3_srcf2_data[9]   = inst3_srcf2_read_rdy
                                   || !dp_frt_inst3_srcf2_vld;
    frt_dp_inst3_srcf2_data[0]   = inst3_srcf2_read_mla_rdy
                                   && dp_frt_inst3_fmla
                                   || !dp_frt_inst3_srcf2_vld;
    frt_dp_inst3_srcf2_data[1]   = inst3_srcf2_read_wb
                                   || !dp_frt_inst3_srcf2_vld;
    frt_dp_inst3_srcf2_data[8:2] = {1'b0,inst3_srcf2_read_freg[5:0]};

    frt_dp_inst23_srcf2_match    = 1'b0;
    frt_dp_inst13_srcf2_match    = 1'b0;
    frt_dp_inst03_srcf2_match    = 1'b0;
  end
// &CombEnd; @2336
end

//-----------instruction 3 dest reg (for release)-----------
// &CombBeg; @2339
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or reg_2_read_data[12:0]
       or reg_0_read_data[12:0]
       or reg_25_read_data[12:0]
       or dp_frt_inst3_dstf_reg[5:0]
       or reg_10_read_data[12:0]
       or reg_8_read_data[12:0]
       or reg_14_read_data[12:0]
       or reg_6_read_data[12:0]
       or reg_30_read_data[12:0]
       or reg_26_read_data[12:0]
       or reg_27_read_data[12:0]
       or reg_16_read_data[12:0]
       or reg_29_read_data[12:0]
       or reg_12_read_data[12:0]
       or reg_31_read_data[12:0]
       or reg_4_read_data[12:0]
       or reg_23_read_data[12:0]
       or reg_9_read_data[12:0]
       or reg_24_read_data[12:0]
       or reg_7_read_data[12:0]
       or reg_1_read_data[12:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_frt_inst3_dstf_reg[5:0])
    6'd0   : inst3_dstf_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst3_dstf_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst3_dstf_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst3_dstf_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst3_dstf_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst3_dstf_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst3_dstf_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst3_dstf_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst3_dstf_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst3_dstf_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst3_dstf_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst3_dstf_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst3_dstf_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst3_dstf_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst3_dstf_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst3_dstf_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst3_dstf_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst3_dstf_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst3_dstf_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst3_dstf_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst3_dstf_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst3_dstf_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst3_dstf_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst3_dstf_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst3_dstf_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst3_dstf_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst3_dstf_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst3_dstf_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst3_dstf_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst3_dstf_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst3_dstf_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst3_dstf_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst3_dstf_read_data[12:0] = reg_32_read_data[12:0];
    default: inst3_dstf_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @2376
end

assign inst3_dstf_read_freg[5:0] = inst3_dstf_read_data[7:2];

//source register dependency information may bypass from
//older instruction that are in the same packet
//normal destination should not match split destination
//inst3 cannot be split dst
assign frt_inst3_dstf_match_inst0 =
            ctrl_rt_inst3_vld && dp_frt_inst3_dstf_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dstf_vld
         && (dp_frt_inst0_dstf_reg[5:0] == dp_frt_inst3_dstf_reg[5:0]);
assign frt_inst3_dstf_match_inst1 =
            ctrl_rt_inst3_vld && dp_frt_inst3_dstf_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dstf_vld
         && (dp_frt_inst1_dstf_reg[5:0] == dp_frt_inst3_dstf_reg[5:0]);
assign frt_inst3_dstf_match_inst2 =
            ctrl_rt_inst3_vld && dp_frt_inst3_dstf_vld
         && ctrl_rt_inst2_vld && dp_frt_inst2_dstf_vld
         && (dp_frt_inst2_dstf_reg[5:0] == dp_frt_inst3_dstf_reg[5:0]);

// &CombBeg; @2397
always @( frt_inst3_dstf_match_inst2
       or dp_frt_inst3_dstf_reg[5]
       or dp_frt_inst2_dst_freg[5:0]
       or dp_frt_inst1_dst_freg[5:0]
       or frt_inst3_dstf_match_inst0
       or dp_frt_inst0_dst_freg[5:0]
       or frt_inst3_dstf_match_inst1
       or dp_frt_inst3_dst_freg[5:0]
       or inst3_dstf_read_freg[5:0])
begin
  if(dp_frt_inst3_dstf_reg[5])
    frt_dp_inst3_rel_freg[6:0] = {1'b0,dp_frt_inst3_dst_freg[5:0]};
  else if(frt_inst3_dstf_match_inst2)
    frt_dp_inst3_rel_freg[6:0] = {1'b0,dp_frt_inst2_dst_freg[5:0]};
  else if(frt_inst3_dstf_match_inst1)
    frt_dp_inst3_rel_freg[6:0] = {1'b0,dp_frt_inst1_dst_freg[5:0]};
  else if(frt_inst3_dstf_match_inst0)
    frt_dp_inst3_rel_freg[6:0] = {1'b0,dp_frt_inst0_dst_freg[5:0]};
  else
    frt_dp_inst3_rel_freg[6:0] = {1'b0,inst3_dstf_read_freg[5:0]};
// &CombEnd; @2408
end

//------------instruction 3 dest f (for release)------------
//source register dependency information may bypass from
//older instruction that are in the same packet
assign frt_inst3_dste_match_inst0 =
            ctrl_rt_inst3_vld && dp_frt_inst3_dste_vld
         && ctrl_rt_inst0_vld && dp_frt_inst0_dste_vld;
assign frt_inst3_dste_match_inst1 =
            ctrl_rt_inst3_vld && dp_frt_inst3_dste_vld
         && ctrl_rt_inst1_vld && dp_frt_inst1_dste_vld;
assign frt_inst3_dste_match_inst2 =
            ctrl_rt_inst3_vld && dp_frt_inst3_dste_vld
         && ctrl_rt_inst2_vld && dp_frt_inst2_dste_vld;

// &CombBeg; @2423
always @( frt_inst3_dste_match_inst0
       or frt_inst3_dste_match_inst2
       or frt_inst3_dste_match_inst1
       or dp_frt_inst0_dst_ereg[4:0]
       or reg_e_read_ereg[4:0]
       or dp_frt_inst1_dst_ereg[4:0]
       or dp_frt_inst2_dst_ereg[4:0])
begin
  if(frt_inst3_dste_match_inst2)
    frt_dp_inst3_rel_ereg[4:0] = dp_frt_inst2_dst_ereg[4:0];
  else if(frt_inst3_dste_match_inst1)
    frt_dp_inst3_rel_ereg[4:0] = dp_frt_inst1_dst_ereg[4:0];
  else if(frt_inst3_dste_match_inst0)
    frt_dp_inst3_rel_ereg[4:0] = dp_frt_inst0_dst_ereg[4:0];
  else
    frt_dp_inst3_rel_ereg[4:0] = reg_e_read_ereg[4:0];
// &CombEnd; @2432
end

// &ModuleEnd; @2434
endmodule


