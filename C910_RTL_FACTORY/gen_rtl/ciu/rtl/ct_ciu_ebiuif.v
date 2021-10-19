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
module ct_ciu_ebiuif(
  ciu_icg_en,
  cpurst_b,
  ctcq_ebiuif_ac_grant,
  ctcq_ebiuif_crresp,
  ctcq_ebiuif_crvalid,
  ebiu_ebiuif_acaddr,
  ebiu_ebiuif_acid,
  ebiu_ebiuif_acprot,
  ebiu_ebiuif_acsnoop,
  ebiu_ebiuif_acvalid,
  ebiu_ebiuif_ar_grant,
  ebiu_ebiuif_ar_grant_gate,
  ebiu_ebiuif_cd_grant,
  ebiu_ebiuif_cr_grant,
  ebiu_ebiuif_entry_sel,
  ebiu_ebiuif_rdata,
  ebiu_ebiuif_rlast,
  ebiu_ebiuif_rresp,
  ebiu_ebiuif_snb0_rvalid,
  ebiu_ebiuif_snb1_rvalid,
  ebiuif_ctcq_acaddr,
  ebiuif_ctcq_acid,
  ebiuif_ctcq_acsnoop,
  ebiuif_ctcq_acvalid,
  ebiuif_ctcq_cr_grant,
  ebiuif_ebiu_ac_grant,
  ebiuif_ebiu_araddr,
  ebiuif_ebiu_arbar,
  ebiuif_ebiu_arburst,
  ebiuif_ebiu_arcache,
  ebiuif_ebiu_ardomain,
  ebiuif_ebiu_arid,
  ebiuif_ebiu_arlen,
  ebiuif_ebiu_arlock,
  ebiuif_ebiu_arprot,
  ebiuif_ebiu_arsize,
  ebiuif_ebiu_arsnoop,
  ebiuif_ebiu_arvalid,
  ebiuif_ebiu_cddata,
  ebiuif_ebiu_cdlast,
  ebiuif_ebiu_cdvalid,
  ebiuif_ebiu_crresp,
  ebiuif_ebiu_crvalid,
  ebiuif_ebiu_r_grant,
  ebiuif_snb0_acvalid,
  ebiuif_snb0_ar_grant,
  ebiuif_snb0_ar_grant_gate,
  ebiuif_snb0_rvalid,
  ebiuif_snb1_acvalid,
  ebiuif_snb1_ar_grant,
  ebiuif_snb1_ar_grant_gate,
  ebiuif_snb1_rvalid,
  ebiuif_snbx_acbus,
  ebiuif_vb_index,
  ebiuif_xx_entry_sel,
  ebiuif_xx_rdata,
  ebiuif_xx_rlast,
  ebiuif_xx_rresp,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  snb0_ebiuif_ac_grant,
  snb0_ebiuif_arbus,
  snb0_ebiuif_arvalid,
  snb1_ebiuif_ac_grant,
  snb1_ebiuif_arbus,
  snb1_ebiuif_arvalid,
  vb_ebiuif_addr_depd
);

