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
module plic_int_kid(
  busif_clr_kid_ip_x,
  busif_set_kid_ip_x,
  busif_we_kid_prio_data,
  busif_we_kid_prio_x,
  hreg_int_claim_kid_x,
  hreg_int_complete_kid_x,
  int_vld_aft_sync_x,
  pad_plic_int_cfg_x,
  kid_arb_int_prio_x,
  kid_arb_int_pulse_x,
  kid_arb_int_req_x,
  kid_busif_int_prio_x,
  kid_busif_pending_x,
  kid_clk,
  kid_hreg_int_pulse_x,
  kid_sample_en,
  kid_int_active_x,
  plicrst_b
);

parameter       PRIO_BIT = 5;
// &Ports; @26
input                   busif_clr_kid_ip_x;     
input                   busif_set_kid_ip_x;     
input   [PRIO_BIT-1:0]  busif_we_kid_prio_data; 
input                   busif_we_kid_prio_x;    
input                   hreg_int_claim_kid_x;   
input                   hreg_int_complete_kid_x; 
input                   int_vld_aft_sync_x;     
input                   pad_plic_int_cfg_x;
input                   kid_clk;                
input                   plicrst_b;              
output  [PRIO_BIT-1:0]  kid_arb_int_prio_x;     
output                  kid_arb_int_pulse_x;    
output                  kid_arb_int_req_x;      
output  [PRIO_BIT-1:0]  kid_busif_int_prio_x;   
output                  kid_busif_pending_x;    
output                  kid_hreg_int_pulse_x;   
output                  kid_sample_en;          
output                  kid_int_active_x;          

// &Regs; @27
reg                     int_active;             
reg                     int_pending;            
reg     [PRIO_BIT-1:0]  int_priority;           
reg                     int_vld_ff;             

// &Wires; @28
wire                    busif_clr_kid_ip_x;     
wire                    busif_set_kid_ip_x;     
wire    [PRIO_BIT-1:0]  busif_we_kid_prio_data; 
wire                    busif_we_kid_prio_x;    
wire                    hreg_int_claim_kid_x;   
wire                    hreg_int_complete_kid_x; 
wire                    int_pulse;              
wire                    int_vld;                
wire                    int_vld_aft_sync_x;     
wire    [PRIO_BIT-1:0]  kid_arb_int_prio_x;     
wire                    kid_arb_int_pulse_x;    
wire                    kid_arb_int_req_x;      
wire    [PRIO_BIT-1:0]  kid_busif_int_prio_x;   
wire                    kid_busif_pending_x;    
wire                    kid_clk;                
wire                    kid_hreg_int_pulse_x;   
wire                    kid_sample_en;          
wire                    plicrst_b;              
wire                    int_new_pending;
wire                    int_new_set_pending;
wire                    level_int_pending;


assign int_vld = int_vld_aft_sync_x;

//------------------------------------------------
//   sample the interrupt
//------------------------------------------------

assign kid_sample_en = int_vld ^ int_vld_ff;

always@(posedge kid_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    int_vld_ff <= 1'b0;
  else 
    int_vld_ff <= int_vld;
end

assign int_pulse           = int_vld && !int_vld_ff;
assign int_new_pending     = pad_plic_int_cfg_x ? int_pulse 
                                                : level_int_pending;
assign level_int_pending   = hreg_int_complete_kid_x ? int_vld : int_pulse;
assign int_new_set_pending = (!int_active || hreg_int_complete_kid_x)
                             && int_new_pending;
//------------------------------------------------
// PENDING register
//------------------------------------------------

always @(posedge kid_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    int_pending <= 1'b0;
  else if(busif_clr_kid_ip_x || hreg_int_claim_kid_x)
    int_pending <= 1'b0;
  else if(busif_set_kid_ip_x || int_new_set_pending)
    int_pending <= 1'b1;
end


//------------------------------------------------
// PRIORITY register
//------------------------------------------------
always@(posedge kid_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    int_priority[PRIO_BIT-1:0] <= {PRIO_BIT{1'b0}};
  else if(busif_we_kid_prio_x)
    int_priority[PRIO_BIT-1:0] <= busif_we_kid_prio_data[PRIO_BIT-1:0];
end

//===========================================================
//     interrupt active register
//     using this to mask-off the pending
//===========================================================
always @(posedge kid_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    int_active  <= 1'b0;
  else if(hreg_int_claim_kid_x) 
    int_active  <= 1'b1;
  else if(hreg_int_complete_kid_x)
    int_active  <= 1'b0;
end

assign kid_arb_int_pulse_x                = int_pulse;
assign kid_arb_int_req_x                  = int_pending 
                                            && !int_active 
                                            && (int_priority[PRIO_BIT-1:0] != {PRIO_BIT{1'b0}});
assign kid_arb_int_prio_x[PRIO_BIT-1:0]   = int_priority[PRIO_BIT-1:0];
assign kid_hreg_int_pulse_x               = int_pulse;
assign kid_busif_int_prio_x[PRIO_BIT-1:0] = int_priority[PRIO_BIT-1:0];
assign kid_busif_pending_x                = int_pending;

//for func coverage
assign kid_int_active_x			  = int_active;
// &ModuleEnd; @96
endmodule




