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
module ct_idu_ir_rt(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ir_stall,
  ctrl_rt_inst0_vld,
  ctrl_rt_inst1_vld,
  ctrl_rt_inst2_vld,
  ctrl_rt_inst3_vld,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
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
  dp_xx_rf_pipe0_dst_preg_dupx,
  dp_xx_rf_pipe1_dst_preg_dupx,
  forever_cpuclk,
  ifu_xx_sync_reset,
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_vld_dupx,
  iu_idu_ex2_pipe1_mult_inst_vld_dupx,
  iu_idu_ex2_pipe1_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_vld_dupx,
  lsu_idu_ag_pipe3_load_inst_vld,
  lsu_idu_ag_pipe3_preg_dupx,
  lsu_idu_dc_pipe3_load_inst_vld_dupx,
  lsu_idu_dc_pipe3_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_vld_dupx,
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
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_idu_rt_recover_preg,
  rtu_yy_xx_flush,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx
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
input            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [16 :0]  dp_rt_dep_info;                         
input   [6  :0]  dp_rt_inst0_dst_preg;                   
input   [5  :0]  dp_rt_inst0_dst_reg;                    
input            dp_rt_inst0_dst_vld;                    
input            dp_rt_inst0_mla;                        
input            dp_rt_inst0_mov;                        
input   [5  :0]  dp_rt_inst0_src0_reg;                   
input            dp_rt_inst0_src0_vld;                   
input   [5  :0]  dp_rt_inst0_src1_reg;                   
input            dp_rt_inst0_src1_vld;                   
input            dp_rt_inst0_src2_vld;                   
input   [6  :0]  dp_rt_inst1_dst_preg;                   
input   [5  :0]  dp_rt_inst1_dst_reg;                    
input            dp_rt_inst1_dst_vld;                    
input            dp_rt_inst1_mla;                        
input            dp_rt_inst1_mov;                        
input   [5  :0]  dp_rt_inst1_src0_reg;                   
input            dp_rt_inst1_src0_vld;                   
input   [5  :0]  dp_rt_inst1_src1_reg;                   
input            dp_rt_inst1_src1_vld;                   
input            dp_rt_inst1_src2_vld;                   
input   [6  :0]  dp_rt_inst2_dst_preg;                   
input   [5  :0]  dp_rt_inst2_dst_reg;                    
input            dp_rt_inst2_dst_vld;                    
input            dp_rt_inst2_mla;                        
input            dp_rt_inst2_mov;                        
input   [5  :0]  dp_rt_inst2_src0_reg;                   
input            dp_rt_inst2_src0_vld;                   
input   [5  :0]  dp_rt_inst2_src1_reg;                   
input            dp_rt_inst2_src1_vld;                   
input            dp_rt_inst2_src2_vld;                   
input   [6  :0]  dp_rt_inst3_dst_preg;                   
input   [5  :0]  dp_rt_inst3_dst_reg;                    
input            dp_rt_inst3_dst_vld;                    
input            dp_rt_inst3_mla;                        
input   [5  :0]  dp_rt_inst3_src0_reg;                   
input            dp_rt_inst3_src0_vld;                   
input   [5  :0]  dp_rt_inst3_src1_reg;                   
input            dp_rt_inst3_src1_vld;                   
input            dp_rt_inst3_src2_vld;                   
input   [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
input   [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
input            forever_cpuclk;                         
input            ifu_xx_sync_reset;                      
input            iu_idu_div_inst_vld;                    
input   [6  :0]  iu_idu_div_preg_dupx;                   
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
input            iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
input            iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
input   [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
input            iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
input            lsu_idu_ag_pipe3_load_inst_vld;         
input   [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
input            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input            pad_yy_icg_scan_en;                     
input            rtu_idu_flush_fe;                       
input            rtu_idu_flush_is;                       
input   [223:0]  rtu_idu_rt_recover_preg;                
input            rtu_yy_xx_flush;                        
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
output  [2  :0]  rt_dp_inst01_src_match;                 
output  [2  :0]  rt_dp_inst02_src_match;                 
output  [2  :0]  rt_dp_inst03_src_match;                 
output  [6  :0]  rt_dp_inst0_rel_preg;                   
output  [8  :0]  rt_dp_inst0_src0_data;                  
output  [8  :0]  rt_dp_inst0_src1_data;                  
output  [9  :0]  rt_dp_inst0_src2_data;                  
output  [2  :0]  rt_dp_inst12_src_match;                 
output  [2  :0]  rt_dp_inst13_src_match;                 
output  [6  :0]  rt_dp_inst1_rel_preg;                   
output  [8  :0]  rt_dp_inst1_src0_data;                  
output  [8  :0]  rt_dp_inst1_src1_data;                  
output  [9  :0]  rt_dp_inst1_src2_data;                  
output  [2  :0]  rt_dp_inst23_src_match;                 
output  [6  :0]  rt_dp_inst2_rel_preg;                   
output  [8  :0]  rt_dp_inst2_src0_data;                  
output  [8  :0]  rt_dp_inst2_src1_data;                  
output  [9  :0]  rt_dp_inst2_src2_data;                  
output  [6  :0]  rt_dp_inst3_rel_preg;                   
output  [8  :0]  rt_dp_inst3_src0_data;                  
output  [8  :0]  rt_dp_inst3_src1_data;                  
output  [9  :0]  rt_dp_inst3_src2_data;                  

// &Regs; @27
reg     [12 :0]  inst0_dst_read_data;                    
reg     [12 :0]  inst0_src0_read_data;                   
reg     [12 :0]  inst0_src1_read_data;                   
reg     [12 :0]  inst1_dst_read_data;                    
reg     [12 :0]  inst1_src0_read_data;                   
reg     [12 :0]  inst1_src1_read_data;                   
reg     [12 :0]  inst2_dst_read_data;                    
reg     [12 :0]  inst2_src0_read_data;                   
reg     [12 :0]  inst2_src1_read_data;                   
reg     [12 :0]  inst3_dst_read_data;                    
reg     [12 :0]  inst3_src0_read_data;                   
reg     [12 :0]  inst3_src1_read_data;                   
reg     [6  :0]  reg_0_create_preg;                      
reg     [6  :0]  reg_10_create_preg;                     
reg     [6  :0]  reg_11_create_preg;                     
reg     [6  :0]  reg_12_create_preg;                     
reg     [6  :0]  reg_13_create_preg;                     
reg     [6  :0]  reg_14_create_preg;                     
reg     [6  :0]  reg_15_create_preg;                     
reg     [6  :0]  reg_16_create_preg;                     
reg     [6  :0]  reg_17_create_preg;                     
reg     [6  :0]  reg_18_create_preg;                     
reg     [6  :0]  reg_19_create_preg;                     
reg     [6  :0]  reg_1_create_preg;                      
reg     [6  :0]  reg_20_create_preg;                     
reg     [6  :0]  reg_21_create_preg;                     
reg     [6  :0]  reg_22_create_preg;                     
reg     [6  :0]  reg_23_create_preg;                     
reg     [6  :0]  reg_24_create_preg;                     
reg     [6  :0]  reg_25_create_preg;                     
reg     [6  :0]  reg_26_create_preg;                     
reg     [6  :0]  reg_27_create_preg;                     
reg     [6  :0]  reg_28_create_preg;                     
reg     [6  :0]  reg_29_create_preg;                     
reg     [6  :0]  reg_2_create_preg;                      
reg     [6  :0]  reg_30_create_preg;                     
reg     [6  :0]  reg_31_create_preg;                     
reg     [6  :0]  reg_32_create_preg;                     
reg     [6  :0]  reg_3_create_preg;                      
reg     [6  :0]  reg_4_create_preg;                      
reg     [6  :0]  reg_5_create_preg;                      
reg     [6  :0]  reg_6_create_preg;                      
reg     [6  :0]  reg_7_create_preg;                      
reg     [6  :0]  reg_8_create_preg;                      
reg     [6  :0]  reg_9_create_preg;                      
reg     [2  :0]  rt_dp_inst01_src_match;                 
reg     [2  :0]  rt_dp_inst02_src_match;                 
reg     [2  :0]  rt_dp_inst03_src_match;                 
reg     [2  :0]  rt_dp_inst12_src_match;                 
reg     [2  :0]  rt_dp_inst13_src_match;                 
reg     [6  :0]  rt_dp_inst1_rel_preg;                   
reg     [8  :0]  rt_dp_inst1_src0_data;                  
reg     [8  :0]  rt_dp_inst1_src1_data;                  
reg     [9  :0]  rt_dp_inst1_src2_data;                  
reg     [2  :0]  rt_dp_inst23_src_match;                 
reg     [6  :0]  rt_dp_inst2_rel_preg;                   
reg     [8  :0]  rt_dp_inst2_src0_data;                  
reg     [8  :0]  rt_dp_inst2_src1_data;                  
reg     [9  :0]  rt_dp_inst2_src2_data;                  
reg     [6  :0]  rt_dp_inst3_rel_preg;                   
reg     [8  :0]  rt_dp_inst3_src0_data;                  
reg     [8  :0]  rt_dp_inst3_src1_data;                  
reg     [9  :0]  rt_dp_inst3_src2_data;                  
reg              rt_inst1_mov_dst_match_inst0;           
reg              rt_inst1_mov_dst_mla_rdy;               
reg     [6  :0]  rt_inst1_mov_dst_preg;                  
reg              rt_inst1_mov_dst_rdy;                   
reg              rt_inst1_mov_dst_wb;                    
reg              rt_inst2_dst_mla_rdy;                   
reg     [6  :0]  rt_inst2_dst_preg;                      
reg              rt_inst2_dst_rdy;                       
reg              rt_inst2_dst_wb;                        
reg              rt_inst2_mov_match_inst0;               
reg              rt_inst2_mov_match_inst1;               
reg              rt_inst2_mov_match_inst2;               

// &Wires; @28
wire             alu0_reg_fwd_vld;                       
wire             alu1_reg_fwd_vld;                       
wire             cp0_idu_icg_en;                         
wire             cp0_yy_clk_en;                          
wire             cpurst_b;                               
wire             ctrl_ir_stall;                          
wire             ctrl_rt_inst0_vld;                      
wire             ctrl_rt_inst1_vld;                      
wire             ctrl_rt_inst2_vld;                      
wire             ctrl_rt_inst3_vld;                      
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire    [16 :0]  dp_rt_dep_info;                         
wire    [6  :0]  dp_rt_inst0_dst_preg;                   
wire    [5  :0]  dp_rt_inst0_dst_reg;                    
wire    [4  :0]  dp_rt_inst0_dst_reg_lsb;                
wire    [31 :0]  dp_rt_inst0_dst_reg_lsb_expand;         
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
wire    [4  :0]  dp_rt_inst1_dst_reg_lsb;                
wire    [31 :0]  dp_rt_inst1_dst_reg_lsb_expand;         
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
wire    [4  :0]  dp_rt_inst2_dst_reg_lsb;                
wire    [31 :0]  dp_rt_inst2_dst_reg_lsb_expand;         
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
wire    [4  :0]  dp_rt_inst3_dst_reg_lsb;                
wire    [31 :0]  dp_rt_inst3_dst_reg_lsb_expand;         
wire             dp_rt_inst3_dst_vld;                    
wire             dp_rt_inst3_mla;                        
wire    [5  :0]  dp_rt_inst3_src0_reg;                   
wire             dp_rt_inst3_src0_vld;                   
wire    [5  :0]  dp_rt_inst3_src1_reg;                   
wire             dp_rt_inst3_src1_vld;                   
wire             dp_rt_inst3_src2_vld;                   
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire             forever_cpuclk;                         
wire             gateclk_entry_vld;                      
wire             ifu_xx_sync_reset;                      
wire             inst0_gateclk_write_en;                 
wire             inst0_src0_read_mla_rdy;                
wire    [6  :0]  inst0_src0_read_preg;                   
wire             inst0_src0_read_rdy;                    
wire             inst0_src0_read_wb;                     
wire    [6  :0]  inst0_src1_read_preg;                   
wire             inst0_src1_read_rdy;                    
wire             inst0_src1_read_wb;                     
wire             inst0_src2_read_mla_rdy;                
wire    [6  :0]  inst0_src2_read_preg;                   
wire             inst0_src2_read_rdy;                    
wire             inst0_src2_read_wb;                     
wire             inst0_write_en;                         
wire             inst1_gateclk_write_en;                 
wire             inst1_src0_read_mla_rdy;                
wire    [6  :0]  inst1_src0_read_preg;                   
wire             inst1_src0_read_rdy;                    
wire             inst1_src0_read_wb;                     
wire    [6  :0]  inst1_src1_read_preg;                   
wire             inst1_src1_read_rdy;                    
wire             inst1_src1_read_wb;                     
wire             inst1_src2_read_mla_rdy;                
wire    [6  :0]  inst1_src2_read_preg;                   
wire             inst1_src2_read_rdy;                    
wire             inst1_src2_read_wb;                     
wire             inst1_write_en;                         
wire             inst2_gateclk_write_en;                 
wire             inst2_src0_read_mla_rdy;                
wire    [6  :0]  inst2_src0_read_preg;                   
wire             inst2_src0_read_rdy;                    
wire             inst2_src0_read_wb;                     
wire    [6  :0]  inst2_src1_read_preg;                   
wire             inst2_src1_read_rdy;                    
wire             inst2_src1_read_wb;                     
wire             inst2_src2_read_mla_rdy;                
wire    [6  :0]  inst2_src2_read_preg;                   
wire             inst2_src2_read_rdy;                    
wire             inst2_src2_read_wb;                     
wire             inst2_write_en;                         
wire             inst3_gateclk_write_en;                 
wire    [6  :0]  inst3_src0_read_preg;                   
wire             inst3_src0_read_rdy;                    
wire             inst3_src0_read_wb;                     
wire    [6  :0]  inst3_src1_read_preg;                   
wire             inst3_src1_read_rdy;                    
wire             inst3_src1_read_wb;                     
wire             inst3_src2_read_mla_rdy;                
wire    [6  :0]  inst3_src2_read_preg;                   
wire             inst3_src2_read_rdy;                    
wire             inst3_src2_read_wb;                     
wire             inst3_write_en;                         
wire             iu_idu_div_inst_vld;                    
wire    [6  :0]  iu_idu_div_preg_dupx;                   
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire             iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire             iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire             iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire             lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire             lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire             lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire             mla_reg_fwd_vld;                        
wire             pad_yy_icg_scan_en;                     
wire             r_vld;                                  
wire    [10 :0]  reg_0_create_data;                      
wire             reg_0_entry_mla;                        
wire             reg_0_gateclk_idx_write_en;             
wire             reg_0_gateclk_write_en;                 
wire             reg_0_rdy_clr;                          
wire    [12 :0]  reg_0_read_data;                        
wire             reg_0_write_en;                         
wire    [10 :0]  reg_10_create_data;                     
wire             reg_10_entry_mla;                       
wire             reg_10_gateclk_idx_write_en;            
wire             reg_10_gateclk_write_en;                
wire             reg_10_rdy_clr;                         
wire    [12 :0]  reg_10_read_data;                       
wire             reg_10_write_en;                        
wire    [10 :0]  reg_11_create_data;                     
wire             reg_11_entry_mla;                       
wire             reg_11_gateclk_idx_write_en;            
wire             reg_11_gateclk_write_en;                
wire             reg_11_rdy_clr;                         
wire    [12 :0]  reg_11_read_data;                       
wire             reg_11_write_en;                        
wire    [10 :0]  reg_12_create_data;                     
wire             reg_12_entry_mla;                       
wire             reg_12_gateclk_idx_write_en;            
wire             reg_12_gateclk_write_en;                
wire             reg_12_rdy_clr;                         
wire    [12 :0]  reg_12_read_data;                       
wire             reg_12_write_en;                        
wire    [10 :0]  reg_13_create_data;                     
wire             reg_13_entry_mla;                       
wire             reg_13_gateclk_idx_write_en;            
wire             reg_13_gateclk_write_en;                
wire             reg_13_rdy_clr;                         
wire    [12 :0]  reg_13_read_data;                       
wire             reg_13_write_en;                        
wire    [10 :0]  reg_14_create_data;                     
wire             reg_14_entry_mla;                       
wire             reg_14_gateclk_idx_write_en;            
wire             reg_14_gateclk_write_en;                
wire             reg_14_rdy_clr;                         
wire    [12 :0]  reg_14_read_data;                       
wire             reg_14_write_en;                        
wire    [10 :0]  reg_15_create_data;                     
wire             reg_15_entry_mla;                       
wire             reg_15_gateclk_idx_write_en;            
wire             reg_15_gateclk_write_en;                
wire             reg_15_rdy_clr;                         
wire    [12 :0]  reg_15_read_data;                       
wire             reg_15_write_en;                        
wire    [10 :0]  reg_16_create_data;                     
wire             reg_16_entry_mla;                       
wire             reg_16_gateclk_idx_write_en;            
wire             reg_16_gateclk_write_en;                
wire             reg_16_rdy_clr;                         
wire    [12 :0]  reg_16_read_data;                       
wire             reg_16_write_en;                        
wire    [10 :0]  reg_17_create_data;                     
wire             reg_17_entry_mla;                       
wire             reg_17_gateclk_idx_write_en;            
wire             reg_17_gateclk_write_en;                
wire             reg_17_rdy_clr;                         
wire    [12 :0]  reg_17_read_data;                       
wire             reg_17_write_en;                        
wire    [10 :0]  reg_18_create_data;                     
wire             reg_18_entry_mla;                       
wire             reg_18_gateclk_idx_write_en;            
wire             reg_18_gateclk_write_en;                
wire             reg_18_rdy_clr;                         
wire    [12 :0]  reg_18_read_data;                       
wire             reg_18_write_en;                        
wire    [10 :0]  reg_19_create_data;                     
wire             reg_19_entry_mla;                       
wire             reg_19_gateclk_idx_write_en;            
wire             reg_19_gateclk_write_en;                
wire             reg_19_rdy_clr;                         
wire    [12 :0]  reg_19_read_data;                       
wire             reg_19_write_en;                        
wire    [10 :0]  reg_1_create_data;                      
wire             reg_1_entry_mla;                        
wire             reg_1_gateclk_idx_write_en;             
wire             reg_1_gateclk_write_en;                 
wire             reg_1_rdy_clr;                          
wire    [12 :0]  reg_1_read_data;                        
wire             reg_1_write_en;                         
wire    [10 :0]  reg_20_create_data;                     
wire             reg_20_entry_mla;                       
wire             reg_20_gateclk_idx_write_en;            
wire             reg_20_gateclk_write_en;                
wire             reg_20_rdy_clr;                         
wire    [12 :0]  reg_20_read_data;                       
wire             reg_20_write_en;                        
wire    [10 :0]  reg_21_create_data;                     
wire             reg_21_entry_mla;                       
wire             reg_21_gateclk_idx_write_en;            
wire             reg_21_gateclk_write_en;                
wire             reg_21_rdy_clr;                         
wire    [12 :0]  reg_21_read_data;                       
wire             reg_21_write_en;                        
wire    [10 :0]  reg_22_create_data;                     
wire             reg_22_entry_mla;                       
wire             reg_22_gateclk_idx_write_en;            
wire             reg_22_gateclk_write_en;                
wire             reg_22_rdy_clr;                         
wire    [12 :0]  reg_22_read_data;                       
wire             reg_22_write_en;                        
wire    [10 :0]  reg_23_create_data;                     
wire             reg_23_entry_mla;                       
wire             reg_23_gateclk_idx_write_en;            
wire             reg_23_gateclk_write_en;                
wire             reg_23_rdy_clr;                         
wire    [12 :0]  reg_23_read_data;                       
wire             reg_23_write_en;                        
wire    [10 :0]  reg_24_create_data;                     
wire             reg_24_entry_mla;                       
wire             reg_24_gateclk_idx_write_en;            
wire             reg_24_gateclk_write_en;                
wire             reg_24_rdy_clr;                         
wire    [12 :0]  reg_24_read_data;                       
wire             reg_24_write_en;                        
wire    [10 :0]  reg_25_create_data;                     
wire             reg_25_entry_mla;                       
wire             reg_25_gateclk_idx_write_en;            
wire             reg_25_gateclk_write_en;                
wire             reg_25_rdy_clr;                         
wire    [12 :0]  reg_25_read_data;                       
wire             reg_25_write_en;                        
wire    [10 :0]  reg_26_create_data;                     
wire             reg_26_entry_mla;                       
wire             reg_26_gateclk_idx_write_en;            
wire             reg_26_gateclk_write_en;                
wire             reg_26_rdy_clr;                         
wire    [12 :0]  reg_26_read_data;                       
wire             reg_26_write_en;                        
wire    [10 :0]  reg_27_create_data;                     
wire             reg_27_entry_mla;                       
wire             reg_27_gateclk_idx_write_en;            
wire             reg_27_gateclk_write_en;                
wire             reg_27_rdy_clr;                         
wire    [12 :0]  reg_27_read_data;                       
wire             reg_27_write_en;                        
wire    [10 :0]  reg_28_create_data;                     
wire             reg_28_entry_mla;                       
wire             reg_28_gateclk_idx_write_en;            
wire             reg_28_gateclk_write_en;                
wire             reg_28_rdy_clr;                         
wire    [12 :0]  reg_28_read_data;                       
wire             reg_28_write_en;                        
wire    [10 :0]  reg_29_create_data;                     
wire             reg_29_entry_mla;                       
wire             reg_29_gateclk_idx_write_en;            
wire             reg_29_gateclk_write_en;                
wire             reg_29_rdy_clr;                         
wire    [12 :0]  reg_29_read_data;                       
wire             reg_29_write_en;                        
wire    [10 :0]  reg_2_create_data;                      
wire             reg_2_entry_mla;                        
wire             reg_2_gateclk_idx_write_en;             
wire             reg_2_gateclk_write_en;                 
wire             reg_2_rdy_clr;                          
wire    [12 :0]  reg_2_read_data;                        
wire             reg_2_write_en;                         
wire    [10 :0]  reg_30_create_data;                     
wire             reg_30_entry_mla;                       
wire             reg_30_gateclk_idx_write_en;            
wire             reg_30_gateclk_write_en;                
wire             reg_30_rdy_clr;                         
wire    [12 :0]  reg_30_read_data;                       
wire             reg_30_write_en;                        
wire    [10 :0]  reg_31_create_data;                     
wire             reg_31_entry_mla;                       
wire             reg_31_gateclk_idx_write_en;            
wire             reg_31_gateclk_write_en;                
wire             reg_31_rdy_clr;                         
wire    [12 :0]  reg_31_read_data;                       
wire             reg_31_write_en;                        
wire    [10 :0]  reg_32_create_data;                     
wire             reg_32_entry_mla;                       
wire             reg_32_gateclk_idx_write_en;            
wire             reg_32_gateclk_write_en;                
wire             reg_32_rdy_clr;                         
wire    [12 :0]  reg_32_read_data;                       
wire             reg_32_write_en;                        
wire    [10 :0]  reg_3_create_data;                      
wire             reg_3_entry_mla;                        
wire             reg_3_gateclk_idx_write_en;             
wire             reg_3_gateclk_write_en;                 
wire             reg_3_rdy_clr;                          
wire    [12 :0]  reg_3_read_data;                        
wire             reg_3_write_en;                         
wire    [10 :0]  reg_4_create_data;                      
wire             reg_4_entry_mla;                        
wire             reg_4_gateclk_idx_write_en;             
wire             reg_4_gateclk_write_en;                 
wire             reg_4_rdy_clr;                          
wire    [12 :0]  reg_4_read_data;                        
wire             reg_4_write_en;                         
wire    [10 :0]  reg_5_create_data;                      
wire             reg_5_entry_mla;                        
wire             reg_5_gateclk_idx_write_en;             
wire             reg_5_gateclk_write_en;                 
wire             reg_5_rdy_clr;                          
wire    [12 :0]  reg_5_read_data;                        
wire             reg_5_write_en;                         
wire    [10 :0]  reg_6_create_data;                      
wire             reg_6_entry_mla;                        
wire             reg_6_gateclk_idx_write_en;             
wire             reg_6_gateclk_write_en;                 
wire             reg_6_rdy_clr;                          
wire    [12 :0]  reg_6_read_data;                        
wire             reg_6_write_en;                         
wire    [10 :0]  reg_7_create_data;                      
wire             reg_7_entry_mla;                        
wire             reg_7_gateclk_idx_write_en;             
wire             reg_7_gateclk_write_en;                 
wire             reg_7_rdy_clr;                          
wire    [12 :0]  reg_7_read_data;                        
wire             reg_7_write_en;                         
wire    [10 :0]  reg_8_create_data;                      
wire             reg_8_entry_mla;                        
wire             reg_8_gateclk_idx_write_en;             
wire             reg_8_gateclk_write_en;                 
wire             reg_8_rdy_clr;                          
wire    [12 :0]  reg_8_read_data;                        
wire             reg_8_write_en;                         
wire    [10 :0]  reg_9_create_data;                      
wire             reg_9_entry_mla;                        
wire             reg_9_gateclk_idx_write_en;             
wire             reg_9_gateclk_write_en;                 
wire             reg_9_rdy_clr;                          
wire    [12 :0]  reg_9_read_data;                        
wire             reg_9_write_en;                         
wire    [32 :0]  reg_gateclk_write0_en;                  
wire    [32 :0]  reg_gateclk_write1_en;                  
wire    [32 :0]  reg_gateclk_write2_en;                  
wire    [32 :0]  reg_gateclk_write3_en;                  
wire    [32 :0]  reg_gateclk_write_en;                   
wire    [32 :0]  reg_write0_en;                          
wire    [32 :0]  reg_write1_en;                          
wire    [32 :0]  reg_write2_en;                          
wire    [32 :0]  reg_write3_en;                          
wire    [32 :0]  reg_write_en;                           
wire    [6  :0]  rt_dp_inst0_rel_preg;                   
wire    [8  :0]  rt_dp_inst0_src0_data;                  
wire    [8  :0]  rt_dp_inst0_src1_data;                  
wire    [9  :0]  rt_dp_inst0_src2_data;                  
wire             rt_inst0_mov_bypass_over_inst1;         
wire             rt_inst0_mov_dst_mla_rdy;               
wire    [6  :0]  rt_inst0_mov_dst_preg;                  
wire             rt_inst0_mov_dst_rdy;                   
wire             rt_inst0_mov_dst_wb;                    
wire             rt_inst1_dst_match_inst0;               
wire             rt_inst1_src0_match_inst0;              
wire             rt_inst1_src1_match_inst0;              
wire             rt_inst1_src2_match_inst0;              
wire             rt_inst2_dst_match_inst0;               
wire             rt_inst2_dst_match_inst1;               
wire             rt_inst2_src0_match_inst0;              
wire             rt_inst2_src0_match_inst1;              
wire             rt_inst2_src1_match_inst0;              
wire             rt_inst2_src1_match_inst1;              
wire             rt_inst2_src2_match_inst0;              
wire             rt_inst2_src2_match_inst1;              
wire             rt_inst3_dst_match_inst0;               
wire             rt_inst3_dst_match_inst1;               
wire             rt_inst3_dst_match_inst2;               
wire             rt_inst3_src0_match_inst0;              
wire             rt_inst3_src0_match_inst1;              
wire             rt_inst3_src0_match_inst2;              
wire             rt_inst3_src1_match_inst0;              
wire             rt_inst3_src1_match_inst1;              
wire             rt_inst3_src1_match_inst2;              
wire             rt_inst3_src2_match_inst0;              
wire             rt_inst3_src2_match_inst1;              
wire             rt_inst3_src2_match_inst2;              
wire    [223:0]  rt_recover_updt_preg;                   
wire             rt_recover_updt_vld;                    
wire    [223:0]  rt_reset_updt_preg;                     
wire             rtu_idu_flush_fe;                       
wire             rtu_idu_flush_is;                       
wire    [223:0]  rtu_idu_rt_recover_preg;                
wire             rtu_yy_xx_flush;                        
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           


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
//                   Instance Entries
//==========================================================
//------------------------Registers-------------------------
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

assign reg_0_entry_mla  = 1'b0;
assign reg_1_entry_mla  = 1'b0;
assign reg_2_entry_mla  = 1'b0;
assign reg_3_entry_mla  = 1'b0;
assign reg_4_entry_mla  = 1'b0;
assign reg_5_entry_mla  = 1'b0;
assign reg_6_entry_mla  = 1'b0;
assign reg_7_entry_mla  = 1'b0;
assign reg_8_entry_mla  = 1'b0;
assign reg_9_entry_mla  = 1'b0;
assign reg_10_entry_mla = 1'b0;
assign reg_11_entry_mla = 1'b0;
assign reg_12_entry_mla = 1'b0;
assign reg_13_entry_mla = 1'b0;
assign reg_14_entry_mla = 1'b0;
assign reg_15_entry_mla = 1'b0;
assign reg_16_entry_mla = 1'b0;
assign reg_17_entry_mla = 1'b0;
assign reg_18_entry_mla = 1'b0;
assign reg_19_entry_mla = 1'b0;
assign reg_20_entry_mla = 1'b0;
assign reg_21_entry_mla = 1'b0;
assign reg_22_entry_mla = 1'b0;
assign reg_23_entry_mla = 1'b0;
assign reg_24_entry_mla = 1'b0;
assign reg_25_entry_mla = 1'b0;
assign reg_26_entry_mla = 1'b0;
assign reg_27_entry_mla = 1'b0;
assign reg_28_entry_mla = 1'b0;
assign reg_29_entry_mla = 1'b0;
assign reg_30_entry_mla = 1'b0;
assign reg_31_entry_mla = 1'b0;
assign reg_32_entry_mla = 1'b0;

//--------------------bypass ready signal-------------------
//ir insts do not need issue bypass singal, only is insts need
//set bypass ready to 0 for timing
assign alu0_reg_fwd_vld = 1'b0;
assign alu1_reg_fwd_vld = 1'b0;
assign mla_reg_fwd_vld  = 1'b0;
assign lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx = 1'b0;

//------------------------x0 entry--------------------------
// &Force ("nonport","reg_0_create_data"); @139
// &Force ("nonport","reg_0_gateclk_idx_write_en"); @140
// &Force ("nonport","reg_0_gateclk_write_en"); @141
// &Force ("nonport","reg_0_rdy_clr"); @142
// &Force ("nonport","reg_0_write_en"); @143
// &Force ("nonport","reg_0_entry_mla"); @144
//treat x0 always ready and wb
assign reg_0_read_data[12:0] = 13'b0111000000011;

//--------------------other register entry------------------
// &ConnRule(s/^x_/reg_1_/); @149
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_1"); @150
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_1 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_1_create_data                      ),
  .x_entry_mla                             (reg_1_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_1_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_1_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_1_rdy_clr                          ),
  .x_read_data                             (reg_1_read_data                        ),
  .x_write_en                              (reg_1_write_en                         )
);

// &ConnRule(s/^x_/reg_2_/); @151
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_2"); @152
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_2 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_2_create_data                      ),
  .x_entry_mla                             (reg_2_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_2_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_2_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_2_rdy_clr                          ),
  .x_read_data                             (reg_2_read_data                        ),
  .x_write_en                              (reg_2_write_en                         )
);

// &ConnRule(s/^x_/reg_3_/); @153
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_3"); @154
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_3 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_3_create_data                      ),
  .x_entry_mla                             (reg_3_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_3_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_3_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_3_rdy_clr                          ),
  .x_read_data                             (reg_3_read_data                        ),
  .x_write_en                              (reg_3_write_en                         )
);

