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

// &ModuleBeg; @27
module ct_idu_id_fence(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_fence_id_inst_vld,
  ctrl_fence_id_stall,
  ctrl_fence_ir_pipe_empty,
  ctrl_fence_is_pipe_empty,
  dp_fence_id_bkpta_inst,
  dp_fence_id_bkptb_inst,
  dp_fence_id_fence_type,
  dp_fence_id_inst,
  dp_fence_id_pc,
  dp_fence_id_vl,
  dp_fence_id_vl_pred,
  dp_fence_id_vlmul,
  dp_fence_id_vsew,
  fence_ctrl_id_stall,
  fence_ctrl_inst0_vld,
  fence_ctrl_inst1_vld,
  fence_ctrl_inst2_vld,
  fence_dp_inst0_data,
  fence_dp_inst1_data,
  fence_dp_inst2_data,
  fence_top_cur_state,
  forever_cpuclk,
  idu_had_pipeline_empty,
  idu_hpcp_fence_sync_vld,
  idu_rtu_fence_idle,
  iu_idu_div_busy,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_pst_empty,
  rtu_idu_rob_empty
);

// &Ports; @28
input            cp0_idu_icg_en;               
input            cp0_yy_clk_en;                
input            cpurst_b;                     
input            ctrl_fence_id_inst_vld;       
input            ctrl_fence_id_stall;          
input            ctrl_fence_ir_pipe_empty;     
input            ctrl_fence_is_pipe_empty;     
input            dp_fence_id_bkpta_inst;       
input            dp_fence_id_bkptb_inst;       
input   [2  :0]  dp_fence_id_fence_type;       
input   [31 :0]  dp_fence_id_inst;             
input   [14 :0]  dp_fence_id_pc;               
input   [7  :0]  dp_fence_id_vl;               
input            dp_fence_id_vl_pred;          
input   [1  :0]  dp_fence_id_vlmul;            
input   [2  :0]  dp_fence_id_vsew;             
input            forever_cpuclk;               
input            iu_idu_div_busy;              
input            iu_yy_xx_cancel;              
input            pad_yy_icg_scan_en;           
input            rtu_idu_flush_fe;             
input            rtu_idu_pst_empty;            
input            rtu_idu_rob_empty;            
output           fence_ctrl_id_stall;          
output           fence_ctrl_inst0_vld;         
output           fence_ctrl_inst1_vld;         
output           fence_ctrl_inst2_vld;         
output  [177:0]  fence_dp_inst0_data;          
output  [177:0]  fence_dp_inst1_data;          
output  [177:0]  fence_dp_inst2_data;          
output  [2  :0]  fence_top_cur_state;          
output           idu_had_pipeline_empty;       
output           idu_hpcp_fence_sync_vld;      
output           idu_rtu_fence_idle;           

// &Regs; @29
reg     [2  :0]  fence_cur_state;              
reg     [177:0]  fence_dp_inst0_data;          
reg     [177:0]  fence_dp_inst1_data;          
reg     [177:0]  fence_dp_inst2_data;          
reg     [177:0]  fence_inst0_cp0_data;         
reg     [177:0]  fence_inst0_data;             
reg     [177:0]  fence_inst0_fence_data;       
reg     [177:0]  fence_inst0_sync_data;        
reg     [177:0]  fence_inst1_fence_data;       
reg     [177:0]  fence_inst2_sync_data;        
reg     [2  :0]  fence_next_state;             

