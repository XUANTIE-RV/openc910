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
module ct_ifu_ifctrl(
  bht_ifctrl_inv_done,
  bht_ifctrl_inv_on,
  btb_ifctrl_inv_done,
  btb_ifctrl_inv_on,
  cp0_ifu_bht_inv,
  cp0_ifu_btb_inv,
  cp0_ifu_icache_inv,
  cp0_ifu_icache_read_index,
  cp0_ifu_icache_read_req,
  cp0_ifu_icache_read_tag,
  cp0_ifu_icache_read_way,
  cp0_ifu_icg_en,
  cp0_ifu_ind_btb_inv,
  cp0_ifu_no_op_req,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  hpcp_ifu_cnt_en,
  icache_if_ifctrl_inst_data0,
  icache_if_ifctrl_inst_data1,
  icache_if_ifctrl_tag_data0,
  icache_if_ifctrl_tag_data1,
  ifctrl_bht_inv,
  ifctrl_bht_pipedown,
  ifctrl_bht_stall,
  ifctrl_btb_inv,
  ifctrl_debug_if_pc_vld,
  ifctrl_debug_if_stall,
  ifctrl_debug_if_vld,
  ifctrl_debug_inv_st,
  ifctrl_debug_lsu_all_inv,
  ifctrl_debug_lsu_line_inv,
  ifctrl_debug_mmu_pavld,
  ifctrl_debug_way_pred_stall,
  ifctrl_icache_if_index,
  ifctrl_icache_if_inv_fifo,
  ifctrl_icache_if_inv_on,
  ifctrl_icache_if_read_req_data0,
  ifctrl_icache_if_read_req_data1,
  ifctrl_icache_if_read_req_index,
  ifctrl_icache_if_read_req_tag,
  ifctrl_icache_if_reset_req,
  ifctrl_icache_if_tag_req,
  ifctrl_icache_if_tag_wen,
  ifctrl_ifdp_cancel,
  ifctrl_ifdp_pipedown,
  ifctrl_ifdp_stall,
  ifctrl_ind_btb_inv,
  ifctrl_ipb_inv_on,
  ifctrl_ipctrl_if_pcload,
  ifctrl_ipctrl_vld,
  ifctrl_l0_btb_inv,
  ifctrl_l0_btb_stall,
  ifctrl_l1_refill_ins_inv,
  ifctrl_l1_refill_ins_inv_dn,
  ifctrl_l1_refill_inv_busy,
  ifctrl_l1_refill_inv_on,
  ifctrl_lbuf_ins_inv_on,
  ifctrl_lbuf_inv_req,
  ifctrl_pcgen_chgflw_no_stall_mask,
  ifctrl_pcgen_chgflw_vld,
  ifctrl_pcgen_ins_icache_inv_done,
  ifctrl_pcgen_pcload_pc,
  ifctrl_pcgen_reissue_pcload,
  ifctrl_pcgen_stall,
  ifctrl_pcgen_stall_short,
  ifctrl_pcgen_way_pred,
  ifu_cp0_bht_inv_done,
  ifu_cp0_btb_inv_done,
  ifu_cp0_icache_inv_done,
  ifu_cp0_icache_read_data,
  ifu_cp0_icache_read_data_vld,
  ifu_cp0_ind_btb_inv_done,
  ifu_had_no_op,
  ifu_hpcp_frontend_stall,
  ifu_lsu_icache_inv_done,
  ifu_no_op_req,
  ifu_yy_xx_no_op,
  ind_btb_ifctrl_inv_done,
  ind_btb_ifctrl_inv_on,
  ipb_ifctrl_prefetch_idle,
  ipctrl_ifctrl_bht_stall,
  ipctrl_ifctrl_stall,
  ipctrl_ifctrl_stall_short,
  l0_btb_ifctrl_chgflw_pc,
  l0_btb_ifctrl_chgflw_way_pred,
  l0_btb_ifctrl_chglfw_vld,
  l1_refill_ifctrl_ctc,
  l1_refill_ifctrl_idle,
  l1_refill_ifctrl_pc,
  l1_refill_ifctrl_refill_on,
  l1_refill_ifctrl_reissue,
  l1_refill_ifctrl_start,
  l1_refill_ifctrl_start_for_gateclk,
  l1_refill_ifctrl_trans_cmplt,
  l1_refill_inv_wfd_back,
  lsu_ifu_icache_all_inv,
  lsu_ifu_icache_index,
  lsu_ifu_icache_line_inv,
  lsu_ifu_icache_ptag,
  mmu_ifu_pavld,
  pad_yy_icg_scan_en,
  pcgen_ifctrl_cancel,
  pcgen_ifctrl_pc,
  pcgen_ifctrl_pipe_cancel,
  pcgen_ifctrl_reissue,
  pcgen_ifctrl_way_pred,
  pcgen_ifctrl_way_pred_stall,
  rtu_ifu_xx_dbgon,
  vector_ifctrl_reset_on,
  vector_ifctrl_sm_on,
  vector_ifctrl_sm_start
);