// &ConnRule(s/^x_/reg_4_/); @155
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_4"); @156
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_4 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_4_create_data                      ),
  .x_entry_mla                             (reg_4_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_4_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_4_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_4_rdy_clr                          ),
  .x_read_data                             (reg_4_read_data                        ),
  .x_write_en                              (reg_4_write_en                         )
);

// &ConnRule(s/^x_/reg_5_/); @157
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_5"); @158
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_5 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_5_create_data                      ),
  .x_entry_mla                             (reg_5_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_5_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_5_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_5_rdy_clr                          ),
  .x_read_data                             (reg_5_read_data                        ),
  .x_write_en                              (reg_5_write_en                         )
);

// &ConnRule(s/^x_/reg_6_/); @159
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_6"); @160
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_6 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_6_create_data                      ),
  .x_entry_mla                             (reg_6_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_6_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_6_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_6_rdy_clr                          ),
  .x_read_data                             (reg_6_read_data                        ),
  .x_write_en                              (reg_6_write_en                         )
);

// &ConnRule(s/^x_/reg_7_/); @161
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_7"); @162
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_7 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_7_create_data                      ),
  .x_entry_mla                             (reg_7_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_7_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_7_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_7_rdy_clr                          ),
  .x_read_data                             (reg_7_read_data                        ),
  .x_write_en                              (reg_7_write_en                         )
);

// &ConnRule(s/^x_/reg_8_/); @163
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_8"); @164
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_8 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_8_create_data                      ),
  .x_entry_mla                             (reg_8_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_8_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_8_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_8_rdy_clr                          ),
  .x_read_data                             (reg_8_read_data                        ),
  .x_write_en                              (reg_8_write_en                         )
);

