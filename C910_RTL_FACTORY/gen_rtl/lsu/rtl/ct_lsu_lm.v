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
module ct_lsu_lm(
  biu_lsu_r_id,
  biu_lsu_r_resp,
  biu_lsu_r_vld,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ld_ag_dc_access_size,
  ld_ag_lm_init_vld,
  ld_ag_lr_inst,
  ld_ag_pa,
  ld_da_idx,
  ld_da_lm_discard_grnt,
  ld_da_lm_ecc_err,
  ld_da_lm_no_req,
  ld_da_lm_vector_nop,
  lm_addr_pa,
  lm_already_snoop,
  lm_ld_da_hit_idx,
  lm_lfb_depd_wakeup,
  lm_page_buf,
  lm_page_ca,
  lm_page_sec,
  lm_page_share,
  lm_page_so,
  lm_pfu_biu_req_hit_idx,
  lm_snq_stall,
  lm_sq_sc_fail,
  lm_st_da_hit_idx,
  lm_state_is_amo_lock,
  lm_state_is_ex_wait_lock,
  lm_state_is_idle,
  lsu_had_lm_state,
  mmu_lsu_buf0,
  mmu_lsu_ca0,
  mmu_lsu_sec0,
  mmu_lsu_sh0,
  mmu_lsu_so0,
  pad_yy_icg_scan_en,
  pfu_biu_req_addr,
  rb_lm_ar_id,
  rb_lm_atomic_next_resp,
  rb_lm_wait_resp_dp_vld,
  rb_lm_wait_resp_vld,
  rtu_lsu_async_flush,
  rtu_lsu_eret_flush,
  rtu_lsu_expt_flush,
  rtu_yy_xx_flush,
  snq_create_addr,
  snq_lm_dcache_addr_tto6,
  snq_lm_dcache_req_for_inv,
  st_da_addr,
  vb_invalid_vld,
  victim_addr,
  wmb_ce_addr,
  wmb_ce_inst_size,
  wmb_lm_state_clr
);

// &Ports; @25
input   [4 :0]  biu_lsu_r_id;                    
input   [3 :0]  biu_lsu_r_resp;                  
input           biu_lsu_r_vld;                   
input           cp0_lsu_icg_en;                  
input           cp0_yy_clk_en;                   
input           cpurst_b;                        
input           forever_cpuclk;                  
input   [2 :0]  ld_ag_dc_access_size;            
input           ld_ag_lm_init_vld;               
input           ld_ag_lr_inst;                   
input   [39:0]  ld_ag_pa;                        
input   [7 :0]  ld_da_idx;                       
input           ld_da_lm_discard_grnt;           
input           ld_da_lm_ecc_err;                
input           ld_da_lm_no_req;                 
input           ld_da_lm_vector_nop;             
input           mmu_lsu_buf0;                    
input           mmu_lsu_ca0;                     
input           mmu_lsu_sec0;                    
input           mmu_lsu_sh0;                     
input           mmu_lsu_so0;                     
input           pad_yy_icg_scan_en;              
input   [39:0]  pfu_biu_req_addr;                
input   [4 :0]  rb_lm_ar_id;                     
input           rb_lm_atomic_next_resp;          
input           rb_lm_wait_resp_dp_vld;          
input           rb_lm_wait_resp_vld;             
input           rtu_lsu_async_flush;             
input           rtu_lsu_eret_flush;              
input           rtu_lsu_expt_flush;              
input           rtu_yy_xx_flush;                 
input   [39:0]  snq_create_addr;                 
input   [33:0]  snq_lm_dcache_addr_tto6;         
input           snq_lm_dcache_req_for_inv;       
input   [39:0]  st_da_addr;                      
input           vb_invalid_vld;                  
input   [33:0]  victim_addr;                     
input   [39:0]  wmb_ce_addr;                     
input   [2 :0]  wmb_ce_inst_size;                
input           wmb_lm_state_clr;                
output  [27:0]  lm_addr_pa;                      
output          lm_already_snoop;                
output          lm_ld_da_hit_idx;                
output          lm_lfb_depd_wakeup;              
output          lm_page_buf;                     
output          lm_page_ca;                      
output          lm_page_sec;                     
output          lm_page_share;                   
output          lm_page_so;                      
output          lm_pfu_biu_req_hit_idx;          
output          lm_snq_stall;                    
output          lm_sq_sc_fail;                   
output          lm_st_da_hit_idx;                
output          lm_state_is_amo_lock;            
output          lm_state_is_ex_wait_lock;        
output          lm_state_is_idle;                
output  [2 :0]  lsu_had_lm_state;                

