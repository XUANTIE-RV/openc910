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
module ct_had_pcfifo(
  cpuclk,
  cpurst_b,
  ctrl_pcfifo_ren,
  ctrl_pcfifo_wen,
  mmu_xx_mmu_en,
  pcfifo_regs_data,
  rtu_had_xx_pcfifo_inst0_chgflow,
  rtu_had_xx_pcfifo_inst0_next_pc,
  rtu_had_xx_pcfifo_inst1_chgflow,
  rtu_had_xx_pcfifo_inst1_next_pc,
  rtu_had_xx_pcfifo_inst2_chgflow,
  rtu_had_xx_pcfifo_inst2_next_pc
);

// &Ports; @24
input           cpuclk;                         
input           cpurst_b;                       
input           ctrl_pcfifo_ren;                
input           ctrl_pcfifo_wen;                
input           mmu_xx_mmu_en;                  
input           rtu_had_xx_pcfifo_inst0_chgflow; 
input   [38:0]  rtu_had_xx_pcfifo_inst0_next_pc; 
input           rtu_had_xx_pcfifo_inst1_chgflow; 
input   [38:0]  rtu_had_xx_pcfifo_inst1_next_pc; 
input           rtu_had_xx_pcfifo_inst2_chgflow; 
input   [38:0]  rtu_had_xx_pcfifo_inst2_next_pc; 
output  [63:0]  pcfifo_regs_data;               

// &Regs; @25
reg     [2 :0]  chgflow_valid;                  
reg             ctrl_pcfifo_wen_flop;           
reg     [39:0]  pcfifo_din_0;                   
reg     [39:0]  pcfifo_din_1;                   
reg     [39:0]  pcfifo_din_2;                   
reg     [39:0]  pcfifo_dout;                    
reg     [4 :0]  rptr;                           
reg     [4 :0]  wptr;                           

// &Wires; @26
wire    [2 :0]  chgflow_valid_pre;              
wire            cpuclk;                         
wire            cpurst_b;                       
wire            create_one;                     
wire            create_three;                   
wire            create_two;                     
wire            create_vld;                     
wire            ctrl_pcfifo_ren;                
wire            ctrl_pcfifo_wen;                
wire            inst0_chgflow_vld;              
wire            inst1_chgflow_vld;              
wire            inst2_chgflow_vld;              
wire            mmu_xx_mmu_en;                  
wire            one_entry_left;                 
wire            pcfifo_empty;                   
wire            pcfifo_full;                    
wire    [63:0]  pcfifo_regs_data;               
wire    [4 :0]  rptr_inc;                       
wire            rptr_inc_1;                     
wire            rptr_inc_2;                     
wire            rptr_inc_3;                     
wire            rtu_had_xx_pcfifo_inst0_chgflow; 
wire    [38:0]  rtu_had_xx_pcfifo_inst0_next_pc; 
wire            rtu_had_xx_pcfifo_inst1_chgflow; 
wire    [38:0]  rtu_had_xx_pcfifo_inst1_next_pc; 
wire            rtu_had_xx_pcfifo_inst2_chgflow; 
wire    [38:0]  rtu_had_xx_pcfifo_inst2_next_pc; 
wire            two_entry_left;                 
wire    [4 :0]  wptr_0;                         
wire    [4 :0]  wptr_1;                         
wire    [4 :0]  wptr_2;                         
wire    [4 :0]  wptr_inc;                       
wire    [15:0]  wptr_sel_0;                     
wire    [15:0]  wptr_sel_1;                     
wire    [15:0]  wptr_sel_1_for_create_two;      
wire    [15:0]  wptr_sel_2;                     


//==============================================================================
//                               HAD PCFIFO 
//==============================================================================

