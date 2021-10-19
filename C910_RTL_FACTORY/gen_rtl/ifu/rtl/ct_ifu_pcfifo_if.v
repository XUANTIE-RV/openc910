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
module ct_ifu_pcfifo_if(
  ibctrl_pcfifo_if_create_vld,
  ibctrl_pcfifo_if_ind_btb_miss,
  ibctrl_pcfifo_if_ind_target_pc,
  ibctrl_pcfifo_if_ras_target_pc,
  ibctrl_pcfifo_if_ras_vld,
  ibdp_pcfifo_if_bht_pre_result,
  ibdp_pcfifo_if_bht_sel_result,
  ibdp_pcfifo_if_h0_cur_pc,
  ibdp_pcfifo_if_h0_vld,
  ibdp_pcfifo_if_h1_cur_pc,
  ibdp_pcfifo_if_h2_cur_pc,
  ibdp_pcfifo_if_h3_cur_pc,
  ibdp_pcfifo_if_h4_cur_pc,
  ibdp_pcfifo_if_h5_cur_pc,
  ibdp_pcfifo_if_h6_cur_pc,
  ibdp_pcfifo_if_h7_cur_pc,
  ibdp_pcfifo_if_h8_cur_pc,
  ibdp_pcfifo_if_hn_con_br,
  ibdp_pcfifo_if_hn_dst_vld,
  ibdp_pcfifo_if_hn_jal,
  ibdp_pcfifo_if_hn_jalr,
  ibdp_pcfifo_if_hn_pc_oper,
  ibdp_pcfifo_if_ind_br_offset,
  ibdp_pcfifo_if_vghr,
  ifu_iu_pcfifo_create0_bht_pred,
  ifu_iu_pcfifo_create0_chk_idx,
  ifu_iu_pcfifo_create0_cur_pc,
  ifu_iu_pcfifo_create0_dst_vld,
  ifu_iu_pcfifo_create0_en,
  ifu_iu_pcfifo_create0_gateclk_en,
  ifu_iu_pcfifo_create0_jal,
  ifu_iu_pcfifo_create0_jalr,
  ifu_iu_pcfifo_create0_jmp_mispred,
  ifu_iu_pcfifo_create0_tar_pc,
  ifu_iu_pcfifo_create1_bht_pred,
  ifu_iu_pcfifo_create1_chk_idx,
  ifu_iu_pcfifo_create1_cur_pc,
  ifu_iu_pcfifo_create1_dst_vld,
  ifu_iu_pcfifo_create1_en,
  ifu_iu_pcfifo_create1_gateclk_en,
  ifu_iu_pcfifo_create1_jal,
  ifu_iu_pcfifo_create1_jalr,
  ifu_iu_pcfifo_create1_jmp_mispred,
  ifu_iu_pcfifo_create1_tar_pc,
  lbuf_pcfifo_if_create_select,
  lbuf_pcfifo_if_inst_bht_pre_result,
  lbuf_pcfifo_if_inst_bht_sel_result,
  lbuf_pcfifo_if_inst_cur_pc,
  lbuf_pcfifo_if_inst_pc_oper,
  lbuf_pcfifo_if_inst_target_pc,
  lbuf_pcfifo_if_inst_vghr,
  pcfifo_if_ibctrl_more_than_two,
  pcfifo_if_ibdp_over_mask
);