// &Wires; @30
wire             cp0_idu_icg_en;               
wire             cp0_yy_clk_en;                
wire             cpurst_b;                     
wire             ctrl_fence_id_inst_vld;       
wire             ctrl_fence_id_stall;          
wire             ctrl_fence_ir_pipe_empty;     
wire             ctrl_fence_is_pipe_empty;     
wire             dp_fence_id_bkpta_inst;       
wire             dp_fence_id_bkptb_inst;       
wire    [2  :0]  dp_fence_id_fence_type;       
wire    [31 :0]  dp_fence_id_inst;             
wire    [14 :0]  dp_fence_id_pc;               
wire    [7  :0]  dp_fence_id_vl;               
wire             dp_fence_id_vl_pred;          
wire    [1  :0]  dp_fence_id_vlmul;            
wire    [2  :0]  dp_fence_id_vsew;             
wire             fence_clk;                    
wire             fence_clk_en;                 
wire             fence_ctrl_id_stall;          
wire             fence_ctrl_inst0_vld;         
wire             fence_ctrl_inst1_vld;         
wire             fence_ctrl_inst2_vld;         
wire    [31 :0]  fence_inst0_bar_opcode;       
wire             fence_inst0_cp0_csri;         
wire             fence_inst0_cp0_csrr;         
wire             fence_inst0_fence_fencei;     
wire             fence_inst0_fence_sfence_asid; 
wire             fence_inst0_fence_sfence_va;  
wire    [177:0]  fence_inst1_data;             
wire    [177:0]  fence_inst2_data;             
wire    [31 :0]  fence_inst2_sync_opcode;      
wire             fence_pipedown;               
wire             fence_pipeline_empty;         
wire             fence_sm_start;               
wire    [2  :0]  fence_top_cur_state;          
wire             forever_cpuclk;               
wire             idu_had_pipeline_empty;       
wire             idu_hpcp_fence_sync_vld;      
wire             idu_rtu_fence_idle;           
wire             iu_idu_div_busy;              
wire             iu_yy_xx_cancel;              
wire             pad_yy_icg_scan_en;           
wire             rtu_idu_flush_fe;             
wire             rtu_idu_pst_empty;            
wire             rtu_idu_rob_empty;            



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                 IR data path parameters
//----------------------------------------------------------
parameter IR_WIDTH            = 178;

parameter IR_VL_PRED          = 177;
parameter IR_VL               = 176;
parameter IR_VMB              = 168;
parameter IR_PC               = 167;
parameter IR_VSEW             = 152;
parameter IR_VLMUL            = 149;
parameter IR_FMLA             = 147;
parameter IR_SPLIT_NUM        = 146;
parameter IR_NO_SPEC          = 139;
parameter IR_MLA              = 138;
parameter IR_DST_X0           = 137;
parameter IR_ILLEGAL          = 136;
parameter IR_SPLIT_LAST       = 135;
parameter IR_VMLA             = 134;
parameter IR_IID_PLUS         = 133;
parameter IR_BKPTB_INST       = 129;
parameter IR_BKPTA_INST       = 128;
parameter IR_FMOV             = 127;
parameter IR_MOV              = 126;
parameter IR_EXPT             = 125;
parameter IR_LENGTH           = 118;
parameter IR_INTMASK          = 117;
parameter IR_SPLIT            = 116;
parameter IR_INST_TYPE        = 115;
parameter IR_DSTV_REG         = 105;
parameter IR_DSTV_VLD         = 99;
parameter IR_SRCVM_VLD        = 98;
parameter IR_SRCV2_VLD        = 97;
parameter IR_SRCV1_REG        = 96;
parameter IR_SRCV1_VLD        = 90;
parameter IR_SRCV0_REG        = 89;
parameter IR_SRCV0_VLD        = 83;
parameter IR_DSTE_VLD         = 82;
parameter IR_DSTF_REG         = 81;
parameter IR_DSTF_VLD         = 75;
parameter IR_SRCF2_REG        = 74;
parameter IR_SRCF2_VLD        = 68;
parameter IR_SRCF1_REG        = 67;
parameter IR_SRCF1_VLD        = 61;
parameter IR_SRCF0_REG        = 60;
parameter IR_SRCF0_VLD        = 54;
parameter IR_DST_REG          = 53;
parameter IR_DST_VLD          = 47;
parameter IR_SRC2_VLD         = 46;
parameter IR_SRC1_REG         = 45;
parameter IR_SRC1_VLD         = 39;
parameter IR_SRC0_REG         = 38;
parameter IR_SRC0_VLD         = 32;
parameter IR_OPCODE           = 31;

