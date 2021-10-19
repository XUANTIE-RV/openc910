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

module pmu(
  apb_pmu_paddr,
  apb_pmu_penable,
  apb_pmu_psel,
  apb_pmu_pwdata,
  apb_pmu_pwrite,
  biu_pad_lpmd_b,
  corec_pmu_sleep_out,
  cpu_clk,
  gate_en0,
  gate_en1,
  had_pad_wakeup_req_b,
  i_pad_cpu_jtg_rst_b,
  i_pad_jtg_tclk,
  intraw_vld,
  pad_cpu_rst_b,
  pad_had_jdb_req_b,
  pad_had_jtg_tap_en,
  pad_had_jtg_tms,
  pad_had_jtg_trst_b,
  pad_had_jtg_trst_b_pre,
  pg_reset_b,
  pmu_apb_prdata,
  pmu_clk,
  // pmu_corec_isolation,
  // pmu_corec_sleep_in,
  pmu_cpu_pwr_on, 
  pmu_cpu_iso_in, 
  pmu_cpu_iso_out, 
  pmu_cpu_save, 
  pmu_cpu_restore
);

// &Ports; @25
input   [11:0]  apb_pmu_paddr;         
input           apb_pmu_penable;       
input           apb_pmu_psel;          
input   [31:0]  apb_pmu_pwdata;        
input           apb_pmu_pwrite;        
input   [1 :0]  biu_pad_lpmd_b;        
input           corec_pmu_sleep_out;   
input           cpu_clk;               
input           had_pad_wakeup_req_b;  
input           i_pad_cpu_jtg_rst_b;   
input           i_pad_jtg_tclk;        
input           intraw_vld;            
input           pad_cpu_rst_b;         
input           pad_had_jtg_tap_en;    
input           pad_had_jtg_tms;       
input           pad_had_jtg_trst_b_pre; 
input           pmu_clk;               
output          gate_en0;              
output          gate_en1;              
output          pad_had_jdb_req_b;     
output          pad_had_jtg_trst_b;    
output          pg_reset_b;            
output  [31:0]  pmu_apb_prdata;        
// output          pmu_corec_isolation;   
// output          pmu_corec_sleep_in;    
output          pmu_cpu_pwr_on; 
output          pmu_cpu_iso_in; 
output          pmu_cpu_iso_out; 
output          pmu_cpu_save;
output          pmu_cpu_restore;

// &Regs; @26
reg     [31:0]  counter;               
reg             counter_en_ff;         
reg     [31:0]  counter_load;          
reg     [31:0]  ctrl_reg;              
reg     [2 :0]  cur_state;             
reg             debug_pending;         
reg             event_ff;              
reg             event_pending;         
reg     [2 :0]  next_state;            
reg     [2 :0]  pg_next_state;         
reg     [2 :0]  pg_state;              
reg     [31:0]  pmu_apb_prdata;        

// Supporting various low power strategies
reg     [31:0]  pmu_lp_mode_sel;

// &Wires; @27
wire    [11:0]  apb_pmu_paddr;         
wire            apb_pmu_penable;       
wire            apb_pmu_psel;          
wire    [31:0]  apb_pmu_pwdata;        
wire            apb_pmu_pwrite;        
wire    [1 :0]  biu_pad_lpmd_b;        
wire            corec_pmu_sleep_out;   
wire            counter_en;            
wire            cpu_clk;               
wire            debug_ctl_en;          
wire            debug_vld;             
wire            debug_vld_pre;         
wire            debug_wake_vld;        
wire            doze_mode;             
wire            event_ctl_en;          
wire            event_vld;             
wire            gate_en0;              
wire            gate_en1;              
wire            had_pad_wakeup_req_b;  
wire            i_pad_cpu_jtg_rst_b;   
wire            i_pad_jtg_tclk;        
wire            intraw_vld;            
wire            load_cnt_en;           
wire            low_power_dis;         
wire            low_power_dis_pre;     
wire            lpmd_en;               
wire            lpmd_en_ff;            
wire            pad_cpu_rst_b;         
wire            pad_had_jdb_req_b;     
wire            pad_had_jtg_tap_en;    
wire            pad_had_jtg_tms;       
wire            pad_had_jtg_trst_b;    
wire            pad_had_jtg_trst_b_pre; 
wire            pad_vic_event_vld;     
wire            pg_reset_b;            
wire            pmu_clk;
// wire            pmu_corec_isolation;   
// wire            pmu_corec_sleep_in;    
reg            pmu_cpu_pwr_on; 
reg            pmu_cpu_iso_in; 
reg            pmu_cpu_iso_out; 
reg            pmu_cpu_save;
reg            pmu_cpu_restore;

