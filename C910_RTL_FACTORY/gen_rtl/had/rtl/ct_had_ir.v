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
module ct_had_ir(
  common_regs_data,
  core0_regs_serial_data,
  core1_regs_serial_data,
  cpurst_b,
  forever_cpuclk,
  ir_corex_wdata,
  ir_sm_hacr_rw,
  ir_xx_baba_reg_sel,
  ir_xx_babb_reg_sel,
  ir_xx_bama_reg_sel,
  ir_xx_bamb_reg_sel,
  ir_xx_core0_sel,
  ir_xx_core1_sel,
  ir_xx_core2_sel,
  ir_xx_core3_sel,
  ir_xx_csr_reg_sel,
  ir_xx_daddr_reg_sel,
  ir_xx_dbgfifo2_reg_sel,
  ir_xx_dbgfifo_reg_sel,
  ir_xx_ddata_reg_sel,
  ir_xx_dms_reg_sel,
  ir_xx_id_reg_sel,
  ir_xx_mbca_reg_sel,
  ir_xx_mbcb_reg_sel,
  ir_xx_otc_reg_sel,
  ir_xx_pc_reg_sel,
  ir_xx_pcfifo_reg_sel,
  ir_xx_pipefifo_reg_sel,
  ir_xx_rsr_reg_sel,
  ir_xx_wbbr_reg_sel,
  pad_yy_icg_scan_en,
  regs_serial_data,
  serial_xx_data,
  sm_ir_update_hacr,
  sysio_had_dbg_mask
);

// &Ports; @24
input   [63:0]  common_regs_data;      
input   [63:0]  core0_regs_serial_data; 
input   [63:0]  core1_regs_serial_data; 
input           cpurst_b;              
input           forever_cpuclk;        
input           pad_yy_icg_scan_en;    
input   [63:0]  serial_xx_data;        
input           sm_ir_update_hacr;     
input   [3 :0]  sysio_had_dbg_mask;    
output  [63:0]  ir_corex_wdata;        
output          ir_sm_hacr_rw;         
output          ir_xx_baba_reg_sel;    
output          ir_xx_babb_reg_sel;    
output          ir_xx_bama_reg_sel;    
output          ir_xx_bamb_reg_sel;    
output          ir_xx_core0_sel;       
output          ir_xx_core1_sel;       
output          ir_xx_core2_sel;       
output          ir_xx_core3_sel;       
output          ir_xx_csr_reg_sel;     
output          ir_xx_daddr_reg_sel;   
output          ir_xx_dbgfifo2_reg_sel; 
output          ir_xx_dbgfifo_reg_sel; 
output          ir_xx_ddata_reg_sel;   
output          ir_xx_dms_reg_sel;     
output          ir_xx_id_reg_sel;      
output          ir_xx_mbca_reg_sel;    
output          ir_xx_mbcb_reg_sel;    
output          ir_xx_otc_reg_sel;     
output          ir_xx_pc_reg_sel;      
output          ir_xx_pcfifo_reg_sel;  
output          ir_xx_pipefifo_reg_sel; 
output          ir_xx_rsr_reg_sel;     
output          ir_xx_wbbr_reg_sel;    
output  [63:0]  regs_serial_data;      

// &Regs; @25
reg     [15:0]  hacr_reg;              

