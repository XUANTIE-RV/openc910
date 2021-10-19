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
module ct_lsu_icc(
  cp0_lsu_dcache_clr,
  cp0_lsu_dcache_inv,
  cp0_lsu_dcache_read_index,
  cp0_lsu_dcache_read_ld_tag,
  cp0_lsu_dcache_read_req,
  cp0_lsu_dcache_read_st_tag,
  cp0_lsu_dcache_read_way,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dcache_arb_icc_ld_grnt,
  forever_cpuclk,
  icc_dcache_arb_data_way,
  icc_dcache_arb_ld_borrow_req,
  icc_dcache_arb_ld_data_gateclk_en,
  icc_dcache_arb_ld_data_high_idx,
  icc_dcache_arb_ld_data_low_idx,
  icc_dcache_arb_ld_data_req,
  icc_dcache_arb_ld_req,
  icc_dcache_arb_ld_tag_gateclk_en,
  icc_dcache_arb_ld_tag_idx,
  icc_dcache_arb_ld_tag_read,
  icc_dcache_arb_ld_tag_req,
  icc_dcache_arb_st_borrow_req,
  icc_dcache_arb_st_dirty_din,
  icc_dcache_arb_st_dirty_gateclk_en,
  icc_dcache_arb_st_dirty_gwen,
  icc_dcache_arb_st_dirty_idx,
  icc_dcache_arb_st_dirty_req,
  icc_dcache_arb_st_dirty_wen,
  icc_dcache_arb_st_req,
  icc_dcache_arb_st_tag_gateclk_en,
  icc_dcache_arb_st_tag_idx,
  icc_dcache_arb_st_tag_req,
  icc_dcache_arb_way,
  icc_idle,
  icc_snq_create_permit,
  icc_sq_grnt,
  icc_vb_addr_tto6,
  icc_vb_create_dp_vld,
  icc_vb_create_gateclk_en,
  icc_vb_create_req,
  icc_vb_create_vld,
  icc_vb_inv,
  icc_wmb_write_imme,
  ld_da_icc_read_data,
  ld_da_snq_borrow_icc,
  lfb_empty,
  lsu_cp0_dcache_done,
  lsu_cp0_dcache_read_data,
  lsu_cp0_dcache_read_data_vld,
  lsu_had_icc_state,
  pad_yy_icg_scan_en,
  pfu_icc_ready,
  rb_empty,
  snq_empty,
  sq_empty,
  sq_icc_clr,
  sq_icc_inv,
  sq_icc_req,
  st_da_borrow_icc_vld,
  st_da_icc_dirty_info,
  st_da_icc_tag_info,
  vb_empty,
  vb_icc_create_grnt,
  wmb_empty
);

