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
module ct_had_bkpt(
  bkpt_ctrl_data_req,
  bkpt_ctrl_data_req_raw,
  bkpt_ctrl_inst_req,
  bkpt_ctrl_inst_req_raw,
  bkpt_ctrl_xx_ack,
  bkpt_regs_mbc,
  cp0_yy_priv_mode,
  cpuclk,
  cpurst_b,
  ctrl_bkpt_en,
  ctrl_bkpt_en_raw,
  inst_bkpt_dbgreq,
  ir_xx_mbc_reg_sel,
  ir_xx_wdata,
  regs_xx_bc,
  regs_xx_nirven,
  rtu_had_bkpt_data_st,
  rtu_had_data_bkpt_vld,
  rtu_had_inst_bkpt_inst_vld,
  rtu_had_inst_bkpt_vld,
  rtu_had_inst_split,
  rtu_had_xx_mbkpt_chgflow,
  rtu_had_xx_mbkpt_data_ack,
  rtu_had_xx_mbkpt_inst_ack,
  rtu_had_xx_split_inst,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush,
  rtu_yy_xx_retire0_normal,
  x_sm_xx_update_dr_en
);

// &Ports; @24
input   [1 :0]  cp0_yy_priv_mode;          
input           cpuclk;                    
input           cpurst_b;                  
input           ctrl_bkpt_en;              
input           ctrl_bkpt_en_raw;          
input           inst_bkpt_dbgreq;          
input           ir_xx_mbc_reg_sel;         
input   [63:0]  ir_xx_wdata;               
input   [4 :0]  regs_xx_bc;                
input           regs_xx_nirven;            
input           rtu_had_bkpt_data_st;      
input           rtu_had_data_bkpt_vld;     
input           rtu_had_inst_bkpt_inst_vld; 
input           rtu_had_inst_bkpt_vld;     
input           rtu_had_inst_split;        
input           rtu_had_xx_mbkpt_chgflow;  
input           rtu_had_xx_mbkpt_data_ack; 
input           rtu_had_xx_mbkpt_inst_ack; 
input           rtu_had_xx_split_inst;     
input           rtu_yy_xx_dbgon;           
input           rtu_yy_xx_flush;           
input           rtu_yy_xx_retire0_normal;  
input           x_sm_xx_update_dr_en;      
output          bkpt_ctrl_data_req;        
output          bkpt_ctrl_data_req_raw;    
output          bkpt_ctrl_inst_req;        
output          bkpt_ctrl_inst_req_raw;    
output          bkpt_ctrl_xx_ack;          
output  [7 :0]  bkpt_regs_mbc;             

// &Regs; @25
reg     [7 :0]  bkpt_counter;              
reg             changeflow_inst_bkpt_ff;   
reg             data_bkpt_pending;         
reg             data_bkpt_vld_f;           
reg             inst_bkpt_inst_vld_f;      
reg             inst_bkpt_vld_f;           
reg             load_data_bkpt_ff;         
reg             normal_data_bkpt_ff;       
reg             normal_inst_bkpt_ff;       
reg             st_data_bkpt_ff;           

