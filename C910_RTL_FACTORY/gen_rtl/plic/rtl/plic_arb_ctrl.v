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

module plic_arb_ctrl(
  plic_clk,
  arb_ctrl_int_prio,
  arb_ctrl_int_req,
  arbx_hartx_mint_req,
  arbx_hartx_sint_req,
  arbx_hreg_claim_reg_ready,
  arbx_hreg_arb_start_ack,
  ctrl_arb_int_prio,
  ctrl_arb_int_req,
  ctrl_arb_select_round,
  ctrl_arb_new_arb_start,
  hreg_arbx_arb_start,
  hreg_arbx_arb_flush,
  hreg_arbx_mint_claim,
  hreg_arbx_sint_claim,
  hreg_arbx_int_en,
  hreg_arbx_int_mmode,
  hreg_arbx_prio_sth,
  hreg_arbx_prio_mth,
  kid_yy_int_prio,
  kid_yy_int_req,
  int_sec_infor,
  ctrl_xx_core_sec,
  ctrl_xx_amp_mode,
  ciu_plic_icg_en,
  pad_yy_icg_scan_en,
  arb_clk,
  plicrst_b
);
parameter         INT_NUM       = 1024;
parameter         ECH_RD        = 32;
parameter         PRIO_BIT      = 5;

parameter        RD_NUM        = INT_NUM/ECH_RD;
parameter        CLOG_BIT      = clog2(RD_NUM-1);
parameter        RD_BIT        = (CLOG_BIT==0) ? 1 : CLOG_BIT;
parameter        IDLE          = 2'b00;
parameter        ARBTRATE      = 2'b01;
parameter        ARB_DELAY     = 2'b10;
parameter        WRITE_CLAIM   = 2'b11;
parameter        ADD_NUM       = 1024-INT_NUM;
parameter        ADD_RD_WITH   = 5 - RD_BIT;

function automatic integer clog2(input integer a);
begin
  for(clog2=32'd0;a>0;clog2=clog2+32'd1)
  begin
    a = a>>>1;
  end
end
endfunction

// &Ports; @26
input                           plic_clk;              
input   [PRIO_BIT  :0]          arb_ctrl_int_prio;        
input                           arb_ctrl_int_req;         
input                           hreg_arbx_arb_start;   
input                           hreg_arbx_arb_flush;
input                           hreg_arbx_mint_claim;      
input                           hreg_arbx_sint_claim;      
input   [INT_NUM-1:0]           hreg_arbx_int_en;         
input   [INT_NUM-1:0]           hreg_arbx_int_mmode;         
input   [PRIO_BIT-1   :0]       hreg_arbx_prio_sth;        
input   [PRIO_BIT-1   :0]       hreg_arbx_prio_mth;        
input   [INT_NUM*PRIO_BIT-1:0]  kid_yy_int_prio;          
input   [INT_NUM-1:0]           kid_yy_int_req;  
input   [INT_NUM-1:0]           int_sec_infor;
input                           ctrl_xx_core_sec;
input                           ctrl_xx_amp_mode;
input                           plicrst_b;      
input                           ciu_plic_icg_en;
input                           pad_yy_icg_scan_en;

output                          arbx_hartx_sint_req;       
output                          arbx_hartx_mint_req;       
output                          arbx_hreg_claim_reg_ready; 
output  [1024*(PRIO_BIT+1)-1:0] ctrl_arb_int_prio;        
output  [1023:0]                ctrl_arb_int_req;         
output  [4   :0]                ctrl_arb_select_round;    
output                          arbx_hreg_arb_start_ack;
output                          arb_clk;
output                          ctrl_arb_new_arb_start;

// &Regs; @27
reg     [RD_BIT-1:0]            arb_round;                
reg     [1   :0]                arb_state;                
reg     [1   :0]                arb_state_next;           
reg                             sint_out_req;              
reg                             mint_out_req;              
reg     [PRIO_BIT-1:0]          sint_out_prio;
reg     [PRIO_BIT-1:0]          mint_out_prio;

