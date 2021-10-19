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
module ct_had_ctrl(
  biu_had_sdb_req_b,
  bkpta_ctrl_data_req,
  bkpta_ctrl_data_req_raw,
  bkpta_ctrl_inst_req,
  bkpta_ctrl_inst_req_raw,
  bkpta_ctrl_xx_ack,
  bkptb_ctrl_data_req,
  bkptb_ctrl_data_req_raw,
  bkptb_ctrl_inst_req,
  bkptb_ctrl_inst_req_raw,
  bkptb_ctrl_xx_ack,
  cpuclk,
  cpurst_b,
  ctrl_bkpta_en,
  ctrl_bkpta_en_raw,
  ctrl_bkptb_en,
  ctrl_bkptb_en_raw,
  ctrl_dbgfifo_ren,
  ctrl_event_dbgenter,
  ctrl_event_dbgexit,
  ctrl_pcfifo_ren,
  ctrl_pcfifo_wen,
  ctrl_pipefifo_ren,
  ctrl_pipefifo_wen,
  ctrl_regs_bkpta_vld,
  ctrl_regs_bkptb_vld,
  ctrl_regs_exit_dbg,
  ctrl_regs_freeze_pcfifo,
  ctrl_regs_set_sqa,
  ctrl_regs_set_sqb,
  ctrl_regs_update_adro,
  ctrl_regs_update_dro,
  ctrl_regs_update_mbo,
  ctrl_regs_update_pro,
  ctrl_regs_update_swo,
  ctrl_regs_update_to,
  ctrl_trace_en,
  ctrl_xx_dbg_disable,
  ddc_xx_update_ir,
  event_ctrl_enter_dbg,
  event_ctrl_exit_dbg,
  event_ctrl_had_clk_en,
  forever_coreclk,
  had_cp0_xx_dbg,
  had_ifu_ir_vld,
  had_ifu_pcload,
  had_rtu_data_bkpt_dbgreq,
  had_rtu_dbg_disable,
  had_rtu_dbg_req_en,
  had_rtu_event_dbgreq,
  had_rtu_fdb,
  had_rtu_hw_dbgreq,
  had_rtu_hw_dbgreq_gateclk,
  had_rtu_inst_bkpt_dbgreq,
  had_rtu_non_irv_bkpt_dbgreq,
  had_rtu_pop1_disa,
  had_rtu_trace_dbgreq,
  had_rtu_trace_en,
  had_rtu_xx_jdbreq,
  had_rtu_xx_tme,
  had_xx_clk_en,
  had_yy_xx_exit_dbg,
  inst_bkpt_dbgreq,
  ir_ctrl_exit_dbg_reg,
  ir_ctrl_had_clk_en,
  ir_xx_ir_reg_sel,
  nirv_bkpta,
  non_irv_bkpt_vld,
  regs_ctrl_adr,
  regs_ctrl_dr,
  regs_ctrl_fdb,
  regs_ctrl_frzc,
  regs_ctrl_pcfifo_frozen,
  regs_ctrl_pm,
  regs_ctrl_sqa,
  regs_ctrl_sqb,
  regs_ctrl_sqc,
  regs_ctrl_tme,
  regs_xx_bca,
  regs_xx_bcb,
  regs_xx_ddc_en,
  regs_xx_nirven,
  rtu_had_dbgreq_ack,
  rtu_had_inst0_bkpt_inst,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_retire0,
  rtu_yy_xx_retire0_normal,
  trace_ctrl_req,
  x_had_dbg_mask,
  x_ir_ctrl_dbgfifo_read_pulse,
  x_ir_ctrl_pcfifo_read_pulse,
  x_ir_ctrl_pipefifo_read_pulse,
  x_ir_xx_ex,
  x_ir_xx_go,
  x_sm_xx_update_dr_en
);