// &Wires; @26
wire            bkpt_counter_dec_1;        
wire            bkpt_counter_eq_0;         
wire            bkpt_counter_eq_0_raw;     
wire            bkpt_counter_eq_1;         
wire            bkpt_ctrl_data_req;        
wire            bkpt_ctrl_data_req_raw;    
wire            bkpt_ctrl_inst_req;        
wire            bkpt_ctrl_inst_req_raw;    
wire            bkpt_ctrl_xx_ack;          
wire    [7 :0]  bkpt_regs_mbc;             
wire            changeflow_inst_bkpt;      
wire    [1 :0]  cp0_yy_priv_mode;          
wire            cpuclk;                    
wire            cpurst_b;                  
wire            ctrl_bkpt_en;              
wire            ctrl_bkpt_en_raw;          
wire            data_bkpt_occur;           
wire            data_bkpt_req_raw;         
wire            data_bkpt_vld;             
wire            inst_bkpt_dbgreq;          
wire            inst_bkpt_occur;           
wire            inst_bkpt_req_raw;         
wire            inst_bkpt_vld;             
wire            ir_xx_mbc_reg_sel;         
wire    [63:0]  ir_xx_wdata;               
wire            load_data_bkpt;            
wire            normal_data_bkpt;          
wire            normal_inst_bkpt;          
wire            priv_mode;                 
wire    [4 :0]  regs_xx_bc;                
wire            regs_xx_nirven;            
wire            rtu_had_bkpt_data_st;      
wire            rtu_had_data_bkpt_vld;     
wire            rtu_had_inst_bkpt_inst_vld; 
wire            rtu_had_inst_bkpt_vld;     
wire            rtu_had_inst_split;        
wire            rtu_had_xx_mbkpt_chgflow;  
wire            rtu_had_xx_mbkpt_data_ack; 
wire            rtu_had_xx_mbkpt_inst_ack; 
wire            rtu_had_xx_split_inst;     
wire            rtu_yy_xx_dbgon;           
wire            rtu_yy_xx_flush;           
wire            rtu_yy_xx_retire0_normal;  
wire            st_data_bkpt;              
wire            user_mode;                 
wire            x_sm_xx_update_dr_en;      


//==============================================================================
// memory bkpt debug contains four levels:
//   level one: memory bkpt conditions meet: (determined by RTU and LSU)
//     1. address trap (addr equal & rc clear or addr not equal & rc set)
//     2. bkpt_en
//     3. retire normal
//     4. not spilt inst for inst bkpt(except the last one)
//   level two: memory bkpt type meets various conditions indicated by
//              control bits of HCR
//   level three: memory bkpt request
//     1. memory bkpt vld
//     2. bkpt_counter equal zero or one (corner case) 
//     3. not in debug mode
//   level four: memory bkpt debug request: (implemented in ctrl module)
//     1. current memory bkpt request meet SQC condition
//
// In naming methodology, the names for every levels are
//   level one -- inst_bkpt_occur, data_bkpt_occur 
//   level two -- inst_bkpt_vld, data_bkpt_vld
//   level three -- bkpt_ctrl_req
//   level four -- mem_bkpt_debug_req
//==============================================================================

//==============================================================================
//                     level one
//==============================================================================

assign inst_bkpt_occur = rtu_had_inst_bkpt_vld && !regs_xx_nirven;
assign data_bkpt_occur = rtu_had_data_bkpt_vld && !regs_xx_nirven;

//==============================================================================
//                     level two
//==============================================================================
assign user_mode = cp0_yy_priv_mode[1:0] == 2'b00;
assign priv_mode = !user_mode;

assign changeflow_inst_bkpt =!regs_xx_bc[4]&&!regs_xx_bc[3]&& regs_xx_bc[2]&&!regs_xx_bc[1]&&!regs_xx_bc[0]
                           || regs_xx_bc[4]&&!regs_xx_bc[3]&& regs_xx_bc[2]&&!regs_xx_bc[1]&&!regs_xx_bc[0]&&!priv_mode
                           || regs_xx_bc[4]&& regs_xx_bc[3]&& regs_xx_bc[2]&&!regs_xx_bc[1]&&!regs_xx_bc[0]&& priv_mode;
assign normal_inst_bkpt     =!regs_xx_bc[4]&&!regs_xx_bc[3]&&!regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]
                           ||!regs_xx_bc[4]&&!regs_xx_bc[3]&&!regs_xx_bc[2]&& regs_xx_bc[1]&&!regs_xx_bc[0]
                           || regs_xx_bc[4]&&!regs_xx_bc[3]&&!regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]&&!priv_mode
                           || regs_xx_bc[4]&&!regs_xx_bc[3]&&!regs_xx_bc[2]&& regs_xx_bc[1]&&!regs_xx_bc[0]&&!priv_mode
                           || regs_xx_bc[4]&& regs_xx_bc[3]&&!regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]&& priv_mode
                           || regs_xx_bc[4]&& regs_xx_bc[3]&&!regs_xx_bc[2]&& regs_xx_bc[1]&&!regs_xx_bc[0]&& priv_mode;