// &Ports; @23
input            bht_ifctrl_inv_done;               
input            bht_ifctrl_inv_on;                 
input            btb_ifctrl_inv_done;               
input            btb_ifctrl_inv_on;                 
input            cp0_ifu_bht_inv;                   
input            cp0_ifu_btb_inv;                   
input            cp0_ifu_icache_inv;                
input   [16 :0]  cp0_ifu_icache_read_index;         
input            cp0_ifu_icache_read_req;           
input            cp0_ifu_icache_read_tag;           
input            cp0_ifu_icache_read_way;           
input            cp0_ifu_icg_en;                    
input            cp0_ifu_ind_btb_inv;               
input            cp0_ifu_no_op_req;                 
input            cp0_yy_clk_en;                     
input            cpurst_b;                          
input            forever_cpuclk;                    
input            hpcp_ifu_cnt_en;                   
input   [127:0]  icache_if_ifctrl_inst_data0;       
input   [127:0]  icache_if_ifctrl_inst_data1;       
input   [28 :0]  icache_if_ifctrl_tag_data0;        
input   [28 :0]  icache_if_ifctrl_tag_data1;        
input            ind_btb_ifctrl_inv_done;           
input            ind_btb_ifctrl_inv_on;             
input            ipb_ifctrl_prefetch_idle;          
input            ipctrl_ifctrl_bht_stall;           
input            ipctrl_ifctrl_stall;               
input            ipctrl_ifctrl_stall_short;         
input   [38 :0]  l0_btb_ifctrl_chgflw_pc;           
input   [1  :0]  l0_btb_ifctrl_chgflw_way_pred;     
input            l0_btb_ifctrl_chglfw_vld;          
input            l1_refill_ifctrl_ctc;              
input            l1_refill_ifctrl_idle;             
input   [38 :0]  l1_refill_ifctrl_pc;               
input            l1_refill_ifctrl_refill_on;        
input            l1_refill_ifctrl_reissue;          
input            l1_refill_ifctrl_start;            
input            l1_refill_ifctrl_start_for_gateclk; 
input            l1_refill_ifctrl_trans_cmplt;      
input            l1_refill_inv_wfd_back;            
input            lsu_ifu_icache_all_inv;            
input   [5  :0]  lsu_ifu_icache_index;              
input            lsu_ifu_icache_line_inv;           
input   [27 :0]  lsu_ifu_icache_ptag;               
input            mmu_ifu_pavld;                     
input            pad_yy_icg_scan_en;                
input            pcgen_ifctrl_cancel;               
input   [38 :0]  pcgen_ifctrl_pc;                   
input            pcgen_ifctrl_pipe_cancel;          
input            pcgen_ifctrl_reissue;              
input   [1  :0]  pcgen_ifctrl_way_pred;             
input            pcgen_ifctrl_way_pred_stall;       
input            rtu_ifu_xx_dbgon;                  
input            vector_ifctrl_reset_on;            
input            vector_ifctrl_sm_on;               
input            vector_ifctrl_sm_start;            
output           ifctrl_bht_inv;                    
output           ifctrl_bht_pipedown;               
output           ifctrl_bht_stall;                  
output           ifctrl_btb_inv;                    
output           ifctrl_debug_if_pc_vld;            
output           ifctrl_debug_if_stall;             
output           ifctrl_debug_if_vld;               
output  [3  :0]  ifctrl_debug_inv_st;               
output           ifctrl_debug_lsu_all_inv;          
output           ifctrl_debug_lsu_line_inv;         
output           ifctrl_debug_mmu_pavld;            
output           ifctrl_debug_way_pred_stall;       
output  [38 :0]  ifctrl_icache_if_index;            
output           ifctrl_icache_if_inv_fifo;         
output           ifctrl_icache_if_inv_on;           
output           ifctrl_icache_if_read_req_data0;   
output           ifctrl_icache_if_read_req_data1;   
output  [38 :0]  ifctrl_icache_if_read_req_index;   
output           ifctrl_icache_if_read_req_tag;     
output           ifctrl_icache_if_reset_req;        
output           ifctrl_icache_if_tag_req;          
output  [2  :0]  ifctrl_icache_if_tag_wen;          
output           ifctrl_ifdp_cancel;                
output           ifctrl_ifdp_pipedown;              
output           ifctrl_ifdp_stall;                 
output           ifctrl_ind_btb_inv;                
output           ifctrl_ipb_inv_on;                 
output           ifctrl_ipctrl_if_pcload;           
output           ifctrl_ipctrl_vld;                 
output           ifctrl_l0_btb_inv;                 
output           ifctrl_l0_btb_stall;               
output           ifctrl_l1_refill_ins_inv;          
output           ifctrl_l1_refill_ins_inv_dn;       
output           ifctrl_l1_refill_inv_busy;         
output           ifctrl_l1_refill_inv_on;           
output           ifctrl_lbuf_ins_inv_on;            
output           ifctrl_lbuf_inv_req;               
output           ifctrl_pcgen_chgflw_no_stall_mask; 
output           ifctrl_pcgen_chgflw_vld;           
output           ifctrl_pcgen_ins_icache_inv_done;  
output  [38 :0]  ifctrl_pcgen_pcload_pc;            
output           ifctrl_pcgen_reissue_pcload;       
output           ifctrl_pcgen_stall;                
output           ifctrl_pcgen_stall_short;          
output  [1  :0]  ifctrl_pcgen_way_pred;             
output           ifu_cp0_bht_inv_done;              
output           ifu_cp0_btb_inv_done;              
output           ifu_cp0_icache_inv_done;           
output  [127:0]  ifu_cp0_icache_read_data;          
output           ifu_cp0_icache_read_data_vld;      
output           ifu_cp0_ind_btb_inv_done;          
output           ifu_had_no_op;                     
output           ifu_hpcp_frontend_stall;           
output           ifu_lsu_icache_inv_done;           
output           ifu_no_op_req;                     
output           ifu_yy_xx_no_op;                   

// &Regs; @24
reg     [4  :0]  addr_inv_count_reg;                
reg              bht_inv_dn_ff;                     
reg              bht_inv_ff;                        
reg              btb_inv_dn_ff;                     
reg              btb_inv_ff;                        
reg     [127:0]  icache_if_ifctrl_inst_data0_reg;   
reg     [127:0]  icache_if_ifctrl_inst_data1_reg;   
reg     [28 :0]  icache_if_ifctrl_tag_data0_reg;    
reg     [28 :0]  icache_if_ifctrl_tag_data1_reg;    
reg     [12 :0]  icache_inv_cnt;                    
reg     [3  :0]  icache_inv_cur_state;              
reg              icache_inv_fifo;                   
reg     [3  :0]  icache_inv_next_state;             
reg     [2  :0]  icache_inv_tag_wen;                
reg              ifctrl_ipctrl_if_pcload;           
reg              ifctrl_ipctrl_vld;                 
reg              ifctrl_pcgen_reissue_pcload;       
reg              ifu_hpcp_frontend_stall;           
reg              ifu_no_op_flop;                    
reg              ind_btb_inv_dn_ff;                 
reg              ind_btb_inv_ff;                    
reg     [27 :0]  ins_inv_ptag_flop;                 
reg     [1  :0]  tag_cmp_result;                    
reg     [28 :0]  tag_data0_reg;                     
reg     [28 :0]  tag_data1_reg;                     

