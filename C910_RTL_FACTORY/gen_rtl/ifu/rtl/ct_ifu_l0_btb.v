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
module ct_ifu_l0_btb(
  addrgen_l0_btb_update_entry,
  addrgen_l0_btb_update_vld,
  addrgen_l0_btb_update_vld_bit,
  addrgen_l0_btb_wen,
  cp0_ifu_btb_en,
  cp0_ifu_icg_en,
  cp0_ifu_l0btb_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ibdp_l0_btb_fifo_update_vld,
  ibdp_l0_btb_update_cnt_bit,
  ibdp_l0_btb_update_data,
  ibdp_l0_btb_update_entry,
  ibdp_l0_btb_update_ras_bit,
  ibdp_l0_btb_update_vld,
  ibdp_l0_btb_update_vld_bit,
  ibdp_l0_btb_wen,
  ifctrl_l0_btb_inv,
  ifctrl_l0_btb_stall,
  ipctrl_l0_btb_chgflw_vld,
  ipctrl_l0_btb_ip_vld,
  ipctrl_l0_btb_wait_next,
  ipdp_l0_btb_ras_pc,
  ipdp_l0_btb_ras_push,
  l0_btb_debug_cur_state,
  l0_btb_ibdp_entry_fifo,
  l0_btb_ifctrl_chgflw_pc,
  l0_btb_ifctrl_chgflw_way_pred,
  l0_btb_ifctrl_chglfw_vld,
  l0_btb_ifdp_chgflw_pc,
  l0_btb_ifdp_chgflw_way_pred,
  l0_btb_ifdp_counter,
  l0_btb_ifdp_entry_hit,
  l0_btb_ifdp_hit,
  l0_btb_ifdp_ras,
  l0_btb_ipctrl_st_wait,
  l0_btb_update_vld_for_gateclk,
  pad_yy_icg_scan_en,
  pcgen_l0_btb_chgflw_mask,
  pcgen_l0_btb_chgflw_pc,
  pcgen_l0_btb_chgflw_vld,
  pcgen_l0_btb_if_pc,
  ras_l0_btb_pc,
  ras_l0_btb_push_pc,
  ras_l0_btb_ras_push
);

// &Ports; @23
input   [15:0]  addrgen_l0_btb_update_entry;  
input           addrgen_l0_btb_update_vld;    
input           addrgen_l0_btb_update_vld_bit; 
input   [3 :0]  addrgen_l0_btb_wen;           
input           cp0_ifu_btb_en;               
input           cp0_ifu_icg_en;               
input           cp0_ifu_l0btb_en;             
input           cp0_yy_clk_en;                
input           cpurst_b;                     
input           forever_cpuclk;               
input           ibdp_l0_btb_fifo_update_vld;  
input           ibdp_l0_btb_update_cnt_bit;   
input   [36:0]  ibdp_l0_btb_update_data;      
input   [15:0]  ibdp_l0_btb_update_entry;     
input           ibdp_l0_btb_update_ras_bit;   
input           ibdp_l0_btb_update_vld;       
input           ibdp_l0_btb_update_vld_bit;   
input   [3 :0]  ibdp_l0_btb_wen;              
input           ifctrl_l0_btb_inv;            
input           ifctrl_l0_btb_stall;          
input           ipctrl_l0_btb_chgflw_vld;     
input           ipctrl_l0_btb_ip_vld;         
input           ipctrl_l0_btb_wait_next;      
input   [38:0]  ipdp_l0_btb_ras_pc;           
input           ipdp_l0_btb_ras_push;         
input           l0_btb_update_vld_for_gateclk; 
input           pad_yy_icg_scan_en;           
input           pcgen_l0_btb_chgflw_mask;     
input   [14:0]  pcgen_l0_btb_chgflw_pc;       
input           pcgen_l0_btb_chgflw_vld;      
input   [38:0]  pcgen_l0_btb_if_pc;           
input   [38:0]  ras_l0_btb_pc;                
input   [38:0]  ras_l0_btb_push_pc;           
input           ras_l0_btb_ras_push;          
output  [1 :0]  l0_btb_debug_cur_state;       
output  [15:0]  l0_btb_ibdp_entry_fifo;       
output  [38:0]  l0_btb_ifctrl_chgflw_pc;      
output  [1 :0]  l0_btb_ifctrl_chgflw_way_pred; 
output          l0_btb_ifctrl_chglfw_vld;     
output  [38:0]  l0_btb_ifdp_chgflw_pc;        
output  [1 :0]  l0_btb_ifdp_chgflw_way_pred;  
output          l0_btb_ifdp_counter;          
output  [15:0]  l0_btb_ifdp_entry_hit;        
output          l0_btb_ifdp_hit;              
output          l0_btb_ifdp_ras;              
output          l0_btb_ipctrl_st_wait;        

// &Regs; @24
reg     [15:0]  entry_fifo;                   
reg     [15:0]  entry_hit_flop;               
reg     [1 :0]  l0_btb_cur_state;             
reg             l0_btb_entry_inv;             
reg     [1 :0]  l0_btb_next_state;            
reg             l0_btb_rd_flop;               
reg             l0_btb_update_cnt_bit;        
reg     [36:0]  l0_btb_update_data;           
reg             l0_btb_update_ras_bit;        
reg             l0_btb_update_vld_bit;        
reg     [3 :0]  l0_btb_wen;                   
reg     [38:0]  ras_pc;                       

