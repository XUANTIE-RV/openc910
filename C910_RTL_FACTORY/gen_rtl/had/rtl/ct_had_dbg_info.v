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
module ct_had_dbg_info(
  cp0_had_debug_info,
  cpuclk,
  cpurst_b,
  ctrl_dbgfifo_ren,
  ctrl_pipefifo_ren,
  ctrl_pipefifo_wen,
  dbgfifo_regs_data,
  had_idu_debug_id_inst_en,
  had_lsu_dbg_info_en,
  had_rtu_debug_retire_info_en,
  idu_had_debug_info,
  idu_had_id_inst0_info,
  idu_had_id_inst0_vld,
  idu_had_id_inst1_info,
  idu_had_id_inst1_vld,
  idu_had_id_inst2_info,
  idu_had_id_inst2_vld,
  ifu_had_debug_info,
  ir_xx_pipesel_reg_sel,
  ir_xx_wdata,
  iu_had_debug_info,
  lsu_had_debug_info,
  lsu_had_st_addr,
  lsu_had_st_data,
  lsu_had_st_req,
  mmu_had_debug_info,
  pipefifo_regs_data,
  pipesel_regs_data,
  rtu_had_dbg_ack_info,
  rtu_had_debug_info,
  rtu_had_retire_inst0_info,
  rtu_had_retire_inst0_vld,
  rtu_had_retire_inst1_info,
  rtu_had_retire_inst1_vld,
  rtu_had_retire_inst2_info,
  rtu_had_retire_inst2_vld,
  x_dbg_ack_pc,
  x_sm_xx_update_dr_en
);

// &Ports; @24
input   [3  :0]  cp0_had_debug_info;          
input            cpuclk;                      
input            cpurst_b;                    
input            ctrl_dbgfifo_ren;            
input            ctrl_pipefifo_ren;           
input            ctrl_pipefifo_wen;           
input   [49 :0]  idu_had_debug_info;          
input   [39 :0]  idu_had_id_inst0_info;       
input            idu_had_id_inst0_vld;        
input   [39 :0]  idu_had_id_inst1_info;       
input            idu_had_id_inst1_vld;        
input   [39 :0]  idu_had_id_inst2_info;       
input            idu_had_id_inst2_vld;        
input   [82 :0]  ifu_had_debug_info;          
input            ir_xx_pipesel_reg_sel;       
input   [63 :0]  ir_xx_wdata;                 
input   [9  :0]  iu_had_debug_info;           
input   [183:0]  lsu_had_debug_info;          
input   [39 :0]  lsu_had_st_addr;             
input   [63 :0]  lsu_had_st_data;             
input            lsu_had_st_req;              
input   [33 :0]  mmu_had_debug_info;          
input            rtu_had_dbg_ack_info;        
input   [42 :0]  rtu_had_debug_info;          
input   [63 :0]  rtu_had_retire_inst0_info;   
input            rtu_had_retire_inst0_vld;    
input   [63 :0]  rtu_had_retire_inst1_info;   
input            rtu_had_retire_inst1_vld;    
input   [63 :0]  rtu_had_retire_inst2_info;   
input            rtu_had_retire_inst2_vld;    
input            x_sm_xx_update_dr_en;        
output  [63 :0]  dbgfifo_regs_data;           
output           had_idu_debug_id_inst_en;    
output           had_lsu_dbg_info_en;         
output           had_rtu_debug_retire_info_en; 
output  [63 :0]  pipefifo_regs_data;          
output  [31 :0]  pipesel_regs_data;           
output           x_dbg_ack_pc;                

// &Regs; @25
reg              dbg_ack_pc_f;                
reg     [2  :0]  dbg_read_ptr;                
reg     [63 :0]  dbginfo_dout;                
reg     [63 :0]  pipefifo_din_0;              
reg     [63 :0]  pipefifo_din_1;              
reg     [63 :0]  pipefifo_din_2;              
reg     [63 :0]  pipefifo_dout;               
reg     [2  :0]  pipefifo_sel;                
reg     [1  :0]  pipesel;                     
reg     [4  :0]  rptr;                        
reg     [4  :0]  wptr;                        
reg     [407:0]  xx_dbg_info_reg;             

