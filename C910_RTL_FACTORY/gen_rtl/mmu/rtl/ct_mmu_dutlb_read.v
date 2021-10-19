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

// &ModuleBeg; @23
module ct_mmu_dutlb_read(
  biu_mmu_smp_disable,
  cp0_mach_mode,
  cp0_mmu_icg_en,
  cp0_mmu_mxr,
  cp0_mmu_sum,
  cp0_supv_mode,
  cp0_user_mode,
  cpurst_b,
  dplru_clk,
  dutlb_acc_flt_x,
  dutlb_clk,
  dutlb_expt_for_taken,
  dutlb_inst_id_match_x,
  dutlb_inst_id_older_x,
  dutlb_miss_vld_short_x,
  dutlb_miss_vld_x,
  dutlb_off_hit,
  dutlb_ori_read_x,
  dutlb_plru_read_hit_vld_x,
  dutlb_plru_read_hit_x,
  dutlb_read_type_x,
  dutlb_ref_acflt,
  dutlb_ref_pgflt,
  dutlb_refill_on_x,
  dutlb_va_chg_x,
  entry0_flg,
  entry0_hit_x,
  entry0_ppn,
  entry0_vld,
  entry10_flg,
  entry10_hit_x,
  entry10_ppn,
  entry10_vld,
  entry11_flg,
  entry11_hit_x,
  entry11_ppn,
  entry11_vld,
  entry12_flg,
  entry12_hit_x,
  entry12_ppn,
  entry12_vld,
  entry13_flg,
  entry13_hit_x,
  entry13_ppn,
  entry13_vld,
  entry14_flg,
  entry14_hit_x,
  entry14_ppn,
  entry14_vld,
  entry15_flg,
  entry15_hit_x,
  entry15_ppn,
  entry15_vld,
  entry16_flg,
  entry16_hit_x,
  entry16_ppn,
  entry16_vld,
  entry1_flg,
  entry1_hit_x,
  entry1_ppn,
  entry1_vld,
  entry2_flg,
  entry2_hit_x,
  entry2_ppn,
  entry2_vld,
  entry3_flg,
  entry3_hit_x,
  entry3_ppn,
  entry3_vld,
  entry4_flg,
  entry4_hit_x,
  entry4_ppn,
  entry4_vld,
  entry5_flg,
  entry5_hit_x,
  entry5_ppn,
  entry5_vld,
  entry6_flg,
  entry6_hit_x,
  entry6_ppn,
  entry6_vld,
  entry7_flg,
  entry7_hit_x,
  entry7_ppn,
  entry7_vld,
  entry8_flg,
  entry8_hit_x,
  entry8_ppn,
  entry8_vld,
  entry9_flg,
  entry9_hit_x,
  entry9_ppn,
  entry9_vld,
  forever_cpuclk,
  lsu_mmu_abort_x,
  lsu_mmu_id_x,
  lsu_mmu_stamo_pa_x,
  lsu_mmu_stamo_vld_x,
  lsu_mmu_va_vld_x,
  lsu_mmu_va_x,
  lsu_mmu_vabuf_x,
  mmu_lsu_access_fault_x,
  mmu_lsu_buf_x,
  mmu_lsu_ca_x,
  mmu_lsu_pa_vld_x,
  mmu_lsu_pa_x,
  mmu_lsu_page_fault_x,
  mmu_lsu_sec_x,
  mmu_lsu_sh_x,
  mmu_lsu_so_x,
  mmu_lsu_stall_x,
  mmu_pmp_pa_x,
  mmu_sysmap_pa_x,
  pad_yy_icg_scan_en,
  pmp_mmu_flg_x,
  refill_id_flop,
  sysmap_mmu_flg_x,
  utlb_req_vpn_x
);

