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
module ct_ifu_l1_refill(
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ifctrl_l1_refill_ins_inv,
  ifctrl_l1_refill_ins_inv_dn,
  ifctrl_l1_refill_inv_busy,
  ifctrl_l1_refill_inv_on,
  ifdp_l1_refill_bufferable,
  ifdp_l1_refill_cacheable,
  ifdp_l1_refill_fifo,
  ifdp_l1_refill_machine_mode,
  ifdp_l1_refill_secure,
  ifdp_l1_refill_supv_mode,
  ifdp_l1_refill_tsize,
  ifu_hpcp_icache_miss_pre,
  ipb_l1_refill_data_vld,
  ipb_l1_refill_grnt,
  ipb_l1_refill_rdata,
  ipb_l1_refill_trans_err,
  ipctrl_l1_refill_chk_err,
  ipctrl_l1_refill_fifo,
  ipctrl_l1_refill_miss_req,
  ipctrl_l1_refill_ppc,
  ipctrl_l1_refill_req_for_gateclk,
  ipctrl_l1_refill_vpc,
  l1_refill_debug_refill_st,
  l1_refill_icache_if_fifo,
  l1_refill_icache_if_first,
  l1_refill_icache_if_index,
  l1_refill_icache_if_inst_data,
  l1_refill_icache_if_last,
  l1_refill_icache_if_pre_code,
  l1_refill_icache_if_ptag,
  l1_refill_icache_if_wr,
  l1_refill_ifctrl_ctc,
  l1_refill_ifctrl_idle,
  l1_refill_ifctrl_pc,
  l1_refill_ifctrl_refill_on,
  l1_refill_ifctrl_reissue,
  l1_refill_ifctrl_start,
  l1_refill_ifctrl_start_for_gateclk,
  l1_refill_ifctrl_trans_cmplt,
  l1_refill_ifdp_acc_err,
  l1_refill_ifdp_inst_data,
  l1_refill_ifdp_precode,
  l1_refill_ifdp_refill_on,
  l1_refill_ifdp_tag_data,
  l1_refill_inv_wfd_back,
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
  l1_refill_ipctrl_busy,
  pad_yy_icg_scan_en,
  pcgen_l1_refill_chgflw
);

// &Ports; @23
input            cp0_ifu_icg_en;                    
input            cp0_yy_clk_en;                     
input            cpurst_b;                          
input            forever_cpuclk;                    
input            ifctrl_l1_refill_ins_inv;          
input            ifctrl_l1_refill_ins_inv_dn;       
input            ifctrl_l1_refill_inv_busy;         
input            ifctrl_l1_refill_inv_on;           
input            ifdp_l1_refill_bufferable;         
input            ifdp_l1_refill_cacheable;          
input            ifdp_l1_refill_fifo;               
input            ifdp_l1_refill_machine_mode;       
input            ifdp_l1_refill_secure;             
input            ifdp_l1_refill_supv_mode;          
input            ifdp_l1_refill_tsize;              
input            ipb_l1_refill_data_vld;            
input            ipb_l1_refill_grnt;                
input   [127:0]  ipb_l1_refill_rdata;               
input            ipb_l1_refill_trans_err;           
input            ipctrl_l1_refill_chk_err;          
input            ipctrl_l1_refill_fifo;             
input            ipctrl_l1_refill_miss_req;         
input   [38 :0]  ipctrl_l1_refill_ppc;              
input            ipctrl_l1_refill_req_for_gateclk;  
input   [38 :0]  ipctrl_l1_refill_vpc;              
input            pad_yy_icg_scan_en;                
input            pcgen_l1_refill_chgflw;            
output           ifu_hpcp_icache_miss_pre;          
output  [3  :0]  l1_refill_debug_refill_st;         
output           l1_refill_icache_if_fifo;          
output           l1_refill_icache_if_first;         
output  [38 :0]  l1_refill_icache_if_index;         
output  [127:0]  l1_refill_icache_if_inst_data;     
output           l1_refill_icache_if_last;          
output  [31 :0]  l1_refill_icache_if_pre_code;      
output  [27 :0]  l1_refill_icache_if_ptag;          
output           l1_refill_icache_if_wr;            
output           l1_refill_ifctrl_ctc;              
output           l1_refill_ifctrl_idle;             
output  [38 :0]  l1_refill_ifctrl_pc;               
output           l1_refill_ifctrl_refill_on;        
output           l1_refill_ifctrl_reissue;          
output           l1_refill_ifctrl_start;            
output           l1_refill_ifctrl_start_for_gateclk; 
output           l1_refill_ifctrl_trans_cmplt;      
output           l1_refill_ifdp_acc_err;            
output  [127:0]  l1_refill_ifdp_inst_data;          
output  [31 :0]  l1_refill_ifdp_precode;            
output           l1_refill_ifdp_refill_on;          
output  [28 :0]  l1_refill_ifdp_tag_data;           
output           l1_refill_inv_wfd_back;            
output           l1_refill_ipb_bufferable;          
output           l1_refill_ipb_cacheable;           
output           l1_refill_ipb_ctc_inv;             
output           l1_refill_ipb_machine_mode;        
output  [39 :0]  l1_refill_ipb_ppc;                 
output           l1_refill_ipb_pre_cancel;          
output           l1_refill_ipb_refill_on;           
output           l1_refill_ipb_req;                 
output           l1_refill_ipb_req_for_gateclk;     
output           l1_refill_ipb_req_pre;             
output           l1_refill_ipb_secure;              
output           l1_refill_ipb_supv_mode;           
output           l1_refill_ipb_tsize;               
output  [39 :0]  l1_refill_ipb_vpc;                 
output           l1_refill_ipctrl_busy;             