// &Ports; @19
input            ciu_icg_en;               
input            cpurst_b;                 
input            ctcq_ebiuif_ac_grant;     
input   [4  :0]  ctcq_ebiuif_crresp;       
input            ctcq_ebiuif_crvalid;      
input   [39 :0]  ebiu_ebiuif_acaddr;       
input   [4  :0]  ebiu_ebiuif_acid;         
input   [2  :0]  ebiu_ebiuif_acprot;       
input   [3  :0]  ebiu_ebiuif_acsnoop;      
input            ebiu_ebiuif_acvalid;      
input            ebiu_ebiuif_ar_grant;     
input            ebiu_ebiuif_ar_grant_gate; 
input            ebiu_ebiuif_cd_grant;     
input            ebiu_ebiuif_cr_grant;     
input   [23 :0]  ebiu_ebiuif_entry_sel;    
input   [127:0]  ebiu_ebiuif_rdata;        
input            ebiu_ebiuif_rlast;        
input   [3  :0]  ebiu_ebiuif_rresp;        
input            ebiu_ebiuif_snb0_rvalid;  
input            ebiu_ebiuif_snb1_rvalid;  
input            forever_cpuclk;           
input            pad_yy_icg_scan_en;       
input            snb0_ebiuif_ac_grant;     
input   [68 :0]  snb0_ebiuif_arbus;        
input            snb0_ebiuif_arvalid;      
input            snb1_ebiuif_ac_grant;     
input   [68 :0]  snb1_ebiuif_arbus;        
input            snb1_ebiuif_arvalid;      
input            vb_ebiuif_addr_depd;      
output  [39 :0]  ebiuif_ctcq_acaddr;       
output  [4  :0]  ebiuif_ctcq_acid;         
output  [3  :0]  ebiuif_ctcq_acsnoop;      
output           ebiuif_ctcq_acvalid;      
output           ebiuif_ctcq_cr_grant;     
output           ebiuif_ebiu_ac_grant;     
output  [39 :0]  ebiuif_ebiu_araddr;       
output  [1  :0]  ebiuif_ebiu_arbar;        
output  [1  :0]  ebiuif_ebiu_arburst;      
output  [3  :0]  ebiuif_ebiu_arcache;      
output  [1  :0]  ebiuif_ebiu_ardomain;     
output  [5  :0]  ebiuif_ebiu_arid;         
output  [7  :0]  ebiuif_ebiu_arlen;        
output           ebiuif_ebiu_arlock;       
output  [2  :0]  ebiuif_ebiu_arprot;       
output  [2  :0]  ebiuif_ebiu_arsize;       
output  [3  :0]  ebiuif_ebiu_arsnoop;      
output           ebiuif_ebiu_arvalid;      
output  [127:0]  ebiuif_ebiu_cddata;       
output           ebiuif_ebiu_cdlast;       
output           ebiuif_ebiu_cdvalid;      
output  [4  :0]  ebiuif_ebiu_crresp;       
output           ebiuif_ebiu_crvalid;      
output           ebiuif_ebiu_r_grant;      
output           ebiuif_snb0_acvalid;      
output           ebiuif_snb0_ar_grant;     
output           ebiuif_snb0_ar_grant_gate; 
output           ebiuif_snb0_rvalid;       
output           ebiuif_snb1_acvalid;      
output           ebiuif_snb1_ar_grant;     
output           ebiuif_snb1_ar_grant_gate; 
output           ebiuif_snb1_rvalid;       
output  [70 :0]  ebiuif_snbx_acbus;        
output  [7  :0]  ebiuif_vb_index;          
output  [23 :0]  ebiuif_xx_entry_sel;      
output  [127:0]  ebiuif_xx_rdata;          
output           ebiuif_xx_rlast;          
output  [3  :0]  ebiuif_xx_rresp;          

// &Regs; @20

