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
module ct_ifu_debug(
  cpurst_b,
  forever_cpuclk,
  had_rtu_xx_jdbreq,
  ibctrl_debug_buf_stall,
  ibctrl_debug_bypass_inst_vld,
  ibctrl_debug_fifo_full_stall,
  ibctrl_debug_fifo_stall,
  ibctrl_debug_ib_expt_vld,
  ibctrl_debug_ib_ip_stall,
  ibctrl_debug_ib_vld,
  ibctrl_debug_ibuf_empty,
  ibctrl_debug_ibuf_full,
  ibctrl_debug_ibuf_inst_vld,
  ibctrl_debug_ind_btb_stall,
  ibctrl_debug_lbuf_inst_vld,
  ibctrl_debug_mispred_stall,
  ibdp_debug_inst0_vld,
  ibdp_debug_inst1_vld,
  ibdp_debug_inst2_vld,
  ibdp_debug_mmu_deny_vld,
  ifctrl_debug_if_pc_vld,
  ifctrl_debug_if_stall,
  ifctrl_debug_if_vld,
  ifctrl_debug_inv_st,
  ifctrl_debug_lsu_all_inv,
  ifctrl_debug_lsu_line_inv,
  ifctrl_debug_mmu_pavld,
  ifctrl_debug_way_pred_stall,
  ifdp_debug_acc_err_vld,
  ifdp_debug_mmu_expt_vld,
  ifu_had_debug_info,
  ifu_had_reset_on,
  ipb_debug_req_cur_st,
  ipb_debug_wb_cur_st,
  ipctrl_debug_bry_missigned_stall,
  ipctrl_debug_h0_vld,
  ipctrl_debug_ip_expt_vld,
  ipctrl_debug_ip_if_stall,
  ipctrl_debug_ip_vld,
  ipctrl_debug_miss_under_refill_stall,
  l0_btb_debug_cur_state,
  l1_refill_debug_refill_st,
  lbuf_debug_st,
  pcgen_debug_chgflw,
  pcgen_debug_pcbus,
  rtu_ifu_xx_dbgon,
  vector_debug_cur_st,
  vector_debug_reset_on,
  vfdsu_ifu_debug_ex2_wait,
  vfdsu_ifu_debug_idle,
  vfdsu_ifu_debug_pipe_busy
);

// &Ports; @23
input           cpurst_b;                            
input           forever_cpuclk;                      
input           had_rtu_xx_jdbreq;                   
input           ibctrl_debug_buf_stall;              
input           ibctrl_debug_bypass_inst_vld;        
input           ibctrl_debug_fifo_full_stall;        
input           ibctrl_debug_fifo_stall;             
input           ibctrl_debug_ib_expt_vld;            
input           ibctrl_debug_ib_ip_stall;            
input           ibctrl_debug_ib_vld;                 
input           ibctrl_debug_ibuf_empty;             
input           ibctrl_debug_ibuf_full;              
input           ibctrl_debug_ibuf_inst_vld;          
input           ibctrl_debug_ind_btb_stall;          
input           ibctrl_debug_lbuf_inst_vld;          
input           ibctrl_debug_mispred_stall;          
input           ibdp_debug_inst0_vld;                
input           ibdp_debug_inst1_vld;                
input           ibdp_debug_inst2_vld;                
input           ibdp_debug_mmu_deny_vld;             
input           ifctrl_debug_if_pc_vld;              
input           ifctrl_debug_if_stall;               
input           ifctrl_debug_if_vld;                 
input   [3 :0]  ifctrl_debug_inv_st;                 
input           ifctrl_debug_lsu_all_inv;            
input           ifctrl_debug_lsu_line_inv;           
input           ifctrl_debug_mmu_pavld;              
input           ifctrl_debug_way_pred_stall;         
input           ifdp_debug_acc_err_vld;              
input           ifdp_debug_mmu_expt_vld;             
input   [3 :0]  ipb_debug_req_cur_st;                
input   [2 :0]  ipb_debug_wb_cur_st;                 
input           ipctrl_debug_bry_missigned_stall;    
input           ipctrl_debug_h0_vld;                 
input           ipctrl_debug_ip_expt_vld;            
input           ipctrl_debug_ip_if_stall;            
input           ipctrl_debug_ip_vld;                 
input           ipctrl_debug_miss_under_refill_stall; 
input   [1 :0]  l0_btb_debug_cur_state;              
input   [3 :0]  l1_refill_debug_refill_st;           
input   [5 :0]  lbuf_debug_st;                       
input           pcgen_debug_chgflw;                  
input   [13:0]  pcgen_debug_pcbus;                   
input           rtu_ifu_xx_dbgon;                    
input   [9 :0]  vector_debug_cur_st;                 
input           vector_debug_reset_on;               
input           vfdsu_ifu_debug_ex2_wait;            
input           vfdsu_ifu_debug_idle;                
input           vfdsu_ifu_debug_pipe_busy;           
output  [82:0]  ifu_had_debug_info;                  
output          ifu_had_reset_on;                    

