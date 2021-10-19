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
module ct_rtu_pst_vreg_entry(
  cp0_rtu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dealloc_vld_for_gateclk,
  idu_rtu_pst_dis_inst0_dstv_reg,
  idu_rtu_pst_dis_inst0_rel_vreg,
  idu_rtu_pst_dis_inst0_vreg_iid,
  idu_rtu_pst_dis_inst1_dstv_reg,
  idu_rtu_pst_dis_inst1_rel_vreg,
  idu_rtu_pst_dis_inst1_vreg_iid,
  idu_rtu_pst_dis_inst2_dstv_reg,
  idu_rtu_pst_dis_inst2_rel_vreg,
  idu_rtu_pst_dis_inst2_vreg_iid,
  idu_rtu_pst_dis_inst3_dstv_reg,
  idu_rtu_pst_dis_inst3_rel_vreg,
  idu_rtu_pst_dis_inst3_vreg_iid,
  ifu_xx_sync_reset,
  pad_yy_icg_scan_en,
  retire_pst_async_flush,
  retire_pst_wb_retire_inst0_vreg_vld,
  retire_pst_wb_retire_inst1_vreg_vld,
  retire_pst_wb_retire_inst2_vreg_vld,
  rob_pst_retire_inst0_gateclk_vld,
  rob_pst_retire_inst0_iid_updt_val,
  rob_pst_retire_inst1_gateclk_vld,
  rob_pst_retire_inst1_iid_updt_val,
  rob_pst_retire_inst2_gateclk_vld,
  rob_pst_retire_inst2_iid_updt_val,
  rtu_yy_xx_flush,
  vreg_top_clk,
  x_create_vld,
  x_cur_state_alloc_release,
  x_cur_state_dealloc,
  x_dealloc_mask,
  x_dealloc_vld,
  x_dreg,
  x_rel_vreg_expand,
  x_release_vld,
  x_reset_dstv_reg,
  x_reset_mapped,
  x_retired_released_wb,
  x_wb_vld
);

// &Ports; @28
input           cp0_rtu_icg_en;                     
input           cp0_yy_clk_en;                      
input           cpurst_b;                           
input           dealloc_vld_for_gateclk;            
input   [4 :0]  idu_rtu_pst_dis_inst0_dstv_reg;     
input   [5 :0]  idu_rtu_pst_dis_inst0_rel_vreg;     
input   [6 :0]  idu_rtu_pst_dis_inst0_vreg_iid;     
input   [4 :0]  idu_rtu_pst_dis_inst1_dstv_reg;     
input   [5 :0]  idu_rtu_pst_dis_inst1_rel_vreg;     
input   [6 :0]  idu_rtu_pst_dis_inst1_vreg_iid;     
input   [4 :0]  idu_rtu_pst_dis_inst2_dstv_reg;     
input   [5 :0]  idu_rtu_pst_dis_inst2_rel_vreg;     
input   [6 :0]  idu_rtu_pst_dis_inst2_vreg_iid;     
input   [4 :0]  idu_rtu_pst_dis_inst3_dstv_reg;     
input   [5 :0]  idu_rtu_pst_dis_inst3_rel_vreg;     
input   [6 :0]  idu_rtu_pst_dis_inst3_vreg_iid;     
input           ifu_xx_sync_reset;                  
input           pad_yy_icg_scan_en;                 
input           retire_pst_async_flush;             
input           retire_pst_wb_retire_inst0_vreg_vld; 
input           retire_pst_wb_retire_inst1_vreg_vld; 
input           retire_pst_wb_retire_inst2_vreg_vld; 
input           rob_pst_retire_inst0_gateclk_vld;   
input   [6 :0]  rob_pst_retire_inst0_iid_updt_val;  
input           rob_pst_retire_inst1_gateclk_vld;   
input   [6 :0]  rob_pst_retire_inst1_iid_updt_val;  
input           rob_pst_retire_inst2_gateclk_vld;   
input   [6 :0]  rob_pst_retire_inst2_iid_updt_val;  
input           rtu_yy_xx_flush;                    
input           vreg_top_clk;                       
input   [3 :0]  x_create_vld;                       
input           x_dealloc_mask;                     
input           x_dealloc_vld;                      
input           x_release_vld;                      
input   [4 :0]  x_reset_dstv_reg;                   
input           x_reset_mapped;                     
input           x_wb_vld;                           
output          x_cur_state_alloc_release;          
output          x_cur_state_dealloc;                
output  [31:0]  x_dreg;                             
output  [63:0]  x_rel_vreg_expand;                  
output          x_retired_released_wb;              