// &Wires; @25
wire             all_inv_req;                       
wire             bht_ifctrl_inv_done;               
wire             bht_ifctrl_inv_on;                 
wire             bht_inv_dn;                        
wire             bht_inv_flop_clk;                  
wire             bht_inv_flop_clk_en;               
wire             bht_inv_on;                        
wire             btb_ifctrl_inv_done;               
wire             btb_ifctrl_inv_on;                 
wire             btb_inv_dn;                        
wire             btb_inv_flop_clk;                  
wire             btb_inv_flop_clk_en;               
wire             btb_inv_on;                        
wire             cache_data_flop_clk;               
wire             cache_data_flop_clk_en;            
wire             cp0_ifu_bht_inv;                   
wire             cp0_ifu_btb_inv;                   
wire             cp0_ifu_icache_inv;                
wire    [16 :0]  cp0_ifu_icache_read_index;         
wire             cp0_ifu_icache_read_req;           
wire             cp0_ifu_icache_read_tag;           
wire             cp0_ifu_icache_read_way;           
wire             cp0_ifu_icg_en;                    
wire             cp0_ifu_ind_btb_inv;               
wire             cp0_ifu_no_op_req;                 
wire             cp0_yy_clk_en;                     
wire             cpurst_b;                          
wire             forever_cpuclk;                    
wire             hpcp_clk;                          
wire             hpcp_clk_en;                       
wire             hpcp_ifu_cnt_en;                   
wire             ibp_inv_flop_clk;                  
wire             ibp_inv_flop_clk_en;               
wire             icache_all_inv;                    
wire             icache_all_inv_done;               
wire    [127:0]  icache_if_ifctrl_inst_data0;       
wire    [127:0]  icache_if_ifctrl_inst_data1;       
wire    [28 :0]  icache_if_ifctrl_tag_data0;        
wire    [28 :0]  icache_if_ifctrl_tag_data1;        
wire             icache_inv_clk;                    
wire             icache_inv_clk_en;                 
wire             icache_inv_cnt_initial;            
wire             icache_inv_cnt_on;                 
wire    [12 :0]  icache_inv_cnt_sub;                
wire             icache_inv_done;                   
wire    [38 :0]  icache_inv_index;                  
wire             icache_inv_on;                     
wire             icache_inv_over;                   
wire             icache_inv_tag_req;                
wire             icache_inv_valid;                  
wire             icache_line_inv_done;              
wire    [38 :0]  icache_line_inv_index;             
wire             icache_read;                       
wire             icache_read_clk;                   
wire             icache_read_clk_en;                
wire             icache_read_done;                  
wire    [16 :0]  icache_read_index;                 
wire             icache_read_pipe_vld;              
wire             icache_read_req;                   
wire             icache_read_tag;                   
wire             icache_read_way;                   
wire             icache_refill_on;                  
wire             icache_reissue;                    
wire             icache_reset_inv_req;              
wire             if_cancel;                         
wire             if_frontend_stall;                 
wire             if_inst_data_vld;                  
wire             if_pc_vld;                         
wire             if_self_stall;                     
wire             if_stage_stall;                    
wire             if_vld;                            
wire             if_vld_clk;                        
wire             if_vld_clk_en;                     
wire             if_vld_for_gateclk;                
wire             ifctrl_bht_inv;                    
wire             ifctrl_bht_pipedown;               
wire             ifctrl_bht_stall;                  
wire             ifctrl_btb_inv;                    
wire             ifctrl_debug_if_pc_vld;            
wire             ifctrl_debug_if_stall;             
wire             ifctrl_debug_if_vld;               
wire    [3  :0]  ifctrl_debug_inv_st;               
wire             ifctrl_debug_lsu_all_inv;          
wire             ifctrl_debug_lsu_line_inv;         
wire             ifctrl_debug_mmu_pavld;            
wire             ifctrl_debug_way_pred_stall;       
wire    [38 :0]  ifctrl_icache_if_index;            
wire             ifctrl_icache_if_inv_fifo;         
wire             ifctrl_icache_if_inv_on;           
wire             ifctrl_icache_if_read_req_data0;   
wire             ifctrl_icache_if_read_req_data1;   
wire    [38 :0]  ifctrl_icache_if_read_req_index;   
wire             ifctrl_icache_if_read_req_tag;     
wire             ifctrl_icache_if_reset_req;        
wire             ifctrl_icache_if_tag_req;          
wire    [2  :0]  ifctrl_icache_if_tag_wen;          
wire             ifctrl_ifdp_cancel;                
wire             ifctrl_ifdp_pipedown;              
wire             ifctrl_ifdp_stall;                 
wire             ifctrl_ind_btb_inv;                
wire             ifctrl_ipb_inv_on;                 
wire             ifctrl_l0_btb_inv;                 
wire             ifctrl_l0_btb_stall;               
wire             ifctrl_l1_refill_ins_inv;          
wire             ifctrl_l1_refill_ins_inv_dn;       
wire             ifctrl_l1_refill_inv_busy;         
wire             ifctrl_l1_refill_inv_on;           
wire             ifctrl_lbuf_ins_inv_on;            
wire             ifctrl_lbuf_inv_req;               
wire             ifctrl_pcgen_chgflw_no_stall_mask; 
wire             ifctrl_pcgen_chgflw_vld;           
wire             ifctrl_pcgen_ins_icache_inv_done;  
wire    [38 :0]  ifctrl_pcgen_pcload_pc;            
wire             ifctrl_pcgen_stall;                
wire             ifctrl_pcgen_stall_short;          
wire    [1  :0]  ifctrl_pcgen_way_pred;             
wire             ifctrl_pcload;                     
wire             ifctrl_reissue_clk;                
wire             ifu_cp0_bht_inv_done;              
wire             ifu_cp0_btb_inv_done;              
wire             ifu_cp0_icache_inv_done;           
wire    [127:0]  ifu_cp0_icache_read_data;          
wire             ifu_cp0_icache_read_data_vld;      
wire             ifu_cp0_ind_btb_inv_done;          
wire             ifu_had_no_op;                     
wire             ifu_lsu_icache_inv_done;           
wire             ifu_no_op;                         
wire             ifu_no_op_for_gateclk;             
wire             ifu_no_op_req;                     
wire             ifu_no_op_updt_clk;                
wire             ifu_no_op_updt_clk_en;             
wire             ifu_yy_xx_no_op;                   
wire             ind_btb_ifctrl_inv_done;           
wire             ind_btb_ifctrl_inv_on;             
wire             ind_btb_inv_dn;                    
wire             ind_btb_inv_on;                    
wire             ins_addr_inv_req;                  
wire             ins_all_inv_req;                   
wire             ins_icache_inv_line_hit;           
wire             ins_inv_ptag_flop_clk;             
wire             ins_inv_ptag_flop_clk_en;          
wire    [1  :0]  ins_tag_cmp;                       
wire             ipb_ifctrl_prefetch_idle;          
wire             ipctrl_ifctrl_bht_stall;           
wire             ipctrl_ifctrl_stall;               
wire             ipctrl_ifctrl_stall_short;         
wire    [38 :0]  l0_btb_ifctrl_chgflw_pc;           
wire    [1  :0]  l0_btb_ifctrl_chgflw_way_pred;     
wire             l0_btb_ifctrl_chglfw_vld;          
wire             l1_refill_ifctrl_ctc;              
wire             l1_refill_ifctrl_idle;             
wire    [38 :0]  l1_refill_ifctrl_pc;               
wire             l1_refill_ifctrl_refill_on;        
wire             l1_refill_ifctrl_reissue;          
wire             l1_refill_ifctrl_start;            
wire             l1_refill_ifctrl_start_for_gateclk; 
wire             l1_refill_ifctrl_trans_cmplt;      
wire             l1_refill_inv_wfd_back;            
wire             lsu_ifu_icache_all_inv;            
wire    [5  :0]  lsu_ifu_icache_index;              
wire             lsu_ifu_icache_line_inv;           
wire    [27 :0]  lsu_ifu_icache_ptag;               
wire             mmu_ifu_pavld;                     
wire             pad_yy_icg_scan_en;                
wire             pcgen_ifctrl_cancel;               
wire    [38 :0]  pcgen_ifctrl_pc;                   
wire             pcgen_ifctrl_pipe_cancel;          
wire             pcgen_ifctrl_reissue;              
wire    [1  :0]  pcgen_ifctrl_way_pred;             
wire             pcgen_ifctrl_way_pred_stall;       
wire             refill_pc_hit;                     
wire             rtu_ifu_xx_dbgon;                  
wire             vector_ifctrl_reset_on;            
wire             vector_ifctrl_sm_on;               
wire             vector_ifctrl_sm_start;            


parameter PC_WIDTH = 40;
// &Force("bus","pcgen_ifctrl_pc",38,0); @28
// &Force("bus","l1_refill_ifctrl_pc",38,0); @29
//==========================================================
//             No_op Signal for Low Power
//==========================================================
assign ifu_no_op_req = cp0_ifu_no_op_req;
assign ifu_no_op     = l1_refill_ifctrl_idle && 
                       !l1_refill_ifctrl_start && 
                       ipb_ifctrl_prefetch_idle;
assign ifu_no_op_for_gateclk = l1_refill_ifctrl_idle && 
                               !l1_refill_ifctrl_start_for_gateclk && 
                               ipb_ifctrl_prefetch_idle;

//Gate Clk
// &Instance("gated_clk_cell","x_ifu_no_op_updt_clk"); @42
gated_clk_cell  x_ifu_no_op_updt_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ifu_no_op_updt_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ifu_no_op_updt_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @43
//           .clk_out        (ifu_no_op_updt_clk),//Out Clock @44
//           .external_en    (1'b0), @45
//           .global_en      (cp0_yy_clk_en), @46
//           .local_en       (ifu_no_op_updt_clk_en),//Local Condition @47
//           .module_en      (cp0_ifu_icg_en) @48
//         ); @49
assign ifu_no_op_updt_clk_en = ifu_no_op_flop != ifu_no_op_for_gateclk;

