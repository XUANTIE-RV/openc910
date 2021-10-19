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
module ct_ifu_ifdp(
  btb_ifdp_way0_pred,
  btb_ifdp_way0_tag,
  btb_ifdp_way0_target,
  btb_ifdp_way0_vld,
  btb_ifdp_way1_pred,
  btb_ifdp_way1_tag,
  btb_ifdp_way1_target,
  btb_ifdp_way1_vld,
  btb_ifdp_way2_pred,
  btb_ifdp_way2_tag,
  btb_ifdp_way2_target,
  btb_ifdp_way2_vld,
  btb_ifdp_way3_pred,
  btb_ifdp_way3_tag,
  btb_ifdp_way3_target,
  btb_ifdp_way3_vld,
  cp0_ifu_icache_en,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  had_yy_xx_bkpta_base,
  had_yy_xx_bkpta_mask,
  had_yy_xx_bkpta_rc,
  had_yy_xx_bkptb_base,
  had_yy_xx_bkptb_mask,
  had_yy_xx_bkptb_rc,
  icache_if_ifdp_fifo,
  icache_if_ifdp_inst_data0,
  icache_if_ifdp_inst_data1,
  icache_if_ifdp_precode0,
  icache_if_ifdp_precode1,
  icache_if_ifdp_tag_data0,
  icache_if_ifdp_tag_data1,
  ifctrl_ifdp_cancel,
  ifctrl_ifdp_pipedown,
  ifctrl_ifdp_stall,
  ifdp_debug_acc_err_vld,
  ifdp_debug_mmu_expt_vld,
  ifdp_ipctrl_expt_vld,
  ifdp_ipctrl_expt_vld_dup,
  ifdp_ipctrl_fifo,
  ifdp_ipctrl_pa,
  ifdp_ipctrl_refill_on,
  ifdp_ipctrl_tsize,
  ifdp_ipctrl_vpc_2_0_onehot,
  ifdp_ipctrl_vpc_bry_mask,
  ifdp_ipctrl_w0_bry0_hit,
  ifdp_ipctrl_w0_bry1_hit,
  ifdp_ipctrl_w0b0_br_ntake,
  ifdp_ipctrl_w0b0_br_taken,
  ifdp_ipctrl_w0b0_bry_data,
  ifdp_ipctrl_w0b1_br_ntake,
  ifdp_ipctrl_w0b1_br_taken,
  ifdp_ipctrl_w0b1_bry_data,
  ifdp_ipctrl_w1_bry0_hit,
  ifdp_ipctrl_w1_bry1_hit,
  ifdp_ipctrl_w1b0_br_ntake,
  ifdp_ipctrl_w1b0_br_taken,
  ifdp_ipctrl_w1b0_bry_data,
  ifdp_ipctrl_w1b1_br_ntake,
  ifdp_ipctrl_w1b1_br_taken,
  ifdp_ipctrl_w1b1_bry_data,
  ifdp_ipctrl_way0_15_8_hit,
  ifdp_ipctrl_way0_15_8_hit_dup,
  ifdp_ipctrl_way0_23_16_hit,
  ifdp_ipctrl_way0_23_16_hit_dup,
  ifdp_ipctrl_way0_28_24_hit,
  ifdp_ipctrl_way0_28_24_hit_dup,
  ifdp_ipctrl_way0_7_0_hit,
  ifdp_ipctrl_way0_7_0_hit_dup,
  ifdp_ipctrl_way1_15_8_hit,
  ifdp_ipctrl_way1_23_16_hit,
  ifdp_ipctrl_way1_28_24_hit,
  ifdp_ipctrl_way1_7_0_hit,
  ifdp_ipctrl_way_pred,
  ifdp_ipdp_acc_err,
  ifdp_ipdp_bkpta,
  ifdp_ipdp_bkptb,
  ifdp_ipdp_btb_way0_pred,
  ifdp_ipdp_btb_way0_tag,
  ifdp_ipdp_btb_way0_target,
  ifdp_ipdp_btb_way0_vld,
  ifdp_ipdp_btb_way1_pred,
  ifdp_ipdp_btb_way1_tag,
  ifdp_ipdp_btb_way1_target,
  ifdp_ipdp_btb_way1_vld,
  ifdp_ipdp_btb_way2_pred,
  ifdp_ipdp_btb_way2_tag,
  ifdp_ipdp_btb_way2_target,
  ifdp_ipdp_btb_way2_vld,
  ifdp_ipdp_btb_way3_pred,
  ifdp_ipdp_btb_way3_tag,
  ifdp_ipdp_btb_way3_target,
  ifdp_ipdp_btb_way3_vld,
  ifdp_ipdp_h1_inst_high_way0,
  ifdp_ipdp_h1_inst_high_way1,
  ifdp_ipdp_h1_inst_low_way0,
  ifdp_ipdp_h1_inst_low_way1,
  ifdp_ipdp_h1_precode_way0,
  ifdp_ipdp_h1_precode_way1,
  ifdp_ipdp_h2_inst_high_way0,
  ifdp_ipdp_h2_inst_high_way1,
  ifdp_ipdp_h2_inst_low_way0,
  ifdp_ipdp_h2_inst_low_way1,
  ifdp_ipdp_h2_precode_way0,
  ifdp_ipdp_h2_precode_way1,
  ifdp_ipdp_h3_inst_high_way0,
  ifdp_ipdp_h3_inst_high_way1,
  ifdp_ipdp_h3_inst_low_way0,
  ifdp_ipdp_h3_inst_low_way1,
  ifdp_ipdp_h3_precode_way0,
  ifdp_ipdp_h3_precode_way1,
  ifdp_ipdp_h4_inst_high_way0,
  ifdp_ipdp_h4_inst_high_way1,
  ifdp_ipdp_h4_inst_low_way0,
  ifdp_ipdp_h4_inst_low_way1,
  ifdp_ipdp_h4_precode_way0,
  ifdp_ipdp_h4_precode_way1,
  ifdp_ipdp_h5_inst_high_way0,
  ifdp_ipdp_h5_inst_high_way1,
  ifdp_ipdp_h5_inst_low_way0,
  ifdp_ipdp_h5_inst_low_way1,
  ifdp_ipdp_h5_precode_way0,
  ifdp_ipdp_h5_precode_way1,
  ifdp_ipdp_h6_inst_high_way0,
  ifdp_ipdp_h6_inst_high_way1,
  ifdp_ipdp_h6_inst_low_way0,
  ifdp_ipdp_h6_inst_low_way1,
  ifdp_ipdp_h6_precode_way0,
  ifdp_ipdp_h6_precode_way1,
  ifdp_ipdp_h7_inst_high_way0,
  ifdp_ipdp_h7_inst_high_way1,
  ifdp_ipdp_h7_inst_low_way0,
  ifdp_ipdp_h7_inst_low_way1,
  ifdp_ipdp_h7_precode_way0,
  ifdp_ipdp_h7_precode_way1,
  ifdp_ipdp_h8_inst_high_way0,
  ifdp_ipdp_h8_inst_high_way1,
  ifdp_ipdp_h8_inst_low_way0,
  ifdp_ipdp_h8_inst_low_way1,
  ifdp_ipdp_h8_precode_way0,
  ifdp_ipdp_h8_precode_way1,
  ifdp_ipdp_l0_btb_counter,
  ifdp_ipdp_l0_btb_entry_hit,
  ifdp_ipdp_l0_btb_hit,
  ifdp_ipdp_l0_btb_mispred_pc,
  ifdp_ipdp_l0_btb_ras,
  ifdp_ipdp_l0_btb_target,
  ifdp_ipdp_l0_btb_way0_high_hit,
  ifdp_ipdp_l0_btb_way0_low_hit,
  ifdp_ipdp_l0_btb_way1_high_hit,
  ifdp_ipdp_l0_btb_way1_low_hit,
  ifdp_ipdp_l0_btb_way2_high_hit,
  ifdp_ipdp_l0_btb_way2_low_hit,
  ifdp_ipdp_l0_btb_way3_high_hit,
  ifdp_ipdp_l0_btb_way3_low_hit,
  ifdp_ipdp_l0_btb_way_pred,
  ifdp_ipdp_mmu_pgflt,
  ifdp_ipdp_sfp_hit_pc_lo,
  ifdp_ipdp_sfp_hit_type,
  ifdp_ipdp_sfp_pc_hit,
  ifdp_ipdp_vpc,
  ifdp_l1_refill_bufferable,
  ifdp_l1_refill_cacheable,
  ifdp_l1_refill_fifo,
  ifdp_l1_refill_machine_mode,
  ifdp_l1_refill_secure,
  ifdp_l1_refill_supv_mode,
  ifdp_l1_refill_tsize,
  ipctrl_ifdp_gateclk_en,
  ipctrl_ifdp_vpc_onehot_updt,
  ipctrl_ifdp_w0_bry0_hit_updt,
  ipctrl_ifdp_w0_bry1_hit_updt,
  ipctrl_ifdp_w0b0_br_ntake_updt,
  ipctrl_ifdp_w0b0_br_taken_updt,
  ipctrl_ifdp_w0b0_bry_updt_data,
  ipctrl_ifdp_w0b1_br_ntake_updt,
  ipctrl_ifdp_w0b1_br_taken_updt,
  ipctrl_ifdp_w0b1_bry_updt_data,
  ipctrl_ifdp_w1_bry0_hit_updt,
  ipctrl_ifdp_w1_bry1_hit_updt,
  ipctrl_ifdp_w1b0_br_ntake_updt,
  ipctrl_ifdp_w1b0_br_taken_updt,
  ipctrl_ifdp_w1b0_bry_updt_data,
  ipctrl_ifdp_w1b1_br_ntake_updt,
  ipctrl_ifdp_w1b1_br_taken_updt,
  ipctrl_ifdp_w1b1_bry_updt_data,
  l0_btb_ifdp_chgflw_pc,
  l0_btb_ifdp_chgflw_way_pred,
  l0_btb_ifdp_counter,
  l0_btb_ifdp_entry_hit,
  l0_btb_ifdp_hit,
  l0_btb_ifdp_ras,
  l1_refill_ifdp_acc_err,
  l1_refill_ifdp_inst_data,
  l1_refill_ifdp_precode,
  l1_refill_ifdp_refill_on,
  l1_refill_ifdp_tag_data,
  mmu_ifu_buf,
  mmu_ifu_ca,
  mmu_ifu_pa,
  mmu_ifu_pgflt,
  mmu_ifu_sec,
  mmu_xx_mmu_en,
  pad_yy_icg_scan_en,
  pcgen_ifdp_inc_pc,
  pcgen_ifdp_pc,
  pcgen_ifdp_way_pred,
  rtu_yy_xx_dbgon,
  sfp_ifdp_hit_pc_lo,
  sfp_ifdp_hit_type,
  sfp_ifdp_pc_hit
);

