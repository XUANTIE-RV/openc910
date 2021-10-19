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

// &ModuleBeg; @28
module ct_rtu_pst_preg(
  cp0_rtu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_rtu_ir_preg0_alloc_vld,
  idu_rtu_ir_preg1_alloc_vld,
  idu_rtu_ir_preg2_alloc_vld,
  idu_rtu_ir_preg3_alloc_vld,
  idu_rtu_ir_preg_alloc_gateclk_vld,
  idu_rtu_pst_dis_inst0_dst_reg,
  idu_rtu_pst_dis_inst0_preg,
  idu_rtu_pst_dis_inst0_preg_iid,
  idu_rtu_pst_dis_inst0_preg_vld,
  idu_rtu_pst_dis_inst0_rel_preg,
  idu_rtu_pst_dis_inst1_dst_reg,
  idu_rtu_pst_dis_inst1_preg,
  idu_rtu_pst_dis_inst1_preg_iid,
  idu_rtu_pst_dis_inst1_preg_vld,
  idu_rtu_pst_dis_inst1_rel_preg,
  idu_rtu_pst_dis_inst2_dst_reg,
  idu_rtu_pst_dis_inst2_preg,
  idu_rtu_pst_dis_inst2_preg_iid,
  idu_rtu_pst_dis_inst2_preg_vld,
  idu_rtu_pst_dis_inst2_rel_preg,
  idu_rtu_pst_dis_inst3_dst_reg,
  idu_rtu_pst_dis_inst3_preg,
  idu_rtu_pst_dis_inst3_preg_iid,
  idu_rtu_pst_dis_inst3_preg_vld,
  idu_rtu_pst_dis_inst3_rel_preg,
  idu_rtu_pst_preg_dealloc_mask,
  ifu_xx_sync_reset,
  iu_rtu_ex2_pipe0_wb_preg_expand,
  iu_rtu_ex2_pipe0_wb_preg_vld,
  iu_rtu_ex2_pipe1_wb_preg_expand,
  iu_rtu_ex2_pipe1_wb_preg_vld,
  lsu_rtu_wb_pipe3_wb_preg_expand,
  lsu_rtu_wb_pipe3_wb_preg_vld,
  pad_yy_icg_scan_en,
  pst_retire_retired_reg_wb,
  pst_retired_ereg_wb,
  pst_retired_freg_wb,
  pst_retired_vreg_wb,
  pst_top_retired_reg_wb,
  retire_pst_async_flush,
  retire_pst_wb_retire_inst0_preg_vld,
  retire_pst_wb_retire_inst1_preg_vld,
  retire_pst_wb_retire_inst2_preg_vld,
  rob_pst_retire_inst0_gateclk_vld,
  rob_pst_retire_inst0_iid_updt_val,
  rob_pst_retire_inst1_gateclk_vld,
  rob_pst_retire_inst1_iid_updt_val,
  rob_pst_retire_inst2_gateclk_vld,
  rob_pst_retire_inst2_iid_updt_val,
  rtu_had_inst_not_wb,
  rtu_idu_alloc_preg0,
  rtu_idu_alloc_preg0_vld,
  rtu_idu_alloc_preg1,
  rtu_idu_alloc_preg1_vld,
  rtu_idu_alloc_preg2,
  rtu_idu_alloc_preg2_vld,
  rtu_idu_alloc_preg3,
  rtu_idu_alloc_preg3_vld,
  rtu_idu_pst_empty,
  rtu_idu_rt_recover_preg,
  rtu_yy_xx_flush
);

// &Ports; @29
input            cp0_rtu_icg_en;                     
input            cp0_yy_clk_en;                      
input            cpurst_b;                           
input            forever_cpuclk;                     
input            idu_rtu_ir_preg0_alloc_vld;         
input            idu_rtu_ir_preg1_alloc_vld;         
input            idu_rtu_ir_preg2_alloc_vld;         
input            idu_rtu_ir_preg3_alloc_vld;         
input            idu_rtu_ir_preg_alloc_gateclk_vld;  
input   [4  :0]  idu_rtu_pst_dis_inst0_dst_reg;      
input   [6  :0]  idu_rtu_pst_dis_inst0_preg;         
input   [6  :0]  idu_rtu_pst_dis_inst0_preg_iid;     
input            idu_rtu_pst_dis_inst0_preg_vld;     
input   [6  :0]  idu_rtu_pst_dis_inst0_rel_preg;     
input   [4  :0]  idu_rtu_pst_dis_inst1_dst_reg;      
input   [6  :0]  idu_rtu_pst_dis_inst1_preg;         
input   [6  :0]  idu_rtu_pst_dis_inst1_preg_iid;     
input            idu_rtu_pst_dis_inst1_preg_vld;     
input   [6  :0]  idu_rtu_pst_dis_inst1_rel_preg;     
input   [4  :0]  idu_rtu_pst_dis_inst2_dst_reg;      
input   [6  :0]  idu_rtu_pst_dis_inst2_preg;         
input   [6  :0]  idu_rtu_pst_dis_inst2_preg_iid;     
input            idu_rtu_pst_dis_inst2_preg_vld;     
input   [6  :0]  idu_rtu_pst_dis_inst2_rel_preg;     
input   [4  :0]  idu_rtu_pst_dis_inst3_dst_reg;      
input   [6  :0]  idu_rtu_pst_dis_inst3_preg;         
input   [6  :0]  idu_rtu_pst_dis_inst3_preg_iid;     
input            idu_rtu_pst_dis_inst3_preg_vld;     
input   [6  :0]  idu_rtu_pst_dis_inst3_rel_preg;     
input   [95 :0]  idu_rtu_pst_preg_dealloc_mask;      
input            ifu_xx_sync_reset;                  
input   [95 :0]  iu_rtu_ex2_pipe0_wb_preg_expand;    
input            iu_rtu_ex2_pipe0_wb_preg_vld;       
input   [95 :0]  iu_rtu_ex2_pipe1_wb_preg_expand;    
input            iu_rtu_ex2_pipe1_wb_preg_vld;       
input   [95 :0]  lsu_rtu_wb_pipe3_wb_preg_expand;    
input            lsu_rtu_wb_pipe3_wb_preg_vld;       
input            pad_yy_icg_scan_en;                 
input            pst_retired_ereg_wb;                
input            pst_retired_freg_wb;                
input            pst_retired_vreg_wb;                
input            retire_pst_async_flush;             
input            retire_pst_wb_retire_inst0_preg_vld; 
input            retire_pst_wb_retire_inst1_preg_vld; 
input            retire_pst_wb_retire_inst2_preg_vld; 
input            rob_pst_retire_inst0_gateclk_vld;   
input   [6  :0]  rob_pst_retire_inst0_iid_updt_val;  
input            rob_pst_retire_inst1_gateclk_vld;   
input   [6  :0]  rob_pst_retire_inst1_iid_updt_val;  
input            rob_pst_retire_inst2_gateclk_vld;   
input   [6  :0]  rob_pst_retire_inst2_iid_updt_val;  
input            rtu_yy_xx_flush;                    
output           pst_retire_retired_reg_wb;          
output  [2  :0]  pst_top_retired_reg_wb;             
output           rtu_had_inst_not_wb;                
output  [6  :0]  rtu_idu_alloc_preg0;                
output           rtu_idu_alloc_preg0_vld;            
output  [6  :0]  rtu_idu_alloc_preg1;                
output           rtu_idu_alloc_preg1_vld;            
output  [6  :0]  rtu_idu_alloc_preg2;                
output           rtu_idu_alloc_preg2_vld;            
output  [6  :0]  rtu_idu_alloc_preg3;                
output           rtu_idu_alloc_preg3_vld;            
output           rtu_idu_pst_empty;                  
output  [223:0]  rtu_idu_rt_recover_preg;            

// &Regs; @30
reg     [6  :0]  alloc_preg0;                        
reg              alloc_preg0_vld;                    
reg     [6  :0]  alloc_preg1;                        
reg              alloc_preg1_vld;                    
reg     [6  :0]  alloc_preg2;                        
reg              alloc_preg2_vld;                    
reg     [6  :0]  alloc_preg3;                        
reg              alloc_preg3_vld;                    
reg     [95 :0]  dealloc3_vec;                       
reg     [6  :0]  dealloc_preg3;                      

// &Wires; @31
wire             alloc_preg0_invalid;                
wire             alloc_preg1_invalid;                
wire             alloc_preg2_invalid;                
wire             alloc_preg3_dealloc_vld;            
wire             alloc_preg3_invalid;                
wire             alloc_preg_clk;                     
wire             alloc_preg_clk_en;                  
wire             cp0_rtu_icg_en;                     
wire             cp0_yy_clk_en;                      
wire             cpurst_b;                           
wire    [95 :0]  d0_preg;                            
wire    [95 :0]  d1_preg;                            
wire    [95 :0]  d2_preg;                            
wire    [95 :0]  d3_preg;                            
wire    [95 :0]  dealloc;                            
wire    [95 :0]  dealloc0;                           
wire    [95 :0]  dealloc0_vec;                       
wire    [95 :0]  dealloc1;                           
wire    [95 :0]  dealloc1_vec;                       
wire    [95 :0]  dealloc2;                           
wire    [95 :0]  dealloc2_vec;                       
wire    [95 :0]  dealloc_no_0;                       
wire    [6  :0]  dealloc_preg0;                      
wire    [95 :0]  dealloc_preg0_expand;               
wire             dealloc_preg0_vld;                  
wire    [6  :0]  dealloc_preg1;                      
wire    [95 :0]  dealloc_preg1_expand;               
wire             dealloc_preg1_vld;                  
wire    [6  :0]  dealloc_preg2;                      
wire    [95 :0]  dealloc_preg2_expand;               
wire             dealloc_preg2_vld;                  
wire             dealloc_preg3_vld;                  
wire    [95 :0]  dealloc_vld;                        
wire             dealloc_vld_for_gateclk;            
wire             forever_cpuclk;                     
wire             idu_rtu_ir_preg0_alloc_vld;         
wire             idu_rtu_ir_preg1_alloc_vld;         
wire             idu_rtu_ir_preg2_alloc_vld;         
wire             idu_rtu_ir_preg3_alloc_vld;         
wire             idu_rtu_ir_preg_alloc_gateclk_vld;  
wire    [4  :0]  idu_rtu_pst_dis_inst0_dst_reg;      
wire    [6  :0]  idu_rtu_pst_dis_inst0_preg;         
wire    [95 :0]  idu_rtu_pst_dis_inst0_preg_expand;  
wire    [6  :0]  idu_rtu_pst_dis_inst0_preg_iid;     
wire             idu_rtu_pst_dis_inst0_preg_vld;     
wire    [6  :0]  idu_rtu_pst_dis_inst0_rel_preg;     
wire    [4  :0]  idu_rtu_pst_dis_inst1_dst_reg;      
wire    [6  :0]  idu_rtu_pst_dis_inst1_preg;         
wire    [95 :0]  idu_rtu_pst_dis_inst1_preg_expand;  
wire    [6  :0]  idu_rtu_pst_dis_inst1_preg_iid;     
wire             idu_rtu_pst_dis_inst1_preg_vld;     
wire    [6  :0]  idu_rtu_pst_dis_inst1_rel_preg;     
wire    [4  :0]  idu_rtu_pst_dis_inst2_dst_reg;      
wire    [6  :0]  idu_rtu_pst_dis_inst2_preg;         
wire    [95 :0]  idu_rtu_pst_dis_inst2_preg_expand;  
wire    [6  :0]  idu_rtu_pst_dis_inst2_preg_iid;     
wire             idu_rtu_pst_dis_inst2_preg_vld;     
wire    [6  :0]  idu_rtu_pst_dis_inst2_rel_preg;     
wire    [4  :0]  idu_rtu_pst_dis_inst3_dst_reg;      
wire    [6  :0]  idu_rtu_pst_dis_inst3_preg;         
wire    [95 :0]  idu_rtu_pst_dis_inst3_preg_expand;  
wire    [6  :0]  idu_rtu_pst_dis_inst3_preg_iid;     
wire             idu_rtu_pst_dis_inst3_preg_vld;     
wire    [6  :0]  idu_rtu_pst_dis_inst3_rel_preg;     
wire    [95 :0]  idu_rtu_pst_preg_dealloc_mask;      
wire             ifu_xx_sync_reset;                  
wire    [95 :0]  iu_rtu_ex2_pipe0_wb_preg_expand;    
wire             iu_rtu_ex2_pipe0_wb_preg_vld;       
wire    [95 :0]  iu_rtu_ex2_pipe1_wb_preg_expand;    
wire             iu_rtu_ex2_pipe1_wb_preg_vld;       
wire    [95 :0]  lsu_rtu_wb_pipe3_wb_preg_expand;    
wire             lsu_rtu_wb_pipe3_wb_preg_vld;       
wire             pad_yy_icg_scan_en;                 
wire    [3  :0]  preg0_create_vld;                   
wire             preg0_cur_state_dealloc;            
wire             preg0_dealloc_mask;                 
wire             preg0_dealloc_vld;                  
wire    [31 :0]  preg0_dreg;                         
wire    [95 :0]  preg0_rel_preg_expand;              
wire             preg0_release_vld;                  
wire    [4  :0]  preg0_reset_dst_reg;                
wire             preg0_reset_mapped;                 
wire             preg0_retired_released_wb;          
wire             preg0_wb_vld;                       
wire    [3  :0]  preg10_create_vld;                  
wire             preg10_cur_state_dealloc;           
wire             preg10_dealloc_mask;                
wire             preg10_dealloc_vld;                 
wire    [31 :0]  preg10_dreg;                        
wire    [95 :0]  preg10_rel_preg_expand;             
wire             preg10_release_vld;                 
wire    [4  :0]  preg10_reset_dst_reg;               
wire             preg10_reset_mapped;                
wire             preg10_retired_released_wb;         
wire             preg10_wb_vld;                      
wire    [3  :0]  preg11_create_vld;                  
wire             preg11_cur_state_dealloc;           
wire             preg11_dealloc_mask;                
wire             preg11_dealloc_vld;                 
wire    [31 :0]  preg11_dreg;                        
wire    [95 :0]  preg11_rel_preg_expand;             
wire             preg11_release_vld;                 
wire    [4  :0]  preg11_reset_dst_reg;               
wire             preg11_reset_mapped;                
wire             preg11_retired_released_wb;         
wire             preg11_wb_vld;                      
wire    [3  :0]  preg12_create_vld;                  
wire             preg12_cur_state_dealloc;           
wire             preg12_dealloc_mask;                
wire             preg12_dealloc_vld;                 
wire    [31 :0]  preg12_dreg;                        
wire    [95 :0]  preg12_rel_preg_expand;             
wire             preg12_release_vld;                 
wire    [4  :0]  preg12_reset_dst_reg;               
wire             preg12_reset_mapped;                
wire             preg12_retired_released_wb;         
wire             preg12_wb_vld;                      
wire    [3  :0]  preg13_create_vld;                  
wire             preg13_cur_state_dealloc;           
wire             preg13_dealloc_mask;                
wire             preg13_dealloc_vld;                 
wire    [31 :0]  preg13_dreg;                        
wire    [95 :0]  preg13_rel_preg_expand;             
wire             preg13_release_vld;                 
wire    [4  :0]  preg13_reset_dst_reg;               
wire             preg13_reset_mapped;                
wire             preg13_retired_released_wb;         
wire             preg13_wb_vld;                      
wire    [3  :0]  preg14_create_vld;                  
wire             preg14_cur_state_dealloc;           
wire             preg14_dealloc_mask;                
wire             preg14_dealloc_vld;                 
wire    [31 :0]  preg14_dreg;                        
wire    [95 :0]  preg14_rel_preg_expand;             
wire             preg14_release_vld;                 
wire    [4  :0]  preg14_reset_dst_reg;               
wire             preg14_reset_mapped;                
wire             preg14_retired_released_wb;         
wire             preg14_wb_vld;                      
wire    [3  :0]  preg15_create_vld;                  
wire             preg15_cur_state_dealloc;           
wire             preg15_dealloc_mask;                
wire             preg15_dealloc_vld;                 
wire    [31 :0]  preg15_dreg;                        
wire    [95 :0]  preg15_rel_preg_expand;             
wire             preg15_release_vld;                 
wire    [4  :0]  preg15_reset_dst_reg;               
wire             preg15_reset_mapped;                
wire             preg15_retired_released_wb;         
wire             preg15_wb_vld;                      
wire    [3  :0]  preg16_create_vld;                  
wire             preg16_cur_state_dealloc;           
wire             preg16_dealloc_mask;                
wire             preg16_dealloc_vld;                 
wire    [31 :0]  preg16_dreg;                        
wire    [95 :0]  preg16_rel_preg_expand;             
wire             preg16_release_vld;                 
wire    [4  :0]  preg16_reset_dst_reg;               
wire             preg16_reset_mapped;                
wire             preg16_retired_released_wb;         
wire             preg16_wb_vld;                      
wire    [3  :0]  preg17_create_vld;                  
wire             preg17_cur_state_dealloc;           
wire             preg17_dealloc_mask;                
wire             preg17_dealloc_vld;                 
wire    [31 :0]  preg17_dreg;                        
wire    [95 :0]  preg17_rel_preg_expand;             
wire             preg17_release_vld;                 
wire    [4  :0]  preg17_reset_dst_reg;               
wire             preg17_reset_mapped;                
wire             preg17_retired_released_wb;         
wire             preg17_wb_vld;                      
wire    [3  :0]  preg18_create_vld;                  
wire             preg18_cur_state_dealloc;           
wire             preg18_dealloc_mask;                
wire             preg18_dealloc_vld;                 
wire    [31 :0]  preg18_dreg;                        
wire    [95 :0]  preg18_rel_preg_expand;             
wire             preg18_release_vld;                 
wire    [4  :0]  preg18_reset_dst_reg;               
wire             preg18_reset_mapped;                
wire             preg18_retired_released_wb;         
wire             preg18_wb_vld;                      
wire    [3  :0]  preg19_create_vld;                  
wire             preg19_cur_state_dealloc;           
wire             preg19_dealloc_mask;                
wire             preg19_dealloc_vld;                 
wire    [31 :0]  preg19_dreg;                        
wire    [95 :0]  preg19_rel_preg_expand;             
wire             preg19_release_vld;                 
wire    [4  :0]  preg19_reset_dst_reg;               
wire             preg19_reset_mapped;                
wire             preg19_retired_released_wb;         
wire             preg19_wb_vld;                      
wire    [3  :0]  preg1_create_vld;                   
wire             preg1_cur_state_dealloc;            
wire             preg1_dealloc_mask;                 
wire             preg1_dealloc_vld;                  
wire    [31 :0]  preg1_dreg;                         
wire    [95 :0]  preg1_rel_preg_expand;              
wire             preg1_release_vld;                  
wire    [4  :0]  preg1_reset_dst_reg;                
wire             preg1_reset_mapped;                 
wire             preg1_retired_released_wb;          
wire             preg1_wb_vld;                       
wire    [3  :0]  preg20_create_vld;                  
wire             preg20_cur_state_dealloc;           
wire             preg20_dealloc_mask;                
wire             preg20_dealloc_vld;                 
wire    [31 :0]  preg20_dreg;                        
wire    [95 :0]  preg20_rel_preg_expand;             
wire             preg20_release_vld;                 
wire    [4  :0]  preg20_reset_dst_reg;               
wire             preg20_reset_mapped;                
wire             preg20_retired_released_wb;         
wire             preg20_wb_vld;                      
wire    [3  :0]  preg21_create_vld;                  
wire             preg21_cur_state_dealloc;           
wire             preg21_dealloc_mask;                
wire             preg21_dealloc_vld;                 
wire    [31 :0]  preg21_dreg;                        
wire    [95 :0]  preg21_rel_preg_expand;             
wire             preg21_release_vld;                 
wire    [4  :0]  preg21_reset_dst_reg;               
wire             preg21_reset_mapped;                
wire             preg21_retired_released_wb;         
wire             preg21_wb_vld;                      
wire    [3  :0]  preg22_create_vld;                  
wire             preg22_cur_state_dealloc;           
wire             preg22_dealloc_mask;                
wire             preg22_dealloc_vld;                 
wire    [31 :0]  preg22_dreg;                        
wire    [95 :0]  preg22_rel_preg_expand;             
wire             preg22_release_vld;                 
wire    [4  :0]  preg22_reset_dst_reg;               
wire             preg22_reset_mapped;                
wire             preg22_retired_released_wb;         
wire             preg22_wb_vld;                      
wire    [3  :0]  preg23_create_vld;                  
wire             preg23_cur_state_dealloc;           
wire             preg23_dealloc_mask;                
wire             preg23_dealloc_vld;                 
wire    [31 :0]  preg23_dreg;                        
wire    [95 :0]  preg23_rel_preg_expand;             
wire             preg23_release_vld;                 
wire    [4  :0]  preg23_reset_dst_reg;               
wire             preg23_reset_mapped;                
wire             preg23_retired_released_wb;         
wire             preg23_wb_vld;                      
wire    [3  :0]  preg24_create_vld;                  
wire             preg24_cur_state_dealloc;           
wire             preg24_dealloc_mask;                
wire             preg24_dealloc_vld;                 
wire    [31 :0]  preg24_dreg;                        
wire    [95 :0]  preg24_rel_preg_expand;             
wire             preg24_release_vld;                 
wire    [4  :0]  preg24_reset_dst_reg;               
wire             preg24_reset_mapped;                
wire             preg24_retired_released_wb;         
wire             preg24_wb_vld;                      
wire    [3  :0]  preg25_create_vld;                  
wire             preg25_cur_state_dealloc;           
wire             preg25_dealloc_mask;                
wire             preg25_dealloc_vld;                 
wire    [31 :0]  preg25_dreg;                        
wire    [95 :0]  preg25_rel_preg_expand;             
wire             preg25_release_vld;                 
wire    [4  :0]  preg25_reset_dst_reg;               
wire             preg25_reset_mapped;                
wire             preg25_retired_released_wb;         
wire             preg25_wb_vld;                      
wire    [3  :0]  preg26_create_vld;                  
wire             preg26_cur_state_dealloc;           
wire             preg26_dealloc_mask;                
wire             preg26_dealloc_vld;                 
wire    [31 :0]  preg26_dreg;                        
wire    [95 :0]  preg26_rel_preg_expand;             
wire             preg26_release_vld;                 
wire    [4  :0]  preg26_reset_dst_reg;               
wire             preg26_reset_mapped;                
wire             preg26_retired_released_wb;         
wire             preg26_wb_vld;                      
wire    [3  :0]  preg27_create_vld;                  
wire             preg27_cur_state_dealloc;           
wire             preg27_dealloc_mask;                
wire             preg27_dealloc_vld;                 
wire    [31 :0]  preg27_dreg;                        
wire    [95 :0]  preg27_rel_preg_expand;             
wire             preg27_release_vld;                 
wire    [4  :0]  preg27_reset_dst_reg;               
wire             preg27_reset_mapped;                
wire             preg27_retired_released_wb;         
wire             preg27_wb_vld;                      
wire    [3  :0]  preg28_create_vld;                  
wire             preg28_cur_state_dealloc;           
wire             preg28_dealloc_mask;                
wire             preg28_dealloc_vld;                 
wire    [31 :0]  preg28_dreg;                        
wire    [95 :0]  preg28_rel_preg_expand;             
wire             preg28_release_vld;                 
wire    [4  :0]  preg28_reset_dst_reg;               
wire             preg28_reset_mapped;                
wire             preg28_retired_released_wb;         
wire             preg28_wb_vld;                      
wire    [3  :0]  preg29_create_vld;                  
wire             preg29_cur_state_dealloc;           
wire             preg29_dealloc_mask;                
wire             preg29_dealloc_vld;                 
wire    [31 :0]  preg29_dreg;                        
wire    [95 :0]  preg29_rel_preg_expand;             
wire             preg29_release_vld;                 
wire    [4  :0]  preg29_reset_dst_reg;               
wire             preg29_reset_mapped;                
wire             preg29_retired_released_wb;         
wire             preg29_wb_vld;                      
wire    [3  :0]  preg2_create_vld;                   
wire             preg2_cur_state_dealloc;            
wire             preg2_dealloc_mask;                 
wire             preg2_dealloc_vld;                  
wire    [31 :0]  preg2_dreg;                         
wire    [95 :0]  preg2_rel_preg_expand;              
wire             preg2_release_vld;                  
wire    [4  :0]  preg2_reset_dst_reg;                
wire             preg2_reset_mapped;                 
wire             preg2_retired_released_wb;          
wire             preg2_wb_vld;                       
wire    [3  :0]  preg30_create_vld;                  
wire             preg30_cur_state_dealloc;           
wire             preg30_dealloc_mask;                
wire             preg30_dealloc_vld;                 
wire    [31 :0]  preg30_dreg;                        
wire    [95 :0]  preg30_rel_preg_expand;             
wire             preg30_release_vld;                 
wire    [4  :0]  preg30_reset_dst_reg;               
wire             preg30_reset_mapped;                
wire             preg30_retired_released_wb;         
wire             preg30_wb_vld;                      
wire    [3  :0]  preg31_create_vld;                  
wire             preg31_cur_state_dealloc;           
wire             preg31_dealloc_mask;                
wire             preg31_dealloc_vld;                 
wire    [31 :0]  preg31_dreg;                        
wire    [95 :0]  preg31_rel_preg_expand;             
wire             preg31_release_vld;                 
wire    [4  :0]  preg31_reset_dst_reg;               
wire             preg31_reset_mapped;                
wire             preg31_retired_released_wb;         
wire             preg31_wb_vld;                      
wire    [3  :0]  preg32_create_vld;                  
wire             preg32_cur_state_dealloc;           
wire             preg32_dealloc_mask;                
wire             preg32_dealloc_vld;                 
wire    [31 :0]  preg32_dreg;                        
wire    [95 :0]  preg32_rel_preg_expand;             
wire             preg32_release_vld;                 
wire    [4  :0]  preg32_reset_dst_reg;               
wire             preg32_reset_mapped;                
wire             preg32_retired_released_wb;         
wire             preg32_wb_vld;                      
wire    [3  :0]  preg33_create_vld;                  
wire             preg33_cur_state_dealloc;           
wire             preg33_dealloc_mask;                
wire             preg33_dealloc_vld;                 
wire    [31 :0]  preg33_dreg;                        
wire    [95 :0]  preg33_rel_preg_expand;             
wire             preg33_release_vld;                 
wire    [4  :0]  preg33_reset_dst_reg;               
wire             preg33_reset_mapped;                
wire             preg33_retired_released_wb;         
wire             preg33_wb_vld;                      
wire    [3  :0]  preg34_create_vld;                  
wire             preg34_cur_state_dealloc;           
wire             preg34_dealloc_mask;                
wire             preg34_dealloc_vld;                 
wire    [31 :0]  preg34_dreg;                        
wire    [95 :0]  preg34_rel_preg_expand;             
wire             preg34_release_vld;                 
wire    [4  :0]  preg34_reset_dst_reg;               
wire             preg34_reset_mapped;                
wire             preg34_retired_released_wb;         
wire             preg34_wb_vld;                      
wire    [3  :0]  preg35_create_vld;                  
wire             preg35_cur_state_dealloc;           
wire             preg35_dealloc_mask;                
wire             preg35_dealloc_vld;                 
wire    [31 :0]  preg35_dreg;                        
wire    [95 :0]  preg35_rel_preg_expand;             
wire             preg35_release_vld;                 
wire    [4  :0]  preg35_reset_dst_reg;               
wire             preg35_reset_mapped;                
wire             preg35_retired_released_wb;         
wire             preg35_wb_vld;                      
wire    [3  :0]  preg36_create_vld;                  
wire             preg36_cur_state_dealloc;           
wire             preg36_dealloc_mask;                
wire             preg36_dealloc_vld;                 
wire    [31 :0]  preg36_dreg;                        
wire    [95 :0]  preg36_rel_preg_expand;             
wire             preg36_release_vld;                 
wire    [4  :0]  preg36_reset_dst_reg;               
wire             preg36_reset_mapped;                
wire             preg36_retired_released_wb;         
wire             preg36_wb_vld;                      
wire    [3  :0]  preg37_create_vld;                  
wire             preg37_cur_state_dealloc;           
wire             preg37_dealloc_mask;                
wire             preg37_dealloc_vld;                 
wire    [31 :0]  preg37_dreg;                        
wire    [95 :0]  preg37_rel_preg_expand;             
wire             preg37_release_vld;                 
wire    [4  :0]  preg37_reset_dst_reg;               
wire             preg37_reset_mapped;                
wire             preg37_retired_released_wb;         
wire             preg37_wb_vld;                      
wire    [3  :0]  preg38_create_vld;                  
wire             preg38_cur_state_dealloc;           
wire             preg38_dealloc_mask;                
wire             preg38_dealloc_vld;                 
wire    [31 :0]  preg38_dreg;                        
wire    [95 :0]  preg38_rel_preg_expand;             
wire             preg38_release_vld;                 
wire    [4  :0]  preg38_reset_dst_reg;               
wire             preg38_reset_mapped;                
wire             preg38_retired_released_wb;         
wire             preg38_wb_vld;                      
wire    [3  :0]  preg39_create_vld;                  
wire             preg39_cur_state_dealloc;           
wire             preg39_dealloc_mask;                
wire             preg39_dealloc_vld;                 
wire    [31 :0]  preg39_dreg;                        
wire    [95 :0]  preg39_rel_preg_expand;             
wire             preg39_release_vld;                 
wire    [4  :0]  preg39_reset_dst_reg;               
wire             preg39_reset_mapped;                
wire             preg39_retired_released_wb;         
wire             preg39_wb_vld;                      
wire    [3  :0]  preg3_create_vld;                   
wire             preg3_cur_state_dealloc;            
wire             preg3_dealloc_mask;                 
wire             preg3_dealloc_vld;                  
wire    [31 :0]  preg3_dreg;                         
wire    [95 :0]  preg3_rel_preg_expand;              
wire             preg3_release_vld;                  
wire    [4  :0]  preg3_reset_dst_reg;                
wire             preg3_reset_mapped;                 
wire             preg3_retired_released_wb;          
wire             preg3_wb_vld;                       
wire    [3  :0]  preg40_create_vld;                  
wire             preg40_cur_state_dealloc;           
wire             preg40_dealloc_mask;                
wire             preg40_dealloc_vld;                 
wire    [31 :0]  preg40_dreg;                        
wire    [95 :0]  preg40_rel_preg_expand;             
wire             preg40_release_vld;                 
wire    [4  :0]  preg40_reset_dst_reg;               
wire             preg40_reset_mapped;                
wire             preg40_retired_released_wb;         
wire             preg40_wb_vld;                      
wire    [3  :0]  preg41_create_vld;                  
wire             preg41_cur_state_dealloc;           
wire             preg41_dealloc_mask;                
wire             preg41_dealloc_vld;                 
wire    [31 :0]  preg41_dreg;                        
wire    [95 :0]  preg41_rel_preg_expand;             
wire             preg41_release_vld;                 
wire    [4  :0]  preg41_reset_dst_reg;               
wire             preg41_reset_mapped;                
wire             preg41_retired_released_wb;         
wire             preg41_wb_vld;                      
wire    [3  :0]  preg42_create_vld;                  
wire             preg42_cur_state_dealloc;           
wire             preg42_dealloc_mask;                
wire             preg42_dealloc_vld;                 
wire    [31 :0]  preg42_dreg;                        
wire    [95 :0]  preg42_rel_preg_expand;             
wire             preg42_release_vld;                 
wire    [4  :0]  preg42_reset_dst_reg;               
wire             preg42_reset_mapped;                
wire             preg42_retired_released_wb;         
wire             preg42_wb_vld;                      
wire    [3  :0]  preg43_create_vld;                  
wire             preg43_cur_state_dealloc;           
wire             preg43_dealloc_mask;                
wire             preg43_dealloc_vld;                 
wire    [31 :0]  preg43_dreg;                        
wire    [95 :0]  preg43_rel_preg_expand;             
wire             preg43_release_vld;                 
wire    [4  :0]  preg43_reset_dst_reg;               
wire             preg43_reset_mapped;                
wire             preg43_retired_released_wb;         
wire             preg43_wb_vld;                      
wire    [3  :0]  preg44_create_vld;                  
wire             preg44_cur_state_dealloc;           
wire             preg44_dealloc_mask;                
wire             preg44_dealloc_vld;                 
wire    [31 :0]  preg44_dreg;                        
wire    [95 :0]  preg44_rel_preg_expand;             
wire             preg44_release_vld;                 
wire    [4  :0]  preg44_reset_dst_reg;               
wire             preg44_reset_mapped;                
wire             preg44_retired_released_wb;         
wire             preg44_wb_vld;                      
wire    [3  :0]  preg45_create_vld;                  
wire             preg45_cur_state_dealloc;           
wire             preg45_dealloc_mask;                
wire             preg45_dealloc_vld;                 
wire    [31 :0]  preg45_dreg;                        
wire    [95 :0]  preg45_rel_preg_expand;             
wire             preg45_release_vld;                 
wire    [4  :0]  preg45_reset_dst_reg;               
wire             preg45_reset_mapped;                
wire             preg45_retired_released_wb;         
wire             preg45_wb_vld;                      
wire    [3  :0]  preg46_create_vld;                  
wire             preg46_cur_state_dealloc;           
wire             preg46_dealloc_mask;                
wire             preg46_dealloc_vld;                 
wire    [31 :0]  preg46_dreg;                        
wire    [95 :0]  preg46_rel_preg_expand;             
wire             preg46_release_vld;                 
wire    [4  :0]  preg46_reset_dst_reg;               
wire             preg46_reset_mapped;                
wire             preg46_retired_released_wb;         
wire             preg46_wb_vld;                      
wire    [3  :0]  preg47_create_vld;                  
wire             preg47_cur_state_dealloc;           
wire             preg47_dealloc_mask;                
wire             preg47_dealloc_vld;                 
wire    [31 :0]  preg47_dreg;                        
wire    [95 :0]  preg47_rel_preg_expand;             
wire             preg47_release_vld;                 
wire    [4  :0]  preg47_reset_dst_reg;               
wire             preg47_reset_mapped;                
wire             preg47_retired_released_wb;         
wire             preg47_wb_vld;                      
wire    [3  :0]  preg48_create_vld;                  
wire             preg48_cur_state_dealloc;           
wire             preg48_dealloc_mask;                
wire             preg48_dealloc_vld;                 
wire    [31 :0]  preg48_dreg;                        
wire    [95 :0]  preg48_rel_preg_expand;             
wire             preg48_release_vld;                 
wire    [4  :0]  preg48_reset_dst_reg;               
wire             preg48_reset_mapped;                
wire             preg48_retired_released_wb;         
wire             preg48_wb_vld;                      
wire    [3  :0]  preg49_create_vld;                  
wire             preg49_cur_state_dealloc;           
wire             preg49_dealloc_mask;                
wire             preg49_dealloc_vld;                 
wire    [31 :0]  preg49_dreg;                        
wire    [95 :0]  preg49_rel_preg_expand;             
wire             preg49_release_vld;                 
wire    [4  :0]  preg49_reset_dst_reg;               
wire             preg49_reset_mapped;                
wire             preg49_retired_released_wb;         
wire             preg49_wb_vld;                      
wire    [3  :0]  preg4_create_vld;                   
wire             preg4_cur_state_dealloc;            
wire             preg4_dealloc_mask;                 
wire             preg4_dealloc_vld;                  
wire    [31 :0]  preg4_dreg;                         
wire    [95 :0]  preg4_rel_preg_expand;              
wire             preg4_release_vld;                  
wire    [4  :0]  preg4_reset_dst_reg;                
wire             preg4_reset_mapped;                 
wire             preg4_retired_released_wb;          
wire             preg4_wb_vld;                       
wire    [3  :0]  preg50_create_vld;                  
wire             preg50_cur_state_dealloc;           
wire             preg50_dealloc_mask;                
wire             preg50_dealloc_vld;                 
wire    [31 :0]  preg50_dreg;                        
wire    [95 :0]  preg50_rel_preg_expand;             
wire             preg50_release_vld;                 
wire    [4  :0]  preg50_reset_dst_reg;               
wire             preg50_reset_mapped;                
wire             preg50_retired_released_wb;         
wire             preg50_wb_vld;                      
wire    [3  :0]  preg51_create_vld;                  
wire             preg51_cur_state_dealloc;           
wire             preg51_dealloc_mask;                
wire             preg51_dealloc_vld;                 
wire    [31 :0]  preg51_dreg;                        
wire    [95 :0]  preg51_rel_preg_expand;             
wire             preg51_release_vld;                 
wire    [4  :0]  preg51_reset_dst_reg;               
wire             preg51_reset_mapped;                
wire             preg51_retired_released_wb;         
wire             preg51_wb_vld;                      
wire    [3  :0]  preg52_create_vld;                  
wire             preg52_cur_state_dealloc;           
wire             preg52_dealloc_mask;                
wire             preg52_dealloc_vld;                 
wire    [31 :0]  preg52_dreg;                        
wire    [95 :0]  preg52_rel_preg_expand;             
wire             preg52_release_vld;                 
wire    [4  :0]  preg52_reset_dst_reg;               
wire             preg52_reset_mapped;                
wire             preg52_retired_released_wb;         
wire             preg52_wb_vld;                      
wire    [3  :0]  preg53_create_vld;                  
wire             preg53_cur_state_dealloc;           
wire             preg53_dealloc_mask;                
wire             preg53_dealloc_vld;                 
wire    [31 :0]  preg53_dreg;                        
wire    [95 :0]  preg53_rel_preg_expand;             
wire             preg53_release_vld;                 
wire    [4  :0]  preg53_reset_dst_reg;               
wire             preg53_reset_mapped;                
wire             preg53_retired_released_wb;         
wire             preg53_wb_vld;                      
wire    [3  :0]  preg54_create_vld;                  
wire             preg54_cur_state_dealloc;           
wire             preg54_dealloc_mask;                
wire             preg54_dealloc_vld;                 
wire    [31 :0]  preg54_dreg;                        
wire    [95 :0]  preg54_rel_preg_expand;             
wire             preg54_release_vld;                 
wire    [4  :0]  preg54_reset_dst_reg;               
wire             preg54_reset_mapped;                
wire             preg54_retired_released_wb;         
wire             preg54_wb_vld;                      
wire    [3  :0]  preg55_create_vld;                  
wire             preg55_cur_state_dealloc;           
wire             preg55_dealloc_mask;                
wire             preg55_dealloc_vld;                 
wire    [31 :0]  preg55_dreg;                        
wire    [95 :0]  preg55_rel_preg_expand;             
wire             preg55_release_vld;                 
wire    [4  :0]  preg55_reset_dst_reg;               
wire             preg55_reset_mapped;                
wire             preg55_retired_released_wb;         
wire             preg55_wb_vld;                      
wire    [3  :0]  preg56_create_vld;                  
wire             preg56_cur_state_dealloc;           
wire             preg56_dealloc_mask;                
wire             preg56_dealloc_vld;                 
wire    [31 :0]  preg56_dreg;                        
wire    [95 :0]  preg56_rel_preg_expand;             
wire             preg56_release_vld;                 
wire    [4  :0]  preg56_reset_dst_reg;               
wire             preg56_reset_mapped;                
wire             preg56_retired_released_wb;         
wire             preg56_wb_vld;                      
wire    [3  :0]  preg57_create_vld;                  
wire             preg57_cur_state_dealloc;           
wire             preg57_dealloc_mask;                
wire             preg57_dealloc_vld;                 
wire    [31 :0]  preg57_dreg;                        
wire    [95 :0]  preg57_rel_preg_expand;             
wire             preg57_release_vld;                 
wire    [4  :0]  preg57_reset_dst_reg;               
wire             preg57_reset_mapped;                
wire             preg57_retired_released_wb;         
wire             preg57_wb_vld;                      
wire    [3  :0]  preg58_create_vld;                  
wire             preg58_cur_state_dealloc;           
wire             preg58_dealloc_mask;                
wire             preg58_dealloc_vld;                 
wire    [31 :0]  preg58_dreg;                        
wire    [95 :0]  preg58_rel_preg_expand;             
wire             preg58_release_vld;                 
wire    [4  :0]  preg58_reset_dst_reg;               
wire             preg58_reset_mapped;                
wire             preg58_retired_released_wb;         
wire             preg58_wb_vld;                      
wire    [3  :0]  preg59_create_vld;                  
wire             preg59_cur_state_dealloc;           
wire             preg59_dealloc_mask;                
wire             preg59_dealloc_vld;                 
wire    [31 :0]  preg59_dreg;                        
wire    [95 :0]  preg59_rel_preg_expand;             
wire             preg59_release_vld;                 
wire    [4  :0]  preg59_reset_dst_reg;               
wire             preg59_reset_mapped;                
wire             preg59_retired_released_wb;         
wire             preg59_wb_vld;                      
wire    [3  :0]  preg5_create_vld;                   
wire             preg5_cur_state_dealloc;            
wire             preg5_dealloc_mask;                 
wire             preg5_dealloc_vld;                  
wire    [31 :0]  preg5_dreg;                         
wire    [95 :0]  preg5_rel_preg_expand;              
wire             preg5_release_vld;                  
wire    [4  :0]  preg5_reset_dst_reg;                
wire             preg5_reset_mapped;                 
wire             preg5_retired_released_wb;          
wire             preg5_wb_vld;                       
wire    [3  :0]  preg60_create_vld;                  
wire             preg60_cur_state_dealloc;           
wire             preg60_dealloc_mask;                
wire             preg60_dealloc_vld;                 
wire    [31 :0]  preg60_dreg;                        
wire    [95 :0]  preg60_rel_preg_expand;             
wire             preg60_release_vld;                 
wire    [4  :0]  preg60_reset_dst_reg;               
wire             preg60_reset_mapped;                
wire             preg60_retired_released_wb;         
wire             preg60_wb_vld;                      
wire    [3  :0]  preg61_create_vld;                  
wire             preg61_cur_state_dealloc;           
wire             preg61_dealloc_mask;                
wire             preg61_dealloc_vld;                 
wire    [31 :0]  preg61_dreg;                        
wire    [95 :0]  preg61_rel_preg_expand;             
wire             preg61_release_vld;                 
wire    [4  :0]  preg61_reset_dst_reg;               
wire             preg61_reset_mapped;                
wire             preg61_retired_released_wb;         
wire             preg61_wb_vld;                      
wire    [3  :0]  preg62_create_vld;                  
wire             preg62_cur_state_dealloc;           
wire             preg62_dealloc_mask;                
wire             preg62_dealloc_vld;                 
wire    [31 :0]  preg62_dreg;                        
wire    [95 :0]  preg62_rel_preg_expand;             
wire             preg62_release_vld;                 
wire    [4  :0]  preg62_reset_dst_reg;               
wire             preg62_reset_mapped;                
wire             preg62_retired_released_wb;         
wire             preg62_wb_vld;                      
wire    [3  :0]  preg63_create_vld;                  
wire             preg63_cur_state_dealloc;           
wire             preg63_dealloc_mask;                
wire             preg63_dealloc_vld;                 
wire    [31 :0]  preg63_dreg;                        
wire    [95 :0]  preg63_rel_preg_expand;             
wire             preg63_release_vld;                 
wire    [4  :0]  preg63_reset_dst_reg;               
wire             preg63_reset_mapped;                
wire             preg63_retired_released_wb;         
wire             preg63_wb_vld;                      
wire    [3  :0]  preg64_create_vld;                  
wire             preg64_cur_state_dealloc;           
wire             preg64_dealloc_mask;                
wire             preg64_dealloc_vld;                 
wire    [31 :0]  preg64_dreg;                        
wire    [95 :0]  preg64_rel_preg_expand;             
wire             preg64_release_vld;                 
wire    [4  :0]  preg64_reset_dst_reg;               
wire             preg64_reset_mapped;                
wire             preg64_retired_released_wb;         
wire             preg64_wb_vld;                      
wire    [3  :0]  preg65_create_vld;                  
wire             preg65_cur_state_dealloc;           
wire             preg65_dealloc_mask;                
wire             preg65_dealloc_vld;                 
wire    [31 :0]  preg65_dreg;                        
wire    [95 :0]  preg65_rel_preg_expand;             
wire             preg65_release_vld;                 
wire    [4  :0]  preg65_reset_dst_reg;               
wire             preg65_reset_mapped;                
wire             preg65_retired_released_wb;         
wire             preg65_wb_vld;                      
wire    [3  :0]  preg66_create_vld;                  
wire             preg66_cur_state_dealloc;           
wire             preg66_dealloc_mask;                
wire             preg66_dealloc_vld;                 
wire    [31 :0]  preg66_dreg;                        
wire    [95 :0]  preg66_rel_preg_expand;             
wire             preg66_release_vld;                 
wire    [4  :0]  preg66_reset_dst_reg;               
wire             preg66_reset_mapped;                
wire             preg66_retired_released_wb;         
wire             preg66_wb_vld;                      
wire    [3  :0]  preg67_create_vld;                  
wire             preg67_cur_state_dealloc;           
wire             preg67_dealloc_mask;                
wire             preg67_dealloc_vld;                 
wire    [31 :0]  preg67_dreg;                        
wire    [95 :0]  preg67_rel_preg_expand;             
wire             preg67_release_vld;                 
wire    [4  :0]  preg67_reset_dst_reg;               
wire             preg67_reset_mapped;                
wire             preg67_retired_released_wb;         
wire             preg67_wb_vld;                      
wire    [3  :0]  preg68_create_vld;                  
wire             preg68_cur_state_dealloc;           
wire             preg68_dealloc_mask;                
wire             preg68_dealloc_vld;                 
wire    [31 :0]  preg68_dreg;                        
wire    [95 :0]  preg68_rel_preg_expand;             
wire             preg68_release_vld;                 
wire    [4  :0]  preg68_reset_dst_reg;               
wire             preg68_reset_mapped;                
wire             preg68_retired_released_wb;         
wire             preg68_wb_vld;                      
wire    [3  :0]  preg69_create_vld;                  
wire             preg69_cur_state_dealloc;           
wire             preg69_dealloc_mask;                
wire             preg69_dealloc_vld;                 
wire    [31 :0]  preg69_dreg;                        
wire    [95 :0]  preg69_rel_preg_expand;             
wire             preg69_release_vld;                 
wire    [4  :0]  preg69_reset_dst_reg;               
wire             preg69_reset_mapped;                
wire             preg69_retired_released_wb;         
wire             preg69_wb_vld;                      
wire    [3  :0]  preg6_create_vld;                   
wire             preg6_cur_state_dealloc;            
wire             preg6_dealloc_mask;                 
wire             preg6_dealloc_vld;                  
wire    [31 :0]  preg6_dreg;                         
wire    [95 :0]  preg6_rel_preg_expand;              
wire             preg6_release_vld;                  
wire    [4  :0]  preg6_reset_dst_reg;                
wire             preg6_reset_mapped;                 
wire             preg6_retired_released_wb;          
wire             preg6_wb_vld;                       
wire    [3  :0]  preg70_create_vld;                  
wire             preg70_cur_state_dealloc;           
wire             preg70_dealloc_mask;                
wire             preg70_dealloc_vld;                 
wire    [31 :0]  preg70_dreg;                        
wire    [95 :0]  preg70_rel_preg_expand;             
wire             preg70_release_vld;                 
wire    [4  :0]  preg70_reset_dst_reg;               
wire             preg70_reset_mapped;                
wire             preg70_retired_released_wb;         
wire             preg70_wb_vld;                      
wire    [3  :0]  preg71_create_vld;                  
wire             preg71_cur_state_dealloc;           
wire             preg71_dealloc_mask;                
wire             preg71_dealloc_vld;                 
wire    [31 :0]  preg71_dreg;                        
wire    [95 :0]  preg71_rel_preg_expand;             
wire             preg71_release_vld;                 
wire    [4  :0]  preg71_reset_dst_reg;               
wire             preg71_reset_mapped;                
wire             preg71_retired_released_wb;         
wire             preg71_wb_vld;                      
wire    [3  :0]  preg72_create_vld;                  
wire             preg72_cur_state_dealloc;           
wire             preg72_dealloc_mask;                
wire             preg72_dealloc_vld;                 
wire    [31 :0]  preg72_dreg;                        
wire    [95 :0]  preg72_rel_preg_expand;             
wire             preg72_release_vld;                 
wire    [4  :0]  preg72_reset_dst_reg;               
wire             preg72_reset_mapped;                
wire             preg72_retired_released_wb;         
wire             preg72_wb_vld;                      
wire    [3  :0]  preg73_create_vld;                  
wire             preg73_cur_state_dealloc;           
wire             preg73_dealloc_mask;                
wire             preg73_dealloc_vld;                 
wire    [31 :0]  preg73_dreg;                        
wire    [95 :0]  preg73_rel_preg_expand;             
wire             preg73_release_vld;                 
wire    [4  :0]  preg73_reset_dst_reg;               
wire             preg73_reset_mapped;                
wire             preg73_retired_released_wb;         
wire             preg73_wb_vld;                      
wire    [3  :0]  preg74_create_vld;                  
wire             preg74_cur_state_dealloc;           
wire             preg74_dealloc_mask;                
wire             preg74_dealloc_vld;                 
wire    [31 :0]  preg74_dreg;                        
wire    [95 :0]  preg74_rel_preg_expand;             
wire             preg74_release_vld;                 
wire    [4  :0]  preg74_reset_dst_reg;               
wire             preg74_reset_mapped;                
wire             preg74_retired_released_wb;         
wire             preg74_wb_vld;                      
wire    [3  :0]  preg75_create_vld;                  
wire             preg75_cur_state_dealloc;           
wire             preg75_dealloc_mask;                
wire             preg75_dealloc_vld;                 
wire    [31 :0]  preg75_dreg;                        
wire    [95 :0]  preg75_rel_preg_expand;             
wire             preg75_release_vld;                 
wire    [4  :0]  preg75_reset_dst_reg;               
wire             preg75_reset_mapped;                
wire             preg75_retired_released_wb;         
wire             preg75_wb_vld;                      
wire    [3  :0]  preg76_create_vld;                  
wire             preg76_cur_state_dealloc;           
wire             preg76_dealloc_mask;                
wire             preg76_dealloc_vld;                 
wire    [31 :0]  preg76_dreg;                        
wire    [95 :0]  preg76_rel_preg_expand;             
wire             preg76_release_vld;                 
wire    [4  :0]  preg76_reset_dst_reg;               
wire             preg76_reset_mapped;                
wire             preg76_retired_released_wb;         
wire             preg76_wb_vld;                      
wire    [3  :0]  preg77_create_vld;                  
wire             preg77_cur_state_dealloc;           
wire             preg77_dealloc_mask;                
wire             preg77_dealloc_vld;                 
wire    [31 :0]  preg77_dreg;                        
wire    [95 :0]  preg77_rel_preg_expand;             
wire             preg77_release_vld;                 
wire    [4  :0]  preg77_reset_dst_reg;               
wire             preg77_reset_mapped;                
wire             preg77_retired_released_wb;         
wire             preg77_wb_vld;                      
wire    [3  :0]  preg78_create_vld;                  
wire             preg78_cur_state_dealloc;           
wire             preg78_dealloc_mask;                
wire             preg78_dealloc_vld;                 
wire    [31 :0]  preg78_dreg;                        
wire    [95 :0]  preg78_rel_preg_expand;             
wire             preg78_release_vld;                 
wire    [4  :0]  preg78_reset_dst_reg;               
wire             preg78_reset_mapped;                
wire             preg78_retired_released_wb;         
wire             preg78_wb_vld;                      
wire    [3  :0]  preg79_create_vld;                  
wire             preg79_cur_state_dealloc;           
wire             preg79_dealloc_mask;                
wire             preg79_dealloc_vld;                 
wire    [31 :0]  preg79_dreg;                        
wire    [95 :0]  preg79_rel_preg_expand;             
wire             preg79_release_vld;                 
wire    [4  :0]  preg79_reset_dst_reg;               
wire             preg79_reset_mapped;                
wire             preg79_retired_released_wb;         
wire             preg79_wb_vld;                      
wire    [3  :0]  preg7_create_vld;                   
wire             preg7_cur_state_dealloc;            
wire             preg7_dealloc_mask;                 
wire             preg7_dealloc_vld;                  
wire    [31 :0]  preg7_dreg;                         
wire    [95 :0]  preg7_rel_preg_expand;              
wire             preg7_release_vld;                  
wire    [4  :0]  preg7_reset_dst_reg;                
wire             preg7_reset_mapped;                 
wire             preg7_retired_released_wb;          
wire             preg7_wb_vld;                       
wire    [3  :0]  preg80_create_vld;                  
wire             preg80_cur_state_dealloc;           
wire             preg80_dealloc_mask;                
wire             preg80_dealloc_vld;                 
wire    [31 :0]  preg80_dreg;                        
wire    [95 :0]  preg80_rel_preg_expand;             
wire             preg80_release_vld;                 
wire    [4  :0]  preg80_reset_dst_reg;               
wire             preg80_reset_mapped;                
wire             preg80_retired_released_wb;         
wire             preg80_wb_vld;                      
wire    [3  :0]  preg81_create_vld;                  
wire             preg81_cur_state_dealloc;           
wire             preg81_dealloc_mask;                
wire             preg81_dealloc_vld;                 
wire    [31 :0]  preg81_dreg;                        
wire    [95 :0]  preg81_rel_preg_expand;             
wire             preg81_release_vld;                 
wire    [4  :0]  preg81_reset_dst_reg;               
wire             preg81_reset_mapped;                
wire             preg81_retired_released_wb;         
wire             preg81_wb_vld;                      
wire    [3  :0]  preg82_create_vld;                  
wire             preg82_cur_state_dealloc;           
wire             preg82_dealloc_mask;                
wire             preg82_dealloc_vld;                 
wire    [31 :0]  preg82_dreg;                        
wire    [95 :0]  preg82_rel_preg_expand;             
wire             preg82_release_vld;                 
wire    [4  :0]  preg82_reset_dst_reg;               
wire             preg82_reset_mapped;                
wire             preg82_retired_released_wb;         
wire             preg82_wb_vld;                      
wire    [3  :0]  preg83_create_vld;                  
wire             preg83_cur_state_dealloc;           
wire             preg83_dealloc_mask;                
wire             preg83_dealloc_vld;                 
wire    [31 :0]  preg83_dreg;                        
wire    [95 :0]  preg83_rel_preg_expand;             
wire             preg83_release_vld;                 
wire    [4  :0]  preg83_reset_dst_reg;               
wire             preg83_reset_mapped;                
wire             preg83_retired_released_wb;         
wire             preg83_wb_vld;                      
wire    [3  :0]  preg84_create_vld;                  
wire             preg84_cur_state_dealloc;           
wire             preg84_dealloc_mask;                
wire             preg84_dealloc_vld;                 
wire    [31 :0]  preg84_dreg;                        
wire    [95 :0]  preg84_rel_preg_expand;             
wire             preg84_release_vld;                 
wire    [4  :0]  preg84_reset_dst_reg;               
wire             preg84_reset_mapped;                
wire             preg84_retired_released_wb;         
wire             preg84_wb_vld;                      
wire    [3  :0]  preg85_create_vld;                  
wire             preg85_cur_state_dealloc;           
wire             preg85_dealloc_mask;                
wire             preg85_dealloc_vld;                 
wire    [31 :0]  preg85_dreg;                        
wire    [95 :0]  preg85_rel_preg_expand;             
wire             preg85_release_vld;                 
wire    [4  :0]  preg85_reset_dst_reg;               
wire             preg85_reset_mapped;                
wire             preg85_retired_released_wb;         
wire             preg85_wb_vld;                      
wire    [3  :0]  preg86_create_vld;                  
wire             preg86_cur_state_dealloc;           
wire             preg86_dealloc_mask;                
wire             preg86_dealloc_vld;                 
wire    [31 :0]  preg86_dreg;                        
wire    [95 :0]  preg86_rel_preg_expand;             
wire             preg86_release_vld;                 
wire    [4  :0]  preg86_reset_dst_reg;               
wire             preg86_reset_mapped;                
wire             preg86_retired_released_wb;         
wire             preg86_wb_vld;                      
wire    [3  :0]  preg87_create_vld;                  
wire             preg87_cur_state_dealloc;           
wire             preg87_dealloc_mask;                
wire             preg87_dealloc_vld;                 
wire    [31 :0]  preg87_dreg;                        
wire    [95 :0]  preg87_rel_preg_expand;             
wire             preg87_release_vld;                 
wire    [4  :0]  preg87_reset_dst_reg;               
wire             preg87_reset_mapped;                
wire             preg87_retired_released_wb;         
wire             preg87_wb_vld;                      
wire    [3  :0]  preg88_create_vld;                  
wire             preg88_cur_state_dealloc;           
wire             preg88_dealloc_mask;                
wire             preg88_dealloc_vld;                 
wire    [31 :0]  preg88_dreg;                        
wire    [95 :0]  preg88_rel_preg_expand;             
wire             preg88_release_vld;                 
wire    [4  :0]  preg88_reset_dst_reg;               
wire             preg88_reset_mapped;                
wire             preg88_retired_released_wb;         
wire             preg88_wb_vld;                      
wire    [3  :0]  preg89_create_vld;                  
wire             preg89_cur_state_dealloc;           
wire             preg89_dealloc_mask;                
wire             preg89_dealloc_vld;                 
wire    [31 :0]  preg89_dreg;                        
wire    [95 :0]  preg89_rel_preg_expand;             
wire             preg89_release_vld;                 
wire    [4  :0]  preg89_reset_dst_reg;               
wire             preg89_reset_mapped;                
wire             preg89_retired_released_wb;         
wire             preg89_wb_vld;                      
wire    [3  :0]  preg8_create_vld;                   
wire             preg8_cur_state_dealloc;            
wire             preg8_dealloc_mask;                 
wire             preg8_dealloc_vld;                  
wire    [31 :0]  preg8_dreg;                         
wire    [95 :0]  preg8_rel_preg_expand;              
wire             preg8_release_vld;                  
wire    [4  :0]  preg8_reset_dst_reg;                
wire             preg8_reset_mapped;                 
wire             preg8_retired_released_wb;          
wire             preg8_wb_vld;                       
wire    [3  :0]  preg90_create_vld;                  
wire             preg90_cur_state_dealloc;           
wire             preg90_dealloc_mask;                
wire             preg90_dealloc_vld;                 
wire    [31 :0]  preg90_dreg;                        
wire    [95 :0]  preg90_rel_preg_expand;             
wire             preg90_release_vld;                 
wire    [4  :0]  preg90_reset_dst_reg;               
wire             preg90_reset_mapped;                
wire             preg90_retired_released_wb;         
wire             preg90_wb_vld;                      
wire    [3  :0]  preg91_create_vld;                  
wire             preg91_cur_state_dealloc;           
wire             preg91_dealloc_mask;                
wire             preg91_dealloc_vld;                 
wire    [31 :0]  preg91_dreg;                        
wire    [95 :0]  preg91_rel_preg_expand;             
wire             preg91_release_vld;                 
wire    [4  :0]  preg91_reset_dst_reg;               
wire             preg91_reset_mapped;                
wire             preg91_retired_released_wb;         
wire             preg91_wb_vld;                      
wire    [3  :0]  preg92_create_vld;                  
wire             preg92_cur_state_dealloc;           
wire             preg92_dealloc_mask;                
wire             preg92_dealloc_vld;                 
wire    [31 :0]  preg92_dreg;                        
wire    [95 :0]  preg92_rel_preg_expand;             
wire             preg92_release_vld;                 
wire    [4  :0]  preg92_reset_dst_reg;               
wire             preg92_reset_mapped;                
wire             preg92_retired_released_wb;         
wire             preg92_wb_vld;                      
wire    [3  :0]  preg93_create_vld;                  
wire             preg93_cur_state_dealloc;           
wire             preg93_dealloc_mask;                
wire             preg93_dealloc_vld;                 
wire    [31 :0]  preg93_dreg;                        
wire    [95 :0]  preg93_rel_preg_expand;             
wire             preg93_release_vld;                 
wire    [4  :0]  preg93_reset_dst_reg;               
wire             preg93_reset_mapped;                
wire             preg93_retired_released_wb;         
wire             preg93_wb_vld;                      
wire    [3  :0]  preg94_create_vld;                  
wire             preg94_cur_state_dealloc;           
wire             preg94_dealloc_mask;                
wire             preg94_dealloc_vld;                 
wire    [31 :0]  preg94_dreg;                        
wire    [95 :0]  preg94_rel_preg_expand;             
wire             preg94_release_vld;                 
wire    [4  :0]  preg94_reset_dst_reg;               
wire             preg94_reset_mapped;                
wire             preg94_retired_released_wb;         
wire             preg94_wb_vld;                      
wire    [3  :0]  preg95_create_vld;                  
wire             preg95_cur_state_dealloc;           
wire             preg95_dealloc_mask;                
wire             preg95_dealloc_vld;                 
wire    [31 :0]  preg95_dreg;                        
wire    [95 :0]  preg95_rel_preg_expand;             
wire             preg95_release_vld;                 
wire    [4  :0]  preg95_reset_dst_reg;               
wire             preg95_reset_mapped;                
wire             preg95_retired_released_wb;         
wire             preg95_wb_vld;                      
wire    [3  :0]  preg9_create_vld;                   
wire             preg9_cur_state_dealloc;            
wire             preg9_dealloc_mask;                 
wire             preg9_dealloc_vld;                  
wire    [31 :0]  preg9_dreg;                         
wire    [95 :0]  preg9_rel_preg_expand;              
wire             preg9_release_vld;                  
wire    [4  :0]  preg9_reset_dst_reg;                
wire             preg9_reset_mapped;                 
wire             preg9_retired_released_wb;          
wire             preg9_wb_vld;                       
wire             pst_retire_retired_reg_wb;          
wire             pst_retired_ereg_wb;                
wire             pst_retired_freg_wb;                
wire             pst_retired_preg_wb;                
wire             pst_retired_reg_wb;                 
wire             pst_retired_vreg_wb;                
wire    [2  :0]  pst_top_retired_reg_wb;             
wire    [6  :0]  r0_preg;                            
wire    [95 :0]  r0_preg_expand;                     
wire    [6  :0]  r10_preg;                           
wire    [95 :0]  r10_preg_expand;                    
wire    [6  :0]  r11_preg;                           
wire    [95 :0]  r11_preg_expand;                    
wire    [6  :0]  r12_preg;                           
wire    [95 :0]  r12_preg_expand;                    
wire    [6  :0]  r13_preg;                           
wire    [95 :0]  r13_preg_expand;                    
wire    [6  :0]  r14_preg;                           
wire    [95 :0]  r14_preg_expand;                    
wire    [6  :0]  r15_preg;                           
wire    [95 :0]  r15_preg_expand;                    
wire    [6  :0]  r16_preg;                           
wire    [95 :0]  r16_preg_expand;                    
wire    [6  :0]  r17_preg;                           
wire    [95 :0]  r17_preg_expand;                    
wire    [6  :0]  r18_preg;                           
wire    [95 :0]  r18_preg_expand;                    
wire    [6  :0]  r19_preg;                           
wire    [95 :0]  r19_preg_expand;                    
wire    [6  :0]  r1_preg;                            
wire    [95 :0]  r1_preg_expand;                     
wire    [6  :0]  r20_preg;                           
wire    [95 :0]  r20_preg_expand;                    
wire    [6  :0]  r21_preg;                           
wire    [95 :0]  r21_preg_expand;                    
wire    [6  :0]  r22_preg;                           
wire    [95 :0]  r22_preg_expand;                    
wire    [6  :0]  r23_preg;                           
wire    [95 :0]  r23_preg_expand;                    
wire    [6  :0]  r24_preg;                           
wire    [95 :0]  r24_preg_expand;                    
wire    [6  :0]  r25_preg;                           
wire    [95 :0]  r25_preg_expand;                    
wire    [6  :0]  r26_preg;                           
wire    [95 :0]  r26_preg_expand;                    
wire    [6  :0]  r27_preg;                           
wire    [95 :0]  r27_preg_expand;                    
wire    [6  :0]  r28_preg;                           
wire    [95 :0]  r28_preg_expand;                    
wire    [6  :0]  r29_preg;                           
wire    [95 :0]  r29_preg_expand;                    
wire    [6  :0]  r2_preg;                            
wire    [95 :0]  r2_preg_expand;                     
wire    [6  :0]  r30_preg;                           
wire    [95 :0]  r30_preg_expand;                    
wire    [6  :0]  r31_preg;                           
wire    [95 :0]  r31_preg_expand;                    
wire    [6  :0]  r3_preg;                            
wire    [95 :0]  r3_preg_expand;                     
wire    [6  :0]  r4_preg;                            
wire    [95 :0]  r4_preg_expand;                     
wire    [6  :0]  r5_preg;                            
wire    [95 :0]  r5_preg_expand;                     
wire    [6  :0]  r6_preg;                            
wire    [95 :0]  r6_preg_expand;                     
wire    [6  :0]  r7_preg;                            
wire    [95 :0]  r7_preg_expand;                     
wire    [6  :0]  r8_preg;                            
wire    [95 :0]  r8_preg_expand;                     
wire    [6  :0]  r9_preg;                            
wire    [95 :0]  r9_preg_expand;                     
wire    [95 :0]  release_vld;                        
wire             retire_pst_async_flush;             
wire             retire_pst_wb_retire_inst0_preg_vld; 
wire             retire_pst_wb_retire_inst1_preg_vld; 
wire             retire_pst_wb_retire_inst2_preg_vld; 
wire    [95 :0]  retired_released_wb;                
wire             rob_pst_retire_inst0_gateclk_vld;   
wire    [6  :0]  rob_pst_retire_inst0_iid_updt_val;  
wire             rob_pst_retire_inst1_gateclk_vld;   
wire    [6  :0]  rob_pst_retire_inst1_iid_updt_val;  
wire             rob_pst_retire_inst2_gateclk_vld;   
wire    [6  :0]  rob_pst_retire_inst2_iid_updt_val;  
wire             rtu_had_inst_not_wb;                
wire    [6  :0]  rtu_idu_alloc_preg0;                
wire             rtu_idu_alloc_preg0_vld;            
wire    [6  :0]  rtu_idu_alloc_preg1;                
wire             rtu_idu_alloc_preg1_vld;            
wire    [6  :0]  rtu_idu_alloc_preg2;                
wire             rtu_idu_alloc_preg2_vld;            
wire    [6  :0]  rtu_idu_alloc_preg3;                
wire             rtu_idu_alloc_preg3_vld;            
wire             rtu_idu_pst_empty;                  
wire    [223:0]  rtu_idu_rt_recover_preg;            
wire             rtu_yy_xx_flush;                    
wire    [95 :0]  wb_vld;                             


//==========================================================
//                   Instance Entries
//==========================================================
//----------------------------------------------------------
//              GPR Physical Regsiters (Preg0)
//----------------------------------------------------------
//preg0 is constant0, treat preg0 always retired, wb and
//mapped to x0
// &Force ("nonport","preg0_create_vld"); @41
// &Force ("nonport","preg0_dealloc_gateclk_vld"); @42
// &Force ("nonport","preg0_dealloc_vld"); @43
// &Force ("nonport","preg0_release_vld"); @44
// &Force ("nonport","preg0_reset_dst_reg"); @45
// &Force ("nonport","preg0_reset_mapped"); @46
// &Force ("nonport","preg0_wb_vld"); @47
// &Force ("nonport","preg0_dealloc_mask"); @48
assign preg0_cur_state_dealloc     = 1'b0;
assign preg0_dreg[31:0]            = 32'b1;
assign preg0_rel_preg_expand[95:0] = 96'b0;
assign preg0_retired_released_wb   = 1'b1;

//----------------------------------------------------------
//              GPR Physical Regsiters (Preg)
//----------------------------------------------------------
// &ConnRule(s/^x_/preg1_/); @65
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg1"); @66
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg1 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg1_create_vld                   ),
  .x_cur_state_dealloc                 (preg1_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg1_dealloc_mask                 ),
  .x_dealloc_vld                       (preg1_dealloc_vld                  ),
  .x_dreg                              (preg1_dreg                         ),
  .x_rel_preg_expand                   (preg1_rel_preg_expand              ),
  .x_release_vld                       (preg1_release_vld                  ),
  .x_reset_dst_reg                     (preg1_reset_dst_reg                ),
  .x_reset_mapped                      (preg1_reset_mapped                 ),
  .x_retired_released_wb               (preg1_retired_released_wb          ),
  .x_wb_vld                            (preg1_wb_vld                       )
);

// &ConnRule(s/^x_/preg2_/); @67
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg2"); @68
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg2 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg2_create_vld                   ),
  .x_cur_state_dealloc                 (preg2_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg2_dealloc_mask                 ),
  .x_dealloc_vld                       (preg2_dealloc_vld                  ),
  .x_dreg                              (preg2_dreg                         ),
  .x_rel_preg_expand                   (preg2_rel_preg_expand              ),
  .x_release_vld                       (preg2_release_vld                  ),
  .x_reset_dst_reg                     (preg2_reset_dst_reg                ),
  .x_reset_mapped                      (preg2_reset_mapped                 ),
  .x_retired_released_wb               (preg2_retired_released_wb          ),
  .x_wb_vld                            (preg2_wb_vld                       )
);

// &ConnRule(s/^x_/preg3_/); @69
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg3"); @70
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg3 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg3_create_vld                   ),
  .x_cur_state_dealloc                 (preg3_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg3_dealloc_mask                 ),
  .x_dealloc_vld                       (preg3_dealloc_vld                  ),
  .x_dreg                              (preg3_dreg                         ),
  .x_rel_preg_expand                   (preg3_rel_preg_expand              ),
  .x_release_vld                       (preg3_release_vld                  ),
  .x_reset_dst_reg                     (preg3_reset_dst_reg                ),
  .x_reset_mapped                      (preg3_reset_mapped                 ),
  .x_retired_released_wb               (preg3_retired_released_wb          ),
  .x_wb_vld                            (preg3_wb_vld                       )
);

// &ConnRule(s/^x_/preg4_/); @71
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg4"); @72
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg4 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg4_create_vld                   ),
  .x_cur_state_dealloc                 (preg4_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg4_dealloc_mask                 ),
  .x_dealloc_vld                       (preg4_dealloc_vld                  ),
  .x_dreg                              (preg4_dreg                         ),
  .x_rel_preg_expand                   (preg4_rel_preg_expand              ),
  .x_release_vld                       (preg4_release_vld                  ),
  .x_reset_dst_reg                     (preg4_reset_dst_reg                ),
  .x_reset_mapped                      (preg4_reset_mapped                 ),
  .x_retired_released_wb               (preg4_retired_released_wb          ),
  .x_wb_vld                            (preg4_wb_vld                       )
);

// &ConnRule(s/^x_/preg5_/); @73
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg5"); @74
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg5 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg5_create_vld                   ),
  .x_cur_state_dealloc                 (preg5_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg5_dealloc_mask                 ),
  .x_dealloc_vld                       (preg5_dealloc_vld                  ),
  .x_dreg                              (preg5_dreg                         ),
  .x_rel_preg_expand                   (preg5_rel_preg_expand              ),
  .x_release_vld                       (preg5_release_vld                  ),
  .x_reset_dst_reg                     (preg5_reset_dst_reg                ),
  .x_reset_mapped                      (preg5_reset_mapped                 ),
  .x_retired_released_wb               (preg5_retired_released_wb          ),
  .x_wb_vld                            (preg5_wb_vld                       )
);

// &ConnRule(s/^x_/preg6_/); @75
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg6"); @76
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg6 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg6_create_vld                   ),
  .x_cur_state_dealloc                 (preg6_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg6_dealloc_mask                 ),
  .x_dealloc_vld                       (preg6_dealloc_vld                  ),
  .x_dreg                              (preg6_dreg                         ),
  .x_rel_preg_expand                   (preg6_rel_preg_expand              ),
  .x_release_vld                       (preg6_release_vld                  ),
  .x_reset_dst_reg                     (preg6_reset_dst_reg                ),
  .x_reset_mapped                      (preg6_reset_mapped                 ),
  .x_retired_released_wb               (preg6_retired_released_wb          ),
  .x_wb_vld                            (preg6_wb_vld                       )
);

// &ConnRule(s/^x_/preg7_/); @77
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg7"); @78
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg7 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg7_create_vld                   ),
  .x_cur_state_dealloc                 (preg7_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg7_dealloc_mask                 ),
  .x_dealloc_vld                       (preg7_dealloc_vld                  ),
  .x_dreg                              (preg7_dreg                         ),
  .x_rel_preg_expand                   (preg7_rel_preg_expand              ),
  .x_release_vld                       (preg7_release_vld                  ),
  .x_reset_dst_reg                     (preg7_reset_dst_reg                ),
  .x_reset_mapped                      (preg7_reset_mapped                 ),
  .x_retired_released_wb               (preg7_retired_released_wb          ),
  .x_wb_vld                            (preg7_wb_vld                       )
);

// &ConnRule(s/^x_/preg8_/); @79
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg8"); @80
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg8 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg8_create_vld                   ),
  .x_cur_state_dealloc                 (preg8_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg8_dealloc_mask                 ),
  .x_dealloc_vld                       (preg8_dealloc_vld                  ),
  .x_dreg                              (preg8_dreg                         ),
  .x_rel_preg_expand                   (preg8_rel_preg_expand              ),
  .x_release_vld                       (preg8_release_vld                  ),
  .x_reset_dst_reg                     (preg8_reset_dst_reg                ),
  .x_reset_mapped                      (preg8_reset_mapped                 ),
  .x_retired_released_wb               (preg8_retired_released_wb          ),
  .x_wb_vld                            (preg8_wb_vld                       )
);

// &ConnRule(s/^x_/preg9_/); @81
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg9"); @82
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg9 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg9_create_vld                   ),
  .x_cur_state_dealloc                 (preg9_cur_state_dealloc            ),
  .x_dealloc_mask                      (preg9_dealloc_mask                 ),
  .x_dealloc_vld                       (preg9_dealloc_vld                  ),
  .x_dreg                              (preg9_dreg                         ),
  .x_rel_preg_expand                   (preg9_rel_preg_expand              ),
  .x_release_vld                       (preg9_release_vld                  ),
  .x_reset_dst_reg                     (preg9_reset_dst_reg                ),
  .x_reset_mapped                      (preg9_reset_mapped                 ),
  .x_retired_released_wb               (preg9_retired_released_wb          ),
  .x_wb_vld                            (preg9_wb_vld                       )
);

// &ConnRule(s/^x_/preg10_/); @83
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg10"); @84
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg10 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg10_create_vld                  ),
  .x_cur_state_dealloc                 (preg10_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg10_dealloc_mask                ),
  .x_dealloc_vld                       (preg10_dealloc_vld                 ),
  .x_dreg                              (preg10_dreg                        ),
  .x_rel_preg_expand                   (preg10_rel_preg_expand             ),
  .x_release_vld                       (preg10_release_vld                 ),
  .x_reset_dst_reg                     (preg10_reset_dst_reg               ),
  .x_reset_mapped                      (preg10_reset_mapped                ),
  .x_retired_released_wb               (preg10_retired_released_wb         ),
  .x_wb_vld                            (preg10_wb_vld                      )
);

// &ConnRule(s/^x_/preg11_/); @85
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg11"); @86
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg11 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg11_create_vld                  ),
  .x_cur_state_dealloc                 (preg11_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg11_dealloc_mask                ),
  .x_dealloc_vld                       (preg11_dealloc_vld                 ),
  .x_dreg                              (preg11_dreg                        ),
  .x_rel_preg_expand                   (preg11_rel_preg_expand             ),
  .x_release_vld                       (preg11_release_vld                 ),
  .x_reset_dst_reg                     (preg11_reset_dst_reg               ),
  .x_reset_mapped                      (preg11_reset_mapped                ),
  .x_retired_released_wb               (preg11_retired_released_wb         ),
  .x_wb_vld                            (preg11_wb_vld                      )
);

// &ConnRule(s/^x_/preg12_/); @87
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg12"); @88
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg12 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg12_create_vld                  ),
  .x_cur_state_dealloc                 (preg12_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg12_dealloc_mask                ),
  .x_dealloc_vld                       (preg12_dealloc_vld                 ),
  .x_dreg                              (preg12_dreg                        ),
  .x_rel_preg_expand                   (preg12_rel_preg_expand             ),
  .x_release_vld                       (preg12_release_vld                 ),
  .x_reset_dst_reg                     (preg12_reset_dst_reg               ),
  .x_reset_mapped                      (preg12_reset_mapped                ),
  .x_retired_released_wb               (preg12_retired_released_wb         ),
  .x_wb_vld                            (preg12_wb_vld                      )
);

// &ConnRule(s/^x_/preg13_/); @89
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg13"); @90
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg13 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg13_create_vld                  ),
  .x_cur_state_dealloc                 (preg13_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg13_dealloc_mask                ),
  .x_dealloc_vld                       (preg13_dealloc_vld                 ),
  .x_dreg                              (preg13_dreg                        ),
  .x_rel_preg_expand                   (preg13_rel_preg_expand             ),
  .x_release_vld                       (preg13_release_vld                 ),
  .x_reset_dst_reg                     (preg13_reset_dst_reg               ),
  .x_reset_mapped                      (preg13_reset_mapped                ),
  .x_retired_released_wb               (preg13_retired_released_wb         ),
  .x_wb_vld                            (preg13_wb_vld                      )
);

// &ConnRule(s/^x_/preg14_/); @91
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg14"); @92
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg14 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg14_create_vld                  ),
  .x_cur_state_dealloc                 (preg14_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg14_dealloc_mask                ),
  .x_dealloc_vld                       (preg14_dealloc_vld                 ),
  .x_dreg                              (preg14_dreg                        ),
  .x_rel_preg_expand                   (preg14_rel_preg_expand             ),
  .x_release_vld                       (preg14_release_vld                 ),
  .x_reset_dst_reg                     (preg14_reset_dst_reg               ),
  .x_reset_mapped                      (preg14_reset_mapped                ),
  .x_retired_released_wb               (preg14_retired_released_wb         ),
  .x_wb_vld                            (preg14_wb_vld                      )
);

// &ConnRule(s/^x_/preg15_/); @93
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg15"); @94
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg15 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg15_create_vld                  ),
  .x_cur_state_dealloc                 (preg15_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg15_dealloc_mask                ),
  .x_dealloc_vld                       (preg15_dealloc_vld                 ),
  .x_dreg                              (preg15_dreg                        ),
  .x_rel_preg_expand                   (preg15_rel_preg_expand             ),
  .x_release_vld                       (preg15_release_vld                 ),
  .x_reset_dst_reg                     (preg15_reset_dst_reg               ),
  .x_reset_mapped                      (preg15_reset_mapped                ),
  .x_retired_released_wb               (preg15_retired_released_wb         ),
  .x_wb_vld                            (preg15_wb_vld                      )
);

// &ConnRule(s/^x_/preg16_/); @95
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg16"); @96
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg16 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg16_create_vld                  ),
  .x_cur_state_dealloc                 (preg16_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg16_dealloc_mask                ),
  .x_dealloc_vld                       (preg16_dealloc_vld                 ),
  .x_dreg                              (preg16_dreg                        ),
  .x_rel_preg_expand                   (preg16_rel_preg_expand             ),
  .x_release_vld                       (preg16_release_vld                 ),
  .x_reset_dst_reg                     (preg16_reset_dst_reg               ),
  .x_reset_mapped                      (preg16_reset_mapped                ),
  .x_retired_released_wb               (preg16_retired_released_wb         ),
  .x_wb_vld                            (preg16_wb_vld                      )
);

// &ConnRule(s/^x_/preg17_/); @97
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg17"); @98
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg17 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg17_create_vld                  ),
  .x_cur_state_dealloc                 (preg17_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg17_dealloc_mask                ),
  .x_dealloc_vld                       (preg17_dealloc_vld                 ),
  .x_dreg                              (preg17_dreg                        ),
  .x_rel_preg_expand                   (preg17_rel_preg_expand             ),
  .x_release_vld                       (preg17_release_vld                 ),
  .x_reset_dst_reg                     (preg17_reset_dst_reg               ),
  .x_reset_mapped                      (preg17_reset_mapped                ),
  .x_retired_released_wb               (preg17_retired_released_wb         ),
  .x_wb_vld                            (preg17_wb_vld                      )
);

// &ConnRule(s/^x_/preg18_/); @99
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg18"); @100
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg18 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg18_create_vld                  ),
  .x_cur_state_dealloc                 (preg18_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg18_dealloc_mask                ),
  .x_dealloc_vld                       (preg18_dealloc_vld                 ),
  .x_dreg                              (preg18_dreg                        ),
  .x_rel_preg_expand                   (preg18_rel_preg_expand             ),
  .x_release_vld                       (preg18_release_vld                 ),
  .x_reset_dst_reg                     (preg18_reset_dst_reg               ),
  .x_reset_mapped                      (preg18_reset_mapped                ),
  .x_retired_released_wb               (preg18_retired_released_wb         ),
  .x_wb_vld                            (preg18_wb_vld                      )
);

// &ConnRule(s/^x_/preg19_/); @101
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg19"); @102
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg19 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg19_create_vld                  ),
  .x_cur_state_dealloc                 (preg19_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg19_dealloc_mask                ),
  .x_dealloc_vld                       (preg19_dealloc_vld                 ),
  .x_dreg                              (preg19_dreg                        ),
  .x_rel_preg_expand                   (preg19_rel_preg_expand             ),
  .x_release_vld                       (preg19_release_vld                 ),
  .x_reset_dst_reg                     (preg19_reset_dst_reg               ),
  .x_reset_mapped                      (preg19_reset_mapped                ),
  .x_retired_released_wb               (preg19_retired_released_wb         ),
  .x_wb_vld                            (preg19_wb_vld                      )
);

// &ConnRule(s/^x_/preg20_/); @103
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg20"); @104
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg20 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg20_create_vld                  ),
  .x_cur_state_dealloc                 (preg20_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg20_dealloc_mask                ),
  .x_dealloc_vld                       (preg20_dealloc_vld                 ),
  .x_dreg                              (preg20_dreg                        ),
  .x_rel_preg_expand                   (preg20_rel_preg_expand             ),
  .x_release_vld                       (preg20_release_vld                 ),
  .x_reset_dst_reg                     (preg20_reset_dst_reg               ),
  .x_reset_mapped                      (preg20_reset_mapped                ),
  .x_retired_released_wb               (preg20_retired_released_wb         ),
  .x_wb_vld                            (preg20_wb_vld                      )
);

// &ConnRule(s/^x_/preg21_/); @105
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg21"); @106
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg21 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg21_create_vld                  ),
  .x_cur_state_dealloc                 (preg21_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg21_dealloc_mask                ),
  .x_dealloc_vld                       (preg21_dealloc_vld                 ),
  .x_dreg                              (preg21_dreg                        ),
  .x_rel_preg_expand                   (preg21_rel_preg_expand             ),
  .x_release_vld                       (preg21_release_vld                 ),
  .x_reset_dst_reg                     (preg21_reset_dst_reg               ),
  .x_reset_mapped                      (preg21_reset_mapped                ),
  .x_retired_released_wb               (preg21_retired_released_wb         ),
  .x_wb_vld                            (preg21_wb_vld                      )
);

// &ConnRule(s/^x_/preg22_/); @107
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg22"); @108
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg22 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg22_create_vld                  ),
  .x_cur_state_dealloc                 (preg22_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg22_dealloc_mask                ),
  .x_dealloc_vld                       (preg22_dealloc_vld                 ),
  .x_dreg                              (preg22_dreg                        ),
  .x_rel_preg_expand                   (preg22_rel_preg_expand             ),
  .x_release_vld                       (preg22_release_vld                 ),
  .x_reset_dst_reg                     (preg22_reset_dst_reg               ),
  .x_reset_mapped                      (preg22_reset_mapped                ),
  .x_retired_released_wb               (preg22_retired_released_wb         ),
  .x_wb_vld                            (preg22_wb_vld                      )
);

// &ConnRule(s/^x_/preg23_/); @109
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg23"); @110
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg23 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg23_create_vld                  ),
  .x_cur_state_dealloc                 (preg23_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg23_dealloc_mask                ),
  .x_dealloc_vld                       (preg23_dealloc_vld                 ),
  .x_dreg                              (preg23_dreg                        ),
  .x_rel_preg_expand                   (preg23_rel_preg_expand             ),
  .x_release_vld                       (preg23_release_vld                 ),
  .x_reset_dst_reg                     (preg23_reset_dst_reg               ),
  .x_reset_mapped                      (preg23_reset_mapped                ),
  .x_retired_released_wb               (preg23_retired_released_wb         ),
  .x_wb_vld                            (preg23_wb_vld                      )
);

// &ConnRule(s/^x_/preg24_/); @111
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg24"); @112
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg24 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg24_create_vld                  ),
  .x_cur_state_dealloc                 (preg24_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg24_dealloc_mask                ),
  .x_dealloc_vld                       (preg24_dealloc_vld                 ),
  .x_dreg                              (preg24_dreg                        ),
  .x_rel_preg_expand                   (preg24_rel_preg_expand             ),
  .x_release_vld                       (preg24_release_vld                 ),
  .x_reset_dst_reg                     (preg24_reset_dst_reg               ),
  .x_reset_mapped                      (preg24_reset_mapped                ),
  .x_retired_released_wb               (preg24_retired_released_wb         ),
  .x_wb_vld                            (preg24_wb_vld                      )
);

// &ConnRule(s/^x_/preg25_/); @113
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg25"); @114
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg25 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg25_create_vld                  ),
  .x_cur_state_dealloc                 (preg25_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg25_dealloc_mask                ),
  .x_dealloc_vld                       (preg25_dealloc_vld                 ),
  .x_dreg                              (preg25_dreg                        ),
  .x_rel_preg_expand                   (preg25_rel_preg_expand             ),
  .x_release_vld                       (preg25_release_vld                 ),
  .x_reset_dst_reg                     (preg25_reset_dst_reg               ),
  .x_reset_mapped                      (preg25_reset_mapped                ),
  .x_retired_released_wb               (preg25_retired_released_wb         ),
  .x_wb_vld                            (preg25_wb_vld                      )
);

// &ConnRule(s/^x_/preg26_/); @115
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg26"); @116
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg26 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg26_create_vld                  ),
  .x_cur_state_dealloc                 (preg26_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg26_dealloc_mask                ),
  .x_dealloc_vld                       (preg26_dealloc_vld                 ),
  .x_dreg                              (preg26_dreg                        ),
  .x_rel_preg_expand                   (preg26_rel_preg_expand             ),
  .x_release_vld                       (preg26_release_vld                 ),
  .x_reset_dst_reg                     (preg26_reset_dst_reg               ),
  .x_reset_mapped                      (preg26_reset_mapped                ),
  .x_retired_released_wb               (preg26_retired_released_wb         ),
  .x_wb_vld                            (preg26_wb_vld                      )
);

// &ConnRule(s/^x_/preg27_/); @117
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg27"); @118
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg27 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg27_create_vld                  ),
  .x_cur_state_dealloc                 (preg27_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg27_dealloc_mask                ),
  .x_dealloc_vld                       (preg27_dealloc_vld                 ),
  .x_dreg                              (preg27_dreg                        ),
  .x_rel_preg_expand                   (preg27_rel_preg_expand             ),
  .x_release_vld                       (preg27_release_vld                 ),
  .x_reset_dst_reg                     (preg27_reset_dst_reg               ),
  .x_reset_mapped                      (preg27_reset_mapped                ),
  .x_retired_released_wb               (preg27_retired_released_wb         ),
  .x_wb_vld                            (preg27_wb_vld                      )
);

// &ConnRule(s/^x_/preg28_/); @119
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg28"); @120
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg28 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg28_create_vld                  ),
  .x_cur_state_dealloc                 (preg28_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg28_dealloc_mask                ),
  .x_dealloc_vld                       (preg28_dealloc_vld                 ),
  .x_dreg                              (preg28_dreg                        ),
  .x_rel_preg_expand                   (preg28_rel_preg_expand             ),
  .x_release_vld                       (preg28_release_vld                 ),
  .x_reset_dst_reg                     (preg28_reset_dst_reg               ),
  .x_reset_mapped                      (preg28_reset_mapped                ),
  .x_retired_released_wb               (preg28_retired_released_wb         ),
  .x_wb_vld                            (preg28_wb_vld                      )
);

// &ConnRule(s/^x_/preg29_/); @121
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg29"); @122
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg29 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg29_create_vld                  ),
  .x_cur_state_dealloc                 (preg29_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg29_dealloc_mask                ),
  .x_dealloc_vld                       (preg29_dealloc_vld                 ),
  .x_dreg                              (preg29_dreg                        ),
  .x_rel_preg_expand                   (preg29_rel_preg_expand             ),
  .x_release_vld                       (preg29_release_vld                 ),
  .x_reset_dst_reg                     (preg29_reset_dst_reg               ),
  .x_reset_mapped                      (preg29_reset_mapped                ),
  .x_retired_released_wb               (preg29_retired_released_wb         ),
  .x_wb_vld                            (preg29_wb_vld                      )
);

// &ConnRule(s/^x_/preg30_/); @123
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg30"); @124
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg30 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg30_create_vld                  ),
  .x_cur_state_dealloc                 (preg30_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg30_dealloc_mask                ),
  .x_dealloc_vld                       (preg30_dealloc_vld                 ),
  .x_dreg                              (preg30_dreg                        ),
  .x_rel_preg_expand                   (preg30_rel_preg_expand             ),
  .x_release_vld                       (preg30_release_vld                 ),
  .x_reset_dst_reg                     (preg30_reset_dst_reg               ),
  .x_reset_mapped                      (preg30_reset_mapped                ),
  .x_retired_released_wb               (preg30_retired_released_wb         ),
  .x_wb_vld                            (preg30_wb_vld                      )
);

// &ConnRule(s/^x_/preg31_/); @125
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg31"); @126
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg31 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg31_create_vld                  ),
  .x_cur_state_dealloc                 (preg31_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg31_dealloc_mask                ),
  .x_dealloc_vld                       (preg31_dealloc_vld                 ),
  .x_dreg                              (preg31_dreg                        ),
  .x_rel_preg_expand                   (preg31_rel_preg_expand             ),
  .x_release_vld                       (preg31_release_vld                 ),
  .x_reset_dst_reg                     (preg31_reset_dst_reg               ),
  .x_reset_mapped                      (preg31_reset_mapped                ),
  .x_retired_released_wb               (preg31_retired_released_wb         ),
  .x_wb_vld                            (preg31_wb_vld                      )
);

// &ConnRule(s/^x_/preg32_/); @127
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg32"); @128
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg32 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg32_create_vld                  ),
  .x_cur_state_dealloc                 (preg32_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg32_dealloc_mask                ),
  .x_dealloc_vld                       (preg32_dealloc_vld                 ),
  .x_dreg                              (preg32_dreg                        ),
  .x_rel_preg_expand                   (preg32_rel_preg_expand             ),
  .x_release_vld                       (preg32_release_vld                 ),
  .x_reset_dst_reg                     (preg32_reset_dst_reg               ),
  .x_reset_mapped                      (preg32_reset_mapped                ),
  .x_retired_released_wb               (preg32_retired_released_wb         ),
  .x_wb_vld                            (preg32_wb_vld                      )
);

// &ConnRule(s/^x_/preg33_/); @129
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg33"); @130
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg33 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg33_create_vld                  ),
  .x_cur_state_dealloc                 (preg33_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg33_dealloc_mask                ),
  .x_dealloc_vld                       (preg33_dealloc_vld                 ),
  .x_dreg                              (preg33_dreg                        ),
  .x_rel_preg_expand                   (preg33_rel_preg_expand             ),
  .x_release_vld                       (preg33_release_vld                 ),
  .x_reset_dst_reg                     (preg33_reset_dst_reg               ),
  .x_reset_mapped                      (preg33_reset_mapped                ),
  .x_retired_released_wb               (preg33_retired_released_wb         ),
  .x_wb_vld                            (preg33_wb_vld                      )
);

// &ConnRule(s/^x_/preg34_/); @131
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg34"); @132
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg34 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg34_create_vld                  ),
  .x_cur_state_dealloc                 (preg34_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg34_dealloc_mask                ),
  .x_dealloc_vld                       (preg34_dealloc_vld                 ),
  .x_dreg                              (preg34_dreg                        ),
  .x_rel_preg_expand                   (preg34_rel_preg_expand             ),
  .x_release_vld                       (preg34_release_vld                 ),
  .x_reset_dst_reg                     (preg34_reset_dst_reg               ),
  .x_reset_mapped                      (preg34_reset_mapped                ),
  .x_retired_released_wb               (preg34_retired_released_wb         ),
  .x_wb_vld                            (preg34_wb_vld                      )
);

// &ConnRule(s/^x_/preg35_/); @133
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg35"); @134
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg35 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg35_create_vld                  ),
  .x_cur_state_dealloc                 (preg35_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg35_dealloc_mask                ),
  .x_dealloc_vld                       (preg35_dealloc_vld                 ),
  .x_dreg                              (preg35_dreg                        ),
  .x_rel_preg_expand                   (preg35_rel_preg_expand             ),
  .x_release_vld                       (preg35_release_vld                 ),
  .x_reset_dst_reg                     (preg35_reset_dst_reg               ),
  .x_reset_mapped                      (preg35_reset_mapped                ),
  .x_retired_released_wb               (preg35_retired_released_wb         ),
  .x_wb_vld                            (preg35_wb_vld                      )
);

// &ConnRule(s/^x_/preg36_/); @135
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg36"); @136
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg36 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg36_create_vld                  ),
  .x_cur_state_dealloc                 (preg36_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg36_dealloc_mask                ),
  .x_dealloc_vld                       (preg36_dealloc_vld                 ),
  .x_dreg                              (preg36_dreg                        ),
  .x_rel_preg_expand                   (preg36_rel_preg_expand             ),
  .x_release_vld                       (preg36_release_vld                 ),
  .x_reset_dst_reg                     (preg36_reset_dst_reg               ),
  .x_reset_mapped                      (preg36_reset_mapped                ),
  .x_retired_released_wb               (preg36_retired_released_wb         ),
  .x_wb_vld                            (preg36_wb_vld                      )
);

// &ConnRule(s/^x_/preg37_/); @137
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg37"); @138
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg37 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg37_create_vld                  ),
  .x_cur_state_dealloc                 (preg37_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg37_dealloc_mask                ),
  .x_dealloc_vld                       (preg37_dealloc_vld                 ),
  .x_dreg                              (preg37_dreg                        ),
  .x_rel_preg_expand                   (preg37_rel_preg_expand             ),
  .x_release_vld                       (preg37_release_vld                 ),
  .x_reset_dst_reg                     (preg37_reset_dst_reg               ),
  .x_reset_mapped                      (preg37_reset_mapped                ),
  .x_retired_released_wb               (preg37_retired_released_wb         ),
  .x_wb_vld                            (preg37_wb_vld                      )
);

// &ConnRule(s/^x_/preg38_/); @139
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg38"); @140
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg38 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg38_create_vld                  ),
  .x_cur_state_dealloc                 (preg38_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg38_dealloc_mask                ),
  .x_dealloc_vld                       (preg38_dealloc_vld                 ),
  .x_dreg                              (preg38_dreg                        ),
  .x_rel_preg_expand                   (preg38_rel_preg_expand             ),
  .x_release_vld                       (preg38_release_vld                 ),
  .x_reset_dst_reg                     (preg38_reset_dst_reg               ),
  .x_reset_mapped                      (preg38_reset_mapped                ),
  .x_retired_released_wb               (preg38_retired_released_wb         ),
  .x_wb_vld                            (preg38_wb_vld                      )
);

// &ConnRule(s/^x_/preg39_/); @141
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg39"); @142
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg39 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg39_create_vld                  ),
  .x_cur_state_dealloc                 (preg39_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg39_dealloc_mask                ),
  .x_dealloc_vld                       (preg39_dealloc_vld                 ),
  .x_dreg                              (preg39_dreg                        ),
  .x_rel_preg_expand                   (preg39_rel_preg_expand             ),
  .x_release_vld                       (preg39_release_vld                 ),
  .x_reset_dst_reg                     (preg39_reset_dst_reg               ),
  .x_reset_mapped                      (preg39_reset_mapped                ),
  .x_retired_released_wb               (preg39_retired_released_wb         ),
  .x_wb_vld                            (preg39_wb_vld                      )
);

// &ConnRule(s/^x_/preg40_/); @143
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg40"); @144
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg40 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg40_create_vld                  ),
  .x_cur_state_dealloc                 (preg40_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg40_dealloc_mask                ),
  .x_dealloc_vld                       (preg40_dealloc_vld                 ),
  .x_dreg                              (preg40_dreg                        ),
  .x_rel_preg_expand                   (preg40_rel_preg_expand             ),
  .x_release_vld                       (preg40_release_vld                 ),
  .x_reset_dst_reg                     (preg40_reset_dst_reg               ),
  .x_reset_mapped                      (preg40_reset_mapped                ),
  .x_retired_released_wb               (preg40_retired_released_wb         ),
  .x_wb_vld                            (preg40_wb_vld                      )
);

// &ConnRule(s/^x_/preg41_/); @145
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg41"); @146
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg41 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg41_create_vld                  ),
  .x_cur_state_dealloc                 (preg41_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg41_dealloc_mask                ),
  .x_dealloc_vld                       (preg41_dealloc_vld                 ),
  .x_dreg                              (preg41_dreg                        ),
  .x_rel_preg_expand                   (preg41_rel_preg_expand             ),
  .x_release_vld                       (preg41_release_vld                 ),
  .x_reset_dst_reg                     (preg41_reset_dst_reg               ),
  .x_reset_mapped                      (preg41_reset_mapped                ),
  .x_retired_released_wb               (preg41_retired_released_wb         ),
  .x_wb_vld                            (preg41_wb_vld                      )
);

// &ConnRule(s/^x_/preg42_/); @147
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg42"); @148
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg42 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg42_create_vld                  ),
  .x_cur_state_dealloc                 (preg42_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg42_dealloc_mask                ),
  .x_dealloc_vld                       (preg42_dealloc_vld                 ),
  .x_dreg                              (preg42_dreg                        ),
  .x_rel_preg_expand                   (preg42_rel_preg_expand             ),
  .x_release_vld                       (preg42_release_vld                 ),
  .x_reset_dst_reg                     (preg42_reset_dst_reg               ),
  .x_reset_mapped                      (preg42_reset_mapped                ),
  .x_retired_released_wb               (preg42_retired_released_wb         ),
  .x_wb_vld                            (preg42_wb_vld                      )
);

// &ConnRule(s/^x_/preg43_/); @149
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg43"); @150
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg43 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg43_create_vld                  ),
  .x_cur_state_dealloc                 (preg43_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg43_dealloc_mask                ),
  .x_dealloc_vld                       (preg43_dealloc_vld                 ),
  .x_dreg                              (preg43_dreg                        ),
  .x_rel_preg_expand                   (preg43_rel_preg_expand             ),
  .x_release_vld                       (preg43_release_vld                 ),
  .x_reset_dst_reg                     (preg43_reset_dst_reg               ),
  .x_reset_mapped                      (preg43_reset_mapped                ),
  .x_retired_released_wb               (preg43_retired_released_wb         ),
  .x_wb_vld                            (preg43_wb_vld                      )
);

// &ConnRule(s/^x_/preg44_/); @151
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg44"); @152
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg44 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg44_create_vld                  ),
  .x_cur_state_dealloc                 (preg44_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg44_dealloc_mask                ),
  .x_dealloc_vld                       (preg44_dealloc_vld                 ),
  .x_dreg                              (preg44_dreg                        ),
  .x_rel_preg_expand                   (preg44_rel_preg_expand             ),
  .x_release_vld                       (preg44_release_vld                 ),
  .x_reset_dst_reg                     (preg44_reset_dst_reg               ),
  .x_reset_mapped                      (preg44_reset_mapped                ),
  .x_retired_released_wb               (preg44_retired_released_wb         ),
  .x_wb_vld                            (preg44_wb_vld                      )
);

// &ConnRule(s/^x_/preg45_/); @153
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg45"); @154
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg45 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg45_create_vld                  ),
  .x_cur_state_dealloc                 (preg45_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg45_dealloc_mask                ),
  .x_dealloc_vld                       (preg45_dealloc_vld                 ),
  .x_dreg                              (preg45_dreg                        ),
  .x_rel_preg_expand                   (preg45_rel_preg_expand             ),
  .x_release_vld                       (preg45_release_vld                 ),
  .x_reset_dst_reg                     (preg45_reset_dst_reg               ),
  .x_reset_mapped                      (preg45_reset_mapped                ),
  .x_retired_released_wb               (preg45_retired_released_wb         ),
  .x_wb_vld                            (preg45_wb_vld                      )
);

// &ConnRule(s/^x_/preg46_/); @155
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg46"); @156
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg46 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg46_create_vld                  ),
  .x_cur_state_dealloc                 (preg46_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg46_dealloc_mask                ),
  .x_dealloc_vld                       (preg46_dealloc_vld                 ),
  .x_dreg                              (preg46_dreg                        ),
  .x_rel_preg_expand                   (preg46_rel_preg_expand             ),
  .x_release_vld                       (preg46_release_vld                 ),
  .x_reset_dst_reg                     (preg46_reset_dst_reg               ),
  .x_reset_mapped                      (preg46_reset_mapped                ),
  .x_retired_released_wb               (preg46_retired_released_wb         ),
  .x_wb_vld                            (preg46_wb_vld                      )
);

// &ConnRule(s/^x_/preg47_/); @157
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg47"); @158
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg47 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg47_create_vld                  ),
  .x_cur_state_dealloc                 (preg47_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg47_dealloc_mask                ),
  .x_dealloc_vld                       (preg47_dealloc_vld                 ),
  .x_dreg                              (preg47_dreg                        ),
  .x_rel_preg_expand                   (preg47_rel_preg_expand             ),
  .x_release_vld                       (preg47_release_vld                 ),
  .x_reset_dst_reg                     (preg47_reset_dst_reg               ),
  .x_reset_mapped                      (preg47_reset_mapped                ),
  .x_retired_released_wb               (preg47_retired_released_wb         ),
  .x_wb_vld                            (preg47_wb_vld                      )
);

// &ConnRule(s/^x_/preg48_/); @159
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg48"); @160
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg48 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg48_create_vld                  ),
  .x_cur_state_dealloc                 (preg48_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg48_dealloc_mask                ),
  .x_dealloc_vld                       (preg48_dealloc_vld                 ),
  .x_dreg                              (preg48_dreg                        ),
  .x_rel_preg_expand                   (preg48_rel_preg_expand             ),
  .x_release_vld                       (preg48_release_vld                 ),
  .x_reset_dst_reg                     (preg48_reset_dst_reg               ),
  .x_reset_mapped                      (preg48_reset_mapped                ),
  .x_retired_released_wb               (preg48_retired_released_wb         ),
  .x_wb_vld                            (preg48_wb_vld                      )
);

// &ConnRule(s/^x_/preg49_/); @161
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg49"); @162
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg49 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg49_create_vld                  ),
  .x_cur_state_dealloc                 (preg49_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg49_dealloc_mask                ),
  .x_dealloc_vld                       (preg49_dealloc_vld                 ),
  .x_dreg                              (preg49_dreg                        ),
  .x_rel_preg_expand                   (preg49_rel_preg_expand             ),
  .x_release_vld                       (preg49_release_vld                 ),
  .x_reset_dst_reg                     (preg49_reset_dst_reg               ),
  .x_reset_mapped                      (preg49_reset_mapped                ),
  .x_retired_released_wb               (preg49_retired_released_wb         ),
  .x_wb_vld                            (preg49_wb_vld                      )
);

// &ConnRule(s/^x_/preg50_/); @163
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg50"); @164
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg50 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg50_create_vld                  ),
  .x_cur_state_dealloc                 (preg50_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg50_dealloc_mask                ),
  .x_dealloc_vld                       (preg50_dealloc_vld                 ),
  .x_dreg                              (preg50_dreg                        ),
  .x_rel_preg_expand                   (preg50_rel_preg_expand             ),
  .x_release_vld                       (preg50_release_vld                 ),
  .x_reset_dst_reg                     (preg50_reset_dst_reg               ),
  .x_reset_mapped                      (preg50_reset_mapped                ),
  .x_retired_released_wb               (preg50_retired_released_wb         ),
  .x_wb_vld                            (preg50_wb_vld                      )
);

// &ConnRule(s/^x_/preg51_/); @165
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg51"); @166
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg51 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg51_create_vld                  ),
  .x_cur_state_dealloc                 (preg51_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg51_dealloc_mask                ),
  .x_dealloc_vld                       (preg51_dealloc_vld                 ),
  .x_dreg                              (preg51_dreg                        ),
  .x_rel_preg_expand                   (preg51_rel_preg_expand             ),
  .x_release_vld                       (preg51_release_vld                 ),
  .x_reset_dst_reg                     (preg51_reset_dst_reg               ),
  .x_reset_mapped                      (preg51_reset_mapped                ),
  .x_retired_released_wb               (preg51_retired_released_wb         ),
  .x_wb_vld                            (preg51_wb_vld                      )
);

// &ConnRule(s/^x_/preg52_/); @167
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg52"); @168
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg52 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg52_create_vld                  ),
  .x_cur_state_dealloc                 (preg52_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg52_dealloc_mask                ),
  .x_dealloc_vld                       (preg52_dealloc_vld                 ),
  .x_dreg                              (preg52_dreg                        ),
  .x_rel_preg_expand                   (preg52_rel_preg_expand             ),
  .x_release_vld                       (preg52_release_vld                 ),
  .x_reset_dst_reg                     (preg52_reset_dst_reg               ),
  .x_reset_mapped                      (preg52_reset_mapped                ),
  .x_retired_released_wb               (preg52_retired_released_wb         ),
  .x_wb_vld                            (preg52_wb_vld                      )
);

// &ConnRule(s/^x_/preg53_/); @169
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg53"); @170
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg53 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg53_create_vld                  ),
  .x_cur_state_dealloc                 (preg53_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg53_dealloc_mask                ),
  .x_dealloc_vld                       (preg53_dealloc_vld                 ),
  .x_dreg                              (preg53_dreg                        ),
  .x_rel_preg_expand                   (preg53_rel_preg_expand             ),
  .x_release_vld                       (preg53_release_vld                 ),
  .x_reset_dst_reg                     (preg53_reset_dst_reg               ),
  .x_reset_mapped                      (preg53_reset_mapped                ),
  .x_retired_released_wb               (preg53_retired_released_wb         ),
  .x_wb_vld                            (preg53_wb_vld                      )
);

// &ConnRule(s/^x_/preg54_/); @171
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg54"); @172
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg54 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg54_create_vld                  ),
  .x_cur_state_dealloc                 (preg54_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg54_dealloc_mask                ),
  .x_dealloc_vld                       (preg54_dealloc_vld                 ),
  .x_dreg                              (preg54_dreg                        ),
  .x_rel_preg_expand                   (preg54_rel_preg_expand             ),
  .x_release_vld                       (preg54_release_vld                 ),
  .x_reset_dst_reg                     (preg54_reset_dst_reg               ),
  .x_reset_mapped                      (preg54_reset_mapped                ),
  .x_retired_released_wb               (preg54_retired_released_wb         ),
  .x_wb_vld                            (preg54_wb_vld                      )
);

// &ConnRule(s/^x_/preg55_/); @173
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg55"); @174
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg55 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg55_create_vld                  ),
  .x_cur_state_dealloc                 (preg55_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg55_dealloc_mask                ),
  .x_dealloc_vld                       (preg55_dealloc_vld                 ),
  .x_dreg                              (preg55_dreg                        ),
  .x_rel_preg_expand                   (preg55_rel_preg_expand             ),
  .x_release_vld                       (preg55_release_vld                 ),
  .x_reset_dst_reg                     (preg55_reset_dst_reg               ),
  .x_reset_mapped                      (preg55_reset_mapped                ),
  .x_retired_released_wb               (preg55_retired_released_wb         ),
  .x_wb_vld                            (preg55_wb_vld                      )
);

// &ConnRule(s/^x_/preg56_/); @175
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg56"); @176
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg56 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg56_create_vld                  ),
  .x_cur_state_dealloc                 (preg56_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg56_dealloc_mask                ),
  .x_dealloc_vld                       (preg56_dealloc_vld                 ),
  .x_dreg                              (preg56_dreg                        ),
  .x_rel_preg_expand                   (preg56_rel_preg_expand             ),
  .x_release_vld                       (preg56_release_vld                 ),
  .x_reset_dst_reg                     (preg56_reset_dst_reg               ),
  .x_reset_mapped                      (preg56_reset_mapped                ),
  .x_retired_released_wb               (preg56_retired_released_wb         ),
  .x_wb_vld                            (preg56_wb_vld                      )
);

// &ConnRule(s/^x_/preg57_/); @177
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg57"); @178
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg57 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg57_create_vld                  ),
  .x_cur_state_dealloc                 (preg57_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg57_dealloc_mask                ),
  .x_dealloc_vld                       (preg57_dealloc_vld                 ),
  .x_dreg                              (preg57_dreg                        ),
  .x_rel_preg_expand                   (preg57_rel_preg_expand             ),
  .x_release_vld                       (preg57_release_vld                 ),
  .x_reset_dst_reg                     (preg57_reset_dst_reg               ),
  .x_reset_mapped                      (preg57_reset_mapped                ),
  .x_retired_released_wb               (preg57_retired_released_wb         ),
  .x_wb_vld                            (preg57_wb_vld                      )
);

// &ConnRule(s/^x_/preg58_/); @179
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg58"); @180
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg58 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg58_create_vld                  ),
  .x_cur_state_dealloc                 (preg58_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg58_dealloc_mask                ),
  .x_dealloc_vld                       (preg58_dealloc_vld                 ),
  .x_dreg                              (preg58_dreg                        ),
  .x_rel_preg_expand                   (preg58_rel_preg_expand             ),
  .x_release_vld                       (preg58_release_vld                 ),
  .x_reset_dst_reg                     (preg58_reset_dst_reg               ),
  .x_reset_mapped                      (preg58_reset_mapped                ),
  .x_retired_released_wb               (preg58_retired_released_wb         ),
  .x_wb_vld                            (preg58_wb_vld                      )
);

// &ConnRule(s/^x_/preg59_/); @181
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg59"); @182
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg59 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg59_create_vld                  ),
  .x_cur_state_dealloc                 (preg59_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg59_dealloc_mask                ),
  .x_dealloc_vld                       (preg59_dealloc_vld                 ),
  .x_dreg                              (preg59_dreg                        ),
  .x_rel_preg_expand                   (preg59_rel_preg_expand             ),
  .x_release_vld                       (preg59_release_vld                 ),
  .x_reset_dst_reg                     (preg59_reset_dst_reg               ),
  .x_reset_mapped                      (preg59_reset_mapped                ),
  .x_retired_released_wb               (preg59_retired_released_wb         ),
  .x_wb_vld                            (preg59_wb_vld                      )
);

// &ConnRule(s/^x_/preg60_/); @183
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg60"); @184
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg60 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg60_create_vld                  ),
  .x_cur_state_dealloc                 (preg60_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg60_dealloc_mask                ),
  .x_dealloc_vld                       (preg60_dealloc_vld                 ),
  .x_dreg                              (preg60_dreg                        ),
  .x_rel_preg_expand                   (preg60_rel_preg_expand             ),
  .x_release_vld                       (preg60_release_vld                 ),
  .x_reset_dst_reg                     (preg60_reset_dst_reg               ),
  .x_reset_mapped                      (preg60_reset_mapped                ),
  .x_retired_released_wb               (preg60_retired_released_wb         ),
  .x_wb_vld                            (preg60_wb_vld                      )
);

// &ConnRule(s/^x_/preg61_/); @185
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg61"); @186
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg61 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg61_create_vld                  ),
  .x_cur_state_dealloc                 (preg61_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg61_dealloc_mask                ),
  .x_dealloc_vld                       (preg61_dealloc_vld                 ),
  .x_dreg                              (preg61_dreg                        ),
  .x_rel_preg_expand                   (preg61_rel_preg_expand             ),
  .x_release_vld                       (preg61_release_vld                 ),
  .x_reset_dst_reg                     (preg61_reset_dst_reg               ),
  .x_reset_mapped                      (preg61_reset_mapped                ),
  .x_retired_released_wb               (preg61_retired_released_wb         ),
  .x_wb_vld                            (preg61_wb_vld                      )
);

// &ConnRule(s/^x_/preg62_/); @187
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg62"); @188
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg62 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg62_create_vld                  ),
  .x_cur_state_dealloc                 (preg62_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg62_dealloc_mask                ),
  .x_dealloc_vld                       (preg62_dealloc_vld                 ),
  .x_dreg                              (preg62_dreg                        ),
  .x_rel_preg_expand                   (preg62_rel_preg_expand             ),
  .x_release_vld                       (preg62_release_vld                 ),
  .x_reset_dst_reg                     (preg62_reset_dst_reg               ),
  .x_reset_mapped                      (preg62_reset_mapped                ),
  .x_retired_released_wb               (preg62_retired_released_wb         ),
  .x_wb_vld                            (preg62_wb_vld                      )
);

// &ConnRule(s/^x_/preg63_/); @189
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg63"); @190
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg63 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg63_create_vld                  ),
  .x_cur_state_dealloc                 (preg63_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg63_dealloc_mask                ),
  .x_dealloc_vld                       (preg63_dealloc_vld                 ),
  .x_dreg                              (preg63_dreg                        ),
  .x_rel_preg_expand                   (preg63_rel_preg_expand             ),
  .x_release_vld                       (preg63_release_vld                 ),
  .x_reset_dst_reg                     (preg63_reset_dst_reg               ),
  .x_reset_mapped                      (preg63_reset_mapped                ),
  .x_retired_released_wb               (preg63_retired_released_wb         ),
  .x_wb_vld                            (preg63_wb_vld                      )
);

// &ConnRule(s/^x_/preg64_/); @191
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg64"); @192
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg64 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg64_create_vld                  ),
  .x_cur_state_dealloc                 (preg64_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg64_dealloc_mask                ),
  .x_dealloc_vld                       (preg64_dealloc_vld                 ),
  .x_dreg                              (preg64_dreg                        ),
  .x_rel_preg_expand                   (preg64_rel_preg_expand             ),
  .x_release_vld                       (preg64_release_vld                 ),
  .x_reset_dst_reg                     (preg64_reset_dst_reg               ),
  .x_reset_mapped                      (preg64_reset_mapped                ),
  .x_retired_released_wb               (preg64_retired_released_wb         ),
  .x_wb_vld                            (preg64_wb_vld                      )
);

// &ConnRule(s/^x_/preg65_/); @193
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg65"); @194
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg65 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg65_create_vld                  ),
  .x_cur_state_dealloc                 (preg65_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg65_dealloc_mask                ),
  .x_dealloc_vld                       (preg65_dealloc_vld                 ),
  .x_dreg                              (preg65_dreg                        ),
  .x_rel_preg_expand                   (preg65_rel_preg_expand             ),
  .x_release_vld                       (preg65_release_vld                 ),
  .x_reset_dst_reg                     (preg65_reset_dst_reg               ),
  .x_reset_mapped                      (preg65_reset_mapped                ),
  .x_retired_released_wb               (preg65_retired_released_wb         ),
  .x_wb_vld                            (preg65_wb_vld                      )
);

// &ConnRule(s/^x_/preg66_/); @195
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg66"); @196
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg66 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg66_create_vld                  ),
  .x_cur_state_dealloc                 (preg66_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg66_dealloc_mask                ),
  .x_dealloc_vld                       (preg66_dealloc_vld                 ),
  .x_dreg                              (preg66_dreg                        ),
  .x_rel_preg_expand                   (preg66_rel_preg_expand             ),
  .x_release_vld                       (preg66_release_vld                 ),
  .x_reset_dst_reg                     (preg66_reset_dst_reg               ),
  .x_reset_mapped                      (preg66_reset_mapped                ),
  .x_retired_released_wb               (preg66_retired_released_wb         ),
  .x_wb_vld                            (preg66_wb_vld                      )
);

// &ConnRule(s/^x_/preg67_/); @197
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg67"); @198
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg67 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg67_create_vld                  ),
  .x_cur_state_dealloc                 (preg67_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg67_dealloc_mask                ),
  .x_dealloc_vld                       (preg67_dealloc_vld                 ),
  .x_dreg                              (preg67_dreg                        ),
  .x_rel_preg_expand                   (preg67_rel_preg_expand             ),
  .x_release_vld                       (preg67_release_vld                 ),
  .x_reset_dst_reg                     (preg67_reset_dst_reg               ),
  .x_reset_mapped                      (preg67_reset_mapped                ),
  .x_retired_released_wb               (preg67_retired_released_wb         ),
  .x_wb_vld                            (preg67_wb_vld                      )
);

// &ConnRule(s/^x_/preg68_/); @199
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg68"); @200
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg68 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg68_create_vld                  ),
  .x_cur_state_dealloc                 (preg68_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg68_dealloc_mask                ),
  .x_dealloc_vld                       (preg68_dealloc_vld                 ),
  .x_dreg                              (preg68_dreg                        ),
  .x_rel_preg_expand                   (preg68_rel_preg_expand             ),
  .x_release_vld                       (preg68_release_vld                 ),
  .x_reset_dst_reg                     (preg68_reset_dst_reg               ),
  .x_reset_mapped                      (preg68_reset_mapped                ),
  .x_retired_released_wb               (preg68_retired_released_wb         ),
  .x_wb_vld                            (preg68_wb_vld                      )
);

// &ConnRule(s/^x_/preg69_/); @201
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg69"); @202
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg69 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg69_create_vld                  ),
  .x_cur_state_dealloc                 (preg69_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg69_dealloc_mask                ),
  .x_dealloc_vld                       (preg69_dealloc_vld                 ),
  .x_dreg                              (preg69_dreg                        ),
  .x_rel_preg_expand                   (preg69_rel_preg_expand             ),
  .x_release_vld                       (preg69_release_vld                 ),
  .x_reset_dst_reg                     (preg69_reset_dst_reg               ),
  .x_reset_mapped                      (preg69_reset_mapped                ),
  .x_retired_released_wb               (preg69_retired_released_wb         ),
  .x_wb_vld                            (preg69_wb_vld                      )
);

// &ConnRule(s/^x_/preg70_/); @203
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg70"); @204
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg70 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg70_create_vld                  ),
  .x_cur_state_dealloc                 (preg70_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg70_dealloc_mask                ),
  .x_dealloc_vld                       (preg70_dealloc_vld                 ),
  .x_dreg                              (preg70_dreg                        ),
  .x_rel_preg_expand                   (preg70_rel_preg_expand             ),
  .x_release_vld                       (preg70_release_vld                 ),
  .x_reset_dst_reg                     (preg70_reset_dst_reg               ),
  .x_reset_mapped                      (preg70_reset_mapped                ),
  .x_retired_released_wb               (preg70_retired_released_wb         ),
  .x_wb_vld                            (preg70_wb_vld                      )
);

// &ConnRule(s/^x_/preg71_/); @205
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg71"); @206
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg71 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg71_create_vld                  ),
  .x_cur_state_dealloc                 (preg71_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg71_dealloc_mask                ),
  .x_dealloc_vld                       (preg71_dealloc_vld                 ),
  .x_dreg                              (preg71_dreg                        ),
  .x_rel_preg_expand                   (preg71_rel_preg_expand             ),
  .x_release_vld                       (preg71_release_vld                 ),
  .x_reset_dst_reg                     (preg71_reset_dst_reg               ),
  .x_reset_mapped                      (preg71_reset_mapped                ),
  .x_retired_released_wb               (preg71_retired_released_wb         ),
  .x_wb_vld                            (preg71_wb_vld                      )
);

// &ConnRule(s/^x_/preg72_/); @207
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg72"); @208
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg72 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg72_create_vld                  ),
  .x_cur_state_dealloc                 (preg72_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg72_dealloc_mask                ),
  .x_dealloc_vld                       (preg72_dealloc_vld                 ),
  .x_dreg                              (preg72_dreg                        ),
  .x_rel_preg_expand                   (preg72_rel_preg_expand             ),
  .x_release_vld                       (preg72_release_vld                 ),
  .x_reset_dst_reg                     (preg72_reset_dst_reg               ),
  .x_reset_mapped                      (preg72_reset_mapped                ),
  .x_retired_released_wb               (preg72_retired_released_wb         ),
  .x_wb_vld                            (preg72_wb_vld                      )
);

// &ConnRule(s/^x_/preg73_/); @209
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg73"); @210
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg73 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg73_create_vld                  ),
  .x_cur_state_dealloc                 (preg73_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg73_dealloc_mask                ),
  .x_dealloc_vld                       (preg73_dealloc_vld                 ),
  .x_dreg                              (preg73_dreg                        ),
  .x_rel_preg_expand                   (preg73_rel_preg_expand             ),
  .x_release_vld                       (preg73_release_vld                 ),
  .x_reset_dst_reg                     (preg73_reset_dst_reg               ),
  .x_reset_mapped                      (preg73_reset_mapped                ),
  .x_retired_released_wb               (preg73_retired_released_wb         ),
  .x_wb_vld                            (preg73_wb_vld                      )
);

// &ConnRule(s/^x_/preg74_/); @211
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg74"); @212
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg74 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg74_create_vld                  ),
  .x_cur_state_dealloc                 (preg74_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg74_dealloc_mask                ),
  .x_dealloc_vld                       (preg74_dealloc_vld                 ),
  .x_dreg                              (preg74_dreg                        ),
  .x_rel_preg_expand                   (preg74_rel_preg_expand             ),
  .x_release_vld                       (preg74_release_vld                 ),
  .x_reset_dst_reg                     (preg74_reset_dst_reg               ),
  .x_reset_mapped                      (preg74_reset_mapped                ),
  .x_retired_released_wb               (preg74_retired_released_wb         ),
  .x_wb_vld                            (preg74_wb_vld                      )
);

// &ConnRule(s/^x_/preg75_/); @213
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg75"); @214
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg75 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg75_create_vld                  ),
  .x_cur_state_dealloc                 (preg75_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg75_dealloc_mask                ),
  .x_dealloc_vld                       (preg75_dealloc_vld                 ),
  .x_dreg                              (preg75_dreg                        ),
  .x_rel_preg_expand                   (preg75_rel_preg_expand             ),
  .x_release_vld                       (preg75_release_vld                 ),
  .x_reset_dst_reg                     (preg75_reset_dst_reg               ),
  .x_reset_mapped                      (preg75_reset_mapped                ),
  .x_retired_released_wb               (preg75_retired_released_wb         ),
  .x_wb_vld                            (preg75_wb_vld                      )
);

// &ConnRule(s/^x_/preg76_/); @215
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg76"); @216
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg76 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg76_create_vld                  ),
  .x_cur_state_dealloc                 (preg76_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg76_dealloc_mask                ),
  .x_dealloc_vld                       (preg76_dealloc_vld                 ),
  .x_dreg                              (preg76_dreg                        ),
  .x_rel_preg_expand                   (preg76_rel_preg_expand             ),
  .x_release_vld                       (preg76_release_vld                 ),
  .x_reset_dst_reg                     (preg76_reset_dst_reg               ),
  .x_reset_mapped                      (preg76_reset_mapped                ),
  .x_retired_released_wb               (preg76_retired_released_wb         ),
  .x_wb_vld                            (preg76_wb_vld                      )
);

// &ConnRule(s/^x_/preg77_/); @217
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg77"); @218
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg77 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg77_create_vld                  ),
  .x_cur_state_dealloc                 (preg77_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg77_dealloc_mask                ),
  .x_dealloc_vld                       (preg77_dealloc_vld                 ),
  .x_dreg                              (preg77_dreg                        ),
  .x_rel_preg_expand                   (preg77_rel_preg_expand             ),
  .x_release_vld                       (preg77_release_vld                 ),
  .x_reset_dst_reg                     (preg77_reset_dst_reg               ),
  .x_reset_mapped                      (preg77_reset_mapped                ),
  .x_retired_released_wb               (preg77_retired_released_wb         ),
  .x_wb_vld                            (preg77_wb_vld                      )
);

// &ConnRule(s/^x_/preg78_/); @219
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg78"); @220
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg78 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg78_create_vld                  ),
  .x_cur_state_dealloc                 (preg78_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg78_dealloc_mask                ),
  .x_dealloc_vld                       (preg78_dealloc_vld                 ),
  .x_dreg                              (preg78_dreg                        ),
  .x_rel_preg_expand                   (preg78_rel_preg_expand             ),
  .x_release_vld                       (preg78_release_vld                 ),
  .x_reset_dst_reg                     (preg78_reset_dst_reg               ),
  .x_reset_mapped                      (preg78_reset_mapped                ),
  .x_retired_released_wb               (preg78_retired_released_wb         ),
  .x_wb_vld                            (preg78_wb_vld                      )
);

// &ConnRule(s/^x_/preg79_/); @221
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg79"); @222
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg79 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg79_create_vld                  ),
  .x_cur_state_dealloc                 (preg79_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg79_dealloc_mask                ),
  .x_dealloc_vld                       (preg79_dealloc_vld                 ),
  .x_dreg                              (preg79_dreg                        ),
  .x_rel_preg_expand                   (preg79_rel_preg_expand             ),
  .x_release_vld                       (preg79_release_vld                 ),
  .x_reset_dst_reg                     (preg79_reset_dst_reg               ),
  .x_reset_mapped                      (preg79_reset_mapped                ),
  .x_retired_released_wb               (preg79_retired_released_wb         ),
  .x_wb_vld                            (preg79_wb_vld                      )
);

// &ConnRule(s/^x_/preg80_/); @223
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg80"); @224
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg80 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg80_create_vld                  ),
  .x_cur_state_dealloc                 (preg80_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg80_dealloc_mask                ),
  .x_dealloc_vld                       (preg80_dealloc_vld                 ),
  .x_dreg                              (preg80_dreg                        ),
  .x_rel_preg_expand                   (preg80_rel_preg_expand             ),
  .x_release_vld                       (preg80_release_vld                 ),
  .x_reset_dst_reg                     (preg80_reset_dst_reg               ),
  .x_reset_mapped                      (preg80_reset_mapped                ),
  .x_retired_released_wb               (preg80_retired_released_wb         ),
  .x_wb_vld                            (preg80_wb_vld                      )
);

// &ConnRule(s/^x_/preg81_/); @225
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg81"); @226
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg81 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg81_create_vld                  ),
  .x_cur_state_dealloc                 (preg81_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg81_dealloc_mask                ),
  .x_dealloc_vld                       (preg81_dealloc_vld                 ),
  .x_dreg                              (preg81_dreg                        ),
  .x_rel_preg_expand                   (preg81_rel_preg_expand             ),
  .x_release_vld                       (preg81_release_vld                 ),
  .x_reset_dst_reg                     (preg81_reset_dst_reg               ),
  .x_reset_mapped                      (preg81_reset_mapped                ),
  .x_retired_released_wb               (preg81_retired_released_wb         ),
  .x_wb_vld                            (preg81_wb_vld                      )
);

// &ConnRule(s/^x_/preg82_/); @227
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg82"); @228
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg82 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg82_create_vld                  ),
  .x_cur_state_dealloc                 (preg82_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg82_dealloc_mask                ),
  .x_dealloc_vld                       (preg82_dealloc_vld                 ),
  .x_dreg                              (preg82_dreg                        ),
  .x_rel_preg_expand                   (preg82_rel_preg_expand             ),
  .x_release_vld                       (preg82_release_vld                 ),
  .x_reset_dst_reg                     (preg82_reset_dst_reg               ),
  .x_reset_mapped                      (preg82_reset_mapped                ),
  .x_retired_released_wb               (preg82_retired_released_wb         ),
  .x_wb_vld                            (preg82_wb_vld                      )
);

// &ConnRule(s/^x_/preg83_/); @229
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg83"); @230
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg83 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg83_create_vld                  ),
  .x_cur_state_dealloc                 (preg83_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg83_dealloc_mask                ),
  .x_dealloc_vld                       (preg83_dealloc_vld                 ),
  .x_dreg                              (preg83_dreg                        ),
  .x_rel_preg_expand                   (preg83_rel_preg_expand             ),
  .x_release_vld                       (preg83_release_vld                 ),
  .x_reset_dst_reg                     (preg83_reset_dst_reg               ),
  .x_reset_mapped                      (preg83_reset_mapped                ),
  .x_retired_released_wb               (preg83_retired_released_wb         ),
  .x_wb_vld                            (preg83_wb_vld                      )
);

// &ConnRule(s/^x_/preg84_/); @231
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg84"); @232
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg84 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg84_create_vld                  ),
  .x_cur_state_dealloc                 (preg84_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg84_dealloc_mask                ),
  .x_dealloc_vld                       (preg84_dealloc_vld                 ),
  .x_dreg                              (preg84_dreg                        ),
  .x_rel_preg_expand                   (preg84_rel_preg_expand             ),
  .x_release_vld                       (preg84_release_vld                 ),
  .x_reset_dst_reg                     (preg84_reset_dst_reg               ),
  .x_reset_mapped                      (preg84_reset_mapped                ),
  .x_retired_released_wb               (preg84_retired_released_wb         ),
  .x_wb_vld                            (preg84_wb_vld                      )
);

// &ConnRule(s/^x_/preg85_/); @233
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg85"); @234
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg85 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg85_create_vld                  ),
  .x_cur_state_dealloc                 (preg85_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg85_dealloc_mask                ),
  .x_dealloc_vld                       (preg85_dealloc_vld                 ),
  .x_dreg                              (preg85_dreg                        ),
  .x_rel_preg_expand                   (preg85_rel_preg_expand             ),
  .x_release_vld                       (preg85_release_vld                 ),
  .x_reset_dst_reg                     (preg85_reset_dst_reg               ),
  .x_reset_mapped                      (preg85_reset_mapped                ),
  .x_retired_released_wb               (preg85_retired_released_wb         ),
  .x_wb_vld                            (preg85_wb_vld                      )
);

// &ConnRule(s/^x_/preg86_/); @235
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg86"); @236
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg86 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg86_create_vld                  ),
  .x_cur_state_dealloc                 (preg86_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg86_dealloc_mask                ),
  .x_dealloc_vld                       (preg86_dealloc_vld                 ),
  .x_dreg                              (preg86_dreg                        ),
  .x_rel_preg_expand                   (preg86_rel_preg_expand             ),
  .x_release_vld                       (preg86_release_vld                 ),
  .x_reset_dst_reg                     (preg86_reset_dst_reg               ),
  .x_reset_mapped                      (preg86_reset_mapped                ),
  .x_retired_released_wb               (preg86_retired_released_wb         ),
  .x_wb_vld                            (preg86_wb_vld                      )
);

// &ConnRule(s/^x_/preg87_/); @237
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg87"); @238
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg87 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg87_create_vld                  ),
  .x_cur_state_dealloc                 (preg87_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg87_dealloc_mask                ),
  .x_dealloc_vld                       (preg87_dealloc_vld                 ),
  .x_dreg                              (preg87_dreg                        ),
  .x_rel_preg_expand                   (preg87_rel_preg_expand             ),
  .x_release_vld                       (preg87_release_vld                 ),
  .x_reset_dst_reg                     (preg87_reset_dst_reg               ),
  .x_reset_mapped                      (preg87_reset_mapped                ),
  .x_retired_released_wb               (preg87_retired_released_wb         ),
  .x_wb_vld                            (preg87_wb_vld                      )
);

// &ConnRule(s/^x_/preg88_/); @239
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg88"); @240
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg88 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg88_create_vld                  ),
  .x_cur_state_dealloc                 (preg88_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg88_dealloc_mask                ),
  .x_dealloc_vld                       (preg88_dealloc_vld                 ),
  .x_dreg                              (preg88_dreg                        ),
  .x_rel_preg_expand                   (preg88_rel_preg_expand             ),
  .x_release_vld                       (preg88_release_vld                 ),
  .x_reset_dst_reg                     (preg88_reset_dst_reg               ),
  .x_reset_mapped                      (preg88_reset_mapped                ),
  .x_retired_released_wb               (preg88_retired_released_wb         ),
  .x_wb_vld                            (preg88_wb_vld                      )
);

// &ConnRule(s/^x_/preg89_/); @241
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg89"); @242
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg89 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg89_create_vld                  ),
  .x_cur_state_dealloc                 (preg89_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg89_dealloc_mask                ),
  .x_dealloc_vld                       (preg89_dealloc_vld                 ),
  .x_dreg                              (preg89_dreg                        ),
  .x_rel_preg_expand                   (preg89_rel_preg_expand             ),
  .x_release_vld                       (preg89_release_vld                 ),
  .x_reset_dst_reg                     (preg89_reset_dst_reg               ),
  .x_reset_mapped                      (preg89_reset_mapped                ),
  .x_retired_released_wb               (preg89_retired_released_wb         ),
  .x_wb_vld                            (preg89_wb_vld                      )
);

// &ConnRule(s/^x_/preg90_/); @243
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg90"); @244
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg90 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg90_create_vld                  ),
  .x_cur_state_dealloc                 (preg90_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg90_dealloc_mask                ),
  .x_dealloc_vld                       (preg90_dealloc_vld                 ),
  .x_dreg                              (preg90_dreg                        ),
  .x_rel_preg_expand                   (preg90_rel_preg_expand             ),
  .x_release_vld                       (preg90_release_vld                 ),
  .x_reset_dst_reg                     (preg90_reset_dst_reg               ),
  .x_reset_mapped                      (preg90_reset_mapped                ),
  .x_retired_released_wb               (preg90_retired_released_wb         ),
  .x_wb_vld                            (preg90_wb_vld                      )
);

// &ConnRule(s/^x_/preg91_/); @245
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg91"); @246
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg91 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg91_create_vld                  ),
  .x_cur_state_dealloc                 (preg91_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg91_dealloc_mask                ),
  .x_dealloc_vld                       (preg91_dealloc_vld                 ),
  .x_dreg                              (preg91_dreg                        ),
  .x_rel_preg_expand                   (preg91_rel_preg_expand             ),
  .x_release_vld                       (preg91_release_vld                 ),
  .x_reset_dst_reg                     (preg91_reset_dst_reg               ),
  .x_reset_mapped                      (preg91_reset_mapped                ),
  .x_retired_released_wb               (preg91_retired_released_wb         ),
  .x_wb_vld                            (preg91_wb_vld                      )
);

// &ConnRule(s/^x_/preg92_/); @247
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg92"); @248
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg92 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg92_create_vld                  ),
  .x_cur_state_dealloc                 (preg92_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg92_dealloc_mask                ),
  .x_dealloc_vld                       (preg92_dealloc_vld                 ),
  .x_dreg                              (preg92_dreg                        ),
  .x_rel_preg_expand                   (preg92_rel_preg_expand             ),
  .x_release_vld                       (preg92_release_vld                 ),
  .x_reset_dst_reg                     (preg92_reset_dst_reg               ),
  .x_reset_mapped                      (preg92_reset_mapped                ),
  .x_retired_released_wb               (preg92_retired_released_wb         ),
  .x_wb_vld                            (preg92_wb_vld                      )
);

// &ConnRule(s/^x_/preg93_/); @249
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg93"); @250
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg93 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg93_create_vld                  ),
  .x_cur_state_dealloc                 (preg93_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg93_dealloc_mask                ),
  .x_dealloc_vld                       (preg93_dealloc_vld                 ),
  .x_dreg                              (preg93_dreg                        ),
  .x_rel_preg_expand                   (preg93_rel_preg_expand             ),
  .x_release_vld                       (preg93_release_vld                 ),
  .x_reset_dst_reg                     (preg93_reset_dst_reg               ),
  .x_reset_mapped                      (preg93_reset_mapped                ),
  .x_retired_released_wb               (preg93_retired_released_wb         ),
  .x_wb_vld                            (preg93_wb_vld                      )
);

// &ConnRule(s/^x_/preg94_/); @251
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg94"); @252
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg94 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg94_create_vld                  ),
  .x_cur_state_dealloc                 (preg94_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg94_dealloc_mask                ),
  .x_dealloc_vld                       (preg94_dealloc_vld                 ),
  .x_dreg                              (preg94_dreg                        ),
  .x_rel_preg_expand                   (preg94_rel_preg_expand             ),
  .x_release_vld                       (preg94_release_vld                 ),
  .x_reset_dst_reg                     (preg94_reset_dst_reg               ),
  .x_reset_mapped                      (preg94_reset_mapped                ),
  .x_retired_released_wb               (preg94_retired_released_wb         ),
  .x_wb_vld                            (preg94_wb_vld                      )
);

// &ConnRule(s/^x_/preg95_/); @253
// &Instance("ct_rtu_pst_preg_entry","x_ct_rtu_pst_entry_preg95"); @254
ct_rtu_pst_preg_entry  x_ct_rtu_pst_entry_preg95 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (preg95_create_vld                  ),
  .x_cur_state_dealloc                 (preg95_cur_state_dealloc           ),
  .x_dealloc_mask                      (preg95_dealloc_mask                ),
  .x_dealloc_vld                       (preg95_dealloc_vld                 ),
  .x_dreg                              (preg95_dreg                        ),
  .x_rel_preg_expand                   (preg95_rel_preg_expand             ),
  .x_release_vld                       (preg95_release_vld                 ),
  .x_reset_dst_reg                     (preg95_reset_dst_reg               ),
  .x_reset_mapped                      (preg95_reset_mapped                ),
  .x_retired_released_wb               (preg95_retired_released_wb         ),
  .x_wb_vld                            (preg95_wb_vld                      )
);


//==========================================================
//          PST GPR Physical Register (Preg) Logic
//==========================================================

//==========================================================
//                  Reset initial states
//==========================================================
//after reset, p0-p31 will be mapped to r0-r31, p31-p63 will
//be dealloc
assign preg0_reset_mapped  = 1'b1;
assign preg1_reset_mapped  = 1'b1;
assign preg2_reset_mapped  = 1'b1;
assign preg3_reset_mapped  = 1'b1;
assign preg4_reset_mapped  = 1'b1;
assign preg5_reset_mapped  = 1'b1;
assign preg6_reset_mapped  = 1'b1;
assign preg7_reset_mapped  = 1'b1;
assign preg8_reset_mapped  = 1'b1;
assign preg9_reset_mapped  = 1'b1;
assign preg10_reset_mapped = 1'b1;
assign preg11_reset_mapped = 1'b1;
assign preg12_reset_mapped = 1'b1;
assign preg13_reset_mapped = 1'b1;
assign preg14_reset_mapped = 1'b1;
assign preg15_reset_mapped = 1'b1;
assign preg16_reset_mapped = 1'b1;
assign preg17_reset_mapped = 1'b1;
assign preg18_reset_mapped = 1'b1;
assign preg19_reset_mapped = 1'b1;
assign preg20_reset_mapped = 1'b1;
assign preg21_reset_mapped = 1'b1;
assign preg22_reset_mapped = 1'b1;
assign preg23_reset_mapped = 1'b1;
assign preg24_reset_mapped = 1'b1;
assign preg25_reset_mapped = 1'b1;
assign preg26_reset_mapped = 1'b1;
assign preg27_reset_mapped = 1'b1;
assign preg28_reset_mapped = 1'b1;
assign preg29_reset_mapped = 1'b1;
assign preg30_reset_mapped = 1'b1;
assign preg31_reset_mapped = 1'b1;
assign preg32_reset_mapped = 1'b0;
assign preg33_reset_mapped = 1'b0;
assign preg34_reset_mapped = 1'b0;
assign preg35_reset_mapped = 1'b0;
assign preg36_reset_mapped = 1'b0;
assign preg37_reset_mapped = 1'b0;
assign preg38_reset_mapped = 1'b0;
assign preg39_reset_mapped = 1'b0;
assign preg40_reset_mapped = 1'b0;
assign preg41_reset_mapped = 1'b0;
assign preg42_reset_mapped = 1'b0;
assign preg43_reset_mapped = 1'b0;
assign preg44_reset_mapped = 1'b0;
assign preg45_reset_mapped = 1'b0;
assign preg46_reset_mapped = 1'b0;
assign preg47_reset_mapped = 1'b0;
assign preg48_reset_mapped = 1'b0;
assign preg49_reset_mapped = 1'b0;
assign preg50_reset_mapped = 1'b0;
assign preg51_reset_mapped = 1'b0;
assign preg52_reset_mapped = 1'b0;
assign preg53_reset_mapped = 1'b0;
assign preg54_reset_mapped = 1'b0;
assign preg55_reset_mapped = 1'b0;
assign preg56_reset_mapped = 1'b0;
assign preg57_reset_mapped = 1'b0;
assign preg58_reset_mapped = 1'b0;
assign preg59_reset_mapped = 1'b0;
assign preg60_reset_mapped = 1'b0;
assign preg61_reset_mapped = 1'b0;
assign preg62_reset_mapped = 1'b0;
assign preg63_reset_mapped = 1'b0;
assign preg64_reset_mapped = 1'b0;
assign preg65_reset_mapped = 1'b0;
assign preg66_reset_mapped = 1'b0;
assign preg67_reset_mapped = 1'b0;
assign preg68_reset_mapped = 1'b0;
assign preg69_reset_mapped = 1'b0;
assign preg70_reset_mapped = 1'b0;
assign preg71_reset_mapped = 1'b0;
assign preg72_reset_mapped = 1'b0;
assign preg73_reset_mapped = 1'b0;
assign preg74_reset_mapped = 1'b0;
assign preg75_reset_mapped = 1'b0;
assign preg76_reset_mapped = 1'b0;
assign preg77_reset_mapped = 1'b0;
assign preg78_reset_mapped = 1'b0;
assign preg79_reset_mapped = 1'b0;
assign preg80_reset_mapped = 1'b0;
assign preg81_reset_mapped = 1'b0;
assign preg82_reset_mapped = 1'b0;
assign preg83_reset_mapped = 1'b0;
assign preg84_reset_mapped = 1'b0;
assign preg85_reset_mapped = 1'b0;
assign preg86_reset_mapped = 1'b0;
assign preg87_reset_mapped = 1'b0;
assign preg88_reset_mapped = 1'b0;
assign preg89_reset_mapped = 1'b0;
assign preg90_reset_mapped = 1'b0;
assign preg91_reset_mapped = 1'b0;
assign preg92_reset_mapped = 1'b0;
assign preg93_reset_mapped = 1'b0;
assign preg94_reset_mapped = 1'b0;
assign preg95_reset_mapped = 1'b0;

assign preg0_reset_dst_reg[4:0]  = 5'd0;
assign preg1_reset_dst_reg[4:0]  = 5'd1;
assign preg2_reset_dst_reg[4:0]  = 5'd2;
assign preg3_reset_dst_reg[4:0]  = 5'd3;
assign preg4_reset_dst_reg[4:0]  = 5'd4;
assign preg5_reset_dst_reg[4:0]  = 5'd5;
assign preg6_reset_dst_reg[4:0]  = 5'd6;
assign preg7_reset_dst_reg[4:0]  = 5'd7;
assign preg8_reset_dst_reg[4:0]  = 5'd8;
assign preg9_reset_dst_reg[4:0]  = 5'd9;
assign preg10_reset_dst_reg[4:0] = 5'd10;
assign preg11_reset_dst_reg[4:0] = 5'd11;
assign preg12_reset_dst_reg[4:0] = 5'd12;
assign preg13_reset_dst_reg[4:0] = 5'd13;
assign preg14_reset_dst_reg[4:0] = 5'd14;
assign preg15_reset_dst_reg[4:0] = 5'd15;
assign preg16_reset_dst_reg[4:0] = 5'd16;
assign preg17_reset_dst_reg[4:0] = 5'd17;
assign preg18_reset_dst_reg[4:0] = 5'd18;
assign preg19_reset_dst_reg[4:0] = 5'd19;
assign preg20_reset_dst_reg[4:0] = 5'd20;
assign preg21_reset_dst_reg[4:0] = 5'd21;
assign preg22_reset_dst_reg[4:0] = 5'd22;
assign preg23_reset_dst_reg[4:0] = 5'd23;
assign preg24_reset_dst_reg[4:0] = 5'd24;
assign preg25_reset_dst_reg[4:0] = 5'd25;
assign preg26_reset_dst_reg[4:0] = 5'd26;
assign preg27_reset_dst_reg[4:0] = 5'd27;
assign preg28_reset_dst_reg[4:0] = 5'd28;
assign preg29_reset_dst_reg[4:0] = 5'd29;
assign preg30_reset_dst_reg[4:0] = 5'd30;
assign preg31_reset_dst_reg[4:0] = 5'd31;
assign preg32_reset_dst_reg[4:0] = 5'd0;
assign preg33_reset_dst_reg[4:0] = 5'd0;
assign preg34_reset_dst_reg[4:0] = 5'd0;
assign preg35_reset_dst_reg[4:0] = 5'd0;
assign preg36_reset_dst_reg[4:0] = 5'd0;
assign preg37_reset_dst_reg[4:0] = 5'd0;
assign preg38_reset_dst_reg[4:0] = 5'd0;
assign preg39_reset_dst_reg[4:0] = 5'd0;
assign preg40_reset_dst_reg[4:0] = 5'd0;
assign preg41_reset_dst_reg[4:0] = 5'd0;
assign preg42_reset_dst_reg[4:0] = 5'd0;
assign preg43_reset_dst_reg[4:0] = 5'd0;
assign preg44_reset_dst_reg[4:0] = 5'd0;
assign preg45_reset_dst_reg[4:0] = 5'd0;
assign preg46_reset_dst_reg[4:0] = 5'd0;
assign preg47_reset_dst_reg[4:0] = 5'd0;
assign preg48_reset_dst_reg[4:0] = 5'd0;
assign preg49_reset_dst_reg[4:0] = 5'd0;
assign preg50_reset_dst_reg[4:0] = 5'd0;
assign preg51_reset_dst_reg[4:0] = 5'd0;
assign preg52_reset_dst_reg[4:0] = 5'd0;
assign preg53_reset_dst_reg[4:0] = 5'd0;
assign preg54_reset_dst_reg[4:0] = 5'd0;
assign preg55_reset_dst_reg[4:0] = 5'd0;
assign preg56_reset_dst_reg[4:0] = 5'd0;
assign preg57_reset_dst_reg[4:0] = 5'd0;
assign preg58_reset_dst_reg[4:0] = 5'd0;
assign preg59_reset_dst_reg[4:0] = 5'd0;
assign preg60_reset_dst_reg[4:0] = 5'd0;
assign preg61_reset_dst_reg[4:0] = 5'd0;
assign preg62_reset_dst_reg[4:0] = 5'd0;
assign preg63_reset_dst_reg[4:0] = 5'd0;
assign preg64_reset_dst_reg[4:0] = 5'd0;
assign preg65_reset_dst_reg[4:0] = 5'd0;
assign preg66_reset_dst_reg[4:0] = 5'd0;
assign preg67_reset_dst_reg[4:0] = 5'd0;
assign preg68_reset_dst_reg[4:0] = 5'd0;
assign preg69_reset_dst_reg[4:0] = 5'd0;
assign preg70_reset_dst_reg[4:0] = 5'd0;
assign preg71_reset_dst_reg[4:0] = 5'd0;
assign preg72_reset_dst_reg[4:0] = 5'd0;
assign preg73_reset_dst_reg[4:0] = 5'd0;
assign preg74_reset_dst_reg[4:0] = 5'd0;
assign preg75_reset_dst_reg[4:0] = 5'd0;
assign preg76_reset_dst_reg[4:0] = 5'd0;
assign preg77_reset_dst_reg[4:0] = 5'd0;
assign preg78_reset_dst_reg[4:0] = 5'd0;
assign preg79_reset_dst_reg[4:0] = 5'd0;
assign preg80_reset_dst_reg[4:0] = 5'd0;
assign preg81_reset_dst_reg[4:0] = 5'd0;
assign preg82_reset_dst_reg[4:0] = 5'd0;
assign preg83_reset_dst_reg[4:0] = 5'd0;
assign preg84_reset_dst_reg[4:0] = 5'd0;
assign preg85_reset_dst_reg[4:0] = 5'd0;
assign preg86_reset_dst_reg[4:0] = 5'd0;
assign preg87_reset_dst_reg[4:0] = 5'd0;
assign preg88_reset_dst_reg[4:0] = 5'd0;
assign preg89_reset_dst_reg[4:0] = 5'd0;
assign preg90_reset_dst_reg[4:0] = 5'd0;
assign preg91_reset_dst_reg[4:0] = 5'd0;
assign preg92_reset_dst_reg[4:0] = 5'd0;
assign preg93_reset_dst_reg[4:0] = 5'd0;
assign preg94_reset_dst_reg[4:0] = 5'd0;
assign preg95_reset_dst_reg[4:0] = 5'd0;

//==========================================================
//                 Dispatch Create signals
//==========================================================
// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst0_preg/); @462
// &Instance("ct_rtu_expand_96","x_ct_rtu_expand_96_idu_rtu_pst_dis_inst0_preg"); @463
ct_rtu_expand_96  x_ct_rtu_expand_96_idu_rtu_pst_dis_inst0_preg (
  .x_num                             (idu_rtu_pst_dis_inst0_preg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst0_preg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst1_preg/); @464
// &Instance("ct_rtu_expand_96","x_ct_rtu_expand_96_idu_rtu_pst_dis_inst1_preg"); @465
ct_rtu_expand_96  x_ct_rtu_expand_96_idu_rtu_pst_dis_inst1_preg (
  .x_num                             (idu_rtu_pst_dis_inst1_preg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst1_preg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst2_preg/); @466
// &Instance("ct_rtu_expand_96","x_ct_rtu_expand_96_idu_rtu_pst_dis_inst2_preg"); @467
ct_rtu_expand_96  x_ct_rtu_expand_96_idu_rtu_pst_dis_inst2_preg (
  .x_num                             (idu_rtu_pst_dis_inst2_preg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst2_preg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst3_preg/); @468
// &Instance("ct_rtu_expand_96","x_ct_rtu_expand_96_idu_rtu_pst_dis_inst3_preg"); @469
ct_rtu_expand_96  x_ct_rtu_expand_96_idu_rtu_pst_dis_inst3_preg (
  .x_num                             (idu_rtu_pst_dis_inst3_preg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst3_preg_expand)
);


assign d0_preg[95:0] = {96{idu_rtu_pst_dis_inst0_preg_vld}}
                       & idu_rtu_pst_dis_inst0_preg_expand[95:0];
assign d1_preg[95:0] = {96{idu_rtu_pst_dis_inst1_preg_vld}}
                       & idu_rtu_pst_dis_inst1_preg_expand[95:0];
assign d2_preg[95:0] = {96{idu_rtu_pst_dis_inst2_preg_vld}}
                       & idu_rtu_pst_dis_inst2_preg_expand[95:0];
assign d3_preg[95:0] = {96{idu_rtu_pst_dis_inst3_preg_vld}}
                       & idu_rtu_pst_dis_inst3_preg_expand[95:0];

assign preg0_create_vld[3:0]  = {d3_preg[0], d2_preg[0], d1_preg[0], d0_preg[0]};
assign preg1_create_vld[3:0]  = {d3_preg[1], d2_preg[1], d1_preg[1], d0_preg[1]};
assign preg2_create_vld[3:0]  = {d3_preg[2], d2_preg[2], d1_preg[2], d0_preg[2]};
assign preg3_create_vld[3:0]  = {d3_preg[3], d2_preg[3], d1_preg[3], d0_preg[3]};
assign preg4_create_vld[3:0]  = {d3_preg[4], d2_preg[4], d1_preg[4], d0_preg[4]};
assign preg5_create_vld[3:0]  = {d3_preg[5], d2_preg[5], d1_preg[5], d0_preg[5]};
assign preg6_create_vld[3:0]  = {d3_preg[6], d2_preg[6], d1_preg[6], d0_preg[6]};
assign preg7_create_vld[3:0]  = {d3_preg[7], d2_preg[7], d1_preg[7], d0_preg[7]};
assign preg8_create_vld[3:0]  = {d3_preg[8], d2_preg[8], d1_preg[8], d0_preg[8]};
assign preg9_create_vld[3:0]  = {d3_preg[9], d2_preg[9], d1_preg[9], d0_preg[9]};
assign preg10_create_vld[3:0] = {d3_preg[10],d2_preg[10],d1_preg[10],d0_preg[10]};
assign preg11_create_vld[3:0] = {d3_preg[11],d2_preg[11],d1_preg[11],d0_preg[11]};
assign preg12_create_vld[3:0] = {d3_preg[12],d2_preg[12],d1_preg[12],d0_preg[12]};
assign preg13_create_vld[3:0] = {d3_preg[13],d2_preg[13],d1_preg[13],d0_preg[13]};
assign preg14_create_vld[3:0] = {d3_preg[14],d2_preg[14],d1_preg[14],d0_preg[14]};
assign preg15_create_vld[3:0] = {d3_preg[15],d2_preg[15],d1_preg[15],d0_preg[15]};
assign preg16_create_vld[3:0] = {d3_preg[16],d2_preg[16],d1_preg[16],d0_preg[16]};
assign preg17_create_vld[3:0] = {d3_preg[17],d2_preg[17],d1_preg[17],d0_preg[17]};
assign preg18_create_vld[3:0] = {d3_preg[18],d2_preg[18],d1_preg[18],d0_preg[18]};
assign preg19_create_vld[3:0] = {d3_preg[19],d2_preg[19],d1_preg[19],d0_preg[19]};
assign preg20_create_vld[3:0] = {d3_preg[20],d2_preg[20],d1_preg[20],d0_preg[20]};
assign preg21_create_vld[3:0] = {d3_preg[21],d2_preg[21],d1_preg[21],d0_preg[21]};
assign preg22_create_vld[3:0] = {d3_preg[22],d2_preg[22],d1_preg[22],d0_preg[22]};
assign preg23_create_vld[3:0] = {d3_preg[23],d2_preg[23],d1_preg[23],d0_preg[23]};
assign preg24_create_vld[3:0] = {d3_preg[24],d2_preg[24],d1_preg[24],d0_preg[24]};
assign preg25_create_vld[3:0] = {d3_preg[25],d2_preg[25],d1_preg[25],d0_preg[25]};
assign preg26_create_vld[3:0] = {d3_preg[26],d2_preg[26],d1_preg[26],d0_preg[26]};
assign preg27_create_vld[3:0] = {d3_preg[27],d2_preg[27],d1_preg[27],d0_preg[27]};
assign preg28_create_vld[3:0] = {d3_preg[28],d2_preg[28],d1_preg[28],d0_preg[28]};
assign preg29_create_vld[3:0] = {d3_preg[29],d2_preg[29],d1_preg[29],d0_preg[29]};
assign preg30_create_vld[3:0] = {d3_preg[30],d2_preg[30],d1_preg[30],d0_preg[30]};
assign preg31_create_vld[3:0] = {d3_preg[31],d2_preg[31],d1_preg[31],d0_preg[31]};
assign preg32_create_vld[3:0] = {d3_preg[32],d2_preg[32],d1_preg[32],d0_preg[32]};
assign preg33_create_vld[3:0] = {d3_preg[33],d2_preg[33],d1_preg[33],d0_preg[33]};
assign preg34_create_vld[3:0] = {d3_preg[34],d2_preg[34],d1_preg[34],d0_preg[34]};
assign preg35_create_vld[3:0] = {d3_preg[35],d2_preg[35],d1_preg[35],d0_preg[35]};
assign preg36_create_vld[3:0] = {d3_preg[36],d2_preg[36],d1_preg[36],d0_preg[36]};
assign preg37_create_vld[3:0] = {d3_preg[37],d2_preg[37],d1_preg[37],d0_preg[37]};
assign preg38_create_vld[3:0] = {d3_preg[38],d2_preg[38],d1_preg[38],d0_preg[38]};
assign preg39_create_vld[3:0] = {d3_preg[39],d2_preg[39],d1_preg[39],d0_preg[39]};
assign preg40_create_vld[3:0] = {d3_preg[40],d2_preg[40],d1_preg[40],d0_preg[40]};
assign preg41_create_vld[3:0] = {d3_preg[41],d2_preg[41],d1_preg[41],d0_preg[41]};
assign preg42_create_vld[3:0] = {d3_preg[42],d2_preg[42],d1_preg[42],d0_preg[42]};
assign preg43_create_vld[3:0] = {d3_preg[43],d2_preg[43],d1_preg[43],d0_preg[43]};
assign preg44_create_vld[3:0] = {d3_preg[44],d2_preg[44],d1_preg[44],d0_preg[44]};
assign preg45_create_vld[3:0] = {d3_preg[45],d2_preg[45],d1_preg[45],d0_preg[45]};
assign preg46_create_vld[3:0] = {d3_preg[46],d2_preg[46],d1_preg[46],d0_preg[46]};
assign preg47_create_vld[3:0] = {d3_preg[47],d2_preg[47],d1_preg[47],d0_preg[47]};
assign preg48_create_vld[3:0] = {d3_preg[48],d2_preg[48],d1_preg[48],d0_preg[48]};
assign preg49_create_vld[3:0] = {d3_preg[49],d2_preg[49],d1_preg[49],d0_preg[49]};
assign preg50_create_vld[3:0] = {d3_preg[50],d2_preg[50],d1_preg[50],d0_preg[50]};
assign preg51_create_vld[3:0] = {d3_preg[51],d2_preg[51],d1_preg[51],d0_preg[51]};
assign preg52_create_vld[3:0] = {d3_preg[52],d2_preg[52],d1_preg[52],d0_preg[52]};
assign preg53_create_vld[3:0] = {d3_preg[53],d2_preg[53],d1_preg[53],d0_preg[53]};
assign preg54_create_vld[3:0] = {d3_preg[54],d2_preg[54],d1_preg[54],d0_preg[54]};
assign preg55_create_vld[3:0] = {d3_preg[55],d2_preg[55],d1_preg[55],d0_preg[55]};
assign preg56_create_vld[3:0] = {d3_preg[56],d2_preg[56],d1_preg[56],d0_preg[56]};
assign preg57_create_vld[3:0] = {d3_preg[57],d2_preg[57],d1_preg[57],d0_preg[57]};
assign preg58_create_vld[3:0] = {d3_preg[58],d2_preg[58],d1_preg[58],d0_preg[58]};
assign preg59_create_vld[3:0] = {d3_preg[59],d2_preg[59],d1_preg[59],d0_preg[59]};
assign preg60_create_vld[3:0] = {d3_preg[60],d2_preg[60],d1_preg[60],d0_preg[60]};
assign preg61_create_vld[3:0] = {d3_preg[61],d2_preg[61],d1_preg[61],d0_preg[61]};
assign preg62_create_vld[3:0] = {d3_preg[62],d2_preg[62],d1_preg[62],d0_preg[62]};
assign preg63_create_vld[3:0] = {d3_preg[63],d2_preg[63],d1_preg[63],d0_preg[63]};
assign preg64_create_vld[3:0] = {d3_preg[64],d2_preg[64],d1_preg[64],d0_preg[64]};
assign preg65_create_vld[3:0] = {d3_preg[65],d2_preg[65],d1_preg[65],d0_preg[65]};
assign preg66_create_vld[3:0] = {d3_preg[66],d2_preg[66],d1_preg[66],d0_preg[66]};
assign preg67_create_vld[3:0] = {d3_preg[67],d2_preg[67],d1_preg[67],d0_preg[67]};
assign preg68_create_vld[3:0] = {d3_preg[68],d2_preg[68],d1_preg[68],d0_preg[68]};
assign preg69_create_vld[3:0] = {d3_preg[69],d2_preg[69],d1_preg[69],d0_preg[69]};
assign preg70_create_vld[3:0] = {d3_preg[70],d2_preg[70],d1_preg[70],d0_preg[70]};
assign preg71_create_vld[3:0] = {d3_preg[71],d2_preg[71],d1_preg[71],d0_preg[71]};
assign preg72_create_vld[3:0] = {d3_preg[72],d2_preg[72],d1_preg[72],d0_preg[72]};
assign preg73_create_vld[3:0] = {d3_preg[73],d2_preg[73],d1_preg[73],d0_preg[73]};
assign preg74_create_vld[3:0] = {d3_preg[74],d2_preg[74],d1_preg[74],d0_preg[74]};
assign preg75_create_vld[3:0] = {d3_preg[75],d2_preg[75],d1_preg[75],d0_preg[75]};
assign preg76_create_vld[3:0] = {d3_preg[76],d2_preg[76],d1_preg[76],d0_preg[76]};
assign preg77_create_vld[3:0] = {d3_preg[77],d2_preg[77],d1_preg[77],d0_preg[77]};
assign preg78_create_vld[3:0] = {d3_preg[78],d2_preg[78],d1_preg[78],d0_preg[78]};
assign preg79_create_vld[3:0] = {d3_preg[79],d2_preg[79],d1_preg[79],d0_preg[79]};
assign preg80_create_vld[3:0] = {d3_preg[80],d2_preg[80],d1_preg[80],d0_preg[80]};
assign preg81_create_vld[3:0] = {d3_preg[81],d2_preg[81],d1_preg[81],d0_preg[81]};
assign preg82_create_vld[3:0] = {d3_preg[82],d2_preg[82],d1_preg[82],d0_preg[82]};
assign preg83_create_vld[3:0] = {d3_preg[83],d2_preg[83],d1_preg[83],d0_preg[83]};
assign preg84_create_vld[3:0] = {d3_preg[84],d2_preg[84],d1_preg[84],d0_preg[84]};
assign preg85_create_vld[3:0] = {d3_preg[85],d2_preg[85],d1_preg[85],d0_preg[85]};
assign preg86_create_vld[3:0] = {d3_preg[86],d2_preg[86],d1_preg[86],d0_preg[86]};
assign preg87_create_vld[3:0] = {d3_preg[87],d2_preg[87],d1_preg[87],d0_preg[87]};
assign preg88_create_vld[3:0] = {d3_preg[88],d2_preg[88],d1_preg[88],d0_preg[88]};
assign preg89_create_vld[3:0] = {d3_preg[89],d2_preg[89],d1_preg[89],d0_preg[89]};
assign preg90_create_vld[3:0] = {d3_preg[90],d2_preg[90],d1_preg[90],d0_preg[90]};
assign preg91_create_vld[3:0] = {d3_preg[91],d2_preg[91],d1_preg[91],d0_preg[91]};
assign preg92_create_vld[3:0] = {d3_preg[92],d2_preg[92],d1_preg[92],d0_preg[92]};
assign preg93_create_vld[3:0] = {d3_preg[93],d2_preg[93],d1_preg[93],d0_preg[93]};
assign preg94_create_vld[3:0] = {d3_preg[94],d2_preg[94],d1_preg[94],d0_preg[94]};
assign preg95_create_vld[3:0] = {d3_preg[95],d2_preg[95],d1_preg[95],d0_preg[95]};

//==========================================================
//                    Write back signals
//==========================================================
assign wb_vld[95:0] =
    {96{iu_rtu_ex2_pipe0_wb_preg_vld}} & iu_rtu_ex2_pipe0_wb_preg_expand[95:0]
  | {96{iu_rtu_ex2_pipe1_wb_preg_vld}} & iu_rtu_ex2_pipe1_wb_preg_expand[95:0]
  | {96{lsu_rtu_wb_pipe3_wb_preg_vld}} & lsu_rtu_wb_pipe3_wb_preg_expand[95:0];

assign preg0_wb_vld  = wb_vld[0];
assign preg1_wb_vld  = wb_vld[1];
assign preg2_wb_vld  = wb_vld[2];
assign preg3_wb_vld  = wb_vld[3];
assign preg4_wb_vld  = wb_vld[4];
assign preg5_wb_vld  = wb_vld[5];
assign preg6_wb_vld  = wb_vld[6];
assign preg7_wb_vld  = wb_vld[7];
assign preg8_wb_vld  = wb_vld[8];
assign preg9_wb_vld  = wb_vld[9];
assign preg10_wb_vld = wb_vld[10];
assign preg11_wb_vld = wb_vld[11];
assign preg12_wb_vld = wb_vld[12];
assign preg13_wb_vld = wb_vld[13];
assign preg14_wb_vld = wb_vld[14];
assign preg15_wb_vld = wb_vld[15];
assign preg16_wb_vld = wb_vld[16];
assign preg17_wb_vld = wb_vld[17];
assign preg18_wb_vld = wb_vld[18];
assign preg19_wb_vld = wb_vld[19];
assign preg20_wb_vld = wb_vld[20];
assign preg21_wb_vld = wb_vld[21];
assign preg22_wb_vld = wb_vld[22];
assign preg23_wb_vld = wb_vld[23];
assign preg24_wb_vld = wb_vld[24];
assign preg25_wb_vld = wb_vld[25];
assign preg26_wb_vld = wb_vld[26];
assign preg27_wb_vld = wb_vld[27];
assign preg28_wb_vld = wb_vld[28];
assign preg29_wb_vld = wb_vld[29];
assign preg30_wb_vld = wb_vld[30];
assign preg31_wb_vld = wb_vld[31];
assign preg32_wb_vld = wb_vld[32];
assign preg33_wb_vld = wb_vld[33];
assign preg34_wb_vld = wb_vld[34];
assign preg35_wb_vld = wb_vld[35];
assign preg36_wb_vld = wb_vld[36];
assign preg37_wb_vld = wb_vld[37];
assign preg38_wb_vld = wb_vld[38];
assign preg39_wb_vld = wb_vld[39];
assign preg40_wb_vld = wb_vld[40];
assign preg41_wb_vld = wb_vld[41];
assign preg42_wb_vld = wb_vld[42];
assign preg43_wb_vld = wb_vld[43];
assign preg44_wb_vld = wb_vld[44];
assign preg45_wb_vld = wb_vld[45];
assign preg46_wb_vld = wb_vld[46];
assign preg47_wb_vld = wb_vld[47];
assign preg48_wb_vld = wb_vld[48];
assign preg49_wb_vld = wb_vld[49];
assign preg50_wb_vld = wb_vld[50];
assign preg51_wb_vld = wb_vld[51];
assign preg52_wb_vld = wb_vld[52];
assign preg53_wb_vld = wb_vld[53];
assign preg54_wb_vld = wb_vld[54];
assign preg55_wb_vld = wb_vld[55];
assign preg56_wb_vld = wb_vld[56];
assign preg57_wb_vld = wb_vld[57];
assign preg58_wb_vld = wb_vld[58];
assign preg59_wb_vld = wb_vld[59];
assign preg60_wb_vld = wb_vld[60];
assign preg61_wb_vld = wb_vld[61];
assign preg62_wb_vld = wb_vld[62];
assign preg63_wb_vld = wb_vld[63];
assign preg64_wb_vld = wb_vld[64];
assign preg65_wb_vld = wb_vld[65];
assign preg66_wb_vld = wb_vld[66];
assign preg67_wb_vld = wb_vld[67];
assign preg68_wb_vld = wb_vld[68];
assign preg69_wb_vld = wb_vld[69];
assign preg70_wb_vld = wb_vld[70];
assign preg71_wb_vld = wb_vld[71];
assign preg72_wb_vld = wb_vld[72];
assign preg73_wb_vld = wb_vld[73];
assign preg74_wb_vld = wb_vld[74];
assign preg75_wb_vld = wb_vld[75];
assign preg76_wb_vld = wb_vld[76];
assign preg77_wb_vld = wb_vld[77];
assign preg78_wb_vld = wb_vld[78];
assign preg79_wb_vld = wb_vld[79];
assign preg80_wb_vld = wb_vld[80];
assign preg81_wb_vld = wb_vld[81];
assign preg82_wb_vld = wb_vld[82];
assign preg83_wb_vld = wb_vld[83];
assign preg84_wb_vld = wb_vld[84];
assign preg85_wb_vld = wb_vld[85];
assign preg86_wb_vld = wb_vld[86];
assign preg87_wb_vld = wb_vld[87];
assign preg88_wb_vld = wb_vld[88];
assign preg89_wb_vld = wb_vld[89];
assign preg90_wb_vld = wb_vld[90];
assign preg91_wb_vld = wb_vld[91];
assign preg92_wb_vld = wb_vld[92];
assign preg93_wb_vld = wb_vld[93];
assign preg94_wb_vld = wb_vld[94];
assign preg95_wb_vld = wb_vld[95];

//==========================================================
//                     Release signals
//==========================================================
assign release_vld[95:0] =
           preg0_rel_preg_expand[95:0]
         | preg1_rel_preg_expand[95:0]
         | preg2_rel_preg_expand[95:0]
         | preg3_rel_preg_expand[95:0]
         | preg4_rel_preg_expand[95:0]
         | preg5_rel_preg_expand[95:0]
         | preg6_rel_preg_expand[95:0]
         | preg7_rel_preg_expand[95:0]
         | preg8_rel_preg_expand[95:0]
         | preg9_rel_preg_expand[95:0]
         | preg10_rel_preg_expand[95:0]
         | preg11_rel_preg_expand[95:0]
         | preg12_rel_preg_expand[95:0]
         | preg13_rel_preg_expand[95:0]
         | preg14_rel_preg_expand[95:0]
         | preg15_rel_preg_expand[95:0]
         | preg16_rel_preg_expand[95:0]
         | preg17_rel_preg_expand[95:0]
         | preg18_rel_preg_expand[95:0]
         | preg19_rel_preg_expand[95:0]
         | preg20_rel_preg_expand[95:0]
         | preg21_rel_preg_expand[95:0]
         | preg22_rel_preg_expand[95:0]
         | preg23_rel_preg_expand[95:0]
         | preg24_rel_preg_expand[95:0]
         | preg25_rel_preg_expand[95:0]
         | preg26_rel_preg_expand[95:0]
         | preg27_rel_preg_expand[95:0]
         | preg28_rel_preg_expand[95:0]
         | preg29_rel_preg_expand[95:0]
         | preg30_rel_preg_expand[95:0]
         | preg31_rel_preg_expand[95:0]
         | preg32_rel_preg_expand[95:0]
         | preg33_rel_preg_expand[95:0]
         | preg34_rel_preg_expand[95:0]
         | preg35_rel_preg_expand[95:0]
         | preg36_rel_preg_expand[95:0]
         | preg37_rel_preg_expand[95:0]
         | preg38_rel_preg_expand[95:0]
         | preg39_rel_preg_expand[95:0]
         | preg40_rel_preg_expand[95:0]
         | preg41_rel_preg_expand[95:0]
         | preg42_rel_preg_expand[95:0]
         | preg43_rel_preg_expand[95:0]
         | preg44_rel_preg_expand[95:0]
         | preg45_rel_preg_expand[95:0]
         | preg46_rel_preg_expand[95:0]
         | preg47_rel_preg_expand[95:0]
         | preg48_rel_preg_expand[95:0]
         | preg49_rel_preg_expand[95:0]
         | preg50_rel_preg_expand[95:0]
         | preg51_rel_preg_expand[95:0]
         | preg52_rel_preg_expand[95:0]
         | preg53_rel_preg_expand[95:0]
         | preg54_rel_preg_expand[95:0]
         | preg55_rel_preg_expand[95:0]
         | preg56_rel_preg_expand[95:0]
         | preg57_rel_preg_expand[95:0]
         | preg58_rel_preg_expand[95:0]
         | preg59_rel_preg_expand[95:0]
         | preg60_rel_preg_expand[95:0]
         | preg61_rel_preg_expand[95:0]
         | preg62_rel_preg_expand[95:0]
         | preg63_rel_preg_expand[95:0]
         | preg64_rel_preg_expand[95:0]
         | preg65_rel_preg_expand[95:0]
         | preg66_rel_preg_expand[95:0]
         | preg67_rel_preg_expand[95:0]
         | preg68_rel_preg_expand[95:0]
         | preg69_rel_preg_expand[95:0]
         | preg70_rel_preg_expand[95:0]
         | preg71_rel_preg_expand[95:0]
         | preg72_rel_preg_expand[95:0]
         | preg73_rel_preg_expand[95:0]
         | preg74_rel_preg_expand[95:0]
         | preg75_rel_preg_expand[95:0]
         | preg76_rel_preg_expand[95:0]
         | preg77_rel_preg_expand[95:0]
         | preg78_rel_preg_expand[95:0]
         | preg79_rel_preg_expand[95:0]
         | preg80_rel_preg_expand[95:0]
         | preg81_rel_preg_expand[95:0]
         | preg82_rel_preg_expand[95:0]
         | preg83_rel_preg_expand[95:0]
         | preg84_rel_preg_expand[95:0]
         | preg85_rel_preg_expand[95:0]
         | preg86_rel_preg_expand[95:0]
         | preg87_rel_preg_expand[95:0]
         | preg88_rel_preg_expand[95:0]
         | preg89_rel_preg_expand[95:0]
         | preg90_rel_preg_expand[95:0]
         | preg91_rel_preg_expand[95:0]
         | preg92_rel_preg_expand[95:0]
         | preg93_rel_preg_expand[95:0]
         | preg94_rel_preg_expand[95:0]
         | preg95_rel_preg_expand[95:0];

assign preg0_release_vld  = release_vld[0];
assign preg1_release_vld  = release_vld[1];
assign preg2_release_vld  = release_vld[2];
assign preg3_release_vld  = release_vld[3];
assign preg4_release_vld  = release_vld[4];
assign preg5_release_vld  = release_vld[5];
assign preg6_release_vld  = release_vld[6];
assign preg7_release_vld  = release_vld[7];
assign preg8_release_vld  = release_vld[8];
assign preg9_release_vld  = release_vld[9];
assign preg10_release_vld = release_vld[10];
assign preg11_release_vld = release_vld[11];
assign preg12_release_vld = release_vld[12];
assign preg13_release_vld = release_vld[13];
assign preg14_release_vld = release_vld[14];
assign preg15_release_vld = release_vld[15];
assign preg16_release_vld = release_vld[16];
assign preg17_release_vld = release_vld[17];
assign preg18_release_vld = release_vld[18];
assign preg19_release_vld = release_vld[19];
assign preg20_release_vld = release_vld[20];
assign preg21_release_vld = release_vld[21];
assign preg22_release_vld = release_vld[22];
assign preg23_release_vld = release_vld[23];
assign preg24_release_vld = release_vld[24];
assign preg25_release_vld = release_vld[25];
assign preg26_release_vld = release_vld[26];
assign preg27_release_vld = release_vld[27];
assign preg28_release_vld = release_vld[28];
assign preg29_release_vld = release_vld[29];
assign preg30_release_vld = release_vld[30];
assign preg31_release_vld = release_vld[31];
assign preg32_release_vld = release_vld[32];
assign preg33_release_vld = release_vld[33];
assign preg34_release_vld = release_vld[34];
assign preg35_release_vld = release_vld[35];
assign preg36_release_vld = release_vld[36];
assign preg37_release_vld = release_vld[37];
assign preg38_release_vld = release_vld[38];
assign preg39_release_vld = release_vld[39];
assign preg40_release_vld = release_vld[40];
assign preg41_release_vld = release_vld[41];
assign preg42_release_vld = release_vld[42];
assign preg43_release_vld = release_vld[43];
assign preg44_release_vld = release_vld[44];
assign preg45_release_vld = release_vld[45];
assign preg46_release_vld = release_vld[46];
assign preg47_release_vld = release_vld[47];
assign preg48_release_vld = release_vld[48];
assign preg49_release_vld = release_vld[49];
assign preg50_release_vld = release_vld[50];
assign preg51_release_vld = release_vld[51];
assign preg52_release_vld = release_vld[52];
assign preg53_release_vld = release_vld[53];
assign preg54_release_vld = release_vld[54];
assign preg55_release_vld = release_vld[55];
assign preg56_release_vld = release_vld[56];
assign preg57_release_vld = release_vld[57];
assign preg58_release_vld = release_vld[58];
assign preg59_release_vld = release_vld[59];
assign preg60_release_vld = release_vld[60];
assign preg61_release_vld = release_vld[61];
assign preg62_release_vld = release_vld[62];
assign preg63_release_vld = release_vld[63];
assign preg64_release_vld = release_vld[64];
assign preg65_release_vld = release_vld[65];
assign preg66_release_vld = release_vld[66];
assign preg67_release_vld = release_vld[67];
assign preg68_release_vld = release_vld[68];
assign preg69_release_vld = release_vld[69];
assign preg70_release_vld = release_vld[70];
assign preg71_release_vld = release_vld[71];
assign preg72_release_vld = release_vld[72];
assign preg73_release_vld = release_vld[73];
assign preg74_release_vld = release_vld[74];
assign preg75_release_vld = release_vld[75];
assign preg76_release_vld = release_vld[76];
assign preg77_release_vld = release_vld[77];
assign preg78_release_vld = release_vld[78];
assign preg79_release_vld = release_vld[79];
assign preg80_release_vld = release_vld[80];
assign preg81_release_vld = release_vld[81];
assign preg82_release_vld = release_vld[82];
assign preg83_release_vld = release_vld[83];
assign preg84_release_vld = release_vld[84];
assign preg85_release_vld = release_vld[85];
assign preg86_release_vld = release_vld[86];
assign preg87_release_vld = release_vld[87];
assign preg88_release_vld = release_vld[88];
assign preg89_release_vld = release_vld[89];
assign preg90_release_vld = release_vld[90];
assign preg91_release_vld = release_vld[91];
assign preg92_release_vld = release_vld[92];
assign preg93_release_vld = release_vld[93];
assign preg94_release_vld = release_vld[94];
assign preg95_release_vld = release_vld[95];

//==========================================================
//                     Dealloc signals
//==========================================================
//----------------------------------------------------------
//                calculate dealloc vector
//----------------------------------------------------------
//get all entry dealloc bits
assign dealloc[0]  = preg0_cur_state_dealloc;
assign dealloc[1]  = preg1_cur_state_dealloc;
assign dealloc[2]  = preg2_cur_state_dealloc;
assign dealloc[3]  = preg3_cur_state_dealloc;
assign dealloc[4]  = preg4_cur_state_dealloc;
assign dealloc[5]  = preg5_cur_state_dealloc;
assign dealloc[6]  = preg6_cur_state_dealloc;
assign dealloc[7]  = preg7_cur_state_dealloc;
assign dealloc[8]  = preg8_cur_state_dealloc;
assign dealloc[9]  = preg9_cur_state_dealloc;
assign dealloc[10] = preg10_cur_state_dealloc;
assign dealloc[11] = preg11_cur_state_dealloc;
assign dealloc[12] = preg12_cur_state_dealloc;
assign dealloc[13] = preg13_cur_state_dealloc;
assign dealloc[14] = preg14_cur_state_dealloc;
assign dealloc[15] = preg15_cur_state_dealloc;
assign dealloc[16] = preg16_cur_state_dealloc;
assign dealloc[17] = preg17_cur_state_dealloc;
assign dealloc[18] = preg18_cur_state_dealloc;
assign dealloc[19] = preg19_cur_state_dealloc;
assign dealloc[20] = preg20_cur_state_dealloc;
assign dealloc[21] = preg21_cur_state_dealloc;
assign dealloc[22] = preg22_cur_state_dealloc;
assign dealloc[23] = preg23_cur_state_dealloc;
assign dealloc[24] = preg24_cur_state_dealloc;
assign dealloc[25] = preg25_cur_state_dealloc;
assign dealloc[26] = preg26_cur_state_dealloc;
assign dealloc[27] = preg27_cur_state_dealloc;
assign dealloc[28] = preg28_cur_state_dealloc;
assign dealloc[29] = preg29_cur_state_dealloc;
assign dealloc[30] = preg30_cur_state_dealloc;
assign dealloc[31] = preg31_cur_state_dealloc;
assign dealloc[32] = preg32_cur_state_dealloc;
assign dealloc[33] = preg33_cur_state_dealloc;
assign dealloc[34] = preg34_cur_state_dealloc;
assign dealloc[35] = preg35_cur_state_dealloc;
assign dealloc[36] = preg36_cur_state_dealloc;
assign dealloc[37] = preg37_cur_state_dealloc;
assign dealloc[38] = preg38_cur_state_dealloc;
assign dealloc[39] = preg39_cur_state_dealloc;
assign dealloc[40] = preg40_cur_state_dealloc;
assign dealloc[41] = preg41_cur_state_dealloc;
assign dealloc[42] = preg42_cur_state_dealloc;
assign dealloc[43] = preg43_cur_state_dealloc;
assign dealloc[44] = preg44_cur_state_dealloc;
assign dealloc[45] = preg45_cur_state_dealloc;
assign dealloc[46] = preg46_cur_state_dealloc;
assign dealloc[47] = preg47_cur_state_dealloc;
assign dealloc[48] = preg48_cur_state_dealloc;
assign dealloc[49] = preg49_cur_state_dealloc;
assign dealloc[50] = preg50_cur_state_dealloc;
assign dealloc[51] = preg51_cur_state_dealloc;
assign dealloc[52] = preg52_cur_state_dealloc;
assign dealloc[53] = preg53_cur_state_dealloc;
assign dealloc[54] = preg54_cur_state_dealloc;
assign dealloc[55] = preg55_cur_state_dealloc;
assign dealloc[56] = preg56_cur_state_dealloc;
assign dealloc[57] = preg57_cur_state_dealloc;
assign dealloc[58] = preg58_cur_state_dealloc;
assign dealloc[59] = preg59_cur_state_dealloc;
assign dealloc[60] = preg60_cur_state_dealloc;
assign dealloc[61] = preg61_cur_state_dealloc;
assign dealloc[62] = preg62_cur_state_dealloc;
assign dealloc[63] = preg63_cur_state_dealloc;
assign dealloc[64] = preg64_cur_state_dealloc;
assign dealloc[65] = preg65_cur_state_dealloc;
assign dealloc[66] = preg66_cur_state_dealloc;
assign dealloc[67] = preg67_cur_state_dealloc;
assign dealloc[68] = preg68_cur_state_dealloc;
assign dealloc[69] = preg69_cur_state_dealloc;
assign dealloc[70] = preg70_cur_state_dealloc;
assign dealloc[71] = preg71_cur_state_dealloc;
assign dealloc[72] = preg72_cur_state_dealloc;
assign dealloc[73] = preg73_cur_state_dealloc;
assign dealloc[74] = preg74_cur_state_dealloc;
assign dealloc[75] = preg75_cur_state_dealloc;
assign dealloc[76] = preg76_cur_state_dealloc;
assign dealloc[77] = preg77_cur_state_dealloc;
assign dealloc[78] = preg78_cur_state_dealloc;
assign dealloc[79] = preg79_cur_state_dealloc;
assign dealloc[80] = preg80_cur_state_dealloc;
assign dealloc[81] = preg81_cur_state_dealloc;
assign dealloc[82] = preg82_cur_state_dealloc;
assign dealloc[83] = preg83_cur_state_dealloc;
assign dealloc[84] = preg84_cur_state_dealloc;
assign dealloc[85] = preg85_cur_state_dealloc;
assign dealloc[86] = preg86_cur_state_dealloc;
assign dealloc[87] = preg87_cur_state_dealloc;
assign dealloc[88] = preg88_cur_state_dealloc;
assign dealloc[89] = preg89_cur_state_dealloc;
assign dealloc[90] = preg90_cur_state_dealloc;
assign dealloc[91] = preg91_cur_state_dealloc;
assign dealloc[92] = preg92_cur_state_dealloc;
assign dealloc[93] = preg93_cur_state_dealloc;
assign dealloc[94] = preg94_cur_state_dealloc;
assign dealloc[95] = preg95_cur_state_dealloc;

//one-hot dealloc preg 0,
//search priority is from p0 to p95
assign dealloc0[0]  = dealloc[0];
assign dealloc0[1]  = dealloc[1]  && !dealloc[0];
assign dealloc0[2]  = dealloc[2]  && !(|dealloc[1:0]);
assign dealloc0[3]  = dealloc[3]  && !(|dealloc[2:0]);
assign dealloc0[4]  = dealloc[4]  && !(|dealloc[3:0]);
assign dealloc0[5]  = dealloc[5]  && !(|dealloc[4:0]);
assign dealloc0[6]  = dealloc[6]  && !(|dealloc[5:0]);
assign dealloc0[7]  = dealloc[7]  && !(|dealloc[6:0]);
assign dealloc0[8]  = dealloc[8]  && !(|dealloc[7:0]);
assign dealloc0[9]  = dealloc[9]  && !(|dealloc[8:0]);
assign dealloc0[10] = dealloc[10] && !(|dealloc[9:0]);
assign dealloc0[11] = dealloc[11] && !(|dealloc[10:0]);
assign dealloc0[12] = dealloc[12] && !(|dealloc[11:0]);
assign dealloc0[13] = dealloc[13] && !(|dealloc[12:0]);
assign dealloc0[14] = dealloc[14] && !(|dealloc[13:0]);
assign dealloc0[15] = dealloc[15] && !(|dealloc[14:0]);
assign dealloc0[16] = dealloc[16] && !(|dealloc[15:0]);
assign dealloc0[17] = dealloc[17] && !(|dealloc[16:0]);
assign dealloc0[18] = dealloc[18] && !(|dealloc[17:0]);
assign dealloc0[19] = dealloc[19] && !(|dealloc[18:0]);
assign dealloc0[20] = dealloc[20] && !(|dealloc[19:0]);
assign dealloc0[21] = dealloc[21] && !(|dealloc[20:0]);
assign dealloc0[22] = dealloc[22] && !(|dealloc[21:0]);
assign dealloc0[23] = dealloc[23] && !(|dealloc[22:0]);
assign dealloc0[24] = dealloc[24] && !(|dealloc[23:0]);
assign dealloc0[25] = dealloc[25] && !(|dealloc[24:0]);
assign dealloc0[26] = dealloc[26] && !(|dealloc[25:0]);
assign dealloc0[27] = dealloc[27] && !(|dealloc[26:0]);
assign dealloc0[28] = dealloc[28] && !(|dealloc[27:0]);
assign dealloc0[29] = dealloc[29] && !(|dealloc[28:0]);
assign dealloc0[30] = dealloc[30] && !(|dealloc[29:0]);
assign dealloc0[31] = dealloc[31] && !(|dealloc[30:0]);
assign dealloc0[32] = dealloc[32] && !(|dealloc[31:0]);
assign dealloc0[33] = dealloc[33] && !(|dealloc[32:0]);
assign dealloc0[34] = dealloc[34] && !(|dealloc[33:0]);
assign dealloc0[35] = dealloc[35] && !(|dealloc[34:0]);
assign dealloc0[36] = dealloc[36] && !(|dealloc[35:0]);
assign dealloc0[37] = dealloc[37] && !(|dealloc[36:0]);
assign dealloc0[38] = dealloc[38] && !(|dealloc[37:0]);
assign dealloc0[39] = dealloc[39] && !(|dealloc[38:0]);
assign dealloc0[40] = dealloc[40] && !(|dealloc[39:0]);
assign dealloc0[41] = dealloc[41] && !(|dealloc[40:0]);
assign dealloc0[42] = dealloc[42] && !(|dealloc[41:0]);
assign dealloc0[43] = dealloc[43] && !(|dealloc[42:0]);
assign dealloc0[44] = dealloc[44] && !(|dealloc[43:0]);
assign dealloc0[45] = dealloc[45] && !(|dealloc[44:0]);
assign dealloc0[46] = dealloc[46] && !(|dealloc[45:0]);
assign dealloc0[47] = dealloc[47] && !(|dealloc[46:0]);
assign dealloc0[48] = dealloc[48] && !(|dealloc[47:0]);
assign dealloc0[49] = dealloc[49] && !(|dealloc[48:0]);
assign dealloc0[50] = dealloc[50] && !(|dealloc[49:0]);
assign dealloc0[51] = dealloc[51] && !(|dealloc[50:0]);
assign dealloc0[52] = dealloc[52] && !(|dealloc[51:0]);
assign dealloc0[53] = dealloc[53] && !(|dealloc[52:0]);
assign dealloc0[54] = dealloc[54] && !(|dealloc[53:0]);
assign dealloc0[55] = dealloc[55] && !(|dealloc[54:0]);
assign dealloc0[56] = dealloc[56] && !(|dealloc[55:0]);
assign dealloc0[57] = dealloc[57] && !(|dealloc[56:0]);
assign dealloc0[58] = dealloc[58] && !(|dealloc[57:0]);
assign dealloc0[59] = dealloc[59] && !(|dealloc[58:0]);
assign dealloc0[60] = dealloc[60] && !(|dealloc[59:0]);
assign dealloc0[61] = dealloc[61] && !(|dealloc[60:0]);
assign dealloc0[62] = dealloc[62] && !(|dealloc[61:0]);
assign dealloc0[63] = dealloc[63] && !(|dealloc[62:0]);
assign dealloc0[64] = dealloc[64] && !(|dealloc[63:0]);
assign dealloc0[65] = dealloc[65] && !(|dealloc[64:0]);
assign dealloc0[66] = dealloc[66] && !(|dealloc[65:0]);
assign dealloc0[67] = dealloc[67] && !(|dealloc[66:0]);
assign dealloc0[68] = dealloc[68] && !(|dealloc[67:0]);
assign dealloc0[69] = dealloc[69] && !(|dealloc[68:0]);
assign dealloc0[70] = dealloc[70] && !(|dealloc[69:0]);
assign dealloc0[71] = dealloc[71] && !(|dealloc[70:0]);
assign dealloc0[72] = dealloc[72] && !(|dealloc[71:0]);
assign dealloc0[73] = dealloc[73] && !(|dealloc[72:0]);
assign dealloc0[74] = dealloc[74] && !(|dealloc[73:0]);
assign dealloc0[75] = dealloc[75] && !(|dealloc[74:0]);
assign dealloc0[76] = dealloc[76] && !(|dealloc[75:0]);
assign dealloc0[77] = dealloc[77] && !(|dealloc[76:0]);
assign dealloc0[78] = dealloc[78] && !(|dealloc[77:0]);
assign dealloc0[79] = dealloc[79] && !(|dealloc[78:0]);
assign dealloc0[80] = dealloc[80] && !(|dealloc[79:0]);
assign dealloc0[81] = dealloc[81] && !(|dealloc[80:0]);
assign dealloc0[82] = dealloc[82] && !(|dealloc[81:0]);
assign dealloc0[83] = dealloc[83] && !(|dealloc[82:0]);
assign dealloc0[84] = dealloc[84] && !(|dealloc[83:0]);
assign dealloc0[85] = dealloc[85] && !(|dealloc[84:0]);
assign dealloc0[86] = dealloc[86] && !(|dealloc[85:0]);
assign dealloc0[87] = dealloc[87] && !(|dealloc[86:0]);
assign dealloc0[88] = dealloc[88] && !(|dealloc[87:0]);
assign dealloc0[89] = dealloc[89] && !(|dealloc[88:0]);
assign dealloc0[90] = dealloc[90] && !(|dealloc[89:0]);
assign dealloc0[91] = dealloc[91] && !(|dealloc[90:0]);
assign dealloc0[92] = dealloc[92] && !(|dealloc[91:0]);
assign dealloc0[93] = dealloc[93] && !(|dealloc[92:0]);
assign dealloc0[94] = dealloc[94] && !(|dealloc[93:0]);
assign dealloc0[95] = dealloc[95] && !(|dealloc[94:0]);

//one-hot dealloc preg 1,
//search priority is from p95 to p0
assign dealloc1[0]  = dealloc[0]  && !(|dealloc[95:1]);
assign dealloc1[1]  = dealloc[1]  && !(|dealloc[95:2]);
assign dealloc1[2]  = dealloc[2]  && !(|dealloc[95:3]);
assign dealloc1[3]  = dealloc[3]  && !(|dealloc[95:4]);
assign dealloc1[4]  = dealloc[4]  && !(|dealloc[95:5]);
assign dealloc1[5]  = dealloc[5]  && !(|dealloc[95:6]);
assign dealloc1[6]  = dealloc[6]  && !(|dealloc[95:7]);
assign dealloc1[7]  = dealloc[7]  && !(|dealloc[95:8]);
assign dealloc1[8]  = dealloc[8]  && !(|dealloc[95:9]);
assign dealloc1[9]  = dealloc[9]  && !(|dealloc[95:10]);
assign dealloc1[10] = dealloc[10] && !(|dealloc[95:11]);
assign dealloc1[11] = dealloc[11] && !(|dealloc[95:12]);
assign dealloc1[12] = dealloc[12] && !(|dealloc[95:13]);
assign dealloc1[13] = dealloc[13] && !(|dealloc[95:14]);
assign dealloc1[14] = dealloc[14] && !(|dealloc[95:15]);
assign dealloc1[15] = dealloc[15] && !(|dealloc[95:16]);
assign dealloc1[16] = dealloc[16] && !(|dealloc[95:17]);
assign dealloc1[17] = dealloc[17] && !(|dealloc[95:18]);
assign dealloc1[18] = dealloc[18] && !(|dealloc[95:19]);
assign dealloc1[19] = dealloc[19] && !(|dealloc[95:20]);
assign dealloc1[20] = dealloc[20] && !(|dealloc[95:21]);
assign dealloc1[21] = dealloc[21] && !(|dealloc[95:22]);
assign dealloc1[22] = dealloc[22] && !(|dealloc[95:23]);
assign dealloc1[23] = dealloc[23] && !(|dealloc[95:24]);
assign dealloc1[24] = dealloc[24] && !(|dealloc[95:25]);
assign dealloc1[25] = dealloc[25] && !(|dealloc[95:26]);
assign dealloc1[26] = dealloc[26] && !(|dealloc[95:27]);
assign dealloc1[27] = dealloc[27] && !(|dealloc[95:28]);
assign dealloc1[28] = dealloc[28] && !(|dealloc[95:29]);
assign dealloc1[29] = dealloc[29] && !(|dealloc[95:30]);
assign dealloc1[30] = dealloc[30] && !(|dealloc[95:31]);
assign dealloc1[31] = dealloc[31] && !(|dealloc[95:32]);
assign dealloc1[32] = dealloc[32] && !(|dealloc[95:33]);
assign dealloc1[33] = dealloc[33] && !(|dealloc[95:34]);
assign dealloc1[34] = dealloc[34] && !(|dealloc[95:35]);
assign dealloc1[35] = dealloc[35] && !(|dealloc[95:36]);
assign dealloc1[36] = dealloc[36] && !(|dealloc[95:37]);
assign dealloc1[37] = dealloc[37] && !(|dealloc[95:38]);
assign dealloc1[38] = dealloc[38] && !(|dealloc[95:39]);
assign dealloc1[39] = dealloc[39] && !(|dealloc[95:40]);
assign dealloc1[40] = dealloc[40] && !(|dealloc[95:41]);
assign dealloc1[41] = dealloc[41] && !(|dealloc[95:42]);
assign dealloc1[42] = dealloc[42] && !(|dealloc[95:43]);
assign dealloc1[43] = dealloc[43] && !(|dealloc[95:44]);
assign dealloc1[44] = dealloc[44] && !(|dealloc[95:45]);
assign dealloc1[45] = dealloc[45] && !(|dealloc[95:46]);
assign dealloc1[46] = dealloc[46] && !(|dealloc[95:47]);
assign dealloc1[47] = dealloc[47] && !(|dealloc[95:48]);
assign dealloc1[48] = dealloc[48] && !(|dealloc[95:49]);
assign dealloc1[49] = dealloc[49] && !(|dealloc[95:50]);
assign dealloc1[50] = dealloc[50] && !(|dealloc[95:51]);
assign dealloc1[51] = dealloc[51] && !(|dealloc[95:52]);
assign dealloc1[52] = dealloc[52] && !(|dealloc[95:53]);
assign dealloc1[53] = dealloc[53] && !(|dealloc[95:54]);
assign dealloc1[54] = dealloc[54] && !(|dealloc[95:55]);
assign dealloc1[55] = dealloc[55] && !(|dealloc[95:56]);
assign dealloc1[56] = dealloc[56] && !(|dealloc[95:57]);
assign dealloc1[57] = dealloc[57] && !(|dealloc[95:58]);
assign dealloc1[58] = dealloc[58] && !(|dealloc[95:59]);
assign dealloc1[59] = dealloc[59] && !(|dealloc[95:60]);
assign dealloc1[60] = dealloc[60] && !(|dealloc[95:61]);
assign dealloc1[61] = dealloc[61] && !(|dealloc[95:62]);
assign dealloc1[62] = dealloc[62] && !(|dealloc[95:63]);
assign dealloc1[63] = dealloc[63] && !(|dealloc[95:64]);
assign dealloc1[64] = dealloc[64] && !(|dealloc[95:65]);
assign dealloc1[65] = dealloc[65] && !(|dealloc[95:66]);
assign dealloc1[66] = dealloc[66] && !(|dealloc[95:67]);
assign dealloc1[67] = dealloc[67] && !(|dealloc[95:68]);
assign dealloc1[68] = dealloc[68] && !(|dealloc[95:69]);
assign dealloc1[69] = dealloc[69] && !(|dealloc[95:70]);
assign dealloc1[70] = dealloc[70] && !(|dealloc[95:71]);
assign dealloc1[71] = dealloc[71] && !(|dealloc[95:72]);
assign dealloc1[72] = dealloc[72] && !(|dealloc[95:73]);
assign dealloc1[73] = dealloc[73] && !(|dealloc[95:74]);
assign dealloc1[74] = dealloc[74] && !(|dealloc[95:75]);
assign dealloc1[75] = dealloc[75] && !(|dealloc[95:76]);
assign dealloc1[76] = dealloc[76] && !(|dealloc[95:77]);
assign dealloc1[77] = dealloc[77] && !(|dealloc[95:78]);
assign dealloc1[78] = dealloc[78] && !(|dealloc[95:79]);
assign dealloc1[79] = dealloc[79] && !(|dealloc[95:80]);
assign dealloc1[80] = dealloc[80] && !(|dealloc[95:81]);
assign dealloc1[81] = dealloc[81] && !(|dealloc[95:82]);
assign dealloc1[82] = dealloc[82] && !(|dealloc[95:83]);
assign dealloc1[83] = dealloc[83] && !(|dealloc[95:84]);
assign dealloc1[84] = dealloc[84] && !(|dealloc[95:85]);
assign dealloc1[85] = dealloc[85] && !(|dealloc[95:86]);
assign dealloc1[86] = dealloc[86] && !(|dealloc[95:87]);
assign dealloc1[87] = dealloc[87] && !(|dealloc[95:88]);
assign dealloc1[88] = dealloc[88] && !(|dealloc[95:89]);
assign dealloc1[89] = dealloc[89] && !(|dealloc[95:90]);
assign dealloc1[90] = dealloc[90] && !(|dealloc[95:91]);
assign dealloc1[91] = dealloc[91] && !(|dealloc[95:92]);
assign dealloc1[92] = dealloc[92] && !(|dealloc[95:93]);
assign dealloc1[93] = dealloc[93] && !(|dealloc[95:94]);
assign dealloc1[94] = dealloc[94] && !dealloc[95];
assign dealloc1[95] = dealloc[95];

//one-hot dealloc preg 2,
//remove dealloc preg 0, and then search priority is from p0 to p95
assign dealloc_no_0[95:0] = dealloc[95:0] & ~dealloc0[95:0];

assign dealloc2[0]  = dealloc_no_0[0];
assign dealloc2[1]  = dealloc_no_0[1]  && !dealloc_no_0[0];
assign dealloc2[2]  = dealloc_no_0[2]  && !(|dealloc_no_0[1:0]);
assign dealloc2[3]  = dealloc_no_0[3]  && !(|dealloc_no_0[2:0]);
assign dealloc2[4]  = dealloc_no_0[4]  && !(|dealloc_no_0[3:0]);
assign dealloc2[5]  = dealloc_no_0[5]  && !(|dealloc_no_0[4:0]);
assign dealloc2[6]  = dealloc_no_0[6]  && !(|dealloc_no_0[5:0]);
assign dealloc2[7]  = dealloc_no_0[7]  && !(|dealloc_no_0[6:0]);
assign dealloc2[8]  = dealloc_no_0[8]  && !(|dealloc_no_0[7:0]);
assign dealloc2[9]  = dealloc_no_0[9]  && !(|dealloc_no_0[8:0]);
assign dealloc2[10] = dealloc_no_0[10] && !(|dealloc_no_0[9:0]);
assign dealloc2[11] = dealloc_no_0[11] && !(|dealloc_no_0[10:0]);
assign dealloc2[12] = dealloc_no_0[12] && !(|dealloc_no_0[11:0]);
assign dealloc2[13] = dealloc_no_0[13] && !(|dealloc_no_0[12:0]);
assign dealloc2[14] = dealloc_no_0[14] && !(|dealloc_no_0[13:0]);
assign dealloc2[15] = dealloc_no_0[15] && !(|dealloc_no_0[14:0]);
assign dealloc2[16] = dealloc_no_0[16] && !(|dealloc_no_0[15:0]);
assign dealloc2[17] = dealloc_no_0[17] && !(|dealloc_no_0[16:0]);
assign dealloc2[18] = dealloc_no_0[18] && !(|dealloc_no_0[17:0]);
assign dealloc2[19] = dealloc_no_0[19] && !(|dealloc_no_0[18:0]);
assign dealloc2[20] = dealloc_no_0[20] && !(|dealloc_no_0[19:0]);
assign dealloc2[21] = dealloc_no_0[21] && !(|dealloc_no_0[20:0]);
assign dealloc2[22] = dealloc_no_0[22] && !(|dealloc_no_0[21:0]);
assign dealloc2[23] = dealloc_no_0[23] && !(|dealloc_no_0[22:0]);
assign dealloc2[24] = dealloc_no_0[24] && !(|dealloc_no_0[23:0]);
assign dealloc2[25] = dealloc_no_0[25] && !(|dealloc_no_0[24:0]);
assign dealloc2[26] = dealloc_no_0[26] && !(|dealloc_no_0[25:0]);
assign dealloc2[27] = dealloc_no_0[27] && !(|dealloc_no_0[26:0]);
assign dealloc2[28] = dealloc_no_0[28] && !(|dealloc_no_0[27:0]);
assign dealloc2[29] = dealloc_no_0[29] && !(|dealloc_no_0[28:0]);
assign dealloc2[30] = dealloc_no_0[30] && !(|dealloc_no_0[29:0]);
assign dealloc2[31] = dealloc_no_0[31] && !(|dealloc_no_0[30:0]);
assign dealloc2[32] = dealloc_no_0[32] && !(|dealloc_no_0[31:0]);
assign dealloc2[33] = dealloc_no_0[33] && !(|dealloc_no_0[32:0]);
assign dealloc2[34] = dealloc_no_0[34] && !(|dealloc_no_0[33:0]);
assign dealloc2[35] = dealloc_no_0[35] && !(|dealloc_no_0[34:0]);
assign dealloc2[36] = dealloc_no_0[36] && !(|dealloc_no_0[35:0]);
assign dealloc2[37] = dealloc_no_0[37] && !(|dealloc_no_0[36:0]);
assign dealloc2[38] = dealloc_no_0[38] && !(|dealloc_no_0[37:0]);
assign dealloc2[39] = dealloc_no_0[39] && !(|dealloc_no_0[38:0]);
assign dealloc2[40] = dealloc_no_0[40] && !(|dealloc_no_0[39:0]);
assign dealloc2[41] = dealloc_no_0[41] && !(|dealloc_no_0[40:0]);
assign dealloc2[42] = dealloc_no_0[42] && !(|dealloc_no_0[41:0]);
assign dealloc2[43] = dealloc_no_0[43] && !(|dealloc_no_0[42:0]);
assign dealloc2[44] = dealloc_no_0[44] && !(|dealloc_no_0[43:0]);
assign dealloc2[45] = dealloc_no_0[45] && !(|dealloc_no_0[44:0]);
assign dealloc2[46] = dealloc_no_0[46] && !(|dealloc_no_0[45:0]);
assign dealloc2[47] = dealloc_no_0[47] && !(|dealloc_no_0[46:0]);
assign dealloc2[48] = dealloc_no_0[48] && !(|dealloc_no_0[47:0]);
assign dealloc2[49] = dealloc_no_0[49] && !(|dealloc_no_0[48:0]);
assign dealloc2[50] = dealloc_no_0[50] && !(|dealloc_no_0[49:0]);
assign dealloc2[51] = dealloc_no_0[51] && !(|dealloc_no_0[50:0]);
assign dealloc2[52] = dealloc_no_0[52] && !(|dealloc_no_0[51:0]);
assign dealloc2[53] = dealloc_no_0[53] && !(|dealloc_no_0[52:0]);
assign dealloc2[54] = dealloc_no_0[54] && !(|dealloc_no_0[53:0]);
assign dealloc2[55] = dealloc_no_0[55] && !(|dealloc_no_0[54:0]);
assign dealloc2[56] = dealloc_no_0[56] && !(|dealloc_no_0[55:0]);
assign dealloc2[57] = dealloc_no_0[57] && !(|dealloc_no_0[56:0]);
assign dealloc2[58] = dealloc_no_0[58] && !(|dealloc_no_0[57:0]);
assign dealloc2[59] = dealloc_no_0[59] && !(|dealloc_no_0[58:0]);
assign dealloc2[60] = dealloc_no_0[60] && !(|dealloc_no_0[59:0]);
assign dealloc2[61] = dealloc_no_0[61] && !(|dealloc_no_0[60:0]);
assign dealloc2[62] = dealloc_no_0[62] && !(|dealloc_no_0[61:0]);
assign dealloc2[63] = dealloc_no_0[63] && !(|dealloc_no_0[62:0]);
assign dealloc2[64] = dealloc_no_0[64] && !(|dealloc_no_0[63:0]);
assign dealloc2[65] = dealloc_no_0[65] && !(|dealloc_no_0[64:0]);
assign dealloc2[66] = dealloc_no_0[66] && !(|dealloc_no_0[65:0]);
assign dealloc2[67] = dealloc_no_0[67] && !(|dealloc_no_0[66:0]);
assign dealloc2[68] = dealloc_no_0[68] && !(|dealloc_no_0[67:0]);
assign dealloc2[69] = dealloc_no_0[69] && !(|dealloc_no_0[68:0]);
assign dealloc2[70] = dealloc_no_0[70] && !(|dealloc_no_0[69:0]);
assign dealloc2[71] = dealloc_no_0[71] && !(|dealloc_no_0[70:0]);
assign dealloc2[72] = dealloc_no_0[72] && !(|dealloc_no_0[71:0]);
assign dealloc2[73] = dealloc_no_0[73] && !(|dealloc_no_0[72:0]);
assign dealloc2[74] = dealloc_no_0[74] && !(|dealloc_no_0[73:0]);
assign dealloc2[75] = dealloc_no_0[75] && !(|dealloc_no_0[74:0]);
assign dealloc2[76] = dealloc_no_0[76] && !(|dealloc_no_0[75:0]);
assign dealloc2[77] = dealloc_no_0[77] && !(|dealloc_no_0[76:0]);
assign dealloc2[78] = dealloc_no_0[78] && !(|dealloc_no_0[77:0]);
assign dealloc2[79] = dealloc_no_0[79] && !(|dealloc_no_0[78:0]);
assign dealloc2[80] = dealloc_no_0[80] && !(|dealloc_no_0[79:0]);
assign dealloc2[81] = dealloc_no_0[81] && !(|dealloc_no_0[80:0]);
assign dealloc2[82] = dealloc_no_0[82] && !(|dealloc_no_0[81:0]);
assign dealloc2[83] = dealloc_no_0[83] && !(|dealloc_no_0[82:0]);
assign dealloc2[84] = dealloc_no_0[84] && !(|dealloc_no_0[83:0]);
assign dealloc2[85] = dealloc_no_0[85] && !(|dealloc_no_0[84:0]);
assign dealloc2[86] = dealloc_no_0[86] && !(|dealloc_no_0[85:0]);
assign dealloc2[87] = dealloc_no_0[87] && !(|dealloc_no_0[86:0]);
assign dealloc2[88] = dealloc_no_0[88] && !(|dealloc_no_0[87:0]);
assign dealloc2[89] = dealloc_no_0[89] && !(|dealloc_no_0[88:0]);
assign dealloc2[90] = dealloc_no_0[90] && !(|dealloc_no_0[89:0]);
assign dealloc2[91] = dealloc_no_0[91] && !(|dealloc_no_0[90:0]);
assign dealloc2[92] = dealloc_no_0[92] && !(|dealloc_no_0[91:0]);
assign dealloc2[93] = dealloc_no_0[93] && !(|dealloc_no_0[92:0]);
assign dealloc2[94] = dealloc_no_0[94] && !(|dealloc_no_0[93:0]);
assign dealloc2[95] = dealloc_no_0[95] && !(|dealloc_no_0[94:0]);

////one-hot dealloc preg 3,
////remove dealloc preg 1, and then search priority is from p95 to p0
//assign dealloc_no_1[95:0] = dealloc[95:0] & ~dealloc1[95:0];
//
//assign dealloc3[0]  = dealloc_no_1[0]  && !(|dealloc_no_1[95:1]);
//assign dealloc3[1]  = dealloc_no_1[1]  && !(|dealloc_no_1[95:2]);
//assign dealloc3[2]  = dealloc_no_1[2]  && !(|dealloc_no_1[95:3]);
//assign dealloc3[3]  = dealloc_no_1[3]  && !(|dealloc_no_1[95:4]);
//assign dealloc3[4]  = dealloc_no_1[4]  && !(|dealloc_no_1[95:5]);
//assign dealloc3[5]  = dealloc_no_1[5]  && !(|dealloc_no_1[95:6]);
//assign dealloc3[6]  = dealloc_no_1[6]  && !(|dealloc_no_1[95:7]);
//assign dealloc3[7]  = dealloc_no_1[7]  && !(|dealloc_no_1[95:8]);
//assign dealloc3[8]  = dealloc_no_1[8]  && !(|dealloc_no_1[95:9]);
//assign dealloc3[9]  = dealloc_no_1[9]  && !(|dealloc_no_1[95:10]);
//assign dealloc3[10] = dealloc_no_1[10] && !(|dealloc_no_1[95:11]);
//assign dealloc3[11] = dealloc_no_1[11] && !(|dealloc_no_1[95:12]);
//assign dealloc3[12] = dealloc_no_1[12] && !(|dealloc_no_1[95:13]);
//assign dealloc3[13] = dealloc_no_1[13] && !(|dealloc_no_1[95:14]);
//assign dealloc3[14] = dealloc_no_1[14] && !(|dealloc_no_1[95:15]);
//assign dealloc3[15] = dealloc_no_1[15] && !(|dealloc_no_1[95:16]);
//assign dealloc3[16] = dealloc_no_1[16] && !(|dealloc_no_1[95:17]);
//assign dealloc3[17] = dealloc_no_1[17] && !(|dealloc_no_1[95:18]);
//assign dealloc3[18] = dealloc_no_1[18] && !(|dealloc_no_1[95:19]);
//assign dealloc3[19] = dealloc_no_1[19] && !(|dealloc_no_1[95:20]);
//assign dealloc3[20] = dealloc_no_1[20] && !(|dealloc_no_1[95:21]);
//assign dealloc3[21] = dealloc_no_1[21] && !(|dealloc_no_1[95:22]);
//assign dealloc3[22] = dealloc_no_1[22] && !(|dealloc_no_1[95:23]);
//assign dealloc3[23] = dealloc_no_1[23] && !(|dealloc_no_1[95:24]);
//assign dealloc3[24] = dealloc_no_1[24] && !(|dealloc_no_1[95:25]);
//assign dealloc3[25] = dealloc_no_1[25] && !(|dealloc_no_1[95:26]);
//assign dealloc3[26] = dealloc_no_1[26] && !(|dealloc_no_1[95:27]);
//assign dealloc3[27] = dealloc_no_1[27] && !(|dealloc_no_1[95:28]);
//assign dealloc3[28] = dealloc_no_1[28] && !(|dealloc_no_1[95:29]);
//assign dealloc3[29] = dealloc_no_1[29] && !(|dealloc_no_1[95:30]);
//assign dealloc3[30] = dealloc_no_1[30] && !(|dealloc_no_1[95:31]);
//assign dealloc3[31] = dealloc_no_1[31] && !(|dealloc_no_1[95:32]);
//assign dealloc3[32] = dealloc_no_1[32] && !(|dealloc_no_1[95:33]);
//assign dealloc3[33] = dealloc_no_1[33] && !(|dealloc_no_1[95:34]);
//assign dealloc3[34] = dealloc_no_1[34] && !(|dealloc_no_1[95:35]);
//assign dealloc3[35] = dealloc_no_1[35] && !(|dealloc_no_1[95:36]);
//assign dealloc3[36] = dealloc_no_1[36] && !(|dealloc_no_1[95:37]);
//assign dealloc3[37] = dealloc_no_1[37] && !(|dealloc_no_1[95:38]);
//assign dealloc3[38] = dealloc_no_1[38] && !(|dealloc_no_1[95:39]);
//assign dealloc3[39] = dealloc_no_1[39] && !(|dealloc_no_1[95:40]);
//assign dealloc3[40] = dealloc_no_1[40] && !(|dealloc_no_1[95:41]);
//assign dealloc3[41] = dealloc_no_1[41] && !(|dealloc_no_1[95:42]);
//assign dealloc3[42] = dealloc_no_1[42] && !(|dealloc_no_1[95:43]);
//assign dealloc3[43] = dealloc_no_1[43] && !(|dealloc_no_1[95:44]);
//assign dealloc3[44] = dealloc_no_1[44] && !(|dealloc_no_1[95:45]);
//assign dealloc3[45] = dealloc_no_1[45] && !(|dealloc_no_1[95:46]);
//assign dealloc3[46] = dealloc_no_1[46] && !(|dealloc_no_1[95:47]);
//assign dealloc3[47] = dealloc_no_1[47] && !(|dealloc_no_1[95:48]);
//assign dealloc3[48] = dealloc_no_1[48] && !(|dealloc_no_1[95:49]);
//assign dealloc3[49] = dealloc_no_1[49] && !(|dealloc_no_1[95:50]);
//assign dealloc3[50] = dealloc_no_1[50] && !(|dealloc_no_1[95:51]);
//assign dealloc3[51] = dealloc_no_1[51] && !(|dealloc_no_1[95:52]);
//assign dealloc3[52] = dealloc_no_1[52] && !(|dealloc_no_1[95:53]);
//assign dealloc3[53] = dealloc_no_1[53] && !(|dealloc_no_1[95:54]);
//assign dealloc3[54] = dealloc_no_1[54] && !(|dealloc_no_1[95:55]);
//assign dealloc3[55] = dealloc_no_1[55] && !(|dealloc_no_1[95:56]);
//assign dealloc3[56] = dealloc_no_1[56] && !(|dealloc_no_1[95:57]);
//assign dealloc3[57] = dealloc_no_1[57] && !(|dealloc_no_1[95:58]);
//assign dealloc3[58] = dealloc_no_1[58] && !(|dealloc_no_1[95:59]);
//assign dealloc3[59] = dealloc_no_1[59] && !(|dealloc_no_1[95:60]);
//assign dealloc3[60] = dealloc_no_1[60] && !(|dealloc_no_1[95:61]);
//assign dealloc3[61] = dealloc_no_1[61] && !(|dealloc_no_1[95:62]);
//assign dealloc3[62] = dealloc_no_1[62] && !(|dealloc_no_1[95:63]);
//assign dealloc3[63] = dealloc_no_1[63] && !(|dealloc_no_1[95:64]);
//assign dealloc3[64] = dealloc_no_1[64] && !(|dealloc_no_1[95:65]);
//assign dealloc3[65] = dealloc_no_1[65] && !(|dealloc_no_1[95:66]);
//assign dealloc3[66] = dealloc_no_1[66] && !(|dealloc_no_1[95:67]);
//assign dealloc3[67] = dealloc_no_1[67] && !(|dealloc_no_1[95:68]);
//assign dealloc3[68] = dealloc_no_1[68] && !(|dealloc_no_1[95:69]);
//assign dealloc3[69] = dealloc_no_1[69] && !(|dealloc_no_1[95:70]);
//assign dealloc3[70] = dealloc_no_1[70] && !(|dealloc_no_1[95:71]);
//assign dealloc3[71] = dealloc_no_1[71] && !(|dealloc_no_1[95:72]);
//assign dealloc3[72] = dealloc_no_1[72] && !(|dealloc_no_1[95:73]);
//assign dealloc3[73] = dealloc_no_1[73] && !(|dealloc_no_1[95:74]);
//assign dealloc3[74] = dealloc_no_1[74] && !(|dealloc_no_1[95:75]);
//assign dealloc3[75] = dealloc_no_1[75] && !(|dealloc_no_1[95:76]);
//assign dealloc3[76] = dealloc_no_1[76] && !(|dealloc_no_1[95:77]);
//assign dealloc3[77] = dealloc_no_1[77] && !(|dealloc_no_1[95:78]);
//assign dealloc3[78] = dealloc_no_1[78] && !(|dealloc_no_1[95:79]);
//assign dealloc3[79] = dealloc_no_1[79] && !(|dealloc_no_1[95:80]);
//assign dealloc3[80] = dealloc_no_1[80] && !(|dealloc_no_1[95:81]);
//assign dealloc3[81] = dealloc_no_1[81] && !(|dealloc_no_1[95:82]);
//assign dealloc3[82] = dealloc_no_1[82] && !(|dealloc_no_1[95:83]);
//assign dealloc3[83] = dealloc_no_1[83] && !(|dealloc_no_1[95:84]);
//assign dealloc3[84] = dealloc_no_1[84] && !(|dealloc_no_1[95:85]);
//assign dealloc3[85] = dealloc_no_1[85] && !(|dealloc_no_1[95:86]);
//assign dealloc3[86] = dealloc_no_1[86] && !(|dealloc_no_1[95:87]);
//assign dealloc3[87] = dealloc_no_1[87] && !(|dealloc_no_1[95:88]);
//assign dealloc3[88] = dealloc_no_1[88] && !(|dealloc_no_1[95:89]);
//assign dealloc3[89] = dealloc_no_1[89] && !(|dealloc_no_1[95:90]);
//assign dealloc3[90] = dealloc_no_1[90] && !(|dealloc_no_1[95:91]);
//assign dealloc3[91] = dealloc_no_1[91] && !(|dealloc_no_1[95:92]);
//assign dealloc3[92] = dealloc_no_1[92] && !(|dealloc_no_1[95:93]);
//assign dealloc3[93] = dealloc_no_1[93] && !(|dealloc_no_1[95:94]);
//assign dealloc3[94] = dealloc_no_1[94] && !dealloc_no_1[95];
//assign dealloc3[95] = dealloc_no_1[95];

//----------------------------------------------------------
//                deallocate preg and valid
//----------------------------------------------------------
//deallocate preg valid
assign dealloc_preg0_vld = |dealloc[95:0];
assign dealloc_preg1_vld = |dealloc_no_0[95:0];
assign dealloc_preg2_vld = |(dealloc[95:0]
                             & ~dealloc0[95:0]
                             & ~dealloc1[95:0]);
//assign dealloc_preg3_vld = |(dealloc[95:0]
//                             & ~dealloc0[95:0]
//                             & ~dealloc1[95:0]
//                             & ~dealloc2[95:0]);
//dealloc_preg0/1/2/3
assign dealloc_preg0_expand[95:0] = dealloc0[95:0];
assign dealloc_preg1_expand[95:0] = dealloc1[95:0];
assign dealloc_preg2_expand[95:0] = dealloc2[95:0];
//assign dealloc_preg3_expand[95:0] = dealloc3[95:0];

// &ConnRule(s/^x_num/dealloc_preg0/); @1403
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_dealloc_preg0"); @1404
ct_rtu_encode_96  x_ct_rtu_encode_96_dealloc_preg0 (
  .x_num                (dealloc_preg0       ),
  .x_num_expand         (dealloc_preg0_expand)
);

// &ConnRule(s/^x_num/dealloc_preg1/); @1405
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_dealloc_preg1"); @1406
ct_rtu_encode_96  x_ct_rtu_encode_96_dealloc_preg1 (
  .x_num                (dealloc_preg1       ),
  .x_num_expand         (dealloc_preg1_expand)
);

// &ConnRule(s/^x_num/dealloc_preg2/); @1407
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_dealloc_preg2"); @1408
ct_rtu_encode_96  x_ct_rtu_encode_96_dealloc_preg2 (
  .x_num                (dealloc_preg2       ),
  .x_num_expand         (dealloc_preg2_expand)
);

// //&ConnRule(s/^x_num/dealloc_preg3/); @1409
//&Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_dealloc_preg3");

//preg3 reuse preg0~preg2 if any of them does not need dealloc
assign dealloc_preg3_vld = dealloc_preg0_vld
                           && !alloc_preg0_invalid
                        || dealloc_preg1_vld
                           && !alloc_preg1_invalid;

//----------------------------------------------------------
//                   deallocate signals
//----------------------------------------------------------
//deallocate vector without redundancy:
//if dealloc preg is same as others, the vector is all 0
assign dealloc0_vec[95:0] = dealloc0[95:0];
assign dealloc1_vec[95:0] = dealloc1[95:0] & ~dealloc0[95:0];
assign dealloc2_vec[95:0] = dealloc2[95:0] & ~dealloc1[95:0];
//assign dealloc3_vec[95:0] = dealloc3[95:0] & ~dealloc2[95:0] & ~dealloc0[95:0];

//alloc preg 0/1/2/3 will be allocated to ir inst 0/1/2/3
assign alloc_preg0_invalid = (!alloc_preg0_vld
                              || idu_rtu_ir_preg0_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_preg1_invalid = (!alloc_preg1_vld
                              || idu_rtu_ir_preg1_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_preg2_invalid = (!alloc_preg2_vld
                              || idu_rtu_ir_preg2_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_preg3_invalid = (!alloc_preg3_vld
                              || idu_rtu_ir_preg3_alloc_vld)
                             && !ifu_xx_sync_reset;

//preg3 reuse preg0~preg2 if any of them does not need dealloc
assign alloc_preg3_dealloc_vld = alloc_preg3_invalid
                                 && !(alloc_preg0_invalid
                                   && alloc_preg1_invalid);

// &CombBeg; @1447
always @( dealloc_preg1[6:0]
       or dealloc1_vec[95:0]
       or dealloc0_vec[95:0]
       or alloc_preg0_invalid
       or dealloc_preg0[6:0])
begin
  if(!alloc_preg0_invalid) begin
    dealloc3_vec[95:0] = dealloc0_vec[95:0];
    dealloc_preg3[6:0] = dealloc_preg0[6:0];
  end
  else begin
    dealloc3_vec[95:0] = dealloc1_vec[95:0];
    dealloc_preg3[6:0] = dealloc_preg1[6:0];
  end
// &CombEnd; @1456
end

assign dealloc_vld[95:0] = {96{alloc_preg0_invalid}} & dealloc0_vec[95:0]
                         | {96{alloc_preg1_invalid}} & dealloc1_vec[95:0]
                         | {96{alloc_preg2_invalid}} & dealloc2_vec[95:0]
                         | {96{alloc_preg3_dealloc_vld}} & dealloc3_vec[95:0];
//                         | {96{alloc_preg3_invalid}} & dealloc3_vec[95:0];

assign dealloc_vld_for_gateclk = !alloc_preg0_vld
                              || !alloc_preg1_vld
                              || !alloc_preg2_vld
                              || !alloc_preg3_vld
                              || idu_rtu_ir_preg_alloc_gateclk_vld;

//assign dealloc_gateclk_vld[95:0] = {96{dealloc_vld_for_gateclk}}
//                                   & (dealloc0[95:0]
//                                    | dealloc1[95:0]
//                                    | dealloc2[95:0]);
//                                    | dealloc2[95:0]
//                                    | dealloc3[95:0]);

assign preg0_dealloc_vld  = dealloc_vld[0];
assign preg1_dealloc_vld  = dealloc_vld[1];
assign preg2_dealloc_vld  = dealloc_vld[2];
assign preg3_dealloc_vld  = dealloc_vld[3];
assign preg4_dealloc_vld  = dealloc_vld[4];
assign preg5_dealloc_vld  = dealloc_vld[5];
assign preg6_dealloc_vld  = dealloc_vld[6];
assign preg7_dealloc_vld  = dealloc_vld[7];
assign preg8_dealloc_vld  = dealloc_vld[8];
assign preg9_dealloc_vld  = dealloc_vld[9];
assign preg10_dealloc_vld = dealloc_vld[10];
assign preg11_dealloc_vld = dealloc_vld[11];
assign preg12_dealloc_vld = dealloc_vld[12];
assign preg13_dealloc_vld = dealloc_vld[13];
assign preg14_dealloc_vld = dealloc_vld[14];
assign preg15_dealloc_vld = dealloc_vld[15];
assign preg16_dealloc_vld = dealloc_vld[16];
assign preg17_dealloc_vld = dealloc_vld[17];
assign preg18_dealloc_vld = dealloc_vld[18];
assign preg19_dealloc_vld = dealloc_vld[19];
assign preg20_dealloc_vld = dealloc_vld[20];
assign preg21_dealloc_vld = dealloc_vld[21];
assign preg22_dealloc_vld = dealloc_vld[22];
assign preg23_dealloc_vld = dealloc_vld[23];
assign preg24_dealloc_vld = dealloc_vld[24];
assign preg25_dealloc_vld = dealloc_vld[25];
assign preg26_dealloc_vld = dealloc_vld[26];
assign preg27_dealloc_vld = dealloc_vld[27];
assign preg28_dealloc_vld = dealloc_vld[28];
assign preg29_dealloc_vld = dealloc_vld[29];
assign preg30_dealloc_vld = dealloc_vld[30];
assign preg31_dealloc_vld = dealloc_vld[31];
assign preg32_dealloc_vld = dealloc_vld[32];
assign preg33_dealloc_vld = dealloc_vld[33];
assign preg34_dealloc_vld = dealloc_vld[34];
assign preg35_dealloc_vld = dealloc_vld[35];
assign preg36_dealloc_vld = dealloc_vld[36];
assign preg37_dealloc_vld = dealloc_vld[37];
assign preg38_dealloc_vld = dealloc_vld[38];
assign preg39_dealloc_vld = dealloc_vld[39];
assign preg40_dealloc_vld = dealloc_vld[40];
assign preg41_dealloc_vld = dealloc_vld[41];
assign preg42_dealloc_vld = dealloc_vld[42];
assign preg43_dealloc_vld = dealloc_vld[43];
assign preg44_dealloc_vld = dealloc_vld[44];
assign preg45_dealloc_vld = dealloc_vld[45];
assign preg46_dealloc_vld = dealloc_vld[46];
assign preg47_dealloc_vld = dealloc_vld[47];
assign preg48_dealloc_vld = dealloc_vld[48];
assign preg49_dealloc_vld = dealloc_vld[49];
assign preg50_dealloc_vld = dealloc_vld[50];
assign preg51_dealloc_vld = dealloc_vld[51];
assign preg52_dealloc_vld = dealloc_vld[52];
assign preg53_dealloc_vld = dealloc_vld[53];
assign preg54_dealloc_vld = dealloc_vld[54];
assign preg55_dealloc_vld = dealloc_vld[55];
assign preg56_dealloc_vld = dealloc_vld[56];
assign preg57_dealloc_vld = dealloc_vld[57];
assign preg58_dealloc_vld = dealloc_vld[58];
assign preg59_dealloc_vld = dealloc_vld[59];
assign preg60_dealloc_vld = dealloc_vld[60];
assign preg61_dealloc_vld = dealloc_vld[61];
assign preg62_dealloc_vld = dealloc_vld[62];
assign preg63_dealloc_vld = dealloc_vld[63];
assign preg64_dealloc_vld = dealloc_vld[64];
assign preg65_dealloc_vld = dealloc_vld[65];
assign preg66_dealloc_vld = dealloc_vld[66];
assign preg67_dealloc_vld = dealloc_vld[67];
assign preg68_dealloc_vld = dealloc_vld[68];
assign preg69_dealloc_vld = dealloc_vld[69];
assign preg70_dealloc_vld = dealloc_vld[70];
assign preg71_dealloc_vld = dealloc_vld[71];
assign preg72_dealloc_vld = dealloc_vld[72];
assign preg73_dealloc_vld = dealloc_vld[73];
assign preg74_dealloc_vld = dealloc_vld[74];
assign preg75_dealloc_vld = dealloc_vld[75];
assign preg76_dealloc_vld = dealloc_vld[76];
assign preg77_dealloc_vld = dealloc_vld[77];
assign preg78_dealloc_vld = dealloc_vld[78];
assign preg79_dealloc_vld = dealloc_vld[79];
assign preg80_dealloc_vld = dealloc_vld[80];
assign preg81_dealloc_vld = dealloc_vld[81];
assign preg82_dealloc_vld = dealloc_vld[82];
assign preg83_dealloc_vld = dealloc_vld[83];
assign preg84_dealloc_vld = dealloc_vld[84];
assign preg85_dealloc_vld = dealloc_vld[85];
assign preg86_dealloc_vld = dealloc_vld[86];
assign preg87_dealloc_vld = dealloc_vld[87];
assign preg88_dealloc_vld = dealloc_vld[88];
assign preg89_dealloc_vld = dealloc_vld[89];
assign preg90_dealloc_vld = dealloc_vld[90];
assign preg91_dealloc_vld = dealloc_vld[91];
assign preg92_dealloc_vld = dealloc_vld[92];
assign preg93_dealloc_vld = dealloc_vld[93];
assign preg94_dealloc_vld = dealloc_vld[94];
assign preg95_dealloc_vld = dealloc_vld[95];

//assign preg0_dealloc_gateclk_vld  = dealloc_gateclk_vld[0];
//assign preg1_dealloc_gateclk_vld  = dealloc_gateclk_vld[1];
//assign preg2_dealloc_gateclk_vld  = dealloc_gateclk_vld[2];
//assign preg3_dealloc_gateclk_vld  = dealloc_gateclk_vld[3];
//assign preg4_dealloc_gateclk_vld  = dealloc_gateclk_vld[4];
//assign preg5_dealloc_gateclk_vld  = dealloc_gateclk_vld[5];
//assign preg6_dealloc_gateclk_vld  = dealloc_gateclk_vld[6];
//assign preg7_dealloc_gateclk_vld  = dealloc_gateclk_vld[7];
//assign preg8_dealloc_gateclk_vld  = dealloc_gateclk_vld[8];
//assign preg9_dealloc_gateclk_vld  = dealloc_gateclk_vld[9];
//assign preg10_dealloc_gateclk_vld = dealloc_gateclk_vld[10];
//assign preg11_dealloc_gateclk_vld = dealloc_gateclk_vld[11];
//assign preg12_dealloc_gateclk_vld = dealloc_gateclk_vld[12];
//assign preg13_dealloc_gateclk_vld = dealloc_gateclk_vld[13];
//assign preg14_dealloc_gateclk_vld = dealloc_gateclk_vld[14];
//assign preg15_dealloc_gateclk_vld = dealloc_gateclk_vld[15];
//assign preg16_dealloc_gateclk_vld = dealloc_gateclk_vld[16];
//assign preg17_dealloc_gateclk_vld = dealloc_gateclk_vld[17];
//assign preg18_dealloc_gateclk_vld = dealloc_gateclk_vld[18];
//assign preg19_dealloc_gateclk_vld = dealloc_gateclk_vld[19];
//assign preg20_dealloc_gateclk_vld = dealloc_gateclk_vld[20];
//assign preg21_dealloc_gateclk_vld = dealloc_gateclk_vld[21];
//assign preg22_dealloc_gateclk_vld = dealloc_gateclk_vld[22];
//assign preg23_dealloc_gateclk_vld = dealloc_gateclk_vld[23];
//assign preg24_dealloc_gateclk_vld = dealloc_gateclk_vld[24];
//assign preg25_dealloc_gateclk_vld = dealloc_gateclk_vld[25];
//assign preg26_dealloc_gateclk_vld = dealloc_gateclk_vld[26];
//assign preg27_dealloc_gateclk_vld = dealloc_gateclk_vld[27];
//assign preg28_dealloc_gateclk_vld = dealloc_gateclk_vld[28];
//assign preg29_dealloc_gateclk_vld = dealloc_gateclk_vld[29];
//assign preg30_dealloc_gateclk_vld = dealloc_gateclk_vld[30];
//assign preg31_dealloc_gateclk_vld = dealloc_gateclk_vld[31];
//assign preg32_dealloc_gateclk_vld = dealloc_gateclk_vld[32];
//assign preg33_dealloc_gateclk_vld = dealloc_gateclk_vld[33];
//assign preg34_dealloc_gateclk_vld = dealloc_gateclk_vld[34];
//assign preg35_dealloc_gateclk_vld = dealloc_gateclk_vld[35];
//assign preg36_dealloc_gateclk_vld = dealloc_gateclk_vld[36];
//assign preg37_dealloc_gateclk_vld = dealloc_gateclk_vld[37];
//assign preg38_dealloc_gateclk_vld = dealloc_gateclk_vld[38];
//assign preg39_dealloc_gateclk_vld = dealloc_gateclk_vld[39];
//assign preg40_dealloc_gateclk_vld = dealloc_gateclk_vld[40];
//assign preg41_dealloc_gateclk_vld = dealloc_gateclk_vld[41];
//assign preg42_dealloc_gateclk_vld = dealloc_gateclk_vld[42];
//assign preg43_dealloc_gateclk_vld = dealloc_gateclk_vld[43];
//assign preg44_dealloc_gateclk_vld = dealloc_gateclk_vld[44];
//assign preg45_dealloc_gateclk_vld = dealloc_gateclk_vld[45];
//assign preg46_dealloc_gateclk_vld = dealloc_gateclk_vld[46];
//assign preg47_dealloc_gateclk_vld = dealloc_gateclk_vld[47];
//assign preg48_dealloc_gateclk_vld = dealloc_gateclk_vld[48];
//assign preg49_dealloc_gateclk_vld = dealloc_gateclk_vld[49];
//assign preg50_dealloc_gateclk_vld = dealloc_gateclk_vld[50];
//assign preg51_dealloc_gateclk_vld = dealloc_gateclk_vld[51];
//assign preg52_dealloc_gateclk_vld = dealloc_gateclk_vld[52];
//assign preg53_dealloc_gateclk_vld = dealloc_gateclk_vld[53];
//assign preg54_dealloc_gateclk_vld = dealloc_gateclk_vld[54];
//assign preg55_dealloc_gateclk_vld = dealloc_gateclk_vld[55];
//assign preg56_dealloc_gateclk_vld = dealloc_gateclk_vld[56];
//assign preg57_dealloc_gateclk_vld = dealloc_gateclk_vld[57];
//assign preg58_dealloc_gateclk_vld = dealloc_gateclk_vld[58];
//assign preg59_dealloc_gateclk_vld = dealloc_gateclk_vld[59];
//assign preg60_dealloc_gateclk_vld = dealloc_gateclk_vld[60];
//assign preg61_dealloc_gateclk_vld = dealloc_gateclk_vld[61];
//assign preg62_dealloc_gateclk_vld = dealloc_gateclk_vld[62];
//assign preg63_dealloc_gateclk_vld = dealloc_gateclk_vld[63];
//assign preg64_dealloc_gateclk_vld = dealloc_gateclk_vld[64];
//assign preg65_dealloc_gateclk_vld = dealloc_gateclk_vld[65];
//assign preg66_dealloc_gateclk_vld = dealloc_gateclk_vld[66];
//assign preg67_dealloc_gateclk_vld = dealloc_gateclk_vld[67];
//assign preg68_dealloc_gateclk_vld = dealloc_gateclk_vld[68];
//assign preg69_dealloc_gateclk_vld = dealloc_gateclk_vld[69];
//assign preg70_dealloc_gateclk_vld = dealloc_gateclk_vld[70];
//assign preg71_dealloc_gateclk_vld = dealloc_gateclk_vld[71];
//assign preg72_dealloc_gateclk_vld = dealloc_gateclk_vld[72];
//assign preg73_dealloc_gateclk_vld = dealloc_gateclk_vld[73];
//assign preg74_dealloc_gateclk_vld = dealloc_gateclk_vld[74];
//assign preg75_dealloc_gateclk_vld = dealloc_gateclk_vld[75];
//assign preg76_dealloc_gateclk_vld = dealloc_gateclk_vld[76];
//assign preg77_dealloc_gateclk_vld = dealloc_gateclk_vld[77];
//assign preg78_dealloc_gateclk_vld = dealloc_gateclk_vld[78];
//assign preg79_dealloc_gateclk_vld = dealloc_gateclk_vld[79];
//assign preg80_dealloc_gateclk_vld = dealloc_gateclk_vld[80];
//assign preg81_dealloc_gateclk_vld = dealloc_gateclk_vld[81];
//assign preg82_dealloc_gateclk_vld = dealloc_gateclk_vld[82];
//assign preg83_dealloc_gateclk_vld = dealloc_gateclk_vld[83];
//assign preg84_dealloc_gateclk_vld = dealloc_gateclk_vld[84];
//assign preg85_dealloc_gateclk_vld = dealloc_gateclk_vld[85];
//assign preg86_dealloc_gateclk_vld = dealloc_gateclk_vld[86];
//assign preg87_dealloc_gateclk_vld = dealloc_gateclk_vld[87];
//assign preg88_dealloc_gateclk_vld = dealloc_gateclk_vld[88];
//assign preg89_dealloc_gateclk_vld = dealloc_gateclk_vld[89];
//assign preg90_dealloc_gateclk_vld = dealloc_gateclk_vld[90];
//assign preg91_dealloc_gateclk_vld = dealloc_gateclk_vld[91];
//assign preg92_dealloc_gateclk_vld = dealloc_gateclk_vld[92];
//assign preg93_dealloc_gateclk_vld = dealloc_gateclk_vld[93];
//assign preg94_dealloc_gateclk_vld = dealloc_gateclk_vld[94];
//assign preg95_dealloc_gateclk_vld = dealloc_gateclk_vld[95];

assign preg0_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[0];
assign preg1_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[1];
assign preg2_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[2];
assign preg3_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[3];
assign preg4_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[4];
assign preg5_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[5];
assign preg6_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[6];
assign preg7_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[7];
assign preg8_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[8];
assign preg9_dealloc_mask  = idu_rtu_pst_preg_dealloc_mask[9];
assign preg10_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[10];
assign preg11_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[11];
assign preg12_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[12];
assign preg13_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[13];
assign preg14_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[14];
assign preg15_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[15];
assign preg16_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[16];
assign preg17_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[17];
assign preg18_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[18];
assign preg19_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[19];
assign preg20_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[20];
assign preg21_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[21];
assign preg22_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[22];
assign preg23_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[23];
assign preg24_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[24];
assign preg25_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[25];
assign preg26_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[26];
assign preg27_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[27];
assign preg28_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[28];
assign preg29_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[29];
assign preg30_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[30];
assign preg31_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[31];
assign preg32_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[32];
assign preg33_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[33];
assign preg34_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[34];
assign preg35_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[35];
assign preg36_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[36];
assign preg37_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[37];
assign preg38_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[38];
assign preg39_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[39];
assign preg40_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[40];
assign preg41_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[41];
assign preg42_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[42];
assign preg43_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[43];
assign preg44_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[44];
assign preg45_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[45];
assign preg46_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[46];
assign preg47_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[47];
assign preg48_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[48];
assign preg49_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[49];
assign preg50_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[50];
assign preg51_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[51];
assign preg52_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[52];
assign preg53_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[53];
assign preg54_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[54];
assign preg55_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[55];
assign preg56_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[56];
assign preg57_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[57];
assign preg58_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[58];
assign preg59_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[59];
assign preg60_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[60];
assign preg61_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[61];
assign preg62_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[62];
assign preg63_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[63];
assign preg64_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[64];
assign preg65_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[65];
assign preg66_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[66];
assign preg67_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[67];
assign preg68_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[68];
assign preg69_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[69];
assign preg70_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[70];
assign preg71_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[71];
assign preg72_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[72];
assign preg73_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[73];
assign preg74_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[74];
assign preg75_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[75];
assign preg76_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[76];
assign preg77_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[77];
assign preg78_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[78];
assign preg79_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[79];
assign preg80_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[80];
assign preg81_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[81];
assign preg82_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[82];
assign preg83_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[83];
assign preg84_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[84];
assign preg85_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[85];
assign preg86_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[86];
assign preg87_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[87];
assign preg88_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[88];
assign preg89_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[89];
assign preg90_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[90];
assign preg91_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[91];
assign preg92_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[92];
assign preg93_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[93];
assign preg94_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[94];
assign preg95_dealloc_mask = idu_rtu_pst_preg_dealloc_mask[95];

//==========================================================
//                  Allocate Preg Registers
//==========================================================

//----------------------------------------------------------
//                  Instance of Gated Cell
//----------------------------------------------------------
assign alloc_preg_clk_en = rtu_yy_xx_flush
                        || !alloc_preg0_vld
                        || !alloc_preg1_vld
                        || !alloc_preg2_vld
                        || !alloc_preg3_vld
                        || idu_rtu_ir_preg0_alloc_vld
                        || idu_rtu_ir_preg1_alloc_vld
                        || idu_rtu_ir_preg2_alloc_vld
                        || idu_rtu_ir_preg3_alloc_vld;
// &Instance("gated_clk_cell", "x_alloc_preg_gated_clk"); @1784
gated_clk_cell  x_alloc_preg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (alloc_preg_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (alloc_preg_clk_en ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1785
//          .external_en (1'b0), @1786
//          .global_en   (cp0_yy_clk_en), @1787
//          .module_en   (cp0_rtu_icg_en), @1788
//          .local_en    (alloc_preg_clk_en), @1789
//          .clk_out     (alloc_preg_clk)); @1790

//----------------------------------------------------------
//                Instance of alloc registers
//----------------------------------------------------------
always @(posedge alloc_preg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_preg0_vld  <= 1'd0;
    alloc_preg0[6:0] <= 7'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_preg0_vld  <= 1'd0;
    alloc_preg0[6:0] <= 7'd0;
  end
  else if(alloc_preg0_invalid) begin
    alloc_preg0_vld  <= dealloc_preg0_vld;
    alloc_preg0[6:0] <= dealloc_preg0[6:0];
  end
  else begin
    alloc_preg0_vld  <= alloc_preg0_vld;
    alloc_preg0[6:0] <= alloc_preg0[6:0];
  end
end

always @(posedge alloc_preg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_preg1_vld  <= 1'd0;
    alloc_preg1[6:0] <= 7'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_preg1_vld  <= 1'd0;
    alloc_preg1[6:0] <= 7'd0;
  end
  else if(alloc_preg1_invalid) begin
    alloc_preg1_vld  <= dealloc_preg1_vld;
    alloc_preg1[6:0] <= dealloc_preg1[6:0];
  end
  else begin
    alloc_preg1_vld  <= alloc_preg1_vld;
    alloc_preg1[6:0] <= alloc_preg1[6:0];
  end
end

always @(posedge alloc_preg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_preg2_vld  <= 1'd0;
    alloc_preg2[6:0] <= 7'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_preg2_vld  <= 1'd0;
    alloc_preg2[6:0] <= 7'd0;
  end
  else if(alloc_preg2_invalid) begin
    alloc_preg2_vld  <= dealloc_preg2_vld;
    alloc_preg2[6:0] <= dealloc_preg2[6:0];
  end
  else begin
    alloc_preg2_vld  <= alloc_preg2_vld;
    alloc_preg2[6:0] <= alloc_preg2[6:0];
  end
end

always @(posedge alloc_preg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_preg3_vld  <= 1'd0;
    alloc_preg3[6:0] <= 7'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_preg3_vld  <= 1'd0;
    alloc_preg3[6:0] <= 7'd0;
  end
  else if(alloc_preg3_invalid) begin
    alloc_preg3_vld  <= dealloc_preg3_vld;
    alloc_preg3[6:0] <= dealloc_preg3[6:0];
  end
  else begin
    alloc_preg3_vld  <= alloc_preg3_vld;
    alloc_preg3[6:0] <= alloc_preg3[6:0];
  end
end

//rename for output
//alloc preg 0/1/2/3 will be allocated to ir inst 0/1/2/3
assign rtu_idu_alloc_preg0_vld  = alloc_preg0_vld;
assign rtu_idu_alloc_preg1_vld  = alloc_preg1_vld;
assign rtu_idu_alloc_preg2_vld  = alloc_preg2_vld;
assign rtu_idu_alloc_preg3_vld  = alloc_preg3_vld;
assign rtu_idu_alloc_preg0[6:0] = alloc_preg0[6:0];
assign rtu_idu_alloc_preg1[6:0] = alloc_preg1[6:0];
assign rtu_idu_alloc_preg2[6:0] = alloc_preg2[6:0];
assign rtu_idu_alloc_preg3[6:0] = alloc_preg3[6:0];

//==========================================================
//          Fast Retired Instruction Write Back
//==========================================================
assign pst_retired_preg_wb        = &retired_released_wb[95:0];

assign pst_retired_reg_wb         = pst_retired_preg_wb
                                    && pst_retired_vreg_wb
                                    && pst_retired_freg_wb
                                    && pst_retired_ereg_wb;
assign pst_top_retired_reg_wb[0]  = pst_retired_preg_wb;
assign pst_top_retired_reg_wb[1]  = pst_retired_vreg_wb || pst_retired_freg_wb;
assign pst_top_retired_reg_wb[2]  = pst_retired_ereg_wb;

assign pst_retire_retired_reg_wb  = pst_retired_reg_wb;
assign rtu_idu_pst_empty          = pst_retired_reg_wb;
assign rtu_had_inst_not_wb        = !pst_retired_reg_wb;

assign retired_released_wb[0]  = preg0_retired_released_wb;
assign retired_released_wb[1]  = preg1_retired_released_wb;
assign retired_released_wb[2]  = preg2_retired_released_wb;
assign retired_released_wb[3]  = preg3_retired_released_wb;
assign retired_released_wb[4]  = preg4_retired_released_wb;
assign retired_released_wb[5]  = preg5_retired_released_wb;
assign retired_released_wb[6]  = preg6_retired_released_wb;
assign retired_released_wb[7]  = preg7_retired_released_wb;
assign retired_released_wb[8]  = preg8_retired_released_wb;
assign retired_released_wb[9]  = preg9_retired_released_wb;
assign retired_released_wb[10] = preg10_retired_released_wb;
assign retired_released_wb[11] = preg11_retired_released_wb;
assign retired_released_wb[12] = preg12_retired_released_wb;
assign retired_released_wb[13] = preg13_retired_released_wb;
assign retired_released_wb[14] = preg14_retired_released_wb;
assign retired_released_wb[15] = preg15_retired_released_wb;
assign retired_released_wb[16] = preg16_retired_released_wb;
assign retired_released_wb[17] = preg17_retired_released_wb;
assign retired_released_wb[18] = preg18_retired_released_wb;
assign retired_released_wb[19] = preg19_retired_released_wb;
assign retired_released_wb[20] = preg20_retired_released_wb;
assign retired_released_wb[21] = preg21_retired_released_wb;
assign retired_released_wb[22] = preg22_retired_released_wb;
assign retired_released_wb[23] = preg23_retired_released_wb;
assign retired_released_wb[24] = preg24_retired_released_wb;
assign retired_released_wb[25] = preg25_retired_released_wb;
assign retired_released_wb[26] = preg26_retired_released_wb;
assign retired_released_wb[27] = preg27_retired_released_wb;
assign retired_released_wb[28] = preg28_retired_released_wb;
assign retired_released_wb[29] = preg29_retired_released_wb;
assign retired_released_wb[30] = preg30_retired_released_wb;
assign retired_released_wb[31] = preg31_retired_released_wb;
assign retired_released_wb[32] = preg32_retired_released_wb;
assign retired_released_wb[33] = preg33_retired_released_wb;
assign retired_released_wb[34] = preg34_retired_released_wb;
assign retired_released_wb[35] = preg35_retired_released_wb;
assign retired_released_wb[36] = preg36_retired_released_wb;
assign retired_released_wb[37] = preg37_retired_released_wb;
assign retired_released_wb[38] = preg38_retired_released_wb;
assign retired_released_wb[39] = preg39_retired_released_wb;
assign retired_released_wb[40] = preg40_retired_released_wb;
assign retired_released_wb[41] = preg41_retired_released_wb;
assign retired_released_wb[42] = preg42_retired_released_wb;
assign retired_released_wb[43] = preg43_retired_released_wb;
assign retired_released_wb[44] = preg44_retired_released_wb;
assign retired_released_wb[45] = preg45_retired_released_wb;
assign retired_released_wb[46] = preg46_retired_released_wb;
assign retired_released_wb[47] = preg47_retired_released_wb;
assign retired_released_wb[48] = preg48_retired_released_wb;
assign retired_released_wb[49] = preg49_retired_released_wb;
assign retired_released_wb[50] = preg50_retired_released_wb;
assign retired_released_wb[51] = preg51_retired_released_wb;
assign retired_released_wb[52] = preg52_retired_released_wb;
assign retired_released_wb[53] = preg53_retired_released_wb;
assign retired_released_wb[54] = preg54_retired_released_wb;
assign retired_released_wb[55] = preg55_retired_released_wb;
assign retired_released_wb[56] = preg56_retired_released_wb;
assign retired_released_wb[57] = preg57_retired_released_wb;
assign retired_released_wb[58] = preg58_retired_released_wb;
assign retired_released_wb[59] = preg59_retired_released_wb;
assign retired_released_wb[60] = preg60_retired_released_wb;
assign retired_released_wb[61] = preg61_retired_released_wb;
assign retired_released_wb[62] = preg62_retired_released_wb;
assign retired_released_wb[63] = preg63_retired_released_wb;
assign retired_released_wb[64] = preg64_retired_released_wb;
assign retired_released_wb[65] = preg65_retired_released_wb;
assign retired_released_wb[66] = preg66_retired_released_wb;
assign retired_released_wb[67] = preg67_retired_released_wb;
assign retired_released_wb[68] = preg68_retired_released_wb;
assign retired_released_wb[69] = preg69_retired_released_wb;
assign retired_released_wb[70] = preg70_retired_released_wb;
assign retired_released_wb[71] = preg71_retired_released_wb;
assign retired_released_wb[72] = preg72_retired_released_wb;
assign retired_released_wb[73] = preg73_retired_released_wb;
assign retired_released_wb[74] = preg74_retired_released_wb;
assign retired_released_wb[75] = preg75_retired_released_wb;
assign retired_released_wb[76] = preg76_retired_released_wb;
assign retired_released_wb[77] = preg77_retired_released_wb;
assign retired_released_wb[78] = preg78_retired_released_wb;
assign retired_released_wb[79] = preg79_retired_released_wb;
assign retired_released_wb[80] = preg80_retired_released_wb;
assign retired_released_wb[81] = preg81_retired_released_wb;
assign retired_released_wb[82] = preg82_retired_released_wb;
assign retired_released_wb[83] = preg83_retired_released_wb;
assign retired_released_wb[84] = preg84_retired_released_wb;
assign retired_released_wb[85] = preg85_retired_released_wb;
assign retired_released_wb[86] = preg86_retired_released_wb;
assign retired_released_wb[87] = preg87_retired_released_wb;
assign retired_released_wb[88] = preg88_retired_released_wb;
assign retired_released_wb[89] = preg89_retired_released_wb;
assign retired_released_wb[90] = preg90_retired_released_wb;
assign retired_released_wb[91] = preg91_retired_released_wb;
assign retired_released_wb[92] = preg92_retired_released_wb;
assign retired_released_wb[93] = preg93_retired_released_wb;
assign retired_released_wb[94] = preg94_retired_released_wb;
assign retired_released_wb[95] = preg95_retired_released_wb;

//==========================================================
//                  Recovery Rename Table
//==========================================================
//the preg_x_dreg[31:0] indicates preg-reg mapping of retired entry.
//rename table is reg indexed, while pst is preg indexed.
//transpose the mappings from preg index to reg index.
assign r0_preg_expand[95:0] = {
  preg95_dreg[0],preg94_dreg[0],preg93_dreg[0],preg92_dreg[0],
  preg91_dreg[0],preg90_dreg[0],preg89_dreg[0],preg88_dreg[0],
  preg87_dreg[0],preg86_dreg[0],preg85_dreg[0],preg84_dreg[0],
  preg83_dreg[0],preg82_dreg[0],preg81_dreg[0],preg80_dreg[0],
  preg79_dreg[0],preg78_dreg[0],preg77_dreg[0],preg76_dreg[0],
  preg75_dreg[0],preg74_dreg[0],preg73_dreg[0],preg72_dreg[0],
  preg71_dreg[0],preg70_dreg[0],preg69_dreg[0],preg68_dreg[0],
  preg67_dreg[0],preg66_dreg[0],preg65_dreg[0],preg64_dreg[0],
  preg63_dreg[0],preg62_dreg[0],preg61_dreg[0],preg60_dreg[0],
  preg59_dreg[0],preg58_dreg[0],preg57_dreg[0],preg56_dreg[0],
  preg55_dreg[0],preg54_dreg[0],preg53_dreg[0],preg52_dreg[0],
  preg51_dreg[0],preg50_dreg[0],preg49_dreg[0],preg48_dreg[0],
  preg47_dreg[0],preg46_dreg[0],preg45_dreg[0],preg44_dreg[0],
  preg43_dreg[0],preg42_dreg[0],preg41_dreg[0],preg40_dreg[0],
  preg39_dreg[0],preg38_dreg[0],preg37_dreg[0],preg36_dreg[0],
  preg35_dreg[0],preg34_dreg[0],preg33_dreg[0],preg32_dreg[0],
  preg31_dreg[0],preg30_dreg[0],preg29_dreg[0],preg28_dreg[0],
  preg27_dreg[0],preg26_dreg[0],preg25_dreg[0],preg24_dreg[0],
  preg23_dreg[0],preg22_dreg[0],preg21_dreg[0],preg20_dreg[0],
  preg19_dreg[0],preg18_dreg[0],preg17_dreg[0],preg16_dreg[0],
  preg15_dreg[0],preg14_dreg[0],preg13_dreg[0],preg12_dreg[0],
  preg11_dreg[0],preg10_dreg[0],preg9_dreg[0] ,preg8_dreg[0],
  preg7_dreg[0] ,preg6_dreg[0] ,preg5_dreg[0] ,preg4_dreg[0],
  preg3_dreg[0] ,preg2_dreg[0] ,preg1_dreg[0] ,preg0_dreg[0]};
assign r1_preg_expand[95:0] = {
  preg95_dreg[1],preg94_dreg[1],preg93_dreg[1],preg92_dreg[1],
  preg91_dreg[1],preg90_dreg[1],preg89_dreg[1],preg88_dreg[1],
  preg87_dreg[1],preg86_dreg[1],preg85_dreg[1],preg84_dreg[1],
  preg83_dreg[1],preg82_dreg[1],preg81_dreg[1],preg80_dreg[1],
  preg79_dreg[1],preg78_dreg[1],preg77_dreg[1],preg76_dreg[1],
  preg75_dreg[1],preg74_dreg[1],preg73_dreg[1],preg72_dreg[1],
  preg71_dreg[1],preg70_dreg[1],preg69_dreg[1],preg68_dreg[1],
  preg67_dreg[1],preg66_dreg[1],preg65_dreg[1],preg64_dreg[1],
  preg63_dreg[1],preg62_dreg[1],preg61_dreg[1],preg60_dreg[1],
  preg59_dreg[1],preg58_dreg[1],preg57_dreg[1],preg56_dreg[1],
  preg55_dreg[1],preg54_dreg[1],preg53_dreg[1],preg52_dreg[1],
  preg51_dreg[1],preg50_dreg[1],preg49_dreg[1],preg48_dreg[1],
  preg47_dreg[1],preg46_dreg[1],preg45_dreg[1],preg44_dreg[1],
  preg43_dreg[1],preg42_dreg[1],preg41_dreg[1],preg40_dreg[1],
  preg39_dreg[1],preg38_dreg[1],preg37_dreg[1],preg36_dreg[1],
  preg35_dreg[1],preg34_dreg[1],preg33_dreg[1],preg32_dreg[1],
  preg31_dreg[1],preg30_dreg[1],preg29_dreg[1],preg28_dreg[1],
  preg27_dreg[1],preg26_dreg[1],preg25_dreg[1],preg24_dreg[1],
  preg23_dreg[1],preg22_dreg[1],preg21_dreg[1],preg20_dreg[1],
  preg19_dreg[1],preg18_dreg[1],preg17_dreg[1],preg16_dreg[1],
  preg15_dreg[1],preg14_dreg[1],preg13_dreg[1],preg12_dreg[1],
  preg11_dreg[1],preg10_dreg[1],preg9_dreg[1] ,preg8_dreg[1],
  preg7_dreg[1] ,preg6_dreg[1] ,preg5_dreg[1] ,preg4_dreg[1],
  preg3_dreg[1] ,preg2_dreg[1] ,preg1_dreg[1] ,preg0_dreg[1]};
assign r2_preg_expand[95:0] = {
  preg95_dreg[2],preg94_dreg[2],preg93_dreg[2],preg92_dreg[2],
  preg91_dreg[2],preg90_dreg[2],preg89_dreg[2],preg88_dreg[2],
  preg87_dreg[2],preg86_dreg[2],preg85_dreg[2],preg84_dreg[2],
  preg83_dreg[2],preg82_dreg[2],preg81_dreg[2],preg80_dreg[2],
  preg79_dreg[2],preg78_dreg[2],preg77_dreg[2],preg76_dreg[2],
  preg75_dreg[2],preg74_dreg[2],preg73_dreg[2],preg72_dreg[2],
  preg71_dreg[2],preg70_dreg[2],preg69_dreg[2],preg68_dreg[2],
  preg67_dreg[2],preg66_dreg[2],preg65_dreg[2],preg64_dreg[2],
  preg63_dreg[2],preg62_dreg[2],preg61_dreg[2],preg60_dreg[2],
  preg59_dreg[2],preg58_dreg[2],preg57_dreg[2],preg56_dreg[2],
  preg55_dreg[2],preg54_dreg[2],preg53_dreg[2],preg52_dreg[2],
  preg51_dreg[2],preg50_dreg[2],preg49_dreg[2],preg48_dreg[2],
  preg47_dreg[2],preg46_dreg[2],preg45_dreg[2],preg44_dreg[2],
  preg43_dreg[2],preg42_dreg[2],preg41_dreg[2],preg40_dreg[2],
  preg39_dreg[2],preg38_dreg[2],preg37_dreg[2],preg36_dreg[2],
  preg35_dreg[2],preg34_dreg[2],preg33_dreg[2],preg32_dreg[2],
  preg31_dreg[2],preg30_dreg[2],preg29_dreg[2],preg28_dreg[2],
  preg27_dreg[2],preg26_dreg[2],preg25_dreg[2],preg24_dreg[2],
  preg23_dreg[2],preg22_dreg[2],preg21_dreg[2],preg20_dreg[2],
  preg19_dreg[2],preg18_dreg[2],preg17_dreg[2],preg16_dreg[2],
  preg15_dreg[2],preg14_dreg[2],preg13_dreg[2],preg12_dreg[2],
  preg11_dreg[2],preg10_dreg[2],preg9_dreg[2] ,preg8_dreg[2],
  preg7_dreg[2] ,preg6_dreg[2] ,preg5_dreg[2] ,preg4_dreg[2],
  preg3_dreg[2] ,preg2_dreg[2] ,preg1_dreg[2] ,preg0_dreg[2]};
assign r3_preg_expand[95:0] = {
  preg95_dreg[3],preg94_dreg[3],preg93_dreg[3],preg92_dreg[3],
  preg91_dreg[3],preg90_dreg[3],preg89_dreg[3],preg88_dreg[3],
  preg87_dreg[3],preg86_dreg[3],preg85_dreg[3],preg84_dreg[3],
  preg83_dreg[3],preg82_dreg[3],preg81_dreg[3],preg80_dreg[3],
  preg79_dreg[3],preg78_dreg[3],preg77_dreg[3],preg76_dreg[3],
  preg75_dreg[3],preg74_dreg[3],preg73_dreg[3],preg72_dreg[3],
  preg71_dreg[3],preg70_dreg[3],preg69_dreg[3],preg68_dreg[3],
  preg67_dreg[3],preg66_dreg[3],preg65_dreg[3],preg64_dreg[3],
  preg63_dreg[3],preg62_dreg[3],preg61_dreg[3],preg60_dreg[3],
  preg59_dreg[3],preg58_dreg[3],preg57_dreg[3],preg56_dreg[3],
  preg55_dreg[3],preg54_dreg[3],preg53_dreg[3],preg52_dreg[3],
  preg51_dreg[3],preg50_dreg[3],preg49_dreg[3],preg48_dreg[3],
  preg47_dreg[3],preg46_dreg[3],preg45_dreg[3],preg44_dreg[3],
  preg43_dreg[3],preg42_dreg[3],preg41_dreg[3],preg40_dreg[3],
  preg39_dreg[3],preg38_dreg[3],preg37_dreg[3],preg36_dreg[3],
  preg35_dreg[3],preg34_dreg[3],preg33_dreg[3],preg32_dreg[3],
  preg31_dreg[3],preg30_dreg[3],preg29_dreg[3],preg28_dreg[3],
  preg27_dreg[3],preg26_dreg[3],preg25_dreg[3],preg24_dreg[3],
  preg23_dreg[3],preg22_dreg[3],preg21_dreg[3],preg20_dreg[3],
  preg19_dreg[3],preg18_dreg[3],preg17_dreg[3],preg16_dreg[3],
  preg15_dreg[3],preg14_dreg[3],preg13_dreg[3],preg12_dreg[3],
  preg11_dreg[3],preg10_dreg[3],preg9_dreg[3] ,preg8_dreg[3],
  preg7_dreg[3] ,preg6_dreg[3] ,preg5_dreg[3] ,preg4_dreg[3],
  preg3_dreg[3] ,preg2_dreg[3] ,preg1_dreg[3] ,preg0_dreg[3]};
assign r4_preg_expand[95:0] = {
  preg95_dreg[4],preg94_dreg[4],preg93_dreg[4],preg92_dreg[4],
  preg91_dreg[4],preg90_dreg[4],preg89_dreg[4],preg88_dreg[4],
  preg87_dreg[4],preg86_dreg[4],preg85_dreg[4],preg84_dreg[4],
  preg83_dreg[4],preg82_dreg[4],preg81_dreg[4],preg80_dreg[4],
  preg79_dreg[4],preg78_dreg[4],preg77_dreg[4],preg76_dreg[4],
  preg75_dreg[4],preg74_dreg[4],preg73_dreg[4],preg72_dreg[4],
  preg71_dreg[4],preg70_dreg[4],preg69_dreg[4],preg68_dreg[4],
  preg67_dreg[4],preg66_dreg[4],preg65_dreg[4],preg64_dreg[4],
  preg63_dreg[4],preg62_dreg[4],preg61_dreg[4],preg60_dreg[4],
  preg59_dreg[4],preg58_dreg[4],preg57_dreg[4],preg56_dreg[4],
  preg55_dreg[4],preg54_dreg[4],preg53_dreg[4],preg52_dreg[4],
  preg51_dreg[4],preg50_dreg[4],preg49_dreg[4],preg48_dreg[4],
  preg47_dreg[4],preg46_dreg[4],preg45_dreg[4],preg44_dreg[4],
  preg43_dreg[4],preg42_dreg[4],preg41_dreg[4],preg40_dreg[4],
  preg39_dreg[4],preg38_dreg[4],preg37_dreg[4],preg36_dreg[4],
  preg35_dreg[4],preg34_dreg[4],preg33_dreg[4],preg32_dreg[4],
  preg31_dreg[4],preg30_dreg[4],preg29_dreg[4],preg28_dreg[4],
  preg27_dreg[4],preg26_dreg[4],preg25_dreg[4],preg24_dreg[4],
  preg23_dreg[4],preg22_dreg[4],preg21_dreg[4],preg20_dreg[4],
  preg19_dreg[4],preg18_dreg[4],preg17_dreg[4],preg16_dreg[4],
  preg15_dreg[4],preg14_dreg[4],preg13_dreg[4],preg12_dreg[4],
  preg11_dreg[4],preg10_dreg[4],preg9_dreg[4] ,preg8_dreg[4],
  preg7_dreg[4] ,preg6_dreg[4] ,preg5_dreg[4] ,preg4_dreg[4],
  preg3_dreg[4] ,preg2_dreg[4] ,preg1_dreg[4] ,preg0_dreg[4]};
assign r5_preg_expand[95:0] = {
  preg95_dreg[5],preg94_dreg[5],preg93_dreg[5],preg92_dreg[5],
  preg91_dreg[5],preg90_dreg[5],preg89_dreg[5],preg88_dreg[5],
  preg87_dreg[5],preg86_dreg[5],preg85_dreg[5],preg84_dreg[5],
  preg83_dreg[5],preg82_dreg[5],preg81_dreg[5],preg80_dreg[5],
  preg79_dreg[5],preg78_dreg[5],preg77_dreg[5],preg76_dreg[5],
  preg75_dreg[5],preg74_dreg[5],preg73_dreg[5],preg72_dreg[5],
  preg71_dreg[5],preg70_dreg[5],preg69_dreg[5],preg68_dreg[5],
  preg67_dreg[5],preg66_dreg[5],preg65_dreg[5],preg64_dreg[5],
  preg63_dreg[5],preg62_dreg[5],preg61_dreg[5],preg60_dreg[5],
  preg59_dreg[5],preg58_dreg[5],preg57_dreg[5],preg56_dreg[5],
  preg55_dreg[5],preg54_dreg[5],preg53_dreg[5],preg52_dreg[5],
  preg51_dreg[5],preg50_dreg[5],preg49_dreg[5],preg48_dreg[5],
  preg47_dreg[5],preg46_dreg[5],preg45_dreg[5],preg44_dreg[5],
  preg43_dreg[5],preg42_dreg[5],preg41_dreg[5],preg40_dreg[5],
  preg39_dreg[5],preg38_dreg[5],preg37_dreg[5],preg36_dreg[5],
  preg35_dreg[5],preg34_dreg[5],preg33_dreg[5],preg32_dreg[5],
  preg31_dreg[5],preg30_dreg[5],preg29_dreg[5],preg28_dreg[5],
  preg27_dreg[5],preg26_dreg[5],preg25_dreg[5],preg24_dreg[5],
  preg23_dreg[5],preg22_dreg[5],preg21_dreg[5],preg20_dreg[5],
  preg19_dreg[5],preg18_dreg[5],preg17_dreg[5],preg16_dreg[5],
  preg15_dreg[5],preg14_dreg[5],preg13_dreg[5],preg12_dreg[5],
  preg11_dreg[5],preg10_dreg[5],preg9_dreg[5] ,preg8_dreg[5],
  preg7_dreg[5] ,preg6_dreg[5] ,preg5_dreg[5] ,preg4_dreg[5],
  preg3_dreg[5] ,preg2_dreg[5] ,preg1_dreg[5] ,preg0_dreg[5]};
assign r6_preg_expand[95:0] = {
  preg95_dreg[6],preg94_dreg[6],preg93_dreg[6],preg92_dreg[6],
  preg91_dreg[6],preg90_dreg[6],preg89_dreg[6],preg88_dreg[6],
  preg87_dreg[6],preg86_dreg[6],preg85_dreg[6],preg84_dreg[6],
  preg83_dreg[6],preg82_dreg[6],preg81_dreg[6],preg80_dreg[6],
  preg79_dreg[6],preg78_dreg[6],preg77_dreg[6],preg76_dreg[6],
  preg75_dreg[6],preg74_dreg[6],preg73_dreg[6],preg72_dreg[6],
  preg71_dreg[6],preg70_dreg[6],preg69_dreg[6],preg68_dreg[6],
  preg67_dreg[6],preg66_dreg[6],preg65_dreg[6],preg64_dreg[6],
  preg63_dreg[6],preg62_dreg[6],preg61_dreg[6],preg60_dreg[6],
  preg59_dreg[6],preg58_dreg[6],preg57_dreg[6],preg56_dreg[6],
  preg55_dreg[6],preg54_dreg[6],preg53_dreg[6],preg52_dreg[6],
  preg51_dreg[6],preg50_dreg[6],preg49_dreg[6],preg48_dreg[6],
  preg47_dreg[6],preg46_dreg[6],preg45_dreg[6],preg44_dreg[6],
  preg43_dreg[6],preg42_dreg[6],preg41_dreg[6],preg40_dreg[6],
  preg39_dreg[6],preg38_dreg[6],preg37_dreg[6],preg36_dreg[6],
  preg35_dreg[6],preg34_dreg[6],preg33_dreg[6],preg32_dreg[6],
  preg31_dreg[6],preg30_dreg[6],preg29_dreg[6],preg28_dreg[6],
  preg27_dreg[6],preg26_dreg[6],preg25_dreg[6],preg24_dreg[6],
  preg23_dreg[6],preg22_dreg[6],preg21_dreg[6],preg20_dreg[6],
  preg19_dreg[6],preg18_dreg[6],preg17_dreg[6],preg16_dreg[6],
  preg15_dreg[6],preg14_dreg[6],preg13_dreg[6],preg12_dreg[6],
  preg11_dreg[6],preg10_dreg[6],preg9_dreg[6] ,preg8_dreg[6],
  preg7_dreg[6] ,preg6_dreg[6] ,preg5_dreg[6] ,preg4_dreg[6],
  preg3_dreg[6] ,preg2_dreg[6] ,preg1_dreg[6] ,preg0_dreg[6]};
assign r7_preg_expand[95:0] = {
  preg95_dreg[7],preg94_dreg[7],preg93_dreg[7],preg92_dreg[7],
  preg91_dreg[7],preg90_dreg[7],preg89_dreg[7],preg88_dreg[7],
  preg87_dreg[7],preg86_dreg[7],preg85_dreg[7],preg84_dreg[7],
  preg83_dreg[7],preg82_dreg[7],preg81_dreg[7],preg80_dreg[7],
  preg79_dreg[7],preg78_dreg[7],preg77_dreg[7],preg76_dreg[7],
  preg75_dreg[7],preg74_dreg[7],preg73_dreg[7],preg72_dreg[7],
  preg71_dreg[7],preg70_dreg[7],preg69_dreg[7],preg68_dreg[7],
  preg67_dreg[7],preg66_dreg[7],preg65_dreg[7],preg64_dreg[7],
  preg63_dreg[7],preg62_dreg[7],preg61_dreg[7],preg60_dreg[7],
  preg59_dreg[7],preg58_dreg[7],preg57_dreg[7],preg56_dreg[7],
  preg55_dreg[7],preg54_dreg[7],preg53_dreg[7],preg52_dreg[7],
  preg51_dreg[7],preg50_dreg[7],preg49_dreg[7],preg48_dreg[7],
  preg47_dreg[7],preg46_dreg[7],preg45_dreg[7],preg44_dreg[7],
  preg43_dreg[7],preg42_dreg[7],preg41_dreg[7],preg40_dreg[7],
  preg39_dreg[7],preg38_dreg[7],preg37_dreg[7],preg36_dreg[7],
  preg35_dreg[7],preg34_dreg[7],preg33_dreg[7],preg32_dreg[7],
  preg31_dreg[7],preg30_dreg[7],preg29_dreg[7],preg28_dreg[7],
  preg27_dreg[7],preg26_dreg[7],preg25_dreg[7],preg24_dreg[7],
  preg23_dreg[7],preg22_dreg[7],preg21_dreg[7],preg20_dreg[7],
  preg19_dreg[7],preg18_dreg[7],preg17_dreg[7],preg16_dreg[7],
  preg15_dreg[7],preg14_dreg[7],preg13_dreg[7],preg12_dreg[7],
  preg11_dreg[7],preg10_dreg[7],preg9_dreg[7] ,preg8_dreg[7],
  preg7_dreg[7] ,preg6_dreg[7] ,preg5_dreg[7] ,preg4_dreg[7],
  preg3_dreg[7] ,preg2_dreg[7] ,preg1_dreg[7] ,preg0_dreg[7]};
assign r8_preg_expand[95:0] = {
  preg95_dreg[8],preg94_dreg[8],preg93_dreg[8],preg92_dreg[8],
  preg91_dreg[8],preg90_dreg[8],preg89_dreg[8],preg88_dreg[8],
  preg87_dreg[8],preg86_dreg[8],preg85_dreg[8],preg84_dreg[8],
  preg83_dreg[8],preg82_dreg[8],preg81_dreg[8],preg80_dreg[8],
  preg79_dreg[8],preg78_dreg[8],preg77_dreg[8],preg76_dreg[8],
  preg75_dreg[8],preg74_dreg[8],preg73_dreg[8],preg72_dreg[8],
  preg71_dreg[8],preg70_dreg[8],preg69_dreg[8],preg68_dreg[8],
  preg67_dreg[8],preg66_dreg[8],preg65_dreg[8],preg64_dreg[8],
  preg63_dreg[8],preg62_dreg[8],preg61_dreg[8],preg60_dreg[8],
  preg59_dreg[8],preg58_dreg[8],preg57_dreg[8],preg56_dreg[8],
  preg55_dreg[8],preg54_dreg[8],preg53_dreg[8],preg52_dreg[8],
  preg51_dreg[8],preg50_dreg[8],preg49_dreg[8],preg48_dreg[8],
  preg47_dreg[8],preg46_dreg[8],preg45_dreg[8],preg44_dreg[8],
  preg43_dreg[8],preg42_dreg[8],preg41_dreg[8],preg40_dreg[8],
  preg39_dreg[8],preg38_dreg[8],preg37_dreg[8],preg36_dreg[8],
  preg35_dreg[8],preg34_dreg[8],preg33_dreg[8],preg32_dreg[8],
  preg31_dreg[8],preg30_dreg[8],preg29_dreg[8],preg28_dreg[8],
  preg27_dreg[8],preg26_dreg[8],preg25_dreg[8],preg24_dreg[8],
  preg23_dreg[8],preg22_dreg[8],preg21_dreg[8],preg20_dreg[8],
  preg19_dreg[8],preg18_dreg[8],preg17_dreg[8],preg16_dreg[8],
  preg15_dreg[8],preg14_dreg[8],preg13_dreg[8],preg12_dreg[8],
  preg11_dreg[8],preg10_dreg[8],preg9_dreg[8] ,preg8_dreg[8],
  preg7_dreg[8] ,preg6_dreg[8] ,preg5_dreg[8] ,preg4_dreg[8],
  preg3_dreg[8] ,preg2_dreg[8] ,preg1_dreg[8] ,preg0_dreg[8]};
assign r9_preg_expand[95:0] = {
  preg95_dreg[9],preg94_dreg[9],preg93_dreg[9],preg92_dreg[9],
  preg91_dreg[9],preg90_dreg[9],preg89_dreg[9],preg88_dreg[9],
  preg87_dreg[9],preg86_dreg[9],preg85_dreg[9],preg84_dreg[9],
  preg83_dreg[9],preg82_dreg[9],preg81_dreg[9],preg80_dreg[9],
  preg79_dreg[9],preg78_dreg[9],preg77_dreg[9],preg76_dreg[9],
  preg75_dreg[9],preg74_dreg[9],preg73_dreg[9],preg72_dreg[9],
  preg71_dreg[9],preg70_dreg[9],preg69_dreg[9],preg68_dreg[9],
  preg67_dreg[9],preg66_dreg[9],preg65_dreg[9],preg64_dreg[9],
  preg63_dreg[9],preg62_dreg[9],preg61_dreg[9],preg60_dreg[9],
  preg59_dreg[9],preg58_dreg[9],preg57_dreg[9],preg56_dreg[9],
  preg55_dreg[9],preg54_dreg[9],preg53_dreg[9],preg52_dreg[9],
  preg51_dreg[9],preg50_dreg[9],preg49_dreg[9],preg48_dreg[9],
  preg47_dreg[9],preg46_dreg[9],preg45_dreg[9],preg44_dreg[9],
  preg43_dreg[9],preg42_dreg[9],preg41_dreg[9],preg40_dreg[9],
  preg39_dreg[9],preg38_dreg[9],preg37_dreg[9],preg36_dreg[9],
  preg35_dreg[9],preg34_dreg[9],preg33_dreg[9],preg32_dreg[9],
  preg31_dreg[9],preg30_dreg[9],preg29_dreg[9],preg28_dreg[9],
  preg27_dreg[9],preg26_dreg[9],preg25_dreg[9],preg24_dreg[9],
  preg23_dreg[9],preg22_dreg[9],preg21_dreg[9],preg20_dreg[9],
  preg19_dreg[9],preg18_dreg[9],preg17_dreg[9],preg16_dreg[9],
  preg15_dreg[9],preg14_dreg[9],preg13_dreg[9],preg12_dreg[9],
  preg11_dreg[9],preg10_dreg[9],preg9_dreg[9] ,preg8_dreg[9],
  preg7_dreg[9] ,preg6_dreg[9] ,preg5_dreg[9] ,preg4_dreg[9],
  preg3_dreg[9] ,preg2_dreg[9] ,preg1_dreg[9] ,preg0_dreg[9]};
assign r10_preg_expand[95:0] = {
  preg95_dreg[10],preg94_dreg[10],preg93_dreg[10],preg92_dreg[10],
  preg91_dreg[10],preg90_dreg[10],preg89_dreg[10],preg88_dreg[10],
  preg87_dreg[10],preg86_dreg[10],preg85_dreg[10],preg84_dreg[10],
  preg83_dreg[10],preg82_dreg[10],preg81_dreg[10],preg80_dreg[10],
  preg79_dreg[10],preg78_dreg[10],preg77_dreg[10],preg76_dreg[10],
  preg75_dreg[10],preg74_dreg[10],preg73_dreg[10],preg72_dreg[10],
  preg71_dreg[10],preg70_dreg[10],preg69_dreg[10],preg68_dreg[10],
  preg67_dreg[10],preg66_dreg[10],preg65_dreg[10],preg64_dreg[10],
  preg63_dreg[10],preg62_dreg[10],preg61_dreg[10],preg60_dreg[10],
  preg59_dreg[10],preg58_dreg[10],preg57_dreg[10],preg56_dreg[10],
  preg55_dreg[10],preg54_dreg[10],preg53_dreg[10],preg52_dreg[10],
  preg51_dreg[10],preg50_dreg[10],preg49_dreg[10],preg48_dreg[10],
  preg47_dreg[10],preg46_dreg[10],preg45_dreg[10],preg44_dreg[10],
  preg43_dreg[10],preg42_dreg[10],preg41_dreg[10],preg40_dreg[10],
  preg39_dreg[10],preg38_dreg[10],preg37_dreg[10],preg36_dreg[10],
  preg35_dreg[10],preg34_dreg[10],preg33_dreg[10],preg32_dreg[10],
  preg31_dreg[10],preg30_dreg[10],preg29_dreg[10],preg28_dreg[10],
  preg27_dreg[10],preg26_dreg[10],preg25_dreg[10],preg24_dreg[10],
  preg23_dreg[10],preg22_dreg[10],preg21_dreg[10],preg20_dreg[10],
  preg19_dreg[10],preg18_dreg[10],preg17_dreg[10],preg16_dreg[10],
  preg15_dreg[10],preg14_dreg[10],preg13_dreg[10],preg12_dreg[10],
  preg11_dreg[10],preg10_dreg[10],preg9_dreg[10] ,preg8_dreg[10],
  preg7_dreg[10] ,preg6_dreg[10] ,preg5_dreg[10] ,preg4_dreg[10],
  preg3_dreg[10] ,preg2_dreg[10] ,preg1_dreg[10] ,preg0_dreg[10]};
assign r11_preg_expand[95:0] = {
  preg95_dreg[11],preg94_dreg[11],preg93_dreg[11],preg92_dreg[11],
  preg91_dreg[11],preg90_dreg[11],preg89_dreg[11],preg88_dreg[11],
  preg87_dreg[11],preg86_dreg[11],preg85_dreg[11],preg84_dreg[11],
  preg83_dreg[11],preg82_dreg[11],preg81_dreg[11],preg80_dreg[11],
  preg79_dreg[11],preg78_dreg[11],preg77_dreg[11],preg76_dreg[11],
  preg75_dreg[11],preg74_dreg[11],preg73_dreg[11],preg72_dreg[11],
  preg71_dreg[11],preg70_dreg[11],preg69_dreg[11],preg68_dreg[11],
  preg67_dreg[11],preg66_dreg[11],preg65_dreg[11],preg64_dreg[11],
  preg63_dreg[11],preg62_dreg[11],preg61_dreg[11],preg60_dreg[11],
  preg59_dreg[11],preg58_dreg[11],preg57_dreg[11],preg56_dreg[11],
  preg55_dreg[11],preg54_dreg[11],preg53_dreg[11],preg52_dreg[11],
  preg51_dreg[11],preg50_dreg[11],preg49_dreg[11],preg48_dreg[11],
  preg47_dreg[11],preg46_dreg[11],preg45_dreg[11],preg44_dreg[11],
  preg43_dreg[11],preg42_dreg[11],preg41_dreg[11],preg40_dreg[11],
  preg39_dreg[11],preg38_dreg[11],preg37_dreg[11],preg36_dreg[11],
  preg35_dreg[11],preg34_dreg[11],preg33_dreg[11],preg32_dreg[11],
  preg31_dreg[11],preg30_dreg[11],preg29_dreg[11],preg28_dreg[11],
  preg27_dreg[11],preg26_dreg[11],preg25_dreg[11],preg24_dreg[11],
  preg23_dreg[11],preg22_dreg[11],preg21_dreg[11],preg20_dreg[11],
  preg19_dreg[11],preg18_dreg[11],preg17_dreg[11],preg16_dreg[11],
  preg15_dreg[11],preg14_dreg[11],preg13_dreg[11],preg12_dreg[11],
  preg11_dreg[11],preg10_dreg[11],preg9_dreg[11] ,preg8_dreg[11],
  preg7_dreg[11] ,preg6_dreg[11] ,preg5_dreg[11] ,preg4_dreg[11],
  preg3_dreg[11] ,preg2_dreg[11] ,preg1_dreg[11] ,preg0_dreg[11]};
assign r12_preg_expand[95:0] = {
  preg95_dreg[12],preg94_dreg[12],preg93_dreg[12],preg92_dreg[12],
  preg91_dreg[12],preg90_dreg[12],preg89_dreg[12],preg88_dreg[12],
  preg87_dreg[12],preg86_dreg[12],preg85_dreg[12],preg84_dreg[12],
  preg83_dreg[12],preg82_dreg[12],preg81_dreg[12],preg80_dreg[12],
  preg79_dreg[12],preg78_dreg[12],preg77_dreg[12],preg76_dreg[12],
  preg75_dreg[12],preg74_dreg[12],preg73_dreg[12],preg72_dreg[12],
  preg71_dreg[12],preg70_dreg[12],preg69_dreg[12],preg68_dreg[12],
  preg67_dreg[12],preg66_dreg[12],preg65_dreg[12],preg64_dreg[12],
  preg63_dreg[12],preg62_dreg[12],preg61_dreg[12],preg60_dreg[12],
  preg59_dreg[12],preg58_dreg[12],preg57_dreg[12],preg56_dreg[12],
  preg55_dreg[12],preg54_dreg[12],preg53_dreg[12],preg52_dreg[12],
  preg51_dreg[12],preg50_dreg[12],preg49_dreg[12],preg48_dreg[12],
  preg47_dreg[12],preg46_dreg[12],preg45_dreg[12],preg44_dreg[12],
  preg43_dreg[12],preg42_dreg[12],preg41_dreg[12],preg40_dreg[12],
  preg39_dreg[12],preg38_dreg[12],preg37_dreg[12],preg36_dreg[12],
  preg35_dreg[12],preg34_dreg[12],preg33_dreg[12],preg32_dreg[12],
  preg31_dreg[12],preg30_dreg[12],preg29_dreg[12],preg28_dreg[12],
  preg27_dreg[12],preg26_dreg[12],preg25_dreg[12],preg24_dreg[12],
  preg23_dreg[12],preg22_dreg[12],preg21_dreg[12],preg20_dreg[12],
  preg19_dreg[12],preg18_dreg[12],preg17_dreg[12],preg16_dreg[12],
  preg15_dreg[12],preg14_dreg[12],preg13_dreg[12],preg12_dreg[12],
  preg11_dreg[12],preg10_dreg[12],preg9_dreg[12] ,preg8_dreg[12],
  preg7_dreg[12] ,preg6_dreg[12] ,preg5_dreg[12] ,preg4_dreg[12],
  preg3_dreg[12] ,preg2_dreg[12] ,preg1_dreg[12] ,preg0_dreg[12]};
assign r13_preg_expand[95:0] = {
  preg95_dreg[13],preg94_dreg[13],preg93_dreg[13],preg92_dreg[13],
  preg91_dreg[13],preg90_dreg[13],preg89_dreg[13],preg88_dreg[13],
  preg87_dreg[13],preg86_dreg[13],preg85_dreg[13],preg84_dreg[13],
  preg83_dreg[13],preg82_dreg[13],preg81_dreg[13],preg80_dreg[13],
  preg79_dreg[13],preg78_dreg[13],preg77_dreg[13],preg76_dreg[13],
  preg75_dreg[13],preg74_dreg[13],preg73_dreg[13],preg72_dreg[13],
  preg71_dreg[13],preg70_dreg[13],preg69_dreg[13],preg68_dreg[13],
  preg67_dreg[13],preg66_dreg[13],preg65_dreg[13],preg64_dreg[13],
  preg63_dreg[13],preg62_dreg[13],preg61_dreg[13],preg60_dreg[13],
  preg59_dreg[13],preg58_dreg[13],preg57_dreg[13],preg56_dreg[13],
  preg55_dreg[13],preg54_dreg[13],preg53_dreg[13],preg52_dreg[13],
  preg51_dreg[13],preg50_dreg[13],preg49_dreg[13],preg48_dreg[13],
  preg47_dreg[13],preg46_dreg[13],preg45_dreg[13],preg44_dreg[13],
  preg43_dreg[13],preg42_dreg[13],preg41_dreg[13],preg40_dreg[13],
  preg39_dreg[13],preg38_dreg[13],preg37_dreg[13],preg36_dreg[13],
  preg35_dreg[13],preg34_dreg[13],preg33_dreg[13],preg32_dreg[13],
  preg31_dreg[13],preg30_dreg[13],preg29_dreg[13],preg28_dreg[13],
  preg27_dreg[13],preg26_dreg[13],preg25_dreg[13],preg24_dreg[13],
  preg23_dreg[13],preg22_dreg[13],preg21_dreg[13],preg20_dreg[13],
  preg19_dreg[13],preg18_dreg[13],preg17_dreg[13],preg16_dreg[13],
  preg15_dreg[13],preg14_dreg[13],preg13_dreg[13],preg12_dreg[13],
  preg11_dreg[13],preg10_dreg[13],preg9_dreg[13] ,preg8_dreg[13],
  preg7_dreg[13] ,preg6_dreg[13] ,preg5_dreg[13] ,preg4_dreg[13],
  preg3_dreg[13] ,preg2_dreg[13] ,preg1_dreg[13] ,preg0_dreg[13]};
assign r14_preg_expand[95:0] = {
  preg95_dreg[14],preg94_dreg[14],preg93_dreg[14],preg92_dreg[14],
  preg91_dreg[14],preg90_dreg[14],preg89_dreg[14],preg88_dreg[14],
  preg87_dreg[14],preg86_dreg[14],preg85_dreg[14],preg84_dreg[14],
  preg83_dreg[14],preg82_dreg[14],preg81_dreg[14],preg80_dreg[14],
  preg79_dreg[14],preg78_dreg[14],preg77_dreg[14],preg76_dreg[14],
  preg75_dreg[14],preg74_dreg[14],preg73_dreg[14],preg72_dreg[14],
  preg71_dreg[14],preg70_dreg[14],preg69_dreg[14],preg68_dreg[14],
  preg67_dreg[14],preg66_dreg[14],preg65_dreg[14],preg64_dreg[14],
  preg63_dreg[14],preg62_dreg[14],preg61_dreg[14],preg60_dreg[14],
  preg59_dreg[14],preg58_dreg[14],preg57_dreg[14],preg56_dreg[14],
  preg55_dreg[14],preg54_dreg[14],preg53_dreg[14],preg52_dreg[14],
  preg51_dreg[14],preg50_dreg[14],preg49_dreg[14],preg48_dreg[14],
  preg47_dreg[14],preg46_dreg[14],preg45_dreg[14],preg44_dreg[14],
  preg43_dreg[14],preg42_dreg[14],preg41_dreg[14],preg40_dreg[14],
  preg39_dreg[14],preg38_dreg[14],preg37_dreg[14],preg36_dreg[14],
  preg35_dreg[14],preg34_dreg[14],preg33_dreg[14],preg32_dreg[14],
  preg31_dreg[14],preg30_dreg[14],preg29_dreg[14],preg28_dreg[14],
  preg27_dreg[14],preg26_dreg[14],preg25_dreg[14],preg24_dreg[14],
  preg23_dreg[14],preg22_dreg[14],preg21_dreg[14],preg20_dreg[14],
  preg19_dreg[14],preg18_dreg[14],preg17_dreg[14],preg16_dreg[14],
  preg15_dreg[14],preg14_dreg[14],preg13_dreg[14],preg12_dreg[14],
  preg11_dreg[14],preg10_dreg[14],preg9_dreg[14] ,preg8_dreg[14],
  preg7_dreg[14] ,preg6_dreg[14] ,preg5_dreg[14] ,preg4_dreg[14],
  preg3_dreg[14] ,preg2_dreg[14] ,preg1_dreg[14] ,preg0_dreg[14]};
assign r15_preg_expand[95:0] = {
  preg95_dreg[15],preg94_dreg[15],preg93_dreg[15],preg92_dreg[15],
  preg91_dreg[15],preg90_dreg[15],preg89_dreg[15],preg88_dreg[15],
  preg87_dreg[15],preg86_dreg[15],preg85_dreg[15],preg84_dreg[15],
  preg83_dreg[15],preg82_dreg[15],preg81_dreg[15],preg80_dreg[15],
  preg79_dreg[15],preg78_dreg[15],preg77_dreg[15],preg76_dreg[15],
  preg75_dreg[15],preg74_dreg[15],preg73_dreg[15],preg72_dreg[15],
  preg71_dreg[15],preg70_dreg[15],preg69_dreg[15],preg68_dreg[15],
  preg67_dreg[15],preg66_dreg[15],preg65_dreg[15],preg64_dreg[15],
  preg63_dreg[15],preg62_dreg[15],preg61_dreg[15],preg60_dreg[15],
  preg59_dreg[15],preg58_dreg[15],preg57_dreg[15],preg56_dreg[15],
  preg55_dreg[15],preg54_dreg[15],preg53_dreg[15],preg52_dreg[15],
  preg51_dreg[15],preg50_dreg[15],preg49_dreg[15],preg48_dreg[15],
  preg47_dreg[15],preg46_dreg[15],preg45_dreg[15],preg44_dreg[15],
  preg43_dreg[15],preg42_dreg[15],preg41_dreg[15],preg40_dreg[15],
  preg39_dreg[15],preg38_dreg[15],preg37_dreg[15],preg36_dreg[15],
  preg35_dreg[15],preg34_dreg[15],preg33_dreg[15],preg32_dreg[15],
  preg31_dreg[15],preg30_dreg[15],preg29_dreg[15],preg28_dreg[15],
  preg27_dreg[15],preg26_dreg[15],preg25_dreg[15],preg24_dreg[15],
  preg23_dreg[15],preg22_dreg[15],preg21_dreg[15],preg20_dreg[15],
  preg19_dreg[15],preg18_dreg[15],preg17_dreg[15],preg16_dreg[15],
  preg15_dreg[15],preg14_dreg[15],preg13_dreg[15],preg12_dreg[15],
  preg11_dreg[15],preg10_dreg[15],preg9_dreg[15] ,preg8_dreg[15],
  preg7_dreg[15] ,preg6_dreg[15] ,preg5_dreg[15] ,preg4_dreg[15],
  preg3_dreg[15] ,preg2_dreg[15] ,preg1_dreg[15] ,preg0_dreg[15]};
assign r16_preg_expand[95:0] = {
  preg95_dreg[16],preg94_dreg[16],preg93_dreg[16],preg92_dreg[16],
  preg91_dreg[16],preg90_dreg[16],preg89_dreg[16],preg88_dreg[16],
  preg87_dreg[16],preg86_dreg[16],preg85_dreg[16],preg84_dreg[16],
  preg83_dreg[16],preg82_dreg[16],preg81_dreg[16],preg80_dreg[16],
  preg79_dreg[16],preg78_dreg[16],preg77_dreg[16],preg76_dreg[16],
  preg75_dreg[16],preg74_dreg[16],preg73_dreg[16],preg72_dreg[16],
  preg71_dreg[16],preg70_dreg[16],preg69_dreg[16],preg68_dreg[16],
  preg67_dreg[16],preg66_dreg[16],preg65_dreg[16],preg64_dreg[16],
  preg63_dreg[16],preg62_dreg[16],preg61_dreg[16],preg60_dreg[16],
  preg59_dreg[16],preg58_dreg[16],preg57_dreg[16],preg56_dreg[16],
  preg55_dreg[16],preg54_dreg[16],preg53_dreg[16],preg52_dreg[16],
  preg51_dreg[16],preg50_dreg[16],preg49_dreg[16],preg48_dreg[16],
  preg47_dreg[16],preg46_dreg[16],preg45_dreg[16],preg44_dreg[16],
  preg43_dreg[16],preg42_dreg[16],preg41_dreg[16],preg40_dreg[16],
  preg39_dreg[16],preg38_dreg[16],preg37_dreg[16],preg36_dreg[16],
  preg35_dreg[16],preg34_dreg[16],preg33_dreg[16],preg32_dreg[16],
  preg31_dreg[16],preg30_dreg[16],preg29_dreg[16],preg28_dreg[16],
  preg27_dreg[16],preg26_dreg[16],preg25_dreg[16],preg24_dreg[16],
  preg23_dreg[16],preg22_dreg[16],preg21_dreg[16],preg20_dreg[16],
  preg19_dreg[16],preg18_dreg[16],preg17_dreg[16],preg16_dreg[16],
  preg15_dreg[16],preg14_dreg[16],preg13_dreg[16],preg12_dreg[16],
  preg11_dreg[16],preg10_dreg[16],preg9_dreg[16] ,preg8_dreg[16],
  preg7_dreg[16] ,preg6_dreg[16] ,preg5_dreg[16] ,preg4_dreg[16],
  preg3_dreg[16] ,preg2_dreg[16] ,preg1_dreg[16] ,preg0_dreg[16]};
assign r17_preg_expand[95:0] = {
  preg95_dreg[17],preg94_dreg[17],preg93_dreg[17],preg92_dreg[17],
  preg91_dreg[17],preg90_dreg[17],preg89_dreg[17],preg88_dreg[17],
  preg87_dreg[17],preg86_dreg[17],preg85_dreg[17],preg84_dreg[17],
  preg83_dreg[17],preg82_dreg[17],preg81_dreg[17],preg80_dreg[17],
  preg79_dreg[17],preg78_dreg[17],preg77_dreg[17],preg76_dreg[17],
  preg75_dreg[17],preg74_dreg[17],preg73_dreg[17],preg72_dreg[17],
  preg71_dreg[17],preg70_dreg[17],preg69_dreg[17],preg68_dreg[17],
  preg67_dreg[17],preg66_dreg[17],preg65_dreg[17],preg64_dreg[17],
  preg63_dreg[17],preg62_dreg[17],preg61_dreg[17],preg60_dreg[17],
  preg59_dreg[17],preg58_dreg[17],preg57_dreg[17],preg56_dreg[17],
  preg55_dreg[17],preg54_dreg[17],preg53_dreg[17],preg52_dreg[17],
  preg51_dreg[17],preg50_dreg[17],preg49_dreg[17],preg48_dreg[17],
  preg47_dreg[17],preg46_dreg[17],preg45_dreg[17],preg44_dreg[17],
  preg43_dreg[17],preg42_dreg[17],preg41_dreg[17],preg40_dreg[17],
  preg39_dreg[17],preg38_dreg[17],preg37_dreg[17],preg36_dreg[17],
  preg35_dreg[17],preg34_dreg[17],preg33_dreg[17],preg32_dreg[17],
  preg31_dreg[17],preg30_dreg[17],preg29_dreg[17],preg28_dreg[17],
  preg27_dreg[17],preg26_dreg[17],preg25_dreg[17],preg24_dreg[17],
  preg23_dreg[17],preg22_dreg[17],preg21_dreg[17],preg20_dreg[17],
  preg19_dreg[17],preg18_dreg[17],preg17_dreg[17],preg16_dreg[17],
  preg15_dreg[17],preg14_dreg[17],preg13_dreg[17],preg12_dreg[17],
  preg11_dreg[17],preg10_dreg[17],preg9_dreg[17] ,preg8_dreg[17],
  preg7_dreg[17] ,preg6_dreg[17] ,preg5_dreg[17] ,preg4_dreg[17],
  preg3_dreg[17] ,preg2_dreg[17] ,preg1_dreg[17] ,preg0_dreg[17]};
assign r18_preg_expand[95:0] = {
  preg95_dreg[18],preg94_dreg[18],preg93_dreg[18],preg92_dreg[18],
  preg91_dreg[18],preg90_dreg[18],preg89_dreg[18],preg88_dreg[18],
  preg87_dreg[18],preg86_dreg[18],preg85_dreg[18],preg84_dreg[18],
  preg83_dreg[18],preg82_dreg[18],preg81_dreg[18],preg80_dreg[18],
  preg79_dreg[18],preg78_dreg[18],preg77_dreg[18],preg76_dreg[18],
  preg75_dreg[18],preg74_dreg[18],preg73_dreg[18],preg72_dreg[18],
  preg71_dreg[18],preg70_dreg[18],preg69_dreg[18],preg68_dreg[18],
  preg67_dreg[18],preg66_dreg[18],preg65_dreg[18],preg64_dreg[18],
  preg63_dreg[18],preg62_dreg[18],preg61_dreg[18],preg60_dreg[18],
  preg59_dreg[18],preg58_dreg[18],preg57_dreg[18],preg56_dreg[18],
  preg55_dreg[18],preg54_dreg[18],preg53_dreg[18],preg52_dreg[18],
  preg51_dreg[18],preg50_dreg[18],preg49_dreg[18],preg48_dreg[18],
  preg47_dreg[18],preg46_dreg[18],preg45_dreg[18],preg44_dreg[18],
  preg43_dreg[18],preg42_dreg[18],preg41_dreg[18],preg40_dreg[18],
  preg39_dreg[18],preg38_dreg[18],preg37_dreg[18],preg36_dreg[18],
  preg35_dreg[18],preg34_dreg[18],preg33_dreg[18],preg32_dreg[18],
  preg31_dreg[18],preg30_dreg[18],preg29_dreg[18],preg28_dreg[18],
  preg27_dreg[18],preg26_dreg[18],preg25_dreg[18],preg24_dreg[18],
  preg23_dreg[18],preg22_dreg[18],preg21_dreg[18],preg20_dreg[18],
  preg19_dreg[18],preg18_dreg[18],preg17_dreg[18],preg16_dreg[18],
  preg15_dreg[18],preg14_dreg[18],preg13_dreg[18],preg12_dreg[18],
  preg11_dreg[18],preg10_dreg[18],preg9_dreg[18] ,preg8_dreg[18],
  preg7_dreg[18] ,preg6_dreg[18] ,preg5_dreg[18] ,preg4_dreg[18],
  preg3_dreg[18] ,preg2_dreg[18] ,preg1_dreg[18] ,preg0_dreg[18]};
assign r19_preg_expand[95:0] = {
  preg95_dreg[19],preg94_dreg[19],preg93_dreg[19],preg92_dreg[19],
  preg91_dreg[19],preg90_dreg[19],preg89_dreg[19],preg88_dreg[19],
  preg87_dreg[19],preg86_dreg[19],preg85_dreg[19],preg84_dreg[19],
  preg83_dreg[19],preg82_dreg[19],preg81_dreg[19],preg80_dreg[19],
  preg79_dreg[19],preg78_dreg[19],preg77_dreg[19],preg76_dreg[19],
  preg75_dreg[19],preg74_dreg[19],preg73_dreg[19],preg72_dreg[19],
  preg71_dreg[19],preg70_dreg[19],preg69_dreg[19],preg68_dreg[19],
  preg67_dreg[19],preg66_dreg[19],preg65_dreg[19],preg64_dreg[19],
  preg63_dreg[19],preg62_dreg[19],preg61_dreg[19],preg60_dreg[19],
  preg59_dreg[19],preg58_dreg[19],preg57_dreg[19],preg56_dreg[19],
  preg55_dreg[19],preg54_dreg[19],preg53_dreg[19],preg52_dreg[19],
  preg51_dreg[19],preg50_dreg[19],preg49_dreg[19],preg48_dreg[19],
  preg47_dreg[19],preg46_dreg[19],preg45_dreg[19],preg44_dreg[19],
  preg43_dreg[19],preg42_dreg[19],preg41_dreg[19],preg40_dreg[19],
  preg39_dreg[19],preg38_dreg[19],preg37_dreg[19],preg36_dreg[19],
  preg35_dreg[19],preg34_dreg[19],preg33_dreg[19],preg32_dreg[19],
  preg31_dreg[19],preg30_dreg[19],preg29_dreg[19],preg28_dreg[19],
  preg27_dreg[19],preg26_dreg[19],preg25_dreg[19],preg24_dreg[19],
  preg23_dreg[19],preg22_dreg[19],preg21_dreg[19],preg20_dreg[19],
  preg19_dreg[19],preg18_dreg[19],preg17_dreg[19],preg16_dreg[19],
  preg15_dreg[19],preg14_dreg[19],preg13_dreg[19],preg12_dreg[19],
  preg11_dreg[19],preg10_dreg[19],preg9_dreg[19] ,preg8_dreg[19],
  preg7_dreg[19] ,preg6_dreg[19] ,preg5_dreg[19] ,preg4_dreg[19],
  preg3_dreg[19] ,preg2_dreg[19] ,preg1_dreg[19] ,preg0_dreg[19]};
assign r20_preg_expand[95:0] = {
  preg95_dreg[20],preg94_dreg[20],preg93_dreg[20],preg92_dreg[20],
  preg91_dreg[20],preg90_dreg[20],preg89_dreg[20],preg88_dreg[20],
  preg87_dreg[20],preg86_dreg[20],preg85_dreg[20],preg84_dreg[20],
  preg83_dreg[20],preg82_dreg[20],preg81_dreg[20],preg80_dreg[20],
  preg79_dreg[20],preg78_dreg[20],preg77_dreg[20],preg76_dreg[20],
  preg75_dreg[20],preg74_dreg[20],preg73_dreg[20],preg72_dreg[20],
  preg71_dreg[20],preg70_dreg[20],preg69_dreg[20],preg68_dreg[20],
  preg67_dreg[20],preg66_dreg[20],preg65_dreg[20],preg64_dreg[20],
  preg63_dreg[20],preg62_dreg[20],preg61_dreg[20],preg60_dreg[20],
  preg59_dreg[20],preg58_dreg[20],preg57_dreg[20],preg56_dreg[20],
  preg55_dreg[20],preg54_dreg[20],preg53_dreg[20],preg52_dreg[20],
  preg51_dreg[20],preg50_dreg[20],preg49_dreg[20],preg48_dreg[20],
  preg47_dreg[20],preg46_dreg[20],preg45_dreg[20],preg44_dreg[20],
  preg43_dreg[20],preg42_dreg[20],preg41_dreg[20],preg40_dreg[20],
  preg39_dreg[20],preg38_dreg[20],preg37_dreg[20],preg36_dreg[20],
  preg35_dreg[20],preg34_dreg[20],preg33_dreg[20],preg32_dreg[20],
  preg31_dreg[20],preg30_dreg[20],preg29_dreg[20],preg28_dreg[20],
  preg27_dreg[20],preg26_dreg[20],preg25_dreg[20],preg24_dreg[20],
  preg23_dreg[20],preg22_dreg[20],preg21_dreg[20],preg20_dreg[20],
  preg19_dreg[20],preg18_dreg[20],preg17_dreg[20],preg16_dreg[20],
  preg15_dreg[20],preg14_dreg[20],preg13_dreg[20],preg12_dreg[20],
  preg11_dreg[20],preg10_dreg[20],preg9_dreg[20] ,preg8_dreg[20],
  preg7_dreg[20] ,preg6_dreg[20] ,preg5_dreg[20] ,preg4_dreg[20],
  preg3_dreg[20] ,preg2_dreg[20] ,preg1_dreg[20] ,preg0_dreg[20]};
assign r21_preg_expand[95:0] = {
  preg95_dreg[21],preg94_dreg[21],preg93_dreg[21],preg92_dreg[21],
  preg91_dreg[21],preg90_dreg[21],preg89_dreg[21],preg88_dreg[21],
  preg87_dreg[21],preg86_dreg[21],preg85_dreg[21],preg84_dreg[21],
  preg83_dreg[21],preg82_dreg[21],preg81_dreg[21],preg80_dreg[21],
  preg79_dreg[21],preg78_dreg[21],preg77_dreg[21],preg76_dreg[21],
  preg75_dreg[21],preg74_dreg[21],preg73_dreg[21],preg72_dreg[21],
  preg71_dreg[21],preg70_dreg[21],preg69_dreg[21],preg68_dreg[21],
  preg67_dreg[21],preg66_dreg[21],preg65_dreg[21],preg64_dreg[21],
  preg63_dreg[21],preg62_dreg[21],preg61_dreg[21],preg60_dreg[21],
  preg59_dreg[21],preg58_dreg[21],preg57_dreg[21],preg56_dreg[21],
  preg55_dreg[21],preg54_dreg[21],preg53_dreg[21],preg52_dreg[21],
  preg51_dreg[21],preg50_dreg[21],preg49_dreg[21],preg48_dreg[21],
  preg47_dreg[21],preg46_dreg[21],preg45_dreg[21],preg44_dreg[21],
  preg43_dreg[21],preg42_dreg[21],preg41_dreg[21],preg40_dreg[21],
  preg39_dreg[21],preg38_dreg[21],preg37_dreg[21],preg36_dreg[21],
  preg35_dreg[21],preg34_dreg[21],preg33_dreg[21],preg32_dreg[21],
  preg31_dreg[21],preg30_dreg[21],preg29_dreg[21],preg28_dreg[21],
  preg27_dreg[21],preg26_dreg[21],preg25_dreg[21],preg24_dreg[21],
  preg23_dreg[21],preg22_dreg[21],preg21_dreg[21],preg20_dreg[21],
  preg19_dreg[21],preg18_dreg[21],preg17_dreg[21],preg16_dreg[21],
  preg15_dreg[21],preg14_dreg[21],preg13_dreg[21],preg12_dreg[21],
  preg11_dreg[21],preg10_dreg[21],preg9_dreg[21] ,preg8_dreg[21],
  preg7_dreg[21] ,preg6_dreg[21] ,preg5_dreg[21] ,preg4_dreg[21],
  preg3_dreg[21] ,preg2_dreg[21] ,preg1_dreg[21] ,preg0_dreg[21]};
assign r22_preg_expand[95:0] = {
  preg95_dreg[22],preg94_dreg[22],preg93_dreg[22],preg92_dreg[22],
  preg91_dreg[22],preg90_dreg[22],preg89_dreg[22],preg88_dreg[22],
  preg87_dreg[22],preg86_dreg[22],preg85_dreg[22],preg84_dreg[22],
  preg83_dreg[22],preg82_dreg[22],preg81_dreg[22],preg80_dreg[22],
  preg79_dreg[22],preg78_dreg[22],preg77_dreg[22],preg76_dreg[22],
  preg75_dreg[22],preg74_dreg[22],preg73_dreg[22],preg72_dreg[22],
  preg71_dreg[22],preg70_dreg[22],preg69_dreg[22],preg68_dreg[22],
  preg67_dreg[22],preg66_dreg[22],preg65_dreg[22],preg64_dreg[22],
  preg63_dreg[22],preg62_dreg[22],preg61_dreg[22],preg60_dreg[22],
  preg59_dreg[22],preg58_dreg[22],preg57_dreg[22],preg56_dreg[22],
  preg55_dreg[22],preg54_dreg[22],preg53_dreg[22],preg52_dreg[22],
  preg51_dreg[22],preg50_dreg[22],preg49_dreg[22],preg48_dreg[22],
  preg47_dreg[22],preg46_dreg[22],preg45_dreg[22],preg44_dreg[22],
  preg43_dreg[22],preg42_dreg[22],preg41_dreg[22],preg40_dreg[22],
  preg39_dreg[22],preg38_dreg[22],preg37_dreg[22],preg36_dreg[22],
  preg35_dreg[22],preg34_dreg[22],preg33_dreg[22],preg32_dreg[22],
  preg31_dreg[22],preg30_dreg[22],preg29_dreg[22],preg28_dreg[22],
  preg27_dreg[22],preg26_dreg[22],preg25_dreg[22],preg24_dreg[22],
  preg23_dreg[22],preg22_dreg[22],preg21_dreg[22],preg20_dreg[22],
  preg19_dreg[22],preg18_dreg[22],preg17_dreg[22],preg16_dreg[22],
  preg15_dreg[22],preg14_dreg[22],preg13_dreg[22],preg12_dreg[22],
  preg11_dreg[22],preg10_dreg[22],preg9_dreg[22] ,preg8_dreg[22],
  preg7_dreg[22] ,preg6_dreg[22] ,preg5_dreg[22] ,preg4_dreg[22],
  preg3_dreg[22] ,preg2_dreg[22] ,preg1_dreg[22] ,preg0_dreg[22]};
assign r23_preg_expand[95:0] = {
  preg95_dreg[23],preg94_dreg[23],preg93_dreg[23],preg92_dreg[23],
  preg91_dreg[23],preg90_dreg[23],preg89_dreg[23],preg88_dreg[23],
  preg87_dreg[23],preg86_dreg[23],preg85_dreg[23],preg84_dreg[23],
  preg83_dreg[23],preg82_dreg[23],preg81_dreg[23],preg80_dreg[23],
  preg79_dreg[23],preg78_dreg[23],preg77_dreg[23],preg76_dreg[23],
  preg75_dreg[23],preg74_dreg[23],preg73_dreg[23],preg72_dreg[23],
  preg71_dreg[23],preg70_dreg[23],preg69_dreg[23],preg68_dreg[23],
  preg67_dreg[23],preg66_dreg[23],preg65_dreg[23],preg64_dreg[23],
  preg63_dreg[23],preg62_dreg[23],preg61_dreg[23],preg60_dreg[23],
  preg59_dreg[23],preg58_dreg[23],preg57_dreg[23],preg56_dreg[23],
  preg55_dreg[23],preg54_dreg[23],preg53_dreg[23],preg52_dreg[23],
  preg51_dreg[23],preg50_dreg[23],preg49_dreg[23],preg48_dreg[23],
  preg47_dreg[23],preg46_dreg[23],preg45_dreg[23],preg44_dreg[23],
  preg43_dreg[23],preg42_dreg[23],preg41_dreg[23],preg40_dreg[23],
  preg39_dreg[23],preg38_dreg[23],preg37_dreg[23],preg36_dreg[23],
  preg35_dreg[23],preg34_dreg[23],preg33_dreg[23],preg32_dreg[23],
  preg31_dreg[23],preg30_dreg[23],preg29_dreg[23],preg28_dreg[23],
  preg27_dreg[23],preg26_dreg[23],preg25_dreg[23],preg24_dreg[23],
  preg23_dreg[23],preg22_dreg[23],preg21_dreg[23],preg20_dreg[23],
  preg19_dreg[23],preg18_dreg[23],preg17_dreg[23],preg16_dreg[23],
  preg15_dreg[23],preg14_dreg[23],preg13_dreg[23],preg12_dreg[23],
  preg11_dreg[23],preg10_dreg[23],preg9_dreg[23] ,preg8_dreg[23],
  preg7_dreg[23] ,preg6_dreg[23] ,preg5_dreg[23] ,preg4_dreg[23],
  preg3_dreg[23] ,preg2_dreg[23] ,preg1_dreg[23] ,preg0_dreg[23]};
assign r24_preg_expand[95:0] = {
  preg95_dreg[24],preg94_dreg[24],preg93_dreg[24],preg92_dreg[24],
  preg91_dreg[24],preg90_dreg[24],preg89_dreg[24],preg88_dreg[24],
  preg87_dreg[24],preg86_dreg[24],preg85_dreg[24],preg84_dreg[24],
  preg83_dreg[24],preg82_dreg[24],preg81_dreg[24],preg80_dreg[24],
  preg79_dreg[24],preg78_dreg[24],preg77_dreg[24],preg76_dreg[24],
  preg75_dreg[24],preg74_dreg[24],preg73_dreg[24],preg72_dreg[24],
  preg71_dreg[24],preg70_dreg[24],preg69_dreg[24],preg68_dreg[24],
  preg67_dreg[24],preg66_dreg[24],preg65_dreg[24],preg64_dreg[24],
  preg63_dreg[24],preg62_dreg[24],preg61_dreg[24],preg60_dreg[24],
  preg59_dreg[24],preg58_dreg[24],preg57_dreg[24],preg56_dreg[24],
  preg55_dreg[24],preg54_dreg[24],preg53_dreg[24],preg52_dreg[24],
  preg51_dreg[24],preg50_dreg[24],preg49_dreg[24],preg48_dreg[24],
  preg47_dreg[24],preg46_dreg[24],preg45_dreg[24],preg44_dreg[24],
  preg43_dreg[24],preg42_dreg[24],preg41_dreg[24],preg40_dreg[24],
  preg39_dreg[24],preg38_dreg[24],preg37_dreg[24],preg36_dreg[24],
  preg35_dreg[24],preg34_dreg[24],preg33_dreg[24],preg32_dreg[24],
  preg31_dreg[24],preg30_dreg[24],preg29_dreg[24],preg28_dreg[24],
  preg27_dreg[24],preg26_dreg[24],preg25_dreg[24],preg24_dreg[24],
  preg23_dreg[24],preg22_dreg[24],preg21_dreg[24],preg20_dreg[24],
  preg19_dreg[24],preg18_dreg[24],preg17_dreg[24],preg16_dreg[24],
  preg15_dreg[24],preg14_dreg[24],preg13_dreg[24],preg12_dreg[24],
  preg11_dreg[24],preg10_dreg[24],preg9_dreg[24] ,preg8_dreg[24],
  preg7_dreg[24] ,preg6_dreg[24] ,preg5_dreg[24] ,preg4_dreg[24],
  preg3_dreg[24] ,preg2_dreg[24] ,preg1_dreg[24] ,preg0_dreg[24]};
assign r25_preg_expand[95:0] = {
  preg95_dreg[25],preg94_dreg[25],preg93_dreg[25],preg92_dreg[25],
  preg91_dreg[25],preg90_dreg[25],preg89_dreg[25],preg88_dreg[25],
  preg87_dreg[25],preg86_dreg[25],preg85_dreg[25],preg84_dreg[25],
  preg83_dreg[25],preg82_dreg[25],preg81_dreg[25],preg80_dreg[25],
  preg79_dreg[25],preg78_dreg[25],preg77_dreg[25],preg76_dreg[25],
  preg75_dreg[25],preg74_dreg[25],preg73_dreg[25],preg72_dreg[25],
  preg71_dreg[25],preg70_dreg[25],preg69_dreg[25],preg68_dreg[25],
  preg67_dreg[25],preg66_dreg[25],preg65_dreg[25],preg64_dreg[25],
  preg63_dreg[25],preg62_dreg[25],preg61_dreg[25],preg60_dreg[25],
  preg59_dreg[25],preg58_dreg[25],preg57_dreg[25],preg56_dreg[25],
  preg55_dreg[25],preg54_dreg[25],preg53_dreg[25],preg52_dreg[25],
  preg51_dreg[25],preg50_dreg[25],preg49_dreg[25],preg48_dreg[25],
  preg47_dreg[25],preg46_dreg[25],preg45_dreg[25],preg44_dreg[25],
  preg43_dreg[25],preg42_dreg[25],preg41_dreg[25],preg40_dreg[25],
  preg39_dreg[25],preg38_dreg[25],preg37_dreg[25],preg36_dreg[25],
  preg35_dreg[25],preg34_dreg[25],preg33_dreg[25],preg32_dreg[25],
  preg31_dreg[25],preg30_dreg[25],preg29_dreg[25],preg28_dreg[25],
  preg27_dreg[25],preg26_dreg[25],preg25_dreg[25],preg24_dreg[25],
  preg23_dreg[25],preg22_dreg[25],preg21_dreg[25],preg20_dreg[25],
  preg19_dreg[25],preg18_dreg[25],preg17_dreg[25],preg16_dreg[25],
  preg15_dreg[25],preg14_dreg[25],preg13_dreg[25],preg12_dreg[25],
  preg11_dreg[25],preg10_dreg[25],preg9_dreg[25] ,preg8_dreg[25],
  preg7_dreg[25] ,preg6_dreg[25] ,preg5_dreg[25] ,preg4_dreg[25],
  preg3_dreg[25] ,preg2_dreg[25] ,preg1_dreg[25] ,preg0_dreg[25]};
assign r26_preg_expand[95:0] = {
  preg95_dreg[26],preg94_dreg[26],preg93_dreg[26],preg92_dreg[26],
  preg91_dreg[26],preg90_dreg[26],preg89_dreg[26],preg88_dreg[26],
  preg87_dreg[26],preg86_dreg[26],preg85_dreg[26],preg84_dreg[26],
  preg83_dreg[26],preg82_dreg[26],preg81_dreg[26],preg80_dreg[26],
  preg79_dreg[26],preg78_dreg[26],preg77_dreg[26],preg76_dreg[26],
  preg75_dreg[26],preg74_dreg[26],preg73_dreg[26],preg72_dreg[26],
  preg71_dreg[26],preg70_dreg[26],preg69_dreg[26],preg68_dreg[26],
  preg67_dreg[26],preg66_dreg[26],preg65_dreg[26],preg64_dreg[26],
  preg63_dreg[26],preg62_dreg[26],preg61_dreg[26],preg60_dreg[26],
  preg59_dreg[26],preg58_dreg[26],preg57_dreg[26],preg56_dreg[26],
  preg55_dreg[26],preg54_dreg[26],preg53_dreg[26],preg52_dreg[26],
  preg51_dreg[26],preg50_dreg[26],preg49_dreg[26],preg48_dreg[26],
  preg47_dreg[26],preg46_dreg[26],preg45_dreg[26],preg44_dreg[26],
  preg43_dreg[26],preg42_dreg[26],preg41_dreg[26],preg40_dreg[26],
  preg39_dreg[26],preg38_dreg[26],preg37_dreg[26],preg36_dreg[26],
  preg35_dreg[26],preg34_dreg[26],preg33_dreg[26],preg32_dreg[26],
  preg31_dreg[26],preg30_dreg[26],preg29_dreg[26],preg28_dreg[26],
  preg27_dreg[26],preg26_dreg[26],preg25_dreg[26],preg24_dreg[26],
  preg23_dreg[26],preg22_dreg[26],preg21_dreg[26],preg20_dreg[26],
  preg19_dreg[26],preg18_dreg[26],preg17_dreg[26],preg16_dreg[26],
  preg15_dreg[26],preg14_dreg[26],preg13_dreg[26],preg12_dreg[26],
  preg11_dreg[26],preg10_dreg[26],preg9_dreg[26] ,preg8_dreg[26],
  preg7_dreg[26] ,preg6_dreg[26] ,preg5_dreg[26] ,preg4_dreg[26],
  preg3_dreg[26] ,preg2_dreg[26] ,preg1_dreg[26] ,preg0_dreg[26]};
assign r27_preg_expand[95:0] = {
  preg95_dreg[27],preg94_dreg[27],preg93_dreg[27],preg92_dreg[27],
  preg91_dreg[27],preg90_dreg[27],preg89_dreg[27],preg88_dreg[27],
  preg87_dreg[27],preg86_dreg[27],preg85_dreg[27],preg84_dreg[27],
  preg83_dreg[27],preg82_dreg[27],preg81_dreg[27],preg80_dreg[27],
  preg79_dreg[27],preg78_dreg[27],preg77_dreg[27],preg76_dreg[27],
  preg75_dreg[27],preg74_dreg[27],preg73_dreg[27],preg72_dreg[27],
  preg71_dreg[27],preg70_dreg[27],preg69_dreg[27],preg68_dreg[27],
  preg67_dreg[27],preg66_dreg[27],preg65_dreg[27],preg64_dreg[27],
  preg63_dreg[27],preg62_dreg[27],preg61_dreg[27],preg60_dreg[27],
  preg59_dreg[27],preg58_dreg[27],preg57_dreg[27],preg56_dreg[27],
  preg55_dreg[27],preg54_dreg[27],preg53_dreg[27],preg52_dreg[27],
  preg51_dreg[27],preg50_dreg[27],preg49_dreg[27],preg48_dreg[27],
  preg47_dreg[27],preg46_dreg[27],preg45_dreg[27],preg44_dreg[27],
  preg43_dreg[27],preg42_dreg[27],preg41_dreg[27],preg40_dreg[27],
  preg39_dreg[27],preg38_dreg[27],preg37_dreg[27],preg36_dreg[27],
  preg35_dreg[27],preg34_dreg[27],preg33_dreg[27],preg32_dreg[27],
  preg31_dreg[27],preg30_dreg[27],preg29_dreg[27],preg28_dreg[27],
  preg27_dreg[27],preg26_dreg[27],preg25_dreg[27],preg24_dreg[27],
  preg23_dreg[27],preg22_dreg[27],preg21_dreg[27],preg20_dreg[27],
  preg19_dreg[27],preg18_dreg[27],preg17_dreg[27],preg16_dreg[27],
  preg15_dreg[27],preg14_dreg[27],preg13_dreg[27],preg12_dreg[27],
  preg11_dreg[27],preg10_dreg[27],preg9_dreg[27] ,preg8_dreg[27],
  preg7_dreg[27] ,preg6_dreg[27] ,preg5_dreg[27] ,preg4_dreg[27],
  preg3_dreg[27] ,preg2_dreg[27] ,preg1_dreg[27] ,preg0_dreg[27]};
assign r28_preg_expand[95:0] = {
  preg95_dreg[28],preg94_dreg[28],preg93_dreg[28],preg92_dreg[28],
  preg91_dreg[28],preg90_dreg[28],preg89_dreg[28],preg88_dreg[28],
  preg87_dreg[28],preg86_dreg[28],preg85_dreg[28],preg84_dreg[28],
  preg83_dreg[28],preg82_dreg[28],preg81_dreg[28],preg80_dreg[28],
  preg79_dreg[28],preg78_dreg[28],preg77_dreg[28],preg76_dreg[28],
  preg75_dreg[28],preg74_dreg[28],preg73_dreg[28],preg72_dreg[28],
  preg71_dreg[28],preg70_dreg[28],preg69_dreg[28],preg68_dreg[28],
  preg67_dreg[28],preg66_dreg[28],preg65_dreg[28],preg64_dreg[28],
  preg63_dreg[28],preg62_dreg[28],preg61_dreg[28],preg60_dreg[28],
  preg59_dreg[28],preg58_dreg[28],preg57_dreg[28],preg56_dreg[28],
  preg55_dreg[28],preg54_dreg[28],preg53_dreg[28],preg52_dreg[28],
  preg51_dreg[28],preg50_dreg[28],preg49_dreg[28],preg48_dreg[28],
  preg47_dreg[28],preg46_dreg[28],preg45_dreg[28],preg44_dreg[28],
  preg43_dreg[28],preg42_dreg[28],preg41_dreg[28],preg40_dreg[28],
  preg39_dreg[28],preg38_dreg[28],preg37_dreg[28],preg36_dreg[28],
  preg35_dreg[28],preg34_dreg[28],preg33_dreg[28],preg32_dreg[28],
  preg31_dreg[28],preg30_dreg[28],preg29_dreg[28],preg28_dreg[28],
  preg27_dreg[28],preg26_dreg[28],preg25_dreg[28],preg24_dreg[28],
  preg23_dreg[28],preg22_dreg[28],preg21_dreg[28],preg20_dreg[28],
  preg19_dreg[28],preg18_dreg[28],preg17_dreg[28],preg16_dreg[28],
  preg15_dreg[28],preg14_dreg[28],preg13_dreg[28],preg12_dreg[28],
  preg11_dreg[28],preg10_dreg[28],preg9_dreg[28] ,preg8_dreg[28],
  preg7_dreg[28] ,preg6_dreg[28] ,preg5_dreg[28] ,preg4_dreg[28],
  preg3_dreg[28] ,preg2_dreg[28] ,preg1_dreg[28] ,preg0_dreg[28]};
assign r29_preg_expand[95:0] = {
  preg95_dreg[29],preg94_dreg[29],preg93_dreg[29],preg92_dreg[29],
  preg91_dreg[29],preg90_dreg[29],preg89_dreg[29],preg88_dreg[29],
  preg87_dreg[29],preg86_dreg[29],preg85_dreg[29],preg84_dreg[29],
  preg83_dreg[29],preg82_dreg[29],preg81_dreg[29],preg80_dreg[29],
  preg79_dreg[29],preg78_dreg[29],preg77_dreg[29],preg76_dreg[29],
  preg75_dreg[29],preg74_dreg[29],preg73_dreg[29],preg72_dreg[29],
  preg71_dreg[29],preg70_dreg[29],preg69_dreg[29],preg68_dreg[29],
  preg67_dreg[29],preg66_dreg[29],preg65_dreg[29],preg64_dreg[29],
  preg63_dreg[29],preg62_dreg[29],preg61_dreg[29],preg60_dreg[29],
  preg59_dreg[29],preg58_dreg[29],preg57_dreg[29],preg56_dreg[29],
  preg55_dreg[29],preg54_dreg[29],preg53_dreg[29],preg52_dreg[29],
  preg51_dreg[29],preg50_dreg[29],preg49_dreg[29],preg48_dreg[29],
  preg47_dreg[29],preg46_dreg[29],preg45_dreg[29],preg44_dreg[29],
  preg43_dreg[29],preg42_dreg[29],preg41_dreg[29],preg40_dreg[29],
  preg39_dreg[29],preg38_dreg[29],preg37_dreg[29],preg36_dreg[29],
  preg35_dreg[29],preg34_dreg[29],preg33_dreg[29],preg32_dreg[29],
  preg31_dreg[29],preg30_dreg[29],preg29_dreg[29],preg28_dreg[29],
  preg27_dreg[29],preg26_dreg[29],preg25_dreg[29],preg24_dreg[29],
  preg23_dreg[29],preg22_dreg[29],preg21_dreg[29],preg20_dreg[29],
  preg19_dreg[29],preg18_dreg[29],preg17_dreg[29],preg16_dreg[29],
  preg15_dreg[29],preg14_dreg[29],preg13_dreg[29],preg12_dreg[29],
  preg11_dreg[29],preg10_dreg[29],preg9_dreg[29] ,preg8_dreg[29],
  preg7_dreg[29] ,preg6_dreg[29] ,preg5_dreg[29] ,preg4_dreg[29],
  preg3_dreg[29] ,preg2_dreg[29] ,preg1_dreg[29] ,preg0_dreg[29]};
assign r30_preg_expand[95:0] = {
  preg95_dreg[30],preg94_dreg[30],preg93_dreg[30],preg92_dreg[30],
  preg91_dreg[30],preg90_dreg[30],preg89_dreg[30],preg88_dreg[30],
  preg87_dreg[30],preg86_dreg[30],preg85_dreg[30],preg84_dreg[30],
  preg83_dreg[30],preg82_dreg[30],preg81_dreg[30],preg80_dreg[30],
  preg79_dreg[30],preg78_dreg[30],preg77_dreg[30],preg76_dreg[30],
  preg75_dreg[30],preg74_dreg[30],preg73_dreg[30],preg72_dreg[30],
  preg71_dreg[30],preg70_dreg[30],preg69_dreg[30],preg68_dreg[30],
  preg67_dreg[30],preg66_dreg[30],preg65_dreg[30],preg64_dreg[30],
  preg63_dreg[30],preg62_dreg[30],preg61_dreg[30],preg60_dreg[30],
  preg59_dreg[30],preg58_dreg[30],preg57_dreg[30],preg56_dreg[30],
  preg55_dreg[30],preg54_dreg[30],preg53_dreg[30],preg52_dreg[30],
  preg51_dreg[30],preg50_dreg[30],preg49_dreg[30],preg48_dreg[30],
  preg47_dreg[30],preg46_dreg[30],preg45_dreg[30],preg44_dreg[30],
  preg43_dreg[30],preg42_dreg[30],preg41_dreg[30],preg40_dreg[30],
  preg39_dreg[30],preg38_dreg[30],preg37_dreg[30],preg36_dreg[30],
  preg35_dreg[30],preg34_dreg[30],preg33_dreg[30],preg32_dreg[30],
  preg31_dreg[30],preg30_dreg[30],preg29_dreg[30],preg28_dreg[30],
  preg27_dreg[30],preg26_dreg[30],preg25_dreg[30],preg24_dreg[30],
  preg23_dreg[30],preg22_dreg[30],preg21_dreg[30],preg20_dreg[30],
  preg19_dreg[30],preg18_dreg[30],preg17_dreg[30],preg16_dreg[30],
  preg15_dreg[30],preg14_dreg[30],preg13_dreg[30],preg12_dreg[30],
  preg11_dreg[30],preg10_dreg[30],preg9_dreg[30] ,preg8_dreg[30],
  preg7_dreg[30] ,preg6_dreg[30] ,preg5_dreg[30] ,preg4_dreg[30],
  preg3_dreg[30] ,preg2_dreg[30] ,preg1_dreg[30] ,preg0_dreg[30]};
assign r31_preg_expand[95:0] = {
  preg95_dreg[31],preg94_dreg[31],preg93_dreg[31],preg92_dreg[31],
  preg91_dreg[31],preg90_dreg[31],preg89_dreg[31],preg88_dreg[31],
  preg87_dreg[31],preg86_dreg[31],preg85_dreg[31],preg84_dreg[31],
  preg83_dreg[31],preg82_dreg[31],preg81_dreg[31],preg80_dreg[31],
  preg79_dreg[31],preg78_dreg[31],preg77_dreg[31],preg76_dreg[31],
  preg75_dreg[31],preg74_dreg[31],preg73_dreg[31],preg72_dreg[31],
  preg71_dreg[31],preg70_dreg[31],preg69_dreg[31],preg68_dreg[31],
  preg67_dreg[31],preg66_dreg[31],preg65_dreg[31],preg64_dreg[31],
  preg63_dreg[31],preg62_dreg[31],preg61_dreg[31],preg60_dreg[31],
  preg59_dreg[31],preg58_dreg[31],preg57_dreg[31],preg56_dreg[31],
  preg55_dreg[31],preg54_dreg[31],preg53_dreg[31],preg52_dreg[31],
  preg51_dreg[31],preg50_dreg[31],preg49_dreg[31],preg48_dreg[31],
  preg47_dreg[31],preg46_dreg[31],preg45_dreg[31],preg44_dreg[31],
  preg43_dreg[31],preg42_dreg[31],preg41_dreg[31],preg40_dreg[31],
  preg39_dreg[31],preg38_dreg[31],preg37_dreg[31],preg36_dreg[31],
  preg35_dreg[31],preg34_dreg[31],preg33_dreg[31],preg32_dreg[31],
  preg31_dreg[31],preg30_dreg[31],preg29_dreg[31],preg28_dreg[31],
  preg27_dreg[31],preg26_dreg[31],preg25_dreg[31],preg24_dreg[31],
  preg23_dreg[31],preg22_dreg[31],preg21_dreg[31],preg20_dreg[31],
  preg19_dreg[31],preg18_dreg[31],preg17_dreg[31],preg16_dreg[31],
  preg15_dreg[31],preg14_dreg[31],preg13_dreg[31],preg12_dreg[31],
  preg11_dreg[31],preg10_dreg[31],preg9_dreg[31] ,preg8_dreg[31],
  preg7_dreg[31] ,preg6_dreg[31] ,preg5_dreg[31] ,preg4_dreg[31],
  preg3_dreg[31] ,preg2_dreg[31] ,preg1_dreg[31] ,preg0_dreg[31]};

// &ConnRule(s/^x_num/r0_preg/); @2807
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r0_preg"); @2808
ct_rtu_encode_96  x_ct_rtu_encode_96_r0_preg (
  .x_num          (r0_preg       ),
  .x_num_expand   (r0_preg_expand)
);

// &ConnRule(s/^x_num/r1_preg/); @2809
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r1_preg"); @2810
ct_rtu_encode_96  x_ct_rtu_encode_96_r1_preg (
  .x_num          (r1_preg       ),
  .x_num_expand   (r1_preg_expand)
);

// &ConnRule(s/^x_num/r2_preg/); @2811
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r2_preg"); @2812
ct_rtu_encode_96  x_ct_rtu_encode_96_r2_preg (
  .x_num          (r2_preg       ),
  .x_num_expand   (r2_preg_expand)
);

// &ConnRule(s/^x_num/r3_preg/); @2813
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r3_preg"); @2814
ct_rtu_encode_96  x_ct_rtu_encode_96_r3_preg (
  .x_num          (r3_preg       ),
  .x_num_expand   (r3_preg_expand)
);

// &ConnRule(s/^x_num/r4_preg/); @2815
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r4_preg"); @2816
ct_rtu_encode_96  x_ct_rtu_encode_96_r4_preg (
  .x_num          (r4_preg       ),
  .x_num_expand   (r4_preg_expand)
);

// &ConnRule(s/^x_num/r5_preg/); @2817
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r5_preg"); @2818
ct_rtu_encode_96  x_ct_rtu_encode_96_r5_preg (
  .x_num          (r5_preg       ),
  .x_num_expand   (r5_preg_expand)
);

// &ConnRule(s/^x_num/r6_preg/); @2819
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r6_preg"); @2820
ct_rtu_encode_96  x_ct_rtu_encode_96_r6_preg (
  .x_num          (r6_preg       ),
  .x_num_expand   (r6_preg_expand)
);

// &ConnRule(s/^x_num/r7_preg/); @2821
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r7_preg"); @2822
ct_rtu_encode_96  x_ct_rtu_encode_96_r7_preg (
  .x_num          (r7_preg       ),
  .x_num_expand   (r7_preg_expand)
);

// &ConnRule(s/^x_num/r8_preg/); @2823
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r8_preg"); @2824
ct_rtu_encode_96  x_ct_rtu_encode_96_r8_preg (
  .x_num          (r8_preg       ),
  .x_num_expand   (r8_preg_expand)
);

// &ConnRule(s/^x_num/r9_preg/); @2825
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r9_preg"); @2826
ct_rtu_encode_96  x_ct_rtu_encode_96_r9_preg (
  .x_num          (r9_preg       ),
  .x_num_expand   (r9_preg_expand)
);

// &ConnRule(s/^x_num/r10_preg/); @2827
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r10_preg"); @2828
ct_rtu_encode_96  x_ct_rtu_encode_96_r10_preg (
  .x_num           (r10_preg       ),
  .x_num_expand    (r10_preg_expand)
);

// &ConnRule(s/^x_num/r11_preg/); @2829
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r11_preg"); @2830
ct_rtu_encode_96  x_ct_rtu_encode_96_r11_preg (
  .x_num           (r11_preg       ),
  .x_num_expand    (r11_preg_expand)
);

// &ConnRule(s/^x_num/r12_preg/); @2831
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r12_preg"); @2832
ct_rtu_encode_96  x_ct_rtu_encode_96_r12_preg (
  .x_num           (r12_preg       ),
  .x_num_expand    (r12_preg_expand)
);

// &ConnRule(s/^x_num/r13_preg/); @2833
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r13_preg"); @2834
ct_rtu_encode_96  x_ct_rtu_encode_96_r13_preg (
  .x_num           (r13_preg       ),
  .x_num_expand    (r13_preg_expand)
);

// &ConnRule(s/^x_num/r14_preg/); @2835
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r14_preg"); @2836
ct_rtu_encode_96  x_ct_rtu_encode_96_r14_preg (
  .x_num           (r14_preg       ),
  .x_num_expand    (r14_preg_expand)
);

// &ConnRule(s/^x_num/r15_preg/); @2837
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r15_preg"); @2838
ct_rtu_encode_96  x_ct_rtu_encode_96_r15_preg (
  .x_num           (r15_preg       ),
  .x_num_expand    (r15_preg_expand)
);

// &ConnRule(s/^x_num/r16_preg/); @2839
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r16_preg"); @2840
ct_rtu_encode_96  x_ct_rtu_encode_96_r16_preg (
  .x_num           (r16_preg       ),
  .x_num_expand    (r16_preg_expand)
);

// &ConnRule(s/^x_num/r17_preg/); @2841
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r17_preg"); @2842
ct_rtu_encode_96  x_ct_rtu_encode_96_r17_preg (
  .x_num           (r17_preg       ),
  .x_num_expand    (r17_preg_expand)
);

// &ConnRule(s/^x_num/r18_preg/); @2843
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r18_preg"); @2844
ct_rtu_encode_96  x_ct_rtu_encode_96_r18_preg (
  .x_num           (r18_preg       ),
  .x_num_expand    (r18_preg_expand)
);

// &ConnRule(s/^x_num/r19_preg/); @2845
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r19_preg"); @2846
ct_rtu_encode_96  x_ct_rtu_encode_96_r19_preg (
  .x_num           (r19_preg       ),
  .x_num_expand    (r19_preg_expand)
);

// &ConnRule(s/^x_num/r20_preg/); @2847
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r20_preg"); @2848
ct_rtu_encode_96  x_ct_rtu_encode_96_r20_preg (
  .x_num           (r20_preg       ),
  .x_num_expand    (r20_preg_expand)
);

// &ConnRule(s/^x_num/r21_preg/); @2849
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r21_preg"); @2850
ct_rtu_encode_96  x_ct_rtu_encode_96_r21_preg (
  .x_num           (r21_preg       ),
  .x_num_expand    (r21_preg_expand)
);

// &ConnRule(s/^x_num/r22_preg/); @2851
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r22_preg"); @2852
ct_rtu_encode_96  x_ct_rtu_encode_96_r22_preg (
  .x_num           (r22_preg       ),
  .x_num_expand    (r22_preg_expand)
);

// &ConnRule(s/^x_num/r23_preg/); @2853
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r23_preg"); @2854
ct_rtu_encode_96  x_ct_rtu_encode_96_r23_preg (
  .x_num           (r23_preg       ),
  .x_num_expand    (r23_preg_expand)
);

// &ConnRule(s/^x_num/r24_preg/); @2855
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r24_preg"); @2856
ct_rtu_encode_96  x_ct_rtu_encode_96_r24_preg (
  .x_num           (r24_preg       ),
  .x_num_expand    (r24_preg_expand)
);

// &ConnRule(s/^x_num/r25_preg/); @2857
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r25_preg"); @2858
ct_rtu_encode_96  x_ct_rtu_encode_96_r25_preg (
  .x_num           (r25_preg       ),
  .x_num_expand    (r25_preg_expand)
);

// &ConnRule(s/^x_num/r26_preg/); @2859
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r26_preg"); @2860
ct_rtu_encode_96  x_ct_rtu_encode_96_r26_preg (
  .x_num           (r26_preg       ),
  .x_num_expand    (r26_preg_expand)
);

// &ConnRule(s/^x_num/r27_preg/); @2861
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r27_preg"); @2862
ct_rtu_encode_96  x_ct_rtu_encode_96_r27_preg (
  .x_num           (r27_preg       ),
  .x_num_expand    (r27_preg_expand)
);

// &ConnRule(s/^x_num/r28_preg/); @2863
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r28_preg"); @2864
ct_rtu_encode_96  x_ct_rtu_encode_96_r28_preg (
  .x_num           (r28_preg       ),
  .x_num_expand    (r28_preg_expand)
);

// &ConnRule(s/^x_num/r29_preg/); @2865
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r29_preg"); @2866
ct_rtu_encode_96  x_ct_rtu_encode_96_r29_preg (
  .x_num           (r29_preg       ),
  .x_num_expand    (r29_preg_expand)
);

// &ConnRule(s/^x_num/r30_preg/); @2867
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r30_preg"); @2868
ct_rtu_encode_96  x_ct_rtu_encode_96_r30_preg (
  .x_num           (r30_preg       ),
  .x_num_expand    (r30_preg_expand)
);

// &ConnRule(s/^x_num/r31_preg/); @2869
// &Instance("ct_rtu_encode_96","x_ct_rtu_encode_96_r31_preg"); @2870
ct_rtu_encode_96  x_ct_rtu_encode_96_r31_preg (
  .x_num           (r31_preg       ),
  .x_num_expand    (r31_preg_expand)
);


assign rtu_idu_rt_recover_preg[223:0] = {
  r31_preg[6:0], r30_preg[6:0], r29_preg[6:0], r28_preg[6:0],
  r27_preg[6:0], r26_preg[6:0], r25_preg[6:0], r24_preg[6:0],
  r23_preg[6:0], r22_preg[6:0], r21_preg[6:0], r20_preg[6:0],
  r19_preg[6:0], r18_preg[6:0], r17_preg[6:0], r16_preg[6:0],
  r15_preg[6:0], r14_preg[6:0], r13_preg[6:0], r12_preg[6:0],
  r11_preg[6:0], r10_preg[6:0], r9_preg[6:0],  r8_preg[6:0],
  r7_preg[6:0],  r6_preg[6:0],  r5_preg[6:0],  r4_preg[6:0],
  r3_preg[6:0],  r2_preg[6:0],  r1_preg[6:0],  r0_preg[6:0]};

// &Force ("nonport","pst_entry_retire_bus"); @2983
// &Force ("nonport","pst_retire_entry_num_32"); @3084
// &Force ("nonport","pst_entry_release_bus"); @3184
// &Force ("nonport","pst_entry_alloc_bus"); @3284
// &Force ("nonport","pst_entry_wf_alloc_bus"); @3384
// &Force ("nonport","pst_entry_wb_bus"); @3484
// &Force ("nonport","pst_entry_rel_retire_vld_bus"); @3584


// &ModuleEnd; @3590
endmodule