// &Wires; @25
wire    [15:0]  addrgen_l0_btb_update_entry;  
wire            addrgen_l0_btb_update_vld;    
wire            addrgen_l0_btb_update_vld_bit; 
wire    [3 :0]  addrgen_l0_btb_wen;           
wire            bypass_rd_hit;                
wire            cp0_ifu_btb_en;               
wire            cp0_ifu_icg_en;               
wire            cp0_ifu_l0btb_en;             
wire            cp0_yy_clk_en;                
wire            cpurst_b;                     
wire            entry0_cnt;                   
wire            entry0_ras;                   
wire            entry0_rd_hit;                
wire    [14:0]  entry0_tag;                   
wire    [19:0]  entry0_target;                
wire            entry0_vld;                   
wire    [1 :0]  entry0_way_pred;              
wire            entry10_cnt;                  
wire            entry10_ras;                  
wire            entry10_rd_hit;               
wire    [14:0]  entry10_tag;                  
wire    [19:0]  entry10_target;               
wire            entry10_vld;                  
wire    [1 :0]  entry10_way_pred;             
wire            entry11_cnt;                  
wire            entry11_ras;                  
wire            entry11_rd_hit;               
wire    [14:0]  entry11_tag;                  
wire    [19:0]  entry11_target;               
wire            entry11_vld;                  
wire    [1 :0]  entry11_way_pred;             
wire            entry12_cnt;                  
wire            entry12_ras;                  
wire            entry12_rd_hit;               
wire    [14:0]  entry12_tag;                  
wire    [19:0]  entry12_target;               
wire            entry12_vld;                  
wire    [1 :0]  entry12_way_pred;             
wire            entry13_cnt;                  
wire            entry13_ras;                  
wire            entry13_rd_hit;               
wire    [14:0]  entry13_tag;                  
wire    [19:0]  entry13_target;               
wire            entry13_vld;                  
wire    [1 :0]  entry13_way_pred;             
wire            entry14_cnt;                  
wire            entry14_ras;                  
wire            entry14_rd_hit;               
wire    [14:0]  entry14_tag;                  
wire    [19:0]  entry14_target;               
wire            entry14_vld;                  
wire    [1 :0]  entry14_way_pred;             
wire            entry15_cnt;                  
wire            entry15_ras;                  
wire            entry15_rd_hit;               
wire    [14:0]  entry15_tag;                  
wire    [19:0]  entry15_target;               
wire            entry15_vld;                  
wire    [1 :0]  entry15_way_pred;             
wire            entry1_cnt;                   
wire            entry1_ras;                   
wire            entry1_rd_hit;                
wire    [14:0]  entry1_tag;                   
wire    [19:0]  entry1_target;                
wire            entry1_vld;                   
wire    [1 :0]  entry1_way_pred;              
wire            entry2_cnt;                   
wire            entry2_ras;                   
wire            entry2_rd_hit;                
wire    [14:0]  entry2_tag;                   
wire    [19:0]  entry2_target;                
wire            entry2_vld;                   
wire    [1 :0]  entry2_way_pred;              
wire            entry3_cnt;                   
wire            entry3_ras;                   
wire            entry3_rd_hit;                
wire    [14:0]  entry3_tag;                   
wire    [19:0]  entry3_target;                
wire            entry3_vld;                   
wire    [1 :0]  entry3_way_pred;              
wire            entry4_cnt;                   
wire            entry4_ras;                   
wire            entry4_rd_hit;                
wire    [14:0]  entry4_tag;                   
wire    [19:0]  entry4_target;                
wire            entry4_vld;                   
wire    [1 :0]  entry4_way_pred;              
wire            entry5_cnt;                   
wire            entry5_ras;                   
wire            entry5_rd_hit;                
wire    [14:0]  entry5_tag;                   
wire    [19:0]  entry5_target;                
wire            entry5_vld;                   
wire    [1 :0]  entry5_way_pred;              
wire            entry6_cnt;                   
wire            entry6_ras;                   
wire            entry6_rd_hit;                
wire    [14:0]  entry6_tag;                   
wire    [19:0]  entry6_target;                
wire            entry6_vld;                   
wire    [1 :0]  entry6_way_pred;              
wire            entry7_cnt;                   
wire            entry7_ras;                   
wire            entry7_rd_hit;                
wire    [14:0]  entry7_tag;                   
wire    [19:0]  entry7_target;                
wire            entry7_vld;                   
wire    [1 :0]  entry7_way_pred;              
wire            entry8_cnt;                   
wire            entry8_ras;                   
wire            entry8_rd_hit;                
wire    [14:0]  entry8_tag;                   
wire    [19:0]  entry8_target;                
wire            entry8_vld;                   
wire    [1 :0]  entry8_way_pred;              
wire            entry9_cnt;                   
wire            entry9_ras;                   
wire            entry9_rd_hit;                
wire    [14:0]  entry9_tag;                   
wire    [19:0]  entry9_target;                
wire            entry9_vld;                   
wire    [1 :0]  entry9_way_pred;              
wire    [15:0]  entry_bypass_hit;             
wire            entry_chgflw_vld;             
wire    [15:0]  entry_hit;                    
wire            entry_hit_counter;            
wire    [19:0]  entry_hit_pc;                 
wire            entry_hit_ras;                
wire    [38:0]  entry_hit_target;             
wire    [1 :0]  entry_hit_way_pred;           
wire            entry_if_hit;                 
wire    [15:0]  entry_rd_hit;                 
wire            forever_cpuclk;               
wire            ibdp_l0_btb_fifo_update_vld;  
wire            ibdp_l0_btb_update_cnt_bit;   
wire    [36:0]  ibdp_l0_btb_update_data;      
wire    [15:0]  ibdp_l0_btb_update_entry;     
wire            ibdp_l0_btb_update_ras_bit;   
wire            ibdp_l0_btb_update_vld;       
wire            ibdp_l0_btb_update_vld_bit;   
wire    [3 :0]  ibdp_l0_btb_wen;              
wire            ifctrl_l0_btb_inv;            
wire            ifctrl_l0_btb_stall;          
wire            ipctrl_l0_btb_chgflw_vld;     
wire            ipctrl_l0_btb_ip_vld;         
wire            ipctrl_l0_btb_wait_next;      
wire    [38:0]  ipdp_l0_btb_ras_pc;           
wire            ipdp_l0_btb_ras_push;         
wire            l0_btb_clk;                   
wire            l0_btb_clk_en;                
wire            l0_btb_create_clk;            
wire            l0_btb_create_en;             
wire    [1 :0]  l0_btb_debug_cur_state;       
wire    [15:0]  l0_btb_ibdp_entry_fifo;       
wire    [38:0]  l0_btb_ifctrl_chgflw_pc;      
wire    [1 :0]  l0_btb_ifctrl_chgflw_way_pred; 
wire            l0_btb_ifctrl_chglfw_vld;     
wire    [38:0]  l0_btb_ifdp_chgflw_pc;        
wire    [1 :0]  l0_btb_ifdp_chgflw_way_pred;  
wire            l0_btb_ifdp_counter;          
wire    [15:0]  l0_btb_ifdp_entry_hit;        
wire            l0_btb_ifdp_hit;              
wire            l0_btb_ifdp_ras;              
wire            l0_btb_inv_reg_upd_clk;       
wire            l0_btb_inv_reg_upd_clk_en;    
wire            l0_btb_ipctrl_st_wait;        
wire            l0_btb_pipe_clk;              
wire            l0_btb_pipe_en;               
wire    [38:0]  l0_btb_ras_pc;                
wire            l0_btb_rd;                    
wire    [14:0]  l0_btb_rd_tag;                
wire    [15:0]  l0_btb_update_entry;          
wire            l0_btb_update_vld_for_gateclk; 
wire            pad_yy_icg_scan_en;           
wire            pcgen_l0_btb_chgflw_mask;     
wire    [14:0]  pcgen_l0_btb_chgflw_pc;       
wire            pcgen_l0_btb_chgflw_vld;      
wire    [38:0]  pcgen_l0_btb_if_pc;           
wire    [38:0]  ras_l0_btb_pc;                
wire    [38:0]  ras_l0_btb_push_pc;           
wire            ras_l0_btb_ras_push;          


