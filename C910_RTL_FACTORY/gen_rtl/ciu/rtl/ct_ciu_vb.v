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

// &ModuleBeg; @18
module ct_ciu_vb(
  ciu_icg_en,
  cpurst_b,
  ebiu_vb_aw_grant,
  ebiu_vb_aw_grant_gated,
  ebiu_vb_bid,
  ebiu_vb_bresp,
  ebiu_vb_bvalid,
  ebiu_vb_w_grant,
  ebiuif_vb_index,
  forever_cpuclk,
  l2c0_vb_awbus,
  l2c0_vb_awvalid,
  l2c0_vb_mid,
  l2c0_vb_vid,
  l2c0_vb_wbus,
  l2c0_vb_wvalid,
  l2c1_vb_awbus,
  l2c1_vb_awvalid,
  l2c1_vb_mid,
  l2c1_vb_vid,
  l2c1_vb_wbus,
  l2c1_vb_wvalid,
  pad_yy_icg_scan_en,
  snb0_snpext_depd_vb,
  snb0_vb_awbus,
  snb0_vb_awvalid,
  snb0_vb_mid,
  snb0_vb_vid,
  snb0_vb_wbus,
  snb0_vb_wvalid,
  snb0_yy_snpext_index,
  snb1_snpext_depd_vb,
  snb1_vb_awbus,
  snb1_vb_awvalid,
  snb1_vb_mid,
  snb1_vb_vid,
  snb1_vb_wbus,
  snb1_vb_wvalid,
  snb1_yy_snpext_index,
  vb_ebiu_awaddr,
  vb_ebiu_awbar,
  vb_ebiu_awburst,
  vb_ebiu_awcache,
  vb_ebiu_awdomain,
  vb_ebiu_awid,
  vb_ebiu_awlen,
  vb_ebiu_awlock,
  vb_ebiu_awprot,
  vb_ebiu_awsize,
  vb_ebiu_awsnoop,
  vb_ebiu_awvalid,
  vb_ebiu_b_grant,
  vb_ebiu_mid,
  vb_ebiu_wdata,
  vb_ebiu_wid,
  vb_ebiu_wlast,
  vb_ebiu_wstrb,
  vb_ebiu_wvalid,
  vb_ebiuif_addr_depd,
  vb_l2c0_vctm_grant,
  vb_l2c1_vctm_grant,
  vb_snb0_aw_grant,
  vb_snb0_w_grant,
  vb_snb1_aw_grant,
  vb_snb1_w_grant,
  vb_xx_no_op,
  vb_yy_grant_id
);