// &Ports; @24
input           biu_mmu_smp_disable;      
input           cp0_mach_mode;            
input           cp0_mmu_icg_en;           
input           cp0_mmu_mxr;              
input           cp0_mmu_sum;              
input           cp0_supv_mode;            
input           cp0_user_mode;            
input           cpurst_b;                 
input           dplru_clk;                
input           dutlb_clk;                
input           dutlb_expt_for_taken;     
input           dutlb_off_hit;            
input           dutlb_ori_read_x;         
input           dutlb_read_type_x;        
input           dutlb_ref_acflt;          
input           dutlb_ref_pgflt;          
input           dutlb_refill_on_x;        
input   [13:0]  entry0_flg;               
input           entry0_hit_x;             
input   [27:0]  entry0_ppn;               
input           entry0_vld;               
input   [13:0]  entry10_flg;              
input           entry10_hit_x;            
input   [27:0]  entry10_ppn;              
input           entry10_vld;              
input   [13:0]  entry11_flg;              
input           entry11_hit_x;            
input   [27:0]  entry11_ppn;              
input           entry11_vld;              
input   [13:0]  entry12_flg;              
input           entry12_hit_x;            
input   [27:0]  entry12_ppn;              
input           entry12_vld;              
input   [13:0]  entry13_flg;              
input           entry13_hit_x;            
input   [27:0]  entry13_ppn;              
input           entry13_vld;              
input   [13:0]  entry14_flg;              
input           entry14_hit_x;            
input   [27:0]  entry14_ppn;              
input           entry14_vld;              
input   [13:0]  entry15_flg;              
input           entry15_hit_x;            
input   [27:0]  entry15_ppn;              
input           entry15_vld;              
input   [13:0]  entry16_flg;              
input           entry16_hit_x;            
input   [27:0]  entry16_ppn;              
input           entry16_vld;              
input   [13:0]  entry1_flg;               
input           entry1_hit_x;             
input   [27:0]  entry1_ppn;               
input           entry1_vld;               
input   [13:0]  entry2_flg;               
input           entry2_hit_x;             
input   [27:0]  entry2_ppn;               
input           entry2_vld;               
input   [13:0]  entry3_flg;               
input           entry3_hit_x;             
input   [27:0]  entry3_ppn;               
input           entry3_vld;               
input   [13:0]  entry4_flg;               
input           entry4_hit_x;             
input   [27:0]  entry4_ppn;               
input           entry4_vld;               
input   [13:0]  entry5_flg;               
input           entry5_hit_x;             
input   [27:0]  entry5_ppn;               
input           entry5_vld;               
input   [13:0]  entry6_flg;               
input           entry6_hit_x;             
input   [27:0]  entry6_ppn;               
input           entry6_vld;               
input   [13:0]  entry7_flg;               
input           entry7_hit_x;             
input   [27:0]  entry7_ppn;               
input           entry7_vld;               
input   [13:0]  entry8_flg;               
input           entry8_hit_x;             
input   [27:0]  entry8_ppn;               
input           entry8_vld;               
input   [13:0]  entry9_flg;               
input           entry9_hit_x;             
input   [27:0]  entry9_ppn;               
input           entry9_vld;               
input           forever_cpuclk;           
input           lsu_mmu_abort_x;          
input   [6 :0]  lsu_mmu_id_x;             
input   [27:0]  lsu_mmu_stamo_pa_x;       
input           lsu_mmu_stamo_vld_x;      
input           lsu_mmu_va_vld_x;         
input   [63:0]  lsu_mmu_va_x;             
input   [27:0]  lsu_mmu_vabuf_x;          
input           pad_yy_icg_scan_en;       
input   [3 :0]  pmp_mmu_flg_x;            
input   [6 :0]  refill_id_flop;           
input   [4 :0]  sysmap_mmu_flg_x;         
output          dutlb_acc_flt_x;          
output          dutlb_inst_id_match_x;    
output          dutlb_inst_id_older_x;    
output          dutlb_miss_vld_short_x;   
output          dutlb_miss_vld_x;         
output          dutlb_plru_read_hit_vld_x; 
output  [15:0]  dutlb_plru_read_hit_x;    
output          dutlb_va_chg_x;           
output          mmu_lsu_access_fault_x;   
output          mmu_lsu_buf_x;            
output          mmu_lsu_ca_x;             
output          mmu_lsu_pa_vld_x;         
output  [27:0]  mmu_lsu_pa_x;             
output          mmu_lsu_page_fault_x;     
output          mmu_lsu_sec_x;            
output          mmu_lsu_sh_x;             
output          mmu_lsu_so_x;             
output          mmu_lsu_stall_x;          
output  [27:0]  mmu_pmp_pa_x;             
output  [27:0]  mmu_sysmap_pa_x;          
output  [26:0]  utlb_req_vpn_x;           

