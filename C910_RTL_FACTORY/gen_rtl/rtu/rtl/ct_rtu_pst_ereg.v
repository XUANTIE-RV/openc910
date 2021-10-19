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
module ct_rtu_pst_ereg(
  cp0_rtu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_rtu_ir_ereg0_alloc_vld,
  idu_rtu_ir_ereg1_alloc_vld,
  idu_rtu_ir_ereg2_alloc_vld,
  idu_rtu_ir_ereg3_alloc_vld,
  idu_rtu_ir_ereg_alloc_gateclk_vld,
  idu_rtu_pst_dis_inst0_ereg,
  idu_rtu_pst_dis_inst0_ereg_iid,
  idu_rtu_pst_dis_inst0_ereg_vld,
  idu_rtu_pst_dis_inst0_rel_ereg,
  idu_rtu_pst_dis_inst1_ereg,
  idu_rtu_pst_dis_inst1_ereg_iid,
  idu_rtu_pst_dis_inst1_ereg_vld,
  idu_rtu_pst_dis_inst1_rel_ereg,
  idu_rtu_pst_dis_inst2_ereg,
  idu_rtu_pst_dis_inst2_ereg_iid,
  idu_rtu_pst_dis_inst2_ereg_vld,
  idu_rtu_pst_dis_inst2_rel_ereg,
  idu_rtu_pst_dis_inst3_ereg,
  idu_rtu_pst_dis_inst3_ereg_iid,
  idu_rtu_pst_dis_inst3_ereg_vld,
  idu_rtu_pst_dis_inst3_rel_ereg,
  ifu_xx_sync_reset,
  pad_yy_icg_scan_en,
  pst_retired_ereg_wb,
  retire_pst_async_flush,
  retire_pst_wb_retire_inst0_ereg_vld,
  retire_pst_wb_retire_inst1_ereg_vld,
  retire_pst_wb_retire_inst2_ereg_vld,
  rob_pst_retire_inst0_iid,
  rob_pst_retire_inst1_iid,
  rob_pst_retire_inst2_iid,
  rtu_idu_alloc_ereg0,
  rtu_idu_alloc_ereg0_vld,
  rtu_idu_alloc_ereg1,
  rtu_idu_alloc_ereg1_vld,
  rtu_idu_alloc_ereg2,
  rtu_idu_alloc_ereg2_vld,
  rtu_idu_alloc_ereg3,
  rtu_idu_alloc_ereg3_vld,
  rtu_idu_pst_ereg_retired_released_wb,
  rtu_idu_rt_recover_ereg,
  rtu_yy_xx_flush,
  vfpu_rtu_ex5_pipe6_ereg_wb_vld,
  vfpu_rtu_ex5_pipe6_wb_ereg,
  vfpu_rtu_ex5_pipe7_ereg_wb_vld,
  vfpu_rtu_ex5_pipe7_wb_ereg
);

// &Ports; @29
input           cp0_rtu_icg_en;                      
input           cp0_yy_clk_en;                       
input           cpurst_b;                            
input           forever_cpuclk;                      
input           idu_rtu_ir_ereg0_alloc_vld;          
input           idu_rtu_ir_ereg1_alloc_vld;          
input           idu_rtu_ir_ereg2_alloc_vld;          
input           idu_rtu_ir_ereg3_alloc_vld;          
input           idu_rtu_ir_ereg_alloc_gateclk_vld;   
input   [4 :0]  idu_rtu_pst_dis_inst0_ereg;          
input   [6 :0]  idu_rtu_pst_dis_inst0_ereg_iid;      
input           idu_rtu_pst_dis_inst0_ereg_vld;      
input   [4 :0]  idu_rtu_pst_dis_inst0_rel_ereg;      
input   [4 :0]  idu_rtu_pst_dis_inst1_ereg;          
input   [6 :0]  idu_rtu_pst_dis_inst1_ereg_iid;      
input           idu_rtu_pst_dis_inst1_ereg_vld;      
input   [4 :0]  idu_rtu_pst_dis_inst1_rel_ereg;      
input   [4 :0]  idu_rtu_pst_dis_inst2_ereg;          
input   [6 :0]  idu_rtu_pst_dis_inst2_ereg_iid;      
input           idu_rtu_pst_dis_inst2_ereg_vld;      
input   [4 :0]  idu_rtu_pst_dis_inst2_rel_ereg;      
input   [4 :0]  idu_rtu_pst_dis_inst3_ereg;          
input   [6 :0]  idu_rtu_pst_dis_inst3_ereg_iid;      
input           idu_rtu_pst_dis_inst3_ereg_vld;      
input   [4 :0]  idu_rtu_pst_dis_inst3_rel_ereg;      
input           ifu_xx_sync_reset;                   
input           pad_yy_icg_scan_en;                  
input           retire_pst_async_flush;              
input           retire_pst_wb_retire_inst0_ereg_vld; 
input           retire_pst_wb_retire_inst1_ereg_vld; 
input           retire_pst_wb_retire_inst2_ereg_vld; 
input   [6 :0]  rob_pst_retire_inst0_iid;            
input   [6 :0]  rob_pst_retire_inst1_iid;            
input   [6 :0]  rob_pst_retire_inst2_iid;            
input           rtu_yy_xx_flush;                     
input           vfpu_rtu_ex5_pipe6_ereg_wb_vld;      
input   [4 :0]  vfpu_rtu_ex5_pipe6_wb_ereg;          
input           vfpu_rtu_ex5_pipe7_ereg_wb_vld;      
input   [4 :0]  vfpu_rtu_ex5_pipe7_wb_ereg;          
output          pst_retired_ereg_wb;                 
output  [4 :0]  rtu_idu_alloc_ereg0;                 
output          rtu_idu_alloc_ereg0_vld;             
output  [4 :0]  rtu_idu_alloc_ereg1;                 
output          rtu_idu_alloc_ereg1_vld;             
output  [4 :0]  rtu_idu_alloc_ereg2;                 
output          rtu_idu_alloc_ereg2_vld;             
output  [4 :0]  rtu_idu_alloc_ereg3;                 
output          rtu_idu_alloc_ereg3_vld;             
output  [31:0]  rtu_idu_pst_ereg_retired_released_wb; 
output  [4 :0]  rtu_idu_rt_recover_ereg;             

// &Regs; @30
reg     [4 :0]  alloc_ereg0;                         
reg             alloc_ereg0_vld;                     
reg     [4 :0]  alloc_ereg1;                         
reg             alloc_ereg1_vld;                     
reg     [4 :0]  alloc_ereg2;                         
reg             alloc_ereg2_vld;                     
reg     [4 :0]  alloc_ereg3;                         
reg             alloc_ereg3_vld;                     

