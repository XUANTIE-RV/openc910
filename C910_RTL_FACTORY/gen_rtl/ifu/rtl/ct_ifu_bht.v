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
module ct_ifu_bht(
  bht_ifctrl_inv_done,
  bht_ifctrl_inv_on,
  bht_ind_btb_rtu_ghr,
  bht_ind_btb_vghr,
  bht_ipdp_pre_array_data_ntake,
  bht_ipdp_pre_array_data_taken,
  bht_ipdp_pre_offset_onehot,
  bht_ipdp_sel_array_result,
  bht_ipdp_vghr,
  bht_lbuf_pre_ntaken_result,
  bht_lbuf_pre_taken_result,
  bht_lbuf_vghr,
  cp0_ifu_bht_en,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ifctrl_bht_inv,
  ifctrl_bht_pipedown,
  ifctrl_bht_stall,
  ipctrl_bht_con_br_gateclk_en,
  ipctrl_bht_con_br_taken,
  ipctrl_bht_con_br_vld,
  ipctrl_bht_more_br,
  ipctrl_bht_vld,
  ipdp_bht_h0_con_br,
  ipdp_bht_vpc,
  iu_ifu_bht_check_vld,
  iu_ifu_bht_condbr_taken,
  iu_ifu_bht_pred,
  iu_ifu_chgflw_vld,
  iu_ifu_chk_idx,
  iu_ifu_cur_pc,
  lbuf_bht_active_state,
  lbuf_bht_con_br_taken,
  lbuf_bht_con_br_vld,
  pad_yy_icg_scan_en,
  pcgen_bht_chgflw,
  pcgen_bht_chgflw_short,
  pcgen_bht_ifpc,
  pcgen_bht_pcindex,
  pcgen_bht_seq_read,
  rtu_ifu_flush,
  rtu_ifu_retire0_condbr,
  rtu_ifu_retire0_condbr_taken,
  rtu_ifu_retire1_condbr,
  rtu_ifu_retire1_condbr_taken,
  rtu_ifu_retire2_condbr,
  rtu_ifu_retire2_condbr_taken
);

// &Ports; @23
input           cp0_ifu_bht_en;                 
input           cp0_ifu_icg_en;                 
input           cp0_yy_clk_en;                  
input           cpurst_b;                       
input           forever_cpuclk;                 
input           ifctrl_bht_inv;                 
input           ifctrl_bht_pipedown;            
input           ifctrl_bht_stall;               
input           ipctrl_bht_con_br_gateclk_en;   
input           ipctrl_bht_con_br_taken;        
input           ipctrl_bht_con_br_vld;          
input           ipctrl_bht_more_br;             
input           ipctrl_bht_vld;                 
input           ipdp_bht_h0_con_br;             
input   [38:0]  ipdp_bht_vpc;                   
input           iu_ifu_bht_check_vld;           
input           iu_ifu_bht_condbr_taken;        
input           iu_ifu_bht_pred;                
input           iu_ifu_chgflw_vld;              
input   [24:0]  iu_ifu_chk_idx;                 
input   [38:0]  iu_ifu_cur_pc;                  
input           lbuf_bht_active_state;          
input           lbuf_bht_con_br_taken;          
input           lbuf_bht_con_br_vld;            
input           pad_yy_icg_scan_en;             
input           pcgen_bht_chgflw;               
input           pcgen_bht_chgflw_short;         
input   [6 :0]  pcgen_bht_ifpc;                 
input   [9 :0]  pcgen_bht_pcindex;              
input           pcgen_bht_seq_read;             
input           rtu_ifu_flush;                  
input           rtu_ifu_retire0_condbr;         
input           rtu_ifu_retire0_condbr_taken;   
input           rtu_ifu_retire1_condbr;         
input           rtu_ifu_retire1_condbr_taken;   
input           rtu_ifu_retire2_condbr;         
input           rtu_ifu_retire2_condbr_taken;   
output          bht_ifctrl_inv_done;            
output          bht_ifctrl_inv_on;              
output  [7 :0]  bht_ind_btb_rtu_ghr;            
output  [7 :0]  bht_ind_btb_vghr;               
output  [31:0]  bht_ipdp_pre_array_data_ntake;  
output  [31:0]  bht_ipdp_pre_array_data_taken;  
output  [15:0]  bht_ipdp_pre_offset_onehot;     
output  [1 :0]  bht_ipdp_sel_array_result;      
output  [21:0]  bht_ipdp_vghr;                  
output  [31:0]  bht_lbuf_pre_ntaken_result;     
output  [31:0]  bht_lbuf_pre_taken_result;      
output  [21:0]  bht_lbuf_vghr;                  

// &Regs; @24
reg             after_bju_mispred;              
reg             after_rtu_ifu_flush;            
reg             bht_inv_on_reg;                 
reg             bht_inv_on_reg_ff;              
reg     [9 :0]  bht_inval_cnt_pre;              
reg     [31:0]  bht_ipdp_pre_array_data_ntake;  
reg     [31:0]  bht_ipdp_pre_array_data_taken;  
reg     [15:0]  bht_ipdp_pre_offset_onehot;     
reg     [1 :0]  bht_ipdp_sel_array_result;      
reg     [21:0]  bht_ipdp_vghr;                  
reg     [9 :0]  bht_pred_array_index;           
reg     [9 :0]  bht_pred_array_index_flop;      
reg     [9 :0]  bht_pred_array_rd_index;        
reg     [6 :0]  bht_sel_array_index;            
reg     [9 :0]  bht_sel_array_index_flop;       
reg     [15:0]  bht_sel_data_reg;               
reg     [31:0]  bht_wr_buf_pred_updt_sel_b;     
reg     [7 :0]  bht_wr_buf_sel_updt_sel_b;      
reg             buf_full;                       
reg     [3 :0]  create_ptr;                     
reg             cur_condbr_taken;               
reg     [9 :0]  cur_cur_pc;                     
reg     [21:0]  cur_ghr;                        
reg     [1 :0]  cur_pred_rst;                   
reg     [1 :0]  cur_sel_rst;                    
reg     [36:0]  entry0_data;                    
reg     [1 :0]  entry0_sel_updt_data;           
reg             entry0_vld;                     
reg     [36:0]  entry1_data;                    
reg     [1 :0]  entry1_sel_updt_data;           
reg             entry1_vld;                     
reg     [36:0]  entry2_data;                    
reg     [1 :0]  entry2_sel_updt_data;           
reg             entry2_vld;                     
reg     [36:0]  entry3_data;                    
reg     [1 :0]  entry3_sel_updt_data;           
reg             entry3_vld;                     
reg     [36:0]  entry_data;                     
reg             entry_vld;                      
reg     [7 :0]  if_pc_onehot;                   
reg     [31:0]  lbuf_pre_ntaken_reg;            
reg     [31:0]  lbuf_pre_taken_reg;             
reg     [31:0]  pre_array_pipe_ntaken_data;     
reg     [31:0]  pre_array_pipe_taken_data;      
reg     [31:0]  pre_ntaken_reg;                 
reg     [15:0]  pre_offset_onehot_if_0;         
reg     [15:0]  pre_offset_onehot_if_1;         
reg     [15:0]  pre_offset_onehot_ip_0;         
reg     [15:0]  pre_offset_onehot_ip_1;         
reg             pre_rd_flop;                    
reg     [31:0]  pre_taken_reg;                  
reg     [3 :0]  pre_vghr_offset_0;              
reg     [3 :0]  pre_vghr_offset_1;              
reg     [1 :0]  pred_array_updt_data;           
reg     [3 :0]  retire_ptr;                     
reg     [21:0]  rtughr_pre;                     
reg     [21:0]  rtughr_reg;                     
reg     [1 :0]  sel_array_updt_data;            
reg     [1 :0]  sel_array_val_flop;             
reg             sel_rd_flop;                    
reg     [21:0]  vghr_reg;                       
reg     [21:0]  vghr_value;                     
reg     [1 :0]  wr_buf_sel_array_result;        

