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
module ct_piu_top_dummy(
  bmbif_piu_ctcq_grant,
  bmbif_piu_ncq_grant,
  bmbif_piu_snb0_grant,
  bmbif_piu_snb1_grant,
  ciu_icg_en,
  cpurst_b,
  ctcq_piu_acbus,
  ctcq_piu_acvalid,
  ctcq_piu_ar_grant,
  ctcq_piu_bar_cmplt,
  ctcq_piu_cr_grant,
  ctcq_piu_rvalid,
  ctcq_piux_rbus,
  ebiu_piu_no_op,
  forever_cpuclk,
  ncq_piu_ar_grant,
  ncq_piu_aw_grant,
  ncq_piu_bar_cmplt,
  ncq_piu_bbus,
  ncq_piu_bvalid,
  ncq_piu_rvalid,
  ncq_piu_wcd_grant,
  ncq_piux_rbus,
  pad_yy_icg_scan_en,
  piu_bmbif_ctcq_req,
  piu_bmbif_ncq_req,
  piu_bmbif_req_bus,
  piu_bmbif_snb0_req,
  piu_bmbif_snb1_req,
  piu_ctcq_ac_grant,
  piu_ctcq_ar_bus,
  piu_ctcq_ar_req,
  piu_ctcq_cr_bus,
  piu_ctcq_cr_req,
  piu_ctcq_r_grant,
  piu_ncq_ar_bus,
  piu_ncq_ar_req,
  piu_ncq_aw_bus,
  piu_ncq_aw_req,
  piu_ncq_b_grant,
  piu_ncq_r_grant,
  piu_ncq_wcd_bus,
  piu_ncq_wcd_req,
  piu_snb0_ac_grant,
  piu_snb0_ar_bus,
  piu_snb0_ar_req,
  piu_snb0_aw_req,
  piu_snb0_b_grant,
  piu_snb0_back,
  piu_snb0_cr_bus,
  piu_snb0_cr_req,
  piu_snb0_r_grant,
  piu_snb0_rack,
  piu_snb0_wcd_req,
  piu_snb1_ac_grant,
  piu_snb1_ar_bus,
  piu_snb1_ar_req,
  piu_snb1_aw_req,
  piu_snb1_b_grant,
  piu_snb1_back,
  piu_snb1_cr_bus,
  piu_snb1_cr_req,
  piu_snb1_r_grant,
  piu_snb1_rack,
  piu_snb1_wcd_req,
  piu_snbx_back_sid,
  piu_snbx_rack_sid,
  piu_xx_aw_bus,
  piu_xx_no_op,
  piu_xx_wcd_bus,
  snb0_piu_acbus,
  snb0_piu_acvalid,
  snb0_piu_ar_grant,
  snb0_piu_aw_grant,
  snb0_piu_bar_cmplt,
  snb0_piu_bvalid,
  snb0_piu_cr_grant,
  snb0_piu_rvalid,
  snb0_piu_wcd_grant,
  snb0_piux_bbus,
  snb0_piux_rbus,
  snb1_piu_acbus,
  snb1_piu_acvalid,
  snb1_piu_ar_grant,
  snb1_piu_aw_grant,
  snb1_piu_bar_cmplt,
  snb1_piu_bvalid,
  snb1_piu_cr_grant,
  snb1_piu_rvalid,
  snb1_piu_wcd_grant,
  snb1_piux_bbus,
  snb1_piux_rbus
);