// &Wires; @26
wire    [3  :0]  cp0_had_debug_info;          
wire             cpuclk;                      
wire             cpurst_b;                    
wire             create_one;                  
wire             create_thr;                  
wire             create_two;                  
wire             create_vld;                  
wire             ctrl_dbgfifo_ren;            
wire             ctrl_pipefifo_ren;           
wire             ctrl_pipefifo_wen;           
wire             dbg_rptr_done;               
wire    [63 :0]  dbgfifo_regs_data;           
wire             had_idu_debug_id_inst_en;    
wire             had_lsu_dbg_info_en;         
wire             had_rtu_debug_retire_info_en; 
wire    [49 :0]  idu_had_debug_info;          
wire    [39 :0]  idu_had_id_inst0_info;       
wire             idu_had_id_inst0_vld;        
wire    [39 :0]  idu_had_id_inst1_info;       
wire             idu_had_id_inst1_vld;        
wire    [39 :0]  idu_had_id_inst2_info;       
wire             idu_had_id_inst2_vld;        
wire    [2  :0]  idu_pipe_vld;                
wire    [82 :0]  ifu_had_debug_info;          
wire             ir_xx_pipesel_reg_sel;       
wire    [63 :0]  ir_xx_wdata;                 
wire    [9  :0]  iu_had_debug_info;           
wire    [183:0]  lsu_had_debug_info;          
wire    [39 :0]  lsu_had_st_addr;             
wire    [63 :0]  lsu_had_st_data;             
wire             lsu_had_st_req;              
wire    [2  :0]  lsu_pipe_vld;                
wire    [33 :0]  mmu_had_debug_info;          
wire             one_entry_left;              
wire             pipefifo_empty;              
wire             pipefifo_full;               
wire    [63 :0]  pipefifo_regs_data;          
wire    [2  :0]  pipefifo_wen;                
wire    [31 :0]  pipesel_regs_data;           
wire    [4  :0]  rptr_inc;                    
wire             rptr_inc_1;                  
wire             rptr_inc_2;                  
wire             rptr_inc_3;                  
wire             rtu_had_dbg_ack_info;        
wire    [42 :0]  rtu_had_debug_info;          
wire    [63 :0]  rtu_had_retire_inst0_info;   
wire             rtu_had_retire_inst0_vld;    
wire    [63 :0]  rtu_had_retire_inst1_info;   
wire             rtu_had_retire_inst1_vld;    
wire    [63 :0]  rtu_had_retire_inst2_info;   
wire             rtu_had_retire_inst2_vld;    
wire    [2  :0]  rtu_pipe_vld;                
wire             two_entry_left;              
wire    [4  :0]  wptr_0;                      
wire    [4  :0]  wptr_1;                      
wire    [4  :0]  wptr_2;                      
wire    [4  :0]  wptr_inc;                    
wire    [15 :0]  wptr_sel_0;                  
wire    [15 :0]  wptr_sel_1;                  
wire    [15 :0]  wptr_sel_2;                  
wire             x_dbg_ack_pc;                
wire             x_sm_xx_update_dr_en;        
wire    [407:0]  xx_dgb_info;                 


// &Force("nonport","pipefifo_din_0"); @28
// &Force("nonport","pipefifo_din_1"); @29
// &Force("nonport","pipefifo_din_2"); @30
// &Force("nonport","wptr_sel_0"); @31
// &Force("nonport","wptr_sel_1"); @32
// &Force("nonport","wptr_sel_2"); @33
// &Force("nonport","xx_dbg_info_reg"); @34

//==============================================================================
//            PIPESEL REG
//==============================================================================
// &Force("bus","ir_xx_wdata",63,0); @39
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pipesel[1:0] <= 2'b0;
  else if (x_sm_xx_update_dr_en && ir_xx_pipesel_reg_sel)
    pipesel[1:0] <= ir_xx_wdata[1:0];
end