// &Wires; @31
wire            alloc_ereg0_invalid;                 
wire            alloc_ereg1_invalid;                 
wire            alloc_ereg2_invalid;                 
wire            alloc_ereg3_invalid;                 
wire            alloc_ereg_clk;                      
wire            alloc_ereg_clk_en;                   
wire    [31:0]  alloc_release;                       
wire            cp0_rtu_icg_en;                      
wire            cp0_yy_clk_en;                       
wire            cpurst_b;                            
wire    [31:0]  d0_ereg;                             
wire    [31:0]  d1_ereg;                             
wire    [31:0]  d2_ereg;                             
wire    [31:0]  d3_ereg;                             
wire    [31:0]  dealloc;                             
wire    [31:0]  dealloc0;                            
wire    [31:0]  dealloc0_vec;                        
wire    [31:0]  dealloc1;                            
wire    [31:0]  dealloc1_vec;                        
wire    [31:0]  dealloc2;                            
wire    [31:0]  dealloc2_vec;                        
wire    [31:0]  dealloc3;                            
wire    [31:0]  dealloc3_vec;                        
wire    [4 :0]  dealloc_ereg0;                       
wire    [31:0]  dealloc_ereg0_expand;                
wire            dealloc_ereg0_vld;                   
wire    [4 :0]  dealloc_ereg1;                       
wire    [31:0]  dealloc_ereg1_expand;                
wire            dealloc_ereg1_vld;                   
wire    [4 :0]  dealloc_ereg2;                       
wire    [31:0]  dealloc_ereg2_expand;                
wire            dealloc_ereg2_vld;                   
wire    [4 :0]  dealloc_ereg3;                       
wire    [31:0]  dealloc_ereg3_expand;                
wire            dealloc_ereg3_vld;                   
wire    [31:0]  dealloc_no_0;                        
wire    [31:0]  dealloc_no_1;                        
wire    [31:0]  dealloc_vld;                         
wire            dealloc_vld_for_gateclk;             
wire    [3 :0]  ereg0_create_vld;                    
wire            ereg0_cur_state_alloc_release;       
wire            ereg0_cur_state_dealloc;             
wire            ereg0_cur_state_retire;              
wire            ereg0_dealloc_vld;                   
wire    [31:0]  ereg0_rel_ereg_expand;               
wire            ereg0_release_vld;                   
wire            ereg0_reset_mapped;                  
wire            ereg0_retired_released_wb;           
wire            ereg0_retired_released_wb_for_acc;   
wire            ereg0_wb_vld;                        
wire    [3 :0]  ereg10_create_vld;                   
wire            ereg10_cur_state_alloc_release;      
wire            ereg10_cur_state_dealloc;            
wire            ereg10_cur_state_retire;             
wire            ereg10_dealloc_vld;                  
wire    [31:0]  ereg10_rel_ereg_expand;              
wire            ereg10_release_vld;                  
wire            ereg10_reset_mapped;                 
wire            ereg10_retired_released_wb;          
wire            ereg10_retired_released_wb_for_acc;  
wire            ereg10_wb_vld;                       
wire    [3 :0]  ereg11_create_vld;                   
wire            ereg11_cur_state_alloc_release;      
wire            ereg11_cur_state_dealloc;            
wire            ereg11_cur_state_retire;             
wire            ereg11_dealloc_vld;                  
wire    [31:0]  ereg11_rel_ereg_expand;              
wire            ereg11_release_vld;                  
wire            ereg11_reset_mapped;                 
wire            ereg11_retired_released_wb;          
wire            ereg11_retired_released_wb_for_acc;  
wire            ereg11_wb_vld;                       
wire    [3 :0]  ereg12_create_vld;                   
wire            ereg12_cur_state_alloc_release;      
wire            ereg12_cur_state_dealloc;            
wire            ereg12_cur_state_retire;             
wire            ereg12_dealloc_vld;                  
wire    [31:0]  ereg12_rel_ereg_expand;              
wire            ereg12_release_vld;                  
wire            ereg12_reset_mapped;                 
wire            ereg12_retired_released_wb;          
wire            ereg12_retired_released_wb_for_acc;  
wire            ereg12_wb_vld;                       
wire    [3 :0]  ereg13_create_vld;                   
wire            ereg13_cur_state_alloc_release;      
wire            ereg13_cur_state_dealloc;            
wire            ereg13_cur_state_retire;             
wire            ereg13_dealloc_vld;                  
wire    [31:0]  ereg13_rel_ereg_expand;              
wire            ereg13_release_vld;                  
wire            ereg13_reset_mapped;                 
wire            ereg13_retired_released_wb;          
wire            ereg13_retired_released_wb_for_acc;  
wire            ereg13_wb_vld;                       
wire    [3 :0]  ereg14_create_vld;                   
wire            ereg14_cur_state_alloc_release;      
wire            ereg14_cur_state_dealloc;            
wire            ereg14_cur_state_retire;             
wire            ereg14_dealloc_vld;                  
wire    [31:0]  ereg14_rel_ereg_expand;              
wire            ereg14_release_vld;                  
wire            ereg14_reset_mapped;                 
wire            ereg14_retired_released_wb;          
wire            ereg14_retired_released_wb_for_acc;  
wire            ereg14_wb_vld;                       
wire    [3 :0]  ereg15_create_vld;                   
wire            ereg15_cur_state_alloc_release;      
wire            ereg15_cur_state_dealloc;            
wire            ereg15_cur_state_retire;             
wire            ereg15_dealloc_vld;                  
wire    [31:0]  ereg15_rel_ereg_expand;              
wire            ereg15_release_vld;                  
wire            ereg15_reset_mapped;                 
wire            ereg15_retired_released_wb;          
wire            ereg15_retired_released_wb_for_acc;  
wire            ereg15_wb_vld;                       
wire    [3 :0]  ereg16_create_vld;                   
wire            ereg16_cur_state_alloc_release;      
wire            ereg16_cur_state_dealloc;            
wire            ereg16_cur_state_retire;             
wire            ereg16_dealloc_vld;                  
wire    [31:0]  ereg16_rel_ereg_expand;              
wire            ereg16_release_vld;                  
wire            ereg16_reset_mapped;                 
wire            ereg16_retired_released_wb;          
wire            ereg16_retired_released_wb_for_acc;  
wire            ereg16_wb_vld;                       
wire    [3 :0]  ereg17_create_vld;                   
wire            ereg17_cur_state_alloc_release;      
wire            ereg17_cur_state_dealloc;            
wire            ereg17_cur_state_retire;             
wire            ereg17_dealloc_vld;                  
wire    [31:0]  ereg17_rel_ereg_expand;              
wire            ereg17_release_vld;                  
wire            ereg17_reset_mapped;                 
wire            ereg17_retired_released_wb;          
wire            ereg17_retired_released_wb_for_acc;  
wire            ereg17_wb_vld;                       
wire    [3 :0]  ereg18_create_vld;                   
wire            ereg18_cur_state_alloc_release;      
wire            ereg18_cur_state_dealloc;            
wire            ereg18_cur_state_retire;             
wire            ereg18_dealloc_vld;                  
wire    [31:0]  ereg18_rel_ereg_expand;              
wire            ereg18_release_vld;                  
wire            ereg18_reset_mapped;                 
wire            ereg18_retired_released_wb;          
wire            ereg18_retired_released_wb_for_acc;  
wire            ereg18_wb_vld;                       
wire    [3 :0]  ereg19_create_vld;                   
wire            ereg19_cur_state_alloc_release;      
wire            ereg19_cur_state_dealloc;            
wire            ereg19_cur_state_retire;             
wire            ereg19_dealloc_vld;                  
wire    [31:0]  ereg19_rel_ereg_expand;              
wire            ereg19_release_vld;                  
wire            ereg19_reset_mapped;                 
wire            ereg19_retired_released_wb;          
wire            ereg19_retired_released_wb_for_acc;  
wire            ereg19_wb_vld;                       
wire    [3 :0]  ereg1_create_vld;                    
wire            ereg1_cur_state_alloc_release;       
wire            ereg1_cur_state_dealloc;             
wire            ereg1_cur_state_retire;              
wire            ereg1_dealloc_vld;                   
wire    [31:0]  ereg1_rel_ereg_expand;               
wire            ereg1_release_vld;                   
wire            ereg1_reset_mapped;                  
wire            ereg1_retired_released_wb;           
wire            ereg1_retired_released_wb_for_acc;   
wire            ereg1_wb_vld;                        
wire    [3 :0]  ereg20_create_vld;                   
wire            ereg20_cur_state_alloc_release;      
wire            ereg20_cur_state_dealloc;            
wire            ereg20_cur_state_retire;             
wire            ereg20_dealloc_vld;                  
wire    [31:0]  ereg20_rel_ereg_expand;              
wire            ereg20_release_vld;                  
wire            ereg20_reset_mapped;                 
wire            ereg20_retired_released_wb;          
wire            ereg20_retired_released_wb_for_acc;  
wire            ereg20_wb_vld;                       
wire    [3 :0]  ereg21_create_vld;                   
wire            ereg21_cur_state_alloc_release;      
wire            ereg21_cur_state_dealloc;            
wire            ereg21_cur_state_retire;             
wire            ereg21_dealloc_vld;                  
wire    [31:0]  ereg21_rel_ereg_expand;              
wire            ereg21_release_vld;                  
wire            ereg21_reset_mapped;                 
wire            ereg21_retired_released_wb;          
wire            ereg21_retired_released_wb_for_acc;  
wire            ereg21_wb_vld;                       
wire    [3 :0]  ereg22_create_vld;                   
wire            ereg22_cur_state_alloc_release;      
wire            ereg22_cur_state_dealloc;            
wire            ereg22_cur_state_retire;             
wire            ereg22_dealloc_vld;                  
wire    [31:0]  ereg22_rel_ereg_expand;              
wire            ereg22_release_vld;                  
wire            ereg22_reset_mapped;                 
wire            ereg22_retired_released_wb;          
wire            ereg22_retired_released_wb_for_acc;  
wire            ereg22_wb_vld;                       
wire    [3 :0]  ereg23_create_vld;                   
wire            ereg23_cur_state_alloc_release;      
wire            ereg23_cur_state_dealloc;            
wire            ereg23_cur_state_retire;             
wire            ereg23_dealloc_vld;                  
wire    [31:0]  ereg23_rel_ereg_expand;              
wire            ereg23_release_vld;                  
wire            ereg23_reset_mapped;                 
wire            ereg23_retired_released_wb;          
wire            ereg23_retired_released_wb_for_acc;  
wire            ereg23_wb_vld;                       
wire    [3 :0]  ereg24_create_vld;                   
wire            ereg24_cur_state_alloc_release;      
wire            ereg24_cur_state_dealloc;            
wire            ereg24_cur_state_retire;             
wire            ereg24_dealloc_vld;                  
wire    [31:0]  ereg24_rel_ereg_expand;              
wire            ereg24_release_vld;                  
wire            ereg24_reset_mapped;                 
wire            ereg24_retired_released_wb;          
wire            ereg24_retired_released_wb_for_acc;  
wire            ereg24_wb_vld;                       
wire    [3 :0]  ereg25_create_vld;                   
wire            ereg25_cur_state_alloc_release;      
wire            ereg25_cur_state_dealloc;            
wire            ereg25_cur_state_retire;             
wire            ereg25_dealloc_vld;                  
wire    [31:0]  ereg25_rel_ereg_expand;              
wire            ereg25_release_vld;                  
wire            ereg25_reset_mapped;                 
wire            ereg25_retired_released_wb;          
wire            ereg25_retired_released_wb_for_acc;  
wire            ereg25_wb_vld;                       
wire    [3 :0]  ereg26_create_vld;                   
wire            ereg26_cur_state_alloc_release;      
wire            ereg26_cur_state_dealloc;            
wire            ereg26_cur_state_retire;             
wire            ereg26_dealloc_vld;                  
wire    [31:0]  ereg26_rel_ereg_expand;              
wire            ereg26_release_vld;                  
wire            ereg26_reset_mapped;                 
wire            ereg26_retired_released_wb;          
wire            ereg26_retired_released_wb_for_acc;  
wire            ereg26_wb_vld;                       
wire    [3 :0]  ereg27_create_vld;                   
wire            ereg27_cur_state_alloc_release;      
wire            ereg27_cur_state_dealloc;            
wire            ereg27_cur_state_retire;             
wire            ereg27_dealloc_vld;                  
wire    [31:0]  ereg27_rel_ereg_expand;              
wire            ereg27_release_vld;                  
wire            ereg27_reset_mapped;                 
wire            ereg27_retired_released_wb;          
wire            ereg27_retired_released_wb_for_acc;  
wire            ereg27_wb_vld;                       
wire    [3 :0]  ereg28_create_vld;                   
wire            ereg28_cur_state_alloc_release;      
wire            ereg28_cur_state_dealloc;            
wire            ereg28_cur_state_retire;             
wire            ereg28_dealloc_vld;                  
wire    [31:0]  ereg28_rel_ereg_expand;              
wire            ereg28_release_vld;                  
wire            ereg28_reset_mapped;                 
wire            ereg28_retired_released_wb;          
wire            ereg28_retired_released_wb_for_acc;  
wire            ereg28_wb_vld;                       
wire    [3 :0]  ereg29_create_vld;                   
wire            ereg29_cur_state_alloc_release;      
wire            ereg29_cur_state_dealloc;            
wire            ereg29_cur_state_retire;             
wire            ereg29_dealloc_vld;                  
wire    [31:0]  ereg29_rel_ereg_expand;              
wire            ereg29_release_vld;                  
wire            ereg29_reset_mapped;                 
wire            ereg29_retired_released_wb;          
wire            ereg29_retired_released_wb_for_acc;  
wire            ereg29_wb_vld;                       
wire    [3 :0]  ereg2_create_vld;                    
wire            ereg2_cur_state_alloc_release;       
wire            ereg2_cur_state_dealloc;             
wire            ereg2_cur_state_retire;              
wire            ereg2_dealloc_vld;                   
wire    [31:0]  ereg2_rel_ereg_expand;               
wire            ereg2_release_vld;                   
wire            ereg2_reset_mapped;                  
wire            ereg2_retired_released_wb;           
wire            ereg2_retired_released_wb_for_acc;   
wire            ereg2_wb_vld;                        
wire    [3 :0]  ereg30_create_vld;                   
wire            ereg30_cur_state_alloc_release;      
wire            ereg30_cur_state_dealloc;            
wire            ereg30_cur_state_retire;             
wire            ereg30_dealloc_vld;                  
wire    [31:0]  ereg30_rel_ereg_expand;              
wire            ereg30_release_vld;                  
wire            ereg30_reset_mapped;                 
wire            ereg30_retired_released_wb;          
wire            ereg30_retired_released_wb_for_acc;  
wire            ereg30_wb_vld;                       
wire    [3 :0]  ereg31_create_vld;                   
wire            ereg31_cur_state_alloc_release;      
wire            ereg31_cur_state_dealloc;            
wire            ereg31_cur_state_retire;             
wire            ereg31_dealloc_vld;                  
wire    [31:0]  ereg31_rel_ereg_expand;              
wire            ereg31_release_vld;                  
wire            ereg31_reset_mapped;                 
wire            ereg31_retired_released_wb;          
wire            ereg31_retired_released_wb_for_acc;  
wire            ereg31_wb_vld;                       
wire    [3 :0]  ereg3_create_vld;                    
wire            ereg3_cur_state_alloc_release;       
wire            ereg3_cur_state_dealloc;             
wire            ereg3_cur_state_retire;              
wire            ereg3_dealloc_vld;                   
wire    [31:0]  ereg3_rel_ereg_expand;               
wire            ereg3_release_vld;                   
wire            ereg3_reset_mapped;                  
wire            ereg3_retired_released_wb;           
wire            ereg3_retired_released_wb_for_acc;   
wire            ereg3_wb_vld;                        
wire    [3 :0]  ereg4_create_vld;                    
wire            ereg4_cur_state_alloc_release;       
wire            ereg4_cur_state_dealloc;             
wire            ereg4_cur_state_retire;              
wire            ereg4_dealloc_vld;                   
wire    [31:0]  ereg4_rel_ereg_expand;               
wire            ereg4_release_vld;                   
wire            ereg4_reset_mapped;                  
wire            ereg4_retired_released_wb;           
wire            ereg4_retired_released_wb_for_acc;   
wire            ereg4_wb_vld;                        
wire    [3 :0]  ereg5_create_vld;                    
wire            ereg5_cur_state_alloc_release;       
wire            ereg5_cur_state_dealloc;             
wire            ereg5_cur_state_retire;              
wire            ereg5_dealloc_vld;                   
wire    [31:0]  ereg5_rel_ereg_expand;               
wire            ereg5_release_vld;                   
wire            ereg5_reset_mapped;                  
wire            ereg5_retired_released_wb;           
wire            ereg5_retired_released_wb_for_acc;   
wire            ereg5_wb_vld;                        
wire    [3 :0]  ereg6_create_vld;                    
wire            ereg6_cur_state_alloc_release;       
wire            ereg6_cur_state_dealloc;             
wire            ereg6_cur_state_retire;              
wire            ereg6_dealloc_vld;                   
wire    [31:0]  ereg6_rel_ereg_expand;               
wire            ereg6_release_vld;                   
wire            ereg6_reset_mapped;                  
wire            ereg6_retired_released_wb;           
wire            ereg6_retired_released_wb_for_acc;   
wire            ereg6_wb_vld;                        
wire    [3 :0]  ereg7_create_vld;                    
wire            ereg7_cur_state_alloc_release;       
wire            ereg7_cur_state_dealloc;             
wire            ereg7_cur_state_retire;              
wire            ereg7_dealloc_vld;                   
wire    [31:0]  ereg7_rel_ereg_expand;               
wire            ereg7_release_vld;                   
wire            ereg7_reset_mapped;                  
wire            ereg7_retired_released_wb;           
wire            ereg7_retired_released_wb_for_acc;   
wire            ereg7_wb_vld;                        
wire    [3 :0]  ereg8_create_vld;                    
wire            ereg8_cur_state_alloc_release;       
wire            ereg8_cur_state_dealloc;             
wire            ereg8_cur_state_retire;              
wire            ereg8_dealloc_vld;                   
wire    [31:0]  ereg8_rel_ereg_expand;               
wire            ereg8_release_vld;                   
wire            ereg8_reset_mapped;                  
wire            ereg8_retired_released_wb;           
wire            ereg8_retired_released_wb_for_acc;   
wire            ereg8_wb_vld;                        
wire    [3 :0]  ereg9_create_vld;                    
wire            ereg9_cur_state_alloc_release;       
wire            ereg9_cur_state_dealloc;             
wire            ereg9_cur_state_retire;              
wire            ereg9_dealloc_vld;                   
wire    [31:0]  ereg9_rel_ereg_expand;               
wire            ereg9_release_vld;                   
wire            ereg9_reset_mapped;                  
wire            ereg9_retired_released_wb;           
wire            ereg9_retired_released_wb_for_acc;   
wire            ereg9_wb_vld;                        
wire            ereg_alloc_release;                  
wire            ereg_clk_en;                         
wire            ereg_top_clk;                        
wire            forever_cpuclk;                      
wire            idu_rtu_ir_ereg0_alloc_vld;          
wire            idu_rtu_ir_ereg1_alloc_vld;          
wire            idu_rtu_ir_ereg2_alloc_vld;          
wire            idu_rtu_ir_ereg3_alloc_vld;          
wire            idu_rtu_ir_ereg_alloc_gateclk_vld;   
wire    [4 :0]  idu_rtu_pst_dis_inst0_ereg;          
wire    [31:0]  idu_rtu_pst_dis_inst0_ereg_expand;   
wire    [6 :0]  idu_rtu_pst_dis_inst0_ereg_iid;      
wire            idu_rtu_pst_dis_inst0_ereg_vld;      
wire    [4 :0]  idu_rtu_pst_dis_inst0_rel_ereg;      
wire    [4 :0]  idu_rtu_pst_dis_inst1_ereg;          
wire    [31:0]  idu_rtu_pst_dis_inst1_ereg_expand;   
wire    [6 :0]  idu_rtu_pst_dis_inst1_ereg_iid;      
wire            idu_rtu_pst_dis_inst1_ereg_vld;      
wire    [4 :0]  idu_rtu_pst_dis_inst1_rel_ereg;      
wire    [4 :0]  idu_rtu_pst_dis_inst2_ereg;          
wire    [31:0]  idu_rtu_pst_dis_inst2_ereg_expand;   
wire    [6 :0]  idu_rtu_pst_dis_inst2_ereg_iid;      
wire            idu_rtu_pst_dis_inst2_ereg_vld;      
wire    [4 :0]  idu_rtu_pst_dis_inst2_rel_ereg;      
wire    [4 :0]  idu_rtu_pst_dis_inst3_ereg;          
wire    [31:0]  idu_rtu_pst_dis_inst3_ereg_expand;   
wire    [6 :0]  idu_rtu_pst_dis_inst3_ereg_iid;      
wire            idu_rtu_pst_dis_inst3_ereg_vld;      
wire    [4 :0]  idu_rtu_pst_dis_inst3_rel_ereg;      
wire            ifu_xx_sync_reset;                   
wire            pad_yy_icg_scan_en;                  
wire            pst_retired_ereg_wb;                 
wire    [31:0]  release_vld;                         
wire            retire_pst_async_flush;              
wire            retire_pst_wb_retire_inst0_ereg_vld; 
wire            retire_pst_wb_retire_inst1_ereg_vld; 
wire            retire_pst_wb_retire_inst2_ereg_vld; 
wire    [31:0]  retired_released_wb;                 
wire    [31:0]  retired_released_wb_for_acc;         
wire    [6 :0]  rob_pst_retire_inst0_iid;            
wire    [6 :0]  rob_pst_retire_inst1_iid;            
wire    [6 :0]  rob_pst_retire_inst2_iid;            
wire    [4 :0]  rtu_idu_alloc_ereg0;                 
wire            rtu_idu_alloc_ereg0_vld;             
wire    [4 :0]  rtu_idu_alloc_ereg1;                 
wire            rtu_idu_alloc_ereg1_vld;             
wire    [4 :0]  rtu_idu_alloc_ereg2;                 
wire            rtu_idu_alloc_ereg2_vld;             
wire    [4 :0]  rtu_idu_alloc_ereg3;                 
wire            rtu_idu_alloc_ereg3_vld;             
wire    [31:0]  rtu_idu_pst_ereg_retired_released_wb; 
wire    [4 :0]  rtu_idu_rt_recover_ereg;             
wire    [31:0]  rtu_idu_rt_recover_ereg_expand;      
wire            rtu_yy_xx_flush;                     
wire            vfpu_rtu_ex5_pipe6_ereg_wb_vld;      
wire    [4 :0]  vfpu_rtu_ex5_pipe6_wb_ereg;          
wire    [31:0]  vfpu_rtu_ex5_pipe6_wb_ereg_expand;   
wire            vfpu_rtu_ex5_pipe7_ereg_wb_vld;      
wire    [4 :0]  vfpu_rtu_ex5_pipe7_wb_ereg;          
wire    [31:0]  vfpu_rtu_ex5_pipe7_wb_ereg_expand;   
wire    [31:0]  wb_vld;                              