// &Ports; @19
input            ciu_icg_en;            
input            cpurst_b;              
input            ebiu_vb_aw_grant;      
input            ebiu_vb_aw_grant_gated; 
input   [4  :0]  ebiu_vb_bid;           
input   [1  :0]  ebiu_vb_bresp;         
input            ebiu_vb_bvalid;        
input            ebiu_vb_w_grant;       
input   [7  :0]  ebiuif_vb_index;       
input            forever_cpuclk;        
input   [67 :0]  l2c0_vb_awbus;         
input            l2c0_vb_awvalid;       
input   [2  :0]  l2c0_vb_mid;           
input   [1  :0]  l2c0_vb_vid;           
input   [534:0]  l2c0_vb_wbus;          
input            l2c0_vb_wvalid;        
input   [67 :0]  l2c1_vb_awbus;         
input            l2c1_vb_awvalid;       
input   [2  :0]  l2c1_vb_mid;           
input   [1  :0]  l2c1_vb_vid;           
input   [534:0]  l2c1_vb_wbus;          
input            l2c1_vb_wvalid;        
input            pad_yy_icg_scan_en;    
input   [67 :0]  snb0_vb_awbus;         
input            snb0_vb_awvalid;       
input   [2  :0]  snb0_vb_mid;           
input   [1  :0]  snb0_vb_vid;           
input   [534:0]  snb0_vb_wbus;          
input            snb0_vb_wvalid;        
input   [7  :0]  snb0_yy_snpext_index;  
input   [67 :0]  snb1_vb_awbus;         
input            snb1_vb_awvalid;       
input   [2  :0]  snb1_vb_mid;           
input   [1  :0]  snb1_vb_vid;           
input   [534:0]  snb1_vb_wbus;          
input            snb1_vb_wvalid;        
input   [7  :0]  snb1_yy_snpext_index;  
output           snb0_snpext_depd_vb;   
output           snb1_snpext_depd_vb;   
output  [39 :0]  vb_ebiu_awaddr;        
output  [1  :0]  vb_ebiu_awbar;         
output  [1  :0]  vb_ebiu_awburst;       
output  [3  :0]  vb_ebiu_awcache;       
output  [1  :0]  vb_ebiu_awdomain;      
output  [5  :0]  vb_ebiu_awid;          
output  [7  :0]  vb_ebiu_awlen;         
output           vb_ebiu_awlock;        
output  [2  :0]  vb_ebiu_awprot;        
output  [2  :0]  vb_ebiu_awsize;        
output  [2  :0]  vb_ebiu_awsnoop;       
output           vb_ebiu_awvalid;       
output           vb_ebiu_b_grant;       
output  [2  :0]  vb_ebiu_mid;           
output  [127:0]  vb_ebiu_wdata;         
output  [5  :0]  vb_ebiu_wid;           
output           vb_ebiu_wlast;         
output  [15 :0]  vb_ebiu_wstrb;         
output           vb_ebiu_wvalid;        
output           vb_ebiuif_addr_depd;   
output           vb_l2c0_vctm_grant;    
output           vb_l2c1_vctm_grant;    
output           vb_snb0_aw_grant;      
output           vb_snb0_w_grant;       
output           vb_snb1_aw_grant;      
output           vb_snb1_w_grant;       
output           vb_xx_no_op;           
output  [1  :0]  vb_yy_grant_id;        

// &Regs; @20
reg     [1  :0]  vb_aw_create_ptr;      
reg     [1  :0]  vb_aw_req_ptr;         
reg     [1  :0]  vb_w_pop_ptr;          
reg     [1  :0]  wdata_cnt;             