// &Ports; @23
input   [1  :0]  btb_ifdp_way0_pred;            
input   [9  :0]  btb_ifdp_way0_tag;             
input   [19 :0]  btb_ifdp_way0_target;          
input            btb_ifdp_way0_vld;             
input   [1  :0]  btb_ifdp_way1_pred;            
input   [9  :0]  btb_ifdp_way1_tag;             
input   [19 :0]  btb_ifdp_way1_target;          
input            btb_ifdp_way1_vld;             
input   [1  :0]  btb_ifdp_way2_pred;            
input   [9  :0]  btb_ifdp_way2_tag;             
input   [19 :0]  btb_ifdp_way2_target;          
input            btb_ifdp_way2_vld;             
input   [1  :0]  btb_ifdp_way3_pred;            
input   [9  :0]  btb_ifdp_way3_tag;             
input   [19 :0]  btb_ifdp_way3_target;          
input            btb_ifdp_way3_vld;             
input            cp0_ifu_icache_en;             
input            cp0_ifu_icg_en;                
input            cp0_yy_clk_en;                 
input   [1  :0]  cp0_yy_priv_mode;              
input            cpurst_b;                      
input            forever_cpuclk;                
input   [39 :0]  had_yy_xx_bkpta_base;          
input   [7  :0]  had_yy_xx_bkpta_mask;          
input            had_yy_xx_bkpta_rc;            
input   [39 :0]  had_yy_xx_bkptb_base;          
input   [7  :0]  had_yy_xx_bkptb_mask;          
input            had_yy_xx_bkptb_rc;            
input            icache_if_ifdp_fifo;           
input   [127:0]  icache_if_ifdp_inst_data0;     
input   [127:0]  icache_if_ifdp_inst_data1;     
input   [31 :0]  icache_if_ifdp_precode0;       
input   [31 :0]  icache_if_ifdp_precode1;       
input   [28 :0]  icache_if_ifdp_tag_data0;      
input   [28 :0]  icache_if_ifdp_tag_data1;      
input            ifctrl_ifdp_cancel;            
input            ifctrl_ifdp_pipedown;          
input            ifctrl_ifdp_stall;             
input            ipctrl_ifdp_gateclk_en;        
input   [7  :0]  ipctrl_ifdp_vpc_onehot_updt;   
input            ipctrl_ifdp_w0_bry0_hit_updt;  
input            ipctrl_ifdp_w0_bry1_hit_updt;  
input   [7  :0]  ipctrl_ifdp_w0b0_br_ntake_updt; 
input   [7  :0]  ipctrl_ifdp_w0b0_br_taken_updt; 
input   [7  :0]  ipctrl_ifdp_w0b0_bry_updt_data; 
input   [7  :0]  ipctrl_ifdp_w0b1_br_ntake_updt; 
input   [7  :0]  ipctrl_ifdp_w0b1_br_taken_updt; 
input   [7  :0]  ipctrl_ifdp_w0b1_bry_updt_data; 
input            ipctrl_ifdp_w1_bry0_hit_updt;  
input            ipctrl_ifdp_w1_bry1_hit_updt;  
input   [7  :0]  ipctrl_ifdp_w1b0_br_ntake_updt; 
input   [7  :0]  ipctrl_ifdp_w1b0_br_taken_updt; 
input   [7  :0]  ipctrl_ifdp_w1b0_bry_updt_data; 
input   [7  :0]  ipctrl_ifdp_w1b1_br_ntake_updt; 
input   [7  :0]  ipctrl_ifdp_w1b1_br_taken_updt; 
input   [7  :0]  ipctrl_ifdp_w1b1_bry_updt_data; 
input   [38 :0]  l0_btb_ifdp_chgflw_pc;         
input   [1  :0]  l0_btb_ifdp_chgflw_way_pred;   
input            l0_btb_ifdp_counter;           
input   [15 :0]  l0_btb_ifdp_entry_hit;         
input            l0_btb_ifdp_hit;               
input            l0_btb_ifdp_ras;               
input            l1_refill_ifdp_acc_err;        
input   [127:0]  l1_refill_ifdp_inst_data;      
input   [31 :0]  l1_refill_ifdp_precode;        
input            l1_refill_ifdp_refill_on;      
input   [28 :0]  l1_refill_ifdp_tag_data;       
input            mmu_ifu_buf;                   
input            mmu_ifu_ca;                    
input   [27 :0]  mmu_ifu_pa;                    
input            mmu_ifu_pgflt;                 
input            mmu_ifu_sec;                   
input            mmu_xx_mmu_en;                 
input            pad_yy_icg_scan_en;            
input   [38 :0]  pcgen_ifdp_inc_pc;             
input   [38 :0]  pcgen_ifdp_pc;                 
input   [1  :0]  pcgen_ifdp_way_pred;           
input            rtu_yy_xx_dbgon;               
input   [2  :0]  sfp_ifdp_hit_pc_lo;            
input   [3  :0]  sfp_ifdp_hit_type;             
input            sfp_ifdp_pc_hit;               
output           ifdp_debug_acc_err_vld;        
output           ifdp_debug_mmu_expt_vld;       
output           ifdp_ipctrl_expt_vld;          
output           ifdp_ipctrl_expt_vld_dup;      
output           ifdp_ipctrl_fifo;              
output  [27 :0]  ifdp_ipctrl_pa;                
output           ifdp_ipctrl_refill_on;         
output           ifdp_ipctrl_tsize;             
output  [7  :0]  ifdp_ipctrl_vpc_2_0_onehot;    
output  [7  :0]  ifdp_ipctrl_vpc_bry_mask;      
output           ifdp_ipctrl_w0_bry0_hit;       
output           ifdp_ipctrl_w0_bry1_hit;       
output  [7  :0]  ifdp_ipctrl_w0b0_br_ntake;     
output  [7  :0]  ifdp_ipctrl_w0b0_br_taken;     
output  [7  :0]  ifdp_ipctrl_w0b0_bry_data;     
output  [7  :0]  ifdp_ipctrl_w0b1_br_ntake;     
output  [7  :0]  ifdp_ipctrl_w0b1_br_taken;     
output  [7  :0]  ifdp_ipctrl_w0b1_bry_data;     
output           ifdp_ipctrl_w1_bry0_hit;       
output           ifdp_ipctrl_w1_bry1_hit;       
output  [7  :0]  ifdp_ipctrl_w1b0_br_ntake;     
output  [7  :0]  ifdp_ipctrl_w1b0_br_taken;     
output  [7  :0]  ifdp_ipctrl_w1b0_bry_data;     
output  [7  :0]  ifdp_ipctrl_w1b1_br_ntake;     
output  [7  :0]  ifdp_ipctrl_w1b1_br_taken;     
output  [7  :0]  ifdp_ipctrl_w1b1_bry_data;     
output           ifdp_ipctrl_way0_15_8_hit;     
output           ifdp_ipctrl_way0_15_8_hit_dup; 
output           ifdp_ipctrl_way0_23_16_hit;    
output           ifdp_ipctrl_way0_23_16_hit_dup; 
output           ifdp_ipctrl_way0_28_24_hit;    
output           ifdp_ipctrl_way0_28_24_hit_dup; 
output           ifdp_ipctrl_way0_7_0_hit;      
output           ifdp_ipctrl_way0_7_0_hit_dup;  
output           ifdp_ipctrl_way1_15_8_hit;     
output           ifdp_ipctrl_way1_23_16_hit;    
output           ifdp_ipctrl_way1_28_24_hit;    
output           ifdp_ipctrl_way1_7_0_hit;      
output  [1  :0]  ifdp_ipctrl_way_pred;          
output           ifdp_ipdp_acc_err;             
output  [7  :0]  ifdp_ipdp_bkpta;               
output  [7  :0]  ifdp_ipdp_bkptb;               
output  [1  :0]  ifdp_ipdp_btb_way0_pred;       
output  [9  :0]  ifdp_ipdp_btb_way0_tag;        
output  [19 :0]  ifdp_ipdp_btb_way0_target;     
output           ifdp_ipdp_btb_way0_vld;        
output  [1  :0]  ifdp_ipdp_btb_way1_pred;       
output  [9  :0]  ifdp_ipdp_btb_way1_tag;        
output  [19 :0]  ifdp_ipdp_btb_way1_target;     
output           ifdp_ipdp_btb_way1_vld;        
output  [1  :0]  ifdp_ipdp_btb_way2_pred;       
output  [9  :0]  ifdp_ipdp_btb_way2_tag;        
output  [19 :0]  ifdp_ipdp_btb_way2_target;     
output           ifdp_ipdp_btb_way2_vld;        
output  [1  :0]  ifdp_ipdp_btb_way3_pred;       
output  [9  :0]  ifdp_ipdp_btb_way3_tag;        
output  [19 :0]  ifdp_ipdp_btb_way3_target;     
output           ifdp_ipdp_btb_way3_vld;        
output  [13 :0]  ifdp_ipdp_h1_inst_high_way0;   
output  [13 :0]  ifdp_ipdp_h1_inst_high_way1;   
output  [1  :0]  ifdp_ipdp_h1_inst_low_way0;    
output  [1  :0]  ifdp_ipdp_h1_inst_low_way1;    
output  [3  :0]  ifdp_ipdp_h1_precode_way0;     
output  [3  :0]  ifdp_ipdp_h1_precode_way1;     
output  [13 :0]  ifdp_ipdp_h2_inst_high_way0;   
output  [13 :0]  ifdp_ipdp_h2_inst_high_way1;   
output  [1  :0]  ifdp_ipdp_h2_inst_low_way0;    
output  [1  :0]  ifdp_ipdp_h2_inst_low_way1;    
output  [3  :0]  ifdp_ipdp_h2_precode_way0;     
output  [3  :0]  ifdp_ipdp_h2_precode_way1;     
output  [13 :0]  ifdp_ipdp_h3_inst_high_way0;   
output  [13 :0]  ifdp_ipdp_h3_inst_high_way1;   
output  [1  :0]  ifdp_ipdp_h3_inst_low_way0;    
output  [1  :0]  ifdp_ipdp_h3_inst_low_way1;    
output  [3  :0]  ifdp_ipdp_h3_precode_way0;     
output  [3  :0]  ifdp_ipdp_h3_precode_way1;     
output  [13 :0]  ifdp_ipdp_h4_inst_high_way0;   
output  [13 :0]  ifdp_ipdp_h4_inst_high_way1;   
output  [1  :0]  ifdp_ipdp_h4_inst_low_way0;    
output  [1  :0]  ifdp_ipdp_h4_inst_low_way1;    
output  [3  :0]  ifdp_ipdp_h4_precode_way0;     
output  [3  :0]  ifdp_ipdp_h4_precode_way1;     
output  [13 :0]  ifdp_ipdp_h5_inst_high_way0;   
output  [13 :0]  ifdp_ipdp_h5_inst_high_way1;   
output  [1  :0]  ifdp_ipdp_h5_inst_low_way0;    
output  [1  :0]  ifdp_ipdp_h5_inst_low_way1;    
output  [3  :0]  ifdp_ipdp_h5_precode_way0;     
output  [3  :0]  ifdp_ipdp_h5_precode_way1;     
output  [13 :0]  ifdp_ipdp_h6_inst_high_way0;   
output  [13 :0]  ifdp_ipdp_h6_inst_high_way1;   
output  [1  :0]  ifdp_ipdp_h6_inst_low_way0;    
output  [1  :0]  ifdp_ipdp_h6_inst_low_way1;    
output  [3  :0]  ifdp_ipdp_h6_precode_way0;     
output  [3  :0]  ifdp_ipdp_h6_precode_way1;     
output  [13 :0]  ifdp_ipdp_h7_inst_high_way0;   
output  [13 :0]  ifdp_ipdp_h7_inst_high_way1;   
output  [1  :0]  ifdp_ipdp_h7_inst_low_way0;    
output  [1  :0]  ifdp_ipdp_h7_inst_low_way1;    
output  [3  :0]  ifdp_ipdp_h7_precode_way0;     
output  [3  :0]  ifdp_ipdp_h7_precode_way1;     
output  [13 :0]  ifdp_ipdp_h8_inst_high_way0;   
output  [13 :0]  ifdp_ipdp_h8_inst_high_way1;   
output  [1  :0]  ifdp_ipdp_h8_inst_low_way0;    
output  [1  :0]  ifdp_ipdp_h8_inst_low_way1;    
output  [3  :0]  ifdp_ipdp_h8_precode_way0;     
output  [3  :0]  ifdp_ipdp_h8_precode_way1;     
output           ifdp_ipdp_l0_btb_counter;      
output  [15 :0]  ifdp_ipdp_l0_btb_entry_hit;    
output           ifdp_ipdp_l0_btb_hit;          
output  [38 :0]  ifdp_ipdp_l0_btb_mispred_pc;   
output           ifdp_ipdp_l0_btb_ras;          
output  [38 :0]  ifdp_ipdp_l0_btb_target;       
output           ifdp_ipdp_l0_btb_way0_high_hit; 
output           ifdp_ipdp_l0_btb_way0_low_hit; 
output           ifdp_ipdp_l0_btb_way1_high_hit; 
output           ifdp_ipdp_l0_btb_way1_low_hit; 
output           ifdp_ipdp_l0_btb_way2_high_hit; 
output           ifdp_ipdp_l0_btb_way2_low_hit; 
output           ifdp_ipdp_l0_btb_way3_high_hit; 
output           ifdp_ipdp_l0_btb_way3_low_hit; 
output  [1  :0]  ifdp_ipdp_l0_btb_way_pred;     
output           ifdp_ipdp_mmu_pgflt;           
output  [2  :0]  ifdp_ipdp_sfp_hit_pc_lo;       
output  [3  :0]  ifdp_ipdp_sfp_hit_type;        
output           ifdp_ipdp_sfp_pc_hit;          
output  [38 :0]  ifdp_ipdp_vpc;                 
output           ifdp_l1_refill_bufferable;     
output           ifdp_l1_refill_cacheable;      
output           ifdp_l1_refill_fifo;           
output           ifdp_l1_refill_machine_mode;   
output           ifdp_l1_refill_secure;         
output           ifdp_l1_refill_supv_mode;      
output           ifdp_l1_refill_tsize;          

// &Regs; @24
reg     [1  :0]  btb_way0_pred;                 
reg     [9  :0]  btb_way0_tag;                  
reg     [19 :0]  btb_way0_target;               
reg              btb_way0_vld;                  
reg     [1  :0]  btb_way1_pred;                 
reg     [9  :0]  btb_way1_tag;                  
reg     [19 :0]  btb_way1_target;               
reg              btb_way1_vld;                  
reg     [1  :0]  btb_way2_pred;                 
reg     [9  :0]  btb_way2_tag;                  
reg     [19 :0]  btb_way2_target;               
reg              btb_way2_vld;                  
reg     [1  :0]  btb_way3_pred;                 
reg     [9  :0]  btb_way3_tag;                  
reg     [19 :0]  btb_way3_target;               
reg              btb_way3_vld;                  
reg              cp0_ifu_icache_en_flop;        
reg     [7  :0]  if_vpc_2_0_onehot;             
reg              ifdp_ipctrl_expt_vld_dup;      
reg              ifdp_ipctrl_fifo;              
reg     [27 :0]  ifdp_ipctrl_pa;                
reg              ifdp_ipctrl_refill_on;         
reg     [7  :0]  ifdp_ipctrl_vpc_2_0_onehot;    
reg     [7  :0]  ifdp_ipctrl_vpc_bry_mask;      
reg              ifdp_ipctrl_w0_bry0_hit;       
reg              ifdp_ipctrl_w0_bry1_hit;       
reg     [7  :0]  ifdp_ipctrl_w0b0_br_ntake;     
reg     [7  :0]  ifdp_ipctrl_w0b0_br_taken;     
reg     [7  :0]  ifdp_ipctrl_w0b0_bry_data;     
reg     [7  :0]  ifdp_ipctrl_w0b1_br_ntake;     
reg     [7  :0]  ifdp_ipctrl_w0b1_br_taken;     
reg     [7  :0]  ifdp_ipctrl_w0b1_bry_data;     
reg              ifdp_ipctrl_w1_bry0_hit;       
reg              ifdp_ipctrl_w1_bry1_hit;       
reg     [7  :0]  ifdp_ipctrl_w1b0_br_ntake;     
reg     [7  :0]  ifdp_ipctrl_w1b0_br_taken;     
reg     [7  :0]  ifdp_ipctrl_w1b0_bry_data;     
reg     [7  :0]  ifdp_ipctrl_w1b1_br_ntake;     
reg     [7  :0]  ifdp_ipctrl_w1b1_br_taken;     
reg     [7  :0]  ifdp_ipctrl_w1b1_bry_data;     
reg              ifdp_ipctrl_way0_15_8_hit;     
reg              ifdp_ipctrl_way0_15_8_hit_dup; 
reg              ifdp_ipctrl_way0_23_16_hit;    
reg              ifdp_ipctrl_way0_23_16_hit_dup; 
reg              ifdp_ipctrl_way0_28_24_hit;    
reg              ifdp_ipctrl_way0_28_24_hit_dup; 
reg              ifdp_ipctrl_way0_7_0_hit;      
reg              ifdp_ipctrl_way0_7_0_hit_dup;  
reg              ifdp_ipctrl_way1_15_8_hit;     
reg              ifdp_ipctrl_way1_23_16_hit;    
reg              ifdp_ipctrl_way1_28_24_hit;    
reg              ifdp_ipctrl_way1_7_0_hit;      
reg     [1  :0]  ifdp_ipctrl_way_pred;          
reg              ifdp_ipdp_acc_err;             
reg     [7  :0]  ifdp_ipdp_bkpta;               
reg     [7  :0]  ifdp_ipdp_bkptb;               
reg              ifdp_ipdp_expt_vld;            
reg     [13 :0]  ifdp_ipdp_h1_inst_high_way0;   
reg     [13 :0]  ifdp_ipdp_h1_inst_high_way1;   
reg     [1  :0]  ifdp_ipdp_h1_inst_low_way0;    
reg     [1  :0]  ifdp_ipdp_h1_inst_low_way1;    
reg     [3  :0]  ifdp_ipdp_h1_precode_way0;     
reg     [3  :0]  ifdp_ipdp_h1_precode_way1;     
reg     [13 :0]  ifdp_ipdp_h2_inst_high_way0;   
reg     [13 :0]  ifdp_ipdp_h2_inst_high_way1;   
reg     [1  :0]  ifdp_ipdp_h2_inst_low_way0;    
reg     [1  :0]  ifdp_ipdp_h2_inst_low_way1;    
reg     [3  :0]  ifdp_ipdp_h2_precode_way0;     
reg     [3  :0]  ifdp_ipdp_h2_precode_way1;     
reg     [13 :0]  ifdp_ipdp_h3_inst_high_way0;   
reg     [13 :0]  ifdp_ipdp_h3_inst_high_way1;   
reg     [1  :0]  ifdp_ipdp_h3_inst_low_way0;    
reg     [1  :0]  ifdp_ipdp_h3_inst_low_way1;    
reg     [3  :0]  ifdp_ipdp_h3_precode_way0;     
reg     [3  :0]  ifdp_ipdp_h3_precode_way1;     
reg     [13 :0]  ifdp_ipdp_h4_inst_high_way0;   
reg     [13 :0]  ifdp_ipdp_h4_inst_high_way1;   
reg     [1  :0]  ifdp_ipdp_h4_inst_low_way0;    
reg     [1  :0]  ifdp_ipdp_h4_inst_low_way1;    
reg     [3  :0]  ifdp_ipdp_h4_precode_way0;     
reg     [3  :0]  ifdp_ipdp_h4_precode_way1;     
reg     [13 :0]  ifdp_ipdp_h5_inst_high_way0;   
reg     [13 :0]  ifdp_ipdp_h5_inst_high_way1;   
reg     [1  :0]  ifdp_ipdp_h5_inst_low_way0;    
reg     [1  :0]  ifdp_ipdp_h5_inst_low_way1;    
reg     [3  :0]  ifdp_ipdp_h5_precode_way0;     
reg     [3  :0]  ifdp_ipdp_h5_precode_way1;     
reg     [13 :0]  ifdp_ipdp_h6_inst_high_way0;   
reg     [13 :0]  ifdp_ipdp_h6_inst_high_way1;   
reg     [1  :0]  ifdp_ipdp_h6_inst_low_way0;    
reg     [1  :0]  ifdp_ipdp_h6_inst_low_way1;    
reg     [3  :0]  ifdp_ipdp_h6_precode_way0;     
reg     [3  :0]  ifdp_ipdp_h6_precode_way1;     
reg     [13 :0]  ifdp_ipdp_h7_inst_high_way0;   
reg     [13 :0]  ifdp_ipdp_h7_inst_high_way1;   
reg     [1  :0]  ifdp_ipdp_h7_inst_low_way0;    
reg     [1  :0]  ifdp_ipdp_h7_inst_low_way1;    
reg     [3  :0]  ifdp_ipdp_h7_precode_way0;     
reg     [3  :0]  ifdp_ipdp_h7_precode_way1;     
reg     [13 :0]  ifdp_ipdp_h8_inst_high_way0;   
reg     [13 :0]  ifdp_ipdp_h8_inst_high_way1;   
reg     [1  :0]  ifdp_ipdp_h8_inst_low_way0;    
reg     [1  :0]  ifdp_ipdp_h8_inst_low_way1;    
reg     [3  :0]  ifdp_ipdp_h8_precode_way0;     
reg     [3  :0]  ifdp_ipdp_h8_precode_way1;     
reg              ifdp_ipdp_mmu_pgflt;           
reg     [2  :0]  ifdp_ipdp_sfp_hit_pc_lo;       
reg     [3  :0]  ifdp_ipdp_sfp_hit_type;        
reg              ifdp_ipdp_sfp_pc_hit;          
reg     [38 :0]  ifdp_ipdp_vpc;                 
reg              ifdp_l1_refill_bufferable;     
reg              ifdp_l1_refill_cacheable;      
reg              ifdp_l1_refill_fifo;           
reg              ifdp_l1_refill_machine_mode;   
reg              ifdp_l1_refill_secure;         
reg              ifdp_l1_refill_supv_mode;      
reg              ifdp_l1_refill_tsize;          
reg              l0_btb_counter;                
reg     [15 :0]  l0_btb_entry_hit;              
reg              l0_btb_hit;                    
reg     [38 :0]  l0_btb_mispred_pc;             
reg              l0_btb_ras;                    
reg     [38 :0]  l0_btb_target;                 
reg              l0_btb_way0_high_hit;          
reg              l0_btb_way0_low_hit;           
reg              l0_btb_way1_high_hit;          
reg              l0_btb_way1_low_hit;           
reg              l0_btb_way2_high_hit;          
reg              l0_btb_way2_low_hit;           
reg              l0_btb_way3_high_hit;          
reg              l0_btb_way3_low_hit;           
reg     [1  :0]  l0_btb_way_pred;               
reg     [7  :0]  vpc_bry_mask;                  