// &Wires; @25
wire            after_inv_reg;                  
wire            bht_flop_clk;                   
wire            bht_flop_clk_en;                
wire            bht_ghr_updt_clk;               
wire            bht_ghr_updt_clk_en;            
wire            bht_ifctrl_inv_done;            
wire            bht_ifctrl_inv_on;              
wire    [7 :0]  bht_ind_btb_rtu_ghr;            
wire    [7 :0]  bht_ind_btb_vghr;               
wire            bht_inv_cnt_clk;                
wire            bht_inv_cnt_clk_en;             
wire    [9 :0]  bht_inval_cnt;                  
wire    [31:0]  bht_lbuf_pre_ntaken_result;     
wire    [31:0]  bht_lbuf_pre_taken_result;      
wire    [21:0]  bht_lbuf_vghr;                  
wire            bht_pipe_clk;                   
wire            bht_pipe_clk_en;                
wire            bht_pre_array_clk_en;           
wire    [63:0]  bht_pre_data_out;               
wire    [31:0]  bht_pre_ntaken_data;            
wire    [31:0]  bht_pre_taken_data;             
wire            bht_pred_array_cen_b;           
wire    [63:0]  bht_pred_array_din;             
wire            bht_pred_array_gwen;            
wire            bht_pred_array_rd;              
wire    [31:0]  bht_pred_array_wen_b;           
wire            bht_pred_array_wr;              
wire    [63:0]  bht_pred_bwen;                  
wire            bht_sel_array_cen_b;            
wire            bht_sel_array_clk_en;           
wire    [15:0]  bht_sel_array_din;              
wire            bht_sel_array_gwen;             
wire            bht_sel_array_rd;               
wire    [7 :0]  bht_sel_array_wen_b;            
wire            bht_sel_array_wr;               
wire    [15:0]  bht_sel_bwen;                   
wire    [15:0]  bht_sel_data;                   
wire    [15:0]  bht_sel_data_out;               
wire            bht_wr_buf_create_vld;          
wire            bht_wr_buf_not_empty;           
wire    [9 :0]  bht_wr_buf_pred_updt_index;     
wire    [63:0]  bht_wr_buf_pred_updt_val;       
wire            bht_wr_buf_retire_vld;          
wire    [6 :0]  bht_wr_buf_sel_updt_index;      
wire    [15:0]  bht_wr_buf_sel_updt_val;        
wire            bht_wr_buf_updt_vld;            
wire            bht_wr_buf_updt_vld_for_gateclk; 
wire            bju_check_updt_vld;             
wire    [21:0]  bju_ghr;                        
wire            bju_mispred;                    
wire    [1 :0]  bju_pred_rst;                   
wire    [1 :0]  bju_sel_rst;                    
wire            buf_condbr_taken;               
wire    [9 :0]  buf_cur_pc;                     
wire    [21:0]  buf_ghr;                        
wire    [1 :0]  buf_pred_rst;                   
wire    [1 :0]  buf_sel_rst;                    
wire            cp0_ifu_bht_en;                 
wire            cp0_ifu_icg_en;                 
wire            cp0_yy_clk_en;                  
wire            cpurst_b;                       
wire    [3 :0]  entry_create;                   
wire    [3 :0]  entry_retire;                   
wire    [36:0]  entry_updt_data;                
wire            forever_cpuclk;                 
wire            ghr_updt_vld;                   
wire            ifctrl_bht_inv;                 
wire            ifctrl_bht_pipedown;            
wire            ifctrl_bht_stall;               
wire            ip_vld;                         
wire            ipctrl_bht_con_br_gateclk_en;   
wire            ipctrl_bht_con_br_taken;        
wire            ipctrl_bht_con_br_vld;          
wire            ipctrl_bht_more_br;             
wire            ipctrl_bht_vld;                 
wire            ipdp_bht_h0_con_br;             
wire    [38:0]  ipdp_bht_vpc;                   
wire            iu_ifu_bht_check_vld;           
wire            iu_ifu_bht_condbr_taken;        
wire            iu_ifu_bht_pred;                
wire            iu_ifu_chgflw_vld;              
wire    [24:0]  iu_ifu_chk_idx;                 
wire    [38:0]  iu_ifu_cur_pc;                  
wire            lbuf_bht_active_state;          
wire            lbuf_bht_con_br_taken;          
wire            lbuf_bht_con_br_vld;            
wire    [1 :0]  memory_sel_array_result;        
wire            pad_yy_icg_scan_en;             
wire            pcgen_bht_chgflw;               
wire            pcgen_bht_chgflw_short;         
wire    [6 :0]  pcgen_bht_ifpc;                 
wire    [9 :0]  pcgen_bht_pcindex;              
wire            pcgen_bht_seq_read;             
wire    [3 :0]  pre_offset_if_0;                
wire    [3 :0]  pre_offset_if_1;                
wire    [3 :0]  pre_offset_ip_0;                
wire    [3 :0]  pre_offset_ip_1;                
wire    [15:0]  pre_offset_onehot;              
wire    [15:0]  pre_offset_onehot_if;           
wire    [15:0]  pre_offset_onehot_ip;           
wire            pre_reg_clk;                    
wire            pre_reg_clk_en;                 
wire            pred_array_check_updt_vld;      
wire            rtu_con_br_vld;                 
wire            rtu_ifu_flush;                  
wire            rtu_ifu_retire0_condbr;         
wire            rtu_ifu_retire0_condbr_taken;   
wire            rtu_ifu_retire1_condbr;         
wire            rtu_ifu_retire1_condbr_taken;   
wire            rtu_ifu_retire2_condbr;         
wire            rtu_ifu_retire2_condbr_taken;   
wire            rtughr_updt_vld;                
wire            sel_array_check_updt_vld;       
wire    [1 :0]  sel_array_val;                  
wire    [1 :0]  sel_array_val_cur;              
wire            sel_reg_clk;                    
wire            sel_reg_clk_en;                 
wire            vghr_ip_updt_vld;               
wire            vghr_lbuf_updt_vld;             
wire            wr_buf_clk;                     
wire            wr_buf_clk_en;                  
wire            wr_buf_hit;                     
wire            wr_buf_hit_0;                   
wire            wr_buf_hit_1;                   
wire            wr_buf_hit_2;                   
wire            wr_buf_hit_3;                   
wire            wr_buf_pre_hit_0;               
wire            wr_buf_pre_hit_1;               
wire            wr_buf_pre_hit_2;               
wire            wr_buf_pre_hit_3;               
wire            wr_buf_rd;                      
wire            wr_buf_sel_hit_0;               
wire            wr_buf_sel_hit_1;               
wire            wr_buf_sel_hit_2;               
wire            wr_buf_sel_hit_3;               


parameter PC_WIDTH = 40;
//CK860 Use Bi-Mode BHT
//Total Size is 64K Bits
//2*Pre_Array + 1*Sel_Array
//2*Pre_Array = Taken_pre_array + Not_Taken_pre_array
//  1KEntry * 32Bits * 2Array  ----  Use one Memory
//1*Sel_Array
//  128Entry * 16Bits

// &Force("bus","iu_ifu_cur_pc",38,0); @36
// &Force("bus","pcgen_bht_pcindex",9,0); @37
// &Force("bus","pcgen_bht_ifpc",6,0); @38
// &Force("bus","ipdp_bht_vpc",38,0); @39

//==========================================================
//          Signal Input to BHT Predict Array
//==========================================================
//--------------------Chip Enable---------------------------
//the BHT Predict Array is enable when:
//1.Write Enable
//  a.BHT INV
//  b.BHT can be updated
//2.Read Enable
//  (When Update VGHR, BHT need read)
//  a.after invalidated
//  b.conditional branch happen in ip stage
//  c.the cycle BJU mispredict
//  d.the cycle after BJU mispredict
//  e.the cycle RTU flush
//  f.the cycle after RTU flush

assign bht_pred_array_wr     = bht_inv_on_reg || 
                               bht_wr_buf_updt_vld;
assign bht_pred_array_rd     = after_inv_reg ||
                               ipctrl_bht_con_br_vld && !lbuf_bht_active_state || 
                               lbuf_bht_con_br_vld && lbuf_bht_active_state || 
                               bju_mispred || 
                               after_bju_mispred || 
                               rtu_ifu_flush || 
                               after_rtu_ifu_flush;
assign bht_pred_array_cen_b  = !(
                                  bht_inv_on_reg || 
                                  after_inv_reg  || 
                                  (bht_wr_buf_updt_vld || 
                                   ipctrl_bht_con_br_vld && !lbuf_bht_active_state || 
                                   lbuf_bht_con_br_vld && lbuf_bht_active_state || 
                                   bju_mispred || 
                                   after_bju_mispred || 
                                   rtu_ifu_flush || 
                                   after_rtu_ifu_flush) && 
                                  cp0_ifu_bht_en
                                );
//Memory Gate Clock Enable
assign bht_pre_array_clk_en  = bht_inv_on_reg || 
                               bht_wr_buf_updt_vld_for_gateclk ||  
                               bht_pred_array_rd;
                              
//-------------------Write Enable---------------------------
assign bht_pred_array_gwen   =  !bht_pred_array_wr;

//-------------------Write Bit Enable-----------------------
assign bht_pred_array_wen_b[31:0] = bht_inv_on_reg 
                                    ? 32'b0 
                                    : (bht_wr_buf_pred_updt_sel_b[31:0] |
                                       {32{!bht_wr_buf_updt_vld}});
assign bht_pred_bwen[63:0] = {{2{bht_pred_array_wen_b[31]}}, 
                              {2{bht_pred_array_wen_b[30]}}, 
                              {2{bht_pred_array_wen_b[29]}}, 
                              {2{bht_pred_array_wen_b[28]}}, 
                              {2{bht_pred_array_wen_b[27]}}, 
                              {2{bht_pred_array_wen_b[26]}}, 
                              {2{bht_pred_array_wen_b[25]}}, 
                              {2{bht_pred_array_wen_b[24]}}, 
                              {2{bht_pred_array_wen_b[23]}}, 
                              {2{bht_pred_array_wen_b[22]}}, 
                              {2{bht_pred_array_wen_b[21]}}, 
                              {2{bht_pred_array_wen_b[20]}}, 
                              {2{bht_pred_array_wen_b[19]}}, 
                              {2{bht_pred_array_wen_b[18]}}, 
                              {2{bht_pred_array_wen_b[17]}}, 
                              {2{bht_pred_array_wen_b[16]}}, 
                              {2{bht_pred_array_wen_b[15]}}, 
                              {2{bht_pred_array_wen_b[14]}}, 
                              {2{bht_pred_array_wen_b[13]}}, 
                              {2{bht_pred_array_wen_b[12]}}, 
                              {2{bht_pred_array_wen_b[11]}}, 
                              {2{bht_pred_array_wen_b[10]}}, 
                              {2{bht_pred_array_wen_b[ 9]}}, 
                              {2{bht_pred_array_wen_b[ 8]}}, 
                              {2{bht_pred_array_wen_b[ 7]}}, 
                              {2{bht_pred_array_wen_b[ 6]}}, 
                              {2{bht_pred_array_wen_b[ 5]}}, 
                              {2{bht_pred_array_wen_b[ 4]}}, 
                              {2{bht_pred_array_wen_b[ 3]}}, 
                              {2{bht_pred_array_wen_b[ 2]}}, 
                              {2{bht_pred_array_wen_b[ 1]}}, 
                              {2{bht_pred_array_wen_b[ 0]}}};

//==========================================================
//              Predict Array Data Input
//==========================================================
assign bht_pred_array_din[63:0] = bht_inv_on_reg 
                                ? 64'h3333_3333_3333_3333 
                                : bht_wr_buf_pred_updt_val[63:0];

//==========================================================
//                 Predict Array Index
//==========================================================
//Predict Array Priority:
//1.bht_inv_index
//2.bht_pred_array_read_index
//3.bht_pred_array_write_index
// &CombBeg; @139
always @( bht_inv_on_reg
       or bht_inval_cnt[9:0]
       or bht_wr_buf_pred_updt_index[9:0]
       or after_inv_reg
       or bht_pred_array_rd
       or bht_pred_array_rd_index[9:0])
begin
if(bht_inv_on_reg || after_inv_reg)
  bht_pred_array_index[9:0] = bht_inval_cnt[9:0];
else if(bht_pred_array_rd)
  bht_pred_array_index[9:0] = bht_pred_array_rd_index[9:0];
else //bht_pred_array_wr
  bht_pred_array_index[9:0] = bht_wr_buf_pred_updt_index[9:0];
// &CombEnd; @146
end

//{vghr[12:9], {vghr_reg[8:3]^vghr_reg[20:15]}} is the basic index of read
//pc[6:3] ^ vghr[3:0] to select result out from sel array
//vghr[3:0] in ip stage is {if_vghr[2:0], ip_con_br_taken}
// &CombBeg; @151
always @( vghr_reg[20:14]
       or after_bju_mispred
       or rtughr_reg[21:16]
       or iu_ifu_bht_check_vld
       or after_rtu_ifu_flush
       or vghr_reg[12:2]
       or rtu_ifu_flush
       or bju_ghr[13:3]
       or rtughr_reg[13:4]
       or bju_mispred
       or bju_ghr[21:15])
