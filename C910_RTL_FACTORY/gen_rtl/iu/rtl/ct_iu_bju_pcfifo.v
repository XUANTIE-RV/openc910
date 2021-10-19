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

// &ModuleBeg; @30
module ct_iu_bju_pcfifo(
  bju_pcfifo_ex2_bht_mispred,
  bju_pcfifo_ex2_bht_pred,
  bju_pcfifo_ex2_condbr,
  bju_pcfifo_ex2_inst_vld,
  bju_pcfifo_ex2_jmp,
  bju_pcfifo_ex2_length,
  bju_pcfifo_ex2_pc,
  bju_pcfifo_ex2_pcall,
  bju_pcfifo_ex2_pid,
  bju_pcfifo_ex2_pid_expand,
  bju_pcfifo_ex2_pret,
  bju_pcfifo_ex3_bht_mispred,
  bju_pcfifo_ex3_bht_pred,
  bju_pcfifo_ex3_condbr,
  bju_pcfifo_ex3_inst_vld,
  bju_pcfifo_ex3_jmp,
  bju_pcfifo_ex3_length,
  bju_pcfifo_ex3_pc,
  bju_pcfifo_ex3_pcall,
  bju_pcfifo_ex3_pid,
  bju_pcfifo_ex3_pret,
  bju_special_pc,
  bju_top_pcfifo_full,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_iu_is_pcfifo_inst_num,
  idu_iu_is_pcfifo_inst_vld,
  idu_iu_rf_pipe0_pid,
  idu_iu_rf_pipe2_pid,
  ifu_iu_pcfifo_create0_bht_pred,
  ifu_iu_pcfifo_create0_chk_idx,
  ifu_iu_pcfifo_create0_cur_pc,
  ifu_iu_pcfifo_create0_dst_vld,
  ifu_iu_pcfifo_create0_en,
  ifu_iu_pcfifo_create0_gateclk_en,
  ifu_iu_pcfifo_create0_jal,
  ifu_iu_pcfifo_create0_jalr,
  ifu_iu_pcfifo_create0_jmp_mispred,
  ifu_iu_pcfifo_create0_tar_pc,
  ifu_iu_pcfifo_create1_bht_pred,
  ifu_iu_pcfifo_create1_chk_idx,
  ifu_iu_pcfifo_create1_cur_pc,
  ifu_iu_pcfifo_create1_dst_vld,
  ifu_iu_pcfifo_create1_en,
  ifu_iu_pcfifo_create1_gateclk_en,
  ifu_iu_pcfifo_create1_jal,
  ifu_iu_pcfifo_create1_jalr,
  ifu_iu_pcfifo_create1_jmp_mispred,
  ifu_iu_pcfifo_create1_tar_pc,
  iu_idu_pcfifo_dis_inst0_pid,
  iu_idu_pcfifo_dis_inst1_pid,
  iu_idu_pcfifo_dis_inst2_pid,
  iu_idu_pcfifo_dis_inst3_pid,
  iu_ifu_pcfifo_full,
  iu_rtu_pcfifo_pop0_data,
  iu_rtu_pcfifo_pop1_data,
  iu_rtu_pcfifo_pop2_data,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  pcfifo_bju_bht_pred,
  pcfifo_bju_chk_idx,
  pcfifo_bju_jmp_mispred,
  pcfifo_bju_pc,
  rtu_iu_flush_fe,
  rtu_iu_rob_read0_pcfifo_vld,
  rtu_iu_rob_read1_pcfifo_vld,
  rtu_iu_rob_read2_pcfifo_vld,
  rtu_iu_rob_read_pcfifo_gateclk_vld,
  rtu_yy_xx_flush
);

// &Ports; @31
input            bju_pcfifo_ex2_bht_mispred;             
input            bju_pcfifo_ex2_bht_pred;                
input            bju_pcfifo_ex2_condbr;                  
input            bju_pcfifo_ex2_inst_vld;                
input            bju_pcfifo_ex2_jmp;                     
input            bju_pcfifo_ex2_length;                  
input   [39 :0]  bju_pcfifo_ex2_pc;                      
input            bju_pcfifo_ex2_pcall;                   
input   [4  :0]  bju_pcfifo_ex2_pid;                     
input   [31 :0]  bju_pcfifo_ex2_pid_expand;              
input            bju_pcfifo_ex2_pret;                    
input            bju_pcfifo_ex3_bht_mispred;             
input            bju_pcfifo_ex3_bht_pred;                
input            bju_pcfifo_ex3_condbr;                  
input            bju_pcfifo_ex3_inst_vld;                
input            bju_pcfifo_ex3_jmp;                     
input            bju_pcfifo_ex3_length;                  
input   [39 :0]  bju_pcfifo_ex3_pc;                      
input            bju_pcfifo_ex3_pcall;                   
input   [4  :0]  bju_pcfifo_ex3_pid;                     
input            bju_pcfifo_ex3_pret;                    
input            cp0_iu_icg_en;                          
input            cp0_yy_clk_en;                          
input            cpurst_b;                               
input            forever_cpuclk;                         
input   [2  :0]  idu_iu_is_pcfifo_inst_num;              
input            idu_iu_is_pcfifo_inst_vld;              
input   [4  :0]  idu_iu_rf_pipe0_pid;                    
input   [4  :0]  idu_iu_rf_pipe2_pid;                    
input            ifu_iu_pcfifo_create0_bht_pred;         
input   [24 :0]  ifu_iu_pcfifo_create0_chk_idx;          
input   [39 :0]  ifu_iu_pcfifo_create0_cur_pc;           
input            ifu_iu_pcfifo_create0_dst_vld;          
input            ifu_iu_pcfifo_create0_en;               
input            ifu_iu_pcfifo_create0_gateclk_en;       
input            ifu_iu_pcfifo_create0_jal;              
input            ifu_iu_pcfifo_create0_jalr;             
input            ifu_iu_pcfifo_create0_jmp_mispred;      
input   [39 :0]  ifu_iu_pcfifo_create0_tar_pc;           
input            ifu_iu_pcfifo_create1_bht_pred;         
input   [24 :0]  ifu_iu_pcfifo_create1_chk_idx;          
input   [39 :0]  ifu_iu_pcfifo_create1_cur_pc;           
input            ifu_iu_pcfifo_create1_dst_vld;          
input            ifu_iu_pcfifo_create1_en;               
input            ifu_iu_pcfifo_create1_gateclk_en;       
input            ifu_iu_pcfifo_create1_jal;              
input            ifu_iu_pcfifo_create1_jalr;             
input            ifu_iu_pcfifo_create1_jmp_mispred;      
input   [39 :0]  ifu_iu_pcfifo_create1_tar_pc;           
input            iu_yy_xx_cancel;                        
input            pad_yy_icg_scan_en;                     
input            rtu_iu_flush_fe;                        
input            rtu_iu_rob_read0_pcfifo_vld;            
input            rtu_iu_rob_read1_pcfifo_vld;            
input            rtu_iu_rob_read2_pcfifo_vld;            
input            rtu_iu_rob_read_pcfifo_gateclk_vld;     
input            rtu_yy_xx_flush;                        
output  [39 :0]  bju_special_pc;                         
output           bju_top_pcfifo_full;                    
output  [4  :0]  iu_idu_pcfifo_dis_inst0_pid;            
output  [4  :0]  iu_idu_pcfifo_dis_inst1_pid;            
output  [4  :0]  iu_idu_pcfifo_dis_inst2_pid;            
output  [4  :0]  iu_idu_pcfifo_dis_inst3_pid;            
output           iu_ifu_pcfifo_full;                     
output  [47 :0]  iu_rtu_pcfifo_pop0_data;                
output  [47 :0]  iu_rtu_pcfifo_pop1_data;                
output  [47 :0]  iu_rtu_pcfifo_pop2_data;                
output           pcfifo_bju_bht_pred;                    
output  [24 :0]  pcfifo_bju_chk_idx;                     
output           pcfifo_bju_jmp_mispred;                 
output  [39 :0]  pcfifo_bju_pc;                          

// &Regs; @32
reg     [109:0]  create_entry0_data;                     
reg              create_entry0_vld;                      
reg     [109:0]  create_entry1_data;                     
reg              create_entry1_vld;                      
reg     [47 :0]  iu_rtu_pcfifo_pop0_data;                
reg     [47 :0]  iu_rtu_pcfifo_pop1_data;                
reg     [47 :0]  iu_rtu_pcfifo_pop2_data;                
reg     [4  :0]  pcfifo_assign0_ptr;                     
reg     [4  :0]  pcfifo_assign1_ptr;                     
reg     [4  :0]  pcfifo_assign2_ptr;                     
reg     [4  :0]  pcfifo_assign3_ptr;                     
reg     [66 :0]  pcfifo_bju_data;                        
reg     [31 :0]  pcfifo_create0_ptr;                     
reg     [39 :0]  pcfifo_create1_data_lsb;                
reg     [39 :0]  pcfifo_create2_data_lsb;                
reg     [50 :0]  pcfifo_pop0_data;                       
reg     [4  :0]  pcfifo_pop0_pid;                        
reg     [31 :0]  pcfifo_pop0_ptr;                        
reg     [50 :0]  pcfifo_pop1_data;                       
reg     [4  :0]  pcfifo_pop1_pid;                        
reg     [50 :0]  pcfifo_pop2_data;                       
reg     [4  :0]  pcfifo_pop2_pid;                        
reg     [50 :0]  pcfifo_pop3_data;                       
reg     [50 :0]  pcfifo_pop4_data;                       
reg     [50 :0]  pcfifo_pop5_data;                       
reg     [66 :0]  pcfifo_special_data;                    
reg     [50 :0]  read_entry0_updt_data;                  
reg     [50 :0]  read_entry1_updt_data;                  
reg     [50 :0]  read_entry2_updt_data;                  

