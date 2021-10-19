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
module ct_ebiu_cawt_entry(
  ca_rd_addr_hit_cawt_x,
  ca_wr_addr_hit_cawt_x,
  cawt_create_dp_en_x,
  cawt_create_en_x,
  cawt_ctrl_clk,
  cawt_piu0_sel_x,
  cawt_piu1_sel_x,
  cawt_piu2_sel_x,
  cawt_piu3_sel_x,
  cawt_pop_en_x,
  cawt_vld_x,
  ciu_icg_en,
  cpurst_b,
  ebiuif_ebiu_araddr,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  snb0_snpext_addr_hit_cawt_x,
  snb0_yy_snpext_index,
  snb1_snpext_addr_hit_cawt_x,
  snb1_yy_snpext_index,
  vb_ebiu_awaddr,
  vb_ebiu_mid
);

// &Ports; @25
input           cawt_create_dp_en_x;        
input           cawt_create_en_x;           
input           cawt_ctrl_clk;              
input           cawt_pop_en_x;              
input           ciu_icg_en;                 
input           cpurst_b;                   
input   [39:0]  ebiuif_ebiu_araddr;         
input           forever_cpuclk;             
input           pad_yy_icg_scan_en;         
input   [7 :0]  snb0_yy_snpext_index;       
input   [7 :0]  snb1_yy_snpext_index;       
input   [39:0]  vb_ebiu_awaddr;             
input   [2 :0]  vb_ebiu_mid;                
output          ca_rd_addr_hit_cawt_x;      
output          ca_wr_addr_hit_cawt_x;      
output          cawt_piu0_sel_x;            
output          cawt_piu1_sel_x;            
output          cawt_piu2_sel_x;            
output          cawt_piu3_sel_x;            
output          cawt_vld_x;                 
output          snb0_snpext_addr_hit_cawt_x; 
output          snb1_snpext_addr_hit_cawt_x; 

// &Regs; @26
reg     [7 :0]  cawt_addr;                  
reg     [2 :0]  cawt_mid;                   
reg             cawt_vld;                   

// &Wires; @27
wire            ca_rd_addr_hit_cawt_x;      
wire            ca_wr_addr_hit_cawt_x;      
wire            cawt_clk;                   
wire            cawt_clk_en;                
wire            cawt_create_dp_en_x;        
wire            cawt_create_en_x;           
wire            cawt_ctrl_clk;              
wire    [3 :0]  cawt_mid_sel;               
wire            cawt_piu0_sel_x;            
wire            cawt_piu1_sel_x;            
wire            cawt_piu2_sel_x;            
wire            cawt_piu3_sel_x;            
wire            cawt_pop_en_x;              
wire            cawt_vld_x;                 
wire            ciu_icg_en;                 
wire            cpurst_b;                   
wire    [39:0]  ebiuif_ebiu_araddr;         
wire            forever_cpuclk;             
wire            pad_yy_icg_scan_en;         
wire            snb0_snpext_addr_hit_cawt_x; 
wire    [7 :0]  snb0_yy_snpext_index;       
wire            snb1_snpext_addr_hit_cawt_x; 
wire    [7 :0]  snb1_yy_snpext_index;       
wire    [39:0]  vb_ebiu_awaddr;             
wire    [2 :0]  vb_ebiu_mid;                


parameter ADDRW = `PA_WIDTH;

//======================================
//     CA Write Table CA_WT(WT)
//1. CA_WT : non-cacheable write
//entry content:
//| vld | addr 
//======================================
//CA_WT vld

always @(posedge cawt_ctrl_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cawt_vld   <= 1'b0;
  else if(cawt_create_en_x) 
    cawt_vld <= 1'b1;
  else if(cawt_pop_en_x) 
    cawt_vld <= 1'b0;
end

// &Force("bus","vb_ebiu_awaddr",ADDRW-1,0); @49
// &Force("bus","ebiuif_ebiu_araddr",ADDRW-1,0); @50

always @(posedge cawt_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cawt_addr[7:0] <= 8'b0;
  else if(cawt_create_dp_en_x)
    cawt_addr[7:0] <= vb_ebiu_awaddr[13:6];
  else
    cawt_addr[7:0] <= cawt_addr[7:0];
end

always @(posedge cawt_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cawt_mid[2:0] <= 3'b0;
  else if (cawt_create_dp_en_x)
    cawt_mid[2:0] <= vb_ebiu_mid[2:0];
end

assign cawt_mid_sel[3:0] = (4'b1 << cawt_mid[1:0]) | {4{cawt_mid[2]}};

assign cawt_piu0_sel_x = cawt_mid_sel[0];
assign cawt_piu1_sel_x = cawt_mid_sel[1];
assign cawt_piu2_sel_x = cawt_mid_sel[2];
assign cawt_piu3_sel_x = cawt_mid_sel[3];

assign cawt_vld_x = cawt_vld;

assign ca_rd_addr_hit_cawt_x = cawt_vld && (ebiuif_ebiu_araddr[13:6] == cawt_addr[7:0]);
assign ca_wr_addr_hit_cawt_x = cawt_vld && (vb_ebiu_awaddr[13:6] == cawt_addr[7:0]);
assign snb0_snpext_addr_hit_cawt_x = cawt_vld && (snb0_yy_snpext_index[7:0] == cawt_addr[7:0]);
assign snb1_snpext_addr_hit_cawt_x = cawt_vld && (snb1_yy_snpext_index[7:0] == cawt_addr[7:0]);

// &Instance("gated_clk_cell", "x_ebiu_cawt_addr_gated_clk"); @84
gated_clk_cell  x_ebiu_cawt_addr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cawt_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (cawt_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @85
//          .external_en (1'b0), @86
//          .global_en   (1'b1), @87
//          .module_en   (ciu_icg_en), @88
//          .local_en    (cawt_clk_en), @89
//          .clk_out     (cawt_clk)); @90

assign cawt_clk_en = cawt_create_dp_en_x;

// &ModuleEnd; @94
endmodule