begin
if(rtu_ifu_flush)
  bht_pred_array_rd_index[9:0] = {rtughr_reg[13:10],{rtughr_reg[9:4]^rtughr_reg[21:16]}};
else if(bju_mispred && !iu_ifu_bht_check_vld)
  bht_pred_array_rd_index[9:0] = {bju_ghr[13:10],{bju_ghr[9:4]^bju_ghr[21:16]}};
else if(bju_mispred && iu_ifu_bht_check_vld)
  bht_pred_array_rd_index[9:0] = {bju_ghr[12:9],{bju_ghr[8:3]^bju_ghr[20:15]}};
else if(after_bju_mispred || after_rtu_ifu_flush)
  bht_pred_array_rd_index[9:0] = {vghr_reg[12:9],{vghr_reg[8:3]^vghr_reg[20:15]}};
else //ipctrl_bht_con_br_vld
  bht_pred_array_rd_index[9:0] = {vghr_reg[11:8],{vghr_reg[7:2]^vghr_reg[19:14]}};
// &CombEnd; @162
end

//==========================================================
//          Signal Input to BHT Select Array
//==========================================================
//--------------------Chip Enable---------------------------
//the BHT Select Array is enable when:
//1.Write Enable
//  a.BHT INV
//  b.BHT can be updated
//2.Read Enable
//  a.after invalidated
//  b.change flow read
//  c.sequence read
assign bht_sel_array_wr    = bht_inv_on_reg || 
                             bht_wr_buf_updt_vld;
assign bht_sel_array_rd    = after_inv_reg || 
                             pcgen_bht_chgflw || 
                             pcgen_bht_seq_read;
assign bht_sel_array_cen_b = !(
                                bht_inv_on_reg || 
                                after_inv_reg  || 
                                (bht_wr_buf_updt_vld || 
                                 pcgen_bht_chgflw || 
                                 pcgen_bht_seq_read) && 
                                cp0_ifu_bht_en
                              );

//Memory Gate Clock Enable
assign bht_sel_array_clk_en = bht_inv_on_reg || 
                              bht_wr_buf_updt_vld_for_gateclk || 
                              after_inv_reg  ||
                              pcgen_bht_seq_read ||
                              pcgen_bht_chgflw_short;

//-------------------Write Enable---------------------------
assign bht_sel_array_gwen   = !bht_sel_array_wr;
//-------------------Write Bit Enable-----------------------
assign bht_sel_array_wen_b[7:0] = bht_inv_on_reg 
                                ? 8'b0 
                                : (bht_wr_buf_sel_updt_sel_b[7:0] | 
                                  {8{!bht_wr_buf_updt_vld}});
assign bht_sel_bwen[15:0] = {{2{bht_sel_array_wen_b[7]}},
                             {2{bht_sel_array_wen_b[6]}},
                             {2{bht_sel_array_wen_b[5]}},
                             {2{bht_sel_array_wen_b[4]}}, 
                             {2{bht_sel_array_wen_b[3]}},
                             {2{bht_sel_array_wen_b[2]}},
                             {2{bht_sel_array_wen_b[1]}},
                             {2{bht_sel_array_wen_b[0]}}};

//==========================================================
//              Select Array Data Input
//==========================================================
assign bht_sel_array_din[15:0] = bht_inv_on_reg 
                               ? 16'b0 
                               : bht_wr_buf_sel_updt_val[15:0];

//==========================================================
//                 Select Array Index
//==========================================================
//Select Array Priority:
//1.bht_inv_index
//2.bht_select_array_read_index
//3.bht_select_array_write_index
// &CombBeg; @227
always @( bht_inv_on_reg
       or after_inv_reg
       or bht_inval_cnt[6:0]
       or pcgen_bht_pcindex[9:3]
       or bht_wr_buf_sel_updt_index[6:0]
       or bht_sel_array_rd)
begin
if(bht_inv_on_reg || after_inv_reg)
  bht_sel_array_index[6:0] = bht_inval_cnt[6:0];
else if(bht_sel_array_rd)
  bht_sel_array_index[6:0] = pcgen_bht_pcindex[9:3];
else //bht_sel_array_wr
  bht_sel_array_index[6:0] = bht_wr_buf_sel_updt_index[6:0];
// &CombEnd; @234
end

//==========================================================
//                GHR Update Gate Clock
//==========================================================
// &Instance("gated_clk_cell","x_bht_ghr_updt_clk"); @239
gated_clk_cell  x_bht_ghr_updt_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (bht_ghr_updt_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (bht_ghr_updt_clk_en),
  .module_en           (cp0_ifu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect( .clk_in         (forever_cpuclk), @240
//           .clk_out        (bht_ghr_updt_clk),//Out Clock @241
//           .external_en    (1'b0), @242
//           .global_en      (cp0_yy_clk_en), @243
//           .local_en       (bht_ghr_updt_clk_en),//Local Condition @244
//           .module_en      (cp0_ifu_icg_en) @245
//         ); @246
assign bht_ghr_updt_clk_en = bht_inv_on_reg || 
                             cp0_ifu_bht_en && 
                             (rtu_ifu_flush || 
                              rtu_con_br_vld || 
                              iu_ifu_chgflw_vld || 
                              ipctrl_bht_con_br_gateclk_en || 
                              lbuf_bht_con_br_vld);

//==========================================================
//                   Update RTU GHR
//==========================================================
//rtu_ghr is used to record con_br happen in rtu
//1.BHT INV
//2.RTU Update
assign rtughr_updt_vld = cp0_ifu_bht_en && rtu_con_br_vld;
assign rtu_con_br_vld  = rtu_ifu_retire0_condbr || 
                         rtu_ifu_retire1_condbr || 
                         rtu_ifu_retire2_condbr;

always @(posedge bht_ghr_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtughr_reg[21:0] <= 22'b0;
  else if(bht_inv_on_reg)
    rtughr_reg[21:0] <= 22'b0;
  else if(rtughr_updt_vld)
    rtughr_reg[21:0] <= rtughr_pre[21:0];
  else
    rtughr_reg[21:0] <= rtughr_reg[21:0];
end

// &CombBeg; @278
always @( rtu_ifu_retire2_condbr_taken
       or rtu_ifu_retire1_condbr
       or rtu_ifu_retire0_condbr_taken
       or rtughr_reg[21:0]
       or rtu_ifu_retire1_condbr_taken
       or rtu_ifu_retire2_condbr
       or rtu_ifu_retire0_condbr)
begin
case({rtu_ifu_retire0_condbr, rtu_ifu_retire1_condbr, rtu_ifu_retire2_condbr})
  3'b000  : rtughr_pre[21:0] =  rtughr_reg[21:0];
  3'b001  : rtughr_pre[21:0] = {rtughr_reg[20:0], rtu_ifu_retire2_condbr_taken};
  3'b010  : rtughr_pre[21:0] = {rtughr_reg[20:0], rtu_ifu_retire1_condbr_taken};
  3'b100  : rtughr_pre[21:0] = {rtughr_reg[20:0], rtu_ifu_retire0_condbr_taken};
  3'b101  : rtughr_pre[21:0] = {rtughr_reg[19:0], rtu_ifu_retire0_condbr_taken, 
                                                  rtu_ifu_retire2_condbr_taken};
  3'b110  : rtughr_pre[21:0] = {rtughr_reg[19:0], rtu_ifu_retire0_condbr_taken, 
                                                  rtu_ifu_retire1_condbr_taken};
  3'b011  : rtughr_pre[21:0] = {rtughr_reg[19:0], rtu_ifu_retire1_condbr_taken, 
                                                  rtu_ifu_retire2_condbr_taken};
  3'b111  : rtughr_pre[21:0] = {rtughr_reg[18:0], rtu_ifu_retire0_condbr_taken, 
                                                  rtu_ifu_retire1_condbr_taken,
                                                  rtu_ifu_retire2_condbr_taken};
  default : rtughr_pre[21:0] =  rtughr_reg[21:0];
endcase
// &CombEnd; @295
end

//==========================================================
//                   Update VGHR
//==========================================================
//vghr is used to record con_br happen in ifu
//1.BHT INV
//2.RTU Flush Update
//3.BJU Mispredict
//4.IFU Update
assign ghr_updt_vld       = cp0_ifu_bht_en && iu_ifu_chgflw_vld;
assign vghr_lbuf_updt_vld = cp0_ifu_bht_en && lbuf_bht_con_br_vld;
assign vghr_ip_updt_vld   = ipctrl_bht_con_br_vld;