// &Wires; @33
wire             assign_ptr_clk;                         
wire             assign_ptr_clk_en;                      
wire             bju_pcfifo_ex2_bht_mispred;             
wire             bju_pcfifo_ex2_bht_pred;                
wire             bju_pcfifo_ex2_condbr;                  
wire             bju_pcfifo_ex2_inst_vld;                
wire             bju_pcfifo_ex2_jmp;                     
wire             bju_pcfifo_ex2_length;                  
wire    [39 :0]  bju_pcfifo_ex2_pc;                      
wire             bju_pcfifo_ex2_pcall;                   
wire    [4  :0]  bju_pcfifo_ex2_pid;                     
wire    [31 :0]  bju_pcfifo_ex2_pid_expand;              
wire             bju_pcfifo_ex2_pret;                    
wire             bju_pcfifo_ex3_bht_mispred;             
wire             bju_pcfifo_ex3_bht_pred;                
wire             bju_pcfifo_ex3_condbr;                  
wire             bju_pcfifo_ex3_inst_vld;                
wire             bju_pcfifo_ex3_jmp;                     
wire             bju_pcfifo_ex3_length;                  
wire    [39 :0]  bju_pcfifo_ex3_pc;                      
wire             bju_pcfifo_ex3_pcall;                   
wire    [4  :0]  bju_pcfifo_ex3_pid;                     
wire             bju_pcfifo_ex3_pret;                    
wire    [39 :0]  bju_special_pc;                         
wire             bju_top_pcfifo_full;                    
wire    [31 :0]  cen0;                                   
wire    [31 :0]  cen1;                                   
wire    [31 :0]  cen2;                                   
wire             cp0_iu_icg_en;                          
wire             cp0_yy_clk_en;                          
wire             cpurst_b;                               
wire             create_entry0_available;                
wire             create_entry0_bht_pred;                 
wire    [24 :0]  create_entry0_chk_idx;                  
wire    [39 :0]  create_entry0_cur_pc;                   
wire             create_entry0_dst_vld;                  
wire             create_entry0_jal;                      
wire             create_entry0_jalr;                     
wire             create_entry0_jmp_mispred;              
wire    [39 :0]  create_entry0_tar_pc;                   
wire             create_entry1_available;                
wire             create_entry1_bht_pred;                 
wire    [24 :0]  create_entry1_chk_idx;                  
wire    [39 :0]  create_entry1_cur_pc;                   
wire             create_entry1_dst_vld;                  
wire             create_entry1_jalr;                     
wire             create_entry1_jmp_mispred;              
wire    [39 :0]  create_entry1_tar_pc;                   
wire             create_ptr_clk;                         
wire             create_ptr_clk_en;                      
wire             entry0_clk;                             
wire             entry0_clk_en;                          
wire             entry0_cmplt_en;                        
wire    [2  :0]  entry0_create_en;                       
wire             entry0_flush;                           
wire             entry0_pop_en;                          
wire             entry0_pop_gateclk_en;                  
wire    [66 :0]  entry0_rf_read_data;                    
wire    [50 :0]  entry0_rt_read_data;                    
wire             entry0_vld;                             
wire             entry10_cmplt_en;                       
wire    [2  :0]  entry10_create_en;                      
wire             entry10_flush;                          
wire             entry10_pop_en;                         
wire             entry10_pop_gateclk_en;                 
wire    [66 :0]  entry10_rf_read_data;                   
wire    [50 :0]  entry10_rt_read_data;                   
wire             entry10_vld;                            
wire             entry11_cmplt_en;                       
wire    [2  :0]  entry11_create_en;                      
wire             entry11_flush;                          
wire             entry11_pop_en;                         
wire             entry11_pop_gateclk_en;                 
wire    [66 :0]  entry11_rf_read_data;                   
wire    [50 :0]  entry11_rt_read_data;                   
wire             entry11_vld;                            
wire             entry12_cmplt_en;                       
wire    [2  :0]  entry12_create_en;                      
wire             entry12_flush;                          
wire             entry12_pop_en;                         
wire             entry12_pop_gateclk_en;                 
wire    [66 :0]  entry12_rf_read_data;                   
wire    [50 :0]  entry12_rt_read_data;                   
wire             entry12_vld;                            
wire             entry13_cmplt_en;                       
wire    [2  :0]  entry13_create_en;                      
wire             entry13_flush;                          
wire             entry13_pop_en;                         
wire             entry13_pop_gateclk_en;                 
wire    [66 :0]  entry13_rf_read_data;                   
wire    [50 :0]  entry13_rt_read_data;                   
wire             entry13_vld;                            
wire             entry14_cmplt_en;                       
wire    [2  :0]  entry14_create_en;                      
wire             entry14_flush;                          
wire             entry14_pop_en;                         
wire             entry14_pop_gateclk_en;                 
wire    [66 :0]  entry14_rf_read_data;                   
wire    [50 :0]  entry14_rt_read_data;                   
wire             entry14_vld;                            
wire             entry15_cmplt_en;                       
wire    [2  :0]  entry15_create_en;                      
wire             entry15_flush;                          
wire             entry15_pop_en;                         
wire             entry15_pop_gateclk_en;                 
wire    [66 :0]  entry15_rf_read_data;                   
wire    [50 :0]  entry15_rt_read_data;                   
wire             entry15_vld;                            
wire             entry16_cmplt_en;                       
wire    [2  :0]  entry16_create_en;                      
wire             entry16_flush;                          
wire             entry16_pop_en;                         
wire             entry16_pop_gateclk_en;                 
wire    [66 :0]  entry16_rf_read_data;                   
wire    [50 :0]  entry16_rt_read_data;                   
wire             entry16_vld;                            
wire             entry17_cmplt_en;                       
wire    [2  :0]  entry17_create_en;                      
wire             entry17_flush;                          
wire             entry17_pop_en;                         
wire             entry17_pop_gateclk_en;                 
wire    [66 :0]  entry17_rf_read_data;                   
wire    [50 :0]  entry17_rt_read_data;                   
wire             entry17_vld;                            
wire             entry18_cmplt_en;                       
wire    [2  :0]  entry18_create_en;                      
wire             entry18_flush;                          
wire             entry18_pop_en;                         
wire             entry18_pop_gateclk_en;                 
wire    [66 :0]  entry18_rf_read_data;                   
wire    [50 :0]  entry18_rt_read_data;                   
wire             entry18_vld;                            
wire             entry19_cmplt_en;                       
wire    [2  :0]  entry19_create_en;                      
wire             entry19_flush;                          
wire             entry19_pop_en;                         
wire             entry19_pop_gateclk_en;                 
wire    [66 :0]  entry19_rf_read_data;                   
wire    [50 :0]  entry19_rt_read_data;                   
wire             entry19_vld;                            
wire             entry1_clk;                             
wire             entry1_clk_en;                          
wire             entry1_cmplt_en;                        
wire    [2  :0]  entry1_create_en;                       
wire             entry1_flush;                           
wire             entry1_pop_en;                          
wire             entry1_pop_gateclk_en;                  
wire    [66 :0]  entry1_rf_read_data;                    
wire    [50 :0]  entry1_rt_read_data;                    
wire             entry1_vld;                             
wire             entry20_cmplt_en;                       
wire    [2  :0]  entry20_create_en;                      
wire             entry20_flush;                          
wire             entry20_pop_en;                         
wire             entry20_pop_gateclk_en;                 
wire    [66 :0]  entry20_rf_read_data;                   
wire    [50 :0]  entry20_rt_read_data;                   
wire             entry20_vld;                            
wire             entry21_cmplt_en;                       
wire    [2  :0]  entry21_create_en;                      
wire             entry21_flush;                          
wire             entry21_pop_en;                         
wire             entry21_pop_gateclk_en;                 
wire    [66 :0]  entry21_rf_read_data;                   
wire    [50 :0]  entry21_rt_read_data;                   
wire             entry21_vld;                            
wire             entry22_cmplt_en;                       
wire    [2  :0]  entry22_create_en;                      
wire             entry22_flush;                          
wire             entry22_pop_en;                         
wire             entry22_pop_gateclk_en;                 
wire    [66 :0]  entry22_rf_read_data;                   
wire    [50 :0]  entry22_rt_read_data;                   
wire             entry22_vld;                            
wire             entry23_cmplt_en;                       
wire    [2  :0]  entry23_create_en;                      
wire             entry23_flush;                          
wire             entry23_pop_en;                         
wire             entry23_pop_gateclk_en;                 
wire    [66 :0]  entry23_rf_read_data;                   
wire    [50 :0]  entry23_rt_read_data;                   
wire             entry23_vld;                            
wire             entry24_cmplt_en;                       
wire    [2  :0]  entry24_create_en;                      
wire             entry24_flush;                          
wire             entry24_pop_en;                         
wire             entry24_pop_gateclk_en;                 
wire    [66 :0]  entry24_rf_read_data;                   
wire    [50 :0]  entry24_rt_read_data;                   
wire             entry24_vld;                            
wire             entry25_cmplt_en;                       
wire    [2  :0]  entry25_create_en;                      
wire             entry25_flush;                          
wire             entry25_pop_en;                         
wire             entry25_pop_gateclk_en;                 
wire    [66 :0]  entry25_rf_read_data;                   
wire    [50 :0]  entry25_rt_read_data;                   
wire             entry25_vld;                            
wire             entry26_cmplt_en;                       
wire    [2  :0]  entry26_create_en;                      
wire             entry26_flush;                          
wire             entry26_pop_en;                         
wire             entry26_pop_gateclk_en;                 
wire    [66 :0]  entry26_rf_read_data;                   
wire    [50 :0]  entry26_rt_read_data;                   
wire             entry26_vld;                            
wire             entry27_cmplt_en;                       
wire    [2  :0]  entry27_create_en;                      
wire             entry27_flush;                          
wire             entry27_pop_en;                         
wire             entry27_pop_gateclk_en;                 
wire    [66 :0]  entry27_rf_read_data;                   
wire    [50 :0]  entry27_rt_read_data;                   
wire             entry27_vld;                            
wire             entry28_cmplt_en;                       
wire    [2  :0]  entry28_create_en;                      
wire             entry28_flush;                          
wire             entry28_pop_en;                         
wire             entry28_pop_gateclk_en;                 
wire    [66 :0]  entry28_rf_read_data;                   
wire    [50 :0]  entry28_rt_read_data;                   
wire             entry28_vld;                            
wire             entry29_cmplt_en;                       
wire    [2  :0]  entry29_create_en;                      
wire             entry29_flush;                          
wire             entry29_pop_en;                         
wire             entry29_pop_gateclk_en;                 
wire    [66 :0]  entry29_rf_read_data;                   
wire    [50 :0]  entry29_rt_read_data;                   
wire             entry29_vld;                            
wire             entry2_cmplt_en;                        
wire    [2  :0]  entry2_create_en;                       
wire             entry2_flush;                           
wire             entry2_pop_en;                          
wire             entry2_pop_gateclk_en;                  
wire    [66 :0]  entry2_rf_read_data;                    
wire    [50 :0]  entry2_rt_read_data;                    
wire             entry2_vld;                             
wire             entry30_cmplt_en;                       
wire    [2  :0]  entry30_create_en;                      
wire             entry30_flush;                          
wire             entry30_pop_en;                         
wire             entry30_pop_gateclk_en;                 
wire    [66 :0]  entry30_rf_read_data;                   
wire    [50 :0]  entry30_rt_read_data;                   
wire             entry30_vld;                            
wire             entry31_cmplt_en;                       
wire    [2  :0]  entry31_create_en;                      
wire             entry31_flush;                          
wire             entry31_pop_en;                         
wire             entry31_pop_gateclk_en;                 
wire    [66 :0]  entry31_rf_read_data;                   
wire    [50 :0]  entry31_rt_read_data;                   
wire             entry31_vld;                            
wire             entry3_cmplt_en;                        
wire    [2  :0]  entry3_create_en;                       
wire             entry3_flush;                           
wire             entry3_pop_en;                          
wire             entry3_pop_gateclk_en;                  
wire    [66 :0]  entry3_rf_read_data;                    
wire    [50 :0]  entry3_rt_read_data;                    
wire             entry3_vld;                             
wire             entry4_cmplt_en;                        
wire    [2  :0]  entry4_create_en;                       
wire             entry4_flush;                           
wire             entry4_pop_en;                          
wire             entry4_pop_gateclk_en;                  
wire    [66 :0]  entry4_rf_read_data;                    
wire    [50 :0]  entry4_rt_read_data;                    
wire             entry4_vld;                             
wire             entry5_cmplt_en;                        
wire    [2  :0]  entry5_create_en;                       
wire             entry5_flush;                           
wire             entry5_pop_en;                          
wire             entry5_pop_gateclk_en;                  
wire    [66 :0]  entry5_rf_read_data;                    
wire    [50 :0]  entry5_rt_read_data;                    
wire             entry5_vld;                             
wire             entry6_cmplt_en;                        
wire    [2  :0]  entry6_create_en;                       
wire             entry6_flush;                           
wire             entry6_pop_en;                          
wire             entry6_pop_gateclk_en;                  
wire    [66 :0]  entry6_rf_read_data;                    
wire    [50 :0]  entry6_rt_read_data;                    
wire             entry6_vld;                             
wire             entry7_cmplt_en;                        
wire    [2  :0]  entry7_create_en;                       
wire             entry7_flush;                           
wire             entry7_pop_en;                          
wire             entry7_pop_gateclk_en;                  
wire    [66 :0]  entry7_rf_read_data;                    
wire    [50 :0]  entry7_rt_read_data;                    
wire             entry7_vld;                             
wire             entry8_cmplt_en;                        
wire    [2  :0]  entry8_create_en;                       
wire             entry8_flush;                           
wire             entry8_pop_en;                          
wire             entry8_pop_gateclk_en;                  
wire    [66 :0]  entry8_rf_read_data;                    
wire    [50 :0]  entry8_rt_read_data;                    
wire             entry8_vld;                             
wire             entry9_cmplt_en;                        
wire    [2  :0]  entry9_create_en;                       
wire             entry9_flush;                           
wire             entry9_pop_en;                          
wire             entry9_pop_gateclk_en;                  
wire    [66 :0]  entry9_rf_read_data;                    
wire    [50 :0]  entry9_rt_read_data;                    
wire             entry9_vld;                             
wire             entry_clk;                              
wire             entry_clk_en;                           
wire    [31 :0]  entry_flush;                            
wire    [31 :0]  entry_pop_en;                           
wire    [31 :0]  entry_pop_gateclk_en;                   
wire    [31 :0]  entry_vld;                              
wire             forever_cpuclk;                         
wire    [2  :0]  idu_iu_is_pcfifo_inst_num;              
wire             idu_iu_is_pcfifo_inst_vld;              
wire    [4  :0]  idu_iu_rf_pipe0_pid;                    
wire    [4  :0]  idu_iu_rf_pipe2_pid;                    
wire    [109:0]  ifu_create0_data;                       
wire    [109:0]  ifu_create1_data;                       
wire             ifu_iu_pcfifo_create0_bht_pred;         
wire    [24 :0]  ifu_iu_pcfifo_create0_chk_idx;          
wire    [39 :0]  ifu_iu_pcfifo_create0_cur_pc;           
wire             ifu_iu_pcfifo_create0_dst_vld;          
wire             ifu_iu_pcfifo_create0_en;               
wire             ifu_iu_pcfifo_create0_gateclk_en;       
wire             ifu_iu_pcfifo_create0_jal;              
wire             ifu_iu_pcfifo_create0_jalr;             
wire             ifu_iu_pcfifo_create0_jmp_mispred;      
wire    [39 :0]  ifu_iu_pcfifo_create0_tar_pc;           
wire             ifu_iu_pcfifo_create1_bht_pred;         
wire    [24 :0]  ifu_iu_pcfifo_create1_chk_idx;          
wire    [39 :0]  ifu_iu_pcfifo_create1_cur_pc;           
wire             ifu_iu_pcfifo_create1_dst_vld;          
wire             ifu_iu_pcfifo_create1_en;               
wire             ifu_iu_pcfifo_create1_gateclk_en;       
wire             ifu_iu_pcfifo_create1_jal;              
wire             ifu_iu_pcfifo_create1_jalr;             
wire             ifu_iu_pcfifo_create1_jmp_mispred;      
wire    [39 :0]  ifu_iu_pcfifo_create1_tar_pc;           
wire    [4  :0]  iu_idu_pcfifo_dis_inst0_pid;            
wire    [4  :0]  iu_idu_pcfifo_dis_inst1_pid;            
wire    [4  :0]  iu_idu_pcfifo_dis_inst2_pid;            
wire    [4  :0]  iu_idu_pcfifo_dis_inst3_pid;            
wire             iu_ifu_pcfifo_full;                     
wire             iu_yy_xx_cancel;                        
wire             pad_yy_icg_scan_en;                     
wire    [31 :0]  pcfifo_assign0_ptr_expand;              
wire    [4  :0]  pcfifo_assign0_ptr_updt_val;            
wire    [4  :0]  pcfifo_assign1_ptr_updt_val;            
wire    [4  :0]  pcfifo_assign2_ptr_updt_val;            
wire    [4  :0]  pcfifo_assign3_ptr_updt_val;            
wire             pcfifo_bju_bht_pred;                    
wire    [24 :0]  pcfifo_bju_chk_idx;                     
wire             pcfifo_bju_jmp_mispred;                 
wire    [39 :0]  pcfifo_bju_pc;                          
wire             pcfifo_create0_2_entry;                 
wire    [66 :0]  pcfifo_create0_data;                    
wire             pcfifo_create0_en;                      
wire    [4  :0]  pcfifo_create0_ptr_encode;              
wire    [31 :0]  pcfifo_create0_ptr_encode_expand;       
wire    [66 :0]  pcfifo_create1_data;                    
wire             pcfifo_create1_en;                      
wire    [31 :0]  pcfifo_create1_ptr;                     
wire    [4  :0]  pcfifo_create1_ptr_encode;              
wire    [31 :0]  pcfifo_create1_ptr_encode_expand;       
wire    [66 :0]  pcfifo_create2_data;                    
wire             pcfifo_create2_en;                      
wire    [31 :0]  pcfifo_create2_ptr;                     
wire    [4  :0]  pcfifo_create2_ptr_encode;              
wire    [31 :0]  pcfifo_create2_ptr_encode_expand;       
wire    [31 :0]  pcfifo_create3_ptr;                     
wire    [4  :0]  pcfifo_create3_ptr_encode;              
wire    [31 :0]  pcfifo_create3_ptr_encode_expand;       
wire    [31 :0]  pcfifo_create5_ptr;                     
wire             pcfifo_create_to_read_entry0_en;        
wire             pcfifo_create_to_read_entry0_gateclk_en; 
wire             pcfifo_create_to_read_entry1_en;        
wire             pcfifo_create_to_read_entry1_gateclk_en; 
wire             pcfifo_create_to_read_entry2_en;        
wire             pcfifo_create_to_read_entry2_gateclk_en; 
wire    [47 :0]  pcfifo_ex2_bypass_read_data;            
wire    [31 :0]  pcfifo_ex2_cmplt;                       
wire    [47 :0]  pcfifo_ex3_bypass_read_data;            
wire             pcfifo_full;                            
wire    [2  :0]  pcfifo_pop0_bypass_sel;                 
wire    [2  :0]  pcfifo_pop1_bypass_sel;                 
wire    [31 :0]  pcfifo_pop1_ptr;                        
wire    [2  :0]  pcfifo_pop2_bypass_sel;                 
wire    [31 :0]  pcfifo_pop2_ptr;                        
wire    [31 :0]  pcfifo_pop3_ptr;                        
wire    [31 :0]  pcfifo_pop4_ptr;                        
wire    [31 :0]  pcfifo_pop5_ptr;                        
wire    [2  :0]  pcfifo_pop_inst;                        
wire    [3  :0]  pcfifo_pop_inst_num;                    
wire             pcfifo_pop_vld;                         
wire             pop_ptr_clk;                            
wire             pop_ptr_clk_en;                         
wire    [50 :0]  read_entry0_create_data;                
wire             read_entry0_create_en;                  
wire             read_entry0_create_gateclk_en;          
wire    [50 :0]  read_entry0_rt_read_data;               
wire    [50 :0]  read_entry1_create_data;                
wire             read_entry1_create_en;                  
wire             read_entry1_create_gateclk_en;          
wire    [50 :0]  read_entry1_rt_read_data;               
wire    [50 :0]  read_entry2_create_data;                
wire             read_entry2_create_en;                  
wire             read_entry2_create_gateclk_en;          
wire    [50 :0]  read_entry2_rt_read_data;               
wire             rtu_iu_flush_fe;                        
wire             rtu_iu_rob_read0_pcfifo_vld;            
wire             rtu_iu_rob_read1_pcfifo_vld;            
wire             rtu_iu_rob_read2_pcfifo_vld;            
wire             rtu_iu_rob_read_pcfifo_gateclk_vld;     
wire             rtu_yy_xx_flush;                        


parameter READ_WIDTH   = 67;
parameter POP_WIDTH    = 51;
parameter PCFIFO_VLD   = 48;
parameter PCFIFO_CMPLT = 50;
parameter CENTRY_WIDTH = 110;

//==========================================================
//                 Instance PCFIFO Entries
//==========================================================
// &ConnRule(s/^x_/entry0_/); @44
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry0"); @45
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry0 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry0_cmplt_en           ),
  .x_create_en                (entry0_create_en          ),
  .x_flush                    (entry0_flush              ),
  .x_pop_en                   (entry0_pop_en             ),
  .x_pop_gateclk_en           (entry0_pop_gateclk_en     ),
  .x_rf_read_data             (entry0_rf_read_data       ),
  .x_rt_read_data             (entry0_rt_read_data       ),
  .x_vld                      (entry0_vld                )
);

// &ConnRule(s/^x_/entry1_/); @46
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry1"); @47
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry1 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry1_cmplt_en           ),
  .x_create_en                (entry1_create_en          ),
  .x_flush                    (entry1_flush              ),
  .x_pop_en                   (entry1_pop_en             ),
  .x_pop_gateclk_en           (entry1_pop_gateclk_en     ),
  .x_rf_read_data             (entry1_rf_read_data       ),
  .x_rt_read_data             (entry1_rt_read_data       ),
  .x_vld                      (entry1_vld                )
);

// &ConnRule(s/^x_/entry2_/); @48
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry2"); @49
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry2 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry2_cmplt_en           ),
  .x_create_en                (entry2_create_en          ),
  .x_flush                    (entry2_flush              ),
  .x_pop_en                   (entry2_pop_en             ),
  .x_pop_gateclk_en           (entry2_pop_gateclk_en     ),
  .x_rf_read_data             (entry2_rf_read_data       ),
  .x_rt_read_data             (entry2_rt_read_data       ),
  .x_vld                      (entry2_vld                )
);

// &ConnRule(s/^x_/entry3_/); @50
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry3"); @51
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry3 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry3_cmplt_en           ),
  .x_create_en                (entry3_create_en          ),
  .x_flush                    (entry3_flush              ),
  .x_pop_en                   (entry3_pop_en             ),
  .x_pop_gateclk_en           (entry3_pop_gateclk_en     ),
  .x_rf_read_data             (entry3_rf_read_data       ),
  .x_rt_read_data             (entry3_rt_read_data       ),
  .x_vld                      (entry3_vld                )
);

// &ConnRule(s/^x_/entry4_/); @52
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry4"); @53
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry4 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry4_cmplt_en           ),
  .x_create_en                (entry4_create_en          ),
  .x_flush                    (entry4_flush              ),
  .x_pop_en                   (entry4_pop_en             ),
  .x_pop_gateclk_en           (entry4_pop_gateclk_en     ),
  .x_rf_read_data             (entry4_rf_read_data       ),
  .x_rt_read_data             (entry4_rt_read_data       ),
  .x_vld                      (entry4_vld                )
);

// &ConnRule(s/^x_/entry5_/); @54
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry5"); @55
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry5 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry5_cmplt_en           ),
  .x_create_en                (entry5_create_en          ),
  .x_flush                    (entry5_flush              ),
  .x_pop_en                   (entry5_pop_en             ),
  .x_pop_gateclk_en           (entry5_pop_gateclk_en     ),
  .x_rf_read_data             (entry5_rf_read_data       ),
  .x_rt_read_data             (entry5_rt_read_data       ),
  .x_vld                      (entry5_vld                )
);

// &ConnRule(s/^x_/entry6_/); @56
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry6"); @57
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry6 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry6_cmplt_en           ),
  .x_create_en                (entry6_create_en          ),
  .x_flush                    (entry6_flush              ),
  .x_pop_en                   (entry6_pop_en             ),
  .x_pop_gateclk_en           (entry6_pop_gateclk_en     ),
  .x_rf_read_data             (entry6_rf_read_data       ),
  .x_rt_read_data             (entry6_rt_read_data       ),
  .x_vld                      (entry6_vld                )
);

// &ConnRule(s/^x_/entry7_/); @58
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry7"); @59
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry7 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry7_cmplt_en           ),
  .x_create_en                (entry7_create_en          ),
  .x_flush                    (entry7_flush              ),
  .x_pop_en                   (entry7_pop_en             ),
  .x_pop_gateclk_en           (entry7_pop_gateclk_en     ),
  .x_rf_read_data             (entry7_rf_read_data       ),
  .x_rt_read_data             (entry7_rt_read_data       ),
  .x_vld                      (entry7_vld                )
);

// &ConnRule(s/^x_/entry8_/); @60
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry8"); @61
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry8 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry8_cmplt_en           ),
  .x_create_en                (entry8_create_en          ),
  .x_flush                    (entry8_flush              ),
  .x_pop_en                   (entry8_pop_en             ),
  .x_pop_gateclk_en           (entry8_pop_gateclk_en     ),
  .x_rf_read_data             (entry8_rf_read_data       ),
  .x_rt_read_data             (entry8_rt_read_data       ),
  .x_vld                      (entry8_vld                )
);

// &ConnRule(s/^x_/entry9_/); @62
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry9"); @63
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry9 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry9_cmplt_en           ),
  .x_create_en                (entry9_create_en          ),
  .x_flush                    (entry9_flush              ),
  .x_pop_en                   (entry9_pop_en             ),
  .x_pop_gateclk_en           (entry9_pop_gateclk_en     ),
  .x_rf_read_data             (entry9_rf_read_data       ),
  .x_rt_read_data             (entry9_rt_read_data       ),
  .x_vld                      (entry9_vld                )
);

// &ConnRule(s/^x_/entry10_/); @64
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry10"); @65
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry10 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry10_cmplt_en          ),
  .x_create_en                (entry10_create_en         ),
  .x_flush                    (entry10_flush             ),
  .x_pop_en                   (entry10_pop_en            ),
  .x_pop_gateclk_en           (entry10_pop_gateclk_en    ),
  .x_rf_read_data             (entry10_rf_read_data      ),
  .x_rt_read_data             (entry10_rt_read_data      ),
  .x_vld                      (entry10_vld               )
);

// &ConnRule(s/^x_/entry11_/); @66
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry11"); @67
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry11 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry11_cmplt_en          ),
  .x_create_en                (entry11_create_en         ),
  .x_flush                    (entry11_flush             ),
  .x_pop_en                   (entry11_pop_en            ),
  .x_pop_gateclk_en           (entry11_pop_gateclk_en    ),
  .x_rf_read_data             (entry11_rf_read_data      ),
  .x_rt_read_data             (entry11_rt_read_data      ),
  .x_vld                      (entry11_vld               )
);

// &ConnRule(s/^x_/entry12_/); @68
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry12"); @69
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry12 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry12_cmplt_en          ),
  .x_create_en                (entry12_create_en         ),
  .x_flush                    (entry12_flush             ),
  .x_pop_en                   (entry12_pop_en            ),
  .x_pop_gateclk_en           (entry12_pop_gateclk_en    ),
  .x_rf_read_data             (entry12_rf_read_data      ),
  .x_rt_read_data             (entry12_rt_read_data      ),
  .x_vld                      (entry12_vld               )
);

// &ConnRule(s/^x_/entry13_/); @70
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry13"); @71
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry13 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry13_cmplt_en          ),
  .x_create_en                (entry13_create_en         ),
  .x_flush                    (entry13_flush             ),
  .x_pop_en                   (entry13_pop_en            ),
  .x_pop_gateclk_en           (entry13_pop_gateclk_en    ),
  .x_rf_read_data             (entry13_rf_read_data      ),
  .x_rt_read_data             (entry13_rt_read_data      ),
  .x_vld                      (entry13_vld               )
);