// &Regs; @24
reg     [82:0]  ifu_had_debug_info;                  

// &Wires; @25
wire            bry_missigned_stall;                 
wire            buf_stall;                           
wire            bypass_inst_vld;                     
wire            chgflw;                              
wire            cpurst_b;                            
wire            dbg_ack_info;                        
wire            fifo_full_stall;                     
wire            fifo_stall;                          
wire            forever_cpuclk;                      
wire    [82:0]  had_debug_info;                      
wire            had_rtu_xx_jdbreq;                   
wire            ib_expt_vld;                         
wire            ib_ip_stall;                         
wire            ib_mmu_deny_vld;                     
wire            ib_vld;                              
wire            ibctrl_debug_buf_stall;              
wire            ibctrl_debug_bypass_inst_vld;        
wire            ibctrl_debug_fifo_full_stall;        
wire            ibctrl_debug_fifo_stall;             
wire            ibctrl_debug_ib_expt_vld;            
wire            ibctrl_debug_ib_ip_stall;            
wire            ibctrl_debug_ib_vld;                 
wire            ibctrl_debug_ibuf_empty;             
wire            ibctrl_debug_ibuf_full;              
wire            ibctrl_debug_ibuf_inst_vld;          
wire            ibctrl_debug_ind_btb_stall;          
wire            ibctrl_debug_lbuf_inst_vld;          
wire            ibctrl_debug_mispred_stall;          
wire            ibdp_debug_inst0_vld;                
wire            ibdp_debug_inst1_vld;                
wire            ibdp_debug_inst2_vld;                
wire            ibdp_debug_mmu_deny_vld;             
wire            ibuf_empty;                          
wire            ibuf_full;                           
wire            ibuf_inst_vld;                       
wire            if_acc_err_vld;                      
wire            if_mmu_expt_vld;                     
wire            if_pc_vld;                           
wire            if_self_stall;                       
wire            if_vld;                              
wire            ifctrl_debug_if_pc_vld;              
wire            ifctrl_debug_if_stall;               
wire            ifctrl_debug_if_vld;                 
wire    [3 :0]  ifctrl_debug_inv_st;                 
wire            ifctrl_debug_lsu_all_inv;            
wire            ifctrl_debug_lsu_line_inv;           
wire            ifctrl_debug_mmu_pavld;              
wire            ifctrl_debug_way_pred_stall;         
wire            ifdp_debug_acc_err_vld;              
wire            ifdp_debug_mmu_expt_vld;             
wire            ifu_had_reset_on;                    
wire            ind_btb_stall;                       
wire            inst0_vld;                           
wire            inst1_vld;                           
wire            inst2_vld;                           
wire    [3 :0]  inv_cur_st;                          
wire            ip_expt_vld;                         
wire            ip_h0_vld;                           
wire            ip_if_stall;                         
wire            ip_vld;                              
wire    [3 :0]  ipb_debug_req_cur_st;                
wire    [2 :0]  ipb_debug_wb_cur_st;                 
wire            ipctrl_debug_bry_missigned_stall;    
wire            ipctrl_debug_h0_vld;                 
wire            ipctrl_debug_ip_expt_vld;            
wire            ipctrl_debug_ip_if_stall;            
wire            ipctrl_debug_ip_vld;                 
wire            ipctrl_debug_miss_under_refill_stall; 
wire    [1 :0]  l0_btb_cur_state;                    
wire    [1 :0]  l0_btb_debug_cur_state;              
wire    [3 :0]  l1_refill_debug_refill_st;           
wire    [5 :0]  lbuf_cur_state;                      
wire    [5 :0]  lbuf_debug_st;                       
wire            lbuf_inst_vld;                       
wire            lsu_ifu_all_inv;                     
wire            lsu_ifu_line_inv;                    
wire            mispred_stall;                       
wire            miss_under_refill_stall;             
wire            mmu_ifu_pa_vld;                      
wire    [13:0]  pc_bus;                              
wire            pcgen_debug_chgflw;                  
wire    [13:0]  pcgen_debug_pcbus;                   
wire    [3 :0]  pref_req_cur_st;                     
wire    [2 :0]  pref_wb_cur_st;                      
wire    [3 :0]  refill_cur_state;                    
wire            rtu_ifu_xx_dbgon;                    
wire    [9 :0]  vector_cur_st;                       
wire    [9 :0]  vector_debug_cur_st;                 
wire            vector_debug_reset_on;               
wire            vfdsu_ex2_wait;                      
wire            vfdsu_idle;                          
wire            vfdsu_ifu_debug_ex2_wait;            
wire            vfdsu_ifu_debug_idle;                
wire            vfdsu_ifu_debug_pipe_busy;           
wire            vfdsu_pipe_busy;                     
wire            way_pred_stall;                      


