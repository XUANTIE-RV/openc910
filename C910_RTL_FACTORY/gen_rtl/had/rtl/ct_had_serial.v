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
module ct_had_serial(
  io_serial_tdi,
  ir_xx_baba_reg_sel,
  ir_xx_babb_reg_sel,
  ir_xx_bama_reg_sel,
  ir_xx_bamb_reg_sel,
  ir_xx_csr_reg_sel,
  ir_xx_daddr_reg_sel,
  ir_xx_dbgfifo2_reg_sel,
  ir_xx_dbgfifo_reg_sel,
  ir_xx_ddata_reg_sel,
  ir_xx_mbca_reg_sel,
  ir_xx_mbcb_reg_sel,
  ir_xx_otc_reg_sel,
  ir_xx_pc_reg_sel,
  ir_xx_pcfifo_reg_sel,
  ir_xx_pipefifo_reg_sel,
  ir_xx_wbbr_reg_sel,
  regs_serial_data,
  serial_io_tdo,
  serial_xx_data,
  sm_serial_capture_dr,
  sm_serial_shift_dr,
  sm_serial_shift_ir,
  sm_xx_write_en,
  tclk,
  trst_b
);

// &Ports; @24
input           io_serial_tdi;         
input           ir_xx_baba_reg_sel;    
input           ir_xx_babb_reg_sel;    
input           ir_xx_bama_reg_sel;    
input           ir_xx_bamb_reg_sel;    
input           ir_xx_csr_reg_sel;     
input           ir_xx_daddr_reg_sel;   
input           ir_xx_dbgfifo2_reg_sel; 
input           ir_xx_dbgfifo_reg_sel; 
input           ir_xx_ddata_reg_sel;   
input           ir_xx_mbca_reg_sel;    
input           ir_xx_mbcb_reg_sel;    
input           ir_xx_otc_reg_sel;     
input           ir_xx_pc_reg_sel;      
input           ir_xx_pcfifo_reg_sel;  
input           ir_xx_pipefifo_reg_sel; 
input           ir_xx_wbbr_reg_sel;    
input   [63:0]  regs_serial_data;      
input           sm_serial_capture_dr;  
input           sm_serial_shift_dr;    
input           sm_serial_shift_ir;    
input           sm_xx_write_en;        
input           tclk;                  
input           trst_b;                
output          serial_io_tdo;         
output  [63:0]  serial_xx_data;        

// &Regs; @25
reg             parity;                
reg     [63:0]  serial_shifter;        
reg     [63:0]  serial_shifter_pre;    
reg             tdo;                   

// &Wires; @26
wire            io_serial_tdi;         
wire            ir_xx_baba_reg_sel;    
wire            ir_xx_babb_reg_sel;    
wire            ir_xx_bama_reg_sel;    
wire            ir_xx_bamb_reg_sel;    
wire            ir_xx_csr_reg_sel;     
wire            ir_xx_daddr_reg_sel;   
wire            ir_xx_dbgfifo2_reg_sel; 
wire            ir_xx_dbgfifo_reg_sel; 
wire            ir_xx_ddata_reg_sel;   
wire            ir_xx_mbca_reg_sel;    
wire            ir_xx_mbcb_reg_sel;    
wire            ir_xx_otc_reg_sel;     
wire            ir_xx_pc_reg_sel;      
wire            ir_xx_pcfifo_reg_sel;  
wire            ir_xx_pipefifo_reg_sel; 
wire            ir_xx_wbbr_reg_sel;    
wire    [63:0]  regs_serial_data;      
wire            serial_io_tdo;         
wire            serial_shifter_16_sel; 
wire            serial_shifter_32_sel; 
wire            serial_shifter_64_sel; 
wire            serial_shifter_8_sel;  
wire    [63:0]  serial_shifter_dr_pre; 
wire    [63:0]  serial_xx_data;        
wire            sm_serial_capture_dr;  
wire            sm_serial_shift_dr;    
wire            sm_serial_shift_ir;    
wire            sm_xx_write_en;        
wire            tclk;                  
wire            tdi;                   
wire            trst_b;                