// &Regs; @25
reg     [13:0]  dutlb_entry_flg;          
reg     [27:0]  dutlb_entry_pa;           
reg     [27:0]  dutlb_pa_buf;             
reg     [15:0]  dutlb_plru_read_hit_x;    
reg             jtlb_acc_fault_flop;      
reg             pmp_flg_vld;              
reg             pmp_read_type;            

// &Wires; @26
wire            biu_mmu_smp_disable;      
wire            cp0_mach_mode;            
wire            cp0_mmu_icg_en;           
wire            cp0_mmu_mxr;              
wire            cp0_mmu_sum;              
wire            cp0_supv_mode;            
wire            cp0_user_mode;            
wire            cpurst_b;                 
wire            dplru_clk;                
wire            dutlb_acc_flt_x;          
wire            dutlb_addr_hit;           
wire            dutlb_clk;                
wire            dutlb_disable_vld;        
wire    [16:0]  dutlb_entry_hit;          
wire            dutlb_entry_hit_vld;      
wire            dutlb_expt_for_taken;     
wire            dutlb_expt_match;         
wire    [13:0]  dutlb_fin_flg;            
wire    [27:0]  dutlb_fin_pa;             
wire    [2 :0]  dutlb_fin_pgs;            
wire            dutlb_hit_vld;            
wire            dutlb_inst_id_hit;        
wire            dutlb_inst_id_match_x;    
wire            dutlb_inst_id_older_x;    
wire            dutlb_miss_vld_short_x;   
wire            dutlb_miss_vld_x;         
wire    [13:0]  dutlb_off_flg;            
wire            dutlb_off_hit;            
wire    [27:0]  dutlb_off_pa;             
wire    [2 :0]  dutlb_off_pgs;            
wire            dutlb_ori_read_x;         
wire            dutlb_page_fault;         
wire            dutlb_plru_read_hit_vld_x; 
wire            dutlb_pmp_chk_vld;        
wire    [13:0]  dutlb_pre_flg;            
wire    [27:0]  dutlb_pre_pa;             
wire    [2 :0]  dutlb_pre_pgs;            
wire            dutlb_pre_sel;            
wire            dutlb_read_type_x;        
wire            dutlb_ref_acflt;          
wire            dutlb_ref_pgflt;          
wire            dutlb_refill_on_x;        
wire            dutlb_req_id_older;       
wire            dutlb_va_chg_x;           
wire            dutlb_va_illegal;         
wire    [13:0]  entry0_flg;               
wire            entry0_hit_x;             
wire    [27:0]  entry0_ppn;               
wire            entry0_vld;               
wire    [13:0]  entry10_flg;              
wire            entry10_hit_x;            
wire    [27:0]  entry10_ppn;              
wire            entry10_vld;              
wire    [13:0]  entry11_flg;              
wire            entry11_hit_x;            
wire    [27:0]  entry11_ppn;              
wire            entry11_vld;              
wire    [13:0]  entry12_flg;              
wire            entry12_hit_x;            
wire    [27:0]  entry12_ppn;              
wire            entry12_vld;              
wire    [13:0]  entry13_flg;              
wire            entry13_hit_x;            
wire    [27:0]  entry13_ppn;              
wire            entry13_vld;              
wire    [13:0]  entry14_flg;              
wire            entry14_hit_x;            
wire    [27:0]  entry14_ppn;              
wire            entry14_vld;              
wire    [13:0]  entry15_flg;              
wire            entry15_hit_x;            
wire    [27:0]  entry15_ppn;              
wire            entry15_vld;              
wire    [13:0]  entry16_flg;              
wire            entry16_hit_x;            
wire    [27:0]  entry16_ppn;              
wire            entry16_vld;              
wire    [13:0]  entry1_flg;               
wire            entry1_hit_x;             
wire    [27:0]  entry1_ppn;               
wire            entry1_vld;               
wire    [13:0]  entry2_flg;               
wire            entry2_hit_x;             
wire    [27:0]  entry2_ppn;               
wire            entry2_vld;               
wire    [13:0]  entry3_flg;               
wire            entry3_hit_x;             
wire    [27:0]  entry3_ppn;               
wire            entry3_vld;               
wire    [13:0]  entry4_flg;               
wire            entry4_hit_x;             
wire    [27:0]  entry4_ppn;               
wire            entry4_vld;               
wire    [13:0]  entry5_flg;               
wire            entry5_hit_x;             
wire    [27:0]  entry5_ppn;               
wire            entry5_vld;               
wire    [13:0]  entry6_flg;               
wire            entry6_hit_x;             
wire    [27:0]  entry6_ppn;               
wire            entry6_vld;               
wire    [13:0]  entry7_flg;               
wire            entry7_hit_x;             
wire    [27:0]  entry7_ppn;               
wire            entry7_vld;               
wire    [13:0]  entry8_flg;               
wire            entry8_hit_x;             
wire    [27:0]  entry8_ppn;               
wire            entry8_vld;               
wire    [13:0]  entry9_flg;               
wire            entry9_hit_x;             
wire    [27:0]  entry9_ppn;               
wire            entry9_vld;               
wire            forever_cpuclk;           
wire            jtlb_acc_fault;           
wire            lsu_mmu_abort_x;          
wire    [6 :0]  lsu_mmu_id_x;             
wire    [27:0]  lsu_mmu_stamo_pa_x;       
wire            lsu_mmu_stamo_vld_x;      
wire            lsu_mmu_va_vld_x;         
wire    [63:0]  lsu_mmu_va_x;             
wire            lsu_va_chg;               
wire            mmu_lsu_access_fault_x;   
wire            mmu_lsu_buf_x;            
wire            mmu_lsu_ca_x;             
wire            mmu_lsu_pa_vld_x;         
wire    [27:0]  mmu_lsu_pa_x;             
wire            mmu_lsu_page_fault_x;     
wire    [2 :0]  mmu_lsu_page_size_x;      
wire            mmu_lsu_sec_x;            
wire            mmu_lsu_sh_x;             
wire            mmu_lsu_so_x;             
wire            mmu_lsu_stall_x;          
wire    [27:0]  mmu_pmp_pa_x;             
wire    [27:0]  mmu_sysmap_pa_x;          
wire    [17:0]  pa_offset;                
wire            pabuf_clk;                
wire            pabuf_clk_en;             
wire            pad_yy_icg_scan_en;       
wire    [3 :0]  pmp_mmu_flg_x;            
wire    [6 :0]  refill_id_flop;           
wire    [4 :0]  sysmap_mmu_flg_x;         
wire    [26:0]  utlb_req_vpn_x;           
wire    [16:0]  vpn_hit;                  
wire    [16:0]  vpn_vld;                  