// &Ports; @26
input          biu_had_sdb_req_b;            
input          bkpta_ctrl_data_req;          
input          bkpta_ctrl_data_req_raw;      
input          bkpta_ctrl_inst_req;          
input          bkpta_ctrl_inst_req_raw;      
input          bkpta_ctrl_xx_ack;            
input          bkptb_ctrl_data_req;          
input          bkptb_ctrl_data_req_raw;      
input          bkptb_ctrl_inst_req;          
input          bkptb_ctrl_inst_req_raw;      
input          bkptb_ctrl_xx_ack;            
input          cpuclk;                       
input          cpurst_b;                     
input          ddc_xx_update_ir;             
input          event_ctrl_enter_dbg;         
input          event_ctrl_exit_dbg;          
input          event_ctrl_had_clk_en;        
input          forever_coreclk;              
input          ir_ctrl_exit_dbg_reg;         
input          ir_ctrl_had_clk_en;           
input          ir_xx_ir_reg_sel;             
input          nirv_bkpta;                   
input          non_irv_bkpt_vld;             
input          regs_ctrl_adr;                
input          regs_ctrl_dr;                 
input          regs_ctrl_fdb;                
input          regs_ctrl_frzc;               
input          regs_ctrl_pcfifo_frozen;      
input   [1:0]  regs_ctrl_pm;                 
input          regs_ctrl_sqa;                
input          regs_ctrl_sqb;                
input   [1:0]  regs_ctrl_sqc;                
input          regs_ctrl_tme;                
input   [4:0]  regs_xx_bca;                  
input   [4:0]  regs_xx_bcb;                  
input          regs_xx_ddc_en;               
input          regs_xx_nirven;               
input          rtu_had_dbgreq_ack;           
input          rtu_had_inst0_bkpt_inst;      
input          rtu_yy_xx_dbgon;              
input          rtu_yy_xx_retire0;            
input          rtu_yy_xx_retire0_normal;     
input          trace_ctrl_req;               
input          x_had_dbg_mask;               
input          x_ir_ctrl_dbgfifo_read_pulse; 
input          x_ir_ctrl_pcfifo_read_pulse;  
input          x_ir_ctrl_pipefifo_read_pulse; 
input          x_ir_xx_ex;                   
input          x_ir_xx_go;                   
input          x_sm_xx_update_dr_en;         
output         ctrl_bkpta_en;                
output         ctrl_bkpta_en_raw;            
output         ctrl_bkptb_en;                
output         ctrl_bkptb_en_raw;            
output         ctrl_dbgfifo_ren;             
output         ctrl_event_dbgenter;          
output         ctrl_event_dbgexit;           
output         ctrl_pcfifo_ren;              
output         ctrl_pcfifo_wen;              
output         ctrl_pipefifo_ren;            
output         ctrl_pipefifo_wen;            
output         ctrl_regs_bkpta_vld;          
output         ctrl_regs_bkptb_vld;          
output         ctrl_regs_exit_dbg;           
output         ctrl_regs_freeze_pcfifo;      
output         ctrl_regs_set_sqa;            
output         ctrl_regs_set_sqb;            
output         ctrl_regs_update_adro;        
output         ctrl_regs_update_dro;         
output         ctrl_regs_update_mbo;         
output         ctrl_regs_update_pro;         
output         ctrl_regs_update_swo;         
output         ctrl_regs_update_to;          
output         ctrl_trace_en;                
output         ctrl_xx_dbg_disable;          
output         had_cp0_xx_dbg;               
output         had_ifu_ir_vld;               
output         had_ifu_pcload;               
output         had_rtu_data_bkpt_dbgreq;     
output         had_rtu_dbg_disable;          
output         had_rtu_dbg_req_en;           
output         had_rtu_event_dbgreq;         
output         had_rtu_fdb;                  
output         had_rtu_hw_dbgreq;            
output         had_rtu_hw_dbgreq_gateclk;    
output         had_rtu_inst_bkpt_dbgreq;     
output         had_rtu_non_irv_bkpt_dbgreq;  
output         had_rtu_pop1_disa;            
output         had_rtu_trace_dbgreq;         
output         had_rtu_trace_en;             
output         had_rtu_xx_jdbreq;            
output         had_rtu_xx_tme;               
output         had_xx_clk_en;                
output         had_yy_xx_exit_dbg;           
output         inst_bkpt_dbgreq;             