// &Regs; @26
reg     [39:0]  lm_addr;                         
reg             lm_already_evict;                
reg             lm_already_snoop;                
reg             lm_amo_unlock_ff;                
reg     [4 :0]  lm_ar_id;                        
reg             lm_depd;                         
reg             lm_ex;                           
reg     [2 :0]  lm_inst_size;                    
reg     [2 :0]  lm_next_state;                   
reg             lm_page_buf;                     
reg             lm_page_ca;                      
reg             lm_page_sec;                     
reg             lm_page_share;                   
reg             lm_page_so;                      
reg     [2 :0]  lm_state;                        

// &Wires; @27
wire    [4 :0]  biu_lsu_r_id;                    
wire    [3 :0]  biu_lsu_r_resp;                  
wire            biu_lsu_r_vld;                   
wire            cp0_lsu_icg_en;                  
wire            cp0_yy_clk_en;                   
wire            cpurst_b;                        
wire            forever_cpuclk;                  
wire    [2 :0]  ld_ag_dc_access_size;            
wire            ld_ag_lm_init_vld;               
wire            ld_ag_lr_inst;                   
wire    [39:0]  ld_ag_pa;                        
wire    [7 :0]  ld_da_idx;                       
wire            ld_da_lm_discard_grnt;           
wire            ld_da_lm_ecc_err;                
wire            ld_da_lm_no_req;                 
wire            ld_da_lm_vector_nop;             
wire    [27:0]  lm_addr_pa;                      
wire            lm_already_evict_set;            
wire            lm_already_snoop_set;            
wire            lm_clk;                          
wire            lm_clk_en;                       
wire            lm_clr_vld;                      
wire    [39:0]  lm_cmp_pfu_biu_req_addr;         
wire    [39:0]  lm_cmp_snq_create_addr;          
wire    [39:0]  lm_cmp_st_da_addr;               
wire            lm_evict_cancel;                 
wire            lm_hit_snq_dcache_addr;          
wire            lm_init_clk;                     
wire            lm_init_clk_en;                  
wire            lm_ld_da_hit_idx;                
wire            lm_lfb_depd_wakeup;              
wire            lm_pfu_biu_req_hit_idx;          
wire            lm_r_id_hit;                     
wire            lm_r_id_hit_resp_err;            
wire            lm_r_id_hit_resp_success;        
wire            lm_r_resp_err;                   
wire            lm_snq_stall;                    
wire            lm_sq_sc_fail;                   
wire            lm_st_da_hit_idx;                
wire            lm_state_is_amo_lock;            
wire            lm_state_is_ex_wait_lock;        
wire            lm_state_is_idle;                
wire            lm_state_is_mnt_snq;             
wire    [2 :0]  lsu_had_lm_state;                
wire            mmu_lsu_buf0;                    
wire            mmu_lsu_ca0;                     
wire            mmu_lsu_sec0;                    
wire            mmu_lsu_sh0;                     
wire            mmu_lsu_so0;                     
wire            pad_yy_icg_scan_en;              
wire    [39:0]  pfu_biu_req_addr;                
wire    [4 :0]  rb_lm_ar_id;                     
wire            rb_lm_atomic_next_resp;          
wire            rb_lm_wait_resp_dp_vld;          
wire            rb_lm_wait_resp_vld;             
wire            rtu_lsu_async_flush;             
wire            rtu_lsu_eret_flush;              
wire            rtu_lsu_expt_flush;              
wire            rtu_yy_xx_flush;                 
wire    [39:0]  snq_create_addr;                 
wire    [33:0]  snq_lm_dcache_addr_tto6;         
wire            snq_lm_dcache_req_for_inv;       
wire            snq_req_dcache_same_addr_for_inv; 
wire    [39:0]  st_da_addr;                      
wire            vb_invalid_vld;                  
wire    [33:0]  victim_addr;                     
wire    [39:0]  wmb_ce_addr;                     
wire    [2 :0]  wmb_ce_inst_size;                
wire            wmb_lm_state_clr;                


