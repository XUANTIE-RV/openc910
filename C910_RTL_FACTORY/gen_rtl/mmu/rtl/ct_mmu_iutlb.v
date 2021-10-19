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

// &ModuleBeg; @27
module ct_mmu_iutlb(
  arb_iutlb_grant,
  cp0_mmu_icg_en,
  cp0_mmu_no_op_req,
  cp0_mmu_sum,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  hpcp_mmu_cnt_en,
  ifu_mmu_abort,
  ifu_mmu_va,
  ifu_mmu_va_vld,
  iutlb_arb_cmplt,
  iutlb_arb_req,
  iutlb_arb_vpn,
  iutlb_ptw_wfc,
  iutlb_top_ref_cur_st,
  iutlb_top_scd_updt,
  jtlb_iutlb_acc_err,
  jtlb_iutlb_pgflt,
  jtlb_iutlb_ref_cmplt,
  jtlb_iutlb_ref_pavld,
  jtlb_utlb_ref_flg,
  jtlb_utlb_ref_pgs,
  jtlb_utlb_ref_ppn,
  jtlb_utlb_ref_vpn,
  lsu_mmu_tlb_va,
  mmu_hpcp_iutlb_miss,
  mmu_ifu_buf,
  mmu_ifu_ca,
  mmu_ifu_deny,
  mmu_ifu_pa,
  mmu_ifu_pavld,
  mmu_ifu_pgflt,
  mmu_ifu_sec,
  mmu_pmp_pa2,
  mmu_sysmap_pa2,
  pad_yy_icg_scan_en,
  pmp_mmu_flg2,
  regs_mmu_en,
  regs_utlb_clr,
  sysmap_mmu_flg2,
  tlboper_utlb_clr,
  tlboper_utlb_inv_va_req,
  utlb_clk
);

// &Ports; @28
input           arb_iutlb_grant;        
input           cp0_mmu_icg_en;         
input           cp0_mmu_no_op_req;      
input           cp0_mmu_sum;            
input   [1 :0]  cp0_yy_priv_mode;       
input           cpurst_b;               
input           forever_cpuclk;         
input           hpcp_mmu_cnt_en;        
input           ifu_mmu_abort;          
input   [62:0]  ifu_mmu_va;             
input           ifu_mmu_va_vld;         
input           jtlb_iutlb_acc_err;     
input           jtlb_iutlb_pgflt;       
input           jtlb_iutlb_ref_cmplt;   
input           jtlb_iutlb_ref_pavld;   
input   [13:0]  jtlb_utlb_ref_flg;      
input   [2 :0]  jtlb_utlb_ref_pgs;      
input   [27:0]  jtlb_utlb_ref_ppn;      
input   [26:0]  jtlb_utlb_ref_vpn;      
input   [26:0]  lsu_mmu_tlb_va;         
input           pad_yy_icg_scan_en;     
input   [3 :0]  pmp_mmu_flg2;           
input           regs_mmu_en;            
input           regs_utlb_clr;          
input   [4 :0]  sysmap_mmu_flg2;        
input           tlboper_utlb_clr;       
input           tlboper_utlb_inv_va_req; 
input           utlb_clk;               
output          iutlb_arb_cmplt;        
output          iutlb_arb_req;          
output  [26:0]  iutlb_arb_vpn;          
output          iutlb_ptw_wfc;          
output  [1 :0]  iutlb_top_ref_cur_st;   
output          iutlb_top_scd_updt;     
output          mmu_hpcp_iutlb_miss;    
output          mmu_ifu_buf;            
output          mmu_ifu_ca;             
output          mmu_ifu_deny;           
output  [27:0]  mmu_ifu_pa;             
output          mmu_ifu_pavld;          
output          mmu_ifu_pgflt;          
output          mmu_ifu_sec;            
output  [27:0]  mmu_pmp_pa2;            
output  [27:0]  mmu_sysmap_pa2;         

// &Regs; @29
reg     [3 :0]  iutlb_fst_wen;          
reg             iutlb_miss;             
reg     [27:0]  iutlb_pa_buf;           
reg     [31:0]  iutlb_plru_read_hit;    
reg             jtlb_acc_fault_flop;    
reg             pmp_flg_vld;            
reg     [2 :0]  ref_cur_st;             
reg     [2 :0]  ref_nxt_st;             