always @(posedge bht_ghr_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vghr_reg[21:0] <= 22'b0;
  else if(bht_inv_on_reg)
    vghr_reg[21:0] <= 22'b0;
  else if(rtu_ifu_flush && cp0_ifu_bht_en)
    vghr_reg[21:0] <= rtughr_reg[21:0];
  else if(ghr_updt_vld && iu_ifu_bht_check_vld)
    vghr_reg[21:0] <= {bju_ghr[20:0], iu_ifu_bht_condbr_taken};
  else if(ghr_updt_vld && !iu_ifu_bht_check_vld)
    vghr_reg[21:0] <= bju_ghr[21:0];
  else if(vghr_lbuf_updt_vld)
    vghr_reg[21:0] <= {vghr_reg[20:0], lbuf_bht_con_br_taken};
  else if(vghr_ip_updt_vld  && !lbuf_bht_active_state)
    vghr_reg[21:0] <= {vghr_reg[20:0], ipctrl_bht_con_br_taken};
  else
    vghr_reg[21:0] <= vghr_reg[21:0];
end 

//==========================================================
//              Select Array Final Result
//==========================================================
//----------------Memory Data Out Reg-----------------------
//store memory dout value to reg 
//in case of memory writing changes the value of dout
// &Instance("gated_clk_cell","x_sel_reg_clk"); @335
gated_clk_cell  x_sel_reg_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sel_reg_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sel_reg_clk_en    ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @336
//           .clk_out        (sel_reg_clk),//Out Clock @337
//           .external_en    (1'b0), @338
//           .global_en      (cp0_yy_clk_en), @339
//           .local_en       (sel_reg_clk_en),//Local Condition @340
//           .module_en      (cp0_ifu_icg_en) @341
//         ); @342
assign sel_reg_clk_en = sel_rd_flop || bht_inv_on_reg;

always @(posedge sel_reg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_sel_data_reg[15:0] <= 16'b0;
  else if(bht_inv_on_reg)
    bht_sel_data_reg[15:0] <= 16'b0;
  else if(sel_rd_flop)
    bht_sel_data_reg[15:0] <= bht_sel_data_out[15:0];//Memory Dout
  else
    bht_sel_data_reg[15:0] <= bht_sel_data_reg[15:0];
end

//flop bht_sel_array_rd
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sel_rd_flop <= 1'b0;
  else if(bht_inv_on_reg)
    sel_rd_flop <= 1'b0;
  else if(bht_sel_array_rd && !ifctrl_bht_stall)
    sel_rd_flop <= 1'b1;
  else
    sel_rd_flop <= 1'b0;
end

//select sel data from memory dout or memory flop reg
assign bht_sel_data[15:0]     = (sel_rd_flop) 
                              ? bht_sel_data_out[15:0] 
                              : bht_sel_data_reg[15:0];
// &CombBeg; @374
always @( pcgen_bht_ifpc[5:3])
begin
case(pcgen_bht_ifpc[5:3])
  3'b000  : if_pc_onehot[7:0] = 8'b0000_0001; 
  3'b001  : if_pc_onehot[7:0] = 8'b0000_0010; 
  3'b010  : if_pc_onehot[7:0] = 8'b0000_0100; 
  3'b011  : if_pc_onehot[7:0] = 8'b0000_1000; 
  3'b100  : if_pc_onehot[7:0] = 8'b0001_0000; 
  3'b101  : if_pc_onehot[7:0] = 8'b0010_0000; 
  3'b110  : if_pc_onehot[7:0] = 8'b0100_0000; 
  3'b111  : if_pc_onehot[7:0] = 8'b1000_0000; 
  default : if_pc_onehot[7:0] = 8'b0000_0001;
endcase
// &CombEnd; @386
end
assign sel_array_val_cur[1:0] = ({2{if_pc_onehot[ 0]}} & bht_sel_data[ 1: 0]) | 
                                ({2{if_pc_onehot[ 1]}} & bht_sel_data[ 3: 2]) |
                                ({2{if_pc_onehot[ 2]}} & bht_sel_data[ 5: 4]) |
                                ({2{if_pc_onehot[ 3]}} & bht_sel_data[ 7: 6]) |
                                ({2{if_pc_onehot[ 4]}} & bht_sel_data[ 9: 8]) |
                                ({2{if_pc_onehot[ 5]}} & bht_sel_data[11:10]) |
                                ({2{if_pc_onehot[ 6]}} & bht_sel_data[13:12]) |
                                ({2{if_pc_onehot[ 7]}} & bht_sel_data[15:14]);

//When 32 Bit con_br locate at H8
//BHT Predict infor flop to IP stage should use the value of last cycle
assign memory_sel_array_result[1:0] = (ipctrl_bht_more_br || ipdp_bht_h0_con_br)
                                    ? sel_array_val_flop[1:0]
                                    : sel_array_val_cur[1:0];
//wr_buf bypass select
assign sel_array_val[1:0]           = (wr_buf_hit)
                                    ? wr_buf_sel_array_result[1:0]
                                    : memory_sel_array_result[1:0];

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sel_array_val_flop[1:0] <= 2'b00;
  else
    sel_array_val_flop[1:0] <= sel_array_val[1:0];
end

//==========================================================
//              Predict Array Flop Result
//==========================================================
//-----------------Memory Data Out--------------------------
//Data read out from pre_array memory dout
assign bht_pre_taken_data[31:0]  = {bht_pre_data_out[61:60],
                                    bht_pre_data_out[57:56],
                                    bht_pre_data_out[53:52],
                                    bht_pre_data_out[49:48],
                                    bht_pre_data_out[45:44],
                                    bht_pre_data_out[41:40],
                                    bht_pre_data_out[37:36],
                                    bht_pre_data_out[33:32],
                                    bht_pre_data_out[29:28],
                                    bht_pre_data_out[25:24],
                                    bht_pre_data_out[21:20],
                                    bht_pre_data_out[17:16],
                                    bht_pre_data_out[13:12],
                                    bht_pre_data_out[ 9: 8],
                                    bht_pre_data_out[ 5: 4],
                                    bht_pre_data_out[ 1: 0]};
                                  
assign bht_pre_ntaken_data[31:0] = {bht_pre_data_out[63:62],
                                    bht_pre_data_out[59:58],
                                    bht_pre_data_out[55:54],
                                    bht_pre_data_out[51:50],
                                    bht_pre_data_out[47:46],
                                    bht_pre_data_out[43:42],
                                    bht_pre_data_out[39:38],
                                    bht_pre_data_out[35:34],
                                    bht_pre_data_out[31:30],
                                    bht_pre_data_out[27:26],
                                    bht_pre_data_out[23:22],
                                    bht_pre_data_out[19:18],
                                    bht_pre_data_out[15:14],
                                    bht_pre_data_out[11:10],
                                    bht_pre_data_out[ 7: 6],
                                    bht_pre_data_out[ 3: 2]};

//----------------Memory Data Out Reg-----------------------
//store memory dout value to reg 
//in case of memory writing changes the value of dout
// &Instance("gated_clk_cell","x_pre_reg_clk"); @456
gated_clk_cell  x_pre_reg_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pre_reg_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pre_reg_clk_en    ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @457
//           .clk_out        (pre_reg_clk),//Out Clock @458
//           .external_en    (1'b0), @459
//           .global_en      (cp0_yy_clk_en), @460
//           .local_en       (pre_reg_clk_en),//Local Condition @461
//           .module_en      (cp0_ifu_icg_en) @462
//         ); @463
assign pre_reg_clk_en = pre_rd_flop || bht_inv_on_reg;

//Memory data output reg updata rule:
//  a.if pre_rd_flop == 1, memory data output reg write data in
//  b.if pre_rd_flop != 1, memory data output reg hold origin value
always @(posedge pre_reg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pre_taken_reg[31:0] <= 32'b0;
  else if(bht_inv_on_reg)
    pre_taken_reg[31:0] <= 32'b0;
  else if(pre_rd_flop)
    pre_taken_reg[31:0] <= bht_pre_taken_data[31:0];
  else
    pre_taken_reg[31:0] <= pre_taken_reg[31:0];
end

always @(posedge pre_reg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pre_ntaken_reg[31:0] <= 32'b0;
  else if(bht_inv_on_reg)
    pre_ntaken_reg[31:0] <= 32'b0;
  else if(pre_rd_flop)
    pre_ntaken_reg[31:0] <= bht_pre_ntaken_data[31:0];
  else
    pre_ntaken_reg[31:0] <= pre_ntaken_reg[31:0];
end

//flop bht_pred_array_rd
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pre_rd_flop <= 1'b0;
  else if(bht_inv_on_reg)
    pre_rd_flop <= 1'b0;
  else if(bht_pred_array_rd)
    pre_rd_flop <= 1'b1;
  else
    pre_rd_flop <= 1'b0;
end

//pipe taken & ntaken data to be selected in IP stage
// &CombBeg; @507
always @( bht_pre_taken_data[31:0]
       or pre_rd_flop
       or lbuf_bht_con_br_vld
       or ip_vld
       or lbuf_bht_active_state
       or pre_taken_reg[31:0])
begin
if(pre_rd_flop && ip_vld && !lbuf_bht_active_state)
  pre_array_pipe_taken_data[31:0] = bht_pre_taken_data[31:0];
else if(pre_rd_flop && lbuf_bht_con_br_vld && lbuf_bht_active_state)
  pre_array_pipe_taken_data[31:0] = bht_pre_taken_data[31:0];
else
  pre_array_pipe_taken_data[31:0] = pre_taken_reg[31:0];
// &CombEnd; @514
end

// &CombBeg; @516
always @( pre_ntaken_reg[31:0]
       or pre_rd_flop
       or lbuf_bht_con_br_vld
       or ip_vld
       or bht_pre_ntaken_data[31:0]
       or lbuf_bht_active_state)
begin
if(pre_rd_flop && ip_vld && !lbuf_bht_active_state)
  pre_array_pipe_ntaken_data[31:0] = bht_pre_ntaken_data[31:0];
else if(pre_rd_flop && lbuf_bht_con_br_vld && lbuf_bht_active_state)
  pre_array_pipe_ntaken_data[31:0] = bht_pre_ntaken_data[31:0];
else
  pre_array_pipe_ntaken_data[31:0] = pre_ntaken_reg[31:0];
// &CombEnd; @523
end

//==========================================================
//                  BHT Wirte Buffer
//==========================================================
//wr_buf update BHT should under following condition:
//1.one conditional branch instruction checked in bju || 
//2.any valid entry in write buffer &&
//3.no read request(include select array and predictarra y)
assign bht_wr_buf_updt_vld_for_gateclk = (bju_check_updt_vld || bht_wr_buf_not_empty); 
assign bht_wr_buf_updt_vld       = (bju_check_updt_vld || 
                                    bht_wr_buf_not_empty) && 
                                   !(
                                      after_inv_reg || 
                                      ipctrl_bht_con_br_vld || 
                                      after_bju_mispred || 
                                      rtu_ifu_flush || 
                                      after_rtu_ifu_flush || 
                                      pcgen_bht_chgflw && !lbuf_bht_active_state ||
                                      pcgen_bht_seq_read
                                    );

assign bju_check_updt_vld        = (pred_array_check_updt_vld || 
                                   sel_array_check_updt_vld) && 
                                   iu_ifu_bht_check_vld;

assign pred_array_check_updt_vld = !( ( (bju_pred_rst[1:0] == 2'b00) && //saturated
                                        !iu_ifu_bht_condbr_taken 
                                      ) || 
                                      ( (bju_pred_rst[1:0] == 2'b11) && //saturated
                                        iu_ifu_bht_condbr_taken
                                      ) 
                                    );

assign sel_array_check_updt_vld  = !( ( (bju_sel_rst[1:0] == 2'b00) && //saturated
                                        !iu_ifu_bht_condbr_taken
                                      ) || 
                                      ( (bju_sel_rst[1:0] == 2'b11) && //saturated
                                        iu_ifu_bht_condbr_taken
                                      ) ||  
                                      ( (bju_sel_rst[1] == 1'b0) && //bi-mode logic
                                        iu_ifu_bht_condbr_taken && 
                                        !iu_ifu_chgflw_vld
                                      ) || 
                                      ( (bju_sel_rst[1] == 1'b1) && //bi-mode logic
                                        !iu_ifu_bht_condbr_taken && 
                                        !iu_ifu_chgflw_vld
                                      )
                                    );

assign bht_wr_buf_create_vld     = bju_check_updt_vld && 
                                   (bht_pred_array_rd || 
                                    bht_sel_array_rd || 
                                    bht_wr_buf_not_empty) && 
                                   cp0_ifu_bht_en;
                                        
assign bht_wr_buf_retire_vld     = bht_wr_buf_not_empty && 
                                   !(bht_pred_array_rd || 
                                     bht_sel_array_rd) && 
                                   cp0_ifu_bht_en;

assign bht_wr_buf_not_empty      = entry_vld;

//==========================================================
//               BHT Write Buffer Pointer
//==========================================================
// &Instance("gated_clk_cell","x_wr_buf_clk"); @589
gated_clk_cell  x_wr_buf_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wr_buf_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (wr_buf_clk_en     ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @590
//           .clk_out        (wr_buf_clk),//Out Clock @591
//           .external_en    (1'b0), @592
//           .global_en      (cp0_yy_clk_en), @593
//           .local_en       (wr_buf_clk_en),//Local Condition @594
//           .module_en      (cp0_ifu_icg_en) @595
//         ); @596
assign wr_buf_clk_en = bju_check_updt_vld || 
                       bht_wr_buf_not_empty || 
                       bht_inv_on_reg || 
                       ifctrl_bht_inv;

//Write Buffer has 4 Entry
//Use one-hot pointer
always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    create_ptr[3:0] <= 4'b0001;
  else if(bht_inv_on_reg)
    create_ptr[3:0] <= 4'b0001;
  else if(bht_wr_buf_create_vld && !buf_full)
    create_ptr[3:0] <= {create_ptr[2:0], create_ptr[3]};
  else
    create_ptr[3:0] <= create_ptr[3:0];
end

always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_ptr[3:0] <= 4'b0001;
  else if(bht_inv_on_reg)
    retire_ptr[3:0] <= 4'b0001;
  else if(bht_wr_buf_retire_vld)
    retire_ptr[3:0] <= {retire_ptr[2:0], retire_ptr[3]};
  else
    retire_ptr[3:0] <= retire_ptr[3:0];
end

assign entry_create[3:0] = {4{bht_wr_buf_create_vld && !buf_full}} & 
                           create_ptr[3:0];
assign entry_retire[3:0] = {4{bht_wr_buf_retire_vld}} & 
                           retire_ptr[3:0];

//==========================================================
//             Four Write Buffer Entry
//==========================================================
assign entry_updt_data[36:0] = {
                                 //iu_ifu_bht_check_vld,
                                 iu_ifu_bht_condbr_taken,
                                 bju_sel_rst[1:0],
                                 bju_pred_rst[1:0],
                                 bju_ghr[21:0],
                                 iu_ifu_cur_pc[12:3]
                               };

//Entry 0
always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry0_vld <= 1'b0;
  else if(bht_inv_on_reg)
    entry0_vld <= 1'b0;
  else if(entry_create[0])
    entry0_vld <= 1'b1;
  else if(entry_retire[0])
    entry0_vld <= 1'b0;
  else
    entry0_vld <= entry0_vld;
end

always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry0_data[36:0] <= 37'b0;
  else if(entry_create[0])
    entry0_data[36:0] <= entry_updt_data[36:0];
  else
    entry0_data[36:0] <= entry0_data[36:0];
end

//Entry 1
always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry1_vld <= 1'b0;
  else if(bht_inv_on_reg)
    entry1_vld <= 1'b0;
  else if(entry_create[1])
    entry1_vld <= 1'b1;
  else if(entry_retire[1])
    entry1_vld <= 1'b0;
  else
    entry1_vld <= entry1_vld;
end

always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry1_data[36:0] <= 37'b0;
  else if(entry_create[1])
    entry1_data[36:0] <= entry_updt_data[36:0];
  else
    entry1_data[36:0] <= entry1_data[36:0];
end

//Entry 2
always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry2_vld <= 1'b0;
  else if(bht_inv_on_reg)
    entry2_vld <= 1'b0;
  else if(entry_create[2])
    entry2_vld <= 1'b1;
  else if(entry_retire[2])
    entry2_vld <= 1'b0;
  else
    entry2_vld <= entry2_vld;
end

always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry2_data[36:0] <= 37'b0;
  else if(entry_create[2])
    entry2_data[36:0] <= entry_updt_data[36:0];
  else
    entry2_data[36:0] <= entry2_data[36:0];
end

//Entry 3
always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry3_vld <= 1'b0;
  else if(bht_inv_on_reg)
    entry3_vld <= 1'b0;
  else if(entry_create[3])
    entry3_vld <= 1'b1;
  else if(entry_retire[3])
    entry3_vld <= 1'b0;
  else
    entry3_vld <= entry3_vld;
end

always @(posedge wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry3_data[36:0] <= 37'b0;
  else if(entry_create[3])
    entry3_data[36:0] <= entry_updt_data[36:0];
  else
    entry3_data[36:0] <= entry3_data[36:0];
end

//==========================================================
//               Update Data Prepare
//==========================================================
//Entry data selected out
// &CombBeg; @749
always @( entry1_vld
       or retire_ptr[3:0]
       or entry0_data[36:0]
       or entry2_data[36:0]
       or entry0_vld
       or entry2_vld
       or entry3_vld
       or entry3_data[36:0]
       or entry1_data[36:0])
begin
case(retire_ptr[3:0])
  4'b0001 : begin
            entry_vld        = entry0_vld;
            entry_data[36:0] = entry0_data[36:0];
            end
  4'b0010 : begin
            entry_vld        = entry1_vld;
            entry_data[36:0] = entry1_data[36:0];
            end
  4'b0100 : begin
            entry_vld        = entry2_vld;
            entry_data[36:0] = entry2_data[36:0];
            end
  4'b1000 : begin
            entry_vld        = entry3_vld;
            entry_data[36:0] = entry3_data[36:0];
            end
  default : begin
            entry_vld        = 1'b0;
            entry_data[36:0] = 37'b0;
            end
endcase
// &CombEnd; @772
end

//Split Entry Data
assign buf_condbr_taken  = entry_data[36];
assign buf_sel_rst[1:0]  = entry_data[35:34];
assign buf_pred_rst[1:0] = entry_data[33:32];
assign buf_ghr[21:0]     = entry_data[31:10];
assign buf_cur_pc[9:0]   = entry_data[9:0];

//Buffer Full
// &CombBeg; @782
always @( entry1_vld
       or create_ptr[3:0]
       or entry0_vld
       or entry2_vld
       or entry3_vld)
begin
case(create_ptr[3:0])
  4'b0001 : buf_full = entry0_vld;
  4'b0010 : buf_full = entry1_vld;
  4'b0100 : buf_full = entry2_vld;
  4'b1000 : buf_full = entry3_vld;
  default : buf_full = 1'b0;
endcase
// &CombEnd; @790
end

//Cur info to update BHT
//May come from entry data or BJU data
// &CombBeg; @794
always @( buf_cur_pc[9:0]
       or buf_sel_rst[1:0]
       or entry_vld
       or buf_condbr_taken
       or buf_ghr[21:0]
       or bju_sel_rst[1:0]
       or bju_ghr[21:0]
       or iu_ifu_cur_pc[12:3]
       or bju_pred_rst[1:0]
       or iu_ifu_bht_condbr_taken
       or buf_pred_rst[1:0])
begin
if(entry_vld)
begin
  cur_condbr_taken  = buf_condbr_taken;
  cur_sel_rst[1:0]  = buf_sel_rst[1:0];
  cur_pred_rst[1:0] = buf_pred_rst[1:0];
  cur_ghr[21:0]     = buf_ghr[21:0];
  cur_cur_pc[9:0]   = buf_cur_pc[9:0];
end
else
begin
  cur_condbr_taken  = iu_ifu_bht_condbr_taken;
  cur_sel_rst[1:0]  = bju_sel_rst[1:0];
  cur_pred_rst[1:0] = bju_pred_rst[1:0];
  cur_ghr[21:0]     = bju_ghr[21:0];
  cur_cur_pc[9:0]   = iu_ifu_cur_pc[12:3];
end
// &CombEnd; @811
end

//==========================================================
//             predict array updt data
//==========================================================
// &CombBeg; @816
always @( cur_pred_rst[1:0]
       or cur_condbr_taken)
begin
case({cur_pred_rst[1:0],cur_condbr_taken})
  3'b001  : pred_array_updt_data[1:0] = 2'b01;
  3'b011  : pred_array_updt_data[1:0] = 2'b10;
  3'b010  : pred_array_updt_data[1:0] = 2'b00;
  3'b110  : pred_array_updt_data[1:0] = 2'b10;
  3'b101  : pred_array_updt_data[1:0] = 2'b11;
  3'b100  : pred_array_updt_data[1:0] = 2'b01;
  3'b111  : pred_array_updt_data[1:0] = 2'b11;
  3'b000  : pred_array_updt_data[1:0] = 2'b00;
  default : pred_array_updt_data[1:0] = 2'b00;
endcase
// &CombEnd; @828
end

//Select 13:4 as pred array updt index
assign bht_wr_buf_pred_updt_index[9:0] = {cur_ghr[13:10],{cur_ghr[9:4]^cur_ghr[21:16]}};

//==========================================================
//             select array updt data
//==========================================================
// &CombBeg; @836
always @( cur_condbr_taken
       or cur_sel_rst[1:0])
begin
case({cur_sel_rst[1:0],cur_condbr_taken})
  3'b001  : sel_array_updt_data[1:0] = 2'b01;
  3'b011  : sel_array_updt_data[1:0] = 2'b10;
  3'b010  : sel_array_updt_data[1:0] = 2'b00;
  3'b110  : sel_array_updt_data[1:0] = 2'b10;
  3'b101  : sel_array_updt_data[1:0] = 2'b11;
  3'b100  : sel_array_updt_data[1:0] = 2'b01;
  3'b000  : sel_array_updt_data[1:0] = 2'b00;
  3'b111  : sel_array_updt_data[1:0] = 2'b11;
  default : sel_array_updt_data[1:0] = 2'b00;
endcase
// &CombEnd; @848
end

assign bht_wr_buf_sel_updt_index[6:0] = cur_cur_pc[9:3];

//==========================================================
//                sel_array_updt_sel_b
//==========================================================
// &CombBeg; @855
always @( cur_cur_pc[2:0])
begin
case(cur_cur_pc[2:0])
  3'b000  : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b1111_1110;
  3'b001  : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b1111_1101;
  3'b010  : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b1111_1011;
  3'b011  : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b1111_0111;
  3'b100  : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b1110_1111;
  3'b101  : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b1101_1111;
  3'b110  : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b1011_1111;
  3'b111  : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b0111_1111;
  default : bht_wr_buf_sel_updt_sel_b[7:0] = 8'b1111_1111;
endcase
// &CombEnd; @867
end

//==========================================================
//                pred_array_updt_sel_b
//==========================================================
// &CombBeg; @872
always @( cur_ghr[3:0]
       or cur_cur_pc[3:0]
       or cur_sel_rst[1])
begin
case({(cur_cur_pc[3:0] ^ cur_ghr[3:0]), !cur_sel_rst[1]})
  5'b0000_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_1111_1110;
  5'b0000_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_1111_1101;
  5'b0001_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_1111_1011;
  5'b0001_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_1111_0111;
  5'b0010_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_1110_1111;
  5'b0010_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_1101_1111;
  5'b0011_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_1011_1111;
  5'b0011_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_0111_1111;
  5'b0100_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1110_1111_1111;
  5'b0100_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1101_1111_1111;
  5'b0101_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1011_1111_1111;
  5'b0101_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_0111_1111_1111;
  5'b0110_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1110_1111_1111_1111;
  5'b0110_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1101_1111_1111_1111;
  5'b0111_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1011_1111_1111_1111;
  5'b0111_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_0111_1111_1111_1111;
  
  5'b1000_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1110_1111_1111_1111_1111;
  5'b1000_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1101_1111_1111_1111_1111;
  5'b1001_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1011_1111_1111_1111_1111;
  5'b1001_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_0111_1111_1111_1111_1111;
  5'b1010_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1110_1111_1111_1111_1111_1111;
  5'b1010_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1101_1111_1111_1111_1111_1111;
  5'b1011_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1011_1111_1111_1111_1111_1111;
  5'b1011_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_0111_1111_1111_1111_1111_1111;
  5'b1100_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1110_1111_1111_1111_1111_1111_1111;
  5'b1100_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1101_1111_1111_1111_1111_1111_1111;
  5'b1101_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1011_1111_1111_1111_1111_1111_1111;
  5'b1101_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_0111_1111_1111_1111_1111_1111_1111;
  5'b1110_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1110_1111_1111_1111_1111_1111_1111_1111;
  5'b1110_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1101_1111_1111_1111_1111_1111_1111_1111;
  5'b1111_0 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1011_1111_1111_1111_1111_1111_1111_1111;
  5'b1111_1 : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b0111_1111_1111_1111_1111_1111_1111_1111;

  default   : bht_wr_buf_pred_updt_sel_b[31:0] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
endcase
// &CombEnd; @910
end

assign bht_wr_buf_pred_updt_val[63:0] = {32{pred_array_updt_data[1:0]}};
assign bht_wr_buf_sel_updt_val[15:0]  = { 8{sel_array_updt_data[1:0]}};

//==========================================================
//                Pipe Data to IP Stage
//==========================================================
//BHT to IP Pipe Clock
// &Instance("gated_clk_cell","x_bht_pipe_clk"); @919
gated_clk_cell  x_bht_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bht_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bht_pipe_clk_en   ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @920
//           .clk_out        (bht_pipe_clk),//Out Clock @921
//           .external_en    (1'b0), @922
//           .global_en      (cp0_yy_clk_en), @923
//           .local_en       (bht_pipe_clk_en),//Local Condition @924
//           .module_en      (cp0_ifu_icg_en) @925
//         ); @926
assign bht_pipe_clk_en = bht_inv_on_reg || ifctrl_bht_pipedown || lbuf_bht_con_br_vld;

//-------------------Pre Array Result-----------------------
//32-Bit Predict Array Result
always @(posedge bht_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_ipdp_pre_array_data_taken[31:0] <= 32'b0;
  else if(bht_inv_on_reg)
    bht_ipdp_pre_array_data_taken[31:0] <= 32'b0;
  else if(ifctrl_bht_pipedown && cp0_ifu_bht_en && bht_pred_array_rd)
    bht_ipdp_pre_array_data_taken[31:0] <= pre_array_pipe_taken_data[31:0];
  else
    bht_ipdp_pre_array_data_taken[31:0] <= bht_ipdp_pre_array_data_taken[31:0];
end

always @(posedge bht_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_ipdp_pre_array_data_ntake[31:0] <= 32'b0;
  else if(bht_inv_on_reg)
    bht_ipdp_pre_array_data_ntake[31:0] <= 32'b0;
  else if(ifctrl_bht_pipedown && cp0_ifu_bht_en && bht_pred_array_rd)
    bht_ipdp_pre_array_data_ntake[31:0] <= pre_array_pipe_ntaken_data[31:0];
  else
    bht_ipdp_pre_array_data_ntake[31:0] <= bht_ipdp_pre_array_data_ntake[31:0];
end

// &Force("output","bht_ipdp_pre_array_data_ntake"); @955
// &Force("output","bht_ipdp_pre_array_data_taken"); @956
assign ip_vld = ipctrl_bht_vld || 
                after_rtu_ifu_flush || 
                after_bju_mispred;
//-------------Pre Array offset One-hot---------------------
//Predict Array offset = vghr[3:0] ^ pc[7:4]
//And then trans it to one-hot
assign pre_offset_ip_0[3:0] = ipdp_bht_vpc[6:3]   ^ pre_vghr_offset_0[3:0];
assign pre_offset_ip_1[3:0] = ipdp_bht_vpc[6:3]   ^ pre_vghr_offset_1[3:0];
assign pre_offset_if_0[3:0] = pcgen_bht_ifpc[6:3] ^ pre_vghr_offset_0[3:0];
assign pre_offset_if_1[3:0] = pcgen_bht_ifpc[6:3] ^ pre_vghr_offset_1[3:0];


//offset_0 means ip con_branch not valid
// &CombBeg; @970
always @( bju_ghr[3:0]
       or vghr_reg[3:0]
       or iu_ifu_bht_check_vld
       or rtughr_reg[3:0]
       or rtu_ifu_flush
       or iu_ifu_bht_condbr_taken
       or bju_mispred)
begin
if(rtu_ifu_flush)
  pre_vghr_offset_0[3:0] = rtughr_reg[3:0];
else if(bju_mispred && !iu_ifu_bht_check_vld)
  pre_vghr_offset_0[3:0] = bju_ghr[3:0];
else if(bju_mispred && iu_ifu_bht_check_vld)
  pre_vghr_offset_0[3:0] = {bju_ghr[2:0], iu_ifu_bht_condbr_taken};
else
  pre_vghr_offset_0[3:0] = vghr_reg[3:0];
// &CombEnd; @979
end

//offset_1 means ip con_branch valid
// &CombBeg; @982
always @( bju_ghr[3:0]
       or after_bju_mispred
       or vghr_reg[3:0]
       or iu_ifu_bht_check_vld
       or after_rtu_ifu_flush
       or ipctrl_bht_con_br_taken
       or rtughr_reg[3:0]
       or rtu_ifu_flush
       or iu_ifu_bht_condbr_taken
       or bju_mispred)
begin
if(rtu_ifu_flush)
  pre_vghr_offset_1[3:0] = rtughr_reg[3:0];
else if(bju_mispred && !iu_ifu_bht_check_vld)
  pre_vghr_offset_1[3:0] = bju_ghr[3:0];
else if(bju_mispred && iu_ifu_bht_check_vld)
  pre_vghr_offset_1[3:0] = {bju_ghr[2:0], iu_ifu_bht_condbr_taken};
else if(after_bju_mispred || after_rtu_ifu_flush)
  pre_vghr_offset_1[3:0] = vghr_reg[3:0];
else 
  pre_vghr_offset_1[3:0] = {vghr_reg[2:0],ipctrl_bht_con_br_taken};
// &CombEnd; @993
end


assign pre_offset_onehot[15:0]    = (ipctrl_bht_more_br || ipdp_bht_h0_con_br)
                                    ? pre_offset_onehot_ip[15:0]
                                    : pre_offset_onehot_if[15:0];

assign pre_offset_onehot_ip[15:0] = (ipctrl_bht_con_br_vld)
                                    ? pre_offset_onehot_ip_1[15:0]
                                    : pre_offset_onehot_ip_0[15:0];
assign pre_offset_onehot_if[15:0] = (ipctrl_bht_con_br_vld)
                                    ? pre_offset_onehot_if_1[15:0]
                                    : pre_offset_onehot_if_0[15:0];

// &CombBeg; @1007
always @( pre_offset_ip_0[3:0])
begin
case(pre_offset_ip_0[3:0])
  4'b0000 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0000_0000_0001;
  4'b0001 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0000_0000_0010;
  4'b0010 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0000_0000_0100;
  4'b0011 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0000_0000_1000;
  4'b0100 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0000_0001_0000;
  4'b0101 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0000_0010_0000;
  4'b0110 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0000_0100_0000;
  4'b0111 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0000_1000_0000;
  4'b1000 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0001_0000_0000;
  4'b1001 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0010_0000_0000;
  4'b1010 : pre_offset_onehot_ip_0[15:0] = 16'b0000_0100_0000_0000;
  4'b1011 : pre_offset_onehot_ip_0[15:0] = 16'b0000_1000_0000_0000;
  4'b1100 : pre_offset_onehot_ip_0[15:0] = 16'b0001_0000_0000_0000;
  4'b1101 : pre_offset_onehot_ip_0[15:0] = 16'b0010_0000_0000_0000;
  4'b1110 : pre_offset_onehot_ip_0[15:0] = 16'b0100_0000_0000_0000;
  4'b1111 : pre_offset_onehot_ip_0[15:0] = 16'b1000_0000_0000_0000;
  default : pre_offset_onehot_ip_0[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1027
end

// &CombBeg; @1029
always @( pre_offset_ip_1[3:0])
begin
case(pre_offset_ip_1[3:0])
  4'b0000 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0000_0000_0001;
  4'b0001 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0000_0000_0010;
  4'b0010 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0000_0000_0100;
  4'b0011 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0000_0000_1000;
  4'b0100 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0000_0001_0000;
  4'b0101 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0000_0010_0000;
  4'b0110 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0000_0100_0000;
  4'b0111 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0000_1000_0000;
  4'b1000 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0001_0000_0000;
  4'b1001 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0010_0000_0000;
  4'b1010 : pre_offset_onehot_ip_1[15:0] = 16'b0000_0100_0000_0000;
  4'b1011 : pre_offset_onehot_ip_1[15:0] = 16'b0000_1000_0000_0000;
  4'b1100 : pre_offset_onehot_ip_1[15:0] = 16'b0001_0000_0000_0000;
  4'b1101 : pre_offset_onehot_ip_1[15:0] = 16'b0010_0000_0000_0000;
  4'b1110 : pre_offset_onehot_ip_1[15:0] = 16'b0100_0000_0000_0000;
  4'b1111 : pre_offset_onehot_ip_1[15:0] = 16'b1000_0000_0000_0000;
  default : pre_offset_onehot_ip_1[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1049
end


// &CombBeg; @1052
always @( pre_offset_if_0[3:0])
begin
case(pre_offset_if_0[3:0])
  4'b0000 : pre_offset_onehot_if_0[15:0] = 16'b0000_0000_0000_0001;
  4'b0001 : pre_offset_onehot_if_0[15:0] = 16'b0000_0000_0000_0010;
  4'b0010 : pre_offset_onehot_if_0[15:0] = 16'b0000_0000_0000_0100;
  4'b0011 : pre_offset_onehot_if_0[15:0] = 16'b0000_0000_0000_1000;
  4'b0100 : pre_offset_onehot_if_0[15:0] = 16'b0000_0000_0001_0000;
  4'b0101 : pre_offset_onehot_if_0[15:0] = 16'b0000_0000_0010_0000;
  4'b0110 : pre_offset_onehot_if_0[15:0] = 16'b0000_0000_0100_0000;
  4'b0111 : pre_offset_onehot_if_0[15:0] = 16'b0000_0000_1000_0000;
  4'b1000 : pre_offset_onehot_if_0[15:0] = 16'b0000_0001_0000_0000;
  4'b1001 : pre_offset_onehot_if_0[15:0] = 16'b0000_0010_0000_0000;
  4'b1010 : pre_offset_onehot_if_0[15:0] = 16'b0000_0100_0000_0000;
  4'b1011 : pre_offset_onehot_if_0[15:0] = 16'b0000_1000_0000_0000;
  4'b1100 : pre_offset_onehot_if_0[15:0] = 16'b0001_0000_0000_0000;
  4'b1101 : pre_offset_onehot_if_0[15:0] = 16'b0010_0000_0000_0000;
  4'b1110 : pre_offset_onehot_if_0[15:0] = 16'b0100_0000_0000_0000;
  4'b1111 : pre_offset_onehot_if_0[15:0] = 16'b1000_0000_0000_0000;
  default : pre_offset_onehot_if_0[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1072
end

// &CombBeg; @1074
always @( pre_offset_if_1[3:0])
begin
case(pre_offset_if_1[3:0])
  4'b0000 : pre_offset_onehot_if_1[15:0] = 16'b0000_0000_0000_0001;
  4'b0001 : pre_offset_onehot_if_1[15:0] = 16'b0000_0000_0000_0010;
  4'b0010 : pre_offset_onehot_if_1[15:0] = 16'b0000_0000_0000_0100;
  4'b0011 : pre_offset_onehot_if_1[15:0] = 16'b0000_0000_0000_1000;
  4'b0100 : pre_offset_onehot_if_1[15:0] = 16'b0000_0000_0001_0000;
  4'b0101 : pre_offset_onehot_if_1[15:0] = 16'b0000_0000_0010_0000;
  4'b0110 : pre_offset_onehot_if_1[15:0] = 16'b0000_0000_0100_0000;
  4'b0111 : pre_offset_onehot_if_1[15:0] = 16'b0000_0000_1000_0000;
  4'b1000 : pre_offset_onehot_if_1[15:0] = 16'b0000_0001_0000_0000;
  4'b1001 : pre_offset_onehot_if_1[15:0] = 16'b0000_0010_0000_0000;
  4'b1010 : pre_offset_onehot_if_1[15:0] = 16'b0000_0100_0000_0000;
  4'b1011 : pre_offset_onehot_if_1[15:0] = 16'b0000_1000_0000_0000;
  4'b1100 : pre_offset_onehot_if_1[15:0] = 16'b0001_0000_0000_0000;
  4'b1101 : pre_offset_onehot_if_1[15:0] = 16'b0010_0000_0000_0000;
  4'b1110 : pre_offset_onehot_if_1[15:0] = 16'b0100_0000_0000_0000;
  4'b1111 : pre_offset_onehot_if_1[15:0] = 16'b1000_0000_0000_0000;
  default : pre_offset_onehot_if_1[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1094
end

always @(posedge bht_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_ipdp_pre_offset_onehot[15:0] <= 16'b1;
  else if(bht_inv_on_reg)
    bht_ipdp_pre_offset_onehot[15:0] <= 16'b1;
  else if(ifctrl_bht_pipedown && cp0_ifu_bht_en)//BHT not on, hold old result
    bht_ipdp_pre_offset_onehot[15:0] <= pre_offset_onehot[15:0];
  else
    bht_ipdp_pre_offset_onehot[15:0] <= bht_ipdp_pre_offset_onehot[15:0];
end
// &Force("output","bht_ipdp_pre_offset_onehot"); @1107

//-------------------Vghr pipe tp IP------------------------
// &CombBeg; @1110
always @( vghr_ip_updt_vld
       or cp0_ifu_bht_en
       or iu_ifu_bht_check_vld
       or bju_ghr[21:0]
       or vghr_lbuf_updt_vld
       or ipctrl_bht_con_br_taken
       or ghr_updt_vld
       or rtu_ifu_flush
       or iu_ifu_bht_condbr_taken
       or vghr_reg[21:0]
       or rtughr_reg[21:0]
       or lbuf_bht_con_br_taken)
begin
if(rtu_ifu_flush && cp0_ifu_bht_en)
  vghr_value[21:0] = rtughr_reg[21:0];
else if(ghr_updt_vld && iu_ifu_bht_check_vld)
  vghr_value[21:0] = {bju_ghr[20:0],iu_ifu_bht_condbr_taken};
else if(ghr_updt_vld && !iu_ifu_bht_check_vld)
  vghr_value[21:0] = bju_ghr[21:0];
else if(vghr_lbuf_updt_vld)
  vghr_value[21:0] = {vghr_reg[20:0], lbuf_bht_con_br_taken};
else if(vghr_ip_updt_vld)
  vghr_value[21:0] = {vghr_reg[20:0], ipctrl_bht_con_br_taken};
else
  vghr_value[21:0] =  vghr_reg[21:0];
// &CombEnd; @1123
end

always @(posedge bht_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_ipdp_vghr[21:0] <= 22'b0;
  else if(bht_inv_on_reg)
    bht_ipdp_vghr[21:0] <= 22'b0;
  else if(ifctrl_bht_pipedown && cp0_ifu_bht_en)
    bht_ipdp_vghr[21:0] <= vghr_value[21:0];
  else
    bht_ipdp_vghr[21:0] <= bht_ipdp_vghr[21:0];
end
// &Force("output","bht_ipdp_vghr"); @1136

//-------------------Sel Array Result-----------------------
always @(posedge bht_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_ipdp_sel_array_result[1:0] <= 2'b0;
  else if(bht_inv_on_reg)
    bht_ipdp_sel_array_result[1:0] <= 2'b0;
  else if(ifctrl_bht_pipedown && cp0_ifu_bht_en)
    bht_ipdp_sel_array_result[1:0] <= sel_array_val[1:0];
  else
    bht_ipdp_sel_array_result[1:0] <= bht_ipdp_sel_array_result[1:0];
end
// &Force("output","bht_ipdp_sel_array_result"); @1150

//==========================================================
//                 Some Control of BHT
//==========================================================
// &Instance("gated_clk_cell","x_bht_flop_clk"); @1155
gated_clk_cell  x_bht_flop_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bht_flop_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bht_flop_clk_en   ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @1156
//           .clk_out        (bht_flop_clk),//Out Clock @1157
//           .external_en    (1'b0), @1158
//           .global_en      (cp0_yy_clk_en), @1159
//           .local_en       (bht_flop_clk_en),//Local Condition @1160
//           .module_en      (cp0_ifu_icg_en) @1161
//         ); @1162
assign bht_flop_clk_en = bht_inv_on_reg || 
                         bht_inv_on_reg_ff || 
                         bju_mispred || 
                         after_bju_mispred || 
                         rtu_ifu_flush || 
                         after_rtu_ifu_flush;
//-----------------after_inv_reg----------------------------
always @(posedge bht_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_inv_on_reg_ff <= 1'b0;
  else
    bht_inv_on_reg_ff <= bht_inv_on_reg;
end

assign after_inv_reg = !bht_inv_on_reg && bht_inv_on_reg_ff;

//-----------------after_bju_mispred------------------------
always @(posedge bht_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    after_bju_mispred <= 1'b0;
  else if(bju_mispred)
    after_bju_mispred <= 1'b1;
  else
    after_bju_mispred <= 1'b0;
end

//-----------------after_rtu_ifu_flush----------------------
always @(posedge bht_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    after_rtu_ifu_flush <= 1'b0;
  else if(rtu_ifu_flush)
    after_rtu_ifu_flush <= 1'b1;
  else
    after_rtu_ifu_flush <= 1'b0;
end

//==========================================================
//               Invalidation of BHT
//==========================================================
// &Instance("gated_clk_cell","x_bht_inv_cnt_clk"); @1205
gated_clk_cell  x_bht_inv_cnt_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bht_inv_cnt_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bht_inv_cnt_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @1206
//           .clk_out        (bht_inv_cnt_clk),//Out Clock @1207
//           .external_en    (1'b0), @1208
//           .global_en      (cp0_yy_clk_en), @1209
//           .local_en       (bht_inv_cnt_clk_en),//Local Condition @1210
//           .module_en      (cp0_ifu_icg_en) @1211
//         ); @1212
assign bht_inv_cnt_clk_en = bht_inv_on_reg || ifctrl_bht_inv;

always @(posedge bht_inv_cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_inval_cnt_pre[9:0] <= 10'b0;
  else if(bht_inv_on_reg)
    bht_inval_cnt_pre[9:0] <= bht_inval_cnt_pre[9:0] - 10'b1;
  else if(ifctrl_bht_inv)
    bht_inval_cnt_pre[9:0] <= 10'b1111111111;
  else
    bht_inval_cnt_pre[9:0] <= bht_inval_cnt_pre[9:0];
end

assign bht_inval_cnt[9:0] = bht_inval_cnt_pre[9:0];

always @(posedge bht_inv_cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_inv_on_reg <= 1'b0;
  else if(!(|bht_inval_cnt[9:0]) && bht_inv_on_reg)
    bht_inv_on_reg <= 1'b0;
  else if(ifctrl_bht_inv)
    bht_inv_on_reg <= 1'b1;
end

assign bht_ifctrl_inv_done = !bht_inv_on_reg;
assign bht_ifctrl_inv_on   = bht_inv_on_reg;

//==========================================================
//                  BHT BYPASS WAY
//==========================================================
//IF BHT_INDEX Hit WR_BUF
//TAKE BUF VALUE not TAKE Memory Value
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_pred_array_index_flop[9:0] <= 10'b0;
  else if(bht_pred_array_rd)
    bht_pred_array_index_flop[9:0] <= bht_pred_array_index[9:0];
  else
    bht_pred_array_index_flop[9:0] <= bht_pred_array_index_flop[9:0];
end

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bht_sel_array_index_flop[9:0] <= 10'b0;
  else if(bht_sel_array_rd && !ifctrl_bht_stall)
    bht_sel_array_index_flop[9:0] <= pcgen_bht_pcindex[9:0];
  else
    bht_sel_array_index_flop[9:0] <= bht_sel_array_index_flop[9:0];
end

//Write Buffer Bypass Logic
assign wr_buf_pre_hit_0 = (vghr_reg[20:0] == entry0_data[30:10]);
assign wr_buf_pre_hit_1 = (vghr_reg[20:0] == entry1_data[30:10]);
assign wr_buf_pre_hit_2 = (vghr_reg[20:0] == entry2_data[30:10]);
assign wr_buf_pre_hit_3 = (vghr_reg[20:0] == entry3_data[30:10]);
assign wr_buf_sel_hit_0 = (bht_sel_array_index_flop[9:0]  == entry0_data[9:0]);
assign wr_buf_sel_hit_1 = (bht_sel_array_index_flop[9:0]  == entry1_data[9:0]);
assign wr_buf_sel_hit_2 = (bht_sel_array_index_flop[9:0]  == entry2_data[9:0]);
assign wr_buf_sel_hit_3 = (bht_sel_array_index_flop[9:0]  == entry3_data[9:0]);
assign wr_buf_hit_0   = wr_buf_pre_hit_0 && wr_buf_sel_hit_0 && entry0_vld;
assign wr_buf_hit_1   = wr_buf_pre_hit_1 && wr_buf_sel_hit_1 && entry1_vld;
assign wr_buf_hit_2   = wr_buf_pre_hit_2 && wr_buf_sel_hit_2 && entry2_vld;
assign wr_buf_hit_3   = wr_buf_pre_hit_3 && wr_buf_sel_hit_3 && entry3_vld;
assign wr_buf_hit     = (
                          wr_buf_hit_0 || 
                          wr_buf_hit_1 || 
                          wr_buf_hit_2 || 
                          wr_buf_hit_3
                        ) && 
                        wr_buf_rd;
assign wr_buf_rd      = sel_rd_flop && pre_rd_flop;
  
// &CombBeg; @1289
always @( entry3_sel_updt_data[1:0]
       or entry1_sel_updt_data[1:0]
       or entry0_sel_updt_data[1:0]
       or wr_buf_hit_0
       or entry2_sel_updt_data[1:0]
       or wr_buf_hit_2
       or wr_buf_hit_1)
begin
if(wr_buf_hit_0)
  wr_buf_sel_array_result[1:0]  = entry0_sel_updt_data[1:0];
else if(wr_buf_hit_1)
  wr_buf_sel_array_result[1:0]  = entry1_sel_updt_data[1:0];
else if(wr_buf_hit_2)
  wr_buf_sel_array_result[1:0]  = entry2_sel_updt_data[1:0];
else 
  wr_buf_sel_array_result[1:0]  = entry3_sel_updt_data[1:0];
// &CombEnd; @1298
end

// &CombBeg; @1300
always @( entry0_data[35:33])
begin
case({entry0_data[34:33],entry0_data[35]})
  3'b001  : entry0_sel_updt_data[1:0] = 2'b01;
  3'b011  : entry0_sel_updt_data[1:0] = 2'b10;
  3'b010  : entry0_sel_updt_data[1:0] = 2'b00;
  3'b110  : entry0_sel_updt_data[1:0] = 2'b10;
  3'b101  : entry0_sel_updt_data[1:0] = 2'b11;
  3'b100  : entry0_sel_updt_data[1:0] = 2'b01;
  3'b111  : entry0_sel_updt_data[1:0] = 2'b11;
  3'b000  : entry0_sel_updt_data[1:0] = 2'b00;
  default : entry0_sel_updt_data[1:0] = 2'b00;
endcase
// &CombEnd; @1312
end

// &CombBeg; @1314
always @( entry1_data[35:33])
begin
case({entry1_data[34:33],entry1_data[35]})
  3'b001  : entry1_sel_updt_data[1:0] = 2'b01;
  3'b011  : entry1_sel_updt_data[1:0] = 2'b10;
  3'b010  : entry1_sel_updt_data[1:0] = 2'b00;
  3'b110  : entry1_sel_updt_data[1:0] = 2'b10;
  3'b101  : entry1_sel_updt_data[1:0] = 2'b11;
  3'b100  : entry1_sel_updt_data[1:0] = 2'b01;
  3'b111  : entry1_sel_updt_data[1:0] = 2'b11;
  3'b000  : entry1_sel_updt_data[1:0] = 2'b00;
  default : entry1_sel_updt_data[1:0] = 2'b00;
endcase
// &CombEnd; @1326
end

// &CombBeg; @1328
always @( entry2_data[35:33])
begin
case({entry2_data[34:33],entry2_data[35]})
  3'b001  : entry2_sel_updt_data[1:0] = 2'b01;
  3'b011  : entry2_sel_updt_data[1:0] = 2'b10;
  3'b010  : entry2_sel_updt_data[1:0] = 2'b00;
  3'b110  : entry2_sel_updt_data[1:0] = 2'b10;
  3'b101  : entry2_sel_updt_data[1:0] = 2'b11;
  3'b100  : entry2_sel_updt_data[1:0] = 2'b01;
  3'b111  : entry2_sel_updt_data[1:0] = 2'b11;
  3'b000  : entry2_sel_updt_data[1:0] = 2'b00;
  default : entry2_sel_updt_data[1:0] = 2'b00;
endcase
// &CombEnd; @1340
end

// &CombBeg; @1342
always @( entry3_data[35:33])
begin
case({entry3_data[34:33],entry3_data[35]})
  3'b001  : entry3_sel_updt_data[1:0] = 2'b01;
  3'b011  : entry3_sel_updt_data[1:0] = 2'b10;
  3'b010  : entry3_sel_updt_data[1:0] = 2'b00;
  3'b110  : entry3_sel_updt_data[1:0] = 2'b10;
  3'b101  : entry3_sel_updt_data[1:0] = 2'b11;
  3'b100  : entry3_sel_updt_data[1:0] = 2'b01;
  3'b111  : entry3_sel_updt_data[1:0] = 2'b11;
  3'b000  : entry3_sel_updt_data[1:0] = 2'b00;
  default : entry3_sel_updt_data[1:0] = 2'b00;
endcase
// &CombEnd; @1354
end

//==========================================================
//                Interface to Ind BTB
//==========================================================
assign bht_ind_btb_rtu_ghr[7:0]  = rtughr_reg[7:0];
assign bht_ind_btb_vghr[7:0]     = vghr_reg[7:0];

//==========================================================
//                Interface to LBUF
//==========================================================
always @(posedge bht_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_pre_taken_reg[31:0] <= 32'b0;
  else if(bht_inv_on_reg)
    lbuf_pre_taken_reg[31:0] <= 32'b0;
  else if(cp0_ifu_bht_en && lbuf_bht_con_br_vld && lbuf_bht_active_state)
    lbuf_pre_taken_reg[31:0] <= pre_array_pipe_taken_data[31:0];
  else
    lbuf_pre_taken_reg[31:0] <= lbuf_pre_taken_reg[31:0];
end
always @(posedge bht_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_pre_ntaken_reg[31:0] <= 32'b0;
  else if(bht_inv_on_reg)
    lbuf_pre_ntaken_reg[31:0] <= 32'b0;
  else if(cp0_ifu_bht_en && lbuf_bht_con_br_vld && lbuf_bht_active_state)
    lbuf_pre_ntaken_reg[31:0] <= pre_array_pipe_ntaken_data[31:0];
  else
    lbuf_pre_ntaken_reg[31:0] <= lbuf_pre_ntaken_reg[31:0];
end
assign bht_lbuf_pre_taken_result[31:0]  = lbuf_pre_taken_reg[31:0];
assign bht_lbuf_pre_ntaken_result[31:0] = lbuf_pre_ntaken_reg[31:0];
assign bht_lbuf_vghr[21:0]              = vghr_reg[21:0];


//==========================================================
//                  Infor from IU
//==========================================================
assign bju_mispred       = iu_ifu_chgflw_vld;
assign bju_pred_rst[1:0] = {iu_ifu_bht_pred, iu_ifu_chk_idx[24]};
assign bju_sel_rst[1:0]  = iu_ifu_chk_idx[23:22];
assign bju_ghr[21:0]     = iu_ifu_chk_idx[21:0];

//==========================================================
//                 Interface to Memory
//==========================================================
// &Instance("ct_ifu_bht_pre_array", "x_ct_ifu_bht_pre_array"); @1407
ct_ifu_bht_pre_array  x_ct_ifu_bht_pre_array (
  .bht_pre_array_clk_en (bht_pre_array_clk_en),
  .bht_pre_data_out     (bht_pre_data_out    ),
  .bht_pred_array_cen_b (bht_pred_array_cen_b),
  .bht_pred_array_din   (bht_pred_array_din  ),
  .bht_pred_array_gwen  (bht_pred_array_gwen ),
  .bht_pred_array_index (bht_pred_array_index),
  .bht_pred_bwen        (bht_pred_bwen       ),
  .cp0_ifu_icg_en       (cp0_ifu_icg_en      ),
  .cp0_yy_clk_en        (cp0_yy_clk_en       ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Instance("ct_ifu_bht_sel_array", "x_ct_ifu_bht_sel_array"); @1408
ct_ifu_bht_sel_array  x_ct_ifu_bht_sel_array (
  .bht_sel_array_cen_b  (bht_sel_array_cen_b ),
  .bht_sel_array_clk_en (bht_sel_array_clk_en),
  .bht_sel_array_din    (bht_sel_array_din   ),
  .bht_sel_array_gwen   (bht_sel_array_gwen  ),
  .bht_sel_array_index  (bht_sel_array_index ),
  .bht_sel_bwen         (bht_sel_bwen        ),
  .bht_sel_data_out     (bht_sel_data_out    ),
  .cp0_ifu_icg_en       (cp0_ifu_icg_en      ),
  .cp0_yy_clk_en        (cp0_yy_clk_en       ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);


// &ModuleEnd; @1410
endmodule