// &Ports; @23
input           ibctrl_pcfifo_if_create_vld;       
input           ibctrl_pcfifo_if_ind_btb_miss;     
input   [38:0]  ibctrl_pcfifo_if_ind_target_pc;    
input   [38:0]  ibctrl_pcfifo_if_ras_target_pc;    
input           ibctrl_pcfifo_if_ras_vld;          
input   [1 :0]  ibdp_pcfifo_if_bht_pre_result;     
input   [1 :0]  ibdp_pcfifo_if_bht_sel_result;     
input   [38:0]  ibdp_pcfifo_if_h0_cur_pc;          
input           ibdp_pcfifo_if_h0_vld;             
input   [38:0]  ibdp_pcfifo_if_h1_cur_pc;          
input   [38:0]  ibdp_pcfifo_if_h2_cur_pc;          
input   [38:0]  ibdp_pcfifo_if_h3_cur_pc;          
input   [38:0]  ibdp_pcfifo_if_h4_cur_pc;          
input   [38:0]  ibdp_pcfifo_if_h5_cur_pc;          
input   [38:0]  ibdp_pcfifo_if_h6_cur_pc;          
input   [38:0]  ibdp_pcfifo_if_h7_cur_pc;          
input   [38:0]  ibdp_pcfifo_if_h8_cur_pc;          
input   [7 :0]  ibdp_pcfifo_if_hn_con_br;          
input   [7 :0]  ibdp_pcfifo_if_hn_dst_vld;         
input   [7 :0]  ibdp_pcfifo_if_hn_jal;             
input   [7 :0]  ibdp_pcfifo_if_hn_jalr;            
input   [7 :0]  ibdp_pcfifo_if_hn_pc_oper;         
input   [20:0]  ibdp_pcfifo_if_ind_br_offset;      
input   [21:0]  ibdp_pcfifo_if_vghr;               
input           lbuf_pcfifo_if_create_select;      
input   [1 :0]  lbuf_pcfifo_if_inst_bht_pre_result; 
input   [1 :0]  lbuf_pcfifo_if_inst_bht_sel_result; 
input   [38:0]  lbuf_pcfifo_if_inst_cur_pc;        
input           lbuf_pcfifo_if_inst_pc_oper;       
input   [38:0]  lbuf_pcfifo_if_inst_target_pc;     
input   [21:0]  lbuf_pcfifo_if_inst_vghr;          
output          ifu_iu_pcfifo_create0_bht_pred;    
output  [24:0]  ifu_iu_pcfifo_create0_chk_idx;     
output  [39:0]  ifu_iu_pcfifo_create0_cur_pc;      
output          ifu_iu_pcfifo_create0_dst_vld;     
output          ifu_iu_pcfifo_create0_en;          
output          ifu_iu_pcfifo_create0_gateclk_en;  
output          ifu_iu_pcfifo_create0_jal;         
output          ifu_iu_pcfifo_create0_jalr;        
output          ifu_iu_pcfifo_create0_jmp_mispred; 
output  [39:0]  ifu_iu_pcfifo_create0_tar_pc;      
output          ifu_iu_pcfifo_create1_bht_pred;    
output  [24:0]  ifu_iu_pcfifo_create1_chk_idx;     
output  [39:0]  ifu_iu_pcfifo_create1_cur_pc;      
output          ifu_iu_pcfifo_create1_dst_vld;     
output          ifu_iu_pcfifo_create1_en;          
output          ifu_iu_pcfifo_create1_gateclk_en;  
output          ifu_iu_pcfifo_create1_jal;         
output          ifu_iu_pcfifo_create1_jalr;        
output          ifu_iu_pcfifo_create1_jmp_mispred; 
output  [39:0]  ifu_iu_pcfifo_create1_tar_pc;      
output          pcfifo_if_ibctrl_more_than_two;    
output  [7 :0]  pcfifo_if_ibdp_over_mask;          

// &Regs; @24
reg     [7 :0]  hn_pc_mask_head;                   
reg     [7 :0]  hn_pc_mask_tail;                   
reg             inst0_con_br;                      
reg     [38:0]  inst0_cur_pc;                      
reg             inst0_dst_vld;                     
reg             inst0_jal;                         
reg             inst0_jalr;                        
reg             inst0_vld;                         
reg     [38:0]  inst1_cur_pc;                      
reg             inst1_dst_vld;                     
reg             inst1_jal;                         
reg             inst1_jalr;                        
reg             inst1_vld;                         
reg     [7 :0]  over_mask;                         

