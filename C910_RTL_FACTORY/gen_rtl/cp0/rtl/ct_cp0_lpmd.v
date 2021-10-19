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

// &ModuleBeg; @24
module ct_cp0_lpmd(
  biu_yy_xx_no_op,
  cp0_biu_lpmd_b,
  cp0_had_lpmd_b,
  cp0_ifu_no_op_req,
  cp0_lsu_no_op_req,
  cp0_mmu_no_op_req,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  had_cp0_xx_dbg,
  ifu_yy_xx_no_op,
  inst_lpmd_ex1_ex2,
  lpmd_cmplt,
  lpmd_top_cur_state,
  lsu_yy_xx_no_op,
  mmu_yy_xx_no_op,
  pad_yy_icg_scan_en,
  regs_lpmd_int_vld,
  regs_xx_icg_en,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush
);

// &Ports; @25
input          biu_yy_xx_no_op;   
input          cpurst_b;          
input          forever_cpuclk;    
input          had_cp0_xx_dbg;    
input          ifu_yy_xx_no_op;   
input          inst_lpmd_ex1_ex2; 
input          lsu_yy_xx_no_op;   
input          mmu_yy_xx_no_op;   
input          pad_yy_icg_scan_en; 
input          regs_lpmd_int_vld; 
input          regs_xx_icg_en;    
input          rtu_yy_xx_dbgon;   
input          rtu_yy_xx_flush;   
output  [1:0]  cp0_biu_lpmd_b;    
output  [1:0]  cp0_had_lpmd_b;    
output         cp0_ifu_no_op_req; 
output         cp0_lsu_no_op_req; 
output         cp0_mmu_no_op_req; 
output         cp0_yy_clk_en;     
output         lpmd_cmplt;        
output  [1:0]  lpmd_top_cur_state; 

// &Regs; @26
reg     [1:0]  cur_state;         
reg     [1:0]  lpmd_b;            
reg     [1:0]  next_state;        

// &Wires; @27
wire           biu_yy_xx_no_op;   
wire    [1:0]  cp0_biu_lpmd_b;    
wire    [1:0]  cp0_had_lpmd_b;    
wire           cp0_ifu_no_op_req; 
wire           cp0_lsu_no_op_req; 
wire           cp0_mmu_no_op_req; 
wire           cp0_yy_clk_en;     
wire           cpu_in_lpmd;       
wire           cpuclk;            
wire           cpurst_b;          
wire           forever_cpuclk;    
wire           had_cp0_xx_dbg;    
wire           ifu_yy_xx_no_op;   
wire           inst_lpmd_ex1_ex2; 
wire           lpmd_ack;          
wire           lpmd_clk_en;       
wire           lpmd_cmplt;        
wire           lpmd_in_wait_state; 
wire    [1:0]  lpmd_top_cur_state; 
wire           lsu_yy_xx_no_op;   
wire           mmu_yy_xx_no_op;   
wire           pad_yy_icg_scan_en; 
wire           regs_lpmd_int_vld; 
wire           regs_xx_icg_en;    
wire           rtu_yy_xx_dbgon;   
wire           rtu_yy_xx_flush;   


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
// &Instance("gated_clk_cell", "x_lpmd_gated_clk"); @32
gated_clk_cell  x_lpmd_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cpuclk            ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lpmd_clk_en       ),
  .module_en          (regs_xx_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @33
//          .external_en (1'b0), @34
//          .global_en   (cp0_yy_clk_en), @35
//          .module_en   (regs_xx_icg_en), @36
//          .local_en    (lpmd_clk_en), @37
//          .clk_out     (cpuclk)); @38
//----------------------------------------------------------
//   Handling the low power operating modes
//----------------------------------------------------------
// Request the BIU to enter low power mode and do
// not accept any more transaction from IFU or LSU
                     
//-------------------FSM of lpmd req logic------------------
// State Description:
// IDLE : no lpmd instruction (wfi)
// WAIT : request biu and wait for biu ack
//        the lpmd request        
// LPMD : wait for wake up and then cmplt lpmd inst
//----------------------------------------------------------

parameter IDLE = 2'b00;
parameter WAIT = 2'b01;
parameter LPMD = 2'b10;

assign lpmd_clk_en = inst_lpmd_ex1_ex2 || cur_state[1:0] != IDLE;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state[1:0] <= IDLE;
  else if(rtu_yy_xx_flush)
    cur_state[1:0] <= IDLE;
  else
    cur_state[1:0] <= next_state[1:0];
end

// &CombBeg; @68
always @( cur_state[1:0]
       or lpmd_ack
       or inst_lpmd_ex1_ex2
       or cpu_in_lpmd)
begin
  case(cur_state[1:0])
  IDLE       : if(inst_lpmd_ex1_ex2)
                next_state[1:0] = WAIT;
              else
                next_state[1:0] = IDLE;
  WAIT      : if(lpmd_ack)
                next_state[1:0] = LPMD;
              else
                next_state[1:0] = WAIT;
  LPMD      : if(!cpu_in_lpmd)
                next_state[1:0] = IDLE;
              else
                next_state[1:0] = LPMD;
  default   :   next_state[1:0] = IDLE;
  endcase
// &CombEnd; @84
end

assign lpmd_in_wait_state = cur_state[0];

assign lpmd_top_cur_state[1:0] = cur_state[1:0];

//----------------conctol signal by lpmd FSM----------------
//req if entering into WAIT state
assign cp0_ifu_no_op_req = lpmd_in_wait_state;
assign cp0_lsu_no_op_req = lpmd_in_wait_state;
assign cp0_mmu_no_op_req = lpmd_in_wait_state;

//----------------------------------------------------------
//               lpmd request ack 
//----------------------------------------------------------
assign lpmd_ack = lpmd_in_wait_state
                  && ifu_yy_xx_no_op
                  && lsu_yy_xx_no_op
                  && biu_yy_xx_no_op
                  && mmu_yy_xx_no_op;

assign lpmd_cmplt = (cur_state[1:0] == LPMD) && !cpu_in_lpmd;

//----------------------------------------------------------
// Send lpmd bits to BIU and HAD, when
// cp0 can enter low power mode (get biu_cp0_no_op)
//----------------------------------------------------------
// &Force("output","cp0_biu_lpmd_b"); @111

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lpmd_b[1:0] <= 2'b11;
  else if((had_cp0_xx_dbg || regs_lpmd_int_vld)
          && cpu_in_lpmd || rtu_yy_xx_dbgon)
    lpmd_b[1:0] <= 2'b11;
  else if(lpmd_ack && !cpu_in_lpmd)
  begin
    if(inst_lpmd_ex1_ex2)
      lpmd_b[1:0] <= 2'b00;
    else
      lpmd_b[1:0] <= 2'b11;
  end
  else
    lpmd_b[1:0] <= lpmd_b[1:0];
end

assign cp0_had_lpmd_b[1:0] = lpmd_b[1:0];
assign cp0_biu_lpmd_b[1:0] = lpmd_b[1:0];

//cpu ack in debug mode
assign cpu_in_lpmd     = !(lpmd_b[1] & lpmd_b[0]);

//======================================================
//Generate clock enable signal to clock module
//Disable the clock when low power mode is entered
//======================================================
// &Force("output","cp0_yy_clk_en"); @141
assign cp0_yy_clk_en = lpmd_b[1] & lpmd_b[0];

// &ModuleEnd; @144
endmodule