// &ConnRule(s/^x_/entry14_/); @72
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry14"); @73
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry14 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry14_cmplt_en          ),
  .x_create_en                (entry14_create_en         ),
  .x_flush                    (entry14_flush             ),
  .x_pop_en                   (entry14_pop_en            ),
  .x_pop_gateclk_en           (entry14_pop_gateclk_en    ),
  .x_rf_read_data             (entry14_rf_read_data      ),
  .x_rt_read_data             (entry14_rt_read_data      ),
  .x_vld                      (entry14_vld               )
);

// &ConnRule(s/^x_/entry15_/); @74
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry15"); @75
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry15 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry15_cmplt_en          ),
  .x_create_en                (entry15_create_en         ),
  .x_flush                    (entry15_flush             ),
  .x_pop_en                   (entry15_pop_en            ),
  .x_pop_gateclk_en           (entry15_pop_gateclk_en    ),
  .x_rf_read_data             (entry15_rf_read_data      ),
  .x_rt_read_data             (entry15_rt_read_data      ),
  .x_vld                      (entry15_vld               )
);

// &ConnRule(s/^x_/entry16_/); @76
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry16"); @77
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry16 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry16_cmplt_en          ),
  .x_create_en                (entry16_create_en         ),
  .x_flush                    (entry16_flush             ),
  .x_pop_en                   (entry16_pop_en            ),
  .x_pop_gateclk_en           (entry16_pop_gateclk_en    ),
  .x_rf_read_data             (entry16_rf_read_data      ),
  .x_rt_read_data             (entry16_rt_read_data      ),
  .x_vld                      (entry16_vld               )
);

// &ConnRule(s/^x_/entry17_/); @78
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry17"); @79
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry17 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry17_cmplt_en          ),
  .x_create_en                (entry17_create_en         ),
  .x_flush                    (entry17_flush             ),
  .x_pop_en                   (entry17_pop_en            ),
  .x_pop_gateclk_en           (entry17_pop_gateclk_en    ),
  .x_rf_read_data             (entry17_rf_read_data      ),
  .x_rt_read_data             (entry17_rt_read_data      ),
  .x_vld                      (entry17_vld               )
);

// &ConnRule(s/^x_/entry18_/); @80
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry18"); @81
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry18 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry18_cmplt_en          ),
  .x_create_en                (entry18_create_en         ),
  .x_flush                    (entry18_flush             ),
  .x_pop_en                   (entry18_pop_en            ),
  .x_pop_gateclk_en           (entry18_pop_gateclk_en    ),
  .x_rf_read_data             (entry18_rf_read_data      ),
  .x_rt_read_data             (entry18_rt_read_data      ),
  .x_vld                      (entry18_vld               )
);

// &ConnRule(s/^x_/entry19_/); @82
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry19"); @83
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry19 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry19_cmplt_en          ),
  .x_create_en                (entry19_create_en         ),
  .x_flush                    (entry19_flush             ),
  .x_pop_en                   (entry19_pop_en            ),
  .x_pop_gateclk_en           (entry19_pop_gateclk_en    ),
  .x_rf_read_data             (entry19_rf_read_data      ),
  .x_rt_read_data             (entry19_rt_read_data      ),
  .x_vld                      (entry19_vld               )
);

// &ConnRule(s/^x_/entry20_/); @84
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry20"); @85
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry20 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry20_cmplt_en          ),
  .x_create_en                (entry20_create_en         ),
  .x_flush                    (entry20_flush             ),
  .x_pop_en                   (entry20_pop_en            ),
  .x_pop_gateclk_en           (entry20_pop_gateclk_en    ),
  .x_rf_read_data             (entry20_rf_read_data      ),
  .x_rt_read_data             (entry20_rt_read_data      ),
  .x_vld                      (entry20_vld               )
);

// &ConnRule(s/^x_/entry21_/); @86
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry21"); @87
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry21 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry21_cmplt_en          ),
  .x_create_en                (entry21_create_en         ),
  .x_flush                    (entry21_flush             ),
  .x_pop_en                   (entry21_pop_en            ),
  .x_pop_gateclk_en           (entry21_pop_gateclk_en    ),
  .x_rf_read_data             (entry21_rf_read_data      ),
  .x_rt_read_data             (entry21_rt_read_data      ),
  .x_vld                      (entry21_vld               )
);

// &ConnRule(s/^x_/entry22_/); @88
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry22"); @89
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry22 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry22_cmplt_en          ),
  .x_create_en                (entry22_create_en         ),
  .x_flush                    (entry22_flush             ),
  .x_pop_en                   (entry22_pop_en            ),
  .x_pop_gateclk_en           (entry22_pop_gateclk_en    ),
  .x_rf_read_data             (entry22_rf_read_data      ),
  .x_rt_read_data             (entry22_rt_read_data      ),
  .x_vld                      (entry22_vld               )
);

// &ConnRule(s/^x_/entry23_/); @90
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry23"); @91
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry23 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry23_cmplt_en          ),
  .x_create_en                (entry23_create_en         ),
  .x_flush                    (entry23_flush             ),
  .x_pop_en                   (entry23_pop_en            ),
  .x_pop_gateclk_en           (entry23_pop_gateclk_en    ),
  .x_rf_read_data             (entry23_rf_read_data      ),
  .x_rt_read_data             (entry23_rt_read_data      ),
  .x_vld                      (entry23_vld               )
);

// &ConnRule(s/^x_/entry24_/); @92
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry24"); @93
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry24 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry24_cmplt_en          ),
  .x_create_en                (entry24_create_en         ),
  .x_flush                    (entry24_flush             ),
  .x_pop_en                   (entry24_pop_en            ),
  .x_pop_gateclk_en           (entry24_pop_gateclk_en    ),
  .x_rf_read_data             (entry24_rf_read_data      ),
  .x_rt_read_data             (entry24_rt_read_data      ),
  .x_vld                      (entry24_vld               )
);

// &ConnRule(s/^x_/entry25_/); @94
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry25"); @95
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry25 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry25_cmplt_en          ),
  .x_create_en                (entry25_create_en         ),
  .x_flush                    (entry25_flush             ),
  .x_pop_en                   (entry25_pop_en            ),
  .x_pop_gateclk_en           (entry25_pop_gateclk_en    ),
  .x_rf_read_data             (entry25_rf_read_data      ),
  .x_rt_read_data             (entry25_rt_read_data      ),
  .x_vld                      (entry25_vld               )
);

// &ConnRule(s/^x_/entry26_/); @96
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry26"); @97
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry26 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry26_cmplt_en          ),
  .x_create_en                (entry26_create_en         ),
  .x_flush                    (entry26_flush             ),
  .x_pop_en                   (entry26_pop_en            ),
  .x_pop_gateclk_en           (entry26_pop_gateclk_en    ),
  .x_rf_read_data             (entry26_rf_read_data      ),
  .x_rt_read_data             (entry26_rt_read_data      ),
  .x_vld                      (entry26_vld               )
);

// &ConnRule(s/^x_/entry27_/); @98
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry27"); @99
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry27 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry27_cmplt_en          ),
  .x_create_en                (entry27_create_en         ),
  .x_flush                    (entry27_flush             ),
  .x_pop_en                   (entry27_pop_en            ),
  .x_pop_gateclk_en           (entry27_pop_gateclk_en    ),
  .x_rf_read_data             (entry27_rf_read_data      ),
  .x_rt_read_data             (entry27_rt_read_data      ),
  .x_vld                      (entry27_vld               )
);

// &ConnRule(s/^x_/entry28_/); @100
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry28"); @101
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry28 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry28_cmplt_en          ),
  .x_create_en                (entry28_create_en         ),
  .x_flush                    (entry28_flush             ),
  .x_pop_en                   (entry28_pop_en            ),
  .x_pop_gateclk_en           (entry28_pop_gateclk_en    ),
  .x_rf_read_data             (entry28_rf_read_data      ),
  .x_rt_read_data             (entry28_rt_read_data      ),
  .x_vld                      (entry28_vld               )
);

// &ConnRule(s/^x_/entry29_/); @102
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry29"); @103
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry29 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry29_cmplt_en          ),
  .x_create_en                (entry29_create_en         ),
  .x_flush                    (entry29_flush             ),
  .x_pop_en                   (entry29_pop_en            ),
  .x_pop_gateclk_en           (entry29_pop_gateclk_en    ),
  .x_rf_read_data             (entry29_rf_read_data      ),
  .x_rt_read_data             (entry29_rt_read_data      ),
  .x_vld                      (entry29_vld               )
);

// &ConnRule(s/^x_/entry30_/); @104
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry30"); @105
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry30 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry30_cmplt_en          ),
  .x_create_en                (entry30_create_en         ),
  .x_flush                    (entry30_flush             ),
  .x_pop_en                   (entry30_pop_en            ),
  .x_pop_gateclk_en           (entry30_pop_gateclk_en    ),
  .x_rf_read_data             (entry30_rf_read_data      ),
  .x_rt_read_data             (entry30_rt_read_data      ),
  .x_vld                      (entry30_vld               )
);

