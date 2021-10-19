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
module ct_rtu_pst_vreg(
  cp0_rtu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_rtu_ir_xreg0_alloc_vld,
  idu_rtu_ir_xreg1_alloc_vld,
  idu_rtu_ir_xreg2_alloc_vld,
  idu_rtu_ir_xreg3_alloc_vld,
  idu_rtu_ir_xreg_alloc_gateclk_vld,
  idu_rtu_pst_dis_inst0_dstv_reg,
  idu_rtu_pst_dis_inst0_rel_vreg,
  idu_rtu_pst_dis_inst0_vreg,
  idu_rtu_pst_dis_inst0_vreg_iid,
  idu_rtu_pst_dis_inst0_xreg_vld,
  idu_rtu_pst_dis_inst1_dstv_reg,
  idu_rtu_pst_dis_inst1_rel_vreg,
  idu_rtu_pst_dis_inst1_vreg,
  idu_rtu_pst_dis_inst1_vreg_iid,
  idu_rtu_pst_dis_inst1_xreg_vld,
  idu_rtu_pst_dis_inst2_dstv_reg,
  idu_rtu_pst_dis_inst2_rel_vreg,
  idu_rtu_pst_dis_inst2_vreg,
  idu_rtu_pst_dis_inst2_vreg_iid,
  idu_rtu_pst_dis_inst2_xreg_vld,
  idu_rtu_pst_dis_inst3_dstv_reg,
  idu_rtu_pst_dis_inst3_rel_vreg,
  idu_rtu_pst_dis_inst3_vreg,
  idu_rtu_pst_dis_inst3_vreg_iid,
  idu_rtu_pst_dis_inst3_xreg_vld,
  idu_rtu_pst_xreg_dealloc_mask,
  ifu_xx_sync_reset,
  lsu_rtu_wb_pipe3_wb_vreg_expand,
  lsu_rtu_wb_pipe3_wb_vreg_vld,
  pad_yy_icg_scan_en,
  pst_retired_xreg_wb,
  retire_pst_async_flush,
  retire_pst_wb_retire_inst0_vreg_vld,
  retire_pst_wb_retire_inst1_vreg_vld,
  retire_pst_wb_retire_inst2_vreg_vld,
  rob_pst_retire_inst0_gateclk_vld,
  rob_pst_retire_inst0_iid_updt_val,
  rob_pst_retire_inst1_gateclk_vld,
  rob_pst_retire_inst1_iid_updt_val,
  rob_pst_retire_inst2_gateclk_vld,
  rob_pst_retire_inst2_iid_updt_val,
  rtu_idu_alloc_xreg0,
  rtu_idu_alloc_xreg0_vld,
  rtu_idu_alloc_xreg1,
  rtu_idu_alloc_xreg1_vld,
  rtu_idu_alloc_xreg2,
  rtu_idu_alloc_xreg2_vld,
  rtu_idu_alloc_xreg3,
  rtu_idu_alloc_xreg3_vld,
  rtu_idu_rt_recover_xreg,
  rtu_yy_xx_flush,
  vfpu_rtu_ex5_pipe6_wb_vreg_expand,
  vfpu_rtu_ex5_pipe6_wb_vreg_vld,
  vfpu_rtu_ex5_pipe7_wb_vreg_expand,
  vfpu_rtu_ex5_pipe7_wb_vreg_vld
);

// &Ports; @29
input            cp0_rtu_icg_en;                     
input            cp0_yy_clk_en;                      
input            cpurst_b;                           
input            forever_cpuclk;                     
input            idu_rtu_ir_xreg0_alloc_vld;         
input            idu_rtu_ir_xreg1_alloc_vld;         
input            idu_rtu_ir_xreg2_alloc_vld;         
input            idu_rtu_ir_xreg3_alloc_vld;         
input            idu_rtu_ir_xreg_alloc_gateclk_vld;  
input   [4  :0]  idu_rtu_pst_dis_inst0_dstv_reg;     
input   [5  :0]  idu_rtu_pst_dis_inst0_rel_vreg;     
input   [5  :0]  idu_rtu_pst_dis_inst0_vreg;         
input   [6  :0]  idu_rtu_pst_dis_inst0_vreg_iid;     
input            idu_rtu_pst_dis_inst0_xreg_vld;     
input   [4  :0]  idu_rtu_pst_dis_inst1_dstv_reg;     
input   [5  :0]  idu_rtu_pst_dis_inst1_rel_vreg;     
input   [5  :0]  idu_rtu_pst_dis_inst1_vreg;         
input   [6  :0]  idu_rtu_pst_dis_inst1_vreg_iid;     
input            idu_rtu_pst_dis_inst1_xreg_vld;     
input   [4  :0]  idu_rtu_pst_dis_inst2_dstv_reg;     
input   [5  :0]  idu_rtu_pst_dis_inst2_rel_vreg;     
input   [5  :0]  idu_rtu_pst_dis_inst2_vreg;         
input   [6  :0]  idu_rtu_pst_dis_inst2_vreg_iid;     
input            idu_rtu_pst_dis_inst2_xreg_vld;     
input   [4  :0]  idu_rtu_pst_dis_inst3_dstv_reg;     
input   [5  :0]  idu_rtu_pst_dis_inst3_rel_vreg;     
input   [5  :0]  idu_rtu_pst_dis_inst3_vreg;         
input   [6  :0]  idu_rtu_pst_dis_inst3_vreg_iid;     
input            idu_rtu_pst_dis_inst3_xreg_vld;     
input   [63 :0]  idu_rtu_pst_xreg_dealloc_mask;      
input            ifu_xx_sync_reset;                  
input   [63 :0]  lsu_rtu_wb_pipe3_wb_vreg_expand;    
input            lsu_rtu_wb_pipe3_wb_vreg_vld;       
input            pad_yy_icg_scan_en;                 
input            retire_pst_async_flush;             
input            retire_pst_wb_retire_inst0_vreg_vld; 
input            retire_pst_wb_retire_inst1_vreg_vld; 
input            retire_pst_wb_retire_inst2_vreg_vld; 
input            rob_pst_retire_inst0_gateclk_vld;   
input   [6  :0]  rob_pst_retire_inst0_iid_updt_val;  
input            rob_pst_retire_inst1_gateclk_vld;   
input   [6  :0]  rob_pst_retire_inst1_iid_updt_val;  
input            rob_pst_retire_inst2_gateclk_vld;   
input   [6  :0]  rob_pst_retire_inst2_iid_updt_val;  
input            rtu_yy_xx_flush;                    
input   [63 :0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand;  
input            vfpu_rtu_ex5_pipe6_wb_vreg_vld;     
input   [63 :0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand;  
input            vfpu_rtu_ex5_pipe7_wb_vreg_vld;     
output           pst_retired_xreg_wb;                
output  [5  :0]  rtu_idu_alloc_xreg0;                
output           rtu_idu_alloc_xreg0_vld;            
output  [5  :0]  rtu_idu_alloc_xreg1;                
output           rtu_idu_alloc_xreg1_vld;            
output  [5  :0]  rtu_idu_alloc_xreg2;                
output           rtu_idu_alloc_xreg2_vld;            
output  [5  :0]  rtu_idu_alloc_xreg3;                
output           rtu_idu_alloc_xreg3_vld;            
output  [191:0]  rtu_idu_rt_recover_xreg;            

// &Regs; @30
reg     [5  :0]  alloc_vreg0;                        
reg              alloc_vreg0_vld;                    
reg     [5  :0]  alloc_vreg1;                        
reg              alloc_vreg1_vld;                    
reg     [5  :0]  alloc_vreg2;                        
reg              alloc_vreg2_vld;                    
reg     [5  :0]  alloc_vreg3;                        
reg              alloc_vreg3_vld;                    

// &Wires; @31
wire    [63 :0]  alloc_release;                      
wire             alloc_vreg0_invalid;                
wire             alloc_vreg1_invalid;                
wire             alloc_vreg2_invalid;                
wire             alloc_vreg3_invalid;                
wire             alloc_vreg_clk;                     
wire             alloc_vreg_clk_en;                  
wire             cp0_rtu_icg_en;                     
wire             cp0_yy_clk_en;                      
wire             cpurst_b;                           
wire    [63 :0]  d0_vreg;                            
wire    [63 :0]  d1_vreg;                            
wire    [63 :0]  d2_vreg;                            
wire    [63 :0]  d3_vreg;                            
wire    [63 :0]  dealloc;                            
wire    [63 :0]  dealloc0;                           
wire    [63 :0]  dealloc0_vec;                       
wire    [63 :0]  dealloc1;                           
wire    [63 :0]  dealloc1_vec;                       
wire    [63 :0]  dealloc2;                           
wire    [63 :0]  dealloc2_vec;                       
wire    [63 :0]  dealloc3;                           
wire    [63 :0]  dealloc3_vec;                       
wire    [63 :0]  dealloc_no_0;                       
wire    [63 :0]  dealloc_no_1;                       
wire    [63 :0]  dealloc_vld;                        
wire             dealloc_vld_for_gateclk;            
wire    [5  :0]  dealloc_vreg0;                      
wire    [63 :0]  dealloc_vreg0_expand;               
wire             dealloc_vreg0_vld;                  
wire    [5  :0]  dealloc_vreg1;                      
wire    [63 :0]  dealloc_vreg1_expand;               
wire             dealloc_vreg1_vld;                  
wire    [5  :0]  dealloc_vreg2;                      
wire    [63 :0]  dealloc_vreg2_expand;               
wire             dealloc_vreg2_vld;                  
wire    [5  :0]  dealloc_vreg3;                      
wire    [63 :0]  dealloc_vreg3_expand;               
wire             dealloc_vreg3_vld;                  
wire             forever_cpuclk;                     
wire             idu_rtu_ir_xreg0_alloc_vld;         
wire             idu_rtu_ir_xreg1_alloc_vld;         
wire             idu_rtu_ir_xreg2_alloc_vld;         
wire             idu_rtu_ir_xreg3_alloc_vld;         
wire             idu_rtu_ir_xreg_alloc_gateclk_vld;  
wire    [4  :0]  idu_rtu_pst_dis_inst0_dstv_reg;     
wire    [5  :0]  idu_rtu_pst_dis_inst0_rel_vreg;     
wire    [5  :0]  idu_rtu_pst_dis_inst0_vreg;         
wire    [63 :0]  idu_rtu_pst_dis_inst0_vreg_expand;  
wire    [6  :0]  idu_rtu_pst_dis_inst0_vreg_iid;     
wire             idu_rtu_pst_dis_inst0_xreg_vld;     
wire    [4  :0]  idu_rtu_pst_dis_inst1_dstv_reg;     
wire    [5  :0]  idu_rtu_pst_dis_inst1_rel_vreg;     
wire    [5  :0]  idu_rtu_pst_dis_inst1_vreg;         
wire    [63 :0]  idu_rtu_pst_dis_inst1_vreg_expand;  
wire    [6  :0]  idu_rtu_pst_dis_inst1_vreg_iid;     
wire             idu_rtu_pst_dis_inst1_xreg_vld;     
wire    [4  :0]  idu_rtu_pst_dis_inst2_dstv_reg;     
wire    [5  :0]  idu_rtu_pst_dis_inst2_rel_vreg;     
wire    [5  :0]  idu_rtu_pst_dis_inst2_vreg;         
wire    [63 :0]  idu_rtu_pst_dis_inst2_vreg_expand;  
wire    [6  :0]  idu_rtu_pst_dis_inst2_vreg_iid;     
wire             idu_rtu_pst_dis_inst2_xreg_vld;     
wire    [4  :0]  idu_rtu_pst_dis_inst3_dstv_reg;     
wire    [5  :0]  idu_rtu_pst_dis_inst3_rel_vreg;     
wire    [5  :0]  idu_rtu_pst_dis_inst3_vreg;         
wire    [63 :0]  idu_rtu_pst_dis_inst3_vreg_expand;  
wire    [6  :0]  idu_rtu_pst_dis_inst3_vreg_iid;     
wire             idu_rtu_pst_dis_inst3_xreg_vld;     
wire    [63 :0]  idu_rtu_pst_xreg_dealloc_mask;      
wire             ifu_xx_sync_reset;                  
wire    [63 :0]  lsu_rtu_wb_pipe3_wb_vreg_expand;    
wire             lsu_rtu_wb_pipe3_wb_vreg_vld;       
wire             pad_yy_icg_scan_en;                 
wire             pst_retired_xreg_wb;                
wire    [5  :0]  r0_vreg;                            
wire    [63 :0]  r0_vreg_expand;                     
wire    [5  :0]  r10_vreg;                           
wire    [63 :0]  r10_vreg_expand;                    
wire    [5  :0]  r11_vreg;                           
wire    [63 :0]  r11_vreg_expand;                    
wire    [5  :0]  r12_vreg;                           
wire    [63 :0]  r12_vreg_expand;                    
wire    [5  :0]  r13_vreg;                           
wire    [63 :0]  r13_vreg_expand;                    
wire    [5  :0]  r14_vreg;                           
wire    [63 :0]  r14_vreg_expand;                    
wire    [5  :0]  r15_vreg;                           
wire    [63 :0]  r15_vreg_expand;                    
wire    [5  :0]  r16_vreg;                           
wire    [63 :0]  r16_vreg_expand;                    
wire    [5  :0]  r17_vreg;                           
wire    [63 :0]  r17_vreg_expand;                    
wire    [5  :0]  r18_vreg;                           
wire    [63 :0]  r18_vreg_expand;                    
wire    [5  :0]  r19_vreg;                           
wire    [63 :0]  r19_vreg_expand;                    
wire    [5  :0]  r1_vreg;                            
wire    [63 :0]  r1_vreg_expand;                     
wire    [5  :0]  r20_vreg;                           
wire    [63 :0]  r20_vreg_expand;                    
wire    [5  :0]  r21_vreg;                           
wire    [63 :0]  r21_vreg_expand;                    
wire    [5  :0]  r22_vreg;                           
wire    [63 :0]  r22_vreg_expand;                    
wire    [5  :0]  r23_vreg;                           
wire    [63 :0]  r23_vreg_expand;                    
wire    [5  :0]  r24_vreg;                           
wire    [63 :0]  r24_vreg_expand;                    
wire    [5  :0]  r25_vreg;                           
wire    [63 :0]  r25_vreg_expand;                    
wire    [5  :0]  r26_vreg;                           
wire    [63 :0]  r26_vreg_expand;                    
wire    [5  :0]  r27_vreg;                           
wire    [63 :0]  r27_vreg_expand;                    
wire    [5  :0]  r28_vreg;                           
wire    [63 :0]  r28_vreg_expand;                    
wire    [5  :0]  r29_vreg;                           
wire    [63 :0]  r29_vreg_expand;                    
wire    [5  :0]  r2_vreg;                            
wire    [63 :0]  r2_vreg_expand;                     
wire    [5  :0]  r30_vreg;                           
wire    [63 :0]  r30_vreg_expand;                    
wire    [5  :0]  r31_vreg;                           
wire    [63 :0]  r31_vreg_expand;                    
wire    [5  :0]  r3_vreg;                            
wire    [63 :0]  r3_vreg_expand;                     
wire    [5  :0]  r4_vreg;                            
wire    [63 :0]  r4_vreg_expand;                     
wire    [5  :0]  r5_vreg;                            
wire    [63 :0]  r5_vreg_expand;                     
wire    [5  :0]  r6_vreg;                            
wire    [63 :0]  r6_vreg_expand;                     
wire    [5  :0]  r7_vreg;                            
wire    [63 :0]  r7_vreg_expand;                     
wire    [5  :0]  r8_vreg;                            
wire    [63 :0]  r8_vreg_expand;                     
wire    [5  :0]  r9_vreg;                            
wire    [63 :0]  r9_vreg_expand;                     
wire    [63 :0]  release_vld;                        
wire             retire_pst_async_flush;             
wire             retire_pst_wb_retire_inst0_vreg_vld; 
wire             retire_pst_wb_retire_inst1_vreg_vld; 
wire             retire_pst_wb_retire_inst2_vreg_vld; 
wire    [63 :0]  retired_released_wb;                
wire             rob_pst_retire_inst0_gateclk_vld;   
wire    [6  :0]  rob_pst_retire_inst0_iid_updt_val;  
wire             rob_pst_retire_inst1_gateclk_vld;   
wire    [6  :0]  rob_pst_retire_inst1_iid_updt_val;  
wire             rob_pst_retire_inst2_gateclk_vld;   
wire    [6  :0]  rob_pst_retire_inst2_iid_updt_val;  
wire    [5  :0]  rtu_idu_alloc_xreg0;                
wire             rtu_idu_alloc_xreg0_vld;            
wire    [5  :0]  rtu_idu_alloc_xreg1;                
wire             rtu_idu_alloc_xreg1_vld;            
wire    [5  :0]  rtu_idu_alloc_xreg2;                
wire             rtu_idu_alloc_xreg2_vld;            
wire    [5  :0]  rtu_idu_alloc_xreg3;                
wire             rtu_idu_alloc_xreg3_vld;            
wire    [191:0]  rtu_idu_rt_recover_xreg;            
wire             rtu_yy_xx_flush;                    
wire    [63 :0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand;  
wire             vfpu_rtu_ex5_pipe6_wb_vreg_vld;     
wire    [63 :0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand;  
wire             vfpu_rtu_ex5_pipe7_wb_vreg_vld;     
wire    [3  :0]  vreg0_create_vld;                   
wire             vreg0_cur_state_alloc_release;      
wire             vreg0_cur_state_dealloc;            
wire             vreg0_dealloc_mask;                 
wire             vreg0_dealloc_vld;                  
wire    [31 :0]  vreg0_dreg;                         
wire    [63 :0]  vreg0_rel_vreg_expand;              
wire             vreg0_release_vld;                  
wire    [4  :0]  vreg0_reset_dstv_reg;               
wire             vreg0_reset_mapped;                 
wire             vreg0_retired_released_wb;          
wire             vreg0_wb_vld;                       
wire    [3  :0]  vreg10_create_vld;                  
wire             vreg10_cur_state_alloc_release;     
wire             vreg10_cur_state_dealloc;           
wire             vreg10_dealloc_mask;                
wire             vreg10_dealloc_vld;                 
wire    [31 :0]  vreg10_dreg;                        
wire    [63 :0]  vreg10_rel_vreg_expand;             
wire             vreg10_release_vld;                 
wire    [4  :0]  vreg10_reset_dstv_reg;              
wire             vreg10_reset_mapped;                
wire             vreg10_retired_released_wb;         
wire             vreg10_wb_vld;                      
wire    [3  :0]  vreg11_create_vld;                  
wire             vreg11_cur_state_alloc_release;     
wire             vreg11_cur_state_dealloc;           
wire             vreg11_dealloc_mask;                
wire             vreg11_dealloc_vld;                 
wire    [31 :0]  vreg11_dreg;                        
wire    [63 :0]  vreg11_rel_vreg_expand;             
wire             vreg11_release_vld;                 
wire    [4  :0]  vreg11_reset_dstv_reg;              
wire             vreg11_reset_mapped;                
wire             vreg11_retired_released_wb;         
wire             vreg11_wb_vld;                      
wire    [3  :0]  vreg12_create_vld;                  
wire             vreg12_cur_state_alloc_release;     
wire             vreg12_cur_state_dealloc;           
wire             vreg12_dealloc_mask;                
wire             vreg12_dealloc_vld;                 
wire    [31 :0]  vreg12_dreg;                        
wire    [63 :0]  vreg12_rel_vreg_expand;             
wire             vreg12_release_vld;                 
wire    [4  :0]  vreg12_reset_dstv_reg;              
wire             vreg12_reset_mapped;                
wire             vreg12_retired_released_wb;         
wire             vreg12_wb_vld;                      
wire    [3  :0]  vreg13_create_vld;                  
wire             vreg13_cur_state_alloc_release;     
wire             vreg13_cur_state_dealloc;           
wire             vreg13_dealloc_mask;                
wire             vreg13_dealloc_vld;                 
wire    [31 :0]  vreg13_dreg;                        
wire    [63 :0]  vreg13_rel_vreg_expand;             
wire             vreg13_release_vld;                 
wire    [4  :0]  vreg13_reset_dstv_reg;              
wire             vreg13_reset_mapped;                
wire             vreg13_retired_released_wb;         
wire             vreg13_wb_vld;                      
wire    [3  :0]  vreg14_create_vld;                  
wire             vreg14_cur_state_alloc_release;     
wire             vreg14_cur_state_dealloc;           
wire             vreg14_dealloc_mask;                
wire             vreg14_dealloc_vld;                 
wire    [31 :0]  vreg14_dreg;                        
wire    [63 :0]  vreg14_rel_vreg_expand;             
wire             vreg14_release_vld;                 
wire    [4  :0]  vreg14_reset_dstv_reg;              
wire             vreg14_reset_mapped;                
wire             vreg14_retired_released_wb;         
wire             vreg14_wb_vld;                      
wire    [3  :0]  vreg15_create_vld;                  
wire             vreg15_cur_state_alloc_release;     
wire             vreg15_cur_state_dealloc;           
wire             vreg15_dealloc_mask;                
wire             vreg15_dealloc_vld;                 
wire    [31 :0]  vreg15_dreg;                        
wire    [63 :0]  vreg15_rel_vreg_expand;             
wire             vreg15_release_vld;                 
wire    [4  :0]  vreg15_reset_dstv_reg;              
wire             vreg15_reset_mapped;                
wire             vreg15_retired_released_wb;         
wire             vreg15_wb_vld;                      
wire    [3  :0]  vreg16_create_vld;                  
wire             vreg16_cur_state_alloc_release;     
wire             vreg16_cur_state_dealloc;           
wire             vreg16_dealloc_mask;                
wire             vreg16_dealloc_vld;                 
wire    [31 :0]  vreg16_dreg;                        
wire    [63 :0]  vreg16_rel_vreg_expand;             
wire             vreg16_release_vld;                 
wire    [4  :0]  vreg16_reset_dstv_reg;              
wire             vreg16_reset_mapped;                
wire             vreg16_retired_released_wb;         
wire             vreg16_wb_vld;                      
wire    [3  :0]  vreg17_create_vld;                  
wire             vreg17_cur_state_alloc_release;     
wire             vreg17_cur_state_dealloc;           
wire             vreg17_dealloc_mask;                
wire             vreg17_dealloc_vld;                 
wire    [31 :0]  vreg17_dreg;                        
wire    [63 :0]  vreg17_rel_vreg_expand;             
wire             vreg17_release_vld;                 
wire    [4  :0]  vreg17_reset_dstv_reg;              
wire             vreg17_reset_mapped;                
wire             vreg17_retired_released_wb;         
wire             vreg17_wb_vld;                      
wire    [3  :0]  vreg18_create_vld;                  
wire             vreg18_cur_state_alloc_release;     
wire             vreg18_cur_state_dealloc;           
wire             vreg18_dealloc_mask;                
wire             vreg18_dealloc_vld;                 
wire    [31 :0]  vreg18_dreg;                        
wire    [63 :0]  vreg18_rel_vreg_expand;             
wire             vreg18_release_vld;                 
wire    [4  :0]  vreg18_reset_dstv_reg;              
wire             vreg18_reset_mapped;                
wire             vreg18_retired_released_wb;         
wire             vreg18_wb_vld;                      
wire    [3  :0]  vreg19_create_vld;                  
wire             vreg19_cur_state_alloc_release;     
wire             vreg19_cur_state_dealloc;           
wire             vreg19_dealloc_mask;                
wire             vreg19_dealloc_vld;                 
wire    [31 :0]  vreg19_dreg;                        
wire    [63 :0]  vreg19_rel_vreg_expand;             
wire             vreg19_release_vld;                 
wire    [4  :0]  vreg19_reset_dstv_reg;              
wire             vreg19_reset_mapped;                
wire             vreg19_retired_released_wb;         
wire             vreg19_wb_vld;                      
wire    [3  :0]  vreg1_create_vld;                   
wire             vreg1_cur_state_alloc_release;      
wire             vreg1_cur_state_dealloc;            
wire             vreg1_dealloc_mask;                 
wire             vreg1_dealloc_vld;                  
wire    [31 :0]  vreg1_dreg;                         
wire    [63 :0]  vreg1_rel_vreg_expand;              
wire             vreg1_release_vld;                  
wire    [4  :0]  vreg1_reset_dstv_reg;               
wire             vreg1_reset_mapped;                 
wire             vreg1_retired_released_wb;          
wire             vreg1_wb_vld;                       
wire    [3  :0]  vreg20_create_vld;                  
wire             vreg20_cur_state_alloc_release;     
wire             vreg20_cur_state_dealloc;           
wire             vreg20_dealloc_mask;                
wire             vreg20_dealloc_vld;                 
wire    [31 :0]  vreg20_dreg;                        
wire    [63 :0]  vreg20_rel_vreg_expand;             
wire             vreg20_release_vld;                 
wire    [4  :0]  vreg20_reset_dstv_reg;              
wire             vreg20_reset_mapped;                
wire             vreg20_retired_released_wb;         
wire             vreg20_wb_vld;                      
wire    [3  :0]  vreg21_create_vld;                  
wire             vreg21_cur_state_alloc_release;     
wire             vreg21_cur_state_dealloc;           
wire             vreg21_dealloc_mask;                
wire             vreg21_dealloc_vld;                 
wire    [31 :0]  vreg21_dreg;                        
wire    [63 :0]  vreg21_rel_vreg_expand;             
wire             vreg21_release_vld;                 
wire    [4  :0]  vreg21_reset_dstv_reg;              
wire             vreg21_reset_mapped;                
wire             vreg21_retired_released_wb;         
wire             vreg21_wb_vld;                      
wire    [3  :0]  vreg22_create_vld;                  
wire             vreg22_cur_state_alloc_release;     
wire             vreg22_cur_state_dealloc;           
wire             vreg22_dealloc_mask;                
wire             vreg22_dealloc_vld;                 
wire    [31 :0]  vreg22_dreg;                        
wire    [63 :0]  vreg22_rel_vreg_expand;             
wire             vreg22_release_vld;                 
wire    [4  :0]  vreg22_reset_dstv_reg;              
wire             vreg22_reset_mapped;                
wire             vreg22_retired_released_wb;         
wire             vreg22_wb_vld;                      
wire    [3  :0]  vreg23_create_vld;                  
wire             vreg23_cur_state_alloc_release;     
wire             vreg23_cur_state_dealloc;           
wire             vreg23_dealloc_mask;                
wire             vreg23_dealloc_vld;                 
wire    [31 :0]  vreg23_dreg;                        
wire    [63 :0]  vreg23_rel_vreg_expand;             
wire             vreg23_release_vld;                 
wire    [4  :0]  vreg23_reset_dstv_reg;              
wire             vreg23_reset_mapped;                
wire             vreg23_retired_released_wb;         
wire             vreg23_wb_vld;                      
wire    [3  :0]  vreg24_create_vld;                  
wire             vreg24_cur_state_alloc_release;     
wire             vreg24_cur_state_dealloc;           
wire             vreg24_dealloc_mask;                
wire             vreg24_dealloc_vld;                 
wire    [31 :0]  vreg24_dreg;                        
wire    [63 :0]  vreg24_rel_vreg_expand;             
wire             vreg24_release_vld;                 
wire    [4  :0]  vreg24_reset_dstv_reg;              
wire             vreg24_reset_mapped;                
wire             vreg24_retired_released_wb;         
wire             vreg24_wb_vld;                      
wire    [3  :0]  vreg25_create_vld;                  
wire             vreg25_cur_state_alloc_release;     
wire             vreg25_cur_state_dealloc;           
wire             vreg25_dealloc_mask;                
wire             vreg25_dealloc_vld;                 
wire    [31 :0]  vreg25_dreg;                        
wire    [63 :0]  vreg25_rel_vreg_expand;             
wire             vreg25_release_vld;                 
wire    [4  :0]  vreg25_reset_dstv_reg;              
wire             vreg25_reset_mapped;                
wire             vreg25_retired_released_wb;         
wire             vreg25_wb_vld;                      
wire    [3  :0]  vreg26_create_vld;                  
wire             vreg26_cur_state_alloc_release;     
wire             vreg26_cur_state_dealloc;           
wire             vreg26_dealloc_mask;                
wire             vreg26_dealloc_vld;                 
wire    [31 :0]  vreg26_dreg;                        
wire    [63 :0]  vreg26_rel_vreg_expand;             
wire             vreg26_release_vld;                 
wire    [4  :0]  vreg26_reset_dstv_reg;              
wire             vreg26_reset_mapped;                
wire             vreg26_retired_released_wb;         
wire             vreg26_wb_vld;                      
wire    [3  :0]  vreg27_create_vld;                  
wire             vreg27_cur_state_alloc_release;     
wire             vreg27_cur_state_dealloc;           
wire             vreg27_dealloc_mask;                
wire             vreg27_dealloc_vld;                 
wire    [31 :0]  vreg27_dreg;                        
wire    [63 :0]  vreg27_rel_vreg_expand;             
wire             vreg27_release_vld;                 
wire    [4  :0]  vreg27_reset_dstv_reg;              
wire             vreg27_reset_mapped;                
wire             vreg27_retired_released_wb;         
wire             vreg27_wb_vld;                      
wire    [3  :0]  vreg28_create_vld;                  
wire             vreg28_cur_state_alloc_release;     
wire             vreg28_cur_state_dealloc;           
wire             vreg28_dealloc_mask;                
wire             vreg28_dealloc_vld;                 
wire    [31 :0]  vreg28_dreg;                        
wire    [63 :0]  vreg28_rel_vreg_expand;             
wire             vreg28_release_vld;                 
wire    [4  :0]  vreg28_reset_dstv_reg;              
wire             vreg28_reset_mapped;                
wire             vreg28_retired_released_wb;         
wire             vreg28_wb_vld;                      
wire    [3  :0]  vreg29_create_vld;                  
wire             vreg29_cur_state_alloc_release;     
wire             vreg29_cur_state_dealloc;           
wire             vreg29_dealloc_mask;                
wire             vreg29_dealloc_vld;                 
wire    [31 :0]  vreg29_dreg;                        
wire    [63 :0]  vreg29_rel_vreg_expand;             
wire             vreg29_release_vld;                 
wire    [4  :0]  vreg29_reset_dstv_reg;              
wire             vreg29_reset_mapped;                
wire             vreg29_retired_released_wb;         
wire             vreg29_wb_vld;                      
wire    [3  :0]  vreg2_create_vld;                   
wire             vreg2_cur_state_alloc_release;      
wire             vreg2_cur_state_dealloc;            
wire             vreg2_dealloc_mask;                 
wire             vreg2_dealloc_vld;                  
wire    [31 :0]  vreg2_dreg;                         
wire    [63 :0]  vreg2_rel_vreg_expand;              
wire             vreg2_release_vld;                  
wire    [4  :0]  vreg2_reset_dstv_reg;               
wire             vreg2_reset_mapped;                 
wire             vreg2_retired_released_wb;          
wire             vreg2_wb_vld;                       
wire    [3  :0]  vreg30_create_vld;                  
wire             vreg30_cur_state_alloc_release;     
wire             vreg30_cur_state_dealloc;           
wire             vreg30_dealloc_mask;                
wire             vreg30_dealloc_vld;                 
wire    [31 :0]  vreg30_dreg;                        
wire    [63 :0]  vreg30_rel_vreg_expand;             
wire             vreg30_release_vld;                 
wire    [4  :0]  vreg30_reset_dstv_reg;              
wire             vreg30_reset_mapped;                
wire             vreg30_retired_released_wb;         
wire             vreg30_wb_vld;                      
wire    [3  :0]  vreg31_create_vld;                  
wire             vreg31_cur_state_alloc_release;     
wire             vreg31_cur_state_dealloc;           
wire             vreg31_dealloc_mask;                
wire             vreg31_dealloc_vld;                 
wire    [31 :0]  vreg31_dreg;                        
wire    [63 :0]  vreg31_rel_vreg_expand;             
wire             vreg31_release_vld;                 
wire    [4  :0]  vreg31_reset_dstv_reg;              
wire             vreg31_reset_mapped;                
wire             vreg31_retired_released_wb;         
wire             vreg31_wb_vld;                      
wire    [3  :0]  vreg32_create_vld;                  
wire             vreg32_cur_state_alloc_release;     
wire             vreg32_cur_state_dealloc;           
wire             vreg32_dealloc_mask;                
wire             vreg32_dealloc_vld;                 
wire    [31 :0]  vreg32_dreg;                        
wire    [63 :0]  vreg32_rel_vreg_expand;             
wire             vreg32_release_vld;                 
wire    [4  :0]  vreg32_reset_dstv_reg;              
wire             vreg32_reset_mapped;                
wire             vreg32_retired_released_wb;         
wire             vreg32_wb_vld;                      
wire    [3  :0]  vreg33_create_vld;                  
wire             vreg33_cur_state_alloc_release;     
wire             vreg33_cur_state_dealloc;           
wire             vreg33_dealloc_mask;                
wire             vreg33_dealloc_vld;                 
wire    [31 :0]  vreg33_dreg;                        
wire    [63 :0]  vreg33_rel_vreg_expand;             
wire             vreg33_release_vld;                 
wire    [4  :0]  vreg33_reset_dstv_reg;              
wire             vreg33_reset_mapped;                
wire             vreg33_retired_released_wb;         
wire             vreg33_wb_vld;                      
wire    [3  :0]  vreg34_create_vld;                  
wire             vreg34_cur_state_alloc_release;     
wire             vreg34_cur_state_dealloc;           
wire             vreg34_dealloc_mask;                
wire             vreg34_dealloc_vld;                 
wire    [31 :0]  vreg34_dreg;                        
wire    [63 :0]  vreg34_rel_vreg_expand;             
wire             vreg34_release_vld;                 
wire    [4  :0]  vreg34_reset_dstv_reg;              
wire             vreg34_reset_mapped;                
wire             vreg34_retired_released_wb;         
wire             vreg34_wb_vld;                      
wire    [3  :0]  vreg35_create_vld;                  
wire             vreg35_cur_state_alloc_release;     
wire             vreg35_cur_state_dealloc;           
wire             vreg35_dealloc_mask;                
wire             vreg35_dealloc_vld;                 
wire    [31 :0]  vreg35_dreg;                        
wire    [63 :0]  vreg35_rel_vreg_expand;             
wire             vreg35_release_vld;                 
wire    [4  :0]  vreg35_reset_dstv_reg;              
wire             vreg35_reset_mapped;                
wire             vreg35_retired_released_wb;         
wire             vreg35_wb_vld;                      
wire    [3  :0]  vreg36_create_vld;                  
wire             vreg36_cur_state_alloc_release;     
wire             vreg36_cur_state_dealloc;           
wire             vreg36_dealloc_mask;                
wire             vreg36_dealloc_vld;                 
wire    [31 :0]  vreg36_dreg;                        
wire    [63 :0]  vreg36_rel_vreg_expand;             
wire             vreg36_release_vld;                 
wire    [4  :0]  vreg36_reset_dstv_reg;              
wire             vreg36_reset_mapped;                
wire             vreg36_retired_released_wb;         
wire             vreg36_wb_vld;                      
wire    [3  :0]  vreg37_create_vld;                  
wire             vreg37_cur_state_alloc_release;     
wire             vreg37_cur_state_dealloc;           
wire             vreg37_dealloc_mask;                
wire             vreg37_dealloc_vld;                 
wire    [31 :0]  vreg37_dreg;                        
wire    [63 :0]  vreg37_rel_vreg_expand;             
wire             vreg37_release_vld;                 
wire    [4  :0]  vreg37_reset_dstv_reg;              
wire             vreg37_reset_mapped;                
wire             vreg37_retired_released_wb;         
wire             vreg37_wb_vld;                      
wire    [3  :0]  vreg38_create_vld;                  
wire             vreg38_cur_state_alloc_release;     
wire             vreg38_cur_state_dealloc;           
wire             vreg38_dealloc_mask;                
wire             vreg38_dealloc_vld;                 
wire    [31 :0]  vreg38_dreg;                        
wire    [63 :0]  vreg38_rel_vreg_expand;             
wire             vreg38_release_vld;                 
wire    [4  :0]  vreg38_reset_dstv_reg;              
wire             vreg38_reset_mapped;                
wire             vreg38_retired_released_wb;         
wire             vreg38_wb_vld;                      
wire    [3  :0]  vreg39_create_vld;                  
wire             vreg39_cur_state_alloc_release;     
wire             vreg39_cur_state_dealloc;           
wire             vreg39_dealloc_mask;                
wire             vreg39_dealloc_vld;                 
wire    [31 :0]  vreg39_dreg;                        
wire    [63 :0]  vreg39_rel_vreg_expand;             
wire             vreg39_release_vld;                 
wire    [4  :0]  vreg39_reset_dstv_reg;              
wire             vreg39_reset_mapped;                
wire             vreg39_retired_released_wb;         
wire             vreg39_wb_vld;                      
wire    [3  :0]  vreg3_create_vld;                   
wire             vreg3_cur_state_alloc_release;      
wire             vreg3_cur_state_dealloc;            
wire             vreg3_dealloc_mask;                 
wire             vreg3_dealloc_vld;                  
wire    [31 :0]  vreg3_dreg;                         
wire    [63 :0]  vreg3_rel_vreg_expand;              
wire             vreg3_release_vld;                  
wire    [4  :0]  vreg3_reset_dstv_reg;               
wire             vreg3_reset_mapped;                 
wire             vreg3_retired_released_wb;          
wire             vreg3_wb_vld;                       
wire    [3  :0]  vreg40_create_vld;                  
wire             vreg40_cur_state_alloc_release;     
wire             vreg40_cur_state_dealloc;           
wire             vreg40_dealloc_mask;                
wire             vreg40_dealloc_vld;                 
wire    [31 :0]  vreg40_dreg;                        
wire    [63 :0]  vreg40_rel_vreg_expand;             
wire             vreg40_release_vld;                 
wire    [4  :0]  vreg40_reset_dstv_reg;              
wire             vreg40_reset_mapped;                
wire             vreg40_retired_released_wb;         
wire             vreg40_wb_vld;                      
wire    [3  :0]  vreg41_create_vld;                  
wire             vreg41_cur_state_alloc_release;     
wire             vreg41_cur_state_dealloc;           
wire             vreg41_dealloc_mask;                
wire             vreg41_dealloc_vld;                 
wire    [31 :0]  vreg41_dreg;                        
wire    [63 :0]  vreg41_rel_vreg_expand;             
wire             vreg41_release_vld;                 
wire    [4  :0]  vreg41_reset_dstv_reg;              
wire             vreg41_reset_mapped;                
wire             vreg41_retired_released_wb;         
wire             vreg41_wb_vld;                      
wire    [3  :0]  vreg42_create_vld;                  
wire             vreg42_cur_state_alloc_release;     
wire             vreg42_cur_state_dealloc;           
wire             vreg42_dealloc_mask;                
wire             vreg42_dealloc_vld;                 
wire    [31 :0]  vreg42_dreg;                        
wire    [63 :0]  vreg42_rel_vreg_expand;             
wire             vreg42_release_vld;                 
wire    [4  :0]  vreg42_reset_dstv_reg;              
wire             vreg42_reset_mapped;                
wire             vreg42_retired_released_wb;         
wire             vreg42_wb_vld;                      
wire    [3  :0]  vreg43_create_vld;                  
wire             vreg43_cur_state_alloc_release;     
wire             vreg43_cur_state_dealloc;           
wire             vreg43_dealloc_mask;                
wire             vreg43_dealloc_vld;                 
wire    [31 :0]  vreg43_dreg;                        
wire    [63 :0]  vreg43_rel_vreg_expand;             
wire             vreg43_release_vld;                 
wire    [4  :0]  vreg43_reset_dstv_reg;              
wire             vreg43_reset_mapped;                
wire             vreg43_retired_released_wb;         
wire             vreg43_wb_vld;                      
wire    [3  :0]  vreg44_create_vld;                  
wire             vreg44_cur_state_alloc_release;     
wire             vreg44_cur_state_dealloc;           
wire             vreg44_dealloc_mask;                
wire             vreg44_dealloc_vld;                 
wire    [31 :0]  vreg44_dreg;                        
wire    [63 :0]  vreg44_rel_vreg_expand;             
wire             vreg44_release_vld;                 
wire    [4  :0]  vreg44_reset_dstv_reg;              
wire             vreg44_reset_mapped;                
wire             vreg44_retired_released_wb;         
wire             vreg44_wb_vld;                      
wire    [3  :0]  vreg45_create_vld;                  
wire             vreg45_cur_state_alloc_release;     
wire             vreg45_cur_state_dealloc;           
wire             vreg45_dealloc_mask;                
wire             vreg45_dealloc_vld;                 
wire    [31 :0]  vreg45_dreg;                        
wire    [63 :0]  vreg45_rel_vreg_expand;             
wire             vreg45_release_vld;                 
wire    [4  :0]  vreg45_reset_dstv_reg;              
wire             vreg45_reset_mapped;                
wire             vreg45_retired_released_wb;         
wire             vreg45_wb_vld;                      
wire    [3  :0]  vreg46_create_vld;                  
wire             vreg46_cur_state_alloc_release;     
wire             vreg46_cur_state_dealloc;           
wire             vreg46_dealloc_mask;                
wire             vreg46_dealloc_vld;                 
wire    [31 :0]  vreg46_dreg;                        
wire    [63 :0]  vreg46_rel_vreg_expand;             
wire             vreg46_release_vld;                 
wire    [4  :0]  vreg46_reset_dstv_reg;              
wire             vreg46_reset_mapped;                
wire             vreg46_retired_released_wb;         
wire             vreg46_wb_vld;                      
wire    [3  :0]  vreg47_create_vld;                  
wire             vreg47_cur_state_alloc_release;     
wire             vreg47_cur_state_dealloc;           
wire             vreg47_dealloc_mask;                
wire             vreg47_dealloc_vld;                 
wire    [31 :0]  vreg47_dreg;                        
wire    [63 :0]  vreg47_rel_vreg_expand;             
wire             vreg47_release_vld;                 
wire    [4  :0]  vreg47_reset_dstv_reg;              
wire             vreg47_reset_mapped;                
wire             vreg47_retired_released_wb;         
wire             vreg47_wb_vld;                      
wire    [3  :0]  vreg48_create_vld;                  
wire             vreg48_cur_state_alloc_release;     
wire             vreg48_cur_state_dealloc;           
wire             vreg48_dealloc_mask;                
wire             vreg48_dealloc_vld;                 
wire    [31 :0]  vreg48_dreg;                        
wire    [63 :0]  vreg48_rel_vreg_expand;             
wire             vreg48_release_vld;                 
wire    [4  :0]  vreg48_reset_dstv_reg;              
wire             vreg48_reset_mapped;                
wire             vreg48_retired_released_wb;         
wire             vreg48_wb_vld;                      
wire    [3  :0]  vreg49_create_vld;                  
wire             vreg49_cur_state_alloc_release;     
wire             vreg49_cur_state_dealloc;           
wire             vreg49_dealloc_mask;                
wire             vreg49_dealloc_vld;                 
wire    [31 :0]  vreg49_dreg;                        
wire    [63 :0]  vreg49_rel_vreg_expand;             
wire             vreg49_release_vld;                 
wire    [4  :0]  vreg49_reset_dstv_reg;              
wire             vreg49_reset_mapped;                
wire             vreg49_retired_released_wb;         
wire             vreg49_wb_vld;                      
wire    [3  :0]  vreg4_create_vld;                   
wire             vreg4_cur_state_alloc_release;      
wire             vreg4_cur_state_dealloc;            
wire             vreg4_dealloc_mask;                 
wire             vreg4_dealloc_vld;                  
wire    [31 :0]  vreg4_dreg;                         
wire    [63 :0]  vreg4_rel_vreg_expand;              
wire             vreg4_release_vld;                  
wire    [4  :0]  vreg4_reset_dstv_reg;               
wire             vreg4_reset_mapped;                 
wire             vreg4_retired_released_wb;          
wire             vreg4_wb_vld;                       
wire    [3  :0]  vreg50_create_vld;                  
wire             vreg50_cur_state_alloc_release;     
wire             vreg50_cur_state_dealloc;           
wire             vreg50_dealloc_mask;                
wire             vreg50_dealloc_vld;                 
wire    [31 :0]  vreg50_dreg;                        
wire    [63 :0]  vreg50_rel_vreg_expand;             
wire             vreg50_release_vld;                 
wire    [4  :0]  vreg50_reset_dstv_reg;              
wire             vreg50_reset_mapped;                
wire             vreg50_retired_released_wb;         
wire             vreg50_wb_vld;                      
wire    [3  :0]  vreg51_create_vld;                  
wire             vreg51_cur_state_alloc_release;     
wire             vreg51_cur_state_dealloc;           
wire             vreg51_dealloc_mask;                
wire             vreg51_dealloc_vld;                 
wire    [31 :0]  vreg51_dreg;                        
wire    [63 :0]  vreg51_rel_vreg_expand;             
wire             vreg51_release_vld;                 
wire    [4  :0]  vreg51_reset_dstv_reg;              
wire             vreg51_reset_mapped;                
wire             vreg51_retired_released_wb;         
wire             vreg51_wb_vld;                      
wire    [3  :0]  vreg52_create_vld;                  
wire             vreg52_cur_state_alloc_release;     
wire             vreg52_cur_state_dealloc;           
wire             vreg52_dealloc_mask;                
wire             vreg52_dealloc_vld;                 
wire    [31 :0]  vreg52_dreg;                        
wire    [63 :0]  vreg52_rel_vreg_expand;             
wire             vreg52_release_vld;                 
wire    [4  :0]  vreg52_reset_dstv_reg;              
wire             vreg52_reset_mapped;                
wire             vreg52_retired_released_wb;         
wire             vreg52_wb_vld;                      
wire    [3  :0]  vreg53_create_vld;                  
wire             vreg53_cur_state_alloc_release;     
wire             vreg53_cur_state_dealloc;           
wire             vreg53_dealloc_mask;                
wire             vreg53_dealloc_vld;                 
wire    [31 :0]  vreg53_dreg;                        
wire    [63 :0]  vreg53_rel_vreg_expand;             
wire             vreg53_release_vld;                 
wire    [4  :0]  vreg53_reset_dstv_reg;              
wire             vreg53_reset_mapped;                
wire             vreg53_retired_released_wb;         
wire             vreg53_wb_vld;                      
wire    [3  :0]  vreg54_create_vld;                  
wire             vreg54_cur_state_alloc_release;     
wire             vreg54_cur_state_dealloc;           
wire             vreg54_dealloc_mask;                
wire             vreg54_dealloc_vld;                 
wire    [31 :0]  vreg54_dreg;                        
wire    [63 :0]  vreg54_rel_vreg_expand;             
wire             vreg54_release_vld;                 
wire    [4  :0]  vreg54_reset_dstv_reg;              
wire             vreg54_reset_mapped;                
wire             vreg54_retired_released_wb;         
wire             vreg54_wb_vld;                      
wire    [3  :0]  vreg55_create_vld;                  
wire             vreg55_cur_state_alloc_release;     
wire             vreg55_cur_state_dealloc;           
wire             vreg55_dealloc_mask;                
wire             vreg55_dealloc_vld;                 
wire    [31 :0]  vreg55_dreg;                        
wire    [63 :0]  vreg55_rel_vreg_expand;             
wire             vreg55_release_vld;                 
wire    [4  :0]  vreg55_reset_dstv_reg;              
wire             vreg55_reset_mapped;                
wire             vreg55_retired_released_wb;         
wire             vreg55_wb_vld;                      
wire    [3  :0]  vreg56_create_vld;                  
wire             vreg56_cur_state_alloc_release;     
wire             vreg56_cur_state_dealloc;           
wire             vreg56_dealloc_mask;                
wire             vreg56_dealloc_vld;                 
wire    [31 :0]  vreg56_dreg;                        
wire    [63 :0]  vreg56_rel_vreg_expand;             
wire             vreg56_release_vld;                 
wire    [4  :0]  vreg56_reset_dstv_reg;              
wire             vreg56_reset_mapped;                
wire             vreg56_retired_released_wb;         
wire             vreg56_wb_vld;                      
wire    [3  :0]  vreg57_create_vld;                  
wire             vreg57_cur_state_alloc_release;     
wire             vreg57_cur_state_dealloc;           
wire             vreg57_dealloc_mask;                
wire             vreg57_dealloc_vld;                 
wire    [31 :0]  vreg57_dreg;                        
wire    [63 :0]  vreg57_rel_vreg_expand;             
wire             vreg57_release_vld;                 
wire    [4  :0]  vreg57_reset_dstv_reg;              
wire             vreg57_reset_mapped;                
wire             vreg57_retired_released_wb;         
wire             vreg57_wb_vld;                      
wire    [3  :0]  vreg58_create_vld;                  
wire             vreg58_cur_state_alloc_release;     
wire             vreg58_cur_state_dealloc;           
wire             vreg58_dealloc_mask;                
wire             vreg58_dealloc_vld;                 
wire    [31 :0]  vreg58_dreg;                        
wire    [63 :0]  vreg58_rel_vreg_expand;             
wire             vreg58_release_vld;                 
wire    [4  :0]  vreg58_reset_dstv_reg;              
wire             vreg58_reset_mapped;                
wire             vreg58_retired_released_wb;         
wire             vreg58_wb_vld;                      
wire    [3  :0]  vreg59_create_vld;                  
wire             vreg59_cur_state_alloc_release;     
wire             vreg59_cur_state_dealloc;           
wire             vreg59_dealloc_mask;                
wire             vreg59_dealloc_vld;                 
wire    [31 :0]  vreg59_dreg;                        
wire    [63 :0]  vreg59_rel_vreg_expand;             
wire             vreg59_release_vld;                 
wire    [4  :0]  vreg59_reset_dstv_reg;              
wire             vreg59_reset_mapped;                
wire             vreg59_retired_released_wb;         
wire             vreg59_wb_vld;                      
wire    [3  :0]  vreg5_create_vld;                   
wire             vreg5_cur_state_alloc_release;      
wire             vreg5_cur_state_dealloc;            
wire             vreg5_dealloc_mask;                 
wire             vreg5_dealloc_vld;                  
wire    [31 :0]  vreg5_dreg;                         
wire    [63 :0]  vreg5_rel_vreg_expand;              
wire             vreg5_release_vld;                  
wire    [4  :0]  vreg5_reset_dstv_reg;               
wire             vreg5_reset_mapped;                 
wire             vreg5_retired_released_wb;          
wire             vreg5_wb_vld;                       
wire    [3  :0]  vreg60_create_vld;                  
wire             vreg60_cur_state_alloc_release;     
wire             vreg60_cur_state_dealloc;           
wire             vreg60_dealloc_mask;                
wire             vreg60_dealloc_vld;                 
wire    [31 :0]  vreg60_dreg;                        
wire    [63 :0]  vreg60_rel_vreg_expand;             
wire             vreg60_release_vld;                 
wire    [4  :0]  vreg60_reset_dstv_reg;              
wire             vreg60_reset_mapped;                
wire             vreg60_retired_released_wb;         
wire             vreg60_wb_vld;                      
wire    [3  :0]  vreg61_create_vld;                  
wire             vreg61_cur_state_alloc_release;     
wire             vreg61_cur_state_dealloc;           
wire             vreg61_dealloc_mask;                
wire             vreg61_dealloc_vld;                 
wire    [31 :0]  vreg61_dreg;                        
wire    [63 :0]  vreg61_rel_vreg_expand;             
wire             vreg61_release_vld;                 
wire    [4  :0]  vreg61_reset_dstv_reg;              
wire             vreg61_reset_mapped;                
wire             vreg61_retired_released_wb;         
wire             vreg61_wb_vld;                      
wire    [3  :0]  vreg62_create_vld;                  
wire             vreg62_cur_state_alloc_release;     
wire             vreg62_cur_state_dealloc;           
wire             vreg62_dealloc_mask;                
wire             vreg62_dealloc_vld;                 
wire    [31 :0]  vreg62_dreg;                        
wire    [63 :0]  vreg62_rel_vreg_expand;             
wire             vreg62_release_vld;                 
wire    [4  :0]  vreg62_reset_dstv_reg;              
wire             vreg62_reset_mapped;                
wire             vreg62_retired_released_wb;         
wire             vreg62_wb_vld;                      
wire    [3  :0]  vreg63_create_vld;                  
wire             vreg63_cur_state_alloc_release;     
wire             vreg63_cur_state_dealloc;           
wire             vreg63_dealloc_mask;                
wire             vreg63_dealloc_vld;                 
wire    [31 :0]  vreg63_dreg;                        
wire    [63 :0]  vreg63_rel_vreg_expand;             
wire             vreg63_release_vld;                 
wire    [4  :0]  vreg63_reset_dstv_reg;              
wire             vreg63_reset_mapped;                
wire             vreg63_retired_released_wb;         
wire             vreg63_wb_vld;                      
wire    [3  :0]  vreg6_create_vld;                   
wire             vreg6_cur_state_alloc_release;      
wire             vreg6_cur_state_dealloc;            
wire             vreg6_dealloc_mask;                 
wire             vreg6_dealloc_vld;                  
wire    [31 :0]  vreg6_dreg;                         
wire    [63 :0]  vreg6_rel_vreg_expand;              
wire             vreg6_release_vld;                  
wire    [4  :0]  vreg6_reset_dstv_reg;               
wire             vreg6_reset_mapped;                 
wire             vreg6_retired_released_wb;          
wire             vreg6_wb_vld;                       
wire    [3  :0]  vreg7_create_vld;                   
wire             vreg7_cur_state_alloc_release;      
wire             vreg7_cur_state_dealloc;            
wire             vreg7_dealloc_mask;                 
wire             vreg7_dealloc_vld;                  
wire    [31 :0]  vreg7_dreg;                         
wire    [63 :0]  vreg7_rel_vreg_expand;              
wire             vreg7_release_vld;                  
wire    [4  :0]  vreg7_reset_dstv_reg;               
wire             vreg7_reset_mapped;                 
wire             vreg7_retired_released_wb;          
wire             vreg7_wb_vld;                       
wire    [3  :0]  vreg8_create_vld;                   
wire             vreg8_cur_state_alloc_release;      
wire             vreg8_cur_state_dealloc;            
wire             vreg8_dealloc_mask;                 
wire             vreg8_dealloc_vld;                  
wire    [31 :0]  vreg8_dreg;                         
wire    [63 :0]  vreg8_rel_vreg_expand;              
wire             vreg8_release_vld;                  
wire    [4  :0]  vreg8_reset_dstv_reg;               
wire             vreg8_reset_mapped;                 
wire             vreg8_retired_released_wb;          
wire             vreg8_wb_vld;                       
wire    [3  :0]  vreg9_create_vld;                   
wire             vreg9_cur_state_alloc_release;      
wire             vreg9_cur_state_dealloc;            
wire             vreg9_dealloc_mask;                 
wire             vreg9_dealloc_vld;                  
wire    [31 :0]  vreg9_dreg;                         
wire    [63 :0]  vreg9_rel_vreg_expand;              
wire             vreg9_release_vld;                  
wire    [4  :0]  vreg9_reset_dstv_reg;               
wire             vreg9_reset_mapped;                 
wire             vreg9_retired_released_wb;          
wire             vreg9_wb_vld;                       
wire             vreg_alloc_release;                 
wire             vreg_clk_en;                        
wire             vreg_top_clk;                       
wire    [63 :0]  wb_vld;                             


//==========================================================
//                 Top Mudule Gated Cell
//==========================================================
//if release_vld, there must be a reg retire_vld, which means
//retiring reg is in alloc state, so can ignore release_vld here
assign vreg_clk_en = rtu_yy_xx_flush
                     || retire_pst_async_flush
                     || ifu_xx_sync_reset
                     || dealloc_vld_for_gateclk
                     || vfpu_rtu_ex5_pipe6_wb_vreg_vld
                     || vfpu_rtu_ex5_pipe7_wb_vreg_vld
                     || lsu_rtu_wb_pipe3_wb_vreg_vld
                     || idu_rtu_pst_dis_inst0_xreg_vld
                     || idu_rtu_pst_dis_inst1_xreg_vld
                     || idu_rtu_pst_dis_inst2_xreg_vld
                     || idu_rtu_pst_dis_inst3_xreg_vld
                     || vreg_alloc_release;

// &Instance("gated_clk_cell", "x_vreg_gated_clk"); @51
gated_clk_cell  x_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vreg_top_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vreg_clk_en       ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @52
//          .external_en (1'b0), @53
//          .global_en   (cp0_yy_clk_en), @54
//          .module_en   (cp0_rtu_icg_en), @55
//          .local_en    (vreg_clk_en), @56
//          .clk_out     (vreg_top_clk)); @57

//==========================================================
//                   Instance Entries
//==========================================================
//----------------------------------------------------------
//              VGPR Physical Regsiters (Vreg)
//----------------------------------------------------------
// &ConnRule(s/^x_/vreg0_/); @65
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg0"); @66
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg0 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg0_create_vld                   ),
  .x_cur_state_alloc_release           (vreg0_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg0_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg0_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg0_dealloc_vld                  ),
  .x_dreg                              (vreg0_dreg                         ),
  .x_rel_vreg_expand                   (vreg0_rel_vreg_expand              ),
  .x_release_vld                       (vreg0_release_vld                  ),
  .x_reset_dstv_reg                    (vreg0_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg0_reset_mapped                 ),
  .x_retired_released_wb               (vreg0_retired_released_wb          ),
  .x_wb_vld                            (vreg0_wb_vld                       )
);

// &ConnRule(s/^x_/vreg1_/); @67
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg1"); @68
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg1 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg1_create_vld                   ),
  .x_cur_state_alloc_release           (vreg1_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg1_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg1_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg1_dealloc_vld                  ),
  .x_dreg                              (vreg1_dreg                         ),
  .x_rel_vreg_expand                   (vreg1_rel_vreg_expand              ),
  .x_release_vld                       (vreg1_release_vld                  ),
  .x_reset_dstv_reg                    (vreg1_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg1_reset_mapped                 ),
  .x_retired_released_wb               (vreg1_retired_released_wb          ),
  .x_wb_vld                            (vreg1_wb_vld                       )
);

