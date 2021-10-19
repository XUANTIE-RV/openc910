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
module ct_rtu_rob_entry(
  cp0_rtu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_rtu_rob_create0_data,
  idu_rtu_rob_create1_data,
  idu_rtu_rob_create2_data,
  idu_rtu_rob_create3_data,
  lsu_misc_cmplt_gateclk_en,
  lsu_rtu_wb_pipe3_bkpta_data,
  lsu_rtu_wb_pipe3_bkptb_data,
  lsu_rtu_wb_pipe3_no_spec_hit,
  lsu_rtu_wb_pipe3_no_spec_mispred,
  lsu_rtu_wb_pipe3_no_spec_miss,
  lsu_rtu_wb_pipe4_bkpta_data,
  lsu_rtu_wb_pipe4_bkptb_data,
  lsu_rtu_wb_pipe4_no_spec_hit,
  lsu_rtu_wb_pipe4_no_spec_mispred,
  lsu_rtu_wb_pipe4_no_spec_miss,
  pad_yy_icg_scan_en,
  retire_rob_flush,
  retire_rob_flush_gateclk,
  x_cmplt_gateclk_vld,
  x_cmplt_vld,
  x_create_dp_en,
  x_create_en,
  x_create_gateclk_en,
  x_create_sel,
  x_pop_en,
  x_read_data
);

// &Ports; @28
input           cp0_rtu_icg_en;                  
input           cp0_yy_clk_en;                   
input           cpurst_b;                        
input           forever_cpuclk;                  
input   [39:0]  idu_rtu_rob_create0_data;        
input   [39:0]  idu_rtu_rob_create1_data;        
input   [39:0]  idu_rtu_rob_create2_data;        
input   [39:0]  idu_rtu_rob_create3_data;        
input           lsu_misc_cmplt_gateclk_en;       
input           lsu_rtu_wb_pipe3_bkpta_data;     
input           lsu_rtu_wb_pipe3_bkptb_data;     
input           lsu_rtu_wb_pipe3_no_spec_hit;    
input           lsu_rtu_wb_pipe3_no_spec_mispred; 
input           lsu_rtu_wb_pipe3_no_spec_miss;   
input           lsu_rtu_wb_pipe4_bkpta_data;     
input           lsu_rtu_wb_pipe4_bkptb_data;     
input           lsu_rtu_wb_pipe4_no_spec_hit;    
input           lsu_rtu_wb_pipe4_no_spec_mispred; 
input           lsu_rtu_wb_pipe4_no_spec_miss;   
input           pad_yy_icg_scan_en;              
input           retire_rob_flush;                
input           retire_rob_flush_gateclk;        
input           x_cmplt_gateclk_vld;             
input   [6 :0]  x_cmplt_vld;                     
input           x_create_dp_en;                  
input           x_create_en;                     
input           x_create_gateclk_en;             
input   [3 :0]  x_create_sel;                    
input           x_pop_en;                        
output  [39:0]  x_read_data;                     

// &Regs; @29
reg             bju;                             
reg             bkpta_data;                      
reg             bkpta_inst;                      
reg             bkptb_data;                      
reg             bkptb_inst;                      
reg             cmplt;                           
reg     [1 :0]  cmplt_cnt;                       
reg             fp_dirty;                        
reg     [1 :0]  inst_num;                        
reg             intmask;                         
reg             load;                            
reg             no_spec_hit;                     
reg             no_spec_mispred;                 
reg             no_spec_miss;                    
reg     [2 :0]  pc_offset;                       
reg             pcfifo;                          
reg             ras;                             
reg             split;                           
reg             store;                           
reg             vec_dirty;                       
reg     [7 :0]  vl;                              
reg             vl_pred;                         
reg             vld;                             
reg     [1 :0]  vlmul;                           
reg             vsetvli;                         
reg     [2 :0]  vsew;                            
reg     [39:0]  x_create_data;                   

