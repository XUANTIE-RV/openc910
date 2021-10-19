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
module ct_ifu_pcgen(
  addrgen_pcgen_pc,
  addrgen_pcgen_pcload,
  cp0_ifu_icg_en,
  cp0_ifu_iwpe,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  had_ifu_pc,
  had_ifu_pcload,
  ibctrl_pcgen_ip_stall,
  ibctrl_pcgen_pc,
  ibctrl_pcgen_pcload,
  ibctrl_pcgen_pcload_vld,
  ibctrl_pcgen_way_pred,
  ifctrl_pcgen_chgflw_no_stall_mask,
  ifctrl_pcgen_chgflw_vld,
  ifctrl_pcgen_ins_icache_inv_done,
  ifctrl_pcgen_pcload_pc,
  ifctrl_pcgen_reissue_pcload,
  ifctrl_pcgen_stall,
  ifctrl_pcgen_stall_short,
  ifctrl_pcgen_way_pred,
  ifu_mmu_abort,
  ifu_mmu_va,
  ifu_mmu_va_vld,
  ifu_rtu_cur_pc,
  ifu_rtu_cur_pc_load,
  ipctrl_pcgen_branch_mistaken,
  ipctrl_pcgen_branch_taken,
  ipctrl_pcgen_chgflw_pc,
  ipctrl_pcgen_chgflw_pcload,
  ipctrl_pcgen_chgflw_way_pred,
  ipctrl_pcgen_chk_err_reissue,
  ipctrl_pcgen_h0_vld,
  ipctrl_pcgen_if_stall,
  ipctrl_pcgen_inner_way0,
  ipctrl_pcgen_inner_way1,
  ipctrl_pcgen_inner_way_pred,
  ipctrl_pcgen_reissue_pc,
  ipctrl_pcgen_reissue_pcload,
  ipctrl_pcgen_reissue_way_pred,
  ipctrl_pcgen_taken_pc,
  iu_ifu_chgflw_pc,
  iu_ifu_chgflw_vld,
  lbuf_pcgen_active,
  lbuf_pcgen_vld_mask,
  pad_yy_icg_scan_en,
  pcgen_addrgen_cancel,
  pcgen_bht_chgflw,
  pcgen_bht_chgflw_short,
  pcgen_bht_ifpc,
  pcgen_bht_pcindex,
  pcgen_bht_seq_read,
  pcgen_btb_chgflw,
  pcgen_btb_chgflw_higher_than_addrgen,
  pcgen_btb_chgflw_higher_than_if,
  pcgen_btb_chgflw_higher_than_ip,
  pcgen_btb_chgflw_short,
  pcgen_btb_index,
  pcgen_btb_stall,
  pcgen_btb_stall_short,
  pcgen_debug_chgflw,
  pcgen_debug_pcbus,
  pcgen_ibctrl_bju_chgflw,
  pcgen_ibctrl_cancel,
  pcgen_ibctrl_ibuf_flush,
  pcgen_ibctrl_lbuf_flush,
  pcgen_icache_if_chgflw,
  pcgen_icache_if_chgflw_bank0,
  pcgen_icache_if_chgflw_bank1,
  pcgen_icache_if_chgflw_bank2,
  pcgen_icache_if_chgflw_bank3,
  pcgen_icache_if_chgflw_short,
  pcgen_icache_if_gateclk_en,
  pcgen_icache_if_index,
  pcgen_icache_if_seq_data_req,
  pcgen_icache_if_seq_data_req_short,
  pcgen_icache_if_seq_tag_req,
  pcgen_icache_if_way_pred,
  pcgen_ifctrl_cancel,
  pcgen_ifctrl_pc,
  pcgen_ifctrl_pipe_cancel,
  pcgen_ifctrl_reissue,
  pcgen_ifctrl_way_pred,
  pcgen_ifctrl_way_pred_stall,
  pcgen_ifdp_inc_pc,
  pcgen_ifdp_pc,
  pcgen_ifdp_way_pred,
  pcgen_ipb_chgflw,
  pcgen_ipctrl_cancel,
  pcgen_ipctrl_pipe_cancel,
  pcgen_l0_btb_chgflw_mask,
  pcgen_l0_btb_chgflw_pc,
  pcgen_l0_btb_chgflw_vld,
  pcgen_l0_btb_if_pc,
  pcgen_l1_refill_chgflw,
  pcgen_sfp_pc,
  rtu_ifu_chgflw_pc,
  rtu_ifu_chgflw_vld,
  rtu_ifu_xx_dbgon,
  rtu_ifu_xx_expt_vld,
  vector_pcgen_pc,
  vector_pcgen_pcload,
  vector_pcgen_reset_on
);