wire            pmu_debug_wakeup;      
wire            pmu_event_wakeup;      
wire            pmu_wakeup;            
wire            pmu_wic_wakeup;        
wire            stop_mode;             
wire            wait_mode;             
wire            wic_ctl_en;            

// Supporting various low power strategies
wire            pmu_lp_mode_normal;
wire            pmu_lp_mode_clk_slow;
wire            pmu_lp_mode_clk_off;
wire            pmu_lp_mode_ret_pwr_off;
wire            pmu_lp_mode_pwr_off;


parameter NORMAL_MODE      = 3'b000;    // 0x0
parameter LIGHT_SLP_MODE   = 3'b001;    // 0x1
parameter LSLP_TO_NORMAL   = 3'b010;    // 0x2
parameter DEEP_SLP_MODE    = 3'b011;    // 0x3
parameter DSLP_TO_NORMAL   = 3'b100;    // 0x4

parameter PG_IDLE          = 3'b000;
parameter PG_RESET_ON      = 3'b001;
parameter PG_ISO_ON        = 3'b010;
parameter PG_POWER_OFF_REQ = 3'b011;
parameter PG_POWER_OFF     = 3'b100;
parameter PG_POWER_ON      = 3'b101;
parameter PG_ISO_OFF       = 3'b110;
parameter PG_RESET_OFF     = 3'b111;