// &Wires; @25
wire            h1_con_br;                         
wire    [38:0]  h1_cur_pc;                         
wire            h1_dst_vld;                        
wire            h1_jal;                            
wire            h1_jalr;                           
wire            h2_con_br;                         
wire    [38:0]  h2_cur_pc;                         
wire            h2_dst_vld;                        
wire            h2_jal;                            
wire            h2_jalr;                           
wire            h3_con_br;                         
wire    [38:0]  h3_cur_pc;                         
wire            h3_dst_vld;                        
wire            h3_jal;                            
wire            h3_jalr;                           
wire            h4_con_br;                         
wire    [38:0]  h4_cur_pc;                         
wire            h4_dst_vld;                        
wire            h4_jal;                            
wire            h4_jalr;                           
wire            h5_con_br;                         
wire    [38:0]  h5_cur_pc;                         
wire            h5_dst_vld;                        
wire            h5_jal;                            
wire            h5_jalr;                           
wire            h6_con_br;                         
wire    [38:0]  h6_cur_pc;                         
wire            h6_dst_vld;                        
wire            h6_jal;                            
wire            h6_jalr;                           
wire            h7_con_br;                         
wire    [38:0]  h7_cur_pc;                         
wire            h7_dst_vld;                        
wire            h7_jal;                            
wire            h7_jalr;                           
wire            h8_con_br;                         
wire    [38:0]  h8_cur_pc;                         
wire            h8_dst_vld;                        
wire            h8_jal;                            
wire            h8_jalr;                           
wire    [7 :0]  hn_pc_oper;                        
wire    [39:0]  hn_target_pc;                      
wire            ibctrl_pcfifo_if_create_vld;       
wire            ibctrl_pcfifo_if_ind_btb_miss;     
wire    [38:0]  ibctrl_pcfifo_if_ind_target_pc;    
wire    [38:0]  ibctrl_pcfifo_if_ras_target_pc;    
wire            ibctrl_pcfifo_if_ras_vld;          
wire    [1 :0]  ibdp_pcfifo_if_bht_pre_result;     
wire    [1 :0]  ibdp_pcfifo_if_bht_sel_result;     
wire    [38:0]  ibdp_pcfifo_if_h0_cur_pc;          
wire            ibdp_pcfifo_if_h0_vld;             
wire    [38:0]  ibdp_pcfifo_if_h1_cur_pc;          
wire    [38:0]  ibdp_pcfifo_if_h2_cur_pc;          
wire    [38:0]  ibdp_pcfifo_if_h3_cur_pc;          
wire    [38:0]  ibdp_pcfifo_if_h4_cur_pc;          
wire    [38:0]  ibdp_pcfifo_if_h5_cur_pc;          
wire    [38:0]  ibdp_pcfifo_if_h6_cur_pc;          
wire    [38:0]  ibdp_pcfifo_if_h7_cur_pc;          
wire    [38:0]  ibdp_pcfifo_if_h8_cur_pc;          
wire    [7 :0]  ibdp_pcfifo_if_hn_con_br;          
wire    [7 :0]  ibdp_pcfifo_if_hn_dst_vld;         
wire    [7 :0]  ibdp_pcfifo_if_hn_jal;             
wire    [7 :0]  ibdp_pcfifo_if_hn_jalr;            
wire    [7 :0]  ibdp_pcfifo_if_hn_pc_oper;         
wire    [20:0]  ibdp_pcfifo_if_ind_br_offset;      
wire    [21:0]  ibdp_pcfifo_if_vghr;               
wire            ibstage_create_vld;                
wire            ifu_iu_pcfifo_create0_bht_pred;    
wire    [24:0]  ifu_iu_pcfifo_create0_chk_idx;     
wire    [39:0]  ifu_iu_pcfifo_create0_cur_pc;      
wire            ifu_iu_pcfifo_create0_dst_vld;     
wire            ifu_iu_pcfifo_create0_en;          
wire            ifu_iu_pcfifo_create0_gateclk_en;  
wire            ifu_iu_pcfifo_create0_jal;         
wire            ifu_iu_pcfifo_create0_jalr;        
wire            ifu_iu_pcfifo_create0_jmp_mispred; 
wire    [39:0]  ifu_iu_pcfifo_create0_tar_pc;      
wire            ifu_iu_pcfifo_create1_bht_pred;    
wire    [24:0]  ifu_iu_pcfifo_create1_chk_idx;     
wire    [39:0]  ifu_iu_pcfifo_create1_cur_pc;      
wire            ifu_iu_pcfifo_create1_dst_vld;     
wire            ifu_iu_pcfifo_create1_en;          
wire            ifu_iu_pcfifo_create1_gateclk_en;  
wire            ifu_iu_pcfifo_create1_jal;         
wire            ifu_iu_pcfifo_create1_jalr;        
wire            ifu_iu_pcfifo_create1_jmp_mispred; 
wire    [39:0]  ifu_iu_pcfifo_create1_tar_pc;      
wire    [39:0]  inst0_target_pc;                   
wire    [21:0]  inst0_vghr;                        
wire    [39:0]  inst1_target_pc;                   
wire    [21:0]  inst1_vghr;                        
wire    [1 :0]  inst_bht_pre_result;               
wire    [1 :0]  inst_bht_sel_result;               
wire            inst_ind_btb_miss;                 
wire            lbuf_create_select;                
wire            lbuf_pcfifo_if_create_select;      
wire    [1 :0]  lbuf_pcfifo_if_inst_bht_pre_result; 
wire    [1 :0]  lbuf_pcfifo_if_inst_bht_sel_result; 
wire    [38:0]  lbuf_pcfifo_if_inst_cur_pc;        
wire            lbuf_pcfifo_if_inst_pc_oper;       
wire    [38:0]  lbuf_pcfifo_if_inst_target_pc;     
wire    [21:0]  lbuf_pcfifo_if_inst_vghr;          
wire            pcfifo_if_ibctrl_more_than_two;    
wire    [7 :0]  pcfifo_if_ibdp_over_mask;          
wire    [39:0]  pcfifo_ind_target_pc;              


parameter PC_WIDTH = 40;
//ifu pcfifo interface content
//1.Cur_PC[38:0]
//  auipc/con_br/jal cur_pc
//2.Target_PC[38:0]
//  jalr inst target_pc
//3.VGHR[13:0]
//  pc_oper inst ip stage vghr
//4.BHT_pred_array_result[1:0]
//  bht pred array result
//5.BHT_sel_array_result[1:0]
//  bht sel array result
//6. inst_jal
//7. isnt_jalr

//==========================================================
//                  Hn_cur_pc generate
//==========================================================
//IF H0 vld, h1_cur_pc = ipdp_pcfifo_if_h0_cur_pc
//ELSE       h1_cur_pc = ipdp_pcfifo_if_h1_cur_pc
//need not to merge again
assign h1_cur_pc[PC_WIDTH-2:0] = (ibdp_pcfifo_if_h0_vld)
                               ? ibdp_pcfifo_if_h0_cur_pc[PC_WIDTH-2:0]
                               : ibdp_pcfifo_if_h1_cur_pc[PC_WIDTH-2:0];