// &Wires; @26
wire            bank0_sel;             
wire            bank2_sel;             
wire            bank3_sel;             
wire    [63:0]  common_regs_data;      
wire            core0_dbg_disable;     
wire    [63:0]  core0_regs_serial_data; 
wire            core1_dbg_disable;     
wire    [63:0]  core1_regs_serial_data; 
wire            core2_dbg_disable;     
wire            core3_dbg_disable;     
wire            cpurst_b;              
wire            forever_cpuclk;        
wire    [4 :0]  hacr_index;            
wire            ir_clk;                
wire            ir_common_sel;         
wire            ir_core0_priv_sel;     
wire            ir_core0_sel;          
wire            ir_core1_priv_sel;     
wire            ir_core1_sel;          
wire            ir_core2_priv_sel;     
wire            ir_core2_sel;          
wire            ir_core3_priv_sel;     
wire            ir_core3_sel;          
wire    [63:0]  ir_corex_wdata;        
wire            ir_sm_hacr_rw;         
wire            ir_xx_baba_reg_sel;    
wire            ir_xx_babb_reg_sel;    
wire            ir_xx_bama_reg_sel;    
wire            ir_xx_bamb_reg_sel;    
wire            ir_xx_core0_sel;       
wire            ir_xx_core1_sel;       
wire            ir_xx_core2_sel;       
wire            ir_xx_core3_sel;       
wire            ir_xx_csr_reg_sel;     
wire            ir_xx_daddr_reg_sel;   
wire            ir_xx_dbgfifo2_reg_sel; 
wire            ir_xx_dbgfifo_reg_sel; 
wire            ir_xx_ddata_reg_sel;   
wire            ir_xx_dms_reg_sel;     
wire            ir_xx_id_reg_sel;      
wire            ir_xx_mbca_reg_sel;    
wire            ir_xx_mbcb_reg_sel;    
wire            ir_xx_otc_reg_sel;     
wire            ir_xx_pc_reg_sel;      
wire            ir_xx_pcfifo_reg_sel;  
wire            ir_xx_pipefifo_reg_sel; 
wire            ir_xx_rsr_reg_sel;     
wire            ir_xx_wbbr_reg_sel;    
wire            pad_yy_icg_scan_en;    
wire    [63:0]  rdata_0;               
wire    [63:0]  rdata_1;               
wire    [63:0]  rdata_2;               
wire    [63:0]  rdata_3;               
wire    [63:0]  regs_core_serial_data; 
wire    [63:0]  regs_serial_data;      
wire    [63:0]  serial_xx_data;        
wire            sm_ir_update_hacr;     
wire    [3 :0]  sysio_had_dbg_mask;    


// &Instance("gated_clk_cell", "x_had_ir_gated_clk"); @28
gated_clk_cell  x_had_ir_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ir_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sm_ir_update_hacr ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @29
//          .external_en (1'b0), @30
//          .global_en   (1'b1), @31
//          .module_en   (1'b0), @32
//          .local_en    (sm_ir_update_hacr), @33
//          .clk_out     (ir_clk)); @34

//==============================================================================
//  Update HACR
//==============================================================================