// &Force("bus","pcgen_l0_btb_if_pc",38,0); @28

parameter PC_WIDTH = 40;
parameter IDLE     = 2'b01;
parameter WAIT     = 2'b10;

//==========================================================
//                 Read Enable Signal
//==========================================================
//1. Read enable
assign l0_btb_rd           = cp0_ifu_btb_en
                          && cp0_ifu_l0btb_en
                          && !pcgen_l0_btb_chgflw_mask
                          && (pcgen_l0_btb_chgflw_vld 
                              || !ifctrl_l0_btb_stall);
assign l0_btb_rd_tag[14:0] = pcgen_l0_btb_chgflw_pc[14:0];

//Becaue we will detect chglfw of next two line after one chgflw,so we 
//will read L0 BTB again
always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l0_btb_rd_flop <= 1'b0;
  else
    l0_btb_rd_flop <= l0_btb_rd;
end

//hit signal
assign entry0_rd_hit  = (l0_btb_rd_tag[14:0] == entry0_tag[14:0])  && entry0_vld && !pcgen_l0_btb_chgflw_mask;
assign entry1_rd_hit  = (l0_btb_rd_tag[14:0] == entry1_tag[14:0])  && entry1_vld && !pcgen_l0_btb_chgflw_mask;
assign entry2_rd_hit  = (l0_btb_rd_tag[14:0] == entry2_tag[14:0])  && entry2_vld && !pcgen_l0_btb_chgflw_mask;
assign entry3_rd_hit  = (l0_btb_rd_tag[14:0] == entry3_tag[14:0])  && entry3_vld && !pcgen_l0_btb_chgflw_mask;
assign entry4_rd_hit  = (l0_btb_rd_tag[14:0] == entry4_tag[14:0])  && entry4_vld && !pcgen_l0_btb_chgflw_mask;
assign entry5_rd_hit  = (l0_btb_rd_tag[14:0] == entry5_tag[14:0])  && entry5_vld && !pcgen_l0_btb_chgflw_mask;
assign entry6_rd_hit  = (l0_btb_rd_tag[14:0] == entry6_tag[14:0])  && entry6_vld && !pcgen_l0_btb_chgflw_mask;
assign entry7_rd_hit  = (l0_btb_rd_tag[14:0] == entry7_tag[14:0])  && entry7_vld && !pcgen_l0_btb_chgflw_mask;
assign entry8_rd_hit  = (l0_btb_rd_tag[14:0] == entry8_tag[14:0])  && entry8_vld && !pcgen_l0_btb_chgflw_mask;
assign entry9_rd_hit  = (l0_btb_rd_tag[14:0] == entry9_tag[14:0])  && entry9_vld && !pcgen_l0_btb_chgflw_mask;
assign entry10_rd_hit = (l0_btb_rd_tag[14:0] == entry10_tag[14:0]) && entry10_vld && !pcgen_l0_btb_chgflw_mask;
assign entry11_rd_hit = (l0_btb_rd_tag[14:0] == entry11_tag[14:0]) && entry11_vld && !pcgen_l0_btb_chgflw_mask;
assign entry12_rd_hit = (l0_btb_rd_tag[14:0] == entry12_tag[14:0]) && entry12_vld && !pcgen_l0_btb_chgflw_mask;
assign entry13_rd_hit = (l0_btb_rd_tag[14:0] == entry13_tag[14:0]) && entry13_vld && !pcgen_l0_btb_chgflw_mask;
assign entry14_rd_hit = (l0_btb_rd_tag[14:0] == entry14_tag[14:0]) && entry14_vld && !pcgen_l0_btb_chgflw_mask;
assign entry15_rd_hit = (l0_btb_rd_tag[14:0] == entry15_tag[14:0]) && entry15_vld && !pcgen_l0_btb_chgflw_mask;
assign bypass_rd_hit  = (l0_btb_rd_tag[14:0] == l0_btb_update_data[36:22]) 
                     && l0_btb_update_vld_bit && !pcgen_l0_btb_chgflw_mask; 

assign entry_rd_hit[15:0] = {entry15_rd_hit,entry14_rd_hit,entry13_rd_hit,entry12_rd_hit
                           ,entry11_rd_hit,entry10_rd_hit,entry9_rd_hit ,entry8_rd_hit
                           ,entry7_rd_hit ,entry6_rd_hit ,entry5_rd_hit ,entry4_rd_hit
                           ,entry3_rd_hit ,entry2_rd_hit ,entry1_rd_hit ,entry0_rd_hit};

//only ib ras miss will cause bypass hit
assign entry_bypass_hit[15:0] = {16{bypass_rd_hit}} & ibdp_l0_btb_update_entry[15:0];
assign entry_hit[15:0]        =  entry_rd_hit[15:0] | entry_bypass_hit[15:0];

//if stage data
always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry_hit_flop[15:0] <= 16'b0;
  else if(l0_btb_rd)
    entry_hit_flop[15:0] <= entry_hit[15:0];
  else if(l0_btb_rd_flop && !ifctrl_l0_btb_stall)
    entry_hit_flop[15:0] <= entry_hit[15:0];
  else
    entry_hit_flop[15:0] <= entry_hit_flop[15:0];
end

