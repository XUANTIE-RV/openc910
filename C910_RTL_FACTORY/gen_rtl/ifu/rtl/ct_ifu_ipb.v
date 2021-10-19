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
module ct_ifu_ipb(
  biu_ifu_rd_data,
  biu_ifu_rd_data_vld,
  biu_ifu_rd_grnt,
  biu_ifu_rd_id,
  biu_ifu_rd_last,
  biu_ifu_rd_resp,
  cp0_ifu_icache_pref_en,
  cp0_ifu_icg_en,
  cp0_ifu_insde,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  icache_if_ipb_tag_data0,
  icache_if_ipb_tag_data1,
  ifctrl_ipb_inv_on,
  ifu_biu_r_ready,
  ifu_biu_rd_addr,
  ifu_biu_rd_burst,
  ifu_biu_rd_cache,
  ifu_biu_rd_domain,
  ifu_biu_rd_id,
  ifu_biu_rd_len,
  ifu_biu_rd_prot,
  ifu_biu_rd_req,
  ifu_biu_rd_req_gate,
  ifu_biu_rd_size,
  ifu_biu_rd_snoop,
  ifu_biu_rd_user,
  ifu_no_op_req,
  ipb_debug_req_cur_st,
  ipb_debug_wb_cur_st,
  ipb_icache_if_index,
  ipb_icache_if_req,
  ipb_icache_if_req_for_gateclk,
  ipb_ifctrl_prefetch_idle,
  ipb_l1_refill_data_vld,
  ipb_l1_refill_grnt,
  ipb_l1_refill_rdata,
  ipb_l1_refill_trans_err,
  l1_refill_ipb_bufferable,
  l1_refill_ipb_cacheable,
  l1_refill_ipb_ctc_inv,
  l1_refill_ipb_machine_mode,
  l1_refill_ipb_ppc,
  l1_refill_ipb_pre_cancel,
  l1_refill_ipb_refill_on,
  l1_refill_ipb_req,
  l1_refill_ipb_req_for_gateclk,
  l1_refill_ipb_req_pre,
  l1_refill_ipb_secure,
  l1_refill_ipb_supv_mode,
  l1_refill_ipb_tsize,
  l1_refill_ipb_vpc,
  pad_yy_icg_scan_en,
  pcgen_ipb_chgflw
);

// &Ports; @23
input   [127:0]  biu_ifu_rd_data;              
input            biu_ifu_rd_data_vld;          
input            biu_ifu_rd_grnt;              
input            biu_ifu_rd_id;                
input            biu_ifu_rd_last;              
input   [1  :0]  biu_ifu_rd_resp;              
input            cp0_ifu_icache_pref_en;       
input            cp0_ifu_icg_en;               
input            cp0_ifu_insde;                
input            cp0_yy_clk_en;                
input            cpurst_b;                     
input            forever_cpuclk;               
input   [28 :0]  icache_if_ipb_tag_data0;      
input   [28 :0]  icache_if_ipb_tag_data1;      
input            ifctrl_ipb_inv_on;            
input            ifu_no_op_req;                
input            l1_refill_ipb_bufferable;     
input            l1_refill_ipb_cacheable;      
input            l1_refill_ipb_ctc_inv;        
input            l1_refill_ipb_machine_mode;   
input   [39 :0]  l1_refill_ipb_ppc;            
input            l1_refill_ipb_pre_cancel;     
input            l1_refill_ipb_refill_on;      
input            l1_refill_ipb_req;            
input            l1_refill_ipb_req_for_gateclk; 
input            l1_refill_ipb_req_pre;        
input            l1_refill_ipb_secure;         
input            l1_refill_ipb_supv_mode;      
input            l1_refill_ipb_tsize;          
input   [39 :0]  l1_refill_ipb_vpc;            
input            pad_yy_icg_scan_en;           
input            pcgen_ipb_chgflw;             
output           ifu_biu_r_ready;              
output  [39 :0]  ifu_biu_rd_addr;              
output  [1  :0]  ifu_biu_rd_burst;             
output  [3  :0]  ifu_biu_rd_cache;             
output  [1  :0]  ifu_biu_rd_domain;            
output           ifu_biu_rd_id;                
output  [1  :0]  ifu_biu_rd_len;               
output  [2  :0]  ifu_biu_rd_prot;              
output           ifu_biu_rd_req;               
output           ifu_biu_rd_req_gate;          
output  [2  :0]  ifu_biu_rd_size;              
output  [3  :0]  ifu_biu_rd_snoop;             
output  [1  :0]  ifu_biu_rd_user;              
output  [3  :0]  ipb_debug_req_cur_st;         
output  [2  :0]  ipb_debug_wb_cur_st;          
output  [33 :0]  ipb_icache_if_index;          
output           ipb_icache_if_req;            
output           ipb_icache_if_req_for_gateclk; 
output           ipb_ifctrl_prefetch_idle;     
output           ipb_l1_refill_data_vld;       
output           ipb_l1_refill_grnt;           
output  [127:0]  ipb_l1_refill_rdata;          
output           ipb_l1_refill_trans_err;      

