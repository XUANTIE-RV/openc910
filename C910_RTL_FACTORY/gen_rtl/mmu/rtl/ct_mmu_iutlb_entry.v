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

// &ModuleBeg; @24
module ct_mmu_iutlb_entry(
  cp0_mmu_icg_en,
  cpurst_b,
  lsu_mmu_tlb_va,
  pad_yy_icg_scan_en,
  regs_utlb_clr,
  tlboper_utlb_clr,
  tlboper_utlb_inv_va_req,
  utlb_clk,
  utlb_entry_flg,
  utlb_entry_hit,
  utlb_entry_pgs,
  utlb_entry_ppn,
  utlb_entry_swp,
  utlb_entry_swp_on,
  utlb_entry_upd,
  utlb_entry_vld,
  utlb_req_vpn,
  utlb_swp_flg,
  utlb_swp_pgs,
  utlb_swp_ppn,
  utlb_swp_vpn,
  utlb_upd_flg,
  utlb_upd_pgs,
  utlb_upd_ppn,
  utlb_upd_vpn
);

// &Ports; @25
input           cp0_mmu_icg_en;         
input           cpurst_b;               
input   [26:0]  lsu_mmu_tlb_va;         
input           pad_yy_icg_scan_en;     
input           regs_utlb_clr;          
input           tlboper_utlb_clr;       
input           tlboper_utlb_inv_va_req; 
input           utlb_clk;               
input           utlb_entry_swp;         
input           utlb_entry_swp_on;      
input           utlb_entry_upd;         
input   [26:0]  utlb_req_vpn;           
input   [13:0]  utlb_swp_flg;           
input   [2 :0]  utlb_swp_pgs;           
input   [27:0]  utlb_swp_ppn;           
input   [26:0]  utlb_swp_vpn;           
input   [13:0]  utlb_upd_flg;           
input   [2 :0]  utlb_upd_pgs;           
input   [27:0]  utlb_upd_ppn;           
input   [26:0]  utlb_upd_vpn;           
output  [13:0]  utlb_entry_flg;         
output          utlb_entry_hit;         
output  [2 :0]  utlb_entry_pgs;         
output  [27:0]  utlb_entry_ppn;         
output          utlb_entry_vld;         

// &Regs; @26
reg     [13:0]  utlb_flg;               
reg     [2 :0]  utlb_pgs;               
reg     [27:0]  utlb_ppn;               
reg             utlb_vld;               
reg     [26:0]  utlb_vpn;               

// &Wires; @27
wire            cp0_mmu_icg_en;         
wire            cpurst_b;               
wire            ctc_inv_va_hit_clr;     
wire            entry_clk_en;           
wire    [26:0]  lsu_mmu_tlb_va;         
wire            pad_yy_icg_scan_en;     
wire            regs_utlb_clr;          
wire            tlboper_utlb_clr;       
wire            tlboper_utlb_inv_va_req; 
wire            utlb_clk;               
wire            utlb_entry_clk;         
wire            utlb_entry_clr;         
wire    [13:0]  utlb_entry_flg;         
wire            utlb_entry_gating_clr;  
wire            utlb_entry_hit;         
wire    [2 :0]  utlb_entry_pgs;         
wire    [27:0]  utlb_entry_ppn;         
wire            utlb_entry_swp;         
wire            utlb_entry_swp_on;      
wire            utlb_entry_upd;         
wire            utlb_entry_vld;         
wire            utlb_hit;               
wire    [26:0]  utlb_req_vpn;           
wire    [13:0]  utlb_swp_flg;           
wire    [2 :0]  utlb_swp_pgs;           
wire    [27:0]  utlb_swp_ppn;           
wire    [26:0]  utlb_swp_vpn;           
wire    [13:0]  utlb_upd_flg;           
wire    [2 :0]  utlb_upd_pgs;           
wire    [27:0]  utlb_upd_ppn;           
wire    [26:0]  utlb_upd_vpn;           
wire            vpn0_hit;               
wire            vpn1_hit;               
wire            vpn2_hit;               

// &Force("bus","lsu_mmu_tlb_va",26,0); @28

parameter VPN_WIDTH = 39-12;  // VPN
parameter PPN_WIDTH = 40-12;  // PPN
parameter FLG_WIDTH = 14;     // Flags
parameter PGS_WIDTH = 3;      // Page Size
parameter PTE_LEVEL = 3;      // Page Table Label

//============================================================
//                  MicroTLB Entry
//============================================================
//------------------------------------------------------------
// 1. ASID field are not included in uTLB entry
// 2. Each Data uTLB entry always matches the ASID in the SATP
//    register
// 3. The micro tlb entry layout is figured as following:
//    =========================================
//    |       |72   46|45      43|42 15|14   0|
//    |-------+-------+----------+-----+------+
//    | Valid |  VPN  | PageSize | PFN | Flag |
//    =========================================
//------------------------------------------------------------

// Gated Cell for utlb entry
assign entry_clk_en = utlb_entry_gating_clr
                   || utlb_entry_upd
                   || utlb_entry_swp;