// &Regs; @27
reg            ctrl_bkptb_en;                
reg            ctrl_exit_dbg;                
reg            ctrl_go_noex;                 
reg            ctrl_out_dbg_disable;         
reg            ctrl_trace_en;                
reg            dr_set_req;                   
reg            event_req;                    
reg            had_clk_en_ff;                

// &Wires; @28
wire           adr_set_req;                  
wire           async_dbg_req;                
wire           biu_had_sdb_req_b;            
wire           bkpta_ctrl_data_req;          
wire           bkpta_ctrl_data_req_raw;      
wire           bkpta_ctrl_inst_req;          
wire           bkpta_ctrl_inst_req_raw;      
wire           bkpta_ctrl_xx_ack;            
wire           bkptb_ctrl_data_req;          
wire           bkptb_ctrl_data_req_raw;      
wire           bkptb_ctrl_inst_req;          
wire           bkptb_ctrl_inst_req_raw;      
wire           bkptb_ctrl_xx_ack;            
wire           bkptb_en;                     
wire           bkptb_sqc_en;                 
wire           cpuclk;                       
wire           cpurst_b;                     
wire           ctrl_bkpta_en;                
wire           ctrl_bkpta_en_raw;            
wire           ctrl_bkptb_en_raw;            
wire           ctrl_dbgfifo_ren;             
wire           ctrl_event_dbgenter;          
wire           ctrl_event_dbgexit;           
wire           ctrl_pcfifo_ren;              
wire           ctrl_pcfifo_wen;              
wire           ctrl_pipefifo_ren;            
wire           ctrl_pipefifo_wen;            
wire           ctrl_regs_bkpta_vld;          
wire           ctrl_regs_bkptb_vld;          
wire           ctrl_regs_exit_dbg;           
wire           ctrl_regs_freeze_pcfifo;      
wire           ctrl_regs_set_sqa;            
wire           ctrl_regs_set_sqb;            
wire           ctrl_regs_update_adro;        
wire           ctrl_regs_update_dro;         
wire           ctrl_regs_update_mbo;         
wire           ctrl_regs_update_pro;         
wire           ctrl_regs_update_swo;         
wire           ctrl_regs_update_to;          
wire           ctrl_tee_dbg_disable;         
wire           ctrl_xx_dbg_disable;          
wire           data_bkpt_dbgreq;             
wire           ddc_inst_go;                  
wire           ddc_xx_update_ir;             
wire           event_ctrl_enter_dbg;         
wire           event_ctrl_exit_dbg;          
wire           event_ctrl_had_clk_en;        
wire           exit_dbg;                     
wire           exit_dbg_active;              
wire           forever_coreclk;              
wire           go_in_dbg;                    
wire           go_noex;                      
wire           had_clk_en;                   
wire           had_cp0_xx_dbg;               
wire           had_ifu_ir_vld;               
wire           had_ifu_pcload;               
wire           had_rtu_data_bkpt_dbgreq;     
wire           had_rtu_dbg_disable;          
wire           had_rtu_dbg_req_en;           
wire           had_rtu_event_dbgreq;         
wire           had_rtu_fdb;                  
wire           had_rtu_hw_dbgreq;            
wire           had_rtu_hw_dbgreq_gateclk;    
wire           had_rtu_inst_bkpt_dbgreq;     
wire           had_rtu_non_irv_bkpt_dbgreq;  
wire           had_rtu_pop1_disa;            
wire           had_rtu_trace_dbgreq;         
wire           had_rtu_trace_en;             
wire           had_rtu_xx_jdbreq;            
wire           had_rtu_xx_tme;               
wire           had_xx_clk_en;                
wire           had_yy_xx_exit_dbg;           
wire           inst_bkpt_dbgreq;             
wire           ir_ctrl_exit_dbg_reg;         
wire           ir_ctrl_had_clk_en;           
wire           ir_xx_ir_reg_sel;             
wire           mem_bkpta_data_req;           
wire           mem_bkpta_data_req_raw;       
wire           mem_bkpta_inst_req;           
wire           mem_bkpta_inst_req_raw;       
wire           mem_bkptb_data_req;           
wire           mem_bkptb_data_req_raw;       
wire           mem_bkptb_inst_req;           
wire           mem_bkptb_inst_req_raw;       
wire           nirv_bkpta;                   
wire           non_irv_bkpt_vld;             
wire           regs_ctrl_adr;                
wire           regs_ctrl_dr;                 
wire           regs_ctrl_fdb;                
wire           regs_ctrl_frzc;               
wire           regs_ctrl_pcfifo_frozen;      
wire    [1:0]  regs_ctrl_pm;                 
wire           regs_ctrl_sqa;                
wire           regs_ctrl_sqb;                
wire    [1:0]  regs_ctrl_sqc;                
wire           regs_ctrl_tme;                
wire    [4:0]  regs_xx_bca;                  
wire    [4:0]  regs_xx_bcb;                  
wire           regs_xx_ddc_en;               
wire           regs_xx_nirven;               
wire           rtu_had_dbgreq_ack;           
wire           rtu_had_inst0_bkpt_inst;      
wire           rtu_yy_xx_dbgon;              
wire           rtu_yy_xx_retire0;            
wire           rtu_yy_xx_retire0_normal;     
wire           sdb_req;                      
wire           trace_ctrl_req;               
wire           trace_req;                    
wire           trace_sqc_en;                 
wire           x_had_dbg_mask;               
wire           x_ir_ctrl_dbgfifo_read_pulse; 
wire           x_ir_ctrl_pcfifo_read_pulse;  
wire           x_ir_ctrl_pipefifo_read_pulse; 
wire           x_ir_xx_ex;                   
wire           x_ir_xx_go;                   
wire           x_sm_xx_update_dr_en;         