//----------------------------------------------------------
//                 Type parameters
//----------------------------------------------------------
parameter ALU      = 10'b0000000001;
parameter BJU      = 10'b0000000010;
parameter MULT     = 10'b0000000100;
parameter DIV      = 10'b0000001000;
parameter LSU_P5   = 10'b0000110000;
parameter LSU      = 10'b0000010000;
parameter PIPE67   = 10'b0001000000;
parameter PIPE6    = 10'b0010000000;
parameter PIPE7    = 10'b0100000000;
parameter SPECIAL  = 10'b1000000000;

//==========================================================
//                    Fence instructions 
//==========================================================
parameter IDLE        = 3'b000;
parameter WAIT_ISSUE  = 3'b001;
parameter ISSUE       = 3'b010;
parameter WAIT_CMPLT  = 3'b011;
parameter POP_INST    = 3'b100;

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign fence_clk_en = fence_sm_start
                      || (fence_cur_state[2:0] != IDLE);
// &Instance("gated_clk_cell", "x_fence_gated_clk"); @119
gated_clk_cell  x_fence_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fence_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fence_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @120
//          .external_en (1'b0), @121
//          .global_en   (cp0_yy_clk_en), @122
//          .module_en   (cp0_idu_icg_en), @123
//          .local_en    (fence_clk_en), @124
//          .clk_out     (fence_clk)); @125

//----------------------------------------------------------
//              control signal for fence FSM
//----------------------------------------------------------
assign fence_sm_start         = ctrl_fence_id_inst_vld
                                && !ctrl_fence_id_stall;
assign fence_pipeline_empty   = ctrl_fence_ir_pipe_empty
                                && ctrl_fence_is_pipe_empty
                                && rtu_idu_rob_empty
                                && !iu_idu_div_busy
                                && rtu_idu_pst_empty;
assign fence_pipedown         = fence_pipeline_empty;
assign idu_had_pipeline_empty = fence_pipeline_empty;

//----------------------------------------------------------
//             FSM of inst fence ctrl logic
//----------------------------------------------------------
// State Description:
// IDLE       : id stage instruction 0 is not fence instruction
//              or the first cycle to start fence FSM
// WAIT_ISSUE : wait backend pipeline empty
// ISSUE      : start to pipedown
// WAIT_CMPLT : wait this fence instruction complete
// POP_INST   : pop fence inst from id stage pipeline register

