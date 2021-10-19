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

// &ModuleBeg; @25
module ct_iu_div(
  cp0_iu_div_entry_disable,
  cp0_iu_div_entry_disable_clr,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  div_rbus_data,
  div_rbus_pipe0_data_vld,
  div_rbus_preg,
  div_top_div_no_idle,
  div_top_div_wf_wb,
  forever_cpuclk,
  idu_iu_is_div_gateclk_issue,
  idu_iu_is_div_issue,
  idu_iu_rf_div_gateclk_sel,
  idu_iu_rf_div_sel,
  idu_iu_rf_pipe0_dst_preg,
  idu_iu_rf_pipe0_func,
  idu_iu_rf_pipe0_iid,
  idu_iu_rf_pipe0_src0,
  idu_iu_rf_pipe0_src1_no_imm,
  iu_idu_div_busy,
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dup0,
  iu_idu_div_preg_dup1,
  iu_idu_div_preg_dup2,
  iu_idu_div_preg_dup3,
  iu_idu_div_preg_dup4,
  iu_idu_div_wb_stall,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush
);

// &Ports; @26
input            cp0_iu_div_entry_disable;    
input            cp0_iu_div_entry_disable_clr; 
input            cp0_iu_icg_en;               
input            cp0_yy_clk_en;               
input            cpurst_b;                    
input            forever_cpuclk;              
input            idu_iu_is_div_gateclk_issue; 
input            idu_iu_is_div_issue;         
input            idu_iu_rf_div_gateclk_sel;   
input            idu_iu_rf_div_sel;           
input   [6  :0]  idu_iu_rf_pipe0_dst_preg;    
input   [4  :0]  idu_iu_rf_pipe0_func;        
input   [6  :0]  idu_iu_rf_pipe0_iid;         
input   [63 :0]  idu_iu_rf_pipe0_src0;        
input   [63 :0]  idu_iu_rf_pipe0_src1_no_imm; 
input            pad_yy_icg_scan_en;          
input            rtu_yy_xx_flush;             
output  [63 :0]  div_rbus_data;               
output           div_rbus_pipe0_data_vld;     
output  [6  :0]  div_rbus_preg;               
output           div_top_div_no_idle;         
output           div_top_div_wf_wb;           
output           iu_idu_div_busy;             
output           iu_idu_div_inst_vld;         
output  [6  :0]  iu_idu_div_preg_dup0;        
output  [6  :0]  iu_idu_div_preg_dup1;        
output  [6  :0]  iu_idu_div_preg_dup2;        
output  [6  :0]  iu_idu_div_preg_dup3;        
output  [6  :0]  iu_idu_div_preg_dup4;        
output           iu_idu_div_wb_stall;         

// &Regs; @27
reg     [5  :0]  div_cur_state;               
reg              div_ex1_div;                 
reg     [6  :0]  div_ex1_dst_preg;            
reg     [6  :0]  div_ex1_dst_preg_dup0;       
reg     [6  :0]  div_ex1_dst_preg_dup1;       
reg     [6  :0]  div_ex1_dst_preg_dup2;       
reg     [6  :0]  div_ex1_dst_preg_dup3;       
reg     [6  :0]  div_ex1_dst_preg_dup4;       
reg     [6  :0]  div_ex1_iid;                 
reg              div_ex1_rem;                 
reg              div_ex1_sign_en;             
reg     [63 :0]  div_ex1_src0;                
reg     [63 :0]  div_ex1_src1;                
reg              div_ex1_word_width;          
reg     [5  :0]  div_ex2_dvd_disp;            
reg     [5  :0]  div_ex2_dvr_disp;            
reg     [63 :0]  div_expt_div_result;         
reg     [63 :0]  div_expt_rem_result;         
reg     [5  :0]  div_next_state;              
reg     [63 :0]  div_result_data;             
reg              div_result_disp_0;           
reg              div_result_div_by_0;         
reg              div_result_entry0;           
reg              div_result_entry1;           
reg              div_result_overflow;         
reg     [5  :0]  dvdd;                        
reg     [5  :0]  dvrd;                        
reg     [63 :0]  rem_result_data;             
reg              srt_on;                      

// &Wires; @28
wire             cp0_iu_div_entry_disable;    
wire             cp0_iu_div_entry_disable_clr; 
wire             cp0_iu_icg_en;               
wire             cp0_yy_clk_en;               
wire             cpurst_b;                    
wire             div_clk;                     
wire             div_clk_en;                  
wire    [63 :0]  div_entry0_div_result;       
wire    [257:0]  div_entry0_read_data;        
wire             div_entry0_read_vld;         
wire    [63 :0]  div_entry0_rem_result;       
wire             div_entry0_sign_en;          
wire    [63 :0]  div_entry0_src0;             
wire    [63 :0]  div_entry0_src1;             
wire             div_entry0_word_width;       
wire    [63 :0]  div_entry1_div_result;       
wire    [257:0]  div_entry1_read_data;        
wire             div_entry1_read_vld;         
wire    [63 :0]  div_entry1_rem_result;       
wire             div_entry1_sign_en;          
wire    [63 :0]  div_entry1_src0;             
wire    [63 :0]  div_entry1_src1;             
wire             div_entry1_word_width;       
wire    [257:0]  div_entry_write_data;        
wire             div_entry_write_en;          
wire             div_ex1_div_by_0;            
wire             div_ex1_div_result_neg;      
wire    [63 :0]  div_ex1_div_src0;            
wire    [63 :0]  div_ex1_div_src1;            
wire             div_ex1_inst_vld;            
wire             div_ex1_match_entry0;        
wire             div_ex1_match_entry1;        
wire             div_ex1_overflow;            
wire             div_ex1_rem_result_neg;      
wire             div_ex1_special_result;      
wire    [63 :0]  div_ex1_src0_abs;            
wire    [5  :0]  div_ex1_src0_ff1_disp;       
wire    [63 :0]  div_ex1_src0_neg;            
wire    [5  :0]  div_ex1_src0_neg_ff1_disp;   
wire    [5  :0]  div_ex1_src0_pos_ff1_disp;   
wire             div_ex1_src0_word_minus;     
wire    [63 :0]  div_ex1_src1_abs;            
wire    [5  :0]  div_ex1_src1_ff1_disp;       
wire    [63 :0]  div_ex1_src1_neg;            
wire    [5  :0]  div_ex1_src1_neg_ff1_disp;   
wire    [5  :0]  div_ex1_src1_pos_ff1_disp;   
wire             div_ex1_src1_word_minus;     
wire             div_ex2_disp_0;              
wire             div_ex2_inst_vld;            
wire             div_ex4_inst_vld;            
wire    [6  :0]  div_exp_disp;                
wire    [63 :0]  div_rbus_data;               
wire             div_rbus_pipe0_data_vld;     
wire    [6  :0]  div_rbus_preg;               
wire             div_result_expt;             
wire             div_result_normal;           
wire             div_top_div_no_idle;         
wire             div_top_div_wf_wb;           
wire             div_wb0_inst_vld;            
wire             div_wb_inst_vld;             
wire    [63 :0]  dvd;                         
wire    [63 :0]  dvr;                         
wire             ex1_inst_clk;                
wire             ex1_inst_clk_en;             
wire             ex2_inst_clk;                
wire             ex2_inst_clk_en;             
wire    [63 :0]  expt_disp_zero_div_result;   
wire    [63 :0]  expt_disp_zero_rem_result;   
wire    [63 :0]  expt_div_by_0_div_result;    
wire    [63 :0]  expt_div_by_0_rem_result;    
wire    [63 :0]  expt_overflow_div_result;    
wire    [63 :0]  expt_overflow_rem_result;    
wire             forever_cpuclk;              
wire             idu_iu_is_div_gateclk_issue; 
wire             idu_iu_is_div_issue;         
wire             idu_iu_rf_div_gateclk_sel;   
wire             idu_iu_rf_div_sel;           
wire    [6  :0]  idu_iu_rf_pipe0_dst_preg;    
wire    [4  :0]  idu_iu_rf_pipe0_func;        
wire    [6  :0]  idu_iu_rf_pipe0_iid;         
wire    [63 :0]  idu_iu_rf_pipe0_src0;        
wire    [63 :0]  idu_iu_rf_pipe0_src1_no_imm; 
wire             iu_idu_div_busy;             
wire             iu_idu_div_inst_vld;         
wire    [6  :0]  iu_idu_div_preg_dup0;        
wire    [6  :0]  iu_idu_div_preg_dup1;        
wire    [6  :0]  iu_idu_div_preg_dup2;        
wire    [6  :0]  iu_idu_div_preg_dup3;        
wire    [6  :0]  iu_idu_div_preg_dup4;        
wire             iu_idu_div_wb_stall;         
wire             pad_yy_icg_scan_en;          
wire             rtu_yy_xx_flush;             
wire    [63 :0]  srt_div_result;              
wire    [63 :0]  srt_div_sign_result;         
wire             srt_init;                    
wire             srt_iter_finish;             
wire    [63 :0]  srt_rem_result;              
wire    [63 :0]  srt_rem_sign_result;         
wire    [63 :0]  x_srt_div_result;            
wire    [63 :0]  x_srt_dvd;                   
wire    [63 :0]  x_srt_dvr;                   
wire             x_srt_finish;                
wire             x_srt_on;                    
wire    [63 :0]  x_srt_rem_result;            
wire             x_srt_select_vld;            
wire             x_srt_shift_vld;             


//==========================================================
//                   Div State Machine
//==========================================================
parameter IDLE         = 6'b000_000;
parameter DIV_RF       = 6'b000_011;
parameter EX1          = 6'b001_011;
parameter EX2          = 6'b010_011;
parameter EX3          = 6'b011_011;
parameter REQ          = 6'b100_011;
parameter DIV_WF_WB    = 6'b011_010;
parameter DIV_WB       = 6'b000_101;
parameter DIV_WB1      = 6'b001_101;

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign div_clk_en = idu_iu_is_div_gateclk_issue
                    || (div_cur_state[5:0] != IDLE)
                    || cp0_iu_div_entry_disable_clr;