//==========================================================
//                 Top Mudule Gated Cell
//==========================================================
//if release_vld, there must be a reg retire_vld, which means
//retiring reg is in alloc state, so can ignore release_vld here
assign ereg_clk_en = rtu_yy_xx_flush
                     || retire_pst_async_flush
                     || ifu_xx_sync_reset
                     || dealloc_vld_for_gateclk
                     || vfpu_rtu_ex5_pipe6_ereg_wb_vld
                     || vfpu_rtu_ex5_pipe7_ereg_wb_vld
                     || idu_rtu_pst_dis_inst0_ereg_vld
                     || idu_rtu_pst_dis_inst1_ereg_vld
                     || idu_rtu_pst_dis_inst2_ereg_vld
                     || idu_rtu_pst_dis_inst3_ereg_vld
                     || ereg_alloc_release;

// &Instance("gated_clk_cell", "x_ereg_gated_clk"); @50
gated_clk_cell  x_ereg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ereg_top_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ereg_clk_en       ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @51
//          .external_en (1'b0), @52
//          .global_en   (cp0_yy_clk_en), @53
//          .module_en   (cp0_rtu_icg_en), @54
//          .local_en    (ereg_clk_en), @55
//          .clk_out     (ereg_top_clk)); @56

//==========================================================
//                   Instance Entries
//==========================================================
//----------------------------------------------------------
//               C Physical Regsiters (Freg)
//----------------------------------------------------------
// &ConnRule(s/^x_/ereg0_/); @64
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg0"); @65
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg0 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg0_create_vld                   ),
  .x_cur_state_alloc_release           (ereg0_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg0_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg0_cur_state_retire             ),
  .x_dealloc_vld                       (ereg0_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg0_rel_ereg_expand              ),
  .x_release_vld                       (ereg0_release_vld                  ),
  .x_reset_mapped                      (ereg0_reset_mapped                 ),
  .x_retired_released_wb               (ereg0_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg0_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg0_wb_vld                       )
);

// &ConnRule(s/^x_/ereg1_/); @66
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg1"); @67
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg1 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg1_create_vld                   ),
  .x_cur_state_alloc_release           (ereg1_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg1_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg1_cur_state_retire             ),
  .x_dealloc_vld                       (ereg1_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg1_rel_ereg_expand              ),
  .x_release_vld                       (ereg1_release_vld                  ),
  .x_reset_mapped                      (ereg1_reset_mapped                 ),
  .x_retired_released_wb               (ereg1_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg1_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg1_wb_vld                       )
);

// &ConnRule(s/^x_/ereg2_/); @68
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg2"); @69
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg2 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg2_create_vld                   ),
  .x_cur_state_alloc_release           (ereg2_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg2_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg2_cur_state_retire             ),
  .x_dealloc_vld                       (ereg2_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg2_rel_ereg_expand              ),
  .x_release_vld                       (ereg2_release_vld                  ),
  .x_reset_mapped                      (ereg2_reset_mapped                 ),
  .x_retired_released_wb               (ereg2_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg2_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg2_wb_vld                       )
);

// &ConnRule(s/^x_/ereg3_/); @70
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg3"); @71
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg3 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg3_create_vld                   ),
  .x_cur_state_alloc_release           (ereg3_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg3_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg3_cur_state_retire             ),
  .x_dealloc_vld                       (ereg3_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg3_rel_ereg_expand              ),
  .x_release_vld                       (ereg3_release_vld                  ),
  .x_reset_mapped                      (ereg3_reset_mapped                 ),
  .x_retired_released_wb               (ereg3_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg3_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg3_wb_vld                       )
);

// &ConnRule(s/^x_/ereg4_/); @72
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg4"); @73
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg4 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg4_create_vld                   ),
  .x_cur_state_alloc_release           (ereg4_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg4_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg4_cur_state_retire             ),
  .x_dealloc_vld                       (ereg4_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg4_rel_ereg_expand              ),
  .x_release_vld                       (ereg4_release_vld                  ),
  .x_reset_mapped                      (ereg4_reset_mapped                 ),
  .x_retired_released_wb               (ereg4_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg4_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg4_wb_vld                       )
);

// &ConnRule(s/^x_/ereg5_/); @74
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg5"); @75
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg5 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg5_create_vld                   ),
  .x_cur_state_alloc_release           (ereg5_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg5_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg5_cur_state_retire             ),
  .x_dealloc_vld                       (ereg5_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg5_rel_ereg_expand              ),
  .x_release_vld                       (ereg5_release_vld                  ),
  .x_reset_mapped                      (ereg5_reset_mapped                 ),
  .x_retired_released_wb               (ereg5_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg5_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg5_wb_vld                       )
);

// &ConnRule(s/^x_/ereg6_/); @76
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg6"); @77
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg6 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg6_create_vld                   ),
  .x_cur_state_alloc_release           (ereg6_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg6_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg6_cur_state_retire             ),
  .x_dealloc_vld                       (ereg6_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg6_rel_ereg_expand              ),
  .x_release_vld                       (ereg6_release_vld                  ),
  .x_reset_mapped                      (ereg6_reset_mapped                 ),
  .x_retired_released_wb               (ereg6_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg6_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg6_wb_vld                       )
);

// &ConnRule(s/^x_/ereg7_/); @78
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg7"); @79
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg7 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg7_create_vld                   ),
  .x_cur_state_alloc_release           (ereg7_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg7_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg7_cur_state_retire             ),
  .x_dealloc_vld                       (ereg7_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg7_rel_ereg_expand              ),
  .x_release_vld                       (ereg7_release_vld                  ),
  .x_reset_mapped                      (ereg7_reset_mapped                 ),
  .x_retired_released_wb               (ereg7_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg7_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg7_wb_vld                       )
);