// &Wires; @21
wire             ciu_icg_en;            
wire             cpurst_b;              
wire             ebiu_vb_aw_grant;      
wire             ebiu_vb_aw_grant_gated; 
wire             ebiu_vb_w_grant;       
wire             ebiu_wlast;            
wire    [7  :0]  ebiuif_vb_index;       
wire             forever_cpuclk;        
wire    [67 :0]  l2c0_vb_awbus;         
wire             l2c0_vb_awvalid;       
wire    [2  :0]  l2c0_vb_mid;           
wire    [1  :0]  l2c0_vb_vid;           
wire    [534:0]  l2c0_vb_wbus;          
wire             l2c0_vb_wvalid;        
wire    [1  :0]  l2c0_wvalid;           
wire    [67 :0]  l2c1_vb_awbus;         
wire             l2c1_vb_awvalid;       
wire    [2  :0]  l2c1_vb_mid;           
wire    [1  :0]  l2c1_vb_vid;           
wire    [534:0]  l2c1_vb_wbus;          
wire             l2c1_vb_wvalid;        
wire    [1  :0]  l2c1_wvalid;           
wire             pad_yy_icg_scan_en;    
wire    [1  :0]  snb0_snpext_addr_hit;  
wire             snb0_snpext_depd_vb;   
wire    [67 :0]  snb0_vb_awbus;         
wire             snb0_vb_awvalid;       
wire    [2  :0]  snb0_vb_mid;           
wire    [1  :0]  snb0_vb_vid;           
wire    [534:0]  snb0_vb_wbus;          
wire             snb0_vb_wvalid;        
wire    [1  :0]  snb0_wvalid;           
wire    [7  :0]  snb0_yy_snpext_index;  
wire    [1  :0]  snb1_snpext_addr_hit;  
wire             snb1_snpext_depd_vb;   
wire    [67 :0]  snb1_vb_awbus;         
wire             snb1_vb_awvalid;       
wire    [2  :0]  snb1_vb_mid;           
wire    [1  :0]  snb1_vb_vid;           
wire    [534:0]  snb1_vb_wbus;          
wire             snb1_vb_wvalid;        
wire    [1  :0]  snb1_wvalid;           
wire    [7  :0]  snb1_yy_snpext_index;  
wire    [67 :0]  vb_aw_create_bus;      
wire             vb_aw_create_en;       
wire    [2  :0]  vb_aw_create_mid;      
wire    [1  :0]  vb_aw_create_sel;      
wire    [1  :0]  vb_aw_en;              
wire             vb_aw_full;            
wire    [3  :0]  vb_aw_req;             
wire    [67 :0]  vb_aw_req_bus;         
wire             vb_aw_req_en;          
wire    [2  :0]  vb_aw_req_mid;         
wire    [1  :0]  vb_aw_req_sel;         
wire             vb_aw_req_vld;         
wire    [3  :0]  vb_aw_sel;             
wire    [1  :0]  vb_aw_vld;             
wire             vb_awdp_clk;           
wire             vb_ctrl_clk;           
wire             vb_ctrl_clk_en;        
wire    [39 :0]  vb_ebiu_awaddr;        
wire    [1  :0]  vb_ebiu_awbar;         
wire    [1  :0]  vb_ebiu_awburst;       
wire    [3  :0]  vb_ebiu_awcache;       
wire    [1  :0]  vb_ebiu_awdomain;      
wire    [5  :0]  vb_ebiu_awid;          
wire    [7  :0]  vb_ebiu_awlen;         
wire             vb_ebiu_awlock;        
wire    [2  :0]  vb_ebiu_awprot;        
wire    [2  :0]  vb_ebiu_awsize;        
wire    [2  :0]  vb_ebiu_awsnoop;       
wire             vb_ebiu_awvalid;       
wire             vb_ebiu_b_grant;       
wire    [2  :0]  vb_ebiu_mid;           
wire    [127:0]  vb_ebiu_wdata;         
wire    [5  :0]  vb_ebiu_wid;           
wire             vb_ebiu_wlast;         
wire    [15 :0]  vb_ebiu_wstrb;         
wire             vb_ebiu_wvalid;        
wire             vb_ebiuif_addr_depd;   
wire    [67 :0]  vb_entry0_awbus;       
wire    [2  :0]  vb_entry0_mid;         
wire    [1  :0]  vb_entry0_offset;      
wire    [534:0]  vb_entry0_wbus;        
wire    [67 :0]  vb_entry1_awbus;       
wire    [2  :0]  vb_entry1_mid;         
wire    [1  :0]  vb_entry1_offset;      
wire    [534:0]  vb_entry1_wbus;        
wire             vb_l2c0_vctm_grant;    
wire             vb_l2c1_vctm_grant;    
wire             vb_snb0_aw_grant;      
wire             vb_snb0_w_grant;       
wire             vb_snb1_aw_grant;      
wire             vb_snb1_w_grant;       
wire    [1  :0]  vb_snb_addr_hit;       
wire    [534:0]  vb_w_pop_bus;          
wire             vb_w_pop_bus_vld;      
wire             vb_w_pop_en;           
wire    [1  :0]  vb_w_pop_offset;       
wire    [1  :0]  vb_w_pop_sel;          
wire    [1  :0]  vb_w_vld;              
wire             vb_wvalid;             
wire             vb_xx_no_op;           
wire    [1  :0]  vb_yy_grant_id;        
wire    [1  :0]  wdata_sel;             