// &Ports; @2
input            bmbif_piu_ctcq_grant; 
input            bmbif_piu_ncq_grant; 
input            bmbif_piu_snb0_grant; 
input            bmbif_piu_snb1_grant; 
input            ciu_icg_en;        
input            cpurst_b;          
input   [54 :0]  ctcq_piu_acbus;    
input            ctcq_piu_acvalid;  
input            ctcq_piu_ar_grant; 
input            ctcq_piu_bar_cmplt; 
input            ctcq_piu_cr_grant; 
input            ctcq_piu_rvalid;   
input   [534:0]  ctcq_piux_rbus;    
input            ebiu_piu_no_op;    
input            forever_cpuclk;    
input            ncq_piu_ar_grant;  
input            ncq_piu_aw_grant;  
input            ncq_piu_bar_cmplt; 
input   [13 :0]  ncq_piu_bbus;      
input            ncq_piu_bvalid;    
input            ncq_piu_rvalid;    
input            ncq_piu_wcd_grant; 
input   [534:0]  ncq_piux_rbus;     
input            pad_yy_icg_scan_en; 
input   [54 :0]  snb0_piu_acbus;    
input            snb0_piu_acvalid;  
input            snb0_piu_ar_grant; 
input            snb0_piu_aw_grant; 
input            snb0_piu_bar_cmplt; 
input            snb0_piu_bvalid;   
input            snb0_piu_cr_grant; 
input            snb0_piu_rvalid;   
input            snb0_piu_wcd_grant; 
input   [13 :0]  snb0_piux_bbus;    
input   [534:0]  snb0_piux_rbus;    
input   [54 :0]  snb1_piu_acbus;    
input            snb1_piu_acvalid;  
input            snb1_piu_ar_grant; 
input            snb1_piu_aw_grant; 
input            snb1_piu_bar_cmplt; 
input            snb1_piu_bvalid;   
input            snb1_piu_cr_grant; 
input            snb1_piu_rvalid;   
input            snb1_piu_wcd_grant; 
input   [13 :0]  snb1_piux_bbus;    
input   [534:0]  snb1_piux_rbus;    
output           piu_bmbif_ctcq_req; 
output           piu_bmbif_ncq_req; 
output  [8  :0]  piu_bmbif_req_bus; 
output           piu_bmbif_snb0_req; 
output           piu_bmbif_snb1_req; 
output           piu_ctcq_ac_grant; 
output  [70 :0]  piu_ctcq_ar_bus;   
output           piu_ctcq_ar_req;   
output  [9  :0]  piu_ctcq_cr_bus;   
output           piu_ctcq_cr_req;   
output           piu_ctcq_r_grant;  
output  [73 :0]  piu_ncq_ar_bus;    
output           piu_ncq_ar_req;    
output  [73 :0]  piu_ncq_aw_bus;    
output           piu_ncq_aw_req;    
output           piu_ncq_b_grant;   
output           piu_ncq_r_grant;   
output  [143:0]  piu_ncq_wcd_bus;   
output           piu_ncq_wcd_req;   
output           piu_snb0_ac_grant; 
output  [70 :0]  piu_snb0_ar_bus;   
output           piu_snb0_ar_req;   
output           piu_snb0_aw_req;   
output           piu_snb0_b_grant;  
output           piu_snb0_back;     
output  [9  :0]  piu_snb0_cr_bus;   
output           piu_snb0_cr_req;   
output           piu_snb0_r_grant;  
output           piu_snb0_rack;     
output           piu_snb0_wcd_req;  
output           piu_snb1_ac_grant; 
output  [70 :0]  piu_snb1_ar_bus;   
output           piu_snb1_ar_req;   
output           piu_snb1_aw_req;   
output           piu_snb1_b_grant;  
output           piu_snb1_back;     
output  [9  :0]  piu_snb1_cr_bus;   
output           piu_snb1_cr_req;   
output           piu_snb1_r_grant;  
output           piu_snb1_rack;     
output           piu_snb1_wcd_req;  
output  [4  :0]  piu_snbx_back_sid; 
output  [4  :0]  piu_snbx_rack_sid; 
output  [70 :0]  piu_xx_aw_bus;     
output           piu_xx_no_op;      
output  [534:0]  piu_xx_wcd_bus;    

// &Regs; @3
reg              piu_ctcq_cr_req;   
reg     [4  :0]  piu_ctcq_cr_sid;   
reg              piu_snb0_cr_req;   
reg     [4  :0]  piu_snb0_cr_sid;   
reg              piu_snb1_cr_req;   
reg     [4  :0]  piu_snb1_cr_sid;   

