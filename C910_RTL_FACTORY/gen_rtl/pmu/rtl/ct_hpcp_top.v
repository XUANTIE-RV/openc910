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
module ct_hpcp_top(
  biu_hpcp_cmplt,
  biu_hpcp_l2of_int,
  biu_hpcp_rdata,
  biu_hpcp_time,
  cp0_hpcp_icg_en,
  cp0_hpcp_index,
  cp0_hpcp_int_disable,
  cp0_hpcp_mcntwen,
  cp0_hpcp_op,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmds,
  cp0_hpcp_pmdu,
  cp0_hpcp_sel,
  cp0_hpcp_src0,
  cp0_hpcp_wdata,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  hpcp_biu_cnt_en,
  hpcp_biu_op,
  hpcp_biu_sel,
  hpcp_biu_wdata,
  hpcp_cp0_cmplt,
  hpcp_cp0_data,
  hpcp_cp0_int_vld,
  hpcp_cp0_sce,
  hpcp_idu_cnt_en,
  hpcp_ifu_cnt_en,
  hpcp_lsu_cnt_en,
  hpcp_mmu_cnt_en,
  hpcp_rtu_cnt_en,
  idu_hpcp_backend_stall,
  idu_hpcp_fence_sync_vld,
  idu_hpcp_ir_inst0_type,
  idu_hpcp_ir_inst0_vld,
  idu_hpcp_ir_inst1_type,
  idu_hpcp_ir_inst1_vld,
  idu_hpcp_ir_inst2_type,
  idu_hpcp_ir_inst2_vld,
  idu_hpcp_ir_inst3_type,
  idu_hpcp_ir_inst3_vld,
  idu_hpcp_rf_inst_vld,
  idu_hpcp_rf_pipe0_inst_vld,
  idu_hpcp_rf_pipe0_lch_fail_vld,
  idu_hpcp_rf_pipe1_inst_vld,
  idu_hpcp_rf_pipe1_lch_fail_vld,
  idu_hpcp_rf_pipe2_inst_vld,
  idu_hpcp_rf_pipe2_lch_fail_vld,
  idu_hpcp_rf_pipe3_inst_vld,
  idu_hpcp_rf_pipe3_lch_fail_vld,
  idu_hpcp_rf_pipe3_reg_lch_fail_vld,
  idu_hpcp_rf_pipe4_inst_vld,
  idu_hpcp_rf_pipe4_lch_fail_vld,
  idu_hpcp_rf_pipe4_reg_lch_fail_vld,
  idu_hpcp_rf_pipe5_inst_vld,
  idu_hpcp_rf_pipe5_lch_fail_vld,
  idu_hpcp_rf_pipe5_reg_lch_fail_vld,
  idu_hpcp_rf_pipe6_inst_vld,
  idu_hpcp_rf_pipe6_lch_fail_vld,
  idu_hpcp_rf_pipe7_inst_vld,
  idu_hpcp_rf_pipe7_lch_fail_vld,
  ifu_hpcp_btb_inst,
  ifu_hpcp_btb_mispred,
  ifu_hpcp_frontend_stall,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  lsu_hpcp_cache_read_access,
  lsu_hpcp_cache_read_miss,
  lsu_hpcp_cache_write_access,
  lsu_hpcp_cache_write_miss,
  lsu_hpcp_fence_stall,
  lsu_hpcp_ld_stall_cross_4k,
  lsu_hpcp_ld_stall_other,
  lsu_hpcp_replay_data_discard,
  lsu_hpcp_replay_discard_sq,
  lsu_hpcp_st_stall_cross_4k,
  lsu_hpcp_st_stall_other,
  lsu_hpcp_unalign_inst,
  mmu_hpcp_dutlb_miss,
  mmu_hpcp_iutlb_miss,
  mmu_hpcp_jtlb_miss,
  pad_yy_icg_scan_en,
  rtu_hpcp_inst0_ack_int,
  rtu_hpcp_inst0_bht_mispred,
  rtu_hpcp_inst0_condbr,
  rtu_hpcp_inst0_cur_pc,
  rtu_hpcp_inst0_jmp,
  rtu_hpcp_inst0_jmp_mispred,
  rtu_hpcp_inst0_jmp_pc_offset_8m,
  rtu_hpcp_inst0_num,
  rtu_hpcp_inst0_pc_offset,
  rtu_hpcp_inst0_spec_fail,
  rtu_hpcp_inst0_split,
  rtu_hpcp_inst0_store,
  rtu_hpcp_inst0_vld,
  rtu_hpcp_inst1_condbr,
  rtu_hpcp_inst1_cur_pc,
  rtu_hpcp_inst1_jmp,
  rtu_hpcp_inst1_jmp_pc_offset_8m,
  rtu_hpcp_inst1_num,
  rtu_hpcp_inst1_pc_offset,
  rtu_hpcp_inst1_split,
  rtu_hpcp_inst1_store,
  rtu_hpcp_inst1_vld,
  rtu_hpcp_inst2_condbr,
  rtu_hpcp_inst2_cur_pc,
  rtu_hpcp_inst2_jmp,
  rtu_hpcp_inst2_jmp_pc_offset_8m,
  rtu_hpcp_inst2_num,
  rtu_hpcp_inst2_pc_offset,
  rtu_hpcp_inst2_split,
  rtu_hpcp_inst2_store,
  rtu_hpcp_inst2_vld,
  rtu_hpcp_trace_inst0_chgflow,
  rtu_hpcp_trace_inst0_next_pc,
  rtu_hpcp_trace_inst1_chgflow,
  rtu_hpcp_trace_inst1_next_pc,
  rtu_hpcp_trace_inst2_chgflow,
  rtu_hpcp_trace_inst2_next_pc,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush
);

// &Ports; @23
input            biu_hpcp_cmplt;                    
input   [3  :0]  biu_hpcp_l2of_int;                 
input   [127:0]  biu_hpcp_rdata;                    
input   [63 :0]  biu_hpcp_time;                     
input            cp0_hpcp_icg_en;                   
input   [11 :0]  cp0_hpcp_index;                    
input            cp0_hpcp_int_disable;              
input   [31 :0]  cp0_hpcp_mcntwen;                  
input   [3  :0]  cp0_hpcp_op;                       
input            cp0_hpcp_pmdm;                     
input            cp0_hpcp_pmds;                     
input            cp0_hpcp_pmdu;                     
input            cp0_hpcp_sel;                      
input   [63 :0]  cp0_hpcp_src0;                     
input   [63 :0]  cp0_hpcp_wdata;                    
input   [1  :0]  cp0_yy_priv_mode;                  
input            cpurst_b;                          
input            forever_cpuclk;                    
input            idu_hpcp_backend_stall;            
input            idu_hpcp_fence_sync_vld;           
input   [6  :0]  idu_hpcp_ir_inst0_type;            
input            idu_hpcp_ir_inst0_vld;             
input   [6  :0]  idu_hpcp_ir_inst1_type;            
input            idu_hpcp_ir_inst1_vld;             
input   [6  :0]  idu_hpcp_ir_inst2_type;            
input            idu_hpcp_ir_inst2_vld;             
input   [6  :0]  idu_hpcp_ir_inst3_type;            
input            idu_hpcp_ir_inst3_vld;             
input            idu_hpcp_rf_inst_vld;              
input            idu_hpcp_rf_pipe0_inst_vld;        
input            idu_hpcp_rf_pipe0_lch_fail_vld;    
input            idu_hpcp_rf_pipe1_inst_vld;        
input            idu_hpcp_rf_pipe1_lch_fail_vld;    
input            idu_hpcp_rf_pipe2_inst_vld;        
input            idu_hpcp_rf_pipe2_lch_fail_vld;    
input            idu_hpcp_rf_pipe3_inst_vld;        
input            idu_hpcp_rf_pipe3_lch_fail_vld;    
input            idu_hpcp_rf_pipe3_reg_lch_fail_vld; 
input            idu_hpcp_rf_pipe4_inst_vld;        
input            idu_hpcp_rf_pipe4_lch_fail_vld;    
input            idu_hpcp_rf_pipe4_reg_lch_fail_vld; 
input            idu_hpcp_rf_pipe5_inst_vld;        
input            idu_hpcp_rf_pipe5_lch_fail_vld;    
input            idu_hpcp_rf_pipe5_reg_lch_fail_vld; 
input            idu_hpcp_rf_pipe6_inst_vld;        
input            idu_hpcp_rf_pipe6_lch_fail_vld;    
input            idu_hpcp_rf_pipe7_inst_vld;        
input            idu_hpcp_rf_pipe7_lch_fail_vld;    
input            ifu_hpcp_btb_inst;                 
input            ifu_hpcp_btb_mispred;              
input            ifu_hpcp_frontend_stall;           
input            ifu_hpcp_icache_access;            
input            ifu_hpcp_icache_miss;              
input            lsu_hpcp_cache_read_access;        
input            lsu_hpcp_cache_read_miss;          
input            lsu_hpcp_cache_write_access;       
input            lsu_hpcp_cache_write_miss;         
input            lsu_hpcp_fence_stall;              
input            lsu_hpcp_ld_stall_cross_4k;        
input            lsu_hpcp_ld_stall_other;           
input            lsu_hpcp_replay_data_discard;      
input            lsu_hpcp_replay_discard_sq;        
input            lsu_hpcp_st_stall_cross_4k;        
input            lsu_hpcp_st_stall_other;           
input   [1  :0]  lsu_hpcp_unalign_inst;             
input            mmu_hpcp_dutlb_miss;               
input            mmu_hpcp_iutlb_miss;               
input            mmu_hpcp_jtlb_miss;                
input            pad_yy_icg_scan_en;                
input            rtu_hpcp_inst0_ack_int;            
input            rtu_hpcp_inst0_bht_mispred;        
input            rtu_hpcp_inst0_condbr;             
input   [39 :0]  rtu_hpcp_inst0_cur_pc;             
input            rtu_hpcp_inst0_jmp;                
input            rtu_hpcp_inst0_jmp_mispred;        
input            rtu_hpcp_inst0_jmp_pc_offset_8m;   
input   [1  :0]  rtu_hpcp_inst0_num;                
input   [2  :0]  rtu_hpcp_inst0_pc_offset;          
input            rtu_hpcp_inst0_spec_fail;          
input            rtu_hpcp_inst0_split;              
input            rtu_hpcp_inst0_store;              
input            rtu_hpcp_inst0_vld;                
input            rtu_hpcp_inst1_condbr;             
input   [39 :0]  rtu_hpcp_inst1_cur_pc;             
input            rtu_hpcp_inst1_jmp;                
input            rtu_hpcp_inst1_jmp_pc_offset_8m;   
input   [1  :0]  rtu_hpcp_inst1_num;                
input   [2  :0]  rtu_hpcp_inst1_pc_offset;          
input            rtu_hpcp_inst1_split;              
input            rtu_hpcp_inst1_store;              
input            rtu_hpcp_inst1_vld;                
input            rtu_hpcp_inst2_condbr;             
input   [39 :0]  rtu_hpcp_inst2_cur_pc;             
input            rtu_hpcp_inst2_jmp;                
input            rtu_hpcp_inst2_jmp_pc_offset_8m;   
input   [1  :0]  rtu_hpcp_inst2_num;                
input   [2  :0]  rtu_hpcp_inst2_pc_offset;          
input            rtu_hpcp_inst2_split;              
input            rtu_hpcp_inst2_store;              
input            rtu_hpcp_inst2_vld;                
input            rtu_hpcp_trace_inst0_chgflow;      
input   [38 :0]  rtu_hpcp_trace_inst0_next_pc;      
input            rtu_hpcp_trace_inst1_chgflow;      
input   [38 :0]  rtu_hpcp_trace_inst1_next_pc;      
input            rtu_hpcp_trace_inst2_chgflow;      
input   [38 :0]  rtu_hpcp_trace_inst2_next_pc;      
input            rtu_yy_xx_dbgon;                   
input            rtu_yy_xx_flush;                   
output  [3  :0]  hpcp_biu_cnt_en;                   
output  [15 :0]  hpcp_biu_op;                       
output           hpcp_biu_sel;                      
output  [63 :0]  hpcp_biu_wdata;                    
output           hpcp_cp0_cmplt;                    
output  [63 :0]  hpcp_cp0_data;                     
output           hpcp_cp0_int_vld;                  
output           hpcp_cp0_sce;                      
output           hpcp_idu_cnt_en;                   
output           hpcp_ifu_cnt_en;                   
output           hpcp_lsu_cnt_en;                   
output           hpcp_mmu_cnt_en;                   
output           hpcp_rtu_cnt_en;                   

// &Regs; @24
reg     [3  :0]  biu_hpcp_l2of_int_ff;              
reg     [5  :0]  cnt0_event_index;                  
reg     [5  :0]  cnt1_event_index;                  
reg     [5  :0]  cnt2_event_index;                  
reg     [5  :0]  cnt3_event_index;                  
reg     [31 :0]  cnt_mask;                          
reg              cnt_mode_dis;                      
reg     [1  :0]  cur_state;                         
reg              cy;                                
reg     [63 :0]  data_out;                          
reg              hpcp_stop_vld_ff;                  
reg     [28 :0]  hpm;                               
reg              hpmep_high_vld;                    
reg     [62 :0]  hpmep_reg;                         
reg              hpmsp_high_vld;                    
reg     [62 :0]  hpmsp_reg;                         
reg              ir;                                
reg              l2cnt_cmplt_ff;                    
reg     [31 :0]  l2of_data;                         
reg     [31 :0]  l2of_int;                          
reg     [1  :0]  next_state;                        
reg              sce;                               
reg     [1  :0]  tme;                               
reg              ts;                                

