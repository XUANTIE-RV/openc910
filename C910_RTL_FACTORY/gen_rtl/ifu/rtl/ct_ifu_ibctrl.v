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
module ct_ifu_ibctrl(
  addrgen_ibctrl_cancel,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
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
  ibctrl_ibdp_buf_stall,
  ibctrl_ibdp_bypass_inst_vld,
  ibctrl_ibdp_cancel,
  ibctrl_ibdp_chgflw,
  ibctrl_ibdp_fifo_full_stall,
  ibctrl_ibdp_fifo_stall,
  ibctrl_ibdp_ibuf_inst_vld,
  ibctrl_ibdp_if_chgflw_vld,
  ibctrl_ibdp_ind_btb_rd_stall,
  ibctrl_ibdp_ip_chgflw_vld,
  ibctrl_ibdp_l0_btb_hit,
  ibctrl_ibdp_l0_btb_mispred,
  ibctrl_ibdp_l0_btb_miss,
  ibctrl_ibdp_l0_btb_wait,
  ibctrl_ibdp_lbuf_inst_vld,
  ibctrl_ibdp_mispred_stall,
  ibctrl_ibdp_self_stall,
  ibctrl_ibuf_bypass_not_select,
  ibctrl_ibuf_create_vld,
  ibctrl_ibuf_data_vld,
  ibctrl_ibuf_flush,
  ibctrl_ibuf_merge_vld,
  ibctrl_ibuf_retire_vld,
  ibctrl_ind_btb_check_vld,
  ibctrl_ind_btb_fifo_stall,
  ibctrl_ind_btb_path,
  ibctrl_ipctrl_low_power_stall,
  ibctrl_ipctrl_stall,
  ibctrl_ipdp_chgflw_vl,
  ibctrl_ipdp_chgflw_vlmul,
  ibctrl_ipdp_chgflw_vsew,
  ibctrl_ipdp_pcload,
  ibctrl_lbuf_bju_mispred,
  ibctrl_lbuf_create_vld,
  ibctrl_lbuf_flush,
  ibctrl_lbuf_retire_vld,
  ibctrl_pcfifo_if_create_vld,
  ibctrl_pcfifo_if_ind_btb_miss,
  ibctrl_pcfifo_if_ind_target_pc,
  ibctrl_pcfifo_if_ras_target_pc,
  ibctrl_pcfifo_if_ras_vld,
  ibctrl_pcgen_ip_stall,
  ibctrl_pcgen_pc,
  ibctrl_pcgen_pcload,
  ibctrl_pcgen_pcload_vld,
  ibctrl_pcgen_way_pred,
  ibctrl_ras_inst_pcall,
  ibctrl_ras_pcall_vld,
  ibctrl_ras_pcall_vld_for_gateclk,
  ibctrl_ras_preturn_vld,
  ibctrl_ras_preturn_vld_for_gateclk,
  ibdp_ibctrl_chgflw_vl,
  ibdp_ibctrl_chgflw_vlmul,
  ibdp_ibctrl_chgflw_vsew,
  ibdp_ibctrl_default_pc,
  ibdp_ibctrl_hn_ind_br,
  ibdp_ibctrl_hn_pcall,
  ibdp_ibctrl_hn_preturn,
  ibdp_ibctrl_l0_btb_mispred_pc,
  ibdp_ibctrl_ras_chgflw_mask,
  ibdp_ibctrl_ras_mistaken,
  ibdp_ibctrl_ras_pc,
  ibdp_ibctrl_vpc,
  ibuf_ibctrl_empty,
  ibuf_ibctrl_stall,
  idu_ifu_id_bypass_stall,
  idu_ifu_id_stall,
  ifu_idu_ib_pipedown_gateclk,
  ind_btb_ibctrl_dout,
  ind_btb_ibctrl_priv_mode,
  ipctrl_ibctrl_expt_vld,
  ipctrl_ibctrl_if_chgflw_vld,
  ipctrl_ibctrl_ip_chgflw_vld,
  ipctrl_ibctrl_l0_btb_hit,
  ipctrl_ibctrl_l0_btb_mispred,
  ipctrl_ibctrl_l0_btb_miss,
  ipctrl_ibctrl_l0_btb_st_wait,
  ipctrl_ibctrl_vld,
  ipdp_ibdp_vl_reg,
  ipdp_ibdp_vlmul_reg,
  ipdp_ibdp_vsew_reg,
  iu_ifu_chgflw_vld,
  iu_ifu_mispred_stall,
  iu_ifu_pcfifo_full,
  lbuf_ibctrl_active_idle_flush,
  lbuf_ibctrl_chgflw_pc,
  lbuf_ibctrl_chgflw_pred,
  lbuf_ibctrl_chgflw_vl,
  lbuf_ibctrl_chgflw_vld,
  lbuf_ibctrl_chgflw_vlmul,
  lbuf_ibctrl_chgflw_vsew,
  lbuf_ibctrl_lbuf_active,
  lbuf_ibctrl_stall,
  pad_yy_icg_scan_en,
  pcfifo_if_ibctrl_more_than_two,
  pcgen_ibctrl_bju_chgflw,
  pcgen_ibctrl_cancel,
  pcgen_ibctrl_ibuf_flush,
  pcgen_ibctrl_lbuf_flush
);