// &Ports; @25
input            cp0_lsu_dcache_clr;                
input            cp0_lsu_dcache_inv;                
input   [16 :0]  cp0_lsu_dcache_read_index;         
input            cp0_lsu_dcache_read_ld_tag;        
input            cp0_lsu_dcache_read_req;           
input            cp0_lsu_dcache_read_st_tag;        
input            cp0_lsu_dcache_read_way;           
input            cp0_lsu_icg_en;                    
input            cp0_yy_clk_en;                     
input            cpurst_b;                          
input            dcache_arb_icc_ld_grnt;            
input            forever_cpuclk;                    
input   [127:0]  ld_da_icc_read_data;               
input            ld_da_snq_borrow_icc;              
input            lfb_empty;                         
input            pad_yy_icg_scan_en;                
input            pfu_icc_ready;                     
input            rb_empty;                          
input            snq_empty;                         
input            sq_empty;                          
input            sq_icc_clr;                        
input            sq_icc_inv;                        
input            sq_icc_req;                        
input            st_da_borrow_icc_vld;              
input   [2  :0]  st_da_icc_dirty_info;              
input   [25 :0]  st_da_icc_tag_info;                
input            vb_empty;                          
input            vb_icc_create_grnt;                
input            wmb_empty;                         
output           icc_dcache_arb_data_way;           
output           icc_dcache_arb_ld_borrow_req;      
output  [7  :0]  icc_dcache_arb_ld_data_gateclk_en; 
output  [10 :0]  icc_dcache_arb_ld_data_high_idx;   
output  [10 :0]  icc_dcache_arb_ld_data_low_idx;    
output  [7  :0]  icc_dcache_arb_ld_data_req;        
output           icc_dcache_arb_ld_req;             
output           icc_dcache_arb_ld_tag_gateclk_en;  
output  [8  :0]  icc_dcache_arb_ld_tag_idx;         
output           icc_dcache_arb_ld_tag_read;        
output           icc_dcache_arb_ld_tag_req;         
output           icc_dcache_arb_st_borrow_req;      
output  [6  :0]  icc_dcache_arb_st_dirty_din;       
output           icc_dcache_arb_st_dirty_gateclk_en; 
output           icc_dcache_arb_st_dirty_gwen;      
output  [8  :0]  icc_dcache_arb_st_dirty_idx;       
output           icc_dcache_arb_st_dirty_req;       
output  [6  :0]  icc_dcache_arb_st_dirty_wen;       
output           icc_dcache_arb_st_req;             
output           icc_dcache_arb_st_tag_gateclk_en;  
output  [8  :0]  icc_dcache_arb_st_tag_idx;         
output           icc_dcache_arb_st_tag_req;         
output           icc_dcache_arb_way;                
output           icc_idle;                          
output           icc_snq_create_permit;             
output           icc_sq_grnt;                       
output  [33 :0]  icc_vb_addr_tto6;                  
output           icc_vb_create_dp_vld;              
output           icc_vb_create_gateclk_en;          
output           icc_vb_create_req;                 
output           icc_vb_create_vld;                 
output           icc_vb_inv;                        
output           icc_wmb_write_imme;                
output           lsu_cp0_dcache_done;               
output  [127:0]  lsu_cp0_dcache_read_data;          
output           lsu_cp0_dcache_read_data_vld;      
output  [2  :0]  lsu_had_icc_state;                 

// &Regs; @26
reg              icc_clr;                           
reg     [8  :0]  icc_cnt;                           
reg              icc_cp0_create;                    
reg              icc_inv;                           
reg     [2  :0]  icc_next_state;                    
reg     [2  :0]  icc_state;                         