// &Wires; @4
wire             ciu_icg_en;        
wire             cpurst_b;          
wire    [54 :0]  ctcq_piu_acbus;    
wire             ctcq_piu_acvalid;  
wire             ctcq_piu_cr_grant; 
wire             forever_cpuclk;    
wire             pad_yy_icg_scan_en; 
wire             piu_bmbif_ctcq_req; 
wire             piu_bmbif_ncq_req; 
wire    [8  :0]  piu_bmbif_req_bus; 
wire             piu_bmbif_snb0_req; 
wire             piu_bmbif_snb1_req; 
wire             piu_ctcq_ac_grant; 
wire    [70 :0]  piu_ctcq_ar_bus;   
wire             piu_ctcq_ar_req;   
wire    [9  :0]  piu_ctcq_cr_bus;   
wire             piu_ctcq_r_grant;  
wire             piu_dummy_clk;     
wire             piu_dummy_clk_en;  
wire    [73 :0]  piu_ncq_ar_bus;    
wire             piu_ncq_ar_req;    
wire    [73 :0]  piu_ncq_aw_bus;    
wire             piu_ncq_aw_req;    
wire             piu_ncq_b_grant;   
wire             piu_ncq_r_grant;   
wire    [143:0]  piu_ncq_wcd_bus;   
wire             piu_ncq_wcd_req;   
wire             piu_snb0_ac_grant; 
wire    [70 :0]  piu_snb0_ar_bus;   
wire             piu_snb0_ar_req;   
wire             piu_snb0_aw_req;   
wire             piu_snb0_b_grant;  
wire             piu_snb0_back;     
wire    [9  :0]  piu_snb0_cr_bus;   
wire             piu_snb0_r_grant;  
wire             piu_snb0_rack;     
wire             piu_snb0_wcd_req;  
wire             piu_snb1_ac_grant; 
wire    [70 :0]  piu_snb1_ar_bus;   
wire             piu_snb1_ar_req;   
wire             piu_snb1_aw_req;   
wire             piu_snb1_b_grant;  
wire             piu_snb1_back;     
wire    [9  :0]  piu_snb1_cr_bus;   
wire             piu_snb1_r_grant;  
wire             piu_snb1_rack;     
wire             piu_snb1_wcd_req;  
wire    [4  :0]  piu_snbx_back_sid; 
wire    [4  :0]  piu_snbx_rack_sid; 
wire    [70 :0]  piu_xx_aw_bus;     
wire             piu_xx_no_op;      
wire    [534:0]  piu_xx_wcd_bus;    
wire    [54 :0]  snb0_piu_acbus;    
wire             snb0_piu_acvalid;  
wire             snb0_piu_cr_grant; 
wire    [54 :0]  snb1_piu_acbus;    
wire             snb1_piu_acvalid;  
wire             snb1_piu_cr_grant; 