// &ConnRule(s/^x_/vreg2_/); @69
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg2"); @70
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg2 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg2_create_vld                   ),
  .x_cur_state_alloc_release           (vreg2_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg2_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg2_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg2_dealloc_vld                  ),
  .x_dreg                              (vreg2_dreg                         ),
  .x_rel_vreg_expand                   (vreg2_rel_vreg_expand              ),
  .x_release_vld                       (vreg2_release_vld                  ),
  .x_reset_dstv_reg                    (vreg2_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg2_reset_mapped                 ),
  .x_retired_released_wb               (vreg2_retired_released_wb          ),
  .x_wb_vld                            (vreg2_wb_vld                       )
);

// &ConnRule(s/^x_/vreg3_/); @71
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg3"); @72
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg3 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg3_create_vld                   ),
  .x_cur_state_alloc_release           (vreg3_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg3_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg3_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg3_dealloc_vld                  ),
  .x_dreg                              (vreg3_dreg                         ),
  .x_rel_vreg_expand                   (vreg3_rel_vreg_expand              ),
  .x_release_vld                       (vreg3_release_vld                  ),
  .x_reset_dstv_reg                    (vreg3_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg3_reset_mapped                 ),
  .x_retired_released_wb               (vreg3_retired_released_wb          ),
  .x_wb_vld                            (vreg3_wb_vld                       )
);

// &ConnRule(s/^x_/vreg4_/); @73
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg4"); @74
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg4 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg4_create_vld                   ),
  .x_cur_state_alloc_release           (vreg4_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg4_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg4_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg4_dealloc_vld                  ),
  .x_dreg                              (vreg4_dreg                         ),
  .x_rel_vreg_expand                   (vreg4_rel_vreg_expand              ),
  .x_release_vld                       (vreg4_release_vld                  ),
  .x_reset_dstv_reg                    (vreg4_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg4_reset_mapped                 ),
  .x_retired_released_wb               (vreg4_retired_released_wb          ),
  .x_wb_vld                            (vreg4_wb_vld                       )
);

// &ConnRule(s/^x_/vreg5_/); @75
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg5"); @76
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg5 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg5_create_vld                   ),
  .x_cur_state_alloc_release           (vreg5_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg5_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg5_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg5_dealloc_vld                  ),
  .x_dreg                              (vreg5_dreg                         ),
  .x_rel_vreg_expand                   (vreg5_rel_vreg_expand              ),
  .x_release_vld                       (vreg5_release_vld                  ),
  .x_reset_dstv_reg                    (vreg5_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg5_reset_mapped                 ),
  .x_retired_released_wb               (vreg5_retired_released_wb          ),
  .x_wb_vld                            (vreg5_wb_vld                       )
);

// &ConnRule(s/^x_/vreg6_/); @77
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg6"); @78
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg6 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg6_create_vld                   ),
  .x_cur_state_alloc_release           (vreg6_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg6_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg6_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg6_dealloc_vld                  ),
  .x_dreg                              (vreg6_dreg                         ),
  .x_rel_vreg_expand                   (vreg6_rel_vreg_expand              ),
  .x_release_vld                       (vreg6_release_vld                  ),
  .x_reset_dstv_reg                    (vreg6_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg6_reset_mapped                 ),
  .x_retired_released_wb               (vreg6_retired_released_wb          ),
  .x_wb_vld                            (vreg6_wb_vld                       )
);

// &ConnRule(s/^x_/vreg7_/); @79
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg7"); @80
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg7 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg7_create_vld                   ),
  .x_cur_state_alloc_release           (vreg7_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg7_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg7_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg7_dealloc_vld                  ),
  .x_dreg                              (vreg7_dreg                         ),
  .x_rel_vreg_expand                   (vreg7_rel_vreg_expand              ),
  .x_release_vld                       (vreg7_release_vld                  ),
  .x_reset_dstv_reg                    (vreg7_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg7_reset_mapped                 ),
  .x_retired_released_wb               (vreg7_retired_released_wb          ),
  .x_wb_vld                            (vreg7_wb_vld                       )
);

// &ConnRule(s/^x_/vreg8_/); @81
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg8"); @82
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg8 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg8_create_vld                   ),
  .x_cur_state_alloc_release           (vreg8_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg8_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg8_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg8_dealloc_vld                  ),
  .x_dreg                              (vreg8_dreg                         ),
  .x_rel_vreg_expand                   (vreg8_rel_vreg_expand              ),
  .x_release_vld                       (vreg8_release_vld                  ),
  .x_reset_dstv_reg                    (vreg8_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg8_reset_mapped                 ),
  .x_retired_released_wb               (vreg8_retired_released_wb          ),
  .x_wb_vld                            (vreg8_wb_vld                       )
);