// &ConnRule(s/^x_/entry31_/); @106
// &Instance("ct_iu_bju_pcfifo_entry", "x_ct_iu_bju_pcfifo_entry31"); @107
ct_iu_bju_pcfifo_entry  x_ct_iu_bju_pcfifo_entry31 (
  .bju_pcfifo_ex2_bht_mispred (bju_pcfifo_ex2_bht_mispred),
  .bju_pcfifo_ex2_condbr      (bju_pcfifo_ex2_condbr     ),
  .bju_pcfifo_ex2_jmp         (bju_pcfifo_ex2_jmp        ),
  .bju_pcfifo_ex2_length      (bju_pcfifo_ex2_length     ),
  .bju_pcfifo_ex2_pc          (bju_pcfifo_ex2_pc         ),
  .bju_pcfifo_ex2_pcall       (bju_pcfifo_ex2_pcall      ),
  .bju_pcfifo_ex2_pret        (bju_pcfifo_ex2_pret       ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iu_yy_xx_cancel            (iu_yy_xx_cancel           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcfifo_create0_data        (pcfifo_create0_data       ),
  .pcfifo_create1_data        (pcfifo_create1_data       ),
  .pcfifo_create2_data        (pcfifo_create2_data       ),
  .rtu_iu_flush_fe            (rtu_iu_flush_fe           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .x_cmplt_en                 (entry31_cmplt_en          ),
  .x_create_en                (entry31_create_en         ),
  .x_flush                    (entry31_flush             ),
  .x_pop_en                   (entry31_pop_en            ),
  .x_pop_gateclk_en           (entry31_pop_gateclk_en    ),
  .x_rf_read_data             (entry31_rf_read_data      ),
  .x_rt_read_data             (entry31_rt_read_data      ),
  .x_vld                      (entry31_vld               )
);


// &ConnRule(s/^x_/read_entry0_/); @109
// &Instance("ct_iu_bju_pcfifo_read_entry", "x_ct_iu_bju_pcfifo_read_entry0"); @110
ct_iu_bju_pcfifo_read_entry  x_ct_iu_bju_pcfifo_read_entry0 (
  .cp0_iu_icg_en                 (cp0_iu_icg_en                ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_yy_xx_cancel               (iu_yy_xx_cancel              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_iu_flush_fe               (rtu_iu_flush_fe              ),
  .rtu_yy_xx_flush               (rtu_yy_xx_flush              ),
  .x_create_data                 (read_entry0_create_data      ),
  .x_create_en                   (read_entry0_create_en        ),
  .x_create_gateclk_en           (read_entry0_create_gateclk_en),
  .x_rt_read_data                (read_entry0_rt_read_data     )
);

// &ConnRule(s/^x_/read_entry1_/); @111
// &Instance("ct_iu_bju_pcfifo_read_entry", "x_ct_iu_bju_pcfifo_read_entry1"); @112
ct_iu_bju_pcfifo_read_entry  x_ct_iu_bju_pcfifo_read_entry1 (
  .cp0_iu_icg_en                 (cp0_iu_icg_en                ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_yy_xx_cancel               (iu_yy_xx_cancel              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_iu_flush_fe               (rtu_iu_flush_fe              ),
  .rtu_yy_xx_flush               (rtu_yy_xx_flush              ),
  .x_create_data                 (read_entry1_create_data      ),
  .x_create_en                   (read_entry1_create_en        ),
  .x_create_gateclk_en           (read_entry1_create_gateclk_en),
  .x_rt_read_data                (read_entry1_rt_read_data     )
);

// &ConnRule(s/^x_/read_entry2_/); @113
// &Instance("ct_iu_bju_pcfifo_read_entry", "x_ct_iu_bju_pcfifo_read_entry2"); @114
ct_iu_bju_pcfifo_read_entry  x_ct_iu_bju_pcfifo_read_entry2 (
  .cp0_iu_icg_en                 (cp0_iu_icg_en                ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_yy_xx_cancel               (iu_yy_xx_cancel              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_iu_flush_fe               (rtu_iu_flush_fe              ),
  .rtu_yy_xx_flush               (rtu_yy_xx_flush              ),
  .x_create_data                 (read_entry2_create_data      ),
  .x_create_en                   (read_entry2_create_en        ),
  .x_create_gateclk_en           (read_entry2_create_gateclk_en),
  .x_rt_read_data                (read_entry2_rt_read_data     )
);


//==========================================================
//                   PCFIFO Create Entry
//==========================================================
//----------------------------------------------------------
//                    IFU Create Data
//----------------------------------------------------------
assign ifu_create0_data[39:0]   = ifu_iu_pcfifo_create0_cur_pc[39:0];
assign ifu_create0_data[79:40]  = ifu_iu_pcfifo_create0_tar_pc[39:0];
assign ifu_create0_data[80]     = ifu_iu_pcfifo_create0_bht_pred;
assign ifu_create0_data[81]     = ifu_iu_pcfifo_create0_jal;
assign ifu_create0_data[82]     = ifu_iu_pcfifo_create0_jalr;
assign ifu_create0_data[83]     = ifu_iu_pcfifo_create0_dst_vld;
assign ifu_create0_data[84]     = ifu_iu_pcfifo_create0_jmp_mispred;
assign ifu_create0_data[109:85] = ifu_iu_pcfifo_create0_chk_idx[24:0];

assign ifu_create1_data[39:0]   = ifu_iu_pcfifo_create1_cur_pc[39:0];
assign ifu_create1_data[79:40]  = ifu_iu_pcfifo_create1_tar_pc[39:0];
assign ifu_create1_data[80]     = ifu_iu_pcfifo_create1_bht_pred;
assign ifu_create1_data[81]     = ifu_iu_pcfifo_create1_jal;
assign ifu_create1_data[82]     = ifu_iu_pcfifo_create1_jalr;
assign ifu_create1_data[83]     = ifu_iu_pcfifo_create1_dst_vld;
assign ifu_create1_data[84]     = ifu_iu_pcfifo_create1_jmp_mispred;
assign ifu_create1_data[109:85] = ifu_iu_pcfifo_create1_chk_idx[24:0];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign entry_clk_en = ifu_iu_pcfifo_create0_gateclk_en
                      || ifu_iu_pcfifo_create1_gateclk_en
                      || create_entry0_vld;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @146
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @147
//          .external_en (1'b0), @148
//          .global_en   (cp0_yy_clk_en), @149
//          .module_en   (cp0_iu_icg_en), @150
//          .local_en    (entry_clk_en), @151
//          .clk_out     (entry_clk)); @152

assign entry0_clk_en = ifu_iu_pcfifo_create0_gateclk_en;
// &Instance("gated_clk_cell", "x_entry0_gated_clk"); @155
gated_clk_cell  x_entry0_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry0_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry0_clk_en     ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @156
//          .external_en (1'b0), @157
//          .global_en   (cp0_yy_clk_en), @158
//          .module_en   (cp0_iu_icg_en), @159
//          .local_en    (entry0_clk_en), @160
//          .clk_out     (entry0_clk)); @161

assign entry1_clk_en = ifu_iu_pcfifo_create1_gateclk_en;
// &Instance("gated_clk_cell", "x_entry1_gated_clk"); @164
gated_clk_cell  x_entry1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry1_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry1_clk_en     ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @165
//          .external_en (1'b0), @166
//          .global_en   (cp0_yy_clk_en), @167
//          .module_en   (cp0_iu_icg_en), @168
//          .local_en    (entry1_clk_en), @169
//          .clk_out     (entry1_clk)); @170

//----------------------------------------------------------
//                     Entry 0 Valid
//----------------------------------------------------------
//create entry is available when pcfifo not full even if
//create entry not valid, MUST allow create entry inst create
//otherwise it may execute before create into pcfifo
assign create_entry0_available = !pcfifo_full;

always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    create_entry0_vld <= 1'b0;
  else if(iu_yy_xx_cancel || rtu_iu_flush_fe)
    create_entry0_vld <= 1'b0;
  else if(create_entry0_available)
    create_entry0_vld <= ifu_iu_pcfifo_create0_en;
  else
    create_entry0_vld <= 1'b0;
end

//----------------------------------------------------------
//                     Entry 1 Valid
//----------------------------------------------------------
//create entry is available when pcfifo not full even if
//create entry not valid, MUST allow create entry inst create
//otherwise it may execute before create into pcfifo
assign create_entry1_available = !pcfifo_full;

always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    create_entry1_vld <= 1'b0;
  else if(iu_yy_xx_cancel || rtu_iu_flush_fe)
    create_entry1_vld <= 1'b0;
  else if(create_entry1_available)
    create_entry1_vld <= ifu_iu_pcfifo_create1_en;
  else
    create_entry1_vld <= 1'b0;
end

//----------------------------------------------------------
//                     Entry 0 Data
//----------------------------------------------------------
always @(posedge entry0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    create_entry0_data[CENTRY_WIDTH-1:0] <= {CENTRY_WIDTH{1'b0}};
  else if(ifu_iu_pcfifo_create0_en && create_entry0_available)
    create_entry0_data[CENTRY_WIDTH-1:0] <= ifu_create0_data[CENTRY_WIDTH-1:0];
  else
    create_entry0_data[CENTRY_WIDTH-1:0] <= create_entry0_data[CENTRY_WIDTH-1:0];
end

//----------------------------------------------------------
//                     Entry 1 Data
//----------------------------------------------------------
always @(posedge entry1_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    create_entry1_data[CENTRY_WIDTH-1:0] <= {CENTRY_WIDTH{1'b0}};
  else if(ifu_iu_pcfifo_create1_en && create_entry1_available)
    create_entry1_data[CENTRY_WIDTH-1:0] <= ifu_create1_data[CENTRY_WIDTH-1:0];
  else
    create_entry1_data[CENTRY_WIDTH-1:0] <= create_entry1_data[CENTRY_WIDTH-1:0];
end

//----------------------------------------------------------
//                    Rename for Create
//----------------------------------------------------------
assign create_entry0_cur_pc[39:0]  = create_entry0_data[39:0];
assign create_entry0_tar_pc[39:0]  = create_entry0_data[79:40];
assign create_entry0_bht_pred      = create_entry0_data[80];
assign create_entry0_jal           = create_entry0_data[81];
assign create_entry0_jalr          = create_entry0_data[82];
assign create_entry0_dst_vld       = create_entry0_data[83];
assign create_entry0_jmp_mispred   = create_entry0_data[84];
assign create_entry0_chk_idx[24:0] = create_entry0_data[109:85];

assign create_entry1_cur_pc[39:0]  = create_entry1_data[39:0];
assign create_entry1_tar_pc[39:0]  = create_entry1_data[79:40];
assign create_entry1_bht_pred      = create_entry1_data[80];
//assign create_entry1_jal           = create_entry1_data[81];
assign create_entry1_jalr          = create_entry1_data[82];
assign create_entry1_dst_vld       = create_entry1_data[83];
assign create_entry1_jmp_mispred   = create_entry1_data[84];
assign create_entry1_chk_idx[24:0] = create_entry1_data[109:85];

//==========================================================
//                   PCFIFO Create Control
//==========================================================
assign pcfifo_create0_2_entry = create_entry0_dst_vld;

//----------------------------------------------------------
//                      Create Enable
//----------------------------------------------------------
assign pcfifo_create0_en = create_entry0_vld
                           && !iu_yy_xx_cancel
                           && !rtu_iu_flush_fe;
assign pcfifo_create1_en = (create_entry0_vld && pcfifo_create0_2_entry
                         || create_entry1_vld)
                           && !iu_yy_xx_cancel
                           && !rtu_iu_flush_fe;
assign pcfifo_create2_en = create_entry0_vld && create_entry1_vld
                           && (create_entry0_dst_vld
                            || create_entry1_dst_vld)
                           && !iu_yy_xx_cancel
                           && !rtu_iu_flush_fe;

//----------------------------------------------------------
//                       Create Data
//----------------------------------------------------------
//create0 pc
assign pcfifo_create0_data[39:0]  = (create_entry0_jalr && !create_entry0_dst_vld)
                                    ? create_entry0_tar_pc[39:0]
                                    : create_entry0_cur_pc[39:0];
//create1 pc
// &CombBeg; @288
always @( create_entry0_jal
       or create_entry1_dst_vld
       or create_entry0_jalr
       or create_entry1_jalr
       or create_entry1_tar_pc[39:0]
       or create_entry0_cur_pc[39:0]
       or create_entry1_cur_pc[39:0]
       or create_entry0_tar_pc[39:0]
       or create_entry0_dst_vld)
begin
  if(create_entry0_jal && create_entry0_dst_vld)
    pcfifo_create1_data_lsb[39:0]     = create_entry0_cur_pc[39:0];
  else if(create_entry0_jalr && create_entry0_dst_vld)
    pcfifo_create1_data_lsb[39:0]     = create_entry0_tar_pc[39:0];
  else if(create_entry1_jalr && !create_entry1_dst_vld)
    pcfifo_create1_data_lsb[39:0]     = create_entry1_tar_pc[39:0];
  else
    pcfifo_create1_data_lsb[39:0]     = create_entry1_cur_pc[39:0];
// &CombEnd; @297
end
assign pcfifo_create1_data[39:0] = pcfifo_create1_data_lsb[39:0];
//create2 pc
// &CombBeg; @300
always @( create_entry1_jalr
       or create_entry1_tar_pc[39:0]
       or create_entry1_cur_pc[39:0])
begin
  if(create_entry1_jalr)
    pcfifo_create2_data_lsb[39:0]     = create_entry1_tar_pc[39:0];
  else 
    pcfifo_create2_data_lsb[39:0]     = create_entry1_cur_pc[39:0];
// &CombEnd; @305
end
assign pcfifo_create2_data[39:0] = pcfifo_create2_data_lsb[39:0];

//create0 other info
assign pcfifo_create0_data[40]    = create_entry0_bht_pred;
assign pcfifo_create0_data[41]    = create_entry0_jmp_mispred;
assign pcfifo_create0_data[66:42] = create_entry0_chk_idx[24:0];
//create1 other info
assign pcfifo_create1_data[40]    = (pcfifo_create0_2_entry)
                                    ? create_entry0_bht_pred
                                    : create_entry1_bht_pred;
assign pcfifo_create1_data[41]    = (pcfifo_create0_2_entry)
                                    ? create_entry0_jmp_mispred
                                    : create_entry1_jmp_mispred;
assign pcfifo_create1_data[66:42] = (pcfifo_create0_2_entry)
                                    ? create_entry0_chk_idx[24:0]
                                    : create_entry1_chk_idx[24:0];
//create2 other info
assign pcfifo_create2_data[40]    = create_entry1_bht_pred;
assign pcfifo_create2_data[41]    = create_entry1_jmp_mispred;
assign pcfifo_create2_data[66:42] = create_entry1_chk_idx[24:0];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign create_ptr_clk_en = pcfifo_create0_en;
// &Instance("gated_clk_cell", "x_create_ptr_gated_clk"); @331
gated_clk_cell  x_create_ptr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_ptr_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_ptr_clk_en ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @332
//          .external_en (1'b0), @333
//          .global_en   (cp0_yy_clk_en), @334
//          .module_en   (cp0_iu_icg_en), @335
//          .local_en    (create_ptr_clk_en), @336
//          .clk_out     (create_ptr_clk)); @337

//----------------------------------------------------------
//                    Create Pointers
//----------------------------------------------------------
always @(posedge create_ptr_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pcfifo_create0_ptr[31:0] <= 32'h1;
  else if(pcfifo_create2_en)
    pcfifo_create0_ptr[31:0] <= {pcfifo_create0_ptr[28:0],
                                 pcfifo_create0_ptr[31:29]};
  else if(pcfifo_create1_en)
    pcfifo_create0_ptr[31:0] <= {pcfifo_create0_ptr[29:0],
                                 pcfifo_create0_ptr[31:30]};
  else if(pcfifo_create0_en)
    pcfifo_create0_ptr[31:0] <= {pcfifo_create0_ptr[30:0],
                                 pcfifo_create0_ptr[31]};
  else
    pcfifo_create0_ptr[31:0] <= pcfifo_create0_ptr[31:0];
end

assign pcfifo_create1_ptr[31:0] = {pcfifo_create0_ptr[30:0],
                                   pcfifo_create0_ptr[31]};
assign pcfifo_create2_ptr[31:0] = {pcfifo_create0_ptr[29:0],
                                   pcfifo_create0_ptr[31:30]};
assign pcfifo_create3_ptr[31:0] = {pcfifo_create0_ptr[28:0],
                                   pcfifo_create0_ptr[31:29]};
assign pcfifo_create5_ptr[31:0] = {pcfifo_create0_ptr[26:0],
                                   pcfifo_create0_ptr[31:27]};

//encode for assign ptr
assign pcfifo_create0_ptr_encode_expand[31:0] = pcfifo_create0_ptr[31:0];
assign pcfifo_create1_ptr_encode_expand[31:0] = pcfifo_create1_ptr[31:0];
assign pcfifo_create2_ptr_encode_expand[31:0] = pcfifo_create2_ptr[31:0];
assign pcfifo_create3_ptr_encode_expand[31:0] = pcfifo_create3_ptr[31:0];

// &ConnRule(s/^x_num/pcfifo_create0_ptr_encode/); @374
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_pcfifo_create0_ptr_encode"); @375
ct_rtu_encode_32  x_ct_rtu_encode_32_pcfifo_create0_ptr_encode (
  .x_num                            (pcfifo_create0_ptr_encode       ),
  .x_num_expand                     (pcfifo_create0_ptr_encode_expand)
);

// &ConnRule(s/^x_num/pcfifo_create1_ptr_encode/); @376
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_pcfifo_create1_ptr_encode"); @377
ct_rtu_encode_32  x_ct_rtu_encode_32_pcfifo_create1_ptr_encode (
  .x_num                            (pcfifo_create1_ptr_encode       ),
  .x_num_expand                     (pcfifo_create1_ptr_encode_expand)
);

// &ConnRule(s/^x_num/pcfifo_create2_ptr_encode/); @378
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_pcfifo_create2_ptr_encode"); @379
ct_rtu_encode_32  x_ct_rtu_encode_32_pcfifo_create2_ptr_encode (
  .x_num                            (pcfifo_create2_ptr_encode       ),
  .x_num_expand                     (pcfifo_create2_ptr_encode_expand)
);

// &ConnRule(s/^x_num/pcfifo_create3_ptr_encode/); @380
// &Instance("ct_rtu_encode_32","x_ct_rtu_encode_32_pcfifo_create3_ptr_encode"); @381
ct_rtu_encode_32  x_ct_rtu_encode_32_pcfifo_create3_ptr_encode (
  .x_num                            (pcfifo_create3_ptr_encode       ),
  .x_num_expand                     (pcfifo_create3_ptr_encode_expand)
);


//----------------------------------------------------------
//                    Create Ports
//----------------------------------------------------------
assign cen0[31:0] = {32{pcfifo_create0_en}} & pcfifo_create0_ptr[31:0];
assign cen1[31:0] = {32{pcfifo_create1_en}} & pcfifo_create1_ptr[31:0];
assign cen2[31:0] = {32{pcfifo_create2_en}} & pcfifo_create2_ptr[31:0];

//rename for entries
assign entry0_create_en[2:0]  = {cen2[0], cen1[0], cen0[0]};
assign entry1_create_en[2:0]  = {cen2[1], cen1[1], cen0[1]};
assign entry2_create_en[2:0]  = {cen2[2], cen1[2], cen0[2]};
assign entry3_create_en[2:0]  = {cen2[3], cen1[3], cen0[3]};
assign entry4_create_en[2:0]  = {cen2[4], cen1[4], cen0[4]};
assign entry5_create_en[2:0]  = {cen2[5], cen1[5], cen0[5]};
assign entry6_create_en[2:0]  = {cen2[6], cen1[6], cen0[6]};
assign entry7_create_en[2:0]  = {cen2[7], cen1[7], cen0[7]};
assign entry8_create_en[2:0]  = {cen2[8], cen1[8], cen0[8]};
assign entry9_create_en[2:0]  = {cen2[9], cen1[9], cen0[9]};
assign entry10_create_en[2:0] = {cen2[10],cen1[10],cen0[10]};
assign entry11_create_en[2:0] = {cen2[11],cen1[11],cen0[11]};
assign entry12_create_en[2:0] = {cen2[12],cen1[12],cen0[12]};
assign entry13_create_en[2:0] = {cen2[13],cen1[13],cen0[13]};
assign entry14_create_en[2:0] = {cen2[14],cen1[14],cen0[14]};
assign entry15_create_en[2:0] = {cen2[15],cen1[15],cen0[15]};
assign entry16_create_en[2:0] = {cen2[16],cen1[16],cen0[16]};
assign entry17_create_en[2:0] = {cen2[17],cen1[17],cen0[17]};
assign entry18_create_en[2:0] = {cen2[18],cen1[18],cen0[18]};
assign entry19_create_en[2:0] = {cen2[19],cen1[19],cen0[19]};
assign entry20_create_en[2:0] = {cen2[20],cen1[20],cen0[20]};
assign entry21_create_en[2:0] = {cen2[21],cen1[21],cen0[21]};
assign entry22_create_en[2:0] = {cen2[22],cen1[22],cen0[22]};
assign entry23_create_en[2:0] = {cen2[23],cen1[23],cen0[23]};
assign entry24_create_en[2:0] = {cen2[24],cen1[24],cen0[24]};
assign entry25_create_en[2:0] = {cen2[25],cen1[25],cen0[25]};
assign entry26_create_en[2:0] = {cen2[26],cen1[26],cen0[26]};
assign entry27_create_en[2:0] = {cen2[27],cen1[27],cen0[27]};
assign entry28_create_en[2:0] = {cen2[28],cen1[28],cen0[28]};
assign entry29_create_en[2:0] = {cen2[29],cen1[29],cen0[29]};
assign entry30_create_en[2:0] = {cen2[30],cen1[30],cen0[30]};
assign entry31_create_en[2:0] = {cen2[31],cen1[31],cen0[31]};
//==========================================================
//                      Assign PID
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign assign_ptr_clk_en = idu_iu_is_pcfifo_inst_vld
                           || iu_yy_xx_cancel
                           || rtu_iu_flush_fe;
// &Instance("gated_clk_cell", "x_assign_ptr_gated_clk"); @432
gated_clk_cell  x_assign_ptr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (assign_ptr_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (assign_ptr_clk_en ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @433
//          .external_en (1'b0), @434
//          .global_en   (cp0_yy_clk_en), @435
//          .module_en   (cp0_iu_icg_en), @436
//          .local_en    (assign_ptr_clk_en), @437
//          .clk_out     (assign_ptr_clk)); @438

//----------------------------------------------------------
//                    Create Pointers
//----------------------------------------------------------
always @(posedge assign_ptr_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    pcfifo_assign0_ptr[4:0] <= 5'd0;
    pcfifo_assign1_ptr[4:0] <= 5'd1;
    pcfifo_assign2_ptr[4:0] <= 5'd2;
    pcfifo_assign3_ptr[4:0] <= 5'd3;
  end
  else if(iu_yy_xx_cancel || rtu_iu_flush_fe) begin
    pcfifo_assign0_ptr[4:0] <= pcfifo_create0_ptr_encode[4:0];
    pcfifo_assign1_ptr[4:0] <= pcfifo_create1_ptr_encode[4:0];
    pcfifo_assign2_ptr[4:0] <= pcfifo_create2_ptr_encode[4:0];
    pcfifo_assign3_ptr[4:0] <= pcfifo_create3_ptr_encode[4:0];
  end
  else if(idu_iu_is_pcfifo_inst_vld) begin
    pcfifo_assign0_ptr[4:0] <= pcfifo_assign0_ptr_updt_val[4:0];
    pcfifo_assign1_ptr[4:0] <= pcfifo_assign1_ptr_updt_val[4:0];
    pcfifo_assign2_ptr[4:0] <= pcfifo_assign2_ptr_updt_val[4:0];
    pcfifo_assign3_ptr[4:0] <= pcfifo_assign3_ptr_updt_val[4:0];
  end
  else begin
    pcfifo_assign0_ptr[4:0] <= pcfifo_assign0_ptr[4:0];
    pcfifo_assign1_ptr[4:0] <= pcfifo_assign1_ptr[4:0];
    pcfifo_assign2_ptr[4:0] <= pcfifo_assign2_ptr[4:0];
    pcfifo_assign3_ptr[4:0] <= pcfifo_assign3_ptr[4:0];
  end
end

//output to IDU IS dispatch
assign iu_idu_pcfifo_dis_inst0_pid[4:0] = pcfifo_assign0_ptr[4:0];
assign iu_idu_pcfifo_dis_inst1_pid[4:0] = pcfifo_assign1_ptr[4:0];
assign iu_idu_pcfifo_dis_inst2_pid[4:0] = pcfifo_assign2_ptr[4:0];
assign iu_idu_pcfifo_dis_inst3_pid[4:0] = pcfifo_assign3_ptr[4:0];

//expand for pop ptr
// &ConnRule(s/^x_num/pcfifo_assign0_ptr/); @478
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_pcfifo_assign0_ptr"); @479
ct_rtu_expand_32  x_ct_rtu_expand_32_pcfifo_assign0_ptr (
  .x_num                     (pcfifo_assign0_ptr       ),
  .x_num_expand              (pcfifo_assign0_ptr_expand)
);


//----------------------------------------------------------
//                     Update value
//----------------------------------------------------------
assign pcfifo_assign0_ptr_updt_val[4:0] =
         pcfifo_assign0_ptr[4:0] + {2'b0, idu_iu_is_pcfifo_inst_num[2:0]};
assign pcfifo_assign1_ptr_updt_val[4:0] =
         pcfifo_assign1_ptr[4:0] + {2'b0, idu_iu_is_pcfifo_inst_num[2:0]};
assign pcfifo_assign2_ptr_updt_val[4:0] =
         pcfifo_assign2_ptr[4:0] + {2'b0, idu_iu_is_pcfifo_inst_num[2:0]};
assign pcfifo_assign3_ptr_updt_val[4:0] =
         pcfifo_assign3_ptr[4:0] + {2'b0, idu_iu_is_pcfifo_inst_num[2:0]};
//assign pcfifo_assign0_ptr_inc_val[4:0] =
//         pcfifo_assign0_ptr[4:0] + {2'b0, idu_iu_is_pcfifo_inst_num[2:0]};
//assign pcfifo_assign1_ptr_inc_val[4:0] =
//         pcfifo_assign1_ptr[4:0] + {2'b0, idu_iu_is_pcfifo_inst_num[2:0]};
//assign pcfifo_assign2_ptr_inc_val[4:0] =
//         pcfifo_assign2_ptr[4:0] + {2'b0, idu_iu_is_pcfifo_inst_num[2:0]};
//assign pcfifo_assign3_ptr_inc_val[4:0] =
//         pcfifo_assign3_ptr[4:0] + {2'b0, idu_iu_is_pcfifo_inst_num[2:0]};
//
//&CombBeg;
//  if(pcfifo_assign0_ptr_inc_val[4:0] == 5'd27)
//    pcfifo_assign0_ptr_updt_val[4:0] = 5'd3;
//  else if(pcfifo_assign0_ptr_inc_val[4:0] == 5'd26)
//    pcfifo_assign0_ptr_updt_val[4:0] = 5'd2;
//  else if(pcfifo_assign0_ptr_inc_val[4:0] == 5'd25)
//    pcfifo_assign0_ptr_updt_val[4:0] = 5'd1;
//  else if(pcfifo_assign0_ptr_inc_val[4:0] == 5'd24)
//    pcfifo_assign0_ptr_updt_val[4:0] = 5'd0;
//  else
//    pcfifo_assign0_ptr_updt_val[4:0] = pcfifo_assign0_ptr_inc_val[4:0];
//&CombEnd;
//
//&CombBeg;
//  if(pcfifo_assign1_ptr_inc_val[4:0] == 5'd27)
//    pcfifo_assign1_ptr_updt_val[4:0] = 5'd3;
//  else if(pcfifo_assign1_ptr_inc_val[4:0] == 5'd26)
//    pcfifo_assign1_ptr_updt_val[4:0] = 5'd2;
//  else if(pcfifo_assign1_ptr_inc_val[4:0] == 5'd25)
//    pcfifo_assign1_ptr_updt_val[4:0] = 5'd1;
//  else if(pcfifo_assign1_ptr_inc_val[4:0] == 5'd24)
//    pcfifo_assign1_ptr_updt_val[4:0] = 5'd0;
//  else 
//    pcfifo_assign1_ptr_updt_val[4:0] = pcfifo_assign1_ptr_inc_val[4:0];
//&CombEnd;
//
//&CombBeg;
//  if(pcfifo_assign2_ptr_inc_val[4:0] == 5'd27)
//    pcfifo_assign2_ptr_updt_val[4:0] = 5'd3;
//  else if(pcfifo_assign2_ptr_inc_val[4:0] == 5'd26)
//    pcfifo_assign2_ptr_updt_val[4:0] = 5'd2;
//  else if(pcfifo_assign2_ptr_inc_val[4:0] == 5'd25)
//    pcfifo_assign2_ptr_updt_val[4:0] = 5'd1;
//  else if(pcfifo_assign2_ptr_inc_val[4:0] == 5'd24)
//    pcfifo_assign2_ptr_updt_val[4:0] = 5'd0;
//  else 
//    pcfifo_assign2_ptr_updt_val[4:0] = pcfifo_assign2_ptr_inc_val[4:0];
//&CombEnd;
//
//&CombBeg;
//  if(pcfifo_assign3_ptr_inc_val[4:0] == 5'd27)
//    pcfifo_assign3_ptr_updt_val[4:0] = 5'd3;
//  else if(pcfifo_assign3_ptr_inc_val[4:0] == 5'd26)
//    pcfifo_assign3_ptr_updt_val[4:0] = 5'd2;
//  else if(pcfifo_assign3_ptr_inc_val[4:0] == 5'd25)
//    pcfifo_assign3_ptr_updt_val[4:0] = 5'd1;
//  else if(pcfifo_assign3_ptr_inc_val[4:0] == 5'd24)
//    pcfifo_assign3_ptr_updt_val[4:0] = 5'd0;
//  else
//    pcfifo_assign3_ptr_updt_val[4:0] = pcfifo_assign3_ptr_inc_val[4:0];
//&CombEnd;

//==========================================================
//                      PCFIFO Full
//==========================================================
//get entry valid siganls
assign entry_vld[0]  = entry0_vld;
assign entry_vld[1]  = entry1_vld;
assign entry_vld[2]  = entry2_vld;
assign entry_vld[3]  = entry3_vld;
assign entry_vld[4]  = entry4_vld;
assign entry_vld[5]  = entry5_vld;
assign entry_vld[6]  = entry6_vld;
assign entry_vld[7]  = entry7_vld;
assign entry_vld[8]  = entry8_vld;
assign entry_vld[9]  = entry9_vld;
assign entry_vld[10] = entry10_vld;
assign entry_vld[11] = entry11_vld;
assign entry_vld[12] = entry12_vld;
assign entry_vld[13] = entry13_vld;
assign entry_vld[14] = entry14_vld;
assign entry_vld[15] = entry15_vld;
assign entry_vld[16] = entry16_vld;
assign entry_vld[17] = entry17_vld;
assign entry_vld[18] = entry18_vld;
assign entry_vld[19] = entry19_vld;
assign entry_vld[20] = entry20_vld;
assign entry_vld[21] = entry21_vld;
assign entry_vld[22] = entry22_vld;
assign entry_vld[23] = entry23_vld;
assign entry_vld[24] = entry24_vld;
assign entry_vld[25] = entry25_vld;
assign entry_vld[26] = entry26_vld;
assign entry_vld[27] = entry27_vld;
assign entry_vld[28] = entry28_vld;
assign entry_vld[29] = entry29_vld;
assign entry_vld[30] = entry30_vld;
assign entry_vld[31] = entry31_vld;

//if less than 6 entry valid, pcfifo full
assign pcfifo_full  = |(pcfifo_create5_ptr[31:0] & entry_vld[31:0]);
//signal IFU full when pcfifo full
assign iu_ifu_pcfifo_full  = pcfifo_full;
assign bju_top_pcfifo_full = pcfifo_full;

//==========================================================
//                      PCFIFO flush
//==========================================================
//get entry flush bits for verification
assign entry_flush[0]  = entry0_flush;
assign entry_flush[1]  = entry1_flush;
assign entry_flush[2]  = entry2_flush;
assign entry_flush[3]  = entry3_flush;
assign entry_flush[4]  = entry4_flush;
assign entry_flush[5]  = entry5_flush;
assign entry_flush[6]  = entry6_flush;
assign entry_flush[7]  = entry7_flush;
assign entry_flush[8]  = entry8_flush;
assign entry_flush[9]  = entry9_flush;
assign entry_flush[10] = entry10_flush;
assign entry_flush[11] = entry11_flush;
assign entry_flush[12] = entry12_flush;
assign entry_flush[13] = entry13_flush;
assign entry_flush[14] = entry14_flush;
assign entry_flush[15] = entry15_flush;
assign entry_flush[16] = entry16_flush;
assign entry_flush[17] = entry17_flush;
assign entry_flush[18] = entry18_flush;
assign entry_flush[19] = entry19_flush;
assign entry_flush[20] = entry20_flush;
assign entry_flush[21] = entry21_flush;
assign entry_flush[22] = entry22_flush;
assign entry_flush[23] = entry23_flush;
assign entry_flush[24] = entry24_flush;
assign entry_flush[25] = entry25_flush;
assign entry_flush[26] = entry26_flush;
assign entry_flush[27] = entry27_flush;
assign entry_flush[28] = entry28_flush;
assign entry_flush[29] = entry29_flush;
assign entry_flush[30] = entry30_flush;
assign entry_flush[31] = entry31_flush;

// &Force ("nonport","entry_flush"); @633

//==========================================================
//                  RF stage Read Ports
//==========================================================
//----------------------------------------------------------
//                  Read Port 0 for BJU
//----------------------------------------------------------
// &CombBeg; @641
always @( entry25_rf_read_data[66:0]
       or entry19_rf_read_data[66:0]
       or entry3_rf_read_data[66:0]
       or entry8_rf_read_data[66:0]
       or entry15_rf_read_data[66:0]
       or entry6_rf_read_data[66:0]
       or entry24_rf_read_data[66:0]
       or entry16_rf_read_data[66:0]
       or idu_iu_rf_pipe2_pid[4:0]
       or entry5_rf_read_data[66:0]
       or entry26_rf_read_data[66:0]
       or entry7_rf_read_data[66:0]
       or entry21_rf_read_data[66:0]
       or entry2_rf_read_data[66:0]
       or entry28_rf_read_data[66:0]
       or entry23_rf_read_data[66:0]
       or entry18_rf_read_data[66:0]
       or entry12_rf_read_data[66:0]
       or entry10_rf_read_data[66:0]
       or entry31_rf_read_data[66:0]
       or entry22_rf_read_data[66:0]
       or entry17_rf_read_data[66:0]
       or entry1_rf_read_data[66:0]
       or entry9_rf_read_data[66:0]
       or entry14_rf_read_data[66:0]
       or entry0_rf_read_data[66:0]
       or entry4_rf_read_data[66:0]
       or entry29_rf_read_data[66:0]
       or entry30_rf_read_data[66:0]
       or entry13_rf_read_data[66:0]
       or entry20_rf_read_data[66:0]
       or entry27_rf_read_data[66:0]
       or entry11_rf_read_data[66:0])
begin
  case (idu_iu_rf_pipe2_pid[4:0])
    5'd0   : pcfifo_bju_data[READ_WIDTH-1:0] = entry0_rf_read_data[READ_WIDTH-1:0];
    5'd1   : pcfifo_bju_data[READ_WIDTH-1:0] = entry1_rf_read_data[READ_WIDTH-1:0];
    5'd2   : pcfifo_bju_data[READ_WIDTH-1:0] = entry2_rf_read_data[READ_WIDTH-1:0];
    5'd3   : pcfifo_bju_data[READ_WIDTH-1:0] = entry3_rf_read_data[READ_WIDTH-1:0];
    5'd4   : pcfifo_bju_data[READ_WIDTH-1:0] = entry4_rf_read_data[READ_WIDTH-1:0];
    5'd5   : pcfifo_bju_data[READ_WIDTH-1:0] = entry5_rf_read_data[READ_WIDTH-1:0];
    5'd6   : pcfifo_bju_data[READ_WIDTH-1:0] = entry6_rf_read_data[READ_WIDTH-1:0];
    5'd7   : pcfifo_bju_data[READ_WIDTH-1:0] = entry7_rf_read_data[READ_WIDTH-1:0];
    5'd8   : pcfifo_bju_data[READ_WIDTH-1:0] = entry8_rf_read_data[READ_WIDTH-1:0];
    5'd9   : pcfifo_bju_data[READ_WIDTH-1:0] = entry9_rf_read_data[READ_WIDTH-1:0];
    5'd10  : pcfifo_bju_data[READ_WIDTH-1:0] = entry10_rf_read_data[READ_WIDTH-1:0];
    5'd11  : pcfifo_bju_data[READ_WIDTH-1:0] = entry11_rf_read_data[READ_WIDTH-1:0];
    5'd12  : pcfifo_bju_data[READ_WIDTH-1:0] = entry12_rf_read_data[READ_WIDTH-1:0];
    5'd13  : pcfifo_bju_data[READ_WIDTH-1:0] = entry13_rf_read_data[READ_WIDTH-1:0];
    5'd14  : pcfifo_bju_data[READ_WIDTH-1:0] = entry14_rf_read_data[READ_WIDTH-1:0];
    5'd15  : pcfifo_bju_data[READ_WIDTH-1:0] = entry15_rf_read_data[READ_WIDTH-1:0];
    5'd16  : pcfifo_bju_data[READ_WIDTH-1:0] = entry16_rf_read_data[READ_WIDTH-1:0];
    5'd17  : pcfifo_bju_data[READ_WIDTH-1:0] = entry17_rf_read_data[READ_WIDTH-1:0];
    5'd18  : pcfifo_bju_data[READ_WIDTH-1:0] = entry18_rf_read_data[READ_WIDTH-1:0];
    5'd19  : pcfifo_bju_data[READ_WIDTH-1:0] = entry19_rf_read_data[READ_WIDTH-1:0];
    5'd20  : pcfifo_bju_data[READ_WIDTH-1:0] = entry20_rf_read_data[READ_WIDTH-1:0];
    5'd21  : pcfifo_bju_data[READ_WIDTH-1:0] = entry21_rf_read_data[READ_WIDTH-1:0];
    5'd22  : pcfifo_bju_data[READ_WIDTH-1:0] = entry22_rf_read_data[READ_WIDTH-1:0];
    5'd23  : pcfifo_bju_data[READ_WIDTH-1:0] = entry23_rf_read_data[READ_WIDTH-1:0];
    5'd24  : pcfifo_bju_data[READ_WIDTH-1:0] = entry24_rf_read_data[READ_WIDTH-1:0];
    5'd25  : pcfifo_bju_data[READ_WIDTH-1:0] = entry25_rf_read_data[READ_WIDTH-1:0];
    5'd26  : pcfifo_bju_data[READ_WIDTH-1:0] = entry26_rf_read_data[READ_WIDTH-1:0];
    5'd27  : pcfifo_bju_data[READ_WIDTH-1:0] = entry27_rf_read_data[READ_WIDTH-1:0];
    5'd28  : pcfifo_bju_data[READ_WIDTH-1:0] = entry28_rf_read_data[READ_WIDTH-1:0];
    5'd29  : pcfifo_bju_data[READ_WIDTH-1:0] = entry29_rf_read_data[READ_WIDTH-1:0];
    5'd30  : pcfifo_bju_data[READ_WIDTH-1:0] = entry30_rf_read_data[READ_WIDTH-1:0];
    5'd31  : pcfifo_bju_data[READ_WIDTH-1:0] = entry31_rf_read_data[READ_WIDTH-1:0];
    default: pcfifo_bju_data[READ_WIDTH-1:0] = {READ_WIDTH{1'bx}};
  endcase
// &CombEnd; @677
end

assign pcfifo_bju_pc[39:0]      = pcfifo_bju_data[39:0];
assign pcfifo_bju_bht_pred      = pcfifo_bju_data[40];
assign pcfifo_bju_jmp_mispred   = pcfifo_bju_data[41];
assign pcfifo_bju_chk_idx[24:0] = pcfifo_bju_data[66:42];

//----------------------------------------------------------
//                 Read Port 1 for PCGEN
//----------------------------------------------------------
// &CombBeg; @687
always @( entry25_rf_read_data[66:0]
       or entry19_rf_read_data[66:0]
       or entry3_rf_read_data[66:0]
       or entry8_rf_read_data[66:0]
       or entry15_rf_read_data[66:0]
       or entry6_rf_read_data[66:0]
       or entry24_rf_read_data[66:0]
       or entry16_rf_read_data[66:0]
       or entry26_rf_read_data[66:0]
       or entry5_rf_read_data[66:0]
       or entry7_rf_read_data[66:0]
       or entry21_rf_read_data[66:0]
       or entry2_rf_read_data[66:0]
       or entry28_rf_read_data[66:0]
       or entry23_rf_read_data[66:0]
       or entry18_rf_read_data[66:0]
       or entry31_rf_read_data[66:0]
       or entry10_rf_read_data[66:0]
       or entry12_rf_read_data[66:0]
       or entry17_rf_read_data[66:0]
       or entry22_rf_read_data[66:0]
       or entry1_rf_read_data[66:0]
       or entry9_rf_read_data[66:0]
       or entry0_rf_read_data[66:0]
       or idu_iu_rf_pipe0_pid[4:0]
       or entry14_rf_read_data[66:0]
       or entry4_rf_read_data[66:0]
       or entry29_rf_read_data[66:0]
       or entry13_rf_read_data[66:0]
       or entry30_rf_read_data[66:0]
       or entry20_rf_read_data[66:0]
       or entry27_rf_read_data[66:0]
       or entry11_rf_read_data[66:0])
begin
  case (idu_iu_rf_pipe0_pid[4:0])
    5'd0   : pcfifo_special_data[READ_WIDTH-1:0] = entry0_rf_read_data[READ_WIDTH-1:0];
    5'd1   : pcfifo_special_data[READ_WIDTH-1:0] = entry1_rf_read_data[READ_WIDTH-1:0];
    5'd2   : pcfifo_special_data[READ_WIDTH-1:0] = entry2_rf_read_data[READ_WIDTH-1:0];
    5'd3   : pcfifo_special_data[READ_WIDTH-1:0] = entry3_rf_read_data[READ_WIDTH-1:0];
    5'd4   : pcfifo_special_data[READ_WIDTH-1:0] = entry4_rf_read_data[READ_WIDTH-1:0];
    5'd5   : pcfifo_special_data[READ_WIDTH-1:0] = entry5_rf_read_data[READ_WIDTH-1:0];
    5'd6   : pcfifo_special_data[READ_WIDTH-1:0] = entry6_rf_read_data[READ_WIDTH-1:0];
    5'd7   : pcfifo_special_data[READ_WIDTH-1:0] = entry7_rf_read_data[READ_WIDTH-1:0];
    5'd8   : pcfifo_special_data[READ_WIDTH-1:0] = entry8_rf_read_data[READ_WIDTH-1:0];
    5'd9   : pcfifo_special_data[READ_WIDTH-1:0] = entry9_rf_read_data[READ_WIDTH-1:0];
    5'd10  : pcfifo_special_data[READ_WIDTH-1:0] = entry10_rf_read_data[READ_WIDTH-1:0];
    5'd11  : pcfifo_special_data[READ_WIDTH-1:0] = entry11_rf_read_data[READ_WIDTH-1:0];
    5'd12  : pcfifo_special_data[READ_WIDTH-1:0] = entry12_rf_read_data[READ_WIDTH-1:0];
    5'd13  : pcfifo_special_data[READ_WIDTH-1:0] = entry13_rf_read_data[READ_WIDTH-1:0];
    5'd14  : pcfifo_special_data[READ_WIDTH-1:0] = entry14_rf_read_data[READ_WIDTH-1:0];
    5'd15  : pcfifo_special_data[READ_WIDTH-1:0] = entry15_rf_read_data[READ_WIDTH-1:0];
    5'd16  : pcfifo_special_data[READ_WIDTH-1:0] = entry16_rf_read_data[READ_WIDTH-1:0];
    5'd17  : pcfifo_special_data[READ_WIDTH-1:0] = entry17_rf_read_data[READ_WIDTH-1:0];
    5'd18  : pcfifo_special_data[READ_WIDTH-1:0] = entry18_rf_read_data[READ_WIDTH-1:0];
    5'd19  : pcfifo_special_data[READ_WIDTH-1:0] = entry19_rf_read_data[READ_WIDTH-1:0];
    5'd20  : pcfifo_special_data[READ_WIDTH-1:0] = entry20_rf_read_data[READ_WIDTH-1:0];
    5'd21  : pcfifo_special_data[READ_WIDTH-1:0] = entry21_rf_read_data[READ_WIDTH-1:0];
    5'd22  : pcfifo_special_data[READ_WIDTH-1:0] = entry22_rf_read_data[READ_WIDTH-1:0];
    5'd23  : pcfifo_special_data[READ_WIDTH-1:0] = entry23_rf_read_data[READ_WIDTH-1:0];
    5'd24  : pcfifo_special_data[READ_WIDTH-1:0] = entry24_rf_read_data[READ_WIDTH-1:0];
    5'd25  : pcfifo_special_data[READ_WIDTH-1:0] = entry25_rf_read_data[READ_WIDTH-1:0];
    5'd26  : pcfifo_special_data[READ_WIDTH-1:0] = entry26_rf_read_data[READ_WIDTH-1:0];
    5'd27  : pcfifo_special_data[READ_WIDTH-1:0] = entry27_rf_read_data[READ_WIDTH-1:0];
    5'd28  : pcfifo_special_data[READ_WIDTH-1:0] = entry28_rf_read_data[READ_WIDTH-1:0];
    5'd29  : pcfifo_special_data[READ_WIDTH-1:0] = entry29_rf_read_data[READ_WIDTH-1:0];
    5'd30  : pcfifo_special_data[READ_WIDTH-1:0] = entry30_rf_read_data[READ_WIDTH-1:0];
    5'd31  : pcfifo_special_data[READ_WIDTH-1:0] = entry31_rf_read_data[READ_WIDTH-1:0];
    default: pcfifo_special_data[READ_WIDTH-1:0] = {READ_WIDTH{1'bx}};
  endcase
// &CombEnd; @723
end

assign bju_special_pc[39:0] = pcfifo_special_data[39:0];

//==========================================================
//                 EX1 stage Complete Port
//==========================================================
//----------------------------------------------------------
//                   Complete enable
//----------------------------------------------------------
assign pcfifo_ex2_cmplt[31:0] = {32{bju_pcfifo_ex2_inst_vld}}
                                & bju_pcfifo_ex2_pid_expand[31:0];

assign entry0_cmplt_en  = pcfifo_ex2_cmplt[0];
assign entry1_cmplt_en  = pcfifo_ex2_cmplt[1];
assign entry2_cmplt_en  = pcfifo_ex2_cmplt[2];
assign entry3_cmplt_en  = pcfifo_ex2_cmplt[3];
assign entry4_cmplt_en  = pcfifo_ex2_cmplt[4];
assign entry5_cmplt_en  = pcfifo_ex2_cmplt[5];
assign entry6_cmplt_en  = pcfifo_ex2_cmplt[6];
assign entry7_cmplt_en  = pcfifo_ex2_cmplt[7];
assign entry8_cmplt_en  = pcfifo_ex2_cmplt[8];
assign entry9_cmplt_en  = pcfifo_ex2_cmplt[9];
assign entry10_cmplt_en = pcfifo_ex2_cmplt[10];
assign entry11_cmplt_en = pcfifo_ex2_cmplt[11];
assign entry12_cmplt_en = pcfifo_ex2_cmplt[12];
assign entry13_cmplt_en = pcfifo_ex2_cmplt[13];
assign entry14_cmplt_en = pcfifo_ex2_cmplt[14];
assign entry15_cmplt_en = pcfifo_ex2_cmplt[15];
assign entry16_cmplt_en = pcfifo_ex2_cmplt[16];
assign entry17_cmplt_en = pcfifo_ex2_cmplt[17];
assign entry18_cmplt_en = pcfifo_ex2_cmplt[18];
assign entry19_cmplt_en = pcfifo_ex2_cmplt[19];
assign entry20_cmplt_en = pcfifo_ex2_cmplt[20];
assign entry21_cmplt_en = pcfifo_ex2_cmplt[21];
assign entry22_cmplt_en = pcfifo_ex2_cmplt[22];
assign entry23_cmplt_en = pcfifo_ex2_cmplt[23];
assign entry24_cmplt_en = pcfifo_ex2_cmplt[24];
assign entry25_cmplt_en = pcfifo_ex2_cmplt[25];
assign entry26_cmplt_en = pcfifo_ex2_cmplt[26];
assign entry27_cmplt_en = pcfifo_ex2_cmplt[27];
assign entry28_cmplt_en = pcfifo_ex2_cmplt[28];
assign entry29_cmplt_en = pcfifo_ex2_cmplt[29];
assign entry30_cmplt_en = pcfifo_ex2_cmplt[30];
assign entry31_cmplt_en = pcfifo_ex2_cmplt[31];

//----------------------------------------------------------
//                   Bypass Data Path
//----------------------------------------------------------
assign pcfifo_ex2_bypass_read_data[47]     = bju_pcfifo_ex2_length;
assign pcfifo_ex2_bypass_read_data[46]     = bju_pcfifo_ex2_bht_pred;
assign pcfifo_ex2_bypass_read_data[45]     = 1'b1;
assign pcfifo_ex2_bypass_read_data[44]     = bju_pcfifo_ex2_bht_mispred;
assign pcfifo_ex2_bypass_read_data[43]     = bju_pcfifo_ex2_jmp;
assign pcfifo_ex2_bypass_read_data[42]     = bju_pcfifo_ex2_pret;
assign pcfifo_ex2_bypass_read_data[41]     = bju_pcfifo_ex2_pcall;
assign pcfifo_ex2_bypass_read_data[40]     = bju_pcfifo_ex2_condbr;
assign pcfifo_ex2_bypass_read_data[39:0]   = bju_pcfifo_ex2_pc[39:0];

assign pcfifo_ex3_bypass_read_data[47]     = bju_pcfifo_ex3_length;
assign pcfifo_ex3_bypass_read_data[46]     = bju_pcfifo_ex3_bht_pred;
assign pcfifo_ex3_bypass_read_data[45]     = 1'b1;
assign pcfifo_ex3_bypass_read_data[44]     = bju_pcfifo_ex3_bht_mispred;
assign pcfifo_ex3_bypass_read_data[43]     = bju_pcfifo_ex3_jmp;
assign pcfifo_ex3_bypass_read_data[42]     = bju_pcfifo_ex3_pret;
assign pcfifo_ex3_bypass_read_data[41]     = bju_pcfifo_ex3_pcall;
assign pcfifo_ex3_bypass_read_data[40]     = bju_pcfifo_ex3_condbr;
assign pcfifo_ex3_bypass_read_data[39:0]   = bju_pcfifo_ex3_pc[39:0];

//==========================================================
//                Read Port for Read entry
//==========================================================
//----------------------------------------------------------
//              Read entry update data select
//----------------------------------------------------------
// &CombBeg; @798
always @( pcfifo_pop2_data[50:0]
       or pcfifo_pop1_data[50:0]
       or pcfifo_pop5_data[50:0]
       or pcfifo_pop4_data[50:0]
       or pcfifo_pop0_data[50:0]
       or pcfifo_pop3_data[50:0]
       or pcfifo_pop_inst_num[3:1])
begin
  if(pcfifo_pop_inst_num[3]) begin
    read_entry0_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop3_data[POP_WIDTH-1:0];
    read_entry1_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop4_data[POP_WIDTH-1:0];
    read_entry2_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop5_data[POP_WIDTH-1:0];

//    pcfifo_read_entry0_updt_ptr[31:0] = pcfifo_pop3_ptr[31:0];
//    pcfifo_read_entry1_updt_ptr[31:0] = pcfifo_pop4_ptr[31:0];
//    pcfifo_read_entry2_updt_ptr[31:0] = pcfifo_pop5_ptr[31:0];
  end
  else if(pcfifo_pop_inst_num[2]) begin
    read_entry0_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop2_data[POP_WIDTH-1:0];
    read_entry1_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop3_data[POP_WIDTH-1:0];
    read_entry2_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop4_data[POP_WIDTH-1:0];

//    pcfifo_read_entry0_updt_ptr[31:0] = pcfifo_pop2_ptr[31:0];
//    pcfifo_read_entry1_updt_ptr[31:0] = pcfifo_pop3_ptr[31:0];
//    pcfifo_read_entry2_updt_ptr[31:0] = pcfifo_pop4_ptr[31:0];
  end
  else if(pcfifo_pop_inst_num[1]) begin
    read_entry0_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop1_data[POP_WIDTH-1:0];
    read_entry1_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop2_data[POP_WIDTH-1:0];
    read_entry2_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop3_data[POP_WIDTH-1:0];

//    pcfifo_read_entry0_updt_ptr[31:0] = pcfifo_pop1_ptr[31:0];
//    pcfifo_read_entry1_updt_ptr[31:0] = pcfifo_pop2_ptr[31:0];
//    pcfifo_read_entry2_updt_ptr[31:0] = pcfifo_pop3_ptr[31:0];
  end
  else begin
    read_entry0_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop0_data[POP_WIDTH-1:0];
    read_entry1_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop1_data[POP_WIDTH-1:0];
    read_entry2_updt_data[POP_WIDTH-1:0] =
         pcfifo_pop2_data[POP_WIDTH-1:0];

//    pcfifo_read_entry0_updt_ptr[31:0] = pcfifo_pop0_ptr[31:0];
//    pcfifo_read_entry1_updt_ptr[31:0] = pcfifo_pop1_ptr[31:0];
//    pcfifo_read_entry2_updt_ptr[31:0] = pcfifo_pop2_ptr[31:0];
  end
// &CombEnd; @847
end

//----------------------------------------------------------
//             Read entry create data select
//----------------------------------------------------------
assign pcfifo_create_to_read_entry0_en = 
     pcfifo_pop0_data[PCFIFO_VLD]   && !read_entry0_rt_read_data[PCFIFO_VLD]
  || pcfifo_pop0_data[PCFIFO_CMPLT] && !read_entry0_rt_read_data[PCFIFO_CMPLT];
assign pcfifo_create_to_read_entry1_en =
     pcfifo_pop1_data[PCFIFO_VLD]   && !read_entry1_rt_read_data[PCFIFO_VLD]
  || pcfifo_pop1_data[PCFIFO_CMPLT] && !read_entry1_rt_read_data[PCFIFO_CMPLT];
assign pcfifo_create_to_read_entry2_en =
     pcfifo_pop2_data[PCFIFO_VLD]   && !read_entry2_rt_read_data[PCFIFO_VLD]
  || pcfifo_pop2_data[PCFIFO_CMPLT] && !read_entry2_rt_read_data[PCFIFO_CMPLT];

assign pcfifo_create_to_read_entry0_gateclk_en = pcfifo_create_to_read_entry0_en;
assign pcfifo_create_to_read_entry1_gateclk_en = pcfifo_create_to_read_entry1_en;
assign pcfifo_create_to_read_entry2_gateclk_en = pcfifo_create_to_read_entry2_en;

//mux between create and update
assign read_entry0_create_data[POP_WIDTH-1:0] = read_entry0_updt_data[POP_WIDTH-1:0];
assign read_entry1_create_data[POP_WIDTH-1:0] = read_entry1_updt_data[POP_WIDTH-1:0];
assign read_entry2_create_data[POP_WIDTH-1:0] = read_entry2_updt_data[POP_WIDTH-1:0];

//----------------------------------------------------------
//                Read entry create enable
//----------------------------------------------------------
assign read_entry0_create_en         = pcfifo_pop_vld
                                       || pcfifo_create_to_read_entry0_en;
assign read_entry1_create_en         = pcfifo_pop_vld
                                       || pcfifo_create_to_read_entry1_en;
assign read_entry2_create_en         = pcfifo_pop_vld
                                       || pcfifo_create_to_read_entry2_en;

assign read_entry0_create_gateclk_en = rtu_iu_rob_read_pcfifo_gateclk_vld
                                       || pcfifo_create_to_read_entry0_gateclk_en;
assign read_entry1_create_gateclk_en = rtu_iu_rob_read_pcfifo_gateclk_vld
                                       || pcfifo_create_to_read_entry1_gateclk_en;
assign read_entry2_create_gateclk_en = rtu_iu_rob_read_pcfifo_gateclk_vld
                                       || pcfifo_create_to_read_entry2_gateclk_en;

//----------------------------------------------------------
//                Read entry complete port
//----------------------------------------------------------
//assign read_entry0_cmplt_en         = bju_pcfifo_ex2_inst_vld
//                                      && (bju_pcfifo_ex2_pid_expand[31:0]
//                                          == pcfifo_read_entry0_updt_ptr[31:0]);
//assign read_entry1_cmplt_en         = bju_pcfifo_ex2_inst_vld
//                                      && (bju_pcfifo_ex2_pid_expand[31:0]
//                                          == pcfifo_read_entry1_updt_ptr[31:0]);
//assign read_entry2_cmplt_en         = bju_pcfifo_ex2_inst_vld
//                                      && (bju_pcfifo_ex2_pid_expand[31:0]
//                                          == pcfifo_read_entry2_updt_ptr[31:0]);
//
//assign read_entry0_cmplt_gateclk_en = bju_pcfifo_ex2_inst_vld;
//assign read_entry1_cmplt_gateclk_en = bju_pcfifo_ex2_inst_vld;
//assign read_entry2_cmplt_gateclk_en = bju_pcfifo_ex2_inst_vld;

//----------------------------------------------------------
//               Output Read Data for RTU
//----------------------------------------------------------
//do not need pop MSB vld and flush to rtu
// &CombBeg; @909
always @( read_entry0_rt_read_data[47:0]
       or pcfifo_ex3_bypass_read_data[47:0]
       or pcfifo_ex2_bypass_read_data[47:0]
       or pcfifo_pop0_bypass_sel[2:0])
begin
  case(pcfifo_pop0_bypass_sel[2:0])
    3'b001: iu_rtu_pcfifo_pop0_data[POP_WIDTH-4:0] = read_entry0_rt_read_data[POP_WIDTH-4:0];
    3'b010: iu_rtu_pcfifo_pop0_data[POP_WIDTH-4:0] = pcfifo_ex2_bypass_read_data[POP_WIDTH-4:0];
    3'b100: iu_rtu_pcfifo_pop0_data[POP_WIDTH-4:0] = pcfifo_ex3_bypass_read_data[POP_WIDTH-4:0];
    default:iu_rtu_pcfifo_pop0_data[POP_WIDTH-4:0] = {POP_WIDTH-3{1'bx}};
  endcase
// &CombEnd; @916
end

// &CombBeg; @918
always @( read_entry1_rt_read_data[47:0]
       or pcfifo_ex3_bypass_read_data[47:0]
       or pcfifo_ex2_bypass_read_data[47:0]
       or pcfifo_pop1_bypass_sel[2:0])
begin
  case(pcfifo_pop1_bypass_sel[2:0])
    3'b001: iu_rtu_pcfifo_pop1_data[POP_WIDTH-4:0] = read_entry1_rt_read_data[POP_WIDTH-4:0];
    3'b010: iu_rtu_pcfifo_pop1_data[POP_WIDTH-4:0] = pcfifo_ex2_bypass_read_data[POP_WIDTH-4:0];
    3'b100: iu_rtu_pcfifo_pop1_data[POP_WIDTH-4:0] = pcfifo_ex3_bypass_read_data[POP_WIDTH-4:0];
    default:iu_rtu_pcfifo_pop1_data[POP_WIDTH-4:0] = {POP_WIDTH-3{1'bx}};
  endcase
// &CombEnd; @925
end

// &CombBeg; @927
always @( pcfifo_ex3_bypass_read_data[47:0]
       or pcfifo_ex2_bypass_read_data[47:0]
       or read_entry2_rt_read_data[47:0]
       or pcfifo_pop2_bypass_sel[2:0])
begin
  case(pcfifo_pop2_bypass_sel[2:0])
    3'b001: iu_rtu_pcfifo_pop2_data[POP_WIDTH-4:0] = read_entry2_rt_read_data[POP_WIDTH-4:0];
    3'b010: iu_rtu_pcfifo_pop2_data[POP_WIDTH-4:0] = pcfifo_ex2_bypass_read_data[POP_WIDTH-4:0];
    3'b100: iu_rtu_pcfifo_pop2_data[POP_WIDTH-4:0] = pcfifo_ex3_bypass_read_data[POP_WIDTH-4:0];
    default:iu_rtu_pcfifo_pop2_data[POP_WIDTH-4:0] = {POP_WIDTH-3{1'bx}};
  endcase
// &CombEnd; @934
end

//==========================================================
//                      Pcfifo Pop
//==========================================================
//----------------------------------------------------------
//                Prepare Pop Pointer signals
//----------------------------------------------------------
assign pcfifo_pop_inst[2:0] = {rtu_iu_rob_read2_pcfifo_vld,
                               rtu_iu_rob_read1_pcfifo_vld,
                               rtu_iu_rob_read0_pcfifo_vld};

assign pcfifo_pop_vld       = |pcfifo_pop_inst[2:0];

assign pcfifo_pop_inst_num[3] = &pcfifo_pop_inst[2:0];
assign pcfifo_pop_inst_num[2] = 
     !pcfifo_pop_inst[2] &&  pcfifo_pop_inst[1] &&  pcfifo_pop_inst[0]
  ||  pcfifo_pop_inst[2] && !pcfifo_pop_inst[1] &&  pcfifo_pop_inst[0]
  ||  pcfifo_pop_inst[2] &&  pcfifo_pop_inst[1] && !pcfifo_pop_inst[0];
assign pcfifo_pop_inst_num[1] = 
     !pcfifo_pop_inst[2] && !pcfifo_pop_inst[1] &&  pcfifo_pop_inst[0]
  || !pcfifo_pop_inst[2] &&  pcfifo_pop_inst[1] && !pcfifo_pop_inst[0]
  ||  pcfifo_pop_inst[2] && !pcfifo_pop_inst[1] && !pcfifo_pop_inst[0];
assign pcfifo_pop_inst_num[0] = !(|pcfifo_pop_inst[2:0]);

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign pop_ptr_clk_en = rtu_iu_rob_read_pcfifo_gateclk_vld
                        || rtu_yy_xx_flush;
// &Instance("gated_clk_cell", "x_pop_ptr_gated_clk"); @964
gated_clk_cell  x_pop_ptr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pop_ptr_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pop_ptr_clk_en    ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @965
//          .external_en (1'b0), @966
//          .global_en   (cp0_yy_clk_en), @967
//          .module_en   (cp0_iu_icg_en), @968
//          .local_en    (pop_ptr_clk_en), @969
//          .clk_out     (pop_ptr_clk)); @970

//----------------------------------------------------------
//                      Pop Pointers
//----------------------------------------------------------
always @(posedge pop_ptr_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    pcfifo_pop0_ptr[31:0] <= 32'h1;
    pcfifo_pop0_pid[4:0]  <= 5'd0;
    pcfifo_pop1_pid[4:0]  <= 5'd1;
    pcfifo_pop2_pid[4:0]  <= 5'd2;
  end
  else if(rtu_yy_xx_flush && (iu_yy_xx_cancel || rtu_iu_flush_fe)) begin
    pcfifo_pop0_ptr[31:0] <= pcfifo_create0_ptr[31:0];
    pcfifo_pop0_pid[4:0]  <= pcfifo_create0_ptr_encode[4:0];
    pcfifo_pop1_pid[4:0]  <= pcfifo_create1_ptr_encode[4:0];
    pcfifo_pop2_pid[4:0]  <= pcfifo_create2_ptr_encode[4:0];
  end
  else if(rtu_yy_xx_flush) begin
    pcfifo_pop0_ptr[31:0] <= pcfifo_assign0_ptr_expand[31:0];
    pcfifo_pop0_pid[4:0]  <= pcfifo_assign0_ptr[4:0];
    pcfifo_pop1_pid[4:0]  <= pcfifo_assign1_ptr[4:0];
    pcfifo_pop2_pid[4:0]  <= pcfifo_assign2_ptr[4:0];
  end
  else if(pcfifo_pop_inst_num[3]) begin
    pcfifo_pop0_ptr[31:0] <= {pcfifo_pop0_ptr[28:0],pcfifo_pop0_ptr[31:29]};
    pcfifo_pop0_pid[4:0]  <= pcfifo_pop0_pid[4:0] + 5'd3;
    pcfifo_pop1_pid[4:0]  <= pcfifo_pop1_pid[4:0] + 5'd3;
    pcfifo_pop2_pid[4:0]  <= pcfifo_pop2_pid[4:0] + 5'd3;
  end
  else if(pcfifo_pop_inst_num[2]) begin
    pcfifo_pop0_ptr[31:0] <= {pcfifo_pop0_ptr[29:0],pcfifo_pop0_ptr[31:30]};
    pcfifo_pop0_pid[4:0]  <= pcfifo_pop0_pid[4:0] + 5'd2;
    pcfifo_pop1_pid[4:0]  <= pcfifo_pop1_pid[4:0] + 5'd2;
    pcfifo_pop2_pid[4:0]  <= pcfifo_pop2_pid[4:0] + 5'd2;
  end
  else if(pcfifo_pop_inst_num[1]) begin
    pcfifo_pop0_ptr[31:0] <= {pcfifo_pop0_ptr[30:0],pcfifo_pop0_ptr[31]};
    pcfifo_pop0_pid[4:0]  <= pcfifo_pop0_pid[4:0] + 5'd1;
    pcfifo_pop1_pid[4:0]  <= pcfifo_pop1_pid[4:0] + 5'd1;
    pcfifo_pop2_pid[4:0]  <= pcfifo_pop2_pid[4:0] + 5'd1;
  end
  else begin
    pcfifo_pop0_ptr[31:0] <= pcfifo_pop0_ptr[31:0];
    pcfifo_pop0_pid[4:0]  <= pcfifo_pop0_pid[4:0];
    pcfifo_pop1_pid[4:0]  <= pcfifo_pop1_pid[4:0];
    pcfifo_pop2_pid[4:0]  <= pcfifo_pop2_pid[4:0];
  end
end

assign pcfifo_pop1_ptr[31:0] = {pcfifo_pop0_ptr[30:0],pcfifo_pop0_ptr[31]};
assign pcfifo_pop2_ptr[31:0] = {pcfifo_pop0_ptr[29:0],pcfifo_pop0_ptr[31:30]};
assign pcfifo_pop3_ptr[31:0] = {pcfifo_pop0_ptr[28:0],pcfifo_pop0_ptr[31:29]};
assign pcfifo_pop4_ptr[31:0] = {pcfifo_pop0_ptr[27:0],pcfifo_pop0_ptr[31:28]};
assign pcfifo_pop5_ptr[31:0] = {pcfifo_pop0_ptr[26:0],pcfifo_pop0_ptr[31:27]};

//----------------------------------------------------------
//                    Bypass valid
//----------------------------------------------------------
assign pcfifo_pop0_bypass_sel[0] = !pcfifo_pop0_bypass_sel[1] && !pcfifo_pop0_bypass_sel[2];
assign pcfifo_pop1_bypass_sel[0] = !pcfifo_pop1_bypass_sel[1] && !pcfifo_pop1_bypass_sel[2];
assign pcfifo_pop2_bypass_sel[0] = !pcfifo_pop2_bypass_sel[1] && !pcfifo_pop2_bypass_sel[2];

assign pcfifo_pop0_bypass_sel[1] = bju_pcfifo_ex2_inst_vld
                                   && (bju_pcfifo_ex2_pid[4:0] == pcfifo_pop0_pid[4:0]);
assign pcfifo_pop1_bypass_sel[1] = bju_pcfifo_ex2_inst_vld
                                   && (bju_pcfifo_ex2_pid[4:0] == pcfifo_pop1_pid[4:0]);
assign pcfifo_pop2_bypass_sel[1] = bju_pcfifo_ex2_inst_vld
                                   && (bju_pcfifo_ex2_pid[4:0] == pcfifo_pop2_pid[4:0]);

assign pcfifo_pop0_bypass_sel[2] = bju_pcfifo_ex3_inst_vld
                                   && (bju_pcfifo_ex3_pid[4:0] == pcfifo_pop0_pid[4:0]);
assign pcfifo_pop1_bypass_sel[2] = bju_pcfifo_ex3_inst_vld
                                   && (bju_pcfifo_ex3_pid[4:0] == pcfifo_pop1_pid[4:0]);
assign pcfifo_pop2_bypass_sel[2] = bju_pcfifo_ex3_inst_vld
                                   && (bju_pcfifo_ex3_pid[4:0] == pcfifo_pop2_pid[4:0]);

//----------------------------------------------------------
//                      Pop Ports
//----------------------------------------------------------
assign entry_pop_en[31:0] = {32{|(pcfifo_pop_inst_num[3:1])}} & pcfifo_pop0_ptr[31:0]
                          | {32{|(pcfifo_pop_inst_num[3:2])}} & pcfifo_pop1_ptr[31:0]
                          | {32{pcfifo_pop_inst_num[3]}}      & pcfifo_pop2_ptr[31:0];
assign entry_pop_gateclk_en[31:0] = {32{rtu_iu_rob_read_pcfifo_gateclk_vld}}
                                    & (pcfifo_pop0_ptr[31:0]
                                     | pcfifo_pop1_ptr[31:0]
                                     | pcfifo_pop2_ptr[31:0]);

//rename for entries
assign entry0_pop_en  = entry_pop_en[0];
assign entry1_pop_en  = entry_pop_en[1];
assign entry2_pop_en  = entry_pop_en[2];
assign entry3_pop_en  = entry_pop_en[3];
assign entry4_pop_en  = entry_pop_en[4];
assign entry5_pop_en  = entry_pop_en[5];
assign entry6_pop_en  = entry_pop_en[6];
assign entry7_pop_en  = entry_pop_en[7];
assign entry8_pop_en  = entry_pop_en[8];
assign entry9_pop_en  = entry_pop_en[9];
assign entry10_pop_en = entry_pop_en[10];
assign entry11_pop_en = entry_pop_en[11];
assign entry12_pop_en = entry_pop_en[12];
assign entry13_pop_en = entry_pop_en[13];
assign entry14_pop_en = entry_pop_en[14];
assign entry15_pop_en = entry_pop_en[15];
assign entry16_pop_en = entry_pop_en[16];
assign entry17_pop_en = entry_pop_en[17];
assign entry18_pop_en = entry_pop_en[18];
assign entry19_pop_en = entry_pop_en[19];
assign entry20_pop_en = entry_pop_en[20];
assign entry21_pop_en = entry_pop_en[21];
assign entry22_pop_en = entry_pop_en[22];
assign entry23_pop_en = entry_pop_en[23];
assign entry24_pop_en = entry_pop_en[24];
assign entry25_pop_en = entry_pop_en[25];
assign entry26_pop_en = entry_pop_en[26];
assign entry27_pop_en = entry_pop_en[27];
assign entry28_pop_en = entry_pop_en[28];
assign entry29_pop_en = entry_pop_en[29];
assign entry30_pop_en = entry_pop_en[30];
assign entry31_pop_en = entry_pop_en[31];

assign entry0_pop_gateclk_en  = entry_pop_gateclk_en[0];
assign entry1_pop_gateclk_en  = entry_pop_gateclk_en[1];
assign entry2_pop_gateclk_en  = entry_pop_gateclk_en[2];
assign entry3_pop_gateclk_en  = entry_pop_gateclk_en[3];
assign entry4_pop_gateclk_en  = entry_pop_gateclk_en[4];
assign entry5_pop_gateclk_en  = entry_pop_gateclk_en[5];
assign entry6_pop_gateclk_en  = entry_pop_gateclk_en[6];
assign entry7_pop_gateclk_en  = entry_pop_gateclk_en[7];
assign entry8_pop_gateclk_en  = entry_pop_gateclk_en[8];
assign entry9_pop_gateclk_en  = entry_pop_gateclk_en[9];
assign entry10_pop_gateclk_en = entry_pop_gateclk_en[10];
assign entry11_pop_gateclk_en = entry_pop_gateclk_en[11];
assign entry12_pop_gateclk_en = entry_pop_gateclk_en[12];
assign entry13_pop_gateclk_en = entry_pop_gateclk_en[13];
assign entry14_pop_gateclk_en = entry_pop_gateclk_en[14];
assign entry15_pop_gateclk_en = entry_pop_gateclk_en[15];
assign entry16_pop_gateclk_en = entry_pop_gateclk_en[16];
assign entry17_pop_gateclk_en = entry_pop_gateclk_en[17];
assign entry18_pop_gateclk_en = entry_pop_gateclk_en[18];
assign entry19_pop_gateclk_en = entry_pop_gateclk_en[19];
assign entry20_pop_gateclk_en = entry_pop_gateclk_en[20];
assign entry21_pop_gateclk_en = entry_pop_gateclk_en[21];
assign entry22_pop_gateclk_en = entry_pop_gateclk_en[22];
assign entry23_pop_gateclk_en = entry_pop_gateclk_en[23];
assign entry24_pop_gateclk_en = entry_pop_gateclk_en[24];
assign entry25_pop_gateclk_en = entry_pop_gateclk_en[25];
assign entry26_pop_gateclk_en = entry_pop_gateclk_en[26];
assign entry27_pop_gateclk_en = entry_pop_gateclk_en[27];
assign entry28_pop_gateclk_en = entry_pop_gateclk_en[28];
assign entry29_pop_gateclk_en = entry_pop_gateclk_en[29];
assign entry30_pop_gateclk_en = entry_pop_gateclk_en[30];
assign entry31_pop_gateclk_en = entry_pop_gateclk_en[31];

//----------------------------------------------------------
//                 Read Port for RTU
//----------------------------------------------------------
// &CombBeg; @1129
always @( entry26_rt_read_data[50:0]
       or entry16_rt_read_data[50:0]
       or entry5_rt_read_data[50:0]
       or entry11_rt_read_data[50:0]
       or entry1_rt_read_data[50:0]
       or entry19_rt_read_data[50:0]
       or entry30_rt_read_data[50:0]
       or entry29_rt_read_data[50:0]
       or entry13_rt_read_data[50:0]
       or entry25_rt_read_data[50:0]
       or entry3_rt_read_data[50:0]
       or entry20_rt_read_data[50:0]
       or entry2_rt_read_data[50:0]
       or entry9_rt_read_data[50:0]
       or entry6_rt_read_data[50:0]
       or entry0_rt_read_data[50:0]
       or entry28_rt_read_data[50:0]
       or entry7_rt_read_data[50:0]
       or entry8_rt_read_data[50:0]
       or entry14_rt_read_data[50:0]
       or entry23_rt_read_data[50:0]
       or entry18_rt_read_data[50:0]
       or entry24_rt_read_data[50:0]
       or entry12_rt_read_data[50:0]
       or entry17_rt_read_data[50:0]
       or entry31_rt_read_data[50:0]
       or entry22_rt_read_data[50:0]
       or entry27_rt_read_data[50:0]
       or entry21_rt_read_data[50:0]
       or entry10_rt_read_data[50:0]
       or entry15_rt_read_data[50:0]
       or pcfifo_pop0_ptr[31:0]
       or entry4_rt_read_data[50:0])
begin
  case (pcfifo_pop0_ptr[31:0])
    32'h00000001: pcfifo_pop0_data[POP_WIDTH-1:0] = entry0_rt_read_data[POP_WIDTH-1:0];
    32'h00000002: pcfifo_pop0_data[POP_WIDTH-1:0] = entry1_rt_read_data[POP_WIDTH-1:0];
    32'h00000004: pcfifo_pop0_data[POP_WIDTH-1:0] = entry2_rt_read_data[POP_WIDTH-1:0];
    32'h00000008: pcfifo_pop0_data[POP_WIDTH-1:0] = entry3_rt_read_data[POP_WIDTH-1:0];
    32'h00000010: pcfifo_pop0_data[POP_WIDTH-1:0] = entry4_rt_read_data[POP_WIDTH-1:0];
    32'h00000020: pcfifo_pop0_data[POP_WIDTH-1:0] = entry5_rt_read_data[POP_WIDTH-1:0];
    32'h00000040: pcfifo_pop0_data[POP_WIDTH-1:0] = entry6_rt_read_data[POP_WIDTH-1:0];
    32'h00000080: pcfifo_pop0_data[POP_WIDTH-1:0] = entry7_rt_read_data[POP_WIDTH-1:0];
    32'h00000100: pcfifo_pop0_data[POP_WIDTH-1:0] = entry8_rt_read_data[POP_WIDTH-1:0];
    32'h00000200: pcfifo_pop0_data[POP_WIDTH-1:0] = entry9_rt_read_data[POP_WIDTH-1:0];
    32'h00000400: pcfifo_pop0_data[POP_WIDTH-1:0] = entry10_rt_read_data[POP_WIDTH-1:0];
    32'h00000800: pcfifo_pop0_data[POP_WIDTH-1:0] = entry11_rt_read_data[POP_WIDTH-1:0];
    32'h00001000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry12_rt_read_data[POP_WIDTH-1:0];
    32'h00002000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry13_rt_read_data[POP_WIDTH-1:0];
    32'h00004000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry14_rt_read_data[POP_WIDTH-1:0];
    32'h00008000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry15_rt_read_data[POP_WIDTH-1:0];
    32'h00010000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry16_rt_read_data[POP_WIDTH-1:0];
    32'h00020000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry17_rt_read_data[POP_WIDTH-1:0];
    32'h00040000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry18_rt_read_data[POP_WIDTH-1:0];
    32'h00080000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry19_rt_read_data[POP_WIDTH-1:0];
    32'h00100000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry20_rt_read_data[POP_WIDTH-1:0];
    32'h00200000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry21_rt_read_data[POP_WIDTH-1:0];
    32'h00400000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry22_rt_read_data[POP_WIDTH-1:0];
    32'h00800000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry23_rt_read_data[POP_WIDTH-1:0];
    32'h01000000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry24_rt_read_data[POP_WIDTH-1:0];
    32'h02000000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry25_rt_read_data[POP_WIDTH-1:0];
    32'h04000000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry26_rt_read_data[POP_WIDTH-1:0];
    32'h08000000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry27_rt_read_data[POP_WIDTH-1:0];
    32'h10000000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry28_rt_read_data[POP_WIDTH-1:0];
    32'h20000000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry29_rt_read_data[POP_WIDTH-1:0];
    32'h40000000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry30_rt_read_data[POP_WIDTH-1:0];
    32'h80000000: pcfifo_pop0_data[POP_WIDTH-1:0] = entry31_rt_read_data[POP_WIDTH-1:0];
    default   : pcfifo_pop0_data[POP_WIDTH-1:0] = {POP_WIDTH{1'bx}};
  endcase
// &CombEnd; @1165
end

// &CombBeg; @1167
always @( entry26_rt_read_data[50:0]
       or entry16_rt_read_data[50:0]
       or entry5_rt_read_data[50:0]
       or entry11_rt_read_data[50:0]
       or entry1_rt_read_data[50:0]
       or entry19_rt_read_data[50:0]
       or entry30_rt_read_data[50:0]
       or entry29_rt_read_data[50:0]
       or entry13_rt_read_data[50:0]
       or entry25_rt_read_data[50:0]
       or entry3_rt_read_data[50:0]
       or entry20_rt_read_data[50:0]
       or entry2_rt_read_data[50:0]
       or entry9_rt_read_data[50:0]
       or entry6_rt_read_data[50:0]
       or entry0_rt_read_data[50:0]
       or entry28_rt_read_data[50:0]
       or pcfifo_pop1_ptr[31:0]
       or entry7_rt_read_data[50:0]
       or entry8_rt_read_data[50:0]
       or entry14_rt_read_data[50:0]
       or entry23_rt_read_data[50:0]
       or entry18_rt_read_data[50:0]
       or entry24_rt_read_data[50:0]
       or entry12_rt_read_data[50:0]
       or entry17_rt_read_data[50:0]
       or entry31_rt_read_data[50:0]
       or entry22_rt_read_data[50:0]
       or entry27_rt_read_data[50:0]
       or entry21_rt_read_data[50:0]
       or entry10_rt_read_data[50:0]
       or entry15_rt_read_data[50:0]
       or entry4_rt_read_data[50:0])
begin
  case (pcfifo_pop1_ptr[31:0])
    32'h00000001: pcfifo_pop1_data[POP_WIDTH-1:0] = entry0_rt_read_data[POP_WIDTH-1:0];
    32'h00000002: pcfifo_pop1_data[POP_WIDTH-1:0] = entry1_rt_read_data[POP_WIDTH-1:0];
    32'h00000004: pcfifo_pop1_data[POP_WIDTH-1:0] = entry2_rt_read_data[POP_WIDTH-1:0];
    32'h00000008: pcfifo_pop1_data[POP_WIDTH-1:0] = entry3_rt_read_data[POP_WIDTH-1:0];
    32'h00000010: pcfifo_pop1_data[POP_WIDTH-1:0] = entry4_rt_read_data[POP_WIDTH-1:0];
    32'h00000020: pcfifo_pop1_data[POP_WIDTH-1:0] = entry5_rt_read_data[POP_WIDTH-1:0];
    32'h00000040: pcfifo_pop1_data[POP_WIDTH-1:0] = entry6_rt_read_data[POP_WIDTH-1:0];
    32'h00000080: pcfifo_pop1_data[POP_WIDTH-1:0] = entry7_rt_read_data[POP_WIDTH-1:0];
    32'h00000100: pcfifo_pop1_data[POP_WIDTH-1:0] = entry8_rt_read_data[POP_WIDTH-1:0];
    32'h00000200: pcfifo_pop1_data[POP_WIDTH-1:0] = entry9_rt_read_data[POP_WIDTH-1:0];
    32'h00000400: pcfifo_pop1_data[POP_WIDTH-1:0] = entry10_rt_read_data[POP_WIDTH-1:0];
    32'h00000800: pcfifo_pop1_data[POP_WIDTH-1:0] = entry11_rt_read_data[POP_WIDTH-1:0];
    32'h00001000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry12_rt_read_data[POP_WIDTH-1:0];
    32'h00002000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry13_rt_read_data[POP_WIDTH-1:0];
    32'h00004000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry14_rt_read_data[POP_WIDTH-1:0];
    32'h00008000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry15_rt_read_data[POP_WIDTH-1:0];
    32'h00010000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry16_rt_read_data[POP_WIDTH-1:0];
    32'h00020000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry17_rt_read_data[POP_WIDTH-1:0];
    32'h00040000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry18_rt_read_data[POP_WIDTH-1:0];
    32'h00080000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry19_rt_read_data[POP_WIDTH-1:0];
    32'h00100000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry20_rt_read_data[POP_WIDTH-1:0];
    32'h00200000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry21_rt_read_data[POP_WIDTH-1:0];
    32'h00400000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry22_rt_read_data[POP_WIDTH-1:0];
    32'h00800000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry23_rt_read_data[POP_WIDTH-1:0];
    32'h01000000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry24_rt_read_data[POP_WIDTH-1:0];
    32'h02000000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry25_rt_read_data[POP_WIDTH-1:0];
    32'h04000000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry26_rt_read_data[POP_WIDTH-1:0];
    32'h08000000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry27_rt_read_data[POP_WIDTH-1:0];
    32'h10000000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry28_rt_read_data[POP_WIDTH-1:0];
    32'h20000000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry29_rt_read_data[POP_WIDTH-1:0];
    32'h40000000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry30_rt_read_data[POP_WIDTH-1:0];
    32'h80000000: pcfifo_pop1_data[POP_WIDTH-1:0] = entry31_rt_read_data[POP_WIDTH-1:0];
    default   : pcfifo_pop1_data[POP_WIDTH-1:0] = {POP_WIDTH{1'bx}};
  endcase
// &CombEnd; @1203
end

// &CombBeg; @1205
always @( entry26_rt_read_data[50:0]
       or entry16_rt_read_data[50:0]
       or entry5_rt_read_data[50:0]
       or entry11_rt_read_data[50:0]
       or entry1_rt_read_data[50:0]
       or entry19_rt_read_data[50:0]
       or entry30_rt_read_data[50:0]
       or entry29_rt_read_data[50:0]
       or entry13_rt_read_data[50:0]
       or entry25_rt_read_data[50:0]
       or entry3_rt_read_data[50:0]
       or entry20_rt_read_data[50:0]
       or entry2_rt_read_data[50:0]
       or entry9_rt_read_data[50:0]
       or entry6_rt_read_data[50:0]
       or entry0_rt_read_data[50:0]
       or entry28_rt_read_data[50:0]
       or entry7_rt_read_data[50:0]
       or entry8_rt_read_data[50:0]
       or entry14_rt_read_data[50:0]
       or entry23_rt_read_data[50:0]
       or entry18_rt_read_data[50:0]
       or entry24_rt_read_data[50:0]
       or entry12_rt_read_data[50:0]
       or entry17_rt_read_data[50:0]
       or entry31_rt_read_data[50:0]
       or entry22_rt_read_data[50:0]
       or pcfifo_pop2_ptr[31:0]
       or entry27_rt_read_data[50:0]
       or entry21_rt_read_data[50:0]
       or entry10_rt_read_data[50:0]
       or entry15_rt_read_data[50:0]
       or entry4_rt_read_data[50:0])
begin
  case (pcfifo_pop2_ptr[31:0])
    32'h00000001: pcfifo_pop2_data[POP_WIDTH-1:0] = entry0_rt_read_data[POP_WIDTH-1:0];
    32'h00000002: pcfifo_pop2_data[POP_WIDTH-1:0] = entry1_rt_read_data[POP_WIDTH-1:0];
    32'h00000004: pcfifo_pop2_data[POP_WIDTH-1:0] = entry2_rt_read_data[POP_WIDTH-1:0];
    32'h00000008: pcfifo_pop2_data[POP_WIDTH-1:0] = entry3_rt_read_data[POP_WIDTH-1:0];
    32'h00000010: pcfifo_pop2_data[POP_WIDTH-1:0] = entry4_rt_read_data[POP_WIDTH-1:0];
    32'h00000020: pcfifo_pop2_data[POP_WIDTH-1:0] = entry5_rt_read_data[POP_WIDTH-1:0];
    32'h00000040: pcfifo_pop2_data[POP_WIDTH-1:0] = entry6_rt_read_data[POP_WIDTH-1:0];
    32'h00000080: pcfifo_pop2_data[POP_WIDTH-1:0] = entry7_rt_read_data[POP_WIDTH-1:0];
    32'h00000100: pcfifo_pop2_data[POP_WIDTH-1:0] = entry8_rt_read_data[POP_WIDTH-1:0];
    32'h00000200: pcfifo_pop2_data[POP_WIDTH-1:0] = entry9_rt_read_data[POP_WIDTH-1:0];
    32'h00000400: pcfifo_pop2_data[POP_WIDTH-1:0] = entry10_rt_read_data[POP_WIDTH-1:0];
    32'h00000800: pcfifo_pop2_data[POP_WIDTH-1:0] = entry11_rt_read_data[POP_WIDTH-1:0];
    32'h00001000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry12_rt_read_data[POP_WIDTH-1:0];
    32'h00002000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry13_rt_read_data[POP_WIDTH-1:0];
    32'h00004000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry14_rt_read_data[POP_WIDTH-1:0];
    32'h00008000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry15_rt_read_data[POP_WIDTH-1:0];
    32'h00010000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry16_rt_read_data[POP_WIDTH-1:0];
    32'h00020000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry17_rt_read_data[POP_WIDTH-1:0];
    32'h00040000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry18_rt_read_data[POP_WIDTH-1:0];
    32'h00080000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry19_rt_read_data[POP_WIDTH-1:0];
    32'h00100000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry20_rt_read_data[POP_WIDTH-1:0];
    32'h00200000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry21_rt_read_data[POP_WIDTH-1:0];
    32'h00400000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry22_rt_read_data[POP_WIDTH-1:0];
    32'h00800000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry23_rt_read_data[POP_WIDTH-1:0];
    32'h01000000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry24_rt_read_data[POP_WIDTH-1:0];
    32'h02000000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry25_rt_read_data[POP_WIDTH-1:0];
    32'h04000000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry26_rt_read_data[POP_WIDTH-1:0];
    32'h08000000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry27_rt_read_data[POP_WIDTH-1:0];
    32'h10000000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry28_rt_read_data[POP_WIDTH-1:0];
    32'h20000000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry29_rt_read_data[POP_WIDTH-1:0];
    32'h40000000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry30_rt_read_data[POP_WIDTH-1:0];
    32'h80000000: pcfifo_pop2_data[POP_WIDTH-1:0] = entry31_rt_read_data[POP_WIDTH-1:0];
    default   : pcfifo_pop2_data[POP_WIDTH-1:0] = {POP_WIDTH{1'bx}};
  endcase
// &CombEnd; @1241
end

// &CombBeg; @1243
always @( entry26_rt_read_data[50:0]
       or entry16_rt_read_data[50:0]
       or entry5_rt_read_data[50:0]
       or entry11_rt_read_data[50:0]
       or entry1_rt_read_data[50:0]
       or entry19_rt_read_data[50:0]
       or entry30_rt_read_data[50:0]
       or entry29_rt_read_data[50:0]
       or entry13_rt_read_data[50:0]
       or entry25_rt_read_data[50:0]
       or entry3_rt_read_data[50:0]
       or entry20_rt_read_data[50:0]
       or entry2_rt_read_data[50:0]
       or entry9_rt_read_data[50:0]
       or entry6_rt_read_data[50:0]
       or entry0_rt_read_data[50:0]
       or entry28_rt_read_data[50:0]
       or entry7_rt_read_data[50:0]
       or entry8_rt_read_data[50:0]
       or entry14_rt_read_data[50:0]
       or entry23_rt_read_data[50:0]
       or entry18_rt_read_data[50:0]
       or entry24_rt_read_data[50:0]
       or entry12_rt_read_data[50:0]
       or entry17_rt_read_data[50:0]
       or entry31_rt_read_data[50:0]
       or entry22_rt_read_data[50:0]
       or entry27_rt_read_data[50:0]
       or pcfifo_pop3_ptr[31:0]
       or entry21_rt_read_data[50:0]
       or entry10_rt_read_data[50:0]
       or entry15_rt_read_data[50:0]
       or entry4_rt_read_data[50:0])
begin
  case (pcfifo_pop3_ptr[31:0])
    32'h00000001: pcfifo_pop3_data[POP_WIDTH-1:0] = entry0_rt_read_data[POP_WIDTH-1:0];
    32'h00000002: pcfifo_pop3_data[POP_WIDTH-1:0] = entry1_rt_read_data[POP_WIDTH-1:0];
    32'h00000004: pcfifo_pop3_data[POP_WIDTH-1:0] = entry2_rt_read_data[POP_WIDTH-1:0];
    32'h00000008: pcfifo_pop3_data[POP_WIDTH-1:0] = entry3_rt_read_data[POP_WIDTH-1:0];
    32'h00000010: pcfifo_pop3_data[POP_WIDTH-1:0] = entry4_rt_read_data[POP_WIDTH-1:0];
    32'h00000020: pcfifo_pop3_data[POP_WIDTH-1:0] = entry5_rt_read_data[POP_WIDTH-1:0];
    32'h00000040: pcfifo_pop3_data[POP_WIDTH-1:0] = entry6_rt_read_data[POP_WIDTH-1:0];
    32'h00000080: pcfifo_pop3_data[POP_WIDTH-1:0] = entry7_rt_read_data[POP_WIDTH-1:0];
    32'h00000100: pcfifo_pop3_data[POP_WIDTH-1:0] = entry8_rt_read_data[POP_WIDTH-1:0];
    32'h00000200: pcfifo_pop3_data[POP_WIDTH-1:0] = entry9_rt_read_data[POP_WIDTH-1:0];
    32'h00000400: pcfifo_pop3_data[POP_WIDTH-1:0] = entry10_rt_read_data[POP_WIDTH-1:0];
    32'h00000800: pcfifo_pop3_data[POP_WIDTH-1:0] = entry11_rt_read_data[POP_WIDTH-1:0];
    32'h00001000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry12_rt_read_data[POP_WIDTH-1:0];
    32'h00002000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry13_rt_read_data[POP_WIDTH-1:0];
    32'h00004000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry14_rt_read_data[POP_WIDTH-1:0];
    32'h00008000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry15_rt_read_data[POP_WIDTH-1:0];
    32'h00010000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry16_rt_read_data[POP_WIDTH-1:0];
    32'h00020000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry17_rt_read_data[POP_WIDTH-1:0];
    32'h00040000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry18_rt_read_data[POP_WIDTH-1:0];
    32'h00080000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry19_rt_read_data[POP_WIDTH-1:0];
    32'h00100000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry20_rt_read_data[POP_WIDTH-1:0];
    32'h00200000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry21_rt_read_data[POP_WIDTH-1:0];
    32'h00400000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry22_rt_read_data[POP_WIDTH-1:0];
    32'h00800000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry23_rt_read_data[POP_WIDTH-1:0];
    32'h01000000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry24_rt_read_data[POP_WIDTH-1:0];
    32'h02000000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry25_rt_read_data[POP_WIDTH-1:0];
    32'h04000000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry26_rt_read_data[POP_WIDTH-1:0];
    32'h08000000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry27_rt_read_data[POP_WIDTH-1:0];
    32'h10000000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry28_rt_read_data[POP_WIDTH-1:0];
    32'h20000000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry29_rt_read_data[POP_WIDTH-1:0];
    32'h40000000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry30_rt_read_data[POP_WIDTH-1:0];
    32'h80000000: pcfifo_pop3_data[POP_WIDTH-1:0] = entry31_rt_read_data[POP_WIDTH-1:0];
    default   : pcfifo_pop3_data[POP_WIDTH-1:0] = {POP_WIDTH{1'bx}};
  endcase
// &CombEnd; @1279
end

// &CombBeg; @1281
always @( entry26_rt_read_data[50:0]
       or pcfifo_pop4_ptr[31:0]
       or entry16_rt_read_data[50:0]
       or entry5_rt_read_data[50:0]
       or entry11_rt_read_data[50:0]
       or entry1_rt_read_data[50:0]
       or entry19_rt_read_data[50:0]
       or entry30_rt_read_data[50:0]
       or entry29_rt_read_data[50:0]
       or entry13_rt_read_data[50:0]
       or entry25_rt_read_data[50:0]
       or entry3_rt_read_data[50:0]
       or entry20_rt_read_data[50:0]
       or entry2_rt_read_data[50:0]
       or entry9_rt_read_data[50:0]
       or entry6_rt_read_data[50:0]
       or entry0_rt_read_data[50:0]
       or entry28_rt_read_data[50:0]
       or entry7_rt_read_data[50:0]
       or entry8_rt_read_data[50:0]
       or entry14_rt_read_data[50:0]
       or entry23_rt_read_data[50:0]
       or entry18_rt_read_data[50:0]
       or entry24_rt_read_data[50:0]
       or entry12_rt_read_data[50:0]
       or entry17_rt_read_data[50:0]
       or entry31_rt_read_data[50:0]
       or entry22_rt_read_data[50:0]
       or entry27_rt_read_data[50:0]
       or entry21_rt_read_data[50:0]
       or entry10_rt_read_data[50:0]
       or entry15_rt_read_data[50:0]
       or entry4_rt_read_data[50:0])
begin
  case (pcfifo_pop4_ptr[31:0])
    32'h00000001: pcfifo_pop4_data[POP_WIDTH-1:0] = entry0_rt_read_data[POP_WIDTH-1:0];
    32'h00000002: pcfifo_pop4_data[POP_WIDTH-1:0] = entry1_rt_read_data[POP_WIDTH-1:0];
    32'h00000004: pcfifo_pop4_data[POP_WIDTH-1:0] = entry2_rt_read_data[POP_WIDTH-1:0];
    32'h00000008: pcfifo_pop4_data[POP_WIDTH-1:0] = entry3_rt_read_data[POP_WIDTH-1:0];
    32'h00000010: pcfifo_pop4_data[POP_WIDTH-1:0] = entry4_rt_read_data[POP_WIDTH-1:0];
    32'h00000020: pcfifo_pop4_data[POP_WIDTH-1:0] = entry5_rt_read_data[POP_WIDTH-1:0];
    32'h00000040: pcfifo_pop4_data[POP_WIDTH-1:0] = entry6_rt_read_data[POP_WIDTH-1:0];
    32'h00000080: pcfifo_pop4_data[POP_WIDTH-1:0] = entry7_rt_read_data[POP_WIDTH-1:0];
    32'h00000100: pcfifo_pop4_data[POP_WIDTH-1:0] = entry8_rt_read_data[POP_WIDTH-1:0];
    32'h00000200: pcfifo_pop4_data[POP_WIDTH-1:0] = entry9_rt_read_data[POP_WIDTH-1:0];
    32'h00000400: pcfifo_pop4_data[POP_WIDTH-1:0] = entry10_rt_read_data[POP_WIDTH-1:0];
    32'h00000800: pcfifo_pop4_data[POP_WIDTH-1:0] = entry11_rt_read_data[POP_WIDTH-1:0];
    32'h00001000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry12_rt_read_data[POP_WIDTH-1:0];
    32'h00002000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry13_rt_read_data[POP_WIDTH-1:0];
    32'h00004000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry14_rt_read_data[POP_WIDTH-1:0];
    32'h00008000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry15_rt_read_data[POP_WIDTH-1:0];
    32'h00010000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry16_rt_read_data[POP_WIDTH-1:0];
    32'h00020000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry17_rt_read_data[POP_WIDTH-1:0];
    32'h00040000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry18_rt_read_data[POP_WIDTH-1:0];
    32'h00080000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry19_rt_read_data[POP_WIDTH-1:0];
    32'h00100000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry20_rt_read_data[POP_WIDTH-1:0];
    32'h00200000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry21_rt_read_data[POP_WIDTH-1:0];
    32'h00400000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry22_rt_read_data[POP_WIDTH-1:0];
    32'h00800000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry23_rt_read_data[POP_WIDTH-1:0];
    32'h01000000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry24_rt_read_data[POP_WIDTH-1:0];
    32'h02000000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry25_rt_read_data[POP_WIDTH-1:0];
    32'h04000000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry26_rt_read_data[POP_WIDTH-1:0];
    32'h08000000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry27_rt_read_data[POP_WIDTH-1:0];
    32'h10000000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry28_rt_read_data[POP_WIDTH-1:0];
    32'h20000000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry29_rt_read_data[POP_WIDTH-1:0];
    32'h40000000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry30_rt_read_data[POP_WIDTH-1:0];
    32'h80000000: pcfifo_pop4_data[POP_WIDTH-1:0] = entry31_rt_read_data[POP_WIDTH-1:0];
    default   : pcfifo_pop4_data[POP_WIDTH-1:0] = {POP_WIDTH{1'bx}};
  endcase
// &CombEnd; @1317
end

// &CombBeg; @1319
always @( entry26_rt_read_data[50:0]
       or entry16_rt_read_data[50:0]
       or entry5_rt_read_data[50:0]
       or entry11_rt_read_data[50:0]
       or entry1_rt_read_data[50:0]
       or entry19_rt_read_data[50:0]
       or entry30_rt_read_data[50:0]
       or entry29_rt_read_data[50:0]
       or entry13_rt_read_data[50:0]
       or entry25_rt_read_data[50:0]
       or entry3_rt_read_data[50:0]
       or entry20_rt_read_data[50:0]
       or entry2_rt_read_data[50:0]
       or entry9_rt_read_data[50:0]
       or entry6_rt_read_data[50:0]
       or entry0_rt_read_data[50:0]
       or entry28_rt_read_data[50:0]
       or entry7_rt_read_data[50:0]
       or entry8_rt_read_data[50:0]
       or entry14_rt_read_data[50:0]
       or entry23_rt_read_data[50:0]
       or pcfifo_pop5_ptr[31:0]
       or entry18_rt_read_data[50:0]
       or entry24_rt_read_data[50:0]
       or entry12_rt_read_data[50:0]
       or entry17_rt_read_data[50:0]
       or entry31_rt_read_data[50:0]
       or entry22_rt_read_data[50:0]
       or entry27_rt_read_data[50:0]
       or entry21_rt_read_data[50:0]
       or entry10_rt_read_data[50:0]
       or entry15_rt_read_data[50:0]
       or entry4_rt_read_data[50:0])
begin
  case (pcfifo_pop5_ptr[31:0])
    32'h00000001: pcfifo_pop5_data[POP_WIDTH-1:0] = entry0_rt_read_data[POP_WIDTH-1:0];
    32'h00000002: pcfifo_pop5_data[POP_WIDTH-1:0] = entry1_rt_read_data[POP_WIDTH-1:0];
    32'h00000004: pcfifo_pop5_data[POP_WIDTH-1:0] = entry2_rt_read_data[POP_WIDTH-1:0];
    32'h00000008: pcfifo_pop5_data[POP_WIDTH-1:0] = entry3_rt_read_data[POP_WIDTH-1:0];
    32'h00000010: pcfifo_pop5_data[POP_WIDTH-1:0] = entry4_rt_read_data[POP_WIDTH-1:0];
    32'h00000020: pcfifo_pop5_data[POP_WIDTH-1:0] = entry5_rt_read_data[POP_WIDTH-1:0];
    32'h00000040: pcfifo_pop5_data[POP_WIDTH-1:0] = entry6_rt_read_data[POP_WIDTH-1:0];
    32'h00000080: pcfifo_pop5_data[POP_WIDTH-1:0] = entry7_rt_read_data[POP_WIDTH-1:0];
    32'h00000100: pcfifo_pop5_data[POP_WIDTH-1:0] = entry8_rt_read_data[POP_WIDTH-1:0];
    32'h00000200: pcfifo_pop5_data[POP_WIDTH-1:0] = entry9_rt_read_data[POP_WIDTH-1:0];
    32'h00000400: pcfifo_pop5_data[POP_WIDTH-1:0] = entry10_rt_read_data[POP_WIDTH-1:0];
    32'h00000800: pcfifo_pop5_data[POP_WIDTH-1:0] = entry11_rt_read_data[POP_WIDTH-1:0];
    32'h00001000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry12_rt_read_data[POP_WIDTH-1:0];
    32'h00002000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry13_rt_read_data[POP_WIDTH-1:0];
    32'h00004000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry14_rt_read_data[POP_WIDTH-1:0];
    32'h00008000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry15_rt_read_data[POP_WIDTH-1:0];
    32'h00010000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry16_rt_read_data[POP_WIDTH-1:0];
    32'h00020000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry17_rt_read_data[POP_WIDTH-1:0];
    32'h00040000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry18_rt_read_data[POP_WIDTH-1:0];
    32'h00080000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry19_rt_read_data[POP_WIDTH-1:0];
    32'h00100000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry20_rt_read_data[POP_WIDTH-1:0];
    32'h00200000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry21_rt_read_data[POP_WIDTH-1:0];
    32'h00400000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry22_rt_read_data[POP_WIDTH-1:0];
    32'h00800000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry23_rt_read_data[POP_WIDTH-1:0];
    32'h01000000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry24_rt_read_data[POP_WIDTH-1:0];
    32'h02000000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry25_rt_read_data[POP_WIDTH-1:0];
    32'h04000000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry26_rt_read_data[POP_WIDTH-1:0];
    32'h08000000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry27_rt_read_data[POP_WIDTH-1:0];
    32'h10000000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry28_rt_read_data[POP_WIDTH-1:0];
    32'h20000000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry29_rt_read_data[POP_WIDTH-1:0];
    32'h40000000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry30_rt_read_data[POP_WIDTH-1:0];
    32'h80000000: pcfifo_pop5_data[POP_WIDTH-1:0] = entry31_rt_read_data[POP_WIDTH-1:0];
    default   : pcfifo_pop5_data[POP_WIDTH-1:0] = {POP_WIDTH{1'bx}};
  endcase
// &CombEnd; @1355
end

// &ModuleEnd; @1357
endmodule


