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
module ct_had_etm_if(
  cpurst_b,
  event_clk,
  x_enter_dbg_req,
  x_enter_dbg_req_i,
  x_enter_dbg_req_o,
  x_enter_dbg_req_o_ff,
  x_event_clk_en,
  x_exit_dbg_req,
  x_exit_dbg_req_i,
  x_exit_dbg_req_o,
  x_exit_dbg_req_o_ff
);


// &Ports; @25
input        cpurst_b;            
input        event_clk;           
input        x_enter_dbg_req;     
input        x_enter_dbg_req_o;   
input        x_exit_dbg_req;      
input        x_exit_dbg_req_o;    
output       x_enter_dbg_req_i;   
output       x_enter_dbg_req_o_ff; 
output       x_event_clk_en;      
output       x_exit_dbg_req_i;    
output       x_exit_dbg_req_o_ff; 

// &Regs; @26
reg          x_enter_dbg_req_i;   
reg          x_enter_dbg_req_o_ff; 
reg          x_exit_dbg_req_i;    
reg          x_exit_dbg_req_o_ff; 

// &Wires; @27
wire         cpurst_b;            
wire         event_clk;           
wire         x_enter_dbg_req;     
wire         x_enter_dbg_req_o;   
wire         x_event_clk_en;      
wire         x_exit_dbg_req;      
wire         x_exit_dbg_req_o;    


//==========================================================
//                       Output Sync
//==========================================================
// &Instance("sync_level2pulse", "x_ct_x_enter_dbg_req_o"); @33
// &Connect(.clk       (forever_cpuclk), @34
//          .rst_b     (cpurst_b), @35
//          .sync_in   (x_enter_dbg_req_o), @36
//          .sync_out  (x_enter_dbg_req_o_ff), @37
//          .sync_ack  (x_enter_dbg_req_o_ack) @38
//         ); @39
// &Instance("sync_level2pulse", "x_ct_x_exit_dbg_req_o"); @41
// &Connect(.clk       (forever_cpuclk), @42
//          .rst_b     (cpurst_b), @43
//          .sync_in   (x_exit_dbg_req_o), @44
//          .sync_out  (x_exit_dbg_req_o_ff), @45
//          .sync_ack  (x_exit_dbg_req_o_ack) @46
//         ); @47
always @ (posedge event_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    x_enter_dbg_req_o_ff <= 1'b0;
    x_exit_dbg_req_o_ff  <= 1'b0;
  end
  else begin
    x_enter_dbg_req_o_ff <= x_enter_dbg_req_o;
    x_exit_dbg_req_o_ff  <= x_exit_dbg_req_o;
  end
end


//==========================================================
//                        Input Sync
//==========================================================
// &Force("input", "x_enter_dbg_req_i_ack"); @75
// &Force("input", "forever_cpuclk"); @76
// &Force("nonport", "x_enter_dbg_req_i_ack_sync"); @77
// &Force("input", "x_exit_dbg_req_i_ack"); @97
// &Force("input", "forever_cpuclk"); @98
// &Force("nonport", "x_exit_dbg_req_i_ack_sync"); @99
always @ (posedge event_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    x_enter_dbg_req_i <= 1'b0;
    x_exit_dbg_req_i  <= 1'b0;
  end
  else begin
    x_enter_dbg_req_i <= x_enter_dbg_req;
    x_exit_dbg_req_i  <= x_exit_dbg_req;
  end
end

assign x_event_clk_en = x_exit_dbg_req_o_ff | x_exit_dbg_req_o
                      | x_enter_dbg_req_o_ff | x_enter_dbg_req_o
                      | x_exit_dbg_req_i | x_exit_dbg_req
                      | x_enter_dbg_req_i | x_enter_dbg_req;
// &Force("output", "x_exit_dbg_req_i"); @133
// &Force("output", "x_enter_dbg_req_i"); @134
// &Force("output", "x_exit_dbg_req_o_ff"); @135
// &Force("output", "x_enter_dbg_req_o_ff"); @136


// &ModuleEnd; @139
endmodule



