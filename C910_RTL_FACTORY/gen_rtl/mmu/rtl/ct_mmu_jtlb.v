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
module ct_mmu_jtlb(
  arb_jtlb_acc_type,
  arb_jtlb_bank_sel,
  arb_jtlb_cmp_with_va,
  arb_jtlb_data_din,
  arb_jtlb_fifo_din,
  arb_jtlb_fifo_write,
  arb_jtlb_idx,
  arb_jtlb_req,
  arb_jtlb_tag_din,
  arb_jtlb_vpn,
  arb_jtlb_write,
  arb_top_cur_st,
  cp0_mmu_icg_en,
  cp0_mmu_maee,
  cp0_mmu_mpp,
  cp0_mmu_mprv,
  cp0_mmu_mxr,
  cp0_mmu_ptw_en,
  cp0_mmu_sum,
  cp0_yy_priv_mode,
  cpurst_b,
  dutlb_xx_mmu_off,
  forever_cpuclk,
  jtlb_arb_cmp_va,
  jtlb_arb_par_clr,
  jtlb_arb_pfu_cmplt,
  jtlb_arb_pfu_vpn,
  jtlb_arb_sel_1g,
  jtlb_arb_sel_2m,
  jtlb_arb_sel_4k,
  jtlb_arb_tc_miss,
  jtlb_arb_type,
  jtlb_arb_vpn,
  jtlb_dutlb_acc_err,
  jtlb_dutlb_pgflt,
  jtlb_dutlb_ref_cmplt,
  jtlb_dutlb_ref_pavld,
  jtlb_iutlb_acc_err,
  jtlb_iutlb_pgflt,
  jtlb_iutlb_ref_cmplt,
  jtlb_iutlb_ref_pavld,
  jtlb_ptw_req,
  jtlb_ptw_type,
  jtlb_ptw_vpn,
  jtlb_regs_hit,
  jtlb_regs_hit_mult,
  jtlb_regs_tlbp_hit_index,
  jtlb_tlboper_asid_hit,
  jtlb_tlboper_cmplt,
  jtlb_tlboper_fifo,
  jtlb_tlboper_read_idle,
  jtlb_tlboper_sel,
  jtlb_tlboper_va_hit,
  jtlb_tlbr_asid,
  jtlb_tlbr_flg,
  jtlb_tlbr_g,
  jtlb_tlbr_pgs,
  jtlb_tlbr_ppn,
  jtlb_tlbr_vpn,
  jtlb_top_cur_st,
  jtlb_top_utlb_pavld,
  jtlb_utlb_ref_flg,
  jtlb_utlb_ref_pgs,
  jtlb_utlb_ref_ppn,
  jtlb_utlb_ref_vpn,
  jtlb_xx_fifo,
  jtlb_xx_tc_read,
  lsu_mmu_va2,
  lsu_mmu_va2_vld,
  mmu_lsu_pa2,
  mmu_lsu_pa2_err,
  mmu_lsu_pa2_vld,
  mmu_lsu_sec2,
  mmu_lsu_share2,
  mmu_pmp_pa4,
  mmu_sysmap_pa4,
  pad_yy_icg_scan_en,
  pmp_mmu_flg4,
  ptw_arb_vpn,
  ptw_jtlb_dmiss,
  ptw_jtlb_imiss,
  ptw_jtlb_pmiss,
  ptw_jtlb_ref_acc_err,
  ptw_jtlb_ref_cmplt,
  ptw_jtlb_ref_data_vld,
  ptw_jtlb_ref_flg,
  ptw_jtlb_ref_pgflt,
  ptw_jtlb_ref_pgs,
  ptw_jtlb_ref_ppn,
  regs_jtlb_cur_asid,
  sysmap_mmu_flg4,
  tlboper_jtlb_asid,
  tlboper_jtlb_asid_sel,
  tlboper_jtlb_cmp_noasid,
  tlboper_jtlb_inv_asid,
  tlboper_jtlb_tlbwr_on,
  tlboper_xx_pgs,
  tlboper_xx_pgs_en
);

// &Ports; @27
input   [2  :0]  arb_jtlb_acc_type;       
input   [3  :0]  arb_jtlb_bank_sel;       
input            arb_jtlb_cmp_with_va;    
input   [41 :0]  arb_jtlb_data_din;       
input   [3  :0]  arb_jtlb_fifo_din;       
input            arb_jtlb_fifo_write;     
input   [8  :0]  arb_jtlb_idx;            
input            arb_jtlb_req;            
input   [47 :0]  arb_jtlb_tag_din;        
input   [26 :0]  arb_jtlb_vpn;            
input            arb_jtlb_write;          
input   [1  :0]  arb_top_cur_st;          
input            cp0_mmu_icg_en;          
input            cp0_mmu_maee;            
input   [1  :0]  cp0_mmu_mpp;             
input            cp0_mmu_mprv;            
input            cp0_mmu_mxr;             
input            cp0_mmu_ptw_en;          
input            cp0_mmu_sum;             
input   [1  :0]  cp0_yy_priv_mode;        
input            cpurst_b;                
input            dutlb_xx_mmu_off;        
input            forever_cpuclk;          
input   [27 :0]  lsu_mmu_va2;             
input            lsu_mmu_va2_vld;         
input            pad_yy_icg_scan_en;      
input   [3  :0]  pmp_mmu_flg4;            
input   [26 :0]  ptw_arb_vpn;             
input            ptw_jtlb_dmiss;          
input            ptw_jtlb_imiss;          
input            ptw_jtlb_pmiss;          
input            ptw_jtlb_ref_acc_err;    
input            ptw_jtlb_ref_cmplt;      
input            ptw_jtlb_ref_data_vld;   
input   [13 :0]  ptw_jtlb_ref_flg;        
input            ptw_jtlb_ref_pgflt;      
input   [2  :0]  ptw_jtlb_ref_pgs;        
input   [27 :0]  ptw_jtlb_ref_ppn;        
input   [15 :0]  regs_jtlb_cur_asid;      
input   [4  :0]  sysmap_mmu_flg4;         
input   [15 :0]  tlboper_jtlb_asid;       
input            tlboper_jtlb_asid_sel;   
input            tlboper_jtlb_cmp_noasid; 
input   [15 :0]  tlboper_jtlb_inv_asid;   
input            tlboper_jtlb_tlbwr_on;   
input   [2  :0]  tlboper_xx_pgs;          
input            tlboper_xx_pgs_en;       
output           jtlb_arb_cmp_va;         
output           jtlb_arb_par_clr;        
output           jtlb_arb_pfu_cmplt;      
output  [26 :0]  jtlb_arb_pfu_vpn;        
output           jtlb_arb_sel_1g;         
output           jtlb_arb_sel_2m;         
output           jtlb_arb_sel_4k;         
output           jtlb_arb_tc_miss;        
output  [2  :0]  jtlb_arb_type;           
output  [26 :0]  jtlb_arb_vpn;            
output           jtlb_dutlb_acc_err;      
output           jtlb_dutlb_pgflt;        
output           jtlb_dutlb_ref_cmplt;    
output           jtlb_dutlb_ref_pavld;    
output           jtlb_iutlb_acc_err;      
output           jtlb_iutlb_pgflt;        
output           jtlb_iutlb_ref_cmplt;    
output           jtlb_iutlb_ref_pavld;    
output           jtlb_ptw_req;            
output  [2  :0]  jtlb_ptw_type;           
output  [26 :0]  jtlb_ptw_vpn;            
output           jtlb_regs_hit;           
output           jtlb_regs_hit_mult;      
output  [10 :0]  jtlb_regs_tlbp_hit_index; 
output           jtlb_tlboper_asid_hit;   
output           jtlb_tlboper_cmplt;      
output  [3  :0]  jtlb_tlboper_fifo;       
output           jtlb_tlboper_read_idle;  
output  [3  :0]  jtlb_tlboper_sel;        
output           jtlb_tlboper_va_hit;     
output  [15 :0]  jtlb_tlbr_asid;          
output  [13 :0]  jtlb_tlbr_flg;           
output           jtlb_tlbr_g;             
output  [2  :0]  jtlb_tlbr_pgs;           
output  [27 :0]  jtlb_tlbr_ppn;           
output  [26 :0]  jtlb_tlbr_vpn;           
output  [1  :0]  jtlb_top_cur_st;         
output           jtlb_top_utlb_pavld;     
output  [13 :0]  jtlb_utlb_ref_flg;       
output  [2  :0]  jtlb_utlb_ref_pgs;       
output  [27 :0]  jtlb_utlb_ref_ppn;       
output  [26 :0]  jtlb_utlb_ref_vpn;       
output  [11 :0]  jtlb_xx_fifo;            
output           jtlb_xx_tc_read;         
output  [27 :0]  mmu_lsu_pa2;             
output           mmu_lsu_pa2_err;         
output           mmu_lsu_pa2_vld;         
output           mmu_lsu_sec2;            
output           mmu_lsu_share2;          
output  [27 :0]  mmu_pmp_pa4;             
output  [27 :0]  mmu_sysmap_pa4;          