// &Wires; @21
wire             ac_grant;                 
wire    [2  :0]  ac_grant_id;              
wire             ciu_icg_en;               
wire             cr_sel_full;              
wire             ctc_sel;                  
wire             ctcq_ebiuif_ac_grant;     
wire             ebiu_ar_clr;              
wire    [1  :0]  ebiu_ar_sel;              
wire    [1  :0]  ebiu_arvalid;             
wire    [39 :0]  ebiu_ebiuif_acaddr;       
wire    [4  :0]  ebiu_ebiuif_acid;         
wire    [2  :0]  ebiu_ebiuif_acprot;       
wire    [3  :0]  ebiu_ebiuif_acsnoop;      
wire             ebiu_ebiuif_acvalid;      
wire             ebiu_ebiuif_ar_grant;     
wire             ebiu_ebiuif_ar_grant_gate; 
wire    [23 :0]  ebiu_ebiuif_entry_sel;    
wire    [127:0]  ebiu_ebiuif_rdata;        
wire             ebiu_ebiuif_rlast;        
wire    [3  :0]  ebiu_ebiuif_rresp;        
wire             ebiu_ebiuif_snb0_rvalid;  
wire             ebiu_ebiuif_snb1_rvalid;  
wire    [68 :0]  ebiu_rd_bus;              
wire             ebiu_rd_req;              
wire    [39 :0]  ebiuif_ctcq_acaddr;       
wire    [4  :0]  ebiuif_ctcq_acid;         
wire    [3  :0]  ebiuif_ctcq_acsnoop;      
wire             ebiuif_ctcq_acvalid;      
wire             ebiuif_ctcq_cr_grant;     
wire             ebiuif_ebiu_ac_grant;     
wire    [39 :0]  ebiuif_ebiu_araddr;       
wire    [1  :0]  ebiuif_ebiu_arbar;        
wire    [1  :0]  ebiuif_ebiu_arburst;      
wire    [3  :0]  ebiuif_ebiu_arcache;      
wire    [1  :0]  ebiuif_ebiu_ardomain;     
wire    [5  :0]  ebiuif_ebiu_arid;         
wire    [7  :0]  ebiuif_ebiu_arlen;        
wire             ebiuif_ebiu_arlock;       
wire    [2  :0]  ebiuif_ebiu_arprot;       
wire    [2  :0]  ebiuif_ebiu_arsize;       
wire    [3  :0]  ebiuif_ebiu_arsnoop;      
wire             ebiuif_ebiu_arvalid;      
wire    [127:0]  ebiuif_ebiu_cddata;       
wire             ebiuif_ebiu_cdlast;       
wire             ebiuif_ebiu_cdvalid;      
wire    [4  :0]  ebiuif_ebiu_crresp;       
wire             ebiuif_ebiu_crvalid;      
wire             ebiuif_ebiu_r_grant;      
wire             ebiuif_rd_clk;            
wire             ebiuif_rd_clk_en;         
wire             ebiuif_snb0_acvalid;      
wire             ebiuif_snb0_ar_grant;     
wire             ebiuif_snb0_ar_grant_gate; 
wire             ebiuif_snb0_rvalid;       
wire             ebiuif_snb1_acvalid;      
wire             ebiuif_snb1_ar_grant;     
wire             ebiuif_snb1_ar_grant_gate; 
wire             ebiuif_snb1_rvalid;       
wire    [70 :0]  ebiuif_snbx_acbus;        
wire    [7  :0]  ebiuif_vb_index;          
wire    [23 :0]  ebiuif_xx_entry_sel;      
wire    [127:0]  ebiuif_xx_rdata;          
wire             ebiuif_xx_rlast;          
wire    [3  :0]  ebiuif_xx_rresp;          
wire             forever_cpuclk;           
wire             pad_yy_icg_scan_en;       
wire    [68 :0]  sab0_arbus;               
wire    [68 :0]  sab1_arbus;               
wire             snb0_arvalid;             
wire             snb0_ebiuif_ac_grant;     
wire    [68 :0]  snb0_ebiuif_arbus;        
wire             snb0_ebiuif_arvalid;      
wire             snb1_arvalid;             
wire             snb1_ebiuif_ac_grant;     
wire    [68 :0]  snb1_ebiuif_arbus;        
wire             snb1_ebiuif_arvalid;      
wire             vb_ebiuif_addr_depd;      


parameter DEPTH = `SAB_DEPTH;
parameter ADDRW = `PA_WIDTH;

// &Force("nonport","ebiu_ar_sel"); @26
// &Force("nonport", "ebiuif_rd_clk"); @27
// &Force("input","cpurst_b"); @28

assign ebiuif_rd_clk_en = ebiu_rd_req | ebiu_ar_clr;

// &Instance("gated_clk_cell", "x_ebiuif_rd_gated_clk"); @32
gated_clk_cell  x_ebiuif_rd_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ebiuif_rd_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ebiuif_rd_clk_en  ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @33
//          .external_en (1'b0), @34
//          .global_en   (1'b1), @35
//          .module_en (ciu_icg_en       ), @36
//          .local_en    (ebiuif_rd_clk_en), @37
//          .clk_out     (ebiuif_rd_clk)); @38

//================================================
//  EBIUR RD BUF
//================================================
//------------addr bus----------------------------
// 49  47 | 46      45 | 44      41 | 40    39 | 38     35   | 34    32 | 31      0
// sid[2:0] + burst[1:0] + cache[3:0] + len[1:0] + prot[3:0] + size[2:0]+ addr[31:0]