assign h2_cur_pc[PC_WIDTH-2:0] = ibdp_pcfifo_if_h2_cur_pc[PC_WIDTH-2:0];                      
assign h3_cur_pc[PC_WIDTH-2:0] = ibdp_pcfifo_if_h3_cur_pc[PC_WIDTH-2:0];                      
assign h4_cur_pc[PC_WIDTH-2:0] = ibdp_pcfifo_if_h4_cur_pc[PC_WIDTH-2:0];                      
assign h5_cur_pc[PC_WIDTH-2:0] = ibdp_pcfifo_if_h5_cur_pc[PC_WIDTH-2:0];                      
assign h6_cur_pc[PC_WIDTH-2:0] = ibdp_pcfifo_if_h6_cur_pc[PC_WIDTH-2:0];                      
assign h7_cur_pc[PC_WIDTH-2:0] = ibdp_pcfifo_if_h7_cur_pc[PC_WIDTH-2:0];                      
assign h8_cur_pc[PC_WIDTH-2:0] = ibdp_pcfifo_if_h8_cur_pc[PC_WIDTH-2:0];

//==========================================================
//               Hn_target_pc generate
//==========================================================
//Only ind-br/preturn need target PC
//IF preturn_vld, target_pc = ras_pc
//ELSE            target_pc = ind_btb_pc-ind_br_offset
//for timing consideration of BJU,we user target_pc-offset as target_pc
//In EX1 of BJU ,it will compare target_pc with src1,instead using
//src1+offset
assign pcfifo_ind_target_pc[PC_WIDTH-1:0] = {ibctrl_pcfifo_if_ind_target_pc[PC_WIDTH-2:0],1'b0} -
                                            {{19{ibdp_pcfifo_if_ind_br_offset[20]}},ibdp_pcfifo_if_ind_br_offset[20:0]};

assign hn_target_pc[PC_WIDTH-1:0] = (ibctrl_pcfifo_if_ras_vld)
                                  ? {ibctrl_pcfifo_if_ras_target_pc[PC_WIDTH-2:0],1'b0} 
                                  : pcfifo_ind_target_pc[PC_WIDTH-1:0];
                          

//==========================================================
//                    Other Hn Signal
//==========================================================
//hn_jal
assign h1_jal = ibdp_pcfifo_if_hn_jal[7];                        
assign h2_jal = ibdp_pcfifo_if_hn_jal[6];                        
assign h3_jal = ibdp_pcfifo_if_hn_jal[5];                        
assign h4_jal = ibdp_pcfifo_if_hn_jal[4];                        
assign h5_jal = ibdp_pcfifo_if_hn_jal[3];                        
assign h6_jal = ibdp_pcfifo_if_hn_jal[2];                        
assign h7_jal = ibdp_pcfifo_if_hn_jal[1];                        
assign h8_jal = ibdp_pcfifo_if_hn_jal[0]; 

//hn_jalr
assign h1_jalr = ibdp_pcfifo_if_hn_jalr[7];                        
assign h2_jalr = ibdp_pcfifo_if_hn_jalr[6];                        
assign h3_jalr = ibdp_pcfifo_if_hn_jalr[5];                        
assign h4_jalr = ibdp_pcfifo_if_hn_jalr[4];                        
assign h5_jalr = ibdp_pcfifo_if_hn_jalr[3];                        
assign h6_jalr = ibdp_pcfifo_if_hn_jalr[2];                        
assign h7_jalr = ibdp_pcfifo_if_hn_jalr[1];                        
assign h8_jalr = ibdp_pcfifo_if_hn_jalr[0]; 

//hn_con_br
assign h1_con_br = ibdp_pcfifo_if_hn_con_br[7];                        
assign h2_con_br = ibdp_pcfifo_if_hn_con_br[6];                        
assign h3_con_br = ibdp_pcfifo_if_hn_con_br[5];                        
assign h4_con_br = ibdp_pcfifo_if_hn_con_br[4];                        
assign h5_con_br = ibdp_pcfifo_if_hn_con_br[3];                        
assign h6_con_br = ibdp_pcfifo_if_hn_con_br[2];                        
assign h7_con_br = ibdp_pcfifo_if_hn_con_br[1];                        
assign h8_con_br = ibdp_pcfifo_if_hn_con_br[0];

//hn_dst_vld
assign h1_dst_vld = ibdp_pcfifo_if_hn_dst_vld[7];
assign h2_dst_vld = ibdp_pcfifo_if_hn_dst_vld[6];
assign h3_dst_vld = ibdp_pcfifo_if_hn_dst_vld[5];
assign h4_dst_vld = ibdp_pcfifo_if_hn_dst_vld[4];
assign h5_dst_vld = ibdp_pcfifo_if_hn_dst_vld[3];
assign h6_dst_vld = ibdp_pcfifo_if_hn_dst_vld[2];
assign h7_dst_vld = ibdp_pcfifo_if_hn_dst_vld[1];
assign h8_dst_vld = ibdp_pcfifo_if_hn_dst_vld[0];

//hn_po_oper
assign hn_pc_oper[7:0] = ibdp_pcfifo_if_hn_pc_oper[7:0];

//==========================================================
//         Two inst selected from Eight Half
//==========================================================
// &CombBeg; @125
always @( h8_con_br
       or h7_jal
       or h8_jalr
       or h1_jalr
       or h7_dst_vld
       or h7_jalr
       or h4_dst_vld
       or h1_con_br
       or h6_jalr
       or h5_con_br
       or h3_cur_pc[38:0]
       or h1_jal
       or h4_con_br
       or h6_con_br
       or h5_dst_vld
       or h4_jalr
       or h6_jal
       or h4_jal
       or h3_jalr
       or h2_dst_vld
       or h1_cur_pc[38:0]
       or h7_con_br
       or h3_dst_vld
       or h6_dst_vld
       or h2_con_br
       or h8_dst_vld
       or h4_cur_pc[38:0]
       or h3_jal
       or h2_cur_pc[38:0]
       or h2_jalr
       or h3_con_br
       or h6_cur_pc[38:0]
       or h1_dst_vld
       or h2_jal
       or h5_jal
       or hn_pc_oper[7:0]
       or h5_cur_pc[38:0]
       or h8_jal
       or h7_cur_pc[38:0]
       or h8_cur_pc[38:0]
       or h5_jalr)
begin
casez(hn_pc_oper[7:0])
  8'b11?????? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h1_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h1_jal;
                inst0_jalr                 = h1_jalr;
                inst0_dst_vld              = h1_dst_vld;
                inst0_con_br               = h1_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h2_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h2_jal;
                inst1_jalr                 = h2_jalr;
                inst1_dst_vld              = h2_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00111111;
                end
  8'b101????? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h1_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h1_jal;
                inst0_jalr                 = h1_jalr;
                inst0_dst_vld              = h1_dst_vld;
                inst0_con_br               = h1_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h3_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h3_jal;
                inst1_jalr                 = h3_jalr;
                inst1_dst_vld              = h3_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00011111;
                end
  8'b1001???? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h1_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h1_jal;
                inst0_jalr                 = h1_jalr;
                inst0_dst_vld              = h1_dst_vld;
                inst0_con_br               = h1_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h4_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h4_jal;
                inst1_jalr                 = h4_jalr;
                inst1_dst_vld              = h4_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00001111;
                end
  8'b10001??? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h1_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h1_jal;
                inst0_jalr                 = h1_jalr;
                inst0_dst_vld              = h1_dst_vld;
                inst0_con_br               = h1_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h5_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h5_jal;
                inst1_jalr                 = h5_jalr;
                inst1_dst_vld              = h5_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000111;
                end
  8'b100001?? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h1_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h1_jal;
                inst0_jalr                 = h1_jalr;
                inst0_dst_vld              = h1_dst_vld;
                inst0_con_br               = h1_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h6_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h6_jal;
                inst1_jalr                 = h6_jalr;
                inst1_dst_vld              = h6_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000011;
                end
  8'b1000001? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h1_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h1_jal;
                inst0_jalr                 = h1_jalr;
                inst0_dst_vld              = h1_dst_vld;
                inst0_con_br               = h1_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h7_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h7_jal;
                inst1_jalr                 = h7_jalr;
                inst1_dst_vld              = h7_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000001;
                end
  8'b10000001 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h1_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h1_jal;
                inst0_jalr                 = h1_jalr;
                inst0_dst_vld              = h1_dst_vld;
                inst0_con_br               = h1_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000000;
                end
  8'b10000000 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h1_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h1_jal;
                inst0_jalr                 = h1_jalr;
                inst0_dst_vld              = h1_dst_vld;
                inst0_con_br               = h1_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end
                
  8'b011????? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h2_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h2_jal;
                inst0_jalr                 = h2_jalr;
                inst0_dst_vld              = h2_dst_vld;
                inst0_con_br               = h2_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h3_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h3_jal;
                inst1_jalr                 = h3_jalr;
                inst1_dst_vld              = h3_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00011111;
                end
  8'b0101???? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h2_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h2_jal;
                inst0_jalr                 = h2_jalr;
                inst0_dst_vld              = h2_dst_vld;
                inst0_con_br               = h2_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h4_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h4_jal;
                inst1_jalr                 = h4_jalr;
                inst1_dst_vld              = h4_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00001111;
                end
  8'b01001??? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h2_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h2_jal;
                inst0_jalr                 = h2_jalr;
                inst0_dst_vld              = h2_dst_vld;
                inst0_con_br               = h2_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h5_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h5_jal;
                inst1_jalr                 = h5_jalr;
                inst1_dst_vld              = h5_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000111;
                end
  8'b010001?? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h2_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h2_jal;
                inst0_jalr                 = h2_jalr;
                inst0_dst_vld              = h2_dst_vld;
                inst0_con_br               = h2_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h6_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h6_jal;
                inst1_jalr                 = h6_jalr;
                inst1_dst_vld              = h6_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000011;
                end
  8'b0100001? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h2_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h2_jal;
                inst0_jalr                 = h2_jalr;
                inst0_dst_vld              = h2_dst_vld;
                inst0_con_br               = h2_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h7_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h7_jal;
                inst1_jalr                 = h7_jalr;
                inst1_dst_vld              = h7_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000001;
                end
  8'b01000001 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h2_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h2_jal;
                inst0_jalr                 = h2_jalr;
                inst0_dst_vld              = h2_dst_vld;
                inst0_con_br               = h2_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000000;
                end
  8'b01000000 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h2_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h2_jal;
                inst0_jalr                 = h2_jalr;
                inst0_dst_vld              = h2_dst_vld;
                inst0_con_br               = h2_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end
                
  8'b0011???? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h3_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h3_jal;
                inst0_jalr                 = h3_jalr;
                inst0_dst_vld              = h3_dst_vld;
                inst0_con_br               = h3_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h4_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h4_jal;
                inst1_jalr                 = h4_jalr;
                inst1_dst_vld              = h4_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00001111;
                end
  8'b00101??? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h3_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h3_jal;
                inst0_jalr                 = h3_jalr;
                inst0_dst_vld              = h3_dst_vld;
                inst0_con_br               = h3_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h5_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h5_jal;
                inst1_jalr                 = h5_jalr;
                inst1_dst_vld              = h5_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000111;
                end
  8'b001001?? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h3_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h3_jal;
                inst0_jalr                 = h3_jalr;
                inst0_dst_vld              = h3_dst_vld;
                inst0_con_br               = h3_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h6_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h6_jal;
                inst1_jalr                 = h6_jalr;
                inst1_dst_vld              = h6_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000011;
                end
  8'b0010001? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h3_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h3_jal;
                inst0_jalr                 = h3_jalr;
                inst0_dst_vld              = h3_dst_vld;
                inst0_con_br               = h3_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h7_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h7_jal;
                inst1_jalr                 = h7_jalr;
                inst1_dst_vld              = h7_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000001;
                end
  8'b00100001 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h3_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h3_jal;
                inst0_jalr                 = h3_jalr;
                inst0_dst_vld              = h3_dst_vld;
                inst0_con_br               = h3_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000000;
                end
  8'b00100000 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h3_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h3_jal;
                inst0_jalr                 = h3_jalr;
                inst0_dst_vld              = h3_dst_vld;
                inst0_con_br               = h3_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end

  8'b00011??? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h4_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h4_jal;
                inst0_jalr                 = h4_jalr;
                inst0_dst_vld              = h4_dst_vld;
                inst0_con_br               = h4_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h5_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h5_jal;
                inst1_jalr                 = h5_jalr;
                inst1_dst_vld              = h5_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000111;
                end
  8'b000101?? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h4_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h4_jal;
                inst0_jalr                 = h4_jalr;
                inst0_dst_vld              = h4_dst_vld;
                inst0_con_br               = h4_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h6_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h6_jal;
                inst1_jalr                 = h6_jalr;
                inst1_dst_vld              = h6_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000011;
                end
  8'b0001001? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h4_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h4_jal;
                inst0_jalr                 = h4_jalr;
                inst0_dst_vld              = h4_dst_vld;
                inst0_con_br               = h4_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h7_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h7_jal;
                inst1_jalr                 = h7_jalr;
                inst1_dst_vld              = h7_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000001;
                end
  8'b00010001 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h4_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h4_jal;
                inst0_jalr                 = h4_jalr;
                inst0_dst_vld              = h4_dst_vld;
                inst0_con_br               = h4_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000000;
                end
  8'b00010000 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h4_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h4_jal;
                inst0_jalr                 = h4_jalr;
                inst0_dst_vld              = h4_dst_vld;
                inst0_con_br               = h4_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end

  8'b000011?? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h5_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h5_jal;
                inst0_jalr                 = h5_jalr;
                inst0_dst_vld              = h5_dst_vld;
                inst0_con_br               = h5_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h6_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h6_jal;
                inst1_jalr                 = h6_jalr;
                inst1_dst_vld              = h6_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000011;
                end
  8'b0000101? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h5_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h5_jal;
                inst0_jalr                 = h5_jalr;
                inst0_dst_vld              = h5_dst_vld;
                inst0_con_br               = h5_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h7_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h7_jal;
                inst1_jalr                 = h7_jalr;
                inst1_dst_vld              = h7_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000001;
                end
  8'b00001001 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h5_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h5_jal;
                inst0_jalr                 = h5_jalr;
                inst0_dst_vld              = h5_dst_vld;
                inst0_con_br               = h5_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000000;
                end
  8'b00001000 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h5_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h5_jal;
                inst0_jalr                 = h5_jalr;
                inst0_dst_vld              = h5_dst_vld;
                inst0_con_br               = h5_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end

  8'b0000011? : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h6_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h6_jal;
                inst0_jalr                 = h6_jalr;
                inst0_dst_vld              = h6_dst_vld;
                inst0_con_br               = h6_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h7_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h7_jal;
                inst1_jalr                 = h7_jalr;
                inst1_dst_vld              = h7_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000001;
                end
  8'b00000101 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h6_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h6_jal;
                inst0_jalr                 = h6_jalr;
                inst0_dst_vld              = h6_dst_vld;
                inst0_con_br               = h6_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000000;
                end
  8'b00000100 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h6_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h6_jal;
                inst0_jalr                 = h6_jalr;
                inst0_dst_vld              = h6_dst_vld;
                inst0_con_br               = h6_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end

  8'b00000011 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h7_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h7_jal;
                inst0_jalr                 = h7_jalr;
                inst0_dst_vld              = h7_dst_vld;
                inst0_con_br               = h7_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b1;
                over_mask[7:0]             = 8'b00000000;
                end
  8'b00000010 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h7_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h7_jal;
                inst0_jalr                 = h7_jalr;
                inst0_dst_vld              = h7_dst_vld;
                inst0_con_br               = h7_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end

  8'b00000001 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h8_jal;
                inst0_jalr                 = h8_jalr;
                inst0_dst_vld              = h8_dst_vld;
                inst0_con_br               = h8_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b1;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end

  8'b00000000 : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h8_jal;
                inst0_jalr                 = h8_jalr;
                inst0_dst_vld              = h8_dst_vld;
                inst0_con_br               = h8_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b0;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end

  default     : begin
                inst0_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst0_jal                  = h8_jal;
                inst0_jalr                 = h8_jalr;
                inst0_dst_vld              = h8_dst_vld;
                inst0_con_br               = h8_con_br;
                inst1_cur_pc[PC_WIDTH-2:0] = h8_cur_pc[PC_WIDTH-2:0];
                inst1_jal                  = h8_jal;
                inst1_jalr                 = h8_jalr;
                inst1_dst_vld              = h8_dst_vld;
                inst0_vld                  = 1'b0;
                inst1_vld                  = 1'b0;
                over_mask[7:0]             = 8'b00000000;
                end
endcase
// &CombEnd; @669
end

assign inst0_target_pc[PC_WIDTH-1:0] = hn_target_pc[PC_WIDTH-1:0];
assign inst1_target_pc[PC_WIDTH-1:0] = hn_target_pc[PC_WIDTH-1:0];

//==========================================================
//                  Other infor Generate
//==========================================================
//Inst VGHR Generate
//if inst0 is con_br not jump
//inst1 vghr = {ip_vghr[12:0] ,1'b0}
assign inst0_vghr[21:0] = ibdp_pcfifo_if_vghr[21:0];
assign inst1_vghr[21:0] = (inst0_con_br) 
                        ? {ibdp_pcfifo_if_vghr[20:0], 1'b0}
                        : ibdp_pcfifo_if_vghr[21:0];

//bht_pred_array_result
//inst0 & inst1 has one con_br at most
//thus share one bht_pred_array_result
assign inst_bht_pre_result[1:0] = ibdp_pcfifo_if_bht_pre_result[1:0];

//bht_select_array_result
//inst0 & inst1 has one con_br at most
//thus share one bht_select_array_result
assign inst_bht_sel_result[1:0] = ibdp_pcfifo_if_bht_sel_result[1:0];

//Ind_btb Miss Signal
//Let BJU 
assign inst_ind_btb_miss = ibctrl_pcfifo_if_ind_btb_miss;

//==========================================================
//          More than two pc_oper inst logic
//==========================================================
//after mask, if there are any pc_oper valid
//more_than_two pc_oper inst valid
//seperate more_than_two logic to save timing
//find the first pc and the last pc
//then mask the two pc and find if there are any pc
// &CombBeg; @707
always @( hn_pc_oper[7:0])
begin
casez(hn_pc_oper[7:0])
  8'b1??????? : hn_pc_mask_head[7:0] = {1'b0,hn_pc_oper[6:0]};
  8'b01?????? : hn_pc_mask_head[7:0] = {2'b0,hn_pc_oper[5:0]};
  8'b001????? : hn_pc_mask_head[7:0] = {3'b0,hn_pc_oper[4:0]};
  8'b0001???? : hn_pc_mask_head[7:0] = {4'b0,hn_pc_oper[3:0]};
  8'b00001??? : hn_pc_mask_head[7:0] = {5'b0,hn_pc_oper[2:0]};
  8'b000001?? : hn_pc_mask_head[7:0] = {6'b0,hn_pc_oper[1:0]};
  8'b0000001? : hn_pc_mask_head[7:0] = {7'b0,hn_pc_oper[0]  };
  8'b00000001 : hn_pc_mask_head[7:0] =  8'b0;
  default     : hn_pc_mask_head[7:0] =  8'b0;