// &Regs; @28
reg     [1  :0]  pfu_cur_st;              
reg     [1  :0]  pfu_nxt_st;              
reg              pfu_off_chk;             
reg     [27 :0]  pfu_pa_buf;              
reg              pfu_sec_buf;             
reg              pfu_share_buf;           
reg     [2  :0]  read_cur_st;             
reg     [2  :0]  read_nxt_st;             
reg     [2  :0]  ta_acc_type;             
reg              ta_cmp_va;               
reg     [11 :0]  ta_jtlb_fifo_upd;        
reg              ta_vld;                  
reg     [26 :0]  ta_vpn;                  
reg     [3  :0]  ta_way_sel;              
reg              ta_wen;                  
reg     [2  :0]  tc_acc_type;             
reg              tc_cmp_va;               
reg     [11 :0]  tc_jtlb_fifo;            
reg              tc_vld;                  
reg     [26 :0]  tc_vpn;                  
reg     [15 :0]  tc_way0_asid;            
reg     [13 :0]  tc_way0_flg;             
reg              tc_way0_g;               
reg              tc_way0_hit_kid0;        
reg              tc_way0_hit_kid1;        
reg              tc_way0_hit_kid2;        
reg              tc_way0_hit_kid3;        
reg              tc_way0_hit_kid4;        
reg              tc_way0_hit_kid5;        
reg     [2  :0]  tc_way0_pgs;             
reg     [27 :0]  tc_way0_ppn;             
reg     [26 :0]  tc_way0_vpn;             
reg     [15 :0]  tc_way1_asid;            
reg     [13 :0]  tc_way1_flg;             
reg              tc_way1_g;               
reg              tc_way1_hit_kid0;        
reg              tc_way1_hit_kid1;        
reg              tc_way1_hit_kid2;        
reg              tc_way1_hit_kid3;        
reg              tc_way1_hit_kid4;        
reg              tc_way1_hit_kid5;        
reg     [2  :0]  tc_way1_pgs;             
reg     [27 :0]  tc_way1_ppn;             
reg     [26 :0]  tc_way1_vpn;             
reg     [15 :0]  tc_way2_asid;            
reg     [13 :0]  tc_way2_flg;             
reg              tc_way2_g;               
reg              tc_way2_hit_kid0;        
reg              tc_way2_hit_kid1;        
reg              tc_way2_hit_kid2;        
reg              tc_way2_hit_kid3;        
reg              tc_way2_hit_kid4;        
reg              tc_way2_hit_kid5;        
reg     [2  :0]  tc_way2_pgs;             
reg     [27 :0]  tc_way2_ppn;             
reg     [26 :0]  tc_way2_vpn;             
reg     [15 :0]  tc_way3_asid;            
reg     [13 :0]  tc_way3_flg;             
reg              tc_way3_g;               
reg              tc_way3_hit_kid0;        
reg              tc_way3_hit_kid1;        
reg              tc_way3_hit_kid2;        
reg              tc_way3_hit_kid3;        
reg              tc_way3_hit_kid4;        
reg              tc_way3_hit_kid5;        
reg     [2  :0]  tc_way3_pgs;             
reg     [27 :0]  tc_way3_ppn;             
reg     [26 :0]  tc_way3_vpn;             
reg     [3  :0]  tc_way_sel;              
reg              tc_wen;                  

// &Wires; @29
wire    [2  :0]  arb_jtlb_acc_type;       
wire    [3  :0]  arb_jtlb_bank_sel;       
wire             arb_jtlb_cmp_with_va;    
wire    [41 :0]  arb_jtlb_data_din;       
wire    [3  :0]  arb_jtlb_fifo_din;       
wire             arb_jtlb_fifo_write;     
wire    [8  :0]  arb_jtlb_idx;            
wire             arb_jtlb_req;            
wire    [47 :0]  arb_jtlb_tag_din;        
wire    [26 :0]  arb_jtlb_vpn;            
wire             arb_jtlb_write;          
wire    [1  :0]  arb_top_cur_st;          
wire    [15 :0]  asid_for_va_hit;         
wire             cp0_mach_mode;           
wire             cp0_mmu_icg_en;          
wire             cp0_mmu_maee;            
wire    [1  :0]  cp0_mmu_mpp;             
wire             cp0_mmu_mprv;            
wire             cp0_mmu_mxr;             
wire             cp0_mmu_ptw_en;          
wire             cp0_mmu_sum;             
wire    [1  :0]  cp0_priv_mode;           
wire             cp0_supv_mode;           
wire             cp0_user_mode;           
wire    [1  :0]  cp0_yy_priv_mode;        
wire             cpurst_b;                
wire             dutlb_xx_mmu_off;        
wire             forever_cpuclk;          
wire             jtlb_arb_cmp_va;         
wire             jtlb_arb_par_clr;        
wire             jtlb_arb_pfu_cmplt;      
wire    [26 :0]  jtlb_arb_pfu_vpn;        
wire             jtlb_arb_sel_1g;         
wire             jtlb_arb_sel_2m;         
wire             jtlb_arb_sel_4k;         
wire             jtlb_arb_tc_miss;        
wire    [2  :0]  jtlb_arb_type;           
wire    [26 :0]  jtlb_arb_vpn;            
wire             jtlb_clk;                
wire             jtlb_clk_en;             
wire    [2  :0]  jtlb_cur_pgs;            
wire             jtlb_data_cen0;          
wire             jtlb_data_cen1;          
wire    [83 :0]  jtlb_data_din;           
wire    [83 :0]  jtlb_data_dout0;         
wire    [83 :0]  jtlb_data_dout1;         
wire    [7  :0]  jtlb_data_idx;           
wire    [3  :0]  jtlb_data_wen;           
wire             jtlb_dutlb_acc_err;      
wire             jtlb_dutlb_pgflt;        
wire             jtlb_dutlb_ref_cmplt;    
wire             jtlb_dutlb_ref_pavld;    
wire             jtlb_iutlb_acc_err;      
wire             jtlb_iutlb_pgflt;        
wire             jtlb_iutlb_ref_cmplt;    
wire             jtlb_iutlb_ref_pavld;    
wire             jtlb_pfu_acc_fault;      
wire             jtlb_pfu_cmplt;          
wire             jtlb_pfu_deny;           
wire             jtlb_pfu_flag_fault;     
wire    [27 :0]  jtlb_pfu_pa;             
wire             jtlb_pfu_sec;            
wire             jtlb_pfu_share;          
wire             jtlb_ptw_req;            
wire    [2  :0]  jtlb_ptw_type;           
wire    [26 :0]  jtlb_ptw_vpn;            
wire             jtlb_regs_hit;           
wire             jtlb_regs_hit_mult;      
wire    [10 :0]  jtlb_regs_tlbp_hit_index; 
wire             jtlb_tag_cen;            
wire    [195:0]  jtlb_tag_din;            
wire    [195:0]  jtlb_tag_dout;           
wire    [7  :0]  jtlb_tag_idx;            
wire    [4  :0]  jtlb_tag_wen;            
wire             jtlb_tlboper_asid_hit;   
wire             jtlb_tlboper_cmplt;      
wire    [3  :0]  jtlb_tlboper_fifo;       
wire             jtlb_tlboper_read_idle;  
wire    [3  :0]  jtlb_tlboper_sel;        
wire             jtlb_tlboper_va_hit;     
wire    [15 :0]  jtlb_tlbr_asid;          
wire    [13 :0]  jtlb_tlbr_flg;           
wire             jtlb_tlbr_g;             
wire    [2  :0]  jtlb_tlbr_pgs;           
wire    [27 :0]  jtlb_tlbr_ppn;           
wire    [26 :0]  jtlb_tlbr_vpn;           
wire    [1  :0]  jtlb_top_cur_st;         
wire             jtlb_top_utlb_pavld;     
wire    [13 :0]  jtlb_utlb_ref_flg;       
wire    [2  :0]  jtlb_utlb_ref_pgs;       
wire    [27 :0]  jtlb_utlb_ref_ppn;       
wire    [26 :0]  jtlb_utlb_ref_vpn;       
wire    [11 :0]  jtlb_xx_fifo;            
wire             jtlb_xx_tc_read;         
wire    [27 :0]  lsu_mmu_va2;             
wire             lsu_mmu_va2_vld;         
wire    [27 :0]  mmu_lsu_pa2;             
wire             mmu_lsu_pa2_err;         
wire             mmu_lsu_pa2_vld;         
wire             mmu_lsu_sec2;            
wire             mmu_lsu_share2;          
wire    [27 :0]  mmu_pmp_pa4;             
wire    [27 :0]  mmu_sysmap_pa4;          
wire    [26 :0]  pa_offset;               
wire             pad_yy_icg_scan_en;      
wire             pfu_deny_st;             
wire             pfu_idle_st;             
wire             pfu_ok_st;               
wire    [3  :0]  pmp_mmu_flg4;            
wire    [26 :0]  ptw_arb_vpn;             
wire             ptw_jtlb_dmiss;          
wire             ptw_jtlb_imiss;          
wire             ptw_jtlb_pmiss;          
wire             ptw_jtlb_ref_acc_err;    
wire             ptw_jtlb_ref_cmplt;      
wire             ptw_jtlb_ref_data_vld;   
wire    [13 :0]  ptw_jtlb_ref_flg;        
wire             ptw_jtlb_ref_pgflt;      
wire    [2  :0]  ptw_jtlb_ref_pgs;        
wire    [27 :0]  ptw_jtlb_ref_ppn;        
wire    [27 :0]  ptw_pa2;                 
wire             read_cur_1g;             
wire             read_cur_2m;             
wire             read_cur_4k;             
wire             read_cur_idle;           
wire             read_fail_2m;            
wire             read_fail_4k;            
wire    [13 :0]  ref_flg;                 
wire    [2  :0]  ref_pgs;                 
wire    [27 :0]  ref_ppn;                 
wire    [26 :0]  ref_vpn;                 
wire    [15 :0]  regs_jtlb_cur_asid;      
wire    [4  :0]  sysmap_mmu_flg4;         
wire    [3  :0]  ta_idx_sel;              
wire    [3  :0]  ta_jtlb_fifo;            
wire    [41 :0]  ta_jtlb_way0_data;       
wire    [47 :0]  ta_jtlb_way0_tag;        
wire    [41 :0]  ta_jtlb_way1_data;       
wire    [47 :0]  ta_jtlb_way1_tag;        
wire    [41 :0]  ta_jtlb_way2_data;       
wire    [47 :0]  ta_jtlb_way2_tag;        
wire    [41 :0]  ta_jtlb_way3_data;       
wire    [47 :0]  ta_jtlb_way3_tag;        
wire    [26 :0]  ta_vpn_1g;               
wire    [26 :0]  ta_vpn_2m;               
wire    [26 :0]  ta_vpn_4k;               
wire    [26 :0]  ta_vpn_masked;           
wire    [15 :0]  ta_way0_asid;            
wire             ta_way0_g;               
wire             ta_way0_hit_kid0;        
wire             ta_way0_hit_kid1;        
wire             ta_way0_hit_kid2;        
wire             ta_way0_hit_kid3;        
wire             ta_way0_hit_kid4;        
wire             ta_way0_hit_kid5;        
wire    [2  :0]  ta_way0_pgs;             
wire             ta_way0_vld;             
wire    [26 :0]  ta_way0_vpn;             
wire    [15 :0]  ta_way1_asid;            
wire             ta_way1_g;               
wire             ta_way1_hit_kid0;        
wire             ta_way1_hit_kid1;        
wire             ta_way1_hit_kid2;        
wire             ta_way1_hit_kid3;        
wire             ta_way1_hit_kid4;        
wire             ta_way1_hit_kid5;        
wire    [2  :0]  ta_way1_pgs;             
wire             ta_way1_vld;             
wire    [26 :0]  ta_way1_vpn;             
wire    [15 :0]  ta_way2_asid;            
wire             ta_way2_g;               
wire             ta_way2_hit_kid0;        
wire             ta_way2_hit_kid1;        
wire             ta_way2_hit_kid2;        
wire             ta_way2_hit_kid3;        
wire             ta_way2_hit_kid4;        
wire             ta_way2_hit_kid5;        
wire    [2  :0]  ta_way2_pgs;             
wire             ta_way2_vld;             
wire    [26 :0]  ta_way2_vpn;             
wire    [15 :0]  ta_way3_asid;            
wire             ta_way3_g;               
wire             ta_way3_hit_kid0;        
wire             ta_way3_hit_kid1;        
wire             ta_way3_hit_kid2;        
wire             ta_way3_hit_kid3;        
wire             ta_way3_hit_kid4;        
wire             ta_way3_hit_kid5;        
wire    [2  :0]  ta_way3_pgs;             
wire             ta_way3_vld;             
wire    [26 :0]  ta_way3_vpn;             
wire             tag_fifo_wen;            
wire    [3  :0]  tag_way_wen;             
wire    [13 :0]  tc_hit_flg;              
wire    [1  :0]  tc_hit_idx;              
wire    [27 :0]  tc_hit_ppn;              
wire    [2  :0]  tc_hit_sum;              
wire    [15 :0]  tc_idx_asid;             
wire             tc_idx_g;                
wire    [2  :0]  tc_idx_pgs;              
wire    [26 :0]  tc_idx_vpn;              
wire             tc_pa_vld;               
wire             tc_par_fail;             
wire             tc_tlb_hit;              
wire             tc_tlb_hit_mult;         
wire             tc_tlb_miss;             
wire             tc_tlb_miss_fin;         
wire             tc_utlb_cmplt;           
wire    [26 :0]  tc_vpn_1g;               
wire    [26 :0]  tc_vpn_2m;               
wire    [26 :0]  tc_vpn_4k;               
wire    [26 :0]  tc_vpn_masked;           
wire             tc_way0_hit;             
wire             tc_way0_sel;             
wire             tc_way1_hit;             
wire             tc_way1_sel;             
wire             tc_way2_hit;             
wire             tc_way2_sel;             
wire             tc_way3_hit;             
wire             tc_way3_sel;             
wire    [15 :0]  tlboper_jtlb_asid;       
wire             tlboper_jtlb_asid_sel;   
wire             tlboper_jtlb_cmp_noasid; 
wire    [15 :0]  tlboper_jtlb_inv_asid;   
wire             tlboper_jtlb_tlbwr_on;   
wire    [2  :0]  tlboper_xx_pgs;          
wire             tlboper_xx_pgs_en;       