parameter OKAY          = 2'b00,
          EXOKAY        = 2'b01,
          SLVERR        = 2'b10,
          DECERR        = 2'b11;
parameter IDLE          = 3'b000,
          WAIT_REQ      = 3'b100,
          WAIT_RESP     = 3'b101,
          EX_WAIT_LOCK  = 3'b110,
          AMO_LOCK      = 3'b111;

//==========================================================
//                 Instance of Gated Cell
//==========================================================
assign lm_clk_en  = !lm_state_is_idle
                    ||  ld_ag_lm_init_vld
                    ||  rb_lm_wait_resp_dp_vld
                    ||  lm_amo_unlock_ff;
// &Instance("gated_clk_cell", "x_lsu_lm_gated_clk"); @46
gated_clk_cell  x_lsu_lm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lm_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lm_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @47
//          .external_en   (1'b0               ), @48
//          .global_en     (1'b1               ), @49
//          .module_en     (cp0_lsu_icg_en     ), @50
//          .local_en      (lm_clk_en          ), @51
//          .clk_out       (lm_clk             )); @52

assign lm_init_clk_en = ld_ag_lm_init_vld;
// &Instance("gated_clk_cell", "x_lsu_lm_init_gated_clk"); @55
gated_clk_cell  x_lsu_lm_init_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lm_init_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lm_init_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @56
//          .external_en   (1'b0               ), @57
//          .global_en     (cp0_yy_clk_en      ), @58
//          .module_en     (cp0_lsu_icg_en     ), @59
//          .local_en      (lm_init_clk_en   ), @60
//          .clk_out       (lm_init_clk      )); @61