// &Instance("gated_clk_cell", "x_l0_btb_pipe_clk"); @97
gated_clk_cell  x_l0_btb_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l0_btb_pipe_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (l0_btb_pipe_en    ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @98
//          .external_en (1'b0), @99
//          .global_en   (cp0_yy_clk_en), @100
//          .module_en   (cp0_ifu_icg_en), @101
//          .local_en    (l0_btb_pipe_en), @102
//          .clk_out     (l0_btb_pipe_clk) @103
//         ); @104

assign l0_btb_pipe_en  = cp0_ifu_btb_en && cp0_ifu_l0btb_en;

assign l0_btb_ras_pc[PC_WIDTH-2:0] = (ras_l0_btb_ras_push)
                                     ? ras_l0_btb_push_pc[PC_WIDTH-2:0]
                                     : (ipdp_l0_btb_ras_push)
                                       ? ipdp_l0_btb_ras_pc[PC_WIDTH-2:0]
                                       : ras_l0_btb_pc[PC_WIDTH-2:0];

always@(posedge l0_btb_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b) 
    ras_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(l0_btb_rd || l0_btb_rd_flop) 
    ras_pc[PC_WIDTH-2:0] <= l0_btb_ras_pc[PC_WIDTH-2:0];
  else 
    ras_pc[PC_WIDTH-2:0] <= ras_pc[PC_WIDTH-2:0];
end

//==========================================================
//                 Entry Hit Logic
//==========================================================
//Only when Counter == 1,L0 BTB can be hit
assign entry_hit_counter       = entry_hit_flop[0]  & entry0_cnt
                               | entry_hit_flop[1]  & entry1_cnt
                               | entry_hit_flop[2]  & entry2_cnt
                               | entry_hit_flop[3]  & entry3_cnt
                               | entry_hit_flop[4]  & entry4_cnt
                               | entry_hit_flop[5]  & entry5_cnt
                               | entry_hit_flop[6]  & entry6_cnt
                               | entry_hit_flop[7]  & entry7_cnt
                               | entry_hit_flop[8]  & entry8_cnt
                               | entry_hit_flop[9]  & entry9_cnt
                               | entry_hit_flop[10] & entry10_cnt
                               | entry_hit_flop[11] & entry11_cnt
                               | entry_hit_flop[12] & entry12_cnt
                               | entry_hit_flop[13] & entry13_cnt
                               | entry_hit_flop[14] & entry14_cnt
                               | entry_hit_flop[15] & entry15_cnt;

//Indicate whether entry record is ras
assign entry_hit_ras           = entry_hit_flop[0]  & entry0_ras
                               | entry_hit_flop[1]  & entry1_ras
                               | entry_hit_flop[2]  & entry2_ras
                               | entry_hit_flop[3]  & entry3_ras
                               | entry_hit_flop[4]  & entry4_ras
                               | entry_hit_flop[5]  & entry5_ras
                               | entry_hit_flop[6]  & entry6_ras
                               | entry_hit_flop[7]  & entry7_ras
                               | entry_hit_flop[8]  & entry8_ras
                               | entry_hit_flop[9]  & entry9_ras
                               | entry_hit_flop[10] & entry10_ras
                               | entry_hit_flop[11] & entry11_ras
                               | entry_hit_flop[12] & entry12_ras
                               | entry_hit_flop[13] & entry13_ras
                               | entry_hit_flop[14] & entry14_ras
                               | entry_hit_flop[15] & entry15_ras;

//Indicate entry record for way prediction
assign entry_hit_way_pred[1:0] = ({2{entry_hit_flop[0]}}  & entry0_way_pred[1:0])
                               | ({2{entry_hit_flop[1]}}  & entry1_way_pred[1:0])
                               | ({2{entry_hit_flop[2]}}  & entry2_way_pred[1:0])
                               | ({2{entry_hit_flop[3]}}  & entry3_way_pred[1:0])
                               | ({2{entry_hit_flop[4]}}  & entry4_way_pred[1:0])
                               | ({2{entry_hit_flop[5]}}  & entry5_way_pred[1:0])
                               | ({2{entry_hit_flop[6]}}  & entry6_way_pred[1:0])
                               | ({2{entry_hit_flop[7]}}  & entry7_way_pred[1:0])
                               | ({2{entry_hit_flop[8]}}  & entry8_way_pred[1:0])
                               | ({2{entry_hit_flop[9]}}  & entry9_way_pred[1:0])
                               | ({2{entry_hit_flop[10]}} & entry10_way_pred[1:0])
                               | ({2{entry_hit_flop[11]}} & entry11_way_pred[1:0])
                               | ({2{entry_hit_flop[12]}} & entry12_way_pred[1:0])
                               | ({2{entry_hit_flop[13]}} & entry13_way_pred[1:0])
                               | ({2{entry_hit_flop[14]}} & entry14_way_pred[1:0])
                               | ({2{entry_hit_flop[15]}} & entry15_way_pred[1:0]);


//L0 btb prediction target,it excludes ret result                               
assign entry_hit_pc[19:0]      = ({20{entry_hit_flop[0]}}  & entry0_target[19:0])
                               | ({20{entry_hit_flop[1]}}  & entry1_target[19:0]) 
                               | ({20{entry_hit_flop[2]}}  & entry2_target[19:0]) 
                               | ({20{entry_hit_flop[3]}}  & entry3_target[19:0]) 
                               | ({20{entry_hit_flop[4]}}  & entry4_target[19:0]) 
                               | ({20{entry_hit_flop[5]}}  & entry5_target[19:0]) 
                               | ({20{entry_hit_flop[6]}}  & entry6_target[19:0]) 
                               | ({20{entry_hit_flop[7]}}  & entry7_target[19:0]) 
                               | ({20{entry_hit_flop[8]}}  & entry8_target[19:0]) 
                               | ({20{entry_hit_flop[9]}}  & entry9_target[19:0]) 
                               | ({20{entry_hit_flop[10]}} & entry10_target[19:0]) 
                               | ({20{entry_hit_flop[11]}} & entry11_target[19:0]) 
                               | ({20{entry_hit_flop[12]}} & entry12_target[19:0]) 
                               | ({20{entry_hit_flop[13]}} & entry13_target[19:0]) 
                               | ({20{entry_hit_flop[14]}} & entry14_target[19:0]) 
                               | ({20{entry_hit_flop[15]}} & entry15_target[19:0]); 


assign entry_if_hit           = |entry_hit_flop[15:0];
assign entry_chgflw_vld       = entry_if_hit && entry_hit_counter;
assign entry_hit_target[PC_WIDTH-2:0] = (entry_hit_ras)
                                        ? ras_pc[PC_WIDTH-2:0]
                                        : {pcgen_l0_btb_if_pc[PC_WIDTH-2:20],entry_hit_pc[19:0]};

//==========================================================
//                 L0 BTB Write State
//==========================================================
// &Instance("gated_clk_cell","x_l0_btb_clk"); @210
gated_clk_cell  x_l0_btb_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l0_btb_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (l0_btb_clk_en     ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @211
//           .clk_out        (l0_btb_clk),//Out Clock @212
//           .external_en    (1'b0), @213
//           .global_en      (cp0_yy_clk_en), @214
//           .local_en       (l0_btb_clk_en),//Local Condition @215
//           .module_en      (cp0_ifu_icg_en) @216
//         ); @217

assign l0_btb_clk_en = cp0_ifu_btb_en && cp0_ifu_l0btb_en;

always@(posedge l0_btb_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l0_btb_cur_state[1:0] <= IDLE;
  else
    l0_btb_cur_state[1:0] <= l0_btb_next_state[1:0];
end

// &CombBeg; @229
always @( l0_btb_cur_state[1:0]
       or pcgen_l0_btb_chgflw_vld
       or pcgen_l0_btb_chgflw_mask
       or ipctrl_l0_btb_wait_next
       or ipctrl_l0_btb_ip_vld
       or ipctrl_l0_btb_chgflw_vld)
begin
case(l0_btb_cur_state[1:0])
  IDLE     : if(pcgen_l0_btb_chgflw_vld)
               l0_btb_next_state[1:0] = WAIT;
             else
               l0_btb_next_state[1:0] = IDLE;
  WAIT     : if(pcgen_l0_btb_chgflw_mask)
               l0_btb_next_state[1:0] = IDLE;
             else if(ipctrl_l0_btb_chgflw_vld)
               l0_btb_next_state[1:0] = WAIT;
             else if(ipctrl_l0_btb_wait_next)
               l0_btb_next_state[1:0] = WAIT;
             else if(!ipctrl_l0_btb_ip_vld)
               l0_btb_next_state[1:0] = WAIT;
             else
               l0_btb_next_state[1:0] = IDLE;
  default  :   l0_btb_next_state[1:0] = IDLE;
endcase
// &CombEnd; @247
end

assign l0_btb_ipctrl_st_wait = (l0_btb_cur_state[1:0] == WAIT);

//==========================================================
//                 L0 BTB FIFO bit
//==========================================================
// &Instance("gated_clk_cell", "x_l0_btb_create_clk"); @254
gated_clk_cell  x_l0_btb_create_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l0_btb_create_clk ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (l0_btb_create_en  ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @255
//          .external_en (1'b0), @256
//          .global_en   (cp0_yy_clk_en), @257
//          .module_en   (cp0_ifu_icg_en), @258
//          .local_en    (l0_btb_create_en), @259
//          .clk_out     (l0_btb_create_clk) @260
//         ); @261

assign l0_btb_create_en = ibdp_l0_btb_fifo_update_vld 
                       && cp0_ifu_btb_en
                       && cp0_ifu_l0btb_en;
always @(posedge l0_btb_create_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry_fifo[15:0] <= 16'b1;
  else if(l0_btb_create_en)
    entry_fifo[15:0] <= {entry_fifo[14:0],entry_fifo[15]};
  else
    entry_fifo[15:0] <= entry_fifo[15:0];
end

assign l0_btb_ibdp_entry_fifo[15:0] = entry_fifo[15:0]; 

//==========================================================
//                 L0 BTB Write Preparation
//==========================================================
assign l0_btb_update_entry[15:0] = 
   {16{addrgen_l0_btb_update_vld}}          & addrgen_l0_btb_update_entry[15:0]
 | {16{l0_btb_update_vld_for_gateclk}}      & ibdp_l0_btb_update_entry[15:0];


// &CombBeg; @286
always @( ibdp_l0_btb_update_ras_bit
       or ibdp_l0_btb_update_vld
       or ibdp_l0_btb_update_vld_bit
       or ibdp_l0_btb_update_cnt_bit
       or addrgen_l0_btb_update_vld
       or ibdp_l0_btb_wen[3:0]
       or addrgen_l0_btb_wen[3:0]
       or addrgen_l0_btb_update_vld_bit
       or ibdp_l0_btb_update_data[36:0])
begin
casez({addrgen_l0_btb_update_vld,
      ibdp_l0_btb_update_vld})
2'b1? : begin
         l0_btb_wen[3:0]           = addrgen_l0_btb_wen[3:0];
         l0_btb_update_vld_bit     = addrgen_l0_btb_update_vld_bit;
         l0_btb_update_cnt_bit     = 1'b0;
         l0_btb_update_ras_bit     = 1'b0;
         l0_btb_update_data[36:0]  = 37'b0;
         end
2'b01 : begin
         l0_btb_wen[3:0]           = ibdp_l0_btb_wen[3:0];
         l0_btb_update_vld_bit     = ibdp_l0_btb_update_vld_bit;
         l0_btb_update_cnt_bit     = ibdp_l0_btb_update_cnt_bit;
         l0_btb_update_ras_bit     = ibdp_l0_btb_update_ras_bit;
         l0_btb_update_data[36:0]  = ibdp_l0_btb_update_data[36:0];
         end
default: begin
         l0_btb_wen[3:0]           = 4'b0;
         l0_btb_update_vld_bit     = 1'b0;
         l0_btb_update_cnt_bit     = 1'b0;
         l0_btb_update_ras_bit     = 1'b0;
         l0_btb_update_data[36:0]  = 37'b0;
         end
endcase
// &CombEnd; @311
end

//==========================================================
//             Invalidating Status Register
//==========================================================
//Gate Clk
// &Instance("gated_clk_cell","x_l0_btb_inv_reg_upd_clk"); @317
gated_clk_cell  x_l0_btb_inv_reg_upd_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (l0_btb_inv_reg_upd_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (l0_btb_inv_reg_upd_clk_en),
  .module_en                 (cp0_ifu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect( .clk_in         (forever_cpuclk), @318
//           .external_en    (1'b0), @319
//           .global_en      (cp0_yy_clk_en), @320
//           .local_en       (l0_btb_inv_reg_upd_clk_en),//Local Condition @321
//           .clk_out        (l0_btb_inv_reg_upd_clk),//Out Clock @322
//           .module_en      (cp0_ifu_icg_en) @323
//         ); @324
assign l0_btb_inv_reg_upd_clk_en = l0_btb_entry_inv || 
                                   ifctrl_l0_btb_inv;

always @(posedge l0_btb_inv_reg_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l0_btb_entry_inv <= 1'b0;
  else if(l0_btb_entry_inv)
    l0_btb_entry_inv <= 1'b0;
  else if(ifctrl_l0_btb_inv)
    l0_btb_entry_inv <= 1'b1;
  else
    l0_btb_entry_inv <= l0_btb_entry_inv;
end

//==========================================================
//                 Instance 16 Entry
//==========================================================
// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_0"); @343
ct_ifu_l0_btb_entry  x_l0_btb_entry_0 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry0_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry0_ras              ),
  .entry_tag                (entry0_tag[14:0]        ),
  .entry_target             (entry0_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[0]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry0_vld              ),
  .entry_way_pred           (entry0_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry0_vld), @344
//          .entry_tag           (entry0_tag[14:0]), @345
//          .entry_cnt           (entry0_cnt), @346
//          .entry_ras           (entry0_ras), @347
//          .entry_way           (entry0_way), @348
//          .entry_way_pred      (entry0_way_pred[1:0]), @349
//          .entry_target        (entry0_target[19:0]), @350
//          .entry_wen           (l0_btb_wen[3:0]), @351
//          .entry_update        (l0_btb_update_entry[0]), @352
//          .entry_update_data   (l0_btb_update_data[36:0]), @353
//          .entry_update_vld    (l0_btb_update_vld_bit), @354
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @355
//          .entry_update_ras    (l0_btb_update_ras_bit), @356
//          .entry_inv           (l0_btb_entry_inv) @357
// ); @358

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_1"); @360
ct_ifu_l0_btb_entry  x_l0_btb_entry_1 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry1_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry1_ras              ),
  .entry_tag                (entry1_tag[14:0]        ),
  .entry_target             (entry1_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[1]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry1_vld              ),
  .entry_way_pred           (entry1_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry1_vld), @361
//          .entry_tag           (entry1_tag[14:0]), @362
//          .entry_cnt           (entry1_cnt), @363
//          .entry_ras           (entry1_ras), @364
//          .entry_way           (entry1_way), @365
//          .entry_way_pred      (entry1_way_pred[1:0]), @366
//          .entry_target        (entry1_target[19:0]), @367
//          .entry_wen           (l0_btb_wen[3:0]), @368
//          .entry_update        (l0_btb_update_entry[1]), @369
//          .entry_update_data   (l0_btb_update_data[36:0]), @370
//          .entry_update_vld    (l0_btb_update_vld_bit), @371
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @372
//          .entry_update_ras    (l0_btb_update_ras_bit), @373
//          .entry_inv           (l0_btb_entry_inv) @374
// ); @375

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_2"); @377
ct_ifu_l0_btb_entry  x_l0_btb_entry_2 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry2_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry2_ras              ),
  .entry_tag                (entry2_tag[14:0]        ),
  .entry_target             (entry2_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[2]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry2_vld              ),
  .entry_way_pred           (entry2_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry2_vld), @378
//          .entry_tag           (entry2_tag[14:0]), @379
//          .entry_cnt           (entry2_cnt), @380
//          .entry_ras           (entry2_ras), @381
//          .entry_way           (entry2_way), @382
//          .entry_way_pred      (entry2_way_pred[1:0]), @383
//          .entry_target        (entry2_target[19:0]), @384
//          .entry_wen           (l0_btb_wen[3:0]), @385
//          .entry_update        (l0_btb_update_entry[2]), @386
//          .entry_update_data   (l0_btb_update_data[36:0]), @387
//          .entry_update_vld    (l0_btb_update_vld_bit), @388
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @389
//          .entry_update_ras    (l0_btb_update_ras_bit), @390
//          .entry_inv           (l0_btb_entry_inv) @391
// ); @392

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_3"); @394
ct_ifu_l0_btb_entry  x_l0_btb_entry_3 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry3_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry3_ras              ),
  .entry_tag                (entry3_tag[14:0]        ),
  .entry_target             (entry3_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[3]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry3_vld              ),
  .entry_way_pred           (entry3_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry3_vld), @395
//          .entry_tag           (entry3_tag[14:0]), @396
//          .entry_cnt           (entry3_cnt), @397
//          .entry_ras           (entry3_ras), @398
//          .entry_way           (entry3_way), @399
//          .entry_way_pred      (entry3_way_pred[1:0]), @400
//          .entry_wen           (l0_btb_wen[3:0]), @401
//          .entry_target        (entry3_target[19:0]), @402
//          .entry_update        (l0_btb_update_entry[3]), @403
//          .entry_update_data   (l0_btb_update_data[36:0]), @404
//          .entry_update_vld    (l0_btb_update_vld_bit), @405
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @406
//          .entry_update_ras    (l0_btb_update_ras_bit), @407
//          .entry_inv           (l0_btb_entry_inv) @408
// ); @409

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_4"); @411
ct_ifu_l0_btb_entry  x_l0_btb_entry_4 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry4_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry4_ras              ),
  .entry_tag                (entry4_tag[14:0]        ),
  .entry_target             (entry4_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[4]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry4_vld              ),
  .entry_way_pred           (entry4_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry4_vld), @412
//          .entry_tag           (entry4_tag[14:0]), @413
//          .entry_cnt           (entry4_cnt), @414
//          .entry_ras           (entry4_ras), @415
//          .entry_way           (entry4_way), @416
//          .entry_way_pred      (entry4_way_pred[1:0]), @417
//          .entry_target        (entry4_target[19:0]), @418
//          .entry_wen           (l0_btb_wen[3:0]), @419
//          .entry_update        (l0_btb_update_entry[4]), @420
//          .entry_update_data   (l0_btb_update_data[36:0]), @421
//          .entry_update_vld    (l0_btb_update_vld_bit), @422
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @423
//          .entry_update_ras    (l0_btb_update_ras_bit), @424
//          .entry_inv           (l0_btb_entry_inv) @425
// ); @426

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_5"); @428
ct_ifu_l0_btb_entry  x_l0_btb_entry_5 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry5_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry5_ras              ),
  .entry_tag                (entry5_tag[14:0]        ),
  .entry_target             (entry5_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[5]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry5_vld              ),
  .entry_way_pred           (entry5_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry5_vld), @429
//          .entry_tag           (entry5_tag[14:0]), @430
//          .entry_cnt           (entry5_cnt), @431
//          .entry_ras           (entry5_ras), @432
//          .entry_way           (entry5_way), @433
//          .entry_way_pred      (entry5_way_pred[1:0]), @434
//          .entry_target        (entry5_target[19:0]), @435
//          .entry_wen           (l0_btb_wen[3:0]), @436
//          .entry_update        (l0_btb_update_entry[5]), @437
//          .entry_update_data   (l0_btb_update_data[36:0]), @438
//          .entry_update_vld    (l0_btb_update_vld_bit), @439
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @440
//          .entry_update_ras    (l0_btb_update_ras_bit), @441
//          .entry_inv           (l0_btb_entry_inv) @442
// ); @443

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_6"); @445
ct_ifu_l0_btb_entry  x_l0_btb_entry_6 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry6_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry6_ras              ),
  .entry_tag                (entry6_tag[14:0]        ),
  .entry_target             (entry6_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[6]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry6_vld              ),
  .entry_way_pred           (entry6_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry6_vld), @446
//          .entry_tag           (entry6_tag[14:0]), @447
//          .entry_cnt           (entry6_cnt), @448
//          .entry_ras           (entry6_ras), @449
//          .entry_way           (entry6_way), @450
//          .entry_way_pred      (entry6_way_pred[1:0]), @451
//          .entry_target        (entry6_target[19:0]), @452
//          .entry_wen           (l0_btb_wen[3:0]), @453
//          .entry_update        (l0_btb_update_entry[6]), @454
//          .entry_update_data   (l0_btb_update_data[36:0]), @455
//          .entry_update_vld    (l0_btb_update_vld_bit), @456
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @457
//          .entry_update_ras    (l0_btb_update_ras_bit), @458
//          .entry_inv           (l0_btb_entry_inv) @459
// ); @460

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_7"); @462
ct_ifu_l0_btb_entry  x_l0_btb_entry_7 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry7_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry7_ras              ),
  .entry_tag                (entry7_tag[14:0]        ),
  .entry_target             (entry7_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[7]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry7_vld              ),
  .entry_way_pred           (entry7_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry7_vld), @463
//          .entry_tag           (entry7_tag[14:0]), @464
//          .entry_cnt           (entry7_cnt), @465
//          .entry_ras           (entry7_ras), @466
//          .entry_way           (entry7_way), @467
//          .entry_way_pred      (entry7_way_pred[1:0]), @468
//          .entry_target        (entry7_target[19:0]), @469
//          .entry_wen           (l0_btb_wen[3:0]), @470
//          .entry_update        (l0_btb_update_entry[7]), @471
//          .entry_update_data   (l0_btb_update_data[36:0]), @472
//          .entry_update_vld    (l0_btb_update_vld_bit), @473
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @474
//          .entry_update_ras    (l0_btb_update_ras_bit), @475
//          .entry_inv           (l0_btb_entry_inv) @476
// ); @477

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_8"); @479
ct_ifu_l0_btb_entry  x_l0_btb_entry_8 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry8_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry8_ras              ),
  .entry_tag                (entry8_tag[14:0]        ),
  .entry_target             (entry8_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[8]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry8_vld              ),
  .entry_way_pred           (entry8_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry8_vld), @480