// &Wires; @27
wire             cp0_lsu_dcache_clr;                
wire             cp0_lsu_dcache_inv;                
wire    [16 :0]  cp0_lsu_dcache_read_index;         
wire             cp0_lsu_dcache_read_ld_tag;        
wire             cp0_lsu_dcache_read_req;           
wire             cp0_lsu_dcache_read_st_tag;        
wire             cp0_lsu_dcache_read_way;           
wire             cp0_lsu_icg_en;                    
wire             cp0_yy_clk_en;                     
wire             cpurst_b;                          
wire             dcache_arb_icc_ld_grnt;            
wire             dcache_read_data_req;              
wire             dcache_read_data_vld;              
wire             dcache_read_ld_tag_req;            
wire             dcache_read_st_tag_req;            
wire             dcache_read_tag_req;               
wire             forever_cpuclk;                    
wire             icc_clk;                           
wire             icc_clk_en;                        
wire    [9  :0]  icc_cnt_add1;                      
wire             icc_cnt_add_vld;                   
wire             icc_cnt_overflow;                  
wire             icc_dcache_arb_data_way;           
wire             icc_dcache_arb_ld_borrow_req;      
wire    [7  :0]  icc_dcache_arb_ld_data_gateclk_en; 
wire    [10 :0]  icc_dcache_arb_ld_data_high_idx;   
wire    [10 :0]  icc_dcache_arb_ld_data_low_idx;    
wire    [7  :0]  icc_dcache_arb_ld_data_req;        
wire             icc_dcache_arb_ld_req;             
wire             icc_dcache_arb_ld_tag_gateclk_en;  
wire    [8  :0]  icc_dcache_arb_ld_tag_idx;         
wire             icc_dcache_arb_ld_tag_read;        
wire             icc_dcache_arb_ld_tag_req;         
wire             icc_dcache_arb_st_borrow_req;      
wire    [6  :0]  icc_dcache_arb_st_dirty_din;       
wire             icc_dcache_arb_st_dirty_gateclk_en; 
wire             icc_dcache_arb_st_dirty_gwen;      
wire    [8  :0]  icc_dcache_arb_st_dirty_idx;       
wire             icc_dcache_arb_st_dirty_req;       
wire    [6  :0]  icc_dcache_arb_st_dirty_wen;       
wire             icc_dcache_arb_st_req;             
wire             icc_dcache_arb_st_tag_gateclk_en;  
wire    [8  :0]  icc_dcache_arb_st_tag_idx;         
wire             icc_dcache_arb_st_tag_req;         
wire             icc_dcache_arb_way;                
wire             icc_done;                          
wire             icc_idle;                          
wire             icc_ready;                         
wire             icc_ready_expt_snq;                
wire             icc_set_clr;                       
wire             icc_set_inv;                       
wire             icc_snq_create_permit;             
wire             icc_sq_grnt;                       
wire             icc_start;                         
wire    [33 :0]  icc_vb_addr_tto6;                  
wire             icc_vb_create_dp_vld;              
wire             icc_vb_create_gateclk_en;          
wire             icc_vb_create_req;                 
wire             icc_vb_create_vld;                 
wire             icc_vb_inv;                        
wire             icc_vb_way;                        
wire             icc_wmb_write_imme;                
wire    [127:0]  ld_da_icc_read_data;               
wire             ld_da_snq_borrow_icc;              
wire             lfb_empty;                         
wire             lsu_cp0_dcache_done;               
wire    [127:0]  lsu_cp0_dcache_read_data;          
wire             lsu_cp0_dcache_read_data_vld;      
wire    [2  :0]  lsu_had_icc_state;                 
wire             pad_yy_icg_scan_en;                
wire             pfu_icc_ready;                     
wire             rb_empty;                          
wire             snq_empty;                         
wire             sq_empty;                          
wire             sq_icc_clr;                        
wire             sq_icc_inv;                        
wire             sq_icc_req;                        
wire             st_da_borrow_icc_vld;              
wire    [2  :0]  st_da_icc_dirty_info;              
wire    [127:0]  st_da_icc_read_data;               
wire    [25 :0]  st_da_icc_tag_info;                
wire             vb_empty;                          
wire             vb_icc_create_grnt;                
wire             wmb_empty;                         



parameter IDLE            = 3'b000,
          WAIT_FOR_READY  = 3'b001,
          INV_DCACHE_LINE = 3'b010,
          REQ_VB_WAY0     = 3'b100,
          REQ_VB_WAY1     = 3'b101,
          WAIT_VB_EMPTY   = 3'b110,
          READ_DCACHE     = 3'b011,
          WAIT_DATA       = 3'b111;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//icc pop clk is for addr and bytes_vld when sq pops a entry
assign icc_clk_en = sq_icc_req
                    ||  cp0_lsu_dcache_inv
                    ||  cp0_lsu_dcache_clr
                    ||  cp0_lsu_dcache_read_req
                    ||  !icc_idle;