// had control logic can be divided into four parts:
//   1. ctrl signal to had function modules
//   2. debug request to RTU
//   3. inform HSR to update corresponding status bits
//   4. exit debug mode logic

//==============================================================================
//                  1. ctrl signal to had function modules
//==============================================================================

//==========================================================
//                 memory bkpta enable
//==========================================================

// &Force("output", "ctrl_bkpta_en"); @44
assign ctrl_bkpta_en = |regs_xx_bca[4:0];
assign ctrl_bkpta_en_raw = |regs_xx_bca[4:0];

//==========================================================
//                 memory bkptb enable
//==========================================================

// memory bkptb enable contains two conditions:
//   1. bcb not zero
//   2. meet SQC conditons
//      i) sqc[1:0] = 2'b00: no affect
//     ii) sqc[1] = 1'b1: bkptb won't be enabled until bkpta occurs

assign bkptb_en = |regs_xx_bcb[4:0];

assign bkptb_sqc_en = !regs_ctrl_sqc[1] ||
                       regs_ctrl_sqc[1] && rtu_yy_xx_retire0_normal &&
                      !inst_bkpt_dbgreq && (bkpta_ctrl_inst_req || bkpta_ctrl_data_req) ||
                       regs_ctrl_sqa;

// &Force("output", "ctrl_bkptb_en"); @65
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ctrl_bkptb_en <= 1'b0;
  else if (bkptb_en && bkptb_sqc_en)
    ctrl_bkptb_en <= 1'b1;
  else
    ctrl_bkptb_en <= 1'b0;
end

assign ctrl_bkptb_en_raw = bkptb_en && bkptb_sqc_en;

//==========================================================
//                    trace enable
//==========================================================

// trace enable contains two conditions:
//   1. tme set
//   2. meet SQC conditions
//      i) sqc[1:0] = 2'b00: no affect
//     ii) sqc[0] = 1'b1: trace won't be enabled until bkptb occurs

assign trace_sqc_en = !regs_ctrl_sqc[0] ||
                       regs_ctrl_sqc[0] && rtu_yy_xx_retire0_normal &&
                      !inst_bkpt_dbgreq && (bkptb_ctrl_inst_req || bkptb_ctrl_data_req) ||
                       regs_ctrl_sqb;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ctrl_trace_en <= 1'b0;
  else if (regs_ctrl_tme && trace_sqc_en)
    ctrl_trace_en <= 1'b1;
  else
    ctrl_trace_en <= 1'b0;
end

// &Force("output","ctrl_trace_en"); @103
assign had_rtu_trace_en = ctrl_trace_en;

//==========================================================
//                    pcfifo enable
//==========================================================