// &Wires; @28
wire                            arb_clk;              
wire    [PRIO_BIT    :0]        arb_ctrl_int_prio;        
wire                            arb_ctrl_int_req;         
wire                            arb_end;                  
wire                            arb_on;                   
wire                            arbx_core_sint_req_en;     
wire                            arbx_core_mint_req_en;     
wire                            arbx_hartx_sint_req;       
wire                            arbx_hartx_mint_req;       
wire                            arbx_hreg_claim_reg_ready; 
wire    [1024*(PRIO_BIT+1)-1:0]     ctrl_arb_int_prio;        
wire    [1023:0]                ctrl_arb_int_req;         
wire    [4   :0]                ctrl_arb_select_round;    
wire                            hreg_arbx_arb_start;      
wire                            hreg_arbx_mint_claim;      
wire                            hreg_arbx_sint_claim;      
wire    [INT_NUM-1:0]           hreg_arbx_int_en;         
wire    [PRIO_BIT-1   :0]       hreg_arbx_prio_sth;        
wire    [PRIO_BIT-1   :0]       hreg_arbx_prio_mth;        
wire    [INT_NUM-1:0]           int_in_req;               
wire    [1023:0]                int_req_1024;             
wire    [INT_NUM*PRIO_BIT-1:0]  kid_yy_int_prio;    
wire    [INT_NUM*(PRIO_BIT+1)-1:0]  form_kid_yy_int_prio;    
wire                            int_out_update;
wire    [INT_NUM-1:0]           kid_yy_int_req;           
wire                            plicrst_b;       
wire                            arb_ctrl_clk;
wire                            arb_ctrl_clk_en;
wire                            sint_on_clear;
wire                            mint_on_clear;
wire                            arb_ctrl_mint_req;
wire                            arb_ctrl_sint_req;
wire    [INT_NUM-2:0]           int_sec_ctrl;
gated_clk_cell  x_arb_ctrl_ready_gateclk (
  .clk_in               (plic_clk            ),
  .clk_out              (arb_ctrl_clk        ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (arb_ctrl_clk_en     ),
  .module_en            (ciu_plic_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
assign   arb_ctrl_clk_en =  hreg_arbx_arb_start ||
                            arb_state != IDLE ||
                            mint_out_req ||
                            sint_out_req;
assign arb_clk = arb_ctrl_clk;
//*************************************
// form to the bigest number 
// INT source
//*************************************

assign int_sec_ctrl[INT_NUM-2:0]            = (int_sec_infor[INT_NUM-1:1] 
                                              ~^ {(INT_NUM-1){ctrl_xx_core_sec}}) | 
                                              {(INT_NUM-1){~ctrl_xx_amp_mode}};
assign int_in_req[INT_NUM-1:0]              = kid_yy_int_req[INT_NUM-1:0] 
                                              & {hreg_arbx_int_en[INT_NUM-1:1],1'b1}
                                              & {int_sec_ctrl[INT_NUM-2:0],1'b1}; 
assign int_req_1024[1023:0]                 = {{ADD_NUM{1'b0}},int_in_req[INT_NUM-1:0]};
assign ctrl_arb_int_req[1023:0]             = int_req_1024[1023:0];
generate 
genvar i;
for(i=0;i<INT_NUM;i=i+1)
begin:FM_PRIO
  assign form_kid_yy_int_prio[(PRIO_BIT+1)*i+:(PRIO_BIT+1)] = {hreg_arbx_int_mmode[i],kid_yy_int_prio[i*PRIO_BIT+:PRIO_BIT]};
end
endgenerate
assign ctrl_arb_int_prio[1024*(PRIO_BIT+1)-1:0] = {{ADD_NUM*(PRIO_BIT+1){1'b0}},
                                        form_kid_yy_int_prio[INT_NUM*(PRIO_BIT+1)-1:0]};
//*************************************
// the arbtration round, which 
// is parameterized
//*************************************
always @(posedge arb_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    arb_round[RD_BIT-1:0] <= {RD_BIT{1'b0}};
  else if(hreg_arbx_arb_flush)
    arb_round[RD_BIT-1:0] <= {RD_BIT{1'b0}};
  else if(arb_end)
    arb_round[RD_BIT-1:0] <= {RD_BIT{1'b0}};
  else if(arb_on)
    arb_round[RD_BIT-1:0] <= arb_round[RD_BIT-1:0] + 1'b1;

end
assign arb_end   = arb_round[RD_BIT-1:0] == (RD_NUM-1);
assign arb_on    = arb_state[1:0] == ARBTRATE;
assign ctrl_arb_select_round[4:0] = {{ADD_RD_WITH{1'b0}},arb_round[RD_BIT-1:0]};
//*************************************
// the arbitration state machine
//*************************************
always @(posedge arb_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    arb_state[1:0] <= IDLE;
  else if(hreg_arbx_arb_flush)
    arb_state[1:0] <= IDLE;
  else
    arb_state[1:0] <= arb_state_next[1:0];
end
// &CombBeg; @79
always @( arb_end
       or arb_state[1:0]
       or hreg_arbx_arb_start)
begin
  case(arb_state[1:0])
    IDLE:       begin 
                if(hreg_arbx_arb_start)
                  arb_state_next[1:0] = ARBTRATE;
                else
                  arb_state_next[1:0] = IDLE;
                end
    ARBTRATE:   begin 
                if(arb_end)
                  arb_state_next[1:0] = ARB_DELAY;
                else
                  arb_state_next[1:0] = ARBTRATE;
                end
    ARB_DELAY:  arb_state_next[1:0]   = WRITE_CLAIM;
    WRITE_CLAIM:arb_state_next[1:0]   = IDLE;
    default: arb_state_next[1:0] = IDLE;
  endcase
// &CombEnd @97
end
assign arbx_hreg_arb_start_ack        = (arb_state[1:0] == IDLE) &&
                                        (arb_state_next[1:0] == ARBTRATE);
//it should happen in the first cycle of arbitration
assign ctrl_arb_new_arb_start         = (arb_state[1:0] == ARBTRATE) && 
                                        (arb_round[RD_BIT-1:0] == {RD_BIT{1'b0}});
assign arbx_hreg_claim_reg_ready      = arb_ctrl_int_req 
                                        && (arb_state[1:0]  == WRITE_CLAIM);
//*************************************
// the int request will be floped
//*************************************
// the second arbitration: threshold
assign arb_ctrl_sint_req               = arb_ctrl_int_req 
                                        && (arb_state[1:0]  == WRITE_CLAIM)
                                        // the s threashold
                                        && !arb_ctrl_int_prio[PRIO_BIT];
assign arb_ctrl_mint_req               = arb_ctrl_int_req 
                                        && (arb_state[1:0]  == WRITE_CLAIM)
                                        // the m threashold
                                        && arb_ctrl_int_prio[PRIO_BIT];

assign arbx_core_sint_req_en           = arb_ctrl_int_req 
                                        && (arb_state[1:0]  == WRITE_CLAIM)
                                        // the s threashold
                                        && !arb_ctrl_int_prio[PRIO_BIT]
                                        && (arb_ctrl_int_prio[PRIO_BIT-1:0] 
                                             > hreg_arbx_prio_sth[PRIO_BIT-1:0]);
assign arbx_core_mint_req_en           = arb_ctrl_int_req 
                                        && (arb_state[1:0]  == WRITE_CLAIM)
                                        // the m threashold
                                        &&  arb_ctrl_int_prio[PRIO_BIT]
                                        && (arb_ctrl_int_prio[PRIO_BIT-1:0] 
                                             > hreg_arbx_prio_mth[PRIO_BIT-1:0]);
//this is used fo threashold update to clear out
assign mint_on_clear                   = mint_out_req 
                                         && ((mint_out_prio[PRIO_BIT-1:0] 
                                             <= hreg_arbx_prio_mth[PRIO_BIT-1:0]));    
assign sint_on_clear                   = sint_out_req 
                                         && ((sint_out_prio[PRIO_BIT-1:0] 
                                             <= hreg_arbx_prio_sth[PRIO_BIT-1:0]));
assign int_out_update                 = (arb_state[1:0]  == WRITE_CLAIM);
always @ (posedge arb_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    sint_out_req    <= 1'b0;
  else if(int_out_update)
    sint_out_req    <= arbx_core_sint_req_en;
  else if(hreg_arbx_sint_claim || sint_on_clear)
    sint_out_req    <= 1'b0;
end 
always @ (posedge arb_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    sint_out_prio[PRIO_BIT-1:0]  <= {PRIO_BIT{1'b0}};
  else if(arb_ctrl_sint_req)
    sint_out_prio[PRIO_BIT-1:0]  <= arb_ctrl_int_prio[PRIO_BIT-1:0];
end
always @ (posedge arb_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    mint_out_req    <= 1'b0;
  else if(int_out_update)
    mint_out_req    <= arbx_core_mint_req_en;
  else if(hreg_arbx_mint_claim || mint_on_clear)
    mint_out_req    <= 1'b0;
end 
always @ (posedge arb_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    mint_out_prio[PRIO_BIT-1:0]  <= {PRIO_BIT{1'b0}};
  else if(arb_ctrl_mint_req)
    mint_out_prio[PRIO_BIT-1:0]  <= arb_ctrl_int_prio[PRIO_BIT-1:0];
end

assign arbx_hartx_mint_req    = mint_out_req;    
assign arbx_hartx_sint_req    = sint_out_req;    
// &ModuleEnd; @120
endmodule



