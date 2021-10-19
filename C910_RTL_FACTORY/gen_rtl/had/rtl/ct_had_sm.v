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

// &ModuleBeg; @22
module ct_had_sm(
  cpurst_b,
  dbgfifo2_read_ren,
  forever_cpuclk,
  io_sm_tap_en,
  ir_sm_hacr_rw,
  ir_xx_dbgfifo2_reg_sel,
  pad_had_jtg_tms,
  pad_yy_icg_scan_en,
  sm_io_tdo_en,
  sm_ir_update_hacr,
  sm_serial_capture_dr,
  sm_serial_shift_dr,
  sm_serial_shift_ir,
  sm_update_dr,
  sm_update_ir,
  sm_xx_write_en,
  tclk,
  trst_b
);

// &Ports; @23
input          cpurst_b;              
input          forever_cpuclk;        
input          io_sm_tap_en;          
input          ir_sm_hacr_rw;         
input          ir_xx_dbgfifo2_reg_sel; 
input          pad_had_jtg_tms;       
input          pad_yy_icg_scan_en;    
input          tclk;                  
input          trst_b;                
output         dbgfifo2_read_ren;     
output         sm_io_tdo_en;          
output         sm_ir_update_hacr;     
output         sm_serial_capture_dr;  
output         sm_serial_shift_dr;    
output         sm_serial_shift_ir;    
output         sm_update_dr;          
output         sm_update_ir;          
output         sm_xx_write_en;        

// &Regs; @24
reg     [5:0]  tap5_cur_st;           
reg     [5:0]  tap5_nxt_st;           
reg            tdo_en;                
reg            update_ir_cpu_ff1;     

// &Wires; @25
wire           cpurst_b;              
wire           dbgfifo2_read;         
wire           dbgfifo2_read_ren;     
wire           forever_cpuclk;        
wire           io_sm_tap_en;          
wire           ir_sm_hacr_rw;         
wire           ir_xx_dbgfifo2_reg_sel; 
wire           pad_had_jtg_tms;       
wire           pad_yy_icg_scan_en;    
wire           sm5_capture_dr;        
wire           sm5_shift_dr;          
wire           sm5_shift_ir;          
wire           sm5_update_dr;         
wire           sm5_update_ir;         
wire           sm_clk;                
wire           sm_clk_en;             
wire           sm_io_tdo_en;          
wire           sm_ir_update_hacr;     
wire           sm_ir_update_hacr_ff1; 
wire           sm_serial_capture_dr;  
wire           sm_serial_shift_dr;    
wire           sm_serial_shift_ir;    
wire           sm_update_dr;          
wire           sm_update_ir;          
wire           sm_update_ir_cpu;      
wire           sm_xx_write_en;        
wire           tclk;                  
wire           tms_i;                 
wire           trst_b;                


assign tms_i = pad_had_jtg_tms;

//==============================================================================
//                    TAP5 controller state machine
//==============================================================================
parameter TAP5_RESET          = 6'b000000;
parameter TAP5_IDLE           = 6'b000001;
parameter TAP5_SELECT_DR_SCAN = 6'b000011;
parameter TAP5_SELECT_IR_SCAN = 6'b000010;
parameter TAP5_CAPTURE_IR     = 6'b000110;
parameter TAP5_SHIFT_IR       = 6'b000100;
parameter TAP5_EXIT1_IR       = 6'b000101;
// parameter TAP5_UPDATE_IR      = 4'b0111;
parameter TAP5_UPDATE_IR      = 6'b010000; // UPDATE_IR change to 1 bit reg to sync.
parameter TAP5_CAPTURE_DR     = 6'b001011;
parameter TAP5_SHIFT_DR       = 6'b001010;
parameter TAP5_EXIT1_DR       = 6'b001000;
// parameter TAP5_UPDATE_DR      = 4'b1001;
parameter TAP5_UPDATE_DR      = 6'b100000; // UPDATE_DR change to 1 bit reg to sync.
parameter TAP5_PAUSE_IR       = 6'b001101;
parameter TAP5_EXIT2_IR       = 6'b001111;
parameter TAP5_PAUSE_DR       = 6'b001100;
parameter TAP5_EXIT2_DR       = 6'b001110;