//          .entry_tag           (entry8_tag[14:0]), @481
//          .entry_cnt           (entry8_cnt), @482
//          .entry_ras           (entry8_ras), @483
//          .entry_way           (entry8_way), @484
//          .entry_way_pred      (entry8_way_pred[1:0]), @485
//          .entry_target        (entry8_target[19:0]), @486
//          .entry_wen           (l0_btb_wen[3:0]), @487
//          .entry_update        (l0_btb_update_entry[8]), @488
//          .entry_update_data   (l0_btb_update_data[36:0]), @489
//          .entry_update_vld    (l0_btb_update_vld_bit), @490
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @491
//          .entry_update_ras    (l0_btb_update_ras_bit), @492
//          .entry_inv           (l0_btb_entry_inv) @493
// ); @494

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_9"); @496
ct_ifu_l0_btb_entry  x_l0_btb_entry_9 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry9_cnt              ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry9_ras              ),
  .entry_tag                (entry9_tag[14:0]        ),
  .entry_target             (entry9_target[19:0]     ),
  .entry_update             (l0_btb_update_entry[9]  ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry9_vld              ),
  .entry_way_pred           (entry9_way_pred[1:0]    ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry9_vld), @497
//          .entry_tag           (entry9_tag[14:0]), @498
//          .entry_cnt           (entry9_cnt), @499
//          .entry_ras           (entry9_ras), @500
//          .entry_way           (entry9_way), @501
//          .entry_way_pred      (entry9_way_pred[1:0]), @502
//          .entry_target        (entry9_target[19:0]), @503
//          .entry_wen           (l0_btb_wen[3:0]), @504
//          .entry_update        (l0_btb_update_entry[9]), @505
//          .entry_update_data   (l0_btb_update_data[36:0]), @506
//          .entry_update_vld    (l0_btb_update_vld_bit), @507
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @508
//          .entry_update_ras    (l0_btb_update_ras_bit), @509
//          .entry_inv           (l0_btb_entry_inv) @510
// ); @511

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_10"); @513
ct_ifu_l0_btb_entry  x_l0_btb_entry_10 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry10_cnt             ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry10_ras             ),
  .entry_tag                (entry10_tag[14:0]       ),
  .entry_target             (entry10_target[19:0]    ),
  .entry_update             (l0_btb_update_entry[10] ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry10_vld             ),
  .entry_way_pred           (entry10_way_pred[1:0]   ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry10_vld), @514