// &Ports; @23
input           addrgen_ibctrl_cancel;             
input           cp0_ifu_icg_en;                    
input           cp0_yy_clk_en;                     
input           cpurst_b;                          
input           forever_cpuclk;                    
input   [7 :0]  ibdp_ibctrl_chgflw_vl;             
input   [1 :0]  ibdp_ibctrl_chgflw_vlmul;          
input   [2 :0]  ibdp_ibctrl_chgflw_vsew;           
input   [38:0]  ibdp_ibctrl_default_pc;            
input   [7 :0]  ibdp_ibctrl_hn_ind_br;             
input   [7 :0]  ibdp_ibctrl_hn_pcall;              
input   [7 :0]  ibdp_ibctrl_hn_preturn;            
input   [38:0]  ibdp_ibctrl_l0_btb_mispred_pc;     
input           ibdp_ibctrl_ras_chgflw_mask;       
input           ibdp_ibctrl_ras_mistaken;          
input   [38:0]  ibdp_ibctrl_ras_pc;                
input   [38:0]  ibdp_ibctrl_vpc;                   
input           ibuf_ibctrl_empty;                 
input           ibuf_ibctrl_stall;                 
input           idu_ifu_id_bypass_stall;           
input           idu_ifu_id_stall;                  
input   [22:0]  ind_btb_ibctrl_dout;               
input   [1 :0]  ind_btb_ibctrl_priv_mode;          
input           ipctrl_ibctrl_expt_vld;            
input           ipctrl_ibctrl_if_chgflw_vld;       
input           ipctrl_ibctrl_ip_chgflw_vld;       
input           ipctrl_ibctrl_l0_btb_hit;          
input           ipctrl_ibctrl_l0_btb_mispred;      
input           ipctrl_ibctrl_l0_btb_miss;         
input           ipctrl_ibctrl_l0_btb_st_wait;      
input           ipctrl_ibctrl_vld;                 
input   [7 :0]  ipdp_ibdp_vl_reg;                  
input   [1 :0]  ipdp_ibdp_vlmul_reg;               
input   [2 :0]  ipdp_ibdp_vsew_reg;                
input           iu_ifu_chgflw_vld;                 
input           iu_ifu_mispred_stall;              
input           iu_ifu_pcfifo_full;                
input           lbuf_ibctrl_active_idle_flush;     
input   [38:0]  lbuf_ibctrl_chgflw_pc;             
input   [1 :0]  lbuf_ibctrl_chgflw_pred;           
input   [7 :0]  lbuf_ibctrl_chgflw_vl;             
input           lbuf_ibctrl_chgflw_vld;            
input   [1 :0]  lbuf_ibctrl_chgflw_vlmul;          
input   [2 :0]  lbuf_ibctrl_chgflw_vsew;           
input           lbuf_ibctrl_lbuf_active;           
input           lbuf_ibctrl_stall;                 
input           pad_yy_icg_scan_en;                
input           pcfifo_if_ibctrl_more_than_two;    
input           pcgen_ibctrl_bju_chgflw;           
input           pcgen_ibctrl_cancel;               
input           pcgen_ibctrl_ibuf_flush;           
input           pcgen_ibctrl_lbuf_flush;           
output          ibctrl_debug_buf_stall;            
output          ibctrl_debug_bypass_inst_vld;      
output          ibctrl_debug_fifo_full_stall;      
output          ibctrl_debug_fifo_stall;           
output          ibctrl_debug_ib_expt_vld;          
output          ibctrl_debug_ib_ip_stall;          
output          ibctrl_debug_ib_vld;               
output          ibctrl_debug_ibuf_empty;           
output          ibctrl_debug_ibuf_full;            
output          ibctrl_debug_ibuf_inst_vld;        
output          ibctrl_debug_ind_btb_stall;        
output          ibctrl_debug_lbuf_inst_vld;        
output          ibctrl_debug_mispred_stall;        
output          ibctrl_ibdp_buf_stall;             
output          ibctrl_ibdp_bypass_inst_vld;       
output          ibctrl_ibdp_cancel;                
output          ibctrl_ibdp_chgflw;                
output          ibctrl_ibdp_fifo_full_stall;       
output          ibctrl_ibdp_fifo_stall;            
output          ibctrl_ibdp_ibuf_inst_vld;         
output          ibctrl_ibdp_if_chgflw_vld;         
output          ibctrl_ibdp_ind_btb_rd_stall;      
output          ibctrl_ibdp_ip_chgflw_vld;         
output          ibctrl_ibdp_l0_btb_hit;            
output          ibctrl_ibdp_l0_btb_mispred;        
output          ibctrl_ibdp_l0_btb_miss;           
output          ibctrl_ibdp_l0_btb_wait;           
output          ibctrl_ibdp_lbuf_inst_vld;         
output          ibctrl_ibdp_mispred_stall;         
output          ibctrl_ibdp_self_stall;            
output          ibctrl_ibuf_bypass_not_select;     
output          ibctrl_ibuf_create_vld;            
output          ibctrl_ibuf_data_vld;              
output          ibctrl_ibuf_flush;                 
output          ibctrl_ibuf_merge_vld;             
output          ibctrl_ibuf_retire_vld;            
output          ibctrl_ind_btb_check_vld;          
output          ibctrl_ind_btb_fifo_stall;         
output  [7 :0]  ibctrl_ind_btb_path;               
output          ibctrl_ipctrl_low_power_stall;     
output          ibctrl_ipctrl_stall;               
output  [7 :0]  ibctrl_ipdp_chgflw_vl;             
output  [1 :0]  ibctrl_ipdp_chgflw_vlmul;          
output  [2 :0]  ibctrl_ipdp_chgflw_vsew;           
output          ibctrl_ipdp_pcload;                
output          ibctrl_lbuf_bju_mispred;           
output          ibctrl_lbuf_create_vld;            
output          ibctrl_lbuf_flush;                 
output          ibctrl_lbuf_retire_vld;            
output          ibctrl_pcfifo_if_create_vld;       
output          ibctrl_pcfifo_if_ind_btb_miss;     
output  [38:0]  ibctrl_pcfifo_if_ind_target_pc;    
output  [38:0]  ibctrl_pcfifo_if_ras_target_pc;    
output          ibctrl_pcfifo_if_ras_vld;          
output          ibctrl_pcgen_ip_stall;             
output  [38:0]  ibctrl_pcgen_pc;                   
output          ibctrl_pcgen_pcload;               
output          ibctrl_pcgen_pcload_vld;           
output  [1 :0]  ibctrl_pcgen_way_pred;             
output          ibctrl_ras_inst_pcall;             
output          ibctrl_ras_pcall_vld;              
output          ibctrl_ras_pcall_vld_for_gateclk;  
output          ibctrl_ras_preturn_vld;            
output          ibctrl_ras_preturn_vld_for_gateclk; 
output          ifu_idu_ib_pipedown_gateclk;       