// &ConnRule(s/^x_/ereg8_/); @80
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg8"); @81
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg8 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg8_create_vld                   ),
  .x_cur_state_alloc_release           (ereg8_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg8_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg8_cur_state_retire             ),
  .x_dealloc_vld                       (ereg8_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg8_rel_ereg_expand              ),
  .x_release_vld                       (ereg8_release_vld                  ),
  .x_reset_mapped                      (ereg8_reset_mapped                 ),
  .x_retired_released_wb               (ereg8_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg8_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg8_wb_vld                       )
);

// &ConnRule(s/^x_/ereg9_/); @82
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg9"); @83
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg9 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg9_create_vld                   ),
  .x_cur_state_alloc_release           (ereg9_cur_state_alloc_release      ),
  .x_cur_state_dealloc                 (ereg9_cur_state_dealloc            ),
  .x_cur_state_retire                  (ereg9_cur_state_retire             ),
  .x_dealloc_vld                       (ereg9_dealloc_vld                  ),
  .x_rel_ereg_expand                   (ereg9_rel_ereg_expand              ),
  .x_release_vld                       (ereg9_release_vld                  ),
  .x_reset_mapped                      (ereg9_reset_mapped                 ),
  .x_retired_released_wb               (ereg9_retired_released_wb          ),
  .x_retired_released_wb_for_acc       (ereg9_retired_released_wb_for_acc  ),
  .x_wb_vld                            (ereg9_wb_vld                       )
);

// &ConnRule(s/^x_/ereg10_/); @84
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg10"); @85
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg10 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg10_create_vld                  ),
  .x_cur_state_alloc_release           (ereg10_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg10_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg10_cur_state_retire            ),
  .x_dealloc_vld                       (ereg10_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg10_rel_ereg_expand             ),
  .x_release_vld                       (ereg10_release_vld                 ),
  .x_reset_mapped                      (ereg10_reset_mapped                ),
  .x_retired_released_wb               (ereg10_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg10_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg10_wb_vld                      )
);

// &ConnRule(s/^x_/ereg11_/); @86
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg11"); @87
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg11 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg11_create_vld                  ),
  .x_cur_state_alloc_release           (ereg11_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg11_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg11_cur_state_retire            ),
  .x_dealloc_vld                       (ereg11_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg11_rel_ereg_expand             ),
  .x_release_vld                       (ereg11_release_vld                 ),
  .x_reset_mapped                      (ereg11_reset_mapped                ),
  .x_retired_released_wb               (ereg11_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg11_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg11_wb_vld                      )
);

// &ConnRule(s/^x_/ereg12_/); @88
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg12"); @89
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg12 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg12_create_vld                  ),
  .x_cur_state_alloc_release           (ereg12_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg12_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg12_cur_state_retire            ),
  .x_dealloc_vld                       (ereg12_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg12_rel_ereg_expand             ),
  .x_release_vld                       (ereg12_release_vld                 ),
  .x_reset_mapped                      (ereg12_reset_mapped                ),
  .x_retired_released_wb               (ereg12_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg12_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg12_wb_vld                      )
);

// &ConnRule(s/^x_/ereg13_/); @90
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg13"); @91
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg13 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg13_create_vld                  ),
  .x_cur_state_alloc_release           (ereg13_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg13_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg13_cur_state_retire            ),
  .x_dealloc_vld                       (ereg13_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg13_rel_ereg_expand             ),
  .x_release_vld                       (ereg13_release_vld                 ),
  .x_reset_mapped                      (ereg13_reset_mapped                ),
  .x_retired_released_wb               (ereg13_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg13_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg13_wb_vld                      )
);

// &ConnRule(s/^x_/ereg14_/); @92
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg14"); @93
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg14 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg14_create_vld                  ),
  .x_cur_state_alloc_release           (ereg14_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg14_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg14_cur_state_retire            ),
  .x_dealloc_vld                       (ereg14_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg14_rel_ereg_expand             ),
  .x_release_vld                       (ereg14_release_vld                 ),
  .x_reset_mapped                      (ereg14_reset_mapped                ),
  .x_retired_released_wb               (ereg14_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg14_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg14_wb_vld                      )
);

// &ConnRule(s/^x_/ereg15_/); @94
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg15"); @95
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg15 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg15_create_vld                  ),
  .x_cur_state_alloc_release           (ereg15_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg15_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg15_cur_state_retire            ),
  .x_dealloc_vld                       (ereg15_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg15_rel_ereg_expand             ),
  .x_release_vld                       (ereg15_release_vld                 ),
  .x_reset_mapped                      (ereg15_reset_mapped                ),
  .x_retired_released_wb               (ereg15_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg15_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg15_wb_vld                      )
);

// &ConnRule(s/^x_/ereg16_/); @96
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg16"); @97
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg16 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg16_create_vld                  ),
  .x_cur_state_alloc_release           (ereg16_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg16_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg16_cur_state_retire            ),
  .x_dealloc_vld                       (ereg16_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg16_rel_ereg_expand             ),
  .x_release_vld                       (ereg16_release_vld                 ),
  .x_reset_mapped                      (ereg16_reset_mapped                ),
  .x_retired_released_wb               (ereg16_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg16_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg16_wb_vld                      )
);

// &ConnRule(s/^x_/ereg17_/); @98
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg17"); @99
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg17 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg17_create_vld                  ),
  .x_cur_state_alloc_release           (ereg17_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg17_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg17_cur_state_retire            ),
  .x_dealloc_vld                       (ereg17_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg17_rel_ereg_expand             ),
  .x_release_vld                       (ereg17_release_vld                 ),
  .x_reset_mapped                      (ereg17_reset_mapped                ),
  .x_retired_released_wb               (ereg17_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg17_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg17_wb_vld                      )
);

// &ConnRule(s/^x_/ereg18_/); @100
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg18"); @101
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg18 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg18_create_vld                  ),
  .x_cur_state_alloc_release           (ereg18_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg18_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg18_cur_state_retire            ),
  .x_dealloc_vld                       (ereg18_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg18_rel_ereg_expand             ),
  .x_release_vld                       (ereg18_release_vld                 ),
  .x_reset_mapped                      (ereg18_reset_mapped                ),
  .x_retired_released_wb               (ereg18_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg18_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg18_wb_vld                      )
);

// &ConnRule(s/^x_/ereg19_/); @102
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg19"); @103
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg19 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg19_create_vld                  ),
  .x_cur_state_alloc_release           (ereg19_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg19_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg19_cur_state_retire            ),
  .x_dealloc_vld                       (ereg19_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg19_rel_ereg_expand             ),
  .x_release_vld                       (ereg19_release_vld                 ),
  .x_reset_mapped                      (ereg19_reset_mapped                ),
  .x_retired_released_wb               (ereg19_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg19_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg19_wb_vld                      )
);

// &ConnRule(s/^x_/ereg20_/); @104
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg20"); @105
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg20 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg20_create_vld                  ),
  .x_cur_state_alloc_release           (ereg20_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg20_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg20_cur_state_retire            ),
  .x_dealloc_vld                       (ereg20_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg20_rel_ereg_expand             ),
  .x_release_vld                       (ereg20_release_vld                 ),
  .x_reset_mapped                      (ereg20_reset_mapped                ),
  .x_retired_released_wb               (ereg20_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg20_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg20_wb_vld                      )
);

// &ConnRule(s/^x_/ereg21_/); @106
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg21"); @107
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg21 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg21_create_vld                  ),
  .x_cur_state_alloc_release           (ereg21_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg21_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg21_cur_state_retire            ),
  .x_dealloc_vld                       (ereg21_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg21_rel_ereg_expand             ),
  .x_release_vld                       (ereg21_release_vld                 ),
  .x_reset_mapped                      (ereg21_reset_mapped                ),
  .x_retired_released_wb               (ereg21_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg21_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg21_wb_vld                      )
);

// &ConnRule(s/^x_/ereg22_/); @108
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg22"); @109
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg22 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg22_create_vld                  ),
  .x_cur_state_alloc_release           (ereg22_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg22_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg22_cur_state_retire            ),
  .x_dealloc_vld                       (ereg22_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg22_rel_ereg_expand             ),
  .x_release_vld                       (ereg22_release_vld                 ),
  .x_reset_mapped                      (ereg22_reset_mapped                ),
  .x_retired_released_wb               (ereg22_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg22_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg22_wb_vld                      )
);

// &ConnRule(s/^x_/ereg23_/); @110
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg23"); @111
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg23 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg23_create_vld                  ),
  .x_cur_state_alloc_release           (ereg23_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg23_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg23_cur_state_retire            ),
  .x_dealloc_vld                       (ereg23_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg23_rel_ereg_expand             ),
  .x_release_vld                       (ereg23_release_vld                 ),
  .x_reset_mapped                      (ereg23_reset_mapped                ),
  .x_retired_released_wb               (ereg23_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg23_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg23_wb_vld                      )
);

// &ConnRule(s/^x_/ereg24_/); @112
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg24"); @113
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg24 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg24_create_vld                  ),
  .x_cur_state_alloc_release           (ereg24_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg24_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg24_cur_state_retire            ),
  .x_dealloc_vld                       (ereg24_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg24_rel_ereg_expand             ),
  .x_release_vld                       (ereg24_release_vld                 ),
  .x_reset_mapped                      (ereg24_reset_mapped                ),
  .x_retired_released_wb               (ereg24_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg24_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg24_wb_vld                      )
);

// &ConnRule(s/^x_/ereg25_/); @114
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg25"); @115
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg25 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg25_create_vld                  ),
  .x_cur_state_alloc_release           (ereg25_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg25_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg25_cur_state_retire            ),
  .x_dealloc_vld                       (ereg25_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg25_rel_ereg_expand             ),
  .x_release_vld                       (ereg25_release_vld                 ),
  .x_reset_mapped                      (ereg25_reset_mapped                ),
  .x_retired_released_wb               (ereg25_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg25_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg25_wb_vld                      )
);

// &ConnRule(s/^x_/ereg26_/); @116
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg26"); @117
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg26 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg26_create_vld                  ),
  .x_cur_state_alloc_release           (ereg26_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg26_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg26_cur_state_retire            ),
  .x_dealloc_vld                       (ereg26_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg26_rel_ereg_expand             ),
  .x_release_vld                       (ereg26_release_vld                 ),
  .x_reset_mapped                      (ereg26_reset_mapped                ),
  .x_retired_released_wb               (ereg26_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg26_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg26_wb_vld                      )
);

// &ConnRule(s/^x_/ereg27_/); @118
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg27"); @119
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg27 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg27_create_vld                  ),
  .x_cur_state_alloc_release           (ereg27_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg27_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg27_cur_state_retire            ),
  .x_dealloc_vld                       (ereg27_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg27_rel_ereg_expand             ),
  .x_release_vld                       (ereg27_release_vld                 ),
  .x_reset_mapped                      (ereg27_reset_mapped                ),
  .x_retired_released_wb               (ereg27_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg27_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg27_wb_vld                      )
);

// &ConnRule(s/^x_/ereg28_/); @120
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg28"); @121
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg28 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg28_create_vld                  ),
  .x_cur_state_alloc_release           (ereg28_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg28_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg28_cur_state_retire            ),
  .x_dealloc_vld                       (ereg28_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg28_rel_ereg_expand             ),
  .x_release_vld                       (ereg28_release_vld                 ),
  .x_reset_mapped                      (ereg28_reset_mapped                ),
  .x_retired_released_wb               (ereg28_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg28_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg28_wb_vld                      )
);

// &ConnRule(s/^x_/ereg29_/); @122
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg29"); @123
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg29 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg29_create_vld                  ),
  .x_cur_state_alloc_release           (ereg29_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg29_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg29_cur_state_retire            ),
  .x_dealloc_vld                       (ereg29_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg29_rel_ereg_expand             ),
  .x_release_vld                       (ereg29_release_vld                 ),
  .x_reset_mapped                      (ereg29_reset_mapped                ),
  .x_retired_released_wb               (ereg29_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg29_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg29_wb_vld                      )
);