parameter VPN_WIDTH = 39-12;  // VPN
parameter PPN_WIDTH = 40-12;  // PPN
parameter FLG_WIDTH = 14;     // Flags
parameter PGS_WIDTH = 3;      // Page Size
parameter VPN_PERLEL = 9;

//==========================================================
//                  Tranlation Related Signal
//==========================================================
//----------------------------------------------------------
//                  Addr Translation Cmplt
//----------------------------------------------------------
// 1. when utlb hit, return pvald to LSU
// 2. later utlb hit can bypass the previous utlb miss, but
//    later utlb miss must be blocking
assign dutlb_hit_vld = lsu_mmu_va_vld_x && dutlb_addr_hit;

// D-uTLB trans cmplt without addr match in utlb:
// 1. when mmu is not enabled
// 2. when cpu is in machine mode 
assign dutlb_disable_vld = lsu_mmu_va_vld_x && dutlb_off_hit;

//----------------------------------------------------------
//                  Interface to LSU
//----------------------------------------------------------
// Paddr is valid when:
// 1. utlb hit
// 2. mmu is disabled
// 4. expt happened when utlb refill and inst id match
assign mmu_lsu_pa_vld_x = dutlb_hit_vld
                     || dutlb_disable_vld
                     || dutlb_va_illegal
                     || dutlb_expt_match;
assign mmu_lsu_stall_x  = 1'b0;
assign mmu_lsu_pa_x[PPN_WIDTH-1:0] = dutlb_fin_pa[PPN_WIDTH-1:0]; 

// &Force("nonport", "mmu_lsu_page_size_x"); @64
assign mmu_lsu_page_size_x[PGS_WIDTH-1:0] = dutlb_fin_pgs[PGS_WIDTH-1:0]; 

// flags judgement
// pmas to lsu: bufferable, security, cacheable
assign mmu_lsu_sh_x  = dutlb_fin_flg[10] && !biu_mmu_smp_disable;
assign mmu_lsu_buf_x = dutlb_fin_flg[11]
                 || !dutlb_fin_flg[13]; //when !so, always buf