always @(posedge fence_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    fence_cur_state[2:0] <= IDLE;
  else if(rtu_idu_flush_fe)
    fence_cur_state[2:0] <= IDLE;
  else if(iu_yy_xx_cancel)
    fence_cur_state[2:0] <= IDLE;
  else
    fence_cur_state[2:0] <= fence_next_state[2:0];
end

// &CombBeg; @163
always @( fence_pipeline_empty
       or fence_pipedown
       or fence_cur_state[2:0]
       or fence_sm_start)
begin
  case(fence_cur_state[2:0])
  IDLE       : if(fence_sm_start)
                 fence_next_state[2:0] = WAIT_ISSUE;
               else
                fence_next_state[2:0] = IDLE;
  WAIT_ISSUE : if(fence_pipedown)
                 fence_next_state[2:0] = ISSUE;
               else
                 fence_next_state[2:0] = WAIT_ISSUE;
  ISSUE      :   fence_next_state[2:0] = WAIT_CMPLT;
  WAIT_CMPLT : if(fence_pipeline_empty)
                 fence_next_state[2:0] = POP_INST;
               else
                 fence_next_state[2:0] = WAIT_CMPLT;
  POP_INST   :   fence_next_state[2:0] = IDLE;
  default    :   fence_next_state[2:0] = IDLE;
  endcase
// &CombEnd; @181
end

//----------------------------------------------------------
//                   control signals
//----------------------------------------------------------
assign fence_ctrl_id_stall      = ctrl_fence_id_inst_vld
                                  && !fence_cur_state[2]; //POP_INST

assign fence_ctrl_inst0_vld     = (fence_cur_state[2:0] == ISSUE);

assign fence_ctrl_inst1_vld     = (fence_cur_state[2:0] == ISSUE)
                                  && dp_fence_id_fence_type[2]; //fence

assign fence_ctrl_inst2_vld     = (fence_cur_state[2:0] == ISSUE)
                                  && dp_fence_id_fence_type[2]; //fence

assign fence_top_cur_state[2:0] = fence_cur_state[2:0];

assign idu_rtu_fence_idle       = (fence_cur_state[2:0] == IDLE)
                               || (fence_cur_state[2:0] != IDLE)
                                  && dp_fence_id_fence_type[1]
                                  && !(dp_fence_id_inst[31:0] == 32'h10500073); //wfi

assign idu_hpcp_fence_sync_vld  = (fence_cur_state[2:0] == POP_INST)
                                  && (dp_fence_id_fence_type[0]
                                   || dp_fence_id_fence_type[2]);

//----------------------------------------------------------
//                  Sync Instuction: sync
//----------------------------------------------------------
// &CombBeg; @213
always @( dp_fence_id_inst[31:0])
begin
  fence_inst0_sync_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  fence_inst0_sync_data[IR_OPCODE:IR_OPCODE-31]      = dp_fence_id_inst[31:0];
  fence_inst0_sync_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  fence_inst0_sync_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @220
end

assign fence_inst2_sync_opcode[31:0] = 32'h01b0000b;

// &CombBeg; @224
always @( fence_inst2_sync_opcode[31:0])
begin
  fence_inst2_sync_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  fence_inst2_sync_data[IR_OPCODE:IR_OPCODE-31]      = fence_inst2_sync_opcode[31:0];
  fence_inst2_sync_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  fence_inst2_sync_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @231
end

//----------------------------------------------------------
//                 Fence Instuction: cp0
//----------------------------------------------------------
assign fence_inst0_cp0_csrr          = ({dp_fence_id_inst[14:12],dp_fence_id_inst[6:0]}
                                        == 10'b001_1110011) //csrrw
                                    || ({dp_fence_id_inst[14:12],dp_fence_id_inst[6:0]}
                                        == 10'b010_1110011) //csrrs
                                    || ({dp_fence_id_inst[14:12],dp_fence_id_inst[6:0]}
                                        == 10'b011_1110011); //csrrc

assign fence_inst0_cp0_csri          = ({dp_fence_id_inst[14:12],dp_fence_id_inst[6:0]}
                                        == 10'b101_1110011) //csrwi
                                    || ({dp_fence_id_inst[14:12],dp_fence_id_inst[6:0]}
                                        == 10'b110_1110011) //csrsi
                                    || ({dp_fence_id_inst[14:12],dp_fence_id_inst[6:0]}
                                        == 10'b111_1110011); //csrci

// &CombBeg; @250
always @( dp_fence_id_inst[31:0]
       or fence_inst0_cp0_csrr
       or fence_inst0_cp0_csri)
begin
  fence_inst0_cp0_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  fence_inst0_cp0_data[IR_OPCODE:IR_OPCODE-31]      = dp_fence_id_inst[31:0];
  fence_inst0_cp0_data[IR_INST_TYPE:IR_INST_TYPE-9] = SPECIAL;
  fence_inst0_cp0_data[IR_SRC0_VLD]                 = fence_inst0_cp0_csrr;
  fence_inst0_cp0_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,dp_fence_id_inst[19:15]};
  fence_inst0_cp0_data[IR_DST_VLD]                  = fence_inst0_cp0_csrr || fence_inst0_cp0_csri;
  fence_inst0_cp0_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,dp_fence_id_inst[11:7]};
  fence_inst0_cp0_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @261
end

//----------------------------------------------------------
//                 Fence Instuction: fence
//----------------------------------------------------------
assign fence_inst0_bar_opcode[31:0] = 32'h0ff0000f; //fence

// &CombBeg; @268
always @( fence_inst0_bar_opcode[31:0])
begin
  fence_inst0_fence_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  fence_inst0_fence_data[IR_OPCODE:IR_OPCODE-31]      = fence_inst0_bar_opcode[31:0];
  fence_inst0_fence_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  fence_inst0_fence_data[IR_LENGTH]                   = 1'b1;
  fence_inst0_fence_data[IR_SPLIT]                    = 1'b1;
  end
// &CombEnd; @276
end

assign fence_inst0_fence_fencei        = (dp_fence_id_inst[6:0] == 7'b0001111);
assign fence_inst0_fence_sfence_asid   = (dp_fence_id_inst[24:20] != 5'd0)
                                         && !fence_inst0_fence_fencei;
assign fence_inst0_fence_sfence_va     = (dp_fence_id_inst[19:15] != 5'd0)
                                         && !fence_inst0_fence_fencei;

// &CombBeg; @284
always @( dp_fence_id_inst[31:0]
       or fence_inst0_fence_sfence_asid
       or fence_inst0_fence_sfence_va)
begin
  fence_inst1_fence_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  fence_inst1_fence_data[IR_OPCODE:IR_OPCODE-31]      = dp_fence_id_inst[31:0];
  fence_inst1_fence_data[IR_INST_TYPE:IR_INST_TYPE-9] = fence_inst0_fence_sfence_asid
                                                        ? LSU_P5 : LSU;
  fence_inst1_fence_data[IR_SRC0_VLD]                 = fence_inst0_fence_sfence_va;
  fence_inst1_fence_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,dp_fence_id_inst[19:15]};
  fence_inst1_fence_data[IR_SRC1_VLD]                 = fence_inst0_fence_sfence_asid;
  fence_inst1_fence_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,dp_fence_id_inst[24:20]};
  fence_inst1_fence_data[IR_LENGTH]                   = 1'b1;
  fence_inst1_fence_data[IR_SPLIT]                    = 1'b1;
  end
// &CombEnd; @297
end

//==========================================================
//               Fence Instructions Selection
//==========================================================
//----------------------------------------------------------
//              MUX between fence instructions
//----------------------------------------------------------
// &CombBeg; @305
always @( fence_inst0_cp0_data[177:0]
       or fence_inst0_sync_data[177:0]
       or fence_inst0_fence_data[177:0]
       or dp_fence_id_fence_type[2:0])
begin
  case(dp_fence_id_fence_type[2:0])
    3'b001 : fence_inst0_data[IR_WIDTH-1:0] = fence_inst0_sync_data[IR_WIDTH-1:0];
    3'b010 : fence_inst0_data[IR_WIDTH-1:0] = fence_inst0_cp0_data[IR_WIDTH-1:0];
    3'b100 : fence_inst0_data[IR_WIDTH-1:0] = fence_inst0_fence_data[IR_WIDTH-1:0];
    default: fence_inst0_data[IR_WIDTH-1:0] = {IR_WIDTH{1'bx}};
  endcase
// &CombEnd; @312
end

assign fence_inst1_data[IR_WIDTH-1:0] = fence_inst1_fence_data[IR_WIDTH-1:0];

assign fence_inst2_data[IR_WIDTH-1:0] = fence_inst2_sync_data[IR_WIDTH-1:0];
//fence no inst2/3

//----------------------------------------------------------
//             Re-Pack into IR data path form
//----------------------------------------------------------
// &CombBeg; @322
always @( dp_fence_id_pc[14:0]
       or dp_fence_id_bkpta_inst
       or dp_fence_id_vl_pred
       or dp_fence_id_bkptb_inst
       or dp_fence_id_vl[7:0]
       or dp_fence_id_vlmul[1:0]
       or dp_fence_id_vsew[2:0]
       or fence_inst0_data[177:0])
begin
  fence_dp_inst0_data[IR_WIDTH-1:0]              = fence_inst0_data[IR_WIDTH-1:0];
  if(1'b1) begin
  fence_dp_inst0_data[IR_DST_X0]                 = (fence_inst0_data[IR_DST_REG:IR_DST_REG-5]
                                                   == 6'd0);
  fence_dp_inst0_data[IR_BKPTB_INST]             = dp_fence_id_bkptb_inst;
  fence_dp_inst0_data[IR_BKPTA_INST]             = dp_fence_id_bkpta_inst;
  fence_dp_inst0_data[IR_VLMUL:IR_VLMUL-1]       = dp_fence_id_vlmul[1:0];
  fence_dp_inst0_data[IR_VSEW:IR_VSEW-2]         = dp_fence_id_vsew[2:0];
  fence_dp_inst0_data[IR_VL:IR_VL-7]             = dp_fence_id_vl[7:0];
  fence_dp_inst0_data[IR_VL_PRED]                = dp_fence_id_vl_pred;
  fence_dp_inst0_data[IR_PC:IR_PC-14]            = dp_fence_id_pc[14:0];
  end
// &CombEnd; @335
end

// &CombBeg; @337
always @( fence_inst1_data[177:0]
       or dp_fence_id_pc[14:0]
       or dp_fence_id_vl_pred
       or dp_fence_id_bkpta_inst
       or dp_fence_id_bkptb_inst
       or dp_fence_id_vlmul[1:0]
       or dp_fence_id_vl[7:0]
       or dp_fence_id_vsew[2:0])
begin
  fence_dp_inst1_data[IR_WIDTH-1:0]              = fence_inst1_data[IR_WIDTH-1:0];
  if(1'b1) begin
  fence_dp_inst1_data[IR_DST_X0]                 = (fence_inst1_data[IR_DST_REG:IR_DST_REG-5]
                                                   == 6'd0);
  fence_dp_inst1_data[IR_BKPTB_INST]             = dp_fence_id_bkptb_inst;
  fence_dp_inst1_data[IR_BKPTA_INST]             = dp_fence_id_bkpta_inst;
  fence_dp_inst1_data[IR_VLMUL:IR_VLMUL-1]       = dp_fence_id_vlmul[1:0];
  fence_dp_inst1_data[IR_VSEW:IR_VSEW-2]         = dp_fence_id_vsew[2:0];
  fence_dp_inst1_data[IR_VL:IR_VL-7]             = dp_fence_id_vl[7:0];
  fence_dp_inst1_data[IR_VL_PRED]                = dp_fence_id_vl_pred;
  fence_dp_inst1_data[IR_PC:IR_PC-14]            = dp_fence_id_pc[14:0];
  end
// &CombEnd; @350
end

// &CombBeg; @352
always @( fence_inst2_data[177:0]
       or dp_fence_id_pc[14:0]
       or dp_fence_id_vl_pred
       or dp_fence_id_bkpta_inst
       or dp_fence_id_bkptb_inst
       or dp_fence_id_vlmul[1:0]
       or dp_fence_id_vl[7:0]
       or dp_fence_id_vsew[2:0])
begin
  fence_dp_inst2_data[IR_WIDTH-1:0]              = fence_inst2_data[IR_WIDTH-1:0];
  if(1'b1) begin
  fence_dp_inst2_data[IR_DST_X0]                 = (fence_inst2_data[IR_DST_REG:IR_DST_REG-5]
                                                   == 6'd0);
  fence_dp_inst2_data[IR_BKPTB_INST]             = dp_fence_id_bkptb_inst;
  fence_dp_inst2_data[IR_BKPTA_INST]             = dp_fence_id_bkpta_inst;
  fence_dp_inst2_data[IR_VLMUL:IR_VLMUL-1]       = dp_fence_id_vlmul[1:0];
  fence_dp_inst2_data[IR_VSEW:IR_VSEW-2]         = dp_fence_id_vsew[2:0];
  fence_dp_inst2_data[IR_VL:IR_VL-7]             = dp_fence_id_vl[7:0];
  fence_dp_inst2_data[IR_VL_PRED]                = dp_fence_id_vl_pred;
  fence_dp_inst2_data[IR_PC:IR_PC-14]            = dp_fence_id_pc[14:0];
  end
// &CombEnd; @365
end


// &ModuleEnd; @368
endmodule