// &Regs; @29
reg     [4 :0]  create_dstv_reg;                    
reg     [6 :0]  create_iid;                         
reg     [5 :0]  create_rel_vreg;                    
reg     [4 :0]  dstv_reg;                           
reg     [6 :0]  iid;                                
reg     [4 :0]  lifecycle_cur_state;                
reg     [4 :0]  lifecycle_next_state;               
reg     [5 :0]  rel_vreg;                           
reg             retire_inst0_iid_match;             
reg             retire_inst1_iid_match;             
reg             retire_inst2_iid_match;             
reg             wb_cur_state;                       
reg             wb_next_state;                      

// &Wires; @30
wire            alloc_clk;                          
wire            alloc_clk_en;                       
wire            cp0_rtu_icg_en;                     
wire            cp0_yy_clk_en;                      
wire            cpurst_b;                           
wire            create_vld;                         
wire            dealloc_vld_for_gateclk;            
wire    [31:0]  dstv_reg_expand;                    
wire    [4 :0]  idu_rtu_pst_dis_inst0_dstv_reg;     
wire    [5 :0]  idu_rtu_pst_dis_inst0_rel_vreg;     
wire    [6 :0]  idu_rtu_pst_dis_inst0_vreg_iid;     
wire    [4 :0]  idu_rtu_pst_dis_inst1_dstv_reg;     
wire    [5 :0]  idu_rtu_pst_dis_inst1_rel_vreg;     
wire    [6 :0]  idu_rtu_pst_dis_inst1_vreg_iid;     
wire    [4 :0]  idu_rtu_pst_dis_inst2_dstv_reg;     
wire    [5 :0]  idu_rtu_pst_dis_inst2_rel_vreg;     
wire    [6 :0]  idu_rtu_pst_dis_inst2_vreg_iid;     
wire    [4 :0]  idu_rtu_pst_dis_inst3_dstv_reg;     
wire    [5 :0]  idu_rtu_pst_dis_inst3_rel_vreg;     
wire    [6 :0]  idu_rtu_pst_dis_inst3_vreg_iid;     
wire            ifu_xx_sync_reset;                  
wire            lifecycle_cur_state_alloc;          
wire            lifecycle_cur_state_dealloc;        
wire            lifecycle_cur_state_release;        
wire            lifecycle_cur_state_retire;         
wire            pad_yy_icg_scan_en;                 
wire            rel_retire_vld;                     
wire    [63:0]  rel_vreg_expand;                    
wire    [4 :0]  reset_lifecycle_state;              
wire            reset_wb_state;                     
wire            retire_gateclk_vld;                 
wire            retire_inst0_iid_match_updt_val;    
wire            retire_inst1_iid_match_updt_val;    
wire            retire_inst2_iid_match_updt_val;    
wire            retire_inst_iid_match_gateclk_en;   
wire            retire_pst_async_flush;             
wire            retire_pst_wb_retire_inst0_vreg_vld; 
wire            retire_pst_wb_retire_inst1_vreg_vld; 
wire            retire_pst_wb_retire_inst2_vreg_vld; 
wire            retire_vld;                         
wire            rob_pst_retire_inst0_gateclk_vld;   
wire    [6 :0]  rob_pst_retire_inst0_iid_updt_val;  
wire            rob_pst_retire_inst1_gateclk_vld;   
wire    [6 :0]  rob_pst_retire_inst1_iid_updt_val;  
wire            rob_pst_retire_inst2_gateclk_vld;   
wire    [6 :0]  rob_pst_retire_inst2_iid_updt_val;  
wire            rtu_yy_xx_flush;                    
wire            sm_clk;                             
wire            sm_clk_en;                          
wire            vreg_top_clk;                       
wire            wb_cur_state_wb;                    
wire            wb_cur_state_wb_masked;             
wire    [3 :0]  x_create_vld;                       
wire            x_cur_state_alloc_release;          
wire            x_cur_state_dealloc;                
wire            x_dealloc_mask;                     
wire            x_dealloc_vld;                      
wire    [31:0]  x_dreg;                             
wire    [63:0]  x_rel_vreg_expand;                  
wire            x_release_vld;                      
wire    [4 :0]  x_reset_dstv_reg;                   
wire            x_reset_mapped;                     
wire            x_retired_released_wb;              
wire            x_wb_vld;                           