// &Regs; @24
reg     [38:0]  chgflw_pc;                         
reg     [7 :0]  chgflw_vl;                         
reg     [1 :0]  chgflw_vlmul;                      
reg     [2 :0]  chgflw_vsew;                       
reg             ind_btb_rd_state;                  
reg     [1 :0]  way_pred;                          

// &Wires; @25
wire            addrgen_ibctrl_cancel;             
wire            buf_create_vld;                    
wire            buf_stall;                         
wire            bypass_inst_vld;                   
wire            chgflw_vld;                        
wire            cp0_ifu_icg_en;                    
wire            cp0_yy_clk_en;                     
wire            cpurst_b;                          
wire            fifo_create_vld;                   
wire            fifo_full_stall;                   
wire            fifo_stall;                        
wire            forever_cpuclk;                    
wire    [7 :0]  hn_ind_br;                         
wire    [7 :0]  hn_mispred_stall;                  
wire    [7 :0]  hn_pcall;                          
wire    [7 :0]  hn_preturn;                        
wire            ib_addr_cancel;                    
wire            ib_cancel;                         
wire            ib_chgflw_self_stall;              
wire            ib_data_vld;                       
wire            ib_expt_low_power_stall;           
wire            ib_expt_vld;                       
wire    [38:0]  ib_vpc;                            
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
wire            ibctrl_ibdp_buf_stall;             
wire            ibctrl_ibdp_bypass_inst_vld;       
wire            ibctrl_ibdp_cancel;                
wire            ibctrl_ibdp_chgflw;                
wire            ibctrl_ibdp_fifo_full_stall;       
wire            ibctrl_ibdp_fifo_stall;            
wire            ibctrl_ibdp_ibuf_inst_vld;         
wire            ibctrl_ibdp_if_chgflw_vld;         
wire            ibctrl_ibdp_ind_btb_rd_stall;      
wire            ibctrl_ibdp_ip_chgflw_vld;         
wire            ibctrl_ibdp_l0_btb_hit;            
wire            ibctrl_ibdp_l0_btb_mispred;        
wire            ibctrl_ibdp_l0_btb_miss;           
wire            ibctrl_ibdp_l0_btb_wait;           
wire            ibctrl_ibdp_lbuf_inst_vld;         
wire            ibctrl_ibdp_mispred_stall;         
wire            ibctrl_ibdp_self_stall;            
wire            ibctrl_ibuf_bypass_not_select;     
wire            ibctrl_ibuf_create_vld;            
wire            ibctrl_ibuf_data_vld;              
wire            ibctrl_ibuf_flush;                 
wire            ibctrl_ibuf_merge_vld;             
wire            ibctrl_ibuf_retire_vld;            
wire            ibctrl_ind_btb_check_vld;          
wire            ibctrl_ind_btb_fifo_stall;         
wire    [7 :0]  ibctrl_ind_btb_path;               
wire            ibctrl_ipctrl_low_power_stall;     
wire            ibctrl_ipctrl_stall;               
wire    [7 :0]  ibctrl_ipdp_chgflw_vl;             
wire    [1 :0]  ibctrl_ipdp_chgflw_vlmul;          
wire    [2 :0]  ibctrl_ipdp_chgflw_vsew;           
wire            ibctrl_ipdp_pcload;                
wire            ibctrl_lbuf_bju_mispred;           
wire            ibctrl_lbuf_create_vld;            
wire            ibctrl_lbuf_flush;                 
wire            ibctrl_lbuf_retire_vld;            
wire            ibctrl_pcfifo_if_create_vld;       
wire            ibctrl_pcfifo_if_ind_btb_miss;     
wire    [38:0]  ibctrl_pcfifo_if_ind_target_pc;    
wire    [38:0]  ibctrl_pcfifo_if_ras_target_pc;    
wire            ibctrl_pcfifo_if_ras_vld;          
wire            ibctrl_pcgen_ip_stall;             
wire    [38:0]  ibctrl_pcgen_pc;                   
wire            ibctrl_pcgen_pcload;               
wire            ibctrl_pcgen_pcload_vld;           
wire    [1 :0]  ibctrl_pcgen_way_pred;             
wire            ibctrl_ras_inst_pcall;             
wire            ibctrl_ras_pcall_vld;              
wire            ibctrl_ras_pcall_vld_for_gateclk;  
wire            ibctrl_ras_preturn_vld;            
wire            ibctrl_ras_preturn_vld_for_gateclk; 
wire    [7 :0]  ibdp_ibctrl_chgflw_vl;             
wire    [1 :0]  ibdp_ibctrl_chgflw_vlmul;          
wire    [2 :0]  ibdp_ibctrl_chgflw_vsew;           
wire    [38:0]  ibdp_ibctrl_default_pc;            
wire    [7 :0]  ibdp_ibctrl_hn_ind_br;             
wire    [7 :0]  ibdp_ibctrl_hn_pcall;              
wire    [7 :0]  ibdp_ibctrl_hn_preturn;            
wire    [38:0]  ibdp_ibctrl_l0_btb_mispred_pc;     
wire            ibdp_ibctrl_ras_chgflw_mask;       
wire            ibdp_ibctrl_ras_mistaken;          
wire    [38:0]  ibdp_ibctrl_ras_pc;                
wire    [38:0]  ibdp_ibctrl_vpc;                   
wire            ibuf_create_vld;                   
wire            ibuf_empty;                        
wire            ibuf_ibctrl_empty;                 
wire            ibuf_ibctrl_stall;                 
wire            ibuf_inst_vld;                     
wire            ibuf_retire_vld;                   
wire            idu_ifu_id_bypass_stall;           
wire            idu_ifu_id_stall;                  
wire            idu_stall;                         
wire            ifu_idu_ib_pipedown_gateclk;       
wire    [22:0]  ind_btb_ibctrl_dout;               
wire    [1 :0]  ind_btb_ibctrl_priv_mode;          
wire            ind_btb_rd_stall;                  
wire            ind_btb_rd_state_clk;              
wire            ind_btb_rd_state_clk_en;           
wire            ind_btb_rd_vld;                    
wire    [38:0]  ind_chgflw_pc;                     
wire            ind_chgflw_vld;                    
wire    [1 :0]  ind_way_pred;                      
wire            ipctrl_ibctrl_expt_vld;            
wire            ipctrl_ibctrl_if_chgflw_vld;       
wire            ipctrl_ibctrl_ip_chgflw_vld;       
wire            ipctrl_ibctrl_l0_btb_hit;          
wire            ipctrl_ibctrl_l0_btb_mispred;      
wire            ipctrl_ibctrl_l0_btb_miss;         
wire            ipctrl_ibctrl_l0_btb_st_wait;      
wire            ipctrl_ibctrl_vld;                 
wire    [7 :0]  ipdp_ibdp_vl_reg;                  
wire    [1 :0]  ipdp_ibdp_vlmul_reg;               
wire    [2 :0]  ipdp_ibdp_vsew_reg;                
wire            iu_ifu_chgflw_vld;                 
wire            iu_ifu_mispred_stall;              
wire            iu_ifu_pcfifo_full;                
wire            l0_btb_ras_mistaken;               
wire            lbuf_active;                       
wire    [38:0]  lbuf_chgflw_pc;                    
wire    [1 :0]  lbuf_chgflw_pred;                  
wire    [7 :0]  lbuf_chgflw_vl;                    
wire            lbuf_chgflw_vld;                   
wire    [1 :0]  lbuf_chgflw_vlmul;                 
wire    [2 :0]  lbuf_chgflw_vsew;                  
wire            lbuf_create_vld;                   
wire            lbuf_ibctrl_active_idle_flush;     
wire    [38:0]  lbuf_ibctrl_chgflw_pc;             
wire    [1 :0]  lbuf_ibctrl_chgflw_pred;           
wire    [7 :0]  lbuf_ibctrl_chgflw_vl;             
wire            lbuf_ibctrl_chgflw_vld;            
wire    [1 :0]  lbuf_ibctrl_chgflw_vlmul;          
wire    [2 :0]  lbuf_ibctrl_chgflw_vsew;           
wire            lbuf_ibctrl_lbuf_active;           
wire            lbuf_ibctrl_stall;                 
wire            lbuf_inst_vld;                     
wire            lbuf_retire_vld;                   
wire            merge_inst_vld;                    
wire            mispred_stall;                     
wire            pad_yy_icg_scan_en;                
wire            pcfifo_create_vld;                 
wire            pcfifo_if_ibctrl_more_than_two;    
wire            pcfifo_stall;                      
wire            pcgen_ibctrl_bju_chgflw;           
wire            pcgen_ibctrl_cancel;               
wire            pcgen_ibctrl_ibuf_flush;           
wire            pcgen_ibctrl_lbuf_flush;           
wire            ras_chgflw_mask;                   
wire    [38:0]  ras_chgflw_pc;                     
wire            ras_chgflw_vld;                    
wire    [1 :0]  ras_way_pred;                      