//==========================================================
//                      Registers
//==========================================================
//+-------+
//| state |
//+-------+
always @(posedge lm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lm_state[2:0] <=  3'b0;
  else if(lm_clr_vld)
    lm_state[2:0] <=  IDLE;
  else
    lm_state[2:0] <=  lm_next_state[2:0];
end

//+------+----+
//| addr | ex |
//+------+----+
always @(posedge lm_init_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    lm_addr[`PA_WIDTH-1:0]  <=  {`PA_WIDTH{1'b0}};
    lm_inst_size[2:0]       <=  3'b0;
    lm_ex                   <=  1'b0;
    lm_page_ca              <=  1'b0;
    lm_page_so              <=  1'b0;
    lm_page_buf             <=  1'b0;
    lm_page_sec             <=  1'b0;
    lm_page_share           <=  1'b0;
  end
  else if(ld_ag_lm_init_vld)
  begin
    lm_addr[`PA_WIDTH-1:0]  <=  ld_ag_pa[`PA_WIDTH-1:0];
    lm_inst_size[2:0]       <=  ld_ag_dc_access_size[2:0];
    lm_ex                   <=  ld_ag_lr_inst;
    lm_page_ca              <=  mmu_lsu_ca0;
    lm_page_so              <=  mmu_lsu_so0;
    lm_page_buf             <=  mmu_lsu_buf0;
    lm_page_sec             <=  mmu_lsu_sec0;
    lm_page_share           <=  mmu_lsu_sh0;
  end
end

//+------+
//| depd |
//+------+
always @(posedge lm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lm_depd       <=  1'b0;
  else if(ld_ag_lm_init_vld)
    lm_depd       <=  1'b0;
  else if(ld_da_lm_discard_grnt)
    lm_depd       <=  1'b1;
end

//+---------------+
//| amo_unlock_ff |
//+---------------+
always @(posedge lm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lm_amo_unlock_ff    <=  1'b0;
  else if(lm_state_is_amo_lock  &&  wmb_lm_state_clr)
    lm_amo_unlock_ff    <=  1'b1;
  else
    lm_amo_unlock_ff    <=  1'b0;
end

//+-------+
//| ar_id |
//+-------+
always @(posedge lm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lm_ar_id[4:0]       <=  5'b0;
  else if(rb_lm_wait_resp_dp_vld)
    lm_ar_id[4:0]       <=  rb_lm_ar_id[4:0];
end

//+---------------+
//| already_snoop |
//+---------------+
// &Force("output","lm_already_snoop"); @148
always @(posedge lm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lm_already_snoop    <=  1'b0;
  else if(ld_ag_lm_init_vld)
    lm_already_snoop    <=  1'b0;
  else if(lm_already_snoop_set)
    lm_already_snoop    <=  1'b1;
end

//+---------------+
//| already_evict |
//+---------------+
always @(posedge lm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lm_already_evict    <=  1'b0;
  else if(ld_ag_lm_init_vld)
    lm_already_evict    <=  1'b0;
  else if(lm_already_evict_set)
    lm_already_evict    <=  1'b1;
end
//==========================================================
//                    Clear le signal
//==========================================================
assign lm_clr_vld = rtu_yy_xx_flush
                        &&  (rtu_lsu_expt_flush
                            ||  rtu_lsu_eret_flush)
                    ||  rtu_lsu_async_flush
                    ||  ld_da_lm_ecc_err;

//==========================================================
//                 Generate next state
//==========================================================
// &CombBeg; @183
always @( lm_ex
       or lm_already_evict
       or lm_state[2:0]
       or snq_req_dcache_same_addr_for_inv
       or wmb_lm_state_clr
       or lm_r_id_hit_resp_err
       or lm_r_id_hit_resp_success
       or ld_da_lm_no_req
       or lm_evict_cancel
       or lm_already_snoop
       or ld_ag_lm_init_vld
       or rb_lm_wait_resp_vld
       or ld_da_lm_vector_nop)
begin
case(lm_state[2:0])
  IDLE:
    if(ld_ag_lm_init_vld)
      lm_next_state[2:0]  = WAIT_REQ;
    else
      lm_next_state[2:0]  = IDLE;
  WAIT_REQ:
    if(ld_da_lm_no_req
      &&  (lm_already_snoop || snq_req_dcache_same_addr_for_inv || lm_already_evict || lm_evict_cancel) || ld_da_lm_vector_nop)
      lm_next_state[2:0]  = IDLE;
    else if(ld_da_lm_no_req)
      lm_next_state[2:0]  = EX_WAIT_LOCK;
    else if(rb_lm_wait_resp_vld)
      lm_next_state[2:0]  = WAIT_RESP;
    else
      lm_next_state[2:0]  = WAIT_REQ;
  WAIT_RESP:
    if(lm_r_id_hit_resp_err)
      lm_next_state[2:0]  = IDLE;
    else if(lm_r_id_hit_resp_success  &&  lm_ex)
      lm_next_state[2:0]  = EX_WAIT_LOCK;
    else if(lm_r_id_hit_resp_success  &&  !lm_ex)
      lm_next_state[2:0]  = AMO_LOCK;
    else
      lm_next_state[2:0]  = WAIT_RESP;
  EX_WAIT_LOCK:
    if(ld_ag_lm_init_vld)
      lm_next_state[2:0]  = WAIT_REQ;
    else if(snq_req_dcache_same_addr_for_inv  ||  wmb_lm_state_clr || lm_evict_cancel)
      lm_next_state[2:0]  = IDLE;
    else
      lm_next_state[2:0]  = EX_WAIT_LOCK;
  AMO_LOCK:
    if(wmb_lm_state_clr)
      lm_next_state[2:0]  = IDLE;
    else
      lm_next_state[2:0]  = AMO_LOCK;
  default:lm_next_state[2:0]  = IDLE;
endcase
// &CombEnd; @223
end
// &Force("output","lm_state_is_idle"); @224
// &Force("output","lm_state_is_amo_lock"); @225
assign lm_state_is_idle     = !lm_state[2];
assign lm_state_is_mnt_snq  = (lm_state[2:0]  ==  WAIT_REQ)
                              ||  (lm_state[2:0]  ==  WAIT_RESP);
assign lm_state_is_amo_lock = lm_state[2:0] ==  AMO_LOCK;
// &Force("output","lm_state_is_ex_wait_lock"); @230
assign lm_state_is_ex_wait_lock = lm_state[2:0] ==  EX_WAIT_LOCK;

//==========================================================
//                    State: wait req
//==========================================================
assign lm_hit_snq_dcache_addr = lm_addr[`PA_WIDTH-1:6]
                                ==  snq_lm_dcache_addr_tto6[`PA_WIDTH-7:0];

assign snq_req_dcache_same_addr_for_inv = snq_lm_dcache_req_for_inv
                                          &&  lm_hit_snq_dcache_addr;

assign lm_already_snoop_set     = lm_state_is_mnt_snq
                                  &&  snq_req_dcache_same_addr_for_inv;
assign lm_already_evict_set     = (lm_state[2:0]  ==  WAIT_REQ)
                                  &&  lm_evict_cancel;
//==========================================================
//                    State: wait resp
//==========================================================
assign lm_r_id_hit              = biu_lsu_r_vld
                                  &&  (lm_ar_id[4:0]  ==  biu_lsu_r_id[4:0])
                                  &&  rb_lm_atomic_next_resp;
// &Force("bus","biu_lsu_r_resp",3,0); @252
//ecc err(DECERR) will not carry bus err expt
assign lm_r_resp_err            = (biu_lsu_r_resp[1:0]  ==  SLVERR);
assign lm_r_id_hit_resp_success = lm_r_id_hit
                                  &&  !lm_r_resp_err;
assign lm_r_id_hit_resp_err     = lm_r_id_hit
                                  &&  lm_r_resp_err;

//==========================================================
//                    State: ex wait lock
//==========================================================
assign lm_sq_sc_fail      = !lm_state_is_ex_wait_lock
                            ||  (lm_addr[`PA_WIDTH-1:0]
                                !=  wmb_ce_addr[`PA_WIDTH-1:0])
                            ||  (lm_inst_size[2:0]
                                !=  wmb_ce_inst_size[2:0]);

assign lm_evict_cancel = vb_invalid_vld
                         &&  (lm_addr[`PA_WIDTH-1:6]  ==  victim_addr[`PA_WIDTH-7:0]); 
//==========================================================
//                    State: amo lock
//==========================================================
//----------------------hit idx-----------------------------
//-----------------------ld_da------------------------------
assign lm_ld_da_hit_idx   = lm_state_is_amo_lock
                            &&  (lm_addr[13:6]  ==  ld_da_idx[7:0]);
//-----------------------st_da------------------------------
assign lm_cmp_st_da_addr[`PA_WIDTH-1:0]  = st_da_addr[`PA_WIDTH-1:0];
assign lm_st_da_hit_idx   = lm_state_is_amo_lock
                            &&  (lm_addr[13:6]
                                ==  lm_cmp_st_da_addr[13:6]);
//------------------------snq-------------------------------
assign lm_cmp_snq_create_addr[`PA_WIDTH-1:0]  = snq_create_addr[`PA_WIDTH-1:0];
assign lm_snq_stall        = lm_state_is_amo_lock
                             &&  (lm_addr[13:6]
                                 ==  lm_cmp_snq_create_addr[13:6]);
//------------------------pfu-------------------------------
assign lm_cmp_pfu_biu_req_addr[`PA_WIDTH-1:0] = pfu_biu_req_addr[`PA_WIDTH-1:0];
assign lm_pfu_biu_req_hit_idx = lm_state_is_amo_lock
                                &&  (lm_addr[13:6]
                                    ==  lm_cmp_pfu_biu_req_addr[13:6]);

//==========================================================
//                        Pop depd
//==========================================================
assign lm_lfb_depd_wakeup = lm_amo_unlock_ff
                            &&  lm_depd;
//==========================================================
//                        for stamo ag info
//==========================================================
assign lm_addr_pa[`PA_WIDTH-13:0] = lm_addr[`PA_WIDTH-1:12];
//==========================================================
//                Interface to other module
//==========================================================
assign lsu_had_lm_state[2:0]  = lm_state[2:0];

// &ModuleEnd; @308
endmodule