always @(posedge tclk or negedge trst_b)
begin
  if (!trst_b)
    tap5_cur_st[5:0] <= TAP5_RESET;
  else begin
    tap5_cur_st[5:0] <= tap5_nxt_st[5:0];
  end
end

// &CombBeg; @60
always @( io_sm_tap_en
       or tap5_cur_st[5:0]
       or tms_i)
begin
  case(tap5_cur_st[5:0])
    TAP5_RESET:
      if (io_sm_tap_en && !tms_i)
        tap5_nxt_st[5:0] = TAP5_IDLE;
      else
        tap5_nxt_st[5:0] = TAP5_RESET;
    TAP5_IDLE:
      if (tms_i)      
        tap5_nxt_st[5:0] = TAP5_SELECT_DR_SCAN;
      else
        tap5_nxt_st[5:0] = TAP5_IDLE;
    TAP5_SELECT_DR_SCAN:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_SELECT_IR_SCAN;
      else
        tap5_nxt_st[5:0] = TAP5_CAPTURE_DR;
    TAP5_SELECT_IR_SCAN:
      if (!tms_i)
        tap5_nxt_st[5:0] = TAP5_CAPTURE_IR;
      else
        tap5_nxt_st[5:0] = TAP5_RESET;
    TAP5_CAPTURE_IR:
      if (!tms_i)
        tap5_nxt_st[5:0] = TAP5_SHIFT_IR;
      else
        tap5_nxt_st[5:0] = TAP5_EXIT1_IR;
    TAP5_SHIFT_IR: 
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_EXIT1_IR;
      else
        tap5_nxt_st[5:0] = TAP5_SHIFT_IR;
    TAP5_EXIT1_IR:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_UPDATE_IR;
      else
        tap5_nxt_st[5:0] = TAP5_PAUSE_IR;
    TAP5_PAUSE_IR:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_EXIT2_IR;
      else
        tap5_nxt_st[5:0] = TAP5_PAUSE_IR;
    TAP5_EXIT2_IR:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_UPDATE_IR;
      else
        tap5_nxt_st[5:0] = TAP5_SHIFT_IR;
    TAP5_UPDATE_IR:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_SELECT_DR_SCAN;
      else
        tap5_nxt_st[5:0] = TAP5_IDLE;
    TAP5_CAPTURE_DR: 
      if (!tms_i)
        tap5_nxt_st[5:0] = TAP5_SHIFT_DR;
      else
        tap5_nxt_st[5:0] = TAP5_EXIT1_DR;
    TAP5_SHIFT_DR:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_EXIT1_DR;
      else
        tap5_nxt_st[5:0] = TAP5_SHIFT_DR;
    TAP5_EXIT1_DR:
      if (!tms_i)
        tap5_nxt_st[5:0] = TAP5_PAUSE_DR;
      else
        tap5_nxt_st[5:0] = TAP5_UPDATE_DR;
    TAP5_PAUSE_DR:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_EXIT2_DR;
      else
        tap5_nxt_st[5:0] = TAP5_PAUSE_DR;
    TAP5_EXIT2_DR:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_UPDATE_DR;
      else
        tap5_nxt_st[5:0] = TAP5_SHIFT_DR;
    TAP5_UPDATE_DR:
      if (tms_i)
        tap5_nxt_st[5:0] = TAP5_SELECT_DR_SCAN;
      else
        tap5_nxt_st[5:0] = TAP5_IDLE;
    default:
        tap5_nxt_st[5:0] = TAP5_RESET;
  endcase
// &CombEnd; @145
end

//=============================================
// TAP5 status
//=============================================
assign sm5_shift_ir   = (tap5_cur_st[5:0] == TAP5_SHIFT_IR);
assign sm5_update_ir  = tap5_cur_st[4];
assign sm5_shift_dr   = (tap5_cur_st[5:0] == TAP5_SHIFT_DR);
assign sm5_update_dr  = tap5_cur_st[5];
assign sm5_capture_dr = (tap5_cur_st[5:0] == TAP5_CAPTURE_DR);