endcase
// &CombEnd; @719
end

// &CombBeg; @721
always @( hn_pc_oper[7:0])
begin
casez(hn_pc_oper[7:0])
  8'b???????1 : hn_pc_mask_tail[7:0] = {hn_pc_oper[7:1],1'b0};
  8'b??????10 : hn_pc_mask_tail[7:0] = {hn_pc_oper[7:2],2'b0};
  8'b?????100 : hn_pc_mask_tail[7:0] = {hn_pc_oper[7:3],3'b0};
  8'b????1000 : hn_pc_mask_tail[7:0] = {hn_pc_oper[7:4],4'b0};
  8'b???10000 : hn_pc_mask_tail[7:0] = {hn_pc_oper[7:5],5'b0};
  8'b??100000 : hn_pc_mask_tail[7:0] = {hn_pc_oper[7:6],6'b0};
  8'b?1000000 : hn_pc_mask_tail[7:0] = {hn_pc_oper[7]  ,7'b0};
  8'b10000000 : hn_pc_mask_tail[7:0] =  8'b0;
  default     : hn_pc_mask_tail[7:0] =  8'b0;
endcase
// &CombEnd; @733
end
assign pcfifo_if_ibctrl_more_than_two   =  |(hn_pc_mask_head[7:0] & 
                                             hn_pc_mask_tail[7:0]);