// &Wires; @30
wire            arb_iutlb_grant;        
wire            cp0_mach_mode;          
wire            cp0_mmu_icg_en;         
wire            cp0_mmu_no_op_req;      
wire            cp0_mmu_sum;            
wire            cp0_supv_mode;          
wire            cp0_user_mode;          
wire    [1 :0]  cp0_yy_priv_mode;       
wire            cpurst_b;               
wire    [13:0]  entry0_flg;             
wire            entry0_hit;             
wire    [2 :0]  entry0_pgs;             
wire    [27:0]  entry0_ppn;             
wire            entry0_swp;             
wire            entry0_swp_on;          
wire            entry0_upd;             
wire            entry0_vld;             
wire    [26:0]  entry0_vpn;             
wire    [13:0]  entry10_flg;            
wire            entry10_hit;            
wire    [2 :0]  entry10_pgs;            
wire    [27:0]  entry10_ppn;            
wire            entry10_swp;            
wire            entry10_swp_on;         
wire            entry10_upd;            
wire            entry10_vld;            
wire    [13:0]  entry11_flg;            
wire            entry11_hit;            
wire    [2 :0]  entry11_pgs;            
wire    [27:0]  entry11_ppn;            
wire            entry11_swp;            
wire            entry11_swp_on;         
wire            entry11_upd;            
wire            entry11_vld;            
wire    [13:0]  entry12_flg;            
wire            entry12_hit;            
wire    [2 :0]  entry12_pgs;            
wire    [27:0]  entry12_ppn;            
wire            entry12_swp;            
wire            entry12_swp_on;         
wire            entry12_upd;            
wire            entry12_vld;            
wire    [13:0]  entry13_flg;            
wire            entry13_hit;            
wire    [2 :0]  entry13_pgs;            
wire    [27:0]  entry13_ppn;            
wire            entry13_swp;            
wire            entry13_swp_on;         
wire            entry13_upd;            
wire            entry13_vld;            
wire    [13:0]  entry14_flg;            
wire            entry14_hit;            
wire    [2 :0]  entry14_pgs;            
wire    [27:0]  entry14_ppn;            
wire            entry14_swp;            
wire            entry14_swp_on;         
wire            entry14_upd;            
wire            entry14_vld;            
wire    [13:0]  entry15_flg;            
wire            entry15_hit;            
wire    [2 :0]  entry15_pgs;            
wire    [27:0]  entry15_ppn;            
wire            entry15_swp;            
wire            entry15_swp_on;         
wire            entry15_upd;            
wire            entry15_vld;            
wire    [13:0]  entry16_flg;            
wire            entry16_hit;            
wire    [2 :0]  entry16_pgs;            
wire    [27:0]  entry16_ppn;            
wire            entry16_swp;            
wire            entry16_swp_on;         
wire            entry16_upd;            
wire            entry16_vld;            
wire    [26:0]  entry16_vpn;            
wire    [13:0]  entry17_flg;            
wire            entry17_hit;            
wire    [2 :0]  entry17_pgs;            
wire    [27:0]  entry17_ppn;            
wire            entry17_swp;            
wire            entry17_swp_on;         
wire            entry17_upd;            
wire            entry17_vld;            
wire    [13:0]  entry18_flg;            
wire            entry18_hit;            
wire    [2 :0]  entry18_pgs;            
wire    [27:0]  entry18_ppn;            
wire            entry18_swp;            
wire            entry18_swp_on;         
wire            entry18_upd;            
wire            entry18_vld;            
wire    [13:0]  entry19_flg;            
wire            entry19_hit;            
wire    [2 :0]  entry19_pgs;            
wire    [27:0]  entry19_ppn;            
wire            entry19_swp;            
wire            entry19_swp_on;         
wire            entry19_upd;            
wire            entry19_vld;            
wire    [13:0]  entry1_flg;             
wire            entry1_hit;             
wire    [2 :0]  entry1_pgs;             
wire    [27:0]  entry1_ppn;             
wire            entry1_swp;             
wire            entry1_swp_on;          
wire            entry1_upd;             
wire            entry1_vld;             
wire    [13:0]  entry20_flg;            
wire            entry20_hit;            
wire    [2 :0]  entry20_pgs;            
wire    [27:0]  entry20_ppn;            
wire            entry20_swp;            
wire            entry20_swp_on;         
wire            entry20_upd;            
wire            entry20_vld;            
wire    [13:0]  entry21_flg;            
wire            entry21_hit;            
wire    [2 :0]  entry21_pgs;            
wire    [27:0]  entry21_ppn;            
wire            entry21_swp;            
wire            entry21_swp_on;         
wire            entry21_upd;            
wire            entry21_vld;            
wire    [13:0]  entry22_flg;            
wire            entry22_hit;            
wire    [2 :0]  entry22_pgs;            
wire    [27:0]  entry22_ppn;            
wire            entry22_swp;            
wire            entry22_swp_on;         
wire            entry22_upd;            
wire            entry22_vld;            
wire    [13:0]  entry23_flg;            
wire            entry23_hit;            
wire    [2 :0]  entry23_pgs;            
wire    [27:0]  entry23_ppn;            
wire            entry23_swp;            
wire            entry23_swp_on;         
wire            entry23_upd;            
wire            entry23_vld;            
wire    [13:0]  entry24_flg;            
wire            entry24_hit;            
wire    [2 :0]  entry24_pgs;            
wire    [27:0]  entry24_ppn;            
wire            entry24_swp;            
wire            entry24_swp_on;         
wire            entry24_upd;            
wire            entry24_vld;            
wire    [26:0]  entry24_vpn;            
wire    [13:0]  entry25_flg;            
wire            entry25_hit;            
wire    [2 :0]  entry25_pgs;            
wire    [27:0]  entry25_ppn;            
wire            entry25_swp;            
wire            entry25_swp_on;         
wire            entry25_upd;            
wire            entry25_vld;            
wire    [13:0]  entry26_flg;            
wire            entry26_hit;            
wire    [2 :0]  entry26_pgs;            
wire    [27:0]  entry26_ppn;            
wire            entry26_swp;            
wire            entry26_swp_on;         
wire            entry26_upd;            
wire            entry26_vld;            
wire    [13:0]  entry27_flg;            
wire            entry27_hit;            
wire    [2 :0]  entry27_pgs;            
wire    [27:0]  entry27_ppn;            
wire            entry27_swp;            
wire            entry27_swp_on;         
wire            entry27_upd;            
wire            entry27_vld;            
wire    [13:0]  entry28_flg;            
wire            entry28_hit;            
wire    [2 :0]  entry28_pgs;            
wire    [27:0]  entry28_ppn;            
wire            entry28_swp;            
wire            entry28_swp_on;         
wire            entry28_upd;            
wire            entry28_vld;            
wire    [13:0]  entry29_flg;            
wire            entry29_hit;            
wire    [2 :0]  entry29_pgs;            
wire    [27:0]  entry29_ppn;            
wire            entry29_swp;            
wire            entry29_swp_on;         
wire            entry29_upd;            
wire            entry29_vld;            
wire    [13:0]  entry2_flg;             
wire            entry2_hit;             
wire    [2 :0]  entry2_pgs;             
wire    [27:0]  entry2_ppn;             
wire            entry2_swp;             
wire            entry2_swp_on;          
wire            entry2_upd;             
wire            entry2_vld;             
wire    [13:0]  entry30_flg;            
wire            entry30_hit;            
wire    [2 :0]  entry30_pgs;            
wire    [27:0]  entry30_ppn;            
wire            entry30_swp;            
wire            entry30_swp_on;         
wire            entry30_upd;            
wire            entry30_vld;            
wire    [13:0]  entry31_flg;            
wire            entry31_hit;            
wire    [2 :0]  entry31_pgs;            
wire    [27:0]  entry31_ppn;            
wire            entry31_swp;            
wire            entry31_swp_on;         
wire            entry31_upd;            
wire            entry31_vld;            
wire    [13:0]  entry3_flg;             
wire            entry3_hit;             
wire    [2 :0]  entry3_pgs;             
wire    [27:0]  entry3_ppn;             
wire            entry3_swp;             
wire            entry3_swp_on;          
wire            entry3_upd;             
wire            entry3_vld;             
wire    [13:0]  entry4_flg;             
wire            entry4_hit;             
wire    [2 :0]  entry4_pgs;             
wire    [27:0]  entry4_ppn;             
wire            entry4_swp;             
wire            entry4_swp_on;          
wire            entry4_upd;             
wire            entry4_vld;             
wire    [13:0]  entry5_flg;             
wire            entry5_hit;             
wire    [2 :0]  entry5_pgs;             
wire    [27:0]  entry5_ppn;             
wire            entry5_swp;             
wire            entry5_swp_on;          
wire            entry5_upd;             
wire            entry5_vld;             
wire    [13:0]  entry6_flg;             
wire            entry6_hit;             
wire    [2 :0]  entry6_pgs;             
wire    [27:0]  entry6_ppn;             
wire            entry6_swp;             
wire            entry6_swp_on;          
wire            entry6_upd;             
wire            entry6_vld;             
wire    [13:0]  entry7_flg;             
wire            entry7_hit;             
wire    [2 :0]  entry7_pgs;             
wire    [27:0]  entry7_ppn;             
wire            entry7_swp;             
wire            entry7_swp_on;          
wire            entry7_upd;             
wire            entry7_vld;             
wire    [13:0]  entry8_flg;             
wire            entry8_hit;             
wire    [2 :0]  entry8_pgs;             
wire    [27:0]  entry8_ppn;             
wire            entry8_swp;             
wire            entry8_swp_on;          
wire            entry8_upd;             
wire            entry8_vld;             
wire    [26:0]  entry8_vpn;             
wire    [13:0]  entry9_flg;             
wire            entry9_hit;             
wire    [2 :0]  entry9_pgs;             
wire    [27:0]  entry9_ppn;             
wire            entry9_swp;             
wire            entry9_swp_on;          
wire            entry9_upd;             
wire            entry9_vld;             
wire    [31:0]  entry_hit;              
wire    [31:0]  entry_vld;              
wire    [13:0]  flg_fin;                
wire            forever_cpuclk;         
wire            hpcp_mmu_cnt_en;        
wire            ifu_mmu_abort;          
wire    [62:0]  ifu_mmu_va;             
wire            ifu_mmu_va_vld;         
wire            iplru_clk;              
wire            iplru_clk_en;           
wire            iplru_upd_en;           
wire            iutlb_acc_flt;          
wire            iutlb_addr_hit;         
wire            iutlb_addr_hit_vld;     
wire            iutlb_arb_cmplt;        
wire            iutlb_arb_req;          
wire    [26:0]  iutlb_arb_vpn;          
wire            iutlb_bypass_vld;       
wire            iutlb_clk;              
wire            iutlb_clk_en;           
wire            iutlb_disable_vld;      
wire    [31:0]  iutlb_entry_hit;        
wire    [13:0]  iutlb_flg_aft_bypass;   
wire    [13:0]  iutlb_hit_flg_fst;      
wire    [13:0]  iutlb_hit_flg_scd;      
wire    [27:0]  iutlb_hit_pa_fst;       
wire    [27:0]  iutlb_hit_pa_scd;       
wire    [2 :0]  iutlb_hit_pgs_fst;      
wire    [2 :0]  iutlb_hit_pgs_scd;      
wire            iutlb_hit_vld;          
wire            iutlb_miss_cnt;         
wire            iutlb_miss_vld;         
wire    [13:0]  iutlb_off_flg;          
wire            iutlb_off_hit;          
wire    [27:0]  iutlb_off_pa;           
wire    [2 :0]  iutlb_off_pgs;          
wire    [27:0]  iutlb_pa_aft_bypass;    
wire            iutlb_pa_vld;           
wire            iutlb_page_fault;       
wire            iutlb_plru_read_hit_vld; 
wire            iutlb_plru_refill_on;   
wire            iutlb_plru_refill_vld;  
wire            iutlb_pmp_chk_vld;      
wire            iutlb_ptw_wfc;          
wire            iutlb_ref_pgflt;        
wire            iutlb_refill_on;        
wire            iutlb_refill_vld;       
wire            iutlb_swp_en;           
wire    [1 :0]  iutlb_top_ref_cur_st;   
wire            iutlb_top_scd_updt;     
wire            iutlb_va_illegal;       
wire            iutlb_wfc;              
wire            jtlb_acc_fault;         
wire            jtlb_iutlb_acc_err;     
wire            jtlb_iutlb_pgflt;       
wire            jtlb_iutlb_ref_cmplt;   
wire            jtlb_iutlb_ref_pavld;   
wire    [13:0]  jtlb_utlb_ref_flg;      
wire    [2 :0]  jtlb_utlb_ref_pgs;      
wire    [27:0]  jtlb_utlb_ref_ppn;      
wire    [26:0]  jtlb_utlb_ref_vpn;      
wire    [26:0]  lsu_mmu_tlb_va;         
wire            mmu_hpcp_iutlb_miss;    
wire            mmu_ifu_buf;            
wire            mmu_ifu_ca;             
wire            mmu_ifu_deny;           
wire    [27:0]  mmu_ifu_pa;             
wire            mmu_ifu_pavld;          
wire            mmu_ifu_pgflt;          
wire            mmu_ifu_sec;            
wire    [27:0]  mmu_pmp_pa2;            
wire    [27:0]  mmu_sysmap_pa2;         
wire    [27:0]  pa_fin;                 
wire    [26:0]  pa_offset;              
wire            pabuf_clk;              
wire            pabuf_clk_en;           
wire            pad_yy_icg_scan_en;     
wire    [2 :0]  pgs_fin;                
wire    [31:0]  plru_iutlb_ref_num;     
wire    [3 :0]  pmp_mmu_flg2;           
wire            regs_mmu_en;            
wire            regs_utlb_clr;          
wire    [4 :0]  sysmap_mmu_flg2;        
wire            tlboper_utlb_clr;       
wire            tlboper_utlb_inv_va_req; 
wire            utlb_clk;               
wire    [13:0]  utlb_fst_swp_flg;       
wire    [2 :0]  utlb_fst_swp_pgs;       
wire    [27:0]  utlb_fst_swp_ppn;       
wire    [26:0]  utlb_fst_swp_vpn;       
wire    [26:0]  utlb_req_vpn;           
wire    [13:0]  utlb_swp_flg;           
wire            utlb_swp_on;            
wire    [2 :0]  utlb_swp_pgs;           
wire    [27:0]  utlb_swp_ppn;           
wire    [26:0]  utlb_swp_vpn;           
wire    [13:0]  utlb_upd_flg;           
wire    [2 :0]  utlb_upd_pgs;           
wire    [27:0]  utlb_upd_ppn;           
wire    [26:0]  utlb_upd_vpn;           


//==========================================================
// parameters for value width
//==========================================================
parameter VPN_WIDTH = 39-12;  // VPN
parameter PPN_WIDTH = 40-12;  // PPN
parameter FLG_WIDTH = 14;     // Flags
parameter PGS_WIDTH = 3;      // Page Size
parameter VPN_PERLEL = 9;