parameter PC_WIDTH = 40;
//==========================================================
//                IB Stage Change Flow
//==========================================================
//------------------ib stage chgflw pc----------------------
//  1.ras chgflw pc
//  2.ind_btb chgflw pc
//  3.lbuf chgflw pc
assign ibctrl_pcgen_pc[PC_WIDTH-2:0] = chgflw_pc[PC_WIDTH-2:0];
assign ibctrl_pcgen_way_pred[1:0]    = way_pred[1:0];

// &CombBeg; @38
always @( ras_chgflw_vld
       or ras_chgflw_pc[38:0]
       or lbuf_chgflw_pc[38:0]
       or lbuf_chgflw_vld
       or ind_chgflw_vld
       or ind_chgflw_pc[38:0]
       or ibdp_ibctrl_l0_btb_mispred_pc[38:0])
begin
if(lbuf_chgflw_vld)
  chgflw_pc[PC_WIDTH-2:0] = lbuf_chgflw_pc[PC_WIDTH-2:0];
else if(ras_chgflw_vld)
  chgflw_pc[PC_WIDTH-2:0] = ras_chgflw_pc[PC_WIDTH-2:0];
else if(ind_chgflw_vld)
  chgflw_pc[PC_WIDTH-2:0] = ind_chgflw_pc[PC_WIDTH-2:0];
else
  chgflw_pc[PC_WIDTH-2:0] = ibdp_ibctrl_l0_btb_mispred_pc[PC_WIDTH-2:0];
// &CombEnd; @47
end

// &CombBeg; @49
always @( ras_chgflw_vld
       or lbuf_chgflw_vld
       or lbuf_chgflw_pred[1:0]
       or ind_chgflw_vld
       or ind_way_pred[1:0]
       or ras_way_pred[1:0])
begin
if(lbuf_chgflw_vld)
  way_pred[1:0] = lbuf_chgflw_pred[1:0];
else if(ras_chgflw_vld)
  way_pred[1:0] = ras_way_pred[1:0];
else if(ind_chgflw_vld)
  way_pred[1:0] = ind_way_pred[1:0];
else
  way_pred[1:0] = 2'b11;
// &CombEnd; @58
end


// &CombBeg; @61
always @( ras_chgflw_vld
       or lbuf_chgflw_vld
       or ipdp_ibdp_vlmul_reg[1:0]
       or ind_chgflw_vld
       or lbuf_chgflw_vlmul[1:0]
       or ibdp_ibctrl_chgflw_vlmul[1:0])
