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
module ct_mmu_regs(
  cp0_mmu_cskyee,
  cp0_mmu_icg_en,
  cp0_mmu_mpp,
  cp0_mmu_mprv,
  cp0_mmu_reg_num,
  cp0_mmu_satp_sel,
  cp0_mmu_wdata,
  cp0_mmu_wreg,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  jtlb_regs_hit,
  jtlb_regs_hit_mult,
  jtlb_regs_tlbp_hit_index,
  jtlb_tlbr_asid,
  jtlb_tlbr_flg,
  jtlb_tlbr_g,
  jtlb_tlbr_pgs,
  jtlb_tlbr_ppn,
  jtlb_tlbr_vpn,
  mmu_cp0_cmplt,
  mmu_cp0_data,
  mmu_cp0_satp_data,
  mmu_lsu_mmu_en,
  mmu_xx_mmu_en,
  pad_yy_icg_scan_en,
  regs_jtlb_cur_asid,
  regs_jtlb_cur_flg,
  regs_jtlb_cur_g,
  regs_jtlb_cur_ppn,
  regs_mmu_en,
  regs_ptw_cur_asid,
  regs_ptw_satp_ppn,
  regs_tlboper_cur_asid,
  regs_tlboper_cur_pgs,
  regs_tlboper_cur_vpn,
  regs_tlboper_inv_asid,
  regs_tlboper_invall,
  regs_tlboper_invasid,
  regs_tlboper_mir,
  regs_tlboper_tlbp,
  regs_tlboper_tlbr,
  regs_tlboper_tlbwi,
  regs_tlboper_tlbwr,
  regs_utlb_clr,
  rtu_mmu_bad_vpn,
  rtu_mmu_expt_vld,
  tlboper_regs_cmplt,
  tlboper_regs_tlbp_cmplt,
  tlboper_regs_tlbr_cmplt
);

// &Ports; @24
input           cp0_mmu_cskyee;          
input           cp0_mmu_icg_en;          
input   [1 :0]  cp0_mmu_mpp;             
input           cp0_mmu_mprv;            
input   [1 :0]  cp0_mmu_reg_num;         
input           cp0_mmu_satp_sel;        
input   [63:0]  cp0_mmu_wdata;           
input           cp0_mmu_wreg;            
input   [1 :0]  cp0_yy_priv_mode;        
input           cpurst_b;                
input           forever_cpuclk;          
input           jtlb_regs_hit;           
input           jtlb_regs_hit_mult;      
input   [10:0]  jtlb_regs_tlbp_hit_index; 
input   [15:0]  jtlb_tlbr_asid;          
input   [13:0]  jtlb_tlbr_flg;           
input           jtlb_tlbr_g;             
input   [2 :0]  jtlb_tlbr_pgs;           
input   [27:0]  jtlb_tlbr_ppn;           
input   [26:0]  jtlb_tlbr_vpn;           
input           pad_yy_icg_scan_en;      
input   [26:0]  rtu_mmu_bad_vpn;         
input           rtu_mmu_expt_vld;        
input           tlboper_regs_cmplt;      
input           tlboper_regs_tlbp_cmplt; 
input           tlboper_regs_tlbr_cmplt; 
output          mmu_cp0_cmplt;           
output  [63:0]  mmu_cp0_data;            
output  [63:0]  mmu_cp0_satp_data;       
output          mmu_lsu_mmu_en;          
output          mmu_xx_mmu_en;           
output  [15:0]  regs_jtlb_cur_asid;      
output  [13:0]  regs_jtlb_cur_flg;       
output          regs_jtlb_cur_g;         
output  [27:0]  regs_jtlb_cur_ppn;       
output          regs_mmu_en;             
output  [15:0]  regs_ptw_cur_asid;       
output  [27:0]  regs_ptw_satp_ppn;       
output  [15:0]  regs_tlboper_cur_asid;   
output  [2 :0]  regs_tlboper_cur_pgs;    
output  [26:0]  regs_tlboper_cur_vpn;    
output  [15:0]  regs_tlboper_inv_asid;   
output          regs_tlboper_invall;     
output          regs_tlboper_invasid;    
output  [11:0]  regs_tlboper_mir;        
output          regs_tlboper_tlbp;       
output          regs_tlboper_tlbr;       
output          regs_tlboper_tlbwi;      
output          regs_tlboper_tlbwr;      
output          regs_utlb_clr;           