//==========================================================
//                  Gate Cell
//==========================================================
assign iutlb_clk_en = ifu_mmu_va_vld && !iutlb_addr_hit && !iutlb_off_hit
                   || iutlb_refill_on
                   || jtlb_acc_fault
                   || jtlb_acc_fault_flop
                   || iutlb_miss;
// &Instance("gated_clk_cell", "x_iutlb_gateclk"); @49
gated_clk_cell  x_iutlb_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (iutlb_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (iutlb_clk_en      ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @50
//           .external_en(1'b0          ), @51
//           .global_en  (1'b1          ), @52
//           .module_en  (cp0_mmu_icg_en), @53
//           .local_en   (iutlb_clk_en  ), @54
//           .clk_out    (iutlb_clk     ) @55
//          ); @56

//==============================================================================
//                  Control Path
//==============================================================================

// current privlidged mode
assign cp0_user_mode = cp0_yy_priv_mode[1:0] == 2'b00;
assign cp0_supv_mode = cp0_yy_priv_mode[1:0] == 2'b01;
assign cp0_mach_mode = cp0_yy_priv_mode[1:0] == 2'b11;

//==========================================================
//                  Tranlation Related Signal
//==========================================================
//----------------------------------------------------------
//                  Addr Translation Cmplt
//----------------------------------------------------------
// 1. when utlb hit, return pvald to IFU
// 2. when change flow, later ultlb hit can bypass the pre-
//    vious utlb miss, but later utlb miss must be blocking
assign iutlb_hit_vld  =  ifu_mmu_va_vld
                      && iutlb_addr_hit;

// I-uTLB trans cmplt without addr match in utlb:
// 1. when mmu is not enabled or CPU at M-Mode
// 2. when utlb refill cmplt, and no abort happend
//assign iutlb_bypass_vld  = iutlb_refill_cmplt;
assign iutlb_bypass_vld  = 1'b0;
assign iutlb_off_hit     = !regs_mmu_en || cp0_mach_mode;
assign iutlb_disable_vld = ifu_mmu_va_vld && iutlb_off_hit;

//----------------------------------------------------------
//                  Interface to IFU
//----------------------------------------------------------
// Paddr is valid when:
// 1. utlb hit 
// 2. utlb refill cmplt, no matter exception or not
// 3. mmu is disabled
// &Force("output", "mmu_ifu_pavld"); @94
assign mmu_ifu_pavld = iutlb_bypass_vld
                    || (iutlb_hit_vld
                         || iutlb_disable_vld
                         || iutlb_acc_flt
                         || iutlb_ref_pgflt
                         || iutlb_va_illegal
                       ) ; //&& !iutlb_refill_on; // support hit under miss

assign mmu_ifu_pa[PPN_WIDTH-1:0] = iutlb_pa_aft_bypass[PPN_WIDTH-1:0]; 


// flags judgement
// pmas to ifu: bufferable, security, cacheable
assign mmu_ifu_buf      = iutlb_flg_aft_bypass[11]
                      || !iutlb_flg_aft_bypass[13]; //when !so, always buf

assign mmu_ifu_sec      = iutlb_flg_aft_bypass[9];
assign mmu_ifu_ca       = iutlb_flg_aft_bypass[12];

// R W X judgement, R and W are not used in I-uTLB
// page fault when not valid
// page fault when writeable but not readable
// page fault when not executable
// page fault when supv access user region and vise versa
// page fault when A/D bit violation
// page fault when ifu meets strong order
// page fault when tfatal and tmiss from jTLB
// page fault when ifu high va not legal
assign iutlb_va_illegal = (ifu_mmu_va[VPN_WIDTH+10] && !(&ifu_mmu_va[62:VPN_WIDTH+11])
                      ||  !ifu_mmu_va[VPN_WIDTH+10] &&  (|ifu_mmu_va[62:VPN_WIDTH+11]))
                          && !iutlb_off_hit && ifu_mmu_va_vld;
assign iutlb_page_fault = (!iutlb_flg_aft_bypass[0]
                        || !iutlb_flg_aft_bypass[1] && iutlb_flg_aft_bypass[2]
                        || !iutlb_flg_aft_bypass[3]
                        ||  iutlb_flg_aft_bypass[4] && cp0_supv_mode && !cp0_mmu_sum 
                        || !iutlb_flg_aft_bypass[4] && cp0_user_mode && regs_mmu_en
                        || !iutlb_flg_aft_bypass[5]
                        ||  iutlb_flg_aft_bypass[13]
                        ||  iutlb_ref_pgflt
                        ||  iutlb_va_illegal) 
                        && !jtlb_acc_fault;

assign mmu_ifu_pgflt    = iutlb_page_fault;

// access deny when pmp check fail
// &Force("bus", "pmp_mmu_flg2", 3, 0); @140
assign mmu_ifu_deny = jtlb_acc_fault_flop
                   // L-bit for M-Mode
                   || !pmp_mmu_flg2[2] && !(cp0_mach_mode && !pmp_mmu_flg2[3])
                       && pmp_flg_vld; 

//==========================================================
//                  uTLB Replacement Logic
//==========================================================
//----------------------------------------------------------
//                  uTLB Replacement Algorithm
//----------------------------------------------------------
// 1. when there is empty entry avaleble, use empty entry
// 2. when there is no empry entry, use PLRU
// &ConnRule(s/^utlb/iutlb/); @154
// &Instance("ct_mmu_iplru","x_ct_mmu_iplru"); @155
ct_mmu_iplru  x_ct_mmu_iplru (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .entry0_vld              (entry0_vld             ),
  .entry10_vld             (entry10_vld            ),
  .entry11_vld             (entry11_vld            ),
  .entry12_vld             (entry12_vld            ),
  .entry13_vld             (entry13_vld            ),
  .entry14_vld             (entry14_vld            ),
  .entry15_vld             (entry15_vld            ),
  .entry16_vld             (entry16_vld            ),
  .entry17_vld             (entry17_vld            ),
  .entry18_vld             (entry18_vld            ),
  .entry19_vld             (entry19_vld            ),
  .entry1_vld              (entry1_vld             ),
  .entry20_vld             (entry20_vld            ),
  .entry21_vld             (entry21_vld            ),
  .entry22_vld             (entry22_vld            ),
  .entry23_vld             (entry23_vld            ),
  .entry24_vld             (entry24_vld            ),
  .entry25_vld             (entry25_vld            ),
  .entry26_vld             (entry26_vld            ),
  .entry27_vld             (entry27_vld            ),
  .entry28_vld             (entry28_vld            ),
  .entry29_vld             (entry29_vld            ),
  .entry2_vld              (entry2_vld             ),
  .entry30_vld             (entry30_vld            ),
  .entry31_vld             (entry31_vld            ),
  .entry3_vld              (entry3_vld             ),
  .entry4_vld              (entry4_vld             ),
  .entry5_vld              (entry5_vld             ),
  .entry6_vld              (entry6_vld             ),
  .entry7_vld              (entry7_vld             ),
  .entry8_vld              (entry8_vld             ),
  .entry9_vld              (entry9_vld             ),
  .forever_cpuclk          (forever_cpuclk         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .plru_iutlb_ref_num      (plru_iutlb_ref_num     ),
  .utlb_plru_read_hit      (iutlb_plru_read_hit    ),
  .utlb_plru_read_hit_vld  (iutlb_plru_read_hit_vld),
  .utlb_plru_refill_on     (iutlb_plru_refill_on   ),
  .utlb_plru_refill_vld    (iutlb_plru_refill_vld  )
);


assign iutlb_plru_refill_on  = iutlb_wfc;
assign iutlb_plru_refill_vld = iutlb_refill_vld;

assign iplru_upd_en = ifu_mmu_va_vld && (iutlb_plru_read_hit[31:0] != iutlb_entry_hit[31:0]);
assign iplru_clk_en = iplru_upd_en;
// &Instance("gated_clk_cell", "x_iutlb_plru_gateclk"); @162
gated_clk_cell  x_iutlb_plru_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (iplru_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (iplru_clk_en      ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @163
//           .external_en(1'b0          ), @164
//           .global_en  (1'b1          ), @165
//           .module_en  (cp0_mmu_icg_en), @166
//           .local_en   (iplru_clk_en  ), @167
//           .clk_out    (iplru_clk     ) @168
//          ); @169

always @(posedge iplru_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    iutlb_plru_read_hit[31:0] <= 32'b0;
  else if(iplru_upd_en)
    iutlb_plru_read_hit[31:0] <= iutlb_entry_hit[31:0];
end

assign iutlb_plru_read_hit_vld = |iutlb_plru_read_hit[31:0];

//==========================================================
//                  uTLB Refill SM
//==========================================================
//----------------------------------------------------------
//                  L0 uTLB(0-3) SM State
//----------------------------------------------------------
// 1. FST_CMP: compare with iutlb 0-3 (for timing)
// 2. SCD_CMP: compare with iutlb 4-15
//             exchange 4-15 with 0-3 using fifo
//parameter FST_CMP = 1'b0,
//          SCD_CMP = 1'b1;
//
//assign iutlb_miss_vld_fst = ifu_mmu_va_vld && !iutlb_addr_hit_fst
//                                           //&& !iutlb_page_fault
//                                           && regs_mmu_en
//                                           && !cp0_mmu_no_op_req;
//
//always @(posedge iutlb_clk or negedge cpurst_b)
//begin
//  if (!cpurst_b)
//    cmp_cur_st <= FST_CMP;
//  else
//    cmp_cur_st <= cmp_nxt_st;
//end
//
//&CombBeg;
//case (cmp_cur_st)
//FST_CMP:
//begin
//  if(iutlb_miss_vld_fst && iutlb_entry_hit_vld_scd && !ifu_mmu_abort)
//    cmp_nxt_st = SCD_CMP;
//  else
//    cmp_nxt_st = FST_CMP;
//end
//SCD_CMP:
//begin
//  cmp_nxt_st = FST_CMP;
//end
//default:
//begin
//  cmp_nxt_st = FST_CMP;
//end
//endcase
//&CombEnd;
//
//assign iutlb_fst = (cmp_cur_st == FST_CMP);
//assign iutlb_scd = (cmp_cur_st == SCD_CMP);

assign iutlb_top_scd_updt = iutlb_swp_en;

//----------------------------------------------------------
//                  SM State
//----------------------------------------------------------
// 1. IDLE: default state; wait grant when utlb miss
// 2. WFC : wait utlb refill cmplt to refill utlb
// 3. ABT : wait utlb refill cmplt when abort happened
parameter IDLE  = 3'b000,
          WFG   = 3'b001,
          WFC   = 3'b010,
          PGFLT = 3'b100,
          ACFLT = 3'b110,
          ABT   = 3'b011;

//  When utlb miss and mmu is enabled, utlb refill SM will
//  be started
assign iutlb_miss_vld = ifu_mmu_va_vld && !iutlb_addr_hit_vld
                                       //&& !iutlb_page_fault
                                       && !iutlb_off_hit
                                       && !cp0_mmu_no_op_req;

always @(posedge iutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ref_cur_st[2:0] <= 3'b0;
  else
    ref_cur_st[2:0] <= ref_nxt_st[2:0];
end

// &CombBeg; @259
always @( ref_cur_st
       or jtlb_iutlb_ref_cmplt
       or ifu_mmu_abort
       or jtlb_iutlb_pgflt
       or arb_iutlb_grant
       or iutlb_miss_vld)
begin
case (ref_cur_st)
IDLE:
begin
  if(ifu_mmu_abort)
    ref_nxt_st[2:0] = IDLE;
  else if(iutlb_miss_vld)
    ref_nxt_st[2:0] = WFG;
  else
    ref_nxt_st[2:0] = IDLE;
end
WFG:
begin
  if(ifu_mmu_abort && arb_iutlb_grant)
    ref_nxt_st[2:0] = ABT;
  else if(ifu_mmu_abort)
    ref_nxt_st[2:0] = IDLE;
  else if(arb_iutlb_grant)
    ref_nxt_st[2:0] = WFC;
  else
    ref_nxt_st[2:0] = WFG;
end
WFC:
begin
  if(ifu_mmu_abort && jtlb_iutlb_ref_cmplt)
    ref_nxt_st[2:0] = IDLE;
  else if(ifu_mmu_abort)
    ref_nxt_st[2:0] = ABT;
  else if(jtlb_iutlb_ref_cmplt && jtlb_iutlb_pgflt)
    ref_nxt_st[2:0] = PGFLT;
  else if(jtlb_iutlb_ref_cmplt)
    ref_nxt_st[2:0] = IDLE;
  else
    ref_nxt_st[2:0] = WFC;
end
PGFLT:
begin
  ref_nxt_st[2:0] = IDLE;
end
ABT:
begin
  if(jtlb_iutlb_ref_cmplt)
    ref_nxt_st[2:0] = IDLE;
  else
    ref_nxt_st[2:0] = ABT;
end
default:
begin
   ref_nxt_st[2:0] = IDLE;
end
endcase
// &CombEnd; @310
end


//----------------------------------------------------------
//                  SM Control Signal
//----------------------------------------------------------
// Req jtlb when utlb miss
// 1. req only in IDLE, so utlb refill is blocking
// &Force("bus", "ifu_mmu_va", 62, 0); @318
assign iutlb_arb_req       = (ref_cur_st[2:0] == WFG);
assign iutlb_arb_vpn[VPN_WIDTH-1:0] = ifu_mmu_va[VPN_WIDTH+10:11];

assign iutlb_refill_on     = (ref_cur_st[2:0] != IDLE);

// uTLB refill cmplt
// 1. jtlb hit
// 2. ptw cmplt, either data vld or acc err
// 3. refill utlb only when ptw cmplt with data vld
assign iutlb_wfc = (ref_cur_st[2:0] == WFC);
//assign iutlb_refill_cmplt = iutlb_wfc && jtlb_iutlb_ref_cmplt;
assign iutlb_refill_vld   = iutlb_wfc && jtlb_iutlb_ref_pavld;

assign iutlb_ref_pgflt    = (ref_cur_st[2:0] == PGFLT);

//assign iutlb_arb_cmplt    = (ref_cur_st[2:0] != IDLE) && (ref_nxt_st[2:0] == IDLE);
assign iutlb_arb_cmplt    = (ref_cur_st[2:0] == WFC) && jtlb_iutlb_ref_cmplt
                         || (ref_cur_st[2:0] == ABT) && jtlb_iutlb_ref_cmplt;

// for hpcp
assign iutlb_miss_cnt = iutlb_refill_vld && hpcp_mmu_cnt_en;

always @(posedge iutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    iutlb_miss <= 1'b0;
  else if(iutlb_miss_cnt)
    iutlb_miss <= 1'b1;
  else if(iutlb_miss)
    iutlb_miss <= 1'b0;
end

assign mmu_hpcp_iutlb_miss = iutlb_miss;

//==============================================================================
//                  Data Path
//==============================================================================
//==========================================================
//                  uTLB Entry
//==========================================================
assign utlb_req_vpn[VPN_WIDTH-1:0] = ifu_mmu_va[VPN_WIDTH+10:11];

// &ConnRule(s/utlb_entry/entry0/); @365
// &Instance("ct_mmu_iutlb_fst_entry","x_ct_mmu_iutlb_entry0"); @366
ct_mmu_iutlb_fst_entry  x_ct_mmu_iutlb_entry0 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry0_flg             ),
  .utlb_entry_hit          (entry0_hit             ),
  .utlb_entry_pgs          (entry0_pgs             ),
  .utlb_entry_ppn          (entry0_ppn             ),
  .utlb_entry_swp          (entry0_swp             ),
  .utlb_entry_swp_on       (entry0_swp_on          ),
  .utlb_entry_upd          (entry0_upd             ),
  .utlb_entry_vld          (entry0_vld             ),
  .utlb_entry_vpn          (entry0_vpn             ),
  .utlb_fst_swp_flg        (utlb_fst_swp_flg       ),
  .utlb_fst_swp_pgs        (utlb_fst_swp_pgs       ),
  .utlb_fst_swp_ppn        (utlb_fst_swp_ppn       ),
  .utlb_fst_swp_vpn        (utlb_fst_swp_vpn       ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry1/); @368
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry1"); @369
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry1 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry1_flg             ),
  .utlb_entry_hit          (entry1_hit             ),
  .utlb_entry_pgs          (entry1_pgs             ),
  .utlb_entry_ppn          (entry1_ppn             ),
  .utlb_entry_swp          (entry1_swp             ),
  .utlb_entry_swp_on       (entry1_swp_on          ),
  .utlb_entry_upd          (entry1_upd             ),
  .utlb_entry_vld          (entry1_vld             ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry2/); @371
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry2"); @372
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry2 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry2_flg             ),
  .utlb_entry_hit          (entry2_hit             ),
  .utlb_entry_pgs          (entry2_pgs             ),
  .utlb_entry_ppn          (entry2_ppn             ),
  .utlb_entry_swp          (entry2_swp             ),
  .utlb_entry_swp_on       (entry2_swp_on          ),
  .utlb_entry_upd          (entry2_upd             ),
  .utlb_entry_vld          (entry2_vld             ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry3/); @374
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry3"); @375
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry3 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry3_flg             ),
  .utlb_entry_hit          (entry3_hit             ),
  .utlb_entry_pgs          (entry3_pgs             ),
  .utlb_entry_ppn          (entry3_ppn             ),
  .utlb_entry_swp          (entry3_swp             ),
  .utlb_entry_swp_on       (entry3_swp_on          ),
  .utlb_entry_upd          (entry3_upd             ),
  .utlb_entry_vld          (entry3_vld             ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry4/); @377
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry4"); @378
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry4 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry4_flg             ),
  .utlb_entry_hit          (entry4_hit             ),
  .utlb_entry_pgs          (entry4_pgs             ),
  .utlb_entry_ppn          (entry4_ppn             ),
  .utlb_entry_swp          (entry4_swp             ),
  .utlb_entry_swp_on       (entry4_swp_on          ),
  .utlb_entry_upd          (entry4_upd             ),
  .utlb_entry_vld          (entry4_vld             ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry5/); @380
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry5"); @381
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry5 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry5_flg             ),
  .utlb_entry_hit          (entry5_hit             ),
  .utlb_entry_pgs          (entry5_pgs             ),
  .utlb_entry_ppn          (entry5_ppn             ),
  .utlb_entry_swp          (entry5_swp             ),
  .utlb_entry_swp_on       (entry5_swp_on          ),
  .utlb_entry_upd          (entry5_upd             ),
  .utlb_entry_vld          (entry5_vld             ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry6/); @383
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry6"); @384
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry6 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry6_flg             ),
  .utlb_entry_hit          (entry6_hit             ),
  .utlb_entry_pgs          (entry6_pgs             ),
  .utlb_entry_ppn          (entry6_ppn             ),
  .utlb_entry_swp          (entry6_swp             ),
  .utlb_entry_swp_on       (entry6_swp_on          ),
  .utlb_entry_upd          (entry6_upd             ),
  .utlb_entry_vld          (entry6_vld             ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry7/); @386
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry7"); @387
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry7 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry7_flg             ),
  .utlb_entry_hit          (entry7_hit             ),
  .utlb_entry_pgs          (entry7_pgs             ),
  .utlb_entry_ppn          (entry7_ppn             ),
  .utlb_entry_swp          (entry7_swp             ),
  .utlb_entry_swp_on       (entry7_swp_on          ),
  .utlb_entry_upd          (entry7_upd             ),
  .utlb_entry_vld          (entry7_vld             ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry8/); @389