// &Ports; @23
input   [38:0]  addrgen_pcgen_pc;                    
input           addrgen_pcgen_pcload;                
input           cp0_ifu_icg_en;                      
input           cp0_ifu_iwpe;                        
input           cp0_yy_clk_en;                       
input           cpurst_b;                            
input           forever_cpuclk;                      
input   [38:0]  had_ifu_pc;                          
input           had_ifu_pcload;                      
input           ibctrl_pcgen_ip_stall;               
input   [38:0]  ibctrl_pcgen_pc;                     
input           ibctrl_pcgen_pcload;                 
input           ibctrl_pcgen_pcload_vld;             
input   [1 :0]  ibctrl_pcgen_way_pred;               
input           ifctrl_pcgen_chgflw_no_stall_mask;   
input           ifctrl_pcgen_chgflw_vld;             
input           ifctrl_pcgen_ins_icache_inv_done;    
input   [38:0]  ifctrl_pcgen_pcload_pc;              
input           ifctrl_pcgen_reissue_pcload;         
input           ifctrl_pcgen_stall;                  
input           ifctrl_pcgen_stall_short;            
input   [1 :0]  ifctrl_pcgen_way_pred;               
input           ipctrl_pcgen_branch_mistaken;        
input           ipctrl_pcgen_branch_taken;           
input   [38:0]  ipctrl_pcgen_chgflw_pc;              
input           ipctrl_pcgen_chgflw_pcload;          
input   [1 :0]  ipctrl_pcgen_chgflw_way_pred;        
input           ipctrl_pcgen_chk_err_reissue;        
input           ipctrl_pcgen_h0_vld;                 
input           ipctrl_pcgen_if_stall;               
input           ipctrl_pcgen_inner_way0;             
input           ipctrl_pcgen_inner_way1;             
input   [1 :0]  ipctrl_pcgen_inner_way_pred;         
input   [38:0]  ipctrl_pcgen_reissue_pc;             
input           ipctrl_pcgen_reissue_pcload;         
input   [1 :0]  ipctrl_pcgen_reissue_way_pred;       
input   [38:0]  ipctrl_pcgen_taken_pc;               
input   [62:0]  iu_ifu_chgflw_pc;                    
input           iu_ifu_chgflw_vld;                   
input           lbuf_pcgen_active;                   
input           lbuf_pcgen_vld_mask;                 
input           pad_yy_icg_scan_en;                  
input   [38:0]  rtu_ifu_chgflw_pc;                   
input           rtu_ifu_chgflw_vld;                  
input           rtu_ifu_xx_dbgon;                    
input           rtu_ifu_xx_expt_vld;                 
input   [38:0]  vector_pcgen_pc;                     
input           vector_pcgen_pcload;                 
input           vector_pcgen_reset_on;               
output          ifu_mmu_abort;                       
output  [62:0]  ifu_mmu_va;                          
output          ifu_mmu_va_vld;                      
output  [38:0]  ifu_rtu_cur_pc;                      
output          ifu_rtu_cur_pc_load;                 
output          pcgen_addrgen_cancel;                
output          pcgen_bht_chgflw;                    
output          pcgen_bht_chgflw_short;              
output  [6 :0]  pcgen_bht_ifpc;                      
output  [9 :0]  pcgen_bht_pcindex;                   
output          pcgen_bht_seq_read;                  
output          pcgen_btb_chgflw;                    
output          pcgen_btb_chgflw_higher_than_addrgen; 
output          pcgen_btb_chgflw_higher_than_if;     
output          pcgen_btb_chgflw_higher_than_ip;     
output          pcgen_btb_chgflw_short;              
output  [9 :0]  pcgen_btb_index;                     
output          pcgen_btb_stall;                     
output          pcgen_btb_stall_short;               
output          pcgen_debug_chgflw;                  
output  [13:0]  pcgen_debug_pcbus;                   
output          pcgen_ibctrl_bju_chgflw;             
output          pcgen_ibctrl_cancel;                 
output          pcgen_ibctrl_ibuf_flush;             
output          pcgen_ibctrl_lbuf_flush;             
output          pcgen_icache_if_chgflw;              
output          pcgen_icache_if_chgflw_bank0;        
output          pcgen_icache_if_chgflw_bank1;        
output          pcgen_icache_if_chgflw_bank2;        
output          pcgen_icache_if_chgflw_bank3;        
output          pcgen_icache_if_chgflw_short;        
output          pcgen_icache_if_gateclk_en;          
output  [15:0]  pcgen_icache_if_index;               
output          pcgen_icache_if_seq_data_req;        
output          pcgen_icache_if_seq_data_req_short;  
output          pcgen_icache_if_seq_tag_req;         
output  [1 :0]  pcgen_icache_if_way_pred;            
output          pcgen_ifctrl_cancel;                 
output  [38:0]  pcgen_ifctrl_pc;                     
output          pcgen_ifctrl_pipe_cancel;            
output          pcgen_ifctrl_reissue;                
output  [1 :0]  pcgen_ifctrl_way_pred;               
output          pcgen_ifctrl_way_pred_stall;         
output  [38:0]  pcgen_ifdp_inc_pc;                   
output  [38:0]  pcgen_ifdp_pc;                       
output  [1 :0]  pcgen_ifdp_way_pred;                 
output          pcgen_ipb_chgflw;                    
output          pcgen_ipctrl_cancel;                 
output          pcgen_ipctrl_pipe_cancel;            
output          pcgen_l0_btb_chgflw_mask;            
output  [14:0]  pcgen_l0_btb_chgflw_pc;              
output          pcgen_l0_btb_chgflw_vld;             
output  [38:0]  pcgen_l0_btb_if_pc;                  
output          pcgen_l1_refill_chgflw;              
output  [16:0]  pcgen_sfp_pc;                        

// &Regs; @24
reg     [1 :0]  chgflw_way_pred;                     
reg     [1 :0]  chgflw_way_pred_flop;                
reg             dbg_dly_reg;                         
reg     [6 :0]  if_bht_pc;                           
reg     [38:0]  if_pc;                               
reg     [23:0]  if_pc_high_spe;                      
reg             if_pc_high_spe_vld;                  
reg             ifctrl_pcgen_stall_flop;             
reg     [6 :0]  ifpc_bht_chgflw_pre;                 
reg     [38:0]  ifpc_chgflw_pre;                     
reg     [38:0]  ifu_rtu_cur_pc;                      
reg             ifu_rtu_cur_pc_load;                 
reg     [1 :0]  inner_way_pred;                      
reg     [15:0]  pc_bus;                              
reg             pcgen_chgflw_flop;                   
reg             pcgen_ifctrl_way_pred_stall;         
reg     [1 :0]  way_pred_flop;                       
reg     [1 :0]  way_predict;                         