parameter WIDTH         = `PA_WIDTH;
parameter DATAW        = 64;
parameter DEPTH         = 16;
parameter PTR_WIDTH     = 5;

//==========================================================
//                   PCFIFO write
//==========================================================
// when a branch or jump inst retires in normal mode,
// the target pc will be pushed into pcfifo
// &Force("nonport","inst0_chgflow_vld"); @42
// &Force("nonport","inst1_chgflow_vld"); @43
// &Force("nonport","inst2_chgflow_vld"); @44
// &Force("nonport","pcfifo_din_0"); @45
// &Force("nonport","pcfifo_din_1"); @46
// &Force("nonport","pcfifo_din_2"); @47
// &Force("nonport","wptr_sel_1_for_create_two"); @48
// &Force("nonport","wptr_sel_2"); @49

assign chgflow_valid_pre[2:0] = {rtu_had_xx_pcfifo_inst2_chgflow,
                                 rtu_had_xx_pcfifo_inst1_chgflow,
                                 rtu_had_xx_pcfifo_inst0_chgflow};

always@(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ctrl_pcfifo_wen_flop <= 1'b0;
  else
    ctrl_pcfifo_wen_flop <= ctrl_pcfifo_wen;
end

always@(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    chgflow_valid[2:0] <= 3'b0;
  else if (|chgflow_valid_pre[2:0])
    chgflow_valid[2:0] <= chgflow_valid_pre[2:0];
  else
    chgflow_valid[2:0] <= 3'b0;
end

always@(posedge cpuclk)
begin
  if (chgflow_valid_pre[0])
    pcfifo_din_0[WIDTH-1:0] <= {rtu_had_xx_pcfifo_inst0_next_pc[38:0], 1'b0};
end

always@(posedge cpuclk)
begin
  if (chgflow_valid_pre[1])
    pcfifo_din_1[WIDTH-1:0] <= {rtu_had_xx_pcfifo_inst1_next_pc[38:0], 1'b0};
end

always@(posedge cpuclk)
begin
  if (chgflow_valid_pre[2])
    pcfifo_din_2[WIDTH-1:0] <= {rtu_had_xx_pcfifo_inst2_next_pc[38:0], 1'b0};
end

assign inst0_chgflow_vld  = chgflow_valid[0] && ctrl_pcfifo_wen_flop;
assign inst1_chgflow_vld  = chgflow_valid[1] && ctrl_pcfifo_wen_flop;
assign inst2_chgflow_vld  = chgflow_valid[2] && ctrl_pcfifo_wen_flop;

assign create_vld   = |chgflow_valid[2:0] && ctrl_pcfifo_wen_flop;
                      
assign create_three = &chgflow_valid[2:0];

assign create_two   = (chgflow_valid[2:0] == 3'b110) ||
                      (chgflow_valid[2:0] == 3'b101) ||
                      (chgflow_valid[2:0] == 3'b011);

assign create_one   = (chgflow_valid[2:0] == 3'b100) ||
                      (chgflow_valid[2:0] == 3'b010) ||
                      (chgflow_valid[2:0] == 3'b001);

assign wptr_sel_0[DEPTH-1:0] = {{(DEPTH-1){1'b0}},1'b1} << wptr_0[PTR_WIDTH-2:0];
assign wptr_sel_1[DEPTH-1:0] = {{(DEPTH-1){1'b0}},1'b1} << wptr_1[PTR_WIDTH-2:0];
assign wptr_sel_2[DEPTH-1:0] = {{(DEPTH-1){1'b0}},1'b1} << wptr_2[PTR_WIDTH-2:0];

assign wptr_sel_1_for_create_two[DEPTH-1:0] = chgflow_valid[0] ? wptr_sel_1[DEPTH-1:0] : wptr_sel_0[DEPTH-1:0];

//csky vperl_off
reg     [WIDTH-1:0]  pcfifo_reg  [DEPTH-1:0];
genvar i;
generate
for(i=0; i<DEPTH; i=i+1) begin: PCFIFO_GEN
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pcfifo_reg[i][WIDTH-1:0] <= {WIDTH{1'b0}};
  else if (inst0_chgflow_vld && wptr_sel_0[i])
    pcfifo_reg[i][WIDTH-1:0] <= pcfifo_din_0[WIDTH-1:0];
  else if (inst1_chgflow_vld && (create_three && wptr_sel_1[i] || create_two && wptr_sel_1_for_create_two[i] || create_one && wptr_sel_0[i]))
    pcfifo_reg[i][WIDTH-1:0] <= pcfifo_din_1[WIDTH-1:0];
  else if (inst2_chgflow_vld && (create_three && wptr_sel_2[i] || create_two && wptr_sel_1[i] || create_one && wptr_sel_0[i]))
    pcfifo_reg[i][WIDTH-1:0] <= pcfifo_din_2[WIDTH-1:0];
  else 
    pcfifo_reg[i][WIDTH-1:0] <= pcfifo_reg[i][WIDTH-1:0];
end
end
endgenerate
//csky vperl_on

//==========================================================
//                   PCFIFO read
//==========================================================

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pcfifo_dout[WIDTH-1:0] <= {WIDTH{1'b0}};
//csky vperl_off
  else if (ctrl_pcfifo_ren)
    pcfifo_dout[WIDTH-1:0] <= pcfifo_reg[rptr[PTR_WIDTH-2:0]][WIDTH-1:0];
//csky vperl_on
  else
    pcfifo_dout[WIDTH-1:0] <= pcfifo_dout[WIDTH-1:0];
end

assign pcfifo_regs_data[DATAW-1:0] = mmu_xx_mmu_en ? {{(DATAW-WIDTH){pcfifo_dout[WIDTH-1]}},pcfifo_dout[WIDTH-1:0]} 
                                                   : {{(DATAW-WIDTH){1'b0}},pcfifo_dout[WIDTH-1:0]};

//==========================================================
//                 PCFIFO wptr maintenance
//==========================================================

// rptr always points to the oldest unread entry

assign pcfifo_empty = (wptr[PTR_WIDTH-2:0] == rptr[PTR_WIDTH-2:0]) &&
                      (wptr[PTR_WIDTH-1]   ~^ rptr[PTR_WIDTH-1]);

assign pcfifo_full  = (wptr[PTR_WIDTH-2:0] == rptr[PTR_WIDTH-2:0]) &&
                      (wptr[PTR_WIDTH-1]   ^  rptr[PTR_WIDTH-1]);

assign two_entry_left = (wptr_2[PTR_WIDTH-2:0] == rptr[PTR_WIDTH-2:0]) &&
                        (wptr_2[PTR_WIDTH-1]   ^  rptr[PTR_WIDTH-1]);

assign one_entry_left = (wptr_1[PTR_WIDTH-2:0] == rptr[PTR_WIDTH-2:0]) &&
                        (wptr_1[PTR_WIDTH-1]   ^  rptr[PTR_WIDTH-1]);

// wptr increase conditon:
//   1. write enable
//   2. read while pcfifo empty
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wptr[PTR_WIDTH-1:0] <= {PTR_WIDTH{1'b0}};
  else if (create_vld)
    wptr[PTR_WIDTH-1:0] <= wptr[PTR_WIDTH-1:0] + wptr_inc[PTR_WIDTH-1:0];
  else if (ctrl_pcfifo_ren && pcfifo_empty)
    wptr[PTR_WIDTH-1:0] <= wptr[PTR_WIDTH-1:0] + {{(PTR_WIDTH-1){1'b0}},1'b1};
  else
    wptr[PTR_WIDTH-1:0] <= wptr[PTR_WIDTH-1:0];
end

assign wptr_inc[PTR_WIDTH-1:0] = create_three 
                               ? {{(PTR_WIDTH-2){1'b0}},2'b11}
                               : create_two ? {{(PTR_WIDTH-2){1'b0}},2'b10} 
                                            : {{(PTR_WIDTH-2){1'b0}},2'b01};

assign wptr_0[PTR_WIDTH-1:0] = wptr[PTR_WIDTH-1:0];
assign wptr_1[PTR_WIDTH-1:0] = wptr[PTR_WIDTH-1:0] + {{(PTR_WIDTH-1){1'b0}},1'b1};
assign wptr_2[PTR_WIDTH-1:0] = wptr[PTR_WIDTH-1:0] + {{(PTR_WIDTH-2){1'b0}},2'b10};

//==========================================================
//                 PCFIFO rptr maintenance
//==========================================================
assign rptr_inc_3 = create_vld && 
                    pcfifo_full && create_three;
assign rptr_inc_2 = create_vld &&
                    (one_entry_left && create_three || 
                     pcfifo_full && create_two);
assign rptr_inc_1 = create_vld && 
                    (two_entry_left && create_three ||
                     one_entry_left && create_two ||
                     pcfifo_full && create_one) ||
                    ctrl_pcfifo_ren;

assign rptr_inc[PTR_WIDTH-1:0] = rptr_inc_3 
                               ? {{(PTR_WIDTH-2){1'b0}},2'b11}
                               : rptr_inc_2 ? {{(PTR_WIDTH-2){1'b0}},2'b10}
                                            : rptr_inc_1 ? {{(PTR_WIDTH-2){1'b0}},2'b01}
                                                         : {PTR_WIDTH{1'b0}};
// rptr increase condition:
//   1. read enable
//   2. write while pcfifo full

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rptr[PTR_WIDTH-1:0] <= {PTR_WIDTH{1'b0}};
  else if (ctrl_pcfifo_ren || create_vld)
    rptr[PTR_WIDTH-1:0] <= rptr[PTR_WIDTH-1:0] + rptr_inc[PTR_WIDTH-1:0];
  else
    rptr[PTR_WIDTH-1:0] <= rptr[PTR_WIDTH-1:0];
end

// &ModuleEnd; @229
endmodule