// &Wires; @25
wire    [39 :0]  bkpta_base;                    
wire             bkpta_hit_0;                   
wire             bkpta_hit_1;                   
wire             bkpta_hit_2;                   
wire             bkpta_hit_3;                   
wire             bkpta_hit_4;                   
wire             bkpta_hit_5;                   
wire             bkpta_hit_6;                   
wire             bkpta_hit_7;                   
wire    [39 :0]  bkpta_mask;                    
wire    [39 :0]  bkptb_base;                    
wire             bkptb_hit_0;                   
wire             bkptb_hit_1;                   
wire             bkptb_hit_2;                   
wire             bkptb_hit_3;                   
wire             bkptb_hit_4;                   
wire             bkptb_hit_5;                   
wire             bkptb_hit_6;                   
wire             bkptb_hit_7;                   
wire    [39 :0]  bkptb_mask;                    
wire    [1  :0]  btb_ifdp_way0_pred;            
wire    [9  :0]  btb_ifdp_way0_tag;             
wire    [19 :0]  btb_ifdp_way0_target;          
wire             btb_ifdp_way0_vld;             
wire    [1  :0]  btb_ifdp_way1_pred;            
wire    [9  :0]  btb_ifdp_way1_tag;             
wire    [19 :0]  btb_ifdp_way1_target;          
wire             btb_ifdp_way1_vld;             
wire    [1  :0]  btb_ifdp_way2_pred;            
wire    [9  :0]  btb_ifdp_way2_tag;             
wire    [19 :0]  btb_ifdp_way2_target;          
wire             btb_ifdp_way2_vld;             
wire    [1  :0]  btb_ifdp_way3_pred;            
wire    [9  :0]  btb_ifdp_way3_tag;             
wire    [19 :0]  btb_ifdp_way3_target;          
wire             btb_ifdp_way3_vld;             
wire    [38 :0]  btb_mispred_pc;                
wire             btb_way0_high_hit;             
wire             btb_way0_low_hit;              
wire             btb_way1_high_hit;             
wire             btb_way1_low_hit;              
wire             btb_way2_high_hit;             
wire             btb_way2_low_hit;              
wire             btb_way3_high_hit;             
wire             btb_way3_low_hit;              
wire             cp0_ifu_icache_en;             
wire             cp0_ifu_icg_en;                
wire             cp0_yy_clk_en;                 
wire    [1  :0]  cp0_yy_priv_mode;              
wire             cpurst_b;                      
wire             forever_cpuclk;                
wire    [39 :0]  had_yy_xx_bkpta_base;          
wire    [7  :0]  had_yy_xx_bkpta_mask;          
wire             had_yy_xx_bkpta_rc;            
wire    [39 :0]  had_yy_xx_bkptb_base;          
wire    [7  :0]  had_yy_xx_bkptb_mask;          
wire             had_yy_xx_bkptb_rc;            
wire    [13 :0]  half1_inst_high_way0;          
wire    [13 :0]  half1_inst_high_way1;          
wire    [1  :0]  half1_inst_low_way0;           
wire    [1  :0]  half1_inst_low_way1;           
wire    [3  :0]  half1_precode_way0;            
wire    [3  :0]  half1_precode_way1;            
wire    [13 :0]  half2_inst_high_way0;          
wire    [13 :0]  half2_inst_high_way1;          
wire    [1  :0]  half2_inst_low_way0;           
wire    [1  :0]  half2_inst_low_way1;           
wire    [3  :0]  half2_precode_way0;            
wire    [3  :0]  half2_precode_way1;            
wire    [13 :0]  half3_inst_high_way0;          
wire    [13 :0]  half3_inst_high_way1;          
wire    [1  :0]  half3_inst_low_way0;           
wire    [1  :0]  half3_inst_low_way1;           
wire    [3  :0]  half3_precode_way0;            
wire    [3  :0]  half3_precode_way1;            
wire    [13 :0]  half4_inst_high_way0;          
wire    [13 :0]  half4_inst_high_way1;          
wire    [1  :0]  half4_inst_low_way0;           
wire    [1  :0]  half4_inst_low_way1;           
wire    [3  :0]  half4_precode_way0;            
wire    [3  :0]  half4_precode_way1;            
wire    [13 :0]  half5_inst_high_way0;          
wire    [13 :0]  half5_inst_high_way1;          
wire    [1  :0]  half5_inst_low_way0;           
wire    [1  :0]  half5_inst_low_way1;           
wire    [3  :0]  half5_precode_way0;            
wire    [3  :0]  half5_precode_way1;            
wire    [13 :0]  half6_inst_high_way0;          
wire    [13 :0]  half6_inst_high_way1;          
wire    [1  :0]  half6_inst_low_way0;           
wire    [1  :0]  half6_inst_low_way1;           
wire    [3  :0]  half6_precode_way0;            
wire    [3  :0]  half6_precode_way1;            
wire    [13 :0]  half7_inst_high_way0;          
wire    [13 :0]  half7_inst_high_way1;          
wire    [1  :0]  half7_inst_low_way0;           
wire    [1  :0]  half7_inst_low_way1;           
wire    [3  :0]  half7_precode_way0;            
wire    [3  :0]  half7_precode_way1;            
wire    [13 :0]  half8_inst_high_way0;          
wire    [13 :0]  half8_inst_high_way1;          
wire    [1  :0]  half8_inst_low_way0;           
wire    [1  :0]  half8_inst_low_way1;           
wire    [3  :0]  half8_precode_way0;            
wire    [3  :0]  half8_precode_way1;            
wire             icache_flop_clk;               
wire             icache_flop_clk_en;            
wire             icache_if_ifdp_fifo;           
wire    [127:0]  icache_if_ifdp_inst_data0;     
wire    [127:0]  icache_if_ifdp_inst_data1;     
wire    [31 :0]  icache_if_ifdp_precode0;       
wire    [31 :0]  icache_if_ifdp_precode1;       
wire    [28 :0]  icache_if_ifdp_tag_data0;      
wire    [28 :0]  icache_if_ifdp_tag_data1;      
wire             icache_tag_way0_15_8_hit;      
wire             icache_tag_way0_23_16_hit;     
wire             icache_tag_way0_28_24_hit;     
wire             icache_tag_way0_7_0_hit;       
wire             icache_tag_way1_15_8_hit;      
wire             icache_tag_way1_23_16_hit;     
wire             icache_tag_way1_28_24_hit;     
wire             icache_tag_way1_7_0_hit;       
wire    [7  :0]  if_bkpta;                      
wire    [7  :0]  if_bkptb;                      
wire             if_mmu_expt_vld;               
wire             if_refill_expt_vld;            
wire             ifctrl_ifdp_cancel;            
wire             ifctrl_ifdp_pipedown;          
wire             ifctrl_ifdp_stall;             
wire             ifdp_clk;                      
wire             ifdp_clk_en;                   
wire             ifdp_debug_acc_err_vld;        
wire             ifdp_debug_mmu_expt_vld;       
wire             ifdp_expt_vld;                 
wire             ifdp_fifo_bit;                 
wire             ifdp_icache_way0_15_8_hit;     
wire             ifdp_icache_way0_23_16_hit;    
wire             ifdp_icache_way0_28_24_hit;    
wire             ifdp_icache_way0_7_0_hit;      
wire             ifdp_icache_way1_15_8_hit;     
wire             ifdp_icache_way1_23_16_hit;    
wire             ifdp_icache_way1_28_24_hit;    
wire             ifdp_icache_way1_7_0_hit;      
wire    [127:0]  ifdp_inst_data0;               
wire    [127:0]  ifdp_inst_data1;               
wire    [31 :0]  ifdp_inst_precode0;            
wire    [31 :0]  ifdp_inst_precode1;            
wire             ifdp_ipctrl_expt_vld;          
wire             ifdp_ipctrl_tsize;             
wire    [1  :0]  ifdp_ipdp_btb_way0_pred;       
wire    [9  :0]  ifdp_ipdp_btb_way0_tag;        
wire    [19 :0]  ifdp_ipdp_btb_way0_target;     
wire             ifdp_ipdp_btb_way0_vld;        
wire    [1  :0]  ifdp_ipdp_btb_way1_pred;       
wire    [9  :0]  ifdp_ipdp_btb_way1_tag;        
wire    [19 :0]  ifdp_ipdp_btb_way1_target;     
wire             ifdp_ipdp_btb_way1_vld;        
wire    [1  :0]  ifdp_ipdp_btb_way2_pred;       
wire    [9  :0]  ifdp_ipdp_btb_way2_tag;        
wire    [19 :0]  ifdp_ipdp_btb_way2_target;     
wire             ifdp_ipdp_btb_way2_vld;        
wire    [1  :0]  ifdp_ipdp_btb_way3_pred;       
wire    [9  :0]  ifdp_ipdp_btb_way3_tag;        
wire    [19 :0]  ifdp_ipdp_btb_way3_target;     
wire             ifdp_ipdp_btb_way3_vld;        
wire             ifdp_ipdp_l0_btb_counter;      
wire    [15 :0]  ifdp_ipdp_l0_btb_entry_hit;    
wire             ifdp_ipdp_l0_btb_hit;          
wire    [38 :0]  ifdp_ipdp_l0_btb_mispred_pc;   
wire             ifdp_ipdp_l0_btb_ras;          
wire    [38 :0]  ifdp_ipdp_l0_btb_target;       
wire             ifdp_ipdp_l0_btb_way0_high_hit; 
wire             ifdp_ipdp_l0_btb_way0_low_hit; 
wire             ifdp_ipdp_l0_btb_way1_high_hit; 
wire             ifdp_ipdp_l0_btb_way1_low_hit; 
wire             ifdp_ipdp_l0_btb_way2_high_hit; 
wire             ifdp_ipdp_l0_btb_way2_low_hit; 
wire             ifdp_ipdp_l0_btb_way3_high_hit; 
wire             ifdp_ipdp_l0_btb_way3_low_hit; 
wire    [1  :0]  ifdp_ipdp_l0_btb_way_pred;     
wire             ifdp_spe_clk;                  
wire             ifdp_spe_clk_en;               
wire             ipctrl_ifdp_gateclk_en;        
wire    [7  :0]  ipctrl_ifdp_vpc_onehot_updt;   
wire             ipctrl_ifdp_w0_bry0_hit_updt;  
wire             ipctrl_ifdp_w0_bry1_hit_updt;  
wire    [7  :0]  ipctrl_ifdp_w0b0_br_ntake_updt; 
wire    [7  :0]  ipctrl_ifdp_w0b0_br_taken_updt; 
wire    [7  :0]  ipctrl_ifdp_w0b0_bry_updt_data; 
wire    [7  :0]  ipctrl_ifdp_w0b1_br_ntake_updt; 
wire    [7  :0]  ipctrl_ifdp_w0b1_br_taken_updt; 
wire    [7  :0]  ipctrl_ifdp_w0b1_bry_updt_data; 
wire             ipctrl_ifdp_w1_bry0_hit_updt;  
wire             ipctrl_ifdp_w1_bry1_hit_updt;  
wire    [7  :0]  ipctrl_ifdp_w1b0_br_ntake_updt; 
wire    [7  :0]  ipctrl_ifdp_w1b0_br_taken_updt; 
wire    [7  :0]  ipctrl_ifdp_w1b0_bry_updt_data; 
wire    [7  :0]  ipctrl_ifdp_w1b1_br_ntake_updt; 
wire    [7  :0]  ipctrl_ifdp_w1b1_br_taken_updt; 
wire    [7  :0]  ipctrl_ifdp_w1b1_bry_updt_data; 
wire    [38 :0]  l0_btb_ifdp_chgflw_pc;         
wire    [1  :0]  l0_btb_ifdp_chgflw_way_pred;   
wire             l0_btb_ifdp_counter;           
wire    [15 :0]  l0_btb_ifdp_entry_hit;         
wire             l0_btb_ifdp_hit;               
wire             l0_btb_ifdp_ras;               
wire             l1_refill_ifdp_acc_err;        
wire    [127:0]  l1_refill_ifdp_inst_data;      
wire    [31 :0]  l1_refill_ifdp_precode;        
wire             l1_refill_ifdp_refill_on;      
wire    [28 :0]  l1_refill_ifdp_tag_data;       
wire             mmu_ifu_buf;                   
wire             mmu_ifu_ca;                    
wire    [27 :0]  mmu_ifu_pa;                    
wire             mmu_ifu_pgflt;                 
wire             mmu_ifu_sec;                   
wire             mmu_xx_mmu_en;                 
wire             pad_yy_icg_scan_en;            
wire    [38 :0]  pcgen_ifdp_inc_pc;             
wire    [38 :0]  pcgen_ifdp_pc;                 
wire    [1  :0]  pcgen_ifdp_way_pred;           
wire             refill_tag_15_8_hit;           
wire             refill_tag_23_16_hit;          
wire             refill_tag_28_24_hit;          
wire             refill_tag_7_0_hit;            
wire             rtu_yy_xx_dbgon;               
wire    [2  :0]  sfp_ifdp_hit_pc_lo;            
wire    [3  :0]  sfp_ifdp_hit_type;             
wire             sfp_ifdp_pc_hit;               
wire    [7  :0]  w0_ab_br;                      
wire    [7  :0]  w0_br;                         
wire             w0_bry0_hit;                   
wire             w0_bry1_hit;                   
wire    [7  :0]  w0b0_br_ntake;                 
wire    [7  :0]  w0b0_br_taken;                 
wire    [7  :0]  w0b0_bry;                      
wire    [7  :0]  w0b0_bry_data;                 
wire    [7  :0]  w0b1_br_ntake;                 
wire    [7  :0]  w0b1_br_taken;                 
wire    [7  :0]  w0b1_bry;                      
wire    [7  :0]  w0b1_bry_data;                 
wire    [7  :0]  w1_ab_br;                      
wire    [7  :0]  w1_br;                         
wire             w1_bry0_hit;                   
wire             w1_bry1_hit;                   
wire    [7  :0]  w1b0_br_ntake;                 
wire    [7  :0]  w1b0_br_taken;                 
wire    [7  :0]  w1b0_bry;                      
wire    [7  :0]  w1b0_bry_data;                 
wire    [7  :0]  w1b1_br_ntake;                 
wire    [7  :0]  w1b1_br_taken;                 
wire    [7  :0]  w1b1_bry;                      
wire    [7  :0]  w1b1_bry_data;                 