//83-69-pc_bus
assign pc_bus[13:0]            = pcgen_debug_pcbus[13:0];


//68-ib_ip_stall
assign ib_ip_stall             = ibctrl_debug_ib_ip_stall;
//67-ip_if_stall
assign ip_if_stall             = ipctrl_debug_ip_if_stall;
//66-if_self_stall
assign if_self_stall           = ifctrl_debug_if_stall;
//65-mispred_stall
assign mispred_stall           = ibctrl_debug_mispred_stall;
//64-buf_stall
assign buf_stall               = ibctrl_debug_buf_stall;
//63-fifo_stall
assign fifo_stall              = ibctrl_debug_fifo_stall;
//62-fifo_full_stall
assign fifo_full_stall         = ibctrl_debug_fifo_full_stall;
//61-ind_btb_stall
assign ind_btb_stall           = ibctrl_debug_ind_btb_stall;
//60-bry_missigned_stall
assign bry_missigned_stall     = ipctrl_debug_bry_missigned_stall;
//59-miss_under_refill_stall
assign miss_under_refill_stall = ipctrl_debug_miss_under_refill_stall;
//58-if_pc_vld
assign if_pc_vld               = ifctrl_debug_if_pc_vld;
//57-way_pred_stall
assign way_pred_stall          = ifctrl_debug_way_pred_stall;
//56-if_mmu_expt_vld
assign if_mmu_expt_vld         = ifdp_debug_mmu_expt_vld;
//55-if_acc_err_vld
assign if_acc_err_vld          = ifdp_debug_acc_err_vld;
//54-ib_mmu_deny_vld
assign ib_mmu_deny_vld         = ibdp_debug_mmu_deny_vld;
//53-ip_expt_vld
assign ip_expt_vld             = ipctrl_debug_ip_expt_vld;
//52-ib_expt_vld
assign ib_expt_vld             = ibctrl_debug_ib_expt_vld;


//51-ibuf_full
assign ibuf_full               = ibctrl_debug_ibuf_full;
//50-ibuf_empty
assign ibuf_empty              = ibctrl_debug_ibuf_empty;
//49-ibuf_inst_vld
assign ibuf_inst_vld           = ibctrl_debug_ibuf_inst_vld;
//48-lbuf_inst_vld
assign lbuf_inst_vld           = ibctrl_debug_lbuf_inst_vld;
//47-bypass_inst_vld
assign bypass_inst_vld         = ibctrl_debug_bypass_inst_vld;
//46-inst0_vld
assign inst0_vld               = ibdp_debug_inst0_vld;
//45-inst1_vld
assign inst1_vld               = ibdp_debug_inst1_vld;
//44-inst2_vld
assign inst2_vld               = ibdp_debug_inst2_vld;
//43-if_vld
assign if_vld                  = ifctrl_debug_if_vld;
//42-ip_vld
assign ip_vld                  = ipctrl_debug_ip_vld;
//41-ib_vld
assign ib_vld                  = ibctrl_debug_ib_vld;
//40-ip_h0_vld
assign ip_h0_vld               = ipctrl_debug_h0_vld;
//39-mmu_ifu_pa_vld
assign mmu_ifu_pa_vld          = ifctrl_debug_mmu_pavld;
//38-lsu_ifu_all_inv
assign lsu_ifu_all_inv         = ifctrl_debug_lsu_all_inv;
//37-lsu_ifu_line_inv
assign lsu_ifu_line_inv        = ifctrl_debug_lsu_line_inv;
//36-chgflw
assign chgflw                  = pcgen_debug_chgflw;