//==============================================================================
// data shift in and out
// 1. how to shift IR
// 2. how to capture DR
// 3. how to shift DR in JTAG_2 interface
// 4. how to shift DR in JTAG_5 interface
//==============================================================================

assign serial_shifter_8_sel = 
            ir_xx_otc_reg_sel
         || ir_xx_mbca_reg_sel
         || ir_xx_mbcb_reg_sel
         || ir_xx_bama_reg_sel
         || ir_xx_bamb_reg_sel;

assign serial_shifter_16_sel = 
            ir_xx_csr_reg_sel;

assign serial_shifter_32_sel = 
            !(serial_shifter_8_sel
           || serial_shifter_16_sel
           || serial_shifter_64_sel);

assign serial_shifter_64_sel = 
            ir_xx_pipefifo_reg_sel
         || ir_xx_baba_reg_sel
         || ir_xx_babb_reg_sel
         || ir_xx_wbbr_reg_sel
         || ir_xx_pc_reg_sel
         || ir_xx_pcfifo_reg_sel
         || ir_xx_daddr_reg_sel
         || ir_xx_dbgfifo_reg_sel
         || ir_xx_dbgfifo2_reg_sel
         || ir_xx_ddata_reg_sel;

assign serial_shifter_dr_pre[63:0] =
         {64{serial_shifter_8_sel}}  & {56'b0, tdi, serial_shifter[7:1]}
       | {64{serial_shifter_16_sel}} & {48'b0, tdi, serial_shifter[15:1]}
       | {64{serial_shifter_32_sel}} & {32'b0, tdi, serial_shifter[31:1]}
       | {64{serial_shifter_64_sel}} & {tdi,serial_shifter[63:1]};

// &CombBeg; @69
always @( serial_shifter[63:0]
       or sm_serial_shift_dr
       or sm_serial_capture_dr
       or tdi
       or serial_shifter_dr_pre[63:0]
       or sm_serial_shift_ir
       or regs_serial_data[63:0])
begin
  serial_shifter_pre[63:0] = 64'b0;
  if (sm_serial_shift_ir)
    serial_shifter_pre[15:0] = {tdi, serial_shifter[15:1]};
  else if (sm_serial_capture_dr)
    serial_shifter_pre[63:0] = regs_serial_data[63:0];
  else if (sm_serial_shift_dr)
    serial_shifter_pre[63:0] = serial_shifter_dr_pre[63:0];
  else
    serial_shifter_pre[63:0] = serial_shifter[63:0];
// &CombEnd; @79
end

// data shift from the lowest bit
// sample tdi on the posedge of JTAG clock
always @(posedge tclk)
begin
  serial_shifter[63:0] <= serial_shifter_pre[63:0];
end

// output signal, data shift in
assign serial_xx_data[63:0] = serial_shifter[63:0];

//==============================================
// calculate the parity bit when read DR
//==============================================
always @(posedge tclk)
begin
  if (sm_serial_capture_dr)
    parity <= 1'b1;
  else if (sm_serial_shift_dr && !sm_xx_write_en)
    parity <= parity ^ serial_shifter[0];
  else
    parity <= parity;
end

//==============================================
// set tdo on the negedge of tclk
// set tdo to logic 1 when IDLE
//==============================================
always @(negedge tclk or negedge trst_b)
begin
  if (!trst_b)
    tdo <= 1'b1;
  else if (sm_serial_shift_dr && !sm_xx_write_en)
    tdo <= serial_shifter[0];
  else
    tdo <= tdo;
end

//==========================================================
//               jtag input and output
//==========================================================

assign tdi = io_serial_tdi;

assign serial_io_tdo = tdo;

// &ModuleEnd; @126
endmodule