// &Force("bus","btb_ifdp_way0_tag",9,0); @27
// &Force("bus","btb_ifdp_way1_tag",9,0); @28
// &Force("bus","btb_ifdp_way2_tag",9,0); @29
// &Force("bus","btb_ifdp_way3_tag",9,0); @30

parameter PC_WIDTH = 40;
// &Instance("gated_clk_cell","x_ifdp_clk"); @34
gated_clk_cell  x_ifdp_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ifdp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ifdp_clk_en       ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @35
//           .clk_out        (ifdp_clk),//Out Clock @36
//           .external_en    (1'b0), @37
//           .global_en      (cp0_yy_clk_en), @38
//           .local_en       (ifdp_clk_en),//Local Condition @39
//           .module_en      (cp0_ifu_icg_en) @40
//         ); @41
assign ifdp_clk_en = ipctrl_ifdp_gateclk_en;

//==========================================================
//              Instruction Data Related
//==========================================================
//IF Stage Inst May from three Source:
//  1.L1 ICache 
//  2.Prefetch Buffer
//  3.Off Chip Memory
//Way0 Data can be from cache or refill
assign ifdp_inst_data0[127:0] = (l1_refill_ifdp_refill_on)
                              ? l1_refill_ifdp_inst_data[127:0]
                              : icache_if_ifdp_inst_data0[127:0];

//Way1 Data can be only from cache
assign ifdp_inst_data1[127:0] = icache_if_ifdp_inst_data1[127:0];

//Way0 precode can be from cache or refill
assign ifdp_inst_precode0[31:0]  = (l1_refill_ifdp_refill_on)
                                 ? l1_refill_ifdp_precode[31:0]
                                 : icache_if_ifdp_precode0[31:0];

//Way1 precode can be only from cache
assign ifdp_inst_precode1[31:0]  = icache_if_ifdp_precode1[31:0];

//==========================================================
//                  Half Word Data
//==========================================================
//Way 1
assign half1_inst_high_way1[13:0] = ifdp_inst_data1[127:114];
assign half2_inst_high_way1[13:0] = ifdp_inst_data1[111: 98];
assign half3_inst_high_way1[13:0] = ifdp_inst_data1[ 95: 82];
assign half4_inst_high_way1[13:0] = ifdp_inst_data1[ 79: 66];
assign half5_inst_high_way1[13:0] = ifdp_inst_data1[ 63: 50];
assign half6_inst_high_way1[13:0] = ifdp_inst_data1[ 47: 34];
assign half7_inst_high_way1[13:0] = ifdp_inst_data1[ 31: 18];
assign half8_inst_high_way1[13:0] = ifdp_inst_data1[ 15:  2];

assign half1_inst_low_way1[1:0]   = ifdp_inst_data1[113:112];
assign half2_inst_low_way1[1:0]   = ifdp_inst_data1[ 97: 96];
assign half3_inst_low_way1[1:0]   = ifdp_inst_data1[ 81: 80];
assign half4_inst_low_way1[1:0]   = ifdp_inst_data1[ 65: 64];
assign half5_inst_low_way1[1:0]   = ifdp_inst_data1[ 49: 48];
assign half6_inst_low_way1[1:0]   = ifdp_inst_data1[ 33: 32];
assign half7_inst_low_way1[1:0]   = ifdp_inst_data1[ 17: 16];
assign half8_inst_low_way1[1:0]   = ifdp_inst_data1[  1:  0];

assign half1_precode_way1[3:0]   = ifdp_inst_precode1[31:28];
assign half2_precode_way1[3:0]   = ifdp_inst_precode1[27:24];
assign half3_precode_way1[3:0]   = ifdp_inst_precode1[23:20];
assign half4_precode_way1[3:0]   = ifdp_inst_precode1[19:16];
assign half5_precode_way1[3:0]   = ifdp_inst_precode1[15:12];
assign half6_precode_way1[3:0]   = ifdp_inst_precode1[11: 8];
assign half7_precode_way1[3:0]   = ifdp_inst_precode1[7 : 4];
assign half8_precode_way1[3:0]   = ifdp_inst_precode1[3 : 0];

//Way 0
assign half1_inst_high_way0[13:0] = ifdp_inst_data0[127:114];
assign half2_inst_high_way0[13:0] = ifdp_inst_data0[111: 98];
assign half3_inst_high_way0[13:0] = ifdp_inst_data0[ 95: 82];
assign half4_inst_high_way0[13:0] = ifdp_inst_data0[ 79: 66];
assign half5_inst_high_way0[13:0] = ifdp_inst_data0[ 63: 50];
assign half6_inst_high_way0[13:0] = ifdp_inst_data0[ 47: 34];
assign half7_inst_high_way0[13:0] = ifdp_inst_data0[ 31: 18];
assign half8_inst_high_way0[13:0] = ifdp_inst_data0[ 15:  2];

assign half1_inst_low_way0[1:0]   = ifdp_inst_data0[113:112];
assign half2_inst_low_way0[1:0]   = ifdp_inst_data0[ 97: 96];
assign half3_inst_low_way0[1:0]   = ifdp_inst_data0[ 81: 80];
assign half4_inst_low_way0[1:0]   = ifdp_inst_data0[ 65: 64];
assign half5_inst_low_way0[1:0]   = ifdp_inst_data0[ 49: 48];
assign half6_inst_low_way0[1:0]   = ifdp_inst_data0[ 33: 32];
assign half7_inst_low_way0[1:0]   = ifdp_inst_data0[ 17: 16];
assign half8_inst_low_way0[1:0]   = ifdp_inst_data0[  1:  0];

assign half1_precode_way0[3:0]   = ifdp_inst_precode0[31:28];
assign half2_precode_way0[3:0]   = ifdp_inst_precode0[27:24];
assign half3_precode_way0[3:0]   = ifdp_inst_precode0[23:20];
assign half4_precode_way0[3:0]   = ifdp_inst_precode0[19:16];
assign half5_precode_way0[3:0]   = ifdp_inst_precode0[15:12];
assign half6_precode_way0[3:0]   = ifdp_inst_precode0[11: 8];
assign half7_precode_way0[3:0]   = ifdp_inst_precode0[7 : 4];
assign half8_precode_way0[3:0]   = ifdp_inst_precode0[3 : 0];


//==========================================================
//                     ifdp to ipdp
//==========================================================
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ifdp_ipdp_h1_inst_high_way1[13:0]        <= 14'b0;
    ifdp_ipdp_h2_inst_high_way1[13:0]        <= 14'b0;
    ifdp_ipdp_h3_inst_high_way1[13:0]        <= 14'b0;
    ifdp_ipdp_h4_inst_high_way1[13:0]        <= 14'b0;
    ifdp_ipdp_h5_inst_high_way1[13:0]        <= 14'b0;
    ifdp_ipdp_h6_inst_high_way1[13:0]        <= 14'b0;
    ifdp_ipdp_h7_inst_high_way1[13:0]        <= 14'b0;
    ifdp_ipdp_h8_inst_high_way1[13:0]        <= 14'b0;

    ifdp_ipdp_h1_inst_low_way1[1:0]          <= 2'b0;
    ifdp_ipdp_h2_inst_low_way1[1:0]          <= 2'b0;
    ifdp_ipdp_h3_inst_low_way1[1:0]          <= 2'b0;
    ifdp_ipdp_h4_inst_low_way1[1:0]          <= 2'b0;
    ifdp_ipdp_h5_inst_low_way1[1:0]          <= 2'b0;
    ifdp_ipdp_h6_inst_low_way1[1:0]          <= 2'b0;
    ifdp_ipdp_h7_inst_low_way1[1:0]          <= 2'b0;
    ifdp_ipdp_h8_inst_low_way1[1:0]          <= 2'b0;

    ifdp_ipdp_h1_precode_way1[3:0]           <= 4'b0;
    ifdp_ipdp_h2_precode_way1[3:0]           <= 4'b0;
    ifdp_ipdp_h3_precode_way1[3:0]           <= 4'b0;
    ifdp_ipdp_h4_precode_way1[3:0]           <= 4'b0;
    ifdp_ipdp_h5_precode_way1[3:0]           <= 4'b0;
    ifdp_ipdp_h6_precode_way1[3:0]           <= 4'b0;
    ifdp_ipdp_h7_precode_way1[3:0]           <= 4'b0;
    ifdp_ipdp_h8_precode_way1[3:0]           <= 4'b0;

    ifdp_ipdp_h1_inst_high_way0[13:0]        <= 14'b0;
    ifdp_ipdp_h2_inst_high_way0[13:0]        <= 14'b0;
    ifdp_ipdp_h3_inst_high_way0[13:0]        <= 14'b0;
    ifdp_ipdp_h4_inst_high_way0[13:0]        <= 14'b0;
    ifdp_ipdp_h5_inst_high_way0[13:0]        <= 14'b0;
    ifdp_ipdp_h6_inst_high_way0[13:0]        <= 14'b0;
    ifdp_ipdp_h7_inst_high_way0[13:0]        <= 14'b0;
    ifdp_ipdp_h8_inst_high_way0[13:0]        <= 14'b0;

    ifdp_ipdp_h1_inst_low_way0[1:0]          <= 2'b0;
    ifdp_ipdp_h2_inst_low_way0[1:0]          <= 2'b0;
    ifdp_ipdp_h3_inst_low_way0[1:0]          <= 2'b0;
    ifdp_ipdp_h4_inst_low_way0[1:0]          <= 2'b0;
    ifdp_ipdp_h5_inst_low_way0[1:0]          <= 2'b0;
    ifdp_ipdp_h6_inst_low_way0[1:0]          <= 2'b0;
    ifdp_ipdp_h7_inst_low_way0[1:0]          <= 2'b0;
    ifdp_ipdp_h8_inst_low_way0[1:0]          <= 2'b0;

    ifdp_ipdp_h1_precode_way0[3:0]           <= 4'b0;
    ifdp_ipdp_h2_precode_way0[3:0]           <= 4'b0;
    ifdp_ipdp_h3_precode_way0[3:0]           <= 4'b0;
    ifdp_ipdp_h4_precode_way0[3:0]           <= 4'b0;
    ifdp_ipdp_h5_precode_way0[3:0]           <= 4'b0;
    ifdp_ipdp_h6_precode_way0[3:0]           <= 4'b0;
    ifdp_ipdp_h7_precode_way0[3:0]           <= 4'b0;
    ifdp_ipdp_h8_precode_way0[3:0]           <= 4'b0;
  end
  else if(ifctrl_ifdp_pipedown)
  begin
    ifdp_ipdp_h1_inst_high_way1[13:0]        <= half1_inst_high_way1[13:0];
    ifdp_ipdp_h2_inst_high_way1[13:0]        <= half2_inst_high_way1[13:0];
    ifdp_ipdp_h3_inst_high_way1[13:0]        <= half3_inst_high_way1[13:0];
    ifdp_ipdp_h4_inst_high_way1[13:0]        <= half4_inst_high_way1[13:0];
    ifdp_ipdp_h5_inst_high_way1[13:0]        <= half5_inst_high_way1[13:0];
    ifdp_ipdp_h6_inst_high_way1[13:0]        <= half6_inst_high_way1[13:0];
    ifdp_ipdp_h7_inst_high_way1[13:0]        <= half7_inst_high_way1[13:0];
    ifdp_ipdp_h8_inst_high_way1[13:0]        <= half8_inst_high_way1[13:0];

    ifdp_ipdp_h1_inst_low_way1[1:0]          <= half1_inst_low_way1[1:0];
    ifdp_ipdp_h2_inst_low_way1[1:0]          <= half2_inst_low_way1[1:0];
    ifdp_ipdp_h3_inst_low_way1[1:0]          <= half3_inst_low_way1[1:0];
    ifdp_ipdp_h4_inst_low_way1[1:0]          <= half4_inst_low_way1[1:0];
    ifdp_ipdp_h5_inst_low_way1[1:0]          <= half5_inst_low_way1[1:0];
    ifdp_ipdp_h6_inst_low_way1[1:0]          <= half6_inst_low_way1[1:0];
    ifdp_ipdp_h7_inst_low_way1[1:0]          <= half7_inst_low_way1[1:0];
    ifdp_ipdp_h8_inst_low_way1[1:0]          <= half8_inst_low_way1[1:0];

    ifdp_ipdp_h1_precode_way1[3:0]           <= half1_precode_way1[3:0];
    ifdp_ipdp_h2_precode_way1[3:0]           <= half2_precode_way1[3:0];
    ifdp_ipdp_h3_precode_way1[3:0]           <= half3_precode_way1[3:0];
    ifdp_ipdp_h4_precode_way1[3:0]           <= half4_precode_way1[3:0];
    ifdp_ipdp_h5_precode_way1[3:0]           <= half5_precode_way1[3:0];
    ifdp_ipdp_h6_precode_way1[3:0]           <= half6_precode_way1[3:0];
    ifdp_ipdp_h7_precode_way1[3:0]           <= half7_precode_way1[3:0];
    ifdp_ipdp_h8_precode_way1[3:0]           <= half8_precode_way1[3:0];

    ifdp_ipdp_h1_inst_high_way0[13:0]        <= half1_inst_high_way0[13:0];
    ifdp_ipdp_h2_inst_high_way0[13:0]        <= half2_inst_high_way0[13:0];
    ifdp_ipdp_h3_inst_high_way0[13:0]        <= half3_inst_high_way0[13:0];
    ifdp_ipdp_h4_inst_high_way0[13:0]        <= half4_inst_high_way0[13:0];
    ifdp_ipdp_h5_inst_high_way0[13:0]        <= half5_inst_high_way0[13:0];
    ifdp_ipdp_h6_inst_high_way0[13:0]        <= half6_inst_high_way0[13:0];
    ifdp_ipdp_h7_inst_high_way0[13:0]        <= half7_inst_high_way0[13:0];
    ifdp_ipdp_h8_inst_high_way0[13:0]        <= half8_inst_high_way0[13:0];

    ifdp_ipdp_h1_inst_low_way0[1:0]          <= half1_inst_low_way0[1:0];
    ifdp_ipdp_h2_inst_low_way0[1:0]          <= half2_inst_low_way0[1:0];
    ifdp_ipdp_h3_inst_low_way0[1:0]          <= half3_inst_low_way0[1:0];
    ifdp_ipdp_h4_inst_low_way0[1:0]          <= half4_inst_low_way0[1:0];
    ifdp_ipdp_h5_inst_low_way0[1:0]          <= half5_inst_low_way0[1:0];
    ifdp_ipdp_h6_inst_low_way0[1:0]          <= half6_inst_low_way0[1:0];
    ifdp_ipdp_h7_inst_low_way0[1:0]          <= half7_inst_low_way0[1:0];
    ifdp_ipdp_h8_inst_low_way0[1:0]          <= half8_inst_low_way0[1:0];

    ifdp_ipdp_h1_precode_way0[3:0]           <= half1_precode_way0[3:0];
    ifdp_ipdp_h2_precode_way0[3:0]           <= half2_precode_way0[3:0];
    ifdp_ipdp_h3_precode_way0[3:0]           <= half3_precode_way0[3:0];
    ifdp_ipdp_h4_precode_way0[3:0]           <= half4_precode_way0[3:0];
    ifdp_ipdp_h5_precode_way0[3:0]           <= half5_precode_way0[3:0];
    ifdp_ipdp_h6_precode_way0[3:0]           <= half6_precode_way0[3:0];
    ifdp_ipdp_h7_precode_way0[3:0]           <= half7_precode_way0[3:0];
    ifdp_ipdp_h8_precode_way0[3:0]           <= half8_precode_way0[3:0];
  end
  else
  begin
    ifdp_ipdp_h1_inst_high_way1[13:0]        <= ifdp_ipdp_h1_inst_high_way1[13:0];
    ifdp_ipdp_h2_inst_high_way1[13:0]        <= ifdp_ipdp_h2_inst_high_way1[13:0];
    ifdp_ipdp_h3_inst_high_way1[13:0]        <= ifdp_ipdp_h3_inst_high_way1[13:0];
    ifdp_ipdp_h4_inst_high_way1[13:0]        <= ifdp_ipdp_h4_inst_high_way1[13:0];
    ifdp_ipdp_h5_inst_high_way1[13:0]        <= ifdp_ipdp_h5_inst_high_way1[13:0];
    ifdp_ipdp_h6_inst_high_way1[13:0]        <= ifdp_ipdp_h6_inst_high_way1[13:0];
    ifdp_ipdp_h7_inst_high_way1[13:0]        <= ifdp_ipdp_h7_inst_high_way1[13:0];
    ifdp_ipdp_h8_inst_high_way1[13:0]        <= ifdp_ipdp_h8_inst_high_way1[13:0];

    ifdp_ipdp_h1_inst_low_way1[1:0]          <= ifdp_ipdp_h1_inst_low_way1[1:0];
    ifdp_ipdp_h2_inst_low_way1[1:0]          <= ifdp_ipdp_h2_inst_low_way1[1:0];
    ifdp_ipdp_h3_inst_low_way1[1:0]          <= ifdp_ipdp_h3_inst_low_way1[1:0];
    ifdp_ipdp_h4_inst_low_way1[1:0]          <= ifdp_ipdp_h4_inst_low_way1[1:0];
    ifdp_ipdp_h5_inst_low_way1[1:0]          <= ifdp_ipdp_h5_inst_low_way1[1:0];
    ifdp_ipdp_h6_inst_low_way1[1:0]          <= ifdp_ipdp_h6_inst_low_way1[1:0];
    ifdp_ipdp_h7_inst_low_way1[1:0]          <= ifdp_ipdp_h7_inst_low_way1[1:0];
    ifdp_ipdp_h8_inst_low_way1[1:0]          <= ifdp_ipdp_h8_inst_low_way1[1:0];

    ifdp_ipdp_h1_precode_way1[3:0]           <= ifdp_ipdp_h1_precode_way1[3:0];
    ifdp_ipdp_h2_precode_way1[3:0]           <= ifdp_ipdp_h2_precode_way1[3:0];
    ifdp_ipdp_h3_precode_way1[3:0]           <= ifdp_ipdp_h3_precode_way1[3:0];
    ifdp_ipdp_h4_precode_way1[3:0]           <= ifdp_ipdp_h4_precode_way1[3:0];
    ifdp_ipdp_h5_precode_way1[3:0]           <= ifdp_ipdp_h5_precode_way1[3:0];
    ifdp_ipdp_h6_precode_way1[3:0]           <= ifdp_ipdp_h6_precode_way1[3:0];
    ifdp_ipdp_h7_precode_way1[3:0]           <= ifdp_ipdp_h7_precode_way1[3:0];
    ifdp_ipdp_h8_precode_way1[3:0]           <= ifdp_ipdp_h8_precode_way1[3:0];

    ifdp_ipdp_h1_inst_high_way0[13:0]        <= ifdp_ipdp_h1_inst_high_way0[13:0];
    ifdp_ipdp_h2_inst_high_way0[13:0]        <= ifdp_ipdp_h2_inst_high_way0[13:0];
    ifdp_ipdp_h3_inst_high_way0[13:0]        <= ifdp_ipdp_h3_inst_high_way0[13:0];
    ifdp_ipdp_h4_inst_high_way0[13:0]        <= ifdp_ipdp_h4_inst_high_way0[13:0];
    ifdp_ipdp_h5_inst_high_way0[13:0]        <= ifdp_ipdp_h5_inst_high_way0[13:0];
    ifdp_ipdp_h6_inst_high_way0[13:0]        <= ifdp_ipdp_h6_inst_high_way0[13:0];
    ifdp_ipdp_h7_inst_high_way0[13:0]        <= ifdp_ipdp_h7_inst_high_way0[13:0];
    ifdp_ipdp_h8_inst_high_way0[13:0]        <= ifdp_ipdp_h8_inst_high_way0[13:0];

    ifdp_ipdp_h1_inst_low_way0[1:0]          <= ifdp_ipdp_h1_inst_low_way0[1:0];
    ifdp_ipdp_h2_inst_low_way0[1:0]          <= ifdp_ipdp_h2_inst_low_way0[1:0];
    ifdp_ipdp_h3_inst_low_way0[1:0]          <= ifdp_ipdp_h3_inst_low_way0[1:0];
    ifdp_ipdp_h4_inst_low_way0[1:0]          <= ifdp_ipdp_h4_inst_low_way0[1:0];
    ifdp_ipdp_h5_inst_low_way0[1:0]          <= ifdp_ipdp_h5_inst_low_way0[1:0];
    ifdp_ipdp_h6_inst_low_way0[1:0]          <= ifdp_ipdp_h6_inst_low_way0[1:0];
    ifdp_ipdp_h7_inst_low_way0[1:0]          <= ifdp_ipdp_h7_inst_low_way0[1:0];
    ifdp_ipdp_h8_inst_low_way0[1:0]          <= ifdp_ipdp_h8_inst_low_way0[1:0];

    ifdp_ipdp_h1_precode_way0[3:0]           <= ifdp_ipdp_h1_precode_way0[3:0];
    ifdp_ipdp_h2_precode_way0[3:0]           <= ifdp_ipdp_h2_precode_way0[3:0];
    ifdp_ipdp_h3_precode_way0[3:0]           <= ifdp_ipdp_h3_precode_way0[3:0];
    ifdp_ipdp_h4_precode_way0[3:0]           <= ifdp_ipdp_h4_precode_way0[3:0];
    ifdp_ipdp_h5_precode_way0[3:0]           <= ifdp_ipdp_h5_precode_way0[3:0];
    ifdp_ipdp_h6_precode_way0[3:0]           <= ifdp_ipdp_h6_precode_way0[3:0];
    ifdp_ipdp_h7_precode_way0[3:0]           <= ifdp_ipdp_h7_precode_way0[3:0];
    ifdp_ipdp_h8_precode_way0[3:0]           <= ifdp_ipdp_h8_precode_way0[3:0];
  end    