// &Wires @25
wire             bht_mispred;                       
wire             biu_hpcp_cmplt;                    
wire    [3  :0]  biu_hpcp_l2of_int;                 
wire    [127:0]  biu_hpcp_rdata;                    
wire    [63 :0]  biu_hpcp_time;                     
wire    [5  :0]  cnt0_event_index_clr_data;         
wire    [5  :0]  cnt0_event_index_set_data;         
wire    [5  :0]  cnt1_event_index_clr_data;         
wire    [5  :0]  cnt1_event_index_set_data;         
wire    [5  :0]  cnt2_event_index_clr_data;         
wire    [5  :0]  cnt2_event_index_set_data;         
wire    [5  :0]  cnt3_event_index_clr_data;         
wire    [5  :0]  cnt3_event_index_set_data;         
wire    [31 :0]  cnt_bit_mask;                      
wire    [31 :0]  cnt_bit_sel;                       
wire             cnt_index_less_than_limit;         
wire             cnt_mask_clr;                      
wire    [31 :0]  cnt_mask_clr_data;                 
wire             cnt_mask_set;                      
wire    [31 :0]  cnt_mask_set_data;                 
wire             cnt_mode_dis_pre;                  
wire    [31 :0]  cntinten;                          
wire    [63 :0]  cntinten_value;                    
wire    [31 :0]  cntinten_wen;                      
wire    [31 :0]  cntof;                             
wire    [31 :0]  cntof_int;                         
wire    [63 :0]  cntof_value;                       
wire    [31 :0]  cntof_wen;                         
wire    [31 :0]  counter_overflow;                  
wire             cp0_hpcp_icg_en;                   
wire    [11 :0]  cp0_hpcp_index;                    
wire             cp0_hpcp_int_disable;              
wire    [31 :0]  cp0_hpcp_mcntwen;                  
wire    [3  :0]  cp0_hpcp_op;                       
wire             cp0_hpcp_pmdm;                     
wire             cp0_hpcp_pmds;                     
wire             cp0_hpcp_pmdu;                     
wire             cp0_hpcp_sel;                      
wire    [63 :0]  cp0_hpcp_src0;                     
wire    [63 :0]  cp0_hpcp_wdata;                    
wire    [1  :0]  cp0_yy_priv_mode;                  
wire             cpurst_b;                          
wire             end_vld;                           
wire    [3  :0]  event01_adder;                     
wire    [3  :0]  event02_adder;                     
wire    [3  :0]  event03_adder;                     
wire    [3  :0]  event04_adder;                     
wire    [3  :0]  event05_adder;                     
wire    [3  :0]  event06_adder;                     
wire    [3  :0]  event07_adder;                     
wire    [3  :0]  event08_adder;                     
wire    [3  :0]  event09_adder;                     
wire    [3  :0]  event10_adder;                     
wire    [3  :0]  event11_adder;                     
wire    [3  :0]  event12_adder;                     
wire    [3  :0]  event13_adder;                     
wire    [3  :0]  event14_adder;                     
wire    [3  :0]  event15_adder;                     
wire    [3  :0]  event16_adder;                     
wire    [3  :0]  event17_adder;                     
wire    [3  :0]  event18_adder;                     
wire    [3  :0]  event19_adder;                     
wire    [3  :0]  event20_adder;                     
wire    [3  :0]  event21_adder;                     
wire    [3  :0]  event22_adder;                     
wire    [3  :0]  event23_adder;                     
wire    [3  :0]  event24_adder;                     
wire    [3  :0]  event25_adder;                     
wire    [3  :0]  event26_adder;                     
wire    [3  :0]  event27_adder;                     
wire    [3  :0]  event28_adder;                     
wire    [3  :0]  event29_adder;                     
wire    [3  :0]  event30_adder;                     
wire    [3  :0]  event31_adder;                     
wire    [3  :0]  event32_adder;                     
wire    [3  :0]  event33_adder;                     
wire    [3  :0]  event34_adder;                     
wire    [3  :0]  event35_adder;                     
wire    [3  :0]  event36_adder;                     
wire    [3  :0]  event37_adder;                     
wire    [3  :0]  event38_adder;                     
wire    [3  :0]  event39_adder;                     
wire    [3  :0]  event40_adder;                     
wire    [3  :0]  event41_adder;                     
wire    [3  :0]  event42_adder;                     
wire             forever_cpuclk;                    
wire             hpcp_backend_stall;                
wire    [3  :0]  hpcp_biu_cnt_en;                   
wire    [15 :0]  hpcp_biu_op;                       
wire             hpcp_biu_sel;                      
wire    [63 :0]  hpcp_biu_wdata;                    
wire             hpcp_branch_target_inst;           
wire             hpcp_branch_target_mispred;        
wire             hpcp_clk;                          
wire             hpcp_clk_en;                       
wire             hpcp_cnt_en;                       
wire             hpcp_cp0_cmplt;                    
wire    [63 :0]  hpcp_cp0_data;                     
wire             hpcp_cp0_int_vld;                  
wire             hpcp_cp0_sce;                      
wire             hpcp_dcache_read_access;           
wire             hpcp_dcache_read_miss;             
wire             hpcp_dcache_write_access;          
wire             hpcp_dcache_write_miss;            
wire             hpcp_end_vld;                      
wire             hpcp_fence_stall;                  
wire             hpcp_fence_sync_vld;               
wire             hpcp_frontend_stall;               
wire             hpcp_icache_access;                
wire             hpcp_icache_miss;                  
wire             hpcp_idu_cnt_en;                   
wire             hpcp_ifu_cnt_en;                   
wire             hpcp_inst0_jmp_over_8m;            
wire             hpcp_inst1_jmp_over_8m;            
wire             hpcp_inst2_jmp_over_8m;            
wire             hpcp_int_ack;                      
wire             hpcp_int_disable;                  
wire    [6  :0]  hpcp_ir_inst0_type;                
wire             hpcp_ir_inst0_vld;                 
wire    [6  :0]  hpcp_ir_inst1_type;                
wire             hpcp_ir_inst1_vld;                 
wire    [6  :0]  hpcp_ir_inst2_type;                
wire             hpcp_ir_inst2_vld;                 
wire    [6  :0]  hpcp_ir_inst3_type;                
wire             hpcp_ir_inst3_vld;                 
wire             hpcp_ld_cross_4k_stall;            
wire             hpcp_ld_other_stall;               
wire             hpcp_lsu_cnt_en;                   
wire             hpcp_mmu_cnt_en;                   
wire             hpcp_retire_bht_mispred;           
wire             hpcp_retire_inst0_condbr;          
wire             hpcp_retire_inst0_jmp;             
wire    [1  :0]  hpcp_retire_inst0_num;             
wire    [2  :0]  hpcp_retire_inst0_offset;          
wire    [39 :0]  hpcp_retire_inst0_pc;              
wire             hpcp_retire_inst0_split;           
wire             hpcp_retire_inst0_store;           
wire             hpcp_retire_inst0_vld;             
wire             hpcp_retire_inst1_condbr;          
wire             hpcp_retire_inst1_jmp;             
wire    [1  :0]  hpcp_retire_inst1_num;             
wire    [2  :0]  hpcp_retire_inst1_offset;          
wire    [39 :0]  hpcp_retire_inst1_pc;              
wire             hpcp_retire_inst1_split;           
wire             hpcp_retire_inst1_store;           
wire             hpcp_retire_inst1_vld;             
wire             hpcp_retire_inst2_condbr;          
wire             hpcp_retire_inst2_jmp;             
wire    [1  :0]  hpcp_retire_inst2_num;             
wire    [2  :0]  hpcp_retire_inst2_offset;          
wire    [39 :0]  hpcp_retire_inst2_pc;              
wire             hpcp_retire_inst2_split;           
wire             hpcp_retire_inst2_store;           
wire             hpcp_retire_inst2_vld;             
wire             hpcp_retire_jmp_mispred;           
wire             hpcp_retire_spec_fail;             
wire             hpcp_rf_inst_vld;                  
wire             hpcp_rf_pipe0_inst_vld;            
wire             hpcp_rf_pipe0_lch_fail_vld;        
wire             hpcp_rf_pipe1_inst_vld;            
wire             hpcp_rf_pipe1_lch_fail_vld;        
wire             hpcp_rf_pipe2_inst_vld;            
wire             hpcp_rf_pipe2_lch_fail_vld;        
wire             hpcp_rf_pipe3_inst_vld;            
wire             hpcp_rf_pipe3_lch_fail_vld;        
wire             hpcp_rf_pipe3_reg_lch_fail_vld;    
wire             hpcp_rf_pipe4_inst_vld;            
wire             hpcp_rf_pipe4_lch_fail_vld;        
wire             hpcp_rf_pipe4_reg_lch_fail_vld;    
wire             hpcp_rf_pipe5_inst_vld;            
wire             hpcp_rf_pipe5_lch_fail_vld;        
wire             hpcp_rf_pipe5_reg_lch_fail_vld;    
wire             hpcp_rf_pipe6_inst_vld;            
wire             hpcp_rf_pipe6_lch_fail_vld;        
wire             hpcp_rf_pipe7_inst_vld;            
wire             hpcp_rf_pipe7_lch_fail_vld;        
wire             hpcp_rtu_cnt_en;                   
wire             hpcp_sq_data_discard;              
wire             hpcp_sq_discard;                   
wire             hpcp_st_cross_4k_stall;            
wire             hpcp_st_other_stall;               
wire             hpcp_start_vld;                    
wire             hpcp_stop_vld;                     
wire             hpcp_tlb_dutlb_miss;               
wire             hpcp_tlb_iutlb_miss;               
wire             hpcp_tlb_jtlb_miss;                
wire             hpcp_trigger_vld;                  
wire    [1  :0]  hpcp_unalign_inst;                 
wire    [63 :0]  hpcp_wdata;                        
wire             hpcp_wen;                          
wire             hpcp_xx_cnt_en;                    
wire             hpmep_eq_retire0_pc;               
wire             hpmep_eq_retire1_pc;               
wire             hpmep_eq_retire2_pc;               
wire             hpmep_ge_retire0_ed_pc;            
wire             hpmep_ge_retire1_ed_pc;            
wire             hpmep_ge_retire2_ed_pc;            
wire             hpmep_high_test;                   
wire    [3  :0]  hpmep_sub_retire0_ed_pc;           
wire             hpmep_sub_retire0_high_zero;       
wire    [39 :0]  hpmep_sub_retire0_st_pc;           
wire    [3  :0]  hpmep_sub_retire1_ed_pc;           
wire             hpmep_sub_retire1_high_zero;       
wire    [39 :0]  hpmep_sub_retire1_st_pc;           
wire    [3  :0]  hpmep_sub_retire2_ed_pc;           
wire             hpmep_sub_retire2_high_zero;       
wire    [39 :0]  hpmep_sub_retire2_st_pc;           
wire             hpmsp_eq_retire0_pc;               
wire             hpmsp_eq_retire1_pc;               
wire             hpmsp_eq_retire2_pc;               
wire             hpmsp_high_test;                   
wire             hpmsp_le_retire0_st_pc;            
wire             hpmsp_le_retire1_st_pc;            
wire             hpmsp_le_retire2_st_pc;            
wire    [3  :0]  hpmsp_sub_retire0_ed_pc;           
wire             hpmsp_sub_retire0_high_zero;       
wire    [39 :0]  hpmsp_sub_retire0_st_pc;           
wire    [3  :0]  hpmsp_sub_retire1_ed_pc;           
wire             hpmsp_sub_retire1_high_zero;       
wire    [39 :0]  hpmsp_sub_retire1_st_pc;           
wire    [3  :0]  hpmsp_sub_retire2_ed_pc;           
wire             hpmsp_sub_retire2_high_zero;       
wire    [39 :0]  hpmsp_sub_retire2_st_pc;           
wire             idu_hpcp_backend_stall;            
wire             idu_hpcp_fence_sync_vld;           
wire    [6  :0]  idu_hpcp_ir_inst0_type;            
wire             idu_hpcp_ir_inst0_vld;             
wire    [6  :0]  idu_hpcp_ir_inst1_type;            
wire             idu_hpcp_ir_inst1_vld;             
wire    [6  :0]  idu_hpcp_ir_inst2_type;            
wire             idu_hpcp_ir_inst2_vld;             
wire    [6  :0]  idu_hpcp_ir_inst3_type;            
wire             idu_hpcp_ir_inst3_vld;             
wire             idu_hpcp_rf_inst_vld;              
wire             idu_hpcp_rf_pipe0_inst_vld;        
wire             idu_hpcp_rf_pipe0_lch_fail_vld;    
wire             idu_hpcp_rf_pipe1_inst_vld;        
wire             idu_hpcp_rf_pipe1_lch_fail_vld;    
wire             idu_hpcp_rf_pipe2_inst_vld;        
wire             idu_hpcp_rf_pipe2_lch_fail_vld;    
wire             idu_hpcp_rf_pipe3_inst_vld;        
wire             idu_hpcp_rf_pipe3_lch_fail_vld;    
wire             idu_hpcp_rf_pipe3_reg_lch_fail_vld; 
wire             idu_hpcp_rf_pipe4_inst_vld;        
wire             idu_hpcp_rf_pipe4_lch_fail_vld;    
wire             idu_hpcp_rf_pipe4_reg_lch_fail_vld; 
wire             idu_hpcp_rf_pipe5_inst_vld;        
wire             idu_hpcp_rf_pipe5_lch_fail_vld;    
wire             idu_hpcp_rf_pipe5_reg_lch_fail_vld; 
wire             idu_hpcp_rf_pipe6_inst_vld;        
wire             idu_hpcp_rf_pipe6_lch_fail_vld;    
wire             idu_hpcp_rf_pipe7_inst_vld;        
wire             idu_hpcp_rf_pipe7_lch_fail_vld;    
wire             ifu_hpcp_btb_inst;                 
wire             ifu_hpcp_btb_mispred;              
wire             ifu_hpcp_frontend_stall;           
wire             ifu_hpcp_icache_access;            
wire             ifu_hpcp_icache_miss;              
wire             inst0_condbr;                      
wire             inst0_jmp;                         
wire             inst0_long_jump;                   
wire             inst0_store;                       
wire    [1  :0]  inst0_vld;                         
wire             inst1_condbr;                      
wire             inst1_jmp;                         
wire             inst1_long_jump;                   
wire             inst1_store;                       
wire    [1  :0]  inst1_vld;                         
wire             inst2_condbr;                      
wire             inst2_jmp;                         
wire             inst2_long_jump;                   
wire             inst2_store;                       
wire    [1  :0]  inst2_vld;                         
wire             int_ack_vld;                       
wire             ir_inst0_alu;                      
wire             ir_inst0_csr;                      
wire             ir_inst0_ecall;                    
wire             ir_inst0_fpu;                      
wire             ir_inst0_ldst;                     
wire             ir_inst0_sync;                     
wire             ir_inst0_vec;                      
wire             ir_inst1_alu;                      
wire             ir_inst1_csr;                      
wire             ir_inst1_ecall;                    
wire             ir_inst1_fpu;                      
wire             ir_inst1_ldst;                     
wire             ir_inst1_sync;                     
wire             ir_inst1_vec;                      
wire             ir_inst2_alu;                      
wire             ir_inst2_csr;                      
wire             ir_inst2_ecall;                    
wire             ir_inst2_fpu;                      
wire             ir_inst2_ldst;                     
wire             ir_inst2_sync;                     
wire             ir_inst2_vec;                      
wire             ir_inst3_alu;                      
wire             ir_inst3_csr;                      
wire             ir_inst3_ecall;                    
wire             ir_inst3_fpu;                      
wire             ir_inst3_ldst;                     
wire             ir_inst3_sync;                     
wire             ir_inst3_vec;                      
wire             jmp_mispred;                       
wire             l2_ra_sel;                         
wire             l2_rm_sel;                         
wire             l2_wa_sel;                         
wire             l2_wm_sel;                         
wire    [3  :0]  l2cnt_en;                          
wire    [15 :0]  l2cnt_idx;                         
wire             l2cnt_ra_cnt_en;                   
wire    [31 :0]  l2cnt_ra_inhbt;                    
wire    [3  :0]  l2cnt_reg_idx;                     
wire             l2cnt_rm_cnt_en;                   
wire    [31 :0]  l2cnt_rm_inhbt;                    
wire             l2cnt_sel;                         
wire             l2cnt_wa_cnt_en;                   
wire    [31 :0]  l2cnt_wa_inhbt;                    
wire    [63 :0]  l2cnt_wdata;                       
wire             l2cnt_wm_cnt_en;                   
wire    [31 :0]  l2cnt_wm_inhbt;                    
wire    [31 :0]  l2of_data0_shift;                  
wire    [31 :0]  l2of_data1_shift;                  
wire    [31 :0]  l2of_data2_shift;                  
wire    [31 :0]  l2of_data3_shift;                  
wire    [31 :0]  l2of_data_updt;                    
wire             l2of_data_updt_vld;                
wire    [31 :0]  l2of_int_updt;                     
wire             l2of_int_updt_vld;                 
wire    [3  :0]  l2of_wdata;                        
wire    [3  :0]  l2of_wen;                          
wire    [31 :0]  l2of_wen0_shift;                   
wire    [31 :0]  l2of_wen1_shift;                   
wire    [31 :0]  l2of_wen2_shift;                   
wire    [31 :0]  l2of_wen3_shift;                   
wire             lsu_hpcp_cache_read_access;        
wire             lsu_hpcp_cache_read_miss;          
wire             lsu_hpcp_cache_write_access;       
wire             lsu_hpcp_cache_write_miss;         
wire             lsu_hpcp_fence_stall;              
wire             lsu_hpcp_ld_stall_cross_4k;        
wire             lsu_hpcp_ld_stall_other;           
wire             lsu_hpcp_replay_data_discard;      
wire             lsu_hpcp_replay_discard_sq;        
wire             lsu_hpcp_st_stall_cross_4k;        
wire             lsu_hpcp_st_stall_other;           
wire    [1  :0]  lsu_hpcp_unalign_inst;             
wire             mcntinhbt_clk_en;                  
wire    [63 :0]  mcntinhbt_value;                   
wire             mcntinhbt_wen;                     
wire             mcntinten_clk_en;                  
wire    [63 :0]  mcntinten_value;                   
wire             mcntinten_wen;                     
wire             mcntof_clk_en;                     
wire    [63 :0]  mcntof_value;                      
wire             mcntof_wen;                        
wire    [3  :0]  mcycle_adder;                      
wire             mcycle_clk_en;                     
wire             mcycle_en;                         
wire             mcycle_of;                         
wire    [63 :0]  mcycle_value;                      
wire             mcycle_wen;                        
wire    [3  :0]  mhpmcnt10_adder;                   
wire             mhpmcnt10_clk_en;                  
wire             mhpmcnt10_en;                      
wire             mhpmcnt10_of;                      
wire    [63 :0]  mhpmcnt10_value;                   
wire             mhpmcnt10_wen;                     
wire    [3  :0]  mhpmcnt11_adder;                   
wire             mhpmcnt11_clk_en;                  
wire             mhpmcnt11_en;                      
wire             mhpmcnt11_of;                      
wire    [63 :0]  mhpmcnt11_value;                   
wire             mhpmcnt11_wen;                     
wire    [3  :0]  mhpmcnt12_adder;                   
wire             mhpmcnt12_clk_en;                  
wire             mhpmcnt12_en;                      
wire             mhpmcnt12_of;                      
wire    [63 :0]  mhpmcnt12_value;                   
wire             mhpmcnt12_wen;                     
wire    [3  :0]  mhpmcnt13_adder;                   
wire             mhpmcnt13_clk_en;                  
wire             mhpmcnt13_en;                      
wire             mhpmcnt13_of;                      
wire    [63 :0]  mhpmcnt13_value;                   
wire             mhpmcnt13_wen;                     
wire    [3  :0]  mhpmcnt14_adder;                   
wire             mhpmcnt14_clk_en;                  
wire             mhpmcnt14_en;                      
wire             mhpmcnt14_of;                      
wire    [63 :0]  mhpmcnt14_value;                   
wire             mhpmcnt14_wen;                     
wire    [3  :0]  mhpmcnt15_adder;                   
wire             mhpmcnt15_clk_en;                  
wire             mhpmcnt15_en;                      
wire             mhpmcnt15_of;                      
wire    [63 :0]  mhpmcnt15_value;                   
wire             mhpmcnt15_wen;                     
wire    [3  :0]  mhpmcnt16_adder;                   
wire             mhpmcnt16_clk_en;                  
wire             mhpmcnt16_en;                      
wire             mhpmcnt16_of;                      
wire    [63 :0]  mhpmcnt16_value;                   
wire             mhpmcnt16_wen;                     
wire    [3  :0]  mhpmcnt17_adder;                   
wire             mhpmcnt17_clk_en;                  
wire             mhpmcnt17_en;                      
wire             mhpmcnt17_of;                      
wire    [63 :0]  mhpmcnt17_value;                   
wire             mhpmcnt17_wen;                     
wire    [3  :0]  mhpmcnt18_adder;                   
wire             mhpmcnt18_clk_en;                  
wire             mhpmcnt18_en;                      
wire             mhpmcnt18_of;                      
wire    [63 :0]  mhpmcnt18_value;                   
wire             mhpmcnt18_wen;                     
wire    [3  :0]  mhpmcnt3_adder;                    
wire             mhpmcnt3_clk_en;                   
wire             mhpmcnt3_en;                       
wire             mhpmcnt3_of;                       
wire    [63 :0]  mhpmcnt3_value;                    
wire             mhpmcnt3_wen;                      
wire    [3  :0]  mhpmcnt4_adder;                    
wire             mhpmcnt4_clk_en;                   
wire             mhpmcnt4_en;                       
wire             mhpmcnt4_of;                       
wire    [63 :0]  mhpmcnt4_value;                    
wire             mhpmcnt4_wen;                      
wire    [3  :0]  mhpmcnt5_adder;                    
wire             mhpmcnt5_clk_en;                   
wire             mhpmcnt5_en;                       
wire             mhpmcnt5_of;                       
wire    [63 :0]  mhpmcnt5_value;                    
wire             mhpmcnt5_wen;                      
wire    [3  :0]  mhpmcnt6_adder;                    
wire             mhpmcnt6_clk_en;                   
wire             mhpmcnt6_en;                       
wire             mhpmcnt6_of;                       
wire    [63 :0]  mhpmcnt6_value;                    
wire             mhpmcnt6_wen;                      
wire    [3  :0]  mhpmcnt7_adder;                    
wire             mhpmcnt7_clk_en;                   
wire             mhpmcnt7_en;                       
wire             mhpmcnt7_of;                       
wire    [63 :0]  mhpmcnt7_value;                    
wire             mhpmcnt7_wen;                      
wire    [3  :0]  mhpmcnt8_adder;                    
wire             mhpmcnt8_clk_en;                   
wire             mhpmcnt8_en;                       
wire             mhpmcnt8_of;                       
wire    [63 :0]  mhpmcnt8_value;                    
wire             mhpmcnt8_wen;                      
wire    [3  :0]  mhpmcnt9_adder;                    
wire             mhpmcnt9_clk_en;                   
wire             mhpmcnt9_en;                       
wire             mhpmcnt9_of;                       
wire    [63 :0]  mhpmcnt9_value;                    
wire             mhpmcnt9_wen;                      
wire             mhpmcr_clk_en;                     
wire    [63 :0]  mhpmcr_value;                      
wire             mhpmcr_wen;                        
wire             mhpmep_clk_en;                     
wire    [63 :0]  mhpmep_value;                      
wire             mhpmep_wen;                        
wire             mhpmevt10_clk_en;                  
wire    [63 :0]  mhpmevt10_value;                   
wire             mhpmevt10_wen;                     
wire             mhpmevt11_clk_en;                  
wire    [63 :0]  mhpmevt11_value;                   
wire             mhpmevt11_wen;                     
wire             mhpmevt12_clk_en;                  
wire    [63 :0]  mhpmevt12_value;                   
wire             mhpmevt12_wen;                     
wire             mhpmevt13_clk_en;                  
wire    [63 :0]  mhpmevt13_value;                   
wire             mhpmevt13_wen;                     
wire             mhpmevt14_clk_en;                  
wire    [63 :0]  mhpmevt14_value;                   
wire             mhpmevt14_wen;                     
wire             mhpmevt15_clk_en;                  
wire    [63 :0]  mhpmevt15_value;                   
wire             mhpmevt15_wen;                     
wire             mhpmevt16_clk_en;                  
wire    [63 :0]  mhpmevt16_value;                   
wire             mhpmevt16_wen;                     
wire             mhpmevt17_clk_en;                  
wire    [63 :0]  mhpmevt17_value;                   
wire             mhpmevt17_wen;                     
wire             mhpmevt18_clk_en;                  
wire    [63 :0]  mhpmevt18_value;                   
wire             mhpmevt18_wen;                     
wire             mhpmevt3_clk_en;                   
wire    [63 :0]  mhpmevt3_value;                    
wire             mhpmevt3_wen;                      
wire             mhpmevt4_clk_en;                   
wire    [63 :0]  mhpmevt4_value;                    
wire             mhpmevt4_wen;                      
wire             mhpmevt5_clk_en;                   
wire    [63 :0]  mhpmevt5_value;                    
wire             mhpmevt5_wen;                      
wire             mhpmevt6_clk_en;                   
wire    [63 :0]  mhpmevt6_value;                    
wire             mhpmevt6_wen;                      
wire             mhpmevt7_clk_en;                   
wire    [63 :0]  mhpmevt7_value;                    
wire             mhpmevt7_wen;                      
wire             mhpmevt8_clk_en;                   
wire    [63 :0]  mhpmevt8_value;                    
wire             mhpmevt8_wen;                      
wire             mhpmevt9_clk_en;                   
wire    [63 :0]  mhpmevt9_value;                    
wire             mhpmevt9_wen;                      
wire             mhpmsp_clk_en;                     
wire    [63 :0]  mhpmsp_value;                      
wire             mhpmsp_wen;                        
wire    [3  :0]  minstret_adder;                    
wire             minstret_clk_en;                   
wire             minstret_en;                       
wire             minstret_of;                       
wire    [63 :0]  minstret_value;                    
wire             minstret_wen;                      
wire             mmu_hpcp_dutlb_miss;               
wire             mmu_hpcp_iutlb_miss;               
wire             mmu_hpcp_jtlb_miss;                
wire             ofcnt_sel;                         
wire             pad_yy_icg_scan_en;                
wire             pipe0_inst_vld;                    
wire             pipe0_lch_fail;                    
wire             pipe1_inst_vld;                    
wire             pipe1_lch_fail;                    
wire             pipe2_inst_vld;                    
wire             pipe2_lch_fail;                    
wire             pipe3_inst_vld;                    
wire             pipe3_lch_fail;                    
wire             pipe3_reg_lch_fail;                
wire             pipe4_inst_vld;                    
wire             pipe4_lch_fail;                    
wire             pipe4_reg_lch_fail;                
wire             pipe5_inst_vld;                    
wire             pipe5_lch_fail;                    
wire             pipe5_reg_lch_fail;                
wire             pipe6_inst_vld;                    
wire             pipe6_lch_fail;                    
wire             pipe7_inst_vld;                    
wire             pipe7_lch_fail;                    
wire             rtu_hpcp_inst0_ack_int;            
wire             rtu_hpcp_inst0_bht_mispred;        
wire             rtu_hpcp_inst0_condbr;             
wire    [39 :0]  rtu_hpcp_inst0_cur_pc;             
wire             rtu_hpcp_inst0_jmp;                
wire             rtu_hpcp_inst0_jmp_mispred;        
wire             rtu_hpcp_inst0_jmp_pc_offset_8m;   
wire    [1  :0]  rtu_hpcp_inst0_num;                
wire    [2  :0]  rtu_hpcp_inst0_pc_offset;          
wire             rtu_hpcp_inst0_spec_fail;          
wire             rtu_hpcp_inst0_split;              
wire             rtu_hpcp_inst0_store;              
wire             rtu_hpcp_inst0_vld;                
wire             rtu_hpcp_inst1_condbr;             
wire    [39 :0]  rtu_hpcp_inst1_cur_pc;             
wire             rtu_hpcp_inst1_jmp;                
wire             rtu_hpcp_inst1_jmp_pc_offset_8m;   
wire    [1  :0]  rtu_hpcp_inst1_num;                
wire    [2  :0]  rtu_hpcp_inst1_pc_offset;          
wire             rtu_hpcp_inst1_split;              
wire             rtu_hpcp_inst1_store;              
wire             rtu_hpcp_inst1_vld;                
wire             rtu_hpcp_inst2_condbr;             
wire    [39 :0]  rtu_hpcp_inst2_cur_pc;             
wire             rtu_hpcp_inst2_jmp;                
wire             rtu_hpcp_inst2_jmp_pc_offset_8m;   
wire    [1  :0]  rtu_hpcp_inst2_num;                
wire    [2  :0]  rtu_hpcp_inst2_pc_offset;          
wire             rtu_hpcp_inst2_split;              
wire             rtu_hpcp_inst2_store;              
wire             rtu_hpcp_inst2_vld;                
wire             rtu_yy_xx_dbgon;                   
wire             rtu_yy_xx_flush;                   
wire             scntinhbt_clk_en;                  
wire    [31 :0]  scntinhbt_updt_value;              
wire    [63 :0]  scntinhbt_value;                   
wire             scntinhbt_wen;                     
wire             scntinten_clk_en;                  
wire    [63 :0]  scntinten_value;                   
wire             scntinten_wen;                     
wire             scntof_clk_en;                     
wire    [63 :0]  scntof_value;                      
wire             scntof_wen;                        
wire             shpmcr_clk_en;                     
wire    [63 :0]  shpmcr_value;                      
wire             shpmcr_wen;                        
wire             shpmep_clk_en;                     
wire    [63 :0]  shpmep_value;                      
wire             shpmep_wen;                        
wire             shpmsp_clk_en;                     
wire    [63 :0]  shpmsp_value;                      
wire             shpmsp_wen;                        
wire             spec_fail;                         
wire             start_vld;                         
wire             stop_vld;                          
wire             sync_stall;                        
wire             trigger_vld;                       


// &Depend("cpu_cfig.h"); @27

//define total counter num
parameter HPMCNT_NUM   = 42;
parameter HPMEVT_WIDTH = 6;
     
// performance monitor regs list in C960
// Machine Counter Setup
parameter MCNTINHBT = 12'h320;
parameter MCNTWEN   = 12'h7C9;
parameter MCNTINTEN = 12'h7CA;
parameter MCNTOF    = 12'h7CB;
parameter MHPMCR    = 12'h7F0;
parameter MHPMSP    = 12'h7F1;
parameter MHPMEP    = 12'h7F2;