// &Instance("ct_mmu_iutlb_fst_entry","x_ct_mmu_iutlb_entry8"); @390
ct_mmu_iutlb_fst_entry  x_ct_mmu_iutlb_entry8 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry8_flg             ),
  .utlb_entry_hit          (entry8_hit             ),
  .utlb_entry_pgs          (entry8_pgs             ),
  .utlb_entry_ppn          (entry8_ppn             ),
  .utlb_entry_swp          (entry8_swp             ),
  .utlb_entry_swp_on       (entry8_swp_on          ),
  .utlb_entry_upd          (entry8_upd             ),
  .utlb_entry_vld          (entry8_vld             ),
  .utlb_entry_vpn          (entry8_vpn             ),
  .utlb_fst_swp_flg        (utlb_fst_swp_flg       ),
  .utlb_fst_swp_pgs        (utlb_fst_swp_pgs       ),
  .utlb_fst_swp_ppn        (utlb_fst_swp_ppn       ),
  .utlb_fst_swp_vpn        (utlb_fst_swp_vpn       ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry9/); @392
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry9"); @393
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry9 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry9_flg             ),
  .utlb_entry_hit          (entry9_hit             ),
  .utlb_entry_pgs          (entry9_pgs             ),
  .utlb_entry_ppn          (entry9_ppn             ),
  .utlb_entry_swp          (entry9_swp             ),
  .utlb_entry_swp_on       (entry9_swp_on          ),
  .utlb_entry_upd          (entry9_upd             ),
  .utlb_entry_vld          (entry9_vld             ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry10/); @395
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry10"); @396
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry10 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry10_flg            ),
  .utlb_entry_hit          (entry10_hit            ),
  .utlb_entry_pgs          (entry10_pgs            ),
  .utlb_entry_ppn          (entry10_ppn            ),
  .utlb_entry_swp          (entry10_swp            ),
  .utlb_entry_swp_on       (entry10_swp_on         ),
  .utlb_entry_upd          (entry10_upd            ),
  .utlb_entry_vld          (entry10_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry11/); @398
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry11"); @399
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry11 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry11_flg            ),
  .utlb_entry_hit          (entry11_hit            ),
  .utlb_entry_pgs          (entry11_pgs            ),
  .utlb_entry_ppn          (entry11_ppn            ),
  .utlb_entry_swp          (entry11_swp            ),
  .utlb_entry_swp_on       (entry11_swp_on         ),
  .utlb_entry_upd          (entry11_upd            ),
  .utlb_entry_vld          (entry11_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry12/); @401
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry12"); @402
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry12 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry12_flg            ),
  .utlb_entry_hit          (entry12_hit            ),
  .utlb_entry_pgs          (entry12_pgs            ),
  .utlb_entry_ppn          (entry12_ppn            ),
  .utlb_entry_swp          (entry12_swp            ),
  .utlb_entry_swp_on       (entry12_swp_on         ),
  .utlb_entry_upd          (entry12_upd            ),
  .utlb_entry_vld          (entry12_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry13/); @404
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry13"); @405
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry13 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry13_flg            ),
  .utlb_entry_hit          (entry13_hit            ),
  .utlb_entry_pgs          (entry13_pgs            ),
  .utlb_entry_ppn          (entry13_ppn            ),
  .utlb_entry_swp          (entry13_swp            ),
  .utlb_entry_swp_on       (entry13_swp_on         ),
  .utlb_entry_upd          (entry13_upd            ),
  .utlb_entry_vld          (entry13_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry14/); @407
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry14"); @408
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry14 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry14_flg            ),
  .utlb_entry_hit          (entry14_hit            ),
  .utlb_entry_pgs          (entry14_pgs            ),
  .utlb_entry_ppn          (entry14_ppn            ),
  .utlb_entry_swp          (entry14_swp            ),
  .utlb_entry_swp_on       (entry14_swp_on         ),
  .utlb_entry_upd          (entry14_upd            ),
  .utlb_entry_vld          (entry14_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry15/); @410
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry15"); @411
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry15 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry15_flg            ),
  .utlb_entry_hit          (entry15_hit            ),
  .utlb_entry_pgs          (entry15_pgs            ),
  .utlb_entry_ppn          (entry15_ppn            ),
  .utlb_entry_swp          (entry15_swp            ),
  .utlb_entry_swp_on       (entry15_swp_on         ),
  .utlb_entry_upd          (entry15_upd            ),
  .utlb_entry_vld          (entry15_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry16/); @413
