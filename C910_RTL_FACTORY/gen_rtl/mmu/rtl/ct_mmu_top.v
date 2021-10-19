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
module ct_mmu_top(
  biu_mmu_smp_disable,
  cp0_mmu_cskyee,
  cp0_mmu_icg_en,
  cp0_mmu_maee,
  cp0_mmu_mpp,
  cp0_mmu_mprv,
  cp0_mmu_mxr,
  cp0_mmu_no_op_req,
  cp0_mmu_ptw_en,
  cp0_mmu_reg_num,
  cp0_mmu_satp_sel,
  cp0_mmu_sum,
  cp0_mmu_tlb_all_inv,
  cp0_mmu_wdata,
  cp0_mmu_wreg,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  hpcp_mmu_cnt_en,
  ifu_mmu_abort,
  ifu_mmu_va,
  ifu_mmu_va_vld,
  lsu_mmu_abort0,
  lsu_mmu_abort1,
  lsu_mmu_bus_error,
  lsu_mmu_data,
  lsu_mmu_data_vld,
  lsu_mmu_id0,
  lsu_mmu_id1,
  lsu_mmu_st_inst0,
  lsu_mmu_st_inst1,
  lsu_mmu_stamo_pa,
  lsu_mmu_stamo_vld,
  lsu_mmu_tlb_all_inv,
  lsu_mmu_tlb_asid,
  lsu_mmu_tlb_asid_all_inv,
  lsu_mmu_tlb_va,
  lsu_mmu_tlb_va_all_inv,
  lsu_mmu_tlb_va_asid_inv,
  lsu_mmu_va0,
  lsu_mmu_va0_vld,
  lsu_mmu_va1,
  lsu_mmu_va1_vld,
  lsu_mmu_va2,
  lsu_mmu_va2_vld,
  lsu_mmu_vabuf0,
  lsu_mmu_vabuf1,
  mmu_cp0_cmplt,
  mmu_cp0_data,
  mmu_cp0_satp_data,
  mmu_cp0_tlb_done,
  mmu_had_debug_info,
  mmu_hpcp_dutlb_miss,
  mmu_hpcp_iutlb_miss,
  mmu_hpcp_jtlb_miss,
  mmu_ifu_buf,
  mmu_ifu_ca,
  mmu_ifu_deny,
  mmu_ifu_pa,
  mmu_ifu_pavld,
  mmu_ifu_pgflt,
  mmu_ifu_sec,
  mmu_lsu_access_fault0,
  mmu_lsu_access_fault1,
  mmu_lsu_buf0,
  mmu_lsu_buf1,
  mmu_lsu_ca0,
  mmu_lsu_ca1,
  mmu_lsu_data_req,
  mmu_lsu_data_req_addr,
  mmu_lsu_data_req_size,
  mmu_lsu_mmu_en,
  mmu_lsu_pa0,
  mmu_lsu_pa0_vld,
  mmu_lsu_pa1,
  mmu_lsu_pa1_vld,
  mmu_lsu_pa2,
  mmu_lsu_pa2_err,
  mmu_lsu_pa2_vld,
  mmu_lsu_page_fault0,
  mmu_lsu_page_fault1,
  mmu_lsu_sec0,
  mmu_lsu_sec1,
  mmu_lsu_sec2,
  mmu_lsu_sh0,
  mmu_lsu_sh1,
  mmu_lsu_share2,
  mmu_lsu_so0,
  mmu_lsu_so1,
  mmu_lsu_stall0,
  mmu_lsu_stall1,
  mmu_lsu_tlb_busy,
  mmu_lsu_tlb_inv_done,
  mmu_lsu_tlb_wakeup,
  mmu_pmp_fetch3,
  mmu_pmp_pa0,
  mmu_pmp_pa1,
  mmu_pmp_pa2,
  mmu_pmp_pa3,
  mmu_pmp_pa4,
  mmu_xx_mmu_en,
  mmu_yy_xx_no_op,
  pad_yy_icg_scan_en,
  pmp_mmu_flg0,
  pmp_mmu_flg1,
  pmp_mmu_flg2,
  pmp_mmu_flg3,
  pmp_mmu_flg4,
  rtu_mmu_bad_vpn,
  rtu_mmu_expt_vld,
  rtu_yy_xx_flush
);

// &Ports; @29
input           biu_mmu_smp_disable;        
input           cp0_mmu_cskyee;             
input           cp0_mmu_icg_en;             
input           cp0_mmu_maee;               
input   [1 :0]  cp0_mmu_mpp;                
input           cp0_mmu_mprv;               
input           cp0_mmu_mxr;                
input           cp0_mmu_no_op_req;          
input           cp0_mmu_ptw_en;             
input   [1 :0]  cp0_mmu_reg_num;            
input           cp0_mmu_satp_sel;           
input           cp0_mmu_sum;                
input           cp0_mmu_tlb_all_inv;        
input   [63:0]  cp0_mmu_wdata;              
input           cp0_mmu_wreg;               
input   [1 :0]  cp0_yy_priv_mode;           
input           cpurst_b;                   
input           forever_cpuclk;             
input           hpcp_mmu_cnt_en;            
input           ifu_mmu_abort;              
input   [62:0]  ifu_mmu_va;                 
input           ifu_mmu_va_vld;             
input           lsu_mmu_abort0;             
input           lsu_mmu_abort1;             
input           lsu_mmu_bus_error;          
input   [63:0]  lsu_mmu_data;               
input           lsu_mmu_data_vld;           
input   [6 :0]  lsu_mmu_id0;                
input   [6 :0]  lsu_mmu_id1;                
input           lsu_mmu_st_inst0;           
input           lsu_mmu_st_inst1;           
input   [27:0]  lsu_mmu_stamo_pa;           
input           lsu_mmu_stamo_vld;          
input           lsu_mmu_tlb_all_inv;        
input   [15:0]  lsu_mmu_tlb_asid;           
input           lsu_mmu_tlb_asid_all_inv;   
input   [26:0]  lsu_mmu_tlb_va;             
input           lsu_mmu_tlb_va_all_inv;     
input           lsu_mmu_tlb_va_asid_inv;    
input   [63:0]  lsu_mmu_va0;                
input           lsu_mmu_va0_vld;            
input   [63:0]  lsu_mmu_va1;                
input           lsu_mmu_va1_vld;            
input   [27:0]  lsu_mmu_va2;                
input           lsu_mmu_va2_vld;            
input   [27:0]  lsu_mmu_vabuf0;             
input   [27:0]  lsu_mmu_vabuf1;             
input           pad_yy_icg_scan_en;         
input   [3 :0]  pmp_mmu_flg0;               
input   [3 :0]  pmp_mmu_flg1;               
input   [3 :0]  pmp_mmu_flg2;               
input   [3 :0]  pmp_mmu_flg3;               
input   [3 :0]  pmp_mmu_flg4;               
input   [26:0]  rtu_mmu_bad_vpn;            
input           rtu_mmu_expt_vld;           
input           rtu_yy_xx_flush;            
output          mmu_cp0_cmplt;              
output  [63:0]  mmu_cp0_data;               
output  [63:0]  mmu_cp0_satp_data;          
output          mmu_cp0_tlb_done;           
output  [33:0]  mmu_had_debug_info;         
output          mmu_hpcp_dutlb_miss;        
output          mmu_hpcp_iutlb_miss;        
output          mmu_hpcp_jtlb_miss;         
output          mmu_ifu_buf;                
output          mmu_ifu_ca;                 
output          mmu_ifu_deny;               
output  [27:0]  mmu_ifu_pa;                 
output          mmu_ifu_pavld;              
output          mmu_ifu_pgflt;              
output          mmu_ifu_sec;                
output          mmu_lsu_access_fault0;      
output          mmu_lsu_access_fault1;      
output          mmu_lsu_buf0;               
output          mmu_lsu_buf1;               
output          mmu_lsu_ca0;                
output          mmu_lsu_ca1;                
output          mmu_lsu_data_req;           
output  [39:0]  mmu_lsu_data_req_addr;      
output          mmu_lsu_data_req_size;      
output          mmu_lsu_mmu_en;             
output  [27:0]  mmu_lsu_pa0;                
output          mmu_lsu_pa0_vld;            
output  [27:0]  mmu_lsu_pa1;                
output          mmu_lsu_pa1_vld;            
output  [27:0]  mmu_lsu_pa2;                
output          mmu_lsu_pa2_err;            
output          mmu_lsu_pa2_vld;            
output          mmu_lsu_page_fault0;        
output          mmu_lsu_page_fault1;        
output          mmu_lsu_sec0;               
output          mmu_lsu_sec1;               
output          mmu_lsu_sec2;               
output          mmu_lsu_sh0;                
output          mmu_lsu_sh1;                
output          mmu_lsu_share2;             
output          mmu_lsu_so0;                
output          mmu_lsu_so1;                
output          mmu_lsu_stall0;             
output          mmu_lsu_stall1;             
output          mmu_lsu_tlb_busy;           
output          mmu_lsu_tlb_inv_done;       
output  [11:0]  mmu_lsu_tlb_wakeup;         
output          mmu_pmp_fetch3;             
output  [27:0]  mmu_pmp_pa0;                
output  [27:0]  mmu_pmp_pa1;                
output  [27:0]  mmu_pmp_pa2;                
output  [27:0]  mmu_pmp_pa3;                
output  [27:0]  mmu_pmp_pa4;                
output          mmu_xx_mmu_en;              
output          mmu_yy_xx_no_op;            