begin
if(lbuf_chgflw_vld)
  chgflw_vlmul[1:0] = lbuf_chgflw_vlmul[1:0];
else if(ras_chgflw_vld || ind_chgflw_vld)
  chgflw_vlmul[1:0] = ibdp_ibctrl_chgflw_vlmul[1:0];
else
  chgflw_vlmul[1:0] = ipdp_ibdp_vlmul_reg[1:0];
// &CombEnd; @68
end

// &CombBeg; @70
always @( ras_chgflw_vld
       or ibdp_ibctrl_chgflw_vsew[2:0]
       or lbuf_chgflw_vld
       or lbuf_chgflw_vsew[2:0]
       or ind_chgflw_vld
       or ipdp_ibdp_vsew_reg[2:0])
begin
if(lbuf_chgflw_vld)
  chgflw_vsew[2:0] = lbuf_chgflw_vsew[2:0];
else if(ras_chgflw_vld || ind_chgflw_vld)
  chgflw_vsew[2:0] = ibdp_ibctrl_chgflw_vsew[2:0];
else
  chgflw_vsew[2:0] = ipdp_ibdp_vsew_reg[2:0];
// &CombEnd; @77
end


// &CombBeg; @80
always @( ibdp_ibctrl_chgflw_vl[7:0]
       or lbuf_chgflw_vl[7:0]
       or ras_chgflw_vld
       or lbuf_chgflw_vld
       or ind_chgflw_vld
       or ipdp_ibdp_vl_reg[7:0])
begin
if(lbuf_chgflw_vld)
  chgflw_vl[7:0] = lbuf_chgflw_vl[7:0];
else if(ras_chgflw_vld || ind_chgflw_vld)
  chgflw_vl[7:0] = ibdp_ibctrl_chgflw_vl[7:0];
else
  chgflw_vl[7:0] = ipdp_ibdp_vl_reg[7:0];
// &CombEnd; @87
end


assign lbuf_chgflw_vld              = lbuf_ibctrl_chgflw_vld;
assign lbuf_chgflw_pc[PC_WIDTH-2:0] = lbuf_ibctrl_chgflw_pc[PC_WIDTH-2:0];
assign lbuf_chgflw_pred[1:0]        = lbuf_ibctrl_chgflw_pred[1:0];
assign lbuf_chgflw_vlmul[1:0]       = lbuf_ibctrl_chgflw_vlmul[1:0];
assign lbuf_chgflw_vsew[2:0]        = lbuf_ibctrl_chgflw_vsew[2:0];
assign lbuf_chgflw_vl[7:0]          = lbuf_ibctrl_chgflw_vl[7:0]; 
assign ind_chgflw_vld               = ib_data_vld && (|hn_ind_br[7:0]) && ind_btb_rd_state;
//if IBP not valid or not define
//take next 128 PC as predict PC
assign ind_btb_rd_vld              =  ind_btb_ibctrl_dout[22] 
                                   && (ind_btb_ibctrl_dout[21:20] == ind_btb_ibctrl_priv_mode[1:0]);
assign ind_chgflw_pc[PC_WIDTH-2:0] = (ind_btb_rd_vld) 
                                   ? {ib_vpc[PC_WIDTH-2:20], ind_btb_ibctrl_dout[19:0]}
                                   : ibdp_ibctrl_default_pc[PC_WIDTH-2:0]; //Ind BTB Miss
assign ind_way_pred[1:0]           = (ind_btb_rd_vld) 
                                   ? 2'b11 
                                   : 2'b00; //Ind BTB Miss
//if RAS not valid
//take next 128 PC as predict PC
assign ras_chgflw_vld              = ib_data_vld && (|hn_preturn[7:0]);
assign ras_chgflw_mask             = ibdp_ibctrl_ras_chgflw_mask;
assign ras_chgflw_pc[PC_WIDTH-2:0] = ibdp_ibctrl_ras_pc[PC_WIDTH-2:0];
assign ras_way_pred[1:0]           = 2'b11;

assign hn_ind_br[7:0]              = ibdp_ibctrl_hn_ind_br[7:0]  & {8{~ib_expt_vld}};
assign hn_pcall[7:0]               = ibdp_ibctrl_hn_pcall[7:0]   & {8{~ib_expt_vld}};
assign hn_preturn[7:0]             = ibdp_ibctrl_hn_preturn[7:0] & {8{~ib_expt_vld}};
assign ib_vpc[PC_WIDTH-2:0]        = ibdp_ibctrl_vpc[PC_WIDTH-2:0];

//--------------------ib stage chgflw valid-----------------
//  1.rsa chgflw valid || 
//  2.ind branch chgflw valid || 
//  3.lbuf chgflw valid
//  4.!ib_self_chgflw_cancel
assign ibctrl_pcgen_pcload     = chgflw_vld;
assign ibctrl_pcgen_pcload_vld = chgflw_vld 
                              && !ib_chgflw_self_stall;
assign ibctrl_ibdp_chgflw   = chgflw_vld;
assign chgflw_vld           = (
                                ras_chgflw_vld && !ras_chgflw_mask || 
                                ind_chgflw_vld || 
                                lbuf_chgflw_vld ||
                                l0_btb_ras_mistaken
                              ) && 
                              !ib_expt_vld;//in case of data = 'bx
assign ib_data_vld          = ipctrl_ibctrl_vld;
assign ib_expt_vld          = ipctrl_ibctrl_expt_vld;

//ib_chgflw_self_stall
//  1.ibuf full or lbuf special state stall
//  2.more than 2 pc_oper/load inst stall
//  3.pcfifo full stall
//  4.iu mispredict valid & ifu fetch indbr/ras inst stall
//  5.ind_btb result not valid will satll one cycle
//For 2, fifo_stall & 5, ind_btb_rd_stall:
//if it not caccel ib_chgflw
//next cycle pipeline will stall until ib chgflw happen
//ib change flow will cancel previous ib chgflw
//Thus we need not use fifo stall cancel ib chgflw
assign ib_chgflw_self_stall = buf_stall || 
                              fifo_full_stall || 
                              mispred_stall;