// &Wires; @25
wire    [38:0]  addrgen_pcgen_pc;                    
wire            addrgen_pcgen_pcload;                
wire            chgflw_higher_than_btb;              
wire            cp0_ifu_icg_en;                      
wire            cp0_ifu_iwpe;                        
wire            cp0_yy_clk_en;                       
wire            cpurst_b;                            
wire            dbg_cancel;                          
wire            dbg_dly_clk;                         
wire            dbg_dly_clk_en;                      
wire            forever_cpuclk;                      
wire    [38:0]  had_ifu_pc;                          
wire            had_ifu_pcload;                      
wire            ibctrl_pcgen_ip_stall;               
wire    [38:0]  ibctrl_pcgen_pc;                     
wire            ibctrl_pcgen_pcload;                 
wire            ibctrl_pcgen_pcload_vld;             
wire    [1 :0]  ibctrl_pcgen_way_pred;               
wire            ifctrl_pcgen_chgflw_no_stall_mask;   
wire            ifctrl_pcgen_chgflw_vld;             
wire            ifctrl_pcgen_ins_icache_inv_done;    
wire    [38:0]  ifctrl_pcgen_pcload_pc;              
wire            ifctrl_pcgen_reissue_pcload;         
wire            ifctrl_pcgen_stall;                  
wire            ifctrl_pcgen_stall_short;            
wire    [1 :0]  ifctrl_pcgen_way_pred;               
wire            ifu_mmu_abort;                       
wire    [62:0]  ifu_mmu_va;                          
wire    [23:0]  ifu_mmu_va_high;                     
wire            ifu_mmu_va_vld;                      
wire    [38:0]  inc_pc;                              
wire    [35:0]  inc_pc_hi;                           
wire    [1 :0]  inner_way_pred_default;              
wire            ipctrl_pcgen_branch_mistaken;        
wire            ipctrl_pcgen_branch_taken;           
wire    [38:0]  ipctrl_pcgen_chgflw_pc;              
wire            ipctrl_pcgen_chgflw_pcload;          
wire    [1 :0]  ipctrl_pcgen_chgflw_way_pred;        
wire            ipctrl_pcgen_chk_err_reissue;        
wire            ipctrl_pcgen_h0_vld;                 
wire            ipctrl_pcgen_if_stall;               
wire            ipctrl_pcgen_inner_way0;             
wire            ipctrl_pcgen_inner_way1;             
wire    [1 :0]  ipctrl_pcgen_inner_way_pred;         
wire    [38:0]  ipctrl_pcgen_reissue_pc;             
wire            ipctrl_pcgen_reissue_pcload;         
wire    [1 :0]  ipctrl_pcgen_reissue_way_pred;       
wire    [38:0]  ipctrl_pcgen_taken_pc;               
wire    [62:0]  iu_ifu_chgflw_pc;                    
wire            iu_ifu_chgflw_vld;                   
wire            lbuf_pcgen_active;                   
wire            lbuf_pcgen_vld_mask;                 
wire            pad_yy_icg_scan_en;                  
wire            pcgen_addrgen_cancel;                
wire            pcgen_bht_chgflw;                    
wire            pcgen_bht_chgflw_short;              
wire    [6 :0]  pcgen_bht_ifpc;                      
wire    [9 :0]  pcgen_bht_pcindex;                   
wire            pcgen_bht_seq_read;                  
wire            pcgen_btb_chgflw;                    
wire            pcgen_btb_chgflw_higher_than_addrgen; 
wire            pcgen_btb_chgflw_higher_than_if;     
wire            pcgen_btb_chgflw_higher_than_ip;     
wire            pcgen_btb_chgflw_short;              
wire    [9 :0]  pcgen_btb_index;                     
wire            pcgen_btb_stall;                     
wire            pcgen_btb_stall_short;               
wire            pcgen_chgflw;                        
wire            pcgen_chgflw_higher_than_ib;         
wire            pcgen_chgflw_short;                  
wire            pcgen_chgflw_without_l0_btb;         
wire            pcgen_debug_chgflw;                  
wire    [13:0]  pcgen_debug_pcbus;                   
wire            pcgen_ibctrl_bju_chgflw;             
wire            pcgen_ibctrl_cancel;                 
wire            pcgen_ibctrl_ibuf_flush;             
wire            pcgen_ibctrl_lbuf_flush;             
wire            pcgen_icache_if_chgflw;              
wire            pcgen_icache_if_chgflw_bank0;        
wire            pcgen_icache_if_chgflw_bank1;        
wire            pcgen_icache_if_chgflw_bank2;        
wire            pcgen_icache_if_chgflw_bank3;        
wire            pcgen_icache_if_chgflw_short;        
wire            pcgen_icache_if_gateclk_en;          
wire    [15:0]  pcgen_icache_if_index;               
wire            pcgen_icache_if_seq_data_req;        
wire            pcgen_icache_if_seq_data_req_short;  
wire            pcgen_icache_if_seq_tag_req;         
wire    [1 :0]  pcgen_icache_if_way_pred;            
wire            pcgen_ifctrl_cancel;                 
wire    [38:0]  pcgen_ifctrl_pc;                     
wire            pcgen_ifctrl_pipe_cancel;            
wire            pcgen_ifctrl_reissue;                
wire    [1 :0]  pcgen_ifctrl_way_pred;               
wire    [38:0]  pcgen_ifdp_inc_pc;                   
wire    [38:0]  pcgen_ifdp_pc;                       
wire    [1 :0]  pcgen_ifdp_way_pred;                 
wire            pcgen_ipb_chgflw;                    
wire            pcgen_ipctrl_cancel;                 
wire            pcgen_ipctrl_pipe_cancel;            
wire            pcgen_l0_btb_chgflw_mask;            
wire    [14:0]  pcgen_l0_btb_chgflw_pc;              
wire            pcgen_l0_btb_chgflw_vld;             
wire    [38:0]  pcgen_l0_btb_if_pc;                  
wire            pcgen_l1_refill_chgflw;              
wire    [16:0]  pcgen_sfp_pc;                        
wire    [38:0]  rtu_cur_pc;                          
wire            rtu_cur_pc_load;                     
wire    [38:0]  rtu_ifu_chgflw_pc;                   
wire            rtu_ifu_chgflw_vld;                  
wire            rtu_ifu_xx_dbgon;                    
wire            rtu_ifu_xx_expt_vld;                 
wire            rtu_pcload_clk;                      
wire            rtu_pcload_clk_en;                   
wire    [38:0]  vector_pcgen_pc;                     
wire            vector_pcgen_pcload;                 
wire            vector_pcgen_reset_on;               


parameter PC_WIDTH = 40;
// &Force("bus","ipctrl_pcgen_taken_pc",38,0); @28
//==========================================================
//                PC MUX of Change Flow
//==========================================================
//The Priority of PC is as following:
//  PC from Had
//  PC from Vector
//  PC from RTU
//  PC from IU
//  PC from Addrgen
//  PC from IFU IB Stage Change Flow
//  PC from IFU IP Stage Reissue
//  PC from IFU IP Stage Change Flow
//  PC from IFU IF Stage Reissue
//  PC Increase
// &CombBeg; @43
always @( ipctrl_pcgen_chgflw_pcload
       or ifctrl_pcgen_chgflw_no_stall_mask
       or ipctrl_pcgen_chgflw_pc[38:0]
       or if_pc[38:0]
       or rtu_ifu_chgflw_vld
       or ibctrl_pcgen_pcload
       or vector_pcgen_pc[38:0]
       or had_ifu_pc[38:0]
       or vector_pcgen_pcload
       or addrgen_pcgen_pc[38:0]
       or ifctrl_pcgen_pcload_pc[38:0]
       or addrgen_pcgen_pcload
       or ipctrl_pcgen_reissue_pc[38:0]
       or iu_ifu_chgflw_pc[38:0]
       or rtu_ifu_chgflw_pc[38:0]
       or had_ifu_pcload
       or ibctrl_pcgen_pc[38:0]
       or iu_ifu_chgflw_vld
       or ipctrl_pcgen_reissue_pcload)