// pcfifo write enable contains three conditions:
//   1. pcfifo not frozen
//   2. change flow inst retire normally
//   3. not in debug mode
//   4. meet the condition about 

assign ctrl_pcfifo_wen = !regs_ctrl_pcfifo_frozen &&
                         !inst_bkpt_dbgreq &&
                         !rtu_yy_xx_dbgon;
//                       && cp0_had_pcfifo_wen;

// pcfifo read enable contains two conditions:
//   1. pcfifo not frozen
//   2. pcfifo read pulse

assign ctrl_pcfifo_ren = !regs_ctrl_pcfifo_frozen && x_ir_ctrl_pcfifo_read_pulse;

//==========================================================
//           pipefifo enable
//==========================================================
assign ctrl_pipefifo_wen = !rtu_yy_xx_dbgon;
assign ctrl_pipefifo_ren = x_ir_ctrl_pipefifo_read_pulse;
assign ctrl_dbgfifo_ren  = x_ir_ctrl_dbgfifo_read_pulse;

//==============================================================================
//                        2. debug request to RTU
//==============================================================================                        
//==========================================================
// Three major kinds of debug requests are sent to RTU from HAD
// 1. had_rtu_xx_jdbreq: asynchronous debug request
// 2. had_rtu_hw_dbgreq: synchronous debug request, include DR set, sdb_req_b
// 3. had_rtu_mt_dbgreq: synchronous debug request, include memory bkpt and trace
//==========================================================

assign trace_req = trace_ctrl_req;

assign mem_bkpta_inst_req = bkpta_ctrl_inst_req && !regs_ctrl_sqc[1];
assign mem_bkpta_data_req = bkpta_ctrl_data_req && !regs_ctrl_sqc[1];

assign mem_bkptb_inst_req = bkptb_ctrl_inst_req && !regs_ctrl_sqc[0] && !regs_ctrl_frzc;
assign mem_bkptb_data_req = bkptb_ctrl_data_req && !regs_ctrl_sqc[0] && !regs_ctrl_frzc;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dr_set_req <= 1'b0;
  else 
    dr_set_req <= regs_ctrl_dr;
end

assign adr_set_req = regs_ctrl_adr;
    
assign sdb_req = !biu_had_sdb_req_b;

// &Force("output", "had_rtu_hw_dbgreq"); @164
assign had_rtu_hw_dbgreq         = (dr_set_req || sdb_req) && !rtu_yy_xx_dbgon;
assign had_rtu_hw_dbgreq_gateclk = dr_set_req || sdb_req;

// &Force("output", "had_rtu_trace_dbgreq"); @168
// &Force("output", "inst_bkpt_dbgreq"); @169
assign inst_bkpt_dbgreq = (mem_bkpta_inst_req || mem_bkptb_inst_req) && regs_ctrl_fdb &&!rtu_yy_xx_dbgon;
assign data_bkpt_dbgreq = (mem_bkpta_data_req || mem_bkptb_data_req) && regs_ctrl_fdb &&!rtu_yy_xx_dbgon;

assign had_rtu_trace_dbgreq =  trace_req && !rtu_yy_xx_dbgon;

// &Force("output", "had_rtu_xx_jdbreq"); @175
assign had_rtu_xx_jdbreq = async_dbg_req;

// &Force("output", "had_rtu_event_dbgreq"); @178

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    event_req <= 1'b0;
  else 
    event_req <= event_ctrl_enter_dbg;
end 

assign had_rtu_event_dbgreq = event_req && !rtu_yy_xx_dbgon;

assign mem_bkpta_inst_req_raw = bkpta_ctrl_inst_req_raw && !regs_ctrl_sqc[1];
assign mem_bkpta_data_req_raw = bkpta_ctrl_data_req_raw && !regs_ctrl_sqc[1];

assign mem_bkptb_inst_req_raw = bkptb_ctrl_inst_req_raw && !regs_ctrl_sqc[0] && !regs_ctrl_frzc;
assign mem_bkptb_data_req_raw = bkptb_ctrl_data_req_raw && !regs_ctrl_sqc[0] && !regs_ctrl_frzc;