//35-34-l0_btb_cur_state
assign l0_btb_cur_state[1:0]   = l0_btb_debug_cur_state[1:0];
//33-28-lbuf_cur_state
assign lbuf_cur_state[5:0]     = lbuf_debug_st[5:0];
//27-24-refill_cur_state
assign refill_cur_state[3:0]   = l1_refill_debug_refill_st[3:0];
//23-20-pref_req_cur_st
assign pref_req_cur_st[3:0]    = ipb_debug_req_cur_st[3:0];
//19-17-pref_wb_cur_st
assign pref_wb_cur_st[2:0]     = ipb_debug_wb_cur_st[2:0];
//16-13-inv_cur_st
assign inv_cur_st[3:0]         = ifctrl_debug_inv_st[3:0];
//12-3-vector_cur_st
assign vector_cur_st[9:0]      = vector_debug_cur_st[9:0];
//2-vfdsu_pipe_busy
assign vfdsu_pipe_busy         = vfdsu_ifu_debug_pipe_busy;
//1-vfdsu_ex2_wait
assign vfdsu_ex2_wait          = vfdsu_ifu_debug_ex2_wait;
//0-vfdsu_idle
assign vfdsu_idle              = vfdsu_ifu_debug_idle;

//Merge
assign had_debug_info[82:0]    = {pc_bus[13:0],
                                   ib_ip_stall,
                                   ip_if_stall,
                                   if_self_stall,
                                   mispred_stall,
                                   buf_stall,
                                   fifo_stall,
                                   fifo_full_stall,
                                   ind_btb_stall,
                                   bry_missigned_stall,
                                   miss_under_refill_stall,
                                   if_pc_vld,
                                   way_pred_stall,
                                   if_mmu_expt_vld,
                                   if_acc_err_vld,
                                   ib_mmu_deny_vld,
                                   ip_expt_vld,
                                   ib_expt_vld,
                                   ibuf_full,
                                   ibuf_empty,
                                   ibuf_inst_vld,
                                   lbuf_inst_vld,
                                   bypass_inst_vld,
                                   inst0_vld,
                                   inst1_vld,
                                   inst2_vld,
                                   if_vld,
                                   ip_vld,
                                   ib_vld,
                                   ip_h0_vld,
                                   mmu_ifu_pa_vld,
                                   lsu_ifu_all_inv,
                                   lsu_ifu_line_inv,
                                   chgflw,
                                   l0_btb_cur_state[1:0],
                                   lbuf_cur_state[5:0],
                                   refill_cur_state[3:0],
                                   pref_req_cur_st[3:0],
                                   pref_wb_cur_st[2:0],
                                   inv_cur_st[3:0],
                                   vector_cur_st[9:0],
                                   vfdsu_pipe_busy,
                                   vfdsu_ex2_wait,
                                   vfdsu_idle};

//flop data for timing                                 
assign dbg_ack_info            = had_rtu_xx_jdbreq 
                              && !rtu_ifu_xx_dbgon;

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifu_had_debug_info[82:0] <= 83'b0;
  else if(dbg_ack_info)
    ifu_had_debug_info[82:0] <= had_debug_info[82:0];
  else
    ifu_had_debug_info[82:0] <= ifu_had_debug_info[82:0];
end
    
// &Force("output","ifu_had_debug_info"); @181
assign ifu_had_reset_on = vector_debug_reset_on;

// &ModuleEnd; @184
endmodule