assign pipesel_regs_data[31:0] = {30'b0, pipesel[1:0]};

assign had_idu_debug_id_inst_en     = (pipesel[1:0] == 2'b01) && ctrl_pipefifo_wen;
assign had_rtu_debug_retire_info_en = (pipesel[1:0] == 2'b10) && ctrl_pipefifo_wen;
assign had_lsu_dbg_info_en          = (pipesel[1:0] == 2'b11) && ctrl_pipefifo_wen;

//==============================================================================
//               PIPEFIFO REG
//==============================================================================
parameter PTR_WIDTH = 5;
parameter WIDTH     = 64;
parameter DEPTH     = 16;

assign idu_pipe_vld[2:0] = {idu_had_id_inst2_vld,idu_had_id_inst1_vld,idu_had_id_inst0_vld};
assign rtu_pipe_vld[2:0] = {rtu_had_retire_inst2_vld,rtu_had_retire_inst1_vld,rtu_had_retire_inst0_vld};
assign lsu_pipe_vld[2:0] = {1'b0,{2{lsu_had_st_req}}};

// &CombBeg; @65
always @( lsu_pipe_vld[2:0]
       or lsu_had_st_data[63:0]
       or rtu_had_retire_inst2_info[63:0]
       or rtu_had_retire_inst1_info[63:0]
       or rtu_had_retire_inst0_info[63:0]
       or idu_had_id_inst1_info[39:0]
       or rtu_pipe_vld[2:0]
       or pipesel[1:0]
       or idu_pipe_vld[2:0]
       or idu_had_id_inst0_info[39:0]
       or idu_had_id_inst2_info[39:0]
       or lsu_had_st_addr[39:0])
begin
  case(pipesel[1:0])
  2'b01: begin pipefifo_sel[2:0] = idu_pipe_vld[2:0]; pipefifo_din_0[WIDTH-1:0] = {24'b0,idu_had_id_inst0_info[39:0]}; 
                                                      pipefifo_din_1[WIDTH-1:0] = {24'b0,idu_had_id_inst1_info[39:0]}; 
                                                      pipefifo_din_2[WIDTH-1:0] = {24'b0,idu_had_id_inst2_info[39:0]}; 
         end
  2'b10: begin pipefifo_sel[2:0] = rtu_pipe_vld[2:0]; pipefifo_din_0[WIDTH-1:0] = rtu_had_retire_inst0_info[63:0];
                                                      pipefifo_din_1[WIDTH-1:0] = rtu_had_retire_inst1_info[63:0]; 
                                                      pipefifo_din_2[WIDTH-1:0] = rtu_had_retire_inst2_info[63:0];
         end
  2'b11: begin pipefifo_sel[2:0] = lsu_pipe_vld[2:0]; pipefifo_din_0[WIDTH-1:0] = lsu_had_st_data[63:0];
                                                      pipefifo_din_1[WIDTH-1:0] = {24'b0,lsu_had_st_addr[39:0]};
                                                      pipefifo_din_2[WIDTH-1:0] = {WIDTH{1'b0}};
         end
  default:begin pipefifo_sel[2:0] = 3'b0;             pipefifo_din_0[WIDTH-1:0] = {WIDTH{1'b0}};
                                                      pipefifo_din_1[WIDTH-1:0] = {WIDTH{1'b0}};
                                                      pipefifo_din_2[WIDTH-1:0] = {WIDTH{1'b0}};
          end
  endcase
// &CombEnd; @84
end

assign pipefifo_wen[2:0] = pipefifo_sel[2:0] & {3{ctrl_pipefifo_wen}};

assign create_vld = |pipefifo_wen[2:0];
assign create_one = pipefifo_wen[2:0] == 3'b001;
assign create_two = pipefifo_wen[2:0] == 3'b011;
assign create_thr = pipefifo_wen[2:0] == 3'b111;

assign wptr_sel_0[DEPTH-1:0] = {{(DEPTH-1){1'b0}},1'b1} << wptr_0[PTR_WIDTH-2:0];
assign wptr_sel_1[DEPTH-1:0] = {{(DEPTH-1){1'b0}},1'b1} << wptr_1[PTR_WIDTH-2:0];
assign wptr_sel_2[DEPTH-1:0] = {{(DEPTH-1){1'b0}},1'b1} << wptr_2[PTR_WIDTH-2:0];

//csky vperl_off
reg     [WIDTH-1:0]  pipefifo_reg[DEPTH-1:0];
genvar i;
generate
for(i=0; i<DEPTH; i=i+1) begin: PCFIFO_GEN
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pipefifo_reg[i][WIDTH-1:0] <= {WIDTH{1'b0}};
  else if (pipefifo_wen[0] && wptr_sel_0[i])
    pipefifo_reg[i][WIDTH-1:0] <= pipefifo_din_0[WIDTH-1:0];
  else if (pipefifo_wen[1] && wptr_sel_1[i])
    pipefifo_reg[i][WIDTH-1:0] <= pipefifo_din_1[WIDTH-1:0];
  else if (pipefifo_wen[2] && wptr_sel_2[i])
    pipefifo_reg[i][WIDTH-1:0] <= pipefifo_din_2[WIDTH-1:0];
  else
    pipefifo_reg[i][WIDTH-1:0] <= pipefifo_reg[i][WIDTH-1:0];
end
end
endgenerate
//csky vperl_on

//==========================================================
//                   PIPEFIFO read
//==========================================================

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pipefifo_dout[WIDTH-1:0] <= {WIDTH{1'b0}};
//csky vperl_off
  else if (ctrl_pipefifo_ren)
    pipefifo_dout[WIDTH-1:0] <= pipefifo_reg[rptr[PTR_WIDTH-2:0]][WIDTH-1:0];
//csky vperl_on
  else
    pipefifo_dout[WIDTH-1:0] <= pipefifo_dout[WIDTH-1:0];
end

assign pipefifo_regs_data[WIDTH-1:0] = pipefifo_dout[WIDTH-1:0];


//==========================================================
//       Read pointer maintenance
//==========================================================

assign pipefifo_empty = (wptr[PTR_WIDTH-2:0] == rptr[PTR_WIDTH-2:0]) &&
                        (wptr[PTR_WIDTH-1]   ~^ rptr[PTR_WIDTH-1]);

assign pipefifo_full = (wptr[PTR_WIDTH-2:0] == rptr[PTR_WIDTH-2:0]) &&
                       (wptr[PTR_WIDTH-1]   ^  rptr[PTR_WIDTH-1]);

assign two_entry_left = (wptr_2[PTR_WIDTH-2:0] == rptr[PTR_WIDTH-2:0]) &&
                        (wptr_2[PTR_WIDTH-1]   ^  rptr[PTR_WIDTH-1]);

assign one_entry_left = (wptr_1[PTR_WIDTH-2:0] == rptr[PTR_WIDTH-2:0]) &&
                        (wptr_1[PTR_WIDTH-1]   ^  rptr[PTR_WIDTH-1]);

assign rptr_inc_3 = create_vld && pipefifo_full && create_thr;
assign rptr_inc_2 = create_vld && (one_entry_left && create_thr ||
                                   pipefifo_full && create_two);
assign rptr_inc_1 = create_vld && (two_entry_left && create_thr ||
                                   one_entry_left && create_two ||
                                   pipefifo_full && create_one) 
                  || ctrl_pipefifo_ren;

assign rptr_inc[PTR_WIDTH-1:0] = rptr_inc_3
                               ? {{(PTR_WIDTH-2){1'b0}},2'b11}
                               : rptr_inc_2 ? {{(PTR_WIDTH-2){1'b0}},2'b10}
                                            : rptr_inc_1 ? {{(PTR_WIDTH-2){1'b0}},2'b01}
                                                         : {PTR_WIDTH{1'b0}};

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rptr[PTR_WIDTH-1:0] <= {PTR_WIDTH{1'b0}};
  else if (ctrl_pipefifo_ren || create_vld)
    rptr[PTR_WIDTH-1:0] <= rptr[PTR_WIDTH-1:0] + rptr_inc[PTR_WIDTH-1:0];
  else
    rptr[PTR_WIDTH-1:0] <= rptr[PTR_WIDTH-1:0];
end

//==========================================================
//       Write pointer maintenance
//==========================================================

assign wptr_inc[PTR_WIDTH-1:0] =  create_thr
                               ? {{(PTR_WIDTH-2){1'b0}},2'b11}
                               : create_two ? {{(PTR_WIDTH-2){1'b0}},2'b10}
                                            : {{(PTR_WIDTH-2){1'b0}},2'b01};

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wptr[PTR_WIDTH-1:0] <= {PTR_WIDTH{1'b0}};
  else if (create_vld)
    wptr[PTR_WIDTH-1:0] <= wptr[PTR_WIDTH-1:0] + wptr_inc[PTR_WIDTH-1:0];
  else if (ctrl_pipefifo_ren && pipefifo_empty)
    wptr[PTR_WIDTH-1:0] <= wptr[PTR_WIDTH-1:0] + {{(PTR_WIDTH-1){1'b0}},1'b1};
  else
    wptr[PTR_WIDTH-1:0] <= wptr[PTR_WIDTH-1:0];
end

assign wptr_0[PTR_WIDTH-1:0] = wptr[PTR_WIDTH-1:0];
assign wptr_1[PTR_WIDTH-1:0] = wptr[PTR_WIDTH-1:0] + {{(PTR_WIDTH-1){1'b0}},1'b1};
assign wptr_2[PTR_WIDTH-1:0] = wptr[PTR_WIDTH-1:0] + {{(PTR_WIDTH-2){1'b0}},2'b10};


//==============================================================================
//                   DBGINFO FIFO read
//==============================================================================
parameter DBG_WIDTH = 64;
parameter DBG_RPTR  = 3;
parameter DBG_DPETH = 7;
//csky vperl_off
wire     [DBG_WIDTH-1:0]  dbginfo_reg[DBG_DPETH-1:0];
assign dbginfo_reg[0][63:0] = xx_dbg_info_reg[63:0];
assign dbginfo_reg[1][63:0] = xx_dbg_info_reg[127:64];
assign dbginfo_reg[2][63:0] = xx_dbg_info_reg[191:128];
assign dbginfo_reg[3][63:0] = xx_dbg_info_reg[255:192];
assign dbginfo_reg[4][63:0] = xx_dbg_info_reg[319:256];
assign dbginfo_reg[5][63:0] = xx_dbg_info_reg[383:320];
assign dbginfo_reg[6][63:0] = {40'b0, xx_dbg_info_reg[407:384]};
//csky vperl_on

// &Force("input","ctrl_dbgfifo_ren"); @221
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbginfo_dout[DBG_WIDTH-1:0] <= {DBG_WIDTH{1'b0}};
//csky vperl_off
  else if (ctrl_dbgfifo_ren)
    dbginfo_dout[DBG_WIDTH-1:0] <= dbginfo_reg[dbg_read_ptr[DBG_RPTR-1:0]][DBG_WIDTH-1:0];
//csky vperl_on
  else
    dbginfo_dout[DBG_WIDTH-1:0] <= dbginfo_dout[DBG_WIDTH-1:0];
end

assign dbgfifo_regs_data[DBG_WIDTH-1:0] = dbginfo_dout[DBG_WIDTH-1:0];


//==========================================================
//                 DBGINFO FIFO write
//==========================================================
assign xx_dgb_info[407:0] = {mmu_had_debug_info[33:0],
                             rtu_had_debug_info[42:0],
                             cp0_had_debug_info[3:0],
                             iu_had_debug_info[9:0],
                             idu_had_debug_info[49:0],
                             lsu_had_debug_info[183:0],
                             ifu_had_debug_info[82:0]};

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)begin
    dbg_ack_pc_f  <= 1'b0;
  end
  else begin
    dbg_ack_pc_f  <= rtu_had_dbg_ack_info;
  end
end

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    xx_dbg_info_reg[407:0] <= 408'b0;
  else if (dbg_ack_pc_f)
    xx_dbg_info_reg[407:0] <= xx_dgb_info[407:0];
end

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbg_read_ptr[DBG_RPTR-1:0] <= {DBG_RPTR{1'b0}};
  else if (ctrl_dbgfifo_ren)
    dbg_read_ptr[DBG_RPTR-1:0] <= dbg_read_ptr[DBG_RPTR-1:0] + 4'b1;
  else if (dbg_rptr_done)
    dbg_read_ptr[DBG_RPTR-1:0] <= {DBG_RPTR{1'b0}};
  else
    dbg_read_ptr[DBG_RPTR-1:0] <= dbg_read_ptr[DBG_RPTR-1:0];
end
assign dbg_rptr_done = dbg_read_ptr[DBG_RPTR-1:0] == DBG_DPETH;

// &Force("input", "x_dbg_ack_pc_ack"); @288
// &Force("input", "forever_coreclk"); @289
// &Force("nonport", "x_dbg_ack_pc_ack_sync"); @290
assign x_dbg_ack_pc = dbg_ack_pc_f;

// &ModuleEnd; @305
endmodule



