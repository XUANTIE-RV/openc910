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

// &Depend("cpu_cfig.h"); @22
// &ModuleBeg; @23
module ct_vfdsu_ctrl(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_vfdsu_ex1_pipex_sel,
  dp_vfdsu_fdiv_gateclk_issue,
  dp_vfdsu_idu_fdiv_issue,
  ex1_data_clk,
  ex1_double,
  ex1_pipedown,
  ex1_single,
  ex2_data_clk,
  ex2_pipedown,
  ex2_srt_first_round,
  ex3_data_clk,
  ex3_pipedown,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  pipex_dp_vfdsu_inst_vld,
  rtu_yy_xx_flush,
  srt_ctrl_rem_zero,
  srt_ctrl_skip_srt,
  srt_secd_round,
  srt_sm_on,
  vfdsu_dp_fdiv_busy,
  vfdsu_dp_inst_wb_req,
  vfdsu_ex2_double,
  vfdsu_ex2_single,
  vfdsu_ifu_debug_ex2_wait,
  vfdsu_ifu_debug_idle,
  vfdsu_ifu_debug_pipe_busy
);

// &Ports; @24
input          cp0_vfpu_icg_en;            
input          cp0_yy_clk_en;              
input          cpurst_b;                   
input          dp_vfdsu_ex1_pipex_sel;     
input          dp_vfdsu_fdiv_gateclk_issue; 
input          dp_vfdsu_idu_fdiv_issue;    
input          ex1_double;                 
input          ex1_single;                 
input          forever_cpuclk;             
input          pad_yy_icg_scan_en;         
input          rtu_yy_xx_flush;            
input          srt_ctrl_rem_zero;          
input          srt_ctrl_skip_srt;          
input          vfdsu_ex2_double;           
input          vfdsu_ex2_single;           
output         ex1_data_clk;               
output         ex1_pipedown;               
output         ex2_data_clk;               
output         ex2_pipedown;               
output         ex2_srt_first_round;        
output         ex3_data_clk;               
output         ex3_pipedown;               
output         pipex_dp_vfdsu_inst_vld;    
output         srt_secd_round;             
output         srt_sm_on;                  
output         vfdsu_dp_fdiv_busy;         
output         vfdsu_dp_inst_wb_req;       
output         vfdsu_ifu_debug_ex2_wait;   
output         vfdsu_ifu_debug_idle;       
output         vfdsu_ifu_debug_pipe_busy;  

// &Regs; @25
reg     [3:0]  div_cur_state;              
reg     [3:0]  div_next_state;             
reg            ex2_srt_first_round;        
reg            ex2_srt_secd_round;         
reg     [4:0]  srt_cnt;                    
reg            srt_cur_state;              
reg            srt_nxt_state;              
reg            vfdsu_ex3_vld;              
reg            vfdsu_ex4_vld;              

// &Wires; @26
wire           cp0_vfpu_icg_en;            
wire           cp0_yy_clk_en;              
wire           cpurst_b;                   
wire           div_sm_clk;                 
wire           div_sm_clk_en;              
wire           div_st_ex2;                 
wire           dp_vfdsu_ex1_pipex_sel;     
wire           dp_vfdsu_fdiv_gateclk_issue; 
wire           dp_vfdsu_idu_fdiv_issue;    
wire           ex1_data_clk;               
wire           ex1_data_clk_en;            
wire           ex1_double;                 
wire           ex1_pipedown;               
wire           ex1_single;                 
wire           ex2_data_clk;               
wire           ex2_data_clk_en;            
wire           ex2_pipe_clk;               
wire           ex2_pipe_clk_en;            
wire           ex2_pipedown;               
wire           ex2_srt_secd_round_pre;     
wire           ex3_data_clk;               
wire           ex3_data_clk_en;            
wire           ex3_pipe_clk;               
wire           ex3_pipe_clk_en;            
wire           ex3_pipedown;               
wire           ex4_pipedown;               
wire           forever_cpuclk;             
wire           pad_yy_icg_scan_en;         
wire           pipex_dp_vfdsu_inst_vld;    
wire           rtu_yy_xx_flush;            
wire           skip_srt;                   
wire    [4:0]  srt_cnt_ini;                
wire           srt_cnt_zero;               
wire           srt_ctrl_rem_zero;          
wire           srt_ctrl_skip_srt;          
wire           srt_last_round;             
wire           srt_secd_round;             
wire           srt_secd_round_pre;         
wire           srt_sm_clk;                 
wire           srt_sm_clk_en;              
wire           srt_sm_on;                  
wire           vfdsu_dp_fdiv_busy;         
wire           vfdsu_dp_inst_wb_req;       
wire           vfdsu_ex2_double;           
wire           vfdsu_ex2_single;           
wire           vfdsu_ex2_vld;              
wire           vfdsu_ifu_debug_ex2_wait;   
wire           vfdsu_ifu_debug_idle;       
wire           vfdsu_ifu_debug_pipe_busy;  


