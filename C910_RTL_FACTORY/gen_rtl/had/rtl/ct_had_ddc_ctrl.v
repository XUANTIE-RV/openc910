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
module ct_had_ddc_ctrl(
  cpuclk,
  cpurst_b,
  ddc_ctrl_dp_addr_gen,
  ddc_ctrl_dp_addr_sel,
  ddc_ctrl_dp_data_sel,
  ddc_regs_update_csr,
  ddc_regs_update_wbbr,
  ddc_xx_update_ir,
  ir_xx_daddr_reg_sel,
  ir_xx_ddata_reg_sel,
  regs_xx_ddc_en,
  rtu_yy_xx_retire0_normal,
  x_sm_xx_update_dr_en
);

// &Ports; @24
input          cpuclk;                  
input          cpurst_b;                
input          ir_xx_daddr_reg_sel;     
input          ir_xx_ddata_reg_sel;     
input          regs_xx_ddc_en;          
input          rtu_yy_xx_retire0_normal; 
input          x_sm_xx_update_dr_en;    
output         ddc_ctrl_dp_addr_gen;    
output         ddc_ctrl_dp_addr_sel;    
output         ddc_ctrl_dp_data_sel;    
output         ddc_regs_update_csr;     
output         ddc_regs_update_wbbr;    
output         ddc_xx_update_ir;        

// &Regs; @25
reg            addr_ld_finish;          
reg     [3:0]  cur_st;                  
reg     [3:0]  nxt_st;                  

// &Wires; @26
wire           addr_ready;              
wire           cpuclk;                  
wire           cpurst_b;                
wire           data_ld_finish;          
wire           data_ready;              
wire           ddc_ctrl_dp_addr_gen;    
wire           ddc_ctrl_dp_addr_sel;    
wire           ddc_ctrl_dp_data_sel;    
wire           ddc_ctrl_dp_stw_sel;     
wire           ddc_regs_update_csr;     
wire           ddc_regs_update_wbbr;    
wire           ddc_xx_update_ir;        
wire           ir_xx_daddr_reg_sel;     
wire           ir_xx_ddata_reg_sel;     
wire           regs_xx_ddc_en;          
wire           rtu_yy_xx_retire0_normal; 
wire           stw_inst_retire;         
wire           x_sm_xx_update_dr_en;    


//==============================================================================
//                           DDC control state machine 
//==============================================================================

parameter IDLE          = 4'h0;
parameter ADDR_WATI     = 4'h1;
parameter ADDR_LD       = 4'h2;
parameter DATA_WAIT     = 4'h3;
parameter DATA_LD       = 4'h4;
parameter STW_WAIT      = 4'h5;
parameter STW_LD        = 4'h6;
parameter STW_FINISH    = 4'h7;
parameter ADDR_GEN      = 4'h8;
    
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cur_st[3:0] <= IDLE;
  else
    cur_st[3:0] <= nxt_st[3:0];
end
    
// &CombBeg; @50
always @( addr_ld_finish
       or cur_st[3:0]
       or addr_ready
       or regs_xx_ddc_en
       or data_ready
       or stw_inst_retire
       or data_ld_finish)
begin
  case(cur_st[3:0])
    IDLE:      
      if (regs_xx_ddc_en)
        nxt_st[3:0] = ADDR_WATI;
      else
        nxt_st[3:0] = IDLE;
    ADDR_WATI: // wait addr be loaded into daddr
      if (addr_ready)
        nxt_st[3:0] = ADDR_LD;
      else
        nxt_st[3:0] = ADDR_WATI;
    ADDR_LD:   // load "mov r0, r0" to ir, ffy and wbbr
        nxt_st[3:0] = DATA_WAIT;
    DATA_WAIT:
      if (addr_ld_finish && data_ready) // wait base prepare finish and data ready.
        nxt_st[3:0] = DATA_LD;
      else if (addr_ready) // re-prepare base
        nxt_st[3:0] = ADDR_LD;
      else if (!regs_xx_ddc_en)
        nxt_st[3:0] = IDLE;
      else
        nxt_st[3:0] = DATA_WAIT;
    DATA_LD:
        nxt_st[3:0] = STW_WAIT; // load "mov r1, r1" to ir, ffy and wbbr
    STW_WAIT:
      if (data_ld_finish)  // wait for "mov r1, r1" retire: data prepare finish
        nxt_st[3:0] = STW_LD;
      else
        nxt_st[3:0] = STW_WAIT;
    STW_LD:                     // load "stw r1, r0" to ir
        nxt_st[3:0] = STW_FINISH;
    STW_FINISH: // wait for stw finish
      if (stw_inst_retire)
        nxt_st[3:0] = ADDR_GEN;
      else
        nxt_st[3:0] = STW_FINISH;
    ADDR_GEN:  // increase addr and recycle
        nxt_st[3:0] = ADDR_LD;
    default:
        nxt_st[3:0] = IDLE;
  endcase
// &CombEnd; @92
end

assign addr_ready = x_sm_xx_update_dr_en && ir_xx_daddr_reg_sel;
assign data_ready = x_sm_xx_update_dr_en && ir_xx_ddata_reg_sel;

// addr load finish
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    addr_ld_finish <= 1'b0;
  else if (cur_st[3:0] == DATA_WAIT) begin
    if (rtu_yy_xx_retire0_normal)
      addr_ld_finish <= 1'b1;
    else
      addr_ld_finish <= addr_ld_finish; // hold finish state
  end
  else
    addr_ld_finish <= 1'b0;
end

// data load finish will push state machine into next state, so the state
// needn't hold
assign data_ld_finish = rtu_yy_xx_retire0_normal;

assign stw_inst_retire = rtu_yy_xx_retire0_normal;

//==========================================================
//            control signal to ddc dp
//==========================================================

// &Force("output", "ddc_ctrl_dp_addr_sel"); @122
assign ddc_ctrl_dp_addr_sel = cur_st[3:0] == ADDR_LD;
    
// &Force("output", "ddc_ctrl_dp_data_sel"); @125
assign ddc_ctrl_dp_data_sel = cur_st[3:0] == DATA_LD;

assign ddc_ctrl_dp_stw_sel  = cur_st[3:0] == STW_LD;

assign ddc_ctrl_dp_addr_gen = cur_st[3:0] == ADDR_GEN;

//==========================================================
//            control signal to regs
//==========================================================
    
assign ddc_regs_update_wbbr = ddc_ctrl_dp_addr_sel || ddc_ctrl_dp_data_sel;

assign ddc_regs_update_csr  = ddc_ctrl_dp_addr_sel ||
                              ddc_ctrl_dp_data_sel ||
                              ddc_ctrl_dp_stw_sel;

assign ddc_xx_update_ir   = ddc_ctrl_dp_addr_sel ||
                            ddc_ctrl_dp_data_sel ||
                            ddc_ctrl_dp_stw_sel;

// &ModuleEnd; @146
endmodule