parameter VPN_WIDTH  = 39-12;  // VPN
parameter PPN_WIDTH  = 40-12;  // PPN
parameter FLG_WIDTH  = 14;     // Flags
parameter PGS_WIDTH  = 3;      // Page Size
parameter ASID_WIDTH = 16;     // Flags
parameter PTE_LEVEL  = 3;      // Page Table Label

// VPN width per level
parameter VPN_PERLEL = VPN_WIDTH/PTE_LEVEL; 

// Valid + VPN + ASID + PageSize + Global
parameter TAG_WIDTH  = 1+VPN_WIDTH+ASID_WIDTH+PGS_WIDTH+1;  
parameter DATA_WIDTH = PPN_WIDTH+FLG_WIDTH;  

//parameter WAY_NUM = 4;

//==========================================================
//                  Gate Cell
//==========================================================
assign jtlb_clk_en = arb_jtlb_req || ta_vld || tc_vld || !read_cur_idle
                  || !pfu_idle_st || ptw_jtlb_ref_cmplt
                  || lsu_mmu_va2_vld && dutlb_xx_mmu_off; 
// &Instance("gated_clk_cell", "x_jtlb_gateclk"); @53
gated_clk_cell  x_jtlb_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (jtlb_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (jtlb_clk_en       ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @54
//           .external_en(1'b0          ), @55
//           .global_en  (1'b1          ), @56
//           .module_en  (cp0_mmu_icg_en), @57
//           .local_en   (jtlb_clk_en   ), @58
//           .clk_out    (jtlb_clk      ) @59
//          ); @60


//==============================================================================
//                  Input to Memory ---  RB stage (Arbiter)
//==============================================================================
//==========================================================
//                  CEN & WEN
//==========================================================
//tag cen
assign jtlb_tag_cen       = arb_jtlb_req;

//tag wen
assign tag_fifo_wen       = arb_jtlb_fifo_write;
assign tag_way_wen[3:0]   = {4{arb_jtlb_write}} & arb_jtlb_bank_sel[3:0];
assign jtlb_tag_wen[4:0]  = {tag_fifo_wen, tag_way_wen[3:0]};

//data cen
assign jtlb_data_cen0     = arb_jtlb_req && (|arb_jtlb_bank_sel[1:0]);
assign jtlb_data_cen1     = arb_jtlb_req && (|arb_jtlb_bank_sel[3:2]);

//data wen
assign jtlb_data_wen[3:0] = {4{arb_jtlb_write}} & arb_jtlb_bank_sel[3:0]; 


//==========================================================
//                  Input Index
//==========================================================
// &Force("bus", "arb_jtlb_idx", 8, 0); @89
assign jtlb_tag_idx[7:0]  = arb_jtlb_idx[7:0];
assign jtlb_data_idx[7:0] = arb_jtlb_idx[7:0];



//==========================================================
//                  Input Data
//==========================================================
assign jtlb_tag_din[(TAG_WIDTH*4)+3:0] = {arb_jtlb_fifo_din[3:0],
                                          arb_jtlb_tag_din[TAG_WIDTH-1:0],
                                          arb_jtlb_tag_din[TAG_WIDTH-1:0],
                                          arb_jtlb_tag_din[TAG_WIDTH-1:0],
                                          arb_jtlb_tag_din[TAG_WIDTH-1:0]};

assign jtlb_data_din[(DATA_WIDTH*2)-1:0] = {arb_jtlb_data_din[DATA_WIDTH-1:0],
                                            arb_jtlb_data_din[DATA_WIDTH-1:0]}; 

//==========================================================
//                  jTLB Memory Instance
//==========================================================
// &Instance("ct_mmu_jtlb_tag_array"); @139
ct_mmu_jtlb_tag_array  x_ct_mmu_jtlb_tag_array (
  .cp0_mmu_icg_en     (cp0_mmu_icg_en    ),
  .forever_cpuclk     (forever_cpuclk    ),
  .jtlb_tag_cen       (jtlb_tag_cen      ),
  .jtlb_tag_din       (jtlb_tag_din      ),
  .jtlb_tag_dout      (jtlb_tag_dout     ),
  .jtlb_tag_idx       (jtlb_tag_idx      ),
  .jtlb_tag_wen       (jtlb_tag_wen      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &Instance("ct_mmu_jtlb_data_array"); @141
ct_mmu_jtlb_data_array  x_ct_mmu_jtlb_data_array (
  .cp0_mmu_icg_en     (cp0_mmu_icg_en    ),
  .forever_cpuclk     (forever_cpuclk    ),
  .jtlb_data_cen0     (jtlb_data_cen0    ),
  .jtlb_data_cen1     (jtlb_data_cen1    ),
  .jtlb_data_din      (jtlb_data_din     ),
  .jtlb_data_dout0    (jtlb_data_dout0   ),
  .jtlb_data_dout1    (jtlb_data_dout1   ),
  .jtlb_data_idx      (jtlb_data_idx     ),
  .jtlb_data_wen      (jtlb_data_wen     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);



//==============================================================================
//                  Output from Memory --- TA stage (TLB Access)
//==============================================================================
//==========================================================
//                  TA Valid
//==========================================================
always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ta_vld <= 1'b0;
  else if(arb_jtlb_req && arb_jtlb_acc_type[2:0] != 3'b0)
    ta_vld <= 1'b1;
  else
    ta_vld <= 1'b0;
end

//==========================================================
//                  Other Control Signal
//==========================================================
always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ta_vpn[VPN_WIDTH-1:0] <= {VPN_WIDTH{1'b0}};
    ta_cmp_va             <= 1'b0;
    ta_way_sel[3:0]       <= 4'b0;
    ta_acc_type[2:0]      <= 3'b0;
    ta_wen                <= 1'b0;
  end
  else if(arb_jtlb_req)
  begin
    ta_vpn[VPN_WIDTH-1:0] <= arb_jtlb_vpn[VPN_WIDTH-1:0];
    ta_cmp_va             <= arb_jtlb_cmp_with_va;
    ta_way_sel[3:0]       <= arb_jtlb_bank_sel[3:0];
    ta_acc_type[2:0]      <= arb_jtlb_acc_type[2:0];
    ta_wen                <= arb_jtlb_write;
  end
end


//==========================================================
//                  TAG & DATA Output
//==========================================================
assign ta_jtlb_way3_tag[TAG_WIDTH-1:0] = jtlb_tag_dout[(TAG_WIDTH*4)-1:TAG_WIDTH*3];
assign ta_jtlb_way2_tag[TAG_WIDTH-1:0] = jtlb_tag_dout[(TAG_WIDTH*3)-1:TAG_WIDTH*2];
assign ta_jtlb_way1_tag[TAG_WIDTH-1:0] = jtlb_tag_dout[(TAG_WIDTH*2)-1:TAG_WIDTH*1];
assign ta_jtlb_way0_tag[TAG_WIDTH-1:0] = jtlb_tag_dout[(TAG_WIDTH*1)-1:TAG_WIDTH*0];

assign ta_jtlb_way3_data[DATA_WIDTH-1:0] = jtlb_data_dout1[(DATA_WIDTH*2)-1:DATA_WIDTH*1];
assign ta_jtlb_way2_data[DATA_WIDTH-1:0] = jtlb_data_dout1[(DATA_WIDTH*1)-1:DATA_WIDTH*0];
assign ta_jtlb_way1_data[DATA_WIDTH-1:0] = jtlb_data_dout0[(DATA_WIDTH*2)-1:DATA_WIDTH*1];
assign ta_jtlb_way0_data[DATA_WIDTH-1:0] = jtlb_data_dout0[(DATA_WIDTH*1)-1:DATA_WIDTH*0];

// &Force("bus", "jtlb_tag_dout_inj", 203, 0); @201
// &Force("bus", "jtlb_data_dout1_inj", 87, 0); @202
// &Force("bus", "jtlb_data_dout0_inj", 87, 0); @203
assign ta_jtlb_fifo[3:0]     = jtlb_tag_dout[(TAG_WIDTH*4)+3:TAG_WIDTH*4];

//==========================================================
//                  Hit Info
//==========================================================
assign {ta_way3_vld, ta_way3_vpn[VPN_WIDTH-1:0], ta_way3_asid[ASID_WIDTH-1:0],
        ta_way3_pgs[PGS_WIDTH-1:0], ta_way3_g} = ta_jtlb_way3_tag[TAG_WIDTH-1:0];

assign {ta_way2_vld, ta_way2_vpn[VPN_WIDTH-1:0], ta_way2_asid[ASID_WIDTH-1:0],
        ta_way2_pgs[PGS_WIDTH-1:0], ta_way2_g} = ta_jtlb_way2_tag[TAG_WIDTH-1:0];

assign {ta_way1_vld, ta_way1_vpn[VPN_WIDTH-1:0], ta_way1_asid[ASID_WIDTH-1:0],
        ta_way1_pgs[PGS_WIDTH-1:0], ta_way1_g} = ta_jtlb_way1_tag[TAG_WIDTH-1:0];

assign {ta_way0_vld, ta_way0_vpn[VPN_WIDTH-1:0], ta_way0_asid[ASID_WIDTH-1:0],
        ta_way0_pgs[PGS_WIDTH-1:0], ta_way0_g} = ta_jtlb_way0_tag[TAG_WIDTH-1:0];

assign ta_vpn_4k[VPN_WIDTH-1:0] =  ta_vpn[VPN_WIDTH-1:0];
assign ta_vpn_2m[VPN_WIDTH-1:0] = {ta_vpn[VPN_WIDTH-1:VPN_PERLEL*1], {VPN_PERLEL*1{1'b0}}};
assign ta_vpn_1g[VPN_WIDTH-1:0] = {ta_vpn[VPN_WIDTH-1:VPN_PERLEL*2], {VPN_PERLEL*2{1'b0}}};
assign ta_vpn_masked[VPN_WIDTH-1:0] = {VPN_WIDTH{jtlb_cur_pgs[0]}} & ta_vpn_4k[VPN_WIDTH-1:0]
                                    | {VPN_WIDTH{jtlb_cur_pgs[1]}} & ta_vpn_2m[VPN_WIDTH-1:0]
                                    | {VPN_WIDTH{jtlb_cur_pgs[2]}} & ta_vpn_1g[VPN_WIDTH-1:0];
assign jtlb_cur_pgs[PGS_WIDTH-1:0] = tlboper_xx_pgs_en ? tlboper_xx_pgs[2:0]
                                                       : {read_cur_1g, read_cur_2m, read_cur_4k};
assign asid_for_va_hit[ASID_WIDTH-1:0] = tlboper_jtlb_asid_sel   
                                       ? tlboper_jtlb_asid[ASID_WIDTH-1:0]
                                       : regs_jtlb_cur_asid[ASID_WIDTH-1:0];

// way3 hit for timing
assign ta_way3_hit_kid0 = (ta_way3_vpn[VPN_PERLEL*1-1:0]   == ta_vpn_masked[VPN_PERLEL*1-1:0]);
assign ta_way3_hit_kid1 = (ta_way3_vpn[VPN_PERLEL*2-1:VPN_PERLEL*1]  == ta_vpn_masked[VPN_PERLEL*2-1:VPN_PERLEL*1])
                               && jtlb_cur_pgs[PGS_WIDTH-1:0] == ta_way3_pgs[PGS_WIDTH-1:0];
assign ta_way3_hit_kid2 = (ta_way3_vpn[VPN_WIDTH-1:VPN_PERLEL*2] == ta_vpn_masked[VPN_WIDTH-1:VPN_PERLEL*2])
                               && ta_way3_vld && ta_cmp_va;
assign ta_way3_hit_kid3 = (ta_way3_asid[VPN_PERLEL*1-1:0]   == asid_for_va_hit[VPN_PERLEL*1-1:0]);
assign ta_way3_hit_kid4 = (ta_way3_asid[ASID_WIDTH-1:VPN_PERLEL*1]  == asid_for_va_hit[ASID_WIDTH-1:VPN_PERLEL*1]);
assign ta_way3_hit_kid5 =  ta_way3_g || tlboper_jtlb_cmp_noasid;

// way2 hit for timing
assign ta_way2_hit_kid0 = (ta_way2_vpn[VPN_PERLEL*1-1:0]   == ta_vpn_masked[VPN_PERLEL*1-1:0]);
assign ta_way2_hit_kid1 = (ta_way2_vpn[VPN_PERLEL*2-1:VPN_PERLEL*1]  == ta_vpn_masked[VPN_PERLEL*2-1:VPN_PERLEL*1])
                               && jtlb_cur_pgs[PGS_WIDTH-1:0] == ta_way2_pgs[PGS_WIDTH-1:0];
assign ta_way2_hit_kid2 = (ta_way2_vpn[VPN_WIDTH-1:VPN_PERLEL*2] == ta_vpn_masked[VPN_WIDTH-1:VPN_PERLEL*2])
                               && ta_way2_vld && ta_cmp_va;
assign ta_way2_hit_kid3 = (ta_way2_asid[VPN_PERLEL*1-1:0]   == asid_for_va_hit[VPN_PERLEL*1-1:0]);
assign ta_way2_hit_kid4 = (ta_way2_asid[ASID_WIDTH-1:VPN_PERLEL*1]  == asid_for_va_hit[ASID_WIDTH-1:VPN_PERLEL*1]);
assign ta_way2_hit_kid5 =  ta_way2_g || tlboper_jtlb_cmp_noasid;

// way1 hit for timing
assign ta_way1_hit_kid0 = (ta_way1_vpn[VPN_PERLEL*1-1:0]   == ta_vpn_masked[VPN_PERLEL*1-1:0]);
assign ta_way1_hit_kid1 = (ta_way1_vpn[VPN_PERLEL*2-1:VPN_PERLEL*1]  == ta_vpn_masked[VPN_PERLEL*2-1:VPN_PERLEL*1])
                               && jtlb_cur_pgs[PGS_WIDTH-1:0] == ta_way1_pgs[PGS_WIDTH-1:0];
assign ta_way1_hit_kid2 = (ta_way1_vpn[VPN_WIDTH-1:VPN_PERLEL*2] == ta_vpn_masked[VPN_WIDTH-1:VPN_PERLEL*2])
                               && ta_way1_vld && ta_cmp_va;
assign ta_way1_hit_kid3 = (ta_way1_asid[VPN_PERLEL*1-1:0]   == asid_for_va_hit[VPN_PERLEL*1-1:0]);
assign ta_way1_hit_kid4 = (ta_way1_asid[ASID_WIDTH-1:VPN_PERLEL*1]  == asid_for_va_hit[ASID_WIDTH-1:VPN_PERLEL*1]);
assign ta_way1_hit_kid5 =  ta_way1_g || tlboper_jtlb_cmp_noasid;

// way0 hit for timing
assign ta_way0_hit_kid0 = (ta_way0_vpn[VPN_PERLEL*1-1:0]   == ta_vpn_masked[VPN_PERLEL*1-1:0]);
assign ta_way0_hit_kid1 = (ta_way0_vpn[VPN_PERLEL*2-1:VPN_PERLEL*1]  == ta_vpn_masked[VPN_PERLEL*2-1:VPN_PERLEL*1])
                               && jtlb_cur_pgs[PGS_WIDTH-1:0] == ta_way0_pgs[PGS_WIDTH-1:0];
assign ta_way0_hit_kid2 = (ta_way0_vpn[VPN_WIDTH-1:VPN_PERLEL*2] == ta_vpn_masked[VPN_WIDTH-1:VPN_PERLEL*2])
                               && ta_way0_vld && ta_cmp_va;
assign ta_way0_hit_kid3 = (ta_way0_asid[VPN_PERLEL*1-1:0]   == asid_for_va_hit[VPN_PERLEL*1-1:0]);
assign ta_way0_hit_kid4 = (ta_way0_asid[ASID_WIDTH-1:VPN_PERLEL*1]  == asid_for_va_hit[ASID_WIDTH-1:VPN_PERLEL*1]);
assign ta_way0_hit_kid5 =  ta_way0_g || tlboper_jtlb_cmp_noasid;


assign ta_idx_sel[3:0]  = ta_way_sel[3:0] & {4{!ta_cmp_va}}; 

//==============================================================================
//                  Compare for Hit --- TC stage (TLB Compare)
//==============================================================================
//==========================================================
//                  TC Valid
//==========================================================
always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    tc_vld <= 1'b0;
  else if(ta_vld)
    tc_vld <= 1'b1;
  else
    tc_vld <= 1'b0;
end

//==========================================================
//                  Other Control Signal
//==========================================================
// &CombBeg; @395
// &CombEnd; @403
assign tc_par_fail = 1'b0;

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_way3_hit_kid0 <= 1'b0;
    tc_way3_hit_kid1 <= 1'b0;
    tc_way3_hit_kid2 <= 1'b0;
    tc_way3_hit_kid3 <= 1'b0;
    tc_way3_hit_kid4 <= 1'b0;
    tc_way3_hit_kid5 <= 1'b0;
  end
  else if(ta_vld)
  begin
    tc_way3_hit_kid0 <= ta_way3_hit_kid0;
    tc_way3_hit_kid1 <= ta_way3_hit_kid1;
    tc_way3_hit_kid2 <= ta_way3_hit_kid2;
    tc_way3_hit_kid3 <= ta_way3_hit_kid3;
    tc_way3_hit_kid4 <= ta_way3_hit_kid4;
    tc_way3_hit_kid5 <= ta_way3_hit_kid5;
  end
end

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_way2_hit_kid0 <= 1'b0;
    tc_way2_hit_kid1 <= 1'b0;
    tc_way2_hit_kid2 <= 1'b0;
    tc_way2_hit_kid3 <= 1'b0;
    tc_way2_hit_kid4 <= 1'b0;
    tc_way2_hit_kid5 <= 1'b0;
  end
  else if(ta_vld)
  begin
    tc_way2_hit_kid0 <= ta_way2_hit_kid0;
    tc_way2_hit_kid1 <= ta_way2_hit_kid1;
    tc_way2_hit_kid2 <= ta_way2_hit_kid2;
    tc_way2_hit_kid3 <= ta_way2_hit_kid3;
    tc_way2_hit_kid4 <= ta_way2_hit_kid4;
    tc_way2_hit_kid5 <= ta_way2_hit_kid5;
  end
end

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_way1_hit_kid0 <= 1'b0;
    tc_way1_hit_kid1 <= 1'b0;
    tc_way1_hit_kid2 <= 1'b0;
    tc_way1_hit_kid3 <= 1'b0;
    tc_way1_hit_kid4 <= 1'b0;
    tc_way1_hit_kid5 <= 1'b0;
  end
  else if(ta_vld)
  begin
    tc_way1_hit_kid0 <= ta_way1_hit_kid0;
    tc_way1_hit_kid1 <= ta_way1_hit_kid1;
    tc_way1_hit_kid2 <= ta_way1_hit_kid2;
    tc_way1_hit_kid3 <= ta_way1_hit_kid3;
    tc_way1_hit_kid4 <= ta_way1_hit_kid4;
    tc_way1_hit_kid5 <= ta_way1_hit_kid5;
  end
end

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_way0_hit_kid0 <= 1'b0;
    tc_way0_hit_kid1 <= 1'b0;
    tc_way0_hit_kid2 <= 1'b0;
    tc_way0_hit_kid3 <= 1'b0;
    tc_way0_hit_kid4 <= 1'b0;
    tc_way0_hit_kid5 <= 1'b0;
  end
  else if(ta_vld)
  begin
    tc_way0_hit_kid0 <= ta_way0_hit_kid0;
    tc_way0_hit_kid1 <= ta_way0_hit_kid1;
    tc_way0_hit_kid2 <= ta_way0_hit_kid2;
    tc_way0_hit_kid3 <= ta_way0_hit_kid3;
    tc_way0_hit_kid4 <= ta_way0_hit_kid4;
    tc_way0_hit_kid5 <= ta_way0_hit_kid5;
  end
end

assign tc_way3_hit = tc_way3_hit_kid0 && tc_way3_hit_kid1 && tc_way3_hit_kid2 
                 && (tc_way3_hit_kid3 && tc_way3_hit_kid4 || tc_way3_hit_kid5);

assign tc_way2_hit = tc_way2_hit_kid0 && tc_way2_hit_kid1 && tc_way2_hit_kid2
                 && (tc_way2_hit_kid3 && tc_way2_hit_kid4 || tc_way2_hit_kid5);

assign tc_way1_hit = tc_way1_hit_kid0 && tc_way1_hit_kid1 && tc_way1_hit_kid2
                 && (tc_way1_hit_kid3 && tc_way1_hit_kid4 || tc_way1_hit_kid5);

assign tc_way0_hit = tc_way0_hit_kid0 && tc_way0_hit_kid1 && tc_way0_hit_kid2
                 && (tc_way0_hit_kid3 && tc_way0_hit_kid4 || tc_way0_hit_kid5);

// &CombBeg; @523
always @( ta_jtlb_fifo[3:0]
       or tc_jtlb_fifo[11:0]
       or read_cur_2m
       or read_cur_4k
       or read_cur_1g)
begin
case({read_cur_1g, read_cur_2m, read_cur_4k})
  3'b001:  ta_jtlb_fifo_upd[11:0] = {tc_jtlb_fifo[11:4], ta_jtlb_fifo[3:0]};
  3'b010:  ta_jtlb_fifo_upd[11:0] = {tc_jtlb_fifo[11:8], ta_jtlb_fifo[3:0], tc_jtlb_fifo[3:0]};
  3'b100:  ta_jtlb_fifo_upd[11:0] = {ta_jtlb_fifo[3:0], tc_jtlb_fifo[7:0]};
  default: ta_jtlb_fifo_upd[11:0] = {tc_jtlb_fifo[11:4], ta_jtlb_fifo[3:0]};
endcase
// &CombEnd; @530
end

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_vpn[VPN_WIDTH-1:0] <= {VPN_WIDTH{1'b0}};
    tc_way_sel[3:0]       <= 4'b0;
    tc_jtlb_fifo[11:0]    <= 12'b0;
    tc_acc_type[2:0]      <= 3'b0;
    tc_wen                <= 1'b0;
    tc_cmp_va             <= 1'b0;
  end
  else if(ta_vld)
  begin
    tc_vpn[VPN_WIDTH-1:0] <= ta_vpn[VPN_WIDTH-1:0];
    tc_way_sel[3:0]       <= ta_idx_sel[3:0];
    tc_jtlb_fifo[11:0]    <= ta_jtlb_fifo_upd[11:0];
    tc_acc_type[2:0]      <= ta_acc_type[2:0];
    tc_wen                <= ta_wen;
    tc_cmp_va             <= ta_cmp_va;
  end
end

assign tc_hit_idx[1:0] = {2{tc_way3_hit}} & 2'b11
                       | {2{tc_way2_hit}} & 2'b10
                       | {2{tc_way1_hit}} & 2'b01
                       | {2{tc_way0_hit}} & 2'b00;

// 1. for ptw record fifo
// 2. for tlb_wr
assign jtlb_xx_fifo[11:0] = tc_jtlb_fifo[11:0];

//==========================================================
//                  PFN & Flag
//==========================================================
always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_way3_vpn[VPN_WIDTH-1:0]   <= {VPN_WIDTH{1'b0}};
    tc_way3_pgs[PGS_WIDTH-1:0]   <= {PGS_WIDTH{1'b0}};
    tc_way3_asid[ASID_WIDTH-1:0] <= {ASID_WIDTH{1'b0}};
    tc_way3_g                    <= 1'b0;
    tc_way3_ppn[PPN_WIDTH-1:0]   <= {PPN_WIDTH{1'b0}};
    tc_way3_flg[FLG_WIDTH-1:0]   <= {FLG_WIDTH{1'b0}};
  end
  else if(ta_vld)
  begin
    tc_way3_vpn[VPN_WIDTH-1:0]   <= ta_way3_vpn[VPN_WIDTH-1:0];
    tc_way3_pgs[PGS_WIDTH-1:0]   <= ta_way3_pgs[PGS_WIDTH-1:0];
    tc_way3_asid[ASID_WIDTH-1:0] <= ta_way3_asid[ASID_WIDTH-1:0];
    tc_way3_g                    <= ta_way3_g;
    tc_way3_ppn[PPN_WIDTH-1:0]   <= ta_jtlb_way3_data[DATA_WIDTH-1:FLG_WIDTH];
    tc_way3_flg[FLG_WIDTH-1:0]   <= ta_jtlb_way3_data[FLG_WIDTH-1:0];
  end
end

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_way2_vpn[VPN_WIDTH-1:0]   <= {VPN_WIDTH{1'b0}};
    tc_way2_pgs[PGS_WIDTH-1:0]   <= {PGS_WIDTH{1'b0}};
    tc_way2_asid[ASID_WIDTH-1:0] <= {ASID_WIDTH{1'b0}};
    tc_way2_g                    <= 1'b0;
    tc_way2_ppn[PPN_WIDTH-1:0]   <= {PPN_WIDTH{1'b0}};
    tc_way2_flg[FLG_WIDTH-1:0]   <= {FLG_WIDTH{1'b0}};
  end
  else if(ta_vld)
  begin
    tc_way2_vpn[VPN_WIDTH-1:0]   <= ta_way2_vpn[VPN_WIDTH-1:0];
    tc_way2_pgs[PGS_WIDTH-1:0]   <= ta_way2_pgs[PGS_WIDTH-1:0];
    tc_way2_asid[ASID_WIDTH-1:0] <= ta_way2_asid[ASID_WIDTH-1:0];
    tc_way2_g                    <= ta_way2_g;
    tc_way2_ppn[PPN_WIDTH-1:0]   <= ta_jtlb_way2_data[DATA_WIDTH-1:FLG_WIDTH];
    tc_way2_flg[FLG_WIDTH-1:0]   <= ta_jtlb_way2_data[FLG_WIDTH-1:0];
  end
end

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_way1_vpn[VPN_WIDTH-1:0]   <= {VPN_WIDTH{1'b0}};
    tc_way1_pgs[PGS_WIDTH-1:0]   <= {PGS_WIDTH{1'b0}};
    tc_way1_asid[ASID_WIDTH-1:0] <= {ASID_WIDTH{1'b0}};
    tc_way1_g                    <= 1'b0;
    tc_way1_ppn[PPN_WIDTH-1:0]   <= {PPN_WIDTH{1'b0}};
    tc_way1_flg[FLG_WIDTH-1:0]   <= {FLG_WIDTH{1'b0}};
  end
  else if(ta_vld)
  begin
    tc_way1_vpn[VPN_WIDTH-1:0]   <= ta_way1_vpn[VPN_WIDTH-1:0];
    tc_way1_pgs[PGS_WIDTH-1:0]   <= ta_way1_pgs[PGS_WIDTH-1:0];
    tc_way1_asid[ASID_WIDTH-1:0] <= ta_way1_asid[ASID_WIDTH-1:0];
    tc_way1_g                    <= ta_way1_g;
    tc_way1_ppn[PPN_WIDTH-1:0]   <= ta_jtlb_way1_data[DATA_WIDTH-1:FLG_WIDTH];
    tc_way1_flg[FLG_WIDTH-1:0]   <= ta_jtlb_way1_data[FLG_WIDTH-1:0];
  end
end

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    tc_way0_vpn[VPN_WIDTH-1:0]   <= {VPN_WIDTH{1'b0}};
    tc_way0_pgs[PGS_WIDTH-1:0]   <= {PGS_WIDTH{1'b0}};
    tc_way0_asid[ASID_WIDTH-1:0] <= {ASID_WIDTH{1'b0}};
    tc_way0_g                    <= 1'b0;
    tc_way0_ppn[PPN_WIDTH-1:0]   <= {PPN_WIDTH{1'b0}};
    tc_way0_flg[FLG_WIDTH-1:0]   <= {FLG_WIDTH{1'b0}};
  end
  else if(ta_vld)
  begin
    tc_way0_vpn[VPN_WIDTH-1:0]   <= ta_way0_vpn[VPN_WIDTH-1:0];
    tc_way0_pgs[PGS_WIDTH-1:0]   <= ta_way0_pgs[PGS_WIDTH-1:0];
    tc_way0_asid[ASID_WIDTH-1:0] <= ta_way0_asid[ASID_WIDTH-1:0];
    tc_way0_g                    <= ta_way0_g;
    tc_way0_ppn[PPN_WIDTH-1:0]   <= ta_jtlb_way0_data[DATA_WIDTH-1:FLG_WIDTH];
    tc_way0_flg[FLG_WIDTH-1:0]   <= ta_jtlb_way0_data[FLG_WIDTH-1:0];
  end
end

//==========================================================
// PTEs with different page sizes are mixed in JTLB.
// So the read of JTLB is split into three step:
// 1. Assume the requesting entry is 4K size
// 2. Assume the requesting entry is 2M size
// 3. Assume the requesting entry is 1G size
// After three steps, if still miss, there is a JTLB miss.
//==========================================================
//                  Read FSM
//==========================================================
parameter READ_IDLE    = 3'b000,
          READ_4K      = 3'b001,
          READ_4K_FAIL = 3'b101,
          READ_2M      = 3'b010,
          READ_2M_FAIL = 3'b110,
          READ_1G      = 3'b011;

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    read_cur_st[2:0] <= READ_IDLE;
  else
    read_cur_st[2:0] <= read_nxt_st[2:0];
end 

// &CombBeg; @679
always @( read_cur_st
       or arb_jtlb_cmp_with_va
       or tc_vld
       or tc_cmp_va
       or tc_par_fail
       or tc_tlb_miss
       or arb_jtlb_acc_type[2:0])
begin
case (read_cur_st)
  READ_IDLE:
  begin
    if(arb_jtlb_cmp_with_va && arb_jtlb_acc_type[2:0] != 3'b001)
      read_nxt_st[2:0] = READ_4K;
    else
      read_nxt_st[2:0] = READ_IDLE;
  end
  READ_4K:
  begin
    if(tc_vld && tc_cmp_va)
      if(tc_tlb_miss && !tc_par_fail)
        read_nxt_st[2:0] = READ_2M;
      else if(tc_par_fail)
        read_nxt_st[2:0] = READ_4K_FAIL;
      else
        read_nxt_st[2:0] = READ_IDLE;
    else
      read_nxt_st[2:0] = READ_4K;
  end
  READ_2M:
  begin
    if(tc_vld && tc_cmp_va)
      if(tc_tlb_miss && !tc_par_fail)
        read_nxt_st[2:0] = READ_1G;
      else if(tc_par_fail)
        read_nxt_st[2:0] = READ_2M_FAIL;
      else
        read_nxt_st[2:0] = READ_IDLE;
    else
      read_nxt_st[2:0] = READ_2M;
  end
  READ_1G:
  begin
    if(tc_vld && tc_cmp_va)
      read_nxt_st[2:0] = READ_IDLE;
    else
      read_nxt_st[2:0] = READ_1G;
  end
  READ_4K_FAIL: 
    read_nxt_st[2:0] = READ_2M;
  READ_2M_FAIL: 
    read_nxt_st[2:0] = READ_1G;
  default: 
    read_nxt_st[2:0] = READ_IDLE;
endcase
// &CombEnd @726
end

assign read_cur_idle = read_cur_st[2:0] == READ_IDLE;
assign read_cur_4k   = read_cur_st[2:0] == READ_4K;
assign read_cur_2m   = read_cur_st[2:0] == READ_2M;
assign read_cur_1g   = read_cur_st[2:0] == READ_1G;
assign read_fail_4k  = read_cur_st[2:0] == READ_4K_FAIL;
assign read_fail_2m  = read_cur_st[2:0] == READ_2M_FAIL;

assign jtlb_arb_sel_4k = read_cur_idle;
assign jtlb_arb_sel_2m = read_cur_4k && tc_vld && tc_cmp_va || read_fail_4k;
assign jtlb_arb_sel_1g = read_cur_2m && tc_vld && tc_cmp_va || read_fail_2m;
assign jtlb_arb_cmp_va = tc_cmp_va && !tc_par_fail || read_fail_4k || read_fail_2m;
assign jtlb_arb_tc_miss = tc_tlb_miss || read_fail_4k || read_fail_2m;

assign jtlb_arb_vpn[VPN_WIDTH-1:0] = tc_vpn[VPN_WIDTH-1:0];
assign jtlb_arb_type[2:0]          = tc_acc_type[2:0];
//==========================================================
//                  Result Generation
//==========================================================
assign tc_hit_sum[2:0] = {2'b0,tc_way3_hit} + {2'b0,tc_way2_hit}
                       + {2'b0,tc_way1_hit} + {2'b0,tc_way0_hit}; 

assign tc_tlb_miss     = (tc_hit_sum[2:0] == 3'b000);
//assign tc_tlb_hit_raw  = (tc_hit_sum[2:0] == 3'b001);
assign tc_tlb_hit      = (tc_hit_sum[2:0] == 3'b001) && !tc_par_fail;
assign tc_tlb_hit_mult = !tc_tlb_miss && !tc_tlb_hit && !tc_par_fail;

assign tc_tlb_miss_fin = (tc_vld && tc_cmp_va && tc_tlb_miss || tc_par_fail) && read_cur_1g;
                       //|| tc_vld && tc_cmp_va && !tc_tlb_miss && tc_par_fail;

assign jtlb_xx_tc_read = !tc_wen;

// tc pa vld signal
assign tc_pa_vld = tc_vld && tc_tlb_hit;


assign tc_way3_sel = tc_way3_hit || tc_way_sel[3];
assign tc_way2_sel = tc_way2_hit || tc_way_sel[2];
assign tc_way1_sel = tc_way1_hit || tc_way_sel[1];
assign tc_way0_sel = tc_way0_hit || tc_way_sel[0];

// for tlbr
assign tc_idx_vpn[VPN_WIDTH-1:0] = {VPN_WIDTH{tc_way_sel[3]}} & tc_way3_vpn[VPN_WIDTH-1:0]
                                 | {VPN_WIDTH{tc_way_sel[2]}} & tc_way2_vpn[VPN_WIDTH-1:0]
                                 | {VPN_WIDTH{tc_way_sel[1]}} & tc_way1_vpn[VPN_WIDTH-1:0]
                                 | {VPN_WIDTH{tc_way_sel[0]}} & tc_way0_vpn[VPN_WIDTH-1:0];
assign tc_idx_pgs[PGS_WIDTH-1:0] = {PGS_WIDTH{tc_way_sel[3]}} & tc_way3_pgs[PGS_WIDTH-1:0]
                                 | {PGS_WIDTH{tc_way_sel[2]}} & tc_way2_pgs[PGS_WIDTH-1:0]
                                 | {PGS_WIDTH{tc_way_sel[1]}} & tc_way1_pgs[PGS_WIDTH-1:0]
                                 | {PGS_WIDTH{tc_way_sel[0]}} & tc_way0_pgs[PGS_WIDTH-1:0];
assign tc_idx_asid[ASID_WIDTH-1:0] = {ASID_WIDTH{tc_way_sel[3]}} & tc_way3_asid[ASID_WIDTH-1:0]
                                   | {ASID_WIDTH{tc_way_sel[2]}} & tc_way2_asid[ASID_WIDTH-1:0]
                                   | {ASID_WIDTH{tc_way_sel[1]}} & tc_way1_asid[ASID_WIDTH-1:0]
                                   | {ASID_WIDTH{tc_way_sel[0]}} & tc_way0_asid[ASID_WIDTH-1:0];
assign tc_idx_g          =     tc_way_sel[3]   & tc_way3_g
                         |     tc_way_sel[2]   & tc_way2_g 
                         |     tc_way_sel[1]   & tc_way1_g 
                         |     tc_way_sel[0]   & tc_way0_g;

assign tc_hit_ppn[PPN_WIDTH-1:0] = {PPN_WIDTH{tc_way3_sel}} & tc_way3_ppn[PPN_WIDTH-1:0]
                                 | {PPN_WIDTH{tc_way2_sel}} & tc_way2_ppn[PPN_WIDTH-1:0]
                                 | {PPN_WIDTH{tc_way1_sel}} & tc_way1_ppn[PPN_WIDTH-1:0]
                                 | {PPN_WIDTH{tc_way0_sel}} & tc_way0_ppn[PPN_WIDTH-1:0];
assign tc_hit_flg[FLG_WIDTH-1:0]  = {FLG_WIDTH{tc_way3_sel}} & tc_way3_flg[FLG_WIDTH-1:0]
                                  | {FLG_WIDTH{tc_way2_sel}} & tc_way2_flg[FLG_WIDTH-1:0]
                                  | {FLG_WIDTH{tc_way1_sel}} & tc_way1_flg[FLG_WIDTH-1:0]
                                  | {FLG_WIDTH{tc_way0_sel}} & tc_way0_flg[FLG_WIDTH-1:0];

//----------------------------------------------------------
//                  Req to ARB to invalid Parity Fail entry
//----------------------------------------------------------
assign jtlb_arb_par_clr = tc_par_fail;

//----------------------------------------------------------
//                  Req to PTW 
//----------------------------------------------------------
assign jtlb_ptw_req = tc_vld && cp0_mmu_ptw_en && tc_tlb_miss_fin 
                   && {tc_acc_type[1] || tc_acc_type[2]};
assign jtlb_ptw_vpn[VPN_WIDTH-1:0] = tc_vpn[VPN_WIDTH-1:0];
assign jtlb_ptw_type[2:0] = tc_acc_type[2:0];


//----------------------------------------------------------
//                  Result to TLB oper
//----------------------------------------------------------
// cmplt
assign jtlb_tlboper_cmplt = tc_vld && (tc_acc_type[2:0] == 3'b001);

// tlb read idle
assign jtlb_tlboper_read_idle = read_cur_idle;

// for tlbp
assign jtlb_regs_hit                 = tc_tlb_hit; 
assign jtlb_regs_hit_mult            = tc_tlb_hit_mult;

assign tc_vpn_4k[VPN_WIDTH-1:0] =  tc_vpn[VPN_WIDTH-1:0];
assign tc_vpn_2m[VPN_WIDTH-1:0] = {{VPN_PERLEL*1{1'b0}}, tc_vpn[VPN_WIDTH-1:VPN_PERLEL*1]};
assign tc_vpn_1g[VPN_WIDTH-1:0] = {{VPN_PERLEL*2{1'b0}}, tc_vpn[VPN_WIDTH-1:VPN_PERLEL*2]};
assign tc_vpn_masked[VPN_WIDTH-1:0] = {VPN_WIDTH{tlboper_xx_pgs[0]}} & tc_vpn_4k[VPN_WIDTH-1:0]
                                    | {VPN_WIDTH{tlboper_xx_pgs[1]}} & tc_vpn_2m[VPN_WIDTH-1:0]
                                    | {VPN_WIDTH{tlboper_xx_pgs[2]}} & tc_vpn_1g[VPN_WIDTH-1:0];
assign jtlb_regs_tlbp_hit_index[10:0] = {1'b0, tc_hit_idx[1:0], tc_vpn_masked[7:0]};

// for tlbr
assign jtlb_tlbr_vpn[VPN_WIDTH-1:0]   = tc_idx_vpn[VPN_WIDTH-1:0];
assign jtlb_tlbr_pgs[PGS_WIDTH-1:0]   = tc_idx_pgs[PGS_WIDTH-1:0];
assign jtlb_tlbr_asid[ASID_WIDTH-1:0] = tc_idx_asid[ASID_WIDTH-1:0];
assign jtlb_tlbr_ppn[PPN_WIDTH-1:0]   = tc_hit_ppn[PPN_WIDTH-1:0];
assign jtlb_tlbr_flg[FLG_WIDTH-1:0]   = tc_hit_flg[FLG_WIDTH-1:0];
assign jtlb_tlbr_g                    = tc_idx_g;

//for inv asid
assign jtlb_tlboper_asid_hit = (tc_idx_asid[ASID_WIDTH-1:0] == tlboper_jtlb_inv_asid[ASID_WIDTH-1:0]) && !tc_idx_g;
// wen sel for tlbwr and invva
assign jtlb_tlboper_fifo[3:0] = tc_jtlb_fifo[3:0];
assign jtlb_tlboper_sel[3:0] = tlboper_jtlb_tlbwr_on ? tc_jtlb_fifo[3:0]
                                                     : {tc_way3_hit,
                                                        tc_way2_hit,
                                                        tc_way1_hit,
                                                        tc_way0_hit};
assign jtlb_tlboper_va_hit = tc_way3_hit || tc_way2_hit || tc_way1_hit || tc_way0_hit;

//----------------------------------------------------------
//                  Result to uTLB
//----------------------------------------------------------
assign tc_utlb_cmplt        = tc_vld && !tc_par_fail
                           && (!cp0_mmu_ptw_en && read_cur_1g
                              || !tc_tlb_miss);
assign jtlb_iutlb_ref_cmplt = tc_utlb_cmplt     
                                 && (tc_acc_type[2:0] == 3'b011)
                           || ptw_jtlb_ref_cmplt
                                 && ptw_jtlb_imiss; 

assign jtlb_iutlb_ref_pavld = tc_pa_vld
                                 && (tc_acc_type[2:0] == 3'b011)
                           || ptw_jtlb_ref_data_vld
                                 && ptw_jtlb_imiss;

assign jtlb_iutlb_acc_err   = ptw_jtlb_ref_acc_err
                                 && ptw_jtlb_imiss;

assign jtlb_iutlb_pgflt     = ptw_jtlb_ref_pgflt
                                 && ptw_jtlb_imiss
                           || tc_vld && tc_tlb_hit_mult
                                 && (tc_acc_type[2:0] == 3'b011)
                           || tc_vld && !cp0_mmu_ptw_en && tc_tlb_miss_fin
                                 && (tc_acc_type[2:0] == 3'b011);


assign jtlb_dutlb_ref_cmplt = tc_utlb_cmplt 
                                 && (tc_acc_type[1:0] == 2'b10)
                           || ptw_jtlb_ref_cmplt
                                 && ptw_jtlb_dmiss;

assign jtlb_dutlb_ref_pavld = tc_pa_vld
                                 && (tc_acc_type[1:0] == 2'b10)
                           || ptw_jtlb_ref_data_vld
                                 && ptw_jtlb_dmiss;

assign jtlb_dutlb_pgflt     = ptw_jtlb_ref_pgflt
                                 && ptw_jtlb_dmiss
                           || tc_vld && tc_tlb_hit_mult 
                                 && (tc_acc_type[1:0] == 2'b10)
                           || tc_vld && !cp0_mmu_ptw_en && tc_tlb_miss_fin
                                 && (tc_acc_type[1:0] == 2'b10);

assign jtlb_dutlb_acc_err   = ptw_jtlb_ref_acc_err
                                 && ptw_jtlb_dmiss;


//==========================================================
//                  Read FSM
//==========================================================
parameter PFU_IDLE = 2'b00,
          PFU_CHK  = 2'b01,
          PFU_DENY = 2'b10,
          PFU_OK   = 2'b11;

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_cur_st[1:0] <= PFU_IDLE;
  else
    pfu_cur_st[1:0] <= pfu_nxt_st[1:0];
end 

// &CombBeg; @918
always @( jtlb_pfu_acc_fault
       or jtlb_pfu_cmplt
       or jtlb_pfu_deny
       or pfu_cur_st[1:0])
begin
case (pfu_cur_st[1:0])
  PFU_IDLE:
  begin
    if(jtlb_pfu_cmplt)
      if(jtlb_pfu_acc_fault)
        pfu_nxt_st[1:0] = PFU_DENY;
      else
        pfu_nxt_st[1:0] = PFU_CHK;
    else
      pfu_nxt_st[1:0] = PFU_IDLE;
  end
  PFU_CHK:
  begin
    if(jtlb_pfu_deny)
      pfu_nxt_st[1:0] = PFU_DENY;
    else
      pfu_nxt_st[1:0] = PFU_OK;
  end
  PFU_DENY:
  begin
    pfu_nxt_st[1:0] = PFU_IDLE;
  end
  PFU_OK:
  begin
    pfu_nxt_st[1:0] = PFU_IDLE;
  end
  default:
  begin
    pfu_nxt_st[1:0] = PFU_IDLE;
  end
endcase
// &CombEnd; @950
end

always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_off_chk <= 1'b0;
  else if(lsu_mmu_va2_vld && dutlb_xx_mmu_off && (arb_top_cur_st[1:0] == 2'b0) && pfu_idle_st)
    pfu_off_chk <= 1'b1;
  else if(pfu_ok_st || pfu_deny_st)
    pfu_off_chk <= 1'b0;
end 

assign pfu_idle_st = pfu_cur_st[1:0] == PFU_IDLE;
assign pfu_deny_st = pfu_cur_st[1:0] == PFU_DENY;
assign pfu_ok_st   = pfu_cur_st[1:0] == PFU_OK;

assign jtlb_pfu_cmplt     = tc_vld && (tc_tlb_hit
                                    || tc_tlb_hit_mult 
                                    || !cp0_mmu_ptw_en && tc_tlb_miss_fin)
                                 && (tc_acc_type[2:0] == 3'b100)
                           || ptw_jtlb_ref_cmplt && ptw_jtlb_pmiss
                           || lsu_mmu_va2_vld && dutlb_xx_mmu_off && (arb_top_cur_st[1:0] == 2'b0);

assign jtlb_pfu_flag_fault =  !tc_hit_flg[0]
                           || !tc_hit_flg[1] && tc_hit_flg[2]
                           || !tc_hit_flg[1] && !(cp0_mmu_mxr && tc_hit_flg[3])
                           ||  tc_hit_flg[4] && cp0_supv_mode && !cp0_mmu_sum
                           || !tc_hit_flg[4] && cp0_user_mode
                           || !tc_hit_flg[5]
                           || (cp0_mmu_maee ? (tc_hit_flg[13] || !tc_hit_flg[12])
                                            : (sysmap_mmu_flg4[4] || !sysmap_mmu_flg4[3]));

assign jtlb_pfu_acc_fault = tc_vld && (tc_tlb_hit_mult 
                                       || !cp0_mmu_ptw_en && tc_tlb_miss_fin)
                                 && (tc_acc_type[2:0] == 3'b100)
                           || tc_pa_vld && (tc_acc_type[2:0] == 3'b100)
                              && jtlb_pfu_flag_fault
                           || lsu_mmu_va2_vld && dutlb_xx_mmu_off && (arb_top_cur_st[1:0] == 2'b0)
                              && (sysmap_mmu_flg4[4] || !sysmap_mmu_flg4[3])
                           || ptw_jtlb_ref_cmplt && ptw_jtlb_pmiss
                              && (ptw_jtlb_ref_flg[13] || !ptw_jtlb_ref_flg[12] 
                                 || ptw_jtlb_ref_pgflt || ptw_jtlb_ref_acc_err);


// &Force("bus", "sysmap_mmu_flg4", 4, 0); @994
assign pa_offset[VPN_WIDTH-1:0]   = lsu_mmu_va2[VPN_WIDTH-1:0];
assign ptw_pa2[PPN_WIDTH-1:0]     = 
     {PPN_WIDTH{ref_pgs[2]}} & {ref_ppn[PPN_WIDTH-1:VPN_PERLEL*2], pa_offset[VPN_PERLEL*2-1:0]}
   | {PPN_WIDTH{ref_pgs[1]}} & {ref_ppn[PPN_WIDTH-1:VPN_PERLEL*1], pa_offset[VPN_PERLEL*1-1:0]}
   | {PPN_WIDTH{ref_pgs[0]}} &  ref_ppn[PPN_WIDTH-1:0];

assign jtlb_pfu_pa[PPN_WIDTH-1:0] = dutlb_xx_mmu_off ? lsu_mmu_va2[PPN_WIDTH-1:0] 
                                                      : ptw_pa2[PPN_WIDTH-1:0];
assign jtlb_pfu_sec               = (dutlb_xx_mmu_off || !cp0_mmu_maee) ? sysmap_mmu_flg4[0] : ref_flg[9];
assign jtlb_pfu_share             = (dutlb_xx_mmu_off || !cp0_mmu_maee) ? sysmap_mmu_flg4[1] : ref_flg[10];

// flop pa for pmp check
always @(posedge jtlb_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pfu_pa_buf[PPN_WIDTH-1:0] <= {PPN_WIDTH{1'b0}};
    pfu_sec_buf               <= 1'b0;
    pfu_share_buf             <= 1'b0;
  end
  else if(pfu_idle_st && jtlb_pfu_cmplt)
  begin
    pfu_pa_buf[PPN_WIDTH-1:0] <= jtlb_pfu_pa[PPN_WIDTH-1:0];
    pfu_sec_buf               <= jtlb_pfu_sec;
    pfu_share_buf             <= jtlb_pfu_share;
  end
end

// result to arb
assign jtlb_arb_pfu_cmplt = (pfu_ok_st || pfu_deny_st) && !pfu_off_chk;
assign jtlb_arb_pfu_vpn[VPN_WIDTH-1:0] = lsu_mmu_va2[VPN_WIDTH-1:0];

// addr to pmp
assign mmu_pmp_pa4[PPN_WIDTH-1:0] = pfu_pa_buf[PPN_WIDTH-1:0];

// addr to sysmap
assign mmu_sysmap_pa4[PPN_WIDTH-1:0] = lsu_mmu_va2[PPN_WIDTH-1:0];

// pmp result
assign cp0_priv_mode[1:0] = cp0_mmu_mprv ? cp0_mmu_mpp[1:0]
                                         : cp0_yy_priv_mode[1:0];
assign cp0_user_mode = cp0_priv_mode[1:0] == 2'b00;
assign cp0_supv_mode = cp0_priv_mode[1:0] == 2'b01;
assign cp0_mach_mode = cp0_priv_mode[1:0] == 2'b11;

// &Force("bus", "pmp_mmu_flg4", 3, 0); @1040
assign jtlb_pfu_deny = !pmp_mmu_flg4[0]
                     && !(cp0_mach_mode && !pmp_mmu_flg4[3]);  // L-bit for M-Mode

// result to lsu pfu
assign mmu_lsu_pa2_vld    = pfu_ok_st || pfu_deny_st;
assign mmu_lsu_pa2_err    = pfu_deny_st;
assign mmu_lsu_pa2[PPN_WIDTH-1:0] = pfu_pa_buf[PPN_WIDTH-1:0];
assign mmu_lsu_sec2   = pfu_sec_buf;
assign mmu_lsu_share2 = pfu_share_buf;

//vpn & ppn & flag
assign ref_vpn[VPN_WIDTH-1:0] = ptw_jtlb_ref_cmplt ? ptw_arb_vpn[VPN_WIDTH-1:0]
                                          : tc_vpn[VPN_WIDTH-1:0];
assign ref_pgs[PGS_WIDTH-1:0] = ptw_jtlb_ref_cmplt ? ptw_jtlb_ref_pgs[PGS_WIDTH-1:0]
                                          : jtlb_cur_pgs[PGS_WIDTH-1:0];
assign ref_ppn[PPN_WIDTH-1:0] = ptw_jtlb_ref_cmplt ? ptw_jtlb_ref_ppn[PPN_WIDTH-1:0]
                                          : tc_hit_ppn[PPN_WIDTH-1:0];
assign ref_flg[FLG_WIDTH-1:0] = ptw_jtlb_ref_cmplt ? ptw_jtlb_ref_flg[FLG_WIDTH-1:0]
                                               : tc_hit_flg[FLG_WIDTH-1:0];

assign jtlb_utlb_ref_vpn[VPN_WIDTH-1:0] = ref_vpn[VPN_WIDTH-1:0]; 
assign jtlb_utlb_ref_pgs[PGS_WIDTH-1:0] = ref_pgs[PGS_WIDTH-1:0]; 

assign jtlb_utlb_ref_ppn[PPN_WIDTH-1:0] = ref_ppn[PPN_WIDTH-1:0];
assign jtlb_utlb_ref_flg[FLG_WIDTH-1:0] = ref_flg[FLG_WIDTH-1:0];

assign jtlb_top_cur_st[1:0] = read_cur_st[1:0];

assign jtlb_top_utlb_pavld = tc_pa_vld || ptw_jtlb_ref_data_vld;

// &ModuleEnd; @1071
endmodule