// &Regs; @30

// &Wires; @31
wire            arb_dutlb_grant;            
wire            arb_iutlb_grant;            
wire    [2 :0]  arb_jtlb_acc_type;          
wire    [3 :0]  arb_jtlb_bank_sel;          
wire            arb_jtlb_cmp_with_va;       
wire    [41:0]  arb_jtlb_data_din;          
wire    [3 :0]  arb_jtlb_fifo_din;          
wire            arb_jtlb_fifo_write;        
wire    [8 :0]  arb_jtlb_idx;               
wire            arb_jtlb_req;               
wire    [47:0]  arb_jtlb_tag_din;           
wire    [26:0]  arb_jtlb_vpn;               
wire            arb_jtlb_write;             
wire            arb_ptw_grant;              
wire            arb_ptw_mask;               
wire            arb_tlboper_grant;          
wire    [1 :0]  arb_top_cur_st;             
wire            arb_top_tlboper_on;         
wire            biu_mmu_smp_disable;        
wire            cp0_mmu_cskyee;             
wire            cp0_mmu_icg_en;             
wire            cp0_mmu_maee;               
wire    [1 :0]  cp0_mmu_mpp;                
wire            cp0_mmu_mprv;               
wire            cp0_mmu_mxr;                
wire            cp0_mmu_no_op_req;          
wire            cp0_mmu_ptw_en;             
wire    [1 :0]  cp0_mmu_reg_num;            
wire            cp0_mmu_satp_sel;           
wire            cp0_mmu_sum;                
wire            cp0_mmu_tlb_all_inv;        
wire    [63:0]  cp0_mmu_wdata;              
wire            cp0_mmu_wreg;               
wire    [1 :0]  cp0_yy_priv_mode;           
wire            cpurst_b;                   
wire            dutlb_arb_cmplt;            
wire            dutlb_arb_load;             
wire            dutlb_arb_req;              
wire    [26:0]  dutlb_arb_vpn;              
wire            dutlb_ptw_wfc;              
wire    [2 :0]  dutlb_top_ref_cur_st;       
wire            dutlb_top_ref_type;         
wire            dutlb_top_scd_updt;         
wire            dutlb_xx_mmu_off;           
wire            forever_cpuclk;             
wire            hpcp_mmu_cnt_en;            
wire            ifu_mmu_abort;              
wire    [62:0]  ifu_mmu_va;                 
wire            ifu_mmu_va_vld;             
wire            iutlb_arb_cmplt;            
wire            iutlb_arb_req;              
wire    [26:0]  iutlb_arb_vpn;              
wire            iutlb_ptw_wfc;              
wire    [1 :0]  iutlb_top_ref_cur_st;       
wire            iutlb_top_scd_updt;         
wire            jtlb_arb_cmp_va;            
wire            jtlb_arb_par_clr;           
wire            jtlb_arb_pfu_cmplt;         
wire    [26:0]  jtlb_arb_pfu_vpn;           
wire            jtlb_arb_sel_1g;            
wire            jtlb_arb_sel_2m;            
wire            jtlb_arb_sel_4k;            
wire            jtlb_arb_tc_miss;           
wire    [2 :0]  jtlb_arb_type;              
wire    [26:0]  jtlb_arb_vpn;               
wire            jtlb_dutlb_acc_err;         
wire            jtlb_dutlb_pgflt;           
wire            jtlb_dutlb_ref_cmplt;       
wire            jtlb_dutlb_ref_pavld;       
wire            jtlb_iutlb_acc_err;         
wire            jtlb_iutlb_pgflt;           
wire            jtlb_iutlb_ref_cmplt;       
wire            jtlb_iutlb_ref_pavld;       
wire            jtlb_ptw_req;               
wire    [2 :0]  jtlb_ptw_type;              
wire    [26:0]  jtlb_ptw_vpn;               
wire            jtlb_regs_hit;              
wire            jtlb_regs_hit_mult;         
wire    [10:0]  jtlb_regs_tlbp_hit_index;   
wire            jtlb_tlboper_asid_hit;      
wire            jtlb_tlboper_cmplt;         
wire    [3 :0]  jtlb_tlboper_fifo;          
wire            jtlb_tlboper_read_idle;     
wire    [3 :0]  jtlb_tlboper_sel;           
wire            jtlb_tlboper_va_hit;        
wire    [15:0]  jtlb_tlbr_asid;             
wire    [13:0]  jtlb_tlbr_flg;              
wire            jtlb_tlbr_g;                
wire    [2 :0]  jtlb_tlbr_pgs;              
wire    [27:0]  jtlb_tlbr_ppn;              
wire    [26:0]  jtlb_tlbr_vpn;              
wire    [1 :0]  jtlb_top_cur_st;            
wire            jtlb_top_utlb_pavld;        
wire    [13:0]  jtlb_utlb_ref_flg;          
wire    [2 :0]  jtlb_utlb_ref_pgs;          
wire    [27:0]  jtlb_utlb_ref_ppn;          
wire    [26:0]  jtlb_utlb_ref_vpn;          
wire    [11:0]  jtlb_xx_fifo;               
wire            jtlb_xx_tc_read;            
wire            lsu_mmu_abort0;             
wire            lsu_mmu_abort1;             
wire            lsu_mmu_bus_error;          
wire    [63:0]  lsu_mmu_data;               
wire            lsu_mmu_data_vld;           
wire    [6 :0]  lsu_mmu_id0;                
wire    [6 :0]  lsu_mmu_id1;                
wire            lsu_mmu_st_inst0;           
wire            lsu_mmu_st_inst1;           
wire    [27:0]  lsu_mmu_stamo_pa;           
wire            lsu_mmu_stamo_vld;          
wire            lsu_mmu_tlb_all_inv;        
wire    [15:0]  lsu_mmu_tlb_asid;           
wire            lsu_mmu_tlb_asid_all_inv;   
wire    [26:0]  lsu_mmu_tlb_va;             
wire            lsu_mmu_tlb_va_all_inv;     
wire            lsu_mmu_tlb_va_asid_inv;    
wire    [63:0]  lsu_mmu_va0;                
wire            lsu_mmu_va0_vld;            
wire    [63:0]  lsu_mmu_va1;                
wire            lsu_mmu_va1_vld;            
wire    [27:0]  lsu_mmu_va2;                
wire            lsu_mmu_va2_vld;            
wire    [27:0]  lsu_mmu_vabuf0;             
wire    [27:0]  lsu_mmu_vabuf1;             
wire            mmu_cp0_cmplt;              
wire    [63:0]  mmu_cp0_data;               
wire    [63:0]  mmu_cp0_satp_data;          
wire            mmu_cp0_tlb_done;           
wire    [33:0]  mmu_had_debug_info;         
wire            mmu_hpcp_dutlb_miss;        
wire            mmu_hpcp_iutlb_miss;        
wire            mmu_hpcp_jtlb_miss;         
wire            mmu_ifu_buf;                
wire            mmu_ifu_ca;                 
wire            mmu_ifu_deny;               
wire    [27:0]  mmu_ifu_pa;                 
wire            mmu_ifu_pavld;              
wire            mmu_ifu_pgflt;              
wire            mmu_ifu_sec;                
wire            mmu_lsu_access_fault0;      
wire            mmu_lsu_access_fault1;      
wire            mmu_lsu_buf0;               
wire            mmu_lsu_buf1;               
wire            mmu_lsu_ca0;                
wire            mmu_lsu_ca1;                
wire            mmu_lsu_data_req;           
wire    [39:0]  mmu_lsu_data_req_addr;      
wire            mmu_lsu_data_req_size;      
wire            mmu_lsu_mmu_en;             
wire    [27:0]  mmu_lsu_pa0;                
wire            mmu_lsu_pa0_vld;            
wire    [27:0]  mmu_lsu_pa1;                
wire            mmu_lsu_pa1_vld;            
wire    [27:0]  mmu_lsu_pa2;                
wire            mmu_lsu_pa2_err;            
wire            mmu_lsu_pa2_vld;            
wire            mmu_lsu_page_fault0;        
wire            mmu_lsu_page_fault1;        
wire            mmu_lsu_sec0;               
wire            mmu_lsu_sec1;               
wire            mmu_lsu_sec2;               
wire            mmu_lsu_sh0;                
wire            mmu_lsu_sh1;                
wire            mmu_lsu_share2;             
wire            mmu_lsu_so0;                
wire            mmu_lsu_so1;                
wire            mmu_lsu_stall0;             
wire            mmu_lsu_stall1;             
wire            mmu_lsu_tlb_busy;           
wire            mmu_lsu_tlb_inv_done;       
wire    [11:0]  mmu_lsu_tlb_wakeup;         
wire            mmu_pmp_fetch3;             
wire    [27:0]  mmu_pmp_pa0;                
wire    [27:0]  mmu_pmp_pa1;                
wire    [27:0]  mmu_pmp_pa2;                
wire    [27:0]  mmu_pmp_pa3;                
wire    [27:0]  mmu_pmp_pa4;                
wire    [27:0]  mmu_sysmap_pa0;             
wire    [27:0]  mmu_sysmap_pa1;             
wire    [27:0]  mmu_sysmap_pa2;             
wire    [27:0]  mmu_sysmap_pa3;             
wire    [27:0]  mmu_sysmap_pa4;             
wire            mmu_xx_mmu_en;              
wire            mmu_yy_xx_no_op;            
wire            pad_yy_icg_scan_en;         
wire    [3 :0]  pmp_mmu_flg0;               
wire    [3 :0]  pmp_mmu_flg1;               
wire    [3 :0]  pmp_mmu_flg2;               
wire    [3 :0]  pmp_mmu_flg3;               
wire    [3 :0]  pmp_mmu_flg4;               
wire    [3 :0]  ptw_arb_bank_sel;           
wire    [41:0]  ptw_arb_data_din;           
wire    [3 :0]  ptw_arb_fifo_din;           
wire    [2 :0]  ptw_arb_pgs;                
wire            ptw_arb_req;                
wire    [47:0]  ptw_arb_tag_din;            
wire    [26:0]  ptw_arb_vpn;                
wire            ptw_jtlb_dmiss;             
wire            ptw_jtlb_imiss;             
wire            ptw_jtlb_pmiss;             
wire            ptw_jtlb_ref_acc_err;       
wire            ptw_jtlb_ref_cmplt;         
wire            ptw_jtlb_ref_data_vld;      
wire    [13:0]  ptw_jtlb_ref_flg;           
wire            ptw_jtlb_ref_pgflt;         
wire    [2 :0]  ptw_jtlb_ref_pgs;           
wire    [27:0]  ptw_jtlb_ref_ppn;           
wire    [3 :0]  ptw_top_cur_st;             
wire            ptw_top_imiss;              
wire    [15:0]  regs_jtlb_cur_asid;         
wire    [13:0]  regs_jtlb_cur_flg;          
wire            regs_jtlb_cur_g;            
wire    [27:0]  regs_jtlb_cur_ppn;          
wire            regs_mmu_en;                
wire    [15:0]  regs_ptw_cur_asid;          
wire    [27:0]  regs_ptw_satp_ppn;          
wire    [15:0]  regs_tlboper_cur_asid;      
wire    [2 :0]  regs_tlboper_cur_pgs;       
wire    [26:0]  regs_tlboper_cur_vpn;       
wire    [15:0]  regs_tlboper_inv_asid;      
wire            regs_tlboper_invall;        
wire            regs_tlboper_invasid;       
wire    [11:0]  regs_tlboper_mir;           
wire            regs_tlboper_tlbp;          
wire            regs_tlboper_tlbr;          
wire            regs_tlboper_tlbwi;         
wire            regs_tlboper_tlbwr;         
wire            regs_utlb_clr;              
wire    [26:0]  rtu_mmu_bad_vpn;            
wire            rtu_mmu_expt_vld;           
wire            rtu_yy_xx_flush;            
wire    [4 :0]  sysmap_mmu_flg0;            
wire    [4 :0]  sysmap_mmu_flg1;            
wire    [4 :0]  sysmap_mmu_flg2;            
wire    [4 :0]  sysmap_mmu_flg3;            
wire    [4 :0]  sysmap_mmu_flg4;            
wire    [7 :0]  sysmap_mmu_hit0;            
wire    [7 :0]  sysmap_mmu_hit1;            
wire    [7 :0]  sysmap_mmu_hit2;            
wire    [7 :0]  sysmap_mmu_hit3;            
wire    [7 :0]  sysmap_mmu_hit4;            
wire    [3 :0]  tlboper_arb_bank_sel;       
wire            tlboper_arb_cmp_va;         
wire    [41:0]  tlboper_arb_data_din;       
wire    [3 :0]  tlboper_arb_fifo_din;       
wire            tlboper_arb_fifo_write;     
wire    [8 :0]  tlboper_arb_idx;            
wire            tlboper_arb_idx_not_va;     
wire            tlboper_arb_req;            
wire    [47:0]  tlboper_arb_tag_din;        
wire    [26:0]  tlboper_arb_vpn;            
wire            tlboper_arb_write;          
wire    [15:0]  tlboper_jtlb_asid;          
wire            tlboper_jtlb_asid_sel;      
wire            tlboper_jtlb_cmp_noasid;    
wire    [15:0]  tlboper_jtlb_inv_asid;      
wire            tlboper_jtlb_tlbwr_on;      
wire            tlboper_ptw_abort;          
wire            tlboper_regs_cmplt;         
wire            tlboper_regs_tlbp_cmplt;    
wire            tlboper_regs_tlbr_cmplt;    
wire            tlboper_top_lsu_cmplt;      
wire            tlboper_top_lsu_oper;       
wire            tlboper_top_tlbiall_cur_st; 
wire    [2 :0]  tlboper_top_tlbiasid_cur_st; 
wire    [3 :0]  tlboper_top_tlbiva_cur_st;  
wire    [1 :0]  tlboper_top_tlbp_cur_st;    
wire    [1 :0]  tlboper_top_tlbr_cur_st;    
wire    [1 :0]  tlboper_top_tlbwi_cur_st;   
wire    [1 :0]  tlboper_top_tlbwr_cur_st;   
wire            tlboper_utlb_clr;           
wire            tlboper_utlb_inv_va_req;    
wire            tlboper_xx_cmplt;           
wire    [2 :0]  tlboper_xx_pgs;             
wire            tlboper_xx_pgs_en;          
wire            utlb_clk;                   
wire            utlb_clk_en;                