// &Regs; @24
reg              icache_if_req;                
reg              icache_inv_record;            
reg     [28 :0]  icache_tag_data0_reg;         
reg     [28 :0]  icache_tag_data1_reg;         
reg     [33 :0]  ipb_icache_if_index;          
reg     [127:0]  pbuf_entry0;                  
reg     [127:0]  pbuf_entry1;                  
reg     [127:0]  pbuf_entry2;                  
reg     [127:0]  pbuf_entry3;                  
reg              pref_bufferable;              
reg              pref_cacheable;               
reg     [33 :0]  pref_line_addr;               
reg     [1  :0]  pref_line_offset;             
reg              pref_machine_mode;            
reg              pref_secure;                  
reg              pref_supv_mode;               
reg     [3  :0]  req_cur_st;                   
reg              req_gate;                     
reg     [3  :0]  req_nxt_st;                   
reg     [2  :0]  wb_cur_st;                    
reg     [2  :0]  wb_nxt_st;                    

// &Wires; @25
wire    [127:0]  biu_ifu_rd_data;              
wire             biu_ifu_rd_data_vld;          
wire             biu_ifu_rd_grnt;              
wire             biu_ifu_rd_id;                
wire             biu_ifu_rd_last;              
wire    [1  :0]  biu_ifu_rd_resp;              
wire             biu_pref_data_vld;            
wire             biu_pref_grnt;                
wire             biu_pref_last;                
wire             biu_pref_trans_err;           
wire             biu_ref_data_vld;             
wire             biu_ref_grnt;                 
wire             biu_ref_trans_err;            
wire             cp0_ifu_icache_pref_en;       
wire             cp0_ifu_icg_en;               
wire             cp0_ifu_insde;                
wire             cp0_yy_clk_en;                
wire             cpurst_b;                     
wire             forever_cpuclk;               
wire             icache_flop_clk;              
wire             icache_flop_clk_en;           
wire    [28 :0]  icache_if_ipb_tag_data0;      
wire    [28 :0]  icache_if_ipb_tag_data1;      
wire             icache_inv_for_pref;          
wire             ifctrl_ipb_inv_on;            
wire             ifu_biu_r_ready;              
wire    [39 :0]  ifu_biu_rd_addr;              
wire    [1  :0]  ifu_biu_rd_burst;             
wire    [3  :0]  ifu_biu_rd_cache;             
wire    [1  :0]  ifu_biu_rd_domain;            
wire             ifu_biu_rd_id;                
wire    [1  :0]  ifu_biu_rd_len;               
wire    [2  :0]  ifu_biu_rd_prot;              
wire             ifu_biu_rd_req;               
wire             ifu_biu_rd_req_gate;          
wire    [2  :0]  ifu_biu_rd_size;              
wire    [3  :0]  ifu_biu_rd_snoop;             
wire    [1  :0]  ifu_biu_rd_user;              
wire             ifu_no_op_req;                
wire             ipb_bufferable;               
wire             ipb_cacheable;                
wire    [3  :0]  ipb_debug_req_cur_st;         
wire    [2  :0]  ipb_debug_wb_cur_st;          
wire             ipb_hit;                      
wire             ipb_icache_data_clk;          
wire             ipb_icache_data_clk_en;       
wire    [33 :0]  ipb_icache_if_index_pre;      
wire             ipb_icache_if_req;            
wire             ipb_icache_if_req_for_gateclk; 
wire             ipb_icache_if_req_pre;        
wire             ipb_ifctrl_prefetch_idle;     
wire             ipb_l1_refill_data_vld;       
wire             ipb_l1_refill_grnt;           
wire    [127:0]  ipb_l1_refill_rdata;          
wire             ipb_l1_refill_trans_err;      
wire             ipb_machine_mode;             
wire             ipb_page_share;               
wire    [1  :0]  ipb_rd_domain;                
wire    [3  :0]  ipb_rd_snoop;                 
wire             ipb_secure;                   
wire             ipb_share_refill;             
wire             ipb_supv_mode;                
wire             ipb_tsize;                    
wire             ipb_way0_hit;                 
wire             ipb_way1_hit;                 
wire             l1_refill_ipb_bufferable;     
wire             l1_refill_ipb_cacheable;      
wire             l1_refill_ipb_ctc_inv;        
wire             l1_refill_ipb_machine_mode;   
wire    [39 :0]  l1_refill_ipb_ppc;            
wire             l1_refill_ipb_pre_cancel;     
wire             l1_refill_ipb_refill_on;      
wire             l1_refill_ipb_req;            
wire             l1_refill_ipb_req_for_gateclk; 
wire             l1_refill_ipb_req_pre;        
wire             l1_refill_ipb_secure;         
wire             l1_refill_ipb_supv_mode;      
wire             l1_refill_ipb_tsize;          
wire    [39 :0]  l1_refill_ipb_vpc;            
wire             pad_yy_icg_scan_en;           
wire             pbuf_entry0_clk;              
wire             pbuf_entry0_clk_en;           
wire             pbuf_entry1_clk;              
wire             pbuf_entry1_clk_en;           
wire             pbuf_entry2_clk;              
wire             pbuf_entry2_clk_en;           
wire             pbuf_entry3_clk;              
wire             pbuf_entry3_clk_en;           
wire             pbuf_wb_entry0_sel;           
wire             pbuf_wb_entry1_sel;           
wire             pbuf_wb_entry2_sel;           
wire             pbuf_wb_entry3_sel;           
wire    [127:0]  pbuf_wb_rdata;                
wire             pcgen_ipb_chgflw;             
wire             pf_req_for_gateclk;           
wire             pf_req_pre;                   
wire             pref_clk;                     
wire             pref_clk_en;                  
wire             pref_grnt_ref;                
wire             pref_hit_vld;                 
wire             pref_idle;                    
wire             pref_launch_clk;              
wire             pref_launch_clk_en;           
wire             pref_launch_start;            
wire             pref_launch_start_short;      
wire             pref_launch_vld;              
wire             pref_launch_vld_flop;         
wire             pref_launch_vld_for_gateclk;  
wire             pref_pbuf_wen0;               
wire             pref_pbuf_wen1;               
wire             pref_pbuf_wen2;               
wire             pref_pbuf_wen3;               
wire             pref_req_for_biu;             
wire             pref_tsize;                   
wire             pref_wb_from_pbuf;            
wire             pref_wb_index_inc;            
wire    [33 :0]  ref_addr_inc;                 
wire             ref_addr_within_4k;           
wire             ref_for_pref_on;              
wire             ref_hit_pref;                 
wire             ref_req_for_biu;              
wire             refill_req_pre;               
wire             req_clk;                      
wire             req_clk_en;                   
wire             req_sm_pref_cmplt;            
wire             rid_for_grnt;                 


