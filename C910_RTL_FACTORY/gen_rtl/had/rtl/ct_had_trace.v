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
module ct_had_trace(
  cpuclk,
  cpurst_b,
  ctrl_trace_en,
  inst_bkpt_dbgreq,
  ir_xx_otc_reg_sel,
  ir_xx_wdata,
  rtu_had_xx_split_inst,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_retire0_normal,
  trace_ctrl_req,
  trace_regs_otc,
  x_sm_xx_update_dr_en
);

// &Ports; @24
input           cpuclk;                  
input           cpurst_b;                
input           ctrl_trace_en;           
input           inst_bkpt_dbgreq;        
input           ir_xx_otc_reg_sel;       
input   [63:0]  ir_xx_wdata;             
input           rtu_had_xx_split_inst;   
input           rtu_yy_xx_dbgon;         
input           rtu_yy_xx_retire0_normal; 
input           x_sm_xx_update_dr_en;    
output          trace_ctrl_req;          
output  [7 :0]  trace_regs_otc;          

// &Regs; @25
reg     [7 :0]  trace_counter;           

// &Wires; @26
wire            cpuclk;                  
wire            cpurst_b;                
wire            ctrl_trace_en;           
wire            inst_bkpt_dbgreq;        
wire            ir_xx_otc_reg_sel;       
wire    [63:0]  ir_xx_wdata;             
wire            rtu_had_xx_split_inst;   
wire            rtu_yy_xx_dbgon;         
wire            rtu_yy_xx_retire0_normal; 
wire            trace_counter_dec;       
wire            trace_counter_eq_0;      
wire            trace_ctrl_req;          
wire    [7 :0]  trace_regs_otc;          
wire            trace_vld;               
wire            x_sm_xx_update_dr_en;    


//==============================================================================
// trace valid conditions(AND):
// 1. retire normally, without exception.
// 2. not a split inst or the last of the split inst.
// 3. not in debug mode.
// 4. trace mode enable.
// The last condition is designed for low power.
// when trace mode enable, CPU will retire only one inst in a cycle.
//==============================================================================

assign trace_vld = rtu_yy_xx_retire0_normal &&
                  !rtu_had_xx_split_inst &&
                  !rtu_yy_xx_dbgon &&
                   ctrl_trace_en;

//==============================================================================
// trace counter decrease condition (AND):
// 1. trace valid
// 2. trace counter dosen't equal to zero.
// 3. no mbkpt occurs
//==============================================================================

assign trace_counter_eq_0 = trace_counter[7:0] == 8'b0;
assign trace_counter_dec = trace_vld && !trace_counter_eq_0 && !inst_bkpt_dbgreq;

//==============================================================================
// trace counter maintenance
//==============================================================================

// &Force("bus", "ir_xx_wdata", 63, 0); @57
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    trace_counter[7:0] <= 8'b0;
  else if (x_sm_xx_update_dr_en && ir_xx_otc_reg_sel)
    trace_counter[7:0] <= ir_xx_wdata[7:0];
  else if (trace_counter_dec)
    trace_counter[7:0] <= trace_counter[7:0] - 1'b1;
  else
    trace_counter[7:0] <= trace_counter[7:0];
end

//==========================================================
//            trace counter to regs
//==========================================================

assign trace_regs_otc[7:0] = trace_counter[7:0];

//==========================================================
//            trace debug request
//==========================================================

// trace request to HAD control path conditions (AND):
// 1. trace_vld
// 2. trace counter equals to zero.

assign trace_ctrl_req = trace_vld && trace_counter_eq_0;

// &ModuleEnd; @86
endmodule