parameter MHPMEVT3  = 12'h323;
parameter MHPMEVT4  = 12'h324;
parameter MHPMEVT5  = 12'h325;
parameter MHPMEVT6  = 12'h326;
parameter MHPMEVT7  = 12'h327;
parameter MHPMEVT8  = 12'h328;
parameter MHPMEVT9  = 12'h329;
parameter MHPMEVT10 = 12'h32A;
parameter MHPMEVT11 = 12'h32B;
parameter MHPMEVT12 = 12'h32C;
parameter MHPMEVT13 = 12'h32D;
parameter MHPMEVT14 = 12'h32E;
parameter MHPMEVT15 = 12'h32F;
parameter MHPMEVT16 = 12'h330;
parameter MHPMEVT17 = 12'h331;
parameter MHPMEVT18 = 12'h332;
parameter MHPMEVT19 = 12'h333;
parameter MHPMEVT20 = 12'h334;
parameter MHPMEVT21 = 12'h335;
parameter MHPMEVT22 = 12'h336;
parameter MHPMEVT23 = 12'h337;
parameter MHPMEVT24 = 12'h338;
parameter MHPMEVT25 = 12'h339;
parameter MHPMEVT26 = 12'h33A;
parameter MHPMEVT27 = 12'h33B;
parameter MHPMEVT28 = 12'h33C;
parameter MHPMEVT29 = 12'h33D;
parameter MHPMEVT30 = 12'h33E;
parameter MHPMEVT31 = 12'h33F;

// Machine Counters/Timers
parameter MCYCLE    = 12'hB00;
parameter MINSTRET  = 12'hB02;
parameter MHPMCNT3  = 12'hB03;
parameter MHPMCNT4  = 12'hB04;
parameter MHPMCNT5  = 12'hB05;
parameter MHPMCNT6  = 12'hB06;
parameter MHPMCNT7  = 12'hB07;
parameter MHPMCNT8  = 12'hB08;
parameter MHPMCNT9  = 12'hB09;
parameter MHPMCNT10 = 12'hB0A;
parameter MHPMCNT11 = 12'hB0B;
parameter MHPMCNT12 = 12'hB0C;
parameter MHPMCNT13 = 12'hB0D;
parameter MHPMCNT14 = 12'hB0E;
parameter MHPMCNT15 = 12'hB0F;
parameter MHPMCNT16 = 12'hB10;
parameter MHPMCNT17 = 12'hB11;
parameter MHPMCNT18 = 12'hB12;
parameter MHPMCNT19 = 12'hB13;
parameter MHPMCNT20 = 12'hB14;
parameter MHPMCNT21 = 12'hB15;
parameter MHPMCNT22 = 12'hB16;
parameter MHPMCNT23 = 12'hB17;
parameter MHPMCNT24 = 12'hB18;
parameter MHPMCNT25 = 12'hB19;
parameter MHPMCNT26 = 12'hB1A;
parameter MHPMCNT27 = 12'hB1B;
parameter MHPMCNT28 = 12'hB1C;
parameter MHPMCNT29 = 12'hB1D;
parameter MHPMCNT30 = 12'hB1E;
parameter MHPMCNT31 = 12'hB1F;

//Supervisor Control Registor
parameter SCNTINTEN = 12'h5C4;
parameter SCNTOF    = 12'h5C5;
parameter SCNTINHBT = 12'h5C8;
parameter SHPMCR    = 12'h5C9;
parameter SHPMSP    = 12'h5CA;
parameter SHPMEP    = 12'h5CB;
//Supervisor Couters
parameter SCYCLE    = 12'h5E0;
parameter SINSTRET  = 12'h5E2;
parameter SHPMCNT3  = 12'h5E3;
parameter SHPMCNT4  = 12'h5E4;
parameter SHPMCNT5  = 12'h5E5;
parameter SHPMCNT6  = 12'h5E6;
parameter SHPMCNT7  = 12'h5E7;
parameter SHPMCNT8  = 12'h5E8;
parameter SHPMCNT9  = 12'h5E9;
parameter SHPMCNT10 = 12'h5EA;
parameter SHPMCNT11 = 12'h5EB;
parameter SHPMCNT12 = 12'h5EC;
parameter SHPMCNT13 = 12'h5ED;
parameter SHPMCNT14 = 12'h5EE;
parameter SHPMCNT15 = 12'h5EF;
parameter SHPMCNT16 = 12'h5F0;
parameter SHPMCNT17 = 12'h5F1;
parameter SHPMCNT18 = 12'h5F2;
parameter SHPMCNT19 = 12'h5F3;
parameter SHPMCNT20 = 12'h5F4;
parameter SHPMCNT21 = 12'h5F5;
parameter SHPMCNT22 = 12'h5F6;
parameter SHPMCNT23 = 12'h5F7;
parameter SHPMCNT24 = 12'h5F8;
parameter SHPMCNT25 = 12'h5F9;
parameter SHPMCNT26 = 12'h5FA;
parameter SHPMCNT27 = 12'h5FB;
parameter SHPMCNT28 = 12'h5FC;
parameter SHPMCNT29 = 12'h5FD;
parameter SHPMCNT30 = 12'h5FE;
parameter SHPMCNT31 = 12'h5FF;

// User Counters/Timers
parameter CYCLE    = 12'hC00;
parameter TIME     = 12'hC01;
parameter INSTRET  = 12'hC02;
parameter HPMCNT3  = 12'hC03;
parameter HPMCNT4  = 12'hC04;
parameter HPMCNT5  = 12'hC05;
parameter HPMCNT6  = 12'hC06;
parameter HPMCNT7  = 12'hC07;
parameter HPMCNT8  = 12'hC08;
parameter HPMCNT9  = 12'hC09;
parameter HPMCNT10 = 12'hC0A;
parameter HPMCNT11 = 12'hC0B;
parameter HPMCNT12 = 12'hC0C;
parameter HPMCNT13 = 12'hC0D;
parameter HPMCNT14 = 12'hC0E;
parameter HPMCNT15 = 12'hC0F;
parameter HPMCNT16 = 12'hC10;
parameter HPMCNT17 = 12'hC11;
parameter HPMCNT18 = 12'hC12;
parameter HPMCNT19 = 12'hC13;
parameter HPMCNT20 = 12'hC14;
parameter HPMCNT21 = 12'hC15;
parameter HPMCNT22 = 12'hC16;
parameter HPMCNT23 = 12'hC17;
parameter HPMCNT24 = 12'hC18;
parameter HPMCNT25 = 12'hC19;
parameter HPMCNT26 = 12'hC1A;
parameter HPMCNT27 = 12'hC1B;
parameter HPMCNT28 = 12'hC1C;
parameter HPMCNT29 = 12'hC1D;
parameter HPMCNT30 = 12'hC1E;
parameter HPMCNT31 = 12'hC1F;

//==========================================================
//                     Gated clk 
//==========================================================
// &Instance("gated_clk_cell", "x_hpcp_gated_clk"); @183
gated_clk_cell  x_hpcp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (hpcp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (hpcp_clk_en       ),
  .module_en          (cp0_hpcp_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @184
//          .external_en (1'b0), @185
//          .global_en   (1'b1), @186
//          .module_en   (cp0_hpcp_icg_en), @187
//          .local_en    (hpcp_clk_en), @188
//          .clk_out     (hpcp_clk)); @189
assign hpcp_clk_en = mcntinhbt_clk_en 
                  || mcntinten_clk_en 
                  || mhpmcr_clk_en
                  || mhpmsp_clk_en
                  || mhpmep_clk_en
                  || scntinhbt_clk_en
                  || scntinten_clk_en
                  || shpmcr_clk_en
                  || shpmsp_clk_en
                  || shpmep_clk_en
                  || mcntof_clk_en
                  || scntof_clk_en
                  || biu_hpcp_cmplt
                  || l2of_int_updt_vld
                  || l2of_data_updt_vld  
                  || cp0_hpcp_sel
                  || hpcp_cp0_cmplt
                  || rtu_yy_xx_flush
                  || (|counter_overflow[31:0])
                  || (cnt_mode_dis_pre^cnt_mode_dis);

//==========================================================
//              FSM of HPCP control logic
//==========================================================
parameter EX1  = 2'b01;
parameter EX2  = 2'b10;

always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state[1:0] <= EX1;
  else if(rtu_yy_xx_flush)
    cur_state[1:0] <= EX1;
  else
    cur_state[1:0] <= next_state[1:0];
end

// &CombBeg; @227
always @( cur_state[1:0]
       or hpcp_cp0_cmplt
       or cp0_hpcp_sel)
begin
  case(cur_state[1:0])
    EX1     : if(cp0_hpcp_sel)
                next_state[1:0] = EX2;
              else
                next_state[1:0] = EX1;
    EX2     : if(hpcp_cp0_cmplt)
                next_state[1:0] = EX1;
              else
                next_state[1:0] = EX2;
     default: next_state[1:0] = EX1;
   endcase
// &CombEnd; @239
end

//==========================================================
//                Event Signals Rename
//==========================================================
assign hpcp_retire_inst0_vld          = rtu_hpcp_inst0_vld;
assign hpcp_retire_inst1_vld          = rtu_hpcp_inst1_vld;
assign hpcp_retire_inst2_vld          = rtu_hpcp_inst2_vld;
assign hpcp_retire_inst0_pc[39:0]     = rtu_hpcp_inst0_cur_pc[39:0];
assign hpcp_retire_inst1_pc[39:0]     = rtu_hpcp_inst1_cur_pc[39:0];
assign hpcp_retire_inst2_pc[39:0]     = rtu_hpcp_inst2_cur_pc[39:0];
assign hpcp_retire_inst0_offset[2:0]  = rtu_hpcp_inst0_pc_offset[2:0];
assign hpcp_retire_inst1_offset[2:0]  = rtu_hpcp_inst1_pc_offset[2:0];
assign hpcp_retire_inst2_offset[2:0]  = rtu_hpcp_inst2_pc_offset[2:0];
assign hpcp_retire_inst0_split        = rtu_hpcp_inst0_split;
assign hpcp_retire_inst1_split        = rtu_hpcp_inst1_split;
assign hpcp_retire_inst2_split        = rtu_hpcp_inst2_split;
assign hpcp_retire_inst0_num[1:0]     = rtu_hpcp_inst0_num[1:0];
assign hpcp_retire_inst1_num[1:0]     = rtu_hpcp_inst1_num[1:0];
assign hpcp_retire_inst2_num[1:0]     = rtu_hpcp_inst2_num[1:0];
assign hpcp_retire_inst0_condbr       = rtu_hpcp_inst0_condbr;
assign hpcp_retire_inst1_condbr       = rtu_hpcp_inst1_condbr;
assign hpcp_retire_inst2_condbr       = rtu_hpcp_inst2_condbr;
assign hpcp_retire_inst0_jmp          = rtu_hpcp_inst0_jmp;
assign hpcp_retire_inst1_jmp          = rtu_hpcp_inst1_jmp;
assign hpcp_retire_inst2_jmp          = rtu_hpcp_inst2_jmp;
assign hpcp_retire_bht_mispred        = rtu_hpcp_inst0_bht_mispred;
assign hpcp_retire_jmp_mispred        = rtu_hpcp_inst0_jmp_mispred;
assign hpcp_retire_inst0_store        = rtu_hpcp_inst0_store;
assign hpcp_retire_inst1_store        = rtu_hpcp_inst1_store;
assign hpcp_retire_inst2_store        = rtu_hpcp_inst2_store;
assign hpcp_retire_spec_fail          = rtu_hpcp_inst0_spec_fail;
assign hpcp_icache_access             = ifu_hpcp_icache_access;
assign hpcp_icache_miss               = ifu_hpcp_icache_miss;
assign hpcp_branch_target_mispred     = ifu_hpcp_btb_mispred;
assign hpcp_branch_target_inst        = ifu_hpcp_btb_inst;
assign hpcp_tlb_iutlb_miss            = mmu_hpcp_iutlb_miss;
assign hpcp_tlb_dutlb_miss            = mmu_hpcp_dutlb_miss;
assign hpcp_tlb_jtlb_miss             = mmu_hpcp_jtlb_miss;
assign hpcp_dcache_read_access        = lsu_hpcp_cache_read_access;
assign hpcp_dcache_read_miss          = lsu_hpcp_cache_read_miss;
assign hpcp_dcache_write_access       = lsu_hpcp_cache_write_access;
assign hpcp_dcache_write_miss         = lsu_hpcp_cache_write_miss;
//L2 counter will be maintained by CIU
//assign hpcp_l2cache_read_access[1:0]  = biu_hpcp_l2cache_read_acc[1:0];
//assign hpcp_l2cache_read_miss[1:0]    = biu_hpcp_l2cache_read_mis[1:0];
//assign hpcp_l2cache_write_access[1:0] = biu_hpcp_l2cache_write_acc[1:0];
//assign hpcp_l2cache_write_miss[1:0]   = biu_hpcp_l2cache_write_mis[1:0];
assign hpcp_rf_inst_vld               = idu_hpcp_rf_inst_vld;
assign hpcp_rf_pipe0_inst_vld         = idu_hpcp_rf_pipe0_inst_vld;
assign hpcp_rf_pipe1_inst_vld         = idu_hpcp_rf_pipe1_inst_vld;
assign hpcp_rf_pipe2_inst_vld         = idu_hpcp_rf_pipe2_inst_vld;
assign hpcp_rf_pipe3_inst_vld         = idu_hpcp_rf_pipe3_inst_vld;
assign hpcp_rf_pipe4_inst_vld         = idu_hpcp_rf_pipe4_inst_vld;
assign hpcp_rf_pipe5_inst_vld         = idu_hpcp_rf_pipe5_inst_vld;
assign hpcp_rf_pipe6_inst_vld         = idu_hpcp_rf_pipe6_inst_vld;
assign hpcp_rf_pipe7_inst_vld         = idu_hpcp_rf_pipe7_inst_vld;
assign hpcp_rf_pipe0_lch_fail_vld     = idu_hpcp_rf_pipe0_lch_fail_vld;
assign hpcp_rf_pipe1_lch_fail_vld     = idu_hpcp_rf_pipe1_lch_fail_vld;
assign hpcp_rf_pipe2_lch_fail_vld     = idu_hpcp_rf_pipe2_lch_fail_vld;
assign hpcp_rf_pipe3_lch_fail_vld     = idu_hpcp_rf_pipe3_lch_fail_vld;
assign hpcp_rf_pipe4_lch_fail_vld     = idu_hpcp_rf_pipe4_lch_fail_vld;
assign hpcp_rf_pipe5_lch_fail_vld     = idu_hpcp_rf_pipe5_lch_fail_vld;
assign hpcp_rf_pipe6_lch_fail_vld     = idu_hpcp_rf_pipe6_lch_fail_vld;
assign hpcp_rf_pipe7_lch_fail_vld     = idu_hpcp_rf_pipe7_lch_fail_vld;
assign hpcp_rf_pipe3_reg_lch_fail_vld = idu_hpcp_rf_pipe3_reg_lch_fail_vld;
assign hpcp_rf_pipe4_reg_lch_fail_vld = idu_hpcp_rf_pipe4_reg_lch_fail_vld;
assign hpcp_rf_pipe5_reg_lch_fail_vld = idu_hpcp_rf_pipe5_reg_lch_fail_vld;
assign hpcp_ld_cross_4k_stall         = lsu_hpcp_ld_stall_cross_4k;
assign hpcp_st_cross_4k_stall         = lsu_hpcp_st_stall_cross_4k;
assign hpcp_ld_other_stall            = lsu_hpcp_ld_stall_other;
assign hpcp_st_other_stall            = lsu_hpcp_st_stall_other;
assign hpcp_sq_discard                = lsu_hpcp_replay_discard_sq;
assign hpcp_sq_data_discard           = lsu_hpcp_replay_data_discard;
assign hpcp_ir_inst0_vld              = idu_hpcp_ir_inst0_vld;
assign hpcp_ir_inst0_type[6:0]        = idu_hpcp_ir_inst0_type[6:0];
assign hpcp_ir_inst1_vld              = idu_hpcp_ir_inst1_vld;
assign hpcp_ir_inst1_type[6:0]        = idu_hpcp_ir_inst1_type[6:0];
assign hpcp_ir_inst2_vld              = idu_hpcp_ir_inst2_vld;
assign hpcp_ir_inst2_type[6:0]        = idu_hpcp_ir_inst2_type[6:0];
assign hpcp_ir_inst3_vld              = idu_hpcp_ir_inst3_vld;
assign hpcp_ir_inst3_type[6:0]        = idu_hpcp_ir_inst3_type[6:0];
assign hpcp_unalign_inst[1:0]         = lsu_hpcp_unalign_inst[1:0];
assign hpcp_int_disable               = cp0_hpcp_int_disable;
assign hpcp_int_ack                   = rtu_hpcp_inst0_ack_int;
assign hpcp_inst0_jmp_over_8m         = rtu_hpcp_inst0_jmp_pc_offset_8m;
assign hpcp_inst1_jmp_over_8m         = rtu_hpcp_inst1_jmp_pc_offset_8m;
assign hpcp_inst2_jmp_over_8m         = rtu_hpcp_inst2_jmp_pc_offset_8m;
assign hpcp_backend_stall             = idu_hpcp_backend_stall;
assign hpcp_frontend_stall            = ifu_hpcp_frontend_stall;
assign hpcp_fence_sync_vld            = idu_hpcp_fence_sync_vld;
assign hpcp_fence_stall               = lsu_hpcp_fence_stall;

//==============================================================================
// Write signal 
//==============================================================================
//machine mode counter inhibit
//machine counter write en
assign hpcp_wen        = cp0_hpcp_op[3] && (cur_state[1:0] == EX2); 

assign mcntinhbt_wen   = (cp0_hpcp_index[11:0] == MCNTINHBT ) && hpcp_wen;
assign mcntinten_wen   = (cp0_hpcp_index[11:0] == MCNTINTEN ) && hpcp_wen; 
assign mcntof_wen      = (cp0_hpcp_index[11:0] == MCNTOF    ) && hpcp_wen; 
assign mhpmcr_wen      = (cp0_hpcp_index[11:0] == MHPMCR    ) && hpcp_wen; 
assign mhpmsp_wen      = (cp0_hpcp_index[11:0] == MHPMSP    ) && hpcp_wen; 
assign mhpmep_wen      = (cp0_hpcp_index[11:0] == MHPMEP    ) && hpcp_wen; 

//mhpmevt write enable 
assign mhpmevt3_wen    = (cp0_hpcp_index[11:0] == MHPMEVT3 ) && hpcp_wen;
assign mhpmevt4_wen    = (cp0_hpcp_index[11:0] == MHPMEVT4 ) && hpcp_wen;
assign mhpmevt5_wen    = (cp0_hpcp_index[11:0] == MHPMEVT5 ) && hpcp_wen;
assign mhpmevt6_wen    = (cp0_hpcp_index[11:0] == MHPMEVT6 ) && hpcp_wen;
assign mhpmevt7_wen    = (cp0_hpcp_index[11:0] == MHPMEVT7 ) && hpcp_wen;
assign mhpmevt8_wen    = (cp0_hpcp_index[11:0] == MHPMEVT8 ) && hpcp_wen;
assign mhpmevt9_wen    = (cp0_hpcp_index[11:0] == MHPMEVT9 ) && hpcp_wen;
assign mhpmevt10_wen   = (cp0_hpcp_index[11:0] == MHPMEVT10) && hpcp_wen;
assign mhpmevt11_wen   = (cp0_hpcp_index[11:0] == MHPMEVT11) && hpcp_wen;
assign mhpmevt12_wen   = (cp0_hpcp_index[11:0] == MHPMEVT12) && hpcp_wen;
assign mhpmevt13_wen   = (cp0_hpcp_index[11:0] == MHPMEVT13) && hpcp_wen;
assign mhpmevt14_wen   = (cp0_hpcp_index[11:0] == MHPMEVT14) && hpcp_wen;
assign mhpmevt15_wen   = (cp0_hpcp_index[11:0] == MHPMEVT15) && hpcp_wen;
assign mhpmevt16_wen   = (cp0_hpcp_index[11:0] == MHPMEVT16) && hpcp_wen;
assign mhpmevt17_wen   = (cp0_hpcp_index[11:0] == MHPMEVT17) && hpcp_wen;
assign mhpmevt18_wen   = (cp0_hpcp_index[11:0] == MHPMEVT18) && hpcp_wen;

// counter write enable signal                      
assign mcycle_wen      = ((cp0_hpcp_index[11:0] == MCYCLE)    || (cp0_hpcp_index[11:0] == SCYCLE)   ) && hpcp_wen;
assign minstret_wen    = ((cp0_hpcp_index[11:0] == MINSTRET)  || (cp0_hpcp_index[11:0] == SINSTRET) ) && hpcp_wen;

assign mhpmcnt3_wen    = ((cp0_hpcp_index[11:0] == MHPMCNT3)  || (cp0_hpcp_index[11:0] == SHPMCNT3) ) && hpcp_wen; 
assign mhpmcnt4_wen    = ((cp0_hpcp_index[11:0] == MHPMCNT4)  || (cp0_hpcp_index[11:0] == SHPMCNT4) ) && hpcp_wen; 
assign mhpmcnt5_wen    = ((cp0_hpcp_index[11:0] == MHPMCNT5)  || (cp0_hpcp_index[11:0] == SHPMCNT5) ) && hpcp_wen; 
assign mhpmcnt6_wen    = ((cp0_hpcp_index[11:0] == MHPMCNT6)  || (cp0_hpcp_index[11:0] == SHPMCNT6) ) && hpcp_wen; 
assign mhpmcnt7_wen    = ((cp0_hpcp_index[11:0] == MHPMCNT7)  || (cp0_hpcp_index[11:0] == SHPMCNT7) ) && hpcp_wen; 
assign mhpmcnt8_wen    = ((cp0_hpcp_index[11:0] == MHPMCNT8)  || (cp0_hpcp_index[11:0] == SHPMCNT8) ) && hpcp_wen; 
assign mhpmcnt9_wen    = ((cp0_hpcp_index[11:0] == MHPMCNT9)  || (cp0_hpcp_index[11:0] == SHPMCNT9) ) && hpcp_wen; 
assign mhpmcnt10_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT10) || (cp0_hpcp_index[11:0] == SHPMCNT10)) && hpcp_wen; 
assign mhpmcnt11_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT11) || (cp0_hpcp_index[11:0] == SHPMCNT11)) && hpcp_wen; 
assign mhpmcnt12_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT12) || (cp0_hpcp_index[11:0] == SHPMCNT12)) && hpcp_wen; 
assign mhpmcnt13_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT13) || (cp0_hpcp_index[11:0] == SHPMCNT13)) && hpcp_wen; 
assign mhpmcnt14_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT14) || (cp0_hpcp_index[11:0] == SHPMCNT14)) && hpcp_wen; 
assign mhpmcnt15_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT15) || (cp0_hpcp_index[11:0] == SHPMCNT15)) && hpcp_wen; 
assign mhpmcnt16_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT16) || (cp0_hpcp_index[11:0] == SHPMCNT16)) && hpcp_wen; 
assign mhpmcnt17_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT17) || (cp0_hpcp_index[11:0] == SHPMCNT17)) && hpcp_wen; 
assign mhpmcnt18_wen   = ((cp0_hpcp_index[11:0] == MHPMCNT18) || (cp0_hpcp_index[11:0] == SHPMCNT18)) && hpcp_wen; 