// &Regs; @25
reg     [15:0]  mcir_asid;               
reg             mcir_invall;             
reg             mcir_invasid;            
reg             mcir_no_op;              
reg             mcir_tlbp;               
reg             mcir_tlbr;               
reg             mcir_tlbwi;              
reg             mcir_tlbwr;              
reg     [15:0]  meh_asid;                
reg     [2 :0]  meh_pgs;                 
reg     [26:0]  meh_vpn;                 
reg             mel_access;              
reg             mel_b;                   
reg             mel_c;                   
reg             mel_dirty;               
reg             mel_exe;                 
reg             mel_global;              
reg     [27:0]  mel_ppn;                 
reg             mel_read;                
reg     [1 :0]  mel_rsw;                 
reg             mel_sec;                 
reg             mel_sh;                  
reg             mel_so;                  
reg             mel_user;                
reg             mel_vld;                 
reg             mel_write;               
reg     [11:0]  mir_index;               
reg             mir_probe;               
reg             mir_tlbp_tfatal;         
reg     [63:0]  mmu_cp0_data;            
reg     [15:0]  satp_asid;               
reg     [3 :0]  satp_mode;               
reg     [27:0]  satp_ppn;                

// &Wires; @26
wire            cp0_mmu_cskyee;          
wire            cp0_mmu_icg_en;          
wire    [1 :0]  cp0_mmu_mpp;             
wire            cp0_mmu_mprv;            
wire    [1 :0]  cp0_mmu_reg_num;         
wire            cp0_mmu_satp_sel;        
wire    [63:0]  cp0_mmu_wdata;           
wire            cp0_mmu_wreg;            
wire    [1 :0]  cp0_priv_mode;           
wire    [1 :0]  cp0_yy_priv_mode;        
wire            cpurst_b;                
wire            forever_cpuclk;          
wire            jtlb_regs_hit;           
wire            jtlb_regs_hit_mult;      
wire    [10:0]  jtlb_regs_tlbp_hit_index; 
wire    [15:0]  jtlb_tlbr_asid;          
wire    [13:0]  jtlb_tlbr_flg;           
wire            jtlb_tlbr_g;             
wire    [2 :0]  jtlb_tlbr_pgs;           
wire    [27:0]  jtlb_tlbr_ppn;           
wire    [26:0]  jtlb_tlbr_vpn;           
wire    [63:0]  mcir_data;               
wire            mcir_data_no_op;         
wire            mcir_write_en;           
wire    [63:0]  meh_data;                
wire            meh_write_en;            
wire    [63:0]  mel_data;                
wire            mel_write_en;            
wire    [63:0]  mir_data;                
wire            mir_write_en;            
wire            mmu_cp0_cmplt;           
wire    [63:0]  mmu_cp0_satp_data;       
wire            mmu_lsu_mmu_en;          
wire            mmu_regs_clk;            
wire            mmu_regs_clk_en;         
wire            mmu_xx_mmu_en;           
wire            pad_yy_icg_scan_en;      
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
wire    [63:0]  satp_data;               
wire            satp_write_en;           
wire            tlboper_regs_cmplt;      
wire            tlboper_regs_tlbp_cmplt; 
wire            tlboper_regs_tlbr_cmplt; 
wire            wdata_invall;            
wire            wdata_invasid;           
wire            wdata_tlbp;              
wire            wdata_tlbr;              
wire            wdata_tlbwi;             
wire            wdata_tlbwr;             


parameter VPN_WIDTH  = 39-12;  // VPN
parameter PPN_WIDTH  = 40-12;  // PPN
parameter FLG_WIDTH  = 14;     // Flags
parameter PGS_WIDTH  = 3;      // Page Size
parameter ASID_WIDTH = 16;     // Flags