always @(posedge ir_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    hacr_reg[15:0] <= 16'h8200; // Async reset to point to HAD_ID
  else if (sm_ir_update_hacr)
    hacr_reg[15:0] <= serial_xx_data[15:0];
  else
    hacr_reg[15:0] <= hacr_reg[15:0];
end

//assign ir_corex_hacr[15:0]  = hacr_reg[15:0];
assign ir_corex_wdata[63:0] = serial_xx_data[63:0];

//==============================================================================
//  HACR commond decode
//==============================================================================

assign ir_sm_hacr_rw     = hacr_reg[15];

assign rdata_0[63:0]     = core0_regs_serial_data[63:0];

assign rdata_1[63:0]     = core1_regs_serial_data[63:0];

assign rdata_2[63:0]     = 64'b0;

assign rdata_3[63:0]     = 64'b0;

assign core0_dbg_disable = 1'b0;
assign core1_dbg_disable = 1'b0;
assign core2_dbg_disable = 1'b0;
assign core3_dbg_disable = 1'b0;

assign ir_core0_sel   = (hacr_reg[1:0] == 2'b00) && !core0_dbg_disable;
assign ir_core1_sel   = (hacr_reg[1:0] == 2'b01) && !core1_dbg_disable;
assign ir_core2_sel   = (hacr_reg[1:0] == 2'b10) && !core2_dbg_disable;
assign ir_core3_sel   = (hacr_reg[1:0] == 2'b11) && !core3_dbg_disable;

assign ir_core0_priv_sel = ir_core0_sel && !sysio_had_dbg_mask[0];
assign ir_core1_priv_sel = ir_core1_sel && !sysio_had_dbg_mask[1];
assign ir_core2_priv_sel = ir_core2_sel && !sysio_had_dbg_mask[2];
assign ir_core3_priv_sel = ir_core3_sel && !sysio_had_dbg_mask[3];

assign regs_core_serial_data[63:0] = {64{ir_core0_priv_sel}} & rdata_0[63:0] | 
                                     {64{ir_core1_priv_sel}} & rdata_1[63:0] | 
                                     {64{ir_core2_priv_sel}} & rdata_2[63:0] | 
                                     {64{ir_core3_priv_sel}} & rdata_3[63:0];

// Bank3 data is in had common top
// Now only dbgfifo2 in bank3.
// Bank3 regs should care dbg disable.

assign ir_common_sel = (bank3_sel || ir_xx_id_reg_sel)
                    && (ir_core0_sel || ir_core1_sel
                     || ir_core2_sel || ir_core3_sel);

assign regs_serial_data[63:0] = ir_common_sel ? common_regs_data[63:0]
                                              : regs_core_serial_data[63:0];


assign bank0_sel         = (hacr_reg[6:4] == 3'd0);
assign bank2_sel         = (hacr_reg[6:4] == 3'd2);
assign bank3_sel         = (hacr_reg[6:4] == 3'd3);
assign hacr_index[4:0]   =  hacr_reg[12:8];

parameter ID_NUM     = 5'd2;
parameter OTC_NUM    = 5'd3;
parameter MBCA_NUM   = 5'd4;
parameter MBCB_NUM   = 5'd5;
parameter PCFIFO_NUM = 5'd6;
parameter BABA_NUM   = 5'd7;
parameter BABB_NUM   = 5'd8;
parameter BAMA_NUM   = 5'd9;
parameter BAMB_NUM   = 5'd10;
parameter WBBR_NUM   = 5'd17;
parameter PC_NUM     = 5'd19;
parameter CSR_NUM    = 5'd21;
parameter DADDR_NUM  = 5'd24;
parameter DDATA_NUM  = 5'd25;

assign ir_xx_id_reg_sel     = bank0_sel && (hacr_index[4:0] == ID_NUM);
assign ir_xx_otc_reg_sel    = bank0_sel && (hacr_index[4:0] == OTC_NUM);
assign ir_xx_mbca_reg_sel   = bank0_sel && (hacr_index[4:0] == MBCA_NUM);
assign ir_xx_mbcb_reg_sel   = bank0_sel && (hacr_index[4:0] == MBCB_NUM);
assign ir_xx_bama_reg_sel   = bank0_sel && (hacr_index[4:0] == BAMA_NUM);
assign ir_xx_bamb_reg_sel   = bank0_sel && (hacr_index[4:0] == BAMB_NUM);

assign ir_xx_csr_reg_sel    = bank0_sel && (hacr_index[4:0] == CSR_NUM);

assign ir_xx_baba_reg_sel   = bank0_sel && (hacr_index[4:0] == BABA_NUM);
assign ir_xx_babb_reg_sel   = bank0_sel && (hacr_index[4:0] == BABB_NUM);
assign ir_xx_wbbr_reg_sel   = bank0_sel && (hacr_index[4:0] == WBBR_NUM);
assign ir_xx_pc_reg_sel     = bank0_sel && (hacr_index[4:0] == PC_NUM);
assign ir_xx_pcfifo_reg_sel = bank0_sel && (hacr_index[4:0] == PCFIFO_NUM);
assign ir_xx_daddr_reg_sel  = bank0_sel && (hacr_index[4:0] == DADDR_NUM);
assign ir_xx_ddata_reg_sel  = bank0_sel && (hacr_index[4:0] == DDATA_NUM);

parameter DBGFIFO_NUM  = 5'd4;
parameter PIPEFIFO_NUM = 5'd5;

assign ir_xx_pipefifo_reg_sel = bank2_sel && (hacr_index[4:0] == PIPEFIFO_NUM);
assign ir_xx_dbgfifo_reg_sel  = bank2_sel && (hacr_index[4:0] == DBGFIFO_NUM);

parameter DBGFIFO2_NUM = 5'd0;
parameter RWR_NUM      = 5'd1;
parameter DMS_NUM      = 5'd2;

assign ir_xx_dbgfifo2_reg_sel = bank3_sel && (hacr_index[4:0] == DBGFIFO2_NUM);
assign ir_xx_rsr_reg_sel      = bank3_sel && (hacr_index[4:0] == RWR_NUM);
assign ir_xx_dms_reg_sel      = bank3_sel && (hacr_index[4:0] == DMS_NUM);

// &Force("output", "ir_xx_id_reg_sel"); @179
// &Force("output", "ir_xx_dbgfifo2_reg_sel"); @180

assign ir_xx_core0_sel = ir_core0_sel;
assign ir_xx_core1_sel = ir_core1_sel;
assign ir_xx_core2_sel = ir_core2_sel;
assign ir_xx_core3_sel = ir_core3_sel;

// &ModuleEnd; @187
endmodule
