assign had_rtu_inst_bkpt_dbgreq = (mem_bkpta_inst_req_raw || mem_bkptb_inst_req_raw) && regs_ctrl_fdb &&!rtu_yy_xx_dbgon;
assign had_rtu_data_bkpt_dbgreq = (mem_bkpta_data_req_raw || mem_bkptb_data_req_raw) && regs_ctrl_fdb &&!rtu_yy_xx_dbgon;

assign had_rtu_non_irv_bkpt_dbgreq = non_irv_bkpt_vld && !rtu_yy_xx_dbgon;

//==========================================================
//              wake up CPU from low power mode
//==========================================================

assign had_cp0_xx_dbg = (had_rtu_hw_dbgreq ||
                         inst_bkpt_dbgreq ||
                         data_bkpt_dbgreq ||
                         had_rtu_trace_dbgreq ||
                         had_rtu_xx_jdbreq ||   
                         had_rtu_event_dbgreq || 
                         non_irv_bkpt_vld) && !ctrl_xx_dbg_disable;

//==========================================================
//            control signal for RTU enter debug
//==========================================================

assign had_rtu_fdb = regs_ctrl_fdb;

// when trace or memory bkpt is enabled, RTU retires inst one by one
assign had_rtu_pop1_disa = regs_ctrl_tme ||
                          !regs_xx_nirven && (ctrl_bkpta_en || bkptb_en);

//when there may be new debug request, signal RTU to enable single retire
//mode and mask debug request if committed inst may be flushed
assign had_rtu_dbg_req_en = regs_ctrl_dr ||
                            regs_ctrl_adr ||
                            event_ctrl_enter_dbg ||
                            non_irv_bkpt_vld;

assign had_rtu_xx_tme = regs_ctrl_tme;

assign ctrl_event_dbgenter = rtu_had_dbgreq_ack ;

//==============================================================================
//               3. inform HSR to update corresponding status bits
//==============================================================================
// debug request has the highest proirity, all debug request will be acked.

// update adro
assign ctrl_regs_update_adro = async_dbg_req;

assign async_dbg_req = adr_set_req && !rtu_yy_xx_dbgon;

// update dro
assign ctrl_regs_update_dro = dr_set_req && !rtu_yy_xx_dbgon;

// update mbo
assign ctrl_regs_update_mbo = ((bkpta_ctrl_xx_ack ||
                                bkptb_ctrl_xx_ack) && regs_ctrl_fdb 
                              || non_irv_bkpt_vld)
                            && !rtu_yy_xx_dbgon;

assign ctrl_regs_bkpta_vld  = (bkpta_ctrl_xx_ack && regs_ctrl_fdb 
                            || non_irv_bkpt_vld && nirv_bkpta) 
                           && !rtu_yy_xx_dbgon;
assign ctrl_regs_bkptb_vld  = (bkptb_ctrl_xx_ack && regs_ctrl_fdb 
                            || non_irv_bkpt_vld && !nirv_bkpta)
                           && !rtu_yy_xx_dbgon;

// update swo
// if bkpt ins triggles mbkpt&soft bkpt, the mbkpt is higher than soft bkpt
// &Force("output","ctrl_regs_update_mbo"); @262
assign ctrl_regs_update_swo =rtu_had_inst0_bkpt_inst && rtu_yy_xx_retire0 &&
                              regs_ctrl_fdb &&
                              !ctrl_regs_update_mbo &&
                              !rtu_yy_xx_dbgon;

// update to
// if mbkpt&trace occurs at the same time, the mbkpt is higher than soft bkpt
assign ctrl_regs_update_to = trace_req && !rtu_yy_xx_dbgon && !ctrl_regs_update_mbo;

// update frzo
assign ctrl_regs_freeze_pcfifo = (bkptb_ctrl_inst_req || bkptb_ctrl_data_req) && rtu_yy_xx_retire0_normal
                              && !inst_bkpt_dbgreq && regs_ctrl_frzc;

// update sqb
assign ctrl_regs_set_sqb = (bkptb_ctrl_inst_req || bkptb_ctrl_data_req) && rtu_yy_xx_retire0_normal
                        && !inst_bkpt_dbgreq && regs_ctrl_sqc[0];