// &ConnRule(s/^x_/reg_9_/); @165
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_9"); @166
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_9 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_9_create_data                      ),
  .x_entry_mla                             (reg_9_entry_mla                        ),
  .x_gateclk_idx_write_en                  (reg_9_gateclk_idx_write_en             ),
  .x_gateclk_write_en                      (reg_9_gateclk_write_en                 ),
  .x_rdy_clr                               (reg_9_rdy_clr                          ),
  .x_read_data                             (reg_9_read_data                        ),
  .x_write_en                              (reg_9_write_en                         )
);

// &ConnRule(s/^x_/reg_10_/); @167
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_10"); @168
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_10 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_10_create_data                     ),
  .x_entry_mla                             (reg_10_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_10_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_10_gateclk_write_en                ),
  .x_rdy_clr                               (reg_10_rdy_clr                         ),
  .x_read_data                             (reg_10_read_data                       ),
  .x_write_en                              (reg_10_write_en                        )
);

// &ConnRule(s/^x_/reg_11_/); @169
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_11"); @170
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_11 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_11_create_data                     ),
  .x_entry_mla                             (reg_11_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_11_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_11_gateclk_write_en                ),
  .x_rdy_clr                               (reg_11_rdy_clr                         ),
  .x_read_data                             (reg_11_read_data                       ),
  .x_write_en                              (reg_11_write_en                        )
);

// &ConnRule(s/^x_/reg_12_/); @171
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_12"); @172
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_12 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_12_create_data                     ),
  .x_entry_mla                             (reg_12_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_12_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_12_gateclk_write_en                ),
  .x_rdy_clr                               (reg_12_rdy_clr                         ),
  .x_read_data                             (reg_12_read_data                       ),
  .x_write_en                              (reg_12_write_en                        )
);

// &ConnRule(s/^x_/reg_13_/); @173
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_13"); @174
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_13 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_13_create_data                     ),
  .x_entry_mla                             (reg_13_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_13_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_13_gateclk_write_en                ),
  .x_rdy_clr                               (reg_13_rdy_clr                         ),
  .x_read_data                             (reg_13_read_data                       ),
  .x_write_en                              (reg_13_write_en                        )
);

// &ConnRule(s/^x_/reg_14_/); @175
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_14"); @176
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_14 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_14_create_data                     ),
  .x_entry_mla                             (reg_14_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_14_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_14_gateclk_write_en                ),
  .x_rdy_clr                               (reg_14_rdy_clr                         ),
  .x_read_data                             (reg_14_read_data                       ),
  .x_write_en                              (reg_14_write_en                        )
);

// &ConnRule(s/^x_/reg_15_/); @177
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_15"); @178
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_15 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_15_create_data                     ),
  .x_entry_mla                             (reg_15_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_15_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_15_gateclk_write_en                ),
  .x_rdy_clr                               (reg_15_rdy_clr                         ),
  .x_read_data                             (reg_15_read_data                       ),
  .x_write_en                              (reg_15_write_en                        )
);

// &ConnRule(s/^x_/reg_16_/); @179
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_16"); @180
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_16 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_16_create_data                     ),
  .x_entry_mla                             (reg_16_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_16_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_16_gateclk_write_en                ),
  .x_rdy_clr                               (reg_16_rdy_clr                         ),
  .x_read_data                             (reg_16_read_data                       ),
  .x_write_en                              (reg_16_write_en                        )
);

// &ConnRule(s/^x_/reg_17_/); @181
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_17"); @182
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_17 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_17_create_data                     ),
  .x_entry_mla                             (reg_17_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_17_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_17_gateclk_write_en                ),
  .x_rdy_clr                               (reg_17_rdy_clr                         ),
  .x_read_data                             (reg_17_read_data                       ),
  .x_write_en                              (reg_17_write_en                        )
);

// &ConnRule(s/^x_/reg_18_/); @183
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_18"); @184
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_18 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_18_create_data                     ),
  .x_entry_mla                             (reg_18_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_18_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_18_gateclk_write_en                ),
  .x_rdy_clr                               (reg_18_rdy_clr                         ),
  .x_read_data                             (reg_18_read_data                       ),
  .x_write_en                              (reg_18_write_en                        )
);

// &ConnRule(s/^x_/reg_19_/); @185
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_19"); @186
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_19 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_19_create_data                     ),
  .x_entry_mla                             (reg_19_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_19_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_19_gateclk_write_en                ),
  .x_rdy_clr                               (reg_19_rdy_clr                         ),
  .x_read_data                             (reg_19_read_data                       ),
  .x_write_en                              (reg_19_write_en                        )
);

// &ConnRule(s/^x_/reg_20_/); @187
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_20"); @188
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_20 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_20_create_data                     ),
  .x_entry_mla                             (reg_20_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_20_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_20_gateclk_write_en                ),
  .x_rdy_clr                               (reg_20_rdy_clr                         ),
  .x_read_data                             (reg_20_read_data                       ),
  .x_write_en                              (reg_20_write_en                        )
);

// &ConnRule(s/^x_/reg_21_/); @189
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_21"); @190
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_21 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_21_create_data                     ),
  .x_entry_mla                             (reg_21_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_21_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_21_gateclk_write_en                ),
  .x_rdy_clr                               (reg_21_rdy_clr                         ),
  .x_read_data                             (reg_21_read_data                       ),
  .x_write_en                              (reg_21_write_en                        )
);

// &ConnRule(s/^x_/reg_22_/); @191
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_22"); @192
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_22 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_22_create_data                     ),
  .x_entry_mla                             (reg_22_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_22_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_22_gateclk_write_en                ),
  .x_rdy_clr                               (reg_22_rdy_clr                         ),
  .x_read_data                             (reg_22_read_data                       ),
  .x_write_en                              (reg_22_write_en                        )
);

// &ConnRule(s/^x_/reg_23_/); @193
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_23"); @194
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_23 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_23_create_data                     ),
  .x_entry_mla                             (reg_23_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_23_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_23_gateclk_write_en                ),
  .x_rdy_clr                               (reg_23_rdy_clr                         ),
  .x_read_data                             (reg_23_read_data                       ),
  .x_write_en                              (reg_23_write_en                        )
);

// &ConnRule(s/^x_/reg_24_/); @195
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_24"); @196
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_24 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_24_create_data                     ),
  .x_entry_mla                             (reg_24_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_24_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_24_gateclk_write_en                ),
  .x_rdy_clr                               (reg_24_rdy_clr                         ),
  .x_read_data                             (reg_24_read_data                       ),
  .x_write_en                              (reg_24_write_en                        )
);

// &ConnRule(s/^x_/reg_25_/); @197
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_25"); @198
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_25 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_25_create_data                     ),
  .x_entry_mla                             (reg_25_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_25_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_25_gateclk_write_en                ),
  .x_rdy_clr                               (reg_25_rdy_clr                         ),
  .x_read_data                             (reg_25_read_data                       ),
  .x_write_en                              (reg_25_write_en                        )
);

// &ConnRule(s/^x_/reg_26_/); @199
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_26"); @200
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_26 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_26_create_data                     ),
  .x_entry_mla                             (reg_26_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_26_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_26_gateclk_write_en                ),
  .x_rdy_clr                               (reg_26_rdy_clr                         ),
  .x_read_data                             (reg_26_read_data                       ),
  .x_write_en                              (reg_26_write_en                        )
);

// &ConnRule(s/^x_/reg_27_/); @201
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_27"); @202
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_27 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_27_create_data                     ),
  .x_entry_mla                             (reg_27_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_27_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_27_gateclk_write_en                ),
  .x_rdy_clr                               (reg_27_rdy_clr                         ),
  .x_read_data                             (reg_27_read_data                       ),
  .x_write_en                              (reg_27_write_en                        )
);

// &ConnRule(s/^x_/reg_28_/); @203
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_28"); @204
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_28 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_28_create_data                     ),
  .x_entry_mla                             (reg_28_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_28_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_28_gateclk_write_en                ),
  .x_rdy_clr                               (reg_28_rdy_clr                         ),
  .x_read_data                             (reg_28_read_data                       ),
  .x_write_en                              (reg_28_write_en                        )
);

// &ConnRule(s/^x_/reg_29_/); @205
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_29"); @206
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_29 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_29_create_data                     ),
  .x_entry_mla                             (reg_29_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_29_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_29_gateclk_write_en                ),
  .x_rdy_clr                               (reg_29_rdy_clr                         ),
  .x_read_data                             (reg_29_read_data                       ),
  .x_write_en                              (reg_29_write_en                        )
);

// &ConnRule(s/^x_/reg_30_/); @207
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_30"); @208
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_30 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_30_create_data                     ),
  .x_entry_mla                             (reg_30_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_30_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_30_gateclk_write_en                ),
  .x_rdy_clr                               (reg_30_rdy_clr                         ),
  .x_read_data                             (reg_30_read_data                       ),
  .x_write_en                              (reg_30_write_en                        )
);

// &ConnRule(s/^x_/reg_31_/); @209
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_31"); @210
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_31 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_31_create_data                     ),
  .x_entry_mla                             (reg_31_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_31_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_31_gateclk_write_en                ),
  .x_rdy_clr                               (reg_31_rdy_clr                         ),
  .x_read_data                             (reg_31_read_data                       ),
  .x_write_en                              (reg_31_write_en                        )
);


// &ConnRule(s/^x_/reg_32_/); @212
// &Instance("ct_idu_dep_reg_src2_entry","x_ct_idu_ir_rt_entry_reg_32"); @213
ct_idu_dep_reg_src2_entry  x_ct_idu_ir_rt_entry_reg_32 (
  .alu0_reg_fwd_vld                        (alu0_reg_fwd_vld                       ),
  .alu1_reg_fwd_vld                        (alu1_reg_fwd_vld                       ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .mla_reg_fwd_vld                         (mla_reg_fwd_vld                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (reg_32_create_data                     ),
  .x_entry_mla                             (reg_32_entry_mla                       ),
  .x_gateclk_idx_write_en                  (reg_32_gateclk_idx_write_en            ),
  .x_gateclk_write_en                      (reg_32_gateclk_write_en                ),
  .x_rdy_clr                               (reg_32_rdy_clr                         ),
  .x_read_data                             (reg_32_read_data                       ),
  .x_write_en                              (reg_32_write_en                        )
);


//==========================================================
//                      Write Port      
//==========================================================
//--------------------ir inst write enable------------------
assign dp_rt_inst0_dst_reg_lsb[4:0] = dp_rt_inst0_dst_reg[4:0];
assign dp_rt_inst1_dst_reg_lsb[4:0] = dp_rt_inst1_dst_reg[4:0];
assign dp_rt_inst2_dst_reg_lsb[4:0] = dp_rt_inst2_dst_reg[4:0];
assign dp_rt_inst3_dst_reg_lsb[4:0] = dp_rt_inst3_dst_reg[4:0];

// &ConnRule(s/^x_num/dp_rt_inst0_dst_reg_lsb/); @224
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dp_rt_inst0_dst_reg_lsb"); @225
ct_rtu_expand_32  x_ct_rtu_expand_32_dp_rt_inst0_dst_reg_lsb (
  .x_num                          (dp_rt_inst0_dst_reg_lsb       ),
  .x_num_expand                   (dp_rt_inst0_dst_reg_lsb_expand)
);

// &ConnRule(s/^x_num/dp_rt_inst1_dst_reg_lsb/); @226
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dp_rt_inst1_dst_reg_lsb"); @227
ct_rtu_expand_32  x_ct_rtu_expand_32_dp_rt_inst1_dst_reg_lsb (
  .x_num                          (dp_rt_inst1_dst_reg_lsb       ),
  .x_num_expand                   (dp_rt_inst1_dst_reg_lsb_expand)
);

// &ConnRule(s/^x_num/dp_rt_inst2_dst_reg_lsb/); @228
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dp_rt_inst2_dst_reg_lsb"); @229
ct_rtu_expand_32  x_ct_rtu_expand_32_dp_rt_inst2_dst_reg_lsb (
  .x_num                          (dp_rt_inst2_dst_reg_lsb       ),
  .x_num_expand                   (dp_rt_inst2_dst_reg_lsb_expand)
);

// &ConnRule(s/^x_num/dp_rt_inst3_dst_reg_lsb/); @230
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dp_rt_inst3_dst_reg_lsb"); @231
ct_rtu_expand_32  x_ct_rtu_expand_32_dp_rt_inst3_dst_reg_lsb (
  .x_num                          (dp_rt_inst3_dst_reg_lsb       ),
  .x_num_expand                   (dp_rt_inst3_dst_reg_lsb_expand)
);


//if no write back, write port 0 not enable
assign inst0_write_en              = ctrl_rt_inst0_vld
                                     && !ctrl_ir_stall
                                     && !rt_recover_updt_vld
                                     &&  dp_rt_inst0_dst_vld;
assign reg_write0_en[31:0]         = dp_rt_inst0_dst_reg_lsb_expand[31:0]
                                     & {32{inst0_write_en && !dp_rt_inst0_dst_reg[5]}};
assign reg_write0_en[32]           = dp_rt_inst0_dst_reg_lsb_expand[0]
                                     && inst0_write_en && dp_rt_inst0_dst_reg[5];
//gateclk write en ignore stall signal
assign inst0_gateclk_write_en      = ctrl_rt_inst0_vld
                                     && !rt_recover_updt_vld
                                     &&  dp_rt_inst0_dst_vld;
assign reg_gateclk_write0_en[31:0] = dp_rt_inst0_dst_reg_lsb_expand[31:0] 
                                     & {32{inst0_gateclk_write_en && !dp_rt_inst0_dst_reg[5]}};
assign reg_gateclk_write0_en[32]   = dp_rt_inst0_dst_reg_lsb_expand[0]
                                     && inst0_gateclk_write_en && dp_rt_inst0_dst_reg[5];

//if no write back, write port 1 not enable
assign inst1_write_en              = ctrl_rt_inst1_vld
                                     && !ctrl_ir_stall
                                     && !rt_recover_updt_vld
                                     &&  dp_rt_inst1_dst_vld;
assign reg_write1_en[31:0]         = dp_rt_inst1_dst_reg_lsb_expand[31:0]
                                     & {32{inst1_write_en && !dp_rt_inst1_dst_reg[5]}};
assign reg_write1_en[32]           = dp_rt_inst1_dst_reg_lsb_expand[0]
                                     && inst1_write_en && dp_rt_inst1_dst_reg[5];
//gateclk write en ignore stall signal
assign inst1_gateclk_write_en      = ctrl_rt_inst1_vld
                                     && !rt_recover_updt_vld
                                     &&  dp_rt_inst1_dst_vld;
assign reg_gateclk_write1_en[31:0] = dp_rt_inst1_dst_reg_lsb_expand[31:0] 
                                     & {32{inst1_gateclk_write_en && !dp_rt_inst1_dst_reg[5]}};
assign reg_gateclk_write1_en[32]   = dp_rt_inst1_dst_reg_lsb_expand[0]
                                     && inst1_gateclk_write_en && dp_rt_inst1_dst_reg[5];

//if no write back, write port 2 not enable
assign inst2_write_en              = ctrl_rt_inst2_vld
                                     && !ctrl_ir_stall
                                     && !rt_recover_updt_vld
                                     &&  dp_rt_inst2_dst_vld;
assign reg_write2_en[31:0]         = dp_rt_inst2_dst_reg_lsb_expand[31:0]
                                     & {32{inst2_write_en && !dp_rt_inst2_dst_reg[5]}};
assign reg_write2_en[32]           = dp_rt_inst2_dst_reg_lsb_expand[0]
                                     && inst2_write_en && dp_rt_inst2_dst_reg[5];
//gateclk write en ignore stall signal
assign inst2_gateclk_write_en      = ctrl_rt_inst2_vld
                                     && !rt_recover_updt_vld
                                     &&  dp_rt_inst2_dst_vld;
assign reg_gateclk_write2_en[31:0] = dp_rt_inst2_dst_reg_lsb_expand[31:0] 
                                     & {32{inst2_gateclk_write_en && !dp_rt_inst2_dst_reg[5]}};
assign reg_gateclk_write2_en[32]   = dp_rt_inst2_dst_reg_lsb_expand[0]
                                     && inst2_gateclk_write_en && dp_rt_inst2_dst_reg[5];

//if no write back, write port 3 not enable
assign inst3_write_en              = ctrl_rt_inst3_vld
                                     && !ctrl_ir_stall
                                     && !rt_recover_updt_vld
                                     &&  dp_rt_inst3_dst_vld;
assign reg_write3_en[31:0]         = dp_rt_inst3_dst_reg_lsb_expand[31:0]
                                     & {32{inst3_write_en && !dp_rt_inst3_dst_reg[5]}};
assign reg_write3_en[32]           = dp_rt_inst3_dst_reg_lsb_expand[0]
                                     && inst3_write_en && dp_rt_inst3_dst_reg[5];
//gateclk write en ignore stall signal
assign inst3_gateclk_write_en      = ctrl_rt_inst3_vld
                                     && !rt_recover_updt_vld
                                     &&  dp_rt_inst3_dst_vld;
assign reg_gateclk_write3_en[31:0] = dp_rt_inst3_dst_reg_lsb_expand[31:0] 
                                     & {32{inst3_gateclk_write_en && !dp_rt_inst3_dst_reg[5]}};
assign reg_gateclk_write3_en[32]   = dp_rt_inst3_dst_reg_lsb_expand[0]
                                     && inst3_gateclk_write_en && dp_rt_inst3_dst_reg[5];

//-------------flush and reset write enable-----------------
//reset: build initial mappings (r0~r31 <-> p0~p31)
//flush: recover mappings from rtu pst
assign rt_reset_updt_preg[223:0] = 
         {7'd31, 7'd30, 7'd29, 7'd28, 7'd27, 7'd26, 7'd25, 7'd24,
          7'd23, 7'd22, 7'd21, 7'd20, 7'd19, 7'd18, 7'd17, 7'd16,
          7'd15, 7'd14, 7'd13, 7'd12, 7'd11, 7'd10, 7'd9,  7'd8,
          7'd7,  7'd6,  7'd5,  7'd4,  7'd3,  7'd2,  7'd1,  7'd0};
assign rt_recover_updt_vld         = ifu_xx_sync_reset
                                     || rtu_yy_xx_flush;
assign rt_recover_updt_preg[223:0] = (ifu_xx_sync_reset)
                                     ? rt_reset_updt_preg[223:0]
                                     : rtu_idu_rt_recover_preg[223:0];

//-----------------------Write value------------------------
//generate write enable signal
assign reg_write_en[32:0] = {33{rt_recover_updt_vld}}
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

assign gateclk_entry_vld = 1'b1;
//the gate cell enable write signal use gate clock instruction valid
//instead of dst_vld for timing optimization
assign reg_gateclk_write_en[32:0] = {33{rt_recover_updt_vld}}
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
//preg valid always initial as 0, except recover from pst
//the write back data path use gateclk wen, ignoring id stall
//priority is 3>2>1>0>pst_update
// &CombBeg; @442
always @( reg_gateclk_write2_en[0]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write1_en[0]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write3_en[0]
       or reg_gateclk_write0_en[0]
       or rt_recover_updt_preg[6:0]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[0])
    reg_0_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[0])
    reg_0_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[0])
    reg_0_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[0])
    reg_0_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_0_create_preg[6:0] = rt_recover_updt_preg[6:0];