//==============================================================================
//                  Flush uTLB when CR oper
//==============================================================================
assign regs_utlb_clr = satp_write_en;

//==============================================================================
//                  Gate Cell
//==============================================================================
assign mmu_regs_clk_en = cp0_mmu_wreg
                      || satp_write_en
                      || rtu_mmu_expt_vld
                      || tlboper_regs_cmplt
                      || mcir_no_op;
// &Instance("gated_clk_cell", "x_mmu_regs_gateclk"); @47
gated_clk_cell  x_mmu_regs_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mmu_regs_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (mmu_regs_clk_en   ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk  ), @48
//           .external_en(1'b0            ), @49
//           .global_en  (1'b1            ), @50
//           .module_en  (cp0_mmu_icg_en  ), @51
//           .local_en   (mmu_regs_clk_en ), @52
//           .clk_out    (mmu_regs_clk    ) @53
//          ); @54



//==============================================================================
//                  MMU Regs Definition
//==============================================================================
parameter MIR_NUM  = 2'd0;
parameter MEL_NUM  = 2'd1;
parameter MEH_NUM  = 2'd2;
parameter MCIR_NUM = 2'd3;

//----------------------------------------------------------
//                  Generate Write Enable
//----------------------------------------------------------
assign mir_write_en   = (cp0_mmu_reg_num[1:0] == MIR_NUM) && cp0_mmu_wreg;
assign mel_write_en   = (cp0_mmu_reg_num[1:0] == MEL_NUM) && cp0_mmu_wreg;
assign meh_write_en   = (cp0_mmu_reg_num[1:0] == MEH_NUM) && cp0_mmu_wreg;
assign mcir_write_en  = (cp0_mmu_reg_num[1:0] == MCIR_NUM) && cp0_mmu_wreg;
assign satp_write_en  =  cp0_mmu_satp_sel;

//==============================================================================
//                  Implement MMU Registers 
//==============================================================================
//==========================================================
//                  MIR register
//==========================================================
// the definiton for MIR register is listed as follows
//  ========================================================
//  | 63                                                32 |
//  +------------------------------------------------------+
//  |                      Reserved                        |
//  ========================================================
//  ========================================================
//  |  31  |     30      |29             12|11            0|
//  +------+-------------+-----------------+---------------+
//  |   P  | tlbp_tfatal |    Reserved     |     Index     |
//  ========================================================
//  P           --> tlbp match flag
//                  1'b0: match success
//                  1'b1: match failure
//
//  tlbp_tfatal --> 1'b0: none tlb probe tfatal exception
//              --> 1'b1: tlb probe tfatal exception occurs

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mir_probe       <= 1'b0;
    mir_tlbp_tfatal <= 1'b0;
  end
  else if(tlboper_regs_tlbp_cmplt)
  begin
    mir_probe       <= !jtlb_regs_hit;
    mir_tlbp_tfatal <=  jtlb_regs_hit_mult;
  end
end
  