parameter ARWIDTH  = 69;
parameter ADDR_0   = 0;
parameter ADDR_6   = 6;
parameter ADDR_13  = 13;
parameter ADDR_H   = 39;  //ADDRW-1;
parameter SIZE_0   = 40;  //ADDR_H+1;
parameter SIZE_2   = 42;  //SIZE_0+2;
parameter PROT_0   = 43;  //SIZE_2+1;
parameter PROT_2   = 45;  //PROT_0+2;
parameter LOCK     = 46;  //PROT_2+1;
parameter LEN_0    = 47;  //LOCK  +1;
parameter LEN_1    = 48;  //LEN_0 +1;
parameter CACHE_0  = 49;  //LEN_1 +1;
parameter CACHE_3  = 52;  //CACHE_0+3;
parameter BURST_0  = 53;  //CACHE_3+1;
parameter BURST_1  = 54;  //BURST_0+1;
parameter DOMAIN_0 = 55;
parameter DOMAIN_1 = 56;
parameter BAR_0    = 57;
parameter BAR_1    = 58;
parameter SID_0    = 59;
parameter SID_4    = 63;
parameter SID_5    = 64;
parameter SNOOP_0  = 65;
parameter SNOOP_3  = 68;

assign ebiuif_snb0_ar_grant = ebiu_ebiuif_ar_grant & ebiu_ar_sel[0];
assign ebiuif_snb1_ar_grant = ebiu_ebiuif_ar_grant & ebiu_ar_sel[1];
assign ebiuif_snb0_ar_grant_gate = ebiu_ebiuif_ar_grant_gate & ebiu_ar_sel[0];
assign ebiuif_snb1_ar_grant_gate = ebiu_ebiuif_ar_grant_gate & ebiu_ar_sel[1];

//--------------------------------------
// arbitration
//--------------------------------------
assign snb0_arvalid = snb0_ebiuif_arvalid; // && !vb_ebiuif_snb0_depd;
assign snb1_arvalid = snb1_ebiuif_arvalid; // && !vb_ebiuif_snb1_depd;

assign ebiu_arvalid[1:0] = {snb1_arvalid, snb0_arvalid};
assign ebiu_ar_clr       = ebiu_ebiuif_ar_grant;

ct_prio #(.NUM(2)) x_ct_ciu_snb_ebiuif_ar_prio(
  .clk                 (ebiuif_rd_clk     ),
  .rst_b               (cpurst_b          ),
  .valid               (ebiu_arvalid      ),
  .clr                 (ebiu_ar_clr       ),
  .sel                 (ebiu_ar_sel       )
);

assign ebiu_rd_req = |ebiu_arvalid[1:0];

assign sab0_arbus[ARWIDTH-1:0] = snb0_ebiuif_arbus[ARWIDTH-1:0];
assign sab1_arbus[ARWIDTH-1:0] = snb1_ebiuif_arbus[ARWIDTH-1:0];

assign ebiu_rd_bus[ARWIDTH-1:0] = 
      {ARWIDTH{ebiu_ar_sel[1]}} & sab1_arbus[ARWIDTH-1:0] |
      {ARWIDTH{ebiu_ar_sel[0]}} & sab0_arbus[ARWIDTH-1:0];