// &Regs; @24
reg              bufferable;                        
reg              cacheable;                         
reg              inv_wfd_back;                      
reg              l1_refill_icache_if_fifo;          
reg              machine_mode;                      
reg     [38 :0]  physical_pc;                       
reg     [3  :0]  refill_cur_state;                  
reg     [3  :0]  refill_next_state;                 
reg              secure;                            
reg              supv_mode;                         
reg              tsize;                             
reg     [38 :0]  virtual_pc;                        

// &Wires; @25
wire    [7  :0]  byte0;                             
wire    [7  :0]  byte1;                             
wire    [7  :0]  byte10;                            
wire    [7  :0]  byte11;                            
wire    [7  :0]  byte12;                            
wire    [7  :0]  byte13;                            
wire    [7  :0]  byte14;                            
wire    [7  :0]  byte15;                            
wire    [7  :0]  byte2;                             
wire    [7  :0]  byte3;                             
wire    [7  :0]  byte4;                             
wire    [7  :0]  byte5;                             
wire    [7  :0]  byte6;                             
wire    [7  :0]  byte7;                             
wire    [7  :0]  byte8;                             
wire    [7  :0]  byte9;                             
wire             change_flow;                       
wire             cp0_ifu_icg_en;                    
wire             cp0_yy_clk_en;                     
wire             cpurst_b;                          
wire             forever_cpuclk;                    
wire             icache_inv_busy;                   
wire             ifctrl_l1_refill_ins_inv;          
wire             ifctrl_l1_refill_ins_inv_dn;       
wire             ifctrl_l1_refill_inv_busy;         
wire             ifctrl_l1_refill_inv_on;           
wire             ifdp_l1_refill_bufferable;         
wire             ifdp_l1_refill_cacheable;          
wire             ifdp_l1_refill_fifo;               
wire             ifdp_l1_refill_machine_mode;       
wire             ifdp_l1_refill_secure;             
wire             ifdp_l1_refill_supv_mode;          
wire             ifdp_l1_refill_tsize;              
wire             ifdp_tag_valid;                    
wire             ifu_hpcp_icache_miss_pre;          
wire             index_inc_vld;                     
wire             inv_wfd_back_clr;                  
wire             inv_wfd_back_record;               
wire    [127:0]  ipb_l1_refill_data_aft_v2trans;    
wire             ipb_l1_refill_data_vld;            
wire             ipb_l1_refill_grnt;                
wire    [127:0]  ipb_l1_refill_rdata;               
wire             ipb_l1_refill_trans_err;           
wire             ipb_refill_data_vld;               
wire             ipb_refill_trans_err;              
wire             ipctrl_l1_refill_chk_err;          
wire             ipctrl_l1_refill_fifo;             
wire             ipctrl_l1_refill_miss_req;         
wire    [38 :0]  ipctrl_l1_refill_ppc;              
wire             ipctrl_l1_refill_req_for_gateclk;  
wire    [38 :0]  ipctrl_l1_refill_vpc;              
wire             l1_refill_clk;                     
wire             l1_refill_clk_en;                  
wire    [3  :0]  l1_refill_debug_refill_st;         
wire             l1_refill_icache_if_first;         
wire    [38 :0]  l1_refill_icache_if_index;         
wire    [127:0]  l1_refill_icache_if_inst_data;     
wire             l1_refill_icache_if_last;          
wire    [31 :0]  l1_refill_icache_if_pre_code;      
wire    [27 :0]  l1_refill_icache_if_ptag;          
wire             l1_refill_icache_if_wr;            
wire             l1_refill_ifctrl_ctc;              
wire             l1_refill_ifctrl_idle;             
wire    [38 :0]  l1_refill_ifctrl_pc;               
wire             l1_refill_ifctrl_refill_on;        
wire             l1_refill_ifctrl_reissue;          
wire             l1_refill_ifctrl_start;            
wire             l1_refill_ifctrl_start_for_gateclk; 
wire             l1_refill_ifctrl_trans_cmplt;      
wire             l1_refill_ifdp_acc_err;            
wire    [127:0]  l1_refill_ifdp_inst_data;          
wire    [31 :0]  l1_refill_ifdp_precode;            
wire             l1_refill_ifdp_refill_on;          
wire    [28 :0]  l1_refill_ifdp_tag_data;           
wire             l1_refill_inv_wfd_back;            
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
wire             l1_refill_ipctrl_busy;             
wire             pad_yy_icg_scan_en;                
wire             pcgen_l1_refill_chgflw;            
wire    [31 :0]  pre_code_info;                     
wire             refill_grnt;                       
wire             refill_sm_busy;                    
wire             refill_sm_on;                      
wire             refill_start;                      
wire             refill_start_for_gateclk;          