// &ConnRule(s/^x_/vreg9_/); @83
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg9"); @84
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg9 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg9_create_vld                   ),
  .x_cur_state_alloc_release           (vreg9_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (vreg9_cur_state_dealloc            ),
  .x_dealloc_mask                      (vreg9_dealloc_mask                 ),
  .x_dealloc_vld                       (vreg9_dealloc_vld                  ),
  .x_dreg                              (vreg9_dreg                         ),
  .x_rel_vreg_expand                   (vreg9_rel_vreg_expand              ),
  .x_release_vld                       (vreg9_release_vld                  ),
  .x_reset_dstv_reg                    (vreg9_reset_dstv_reg               ),
  .x_reset_mapped                      (vreg9_reset_mapped                 ),
  .x_retired_released_wb               (vreg9_retired_released_wb          ),
  .x_wb_vld                            (vreg9_wb_vld                       )
);

// &ConnRule(s/^x_/vreg10_/); @85
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg10"); @86
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg10 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg10_create_vld                  ),
  .x_cur_state_alloc_release           (vreg10_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg10_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg10_dealloc_mask                ),
  .x_dealloc_vld                       (vreg10_dealloc_vld                 ),
  .x_dreg                              (vreg10_dreg                        ),
  .x_rel_vreg_expand                   (vreg10_rel_vreg_expand             ),
  .x_release_vld                       (vreg10_release_vld                 ),
  .x_reset_dstv_reg                    (vreg10_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg10_reset_mapped                ),
  .x_retired_released_wb               (vreg10_retired_released_wb         ),
  .x_wb_vld                            (vreg10_wb_vld                      )
);

// &ConnRule(s/^x_/vreg11_/); @87
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg11"); @88
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg11 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg11_create_vld                  ),
  .x_cur_state_alloc_release           (vreg11_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg11_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg11_dealloc_mask                ),
  .x_dealloc_vld                       (vreg11_dealloc_vld                 ),
  .x_dreg                              (vreg11_dreg                        ),
  .x_rel_vreg_expand                   (vreg11_rel_vreg_expand             ),
  .x_release_vld                       (vreg11_release_vld                 ),
  .x_reset_dstv_reg                    (vreg11_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg11_reset_mapped                ),
  .x_retired_released_wb               (vreg11_retired_released_wb         ),
  .x_wb_vld                            (vreg11_wb_vld                      )
);

// &ConnRule(s/^x_/vreg12_/); @89
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg12"); @90
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg12 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg12_create_vld                  ),
  .x_cur_state_alloc_release           (vreg12_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg12_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg12_dealloc_mask                ),
  .x_dealloc_vld                       (vreg12_dealloc_vld                 ),
  .x_dreg                              (vreg12_dreg                        ),
  .x_rel_vreg_expand                   (vreg12_rel_vreg_expand             ),
  .x_release_vld                       (vreg12_release_vld                 ),
  .x_reset_dstv_reg                    (vreg12_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg12_reset_mapped                ),
  .x_retired_released_wb               (vreg12_retired_released_wb         ),
  .x_wb_vld                            (vreg12_wb_vld                      )
);

// &ConnRule(s/^x_/vreg13_/); @91
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg13"); @92
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg13 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg13_create_vld                  ),
  .x_cur_state_alloc_release           (vreg13_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg13_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg13_dealloc_mask                ),
  .x_dealloc_vld                       (vreg13_dealloc_vld                 ),
  .x_dreg                              (vreg13_dreg                        ),
  .x_rel_vreg_expand                   (vreg13_rel_vreg_expand             ),
  .x_release_vld                       (vreg13_release_vld                 ),
  .x_reset_dstv_reg                    (vreg13_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg13_reset_mapped                ),
  .x_retired_released_wb               (vreg13_retired_released_wb         ),
  .x_wb_vld                            (vreg13_wb_vld                      )
);

// &ConnRule(s/^x_/vreg14_/); @93
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg14"); @94
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg14 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg14_create_vld                  ),
  .x_cur_state_alloc_release           (vreg14_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg14_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg14_dealloc_mask                ),
  .x_dealloc_vld                       (vreg14_dealloc_vld                 ),
  .x_dreg                              (vreg14_dreg                        ),
  .x_rel_vreg_expand                   (vreg14_rel_vreg_expand             ),
  .x_release_vld                       (vreg14_release_vld                 ),
  .x_reset_dstv_reg                    (vreg14_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg14_reset_mapped                ),
  .x_retired_released_wb               (vreg14_retired_released_wb         ),
  .x_wb_vld                            (vreg14_wb_vld                      )
);

// &ConnRule(s/^x_/vreg15_/); @95
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg15"); @96
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg15 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg15_create_vld                  ),
  .x_cur_state_alloc_release           (vreg15_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg15_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg15_dealloc_mask                ),
  .x_dealloc_vld                       (vreg15_dealloc_vld                 ),
  .x_dreg                              (vreg15_dreg                        ),
  .x_rel_vreg_expand                   (vreg15_rel_vreg_expand             ),
  .x_release_vld                       (vreg15_release_vld                 ),
  .x_reset_dstv_reg                    (vreg15_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg15_reset_mapped                ),
  .x_retired_released_wb               (vreg15_retired_released_wb         ),
  .x_wb_vld                            (vreg15_wb_vld                      )
);

// &ConnRule(s/^x_/vreg16_/); @97
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg16"); @98
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg16 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg16_create_vld                  ),
  .x_cur_state_alloc_release           (vreg16_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg16_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg16_dealloc_mask                ),
  .x_dealloc_vld                       (vreg16_dealloc_vld                 ),
  .x_dreg                              (vreg16_dreg                        ),
  .x_rel_vreg_expand                   (vreg16_rel_vreg_expand             ),
  .x_release_vld                       (vreg16_release_vld                 ),
  .x_reset_dstv_reg                    (vreg16_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg16_reset_mapped                ),
  .x_retired_released_wb               (vreg16_retired_released_wb         ),
  .x_wb_vld                            (vreg16_wb_vld                      )
);

// &ConnRule(s/^x_/vreg17_/); @99
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg17"); @100
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg17 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg17_create_vld                  ),
  .x_cur_state_alloc_release           (vreg17_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg17_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg17_dealloc_mask                ),
  .x_dealloc_vld                       (vreg17_dealloc_vld                 ),
  .x_dreg                              (vreg17_dreg                        ),
  .x_rel_vreg_expand                   (vreg17_rel_vreg_expand             ),
  .x_release_vld                       (vreg17_release_vld                 ),
  .x_reset_dstv_reg                    (vreg17_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg17_reset_mapped                ),
  .x_retired_released_wb               (vreg17_retired_released_wb         ),
  .x_wb_vld                            (vreg17_wb_vld                      )
);

// &ConnRule(s/^x_/vreg18_/); @101
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg18"); @102
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg18 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg18_create_vld                  ),
  .x_cur_state_alloc_release           (vreg18_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg18_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg18_dealloc_mask                ),
  .x_dealloc_vld                       (vreg18_dealloc_vld                 ),
  .x_dreg                              (vreg18_dreg                        ),
  .x_rel_vreg_expand                   (vreg18_rel_vreg_expand             ),
  .x_release_vld                       (vreg18_release_vld                 ),
  .x_reset_dstv_reg                    (vreg18_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg18_reset_mapped                ),
  .x_retired_released_wb               (vreg18_retired_released_wb         ),
  .x_wb_vld                            (vreg18_wb_vld                      )
);

// &ConnRule(s/^x_/vreg19_/); @103
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg19"); @104
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg19 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg19_create_vld                  ),
  .x_cur_state_alloc_release           (vreg19_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg19_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg19_dealloc_mask                ),
  .x_dealloc_vld                       (vreg19_dealloc_vld                 ),
  .x_dreg                              (vreg19_dreg                        ),
  .x_rel_vreg_expand                   (vreg19_rel_vreg_expand             ),
  .x_release_vld                       (vreg19_release_vld                 ),
  .x_reset_dstv_reg                    (vreg19_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg19_reset_mapped                ),
  .x_retired_released_wb               (vreg19_retired_released_wb         ),
  .x_wb_vld                            (vreg19_wb_vld                      )
);

// &ConnRule(s/^x_/vreg20_/); @105
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg20"); @106
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg20 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg20_create_vld                  ),
  .x_cur_state_alloc_release           (vreg20_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg20_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg20_dealloc_mask                ),
  .x_dealloc_vld                       (vreg20_dealloc_vld                 ),
  .x_dreg                              (vreg20_dreg                        ),
  .x_rel_vreg_expand                   (vreg20_rel_vreg_expand             ),
  .x_release_vld                       (vreg20_release_vld                 ),
  .x_reset_dstv_reg                    (vreg20_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg20_reset_mapped                ),
  .x_retired_released_wb               (vreg20_retired_released_wb         ),
  .x_wb_vld                            (vreg20_wb_vld                      )
);

// &ConnRule(s/^x_/vreg21_/); @107
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg21"); @108
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg21 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg21_create_vld                  ),
  .x_cur_state_alloc_release           (vreg21_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg21_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg21_dealloc_mask                ),
  .x_dealloc_vld                       (vreg21_dealloc_vld                 ),
  .x_dreg                              (vreg21_dreg                        ),
  .x_rel_vreg_expand                   (vreg21_rel_vreg_expand             ),
  .x_release_vld                       (vreg21_release_vld                 ),
  .x_reset_dstv_reg                    (vreg21_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg21_reset_mapped                ),
  .x_retired_released_wb               (vreg21_retired_released_wb         ),
  .x_wb_vld                            (vreg21_wb_vld                      )
);

// &ConnRule(s/^x_/vreg22_/); @109
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg22"); @110
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg22 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg22_create_vld                  ),
  .x_cur_state_alloc_release           (vreg22_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg22_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg22_dealloc_mask                ),
  .x_dealloc_vld                       (vreg22_dealloc_vld                 ),
  .x_dreg                              (vreg22_dreg                        ),
  .x_rel_vreg_expand                   (vreg22_rel_vreg_expand             ),
  .x_release_vld                       (vreg22_release_vld                 ),
  .x_reset_dstv_reg                    (vreg22_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg22_reset_mapped                ),
  .x_retired_released_wb               (vreg22_retired_released_wb         ),
  .x_wb_vld                            (vreg22_wb_vld                      )
);

// &ConnRule(s/^x_/vreg23_/); @111
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg23"); @112
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg23 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg23_create_vld                  ),
  .x_cur_state_alloc_release           (vreg23_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg23_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg23_dealloc_mask                ),
  .x_dealloc_vld                       (vreg23_dealloc_vld                 ),
  .x_dreg                              (vreg23_dreg                        ),
  .x_rel_vreg_expand                   (vreg23_rel_vreg_expand             ),
  .x_release_vld                       (vreg23_release_vld                 ),
  .x_reset_dstv_reg                    (vreg23_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg23_reset_mapped                ),
  .x_retired_released_wb               (vreg23_retired_released_wb         ),
  .x_wb_vld                            (vreg23_wb_vld                      )
);

// &ConnRule(s/^x_/vreg24_/); @113
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg24"); @114
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg24 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg24_create_vld                  ),
  .x_cur_state_alloc_release           (vreg24_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg24_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg24_dealloc_mask                ),
  .x_dealloc_vld                       (vreg24_dealloc_vld                 ),
  .x_dreg                              (vreg24_dreg                        ),
  .x_rel_vreg_expand                   (vreg24_rel_vreg_expand             ),
  .x_release_vld                       (vreg24_release_vld                 ),
  .x_reset_dstv_reg                    (vreg24_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg24_reset_mapped                ),
  .x_retired_released_wb               (vreg24_retired_released_wb         ),
  .x_wb_vld                            (vreg24_wb_vld                      )
);

// &ConnRule(s/^x_/vreg25_/); @115
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg25"); @116
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg25 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg25_create_vld                  ),
  .x_cur_state_alloc_release           (vreg25_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg25_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg25_dealloc_mask                ),
  .x_dealloc_vld                       (vreg25_dealloc_vld                 ),
  .x_dreg                              (vreg25_dreg                        ),
  .x_rel_vreg_expand                   (vreg25_rel_vreg_expand             ),
  .x_release_vld                       (vreg25_release_vld                 ),
  .x_reset_dstv_reg                    (vreg25_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg25_reset_mapped                ),
  .x_retired_released_wb               (vreg25_retired_released_wb         ),
  .x_wb_vld                            (vreg25_wb_vld                      )
);

// &ConnRule(s/^x_/vreg26_/); @117
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg26"); @118
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg26 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg26_create_vld                  ),
  .x_cur_state_alloc_release           (vreg26_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg26_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg26_dealloc_mask                ),
  .x_dealloc_vld                       (vreg26_dealloc_vld                 ),
  .x_dreg                              (vreg26_dreg                        ),
  .x_rel_vreg_expand                   (vreg26_rel_vreg_expand             ),
  .x_release_vld                       (vreg26_release_vld                 ),
  .x_reset_dstv_reg                    (vreg26_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg26_reset_mapped                ),
  .x_retired_released_wb               (vreg26_retired_released_wb         ),
  .x_wb_vld                            (vreg26_wb_vld                      )
);

// &ConnRule(s/^x_/vreg27_/); @119
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg27"); @120
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg27 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg27_create_vld                  ),
  .x_cur_state_alloc_release           (vreg27_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg27_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg27_dealloc_mask                ),
  .x_dealloc_vld                       (vreg27_dealloc_vld                 ),
  .x_dreg                              (vreg27_dreg                        ),
  .x_rel_vreg_expand                   (vreg27_rel_vreg_expand             ),
  .x_release_vld                       (vreg27_release_vld                 ),
  .x_reset_dstv_reg                    (vreg27_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg27_reset_mapped                ),
  .x_retired_released_wb               (vreg27_retired_released_wb         ),
  .x_wb_vld                            (vreg27_wb_vld                      )
);

// &ConnRule(s/^x_/vreg28_/); @121
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg28"); @122
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg28 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg28_create_vld                  ),
  .x_cur_state_alloc_release           (vreg28_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg28_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg28_dealloc_mask                ),
  .x_dealloc_vld                       (vreg28_dealloc_vld                 ),
  .x_dreg                              (vreg28_dreg                        ),
  .x_rel_vreg_expand                   (vreg28_rel_vreg_expand             ),
  .x_release_vld                       (vreg28_release_vld                 ),
  .x_reset_dstv_reg                    (vreg28_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg28_reset_mapped                ),
  .x_retired_released_wb               (vreg28_retired_released_wb         ),
  .x_wb_vld                            (vreg28_wb_vld                      )
);

// &ConnRule(s/^x_/vreg29_/); @123
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg29"); @124
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg29 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg29_create_vld                  ),
  .x_cur_state_alloc_release           (vreg29_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg29_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg29_dealloc_mask                ),
  .x_dealloc_vld                       (vreg29_dealloc_vld                 ),
  .x_dreg                              (vreg29_dreg                        ),
  .x_rel_vreg_expand                   (vreg29_rel_vreg_expand             ),
  .x_release_vld                       (vreg29_release_vld                 ),
  .x_reset_dstv_reg                    (vreg29_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg29_reset_mapped                ),
  .x_retired_released_wb               (vreg29_retired_released_wb         ),
  .x_wb_vld                            (vreg29_wb_vld                      )
);

// &ConnRule(s/^x_/vreg30_/); @125
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg30"); @126
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg30 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg30_create_vld                  ),
  .x_cur_state_alloc_release           (vreg30_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg30_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg30_dealloc_mask                ),
  .x_dealloc_vld                       (vreg30_dealloc_vld                 ),
  .x_dreg                              (vreg30_dreg                        ),
  .x_rel_vreg_expand                   (vreg30_rel_vreg_expand             ),
  .x_release_vld                       (vreg30_release_vld                 ),
  .x_reset_dstv_reg                    (vreg30_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg30_reset_mapped                ),
  .x_retired_released_wb               (vreg30_retired_released_wb         ),
  .x_wb_vld                            (vreg30_wb_vld                      )
);

// &ConnRule(s/^x_/vreg31_/); @127
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg31"); @128
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg31 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg31_create_vld                  ),
  .x_cur_state_alloc_release           (vreg31_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg31_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg31_dealloc_mask                ),
  .x_dealloc_vld                       (vreg31_dealloc_vld                 ),
  .x_dreg                              (vreg31_dreg                        ),
  .x_rel_vreg_expand                   (vreg31_rel_vreg_expand             ),
  .x_release_vld                       (vreg31_release_vld                 ),
  .x_reset_dstv_reg                    (vreg31_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg31_reset_mapped                ),
  .x_retired_released_wb               (vreg31_retired_released_wb         ),
  .x_wb_vld                            (vreg31_wb_vld                      )
);

// &ConnRule(s/^x_/vreg32_/); @129
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg32"); @130
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg32 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg32_create_vld                  ),
  .x_cur_state_alloc_release           (vreg32_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg32_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg32_dealloc_mask                ),
  .x_dealloc_vld                       (vreg32_dealloc_vld                 ),
  .x_dreg                              (vreg32_dreg                        ),
  .x_rel_vreg_expand                   (vreg32_rel_vreg_expand             ),
  .x_release_vld                       (vreg32_release_vld                 ),
  .x_reset_dstv_reg                    (vreg32_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg32_reset_mapped                ),
  .x_retired_released_wb               (vreg32_retired_released_wb         ),
  .x_wb_vld                            (vreg32_wb_vld                      )
);

// &ConnRule(s/^x_/vreg33_/); @131
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg33"); @132
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg33 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg33_create_vld                  ),
  .x_cur_state_alloc_release           (vreg33_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg33_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg33_dealloc_mask                ),
  .x_dealloc_vld                       (vreg33_dealloc_vld                 ),
  .x_dreg                              (vreg33_dreg                        ),
  .x_rel_vreg_expand                   (vreg33_rel_vreg_expand             ),
  .x_release_vld                       (vreg33_release_vld                 ),
  .x_reset_dstv_reg                    (vreg33_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg33_reset_mapped                ),
  .x_retired_released_wb               (vreg33_retired_released_wb         ),
  .x_wb_vld                            (vreg33_wb_vld                      )
);

// &ConnRule(s/^x_/vreg34_/); @133
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg34"); @134
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg34 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg34_create_vld                  ),
  .x_cur_state_alloc_release           (vreg34_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg34_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg34_dealloc_mask                ),
  .x_dealloc_vld                       (vreg34_dealloc_vld                 ),
  .x_dreg                              (vreg34_dreg                        ),
  .x_rel_vreg_expand                   (vreg34_rel_vreg_expand             ),
  .x_release_vld                       (vreg34_release_vld                 ),
  .x_reset_dstv_reg                    (vreg34_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg34_reset_mapped                ),
  .x_retired_released_wb               (vreg34_retired_released_wb         ),
  .x_wb_vld                            (vreg34_wb_vld                      )
);

// &ConnRule(s/^x_/vreg35_/); @135
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg35"); @136
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg35 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg35_create_vld                  ),
  .x_cur_state_alloc_release           (vreg35_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg35_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg35_dealloc_mask                ),
  .x_dealloc_vld                       (vreg35_dealloc_vld                 ),
  .x_dreg                              (vreg35_dreg                        ),
  .x_rel_vreg_expand                   (vreg35_rel_vreg_expand             ),
  .x_release_vld                       (vreg35_release_vld                 ),
  .x_reset_dstv_reg                    (vreg35_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg35_reset_mapped                ),
  .x_retired_released_wb               (vreg35_retired_released_wb         ),
  .x_wb_vld                            (vreg35_wb_vld                      )
);

// &ConnRule(s/^x_/vreg36_/); @137
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg36"); @138
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg36 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg36_create_vld                  ),
  .x_cur_state_alloc_release           (vreg36_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg36_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg36_dealloc_mask                ),
  .x_dealloc_vld                       (vreg36_dealloc_vld                 ),
  .x_dreg                              (vreg36_dreg                        ),
  .x_rel_vreg_expand                   (vreg36_rel_vreg_expand             ),
  .x_release_vld                       (vreg36_release_vld                 ),
  .x_reset_dstv_reg                    (vreg36_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg36_reset_mapped                ),
  .x_retired_released_wb               (vreg36_retired_released_wb         ),
  .x_wb_vld                            (vreg36_wb_vld                      )
);

// &ConnRule(s/^x_/vreg37_/); @139
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg37"); @140
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg37 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg37_create_vld                  ),
  .x_cur_state_alloc_release           (vreg37_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg37_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg37_dealloc_mask                ),
  .x_dealloc_vld                       (vreg37_dealloc_vld                 ),
  .x_dreg                              (vreg37_dreg                        ),
  .x_rel_vreg_expand                   (vreg37_rel_vreg_expand             ),
  .x_release_vld                       (vreg37_release_vld                 ),
  .x_reset_dstv_reg                    (vreg37_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg37_reset_mapped                ),
  .x_retired_released_wb               (vreg37_retired_released_wb         ),
  .x_wb_vld                            (vreg37_wb_vld                      )
);

// &ConnRule(s/^x_/vreg38_/); @141
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg38"); @142
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg38 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg38_create_vld                  ),
  .x_cur_state_alloc_release           (vreg38_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg38_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg38_dealloc_mask                ),
  .x_dealloc_vld                       (vreg38_dealloc_vld                 ),
  .x_dreg                              (vreg38_dreg                        ),
  .x_rel_vreg_expand                   (vreg38_rel_vreg_expand             ),
  .x_release_vld                       (vreg38_release_vld                 ),
  .x_reset_dstv_reg                    (vreg38_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg38_reset_mapped                ),
  .x_retired_released_wb               (vreg38_retired_released_wb         ),
  .x_wb_vld                            (vreg38_wb_vld                      )
);

// &ConnRule(s/^x_/vreg39_/); @143
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg39"); @144
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg39 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg39_create_vld                  ),
  .x_cur_state_alloc_release           (vreg39_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg39_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg39_dealloc_mask                ),
  .x_dealloc_vld                       (vreg39_dealloc_vld                 ),
  .x_dreg                              (vreg39_dreg                        ),
  .x_rel_vreg_expand                   (vreg39_rel_vreg_expand             ),
  .x_release_vld                       (vreg39_release_vld                 ),
  .x_reset_dstv_reg                    (vreg39_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg39_reset_mapped                ),
  .x_retired_released_wb               (vreg39_retired_released_wb         ),
  .x_wb_vld                            (vreg39_wb_vld                      )
);

// &ConnRule(s/^x_/vreg40_/); @145
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg40"); @146
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg40 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg40_create_vld                  ),
  .x_cur_state_alloc_release           (vreg40_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg40_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg40_dealloc_mask                ),
  .x_dealloc_vld                       (vreg40_dealloc_vld                 ),
  .x_dreg                              (vreg40_dreg                        ),
  .x_rel_vreg_expand                   (vreg40_rel_vreg_expand             ),
  .x_release_vld                       (vreg40_release_vld                 ),
  .x_reset_dstv_reg                    (vreg40_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg40_reset_mapped                ),
  .x_retired_released_wb               (vreg40_retired_released_wb         ),
  .x_wb_vld                            (vreg40_wb_vld                      )
);

// &ConnRule(s/^x_/vreg41_/); @147
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg41"); @148
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg41 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg41_create_vld                  ),
  .x_cur_state_alloc_release           (vreg41_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg41_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg41_dealloc_mask                ),
  .x_dealloc_vld                       (vreg41_dealloc_vld                 ),
  .x_dreg                              (vreg41_dreg                        ),
  .x_rel_vreg_expand                   (vreg41_rel_vreg_expand             ),
  .x_release_vld                       (vreg41_release_vld                 ),
  .x_reset_dstv_reg                    (vreg41_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg41_reset_mapped                ),
  .x_retired_released_wb               (vreg41_retired_released_wb         ),
  .x_wb_vld                            (vreg41_wb_vld                      )
);

// &ConnRule(s/^x_/vreg42_/); @149
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg42"); @150
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg42 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg42_create_vld                  ),
  .x_cur_state_alloc_release           (vreg42_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg42_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg42_dealloc_mask                ),
  .x_dealloc_vld                       (vreg42_dealloc_vld                 ),
  .x_dreg                              (vreg42_dreg                        ),
  .x_rel_vreg_expand                   (vreg42_rel_vreg_expand             ),
  .x_release_vld                       (vreg42_release_vld                 ),
  .x_reset_dstv_reg                    (vreg42_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg42_reset_mapped                ),
  .x_retired_released_wb               (vreg42_retired_released_wb         ),
  .x_wb_vld                            (vreg42_wb_vld                      )
);

// &ConnRule(s/^x_/vreg43_/); @151
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg43"); @152
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg43 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg43_create_vld                  ),
  .x_cur_state_alloc_release           (vreg43_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg43_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg43_dealloc_mask                ),
  .x_dealloc_vld                       (vreg43_dealloc_vld                 ),
  .x_dreg                              (vreg43_dreg                        ),
  .x_rel_vreg_expand                   (vreg43_rel_vreg_expand             ),
  .x_release_vld                       (vreg43_release_vld                 ),
  .x_reset_dstv_reg                    (vreg43_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg43_reset_mapped                ),
  .x_retired_released_wb               (vreg43_retired_released_wb         ),
  .x_wb_vld                            (vreg43_wb_vld                      )
);

// &ConnRule(s/^x_/vreg44_/); @153
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg44"); @154
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg44 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg44_create_vld                  ),
  .x_cur_state_alloc_release           (vreg44_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg44_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg44_dealloc_mask                ),
  .x_dealloc_vld                       (vreg44_dealloc_vld                 ),
  .x_dreg                              (vreg44_dreg                        ),
  .x_rel_vreg_expand                   (vreg44_rel_vreg_expand             ),
  .x_release_vld                       (vreg44_release_vld                 ),
  .x_reset_dstv_reg                    (vreg44_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg44_reset_mapped                ),
  .x_retired_released_wb               (vreg44_retired_released_wb         ),
  .x_wb_vld                            (vreg44_wb_vld                      )
);

// &ConnRule(s/^x_/vreg45_/); @155
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg45"); @156
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg45 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg45_create_vld                  ),
  .x_cur_state_alloc_release           (vreg45_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg45_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg45_dealloc_mask                ),
  .x_dealloc_vld                       (vreg45_dealloc_vld                 ),
  .x_dreg                              (vreg45_dreg                        ),
  .x_rel_vreg_expand                   (vreg45_rel_vreg_expand             ),
  .x_release_vld                       (vreg45_release_vld                 ),
  .x_reset_dstv_reg                    (vreg45_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg45_reset_mapped                ),
  .x_retired_released_wb               (vreg45_retired_released_wb         ),
  .x_wb_vld                            (vreg45_wb_vld                      )
);

// &ConnRule(s/^x_/vreg46_/); @157
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg46"); @158
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg46 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg46_create_vld                  ),
  .x_cur_state_alloc_release           (vreg46_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg46_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg46_dealloc_mask                ),
  .x_dealloc_vld                       (vreg46_dealloc_vld                 ),
  .x_dreg                              (vreg46_dreg                        ),
  .x_rel_vreg_expand                   (vreg46_rel_vreg_expand             ),
  .x_release_vld                       (vreg46_release_vld                 ),
  .x_reset_dstv_reg                    (vreg46_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg46_reset_mapped                ),
  .x_retired_released_wb               (vreg46_retired_released_wb         ),
  .x_wb_vld                            (vreg46_wb_vld                      )
);

// &ConnRule(s/^x_/vreg47_/); @159
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg47"); @160
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg47 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg47_create_vld                  ),
  .x_cur_state_alloc_release           (vreg47_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg47_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg47_dealloc_mask                ),
  .x_dealloc_vld                       (vreg47_dealloc_vld                 ),
  .x_dreg                              (vreg47_dreg                        ),
  .x_rel_vreg_expand                   (vreg47_rel_vreg_expand             ),
  .x_release_vld                       (vreg47_release_vld                 ),
  .x_reset_dstv_reg                    (vreg47_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg47_reset_mapped                ),
  .x_retired_released_wb               (vreg47_retired_released_wb         ),
  .x_wb_vld                            (vreg47_wb_vld                      )
);

// &ConnRule(s/^x_/vreg48_/); @161
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg48"); @162
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg48 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg48_create_vld                  ),
  .x_cur_state_alloc_release           (vreg48_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg48_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg48_dealloc_mask                ),
  .x_dealloc_vld                       (vreg48_dealloc_vld                 ),
  .x_dreg                              (vreg48_dreg                        ),
  .x_rel_vreg_expand                   (vreg48_rel_vreg_expand             ),
  .x_release_vld                       (vreg48_release_vld                 ),
  .x_reset_dstv_reg                    (vreg48_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg48_reset_mapped                ),
  .x_retired_released_wb               (vreg48_retired_released_wb         ),
  .x_wb_vld                            (vreg48_wb_vld                      )
);

// &ConnRule(s/^x_/vreg49_/); @163
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg49"); @164
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg49 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg49_create_vld                  ),
  .x_cur_state_alloc_release           (vreg49_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg49_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg49_dealloc_mask                ),
  .x_dealloc_vld                       (vreg49_dealloc_vld                 ),
  .x_dreg                              (vreg49_dreg                        ),
  .x_rel_vreg_expand                   (vreg49_rel_vreg_expand             ),
  .x_release_vld                       (vreg49_release_vld                 ),
  .x_reset_dstv_reg                    (vreg49_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg49_reset_mapped                ),
  .x_retired_released_wb               (vreg49_retired_released_wb         ),
  .x_wb_vld                            (vreg49_wb_vld                      )
);

// &ConnRule(s/^x_/vreg50_/); @165
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg50"); @166
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg50 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg50_create_vld                  ),
  .x_cur_state_alloc_release           (vreg50_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg50_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg50_dealloc_mask                ),
  .x_dealloc_vld                       (vreg50_dealloc_vld                 ),
  .x_dreg                              (vreg50_dreg                        ),
  .x_rel_vreg_expand                   (vreg50_rel_vreg_expand             ),
  .x_release_vld                       (vreg50_release_vld                 ),
  .x_reset_dstv_reg                    (vreg50_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg50_reset_mapped                ),
  .x_retired_released_wb               (vreg50_retired_released_wb         ),
  .x_wb_vld                            (vreg50_wb_vld                      )
);

// &ConnRule(s/^x_/vreg51_/); @167
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg51"); @168
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg51 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg51_create_vld                  ),
  .x_cur_state_alloc_release           (vreg51_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg51_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg51_dealloc_mask                ),
  .x_dealloc_vld                       (vreg51_dealloc_vld                 ),
  .x_dreg                              (vreg51_dreg                        ),
  .x_rel_vreg_expand                   (vreg51_rel_vreg_expand             ),
  .x_release_vld                       (vreg51_release_vld                 ),
  .x_reset_dstv_reg                    (vreg51_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg51_reset_mapped                ),
  .x_retired_released_wb               (vreg51_retired_released_wb         ),
  .x_wb_vld                            (vreg51_wb_vld                      )
);