always @(posedge ifu_no_op_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifu_no_op_flop <= 1'b0;
  else
    ifu_no_op_flop <= ifu_no_op;
end
assign ifu_yy_xx_no_op = ifu_no_op_flop && !l1_refill_ifctrl_start_for_gateclk;
//For had use
assign ifu_had_no_op = ifu_yy_xx_no_op;
// &Force("output","ifu_no_op_req"); @62
// &Force("output","ifu_yy_xx_no_op"); @63
//==========================================================
//             IF Stage Data Valid Signal
//==========================================================
//IF Stage Data Will Be Valid :
//  1.Refill not on : Data from L1 ICache, Data Valid When not way_pred_close
//  2.Refill     on : Data from Refill, Data Valid only when trans_cmplt && PC_hit
//  Refill on Valid When Enter Refill SM && NOT ask Change Flow,Which Means
//  WFD1-WFD4 or REQ 
assign if_inst_data_vld = (!l1_refill_ifctrl_refill_on && 
                           !(pcgen_ifctrl_way_pred[1:0] == 2'b0) ) || //not way_pred stall
                          (l1_refill_ifctrl_refill_on && 
                           l1_refill_ifctrl_trans_cmplt && 
                           refill_pc_hit);
assign refill_pc_hit = (pcgen_ifctrl_pc[PC_WIDTH-2:3] == l1_refill_ifctrl_pc[PC_WIDTH-2:3]);

//==========================================================
//             IF Stage PC Valid Signal
//==========================================================
//IF Stage PC Will Be Valid :
//  1.MMU Trans success
//  2.MMU Trans expt
//  3.!ifu_no_op_req(in case of invalid inst fetch affect no_op)
assign if_pc_vld       = mmu_ifu_pavld && 
                         !ifu_no_op_req;

//==========================================================
//             IF Stage Cancel Signal
//==========================================================
assign if_cancel = pcgen_ifctrl_cancel;
assign ifctrl_ifdp_cancel = if_cancel;

//==========================================================
//             IF Stage Self_Stall Signal
//==========================================================
//IF Stage Self Stall is actually if_pcgen_stall
//IF Stage Self Stall will make if stage not valid and stall pcgen
//  1.Refill_on && !(trans_cmplt && PC_hit)
//  2.!pc_vld, which means MMU is Refilling
//  3.l1_icache_inv on
//  4.BHT_inv on
//  5.BTB_inv on,which contains BTB & Ind-BTB
//  6.Vector_SM on
//  7.Way Predict = 2'b00, Which Means
//  8.Rtu_yy_xx_dbgon
assign if_self_stall = (l1_refill_ifctrl_refill_on && 
                        !(l1_refill_ifctrl_trans_cmplt && refill_pc_hit)) ||
                       !if_pc_vld ||
                       icache_inv_on ||
                       bht_inv_on ||
                       btb_inv_on || 
                       ind_btb_inv_on || 
                       vector_ifctrl_sm_on ||
                       pcgen_ifctrl_way_pred_stall || 
                       rtu_ifu_xx_dbgon;
assign if_stage_stall      = if_self_stall || ipctrl_ifctrl_stall;
assign ifctrl_pcgen_stall  = if_stage_stall;
assign ifctrl_bht_stall    = if_stage_stall;
assign ifctrl_ifdp_stall   = if_stage_stall;
assign ifctrl_l0_btb_stall = if_stage_stall;
//for timing consideration
assign ifctrl_pcgen_stall_short = if_self_stall || ipctrl_ifctrl_stall_short;

//==========================================================
//             IF Stage Valid Signal
//==========================================================
//IF Stage Valid when
//  1.if_inst_data_vld &&
//  2.if_pc_vld &&
//  3.!if_cancel &&
//  4.!if_self_stall
assign if_vld = if_inst_data_vld &&
                if_pc_vld &&
                !if_cancel &&
                !if_self_stall;

assign if_vld_for_gateclk = if_inst_data_vld &&
                            !if_cancel &&
                            !if_self_stall;


//==========================================================
//                       IF Debug Signal
//==========================================================
assign if_frontend_stall = !if_inst_data_vld 
                        || !if_pc_vld 
                        || if_self_stall 
                        || ipctrl_ifctrl_stall;

assign hpcp_clk_en       = hpcp_ifu_cnt_en;
// &Instance("gated_clk_cell","x_hpcp_clk"); @156
gated_clk_cell  x_hpcp_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (hpcp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (hpcp_clk_en       ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @157
//           .clk_out        (hpcp_clk),//Out Clock @158
//           .external_en    (1'b0), @159
//           .global_en      (cp0_yy_clk_en), @160
//           .local_en       (hpcp_clk_en),//Local Condition @161
//           .module_en      (cp0_ifu_icg_en)); @162

always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifu_hpcp_frontend_stall <= 1'b0;
  else if(hpcp_ifu_cnt_en)
    ifu_hpcp_frontend_stall <= if_frontend_stall;
  else
    ifu_hpcp_frontend_stall <= ifu_hpcp_frontend_stall;
end
// &Force("output","ifu_hpcp_frontend_stall"); @173

//==========================================================
//             IF Stage Pipedown Signal
//==========================================================
//IF Stage Data Will Pipedown When
//  1.!ip_if_Stall
//  2.if_vld
//  3.!pcgen_ifctrl_pipe_cancel(Only affect valid)
assign ifctrl_ifdp_pipedown = !ipctrl_ifctrl_stall &&
                              if_vld;
// &Force("output","ifctrl_ifdp_pipedown");                             @185
assign ifctrl_bht_pipedown = !ipctrl_ifctrl_bht_stall;

//==========================================================
//             Valid Signal to IP Stage
//==========================================================
//Gate Clk
// &Instance("gated_clk_cell","x_if_vld_clk"); @192
gated_clk_cell  x_if_vld_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (if_vld_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (if_vld_clk_en     ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @193
//           .clk_out        (if_vld_clk),//Out Clock @194
//           .external_en    (1'b0), @195
//           .global_en      (cp0_yy_clk_en), @196
//           .local_en       (if_vld_clk_en),//Local Condition @197
//           .module_en      (cp0_ifu_icg_en) @198
//         ); @199
assign if_vld_clk_en = if_vld_for_gateclk || 
                       ifctrl_ipctrl_vld; 
//ipctrl_ifctrl_stall may set with higher priority cancel at 
//the same time
always @(posedge if_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifctrl_ipctrl_vld <= 1'b0;
  else if(pcgen_ifctrl_pipe_cancel)
    ifctrl_ipctrl_vld <= 1'b0;
  else if(!ipctrl_ifctrl_stall)
    ifctrl_ipctrl_vld <= if_vld;
  else
    ifctrl_ipctrl_vld <= ifctrl_ipctrl_vld;
end
// &Force("output", "ifctrl_ipctrl_vld"); @215
//==========================================================
//             IF Stage PC reissue
//==========================================================
//IF Stage PC Reissue When
//  1.Cache Refill Done
//  2.Cache INV Done
//  3.High priority change flow from Had/Vector and so on
//  Note That The Three Done Signal should Flop One Cycle
assign icache_reissue = l1_refill_ifctrl_reissue ||
                        (icache_inv_done || icache_read_done) && 
                        (
                          !l1_refill_ifctrl_ctc || 
                          l1_refill_inv_wfd_back
                        ) || 
                        pcgen_ifctrl_reissue;
//Gate Clk
// &Instance("gated_clk_cell","x_ifctrl_reissue_clk"); @232
gated_clk_cell  x_ifctrl_reissue_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ifctrl_reissue_clk),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (1'b1              ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @233
//           .clk_out        (ifctrl_reissue_clk),//Out Clock @234
//           .external_en    (1'b0), @235
//           .global_en      (1'b1), @236
//           .local_en       (1'b1),//Local Condition @237
//           .module_en      (cp0_ifu_icg_en) @238
//         ); @239
        
always @(posedge ifctrl_reissue_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifctrl_pcgen_reissue_pcload <= 1'b0;
  else
    ifctrl_pcgen_reissue_pcload <= icache_reissue;
end
// &Force("output","ifctrl_pcgen_reissue_pcload"); @248

//==========================================================
//             IF Stage PCload
//==========================================================
assign ifctrl_pcload                = l0_btb_ifctrl_chglfw_vld 
                                   && !ipctrl_ifctrl_stall
                                   && !ifctrl_pcgen_reissue_pcload
                                   && if_inst_data_vld
//                                   && if_pc_vld
                                   && !if_self_stall;
                                   
assign ifctrl_pcgen_chgflw_no_stall_mask = l0_btb_ifctrl_chglfw_vld
                                        && !ifctrl_pcgen_reissue_pcload
                                        && if_inst_data_vld;
                                         
assign ifctrl_pcgen_chgflw_vld              = ifctrl_pcload;
assign ifctrl_pcgen_pcload_pc[PC_WIDTH-2:0] = l0_btb_ifctrl_chgflw_pc[PC_WIDTH-2:0];
assign ifctrl_pcgen_way_pred[1:0]           = (l0_btb_ifctrl_chglfw_vld)
                                              ? l0_btb_ifctrl_chgflw_way_pred[1:0]
                                              : 2'b11;

always @(posedge if_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifctrl_ipctrl_if_pcload <= 1'b0;
  else if(pcgen_ifctrl_pipe_cancel)
    ifctrl_ipctrl_if_pcload <= 1'b0;
  else if(!ipctrl_ifctrl_stall)
    ifctrl_ipctrl_if_pcload <= ifctrl_pcload;
  else
    ifctrl_ipctrl_if_pcload <= ifctrl_ipctrl_if_pcload;
end
// &Force("output", "ifctrl_ipctrl_if_pcload"); @282


//==========================================================
//                    ICACHE INV SM
//==========================================================

parameter IDLE        = 4'b0000;
parameter READ_REQ    = 4'b0010;
parameter READ_RD     = 4'b0011;
parameter READ_ST     = 4'b0100;
parameter INV_ALL     = 4'b0101;
parameter INS_TAG_REQ = 4'b1001;
parameter INS_TAG_RD  = 4'b1010;
parameter INS_CMP     = 4'b1011;
parameter INS_INV     = 4'b1100;
parameter INS_INV_ALL = 4'b1101;

//==========================================================
//              Gate Clk of Icache Inv SM
//==========================================================
assign icache_inv_valid  = icache_all_inv || 
                           lsu_ifu_icache_line_inv || 
                           lsu_ifu_icache_all_inv || 
                           icache_read;
assign icache_all_inv    = cp0_ifu_icache_inv;
assign icache_read       = cp0_ifu_icache_read_req;
assign icache_refill_on  = l1_refill_ifctrl_refill_on;

// &Instance("gated_clk_cell","x_icache_inv_clk"); @318
gated_clk_cell  x_icache_inv_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icache_inv_clk    ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (icache_inv_clk_en ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @319
//           .clk_out        (icache_inv_clk),//Out Clock @320
//           .external_en    (1'b0), @321
//           .global_en      (1'b1), //low power mode not affect icache inv @322
//           .local_en       (icache_inv_clk_en),//Local Condition @323
//           .module_en      (cp0_ifu_icg_en) @324
//         ); @325
assign icache_inv_clk_en = icache_inv_valid ||
                           (icache_inv_cur_state[3:0] != IDLE);

//------------------FSM of ICache INV-----------------------
//State Description:
//IDLE        : Wait for Invalid Request
//INV_ALL     : Do Invalid All
//INS_TAG_REQ : (INST_INV) Send Tag Read Request to ICache
//INS_TAG_RD  : (INST_INV) Read The Tag Data of ICache
//INS_CMP     : (INST_INV) Compare The Request Tag and The Tag Read from ICache
//INS_INV     : (INST_INV) Do Line Invalid and Clear Valid Bit of Tag
//INS_INV_ALL : (INST_INV) Do Invalid All
always @(posedge icache_inv_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    icache_inv_cur_state[3:0] <= IDLE;
  else
    icache_inv_cur_state[3:0] <= icache_inv_next_state[3:0];
end

//cp0 will only maintain icache all inv
//ins_inv maintain icache all inv and line inv(Virtual Address)
// &CombBeg; @348
always @( all_inv_req
       or icache_read_req
       or ins_icache_inv_line_hit
       or icache_inv_cur_state[3:0]
       or icache_all_inv_done
       or ins_all_inv_req
       or ins_addr_inv_req
       or addr_inv_count_reg[4:0])
begin
case(icache_inv_cur_state[3:0])
//icache invalid start when refill state machine not on
IDLE        : if(ins_all_inv_req)
              icache_inv_next_state[3:0] = INS_INV_ALL;
              else if(ins_addr_inv_req)
              icache_inv_next_state[3:0] = INS_TAG_REQ;
              else if(all_inv_req)
              icache_inv_next_state[3:0] = INV_ALL;
              else if(icache_read_req)
              icache_inv_next_state[3:0] = READ_REQ;
              else
              icache_inv_next_state[3:0] = IDLE;
INV_ALL     : if(icache_all_inv_done)
              icache_inv_next_state[3:0] = IDLE;
              else
              icache_inv_next_state[3:0] = INV_ALL;
//Because VIPT icache
//the same PA may occur in different icache line
//Thus should ergodic 4/8 icache line in 32K/64K icache 
INS_TAG_REQ : icache_inv_next_state[3:0] = INS_TAG_RD;
INS_TAG_RD  : icache_inv_next_state[3:0] = INS_CMP;
INS_CMP     : if(ins_icache_inv_line_hit)
              icache_inv_next_state[3:0] = INS_INV;
              else if(!(addr_inv_count_reg[4:0] == 5'b00000))
              icache_inv_next_state[3:0] = INS_TAG_REQ;
              else
              icache_inv_next_state[3:0] = IDLE;
INS_INV     : if(!(addr_inv_count_reg[4:0] == 5'b00000))
              icache_inv_next_state[3:0] = INS_TAG_REQ;
              else
              icache_inv_next_state[3:0] = IDLE;
INS_INV_ALL : if(icache_all_inv_done)
              icache_inv_next_state[3:0] = IDLE;
              else
              icache_inv_next_state[3:0] = INS_INV_ALL;
READ_REQ    : icache_inv_next_state[3:0] = READ_RD;
READ_RD     : icache_inv_next_state[3:0] = READ_ST;
READ_ST     : icache_inv_next_state[3:0] = IDLE;
default     : icache_inv_next_state[3:0] = IDLE;
endcase
// &CombEnd; @389
end

//------------------Condition Signal------------------------
//inst all inv
assign ins_all_inv_req   = lsu_ifu_icache_all_inv && //inv will not start at the same time with vec or refill
                           (!icache_refill_on && !vector_ifctrl_sm_start || 
                           l1_refill_ifctrl_ctc);//Low power mode not care lbuf idle
//inst line inv (icache.iva or icache.ipa)
assign ins_addr_inv_req  = lsu_ifu_icache_line_inv && 
                          (!icache_refill_on && !vector_ifctrl_sm_start || 
                           l1_refill_ifctrl_ctc);
//when there is ctc_req, loop buffer should be flushed instead of loop buffer
//contain old invalid instructions
assign ifctrl_lbuf_ins_inv_on = lsu_ifu_icache_all_inv || 
                                lsu_ifu_icache_line_inv;
assign ifctrl_lbuf_inv_req = ins_all_inv_req || ins_addr_inv_req;

//cp0 all inv
assign all_inv_req     = icache_all_inv && 
                         !icache_refill_on && 
                         !vector_ifctrl_sm_start; //not care lbuf, for cp0 will flush lbuf
assign icache_read_req = icache_read && 
                         !icache_refill_on && 
                         !vector_ifctrl_sm_start;
//addr_inv_count_reg[2:0]
//addr_inv_count_reg used to deal with VIPT Icache address inv
//For 64K VIPT Icache, PC[13:11] should used as VIndex
//However, this three bit can not be detect by different process
//Thus, when va/pa inv, should inv 8 times for different [13:11]
//We use addr_inv_count_reg to finish this task
//For 32K ICache,PC[12:11]
//csky vperl_off
`ifdef ICACHE_256K
parameter CNT_REG_VAL = 5'b11111;
`endif
`ifdef ICACHE_128K
parameter CNT_REG_VAL = 5'b01111;
`endif
`ifdef ICACHE_64K
parameter CNT_REG_VAL = 5'b00111;
`endif  //ICACHE_32K
`ifdef ICACHE_32K
parameter CNT_REG_VAL = 5'b00011;
`endif //ICACHE_64K
//csky vperl_on
always @(posedge icache_inv_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    addr_inv_count_reg[4:0] <= 5'b00000;
  else if( (icache_inv_cur_state[3:0] == IDLE) && 
           (ins_addr_inv_req) )
//csky vperl_off
    addr_inv_count_reg[4:0] <= CNT_REG_VAL;
//csky vperl_on
  else if( (icache_inv_cur_state[3:0] == INS_INV) || 
           (icache_inv_cur_state[3:0] == INS_CMP) && !ins_icache_inv_line_hit)
    if(!(addr_inv_count_reg[4:0] == 5'b000))
      addr_inv_count_reg[4:0] <= addr_inv_count_reg[4:0] - 5'b1;
    else
      addr_inv_count_reg[4:0] <= addr_inv_count_reg[4:0];
  else
      addr_inv_count_reg[4:0] <= addr_inv_count_reg[4:0];
end

//------------------Control Singnal of FSM------------------
//icache_inv_on
assign icache_inv_on = (icache_inv_cur_state[3:0] != IDLE);
//assign ifctrl_vector_icache_inv_on = icache_inv_on;
//ins_icache_inv_line_hit
assign ins_icache_inv_line_hit = (|ins_tag_cmp[1:0]);                             
//icache_inv_tag_req for Inv SM Tag Read && Write
//  Read on TAG_REQ state
//  Write on INV state or INV_ALL state
assign icache_inv_tag_req       = (
                                   (icache_inv_cur_state[3:0] == INV_ALL) || 
                                   (icache_inv_cur_state[3:0] == INS_TAG_REQ) ||
                                   (icache_inv_cur_state[3:0] == INS_INV)     ||
                                   (icache_inv_cur_state[3:0] == INS_INV_ALL)
                                  ) &&
                                  (&icache_inv_cnt[1:0]);
assign icache_reset_inv_req     = (icache_inv_cur_state[3:0] == INV_ALL) && vector_ifctrl_reset_on;                         
//icache_inv_cnt_initial for all_line_inv counter initial
assign icache_inv_cnt_initial   = (icache_inv_cur_state[3:0] == IDLE) &&
                                  (icache_all_inv || lsu_ifu_icache_all_inv) && 
                                  !icache_refill_on && 
                                  !vector_ifctrl_sm_start;
//icache_inv_cnt_on for decreasing the all_line_inv counter
assign icache_inv_cnt_on        = (icache_inv_cur_state[3:0] == INV_ALL) || 
                                  (icache_inv_cur_state[3:0] == INS_INV_ALL);
//icache_inv_tag_wen[2:0]
//wen[2] for fifobit, fifobit point to the Way is going to be substitude 
// &CombBeg; @482
always @( icache_inv_cur_state[3:0]
       or tag_cmp_result[1:0])
begin
if(icache_inv_cur_state[3:0] == INS_INV_ALL)
  icache_inv_tag_wen[2:0] = 3'b0;
else if(icache_inv_cur_state[3:0] == INV_ALL)
  icache_inv_tag_wen[2:0] = 3'b0;
else if(icache_inv_cur_state[3:0] == INS_INV)
  icache_inv_tag_wen[2:0] = {1'b0, ~tag_cmp_result[1:0]};
else
  icache_inv_tag_wen[2:0] = 3'b111;
// &CombEnd; @491
end
//icache_inv_fifo Bit Value
// &CombBeg; @493
always @( tag_cmp_result[1]
       or icache_inv_cur_state[3:0])
begin
if(icache_inv_cur_state[3:0] == INS_INV_ALL)
  icache_inv_fifo = 1'b0;
else if(icache_inv_cur_state[3:0] == INV_ALL)
  icache_inv_fifo = 1'b0;
else if(icache_inv_cur_state[3:0] == INS_INV)
  icache_inv_fifo = tag_cmp_result[1];
else
  icache_inv_fifo = 1'b0;
// &CombEnd; @502
end
//tag_cmp_result[1:0]
//virtual pc mode tag cmp result
//CMP STATE result flop to INV STATE use
always @(posedge icache_inv_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tag_cmp_result[1:0] <= 2'b0;
  else if(icache_inv_cur_state[3:0] == INS_CMP)
    tag_cmp_result[1:0] <= ins_tag_cmp[1:0];
  else
    tag_cmp_result[1:0] <= tag_cmp_result[1:0];
end

//Gate clk
// &Instance("gated_clk_cell","x_cache_data_flop_clk"); @517
gated_clk_cell  x_cache_data_flop_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (cache_data_flop_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (1'b1                  ),
  .local_en               (cache_data_flop_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @518
//           .clk_out        (cache_data_flop_clk),//Out Clock @519
//           .external_en    (1'b0), @520
//           //.global_en      (cp0_yy_clk_en), @521
//           .global_en      (1'b1), //low power mode not affect icache inv @522
//           .local_en       (cache_data_flop_clk_en),//Local Condition @523
//           .module_en      (cp0_ifu_icg_en) @524
//         ); @525
assign cache_data_flop_clk_en = (icache_inv_cur_state[3:0] == INS_TAG_RD);
//Flop icache dout for Tag Compare Next cycle 
always @(posedge cache_data_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    tag_data1_reg[28:0] <= 29'b0;
    tag_data0_reg[28:0] <= 29'b0;
  end
  else
  begin
    tag_data1_reg[28:0] <= icache_if_ifctrl_tag_data1[28:0];
    tag_data0_reg[28:0] <= icache_if_ifctrl_tag_data0[28:0];
  end
end

// &Instance("gated_clk_cell","x_ins_inv_ptag_flop_clk"); @558
gated_clk_cell  x_ins_inv_ptag_flop_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (ins_inv_ptag_flop_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (1'b1                    ),
  .local_en                 (ins_inv_ptag_flop_clk_en),
  .module_en                (cp0_ifu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect( .clk_in         (forever_cpuclk), @559
//           .clk_out        (ins_inv_ptag_flop_clk),//Out Clock @560
//           .external_en    (1'b0), @561
//           .global_en      (1'b1), //low power mode not affect icache inv @562
//           .local_en       (ins_inv_ptag_flop_clk_en),//Local Condition @563
//           .module_en      (cp0_ifu_icg_en) @564
//         ); @565

assign ins_inv_ptag_flop_clk_en = (icache_inv_cur_state[3:0] == IDLE) && ins_addr_inv_req;
always @(posedge ins_inv_ptag_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ins_inv_ptag_flop[27:0] <= 28'b0;
  else if(ins_addr_inv_req)
    ins_inv_ptag_flop[27:0] <= lsu_ifu_icache_ptag[27:0];
  else
    ins_inv_ptag_flop[27:0] <= ins_inv_ptag_flop[27:0];
end

assign ins_tag_cmp[1] = (tag_data1_reg[28:0] == {1'b1, ins_inv_ptag_flop[27:0]});                   
assign ins_tag_cmp[0] = (tag_data0_reg[28:0] == {1'b1, ins_inv_ptag_flop[27:0]});                   

//icache_inv_index
assign icache_inv_index[PC_WIDTH-2:0] = (icache_all_inv || lsu_ifu_icache_all_inv) 
                                      ? {23'b0, icache_inv_cnt[12:0], 3'b0}
                                      : icache_line_inv_index[PC_WIDTH-2:0];
assign icache_line_inv_index[PC_WIDTH-2:0] = {23'b0, addr_inv_count_reg[4:0], lsu_ifu_icache_index[5:0], 5'b0}; 
//---------------The Index to ICache Inv ALL----------------
//For 64K Cache, Index = 9Bit
//For 32K Cache, Index = 8Bit
//csky vperl_off
`ifdef ICACHE_256K
parameter INV_CNT_VAL = 13'b1111111111111;
`endif
`ifdef ICACHE_128K
parameter INV_CNT_VAL = 13'b0111111111111;
`endif
`ifdef ICACHE_64K
parameter INV_CNT_VAL = 13'b0011111111111;
`endif
`ifdef ICACHE_32K
parameter INV_CNT_VAL = 13'b0001111111111;
`endif //ICACHE_64K
//csky vperl_on
assign icache_inv_cnt_sub[12:0] = (vector_ifctrl_reset_on) ? 13'b1
                                                           : 13'b100;
always @(posedge icache_inv_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    icache_inv_cnt[12:0] <= 13'b0;
  else if(icache_inv_cnt_initial)
//csky vperl_off
    icache_inv_cnt[12:0] <= INV_CNT_VAL;
//csky vperl_on
  else if(icache_inv_cnt_on)
    icache_inv_cnt[12:0] <= icache_inv_cnt[12:0] - icache_inv_cnt_sub[12:0];
  else
    icache_inv_cnt[12:0] <= icache_inv_cnt[12:0];
end
assign icache_inv_over = ~(|icache_inv_cnt[12:2]) && 
                         !(vector_ifctrl_reset_on && (|icache_inv_cnt[1:0]));

//---------------ICache INV Done Signal---------------------
assign icache_all_inv_done     = (
                                   (icache_inv_cur_state[3:0] == INV_ALL) || 
                                   (icache_inv_cur_state[3:0] == INS_INV_ALL)
                                 ) && 
                                 icache_inv_over;
//icache_line_inv_done
assign icache_line_inv_done    = (icache_inv_cur_state[3:0] == INS_INV) && 
                                 (addr_inv_count_reg[4:0] == 5'b00000)    || 
                                 (icache_inv_cur_state[3:0] == INS_CMP) && 
                                 (addr_inv_count_reg[4:0] == 5'b00000)    &&
                                 !ins_icache_inv_line_hit;

assign icache_inv_done         = icache_line_inv_done || icache_all_inv_done;
assign icache_read_done        = (icache_inv_cur_state[3:0] == READ_ST);

assign ifu_lsu_icache_inv_done = icache_line_inv_done || 
                                 (icache_inv_cur_state[3:0] == INS_INV_ALL) && 
                                 icache_inv_over;
// &Force("output","ifu_lsu_icache_inv_done"); @650
assign ifu_cp0_icache_inv_done = (icache_inv_cur_state[3:0] == INV_ALL) && 
                                 icache_inv_over;
assign ifctrl_pcgen_ins_icache_inv_done = icache_line_inv_done || 
                                         (icache_inv_cur_state[3:0] == INS_INV_ALL) && 
                                          icache_inv_over;
//==========================================================
//            Interface with Icache Interface
//==========================================================
assign ifctrl_icache_if_tag_req              = icache_inv_tag_req;
assign ifctrl_icache_if_reset_req            = icache_reset_inv_req;
assign ifctrl_icache_if_inv_on               = (icache_inv_cur_state[3:0] != IDLE);
assign ifctrl_icache_if_tag_wen[2:0]         = icache_inv_tag_wen[2:0];
assign ifctrl_icache_if_inv_fifo             = icache_inv_fifo;
assign ifctrl_icache_if_index[PC_WIDTH-2:0]  = icache_inv_index[PC_WIDTH-2:0];

assign ifctrl_icache_if_read_req_tag         = (icache_inv_cur_state[3:0] == READ_REQ) && 
                                                icache_read_tag;
assign ifctrl_icache_if_read_req_data0       = (icache_inv_cur_state[3:0] == READ_REQ) && 
                                               !icache_read_tag && !icache_read_way;
assign ifctrl_icache_if_read_req_data1       = (icache_inv_cur_state[3:0] == READ_REQ) && 
                                               !icache_read_tag &&  icache_read_way;                                             
assign ifctrl_icache_if_read_req_index[PC_WIDTH-2:0] = {23'b0,icache_read_index[16:1]};

//==========================================================
//              Interface with L1 Refill
//==========================================================
//Keep Refill SM will not interupt INV SM
assign ifctrl_l1_refill_inv_on       = (icache_inv_cur_state[3:0] != IDLE) ||
                                       ( 
                                         (icache_inv_cur_state[3:0] == IDLE) &&
                                         (
                                           icache_all_inv || 
                                           lsu_ifu_icache_line_inv || 
                                           lsu_ifu_icache_all_inv || 
                                           icache_read
                                         )
                                       );
// &Force("output","ifctrl_l1_refill_inv_on"); @690
assign ifctrl_l1_refill_inv_busy     = (icache_inv_cur_state[3:0] != IDLE);
assign ifctrl_l1_refill_ins_inv      = lsu_ifu_icache_line_inv || 
                                       lsu_ifu_icache_all_inv;
assign ifctrl_l1_refill_ins_inv_dn   = ifu_lsu_icache_inv_done;
//==========================================================
//              Interface with ipb
//==========================================================
assign ifctrl_ipb_inv_on = ifctrl_l1_refill_inv_on;

//==========================================================
//            The invalidation of BTB
//==========================================================
//The BTB invalidation signal is level signal, which should 
//be transfered to pulse signal
//Gate Clk                    
// &Instance("gated_clk_cell","x_btb_inv_flop_clk"); @707
gated_clk_cell  x_btb_inv_flop_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (btb_inv_flop_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (btb_inv_flop_clk_en),
  .module_en           (cp0_ifu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect( .clk_in         (forever_cpuclk), @708
//           .clk_out        (btb_inv_flop_clk),//Out Clock @709
//           .external_en    (1'b0), @710
//           .global_en      (cp0_yy_clk_en), @711
//           .local_en       (btb_inv_flop_clk_en),//Local Condition @712
//           .module_en      (cp0_ifu_icg_en) @713
//         ); @714
assign btb_inv_flop_clk_en = cp0_ifu_btb_inv ^ btb_inv_ff ||
                             btb_inv_dn ^ btb_inv_dn_ff;

always @(posedge btb_inv_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_inv_ff <= 1'b0;
  else
    btb_inv_ff <= cp0_ifu_btb_inv;
end
assign ifctrl_btb_inv    = cp0_ifu_btb_inv &&
                           !btb_inv_ff;
assign ifctrl_l0_btb_inv = cp0_ifu_btb_inv &&
                           !btb_inv_ff;

always @(posedge btb_inv_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_inv_dn_ff <= 1'b1;
  else
    btb_inv_dn_ff <= btb_inv_dn;
end
assign btb_inv_on = btb_ifctrl_inv_on;
assign btb_inv_dn = btb_ifctrl_inv_done;
assign ifu_cp0_btb_inv_done = btb_inv_dn && 
                              !btb_inv_dn_ff;
// &Force("input","cp0_ifu_btb_inv"); @745

//==========================================================
//            The invalidation of BHT
//==========================================================
//The BHT invalidation signal is level signal, which should 
//be transfered to pulse signal
//Gate Clk                    
// &Instance("gated_clk_cell","x_bht_inv_flop_clk"); @754
gated_clk_cell  x_bht_inv_flop_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (bht_inv_flop_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (bht_inv_flop_clk_en),
  .module_en           (cp0_ifu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect( .clk_in         (forever_cpuclk), @755
//           .clk_out        (bht_inv_flop_clk),//Out Clock @756
//           .external_en    (1'b0), @757
//           .global_en      (cp0_yy_clk_en), @758
//           .local_en       (bht_inv_flop_clk_en),//Local Condition @759
//           .module_en      (cp0_ifu_icg_en) @760
//         ); @761
assign bht_inv_flop_clk_en = cp0_ifu_bht_inv ^ bht_inv_ff || 
                             bht_inv_dn ^ bht_inv_dn_ff;

always @(posedge bht_inv_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_inv_ff <= 1'b0;
  else
    bht_inv_ff <= cp0_ifu_bht_inv;
end
assign ifctrl_bht_inv = cp0_ifu_bht_inv &&
                        !bht_inv_ff;

always @(posedge bht_inv_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_inv_dn_ff <= 1'b1;
  else
    bht_inv_dn_ff <= bht_inv_dn;
end
assign bht_inv_on = bht_ifctrl_inv_on;
assign bht_inv_dn = bht_ifctrl_inv_done;
assign ifu_cp0_bht_inv_done = bht_inv_dn && 
                              !bht_inv_dn_ff;

//==========================================================
//            The invalidation of IND_BTB
//==========================================================
//The IND_BTB invalidation signal is level signal, which should 
//be transfered to pulse signal
// &Instance("gated_clk_cell","x_ibp_inv_flop_clk"); @793
gated_clk_cell  x_ibp_inv_flop_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (ibp_inv_flop_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (ibp_inv_flop_clk_en),
  .module_en           (cp0_ifu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect( .clk_in         (forever_cpuclk), @794
//           .clk_out        (ibp_inv_flop_clk),//Out Clock @795
//           .external_en    (1'b0), @796
//           .global_en      (cp0_yy_clk_en), @797
//           .local_en       (ibp_inv_flop_clk_en),//Local Condition @798
//           .module_en      (cp0_ifu_icg_en) @799
//         ); @800
assign ibp_inv_flop_clk_en = cp0_ifu_ind_btb_inv ^ ind_btb_inv_ff || 
                             ind_btb_inv_dn ^ ind_btb_inv_dn_ff;  

always @(posedge ibp_inv_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ind_btb_inv_ff <= 1'b0;
  else
    ind_btb_inv_ff <= cp0_ifu_ind_btb_inv;
end
assign ifctrl_ind_btb_inv = cp0_ifu_ind_btb_inv &&
                           !ind_btb_inv_ff;

always @(posedge ibp_inv_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ind_btb_inv_dn_ff <= 1'b1;
  else
    ind_btb_inv_dn_ff <= ind_btb_inv_dn;
end
assign ind_btb_inv_on = ind_btb_ifctrl_inv_on;
assign ind_btb_inv_dn = ind_btb_ifctrl_inv_done;
assign ifu_cp0_ind_btb_inv_done = ind_btb_inv_dn && 
                                 !ind_btb_inv_dn_ff;

//==========================================================
//               The invalidation of CP0
//==========================================================
// &Force("bus","icache_read_index",16,0); @832
assign icache_read_tag                 = cp0_ifu_icache_read_tag; //1 for tag, 0 for data
assign icache_read_way                 = cp0_ifu_icache_read_way;
assign icache_read_index[16:0]         = cp0_ifu_icache_read_index[16:0];

// &Instance("gated_clk_cell","x_icache_read_clk"); @840
gated_clk_cell  x_icache_read_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icache_read_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (icache_read_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @841
//           .clk_out        (icache_read_clk),//Out Clock @842
//           .external_en    (1'b0), @843
//           .global_en      (cp0_yy_clk_en), @844
//           .local_en       (icache_read_clk_en),//Local Condition @845
//           .module_en      (cp0_ifu_icg_en) @846
//         ); @847
assign icache_read_clk_en   = icache_read_pipe_vld;
assign icache_read_pipe_vld = (icache_inv_cur_state[3:0] == READ_RD);


always @(posedge icache_read_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    icache_if_ifctrl_tag_data0_reg[28:0]   <=  29'b0;
    icache_if_ifctrl_tag_data1_reg[28:0]   <=  29'b0;
    icache_if_ifctrl_inst_data0_reg[127:0] <= 128'b0;
    icache_if_ifctrl_inst_data1_reg[127:0] <= 128'b0;
  end
  else if(icache_read_pipe_vld)
  begin
    icache_if_ifctrl_tag_data0_reg[28:0]   <= icache_if_ifctrl_tag_data0[28:0];
    icache_if_ifctrl_tag_data1_reg[28:0]   <= icache_if_ifctrl_tag_data1[28:0];
    icache_if_ifctrl_inst_data0_reg[127:0] <= icache_if_ifctrl_inst_data0[127:0];
    icache_if_ifctrl_inst_data1_reg[127:0] <= icache_if_ifctrl_inst_data1[127:0];
  end
  else
  begin
    icache_if_ifctrl_tag_data0_reg[28:0]   <= icache_if_ifctrl_tag_data0_reg[28:0];
    icache_if_ifctrl_tag_data1_reg[28:0]   <= icache_if_ifctrl_tag_data1_reg[28:0];
    icache_if_ifctrl_inst_data0_reg[127:0] <= icache_if_ifctrl_inst_data0_reg[127:0];
    icache_if_ifctrl_inst_data1_reg[127:0] <= icache_if_ifctrl_inst_data1_reg[127:0];
  end
end  

assign ifu_cp0_icache_read_data_vld    = (icache_inv_cur_state[3:0] == READ_ST);
assign ifu_cp0_icache_read_data[127:0] = (icache_read_tag)
                                       ? (icache_read_way)
                                         ? {96'b0, icache_if_ifctrl_tag_data1_reg[19:0], 11'b0, icache_if_ifctrl_tag_data1_reg[20]}
                                         : {96'b0, icache_if_ifctrl_tag_data0_reg[19:0], 11'b0, icache_if_ifctrl_tag_data0_reg[20]} 
                                       : (icache_read_way)
                                          ? icache_if_ifctrl_inst_data1_reg[127:0]
                                          : icache_if_ifctrl_inst_data0_reg[127:0];  

//Debug_infor
assign ifctrl_debug_if_stall       = if_self_stall;
assign ifctrl_debug_if_pc_vld      = if_pc_vld;
assign ifctrl_debug_way_pred_stall = pcgen_ifctrl_way_pred_stall;
assign ifctrl_debug_if_vld         = if_vld;
assign ifctrl_debug_mmu_pavld      = mmu_ifu_pavld;
assign ifctrl_debug_lsu_all_inv    = lsu_ifu_icache_all_inv;
assign ifctrl_debug_lsu_line_inv   = lsu_ifu_icache_line_inv;
assign ifctrl_debug_inv_st[3:0]    = icache_inv_cur_state[3:0];

// &ModuleEnd; @947
endmodule


