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

// &ModuleBeg; @29
module ct_mmu_dutlb(
  arb_dutlb_grant,
  biu_mmu_smp_disable,
  cp0_mmu_icg_en,
  cp0_mmu_mpp,
  cp0_mmu_mprv,
  cp0_mmu_mxr,
  cp0_mmu_sum,
  cp0_yy_priv_mode,
  cpurst_b,
  dutlb_arb_cmplt,
  dutlb_arb_load,
  dutlb_arb_req,
  dutlb_arb_vpn,
  dutlb_ptw_wfc,
  dutlb_top_ref_cur_st,
  dutlb_top_ref_type,
  dutlb_top_scd_updt,
  dutlb_xx_mmu_off,
  forever_cpuclk,
  hpcp_mmu_cnt_en,
  jtlb_dutlb_acc_err,
  jtlb_dutlb_pgflt,
  jtlb_dutlb_ref_cmplt,
  jtlb_dutlb_ref_pavld,
  jtlb_utlb_ref_flg,
  jtlb_utlb_ref_pgs,
  jtlb_utlb_ref_ppn,
  jtlb_utlb_ref_vpn,
  lsu_mmu_abort0,
  lsu_mmu_abort1,
  lsu_mmu_id0,
  lsu_mmu_id1,
  lsu_mmu_st_inst0,
  lsu_mmu_st_inst1,
  lsu_mmu_stamo_pa,
  lsu_mmu_stamo_vld,
  lsu_mmu_tlb_va,
  lsu_mmu_va0,
  lsu_mmu_va0_vld,
  lsu_mmu_va1,
  lsu_mmu_va1_vld,
  lsu_mmu_vabuf0,
  lsu_mmu_vabuf1,
  mmu_hpcp_dutlb_miss,
  mmu_lsu_access_fault0,
  mmu_lsu_access_fault1,
  mmu_lsu_buf0,
  mmu_lsu_buf1,
  mmu_lsu_ca0,
  mmu_lsu_ca1,
  mmu_lsu_pa0,
  mmu_lsu_pa0_vld,
  mmu_lsu_pa1,
  mmu_lsu_pa1_vld,
  mmu_lsu_page_fault0,
  mmu_lsu_page_fault1,
  mmu_lsu_sec0,
  mmu_lsu_sec1,
  mmu_lsu_sh0,
  mmu_lsu_sh1,
  mmu_lsu_so0,
  mmu_lsu_so1,
  mmu_lsu_stall0,
  mmu_lsu_stall1,
  mmu_lsu_tlb_busy,
  mmu_lsu_tlb_wakeup,
  mmu_pmp_pa0,
  mmu_pmp_pa1,
  mmu_sysmap_pa0,
  mmu_sysmap_pa1,
  pad_yy_icg_scan_en,
  pmp_mmu_flg0,
  pmp_mmu_flg1,
  regs_mmu_en,
  regs_utlb_clr,
  rtu_yy_xx_flush,
  sysmap_mmu_flg0,
  sysmap_mmu_flg1,
  tlboper_utlb_clr,
  tlboper_utlb_inv_va_req,
  utlb_clk
);

// &Ports; @30
input           arb_dutlb_grant;         
input           biu_mmu_smp_disable;     
input           cp0_mmu_icg_en;          
input   [1 :0]  cp0_mmu_mpp;             
input           cp0_mmu_mprv;            
input           cp0_mmu_mxr;             
input           cp0_mmu_sum;             
input   [1 :0]  cp0_yy_priv_mode;        
input           cpurst_b;                
input           forever_cpuclk;          
input           hpcp_mmu_cnt_en;         
input           jtlb_dutlb_acc_err;      
input           jtlb_dutlb_pgflt;        
input           jtlb_dutlb_ref_cmplt;    
input           jtlb_dutlb_ref_pavld;    
input   [13:0]  jtlb_utlb_ref_flg;       
input   [2 :0]  jtlb_utlb_ref_pgs;       
input   [27:0]  jtlb_utlb_ref_ppn;       
input   [26:0]  jtlb_utlb_ref_vpn;       
input           lsu_mmu_abort0;          
input           lsu_mmu_abort1;          
input   [6 :0]  lsu_mmu_id0;             
input   [6 :0]  lsu_mmu_id1;             
input           lsu_mmu_st_inst0;        
input           lsu_mmu_st_inst1;        
input   [27:0]  lsu_mmu_stamo_pa;        
input           lsu_mmu_stamo_vld;       
input   [26:0]  lsu_mmu_tlb_va;          
input   [63:0]  lsu_mmu_va0;             
input           lsu_mmu_va0_vld;         
input   [63:0]  lsu_mmu_va1;             
input           lsu_mmu_va1_vld;         
input   [27:0]  lsu_mmu_vabuf0;          
input   [27:0]  lsu_mmu_vabuf1;          
input           pad_yy_icg_scan_en;      
input   [3 :0]  pmp_mmu_flg0;            
input   [3 :0]  pmp_mmu_flg1;            
input           regs_mmu_en;             
input           regs_utlb_clr;           
input           rtu_yy_xx_flush;         
input   [4 :0]  sysmap_mmu_flg0;         
input   [4 :0]  sysmap_mmu_flg1;         
input           tlboper_utlb_clr;        
input           tlboper_utlb_inv_va_req; 
input           utlb_clk;                
output          dutlb_arb_cmplt;         
output          dutlb_arb_load;          
output          dutlb_arb_req;           
output  [26:0]  dutlb_arb_vpn;           
output          dutlb_ptw_wfc;           
output  [2 :0]  dutlb_top_ref_cur_st;    
output          dutlb_top_ref_type;      
output          dutlb_top_scd_updt;      
output          dutlb_xx_mmu_off;        
output          mmu_hpcp_dutlb_miss;     
output          mmu_lsu_access_fault0;   
output          mmu_lsu_access_fault1;   
output          mmu_lsu_buf0;            
output          mmu_lsu_buf1;            
output          mmu_lsu_ca0;             
output          mmu_lsu_ca1;             
output  [27:0]  mmu_lsu_pa0;             
output          mmu_lsu_pa0_vld;         
output  [27:0]  mmu_lsu_pa1;             
output          mmu_lsu_pa1_vld;         
output          mmu_lsu_page_fault0;     
output          mmu_lsu_page_fault1;     
output          mmu_lsu_sec0;            
output          mmu_lsu_sec1;            
output          mmu_lsu_sh0;             
output          mmu_lsu_sh1;             
output          mmu_lsu_so0;             
output          mmu_lsu_so1;             
output          mmu_lsu_stall0;          
output          mmu_lsu_stall1;          
output          mmu_lsu_tlb_busy;        
output  [11:0]  mmu_lsu_tlb_wakeup;      
output  [27:0]  mmu_pmp_pa0;             
output  [27:0]  mmu_pmp_pa1;             
output  [27:0]  mmu_sysmap_pa0;          
output  [27:0]  mmu_sysmap_pa1;          

// &Regs; @31
reg             dutlb_miss;              
reg     [2 :0]  ref_cur_st;              
reg     [2 :0]  ref_nxt_st;              
reg     [6 :0]  refill_id_flop0;         
reg     [6 :0]  refill_id_flop1;         
reg             refill_read;             
reg             refill_type;             
reg     [26:0]  refill_va_flop0;         
reg     [26:0]  refill_va_flop1;         