always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mir_index[11:0] <= 12'b0;
  end
  else if(mir_write_en)
  begin
    mir_index[11:0] <= cp0_mmu_wdata[11:0];
  end
  else if(tlboper_regs_tlbp_cmplt && jtlb_regs_hit)
  begin
    mir_index[11:0] <= {1'b0, jtlb_regs_tlbp_hit_index[10:0]};  // TLBP probe is successful
  end
end

assign mir_data[63:0] = {32'b0, mir_probe, mir_tlbp_tfatal, 18'b0, mir_index[11:0]};


//==========================================================
//                  MEL register
//==========================================================
//  the definiton for MEL register is listed as follows
//  =======================================================
//  | 63 |62 |61 | 60 |59 | 58                38 |37    32|
//  +----+---+---+----+---+----------------------+--------+
//  | So | C | B | Sh |Sec|       Reserved       |   PPN  |
//  =======================================================
//  =======================================================
//  |31           10|9   8| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
//  +---------------------------------+---+---+---+---+---+
//  |      PPN      | RSW | D | A | G | U | X | W | R | V |
//  =======================================================
//
//  PFN --> the physical frame page numeber mapped to VPN
//   So --> 1'b1: the current page is strong order
//          1'b0: the current page is not strong order
//    C --> 1'b1: the current page is cacheable  
//          1'b0: the current page is uncacheable
//    B --> 1'b1: the current page is bufferable
//          1'b0: the current page is unbufferable
//   SH --> 1'b1: the current page is shareable
//          1'b0: the current page is non-shareable
//  Sec --> 1'b1: the current page is security sensitive
//          1'b0: the current page is not security sensitive
//    D --> 1'b1: the current page is writable
//          1'b0: the current page cannot be written to
//    A --> 1'b1: the current page is accessable
//          1'b0: the current page cannot be accessed to
//    G --> 1'b1: all process share Mem
//          1'b0: ASID will be compared in generating jtlb entry  hit singal
//    U --> 1'b1: the current page can be accessed by user mode
//          1'b0: the current page cannot be accessed by user mode
//    X --> 1'b1: the current page is executable
//          1'b0: the current page is not executable
//    W --> 1'b1: the current page is writeable
//          1'b0: the current page is not writeable
//    R --> 1'b1: the current page is readable
//          1'b0: the current page is not readable
//    V --> 1'b1: the current page is valid
//          1'b0: the current page is invalid
always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mel_ppn[PPN_WIDTH-1:0] <= {PPN_WIDTH{1'b0}};
    mel_so                 <= 1'b0;
    mel_c                  <= 1'b0;
    mel_b                  <= 1'b0;
    mel_sh                 <= 1'b0;
    mel_sec                <= 1'b0;
    mel_rsw[1:0]           <= 2'b0;
    mel_dirty              <= 1'b0;
    mel_access             <= 1'b0;
    mel_global             <= 1'b0;
    mel_user               <= 1'b0;
    mel_exe                <= 1'b0;
    mel_write              <= 1'b0;
    mel_read               <= 1'b0;
    mel_vld                <= 1'b0;
  end
  else if(mel_write_en)
  begin
    mel_ppn[PPN_WIDTH-1:0] <= cp0_mmu_wdata[PPN_WIDTH+9:10];
    mel_so                 <= cp0_mmu_wdata[63];
    mel_c                  <= cp0_mmu_wdata[62];
    mel_b                  <= cp0_mmu_wdata[61];
    mel_sh                 <= cp0_mmu_wdata[60];
    mel_sec                <= cp0_mmu_wdata[59];
    mel_rsw[1:0]           <= cp0_mmu_wdata[9:8];
    mel_dirty              <= cp0_mmu_wdata[7];
    mel_access             <= cp0_mmu_wdata[6];
    mel_global             <= cp0_mmu_wdata[5];
    mel_user               <= cp0_mmu_wdata[4];
    mel_exe                <= cp0_mmu_wdata[3];
    mel_write              <= cp0_mmu_wdata[2];
    mel_read               <= cp0_mmu_wdata[1];
    mel_vld                <= cp0_mmu_wdata[0];
  end
  else if(tlboper_regs_tlbr_cmplt)
  begin
    mel_ppn[PPN_WIDTH-1:0] <= jtlb_tlbr_ppn[PPN_WIDTH-1:0];
    mel_so                 <= jtlb_tlbr_flg[13];
    mel_c                  <= jtlb_tlbr_flg[12];
    mel_b                  <= jtlb_tlbr_flg[11];
    mel_sh                 <= jtlb_tlbr_flg[10];
    mel_sec                <= jtlb_tlbr_flg[9];
    mel_rsw[1:0]           <= jtlb_tlbr_flg[8:7];
    mel_dirty              <= jtlb_tlbr_flg[6];
    mel_access             <= jtlb_tlbr_flg[5];
    mel_global             <= jtlb_tlbr_g;
    mel_user               <= jtlb_tlbr_flg[4];
    mel_exe                <= jtlb_tlbr_flg[3];
    mel_write              <= jtlb_tlbr_flg[2];
    mel_read               <= jtlb_tlbr_flg[1];
    mel_vld                <= jtlb_tlbr_flg[0];
  end
end

assign mel_data[63:0] = {mel_so,mel_c,mel_b,mel_sh,mel_sec,21'b0,
                         mel_ppn[PPN_WIDTH-1:0],mel_rsw[1:0],mel_dirty,
                         mel_access,mel_global,mel_user,mel_exe,mel_write,
                         mel_read,mel_vld};


//==========================================================
//                  MEH register
//==========================================================
//  the definiton for MEH register is listed as follows
//  =======================================================
//  |63       46|45        19|18    16|15                0|
//  +------------------------+--------+-------------------+
//  |  Reserved |    VPN     |PageSize|        ASID       |
//  =======================================================
always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    meh_vpn[VPN_WIDTH-1:0]   <= {VPN_WIDTH{1'b0}};
    meh_pgs[PGS_WIDTH-1:0]   <= {PGS_WIDTH{1'b0}};
    meh_asid[ASID_WIDTH-1:0] <= {ASID_WIDTH{1'b0}};
  end
  else if(meh_write_en)
  begin
    meh_vpn[VPN_WIDTH-1:0]   <= cp0_mmu_wdata[45:19];
    meh_pgs[PGS_WIDTH-1:0]   <= cp0_mmu_wdata[18:16];
    meh_asid[ASID_WIDTH-1:0] <= cp0_mmu_wdata[ASID_WIDTH-1:0];
  end
  else if(rtu_mmu_expt_vld) // if TLB miss/inv/mod expt occurs, record bad VPN
  begin
    meh_vpn[VPN_WIDTH-1:0]   <= rtu_mmu_bad_vpn[VPN_WIDTH-1:0];
    meh_pgs[PGS_WIDTH-1:0]   <= meh_pgs[PGS_WIDTH-1:0];
    meh_asid[ASID_WIDTH-1:0] <= meh_asid[ASID_WIDTH-1:0];
  end
  else if(tlboper_regs_tlbr_cmplt)
  begin
    meh_vpn[VPN_WIDTH-1:0]   <= jtlb_tlbr_vpn[VPN_WIDTH-1:0];
    meh_pgs[PGS_WIDTH-1:0]   <= jtlb_tlbr_pgs[PGS_WIDTH-1:0];
    meh_asid[ASID_WIDTH-1:0] <= jtlb_tlbr_asid[ASID_WIDTH-1:0];
  end
end

assign meh_data[63:0] = {18'b0, meh_vpn[VPN_WIDTH-1:0], meh_pgs[PGS_WIDTH-1:0],
                                                      meh_asid[ASID_WIDTH-1:0]};


//==========================================================
//                  MCIR register
//==========================================================
// the definiton for MCIR register is listed as follows
//  ========================================================
//  | 63                                                32 |
//  +------------------------------------------------------+
//  |                      Reserved                        |
//  ========================================================
// ===================================================================
// |  31  |  30  |   29  |   28  |   27     |   26   |25    12|15  0 |
// +------+------+-------+-------+----------+--------+--------+------+
// | tlbp | tlbr | tlbwi | tlbwr | inv asid | invall |reserved| ASID |
// ===================================================================
assign wdata_invall  =  cp0_mmu_wdata[26] && cp0_mmu_cskyee;

assign wdata_invasid = !cp0_mmu_wdata[26] &&  cp0_mmu_wdata[27] && cp0_mmu_cskyee;

assign wdata_tlbp    = !cp0_mmu_wdata[26] && !cp0_mmu_wdata[27] && cp0_mmu_cskyee
                     && cp0_mmu_wdata[31];

assign wdata_tlbwi   = !cp0_mmu_wdata[26] && !cp0_mmu_wdata[27] && cp0_mmu_cskyee
                     &&!cp0_mmu_wdata[31] &&  cp0_mmu_wdata[29];

assign wdata_tlbwr   = !cp0_mmu_wdata[26] && !cp0_mmu_wdata[27] && cp0_mmu_cskyee
                     &&!cp0_mmu_wdata[31] && !cp0_mmu_wdata[29]
                     && cp0_mmu_wdata[28];

assign wdata_tlbr    = !cp0_mmu_wdata[26] && !cp0_mmu_wdata[27] && cp0_mmu_cskyee
                     &&!cp0_mmu_wdata[31] && !cp0_mmu_wdata[29] 
                     &&!cp0_mmu_wdata[28] &&  cp0_mmu_wdata[30];

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcir_invall <= 1'b0;
  else if(mcir_write_en && wdata_invall)         
    mcir_invall <= 1'b1;
  else if(tlboper_regs_cmplt)
    mcir_invall <= 1'b0;
end

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcir_invasid <= 1'b0;
  else if(mcir_write_en && wdata_invasid)
    mcir_invasid <= 1'b1;
  else if(tlboper_regs_cmplt)
    mcir_invasid <= 1'b0;
end

//always @(posedge mmu_regs_clk or negedge cpurst_b)
//begin
//  if(!cpurst_b)
//    mcir_invidx <= 1'b0;
//  else if(mcir_write_en && cp0_mmu_wdata[25])
//    mcir_invidx <= 1'b1;
//  else if(tlboper_regs_cmplt) 
//    mcir_invidx <= 1'b0;
//end

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcir_tlbp <= 1'b0;
  else if(mcir_write_en && wdata_tlbp)
    mcir_tlbp <= 1'b1;
  else if(tlboper_regs_cmplt)
    mcir_tlbp <= 1'b0;
end

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcir_tlbwi <= 1'b0;
  else if(mcir_write_en && wdata_tlbwi)
    mcir_tlbwi <= 1'b1;
  else if(tlboper_regs_cmplt)
    mcir_tlbwi <= 1'b0;
end

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b) 
    mcir_tlbwr <= 1'b0;
  else if(mcir_write_en && wdata_tlbwr)
    mcir_tlbwr <= 1'b1;
  else if(tlboper_regs_cmplt)
    mcir_tlbwr <= 1'b0;
end

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcir_tlbr <= 1'b0;
  else if(mcir_write_en && wdata_tlbr)         
    mcir_tlbr <= 1'b1;
  else if(tlboper_regs_cmplt)
    mcir_tlbr <= 1'b0;
end
 
// The recycled ASID field is updated for TLBINV instruction
always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mcir_asid[ASID_WIDTH-1:0] <= {ASID_WIDTH{1'b0}};
  end
  else if(mcir_write_en)
  begin
    mcir_asid[ASID_WIDTH-1:0] <= cp0_mmu_wdata[ASID_WIDTH-1:0];
  end
end

assign mcir_data[63:0] = {32'b0, mcir_tlbp, mcir_tlbr, mcir_tlbwi,
                          mcir_tlbwr, mcir_invasid, mcir_invall,
                          10'b0, mcir_asid[ASID_WIDTH-1:0]};

assign mcir_data_no_op = (cp0_mmu_wdata[31:26] == 6'b0);

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcir_no_op <= 1'b0;
  else if(mcir_write_en && mcir_data_no_op)
    mcir_no_op <= 1'b1;
  else if(mcir_no_op)
    mcir_no_op <= 1'b0;
end

//==========================================================
//                  STAP register
//==========================================================
//  the definiton for STAP register is listed as follows
//  =======================================================
//  |63  60|59        44|43        28|27                 0|
//  +------+------------+---------------------------------+
//  | Mode |    ASID    |  Reserved  |         PPN        |
//  =======================================================
always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    satp_mode[3:0]            <= {4{1'b0}};
  else if(satp_write_en && cp0_mmu_wdata[62:60] == 3'b0)
    satp_mode[3:0]            <= {cp0_mmu_wdata[63],3'b0};
end

always @(posedge mmu_regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    satp_asid[ASID_WIDTH-1:0] <= {ASID_WIDTH{1'b0}};
    satp_ppn[PPN_WIDTH-1:0]   <= {PPN_WIDTH{1'b0}};
  end
  else if(satp_write_en)
  begin
    satp_asid[ASID_WIDTH-1:0] <= cp0_mmu_wdata[59:44];
    satp_ppn[PPN_WIDTH-1:0]   <= cp0_mmu_wdata[PPN_WIDTH-1:0];
  end
end

assign satp_data[63:0] = {satp_mode[3:0],satp_asid[ASID_WIDTH-1:0],
                          16'b0,satp_ppn[PPN_WIDTH-1:0]};


//==========================================================
//                  CP0 interface
//==========================================================
assign mmu_cp0_cmplt = tlboper_regs_cmplt || mcir_no_op;

//--------------------------------------
// Provide MMU register read data bus to CP15 module 
//--------------------------------------
// &CombBeg; @453
always @( mcir_data[63:0]
       or mel_data[63:0]
       or meh_data[63:0]
       or mir_data[63:0]
       or cp0_mmu_reg_num[1:0])
begin
  case(cp0_mmu_reg_num[1:0])
  MIR_NUM   : mmu_cp0_data[63:0] = mir_data[63:0];
  MEL_NUM   : mmu_cp0_data[63:0] = mel_data[63:0];
  MEH_NUM   : mmu_cp0_data[63:0] = meh_data[63:0];
  MCIR_NUM  : mmu_cp0_data[63:0] = mcir_data[63:0];
  default   : mmu_cp0_data[63:0] = 64'b0;
endcase
// &CombEnd; @461
end

assign mmu_cp0_satp_data[63:0] = satp_data[63:0];

//==============================================================================
//                  CP0 request to TLBoper
//==============================================================================
//assign regs_tlboper_invidx  = mcir_invidx;
assign regs_tlboper_invall  = mcir_invall;
assign regs_tlboper_invasid = mcir_invasid;
assign regs_tlboper_tlbwr   = mcir_tlbwr;
assign regs_tlboper_tlbwi   = mcir_tlbwi;
assign regs_tlboper_tlbr    = mcir_tlbr;
assign regs_tlboper_tlbp    = mcir_tlbp;

assign regs_tlboper_inv_asid[ASID_WIDTH-1:0]  = mcir_asid[ASID_WIDTH-1:0];
assign regs_tlboper_mir[11:0] = mir_index[11:0];
assign regs_tlboper_cur_vpn[VPN_WIDTH-1:0] = meh_vpn[VPN_WIDTH-1:0];
assign regs_tlboper_cur_pgs[PGS_WIDTH-1:0] = meh_pgs[PGS_WIDTH-1:0];
assign regs_tlboper_cur_asid[ASID_WIDTH-1:0] = meh_asid[ASID_WIDTH-1:0];

assign regs_mmu_en                       = satp_mode[3:0] == 4'b1000;

assign cp0_priv_mode[1:0]                = cp0_mmu_mprv ? cp0_mmu_mpp[1:0]
                                         : cp0_yy_priv_mode[1:0];
assign mmu_lsu_mmu_en                    = satp_mode[3:0] == 4'b1000
                                        && cp0_priv_mode[1:0] != 2'b11; 
assign mmu_xx_mmu_en                     = satp_mode[3:0] == 4'b1000
                                        && cp0_yy_priv_mode[1:0] != 2'b11; 
assign regs_ptw_satp_ppn[PPN_WIDTH-1:0]  = satp_ppn[PPN_WIDTH-1:0];
assign regs_ptw_cur_asid[ASID_WIDTH-1:0] = satp_asid[ASID_WIDTH-1:0];

// for asid hit judgement
assign regs_jtlb_cur_asid[ASID_WIDTH-1:0] = satp_asid[ASID_WIDTH-1:0];

//used for jtlb data array wen
assign regs_jtlb_cur_ppn[PPN_WIDTH-1:0] = mel_ppn[PPN_WIDTH-1:0];
assign regs_jtlb_cur_flg[FLG_WIDTH-1:0] = {mel_data[63:59], mel_data[9:6], mel_data[4:0]};
assign regs_jtlb_cur_g                  = mel_global;



// &ModuleEnd; @503
endmodule