// &Instance("gated_clk_cell", "x_lsu_icc_gated_clk"); @48
gated_clk_cell  x_lsu_icc_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icc_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (icc_clk_en        ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @49
//          .external_en   (1'b0               ), @50
//          .global_en     (cp0_yy_clk_en      ), @51
//          .module_en     (cp0_lsu_icg_en     ), @52
//          .local_en      (icc_clk_en         ), @53
//          .clk_out       (icc_clk            )); @54

//==========================================================
//                      Registers
//==========================================================
//+-------+
//| state |
//+-------+
always @(posedge icc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    icc_state[2:0]        <=  IDLE;
  else
    icc_state[2:0]        <=  icc_next_state[2:0];
end

//+-----+-----+
//| clr | inv |
//+-----+-----+
always @(posedge icc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    icc_clr               <=  1'b0;
  else if(icc_set_clr)
    icc_clr               <=  1'b1;
  else if(icc_done)
    icc_clr               <=  1'b0;
end

always @(posedge icc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    icc_inv               <=  1'b0;
  else if(icc_set_inv)
    icc_inv               <=  1'b1;
  else if(icc_done)
    icc_inv               <=  1'b0;
end

//+-----+
//| cnt |
//+-----+
always @(posedge icc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    icc_cnt[8:0]         <=  9'b0;
  else if(icc_start)
    icc_cnt[8:0]         <=  9'b0;
  else if(icc_cnt_add_vld)
    icc_cnt[8:0]         <=  icc_cnt_add1[8:0];
end

//+------------+
//| cp0_create |
//+------------+
always @(posedge icc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    icc_cp0_create       <=  1'b0;
  else if(icc_idle &&  sq_icc_req)
    icc_cp0_create       <=  1'b0;
  else if(icc_idle &&  (cp0_lsu_dcache_clr ||  cp0_lsu_dcache_inv))
    icc_cp0_create       <=  1'b1;
end

//==========================================================
//                 Generate next state
//==========================================================
// &CombBeg; @122
always @( icc_clr
       or icc_cnt_overflow
       or icc_start
       or icc_state[2:0]
       or icc_ready
       or dcache_read_data_vld
       or vb_empty
       or vb_icc_create_grnt
       or dcache_arb_icc_ld_grnt
       or icc_inv)
begin
icc_next_state[2:0] = IDLE;
case(icc_state[2:0])
  IDLE:
    if(icc_start)
      icc_next_state[2:0] = WAIT_FOR_READY;
    else
      icc_next_state[2:0] = IDLE;
  WAIT_FOR_READY:
    if(icc_ready &&  icc_clr)
      icc_next_state[2:0] = REQ_VB_WAY0;
    else if(icc_ready && icc_inv)
      icc_next_state[2:0] = INV_DCACHE_LINE;
    else if(icc_ready)
      icc_next_state[2:0] = READ_DCACHE;
    else
      icc_next_state[2:0] = WAIT_FOR_READY;
  INV_DCACHE_LINE:
    if(dcache_arb_icc_ld_grnt &&  icc_cnt_overflow)
      icc_next_state[2:0] = WAIT_VB_EMPTY;
    else
      icc_next_state[2:0] = INV_DCACHE_LINE;
  REQ_VB_WAY0:
    if(vb_icc_create_grnt)
      icc_next_state[2:0] = REQ_VB_WAY1;
    else
      icc_next_state[2:0] = REQ_VB_WAY0;
  REQ_VB_WAY1:
    if(vb_icc_create_grnt &&  icc_cnt_overflow)
      icc_next_state[2:0] = WAIT_VB_EMPTY;
    else if(vb_icc_create_grnt)
      icc_next_state[2:0] = REQ_VB_WAY0;
    else
      icc_next_state[2:0] = REQ_VB_WAY1;
  WAIT_VB_EMPTY:
    if(vb_empty)
      icc_next_state[2:0] = IDLE;
    else
      icc_next_state[2:0] = WAIT_VB_EMPTY;
  READ_DCACHE:
      icc_next_state[2:0] = WAIT_DATA;
  WAIT_DATA:
    if(dcache_read_data_vld)
      icc_next_state[2:0] = IDLE;
    else
      icc_next_state[2:0] = WAIT_DATA;
  default:icc_next_state[2:0] = IDLE;
endcase
// &CombEnd; @170
end

//==========================================================
//                  State 0 : idle
//==========================================================
// &Force("output","icc_idle"); @175
assign icc_idle     = icc_state[2:0]  ==  IDLE;
assign icc_sq_grnt  = icc_idle
                      &&  sq_icc_req;
assign icc_start    = icc_idle
                      &&  (sq_icc_req
                          ||  cp0_lsu_dcache_clr
                          ||  cp0_lsu_dcache_inv
                          ||  cp0_lsu_dcache_read_req);
assign icc_set_clr  = icc_idle
                      &&  (sq_icc_req &&  sq_icc_clr
                          ||  cp0_lsu_dcache_clr);

assign icc_set_inv  = icc_idle
                      &&  (sq_icc_req &&  sq_icc_inv
                          ||  cp0_lsu_dcache_inv);

//==========================================================
//                  State 1 : wait for ready
//==========================================================
//must wait for snq/wmb/icc/vb empty
//if cp0 start icc state machine, it must wait for sq empty
assign icc_ready_expt_snq   = wmb_empty
                              &&  rb_empty
                              &&  (sq_empty ||  !icc_cp0_create)
                              &&  lfb_empty
                              &&  vb_empty
                              &&  pfu_icc_ready;
assign icc_ready            = icc_ready_expt_snq
                              &&  snq_empty;
assign icc_wmb_write_imme   = icc_state[2:0] ==  WAIT_FOR_READY;

//==========================================================
//              State 2/3/4 : inv dcache line / req vb
//==========================================================
assign icc_cnt_add1[9:0]  = {1'b0,icc_cnt[8:0]}  + 10'b1;
assign icc_cnt_add_vld    = dcache_arb_icc_ld_grnt
                            ||  vb_icc_create_grnt
                                &&  (icc_state[2:0]  ==  REQ_VB_WAY1);

// &Force("nonport","icc_cnt_overflow"); @215
//csky vperl_off
`ifdef DCACHE_32K
  assign icc_cnt_overflow = icc_cnt_add1[8];
`endif//DCACHE_32K

`ifdef DCACHE_64K
  assign icc_cnt_overflow = icc_cnt_add1[9];
`endif//DCACHE_64K
//csky vperl_on

//==========================================================
//                  State 5 : wait vb empty
//==========================================================
assign icc_done = (icc_state[2:0]  ==  WAIT_VB_EMPTY)
                  &&  (icc_next_state[2:0]  ==  IDLE);

//==========================================================
//                      Interface
//==========================================================
//----------------------cache interface---------------------
assign dcache_read_data_req   = (icc_state[2:0]  == READ_DCACHE)
                                   && !cp0_lsu_dcache_read_ld_tag 
                                   && !cp0_lsu_dcache_read_st_tag; 
assign dcache_read_st_tag_req = (icc_state[2:0]  == READ_DCACHE)
                                   && cp0_lsu_dcache_read_st_tag; 
assign dcache_read_ld_tag_req = (icc_state[2:0]  == READ_DCACHE)
                                   && cp0_lsu_dcache_read_ld_tag;
assign dcache_read_tag_req    = dcache_read_ld_tag_req || dcache_read_st_tag_req; 
// &Force("output","icc_dcache_arb_ld_req"); @244
// &Force("output","icc_dcache_arb_st_req"); @245
assign icc_dcache_arb_ld_req  = (icc_state[2:0]  ==  INV_DCACHE_LINE)
                                || (icc_state[2:0]  == READ_DCACHE);
assign icc_dcache_arb_st_req  = (icc_state[2:0]  ==  INV_DCACHE_LINE)
                                || (icc_state[2:0]  == READ_DCACHE);
//---------------dirty array------------
// &Force("output","icc_dcache_arb_st_dirty_req"); @251
assign icc_dcache_arb_st_dirty_req      = (icc_state[2:0]  ==  INV_DCACHE_LINE)
                                          || dcache_read_st_tag_req;
assign icc_dcache_arb_st_dirty_gateclk_en = icc_dcache_arb_st_dirty_req;
assign icc_dcache_arb_st_dirty_idx[8:0] = dcache_read_tag_req
                                          ? cp0_lsu_dcache_read_index[14:6]
                                          : icc_cnt[8:0];
assign icc_dcache_arb_st_dirty_din[6:0]  = 7'b0;
assign icc_dcache_arb_st_dirty_gwen     = !dcache_read_tag_req;
assign icc_dcache_arb_st_dirty_wen[6:0] = dcache_read_tag_req
                                          ? 7'b0
                                          : 7'h7f;
//---------------tag array------------
// &Force("output","icc_dcache_arb_ld_tag_req"); @268
assign icc_dcache_arb_ld_tag_req        = (icc_state[2:0]  ==  INV_DCACHE_LINE)
                                          || dcache_read_ld_tag_req;
assign icc_dcache_arb_ld_tag_gateclk_en = icc_dcache_arb_ld_tag_req;
assign icc_dcache_arb_ld_tag_idx[8:0]   = dcache_read_tag_req
                                          ? cp0_lsu_dcache_read_index[14:6]
                                          : icc_cnt[8:0];
assign icc_dcache_arb_ld_tag_read       = dcache_read_ld_tag_req;
// &Force("output","icc_dcache_arb_st_tag_req"); @276
assign icc_dcache_arb_st_tag_req      = dcache_read_st_tag_req;
assign icc_dcache_arb_st_tag_idx[8:0] = cp0_lsu_dcache_read_index[14:6];
assign icc_dcache_arb_st_tag_gateclk_en = icc_dcache_arb_st_tag_req;
assign icc_dcache_arb_st_borrow_req   = dcache_read_st_tag_req;
assign icc_dcache_arb_way             = cp0_lsu_dcache_read_way;
//---------------data array------------
// &Force("bus","cp0_lsu_dcache_read_index",16,0); @294
assign icc_dcache_arb_ld_borrow_req          = dcache_read_data_req || dcache_read_ld_tag_req;
// &Force("output","icc_dcache_arb_ld_data_req"); @296
assign icc_dcache_arb_ld_data_req[7:0]       = {8{dcache_read_data_req}};
assign icc_dcache_arb_ld_data_gateclk_en[7:0]= icc_dcache_arb_ld_data_req[7:0];
assign icc_dcache_arb_ld_data_low_idx[10:0]  = cp0_lsu_dcache_read_index[14:4];
assign icc_dcache_arb_ld_data_high_idx[10:0] = {cp0_lsu_dcache_read_index[14:5]
                                                ,~cp0_lsu_dcache_read_index[4]};
// reuse borrow signal, this way actually means high region
assign icc_dcache_arb_data_way               = cp0_lsu_dcache_read_index[4] && !cp0_lsu_dcache_read_way
                                               || !cp0_lsu_dcache_read_index[4] && cp0_lsu_dcache_read_way;
//----------------------vb interface------------------------
assign icc_vb_way                 = icc_state[2:0]  ==  REQ_VB_WAY1;
// &Force("output","icc_vb_create_req"); @307
assign icc_vb_create_req          = (icc_state[2:0]  ==  REQ_VB_WAY0)
                                    ||  (icc_state[2:0]  ==  REQ_VB_WAY1);
assign icc_vb_create_vld          = icc_vb_create_req;
assign icc_vb_create_dp_vld       = icc_vb_create_req;
assign icc_vb_create_gateclk_en   = icc_vb_create_req;
assign icc_vb_addr_tto6[`PA_WIDTH-7:0] = {{`PA_WIDTH-32{1'b0}},icc_vb_way,16'b0,icc_cnt[8:0]};
assign icc_vb_inv                 = icc_inv;

//----------------------cp0 interface-----------------------
assign lsu_cp0_dcache_done  = icc_done
                              &&  icc_cp0_create;

assign dcache_read_data_vld            = ld_da_snq_borrow_icc
                                         || st_da_borrow_icc_vld;
assign lsu_cp0_dcache_read_data_vld    = dcache_read_data_vld;
assign lsu_cp0_dcache_read_data[127:0]  = ld_da_snq_borrow_icc
                                          ? ld_da_icc_read_data[127:0]
                                          : st_da_icc_read_data[127:0];
assign st_da_icc_read_data[127:0] = {88'b0,
                                     st_da_icc_tag_info[`PA_WIDTH-15:0],
                                     cp0_lsu_dcache_read_index[13:12],
                                     9'b0,
                                     st_da_icc_dirty_info[2:0]};
//----------------------cp0 interface-----------------------
assign icc_snq_create_permit  = (icc_state[2:0]  ==  IDLE)
                                ||  (icc_state[2:0]  ==  WAIT_FOR_READY)
                                    && !icc_ready_expt_snq;

//==========================================================
//              Interface to other module
//==========================================================
assign lsu_had_icc_state[2:0] = icc_state[2:0];


// &ModuleEnd; @354
endmodule