// &Wires; @32
wire            arb_dutlb_grant;         
wire            biu_mmu_smp_disable;     
wire            cp0_mach_mode;           
wire            cp0_mmu_icg_en;          
wire    [1 :0]  cp0_mmu_mpp;             
wire            cp0_mmu_mprv;            
wire            cp0_mmu_mxr;             
wire            cp0_mmu_sum;             
wire    [1 :0]  cp0_priv_mode;           
wire            cp0_supv_mode;           
wire            cp0_user_mode;           
wire    [1 :0]  cp0_yy_priv_mode;        
wire            cpurst_b;                
wire            dplru_clk;               
wire            dplru_clk_en;            
wire            dutlb_acc_flt0;          
wire            dutlb_acc_flt1;          
wire            dutlb_arb_cmplt;         
wire            dutlb_arb_load;          
wire            dutlb_arb_req;           
wire    [26:0]  dutlb_arb_vpn;           
wire            dutlb_clk;               
wire            dutlb_clk_en;            
wire            dutlb_expt_for_taken;    
wire            dutlb_inst_id_match;     
wire            dutlb_inst_id_match0;    
wire            dutlb_inst_id_match1;    
wire            dutlb_inst_id_older;     
wire            dutlb_inst_id_older0;    
wire            dutlb_inst_id_older1;    
wire            dutlb_miss_cnt;          
wire            dutlb_miss_vld;          
wire            dutlb_miss_vld0;         
wire            dutlb_miss_vld1;         
wire            dutlb_miss_vld_short0;   
wire            dutlb_miss_vld_short1;   
wire            dutlb_off_hit;           
wire            dutlb_ori_read0;         
wire            dutlb_ori_read1;         
wire    [15:0]  dutlb_plru_read_hit0;    
wire    [15:0]  dutlb_plru_read_hit1;    
wire            dutlb_plru_read_hit_vld0; 
wire            dutlb_plru_read_hit_vld1; 
wire            dutlb_plru_refill_on;    
wire            dutlb_plru_refill_vld;   
wire            dutlb_ptw_wfc;           
wire            dutlb_read_type0;        
wire            dutlb_read_type1;        
wire            dutlb_ref_acflt;         
wire            dutlb_ref_pgflt;         
wire            dutlb_refill_idle;       
wire            dutlb_refill_on;         
wire            dutlb_refill_on0;        
wire            dutlb_refill_on1;        
wire            dutlb_refill_upd0;       
wire            dutlb_refill_upd1;       
wire            dutlb_refill_vld;        
wire            dutlb_req_id0_older;     
wire    [2 :0]  dutlb_top_ref_cur_st;    
wire            dutlb_top_ref_type;      
wire            dutlb_top_scd_updt;      
wire            dutlb_va_chg0;           
wire            dutlb_va_chg1;           
wire            dutlb_wfc;               
wire            dutlb_xx_mmu_off;        
wire    [13:0]  entry0_flg;              
wire            entry0_hit0;             
wire            entry0_hit1;             
wire    [27:0]  entry0_ppn;              
wire            entry0_upd;              
wire            entry0_vld;              
wire    [13:0]  entry10_flg;             
wire            entry10_hit0;            
wire            entry10_hit1;            
wire    [27:0]  entry10_ppn;             
wire            entry10_upd;             
wire            entry10_vld;             
wire    [13:0]  entry11_flg;             
wire            entry11_hit0;            
wire            entry11_hit1;            
wire    [27:0]  entry11_ppn;             
wire            entry11_upd;             
wire            entry11_vld;             
wire    [13:0]  entry12_flg;             
wire            entry12_hit0;            
wire            entry12_hit1;            
wire    [27:0]  entry12_ppn;             
wire            entry12_upd;             
wire            entry12_vld;             
wire    [13:0]  entry13_flg;             
wire            entry13_hit0;            
wire            entry13_hit1;            
wire    [27:0]  entry13_ppn;             
wire            entry13_upd;             
wire            entry13_vld;             
wire    [13:0]  entry14_flg;             
wire            entry14_hit0;            
wire            entry14_hit1;            
wire    [27:0]  entry14_ppn;             
wire            entry14_upd;             
wire            entry14_vld;             
wire    [13:0]  entry15_flg;             
wire            entry15_hit0;            
wire            entry15_hit1;            
wire    [27:0]  entry15_ppn;             
wire            entry15_upd;             
wire            entry15_vld;             
wire    [13:0]  entry16_flg;             
wire            entry16_hit0;            
wire            entry16_hit1;            
wire    [27:0]  entry16_ppn;             
wire            entry16_vld;             
wire    [13:0]  entry1_flg;              
wire            entry1_hit0;             
wire            entry1_hit1;             
wire    [27:0]  entry1_ppn;              
wire            entry1_upd;              
wire            entry1_vld;              
wire    [13:0]  entry2_flg;              
wire            entry2_hit0;             
wire            entry2_hit1;             
wire    [27:0]  entry2_ppn;              
wire            entry2_upd;              
wire            entry2_vld;              
wire    [13:0]  entry3_flg;              
wire            entry3_hit0;             
wire            entry3_hit1;             
wire    [27:0]  entry3_ppn;              
wire            entry3_upd;              
wire            entry3_vld;              
wire    [13:0]  entry4_flg;              
wire            entry4_hit0;             
wire            entry4_hit1;             
wire    [27:0]  entry4_ppn;              
wire            entry4_upd;              
wire            entry4_vld;              
wire    [13:0]  entry5_flg;              
wire            entry5_hit0;             
wire            entry5_hit1;             
wire    [27:0]  entry5_ppn;              
wire            entry5_upd;              
wire            entry5_vld;              
wire    [13:0]  entry6_flg;              
wire            entry6_hit0;             
wire            entry6_hit1;             
wire    [27:0]  entry6_ppn;              
wire            entry6_upd;              
wire            entry6_vld;              
wire    [13:0]  entry7_flg;              
wire            entry7_hit0;             
wire            entry7_hit1;             
wire    [27:0]  entry7_ppn;              
wire            entry7_upd;              
wire            entry7_vld;              
wire    [13:0]  entry8_flg;              
wire            entry8_hit0;             
wire            entry8_hit1;             
wire    [27:0]  entry8_ppn;              
wire            entry8_upd;              
wire            entry8_vld;              
wire    [13:0]  entry9_flg;              
wire            entry9_hit0;             
wire            entry9_hit1;             
wire    [27:0]  entry9_ppn;              
wire            entry9_upd;              
wire            entry9_vld;              
wire            forever_cpuclk;          
wire            hpcp_mmu_cnt_en;         
wire            jtlb_dutlb_acc_err;      
wire            jtlb_dutlb_pgflt;        
wire            jtlb_dutlb_ref_cmplt;    
wire            jtlb_dutlb_ref_pavld;    
wire    [13:0]  jtlb_utlb_ref_flg;       
wire    [2 :0]  jtlb_utlb_ref_pgs;       
wire    [27:0]  jtlb_utlb_ref_ppn;       
wire    [26:0]  jtlb_utlb_ref_vpn;       
wire            lsu_mmu_abort0;          
wire            lsu_mmu_abort1;          
wire    [6 :0]  lsu_mmu_id0;             
wire    [6 :0]  lsu_mmu_id1;             
wire            lsu_mmu_st_inst0;        
wire            lsu_mmu_st_inst1;        
wire    [27:0]  lsu_mmu_stamo_pa;        
wire    [27:0]  lsu_mmu_stamo_pa0;       
wire    [27:0]  lsu_mmu_stamo_pa1;       
wire            lsu_mmu_stamo_vld;       
wire            lsu_mmu_stamo_vld0;      
wire            lsu_mmu_stamo_vld1;      
wire    [26:0]  lsu_mmu_tlb_va;          
wire    [63:0]  lsu_mmu_va0;             
wire            lsu_mmu_va0_vld;         
wire    [63:0]  lsu_mmu_va1;             
wire            lsu_mmu_va1_vld;         
wire            lsu_mmu_va_vld0;         
wire            lsu_mmu_va_vld1;         
wire    [27:0]  lsu_mmu_vabuf0;          
wire    [27:0]  lsu_mmu_vabuf1;          
wire            mmu_hpcp_dutlb_miss;     
wire            mmu_lsu_access_fault0;   
wire            mmu_lsu_access_fault1;   
wire            mmu_lsu_buf0;            
wire            mmu_lsu_buf1;            
wire            mmu_lsu_ca0;             
wire            mmu_lsu_ca1;             
wire    [27:0]  mmu_lsu_pa0;             
wire            mmu_lsu_pa0_vld;         
wire    [27:0]  mmu_lsu_pa1;             
wire            mmu_lsu_pa1_vld;         
wire            mmu_lsu_pa_vld0;         
wire            mmu_lsu_pa_vld1;         
wire            mmu_lsu_page_fault0;     
wire            mmu_lsu_page_fault1;     
wire            mmu_lsu_sec0;            
wire            mmu_lsu_sec1;            
wire            mmu_lsu_sh0;             
wire            mmu_lsu_sh1;             
wire            mmu_lsu_so0;             
wire            mmu_lsu_so1;             
wire            mmu_lsu_stall0;          
wire            mmu_lsu_stall1;          
wire            mmu_lsu_tlb_busy;        
wire    [11:0]  mmu_lsu_tlb_wakeup;      
wire    [27:0]  mmu_pmp_pa0;             
wire    [27:0]  mmu_pmp_pa1;             
wire    [27:0]  mmu_sysmap_pa0;          
wire    [27:0]  mmu_sysmap_pa1;          
wire            pad_yy_icg_scan_en;      
wire    [15:0]  plru_dutlb_ref_num;      
wire    [3 :0]  pmp_mmu_flg0;            
wire    [3 :0]  pmp_mmu_flg1;            
wire    [6 :0]  refill_id_flop;          
wire            regs_mmu_en;             
wire            regs_utlb_clr;           
wire            rtu_yy_xx_flush;         
wire    [4 :0]  sysmap_mmu_flg0;         
wire    [4 :0]  sysmap_mmu_flg1;         
wire            tlboper_utlb_clr;        
wire            tlboper_utlb_inv_va_req; 
wire            utlb_clk;                
wire            utlb_huge_entry_upd;     
wire    [26:0]  utlb_req_vpn0;           
wire    [26:0]  utlb_req_vpn1;           
wire    [13:0]  utlb_upd_flg;            
wire    [27:0]  utlb_upd_ppn;            
wire    [26:0]  utlb_upd_vpn;            