//=============================================
// TDO output enable in JTAG_5 interafce
//=============================================
always @(negedge tclk or negedge trst_b)
begin
  if (!trst_b)
    tdo_en <= 1'b0;
  else if (sm5_shift_dr && ir_sm_hacr_rw)
    tdo_en <= 1'b1;
  else
    tdo_en <= 1'b0;
end

assign sm_io_tdo_en = tdo_en;


//==========================================================
//           Interface to serial module
//==========================================================
// shift_ir, shift_dr and capture_dr are used in serial in and out and is in 
// tclk domain, thus no synchronization is needed.
assign sm_serial_shift_ir   = sm5_shift_ir; 
assign sm_serial_shift_dr   = sm5_shift_dr;
assign sm_serial_capture_dr = sm5_capture_dr;

//==========================================================
//  tclk domain to cpuclk domain
// update_ir, update_dr are used in registers updating and is in cpuclk domain,
// thus synchronization is needed.
//==========================================================
assign sm_update_ir = sm5_update_ir;
assign sm_update_dr = sm5_update_dr;

// &Instance("ct_had_sync_3flop", "x_ct_had_sync_ir"); @189
ct_had_sync_3flop  x_ct_had_sync_ir (
  .clk1             (forever_cpuclk  ),
  .clk2             (tclk            ),
  .rst1_b           (cpurst_b        ),
  .rst2_b           (trst_b          ),
  .sync_in          (sm_update_ir    ),
  .sync_out         (sm_update_ir_cpu)
);

// &Connect(.clk1           (forever_cpuclk), @190
//          .clk2           (tclk), @191
//          .rst1_b         (cpurst_b), @192
//          .rst2_b         (trst_b), @193
//          .sync_in        (sm_update_ir), @194
//          .sync_out       (sm_update_ir_cpu) @195
//         ); @196

// &Instance("ct_had_sync", "x_ct_had_sync_dr");
// // &Connect(.clk1           (forever_cpuclk), @199
// //          .clk2           (tclk), @200
// //          .rst1_b         (cpurst_b), @201
// //          .rst2_b         (trst_b), @202
// //          .sync_in        (sm_update_dr), @203
// //          .sync_out       (sm_update_dr_cpu) @204
// //         ); @205

// &Force("output", "sm_update_ir"); @207
// &Force("output", "sm_update_dr"); @208
//==========================================================
//                    update ir
//==========================================================

assign sm_ir_update_hacr = sm_update_ir_cpu;
assign sm_ir_update_hacr_ff1 = update_ir_cpu_ff1;

always @(posedge sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    update_ir_cpu_ff1 <= 1'b0;
  end
  else begin
    update_ir_cpu_ff1 <= sm_update_ir_cpu;
  end
end

//==========================================================
//                    update dr
//==========================================================
// &Force ("output", "sm_xx_write_en"); @229
//================================
// we ignor JTAG interface type, and only use HACR[7] bit to indicate
// "read" or "write" operation.
// If we use sm2_read_vld in JTAG2 interface, this will couse PCFIFO
// cannot be read out!
//================================
assign sm_xx_write_en      = !ir_sm_hacr_rw;

//assign update_dr_cpu = sm_update_dr_cpu;

assign sm_clk_en = sm_update_ir_cpu  ^ update_ir_cpu_ff1;

// &Instance("gated_clk_cell", "x_had_sm_gated_clk"); @242
gated_clk_cell  x_had_sm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sm_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sm_clk_en         ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @243
//          .external_en (1'b0), @244
//          .global_en   (1'b1), @245
//          .module_en   (1'b0), @246
//          .local_en    (sm_clk_en), @247
//          .clk_out     (sm_clk)); @248

assign dbgfifo2_read = ir_sm_hacr_rw && ir_xx_dbgfifo2_reg_sel;
assign dbgfifo2_read_ren = dbgfifo2_read && sm_ir_update_hacr_ff1;

// &ModuleEnd; @253
endmodule