assign utlb_clk_en = regs_utlb_clr
                  || tlboper_utlb_clr
                  || tlboper_utlb_inv_va_req
                  || !regs_mmu_en
                  || jtlb_top_utlb_pavld
                  || dutlb_top_scd_updt
                  || iutlb_top_scd_updt;

// &Instance("gated_clk_cell", "x_utlb_gateclk"); @41
gated_clk_cell  x_utlb_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (utlb_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (utlb_clk_en       ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @42
//           .external_en(1'b0          ), @43
//           .global_en  (1'b1          ), @44
//           .module_en  (cp0_mmu_icg_en), @45
//           .local_en   (utlb_clk_en  ), @46
//           .clk_out    (utlb_clk     ) @47
//          ); @48

//==========================================================
// Instance utlbs
//==========================================================
// &Instance("ct_mmu_iutlb","x_ct_mmu_iutlb"); @53
ct_mmu_iutlb  x_ct_mmu_iutlb (
  .arb_iutlb_grant         (arb_iutlb_grant        ),
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cp0_mmu_no_op_req       (cp0_mmu_no_op_req      ),
  .cp0_mmu_sum             (cp0_mmu_sum            ),
  .cp0_yy_priv_mode        (cp0_yy_priv_mode       ),
  .cpurst_b                (cpurst_b               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .hpcp_mmu_cnt_en         (hpcp_mmu_cnt_en        ),
  .ifu_mmu_abort           (ifu_mmu_abort          ),
  .ifu_mmu_va              (ifu_mmu_va             ),
  .ifu_mmu_va_vld          (ifu_mmu_va_vld         ),
  .iutlb_arb_cmplt         (iutlb_arb_cmplt        ),
  .iutlb_arb_req           (iutlb_arb_req          ),
  .iutlb_arb_vpn           (iutlb_arb_vpn          ),
  .iutlb_ptw_wfc           (iutlb_ptw_wfc          ),
  .iutlb_top_ref_cur_st    (iutlb_top_ref_cur_st   ),
  .iutlb_top_scd_updt      (iutlb_top_scd_updt     ),
  .jtlb_iutlb_acc_err      (jtlb_iutlb_acc_err     ),
  .jtlb_iutlb_pgflt        (jtlb_iutlb_pgflt       ),
  .jtlb_iutlb_ref_cmplt    (jtlb_iutlb_ref_cmplt   ),
  .jtlb_iutlb_ref_pavld    (jtlb_iutlb_ref_pavld   ),
  .jtlb_utlb_ref_flg       (jtlb_utlb_ref_flg      ),
  .jtlb_utlb_ref_pgs       (jtlb_utlb_ref_pgs      ),
  .jtlb_utlb_ref_ppn       (jtlb_utlb_ref_ppn      ),
  .jtlb_utlb_ref_vpn       (jtlb_utlb_ref_vpn      ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .mmu_hpcp_iutlb_miss     (mmu_hpcp_iutlb_miss    ),
  .mmu_ifu_buf             (mmu_ifu_buf            ),
  .mmu_ifu_ca              (mmu_ifu_ca             ),
  .mmu_ifu_deny            (mmu_ifu_deny           ),
  .mmu_ifu_pa              (mmu_ifu_pa             ),
  .mmu_ifu_pavld           (mmu_ifu_pavld          ),
  .mmu_ifu_pgflt           (mmu_ifu_pgflt          ),
  .mmu_ifu_sec             (mmu_ifu_sec            ),
  .mmu_pmp_pa2             (mmu_pmp_pa2            ),
  .mmu_sysmap_pa2          (mmu_sysmap_pa2         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .pmp_mmu_flg2            (pmp_mmu_flg2           ),
  .regs_mmu_en             (regs_mmu_en            ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .sysmap_mmu_flg2         (sysmap_mmu_flg2        ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               )
);

// &Instance("ct_mmu_dutlb","x_ct_mmu_dutlb"); @54
ct_mmu_dutlb  x_ct_mmu_dutlb (
  .arb_dutlb_grant         (arb_dutlb_grant        ),
  .biu_mmu_smp_disable     (biu_mmu_smp_disable    ),
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cp0_mmu_mpp             (cp0_mmu_mpp            ),
  .cp0_mmu_mprv            (cp0_mmu_mprv           ),
  .cp0_mmu_mxr             (cp0_mmu_mxr            ),
  .cp0_mmu_sum             (cp0_mmu_sum            ),
  .cp0_yy_priv_mode        (cp0_yy_priv_mode       ),
  .cpurst_b                (cpurst_b               ),
  .dutlb_arb_cmplt         (dutlb_arb_cmplt        ),
  .dutlb_arb_load          (dutlb_arb_load         ),
  .dutlb_arb_req           (dutlb_arb_req          ),
  .dutlb_arb_vpn           (dutlb_arb_vpn          ),
  .dutlb_ptw_wfc           (dutlb_ptw_wfc          ),
  .dutlb_top_ref_cur_st    (dutlb_top_ref_cur_st   ),
  .dutlb_top_ref_type      (dutlb_top_ref_type     ),
  .dutlb_top_scd_updt      (dutlb_top_scd_updt     ),
  .dutlb_xx_mmu_off        (dutlb_xx_mmu_off       ),
  .forever_cpuclk          (forever_cpuclk         ),
  .hpcp_mmu_cnt_en         (hpcp_mmu_cnt_en        ),
  .jtlb_dutlb_acc_err      (jtlb_dutlb_acc_err     ),
  .jtlb_dutlb_pgflt        (jtlb_dutlb_pgflt       ),
  .jtlb_dutlb_ref_cmplt    (jtlb_dutlb_ref_cmplt   ),
  .jtlb_dutlb_ref_pavld    (jtlb_dutlb_ref_pavld   ),
  .jtlb_utlb_ref_flg       (jtlb_utlb_ref_flg      ),
  .jtlb_utlb_ref_pgs       (jtlb_utlb_ref_pgs      ),
  .jtlb_utlb_ref_ppn       (jtlb_utlb_ref_ppn      ),
  .jtlb_utlb_ref_vpn       (jtlb_utlb_ref_vpn      ),
  .lsu_mmu_abort0          (lsu_mmu_abort0         ),
  .lsu_mmu_abort1          (lsu_mmu_abort1         ),
  .lsu_mmu_id0             (lsu_mmu_id0            ),
  .lsu_mmu_id1             (lsu_mmu_id1            ),
  .lsu_mmu_st_inst0        (lsu_mmu_st_inst0       ),
  .lsu_mmu_st_inst1        (lsu_mmu_st_inst1       ),
  .lsu_mmu_stamo_pa        (lsu_mmu_stamo_pa       ),
  .lsu_mmu_stamo_vld       (lsu_mmu_stamo_vld      ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .lsu_mmu_va0             (lsu_mmu_va0            ),
  .lsu_mmu_va0_vld         (lsu_mmu_va0_vld        ),
  .lsu_mmu_va1             (lsu_mmu_va1            ),
  .lsu_mmu_va1_vld         (lsu_mmu_va1_vld        ),
  .lsu_mmu_vabuf0          (lsu_mmu_vabuf0         ),
  .lsu_mmu_vabuf1          (lsu_mmu_vabuf1         ),
  .mmu_hpcp_dutlb_miss     (mmu_hpcp_dutlb_miss    ),
  .mmu_lsu_access_fault0   (mmu_lsu_access_fault0  ),
  .mmu_lsu_access_fault1   (mmu_lsu_access_fault1  ),
  .mmu_lsu_buf0            (mmu_lsu_buf0           ),
  .mmu_lsu_buf1            (mmu_lsu_buf1           ),
  .mmu_lsu_ca0             (mmu_lsu_ca0            ),
  .mmu_lsu_ca1             (mmu_lsu_ca1            ),
  .mmu_lsu_pa0             (mmu_lsu_pa0            ),
  .mmu_lsu_pa0_vld         (mmu_lsu_pa0_vld        ),
  .mmu_lsu_pa1             (mmu_lsu_pa1            ),
  .mmu_lsu_pa1_vld         (mmu_lsu_pa1_vld        ),
  .mmu_lsu_page_fault0     (mmu_lsu_page_fault0    ),
  .mmu_lsu_page_fault1     (mmu_lsu_page_fault1    ),
  .mmu_lsu_sec0            (mmu_lsu_sec0           ),
  .mmu_lsu_sec1            (mmu_lsu_sec1           ),
  .mmu_lsu_sh0             (mmu_lsu_sh0            ),
  .mmu_lsu_sh1             (mmu_lsu_sh1            ),
  .mmu_lsu_so0             (mmu_lsu_so0            ),
  .mmu_lsu_so1             (mmu_lsu_so1            ),
  .mmu_lsu_stall0          (mmu_lsu_stall0         ),
  .mmu_lsu_stall1          (mmu_lsu_stall1         ),
  .mmu_lsu_tlb_busy        (mmu_lsu_tlb_busy       ),
  .mmu_lsu_tlb_wakeup      (mmu_lsu_tlb_wakeup     ),
  .mmu_pmp_pa0             (mmu_pmp_pa0            ),
  .mmu_pmp_pa1             (mmu_pmp_pa1            ),
  .mmu_sysmap_pa0          (mmu_sysmap_pa0         ),
  .mmu_sysmap_pa1          (mmu_sysmap_pa1         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .pmp_mmu_flg0            (pmp_mmu_flg0           ),
  .pmp_mmu_flg1            (pmp_mmu_flg1           ),
  .regs_mmu_en             (regs_mmu_en            ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .rtu_yy_xx_flush         (rtu_yy_xx_flush        ),
  .sysmap_mmu_flg0         (sysmap_mmu_flg0        ),
  .sysmap_mmu_flg1         (sysmap_mmu_flg1        ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               )
);


//==========================================================
// Instance mmu regs
//==========================================================
// &Instance("ct_mmu_regs", "x_ct_mmu_regs"); @59
ct_mmu_regs  x_ct_mmu_regs (
  .cp0_mmu_cskyee           (cp0_mmu_cskyee          ),
  .cp0_mmu_icg_en           (cp0_mmu_icg_en          ),
  .cp0_mmu_mpp              (cp0_mmu_mpp             ),
  .cp0_mmu_mprv             (cp0_mmu_mprv            ),
  .cp0_mmu_reg_num          (cp0_mmu_reg_num         ),
  .cp0_mmu_satp_sel         (cp0_mmu_satp_sel        ),
  .cp0_mmu_wdata            (cp0_mmu_wdata           ),
  .cp0_mmu_wreg             (cp0_mmu_wreg            ),
  .cp0_yy_priv_mode         (cp0_yy_priv_mode        ),
  .cpurst_b                 (cpurst_b                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .jtlb_regs_hit            (jtlb_regs_hit           ),
  .jtlb_regs_hit_mult       (jtlb_regs_hit_mult      ),
  .jtlb_regs_tlbp_hit_index (jtlb_regs_tlbp_hit_index),
  .jtlb_tlbr_asid           (jtlb_tlbr_asid          ),
  .jtlb_tlbr_flg            (jtlb_tlbr_flg           ),
  .jtlb_tlbr_g              (jtlb_tlbr_g             ),
  .jtlb_tlbr_pgs            (jtlb_tlbr_pgs           ),
  .jtlb_tlbr_ppn            (jtlb_tlbr_ppn           ),
  .jtlb_tlbr_vpn            (jtlb_tlbr_vpn           ),
  .mmu_cp0_cmplt            (mmu_cp0_cmplt           ),
  .mmu_cp0_data             (mmu_cp0_data            ),
  .mmu_cp0_satp_data        (mmu_cp0_satp_data       ),
  .mmu_lsu_mmu_en           (mmu_lsu_mmu_en          ),
  .mmu_xx_mmu_en            (mmu_xx_mmu_en           ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .regs_jtlb_cur_asid       (regs_jtlb_cur_asid      ),
  .regs_jtlb_cur_flg        (regs_jtlb_cur_flg       ),
  .regs_jtlb_cur_g          (regs_jtlb_cur_g         ),
  .regs_jtlb_cur_ppn        (regs_jtlb_cur_ppn       ),
  .regs_mmu_en              (regs_mmu_en             ),
  .regs_ptw_cur_asid        (regs_ptw_cur_asid       ),
  .regs_ptw_satp_ppn        (regs_ptw_satp_ppn       ),
  .regs_tlboper_cur_asid    (regs_tlboper_cur_asid   ),
  .regs_tlboper_cur_pgs     (regs_tlboper_cur_pgs    ),
  .regs_tlboper_cur_vpn     (regs_tlboper_cur_vpn    ),
  .regs_tlboper_inv_asid    (regs_tlboper_inv_asid   ),
  .regs_tlboper_invall      (regs_tlboper_invall     ),
  .regs_tlboper_invasid     (regs_tlboper_invasid    ),
  .regs_tlboper_mir         (regs_tlboper_mir        ),
  .regs_tlboper_tlbp        (regs_tlboper_tlbp       ),
  .regs_tlboper_tlbr        (regs_tlboper_tlbr       ),
  .regs_tlboper_tlbwi       (regs_tlboper_tlbwi      ),
  .regs_tlboper_tlbwr       (regs_tlboper_tlbwr      ),
  .regs_utlb_clr            (regs_utlb_clr           ),
  .rtu_mmu_bad_vpn          (rtu_mmu_bad_vpn         ),
  .rtu_mmu_expt_vld         (rtu_mmu_expt_vld        ),
  .tlboper_regs_cmplt       (tlboper_regs_cmplt      ),
  .tlboper_regs_tlbp_cmplt  (tlboper_regs_tlbp_cmplt ),
  .tlboper_regs_tlbr_cmplt  (tlboper_regs_tlbr_cmplt )
);


//==========================================================
// Instance cp0 & ctc request module
//==========================================================
// &Instance("ct_mmu_tlboper", "x_ct_mmu_tlboper"); @64
ct_mmu_tlboper  x_ct_mmu_tlboper (
  .arb_tlboper_grant           (arb_tlboper_grant          ),
  .cp0_mmu_icg_en              (cp0_mmu_icg_en             ),
  .cp0_mmu_tlb_all_inv         (cp0_mmu_tlb_all_inv        ),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .jtlb_tlboper_asid_hit       (jtlb_tlboper_asid_hit      ),
  .jtlb_tlboper_cmplt          (jtlb_tlboper_cmplt         ),
  .jtlb_tlboper_fifo           (jtlb_tlboper_fifo          ),
  .jtlb_tlboper_read_idle      (jtlb_tlboper_read_idle     ),
  .jtlb_tlboper_sel            (jtlb_tlboper_sel           ),
  .jtlb_tlboper_va_hit         (jtlb_tlboper_va_hit        ),
  .jtlb_xx_tc_read             (jtlb_xx_tc_read            ),
  .lsu_mmu_tlb_all_inv         (lsu_mmu_tlb_all_inv        ),
  .lsu_mmu_tlb_asid            (lsu_mmu_tlb_asid           ),
  .lsu_mmu_tlb_asid_all_inv    (lsu_mmu_tlb_asid_all_inv   ),
  .lsu_mmu_tlb_va              (lsu_mmu_tlb_va             ),
  .lsu_mmu_tlb_va_all_inv      (lsu_mmu_tlb_va_all_inv     ),
  .lsu_mmu_tlb_va_asid_inv     (lsu_mmu_tlb_va_asid_inv    ),
  .mmu_cp0_tlb_done            (mmu_cp0_tlb_done           ),
  .mmu_lsu_tlb_inv_done        (mmu_lsu_tlb_inv_done       ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .regs_jtlb_cur_flg           (regs_jtlb_cur_flg          ),
  .regs_jtlb_cur_g             (regs_jtlb_cur_g            ),
  .regs_jtlb_cur_ppn           (regs_jtlb_cur_ppn          ),
  .regs_tlboper_cur_asid       (regs_tlboper_cur_asid      ),
  .regs_tlboper_cur_pgs        (regs_tlboper_cur_pgs       ),
  .regs_tlboper_cur_vpn        (regs_tlboper_cur_vpn       ),
  .regs_tlboper_inv_asid       (regs_tlboper_inv_asid      ),
  .regs_tlboper_invall         (regs_tlboper_invall        ),
  .regs_tlboper_invasid        (regs_tlboper_invasid       ),
  .regs_tlboper_mir            (regs_tlboper_mir           ),
  .regs_tlboper_tlbp           (regs_tlboper_tlbp          ),
  .regs_tlboper_tlbr           (regs_tlboper_tlbr          ),
  .regs_tlboper_tlbwi          (regs_tlboper_tlbwi         ),
  .regs_tlboper_tlbwr          (regs_tlboper_tlbwr         ),
  .tlboper_arb_bank_sel        (tlboper_arb_bank_sel       ),
  .tlboper_arb_cmp_va          (tlboper_arb_cmp_va         ),
  .tlboper_arb_data_din        (tlboper_arb_data_din       ),
  .tlboper_arb_fifo_din        (tlboper_arb_fifo_din       ),
  .tlboper_arb_fifo_write      (tlboper_arb_fifo_write     ),
  .tlboper_arb_idx             (tlboper_arb_idx            ),
  .tlboper_arb_idx_not_va      (tlboper_arb_idx_not_va     ),
  .tlboper_arb_req             (tlboper_arb_req            ),
  .tlboper_arb_tag_din         (tlboper_arb_tag_din        ),
  .tlboper_arb_vpn             (tlboper_arb_vpn            ),
  .tlboper_arb_write           (tlboper_arb_write          ),
  .tlboper_jtlb_asid           (tlboper_jtlb_asid          ),
  .tlboper_jtlb_asid_sel       (tlboper_jtlb_asid_sel      ),
  .tlboper_jtlb_cmp_noasid     (tlboper_jtlb_cmp_noasid    ),
  .tlboper_jtlb_inv_asid       (tlboper_jtlb_inv_asid      ),
  .tlboper_jtlb_tlbwr_on       (tlboper_jtlb_tlbwr_on      ),
  .tlboper_ptw_abort           (tlboper_ptw_abort          ),
  .tlboper_regs_cmplt          (tlboper_regs_cmplt         ),
  .tlboper_regs_tlbp_cmplt     (tlboper_regs_tlbp_cmplt    ),
  .tlboper_regs_tlbr_cmplt     (tlboper_regs_tlbr_cmplt    ),
  .tlboper_top_lsu_cmplt       (tlboper_top_lsu_cmplt      ),
  .tlboper_top_lsu_oper        (tlboper_top_lsu_oper       ),
  .tlboper_top_tlbiall_cur_st  (tlboper_top_tlbiall_cur_st ),
  .tlboper_top_tlbiasid_cur_st (tlboper_top_tlbiasid_cur_st),
  .tlboper_top_tlbiva_cur_st   (tlboper_top_tlbiva_cur_st  ),
  .tlboper_top_tlbp_cur_st     (tlboper_top_tlbp_cur_st    ),
  .tlboper_top_tlbr_cur_st     (tlboper_top_tlbr_cur_st    ),
  .tlboper_top_tlbwi_cur_st    (tlboper_top_tlbwi_cur_st   ),
  .tlboper_top_tlbwr_cur_st    (tlboper_top_tlbwr_cur_st   ),
  .tlboper_utlb_clr            (tlboper_utlb_clr           ),
  .tlboper_utlb_inv_va_req     (tlboper_utlb_inv_va_req    ),
  .tlboper_xx_cmplt            (tlboper_xx_cmplt           ),
  .tlboper_xx_pgs              (tlboper_xx_pgs             ),
  .tlboper_xx_pgs_en           (tlboper_xx_pgs_en          )
);


//==========================================================
// Instance jTLB request arbiter
//==========================================================
// &Instance("ct_mmu_arb", "x_ct_mmu_arb"); @69
ct_mmu_arb  x_ct_mmu_arb (
  .arb_dutlb_grant        (arb_dutlb_grant       ),
  .arb_iutlb_grant        (arb_iutlb_grant       ),
  .arb_jtlb_acc_type      (arb_jtlb_acc_type     ),
  .arb_jtlb_bank_sel      (arb_jtlb_bank_sel     ),
  .arb_jtlb_cmp_with_va   (arb_jtlb_cmp_with_va  ),
  .arb_jtlb_data_din      (arb_jtlb_data_din     ),
  .arb_jtlb_fifo_din      (arb_jtlb_fifo_din     ),
  .arb_jtlb_fifo_write    (arb_jtlb_fifo_write   ),
  .arb_jtlb_idx           (arb_jtlb_idx          ),
  .arb_jtlb_req           (arb_jtlb_req          ),
  .arb_jtlb_tag_din       (arb_jtlb_tag_din      ),
  .arb_jtlb_vpn           (arb_jtlb_vpn          ),
  .arb_jtlb_write         (arb_jtlb_write        ),
  .arb_ptw_grant          (arb_ptw_grant         ),
  .arb_ptw_mask           (arb_ptw_mask          ),
  .arb_tlboper_grant      (arb_tlboper_grant     ),
  .arb_top_cur_st         (arb_top_cur_st        ),
  .arb_top_tlboper_on     (arb_top_tlboper_on    ),
  .cp0_mmu_icg_en         (cp0_mmu_icg_en        ),
  .cp0_mmu_no_op_req      (cp0_mmu_no_op_req     ),
  .cpurst_b               (cpurst_b              ),
  .dutlb_arb_cmplt        (dutlb_arb_cmplt       ),
  .dutlb_arb_load         (dutlb_arb_load        ),
  .dutlb_arb_req          (dutlb_arb_req         ),
  .dutlb_arb_vpn          (dutlb_arb_vpn         ),
  .dutlb_xx_mmu_off       (dutlb_xx_mmu_off      ),
  .forever_cpuclk         (forever_cpuclk        ),
  .iutlb_arb_cmplt        (iutlb_arb_cmplt       ),
  .iutlb_arb_req          (iutlb_arb_req         ),
  .iutlb_arb_vpn          (iutlb_arb_vpn         ),
  .jtlb_arb_cmp_va        (jtlb_arb_cmp_va       ),
  .jtlb_arb_par_clr       (jtlb_arb_par_clr      ),
  .jtlb_arb_pfu_cmplt     (jtlb_arb_pfu_cmplt    ),
  .jtlb_arb_pfu_vpn       (jtlb_arb_pfu_vpn      ),
  .jtlb_arb_sel_1g        (jtlb_arb_sel_1g       ),
  .jtlb_arb_sel_2m        (jtlb_arb_sel_2m       ),
  .jtlb_arb_sel_4k        (jtlb_arb_sel_4k       ),
  .jtlb_arb_tc_miss       (jtlb_arb_tc_miss      ),
  .jtlb_arb_type          (jtlb_arb_type         ),
  .jtlb_arb_vpn           (jtlb_arb_vpn          ),
  .lsu_mmu_va2_vld        (lsu_mmu_va2_vld       ),
  .mmu_yy_xx_no_op        (mmu_yy_xx_no_op       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .ptw_arb_bank_sel       (ptw_arb_bank_sel      ),
  .ptw_arb_data_din       (ptw_arb_data_din      ),
  .ptw_arb_fifo_din       (ptw_arb_fifo_din      ),
  .ptw_arb_pgs            (ptw_arb_pgs           ),
  .ptw_arb_req            (ptw_arb_req           ),
  .ptw_arb_tag_din        (ptw_arb_tag_din       ),
  .ptw_arb_vpn            (ptw_arb_vpn           ),
  .tlboper_arb_bank_sel   (tlboper_arb_bank_sel  ),
  .tlboper_arb_cmp_va     (tlboper_arb_cmp_va    ),
  .tlboper_arb_data_din   (tlboper_arb_data_din  ),
  .tlboper_arb_fifo_din   (tlboper_arb_fifo_din  ),
  .tlboper_arb_fifo_write (tlboper_arb_fifo_write),
  .tlboper_arb_idx        (tlboper_arb_idx       ),
  .tlboper_arb_idx_not_va (tlboper_arb_idx_not_va),
  .tlboper_arb_req        (tlboper_arb_req       ),
  .tlboper_arb_tag_din    (tlboper_arb_tag_din   ),
  .tlboper_arb_vpn        (tlboper_arb_vpn       ),
  .tlboper_arb_write      (tlboper_arb_write     ),
  .tlboper_xx_cmplt       (tlboper_xx_cmplt      ),
  .tlboper_xx_pgs         (tlboper_xx_pgs        ),
  .tlboper_xx_pgs_en      (tlboper_xx_pgs_en     )
);


//==========================================================
// Instance jTLB pipeline module
//==========================================================
// &Instance("ct_mmu_jtlb", "x_ct_mmu_jtlb"); @74
ct_mmu_jtlb  x_ct_mmu_jtlb (
  .arb_jtlb_acc_type        (arb_jtlb_acc_type       ),
  .arb_jtlb_bank_sel        (arb_jtlb_bank_sel       ),
  .arb_jtlb_cmp_with_va     (arb_jtlb_cmp_with_va    ),
  .arb_jtlb_data_din        (arb_jtlb_data_din       ),
  .arb_jtlb_fifo_din        (arb_jtlb_fifo_din       ),
  .arb_jtlb_fifo_write      (arb_jtlb_fifo_write     ),
  .arb_jtlb_idx             (arb_jtlb_idx            ),
  .arb_jtlb_req             (arb_jtlb_req            ),
  .arb_jtlb_tag_din         (arb_jtlb_tag_din        ),
  .arb_jtlb_vpn             (arb_jtlb_vpn            ),
  .arb_jtlb_write           (arb_jtlb_write          ),
  .arb_top_cur_st           (arb_top_cur_st          ),
  .cp0_mmu_icg_en           (cp0_mmu_icg_en          ),
  .cp0_mmu_maee             (cp0_mmu_maee            ),
  .cp0_mmu_mpp              (cp0_mmu_mpp             ),
  .cp0_mmu_mprv             (cp0_mmu_mprv            ),
  .cp0_mmu_mxr              (cp0_mmu_mxr             ),
  .cp0_mmu_ptw_en           (cp0_mmu_ptw_en          ),
  .cp0_mmu_sum              (cp0_mmu_sum             ),
  .cp0_yy_priv_mode         (cp0_yy_priv_mode        ),
  .cpurst_b                 (cpurst_b                ),
  .dutlb_xx_mmu_off         (dutlb_xx_mmu_off        ),
  .forever_cpuclk           (forever_cpuclk          ),
  .jtlb_arb_cmp_va          (jtlb_arb_cmp_va         ),
  .jtlb_arb_par_clr         (jtlb_arb_par_clr        ),
  .jtlb_arb_pfu_cmplt       (jtlb_arb_pfu_cmplt      ),
  .jtlb_arb_pfu_vpn         (jtlb_arb_pfu_vpn        ),
  .jtlb_arb_sel_1g          (jtlb_arb_sel_1g         ),
  .jtlb_arb_sel_2m          (jtlb_arb_sel_2m         ),
  .jtlb_arb_sel_4k          (jtlb_arb_sel_4k         ),
  .jtlb_arb_tc_miss         (jtlb_arb_tc_miss        ),
  .jtlb_arb_type            (jtlb_arb_type           ),
  .jtlb_arb_vpn             (jtlb_arb_vpn            ),
  .jtlb_dutlb_acc_err       (jtlb_dutlb_acc_err      ),
  .jtlb_dutlb_pgflt         (jtlb_dutlb_pgflt        ),
  .jtlb_dutlb_ref_cmplt     (jtlb_dutlb_ref_cmplt    ),
  .jtlb_dutlb_ref_pavld     (jtlb_dutlb_ref_pavld    ),
  .jtlb_iutlb_acc_err       (jtlb_iutlb_acc_err      ),
  .jtlb_iutlb_pgflt         (jtlb_iutlb_pgflt        ),
  .jtlb_iutlb_ref_cmplt     (jtlb_iutlb_ref_cmplt    ),
  .jtlb_iutlb_ref_pavld     (jtlb_iutlb_ref_pavld    ),
  .jtlb_ptw_req             (jtlb_ptw_req            ),
  .jtlb_ptw_type            (jtlb_ptw_type           ),
  .jtlb_ptw_vpn             (jtlb_ptw_vpn            ),
  .jtlb_regs_hit            (jtlb_regs_hit           ),
  .jtlb_regs_hit_mult       (jtlb_regs_hit_mult      ),
  .jtlb_regs_tlbp_hit_index (jtlb_regs_tlbp_hit_index),
  .jtlb_tlboper_asid_hit    (jtlb_tlboper_asid_hit   ),
  .jtlb_tlboper_cmplt       (jtlb_tlboper_cmplt      ),
  .jtlb_tlboper_fifo        (jtlb_tlboper_fifo       ),
  .jtlb_tlboper_read_idle   (jtlb_tlboper_read_idle  ),
  .jtlb_tlboper_sel         (jtlb_tlboper_sel        ),
  .jtlb_tlboper_va_hit      (jtlb_tlboper_va_hit     ),
  .jtlb_tlbr_asid           (jtlb_tlbr_asid          ),
  .jtlb_tlbr_flg            (jtlb_tlbr_flg           ),
  .jtlb_tlbr_g              (jtlb_tlbr_g             ),
  .jtlb_tlbr_pgs            (jtlb_tlbr_pgs           ),
  .jtlb_tlbr_ppn            (jtlb_tlbr_ppn           ),
  .jtlb_tlbr_vpn            (jtlb_tlbr_vpn           ),
  .jtlb_top_cur_st          (jtlb_top_cur_st         ),
  .jtlb_top_utlb_pavld      (jtlb_top_utlb_pavld     ),
  .jtlb_utlb_ref_flg        (jtlb_utlb_ref_flg       ),
  .jtlb_utlb_ref_pgs        (jtlb_utlb_ref_pgs       ),
  .jtlb_utlb_ref_ppn        (jtlb_utlb_ref_ppn       ),
  .jtlb_utlb_ref_vpn        (jtlb_utlb_ref_vpn       ),
  .jtlb_xx_fifo             (jtlb_xx_fifo            ),
  .jtlb_xx_tc_read          (jtlb_xx_tc_read         ),
  .lsu_mmu_va2              (lsu_mmu_va2             ),
  .lsu_mmu_va2_vld          (lsu_mmu_va2_vld         ),
  .mmu_lsu_pa2              (mmu_lsu_pa2             ),
  .mmu_lsu_pa2_err          (mmu_lsu_pa2_err         ),
  .mmu_lsu_pa2_vld          (mmu_lsu_pa2_vld         ),
  .mmu_lsu_sec2             (mmu_lsu_sec2            ),
  .mmu_lsu_share2           (mmu_lsu_share2          ),
  .mmu_pmp_pa4              (mmu_pmp_pa4             ),
  .mmu_sysmap_pa4           (mmu_sysmap_pa4          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .pmp_mmu_flg4             (pmp_mmu_flg4            ),
  .ptw_arb_vpn              (ptw_arb_vpn             ),
  .ptw_jtlb_dmiss           (ptw_jtlb_dmiss          ),
  .ptw_jtlb_imiss           (ptw_jtlb_imiss          ),
  .ptw_jtlb_pmiss           (ptw_jtlb_pmiss          ),
  .ptw_jtlb_ref_acc_err     (ptw_jtlb_ref_acc_err    ),
  .ptw_jtlb_ref_cmplt       (ptw_jtlb_ref_cmplt      ),
  .ptw_jtlb_ref_data_vld    (ptw_jtlb_ref_data_vld   ),
  .ptw_jtlb_ref_flg         (ptw_jtlb_ref_flg        ),
  .ptw_jtlb_ref_pgflt       (ptw_jtlb_ref_pgflt      ),
  .ptw_jtlb_ref_pgs         (ptw_jtlb_ref_pgs        ),
  .ptw_jtlb_ref_ppn         (ptw_jtlb_ref_ppn        ),
  .regs_jtlb_cur_asid       (regs_jtlb_cur_asid      ),
  .sysmap_mmu_flg4          (sysmap_mmu_flg4         ),
  .tlboper_jtlb_asid        (tlboper_jtlb_asid       ),
  .tlboper_jtlb_asid_sel    (tlboper_jtlb_asid_sel   ),
  .tlboper_jtlb_cmp_noasid  (tlboper_jtlb_cmp_noasid ),
  .tlboper_jtlb_inv_asid    (tlboper_jtlb_inv_asid   ),
  .tlboper_jtlb_tlbwr_on    (tlboper_jtlb_tlbwr_on   ),
  .tlboper_xx_pgs           (tlboper_xx_pgs          ),
  .tlboper_xx_pgs_en        (tlboper_xx_pgs_en       )
);


//==========================================================
// Instance PTW
//==========================================================
// &Instance("ct_mmu_ptw", "x_ct_mmu_ptw"); @79
ct_mmu_ptw  x_ct_mmu_ptw (
  .arb_ptw_grant         (arb_ptw_grant        ),
  .arb_ptw_mask          (arb_ptw_mask         ),
  .cp0_mmu_icg_en        (cp0_mmu_icg_en       ),
  .cp0_mmu_maee          (cp0_mmu_maee         ),
  .cp0_mmu_mpp           (cp0_mmu_mpp          ),
  .cp0_mmu_mprv          (cp0_mmu_mprv         ),
  .cp0_mmu_mxr           (cp0_mmu_mxr          ),
  .cp0_mmu_sum           (cp0_mmu_sum          ),
  .cp0_yy_priv_mode      (cp0_yy_priv_mode     ),
  .cpurst_b              (cpurst_b             ),
  .dutlb_ptw_wfc         (dutlb_ptw_wfc        ),
  .forever_cpuclk        (forever_cpuclk       ),
  .hpcp_mmu_cnt_en       (hpcp_mmu_cnt_en      ),
  .iutlb_ptw_wfc         (iutlb_ptw_wfc        ),
  .jtlb_ptw_req          (jtlb_ptw_req         ),
  .jtlb_ptw_type         (jtlb_ptw_type        ),
  .jtlb_ptw_vpn          (jtlb_ptw_vpn         ),
  .jtlb_xx_fifo          (jtlb_xx_fifo         ),
  .lsu_mmu_bus_error     (lsu_mmu_bus_error    ),
  .lsu_mmu_data          (lsu_mmu_data         ),
  .lsu_mmu_data_vld      (lsu_mmu_data_vld     ),
  .mmu_hpcp_jtlb_miss    (mmu_hpcp_jtlb_miss   ),
  .mmu_lsu_data_req      (mmu_lsu_data_req     ),
  .mmu_lsu_data_req_addr (mmu_lsu_data_req_addr),
  .mmu_lsu_data_req_size (mmu_lsu_data_req_size),
  .mmu_pmp_fetch3        (mmu_pmp_fetch3       ),
  .mmu_pmp_pa3           (mmu_pmp_pa3          ),
  .mmu_sysmap_pa3        (mmu_sysmap_pa3       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .pmp_mmu_flg3          (pmp_mmu_flg3         ),
  .ptw_arb_bank_sel      (ptw_arb_bank_sel     ),
  .ptw_arb_data_din      (ptw_arb_data_din     ),
  .ptw_arb_fifo_din      (ptw_arb_fifo_din     ),
  .ptw_arb_pgs           (ptw_arb_pgs          ),
  .ptw_arb_req           (ptw_arb_req          ),
  .ptw_arb_tag_din       (ptw_arb_tag_din      ),
  .ptw_arb_vpn           (ptw_arb_vpn          ),
  .ptw_jtlb_dmiss        (ptw_jtlb_dmiss       ),
  .ptw_jtlb_imiss        (ptw_jtlb_imiss       ),
  .ptw_jtlb_pmiss        (ptw_jtlb_pmiss       ),
  .ptw_jtlb_ref_acc_err  (ptw_jtlb_ref_acc_err ),
  .ptw_jtlb_ref_cmplt    (ptw_jtlb_ref_cmplt   ),
  .ptw_jtlb_ref_data_vld (ptw_jtlb_ref_data_vld),
  .ptw_jtlb_ref_flg      (ptw_jtlb_ref_flg     ),
  .ptw_jtlb_ref_pgflt    (ptw_jtlb_ref_pgflt   ),
  .ptw_jtlb_ref_pgs      (ptw_jtlb_ref_pgs     ),
  .ptw_jtlb_ref_ppn      (ptw_jtlb_ref_ppn     ),
  .ptw_top_cur_st        (ptw_top_cur_st       ),
  .ptw_top_imiss         (ptw_top_imiss        ),
  .regs_ptw_cur_asid     (regs_ptw_cur_asid    ),
  .regs_ptw_satp_ppn     (regs_ptw_satp_ppn    ),
  .sysmap_mmu_flg3       (sysmap_mmu_flg3      ),
  .sysmap_mmu_hit3       (sysmap_mmu_hit3      ),
  .tlboper_ptw_abort     (tlboper_ptw_abort    )
);


//==========================================================
// Instance System Map
//==========================================================
// &Force("nonport", "sysmap_mmu_hit0"); @84
// &Force("nonport", "sysmap_mmu_hit1"); @85
// &Force("nonport", "sysmap_mmu_hit2"); @86
// &Force("nonport", "sysmap_mmu_hit4"); @87

// &ConnRule(s/_y/0/); @89
// &Instance("ct_mmu_sysmap", "x_ct_mmu_sysmap_0"); @90
ct_mmu_sysmap  x_ct_mmu_sysmap_0 (
  .mmu_sysmap_pa_y  (mmu_sysmap_pa0  ),
  .sysmap_mmu_flg_y (sysmap_mmu_flg0 ),
  .sysmap_mmu_hit_y (sysmap_mmu_hit0 )
);


// &ConnRule(s/_y/1/); @92
// &Instance("ct_mmu_sysmap", "x_ct_mmu_sysmap_1"); @93
ct_mmu_sysmap  x_ct_mmu_sysmap_1 (
  .mmu_sysmap_pa_y  (mmu_sysmap_pa1  ),
  .sysmap_mmu_flg_y (sysmap_mmu_flg1 ),
  .sysmap_mmu_hit_y (sysmap_mmu_hit1 )
);


// &ConnRule(s/_y/2/); @95
// &Instance("ct_mmu_sysmap", "x_ct_mmu_sysmap_2"); @96
ct_mmu_sysmap  x_ct_mmu_sysmap_2 (
  .mmu_sysmap_pa_y  (mmu_sysmap_pa2  ),
  .sysmap_mmu_flg_y (sysmap_mmu_flg2 ),
  .sysmap_mmu_hit_y (sysmap_mmu_hit2 )
);


// &ConnRule(s/_y/3/); @98
// &Instance("ct_mmu_sysmap", "x_ct_mmu_sysmap_3"); @99
ct_mmu_sysmap  x_ct_mmu_sysmap_3 (
  .mmu_sysmap_pa_y  (mmu_sysmap_pa3  ),
  .sysmap_mmu_flg_y (sysmap_mmu_flg3 ),
  .sysmap_mmu_hit_y (sysmap_mmu_hit3 )
);


// &ConnRule(s/_y/4/); @101
// &Instance("ct_mmu_sysmap", "x_ct_mmu_sysmap_4"); @102
ct_mmu_sysmap  x_ct_mmu_sysmap_4 (
  .mmu_sysmap_pa_y  (mmu_sysmap_pa4  ),
  .sysmap_mmu_flg_y (sysmap_mmu_flg4 ),
  .sysmap_mmu_hit_y (sysmap_mmu_hit4 )
);


// for dbg
assign mmu_had_debug_info[33:0] = {iutlb_top_ref_cur_st[1:0],
                                   dutlb_top_ref_cur_st[2:0], dutlb_top_ref_type,
                                   tlboper_top_tlbp_cur_st[1:0], tlboper_top_tlbr_cur_st[1:0],
                                   tlboper_top_tlbwi_cur_st[1:0], tlboper_top_tlbwr_cur_st[1:0],
                                   tlboper_top_tlbiasid_cur_st[2:0], tlboper_top_tlbiall_cur_st,
                                   tlboper_top_tlbiva_cur_st[3:0], tlboper_top_lsu_oper, tlboper_top_lsu_cmplt,
                                   arb_top_cur_st[1:0], arb_top_tlboper_on, jtlb_top_cur_st[1:0],
                                   ptw_top_cur_st[3:0], ptw_top_imiss};

// for coverage

// &ModuleEnd; @189
endmodule