// &ConnRule(s/^x_/vreg52_/); @169
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg52"); @170
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg52 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg52_create_vld                  ),
  .x_cur_state_alloc_release           (vreg52_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg52_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg52_dealloc_mask                ),
  .x_dealloc_vld                       (vreg52_dealloc_vld                 ),
  .x_dreg                              (vreg52_dreg                        ),
  .x_rel_vreg_expand                   (vreg52_rel_vreg_expand             ),
  .x_release_vld                       (vreg52_release_vld                 ),
  .x_reset_dstv_reg                    (vreg52_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg52_reset_mapped                ),
  .x_retired_released_wb               (vreg52_retired_released_wb         ),
  .x_wb_vld                            (vreg52_wb_vld                      )
);

// &ConnRule(s/^x_/vreg53_/); @171
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg53"); @172
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg53 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg53_create_vld                  ),
  .x_cur_state_alloc_release           (vreg53_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg53_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg53_dealloc_mask                ),
  .x_dealloc_vld                       (vreg53_dealloc_vld                 ),
  .x_dreg                              (vreg53_dreg                        ),
  .x_rel_vreg_expand                   (vreg53_rel_vreg_expand             ),
  .x_release_vld                       (vreg53_release_vld                 ),
  .x_reset_dstv_reg                    (vreg53_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg53_reset_mapped                ),
  .x_retired_released_wb               (vreg53_retired_released_wb         ),
  .x_wb_vld                            (vreg53_wb_vld                      )
);

// &ConnRule(s/^x_/vreg54_/); @173
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg54"); @174
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg54 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg54_create_vld                  ),
  .x_cur_state_alloc_release           (vreg54_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg54_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg54_dealloc_mask                ),
  .x_dealloc_vld                       (vreg54_dealloc_vld                 ),
  .x_dreg                              (vreg54_dreg                        ),
  .x_rel_vreg_expand                   (vreg54_rel_vreg_expand             ),
  .x_release_vld                       (vreg54_release_vld                 ),
  .x_reset_dstv_reg                    (vreg54_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg54_reset_mapped                ),
  .x_retired_released_wb               (vreg54_retired_released_wb         ),
  .x_wb_vld                            (vreg54_wb_vld                      )
);

// &ConnRule(s/^x_/vreg55_/); @175
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg55"); @176
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg55 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg55_create_vld                  ),
  .x_cur_state_alloc_release           (vreg55_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg55_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg55_dealloc_mask                ),
  .x_dealloc_vld                       (vreg55_dealloc_vld                 ),
  .x_dreg                              (vreg55_dreg                        ),
  .x_rel_vreg_expand                   (vreg55_rel_vreg_expand             ),
  .x_release_vld                       (vreg55_release_vld                 ),
  .x_reset_dstv_reg                    (vreg55_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg55_reset_mapped                ),
  .x_retired_released_wb               (vreg55_retired_released_wb         ),
  .x_wb_vld                            (vreg55_wb_vld                      )
);

// &ConnRule(s/^x_/vreg56_/); @177
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg56"); @178
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg56 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg56_create_vld                  ),
  .x_cur_state_alloc_release           (vreg56_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg56_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg56_dealloc_mask                ),
  .x_dealloc_vld                       (vreg56_dealloc_vld                 ),
  .x_dreg                              (vreg56_dreg                        ),
  .x_rel_vreg_expand                   (vreg56_rel_vreg_expand             ),
  .x_release_vld                       (vreg56_release_vld                 ),
  .x_reset_dstv_reg                    (vreg56_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg56_reset_mapped                ),
  .x_retired_released_wb               (vreg56_retired_released_wb         ),
  .x_wb_vld                            (vreg56_wb_vld                      )
);

// &ConnRule(s/^x_/vreg57_/); @179
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg57"); @180
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg57 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg57_create_vld                  ),
  .x_cur_state_alloc_release           (vreg57_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg57_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg57_dealloc_mask                ),
  .x_dealloc_vld                       (vreg57_dealloc_vld                 ),
  .x_dreg                              (vreg57_dreg                        ),
  .x_rel_vreg_expand                   (vreg57_rel_vreg_expand             ),
  .x_release_vld                       (vreg57_release_vld                 ),
  .x_reset_dstv_reg                    (vreg57_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg57_reset_mapped                ),
  .x_retired_released_wb               (vreg57_retired_released_wb         ),
  .x_wb_vld                            (vreg57_wb_vld                      )
);

// &ConnRule(s/^x_/vreg58_/); @181
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg58"); @182
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg58 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg58_create_vld                  ),
  .x_cur_state_alloc_release           (vreg58_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg58_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg58_dealloc_mask                ),
  .x_dealloc_vld                       (vreg58_dealloc_vld                 ),
  .x_dreg                              (vreg58_dreg                        ),
  .x_rel_vreg_expand                   (vreg58_rel_vreg_expand             ),
  .x_release_vld                       (vreg58_release_vld                 ),
  .x_reset_dstv_reg                    (vreg58_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg58_reset_mapped                ),
  .x_retired_released_wb               (vreg58_retired_released_wb         ),
  .x_wb_vld                            (vreg58_wb_vld                      )
);

// &ConnRule(s/^x_/vreg59_/); @183
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg59"); @184
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg59 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg59_create_vld                  ),
  .x_cur_state_alloc_release           (vreg59_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg59_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg59_dealloc_mask                ),
  .x_dealloc_vld                       (vreg59_dealloc_vld                 ),
  .x_dreg                              (vreg59_dreg                        ),
  .x_rel_vreg_expand                   (vreg59_rel_vreg_expand             ),
  .x_release_vld                       (vreg59_release_vld                 ),
  .x_reset_dstv_reg                    (vreg59_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg59_reset_mapped                ),
  .x_retired_released_wb               (vreg59_retired_released_wb         ),
  .x_wb_vld                            (vreg59_wb_vld                      )
);

// &ConnRule(s/^x_/vreg60_/); @185
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg60"); @186
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg60 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg60_create_vld                  ),
  .x_cur_state_alloc_release           (vreg60_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg60_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg60_dealloc_mask                ),
  .x_dealloc_vld                       (vreg60_dealloc_vld                 ),
  .x_dreg                              (vreg60_dreg                        ),
  .x_rel_vreg_expand                   (vreg60_rel_vreg_expand             ),
  .x_release_vld                       (vreg60_release_vld                 ),
  .x_reset_dstv_reg                    (vreg60_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg60_reset_mapped                ),
  .x_retired_released_wb               (vreg60_retired_released_wb         ),
  .x_wb_vld                            (vreg60_wb_vld                      )
);

// &ConnRule(s/^x_/vreg61_/); @187
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg61"); @188
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg61 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg61_create_vld                  ),
  .x_cur_state_alloc_release           (vreg61_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg61_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg61_dealloc_mask                ),
  .x_dealloc_vld                       (vreg61_dealloc_vld                 ),
  .x_dreg                              (vreg61_dreg                        ),
  .x_rel_vreg_expand                   (vreg61_rel_vreg_expand             ),
  .x_release_vld                       (vreg61_release_vld                 ),
  .x_reset_dstv_reg                    (vreg61_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg61_reset_mapped                ),
  .x_retired_released_wb               (vreg61_retired_released_wb         ),
  .x_wb_vld                            (vreg61_wb_vld                      )
);

// &ConnRule(s/^x_/vreg62_/); @189
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg62"); @190
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg62 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg62_create_vld                  ),
  .x_cur_state_alloc_release           (vreg62_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg62_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg62_dealloc_mask                ),
  .x_dealloc_vld                       (vreg62_dealloc_vld                 ),
  .x_dreg                              (vreg62_dreg                        ),
  .x_rel_vreg_expand                   (vreg62_rel_vreg_expand             ),
  .x_release_vld                       (vreg62_release_vld                 ),
  .x_reset_dstv_reg                    (vreg62_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg62_reset_mapped                ),
  .x_retired_released_wb               (vreg62_retired_released_wb         ),
  .x_wb_vld                            (vreg62_wb_vld                      )
);