// &Wires; @30
wire            bkpta_data_updt_val;             
wire            bkptb_data_updt_val;             
wire            cmplt_1_fold_inst;               
wire            cmplt_2_fold_inst;               
wire            cmplt_3_fold_inst;               
wire    [1 :0]  cmplt_cnt_cmplt_exist;           
wire    [1 :0]  cmplt_cnt_with_create;           
wire            cmplt_updt_val;                  
wire            cp0_rtu_icg_en;                  
wire            cp0_yy_clk_en;                   
wire            cpurst_b;                        
wire            create_clk;                      
wire            create_clk_en;                   
wire            entry_clk;                       
wire            entry_clk_en;                    
wire            forever_cpuclk;                  
wire    [39:0]  idu_rtu_rob_create0_data;        
wire    [39:0]  idu_rtu_rob_create1_data;        
wire    [39:0]  idu_rtu_rob_create2_data;        
wire    [39:0]  idu_rtu_rob_create3_data;        
wire            lsu_cmplt_clk;                   
wire            lsu_cmplt_clk_en;                
wire            lsu_misc_cmplt_gateclk_en;       
wire            lsu_rtu_wb_pipe3_bkpta_data;     
wire            lsu_rtu_wb_pipe3_bkptb_data;     
wire            lsu_rtu_wb_pipe3_no_spec_hit;    
wire            lsu_rtu_wb_pipe3_no_spec_mispred; 
wire            lsu_rtu_wb_pipe3_no_spec_miss;   
wire            lsu_rtu_wb_pipe4_bkpta_data;     
wire            lsu_rtu_wb_pipe4_bkptb_data;     
wire            lsu_rtu_wb_pipe4_no_spec_hit;    
wire            lsu_rtu_wb_pipe4_no_spec_mispred; 
wire            lsu_rtu_wb_pipe4_no_spec_miss;   
wire            no_spec_hit_updt_val;            
wire            no_spec_mispred_updt_val;        
wire            no_spec_miss_updt_val;           
wire            pad_yy_icg_scan_en;              
wire            retire_rob_flush;                
wire            retire_rob_flush_gateclk;        
wire            x_cmplt_gateclk_vld;             
wire    [6 :0]  x_cmplt_vld;                     
wire            x_create_dp_en;                  
wire            x_create_en;                     
wire            x_create_gateclk_en;             
wire    [3 :0]  x_create_sel;                    
wire            x_pop_en;                        
wire    [39:0]  x_read_data;                     



//==========================================================
//                      Parameters
//==========================================================
//----------------------------------------------------------
//                     ROB Parameters
//----------------------------------------------------------
parameter ROB_WIDTH           = 40;

parameter ROB_VL_PRED         = 39;
parameter ROB_VL              = 38;
parameter ROB_VEC_DIRTY       = 30;
parameter ROB_VSETVLI         = 29;
parameter ROB_VSEW            = 28;
parameter ROB_VLMUL           = 25;
parameter ROB_NO_SPEC_MISPRED = 23;
parameter ROB_NO_SPEC_MISS    = 22;
parameter ROB_NO_SPEC_HIT     = 21;
parameter ROB_LOAD            = 20;
parameter ROB_FP_DIRTY        = 19;
parameter ROB_INST_NUM        = 18;
parameter ROB_BKPTB_INST      = 16;
parameter ROB_BKPTA_INST      = 15;
parameter ROB_BKPTB_DATA      = 14;
parameter ROB_BKPTA_DATA      = 13;
parameter ROB_STORE           = 12;
parameter ROB_RAS             = 11;
parameter ROB_PCFIFO          = 10;
parameter ROB_BJU             = 9;
parameter ROB_INTMASK         = 8;
parameter ROB_SPLIT           = 7;
parameter ROB_PC_OFFSET       = 6;
parameter ROB_CMPLT_CNT       = 3;
parameter ROB_CMPLT           = 1;
parameter ROB_VLD             = 0;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = retire_rob_flush_gateclk
                      || x_create_gateclk_en
                      || x_cmplt_gateclk_vld
                      || x_pop_en;