parameter PC_WIDTH = 40;
// &Force("bus","l1_refill_ipb_ppc",39,0); @28
// &Force("bus","biu_ifu_rd_resp",1,0); @29
// &Force("bus","l1_refill_ipb_vpc",39,0); @30

parameter IDLE   = 4'b0000,
          CACHE  = 4'b0001,
          CMP    = 4'b0011,
          PF_REQ = 4'b0010,
          PF0    = 4'b0110,
          PF1    = 4'b0111,
          PF2    = 4'b0101,
          PF3    = 4'b0100,
          INV    = 4'b1000;

parameter PF_IDLE = 3'b000,
          PF_VLD  = 3'b001,  
          PF_GRNT = 3'b011,
          PF_WB0  = 3'b110,  
          PF_WB1  = 3'b111,
          PF_WB2  = 3'b101,
          PF_WB3  = 3'b100;

//==========================================================
//               Gate Clock of IFU ipb
//==========================================================
// &Instance("gated_clk_cell","x_pref_clk"); @53
gated_clk_cell  x_pref_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pref_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pref_clk_en       ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @54
//           .clk_out        (pref_clk),//Out Clock @55
//           .external_en    (1'b0), @56
//           .global_en      (cp0_yy_clk_en), @57
//           .local_en       (pref_clk_en),//Local Condition @58
//           .module_en      (cp0_ifu_icg_en) @59
//         ); @60
assign pref_clk_en = pref_launch_vld_for_gateclk || 
                     pref_launch_start_short     || 
                     ifu_biu_rd_req || 
                     (req_cur_st[3:0] != IDLE) || 
                     (wb_cur_st[2:0] != PF_IDLE) ||
                     icache_inv_record;

//---------------icache_inv_record_signal-------------------
always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    icache_inv_record <= 1'b0;
  else if(ifctrl_ipb_inv_on && !pref_idle)
    icache_inv_record <= 1'b1;
  else if(icache_inv_record && pref_idle)
    icache_inv_record <= 1'b0;
  else
    icache_inv_record <= icache_inv_record;
end

//==========================================================
//              The Prefetch Request SM
//==========================================================
//State Description:
//IDLE   : Wait for Prefetch launch 
//CACHE  : Wait one cycle and Wait for Data from Cache
//CMP    : Check whether icache has already contains the prefetch line
//PF_REQ : send the prefetch request to biu
//PF0    : Wait for data1
//PF1    : Wait for data2
//PF2    : Wait for data3
//PF3    : Wait for data4
//INV    : Invalid Data and Wait for data last

always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    req_cur_st[3:0] <= IDLE;
  else
    req_cur_st[3:0] <= req_nxt_st[3:0];
end

// &CombBeg; @103
always @( biu_pref_grnt
       or ref_hit_pref
       or req_cur_st[3:0]
       or pref_launch_start
       or ipb_hit
       or biu_pref_data_vld
       or biu_pref_last
       or biu_pref_trans_err
       or l1_refill_ipb_req)