//Supervisor counter write en
assign scntinhbt_wen   = (cp0_hpcp_index[11:0] == SCNTINHBT ) && hpcp_wen;
assign scntinten_wen   = (cp0_hpcp_index[11:0] == SCNTINTEN ) && hpcp_wen; 
assign scntof_wen      = (cp0_hpcp_index[11:0] == SCNTOF    ) && hpcp_wen; 
assign shpmcr_wen      = (cp0_hpcp_index[11:0] == SHPMCR    ) && hpcp_wen; 
assign shpmsp_wen      = (cp0_hpcp_index[11:0] == SHPMSP    ) && hpcp_wen; 
assign shpmep_wen      = (cp0_hpcp_index[11:0] == SHPMEP    ) && hpcp_wen; 

//==============================================================================
//                Counter Control Signals
//==============================================================================
//when user/supervisor/machine counter disable,counter can not count
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cnt_mode_dis <= 1'b0;
  else
    cnt_mode_dis <= cnt_mode_dis_pre;
end

assign cnt_mode_dis_pre = (cp0_yy_priv_mode[1:0] == 2'b11) && cp0_hpcp_pmdm
                       || (cp0_yy_priv_mode[1:0] == 2'b01) && cp0_hpcp_pmds
                       || (cp0_yy_priv_mode[1:0] == 2'b00) && cp0_hpcp_pmdu;

assign hpcp_cnt_en  = (tme[1:0] == 2'b00)
                   || (tme[1:0] == 2'b01) && ts
                   || (tme[1:0] == 2'b10) && ts; 
                 

// enable counter
assign mcycle_en    = !rtu_yy_xx_dbgon && !cnt_mode_dis && !mcntinhbt_value[0];
assign minstret_en  = !rtu_yy_xx_dbgon && !cnt_mode_dis && !mcntinhbt_value[2];

assign mhpmcnt3_en  = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[3]  && !mcntinhbt_value[3]  && (|mhpmevt3_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt4_en  = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[4]  && !mcntinhbt_value[4]  && (|mhpmevt4_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt5_en  = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[5]  && !mcntinhbt_value[5]  && (|mhpmevt5_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt6_en  = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[6]  && !mcntinhbt_value[6]  && (|mhpmevt6_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt7_en  = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[7]  && !mcntinhbt_value[7]  && (|mhpmevt7_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt8_en  = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[8]  && !mcntinhbt_value[8]  && (|mhpmevt8_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt9_en  = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[9]  && !mcntinhbt_value[9]  && (|mhpmevt9_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt10_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[10] && !mcntinhbt_value[10] && (|mhpmevt10_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt11_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[11] && !mcntinhbt_value[11] && (|mhpmevt11_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt12_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[12] && !mcntinhbt_value[12] && (|mhpmevt12_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt13_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[13] && !mcntinhbt_value[13] && (|mhpmevt13_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt14_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[14] && !mcntinhbt_value[14] && (|mhpmevt14_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt15_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[15] && !mcntinhbt_value[15] && (|mhpmevt15_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt16_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[16] && !mcntinhbt_value[16] && (|mhpmevt16_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt17_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[17] && !mcntinhbt_value[17] && (|mhpmevt17_value[HPMEVT_WIDTH-1:0]);
assign mhpmcnt18_en = !rtu_yy_xx_dbgon && !cnt_mode_dis && !cnt_mask[18] && !mcntinhbt_value[18] && (|mhpmevt18_value[HPMEVT_WIDTH-1:0]);
                                                            
//==============================================================================
//                Counter Adders
//==============================================================================
//1. cycles
assign mcycle_adder[3:0]   = 4'b1;

//2. inst retire
assign inst0_vld[1:0]      = {hpcp_retire_inst0_vld && !hpcp_retire_inst0_split,
                              hpcp_retire_inst0_vld && !hpcp_retire_inst0_split};
assign inst1_vld[1:0]      = {hpcp_retire_inst1_vld && !hpcp_retire_inst1_split,
                              hpcp_retire_inst1_vld && !hpcp_retire_inst1_split};
assign inst2_vld[1:0]      = {hpcp_retire_inst2_vld && !hpcp_retire_inst2_split,
                              hpcp_retire_inst2_vld && !hpcp_retire_inst2_split};
assign minstret_adder[3:0] = ({2'b0,inst0_vld[1:0]} & {2'b0,hpcp_retire_inst0_num[1:0]})
                           + ({2'b0,inst1_vld[1:0]} & {2'b0,hpcp_retire_inst1_num[1:0]})
                           + ({2'b0,inst2_vld[1:0]} & {2'b0,hpcp_retire_inst2_num[1:0]});

//3.universal counter 
assign bht_mispred        = hpcp_retire_inst0_vld && hpcp_retire_bht_mispred;

assign inst0_condbr       = hpcp_retire_inst0_vld && hpcp_retire_inst0_condbr;
assign inst1_condbr       = hpcp_retire_inst1_vld && hpcp_retire_inst1_condbr;
assign inst2_condbr       = hpcp_retire_inst2_vld && hpcp_retire_inst2_condbr;

assign jmp_mispred        = hpcp_retire_inst0_vld && hpcp_retire_jmp_mispred;

assign inst0_jmp          = hpcp_retire_inst0_vld && hpcp_retire_inst0_jmp;
assign inst1_jmp          = hpcp_retire_inst1_vld && hpcp_retire_inst1_jmp;
assign inst2_jmp          = hpcp_retire_inst2_vld && hpcp_retire_inst2_jmp;

assign spec_fail          = hpcp_retire_inst0_vld && hpcp_retire_spec_fail;

assign inst0_store        = hpcp_retire_inst0_vld && hpcp_retire_inst0_store;
assign inst1_store        = hpcp_retire_inst1_vld && hpcp_retire_inst1_store;
assign inst2_store        = hpcp_retire_inst2_vld && hpcp_retire_inst2_store;

assign pipe0_lch_fail     = hpcp_rf_inst_vld && hpcp_rf_pipe0_lch_fail_vld;
assign pipe1_lch_fail     = hpcp_rf_inst_vld && hpcp_rf_pipe1_lch_fail_vld;
assign pipe2_lch_fail     = hpcp_rf_inst_vld && hpcp_rf_pipe2_lch_fail_vld;
assign pipe3_lch_fail     = hpcp_rf_inst_vld && hpcp_rf_pipe3_lch_fail_vld;
assign pipe4_lch_fail     = hpcp_rf_inst_vld && hpcp_rf_pipe4_lch_fail_vld;
assign pipe5_lch_fail     = hpcp_rf_inst_vld && hpcp_rf_pipe5_lch_fail_vld;
assign pipe6_lch_fail     = hpcp_rf_inst_vld && hpcp_rf_pipe6_lch_fail_vld;
assign pipe7_lch_fail     = hpcp_rf_inst_vld && hpcp_rf_pipe7_lch_fail_vld;

assign pipe3_reg_lch_fail = hpcp_rf_inst_vld && hpcp_rf_pipe3_reg_lch_fail_vld;
assign pipe4_reg_lch_fail = hpcp_rf_inst_vld && hpcp_rf_pipe4_reg_lch_fail_vld;
assign pipe5_reg_lch_fail = hpcp_rf_inst_vld && hpcp_rf_pipe5_reg_lch_fail_vld;

assign pipe0_inst_vld     = hpcp_rf_inst_vld && hpcp_rf_pipe0_inst_vld;
assign pipe1_inst_vld     = hpcp_rf_inst_vld && hpcp_rf_pipe1_inst_vld;
assign pipe2_inst_vld     = hpcp_rf_inst_vld && hpcp_rf_pipe2_inst_vld;
assign pipe3_inst_vld     = hpcp_rf_inst_vld && hpcp_rf_pipe3_inst_vld;
assign pipe4_inst_vld     = hpcp_rf_inst_vld && hpcp_rf_pipe4_inst_vld;
assign pipe5_inst_vld     = hpcp_rf_inst_vld && hpcp_rf_pipe5_inst_vld;
assign pipe6_inst_vld     = hpcp_rf_inst_vld && hpcp_rf_pipe6_inst_vld;
assign pipe7_inst_vld     = hpcp_rf_inst_vld && hpcp_rf_pipe7_inst_vld;

assign ir_inst0_alu       = hpcp_ir_inst0_vld && hpcp_ir_inst0_type[0] && !hpcp_ir_inst0_type[2] && !hpcp_ir_inst0_type[6];
assign ir_inst1_alu       = hpcp_ir_inst1_vld && hpcp_ir_inst1_type[0] && !hpcp_ir_inst1_type[2] && !hpcp_ir_inst1_type[6];
assign ir_inst2_alu       = hpcp_ir_inst2_vld && hpcp_ir_inst2_type[0] && !hpcp_ir_inst2_type[2] && !hpcp_ir_inst2_type[6];
assign ir_inst3_alu       = hpcp_ir_inst3_vld && hpcp_ir_inst3_type[0] && !hpcp_ir_inst3_type[2] && !hpcp_ir_inst3_type[6];
assign ir_inst0_ldst      = hpcp_ir_inst0_vld && hpcp_ir_inst0_type[1] && !hpcp_ir_inst0_type[5];
assign ir_inst1_ldst      = hpcp_ir_inst1_vld && hpcp_ir_inst1_type[1] && !hpcp_ir_inst1_type[5];
assign ir_inst2_ldst      = hpcp_ir_inst2_vld && hpcp_ir_inst2_type[1] && !hpcp_ir_inst2_type[5];
assign ir_inst3_ldst      = hpcp_ir_inst3_vld && hpcp_ir_inst3_type[1] && !hpcp_ir_inst3_type[5];
assign ir_inst0_vec       = hpcp_ir_inst0_vld && hpcp_ir_inst0_type[2] && !hpcp_ir_inst0_type[5];
assign ir_inst1_vec       = hpcp_ir_inst1_vld && hpcp_ir_inst1_type[2] && !hpcp_ir_inst1_type[5];
assign ir_inst2_vec       = hpcp_ir_inst2_vld && hpcp_ir_inst2_type[2] && !hpcp_ir_inst2_type[5];
assign ir_inst3_vec       = hpcp_ir_inst3_vld && hpcp_ir_inst3_type[2] && !hpcp_ir_inst3_type[5];
assign ir_inst0_csr       = hpcp_ir_inst0_vld && hpcp_ir_inst0_type[3];
assign ir_inst1_csr       = hpcp_ir_inst1_vld && hpcp_ir_inst1_type[3];
assign ir_inst2_csr       = hpcp_ir_inst2_vld && hpcp_ir_inst2_type[3];
assign ir_inst3_csr       = hpcp_ir_inst3_vld && hpcp_ir_inst3_type[3];
assign ir_inst0_ecall     = hpcp_ir_inst0_vld && hpcp_ir_inst0_type[4];
assign ir_inst1_ecall     = hpcp_ir_inst1_vld && hpcp_ir_inst1_type[4];
assign ir_inst2_ecall     = hpcp_ir_inst2_vld && hpcp_ir_inst2_type[4];
assign ir_inst3_ecall     = hpcp_ir_inst3_vld && hpcp_ir_inst3_type[4];
assign ir_inst0_sync      = hpcp_ir_inst0_vld && hpcp_ir_inst0_type[5];
assign ir_inst1_sync      = hpcp_ir_inst1_vld && hpcp_ir_inst1_type[5];
assign ir_inst2_sync      = hpcp_ir_inst2_vld && hpcp_ir_inst2_type[5];
assign ir_inst3_sync      = hpcp_ir_inst3_vld && hpcp_ir_inst3_type[5];
assign ir_inst0_fpu       = hpcp_ir_inst0_vld && hpcp_ir_inst0_type[6];
assign ir_inst1_fpu       = hpcp_ir_inst1_vld && hpcp_ir_inst1_type[6];
assign ir_inst2_fpu       = hpcp_ir_inst2_vld && hpcp_ir_inst2_type[6];
assign ir_inst3_fpu       = hpcp_ir_inst3_vld && hpcp_ir_inst3_type[6];

assign inst0_long_jump    = hpcp_retire_inst0_vld && hpcp_inst0_jmp_over_8m;
assign inst1_long_jump    = hpcp_retire_inst1_vld && hpcp_inst1_jmp_over_8m;
assign inst2_long_jump    = hpcp_retire_inst2_vld && hpcp_inst2_jmp_over_8m;

assign sync_stall         = hpcp_fence_stall || hpcp_fence_sync_vld;

assign int_ack_vld        = hpcp_int_ack && hpcp_retire_inst0_vld;

//event adder
assign event01_adder[3:0] = {3'b0,hpcp_icache_access};
assign event02_adder[3:0] = {3'b0,hpcp_icache_miss};
assign event03_adder[3:0] = {3'b0,hpcp_tlb_iutlb_miss};
assign event04_adder[3:0] = {3'b0,hpcp_tlb_dutlb_miss};
assign event05_adder[3:0] = {3'b0,hpcp_tlb_jtlb_miss};
assign event06_adder[3:0] = {3'b0,bht_mispred};
assign event07_adder[3:0] = {3'b0,inst0_condbr} + {3'b0,inst1_condbr} + {3'b0,inst2_condbr};
assign event08_adder[3:0] = {3'b0,jmp_mispred};
assign event09_adder[3:0] = {3'b0,inst0_jmp} + {3'b0,inst1_jmp}  + {3'b0,inst2_jmp};
assign event10_adder[3:0] = {3'b0,spec_fail}; 
assign event11_adder[3:0] = {3'b0,inst0_store} + {3'b0,inst1_store} + {3'b0,inst2_store};
assign event12_adder[3:0] = {3'b0,hpcp_dcache_read_access}; 
assign event13_adder[3:0] = {3'b0,hpcp_dcache_read_miss}; 
assign event14_adder[3:0] = {3'b0,hpcp_dcache_write_access};
assign event15_adder[3:0] = {3'b0,hpcp_dcache_write_miss};
//tie to zero for L2 counter 
assign event16_adder[3:0] = 4'b0;
assign event17_adder[3:0] = 4'b0;
assign event18_adder[3:0] = 4'b0;
assign event19_adder[3:0] = 4'b0;
//assign event16_adder[3:0] = {2'b0,hpcp_l2cache_read_access[1:0]};
//assign event17_adder[3:0] = {2'b0,hpcp_l2cache_read_miss[1:0]};
//assign event18_adder[3:0] = {2'b0,hpcp_l2cache_write_access[1:0]};
//assign event19_adder[3:0] = {2'b0,hpcp_l2cache_write_miss[1:0]};
assign event20_adder[3:0] = {3'b0,pipe0_lch_fail} + {3'b0,pipe1_lch_fail} + {3'b0,pipe2_lch_fail}
                          + {3'b0,pipe3_lch_fail} + {3'b0,pipe4_lch_fail} + {3'b0,pipe5_lch_fail}
                          + {3'b0,pipe6_lch_fail} + {3'b0,pipe7_lch_fail};
assign event21_adder[3:0] = {3'b0,pipe3_reg_lch_fail} + {3'b0,pipe4_reg_lch_fail} + {3'b0,pipe5_reg_lch_fail}; 
assign event22_adder[3:0] = {3'b0,pipe0_inst_vld} + {3'b0,pipe1_inst_vld} + {3'b0,pipe2_inst_vld}
                          + {3'b0,pipe3_inst_vld} + {3'b0,pipe4_inst_vld} + {3'b0,pipe5_inst_vld}
                          + {3'b0,pipe6_inst_vld} + {3'b0,pipe7_inst_vld};
assign event23_adder[3:0] = {3'b0,hpcp_ld_cross_4k_stall} + {3'b0,hpcp_st_cross_4k_stall};
assign event24_adder[3:0] = {3'b0,hpcp_ld_other_stall} + {3'b0,hpcp_st_other_stall};
assign event25_adder[3:0] = {3'b0,hpcp_sq_discard}; 
assign event26_adder[3:0] = {3'b0,hpcp_sq_data_discard};
assign event27_adder[3:0] = {3'b0,hpcp_branch_target_mispred};
assign event28_adder[3:0] = {3'b0,hpcp_branch_target_inst};
assign event29_adder[3:0] = {3'b0,ir_inst0_alu}  + {3'b0,ir_inst1_alu}  + {3'b0,ir_inst2_alu}  + {3'b0,ir_inst3_alu}; 
assign event30_adder[3:0] = {3'b0,ir_inst0_ldst} + {3'b0,ir_inst1_ldst} + {3'b0,ir_inst2_ldst} + {3'b0,ir_inst3_ldst}; 
assign event31_adder[3:0] = {3'b0,ir_inst0_vec}  + {3'b0,ir_inst1_vec}  + {3'b0,ir_inst2_vec}  + {3'b0,ir_inst3_vec}; 
assign event32_adder[3:0] = {3'b0,ir_inst0_csr}  + {3'b0,ir_inst1_csr}  + {3'b0,ir_inst2_csr}  + {3'b0,ir_inst3_csr}; 
assign event33_adder[3:0] = {3'b0,ir_inst0_sync} + {3'b0,ir_inst1_sync} + {3'b0,ir_inst2_sync} + {3'b0,ir_inst3_sync}; 
assign event34_adder[3:0] = {2'b0,hpcp_unalign_inst[1:0]};
assign event35_adder[3:0] = {3'b0,int_ack_vld};
assign event36_adder[3:0] = {3'b0,hpcp_int_disable};
assign event37_adder[3:0] = {3'b0,ir_inst0_ecall}  + {3'b0,ir_inst1_ecall}  + {3'b0,ir_inst2_ecall} + {3'b0,ir_inst3_ecall}; 
assign event38_adder[3:0] = {3'b0,inst0_long_jump} + {3'b0,inst1_long_jump} + {3'b0,inst2_long_jump};
assign event39_adder[3:0] = {3'b0,hpcp_frontend_stall};
assign event40_adder[3:0] = {3'b0,hpcp_backend_stall};
assign event41_adder[3:0] = {3'b0,sync_stall}; 
assign event42_adder[3:0] = {3'b0,ir_inst0_fpu} + {3'b0,ir_inst1_fpu} + {3'b0,ir_inst2_fpu} + {3'b0,ir_inst3_fpu}; 


//select adder for hpmcnt[n]
// &ConnRule(s/x/3/); @649
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_3"); @650
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_3 (
  .event01_adder  (event01_adder ),
  .event02_adder  (event02_adder ),
  .event03_adder  (event03_adder ),
  .event04_adder  (event04_adder ),
  .event05_adder  (event05_adder ),
  .event06_adder  (event06_adder ),
  .event07_adder  (event07_adder ),
  .event08_adder  (event08_adder ),
  .event09_adder  (event09_adder ),
  .event10_adder  (event10_adder ),
  .event11_adder  (event11_adder ),
  .event12_adder  (event12_adder ),
  .event13_adder  (event13_adder ),
  .event14_adder  (event14_adder ),
  .event15_adder  (event15_adder ),
  .event16_adder  (event16_adder ),
  .event17_adder  (event17_adder ),
  .event18_adder  (event18_adder ),
  .event19_adder  (event19_adder ),
  .event20_adder  (event20_adder ),
  .event21_adder  (event21_adder ),
  .event22_adder  (event22_adder ),
  .event23_adder  (event23_adder ),
  .event24_adder  (event24_adder ),
  .event25_adder  (event25_adder ),
  .event26_adder  (event26_adder ),
  .event27_adder  (event27_adder ),
  .event28_adder  (event28_adder ),
  .event29_adder  (event29_adder ),
  .event30_adder  (event30_adder ),
  .event31_adder  (event31_adder ),
  .event32_adder  (event32_adder ),
  .event33_adder  (event33_adder ),
  .event34_adder  (event34_adder ),
  .event35_adder  (event35_adder ),
  .event36_adder  (event36_adder ),
  .event37_adder  (event37_adder ),
  .event38_adder  (event38_adder ),
  .event39_adder  (event39_adder ),
  .event40_adder  (event40_adder ),
  .event41_adder  (event41_adder ),
  .event42_adder  (event42_adder ),
  .mhpmcntx_adder (mhpmcnt3_adder),
  .mhpmevtx_value (mhpmevt3_value)
);


// &ConnRule(s/x/4/); @652
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_4"); @653
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_4 (
  .event01_adder  (event01_adder ),
  .event02_adder  (event02_adder ),
  .event03_adder  (event03_adder ),
  .event04_adder  (event04_adder ),
  .event05_adder  (event05_adder ),
  .event06_adder  (event06_adder ),
  .event07_adder  (event07_adder ),
  .event08_adder  (event08_adder ),
  .event09_adder  (event09_adder ),
  .event10_adder  (event10_adder ),
  .event11_adder  (event11_adder ),
  .event12_adder  (event12_adder ),
  .event13_adder  (event13_adder ),
  .event14_adder  (event14_adder ),
  .event15_adder  (event15_adder ),
  .event16_adder  (event16_adder ),
  .event17_adder  (event17_adder ),
  .event18_adder  (event18_adder ),
  .event19_adder  (event19_adder ),
  .event20_adder  (event20_adder ),
  .event21_adder  (event21_adder ),
  .event22_adder  (event22_adder ),
  .event23_adder  (event23_adder ),
  .event24_adder  (event24_adder ),
  .event25_adder  (event25_adder ),
  .event26_adder  (event26_adder ),
  .event27_adder  (event27_adder ),
  .event28_adder  (event28_adder ),
  .event29_adder  (event29_adder ),
  .event30_adder  (event30_adder ),
  .event31_adder  (event31_adder ),
  .event32_adder  (event32_adder ),
  .event33_adder  (event33_adder ),
  .event34_adder  (event34_adder ),
  .event35_adder  (event35_adder ),
  .event36_adder  (event36_adder ),
  .event37_adder  (event37_adder ),
  .event38_adder  (event38_adder ),
  .event39_adder  (event39_adder ),
  .event40_adder  (event40_adder ),
  .event41_adder  (event41_adder ),
  .event42_adder  (event42_adder ),
  .mhpmcntx_adder (mhpmcnt4_adder),
  .mhpmevtx_value (mhpmevt4_value)
);


// &ConnRule(s/x/5/); @655
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_5"); @656
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_5 (
  .event01_adder  (event01_adder ),
  .event02_adder  (event02_adder ),
  .event03_adder  (event03_adder ),
  .event04_adder  (event04_adder ),
  .event05_adder  (event05_adder ),
  .event06_adder  (event06_adder ),
  .event07_adder  (event07_adder ),
  .event08_adder  (event08_adder ),
  .event09_adder  (event09_adder ),
  .event10_adder  (event10_adder ),
  .event11_adder  (event11_adder ),
  .event12_adder  (event12_adder ),
  .event13_adder  (event13_adder ),
  .event14_adder  (event14_adder ),
  .event15_adder  (event15_adder ),
  .event16_adder  (event16_adder ),
  .event17_adder  (event17_adder ),
  .event18_adder  (event18_adder ),
  .event19_adder  (event19_adder ),
  .event20_adder  (event20_adder ),
  .event21_adder  (event21_adder ),
  .event22_adder  (event22_adder ),
  .event23_adder  (event23_adder ),
  .event24_adder  (event24_adder ),
  .event25_adder  (event25_adder ),
  .event26_adder  (event26_adder ),
  .event27_adder  (event27_adder ),
  .event28_adder  (event28_adder ),
  .event29_adder  (event29_adder ),
  .event30_adder  (event30_adder ),
  .event31_adder  (event31_adder ),
  .event32_adder  (event32_adder ),
  .event33_adder  (event33_adder ),
  .event34_adder  (event34_adder ),
  .event35_adder  (event35_adder ),
  .event36_adder  (event36_adder ),
  .event37_adder  (event37_adder ),
  .event38_adder  (event38_adder ),
  .event39_adder  (event39_adder ),
  .event40_adder  (event40_adder ),
  .event41_adder  (event41_adder ),
  .event42_adder  (event42_adder ),
  .mhpmcntx_adder (mhpmcnt5_adder),
  .mhpmevtx_value (mhpmevt5_value)
);


// &ConnRule(s/x/6/); @658
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_6"); @659
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_6 (
  .event01_adder  (event01_adder ),
  .event02_adder  (event02_adder ),
  .event03_adder  (event03_adder ),
  .event04_adder  (event04_adder ),
  .event05_adder  (event05_adder ),
  .event06_adder  (event06_adder ),
  .event07_adder  (event07_adder ),
  .event08_adder  (event08_adder ),
  .event09_adder  (event09_adder ),
  .event10_adder  (event10_adder ),
  .event11_adder  (event11_adder ),
  .event12_adder  (event12_adder ),
  .event13_adder  (event13_adder ),
  .event14_adder  (event14_adder ),
  .event15_adder  (event15_adder ),
  .event16_adder  (event16_adder ),
  .event17_adder  (event17_adder ),
  .event18_adder  (event18_adder ),
  .event19_adder  (event19_adder ),
  .event20_adder  (event20_adder ),
  .event21_adder  (event21_adder ),
  .event22_adder  (event22_adder ),
  .event23_adder  (event23_adder ),
  .event24_adder  (event24_adder ),
  .event25_adder  (event25_adder ),
  .event26_adder  (event26_adder ),
  .event27_adder  (event27_adder ),
  .event28_adder  (event28_adder ),
  .event29_adder  (event29_adder ),
  .event30_adder  (event30_adder ),
  .event31_adder  (event31_adder ),
  .event32_adder  (event32_adder ),
  .event33_adder  (event33_adder ),
  .event34_adder  (event34_adder ),
  .event35_adder  (event35_adder ),
  .event36_adder  (event36_adder ),
  .event37_adder  (event37_adder ),
  .event38_adder  (event38_adder ),
  .event39_adder  (event39_adder ),
  .event40_adder  (event40_adder ),
  .event41_adder  (event41_adder ),
  .event42_adder  (event42_adder ),
  .mhpmcntx_adder (mhpmcnt6_adder),
  .mhpmevtx_value (mhpmevt6_value)
);

// &ConnRule(s/x/7/); @662
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_7"); @663
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_7 (
  .event01_adder  (event01_adder ),
  .event02_adder  (event02_adder ),
  .event03_adder  (event03_adder ),
  .event04_adder  (event04_adder ),
  .event05_adder  (event05_adder ),
  .event06_adder  (event06_adder ),
  .event07_adder  (event07_adder ),
  .event08_adder  (event08_adder ),
  .event09_adder  (event09_adder ),
  .event10_adder  (event10_adder ),
  .event11_adder  (event11_adder ),
  .event12_adder  (event12_adder ),
  .event13_adder  (event13_adder ),
  .event14_adder  (event14_adder ),
  .event15_adder  (event15_adder ),
  .event16_adder  (event16_adder ),
  .event17_adder  (event17_adder ),
  .event18_adder  (event18_adder ),
  .event19_adder  (event19_adder ),
  .event20_adder  (event20_adder ),
  .event21_adder  (event21_adder ),
  .event22_adder  (event22_adder ),
  .event23_adder  (event23_adder ),
  .event24_adder  (event24_adder ),
  .event25_adder  (event25_adder ),
  .event26_adder  (event26_adder ),
  .event27_adder  (event27_adder ),
  .event28_adder  (event28_adder ),
  .event29_adder  (event29_adder ),
  .event30_adder  (event30_adder ),
  .event31_adder  (event31_adder ),
  .event32_adder  (event32_adder ),
  .event33_adder  (event33_adder ),
  .event34_adder  (event34_adder ),
  .event35_adder  (event35_adder ),
  .event36_adder  (event36_adder ),
  .event37_adder  (event37_adder ),
  .event38_adder  (event38_adder ),
  .event39_adder  (event39_adder ),
  .event40_adder  (event40_adder ),
  .event41_adder  (event41_adder ),
  .event42_adder  (event42_adder ),
  .mhpmcntx_adder (mhpmcnt7_adder),
  .mhpmevtx_value (mhpmevt7_value)
);


// &ConnRule(s/x/8/); @665
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_8"); @666
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_8 (
  .event01_adder  (event01_adder ),
  .event02_adder  (event02_adder ),
  .event03_adder  (event03_adder ),
  .event04_adder  (event04_adder ),
  .event05_adder  (event05_adder ),
  .event06_adder  (event06_adder ),
  .event07_adder  (event07_adder ),
  .event08_adder  (event08_adder ),
  .event09_adder  (event09_adder ),
  .event10_adder  (event10_adder ),
  .event11_adder  (event11_adder ),
  .event12_adder  (event12_adder ),
  .event13_adder  (event13_adder ),
  .event14_adder  (event14_adder ),
  .event15_adder  (event15_adder ),
  .event16_adder  (event16_adder ),
  .event17_adder  (event17_adder ),
  .event18_adder  (event18_adder ),
  .event19_adder  (event19_adder ),
  .event20_adder  (event20_adder ),
  .event21_adder  (event21_adder ),
  .event22_adder  (event22_adder ),
  .event23_adder  (event23_adder ),
  .event24_adder  (event24_adder ),
  .event25_adder  (event25_adder ),
  .event26_adder  (event26_adder ),
  .event27_adder  (event27_adder ),
  .event28_adder  (event28_adder ),
  .event29_adder  (event29_adder ),
  .event30_adder  (event30_adder ),
  .event31_adder  (event31_adder ),
  .event32_adder  (event32_adder ),
  .event33_adder  (event33_adder ),
  .event34_adder  (event34_adder ),
  .event35_adder  (event35_adder ),
  .event36_adder  (event36_adder ),
  .event37_adder  (event37_adder ),
  .event38_adder  (event38_adder ),
  .event39_adder  (event39_adder ),
  .event40_adder  (event40_adder ),
  .event41_adder  (event41_adder ),
  .event42_adder  (event42_adder ),
  .mhpmcntx_adder (mhpmcnt8_adder),
  .mhpmevtx_value (mhpmevt8_value)
);


// &ConnRule(s/x/9/); @668
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_9"); @669
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_9 (
  .event01_adder  (event01_adder ),
  .event02_adder  (event02_adder ),
  .event03_adder  (event03_adder ),
  .event04_adder  (event04_adder ),
  .event05_adder  (event05_adder ),
  .event06_adder  (event06_adder ),
  .event07_adder  (event07_adder ),
  .event08_adder  (event08_adder ),
  .event09_adder  (event09_adder ),
  .event10_adder  (event10_adder ),
  .event11_adder  (event11_adder ),
  .event12_adder  (event12_adder ),
  .event13_adder  (event13_adder ),
  .event14_adder  (event14_adder ),
  .event15_adder  (event15_adder ),
  .event16_adder  (event16_adder ),
  .event17_adder  (event17_adder ),
  .event18_adder  (event18_adder ),
  .event19_adder  (event19_adder ),
  .event20_adder  (event20_adder ),
  .event21_adder  (event21_adder ),
  .event22_adder  (event22_adder ),
  .event23_adder  (event23_adder ),
  .event24_adder  (event24_adder ),
  .event25_adder  (event25_adder ),
  .event26_adder  (event26_adder ),
  .event27_adder  (event27_adder ),
  .event28_adder  (event28_adder ),
  .event29_adder  (event29_adder ),
  .event30_adder  (event30_adder ),
  .event31_adder  (event31_adder ),
  .event32_adder  (event32_adder ),
  .event33_adder  (event33_adder ),
  .event34_adder  (event34_adder ),
  .event35_adder  (event35_adder ),
  .event36_adder  (event36_adder ),
  .event37_adder  (event37_adder ),
  .event38_adder  (event38_adder ),
  .event39_adder  (event39_adder ),
  .event40_adder  (event40_adder ),
  .event41_adder  (event41_adder ),
  .event42_adder  (event42_adder ),
  .mhpmcntx_adder (mhpmcnt9_adder),
  .mhpmevtx_value (mhpmevt9_value)
);


// &ConnRule(s/x/10/); @671
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_10"); @672
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_10 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt10_adder),
  .mhpmevtx_value  (mhpmevt10_value)
);

// &ConnRule(s/x/11/); @675
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_11"); @676
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_11 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt11_adder),
  .mhpmevtx_value  (mhpmevt11_value)
);


// &ConnRule(s/x/12/); @678
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_12"); @679
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_12 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt12_adder),
  .mhpmevtx_value  (mhpmevt12_value)
);


// &ConnRule(s/x/13/); @681
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_13"); @682
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_13 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt13_adder),
  .mhpmevtx_value  (mhpmevt13_value)
);


// &ConnRule(s/x/14/); @684
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_14"); @685
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_14 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt14_adder),
  .mhpmevtx_value  (mhpmevt14_value)
);


// &ConnRule(s/x/15/); @687
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_15"); @688
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_15 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt15_adder),
  .mhpmevtx_value  (mhpmevt15_value)
);


// &ConnRule(s/x/16/); @690
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_16"); @691
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_16 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt16_adder),
  .mhpmevtx_value  (mhpmevt16_value)
);


// &ConnRule(s/x/17/); @693
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_17"); @694
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_17 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt17_adder),
  .mhpmevtx_value  (mhpmevt17_value)
);


// &ConnRule(s/x/18/); @696
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_18"); @697
ct_hpcp_adder_sel  x_ct_hpcp_adder_sel_18 (
  .event01_adder   (event01_adder  ),
  .event02_adder   (event02_adder  ),
  .event03_adder   (event03_adder  ),
  .event04_adder   (event04_adder  ),
  .event05_adder   (event05_adder  ),
  .event06_adder   (event06_adder  ),
  .event07_adder   (event07_adder  ),
  .event08_adder   (event08_adder  ),
  .event09_adder   (event09_adder  ),
  .event10_adder   (event10_adder  ),
  .event11_adder   (event11_adder  ),
  .event12_adder   (event12_adder  ),
  .event13_adder   (event13_adder  ),
  .event14_adder   (event14_adder  ),
  .event15_adder   (event15_adder  ),
  .event16_adder   (event16_adder  ),
  .event17_adder   (event17_adder  ),
  .event18_adder   (event18_adder  ),
  .event19_adder   (event19_adder  ),
  .event20_adder   (event20_adder  ),
  .event21_adder   (event21_adder  ),
  .event22_adder   (event22_adder  ),
  .event23_adder   (event23_adder  ),
  .event24_adder   (event24_adder  ),
  .event25_adder   (event25_adder  ),
  .event26_adder   (event26_adder  ),
  .event27_adder   (event27_adder  ),
  .event28_adder   (event28_adder  ),
  .event29_adder   (event29_adder  ),
  .event30_adder   (event30_adder  ),
  .event31_adder   (event31_adder  ),
  .event32_adder   (event32_adder  ),
  .event33_adder   (event33_adder  ),
  .event34_adder   (event34_adder  ),
  .event35_adder   (event35_adder  ),
  .event36_adder   (event36_adder  ),
  .event37_adder   (event37_adder  ),
  .event38_adder   (event38_adder  ),
  .event39_adder   (event39_adder  ),
  .event40_adder   (event40_adder  ),
  .event41_adder   (event41_adder  ),
  .event42_adder   (event42_adder  ),
  .mhpmcntx_adder  (mhpmcnt18_adder),
  .mhpmevtx_value  (mhpmevt18_value)
);

// &ConnRule(s/x/19/); @700
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_19"); @701
// &ConnRule(s/x/20/); @703
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_20"); @704
// &ConnRule(s/x/21/); @706
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_21"); @707
// &ConnRule(s/x/22/); @709
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_22"); @710
// &ConnRule(s/x/23/); @712
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_23"); @713
// &ConnRule(s/x/24/); @715
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_24"); @716
// &ConnRule(s/x/25/); @718
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_25"); @719
// &ConnRule(s/x/26/); @721
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_26"); @722
// &ConnRule(s/x/27/); @724
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_27"); @725
// &ConnRule(s/x/28/); @727
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_28"); @728
// &ConnRule(s/x/29/); @730
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_29"); @731
// &ConnRule(s/x/30/); @733
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_30"); @734
// &ConnRule(s/x/31/); @736
// &Instance("ct_hpcp_adder_sel", "x_ct_hpcp_adder_sel_31"); @737

//==========================================================
//                 Clk Enable of Gated Cell 
//==========================================================
assign mcntinhbt_clk_en  =  mcntinhbt_wen;
assign mcntinten_clk_en  =  mcntinten_wen;
assign mcntof_clk_en     =  mcntof_wen;
assign mhpmcr_clk_en     =  mhpmcr_wen;
assign mhpmsp_clk_en     =  mhpmsp_wen;
assign mhpmep_clk_en     =  mhpmep_wen;
assign scntinhbt_clk_en  =  scntinhbt_wen;
assign scntinten_clk_en  =  scntinten_wen;
assign scntof_clk_en     =  scntof_wen;
assign shpmcr_clk_en     =  shpmcr_wen;
assign shpmsp_clk_en     =  shpmsp_wen;
assign shpmep_clk_en     =  shpmep_wen;
assign mhpmevt3_clk_en   =  mhpmevt3_wen; 
assign mhpmevt4_clk_en   =  mhpmevt4_wen; 
assign mhpmevt5_clk_en   =  mhpmevt5_wen; 
assign mhpmevt6_clk_en   =  mhpmevt6_wen; 
assign mhpmevt7_clk_en   =  mhpmevt7_wen; 
assign mhpmevt8_clk_en   =  mhpmevt8_wen; 
assign mhpmevt9_clk_en   =  mhpmevt9_wen; 
assign mhpmevt10_clk_en  =  mhpmevt10_wen; 
assign mhpmevt11_clk_en  =  mhpmevt11_wen; 
assign mhpmevt12_clk_en  =  mhpmevt12_wen; 
assign mhpmevt13_clk_en  =  mhpmevt13_wen; 
assign mhpmevt14_clk_en  =  mhpmevt14_wen; 
assign mhpmevt15_clk_en  =  mhpmevt15_wen; 
assign mhpmevt16_clk_en  =  mhpmevt16_wen; 
assign mhpmevt17_clk_en  =  mhpmevt17_wen; 
assign mhpmevt18_clk_en  =  mhpmevt18_wen; 
assign mcycle_clk_en     =  mcycle_en    || mcycle_wen    || mcycle_of   ;
assign minstret_clk_en   =  minstret_en  || minstret_wen  || minstret_of ;
assign mhpmcnt3_clk_en   =  mhpmcnt3_en  || mhpmcnt3_wen  || mhpmcnt3_of ;
assign mhpmcnt4_clk_en   =  mhpmcnt4_en  || mhpmcnt4_wen  || mhpmcnt4_of ;
assign mhpmcnt5_clk_en   =  mhpmcnt5_en  || mhpmcnt5_wen  || mhpmcnt5_of ;
assign mhpmcnt6_clk_en   =  mhpmcnt6_en  || mhpmcnt6_wen  || mhpmcnt6_of ;
assign mhpmcnt7_clk_en   =  mhpmcnt7_en  || mhpmcnt7_wen  || mhpmcnt7_of ;
assign mhpmcnt8_clk_en   =  mhpmcnt8_en  || mhpmcnt8_wen  || mhpmcnt8_of ;
assign mhpmcnt9_clk_en   =  mhpmcnt9_en  || mhpmcnt9_wen  || mhpmcnt9_of ;
assign mhpmcnt10_clk_en  =  mhpmcnt10_en || mhpmcnt10_wen || mhpmcnt10_of;
assign mhpmcnt11_clk_en  =  mhpmcnt11_en || mhpmcnt11_wen || mhpmcnt11_of;
assign mhpmcnt12_clk_en  =  mhpmcnt12_en || mhpmcnt12_wen || mhpmcnt12_of;
assign mhpmcnt13_clk_en  =  mhpmcnt13_en || mhpmcnt13_wen || mhpmcnt13_of;
assign mhpmcnt14_clk_en  =  mhpmcnt14_en || mhpmcnt14_wen || mhpmcnt14_of;
assign mhpmcnt15_clk_en  =  mhpmcnt15_en || mhpmcnt15_wen || mhpmcnt15_of;
assign mhpmcnt16_clk_en  =  mhpmcnt16_en || mhpmcnt16_wen || mhpmcnt16_of;
assign mhpmcnt17_clk_en  =  mhpmcnt17_en || mhpmcnt17_wen || mhpmcnt17_of;
assign mhpmcnt18_clk_en  =  mhpmcnt18_en || mhpmcnt18_wen || mhpmcnt18_of;


//data prepare
assign hpcp_wdata[63:0] = cp0_hpcp_wdata[63:0];

//==========================================================
//                Control Registers
//==========================================================
//==========================================================
// M/SHPMCR - Machine/Supervisor Contrl Register
//==========================================================
// +----+----+------+----+--+----+----+-------+-------+
// | 63 | 62 |      | 13 |  | 11 | 10 |       | 1   0 |
// +----+----+------+----+--+----+----+-------+-------+
//    |    |           |       |   |   |          |
//    |    |           |       |   |   |          +------ TME
//    |    |           |       |   |   |       
//    |    |           |       |   |   |   
//    |    |           |       |   +--------------------- PMDU
//    |    |           |       +------------------------- PMDS
//    |    |           |         
//    |    |           +--------------------------------- PMDM
//    |    +--------------------------------------------- SCE
//    +-------------------------------------------------- TS

assign mhpmcr_value[63:0] = {ts,sce,48'b0,cp0_hpcp_pmdm,1'b0,cp0_hpcp_pmds,cp0_hpcp_pmdu,8'b0,tme[1:0]};
assign shpmcr_value[63:0] = {ts,49'b0,cp0_hpcp_pmdm,1'b0,cp0_hpcp_pmds,cp0_hpcp_pmdu,8'b0,tme[1:0]};

always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      sce      <= 1'b0;
      tme[1:0] <= 2'b0;
    end
  else if(mhpmcr_wen) 
    begin
      sce      <= hpcp_wdata[62]; 
      tme[1:0] <= hpcp_wdata[1:0];
    end
  else if(shpmcr_wen) 
    begin
      sce      <= sce; //sce can be modified on m-mode 
      tme[1:0] <= hpcp_wdata[1:0];
    end
  else
    begin
      sce      <= sce;  
      tme[1:0] <= tme[1:0];
    end
end

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ts <= 1'b0;
  else if(mhpmcr_wen || shpmcr_wen)
    ts <= hpcp_wdata[63];
  else if(hpcp_trigger_vld)
    ts <= 1'b1;
  else if(hpcp_stop_vld_ff)
    ts <= 1'b0;
  else if(hpcp_end_vld)
    ts <= 1'b0;
  else if(hpcp_start_vld)
    ts <= 1'b1;
  else
    ts <= ts;
end

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    hpcp_stop_vld_ff <= 1'b0;
  else if(tme[1:0] == 2'b01)
    hpcp_stop_vld_ff <= hpcp_stop_vld;
  else
    hpcp_stop_vld_ff <= 1'b0;
end


//start point
assign hpmsp_sub_retire0_st_pc[39:0] = {1'b0,hpmsp_reg[38:0]} - {1'b0,hpcp_retire_inst0_pc[39:1]} ;
assign hpmsp_sub_retire0_ed_pc[3:0]  = {1'b0,hpmsp_sub_retire0_st_pc[2:0]} - {1'b0,hpcp_retire_inst0_offset[2:0]};
assign hpmsp_sub_retire0_high_zero   = !(|hpmsp_sub_retire0_st_pc[39:3]);
assign hpmsp_eq_retire0_pc           = hpmsp_reg[38:0] == hpcp_retire_inst0_pc[39:1];
assign hpmsp_le_retire0_st_pc        = hpmsp_sub_retire0_st_pc[39] 
                                    || !(|hpmsp_sub_retire0_st_pc[39:0]);

assign hpmsp_sub_retire1_st_pc[39:0] = {1'b0,hpmsp_reg[38:0]} - {1'b0,hpcp_retire_inst1_pc[39:1]} ;
assign hpmsp_sub_retire1_ed_pc[3:0]  = {1'b0,hpmsp_sub_retire1_st_pc[2:0]} - {1'b0,hpcp_retire_inst1_offset[2:0]};
assign hpmsp_sub_retire1_high_zero   = !(|hpmsp_sub_retire1_st_pc[39:3]);
assign hpmsp_eq_retire1_pc           = hpmsp_reg[38:0] == hpcp_retire_inst1_pc[39:1];
assign hpmsp_le_retire1_st_pc        = hpmsp_sub_retire1_st_pc[39] 
                                    || !(|hpmsp_sub_retire1_st_pc[39:0]);

assign hpmsp_sub_retire2_st_pc[39:0] = {1'b0,hpmsp_reg[38:0]} - {1'b0,hpcp_retire_inst2_pc[39:1]} ;
assign hpmsp_sub_retire2_ed_pc[3:0]  = {1'b0,hpmsp_sub_retire2_st_pc[2:0]} - {1'b0,hpcp_retire_inst2_offset[2:0]};
assign hpmsp_sub_retire2_high_zero   = !(|hpmsp_sub_retire2_st_pc[39:3]);
assign hpmsp_eq_retire2_pc           = hpmsp_reg[38:0] == hpcp_retire_inst2_pc[39:1];
assign hpmsp_le_retire2_st_pc        = hpmsp_sub_retire2_st_pc[39] 
                                    || !(|hpmsp_sub_retire2_st_pc[39:0]);

//end point
assign hpmep_sub_retire0_st_pc[39:0] = {1'b0,hpmep_reg[38:0]} - {1'b0,hpcp_retire_inst0_pc[39:1]} ;
assign hpmep_sub_retire0_ed_pc[3:0]  = {1'b0,hpmep_sub_retire0_st_pc[2:0]} - {1'b0,hpcp_retire_inst0_offset[2:0]};
assign hpmep_sub_retire0_high_zero   = !(|hpmep_sub_retire0_st_pc[39:3]);
assign hpmep_eq_retire0_pc           = hpmep_reg[38:0] == hpcp_retire_inst0_pc[39:1];
assign hpmep_ge_retire0_ed_pc        = !hpmep_sub_retire0_st_pc[39] 
                                    &&  (hpmep_sub_retire0_high_zero && (!hpmep_sub_retire0_ed_pc[3])
                                         || !hpmep_sub_retire0_high_zero
                                         || hpcp_retire_inst0_num[1:0] == 2'b01);

assign hpmep_sub_retire1_st_pc[39:0] = {1'b0,hpmep_reg[38:0]} - {1'b0,hpcp_retire_inst1_pc[39:1]} ;
assign hpmep_sub_retire1_ed_pc[3:0]  = {1'b0,hpmep_sub_retire1_st_pc[2:0]} - {1'b0,hpcp_retire_inst1_offset[2:0]};
assign hpmep_sub_retire1_high_zero   = !(|hpmep_sub_retire1_st_pc[39:3]);
assign hpmep_eq_retire1_pc           = hpmep_reg[38:0] == hpcp_retire_inst1_pc[39:1];
assign hpmep_ge_retire1_ed_pc        = !hpmep_sub_retire1_st_pc[39] 
                                    &&  (hpmep_sub_retire1_high_zero && (!hpmep_sub_retire1_ed_pc[3])
                                         || !hpmep_sub_retire1_high_zero
                                         || hpcp_retire_inst1_num[1:0] == 2'b01);

assign hpmep_sub_retire2_st_pc[39:0] = {1'b0,hpmep_reg[38:0]} - {1'b0,hpcp_retire_inst2_pc[39:1]} ;
assign hpmep_sub_retire2_ed_pc[3:0]  = {1'b0,hpmep_sub_retire2_st_pc[2:0]} - {1'b0,hpcp_retire_inst2_offset[2:0]};
assign hpmep_sub_retire2_high_zero   = !(|hpmep_sub_retire2_st_pc[39:3]);
assign hpmep_eq_retire2_pc           = hpmep_reg[38:0] == hpcp_retire_inst2_pc[39:1];
assign hpmep_ge_retire2_ed_pc        = !hpmep_sub_retire2_st_pc[39] 
                                    &&  (hpmep_sub_retire2_high_zero && (!hpmep_sub_retire2_ed_pc[3])
                                         || !hpmep_sub_retire2_high_zero
                                         || hpcp_retire_inst2_num[1:0] == 2'b01);

assign trigger_vld = (hpmsp_sub_retire0_high_zero && hpmsp_sub_retire0_ed_pc[3] || hpmsp_eq_retire0_pc) && hpcp_retire_inst0_vld
                  || (hpmsp_sub_retire1_high_zero && hpmsp_sub_retire1_ed_pc[3] || hpmsp_eq_retire1_pc) && hpcp_retire_inst1_vld 
                  || (hpmsp_sub_retire2_high_zero && hpmsp_sub_retire2_ed_pc[3] || hpmsp_eq_retire2_pc) && hpcp_retire_inst2_vld; 

assign stop_vld    = (hpmep_sub_retire0_high_zero && hpmep_sub_retire0_ed_pc[3] || hpmep_eq_retire0_pc) && hpcp_retire_inst0_vld
                  || (hpmep_sub_retire1_high_zero && hpmep_sub_retire1_ed_pc[3] || hpmep_eq_retire1_pc) && hpcp_retire_inst1_vld 
                  || (hpmep_sub_retire2_high_zero && hpmep_sub_retire2_ed_pc[3] || hpmep_eq_retire2_pc) && hpcp_retire_inst2_vld; 
                  
assign start_vld   = hpmsp_le_retire0_st_pc && hpmep_ge_retire0_ed_pc && hpcp_retire_inst0_vld
                  || hpmsp_le_retire1_st_pc && hpmep_ge_retire1_ed_pc && hpcp_retire_inst1_vld
                  || hpmsp_le_retire2_st_pc && hpmep_ge_retire2_ed_pc && hpcp_retire_inst2_vld;

assign end_vld     = !(hpmsp_le_retire0_st_pc && hpmep_ge_retire0_ed_pc) && hpcp_retire_inst0_vld
                  || !(hpmsp_le_retire1_st_pc && hpmep_ge_retire1_ed_pc) && hpcp_retire_inst1_vld
                  || !(hpmsp_le_retire2_st_pc && hpmep_ge_retire2_ed_pc) && hpcp_retire_inst2_vld;
 
assign hpcp_trigger_vld = trigger_vld && hpmsp_high_vld && hpmep_high_vld && (tme[1:0] == 2'b01);                
assign hpcp_stop_vld    = stop_vld    && hpmsp_high_vld && hpmep_high_vld && (tme[1:0] == 2'b01);                
assign hpcp_start_vld   = start_vld   && hpmsp_high_vld && hpmep_high_vld && (tme[1:0] == 2'b10);                
assign hpcp_end_vld     = end_vld     && hpmsp_high_vld && hpmep_high_vld && (tme[1:0] == 2'b10);                
 
//==================================================================
// M/SHPMSP - Machine/Supervisor Start Point PC Register
//==================================================================
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    hpmsp_reg[62:0] <= 63'b0;
    hpmsp_high_vld  <= 1'b0;
  end
  else if(mhpmsp_wen || shpmsp_wen)
  begin
    hpmsp_reg[62:0] <= hpcp_wdata[63:1];
    hpmsp_high_vld  <= hpmsp_high_test; 
  end
  else
  begin
    hpmsp_reg[62:0] <= hpmsp_reg[62:0];
    hpmsp_high_vld  <= hpmsp_high_vld;
  end
end

//if start pc high 24 bit should be signed extended from bit 39
assign hpmsp_high_test   = (&hpcp_wdata[63:39]) || (!(|hpcp_wdata[63:39]));                 
assign mhpmsp_value[63:0] = {hpmsp_reg[62:0],1'b0};
assign shpmsp_value[63:0] = {hpmsp_reg[62:0],1'b0};

//==================================================================
// M/SHPMEP - Machine/Supervisor End Point PC Register
//==================================================================
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    hpmep_reg[62:0] <= 63'b0;
    hpmep_high_vld  <= 1'b0;
  end
  else if(mhpmep_wen || shpmep_wen)
  begin
    hpmep_reg[62:0] <= hpcp_wdata[63:1];
    hpmep_high_vld  <= hpmep_high_test;
  end
  else
  begin
    hpmep_reg[62:0] <= hpmep_reg[62:0];
    hpmep_high_vld  <= hpmep_high_vld;
  end
end

assign hpmep_high_test   = (&hpcp_wdata[63:39]) || (!(|hpcp_wdata[63:39]));                 
assign mhpmep_value[63:0] = {hpmep_reg[62:0],1'b0};
assign shpmep_value[63:0] = {hpmep_reg[62:0],1'b0};


//==================================================================
// M/SCOUNTINHIBIT - Machine/Supervisor Counter-Inhibit Register
//==================================================================
// +----+----+----+-----------+---+---+---+---+---+---+
// | 31 | 30 | 29 |      28:6 | 5 | 4 | 3 | 2 | 1 | 0 |
// +----+----+----+-----------+---+---+---+---+---+---+
//    |    |    |               |   |   |   |   |   |
//    |    |    |               |   |   |   |   |   +---- CY
//    |    |    |               |   |   |   |   +-------- 0
//    |    |    |               |   |   |   +------------ IR
//    |    |    |               |   |   +---------------- HPM3
//    |    |    |               |   +-------------------- HPM4
//    |    |    |               +------------------------ HPM5
//    |    |    + --------------------------------------- HPM29
//    |    +--------------------------------------------- HPM30
//    +-------------------------------------------------- HPPM31

assign mcntinhbt_value[63:0] = {32'b0,hpm[28:0], ir, 1'b0, cy};
assign scntinhbt_value[63:0] = {32'b0,hpm[28:0], ir, 1'b0, cy} & {32'b0,cp0_hpcp_mcntwen[31:0]};


assign scntinhbt_updt_value[31:0] = ((~cp0_hpcp_mcntwen[31:0])& {hpm[28:0],ir,1'b0,cy}) 
                                  | (  cp0_hpcp_mcntwen[31:0] & hpcp_wdata[31:0]);
//=====================================
// HPM31~3/IR/CY bit in mnountinhibt
//=====================================
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      hpm[28:0] <= 29'b0;
      ir        <= 1'b0;
      cy        <= 1'b0;
    end
  else if(mcntinhbt_wen) 
    begin
      hpm[28:0] <= hpcp_wdata[31:3];
      ir        <= hpcp_wdata[2];
      cy        <= hpcp_wdata[0];
    end
  else if(scntinhbt_wen) 
    begin
      hpm[28:0] <= scntinhbt_updt_value[31:3]; 
      ir        <= scntinhbt_updt_value[2];
      cy        <= scntinhbt_updt_value[0];
    end
  else
    begin
      hpm[28:0] <= hpm[28:0];
      ir        <= ir;
      cy        <= cy;
    end
end

//==================================================================
// M/SCOUNTERINTEN - Machine/Supervisor Counter-Int Enable Register
//==================================================================
// +----+----+----+-----------+---+---+---+---+---+---+
// | 31 | 30 | 29 |      28:6 | 5 | 4 | 3 | 2 | 1 | 0 |
// +----+----+----+-----------+---+---+---+---+---+---+
//    |    |    |               |   |   |   |   |   |
//    |    |    |               |   |   |   |   |   +---- CY_INTEN
//    |    |    |               |   |   |   |   +-------- 0
//    |    |    |               |   |   |   +------------ IR_INTEN
//    |    |    |               |   |   +---------------- HPM3_INTEN
//    |    |    |               |   +-------------------- HPM4_INTEN
//    |    |    |               +------------------------ HPM5_INTEN
//    |    |    + --------------------------------------- HPM29_INTEN
//    |    +--------------------------------------------- HPM30_INTEN
//    +-------------------------------------------------- HPPM31_INTEN

assign cntinten_value[63:0]  = {32'b0,cntinten[31:0]};
assign mcntinten_value[63:0] = cntinten_value[63:0];
assign scntinten_value[63:0] = cntinten_value[63:0] & {32'b0,cp0_hpcp_mcntwen[31:0]}; 

//======================================
// HPM31~3/IR/CY Int enable bit in m/scountinten
//=====================================
assign cntinten_wen[31:0] = {32{mcntinten_wen}} 
                          | {32{scntinten_wen}} & cp0_hpcp_mcntwen[31:0];

// &ConnRule(s/_x$/[0]/); @1118
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_0"); @1119
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_0 (
  .cntinten_wen_x  (cntinten_wen[0]),
  .cntinten_x      (cntinten[0]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[0]  )
);


assign cntinten[1] = 1'b0;

// &ConnRule(s/_x$/[2]/); @1123
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_2"); @1124
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_2 (
  .cntinten_wen_x  (cntinten_wen[2]),
  .cntinten_x      (cntinten[2]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[2]  )
);


// &ConnRule(s/_x$/[3]/); @1126
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_3"); @1127
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_3 (
  .cntinten_wen_x  (cntinten_wen[3]),
  .cntinten_x      (cntinten[3]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[3]  )
);


// &ConnRule(s/_x$/[4]/); @1129
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_4"); @1130
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_4 (
  .cntinten_wen_x  (cntinten_wen[4]),
  .cntinten_x      (cntinten[4]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[4]  )
);


// &ConnRule(s/_x$/[5]/); @1132
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_5"); @1133
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_5 (
  .cntinten_wen_x  (cntinten_wen[5]),
  .cntinten_x      (cntinten[5]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[5]  )
);


// &ConnRule(s/_x$/[6]/); @1135
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_6"); @1136
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_6 (
  .cntinten_wen_x  (cntinten_wen[6]),
  .cntinten_x      (cntinten[6]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[6]  )
);


// &ConnRule(s/_x$/[7]/); @1138
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_7"); @1139
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_7 (
  .cntinten_wen_x  (cntinten_wen[7]),
  .cntinten_x      (cntinten[7]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[7]  )
);


// &ConnRule(s/_x$/[8]/); @1141
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_8"); @1142
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_8 (
  .cntinten_wen_x  (cntinten_wen[8]),
  .cntinten_x      (cntinten[8]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[8]  )
);


// &ConnRule(s/_x$/[9]/); @1144
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_9"); @1145
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_9 (
  .cntinten_wen_x  (cntinten_wen[9]),
  .cntinten_x      (cntinten[9]    ),
  .cpurst_b        (cpurst_b       ),
  .hpcp_clk        (hpcp_clk       ),
  .hpcp_wdata_x    (hpcp_wdata[9]  )
);


// &ConnRule(s/_x$/[10]/); @1147
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_10"); @1148
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_10 (
  .cntinten_wen_x   (cntinten_wen[10]),
  .cntinten_x       (cntinten[10]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[10]  )
);


// &ConnRule(s/_x$/[11]/); @1150
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_11"); @1151
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_11 (
  .cntinten_wen_x   (cntinten_wen[11]),
  .cntinten_x       (cntinten[11]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[11]  )
);


// &ConnRule(s/_x$/[12]/); @1153
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_12"); @1154
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_12 (
  .cntinten_wen_x   (cntinten_wen[12]),
  .cntinten_x       (cntinten[12]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[12]  )
);


// &ConnRule(s/_x$/[13]/); @1156
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_13"); @1157
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_13 (
  .cntinten_wen_x   (cntinten_wen[13]),
  .cntinten_x       (cntinten[13]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[13]  )
);


// &ConnRule(s/_x$/[14]/); @1159
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_14"); @1160
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_14 (
  .cntinten_wen_x   (cntinten_wen[14]),
  .cntinten_x       (cntinten[14]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[14]  )
);


// &ConnRule(s/_x$/[15]/); @1162
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_15"); @1163
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_15 (
  .cntinten_wen_x   (cntinten_wen[15]),
  .cntinten_x       (cntinten[15]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[15]  )
);


// &ConnRule(s/_x$/[16]/); @1165
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_16"); @1166
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_16 (
  .cntinten_wen_x   (cntinten_wen[16]),
  .cntinten_x       (cntinten[16]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[16]  )
);


// &ConnRule(s/_x$/[17]/); @1168
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_17"); @1169
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_17 (
  .cntinten_wen_x   (cntinten_wen[17]),
  .cntinten_x       (cntinten[17]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[17]  )
);


// &ConnRule(s/_x$/[18]/); @1171
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_18"); @1172
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_18 (
  .cntinten_wen_x   (cntinten_wen[18]),
  .cntinten_x       (cntinten[18]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[18]  )
);


// &ConnRule(s/_x$/[19]/); @1174
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_19"); @1175
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_19 (
  .cntinten_wen_x   (cntinten_wen[19]),
  .cntinten_x       (cntinten[19]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[19]  )
);


// &ConnRule(s/_x$/[20]/); @1177
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_20"); @1178
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_20 (
  .cntinten_wen_x   (cntinten_wen[20]),
  .cntinten_x       (cntinten[20]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[20]  )
);


// &ConnRule(s/_x$/[21]/); @1180
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_21"); @1181
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_21 (
  .cntinten_wen_x   (cntinten_wen[21]),
  .cntinten_x       (cntinten[21]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[21]  )
);


// &ConnRule(s/_x$/[22]/); @1183
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_22"); @1184
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_22 (
  .cntinten_wen_x   (cntinten_wen[22]),
  .cntinten_x       (cntinten[22]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[22]  )
);


// &ConnRule(s/_x$/[23]/); @1186
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_23"); @1187
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_23 (
  .cntinten_wen_x   (cntinten_wen[23]),
  .cntinten_x       (cntinten[23]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[23]  )
);


// &ConnRule(s/_x$/[24]/); @1189
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_24"); @1190
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_24 (
  .cntinten_wen_x   (cntinten_wen[24]),
  .cntinten_x       (cntinten[24]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[24]  )
);


// &ConnRule(s/_x$/[25]/); @1192
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_25"); @1193
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_25 (
  .cntinten_wen_x   (cntinten_wen[25]),
  .cntinten_x       (cntinten[25]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[25]  )
);


// &ConnRule(s/_x$/[26]/); @1195
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_26"); @1196
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_26 (
  .cntinten_wen_x   (cntinten_wen[26]),
  .cntinten_x       (cntinten[26]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[26]  )
);


// &ConnRule(s/_x$/[27]/); @1198
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_27"); @1199
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_27 (
  .cntinten_wen_x   (cntinten_wen[27]),
  .cntinten_x       (cntinten[27]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[27]  )
);


// &ConnRule(s/_x$/[28]/); @1201
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_28"); @1202
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_28 (
  .cntinten_wen_x   (cntinten_wen[28]),
  .cntinten_x       (cntinten[28]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[28]  )
);


// &ConnRule(s/_x$/[29]/); @1204
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_29"); @1205
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_29 (
  .cntinten_wen_x   (cntinten_wen[29]),
  .cntinten_x       (cntinten[29]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[29]  )
);


// &ConnRule(s/_x$/[30]/); @1207
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_30"); @1208
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_30 (
  .cntinten_wen_x   (cntinten_wen[30]),
  .cntinten_x       (cntinten[30]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[30]  )
);


// &ConnRule(s/_x$/[31]/); @1210
// &Instance("ct_hpcp_cntinten_reg","x_ct_hpcp_cntinten_31"); @1211
ct_hpcp_cntinten_reg  x_ct_hpcp_cntinten_31 (
  .cntinten_wen_x   (cntinten_wen[31]),
  .cntinten_x       (cntinten[31]    ),
  .cpurst_b         (cpurst_b        ),
  .hpcp_clk         (hpcp_clk        ),
  .hpcp_wdata_x     (hpcp_wdata[31]  )
);




//==========================================================
// M/SCNTOF  - Machine/Supervisor Counter Overflow Register
//==========================================================
// +----+----+----+-----------+---+---+---+---+---+---+
// | 31 | 30 | 29 |      28:6 | 5 | 4 | 3 | 2 | 1 | 0 |
// +----+----+----+-----------+---+---+---+---+---+---+
//    |    |    |               |   |   |   |   |   |
//    |    |    |               |   |   |   |   |   +---- CY_OF
//    |    |    |               |   |   |   |   +-------- 0
//    |    |    |               |   |   |   +------------ IR_OF
//    |    |    |               |   |   +---------------- HPM3_OF
//    |    |    |               |   +-------------------- HPM4_OF
//    |    |    |               +------------------------ HPM5_OF
//    |    |    + --------------------------------------- HPM29_OF
//    |    +--------------------------------------------- HPM30_OF
//    +-------------------------------------------------- HPPM31_OF
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2of_data[31:0] <= 32'b0;
  else if(l2of_data_updt_vld)
    l2of_data[31:0] <= l2of_data_updt[31:0]; 
  else
    l2of_data[31:0] <= l2of_data[31:0];
end

always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    l2of_int[31:0]            <= 32'b0;
    biu_hpcp_l2of_int_ff[3:0] <= 4'b0;
  end
  else if(l2of_int_updt_vld) begin
    l2of_int[31:0]            <= l2of_int_updt[31:0]; 
    biu_hpcp_l2of_int_ff[3:0] <= biu_hpcp_l2of_int[3:0];
  end
end

assign l2of_data_updt_vld   = ofcnt_sel && cp0_hpcp_sel && biu_hpcp_cmplt;
assign l2of_data_updt[31:0] = {31'b0,biu_hpcp_rdata[0]}    << cnt0_event_index[5:0]
                            | {31'b0,biu_hpcp_rdata[1]}    << cnt1_event_index[5:0]
                            | {31'b0,biu_hpcp_rdata[2]}    << cnt2_event_index[5:0]
                            | {31'b0,biu_hpcp_rdata[3]}    << cnt3_event_index[5:0];

assign l2of_int_updt_vld    = |(biu_hpcp_l2of_int[3:0] ^ biu_hpcp_l2of_int_ff[3:0]);
assign l2of_int_updt[31:0]  = {31'b0,biu_hpcp_l2of_int[0]} << cnt0_event_index[5:0]
                            | {31'b0,biu_hpcp_l2of_int[1]} << cnt1_event_index[5:0]
                            | {31'b0,biu_hpcp_l2of_int[2]} << cnt2_event_index[5:0]
                            | {31'b0,biu_hpcp_l2of_int[3]} << cnt3_event_index[5:0];

assign cntof_value[63:0]  = {32'b0,cntof[31:0]}     & {32'b0,~cnt_mask[31:0]} 
                          | {32'b0,l2of_data[31:0]} & {32'b0, cnt_mask[31:0]};
assign cntof_int[31:0]    = cntof[31:0]    & (~cnt_mask[31:0]) 
                          | l2of_int[31:0] & ( cnt_mask[31:0]);                          
assign mcntof_value[63:0] = cntof_value[63:0]; 
assign scntof_value[63:0] = cntof_value[63:0] & {32'b0,cp0_hpcp_mcntwen[31:0]}; 

//======================================
// HPM31~3/IR/CY bit in mcountof
//======================================
assign cntof_wen[31:0] = {32{mcntof_wen}} 
                       | {32{scntof_wen}} & cp0_hpcp_mcntwen[31:0];

// &ConnRule(s/_x$/[0]/); @1278
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_0"); @1279
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_0 (
  .cntof_wen_x         (cntof_wen[0]       ),
  .cntof_x             (cntof[0]           ),
  .counter_overflow_x  (counter_overflow[0]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[0]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


assign cntof[1] = 1'b0;

// &ConnRule(s/_x$/[2]/); @1283
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_2"); @1284
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_2 (
  .cntof_wen_x         (cntof_wen[2]       ),
  .cntof_x             (cntof[2]           ),
  .counter_overflow_x  (counter_overflow[2]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[2]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


// &ConnRule(s/_x$/[3]/); @1286
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_3"); @1287
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_3 (
  .cntof_wen_x         (cntof_wen[3]       ),
  .cntof_x             (cntof[3]           ),
  .counter_overflow_x  (counter_overflow[3]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[3]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


// &ConnRule(s/_x$/[4]/); @1289
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_4"); @1290
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_4 (
  .cntof_wen_x         (cntof_wen[4]       ),
  .cntof_x             (cntof[4]           ),
  .counter_overflow_x  (counter_overflow[4]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[4]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


// &ConnRule(s/_x$/[5]/); @1292
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_5"); @1293
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_5 (
  .cntof_wen_x         (cntof_wen[5]       ),
  .cntof_x             (cntof[5]           ),
  .counter_overflow_x  (counter_overflow[5]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[5]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


// &ConnRule(s/_x$/[6]/); @1295
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_6"); @1296
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_6 (
  .cntof_wen_x         (cntof_wen[6]       ),
  .cntof_x             (cntof[6]           ),
  .counter_overflow_x  (counter_overflow[6]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[6]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


// &ConnRule(s/_x$/[7]/); @1298
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_7"); @1299
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_7 (
  .cntof_wen_x         (cntof_wen[7]       ),
  .cntof_x             (cntof[7]           ),
  .counter_overflow_x  (counter_overflow[7]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[7]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


// &ConnRule(s/_x$/[8]/); @1301
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_8"); @1302
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_8 (
  .cntof_wen_x         (cntof_wen[8]       ),
  .cntof_x             (cntof[8]           ),
  .counter_overflow_x  (counter_overflow[8]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[8]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


// &ConnRule(s/_x$/[9]/); @1304
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_9"); @1305
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_9 (
  .cntof_wen_x         (cntof_wen[9]       ),
  .cntof_x             (cntof[9]           ),
  .counter_overflow_x  (counter_overflow[9]),
  .cpurst_b            (cpurst_b           ),
  .hpcp_clk            (hpcp_clk           ),
  .hpcp_wdata_x        (hpcp_wdata[9]      ),
  .l2cnt_cmplt_ff      (l2cnt_cmplt_ff     )
);


// &ConnRule(s/_x$/[10]/); @1307
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_10"); @1308
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_10 (
  .cntof_wen_x          (cntof_wen[10]       ),
  .cntof_x              (cntof[10]           ),
  .counter_overflow_x   (counter_overflow[10]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[10]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[11]/); @1310
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_11"); @1311
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_11 (
  .cntof_wen_x          (cntof_wen[11]       ),
  .cntof_x              (cntof[11]           ),
  .counter_overflow_x   (counter_overflow[11]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[11]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[12]/); @1313
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_12"); @1314
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_12 (
  .cntof_wen_x          (cntof_wen[12]       ),
  .cntof_x              (cntof[12]           ),
  .counter_overflow_x   (counter_overflow[12]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[12]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[13]/); @1316
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_13"); @1317
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_13 (
  .cntof_wen_x          (cntof_wen[13]       ),
  .cntof_x              (cntof[13]           ),
  .counter_overflow_x   (counter_overflow[13]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[13]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[14]/); @1319
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_14"); @1320
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_14 (
  .cntof_wen_x          (cntof_wen[14]       ),
  .cntof_x              (cntof[14]           ),
  .counter_overflow_x   (counter_overflow[14]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[14]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[15]/); @1322
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_15"); @1323
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_15 (
  .cntof_wen_x          (cntof_wen[15]       ),
  .cntof_x              (cntof[15]           ),
  .counter_overflow_x   (counter_overflow[15]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[15]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[16]/); @1325
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_16"); @1326
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_16 (
  .cntof_wen_x          (cntof_wen[16]       ),
  .cntof_x              (cntof[16]           ),
  .counter_overflow_x   (counter_overflow[16]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[16]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[17]/); @1328
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_17"); @1329
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_17 (
  .cntof_wen_x          (cntof_wen[17]       ),
  .cntof_x              (cntof[17]           ),
  .counter_overflow_x   (counter_overflow[17]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[17]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[18]/); @1331
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_18"); @1332
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_18 (
  .cntof_wen_x          (cntof_wen[18]       ),
  .cntof_x              (cntof[18]           ),
  .counter_overflow_x   (counter_overflow[18]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[18]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[19]/); @1334
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_19"); @1335
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_19 (
  .cntof_wen_x          (cntof_wen[19]       ),
  .cntof_x              (cntof[19]           ),
  .counter_overflow_x   (counter_overflow[19]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[19]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[20]/); @1337
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_20"); @1338
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_20 (
  .cntof_wen_x          (cntof_wen[20]       ),
  .cntof_x              (cntof[20]           ),
  .counter_overflow_x   (counter_overflow[20]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[20]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[21]/); @1340
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_21"); @1341
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_21 (
  .cntof_wen_x          (cntof_wen[21]       ),
  .cntof_x              (cntof[21]           ),
  .counter_overflow_x   (counter_overflow[21]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[21]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[22]/); @1343
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_22"); @1344
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_22 (
  .cntof_wen_x          (cntof_wen[22]       ),
  .cntof_x              (cntof[22]           ),
  .counter_overflow_x   (counter_overflow[22]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[22]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[23]/); @1346
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_23"); @1347
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_23 (
  .cntof_wen_x          (cntof_wen[23]       ),
  .cntof_x              (cntof[23]           ),
  .counter_overflow_x   (counter_overflow[23]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[23]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[24]/); @1349
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_24"); @1350
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_24 (
  .cntof_wen_x          (cntof_wen[24]       ),
  .cntof_x              (cntof[24]           ),
  .counter_overflow_x   (counter_overflow[24]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[24]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[25]/); @1352
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_25"); @1353
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_25 (
  .cntof_wen_x          (cntof_wen[25]       ),
  .cntof_x              (cntof[25]           ),
  .counter_overflow_x   (counter_overflow[25]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[25]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[26]/); @1355
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_26"); @1356
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_26 (
  .cntof_wen_x          (cntof_wen[26]       ),
  .cntof_x              (cntof[26]           ),
  .counter_overflow_x   (counter_overflow[26]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[26]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[27]/); @1358
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_27"); @1359
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_27 (
  .cntof_wen_x          (cntof_wen[27]       ),
  .cntof_x              (cntof[27]           ),
  .counter_overflow_x   (counter_overflow[27]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[27]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[28]/); @1361
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_28"); @1362
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_28 (
  .cntof_wen_x          (cntof_wen[28]       ),
  .cntof_x              (cntof[28]           ),
  .counter_overflow_x   (counter_overflow[28]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[28]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[29]/); @1364
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_29"); @1365
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_29 (
  .cntof_wen_x          (cntof_wen[29]       ),
  .cntof_x              (cntof[29]           ),
  .counter_overflow_x   (counter_overflow[29]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[29]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[30]/); @1367
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_30"); @1368
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_30 (
  .cntof_wen_x          (cntof_wen[30]       ),
  .cntof_x              (cntof[30]           ),
  .counter_overflow_x   (counter_overflow[30]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[30]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


// &ConnRule(s/_x$/[31]/); @1370
// &Instance("ct_hpcp_cntof_reg","x_ct_hpcp_cntof_31"); @1371
ct_hpcp_cntof_reg  x_ct_hpcp_cntof_31 (
  .cntof_wen_x          (cntof_wen[31]       ),
  .cntof_x              (cntof[31]           ),
  .counter_overflow_x   (counter_overflow[31]),
  .cpurst_b             (cpurst_b            ),
  .hpcp_clk             (hpcp_clk            ),
  .hpcp_wdata_x         (hpcp_wdata[31]      ),
  .l2cnt_cmplt_ff       (l2cnt_cmplt_ff      )
);


assign counter_overflow[31:0] = {13'b0,mhpmcnt18_of,
                                 mhpmcnt17_of,mhpmcnt16_of,mhpmcnt15_of,mhpmcnt14_of,mhpmcnt13_of,mhpmcnt12_of,
                                 mhpmcnt11_of,mhpmcnt10_of,mhpmcnt9_of ,mhpmcnt8_of ,mhpmcnt7_of ,mhpmcnt6_of,
                                 mhpmcnt5_of ,mhpmcnt4_of ,mhpmcnt3_of ,minstret_of ,1'b0        ,mcycle_of};


//==========================================================
//                Configure Registers
//==========================================================
// &ConnRule(s/^eventx/mhpmevt3/);   @1401
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent3"); @1402
ct_hpcp_event  x_hpcp_mhpmevent3 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt3_clk_en   ),
  .eventx_value       (mhpmevt3_value    ),
  .eventx_wen         (mhpmevt3_wen      ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt4/);   @1404
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent4"); @1405
ct_hpcp_event  x_hpcp_mhpmevent4 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt4_clk_en   ),
  .eventx_value       (mhpmevt4_value    ),
  .eventx_wen         (mhpmevt4_wen      ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt5/);   @1407
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent5"); @1408
ct_hpcp_event  x_hpcp_mhpmevent5 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt5_clk_en   ),
  .eventx_value       (mhpmevt5_value    ),
  .eventx_wen         (mhpmevt5_wen      ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt6/);   @1410
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent6"); @1411
ct_hpcp_event  x_hpcp_mhpmevent6 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt6_clk_en   ),
  .eventx_value       (mhpmevt6_value    ),
  .eventx_wen         (mhpmevt6_wen      ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &ConnRule(s/^eventx/mhpmevt7/);   @1414
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent7"); @1415
ct_hpcp_event  x_hpcp_mhpmevent7 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt7_clk_en   ),
  .eventx_value       (mhpmevt7_value    ),
  .eventx_wen         (mhpmevt7_wen      ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt8/);   @1417
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent8"); @1418
ct_hpcp_event  x_hpcp_mhpmevent8 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt8_clk_en   ),
  .eventx_value       (mhpmevt8_value    ),
  .eventx_wen         (mhpmevt8_wen      ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt9/);   @1420
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent9"); @1421
ct_hpcp_event  x_hpcp_mhpmevent9 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt9_clk_en   ),
  .eventx_value       (mhpmevt9_value    ),
  .eventx_wen         (mhpmevt9_wen      ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt10/);   @1423
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent10"); @1424
ct_hpcp_event  x_hpcp_mhpmevent10 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt10_clk_en  ),
  .eventx_value       (mhpmevt10_value   ),
  .eventx_wen         (mhpmevt10_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &ConnRule(s/^eventx/mhpmevt11/);   @1427
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent11"); @1428
ct_hpcp_event  x_hpcp_mhpmevent11 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt11_clk_en  ),
  .eventx_value       (mhpmevt11_value   ),
  .eventx_wen         (mhpmevt11_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt12/);   @1430
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent12"); @1431
ct_hpcp_event  x_hpcp_mhpmevent12 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt12_clk_en  ),
  .eventx_value       (mhpmevt12_value   ),
  .eventx_wen         (mhpmevt12_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt13/);   @1433
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent13"); @1434
ct_hpcp_event  x_hpcp_mhpmevent13 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt13_clk_en  ),
  .eventx_value       (mhpmevt13_value   ),
  .eventx_wen         (mhpmevt13_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt14/);   @1436
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent14"); @1437
ct_hpcp_event  x_hpcp_mhpmevent14 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt14_clk_en  ),
  .eventx_value       (mhpmevt14_value   ),
  .eventx_wen         (mhpmevt14_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt15/);   @1439
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent15"); @1440
ct_hpcp_event  x_hpcp_mhpmevent15 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt15_clk_en  ),
  .eventx_value       (mhpmevt15_value   ),
  .eventx_wen         (mhpmevt15_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt16/);   @1442
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent16"); @1443
ct_hpcp_event  x_hpcp_mhpmevent16 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt16_clk_en  ),
  .eventx_value       (mhpmevt16_value   ),
  .eventx_wen         (mhpmevt16_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt17/);   @1445
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent17"); @1446
ct_hpcp_event  x_hpcp_mhpmevent17 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt17_clk_en  ),
  .eventx_value       (mhpmevt17_value   ),
  .eventx_wen         (mhpmevt17_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^eventx/mhpmevt18/);   @1448
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent18"); @1449
ct_hpcp_event  x_hpcp_mhpmevent18 (
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .eventx_clk_en      (mhpmevt18_clk_en  ),
  .eventx_value       (mhpmevt18_value   ),
  .eventx_wen         (mhpmevt18_wen     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &ConnRule(s/^eventx/mhpmevt19/);   @1452
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent19"); @1453
// &ConnRule(s/^eventx/mhpmevt20/);   @1455
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent20"); @1456
// &ConnRule(s/^eventx/mhpmevt21/);   @1458
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent21"); @1459
// &ConnRule(s/^eventx/mhpmevt22/);   @1461
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent22"); @1462
// &ConnRule(s/^eventx/mhpmevt23/);   @1464
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent23"); @1465
// &ConnRule(s/^eventx/mhpmevt24/);   @1467
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent24"); @1468
// &ConnRule(s/^eventx/mhpmevt25/);   @1470
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent25"); @1471
// &ConnRule(s/^eventx/mhpmevt26/);   @1473
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent26"); @1474
// &ConnRule(s/^eventx/mhpmevt27/);   @1476
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent27"); @1477
// &ConnRule(s/^eventx/mhpmevt28/);   @1479
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent28"); @1480
// &ConnRule(s/^eventx/mhpmevt29/);   @1482
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent29"); @1483
// &ConnRule(s/^eventx/mhpmevt30/);   @1485
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent30"); @1486
// &ConnRule(s/^eventx/mhpmevt31/);   @1488
// &Instance("ct_hpcp_event", "x_hpcp_mhpmevent31"); @1489

//==========================================================
//                       Counters 
//==========================================================
// Cycle counter 
// &ConnRule(s/^cnt/mcycle/); @1496
// &Instance("ct_hpcp_cnt", "x_hpcp_mcycle"); @1497
ct_hpcp_cnt  x_hpcp_mcycle (
  .cnt_adder          (mcycle_adder      ),
  .cnt_clk_en         (mcycle_clk_en     ),
  .cnt_en             (mcycle_en         ),
  .cnt_of             (mcycle_of         ),
  .cnt_value          (mcycle_value      ),
  .cnt_wen            (mcycle_wen        ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


//Instruction Retire counter
// &ConnRule(s/^cnt/minstret/); @1500
// &Instance("ct_hpcp_cnt", "x_hpcp_minstret"); @1501
ct_hpcp_cnt  x_hpcp_minstret (
  .cnt_adder          (minstret_adder    ),
  .cnt_clk_en         (minstret_clk_en   ),
  .cnt_en             (minstret_en       ),
  .cnt_of             (minstret_of       ),
  .cnt_value          (minstret_value    ),
  .cnt_wen            (minstret_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt3/); @1504
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt3"); @1505
ct_hpcp_cnt  x_hpcp_mhpmcnt3 (
  .cnt_adder          (mhpmcnt3_adder    ),
  .cnt_clk_en         (mhpmcnt3_clk_en   ),
  .cnt_en             (mhpmcnt3_en       ),
  .cnt_of             (mhpmcnt3_of       ),
  .cnt_value          (mhpmcnt3_value    ),
  .cnt_wen            (mhpmcnt3_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt4/); @1507
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt4"); @1508
ct_hpcp_cnt  x_hpcp_mhpmcnt4 (
  .cnt_adder          (mhpmcnt4_adder    ),
  .cnt_clk_en         (mhpmcnt4_clk_en   ),
  .cnt_en             (mhpmcnt4_en       ),
  .cnt_of             (mhpmcnt4_of       ),
  .cnt_value          (mhpmcnt4_value    ),
  .cnt_wen            (mhpmcnt4_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt5/); @1510
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt5"); @1511
ct_hpcp_cnt  x_hpcp_mhpmcnt5 (
  .cnt_adder          (mhpmcnt5_adder    ),
  .cnt_clk_en         (mhpmcnt5_clk_en   ),
  .cnt_en             (mhpmcnt5_en       ),
  .cnt_of             (mhpmcnt5_of       ),
  .cnt_value          (mhpmcnt5_value    ),
  .cnt_wen            (mhpmcnt5_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt6/); @1513
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt6"); @1514
ct_hpcp_cnt  x_hpcp_mhpmcnt6 (
  .cnt_adder          (mhpmcnt6_adder    ),
  .cnt_clk_en         (mhpmcnt6_clk_en   ),
  .cnt_en             (mhpmcnt6_en       ),
  .cnt_of             (mhpmcnt6_of       ),
  .cnt_value          (mhpmcnt6_value    ),
  .cnt_wen            (mhpmcnt6_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt7/); @1518
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt7"); @1519
ct_hpcp_cnt  x_hpcp_mhpmcnt7 (
  .cnt_adder          (mhpmcnt7_adder    ),
  .cnt_clk_en         (mhpmcnt7_clk_en   ),
  .cnt_en             (mhpmcnt7_en       ),
  .cnt_of             (mhpmcnt7_of       ),
  .cnt_value          (mhpmcnt7_value    ),
  .cnt_wen            (mhpmcnt7_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt8/); @1521
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt8"); @1522
ct_hpcp_cnt  x_hpcp_mhpmcnt8 (
  .cnt_adder          (mhpmcnt8_adder    ),
  .cnt_clk_en         (mhpmcnt8_clk_en   ),
  .cnt_en             (mhpmcnt8_en       ),
  .cnt_of             (mhpmcnt8_of       ),
  .cnt_value          (mhpmcnt8_value    ),
  .cnt_wen            (mhpmcnt8_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt9/); @1524
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt9"); @1525
ct_hpcp_cnt  x_hpcp_mhpmcnt9 (
  .cnt_adder          (mhpmcnt9_adder    ),
  .cnt_clk_en         (mhpmcnt9_clk_en   ),
  .cnt_en             (mhpmcnt9_en       ),
  .cnt_of             (mhpmcnt9_of       ),
  .cnt_value          (mhpmcnt9_value    ),
  .cnt_wen            (mhpmcnt9_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt10/); @1527
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt10"); @1528
ct_hpcp_cnt  x_hpcp_mhpmcnt10 (
  .cnt_adder          (mhpmcnt10_adder   ),
  .cnt_clk_en         (mhpmcnt10_clk_en  ),
  .cnt_en             (mhpmcnt10_en      ),
  .cnt_of             (mhpmcnt10_of      ),
  .cnt_value          (mhpmcnt10_value   ),
  .cnt_wen            (mhpmcnt10_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt11/); @1532
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt11"); @1533
ct_hpcp_cnt  x_hpcp_mhpmcnt11 (
  .cnt_adder          (mhpmcnt11_adder   ),
  .cnt_clk_en         (mhpmcnt11_clk_en  ),
  .cnt_en             (mhpmcnt11_en      ),
  .cnt_of             (mhpmcnt11_of      ),
  .cnt_value          (mhpmcnt11_value   ),
  .cnt_wen            (mhpmcnt11_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt12/); @1535
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt12"); @1536
ct_hpcp_cnt  x_hpcp_mhpmcnt12 (
  .cnt_adder          (mhpmcnt12_adder   ),
  .cnt_clk_en         (mhpmcnt12_clk_en  ),
  .cnt_en             (mhpmcnt12_en      ),
  .cnt_of             (mhpmcnt12_of      ),
  .cnt_value          (mhpmcnt12_value   ),
  .cnt_wen            (mhpmcnt12_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt13/); @1538
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt13"); @1539
ct_hpcp_cnt  x_hpcp_mhpmcnt13 (
  .cnt_adder          (mhpmcnt13_adder   ),
  .cnt_clk_en         (mhpmcnt13_clk_en  ),
  .cnt_en             (mhpmcnt13_en      ),
  .cnt_of             (mhpmcnt13_of      ),
  .cnt_value          (mhpmcnt13_value   ),
  .cnt_wen            (mhpmcnt13_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt14/); @1541
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt14"); @1542
ct_hpcp_cnt  x_hpcp_mhpmcnt14 (
  .cnt_adder          (mhpmcnt14_adder   ),
  .cnt_clk_en         (mhpmcnt14_clk_en  ),
  .cnt_en             (mhpmcnt14_en      ),
  .cnt_of             (mhpmcnt14_of      ),
  .cnt_value          (mhpmcnt14_value   ),
  .cnt_wen            (mhpmcnt14_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt15/); @1544
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt15"); @1545
ct_hpcp_cnt  x_hpcp_mhpmcnt15 (
  .cnt_adder          (mhpmcnt15_adder   ),
  .cnt_clk_en         (mhpmcnt15_clk_en  ),
  .cnt_en             (mhpmcnt15_en      ),
  .cnt_of             (mhpmcnt15_of      ),
  .cnt_value          (mhpmcnt15_value   ),
  .cnt_wen            (mhpmcnt15_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt16/); @1547
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt16"); @1548
ct_hpcp_cnt  x_hpcp_mhpmcnt16 (
  .cnt_adder          (mhpmcnt16_adder   ),
  .cnt_clk_en         (mhpmcnt16_clk_en  ),
  .cnt_en             (mhpmcnt16_en      ),
  .cnt_of             (mhpmcnt16_of      ),
  .cnt_value          (mhpmcnt16_value   ),
  .cnt_wen            (mhpmcnt16_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt17/); @1550
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt17"); @1551
ct_hpcp_cnt  x_hpcp_mhpmcnt17 (
  .cnt_adder          (mhpmcnt17_adder   ),
  .cnt_clk_en         (mhpmcnt17_clk_en  ),
  .cnt_en             (mhpmcnt17_en      ),
  .cnt_of             (mhpmcnt17_of      ),
  .cnt_value          (mhpmcnt17_value   ),
  .cnt_wen            (mhpmcnt17_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt18/); @1553
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt18"); @1554
ct_hpcp_cnt  x_hpcp_mhpmcnt18 (
  .cnt_adder          (mhpmcnt18_adder   ),
  .cnt_clk_en         (mhpmcnt18_clk_en  ),
  .cnt_en             (mhpmcnt18_en      ),
  .cnt_of             (mhpmcnt18_of      ),
  .cnt_value          (mhpmcnt18_value   ),
  .cnt_wen            (mhpmcnt18_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_cnt_en        (hpcp_cnt_en       ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ConnRule(s/^cnt/mhpmcnt19/); @1558
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt19"); @1559
// &ConnRule(s/^cnt/mhpmcnt20/); @1561
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt20"); @1562
// &ConnRule(s/^cnt/mhpmcnt21/); @1564
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt21"); @1565
// &ConnRule(s/^cnt/mhpmcnt22/); @1567
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt22"); @1568
// &ConnRule(s/^cnt/mhpmcnt23/); @1570
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt23"); @1571
// &ConnRule(s/^cnt/mhpmcnt24/); @1573
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt24"); @1574
// &ConnRule(s/^cnt/mhpmcnt25/); @1576
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt25"); @1577
// &ConnRule(s/^cnt/mhpmcnt26/); @1579
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt26"); @1580
// &ConnRule(s/^cnt/mhpmcnt27/); @1582
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt27"); @1583
// &ConnRule(s/^cnt/mhpmcnt28/); @1585
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt28"); @1586
// &ConnRule(s/^cnt/mhpmcnt29/); @1588
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt29"); @1589
// &ConnRule(s/^cnt/mhpmcnt30/); @1591
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt30"); @1592
// &ConnRule(s/^cnt/mhpmcnt31/); @1594
// &Instance("ct_hpcp_cnt", "x_hpcp_mhpmcnt31"); @1595

//==========================================================
// Read Operation
//==========================================================
// &CombBeg; @1601
always @( mhpmcnt14_value[63:0]
       or mhpmevt11_value[63:0]
       or mhpmevt14_value[63:0]
       or mhpmcr_value[63:0]
       or mhpmevt10_value[63:0]
       or mhpmevt18_value[63:0]
       or mcntinhbt_value[63:0]
       or mhpmevt6_value[63:0]
       or mhpmcnt9_value[63:0]
       or mhpmevt15_value[63:0]
       or mhpmcnt5_value[63:0]
       or scntinten_value[63:0]
       or mhpmevt12_value[63:0]
       or mhpmevt16_value[63:0]
       or mcntinten_value[63:0]
       or mhpmcnt7_value[63:0]
       or scntinhbt_value[63:0]
       or mhpmevt8_value[63:0]
       or mhpmcnt18_value[63:0]
       or shpmcr_value[63:0]
       or mcycle_value[63:0]
       or cp0_hpcp_index[11:0]
       or mhpmevt5_value[63:0]
       or mhpmcnt4_value[63:0]
       or biu_hpcp_time[63:0]
       or mhpmsp_value[63:0]
       or shpmsp_value[63:0]
       or mhpmcnt12_value[63:0]
       or mhpmevt17_value[63:0]
       or mhpmevt3_value[63:0]
       or mhpmcnt16_value[63:0]
       or mhpmep_value[63:0]
       or mhpmcnt17_value[63:0]
       or minstret_value[63:0]
       or mhpmevt7_value[63:0]
       or mhpmevt13_value[63:0]
       or mhpmcnt15_value[63:0]
       or mcntof_value[63:0]
       or mhpmcnt8_value[63:0]
       or shpmep_value[63:0]
       or mhpmevt4_value[63:0]
       or mhpmcnt13_value[63:0]
       or mhpmcnt3_value[63:0]
       or mhpmcnt11_value[63:0]
       or mhpmcnt10_value[63:0]
       or mhpmcnt6_value[63:0]
       or mhpmevt9_value[63:0]
       or scntof_value[63:0])
begin
  case(cp0_hpcp_index[11:0])
    MCNTINHBT  : data_out[63:0] = mcntinhbt_value[63:0];
    MCNTINTEN  : data_out[63:0] = mcntinten_value[63:0];
    MCNTOF     : data_out[63:0] = mcntof_value[63:0];
    MHPMCR     : data_out[63:0] = mhpmcr_value[63:0];
    MHPMSP     : data_out[63:0] = mhpmsp_value[63:0];
    MHPMEP     : data_out[63:0] = mhpmep_value[63:0];
    SCNTINHBT  : data_out[63:0] = scntinhbt_value[63:0];
    SCNTINTEN  : data_out[63:0] = scntinten_value[63:0];
    SCNTOF     : data_out[63:0] = scntof_value[63:0];
    SHPMCR     : data_out[63:0] = shpmcr_value[63:0];
    SHPMSP     : data_out[63:0] = shpmsp_value[63:0];
    SHPMEP     : data_out[63:0] = shpmep_value[63:0];
    MHPMEVT3   : data_out[63:0] = mhpmevt3_value[63:0]; 
    MHPMEVT4   : data_out[63:0] = mhpmevt4_value[63:0]; 
    MHPMEVT5   : data_out[63:0] = mhpmevt5_value[63:0];
    MHPMEVT6   : data_out[63:0] = mhpmevt6_value[63:0];
    MHPMEVT7   : data_out[63:0] = mhpmevt7_value[63:0];
    MHPMEVT8   : data_out[63:0] = mhpmevt8_value[63:0];
    MHPMEVT9   : data_out[63:0] = mhpmevt9_value[63:0];
    MHPMEVT10  : data_out[63:0] = mhpmevt10_value[63:0];
    MHPMEVT11  : data_out[63:0] = mhpmevt11_value[63:0];
    MHPMEVT12  : data_out[63:0] = mhpmevt12_value[63:0];
    MHPMEVT13  : data_out[63:0] = mhpmevt13_value[63:0];
    MHPMEVT14  : data_out[63:0] = mhpmevt14_value[63:0];
    MHPMEVT15  : data_out[63:0] = mhpmevt15_value[63:0];
    MHPMEVT16  : data_out[63:0] = mhpmevt16_value[63:0];
    MHPMEVT17  : data_out[63:0] = mhpmevt17_value[63:0];
    MHPMEVT18  : data_out[63:0] = mhpmevt18_value[63:0];
    MCYCLE     : data_out[63:0] = mcycle_value[63:0];
    MINSTRET   : data_out[63:0] = minstret_value[63:0]; 
    MHPMCNT3   : data_out[63:0] = mhpmcnt3_value[63:0]; 
    MHPMCNT4   : data_out[63:0] = mhpmcnt4_value[63:0];
    MHPMCNT5   : data_out[63:0] = mhpmcnt5_value[63:0];
    MHPMCNT6   : data_out[63:0] = mhpmcnt6_value[63:0];
    MHPMCNT7   : data_out[63:0] = mhpmcnt7_value[63:0];
    MHPMCNT8   : data_out[63:0] = mhpmcnt8_value[63:0];
    MHPMCNT9   : data_out[63:0] = mhpmcnt9_value[63:0];
    MHPMCNT10  : data_out[63:0] = mhpmcnt10_value[63:0];
    MHPMCNT11  : data_out[63:0] = mhpmcnt11_value[63:0];
    MHPMCNT12  : data_out[63:0] = mhpmcnt12_value[63:0];
    MHPMCNT13  : data_out[63:0] = mhpmcnt13_value[63:0];
    MHPMCNT14  : data_out[63:0] = mhpmcnt14_value[63:0];
    MHPMCNT15  : data_out[63:0] = mhpmcnt15_value[63:0];
    MHPMCNT16  : data_out[63:0] = mhpmcnt16_value[63:0];
    MHPMCNT17  : data_out[63:0] = mhpmcnt17_value[63:0];
    MHPMCNT18  : data_out[63:0] = mhpmcnt18_value[63:0];
    SCYCLE     : data_out[63:0] = mcycle_value[63:0];
    SINSTRET   : data_out[63:0] = minstret_value[63:0]; 
    SHPMCNT3   : data_out[63:0] = mhpmcnt3_value[63:0]; 
    SHPMCNT4   : data_out[63:0] = mhpmcnt4_value[63:0];
    SHPMCNT5   : data_out[63:0] = mhpmcnt5_value[63:0];
    SHPMCNT6   : data_out[63:0] = mhpmcnt6_value[63:0];
    SHPMCNT7   : data_out[63:0] = mhpmcnt7_value[63:0];
    SHPMCNT8   : data_out[63:0] = mhpmcnt8_value[63:0];
    SHPMCNT9   : data_out[63:0] = mhpmcnt9_value[63:0];
    SHPMCNT10  : data_out[63:0] = mhpmcnt10_value[63:0];
    SHPMCNT11  : data_out[63:0] = mhpmcnt11_value[63:0];
    SHPMCNT12  : data_out[63:0] = mhpmcnt12_value[63:0];
    SHPMCNT13  : data_out[63:0] = mhpmcnt13_value[63:0];
    SHPMCNT14  : data_out[63:0] = mhpmcnt14_value[63:0];
    SHPMCNT15  : data_out[63:0] = mhpmcnt15_value[63:0];
    SHPMCNT16  : data_out[63:0] = mhpmcnt16_value[63:0];
    SHPMCNT17  : data_out[63:0] = mhpmcnt17_value[63:0];
    SHPMCNT18  : data_out[63:0] = mhpmcnt18_value[63:0];
    CYCLE      : data_out[63:0] = mcycle_value[63:0]; 
    TIME       : data_out[63:0] = biu_hpcp_time[63:0];
    INSTRET    : data_out[63:0] = minstret_value[63:0];
    HPMCNT3    : data_out[63:0] = mhpmcnt3_value[63:0]; 
    HPMCNT4    : data_out[63:0] = mhpmcnt4_value[63:0];
    HPMCNT5    : data_out[63:0] = mhpmcnt5_value[63:0];
    HPMCNT6    : data_out[63:0] = mhpmcnt6_value[63:0];
    HPMCNT7    : data_out[63:0] = mhpmcnt7_value[63:0];
    HPMCNT8    : data_out[63:0] = mhpmcnt8_value[63:0];
    HPMCNT9    : data_out[63:0] = mhpmcnt9_value[63:0];
    HPMCNT10   : data_out[63:0] = mhpmcnt10_value[63:0];
    HPMCNT11   : data_out[63:0] = mhpmcnt11_value[63:0];
    HPMCNT12   : data_out[63:0] = mhpmcnt12_value[63:0];
    HPMCNT13   : data_out[63:0] = mhpmcnt13_value[63:0];
    HPMCNT14   : data_out[63:0] = mhpmcnt14_value[63:0];
    HPMCNT15   : data_out[63:0] = mhpmcnt15_value[63:0];
    HPMCNT16   : data_out[63:0] = mhpmcnt16_value[63:0];
    HPMCNT17   : data_out[63:0] = mhpmcnt17_value[63:0];
    HPMCNT18   : data_out[63:0] = mhpmcnt18_value[63:0];
    default    : data_out[63:0] = 64'b0;
  endcase
// &CombEnd; @1772
end

//==========================================================
// Interact With L2
//==========================================================
//Mask reg maintanance
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    cnt_mask[31:0]        <= 32'b0;
    cnt0_event_index[5:0] <= 6'b100000;
    cnt1_event_index[5:0] <= 6'b100000;
    cnt2_event_index[5:0] <= 6'b100000;
    cnt3_event_index[5:0] <= 6'b100000;
  end
  else if(cnt_mask_set)
  begin
    cnt_mask[31:0]        <= cnt_mask_set_data[31:0];
    cnt0_event_index[5:0] <= cnt0_event_index_set_data[5:0];
    cnt1_event_index[5:0] <= cnt1_event_index_set_data[5:0];
    cnt2_event_index[5:0] <= cnt2_event_index_set_data[5:0];
    cnt3_event_index[5:0] <= cnt3_event_index_set_data[5:0];
  end
  else if(cnt_mask_clr)
  begin
    cnt_mask[31:0]        <= cnt_mask_clr_data[31:0];
    cnt0_event_index[5:0] <= cnt0_event_index_clr_data[5:0];
    cnt1_event_index[5:0] <= cnt1_event_index_clr_data[5:0];
    cnt2_event_index[5:0] <= cnt2_event_index_clr_data[5:0];
    cnt3_event_index[5:0] <= cnt3_event_index_clr_data[5:0];
  end
  else
  begin
    cnt_mask[31:0]        <= cnt_mask[31:0];
    cnt0_event_index[5:0] <= cnt0_event_index[5:0];
    cnt1_event_index[5:0] <= cnt1_event_index[5:0];
    cnt2_event_index[5:0] <= cnt2_event_index[5:0];
    cnt3_event_index[5:0] <= cnt3_event_index[5:0];
  end
end

//1. select event counter
//2. select L2 counter index:16~19
//3. write operation
assign cnt_index_less_than_limit = cp0_hpcp_index[4:0] < 5'b10011;
assign cnt_mask_set = ((cp0_hpcp_index[11:5] == 7'h19) && (|cp0_hpcp_index[4:0]))
                   && cnt_index_less_than_limit
                   && (hpcp_wdata[HPMEVT_WIDTH-1:2] == 4'b0100)
                   && (!(|hpcp_wdata[63:HPMEVT_WIDTH]))
                   && hpcp_wen;    

//1. select event counter
//2. write operation              
//3. l2 cnt has been set     
assign cnt_mask_clr = ((cp0_hpcp_index[11:5] == 7'h19) && (|cp0_hpcp_index[4:0]))
//                   && (hpcp_wdata[HPMEVT_WIDTH-1:0] == {HPMEVT_WIDTH{1'b0}})
                   && cnt_bit_mask[0]
                   && hpcp_wen; 

assign cnt_bit_sel[31:0]              = 32'b1 << cp0_hpcp_index[4:0];

assign cnt_mask_set_data[31:0]        = cnt_mask[31:0] | cnt_bit_sel[31:0];
assign cnt_mask_clr_data[31:0]        = cnt_mask[31:0] & (~cnt_bit_sel[31:0]);

assign cnt0_event_index_set_data[5:0] = (hpcp_wdata[1:0] == 2'b00) ? {1'b0,cp0_hpcp_index[4:0]} : cnt0_event_index[5:0]; 
assign cnt1_event_index_set_data[5:0] = (hpcp_wdata[1:0] == 2'b01) ? {1'b0,cp0_hpcp_index[4:0]} : cnt1_event_index[5:0]; 
assign cnt2_event_index_set_data[5:0] = (hpcp_wdata[1:0] == 2'b10) ? {1'b0,cp0_hpcp_index[4:0]} : cnt2_event_index[5:0]; 
assign cnt3_event_index_set_data[5:0] = (hpcp_wdata[1:0] == 2'b11) ? {1'b0,cp0_hpcp_index[4:0]} : cnt3_event_index[5:0]; 

assign l2_ra_sel                      = cp0_hpcp_index[4:0] == cnt0_event_index[4:0];
assign l2_rm_sel                      = cp0_hpcp_index[4:0] == cnt1_event_index[4:0];
assign l2_wa_sel                      = cp0_hpcp_index[4:0] == cnt2_event_index[4:0];
assign l2_wm_sel                      = cp0_hpcp_index[4:0] == cnt3_event_index[4:0];
assign cnt0_event_index_clr_data[5:0] = (l2_ra_sel) ? {1'b1,5'b0} : cnt0_event_index[5:0]; 
assign cnt1_event_index_clr_data[5:0] = (l2_rm_sel) ? {1'b1,5'b0} : cnt1_event_index[5:0]; 
assign cnt2_event_index_clr_data[5:0] = (l2_wa_sel) ? {1'b1,5'b0} : cnt2_event_index[5:0]; 
assign cnt3_event_index_clr_data[5:0] = (l2_wm_sel) ? {1'b1,5'b0} : cnt3_event_index[5:0]; 

assign cnt_bit_mask[31:0]             = cnt_mask[31:0] >> cp0_hpcp_index[4:0];

//1. l2of wdata prepare
assign l2of_data0_shift[31:0]  = cp0_hpcp_src0[31:0] >> cnt0_event_index[5:0];
assign l2of_data1_shift[31:0]  = cp0_hpcp_src0[31:0] >> cnt1_event_index[5:0];
assign l2of_data2_shift[31:0]  = cp0_hpcp_src0[31:0] >> cnt2_event_index[5:0];
assign l2of_data3_shift[31:0]  = cp0_hpcp_src0[31:0] >> cnt3_event_index[5:0];

assign l2of_wen0_shift[31:0]   = cntof_wen[31:0] >> cnt0_event_index[5:0];
assign l2of_wen1_shift[31:0]   = cntof_wen[31:0] >> cnt1_event_index[5:0];
assign l2of_wen2_shift[31:0]   = cntof_wen[31:0] >> cnt2_event_index[5:0];
assign l2of_wen3_shift[31:0]   = cntof_wen[31:0] >> cnt3_event_index[5:0];

assign l2of_wdata[3:0]         = {l2of_data3_shift[0],l2of_data2_shift[0],l2of_data1_shift[0],l2of_data0_shift[0]};
assign l2of_wen[3:0]           = {l2of_wen3_shift[0],l2of_wen2_shift[0] ,l2of_wen1_shift[0],l2of_wen0_shift[0]};    

assign l2cnt_wdata[63:0]       = (ofcnt_sel) 
                               ? {60'b0,l2of_wdata[3:0]}
                               : cp0_hpcp_src0[63:0];
///2. l2 cnt en
assign l2cnt_ra_inhbt[31:0] = mcntinhbt_value[31:0] >> cnt0_event_index[5:0];
assign l2cnt_rm_inhbt[31:0] = mcntinhbt_value[31:0] >> cnt1_event_index[5:0];
assign l2cnt_wa_inhbt[31:0] = mcntinhbt_value[31:0] >> cnt2_event_index[5:0];
assign l2cnt_wm_inhbt[31:0] = mcntinhbt_value[31:0] >> cnt3_event_index[5:0];
assign l2cnt_ra_cnt_en      = !cnt0_event_index[5] && !l2cnt_ra_inhbt[0] && !rtu_yy_xx_dbgon && !cnt_mode_dis && hpcp_cnt_en;
assign l2cnt_rm_cnt_en      = !cnt1_event_index[5] && !l2cnt_rm_inhbt[0] && !rtu_yy_xx_dbgon && !cnt_mode_dis && hpcp_cnt_en;
assign l2cnt_wa_cnt_en      = !cnt2_event_index[5] && !l2cnt_wa_inhbt[0] && !rtu_yy_xx_dbgon && !cnt_mode_dis && hpcp_cnt_en;
assign l2cnt_wm_cnt_en      = !cnt3_event_index[5] && !l2cnt_wm_inhbt[0] && !rtu_yy_xx_dbgon && !cnt_mode_dis && hpcp_cnt_en;

assign l2cnt_en[3:0]       = {l2cnt_wm_cnt_en,l2cnt_wa_cnt_en,l2cnt_rm_cnt_en,l2cnt_ra_cnt_en};

//3. l2 l2 cnt index
assign l2cnt_reg_idx[3:0]  = {1'b1,
                              ofcnt_sel,
                              !ofcnt_sel && (l2_wa_sel || l2_wm_sel),
                              !ofcnt_sel && (l2_rm_sel || l2_wm_sel)
                             };   

assign l2cnt_idx[15:0]     = {4'b0,l2of_wen[3:0],l2cnt_reg_idx[3:0],cp0_hpcp_op[3:0]};

//==========================================================
// Output to CP0
//==========================================================
//L2 Information
//When CP0 select counter which counts L2 or counterof,hpcp will
//grant cp0 request until L2 return relative data
assign l2cnt_sel           = (cp0_hpcp_index[11:5] == 7'b1011_000)  //M-mode Counter
                          || (cp0_hpcp_index[11:5] == 7'b0101_111)  //S-mode Counter
                          || (cp0_hpcp_index[11:5] == 7'b1100_000); //U-mode Counter
assign ofcnt_sel           = (cp0_hpcp_index[11:0] == MCNTOF)       //M-mode counterof
                          || (cp0_hpcp_index[11:0] == SCNTOF);      //S-mode counterof

always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2cnt_cmplt_ff <= 1'b0;
  else if(biu_hpcp_cmplt)
    l2cnt_cmplt_ff <= 1'b1;
  else
    l2cnt_cmplt_ff <= 1'b0;
end

// &Force("bus","biu_hpcp_rdata",127,0); @1924
// &Force("output","hpcp_cp0_cmplt"); @1925
assign hpcp_cp0_cmplt      = (l2cnt_sel && cnt_bit_mask[0] || ofcnt_sel)
                           ? l2cnt_cmplt_ff && (cur_state[1:0] == EX2)
                           : (cur_state[1:0] == EX2);
assign hpcp_cp0_data[63:0] = (l2cnt_sel && cnt_bit_mask[0]) 
                           ? biu_hpcp_rdata[63:0]
                           : data_out[63:0];
assign hpcp_cp0_int_vld    = |(cntinten_value[31:0] & cntof_int[31:0]);
assign hpcp_cp0_sce        = sce;

assign hpcp_xx_cnt_en   = !rtu_yy_xx_dbgon && !cnt_mode_dis;
   
//==========================================================
// Output to BIU
//==========================================================
assign hpcp_biu_cnt_en[3:0] = l2cnt_en[3:0];
assign hpcp_biu_sel         = (l2cnt_sel && cnt_bit_mask[0] || ofcnt_sel) && (cur_state[1:0] == EX2) && !l2cnt_cmplt_ff;
assign hpcp_biu_wdata[63:0] = l2cnt_wdata[63:0];
assign hpcp_biu_op[15:0]    = l2cnt_idx[15:0];

//==========================================================
// Output to IFU
//==========================================================
assign hpcp_ifu_cnt_en  = hpcp_xx_cnt_en; 

//==========================================================
// Output to MMU
//==========================================================
assign hpcp_mmu_cnt_en  = hpcp_xx_cnt_en;
//==========================================================
// Output to IDU
//==========================================================
assign hpcp_idu_cnt_en  = hpcp_xx_cnt_en; 

//==========================================================
// Output to RTU
//==========================================================
assign hpcp_rtu_cnt_en  = hpcp_xx_cnt_en;

//==========================================================
// Output to LSU
//==========================================================
assign hpcp_lsu_cnt_en  = hpcp_xx_cnt_en; 

//==========================================================
// Trace monitor
//==========================================================
// &Instance("ct_hpcp_trace_mnt", "x_ct_hpcp_trace_mnt"); @1973
// &Force("input","rtu_hpcp_trace_inst0_chgflow"); @1975
// &Force("input","rtu_hpcp_trace_inst1_chgflow"); @1976
// &Force("input","rtu_hpcp_trace_inst2_chgflow"); @1977
// &Force("input","rtu_hpcp_trace_inst0_next_pc"); @1978
// &Force("input","rtu_hpcp_trace_inst1_next_pc"); @1979
// &Force("input","rtu_hpcp_trace_inst2_next_pc"); @1980

// &Force("bus","rtu_hpcp_trace_inst0_next_pc",38,0); @1982
// &Force("bus","rtu_hpcp_trace_inst1_next_pc",38,0); @1983
// &Force("bus","rtu_hpcp_trace_inst2_next_pc",38,0); @1984


// &Force("nonport","flag_reset"); @1992
// &Force("nonport","mcnten_hit"); @1993
// &Force("nonport","scnten_hit"); @1994
// &Force("nonport","mcntwen_hit"); @1995

// &ModuleEnd; @2160
endmodule