// &Instance("gated_clk_cell", "x_entry_gated_clk"); @76
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @77
//          .external_en (1'b0), @78
//          .global_en   (cp0_yy_clk_en), @79
//          .module_en   (cp0_rtu_icg_en), @80
//          .local_en    (entry_clk_en), @81
//          .clk_out     (entry_clk)); @82

assign create_clk_en = x_create_gateclk_en;
// &Instance("gated_clk_cell", "x_create_data_gated_clk"); @85
gated_clk_cell  x_create_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_clk_en     ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @86
//          .external_en (1'b0), @87
//          .global_en   (cp0_yy_clk_en), @88
//          .module_en   (cp0_rtu_icg_en), @89
//          .local_en    (create_clk_en), @90
//          .clk_out     (create_clk)); @91

assign lsu_cmplt_clk_en = x_create_gateclk_en
                          || lsu_misc_cmplt_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_cmplt_gated_clk"); @95
gated_clk_cell  x_lsu_cmplt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lsu_cmplt_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lsu_cmplt_clk_en  ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @96
//          .external_en (1'b0), @97
//          .global_en   (cp0_yy_clk_en), @98
//          .module_en   (cp0_rtu_icg_en), @99
//          .local_en    (lsu_cmplt_clk_en), @100
//          .clk_out     (lsu_cmplt_clk)); @101

//==========================================================
//                      Create Port
//==========================================================
// &CombBeg; @106
always @( idu_rtu_rob_create1_data[39:0]
       or idu_rtu_rob_create3_data[39:0]
       or x_create_sel[3:0]
       or idu_rtu_rob_create0_data[39:0]
       or idu_rtu_rob_create2_data[39:0])