begin
if(had_ifu_pcload)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = had_ifu_pc[PC_WIDTH-2:0];
else if(vector_pcgen_pcload)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = vector_pcgen_pc[PC_WIDTH-2:0];
else if(rtu_ifu_chgflw_vld)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = rtu_ifu_chgflw_pc[PC_WIDTH-2:0];
else if(iu_ifu_chgflw_vld)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = iu_ifu_chgflw_pc[PC_WIDTH-2:0];
else if(addrgen_pcgen_pcload)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = addrgen_pcgen_pc[PC_WIDTH-2:0];
else if(ibctrl_pcgen_pcload)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = ibctrl_pcgen_pc[PC_WIDTH-2:0];
else if(ipctrl_pcgen_reissue_pcload)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = ipctrl_pcgen_reissue_pc[PC_WIDTH-2:0];
else if(ipctrl_pcgen_chgflw_pcload)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = ipctrl_pcgen_chgflw_pc[PC_WIDTH-2:0];
else if(ifctrl_pcgen_chgflw_no_stall_mask)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = ifctrl_pcgen_pcload_pc[PC_WIDTH-2:0];
else //(ifctrl_pcgen_reissue_pcload)
  ifpc_chgflw_pre[PC_WIDTH-2:0] = if_pc[PC_WIDTH-2:0];
// &CombEnd; @64
end

// &CombBeg; @66
always @( ipctrl_pcgen_chgflw_pcload
       or ifctrl_pcgen_chgflw_no_stall_mask
       or ipctrl_pcgen_reissue_pc[15:0]
       or ifctrl_pcgen_pcload_pc[15:0]
       or ibctrl_pcgen_pcload
       or iu_ifu_chgflw_pc[15:0]
       or inc_pc[15:0]
       or addrgen_pcgen_pcload
       or addrgen_pcgen_pc[15:0]
       or ibctrl_pcgen_pc[15:0]
       or ipctrl_pcgen_chgflw_pc[15:0]
       or iu_ifu_chgflw_vld
       or ipctrl_pcgen_reissue_pcload)
begin
if(iu_ifu_chgflw_vld)
  pc_bus[15:0] = iu_ifu_chgflw_pc[15:0];
else if(addrgen_pcgen_pcload)
  pc_bus[15:0] = addrgen_pcgen_pc[15:0];
else if(ibctrl_pcgen_pcload)
  pc_bus[15:0] = ibctrl_pcgen_pc[15:0];
else if(ipctrl_pcgen_reissue_pcload)
  pc_bus[15:0] = ipctrl_pcgen_reissue_pc[15:0];
else if(ipctrl_pcgen_chgflw_pcload)
  pc_bus[15:0] = ipctrl_pcgen_chgflw_pc[15:0];
else if(ifctrl_pcgen_chgflw_no_stall_mask)
  pc_bus[15:0] = ifctrl_pcgen_pcload_pc[15:0];
else
  pc_bus[15:0] = inc_pc[15:0];
// &CombEnd; @81
end

assign pcgen_ifctrl_reissue = had_ifu_pcload || 
                              vector_pcgen_pcload || 
                              rtu_ifu_chgflw_vld;