parameter PC_WIDTH = 40;
parameter IDLE     = 4'b0000;
parameter REQ      = 4'b0001;
//parameter WFG      = 4'b0010;
parameter WFD1     = 4'b0100;
parameter WFD2     = 4'b0101;
parameter WFD3     = 4'b0110;
parameter WFD4     = 4'b0111;
parameter INV_WFD1 = 4'b1000;
parameter INV_WFD2 = 4'b1001;
parameter INV_WFD3 = 4'b1010;
parameter INV_WFD4 = 4'b1011;
parameter CTC_INV  = 4'b0011;
//==========================================================
//              Gate Clk of Icache Refill SM
//==========================================================
// &Instance("gated_clk_cell","x_l1_refill_clk"); @42
gated_clk_cell  x_l1_refill_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l1_refill_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (l1_refill_clk_en  ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @43
//           .clk_out        (l1_refill_clk),//Out Clock @44
//           .external_en    (1'b0), @45
//           .global_en      (cp0_yy_clk_en), @46
//           .local_en       (l1_refill_clk_en),//Local Condition @47
//           .module_en      (cp0_ifu_icg_en) @48
//         ); @49
assign l1_refill_clk_en = refill_start_for_gateclk || 
                          (refill_cur_state[3:0] != IDLE);

//------------------FSM of ICache Refill--------------------
//State Description:
//IDLE     : Wait for icache refill request
//REQ      : Wait for biu_ifu_refill_grant or change flow
//             a. grant is earlier than chgflw --> WFD1
//             b. chgflw is eariier than grant --> WFG
//             c. grant arrive with chgflw at the same time --> INV_WFD1
//WFG      : Wait for grant signal and then go into INV_WFD1
//WFD1     : Wait for the 1st valid refill data
//WFD2     : Wait for the 2nd valid refill data
//WFD3     : Wait for the 3rd valid refill data
//WFD4     : Wait for the 4th valid refill data
//INV_WFD1 : Wait for the 1st invalid refill data
//INV_WFD2 : Wait for the 2nd invalid refill data
//INV_WFD3 : Wait for the 3rd invalid refill data
//INV_WFD4 : Wait for the 4th invalid refill data
//CTC_INV  : Make CTC_INV to execute first

always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    refill_cur_state[3:0] <= IDLE;
  else
    refill_cur_state[3:0] <= refill_next_state[3:0];
end

// &CombBeg; @79
always @( ifctrl_l1_refill_ins_inv
       or refill_grnt
       or ifctrl_l1_refill_ins_inv_dn
       or inv_wfd_back
       or refill_cur_state[3:0]
       or ipb_refill_trans_err
       or tsize
       or change_flow
       or ipb_refill_data_vld
       or refill_start)
begin
case(refill_cur_state[3:0])
IDLE     : if(refill_start)
           refill_next_state[3:0] = REQ;
           else
           refill_next_state[3:0] = IDLE;
REQ      : if(change_flow && !refill_grnt)
           refill_next_state[3:0] = IDLE;//before grnt, set req = 0, biu will ignore this req
           else if(!change_flow && refill_grnt)
           refill_next_state[3:0] = WFD1;
           else if(change_flow && refill_grnt)
           refill_next_state[3:0] = INV_WFD1;
           else if(ifctrl_l1_refill_ins_inv)
           refill_next_state[3:0] = IDLE;
           else
           refill_next_state[3:0] = REQ;
//Because of the BIU req cancel logic
//set ifu req = 0, biu will ignore req
//WFG state does not need again
//WFG      : if(refill_grnt)
//           refill_next_state[3:0] = INV_WFD1;
//           else
//           refill_next_state[3:0] = WFG;
INV_WFD1 : if(ipb_refill_data_vld || ipb_refill_trans_err)
           begin
             if(tsize)
             refill_next_state[3:0] = INV_WFD2;
             else
             refill_next_state[3:0] = IDLE;
           end
           else if(ifctrl_l1_refill_ins_inv)
           refill_next_state[3:0] = CTC_INV;           
           else
           refill_next_state[3:0] = INV_WFD1;
INV_WFD2 : if(ipb_refill_data_vld || ipb_refill_trans_err)
           refill_next_state[3:0] = INV_WFD3;
           else
           refill_next_state[3:0] = INV_WFD2;
INV_WFD3 : if(ipb_refill_data_vld || ipb_refill_trans_err)
           refill_next_state[3:0] = INV_WFD4;
           else
           refill_next_state[3:0] = INV_WFD3;
INV_WFD4 : if(ipb_refill_data_vld || ipb_refill_trans_err)
           refill_next_state[3:0] = IDLE;
           else
           refill_next_state[3:0] = INV_WFD4;
WFD1     : if(ipb_refill_data_vld)
           begin
             if(tsize)
             refill_next_state[3:0] = WFD2;
             else
             refill_next_state[3:0] = IDLE;
           end
           else if(ipb_refill_trans_err)
           begin
             if(tsize)
             refill_next_state[3:0] = INV_WFD2;
             else
             refill_next_state[3:0] = IDLE;
           end
           else if(change_flow)
           refill_next_state[3:0] = INV_WFD1;
           else if(ifctrl_l1_refill_ins_inv)
           refill_next_state[3:0] = CTC_INV;
           else
           refill_next_state[3:0] = WFD1;
WFD2     : if(ipb_refill_data_vld)
           refill_next_state[3:0] = WFD3;
           else if(ipb_refill_trans_err)
           refill_next_state[3:0] = INV_WFD3;
           else
           refill_next_state[3:0] = WFD2;
WFD3     : if(ipb_refill_data_vld)
           refill_next_state[3:0] = WFD4;
           else if(ipb_refill_trans_err)
           refill_next_state[3:0] = INV_WFD4;
           else
           refill_next_state[3:0] = WFD3;
WFD4     : if(ipb_refill_data_vld)
           refill_next_state[3:0] = IDLE;
           else if(ipb_refill_trans_err)
           refill_next_state[3:0] = IDLE;
           else
           refill_next_state[3:0] = WFD4;
CTC_INV  : if(ifctrl_l1_refill_ins_inv_dn && inv_wfd_back)
           refill_next_state[3:0] = INV_WFD1;
//           else if(ifctrl_l1_refill_ins_inv_dn)
//           refill_next_state[3:0] = WFD1;
           else
           refill_next_state[3:0] = CTC_INV;
default  : refill_next_state[3:0] = IDLE;
endcase
// &CombEnd; @171
end

//------------------Conditional Signal----------------------
assign refill_start         = ipctrl_l1_refill_miss_req && 
                              !ifctrl_l1_refill_inv_on;
assign refill_start_for_gateclk = ipctrl_l1_refill_req_for_gateclk &&
                                  !ifctrl_l1_refill_inv_on;

assign change_flow          = pcgen_l1_refill_chgflw;
assign refill_grnt          = ipb_l1_refill_grnt;
assign ipb_refill_data_vld  = ipb_l1_refill_data_vld; 
assign ipb_refill_trans_err = ipb_l1_refill_trans_err;

always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    inv_wfd_back <= 1'b0;
  else if(inv_wfd_back_clr)
    inv_wfd_back <= 1'b0;
  else if(inv_wfd_back_record)
    inv_wfd_back <= 1'b1;
  else
    inv_wfd_back <= inv_wfd_back;
end
assign inv_wfd_back_clr    = refill_start && 
                             (refill_cur_state[3:0] == IDLE);
assign inv_wfd_back_record = ifctrl_l1_refill_ins_inv && 
                             (refill_cur_state[3:0] == INV_WFD1 ||
                              refill_cur_state[3:0] == WFD1);

//==========================================================
//              L1 Refill to icache if
//==========================================================
//refill inst data
//If want to use, please use // code in the following
assign l1_refill_icache_if_inst_data[127:0]  = ipb_l1_refill_data_aft_v2trans[127:0];

// &Force("output","l1_refill_icache_if_inst_data"); @223
assign ipb_l1_refill_data_aft_v2trans[127:0] = {
                                                 {byte1[7:0],  byte0[7:0]}, 
                                                 {byte3[7:0],  byte2[7:0]}, 
                                                 {byte5[7:0],  byte4[7:0]}, 
                                                 {byte7[7:0],  byte6[7:0]}, 
                                                 {byte9[7:0],  byte8[7:0]}, 
                                                 {byte11[7:0], byte10[7:0]}, 
                                                 {byte13[7:0], byte12[7:0]}, 
                                                 {byte15[7:0], byte14[7:0]} 
                                               };                                             
assign byte15[7:0] = ipb_l1_refill_rdata[127:120];                                                           
assign byte14[7:0] = ipb_l1_refill_rdata[119:112];                                                           
assign byte13[7:0] = ipb_l1_refill_rdata[111:104];                                                           
assign byte12[7:0] = ipb_l1_refill_rdata[103: 96];                                                           
assign byte11[7:0] = ipb_l1_refill_rdata[ 95: 88];                                                           
assign byte10[7:0] = ipb_l1_refill_rdata[ 87: 80];                                                           
assign byte9[7:0]  = ipb_l1_refill_rdata[ 79: 72];                                                           
assign byte8[7:0]  = ipb_l1_refill_rdata[ 71: 64];                                                           
assign byte7[7:0]  = ipb_l1_refill_rdata[ 63: 56];                                                           
assign byte6[7:0]  = ipb_l1_refill_rdata[ 55: 48];                                                           
assign byte5[7:0]  = ipb_l1_refill_rdata[ 47: 40];                                                           
assign byte4[7:0]  = ipb_l1_refill_rdata[ 39: 32];                                                           
assign byte3[7:0]  = ipb_l1_refill_rdata[ 31: 24];                                                           
assign byte2[7:0]  = ipb_l1_refill_rdata[ 23: 16];                                                           
assign byte1[7:0]  = ipb_l1_refill_rdata[ 15:  8];                                                           
assign byte0[7:0]  = ipb_l1_refill_rdata[  7:  0]; 

//refill tag data
assign l1_refill_icache_if_ptag[27:0] = physical_pc[PC_WIDTH-2:11];

always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    physical_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(ipctrl_l1_refill_req_for_gateclk)
    physical_pc[PC_WIDTH-2:0] <= ipctrl_l1_refill_ppc[PC_WIDTH-2:0];
  else if(index_inc_vld)
    physical_pc[PC_WIDTH-2:0] <= {physical_pc[PC_WIDTH-2:5],
                                  physical_pc[ 4:3] + 2'b1,
                                  3'b0};
  else
    physical_pc[PC_WIDTH-2:0] <= physical_pc[PC_WIDTH-2:0];
end

//l1_refill_icache_if_index
assign l1_refill_icache_if_index[PC_WIDTH-2:0] = virtual_pc[PC_WIDTH-2:0];
always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    virtual_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(ipctrl_l1_refill_req_for_gateclk)
    virtual_pc[PC_WIDTH-2:0] <= ipctrl_l1_refill_vpc[PC_WIDTH-2:0];
  else if(index_inc_vld)
    virtual_pc[PC_WIDTH-2:0] <= {virtual_pc[PC_WIDTH-2:5],
                                 virtual_pc[4:3] + 2'b1,
                                 3'b0};
  else
    virtual_pc[PC_WIDTH-2:0] <= virtual_pc[PC_WIDTH-2:0];
end

//index_inc_vld
//if ipb_refill_data_vld && tsize
//when index_inc_vld , pc[ 4:3] + 1
assign index_inc_vld = (
                         (refill_cur_state[3:0] == WFD1) && 
                         !icache_inv_busy && 
                         (ipb_l1_refill_trans_err ||
                          ipb_l1_refill_data_vld) && 
                         tsize
                       ) || 
                       (
                         (refill_cur_state[3:0] == WFD2) && 
                         !icache_inv_busy && 
                         (ipb_l1_refill_trans_err ||                         
                          ipb_l1_refill_data_vld)
                       ) || 
                       (
                         (refill_cur_state[3:0] == WFD3) && 
                         !icache_inv_busy && 
                         (ipb_l1_refill_trans_err ||
                          ipb_l1_refill_data_vld)
                       );                          
assign icache_inv_busy = ifctrl_l1_refill_inv_busy;
//l1_refill_icache_if_fifo
always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l1_refill_icache_if_fifo <= 1'b0;
  else if(refill_start && !ipctrl_l1_refill_chk_err)
    l1_refill_icache_if_fifo <= ifdp_l1_refill_fifo;
  else if(refill_start && ipctrl_l1_refill_chk_err)
    l1_refill_icache_if_fifo <= ipctrl_l1_refill_fifo;
  else
    l1_refill_icache_if_fifo <= l1_refill_icache_if_fifo;
end
// &Force("output","l1_refill_icache_if_fifo"); @322

// &Force("output","l1_refill_icache_if_chk_err"); @336


//l1_refill_icache_if_wr
assign l1_refill_icache_if_wr = refill_cur_state[2] && //WFDn
                                ipb_l1_refill_data_vld && 
                                tsize;
//l1_refill_icache_if_first
assign l1_refill_icache_if_first = (refill_cur_state[3:0] == WFD1) && 
                                   ipb_l1_refill_data_vld && 
                                   tsize;
//l1_refill_icache_if_last
assign l1_refill_icache_if_last  = (refill_cur_state[3:0] == WFD4) && 
                                   ipb_l1_refill_data_vld;

//==========================================================
//              The Precode Information
//==========================================================
// &Instance("ct_ifu_precode", "x_ct_ifu_precode"); @371
ct_ifu_precode  x_ct_ifu_precode (
  .inst_data                      (ipb_l1_refill_data_aft_v2trans),
  .pre_code                       (pre_code_info                 )
);

// &Connect( @372
//          .inst_data (ipb_l1_refill_data_aft_v2trans), @373
//          .pre_code  (pre_code_info                 ) @374
//         ); @375
assign l1_refill_icache_if_pre_code[31:0] = pre_code_info[31:0];

//==========================================================
//          Refill State Machine on/busy Signal
//==========================================================
//refill sm on state means refill sm not accept chgflw signal
//and ifctrl should stall PC
//refill sm busy state means refill sm not allow icache refill request
assign refill_sm_on   = (refill_cur_state[3:0] == REQ)     || 
                        (refill_cur_state[3:0] == CTC_INV) || 
                         refill_cur_state[2]; //WFDn
assign refill_sm_busy = (refill_cur_state[3:0] != IDLE);                    

//==========================================================
//               L1 Refill to IF Ctrl
//==========================================================
assign l1_refill_ifctrl_refill_on   = refill_sm_on;
//ipb_l1_refill_trans_err should also be treated as trans_cmplt
//It will set data valid of ifctrl and not let refill_on_stall set
assign l1_refill_ifctrl_trans_cmplt = ipb_refill_data_vld || 
                                      ipb_l1_refill_trans_err;
assign l1_refill_ifctrl_pc[PC_WIDTH-2:0] = virtual_pc[PC_WIDTH-2:0];
//L1 Refill Reissue will occur next cycle under two condition:
//(ifctrl will flop L1_Refill_Reissue and send it to pcgen)
//1.WFD4 state && ipb_refill_data_vld || 
//  WFD1 state && ipb_refill_data_vld && !tsize
//  which means l1 refill finish normally. 
//  And when l1 refill WFD4 && data_vld, 
//  pcgen_pc = refill_next_pc and it <not access icache>
//  Thus, next cycle, reissue refill_next_pc(if_pc at that time) 
//  and let it access icache
//2.WFDX state && ipb_l1_refill_trans_err 
//  a.if if_pc hit refill pc, if_data_vld = 1 and if_stall not set
//    Expt infor will send to ip stage 
//    Next cycle, reissue the next pc of hit pc
//    Because it not access icache 
//    Even not reissue next pc of hit pc, it will not make mistake
//    for expt will flush all following operation
//  b.if if_pc not hit refill pc, if_data_vld = 0 and if_stall set
//    Next cycle SM turn to INV_WFD and let inst fetch run normally
//    and the if_pc is the same as previous if_pc because of stall
//    Reissue it and let it access icache
//3.INV_WFDX
//  Inst fetch flow has changed already, 
//  and the expt infor will not send to if stage
//  expt infor also has no sense to if stage
assign l1_refill_ifctrl_reissue     = (refill_cur_state[3:0] == WFD1) && 
                                      ipb_refill_data_vld && 
                                      !tsize || 
                                      (refill_cur_state[3:0] == WFD4) && 
                                      ipb_refill_data_vld ||
                                      (refill_cur_state[2]) && //WFDn
                                      ipb_l1_refill_trans_err;

//Signal send to ifctrl for low power
assign l1_refill_ifctrl_idle  = (refill_cur_state[3:0] == IDLE);
assign l1_refill_ifctrl_start = refill_start;
assign l1_refill_ifctrl_ctc   = (refill_cur_state[3:0] == CTC_INV);
assign l1_refill_inv_wfd_back = inv_wfd_back;
assign l1_refill_ifctrl_start_for_gateclk  = refill_start_for_gateclk;

//==========================================================
//              L1 Refill to IF Data Path
//==========================================================
//l1_refill_ifdp_refill_on means inform if stage
//Inst data from refill state machine not icache
assign l1_refill_ifdp_refill_on        = refill_sm_on;
assign l1_refill_ifdp_inst_data[127:0] = ipb_l1_refill_data_aft_v2trans[127:0]; 
assign l1_refill_ifdp_precode[31:0]    = pre_code_info[31:0];
assign l1_refill_ifdp_tag_data[28:0]   = {ifdp_tag_valid, physical_pc[PC_WIDTH-2:11]};
assign ifdp_tag_valid                  = refill_cur_state[2] && //WFDn
                                         ipb_refill_data_vld;
assign l1_refill_ifdp_acc_err          = refill_cur_state[2] && //WFDn
                                         ipb_l1_refill_trans_err;

//==========================================================
//                L1 Refill to IP Stage
//==========================================================
assign l1_refill_ipctrl_busy = refill_sm_busy;
                                       
//==========================================================
//              Record Transfer Size and prot
//==========================================================
//Tsize
always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tsize <= 1'b0;
//  else if(vector_l1_refill_miss_req)
//    tsize <= vector_l1_refill_tsize;
  else if(ipctrl_l1_refill_miss_req)
    tsize <= ifdp_l1_refill_tsize;
  else
    tsize <= tsize;
end

//Caccheable
always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cacheable <= 1'b0;
  else if(ipctrl_l1_refill_miss_req)
    cacheable <= ifdp_l1_refill_cacheable;
  else
    cacheable <= cacheable;
end

//Bufferable
always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bufferable <= 1'b0;
  else if(ipctrl_l1_refill_miss_req)
    bufferable <= ifdp_l1_refill_bufferable;
  else
    bufferable <= bufferable;
end

//Supv_mode
always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    supv_mode <= 1'b0;
  else if(ipctrl_l1_refill_miss_req)
    supv_mode <= ifdp_l1_refill_supv_mode;
  else
    supv_mode <= supv_mode;
end

//Machine_mode
always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    machine_mode <= 1'b0;
  else if(ipctrl_l1_refill_miss_req)
    machine_mode <= ifdp_l1_refill_machine_mode;
  else
    machine_mode <= machine_mode;
end

//Secure
always @(posedge l1_refill_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    secure <= 1'b0;
  else if(ipctrl_l1_refill_miss_req)
    secure <= ifdp_l1_refill_secure;
  else
    secure <= secure;
end

//==========================================================
//                  Interface to BIU
//==========================================================
assign l1_refill_ipb_req          = (refill_cur_state[3:0] == REQ);
assign l1_refill_ipb_tsize        = tsize;
assign l1_refill_ipb_cacheable    = cacheable;
assign l1_refill_ipb_bufferable   = bufferable;
assign l1_refill_ipb_supv_mode    = supv_mode;
assign l1_refill_ipb_machine_mode = machine_mode;
assign l1_refill_ipb_secure       = secure;
assign l1_refill_ipb_ppc[39:0]    = {physical_pc[PC_WIDTH-2:0], 1'b0};
assign l1_refill_ipb_vpc[39:0]    = {virtual_pc[PC_WIDTH-2:0],1'b0}; 
assign l1_refill_ipb_ctc_inv      = (refill_cur_state[3:0] == CTC_INV);
assign l1_refill_ipb_pre_cancel   = pcgen_l1_refill_chgflw    || 
                                    ifctrl_l1_refill_inv_busy; 
//                                    vector_l1_refill_busy;

//==========================================================
//                 Interface to ipb
//==========================================================
assign l1_refill_ipb_refill_on = (refill_cur_state[3:0] == REQ) &&
                                 !change_flow;                               
assign l1_refill_ipb_req_pre   = (refill_cur_state[3:0] == IDLE) &&
                                 refill_start_for_gateclk        || 
                                 (refill_cur_state[3:0] == REQ)  && 
                                 !change_flow && !refill_grnt    && 
                                 !ifctrl_l1_refill_ins_inv;
assign l1_refill_ipb_req_for_gateclk = (refill_cur_state[3:0] == IDLE) &&
                                       refill_start_for_gateclk        || 
                                       (refill_cur_state[3:0] == REQ)  && 
                                       !ifctrl_l1_refill_ins_inv;

//==========================================================
//                 Interface to PMU
//==========================================================
assign ifu_hpcp_icache_miss_pre = (refill_cur_state[3:0] == WFD1) && 
                                  (ipb_refill_data_vld || ipb_refill_trans_err);

//Debug Infor
assign l1_refill_debug_refill_st[3:0] = refill_cur_state[3:0];

// &ModuleEnd; @601
endmodule