assign ibctrl_ibdp_mispred_stall    = mispred_stall;
assign ibctrl_ibdp_fifo_stall       = fifo_stall;
assign ibctrl_ibdp_buf_stall        = buf_stall;
assign ibctrl_ibdp_fifo_full_stall  = fifo_full_stall;
assign ibctrl_ibdp_ind_btb_rd_stall = ind_btb_rd_stall;
//==========================================================
//                   IB Stage Stall
//==========================================================
//---------------------Take Notice--------------------------
//idu_ifu_id_bypass_stall > idu_stall > iu_ifu_mispred_stall
//Which can be used to simplify logic

//ibctrl_ipctrl_stall
assign ibctrl_ipctrl_stall = mispred_stall || 
                             buf_stall || 
                             fifo_full_stall || 
                             fifo_stall || 
                             ind_btb_rd_stall;
// &Force("output","ibctrl_ipctrl_stall"); @177
assign ibctrl_pcgen_ip_stall = ibctrl_ipctrl_stall;

//ibctrl_ipctrl_low_power_stall
//For when low power req, cancel ip refill set to avoid deadlock
//In case of IDU does not access inst and IFU ibuf full
//Which condition IFU should not let ip_refill set
//Otherwise ip_refill will not let ifu_no_op set
assign ibctrl_ipctrl_low_power_stall = mispred_stall || 
                                       buf_stall || 
                                       //ibuf_ibctrl_stall && ib_data_vld || 
                                       fifo_full_stall ||
                                       ib_expt_low_power_stall;
                                       //fifo_stall || 
                                       //ind_btb_rd_stall;

//-----------------------buf_stall--------------------------
//buf_stall valid when
//  1.ibuf full or lbuf special state/full 
//  2.ip_ib_vld
assign buf_stall       = (
                           ib_data_vld && 
                           ibuf_ibctrl_stall //ibuf_full
                         ) || 
                         lbuf_ibctrl_stall; //lbuf front_branch/cache state

//--------------------fifo_full_stall----------------------
//lbuf active state, pcfifo will also be full
//Thus lbuf active should be treated as ib_data_vld
assign fifo_full_stall  = iu_ifu_pcfifo_full && 
                          (ib_data_vld || 
                           lbuf_active);

//----------------------mispred_stall----------------------
//mispred_stall valid when
//  1.iu mispred stall valid(from next cycle of mispred)
//  2.ifu ib stage fetch ras/ind_br inst
//  3.in case of IND_BTB or RAS predict Mistake
//mispred stall used for maintain ras & ind_btb right
//if iu_ifu_mispred_stall signal need ifu generate
//when iu_mispred, mispred_state_reg <= 1
//when rtu_retire_mispred, mispred_state_reg <= 0
assign mispred_stall   = iu_ifu_mispred_stall && 
                         ib_data_vld && 
                         !ib_expt_vld && 
                         (
                           (
                             |hn_pcall[7:0]   || 
                             |hn_preturn[7:0] || 
                             |hn_ind_br[7:0]
                           )
                         ); 
//-----------------------idu_stall--------------------------
//idu_stall means idu_ifu_id_stall
//which stop inst trans from ifu to idu
assign idu_stall       = idu_ifu_id_stall;

//----------------------fifo_stall--------------------------
//fifo_stall get may use 7-8 Gate, 
//which will make ib_chgflw_vld timing worse
//Considering ib chgflw not use fifo_stall
//And correct it by cancel IF stage
//fifo_stall valid when
//  1.pcfifo more than two inst
//  2.ip_ib_valid
assign fifo_stall      = ib_data_vld && pcfifo_stall; 
assign pcfifo_stall    = pcfifo_if_ibctrl_more_than_two && !ib_expt_vld;