// &CombEnd; @453
end
// &CombBeg; @454
always @( rt_recover_updt_preg[13:7]
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write2_en[1]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write0_en[1]
       or reg_gateclk_write1_en[1]
       or reg_gateclk_write3_en[1]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[1])
    reg_1_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[1])
    reg_1_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[1])
    reg_1_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[1])
    reg_1_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_1_create_preg[6:0] = rt_recover_updt_preg[13:7];
// &CombEnd; @465
end
// &CombBeg; @466
always @( dp_rt_inst0_dst_preg[6:0]
       or rt_recover_updt_preg[20:14]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write3_en[2]
       or reg_gateclk_write0_en[2]
       or reg_gateclk_write1_en[2]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write2_en[2])
begin
  if(reg_gateclk_write3_en[2])
    reg_2_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[2])
    reg_2_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[2])
    reg_2_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[2])
    reg_2_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_2_create_preg[6:0] = rt_recover_updt_preg[20:14];
// &CombEnd; @477
end
// &CombBeg; @478
always @( reg_gateclk_write0_en[3]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write3_en[3]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write1_en[3]
       or reg_gateclk_write2_en[3]
       or rt_recover_updt_preg[27:21]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[3])
    reg_3_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[3])
    reg_3_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[3])
    reg_3_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[3])
    reg_3_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_3_create_preg[6:0] = rt_recover_updt_preg[27:21];
// &CombEnd; @489
end
// &CombBeg; @490
always @( dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write3_en[4]
       or reg_gateclk_write0_en[4]
       or reg_gateclk_write1_en[4]
       or dp_rt_inst3_dst_preg[6:0]
       or rt_recover_updt_preg[34:28]
       or reg_gateclk_write2_en[4]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[4])
    reg_4_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[4])
    reg_4_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[4])
    reg_4_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[4])
    reg_4_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_4_create_preg[6:0] = rt_recover_updt_preg[34:28];
// &CombEnd; @501
end
// &CombBeg; @502
always @( rt_recover_updt_preg[41:35]
       or reg_gateclk_write1_en[5]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write3_en[5]
       or reg_gateclk_write2_en[5]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write0_en[5]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[5])
    reg_5_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[5])
    reg_5_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[5])
    reg_5_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[5])
    reg_5_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_5_create_preg[6:0] = rt_recover_updt_preg[41:35];
// &CombEnd; @513
end
// &CombBeg; @514
always @( reg_gateclk_write1_en[6]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write3_en[6]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write0_en[6]
       or rt_recover_updt_preg[48:42]
       or reg_gateclk_write2_en[6]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[6])
    reg_6_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[6])
    reg_6_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[6])
    reg_6_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[6])
    reg_6_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_6_create_preg[6:0] = rt_recover_updt_preg[48:42];
// &CombEnd; @525
end
// &CombBeg; @526
always @( reg_gateclk_write1_en[7]
       or reg_gateclk_write2_en[7]
       or dp_rt_inst0_dst_preg[6:0]
       or rt_recover_updt_preg[55:49]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write0_en[7]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write3_en[7]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[7])
    reg_7_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[7])
    reg_7_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[7])
    reg_7_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[7])
    reg_7_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_7_create_preg[6:0] = rt_recover_updt_preg[55:49];
// &CombEnd; @537
end
// &CombBeg; @538
always @( dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write2_en[8]
       or reg_gateclk_write1_en[8]
       or reg_gateclk_write0_en[8]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write3_en[8]
       or rt_recover_updt_preg[62:56]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[8])
    reg_8_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[8])
    reg_8_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[8])
    reg_8_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[8])
    reg_8_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_8_create_preg[6:0] = rt_recover_updt_preg[62:56];
// &CombEnd; @549
end
// &CombBeg; @550
always @( reg_gateclk_write3_en[9]
       or reg_gateclk_write1_en[9]
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write0_en[9]
       or dp_rt_inst1_dst_preg[6:0]
       or rt_recover_updt_preg[69:63]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write2_en[9])
begin
  if(reg_gateclk_write3_en[9])
    reg_9_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[9])
    reg_9_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[9])
    reg_9_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[9])
    reg_9_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_9_create_preg[6:0] = rt_recover_updt_preg[69:63];
// &CombEnd; @561
end
// &CombBeg; @562
always @( rt_recover_updt_preg[76:70]
       or reg_gateclk_write2_en[10]
       or reg_gateclk_write0_en[10]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write1_en[10]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write3_en[10]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[10])
    reg_10_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[10])
    reg_10_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[10])
    reg_10_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[10])
    reg_10_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_10_create_preg[6:0] = rt_recover_updt_preg[76:70];
// &CombEnd; @573
end
// &CombBeg; @574
always @( dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write2_en[11]
       or rt_recover_updt_preg[83:77]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write0_en[11]
       or reg_gateclk_write1_en[11]
       or reg_gateclk_write3_en[11])
begin
  if(reg_gateclk_write3_en[11])
    reg_11_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[11])
    reg_11_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[11])
    reg_11_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[11])
    reg_11_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_11_create_preg[6:0] = rt_recover_updt_preg[83:77];
// &CombEnd; @585
end
// &CombBeg; @586
always @( dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write1_en[12]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write3_en[12]
       or reg_gateclk_write2_en[12]
       or rt_recover_updt_preg[90:84]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write0_en[12]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[12])
    reg_12_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[12])
    reg_12_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[12])
    reg_12_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[12])
    reg_12_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_12_create_preg[6:0] = rt_recover_updt_preg[90:84];
// &CombEnd; @597
end
// &CombBeg; @598
always @( dp_rt_inst0_dst_preg[6:0]
       or rt_recover_updt_preg[97:91]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write2_en[13]
       or reg_gateclk_write1_en[13]
       or reg_gateclk_write3_en[13]
       or reg_gateclk_write0_en[13]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[13])
    reg_13_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[13])
    reg_13_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[13])
    reg_13_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[13])
    reg_13_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_13_create_preg[6:0] = rt_recover_updt_preg[97:91];
// &CombEnd; @609
end
// &CombBeg; @610
always @( reg_gateclk_write0_en[14]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write3_en[14]
       or reg_gateclk_write2_en[14]
       or dp_rt_inst3_dst_preg[6:0]
       or rt_recover_updt_preg[104:98]
       or reg_gateclk_write1_en[14]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[14])
    reg_14_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[14])
    reg_14_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[14])
    reg_14_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[14])
    reg_14_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_14_create_preg[6:0] = rt_recover_updt_preg[104:98];
// &CombEnd; @621
end
// &CombBeg; @622
always @( rt_recover_updt_preg[111:105]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write2_en[15]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write0_en[15]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write1_en[15]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write3_en[15])
begin
  if(reg_gateclk_write3_en[15])
    reg_15_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[15])
    reg_15_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[15])
    reg_15_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[15])
    reg_15_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_15_create_preg[6:0] = rt_recover_updt_preg[111:105];
// &CombEnd; @633
end
// &CombBeg; @634
always @( dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write1_en[16]
       or rt_recover_updt_preg[118:112]
       or reg_gateclk_write0_en[16]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write3_en[16]
       or reg_gateclk_write2_en[16]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[16])
    reg_16_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[16])
    reg_16_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[16])
    reg_16_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[16])
    reg_16_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_16_create_preg[6:0] = rt_recover_updt_preg[118:112];
// &CombEnd; @645
end
// &CombBeg; @646
always @( dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write2_en[17]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write1_en[17]
       or reg_gateclk_write0_en[17]
       or rt_recover_updt_preg[125:119]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write3_en[17]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[17])
    reg_17_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[17])
    reg_17_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[17])
    reg_17_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[17])
    reg_17_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_17_create_preg[6:0] = rt_recover_updt_preg[125:119];
// &CombEnd; @657
end
// &CombBeg; @658
always @( dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write3_en[18]
       or reg_gateclk_write2_en[18]
       or rt_recover_updt_preg[132:126]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write0_en[18]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write1_en[18])
begin
  if(reg_gateclk_write3_en[18])
    reg_18_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[18])
    reg_18_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[18])
    reg_18_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[18])
    reg_18_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_18_create_preg[6:0] = rt_recover_updt_preg[132:126];
// &CombEnd; @669
end
// &CombBeg; @670
always @( reg_gateclk_write1_en[19]
       or reg_gateclk_write0_en[19]
       or dp_rt_inst0_dst_preg[6:0]
       or rt_recover_updt_preg[139:133]
       or dp_rt_inst3_dst_preg[6:0]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write3_en[19]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write2_en[19])
begin
  if(reg_gateclk_write3_en[19])
    reg_19_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[19])
    reg_19_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[19])
    reg_19_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[19])
    reg_19_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_19_create_preg[6:0] = rt_recover_updt_preg[139:133];
// &CombEnd; @681
end
// &CombBeg; @682
always @( dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write0_en[20]
       or reg_gateclk_write3_en[20]
       or dp_rt_inst3_dst_preg[6:0]
       or rt_recover_updt_preg[146:140]
       or reg_gateclk_write1_en[20]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write2_en[20]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[20])
    reg_20_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[20])
    reg_20_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[20])
    reg_20_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[20])
    reg_20_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_20_create_preg[6:0] = rt_recover_updt_preg[146:140];
// &CombEnd; @693
end
// &CombBeg; @694
always @( reg_gateclk_write3_en[21]
       or reg_gateclk_write0_en[21]
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst3_dst_preg[6:0]
       or rt_recover_updt_preg[153:147]
       or reg_gateclk_write1_en[21]
       or reg_gateclk_write2_en[21]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[21])
    reg_21_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[21])
    reg_21_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[21])
    reg_21_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[21])
    reg_21_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_21_create_preg[6:0] = rt_recover_updt_preg[153:147];
// &CombEnd; @705
end
// &CombBeg; @706
always @( reg_gateclk_write1_en[22]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write0_en[22]
       or reg_gateclk_write3_en[22]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write2_en[22]
       or rt_recover_updt_preg[160:154]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[22])
    reg_22_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[22])
    reg_22_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[22])
    reg_22_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[22])
    reg_22_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_22_create_preg[6:0] = rt_recover_updt_preg[160:154];
// &CombEnd; @717
end
// &CombBeg; @718
always @( reg_gateclk_write0_en[23]
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write1_en[23]
       or dp_rt_inst1_dst_preg[6:0]
       or rt_recover_updt_preg[167:161]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write2_en[23]
       or reg_gateclk_write3_en[23])
begin
  if(reg_gateclk_write3_en[23])
    reg_23_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[23])
    reg_23_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[23])
    reg_23_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[23])
    reg_23_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_23_create_preg[6:0] = rt_recover_updt_preg[167:161];
// &CombEnd; @729
end
// &CombBeg; @730
always @( dp_rt_inst0_dst_preg[6:0]
       or rt_recover_updt_preg[174:168]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write0_en[24]
       or reg_gateclk_write2_en[24]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write1_en[24]
       or reg_gateclk_write3_en[24])
begin
  if(reg_gateclk_write3_en[24])
    reg_24_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[24])
    reg_24_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[24])
    reg_24_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[24])
    reg_24_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_24_create_preg[6:0] = rt_recover_updt_preg[174:168];
// &CombEnd; @741
end
// &CombBeg; @742
always @( reg_gateclk_write2_en[25]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write3_en[25]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write1_en[25]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write0_en[25]
       or rt_recover_updt_preg[181:175]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[25])
    reg_25_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[25])
    reg_25_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[25])
    reg_25_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[25])
    reg_25_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_25_create_preg[6:0] = rt_recover_updt_preg[181:175];
// &CombEnd; @753
end
// &CombBeg; @754
always @( reg_gateclk_write1_en[26]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write0_en[26]
       or rt_recover_updt_preg[188:182]
       or reg_gateclk_write3_en[26]
       or reg_gateclk_write2_en[26]
       or dp_rt_inst3_dst_preg[6:0]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[26])
    reg_26_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[26])
    reg_26_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[26])
    reg_26_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[26])
    reg_26_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_26_create_preg[6:0] = rt_recover_updt_preg[188:182];
// &CombEnd; @765
end
// &CombBeg; @766
always @( reg_gateclk_write3_en[27]
       or rt_recover_updt_preg[195:189]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write1_en[27]
       or dp_rt_inst3_dst_preg[6:0]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write0_en[27]
       or reg_gateclk_write2_en[27]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[27])
    reg_27_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[27])
    reg_27_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[27])
    reg_27_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[27])
    reg_27_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_27_create_preg[6:0] = rt_recover_updt_preg[195:189];
// &CombEnd; @777
end
// &CombBeg; @778
always @( reg_gateclk_write3_en[28]
       or reg_gateclk_write2_en[28]
       or dp_rt_inst0_dst_preg[6:0]
       or rt_recover_updt_preg[202:196]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write0_en[28]
       or reg_gateclk_write1_en[28]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[28])
    reg_28_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[28])
    reg_28_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[28])
    reg_28_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[28])
    reg_28_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_28_create_preg[6:0] = rt_recover_updt_preg[202:196];
// &CombEnd; @789
end
// &CombBeg; @790
always @( reg_gateclk_write3_en[29]
       or dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write0_en[29]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write2_en[29]
       or rt_recover_updt_preg[209:203]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write1_en[29]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[29])
    reg_29_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[29])
    reg_29_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[29])
    reg_29_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[29])
    reg_29_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_29_create_preg[6:0] = rt_recover_updt_preg[209:203];
// &CombEnd; @801
end
// &CombBeg; @802
always @( dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write3_en[30]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write1_en[30]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write0_en[30]
       or rt_recover_updt_preg[216:210]
       or dp_rt_inst2_dst_preg[6:0]
       or reg_gateclk_write2_en[30])
begin
  if(reg_gateclk_write3_en[30])
    reg_30_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[30])
    reg_30_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[30])
    reg_30_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[30])
    reg_30_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_30_create_preg[6:0] = rt_recover_updt_preg[216:210];
// &CombEnd; @813
end
// &CombBeg; @814
always @( reg_gateclk_write2_en[31]
       or dp_rt_inst0_dst_preg[6:0]
       or rt_recover_updt_preg[223:217]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write3_en[31]
       or reg_gateclk_write0_en[31]
       or reg_gateclk_write1_en[31]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[31])
    reg_31_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[31])
    reg_31_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[31])
    reg_31_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[31])
    reg_31_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_31_create_preg[6:0] = rt_recover_updt_preg[223:217];