begin
  case (x_create_sel[3:0])
    4'h1   : x_create_data[ROB_WIDTH-1:0] = idu_rtu_rob_create0_data[ROB_WIDTH-1:0];
    4'h2   : x_create_data[ROB_WIDTH-1:0] = idu_rtu_rob_create1_data[ROB_WIDTH-1:0];
    4'h4   : x_create_data[ROB_WIDTH-1:0] = idu_rtu_rob_create2_data[ROB_WIDTH-1:0];
    4'h8   : x_create_data[ROB_WIDTH-1:0] = idu_rtu_rob_create3_data[ROB_WIDTH-1:0];
    default: x_create_data[ROB_WIDTH-1:0] = {ROB_WIDTH{1'bx}};
  endcase
// &CombEnd; @114
end

//==========================================================
//                      Entry Valid
//==========================================================
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vld <= 1'b0;
  else if(retire_rob_flush)
    vld <= 1'b0;
  else if(x_create_en)
    vld <= x_create_data[ROB_VLD];
  else if(x_pop_en)
    vld <= 1'b0;
  else
    vld <= vld;
end

assign x_read_data[ROB_VLD] = vld;

//==========================================================
//               Cmplt counter and Cmplt bit
//==========================================================
//----------------------------------------------------------
//         Prepare cmplt cnt create and cmplt value
//----------------------------------------------------------
assign cmplt_1_fold_inst =
      x_cmplt_vld[0] && !x_cmplt_vld[1] && !x_cmplt_vld[5] && !x_cmplt_vld[6]
  || !x_cmplt_vld[0] &&  x_cmplt_vld[1] && !x_cmplt_vld[5] && !x_cmplt_vld[6]
  || !x_cmplt_vld[0] && !x_cmplt_vld[1] &&  x_cmplt_vld[5] && !x_cmplt_vld[6]
  || !x_cmplt_vld[0] && !x_cmplt_vld[1] && !x_cmplt_vld[5] &&  x_cmplt_vld[6];
assign cmplt_2_fold_inst =
      x_cmplt_vld[0] &&  x_cmplt_vld[1] && !x_cmplt_vld[5] && !x_cmplt_vld[6]
  ||  x_cmplt_vld[0] && !x_cmplt_vld[1] &&  x_cmplt_vld[5] && !x_cmplt_vld[6]
  ||  x_cmplt_vld[0] && !x_cmplt_vld[1] && !x_cmplt_vld[5] &&  x_cmplt_vld[6]
  || !x_cmplt_vld[0] &&  x_cmplt_vld[1] &&  x_cmplt_vld[5] && !x_cmplt_vld[6]
  || !x_cmplt_vld[0] &&  x_cmplt_vld[1] && !x_cmplt_vld[5] &&  x_cmplt_vld[6]
  || !x_cmplt_vld[0] && !x_cmplt_vld[1] &&  x_cmplt_vld[5] &&  x_cmplt_vld[6];
assign cmplt_3_fold_inst =
      x_cmplt_vld[0] &&  x_cmplt_vld[1] &&  x_cmplt_vld[5] && !x_cmplt_vld[6]
  ||  x_cmplt_vld[0] &&  x_cmplt_vld[1] && !x_cmplt_vld[5] &&  x_cmplt_vld[6]
  ||  x_cmplt_vld[0] && !x_cmplt_vld[1] &&  x_cmplt_vld[5] &&  x_cmplt_vld[6]
  || !x_cmplt_vld[0] &&  x_cmplt_vld[1] &&  x_cmplt_vld[5] &&  x_cmplt_vld[6];

assign cmplt_cnt_cmplt_exist[1:0]  =
// 2.1 0 inst cmplt
    {2{!(|x_cmplt_vld[6:0])}} & cmplt_cnt_with_create[1:0]
// 2.2 1 fold inst cmplt
  | {2{cmplt_1_fold_inst}}    & (cmplt_cnt_with_create[1:0] - 2'd1)
// 2.3 2 fold inst cmplt
  | {2{cmplt_2_fold_inst}}    & (cmplt_cnt_with_create[1:0] - 2'd2)
// 2.4 3 fold inst cmplt
  | {2{cmplt_3_fold_inst}}    & 2'd0
// 2.5 other inst cmplt
  | {2{(|x_cmplt_vld[6:2])}}  & 2'd0;

//----------------------------------------------------------
//                        cmplt cnt
//----------------------------------------------------------
assign cmplt_cnt_with_create[1:0] = x_create_en
                                    ? x_create_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1]
                                    : cmplt_cnt[1:0];

always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cmplt_cnt[1:0] <= 2'b0;
  else if(|x_cmplt_vld[6:0])
    cmplt_cnt[1:0] <= cmplt_cnt_cmplt_exist[1:0];
  else if(x_create_en)
    cmplt_cnt[1:0] <= x_create_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1];
  else
    cmplt_cnt[1:0] <= cmplt_cnt[1:0];
end

assign x_read_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1] = cmplt_cnt[1:0];

//----------------------------------------------------------
//         Prepare cmplt create and cmplt value
//----------------------------------------------------------
//1.if create to new or exist entry, cmplt will be 0
//2.if no create in and inst cmplt, cmplt will be 1 if
assign cmplt_updt_val =
// 2.1 1 fold inst cmplt and cmplt cnt is 1
     (cmplt_1_fold_inst) && (cmplt_cnt_with_create[1:0] == 2'd1)
// 2.2 2 fold inst cmplt and cmplt cnt is 2
  || (cmplt_2_fold_inst) && (cmplt_cnt_with_create[1:0] == 2'd2)
// 2.3 3 fold inst cmplt and (cmplt cnt is/must be 3)
  || (cmplt_3_fold_inst)
// 2.4 other inst cmplt no matter cmplt cnt
  || (|x_cmplt_vld[4:2]);

//----------------------------------------------------------
//                         cmplt 
//----------------------------------------------------------
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cmplt <= 1'b0;
  else if(|x_cmplt_vld[6:0])
    cmplt <= cmplt_updt_val;
  else if(x_create_en)
    cmplt <= x_create_data[ROB_CMPLT];
  else
    cmplt <= cmplt;
end

assign x_read_data[ROB_CMPLT] = cmplt;

//==========================================================
//              Instruction Complete Information
//==========================================================
//bkpta_data and bkptb_data can only from pipe3/4
assign bkpta_data_updt_val      = x_cmplt_vld[3] && lsu_rtu_wb_pipe3_bkpta_data
                               || x_cmplt_vld[4] && lsu_rtu_wb_pipe4_bkpta_data;
assign bkptb_data_updt_val      = x_cmplt_vld[3] && lsu_rtu_wb_pipe3_bkptb_data
                               || x_cmplt_vld[4] && lsu_rtu_wb_pipe4_bkptb_data;

assign no_spec_hit_updt_val     = x_cmplt_vld[3] && lsu_rtu_wb_pipe3_no_spec_hit
                               || x_cmplt_vld[4] && lsu_rtu_wb_pipe4_no_spec_hit;
assign no_spec_miss_updt_val    = x_cmplt_vld[3] && lsu_rtu_wb_pipe3_no_spec_miss
                               || x_cmplt_vld[4] && lsu_rtu_wb_pipe4_no_spec_miss;
assign no_spec_mispred_updt_val = x_cmplt_vld[3] && lsu_rtu_wb_pipe3_no_spec_mispred
                               || x_cmplt_vld[4] && lsu_rtu_wb_pipe4_no_spec_mispred;

always @(posedge lsu_cmplt_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    bkpta_data         <= 1'b0;
    bkptb_data         <= 1'b0;
    no_spec_hit        <= 1'b0;
    no_spec_miss       <= 1'b0;
    no_spec_mispred    <= 1'b0;
  end
  else if(|x_cmplt_vld[4:3]) begin
    bkpta_data         <= bkpta_data_updt_val;
    bkptb_data         <= bkptb_data_updt_val;
    no_spec_hit        <= no_spec_hit_updt_val;
    no_spec_miss       <= no_spec_miss_updt_val;
    no_spec_mispred    <= no_spec_mispred_updt_val;
  end
  else if(x_create_dp_en) begin
    bkpta_data         <= x_create_data[ROB_BKPTA_DATA];
    bkptb_data         <= x_create_data[ROB_BKPTB_DATA];
    no_spec_hit        <= x_create_data[ROB_NO_SPEC_HIT];
    no_spec_miss       <= x_create_data[ROB_NO_SPEC_MISS];
    no_spec_mispred    <= x_create_data[ROB_NO_SPEC_MISPRED];
  end
  else begin
    bkpta_data         <= bkpta_data;
    bkptb_data         <= bkptb_data;
    no_spec_hit        <= no_spec_hit;
    no_spec_miss       <= no_spec_miss;
    no_spec_mispred    <= no_spec_mispred;
  end
end

//rename for read output
assign x_read_data[ROB_BKPTA_DATA]         = bkpta_data;
assign x_read_data[ROB_BKPTB_DATA]         = bkptb_data;
assign x_read_data[ROB_NO_SPEC_HIT]        = no_spec_hit;
assign x_read_data[ROB_NO_SPEC_MISS]       = no_spec_miss;
assign x_read_data[ROB_NO_SPEC_MISPRED]    = no_spec_mispred;

//==========================================================
//              Instruction Create Information
//==========================================================
always @(posedge create_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    pc_offset[2:0]     <= 3'b0;
    split              <= 1'b0;
    intmask            <= 1'b0;
    bju                <= 1'b0;
    pcfifo             <= 1'b0;
    ras                <= 1'b0;
    store              <= 1'b0;
    bkpta_inst         <= 1'b0;
    bkptb_inst         <= 1'b0;
    inst_num[1:0]      <= 2'b0;
    fp_dirty           <= 1'b0;
    load               <= 1'b0;
    vlmul[1:0]         <= 2'b0;
    vsew[2:0]          <= 3'b0;
    vsetvli            <= 1'b0;
    vec_dirty          <= 1'b0;
    vl[7:0]            <= 8'b0;
    vl_pred            <= 1'b0;
  end
  else if(x_create_dp_en) begin
    pc_offset[2:0]     <= x_create_data[ROB_PC_OFFSET:ROB_PC_OFFSET-2];
    split              <= x_create_data[ROB_SPLIT];
    intmask            <= x_create_data[ROB_INTMASK];
    bju                <= x_create_data[ROB_BJU];
    pcfifo             <= x_create_data[ROB_PCFIFO];
    ras                <= x_create_data[ROB_RAS];
    store              <= x_create_data[ROB_STORE];
    bkpta_inst         <= x_create_data[ROB_BKPTA_INST];
    bkptb_inst         <= x_create_data[ROB_BKPTB_INST];
    inst_num[1:0]      <= x_create_data[ROB_INST_NUM:ROB_INST_NUM-1];
    fp_dirty           <= x_create_data[ROB_FP_DIRTY];
    load               <= x_create_data[ROB_LOAD];
    vlmul[1:0]         <= x_create_data[ROB_VLMUL:ROB_VLMUL-1];
    vsew[2:0]          <= x_create_data[ROB_VSEW:ROB_VSEW-2];
    vsetvli            <= x_create_data[ROB_VSETVLI];
    vec_dirty          <= x_create_data[ROB_VEC_DIRTY];
    vl[7:0]            <= x_create_data[ROB_VL:ROB_VL-7];
    vl_pred            <= x_create_data[ROB_VL_PRED];
  end
  else begin
    pc_offset[2:0]     <= pc_offset[2:0];
    split              <= split;
    intmask            <= intmask;
    bju                <= bju;
    pcfifo             <= pcfifo;
    ras                <= ras;
    store              <= store;
    bkpta_inst         <= bkpta_inst;
    bkptb_inst         <= bkptb_inst;
    inst_num[1:0]      <= inst_num[1:0];
    fp_dirty           <= fp_dirty;
    load               <= load;
    vlmul[1:0]         <= vlmul[1:0];
    vsew[2:0]          <= vsew[2:0];
    vsetvli            <= vsetvli;
    vec_dirty          <= vec_dirty;
    vl[7:0]            <= vl[7:0];
    vl_pred            <= vl_pred;
  end
end

//rename for read output
assign x_read_data[ROB_PC_OFFSET:ROB_PC_OFFSET-2] = pc_offset[2:0];
assign x_read_data[ROB_SPLIT]                     = split;
assign x_read_data[ROB_INTMASK]                   = intmask;
assign x_read_data[ROB_BJU]                       = bju;
assign x_read_data[ROB_PCFIFO]                    = pcfifo;
assign x_read_data[ROB_RAS]                       = ras;
assign x_read_data[ROB_STORE]                     = store;
assign x_read_data[ROB_BKPTA_INST]                = bkpta_inst;
assign x_read_data[ROB_BKPTB_INST]                = bkptb_inst;
assign x_read_data[ROB_INST_NUM:ROB_INST_NUM-1]   = inst_num[1:0];
assign x_read_data[ROB_FP_DIRTY]                  = fp_dirty;
assign x_read_data[ROB_LOAD]                      = load;
assign x_read_data[ROB_VLMUL:ROB_VLMUL-1]         = vlmul[1:0];
assign x_read_data[ROB_VSEW:ROB_VSEW-2]           = vsew[2:0];
assign x_read_data[ROB_VSETVLI]                   = vsetvli;
assign x_read_data[ROB_VEC_DIRTY]                 = vec_dirty;
assign x_read_data[ROB_VL:ROB_VL-7]               = vl[7:0];
assign x_read_data[ROB_VL_PRED]                   = vl_pred;

// &ModuleEnd; @366
endmodule