assign mmu_lsu_so_x  = dutlb_fin_flg[13];
assign mmu_lsu_sec_x = dutlb_fin_flg[9];
assign mmu_lsu_ca_x  = dutlb_fin_flg[12] && !dutlb_fin_flg[13];

// R W X judgement, R and W are not used in I-uTLB
// page fault when not valid
// page fault when writeable but not readable
// page fault when load/store not match R/W
// page fault when supv access user region and vise versa
// page fault when A/D bit violation
// page fault when tfatal and tmiss from jTLB
// page fault when virtual address not legal
// &Force("bus", "lsu_mmu_va_x", 63, 0); @84
assign dutlb_va_illegal = (lsu_mmu_va_x[VPN_WIDTH+11] && !(&lsu_mmu_va_x[63:VPN_WIDTH+12])
                      ||  !lsu_mmu_va_x[VPN_WIDTH+11] &&  (|lsu_mmu_va_x[63:VPN_WIDTH+12]))
                          && !dutlb_off_hit && lsu_mmu_va_vld_x;
assign dutlb_page_fault = (!dutlb_fin_flg[0]
                       || !dutlb_fin_flg[1] && dutlb_fin_flg[2]
                       || !dutlb_fin_flg[1] && dutlb_read_type_x
                           && !(cp0_mmu_mxr && dutlb_fin_flg[3])
                       || !dutlb_fin_flg[2] && !dutlb_read_type_x
                       ||  dutlb_fin_flg[4] && cp0_supv_mode && !cp0_mmu_sum
                       || !dutlb_fin_flg[4] && cp0_user_mode
                       || !dutlb_fin_flg[5]
                       || !dutlb_fin_flg[6] && !dutlb_read_type_x) 
                           && dutlb_addr_hit
                       ||  dutlb_ref_pgflt && dutlb_refill_on_x
                           && dutlb_inst_id_hit
                       ||  dutlb_va_illegal;
assign mmu_lsu_page_fault_x = dutlb_page_fault && !dutlb_off_hit;

// &Force("bus", "pmp_mmu_flg_x", 3, 0); @103
assign mmu_lsu_access_fault_x = jtlb_acc_fault_flop
                            || !pmp_mmu_flg_x[0] && (pmp_read_type || dutlb_ori_read_x)
                                && !(cp0_mach_mode && !pmp_mmu_flg_x[3])  // L-bit for M-Mode
                                && pmp_flg_vld
                            || !pmp_mmu_flg_x[1] && !pmp_read_type
                                && !(cp0_mach_mode && !pmp_mmu_flg_x[3])  // L-bit for M-Mode
                                && pmp_flg_vld;
//assign mmu_lsu_access_fault_short_x = jtlb_acc_fault_flop || !pmp_mmu_flg_x[0] 
//                                                          || !pmp_mmu_flg_x[1];
assign dutlb_acc_flt_x = jtlb_acc_fault_flop;