// &CombEnd; @825
end
// &CombBeg; @826
always @( dp_rt_inst0_dst_preg[6:0]
       or reg_gateclk_write0_en[32]
       or dp_rt_inst3_dst_preg[6:0]
       or reg_gateclk_write2_en[32]
       or reg_gateclk_write3_en[32]
       or dp_rt_inst1_dst_preg[6:0]
       or reg_gateclk_write1_en[32]
       or dp_rt_inst2_dst_preg[6:0])
begin
  if(reg_gateclk_write3_en[32])
    reg_32_create_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(reg_gateclk_write2_en[32])
    reg_32_create_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(reg_gateclk_write1_en[32])
    reg_32_create_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(reg_gateclk_write0_en[32])
    reg_32_create_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    reg_32_create_preg[6:0] = 7'd0;
// &CombEnd; @837
end

//write back valid always initial as 0, except recover from pst
//ready bit always initial as 0, except recover from pst
assign r_vld = rt_recover_updt_vld;
assign reg_0_create_data[10:0]  = {1'b0,r_vld,reg_0_create_preg[6:0] ,{2{r_vld}}};
assign reg_1_create_data[10:0]  = {1'b0,r_vld,reg_1_create_preg[6:0] ,{2{r_vld}}};
assign reg_2_create_data[10:0]  = {1'b0,r_vld,reg_2_create_preg[6:0] ,{2{r_vld}}};
assign reg_3_create_data[10:0]  = {1'b0,r_vld,reg_3_create_preg[6:0] ,{2{r_vld}}};
assign reg_4_create_data[10:0]  = {1'b0,r_vld,reg_4_create_preg[6:0] ,{2{r_vld}}};
assign reg_5_create_data[10:0]  = {1'b0,r_vld,reg_5_create_preg[6:0] ,{2{r_vld}}};
assign reg_6_create_data[10:0]  = {1'b0,r_vld,reg_6_create_preg[6:0] ,{2{r_vld}}};
assign reg_7_create_data[10:0]  = {1'b0,r_vld,reg_7_create_preg[6:0] ,{2{r_vld}}};
assign reg_8_create_data[10:0]  = {1'b0,r_vld,reg_8_create_preg[6:0] ,{2{r_vld}}};
assign reg_9_create_data[10:0]  = {1'b0,r_vld,reg_9_create_preg[6:0] ,{2{r_vld}}};
assign reg_10_create_data[10:0] = {1'b0,r_vld,reg_10_create_preg[6:0],{2{r_vld}}};
assign reg_11_create_data[10:0] = {1'b0,r_vld,reg_11_create_preg[6:0],{2{r_vld}}};
assign reg_12_create_data[10:0] = {1'b0,r_vld,reg_12_create_preg[6:0],{2{r_vld}}};
assign reg_13_create_data[10:0] = {1'b0,r_vld,reg_13_create_preg[6:0],{2{r_vld}}};
assign reg_14_create_data[10:0] = {1'b0,r_vld,reg_14_create_preg[6:0],{2{r_vld}}};
assign reg_15_create_data[10:0] = {1'b0,r_vld,reg_15_create_preg[6:0],{2{r_vld}}};
assign reg_16_create_data[10:0] = {1'b0,r_vld,reg_16_create_preg[6:0],{2{r_vld}}};
assign reg_17_create_data[10:0] = {1'b0,r_vld,reg_17_create_preg[6:0],{2{r_vld}}};
assign reg_18_create_data[10:0] = {1'b0,r_vld,reg_18_create_preg[6:0],{2{r_vld}}};
assign reg_19_create_data[10:0] = {1'b0,r_vld,reg_19_create_preg[6:0],{2{r_vld}}};
assign reg_20_create_data[10:0] = {1'b0,r_vld,reg_20_create_preg[6:0],{2{r_vld}}};
assign reg_21_create_data[10:0] = {1'b0,r_vld,reg_21_create_preg[6:0],{2{r_vld}}};
assign reg_22_create_data[10:0] = {1'b0,r_vld,reg_22_create_preg[6:0],{2{r_vld}}};
assign reg_23_create_data[10:0] = {1'b0,r_vld,reg_23_create_preg[6:0],{2{r_vld}}};
assign reg_24_create_data[10:0] = {1'b0,r_vld,reg_24_create_preg[6:0],{2{r_vld}}};
assign reg_25_create_data[10:0] = {1'b0,r_vld,reg_25_create_preg[6:0],{2{r_vld}}};
assign reg_26_create_data[10:0] = {1'b0,r_vld,reg_26_create_preg[6:0],{2{r_vld}}};
assign reg_27_create_data[10:0] = {1'b0,r_vld,reg_27_create_preg[6:0],{2{r_vld}}};
assign reg_28_create_data[10:0] = {1'b0,r_vld,reg_28_create_preg[6:0],{2{r_vld}}};
assign reg_29_create_data[10:0] = {1'b0,r_vld,reg_29_create_preg[6:0],{2{r_vld}}};
assign reg_30_create_data[10:0] = {1'b0,r_vld,reg_30_create_preg[6:0],{2{r_vld}}};
assign reg_31_create_data[10:0] = {1'b0,r_vld,reg_31_create_preg[6:0],{2{r_vld}}};
assign reg_32_create_data[10:0] = {1'b0,r_vld,reg_32_create_preg[6:0],{2{r_vld}}};

//==========================================================
//                       Read Port
//==========================================================
//-----------------instruction 0 source 0-------------------
// &CombBeg; @880
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
       or dp_rt_inst0_src0_reg[5:0]
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
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_rt_inst0_src0_reg[5:0])
    6'd0   : inst0_src0_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst0_src0_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst0_src0_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst0_src0_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst0_src0_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst0_src0_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst0_src0_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst0_src0_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst0_src0_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst0_src0_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst0_src0_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst0_src0_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst0_src0_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst0_src0_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst0_src0_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst0_src0_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst0_src0_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst0_src0_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst0_src0_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst0_src0_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst0_src0_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst0_src0_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst0_src0_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst0_src0_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst0_src0_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst0_src0_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst0_src0_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst0_src0_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst0_src0_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst0_src0_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst0_src0_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst0_src0_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst0_src0_read_data[12:0] = reg_32_read_data[12:0];
    default: inst0_src0_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @917
end

assign inst0_src0_read_rdy       = inst0_src0_read_data[0];
assign inst0_src0_read_wb        = inst0_src0_read_data[1];
assign inst0_src0_read_preg[6:0] = inst0_src0_read_data[8:2];
assign inst0_src0_read_mla_rdy   = inst0_src0_read_data[9];

assign rt_dp_inst0_src0_data[0]   = inst0_src0_read_rdy
                                    || !dp_rt_inst0_src0_vld;
assign rt_dp_inst0_src0_data[1]   = inst0_src0_read_wb
                                    || !dp_rt_inst0_src0_vld;
assign rt_dp_inst0_src0_data[8:2] = inst0_src0_read_preg[6:0];

//if inst0 is mov, bypass src0 dep info to inst in same packet
assign rt_inst0_mov_dst_rdy       = inst0_src0_read_rdy;
assign rt_inst0_mov_dst_mla_rdy   = inst0_src0_read_mla_rdy;
assign rt_inst0_mov_dst_wb        = inst0_src0_read_wb;
assign rt_inst0_mov_dst_preg[6:0] = inst0_src0_read_preg[6:0];

//-----------------instruction 0 source 1-------------------
// &CombBeg; @937
always @( reg_28_read_data[12:0]
       or dp_rt_inst0_src1_reg[5:0]
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
  case (dp_rt_inst0_src1_reg[5:0])
    6'd0   : inst0_src1_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst0_src1_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst0_src1_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst0_src1_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst0_src1_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst0_src1_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst0_src1_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst0_src1_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst0_src1_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst0_src1_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst0_src1_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst0_src1_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst0_src1_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst0_src1_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst0_src1_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst0_src1_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst0_src1_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst0_src1_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst0_src1_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst0_src1_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst0_src1_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst0_src1_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst0_src1_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst0_src1_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst0_src1_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst0_src1_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst0_src1_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst0_src1_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst0_src1_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst0_src1_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst0_src1_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst0_src1_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst0_src1_read_data[12:0] = reg_32_read_data[12:0];
    default: inst0_src1_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @974
end

assign inst0_src1_read_rdy       = inst0_src1_read_data[0];
assign inst0_src1_read_wb        = inst0_src1_read_data[1];
assign inst0_src1_read_preg[6:0] = inst0_src1_read_data[8:2];

assign rt_dp_inst0_src1_data[0]   = inst0_src1_read_rdy
                                    || !dp_rt_inst0_src1_vld;
assign rt_dp_inst0_src1_data[1]   = inst0_src1_read_wb
                                    || !dp_rt_inst0_src1_vld;
assign rt_dp_inst0_src1_data[8:2] = inst0_src1_read_preg[6:0];

//---------instruction 0 src2/dest reg (for release)--------
// &CombBeg; @987
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
       or dp_rt_inst0_dst_reg[5:0]
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
  case (dp_rt_inst0_dst_reg[5:0])
    6'd0   : inst0_dst_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst0_dst_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst0_dst_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst0_dst_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst0_dst_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst0_dst_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst0_dst_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst0_dst_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst0_dst_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst0_dst_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst0_dst_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst0_dst_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst0_dst_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst0_dst_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst0_dst_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst0_dst_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst0_dst_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst0_dst_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst0_dst_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst0_dst_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst0_dst_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst0_dst_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst0_dst_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst0_dst_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst0_dst_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst0_dst_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst0_dst_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst0_dst_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst0_dst_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst0_dst_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst0_dst_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst0_dst_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst0_dst_read_data[12:0] = reg_32_read_data[12:0];
    default: inst0_dst_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1024
end

assign inst0_src2_read_rdy       = inst0_dst_read_data[0];
assign inst0_src2_read_wb        = inst0_dst_read_data[1];
assign inst0_src2_read_preg[6:0] = inst0_dst_read_data[8:2];
assign inst0_src2_read_mla_rdy   = inst0_dst_read_data[9];

assign rt_dp_inst0_src2_data[9]   = inst0_src2_read_rdy
                                    || !dp_rt_inst0_src2_vld;
assign rt_dp_inst0_src2_data[0]   = inst0_src2_read_mla_rdy
                                    && dp_rt_inst0_mla
                                    || !dp_rt_inst0_src2_vld;
assign rt_dp_inst0_src2_data[1]   = inst0_src2_read_wb
                                    || !dp_rt_inst0_src2_vld;
assign rt_dp_inst0_src2_data[8:2] = inst0_src2_read_preg[6:0];

//if dst is for implicit dependency, the rel_preg will be
//the dst preg of its result
assign rt_dp_inst0_rel_preg[6:0] = dp_rt_inst0_dst_reg[5]
                                   ? dp_rt_inst0_dst_preg[6:0]
                                   : inst0_dst_read_data[8:2];

//-----------------instruction 1 source 0-------------------
// &CombBeg; @1047
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or reg_32_read_data[12:0]
       or dp_rt_inst1_src0_reg[5:0]
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
  case (dp_rt_inst1_src0_reg[5:0])
    6'd0   : inst1_src0_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst1_src0_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst1_src0_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst1_src0_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst1_src0_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst1_src0_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst1_src0_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst1_src0_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst1_src0_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst1_src0_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst1_src0_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst1_src0_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst1_src0_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst1_src0_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst1_src0_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst1_src0_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst1_src0_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst1_src0_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst1_src0_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst1_src0_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst1_src0_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst1_src0_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst1_src0_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst1_src0_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst1_src0_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst1_src0_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst1_src0_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst1_src0_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst1_src0_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst1_src0_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst1_src0_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst1_src0_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst1_src0_read_data[12:0] = reg_32_read_data[12:0];
    default: inst1_src0_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1084
end

assign inst1_src0_read_rdy       = inst1_src0_read_data[0];
assign inst1_src0_read_wb        = inst1_src0_read_data[1];
assign inst1_src0_read_preg[6:0] = inst1_src0_read_data[8:2];
assign inst1_src0_read_mla_rdy   = inst1_src0_read_data[9];

//if source register index of instruction 0 is same with
//destination register index of instruction 1, dependency
//information is bypass from instruction 0 value
//the normal source in split instruction with implicit dependency
//should not match split destination
assign rt_inst1_src0_match_inst0 =
            ctrl_rt_inst1_vld && dp_rt_inst1_src0_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst1_src0_reg[5:0])
            && (dp_rt_inst0_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST01_SRC0_MASK];

// &CombBeg; @1103
always @( rt_inst0_mov_dst_rdy
       or rt_inst0_mov_dst_preg[6:0]
       or dp_rt_inst0_mov
       or dp_rt_inst1_src0_vld
       or inst1_src0_read_rdy
       or rt_inst0_mov_dst_wb
       or inst1_src0_read_preg[6:0]
       or dp_rt_inst0_dst_preg[6:0]
       or inst1_src0_read_wb
       or rt_inst1_src0_match_inst0)
begin
  if(rt_inst1_src0_match_inst0 && dp_rt_inst0_mov) begin
    rt_dp_inst1_src0_data[0]     = rt_inst0_mov_dst_rdy;
    rt_dp_inst1_src0_data[1]     = rt_inst0_mov_dst_wb;
    rt_dp_inst1_src0_data[8:2]   = rt_inst0_mov_dst_preg[6:0];

    rt_dp_inst01_src_match[0]    = 1'b0;
  end
  else if(rt_inst1_src0_match_inst0) begin
    rt_dp_inst1_src0_data[0]     = 1'b0;
    rt_dp_inst1_src0_data[1]     = 1'b0;
    rt_dp_inst1_src0_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst01_src_match[0]    = 1'b1;
  end
  else begin
    rt_dp_inst1_src0_data[0]     = inst1_src0_read_rdy
                                   || !dp_rt_inst1_src0_vld;
    rt_dp_inst1_src0_data[1]     = inst1_src0_read_wb
                                   || !dp_rt_inst1_src0_vld;
    rt_dp_inst1_src0_data[8:2]   = inst1_src0_read_preg[6:0];

    rt_dp_inst01_src_match[0]    = 1'b0;
  end
// &CombEnd; @1127
end

//if inst1 is mov, bypass src0 dep info to inst in same packet
// &CombBeg; @1130
always @( inst1_src0_read_rdy
       or inst1_src0_read_preg[6:0]
       or dp_rt_inst0_dst_preg[6:0]
       or inst1_src0_read_wb
       or inst1_src0_read_mla_rdy
       or rt_inst1_src0_match_inst0)
begin
  if(rt_inst1_src0_match_inst0) begin
    rt_inst1_mov_dst_rdy         = 1'b0;
    rt_inst1_mov_dst_mla_rdy     = 1'b0;
    rt_inst1_mov_dst_wb          = 1'b0;
    rt_inst1_mov_dst_preg[6:0]   = dp_rt_inst0_dst_preg[6:0];
    rt_inst1_mov_dst_match_inst0 = 1'b1;
  end
  else begin
    rt_inst1_mov_dst_rdy         = inst1_src0_read_rdy;
    rt_inst1_mov_dst_mla_rdy     = inst1_src0_read_mla_rdy;
    rt_inst1_mov_dst_wb          = inst1_src0_read_wb;
    rt_inst1_mov_dst_preg[6:0]   = inst1_src0_read_preg[6:0];
    rt_inst1_mov_dst_match_inst0 = 1'b0;
  end
// &CombEnd; @1145
end

//-----------------instruction 1 source 1-------------------
// &CombBeg; @1148
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
       or dp_rt_inst1_src1_reg[5:0]
       or reg_21_read_data[12:0]
       or reg_17_read_data[12:0]
       or reg_19_read_data[12:0]
       or reg_20_read_data[12:0]
       or reg_3_read_data[12:0]
       or reg_11_read_data[12:0]
       or reg_5_read_data[12:0]
       or reg_13_read_data[12:0])
begin
  case (dp_rt_inst1_src1_reg[5:0])
    6'd0   : inst1_src1_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst1_src1_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst1_src1_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst1_src1_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst1_src1_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst1_src1_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst1_src1_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst1_src1_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst1_src1_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst1_src1_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst1_src1_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst1_src1_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst1_src1_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst1_src1_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst1_src1_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst1_src1_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst1_src1_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst1_src1_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst1_src1_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst1_src1_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst1_src1_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst1_src1_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst1_src1_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst1_src1_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst1_src1_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst1_src1_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst1_src1_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst1_src1_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst1_src1_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst1_src1_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst1_src1_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst1_src1_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst1_src1_read_data[12:0] = reg_32_read_data[12:0];
    default: inst1_src1_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1185
end

assign inst1_src1_read_rdy       = inst1_src1_read_data[0];
assign inst1_src1_read_wb        = inst1_src1_read_data[1];
assign inst1_src1_read_preg[6:0] = inst1_src1_read_data[8:2];

//if source register index of instruction 0 is same with
//destination register index of instruction 1, dependency
//information is bypass from instruction 0 value
//the normal source in split instruction with implicit dependency
//should not match split destination
//source 1 will never be splited
assign rt_inst1_src1_match_inst0 =
            ctrl_rt_inst1_vld && dp_rt_inst1_src1_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst1_src1_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST01_SRC1_MASK];

// &CombBeg; @1204
always @( rt_inst0_mov_dst_rdy
       or rt_inst0_mov_dst_preg[6:0]
       or dp_rt_inst0_mov
       or rt_inst1_src1_match_inst0
       or inst1_src1_read_preg[6:0]
       or rt_inst0_mov_dst_wb
       or dp_rt_inst1_src1_vld
       or dp_rt_inst0_dst_preg[6:0]
       or inst1_src1_read_wb
       or inst1_src1_read_rdy)
begin
  if(rt_inst1_src1_match_inst0 && dp_rt_inst0_mov) begin
    rt_dp_inst1_src1_data[0]     = rt_inst0_mov_dst_rdy;
    rt_dp_inst1_src1_data[1]     = rt_inst0_mov_dst_wb;
    rt_dp_inst1_src1_data[8:2]   = rt_inst0_mov_dst_preg[6:0];

    rt_dp_inst01_src_match[1]    = 1'b0;
  end
  else if(rt_inst1_src1_match_inst0) begin
    rt_dp_inst1_src1_data[0]     = 1'b0;
    rt_dp_inst1_src1_data[1]     = 1'b0;
    rt_dp_inst1_src1_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst01_src_match[1]    = 1'b1;
  end
  else begin
    rt_dp_inst1_src1_data[0]     = inst1_src1_read_rdy
                                   || !dp_rt_inst1_src1_vld;
    rt_dp_inst1_src1_data[1]     = inst1_src1_read_wb
                                   || !dp_rt_inst1_src1_vld;
    rt_dp_inst1_src1_data[8:2]   = inst1_src1_read_preg[6:0];

    rt_dp_inst01_src_match[1]    = 1'b0;
  end
// &CombEnd; @1228
end

//---------instruction 1 src2/dest reg (for release)--------
// &CombBeg; @1231
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
       or dp_rt_inst1_dst_reg[5:0]
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
  case (dp_rt_inst1_dst_reg[5:0])
    6'd0   : inst1_dst_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst1_dst_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst1_dst_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst1_dst_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst1_dst_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst1_dst_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst1_dst_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst1_dst_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst1_dst_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst1_dst_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst1_dst_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst1_dst_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst1_dst_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst1_dst_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst1_dst_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst1_dst_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst1_dst_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst1_dst_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst1_dst_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst1_dst_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst1_dst_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst1_dst_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst1_dst_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst1_dst_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst1_dst_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst1_dst_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst1_dst_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst1_dst_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst1_dst_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst1_dst_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst1_dst_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst1_dst_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst1_dst_read_data[12:0] = reg_32_read_data[12:0];
    default: inst1_dst_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1268
end

assign inst1_src2_read_rdy       = inst1_dst_read_data[0];
assign inst1_src2_read_wb        = inst1_dst_read_data[1];
assign inst1_src2_read_preg[6:0] = inst1_dst_read_data[8:2];
assign inst1_src2_read_mla_rdy   = inst1_dst_read_data[9];

//if source register index of instruction 0 is same with
//destination register index of instruction 1, dependency
//information is bypass from instruction 0 value
//the normal source in split instruction with implicit dependency
//should not match split destination
//source 1 will never be splited
assign rt_inst1_src2_match_inst0 =
            ctrl_rt_inst1_vld && dp_rt_inst1_src2_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst1_dst_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0)
         && !(dp_rt_dep_info[DEP_INST01_SRC0_MASK]
           || dp_rt_dep_info[DEP_INST01_SRC1_MASK]);

// &CombBeg; @1289
always @( rt_inst0_mov_dst_rdy
       or rt_inst0_mov_dst_preg[6:0]
       or dp_rt_inst0_mov
       or dp_rt_inst1_mla
       or dp_rt_inst1_src2_vld
       or inst1_src2_read_mla_rdy
       or inst1_src2_read_wb
       or rt_inst1_src2_match_inst0
       or rt_inst0_mov_dst_wb
       or inst1_src2_read_rdy
       or inst1_src2_read_preg[6:0]
       or dp_rt_inst0_dst_preg[6:0]
       or rt_inst0_mov_dst_mla_rdy)
begin
  if(rt_inst1_src2_match_inst0 && dp_rt_inst0_mov) begin
    rt_dp_inst1_src2_data[9]     = rt_inst0_mov_dst_rdy;
    rt_dp_inst1_src2_data[0]     = rt_inst0_mov_dst_mla_rdy;
    rt_dp_inst1_src2_data[1]     = rt_inst0_mov_dst_wb;
    rt_dp_inst1_src2_data[8:2]   = rt_inst0_mov_dst_preg[6:0];

    rt_dp_inst01_src_match[2]    = 1'b0;
  end
  else if(rt_inst1_src2_match_inst0) begin
    rt_dp_inst1_src2_data[9]     = 1'b0;
    rt_dp_inst1_src2_data[0]     = 1'b0;
    rt_dp_inst1_src2_data[1]     = 1'b0;
    rt_dp_inst1_src2_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst01_src_match[2]    = 1'b1;
  end
  else begin
    rt_dp_inst1_src2_data[9]     = inst1_src2_read_rdy
                                  || !dp_rt_inst1_src2_vld;
    rt_dp_inst1_src2_data[0]     = inst1_src2_read_mla_rdy
                                   && dp_rt_inst1_mla
                                   || !dp_rt_inst1_src2_vld;
    rt_dp_inst1_src2_data[1]     = inst1_src2_read_wb
                                   || !dp_rt_inst1_src2_vld;
    rt_dp_inst1_src2_data[8:2]   = inst1_src2_read_preg[6:0];

    rt_dp_inst01_src_match[2]    = 1'b0;
  end
// &CombEnd; @1318
end

//if destination register index of instruction 0 is same with
//destination register index of instruction 1, dependency
//information is bypass from instruction 0 value
//the normal destination in split instruction with implicit dependency
//should not match split destination
//split destination should not match split/normal destination
assign rt_inst1_dst_match_inst0 =
            ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst1_dst_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0);

//if dst is for implicit dependency, the rel_preg will be
//the dst preg of its result
// &CombBeg; @1334
always @( inst1_dst_read_data[8:2]
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst1_dst_reg[5]
       or rt_inst1_dst_match_inst0)
begin
  if(dp_rt_inst1_dst_reg[5])
    rt_dp_inst1_rel_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(rt_inst1_dst_match_inst0)
    rt_dp_inst1_rel_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    rt_dp_inst1_rel_preg[6:0] = inst1_dst_read_data[8:2];
// &CombEnd; @1341
end

//-----------------instruction 2 source 0-------------------
// &CombBeg; @1344
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
       or dp_rt_inst2_src0_reg[5:0]
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
  case (dp_rt_inst2_src0_reg[5:0])
    6'd0   : inst2_src0_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst2_src0_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst2_src0_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst2_src0_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst2_src0_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst2_src0_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst2_src0_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst2_src0_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst2_src0_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst2_src0_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst2_src0_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst2_src0_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst2_src0_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst2_src0_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst2_src0_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst2_src0_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst2_src0_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst2_src0_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst2_src0_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst2_src0_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst2_src0_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst2_src0_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst2_src0_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst2_src0_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst2_src0_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst2_src0_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst2_src0_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst2_src0_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst2_src0_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst2_src0_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst2_src0_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst2_src0_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst2_src0_read_data[12:0] = reg_32_read_data[12:0];
    default: inst2_src0_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1381
end

assign inst2_src0_read_rdy       = inst2_src0_read_data[0];
assign inst2_src0_read_wb        = inst2_src0_read_data[1];
assign inst2_src0_read_preg[6:0] = inst2_src0_read_data[8:2];
assign inst2_src0_read_mla_rdy   = inst2_src0_read_data[9];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
//no implicity dependency across two insts, the split src
//can only adjacent split dest
assign rt_inst2_src0_match_inst0 =
            ctrl_rt_inst2_vld && dp_rt_inst2_src0_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst2_src0_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST02_PREG_MASK];

assign rt_inst2_src0_match_inst1 =
            ctrl_rt_inst2_vld && dp_rt_inst2_src0_vld
         && ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && (dp_rt_inst1_dst_reg[5:0] == dp_rt_inst2_src0_reg[5:0])
         && (dp_rt_inst1_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST12_SRC0_MASK];

//if inst1 dest is same with inst0 (mov) src0, inst1 may release mov src0
//before inst2 src gets mov src0 value, so disable mov bypass in this condition
assign rt_inst0_mov_bypass_over_inst1 =
            dp_rt_inst0_mov
         && !(dp_rt_inst1_dst_vld
             && (dp_rt_inst0_src0_reg[5:0] == dp_rt_inst1_dst_reg[5:0]));

// &CombBeg; @1414
always @( inst2_src0_read_preg[6:0]
       or rt_inst0_mov_dst_rdy
       or rt_inst0_mov_dst_preg[6:0]
       or dp_rt_inst1_mov
       or rt_inst2_src0_match_inst0
       or rt_inst0_mov_bypass_over_inst1
       or dp_rt_inst2_src0_vld
       or rt_inst1_mov_dst_rdy
       or rt_inst1_mov_dst_match_inst0
       or rt_inst2_src0_match_inst1
       or rt_inst0_mov_dst_wb
       or inst2_src0_read_rdy
       or rt_inst1_mov_dst_preg[6:0]
       or rt_inst1_mov_dst_wb
       or dp_rt_inst0_dst_preg[6:0]
       or inst2_src0_read_wb
       or dp_rt_inst1_dst_preg[6:0])
begin
  if(rt_inst2_src0_match_inst1 && dp_rt_inst1_mov) begin
    rt_dp_inst2_src0_data[0]     = rt_inst1_mov_dst_rdy;
    rt_dp_inst2_src0_data[1]     = rt_inst1_mov_dst_wb;
    rt_dp_inst2_src0_data[8:2]   = rt_inst1_mov_dst_preg[6:0];

    rt_dp_inst12_src_match[0]    = 1'b0;
    rt_dp_inst02_src_match[0]    = rt_inst1_mov_dst_match_inst0;
  end
  else if(rt_inst2_src0_match_inst1) begin
    rt_dp_inst2_src0_data[0]     = 1'b0;
    rt_dp_inst2_src0_data[1]     = 1'b0;
    rt_dp_inst2_src0_data[8:2]   = dp_rt_inst1_dst_preg[6:0];

    rt_dp_inst12_src_match[0]    = 1'b1;
    rt_dp_inst02_src_match[0]    = 1'b0;
  end
  else if(rt_inst2_src0_match_inst0 && rt_inst0_mov_bypass_over_inst1) begin
    rt_dp_inst2_src0_data[0]     = rt_inst0_mov_dst_rdy;
    rt_dp_inst2_src0_data[1]     = rt_inst0_mov_dst_wb;
    rt_dp_inst2_src0_data[8:2]   = rt_inst0_mov_dst_preg[6:0];

    rt_dp_inst12_src_match[0]    = 1'b0;
    rt_dp_inst02_src_match[0]    = 1'b0;
  end
  else if(rt_inst2_src0_match_inst0) begin
    rt_dp_inst2_src0_data[0]     = 1'b0;
    rt_dp_inst2_src0_data[1]     = 1'b0;
    rt_dp_inst2_src0_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst12_src_match[0]    = 1'b0;
    rt_dp_inst02_src_match[0]    = 1'b1;
  end
  else begin
    rt_dp_inst2_src0_data[0]     = inst2_src0_read_rdy
                                   || !dp_rt_inst2_src0_vld;
    rt_dp_inst2_src0_data[1]     = inst2_src0_read_wb
                                   || !dp_rt_inst2_src0_vld;
    rt_dp_inst2_src0_data[8:2]   = inst2_src0_read_preg[6:0];

    rt_dp_inst12_src_match[0]    = 1'b0;
    rt_dp_inst02_src_match[0]    = 1'b0;
  end
// &CombEnd; @1457
end

//if inst2 is mov, bypass src0 dep info to inst in same packet
// &CombBeg; @1460
always @( inst2_src0_read_preg[6:0]
       or dp_rt_inst2_dst_preg[6:0]
       or rt_inst2_src0_match_inst0
       or rt_inst2_src0_match_inst1
       or dp_rt_inst2_mov
       or inst2_src0_read_rdy
       or dp_rt_inst0_dst_preg[6:0]
       or inst2_src0_read_mla_rdy
       or inst2_src0_read_wb
       or dp_rt_inst1_dst_preg[6:0])
begin
  if(dp_rt_inst2_mov && rt_inst2_src0_match_inst1) begin
    rt_inst2_dst_rdy         = 1'b0;
    rt_inst2_dst_mla_rdy     = 1'b0;
    rt_inst2_dst_wb          = 1'b0;
    rt_inst2_dst_preg[6:0]   = dp_rt_inst1_dst_preg[6:0];

    rt_inst2_mov_match_inst0 = 1'b0;
    rt_inst2_mov_match_inst1 = 1'b1;
    rt_inst2_mov_match_inst2 = 1'b0;
  end
  else if(dp_rt_inst2_mov && rt_inst2_src0_match_inst0) begin
    rt_inst2_dst_rdy         = 1'b0;
    rt_inst2_dst_mla_rdy     = 1'b0;
    rt_inst2_dst_wb          = 1'b0;
    rt_inst2_dst_preg[6:0]   = dp_rt_inst0_dst_preg[6:0];

    rt_inst2_mov_match_inst0 = 1'b1;
    rt_inst2_mov_match_inst1 = 1'b0;
    rt_inst2_mov_match_inst2 = 1'b0;
  end
  else if(dp_rt_inst2_mov) begin  
    rt_inst2_dst_rdy         = inst2_src0_read_rdy;
    rt_inst2_dst_mla_rdy     = inst2_src0_read_mla_rdy;
    rt_inst2_dst_wb          = inst2_src0_read_wb;
    rt_inst2_dst_preg[6:0]   = inst2_src0_read_preg[6:0];

    rt_inst2_mov_match_inst0 = 1'b0;
    rt_inst2_mov_match_inst1 = 1'b0;
    rt_inst2_mov_match_inst2 = 1'b0;
  end
  else begin
    rt_inst2_dst_rdy         = 1'b0;
    rt_inst2_dst_mla_rdy     = 1'b0;
    rt_inst2_dst_wb          = 1'b0;
    rt_inst2_dst_preg[6:0]   = dp_rt_inst2_dst_preg[6:0];

    rt_inst2_mov_match_inst0 = 1'b0;
    rt_inst2_mov_match_inst1 = 1'b0;
    rt_inst2_mov_match_inst2 = 1'b1;
  end
// &CombEnd; @1501
end

//-----------------instruction 2 source 1-------------------
// &CombBeg; @1504
always @( reg_28_read_data[12:0]
       or reg_18_read_data[12:0]
       or reg_22_read_data[12:0]
       or reg_15_read_data[12:0]
       or dp_rt_inst2_src1_reg[5:0]
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
  case (dp_rt_inst2_src1_reg[5:0])
    6'd0   : inst2_src1_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst2_src1_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst2_src1_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst2_src1_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst2_src1_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst2_src1_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst2_src1_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst2_src1_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst2_src1_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst2_src1_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst2_src1_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst2_src1_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst2_src1_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst2_src1_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst2_src1_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst2_src1_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst2_src1_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst2_src1_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst2_src1_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst2_src1_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst2_src1_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst2_src1_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst2_src1_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst2_src1_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst2_src1_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst2_src1_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst2_src1_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst2_src1_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst2_src1_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst2_src1_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst2_src1_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst2_src1_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst2_src1_read_data[12:0] = reg_32_read_data[12:0];
    default: inst2_src1_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1541
end

assign inst2_src1_read_rdy       = inst2_src1_read_data[0];
assign inst2_src1_read_wb        = inst2_src1_read_data[1];
assign inst2_src1_read_preg[6:0] = inst2_src1_read_data[8:2];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
assign rt_inst2_src1_match_inst0 =
            ctrl_rt_inst2_vld && dp_rt_inst2_src1_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst2_src1_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST02_PREG_MASK];
assign rt_inst2_src1_match_inst1 =
            ctrl_rt_inst2_vld && dp_rt_inst2_src1_vld
         && ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && (dp_rt_inst1_dst_reg[5:0] == dp_rt_inst2_src1_reg[5:0])
         && (dp_rt_inst1_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST12_SRC1_MASK];

// &CombBeg; @1563
always @( rt_inst0_mov_dst_rdy
       or rt_inst0_mov_dst_preg[6:0]
       or dp_rt_inst2_src1_vld
       or dp_rt_inst1_mov
       or rt_inst0_mov_bypass_over_inst1
       or rt_inst2_src1_match_inst1
       or rt_inst1_mov_dst_rdy
       or rt_inst1_mov_dst_match_inst0
       or inst2_src1_read_wb
       or rt_inst2_src1_match_inst0
       or rt_inst0_mov_dst_wb
       or inst2_src1_read_preg[6:0]
       or rt_inst1_mov_dst_preg[6:0]
       or inst2_src1_read_rdy
       or rt_inst1_mov_dst_wb
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst1_dst_preg[6:0])
begin
  if(rt_inst2_src1_match_inst1 && dp_rt_inst1_mov) begin
    rt_dp_inst2_src1_data[0]     = rt_inst1_mov_dst_rdy;
    rt_dp_inst2_src1_data[1]     = rt_inst1_mov_dst_wb;
    rt_dp_inst2_src1_data[8:2]   = rt_inst1_mov_dst_preg[6:0];

    rt_dp_inst12_src_match[1]    = 1'b0;
    rt_dp_inst02_src_match[1]    = rt_inst1_mov_dst_match_inst0;
  end
  else if(rt_inst2_src1_match_inst1) begin
    rt_dp_inst2_src1_data[0]     = 1'b0;
    rt_dp_inst2_src1_data[1]     = 1'b0;
    rt_dp_inst2_src1_data[8:2]   = dp_rt_inst1_dst_preg[6:0];

    rt_dp_inst12_src_match[1]    = 1'b1;
    rt_dp_inst02_src_match[1]    = 1'b0;
  end
  else if(rt_inst2_src1_match_inst0 && rt_inst0_mov_bypass_over_inst1) begin
    rt_dp_inst2_src1_data[0]     = rt_inst0_mov_dst_rdy;
    rt_dp_inst2_src1_data[1]     = rt_inst0_mov_dst_wb;
    rt_dp_inst2_src1_data[8:2]   = rt_inst0_mov_dst_preg[6:0];

    rt_dp_inst12_src_match[1]    = 1'b0;
    rt_dp_inst02_src_match[1]    = 1'b0;
  end
  else if(rt_inst2_src1_match_inst0) begin
    rt_dp_inst2_src1_data[0]     = 1'b0;
    rt_dp_inst2_src1_data[1]     = 1'b0;
    rt_dp_inst2_src1_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst12_src_match[1]    = 1'b0;
    rt_dp_inst02_src_match[1]    = 1'b1;
  end
  else begin
    rt_dp_inst2_src1_data[0]     = inst2_src1_read_rdy
                                   || !dp_rt_inst2_src1_vld;
    rt_dp_inst2_src1_data[1]     = inst2_src1_read_wb
                                   || !dp_rt_inst2_src1_vld;
    rt_dp_inst2_src1_data[8:2]   = inst2_src1_read_preg[6:0];

    rt_dp_inst12_src_match[1]    = 1'b0;
    rt_dp_inst02_src_match[1]    = 1'b0;
  end
// &CombEnd; @1606
end

//---------instruction 2 src2/dest reg (for release)--------
// &CombBeg; @1609
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
       or dp_rt_inst2_dst_reg[5:0]
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
  case (dp_rt_inst2_dst_reg[5:0])
    6'd0   : inst2_dst_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst2_dst_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst2_dst_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst2_dst_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst2_dst_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst2_dst_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst2_dst_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst2_dst_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst2_dst_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst2_dst_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst2_dst_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst2_dst_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst2_dst_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst2_dst_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst2_dst_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst2_dst_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst2_dst_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst2_dst_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst2_dst_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst2_dst_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst2_dst_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst2_dst_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst2_dst_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst2_dst_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst2_dst_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst2_dst_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst2_dst_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst2_dst_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst2_dst_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst2_dst_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst2_dst_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst2_dst_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst2_dst_read_data[12:0] = reg_32_read_data[12:0];
    default: inst2_dst_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1646
end

assign inst2_src2_read_rdy       = inst2_dst_read_data[0];
assign inst2_src2_read_wb        = inst2_dst_read_data[1];
assign inst2_src2_read_preg[6:0] = inst2_dst_read_data[8:2];
assign inst2_src2_read_mla_rdy   = inst2_dst_read_data[9];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
assign rt_inst2_src2_match_inst0 =
            ctrl_rt_inst2_vld && dp_rt_inst2_src2_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst2_dst_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST02_PREG_MASK];
assign rt_inst2_src2_match_inst1 =
            ctrl_rt_inst2_vld && dp_rt_inst2_src2_vld
         && ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && (dp_rt_inst1_dst_reg[5:0] == dp_rt_inst2_dst_reg[5:0])
         && (dp_rt_inst1_dst_reg[5:0] != 6'd0)
         && !(dp_rt_dep_info[DEP_INST12_SRC0_MASK]
           || dp_rt_dep_info[DEP_INST12_SRC1_MASK]);

// &CombBeg; @1670
always @( rt_inst0_mov_dst_rdy
       or rt_inst0_mov_dst_preg[6:0]
       or inst2_src2_read_rdy
       or dp_rt_inst1_mov
       or rt_inst0_mov_bypass_over_inst1
       or rt_inst1_mov_dst_rdy
       or inst2_src2_read_preg[6:0]
       or rt_inst2_src2_match_inst1
       or rt_inst1_mov_dst_match_inst0
       or dp_rt_inst2_src2_vld
       or rt_inst0_mov_dst_wb
       or rt_inst1_mov_dst_mla_rdy
       or rt_inst2_src2_match_inst0
       or inst2_src2_read_mla_rdy
       or rt_inst1_mov_dst_preg[6:0]
       or rt_inst1_mov_dst_wb
       or dp_rt_inst0_dst_preg[6:0]
       or rt_inst0_mov_dst_mla_rdy
       or inst2_src2_read_wb
       or dp_rt_inst1_dst_preg[6:0]
       or dp_rt_inst2_mla)
begin
  if(rt_inst2_src2_match_inst1 && dp_rt_inst1_mov) begin
    rt_dp_inst2_src2_data[9]     = rt_inst1_mov_dst_rdy;
    rt_dp_inst2_src2_data[0]     = rt_inst1_mov_dst_mla_rdy;
    rt_dp_inst2_src2_data[1]     = rt_inst1_mov_dst_wb;
    rt_dp_inst2_src2_data[8:2]   = rt_inst1_mov_dst_preg[6:0];

    rt_dp_inst12_src_match[2]    = 1'b0;
    rt_dp_inst02_src_match[2]    = rt_inst1_mov_dst_match_inst0;
  end
  else if(rt_inst2_src2_match_inst1) begin
    rt_dp_inst2_src2_data[9]     = 1'b0;
    rt_dp_inst2_src2_data[0]     = 1'b0;
    rt_dp_inst2_src2_data[1]     = 1'b0;
    rt_dp_inst2_src2_data[8:2]   = dp_rt_inst1_dst_preg[6:0];

    rt_dp_inst12_src_match[2]    = 1'b1;
    rt_dp_inst02_src_match[2]    = 1'b0;
  end
  else if(rt_inst2_src2_match_inst0 && rt_inst0_mov_bypass_over_inst1) begin
    rt_dp_inst2_src2_data[9]     = rt_inst0_mov_dst_rdy;
    rt_dp_inst2_src2_data[0]     = rt_inst0_mov_dst_mla_rdy;
    rt_dp_inst2_src2_data[1]     = rt_inst0_mov_dst_wb;
    rt_dp_inst2_src2_data[8:2]   = rt_inst0_mov_dst_preg[6:0];

    rt_dp_inst12_src_match[2]    = 1'b0;
    rt_dp_inst02_src_match[2]    = 1'b0;
  end
  else if(rt_inst2_src2_match_inst0) begin
    rt_dp_inst2_src2_data[9]     = 1'b0;
    rt_dp_inst2_src2_data[0]     = 1'b0;
    rt_dp_inst2_src2_data[1]     = 1'b0;
    rt_dp_inst2_src2_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst12_src_match[2]    = 1'b0;
    rt_dp_inst02_src_match[2]    = 1'b1;
  end
  else begin
    rt_dp_inst2_src2_data[9]     = inst2_src2_read_rdy
                                   || !dp_rt_inst2_src2_vld;
    rt_dp_inst2_src2_data[0]     = inst2_src2_read_mla_rdy
                                   && dp_rt_inst2_mla
                                   || !dp_rt_inst2_src2_vld;
    rt_dp_inst2_src2_data[1]     = inst2_src2_read_wb
                                   || !dp_rt_inst2_src2_vld;
    rt_dp_inst2_src2_data[8:2]   = inst2_src2_read_preg[6:0];

    rt_dp_inst12_src_match[2]    = 1'b0;
    rt_dp_inst02_src_match[2]    = 1'b0;
  end
// &CombEnd; @1720
end

//source register dependency information may bypass from
//older instruction that are in the same packet
//normal destination should not match split destination
//split destination should not match split/normal destination
assign rt_inst2_dst_match_inst0 =
            ctrl_rt_inst2_vld && dp_rt_inst2_dst_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst2_dst_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0);
assign rt_inst2_dst_match_inst1 =
            ctrl_rt_inst2_vld && dp_rt_inst2_dst_vld
         && ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && (dp_rt_inst1_dst_reg[5:0] == dp_rt_inst2_dst_reg[5:0])
         && (dp_rt_inst1_dst_reg[5:0] != 6'd0);

// &CombBeg; @1737
always @( rt_inst2_dst_match_inst1
       or dp_rt_inst2_dst_preg[6:0]
       or inst2_dst_read_data[8:2]
       or rt_inst2_dst_match_inst0
       or dp_rt_inst2_dst_reg[5]
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst1_dst_preg[6:0])
begin
  if(dp_rt_inst2_dst_reg[5])
    rt_dp_inst2_rel_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(rt_inst2_dst_match_inst1)
    rt_dp_inst2_rel_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(rt_inst2_dst_match_inst0)
    rt_dp_inst2_rel_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    rt_dp_inst2_rel_preg[6:0] = inst2_dst_read_data[8:2];
// &CombEnd; @1746
end

//-----------------instruction 3 source 0-------------------
// &CombBeg; @1749
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
       or dp_rt_inst3_src0_reg[5:0]
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
  case (dp_rt_inst3_src0_reg[5:0])
    6'd0   : inst3_src0_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst3_src0_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst3_src0_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst3_src0_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst3_src0_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst3_src0_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst3_src0_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst3_src0_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst3_src0_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst3_src0_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst3_src0_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst3_src0_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst3_src0_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst3_src0_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst3_src0_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst3_src0_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst3_src0_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst3_src0_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst3_src0_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst3_src0_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst3_src0_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst3_src0_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst3_src0_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst3_src0_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst3_src0_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst3_src0_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst3_src0_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst3_src0_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst3_src0_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst3_src0_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst3_src0_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst3_src0_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst3_src0_read_data[12:0] = reg_32_read_data[12:0];
    default: inst3_src0_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1786
end

assign inst3_src0_read_rdy       = inst3_src0_read_data[0];
assign inst3_src0_read_wb        = inst3_src0_read_data[1];
assign inst3_src0_read_preg[6:0] = inst3_src0_read_data[8:2];

//source register dependency information may bypass from
//older instruction that are in the same packet
//the normal source in split instruction with implicit dependency
//should not match split destination
//no implicity dependency across two insts, the split src
//can only adjacent split dest

assign rt_inst3_src0_match_inst0 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src0_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst3_src0_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0);
assign rt_inst3_src0_match_inst1 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src0_vld
         && ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && (dp_rt_inst1_dst_reg[5:0] == dp_rt_inst3_src0_reg[5:0])
         && (dp_rt_inst1_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST13_PREG_MASK];
assign rt_inst3_src0_match_inst2 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src0_vld
         && ctrl_rt_inst2_vld && dp_rt_inst2_dst_vld
         && (dp_rt_inst2_dst_reg[5:0] == dp_rt_inst3_src0_reg[5:0])
         && (dp_rt_inst2_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST23_SRC0_MASK];

////if inst2 dest is same with inst0 (mov) src0, inst2 may release mov src0
////before inst3 src gets mov src0 value, so disable mov bypass in this condition
//assign rt_inst0_mov_bypass_over_inst2 =
//            dp_rt_inst0_mov
//         && !(dp_rt_inst2_dst_vld
//             && (dp_rt_inst0_src0_reg[5:0] == dp_rt_inst2_dst_reg[5:0]));
//
////if inst2 dest is same with inst1 (mov) src0, inst2 may release mov src0
////before inst3 src gets mov src0 value, so disable mov bypass in this condition
//assign rt_inst1_mov_bypass_over_inst2 =
//            dp_rt_inst1_mov
//         && !(dp_rt_inst2_dst_vld
//             && (dp_rt_inst1_src0_reg[5:0] == dp_rt_inst2_dst_reg[5:0]));

// &CombBeg; @1831
always @( inst3_src0_read_rdy
       or rt_inst2_dst_wb
       or dp_rt_inst3_src0_vld
       or rt_inst2_mov_match_inst0
       or inst3_src0_read_wb
       or rt_inst2_mov_match_inst1
       or rt_inst3_src0_match_inst1
       or rt_inst3_src0_match_inst0
       or rt_inst2_dst_preg[6:0]
       or rt_inst2_dst_rdy
       or dp_rt_inst0_dst_preg[6:0]
       or rt_inst3_src0_match_inst2
       or dp_rt_inst1_dst_preg[6:0]
       or inst3_src0_read_preg[6:0]
       or rt_inst2_mov_match_inst2)
begin
  if(rt_inst3_src0_match_inst2) begin
    rt_dp_inst3_src0_data[0]     = rt_inst2_dst_rdy;
    rt_dp_inst3_src0_data[1]     = rt_inst2_dst_wb;
    rt_dp_inst3_src0_data[8:2]   = rt_inst2_dst_preg[6:0];

    rt_dp_inst23_src_match[0]    = rt_inst2_mov_match_inst2;
    rt_dp_inst13_src_match[0]    = rt_inst2_mov_match_inst1;
    rt_dp_inst03_src_match[0]    = rt_inst2_mov_match_inst0;
  end
//  else if(rt_inst3_src0_match_inst1 && rt_inst1_mov_bypass_over_inst2) begin
//    rt_dp_inst3_src0_data[0]     = rt_inst1_mov_dst_rdy;
//    rt_dp_inst3_src0_data[1]     = rt_inst1_mov_dst_wb;
//    rt_dp_inst3_src0_data[8:2]   = rt_inst1_mov_dst_preg[6:0];
//  end
  else if(rt_inst3_src0_match_inst1) begin
    rt_dp_inst3_src0_data[0]     = 1'b0;
    rt_dp_inst3_src0_data[1]     = 1'b0;
    rt_dp_inst3_src0_data[8:2]   = dp_rt_inst1_dst_preg[6:0];

    rt_dp_inst23_src_match[0]    = 1'b0;
    rt_dp_inst13_src_match[0]    = 1'b1;
    rt_dp_inst03_src_match[0]    = 1'b0;
  end
//  else if(rt_inst3_src0_match_inst0 && rt_inst0_mov_bypass_over_inst1
//                                    && rt_inst0_mov_bypass_over_inst2)
//    rt_dp_inst3_src0_data[0]     = rt_inst0_mov_dst_rdy;
//    rt_dp_inst3_src0_data[1]     = rt_inst0_mov_dst_wb;
//    rt_dp_inst3_src0_data[8:2]   = rt_inst0_mov_dst_preg[6:0];
//  end
  else if(rt_inst3_src0_match_inst0) begin
    rt_dp_inst3_src0_data[0]     = 1'b0;
    rt_dp_inst3_src0_data[1]     = 1'b0;
    rt_dp_inst3_src0_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst23_src_match[0]    = 1'b0;
    rt_dp_inst13_src_match[0]    = 1'b0;
    rt_dp_inst03_src_match[0]    = 1'b1;
  end
  else begin
    rt_dp_inst3_src0_data[0]     = inst3_src0_read_rdy
                                 || !dp_rt_inst3_src0_vld;
    rt_dp_inst3_src0_data[1]     = inst3_src0_read_wb
                                 || !dp_rt_inst3_src0_vld;
    rt_dp_inst3_src0_data[8:2]   = inst3_src0_read_preg[6:0];

    rt_dp_inst23_src_match[0]    = 1'b0;
    rt_dp_inst13_src_match[0]    = 1'b0;
    rt_dp_inst03_src_match[0]    = 1'b0;
  end
// &CombEnd; @1881
end

//-----------------instruction 3 source 1-------------------
// &CombBeg; @1884
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
       or dp_rt_inst3_src1_reg[5:0]
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
  case (dp_rt_inst3_src1_reg[5:0])
    6'd0   : inst3_src1_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst3_src1_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst3_src1_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst3_src1_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst3_src1_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst3_src1_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst3_src1_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst3_src1_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst3_src1_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst3_src1_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst3_src1_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst3_src1_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst3_src1_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst3_src1_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst3_src1_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst3_src1_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst3_src1_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst3_src1_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst3_src1_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst3_src1_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst3_src1_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst3_src1_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst3_src1_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst3_src1_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst3_src1_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst3_src1_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst3_src1_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst3_src1_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst3_src1_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst3_src1_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst3_src1_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst3_src1_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst3_src1_read_data[12:0] = reg_32_read_data[12:0];
    default: inst3_src1_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @1921
end

assign inst3_src1_read_rdy       = inst3_src1_read_data[0];
assign inst3_src1_read_wb        = inst3_src1_read_data[1];
assign inst3_src1_read_preg[6:0] = inst3_src1_read_data[8:2];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
assign rt_inst3_src1_match_inst0 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src1_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst3_src1_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0);
assign rt_inst3_src1_match_inst1 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src1_vld
         && ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && (dp_rt_inst1_dst_reg[5:0] == dp_rt_inst3_src1_reg[5:0])
         && (dp_rt_inst1_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST13_PREG_MASK];
assign rt_inst3_src1_match_inst2 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src1_vld
         && ctrl_rt_inst2_vld && dp_rt_inst2_dst_vld
         && (dp_rt_inst2_dst_reg[5:0] == dp_rt_inst3_src1_reg[5:0])
         && (dp_rt_inst2_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST23_SRC1_MASK];

// &CombBeg; @1948
always @( rt_inst3_src1_match_inst2
       or dp_rt_inst3_src1_vld
       or rt_inst2_dst_wb
       or rt_inst2_mov_match_inst0
       or rt_inst2_mov_match_inst1
       or rt_inst3_src1_match_inst0
       or rt_inst2_dst_preg[6:0]
       or inst3_src1_read_wb
       or rt_inst2_dst_rdy
       or dp_rt_inst0_dst_preg[6:0]
       or inst3_src1_read_preg[6:0]
       or rt_inst3_src1_match_inst1
       or inst3_src1_read_rdy
       or dp_rt_inst1_dst_preg[6:0]
       or rt_inst2_mov_match_inst2)
begin
  if(rt_inst3_src1_match_inst2) begin
    rt_dp_inst3_src1_data[0]     = rt_inst2_dst_rdy;
    rt_dp_inst3_src1_data[1]     = rt_inst2_dst_wb;
    rt_dp_inst3_src1_data[8:2]   = rt_inst2_dst_preg[6:0];

    rt_dp_inst23_src_match[1]    = rt_inst2_mov_match_inst2;
    rt_dp_inst13_src_match[1]    = rt_inst2_mov_match_inst1;
    rt_dp_inst03_src_match[1]    = rt_inst2_mov_match_inst0;
  end
//  else if(rt_inst3_src1_match_inst1 && rt_inst1_mov_bypass_over_inst2) begin
//    rt_dp_inst3_src1_data[0]     = rt_inst1_mov_dst_rdy;
//    rt_dp_inst3_src1_data[1]     = rt_inst1_mov_dst_wb;
//    rt_dp_inst3_src1_data[8:2]   = rt_inst1_mov_dst_preg[6:0];
//  end
  else if(rt_inst3_src1_match_inst1) begin
    rt_dp_inst3_src1_data[0]     = 1'b0;
    rt_dp_inst3_src1_data[1]     = 1'b0;
    rt_dp_inst3_src1_data[8:2]   = dp_rt_inst1_dst_preg[6:0];

    rt_dp_inst23_src_match[1]    = 1'b0;
    rt_dp_inst13_src_match[1]    = 1'b1;
    rt_dp_inst03_src_match[1]    = 1'b0;
  end
//  else if(rt_inst3_src1_match_inst0 && rt_inst0_mov_bypass_over_inst1
//                                    && rt_inst0_mov_bypass_over_inst2)
//    rt_dp_inst3_src1_data[0]     = rt_inst0_mov_dst_rdy;
//    rt_dp_inst3_src1_data[1]     = rt_inst0_mov_dst_wb;
//    rt_dp_inst3_src1_data[8:2]   = rt_inst0_mov_dst_preg[6:0];
//  end
  else if(rt_inst3_src1_match_inst0) begin
    rt_dp_inst3_src1_data[0]     = 1'b0;
    rt_dp_inst3_src1_data[1]     = 1'b0;
    rt_dp_inst3_src1_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst23_src_match[1]    = 1'b0;
    rt_dp_inst13_src_match[1]    = 1'b0;
    rt_dp_inst03_src_match[1]    = 1'b1;
  end
  else begin
    rt_dp_inst3_src1_data[0]     = inst3_src1_read_rdy
                                 || !dp_rt_inst3_src1_vld;
    rt_dp_inst3_src1_data[1]     = inst3_src1_read_wb
                                 || !dp_rt_inst3_src1_vld;
    rt_dp_inst3_src1_data[8:2]   = inst3_src1_read_preg[6:0];

    rt_dp_inst23_src_match[1]    = 1'b0;
    rt_dp_inst13_src_match[1]    = 1'b0;
    rt_dp_inst03_src_match[1]    = 1'b0;
  end
// &CombEnd; @1998
end

//---------instruction 3 src2/dest reg (for release)--------
// &CombBeg; @2001
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
       or dp_rt_inst3_dst_reg[5:0]
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
  case (dp_rt_inst3_dst_reg[5:0])
    6'd0   : inst3_dst_read_data[12:0] = reg_0_read_data[12:0];
    6'd1   : inst3_dst_read_data[12:0] = reg_1_read_data[12:0];
    6'd2   : inst3_dst_read_data[12:0] = reg_2_read_data[12:0];
    6'd3   : inst3_dst_read_data[12:0] = reg_3_read_data[12:0];
    6'd4   : inst3_dst_read_data[12:0] = reg_4_read_data[12:0];
    6'd5   : inst3_dst_read_data[12:0] = reg_5_read_data[12:0];
    6'd6   : inst3_dst_read_data[12:0] = reg_6_read_data[12:0];
    6'd7   : inst3_dst_read_data[12:0] = reg_7_read_data[12:0];
    6'd8   : inst3_dst_read_data[12:0] = reg_8_read_data[12:0];
    6'd9   : inst3_dst_read_data[12:0] = reg_9_read_data[12:0];
    6'd10  : inst3_dst_read_data[12:0] = reg_10_read_data[12:0];
    6'd11  : inst3_dst_read_data[12:0] = reg_11_read_data[12:0];
    6'd12  : inst3_dst_read_data[12:0] = reg_12_read_data[12:0];
    6'd13  : inst3_dst_read_data[12:0] = reg_13_read_data[12:0];
    6'd14  : inst3_dst_read_data[12:0] = reg_14_read_data[12:0];
    6'd15  : inst3_dst_read_data[12:0] = reg_15_read_data[12:0];
    6'd16  : inst3_dst_read_data[12:0] = reg_16_read_data[12:0];
    6'd17  : inst3_dst_read_data[12:0] = reg_17_read_data[12:0];
    6'd18  : inst3_dst_read_data[12:0] = reg_18_read_data[12:0];
    6'd19  : inst3_dst_read_data[12:0] = reg_19_read_data[12:0];
    6'd20  : inst3_dst_read_data[12:0] = reg_20_read_data[12:0];
    6'd21  : inst3_dst_read_data[12:0] = reg_21_read_data[12:0];
    6'd22  : inst3_dst_read_data[12:0] = reg_22_read_data[12:0];
    6'd23  : inst3_dst_read_data[12:0] = reg_23_read_data[12:0];
    6'd24  : inst3_dst_read_data[12:0] = reg_24_read_data[12:0];
    6'd25  : inst3_dst_read_data[12:0] = reg_25_read_data[12:0];
    6'd26  : inst3_dst_read_data[12:0] = reg_26_read_data[12:0];
    6'd27  : inst3_dst_read_data[12:0] = reg_27_read_data[12:0];
    6'd28  : inst3_dst_read_data[12:0] = reg_28_read_data[12:0];
    6'd29  : inst3_dst_read_data[12:0] = reg_29_read_data[12:0];
    6'd30  : inst3_dst_read_data[12:0] = reg_30_read_data[12:0];
    6'd31  : inst3_dst_read_data[12:0] = reg_31_read_data[12:0];
    6'd32  : inst3_dst_read_data[12:0] = reg_32_read_data[12:0];
    default: inst3_dst_read_data[12:0] = {13{1'bx}};
  endcase
// &CombEnd; @2038
end

assign inst3_src2_read_rdy       = inst3_dst_read_data[0];
assign inst3_src2_read_wb        = inst3_dst_read_data[1];
assign inst3_src2_read_preg[6:0] = inst3_dst_read_data[8:2];
assign inst3_src2_read_mla_rdy   = inst3_dst_read_data[9];

//source register dependency information may bypass from
//older instruction that are in the same packet
//source will never be splited
assign rt_inst3_src2_match_inst0 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src2_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst3_dst_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0);
assign rt_inst3_src2_match_inst1 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src2_vld
         && ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && (dp_rt_inst1_dst_reg[5:0] == dp_rt_inst3_dst_reg[5:0])
         && (dp_rt_inst1_dst_reg[5:0] != 6'd0)
         && !dp_rt_dep_info[DEP_INST13_PREG_MASK];
assign rt_inst3_src2_match_inst2 =
            ctrl_rt_inst3_vld && dp_rt_inst3_src2_vld
         && ctrl_rt_inst2_vld && dp_rt_inst2_dst_vld
         && (dp_rt_inst2_dst_reg[5:0] == dp_rt_inst3_dst_reg[5:0])
         && (dp_rt_inst2_dst_reg[5:0] != 6'd0)
         && !(dp_rt_dep_info[DEP_INST23_SRC0_MASK] 
           || dp_rt_dep_info[DEP_INST23_SRC1_MASK]);

// &CombBeg; @2067
always @( dp_rt_inst3_src2_vld
       or dp_rt_inst3_mla
       or inst3_src2_read_rdy
       or rt_inst2_dst_mla_rdy
       or rt_inst2_dst_wb
       or rt_inst2_mov_match_inst0
       or rt_inst3_src2_match_inst1
       or inst3_src2_read_wb
       or rt_inst3_src2_match_inst2
       or rt_inst2_mov_match_inst1
       or inst3_src2_read_preg[6:0]
       or rt_inst3_src2_match_inst0
       or rt_inst2_dst_preg[6:0]
       or rt_inst2_dst_rdy
       or inst3_src2_read_mla_rdy
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst1_dst_preg[6:0]
       or rt_inst2_mov_match_inst2)
begin
  if(rt_inst3_src2_match_inst2) begin
    rt_dp_inst3_src2_data[9]     = rt_inst2_dst_rdy;
    rt_dp_inst3_src2_data[0]     = rt_inst2_dst_mla_rdy;
    rt_dp_inst3_src2_data[1]     = rt_inst2_dst_wb;
    rt_dp_inst3_src2_data[8:2]   = rt_inst2_dst_preg[6:0];

    rt_dp_inst23_src_match[2]    = rt_inst2_mov_match_inst2;
    rt_dp_inst13_src_match[2]    = rt_inst2_mov_match_inst1;
    rt_dp_inst03_src_match[2]    = rt_inst2_mov_match_inst0;
  end
//  else if(rt_inst3_src2_match_inst1 && rt_inst1_mov_bypass_over_inst2) begin
//    rt_dp_inst3_src2_data[9]     = rt_inst1_mov_dst_rdy;
//    rt_dp_inst3_src2_data[0]     = rt_inst1_mov_dst_mla_rdy;
//    rt_dp_inst3_src2_data[1]     = rt_inst1_mov_dst_wb;
//    rt_dp_inst3_src2_data[8:2]   = rt_inst1_mov_dst_preg[6:0];
//  end
  else if(rt_inst3_src2_match_inst1) begin
    rt_dp_inst3_src2_data[9]     = 1'b0;
    rt_dp_inst3_src2_data[0]     = 1'b0;
    rt_dp_inst3_src2_data[1]     = 1'b0;
    rt_dp_inst3_src2_data[8:2]   = dp_rt_inst1_dst_preg[6:0];

    rt_dp_inst23_src_match[2]    = 1'b0;
    rt_dp_inst13_src_match[2]    = 1'b1;
    rt_dp_inst03_src_match[2]    = 1'b0;
  end
//  else if(rt_inst3_src2_match_inst0 && rt_inst0_mov_bypass_over_inst1
//                                    && rt_inst0_mov_bypass_over_inst2)
//    rt_dp_inst3_src2_data[9]     = rt_inst0_mov_dst_rdy;
//    rt_dp_inst3_src2_data[0]     = rt_inst0_mov_dst_mla_rdy;
//    rt_dp_inst3_src2_data[1]     = rt_inst0_mov_dst_wb;
//    rt_dp_inst3_src2_data[8:2]   = rt_inst0_mov_dst_preg[6:0];
//  end
  else if(rt_inst3_src2_match_inst0) begin
    rt_dp_inst3_src2_data[9]     = 1'b0;
    rt_dp_inst3_src2_data[0]     = 1'b0;
    rt_dp_inst3_src2_data[1]     = 1'b0;
    rt_dp_inst3_src2_data[8:2]   = dp_rt_inst0_dst_preg[6:0];

    rt_dp_inst23_src_match[2]    = 1'b0;
    rt_dp_inst13_src_match[2]    = 1'b0;
    rt_dp_inst03_src_match[2]    = 1'b1;
  end
  else begin
    rt_dp_inst3_src2_data[9]     = inst3_src2_read_rdy
                                   || !dp_rt_inst3_src2_vld;
    rt_dp_inst3_src2_data[0]     = inst3_src2_read_mla_rdy
                                   && dp_rt_inst3_mla
                                   || !dp_rt_inst3_src2_vld;
    rt_dp_inst3_src2_data[1]     = inst3_src2_read_wb
                                   || !dp_rt_inst3_src2_vld;
    rt_dp_inst3_src2_data[8:2]   = inst3_src2_read_preg[6:0];

    rt_dp_inst23_src_match[2]    = 1'b0;
    rt_dp_inst13_src_match[2]    = 1'b0;
    rt_dp_inst03_src_match[2]    = 1'b0;
  end
// &CombEnd; @2125
end

//source register dependency information may bypass from
//older instruction that are in the same packet
//normal destination should not match split destination
//inst3 cannot be split dst
assign rt_inst3_dst_match_inst0 =
            ctrl_rt_inst3_vld && dp_rt_inst3_dst_vld
         && ctrl_rt_inst0_vld && dp_rt_inst0_dst_vld
         && (dp_rt_inst0_dst_reg[5:0] == dp_rt_inst3_dst_reg[5:0])
         && (dp_rt_inst0_dst_reg[5:0] != 6'd0);
assign rt_inst3_dst_match_inst1 =
            ctrl_rt_inst3_vld && dp_rt_inst3_dst_vld
         && ctrl_rt_inst1_vld && dp_rt_inst1_dst_vld
         && (dp_rt_inst1_dst_reg[5:0] == dp_rt_inst3_dst_reg[5:0])
         && (dp_rt_inst1_dst_reg[5:0] != 6'd0);
assign rt_inst3_dst_match_inst2 =
            ctrl_rt_inst3_vld && dp_rt_inst3_dst_vld
         && ctrl_rt_inst2_vld && dp_rt_inst2_dst_vld
         && (dp_rt_inst2_dst_reg[5:0] == dp_rt_inst3_dst_reg[5:0])
         && (dp_rt_inst2_dst_reg[5:0] != 6'd0);

// &CombBeg; @2147
always @( rt_inst3_dst_match_inst0
       or rt_inst3_dst_match_inst2
       or dp_rt_inst2_dst_preg[6:0]
       or rt_inst3_dst_match_inst1
       or dp_rt_inst3_dst_preg[6:0]
       or dp_rt_inst0_dst_preg[6:0]
       or dp_rt_inst3_dst_reg[5]
       or inst3_dst_read_data[8:2]
       or dp_rt_inst1_dst_preg[6:0])
begin
  if(dp_rt_inst3_dst_reg[5])
    rt_dp_inst3_rel_preg[6:0] = dp_rt_inst3_dst_preg[6:0];
  else if(rt_inst3_dst_match_inst2)
    rt_dp_inst3_rel_preg[6:0] = dp_rt_inst2_dst_preg[6:0];
  else if(rt_inst3_dst_match_inst1)
    rt_dp_inst3_rel_preg[6:0] = dp_rt_inst1_dst_preg[6:0];
  else if(rt_inst3_dst_match_inst0)
    rt_dp_inst3_rel_preg[6:0] = dp_rt_inst0_dst_preg[6:0];
  else
    rt_dp_inst3_rel_preg[6:0] = inst3_dst_read_data[8:2];
// &CombEnd; @2158
end

// &ModuleEnd; @2160
endmodule