// update sqa
assign ctrl_regs_set_sqa =(bkpta_ctrl_inst_req || bkpta_ctrl_data_req) && rtu_yy_xx_retire0_normal
                        && !inst_bkpt_dbgreq && regs_ctrl_sqc[1];

//update pro
assign ctrl_regs_update_pro = event_req && !rtu_yy_xx_dbgon;

//==============================================================================
//                        exit debug mode logic
//==============================================================================

//==========================================================
//                    exit debug mode
//==========================================================

// CPU exit debug mode when TAP is in UPDATE_DR state and bypass or cpuscr reg 
// is selected

assign exit_dbg_active = x_ir_xx_ex && x_ir_xx_go
                      && x_sm_xx_update_dr_en && ir_ctrl_exit_dbg_reg
                      && rtu_yy_xx_dbgon;

assign exit_dbg = exit_dbg_active || event_ctrl_exit_dbg && rtu_yy_xx_dbgon;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ctrl_exit_dbg <= 1'b0;
  else
    ctrl_exit_dbg <= exit_dbg;
end

assign ctrl_regs_exit_dbg = ctrl_exit_dbg;

assign had_yy_xx_exit_dbg = ctrl_exit_dbg;

assign had_ifu_pcload = ctrl_exit_dbg;

assign ctrl_event_dbgexit = exit_dbg_active;

//==========================================================
//                    go in debug mode
//==========================================================
// CPU go in debug mode contains two cases:
//   1. normal debug channel
//   2. ddc channel

assign go_noex = !x_ir_xx_ex && x_ir_xx_go
               && x_sm_xx_update_dr_en && ir_xx_ir_reg_sel       // this is a pulse signal
               && rtu_yy_xx_dbgon;

assign ddc_inst_go =  regs_xx_ddc_en
                   && ddc_xx_update_ir  // this is a pulse signal
                   && rtu_yy_xx_dbgon;

assign go_in_dbg = go_noex || ddc_inst_go;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ctrl_go_noex <= 1'b0;
  else
    ctrl_go_noex <= go_in_dbg;
end

assign had_ifu_ir_vld = ctrl_go_noex;

//==========================================================
//                       TEE Signals
//==========================================================
// &Force("input", "had_xx_tee_dbg_disable"); &Force("bus", "had_xx_tee_dbg_disable", 7, 0); @360
// &Force("input", "forever_coreclk"); @361
// &Force("nonport", "had_xx_tee_dbg_disable_sync"); @362
// &Force("input", "had_xx_ree_dbg_disable"); &Force("bus", "had_xx_ree_dbg_disable", 7, 0); @373
// &Force("input", "forever_coreclk"); @374
// &Force("nonport", "had_xx_ree_dbg_disable_sync"); @375
assign ctrl_tee_dbg_disable = 1'b0;

//==========================================================
//                      Debug Disable
//==========================================================
// &Force("input", "x_had_dbg_mask"); @402
// &Force("input", "forever_coreclk"); @403
// &Force("nonport", "ctrl_out_dbg_disable"); @404
always @ (posedge forever_coreclk or negedge cpurst_b)
begin
  if (~cpurst_b)
    ctrl_out_dbg_disable <= 1'b0;
  else
    ctrl_out_dbg_disable <= x_had_dbg_mask;
end

assign ctrl_xx_dbg_disable = ctrl_tee_dbg_disable || ctrl_out_dbg_disable;

// &Force("output", "ctrl_xx_dbg_disable"); @417

assign had_rtu_dbg_disable = ctrl_xx_dbg_disable;


//==========================================================
//                         Top ICG
//==========================================================
assign had_clk_en = ir_ctrl_had_clk_en | event_ctrl_had_clk_en;

always@(posedge forever_coreclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    had_clk_en_ff <= 1'b0;
  else if (had_clk_en)
    had_clk_en_ff <= 1'b1;
  else if (regs_ctrl_pm[1:0] == 2'b11)
    had_clk_en_ff <= 1'b0;
end
assign had_xx_clk_en = had_clk_en | had_clk_en_ff;


// &ModuleEnd; @439
endmodule