// &Instance("ct_mmu_iutlb_fst_entry","x_ct_mmu_iutlb_entry16"); @414
ct_mmu_iutlb_fst_entry  x_ct_mmu_iutlb_entry16 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry16_flg            ),
  .utlb_entry_hit          (entry16_hit            ),
  .utlb_entry_pgs          (entry16_pgs            ),
  .utlb_entry_ppn          (entry16_ppn            ),
  .utlb_entry_swp          (entry16_swp            ),
  .utlb_entry_swp_on       (entry16_swp_on         ),
  .utlb_entry_upd          (entry16_upd            ),
  .utlb_entry_vld          (entry16_vld            ),
  .utlb_entry_vpn          (entry16_vpn            ),
  .utlb_fst_swp_flg        (utlb_fst_swp_flg       ),
  .utlb_fst_swp_pgs        (utlb_fst_swp_pgs       ),
  .utlb_fst_swp_ppn        (utlb_fst_swp_ppn       ),
  .utlb_fst_swp_vpn        (utlb_fst_swp_vpn       ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry17/); @416
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry17"); @417
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry17 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry17_flg            ),
  .utlb_entry_hit          (entry17_hit            ),
  .utlb_entry_pgs          (entry17_pgs            ),
  .utlb_entry_ppn          (entry17_ppn            ),
  .utlb_entry_swp          (entry17_swp            ),
  .utlb_entry_swp_on       (entry17_swp_on         ),
  .utlb_entry_upd          (entry17_upd            ),
  .utlb_entry_vld          (entry17_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry18/); @419
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry18"); @420
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry18 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry18_flg            ),
  .utlb_entry_hit          (entry18_hit            ),
  .utlb_entry_pgs          (entry18_pgs            ),
  .utlb_entry_ppn          (entry18_ppn            ),
  .utlb_entry_swp          (entry18_swp            ),
  .utlb_entry_swp_on       (entry18_swp_on         ),
  .utlb_entry_upd          (entry18_upd            ),
  .utlb_entry_vld          (entry18_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry19/); @422
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry19"); @423
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry19 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry19_flg            ),
  .utlb_entry_hit          (entry19_hit            ),
  .utlb_entry_pgs          (entry19_pgs            ),
  .utlb_entry_ppn          (entry19_ppn            ),
  .utlb_entry_swp          (entry19_swp            ),
  .utlb_entry_swp_on       (entry19_swp_on         ),
  .utlb_entry_upd          (entry19_upd            ),
  .utlb_entry_vld          (entry19_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry20/); @425
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry20"); @426
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry20 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry20_flg            ),
  .utlb_entry_hit          (entry20_hit            ),
  .utlb_entry_pgs          (entry20_pgs            ),
  .utlb_entry_ppn          (entry20_ppn            ),
  .utlb_entry_swp          (entry20_swp            ),
  .utlb_entry_swp_on       (entry20_swp_on         ),
  .utlb_entry_upd          (entry20_upd            ),
  .utlb_entry_vld          (entry20_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry21/); @428
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry21"); @429
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry21 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry21_flg            ),
  .utlb_entry_hit          (entry21_hit            ),
  .utlb_entry_pgs          (entry21_pgs            ),
  .utlb_entry_ppn          (entry21_ppn            ),
  .utlb_entry_swp          (entry21_swp            ),
  .utlb_entry_swp_on       (entry21_swp_on         ),
  .utlb_entry_upd          (entry21_upd            ),
  .utlb_entry_vld          (entry21_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry22/); @431
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry22"); @432
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry22 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry22_flg            ),
  .utlb_entry_hit          (entry22_hit            ),
  .utlb_entry_pgs          (entry22_pgs            ),
  .utlb_entry_ppn          (entry22_ppn            ),
  .utlb_entry_swp          (entry22_swp            ),
  .utlb_entry_swp_on       (entry22_swp_on         ),
  .utlb_entry_upd          (entry22_upd            ),
  .utlb_entry_vld          (entry22_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry23/); @434
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry23"); @435
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry23 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry23_flg            ),
  .utlb_entry_hit          (entry23_hit            ),
  .utlb_entry_pgs          (entry23_pgs            ),
  .utlb_entry_ppn          (entry23_ppn            ),
  .utlb_entry_swp          (entry23_swp            ),
  .utlb_entry_swp_on       (entry23_swp_on         ),
  .utlb_entry_upd          (entry23_upd            ),
  .utlb_entry_vld          (entry23_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry24/); @437