//-------------------inc_pc[PC_WIDTH-2:0]---------------------------
assign inc_pc_hi[35:0]      = {if_pc[PC_WIDTH-2:3]} + {35'b0, !ifctrl_pcgen_reissue_pcload};
assign inc_pc[PC_WIDTH-2:0] = {
                                inc_pc_hi[35:0], 
                                {3{ifctrl_pcgen_reissue_pcload}} & if_pc[2:0]
                              };
assign pcgen_ifdp_inc_pc[PC_WIDTH-2:0] = inc_pc[PC_WIDTH-2:0];
//==========================================================
//                    IF Stage PC
//==========================================================
//The PC Will Be Used in IF Stage
//IF     Chgflw : if_pc = pc_bus
//ELSE IF stall : if_pc = if_pc
//ELSE          : if_pc = pc_bus
//always @(posedge forever_cpuclk or negedge cpurst_b)
//begin
//  if(!cpurst_b)
//    if_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    if_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(pcgen_chgflw)
    if_pc[PC_WIDTH-2:0] <= ifpc_chgflw_pre[PC_WIDTH-2:0];//Change Flow PC
  else if(!ifctrl_pcgen_stall)
    if_pc[PC_WIDTH-2:0] <= inc_pc[PC_WIDTH-2:0];//Increase PC
  else
    if_pc[PC_WIDTH-2:0] <= if_pc[PC_WIDTH-2:0]; //Stall IF PC
end

//pc high is only for mmu 
//when iu chgflw ,we should update pc high,
//when inc pc,we should update pc high
//only these two situation will cause bit[63:39] different 
//from bit[38]
always @(posedge forever_cpuclk or negedge cpurst_b)
begin 
  if(!cpurst_b) begin
    if_pc_high_spe[23:0] <= 24'b0;
    if_pc_high_spe_vld   <= 1'b0;
  end
//  else if(had_ifu_pcload || vector_pcgen_pcload 
//       || rtu_ifu_chgflw_vld  || vector_pcgen_vpn_valid) begin
  else if(had_ifu_pcload || vector_pcgen_pcload || rtu_ifu_chgflw_vld) begin
    if_pc_high_spe[23:0] <= 24'b0;
    if_pc_high_spe_vld   <= 1'b0;
  end
  else if(iu_ifu_chgflw_vld) begin
    if_pc_high_spe[23:0] <= iu_ifu_chgflw_pc[62:39];
    if_pc_high_spe_vld   <= 1'b1;
  end
  else if(addrgen_pcgen_pcload || ibctrl_pcgen_pcload ||
          ipctrl_pcgen_chgflw_pcload || ipctrl_pcgen_reissue_pcload ||
          ifctrl_pcgen_chgflw_vld) begin
    if_pc_high_spe[23:0] <= 24'b0;

    if_pc_high_spe_vld   <= 1'b0;
  end
  else if (ifctrl_pcgen_reissue_pcload || !ifctrl_pcgen_stall) begin
    if_pc_high_spe[23:0] <= 24'b0;
    if_pc_high_spe_vld   <= 1'b0;
  end
  else begin
    if_pc_high_spe[23:0] <= if_pc_high_spe[23:0];
    if_pc_high_spe_vld   <= if_pc_high_spe_vld;
  end
end

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    if_bht_pc[6:0] <= 7'b0;
  else if(pcgen_chgflw)
    if_bht_pc[6:0] <= ifpc_bht_chgflw_pre[6:0];//Change Flow PC
  else if(!ifctrl_pcgen_stall)
    if_bht_pc[6:0] <= inc_pc[6:0];//Increase PC
  else
    if_bht_pc[6:0] <= if_bht_pc[6:0]; //Stall IF PC
end

// &CombBeg; @185
always @( ipctrl_pcgen_chgflw_pcload
       or ifctrl_pcgen_chgflw_no_stall_mask
       or ipctrl_pcgen_reissue_pc[6:0]
       or ifctrl_pcgen_pcload_pc[6:0]
       or ipctrl_pcgen_h0_vld
       or ipctrl_pcgen_chgflw_pc[6:0]
       or rtu_ifu_chgflw_vld
       or ibctrl_pcgen_pcload
       or vector_pcgen_pcload
       or rtu_ifu_chgflw_pc[6:0]
       or addrgen_pcgen_pcload
       or if_pc[6:0]
       or ibctrl_pcgen_pc[6:0]
       or had_ifu_pcload
       or had_ifu_pc[6:0]
       or addrgen_pcgen_pc[6:0]
       or iu_ifu_chgflw_vld
       or iu_ifu_chgflw_pc[6:0]
       or ipctrl_pcgen_reissue_pcload
       or vector_pcgen_pc[6:0])
begin
if(had_ifu_pcload)
  ifpc_bht_chgflw_pre[6:0] = had_ifu_pc[6:0];
else if(vector_pcgen_pcload)
  ifpc_bht_chgflw_pre[6:0] = vector_pcgen_pc[6:0];
else if(rtu_ifu_chgflw_vld)
  ifpc_bht_chgflw_pre[6:0] = rtu_ifu_chgflw_pc[6:0];
else if(iu_ifu_chgflw_vld)
  ifpc_bht_chgflw_pre[6:0] = iu_ifu_chgflw_pc[6:0];
else if(addrgen_pcgen_pcload)
  ifpc_bht_chgflw_pre[6:0] = addrgen_pcgen_pc[6:0];
else if(ibctrl_pcgen_pcload)
  ifpc_bht_chgflw_pre[6:0] = ibctrl_pcgen_pc[6:0];
else if(ipctrl_pcgen_reissue_pcload && ipctrl_pcgen_h0_vld)
  ifpc_bht_chgflw_pre[6:0] = {{ipctrl_pcgen_reissue_pc[6:3] -4'b1}, 
                               ipctrl_pcgen_reissue_pc[2:0]};
else if(ipctrl_pcgen_reissue_pcload && !ipctrl_pcgen_h0_vld)
  ifpc_bht_chgflw_pre[6:0] = ipctrl_pcgen_reissue_pc[6:0];
else if(ipctrl_pcgen_chgflw_pcload)
  ifpc_bht_chgflw_pre[6:0] = ipctrl_pcgen_chgflw_pc[6:0];
else if(ifctrl_pcgen_chgflw_no_stall_mask)
  ifpc_bht_chgflw_pre[6:0] = ifctrl_pcgen_pcload_pc[6:0];
else //(ifctrl_pcgen_reissue_pcload)
  ifpc_bht_chgflw_pre[6:0] = if_pc[6:0];
// &CombEnd; @209
end

assign pcgen_ifctrl_pc[PC_WIDTH-2:0] = if_pc[PC_WIDTH-2:0];
assign pcgen_ifdp_pc[PC_WIDTH-2:0]   = if_pc[PC_WIDTH-2:0];
assign pcgen_sfp_pc[16:0]            = if_pc[19:3];

//-------------------pcgen_chgflw---------------------------
assign pcgen_chgflw = had_ifu_pcload || 
                      vector_pcgen_pcload ||
                      rtu_ifu_chgflw_vld ||
                      iu_ifu_chgflw_vld ||
                      addrgen_pcgen_pcload ||
                      ibctrl_pcgen_pcload ||
                      ipctrl_pcgen_chgflw_pcload ||
                      ipctrl_pcgen_reissue_pcload ||
                      ifctrl_pcgen_reissue_pcload ||
                      ifctrl_pcgen_chgflw_vld;
                  
assign pcgen_chgflw_without_l0_btb = had_ifu_pcload || 
                                     vector_pcgen_pcload ||
                                     rtu_ifu_chgflw_vld ||
                                     iu_ifu_chgflw_vld ||
                                     addrgen_pcgen_pcload ||
                                     ibctrl_pcgen_pcload ||
                                     ipctrl_pcgen_chgflw_pcload ||
                                     ipctrl_pcgen_reissue_pcload ||
                                     ifctrl_pcgen_reissue_pcload;

assign pcgen_chgflw_short = pcgen_chgflw_without_l0_btb ||
                            ifctrl_pcgen_chgflw_no_stall_mask;

//==========================================================
//                  Way Predict
//==========================================================
//The Way predict information
//IF      Chgflw      : way predict = chgflw way predict
//ELSE IF Stall       : way_predict = way_predict
//ELSE IF Chgflw Flop : way_predict = chgflw way predict flop
//ELSE                : way_predict = inner way predict
// &CombBeg; @248
always @( cp0_ifu_iwpe
       or ifctrl_pcgen_stall_flop
       or pcgen_chgflw_flop
       or inner_way_pred[1:0]
       or way_pred_flop[1:0]
       or ifctrl_pcgen_stall
       or pcgen_chgflw
       or chgflw_way_pred[1:0]
       or inc_pc[4:3]
       or chgflw_way_pred_flop[1:0])
begin
if(!cp0_ifu_iwpe)//not enable way_pred 
  way_predict[1:0] = 2'b11;
else if(pcgen_chgflw)
  way_predict[1:0] = chgflw_way_pred[1:0];
else if(ifctrl_pcgen_stall|| ifctrl_pcgen_stall_flop)
  way_predict[1:0] = way_pred_flop[1:0]; 
else if(pcgen_chgflw_flop && !(inc_pc[4:3] == 2'b00))
  way_predict[1:0] = chgflw_way_pred_flop[1:0];
else
  way_predict[1:0] = inner_way_pred[1:0];
// &CombEnd; @259
end

//==========================================================
//               Stall flop
//==========================================================
//pcgen_ifctrl_way_pred_stall used to close icache read
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifctrl_pcgen_stall_flop <= 1'b0;
  else
    ifctrl_pcgen_stall_flop <= ifctrl_pcgen_stall;
end

//==========================================================
//            Way_Predict of Change Flow
//==========================================================
//The Priority of Way Predict Information:
//  Way_pred from Change Flow which has higher priority than ib stage
//  Way_pred from ib stage(Ind-BTB Miss)
//  Way_pred from ip stage Reissue
//  Way_pred from ip stage Change Flow(BTB)
//  Way_pred from Change Flow which has lower priority than ip stage
// &CombBeg; @282
always @( ipctrl_pcgen_chgflw_pcload
       or ifctrl_pcgen_way_pred[1:0]
       or ibctrl_pcgen_pcload
       or ipctrl_pcgen_chgflw_way_pred[1:0]
       or ibctrl_pcgen_way_pred[1:0]
       or ipctrl_pcgen_reissue_way_pred[1:0]
       or pcgen_chgflw_higher_than_ib
       or ipctrl_pcgen_reissue_pcload)
begin
if(pcgen_chgflw_higher_than_ib)
  chgflw_way_pred[1:0] = 2'b11;
else if(ibctrl_pcgen_pcload)
  chgflw_way_pred[1:0] = ibctrl_pcgen_way_pred[1:0];
else if(ipctrl_pcgen_chgflw_pcload)
  chgflw_way_pred[1:0] = ipctrl_pcgen_chgflw_way_pred[1:0];
else if(ipctrl_pcgen_reissue_pcload)
  chgflw_way_pred[1:0] = ipctrl_pcgen_reissue_way_pred[1:0];
else
  chgflw_way_pred[1:0] = ifctrl_pcgen_way_pred[1:0];
// &CombEnd; @293
end

//-------------pcgen_chgflw_higher_than_ib------------------
assign pcgen_chgflw_higher_than_ib = had_ifu_pcload || 
                                     vector_pcgen_pcload ||
                                     rtu_ifu_chgflw_vld ||
                                     iu_ifu_chgflw_vld ||
                                     addrgen_pcgen_pcload;

//==========================================================
//            Way_Predict of Change Flow Flop
//==========================================================
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pcgen_chgflw_flop         <= 1'b0;
    chgflw_way_pred_flop[1:0] <= 2'b00;
  end
  else if(pcgen_chgflw)
  begin
    pcgen_chgflw_flop         <= 1'b1;
    chgflw_way_pred_flop[1:0] <= chgflw_way_pred[1:0];
  end
  else if(ifctrl_pcgen_stall)
  begin
    pcgen_chgflw_flop         <= pcgen_chgflw_flop;
    chgflw_way_pred_flop[1:0] <= chgflw_way_pred_flop[1:0];
  end
  else
  begin
    pcgen_chgflw_flop         <= 1'b0;
    chgflw_way_pred_flop[1:0] <= 2'b11;
  end
end
  
//==========================================================
//            Way_Predict of Inner Line
//==========================================================
// &CombBeg; @332
always @( inner_way_pred_default[1:0]
       or ipctrl_pcgen_inner_way_pred[1:0]
       or inc_pc[4:3])
begin
if(inc_pc[4:3] == 2'b10 || inc_pc[4:3] == 2'b11)
  inner_way_pred[1:0] = ipctrl_pcgen_inner_way_pred[1:0];
else
  inner_way_pred[1:0] = inner_way_pred_default[1:0];
// &CombEnd; @337
end

assign inner_way_pred_default[1:0] = (ipctrl_pcgen_inner_way1 || ipctrl_pcgen_inner_way0)
                                   ? {ipctrl_pcgen_inner_way1, ipctrl_pcgen_inner_way0}
                                   : 2'b11;

//==========================================================
//            Way_Predict Stall to If_ctrl
//==========================================================
//pcgen_ifctrl_way_pred_stall used to close icache read
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pcgen_ifctrl_way_pred_stall <= 1'b0;
  else
    pcgen_ifctrl_way_pred_stall <= (way_predict[1:0] == 2'b00);
end

//==========================================================
//                  Cancel Signal
//==========================================================
//-----------------------IF Cancel--------------------------
assign pcgen_ifctrl_cancel = pcgen_chgflw_without_l0_btb ||
                             rtu_ifu_xx_expt_vld || 
                             dbg_cancel;
// &Force("output","pcgen_ifctrl_cancel"); @362
//Pipe_cancel is used for forming if_ip_vld, 
//whose Priority is Higher than ip_if_stall
//Deal with the condition IP Chgflw Valid, 
//While IP need if_ip pipe reg stall
//lbuf_chgflw is formed by flop
//When before flop, lbuf cancel pipe line before
assign pcgen_ifctrl_pipe_cancel = pcgen_ipctrl_cancel || 
                                  lbuf_pcgen_vld_mask ||
                                  ipctrl_pcgen_chk_err_reissue || 
                                  ipctrl_pcgen_chgflw_pcload && 
                                  !ipctrl_pcgen_if_stall;

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    way_pred_flop[1:0] <= 2'b00;
  else
    way_pred_flop[1:0] <= way_predict[1:0];
end
assign pcgen_ifctrl_way_pred[1:0] = way_pred_flop[1:0];
assign pcgen_ifdp_way_pred[1:0]   = way_pred_flop[1:0];
    
//-----------------------IP Cancel--------------------------
assign pcgen_ipctrl_cancel      = had_ifu_pcload || 
                                  vector_pcgen_pcload ||
                                  rtu_ifu_chgflw_vld ||
                                  iu_ifu_chgflw_vld ||
                                  addrgen_pcgen_pcload || 
                                  ibctrl_pcgen_pcload ||
                                  rtu_ifu_xx_expt_vld || 
                                  dbg_cancel;
// &Force("output","pcgen_ipctrl_cancel"); @394
assign pcgen_ipctrl_pipe_cancel = had_ifu_pcload || 
                                  vector_pcgen_pcload ||
                                  rtu_ifu_chgflw_vld ||
                                  iu_ifu_chgflw_vld ||
                                  addrgen_pcgen_pcload ||
                                  rtu_ifu_xx_expt_vld || 
                                  dbg_cancel || 
                                  lbuf_pcgen_vld_mask || 
                                  ibctrl_pcgen_pcload && 
                                  !ibctrl_pcgen_ip_stall;

//-----------------------IB Cancel--------------------------
assign pcgen_ibctrl_cancel      = had_ifu_pcload || 
                                  vector_pcgen_pcload ||
                                  rtu_ifu_chgflw_vld ||
                                  iu_ifu_chgflw_vld ||
                                  rtu_ifu_xx_expt_vld || 
                                  dbg_cancel;
// &Force("output","pcgen_ibctrl_cancel"); @413
//IDU will deal with the condition of iu_chgflw
//vec_pcload will not pipe inst down

//-------------------Addrgen Cancel-------------------------
assign pcgen_addrgen_cancel     = had_ifu_pcload || 
                                  vector_pcgen_pcload ||
                                  rtu_ifu_chgflw_vld ||
                                  iu_ifu_chgflw_vld  ||
                                  addrgen_pcgen_pcload; 
//When multi_core icache ins inv done
//Lbuf should be flushed
assign pcgen_ibctrl_bju_chgflw  = iu_ifu_chgflw_vld;
assign pcgen_ibctrl_lbuf_flush  = had_ifu_pcload || 
                                  vector_pcgen_pcload || 
                                  ifctrl_pcgen_ins_icache_inv_done && !lbuf_pcgen_active || 
                                  rtu_ifu_chgflw_vld ||
                                  rtu_ifu_xx_expt_vld || 
                                  dbg_cancel;
assign pcgen_ibctrl_ibuf_flush  = had_ifu_pcload || 
                                  vector_pcgen_pcload ||
                                  rtu_ifu_chgflw_vld ||
                                  iu_ifu_chgflw_vld ||
                                  rtu_ifu_xx_expt_vld || 
                                  dbg_cancel;

// &Instance("gated_clk_cell","x_dbg_dly_clk"); @441
gated_clk_cell  x_dbg_dly_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dbg_dly_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dbg_dly_clk_en    ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @442
//           .clk_out        (dbg_dly_clk),//Out Clock @443
//           .external_en    (1'b0), @444
//           .global_en      (cp0_yy_clk_en), @445
//           .local_en       (dbg_dly_clk_en),//Local Condition @446
//           .module_en      (cp0_ifu_icg_en) @447
//         ); @448
assign dbg_dly_clk_en = rtu_ifu_xx_dbgon || dbg_dly_reg;

always @(posedge dbg_dly_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dbg_dly_reg <= 1'b0;
  else
    dbg_dly_reg <= rtu_ifu_xx_dbgon;
end
assign dbg_cancel = !dbg_dly_reg && rtu_ifu_xx_dbgon;                               

//==========================================================
//                  Interface with MMU
//==========================================================
assign ifu_mmu_va_high[23:0] = (if_pc_high_spe_vld)
                             ? if_pc_high_spe[23:0]
                             : {24{if_pc[38]}};
assign ifu_mmu_va[62:0]      = {ifu_mmu_va_high[23:0],if_pc[PC_WIDTH-2:0]};


//When IF Stage cancel, MMU Request should also be canceled
assign ifu_mmu_abort  = pcgen_ifctrl_cancel || !cp0_yy_clk_en || vector_pcgen_reset_on;
assign ifu_mmu_va_vld = 1'b1;

//==========================================================
//                  Interface with RTU
//==========================================================
assign rtu_cur_pc_load  = had_ifu_pcload || 
                          vector_pcgen_pcload;
assign rtu_cur_pc[PC_WIDTH-2:0] = had_ifu_pcload
                                ? had_ifu_pc[PC_WIDTH-2:0] 
                                : vector_pcgen_pc[PC_WIDTH-2:0];
//Gate Clk
// &Instance("gated_clk_cell","x_rtu_pcload_clk"); @482
gated_clk_cell  x_rtu_pcload_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rtu_pcload_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rtu_pcload_clk_en ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @483
//           .clk_out        (rtu_pcload_clk),//Out Clock @484
//           .external_en    (1'b0), @485
//           .global_en      (cp0_yy_clk_en), @486
//           .local_en       (rtu_pcload_clk_en),//Local Condition @487
//           .module_en      (cp0_ifu_icg_en) @488
//         ); @489
assign rtu_pcload_clk_en = rtu_cur_pc_load || 
                           ifu_rtu_cur_pc_load;

//ifu_rtu pc load flop to gurantee rtu timing
always @(posedge rtu_pcload_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifu_rtu_cur_pc_load <= 1'b0;
  else if(rtu_cur_pc_load)
    ifu_rtu_cur_pc_load <= 1'b1;
  else
    ifu_rtu_cur_pc_load <= 1'b0;
end

always @(posedge rtu_pcload_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifu_rtu_cur_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(rtu_cur_pc_load)
    ifu_rtu_cur_pc[PC_WIDTH-2:0] <= rtu_cur_pc[PC_WIDTH-2:0];
  else
    ifu_rtu_cur_pc[PC_WIDTH-2:0] <= ifu_rtu_cur_pc[PC_WIDTH-2:0];
end

// &Force("output","ifu_rtu_cur_pc_load"); @514
// &Force("output","ifu_rtu_cur_pc"); @515

//==========================================================
//                  Interface with BTB
//==========================================================
assign pcgen_btb_index[9:0]   = pc_bus[12:3];
assign pcgen_btb_stall        = ifctrl_pcgen_stall;
assign pcgen_btb_stall_short  = ifctrl_pcgen_stall_short;
assign pcgen_btb_chgflw       = pcgen_chgflw;
assign pcgen_btb_chgflw_short = pcgen_chgflw_short;
assign pcgen_btb_chgflw_higher_than_if      = had_ifu_pcload || 
                                              vector_pcgen_pcload || 
                                              rtu_ifu_chgflw_vld || 
                                              iu_ifu_chgflw_vld || 
                                              addrgen_pcgen_pcload || 
                                              ibctrl_pcgen_pcload  ||
                                              ipctrl_pcgen_chgflw_pcload ||
                                              ipctrl_pcgen_reissue_pcload ||
                                              ifctrl_pcgen_reissue_pcload;

assign pcgen_btb_chgflw_higher_than_ip      = had_ifu_pcload || 
                                              vector_pcgen_pcload || 
                                              rtu_ifu_chgflw_vld || 
                                              iu_ifu_chgflw_vld || 
                                              addrgen_pcgen_pcload || 
                                              ibctrl_pcgen_pcload;
assign pcgen_btb_chgflw_higher_than_addrgen = had_ifu_pcload || 
                                              vector_pcgen_pcload || 
                                              rtu_ifu_chgflw_vld || 
                                              iu_ifu_chgflw_vld;
//==========================================================
//                  Interface with L0 BTB
//==========================================================
//four type chgflw will trigger L0 BTB read
//1. bju mispred chgflw
//2. ib ras pcload
//3. ip branch pcload
//4. if l0 btb pcload
assign pcgen_l0_btb_chgflw_vld  = ifctrl_pcgen_chgflw_vld
                               || ipctrl_pcgen_branch_taken
                               || ibctrl_pcgen_pcload_vld
                               || iu_ifu_chgflw_vld;
//for timing consideration,the 6 types of chgflw will mask L0 BTB read
//1. HAD pcload
//2. vector pcload
//3. rtu chgflw
//4. addrgen pcload
//5. ip reissue pcload
//6. if reissue pcload
assign pcgen_l0_btb_chgflw_mask = had_ifu_pcload
                               || vector_pcgen_pcload
                               || rtu_ifu_chgflw_vld
                               || addrgen_pcgen_pcload
                               || iu_ifu_chgflw_vld
                               || ipctrl_pcgen_branch_mistaken
                               || ipctrl_pcgen_reissue_pcload
                               || ifctrl_pcgen_reissue_pcload;
// &Force("output","pcgen_l0_btb_chgflw_mask") @573

//even though the priority of if reissue pcload is lower than ip/ib/iu pcload,
//for timing consideration,we still put it before them
//&CombBeg;
//if(ibctrl_pcgen_pcload)
//  pcgen_l0_btb_chgflw_pc[10:0] = ibctrl_pcgen_pc[10:0];
//else if(ipctrl_pcgen_branch_taken)
//  pcgen_l0_btb_chgflw_pc[10:0] = ipctrl_pcgen_taken_pc[10:0];
//else if(ifctrl_pcgen_chgflw_no_stall_mask) //for timing
//  pcgen_l0_btb_chgflw_pc[10:0] = ifctrl_pcgen_pcload_pc[10:0];
//else
//  pcgen_l0_btb_chgflw_pc[10:0] = inc_pc[10:0];
//&CombEnd;


assign pcgen_l0_btb_chgflw_pc[14:0] = (ibctrl_pcgen_pcload || ipctrl_pcgen_branch_taken)
                                      ? (ibctrl_pcgen_pcload)
                                        ? ibctrl_pcgen_pc[14:0]
                                        : ipctrl_pcgen_taken_pc[14:0]
                                      : (ifctrl_pcgen_chgflw_no_stall_mask)
                                        ? ifctrl_pcgen_pcload_pc[14:0]
                                        : inc_pc[14:0];


assign pcgen_l0_btb_if_pc[PC_WIDTH-2:0] = if_pc[PC_WIDTH-2:0];
// &Force("input","ipctrl_pcgen_branch_mistaken"); @600

//==========================================================
//                  Interface with BHT
//==========================================================
assign pcgen_bht_pcindex[9:0]  = pc_bus[12:3];
assign pcgen_bht_chgflw        = pcgen_chgflw;
assign pcgen_bht_chgflw_short  = pcgen_chgflw_short;
assign pcgen_bht_seq_read      = if_pc[6] ^ inc_pc[6];
assign pcgen_bht_ifpc[6:0]     = if_bht_pc[6:0];

//==========================================================
//                  Interface with Icache
//==========================================================
assign pcgen_icache_if_chgflw        = pcgen_chgflw;
assign pcgen_icache_if_chgflw_short  = pcgen_chgflw_short;
assign pcgen_icache_if_seq_data_req  = !ifctrl_pcgen_stall;
assign pcgen_icache_if_seq_data_req_short = !ifctrl_pcgen_stall_short;
assign pcgen_icache_if_seq_tag_req   = !ifctrl_pcgen_stall && 
                                       (pc_bus[4:3] == 2'b00);                                 
assign pcgen_icache_if_gateclk_en    = pcgen_chgflw_short || 
                                       !ifctrl_pcgen_stall_short;
assign pcgen_icache_if_way_pred[1:0] = way_predict[1:0];
assign pcgen_icache_if_index[15:0]   = pc_bus[15:0];
//Interface to icache refill
assign pcgen_l1_refill_chgflw        = pcgen_chgflw;
assign pcgen_ipb_chgflw              = pcgen_chgflw;
//ICACHE BANK USE
assign chgflw_higher_than_btb        = iu_ifu_chgflw_vld    ||
                                       addrgen_pcgen_pcload || 
                                       ibctrl_pcgen_pcload; 
assign pcgen_icache_if_chgflw_bank0  = ipctrl_pcgen_branch_taken && !chgflw_higher_than_btb
                                     ? (ipctrl_pcgen_taken_pc[2:1] == 2'b00)
                                     : pcgen_chgflw;
assign pcgen_icache_if_chgflw_bank1  = ipctrl_pcgen_branch_taken && !chgflw_higher_than_btb
                                     ? (ipctrl_pcgen_taken_pc[2] == 1'b0)
                                     : pcgen_chgflw;
assign pcgen_icache_if_chgflw_bank2  = ipctrl_pcgen_branch_taken && !chgflw_higher_than_btb
                                     ? !(ipctrl_pcgen_taken_pc[2:1] == 2'b11)
                                     : pcgen_chgflw;
assign pcgen_icache_if_chgflw_bank3  = pcgen_chgflw;                                     


//Debug infor
assign pcgen_debug_chgflw      = pcgen_chgflw;
assign pcgen_debug_pcbus[13:0] = pc_bus[13:0];

// &ModuleEnd; @654
endmodule


