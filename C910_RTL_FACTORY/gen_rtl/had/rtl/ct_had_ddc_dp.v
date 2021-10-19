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
module ct_had_ddc_dp(
  cpuclk,
  ddc_ctrl_dp_addr_gen,
  ddc_ctrl_dp_addr_sel,
  ddc_ctrl_dp_data_sel,
  ddc_regs_daddr,
  ddc_regs_ddata,
  ddc_regs_ffy,
  ddc_regs_ir,
  ddc_regs_wbbr,
  ir_xx_daddr_reg_sel,
  ir_xx_ddata_reg_sel,
  ir_xx_wdata,
  x_sm_xx_update_dr_en
);

// &Ports; @24
input           cpuclk;              
input           ddc_ctrl_dp_addr_gen; 
input           ddc_ctrl_dp_addr_sel; 
input           ddc_ctrl_dp_data_sel; 
input           ir_xx_daddr_reg_sel; 
input           ir_xx_ddata_reg_sel; 
input   [63:0]  ir_xx_wdata;         
input           x_sm_xx_update_dr_en; 
output  [63:0]  ddc_regs_daddr;      
output  [63:0]  ddc_regs_ddata;      
output          ddc_regs_ffy;        
output  [31:0]  ddc_regs_ir;         
output  [63:0]  ddc_regs_wbbr;       

// &Regs; @25
reg     [63:0]  daddr_reg;           
reg     [63:0]  ddata_reg;           

// &Wires; @26
wire            cpuclk;              
wire            ddc_ctrl_dp_addr_gen; 
wire            ddc_ctrl_dp_addr_sel; 
wire            ddc_ctrl_dp_data_sel; 
wire    [63:0]  ddc_regs_daddr;      
wire    [63:0]  ddc_regs_ddata;      
wire            ddc_regs_ffy;        
wire    [31:0]  ddc_regs_ir;         
wire    [63:0]  ddc_regs_wbbr;       
wire            ir_xx_daddr_reg_sel; 
wire            ir_xx_ddata_reg_sel; 
wire    [63:0]  ir_xx_wdata;         
wire            x_sm_xx_update_dr_en; 


//==============================================================================
//                      DADDR and DDATA implementation 
//==============================================================================
parameter DATAW = 64;
parameter ADDRW = `PA_WIDTH;

// &Force("bus", "ir_xx_wdata", 63,0); @34

// load data into DDC data reg from scan chain
always @(posedge cpuclk)
begin
  if (x_sm_xx_update_dr_en && ir_xx_ddata_reg_sel)
    ddata_reg[DATAW-1:0] <= ir_xx_wdata[DATAW-1:0];
  else
    ddata_reg[DATAW-1:0] <= ddata_reg[DATAW-1:0];
end

assign ddc_regs_ddata[DATAW-1:0] = ddata_reg[DATAW-1:0];

// load address into DDC addr reg from scan chain
always @(posedge cpuclk)
begin
  if (x_sm_xx_update_dr_en && ir_xx_daddr_reg_sel)
    daddr_reg[DATAW-1:0] <= ir_xx_wdata[DATAW-1:0];
  else if (ddc_ctrl_dp_addr_gen)
    daddr_reg[DATAW-1:0] <= daddr_reg[DATAW-1:0] + 64'b1000;
  else
    daddr_reg[DATAW-1:0] <= daddr_reg[DATAW-1:0];
end

assign ddc_regs_daddr[DATAW-1:0] = daddr_reg[DATAW-1:0];

// address or data sent to wbbr
assign ddc_regs_wbbr[63:0] = ddc_ctrl_dp_addr_sel ? {24'b0,daddr_reg[ADDRW-1:0]}
                                                  : ddata_reg[DATAW-1:0];

// inst sent to ir
assign ddc_regs_ir[31:0] = ddc_ctrl_dp_addr_sel
                         ? 32'h00008093                         // mv x1, x1
                         : ddc_ctrl_dp_data_sel ? 32'h00010113  // mv x2, x2
                                                : 32'h0020b023; // sd x2, 0 (x1)
// set ffy bit to CSR 
assign ddc_regs_ffy = (ddc_ctrl_dp_addr_sel || ddc_ctrl_dp_data_sel);


// &ModuleEnd; @73
endmodule