// &Instance("gated_clk_cell", "x_div_gated_clk"); @49
gated_clk_cell  x_div_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (div_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (div_clk_en        ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @50
//          .external_en (1'b0), @51
//          .global_en   (cp0_yy_clk_en), @52
//          .module_en   (cp0_iu_icg_en), @53
//          .local_en    (div_clk_en), @54
//          .clk_out     (div_clk)); @55

assign ex1_inst_clk_en = idu_iu_rf_div_sel;
// &Instance("gated_clk_cell", "x_ex1_inst_gated_clk"); @58
gated_clk_cell  x_ex1_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @59
//          .external_en (1'b0), @60
//          .global_en   (cp0_yy_clk_en), @61
//          .module_en   (cp0_iu_icg_en), @62
//          .local_en    (ex1_inst_clk_en), @63
//          .clk_out     (ex1_inst_clk)); @64

assign ex2_inst_clk_en = div_ex1_inst_vld;
// &Instance("gated_clk_cell", "x_ex2_inst_gated_clk"); @67
gated_clk_cell  x_ex2_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @68
//          .external_en (1'b0), @69
//          .global_en   (cp0_yy_clk_en), @70
//          .module_en   (cp0_iu_icg_en), @71
//          .local_en    (ex2_inst_clk_en), @72
//          .clk_out     (ex2_inst_clk)); @73

//----------------------------------------------------------
//              control signal for delay FSM
//----------------------------------------------------------

//----------------------------------------------------------
//                  FSM of delay logic
//----------------------------------------------------------
// State Description:
// IDLE        : no div inst or div inst issue
// DIV_RF      : div inst launch (or launch fail) at RF
// EX1         : abs, cmplt
// EX2         : shift dvr
// EX3         : iteration srt
// EX4         : result select
// DIV_WF_WB   : wait for pipe0/1 RF empty
// DIV_WB0     : write back div/rem result to rbus EX1 pipe0
// DIV_WB1     : write back div/rem result to rbus EX1 pipe1

always @(posedge div_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    div_cur_state[5:0] <= IDLE;
  else if(rtu_yy_xx_flush)
    div_cur_state[5:0] <= IDLE;
  else
    div_cur_state[5:0] <= div_next_state[5:0];
end

// &CombBeg; @103
always @( div_ex1_special_result
       or div_cur_state[5:0]
       or idu_iu_rf_div_sel
       or x_srt_finish
       or idu_iu_is_div_issue
       or div_ex2_disp_0)
begin
  case(div_cur_state[5:0])
  IDLE       : if(idu_iu_is_div_issue)
                 div_next_state[5:0] = DIV_RF;
               else
                 div_next_state[5:0] = IDLE;
  DIV_RF     : if(idu_iu_rf_div_sel)
                 div_next_state[5:0] = EX1;
               else
                 div_next_state[5:0] = IDLE;
  EX1        : if(!div_ex1_special_result)
                 div_next_state[5:0] = EX2;
               else
                 div_next_state[5:0] = REQ;
  EX2        : if(!div_ex2_disp_0)
                 div_next_state[5:0] = EX3;
               else
                 div_next_state[5:0] = REQ;
  EX3        : if(x_srt_finish)
                 div_next_state[5:0] = REQ;
               else
                 div_next_state[5:0] = EX3;
  REQ        : div_next_state[5:0] = DIV_WF_WB;
  DIV_WF_WB  : div_next_state[5:0] = DIV_WB;
  DIV_WB    : if(idu_iu_is_div_issue)
                 div_next_state[5:0] = DIV_RF;
               else
                 div_next_state[5:0] = IDLE;
  default    :   div_next_state[5:0] = IDLE;
  endcase
// &CombEnd; @133
end

//----------------------------------------------------------
//                   control signals
//----------------------------------------------------------
assign div_ex1_inst_vld          = (div_cur_state[5:0] == EX1);

assign div_ex2_inst_vld          = (div_cur_state[5:0] == EX2);

//assign div_ex3_inst_vld          = (div_cur_state[5:0] == EX3) || (div_cur_state[5:0] == REQ);

assign div_ex4_inst_vld          = (div_cur_state[5:0] == DIV_WF_WB);

assign div_wb0_inst_vld          = (div_cur_state[3:2] == 2'b01);

//assign div_wb1_inst_vld          = 1'b0;

assign iu_idu_div_busy           = div_cur_state[1];

assign div_wb_inst_vld           = div_cur_state[2];

assign div_top_div_no_idle       = (div_cur_state[5:0] != IDLE);

assign div_top_div_wf_wb         = (div_cur_state[5:0] == DIV_WF_WB);

assign iu_idu_div_wb_stall       = div_cur_state[5];
//==========================================================
//                     EX1 Stage
//==========================================================
// &Force("bus","idu_iu_rf_pipe0_func",4,0); @162
//----------------------------------------------------------
//               Pipe0 EX1 Instruction Data
//----------------------------------------------------------
always @(posedge ex1_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    div_ex1_iid[6:0]             <= 7'b0;
    div_ex1_dst_preg[6:0]        <= 7'b0;
    div_ex1_dst_preg_dup0[6:0]   <= 7'b0;
    div_ex1_dst_preg_dup1[6:0]   <= 7'b0;
    div_ex1_dst_preg_dup2[6:0]   <= 7'b0;
    div_ex1_dst_preg_dup3[6:0]   <= 7'b0;
    div_ex1_dst_preg_dup4[6:0]   <= 7'b0;
    div_ex1_sign_en              <= 1'b0;
    div_ex1_word_width           <= 1'b0;
    div_ex1_div                  <= 1'b0;
    div_ex1_rem                  <= 1'b0;
    div_ex1_src0[63:0]           <= 64'b0;
    div_ex1_src1[63:0]           <= 64'b0;
  end
  else if(idu_iu_rf_div_gateclk_sel) begin
    div_ex1_iid[6:0]             <= idu_iu_rf_pipe0_iid[6:0];
    div_ex1_dst_preg[6:0]        <= idu_iu_rf_pipe0_dst_preg[6:0];
    div_ex1_dst_preg_dup0[6:0]   <= idu_iu_rf_pipe0_dst_preg[6:0];
    div_ex1_dst_preg_dup1[6:0]   <= idu_iu_rf_pipe0_dst_preg[6:0];
    div_ex1_dst_preg_dup2[6:0]   <= idu_iu_rf_pipe0_dst_preg[6:0];
    div_ex1_dst_preg_dup3[6:0]   <= idu_iu_rf_pipe0_dst_preg[6:0];
    div_ex1_dst_preg_dup4[6:0]   <= idu_iu_rf_pipe0_dst_preg[6:0];
    div_ex1_sign_en              <= idu_iu_rf_pipe0_func[0];
    div_ex1_word_width           <= idu_iu_rf_pipe0_func[1];
    div_ex1_div                  <= idu_iu_rf_pipe0_func[2];
    div_ex1_rem                  <= idu_iu_rf_pipe0_func[3];
    div_ex1_src0[63:0]           <= idu_iu_rf_pipe0_src0[63:0];
    div_ex1_src1[63:0]           <= idu_iu_rf_pipe0_src1_no_imm[63:0];
  end
  else begin
    div_ex1_iid[6:0]             <= div_ex1_iid[6:0];
    div_ex1_dst_preg[6:0]        <= div_ex1_dst_preg[6:0];
    div_ex1_dst_preg_dup0[6:0]   <= div_ex1_dst_preg_dup0[6:0];
    div_ex1_dst_preg_dup1[6:0]   <= div_ex1_dst_preg_dup1[6:0];
    div_ex1_dst_preg_dup2[6:0]   <= div_ex1_dst_preg_dup2[6:0];
    div_ex1_dst_preg_dup3[6:0]   <= div_ex1_dst_preg_dup3[6:0];
    div_ex1_dst_preg_dup4[6:0]   <= div_ex1_dst_preg_dup4[6:0];
    div_ex1_sign_en              <= div_ex1_sign_en;
    div_ex1_word_width           <= div_ex1_word_width;
    div_ex1_div                  <= div_ex1_div;
    div_ex1_rem                  <= div_ex1_rem;
    div_ex1_src0[63:0]           <= div_ex1_src0[63:0];
    div_ex1_src1[63:0]           <= div_ex1_src1[63:0];
  end
end

//----------------------------------------------------------
//                 Pipe0 EX1 Divl Data
//----------------------------------------------------------
//----------------------------------------------------------
//                    Operand Mux
//----------------------------------------------------------
assign div_ex1_src0_word_minus = div_ex1_sign_en && div_ex1_src0[31];
assign div_ex1_src1_word_minus = div_ex1_sign_en && div_ex1_src1[31];

assign div_ex1_div_src0[63:0] =
         (div_ex1_word_width) ? {{32{div_ex1_src0_word_minus}}, div_ex1_src0[31:0]}
                              : div_ex1_src0[63:0];
assign div_ex1_div_src1[63:0] = 
         (div_ex1_word_width) ? {{32{div_ex1_src1_word_minus}}, div_ex1_src1[31:0]}
                              : div_ex1_src1[63:0];

//----------------------------------------------------------
//               absolute the two operand
//----------------------------------------------------------
assign dvd[63:0] = div_ex1_div_src0[63:0];
assign dvr[63:0] = div_ex1_div_src1[63:0];

// &CombBeg; @237
always @( dvd[63:0])
begin
casez(dvd[63:0])
 64'b1???????????????????????????????????????????????????????????????: dvdd[5:0] = 6'd0;
 64'b01??????????????????????????????????????????????????????????????: dvdd[5:0] = 6'd1;
 64'b001?????????????????????????????????????????????????????????????: dvdd[5:0] = 6'd2;
 64'b0001????????????????????????????????????????????????????????????: dvdd[5:0] = 6'd3;
 64'b00001???????????????????????????????????????????????????????????: dvdd[5:0] = 6'd4;
 64'b000001??????????????????????????????????????????????????????????: dvdd[5:0] = 6'd5;
 64'b0000001?????????????????????????????????????????????????????????: dvdd[5:0] = 6'd6;
 64'b00000001????????????????????????????????????????????????????????: dvdd[5:0] = 6'd7;
 64'b000000001???????????????????????????????????????????????????????: dvdd[5:0] = 6'd8;
 64'b0000000001??????????????????????????????????????????????????????: dvdd[5:0] = 6'd9;
 64'b00000000001?????????????????????????????????????????????????????: dvdd[5:0] = 6'd10;
 64'b000000000001????????????????????????????????????????????????????: dvdd[5:0] = 6'd11;
 64'b0000000000001???????????????????????????????????????????????????: dvdd[5:0] = 6'd12;
 64'b00000000000001??????????????????????????????????????????????????: dvdd[5:0] = 6'd13;
 64'b000000000000001?????????????????????????????????????????????????: dvdd[5:0] = 6'd14;
 64'b0000000000000001????????????????????????????????????????????????: dvdd[5:0] = 6'd15;
 64'b00000000000000001???????????????????????????????????????????????: dvdd[5:0] = 6'd16;
 64'b000000000000000001??????????????????????????????????????????????: dvdd[5:0] = 6'd17;
 64'b0000000000000000001?????????????????????????????????????????????: dvdd[5:0] = 6'd18;
 64'b00000000000000000001????????????????????????????????????????????: dvdd[5:0] = 6'd19;
 64'b000000000000000000001???????????????????????????????????????????: dvdd[5:0] = 6'd20;
 64'b0000000000000000000001??????????????????????????????????????????: dvdd[5:0] = 6'd21;
 64'b00000000000000000000001?????????????????????????????????????????: dvdd[5:0] = 6'd22;
 64'b000000000000000000000001????????????????????????????????????????: dvdd[5:0] = 6'd23;
 64'b0000000000000000000000001???????????????????????????????????????: dvdd[5:0] = 6'd24;
 64'b00000000000000000000000001??????????????????????????????????????: dvdd[5:0] = 6'd25;
 64'b000000000000000000000000001?????????????????????????????????????: dvdd[5:0] = 6'd26;
 64'b0000000000000000000000000001????????????????????????????????????: dvdd[5:0] = 6'd27;
 64'b00000000000000000000000000001???????????????????????????????????: dvdd[5:0] = 6'd28;
 64'b000000000000000000000000000001??????????????????????????????????: dvdd[5:0] = 6'd29;
 64'b0000000000000000000000000000001?????????????????????????????????: dvdd[5:0] = 6'd30;
 64'b00000000000000000000000000000001????????????????????????????????: dvdd[5:0] = 6'd31;
 64'b000000000000000000000000000000001???????????????????????????????: dvdd[5:0] = 6'd32;
 64'b0000000000000000000000000000000001??????????????????????????????: dvdd[5:0] = 6'd33;
 64'b00000000000000000000000000000000001?????????????????????????????: dvdd[5:0] = 6'd34;
 64'b000000000000000000000000000000000001????????????????????????????: dvdd[5:0] = 6'd35;
 64'b0000000000000000000000000000000000001???????????????????????????: dvdd[5:0] = 6'd36;
 64'b00000000000000000000000000000000000001??????????????????????????: dvdd[5:0] = 6'd37;
 64'b000000000000000000000000000000000000001?????????????????????????: dvdd[5:0] = 6'd38;
 64'b0000000000000000000000000000000000000001????????????????????????: dvdd[5:0] = 6'd39;
 64'b00000000000000000000000000000000000000001???????????????????????: dvdd[5:0] = 6'd40;
 64'b000000000000000000000000000000000000000001??????????????????????: dvdd[5:0] = 6'd41;
 64'b0000000000000000000000000000000000000000001?????????????????????: dvdd[5:0] = 6'd42;
 64'b00000000000000000000000000000000000000000001????????????????????: dvdd[5:0] = 6'd43;
 64'b000000000000000000000000000000000000000000001???????????????????: dvdd[5:0] = 6'd44;
 64'b0000000000000000000000000000000000000000000001??????????????????: dvdd[5:0] = 6'd45;
 64'b00000000000000000000000000000000000000000000001?????????????????: dvdd[5:0] = 6'd46;
 64'b000000000000000000000000000000000000000000000001????????????????: dvdd[5:0] = 6'd47;
 64'b0000000000000000000000000000000000000000000000001???????????????: dvdd[5:0] = 6'd48;
 64'b00000000000000000000000000000000000000000000000001??????????????: dvdd[5:0] = 6'd49;
 64'b000000000000000000000000000000000000000000000000001?????????????: dvdd[5:0] = 6'd50;
 64'b0000000000000000000000000000000000000000000000000001????????????: dvdd[5:0] = 6'd51;
 64'b00000000000000000000000000000000000000000000000000001???????????: dvdd[5:0] = 6'd52;
 64'b000000000000000000000000000000000000000000000000000001??????????: dvdd[5:0] = 6'd53;
 64'b0000000000000000000000000000000000000000000000000000001?????????: dvdd[5:0] = 6'd54;
 64'b00000000000000000000000000000000000000000000000000000001????????: dvdd[5:0] = 6'd55;
 64'b000000000000000000000000000000000000000000000000000000001???????: dvdd[5:0] = 6'd56;
 64'b0000000000000000000000000000000000000000000000000000000001??????: dvdd[5:0] = 6'd57;
 64'b00000000000000000000000000000000000000000000000000000000001?????: dvdd[5:0] = 6'd58;
 64'b000000000000000000000000000000000000000000000000000000000001????: dvdd[5:0] = 6'd59;
 64'b0000000000000000000000000000000000000000000000000000000000001???: dvdd[5:0] = 6'd60;
 64'b00000000000000000000000000000000000000000000000000000000000001??: dvdd[5:0] = 6'd61;
 64'b000000000000000000000000000000000000000000000000000000000000001?: dvdd[5:0] = 6'd62;
 64'b0000000000000000000000000000000000000000000000000000000000000001: dvdd[5:0] = 6'd63;
 64'b0000000000000000000000000000000000000000000000000000000000000000: dvdd[5:0] = 6'd63;
 default:                                                              dvdd[5:0] = {6{1'bx}};
endcase
// &CombEnd; @306
end

assign div_ex1_src0_pos_ff1_disp[5:0] = dvdd[5:0];

// &CombBeg; @310
always @( dvr[63:0])
begin
casez(dvr[63:0])
 64'b1???????????????????????????????????????????????????????????????: dvrd[5:0] = 6'd0;
 64'b01??????????????????????????????????????????????????????????????: dvrd[5:0] = 6'd1;
 64'b001?????????????????????????????????????????????????????????????: dvrd[5:0] = 6'd2;
 64'b0001????????????????????????????????????????????????????????????: dvrd[5:0] = 6'd3;
 64'b00001???????????????????????????????????????????????????????????: dvrd[5:0] = 6'd4;
 64'b000001??????????????????????????????????????????????????????????: dvrd[5:0] = 6'd5;
 64'b0000001?????????????????????????????????????????????????????????: dvrd[5:0] = 6'd6;
 64'b00000001????????????????????????????????????????????????????????: dvrd[5:0] = 6'd7;
 64'b000000001???????????????????????????????????????????????????????: dvrd[5:0] = 6'd8;
 64'b0000000001??????????????????????????????????????????????????????: dvrd[5:0] = 6'd9;
 64'b00000000001?????????????????????????????????????????????????????: dvrd[5:0] = 6'd10;
 64'b000000000001????????????????????????????????????????????????????: dvrd[5:0] = 6'd11;
 64'b0000000000001???????????????????????????????????????????????????: dvrd[5:0] = 6'd12;
 64'b00000000000001??????????????????????????????????????????????????: dvrd[5:0] = 6'd13;
 64'b000000000000001?????????????????????????????????????????????????: dvrd[5:0] = 6'd14;
 64'b0000000000000001????????????????????????????????????????????????: dvrd[5:0] = 6'd15;
 64'b00000000000000001???????????????????????????????????????????????: dvrd[5:0] = 6'd16;
 64'b000000000000000001??????????????????????????????????????????????: dvrd[5:0] = 6'd17;
 64'b0000000000000000001?????????????????????????????????????????????: dvrd[5:0] = 6'd18;
 64'b00000000000000000001????????????????????????????????????????????: dvrd[5:0] = 6'd19;
 64'b000000000000000000001???????????????????????????????????????????: dvrd[5:0] = 6'd20;
 64'b0000000000000000000001??????????????????????????????????????????: dvrd[5:0] = 6'd21;
 64'b00000000000000000000001?????????????????????????????????????????: dvrd[5:0] = 6'd22;
 64'b000000000000000000000001????????????????????????????????????????: dvrd[5:0] = 6'd23;
 64'b0000000000000000000000001???????????????????????????????????????: dvrd[5:0] = 6'd24;
 64'b00000000000000000000000001??????????????????????????????????????: dvrd[5:0] = 6'd25;
 64'b000000000000000000000000001?????????????????????????????????????: dvrd[5:0] = 6'd26;
 64'b0000000000000000000000000001????????????????????????????????????: dvrd[5:0] = 6'd27;
 64'b00000000000000000000000000001???????????????????????????????????: dvrd[5:0] = 6'd28;
 64'b000000000000000000000000000001??????????????????????????????????: dvrd[5:0] = 6'd29;
 64'b0000000000000000000000000000001?????????????????????????????????: dvrd[5:0] = 6'd30;
 64'b00000000000000000000000000000001????????????????????????????????: dvrd[5:0] = 6'd31;
 64'b000000000000000000000000000000001???????????????????????????????: dvrd[5:0] = 6'd32;
 64'b0000000000000000000000000000000001??????????????????????????????: dvrd[5:0] = 6'd33;
 64'b00000000000000000000000000000000001?????????????????????????????: dvrd[5:0] = 6'd34;
 64'b000000000000000000000000000000000001????????????????????????????: dvrd[5:0] = 6'd35;
 64'b0000000000000000000000000000000000001???????????????????????????: dvrd[5:0] = 6'd36;
 64'b00000000000000000000000000000000000001??????????????????????????: dvrd[5:0] = 6'd37;
 64'b000000000000000000000000000000000000001?????????????????????????: dvrd[5:0] = 6'd38;
 64'b0000000000000000000000000000000000000001????????????????????????: dvrd[5:0] = 6'd39;
 64'b00000000000000000000000000000000000000001???????????????????????: dvrd[5:0] = 6'd40;
 64'b000000000000000000000000000000000000000001??????????????????????: dvrd[5:0] = 6'd41;
 64'b0000000000000000000000000000000000000000001?????????????????????: dvrd[5:0] = 6'd42;
 64'b00000000000000000000000000000000000000000001????????????????????: dvrd[5:0] = 6'd43;
 64'b000000000000000000000000000000000000000000001???????????????????: dvrd[5:0] = 6'd44;
 64'b0000000000000000000000000000000000000000000001??????????????????: dvrd[5:0] = 6'd45;
 64'b00000000000000000000000000000000000000000000001?????????????????: dvrd[5:0] = 6'd46;
 64'b000000000000000000000000000000000000000000000001????????????????: dvrd[5:0] = 6'd47;
 64'b0000000000000000000000000000000000000000000000001???????????????: dvrd[5:0] = 6'd48;
 64'b00000000000000000000000000000000000000000000000001??????????????: dvrd[5:0] = 6'd49;
 64'b000000000000000000000000000000000000000000000000001?????????????: dvrd[5:0] = 6'd50;
 64'b0000000000000000000000000000000000000000000000000001????????????: dvrd[5:0] = 6'd51;
 64'b00000000000000000000000000000000000000000000000000001???????????: dvrd[5:0] = 6'd52;
 64'b000000000000000000000000000000000000000000000000000001??????????: dvrd[5:0] = 6'd53;
 64'b0000000000000000000000000000000000000000000000000000001?????????: dvrd[5:0] = 6'd54;
 64'b00000000000000000000000000000000000000000000000000000001????????: dvrd[5:0] = 6'd55;
 64'b000000000000000000000000000000000000000000000000000000001???????: dvrd[5:0] = 6'd56;
 64'b0000000000000000000000000000000000000000000000000000000001??????: dvrd[5:0] = 6'd57;
 64'b00000000000000000000000000000000000000000000000000000000001?????: dvrd[5:0] = 6'd58;
 64'b000000000000000000000000000000000000000000000000000000000001????: dvrd[5:0] = 6'd59;
 64'b0000000000000000000000000000000000000000000000000000000000001???: dvrd[5:0] = 6'd60;
 64'b00000000000000000000000000000000000000000000000000000000000001??: dvrd[5:0] = 6'd61;
 64'b000000000000000000000000000000000000000000000000000000000000001?: dvrd[5:0] = 6'd62;
 64'b0000000000000000000000000000000000000000000000000000000000000001: dvrd[5:0] = 6'd63;
 64'b0000000000000000000000000000000000000000000000000000000000000000: dvrd[5:0] = 6'd63;
 default:                                                              dvrd[5:0] = {6{1'bx}};
endcase
// &CombEnd; @379
end

assign div_ex1_src1_pos_ff1_disp[5:0] = dvrd[5:0];

assign div_ex1_src0_neg_ff1_disp[5:0] =
  {6{ !dvd[63]                 && !(|dvd[61:0])}} & 6'd63
| {6{ !dvd[63]                 &&  (|dvd[61:0])}} & 6'd0
| {6{  dvd[63]     && !dvd[62] && !(|dvd[61:0])}} & 6'd0
| {6{  dvd[63]     && !dvd[62] &&  (|dvd[61:0])}} & 6'd1
| {6{(&dvd[63:62]) && !dvd[61] && !(|dvd[60:0])}} & 6'd1
| {6{(&dvd[63:62]) && !dvd[61] &&  (|dvd[60:0])}} & 6'd2
| {6{(&dvd[63:61]) && !dvd[60] && !(|dvd[59:0])}} & 6'd2
| {6{(&dvd[63:61]) && !dvd[60] &&  (|dvd[59:0])}} & 6'd3
| {6{(&dvd[63:60]) && !dvd[59] && !(|dvd[58:0])}} & 6'd3
| {6{(&dvd[63:60]) && !dvd[59] &&  (|dvd[58:0])}} & 6'd4
| {6{(&dvd[63:59]) && !dvd[58] && !(|dvd[57:0])}} & 6'd4
| {6{(&dvd[63:59]) && !dvd[58] &&  (|dvd[57:0])}} & 6'd5
| {6{(&dvd[63:58]) && !dvd[57] && !(|dvd[56:0])}} & 6'd5
| {6{(&dvd[63:58]) && !dvd[57] &&  (|dvd[56:0])}} & 6'd6
| {6{(&dvd[63:57]) && !dvd[56] && !(|dvd[55:0])}} & 6'd6
| {6{(&dvd[63:57]) && !dvd[56] &&  (|dvd[55:0])}} & 6'd7
| {6{(&dvd[63:56]) && !dvd[55] && !(|dvd[54:0])}} & 6'd7
| {6{(&dvd[63:56]) && !dvd[55] &&  (|dvd[54:0])}} & 6'd8
| {6{(&dvd[63:55]) && !dvd[54] && !(|dvd[53:0])}} & 6'd8
| {6{(&dvd[63:55]) && !dvd[54] &&  (|dvd[53:0])}} & 6'd9
| {6{(&dvd[63:54]) && !dvd[53] && !(|dvd[52:0])}} & 6'd9
| {6{(&dvd[63:54]) && !dvd[53] &&  (|dvd[52:0])}} & 6'd10
| {6{(&dvd[63:53]) && !dvd[52] && !(|dvd[51:0])}} & 6'd10
| {6{(&dvd[63:53]) && !dvd[52] &&  (|dvd[51:0])}} & 6'd11
| {6{(&dvd[63:52]) && !dvd[51] && !(|dvd[50:0])}} & 6'd11
| {6{(&dvd[63:52]) && !dvd[51] &&  (|dvd[50:0])}} & 6'd12
| {6{(&dvd[63:51]) && !dvd[50] && !(|dvd[49:0])}} & 6'd12
| {6{(&dvd[63:51]) && !dvd[50] &&  (|dvd[49:0])}} & 6'd13
| {6{(&dvd[63:50]) && !dvd[49] && !(|dvd[48:0])}} & 6'd13
| {6{(&dvd[63:50]) && !dvd[49] &&  (|dvd[48:0])}} & 6'd14
| {6{(&dvd[63:49]) && !dvd[48] && !(|dvd[47:0])}} & 6'd14
| {6{(&dvd[63:49]) && !dvd[48] &&  (|dvd[47:0])}} & 6'd15
| {6{(&dvd[63:48]) && !dvd[47] && !(|dvd[46:0])}} & 6'd15
| {6{(&dvd[63:48]) && !dvd[47] &&  (|dvd[46:0])}} & 6'd16
| {6{(&dvd[63:47]) && !dvd[46] && !(|dvd[45:0])}} & 6'd16
| {6{(&dvd[63:47]) && !dvd[46] &&  (|dvd[45:0])}} & 6'd17
| {6{(&dvd[63:46]) && !dvd[45] && !(|dvd[44:0])}} & 6'd17
| {6{(&dvd[63:46]) && !dvd[45] &&  (|dvd[44:0])}} & 6'd18
| {6{(&dvd[63:45]) && !dvd[44] && !(|dvd[43:0])}} & 6'd18
| {6{(&dvd[63:45]) && !dvd[44] &&  (|dvd[43:0])}} & 6'd19
| {6{(&dvd[63:44]) && !dvd[43] && !(|dvd[42:0])}} & 6'd19
| {6{(&dvd[63:44]) && !dvd[43] &&  (|dvd[42:0])}} & 6'd20
| {6{(&dvd[63:43]) && !dvd[42] && !(|dvd[41:0])}} & 6'd20
| {6{(&dvd[63:43]) && !dvd[42] &&  (|dvd[41:0])}} & 6'd21
| {6{(&dvd[63:42]) && !dvd[41] && !(|dvd[40:0])}} & 6'd21
| {6{(&dvd[63:42]) && !dvd[41] &&  (|dvd[40:0])}} & 6'd22
| {6{(&dvd[63:41]) && !dvd[40] && !(|dvd[39:0])}} & 6'd22
| {6{(&dvd[63:41]) && !dvd[40] &&  (|dvd[39:0])}} & 6'd23
| {6{(&dvd[63:40]) && !dvd[39] && !(|dvd[38:0])}} & 6'd23
| {6{(&dvd[63:40]) && !dvd[39] &&  (|dvd[38:0])}} & 6'd24
| {6{(&dvd[63:39]) && !dvd[38] && !(|dvd[37:0])}} & 6'd24
| {6{(&dvd[63:39]) && !dvd[38] &&  (|dvd[37:0])}} & 6'd25
| {6{(&dvd[63:38]) && !dvd[37] && !(|dvd[36:0])}} & 6'd25
| {6{(&dvd[63:38]) && !dvd[37] &&  (|dvd[36:0])}} & 6'd26
| {6{(&dvd[63:37]) && !dvd[36] && !(|dvd[35:0])}} & 6'd26
| {6{(&dvd[63:37]) && !dvd[36] &&  (|dvd[35:0])}} & 6'd27
| {6{(&dvd[63:36]) && !dvd[35] && !(|dvd[34:0])}} & 6'd27
| {6{(&dvd[63:36]) && !dvd[35] &&  (|dvd[34:0])}} & 6'd28
| {6{(&dvd[63:35]) && !dvd[34] && !(|dvd[33:0])}} & 6'd28
| {6{(&dvd[63:35]) && !dvd[34] &&  (|dvd[33:0])}} & 6'd29
| {6{(&dvd[63:34]) && !dvd[33] && !(|dvd[32:0])}} & 6'd29
| {6{(&dvd[63:34]) && !dvd[33] &&  (|dvd[32:0])}} & 6'd30
| {6{(&dvd[63:33]) && !dvd[32] && !(|dvd[31:0])}} & 6'd30
| {6{(&dvd[63:33]) && !dvd[32] &&  (|dvd[31:0])}} & 6'd31
| {6{(&dvd[63:32]) && !dvd[31] && !(|dvd[30:0])}} & 6'd31
| {6{(&dvd[63:32]) && !dvd[31] &&  (|dvd[30:0])}} & 6'd32
| {6{(&dvd[63:31]) && !dvd[30] && !(|dvd[29:0])}} & 6'd32
| {6{(&dvd[63:31]) && !dvd[30] &&  (|dvd[29:0])}} & 6'd33
| {6{(&dvd[63:30]) && !dvd[29] && !(|dvd[28:0])}} & 6'd33
| {6{(&dvd[63:30]) && !dvd[29] &&  (|dvd[28:0])}} & 6'd34
| {6{(&dvd[63:29]) && !dvd[28] && !(|dvd[27:0])}} & 6'd34
| {6{(&dvd[63:29]) && !dvd[28] &&  (|dvd[27:0])}} & 6'd35
| {6{(&dvd[63:28]) && !dvd[27] && !(|dvd[26:0])}} & 6'd35
| {6{(&dvd[63:28]) && !dvd[27] &&  (|dvd[26:0])}} & 6'd36
| {6{(&dvd[63:27]) && !dvd[26] && !(|dvd[25:0])}} & 6'd36
| {6{(&dvd[63:27]) && !dvd[26] &&  (|dvd[25:0])}} & 6'd37
| {6{(&dvd[63:26]) && !dvd[25] && !(|dvd[24:0])}} & 6'd37
| {6{(&dvd[63:26]) && !dvd[25] &&  (|dvd[24:0])}} & 6'd38
| {6{(&dvd[63:25]) && !dvd[24] && !(|dvd[23:0])}} & 6'd38
| {6{(&dvd[63:25]) && !dvd[24] &&  (|dvd[23:0])}} & 6'd39
| {6{(&dvd[63:24]) && !dvd[23] && !(|dvd[22:0])}} & 6'd39
| {6{(&dvd[63:24]) && !dvd[23] &&  (|dvd[22:0])}} & 6'd40
| {6{(&dvd[63:23]) && !dvd[22] && !(|dvd[21:0])}} & 6'd40
| {6{(&dvd[63:23]) && !dvd[22] &&  (|dvd[21:0])}} & 6'd41
| {6{(&dvd[63:22]) && !dvd[21] && !(|dvd[20:0])}} & 6'd41
| {6{(&dvd[63:22]) && !dvd[21] &&  (|dvd[20:0])}} & 6'd42
| {6{(&dvd[63:21]) && !dvd[20] && !(|dvd[19:0])}} & 6'd42
| {6{(&dvd[63:21]) && !dvd[20] &&  (|dvd[19:0])}} & 6'd43
| {6{(&dvd[63:20]) && !dvd[19] && !(|dvd[18:0])}} & 6'd43
| {6{(&dvd[63:20]) && !dvd[19] &&  (|dvd[18:0])}} & 6'd44
| {6{(&dvd[63:19]) && !dvd[18] && !(|dvd[17:0])}} & 6'd44
| {6{(&dvd[63:19]) && !dvd[18] &&  (|dvd[17:0])}} & 6'd45
| {6{(&dvd[63:18]) && !dvd[17] && !(|dvd[16:0])}} & 6'd45
| {6{(&dvd[63:18]) && !dvd[17] &&  (|dvd[16:0])}} & 6'd46
| {6{(&dvd[63:17]) && !dvd[16] && !(|dvd[15:0])}} & 6'd46
| {6{(&dvd[63:17]) && !dvd[16] &&  (|dvd[15:0])}} & 6'd47
| {6{(&dvd[63:16]) && !dvd[15] && !(|dvd[14:0])}} & 6'd47
| {6{(&dvd[63:16]) && !dvd[15] &&  (|dvd[14:0])}} & 6'd48
| {6{(&dvd[63:15]) && !dvd[14] && !(|dvd[13:0])}} & 6'd48
| {6{(&dvd[63:15]) && !dvd[14] &&  (|dvd[13:0])}} & 6'd49
| {6{(&dvd[63:14]) && !dvd[13] && !(|dvd[12:0])}} & 6'd49
| {6{(&dvd[63:14]) && !dvd[13] &&  (|dvd[12:0])}} & 6'd50
| {6{(&dvd[63:13]) && !dvd[12] && !(|dvd[11:0])}} & 6'd50
| {6{(&dvd[63:13]) && !dvd[12] &&  (|dvd[11:0])}} & 6'd51
| {6{(&dvd[63:12]) && !dvd[11] && !(|dvd[10:0])}} & 6'd51
| {6{(&dvd[63:12]) && !dvd[11] &&  (|dvd[10:0])}} & 6'd52
| {6{(&dvd[63:11]) && !dvd[10] && !(|dvd[9:0])}}  & 6'd52
| {6{(&dvd[63:11]) && !dvd[10] &&  (|dvd[9:0])}}  & 6'd53
| {6{(&dvd[63:10]) && !dvd[9]  && !(|dvd[8:0])}}  & 6'd53
| {6{(&dvd[63:10]) && !dvd[9]  &&  (|dvd[8:0])}}  & 6'd54
| {6{(&dvd[63:9])  && !dvd[8]  && !(|dvd[7:0])}}  & 6'd54
| {6{(&dvd[63:9])  && !dvd[8]  &&  (|dvd[7:0])}}  & 6'd55
| {6{(&dvd[63:8])  && !dvd[7]  && !(|dvd[6:0])}}  & 6'd55
| {6{(&dvd[63:8])  && !dvd[7]  &&  (|dvd[6:0])}}  & 6'd56
| {6{(&dvd[63:7])  && !dvd[6]  && !(|dvd[5:0])}}  & 6'd56
| {6{(&dvd[63:7])  && !dvd[6]  &&  (|dvd[5:0])}}  & 6'd57
| {6{(&dvd[63:6])  && !dvd[5]  && !(|dvd[4:0])}}  & 6'd57
| {6{(&dvd[63:6])  && !dvd[5]  &&  (|dvd[4:0])}}  & 6'd58
| {6{(&dvd[63:5])  && !dvd[4]  && !(|dvd[3:0])}}  & 6'd58
| {6{(&dvd[63:5])  && !dvd[4]  &&  (|dvd[3:0])}}  & 6'd59
| {6{(&dvd[63:4])  && !dvd[3]  && !(|dvd[2:0])}}  & 6'd59
| {6{(&dvd[63:4])  && !dvd[3]  &&  (|dvd[2:0])}}  & 6'd60
| {6{(&dvd[63:3])  && !dvd[2]  && !(|dvd[1:0])}}  & 6'd60
| {6{(&dvd[63:3])  && !dvd[2]  &&  (|dvd[1:0])}}  & 6'd61
| {6{(&dvd[63:2])  && !dvd[1]  &&   !dvd[0]}}     & 6'd61
| {6{(&dvd[63:2])  && !dvd[1]  &&    dvd[0]}}     & 6'd62
| {6{(&dvd[63:1])  && !dvd[0]}}                   & 6'd62
| {6{(&dvd[63:0])}}                               & 6'd63;

assign div_ex1_src1_neg_ff1_disp[5:0] =
  {6{ !dvr[63]                 && !(|dvr[61:0])}} & 6'd63
| {6{ !dvr[63]                 &&  (|dvr[61:0])}} & 6'd0
| {6{  dvr[63]     && !dvr[62] && !(|dvr[61:0])}} & 6'd0
| {6{  dvr[63]     && !dvr[62] &&  (|dvr[61:0])}} & 6'd1
| {6{(&dvr[63:62]) && !dvr[61] && !(|dvr[60:0])}} & 6'd1
| {6{(&dvr[63:62]) && !dvr[61] &&  (|dvr[60:0])}} & 6'd2
| {6{(&dvr[63:61]) && !dvr[60] && !(|dvr[59:0])}} & 6'd2
| {6{(&dvr[63:61]) && !dvr[60] &&  (|dvr[59:0])}} & 6'd3
| {6{(&dvr[63:60]) && !dvr[59] && !(|dvr[58:0])}} & 6'd3
| {6{(&dvr[63:60]) && !dvr[59] &&  (|dvr[58:0])}} & 6'd4
| {6{(&dvr[63:59]) && !dvr[58] && !(|dvr[57:0])}} & 6'd4
| {6{(&dvr[63:59]) && !dvr[58] &&  (|dvr[57:0])}} & 6'd5
| {6{(&dvr[63:58]) && !dvr[57] && !(|dvr[56:0])}} & 6'd5
| {6{(&dvr[63:58]) && !dvr[57] &&  (|dvr[56:0])}} & 6'd6
| {6{(&dvr[63:57]) && !dvr[56] && !(|dvr[55:0])}} & 6'd6
| {6{(&dvr[63:57]) && !dvr[56] &&  (|dvr[55:0])}} & 6'd7
| {6{(&dvr[63:56]) && !dvr[55] && !(|dvr[54:0])}} & 6'd7
| {6{(&dvr[63:56]) && !dvr[55] &&  (|dvr[54:0])}} & 6'd8
| {6{(&dvr[63:55]) && !dvr[54] && !(|dvr[53:0])}} & 6'd8
| {6{(&dvr[63:55]) && !dvr[54] &&  (|dvr[53:0])}} & 6'd9
| {6{(&dvr[63:54]) && !dvr[53] && !(|dvr[52:0])}} & 6'd9
| {6{(&dvr[63:54]) && !dvr[53] &&  (|dvr[52:0])}} & 6'd10
| {6{(&dvr[63:53]) && !dvr[52] && !(|dvr[51:0])}} & 6'd10
| {6{(&dvr[63:53]) && !dvr[52] &&  (|dvr[51:0])}} & 6'd11
| {6{(&dvr[63:52]) && !dvr[51] && !(|dvr[50:0])}} & 6'd11
| {6{(&dvr[63:52]) && !dvr[51] &&  (|dvr[50:0])}} & 6'd12
| {6{(&dvr[63:51]) && !dvr[50] && !(|dvr[49:0])}} & 6'd12
| {6{(&dvr[63:51]) && !dvr[50] &&  (|dvr[49:0])}} & 6'd13
| {6{(&dvr[63:50]) && !dvr[49] && !(|dvr[48:0])}} & 6'd13
| {6{(&dvr[63:50]) && !dvr[49] &&  (|dvr[48:0])}} & 6'd14
| {6{(&dvr[63:49]) && !dvr[48] && !(|dvr[47:0])}} & 6'd14
| {6{(&dvr[63:49]) && !dvr[48] &&  (|dvr[47:0])}} & 6'd15
| {6{(&dvr[63:48]) && !dvr[47] && !(|dvr[46:0])}} & 6'd15
| {6{(&dvr[63:48]) && !dvr[47] &&  (|dvr[46:0])}} & 6'd16
| {6{(&dvr[63:47]) && !dvr[46] && !(|dvr[45:0])}} & 6'd16
| {6{(&dvr[63:47]) && !dvr[46] &&  (|dvr[45:0])}} & 6'd17
| {6{(&dvr[63:46]) && !dvr[45] && !(|dvr[44:0])}} & 6'd17
| {6{(&dvr[63:46]) && !dvr[45] &&  (|dvr[44:0])}} & 6'd18
| {6{(&dvr[63:45]) && !dvr[44] && !(|dvr[43:0])}} & 6'd18
| {6{(&dvr[63:45]) && !dvr[44] &&  (|dvr[43:0])}} & 6'd19
| {6{(&dvr[63:44]) && !dvr[43] && !(|dvr[42:0])}} & 6'd19
| {6{(&dvr[63:44]) && !dvr[43] &&  (|dvr[42:0])}} & 6'd20
| {6{(&dvr[63:43]) && !dvr[42] && !(|dvr[41:0])}} & 6'd20
| {6{(&dvr[63:43]) && !dvr[42] &&  (|dvr[41:0])}} & 6'd21
| {6{(&dvr[63:42]) && !dvr[41] && !(|dvr[40:0])}} & 6'd21
| {6{(&dvr[63:42]) && !dvr[41] &&  (|dvr[40:0])}} & 6'd22
| {6{(&dvr[63:41]) && !dvr[40] && !(|dvr[39:0])}} & 6'd22
| {6{(&dvr[63:41]) && !dvr[40] &&  (|dvr[39:0])}} & 6'd23
| {6{(&dvr[63:40]) && !dvr[39] && !(|dvr[38:0])}} & 6'd23
| {6{(&dvr[63:40]) && !dvr[39] &&  (|dvr[38:0])}} & 6'd24
| {6{(&dvr[63:39]) && !dvr[38] && !(|dvr[37:0])}} & 6'd24
| {6{(&dvr[63:39]) && !dvr[38] &&  (|dvr[37:0])}} & 6'd25
| {6{(&dvr[63:38]) && !dvr[37] && !(|dvr[36:0])}} & 6'd25
| {6{(&dvr[63:38]) && !dvr[37] &&  (|dvr[36:0])}} & 6'd26
| {6{(&dvr[63:37]) && !dvr[36] && !(|dvr[35:0])}} & 6'd26
| {6{(&dvr[63:37]) && !dvr[36] &&  (|dvr[35:0])}} & 6'd27
| {6{(&dvr[63:36]) && !dvr[35] && !(|dvr[34:0])}} & 6'd27
| {6{(&dvr[63:36]) && !dvr[35] &&  (|dvr[34:0])}} & 6'd28
| {6{(&dvr[63:35]) && !dvr[34] && !(|dvr[33:0])}} & 6'd28
| {6{(&dvr[63:35]) && !dvr[34] &&  (|dvr[33:0])}} & 6'd29
| {6{(&dvr[63:34]) && !dvr[33] && !(|dvr[32:0])}} & 6'd29
| {6{(&dvr[63:34]) && !dvr[33] &&  (|dvr[32:0])}} & 6'd30
| {6{(&dvr[63:33]) && !dvr[32] && !(|dvr[31:0])}} & 6'd30
| {6{(&dvr[63:33]) && !dvr[32] &&  (|dvr[31:0])}} & 6'd31
| {6{(&dvr[63:32]) && !dvr[31] && !(|dvr[30:0])}} & 6'd31
| {6{(&dvr[63:32]) && !dvr[31] &&  (|dvr[30:0])}} & 6'd32
| {6{(&dvr[63:31]) && !dvr[30] && !(|dvr[29:0])}} & 6'd32
| {6{(&dvr[63:31]) && !dvr[30] &&  (|dvr[29:0])}} & 6'd33
| {6{(&dvr[63:30]) && !dvr[29] && !(|dvr[28:0])}} & 6'd33
| {6{(&dvr[63:30]) && !dvr[29] &&  (|dvr[28:0])}} & 6'd34
| {6{(&dvr[63:29]) && !dvr[28] && !(|dvr[27:0])}} & 6'd34
| {6{(&dvr[63:29]) && !dvr[28] &&  (|dvr[27:0])}} & 6'd35
| {6{(&dvr[63:28]) && !dvr[27] && !(|dvr[26:0])}} & 6'd35
| {6{(&dvr[63:28]) && !dvr[27] &&  (|dvr[26:0])}} & 6'd36
| {6{(&dvr[63:27]) && !dvr[26] && !(|dvr[25:0])}} & 6'd36
| {6{(&dvr[63:27]) && !dvr[26] &&  (|dvr[25:0])}} & 6'd37
| {6{(&dvr[63:26]) && !dvr[25] && !(|dvr[24:0])}} & 6'd37
| {6{(&dvr[63:26]) && !dvr[25] &&  (|dvr[24:0])}} & 6'd38
| {6{(&dvr[63:25]) && !dvr[24] && !(|dvr[23:0])}} & 6'd38
| {6{(&dvr[63:25]) && !dvr[24] &&  (|dvr[23:0])}} & 6'd39
| {6{(&dvr[63:24]) && !dvr[23] && !(|dvr[22:0])}} & 6'd39
| {6{(&dvr[63:24]) && !dvr[23] &&  (|dvr[22:0])}} & 6'd40
| {6{(&dvr[63:23]) && !dvr[22] && !(|dvr[21:0])}} & 6'd40
| {6{(&dvr[63:23]) && !dvr[22] &&  (|dvr[21:0])}} & 6'd41
| {6{(&dvr[63:22]) && !dvr[21] && !(|dvr[20:0])}} & 6'd41
| {6{(&dvr[63:22]) && !dvr[21] &&  (|dvr[20:0])}} & 6'd42
| {6{(&dvr[63:21]) && !dvr[20] && !(|dvr[19:0])}} & 6'd42
| {6{(&dvr[63:21]) && !dvr[20] &&  (|dvr[19:0])}} & 6'd43
| {6{(&dvr[63:20]) && !dvr[19] && !(|dvr[18:0])}} & 6'd43
| {6{(&dvr[63:20]) && !dvr[19] &&  (|dvr[18:0])}} & 6'd44
| {6{(&dvr[63:19]) && !dvr[18] && !(|dvr[17:0])}} & 6'd44
| {6{(&dvr[63:19]) && !dvr[18] &&  (|dvr[17:0])}} & 6'd45
| {6{(&dvr[63:18]) && !dvr[17] && !(|dvr[16:0])}} & 6'd45
| {6{(&dvr[63:18]) && !dvr[17] &&  (|dvr[16:0])}} & 6'd46
| {6{(&dvr[63:17]) && !dvr[16] && !(|dvr[15:0])}} & 6'd46
| {6{(&dvr[63:17]) && !dvr[16] &&  (|dvr[15:0])}} & 6'd47
| {6{(&dvr[63:16]) && !dvr[15] && !(|dvr[14:0])}} & 6'd47
| {6{(&dvr[63:16]) && !dvr[15] &&  (|dvr[14:0])}} & 6'd48
| {6{(&dvr[63:15]) && !dvr[14] && !(|dvr[13:0])}} & 6'd48
| {6{(&dvr[63:15]) && !dvr[14] &&  (|dvr[13:0])}} & 6'd49
| {6{(&dvr[63:14]) && !dvr[13] && !(|dvr[12:0])}} & 6'd49
| {6{(&dvr[63:14]) && !dvr[13] &&  (|dvr[12:0])}} & 6'd50
| {6{(&dvr[63:13]) && !dvr[12] && !(|dvr[11:0])}} & 6'd50
| {6{(&dvr[63:13]) && !dvr[12] &&  (|dvr[11:0])}} & 6'd51
| {6{(&dvr[63:12]) && !dvr[11] && !(|dvr[10:0])}} & 6'd51
| {6{(&dvr[63:12]) && !dvr[11] &&  (|dvr[10:0])}} & 6'd52
| {6{(&dvr[63:11]) && !dvr[10] && !(|dvr[9:0])}}  & 6'd52
| {6{(&dvr[63:11]) && !dvr[10] &&  (|dvr[9:0])}}  & 6'd53
| {6{(&dvr[63:10]) && !dvr[9]  && !(|dvr[8:0])}}  & 6'd53
| {6{(&dvr[63:10]) && !dvr[9]  &&  (|dvr[8:0])}}  & 6'd54
| {6{(&dvr[63:9])  && !dvr[8]  && !(|dvr[7:0])}}  & 6'd54
| {6{(&dvr[63:9])  && !dvr[8]  &&  (|dvr[7:0])}}  & 6'd55
| {6{(&dvr[63:8])  && !dvr[7]  && !(|dvr[6:0])}}  & 6'd55
| {6{(&dvr[63:8])  && !dvr[7]  &&  (|dvr[6:0])}}  & 6'd56
| {6{(&dvr[63:7])  && !dvr[6]  && !(|dvr[5:0])}}  & 6'd56
| {6{(&dvr[63:7])  && !dvr[6]  &&  (|dvr[5:0])}}  & 6'd57
| {6{(&dvr[63:6])  && !dvr[5]  && !(|dvr[4:0])}}  & 6'd57
| {6{(&dvr[63:6])  && !dvr[5]  &&  (|dvr[4:0])}}  & 6'd58
| {6{(&dvr[63:5])  && !dvr[4]  && !(|dvr[3:0])}}  & 6'd58
| {6{(&dvr[63:5])  && !dvr[4]  &&  (|dvr[3:0])}}  & 6'd59
| {6{(&dvr[63:4])  && !dvr[3]  && !(|dvr[2:0])}}  & 6'd59
| {6{(&dvr[63:4])  && !dvr[3]  &&  (|dvr[2:0])}}  & 6'd60
| {6{(&dvr[63:3])  && !dvr[2]  && !(|dvr[1:0])}}  & 6'd60
| {6{(&dvr[63:3])  && !dvr[2]  &&  (|dvr[1:0])}}  & 6'd61
| {6{(&dvr[63:2])  && !dvr[1]  &&   !dvr[0]}}     & 6'd61
| {6{(&dvr[63:2])  && !dvr[1]  &&    dvr[0]}}     & 6'd62
| {6{(&dvr[63:1])  && !dvr[0]}}                   & 6'd62
| {6{(&dvr[63:0])}}                               & 6'd63;

assign div_ex1_src0_ff1_disp[5:0] = (div_ex1_sign_en && div_ex1_div_src0[63])
                                    ? div_ex1_src0_neg_ff1_disp[5:0]
                                    : div_ex1_src0_pos_ff1_disp[5:0];
assign div_ex1_src1_ff1_disp[5:0] = (div_ex1_sign_en && div_ex1_div_src1[63])
                                    ? div_ex1_src1_neg_ff1_disp[5:0]
                                    : div_ex1_src1_pos_ff1_disp[5:0];

//----------------------------------------------------------
//               absolute the two operand
//----------------------------------------------------------
assign div_ex1_src0_neg[63:0] = ~div_ex1_div_src0[63:0] + 64'b1;
assign div_ex1_src1_neg[63:0] = ~div_ex1_div_src1[63:0] + 64'b1;

assign div_ex1_src0_abs[63:0] = (div_ex1_sign_en && div_ex1_div_src0[63])
                                ? div_ex1_src0_neg[63:0]
                                : div_ex1_div_src0[63:0];
assign div_ex1_src1_abs[63:0] = (div_ex1_sign_en && div_ex1_div_src1[63])
                                ? div_ex1_src1_neg[63:0]
                                : div_ex1_div_src1[63:0];
assign div_ex1_div_result_neg     = div_ex1_sign_en
                                && (div_ex1_div_src0[63] ^ div_ex1_div_src1[63]);
assign div_ex1_rem_result_neg     = div_ex1_sign_en && div_ex1_div_src0[63];
//temporarily save dvd and dvr to srt register
assign x_srt_shift_vld        = div_ex1_inst_vld;
assign x_srt_dvd[63:0]        = div_ex1_src0_abs[63:0];
assign x_srt_dvr[63:0]        = div_ex1_src1_abs[63:0];

//----------------------------------------------------------
//                  Complete to Cbus
//----------------------------------------------------------
assign div_ex1_div_by_0       = (div_ex1_div_src1[63:0] == 64'b0);
assign div_ex1_overflow       = div_ex1_sign_en
                                && (div_ex1_div_src0[63:0] == 64'h8000000000000000)
                                && (div_ex1_div_src1[63:0] == 64'hffffffffffffffff);
assign div_ex1_match_entry0   = !cp0_iu_div_entry_disable
                             && (div_ex1_sign_en    == div_entry0_sign_en)
                             && (div_ex1_word_width == div_entry0_word_width)
                             && (div_ex1_src0[63:0] == div_entry0_src0[63:0])
                             && (div_ex1_src1[63:0] == div_entry0_src1[63:0]);
assign div_ex1_match_entry1   = !cp0_iu_div_entry_disable
                             && (div_ex1_sign_en    == div_entry1_sign_en)
                             && (div_ex1_word_width == div_entry1_word_width)
                             && (div_ex1_src0[63:0] == div_entry1_src0[63:0])
                             && (div_ex1_src1[63:0] == div_entry1_src1[63:0]);

assign div_ex1_special_result = div_ex1_div_by_0
                                || div_ex1_overflow
                                || div_ex1_match_entry0
                                || div_ex1_match_entry1;

//==========================================================
//                      EX2 Stage
//==========================================================
//----------------------------------------------------------
//               Special Result Selection
//----------------------------------------------------------
always @(posedge div_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    div_result_div_by_0 <= 1'b0;
    div_result_overflow <= 1'b0;
    div_result_entry0   <= 1'b0;
    div_result_entry1   <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    div_result_div_by_0 <= 1'b0;
    div_result_overflow <= 1'b0;
    div_result_entry0   <= 1'b0;
    div_result_entry1   <= 1'b0;
  end
  else if(div_ex1_inst_vld) begin
    div_result_div_by_0 <= div_ex1_div_by_0;
    div_result_overflow <= div_ex1_overflow;
    div_result_entry0   <= div_ex1_match_entry0;
    div_result_entry1   <= div_ex1_match_entry1;
  end
  else begin
    div_result_div_by_0 <= div_result_div_by_0;
    div_result_overflow <= div_result_overflow;
    div_result_entry0   <= div_result_entry0;
    div_result_entry1   <= div_result_entry1;
  end
end

assign div_result_expt     = div_result_div_by_0
                          || div_result_overflow
                          || div_result_disp_0;

assign div_result_normal = !(div_result_expt
                          || div_result_entry0
                          || div_result_entry1);

//----------------------------------------------------------
//                    FF1 Displacement
//----------------------------------------------------------
always @(posedge ex2_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    div_ex2_dvd_disp[5:0] <= 6'b0;
    div_ex2_dvr_disp[5:0] <= 6'b0;
  end
  else if(div_ex1_inst_vld) begin
    div_ex2_dvd_disp[5:0] <= div_ex1_src0_ff1_disp[5:0];
    div_ex2_dvr_disp[5:0] <= div_ex1_src1_ff1_disp[5:0];
  end
  else begin
    div_ex2_dvd_disp[5:0] <= div_ex2_dvd_disp[5:0];
    div_ex2_dvr_disp[5:0] <= div_ex2_dvr_disp[5:0];
  end
end

assign div_exp_disp[6:0]  = {1'b0, div_ex2_dvr_disp[5:0]}
                            - {1'b0, div_ex2_dvd_disp[5:0]};

assign div_ex2_disp_0     = div_exp_disp[6];

//==========================================================
//                      EX3 Stage
//==========================================================
always @(posedge div_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    div_result_disp_0 <= 1'b0;
  else if(rtu_yy_xx_flush)
    div_result_disp_0 <= 1'b0;
  else if(div_ex1_inst_vld)
    div_result_disp_0 <= 1'b0;
  else if(div_ex2_inst_vld)
    div_result_disp_0 <= div_ex2_disp_0;
  else
    div_result_disp_0 <= div_result_disp_0;
end

//==========================================================
//                    SRT Division
//==========================================================
//----------------------------------------------------------
//                SRT Operand Prepare
//----------------------------------------------------------
//1.subtraction between dividend and divisor
//2.shift divisor by the subtraction result
//the MSB 32 of dvr is all 0, so ff1 disp should add 32,
//which is combined with 1'b1
//assign x_srt_inst_vld       = div_ex2_inst_vld && !div_ex2_disp_0;

//assign x_srt_dividend[63:0] = x_srt_dvd_saved[63:0] << div_ex2_dvd_disp[5:0];
//assign x_srt_divisor[63:0]  = x_srt_dvr_saved[63:0] << div_ex2_dvr_disp[5:0];
//assign x_srt_exp_disp[6:0]  = div_exp_disp[6:0];
//assign x_srt_dvr_disp[5:0]  = div_ex2_dvr_disp[5:0];

//----------------------------------------------------------
//                      EX3 stage
//----------------------------------------------------------
//----------------------------------------------------------
//                    Instance SRT
//----------------------------------------------------------
// &Instance("ct_iu_div_srt_radix16", "x_ct_iu_div_srt_radix16"); @799
ct_iu_div_srt_radix16  x_ct_iu_div_srt_radix16 (
  .cp0_iu_icg_en      (cp0_iu_icg_en     ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .cpurst_b           (cpurst_b          ),
  .div_ex2_disp_0     (div_ex2_disp_0    ),
  .div_ex2_dvd_disp   (div_ex2_dvd_disp  ),
  .div_ex2_dvr_disp   (div_ex2_dvr_disp  ),
  .div_ex2_inst_vld   (div_ex2_inst_vld  ),
  .div_exp_disp       (div_exp_disp      ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rtu_yy_xx_flush    (rtu_yy_xx_flush   ),
  .srt_iter_finish    (srt_iter_finish   ),
  .x_srt_div_result   (x_srt_div_result  ),
  .x_srt_dvd          (x_srt_dvd         ),
  .x_srt_dvr          (x_srt_dvr         ),
  .x_srt_finish       (x_srt_finish      ),
  .x_srt_on           (x_srt_on          ),
  .x_srt_rem_result   (x_srt_rem_result  ),
  .x_srt_select_vld   (x_srt_select_vld  ),
  .x_srt_shift_vld    (x_srt_shift_vld   )
);

always @(posedge  div_clk or negedge cpurst_b)
begin
    if(!cpurst_b)
        srt_on    <= 1'b0;
    else if(rtu_yy_xx_flush)
        srt_on    <= 1'b0;
    else if(srt_init)
        srt_on    <= 1'b1;
    else if(srt_iter_finish)
        srt_on    <= 1'b0;
end
assign x_srt_on         = srt_on;
assign srt_init         = div_ex2_inst_vld && !div_ex2_disp_0;
//----------------------------------------------------------
//                      EX4 stage
//----------------------------------------------------------
//----------------------------------------------------------
//                    Result Select
//----------------------------------------------------------
assign x_srt_select_vld = div_ex4_inst_vld;

//==========================================================
//                   SRT Divide Result
//==========================================================
//----------------------------------------------------------
//                    Result Process
//----------------------------------------------------------
assign srt_div_sign_result[63:0] = (div_ex1_div_result_neg)
                                   ? (~x_srt_div_result[63:0] + 64'b1)
                                   : x_srt_div_result[63:0];

assign srt_rem_sign_result[63:0] = (div_ex1_rem_result_neg)
                                   ? (~x_srt_rem_result[63:0] + 64'b1)
                                   : x_srt_rem_result[63:0];

assign srt_div_result[63:0]      = (div_ex1_word_width)
                                   ? {{32{srt_div_sign_result[31]}},
                                          srt_div_sign_result[31:0]}
                                   : srt_div_sign_result[63:0];

assign srt_rem_result[63:0]      = (div_ex1_word_width)
                                   ? {{32{srt_rem_sign_result[31]}},
                                          srt_rem_sign_result[31:0]}
                                   : srt_rem_sign_result[63:0];

//==========================================================
//                   Instance Div Entry
//==========================================================
// &Instance("ct_iu_div_entry", "x_ct_iu_div_entry"); @848
ct_iu_div_entry  x_ct_iu_div_entry (
  .cp0_iu_div_entry_disable_clr (cp0_iu_div_entry_disable_clr),
  .cp0_iu_icg_en                (cp0_iu_icg_en               ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .div_clk                      (div_clk                     ),
  .div_entry0_read_data         (div_entry0_read_data        ),
  .div_entry0_read_vld          (div_entry0_read_vld         ),
  .div_entry1_read_data         (div_entry1_read_data        ),
  .div_entry1_read_vld          (div_entry1_read_vld         ),
  .div_entry_write_data         (div_entry_write_data        ),
  .div_entry_write_en           (div_entry_write_en          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


//----------------------------------------------------------
//                    read div entry
//----------------------------------------------------------
assign div_entry0_read_vld         = div_wb_inst_vld && div_result_entry0;
assign div_entry1_read_vld         = div_wb_inst_vld && div_result_entry1;

assign div_entry0_src0[63:0]       = div_entry0_read_data[63:0];
assign div_entry0_src1[63:0]       = div_entry0_read_data[127:64];
assign div_entry0_div_result[63:0] = div_entry0_read_data[191:128];
assign div_entry0_rem_result[63:0] = div_entry0_read_data[255:192];
assign div_entry0_sign_en          = div_entry0_read_data[256];
assign div_entry0_word_width       = div_entry0_read_data[257];

assign div_entry1_src0[63:0]       = div_entry1_read_data[63:0];
assign div_entry1_src1[63:0]       = div_entry1_read_data[127:64];
assign div_entry1_div_result[63:0] = div_entry1_read_data[191:128];
assign div_entry1_rem_result[63:0] = div_entry1_read_data[255:192];
assign div_entry1_sign_en          = div_entry1_read_data[256];
assign div_entry1_word_width       = div_entry1_read_data[257];

//----------------------------------------------------------
//                 Write back to div entry
//----------------------------------------------------------
assign div_entry_write_en            = !cp0_iu_div_entry_disable
                                       && div_wb_inst_vld
                                       && div_result_normal;

assign div_entry_write_data[63:0]    = div_ex1_src0[63:0];
assign div_entry_write_data[127:64]  = div_ex1_src1[63:0];
assign div_entry_write_data[191:128] = srt_div_result[63:0];
assign div_entry_write_data[255:192] = srt_rem_result[63:0];
assign div_entry_write_data[256]     = div_ex1_sign_en;
assign div_entry_write_data[257]     = div_ex1_word_width;


//==========================================================
//                   Special Divide Result
//==========================================================
assign expt_div_by_0_div_result[63:0]  = 64'hffffffffffffffff;
//according to riscv-isa-manual issues 56
//when word width, the remainder is extended from lsb32 of src0
assign expt_div_by_0_rem_result[63:0]  = (div_ex1_word_width)
                                         ? {{32{div_ex1_div_src0[31]}},
                                                div_ex1_div_src0[31:0]}
                                         : div_ex1_div_src0[63:0];

assign expt_overflow_div_result[63:0]  = (div_ex1_word_width)
                                         ? 64'hffffffff80000000: 64'h8000000000000000;
assign expt_overflow_rem_result[63:0]  = 64'b0;

assign expt_disp_zero_div_result[63:0] = 64'b0;

assign expt_disp_zero_rem_result[63:0] = div_ex1_div_src0[63:0];

// &CombBeg; @904
always @( expt_overflow_div_result[63:0]
       or expt_div_by_0_div_result[63:0]
       or div_result_div_by_0
       or div_result_overflow
       or expt_disp_zero_div_result[63:0]
       or div_result_disp_0)
begin
  case({div_result_disp_0, div_result_overflow, div_result_div_by_0})
    3'b001 : div_expt_div_result[63:0] = expt_div_by_0_div_result[63:0];
    3'b010 : div_expt_div_result[63:0] = expt_overflow_div_result[63:0];
    3'b100 : div_expt_div_result[63:0] = expt_disp_zero_div_result[63:0];
    default: div_expt_div_result[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @911
end

// &CombBeg; @913
always @( div_result_div_by_0
       or expt_overflow_rem_result[63:0]
       or expt_div_by_0_rem_result[63:0]
       or div_result_overflow
       or div_result_disp_0
       or expt_disp_zero_rem_result[63:0])
begin
  case({div_result_disp_0, div_result_overflow, div_result_div_by_0})
    3'b001 : div_expt_rem_result[63:0] = expt_div_by_0_rem_result[63:0];
    3'b010 : div_expt_rem_result[63:0] = expt_overflow_rem_result[63:0];
    3'b100 : div_expt_rem_result[63:0] = expt_disp_zero_rem_result[63:0];
    default: div_expt_rem_result[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @920
end

//==========================================================
//                   SRT Divide Result
//==========================================================
// &CombBeg; @925
always @( div_result_entry0
       or div_result_entry1
       or div_result_expt
       or div_entry1_div_result[63:0]
       or srt_div_result[63:0]
       or div_expt_div_result[63:0]
       or div_entry0_div_result[63:0]
       or div_result_normal)
begin
  case({div_result_expt, div_result_entry1, div_result_entry0, div_result_normal})
    4'b0001 : div_result_data[63:0] = srt_div_result[63:0];
    4'b0010 : div_result_data[63:0] = div_entry0_div_result[63:0];
    4'b0100 : div_result_data[63:0] = div_entry1_div_result[63:0];
    4'b1000 : div_result_data[63:0] = div_expt_div_result[63:0];
    default : div_result_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @933
end

// &CombBeg; @935
always @( srt_rem_result[63:0]
       or div_entry0_rem_result[63:0]
       or div_result_entry0
       or div_result_entry1
       or div_expt_rem_result[63:0]
       or div_entry1_rem_result[63:0]
       or div_result_expt
       or div_result_normal)
begin
  case({div_result_expt, div_result_entry1, div_result_entry0, div_result_normal})
    4'b0001 : rem_result_data[63:0] = srt_rem_result[63:0];
    4'b0010 : rem_result_data[63:0] = div_entry0_rem_result[63:0];
    4'b0100 : rem_result_data[63:0] = div_entry1_rem_result[63:0];
    4'b1000 : rem_result_data[63:0] = div_expt_rem_result[63:0];
    default : rem_result_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @943
end

//==========================================================
//                    Set data ready
//==========================================================
assign iu_idu_div_inst_vld       = div_wb_inst_vld;
assign iu_idu_div_preg_dup0[6:0] = div_ex1_dst_preg_dup0[6:0];
assign iu_idu_div_preg_dup1[6:0] = div_ex1_dst_preg_dup1[6:0];
assign iu_idu_div_preg_dup2[6:0] = div_ex1_dst_preg_dup2[6:0];
assign iu_idu_div_preg_dup3[6:0] = div_ex1_dst_preg_dup3[6:0];
assign iu_idu_div_preg_dup4[6:0] = div_ex1_dst_preg_dup4[6:0];

//==========================================================
//                 Write Back to Rbus
//==========================================================
assign div_rbus_pipe0_data_vld = div_wb0_inst_vld;
//assign div_rbus_pipe1_data_vld = div_wb1_inst_vld;
assign div_rbus_preg[6:0]      = div_ex1_dst_preg[6:0];
assign div_rbus_data[63:0]     = (div_ex1_div) ? div_result_data[63:0]
                                               : rem_result_data[63:0];

// &ModuleEnd; @964
endmodule