parameter ADDRW      = `PA_WIDTH;
//==========================================================
//                   VB AW channel
//==========================================================
parameter AW_WIDTH = 68;
parameter ADDR_0   = 0;
parameter ADDR_H   = 39;
parameter SIZE_0   = 40;
parameter SIZE_2   = 42;
parameter PROT_0   = 43;
parameter PROT_2   = 45;
parameter LOCK     = 46;
parameter LEN_0    = 47;
parameter LEN_1    = 48;
parameter CACHE_0  = 49;
parameter CACHE_3  = 52;
parameter BURST_0  = 53;
parameter BURST_1  = 54;
parameter DOMAIN_0 = 55;
parameter DOMAIN_1 = 56;
parameter BAR_0    = 57;
parameter BAR_1    = 58;
parameter AWID_0   = 59;
parameter AWID_3   = 62;
parameter AWID_4   = 63;
parameter AWID_5   = 64;
parameter SNOOP_0  = 65;
parameter SNOOP_2  = 67;

assign snb0_snpext_depd_vb = | snb0_snpext_addr_hit[1:0];
assign snb1_snpext_depd_vb = | snb1_snpext_addr_hit[1:0];

//================================================
//      request arbiteration
//================================================
// &Force("nonport","vb_aw_sel"); @58
// &Force("nonport","vb_awdp_clk"); @59

assign vb_aw_req[3:0] = {l2c1_vb_awvalid,
                         l2c0_vb_awvalid,
                         snb1_vb_awvalid,
                         snb0_vb_awvalid};

ct_prio #(.NUM(4)) x_ct_ciu_vb_aw_prio(
  .rst_b           (cpurst_b          ),
  .clk             (vb_awdp_clk       ),
  .valid           (vb_aw_req         ),
  .clr             (vb_aw_create_en   ),
  .sel             (vb_aw_sel         )
); 

assign vb_snb0_aw_grant   = vb_aw_create_en && vb_aw_sel[0];
assign vb_snb1_aw_grant   = vb_aw_create_en && vb_aw_sel[1];
assign vb_l2c0_vctm_grant = vb_aw_create_en && vb_aw_sel[2];
assign vb_l2c1_vctm_grant = vb_aw_create_en && vb_aw_sel[3];
assign vb_yy_grant_id[1:0] = vb_aw_create_ptr[1:0];

assign vb_aw_create_en = |vb_aw_req[3:0] && 
                         !vb_aw_full;

assign vb_aw_create_bus[AW_WIDTH-1:0] = 
             {AW_WIDTH{vb_aw_sel[3]}} & l2c1_vb_awbus[AW_WIDTH-1:0] |
             {AW_WIDTH{vb_aw_sel[2]}} & l2c0_vb_awbus[AW_WIDTH-1:0] |
             {AW_WIDTH{vb_aw_sel[1]}} & snb1_vb_awbus[AW_WIDTH-1:0] |
             {AW_WIDTH{vb_aw_sel[0]}} & snb0_vb_awbus[AW_WIDTH-1:0];
assign vb_aw_create_mid[2:0] =
             {3{vb_aw_sel[3]}} & l2c1_vb_mid[2:0] |
             {3{vb_aw_sel[2]}} & l2c0_vb_mid[2:0] |
             {3{vb_aw_sel[1]}} & snb1_vb_mid[2:0] |
             {3{vb_aw_sel[0]}} & snb0_vb_mid[2:0];

always@(posedge vb_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_aw_create_ptr[1:0] <= 2'b1;
  else if (vb_aw_create_en)
    vb_aw_create_ptr[1:0] <= {vb_aw_create_ptr[0],vb_aw_create_ptr[1]};
end
assign vb_aw_create_sel[1:0] = {2{vb_aw_create_en}} & vb_aw_create_ptr[1:0];

always@(posedge vb_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_aw_req_ptr[1:0] <= 2'b1;
  else if (ebiu_vb_aw_grant)
    vb_aw_req_ptr[1:0] <= {vb_aw_req_ptr[0], vb_aw_req_ptr[1]};
end
assign vb_aw_req_sel[1:0] = {2{ebiu_vb_aw_grant}} & vb_aw_req_ptr[1:0];

//pop_ptr
assign vb_w_pop_en = ebiu_vb_w_grant & vb_ebiu_wlast;
always@(posedge vb_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_w_pop_ptr[1:0] <= 2'b1;
  else if (vb_w_pop_en)
    vb_w_pop_ptr[1:0] <= {vb_w_pop_ptr[0], vb_w_pop_ptr[1]};
end
assign vb_w_pop_sel[1:0] = {2{vb_w_pop_en}} & vb_w_pop_ptr[1:0];



// &ConnRule(s/entryx_/entry0_/); @132
// &ConnRule(s/_x$/[0]/); @133
// &Instance("ct_ciu_vb_aw_entry","x_ct_vb_aw_entry_0"); @134
ct_ciu_vb_aw_entry  x_ct_vb_aw_entry_0 (
  .ciu_icg_en              (ciu_icg_en             ),
  .cpurst_b                (cpurst_b               ),
  .ebiuif_vb_index         (ebiuif_vb_index        ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l2c0_vb_wbus            (l2c0_vb_wbus           ),
  .l2c0_wvalid_x           (l2c0_wvalid[0]         ),
  .l2c1_vb_wbus            (l2c1_vb_wbus           ),
  .l2c1_wvalid_x           (l2c1_wvalid[0]         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .snb0_snpext_addr_hit_x  (snb0_snpext_addr_hit[0]),
  .snb0_vb_wbus            (snb0_vb_wbus           ),
  .snb0_wvalid_x           (snb0_wvalid[0]         ),
  .snb0_yy_snpext_index    (snb0_yy_snpext_index   ),
  .snb1_snpext_addr_hit_x  (snb1_snpext_addr_hit[0]),
  .snb1_vb_wbus            (snb1_vb_wbus           ),
  .snb1_wvalid_x           (snb1_wvalid[0]         ),
  .snb1_yy_snpext_index    (snb1_yy_snpext_index   ),
  .vb_aw_create_bus        (vb_aw_create_bus       ),
  .vb_aw_create_mid        (vb_aw_create_mid       ),
  .vb_aw_create_sel_x      (vb_aw_create_sel[0]    ),
  .vb_aw_en_x              (vb_aw_en[0]            ),
  .vb_aw_req_sel_x         (vb_aw_req_sel[0]       ),
  .vb_aw_vld_x             (vb_aw_vld[0]           ),
  .vb_ctrl_clk             (vb_ctrl_clk            ),
  .vb_entryx_awbus         (vb_entry0_awbus        ),
  .vb_entryx_mid           (vb_entry0_mid          ),
  .vb_entryx_offset        (vb_entry0_offset       ),
  .vb_entryx_wbus          (vb_entry0_wbus         ),
  .vb_snb_addr_hit_x       (vb_snb_addr_hit[0]     ),
  .vb_w_pop_sel_x          (vb_w_pop_sel[0]        ),
  .vb_w_vld_x              (vb_w_vld[0]            )
);


// &ConnRule(s/entryx_/entry1_/); @136
// &ConnRule(s/_x$/[1]/); @137
// &Instance("ct_ciu_vb_aw_entry","x_ct_vb_aw_entry_1"); @138
ct_ciu_vb_aw_entry  x_ct_vb_aw_entry_1 (
  .ciu_icg_en              (ciu_icg_en             ),
  .cpurst_b                (cpurst_b               ),
  .ebiuif_vb_index         (ebiuif_vb_index        ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l2c0_vb_wbus            (l2c0_vb_wbus           ),
  .l2c0_wvalid_x           (l2c0_wvalid[1]         ),
  .l2c1_vb_wbus            (l2c1_vb_wbus           ),
  .l2c1_wvalid_x           (l2c1_wvalid[1]         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .snb0_snpext_addr_hit_x  (snb0_snpext_addr_hit[1]),
  .snb0_vb_wbus            (snb0_vb_wbus           ),
  .snb0_wvalid_x           (snb0_wvalid[1]         ),
  .snb0_yy_snpext_index    (snb0_yy_snpext_index   ),
  .snb1_snpext_addr_hit_x  (snb1_snpext_addr_hit[1]),
  .snb1_vb_wbus            (snb1_vb_wbus           ),
  .snb1_wvalid_x           (snb1_wvalid[1]         ),
  .snb1_yy_snpext_index    (snb1_yy_snpext_index   ),
  .vb_aw_create_bus        (vb_aw_create_bus       ),
  .vb_aw_create_mid        (vb_aw_create_mid       ),
  .vb_aw_create_sel_x      (vb_aw_create_sel[1]    ),
  .vb_aw_en_x              (vb_aw_en[1]            ),
  .vb_aw_req_sel_x         (vb_aw_req_sel[1]       ),
  .vb_aw_vld_x             (vb_aw_vld[1]           ),
  .vb_ctrl_clk             (vb_ctrl_clk            ),
  .vb_entryx_awbus         (vb_entry1_awbus        ),
  .vb_entryx_mid           (vb_entry1_mid          ),
  .vb_entryx_offset        (vb_entry1_offset       ),
  .vb_entryx_wbus          (vb_entry1_wbus         ),
  .vb_snb_addr_hit_x       (vb_snb_addr_hit[1]     ),
  .vb_w_pop_sel_x          (vb_w_pop_sel[1]        ),
  .vb_w_vld_x              (vb_w_vld[1]            )
);


// //&ConnRule(s/entryx_/entry2_/); @140
// //&ConnRule(s/_x$/[2]/); @141
//&Instance("ct_ciu_vb_aw_entry","x_ct_vb_aw_entry_2");
//
// //&ConnRule(s/entryx_/entry3_/); @144
// //&ConnRule(s/_x$/[3]/); @145
//&Instance("ct_ciu_vb_aw_entry","x_ct_vb_aw_entry_3");

assign vb_aw_full    = |(vb_aw_create_ptr[1:0] & vb_aw_vld[1:0]);
assign vb_xx_no_op   = !(|vb_aw_vld[1:0]);

assign vb_aw_req_vld = |(vb_aw_req_ptr[1:0] & vb_aw_vld[1:0]);
assign vb_aw_req_en  = |(vb_aw_req_ptr[1:0] & vb_aw_en[1:0]);
assign vb_aw_req_bus[AW_WIDTH-1:0] = {AW_WIDTH{vb_aw_req_ptr[0]}} & vb_entry0_awbus[AW_WIDTH-1:0] |
                                     {AW_WIDTH{vb_aw_req_ptr[1]}} & vb_entry1_awbus[AW_WIDTH-1:0];
assign vb_aw_req_mid[2:0] = {3{vb_aw_req_ptr[0]}} & vb_entry0_mid[2:0] |
                            {3{vb_aw_req_ptr[1]}} & vb_entry1_mid[2:0];

assign vb_ebiu_awvalid           = vb_aw_req_vld & vb_aw_req_en;
assign vb_ebiu_awid[5:0]         = vb_aw_req_bus[AWID_5:AWID_0];
assign vb_ebiu_awburst[1:0]      = vb_aw_req_bus[BURST_1:BURST_0];
assign vb_ebiu_awsize[2:0]       = vb_aw_req_bus[SIZE_2:SIZE_0];
assign vb_ebiu_awlock            = vb_aw_req_bus[LOCK];
assign vb_ebiu_awcache[3:0]      = vb_aw_req_bus[CACHE_3:CACHE_0];
assign vb_ebiu_awprot[2:0]       = vb_aw_req_bus[PROT_2:PROT_0];
assign vb_ebiu_awlen[7:0]        = {6'b0,vb_aw_req_bus[LEN_1:LEN_0]};
assign vb_ebiu_awsnoop[2:0]      = vb_aw_req_bus[SNOOP_2:SNOOP_0];
assign vb_ebiu_awdomain[1:0]     = vb_aw_req_bus[DOMAIN_1:DOMAIN_0];
assign vb_ebiu_awbar[1:0]        = vb_aw_req_bus[BAR_1:BAR_0];
assign vb_ebiu_awaddr[ADDRW-1:0] = vb_aw_req_bus[ADDR_H:ADDR_0];
assign vb_ebiu_mid[2:0]          = vb_aw_req_mid[2:0];


//==========================================================
//            VB W channel
//==========================================================
parameter WWIDTH  = 535;
parameter WSTRB_0 = 512;
parameter WSTRB_H = 527;
parameter WID_0   = 528;
parameter WID_5   = 533;
parameter INCR1   = 534;

assign vb_snb1_w_grant = snb1_vb_wvalid;
assign vb_snb0_w_grant = snb0_vb_wvalid;

assign l2c0_wvalid[1:0] = {2{l2c0_vb_wvalid}} & l2c0_vb_vid[1:0];
assign l2c1_wvalid[1:0] = {2{l2c1_vb_wvalid}} & l2c1_vb_vid[1:0];
assign snb0_wvalid[1:0] = {2{snb0_vb_wvalid}} & snb0_vb_vid[1:0];
assign snb1_wvalid[1:0] = {2{snb1_vb_wvalid}} & snb1_vb_vid[1:0];

assign vb_wvalid = l2c0_vb_wvalid | l2c1_vb_wvalid | snb0_vb_wvalid | snb1_vb_wvalid;

assign vb_w_pop_bus_vld = |(vb_w_pop_ptr[1:0] & vb_w_vld[1:0]);

assign vb_w_pop_bus[WWIDTH-1:0] = {WWIDTH{vb_w_pop_ptr[0]}} & vb_entry0_wbus[WWIDTH-1:0] |
                                  {WWIDTH{vb_w_pop_ptr[1]}} & vb_entry1_wbus[WWIDTH-1:0];

assign vb_w_pop_offset[1:0] = {2{vb_w_pop_ptr[0]}} & vb_entry0_offset[1:0] |
                              {2{vb_w_pop_ptr[1]}} & vb_entry1_offset[1:0];

assign vb_ebiu_wvalid       = vb_w_pop_bus_vld;
assign vb_ebiu_wid[5:0]     = vb_w_pop_bus[WID_5:WID_0];
assign vb_ebiu_wstrb[15:0]  = vb_w_pop_bus[WSTRB_H:WSTRB_0];
assign vb_ebiu_wdata[127:0] = wdata_sel[1] ? (wdata_sel[0] ? vb_w_pop_bus[511:384]
                                                           : vb_w_pop_bus[383:256])
                                           : (wdata_sel[0] ? vb_w_pop_bus[255:128]
                                                           : vb_w_pop_bus[127:0]);

always@(posedge vb_ctrl_clk or negedge cpurst_b)
begin
  if (~cpurst_b)
    wdata_cnt[1:0] <= 2'b0;
  else if (ebiu_vb_w_grant && !vb_w_pop_bus[INCR1])
    wdata_cnt[1:0] <= wdata_cnt[1:0] + 2'b1;
  else 
    wdata_cnt[1:0] <= wdata_cnt[1:0];
end

assign wdata_sel[1:0] = vb_w_pop_bus[INCR1] ? vb_w_pop_offset[1:0] : wdata_cnt[1:0];

assign ebiu_wlast = vb_w_pop_bus[INCR1] ? 1'b1 : (wdata_cnt[1:0] == 2'b11);
assign vb_ebiu_wlast = vb_w_pop_bus_vld && ebiu_wlast;

// &Force("output","vb_ebiu_wlast"); @228
// &Force("input", "ebiu_vb_bvalid"); @229
// &Force("input", "ebiu_vb_bid"); @230
// &Force("bus",   "ebiu_vb_bid", 4,0); @231
// &Force("input", "ebiu_vb_bresp"); @232
// &Force("bus",   "ebiu_vb_bresp", 1,0); @233

assign vb_ebiu_b_grant = 1'b1;
//assign vb_ebiuif_snb0_depd = |vb_snb0_addr_hit[1:0];
//assign vb_ebiuif_snb1_depd = |vb_snb1_addr_hit[1:0];
assign vb_ebiuif_addr_depd = |vb_snb_addr_hit[1:0];

//================================================
//   gated clock
//================================================
// &Instance("gated_clk_cell", "x_vb_awdp_gated_clk"); @247
gated_clk_cell  x_vb_awdp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_awdp_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_aw_create_en   ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @248
//          .external_en (1'b0), @249
//          .global_en   (1'b1), @250
//          .module_en (ciu_icg_en       ), @251
//          .local_en    (vb_aw_create_en), @252
//          .clk_out     (vb_awdp_clk)); @253

assign vb_ctrl_clk_en = vb_aw_create_en || ebiu_vb_aw_grant_gated || ebiu_vb_w_grant || vb_wvalid;
// &Instance("gated_clk_cell", "x_vb_ctrl_gated_clk"); @256
gated_clk_cell  x_vb_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_ctrl_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_ctrl_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @257
//          .external_en (1'b0), @258
//          .global_en   (1'b1), @259
//          .module_en (ciu_icg_en       ), @260
//          .local_en    (vb_ctrl_clk_en), @261
//          .clk_out     (vb_ctrl_clk)); @262


// &ModuleEnd; @265
endmodule