assign ebiuif_ebiu_arvalid           = ebiu_rd_req & !vb_ebiuif_addr_depd;
assign ebiuif_vb_index[7:0]          = ebiu_rd_bus[ADDR_13:ADDR_6];
assign ebiuif_ebiu_arid[5:0]         = ebiu_rd_bus[SID_5:SID_0];
assign ebiuif_ebiu_araddr[ADDRW-1:0] = ebiu_rd_bus[ADDR_H:ADDR_0];
assign ebiuif_ebiu_arlen[7:0]        = {6'b0,ebiu_rd_bus[LEN_1:LEN_0]};
assign ebiuif_ebiu_arsize[2:0]       = ebiu_rd_bus[SIZE_2:SIZE_0];
assign ebiuif_ebiu_arburst[1:0]      = ebiu_rd_bus[BURST_1:BURST_0];
assign ebiuif_ebiu_arlock            = ebiu_rd_bus[LOCK];
assign ebiuif_ebiu_arcache[3:0]      = ebiu_rd_bus[CACHE_3:CACHE_0];
assign ebiuif_ebiu_arprot[2:0]       = ebiu_rd_bus[PROT_2:PROT_0];
assign ebiuif_ebiu_arsnoop[3:0]      = ebiu_rd_bus[SNOOP_3:SNOOP_0];
assign ebiuif_ebiu_ardomain[1:0]     = ebiu_rd_bus[DOMAIN_1:DOMAIN_0];
assign ebiuif_ebiu_arbar[1:0]        = ebiu_rd_bus[BAR_1:BAR_0];


//--------------------------------------
//  ebiuif_r channel
//--------------------------------------
assign ebiuif_snb0_rvalid     = ebiu_ebiuif_snb0_rvalid;
assign ebiuif_snb1_rvalid     = ebiu_ebiuif_snb1_rvalid;
assign ebiuif_xx_rlast        = ebiu_ebiuif_rlast;
assign ebiuif_xx_rresp[3:0]   = ebiu_ebiuif_rresp[3:0];
assign ebiuif_xx_rdata[127:0] = ebiu_ebiuif_rdata[127:0];
assign ebiuif_xx_entry_sel[DEPTH-1:0] = ebiu_ebiuif_entry_sel[DEPTH-1:0];

assign ebiuif_ebiu_r_grant = ebiu_ebiuif_snb0_rvalid | ebiu_ebiuif_snb1_rvalid;

//==========================================================
//            ebiuif ac channel
//==========================================================
parameter ACWIDTH     = 71;
parameter DVM_COMP    = 4'b1110;
parameter DVM_OP_SYNC = 4'b1111;

assign ctc_sel = (ebiu_ebiuif_acsnoop[3:0] == DVM_COMP) |
                 (ebiu_ebiuif_acsnoop[3:0] == DVM_OP_SYNC);

assign ebiuif_snb0_acvalid = ebiu_ebiuif_acvalid & !ebiu_ebiuif_acaddr[6] & !ctc_sel & !cr_sel_full;
assign ebiuif_snb1_acvalid = ebiu_ebiuif_acvalid &  ebiu_ebiuif_acaddr[6] & !ctc_sel & !cr_sel_full;
assign ebiuif_ctcq_acvalid = ebiu_ebiuif_acvalid & ctc_sel & !cr_sel_full;

assign ebiuif_ctcq_acaddr[ADDRW-1:0] = ebiu_ebiuif_acaddr[ADDRW-1:0];
assign ebiuif_ctcq_acsnoop[3:0]      = ebiu_ebiuif_acsnoop[3:0];
assign ebiuif_ctcq_acid[4:0]         = ebiu_ebiuif_acid[4:0];

assign ebiuif_snbx_acbus[ACWIDTH-1:0] = {ebiu_ebiuif_acaddr[ADDRW-1:0],
                                         2'b00,    //bar
                                         2'b01,    //domian
                                         ebiu_ebiuif_acsnoop[3:0],
                                         2'b01,     //burst
                                         2'b11,     //len
                                         ebiu_ebiuif_acid[4:0], //id
                                         3'b0,      //user
                                         1'b0,      //lock
                                         3'b110,    //size
                                         4'b1111,   //cache
                                         ebiu_ebiuif_acprot[2:0]};

assign ac_grant_id[2:0] = {ctcq_ebiuif_ac_grant, snb1_ebiuif_ac_grant, snb0_ebiuif_ac_grant};
assign ac_grant = |ac_grant_id[2:0];

assign ebiuif_ebiu_ac_grant = ac_grant;

// &Force("mem","cr_sel",CR_WIDTH-1,0,CR_DEPTH-1,0); @220
// &Force("output", "ebiuif_ebiu_crresp"); @246
// &Force("mem","cd_sel",SEL_WIDTH-1,0,CD_DEPTH-1,0); @312
// &Force("output", "ebiuif_ebiu_cdvalid"); @339
// &Force("output", "ebiuif_ebiu_cdlast"); @340
// &Force("input","ebiu_ebiuif_cd_grant"); @379
// &Force("input","ebiu_ebiuif_cr_grant"); @380
// &Force("input","ctcq_ebiuif_crvalid"); @381
// &Force("input","ctcq_ebiuif_crresp"); @382
// &Force("bus", "ctcq_ebiuif_crresp",4,0); @383

assign cr_sel_full = 1'b0;
assign ebiuif_ebiu_cdvalid       = 1'b0;
assign ebiuif_ebiu_cddata[127:0] = 128'b0;
assign ebiuif_ebiu_cdlast        = 1'b0;
assign ebiuif_ebiu_crvalid       = 1'b0;
assign ebiuif_ebiu_crresp[4:0]   = 5'b0;
assign ebiuif_ctcq_cr_grant      = 1'b0;

// &ModuleEnd; @394
endmodule