begin
case(req_cur_st[3:0])
IDLE    : if(pref_launch_start)
            req_nxt_st[3:0] = CACHE;
          else
            req_nxt_st[3:0] = IDLE;
CACHE   :   req_nxt_st[3:0] = CMP;
CMP     : if(ipb_hit)
            req_nxt_st[3:0] = IDLE;
          else
            req_nxt_st[3:0] = PF_REQ;
PF_REQ  : if(biu_pref_grnt)
            req_nxt_st[3:0] = PF0;
          else if(l1_refill_ipb_req && !ref_hit_pref)
            req_nxt_st[3:0] = IDLE;
          else
            req_nxt_st[3:0] = PF_REQ;
PF0     : if(biu_pref_trans_err)
            req_nxt_st[3:0] = INV;
          else if(biu_pref_data_vld)
            req_nxt_st[3:0] = PF1;
          else
            req_nxt_st[3:0] = PF0;
PF1     : if(biu_pref_trans_err)
            req_nxt_st[3:0] = INV;
          else if(biu_pref_data_vld)
            req_nxt_st[3:0] = PF2;
          else
            req_nxt_st[3:0] = PF1;
PF2     : if(biu_pref_trans_err)
            req_nxt_st[3:0] = INV;
          else if(biu_pref_data_vld)
            req_nxt_st[3:0] = PF3;
          else
            req_nxt_st[3:0] = PF2;
PF3     : if(biu_pref_trans_err)
            req_nxt_st[3:0] = IDLE;
          else if(biu_pref_data_vld)
            req_nxt_st[3:0] = IDLE;
          else
            req_nxt_st[3:0] = PF3;
INV     : if(biu_pref_last)
            req_nxt_st[3:0] = IDLE;
          else
            req_nxt_st[3:0] = INV;  
default :   req_nxt_st[3:0] = IDLE;
endcase
// &CombEnd; @150
end

//---------------------Control Signal-----------------------
//pref_launch_vld
assign pref_launch_vld = biu_ref_grnt && //pref req only occur aftre ref grnt
                         //!pcgen_ipb_chgflw && //in case of hit under miss chgflw next icache read meet pref icache req
                         pref_idle && //pref sm not on
                         l1_refill_ipb_tsize && //Cacheable && Cache Enable
                         cp0_ifu_icache_pref_en && //pref is on
                         !icache_inv_for_pref && //cache inv not on
                         ref_for_pref_on && //pref on need refill sm on special condition
                         ref_addr_within_4k; //over 4K, MMU property not same

assign pref_launch_vld_for_gateclk = pref_idle && 
                                     l1_refill_ipb_tsize && 
                                     cp0_ifu_icache_pref_en && 
                                     !icache_inv_for_pref &&
                                     l1_refill_ipb_req && 
                                     ref_addr_within_4k; 

//Gate Clk
// &Instance("gated_clk_cell","x_pref_launch_clk"); @171
gated_clk_cell  x_pref_launch_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pref_launch_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pref_launch_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @172
//           .clk_out        (pref_launch_clk),//Out Clock @173
//           .external_en    (1'b0), @174
//           .global_en      (cp0_yy_clk_en), @175
//           .local_en       (pref_launch_clk_en),//Local Condition @176
//           .module_en      (cp0_ifu_icg_en) @177
//         ); @178
assign pref_launch_clk_en = ifu_biu_rd_req && !rid_for_grnt|| 
                            icache_if_req;

//pref_launch_vld_flop for LSU req timing
assign pref_launch_vld_flop = ipb_icache_if_req;
assign pref_launch_start = pref_launch_vld_flop && 
                           cp0_ifu_icache_pref_en && //pref is on
                           !icache_inv_for_pref;
assign pref_launch_start_short = icache_if_req
                              && cp0_ifu_icache_pref_en
                              && !icache_inv_for_pref;

assign biu_ref_grnt        = biu_ifu_rd_grnt && !rid_for_grnt;
assign pref_idle           = (req_cur_st[3:0] == IDLE) && 
                             (wb_cur_st[2:0] == PF_IDLE);
assign icache_inv_for_pref = ifctrl_ipb_inv_on || icache_inv_record;
assign ref_for_pref_on     = l1_refill_ipb_refill_on;
assign ref_addr_within_4k  = l1_refill_ipb_ppc[11:6] != 6'b111111;
//ipb_hit
assign ipb_hit = ipb_way0_hit || ipb_way1_hit;
assign ipb_way0_hit = icache_tag_data0_reg[28] && 
                      (l1_refill_ipb_ppc[39:12] == icache_tag_data0_reg[27:0]);
assign ipb_way1_hit = icache_tag_data1_reg[28] && 
                      (l1_refill_ipb_ppc[39:12] == icache_tag_data1_reg[27:0]);