//==========================================================
// parameters for value width
//==========================================================
parameter VPN_WIDTH = 39-12;  // VPN
parameter PPN_WIDTH = 40-12;  // PPN
parameter FLG_WIDTH = 14;     // Flags
parameter PGS_WIDTH = 3;      // Page Size
parameter LSIQ_ENTRY= 12;
parameter IID_WIDTH = 7;
parameter LVL_WIDTH = 9;


//==============================================================================
//                  Control Path
//==============================================================================
//==========================================================
//                  Gate Cell
//==========================================================
assign dutlb_clk_en = dutlb_miss_vld_short0
                   || dutlb_miss_vld_short1
                   || dutlb_acc_flt0
                   || dutlb_acc_flt1
                   || dutlb_refill_on
                   || dutlb_miss;
// &Instance("gated_clk_cell", "x_dutlb_gateclk"); @58
gated_clk_cell  x_dutlb_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dutlb_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dutlb_clk_en      ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @59
//           .external_en(1'b0          ), @60
//           .global_en  (1'b1          ), @61
//           .module_en  (cp0_mmu_icg_en), @62
//           .local_en   (dutlb_clk_en  ), @63
//           .clk_out    (dutlb_clk     ) @64
//          ); @65

// current privlidged mode
assign cp0_priv_mode[1:0] = cp0_mmu_mprv ? cp0_mmu_mpp[1:0]
                                         : cp0_yy_priv_mode[1:0];
assign cp0_user_mode = cp0_priv_mode[1:0] == 2'b00;
assign cp0_supv_mode = cp0_priv_mode[1:0] == 2'b01;
assign cp0_mach_mode = cp0_priv_mode[1:0] == 2'b11;