end


// &Force("output","ifdp_ipdp_h1_inst_high_way1"); @319
// &Force("output","ifdp_ipdp_h2_inst_high_way1"); @320
// &Force("output","ifdp_ipdp_h3_inst_high_way1"); @321
// &Force("output","ifdp_ipdp_h4_inst_high_way1"); @322
// &Force("output","ifdp_ipdp_h5_inst_high_way1"); @323
// &Force("output","ifdp_ipdp_h6_inst_high_way1"); @324
// &Force("output","ifdp_ipdp_h7_inst_high_way1"); @325
// &Force("output","ifdp_ipdp_h8_inst_high_way1"); @326

// &Force("output","ifdp_ipdp_h1_inst_low_way1"); @328
// &Force("output","ifdp_ipdp_h2_inst_low_way1"); @329
// &Force("output","ifdp_ipdp_h3_inst_low_way1"); @330
// &Force("output","ifdp_ipdp_h4_inst_low_way1"); @331
// &Force("output","ifdp_ipdp_h5_inst_low_way1"); @332
// &Force("output","ifdp_ipdp_h6_inst_low_way1"); @333
// &Force("output","ifdp_ipdp_h7_inst_low_way1"); @334
// &Force("output","ifdp_ipdp_h8_inst_low_way1"); @335

// &Force("output","ifdp_ipdp_h1_precode_way1");   @337
// &Force("output","ifdp_ipdp_h2_precode_way1");   @338
// &Force("output","ifdp_ipdp_h3_precode_way1");   @339
// &Force("output","ifdp_ipdp_h4_precode_way1");   @340
// &Force("output","ifdp_ipdp_h5_precode_way1");   @341
// &Force("output","ifdp_ipdp_h6_precode_way1");   @342
// &Force("output","ifdp_ipdp_h7_precode_way1");   @343
// &Force("output","ifdp_ipdp_h8_precode_way1");   @344

// &Force("output","ifdp_ipdp_h1_inst_high_way0"); @346
// &Force("output","ifdp_ipdp_h2_inst_high_way0"); @347
// &Force("output","ifdp_ipdp_h3_inst_high_way0"); @348
// &Force("output","ifdp_ipdp_h4_inst_high_way0"); @349
// &Force("output","ifdp_ipdp_h5_inst_high_way0"); @350
// &Force("output","ifdp_ipdp_h6_inst_high_way0"); @351
// &Force("output","ifdp_ipdp_h7_inst_high_way0"); @352
// &Force("output","ifdp_ipdp_h8_inst_high_way0"); @353

// &Force("output","ifdp_ipdp_h1_inst_low_way0"); @355
// &Force("output","ifdp_ipdp_h2_inst_low_way0"); @356
// &Force("output","ifdp_ipdp_h3_inst_low_way0"); @357
// &Force("output","ifdp_ipdp_h4_inst_low_way0"); @358
// &Force("output","ifdp_ipdp_h5_inst_low_way0"); @359
// &Force("output","ifdp_ipdp_h6_inst_low_way0"); @360
// &Force("output","ifdp_ipdp_h7_inst_low_way0"); @361
// &Force("output","ifdp_ipdp_h8_inst_low_way0"); @362

// &Force("output","ifdp_ipdp_h1_precode_way0");   @364
// &Force("output","ifdp_ipdp_h2_precode_way0");   @365
// &Force("output","ifdp_ipdp_h3_precode_way0");   @366
// &Force("output","ifdp_ipdp_h4_precode_way0");   @367
// &Force("output","ifdp_ipdp_h5_precode_way0");   @368
// &Force("output","ifdp_ipdp_h6_precode_way0");   @369
// &Force("output","ifdp_ipdp_h7_precode_way0");   @370
// &Force("output","ifdp_ipdp_h8_precode_way0"); @371

// &Instance("gated_clk_cell","x_parity_check_clk"); @374
// &Connect( .clk_in         (forever_cpuclk), @375
//           .clk_out        (parity_check_clk),//Out Clock @376
//           .external_en    (1'b0), @377
//           .global_en      (cp0_yy_clk_en), @378
//           .local_en       (parity_check_clk_en),//Local Condition @379
//           .module_en      (cp0_ifu_icg_en) @380
//         ); @381
// &Force("output","ifdp_ipdp_inst_parity1"); @409
// &Force("output","ifdp_ipdp_precode_parity1"); @410
// &Force("output","ifdp_ipdp_inst_parity0"); @411
// &Force("output","ifdp_ipdp_precode_parity0"); @412

//==========================================================
//             Way Predict Infor Pipedown
//==========================================================
//Way predict Infor Pipedown for IP Stage Data Valid
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipctrl_way_pred[1:0] <= 2'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipctrl_way_pred[1:0] <= pcgen_ifdp_way_pred[1:0];
  else
    ifdp_ipctrl_way_pred[1:0] <= ifdp_ipctrl_way_pred[1:0];
end
// &Force("output", "ifdp_ipctrl_way_pred"); @428

//==========================================================
//             Refill on State Pipedown
//==========================================================
//Refill Infor Pipedown for IP Stage Data Valid
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipctrl_refill_on <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipctrl_refill_on <= l1_refill_ifdp_refill_on;
  else
    ifdp_ipctrl_refill_on <= ifdp_ipctrl_refill_on;
end
// &Force("output", "ifdp_ipctrl_refill_on"); @443
//==========================================================
//                  Tag Data Related
//==========================================================
//Tag[28] is the Valid Bit
//Tag[27:0] is Physical Tag(VIPT)
//For Timing consider, Tag compare split to four part
//Way0 Data can be from cache or refill
assign ifdp_icache_way0_28_24_hit = (l1_refill_ifdp_refill_on)
                                  ? refill_tag_28_24_hit
                                  : cp0_ifu_icache_en_flop && 
                                    icache_tag_way0_28_24_hit;