parameter DEALLOC    = 5'b00001;
parameter WF_ALLOC   = 5'b00010;
parameter ALLOC      = 5'b00100;
parameter RETIRE     = 5'b01000;
parameter RELEASE    = 5'b10000;

parameter IDLE       = 1'b0;
parameter WB         = 1'b1;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign sm_clk_en = rtu_yy_xx_flush
                   || retire_pst_async_flush
                   || ifu_xx_sync_reset
                   || dealloc_vld_for_gateclk
                      && lifecycle_cur_state_dealloc
                   || (lifecycle_cur_state[4:0] == RETIRE)
                      && retire_gateclk_vld
//                      && x_release_vld
                   || x_wb_vld
                   || (lifecycle_cur_state[4:0] == WF_ALLOC)
                      && create_vld
                   || lifecycle_cur_state_alloc
                      && (retire_vld || retire_inst_iid_match_gateclk_en)
                   || lifecycle_cur_state_release
                      && wb_cur_state_wb
                   || lifecycle_cur_state_dealloc
                      && wb_cur_state_wb;
// &Instance("gated_clk_cell", "x_sm_gated_clk"); @61
gated_clk_cell  x_sm_gated_clk (
  .clk_in             (vreg_top_clk      ),
  .clk_out            (sm_clk            ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sm_clk_en         ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (vreg_top_clk), @62
//          .external_en (1'b0), @63
//          .global_en   (cp0_yy_clk_en), @64
//          .module_en   (cp0_rtu_icg_en), @65
//          .local_en    (sm_clk_en), @66
//          .clk_out     (sm_clk)); @67

assign alloc_clk_en = ifu_xx_sync_reset
                      || create_vld;
// &Instance("gated_clk_cell", "x_alloc_gated_clk"); @71
gated_clk_cell  x_alloc_gated_clk (
  .clk_in             (vreg_top_clk      ),
  .clk_out            (alloc_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (alloc_clk_en      ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (vreg_top_clk), @72
//          .external_en (1'b0), @73
//          .global_en   (cp0_yy_clk_en), @74
//          .module_en   (cp0_rtu_icg_en), @75
//          .local_en    (alloc_clk_en), @76
//          .clk_out     (alloc_clk)); @77

//==========================================================
//               Vreg Lifecycle State Machine
//==========================================================
assign reset_lifecycle_state[4:0] = (x_reset_mapped) ? RETIRE : DEALLOC;

//----------------------------------------------------------
//                  FSM of Vreg liftcycle                  
//----------------------------------------------------------
// State Description:
// DEALLOC    : vreg is released and written back, could
//              allocate to new producer
// WF_ALLOC   : vreg is in allocate vreg register
// ALLOC      : vreg is allocated to producer
// RETIRE     : producer is retired but vreg is not released
// RELEASE    : vreg is released

always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lifecycle_cur_state[4:0] <= DEALLOC;
  else if(ifu_xx_sync_reset)
    lifecycle_cur_state[4:0] <= reset_lifecycle_state[4:0];
  else
    lifecycle_cur_state[4:0] <= lifecycle_next_state[4:0];
end

// &CombBeg; @105
always @( retire_vld
       or wb_cur_state_wb_masked
       or x_dealloc_vld
       or rtu_yy_xx_flush
       or x_release_vld
       or lifecycle_cur_state[4:0]
       or create_vld)
begin
  case(lifecycle_cur_state[4:0])
    DEALLOC    : if(x_dealloc_vld && !rtu_yy_xx_flush)
                   lifecycle_next_state[4:0] = WF_ALLOC;
                 else
                   lifecycle_next_state[4:0] = DEALLOC;
    WF_ALLOC   : if(rtu_yy_xx_flush)
                   lifecycle_next_state[4:0] = DEALLOC;
                 else if(create_vld)
                   lifecycle_next_state[4:0] = ALLOC;
                 else
                   lifecycle_next_state[4:0] = WF_ALLOC;
    ALLOC      : if(rtu_yy_xx_flush)
                   lifecycle_next_state[4:0] = DEALLOC;
                 else if(x_release_vld && wb_cur_state_wb_masked)
                   lifecycle_next_state[4:0] = DEALLOC;
                 else if(x_release_vld)
                   lifecycle_next_state[4:0] = RELEASE;
                 else if(retire_vld)
                   lifecycle_next_state[4:0] = RETIRE;
                 else
                   lifecycle_next_state[4:0] = ALLOC;
    RETIRE     : if(x_release_vld && wb_cur_state_wb_masked)
                   lifecycle_next_state[4:0] = DEALLOC;
                 else if(x_release_vld)
                   lifecycle_next_state[4:0] = RELEASE;
                 else
                   lifecycle_next_state[4:0] = RETIRE;
    RELEASE    : if(wb_cur_state_wb_masked)
                   lifecycle_next_state[4:0] = DEALLOC;
                 else
                   lifecycle_next_state[4:0] = RELEASE;
    default    :   lifecycle_next_state[4:0] = DEALLOC;
  endcase
// &CombEnd; @139
end

//----------------------------------------------------------
//                    Control Siganls
//----------------------------------------------------------
assign lifecycle_cur_state_dealloc  = lifecycle_cur_state[0];
assign lifecycle_cur_state_alloc    = lifecycle_cur_state[2];
assign lifecycle_cur_state_retire   = lifecycle_cur_state[3];
assign lifecycle_cur_state_release  = lifecycle_cur_state[4];

assign x_cur_state_dealloc          = lifecycle_cur_state_dealloc;
assign x_cur_state_alloc_release    = lifecycle_cur_state_alloc
                                      || lifecycle_cur_state_release;

//==========================================================
//               Vreg Write Back State Machine
//==========================================================
assign reset_wb_state = (x_reset_mapped) ? WB : IDLE;

//----------------------------------------------------------
//                 FSM of Vreg write back                 
//----------------------------------------------------------
// State Description:
// IDLE       : vreg is not written back
// WB         : vreg is written back

always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_cur_state <= IDLE;
  else if(retire_pst_async_flush)
    wb_cur_state <= WB;
  else if(ifu_xx_sync_reset)
    wb_cur_state <= reset_wb_state;
  else if(create_vld)
    wb_cur_state <= IDLE;
  else
    wb_cur_state <= wb_next_state;
end

// &CombBeg; @179
always @( lifecycle_cur_state_dealloc
       or x_wb_vld
       or wb_cur_state)
begin
  case(wb_cur_state)
    IDLE       : if(x_wb_vld)
                   wb_next_state = WB;
                 else
                   wb_next_state = IDLE;
    WB         : if(lifecycle_cur_state_dealloc)
                   wb_next_state = IDLE;
                 else
                   wb_next_state = WB;
    default    :   wb_next_state = IDLE;
  endcase
// &CombEnd; @191
end

//----------------------------------------------------------
//                    Control Siganls
//----------------------------------------------------------
assign wb_cur_state_wb        = (wb_cur_state == WB);
assign wb_cur_state_wb_masked = (wb_cur_state == WB) && !x_dealloc_mask;

//==========================================================
//                    Vreg information
//==========================================================
//----------------------------------------------------------
//              Prepare allocate create data
//----------------------------------------------------------
assign create_vld = |x_create_vld[3:0];
// &CombBeg; @206
always @( idu_rtu_pst_dis_inst2_dstv_reg[4:0]
       or idu_rtu_pst_dis_inst0_dstv_reg[4:0]
       or idu_rtu_pst_dis_inst1_vreg_iid[6:0]
       or idu_rtu_pst_dis_inst0_vreg_iid[6:0]
       or idu_rtu_pst_dis_inst3_dstv_reg[4:0]
       or idu_rtu_pst_dis_inst0_rel_vreg[5:0]
       or idu_rtu_pst_dis_inst2_vreg_iid[6:0]
       or idu_rtu_pst_dis_inst2_rel_vreg[5:0]
       or idu_rtu_pst_dis_inst3_vreg_iid[6:0]
       or x_create_vld[3:0]
       or idu_rtu_pst_dis_inst1_dstv_reg[4:0]
       or idu_rtu_pst_dis_inst3_rel_vreg[5:0]
       or idu_rtu_pst_dis_inst1_rel_vreg[5:0])
begin
  case (x_create_vld[3:0])
    4'h1   : begin
               create_iid[6:0]      = idu_rtu_pst_dis_inst0_vreg_iid[6:0];
               create_dstv_reg[4:0] = idu_rtu_pst_dis_inst0_dstv_reg[4:0];
               create_rel_vreg[5:0] = idu_rtu_pst_dis_inst0_rel_vreg[5:0];
             end
    4'h2   : begin
               create_iid[6:0]      = idu_rtu_pst_dis_inst1_vreg_iid[6:0];
               create_dstv_reg[4:0] = idu_rtu_pst_dis_inst1_dstv_reg[4:0];
               create_rel_vreg[5:0] = idu_rtu_pst_dis_inst1_rel_vreg[5:0];
             end
    4'h4   : begin
               create_iid[6:0]      = idu_rtu_pst_dis_inst2_vreg_iid[6:0];
               create_dstv_reg[4:0] = idu_rtu_pst_dis_inst2_dstv_reg[4:0];
               create_rel_vreg[5:0] = idu_rtu_pst_dis_inst2_rel_vreg[5:0];
             end
    4'h8   : begin
               create_iid[6:0]      = idu_rtu_pst_dis_inst3_vreg_iid[6:0];
               create_dstv_reg[4:0] = idu_rtu_pst_dis_inst3_dstv_reg[4:0];
               create_rel_vreg[5:0] = idu_rtu_pst_dis_inst3_rel_vreg[5:0];
             end
    default: begin
               create_iid[6:0]      = {7{1'bx}};
               create_dstv_reg[4:0] = {5{1'bx}};
               create_rel_vreg[5:0] = {6{1'bx}};
             end
  endcase
// &CombEnd; @234
end

//----------------------------------------------------------
//                  Information Register
//----------------------------------------------------------
always @(posedge alloc_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    iid[6:0]      <= 7'd0;
    dstv_reg[4:0] <= 5'd0;
    rel_vreg[5:0] <= 6'd0;
  end 
  else if(ifu_xx_sync_reset) begin
    iid[6:0]      <= 7'd0;
    dstv_reg[4:0] <= x_reset_dstv_reg[4:0];
    rel_vreg[5:0] <= 6'd0;
  end 
  else if(create_vld) begin
    iid[6:0]      <= create_iid[6:0];
    dstv_reg[4:0] <= create_dstv_reg[4:0];
    rel_vreg[5:0] <= create_rel_vreg[5:0];
  end
  else begin
    iid[6:0]      <= iid[6:0];
    dstv_reg[4:0] <= dstv_reg[4:0];
    rel_vreg[5:0] <= rel_vreg[5:0];
  end
end

//----------------------------------------------------------
//                Retire IID Match Register
//----------------------------------------------------------
//timing optimization: compare retire inst iid before retire
assign retire_inst0_iid_match_updt_val =
         lifecycle_cur_state_alloc
         && (iid[6:0] == rob_pst_retire_inst0_iid_updt_val[6:0]);
assign retire_inst1_iid_match_updt_val =
         lifecycle_cur_state_alloc 
         && (iid[6:0] == rob_pst_retire_inst1_iid_updt_val[6:0]);
assign retire_inst2_iid_match_updt_val =
         lifecycle_cur_state_alloc 
         && (iid[6:0] == rob_pst_retire_inst2_iid_updt_val[6:0]);

assign retire_inst_iid_match_gateclk_en =
            rob_pst_retire_inst0_gateclk_vld
         || rob_pst_retire_inst1_gateclk_vld
         || rob_pst_retire_inst2_gateclk_vld;

always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_inst0_iid_match <= 1'b0;
  else if(ifu_xx_sync_reset)
    retire_inst0_iid_match <= 1'b0;
  else if(rob_pst_retire_inst0_gateclk_vld)
    retire_inst0_iid_match <= retire_inst0_iid_match_updt_val;
  else
    retire_inst0_iid_match <= retire_inst0_iid_match;
end

always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_inst1_iid_match <= 1'b0;
  else if(ifu_xx_sync_reset)
    retire_inst1_iid_match <= 1'b0;
  else if(rob_pst_retire_inst1_gateclk_vld)
    retire_inst1_iid_match <= retire_inst1_iid_match_updt_val;
  else
    retire_inst1_iid_match <= retire_inst1_iid_match;
end

always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_inst2_iid_match <= 1'b0;
  else if(ifu_xx_sync_reset)
    retire_inst2_iid_match <= 1'b0;
  else if(rob_pst_retire_inst2_gateclk_vld)
    retire_inst2_iid_match <= retire_inst2_iid_match_updt_val;
  else
    retire_inst2_iid_match <= retire_inst2_iid_match;
end

//==========================================================
//                       Retire signal
//==========================================================
assign retire_vld = retire_pst_wb_retire_inst0_vreg_vld
                    && retire_inst0_iid_match
                 || retire_pst_wb_retire_inst1_vreg_vld
                    && retire_inst1_iid_match
                 || retire_pst_wb_retire_inst2_vreg_vld
                    && retire_inst2_iid_match;
assign retire_gateclk_vld = retire_pst_wb_retire_inst0_vreg_vld
                         || retire_pst_wb_retire_inst1_vreg_vld
                         || retire_pst_wb_retire_inst2_vreg_vld;

//==========================================================
//                      Release signal
//==========================================================
// &ConnRule(s/^x_num/rel_vreg/); @334
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_rel_vreg"); @335
ct_rtu_expand_64  x_ct_rtu_expand_64_rel_vreg (
  .x_num           (rel_vreg       ),
  .x_num_expand    (rel_vreg_expand)
);

//iid match is already AND with cur state alloc
assign rel_retire_vld = lifecycle_cur_state_alloc && retire_vld;

assign x_rel_vreg_expand[63:0] = 
         {64{rel_retire_vld}} & rel_vreg_expand[63:0];

//==========================================================
//              Rename Table Recovery signal
//==========================================================
// &ConnRule(s/^x_num/dstv_reg/); @345
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_dstv_reg"); @346
ct_rtu_expand_32  x_ct_rtu_expand_32_dstv_reg (
  .x_num           (dstv_reg       ),
  .x_num_expand    (dstv_reg_expand)
);


assign x_dreg[31:0] = {32{lifecycle_cur_state_retire}}
                      & dstv_reg_expand[31:0];

//==========================================================
//          Fast Retired Instruction Write Back
//==========================================================
//this signal will be used at retiring cycle by FLUSH state machine
//should consider the retiring insts
assign x_retired_released_wb = (lifecycle_cur_state_alloc
                                   && retire_vld
                                || lifecycle_cur_state_retire
                                || lifecycle_cur_state_release)
                               ? wb_cur_state_wb : 1'b1;


// &ModuleEnd; @374
endmodule