//----------------------------------------------------------
//                  Interface to LSU
//----------------------------------------------------------
assign mmu_lsu_tlb_busy = dutlb_refill_on;
assign mmu_lsu_tlb_wakeup[LSIQ_ENTRY-1:0] = 
            {LSIQ_ENTRY{dutlb_refill_idle}}    & {LSIQ_ENTRY{1'b1}}
          | {LSIQ_ENTRY{dutlb_expt_for_taken}} & {LSIQ_ENTRY{1'b1}};

//==========================================================
//                  uTLB Replacement Logic
//==========================================================
//----------------------------------------------------------
//                  uTLB Replacement Algorithm
//----------------------------------------------------------
// 1. when there is empty entry avaleble, use empty entry
// 2. when there is no empry entry, use PLRU
// &ConnRule(s/^utlb/dutlb/); @90
// &Instance("ct_mmu_dplru","x_ct_mmu_dplru"); @91
ct_mmu_dplru  x_ct_mmu_dplru (
  .cp0_mmu_icg_en           (cp0_mmu_icg_en          ),
  .cpurst_b                 (cpurst_b                ),
  .entry0_vld               (entry0_vld              ),
  .entry10_vld              (entry10_vld             ),
  .entry11_vld              (entry11_vld             ),
  .entry12_vld              (entry12_vld             ),
  .entry13_vld              (entry13_vld             ),
  .entry14_vld              (entry14_vld             ),
  .entry15_vld              (entry15_vld             ),
  .entry1_vld               (entry1_vld              ),
  .entry2_vld               (entry2_vld              ),
  .entry3_vld               (entry3_vld              ),
  .entry4_vld               (entry4_vld              ),
  .entry5_vld               (entry5_vld              ),
  .entry6_vld               (entry6_vld              ),
  .entry7_vld               (entry7_vld              ),
  .entry8_vld               (entry8_vld              ),
  .entry9_vld               (entry9_vld              ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .plru_dutlb_ref_num       (plru_dutlb_ref_num      ),
  .utlb_plru_read_hit0      (dutlb_plru_read_hit0    ),
  .utlb_plru_read_hit1      (dutlb_plru_read_hit1    ),
  .utlb_plru_read_hit_vld0  (dutlb_plru_read_hit_vld0),
  .utlb_plru_read_hit_vld1  (dutlb_plru_read_hit_vld1),
  .utlb_plru_refill_on      (dutlb_plru_refill_on    ),
  .utlb_plru_refill_vld     (dutlb_plru_refill_vld   )
);


assign dutlb_plru_refill_on  = dutlb_wfc;
assign dutlb_plru_refill_vld = dutlb_refill_vld;

//for plru read hit updt
//assign dplru_clk_en = lsu_mmu_va0_vld && (dutlb_plru_read_hit0[15:0] != dutlb_entry_hit0[15:0]) 
//                   || lsu_mmu_va1_vld && (dutlb_plru_read_hit1[15:0] != dutlb_entry_hit1[15:0]);
assign dplru_clk_en = dutlb_va_chg0 || dutlb_va_chg1;
//assign dplru_clk_en = dutlb_acc_vld;
// &Instance("gated_clk_cell", "x_dutlb_plru_gateclk"); @101
gated_clk_cell  x_dutlb_plru_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dplru_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dplru_clk_en      ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @102
//           .external_en(1'b0          ), @103
//           .global_en  (1'b1          ), @104
//           .module_en  (cp0_mmu_icg_en), @105
//           .local_en   (dplru_clk_en  ), @106
//           .clk_out    (dplru_clk     ) @107
//          ); @108

//==========================================================
//                  uTLB Refill SM
//==========================================================
//----------------------------------------------------------
//                  SM State
//----------------------------------------------------------
// 1. IDLE: default state; wait grant when utlb miss
// 2. WFC : wait utlb refill cmplt to refill utlb
// 3. ABT : wait utlb refill cmplt when abort happened
parameter IDLE  = 3'b000, 
          WFG   = 3'b001,
          WFC   = 3'b011,
          PGFLT = 3'b010,
          ACFLT = 3'b100,
          ABT   = 3'b101;

assign dutlb_miss_vld = dutlb_miss_vld0 || dutlb_miss_vld1;

always @(posedge dutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ref_cur_st[2:0] <= 3'b000;
  else
    ref_cur_st[2:0] <= ref_nxt_st[2:0];
end

// &CombBeg; @136
always @( ref_cur_st
       or dutlb_inst_id_older
       or jtlb_dutlb_acc_err
       or jtlb_dutlb_pgflt
       or arb_dutlb_grant
       or dutlb_miss_vld
       or jtlb_dutlb_ref_cmplt
       or rtu_yy_xx_flush
       or dutlb_inst_id_match)
begin
case (ref_cur_st)
IDLE:
begin
  if(rtu_yy_xx_flush)
    ref_nxt_st[2:0] = IDLE;
  else if(dutlb_miss_vld)
    ref_nxt_st[2:0] = WFG;
  else
    ref_nxt_st[2:0] = IDLE;
end
WFG:
begin
  if(rtu_yy_xx_flush && arb_dutlb_grant)
    ref_nxt_st[2:0] = ABT;
  else if(rtu_yy_xx_flush)
    ref_nxt_st[2:0] = IDLE;
  else if(arb_dutlb_grant)
    ref_nxt_st[2:0] = WFC;
  else
    ref_nxt_st[2:0] = WFG;
end
WFC:
begin
  if(rtu_yy_xx_flush && jtlb_dutlb_ref_cmplt)
    ref_nxt_st[2:0] = IDLE;
  else if(rtu_yy_xx_flush)
    ref_nxt_st[2:0] = ABT;
  else if(jtlb_dutlb_ref_cmplt && jtlb_dutlb_pgflt)
    ref_nxt_st[2:0] = PGFLT;
  else if(jtlb_dutlb_ref_cmplt && jtlb_dutlb_acc_err)
    ref_nxt_st[2:0] = ACFLT;
  else if(jtlb_dutlb_ref_cmplt)
    ref_nxt_st[2:0] = IDLE;
  else
    ref_nxt_st[2:0] = WFC;
end
PGFLT:
begin
  if(rtu_yy_xx_flush)
    ref_nxt_st[2:0] = IDLE;
  else if(dutlb_inst_id_match)
    ref_nxt_st[2:0] = IDLE;
  else if(dutlb_inst_id_older)
    if(dutlb_miss_vld)
      ref_nxt_st[2:0] = WFG;
    else 
      ref_nxt_st[2:0] = IDLE;
  else
    ref_nxt_st[2:0] = PGFLT;
end
ACFLT:
begin
  if(rtu_yy_xx_flush)
    ref_nxt_st[2:0] = IDLE;
  else if(dutlb_inst_id_match)
    ref_nxt_st[2:0] = IDLE;
  else if(dutlb_inst_id_older)
    if(dutlb_miss_vld)
      ref_nxt_st[2:0] = WFG;
    else 
      ref_nxt_st[2:0] = IDLE;
  else
    ref_nxt_st[2:0] = ACFLT;
end
ABT:
begin
  if(jtlb_dutlb_ref_cmplt)
    ref_nxt_st[2:0] = IDLE;
  else
    ref_nxt_st[2:0] = ABT;
end
default:
begin
   ref_nxt_st[2:0] = IDLE;
end
endcase
// &CombEnd; @213
end


//----------------------------------------------------------
//                  SM Control Signal
//----------------------------------------------------------
// Req jtlb when utlb miss
// 1. req only in IDLE, so utlb refill is blocking
// &Force("output", "dutlb_arb_vpn"); @221
assign dutlb_arb_req       = (ref_cur_st[2:0] == WFG);
assign dutlb_arb_vpn[VPN_WIDTH-1:0] = refill_type ? refill_va_flop0[VPN_WIDTH-1:0]
                                                  : refill_va_flop1[VPN_WIDTH-1:0];
assign dutlb_arb_load = refill_read;

always @(posedge dutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    refill_va_flop0[VPN_WIDTH-1:0] <= {VPN_WIDTH{1'b0}};
  else if(dutlb_miss_vld_short0 && dutlb_refill_upd0)
    refill_va_flop0[VPN_WIDTH-1:0] <= utlb_req_vpn0[VPN_WIDTH-1:0];
end

always @(posedge dutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    refill_va_flop1[VPN_WIDTH-1:0] <= {VPN_WIDTH{1'b0}};
  else if(dutlb_miss_vld_short1 && dutlb_refill_upd1)
    refill_va_flop1[VPN_WIDTH-1:0] <= utlb_req_vpn1[VPN_WIDTH-1:0];
end

// &Instance("ct_rtu_compare_iid","x_mmu_dutlb_compare_req_iid"); @243
ct_rtu_compare_iid  x_mmu_dutlb_compare_req_iid (
  .x_iid0              (lsu_mmu_id0[6:0]   ),
  .x_iid0_older        (dutlb_req_id0_older),
  .x_iid1              (lsu_mmu_id1[6:0]   )
);

// &Connect( .x_iid0         (lsu_mmu_id0[6:0]), @244
//           .x_iid1         (lsu_mmu_id1[6:0]), @245
//           .x_iid0_older   (dutlb_req_id0_older)); @246

always @(posedge dutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    refill_type <= 1'b0;
  else if(dutlb_miss_vld0 && dutlb_refill_upd0 && (dutlb_req_id0_older || !dutlb_miss_vld1))
    refill_type <= 1'b1;
  else if(dutlb_miss_vld1 && dutlb_refill_upd1)
    refill_type <= 1'b0;
end

always @(posedge dutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    refill_read <= 1'b0;
  else if(dutlb_miss_vld0 && dutlb_refill_upd0 && (dutlb_req_id0_older || !dutlb_miss_vld1))
    refill_read <= !lsu_mmu_st_inst0;
  else if(dutlb_miss_vld1 && dutlb_refill_upd1)
    refill_read <= !lsu_mmu_st_inst1;
end

assign dutlb_refill_on0 = (ref_cur_st[2:0] != IDLE) &&  refill_type;
assign dutlb_refill_on1 = (ref_cur_st[2:0] != IDLE) && !refill_type;
// uTLB refill cmplt
// 1. jtlb hit
// 2. ptw cmplt, either data vld or acc err
// 3. refill utlb only when ptw cmplt with data vld
assign dutlb_wfc = (ref_cur_st[2:0] == WFC);
//assign dutlb_refill_cmplt = dutlb_wfc && jtlb_dutlb_ref_cmplt;
assign dutlb_refill_vld   = dutlb_wfc && jtlb_dutlb_ref_pavld;

assign dutlb_ref_pgflt    = (ref_cur_st[2:0] == PGFLT);
assign dutlb_ref_acflt    = (ref_cur_st[2:0] == ACFLT);
 
assign dutlb_refill_idle  = (ref_cur_st[2:0] == IDLE);
assign dutlb_refill_on    = !dutlb_refill_idle;
assign dutlb_refill_upd0  = dutlb_refill_idle || (dutlb_ref_pgflt || dutlb_ref_acflt) && dutlb_inst_id_older0;
assign dutlb_refill_upd1  = dutlb_refill_idle || (dutlb_ref_pgflt || dutlb_ref_acflt) && dutlb_inst_id_older1;

//assign dutlb_arb_cmplt    = (ref_cur_st[2:0] != IDLE) && (ref_nxt_st[2:0] == IDLE);
assign dutlb_arb_cmplt    = (ref_cur_st[2:0] == WFG) && rtu_yy_xx_flush
                         || (ref_cur_st[2:0] == WFC) && jtlb_dutlb_ref_cmplt
                         || (ref_cur_st[2:0] == ABT) && jtlb_dutlb_ref_cmplt;

always @(posedge dutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    refill_id_flop0[IID_WIDTH-1:0] <= {IID_WIDTH{1'b0}};
  else if(dutlb_miss_vld_short0 && dutlb_refill_upd0)
    refill_id_flop0[IID_WIDTH-1:0] <= lsu_mmu_id0[IID_WIDTH-1:0];
end
always @(posedge dutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    refill_id_flop1[IID_WIDTH-1:0] <= {IID_WIDTH{1'b0}};
  else if(dutlb_miss_vld_short1 && dutlb_refill_upd1)
    refill_id_flop1[IID_WIDTH-1:0] <= lsu_mmu_id1[IID_WIDTH-1:0];
end 
assign refill_id_flop[IID_WIDTH-1:0] = refill_type ? refill_id_flop0[IID_WIDTH-1:0]
                                                   : refill_id_flop1[IID_WIDTH-1:0];

assign dutlb_inst_id_match  = dutlb_inst_id_match0 || dutlb_inst_id_match1;
assign dutlb_inst_id_older  = dutlb_inst_id_older0 || dutlb_inst_id_older1;

assign dutlb_expt_for_taken = (dutlb_ref_pgflt || dutlb_ref_acflt);

// for hpcp
assign dutlb_miss_cnt = dutlb_refill_vld && hpcp_mmu_cnt_en; 

always @(posedge dutlb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dutlb_miss <= 1'b0;
  else if(dutlb_miss_cnt)
    dutlb_miss <= 1'b1;
  else if(dutlb_miss)
    dutlb_miss <= 1'b0;
end

assign mmu_hpcp_dutlb_miss = dutlb_miss;

//==============================================================================
//                  Data Path
//==============================================================================
//==========================================================
//                  uTLB Entry
//==========================================================
// &ConnRule(s/utlb_entry/entry0/); @338
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry0"); @339
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry0 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry0_flg             ),
  .utlb_entry_hit0         (entry0_hit0            ),
  .utlb_entry_hit1         (entry0_hit1            ),
  .utlb_entry_ppn          (entry0_ppn             ),
  .utlb_entry_upd          (entry0_upd             ),
  .utlb_entry_vld          (entry0_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry1/); @341
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry1"); @342
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry1 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry1_flg             ),
  .utlb_entry_hit0         (entry1_hit0            ),
  .utlb_entry_hit1         (entry1_hit1            ),
  .utlb_entry_ppn          (entry1_ppn             ),
  .utlb_entry_upd          (entry1_upd             ),
  .utlb_entry_vld          (entry1_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry2/); @344
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry2"); @345
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry2 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry2_flg             ),
  .utlb_entry_hit0         (entry2_hit0            ),
  .utlb_entry_hit1         (entry2_hit1            ),
  .utlb_entry_ppn          (entry2_ppn             ),
  .utlb_entry_upd          (entry2_upd             ),
  .utlb_entry_vld          (entry2_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry3/); @347
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry3"); @348
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry3 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry3_flg             ),
  .utlb_entry_hit0         (entry3_hit0            ),
  .utlb_entry_hit1         (entry3_hit1            ),
  .utlb_entry_ppn          (entry3_ppn             ),
  .utlb_entry_upd          (entry3_upd             ),
  .utlb_entry_vld          (entry3_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry4/); @350
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry4"); @351
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry4 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry4_flg             ),
  .utlb_entry_hit0         (entry4_hit0            ),
  .utlb_entry_hit1         (entry4_hit1            ),
  .utlb_entry_ppn          (entry4_ppn             ),
  .utlb_entry_upd          (entry4_upd             ),
  .utlb_entry_vld          (entry4_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry5/); @353
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry5"); @354
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry5 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry5_flg             ),
  .utlb_entry_hit0         (entry5_hit0            ),
  .utlb_entry_hit1         (entry5_hit1            ),
  .utlb_entry_ppn          (entry5_ppn             ),
  .utlb_entry_upd          (entry5_upd             ),
  .utlb_entry_vld          (entry5_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry6/); @356
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry6"); @357
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry6 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry6_flg             ),
  .utlb_entry_hit0         (entry6_hit0            ),
  .utlb_entry_hit1         (entry6_hit1            ),
  .utlb_entry_ppn          (entry6_ppn             ),
  .utlb_entry_upd          (entry6_upd             ),
  .utlb_entry_vld          (entry6_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry7/); @359
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry7"); @360
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry7 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry7_flg             ),
  .utlb_entry_hit0         (entry7_hit0            ),
  .utlb_entry_hit1         (entry7_hit1            ),
  .utlb_entry_ppn          (entry7_ppn             ),
  .utlb_entry_upd          (entry7_upd             ),
  .utlb_entry_vld          (entry7_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry8/); @362
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry8"); @363
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry8 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry8_flg             ),
  .utlb_entry_hit0         (entry8_hit0            ),
  .utlb_entry_hit1         (entry8_hit1            ),
  .utlb_entry_ppn          (entry8_ppn             ),
  .utlb_entry_upd          (entry8_upd             ),
  .utlb_entry_vld          (entry8_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry9/); @365
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry9"); @366
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry9 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry9_flg             ),
  .utlb_entry_hit0         (entry9_hit0            ),
  .utlb_entry_hit1         (entry9_hit1            ),
  .utlb_entry_ppn          (entry9_ppn             ),
  .utlb_entry_upd          (entry9_upd             ),
  .utlb_entry_vld          (entry9_vld             ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry10/); @368
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry10"); @369
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry10 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry10_flg            ),
  .utlb_entry_hit0         (entry10_hit0           ),
  .utlb_entry_hit1         (entry10_hit1           ),
  .utlb_entry_ppn          (entry10_ppn            ),
  .utlb_entry_upd          (entry10_upd            ),
  .utlb_entry_vld          (entry10_vld            ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry11/); @371
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry11"); @372
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry11 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry11_flg            ),
  .utlb_entry_hit0         (entry11_hit0           ),
  .utlb_entry_hit1         (entry11_hit1           ),
  .utlb_entry_ppn          (entry11_ppn            ),
  .utlb_entry_upd          (entry11_upd            ),
  .utlb_entry_vld          (entry11_vld            ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry12/); @374
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry12"); @375
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry12 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry12_flg            ),
  .utlb_entry_hit0         (entry12_hit0           ),
  .utlb_entry_hit1         (entry12_hit1           ),
  .utlb_entry_ppn          (entry12_ppn            ),
  .utlb_entry_upd          (entry12_upd            ),
  .utlb_entry_vld          (entry12_vld            ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry13/); @377
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry13"); @378
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry13 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry13_flg            ),
  .utlb_entry_hit0         (entry13_hit0           ),
  .utlb_entry_hit1         (entry13_hit1           ),
  .utlb_entry_ppn          (entry13_ppn            ),
  .utlb_entry_upd          (entry13_upd            ),
  .utlb_entry_vld          (entry13_vld            ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry14/); @380
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry14"); @381
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry14 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry14_flg            ),
  .utlb_entry_hit0         (entry14_hit0           ),
  .utlb_entry_hit1         (entry14_hit1           ),
  .utlb_entry_ppn          (entry14_ppn            ),
  .utlb_entry_upd          (entry14_upd            ),
  .utlb_entry_vld          (entry14_vld            ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry15/); @383
// &Instance("ct_mmu_dutlb_entry","x_ct_mmu_dutlb_entry15"); @384
ct_mmu_dutlb_entry  x_ct_mmu_dutlb_entry15 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry15_flg            ),
  .utlb_entry_hit0         (entry15_hit0           ),
  .utlb_entry_hit1         (entry15_hit1           ),
  .utlb_entry_ppn          (entry15_ppn            ),
  .utlb_entry_upd          (entry15_upd            ),
  .utlb_entry_vld          (entry15_vld            ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);


// &ConnRule(s/utlb_entry/entry16/); @386
// &Instance("ct_mmu_dutlb_huge_entry","x_ct_mmu_dutlb_entry16"); @387
ct_mmu_dutlb_huge_entry  x_ct_mmu_dutlb_entry16 (
  .cp0_mmu_icg_en          (cp0_mmu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .lsu_mmu_tlb_va          (lsu_mmu_tlb_va         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_utlb_clr           (regs_utlb_clr          ),
  .tlboper_utlb_clr        (tlboper_utlb_clr       ),
  .tlboper_utlb_inv_va_req (tlboper_utlb_inv_va_req),
  .utlb_clk                (utlb_clk               ),
  .utlb_entry_flg          (entry16_flg            ),
  .utlb_entry_hit0         (entry16_hit0           ),
  .utlb_entry_hit1         (entry16_hit1           ),
  .utlb_entry_ppn          (entry16_ppn            ),
  .utlb_entry_upd          (utlb_huge_entry_upd    ),
  .utlb_entry_vld          (entry16_vld            ),
  .utlb_req_vpn0           (utlb_req_vpn0          ),
  .utlb_req_vpn1           (utlb_req_vpn1          ),
  .utlb_upd_flg            (utlb_upd_flg           ),
  .utlb_upd_ppn            (utlb_upd_ppn           ),
  .utlb_upd_vpn            (utlb_upd_vpn           )
);

// &Connect( .utlb_entry_upd     (utlb_huge_entry_upd)); @388


//----------------------------------------------------------
//                  uTLB Entry read
//----------------------------------------------------------
assign dutlb_off_hit     = !regs_mmu_en || cp0_mach_mode;
assign dutlb_xx_mmu_off  = dutlb_off_hit;

// Instance the two read ports for LSU read and write
// &ConnRule(s/_x/0/); @398
// &Instance("ct_mmu_dutlb_read","x_ct_mmu_dutlb_read0"); @399
ct_mmu_dutlb_read  x_ct_mmu_dutlb_read0 (
  .biu_mmu_smp_disable       (biu_mmu_smp_disable      ),
  .cp0_mach_mode             (cp0_mach_mode            ),
  .cp0_mmu_icg_en            (cp0_mmu_icg_en           ),
  .cp0_mmu_mxr               (cp0_mmu_mxr              ),
  .cp0_mmu_sum               (cp0_mmu_sum              ),
  .cp0_supv_mode             (cp0_supv_mode            ),
  .cp0_user_mode             (cp0_user_mode            ),
  .cpurst_b                  (cpurst_b                 ),
  .dplru_clk                 (dplru_clk                ),
  .dutlb_acc_flt_x           (dutlb_acc_flt0           ),
  .dutlb_clk                 (dutlb_clk                ),
  .dutlb_expt_for_taken      (dutlb_expt_for_taken     ),
  .dutlb_inst_id_match_x     (dutlb_inst_id_match0     ),
  .dutlb_inst_id_older_x     (dutlb_inst_id_older0     ),
  .dutlb_miss_vld_short_x    (dutlb_miss_vld_short0    ),
  .dutlb_miss_vld_x          (dutlb_miss_vld0          ),
  .dutlb_off_hit             (dutlb_off_hit            ),
  .dutlb_ori_read_x          (dutlb_ori_read0          ),
  .dutlb_plru_read_hit_vld_x (dutlb_plru_read_hit_vld0 ),
  .dutlb_plru_read_hit_x     (dutlb_plru_read_hit0     ),
  .dutlb_read_type_x         (dutlb_read_type0         ),
  .dutlb_ref_acflt           (dutlb_ref_acflt          ),
  .dutlb_ref_pgflt           (dutlb_ref_pgflt          ),
  .dutlb_refill_on_x         (dutlb_refill_on0         ),
  .dutlb_va_chg_x            (dutlb_va_chg0            ),
  .entry0_flg                (entry0_flg               ),
  .entry0_hit_x              (entry0_hit0              ),
  .entry0_ppn                (entry0_ppn               ),
  .entry0_vld                (entry0_vld               ),
  .entry10_flg               (entry10_flg              ),
  .entry10_hit_x             (entry10_hit0             ),
  .entry10_ppn               (entry10_ppn              ),
  .entry10_vld               (entry10_vld              ),
  .entry11_flg               (entry11_flg              ),
  .entry11_hit_x             (entry11_hit0             ),
  .entry11_ppn               (entry11_ppn              ),
  .entry11_vld               (entry11_vld              ),
  .entry12_flg               (entry12_flg              ),
  .entry12_hit_x             (entry12_hit0             ),
  .entry12_ppn               (entry12_ppn              ),
  .entry12_vld               (entry12_vld              ),
  .entry13_flg               (entry13_flg              ),
  .entry13_hit_x             (entry13_hit0             ),
  .entry13_ppn               (entry13_ppn              ),
  .entry13_vld               (entry13_vld              ),
  .entry14_flg               (entry14_flg              ),
  .entry14_hit_x             (entry14_hit0             ),
  .entry14_ppn               (entry14_ppn              ),
  .entry14_vld               (entry14_vld              ),
  .entry15_flg               (entry15_flg              ),
  .entry15_hit_x             (entry15_hit0             ),
  .entry15_ppn               (entry15_ppn              ),
  .entry15_vld               (entry15_vld              ),
  .entry16_flg               (entry16_flg              ),
  .entry16_hit_x             (entry16_hit0             ),
  .entry16_ppn               (entry16_ppn              ),
  .entry16_vld               (entry16_vld              ),
  .entry1_flg                (entry1_flg               ),
  .entry1_hit_x              (entry1_hit0              ),
  .entry1_ppn                (entry1_ppn               ),
  .entry1_vld                (entry1_vld               ),
  .entry2_flg                (entry2_flg               ),
  .entry2_hit_x              (entry2_hit0              ),
  .entry2_ppn                (entry2_ppn               ),
  .entry2_vld                (entry2_vld               ),
  .entry3_flg                (entry3_flg               ),
  .entry3_hit_x              (entry3_hit0              ),
  .entry3_ppn                (entry3_ppn               ),
  .entry3_vld                (entry3_vld               ),
  .entry4_flg                (entry4_flg               ),
  .entry4_hit_x              (entry4_hit0              ),
  .entry4_ppn                (entry4_ppn               ),
  .entry4_vld                (entry4_vld               ),
  .entry5_flg                (entry5_flg               ),
  .entry5_hit_x              (entry5_hit0              ),
  .entry5_ppn                (entry5_ppn               ),
  .entry5_vld                (entry5_vld               ),
  .entry6_flg                (entry6_flg               ),
  .entry6_hit_x              (entry6_hit0              ),
  .entry6_ppn                (entry6_ppn               ),
  .entry6_vld                (entry6_vld               ),
  .entry7_flg                (entry7_flg               ),
  .entry7_hit_x              (entry7_hit0              ),
  .entry7_ppn                (entry7_ppn               ),
  .entry7_vld                (entry7_vld               ),
  .entry8_flg                (entry8_flg               ),
  .entry8_hit_x              (entry8_hit0              ),
  .entry8_ppn                (entry8_ppn               ),
  .entry8_vld                (entry8_vld               ),
  .entry9_flg                (entry9_flg               ),
  .entry9_hit_x              (entry9_hit0              ),
  .entry9_ppn                (entry9_ppn               ),
  .entry9_vld                (entry9_vld               ),
  .forever_cpuclk            (forever_cpuclk           ),
  .lsu_mmu_abort_x           (lsu_mmu_abort0           ),
  .lsu_mmu_id_x              (lsu_mmu_id0              ),
  .lsu_mmu_stamo_pa_x        (lsu_mmu_stamo_pa0        ),
  .lsu_mmu_stamo_vld_x       (lsu_mmu_stamo_vld0       ),
  .lsu_mmu_va_vld_x          (lsu_mmu_va_vld0          ),
  .lsu_mmu_va_x              (lsu_mmu_va0              ),
  .lsu_mmu_vabuf_x           (lsu_mmu_vabuf0           ),
  .mmu_lsu_access_fault_x    (mmu_lsu_access_fault0    ),
  .mmu_lsu_buf_x             (mmu_lsu_buf0             ),
  .mmu_lsu_ca_x              (mmu_lsu_ca0              ),
  .mmu_lsu_pa_vld_x          (mmu_lsu_pa_vld0          ),
  .mmu_lsu_pa_x              (mmu_lsu_pa0              ),
  .mmu_lsu_page_fault_x      (mmu_lsu_page_fault0      ),
  .mmu_lsu_sec_x             (mmu_lsu_sec0             ),
  .mmu_lsu_sh_x              (mmu_lsu_sh0              ),
  .mmu_lsu_so_x              (mmu_lsu_so0              ),
  .mmu_lsu_stall_x           (mmu_lsu_stall0           ),
  .mmu_pmp_pa_x              (mmu_pmp_pa0              ),
  .mmu_sysmap_pa_x           (mmu_sysmap_pa0           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pmp_mmu_flg_x             (pmp_mmu_flg0             ),
  .refill_id_flop            (refill_id_flop           ),
  .sysmap_mmu_flg_x          (sysmap_mmu_flg0          ),
  .utlb_req_vpn_x            (utlb_req_vpn0            )
);

assign lsu_mmu_va_vld0 = lsu_mmu_va0_vld;
assign mmu_lsu_pa0_vld = mmu_lsu_pa_vld0;
assign dutlb_read_type0 = !lsu_mmu_st_inst0;
assign dutlb_ori_read0 = 1'b1;
assign lsu_mmu_stamo_vld0 = 1'b0;
assign lsu_mmu_stamo_pa0[PPN_WIDTH-1:0] = {PPN_WIDTH{1'b0}};

// &ConnRule(s/_x/1/); @407
// &Instance("ct_mmu_dutlb_read","x_ct_mmu_dutlb_read1"); @408
ct_mmu_dutlb_read  x_ct_mmu_dutlb_read1 (
  .biu_mmu_smp_disable       (biu_mmu_smp_disable      ),
  .cp0_mach_mode             (cp0_mach_mode            ),
  .cp0_mmu_icg_en            (cp0_mmu_icg_en           ),
  .cp0_mmu_mxr               (cp0_mmu_mxr              ),
  .cp0_mmu_sum               (cp0_mmu_sum              ),
  .cp0_supv_mode             (cp0_supv_mode            ),
  .cp0_user_mode             (cp0_user_mode            ),
  .cpurst_b                  (cpurst_b                 ),
  .dplru_clk                 (dplru_clk                ),
  .dutlb_acc_flt_x           (dutlb_acc_flt1           ),
  .dutlb_clk                 (dutlb_clk                ),
  .dutlb_expt_for_taken      (dutlb_expt_for_taken     ),
  .dutlb_inst_id_match_x     (dutlb_inst_id_match1     ),
  .dutlb_inst_id_older_x     (dutlb_inst_id_older1     ),
  .dutlb_miss_vld_short_x    (dutlb_miss_vld_short1    ),
  .dutlb_miss_vld_x          (dutlb_miss_vld1          ),
  .dutlb_off_hit             (dutlb_off_hit            ),
  .dutlb_ori_read_x          (dutlb_ori_read1          ),
  .dutlb_plru_read_hit_vld_x (dutlb_plru_read_hit_vld1 ),
  .dutlb_plru_read_hit_x     (dutlb_plru_read_hit1     ),
  .dutlb_read_type_x         (dutlb_read_type1         ),
  .dutlb_ref_acflt           (dutlb_ref_acflt          ),
  .dutlb_ref_pgflt           (dutlb_ref_pgflt          ),
  .dutlb_refill_on_x         (dutlb_refill_on1         ),
  .dutlb_va_chg_x            (dutlb_va_chg1            ),
  .entry0_flg                (entry0_flg               ),
  .entry0_hit_x              (entry0_hit1              ),
  .entry0_ppn                (entry0_ppn               ),
  .entry0_vld                (entry0_vld               ),
  .entry10_flg               (entry10_flg              ),
  .entry10_hit_x             (entry10_hit1             ),
  .entry10_ppn               (entry10_ppn              ),
  .entry10_vld               (entry10_vld              ),
  .entry11_flg               (entry11_flg              ),
  .entry11_hit_x             (entry11_hit1             ),
  .entry11_ppn               (entry11_ppn              ),
  .entry11_vld               (entry11_vld              ),
  .entry12_flg               (entry12_flg              ),
  .entry12_hit_x             (entry12_hit1             ),
  .entry12_ppn               (entry12_ppn              ),
  .entry12_vld               (entry12_vld              ),
  .entry13_flg               (entry13_flg              ),
  .entry13_hit_x             (entry13_hit1             ),
  .entry13_ppn               (entry13_ppn              ),
  .entry13_vld               (entry13_vld              ),
  .entry14_flg               (entry14_flg              ),
  .entry14_hit_x             (entry14_hit1             ),
  .entry14_ppn               (entry14_ppn              ),
  .entry14_vld               (entry14_vld              ),
  .entry15_flg               (entry15_flg              ),
  .entry15_hit_x             (entry15_hit1             ),
  .entry15_ppn               (entry15_ppn              ),
  .entry15_vld               (entry15_vld              ),
  .entry16_flg               (entry16_flg              ),
  .entry16_hit_x             (entry16_hit1             ),
  .entry16_ppn               (entry16_ppn              ),
  .entry16_vld               (entry16_vld              ),
  .entry1_flg                (entry1_flg               ),
  .entry1_hit_x              (entry1_hit1              ),
  .entry1_ppn                (entry1_ppn               ),
  .entry1_vld                (entry1_vld               ),
  .entry2_flg                (entry2_flg               ),
  .entry2_hit_x              (entry2_hit1              ),
  .entry2_ppn                (entry2_ppn               ),
  .entry2_vld                (entry2_vld               ),
  .entry3_flg                (entry3_flg               ),
  .entry3_hit_x              (entry3_hit1              ),
  .entry3_ppn                (entry3_ppn               ),
  .entry3_vld                (entry3_vld               ),
  .entry4_flg                (entry4_flg               ),
  .entry4_hit_x              (entry4_hit1              ),
  .entry4_ppn                (entry4_ppn               ),
  .entry4_vld                (entry4_vld               ),
  .entry5_flg                (entry5_flg               ),
  .entry5_hit_x              (entry5_hit1              ),
  .entry5_ppn                (entry5_ppn               ),
  .entry5_vld                (entry5_vld               ),
  .entry6_flg                (entry6_flg               ),
  .entry6_hit_x              (entry6_hit1              ),
  .entry6_ppn                (entry6_ppn               ),
  .entry6_vld                (entry6_vld               ),
  .entry7_flg                (entry7_flg               ),
  .entry7_hit_x              (entry7_hit1              ),
  .entry7_ppn                (entry7_ppn               ),
  .entry7_vld                (entry7_vld               ),
  .entry8_flg                (entry8_flg               ),
  .entry8_hit_x              (entry8_hit1              ),
  .entry8_ppn                (entry8_ppn               ),
  .entry8_vld                (entry8_vld               ),
  .entry9_flg                (entry9_flg               ),
  .entry9_hit_x              (entry9_hit1              ),
  .entry9_ppn                (entry9_ppn               ),
  .entry9_vld                (entry9_vld               ),
  .forever_cpuclk            (forever_cpuclk           ),
  .lsu_mmu_abort_x           (lsu_mmu_abort1           ),
  .lsu_mmu_id_x              (lsu_mmu_id1              ),
  .lsu_mmu_stamo_pa_x        (lsu_mmu_stamo_pa1        ),
  .lsu_mmu_stamo_vld_x       (lsu_mmu_stamo_vld1       ),
  .lsu_mmu_va_vld_x          (lsu_mmu_va_vld1          ),
  .lsu_mmu_va_x              (lsu_mmu_va1              ),
  .lsu_mmu_vabuf_x           (lsu_mmu_vabuf1           ),
  .mmu_lsu_access_fault_x    (mmu_lsu_access_fault1    ),
  .mmu_lsu_buf_x             (mmu_lsu_buf1             ),
  .mmu_lsu_ca_x              (mmu_lsu_ca1              ),
  .mmu_lsu_pa_vld_x          (mmu_lsu_pa_vld1          ),
  .mmu_lsu_pa_x              (mmu_lsu_pa1              ),
  .mmu_lsu_page_fault_x      (mmu_lsu_page_fault1      ),
  .mmu_lsu_sec_x             (mmu_lsu_sec1             ),
  .mmu_lsu_sh_x              (mmu_lsu_sh1              ),
  .mmu_lsu_so_x              (mmu_lsu_so1              ),
  .mmu_lsu_stall_x           (mmu_lsu_stall1           ),
  .mmu_pmp_pa_x              (mmu_pmp_pa1              ),
  .mmu_sysmap_pa_x           (mmu_sysmap_pa1           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pmp_mmu_flg_x             (pmp_mmu_flg1             ),
  .refill_id_flop            (refill_id_flop           ),
  .sysmap_mmu_flg_x          (sysmap_mmu_flg1          ),
  .utlb_req_vpn_x            (utlb_req_vpn1            )
);

assign lsu_mmu_va_vld1 = lsu_mmu_va1_vld;
assign mmu_lsu_pa1_vld = mmu_lsu_pa_vld1;
assign dutlb_read_type1 = !lsu_mmu_st_inst1;
assign dutlb_ori_read1 = 1'b0;
assign lsu_mmu_stamo_vld1 = lsu_mmu_stamo_vld;
assign lsu_mmu_stamo_pa1[PPN_WIDTH-1:0] = lsu_mmu_stamo_pa[PPN_WIDTH-1:0];

//assign dutlb_acc_vld = lsu_mmu_va0_vld || lsu_mmu_va1_vld;

//----------------------------------------------------------
//                  uTLB Entry Write
//----------------------------------------------------------
// refill utlb entry when refill cmplt with no expt
// &Force("bus", "jtlb_utlb_ref_pgs", 2, 0); @422
assign utlb_huge_entry_upd = dutlb_refill_vld && jtlb_utlb_ref_pgs[2];
assign {entry15_upd, entry14_upd, entry13_upd, entry12_upd,
        entry11_upd, entry10_upd, entry9_upd,  entry8_upd,
        entry7_upd,  entry6_upd,  entry5_upd,  entry4_upd,
        entry3_upd,  entry2_upd,  entry1_upd,  entry0_upd}
                           = plru_dutlb_ref_num[15:0] & {16{dutlb_refill_vld
                                                     && !jtlb_utlb_ref_pgs[2]}};

// entry updt info
// 1. from jtlb if hit
// 2. from memory through dcache if hit in jtlb
assign utlb_upd_vpn[VPN_WIDTH-1:0] = {jtlb_utlb_ref_vpn[VPN_WIDTH-1:LVL_WIDTH],
                                      jtlb_utlb_ref_pgs[0] ? 
                                      jtlb_utlb_ref_vpn[LVL_WIDTH-1:0]:
                                      dutlb_arb_vpn[LVL_WIDTH-1:0]};
assign utlb_upd_ppn[PPN_WIDTH-1:0] = {jtlb_utlb_ref_ppn[PPN_WIDTH-1:LVL_WIDTH],
                                      jtlb_utlb_ref_pgs[0] ? 
                                      jtlb_utlb_ref_ppn[LVL_WIDTH-1:0]:
                                      dutlb_arb_vpn[LVL_WIDTH-1:0]};
assign utlb_upd_flg[FLG_WIDTH-1:0] = jtlb_utlb_ref_flg[FLG_WIDTH-1:0];

assign dutlb_top_scd_updt = 1'b0;

// for dbg
assign dutlb_top_ref_cur_st[2:0] = ref_cur_st[2:0];
assign dutlb_top_ref_type        = refill_type;
assign dutlb_ptw_wfc             = dutlb_wfc;

// &ModuleEnd; @451
endmodule