assign low_power_dis_pre = (biu_pad_lpmd_b[1:0] == 2'b11);

assign lpmd_en = (biu_pad_lpmd_b[1:0] != 2'b11) ;

////////////sync /////////////////////
// &Instance("sync", "x_cpu2pmu_sync1"); @58
sync  x_cpu2pmu_sync1 (
  .fast_clk      (cpu_clk      ),
  .in            (lpmd_en      ),
  .out           (lpmd_en_ff   ),
  .pad_cpu_rst_b (pad_cpu_rst_b),
  .slow_clk      (pmu_clk      )
);

// &Connect( .in              ( lpmd_en                  ), @59
//           .out             ( lpmd_en_ff               ), @60
//           .fast_clk        ( cpu_clk                  ), @61
//           .slow_clk        ( pmu_clk                  ) @62
//          ); @63

// &Instance("sync", "x_cpu2pmu_sync2"); @69
sync  x_cpu2pmu_sync2 (
  .fast_clk          (cpu_clk          ),
  .in                (low_power_dis_pre),
  .out               (low_power_dis    ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .slow_clk          (pmu_clk          )
);

// &Connect( .in              ( low_power_dis_pre        ), @70
//           .out             ( low_power_dis            ), @71
//           .fast_clk        ( cpu_clk                  ), @72
//           .slow_clk        ( pmu_clk                  ) @73
//          ); @74

//------------------------------------------------
//WRITE CTRL REG
//------------------------------------------------
always @ (posedge pmu_clk or negedge pad_cpu_rst_b)
begin
if (!pad_cpu_rst_b)
  begin
    ctrl_reg[31:0] <= 32'b0;
    pmu_lp_mode_sel[31:0] <= 32'b0;
  end
else if (apb_pmu_psel && apb_pmu_pwrite && apb_pmu_penable)
  begin
    if (!apb_pmu_paddr[11:0] )
      ctrl_reg[31:0] <= apb_pmu_pwdata[31:0];
    else if (apb_pmu_paddr[11:0] == 12'h4 )
      counter_load[31:0] <= apb_pmu_pwdata[31:0];
    else if (apb_pmu_paddr[11:0] == 12'h8 )
      pmu_lp_mode_sel[31:0]    <=  cur_state[2:0] == NORMAL_MODE ? apb_pmu_pwdata[31:0] : pmu_lp_mode_sel[31:0];
  end
end

//------------------------------------------------
//READ CTRL REG
//------------------------------------------------
// &CombBeg; @99
always @( apb_pmu_paddr[11:0]
       or ctrl_reg[3:0]
       or apb_pmu_psel
       or apb_pmu_pwrite
       or counter[31:0])
begin
if (apb_pmu_psel && !apb_pmu_pwrite) 
begin
  if(!apb_pmu_paddr[11:0] )
    pmu_apb_prdata[31:0] = {28'b0,ctrl_reg[3:0]};
  else if (apb_pmu_paddr[11:0] == 12'h4 )
    pmu_apb_prdata[31:0] = counter[31:0];
  else if (apb_pmu_paddr[11:0] == 12'h8 )
    pmu_apb_prdata[31:0] = pmu_lp_mode_sel[31:0];
  else
    pmu_apb_prdata[31:0] = 32'b0;
end
// &CombEnd; @109
end

assign wic_ctl_en = ctrl_reg[0];
assign event_ctl_en = ctrl_reg[1];
assign debug_ctl_en = ctrl_reg[2];
assign counter_en = ctrl_reg[3];

//event counter
always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
  begin
    counter_en_ff <=0;
  end
  else
  begin
    counter_en_ff <=counter_en ;
  end
end

assign load_cnt_en= (counter_en && !counter_en_ff)
                    || !(|counter[31:0]);

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
  begin
    counter[31:0] <= 32'h0;
  end
  else if (load_cnt_en)
  begin
    counter[31:0] <= counter_load[31:0];
  end
  else if (counter_en)
     counter[31:0] <= counter[31:0] -1'b1;
  else
     counter[31:0] <= counter[31:0];
end

assign pad_vic_event_vld = (counter[31:0] == 32'b0) && counter_en;


assign pmu_wic_wakeup = intraw_vld && wic_ctl_en && lpmd_en_ff ;

// event_wakeup

assign event_vld = pad_vic_event_vld && !event_ff && lpmd_en_ff ;

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b)
    event_ff <= 1'b0;
  else
    event_ff <= pad_vic_event_vld;
end

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b)
    event_pending <= 1'b0;
  else if (event_vld)
    event_pending <= 1'b1;
  else if (low_power_dis)
    event_pending <= 1'b0;
end

assign pmu_event_wakeup = event_pending && event_ctl_en ;

//debug wake up 
// &Instance("tap2_sm", "x_tap2_sm"); @180
tap2_sm  x_tap2_sm (
  .debug_wake_vld      (debug_wake_vld     ),
  .pad_had_jtg_tap_en  (pad_had_jtg_tap_en ),
  .tclk                (i_pad_jtg_tclk     ),
  .tms_i               (pad_had_jtg_tms    ),
  .trst_b              (i_pad_cpu_jtg_rst_b)
);

assign debug_vld_pre = (debug_wake_vld || !had_pad_wakeup_req_b) && lpmd_en_ff;

// &Instance("px_had_sync", "x_jtag2pmu_sync"); @193
px_had_sync  x_jtag2pmu_sync (
  .clk1                   (i_pad_jtg_tclk        ),
  .clk2                   (pmu_clk               ),
  .rst1_b                 (pad_had_jtg_trst_b_pre),
  .rst2_b                 (pad_cpu_rst_b         ),
  .sync_in                (debug_vld_pre         ),
  .sync_out               (debug_vld             )
);

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b)
    debug_pending <= 1'b0;
  else if (debug_vld)
    debug_pending <= 1'b1;
  else if (low_power_dis)
    debug_pending <= 1'b0;
end
 
assign pad_had_jdb_req_b = !debug_pending;
assign pmu_debug_wakeup = debug_pending && debug_ctl_en ;
/////
assign pmu_wakeup = pmu_event_wakeup || pmu_wic_wakeup || pmu_debug_wakeup ;

// Supporting various low power strategies
assign pmu_lp_mode_pwr_off       = pmu_lp_mode_sel[4];	// Deep
assign pmu_lp_mode_ret_pwr_off   = pmu_lp_mode_sel[3];	// Deep
assign pmu_lp_mode_clk_off       = pmu_lp_mode_sel[2];	// Light
assign pmu_lp_mode_clk_slow      = pmu_lp_mode_sel[1];	// Light
assign pmu_lp_mode_normal        = pmu_lp_mode_sel[0];	// Normal
//-----------------------------------------
//              PMU FSM             
//-----------------------------------------
wire normal_req;
// wire light_slp_req;
// wire deep_slp_req;
wire cpu_slp_req;
assign normal_req    = biu_pad_lpmd_b[1:0] == 2'b11;
// assign light_slp_req = biu_pad_lpmd_b[1:0] == 2'b01;
// assign deep_slp_req  = biu_pad_lpmd_b[1:0] == 2'b00;
assign cpu_slp_req   = biu_pad_lpmd_b[1:0] != 2'b11;

reg         dslp_in_sequence_req;
reg         dslp_in_sequence_done; 
reg         dslp_out_sequence_req;
reg         dslp_out_sequence_done; 
reg [15:0]  dslp_sequence_counter;
reg         dslp_sequence_counter_enable;

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b)
    cur_state[2:0] <= NORMAL_MODE;
  else
    cur_state[2:0] <= next_state[2:0];
end

always @(*) begin
  case(cur_state)
  NORMAL_MODE:
    begin
      if(pmu_lp_mode_normal) 
        next_state = NORMAL_MODE;
      else if(pmu_lp_mode_clk_slow || pmu_lp_mode_clk_off)
        if(cpu_slp_req)
          next_state = LIGHT_SLP_MODE;
        else
          next_state = NORMAL_MODE;
      else if(pmu_lp_mode_ret_pwr_off || pmu_lp_mode_pwr_off)
        if(cpu_slp_req)
          next_state = DEEP_SLP_MODE;
        else
          next_state = NORMAL_MODE;
      else
        next_state = NORMAL_MODE;
    end
  LIGHT_SLP_MODE:
    begin
      if(pmu_wakeup)
        next_state = LSLP_TO_NORMAL;
      else
        next_state = LIGHT_SLP_MODE;
    end
  LSLP_TO_NORMAL:
    begin
      if(normal_req)
        next_state = NORMAL_MODE;
      else
        next_state = LSLP_TO_NORMAL;
    end
  DEEP_SLP_MODE:
    begin
      if(pmu_wakeup && dslp_in_sequence_done)
        next_state = DSLP_TO_NORMAL;
      else
        next_state = DEEP_SLP_MODE;
    end
  DSLP_TO_NORMAL:
    begin
      if(normal_req && dslp_out_sequence_done)
        next_state = NORMAL_MODE;
      else
        next_state = DSLP_TO_NORMAL;
    end
  endcase
end

// gate_en0/1 (connected to fpga_clk_gen), reused as:
//   gate_en0:
//     0: clock normal 
//     1: clock slow 
//   gate_en1:
//     0: clock normal
//     1: clock off

assign gate_en0 = (cur_state[2:0] == LIGHT_SLP_MODE) && pmu_lp_mode_clk_slow ? 1 : 0;
assign gate_en1 = (cur_state[2:0] == LIGHT_SLP_MODE && pmu_lp_mode_clk_off) ||
                  (cur_state[2:0] == DEEP_SLP_MODE  && pmu_lp_mode_ret_pwr_off) 
                  ? 1 : 0;

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b) begin
    dslp_in_sequence_req    <= 1'b0;
    dslp_out_sequence_req   <= 1'b0;
  end
  else if (cur_state[2:0] == NORMAL_MODE && next_state[2:0] == DEEP_SLP_MODE) begin
    dslp_in_sequence_req    <= 1'b1;
    dslp_out_sequence_req   <= 1'b0;
  end
  else if (cur_state[2:0] == DEEP_SLP_MODE && next_state[2:0] == DSLP_TO_NORMAL) begin
    dslp_in_sequence_req    <= 1'b0;
    dslp_out_sequence_req   <= 1'b1;
  end
  else begin 
    dslp_in_sequence_req    <= 1'b0;
    dslp_out_sequence_req   <= 1'b0;
  end
end

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    dslp_sequence_counter_enable    <= 1'b0;
  else if (dslp_in_sequence_req || dslp_out_sequence_req)
    dslp_sequence_counter_enable    <= 1'b1;
  else if (dslp_in_sequence_done || dslp_out_sequence_done)
    dslp_sequence_counter_enable    <= 1'b0;
  else
    dslp_sequence_counter_enable    <= dslp_sequence_counter_enable;
end

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    dslp_sequence_counter[15:0]    <= 16'h0;
  else if (dslp_sequence_counter_enable)
    dslp_sequence_counter[15:0]    <= dslp_sequence_counter[15:0] + 1'b1;
  else
    dslp_sequence_counter[15:0]    <= 16'h0;
end

always @(posedge pmu_clk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
  begin
    pmu_cpu_pwr_on    <= 1'b1; 
    pmu_cpu_iso_in    <= 1'b0; 
    pmu_cpu_iso_out   <= 1'b0; 
    pmu_cpu_save      <= 1'b0;
    pmu_cpu_restore   <= 1'b0;

    dslp_in_sequence_done  <= 1'b0;
    dslp_out_sequence_done <= 1'b0;
  end
  else if (cur_state[2:0] == DEEP_SLP_MODE)
  begin
    pmu_cpu_restore        <= 1'b0;
    dslp_out_sequence_done <= 1'b0;

    case(dslp_sequence_counter[15:0])
    16'h1:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b0; 
        pmu_cpu_iso_out    <= 1'b0; 
        pmu_cpu_save       <= 1'b0;
      end
    16'h20:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b1; 
        pmu_cpu_iso_out    <= 1'b1; 
        pmu_cpu_save       <= 1'b0;
      end
    16'h40:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b1; 
        pmu_cpu_iso_out    <= 1'b1; 
        pmu_cpu_save       <= 1'b1;
      end
    16'h41:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b1; 
        pmu_cpu_iso_out    <= 1'b1; 
        pmu_cpu_save       <= 1'b0;
      end
    16'h60:
      begin
        pmu_cpu_pwr_on     <= 1'b0; 
        pmu_cpu_iso_in     <= 1'b1; 
        pmu_cpu_iso_out    <= 1'b1; 
        pmu_cpu_save       <= 1'b0;

        dslp_in_sequence_done <= 1'b1;
      end
    default:
      begin
        pmu_cpu_pwr_on     <= pmu_cpu_pwr_on ; 
        pmu_cpu_iso_in     <= pmu_cpu_iso_in ; 
        pmu_cpu_iso_out    <= pmu_cpu_iso_out; 
        pmu_cpu_save       <= pmu_cpu_save   ;

        dslp_in_sequence_done <= dslp_in_sequence_done;
      end
    endcase
  end
  else if (cur_state[2:0] == DSLP_TO_NORMAL)
  begin
    pmu_cpu_save           <= 1'b0;
    dslp_in_sequence_done  <= 1'b0;

    case(dslp_sequence_counter[15:0])
    16'h1:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b1; 
        pmu_cpu_iso_out    <= 1'b1; 
        pmu_cpu_restore    <= 1'b0;

        dslp_out_sequence_done <= 1'b0;
      end
    16'h20:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b1; 
        pmu_cpu_iso_out    <= 1'b1; 
        pmu_cpu_restore    <= 1'b1;

        dslp_out_sequence_done <= 1'b0;
      end
    16'h21:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b1; 
        pmu_cpu_iso_out    <= 1'b1; 
        pmu_cpu_restore    <= 1'b0;

        dslp_out_sequence_done <= 1'b0;
      end
    16'h40:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b0; 
        pmu_cpu_iso_out    <= 1'b0; 
        pmu_cpu_restore    <= 1'b0;

        dslp_out_sequence_done <= 1'b0;
      end
    16'h60:
      begin
        pmu_cpu_pwr_on     <= 1'b1; 
        pmu_cpu_iso_in     <= 1'b0; 
        pmu_cpu_iso_out    <= 1'b0; 
        pmu_cpu_restore    <= 1'b0;

        dslp_out_sequence_done <= 1'b1;
      end
    default:
      begin
        pmu_cpu_pwr_on     <= pmu_cpu_pwr_on ; 
        pmu_cpu_iso_in     <= pmu_cpu_iso_in ; 
        pmu_cpu_iso_out    <= pmu_cpu_iso_out; 
        pmu_cpu_restore    <= pmu_cpu_restore   ;

        dslp_out_sequence_done <= dslp_out_sequence_done;
      end
    endcase
  end
  else
  begin
    pmu_cpu_pwr_on     <= pmu_cpu_pwr_on ; 
    pmu_cpu_iso_in     <= pmu_cpu_iso_in ; 
    pmu_cpu_iso_out    <= pmu_cpu_iso_out; 
    pmu_cpu_save       <= pmu_cpu_save   ;
    pmu_cpu_restore    <= pmu_cpu_restore;

    dslp_in_sequence_done  <= dslp_in_sequence_done;
    dslp_out_sequence_done <= dslp_out_sequence_done;
  end
end


// assign pg_reset_b          = pad_cpu_rst_b && tdt_dm_pad_ndmreset_n;
assign pg_reset_b          = pad_cpu_rst_b;
assign pad_had_jtg_trst_b  = pad_had_jtg_trst_b_pre;
// &ModuleEnd; @389
endmodule