//          .entry_tag           (entry10_tag[14:0]), @515
//          .entry_cnt           (entry10_cnt), @516
//          .entry_ras           (entry10_ras), @517
//          .entry_way           (entry10_way), @518
//          .entry_way_pred      (entry10_way_pred[1:0]), @519
//          .entry_target        (entry10_target[19:0]), @520
//          .entry_wen           (l0_btb_wen[3:0]), @521
//          .entry_update        (l0_btb_update_entry[10]), @522
//          .entry_update_data   (l0_btb_update_data[36:0]), @523
//          .entry_update_vld    (l0_btb_update_vld_bit), @524
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @525
//          .entry_update_ras    (l0_btb_update_ras_bit), @526
//          .entry_inv           (l0_btb_entry_inv) @527
// ); @528

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_11"); @530
ct_ifu_l0_btb_entry  x_l0_btb_entry_11 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry11_cnt             ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry11_ras             ),
  .entry_tag                (entry11_tag[14:0]       ),
  .entry_target             (entry11_target[19:0]    ),
  .entry_update             (l0_btb_update_entry[11] ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry11_vld             ),
  .entry_way_pred           (entry11_way_pred[1:0]   ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry11_vld), @531
//          .entry_tag           (entry11_tag[14:0]), @532
//          .entry_cnt           (entry11_cnt), @533
//          .entry_ras           (entry11_ras), @534
//          .entry_way           (entry11_way), @535
//          .entry_way_pred      (entry11_way_pred[1:0]), @536
//          .entry_target        (entry11_target[19:0]), @537
//          .entry_wen           (l0_btb_wen[3:0]), @538
//          .entry_update        (l0_btb_update_entry[11]), @539
//          .entry_update_data   (l0_btb_update_data[36:0]), @540
//          .entry_update_vld    (l0_btb_update_vld_bit), @541
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @542
//          .entry_update_ras    (l0_btb_update_ras_bit), @543
//          .entry_inv           (l0_btb_entry_inv) @544
// ); @545

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_12"); @547
ct_ifu_l0_btb_entry  x_l0_btb_entry_12 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry12_cnt             ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry12_ras             ),
  .entry_tag                (entry12_tag[14:0]       ),
  .entry_target             (entry12_target[19:0]    ),
  .entry_update             (l0_btb_update_entry[12] ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry12_vld             ),
  .entry_way_pred           (entry12_way_pred[1:0]   ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry12_vld), @548