assign refill_tag_28_24_hit       = (l1_refill_ifdp_tag_data[28:24]  == {1'b1,mmu_ifu_pa[27:24]});
assign icache_tag_way0_28_24_hit  = (icache_if_ifdp_tag_data0[28:24] == {1'b1,mmu_ifu_pa[27:24]});
//Way1 Data can be only from cache
assign ifdp_icache_way1_28_24_hit = (l1_refill_ifdp_refill_on)
                                  ? 1'b0
                                  : cp0_ifu_icache_en_flop && 
                                    icache_tag_way1_28_24_hit;
assign icache_tag_way1_28_24_hit  = (icache_if_ifdp_tag_data1[28:24] == {1'b1,mmu_ifu_pa[27:24]});

//Way0 Data can be from cache or refill
assign ifdp_icache_way0_23_16_hit = (l1_refill_ifdp_refill_on)
                                  ? refill_tag_23_16_hit
                                  : icache_tag_way0_23_16_hit;
assign refill_tag_23_16_hit       = (l1_refill_ifdp_tag_data[23:16]  == mmu_ifu_pa[23:16]);
assign icache_tag_way0_23_16_hit  = (icache_if_ifdp_tag_data0[23:16] == mmu_ifu_pa[23:16]);
//Way1 Data can be only from cache
assign ifdp_icache_way1_23_16_hit = (l1_refill_ifdp_refill_on)
                                  ? 1'b0
                                  : icache_tag_way1_23_16_hit;
assign icache_tag_way1_23_16_hit  = (icache_if_ifdp_tag_data1[23:16] == mmu_ifu_pa[23:16]);

//Way0 Data can be from cache or refill
assign ifdp_icache_way0_15_8_hit = (l1_refill_ifdp_refill_on)
                                 ? refill_tag_15_8_hit
                                 : icache_tag_way0_15_8_hit;
assign refill_tag_15_8_hit       = (l1_refill_ifdp_tag_data[15:8]  == mmu_ifu_pa[15:8]);
assign icache_tag_way0_15_8_hit  = (icache_if_ifdp_tag_data0[15:8] == mmu_ifu_pa[15:8]);
//Way1 Data can be only from cache
assign ifdp_icache_way1_15_8_hit = (l1_refill_ifdp_refill_on)
                                  ? 1'b0
                                  : icache_tag_way1_15_8_hit;
assign icache_tag_way1_15_8_hit  = (icache_if_ifdp_tag_data1[15:8] == mmu_ifu_pa[15:8]);


assign ifdp_icache_way0_7_0_hit  = (l1_refill_ifdp_refill_on)
                                 ? refill_tag_7_0_hit
                                 : icache_tag_way0_7_0_hit;
assign refill_tag_7_0_hit        = (l1_refill_ifdp_tag_data[7:0]  == mmu_ifu_pa[7:0]);
assign icache_tag_way0_7_0_hit   = (icache_if_ifdp_tag_data0[7:0] == mmu_ifu_pa[7:0]);
//Way1 Data can be only from cache
assign ifdp_icache_way1_7_0_hit  = (l1_refill_ifdp_refill_on)
                                 ? 1'b0
                                 : icache_tag_way1_7_0_hit;
assign icache_tag_way1_7_0_hit   = (icache_if_ifdp_tag_data1[7:0] == mmu_ifu_pa[7:0]);


//fifo bit
assign ifdp_fifo_bit             = icache_if_ifdp_fifo;



//Gate Clk                    
// &Instance("gated_clk_cell","x_icache_flop_clk"); @531
gated_clk_cell  x_icache_flop_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icache_flop_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (icache_flop_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @532
//           .clk_out        (icache_flop_clk),//Out Clock @533
//           .external_en    (1'b0), @534
//           .global_en      (cp0_yy_clk_en), @535
//           .local_en       (icache_flop_clk_en),//Local Condition @536
//           .module_en      (cp0_ifu_icg_en) @537
//         ); @538
assign icache_flop_clk_en = cp0_ifu_icache_en ^ 
                            cp0_ifu_icache_en_flop; 
//record icache state and flop it 
//Because icache is read in pcgen while use in if stage
always @(posedge icache_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cp0_ifu_icache_en_flop <= 1'b0;
  else if(!ifctrl_ifdp_stall || ifctrl_ifdp_cancel)
    cp0_ifu_icache_en_flop <= cp0_ifu_icache_en;
  else
    cp0_ifu_icache_en_flop <= cp0_ifu_icache_en_flop;
end

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ifdp_ipctrl_way0_28_24_hit <= 1'b0;
    ifdp_ipctrl_way0_23_16_hit <= 1'b0;
    ifdp_ipctrl_way0_15_8_hit  <= 1'b0;
    ifdp_ipctrl_way0_7_0_hit   <= 1'b0;
    ifdp_ipctrl_way1_28_24_hit <= 1'b0;
    ifdp_ipctrl_way1_23_16_hit <= 1'b0;
    ifdp_ipctrl_way1_15_8_hit  <= 1'b0;
    ifdp_ipctrl_way1_7_0_hit   <= 1'b0;
  end
  else if(ifctrl_ifdp_pipedown) begin
    ifdp_ipctrl_way0_28_24_hit <= ifdp_icache_way0_28_24_hit;
    ifdp_ipctrl_way0_23_16_hit <= ifdp_icache_way0_23_16_hit;
    ifdp_ipctrl_way0_15_8_hit  <= ifdp_icache_way0_15_8_hit;
    ifdp_ipctrl_way0_7_0_hit   <= ifdp_icache_way0_7_0_hit;
    ifdp_ipctrl_way1_28_24_hit <= ifdp_icache_way1_28_24_hit;
    ifdp_ipctrl_way1_23_16_hit <= ifdp_icache_way1_23_16_hit;
    ifdp_ipctrl_way1_15_8_hit  <= ifdp_icache_way1_15_8_hit;
    ifdp_ipctrl_way1_7_0_hit   <= ifdp_icache_way1_7_0_hit;
  end
  else begin
    ifdp_ipctrl_way0_28_24_hit <= ifdp_ipctrl_way0_28_24_hit;
    ifdp_ipctrl_way0_23_16_hit <= ifdp_ipctrl_way0_23_16_hit;
    ifdp_ipctrl_way0_15_8_hit  <= ifdp_ipctrl_way0_15_8_hit;
    ifdp_ipctrl_way0_7_0_hit   <= ifdp_ipctrl_way0_7_0_hit;
    ifdp_ipctrl_way1_28_24_hit <= ifdp_ipctrl_way1_28_24_hit;
    ifdp_ipctrl_way1_23_16_hit <= ifdp_ipctrl_way1_23_16_hit;
    ifdp_ipctrl_way1_15_8_hit  <= ifdp_ipctrl_way1_15_8_hit;
    ifdp_ipctrl_way1_7_0_hit   <= ifdp_ipctrl_way1_7_0_hit;
  end
end
// &Force("output", "ifdp_ipctrl_way0_28_24_hit"); @586
// &Force("output", "ifdp_ipctrl_way0_23_16_hit"); @587
// &Force("output", "ifdp_ipctrl_way0_15_8_hit"); @588
// &Force("output", "ifdp_ipctrl_way0_7_0_hit"); @589
// &Force("output", "ifdp_ipctrl_way1_28_24_hit"); @590
// &Force("output", "ifdp_ipctrl_way1_23_16_hit"); @591
// &Force("output", "ifdp_ipctrl_way1_15_8_hit"); @592
// &Force("output", "ifdp_ipctrl_way1_7_0_hit"); @593

//way 0 fanout is too big, it will insert buffer,which
//will have side effect on timing,so we will duplicate it 
//for timing critical path use
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ifdp_ipctrl_way0_28_24_hit_dup <= 1'b0;
    ifdp_ipctrl_way0_23_16_hit_dup <= 1'b0;
    ifdp_ipctrl_way0_15_8_hit_dup  <= 1'b0;
    ifdp_ipctrl_way0_7_0_hit_dup   <= 1'b0;
  end
  else if(ifctrl_ifdp_pipedown) begin
    ifdp_ipctrl_way0_28_24_hit_dup <= ifdp_icache_way0_28_24_hit;
    ifdp_ipctrl_way0_23_16_hit_dup <= ifdp_icache_way0_23_16_hit;
    ifdp_ipctrl_way0_15_8_hit_dup  <= ifdp_icache_way0_15_8_hit;
    ifdp_ipctrl_way0_7_0_hit_dup   <= ifdp_icache_way0_7_0_hit;
  end
  else begin
    ifdp_ipctrl_way0_28_24_hit_dup <= ifdp_ipctrl_way0_28_24_hit_dup;
    ifdp_ipctrl_way0_23_16_hit_dup <= ifdp_ipctrl_way0_23_16_hit_dup;
    ifdp_ipctrl_way0_15_8_hit_dup  <= ifdp_ipctrl_way0_15_8_hit_dup;
    ifdp_ipctrl_way0_7_0_hit_dup   <= ifdp_ipctrl_way0_7_0_hit_dup;
  end
end
// &Force("output", "ifdp_ipctrl_way0_28_24_hit_dup"); @619
// &Force("output", "ifdp_ipctrl_way0_23_16_hit_dup"); @620
// &Force("output", "ifdp_ipctrl_way0_15_8_hit_dup"); @621
// &Force("output", "ifdp_ipctrl_way0_7_0_hit_dup"); @622

// &Force("output", "ifdp_ipctrl_way0_29_24_parity"); @658
// &Force("output", "ifdp_ipctrl_way0_23_16_parity"); @659
// &Force("output", "ifdp_ipctrl_way0_15_8_parity"); @660
// &Force("output", "ifdp_ipctrl_way0_7_0_parity"); @661
// &Force("output", "ifdp_ipctrl_way1_29_24_parity"); @662
// &Force("output", "ifdp_ipctrl_way1_23_16_parity"); @663
// &Force("output", "ifdp_ipctrl_way1_15_8_parity"); @664
// &Force("output", "ifdp_ipctrl_way1_7_0_parity"); @665

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipctrl_fifo <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipctrl_fifo <= ifdp_fifo_bit;
  else
    ifdp_ipctrl_fifo <= ifdp_ipctrl_fifo;
end
// &Force("output", "ifdp_ipctrl_fifo"); @678

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_l1_refill_fifo <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_l1_refill_fifo <= ifdp_fifo_bit;
  else
    ifdp_l1_refill_fifo <= ifdp_l1_refill_fifo;
end
// &Force("output", "ifdp_l1_refill_fifo"); @690

//==========================================================
//                      PC Related
//==========================================================
//Virtual PC
// &CombBeg; @696
always @( pcgen_ifdp_pc[2:0])
begin
case(pcgen_ifdp_pc[2:0])
  3'b000  : if_vpc_2_0_onehot[7:0] = 8'b10000000;
  3'b001  : if_vpc_2_0_onehot[7:0] = 8'b01000000;
  3'b010  : if_vpc_2_0_onehot[7:0] = 8'b00100000;
  3'b011  : if_vpc_2_0_onehot[7:0] = 8'b00010000;
  3'b100  : if_vpc_2_0_onehot[7:0] = 8'b00001000;
  3'b101  : if_vpc_2_0_onehot[7:0] = 8'b00000100;
  3'b110  : if_vpc_2_0_onehot[7:0] = 8'b00000010;
  3'b111  : if_vpc_2_0_onehot[7:0] = 8'b00000001;
  default : if_vpc_2_0_onehot[7:0] = 8'b00000000;
endcase
// &CombEnd; @708
end

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipctrl_vpc_2_0_onehot[7:0] <= 8'b0;
  else if(rtu_yy_xx_dbgon)
    ifdp_ipctrl_vpc_2_0_onehot[7:0] <= 8'b10000000;
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipctrl_vpc_2_0_onehot[7:0] <= if_vpc_2_0_onehot[7:0];
  else
    ifdp_ipctrl_vpc_2_0_onehot[7:0] <= ipctrl_ifdp_vpc_onehot_updt[7:0];
end
// &Force("output", "ifdp_ipctrl_vpc_2_0_onehot"); @721

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipdp_vpc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipdp_vpc[PC_WIDTH-2:0] <= pcgen_ifdp_pc[PC_WIDTH-2:0];
  else
    ifdp_ipdp_vpc[PC_WIDTH-2:0] <= ifdp_ipdp_vpc[PC_WIDTH-2:0];
end
// &Force("output", "ifdp_ipdp_vpc"); @732
//assign ifdp_l1_refill_vpc[PC_WIDTH-2:0] = ifdp_ipdp_vpc[PC_WIDTH-2:0];

//Physical PC
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipctrl_pa[27:0] <= 28'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipctrl_pa[27:0] <= mmu_ifu_pa[27:0];
  else
    ifdp_ipctrl_pa[27:0] <= ifdp_ipctrl_pa[27:0];
end
// &Force("output", "ifdp_ipctrl_pa"); @745

//===========ifdp_ipctrl predecode information==============
assign w1b0_bry[7:0]             = {ifdp_inst_precode1[28],
                                    ifdp_inst_precode1[24],
                                    ifdp_inst_precode1[20],
                                    ifdp_inst_precode1[16],
                                    ifdp_inst_precode1[12],
                                    ifdp_inst_precode1[ 8],
                                    ifdp_inst_precode1[ 4],
                                    ifdp_inst_precode1[ 0]};
assign w1b1_bry[7:0]             = {ifdp_inst_precode1[29],
                                    ifdp_inst_precode1[25],
                                    ifdp_inst_precode1[21],
                                    ifdp_inst_precode1[17],
                                    ifdp_inst_precode1[13],
                                    ifdp_inst_precode1[ 9],
                                    ifdp_inst_precode1[ 5],
                                    ifdp_inst_precode1[ 1]};
assign w1_br[7:0]                = {ifdp_inst_precode1[30],
                                    ifdp_inst_precode1[26],
                                    ifdp_inst_precode1[22],
                                    ifdp_inst_precode1[18],
                                    ifdp_inst_precode1[14],
                                    ifdp_inst_precode1[10],
                                    ifdp_inst_precode1[ 6],
                                    ifdp_inst_precode1[ 2]};
assign w1_ab_br[7:0]             = {ifdp_inst_precode1[31],
                                    ifdp_inst_precode1[27],
                                    ifdp_inst_precode1[23],
                                    ifdp_inst_precode1[19],
                                    ifdp_inst_precode1[15],
                                    ifdp_inst_precode1[11],
                                    ifdp_inst_precode1[ 7],
                                    ifdp_inst_precode1[ 3]};
assign w0b0_bry[7:0]             = {ifdp_inst_precode0[28],
                                    ifdp_inst_precode0[24],
                                    ifdp_inst_precode0[20],
                                    ifdp_inst_precode0[16],
                                    ifdp_inst_precode0[12],
                                    ifdp_inst_precode0[ 8],
                                    ifdp_inst_precode0[ 4],
                                    ifdp_inst_precode0[ 0]};
assign w0b1_bry[7:0]             = {ifdp_inst_precode0[29],
                                    ifdp_inst_precode0[25],
                                    ifdp_inst_precode0[21],
                                    ifdp_inst_precode0[17],
                                    ifdp_inst_precode0[13],
                                    ifdp_inst_precode0[ 9],
                                    ifdp_inst_precode0[ 5],
                                    ifdp_inst_precode0[ 1]};
assign w0_br[7:0]                = {ifdp_inst_precode0[30],
                                    ifdp_inst_precode0[26],
                                    ifdp_inst_precode0[22],
                                    ifdp_inst_precode0[18],
                                    ifdp_inst_precode0[14],
                                    ifdp_inst_precode0[10],
                                    ifdp_inst_precode0[ 6],
                                    ifdp_inst_precode0[ 2]};
assign w0_ab_br[7:0]             = {ifdp_inst_precode0[31],
                                    ifdp_inst_precode0[27],
                                    ifdp_inst_precode0[23],
                                    ifdp_inst_precode0[19],
                                    ifdp_inst_precode0[15],
                                    ifdp_inst_precode0[11],
                                    ifdp_inst_precode0[ 7],
                                    ifdp_inst_precode0[ 3]};

//bry data
assign w0b0_bry_data[7:0] =  w0b0_bry[7:0] & vpc_bry_mask[7:0];
assign w0b1_bry_data[7:0] =  w0b1_bry[7:0] & vpc_bry_mask[7:0];
assign w1b0_bry_data[7:0] =  w1b0_bry[7:0] & vpc_bry_mask[7:0];
assign w1b1_bry_data[7:0] =  w1b1_bry[7:0] & vpc_bry_mask[7:0];

//bry hit signal
assign w0_bry1_hit = |(w0b1_bry[7:0] & if_vpc_2_0_onehot[7:0]);
assign w1_bry1_hit = |(w1b1_bry[7:0] & if_vpc_2_0_onehot[7:0]);
assign w0_bry0_hit = |(w0b0_bry[7:0] & if_vpc_2_0_onehot[7:0]);
assign w1_bry0_hit = |(w1b0_bry[7:0] & if_vpc_2_0_onehot[7:0]);

//bry masked predecode information
assign w0b0_br_taken[7:0] = w0_br[7:0] & vpc_bry_mask[7:0] & w0b0_bry[7:0];
assign w0b1_br_taken[7:0] = w0_br[7:0] & vpc_bry_mask[7:0] & w0b1_bry[7:0];
assign w1b0_br_taken[7:0] = w1_br[7:0] & vpc_bry_mask[7:0] & w1b0_bry[7:0];
assign w1b1_br_taken[7:0] = w1_br[7:0] & vpc_bry_mask[7:0] & w1b1_bry[7:0];

assign w0b0_br_ntake[7:0] = w0_ab_br[7:0] & vpc_bry_mask[7:0] & w0b0_bry[7:0];
assign w0b1_br_ntake[7:0] = w0_ab_br[7:0] & vpc_bry_mask[7:0] & w0b1_bry[7:0];
assign w1b0_br_ntake[7:0] = w1_ab_br[7:0] & vpc_bry_mask[7:0] & w1b0_bry[7:0];
assign w1b1_br_ntake[7:0] = w1_ab_br[7:0] & vpc_bry_mask[7:0] & w1b1_bry[7:0];

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
  ifdp_ipctrl_w0b0_bry_data[7:0] <= 8'b0;
  ifdp_ipctrl_w0b1_bry_data[7:0] <= 8'b0;
  ifdp_ipctrl_w1b0_bry_data[7:0] <= 8'b0;
  ifdp_ipctrl_w1b1_bry_data[7:0] <= 8'b0;
  ifdp_ipctrl_w0b0_br_taken[7:0] <= 8'b0;
  ifdp_ipctrl_w0b1_br_taken[7:0] <= 8'b0;
  ifdp_ipctrl_w1b0_br_taken[7:0] <= 8'b0;
  ifdp_ipctrl_w1b1_br_taken[7:0] <= 8'b0;
  ifdp_ipctrl_w0b0_br_ntake[7:0] <= 8'b0;
  ifdp_ipctrl_w0b1_br_ntake[7:0] <= 8'b0;
  ifdp_ipctrl_w1b0_br_ntake[7:0] <= 8'b0;
  ifdp_ipctrl_w1b1_br_ntake[7:0] <= 8'b0;
  ifdp_ipctrl_w0_bry1_hit        <= 1'b0;
  ifdp_ipctrl_w1_bry1_hit        <= 1'b0;
  ifdp_ipctrl_w0_bry0_hit        <= 1'b0;
  ifdp_ipctrl_w1_bry0_hit        <= 1'b0;
  end
  else if(ifctrl_ifdp_pipedown)
  begin
  ifdp_ipctrl_w0b0_bry_data[7:0] <= w0b0_bry_data[7:0];
  ifdp_ipctrl_w0b1_bry_data[7:0] <= w0b1_bry_data[7:0];
  ifdp_ipctrl_w1b0_bry_data[7:0] <= w1b0_bry_data[7:0];
  ifdp_ipctrl_w1b1_bry_data[7:0] <= w1b1_bry_data[7:0];
  ifdp_ipctrl_w0b0_br_taken[7:0] <= w0b0_br_taken[7:0];
  ifdp_ipctrl_w0b1_br_taken[7:0] <= w0b1_br_taken[7:0];
  ifdp_ipctrl_w1b0_br_taken[7:0] <= w1b0_br_taken[7:0];
  ifdp_ipctrl_w1b1_br_taken[7:0] <= w1b1_br_taken[7:0];
  ifdp_ipctrl_w0b0_br_ntake[7:0] <= w0b0_br_ntake[7:0];
  ifdp_ipctrl_w0b1_br_ntake[7:0] <= w0b1_br_ntake[7:0];
  ifdp_ipctrl_w1b0_br_ntake[7:0] <= w1b0_br_ntake[7:0];
  ifdp_ipctrl_w1b1_br_ntake[7:0] <= w1b1_br_ntake[7:0];
  ifdp_ipctrl_w0_bry1_hit        <= w0_bry1_hit;
  ifdp_ipctrl_w1_bry1_hit        <= w1_bry1_hit;
  ifdp_ipctrl_w0_bry0_hit        <= w0_bry0_hit;
  ifdp_ipctrl_w1_bry0_hit        <= w1_bry0_hit;
  end
  else
  begin
  ifdp_ipctrl_w0b0_bry_data[7:0] <= ipctrl_ifdp_w0b0_bry_updt_data[7:0];
  ifdp_ipctrl_w0b1_bry_data[7:0] <= ipctrl_ifdp_w0b1_bry_updt_data[7:0];
  ifdp_ipctrl_w1b0_bry_data[7:0] <= ipctrl_ifdp_w1b0_bry_updt_data[7:0];
  ifdp_ipctrl_w1b1_bry_data[7:0] <= ipctrl_ifdp_w1b1_bry_updt_data[7:0];
  ifdp_ipctrl_w0b0_br_taken[7:0] <= ipctrl_ifdp_w0b0_br_taken_updt[7:0];
  ifdp_ipctrl_w0b1_br_taken[7:0] <= ipctrl_ifdp_w0b1_br_taken_updt[7:0];
  ifdp_ipctrl_w1b0_br_taken[7:0] <= ipctrl_ifdp_w1b0_br_taken_updt[7:0];
  ifdp_ipctrl_w1b1_br_taken[7:0] <= ipctrl_ifdp_w1b1_br_taken_updt[7:0];
  ifdp_ipctrl_w0b0_br_ntake[7:0] <= ipctrl_ifdp_w0b0_br_ntake_updt[7:0];
  ifdp_ipctrl_w0b1_br_ntake[7:0] <= ipctrl_ifdp_w0b1_br_ntake_updt[7:0];
  ifdp_ipctrl_w1b0_br_ntake[7:0] <= ipctrl_ifdp_w1b0_br_ntake_updt[7:0];
  ifdp_ipctrl_w1b1_br_ntake[7:0] <= ipctrl_ifdp_w1b1_br_ntake_updt[7:0];
  ifdp_ipctrl_w0_bry0_hit        <= ipctrl_ifdp_w0_bry0_hit_updt;
  ifdp_ipctrl_w0_bry1_hit        <= ipctrl_ifdp_w0_bry1_hit_updt;
  ifdp_ipctrl_w1_bry0_hit        <= ipctrl_ifdp_w1_bry0_hit_updt;
  ifdp_ipctrl_w1_bry1_hit        <= ipctrl_ifdp_w1_bry1_hit_updt;
  end
end

// &Force("output","ifdp_ipctrl_w0b0_bry_data"); @897
// &Force("output","ifdp_ipctrl_w0b1_bry_data"); @898
// &Force("output","ifdp_ipctrl_w1b0_bry_data"); @899
// &Force("output","ifdp_ipctrl_w1b1_bry_data"); @900
// &Force("output","ifdp_ipctrl_w0b0_br_taken"); @901
// &Force("output","ifdp_ipctrl_w0b1_br_taken"); @902
// &Force("output","ifdp_ipctrl_w1b0_br_taken"); @903
// &Force("output","ifdp_ipctrl_w1b1_br_taken"); @904
// &Force("output","ifdp_ipctrl_w0b0_br_ntake"); @905
// &Force("output","ifdp_ipctrl_w0b1_br_ntake"); @906
// &Force("output","ifdp_ipctrl_w1b0_br_ntake"); @907
// &Force("output","ifdp_ipctrl_w1b1_br_ntake"); @908
// &Force("output","ifdp_ipctrl_w0_bry1_hit"); @909
// &Force("output","ifdp_ipctrl_w1_bry1_hit"); @910
// &Force("output","ifdp_ipctrl_w0_bry0_hit"); @911
// &Force("output","ifdp_ipctrl_w1_bry0_hit"); @912


// &CombBeg; @915
always @( pcgen_ifdp_pc[2:0])
begin
case(pcgen_ifdp_pc[2:0])
  3'b000  : vpc_bry_mask[7:0] = 8'b11111111;
  3'b001  : vpc_bry_mask[7:0] = 8'b01111111;
  3'b010  : vpc_bry_mask[7:0] = 8'b00111111;
  3'b011  : vpc_bry_mask[7:0] = 8'b00011111;
  3'b100  : vpc_bry_mask[7:0] = 8'b00001111;
  3'b101  : vpc_bry_mask[7:0] = 8'b00000111;
  3'b110  : vpc_bry_mask[7:0] = 8'b00000011;
  3'b111  : vpc_bry_mask[7:0] = 8'b00000001;
  default : vpc_bry_mask[7:0] = 8'b11111111;
endcase
// &CombEnd; @927
end

//vpc_bry_mask
//for timing consideration, form vpc_bry_mask in IF stage
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipctrl_vpc_bry_mask[7:0] <= 8'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipctrl_vpc_bry_mask[7:0] <= vpc_bry_mask[7:0] & {8{~ifdp_expt_vld}};
  else
    ifdp_ipctrl_vpc_bry_mask[7:0] <= ifdp_ipctrl_vpc_bry_mask[7:0];
end
// &Force("output", "ifdp_ipctrl_vpc_bry_mask"); @940

//=================Had inst bkpt about=====================
assign bkpta_base[PC_WIDTH-1:0] =(mmu_xx_mmu_en)
                                ? {had_yy_xx_bkpta_base[PC_WIDTH-2],had_yy_xx_bkpta_base[PC_WIDTH-2:0]}
                                : had_yy_xx_bkpta_base[PC_WIDTH-1:0];
assign bkptb_base[PC_WIDTH-1:0] =(mmu_xx_mmu_en)
                                ? {had_yy_xx_bkptb_base[PC_WIDTH-2],had_yy_xx_bkptb_base[PC_WIDTH-2:0]}
                                : had_yy_xx_bkptb_base[PC_WIDTH-1:0];
assign bkpta_mask[PC_WIDTH-1:0] = {32'hffffffff,had_yy_xx_bkpta_mask[7:0]};
assign bkptb_mask[PC_WIDTH-1:0] = {32'hffffffff,had_yy_xx_bkptb_mask[7:0]};

assign bkpta_hit_0 = ((bkpta_base[PC_WIDTH-1:0] & bkpta_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b0000} & bkpta_mask[PC_WIDTH-1:0]))^had_yy_xx_bkpta_rc;
assign bkpta_hit_1 = ((bkpta_base[PC_WIDTH-1:0] & bkpta_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b0010} & bkpta_mask[PC_WIDTH-1:0]))^had_yy_xx_bkpta_rc;
assign bkpta_hit_2 = ((bkpta_base[PC_WIDTH-1:0] & bkpta_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b0100} & bkpta_mask[PC_WIDTH-1:0]))^had_yy_xx_bkpta_rc;
assign bkpta_hit_3 = ((bkpta_base[PC_WIDTH-1:0] & bkpta_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b0110} & bkpta_mask[PC_WIDTH-1:0]))^had_yy_xx_bkpta_rc;
assign bkpta_hit_4 = ((bkpta_base[PC_WIDTH-1:0] & bkpta_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b1000} & bkpta_mask[PC_WIDTH-1:0]))^had_yy_xx_bkpta_rc;
assign bkpta_hit_5 = ((bkpta_base[PC_WIDTH-1:0] & bkpta_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b1010} & bkpta_mask[PC_WIDTH-1:0]))^had_yy_xx_bkpta_rc;
assign bkpta_hit_6 = ((bkpta_base[PC_WIDTH-1:0] & bkpta_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b1100} & bkpta_mask[PC_WIDTH-1:0]))^had_yy_xx_bkpta_rc;
assign bkpta_hit_7 = ((bkpta_base[PC_WIDTH-1:0] & bkpta_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b1110} & bkpta_mask[PC_WIDTH-1:0]))^had_yy_xx_bkpta_rc;
assign bkptb_hit_0 = ((bkptb_base[PC_WIDTH-1:0] & bkptb_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b0000} & bkptb_mask[PC_WIDTH-1:0]))^had_yy_xx_bkptb_rc;
assign bkptb_hit_1 = ((bkptb_base[PC_WIDTH-1:0] & bkptb_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b0010} & bkptb_mask[PC_WIDTH-1:0]))^had_yy_xx_bkptb_rc;
assign bkptb_hit_2 = ((bkptb_base[PC_WIDTH-1:0] & bkptb_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b0100} & bkptb_mask[PC_WIDTH-1:0]))^had_yy_xx_bkptb_rc;
assign bkptb_hit_3 = ((bkptb_base[PC_WIDTH-1:0] & bkptb_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b0110} & bkptb_mask[PC_WIDTH-1:0]))^had_yy_xx_bkptb_rc;
assign bkptb_hit_4 = ((bkptb_base[PC_WIDTH-1:0] & bkptb_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b1000} & bkptb_mask[PC_WIDTH-1:0]))^had_yy_xx_bkptb_rc;
assign bkptb_hit_5 = ((bkptb_base[PC_WIDTH-1:0] & bkptb_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b1010} & bkptb_mask[PC_WIDTH-1:0]))^had_yy_xx_bkptb_rc;
assign bkptb_hit_6 = ((bkptb_base[PC_WIDTH-1:0] & bkptb_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b1100} & bkptb_mask[PC_WIDTH-1:0]))^had_yy_xx_bkptb_rc;
assign bkptb_hit_7 = ((bkptb_base[PC_WIDTH-1:0] & bkptb_mask[PC_WIDTH-1:0]) == ({pcgen_ifdp_pc[PC_WIDTH-2:3],4'b1110} & bkptb_mask[PC_WIDTH-1:0]))^had_yy_xx_bkptb_rc;

assign if_bkpta[7:0]    = {bkpta_hit_0,
                           bkpta_hit_1,
                           bkpta_hit_2,
                           bkpta_hit_3,
                           bkpta_hit_4,
                           bkpta_hit_5,
                           bkpta_hit_6,
                           bkpta_hit_7};
assign if_bkptb[7:0]    = {bkptb_hit_0,
                           bkptb_hit_1,
                           bkptb_hit_2,
                           bkptb_hit_3,
                           bkptb_hit_4,
                           bkptb_hit_5,
                           bkptb_hit_6,
                           bkptb_hit_7};

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipdp_bkpta[7:0] <= 8'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipdp_bkpta[7:0] <= if_bkpta[7:0];
  else
    ifdp_ipdp_bkpta[7:0] <= ifdp_ipdp_bkpta[7:0];
end
// &Force("output", "ifdp_ipdp_bkpta"); @995

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_ipdp_bkptb[7:0] <= 8'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_ipdp_bkptb[7:0] <= if_bkptb[7:0];
  else
    ifdp_ipdp_bkptb[7:0] <= ifdp_ipdp_bkptb[7:0];
end
// &Force("output", "ifdp_ipdp_bkptb"); @1006

//==========================================================
//                      Expt Related
//==========================================================
assign if_mmu_expt_vld          = mmu_ifu_pgflt;
assign if_refill_expt_vld       = l1_refill_ifdp_acc_err;
assign ifdp_expt_vld            = if_refill_expt_vld || 
                                  if_mmu_expt_vld;
//assign ifdp_vector_mmu_expt_vld = if_mmu_expt_vld;


// &Instance("gated_clk_cell","x_ifdp_spe_clk"); @1018
gated_clk_cell  x_ifdp_spe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ifdp_spe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ifdp_spe_clk_en   ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @1019
//           .clk_out        (ifdp_spe_clk),//Out Clock @1020
//           .external_en    (1'b0), @1021
//           .global_en      (cp0_yy_clk_en), @1022
//           .local_en       (ifdp_spe_clk_en),//Local Condition @1023
//           .module_en      (cp0_ifu_icg_en) @1024
//         ); @1025
assign ifdp_spe_clk_en = ifdp_ipdp_expt_vld      || 
                         ifdp_expt_vld; 
                     
always @(posedge ifdp_spe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ifdp_ipdp_expt_vld       <= 1'b0;
    ifdp_ipctrl_expt_vld_dup <= 1'b0;
    ifdp_ipdp_mmu_pgflt      <= 1'b0;
    ifdp_ipdp_acc_err        <= 1'b0;
  end
  else if(ifctrl_ifdp_pipedown)
  begin
    ifdp_ipdp_expt_vld       <= ifdp_expt_vld;
    ifdp_ipctrl_expt_vld_dup <= ifdp_expt_vld;
    ifdp_ipdp_mmu_pgflt      <= mmu_ifu_pgflt;
    ifdp_ipdp_acc_err        <= l1_refill_ifdp_acc_err;
  end
  else
  begin
    ifdp_ipdp_expt_vld       <= ifdp_ipdp_expt_vld;
    ifdp_ipctrl_expt_vld_dup <= ifdp_ipctrl_expt_vld_dup;
    ifdp_ipdp_mmu_pgflt      <= ifdp_ipdp_mmu_pgflt;
    ifdp_ipdp_acc_err        <= ifdp_ipdp_acc_err;
  end
end
// &Force("output", "ifdp_ipdp_mmu_pgflt"); @1053
// &Force("output", "ifdp_ipdp_acc_err"); @1054
// &Force("output", "ifdp_ipctrl_expt_vld_dup"); @1055
assign ifdp_ipctrl_expt_vld = ifdp_ipdp_expt_vld;

// &Force("output", "ifdp_ipdp_ecc_err"); @1068

//==========================================================
//                      BTB Related
//==========================================================
//L0 BTB target pc will compare with L1 BTB target PC
//for timing consideration,we compare target pc at IF stage
assign btb_way0_high_hit    = btb_ifdp_way0_target[19:10] == l0_btb_ifdp_chgflw_pc[19:10];
assign btb_way0_low_hit     = btb_ifdp_way0_target[9:0]   == l0_btb_ifdp_chgflw_pc[9:0];
assign btb_way1_high_hit    = btb_ifdp_way1_target[19:10] == l0_btb_ifdp_chgflw_pc[19:10];
assign btb_way1_low_hit     = btb_ifdp_way1_target[9:0]   == l0_btb_ifdp_chgflw_pc[9:0];
assign btb_way2_high_hit    = btb_ifdp_way2_target[19:10] == l0_btb_ifdp_chgflw_pc[19:10];
assign btb_way2_low_hit     = btb_ifdp_way2_target[9:0]   == l0_btb_ifdp_chgflw_pc[9:0];
assign btb_way3_high_hit    = btb_ifdp_way3_target[19:10] == l0_btb_ifdp_chgflw_pc[19:10];
assign btb_way3_low_hit     = btb_ifdp_way3_target[9:0]   == l0_btb_ifdp_chgflw_pc[9:0];
assign btb_mispred_pc[PC_WIDTH-2:0] = pcgen_ifdp_inc_pc[PC_WIDTH-2:0];

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
  btb_way0_tag[9:0]     <= 10'b0;
  btb_way0_target[19:0] <= 20'b0;
  btb_way0_pred[1:0]    <= 2'b0;
  btb_way0_vld          <= 1'b0;
  btb_way1_tag[9:0]     <= 10'b0;
  btb_way1_target[19:0] <= 20'b0;
  btb_way1_pred[1:0]    <= 2'b0;
  btb_way1_vld          <= 1'b0;
  btb_way2_tag[9:0]     <= 10'b0;
  btb_way2_target[19:0] <= 20'b0;
  btb_way2_pred[1:0]    <= 2'b0;
  btb_way2_vld          <= 1'b0;
  btb_way3_tag[9:0]     <= 10'b0;
  btb_way3_target[19:0] <= 20'b0;
  btb_way3_pred[1:0]    <= 2'b0;
  btb_way3_vld          <= 1'b0;
  end
  else if(ifctrl_ifdp_pipedown)
  begin
  btb_way0_tag[9:0]     <= btb_ifdp_way0_tag[9:0];
  btb_way0_target[19:0] <= btb_ifdp_way0_target[19:0];
  btb_way0_pred[1:0]    <= btb_ifdp_way0_pred[1:0];
  btb_way0_vld          <= btb_ifdp_way0_vld;
  btb_way1_tag[9:0]     <= btb_ifdp_way1_tag[9:0];
  btb_way1_target[19:0] <= btb_ifdp_way1_target[19:0];
  btb_way1_pred[1:0]    <= btb_ifdp_way1_pred[1:0];
  btb_way1_vld          <= btb_ifdp_way1_vld;
  btb_way2_tag[9:0]     <= btb_ifdp_way2_tag[9:0];
  btb_way2_target[19:0] <= btb_ifdp_way2_target[19:0];
  btb_way2_pred[1:0]    <= btb_ifdp_way2_pred[1:0];
  btb_way2_vld          <= btb_ifdp_way2_vld;
  btb_way3_tag[9:0]     <= btb_ifdp_way3_tag[9:0];
  btb_way3_target[19:0] <= btb_ifdp_way3_target[19:0];
  btb_way3_pred[1:0]    <= btb_ifdp_way3_pred[1:0];
  btb_way3_vld          <= btb_ifdp_way3_vld;
  end
  else
  begin
  btb_way0_tag[9:0]     <= btb_way0_tag[9:0];
  btb_way0_target[19:0] <= btb_way0_target[19:0];
  btb_way0_pred[1:0]    <= btb_way0_pred[1:0];
  btb_way0_vld          <= btb_way0_vld;
  btb_way1_tag[9:0]     <= btb_way1_tag[9:0];
  btb_way1_target[19:0] <= btb_way1_target[19:0];
  btb_way1_pred[1:0]    <= btb_way1_pred[1:0];
  btb_way1_vld          <= btb_way1_vld;
  btb_way2_tag[9:0]     <= btb_way2_tag[9:0];
  btb_way2_target[19:0] <= btb_way2_target[19:0];
  btb_way2_pred[1:0]    <= btb_way2_pred[1:0];
  btb_way2_vld          <= btb_way2_vld;
  btb_way3_tag[9:0]     <= btb_way3_tag[9:0];
  btb_way3_target[19:0] <= btb_way3_target[19:0];
  btb_way3_pred[1:0]    <= btb_way3_pred[1:0];
  btb_way3_vld          <= btb_way3_vld;
  end
end

always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
  l0_btb_hit                      <= 1'b0;
  l0_btb_target[PC_WIDTH-2:0]     <= {PC_WIDTH-1{1'b0}};
  l0_btb_way_pred[1:0]            <= 2'b0;
  l0_btb_counter                  <= 1'b0;
  l0_btb_ras                      <= 1'b0;
  l0_btb_entry_hit[15:0]          <= 16'b0;
  l0_btb_way0_high_hit            <= 1'b0;
  l0_btb_way0_low_hit             <= 1'b0;
  l0_btb_way1_high_hit            <= 1'b0;
  l0_btb_way1_low_hit             <= 1'b0;
  l0_btb_way2_high_hit            <= 1'b0;
  l0_btb_way2_low_hit             <= 1'b0;
  l0_btb_way3_high_hit            <= 1'b0;
  l0_btb_way3_low_hit             <= 1'b0;
  l0_btb_mispred_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  end
  else if(ifctrl_ifdp_pipedown)
  begin
  l0_btb_hit                      <= l0_btb_ifdp_hit;
  l0_btb_target[PC_WIDTH-2:0]     <= l0_btb_ifdp_chgflw_pc[PC_WIDTH-2:0];
  l0_btb_way_pred[1:0]            <= l0_btb_ifdp_chgflw_way_pred[1:0];
  l0_btb_counter                  <= l0_btb_ifdp_counter;
  l0_btb_ras                      <= l0_btb_ifdp_ras;
  l0_btb_entry_hit[15:0]          <= l0_btb_ifdp_entry_hit[15:0];
  l0_btb_way0_high_hit            <= btb_way0_high_hit;
  l0_btb_way0_low_hit             <= btb_way0_low_hit;
  l0_btb_way1_high_hit            <= btb_way1_high_hit;
  l0_btb_way1_low_hit             <= btb_way1_low_hit;
  l0_btb_way2_high_hit            <= btb_way2_high_hit;
  l0_btb_way2_low_hit             <= btb_way2_low_hit;
  l0_btb_way3_high_hit            <= btb_way3_high_hit;
  l0_btb_way3_low_hit             <= btb_way3_low_hit;
  l0_btb_mispred_pc[PC_WIDTH-2:0] <= btb_mispred_pc[PC_WIDTH-2:0];
  end
  else
  begin
  l0_btb_hit                      <= l0_btb_hit;
  l0_btb_target[PC_WIDTH-2:0]     <= l0_btb_target[PC_WIDTH-2:0];
  l0_btb_way_pred[1:0]            <= l0_btb_way_pred[1:0];
  l0_btb_counter                  <= l0_btb_counter;
  l0_btb_ras                      <= l0_btb_ras;
  l0_btb_entry_hit[15:0]          <= l0_btb_entry_hit[15:0];
  l0_btb_way0_high_hit            <= l0_btb_way0_high_hit;
  l0_btb_way0_low_hit             <= l0_btb_way0_low_hit;
  l0_btb_way1_high_hit            <= l0_btb_way1_high_hit;
  l0_btb_way1_low_hit             <= l0_btb_way1_low_hit;
  l0_btb_way2_high_hit            <= l0_btb_way2_high_hit;
  l0_btb_way2_low_hit             <= l0_btb_way2_low_hit;
  l0_btb_way3_high_hit            <= l0_btb_way3_high_hit;
  l0_btb_way3_low_hit             <= l0_btb_way3_low_hit;
  l0_btb_mispred_pc[PC_WIDTH-2:0] <= l0_btb_mispred_pc[PC_WIDTH-2:0];
  end
end

assign ifdp_ipdp_btb_way0_tag[9:0]              = btb_way0_tag[9:0];
assign ifdp_ipdp_btb_way0_target[19:0]          = btb_way0_target[19:0];
assign ifdp_ipdp_btb_way0_pred[1:0]             = btb_way0_pred[1:0];
assign ifdp_ipdp_btb_way0_vld                   = btb_way0_vld;
assign ifdp_ipdp_btb_way1_tag[9:0]              = btb_way1_tag[9:0];
assign ifdp_ipdp_btb_way1_target[19:0]          = btb_way1_target[19:0];
assign ifdp_ipdp_btb_way1_pred[1:0]             = btb_way1_pred[1:0];
assign ifdp_ipdp_btb_way1_vld                   = btb_way1_vld;
assign ifdp_ipdp_btb_way2_tag[9:0]              = btb_way2_tag[9:0];
assign ifdp_ipdp_btb_way2_target[19:0]          = btb_way2_target[19:0];
assign ifdp_ipdp_btb_way2_pred[1:0]             = btb_way2_pred[1:0];
assign ifdp_ipdp_btb_way2_vld                   = btb_way2_vld;
assign ifdp_ipdp_btb_way3_tag[9:0]              = btb_way3_tag[9:0];
assign ifdp_ipdp_btb_way3_target[19:0]          = btb_way3_target[19:0];
assign ifdp_ipdp_btb_way3_pred[1:0]             = btb_way3_pred[1:0];
assign ifdp_ipdp_btb_way3_vld                   = btb_way3_vld;
assign ifdp_ipdp_l0_btb_hit                     = l0_btb_hit;
assign ifdp_ipdp_l0_btb_target[PC_WIDTH-2:0]    = l0_btb_target[PC_WIDTH-2:0];
assign ifdp_ipdp_l0_btb_way_pred[1:0]           = l0_btb_way_pred[1:0];
assign ifdp_ipdp_l0_btb_counter                 = l0_btb_counter;
assign ifdp_ipdp_l0_btb_ras                     = l0_btb_ras;
assign ifdp_ipdp_l0_btb_entry_hit[15:0]         = l0_btb_entry_hit[15:0];
assign ifdp_ipdp_l0_btb_way0_high_hit           = l0_btb_way0_high_hit;
assign ifdp_ipdp_l0_btb_way0_low_hit            = l0_btb_way0_low_hit;
assign ifdp_ipdp_l0_btb_way1_high_hit           = l0_btb_way1_high_hit;
assign ifdp_ipdp_l0_btb_way1_low_hit            = l0_btb_way1_low_hit;
assign ifdp_ipdp_l0_btb_way2_high_hit           = l0_btb_way2_high_hit;
assign ifdp_ipdp_l0_btb_way2_low_hit            = l0_btb_way2_low_hit;
assign ifdp_ipdp_l0_btb_way3_high_hit           = l0_btb_way3_high_hit;
assign ifdp_ipdp_l0_btb_way3_low_hit            = l0_btb_way3_low_hit;
assign ifdp_ipdp_l0_btb_mispred_pc[PC_WIDTH-2:0] = l0_btb_mispred_pc[PC_WIDTH-2:0]; 

//==========================================================
//              Spec Fail Predict Data
//==========================================================
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b) 
  begin
    ifdp_ipdp_sfp_pc_hit         <= 1'b0;
    ifdp_ipdp_sfp_hit_type[3:0]  <= 4'b0;
    ifdp_ipdp_sfp_hit_pc_lo[2:0] <= 3'b0;
  end
  else if(ifctrl_ifdp_pipedown)
  begin
    ifdp_ipdp_sfp_pc_hit         <= sfp_ifdp_pc_hit;
    ifdp_ipdp_sfp_hit_type[3:0]  <= sfp_ifdp_hit_type[3:0];
    ifdp_ipdp_sfp_hit_pc_lo[2:0] <= sfp_ifdp_hit_pc_lo[2:0];
  end
  else
  begin
    ifdp_ipdp_sfp_pc_hit         <= ifdp_ipdp_sfp_pc_hit;
    ifdp_ipdp_sfp_hit_type[3:0]  <= ifdp_ipdp_sfp_hit_type[3:0];
    ifdp_ipdp_sfp_hit_pc_lo[2:0] <= ifdp_ipdp_sfp_hit_pc_lo[2:0];
  end
end
// &Force("output", "ifdp_ipdp_sfp_pc_hit"); @1276
// &Force("output", "ifdp_ipdp_sfp_hit_type"); @1277
// &Force("output", "ifdp_ipdp_sfp_hit_pc_lo"); @1278

//==========================================================
//              MMU Tsize & Prot Bits
//==========================================================
//These bit will be sent to BIU for Request Data from BUS
//Machine mode
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_l1_refill_machine_mode <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_l1_refill_machine_mode <= (cp0_yy_priv_mode[1:0] == 2'b11);
  else
    ifdp_l1_refill_machine_mode <= ifdp_l1_refill_machine_mode;
end
// &Force("output", "ifdp_l1_refill_machine_mode"); @1294

//Superviser mode
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_l1_refill_supv_mode <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_l1_refill_supv_mode <= cp0_yy_priv_mode[0];
  else
    ifdp_l1_refill_supv_mode <= ifdp_l1_refill_supv_mode;
end
// &Force("output", "ifdp_l1_refill_supv_mode"); @1306

//Tsize Bit : acc_ca
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_l1_refill_tsize <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_l1_refill_tsize <= cp0_ifu_icache_en && mmu_ifu_ca;
  else
    ifdp_l1_refill_tsize <= ifdp_l1_refill_tsize;
end
// &Force("output", "ifdp_l1_refill_tsize"); @1318
assign ifdp_ipctrl_tsize = ifdp_l1_refill_tsize;

//Bufferable Bit
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_l1_refill_bufferable <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_l1_refill_bufferable <= mmu_ifu_buf;
  else
    ifdp_l1_refill_bufferable <= ifdp_l1_refill_bufferable;
end
// &Force("output", "ifdp_l1_refill_bufferable"); @1331

//Secure Bit
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_l1_refill_secure <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_l1_refill_secure <= mmu_ifu_sec;
  else
    ifdp_l1_refill_secure <= ifdp_l1_refill_secure;
end
// &Force("output", "ifdp_l1_refill_secure"); @1343

//Cacheable Bit
always @(posedge ifdp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifdp_l1_refill_cacheable <= 1'b0;
  else if(ifctrl_ifdp_pipedown)
    ifdp_l1_refill_cacheable <= mmu_ifu_ca;
  else
    ifdp_l1_refill_cacheable <= ifdp_l1_refill_cacheable;
end
// &Force("output", "ifdp_l1_refill_cacheable"); @1355

// &Force("output", "ifdp_ipctrl_data_from_pbuf"); @1368
// &Force("output", "ifdp_ipctrl_data_from_biu"); @1380
// &Force("output", "ifdp_ipctrl_cache_en"); @1392
// &Force("output", "ifdp_ipctrl_ca"); @1404

//Debug_infor
assign ifdp_debug_mmu_expt_vld = if_mmu_expt_vld;
assign ifdp_debug_acc_err_vld  = if_refill_expt_vld;

// &ModuleEnd; @1412
endmodule