// &Instance("gated_clk_cell", "x_iutlb_entry_gateclk"); @55
gated_clk_cell  x_iutlb_entry_gateclk (
  .clk_in             (utlb_clk          ),
  .clk_out            (utlb_entry_clk    ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (utlb_clk      ), @56
//           .external_en(1'b0          ), @57
//           .global_en  (1'b1          ), @58
//           .module_en  (cp0_mmu_icg_en), @59
//           .local_en   (entry_clk_en  ), @60
//           .clk_out    (utlb_entry_clk) @61
//          ); @62

//------------------------------------------------------------
//                  Valid bit generating
//------------------------------------------------------------
assign utlb_entry_clr = regs_utlb_clr 
                     || tlboper_utlb_clr 
                     || ctc_inv_va_hit_clr;
assign utlb_entry_gating_clr = regs_utlb_clr 
                     || tlboper_utlb_clr 
                     || tlboper_utlb_inv_va_req;
assign ctc_inv_va_hit_clr = tlboper_utlb_inv_va_req
                     && (lsu_mmu_tlb_va[7:0] == utlb_vpn[7:0]);

always @(posedge utlb_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    utlb_vld <= 1'b0;
  else if(utlb_entry_clr) 
    utlb_vld <= 1'b0;
  else if(utlb_entry_upd)
    utlb_vld <= 1'b1;
  else if(utlb_entry_swp)
    utlb_vld <= utlb_entry_swp_on;
end


//------------------------------------------------------------
//                  VPN Information
//------------------------------------------------------------
always @(posedge utlb_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    utlb_vpn[VPN_WIDTH-1:0] <= {VPN_WIDTH{1'b0}};
  else if(utlb_entry_upd)
    utlb_vpn[VPN_WIDTH-1:0] <= utlb_upd_vpn[VPN_WIDTH-1:0];
  else if(utlb_entry_swp)
    utlb_vpn[VPN_WIDTH-1:0] <= utlb_swp_vpn[VPN_WIDTH-1:0];
end


//------------------------------------------------------------
//                  PFN and Flag information
//------------------------------------------------------------
always @(posedge utlb_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    utlb_pgs[PGS_WIDTH-1:0] <= {PGS_WIDTH{1'b0}};
    utlb_ppn[PPN_WIDTH-1:0] <= {PPN_WIDTH{1'b0}};
    utlb_flg[FLG_WIDTH-1:0] <= {FLG_WIDTH{1'b0}};
  end
  else if(utlb_entry_upd)
  begin
    utlb_pgs[PGS_WIDTH-1:0] <= utlb_upd_pgs[PGS_WIDTH-1:0];
    utlb_ppn[PPN_WIDTH-1:0] <= utlb_upd_ppn[PPN_WIDTH-1:0];
    utlb_flg[FLG_WIDTH-1:0] <= utlb_upd_flg[FLG_WIDTH-1:0];
  end
  else if(utlb_entry_swp)
  begin
    utlb_pgs[PGS_WIDTH-1:0] <= utlb_swp_pgs[PGS_WIDTH-1:0];
    utlb_ppn[PPN_WIDTH-1:0] <= utlb_swp_ppn[PPN_WIDTH-1:0];
    utlb_flg[FLG_WIDTH-1:0] <= utlb_swp_flg[FLG_WIDTH-1:0];
  end
end


//------------------------------------------------------------
//                  Entry Hit
//------------------------------------------------------------
assign vpn2_hit  = utlb_req_vpn[VPN_WIDTH-1:VPN_WIDTH-9] 
                    == utlb_vpn[VPN_WIDTH-1:VPN_WIDTH-9];
assign vpn1_hit  = utlb_req_vpn[VPN_WIDTH-1-9:VPN_WIDTH-2*9] 
                    == utlb_vpn[VPN_WIDTH-1-9:VPN_WIDTH-2*9];
assign vpn0_hit  = utlb_req_vpn[VPN_WIDTH-1-2*9:0] 
                    == utlb_vpn[VPN_WIDTH-1-2*9:0];

assign utlb_hit  = utlb_pgs[0] && vpn2_hit && vpn1_hit && vpn0_hit
                || utlb_pgs[1] && vpn2_hit && vpn1_hit
                || utlb_pgs[2] && vpn2_hit;

//------------------------------------------------------------
//                  Output
//------------------------------------------------------------
assign utlb_entry_vld = utlb_vld;
assign utlb_entry_hit = utlb_hit;

//assign utlb_entry_vpn[VPN_WIDTH-1:0] = utlb_vpn[VPN_WIDTH-1:0];
assign utlb_entry_pgs[PGS_WIDTH-1:0] = utlb_pgs[PGS_WIDTH-1:0];

assign utlb_entry_ppn[PPN_WIDTH-1:0] = utlb_ppn[PPN_WIDTH-1:0];
assign utlb_entry_flg[FLG_WIDTH-1:0] = utlb_flg[FLG_WIDTH-1:0];


// &ModuleEnd; @156
endmodule