//          .entry_tag           (entry12_tag[14:0]), @549
//          .entry_cnt           (entry12_cnt), @550
//          .entry_ras           (entry12_ras), @551
//          .entry_way           (entry12_way), @552
//          .entry_way_pred      (entry12_way_pred[1:0]), @553
//          .entry_target        (entry12_target[19:0]), @554
//          .entry_wen           (l0_btb_wen[3:0]), @555
//          .entry_update        (l0_btb_update_entry[12]), @556
//          .entry_update_data   (l0_btb_update_data[36:0]), @557
//          .entry_update_vld    (l0_btb_update_vld_bit), @558
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @559
//          .entry_update_ras    (l0_btb_update_ras_bit), @560
//          .entry_inv           (l0_btb_entry_inv) @561
// ); @562

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_13"); @564
ct_ifu_l0_btb_entry  x_l0_btb_entry_13 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry13_cnt             ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry13_ras             ),
  .entry_tag                (entry13_tag[14:0]       ),
  .entry_target             (entry13_target[19:0]    ),
  .entry_update             (l0_btb_update_entry[13] ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry13_vld             ),
  .entry_way_pred           (entry13_way_pred[1:0]   ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry13_vld), @565
//          .entry_tag           (entry13_tag[14:0]), @566
//          .entry_cnt           (entry13_cnt), @567
//          .entry_ras           (entry13_ras), @568
//          .entry_way           (entry13_way), @569
//          .entry_way_pred      (entry13_way_pred[1:0]), @570
//          .entry_target        (entry13_target[19:0]), @571
//          .entry_wen           (l0_btb_wen[3:0]), @572
//          .entry_update        (l0_btb_update_entry[13]), @573
//          .entry_update_data   (l0_btb_update_data[36:0]), @574
//          .entry_update_vld    (l0_btb_update_vld_bit), @575
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @576
//          .entry_update_ras    (l0_btb_update_ras_bit), @577
//          .entry_inv           (l0_btb_entry_inv) @578
// ); @579

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_14"); @581
ct_ifu_l0_btb_entry  x_l0_btb_entry_14 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry14_cnt             ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry14_ras             ),
  .entry_tag                (entry14_tag[14:0]       ),
  .entry_target             (entry14_target[19:0]    ),
  .entry_update             (l0_btb_update_entry[14] ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry14_vld             ),
  .entry_way_pred           (entry14_way_pred[1:0]   ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry14_vld), @582
