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
module ct_had_event(
  cpuclk,
  cpurst_b,
  ctrl_event_dbgenter,
  ctrl_event_dbgexit,
  event_ctrl_enter_dbg,
  event_ctrl_exit_dbg,
  event_ctrl_had_clk_en,
  forever_coreclk,
  regs_event_enter_ie,
  regs_event_enter_oe,
  regs_event_exit_ie,
  regs_event_exit_oe,
  rtu_yy_xx_dbgon,
  x_enter_dbg_req_i,
  x_enter_dbg_req_o,
  x_exit_dbg_req_i,
  x_exit_dbg_req_o
);

// &Ports; @24
input        cpuclk;                
input        cpurst_b;              
input        ctrl_event_dbgenter;   
input        ctrl_event_dbgexit;    
input        forever_coreclk;       
input        regs_event_enter_ie;   
input        regs_event_enter_oe;   
input        regs_event_exit_ie;    
input        regs_event_exit_oe;    
input        rtu_yy_xx_dbgon;       
input        x_enter_dbg_req_i;     
input        x_exit_dbg_req_i;      
output       event_ctrl_enter_dbg;  
output       event_ctrl_exit_dbg;   
output       event_ctrl_had_clk_en; 
output       x_enter_dbg_req_o;     
output       x_exit_dbg_req_o;      

// &Regs; @25
reg          enter_dbg_req_i;       
reg          enter_dbg_req_o;       
reg          exit_dbg_req_o;        
reg          x_enter_dbg_req_i_f;   
reg          x_enter_dbg_req_i_sync; 
reg          x_exit_dbg_req_i_f;    
reg          x_exit_dbg_req_i_sync; 

// &Wires; @26
wire         cpuclk;                
wire         cpurst_b;              
wire         ctrl_event_dbgenter;   
wire         ctrl_event_dbgexit;    
wire         event_ctrl_enter_dbg;  
wire         event_ctrl_exit_dbg;   
wire         event_ctrl_had_clk_en; 
wire         forever_coreclk;       
wire         regs_event_enter_ie;   
wire         regs_event_enter_oe;   
wire         regs_event_exit_ie;    
wire         regs_event_exit_oe;    
wire         rtu_yy_xx_dbgon;       
wire         x_enter_dbg_req_i;     
wire         x_enter_dbg_req_o;     
wire         x_enter_dbg_req_o_sync; 
wire         x_exit_dbg_req_i;      
wire         x_exit_dbg_req_o;      
wire         x_exit_dbg_req_o_sync; 


//==========================================================
//                        Input Sync
//==========================================================
// &Instance("sync_level2pulse", "x_ct_sync_enter_dbg_req_i"); @32
// &Connect(.clk       (forever_coreclk), @33
//          .rst_b     (cpurst_b), @34
//          .sync_in   (x_enter_dbg_req_i), @35
//          .sync_out  (x_enter_dbg_req_i_sync), @36
//          .sync_ack  (x_enter_dbg_req_i_ack) @37
//         ); @38
// &Instance("sync_level2pulse", "x_ct_sync_exit_dbg_req_i"); @40
// &Connect(.clk       (forever_coreclk), @41
//          .rst_b     (cpurst_b), @42
//          .sync_in   (x_exit_dbg_req_i), @43
//          .sync_out  (x_exit_dbg_req_i_sync), @44
//          .sync_ack  (x_exit_dbg_req_i_ack) @45
//         ); @46
always @ (posedge forever_coreclk or negedge cpurst_b)
begin
  if (~cpurst_b) begin
    x_enter_dbg_req_i_f    <= 1'b0;
    x_enter_dbg_req_i_sync <= 1'b0;
    x_exit_dbg_req_i_f     <= 1'b0;
    x_exit_dbg_req_i_sync  <= 1'b0;
  end
  else begin
    x_enter_dbg_req_i_f    <= x_enter_dbg_req_i;
    x_enter_dbg_req_i_sync <= x_enter_dbg_req_i_f;
    x_exit_dbg_req_i_f     <= x_exit_dbg_req_i;
    x_exit_dbg_req_i_sync  <= x_exit_dbg_req_i_f;
  end
end


//==========================================================
//                        Input Ctrl
//==========================================================
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    enter_dbg_req_i <= 1'b0;
  else if (x_enter_dbg_req_i_sync & regs_event_enter_ie)
    enter_dbg_req_i <= 1'b1;
  else if (rtu_yy_xx_dbgon)
    enter_dbg_req_i <= 1'b0;
end

assign event_ctrl_enter_dbg = enter_dbg_req_i;
assign event_ctrl_exit_dbg  = x_exit_dbg_req_i_sync & regs_event_exit_ie;
//assign x_event_enter_dbg_req_i = enter_dbg_req_i;


//==========================================================
//                       Output Ctrl
//==========================================================
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    exit_dbg_req_o <= 1'b0;
  else
    exit_dbg_req_o <= ctrl_event_dbgexit;
end

assign x_exit_dbg_req_o_sync = exit_dbg_req_o && regs_event_exit_oe;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    enter_dbg_req_o <= 1'b0;
  else
    enter_dbg_req_o <= ctrl_event_dbgenter;
end

assign x_enter_dbg_req_o_sync = enter_dbg_req_o && regs_event_enter_oe;

//==========================================================
//                       Output Sync
//==========================================================
// &Force("input", "x_exit_dbg_req_o_ack"); @119
// &Force("input", "forever_coreclk"); @120
// &Force("nonport", "x_exit_dbg_req_o_ack_sync"); @121
// &Force("input", "x_enter_dbg_req_o_ack"); @141
// &Force("input", "forever_coreclk"); @142
// &Force("nonport", "x_enter_dbg_req_o_ack_sync"); @143
assign x_exit_dbg_req_o  = x_exit_dbg_req_o_sync;
assign x_enter_dbg_req_o = x_enter_dbg_req_o_sync;

assign event_ctrl_had_clk_en = x_enter_dbg_req_i_sync
                            || x_exit_dbg_req_i_sync;

// &ModuleEnd; @163
endmodule