always @(posedge dplru_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dutlb_plru_read_hit_x[15:0] <= 16'b0;
  else if(lsu_mmu_va_vld_x)
    dutlb_plru_read_hit_x[15:0] <= dutlb_entry_hit[15:0];
end

// &Force("output", "dutlb_plru_read_hit_x"); @124
assign dutlb_plru_read_hit_vld_x = |dutlb_plru_read_hit_x[15:0];

assign dutlb_miss_vld_x = lsu_mmu_va_vld_x
                     && !dutlb_entry_hit_vld
                     && !dutlb_va_illegal
                     && !lsu_mmu_abort_x
                     && !dutlb_off_hit;
assign dutlb_miss_vld_short_x = lsu_mmu_va_vld_x
                     && !dutlb_entry_hit_vld
                     && !dutlb_va_illegal
                     && !dutlb_off_hit;

// &Force("output", "dutlb_inst_id_match_x"); @137
assign dutlb_inst_id_hit     = (refill_id_flop[6:0] == lsu_mmu_id_x[6:0])
                                && lsu_mmu_va_vld_x;
assign dutlb_inst_id_match_x = dutlb_inst_id_hit && !lsu_mmu_abort_x;

// &Instance("ct_rtu_compare_iid","x_mmu_dutlb_read_compare_req_iid"); @142
ct_rtu_compare_iid  x_mmu_dutlb_read_compare_req_iid (
  .x_iid0              (lsu_mmu_id_x[6:0]  ),
  .x_iid0_older        (dutlb_req_id_older ),
  .x_iid1              (refill_id_flop[6:0])
);

// &Connect( .x_iid0         (lsu_mmu_id_x[6:0]), @143
//           .x_iid1         (refill_id_flop[6:0]), @144
//           .x_iid0_older   (dutlb_req_id_older)); @145
assign dutlb_inst_id_older_x = dutlb_req_id_older && lsu_mmu_va_vld_x
                            && !lsu_mmu_abort_x;

assign dutlb_expt_match = dutlb_expt_for_taken && dutlb_inst_id_hit;

//==============================================================================
//                  Data Path
//==============================================================================
//==========================================================
//                  VA Matching
//==========================================================
//----------------------------------------------------------
//                  uTLB Entry Matching
//----------------------------------------------------------
assign vpn_vld[16:0] = {entry16_vld,
                        entry15_vld, entry14_vld, entry13_vld, entry12_vld,
                        entry11_vld, entry10_vld, entry9_vld,  entry8_vld,
                        entry7_vld,  entry6_vld,  entry5_vld,  entry4_vld,
                        entry3_vld,  entry2_vld,  entry1_vld,  entry0_vld};

assign vpn_hit[16:0] ={entry16_hit_x, entry15_hit_x, entry14_hit_x, entry13_hit_x, entry12_hit_x,
                    entry11_hit_x, entry10_hit_x, entry9_hit_x,  entry8_hit_x,
                    entry7_hit_x,  entry6_hit_x,  entry5_hit_x,  entry4_hit_x,
                    entry3_hit_x,  entry2_hit_x,  entry1_hit_x,  entry0_hit_x};

assign dutlb_entry_hit[16:0] = vpn_vld[16:0] & vpn_hit[16:0];

assign dutlb_entry_hit_vld   = |dutlb_entry_hit[16:0];

assign dutlb_addr_hit     = |dutlb_entry_hit[16:0];
//assign dutlb_entry_hit_x[15:0] = dutlb_entry_hit[15:0];


//==========================================================
//                  VA Matching
//==========================================================
//----------------------------------------------------------
//                  Selecting Info from uTLB
//----------------------------------------------------------
// &CombBeg; @185
always @( entry4_ppn[27:0]
       or entry1_ppn[27:0]
       or entry8_ppn[27:0]
       or dutlb_entry_hit[15:0]
       or entry13_ppn[27:0]
       or entry7_ppn[27:0]
       or entry10_ppn[27:0]
       or entry11_ppn[27:0]
       or entry0_ppn[27:0]
       or entry2_ppn[27:0]
       or entry3_ppn[27:0]
       or entry6_ppn[27:0]
       or entry5_ppn[27:0]
       or entry14_ppn[27:0]
       or entry15_ppn[27:0]
       or entry9_ppn[27:0]
       or entry12_ppn[27:0])
begin
case(dutlb_entry_hit[15:0])
16'b0000000000000001: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry0_ppn[PPN_WIDTH-1:0];
16'b0000000000000010: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry1_ppn[PPN_WIDTH-1:0];
16'b0000000000000100: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry2_ppn[PPN_WIDTH-1:0];
16'b0000000000001000: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry3_ppn[PPN_WIDTH-1:0];
16'b0000000000010000: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry4_ppn[PPN_WIDTH-1:0];
16'b0000000000100000: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry5_ppn[PPN_WIDTH-1:0];
16'b0000000001000000: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry6_ppn[PPN_WIDTH-1:0];
16'b0000000010000000: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry7_ppn[PPN_WIDTH-1:0];
16'b0000000100000000: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry8_ppn[PPN_WIDTH-1:0];
16'b0000001000000000: dutlb_entry_pa[PPN_WIDTH-1:0] =  entry9_ppn[PPN_WIDTH-1:0];
16'b0000010000000000: dutlb_entry_pa[PPN_WIDTH-1:0] = entry10_ppn[PPN_WIDTH-1:0];
16'b0000100000000000: dutlb_entry_pa[PPN_WIDTH-1:0] = entry11_ppn[PPN_WIDTH-1:0];
16'b0001000000000000: dutlb_entry_pa[PPN_WIDTH-1:0] = entry12_ppn[PPN_WIDTH-1:0];
16'b0010000000000000: dutlb_entry_pa[PPN_WIDTH-1:0] = entry13_ppn[PPN_WIDTH-1:0];
16'b0100000000000000: dutlb_entry_pa[PPN_WIDTH-1:0] = entry14_ppn[PPN_WIDTH-1:0];
16'b1000000000000000: dutlb_entry_pa[PPN_WIDTH-1:0] = entry15_ppn[PPN_WIDTH-1:0];
default:              dutlb_entry_pa[PPN_WIDTH-1:0] = {PPN_WIDTH{1'b0}};
endcase
// &CombEnd; @205
end
// &CombBeg; @206
always @( entry5_flg[13:0]
       or entry2_flg[13:0]
       or dutlb_entry_hit[15:0]
       or entry9_flg[13:0]
       or entry14_flg[13:0]
       or entry12_flg[13:0]
       or entry13_flg[13:0]
       or entry6_flg[13:0]
       or entry1_flg[13:0]
       or entry10_flg[13:0]
       or entry11_flg[13:0]
       or entry7_flg[13:0]
       or entry15_flg[13:0]
       or entry0_flg[13:0]
       or entry4_flg[13:0]
       or entry3_flg[13:0]
       or entry8_flg[13:0])
begin
case(dutlb_entry_hit[15:0])
16'b0000000000000001: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry0_flg[FLG_WIDTH-1:0];
16'b0000000000000010: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry1_flg[FLG_WIDTH-1:0];
16'b0000000000000100: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry2_flg[FLG_WIDTH-1:0];
16'b0000000000001000: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry3_flg[FLG_WIDTH-1:0];
16'b0000000000010000: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry4_flg[FLG_WIDTH-1:0];
16'b0000000000100000: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry5_flg[FLG_WIDTH-1:0];
16'b0000000001000000: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry6_flg[FLG_WIDTH-1:0];
16'b0000000010000000: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry7_flg[FLG_WIDTH-1:0];
16'b0000000100000000: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry8_flg[FLG_WIDTH-1:0];
16'b0000001000000000: dutlb_entry_flg[FLG_WIDTH-1:0] =  entry9_flg[FLG_WIDTH-1:0];
16'b0000010000000000: dutlb_entry_flg[FLG_WIDTH-1:0] = entry10_flg[FLG_WIDTH-1:0];
16'b0000100000000000: dutlb_entry_flg[FLG_WIDTH-1:0] = entry11_flg[FLG_WIDTH-1:0];
16'b0001000000000000: dutlb_entry_flg[FLG_WIDTH-1:0] = entry12_flg[FLG_WIDTH-1:0];
16'b0010000000000000: dutlb_entry_flg[FLG_WIDTH-1:0] = entry13_flg[FLG_WIDTH-1:0];
16'b0100000000000000: dutlb_entry_flg[FLG_WIDTH-1:0] = entry14_flg[FLG_WIDTH-1:0];
16'b1000000000000000: dutlb_entry_flg[FLG_WIDTH-1:0] = entry15_flg[FLG_WIDTH-1:0];
default:              dutlb_entry_flg[FLG_WIDTH-1:0] = {FLG_WIDTH{1'bx}};
endcase
// &CombEnd; @226
end

// &Force("bus", "entry16_ppn", 27, 0); @228
assign pa_offset[VPN_PERLEL*2-1:0]  = lsu_mmu_va_x[VPN_PERLEL*2+11:12];
assign dutlb_pre_pa[PPN_WIDTH-1:0]  = lsu_mmu_stamo_vld_x ? lsu_mmu_stamo_pa_x[PPN_WIDTH-1:0]
                                    : dutlb_off_hit || !lsu_mmu_va_vld_x
                                    ? dutlb_off_pa[PPN_WIDTH-1:0]
       : {entry16_ppn[PPN_WIDTH-1:VPN_PERLEL*2], pa_offset[VPN_PERLEL*2-1:0]};
assign dutlb_pre_flg[FLG_WIDTH-1:0] = dutlb_off_hit || !lsu_mmu_va_vld_x
                                    ? dutlb_off_flg[FLG_WIDTH-1:0]
                                    : entry16_flg[FLG_WIDTH-1:0];
assign dutlb_pre_pgs[PGS_WIDTH-1:0] = dutlb_off_hit || !lsu_mmu_va_vld_x
                                    ? dutlb_off_pgs[PGS_WIDTH-1:0]
                                    : 3'b100;

// off sel
assign dutlb_pre_sel = dutlb_off_hit || !lsu_mmu_va_vld_x || dutlb_entry_hit[16]
                     || dutlb_va_illegal || dutlb_expt_match || lsu_mmu_stamo_vld_x;
// pa and flag when mmu is off
assign dutlb_off_pa[PPN_WIDTH-1:0] = lsu_mmu_va_x[VPN_WIDTH+12:12];
// Sysmap PMA Flags, RSW-zero, Dirty, Access, Non-User, X, W, R, Valid
assign dutlb_off_flg[FLG_WIDTH-1:0] = {sysmap_mmu_flg_x[4:0], 5'b00110, 3'b111, 1'b1};
// page size 4K when mmu is off
assign dutlb_off_pgs[PGS_WIDTH-1:0] = 3'b0;

// off sel
//assign dutlb_hit_sel = dutlb_addr_hit && lsu_mmu_va_vld_x;
assign dutlb_fin_pa[PPN_WIDTH-1:0] = 
                                 dutlb_pre_sel ? dutlb_pre_pa[PPN_WIDTH-1:0]
                                               : dutlb_entry_pa[PPN_WIDTH-1:0];
assign dutlb_fin_flg[FLG_WIDTH-1:0] = 
                                 dutlb_pre_sel ? dutlb_pre_flg[FLG_WIDTH-1:0]
                                               : dutlb_entry_flg[FLG_WIDTH-1:0];
assign dutlb_fin_pgs[PGS_WIDTH-1:0] = 
                                 dutlb_pre_sel ? dutlb_pre_pgs[PGS_WIDTH-1:0]
                                               : 3'b001;

//----------------------------------------------------------
//                  JTLB Access Fault
//----------------------------------------------------------
// to cut off the timing from dutlb abort to access fault
assign jtlb_acc_fault = dutlb_ref_acflt && dutlb_refill_on_x && dutlb_inst_id_match_x; 

always @(posedge dutlb_clk or negedge cpurst_b)
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
// va change signal
// &Force("input", "lsu_mmu_vabuf_x"); @285
// &Force("bus", "lsu_mmu_vabuf_x", 27,0); @286
assign lsu_va_chg = lsu_mmu_va_vld_x;
               // && (lsu_mmu_va_x[PPN_WIDTH+11:12] != lsu_mmu_vabuf_x[PPN_WIDTH-1:0]);
assign pabuf_clk_en = lsu_va_chg
                  || lsu_mmu_va_vld_x // && (pmp_read_type ^ dutlb_read_type_x)
                  || pmp_flg_vld ^ lsu_mmu_va_vld_x;
// &Instance("gated_clk_cell", "x_dutlb_pabuf_gateclk"); @292
gated_clk_cell  x_dutlb_pabuf_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pabuf_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (pabuf_clk_en      ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @293
//           .external_en(1'b0          ), @294
//           .global_en  (1'b1          ), @295
//           .module_en  (cp0_mmu_icg_en), @296
//           .local_en   (pabuf_clk_en  ), @297
//           .clk_out    (pabuf_clk     ) @298
//          ); @299

assign dutlb_pmp_chk_vld = (dutlb_hit_vld || dutlb_disable_vld)
                        && !dutlb_page_fault;

always @(posedge pabuf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmp_flg_vld <= 1'b0;
  else if(dutlb_pmp_chk_vld)
    pmp_flg_vld <= 1'b1;
  else
    pmp_flg_vld <= 1'b0;
end
//assign pmp_flg_vld = 1'b1;

always @(posedge pabuf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmp_read_type <= 1'b0;
  else if(dutlb_pmp_chk_vld)
    pmp_read_type <= dutlb_read_type_x;
end

always @(posedge pabuf_clk)
begin
  if(dutlb_pmp_chk_vld)
    dutlb_pa_buf[PPN_WIDTH-1:0] <= dutlb_fin_pa[PPN_WIDTH-1:0];
end

assign dutlb_va_chg_x = lsu_va_chg;

assign mmu_pmp_pa_x[PPN_WIDTH-1:0] = dutlb_pa_buf[PPN_WIDTH-1:0];

assign utlb_req_vpn_x[VPN_WIDTH-1:0] = lsu_mmu_va_x[VPN_WIDTH+11:12];

assign mmu_sysmap_pa_x[PPN_WIDTH-1:0] = lsu_mmu_va_x[VPN_WIDTH+12:12];

// &ModuleEnd; @337
endmodule