// &Instance("ct_mmu_iutlb_fst_entry","x_ct_mmu_iutlb_entry24"); @438
ct_mmu_iutlb_fst_entry  x_ct_mmu_iutlb_entry24 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry24_flg            ),
  .utlb_entry_hit          (entry24_hit            ),
  .utlb_entry_pgs          (entry24_pgs            ),
  .utlb_entry_ppn          (entry24_ppn            ),
  .utlb_entry_swp          (entry24_swp            ),
  .utlb_entry_swp_on       (entry24_swp_on         ),
  .utlb_entry_upd          (entry24_upd            ),
  .utlb_entry_vld          (entry24_vld            ),
  .utlb_entry_vpn          (entry24_vpn            ),
  .utlb_fst_swp_flg        (utlb_fst_swp_flg       ),
  .utlb_fst_swp_pgs        (utlb_fst_swp_pgs       ),
  .utlb_fst_swp_ppn        (utlb_fst_swp_ppn       ),
  .utlb_fst_swp_vpn        (utlb_fst_swp_vpn       ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry25/); @440
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry25"); @441
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry25 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry25_flg            ),
  .utlb_entry_hit          (entry25_hit            ),
  .utlb_entry_pgs          (entry25_pgs            ),
  .utlb_entry_ppn          (entry25_ppn            ),
  .utlb_entry_swp          (entry25_swp            ),
  .utlb_entry_swp_on       (entry25_swp_on         ),
  .utlb_entry_upd          (entry25_upd            ),
  .utlb_entry_vld          (entry25_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry26/); @443
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry26"); @444
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry26 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry26_flg            ),
  .utlb_entry_hit          (entry26_hit            ),
  .utlb_entry_pgs          (entry26_pgs            ),
  .utlb_entry_ppn          (entry26_ppn            ),
  .utlb_entry_swp          (entry26_swp            ),
  .utlb_entry_swp_on       (entry26_swp_on         ),
  .utlb_entry_upd          (entry26_upd            ),
  .utlb_entry_vld          (entry26_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry27/); @446
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry27"); @447
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry27 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry27_flg            ),
  .utlb_entry_hit          (entry27_hit            ),
  .utlb_entry_pgs          (entry27_pgs            ),
  .utlb_entry_ppn          (entry27_ppn            ),
  .utlb_entry_swp          (entry27_swp            ),
  .utlb_entry_swp_on       (entry27_swp_on         ),
  .utlb_entry_upd          (entry27_upd            ),
  .utlb_entry_vld          (entry27_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry28/); @449
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry28"); @450
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry28 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry28_flg            ),
  .utlb_entry_hit          (entry28_hit            ),
  .utlb_entry_pgs          (entry28_pgs            ),
  .utlb_entry_ppn          (entry28_ppn            ),
  .utlb_entry_swp          (entry28_swp            ),
  .utlb_entry_swp_on       (entry28_swp_on         ),
  .utlb_entry_upd          (entry28_upd            ),
  .utlb_entry_vld          (entry28_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry29/); @452
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry29"); @453
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry29 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry29_flg            ),
  .utlb_entry_hit          (entry29_hit            ),
  .utlb_entry_pgs          (entry29_pgs            ),
  .utlb_entry_ppn          (entry29_ppn            ),
  .utlb_entry_swp          (entry29_swp            ),
  .utlb_entry_swp_on       (entry29_swp_on         ),
  .utlb_entry_upd          (entry29_upd            ),
  .utlb_entry_vld          (entry29_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry30/); @455
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry30"); @456
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry30 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry30_flg            ),
  .utlb_entry_hit          (entry30_hit            ),
  .utlb_entry_pgs          (entry30_pgs            ),
  .utlb_entry_ppn          (entry30_ppn            ),
  .utlb_entry_swp          (entry30_swp            ),
  .utlb_entry_swp_on       (entry30_swp_on         ),
  .utlb_entry_upd          (entry30_upd            ),
  .utlb_entry_vld          (entry30_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry31/); @458
// &Instance("ct_mmu_iutlb_entry","x_ct_mmu_iutlb_entry31"); @459
ct_mmu_iutlb_entry  x_ct_mmu_iutlb_entry31 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry31_flg            ),
  .utlb_entry_hit          (entry31_hit            ),
  .utlb_entry_pgs          (entry31_pgs            ),
  .utlb_entry_ppn          (entry31_ppn            ),
  .utlb_entry_swp          (entry31_swp            ),
  .utlb_entry_swp_on       (entry31_swp_on         ),
  .utlb_entry_upd          (entry31_upd            ),
  .utlb_entry_vld          (entry31_vld            ),
  .utlb_req_vpn            (utlb_req_vpn           ),
  .utlb_swp_flg            (utlb_swp_flg           ),
  .utlb_swp_pgs            (utlb_swp_pgs           ),
  .utlb_swp_ppn            (utlb_swp_ppn           ),
  .utlb_swp_vpn            (utlb_swp_vpn           ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_pgs            (utlb_upd_pgs           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


//----------------------------------------------------------
//                  Update Info to Entry
//----------------------------------------------------------
// refill utlb entry when refill cmplt with no expt
assign {entry31_upd, entry30_upd, entry29_upd, entry28_upd,
        entry27_upd, entry26_upd, entry25_upd, entry24_upd,
        entry23_upd, entry22_upd, entry21_upd, entry20_upd,
        entry19_upd, entry18_upd, entry17_upd, entry16_upd,
        entry15_upd, entry14_upd, entry13_upd, entry12_upd,
        entry11_upd, entry10_upd, entry9_upd,  entry8_upd,
        entry7_upd,  entry6_upd,  entry5_upd,  entry4_upd,
        entry3_upd,  entry2_upd,  entry1_upd,  entry0_upd}
                           = plru_iutlb_ref_num[31:0] & {32{iutlb_refill_vld}};

// entry updt info
// 1. from jtlb if hit
// 2. from memory through dcache if hit in jtlb
assign utlb_upd_vpn[VPN_WIDTH-1:0] = jtlb_utlb_ref_vpn[VPN_WIDTH-1:0];
assign utlb_upd_pgs[PGS_WIDTH-1:0] = jtlb_utlb_ref_pgs[PGS_WIDTH-1:0];
assign utlb_upd_ppn[PPN_WIDTH-1:0] = jtlb_utlb_ref_ppn[PPN_WIDTH-1:0];
assign utlb_upd_flg[FLG_WIDTH-1:0] = jtlb_utlb_ref_flg[FLG_WIDTH-1:0];

//----------------------------------------------------------
//                  I-uTLB SCD Switch to Entry
//----------------------------------------------------------
// from utlb scd entries to first entries
assign {entry24_swp_on, entry16_swp_on, entry8_swp_on, entry0_swp_on}
                           = {4{iutlb_swp_en}};

assign {entry24_swp,  entry16_swp,  entry8_swp,  entry0_swp}
                           = {4{iutlb_swp_en}} & iutlb_fst_wen[3:0];

//assign utlb_fst_swp_vpn[VPN_WIDTH-1:0] = 
//                {VPN_WIDTH{iutlb_entry_hit[1]}}  & entry1_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[2]}}  & entry2_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[3]}}  & entry3_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[4]}}  & entry4_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[5]}}  & entry5_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[6]}}  & entry6_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[7]}}  & entry7_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[9]}}  & entry9_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[10]}} & entry10_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[11]}} & entry11_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[12]}} & entry12_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[13]}} & entry13_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[14]}} & entry14_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[15]}} & entry15_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[17]}} & entry17_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[18]}} & entry18_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[19]}} & entry19_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[20]}} & entry20_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[21]}} & entry21_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[22]}} & entry22_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[23]}} & entry23_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[25]}} & entry25_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[26]}} & entry26_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[27]}} & entry27_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[28]}} & entry28_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[29]}} & entry29_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[30]}} & entry30_vpn[VPN_WIDTH-1:0]
//              | {VPN_WIDTH{iutlb_entry_hit[31]}} & entry31_vpn[VPN_WIDTH-1:0];

// To do: Page Mask?
assign utlb_fst_swp_vpn[VPN_WIDTH-1:0] = ifu_mmu_va[VPN_WIDTH+10:11];
assign utlb_fst_swp_pgs[PGS_WIDTH-1:0] = iutlb_hit_pgs_scd[PGS_WIDTH-1:0];
assign utlb_fst_swp_ppn[PPN_WIDTH-1:0] = iutlb_hit_pa_scd[PPN_WIDTH-1:0];
assign utlb_fst_swp_flg[FLG_WIDTH-1:0] = iutlb_hit_flg_scd[FLG_WIDTH-1:0];

// from utlb fst entries to scd entries
assign {entry31_swp, entry30_swp, entry29_swp, entry28_swp,
        entry27_swp, entry26_swp, entry25_swp, entry23_swp,
        entry22_swp, entry21_swp, entry20_swp, entry19_swp,
        entry18_swp, entry17_swp, entry15_swp, entry14_swp,
        entry13_swp, entry12_swp, entry11_swp, entry10_swp,
        entry9_swp,  entry7_swp,  entry6_swp,  entry5_swp,
        entry4_swp,  entry3_swp,  entry2_swp,  entry1_swp}
         = {28{iutlb_swp_en}} & {iutlb_entry_hit[31:25], iutlb_entry_hit[23:17],
                                 iutlb_entry_hit[15:9],  iutlb_entry_hit[7:1]};

assign utlb_swp_vpn[VPN_WIDTH-1:0] = 
                    {VPN_WIDTH{iutlb_fst_wen[0]}} & entry0_vpn[VPN_WIDTH-1:0]
                  | {VPN_WIDTH{iutlb_fst_wen[1]}} & entry8_vpn[VPN_WIDTH-1:0]
                  | {VPN_WIDTH{iutlb_fst_wen[2]}} & entry16_vpn[VPN_WIDTH-1:0]
                  | {VPN_WIDTH{iutlb_fst_wen[3]}} & entry24_vpn[VPN_WIDTH-1:0];

assign utlb_swp_pgs[PGS_WIDTH-1:0] = 
                    {PGS_WIDTH{iutlb_fst_wen[0]}} & entry0_pgs[PGS_WIDTH-1:0]
                  | {PGS_WIDTH{iutlb_fst_wen[1]}} & entry8_pgs[PGS_WIDTH-1:0]
                  | {PGS_WIDTH{iutlb_fst_wen[2]}} & entry16_pgs[PGS_WIDTH-1:0]
                  | {PGS_WIDTH{iutlb_fst_wen[3]}} & entry24_pgs[PGS_WIDTH-1:0];

assign utlb_swp_ppn[PPN_WIDTH-1:0] = 
                    {PPN_WIDTH{iutlb_fst_wen[0]}} & entry0_ppn[PPN_WIDTH-1:0]
                  | {PPN_WIDTH{iutlb_fst_wen[1]}} & entry8_ppn[PPN_WIDTH-1:0]
                  | {PPN_WIDTH{iutlb_fst_wen[2]}} & entry16_ppn[PPN_WIDTH-1:0]
                  | {PPN_WIDTH{iutlb_fst_wen[3]}} & entry24_ppn[PPN_WIDTH-1:0];

assign utlb_swp_flg[FLG_WIDTH-1:0] = 
                    {FLG_WIDTH{iutlb_fst_wen[0]}} & entry0_flg[FLG_WIDTH-1:0]
                  | {FLG_WIDTH{iutlb_fst_wen[1]}} & entry8_flg[FLG_WIDTH-1:0]
                  | {FLG_WIDTH{iutlb_fst_wen[2]}} & entry16_flg[FLG_WIDTH-1:0]
                  | {FLG_WIDTH{iutlb_fst_wen[3]}} & entry24_flg[FLG_WIDTH-1:0];

assign utlb_swp_on = iutlb_fst_wen[0] & entry0_vld
                   | iutlb_fst_wen[1] & entry8_vld
                   | iutlb_fst_wen[2] & entry16_vld
                   | iutlb_fst_wen[3] & entry24_vld;
assign {entry31_swp_on, entry30_swp_on, entry29_swp_on, entry28_swp_on,
        entry27_swp_on, entry26_swp_on, entry25_swp_on, entry23_swp_on,
        entry22_swp_on, entry21_swp_on, entry20_swp_on, entry19_swp_on,
        entry18_swp_on, entry17_swp_on, entry15_swp_on, entry14_swp_on,
        entry13_swp_on, entry12_swp_on, entry11_swp_on, entry10_swp_on,
        entry9_swp_on,  entry7_swp_on,  entry6_swp_on,  entry5_swp_on,
        entry4_swp_on,  entry3_swp_on,  entry2_swp_on,  entry1_swp_on} = 
        {28{utlb_swp_on}};

//==========================================================
//                  VA Matching
//==========================================================

//----------------------------------------------------------
//                  uTLB Entry Matching
//----------------------------------------------------------

assign entry_hit[31:0] = {entry31_hit,entry30_hit,entry29_hit,entry28_hit,
                          entry27_hit,entry26_hit,entry25_hit,entry24_hit,
                          entry23_hit,entry22_hit,entry21_hit,entry20_hit,
                          entry19_hit,entry18_hit,entry17_hit,entry16_hit,
                          entry15_hit,entry14_hit,entry13_hit,entry12_hit,
                          entry11_hit,entry10_hit,entry9_hit, entry8_hit,
                          entry7_hit, entry6_hit, entry5_hit, entry4_hit,
                          entry3_hit, entry2_hit, entry1_hit, entry0_hit};

assign entry_vld[31:0] = {entry31_vld,entry30_vld,entry29_vld,entry28_vld,
                          entry27_vld,entry26_vld,entry25_vld,entry24_vld,
                          entry23_vld,entry22_vld,entry21_vld,entry20_vld,
                          entry19_vld,entry18_vld,entry17_vld,entry16_vld,
                          entry15_vld,entry14_vld,entry13_vld,entry12_vld,
                          entry11_vld,entry10_vld,entry9_vld, entry8_vld,
                          entry7_vld, entry6_vld, entry5_vld, entry4_vld,
                          entry3_vld, entry2_vld, entry1_vld, entry0_vld};

assign iutlb_entry_hit[31:0] = entry_hit[31:0] & entry_vld[31:0];

assign iutlb_addr_hit_vld = |iutlb_entry_hit[31:0];

assign iutlb_addr_hit     = iutlb_entry_hit[0]  || iutlb_entry_hit[8]
                         || iutlb_entry_hit[16] || iutlb_entry_hit[24]; 

assign iutlb_swp_en       = ifu_mmu_va_vld && iutlb_addr_hit_vld && !iutlb_addr_hit
                         && !iutlb_off_hit;

//==========================================================
//                  VA Matching
//==========================================================
//----------------------------------------------------------
//                  Selecting Info from uTLB
//----------------------------------------------------------
assign iutlb_hit_pa_fst[PPN_WIDTH-1:0] = 
                  {PPN_WIDTH{iutlb_entry_hit[0]}}  & entry0_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[8]}}  & entry8_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[16]}} & entry16_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[24]}} & entry24_ppn[PPN_WIDTH-1:0];