//          .entry_tag           (entry14_tag[14:0]), @583
//          .entry_cnt           (entry14_cnt), @584
//          .entry_ras           (entry14_ras), @585
//          .entry_way           (entry14_way), @586
//          .entry_way_pred      (entry14_way_pred[1:0]), @587
//          .entry_target        (entry14_target[19:0]), @588
//          .entry_wen           (l0_btb_wen[3:0]), @589
//          .entry_update        (l0_btb_update_entry[14]), @590
//          .entry_update_data   (l0_btb_update_data[36:0]), @591
//          .entry_update_vld    (l0_btb_update_vld_bit), @592
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @593
//          .entry_update_ras    (l0_btb_update_ras_bit), @594
//          .entry_inv           (l0_btb_entry_inv) @595
// ); @596

// &Instance("ct_ifu_l0_btb_entry","x_l0_btb_entry_15"); @598
ct_ifu_l0_btb_entry  x_l0_btb_entry_15 (
  .cp0_ifu_btb_en           (cp0_ifu_btb_en          ),
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_ifu_l0btb_en         (cp0_ifu_l0btb_en        ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .entry_cnt                (entry15_cnt             ),
  .entry_inv                (l0_btb_entry_inv        ),
  .entry_ras                (entry15_ras             ),
  .entry_tag                (entry15_tag[14:0]       ),
  .entry_target             (entry15_target[19:0]    ),
  .entry_update             (l0_btb_update_entry[15] ),
  .entry_update_cnt         (l0_btb_update_cnt_bit   ),
  .entry_update_data        (l0_btb_update_data[36:0]),
  .entry_update_ras         (l0_btb_update_ras_bit   ),
  .entry_update_vld         (l0_btb_update_vld_bit   ),
  .entry_vld                (entry15_vld             ),
  .entry_way_pred           (entry15_way_pred[1:0]   ),
  .entry_wen                (l0_btb_wen[3:0]         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.entry_vld           (entry15_vld), @599
//          .entry_tag           (entry15_tag[14:0]), @600
//          .entry_cnt           (entry15_cnt), @601
//          .entry_ras           (entry15_ras), @602
//          .entry_way           (entry15_way), @603
//          .entry_way_pred      (entry15_way_pred[1:0]), @604
//          .entry_target        (entry15_target[19:0]), @605
//          .entry_wen           (l0_btb_wen[3:0]), @606
//          .entry_update        (l0_btb_update_entry[15]), @607
//          .entry_update_data   (l0_btb_update_data[36:0]), @608
//          .entry_update_vld    (l0_btb_update_vld_bit), @609
//          .entry_update_cnt    (l0_btb_update_cnt_bit), @610
//          .entry_update_ras    (l0_btb_update_ras_bit), @611
//          .entry_inv           (l0_btb_entry_inv) @612
// ); @613

//==========================================================
//                  Interface with IF
//==========================================================
//output to ifctrl                               
assign l0_btb_ifctrl_chglfw_vld              = entry_chgflw_vld;
assign l0_btb_ifctrl_chgflw_pc[PC_WIDTH-2:0] = entry_hit_target[PC_WIDTH-2:0];
assign l0_btb_ifctrl_chgflw_way_pred[1:0]    = entry_hit_way_pred[1:0];

//output to ifdp
assign l0_btb_ifdp_chgflw_pc[PC_WIDTH-2:0] = entry_hit_target[PC_WIDTH-2:0];
assign l0_btb_ifdp_chgflw_way_pred[1:0]    = entry_hit_way_pred[1:0];
assign l0_btb_ifdp_entry_hit[15:0]         = entry_hit_flop[15:0];
assign l0_btb_ifdp_hit                     = entry_if_hit;
assign l0_btb_ifdp_counter                 = entry_hit_counter;
assign l0_btb_ifdp_ras                     = entry_hit_ras;

//Debug infor
assign l0_btb_debug_cur_state[1:0] = l0_btb_cur_state[1:0];
// &ModuleEnd;   @637
endmodule