//==========================================================
//              EX1 Stage Control Signal
//==========================================================

//vfdsu ex1 pipedown signal
assign ex1_pipedown       = dp_vfdsu_ex1_pipex_sel;
// &Force("output","ex1_pipedown"); @34
//==========================================================
//              EX2 Stage Control Signal
//==========================================================
//state parameter
parameter SRT_IDLE = 1'b0;
parameter SRT_BUSY = 1'b1;

//gate clk
// &Instance("gated_clk_cell","x_srt_sm_clk"); @43
gated_clk_cell  x_srt_sm_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (srt_sm_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (srt_sm_clk_en     ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @44
//           .clk_out        (srt_sm_clk),//Out Clock @45
//           .external_en    (1'b0), @46
//           .global_en      (cp0_yy_clk_en), @47
//           .local_en       (srt_sm_clk_en),//Local Condition @48
//           .module_en      (cp0_vfpu_icg_en) @49
//         ); @50
assign srt_sm_clk_en = srt_cur_state || 
                       ex1_pipedown  || 
                       rtu_yy_xx_flush;

//state machine
always @(posedge srt_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    srt_cur_state <= SRT_IDLE;
  else if(rtu_yy_xx_flush)
    srt_cur_state <= SRT_IDLE;
  else
    srt_cur_state <= srt_nxt_state;
end

// &CombBeg; @66
always @( ex1_pipedown
       or srt_last_round
       or srt_cur_state)
begin
case(srt_cur_state)
SRT_IDLE : if(ex1_pipedown)
             srt_nxt_state = SRT_BUSY;
           else
             srt_nxt_state = SRT_IDLE;
SRT_BUSY : if(srt_last_round)
             srt_nxt_state = SRT_IDLE;
           else
             srt_nxt_state = SRT_BUSY;
default  :   srt_nxt_state = SRT_IDLE;
endcase
// &CombEnd; @78
end

//srt sm state
//assign srt_sm_idle = ~srt_cur_state;
assign srt_sm_on   =  srt_cur_state;
// &Force("output","srt_sm_on"); @83
//state machine control signal
//srt_last_round on three condition : 
//  1.srt need not execute
//  2.srt rem is zero 
//  3.srt cnt zero
assign srt_last_round = (skip_srt || 
                         srt_ctrl_rem_zero || 
                         srt_cnt_zero)      && 
                         srt_sm_on;
assign skip_srt       =  srt_ctrl_skip_srt;
assign srt_cnt_zero   = ~|srt_cnt[4:0];
//srt counter
always @(posedge srt_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    srt_cnt[4:0] <= 5'b0;
  else if(rtu_yy_xx_flush)
    srt_cnt[4:0] <= 5'b0;
  else if(ex1_pipedown)
    srt_cnt[4:0] <= srt_cnt_ini[4:0];
  else if(srt_sm_on)
    srt_cnt[4:0] <= srt_cnt[4:0] - 5'b1;
  else
    srt_cnt[4:0] <= srt_cnt[4:0];
end

//srt_cnt_ini[4:0]
//For Double, initial is 5'b11100('d28), calculate 29 round
//For Single, initial is 5'b01110('d14), calculate 15 round
assign srt_cnt_ini[4:0] = (ex1_double) ? 5'b01101 :
                           ex1_single  ? 5'b00110
                                       : 5'b00011;

//vfdsu ex2 pipedown signal
assign ex2_pipedown = srt_last_round && div_st_ex2;
// &Force("output","ex2_pipedown"); @157
// &Force("output","ex2_srt_first_round"); @172
always @(posedge srt_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ex2_srt_first_round <= 1'b0;
  else if(rtu_yy_xx_flush)
    ex2_srt_first_round <= 1'b0;
  else if(ex1_pipedown)
    ex2_srt_first_round <= 1'h1;
  else
    ex2_srt_first_round <= 1'b0;
end
// &Force("output","ex2_srt_first_round"); @195
always @(posedge srt_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ex2_srt_secd_round <= 1'b0;
  else if(rtu_yy_xx_flush)
    ex2_srt_secd_round <= 1'b0;
  else
    ex2_srt_secd_round <= {1{ex2_srt_secd_round_pre}};
end
assign srt_secd_round  = ex2_srt_secd_round;


assign ex2_srt_secd_round_pre  = srt_sm_on && srt_secd_round_pre;
assign srt_secd_round_pre      = vfdsu_ex2_double ? srt_cnt[4:0]==5'b01101 : 
                                 vfdsu_ex2_single ? srt_cnt[4:0]==5'b00110 : srt_cnt[4:0] == 5'b00011;

//==========================================================
//              EX3 Stage Control Signal
//==========================================================
//gate clk
// &Instance("gated_clk_cell","x_ex2_pipe_clk"); @217
gated_clk_cell  x_ex2_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @218
//           .clk_out        (ex2_pipe_clk),//Out Clock @219
//           .external_en    (1'b0), @220
//           .global_en      (cp0_yy_clk_en), @221
//           .local_en       (ex2_pipe_clk_en),//Local Condition @222
//           .module_en      (cp0_vfpu_icg_en) @223
//         ); @224
assign ex2_pipe_clk_en = vfdsu_ex2_vld || 
                         vfdsu_ex3_vld || 
                         rtu_yy_xx_flush;
assign vfdsu_ex2_vld = ex2_pipedown;
//EX2 to EX3 pipedown
always @(posedge ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vfdsu_ex3_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    vfdsu_ex3_vld <= 1'b0;
  else if(ex2_pipedown)
    vfdsu_ex3_vld <= 1'b1;
  else
    vfdsu_ex3_vld <= 1'b0;
end
assign ex3_pipedown  = vfdsu_ex3_vld;
// &Force("output","ex3_pipedown"); @242

//==========================================================
//              EX4 Stage Control Signal
//==========================================================
//gate clk
// &Instance("gated_clk_cell","x_ex3_pipe_clk"); @248
gated_clk_cell  x_ex3_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex3_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex3_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @249
//           .clk_out        (ex3_pipe_clk),//Out Clock @250
//           .external_en    (1'b0), @251
//           .global_en      (cp0_yy_clk_en), @252
//           .local_en       (ex3_pipe_clk_en),//Local Condition @253
//           .module_en      (cp0_vfpu_icg_en) @254
//         ); @255
assign ex3_pipe_clk_en = ex3_pipedown || 
                         vfdsu_ex4_vld || 
                         rtu_yy_xx_flush;

//EX3 to EX4 pipedown
always @(posedge ex3_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vfdsu_ex4_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    vfdsu_ex4_vld <= 1'b0;
  else if(ex3_pipedown)
    vfdsu_ex4_vld <= 1'b1;
  else
    vfdsu_ex4_vld <= 1'b0;
end
assign ex4_pipedown = vfdsu_ex4_vld;


//Div Write Back State Machine
parameter IDLE      = 4'b0000;
parameter RF        = 4'b0100;
parameter EX1       = 4'b0101;
parameter EX2       = 4'b0110;
parameter WB_REQ    = 4'b0111;
parameter WB        = 4'b1000;

//GateClk
// &Instance("gated_clk_cell","x_div_sm_clk"); @284
gated_clk_cell  x_div_sm_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (div_sm_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (div_sm_clk_en     ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @285
//           .clk_out        (div_sm_clk),//Out Clock @286
//           .external_en    (1'b0), @287
//           .global_en      (cp0_yy_clk_en), @288
//           .local_en       (div_sm_clk_en),//Local Condition @289
//           .module_en      (cp0_vfpu_icg_en) @290
//         ); @291
assign div_sm_clk_en = dp_vfdsu_fdiv_gateclk_issue || 
                       !(div_cur_state[3:0] == IDLE);
//State Trans
always @(posedge div_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    div_cur_state[3:0] <= IDLE;
  else if(rtu_yy_xx_flush)
    div_cur_state[3:0] <= IDLE;
  else
    div_cur_state[3:0] <= div_next_state[3:0];
end
// &CombBeg; @304
always @( dp_vfdsu_idu_fdiv_issue
       or dp_vfdsu_ex1_pipex_sel
       or ex4_pipedown
       or srt_last_round
       or div_cur_state[3:0])
begin
  case(div_cur_state[3:0])
  IDLE       : if(dp_vfdsu_idu_fdiv_issue)
                 div_next_state[3:0] = RF;
               else
                 div_next_state[3:0] = IDLE;
  RF         : div_next_state[3:0] = EX1;
  EX1        : if(dp_vfdsu_ex1_pipex_sel) 
                  div_next_state[3:0] = EX2;
               else
                 div_next_state[3:0] = IDLE;
  EX2        : if(srt_last_round)
                 div_next_state[3:0] = WB_REQ;
               else 
                 div_next_state[3:0] = EX2;
  WB_REQ   :   if(ex4_pipedown)
                 div_next_state[3:0] = WB;
               else
                 div_next_state[3:0] = WB_REQ;
  WB         : if(dp_vfdsu_idu_fdiv_issue)
                 div_next_state[3:0] = RF;
               else
                 div_next_state[3:0] = IDLE;
  default    :   div_next_state[3:0] = IDLE;
  endcase
// &CombEnd; @329
end
//Control Signal
assign div_st_ex2             = (div_cur_state[3:0] == EX2);

//Div Rdy Signal
//assign vfdsu_vfpu_gateclk_en   = div_cur_state[2] || div_cur_state[3] || 
//                                 ex4_pipedown;


//Active Data with VFPU
//GateClk
// &Instance("gated_clk_cell","x_ex1_data_clk"); @340
gated_clk_cell  x_ex1_data_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_data_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_data_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @341
//           .clk_out        (ex1_data_clk),//Out Clock @342
//           .external_en    (1'b0), @343
//           .global_en      (cp0_yy_clk_en), @344
//           .local_en       (ex1_data_clk_en),//Local Condition @345
//           .module_en      (cp0_vfpu_icg_en) @346
//         ); @347
assign ex1_data_clk_en = ex1_pipedown; 

// &Instance("gated_clk_cell","x_ex2_data_clk"); @350
gated_clk_cell  x_ex2_data_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_data_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_data_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @351
//           .clk_out        (ex2_data_clk),//Out Clock @352
//           .external_en    (1'b0), @353
//           .global_en      (cp0_yy_clk_en), @354
//           .local_en       (ex2_data_clk_en),//Local Condition @355
//           .module_en      (cp0_vfpu_icg_en) @356
//         ); @357
assign ex2_data_clk_en = ex2_pipedown;

// &Instance("gated_clk_cell","x_ex3_data_clk"); @360
gated_clk_cell  x_ex3_data_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex3_data_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex3_data_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @361
//           .clk_out        (ex3_data_clk),//Out Clock @362
//           .external_en    (1'b0), @363
//           .global_en      (cp0_yy_clk_en), @364
//           .local_en       (ex3_data_clk_en),//Local Condition @365
//           .module_en      (cp0_vfpu_icg_en) @366
//         ); @367
assign ex3_data_clk_en = ex3_pipedown;

assign pipex_dp_vfdsu_inst_vld           = div_cur_state[3:0] == WB;
// this is used to apply write back port
assign vfdsu_dp_inst_wb_req   = vfdsu_ex3_vld; 
assign vfdsu_dp_fdiv_busy     = div_cur_state[2];

//Debug infor
assign vfdsu_ifu_debug_ex2_wait  = 1'b0;
assign vfdsu_ifu_debug_idle      = (div_cur_state[3:0] == IDLE);
assign vfdsu_ifu_debug_pipe_busy = 1'b0;


// &ModuleEnd; @381
endmodule