assign normal_data_bkpt     =!regs_xx_bc[4]&&!regs_xx_bc[3]&&!regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]
                           ||!regs_xx_bc[4]&&!regs_xx_bc[3]&&!regs_xx_bc[2]&& regs_xx_bc[1]&& regs_xx_bc[0]
                           || regs_xx_bc[4]&&!regs_xx_bc[3]&&!regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]&&!priv_mode
                           || regs_xx_bc[4]&&!regs_xx_bc[3]&&!regs_xx_bc[2]&& regs_xx_bc[1]&& regs_xx_bc[0]&&!priv_mode
                           || regs_xx_bc[4]&& regs_xx_bc[3]&&!regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]&& priv_mode
                           || regs_xx_bc[4]&& regs_xx_bc[3]&&!regs_xx_bc[2]&& regs_xx_bc[1]&& regs_xx_bc[0]&& priv_mode;
assign st_data_bkpt         =!regs_xx_bc[4]&&!regs_xx_bc[3]&& regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]
                           || regs_xx_bc[4]&&!regs_xx_bc[3]&& regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]&&!priv_mode
                           || regs_xx_bc[4]&& regs_xx_bc[3]&& regs_xx_bc[2]&&!regs_xx_bc[1]&& regs_xx_bc[0]&& priv_mode;
assign load_data_bkpt       =!regs_xx_bc[4]&&!regs_xx_bc[3]&& regs_xx_bc[2]&& regs_xx_bc[1]&&!regs_xx_bc[0]
                           || regs_xx_bc[4]&&!regs_xx_bc[3]&& regs_xx_bc[2]&& regs_xx_bc[1]&&!regs_xx_bc[0]&&!priv_mode
                           || regs_xx_bc[4]&& regs_xx_bc[3]&& regs_xx_bc[2]&& regs_xx_bc[1]&&!regs_xx_bc[0]&& priv_mode;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    changeflow_inst_bkpt_ff <= 1'b0;
    normal_inst_bkpt_ff     <= 1'b0;
    normal_data_bkpt_ff     <= 1'b0;
    st_data_bkpt_ff         <= 1'b0;
    load_data_bkpt_ff       <= 1'b0;
  end
  else
  begin
    changeflow_inst_bkpt_ff <= changeflow_inst_bkpt;
    normal_inst_bkpt_ff     <= normal_inst_bkpt;
    normal_data_bkpt_ff     <= normal_data_bkpt;
    st_data_bkpt_ff         <= st_data_bkpt;
    load_data_bkpt_ff       <= load_data_bkpt;
  end
end

assign inst_bkpt_vld = inst_bkpt_occur && rtu_had_xx_mbkpt_chgflow && changeflow_inst_bkpt_ff
                    || inst_bkpt_occur && normal_inst_bkpt_ff;

assign data_bkpt_vld = data_bkpt_occur && normal_data_bkpt_ff
                    || data_bkpt_occur && rtu_had_bkpt_data_st && st_data_bkpt_ff
                    || data_bkpt_occur &&!rtu_had_bkpt_data_st && load_data_bkpt_ff;

//==============================================================================
//                     level three
//==============================================================================

//==========================================================
// memory bkpt counter decrease 1 condition(AND):
//   1. only one of inst_bkpt or data_bkpt is valid;
//   2. bkpt counter doesn't equal to zero;
//   3. not in debug mode.
// memory bkpt counter decrease 2 condition(AND):
//   1. both inst_bkpt and data_bkpt are valid; 
//   2. bkpt counter doesn't equal to zero or one;
//   3. not in debug mode.
//   4. highest  level or in untrusted world while medium  level
//==========================================================

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    inst_bkpt_vld_f <= 1'b0;
    data_bkpt_vld_f <= 1'b0;
  end
  else if (rtu_had_inst_bkpt_inst_vld) begin
    inst_bkpt_vld_f <= inst_bkpt_vld;
    data_bkpt_vld_f <= data_bkpt_vld;
  end