assign iutlb_hit_pgs_fst[PGS_WIDTH-1:0] = 
                  {PGS_WIDTH{iutlb_entry_hit[0]}}  & entry0_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[8]}}  & entry8_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[16]}} & entry16_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[24]}} & entry24_pgs[PGS_WIDTH-1:0];

assign iutlb_hit_flg_fst[FLG_WIDTH-1:0] = 
                  {FLG_WIDTH{iutlb_entry_hit[0]}}  & entry0_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[8]}}  & entry8_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[16]}} & entry16_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[24]}} & entry24_flg[FLG_WIDTH-1:0];

assign iutlb_hit_pa_scd[PPN_WIDTH-1:0] = 
                  {PPN_WIDTH{iutlb_entry_hit[1]}}  & entry1_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[2]}}  & entry2_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[3]}}  & entry3_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[4]}}  & entry4_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[5]}}  & entry5_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[6]}}  & entry6_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[7]}}  & entry7_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[9]}}  & entry9_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[10]}} & entry10_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[11]}} & entry11_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[12]}} & entry12_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[13]}} & entry13_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[14]}} & entry14_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[15]}} & entry15_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[17]}} & entry17_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[18]}} & entry18_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[19]}} & entry19_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[20]}} & entry20_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[21]}} & entry21_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[22]}} & entry22_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[23]}} & entry23_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[25]}} & entry25_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[26]}} & entry26_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[27]}} & entry27_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[28]}} & entry28_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[29]}} & entry29_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[30]}} & entry30_ppn[PPN_WIDTH-1:0]
                | {PPN_WIDTH{iutlb_entry_hit[31]}} & entry31_ppn[PPN_WIDTH-1:0];

assign iutlb_hit_pgs_scd[PGS_WIDTH-1:0] =  
                  {PGS_WIDTH{iutlb_entry_hit[1]}}  & entry1_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[2]}}  & entry2_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[3]}}  & entry3_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[4]}}  & entry4_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[5]}}  & entry5_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[6]}}  & entry6_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[7]}}  & entry7_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[9]}}  & entry9_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[10]}} & entry10_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[11]}} & entry11_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[12]}} & entry12_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[13]}} & entry13_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[14]}} & entry14_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[15]}} & entry15_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[17]}} & entry17_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[18]}} & entry18_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[19]}} & entry19_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[20]}} & entry20_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[21]}} & entry21_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[22]}} & entry22_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[23]}} & entry23_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[25]}} & entry25_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[26]}} & entry26_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[27]}} & entry27_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[28]}} & entry28_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[29]}} & entry29_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[30]}} & entry30_pgs[PGS_WIDTH-1:0]
                | {PGS_WIDTH{iutlb_entry_hit[31]}} & entry31_pgs[PGS_WIDTH-1:0];

assign iutlb_hit_flg_scd[FLG_WIDTH-1:0] =  
                  {FLG_WIDTH{iutlb_entry_hit[1]}}  & entry1_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[2]}}  & entry2_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[3]}}  & entry3_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[4]}}  & entry4_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[5]}}  & entry5_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[6]}}  & entry6_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[7]}}  & entry7_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[9]}}  & entry9_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[10]}} & entry10_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[11]}} & entry11_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[12]}} & entry12_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[13]}} & entry13_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[14]}} & entry14_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[15]}} & entry15_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[17]}} & entry17_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[18]}} & entry18_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[19]}} & entry19_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[20]}} & entry20_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[21]}} & entry21_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[22]}} & entry22_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[23]}} & entry23_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[25]}} & entry25_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[26]}} & entry26_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[27]}} & entry27_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[28]}} & entry28_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[29]}} & entry29_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[30]}} & entry30_flg[FLG_WIDTH-1:0]
                | {FLG_WIDTH{iutlb_entry_hit[31]}} & entry31_flg[FLG_WIDTH-1:0];