// &ConnRule(s/^x_/ereg30_/); @124
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg30"); @125
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg30 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg30_create_vld                  ),
  .x_cur_state_alloc_release           (ereg30_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg30_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg30_cur_state_retire            ),
  .x_dealloc_vld                       (ereg30_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg30_rel_ereg_expand             ),
  .x_release_vld                       (ereg30_release_vld                 ),
  .x_reset_mapped                      (ereg30_reset_mapped                ),
  .x_retired_released_wb               (ereg30_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg30_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg30_wb_vld                      )
);

// &ConnRule(s/^x_/ereg31_/); @126
// &Instance("ct_rtu_pst_ereg_entry","x_ct_rtu_pst_entry_ereg31"); @127
ct_rtu_pst_ereg_entry  x_ct_rtu_pst_entry_ereg31 (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .dealloc_vld_for_gateclk             (dealloc_vld_for_gateclk            ),
  .ereg_top_clk                        (ereg_top_clk                       ),
  .idu_rtu_pst_dis_inst0_ereg_iid      (idu_rtu_pst_dis_inst0_ereg_iid     ),
  .idu_rtu_pst_dis_inst0_rel_ereg      (idu_rtu_pst_dis_inst0_rel_ereg     ),
  .idu_rtu_pst_dis_inst1_ereg_iid      (idu_rtu_pst_dis_inst1_ereg_iid     ),
  .idu_rtu_pst_dis_inst1_rel_ereg      (idu_rtu_pst_dis_inst1_rel_ereg     ),
  .idu_rtu_pst_dis_inst2_ereg_iid      (idu_rtu_pst_dis_inst2_ereg_iid     ),
  .idu_rtu_pst_dis_inst2_rel_ereg      (idu_rtu_pst_dis_inst2_rel_ereg     ),
  .idu_rtu_pst_dis_inst3_ereg_iid      (idu_rtu_pst_dis_inst3_ereg_iid     ),
  .idu_rtu_pst_dis_inst3_rel_ereg      (idu_rtu_pst_dis_inst3_rel_ereg     ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_ereg_vld (retire_pst_wb_retire_inst0_ereg_vld),
  .retire_pst_wb_retire_inst1_ereg_vld (retire_pst_wb_retire_inst1_ereg_vld),
  .retire_pst_wb_retire_inst2_ereg_vld (retire_pst_wb_retire_inst2_ereg_vld),
  .rob_pst_retire_inst0_iid            (rob_pst_retire_inst0_iid           ),
  .rob_pst_retire_inst1_iid            (rob_pst_retire_inst1_iid           ),
  .rob_pst_retire_inst2_iid            (rob_pst_retire_inst2_iid           ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .x_create_vld                        (ereg31_create_vld                  ),
  .x_cur_state_alloc_release           (ereg31_cur_state_alloc_release     ),
  .x_cur_state_dealloc                 (ereg31_cur_state_dealloc           ),
  .x_cur_state_retire                  (ereg31_cur_state_retire            ),
  .x_dealloc_vld                       (ereg31_dealloc_vld                 ),
  .x_rel_ereg_expand                   (ereg31_rel_ereg_expand             ),
  .x_release_vld                       (ereg31_release_vld                 ),
  .x_reset_mapped                      (ereg31_reset_mapped                ),
  .x_retired_released_wb               (ereg31_retired_released_wb         ),
  .x_retired_released_wb_for_acc       (ereg31_retired_released_wb_for_acc ),
  .x_wb_vld                            (ereg31_wb_vld                      )
);


//==========================================================
//          PST GPR Physical Register (Freg) Logic
//==========================================================

//==========================================================
//                  Reset initial states
//==========================================================
//after reset, c0 will be mapped to c, c1-c31 will be dealloc
assign ereg0_reset_mapped  = 1'b1;
assign ereg1_reset_mapped  = 1'b0;
assign ereg2_reset_mapped  = 1'b0;
assign ereg3_reset_mapped  = 1'b0;
assign ereg4_reset_mapped  = 1'b0;
assign ereg5_reset_mapped  = 1'b0;
assign ereg6_reset_mapped  = 1'b0;
assign ereg7_reset_mapped  = 1'b0;
assign ereg8_reset_mapped  = 1'b0;
assign ereg9_reset_mapped  = 1'b0;
assign ereg10_reset_mapped = 1'b0;
assign ereg11_reset_mapped = 1'b0;
assign ereg12_reset_mapped = 1'b0;
assign ereg13_reset_mapped = 1'b0;
assign ereg14_reset_mapped = 1'b0;
assign ereg15_reset_mapped = 1'b0;
assign ereg16_reset_mapped = 1'b0;
assign ereg17_reset_mapped = 1'b0;
assign ereg18_reset_mapped = 1'b0;
assign ereg19_reset_mapped = 1'b0;
assign ereg20_reset_mapped = 1'b0;
assign ereg21_reset_mapped = 1'b0;
assign ereg22_reset_mapped = 1'b0;
assign ereg23_reset_mapped = 1'b0;
assign ereg24_reset_mapped = 1'b0;
assign ereg25_reset_mapped = 1'b0;
assign ereg26_reset_mapped = 1'b0;
assign ereg27_reset_mapped = 1'b0;
assign ereg28_reset_mapped = 1'b0;
assign ereg29_reset_mapped = 1'b0;
assign ereg30_reset_mapped = 1'b0;
assign ereg31_reset_mapped = 1'b0;

//==========================================================
//                 Dispatch Create signals
//==========================================================
// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst0_ereg/); @173
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_idu_rtu_pst_dis_inst0_ereg"); @174
ct_rtu_expand_32  x_ct_rtu_expand_32_idu_rtu_pst_dis_inst0_ereg (
  .x_num                             (idu_rtu_pst_dis_inst0_ereg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst0_ereg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst1_ereg/); @175
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_idu_rtu_pst_dis_inst1_ereg"); @176
ct_rtu_expand_32  x_ct_rtu_expand_32_idu_rtu_pst_dis_inst1_ereg (
  .x_num                             (idu_rtu_pst_dis_inst1_ereg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst1_ereg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst2_ereg/); @177
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_idu_rtu_pst_dis_inst2_ereg"); @178
ct_rtu_expand_32  x_ct_rtu_expand_32_idu_rtu_pst_dis_inst2_ereg (
  .x_num                             (idu_rtu_pst_dis_inst2_ereg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst2_ereg_expand)
);

// &ConnRule(s/^x_num/idu_rtu_pst_dis_inst3_ereg/); @179
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_idu_rtu_pst_dis_inst3_ereg"); @180
ct_rtu_expand_32  x_ct_rtu_expand_32_idu_rtu_pst_dis_inst3_ereg (
  .x_num                             (idu_rtu_pst_dis_inst3_ereg       ),
  .x_num_expand                      (idu_rtu_pst_dis_inst3_ereg_expand)
);


assign d0_ereg[31:0] = {32{idu_rtu_pst_dis_inst0_ereg_vld}}
                       & idu_rtu_pst_dis_inst0_ereg_expand[31:0];
assign d1_ereg[31:0] = {32{idu_rtu_pst_dis_inst1_ereg_vld}}
                       & idu_rtu_pst_dis_inst1_ereg_expand[31:0];
assign d2_ereg[31:0] = {32{idu_rtu_pst_dis_inst2_ereg_vld}}
                       & idu_rtu_pst_dis_inst2_ereg_expand[31:0];
assign d3_ereg[31:0] = {32{idu_rtu_pst_dis_inst3_ereg_vld}}
                       & idu_rtu_pst_dis_inst3_ereg_expand[31:0];

assign ereg0_create_vld[3:0]  = {d3_ereg[0], d2_ereg[0], d1_ereg[0], d0_ereg[0]};
assign ereg1_create_vld[3:0]  = {d3_ereg[1], d2_ereg[1], d1_ereg[1], d0_ereg[1]};
assign ereg2_create_vld[3:0]  = {d3_ereg[2], d2_ereg[2], d1_ereg[2], d0_ereg[2]};
assign ereg3_create_vld[3:0]  = {d3_ereg[3], d2_ereg[3], d1_ereg[3], d0_ereg[3]};
assign ereg4_create_vld[3:0]  = {d3_ereg[4], d2_ereg[4], d1_ereg[4], d0_ereg[4]};
assign ereg5_create_vld[3:0]  = {d3_ereg[5], d2_ereg[5], d1_ereg[5], d0_ereg[5]};
assign ereg6_create_vld[3:0]  = {d3_ereg[6], d2_ereg[6], d1_ereg[6], d0_ereg[6]};
assign ereg7_create_vld[3:0]  = {d3_ereg[7], d2_ereg[7], d1_ereg[7], d0_ereg[7]};
assign ereg8_create_vld[3:0]  = {d3_ereg[8], d2_ereg[8], d1_ereg[8], d0_ereg[8]};
assign ereg9_create_vld[3:0]  = {d3_ereg[9], d2_ereg[9], d1_ereg[9], d0_ereg[9]};
assign ereg10_create_vld[3:0] = {d3_ereg[10],d2_ereg[10],d1_ereg[10],d0_ereg[10]};
assign ereg11_create_vld[3:0] = {d3_ereg[11],d2_ereg[11],d1_ereg[11],d0_ereg[11]};
assign ereg12_create_vld[3:0] = {d3_ereg[12],d2_ereg[12],d1_ereg[12],d0_ereg[12]};
assign ereg13_create_vld[3:0] = {d3_ereg[13],d2_ereg[13],d1_ereg[13],d0_ereg[13]};
assign ereg14_create_vld[3:0] = {d3_ereg[14],d2_ereg[14],d1_ereg[14],d0_ereg[14]};
assign ereg15_create_vld[3:0] = {d3_ereg[15],d2_ereg[15],d1_ereg[15],d0_ereg[15]};
assign ereg16_create_vld[3:0] = {d3_ereg[16],d2_ereg[16],d1_ereg[16],d0_ereg[16]};
assign ereg17_create_vld[3:0] = {d3_ereg[17],d2_ereg[17],d1_ereg[17],d0_ereg[17]};
assign ereg18_create_vld[3:0] = {d3_ereg[18],d2_ereg[18],d1_ereg[18],d0_ereg[18]};
assign ereg19_create_vld[3:0] = {d3_ereg[19],d2_ereg[19],d1_ereg[19],d0_ereg[19]};
assign ereg20_create_vld[3:0] = {d3_ereg[20],d2_ereg[20],d1_ereg[20],d0_ereg[20]};
assign ereg21_create_vld[3:0] = {d3_ereg[21],d2_ereg[21],d1_ereg[21],d0_ereg[21]};
assign ereg22_create_vld[3:0] = {d3_ereg[22],d2_ereg[22],d1_ereg[22],d0_ereg[22]};
assign ereg23_create_vld[3:0] = {d3_ereg[23],d2_ereg[23],d1_ereg[23],d0_ereg[23]};
assign ereg24_create_vld[3:0] = {d3_ereg[24],d2_ereg[24],d1_ereg[24],d0_ereg[24]};
assign ereg25_create_vld[3:0] = {d3_ereg[25],d2_ereg[25],d1_ereg[25],d0_ereg[25]};
assign ereg26_create_vld[3:0] = {d3_ereg[26],d2_ereg[26],d1_ereg[26],d0_ereg[26]};
assign ereg27_create_vld[3:0] = {d3_ereg[27],d2_ereg[27],d1_ereg[27],d0_ereg[27]};
assign ereg28_create_vld[3:0] = {d3_ereg[28],d2_ereg[28],d1_ereg[28],d0_ereg[28]};
assign ereg29_create_vld[3:0] = {d3_ereg[29],d2_ereg[29],d1_ereg[29],d0_ereg[29]};
assign ereg30_create_vld[3:0] = {d3_ereg[30],d2_ereg[30],d1_ereg[30],d0_ereg[30]};
assign ereg31_create_vld[3:0] = {d3_ereg[31],d2_ereg[31],d1_ereg[31],d0_ereg[31]};

//==========================================================
//                    Write back signals
//==========================================================
// &ConnRule(s/^x_num/vfpu_rtu_ex5_pipe6_wb_ereg/); @227
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_vfpu_rtu_ex5_pipe6_wb_ereg"); @228
ct_rtu_expand_32  x_ct_rtu_expand_32_vfpu_rtu_ex5_pipe6_wb_ereg (
  .x_num                             (vfpu_rtu_ex5_pipe6_wb_ereg       ),
  .x_num_expand                      (vfpu_rtu_ex5_pipe6_wb_ereg_expand)
);

// &ConnRule(s/^x_num/vfpu_rtu_ex5_pipe7_wb_ereg/); @229
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_vfpu_rtu_ex5_pipe7_wb_ereg"); @230
ct_rtu_expand_32  x_ct_rtu_expand_32_vfpu_rtu_ex5_pipe7_wb_ereg (
  .x_num                             (vfpu_rtu_ex5_pipe7_wb_ereg       ),
  .x_num_expand                      (vfpu_rtu_ex5_pipe7_wb_ereg_expand)
);


assign wb_vld[31:0] =
    {32{vfpu_rtu_ex5_pipe6_ereg_wb_vld}} & vfpu_rtu_ex5_pipe6_wb_ereg_expand[31:0]
  | {32{vfpu_rtu_ex5_pipe7_ereg_wb_vld}} & vfpu_rtu_ex5_pipe7_wb_ereg_expand[31:0];

assign ereg0_wb_vld  = wb_vld[0];
assign ereg1_wb_vld  = wb_vld[1];
assign ereg2_wb_vld  = wb_vld[2];
assign ereg3_wb_vld  = wb_vld[3];
assign ereg4_wb_vld  = wb_vld[4];
assign ereg5_wb_vld  = wb_vld[5];
assign ereg6_wb_vld  = wb_vld[6];
assign ereg7_wb_vld  = wb_vld[7];
assign ereg8_wb_vld  = wb_vld[8];
assign ereg9_wb_vld  = wb_vld[9];
assign ereg10_wb_vld = wb_vld[10];
assign ereg11_wb_vld = wb_vld[11];
assign ereg12_wb_vld = wb_vld[12];
assign ereg13_wb_vld = wb_vld[13];
assign ereg14_wb_vld = wb_vld[14];
assign ereg15_wb_vld = wb_vld[15];
assign ereg16_wb_vld = wb_vld[16];
assign ereg17_wb_vld = wb_vld[17];
assign ereg18_wb_vld = wb_vld[18];
assign ereg19_wb_vld = wb_vld[19];
assign ereg20_wb_vld = wb_vld[20];
assign ereg21_wb_vld = wb_vld[21];
assign ereg22_wb_vld = wb_vld[22];
assign ereg23_wb_vld = wb_vld[23];
assign ereg24_wb_vld = wb_vld[24];
assign ereg25_wb_vld = wb_vld[25];
assign ereg26_wb_vld = wb_vld[26];
assign ereg27_wb_vld = wb_vld[27];
assign ereg28_wb_vld = wb_vld[28];
assign ereg29_wb_vld = wb_vld[29];
assign ereg30_wb_vld = wb_vld[30];
assign ereg31_wb_vld = wb_vld[31];

//==========================================================
//                     Release signals
//==========================================================
assign release_vld[31:0] =
           ereg0_rel_ereg_expand[31:0]
         | ereg1_rel_ereg_expand[31:0]
         | ereg2_rel_ereg_expand[31:0]
         | ereg3_rel_ereg_expand[31:0]
         | ereg4_rel_ereg_expand[31:0]
         | ereg5_rel_ereg_expand[31:0]
         | ereg6_rel_ereg_expand[31:0]
         | ereg7_rel_ereg_expand[31:0]
         | ereg8_rel_ereg_expand[31:0]
         | ereg9_rel_ereg_expand[31:0]
         | ereg10_rel_ereg_expand[31:0]
         | ereg11_rel_ereg_expand[31:0]
         | ereg12_rel_ereg_expand[31:0]
         | ereg13_rel_ereg_expand[31:0]
         | ereg14_rel_ereg_expand[31:0]
         | ereg15_rel_ereg_expand[31:0]
         | ereg16_rel_ereg_expand[31:0]
         | ereg17_rel_ereg_expand[31:0]
         | ereg18_rel_ereg_expand[31:0]
         | ereg19_rel_ereg_expand[31:0]
         | ereg20_rel_ereg_expand[31:0]
         | ereg21_rel_ereg_expand[31:0]
         | ereg22_rel_ereg_expand[31:0]
         | ereg23_rel_ereg_expand[31:0]
         | ereg24_rel_ereg_expand[31:0]
         | ereg25_rel_ereg_expand[31:0]
         | ereg26_rel_ereg_expand[31:0]
         | ereg27_rel_ereg_expand[31:0]
         | ereg28_rel_ereg_expand[31:0]
         | ereg29_rel_ereg_expand[31:0]
         | ereg30_rel_ereg_expand[31:0]
         | ereg31_rel_ereg_expand[31:0];

assign ereg0_release_vld  = release_vld[0];
assign ereg1_release_vld  = release_vld[1];
assign ereg2_release_vld  = release_vld[2];
assign ereg3_release_vld  = release_vld[3];
assign ereg4_release_vld  = release_vld[4];
assign ereg5_release_vld  = release_vld[5];
assign ereg6_release_vld  = release_vld[6];
assign ereg7_release_vld  = release_vld[7];
assign ereg8_release_vld  = release_vld[8];
assign ereg9_release_vld  = release_vld[9];
assign ereg10_release_vld = release_vld[10];
assign ereg11_release_vld = release_vld[11];
assign ereg12_release_vld = release_vld[12];
assign ereg13_release_vld = release_vld[13];
assign ereg14_release_vld = release_vld[14];
assign ereg15_release_vld = release_vld[15];
assign ereg16_release_vld = release_vld[16];
assign ereg17_release_vld = release_vld[17];
assign ereg18_release_vld = release_vld[18];
assign ereg19_release_vld = release_vld[19];
assign ereg20_release_vld = release_vld[20];
assign ereg21_release_vld = release_vld[21];
assign ereg22_release_vld = release_vld[22];
assign ereg23_release_vld = release_vld[23];
assign ereg24_release_vld = release_vld[24];
assign ereg25_release_vld = release_vld[25];
assign ereg26_release_vld = release_vld[26];
assign ereg27_release_vld = release_vld[27];
assign ereg28_release_vld = release_vld[28];
assign ereg29_release_vld = release_vld[29];
assign ereg30_release_vld = release_vld[30];
assign ereg31_release_vld = release_vld[31];

//==========================================================
//               Alloc and Release signals
//==========================================================
//for gateclk
assign alloc_release[0]  = ereg0_cur_state_alloc_release;
assign alloc_release[1]  = ereg1_cur_state_alloc_release;
assign alloc_release[2]  = ereg2_cur_state_alloc_release;
assign alloc_release[3]  = ereg3_cur_state_alloc_release;
assign alloc_release[4]  = ereg4_cur_state_alloc_release;
assign alloc_release[5]  = ereg5_cur_state_alloc_release;
assign alloc_release[6]  = ereg6_cur_state_alloc_release;
assign alloc_release[7]  = ereg7_cur_state_alloc_release;
assign alloc_release[8]  = ereg8_cur_state_alloc_release;
assign alloc_release[9]  = ereg9_cur_state_alloc_release;
assign alloc_release[10] = ereg10_cur_state_alloc_release;
assign alloc_release[11] = ereg11_cur_state_alloc_release;
assign alloc_release[12] = ereg12_cur_state_alloc_release;
assign alloc_release[13] = ereg13_cur_state_alloc_release;
assign alloc_release[14] = ereg14_cur_state_alloc_release;
assign alloc_release[15] = ereg15_cur_state_alloc_release;
assign alloc_release[16] = ereg16_cur_state_alloc_release;
assign alloc_release[17] = ereg17_cur_state_alloc_release;
assign alloc_release[18] = ereg18_cur_state_alloc_release;
assign alloc_release[19] = ereg19_cur_state_alloc_release;
assign alloc_release[20] = ereg20_cur_state_alloc_release;
assign alloc_release[21] = ereg21_cur_state_alloc_release;
assign alloc_release[22] = ereg22_cur_state_alloc_release;
assign alloc_release[23] = ereg23_cur_state_alloc_release;
assign alloc_release[24] = ereg24_cur_state_alloc_release;
assign alloc_release[25] = ereg25_cur_state_alloc_release;
assign alloc_release[26] = ereg26_cur_state_alloc_release;
assign alloc_release[27] = ereg27_cur_state_alloc_release;
assign alloc_release[28] = ereg28_cur_state_alloc_release;
assign alloc_release[29] = ereg29_cur_state_alloc_release;
assign alloc_release[30] = ereg30_cur_state_alloc_release;
assign alloc_release[31] = ereg31_cur_state_alloc_release;

assign ereg_alloc_release = |alloc_release[31:0];

//==========================================================
//                     Dealloc signals
//==========================================================
//----------------------------------------------------------
//                calculate dealloc vector
//----------------------------------------------------------
//get all entry dealloc bits
assign dealloc[0]  = ereg0_cur_state_dealloc;
assign dealloc[1]  = ereg1_cur_state_dealloc;
assign dealloc[2]  = ereg2_cur_state_dealloc;
assign dealloc[3]  = ereg3_cur_state_dealloc;
assign dealloc[4]  = ereg4_cur_state_dealloc;
assign dealloc[5]  = ereg5_cur_state_dealloc;
assign dealloc[6]  = ereg6_cur_state_dealloc;
assign dealloc[7]  = ereg7_cur_state_dealloc;
assign dealloc[8]  = ereg8_cur_state_dealloc;
assign dealloc[9]  = ereg9_cur_state_dealloc;
assign dealloc[10] = ereg10_cur_state_dealloc;
assign dealloc[11] = ereg11_cur_state_dealloc;
assign dealloc[12] = ereg12_cur_state_dealloc;
assign dealloc[13] = ereg13_cur_state_dealloc;
assign dealloc[14] = ereg14_cur_state_dealloc;
assign dealloc[15] = ereg15_cur_state_dealloc;
assign dealloc[16] = ereg16_cur_state_dealloc;
assign dealloc[17] = ereg17_cur_state_dealloc;
assign dealloc[18] = ereg18_cur_state_dealloc;
assign dealloc[19] = ereg19_cur_state_dealloc;
assign dealloc[20] = ereg20_cur_state_dealloc;
assign dealloc[21] = ereg21_cur_state_dealloc;
assign dealloc[22] = ereg22_cur_state_dealloc;
assign dealloc[23] = ereg23_cur_state_dealloc;
assign dealloc[24] = ereg24_cur_state_dealloc;
assign dealloc[25] = ereg25_cur_state_dealloc;
assign dealloc[26] = ereg26_cur_state_dealloc;
assign dealloc[27] = ereg27_cur_state_dealloc;
assign dealloc[28] = ereg28_cur_state_dealloc;
assign dealloc[29] = ereg29_cur_state_dealloc;
assign dealloc[30] = ereg30_cur_state_dealloc;
assign dealloc[31] = ereg31_cur_state_dealloc;

//one-hot dealloc ereg 0,
//search priority is from p0 to p31
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

//one-hot dealloc ereg 1,
//search priority is from p31 to p0
assign dealloc1[0]  = dealloc[0]  && !(|dealloc[31:1]);
assign dealloc1[1]  = dealloc[1]  && !(|dealloc[31:2]);
assign dealloc1[2]  = dealloc[2]  && !(|dealloc[31:3]);
assign dealloc1[3]  = dealloc[3]  && !(|dealloc[31:4]);
assign dealloc1[4]  = dealloc[4]  && !(|dealloc[31:5]);
assign dealloc1[5]  = dealloc[5]  && !(|dealloc[31:6]);
assign dealloc1[6]  = dealloc[6]  && !(|dealloc[31:7]);
assign dealloc1[7]  = dealloc[7]  && !(|dealloc[31:8]);
assign dealloc1[8]  = dealloc[8]  && !(|dealloc[31:9]);
assign dealloc1[9]  = dealloc[9]  && !(|dealloc[31:10]);
assign dealloc1[10] = dealloc[10] && !(|dealloc[31:11]);
assign dealloc1[11] = dealloc[11] && !(|dealloc[31:12]);
assign dealloc1[12] = dealloc[12] && !(|dealloc[31:13]);
assign dealloc1[13] = dealloc[13] && !(|dealloc[31:14]);
assign dealloc1[14] = dealloc[14] && !(|dealloc[31:15]);
assign dealloc1[15] = dealloc[15] && !(|dealloc[31:16]);
assign dealloc1[16] = dealloc[16] && !(|dealloc[31:17]);
assign dealloc1[17] = dealloc[17] && !(|dealloc[31:18]);
assign dealloc1[18] = dealloc[18] && !(|dealloc[31:19]);
assign dealloc1[19] = dealloc[19] && !(|dealloc[31:20]);
assign dealloc1[20] = dealloc[20] && !(|dealloc[31:21]);
assign dealloc1[21] = dealloc[21] && !(|dealloc[31:22]);
assign dealloc1[22] = dealloc[22] && !(|dealloc[31:23]);
assign dealloc1[23] = dealloc[23] && !(|dealloc[31:24]);
assign dealloc1[24] = dealloc[24] && !(|dealloc[31:25]);
assign dealloc1[25] = dealloc[25] && !(|dealloc[31:26]);
assign dealloc1[26] = dealloc[26] && !(|dealloc[31:27]);
assign dealloc1[27] = dealloc[27] && !(|dealloc[31:28]);
assign dealloc1[28] = dealloc[28] && !(|dealloc[31:29]);
assign dealloc1[29] = dealloc[29] && !(|dealloc[31:30]);
assign dealloc1[30] = dealloc[30] && !dealloc[31];
assign dealloc1[31] = dealloc[31];

//one-hot dealloc ereg 2,
//remove dealloc ereg 0, and then search priority is from p0 to p31
assign dealloc_no_0[31:0] = dealloc[31:0] & ~dealloc0[31:0];

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

//one-hot dealloc ereg 3,
//remove dealloc ereg 1, and then search priority is from p31 to p0
assign dealloc_no_1[31:0] = dealloc[31:0] & ~dealloc1[31:0];

assign dealloc3[0]  = dealloc_no_1[0]  && !(|dealloc_no_1[31:1]);
assign dealloc3[1]  = dealloc_no_1[1]  && !(|dealloc_no_1[31:2]);
assign dealloc3[2]  = dealloc_no_1[2]  && !(|dealloc_no_1[31:3]);
assign dealloc3[3]  = dealloc_no_1[3]  && !(|dealloc_no_1[31:4]);
assign dealloc3[4]  = dealloc_no_1[4]  && !(|dealloc_no_1[31:5]);
assign dealloc3[5]  = dealloc_no_1[5]  && !(|dealloc_no_1[31:6]);
assign dealloc3[6]  = dealloc_no_1[6]  && !(|dealloc_no_1[31:7]);
assign dealloc3[7]  = dealloc_no_1[7]  && !(|dealloc_no_1[31:8]);
assign dealloc3[8]  = dealloc_no_1[8]  && !(|dealloc_no_1[31:9]);
assign dealloc3[9]  = dealloc_no_1[9]  && !(|dealloc_no_1[31:10]);
assign dealloc3[10] = dealloc_no_1[10] && !(|dealloc_no_1[31:11]);
assign dealloc3[11] = dealloc_no_1[11] && !(|dealloc_no_1[31:12]);
assign dealloc3[12] = dealloc_no_1[12] && !(|dealloc_no_1[31:13]);
assign dealloc3[13] = dealloc_no_1[13] && !(|dealloc_no_1[31:14]);
assign dealloc3[14] = dealloc_no_1[14] && !(|dealloc_no_1[31:15]);
assign dealloc3[15] = dealloc_no_1[15] && !(|dealloc_no_1[31:16]);
assign dealloc3[16] = dealloc_no_1[16] && !(|dealloc_no_1[31:17]);
assign dealloc3[17] = dealloc_no_1[17] && !(|dealloc_no_1[31:18]);
assign dealloc3[18] = dealloc_no_1[18] && !(|dealloc_no_1[31:19]);
assign dealloc3[19] = dealloc_no_1[19] && !(|dealloc_no_1[31:20]);
assign dealloc3[20] = dealloc_no_1[20] && !(|dealloc_no_1[31:21]);
assign dealloc3[21] = dealloc_no_1[21] && !(|dealloc_no_1[31:22]);
assign dealloc3[22] = dealloc_no_1[22] && !(|dealloc_no_1[31:23]);
assign dealloc3[23] = dealloc_no_1[23] && !(|dealloc_no_1[31:24]);
assign dealloc3[24] = dealloc_no_1[24] && !(|dealloc_no_1[31:25]);
assign dealloc3[25] = dealloc_no_1[25] && !(|dealloc_no_1[31:26]);
assign dealloc3[26] = dealloc_no_1[26] && !(|dealloc_no_1[31:27]);
assign dealloc3[27] = dealloc_no_1[27] && !(|dealloc_no_1[31:28]);
assign dealloc3[28] = dealloc_no_1[28] && !(|dealloc_no_1[31:29]);
assign dealloc3[29] = dealloc_no_1[29] && !(|dealloc_no_1[31:30]);
assign dealloc3[30] = dealloc_no_1[30] && !dealloc_no_1[31];
assign dealloc3[31] = dealloc_no_1[31];

//----------------------------------------------------------
//                deallocate ereg and valid
//----------------------------------------------------------
//deallocate ereg valid
assign dealloc_ereg0_vld = |dealloc[31:0];
assign dealloc_ereg1_vld = |dealloc_no_0[31:0];
assign dealloc_ereg2_vld = |(dealloc[31:0]
                             & ~dealloc0[31:0]
                             & ~dealloc1[31:0]);
assign dealloc_ereg3_vld = |(dealloc[31:0]
                             & ~dealloc0[31:0]
                             & ~dealloc1[31:0]
                             & ~dealloc2[31:0]);
//dealloc_ereg0/1/2/3
assign dealloc_ereg0_expand[31:0] = dealloc0[31:0];
assign dealloc_ereg1_expand[31:0] = dealloc1[31:0];
assign dealloc_ereg2_expand[31:0] = dealloc2[31:0];
assign dealloc_ereg3_expand[31:0] = dealloc3[31:0];

// &ConnRule(s/^x_num/dealloc_ereg0/); @581
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_dealloc_ereg0"); @582
ct_rtu_encode_32  x_ct_rtu_encode_32_dealloc_ereg0 (
  .x_num                (dealloc_ereg0       ),
  .x_num_expand         (dealloc_ereg0_expand)
);

// &ConnRule(s/^x_num/dealloc_ereg1/); @583
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_dealloc_ereg1"); @584
ct_rtu_encode_32  x_ct_rtu_encode_32_dealloc_ereg1 (
  .x_num                (dealloc_ereg1       ),
  .x_num_expand         (dealloc_ereg1_expand)
);

// &ConnRule(s/^x_num/dealloc_ereg2/); @585
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_dealloc_ereg2"); @586
ct_rtu_encode_32  x_ct_rtu_encode_32_dealloc_ereg2 (
  .x_num                (dealloc_ereg2       ),
  .x_num_expand         (dealloc_ereg2_expand)
);

// &ConnRule(s/^x_num/dealloc_ereg3/); @587
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_dealloc_ereg3"); @588
ct_rtu_encode_32  x_ct_rtu_encode_32_dealloc_ereg3 (
  .x_num                (dealloc_ereg3       ),
  .x_num_expand         (dealloc_ereg3_expand)
);


//----------------------------------------------------------
//                   deallocate signals
//----------------------------------------------------------
//deallocate vector without redundancy:
//if dealloc ereg is same as others, the vector is all 0
assign dealloc0_vec[31:0] = dealloc0[31:0];
assign dealloc1_vec[31:0] = dealloc1[31:0] & ~dealloc0[31:0];
assign dealloc2_vec[31:0] = dealloc2[31:0] & ~dealloc1[31:0];
assign dealloc3_vec[31:0] = dealloc3[31:0] & ~dealloc2[31:0] & ~dealloc0[31:0];

//alloc ereg 0/1/2/3 will be allocated to ir inst 0/1/2/3
assign alloc_ereg0_invalid = (!alloc_ereg0_vld
                              || idu_rtu_ir_ereg0_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_ereg1_invalid = (!alloc_ereg1_vld
                              || idu_rtu_ir_ereg1_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_ereg2_invalid = (!alloc_ereg2_vld
                              || idu_rtu_ir_ereg2_alloc_vld)
                             && !ifu_xx_sync_reset;
assign alloc_ereg3_invalid = (!alloc_ereg3_vld
                              || idu_rtu_ir_ereg3_alloc_vld)
                             && !ifu_xx_sync_reset;

assign dealloc_vld[31:0] = {32{alloc_ereg0_invalid}} & dealloc0_vec[31:0]
                         | {32{alloc_ereg1_invalid}} & dealloc1_vec[31:0]
                         | {32{alloc_ereg2_invalid}} & dealloc2_vec[31:0]
                         | {32{alloc_ereg3_invalid}} & dealloc3_vec[31:0];

assign dealloc_vld_for_gateclk = !alloc_ereg0_vld
                              || !alloc_ereg1_vld
                              || !alloc_ereg2_vld
                              || !alloc_ereg3_vld
                              || idu_rtu_ir_ereg_alloc_gateclk_vld;

//assign dealloc_gateclk_vld[31:0] = {32{dealloc_vld_for_gateclk}}
//                                   & (dealloc0[31:0]
//                                    | dealloc1[31:0]
//                                    | dealloc2[31:0]
//                                    | dealloc3[31:0]);

assign ereg0_dealloc_vld  = dealloc_vld[0];
assign ereg1_dealloc_vld  = dealloc_vld[1];
assign ereg2_dealloc_vld  = dealloc_vld[2];
assign ereg3_dealloc_vld  = dealloc_vld[3];
assign ereg4_dealloc_vld  = dealloc_vld[4];
assign ereg5_dealloc_vld  = dealloc_vld[5];
assign ereg6_dealloc_vld  = dealloc_vld[6];
assign ereg7_dealloc_vld  = dealloc_vld[7];
assign ereg8_dealloc_vld  = dealloc_vld[8];
assign ereg9_dealloc_vld  = dealloc_vld[9];
assign ereg10_dealloc_vld = dealloc_vld[10];
assign ereg11_dealloc_vld = dealloc_vld[11];
assign ereg12_dealloc_vld = dealloc_vld[12];
assign ereg13_dealloc_vld = dealloc_vld[13];
assign ereg14_dealloc_vld = dealloc_vld[14];
assign ereg15_dealloc_vld = dealloc_vld[15];
assign ereg16_dealloc_vld = dealloc_vld[16];
assign ereg17_dealloc_vld = dealloc_vld[17];
assign ereg18_dealloc_vld = dealloc_vld[18];
assign ereg19_dealloc_vld = dealloc_vld[19];
assign ereg20_dealloc_vld = dealloc_vld[20];
assign ereg21_dealloc_vld = dealloc_vld[21];
assign ereg22_dealloc_vld = dealloc_vld[22];
assign ereg23_dealloc_vld = dealloc_vld[23];
assign ereg24_dealloc_vld = dealloc_vld[24];
assign ereg25_dealloc_vld = dealloc_vld[25];
assign ereg26_dealloc_vld = dealloc_vld[26];
assign ereg27_dealloc_vld = dealloc_vld[27];
assign ereg28_dealloc_vld = dealloc_vld[28];
assign ereg29_dealloc_vld = dealloc_vld[29];
assign ereg30_dealloc_vld = dealloc_vld[30];
assign ereg31_dealloc_vld = dealloc_vld[31];

//assign ereg0_dealloc_gateclk_vld  = dealloc_gateclk_vld[0];
//assign ereg1_dealloc_gateclk_vld  = dealloc_gateclk_vld[1];
//assign ereg2_dealloc_gateclk_vld  = dealloc_gateclk_vld[2];
//assign ereg3_dealloc_gateclk_vld  = dealloc_gateclk_vld[3];
//assign ereg4_dealloc_gateclk_vld  = dealloc_gateclk_vld[4];
//assign ereg5_dealloc_gateclk_vld  = dealloc_gateclk_vld[5];
//assign ereg6_dealloc_gateclk_vld  = dealloc_gateclk_vld[6];
//assign ereg7_dealloc_gateclk_vld  = dealloc_gateclk_vld[7];
//assign ereg8_dealloc_gateclk_vld  = dealloc_gateclk_vld[8];
//assign ereg9_dealloc_gateclk_vld  = dealloc_gateclk_vld[9];
//assign ereg10_dealloc_gateclk_vld = dealloc_gateclk_vld[10];
//assign ereg11_dealloc_gateclk_vld = dealloc_gateclk_vld[11];
//assign ereg12_dealloc_gateclk_vld = dealloc_gateclk_vld[12];
//assign ereg13_dealloc_gateclk_vld = dealloc_gateclk_vld[13];
//assign ereg14_dealloc_gateclk_vld = dealloc_gateclk_vld[14];
//assign ereg15_dealloc_gateclk_vld = dealloc_gateclk_vld[15];
//assign ereg16_dealloc_gateclk_vld = dealloc_gateclk_vld[16];
//assign ereg17_dealloc_gateclk_vld = dealloc_gateclk_vld[17];
//assign ereg18_dealloc_gateclk_vld = dealloc_gateclk_vld[18];
//assign ereg19_dealloc_gateclk_vld = dealloc_gateclk_vld[19];
//assign ereg20_dealloc_gateclk_vld = dealloc_gateclk_vld[20];
//assign ereg21_dealloc_gateclk_vld = dealloc_gateclk_vld[21];
//assign ereg22_dealloc_gateclk_vld = dealloc_gateclk_vld[22];
//assign ereg23_dealloc_gateclk_vld = dealloc_gateclk_vld[23];
//assign ereg24_dealloc_gateclk_vld = dealloc_gateclk_vld[24];
//assign ereg25_dealloc_gateclk_vld = dealloc_gateclk_vld[25];
//assign ereg26_dealloc_gateclk_vld = dealloc_gateclk_vld[26];
//assign ereg27_dealloc_gateclk_vld = dealloc_gateclk_vld[27];
//assign ereg28_dealloc_gateclk_vld = dealloc_gateclk_vld[28];
//assign ereg29_dealloc_gateclk_vld = dealloc_gateclk_vld[29];
//assign ereg30_dealloc_gateclk_vld = dealloc_gateclk_vld[30];
//assign ereg31_dealloc_gateclk_vld = dealloc_gateclk_vld[31];

//==========================================================
//                  Allocate Freg Registers
//==========================================================

//----------------------------------------------------------
//                  Instance of Gated Cell
//----------------------------------------------------------
assign alloc_ereg_clk_en = rtu_yy_xx_flush
                        || !alloc_ereg0_vld
                        || !alloc_ereg1_vld
                        || !alloc_ereg2_vld
                        || !alloc_ereg3_vld
                        || idu_rtu_ir_ereg0_alloc_vld
                        || idu_rtu_ir_ereg1_alloc_vld
                        || idu_rtu_ir_ereg2_alloc_vld
                        || idu_rtu_ir_ereg3_alloc_vld;
// &Instance("gated_clk_cell", "x_alloc_ereg_gated_clk"); @713
gated_clk_cell  x_alloc_ereg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (alloc_ereg_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (alloc_ereg_clk_en ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @714
//          .external_en (1'b0), @715
//          .global_en   (cp0_yy_clk_en), @716
//          .module_en   (cp0_rtu_icg_en), @717
//          .local_en    (alloc_ereg_clk_en), @718
//          .clk_out     (alloc_ereg_clk)); @719

//----------------------------------------------------------
//                Instance of alloc registers
//----------------------------------------------------------
always @(posedge alloc_ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_ereg0_vld  <= 1'd0;
    alloc_ereg0[4:0] <= 5'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_ereg0_vld  <= 1'd0;
    alloc_ereg0[4:0] <= 5'd0;
  end
  else if(alloc_ereg0_invalid) begin
    alloc_ereg0_vld  <= dealloc_ereg0_vld;
    alloc_ereg0[4:0] <= dealloc_ereg0[4:0];
  end
  else begin
    alloc_ereg0_vld  <= alloc_ereg0_vld;
    alloc_ereg0[4:0] <= alloc_ereg0[4:0];
  end
end

always @(posedge alloc_ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_ereg1_vld  <= 1'd0;
    alloc_ereg1[4:0] <= 5'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_ereg1_vld  <= 1'd0;
    alloc_ereg1[4:0] <= 5'd0;
  end
  else if(alloc_ereg1_invalid) begin
    alloc_ereg1_vld  <= dealloc_ereg1_vld;
    alloc_ereg1[4:0] <= dealloc_ereg1[4:0];
  end
  else begin
    alloc_ereg1_vld  <= alloc_ereg1_vld;
    alloc_ereg1[4:0] <= alloc_ereg1[4:0];
  end
end

always @(posedge alloc_ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_ereg2_vld  <= 1'd0;
    alloc_ereg2[4:0] <= 5'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_ereg2_vld  <= 1'd0;
    alloc_ereg2[4:0] <= 5'd0;
  end
  else if(alloc_ereg2_invalid) begin
    alloc_ereg2_vld  <= dealloc_ereg2_vld;
    alloc_ereg2[4:0] <= dealloc_ereg2[4:0];
  end
  else begin
    alloc_ereg2_vld  <= alloc_ereg2_vld;
    alloc_ereg2[4:0] <= alloc_ereg2[4:0];
  end
end

always @(posedge alloc_ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alloc_ereg3_vld  <= 1'd0;
    alloc_ereg3[4:0] <= 5'd0;
  end
  else if(rtu_yy_xx_flush) begin
    alloc_ereg3_vld  <= 1'd0;
    alloc_ereg3[4:0] <= 5'd0;
  end
  else if(alloc_ereg3_invalid) begin
    alloc_ereg3_vld  <= dealloc_ereg3_vld;
    alloc_ereg3[4:0] <= dealloc_ereg3[4:0];
  end
  else begin
    alloc_ereg3_vld  <= alloc_ereg3_vld;
    alloc_ereg3[4:0] <= alloc_ereg3[4:0];
  end
end

//rename for output
//alloc ereg 0/1/2/3 will be allocated to ir inst 0/1/2/3
assign rtu_idu_alloc_ereg0_vld  = alloc_ereg0_vld;
assign rtu_idu_alloc_ereg1_vld  = alloc_ereg1_vld;
assign rtu_idu_alloc_ereg2_vld  = alloc_ereg2_vld;
assign rtu_idu_alloc_ereg3_vld  = alloc_ereg3_vld;
assign rtu_idu_alloc_ereg0[4:0] = alloc_ereg0[4:0];
assign rtu_idu_alloc_ereg1[4:0] = alloc_ereg1[4:0];
assign rtu_idu_alloc_ereg2[4:0] = alloc_ereg2[4:0];
assign rtu_idu_alloc_ereg3[4:0] = alloc_ereg3[4:0];

//==========================================================
//          Fast Retired Instruction Write Back
//==========================================================
assign pst_retired_ereg_wb      = &retired_released_wb[31:0];

assign retired_released_wb[0]  = ereg0_retired_released_wb;
assign retired_released_wb[1]  = ereg1_retired_released_wb;
assign retired_released_wb[2]  = ereg2_retired_released_wb;
assign retired_released_wb[3]  = ereg3_retired_released_wb;
assign retired_released_wb[4]  = ereg4_retired_released_wb;
assign retired_released_wb[5]  = ereg5_retired_released_wb;
assign retired_released_wb[6]  = ereg6_retired_released_wb;
assign retired_released_wb[7]  = ereg7_retired_released_wb;
assign retired_released_wb[8]  = ereg8_retired_released_wb;
assign retired_released_wb[9]  = ereg9_retired_released_wb;
assign retired_released_wb[10] = ereg10_retired_released_wb;
assign retired_released_wb[11] = ereg11_retired_released_wb;
assign retired_released_wb[12] = ereg12_retired_released_wb;
assign retired_released_wb[13] = ereg13_retired_released_wb;
assign retired_released_wb[14] = ereg14_retired_released_wb;
assign retired_released_wb[15] = ereg15_retired_released_wb;
assign retired_released_wb[16] = ereg16_retired_released_wb;
assign retired_released_wb[17] = ereg17_retired_released_wb;
assign retired_released_wb[18] = ereg18_retired_released_wb;
assign retired_released_wb[19] = ereg19_retired_released_wb;
assign retired_released_wb[20] = ereg20_retired_released_wb;
assign retired_released_wb[21] = ereg21_retired_released_wb;
assign retired_released_wb[22] = ereg22_retired_released_wb;
assign retired_released_wb[23] = ereg23_retired_released_wb;
assign retired_released_wb[24] = ereg24_retired_released_wb;
assign retired_released_wb[25] = ereg25_retired_released_wb;
assign retired_released_wb[26] = ereg26_retired_released_wb;
assign retired_released_wb[27] = ereg27_retired_released_wb;
assign retired_released_wb[28] = ereg28_retired_released_wb;
assign retired_released_wb[29] = ereg29_retired_released_wb;
assign retired_released_wb[30] = ereg30_retired_released_wb;
assign retired_released_wb[31] = ereg31_retired_released_wb;

assign rtu_idu_pst_ereg_retired_released_wb[31:0] = retired_released_wb_for_acc[31:0];

assign retired_released_wb_for_acc[0]  = ereg0_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[1]  = ereg1_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[2]  = ereg2_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[3]  = ereg3_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[4]  = ereg4_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[5]  = ereg5_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[6]  = ereg6_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[7]  = ereg7_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[8]  = ereg8_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[9]  = ereg9_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[10] = ereg10_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[11] = ereg11_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[12] = ereg12_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[13] = ereg13_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[14] = ereg14_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[15] = ereg15_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[16] = ereg16_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[17] = ereg17_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[18] = ereg18_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[19] = ereg19_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[20] = ereg20_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[21] = ereg21_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[22] = ereg22_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[23] = ereg23_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[24] = ereg24_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[25] = ereg25_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[26] = ereg26_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[27] = ereg27_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[28] = ereg28_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[29] = ereg29_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[30] = ereg30_retired_released_wb_for_acc;
assign retired_released_wb_for_acc[31] = ereg31_retired_released_wb_for_acc;

//==========================================================
//                  Recovery Rename Table
//==========================================================
assign rtu_idu_rt_recover_ereg_expand[0]  = ereg0_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[1]  = ereg1_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[2]  = ereg2_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[3]  = ereg3_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[4]  = ereg4_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[5]  = ereg5_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[6]  = ereg6_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[7]  = ereg7_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[8]  = ereg8_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[9]  = ereg9_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[10] = ereg10_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[11] = ereg11_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[12] = ereg12_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[13] = ereg13_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[14] = ereg14_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[15] = ereg15_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[16] = ereg16_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[17] = ereg17_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[18] = ereg18_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[19] = ereg19_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[20] = ereg20_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[21] = ereg21_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[22] = ereg22_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[23] = ereg23_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[24] = ereg24_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[25] = ereg25_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[26] = ereg26_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[27] = ereg27_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[28] = ereg28_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[29] = ereg29_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[30] = ereg30_cur_state_retire;
assign rtu_idu_rt_recover_ereg_expand[31] = ereg31_cur_state_retire;

// &ConnRule(s/^x_num/rtu_idu_rt_recover_ereg/); @924
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_rtu_idu_rt_recover_ereg"); @925
ct_rtu_encode_32  x_ct_rtu_encode_32_rtu_idu_rt_recover_ereg (
  .x_num                          (rtu_idu_rt_recover_ereg       ),
  .x_num_expand                   (rtu_idu_rt_recover_ereg_expand)
);


// &ModuleEnd; @927
endmodule