end

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    inst_bkpt_inst_vld_f <= 1'b0;
  else 
    inst_bkpt_inst_vld_f <= rtu_had_inst_bkpt_inst_vld;
end

assign bkpt_counter_dec_1 = (inst_bkpt_vld_f && !rtu_had_xx_split_inst || 
                             data_bkpt_vld_f) && 
                             ctrl_bkpt_en &&
                             rtu_yy_xx_retire0_normal &&
                            !bkpt_counter_eq_0 &&
                            !inst_bkpt_dbgreq &&
//                            !rtu_had_xx_split_inst &&
                            !rtu_yy_xx_dbgon;

// memory bkpt counter
// &Force("bus", "ir_xx_wdata", 63, 0); @158
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bkpt_counter[7:0] <= 8'b0;
  else if (x_sm_xx_update_dr_en && ir_xx_mbc_reg_sel)
    bkpt_counter[7:0] <= ir_xx_wdata[7:0];
  else if (bkpt_counter_dec_1)
    bkpt_counter[7:0] <= bkpt_counter[7:0] - 8'b1;
  else
    bkpt_counter[7:0] <= bkpt_counter[7:0];
end
    
assign bkpt_counter_eq_0 = bkpt_counter[7:0] == 8'b0;
assign bkpt_counter_eq_1 = bkpt_counter[7:0] == 8'b1;
    
assign bkpt_regs_mbc[7:0] = bkpt_counter[7:0];

assign bkpt_counter_eq_0_raw = bkpt_counter_dec_1 ? bkpt_counter_eq_1 : bkpt_counter_eq_0;

//=========================================================
// memory bkpt request condition(AND):
// 1. bkpt counter equals to zero;
// 2. inst_bkpt_vld or data_bkpt_vld or both vld;
// OR
// 1. bkpt counter equals to one;
// 2. inst_bkpt_vld and data_bkpt_vld both vld;
//==========================================================
assign bkpt_ctrl_xx_ack   = rtu_had_xx_mbkpt_inst_ack && bkpt_counter_eq_0 && ctrl_bkpt_en || 
                            rtu_had_xx_mbkpt_data_ack && bkpt_counter_eq_0 && ctrl_bkpt_en;

assign bkpt_ctrl_inst_req = bkpt_counter_eq_0 && inst_bkpt_vld_f && !rtu_yy_xx_dbgon && ctrl_bkpt_en && inst_bkpt_inst_vld_f;
assign bkpt_ctrl_data_req = bkpt_counter_eq_0 && data_bkpt_vld_f && !rtu_yy_xx_dbgon && ctrl_bkpt_en && rtu_yy_xx_retire0_normal;

assign inst_bkpt_req_raw = bkpt_counter_eq_0_raw && inst_bkpt_vld && !rtu_yy_xx_dbgon && ctrl_bkpt_en_raw && rtu_had_inst_bkpt_inst_vld;
assign data_bkpt_req_raw = bkpt_counter_eq_0_raw && data_bkpt_vld && !rtu_yy_xx_dbgon && ctrl_bkpt_en_raw && rtu_had_inst_bkpt_inst_vld;

assign bkpt_ctrl_inst_req_raw = inst_bkpt_req_raw;
assign bkpt_ctrl_data_req_raw = data_bkpt_req_raw && !rtu_had_inst_split || 
                                data_bkpt_pending && !rtu_had_inst_split && rtu_had_inst_bkpt_inst_vld;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    data_bkpt_pending <= 1'b0;
  else if (rtu_yy_xx_flush)
    data_bkpt_pending <= 1'b0;
  else if (data_bkpt_req_raw && rtu_had_inst_split)
    data_bkpt_pending <= 1'b1;
  else if (rtu_yy_xx_dbgon)
    data_bkpt_pending <= 1'b0;
end

// &ModuleEnd; @211
endmodule