parameter ADDRW = `PA_WIDTH;
parameter ARWIDTH_SNB = 71; //30 + ADDRW;
parameter ARWIDTH_NCQ = 74; //21+ ADDRW;
parameter AWWIDTH_SNB = 71; //30 + ADDRW;
parameter AWWIDTH_NCQ = 74; //21+ ADDRW;
parameter WCD_WIDTH = 535;
parameter R_WIDTH   = 149;
parameter AC_WIDTH  = 55;
parameter CRR_WIDTH = 10;
parameter UPKB_WIDTH= 535;
parameter B_WIDTH   = 14;

// &Force("input", "snb0_piu_ar_grant"); @18
// &Force("input", "snb1_piu_ar_grant"); @19
// &Force("input", "ctcq_piu_ar_grant"); @20
// &Force("input", "ncq_piu_ar_grant"); @21
// &Force("input", "ebiu_piu_no_op"); @22

// &Force("input", "snb0_piu_aw_grant"); @24
// &Force("input", "snb1_piu_aw_grant"); @25
// &Force("input", "ncq_piu_aw_grant"); @26
// &Force("input", "snb0_piu_wcd_grant"); @27
// &Force("input", "snb1_piu_wcd_grant"); @28
// &Force("input", "ncq_piu_wcd_grant"); @29

// &Force("input", "snb0_piu_acbus"); @31
// &Force("bus", "snb0_piu_acbus",(AC_WIDTH-1),0); @32
// &Force("input", "snb1_piu_acbus"); @33
// &Force("bus", "snb1_piu_acbus",(AC_WIDTH-1),0); @34
// &Force("input", "ctcq_piu_acbus"); @35
// &Force("bus", "ctcq_piu_acbus",(AC_WIDTH-1),0); @36
// &Force("input","ctcq_piu_ac_verf_bus"); @38
// &Force("bus","ctcq_piu_ac_verf_bus",10,0); @39
// &Force("input","snb0_piu_ac_verf_bus"); @40
// &Force("bus","snb0_piu_ac_verf_bus",10,0); @41
// &Force("input","snb1_piu_ac_verf_bus"); @42
// &Force("bus","snb1_piu_ac_verf_bus",10,0); @43

// &Force("input", "snb0_piu_rvalid"); @46
// &Force("input", "snb1_piu_rvalid"); @47
// &Force("input", "ctcq_piu_rvalid"); @48
// &Force("input", "ncq_piu_rvalid"); @49

// &Force("input", "snb0_piux_rbus"); @51
// &Force("bus", "snb0_piux_rbus",(UPKB_WIDTH-1),0); @52
// &Force("input", "snb1_piux_rbus"); @53
// &Force("bus", "snb1_piux_rbus",(UPKB_WIDTH-1),0); @54
// &Force("input", "ctcq_piux_rbus"); @55
// &Force("bus", "ctcq_piux_rbus",(UPKB_WIDTH-1),0); @56
// &Force("input", "ncq_piux_rbus"); @57
// &Force("bus", "ncq_piux_rbus",(UPKB_WIDTH-1),0); @58

// &Force("input", "snb0_piu_bvalid"); @60
// &Force("input", "snb1_piu_bvalid"); @61
// &Force("input", "ncq_piu_bvalid"); @62
// &Force("input", "snb0_piux_bbus"); @63
// &Force("bus", "snb0_piux_bbus", (B_WIDTH-1),0); @64
// &Force("input", "snb1_piux_bbus"); @65
// &Force("bus", "snb1_piux_bbus", (B_WIDTH-1),0); @66
// &Force("input", "ncq_piu_bbus"); @67
// &Force("bus", "ncq_piu_bbus", (B_WIDTH-1),0); @68

// &Force("input", "snb0_piu_bar_cmplt"); @70
// &Force("input", "snb1_piu_bar_cmplt"); @71
// &Force("input", "ctcq_piu_bar_cmplt"); @72
// &Force("input", "ncq_piu_bar_cmplt"); @73
// &Force("input", "bmbif_piu_ctcq_grant"); @74
// &Force("input", "bmbif_piu_ncq_grant"); @75
// &Force("input", "bmbif_piu_snb0_grant"); @76
// &Force("input", "bmbif_piu_snb1_grant"); @77

assign piu_snb0_ar_req = 1'b0;
assign piu_snb1_ar_req = 1'b0;
assign piu_ctcq_ar_req = 1'b0;
assign piu_ncq_ar_req  = 1'b0;
assign piu_snb0_ar_bus[ARWIDTH_SNB-1:0] = {ARWIDTH_SNB{1'b0}};
assign piu_snb1_ar_bus[ARWIDTH_SNB-1:0] = {ARWIDTH_SNB{1'b0}};
assign piu_ctcq_ar_bus[ARWIDTH_SNB-1:0] = {ARWIDTH_SNB{1'b0}};
assign piu_ncq_ar_bus[ARWIDTH_NCQ-1:0]  = {ARWIDTH_NCQ{1'b0}};

assign piu_snb0_aw_req = 1'b0;
assign piu_snb1_aw_req = 1'b0;
assign piu_ncq_aw_req  = 1'b0;
assign piu_xx_aw_bus[AWWIDTH_SNB-1:0]  = {AWWIDTH_SNB{1'b0}};
assign piu_ncq_aw_bus[AWWIDTH_NCQ-1:0] = {AWWIDTH_NCQ{1'b0}};

assign piu_snb0_wcd_req = 1'b0;
assign piu_snb1_wcd_req = 1'b0;
assign piu_ncq_wcd_req  = 1'b0;
assign piu_xx_wcd_bus[WCD_WIDTH-1:0] = {WCD_WIDTH{1'b0}};
assign piu_ncq_wcd_bus[143:0]        = 144'b0;

assign piu_bmbif_ctcq_req = 1'b0;
assign piu_bmbif_ncq_req  = 1'b0;
assign piu_bmbif_snb0_req = 1'b0;
assign piu_bmbif_snb1_req = 1'b0;
assign piu_bmbif_req_bus[8:0] = 9'b0;

parameter AC_SID_4 = 9;
parameter AC_SID_0 = 5;
parameter CR_WIDTH = 5;

// &Force("output","piu_snb0_ac_grant"); @110
// &Force("output","piu_snb1_ac_grant"); @111
// &Force("output","piu_ctcq_ac_grant"); @112
// &Force("output","piu_snb0_cr_req"); @113
// &Force("output","piu_snb1_cr_req"); @114
// &Force("output","piu_ctcq_cr_req"); @115

assign piu_snb0_ac_grant = snb0_piu_acvalid;
assign piu_snb1_ac_grant = snb1_piu_acvalid;
assign piu_ctcq_ac_grant = ctcq_piu_acvalid;

assign piu_dummy_clk_en = piu_snb0_ac_grant | snb0_piu_cr_grant | 
                          piu_snb1_ac_grant | snb1_piu_cr_grant |
                          piu_ctcq_ac_grant | ctcq_piu_cr_grant;

// &Instance("gated_clk_cell", "x_piu_dummy_gated_clk"); @125
gated_clk_cell  x_piu_dummy_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (piu_dummy_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (piu_dummy_clk_en  ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @126
//          .external_en (1'b0), @127
//          .global_en   (1'b1), @128
//          .module_en (ciu_icg_en       ), @129
//          .local_en    (piu_dummy_clk_en), @130
//          .clk_out     (piu_dummy_clk)); @131

always @(posedge piu_dummy_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    piu_snb0_cr_req <= 1'b0;
    piu_snb0_cr_sid[4:0] <= 5'b0;
  end
  else if(piu_snb0_ac_grant)
  begin
    piu_snb0_cr_req <= 1'b1;
    piu_snb0_cr_sid[4:0] <= snb0_piu_acbus[AC_SID_4:AC_SID_0];
  end
  else if(snb0_piu_cr_grant)
  begin
    piu_snb0_cr_req <= 1'b0;
    piu_snb0_cr_sid[4:0] <= piu_snb1_cr_sid[4:0];
  end
  else
  begin
    piu_snb0_cr_req <= piu_snb0_cr_req;
    piu_snb0_cr_sid[4:0] <= piu_snb0_cr_sid[4:0];
  end
end
assign piu_snb0_cr_bus[CRR_WIDTH-1:0] = {piu_snb0_cr_sid[4:0],{CR_WIDTH{1'b0}}};

always @(posedge piu_dummy_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    piu_snb1_cr_req <= 1'b0;
    piu_snb1_cr_sid[4:0] <= 5'b0;
  end
  else if(piu_snb1_ac_grant)
  begin
    piu_snb1_cr_req <= 1'b1;
    piu_snb1_cr_sid[4:0] <= snb1_piu_acbus[AC_SID_4:AC_SID_0];
  end
  else if(snb1_piu_cr_grant)
  begin
    piu_snb1_cr_req <= 1'b0;
    piu_snb1_cr_sid[4:0] <= piu_snb1_cr_sid[4:0];
  end
  else
  begin
    piu_snb1_cr_req <= piu_snb1_cr_req;
    piu_snb1_cr_sid[4:0] <= piu_snb1_cr_sid[4:0];
  end
end
assign piu_snb1_cr_bus[CRR_WIDTH-1:0] = {piu_snb1_cr_sid[4:0],{CR_WIDTH{1'b0}}};

always @(posedge piu_dummy_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    piu_ctcq_cr_req <= 1'b0;
    piu_ctcq_cr_sid[4:0] <= 5'b0;
  end
  else if(piu_ctcq_ac_grant)
  begin
    piu_ctcq_cr_req <= 1'b1;
    piu_ctcq_cr_sid[4:0] <= ctcq_piu_acbus[AC_SID_4:AC_SID_0];
  end
  else if(ctcq_piu_cr_grant)
  begin
    piu_ctcq_cr_req <= 1'b0;
    piu_ctcq_cr_sid[4:0] <= piu_ctcq_cr_sid[4:0];
  end
  else
  begin
    piu_ctcq_cr_req <= piu_ctcq_cr_req;
    piu_ctcq_cr_sid[4:0] <= piu_ctcq_cr_sid[4:0];
  end
end
assign piu_ctcq_cr_bus[CRR_WIDTH-1:0] = {piu_ctcq_cr_sid[4:0],{CR_WIDTH{1'b0}}};

assign piu_snb0_r_grant  = 1'b0;
assign piu_snb1_r_grant  = 1'b0;
assign piu_ctcq_r_grant  = 1'b0;
assign piu_ncq_r_grant   = 1'b0;
assign piu_snb0_b_grant  = 1'b0;
assign piu_snb1_b_grant  = 1'b0;
assign piu_ncq_b_grant   = 1'b0;

assign piu_snb0_rack   = 1'b0;
assign piu_snb1_rack   = 1'b0;
assign piu_snbx_rack_sid[4:0] = 5'b0;
assign piu_snb0_back   = 1'b0;
assign piu_snb1_back   = 1'b0;
assign piu_snbx_back_sid[4:0] = 5'b0;

assign piu_xx_no_op = 1'b1;

// &ModuleEnd; @225
endmodule