always @(posedge icache_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    icache_tag_data0_reg[28:0] <= 29'b0;
    icache_tag_data1_reg[28:0] <= 29'b0;
  end
  else
  begin
    icache_tag_data0_reg[28:0] <= icache_if_ipb_tag_data0[28:0];
    icache_tag_data1_reg[28:0] <= icache_if_ipb_tag_data1[28:0];
  end 
end
//Gate Clk
// &Instance("gated_clk_cell","x_icache_flop_clk"); @217
gated_clk_cell  x_icache_flop_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icache_flop_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (icache_flop_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @218
//           .clk_out        (icache_flop_clk),//Out Clock @219
//           .external_en    (1'b0), @220
//           .global_en      (cp0_yy_clk_en), @221
//           .local_en       (icache_flop_clk_en),//Local Condition @222
//           .module_en      (cp0_ifu_icg_en) @223
//         ); @224
assign icache_flop_clk_en = (req_cur_st[3:0] == CACHE);

// &Force("output","ifu_biu_rd_req"); @227
//ifu_biu_rd_req
//refill request can be set when pref not IDLE
assign ifu_biu_rd_req      = (ref_req_for_biu || pref_req_for_biu) && 
                             cp0_yy_clk_en;
assign ref_req_for_biu     = l1_refill_ipb_req && 
                             (pref_idle || !ref_hit_pref);
assign pref_req_for_biu    = (req_cur_st[3:0] == PF_REQ);
assign ref_hit_pref        = (l1_refill_ipb_ppc[39:6] == pref_line_addr[33:0]) && 
                             l1_refill_ipb_tsize;
assign biu_pref_grnt       = biu_ifu_rd_grnt && rid_for_grnt;
assign ifu_biu_rd_req_gate = req_gate;

//req gate logic
// &Instance("gated_clk_cell","x_req_clk"); @241
gated_clk_cell  x_req_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (req_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (req_clk_en        ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @242
//           .clk_out        (req_clk),//Out Clock @243
//           .external_en    (1'b0), @244
//           .global_en      (cp0_yy_clk_en), @245
//           .local_en       (req_clk_en),//Local Condition @246
//           .module_en      (cp0_ifu_icg_en) @247
//         ); @248
assign req_clk_en = req_gate ^ (pf_req_for_gateclk || l1_refill_ipb_req_for_gateclk);
always @(posedge req_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    req_gate <= 1'b0;
  else if(pf_req_pre || refill_req_pre)
    req_gate <= 1'b1;
  else
    req_gate <= 1'b0;
end

assign pf_req_for_gateclk = (req_cur_st[3:0] == CMP)    &&
                            !ipb_hit                    || 
                            (req_cur_st[3:0] == PF_REQ) && 
                            !(l1_refill_ipb_req && !ref_hit_pref);

assign pf_req_pre = (req_cur_st[3:0] == CMP)    &&
                    !ipb_hit                    || 
                    (req_cur_st[3:0] == PF_REQ) && 
                    !biu_pref_grnt              && 
                    !(l1_refill_ipb_req && !ref_hit_pref);
assign refill_req_pre = l1_refill_ipb_req_pre;

//biu interface
assign biu_pref_data_vld   = biu_ifu_rd_data_vld  && !l1_refill_ipb_ctc_inv && biu_ifu_rd_id && !biu_ifu_rd_resp[1];
assign biu_ref_data_vld    = biu_ifu_rd_data_vld  && !l1_refill_ipb_ctc_inv &&!biu_ifu_rd_id && !biu_ifu_rd_resp[1];
assign biu_pref_trans_err  = biu_ifu_rd_data_vld  && !l1_refill_ipb_ctc_inv && biu_ifu_rd_id &&  biu_ifu_rd_resp[1];
assign biu_ref_trans_err   = biu_ifu_rd_data_vld  && !l1_refill_ipb_ctc_inv &&!biu_ifu_rd_id &&  biu_ifu_rd_resp[1];
assign biu_pref_last       = biu_ifu_rd_data_vld  && !l1_refill_ipb_ctc_inv && biu_ifu_rd_id &&  biu_ifu_rd_last;

//prefetch buffer write enable
assign pref_pbuf_wen0 = (req_cur_st[3:0] == PF0) && biu_pref_data_vld;
assign pref_pbuf_wen1 = (req_cur_st[3:0] == PF1) && biu_pref_data_vld;
assign pref_pbuf_wen2 = (req_cur_st[3:0] == PF2) && biu_pref_data_vld;
assign pref_pbuf_wen3 = (req_cur_st[3:0] == PF3) && biu_pref_data_vld;

assign req_sm_pref_cmplt = (req_cur_st[3:0] == PF3) && biu_pref_data_vld;

//==========================================================
//              The Prefetch Write back SM
//==========================================================
//State Description:
//PF_IDLE : Wait for prefetch cmplt
//PF_VLD  : Wait for refill request
//PF_GRNT : Grnt state and wait one cycle
//PF_WB0  : Write back from pbuf cycle 0
//PF_WB1  : Write back from pbuf cycle 1
//PF_WB2  : Write back from pbuf cycle 2
//PF_WB3  : Write back from pbuf cycle 3

always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_cur_st[2:0] <= PF_IDLE;
  else
    wb_cur_st[2:0] <= wb_nxt_st[2:0];
end

// &CombBeg; @310
always @( req_sm_pref_cmplt
       or ref_hit_pref
       or pcgen_ipb_chgflw
       or icache_inv_for_pref
       or l1_refill_ipb_req
       or ifu_no_op_req
       or wb_cur_st[2:0])
begin
case(wb_cur_st[2:0])
PF_IDLE : if(icache_inv_for_pref || ifu_no_op_req)
            wb_nxt_st[2:0] = PF_IDLE;
          else
            if(req_sm_pref_cmplt)
              if(l1_refill_ipb_req && ref_hit_pref && !pcgen_ipb_chgflw)
                wb_nxt_st[2:0] = PF_GRNT; //cmplt pref hit refill
              else if(l1_refill_ipb_req)
                wb_nxt_st[2:0] = PF_IDLE; //cmplt pref not hit refill
              else
                wb_nxt_st[2:0] = PF_VLD; //pref cmplt without refill request
            else
              wb_nxt_st[2:0] = PF_IDLE;
PF_VLD  :  if(icache_inv_for_pref || ifu_no_op_req)
             wb_nxt_st[2:0] = PF_IDLE;
           else
             if(l1_refill_ipb_req && ref_hit_pref && !pcgen_ipb_chgflw)
               wb_nxt_st[2:0] = PF_GRNT; //cmplt pref hit refill
             else if(l1_refill_ipb_req)
               wb_nxt_st[2:0] = PF_IDLE; //cmplt pref not hit refill
             else
               wb_nxt_st[2:0] = PF_VLD; //pref cmplt without refill request
PF_GRNT :    wb_nxt_st[2:0] = PF_WB0;
PF_WB0  :    wb_nxt_st[2:0] = PF_WB1;
PF_WB1  :    wb_nxt_st[2:0] = PF_WB2;
PF_WB2  :    wb_nxt_st[2:0] = PF_WB3;
PF_WB3  :    wb_nxt_st[2:0] = PF_IDLE;
default :    wb_nxt_st[2:0] = PF_IDLE;
endcase
// &CombEnd; @340
end

//---------------------Control Signal-----------------------
assign pref_hit_vld      = (wb_nxt_st[2:0] == PF_GRNT);
assign pref_wb_index_inc = (wb_cur_st[2:0] == PF_WB0) || 
                           (wb_cur_st[2:0] == PF_WB1) || 
                           (wb_cur_st[2:0] == PF_WB2);
assign pref_wb_from_pbuf = wb_cur_st[2]; //PF_WBn State
assign pref_grnt_ref     = (wb_cur_st[2:0] == PF_GRNT);

//==========================================================
//          Record the Prefetch Information
//==========================================================
assign rid_for_grnt = !ref_req_for_biu;

//buffer nxt line addr of refill when prefetch launch
assign ref_addr_inc[33:0] = l1_refill_ipb_ppc[39:6] + 26'b1;
always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pref_line_addr[33:0] <= 34'b0;
  else if(pref_launch_vld)
    pref_line_addr[33:0] <= ref_addr_inc[33:0];
  else
    pref_line_addr[33:0] <= pref_line_addr[33:0];
end

//buffer line offset when ref hit pref, for critical word first
//line offset for select critical word out from pbuf
always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pref_line_offset[1:0] <= 2'b0;
  else if(pref_hit_vld)
    pref_line_offset[1:0] <= l1_refill_ipb_ppc[5:4];
  else if(pref_wb_index_inc)
    pref_line_offset[1:0] <= pref_line_offset[1:0] + 2'b1;
  else
    pref_line_offset[1:0] <= pref_line_offset[1:0];
end

always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pref_cacheable <= 1'b0;
  else if(pref_launch_vld)
    pref_cacheable <= l1_refill_ipb_cacheable;
  else
    pref_cacheable <= pref_cacheable;
end

always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pref_bufferable <= 1'b0;
  else if(pref_launch_vld)
    pref_bufferable <= l1_refill_ipb_bufferable;
  else
    pref_bufferable <= pref_bufferable;
end

always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pref_supv_mode <= 1'b0;
  else if(pref_launch_vld)
    pref_supv_mode <= l1_refill_ipb_supv_mode;
  else
    pref_supv_mode <= pref_supv_mode;
end

always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pref_machine_mode <= 1'b0;
  else if(pref_launch_vld)
    pref_machine_mode <= l1_refill_ipb_machine_mode;
  else
    pref_machine_mode <= pref_machine_mode;
end

always @(posedge pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pref_secure <= 1'b0;
  else if(pref_launch_vld)
    pref_secure <= l1_refill_ipb_secure;
  else
    pref_secure <= pref_secure;
end

assign pref_tsize = 1'b1;

//==========================================================
//             Information to BIU
//==========================================================
//prepare select
assign ipb_cacheable    = (ref_req_for_biu) ? l1_refill_ipb_cacheable 
                                            : pref_cacheable;
assign ipb_bufferable   = (ref_req_for_biu) ? l1_refill_ipb_bufferable 
                                            : pref_bufferable;
assign ipb_supv_mode    = (ref_req_for_biu) ? l1_refill_ipb_supv_mode 
                                            : pref_supv_mode;
assign ipb_machine_mode = (ref_req_for_biu) ? l1_refill_ipb_machine_mode
                                            : pref_machine_mode;
assign ipb_tsize        = (ref_req_for_biu) ? l1_refill_ipb_tsize
                                            : pref_tsize;
assign ipb_secure       = (ref_req_for_biu) ? l1_refill_ipb_secure 
                                            : pref_secure;
//Prepare snoop request                                            
assign ipb_page_share     = !cp0_ifu_insde;
assign ipb_share_refill   = ipb_tsize && ipb_page_share; 
assign ipb_rd_domain[1:0] = (!ipb_cacheable)  ? 2'b11
                                              : {1'b0, ipb_page_share};

assign ipb_rd_snoop[3:0]  = (ipb_share_refill)? 4'b1
                                              : 4'b0;

//araddr : 128 bus addr, low 4 bits set to 4'b0
assign ifu_biu_rd_addr[39:0] = ref_req_for_biu ? {l1_refill_ipb_ppc[39:4], 4'b0} 
                                               : {pref_line_addr[33:0], 6'b0};

//arid
assign ifu_biu_rd_id          = !ref_req_for_biu;
//arlen
assign ifu_biu_rd_len[1:0]    = (ipb_tsize) ? 2'b11 : 2'b00;
//arsize
assign ifu_biu_rd_size[2:0]   = 3'b100;
//arburst
assign ifu_biu_rd_burst[1:0]  = (ipb_tsize) ? 2'b10 : 2'b01;
//arcache
assign ifu_biu_rd_cache[3:0]  = {ipb_cacheable, ipb_cacheable, 1'b1, ipb_bufferable};
//arprot
assign ifu_biu_rd_prot[2:0]   = {1'b1, ipb_secure, ipb_supv_mode};
//ardomain
assign ifu_biu_rd_domain[1:0] = ipb_rd_domain[1:0];
//arsnoop
assign ifu_biu_rd_snoop[3:0]  = ipb_rd_snoop[3:0];
//aruser
assign ifu_biu_rd_user[1:0]   = {ipb_machine_mode,1'b0};
//r_ready
assign ifu_biu_r_ready        = ~l1_refill_ipb_ctc_inv;
//==========================================================
//             Information to L1 Refill
//==========================================================
//grnt
assign ipb_l1_refill_grnt         = pref_grnt_ref || biu_ref_grnt;
//data_vld
assign ipb_l1_refill_data_vld     = pref_wb_from_pbuf || biu_ref_data_vld;
//inst data
assign ipb_l1_refill_rdata[127:0] = pref_wb_from_pbuf ? pbuf_wb_rdata[127:0]
                                                      : biu_ifu_rd_data[127:0];
//acc err
assign ipb_l1_refill_trans_err    = biu_ref_trans_err;

//==========================================================
//            Information to Icache interface
//==========================================================
assign ipb_icache_if_req_pre         = pref_launch_vld;
assign ipb_icache_if_index_pre[33:0] = l1_refill_ipb_vpc[PC_WIDTH-1:6] + 34'h1;
always @(posedge pref_launch_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    icache_if_req <= 1'b0;
  else
    icache_if_req <= ipb_icache_if_req_pre;
end
assign ipb_icache_if_req = icache_if_req && 
                           !l1_refill_ipb_pre_cancel;
assign ipb_icache_if_req_for_gateclk = icache_if_req;

// &Force("output","ipb_icache_if_req"); @517
always @(posedge ipb_icache_data_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ipb_icache_if_index[33:0] <= 34'b0;
  else
    ipb_icache_if_index[33:0] <= ipb_icache_if_index_pre[33:0];
end
//assign ipb_icache_if_tag_rd      = (req_cur_st[3:0] == CACHE);
//Gate Clk
// &Instance("gated_clk_cell","x_addrgen_flop_clk"); @527
gated_clk_cell  x_addrgen_flop_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (ipb_icache_data_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (ipb_icache_data_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @528
//           .clk_out        (ipb_icache_data_clk),//Out Clock @529
//           .external_en    (1'b0), @530
//           .global_en      (cp0_yy_clk_en), @531
//           .local_en       (ipb_icache_data_clk_en),//Local Condition @532
//           .module_en      (cp0_ifu_icg_en) @533
//         ); @534
assign ipb_icache_data_clk_en = pref_launch_vld_for_gateclk;

//==========================================================
//             Information to if_ctrl
//==========================================================
//For low power use
assign ipb_ifctrl_prefetch_idle = (req_cur_st[3:0] == IDLE);

//==========================================================
//                    Prefetch Buffer
//==========================================================
// &Instance("gated_clk_cell","x_pbuf_entry0_clk"); @546
gated_clk_cell  x_pbuf_entry0_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pbuf_entry0_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pbuf_entry0_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @547
//           .clk_out        (pbuf_entry0_clk),//Out Clock @548
//           .external_en    (1'b0), @549
//           .global_en      (cp0_yy_clk_en), @550
//           .local_en       (pbuf_entry0_clk_en),//Local Condition @551
//           .module_en      (cp0_ifu_icg_en) @552
//         ); @553
assign pbuf_entry0_clk_en = pref_pbuf_wen0;

// &Instance("gated_clk_cell","x_pbuf_entry1_clk"); @556
gated_clk_cell  x_pbuf_entry1_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pbuf_entry1_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pbuf_entry1_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @557
//           .clk_out        (pbuf_entry1_clk),//Out Clock @558
//           .external_en    (1'b0), @559
//           .global_en      (cp0_yy_clk_en), @560
//           .local_en       (pbuf_entry1_clk_en),//Local Condition @561
//           .module_en      (cp0_ifu_icg_en) @562
//         ); @563
assign pbuf_entry1_clk_en = pref_pbuf_wen1;

// &Instance("gated_clk_cell","x_pbuf_entry2_clk"); @566
gated_clk_cell  x_pbuf_entry2_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pbuf_entry2_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pbuf_entry2_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @567
//           .clk_out        (pbuf_entry2_clk),//Out Clock @568
//           .external_en    (1'b0), @569
//           .global_en      (cp0_yy_clk_en), @570
//           .local_en       (pbuf_entry2_clk_en),//Local Condition @571
//           .module_en      (cp0_ifu_icg_en) @572
//         ); @573
assign pbuf_entry2_clk_en = pref_pbuf_wen2;

// &Instance("gated_clk_cell","x_pbuf_entry3_clk"); @576
gated_clk_cell  x_pbuf_entry3_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pbuf_entry3_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pbuf_entry3_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @577
//           .clk_out        (pbuf_entry3_clk),//Out Clock @578
//           .external_en    (1'b0), @579
//           .global_en      (cp0_yy_clk_en), @580
//           .local_en       (pbuf_entry3_clk_en),//Local Condition @581
//           .module_en      (cp0_ifu_icg_en) @582
//         ); @583
assign pbuf_entry3_clk_en = pref_pbuf_wen3;

always @(posedge pbuf_entry0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pbuf_entry0[127:0] <= 128'b0;
  else if(pref_pbuf_wen0)
    pbuf_entry0[127:0] <= biu_ifu_rd_data[127:0];
  else
    pbuf_entry0[127:0] <= pbuf_entry0[127:0];
end

always @(posedge pbuf_entry1_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pbuf_entry1[127:0] <= 128'b0;
  else if(pref_pbuf_wen1)
    pbuf_entry1[127:0] <= biu_ifu_rd_data[127:0];
  else
    pbuf_entry1[127:0] <= pbuf_entry1[127:0];
end

always @(posedge pbuf_entry2_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pbuf_entry2[127:0] <= 128'b0;
  else if(pref_pbuf_wen2)
    pbuf_entry2[127:0] <= biu_ifu_rd_data[127:0];
  else
    pbuf_entry2[127:0] <= pbuf_entry2[127:0];
end

always @(posedge pbuf_entry3_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pbuf_entry3[127:0] <= 128'b0;
  else if(pref_pbuf_wen3)
    pbuf_entry3[127:0] <= biu_ifu_rd_data[127:0];
  else
    pbuf_entry3[127:0] <= pbuf_entry3[127:0];
end

assign pbuf_wb_entry0_sel = (pref_line_offset[1:0] == 2'b00);
assign pbuf_wb_entry1_sel = (pref_line_offset[1:0] == 2'b01);
assign pbuf_wb_entry2_sel = (pref_line_offset[1:0] == 2'b10);
assign pbuf_wb_entry3_sel = (pref_line_offset[1:0] == 2'b11);

assign pbuf_wb_rdata[127:0] = {128{pbuf_wb_entry0_sel}} & pbuf_entry0[127:0]
                            | {128{pbuf_wb_entry1_sel}} & pbuf_entry1[127:0]
                            | {128{pbuf_wb_entry2_sel}} & pbuf_entry2[127:0]
                            | {128{pbuf_wb_entry3_sel}} & pbuf_entry3[127:0];


//Debug Infor
assign ipb_debug_req_cur_st[3:0] = req_cur_st[3:0];
assign ipb_debug_wb_cur_st[2:0]  = wb_cur_st[2:0];

// &ModuleEnd; @645
endmodule