// &ConnRule(s/^x_/vreg63_/); @191
// &Instance("ct_rtu_pst_vreg_entry","x_ct_rtu_pst_entry_vreg63"); @192
ct_rtu_pst_vreg_entry  x_ct_rtu_pst_entry_vreg63 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .idu_rtu_pst_dis_inst0_dstv_reg      (idu_rtu_pst_dis_inst0_dstv_reg     ),
  .idu_rtu_pst_dis_inst0_rel_vreg      (idu_rtu_pst_dis_inst0_rel_vreg     ),
  .idu_rtu_pst_dis_inst0_vreg_iid      (idu_rtu_pst_dis_inst0_vreg_iid     ),
  .idu_rtu_pst_dis_inst1_dstv_reg      (idu_rtu_pst_dis_inst1_dstv_reg     ),
  .idu_rtu_pst_dis_inst1_rel_vreg      (idu_rtu_pst_dis_inst1_rel_vreg     ),
  .idu_rtu_pst_dis_inst1_vreg_iid      (idu_rtu_pst_dis_inst1_vreg_iid     ),
  .idu_rtu_pst_dis_inst2_dstv_reg      (idu_rtu_pst_dis_inst2_dstv_reg     ),
  .idu_rtu_pst_dis_inst2_rel_vreg      (idu_rtu_pst_dis_inst2_rel_vreg     ),
  .idu_rtu_pst_dis_inst2_vreg_iid      (idu_rtu_pst_dis_inst2_vreg_iid     ),
  .idu_rtu_pst_dis_inst3_dstv_reg      (idu_rtu_pst_dis_inst3_dstv_reg     ),
  .idu_rtu_pst_dis_inst3_rel_vreg      (idu_rtu_pst_dis_inst3_rel_vreg     ),
  .idu_rtu_pst_dis_inst3_vreg_iid      (idu_rtu_pst_dis_inst3_vreg_iid     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_vreg_vld (retire_pst_wb_retire_inst0_vreg_vld),
  .retire_pst_wb_retire_inst1_vreg_vld (retire_pst_wb_retire_inst1_vreg_vld),
  .retire_pst_wb_retire_inst2_vreg_vld (retire_pst_wb_retire_inst2_vreg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vreg_top_clk                        (vreg_top_clk                       ),
  .x_create_vld                        (vreg63_create_vld                  ),
  .x_cur_state_alloc_release           (vreg63_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (vreg63_cur_state_dealloc           ),
  .x_dealloc_mask                      (vreg63_dealloc_mask                ),
  .x_dealloc_vld                       (vreg63_dealloc_vld                 ),
  .x_dreg                              (vreg63_dreg                        ),
  .x_rel_vreg_expand                   (vreg63_rel_vreg_expand             ),
  .x_release_vld                       (vreg63_release_vld                 ),
  .x_reset_dstv_reg                    (vreg63_reset_dstv_reg              ),
  .x_reset_mapped                      (vreg63_reset_mapped                ),
  .x_retired_released_wb               (vreg63_retired_released_wb         ),
  .x_wb_vld                            (vreg63_wb_vld                      )
);


//==========================================================
//          PST VGPR Physical Register (Vreg) Logic
//==========================================================

//==========================================================
//                  Reset initial states
//==========================================================
//after reset, p0-p31 will be mapped to r0-r31, p31-p63 will
//be dealloc
assign vreg0_reset_mapped  = 1'b1;
assign vreg1_reset_mapped  = 1'b1;
assign vreg2_reset_mapped  = 1'b1;
assign vreg3_reset_mapped  = 1'b1;
assign vreg4_reset_mapped  = 1'b1;
assign vreg5_reset_mapped  = 1'b1;
assign vreg6_reset_mapped  = 1'b1;
assign vreg7_reset_mapped  = 1'b1;
assign vreg8_reset_mapped  = 1'b1;
assign vreg9_reset_mapped  = 1'b1;
assign vreg10_reset_mapped = 1'b1;
assign vreg11_reset_mapped = 1'b1;
assign vreg12_reset_mapped = 1'b1;
assign vreg13_reset_mapped = 1'b1;
assign vreg14_reset_mapped = 1'b1;
assign vreg15_reset_mapped = 1'b1;
assign vreg16_reset_mapped = 1'b1;
assign vreg17_reset_mapped = 1'b1;
assign vreg18_reset_mapped = 1'b1;
assign vreg19_reset_mapped = 1'b1;
assign vreg20_reset_mapped = 1'b1;
assign vreg21_reset_mapped = 1'b1;
assign vreg22_reset_mapped = 1'b1;
assign vreg23_reset_mapped = 1'b1;
assign vreg24_reset_mapped = 1'b1;
assign vreg25_reset_mapped = 1'b1;
assign vreg26_reset_mapped = 1'b1;
assign vreg27_reset_mapped = 1'b1;
assign vreg28_reset_mapped = 1'b1;
assign vreg29_reset_mapped = 1'b1;
assign vreg30_reset_mapped = 1'b1;
assign vreg31_reset_mapped = 1'b1;
assign vreg32_reset_mapped = 1'b0;
assign vreg33_reset_mapped = 1'b0;
assign vreg34_reset_mapped = 1'b0;
assign vreg35_reset_mapped = 1'b0;
assign vreg36_reset_mapped = 1'b0;
assign vreg37_reset_mapped = 1'b0;
assign vreg38_reset_mapped = 1'b0;
assign vreg39_reset_mapped = 1'b0;
assign vreg40_reset_mapped = 1'b0;
assign vreg41_reset_mapped = 1'b0;
assign vreg42_reset_mapped = 1'b0;
assign vreg43_reset_mapped = 1'b0;
assign vreg44_reset_mapped = 1'b0;
assign vreg45_reset_mapped = 1'b0;
assign vreg46_reset_mapped = 1'b0;
assign vreg47_reset_mapped = 1'b0;
assign vreg48_reset_mapped = 1'b0;
assign vreg49_reset_mapped = 1'b0;
assign vreg50_reset_mapped = 1'b0;
assign vreg51_reset_mapped = 1'b0;
assign vreg52_reset_mapped = 1'b0;
assign vreg53_reset_mapped = 1'b0;
assign vreg54_reset_mapped = 1'b0;
assign vreg55_reset_mapped = 1'b0;
assign vreg56_reset_mapped = 1'b0;
assign vreg57_reset_mapped = 1'b0;
assign vreg58_reset_mapped = 1'b0;
assign vreg59_reset_mapped = 1'b0;
assign vreg60_reset_mapped = 1'b0;
assign vreg61_reset_mapped = 1'b0;
assign vreg62_reset_mapped = 1'b0;
assign vreg63_reset_mapped = 1'b0;

assign vreg0_reset_dstv_reg[4:0]  = 5'd0;
assign vreg1_reset_dstv_reg[4:0]  = 5'd1;
assign vreg2_reset_dstv_reg[4:0]  = 5'd2;
assign vreg3_reset_dstv_reg[4:0]  = 5'd3;
assign vreg4_reset_dstv_reg[4:0]  = 5'd4;
assign vreg5_reset_dstv_reg[4:0]  = 5'd5;
assign vreg6_reset_dstv_reg[4:0]  = 5'd6;
assign vreg7_reset_dstv_reg[4:0]  = 5'd7;
assign vreg8_reset_dstv_reg[4:0]  = 5'd8;
assign vreg9_reset_dstv_reg[4:0]  = 5'd9;
assign vreg10_reset_dstv_reg[4:0] = 5'd10;
assign vreg11_reset_dstv_reg[4:0] = 5'd11;
assign vreg12_reset_dstv_reg[4:0] = 5'd12;
assign vreg13_reset_dstv_reg[4:0] = 5'd13;
assign vreg14_reset_dstv_reg[4:0] = 5'd14;
assign vreg15_reset_dstv_reg[4:0] = 5'd15;
assign vreg16_reset_dstv_reg[4:0] = 5'd16;
assign vreg17_reset_dstv_reg[4:0] = 5'd17;
assign vreg18_reset_dstv_reg[4:0] = 5'd18;
assign vreg19_reset_dstv_reg[4:0] = 5'd19;
assign vreg20_reset_dstv_reg[4:0] = 5'd20;
assign vreg21_reset_dstv_reg[4:0] = 5'd21;
assign vreg22_reset_dstv_reg[4:0] = 5'd22;
assign vreg23_reset_dstv_reg[4:0] = 5'd23;
assign vreg24_reset_dstv_reg[4:0] = 5'd24;
assign vreg25_reset_dstv_reg[4:0] = 5'd25;
assign vreg26_reset_dstv_reg[4:0] = 5'd26;
assign vreg27_reset_dstv_reg[4:0] = 5'd27;
assign vreg28_reset_dstv_reg[4:0] = 5'd28;
assign vreg29_reset_dstv_reg[4:0] = 5'd29;
assign vreg30_reset_dstv_reg[4:0] = 5'd30;
assign vreg31_reset_dstv_reg[4:0] = 5'd31;
assign vreg32_reset_dstv_reg[4:0] = 5'd0;
assign vreg33_reset_dstv_reg[4:0] = 5'd0;
assign vreg34_reset_dstv_reg[4:0] = 5'd0;
assign vreg35_reset_dstv_reg[4:0] = 5'd0;
assign vreg36_reset_dstv_reg[4:0] = 5'd0;
assign vreg37_reset_dstv_reg[4:0] = 5'd0;
assign vreg38_reset_dstv_reg[4:0] = 5'd0;
assign vreg39_reset_dstv_reg[4:0] = 5'd0;
assign vreg40_reset_dstv_reg[4:0] = 5'd0;
assign vreg41_reset_dstv_reg[4:0] = 5'd0;
assign vreg42_reset_dstv_reg[4:0] = 5'd0;
assign vreg43_reset_dstv_reg[4:0] = 5'd0;
assign vreg44_reset_dstv_reg[4:0] = 5'd0;
assign vreg45_reset_dstv_reg[4:0] = 5'd0;
assign vreg46_reset_dstv_reg[4:0] = 5'd0;
assign vreg47_reset_dstv_reg[4:0] = 5'd0;
assign vreg48_reset_dstv_reg[4:0] = 5'd0;
assign vreg49_reset_dstv_reg[4:0] = 5'd0;
assign vreg50_reset_dstv_reg[4:0] = 5'd0;
assign vreg51_reset_dstv_reg[4:0] = 5'd0;
assign vreg52_reset_dstv_reg[4:0] = 5'd0;
assign vreg53_reset_dstv_reg[4:0] = 5'd0;
assign vreg54_reset_dstv_reg[4:0] = 5'd0;
assign vreg55_reset_dstv_reg[4:0] = 5'd0;
assign vreg56_reset_dstv_reg[4:0] = 5'd0;
assign vreg57_reset_dstv_reg[4:0] = 5'd0;
assign vreg58_reset_dstv_reg[4:0] = 5'd0;
assign vreg59_reset_dstv_reg[4:0] = 5'd0;
assign vreg60_reset_dstv_reg[4:0] = 5'd0;
assign vreg61_reset_dstv_reg[4:0] = 5'd0;
assign vreg62_reset_dstv_reg[4:0] = 5'd0;
assign vreg63_reset_dstv_reg[4:0] = 5'd0;

//==========================================================
//                 Dispatch Create signals
//==========================================================
// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst0_vreg/); @336
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_idu_rtu_pst_dis_inst0_vreg"); @337
ct_rtu_expand_64  x_ct_rtu_expand_64_idu_rtu_pst_dis_inst0_vreg (
  .x_num                             (idu_rtu_pst_dis_inst0_vreg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst0_vreg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst1_vreg/); @338
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_idu_rtu_pst_dis_inst1_vreg"); @339
ct_rtu_expand_64  x_ct_rtu_expand_64_idu_rtu_pst_dis_inst1_vreg (
  .x_num                             (idu_rtu_pst_dis_inst1_vreg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst1_vreg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst2_vreg/); @340
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_idu_rtu_pst_dis_inst2_vreg"); @341
ct_rtu_expand_64  x_ct_rtu_expand_64_idu_rtu_pst_dis_inst2_vreg (
  .x_num                             (idu_rtu_pst_dis_inst2_vreg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst2_vreg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst3_vreg/); @342
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_idu_rtu_pst_dis_inst3_vreg"); @343
ct_rtu_expand_64  x_ct_rtu_expand_64_idu_rtu_pst_dis_inst3_vreg (
  .x_num                             (idu_rtu_pst_dis_inst3_vreg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst3_vreg_expand)
);


assign d0_vreg[63:0] = {64{idu_rtu_pst_dis_inst0_xreg_vld}}
                       & idu_rtu_pst_dis_inst0_vreg_expand[63:0];
assign d1_vreg[63:0] = {64{idu_rtu_pst_dis_inst1_xreg_vld}}
                       & idu_rtu_pst_dis_inst1_vreg_expand[63:0];
assign d2_vreg[63:0] = {64{idu_rtu_pst_dis_inst2_xreg_vld}}
                       & idu_rtu_pst_dis_inst2_vreg_expand[63:0];
assign d3_vreg[63:0] = {64{idu_rtu_pst_dis_inst3_xreg_vld}}
                       & idu_rtu_pst_dis_inst3_vreg_expand[63:0];

assign vreg0_create_vld[3:0]  = {d3_vreg[0], d2_vreg[0], d1_vreg[0], d0_vreg[0]};
assign vreg1_create_vld[3:0]  = {d3_vreg[1], d2_vreg[1], d1_vreg[1], d0_vreg[1]};
assign vreg2_create_vld[3:0]  = {d3_vreg[2], d2_vreg[2], d1_vreg[2], d0_vreg[2]};
assign vreg3_create_vld[3:0]  = {d3_vreg[3], d2_vreg[3], d1_vreg[3], d0_vreg[3]};
assign vreg4_create_vld[3:0]  = {d3_vreg[4], d2_vreg[4], d1_vreg[4], d0_vreg[4]};
assign vreg5_create_vld[3:0]  = {d3_vreg[5], d2_vreg[5], d1_vreg[5], d0_vreg[5]};
assign vreg6_create_vld[3:0]  = {d3_vreg[6], d2_vreg[6], d1_vreg[6], d0_vreg[6]};
assign vreg7_create_vld[3:0]  = {d3_vreg[7], d2_vreg[7], d1_vreg[7], d0_vreg[7]};
assign vreg8_create_vld[3:0]  = {d3_vreg[8], d2_vreg[8], d1_vreg[8], d0_vreg[8]};
assign vreg9_create_vld[3:0]  = {d3_vreg[9], d2_vreg[9], d1_vreg[9], d0_vreg[9]};
assign vreg10_create_vld[3:0] = {d3_vreg[10],d2_vreg[10],d1_vreg[10],d0_vreg[10]};
assign vreg11_create_vld[3:0] = {d3_vreg[11],d2_vreg[11],d1_vreg[11],d0_vreg[11]};
assign vreg12_create_vld[3:0] = {d3_vreg[12],d2_vreg[12],d1_vreg[12],d0_vreg[12]};
assign vreg13_create_vld[3:0] = {d3_vreg[13],d2_vreg[13],d1_vreg[13],d0_vreg[13]};
assign vreg14_create_vld[3:0] = {d3_vreg[14],d2_vreg[14],d1_vreg[14],d0_vreg[14]};
assign vreg15_create_vld[3:0] = {d3_vreg[15],d2_vreg[15],d1_vreg[15],d0_vreg[15]};
assign vreg16_create_vld[3:0] = {d3_vreg[16],d2_vreg[16],d1_vreg[16],d0_vreg[16]};
assign vreg17_create_vld[3:0] = {d3_vreg[17],d2_vreg[17],d1_vreg[17],d0_vreg[17]};
assign vreg18_create_vld[3:0] = {d3_vreg[18],d2_vreg[18],d1_vreg[18],d0_vreg[18]};
assign vreg19_create_vld[3:0] = {d3_vreg[19],d2_vreg[19],d1_vreg[19],d0_vreg[19]};
assign vreg20_create_vld[3:0] = {d3_vreg[20],d2_vreg[20],d1_vreg[20],d0_vreg[20]};
assign vreg21_create_vld[3:0] = {d3_vreg[21],d2_vreg[21],d1_vreg[21],d0_vreg[21]};
assign vreg22_create_vld[3:0] = {d3_vreg[22],d2_vreg[22],d1_vreg[22],d0_vreg[22]};
assign vreg23_create_vld[3:0] = {d3_vreg[23],d2_vreg[23],d1_vreg[23],d0_vreg[23]};
assign vreg24_create_vld[3:0] = {d3_vreg[24],d2_vreg[24],d1_vreg[24],d0_vreg[24]};
assign vreg25_create_vld[3:0] = {d3_vreg[25],d2_vreg[25],d1_vreg[25],d0_vreg[25]};
assign vreg26_create_vld[3:0] = {d3_vreg[26],d2_vreg[26],d1_vreg[26],d0_vreg[26]};
assign vreg27_create_vld[3:0] = {d3_vreg[27],d2_vreg[27],d1_vreg[27],d0_vreg[27]};
assign vreg28_create_vld[3:0] = {d3_vreg[28],d2_vreg[28],d1_vreg[28],d0_vreg[28]};
assign vreg29_create_vld[3:0] = {d3_vreg[29],d2_vreg[29],d1_vreg[29],d0_vreg[29]};
assign vreg30_create_vld[3:0] = {d3_vreg[30],d2_vreg[30],d1_vreg[30],d0_vreg[30]};
assign vreg31_create_vld[3:0] = {d3_vreg[31],d2_vreg[31],d1_vreg[31],d0_vreg[31]};
assign vreg32_create_vld[3:0] = {d3_vreg[32],d2_vreg[32],d1_vreg[32],d0_vreg[32]};
assign vreg33_create_vld[3:0] = {d3_vreg[33],d2_vreg[33],d1_vreg[33],d0_vreg[33]};
assign vreg34_create_vld[3:0] = {d3_vreg[34],d2_vreg[34],d1_vreg[34],d0_vreg[34]};
assign vreg35_create_vld[3:0] = {d3_vreg[35],d2_vreg[35],d1_vreg[35],d0_vreg[35]};
assign vreg36_create_vld[3:0] = {d3_vreg[36],d2_vreg[36],d1_vreg[36],d0_vreg[36]};
assign vreg37_create_vld[3:0] = {d3_vreg[37],d2_vreg[37],d1_vreg[37],d0_vreg[37]};
assign vreg38_create_vld[3:0] = {d3_vreg[38],d2_vreg[38],d1_vreg[38],d0_vreg[38]};
assign vreg39_create_vld[3:0] = {d3_vreg[39],d2_vreg[39],d1_vreg[39],d0_vreg[39]};
assign vreg40_create_vld[3:0] = {d3_vreg[40],d2_vreg[40],d1_vreg[40],d0_vreg[40]};
assign vreg41_create_vld[3:0] = {d3_vreg[41],d2_vreg[41],d1_vreg[41],d0_vreg[41]};
assign vreg42_create_vld[3:0] = {d3_vreg[42],d2_vreg[42],d1_vreg[42],d0_vreg[42]};
assign vreg43_create_vld[3:0] = {d3_vreg[43],d2_vreg[43],d1_vreg[43],d0_vreg[43]};
assign vreg44_create_vld[3:0] = {d3_vreg[44],d2_vreg[44],d1_vreg[44],d0_vreg[44]};
assign vreg45_create_vld[3:0] = {d3_vreg[45],d2_vreg[45],d1_vreg[45],d0_vreg[45]};
assign vreg46_create_vld[3:0] = {d3_vreg[46],d2_vreg[46],d1_vreg[46],d0_vreg[46]};
assign vreg47_create_vld[3:0] = {d3_vreg[47],d2_vreg[47],d1_vreg[47],d0_vreg[47]};
assign vreg48_create_vld[3:0] = {d3_vreg[48],d2_vreg[48],d1_vreg[48],d0_vreg[48]};
assign vreg49_create_vld[3:0] = {d3_vreg[49],d2_vreg[49],d1_vreg[49],d0_vreg[49]};
assign vreg50_create_vld[3:0] = {d3_vreg[50],d2_vreg[50],d1_vreg[50],d0_vreg[50]};
assign vreg51_create_vld[3:0] = {d3_vreg[51],d2_vreg[51],d1_vreg[51],d0_vreg[51]};
assign vreg52_create_vld[3:0] = {d3_vreg[52],d2_vreg[52],d1_vreg[52],d0_vreg[52]};
assign vreg53_create_vld[3:0] = {d3_vreg[53],d2_vreg[53],d1_vreg[53],d0_vreg[53]};
assign vreg54_create_vld[3:0] = {d3_vreg[54],d2_vreg[54],d1_vreg[54],d0_vreg[54]};
assign vreg55_create_vld[3:0] = {d3_vreg[55],d2_vreg[55],d1_vreg[55],d0_vreg[55]};
assign vreg56_create_vld[3:0] = {d3_vreg[56],d2_vreg[56],d1_vreg[56],d0_vreg[56]};
assign vreg57_create_vld[3:0] = {d3_vreg[57],d2_vreg[57],d1_vreg[57],d0_vreg[57]};
assign vreg58_create_vld[3:0] = {d3_vreg[58],d2_vreg[58],d1_vreg[58],d0_vreg[58]};
assign vreg59_create_vld[3:0] = {d3_vreg[59],d2_vreg[59],d1_vreg[59],d0_vreg[59]};
assign vreg60_create_vld[3:0] = {d3_vreg[60],d2_vreg[60],d1_vreg[60],d0_vreg[60]};
assign vreg61_create_vld[3:0] = {d3_vreg[61],d2_vreg[61],d1_vreg[61],d0_vreg[61]};
assign vreg62_create_vld[3:0] = {d3_vreg[62],d2_vreg[62],d1_vreg[62],d0_vreg[62]};
assign vreg63_create_vld[3:0] = {d3_vreg[63],d2_vreg[63],d1_vreg[63],d0_vreg[63]};

//==========================================================
//                    Write back signals
//==========================================================
assign wb_vld[63:0] =
    {64{vfpu_rtu_ex5_pipe6_wb_vreg_vld}} & vfpu_rtu_ex5_pipe6_wb_vreg_expand[63:0]
  | {64{vfpu_rtu_ex5_pipe7_wb_vreg_vld}} & vfpu_rtu_ex5_pipe7_wb_vreg_expand[63:0]
  | {64{lsu_rtu_wb_pipe3_wb_vreg_vld}}   & lsu_rtu_wb_pipe3_wb_vreg_expand[63:0];

assign vreg0_wb_vld  = wb_vld[0];
assign vreg1_wb_vld  = wb_vld[1];
assign vreg2_wb_vld  = wb_vld[2];
assign vreg3_wb_vld  = wb_vld[3];
assign vreg4_wb_vld  = wb_vld[4];
assign vreg5_wb_vld  = wb_vld[5];
assign vreg6_wb_vld  = wb_vld[6];
assign vreg7_wb_vld  = wb_vld[7];
assign vreg8_wb_vld  = wb_vld[8];
assign vreg9_wb_vld  = wb_vld[9];
assign vreg10_wb_vld = wb_vld[10];
assign vreg11_wb_vld = wb_vld[11];
assign vreg12_wb_vld = wb_vld[12];
assign vreg13_wb_vld = wb_vld[13];
assign vreg14_wb_vld = wb_vld[14];
assign vreg15_wb_vld = wb_vld[15];
assign vreg16_wb_vld = wb_vld[16];
assign vreg17_wb_vld = wb_vld[17];
assign vreg18_wb_vld = wb_vld[18];
assign vreg19_wb_vld = wb_vld[19];
assign vreg20_wb_vld = wb_vld[20];
assign vreg21_wb_vld = wb_vld[21];
assign vreg22_wb_vld = wb_vld[22];
assign vreg23_wb_vld = wb_vld[23];
assign vreg24_wb_vld = wb_vld[24];
assign vreg25_wb_vld = wb_vld[25];
assign vreg26_wb_vld = wb_vld[26];
assign vreg27_wb_vld = wb_vld[27];
assign vreg28_wb_vld = wb_vld[28];
assign vreg29_wb_vld = wb_vld[29];
assign vreg30_wb_vld = wb_vld[30];
assign vreg31_wb_vld = wb_vld[31];
assign vreg32_wb_vld = wb_vld[32];
assign vreg33_wb_vld = wb_vld[33];
assign vreg34_wb_vld = wb_vld[34];
assign vreg35_wb_vld = wb_vld[35];
assign vreg36_wb_vld = wb_vld[36];
assign vreg37_wb_vld = wb_vld[37];
assign vreg38_wb_vld = wb_vld[38];
assign vreg39_wb_vld = wb_vld[39];
assign vreg40_wb_vld = wb_vld[40];
assign vreg41_wb_vld = wb_vld[41];
assign vreg42_wb_vld = wb_vld[42];
assign vreg43_wb_vld = wb_vld[43];
assign vreg44_wb_vld = wb_vld[44];
assign vreg45_wb_vld = wb_vld[45];
assign vreg46_wb_vld = wb_vld[46];
assign vreg47_wb_vld = wb_vld[47];
assign vreg48_wb_vld = wb_vld[48];
assign vreg49_wb_vld = wb_vld[49];
assign vreg50_wb_vld = wb_vld[50];
assign vreg51_wb_vld = wb_vld[51];
assign vreg52_wb_vld = wb_vld[52];
assign vreg53_wb_vld = wb_vld[53];
assign vreg54_wb_vld = wb_vld[54];
assign vreg55_wb_vld = wb_vld[55];
assign vreg56_wb_vld = wb_vld[56];
assign vreg57_wb_vld = wb_vld[57];
assign vreg58_wb_vld = wb_vld[58];
assign vreg59_wb_vld = wb_vld[59];
assign vreg60_wb_vld = wb_vld[60];
assign vreg61_wb_vld = wb_vld[61];
assign vreg62_wb_vld = wb_vld[62];
assign vreg63_wb_vld = wb_vld[63];

//==========================================================
//                     Release signals
//==========================================================
assign release_vld[63:0] =
           vreg0_rel_vreg_expand[63:0]
         | vreg1_rel_vreg_expand[63:0]
         | vreg2_rel_vreg_expand[63:0]
         | vreg3_rel_vreg_expand[63:0]
         | vreg4_rel_vreg_expand[63:0]
         | vreg5_rel_vreg_expand[63:0]
         | vreg6_rel_vreg_expand[63:0]
         | vreg7_rel_vreg_expand[63:0]
         | vreg8_rel_vreg_expand[63:0]
         | vreg9_rel_vreg_expand[63:0]
         | vreg10_rel_vreg_expand[63:0]
         | vreg11_rel_vreg_expand[63:0]
         | vreg12_rel_vreg_expand[63:0]
         | vreg13_rel_vreg_expand[63:0]
         | vreg14_rel_vreg_expand[63:0]
         | vreg15_rel_vreg_expand[63:0]
         | vreg16_rel_vreg_expand[63:0]
         | vreg17_rel_vreg_expand[63:0]
         | vreg18_rel_vreg_expand[63:0]
         | vreg19_rel_vreg_expand[63:0]
         | vreg20_rel_vreg_expand[63:0]
         | vreg21_rel_vreg_expand[63:0]
         | vreg22_rel_vreg_expand[63:0]
         | vreg23_rel_vreg_expand[63:0]
         | vreg24_rel_vreg_expand[63:0]
         | vreg25_rel_vreg_expand[63:0]
         | vreg26_rel_vreg_expand[63:0]
         | vreg27_rel_vreg_expand[63:0]
         | vreg28_rel_vreg_expand[63:0]
         | vreg29_rel_vreg_expand[63:0]
         | vreg30_rel_vreg_expand[63:0]
         | vreg31_rel_vreg_expand[63:0]
         | vreg32_rel_vreg_expand[63:0]
         | vreg33_rel_vreg_expand[63:0]
         | vreg34_rel_vreg_expand[63:0]
         | vreg35_rel_vreg_expand[63:0]
         | vreg36_rel_vreg_expand[63:0]
         | vreg37_rel_vreg_expand[63:0]
         | vreg38_rel_vreg_expand[63:0]
         | vreg39_rel_vreg_expand[63:0]
         | vreg40_rel_vreg_expand[63:0]
         | vreg41_rel_vreg_expand[63:0]
         | vreg42_rel_vreg_expand[63:0]
         | vreg43_rel_vreg_expand[63:0]
         | vreg44_rel_vreg_expand[63:0]
         | vreg45_rel_vreg_expand[63:0]
         | vreg46_rel_vreg_expand[63:0]
         | vreg47_rel_vreg_expand[63:0]
         | vreg48_rel_vreg_expand[63:0]
         | vreg49_rel_vreg_expand[63:0]
         | vreg50_rel_vreg_expand[63:0]
         | vreg51_rel_vreg_expand[63:0]
         | vreg52_rel_vreg_expand[63:0]
         | vreg53_rel_vreg_expand[63:0]
         | vreg54_rel_vreg_expand[63:0]
         | vreg55_rel_vreg_expand[63:0]
         | vreg56_rel_vreg_expand[63:0]
         | vreg57_rel_vreg_expand[63:0]
         | vreg58_rel_vreg_expand[63:0]
         | vreg59_rel_vreg_expand[63:0]
         | vreg60_rel_vreg_expand[63:0]
         | vreg61_rel_vreg_expand[63:0]
         | vreg62_rel_vreg_expand[63:0]
         | vreg63_rel_vreg_expand[63:0];

assign vreg0_release_vld  = release_vld[0];
assign vreg1_release_vld  = release_vld[1];
assign vreg2_release_vld  = release_vld[2];
assign vreg3_release_vld  = release_vld[3];
assign vreg4_release_vld  = release_vld[4];
assign vreg5_release_vld  = release_vld[5];
assign vreg6_release_vld  = release_vld[6];
assign vreg7_release_vld  = release_vld[7];
assign vreg8_release_vld  = release_vld[8];
assign vreg9_release_vld  = release_vld[9];
assign vreg10_release_vld = release_vld[10];
assign vreg11_release_vld = release_vld[11];
assign vreg12_release_vld = release_vld[12];
assign vreg13_release_vld = release_vld[13];
assign vreg14_release_vld = release_vld[14];
assign vreg15_release_vld = release_vld[15];
assign vreg16_release_vld = release_vld[16];
assign vreg17_release_vld = release_vld[17];
assign vreg18_release_vld = release_vld[18];
assign vreg19_release_vld = release_vld[19];
assign vreg20_release_vld = release_vld[20];
assign vreg21_release_vld = release_vld[21];
assign vreg22_release_vld = release_vld[22];
assign vreg23_release_vld = release_vld[23];
assign vreg24_release_vld = release_vld[24];
assign vreg25_release_vld = release_vld[25];
assign vreg26_release_vld = release_vld[26];
assign vreg27_release_vld = release_vld[27];
assign vreg28_release_vld = release_vld[28];
assign vreg29_release_vld = release_vld[29];
assign vreg30_release_vld = release_vld[30];
assign vreg31_release_vld = release_vld[31];
assign vreg32_release_vld = release_vld[32];
assign vreg33_release_vld = release_vld[33];
assign vreg34_release_vld = release_vld[34];
assign vreg35_release_vld = release_vld[35];
assign vreg36_release_vld = release_vld[36];
assign vreg37_release_vld = release_vld[37];
assign vreg38_release_vld = release_vld[38];
assign vreg39_release_vld = release_vld[39];
assign vreg40_release_vld = release_vld[40];
assign vreg41_release_vld = release_vld[41];
assign vreg42_release_vld = release_vld[42];
assign vreg43_release_vld = release_vld[43];
assign vreg44_release_vld = release_vld[44];
assign vreg45_release_vld = release_vld[45];
assign vreg46_release_vld = release_vld[46];
assign vreg47_release_vld = release_vld[47];
assign vreg48_release_vld = release_vld[48];
assign vreg49_release_vld = release_vld[49];
assign vreg50_release_vld = release_vld[50];
assign vreg51_release_vld = release_vld[51];
assign vreg52_release_vld = release_vld[52];
assign vreg53_release_vld = release_vld[53];
assign vreg54_release_vld = release_vld[54];
assign vreg55_release_vld = release_vld[55];
assign vreg56_release_vld = release_vld[56];
assign vreg57_release_vld = release_vld[57];
assign vreg58_release_vld = release_vld[58];
assign vreg59_release_vld = release_vld[59];
assign vreg60_release_vld = release_vld[60];
assign vreg61_release_vld = release_vld[61];
assign vreg62_release_vld = release_vld[62];
assign vreg63_release_vld = release_vld[63];

//==========================================================
//               Alloc and Release signals
//==========================================================
//for gateclk
assign alloc_release[0]  = vreg0_cur_state_alloc_release;
assign alloc_release[1]  = vreg1_cur_state_alloc_release;
assign alloc_release[2]  = vreg2_cur_state_alloc_release;
assign alloc_release[3]  = vreg3_cur_state_alloc_release;
assign alloc_release[4]  = vreg4_cur_state_alloc_release;
assign alloc_release[5]  = vreg5_cur_state_alloc_release;
assign alloc_release[6]  = vreg6_cur_state_alloc_release;
assign alloc_release[7]  = vreg7_cur_state_alloc_release;
assign alloc_release[8]  = vreg8_cur_state_alloc_release;
assign alloc_release[9]  = vreg9_cur_state_alloc_release;
assign alloc_release[10] = vreg10_cur_state_alloc_release;
assign alloc_release[11] = vreg11_cur_state_alloc_release;
assign alloc_release[12] = vreg12_cur_state_alloc_release;
assign alloc_release[13] = vreg13_cur_state_alloc_release;
assign alloc_release[14] = vreg14_cur_state_alloc_release;
assign alloc_release[15] = vreg15_cur_state_alloc_release;
assign alloc_release[16] = vreg16_cur_state_alloc_release;
assign alloc_release[17] = vreg17_cur_state_alloc_release;
assign alloc_release[18] = vreg18_cur_state_alloc_release;
assign alloc_release[19] = vreg19_cur_state_alloc_release;
assign alloc_release[20] = vreg20_cur_state_alloc_release;
assign alloc_release[21] = vreg21_cur_state_alloc_release;
assign alloc_release[22] = vreg22_cur_state_alloc_release;
assign alloc_release[23] = vreg23_cur_state_alloc_release;
assign alloc_release[24] = vreg24_cur_state_alloc_release;
assign alloc_release[25] = vreg25_cur_state_alloc_release;
assign alloc_release[26] = vreg26_cur_state_alloc_release;
assign alloc_release[27] = vreg27_cur_state_alloc_release;
assign alloc_release[28] = vreg28_cur_state_alloc_release;
assign alloc_release[29] = vreg29_cur_state_alloc_release;
assign alloc_release[30] = vreg30_cur_state_alloc_release;
assign alloc_release[31] = vreg31_cur_state_alloc_release;
assign alloc_release[32] = vreg32_cur_state_alloc_release;
assign alloc_release[33] = vreg33_cur_state_alloc_release;
assign alloc_release[34] = vreg34_cur_state_alloc_release;
assign alloc_release[35] = vreg35_cur_state_alloc_release;
assign alloc_release[36] = vreg36_cur_state_alloc_release;
assign alloc_release[37] = vreg37_cur_state_alloc_release;
assign alloc_release[38] = vreg38_cur_state_alloc_release;
assign alloc_release[39] = vreg39_cur_state_alloc_release;
assign alloc_release[40] = vreg40_cur_state_alloc_release;
assign alloc_release[41] = vreg41_cur_state_alloc_release;
assign alloc_release[42] = vreg42_cur_state_alloc_release;
assign alloc_release[43] = vreg43_cur_state_alloc_release;
assign alloc_release[44] = vreg44_cur_state_alloc_release;
assign alloc_release[45] = vreg45_cur_state_alloc_release;
assign alloc_release[46] = vreg46_cur_state_alloc_release;
assign alloc_release[47] = vreg47_cur_state_alloc_release;
assign alloc_release[48] = vreg48_cur_state_alloc_release;
assign alloc_release[49] = vreg49_cur_state_alloc_release;
assign alloc_release[50] = vreg50_cur_state_alloc_release;
assign alloc_release[51] = vreg51_cur_state_alloc_release;
assign alloc_release[52] = vreg52_cur_state_alloc_release;
assign alloc_release[53] = vreg53_cur_state_alloc_release;
assign alloc_release[54] = vreg54_cur_state_alloc_release;
assign alloc_release[55] = vreg55_cur_state_alloc_release;
assign alloc_release[56] = vreg56_cur_state_alloc_release;
assign alloc_release[57] = vreg57_cur_state_alloc_release;
assign alloc_release[58] = vreg58_cur_state_alloc_release;
assign alloc_release[59] = vreg59_cur_state_alloc_release;
assign alloc_release[60] = vreg60_cur_state_alloc_release;
assign alloc_release[61] = vreg61_cur_state_alloc_release;
assign alloc_release[62] = vreg62_cur_state_alloc_release;
assign alloc_release[63] = vreg63_cur_state_alloc_release;

assign vreg_alloc_release = |alloc_release[63:0];

//==========================================================
//                     Dealloc signals
//==========================================================
//----------------------------------------------------------
//                calculate dealloc vector
//----------------------------------------------------------
//get all entry dealloc bits
assign dealloc[0]  = vreg0_cur_state_dealloc;
assign dealloc[1]  = vreg1_cur_state_dealloc;
assign dealloc[2]  = vreg2_cur_state_dealloc;
assign dealloc[3]  = vreg3_cur_state_dealloc;
assign dealloc[4]  = vreg4_cur_state_dealloc;
assign dealloc[5]  = vreg5_cur_state_dealloc;
assign dealloc[6]  = vreg6_cur_state_dealloc;
assign dealloc[7]  = vreg7_cur_state_dealloc;
assign dealloc[8]  = vreg8_cur_state_dealloc;
assign dealloc[9]  = vreg9_cur_state_dealloc;
assign dealloc[10] = vreg10_cur_state_dealloc;
assign dealloc[11] = vreg11_cur_state_dealloc;
assign dealloc[12] = vreg12_cur_state_dealloc;
assign dealloc[13] = vreg13_cur_state_dealloc;
assign dealloc[14] = vreg14_cur_state_dealloc;
assign dealloc[15] = vreg15_cur_state_dealloc;
assign dealloc[16] = vreg16_cur_state_dealloc;
assign dealloc[17] = vreg17_cur_state_dealloc;
assign dealloc[18] = vreg18_cur_state_dealloc;
assign dealloc[19] = vreg19_cur_state_dealloc;
assign dealloc[20] = vreg20_cur_state_dealloc;
assign dealloc[21] = vreg21_cur_state_dealloc;
assign dealloc[22] = vreg22_cur_state_dealloc;
assign dealloc[23] = vreg23_cur_state_dealloc;
assign dealloc[24] = vreg24_cur_state_dealloc;
assign dealloc[25] = vreg25_cur_state_dealloc;
assign dealloc[26] = vreg26_cur_state_dealloc;
assign dealloc[27] = vreg27_cur_state_dealloc;
assign dealloc[28] = vreg28_cur_state_dealloc;
assign dealloc[29] = vreg29_cur_state_dealloc;
assign dealloc[30] = vreg30_cur_state_dealloc;
assign dealloc[31] = vreg31_cur_state_dealloc;
assign dealloc[32] = vreg32_cur_state_dealloc;
assign dealloc[33] = vreg33_cur_state_dealloc;
assign dealloc[34] = vreg34_cur_state_dealloc;
assign dealloc[35] = vreg35_cur_state_dealloc;
assign dealloc[36] = vreg36_cur_state_dealloc;
assign dealloc[37] = vreg37_cur_state_dealloc;
assign dealloc[38] = vreg38_cur_state_dealloc;
assign dealloc[39] = vreg39_cur_state_dealloc;
assign dealloc[40] = vreg40_cur_state_dealloc;
assign dealloc[41] = vreg41_cur_state_dealloc;
assign dealloc[42] = vreg42_cur_state_dealloc;
assign dealloc[43] = vreg43_cur_state_dealloc;
assign dealloc[44] = vreg44_cur_state_dealloc;
assign dealloc[45] = vreg45_cur_state_dealloc;
assign dealloc[46] = vreg46_cur_state_dealloc;
assign dealloc[47] = vreg47_cur_state_dealloc;
assign dealloc[48] = vreg48_cur_state_dealloc;
assign dealloc[49] = vreg49_cur_state_dealloc;
assign dealloc[50] = vreg50_cur_state_dealloc;
assign dealloc[51] = vreg51_cur_state_dealloc;
assign dealloc[52] = vreg52_cur_state_dealloc;
assign dealloc[53] = vreg53_cur_state_dealloc;
assign dealloc[54] = vreg54_cur_state_dealloc;
assign dealloc[55] = vreg55_cur_state_dealloc;
assign dealloc[56] = vreg56_cur_state_dealloc;
assign dealloc[57] = vreg57_cur_state_dealloc;
assign dealloc[58] = vreg58_cur_state_dealloc;
assign dealloc[59] = vreg59_cur_state_dealloc;
assign dealloc[60] = vreg60_cur_state_dealloc;
assign dealloc[61] = vreg61_cur_state_dealloc;
assign dealloc[62] = vreg62_cur_state_dealloc;
assign dealloc[63] = vreg63_cur_state_dealloc;

//one-hot dealloc vreg 0,
//search priority is from p0 to p63
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

//one-hot dealloc vreg 1,
//search priority is from p63 to p0
assign dealloc1[0]  = dealloc[0]  && !(|dealloc[63:1]);
assign dealloc1[1]  = dealloc[1]  && !(|dealloc[63:2]);
assign dealloc1[2]  = dealloc[2]  && !(|dealloc[63:3]);
assign dealloc1[3]  = dealloc[3]  && !(|dealloc[63:4]);
assign dealloc1[4]  = dealloc[4]  && !(|dealloc[63:5]);
assign dealloc1[5]  = dealloc[5]  && !(|dealloc[63:6]);
assign dealloc1[6]  = dealloc[6]  && !(|dealloc[63:7]);
assign dealloc1[7]  = dealloc[7]  && !(|dealloc[63:8]);
assign dealloc1[8]  = dealloc[8]  && !(|dealloc[63:9]);
assign dealloc1[9]  = dealloc[9]  && !(|dealloc[63:10]);
assign dealloc1[10] = dealloc[10] && !(|dealloc[63:11]);
assign dealloc1[11] = dealloc[11] && !(|dealloc[63:12]);
assign dealloc1[12] = dealloc[12] && !(|dealloc[63:13]);
assign dealloc1[13] = dealloc[13] && !(|dealloc[63:14]);
assign dealloc1[14] = dealloc[14] && !(|dealloc[63:15]);
assign dealloc1[15] = dealloc[15] && !(|dealloc[63:16]);
assign dealloc1[16] = dealloc[16] && !(|dealloc[63:17]);
assign dealloc1[17] = dealloc[17] && !(|dealloc[63:18]);
assign dealloc1[18] = dealloc[18] && !(|dealloc[63:19]);
assign dealloc1[19] = dealloc[19] && !(|dealloc[63:20]);
assign dealloc1[20] = dealloc[20] && !(|dealloc[63:21]);
assign dealloc1[21] = dealloc[21] && !(|dealloc[63:22]);
assign dealloc1[22] = dealloc[22] && !(|dealloc[63:23]);
assign dealloc1[23] = dealloc[23] && !(|dealloc[63:24]);
assign dealloc1[24] = dealloc[24] && !(|dealloc[63:25]);
assign dealloc1[25] = dealloc[25] && !(|dealloc[63:26]);
assign dealloc1[26] = dealloc[26] && !(|dealloc[63:27]);
assign dealloc1[27] = dealloc[27] && !(|dealloc[63:28]);
assign dealloc1[28] = dealloc[28] && !(|dealloc[63:29]);
assign dealloc1[29] = dealloc[29] && !(|dealloc[63:30]);
assign dealloc1[30] = dealloc[30] && !(|dealloc[63:31]);
assign dealloc1[31] = dealloc[31] && !(|dealloc[63:32]);
assign dealloc1[32] = dealloc[32] && !(|dealloc[63:33]);
assign dealloc1[33] = dealloc[33] && !(|dealloc[63:34]);
assign dealloc1[34] = dealloc[34] && !(|dealloc[63:35]);
assign dealloc1[35] = dealloc[35] && !(|dealloc[63:36]);
assign dealloc1[36] = dealloc[36] && !(|dealloc[63:37]);
assign dealloc1[37] = dealloc[37] && !(|dealloc[63:38]);
assign dealloc1[38] = dealloc[38] && !(|dealloc[63:39]);
assign dealloc1[39] = dealloc[39] && !(|dealloc[63:40]);
assign dealloc1[40] = dealloc[40] && !(|dealloc[63:41]);
assign dealloc1[41] = dealloc[41] && !(|dealloc[63:42]);
assign dealloc1[42] = dealloc[42] && !(|dealloc[63:43]);
assign dealloc1[43] = dealloc[43] && !(|dealloc[63:44]);
assign dealloc1[44] = dealloc[44] && !(|dealloc[63:45]);
assign dealloc1[45] = dealloc[45] && !(|dealloc[63:46]);
assign dealloc1[46] = dealloc[46] && !(|dealloc[63:47]);
assign dealloc1[47] = dealloc[47] && !(|dealloc[63:48]);
assign dealloc1[48] = dealloc[48] && !(|dealloc[63:49]);
assign dealloc1[49] = dealloc[49] && !(|dealloc[63:50]);
assign dealloc1[50] = dealloc[50] && !(|dealloc[63:51]);
assign dealloc1[51] = dealloc[51] && !(|dealloc[63:52]);
assign dealloc1[52] = dealloc[52] && !(|dealloc[63:53]);
assign dealloc1[53] = dealloc[53] && !(|dealloc[63:54]);
assign dealloc1[54] = dealloc[54] && !(|dealloc[63:55]);
assign dealloc1[55] = dealloc[55] && !(|dealloc[63:56]);
assign dealloc1[56] = dealloc[56] && !(|dealloc[63:57]);
assign dealloc1[57] = dealloc[57] && !(|dealloc[63:58]);
assign dealloc1[58] = dealloc[58] && !(|dealloc[63:59]);
assign dealloc1[59] = dealloc[59] && !(|dealloc[63:60]);
assign dealloc1[60] = dealloc[60] && !(|dealloc[63:61]);
assign dealloc1[61] = dealloc[61] && !(|dealloc[63:62]);
assign dealloc1[62] = dealloc[62] && !dealloc[63];
assign dealloc1[63] = dealloc[63];

//one-hot dealloc vreg 2,
//remove dealloc vreg 0, and then search priority is from p0 to p63
assign dealloc_no_0[63:0] = dealloc[63:0] & ~dealloc0[63:0];

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

//one-hot dealloc vreg 3,
//remove dealloc vreg 1, and then search priority is from p63 to p0
assign dealloc_no_1[63:0] = dealloc[63:0] & ~dealloc1[63:0];

assign dealloc3[0]  = dealloc_no_1[0]  && !(|dealloc_no_1[63:1]);
assign dealloc3[1]  = dealloc_no_1[1]  && !(|dealloc_no_1[63:2]);
assign dealloc3[2]  = dealloc_no_1[2]  && !(|dealloc_no_1[63:3]);
assign dealloc3[3]  = dealloc_no_1[3]  && !(|dealloc_no_1[63:4]);
assign dealloc3[4]  = dealloc_no_1[4]  && !(|dealloc_no_1[63:5]);
assign dealloc3[5]  = dealloc_no_1[5]  && !(|dealloc_no_1[63:6]);
assign dealloc3[6]  = dealloc_no_1[6]  && !(|dealloc_no_1[63:7]);
assign dealloc3[7]  = dealloc_no_1[7]  && !(|dealloc_no_1[63:8]);
assign dealloc3[8]  = dealloc_no_1[8]  && !(|dealloc_no_1[63:9]);
assign dealloc3[9]  = dealloc_no_1[9]  && !(|dealloc_no_1[63:10]);
assign dealloc3[10] = dealloc_no_1[10] && !(|dealloc_no_1[63:11]);
assign dealloc3[11] = dealloc_no_1[11] && !(|dealloc_no_1[63:12]);
assign dealloc3[12] = dealloc_no_1[12] && !(|dealloc_no_1[63:13]);
assign dealloc3[13] = dealloc_no_1[13] && !(|dealloc_no_1[63:14]);
assign dealloc3[14] = dealloc_no_1[14] && !(|dealloc_no_1[63:15]);
assign dealloc3[15] = dealloc_no_1[15] && !(|dealloc_no_1[63:16]);
assign dealloc3[16] = dealloc_no_1[16] && !(|dealloc_no_1[63:17]);
assign dealloc3[17] = dealloc_no_1[17] && !(|dealloc_no_1[63:18]);
assign dealloc3[18] = dealloc_no_1[18] && !(|dealloc_no_1[63:19]);
assign dealloc3[19] = dealloc_no_1[19] && !(|dealloc_no_1[63:20]);
assign dealloc3[20] = dealloc_no_1[20] && !(|dealloc_no_1[63:21]);
assign dealloc3[21] = dealloc_no_1[21] && !(|dealloc_no_1[63:22]);
assign dealloc3[22] = dealloc_no_1[22] && !(|dealloc_no_1[63:23]);
assign dealloc3[23] = dealloc_no_1[23] && !(|dealloc_no_1[63:24]);
assign dealloc3[24] = dealloc_no_1[24] && !(|dealloc_no_1[63:25]);
assign dealloc3[25] = dealloc_no_1[25] && !(|dealloc_no_1[63:26]);
assign dealloc3[26] = dealloc_no_1[26] && !(|dealloc_no_1[63:27]);
assign dealloc3[27] = dealloc_no_1[27] && !(|dealloc_no_1[63:28]);
assign dealloc3[28] = dealloc_no_1[28] && !(|dealloc_no_1[63:29]);
assign dealloc3[29] = dealloc_no_1[29] && !(|dealloc_no_1[63:30]);
assign dealloc3[30] = dealloc_no_1[30] && !(|dealloc_no_1[63:31]);
assign dealloc3[31] = dealloc_no_1[31] && !(|dealloc_no_1[63:32]);
assign dealloc3[32] = dealloc_no_1[32] && !(|dealloc_no_1[63:33]);
assign dealloc3[33] = dealloc_no_1[33] && !(|dealloc_no_1[63:34]);
assign dealloc3[34] = dealloc_no_1[34] && !(|dealloc_no_1[63:35]);
assign dealloc3[35] = dealloc_no_1[35] && !(|dealloc_no_1[63:36]);
assign dealloc3[36] = dealloc_no_1[36] && !(|dealloc_no_1[63:37]);
assign dealloc3[37] = dealloc_no_1[37] && !(|dealloc_no_1[63:38]);
assign dealloc3[38] = dealloc_no_1[38] && !(|dealloc_no_1[63:39]);
assign dealloc3[39] = dealloc_no_1[39] && !(|dealloc_no_1[63:40]);
assign dealloc3[40] = dealloc_no_1[40] && !(|dealloc_no_1[63:41]);
assign dealloc3[41] = dealloc_no_1[41] && !(|dealloc_no_1[63:42]);
assign dealloc3[42] = dealloc_no_1[42] && !(|dealloc_no_1[63:43]);
assign dealloc3[43] = dealloc_no_1[43] && !(|dealloc_no_1[63:44]);
assign dealloc3[44] = dealloc_no_1[44] && !(|dealloc_no_1[63:45]);
assign dealloc3[45] = dealloc_no_1[45] && !(|dealloc_no_1[63:46]);
assign dealloc3[46] = dealloc_no_1[46] && !(|dealloc_no_1[63:47]);
assign dealloc3[47] = dealloc_no_1[47] && !(|dealloc_no_1[63:48]);
assign dealloc3[48] = dealloc_no_1[48] && !(|dealloc_no_1[63:49]);
assign dealloc3[49] = dealloc_no_1[49] && !(|dealloc_no_1[63:50]);
assign dealloc3[50] = dealloc_no_1[50] && !(|dealloc_no_1[63:51]);
assign dealloc3[51] = dealloc_no_1[51] && !(|dealloc_no_1[63:52]);
assign dealloc3[52] = dealloc_no_1[52] && !(|dealloc_no_1[63:53]);
assign dealloc3[53] = dealloc_no_1[53] && !(|dealloc_no_1[63:54]);
assign dealloc3[54] = dealloc_no_1[54] && !(|dealloc_no_1[63:55]);
assign dealloc3[55] = dealloc_no_1[55] && !(|dealloc_no_1[63:56]);
assign dealloc3[56] = dealloc_no_1[56] && !(|dealloc_no_1[63:57]);
assign dealloc3[57] = dealloc_no_1[57] && !(|dealloc_no_1[63:58]);
assign dealloc3[58] = dealloc_no_1[58] && !(|dealloc_no_1[63:59]);
assign dealloc3[59] = dealloc_no_1[59] && !(|dealloc_no_1[63:60]);
assign dealloc3[60] = dealloc_no_1[60] && !(|dealloc_no_1[63:61]);
assign dealloc3[61] = dealloc_no_1[61] && !(|dealloc_no_1[63:62]);
assign dealloc3[62] = dealloc_no_1[62] && !dealloc_no_1[63];
assign dealloc3[63] = dealloc_no_1[63];

//----------------------------------------------------------
//                deallocate vreg and valid
//----------------------------------------------------------
//deallocate vreg valid
assign dealloc_vreg0_vld = |dealloc[63:0];
assign dealloc_vreg1_vld = |dealloc_no_0[63:0];
assign dealloc_vreg2_vld = |(dealloc[63:0]
                             & ~dealloc0[63:0]
                             & ~dealloc1[63:0]);
assign dealloc_vreg3_vld = |(dealloc[63:0]
                             & ~dealloc0[63:0]
                             & ~dealloc1[63:0]
                             & ~dealloc2[63:0]);
//dealloc_vreg0/1/2/3
assign dealloc_vreg0_expand[63:0] = dealloc0[63:0];
assign dealloc_vreg1_expand[63:0] = dealloc1[63:0];
assign dealloc_vreg2_expand[63:0] = dealloc2[63:0];
assign dealloc_vreg3_expand[63:0] = dealloc3[63:0];

// &ConnRule(s/^x_num/dealloc_vreg0/); @1060
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_dealloc_vreg0"); @1061
ct_rtu_encode_64  x_ct_rtu_encode_64_dealloc_vreg0 (
  .x_num                (dealloc_vreg0       ),
  .x_num_expand         (dealloc_vreg0_expand)
);

// &ConnRule(s/^x_num/dealloc_vreg1/); @1062
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_dealloc_vreg1"); @1063
ct_rtu_encode_64  x_ct_rtu_encode_64_dealloc_vreg1 (
  .x_num                (dealloc_vreg1       ),
  .x_num_expand         (dealloc_vreg1_expand)
);

// &ConnRule(s/^x_num/dealloc_vreg2/); @1064
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_dealloc_vreg2"); @1065
ct_rtu_encode_64  x_ct_rtu_encode_64_dealloc_vreg2 (
  .x_num                (dealloc_vreg2       ),
  .x_num_expand         (dealloc_vreg2_expand)
);

// &ConnRule(s/^x_num/dealloc_vreg3/); @1066
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_dealloc_vreg3"); @1067
ct_rtu_encode_64  x_ct_rtu_encode_64_dealloc_vreg3 (
  .x_num                (dealloc_vreg3       ),
  .x_num_expand         (dealloc_vreg3_expand)
);


//----------------------------------------------------------
//                   deallocate signals
//----------------------------------------------------------
//deallocate vector without redundancy:
//if dealloc vreg is same as others, the vector is all 0
assign dealloc0_vec[63:0] = dealloc0[63:0];
assign dealloc1_vec[63:0] = dealloc1[63:0] & ~dealloc0[63:0];
assign dealloc2_vec[63:0] = dealloc2[63:0] & ~dealloc1[63:0];
assign dealloc3_vec[63:0] = dealloc3[63:0] & ~dealloc2[63:0] & ~dealloc0[63:0];

//alloc vreg 0/1/2/3 will be allocated to ir inst 0/1/2/3
assign alloc_vreg0_invalid = (!alloc_vreg0_vld
                              || idu_rtu_ir_xreg0_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_vreg1_invalid = (!alloc_vreg1_vld
                              || idu_rtu_ir_xreg1_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_vreg2_invalid = (!alloc_vreg2_vld
                              || idu_rtu_ir_xreg2_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_vreg3_invalid = (!alloc_vreg3_vld
                              || idu_rtu_ir_xreg3_alloc_vld)
                             && !ifu_xx_sync_reset;

assign dealloc_vld[63:0] = {64{alloc_vreg0_invalid}} & dealloc0_vec[63:0]
                         | {64{alloc_vreg1_invalid}} & dealloc1_vec[63:0]
                         | {64{alloc_vreg2_invalid}} & dealloc2_vec[63:0]
                         | {64{alloc_vreg3_invalid}} & dealloc3_vec[63:0];

assign dealloc_vld_for_gateclk = !alloc_vreg0_vld
                              || !alloc_vreg1_vld
                              || !alloc_vreg2_vld
                              || !alloc_vreg3_vld
                              || idu_rtu_ir_xreg_alloc_gateclk_vld;

//assign dealloc_gateclk_vld[63:0] = {64{dealloc_vld_for_gateclk}}
//                                   & (dealloc0[63:0]
//                                    | dealloc1[63:0]
//                                    | dealloc2[63:0]
//                                    | dealloc3[63:0]);

assign vreg0_dealloc_vld  = dealloc_vld[0];
assign vreg1_dealloc_vld  = dealloc_vld[1];
assign vreg2_dealloc_vld  = dealloc_vld[2];
assign vreg3_dealloc_vld  = dealloc_vld[3];
assign vreg4_dealloc_vld  = dealloc_vld[4];
assign vreg5_dealloc_vld  = dealloc_vld[5];
assign vreg6_dealloc_vld  = dealloc_vld[6];
assign vreg7_dealloc_vld  = dealloc_vld[7];
assign vreg8_dealloc_vld  = dealloc_vld[8];
assign vreg9_dealloc_vld  = dealloc_vld[9];
assign vreg10_dealloc_vld = dealloc_vld[10];
assign vreg11_dealloc_vld = dealloc_vld[11];
assign vreg12_dealloc_vld = dealloc_vld[12];
assign vreg13_dealloc_vld = dealloc_vld[13];
assign vreg14_dealloc_vld = dealloc_vld[14];
assign vreg15_dealloc_vld = dealloc_vld[15];
assign vreg16_dealloc_vld = dealloc_vld[16];
assign vreg17_dealloc_vld = dealloc_vld[17];
assign vreg18_dealloc_vld = dealloc_vld[18];
assign vreg19_dealloc_vld = dealloc_vld[19];
assign vreg20_dealloc_vld = dealloc_vld[20];
assign vreg21_dealloc_vld = dealloc_vld[21];
assign vreg22_dealloc_vld = dealloc_vld[22];
assign vreg23_dealloc_vld = dealloc_vld[23];
assign vreg24_dealloc_vld = dealloc_vld[24];
assign vreg25_dealloc_vld = dealloc_vld[25];
assign vreg26_dealloc_vld = dealloc_vld[26];
assign vreg27_dealloc_vld = dealloc_vld[27];
assign vreg28_dealloc_vld = dealloc_vld[28];
assign vreg29_dealloc_vld = dealloc_vld[29];
assign vreg30_dealloc_vld = dealloc_vld[30];
assign vreg31_dealloc_vld = dealloc_vld[31];
assign vreg32_dealloc_vld = dealloc_vld[32];
assign vreg33_dealloc_vld = dealloc_vld[33];
assign vreg34_dealloc_vld = dealloc_vld[34];
assign vreg35_dealloc_vld = dealloc_vld[35];
assign vreg36_dealloc_vld = dealloc_vld[36];
assign vreg37_dealloc_vld = dealloc_vld[37];
assign vreg38_dealloc_vld = dealloc_vld[38];
assign vreg39_dealloc_vld = dealloc_vld[39];
assign vreg40_dealloc_vld = dealloc_vld[40];
assign vreg41_dealloc_vld = dealloc_vld[41];
assign vreg42_dealloc_vld = dealloc_vld[42];
assign vreg43_dealloc_vld = dealloc_vld[43];
assign vreg44_dealloc_vld = dealloc_vld[44];
assign vreg45_dealloc_vld = dealloc_vld[45];
assign vreg46_dealloc_vld = dealloc_vld[46];
assign vreg47_dealloc_vld = dealloc_vld[47];
assign vreg48_dealloc_vld = dealloc_vld[48];
assign vreg49_dealloc_vld = dealloc_vld[49];
assign vreg50_dealloc_vld = dealloc_vld[50];
assign vreg51_dealloc_vld = dealloc_vld[51];
assign vreg52_dealloc_vld = dealloc_vld[52];
assign vreg53_dealloc_vld = dealloc_vld[53];
assign vreg54_dealloc_vld = dealloc_vld[54];
assign vreg55_dealloc_vld = dealloc_vld[55];
assign vreg56_dealloc_vld = dealloc_vld[56];
assign vreg57_dealloc_vld = dealloc_vld[57];
assign vreg58_dealloc_vld = dealloc_vld[58];
assign vreg59_dealloc_vld = dealloc_vld[59];
assign vreg60_dealloc_vld = dealloc_vld[60];
assign vreg61_dealloc_vld = dealloc_vld[61];
assign vreg62_dealloc_vld = dealloc_vld[62];
assign vreg63_dealloc_vld = dealloc_vld[63];

//assign vreg0_dealloc_gateclk_vld  = dealloc_gateclk_vld[0];
//assign vreg1_dealloc_gateclk_vld  = dealloc_gateclk_vld[1];
//assign vreg2_dealloc_gateclk_vld  = dealloc_gateclk_vld[2];
//assign vreg3_dealloc_gateclk_vld  = dealloc_gateclk_vld[3];
//assign vreg4_dealloc_gateclk_vld  = dealloc_gateclk_vld[4];
//assign vreg5_dealloc_gateclk_vld  = dealloc_gateclk_vld[5];
//assign vreg6_dealloc_gateclk_vld  = dealloc_gateclk_vld[6];
//assign vreg7_dealloc_gateclk_vld  = dealloc_gateclk_vld[7];
//assign vreg8_dealloc_gateclk_vld  = dealloc_gateclk_vld[8];
//assign vreg9_dealloc_gateclk_vld  = dealloc_gateclk_vld[9];
//assign vreg10_dealloc_gateclk_vld = dealloc_gateclk_vld[10];
//assign vreg11_dealloc_gateclk_vld = dealloc_gateclk_vld[11];
//assign vreg12_dealloc_gateclk_vld = dealloc_gateclk_vld[12];
//assign vreg13_dealloc_gateclk_vld = dealloc_gateclk_vld[13];
//assign vreg14_dealloc_gateclk_vld = dealloc_gateclk_vld[14];
//assign vreg15_dealloc_gateclk_vld = dealloc_gateclk_vld[15];
//assign vreg16_dealloc_gateclk_vld = dealloc_gateclk_vld[16];
//assign vreg17_dealloc_gateclk_vld = dealloc_gateclk_vld[17];
//assign vreg18_dealloc_gateclk_vld = dealloc_gateclk_vld[18];
//assign vreg19_dealloc_gateclk_vld = dealloc_gateclk_vld[19];
//assign vreg20_dealloc_gateclk_vld = dealloc_gateclk_vld[20];
//assign vreg21_dealloc_gateclk_vld = dealloc_gateclk_vld[21];
//assign vreg22_dealloc_gateclk_vld = dealloc_gateclk_vld[22];
//assign vreg23_dealloc_gateclk_vld = dealloc_gateclk_vld[23];
//assign vreg24_dealloc_gateclk_vld = dealloc_gateclk_vld[24];
//assign vreg25_dealloc_gateclk_vld = dealloc_gateclk_vld[25];
//assign vreg26_dealloc_gateclk_vld = dealloc_gateclk_vld[26];
//assign vreg27_dealloc_gateclk_vld = dealloc_gateclk_vld[27];
//assign vreg28_dealloc_gateclk_vld = dealloc_gateclk_vld[28];
//assign vreg29_dealloc_gateclk_vld = dealloc_gateclk_vld[29];
//assign vreg30_dealloc_gateclk_vld = dealloc_gateclk_vld[30];
//assign vreg31_dealloc_gateclk_vld = dealloc_gateclk_vld[31];
//assign vreg32_dealloc_gateclk_vld = dealloc_gateclk_vld[32];
//assign vreg33_dealloc_gateclk_vld = dealloc_gateclk_vld[33];
//assign vreg34_dealloc_gateclk_vld = dealloc_gateclk_vld[34];
//assign vreg35_dealloc_gateclk_vld = dealloc_gateclk_vld[35];
//assign vreg36_dealloc_gateclk_vld = dealloc_gateclk_vld[36];
//assign vreg37_dealloc_gateclk_vld = dealloc_gateclk_vld[37];
//assign vreg38_dealloc_gateclk_vld = dealloc_gateclk_vld[38];
//assign vreg39_dealloc_gateclk_vld = dealloc_gateclk_vld[39];
//assign vreg40_dealloc_gateclk_vld = dealloc_gateclk_vld[40];
//assign vreg41_dealloc_gateclk_vld = dealloc_gateclk_vld[41];
//assign vreg42_dealloc_gateclk_vld = dealloc_gateclk_vld[42];
//assign vreg43_dealloc_gateclk_vld = dealloc_gateclk_vld[43];
//assign vreg44_dealloc_gateclk_vld = dealloc_gateclk_vld[44];
//assign vreg45_dealloc_gateclk_vld = dealloc_gateclk_vld[45];
//assign vreg46_dealloc_gateclk_vld = dealloc_gateclk_vld[46];
//assign vreg47_dealloc_gateclk_vld = dealloc_gateclk_vld[47];
//assign vreg48_dealloc_gateclk_vld = dealloc_gateclk_vld[48];
//assign vreg49_dealloc_gateclk_vld = dealloc_gateclk_vld[49];
//assign vreg50_dealloc_gateclk_vld = dealloc_gateclk_vld[50];
//assign vreg51_dealloc_gateclk_vld = dealloc_gateclk_vld[51];
//assign vreg52_dealloc_gateclk_vld = dealloc_gateclk_vld[52];
//assign vreg53_dealloc_gateclk_vld = dealloc_gateclk_vld[53];
//assign vreg54_dealloc_gateclk_vld = dealloc_gateclk_vld[54];
//assign vreg55_dealloc_gateclk_vld = dealloc_gateclk_vld[55];
//assign vreg56_dealloc_gateclk_vld = dealloc_gateclk_vld[56];
//assign vreg57_dealloc_gateclk_vld = dealloc_gateclk_vld[57];
//assign vreg58_dealloc_gateclk_vld = dealloc_gateclk_vld[58];
//assign vreg59_dealloc_gateclk_vld = dealloc_gateclk_vld[59];
//assign vreg60_dealloc_gateclk_vld = dealloc_gateclk_vld[60];
//assign vreg61_dealloc_gateclk_vld = dealloc_gateclk_vld[61];
//assign vreg62_dealloc_gateclk_vld = dealloc_gateclk_vld[62];
//assign vreg63_dealloc_gateclk_vld = dealloc_gateclk_vld[63];

assign vreg0_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[0];
assign vreg1_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[1];
assign vreg2_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[2];
assign vreg3_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[3];
assign vreg4_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[4];
assign vreg5_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[5];
assign vreg6_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[6];
assign vreg7_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[7];
assign vreg8_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[8];
assign vreg9_dealloc_mask  = idu_rtu_pst_xreg_dealloc_mask[9];
assign vreg10_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[10];
assign vreg11_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[11];
assign vreg12_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[12];
assign vreg13_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[13];
assign vreg14_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[14];
assign vreg15_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[15];
assign vreg16_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[16];
assign vreg17_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[17];
assign vreg18_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[18];
assign vreg19_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[19];
assign vreg20_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[20];
assign vreg21_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[21];
assign vreg22_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[22];
assign vreg23_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[23];
assign vreg24_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[24];
assign vreg25_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[25];
assign vreg26_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[26];
assign vreg27_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[27];
assign vreg28_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[28];
assign vreg29_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[29];
assign vreg30_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[30];
assign vreg31_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[31];
assign vreg32_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[32];
assign vreg33_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[33];
assign vreg34_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[34];
assign vreg35_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[35];
assign vreg36_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[36];
assign vreg37_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[37];
assign vreg38_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[38];
assign vreg39_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[39];
assign vreg40_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[40];
assign vreg41_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[41];
assign vreg42_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[42];
assign vreg43_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[43];
assign vreg44_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[44];
assign vreg45_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[45];
assign vreg46_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[46];
assign vreg47_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[47];
assign vreg48_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[48];
assign vreg49_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[49];
assign vreg50_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[50];
assign vreg51_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[51];
assign vreg52_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[52];
assign vreg53_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[53];
assign vreg54_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[54];
assign vreg55_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[55];
assign vreg56_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[56];
assign vreg57_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[57];
assign vreg58_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[58];
assign vreg59_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[59];
assign vreg60_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[60];
assign vreg61_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[61];
assign vreg62_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[62];
assign vreg63_dealloc_mask = idu_rtu_pst_xreg_dealloc_mask[63];

//==========================================================
//                  Allocate Vreg Registers
//==========================================================

//----------------------------------------------------------
//                  Instance of Gated Cell
//----------------------------------------------------------
assign alloc_vreg_clk_en = rtu_yy_xx_flush
                        || !alloc_vreg0_vld
                        || !alloc_vreg1_vld
                        || !alloc_vreg2_vld
                        || !alloc_vreg3_vld
                        || idu_rtu_ir_xreg0_alloc_vld
                        || idu_rtu_ir_xreg1_alloc_vld
                        || idu_rtu_ir_xreg2_alloc_vld
                        || idu_rtu_ir_xreg3_alloc_vld;
// &Instance("gated_clk_cell", "x_alloc_vreg_gated_clk"); @1321
gated_clk_cell  x_alloc_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (alloc_vreg_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (alloc_vreg_clk_en ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1322
//          .external_en (1'b0), @1323
//          .global_en   (cp0_yy_clk_en), @1324
//          .module_en   (cp0_rtu_icg_en), @1325
//          .local_en    (alloc_vreg_clk_en), @1326
//          .clk_out     (alloc_vreg_clk)); @1327

//----------------------------------------------------------
//                Instance of alloc registers
//----------------------------------------------------------
always @(posedge alloc_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_vreg0_vld  <= 1'd0;
    alloc_vreg0[5:0] <= 6'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_vreg0_vld  <= 1'd0;
    alloc_vreg0[5:0] <= 6'd0;
  end
  else if(alloc_vreg0_invalid) begin
    alloc_vreg0_vld  <= dealloc_vreg0_vld;
    alloc_vreg0[5:0] <= dealloc_vreg0[5:0];
  end
  else begin
    alloc_vreg0_vld  <= alloc_vreg0_vld;
    alloc_vreg0[5:0] <= alloc_vreg0[5:0];
  end
end

always @(posedge alloc_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_vreg1_vld  <= 1'd0;
    alloc_vreg1[5:0] <= 6'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_vreg1_vld  <= 1'd0;
    alloc_vreg1[5:0] <= 6'd0;
  end
  else if(alloc_vreg1_invalid) begin
    alloc_vreg1_vld  <= dealloc_vreg1_vld;
    alloc_vreg1[5:0] <= dealloc_vreg1[5:0];
  end
  else begin
    alloc_vreg1_vld  <= alloc_vreg1_vld;
    alloc_vreg1[5:0] <= alloc_vreg1[5:0];
  end
end

always @(posedge alloc_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_vreg2_vld  <= 1'd0;
    alloc_vreg2[5:0] <= 6'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_vreg2_vld  <= 1'd0;
    alloc_vreg2[5:0] <= 6'd0;
  end
  else if(alloc_vreg2_invalid) begin
    alloc_vreg2_vld  <= dealloc_vreg2_vld;
    alloc_vreg2[5:0] <= dealloc_vreg2[5:0];
  end
  else begin
    alloc_vreg2_vld  <= alloc_vreg2_vld;
    alloc_vreg2[5:0] <= alloc_vreg2[5:0];
  end
end

always @(posedge alloc_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_vreg3_vld  <= 1'd0;
    alloc_vreg3[5:0] <= 6'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_vreg3_vld  <= 1'd0;
    alloc_vreg3[5:0] <= 6'd0;
  end
  else if(alloc_vreg3_invalid) begin
    alloc_vreg3_vld  <= dealloc_vreg3_vld;
    alloc_vreg3[5:0] <= dealloc_vreg3[5:0];
  end
  else begin
    alloc_vreg3_vld  <= alloc_vreg3_vld;
    alloc_vreg3[5:0] <= alloc_vreg3[5:0];
  end
end

//rename for output
//alloc vreg 0/1/2/3 will be allocated to ir inst 0/1/2/3
assign rtu_idu_alloc_xreg0_vld  = alloc_vreg0_vld;
assign rtu_idu_alloc_xreg1_vld  = alloc_vreg1_vld;
assign rtu_idu_alloc_xreg2_vld  = alloc_vreg2_vld;
assign rtu_idu_alloc_xreg3_vld  = alloc_vreg3_vld;
assign rtu_idu_alloc_xreg0[5:0] = alloc_vreg0[5:0];
assign rtu_idu_alloc_xreg1[5:0] = alloc_vreg1[5:0];
assign rtu_idu_alloc_xreg2[5:0] = alloc_vreg2[5:0];
assign rtu_idu_alloc_xreg3[5:0] = alloc_vreg3[5:0];

//==========================================================
//          Fast Retired Instruction Write Back
//==========================================================
assign pst_retired_xreg_wb        = &retired_released_wb[63:0];

assign retired_released_wb[0]  = vreg0_retired_released_wb;
assign retired_released_wb[1]  = vreg1_retired_released_wb;
assign retired_released_wb[2]  = vreg2_retired_released_wb;
assign retired_released_wb[3]  = vreg3_retired_released_wb;
assign retired_released_wb[4]  = vreg4_retired_released_wb;
assign retired_released_wb[5]  = vreg5_retired_released_wb;
assign retired_released_wb[6]  = vreg6_retired_released_wb;
assign retired_released_wb[7]  = vreg7_retired_released_wb;
assign retired_released_wb[8]  = vreg8_retired_released_wb;
assign retired_released_wb[9]  = vreg9_retired_released_wb;
assign retired_released_wb[10] = vreg10_retired_released_wb;
assign retired_released_wb[11] = vreg11_retired_released_wb;
assign retired_released_wb[12] = vreg12_retired_released_wb;
assign retired_released_wb[13] = vreg13_retired_released_wb;
assign retired_released_wb[14] = vreg14_retired_released_wb;
assign retired_released_wb[15] = vreg15_retired_released_wb;
assign retired_released_wb[16] = vreg16_retired_released_wb;
assign retired_released_wb[17] = vreg17_retired_released_wb;
assign retired_released_wb[18] = vreg18_retired_released_wb;
assign retired_released_wb[19] = vreg19_retired_released_wb;
assign retired_released_wb[20] = vreg20_retired_released_wb;
assign retired_released_wb[21] = vreg21_retired_released_wb;
assign retired_released_wb[22] = vreg22_retired_released_wb;
assign retired_released_wb[23] = vreg23_retired_released_wb;
assign retired_released_wb[24] = vreg24_retired_released_wb;
assign retired_released_wb[25] = vreg25_retired_released_wb;
assign retired_released_wb[26] = vreg26_retired_released_wb;
assign retired_released_wb[27] = vreg27_retired_released_wb;
assign retired_released_wb[28] = vreg28_retired_released_wb;
assign retired_released_wb[29] = vreg29_retired_released_wb;
assign retired_released_wb[30] = vreg30_retired_released_wb;
assign retired_released_wb[31] = vreg31_retired_released_wb;
assign retired_released_wb[32] = vreg32_retired_released_wb;
assign retired_released_wb[33] = vreg33_retired_released_wb;
assign retired_released_wb[34] = vreg34_retired_released_wb;
assign retired_released_wb[35] = vreg35_retired_released_wb;
assign retired_released_wb[36] = vreg36_retired_released_wb;
assign retired_released_wb[37] = vreg37_retired_released_wb;
assign retired_released_wb[38] = vreg38_retired_released_wb;
assign retired_released_wb[39] = vreg39_retired_released_wb;
assign retired_released_wb[40] = vreg40_retired_released_wb;
assign retired_released_wb[41] = vreg41_retired_released_wb;
assign retired_released_wb[42] = vreg42_retired_released_wb;
assign retired_released_wb[43] = vreg43_retired_released_wb;
assign retired_released_wb[44] = vreg44_retired_released_wb;
assign retired_released_wb[45] = vreg45_retired_released_wb;
assign retired_released_wb[46] = vreg46_retired_released_wb;
assign retired_released_wb[47] = vreg47_retired_released_wb;
assign retired_released_wb[48] = vreg48_retired_released_wb;
assign retired_released_wb[49] = vreg49_retired_released_wb;
assign retired_released_wb[50] = vreg50_retired_released_wb;
assign retired_released_wb[51] = vreg51_retired_released_wb;
assign retired_released_wb[52] = vreg52_retired_released_wb;
assign retired_released_wb[53] = vreg53_retired_released_wb;
assign retired_released_wb[54] = vreg54_retired_released_wb;
assign retired_released_wb[55] = vreg55_retired_released_wb;
assign retired_released_wb[56] = vreg56_retired_released_wb;
assign retired_released_wb[57] = vreg57_retired_released_wb;
assign retired_released_wb[58] = vreg58_retired_released_wb;
assign retired_released_wb[59] = vreg59_retired_released_wb;
assign retired_released_wb[60] = vreg60_retired_released_wb;
assign retired_released_wb[61] = vreg61_retired_released_wb;
assign retired_released_wb[62] = vreg62_retired_released_wb;
assign retired_released_wb[63] = vreg63_retired_released_wb;

//==========================================================
//                  Recovery Rename Table
//==========================================================
//the vreg_x_dreg[31:0] indicates vreg-reg mapping of retired entry.
//rename table is reg indexed, while pst is vreg indexed.
//transpose the mappings from vreg index to reg index.
assign r0_vreg_expand[63:0] = {
  vreg63_dreg[0],vreg62_dreg[0],vreg61_dreg[0],vreg60_dreg[0],
  vreg59_dreg[0],vreg58_dreg[0],vreg57_dreg[0],vreg56_dreg[0],
  vreg55_dreg[0],vreg54_dreg[0],vreg53_dreg[0],vreg52_dreg[0],
  vreg51_dreg[0],vreg50_dreg[0],vreg49_dreg[0],vreg48_dreg[0],
  vreg47_dreg[0],vreg46_dreg[0],vreg45_dreg[0],vreg44_dreg[0],
  vreg43_dreg[0],vreg42_dreg[0],vreg41_dreg[0],vreg40_dreg[0],
  vreg39_dreg[0],vreg38_dreg[0],vreg37_dreg[0],vreg36_dreg[0],
  vreg35_dreg[0],vreg34_dreg[0],vreg33_dreg[0],vreg32_dreg[0],
  vreg31_dreg[0],vreg30_dreg[0],vreg29_dreg[0],vreg28_dreg[0],
  vreg27_dreg[0],vreg26_dreg[0],vreg25_dreg[0],vreg24_dreg[0],
  vreg23_dreg[0],vreg22_dreg[0],vreg21_dreg[0],vreg20_dreg[0],
  vreg19_dreg[0],vreg18_dreg[0],vreg17_dreg[0],vreg16_dreg[0],
  vreg15_dreg[0],vreg14_dreg[0],vreg13_dreg[0],vreg12_dreg[0],
  vreg11_dreg[0],vreg10_dreg[0],vreg9_dreg[0] ,vreg8_dreg[0],
  vreg7_dreg[0] ,vreg6_dreg[0] ,vreg5_dreg[0] ,vreg4_dreg[0],
  vreg3_dreg[0] ,vreg2_dreg[0] ,vreg1_dreg[0] ,vreg0_dreg[0]};
assign r1_vreg_expand[63:0] = {
  vreg63_dreg[1],vreg62_dreg[1],vreg61_dreg[1],vreg60_dreg[1],
  vreg59_dreg[1],vreg58_dreg[1],vreg57_dreg[1],vreg56_dreg[1],
  vreg55_dreg[1],vreg54_dreg[1],vreg53_dreg[1],vreg52_dreg[1],
  vreg51_dreg[1],vreg50_dreg[1],vreg49_dreg[1],vreg48_dreg[1],
  vreg47_dreg[1],vreg46_dreg[1],vreg45_dreg[1],vreg44_dreg[1],
  vreg43_dreg[1],vreg42_dreg[1],vreg41_dreg[1],vreg40_dreg[1],
  vreg39_dreg[1],vreg38_dreg[1],vreg37_dreg[1],vreg36_dreg[1],
  vreg35_dreg[1],vreg34_dreg[1],vreg33_dreg[1],vreg32_dreg[1],
  vreg31_dreg[1],vreg30_dreg[1],vreg29_dreg[1],vreg28_dreg[1],
  vreg27_dreg[1],vreg26_dreg[1],vreg25_dreg[1],vreg24_dreg[1],
  vreg23_dreg[1],vreg22_dreg[1],vreg21_dreg[1],vreg20_dreg[1],
  vreg19_dreg[1],vreg18_dreg[1],vreg17_dreg[1],vreg16_dreg[1],
  vreg15_dreg[1],vreg14_dreg[1],vreg13_dreg[1],vreg12_dreg[1],
  vreg11_dreg[1],vreg10_dreg[1],vreg9_dreg[1] ,vreg8_dreg[1],
  vreg7_dreg[1] ,vreg6_dreg[1] ,vreg5_dreg[1] ,vreg4_dreg[1],
  vreg3_dreg[1] ,vreg2_dreg[1] ,vreg1_dreg[1] ,vreg0_dreg[1]};
assign r2_vreg_expand[63:0] = {
  vreg63_dreg[2],vreg62_dreg[2],vreg61_dreg[2],vreg60_dreg[2],
  vreg59_dreg[2],vreg58_dreg[2],vreg57_dreg[2],vreg56_dreg[2],
  vreg55_dreg[2],vreg54_dreg[2],vreg53_dreg[2],vreg52_dreg[2],
  vreg51_dreg[2],vreg50_dreg[2],vreg49_dreg[2],vreg48_dreg[2],
  vreg47_dreg[2],vreg46_dreg[2],vreg45_dreg[2],vreg44_dreg[2],
  vreg43_dreg[2],vreg42_dreg[2],vreg41_dreg[2],vreg40_dreg[2],
  vreg39_dreg[2],vreg38_dreg[2],vreg37_dreg[2],vreg36_dreg[2],
  vreg35_dreg[2],vreg34_dreg[2],vreg33_dreg[2],vreg32_dreg[2],
  vreg31_dreg[2],vreg30_dreg[2],vreg29_dreg[2],vreg28_dreg[2],
  vreg27_dreg[2],vreg26_dreg[2],vreg25_dreg[2],vreg24_dreg[2],
  vreg23_dreg[2],vreg22_dreg[2],vreg21_dreg[2],vreg20_dreg[2],
  vreg19_dreg[2],vreg18_dreg[2],vreg17_dreg[2],vreg16_dreg[2],
  vreg15_dreg[2],vreg14_dreg[2],vreg13_dreg[2],vreg12_dreg[2],
  vreg11_dreg[2],vreg10_dreg[2],vreg9_dreg[2] ,vreg8_dreg[2],
  vreg7_dreg[2] ,vreg6_dreg[2] ,vreg5_dreg[2] ,vreg4_dreg[2],
  vreg3_dreg[2] ,vreg2_dreg[2] ,vreg1_dreg[2] ,vreg0_dreg[2]};
assign r3_vreg_expand[63:0] = {
  vreg63_dreg[3],vreg62_dreg[3],vreg61_dreg[3],vreg60_dreg[3],
  vreg59_dreg[3],vreg58_dreg[3],vreg57_dreg[3],vreg56_dreg[3],
  vreg55_dreg[3],vreg54_dreg[3],vreg53_dreg[3],vreg52_dreg[3],
  vreg51_dreg[3],vreg50_dreg[3],vreg49_dreg[3],vreg48_dreg[3],
  vreg47_dreg[3],vreg46_dreg[3],vreg45_dreg[3],vreg44_dreg[3],
  vreg43_dreg[3],vreg42_dreg[3],vreg41_dreg[3],vreg40_dreg[3],
  vreg39_dreg[3],vreg38_dreg[3],vreg37_dreg[3],vreg36_dreg[3],
  vreg35_dreg[3],vreg34_dreg[3],vreg33_dreg[3],vreg32_dreg[3],
  vreg31_dreg[3],vreg30_dreg[3],vreg29_dreg[3],vreg28_dreg[3],
  vreg27_dreg[3],vreg26_dreg[3],vreg25_dreg[3],vreg24_dreg[3],
  vreg23_dreg[3],vreg22_dreg[3],vreg21_dreg[3],vreg20_dreg[3],
  vreg19_dreg[3],vreg18_dreg[3],vreg17_dreg[3],vreg16_dreg[3],
  vreg15_dreg[3],vreg14_dreg[3],vreg13_dreg[3],vreg12_dreg[3],
  vreg11_dreg[3],vreg10_dreg[3],vreg9_dreg[3] ,vreg8_dreg[3],
  vreg7_dreg[3] ,vreg6_dreg[3] ,vreg5_dreg[3] ,vreg4_dreg[3],
  vreg3_dreg[3] ,vreg2_dreg[3] ,vreg1_dreg[3] ,vreg0_dreg[3]};
assign r4_vreg_expand[63:0] = {
  vreg63_dreg[4],vreg62_dreg[4],vreg61_dreg[4],vreg60_dreg[4],
  vreg59_dreg[4],vreg58_dreg[4],vreg57_dreg[4],vreg56_dreg[4],
  vreg55_dreg[4],vreg54_dreg[4],vreg53_dreg[4],vreg52_dreg[4],
  vreg51_dreg[4],vreg50_dreg[4],vreg49_dreg[4],vreg48_dreg[4],
  vreg47_dreg[4],vreg46_dreg[4],vreg45_dreg[4],vreg44_dreg[4],
  vreg43_dreg[4],vreg42_dreg[4],vreg41_dreg[4],vreg40_dreg[4],
  vreg39_dreg[4],vreg38_dreg[4],vreg37_dreg[4],vreg36_dreg[4],
  vreg35_dreg[4],vreg34_dreg[4],vreg33_dreg[4],vreg32_dreg[4],
  vreg31_dreg[4],vreg30_dreg[4],vreg29_dreg[4],vreg28_dreg[4],
  vreg27_dreg[4],vreg26_dreg[4],vreg25_dreg[4],vreg24_dreg[4],
  vreg23_dreg[4],vreg22_dreg[4],vreg21_dreg[4],vreg20_dreg[4],
  vreg19_dreg[4],vreg18_dreg[4],vreg17_dreg[4],vreg16_dreg[4],
  vreg15_dreg[4],vreg14_dreg[4],vreg13_dreg[4],vreg12_dreg[4],
  vreg11_dreg[4],vreg10_dreg[4],vreg9_dreg[4] ,vreg8_dreg[4],
  vreg7_dreg[4] ,vreg6_dreg[4] ,vreg5_dreg[4] ,vreg4_dreg[4],
  vreg3_dreg[4] ,vreg2_dreg[4] ,vreg1_dreg[4] ,vreg0_dreg[4]};
assign r5_vreg_expand[63:0] = {
  vreg63_dreg[5],vreg62_dreg[5],vreg61_dreg[5],vreg60_dreg[5],
  vreg59_dreg[5],vreg58_dreg[5],vreg57_dreg[5],vreg56_dreg[5],
  vreg55_dreg[5],vreg54_dreg[5],vreg53_dreg[5],vreg52_dreg[5],
  vreg51_dreg[5],vreg50_dreg[5],vreg49_dreg[5],vreg48_dreg[5],
  vreg47_dreg[5],vreg46_dreg[5],vreg45_dreg[5],vreg44_dreg[5],
  vreg43_dreg[5],vreg42_dreg[5],vreg41_dreg[5],vreg40_dreg[5],
  vreg39_dreg[5],vreg38_dreg[5],vreg37_dreg[5],vreg36_dreg[5],
  vreg35_dreg[5],vreg34_dreg[5],vreg33_dreg[5],vreg32_dreg[5],
  vreg31_dreg[5],vreg30_dreg[5],vreg29_dreg[5],vreg28_dreg[5],
  vreg27_dreg[5],vreg26_dreg[5],vreg25_dreg[5],vreg24_dreg[5],
  vreg23_dreg[5],vreg22_dreg[5],vreg21_dreg[5],vreg20_dreg[5],
  vreg19_dreg[5],vreg18_dreg[5],vreg17_dreg[5],vreg16_dreg[5],
  vreg15_dreg[5],vreg14_dreg[5],vreg13_dreg[5],vreg12_dreg[5],
  vreg11_dreg[5],vreg10_dreg[5],vreg9_dreg[5] ,vreg8_dreg[5],
  vreg7_dreg[5] ,vreg6_dreg[5] ,vreg5_dreg[5] ,vreg4_dreg[5],
  vreg3_dreg[5] ,vreg2_dreg[5] ,vreg1_dreg[5] ,vreg0_dreg[5]};
assign r6_vreg_expand[63:0] = {
  vreg63_dreg[6],vreg62_dreg[6],vreg61_dreg[6],vreg60_dreg[6],
  vreg59_dreg[6],vreg58_dreg[6],vreg57_dreg[6],vreg56_dreg[6],
  vreg55_dreg[6],vreg54_dreg[6],vreg53_dreg[6],vreg52_dreg[6],
  vreg51_dreg[6],vreg50_dreg[6],vreg49_dreg[6],vreg48_dreg[6],
  vreg47_dreg[6],vreg46_dreg[6],vreg45_dreg[6],vreg44_dreg[6],
  vreg43_dreg[6],vreg42_dreg[6],vreg41_dreg[6],vreg40_dreg[6],
  vreg39_dreg[6],vreg38_dreg[6],vreg37_dreg[6],vreg36_dreg[6],
  vreg35_dreg[6],vreg34_dreg[6],vreg33_dreg[6],vreg32_dreg[6],
  vreg31_dreg[6],vreg30_dreg[6],vreg29_dreg[6],vreg28_dreg[6],
  vreg27_dreg[6],vreg26_dreg[6],vreg25_dreg[6],vreg24_dreg[6],
  vreg23_dreg[6],vreg22_dreg[6],vreg21_dreg[6],vreg20_dreg[6],
  vreg19_dreg[6],vreg18_dreg[6],vreg17_dreg[6],vreg16_dreg[6],
  vreg15_dreg[6],vreg14_dreg[6],vreg13_dreg[6],vreg12_dreg[6],
  vreg11_dreg[6],vreg10_dreg[6],vreg9_dreg[6] ,vreg8_dreg[6],
  vreg7_dreg[6] ,vreg6_dreg[6] ,vreg5_dreg[6] ,vreg4_dreg[6],
  vreg3_dreg[6] ,vreg2_dreg[6] ,vreg1_dreg[6] ,vreg0_dreg[6]};
assign r7_vreg_expand[63:0] = {
  vreg63_dreg[7],vreg62_dreg[7],vreg61_dreg[7],vreg60_dreg[7],
  vreg59_dreg[7],vreg58_dreg[7],vreg57_dreg[7],vreg56_dreg[7],
  vreg55_dreg[7],vreg54_dreg[7],vreg53_dreg[7],vreg52_dreg[7],
  vreg51_dreg[7],vreg50_dreg[7],vreg49_dreg[7],vreg48_dreg[7],
  vreg47_dreg[7],vreg46_dreg[7],vreg45_dreg[7],vreg44_dreg[7],
  vreg43_dreg[7],vreg42_dreg[7],vreg41_dreg[7],vreg40_dreg[7],
  vreg39_dreg[7],vreg38_dreg[7],vreg37_dreg[7],vreg36_dreg[7],
  vreg35_dreg[7],vreg34_dreg[7],vreg33_dreg[7],vreg32_dreg[7],
  vreg31_dreg[7],vreg30_dreg[7],vreg29_dreg[7],vreg28_dreg[7],
  vreg27_dreg[7],vreg26_dreg[7],vreg25_dreg[7],vreg24_dreg[7],
  vreg23_dreg[7],vreg22_dreg[7],vreg21_dreg[7],vreg20_dreg[7],
  vreg19_dreg[7],vreg18_dreg[7],vreg17_dreg[7],vreg16_dreg[7],
  vreg15_dreg[7],vreg14_dreg[7],vreg13_dreg[7],vreg12_dreg[7],
  vreg11_dreg[7],vreg10_dreg[7],vreg9_dreg[7] ,vreg8_dreg[7],
  vreg7_dreg[7] ,vreg6_dreg[7] ,vreg5_dreg[7] ,vreg4_dreg[7],
  vreg3_dreg[7] ,vreg2_dreg[7] ,vreg1_dreg[7] ,vreg0_dreg[7]};
assign r8_vreg_expand[63:0] = {
  vreg63_dreg[8],vreg62_dreg[8],vreg61_dreg[8],vreg60_dreg[8],
  vreg59_dreg[8],vreg58_dreg[8],vreg57_dreg[8],vreg56_dreg[8],
  vreg55_dreg[8],vreg54_dreg[8],vreg53_dreg[8],vreg52_dreg[8],
  vreg51_dreg[8],vreg50_dreg[8],vreg49_dreg[8],vreg48_dreg[8],
  vreg47_dreg[8],vreg46_dreg[8],vreg45_dreg[8],vreg44_dreg[8],
  vreg43_dreg[8],vreg42_dreg[8],vreg41_dreg[8],vreg40_dreg[8],
  vreg39_dreg[8],vreg38_dreg[8],vreg37_dreg[8],vreg36_dreg[8],
  vreg35_dreg[8],vreg34_dreg[8],vreg33_dreg[8],vreg32_dreg[8],
  vreg31_dreg[8],vreg30_dreg[8],vreg29_dreg[8],vreg28_dreg[8],
  vreg27_dreg[8],vreg26_dreg[8],vreg25_dreg[8],vreg24_dreg[8],
  vreg23_dreg[8],vreg22_dreg[8],vreg21_dreg[8],vreg20_dreg[8],
  vreg19_dreg[8],vreg18_dreg[8],vreg17_dreg[8],vreg16_dreg[8],
  vreg15_dreg[8],vreg14_dreg[8],vreg13_dreg[8],vreg12_dreg[8],
  vreg11_dreg[8],vreg10_dreg[8],vreg9_dreg[8] ,vreg8_dreg[8],
  vreg7_dreg[8] ,vreg6_dreg[8] ,vreg5_dreg[8] ,vreg4_dreg[8],
  vreg3_dreg[8] ,vreg2_dreg[8] ,vreg1_dreg[8] ,vreg0_dreg[8]};
assign r9_vreg_expand[63:0] = {
  vreg63_dreg[9],vreg62_dreg[9],vreg61_dreg[9],vreg60_dreg[9],
  vreg59_dreg[9],vreg58_dreg[9],vreg57_dreg[9],vreg56_dreg[9],
  vreg55_dreg[9],vreg54_dreg[9],vreg53_dreg[9],vreg52_dreg[9],
  vreg51_dreg[9],vreg50_dreg[9],vreg49_dreg[9],vreg48_dreg[9],
  vreg47_dreg[9],vreg46_dreg[9],vreg45_dreg[9],vreg44_dreg[9],
  vreg43_dreg[9],vreg42_dreg[9],vreg41_dreg[9],vreg40_dreg[9],
  vreg39_dreg[9],vreg38_dreg[9],vreg37_dreg[9],vreg36_dreg[9],
  vreg35_dreg[9],vreg34_dreg[9],vreg33_dreg[9],vreg32_dreg[9],
  vreg31_dreg[9],vreg30_dreg[9],vreg29_dreg[9],vreg28_dreg[9],
  vreg27_dreg[9],vreg26_dreg[9],vreg25_dreg[9],vreg24_dreg[9],
  vreg23_dreg[9],vreg22_dreg[9],vreg21_dreg[9],vreg20_dreg[9],
  vreg19_dreg[9],vreg18_dreg[9],vreg17_dreg[9],vreg16_dreg[9],
  vreg15_dreg[9],vreg14_dreg[9],vreg13_dreg[9],vreg12_dreg[9],
  vreg11_dreg[9],vreg10_dreg[9],vreg9_dreg[9] ,vreg8_dreg[9],
  vreg7_dreg[9] ,vreg6_dreg[9] ,vreg5_dreg[9] ,vreg4_dreg[9],
  vreg3_dreg[9] ,vreg2_dreg[9] ,vreg1_dreg[9] ,vreg0_dreg[9]};
assign r10_vreg_expand[63:0] = {
  vreg63_dreg[10],vreg62_dreg[10],vreg61_dreg[10],vreg60_dreg[10],
  vreg59_dreg[10],vreg58_dreg[10],vreg57_dreg[10],vreg56_dreg[10],
  vreg55_dreg[10],vreg54_dreg[10],vreg53_dreg[10],vreg52_dreg[10],
  vreg51_dreg[10],vreg50_dreg[10],vreg49_dreg[10],vreg48_dreg[10],
  vreg47_dreg[10],vreg46_dreg[10],vreg45_dreg[10],vreg44_dreg[10],
  vreg43_dreg[10],vreg42_dreg[10],vreg41_dreg[10],vreg40_dreg[10],
  vreg39_dreg[10],vreg38_dreg[10],vreg37_dreg[10],vreg36_dreg[10],
  vreg35_dreg[10],vreg34_dreg[10],vreg33_dreg[10],vreg32_dreg[10],
  vreg31_dreg[10],vreg30_dreg[10],vreg29_dreg[10],vreg28_dreg[10],
  vreg27_dreg[10],vreg26_dreg[10],vreg25_dreg[10],vreg24_dreg[10],
  vreg23_dreg[10],vreg22_dreg[10],vreg21_dreg[10],vreg20_dreg[10],
  vreg19_dreg[10],vreg18_dreg[10],vreg17_dreg[10],vreg16_dreg[10],
  vreg15_dreg[10],vreg14_dreg[10],vreg13_dreg[10],vreg12_dreg[10],
  vreg11_dreg[10],vreg10_dreg[10],vreg9_dreg[10] ,vreg8_dreg[10],
  vreg7_dreg[10] ,vreg6_dreg[10] ,vreg5_dreg[10] ,vreg4_dreg[10],
  vreg3_dreg[10] ,vreg2_dreg[10] ,vreg1_dreg[10] ,vreg0_dreg[10]};
assign r11_vreg_expand[63:0] = {
  vreg63_dreg[11],vreg62_dreg[11],vreg61_dreg[11],vreg60_dreg[11],
  vreg59_dreg[11],vreg58_dreg[11],vreg57_dreg[11],vreg56_dreg[11],
  vreg55_dreg[11],vreg54_dreg[11],vreg53_dreg[11],vreg52_dreg[11],
  vreg51_dreg[11],vreg50_dreg[11],vreg49_dreg[11],vreg48_dreg[11],
  vreg47_dreg[11],vreg46_dreg[11],vreg45_dreg[11],vreg44_dreg[11],
  vreg43_dreg[11],vreg42_dreg[11],vreg41_dreg[11],vreg40_dreg[11],
  vreg39_dreg[11],vreg38_dreg[11],vreg37_dreg[11],vreg36_dreg[11],
  vreg35_dreg[11],vreg34_dreg[11],vreg33_dreg[11],vreg32_dreg[11],
  vreg31_dreg[11],vreg30_dreg[11],vreg29_dreg[11],vreg28_dreg[11],
  vreg27_dreg[11],vreg26_dreg[11],vreg25_dreg[11],vreg24_dreg[11],
  vreg23_dreg[11],vreg22_dreg[11],vreg21_dreg[11],vreg20_dreg[11],
  vreg19_dreg[11],vreg18_dreg[11],vreg17_dreg[11],vreg16_dreg[11],
  vreg15_dreg[11],vreg14_dreg[11],vreg13_dreg[11],vreg12_dreg[11],
  vreg11_dreg[11],vreg10_dreg[11],vreg9_dreg[11] ,vreg8_dreg[11],
  vreg7_dreg[11] ,vreg6_dreg[11] ,vreg5_dreg[11] ,vreg4_dreg[11],
  vreg3_dreg[11] ,vreg2_dreg[11] ,vreg1_dreg[11] ,vreg0_dreg[11]};
assign r12_vreg_expand[63:0] = {
  vreg63_dreg[12],vreg62_dreg[12],vreg61_dreg[12],vreg60_dreg[12],
  vreg59_dreg[12],vreg58_dreg[12],vreg57_dreg[12],vreg56_dreg[12],
  vreg55_dreg[12],vreg54_dreg[12],vreg53_dreg[12],vreg52_dreg[12],
  vreg51_dreg[12],vreg50_dreg[12],vreg49_dreg[12],vreg48_dreg[12],
  vreg47_dreg[12],vreg46_dreg[12],vreg45_dreg[12],vreg44_dreg[12],
  vreg43_dreg[12],vreg42_dreg[12],vreg41_dreg[12],vreg40_dreg[12],
  vreg39_dreg[12],vreg38_dreg[12],vreg37_dreg[12],vreg36_dreg[12],
  vreg35_dreg[12],vreg34_dreg[12],vreg33_dreg[12],vreg32_dreg[12],
  vreg31_dreg[12],vreg30_dreg[12],vreg29_dreg[12],vreg28_dreg[12],
  vreg27_dreg[12],vreg26_dreg[12],vreg25_dreg[12],vreg24_dreg[12],
  vreg23_dreg[12],vreg22_dreg[12],vreg21_dreg[12],vreg20_dreg[12],
  vreg19_dreg[12],vreg18_dreg[12],vreg17_dreg[12],vreg16_dreg[12],
  vreg15_dreg[12],vreg14_dreg[12],vreg13_dreg[12],vreg12_dreg[12],
  vreg11_dreg[12],vreg10_dreg[12],vreg9_dreg[12] ,vreg8_dreg[12],
  vreg7_dreg[12] ,vreg6_dreg[12] ,vreg5_dreg[12] ,vreg4_dreg[12],
  vreg3_dreg[12] ,vreg2_dreg[12] ,vreg1_dreg[12] ,vreg0_dreg[12]};
assign r13_vreg_expand[63:0] = {
  vreg63_dreg[13],vreg62_dreg[13],vreg61_dreg[13],vreg60_dreg[13],
  vreg59_dreg[13],vreg58_dreg[13],vreg57_dreg[13],vreg56_dreg[13],
  vreg55_dreg[13],vreg54_dreg[13],vreg53_dreg[13],vreg52_dreg[13],
  vreg51_dreg[13],vreg50_dreg[13],vreg49_dreg[13],vreg48_dreg[13],
  vreg47_dreg[13],vreg46_dreg[13],vreg45_dreg[13],vreg44_dreg[13],
  vreg43_dreg[13],vreg42_dreg[13],vreg41_dreg[13],vreg40_dreg[13],
  vreg39_dreg[13],vreg38_dreg[13],vreg37_dreg[13],vreg36_dreg[13],
  vreg35_dreg[13],vreg34_dreg[13],vreg33_dreg[13],vreg32_dreg[13],
  vreg31_dreg[13],vreg30_dreg[13],vreg29_dreg[13],vreg28_dreg[13],
  vreg27_dreg[13],vreg26_dreg[13],vreg25_dreg[13],vreg24_dreg[13],
  vreg23_dreg[13],vreg22_dreg[13],vreg21_dreg[13],vreg20_dreg[13],
  vreg19_dreg[13],vreg18_dreg[13],vreg17_dreg[13],vreg16_dreg[13],
  vreg15_dreg[13],vreg14_dreg[13],vreg13_dreg[13],vreg12_dreg[13],
  vreg11_dreg[13],vreg10_dreg[13],vreg9_dreg[13] ,vreg8_dreg[13],
  vreg7_dreg[13] ,vreg6_dreg[13] ,vreg5_dreg[13] ,vreg4_dreg[13],
  vreg3_dreg[13] ,vreg2_dreg[13] ,vreg1_dreg[13] ,vreg0_dreg[13]};
assign r14_vreg_expand[63:0] = {
  vreg63_dreg[14],vreg62_dreg[14],vreg61_dreg[14],vreg60_dreg[14],
  vreg59_dreg[14],vreg58_dreg[14],vreg57_dreg[14],vreg56_dreg[14],
  vreg55_dreg[14],vreg54_dreg[14],vreg53_dreg[14],vreg52_dreg[14],
  vreg51_dreg[14],vreg50_dreg[14],vreg49_dreg[14],vreg48_dreg[14],
  vreg47_dreg[14],vreg46_dreg[14],vreg45_dreg[14],vreg44_dreg[14],
  vreg43_dreg[14],vreg42_dreg[14],vreg41_dreg[14],vreg40_dreg[14],
  vreg39_dreg[14],vreg38_dreg[14],vreg37_dreg[14],vreg36_dreg[14],
  vreg35_dreg[14],vreg34_dreg[14],vreg33_dreg[14],vreg32_dreg[14],
  vreg31_dreg[14],vreg30_dreg[14],vreg29_dreg[14],vreg28_dreg[14],
  vreg27_dreg[14],vreg26_dreg[14],vreg25_dreg[14],vreg24_dreg[14],
  vreg23_dreg[14],vreg22_dreg[14],vreg21_dreg[14],vreg20_dreg[14],
  vreg19_dreg[14],vreg18_dreg[14],vreg17_dreg[14],vreg16_dreg[14],
  vreg15_dreg[14],vreg14_dreg[14],vreg13_dreg[14],vreg12_dreg[14],
  vreg11_dreg[14],vreg10_dreg[14],vreg9_dreg[14] ,vreg8_dreg[14],
  vreg7_dreg[14] ,vreg6_dreg[14] ,vreg5_dreg[14] ,vreg4_dreg[14],
  vreg3_dreg[14] ,vreg2_dreg[14] ,vreg1_dreg[14] ,vreg0_dreg[14]};
assign r15_vreg_expand[63:0] = {
  vreg63_dreg[15],vreg62_dreg[15],vreg61_dreg[15],vreg60_dreg[15],
  vreg59_dreg[15],vreg58_dreg[15],vreg57_dreg[15],vreg56_dreg[15],
  vreg55_dreg[15],vreg54_dreg[15],vreg53_dreg[15],vreg52_dreg[15],
  vreg51_dreg[15],vreg50_dreg[15],vreg49_dreg[15],vreg48_dreg[15],
  vreg47_dreg[15],vreg46_dreg[15],vreg45_dreg[15],vreg44_dreg[15],
  vreg43_dreg[15],vreg42_dreg[15],vreg41_dreg[15],vreg40_dreg[15],
  vreg39_dreg[15],vreg38_dreg[15],vreg37_dreg[15],vreg36_dreg[15],
  vreg35_dreg[15],vreg34_dreg[15],vreg33_dreg[15],vreg32_dreg[15],
  vreg31_dreg[15],vreg30_dreg[15],vreg29_dreg[15],vreg28_dreg[15],
  vreg27_dreg[15],vreg26_dreg[15],vreg25_dreg[15],vreg24_dreg[15],
  vreg23_dreg[15],vreg22_dreg[15],vreg21_dreg[15],vreg20_dreg[15],
  vreg19_dreg[15],vreg18_dreg[15],vreg17_dreg[15],vreg16_dreg[15],
  vreg15_dreg[15],vreg14_dreg[15],vreg13_dreg[15],vreg12_dreg[15],
  vreg11_dreg[15],vreg10_dreg[15],vreg9_dreg[15] ,vreg8_dreg[15],
  vreg7_dreg[15] ,vreg6_dreg[15] ,vreg5_dreg[15] ,vreg4_dreg[15],
  vreg3_dreg[15] ,vreg2_dreg[15] ,vreg1_dreg[15] ,vreg0_dreg[15]};
assign r16_vreg_expand[63:0] = {
  vreg63_dreg[16],vreg62_dreg[16],vreg61_dreg[16],vreg60_dreg[16],
  vreg59_dreg[16],vreg58_dreg[16],vreg57_dreg[16],vreg56_dreg[16],
  vreg55_dreg[16],vreg54_dreg[16],vreg53_dreg[16],vreg52_dreg[16],
  vreg51_dreg[16],vreg50_dreg[16],vreg49_dreg[16],vreg48_dreg[16],
  vreg47_dreg[16],vreg46_dreg[16],vreg45_dreg[16],vreg44_dreg[16],
  vreg43_dreg[16],vreg42_dreg[16],vreg41_dreg[16],vreg40_dreg[16],
  vreg39_dreg[16],vreg38_dreg[16],vreg37_dreg[16],vreg36_dreg[16],
  vreg35_dreg[16],vreg34_dreg[16],vreg33_dreg[16],vreg32_dreg[16],
  vreg31_dreg[16],vreg30_dreg[16],vreg29_dreg[16],vreg28_dreg[16],
  vreg27_dreg[16],vreg26_dreg[16],vreg25_dreg[16],vreg24_dreg[16],
  vreg23_dreg[16],vreg22_dreg[16],vreg21_dreg[16],vreg20_dreg[16],
  vreg19_dreg[16],vreg18_dreg[16],vreg17_dreg[16],vreg16_dreg[16],
  vreg15_dreg[16],vreg14_dreg[16],vreg13_dreg[16],vreg12_dreg[16],
  vreg11_dreg[16],vreg10_dreg[16],vreg9_dreg[16] ,vreg8_dreg[16],
  vreg7_dreg[16] ,vreg6_dreg[16] ,vreg5_dreg[16] ,vreg4_dreg[16],
  vreg3_dreg[16] ,vreg2_dreg[16] ,vreg1_dreg[16] ,vreg0_dreg[16]};
assign r17_vreg_expand[63:0] = {
  vreg63_dreg[17],vreg62_dreg[17],vreg61_dreg[17],vreg60_dreg[17],
  vreg59_dreg[17],vreg58_dreg[17],vreg57_dreg[17],vreg56_dreg[17],
  vreg55_dreg[17],vreg54_dreg[17],vreg53_dreg[17],vreg52_dreg[17],
  vreg51_dreg[17],vreg50_dreg[17],vreg49_dreg[17],vreg48_dreg[17],
  vreg47_dreg[17],vreg46_dreg[17],vreg45_dreg[17],vreg44_dreg[17],
  vreg43_dreg[17],vreg42_dreg[17],vreg41_dreg[17],vreg40_dreg[17],
  vreg39_dreg[17],vreg38_dreg[17],vreg37_dreg[17],vreg36_dreg[17],
  vreg35_dreg[17],vreg34_dreg[17],vreg33_dreg[17],vreg32_dreg[17],
  vreg31_dreg[17],vreg30_dreg[17],vreg29_dreg[17],vreg28_dreg[17],
  vreg27_dreg[17],vreg26_dreg[17],vreg25_dreg[17],vreg24_dreg[17],
  vreg23_dreg[17],vreg22_dreg[17],vreg21_dreg[17],vreg20_dreg[17],
  vreg19_dreg[17],vreg18_dreg[17],vreg17_dreg[17],vreg16_dreg[17],
  vreg15_dreg[17],vreg14_dreg[17],vreg13_dreg[17],vreg12_dreg[17],
  vreg11_dreg[17],vreg10_dreg[17],vreg9_dreg[17] ,vreg8_dreg[17],
  vreg7_dreg[17] ,vreg6_dreg[17] ,vreg5_dreg[17] ,vreg4_dreg[17],
  vreg3_dreg[17] ,vreg2_dreg[17] ,vreg1_dreg[17] ,vreg0_dreg[17]};
assign r18_vreg_expand[63:0] = {
  vreg63_dreg[18],vreg62_dreg[18],vreg61_dreg[18],vreg60_dreg[18],
  vreg59_dreg[18],vreg58_dreg[18],vreg57_dreg[18],vreg56_dreg[18],
  vreg55_dreg[18],vreg54_dreg[18],vreg53_dreg[18],vreg52_dreg[18],
  vreg51_dreg[18],vreg50_dreg[18],vreg49_dreg[18],vreg48_dreg[18],
  vreg47_dreg[18],vreg46_dreg[18],vreg45_dreg[18],vreg44_dreg[18],
  vreg43_dreg[18],vreg42_dreg[18],vreg41_dreg[18],vreg40_dreg[18],
  vreg39_dreg[18],vreg38_dreg[18],vreg37_dreg[18],vreg36_dreg[18],
  vreg35_dreg[18],vreg34_dreg[18],vreg33_dreg[18],vreg32_dreg[18],
  vreg31_dreg[18],vreg30_dreg[18],vreg29_dreg[18],vreg28_dreg[18],
  vreg27_dreg[18],vreg26_dreg[18],vreg25_dreg[18],vreg24_dreg[18],
  vreg23_dreg[18],vreg22_dreg[18],vreg21_dreg[18],vreg20_dreg[18],
  vreg19_dreg[18],vreg18_dreg[18],vreg17_dreg[18],vreg16_dreg[18],
  vreg15_dreg[18],vreg14_dreg[18],vreg13_dreg[18],vreg12_dreg[18],
  vreg11_dreg[18],vreg10_dreg[18],vreg9_dreg[18] ,vreg8_dreg[18],
  vreg7_dreg[18] ,vreg6_dreg[18] ,vreg5_dreg[18] ,vreg4_dreg[18],
  vreg3_dreg[18] ,vreg2_dreg[18] ,vreg1_dreg[18] ,vreg0_dreg[18]};
assign r19_vreg_expand[63:0] = {
  vreg63_dreg[19],vreg62_dreg[19],vreg61_dreg[19],vreg60_dreg[19],
  vreg59_dreg[19],vreg58_dreg[19],vreg57_dreg[19],vreg56_dreg[19],
  vreg55_dreg[19],vreg54_dreg[19],vreg53_dreg[19],vreg52_dreg[19],
  vreg51_dreg[19],vreg50_dreg[19],vreg49_dreg[19],vreg48_dreg[19],
  vreg47_dreg[19],vreg46_dreg[19],vreg45_dreg[19],vreg44_dreg[19],
  vreg43_dreg[19],vreg42_dreg[19],vreg41_dreg[19],vreg40_dreg[19],
  vreg39_dreg[19],vreg38_dreg[19],vreg37_dreg[19],vreg36_dreg[19],
  vreg35_dreg[19],vreg34_dreg[19],vreg33_dreg[19],vreg32_dreg[19],
  vreg31_dreg[19],vreg30_dreg[19],vreg29_dreg[19],vreg28_dreg[19],
  vreg27_dreg[19],vreg26_dreg[19],vreg25_dreg[19],vreg24_dreg[19],
  vreg23_dreg[19],vreg22_dreg[19],vreg21_dreg[19],vreg20_dreg[19],
  vreg19_dreg[19],vreg18_dreg[19],vreg17_dreg[19],vreg16_dreg[19],
  vreg15_dreg[19],vreg14_dreg[19],vreg13_dreg[19],vreg12_dreg[19],
  vreg11_dreg[19],vreg10_dreg[19],vreg9_dreg[19] ,vreg8_dreg[19],
  vreg7_dreg[19] ,vreg6_dreg[19] ,vreg5_dreg[19] ,vreg4_dreg[19],
  vreg3_dreg[19] ,vreg2_dreg[19] ,vreg1_dreg[19] ,vreg0_dreg[19]};
assign r20_vreg_expand[63:0] = {
  vreg63_dreg[20],vreg62_dreg[20],vreg61_dreg[20],vreg60_dreg[20],
  vreg59_dreg[20],vreg58_dreg[20],vreg57_dreg[20],vreg56_dreg[20],
  vreg55_dreg[20],vreg54_dreg[20],vreg53_dreg[20],vreg52_dreg[20],
  vreg51_dreg[20],vreg50_dreg[20],vreg49_dreg[20],vreg48_dreg[20],
  vreg47_dreg[20],vreg46_dreg[20],vreg45_dreg[20],vreg44_dreg[20],
  vreg43_dreg[20],vreg42_dreg[20],vreg41_dreg[20],vreg40_dreg[20],
  vreg39_dreg[20],vreg38_dreg[20],vreg37_dreg[20],vreg36_dreg[20],
  vreg35_dreg[20],vreg34_dreg[20],vreg33_dreg[20],vreg32_dreg[20],
  vreg31_dreg[20],vreg30_dreg[20],vreg29_dreg[20],vreg28_dreg[20],
  vreg27_dreg[20],vreg26_dreg[20],vreg25_dreg[20],vreg24_dreg[20],
  vreg23_dreg[20],vreg22_dreg[20],vreg21_dreg[20],vreg20_dreg[20],
  vreg19_dreg[20],vreg18_dreg[20],vreg17_dreg[20],vreg16_dreg[20],
  vreg15_dreg[20],vreg14_dreg[20],vreg13_dreg[20],vreg12_dreg[20],
  vreg11_dreg[20],vreg10_dreg[20],vreg9_dreg[20] ,vreg8_dreg[20],
  vreg7_dreg[20] ,vreg6_dreg[20] ,vreg5_dreg[20] ,vreg4_dreg[20],
  vreg3_dreg[20] ,vreg2_dreg[20] ,vreg1_dreg[20] ,vreg0_dreg[20]};
assign r21_vreg_expand[63:0] = {
  vreg63_dreg[21],vreg62_dreg[21],vreg61_dreg[21],vreg60_dreg[21],
  vreg59_dreg[21],vreg58_dreg[21],vreg57_dreg[21],vreg56_dreg[21],
  vreg55_dreg[21],vreg54_dreg[21],vreg53_dreg[21],vreg52_dreg[21],
  vreg51_dreg[21],vreg50_dreg[21],vreg49_dreg[21],vreg48_dreg[21],
  vreg47_dreg[21],vreg46_dreg[21],vreg45_dreg[21],vreg44_dreg[21],
  vreg43_dreg[21],vreg42_dreg[21],vreg41_dreg[21],vreg40_dreg[21],
  vreg39_dreg[21],vreg38_dreg[21],vreg37_dreg[21],vreg36_dreg[21],
  vreg35_dreg[21],vreg34_dreg[21],vreg33_dreg[21],vreg32_dreg[21],
  vreg31_dreg[21],vreg30_dreg[21],vreg29_dreg[21],vreg28_dreg[21],
  vreg27_dreg[21],vreg26_dreg[21],vreg25_dreg[21],vreg24_dreg[21],
  vreg23_dreg[21],vreg22_dreg[21],vreg21_dreg[21],vreg20_dreg[21],
  vreg19_dreg[21],vreg18_dreg[21],vreg17_dreg[21],vreg16_dreg[21],
  vreg15_dreg[21],vreg14_dreg[21],vreg13_dreg[21],vreg12_dreg[21],
  vreg11_dreg[21],vreg10_dreg[21],vreg9_dreg[21] ,vreg8_dreg[21],
  vreg7_dreg[21] ,vreg6_dreg[21] ,vreg5_dreg[21] ,vreg4_dreg[21],
  vreg3_dreg[21] ,vreg2_dreg[21] ,vreg1_dreg[21] ,vreg0_dreg[21]};
assign r22_vreg_expand[63:0] = {
  vreg63_dreg[22],vreg62_dreg[22],vreg61_dreg[22],vreg60_dreg[22],
  vreg59_dreg[22],vreg58_dreg[22],vreg57_dreg[22],vreg56_dreg[22],
  vreg55_dreg[22],vreg54_dreg[22],vreg53_dreg[22],vreg52_dreg[22],
  vreg51_dreg[22],vreg50_dreg[22],vreg49_dreg[22],vreg48_dreg[22],
  vreg47_dreg[22],vreg46_dreg[22],vreg45_dreg[22],vreg44_dreg[22],
  vreg43_dreg[22],vreg42_dreg[22],vreg41_dreg[22],vreg40_dreg[22],
  vreg39_dreg[22],vreg38_dreg[22],vreg37_dreg[22],vreg36_dreg[22],
  vreg35_dreg[22],vreg34_dreg[22],vreg33_dreg[22],vreg32_dreg[22],
  vreg31_dreg[22],vreg30_dreg[22],vreg29_dreg[22],vreg28_dreg[22],
  vreg27_dreg[22],vreg26_dreg[22],vreg25_dreg[22],vreg24_dreg[22],
  vreg23_dreg[22],vreg22_dreg[22],vreg21_dreg[22],vreg20_dreg[22],
  vreg19_dreg[22],vreg18_dreg[22],vreg17_dreg[22],vreg16_dreg[22],
  vreg15_dreg[22],vreg14_dreg[22],vreg13_dreg[22],vreg12_dreg[22],
  vreg11_dreg[22],vreg10_dreg[22],vreg9_dreg[22] ,vreg8_dreg[22],
  vreg7_dreg[22] ,vreg6_dreg[22] ,vreg5_dreg[22] ,vreg4_dreg[22],
  vreg3_dreg[22] ,vreg2_dreg[22] ,vreg1_dreg[22] ,vreg0_dreg[22]};
assign r23_vreg_expand[63:0] = {
  vreg63_dreg[23],vreg62_dreg[23],vreg61_dreg[23],vreg60_dreg[23],
  vreg59_dreg[23],vreg58_dreg[23],vreg57_dreg[23],vreg56_dreg[23],
  vreg55_dreg[23],vreg54_dreg[23],vreg53_dreg[23],vreg52_dreg[23],
  vreg51_dreg[23],vreg50_dreg[23],vreg49_dreg[23],vreg48_dreg[23],
  vreg47_dreg[23],vreg46_dreg[23],vreg45_dreg[23],vreg44_dreg[23],
  vreg43_dreg[23],vreg42_dreg[23],vreg41_dreg[23],vreg40_dreg[23],
  vreg39_dreg[23],vreg38_dreg[23],vreg37_dreg[23],vreg36_dreg[23],
  vreg35_dreg[23],vreg34_dreg[23],vreg33_dreg[23],vreg32_dreg[23],
  vreg31_dreg[23],vreg30_dreg[23],vreg29_dreg[23],vreg28_dreg[23],
  vreg27_dreg[23],vreg26_dreg[23],vreg25_dreg[23],vreg24_dreg[23],
  vreg23_dreg[23],vreg22_dreg[23],vreg21_dreg[23],vreg20_dreg[23],
  vreg19_dreg[23],vreg18_dreg[23],vreg17_dreg[23],vreg16_dreg[23],
  vreg15_dreg[23],vreg14_dreg[23],vreg13_dreg[23],vreg12_dreg[23],
  vreg11_dreg[23],vreg10_dreg[23],vreg9_dreg[23] ,vreg8_dreg[23],
  vreg7_dreg[23] ,vreg6_dreg[23] ,vreg5_dreg[23] ,vreg4_dreg[23],
  vreg3_dreg[23] ,vreg2_dreg[23] ,vreg1_dreg[23] ,vreg0_dreg[23]};
assign r24_vreg_expand[63:0] = {
  vreg63_dreg[24],vreg62_dreg[24],vreg61_dreg[24],vreg60_dreg[24],
  vreg59_dreg[24],vreg58_dreg[24],vreg57_dreg[24],vreg56_dreg[24],
  vreg55_dreg[24],vreg54_dreg[24],vreg53_dreg[24],vreg52_dreg[24],
  vreg51_dreg[24],vreg50_dreg[24],vreg49_dreg[24],vreg48_dreg[24],
  vreg47_dreg[24],vreg46_dreg[24],vreg45_dreg[24],vreg44_dreg[24],
  vreg43_dreg[24],vreg42_dreg[24],vreg41_dreg[24],vreg40_dreg[24],
  vreg39_dreg[24],vreg38_dreg[24],vreg37_dreg[24],vreg36_dreg[24],
  vreg35_dreg[24],vreg34_dreg[24],vreg33_dreg[24],vreg32_dreg[24],
  vreg31_dreg[24],vreg30_dreg[24],vreg29_dreg[24],vreg28_dreg[24],
  vreg27_dreg[24],vreg26_dreg[24],vreg25_dreg[24],vreg24_dreg[24],
  vreg23_dreg[24],vreg22_dreg[24],vreg21_dreg[24],vreg20_dreg[24],
  vreg19_dreg[24],vreg18_dreg[24],vreg17_dreg[24],vreg16_dreg[24],
  vreg15_dreg[24],vreg14_dreg[24],vreg13_dreg[24],vreg12_dreg[24],
  vreg11_dreg[24],vreg10_dreg[24],vreg9_dreg[24] ,vreg8_dreg[24],
  vreg7_dreg[24] ,vreg6_dreg[24] ,vreg5_dreg[24] ,vreg4_dreg[24],
  vreg3_dreg[24] ,vreg2_dreg[24] ,vreg1_dreg[24] ,vreg0_dreg[24]};
assign r25_vreg_expand[63:0] = {
  vreg63_dreg[25],vreg62_dreg[25],vreg61_dreg[25],vreg60_dreg[25],
  vreg59_dreg[25],vreg58_dreg[25],vreg57_dreg[25],vreg56_dreg[25],
  vreg55_dreg[25],vreg54_dreg[25],vreg53_dreg[25],vreg52_dreg[25],
  vreg51_dreg[25],vreg50_dreg[25],vreg49_dreg[25],vreg48_dreg[25],
  vreg47_dreg[25],vreg46_dreg[25],vreg45_dreg[25],vreg44_dreg[25],
  vreg43_dreg[25],vreg42_dreg[25],vreg41_dreg[25],vreg40_dreg[25],
  vreg39_dreg[25],vreg38_dreg[25],vreg37_dreg[25],vreg36_dreg[25],
  vreg35_dreg[25],vreg34_dreg[25],vreg33_dreg[25],vreg32_dreg[25],
  vreg31_dreg[25],vreg30_dreg[25],vreg29_dreg[25],vreg28_dreg[25],
  vreg27_dreg[25],vreg26_dreg[25],vreg25_dreg[25],vreg24_dreg[25],
  vreg23_dreg[25],vreg22_dreg[25],vreg21_dreg[25],vreg20_dreg[25],
  vreg19_dreg[25],vreg18_dreg[25],vreg17_dreg[25],vreg16_dreg[25],
  vreg15_dreg[25],vreg14_dreg[25],vreg13_dreg[25],vreg12_dreg[25],
  vreg11_dreg[25],vreg10_dreg[25],vreg9_dreg[25] ,vreg8_dreg[25],
  vreg7_dreg[25] ,vreg6_dreg[25] ,vreg5_dreg[25] ,vreg4_dreg[25],
  vreg3_dreg[25] ,vreg2_dreg[25] ,vreg1_dreg[25] ,vreg0_dreg[25]};
assign r26_vreg_expand[63:0] = {
  vreg63_dreg[26],vreg62_dreg[26],vreg61_dreg[26],vreg60_dreg[26],
  vreg59_dreg[26],vreg58_dreg[26],vreg57_dreg[26],vreg56_dreg[26],
  vreg55_dreg[26],vreg54_dreg[26],vreg53_dreg[26],vreg52_dreg[26],
  vreg51_dreg[26],vreg50_dreg[26],vreg49_dreg[26],vreg48_dreg[26],
  vreg47_dreg[26],vreg46_dreg[26],vreg45_dreg[26],vreg44_dreg[26],
  vreg43_dreg[26],vreg42_dreg[26],vreg41_dreg[26],vreg40_dreg[26],
  vreg39_dreg[26],vreg38_dreg[26],vreg37_dreg[26],vreg36_dreg[26],
  vreg35_dreg[26],vreg34_dreg[26],vreg33_dreg[26],vreg32_dreg[26],
  vreg31_dreg[26],vreg30_dreg[26],vreg29_dreg[26],vreg28_dreg[26],
  vreg27_dreg[26],vreg26_dreg[26],vreg25_dreg[26],vreg24_dreg[26],
  vreg23_dreg[26],vreg22_dreg[26],vreg21_dreg[26],vreg20_dreg[26],
  vreg19_dreg[26],vreg18_dreg[26],vreg17_dreg[26],vreg16_dreg[26],
  vreg15_dreg[26],vreg14_dreg[26],vreg13_dreg[26],vreg12_dreg[26],
  vreg11_dreg[26],vreg10_dreg[26],vreg9_dreg[26] ,vreg8_dreg[26],
  vreg7_dreg[26] ,vreg6_dreg[26] ,vreg5_dreg[26] ,vreg4_dreg[26],
  vreg3_dreg[26] ,vreg2_dreg[26] ,vreg1_dreg[26] ,vreg0_dreg[26]};
assign r27_vreg_expand[63:0] = {
  vreg63_dreg[27],vreg62_dreg[27],vreg61_dreg[27],vreg60_dreg[27],
  vreg59_dreg[27],vreg58_dreg[27],vreg57_dreg[27],vreg56_dreg[27],
  vreg55_dreg[27],vreg54_dreg[27],vreg53_dreg[27],vreg52_dreg[27],
  vreg51_dreg[27],vreg50_dreg[27],vreg49_dreg[27],vreg48_dreg[27],
  vreg47_dreg[27],vreg46_dreg[27],vreg45_dreg[27],vreg44_dreg[27],
  vreg43_dreg[27],vreg42_dreg[27],vreg41_dreg[27],vreg40_dreg[27],
  vreg39_dreg[27],vreg38_dreg[27],vreg37_dreg[27],vreg36_dreg[27],
  vreg35_dreg[27],vreg34_dreg[27],vreg33_dreg[27],vreg32_dreg[27],
  vreg31_dreg[27],vreg30_dreg[27],vreg29_dreg[27],vreg28_dreg[27],
  vreg27_dreg[27],vreg26_dreg[27],vreg25_dreg[27],vreg24_dreg[27],
  vreg23_dreg[27],vreg22_dreg[27],vreg21_dreg[27],vreg20_dreg[27],
  vreg19_dreg[27],vreg18_dreg[27],vreg17_dreg[27],vreg16_dreg[27],
  vreg15_dreg[27],vreg14_dreg[27],vreg13_dreg[27],vreg12_dreg[27],
  vreg11_dreg[27],vreg10_dreg[27],vreg9_dreg[27] ,vreg8_dreg[27],
  vreg7_dreg[27] ,vreg6_dreg[27] ,vreg5_dreg[27] ,vreg4_dreg[27],
  vreg3_dreg[27] ,vreg2_dreg[27] ,vreg1_dreg[27] ,vreg0_dreg[27]};
assign r28_vreg_expand[63:0] = {
  vreg63_dreg[28],vreg62_dreg[28],vreg61_dreg[28],vreg60_dreg[28],
  vreg59_dreg[28],vreg58_dreg[28],vreg57_dreg[28],vreg56_dreg[28],
  vreg55_dreg[28],vreg54_dreg[28],vreg53_dreg[28],vreg52_dreg[28],
  vreg51_dreg[28],vreg50_dreg[28],vreg49_dreg[28],vreg48_dreg[28],
  vreg47_dreg[28],vreg46_dreg[28],vreg45_dreg[28],vreg44_dreg[28],
  vreg43_dreg[28],vreg42_dreg[28],vreg41_dreg[28],vreg40_dreg[28],
  vreg39_dreg[28],vreg38_dreg[28],vreg37_dreg[28],vreg36_dreg[28],
  vreg35_dreg[28],vreg34_dreg[28],vreg33_dreg[28],vreg32_dreg[28],
  vreg31_dreg[28],vreg30_dreg[28],vreg29_dreg[28],vreg28_dreg[28],
  vreg27_dreg[28],vreg26_dreg[28],vreg25_dreg[28],vreg24_dreg[28],
  vreg23_dreg[28],vreg22_dreg[28],vreg21_dreg[28],vreg20_dreg[28],
  vreg19_dreg[28],vreg18_dreg[28],vreg17_dreg[28],vreg16_dreg[28],
  vreg15_dreg[28],vreg14_dreg[28],vreg13_dreg[28],vreg12_dreg[28],
  vreg11_dreg[28],vreg10_dreg[28],vreg9_dreg[28] ,vreg8_dreg[28],
  vreg7_dreg[28] ,vreg6_dreg[28] ,vreg5_dreg[28] ,vreg4_dreg[28],
  vreg3_dreg[28] ,vreg2_dreg[28] ,vreg1_dreg[28] ,vreg0_dreg[28]};
assign r29_vreg_expand[63:0] = {
  vreg63_dreg[29],vreg62_dreg[29],vreg61_dreg[29],vreg60_dreg[29],
  vreg59_dreg[29],vreg58_dreg[29],vreg57_dreg[29],vreg56_dreg[29],
  vreg55_dreg[29],vreg54_dreg[29],vreg53_dreg[29],vreg52_dreg[29],
  vreg51_dreg[29],vreg50_dreg[29],vreg49_dreg[29],vreg48_dreg[29],
  vreg47_dreg[29],vreg46_dreg[29],vreg45_dreg[29],vreg44_dreg[29],
  vreg43_dreg[29],vreg42_dreg[29],vreg41_dreg[29],vreg40_dreg[29],
  vreg39_dreg[29],vreg38_dreg[29],vreg37_dreg[29],vreg36_dreg[29],
  vreg35_dreg[29],vreg34_dreg[29],vreg33_dreg[29],vreg32_dreg[29],
  vreg31_dreg[29],vreg30_dreg[29],vreg29_dreg[29],vreg28_dreg[29],
  vreg27_dreg[29],vreg26_dreg[29],vreg25_dreg[29],vreg24_dreg[29],
  vreg23_dreg[29],vreg22_dreg[29],vreg21_dreg[29],vreg20_dreg[29],
  vreg19_dreg[29],vreg18_dreg[29],vreg17_dreg[29],vreg16_dreg[29],
  vreg15_dreg[29],vreg14_dreg[29],vreg13_dreg[29],vreg12_dreg[29],
  vreg11_dreg[29],vreg10_dreg[29],vreg9_dreg[29] ,vreg8_dreg[29],
  vreg7_dreg[29] ,vreg6_dreg[29] ,vreg5_dreg[29] ,vreg4_dreg[29],
  vreg3_dreg[29] ,vreg2_dreg[29] ,vreg1_dreg[29] ,vreg0_dreg[29]};
assign r30_vreg_expand[63:0] = {
  vreg63_dreg[30],vreg62_dreg[30],vreg61_dreg[30],vreg60_dreg[30],
  vreg59_dreg[30],vreg58_dreg[30],vreg57_dreg[30],vreg56_dreg[30],
  vreg55_dreg[30],vreg54_dreg[30],vreg53_dreg[30],vreg52_dreg[30],
  vreg51_dreg[30],vreg50_dreg[30],vreg49_dreg[30],vreg48_dreg[30],
  vreg47_dreg[30],vreg46_dreg[30],vreg45_dreg[30],vreg44_dreg[30],
  vreg43_dreg[30],vreg42_dreg[30],vreg41_dreg[30],vreg40_dreg[30],
  vreg39_dreg[30],vreg38_dreg[30],vreg37_dreg[30],vreg36_dreg[30],
  vreg35_dreg[30],vreg34_dreg[30],vreg33_dreg[30],vreg32_dreg[30],
  vreg31_dreg[30],vreg30_dreg[30],vreg29_dreg[30],vreg28_dreg[30],
  vreg27_dreg[30],vreg26_dreg[30],vreg25_dreg[30],vreg24_dreg[30],
  vreg23_dreg[30],vreg22_dreg[30],vreg21_dreg[30],vreg20_dreg[30],
  vreg19_dreg[30],vreg18_dreg[30],vreg17_dreg[30],vreg16_dreg[30],
  vreg15_dreg[30],vreg14_dreg[30],vreg13_dreg[30],vreg12_dreg[30],
  vreg11_dreg[30],vreg10_dreg[30],vreg9_dreg[30] ,vreg8_dreg[30],
  vreg7_dreg[30] ,vreg6_dreg[30] ,vreg5_dreg[30] ,vreg4_dreg[30],
  vreg3_dreg[30] ,vreg2_dreg[30] ,vreg1_dreg[30] ,vreg0_dreg[30]};
assign r31_vreg_expand[63:0] = {
  vreg63_dreg[31],vreg62_dreg[31],vreg61_dreg[31],vreg60_dreg[31],
  vreg59_dreg[31],vreg58_dreg[31],vreg57_dreg[31],vreg56_dreg[31],
  vreg55_dreg[31],vreg54_dreg[31],vreg53_dreg[31],vreg52_dreg[31],
  vreg51_dreg[31],vreg50_dreg[31],vreg49_dreg[31],vreg48_dreg[31],
  vreg47_dreg[31],vreg46_dreg[31],vreg45_dreg[31],vreg44_dreg[31],
  vreg43_dreg[31],vreg42_dreg[31],vreg41_dreg[31],vreg40_dreg[31],
  vreg39_dreg[31],vreg38_dreg[31],vreg37_dreg[31],vreg36_dreg[31],
  vreg35_dreg[31],vreg34_dreg[31],vreg33_dreg[31],vreg32_dreg[31],
  vreg31_dreg[31],vreg30_dreg[31],vreg29_dreg[31],vreg28_dreg[31],
  vreg27_dreg[31],vreg26_dreg[31],vreg25_dreg[31],vreg24_dreg[31],
  vreg23_dreg[31],vreg22_dreg[31],vreg21_dreg[31],vreg20_dreg[31],
  vreg19_dreg[31],vreg18_dreg[31],vreg17_dreg[31],vreg16_dreg[31],
  vreg15_dreg[31],vreg14_dreg[31],vreg13_dreg[31],vreg12_dreg[31],
  vreg11_dreg[31],vreg10_dreg[31],vreg9_dreg[31] ,vreg8_dreg[31],
  vreg7_dreg[31] ,vreg6_dreg[31] ,vreg5_dreg[31] ,vreg4_dreg[31],
  vreg3_dreg[31] ,vreg2_dreg[31] ,vreg1_dreg[31] ,vreg0_dreg[31]};

// &ConnRule(s/^x_num/r0_vreg/); @2044
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r0_vreg"); @2045
ct_rtu_encode_64  x_ct_rtu_encode_64_r0_vreg (
  .x_num          (r0_vreg       ),
  .x_num_expand   (r0_vreg_expand)
);

// &ConnRule(s/^x_num/r1_vreg/); @2046
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r1_vreg"); @2047
ct_rtu_encode_64  x_ct_rtu_encode_64_r1_vreg (
  .x_num          (r1_vreg       ),
  .x_num_expand   (r1_vreg_expand)
);

// &ConnRule(s/^x_num/r2_vreg/); @2048
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r2_vreg"); @2049
ct_rtu_encode_64  x_ct_rtu_encode_64_r2_vreg (
  .x_num          (r2_vreg       ),
  .x_num_expand   (r2_vreg_expand)
);

// &ConnRule(s/^x_num/r3_vreg/); @2050
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r3_vreg"); @2051
ct_rtu_encode_64  x_ct_rtu_encode_64_r3_vreg (
  .x_num          (r3_vreg       ),
  .x_num_expand   (r3_vreg_expand)
);

// &ConnRule(s/^x_num/r4_vreg/); @2052
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r4_vreg"); @2053
ct_rtu_encode_64  x_ct_rtu_encode_64_r4_vreg (
  .x_num          (r4_vreg       ),
  .x_num_expand   (r4_vreg_expand)
);

// &ConnRule(s/^x_num/r5_vreg/); @2054
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r5_vreg"); @2055
ct_rtu_encode_64  x_ct_rtu_encode_64_r5_vreg (
  .x_num          (r5_vreg       ),
  .x_num_expand   (r5_vreg_expand)
);

// &ConnRule(s/^x_num/r6_vreg/); @2056
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r6_vreg"); @2057
ct_rtu_encode_64  x_ct_rtu_encode_64_r6_vreg (
  .x_num          (r6_vreg       ),
  .x_num_expand   (r6_vreg_expand)
);

// &ConnRule(s/^x_num/r7_vreg/); @2058
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r7_vreg"); @2059
ct_rtu_encode_64  x_ct_rtu_encode_64_r7_vreg (
  .x_num          (r7_vreg       ),
  .x_num_expand   (r7_vreg_expand)
);

// &ConnRule(s/^x_num/r8_vreg/); @2060
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r8_vreg"); @2061
ct_rtu_encode_64  x_ct_rtu_encode_64_r8_vreg (
  .x_num          (r8_vreg       ),
  .x_num_expand   (r8_vreg_expand)
);

// &ConnRule(s/^x_num/r9_vreg/); @2062
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r9_vreg"); @2063
ct_rtu_encode_64  x_ct_rtu_encode_64_r9_vreg (
  .x_num          (r9_vreg       ),
  .x_num_expand   (r9_vreg_expand)
);

// &ConnRule(s/^x_num/r10_vreg/); @2064
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r10_vreg"); @2065
ct_rtu_encode_64  x_ct_rtu_encode_64_r10_vreg (
  .x_num           (r10_vreg       ),
  .x_num_expand    (r10_vreg_expand)
);

// &ConnRule(s/^x_num/r11_vreg/); @2066
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r11_vreg"); @2067
ct_rtu_encode_64  x_ct_rtu_encode_64_r11_vreg (
  .x_num           (r11_vreg       ),
  .x_num_expand    (r11_vreg_expand)
);

// &ConnRule(s/^x_num/r12_vreg/); @2068
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r12_vreg"); @2069
ct_rtu_encode_64  x_ct_rtu_encode_64_r12_vreg (
  .x_num           (r12_vreg       ),
  .x_num_expand    (r12_vreg_expand)
);

// &ConnRule(s/^x_num/r13_vreg/); @2070
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r13_vreg"); @2071
ct_rtu_encode_64  x_ct_rtu_encode_64_r13_vreg (
  .x_num           (r13_vreg       ),
  .x_num_expand    (r13_vreg_expand)
);

// &ConnRule(s/^x_num/r14_vreg/); @2072
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r14_vreg"); @2073
ct_rtu_encode_64  x_ct_rtu_encode_64_r14_vreg (
  .x_num           (r14_vreg       ),
  .x_num_expand    (r14_vreg_expand)
);

// &ConnRule(s/^x_num/r15_vreg/); @2074
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r15_vreg"); @2075
ct_rtu_encode_64  x_ct_rtu_encode_64_r15_vreg (
  .x_num           (r15_vreg       ),
  .x_num_expand    (r15_vreg_expand)
);

// &ConnRule(s/^x_num/r16_vreg/); @2076
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r16_vreg"); @2077
ct_rtu_encode_64  x_ct_rtu_encode_64_r16_vreg (
  .x_num           (r16_vreg       ),
  .x_num_expand    (r16_vreg_expand)
);

// &ConnRule(s/^x_num/r17_vreg/); @2078
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r17_vreg"); @2079
ct_rtu_encode_64  x_ct_rtu_encode_64_r17_vreg (
  .x_num           (r17_vreg       ),
  .x_num_expand    (r17_vreg_expand)
);

// &ConnRule(s/^x_num/r18_vreg/); @2080
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r18_vreg"); @2081
ct_rtu_encode_64  x_ct_rtu_encode_64_r18_vreg (
  .x_num           (r18_vreg       ),
  .x_num_expand    (r18_vreg_expand)
);

// &ConnRule(s/^x_num/r19_vreg/); @2082
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r19_vreg"); @2083
ct_rtu_encode_64  x_ct_rtu_encode_64_r19_vreg (
  .x_num           (r19_vreg       ),
  .x_num_expand    (r19_vreg_expand)
);

// &ConnRule(s/^x_num/r20_vreg/); @2084
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r20_vreg"); @2085
ct_rtu_encode_64  x_ct_rtu_encode_64_r20_vreg (
  .x_num           (r20_vreg       ),
  .x_num_expand    (r20_vreg_expand)
);

// &ConnRule(s/^x_num/r21_vreg/); @2086
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r21_vreg"); @2087
ct_rtu_encode_64  x_ct_rtu_encode_64_r21_vreg (
  .x_num           (r21_vreg       ),
  .x_num_expand    (r21_vreg_expand)
);

// &ConnRule(s/^x_num/r22_vreg/); @2088
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r22_vreg"); @2089
ct_rtu_encode_64  x_ct_rtu_encode_64_r22_vreg (
  .x_num           (r22_vreg       ),
  .x_num_expand    (r22_vreg_expand)
);

// &ConnRule(s/^x_num/r23_vreg/); @2090
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r23_vreg"); @2091
ct_rtu_encode_64  x_ct_rtu_encode_64_r23_vreg (
  .x_num           (r23_vreg       ),
  .x_num_expand    (r23_vreg_expand)
);

// &ConnRule(s/^x_num/r24_vreg/); @2092
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r24_vreg"); @2093
ct_rtu_encode_64  x_ct_rtu_encode_64_r24_vreg (
  .x_num           (r24_vreg       ),
  .x_num_expand    (r24_vreg_expand)
);

// &ConnRule(s/^x_num/r25_vreg/); @2094
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r25_vreg"); @2095
ct_rtu_encode_64  x_ct_rtu_encode_64_r25_vreg (
  .x_num           (r25_vreg       ),
  .x_num_expand    (r25_vreg_expand)
);

// &ConnRule(s/^x_num/r26_vreg/); @2096
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r26_vreg"); @2097
ct_rtu_encode_64  x_ct_rtu_encode_64_r26_vreg (
  .x_num           (r26_vreg       ),
  .x_num_expand    (r26_vreg_expand)
);

// &ConnRule(s/^x_num/r27_vreg/); @2098
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r27_vreg"); @2099
ct_rtu_encode_64  x_ct_rtu_encode_64_r27_vreg (
  .x_num           (r27_vreg       ),
  .x_num_expand    (r27_vreg_expand)
);

// &ConnRule(s/^x_num/r28_vreg/); @2100
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r28_vreg"); @2101
ct_rtu_encode_64  x_ct_rtu_encode_64_r28_vreg (
  .x_num           (r28_vreg       ),
  .x_num_expand    (r28_vreg_expand)
);

// &ConnRule(s/^x_num/r29_vreg/); @2102
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r29_vreg"); @2103
ct_rtu_encode_64  x_ct_rtu_encode_64_r29_vreg (
  .x_num           (r29_vreg       ),
  .x_num_expand    (r29_vreg_expand)
);

// &ConnRule(s/^x_num/r30_vreg/); @2104
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r30_vreg"); @2105
ct_rtu_encode_64  x_ct_rtu_encode_64_r30_vreg (
  .x_num           (r30_vreg       ),
  .x_num_expand    (r30_vreg_expand)
);

// &ConnRule(s/^x_num/r31_vreg/); @2106
// &Instance("ct_rtu_encode_64","x_ct_rtu_encode_64_r31_vreg"); @2107
ct_rtu_encode_64  x_ct_rtu_encode_64_r31_vreg (
  .x_num           (r31_vreg       ),
  .x_num_expand    (r31_vreg_expand)
);


assign rtu_idu_rt_recover_xreg[191:0] = {
  r31_vreg[5:0], r30_vreg[5:0], r29_vreg[5:0], r28_vreg[5:0],
  r27_vreg[5:0], r26_vreg[5:0], r25_vreg[5:0], r24_vreg[5:0],
  r23_vreg[5:0], r22_vreg[5:0], r21_vreg[5:0], r20_vreg[5:0],
  r19_vreg[5:0], r18_vreg[5:0], r17_vreg[5:0], r16_vreg[5:0],
  r15_vreg[5:0], r14_vreg[5:0], r13_vreg[5:0], r12_vreg[5:0],
  r11_vreg[5:0], r10_vreg[5:0], r9_vreg[5:0],  r8_vreg[5:0],
  r7_vreg[5:0],  r6_vreg[5:0],  r5_vreg[5:0],  r4_vreg[5:0],
  r3_vreg[5:0],  r2_vreg[5:0],  r1_vreg[5:0],  r0_vreg[5:0]};

// &Force ("nonport","pst_entry_retire_bus"); @2188
// &Force ("nonport","pst_retire_entry_num_32"); @2257
// &Force ("nonport","pst_entry_release_bus"); @2325
// &Force ("nonport","pst_entry_alloc_bus"); @2393
// &Force ("nonport","pst_entry_wf_alloc_bus"); @2461
// &Force ("nonport","pst_entry_wb_bus"); @2529
// &Force ("nonport","pst_entry_rel_retire_vld_bus"); @2597


// &ModuleEnd; @2603
endmodule