//----------------------------------------------------------
//                  Flop utlb second result for timing
//----------------------------------------------------------
//always @(posedge iutlb_clk or negedge cpurst_b)
//begin
//  if (!cpurst_b)
//    iutlb_hit_pa_scd_flop[PPN_WIDTH-1:0] <= {PPN_WIDTH{1'b0}};
//  else if(iutlb_entry_hit_vld_scd)
//    iutlb_hit_pa_scd_flop[PPN_WIDTH-1:0] <= iutlb_hit_pa_scd[PPN_WIDTH-1:0];
//end
//
//always @(posedge iutlb_clk or negedge cpurst_b)
//begin
//  if (!cpurst_b)
//    iutlb_hit_pgs_scd_flop[PGS_WIDTH-1:0] <= {PGS_WIDTH{1'b0}};
//  else if(iutlb_entry_hit_vld_scd)
//    iutlb_hit_pgs_scd_flop[PGS_WIDTH-1:0] <= iutlb_hit_pgs_scd[PGS_WIDTH-1:0];
//end
//
//always @(posedge iutlb_clk or negedge cpurst_b)
//begin
//  if (!cpurst_b)
//    iutlb_hit_flg_scd_flop[FLG_WIDTH-1:0] <= {FLG_WIDTH{1'b0}};
//  else if(iutlb_entry_hit_vld_scd)
//    iutlb_hit_flg_scd_flop[FLG_WIDTH-1:0] <= iutlb_hit_flg_scd[FLG_WIDTH-1:0];
//end

always @(posedge iutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    iutlb_fst_wen[3:0] <= 4'b0001;
  else if(iutlb_swp_en)
    iutlb_fst_wen[3:0] <= {iutlb_fst_wen[2:0], iutlb_fst_wen[3]};
end

//----------------------------------------------------------
//                  MUX the pa except utlb first entries
//----------------------------------------------------------
//assign iutlb_bypass_pa[PPN_WIDTH-1:0]  = jtlb_utlb_ref_ppn[PPN_WIDTH-1:0];
//assign iutlb_bypass_pgs[PGS_WIDTH-1:0] = jtlb_utlb_ref_pgs[PGS_WIDTH-1:0];
//assign iutlb_bypass_flg[FLG_WIDTH-1:0] = jtlb_utlb_ref_flg[FLG_WIDTH-1:0];

// address attribute is checked by PMP when M-Mode or MMU not enabled
// pa and flag when mmu is off
assign iutlb_off_pa[PPN_WIDTH-1:0]  = ifu_mmu_va[VPN_WIDTH+11:11];
// off page size is 4K
assign iutlb_off_pgs[PGS_WIDTH-1:0] = 3'b1;
// Sysmap PMA Flags, RSW-zero, Non-Dirty, Access, Non-User, X, W, R, Valid
assign iutlb_off_flg[FLG_WIDTH-1:0] = {sysmap_mmu_flg2[4:0], 5'b00010, 3'b111, 1'b1};

//assign iutlb_bypass_hit = iutlb_wfc;
//assign iutlb_hit_pa_drct[PPN_WIDTH-1:0] =  
//          {PPN_WIDTH{iutlb_bypass_hit}} & iutlb_bypass_pa[PPN_WIDTH-1:0]
//        | {PPN_WIDTH{iutlb_off_hit}}    & iutlb_off_pa[PPN_WIDTH-1:0]
//        | {PPN_WIDTH{iutlb_scd}}        & iutlb_hit_pa_scd_flop[PPN_WIDTH-1:0];
//
//assign iutlb_hit_pgs_drct[PGS_WIDTH-1:0] =  
//          {PGS_WIDTH{iutlb_bypass_hit}} & iutlb_bypass_pgs[PGS_WIDTH-1:0]
//        | {PGS_WIDTH{iutlb_off_hit}}    & iutlb_off_pgs[PGS_WIDTH-1:0]
//        | {PGS_WIDTH{iutlb_scd}}        & iutlb_hit_pgs_scd_flop[PGS_WIDTH-1:0];
//
//assign iutlb_hit_flg_drct[FLG_WIDTH-1:0] =  
//          {FLG_WIDTH{iutlb_bypass_hit}} & iutlb_bypass_flg[FLG_WIDTH-1:0]
//        | {FLG_WIDTH{iutlb_off_hit}}    & iutlb_off_flg[FLG_WIDTH-1:0]
//        | {FLG_WIDTH{iutlb_scd}}        & iutlb_hit_flg_scd_flop[FLG_WIDTH-1:0];

//----------------------------------------------------------
//                  JTLB Access Fault
//----------------------------------------------------------
// to cut off the timing from dutlb abort to access fault
assign iutlb_acc_flt  = jtlb_iutlb_acc_err && iutlb_refill_on;
assign jtlb_acc_fault = iutlb_acc_flt
                    || (iutlb_hit_vld || iutlb_disable_vld) && iutlb_flg_aft_bypass[13];

always @(posedge iutlb_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    jtlb_acc_fault_flop <= 1'b0;
  else if(jtlb_acc_fault)
    jtlb_acc_fault_flop <= 1'b1;
  else
    jtlb_acc_fault_flop <= 1'b0;
end

//----------------------------------------------------------
//                  PMP Check
//----------------------------------------------------------
// to cut off the timing from final-pa to pmp check
// pa buffer clock
assign iutlb_pa_vld = iutlb_hit_vld || iutlb_disable_vld;
//assign pabuf_clk_en = iutlb_pa_vld ^ pmp_flg_vld
//                    || iutlb_hit_vld && (iutlb_hit_pa_fst[PPN_WIDTH-1:0] !=
//                             iutlb_pa_buf[PPN_WIDTH-1:0])
//                    || iutlb_disable_vld && (iutlb_off_pa[PPN_WIDTH-1:0] !=
//                             iutlb_pa_buf[PPN_WIDTH-1:0]);
assign pabuf_clk_en = iutlb_pa_vld || pmp_flg_vld;
// &Instance("gated_clk_cell", "x_iutlb_pabuf_gateclk"); @823
gated_clk_cell  x_iutlb_pabuf_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pabuf_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (pabuf_clk_en      ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @824
//           .external_en(1'b0          ), @825
//           .global_en  (1'b1          ), @826
//           .module_en  (cp0_mmu_icg_en), @827
//           .local_en   (pabuf_clk_en  ), @828
//           .clk_out    (pabuf_clk     ) @829
//          ); @830

assign iutlb_pmp_chk_vld = iutlb_pa_vld && !iutlb_page_fault;

always @(posedge pabuf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmp_flg_vld <= 1'b0;
  else if(iutlb_pmp_chk_vld)
    pmp_flg_vld <= 1'b1;
  else
    pmp_flg_vld <= 1'b0;
end

always @(posedge pabuf_clk)
begin
  if(iutlb_pmp_chk_vld)
    iutlb_pa_buf[PPN_WIDTH-1:0] <= iutlb_pa_aft_bypass[PPN_WIDTH-1:0];
end

assign mmu_pmp_pa2[PPN_WIDTH-1:0] = iutlb_pa_buf[PPN_WIDTH-1:0];


//----------------------------------------------------------
//                  MUX the final pa 
//----------------------------------------------------------
//assign pa_drct_sel = iutlb_bypass_hit || iutlb_off_hit || iutlb_scd;

assign pa_offset[VPN_WIDTH-1:0] = ifu_mmu_va[VPN_WIDTH+10:11];

assign pa_fin[PPN_WIDTH-1:0] =  
          {PPN_WIDTH{iutlb_off_hit}}  & iutlb_off_pa[PPN_WIDTH-1:0]
        | {PPN_WIDTH{iutlb_addr_hit}} & iutlb_hit_pa_fst[PPN_WIDTH-1:0];

assign pgs_fin[PGS_WIDTH-1:0] =  
          {PGS_WIDTH{iutlb_off_hit}}  & iutlb_off_pgs[PGS_WIDTH-1:0]
        | {PGS_WIDTH{iutlb_addr_hit}} & iutlb_hit_pgs_fst[PGS_WIDTH-1:0];

assign flg_fin[FLG_WIDTH-1:0] =  
          {FLG_WIDTH{iutlb_off_hit}}  & iutlb_off_flg[FLG_WIDTH-1:0]
        | {FLG_WIDTH{iutlb_addr_hit}} & iutlb_hit_flg_fst[FLG_WIDTH-1:0];

//assign pa_fin[PPN_WIDTH-1:0]  = pa_drct_sel 
//                              ? iutlb_hit_pa_drct[PPN_WIDTH-1:0]
//                              : iutlb_hit_pa_fst[PPN_WIDTH-1:0];
//
//assign pgs_fin[PGS_WIDTH-1:0] = pa_drct_sel 
//                              ? iutlb_hit_pgs_drct[PGS_WIDTH-1:0]
//                              : iutlb_hit_pgs_fst[PGS_WIDTH-1:0];
//
//assign flg_fin[FLG_WIDTH-1:0] = pa_drct_sel 
//                              ? iutlb_hit_flg_drct[FLG_WIDTH-1:0]
//                              : iutlb_hit_flg_fst[FLG_WIDTH-1:0];

assign iutlb_pa_aft_bypass[PPN_WIDTH-1:0] =  
     {PPN_WIDTH{pgs_fin[2]}} & {pa_fin[PPN_WIDTH-1:VPN_PERLEL*2], pa_offset[VPN_PERLEL*2-1:0]}
   | {PPN_WIDTH{pgs_fin[1]}} & {pa_fin[PPN_WIDTH-1:VPN_PERLEL*1], pa_offset[VPN_PERLEL*1-1:0]}
   | {PPN_WIDTH{pgs_fin[0]}} &  pa_fin[PPN_WIDTH-1:0];

assign iutlb_flg_aft_bypass[FLG_WIDTH-1:0] = flg_fin[FLG_WIDTH-1:0];

// for off pma flags
assign mmu_sysmap_pa2[PPN_WIDTH-1:0] = iutlb_off_pa[PPN_WIDTH-1:0];

// for dbg
assign iutlb_top_ref_cur_st[1:0] = ref_cur_st[1:0];
assign iutlb_ptw_wfc             = iutlb_wfc;


// &ModuleEnd; @899
endmodule


