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
module ct_had_common_regs(
  common_regs_data,
  core0_had_dbg_mask,
  core0_rst_b,
  core1_had_dbg_mask,
  core1_rst_b,
  dbgfifo2_data,
  forever_cpuclk,
  ir_xx_core0_sel,
  ir_xx_core1_sel,
  ir_xx_core2_sel,
  ir_xx_core3_sel,
  ir_xx_dbgfifo2_reg_sel,
  ir_xx_dms_reg_sel,
  ir_xx_id_reg_sel,
  ir_xx_rsr_reg_sel,
  sysio_had_dbg_mask
);


// &Ports; @25
input           core0_rst_b;           
input           core1_rst_b;           
input   [63:0]  dbgfifo2_data;         
input           forever_cpuclk;        
input           ir_xx_core0_sel;       
input           ir_xx_core1_sel;       
input           ir_xx_core2_sel;       
input           ir_xx_core3_sel;       
input           ir_xx_dbgfifo2_reg_sel; 
input           ir_xx_dms_reg_sel;     
input           ir_xx_id_reg_sel;      
input           ir_xx_rsr_reg_sel;     
input   [3 :0]  sysio_had_dbg_mask;    
output  [63:0]  common_regs_data;      
output          core0_had_dbg_mask;    
output          core1_had_dbg_mask;    

// &Regs; @26
reg             core_rst0;             
reg             core_rst1;             

// &Wires; @27
wire    [63:0]  common_regs_data;      
wire            core0_had_dbg_mask;    
wire            core0_rst_b;           
wire            core1_had_dbg_mask;    
wire            core1_rst_b;           
wire    [3 :0]  core_rst;              
wire            core_rst2;             
wire            core_rst3;             
wire    [63:0]  dbgfifo2_data;         
wire    [31:0]  dms_data;              
wire            forever_cpuclk;        
wire    [31:0]  id_reg;                
wire            ir_xx_dbgfifo2_reg_sel; 
wire            ir_xx_dms_reg_sel;     
wire            ir_xx_id_reg_sel;      
wire            ir_xx_rsr_reg_sel;     
wire    [31:0]  rsr_data;              
wire    [3 :0]  sysio_had_dbg_mask;    
wire    [3 :0]  tee_mask;              


parameter DATAW = 64;

//==========================================================
//                           RSR
//==========================================================
always @ (posedge forever_cpuclk or negedge core0_rst_b)
begin
  if (!core0_rst_b)
    core_rst0 <= 1'b1;
  else
    core_rst0 <= 1'b0;
end

always @ (posedge forever_cpuclk or negedge core1_rst_b)
begin
  if (!core1_rst_b)
    core_rst1 <= 1'b1;
  else
    core_rst1 <= 1'b0;
end

assign core_rst2 = 1'b1;

assign core_rst3 = 1'b1;

assign core_rst[3:0] = {core_rst3, core_rst2, core_rst1, core_rst0};

assign tee_mask[3:0] = 4'b0;
// &Force("input", "ir_xx_core0_sel"); @97
// &Force("input", "ir_xx_core1_sel"); @98
// &Force("input", "ir_xx_core2_sel"); @99
// &Force("input", "ir_xx_core3_sel"); @100

assign rsr_data[31:0] = {28'b0, core_rst[3:0] | tee_mask[3:0]};

//==========================================================
//                          HAD ID
//==========================================================
// +-------+-----+---------+----+----+-------+------+-----+-----+
// | 31:28 |27:26|  25:18  | 17 | 16 | 15:12 | 11:8 | 7:4 | 3:0 |
// +-------+-----+---------+----+----+-------+------+-----+-----+
//     |      |              |    |      |       |    |     |
//     |      |              |    |      |       |    |     +--- ID_VERSION
//     |      |              |    |      |       |    +--------- HAD_VERSION
//     |      |              |    |      |       +-------------- HAD_REVISION
//     |      |              |    |      +---------------------- BKPT_NUM
//     |      |              |    +----------------------------- DDC
//     |      |              +---------------------------------- BANK1
//     |      +--------------------------------------- CPU Inst. Arch
//     +---------------------------------------------- JTAG InterfaceType

assign id_reg[31:28] = 4'b0;
assign id_reg[27:26] = 2'b10;  //CSKY V3
assign id_reg[25:20] = 6'd0;   // -
assign id_reg[19]    = 1'b1;  //have rsr.
assign id_reg[18]    = 1'b1;  //hacr_reg is 16 bits
assign id_reg[17]    = 1'b0;  // BANK1
assign id_reg[16]    = 1'b1;  // DDC
assign id_reg[15:12] = 4'd2;  // BKPT_NUM

//-----------------------------------------
// initial reversion
// assign id_reg[11:8]  = 4'b0000;
//-----------------------------------------
// memeory breakpoint logic modify
// current instruction doesnot executing
// but goto debug mode if current maca is 0
// assign id_reg[11:8]  = 4'b0001;
//-----------------------------------------
// add HCR[ASR] and cpu dead reason in HSR
//assign id_reg[11:8]  = 4'b0010;

// version 2.3
// 1. add DCC handshake
// 2. add TEE support
assign id_reg[11:8]  = 4'b1011;

// HAD_VER as ISA version,0000:6xx, 0001:810p, 0010: 8xx, 0011:902, 0100: 960
assign id_reg[7:4]   = 4'b0100; 

assign id_reg[3:0]   = 4'b0011;

//==========================================================
//                           DMS
//==========================================================
assign dms_data[31:0] = {28'b0, sysio_had_dbg_mask[3:0] & ~tee_mask[3:0]};

assign core0_had_dbg_mask = sysio_had_dbg_mask[0];
assign core1_had_dbg_mask = sysio_had_dbg_mask[1];

//==========================================================
//                           MUX
//==========================================================
assign common_regs_data[DATAW-1:0] =
            {DATAW{ir_xx_dbgfifo2_reg_sel}} & dbgfifo2_data[63:0]
          | {DATAW{ir_xx_rsr_reg_sel}}      & {{DATAW-32{1'b0}},rsr_data[31:0]}
          | {DATAW{ir_xx_id_reg_sel}}       & {{DATAW-32{1'b0}},id_reg[31:0]}
          | {DATAW{ir_xx_dms_reg_sel}}      & {{DATAW-32{1'b0}},dms_data[31:0]};

// &ModuleEnd; @177
endmodule