//------------------ind_btb_rd_stall-----------------------
//ind_btb_rd_stall happens at the moment
//ib stage fetch ind_btb inst && ind_btb jmp state = 0
//Because ind_btb is rd in IB Stage, 
//whose result will not be got cur cycle
//Thus we use ind_btb_rd_stall to stall one cycle 
//and wait ind_btb result
always @(posedge ind_btb_rd_state_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ind_btb_rd_state <= 1'b0;
  else if(ib_cancel || ib_addr_cancel)
    ind_btb_rd_state <= 1'b0;
  else if(ind_btb_rd_stall)
    ind_btb_rd_state <= 1'b1; //ind_btb read
  else if(ind_btb_rd_state && chgflw_vld && !fifo_stall && !fifo_full_stall)
    ind_btb_rd_state <= 1'b0; //ind_jmp success
  else
    ind_btb_rd_state <= ind_btb_rd_state;
end
//Gate Clk
// &Instance("gated_clk_cell","x_ind_btb_rd_state_clk"); @267
gated_clk_cell  x_ind_btb_rd_state_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (ind_btb_rd_state_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (ind_btb_rd_state_clk_en),
  .module_en               (cp0_ifu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect( .clk_in         (forever_cpuclk), @268
//           .clk_out        (ind_btb_rd_state_clk),//Out Clock @269
//           .external_en    (1'b0), @270
//           .global_en      (cp0_yy_clk_en), @271
//           .local_en       (ind_btb_rd_state_clk_en),//Local Condition @272
//           .module_en      (cp0_ifu_icg_en) @273
//         ); @274
assign ind_btb_rd_state_clk_en = ib_cancel || 
                                 ib_addr_cancel || 
                                 ind_btb_rd_state || 
                                 ind_btb_rd_stall;

assign ind_btb_rd_stall = !ind_btb_rd_state && 
                          ib_data_vld && 
                          !ib_expt_vld && 
                          (|hn_ind_br[7:0]);                        

//------------------expt low power stall-----------------------
//when IB expt valid and ib pc doesn't cross 4K,IP refill will
//be masked
assign ib_expt_low_power_stall = ipctrl_ibctrl_expt_vld
                              && ipctrl_ibctrl_vld
                              && !(&ib_vpc[10:3]);


//==========================================================
//                   IB Stage Cancel
//==========================================================
//----------------------ib_cancel---------------------------
//ib_cancel means higher priority unit chgflw
//which should cancel ib stage operation:
//  1.cancel ibuf/lbuf write in
//  2.cancel pcfifo/ldfifo write in
//  3.cancel ibuf inst send to idu
//  4.cancel lbuf inst send to idu
//  5.cancel bypass inst send to idu
assign ib_cancel = pcgen_ibctrl_cancel;
//-------------------ib_addr_cancel-----------------------
//ib_addr_cancel means addrgen cancel signal send to ib stage
//when should cancel ib stage operation:
//  1.cancel ibuf/lbuf write in
//  2.cancel pcfifo/ldfifo write in
//  3.allow  ibuf inst send to idu
//  4.allow  lbuf inst send to idu
//  5.cancel bypass inst send to idu
assign ib_addr_cancel = addrgen_ibctrl_cancel;

//==========================================================
//                    IB Stage Valid
//==========================================================
//---------------------ib_ins_vld---------------------------
//ib_inst_vld means inst send to idu valid
//IU chgflw or RTU full inst valid will be maintain by IDU
//lbuf_inst_vld                       
assign lbuf_inst_vld   = lbuf_active && 
                         !fifo_full_stall && 
                         //!ib_inst_cancel && 
                         !mispred_stall;
//ibuf_inst_vld
assign ibuf_inst_vld   = !ibuf_empty && 
                         !lbuf_active && 
                         //!ib_inst_cancel && 
                         !mispred_stall;
//bypass_inst_vld
//When iu_ifu_mispred_stall            = 1                     
//     idu_ifu_id_bypass_stall always be 1
assign bypass_inst_vld = ib_data_vld && 
                         ibuf_empty && 
                         !lbuf_active && 
                         !buf_stall && 
                         !fifo_stall && 
                         !fifo_full_stall && 
                         !mispred_stall && 
                         !ib_addr_cancel && 
                         !ind_btb_rd_stall;
                         //!ib_inst_cancel && 
//                         !idu_ifu_id_bypass_stall;
//assign ib_inst_cancel = pcgen_ibctrl_inst_cancel;
//Gate_clk_en for idu use
assign merge_inst_vld  = ib_data_vld &&
                         !ib_expt_vld &&
                         !ibuf_empty &&
                         !lbuf_active && 
                         !buf_stall && 
                         !fifo_stall && 
                         !fifo_full_stall && 
                         !mispred_stall && 
                         !ib_addr_cancel && 
                         !ind_btb_rd_stall &&
                         !idu_stall && 
                         //!ib_inst_cancel && 
                         !idu_ifu_id_bypass_stall;


assign ifu_idu_ib_pipedown_gateclk = lbuf_inst_vld || 
                                     ibuf_inst_vld || 
                                     bypass_inst_vld; 
//                                     had_ifu_ir_vld;

assign lbuf_active = lbuf_ibctrl_lbuf_active;
assign ibuf_empty  = ibuf_ibctrl_empty;
                       
assign ibctrl_ibdp_lbuf_inst_vld   = lbuf_inst_vld;
assign ibctrl_ibdp_ibuf_inst_vld   = ibuf_inst_vld;
assign ibctrl_ibdp_bypass_inst_vld = bypass_inst_vld;
assign ibctrl_ibdp_cancel          = ib_addr_cancel || 
                                     ib_cancel;
assign ibctrl_ibdp_self_stall      = buf_stall || 
                                     fifo_full_stall || 
                                     fifo_stall || 
                                     mispred_stall;
assign ibctrl_ibdp_if_chgflw_vld   = ipctrl_ibctrl_if_chgflw_vld;
assign ibctrl_ibdp_ip_chgflw_vld   = ipctrl_ibctrl_ip_chgflw_vld;

//==========================================================
//                  ibuf control signal
//==========================================================
assign ibctrl_ibuf_flush      = pcgen_ibctrl_ibuf_flush;
assign ibctrl_ibuf_merge_vld  = merge_inst_vld;
assign ibctrl_ibuf_create_vld = ibuf_create_vld;
assign ibctrl_ibuf_retire_vld = ibuf_retire_vld;
assign ibctrl_ibuf_data_vld   = ib_data_vld;
//When can not send inst to IDU
//Not select bypass way
assign ibctrl_ibuf_bypass_not_select = idu_ifu_id_bypass_stall;
//create_vld when 
//  1.ib_data_vld
//  2.!cancel
//  3.!self_stall
assign buf_create_vld  = ib_data_vld && 
                         //!ib_cancel && 
                         !ib_addr_cancel && 
                         !(pcfifo_stall) && //fifo_stall
                         !(iu_ifu_mispred_stall && (|hn_mispred_stall[7:0])) && //mispred_stall
                         ! iu_ifu_pcfifo_full && //fifo_full_stall
                         !(!ind_btb_rd_state && (|hn_ind_br[7:0])); //ind_btb_rd_stall
assign ibuf_create_vld = buf_create_vld && 
                         !lbuf_active && 
                         !(ibuf_ibctrl_stall || lbuf_ibctrl_stall);
assign hn_mispred_stall[7:0] = (hn_pcall[7:0] | hn_preturn[7:0] | hn_ind_br[7:0]);

//retire_vld
//When iu_ifu_mispred_stall = 1
//idu_stall always be 1
assign ibuf_retire_vld = !ibuf_empty && 
                         //!lbuf_active && //lbuf_active, ibuf must be empty
                         !mispred_stall && 
                         !idu_stall;                        

//==========================================================
//                  lbuf control signal
//==========================================================
assign ibctrl_lbuf_flush       = pcgen_ibctrl_lbuf_flush || 
                                 lbuf_ibctrl_active_idle_flush;
assign ibctrl_lbuf_bju_mispred = pcgen_ibctrl_bju_chgflw;
assign ibctrl_lbuf_create_vld  = lbuf_create_vld;
assign ibctrl_lbuf_retire_vld  = lbuf_retire_vld;
//create_vld when 
//  1.ib_data_vld
//  2.!cancel
//  3.!self_stall
assign lbuf_create_vld = buf_create_vld && 
                         !iu_ifu_chgflw_vld && 
                         !ibuf_ibctrl_stall;
//retire_vld
assign lbuf_retire_vld = lbuf_active && 
                         !fifo_full_stall && 
                         //!iu_ifu_mispred_stall && 
                         !idu_stall;

//==========================================================
//                  pcfifo control signal
//==========================================================
//pcfifo full will be maintained by iu
assign fifo_create_vld   = ib_data_vld && 
                           !ib_cancel &&
                           !ib_expt_vld && 
                           !ib_addr_cancel && 
                           !mispred_stall && 
                           //!pcfifo_full_stall && 
                           !ind_btb_rd_stall && 
                           !buf_stall;
assign pcfifo_create_vld = fifo_create_vld;
assign ibctrl_pcfifo_if_create_vld = pcfifo_create_vld;
assign ibctrl_pcfifo_if_ras_vld    = ras_chgflw_vld; 
assign ibctrl_pcfifo_if_ras_target_pc[PC_WIDTH-2:0] = ras_chgflw_pc[PC_WIDTH-2:0];
assign ibctrl_pcfifo_if_ind_target_pc[PC_WIDTH-2:0] = ind_chgflw_pc[PC_WIDTH-2:0];
assign ibctrl_pcfifo_if_ind_btb_miss = ~ind_btb_rd_vld;

//==========================================================
//                   IND_BTB Signal
//==========================================================
assign ibctrl_ind_btb_check_vld  = ind_chgflw_vld && 
                                  !ib_chgflw_self_stall && 
                                  !fifo_stall;
assign ibctrl_ind_btb_path[7:0]  = ind_chgflw_pc[10:3];
assign ibctrl_ind_btb_fifo_stall = fifo_stall || 
                                   fifo_full_stall;

//==========================================================
//                   IP Stage Signal
//==========================================================
assign ibctrl_ipdp_pcload            = chgflw_vld 
                                    && !ib_chgflw_self_stall
                                    && !lbuf_active;
assign ibctrl_ipdp_chgflw_vlmul[1:0] = chgflw_vlmul[1:0]; 
assign ibctrl_ipdp_chgflw_vsew[2:0]  = chgflw_vsew[2:0]; 
assign ibctrl_ipdp_chgflw_vl[7:0]    = chgflw_vl[7:0];

//==========================================================
//                   L0 BTB Signal
//==========================================================
assign l0_btb_ras_mistaken = ibdp_ibctrl_ras_mistaken;
//interface with ibdp
assign ibctrl_ibdp_l0_btb_hit     = ipctrl_ibctrl_l0_btb_hit;
assign ibctrl_ibdp_l0_btb_miss    = ipctrl_ibctrl_l0_btb_miss;
assign ibctrl_ibdp_l0_btb_mispred = ipctrl_ibctrl_l0_btb_mispred;
assign ibctrl_ibdp_l0_btb_wait    = ipctrl_ibctrl_l0_btb_st_wait;

//==========================================================
//                     RAS Signal
//==========================================================
assign ibctrl_ras_inst_pcall    = (|hn_pcall[7:0]) && 
                                  ib_data_vld && 
                                  !ib_expt_vld;

assign ibctrl_ras_pcall_vld     = (|hn_pcall[7:0]) && 
                                  ib_data_vld && 
                                  !ib_expt_vld &&
                                  !ib_chgflw_self_stall && 
                                  !fifo_stall && 
                                  !ind_btb_rd_stall;
assign ibctrl_ras_preturn_vld   = (|hn_preturn[7:0]) && 
                                  ib_data_vld && 
                                  !ib_expt_vld &&
                                  !ib_chgflw_self_stall && 
                                  !fifo_stall && 
                                  !ind_btb_rd_stall;
assign ibctrl_ras_pcall_vld_for_gateclk   = (|hn_pcall[7:0]) && 
                                             ib_data_vld && 
                                             !ib_expt_vld &&
                                             !ib_chgflw_self_stall && 
                                             !ind_btb_rd_stall;
assign ibctrl_ras_preturn_vld_for_gateclk = (|hn_preturn[7:0]) && 
                                             ib_data_vld && 
                                             !ib_expt_vld &&
                                             !ib_chgflw_self_stall && 
                                             !ind_btb_rd_stall;

// &Force("output","ibctrl_ras_preturn_vld"); @539
//Debug_infor
assign ibctrl_debug_ib_ip_stall     = ibctrl_ipctrl_stall;
assign ibctrl_debug_mispred_stall   = mispred_stall;
assign ibctrl_debug_buf_stall       = buf_stall;
assign ibctrl_debug_fifo_stall      = fifo_stall;
assign ibctrl_debug_fifo_full_stall = fifo_full_stall;
assign ibctrl_debug_ind_btb_stall   = ind_btb_rd_stall;
assign ibctrl_debug_ib_expt_vld     = ib_expt_vld;
assign ibctrl_debug_ibuf_full       = ibuf_ibctrl_stall;
assign ibctrl_debug_ibuf_empty      = ibuf_ibctrl_empty;
assign ibctrl_debug_ibuf_inst_vld   = ibuf_inst_vld;
assign ibctrl_debug_lbuf_inst_vld   = lbuf_inst_vld;
assign ibctrl_debug_bypass_inst_vld = bypass_inst_vld;
assign ibctrl_debug_ib_vld          = ib_data_vld;


// &ModuleEnd;                          @556
endmodule