assign pcfifo_if_ibdp_over_mask[7:0]    = over_mask[7:0];

//==========================================================
//                 Interface to PCFIFO
//==========================================================
assign ibstage_create_vld    = ibctrl_pcfifo_if_create_vld;
assign lbuf_create_select    = lbuf_pcfifo_if_create_select;
//Inst 0
//Inst 0 may from lbuf whenlbuf ACTIVE state
//Otherwise it from IB data path
assign ifu_iu_pcfifo_create0_en             = (lbuf_create_select)
                                            ? lbuf_pcfifo_if_inst_pc_oper
                                            : ibstage_create_vld && inst0_vld;
assign ifu_iu_pcfifo_create0_gateclk_en     = lbuf_create_select || 
                                              inst0_vld;
assign ifu_iu_pcfifo_create0_cur_pc[39:0]   = (lbuf_create_select) 
                                            ? {lbuf_pcfifo_if_inst_cur_pc[PC_WIDTH-2:0],1'b0}
                                            : {inst0_cur_pc[PC_WIDTH-2:0],1'b0};
assign ifu_iu_pcfifo_create0_tar_pc[39:0]   = (lbuf_create_select)
                                            ? {lbuf_pcfifo_if_inst_target_pc[PC_WIDTH-2:0],1'b0} 
                                            : inst0_target_pc[PC_WIDTH-1:0];
assign ifu_iu_pcfifo_create0_jal            = (lbuf_create_select)
                                            ? 1'b0 
                                            : inst0_jal;
assign ifu_iu_pcfifo_create0_jalr           = (lbuf_create_select)
                                            ? 1'b0 
                                            : inst0_jalr;
assign ifu_iu_pcfifo_create0_dst_vld        = (lbuf_create_select)
                                            ? 1'b0 
                                            : inst0_dst_vld;
assign ifu_iu_pcfifo_create0_bht_pred       = (lbuf_create_select)
                                            ? lbuf_pcfifo_if_inst_bht_pre_result[1]
                                            : inst_bht_pre_result[1];
assign ifu_iu_pcfifo_create0_chk_idx[24:0]  = (lbuf_create_select)
                                            ? {lbuf_pcfifo_if_inst_bht_pre_result[0],
                                               lbuf_pcfifo_if_inst_bht_sel_result[1:0],
                                               lbuf_pcfifo_if_inst_vghr[21:0]}
                                            : {inst_bht_pre_result[0],
                                               inst_bht_sel_result[1:0],
                                               inst0_vghr[21:0]};
assign ifu_iu_pcfifo_create0_jmp_mispred    = (lbuf_create_select)
                                            ? 1'b0 
                                            : inst_ind_btb_miss;                                            
//Inst 1
//Inst 1 can only from IB data path
assign ifu_iu_pcfifo_create1_en             = (lbuf_create_select)
                                            ? 1'b0 
                                            : ibstage_create_vld && inst1_vld;
assign ifu_iu_pcfifo_create1_gateclk_en     = lbuf_create_select || 
                                              inst1_vld;
assign ifu_iu_pcfifo_create1_cur_pc[39:0]   = {inst1_cur_pc[PC_WIDTH-2:0],1'b0};
assign ifu_iu_pcfifo_create1_tar_pc[39:0]   = inst1_target_pc[PC_WIDTH-1:0];
assign ifu_iu_pcfifo_create1_jal            = inst1_jal;
assign ifu_iu_pcfifo_create1_jalr           = inst1_jalr;
assign ifu_iu_pcfifo_create1_dst_vld        = inst1_dst_vld;
assign ifu_iu_pcfifo_create1_bht_pred       = inst_bht_pre_result[1];
assign ifu_iu_pcfifo_create1_chk_idx[24:0]  = {inst_bht_pre_result[0],
                                               inst_bht_sel_result[1:0],
                                               inst1_vghr[21:0]};
assign ifu_iu_pcfifo_create1_jmp_mispred    = inst_ind_btb_miss;

// &ModuleEnd; @816
endmodule


