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
module ct_ifu_sfp(
  cp0_ifu_icg_en,
  cp0_ifu_nsfe,
  cp0_ifu_vsetvli_pred_disable,
  cp0_ifu_vsetvli_pred_mode,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  pcgen_sfp_pc,
  rtu_ifu_chgflw_vld,
  rtu_ifu_retire_inst0_cur_pc,
  rtu_ifu_retire_inst0_load,
  rtu_ifu_retire_inst0_no_spec_hit,
  rtu_ifu_retire_inst0_no_spec_mispred,
  rtu_ifu_retire_inst0_no_spec_miss,
  rtu_ifu_retire_inst0_store,
  rtu_ifu_retire_inst0_vl_hit,
  rtu_ifu_retire_inst0_vl_mispred,
  rtu_ifu_retire_inst0_vl_miss,
  rtu_ifu_retire_inst0_vl_pred,
  rtu_ifu_retire_inst1_cur_pc,
  rtu_ifu_retire_inst1_load,
  rtu_ifu_retire_inst1_no_spec_hit,
  rtu_ifu_retire_inst1_no_spec_mispred,
  rtu_ifu_retire_inst1_no_spec_miss,
  rtu_ifu_retire_inst1_store,
  rtu_ifu_retire_inst1_vl_pred,
  rtu_ifu_retire_inst2_cur_pc,
  rtu_ifu_retire_inst2_load,
  rtu_ifu_retire_inst2_no_spec_hit,
  rtu_ifu_retire_inst2_no_spec_mispred,
  rtu_ifu_retire_inst2_no_spec_miss,
  rtu_ifu_retire_inst2_store,
  rtu_ifu_retire_inst2_vl_pred,
  sfp_ifdp_hit_pc_lo,
  sfp_ifdp_hit_type,
  sfp_ifdp_pc_hit
);

// &Ports; @23
input           cp0_ifu_icg_en;                      
input           cp0_ifu_nsfe;                        
input           cp0_ifu_vsetvli_pred_disable;        
input           cp0_ifu_vsetvli_pred_mode;           
input           cp0_yy_clk_en;                       
input           cpurst_b;                            
input           forever_cpuclk;                      
input           pad_yy_icg_scan_en;                  
input   [16:0]  pcgen_sfp_pc;                        
input           rtu_ifu_chgflw_vld;                  
input   [38:0]  rtu_ifu_retire_inst0_cur_pc;         
input           rtu_ifu_retire_inst0_load;           
input           rtu_ifu_retire_inst0_no_spec_hit;    
input           rtu_ifu_retire_inst0_no_spec_mispred; 
input           rtu_ifu_retire_inst0_no_spec_miss;   
input           rtu_ifu_retire_inst0_store;          
input           rtu_ifu_retire_inst0_vl_hit;         
input           rtu_ifu_retire_inst0_vl_mispred;     
input           rtu_ifu_retire_inst0_vl_miss;        
input           rtu_ifu_retire_inst0_vl_pred;        
input   [38:0]  rtu_ifu_retire_inst1_cur_pc;         
input           rtu_ifu_retire_inst1_load;           
input           rtu_ifu_retire_inst1_no_spec_hit;    
input           rtu_ifu_retire_inst1_no_spec_mispred; 
input           rtu_ifu_retire_inst1_no_spec_miss;   
input           rtu_ifu_retire_inst1_store;          
input           rtu_ifu_retire_inst1_vl_pred;        
input   [38:0]  rtu_ifu_retire_inst2_cur_pc;         
input           rtu_ifu_retire_inst2_load;           
input           rtu_ifu_retire_inst2_no_spec_hit;    
input           rtu_ifu_retire_inst2_no_spec_mispred; 
input           rtu_ifu_retire_inst2_no_spec_miss;   
input           rtu_ifu_retire_inst2_store;          
input           rtu_ifu_retire_inst2_vl_pred;        
output  [2 :0]  sfp_ifdp_hit_pc_lo;                  
output  [3 :0]  sfp_ifdp_hit_type;                   
output          sfp_ifdp_pc_hit;                     

// &Regs; @24
reg     [11:0]  entry_write_en;                      
reg     [2 :0]  sfp_bar_pc_lo;                       
reg     [11:0]  sfp_entry_fifo;                      
reg     [2 :0]  sfp_fp_pc_lo;                        
reg     [1 :0]  sfp_rd_cur_state;                    
reg     [1 :0]  sfp_rd_next_state;                   
reg     [16:0]  sfp_sf_pc_record;                    
reg     [2 :0]  sfp_wr_buf_inst_type;                
reg     [19:0]  sfp_wr_buf_updt_pc;                  
reg     [2 :0]  sfp_wr_buf_updt_type;                
reg     [2 :0]  wr_buf_inst_type_record;             
reg     [19:0]  wr_buf_updt_pc_record;               
reg     [2 :0]  wr_buf_updt_type_record;             
reg             wr_buf_updt_vld;                     

// &Wires; @25
wire            cp0_ifu_icg_en;                      
wire            cp0_ifu_nsfe;                        
wire            cp0_ifu_vsetvli_pred_disable;        
wire            cp0_ifu_vsetvli_pred_mode;           
wire            cp0_yy_clk_en;                       
wire            cpurst_b;                            
wire    [11:0]  entry_bar_pc_0;                      
wire    [11:0]  entry_bar_pc_1;                      
wire    [11:0]  entry_bar_pc_10;                     
wire    [11:0]  entry_bar_pc_11;                     
wire    [11:0]  entry_bar_pc_2;                      
wire    [11:0]  entry_bar_pc_3;                      
wire    [11:0]  entry_bar_pc_4;                      
wire    [11:0]  entry_bar_pc_5;                      
wire    [11:0]  entry_bar_pc_6;                      
wire    [11:0]  entry_bar_pc_7;                      
wire    [11:0]  entry_bar_pc_8;                      
wire    [11:0]  entry_bar_pc_9;                      
wire            entry_bar_pc_updt_bit;               
wire    [11:0]  entry_clk_en;                        
wire    [1 :0]  entry_cnt_0;                         
wire    [1 :0]  entry_cnt_1;                         
wire    [1 :0]  entry_cnt_10;                        
wire    [1 :0]  entry_cnt_11;                        
wire    [1 :0]  entry_cnt_2;                         
wire    [1 :0]  entry_cnt_3;                         
wire    [1 :0]  entry_cnt_4;                         
wire    [1 :0]  entry_cnt_5;                         
wire    [1 :0]  entry_cnt_6;                         
wire    [1 :0]  entry_cnt_7;                         
wire    [1 :0]  entry_cnt_8;                         
wire    [1 :0]  entry_cnt_9;                         
wire            entry_cnt_updt_bit;                  
wire    [7 :0]  entry_hi_pc_0;                       
wire    [7 :0]  entry_hi_pc_1;                       
wire    [7 :0]  entry_hi_pc_10;                      
wire    [7 :0]  entry_hi_pc_11;                      
wire    [7 :0]  entry_hi_pc_2;                       
wire    [7 :0]  entry_hi_pc_3;                       
wire    [7 :0]  entry_hi_pc_4;                       
wire    [7 :0]  entry_hi_pc_5;                       
wire    [7 :0]  entry_hi_pc_6;                       
wire    [7 :0]  entry_hi_pc_7;                       
wire    [7 :0]  entry_hi_pc_8;                       
wire    [7 :0]  entry_hi_pc_9;                       
wire    [11:0]  entry_sf_pc_0;                       
wire    [11:0]  entry_sf_pc_1;                       
wire    [11:0]  entry_sf_pc_10;                      
wire    [11:0]  entry_sf_pc_11;                      
wire    [11:0]  entry_sf_pc_2;                       
wire    [11:0]  entry_sf_pc_3;                       
wire    [11:0]  entry_sf_pc_4;                       
wire    [11:0]  entry_sf_pc_5;                       
wire    [11:0]  entry_sf_pc_6;                       
wire    [11:0]  entry_sf_pc_7;                       
wire    [11:0]  entry_sf_pc_8;                       
wire    [11:0]  entry_sf_pc_9;                       
wire            entry_sf_pc_updt_bit;                
wire    [11:0]  entry_type;                          
wire    [24:0]  entry_write_data;                    
wire            forever_cpuclk;                      
wire            pad_yy_icg_scan_en;                  
wire    [16:0]  pcgen_sfp_pc;                        
wire            rtu_ifu_chgflw_vld;                  
wire    [38:0]  rtu_ifu_retire_inst0_cur_pc;         
wire            rtu_ifu_retire_inst0_load;           
wire            rtu_ifu_retire_inst0_no_spec_hit;    
wire            rtu_ifu_retire_inst0_no_spec_mispred; 
wire            rtu_ifu_retire_inst0_no_spec_miss;   
wire            rtu_ifu_retire_inst0_store;          
wire            rtu_ifu_retire_inst0_vl_hit;         
wire            rtu_ifu_retire_inst0_vl_mispred;     
wire            rtu_ifu_retire_inst0_vl_miss;        
wire            rtu_ifu_retire_inst0_vl_pred;        
wire    [38:0]  rtu_ifu_retire_inst1_cur_pc;         
wire            rtu_ifu_retire_inst1_load;           
wire            rtu_ifu_retire_inst1_no_spec_hit;    
wire            rtu_ifu_retire_inst1_no_spec_mispred; 
wire            rtu_ifu_retire_inst1_no_spec_miss;   
wire            rtu_ifu_retire_inst1_store;          
wire            rtu_ifu_retire_inst1_vl_pred;        
wire    [38:0]  rtu_ifu_retire_inst2_cur_pc;         
wire            rtu_ifu_retire_inst2_load;           
wire            rtu_ifu_retire_inst2_no_spec_hit;    
wire            rtu_ifu_retire_inst2_no_spec_mispred; 
wire            rtu_ifu_retire_inst2_no_spec_miss;   
wire            rtu_ifu_retire_inst2_store;          
wire            rtu_ifu_retire_inst2_vl_pred;        
wire    [11:0]  sf_pc_hit_sf_pc;                     
wire            sfp_bar_hit;                         
wire    [11:0]  sfp_bar_pc_hit;                      
wire            sfp_fifo_create_clk;                 
wire            sfp_fifo_en;                         
wire    [2 :0]  sfp_hit_pc_lo;                       
wire    [3 :0]  sfp_hit_type;                        
wire    [2 :0]  sfp_ifdp_hit_pc_lo;                  
wire    [3 :0]  sfp_ifdp_hit_type;                   
wire            sfp_ifdp_pc_hit;                     
wire            sfp_inst0_updt_vld;                  
wire            sfp_inst1_updt_vld;                  
wire            sfp_inst2_updt_vld;                  
wire    [11:0]  sfp_pc_hi_hit;                       
wire            sfp_pc_hit;                          
wire            sfp_sf_hit;                          
wire            sfp_sf_pc_clk;                       
wire            sfp_sf_pc_clk_en;                    
wire    [11:0]  sfp_sf_pc_hit;                       
wire    [11:0]  sfp_sf_pc_hit_raw;                   
wire            sfp_sf_pc_updt_vld;                  
wire            sfp_vl_hit;                          
wire            sfp_vl_hit_raw;                      
wire    [11:0]  sfp_vl_pc_hit;                       
wire    [11:0]  sfp_vl_pc_hit_raw;                   
wire            sfp_vl_pred_en;                      
wire            sfp_wr_buf_clk;                      
wire            sfp_wr_buf_clk_en;                   
wire            sfp_wr_buf_updt_vld;                 
wire            sfp_wr_fifo_select;                  
wire            sfp_wr_fifo_select_for_gate;         
wire            sfp_wr_record_select;                
wire            sfp_wr_record_select_for_gate;       
wire            sfp_wr_sf_pc_select;                 
wire            sfp_wr_sf_pc_select_for_gate;        
wire    [11:0]  wr_buf_hit_sf_pc;                    


// &Force("bus","rtu_ifu_retire_inst0_cur_pc",38,0); @27
// &Force("bus","rtu_ifu_retire_inst1_cur_pc",38,0); @28
// &Force("bus","rtu_ifu_retire_inst2_cur_pc",38,0); @29
//FSM
parameter SF_RD  = 2'b01;
parameter BAR_RD = 2'b10;

//==========================================================
//                 Spec Fail Predictor Read
//==========================================================
//PC high hit
assign sfp_pc_hi_hit[0]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_0[7:0]);
assign sfp_pc_hi_hit[1]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_1[7:0]);
assign sfp_pc_hi_hit[2]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_2[7:0]);
assign sfp_pc_hi_hit[3]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_3[7:0]);
assign sfp_pc_hi_hit[4]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_4[7:0]);
assign sfp_pc_hi_hit[5]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_5[7:0]);
assign sfp_pc_hi_hit[6]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_6[7:0]);
assign sfp_pc_hi_hit[7]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_7[7:0]);
assign sfp_pc_hi_hit[8]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_8[7:0]);
assign sfp_pc_hi_hit[9]  = (pcgen_sfp_pc[16:9] == entry_hi_pc_9[7:0]);
assign sfp_pc_hi_hit[10] = (pcgen_sfp_pc[16:9] == entry_hi_pc_10[7:0]);
assign sfp_pc_hi_hit[11] = (pcgen_sfp_pc[16:9] == entry_hi_pc_11[7:0]);

//store(spec fail) or vsetvli  pc compare
//1. pc high hit
//2. pc low hit
//3. pc cnt>=2
assign sfp_sf_pc_hit_raw[0]  = sfp_pc_hi_hit[0]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_0[11:3]);
assign sfp_sf_pc_hit_raw[1]  = sfp_pc_hi_hit[1]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_1[11:3]);
assign sfp_sf_pc_hit_raw[2]  = sfp_pc_hi_hit[2]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_2[11:3]);
assign sfp_sf_pc_hit_raw[3]  = sfp_pc_hi_hit[3]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_3[11:3]);
assign sfp_sf_pc_hit_raw[4]  = sfp_pc_hi_hit[4]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_4[11:3]);
assign sfp_sf_pc_hit_raw[5]  = sfp_pc_hi_hit[5]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_5[11:3]);
assign sfp_sf_pc_hit_raw[6]  = sfp_pc_hi_hit[6]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_6[11:3]);
assign sfp_sf_pc_hit_raw[7]  = sfp_pc_hi_hit[7]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_7[11:3]);
assign sfp_sf_pc_hit_raw[8]  = sfp_pc_hi_hit[8]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_8[11:3]);
assign sfp_sf_pc_hit_raw[9]  = sfp_pc_hi_hit[9]  && (pcgen_sfp_pc[8:0] == entry_sf_pc_9[11:3]);
assign sfp_sf_pc_hit_raw[10] = sfp_pc_hi_hit[10] && (pcgen_sfp_pc[8:0] == entry_sf_pc_10[11:3]);
assign sfp_sf_pc_hit_raw[11] = sfp_pc_hi_hit[11] && (pcgen_sfp_pc[8:0] == entry_sf_pc_11[11:3]);


assign sfp_sf_pc_hit[0]  = sfp_sf_pc_hit_raw[0]  && entry_cnt_0[1];
assign sfp_sf_pc_hit[1]  = sfp_sf_pc_hit_raw[1]  && entry_cnt_1[1];
assign sfp_sf_pc_hit[2]  = sfp_sf_pc_hit_raw[2]  && entry_cnt_2[1];
assign sfp_sf_pc_hit[3]  = sfp_sf_pc_hit_raw[3]  && entry_cnt_3[1];
assign sfp_sf_pc_hit[4]  = sfp_sf_pc_hit_raw[4]  && entry_cnt_4[1];
assign sfp_sf_pc_hit[5]  = sfp_sf_pc_hit_raw[5]  && entry_cnt_5[1];
assign sfp_sf_pc_hit[6]  = sfp_sf_pc_hit_raw[6]  && entry_cnt_6[1];
assign sfp_sf_pc_hit[7]  = sfp_sf_pc_hit_raw[7]  && entry_cnt_7[1];
assign sfp_sf_pc_hit[8]  = sfp_sf_pc_hit_raw[8]  && entry_cnt_8[1];
assign sfp_sf_pc_hit[9]  = sfp_sf_pc_hit_raw[9]  && entry_cnt_9[1];
assign sfp_sf_pc_hit[10] = sfp_sf_pc_hit_raw[10] && entry_cnt_10[1];
assign sfp_sf_pc_hit[11] = sfp_sf_pc_hit_raw[11] && entry_cnt_11[1];

//load pc compare
//1. pc high hit
//2. pc low hit
//3. pc cnt>=2
assign sfp_bar_pc_hit[0]  = sfp_pc_hi_hit[0]  && entry_cnt_0[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_0[11:3]);
assign sfp_bar_pc_hit[1]  = sfp_pc_hi_hit[1]  && entry_cnt_1[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_1[11:3]);
assign sfp_bar_pc_hit[2]  = sfp_pc_hi_hit[2]  && entry_cnt_2[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_2[11:3]);
assign sfp_bar_pc_hit[3]  = sfp_pc_hi_hit[3]  && entry_cnt_3[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_3[11:3]);
assign sfp_bar_pc_hit[4]  = sfp_pc_hi_hit[4]  && entry_cnt_4[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_4[11:3]);
assign sfp_bar_pc_hit[5]  = sfp_pc_hi_hit[5]  && entry_cnt_5[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_5[11:3]);
assign sfp_bar_pc_hit[6]  = sfp_pc_hi_hit[6]  && entry_cnt_6[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_6[11:3]);
assign sfp_bar_pc_hit[7]  = sfp_pc_hi_hit[7]  && entry_cnt_7[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_7[11:3]);
assign sfp_bar_pc_hit[8]  = sfp_pc_hi_hit[8]  && entry_cnt_8[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_8[11:3]);
assign sfp_bar_pc_hit[9]  = sfp_pc_hi_hit[9]  && entry_cnt_9[1]  && (pcgen_sfp_pc[8:0] == entry_bar_pc_9[11:3]);
assign sfp_bar_pc_hit[10] = sfp_pc_hi_hit[10] && entry_cnt_10[1] && (pcgen_sfp_pc[8:0] == entry_bar_pc_10[11:3]);
assign sfp_bar_pc_hit[11] = sfp_pc_hi_hit[11] && entry_cnt_11[1] && (pcgen_sfp_pc[8:0] == entry_bar_pc_11[11:3]);

//vsetvli pc compare
assign sfp_vl_pc_hit_raw[0]  = sfp_sf_pc_hit_raw[0]  && (|entry_cnt_0[1:0] ) && entry_type[0];
assign sfp_vl_pc_hit_raw[1]  = sfp_sf_pc_hit_raw[1]  && (|entry_cnt_1[1:0] ) && entry_type[1];
assign sfp_vl_pc_hit_raw[2]  = sfp_sf_pc_hit_raw[2]  && (|entry_cnt_2[1:0] ) && entry_type[2];
assign sfp_vl_pc_hit_raw[3]  = sfp_sf_pc_hit_raw[3]  && (|entry_cnt_3[1:0] ) && entry_type[3];
assign sfp_vl_pc_hit_raw[4]  = sfp_sf_pc_hit_raw[4]  && (|entry_cnt_4[1:0] ) && entry_type[4];
assign sfp_vl_pc_hit_raw[5]  = sfp_sf_pc_hit_raw[5]  && (|entry_cnt_5[1:0] ) && entry_type[5];
assign sfp_vl_pc_hit_raw[6]  = sfp_sf_pc_hit_raw[6]  && (|entry_cnt_6[1:0] ) && entry_type[6];
assign sfp_vl_pc_hit_raw[7]  = sfp_sf_pc_hit_raw[7]  && (|entry_cnt_7[1:0] ) && entry_type[7];
assign sfp_vl_pc_hit_raw[8]  = sfp_sf_pc_hit_raw[8]  && (|entry_cnt_8[1:0] ) && entry_type[8];
assign sfp_vl_pc_hit_raw[9]  = sfp_sf_pc_hit_raw[9]  && (|entry_cnt_9[1:0] ) && entry_type[9];
assign sfp_vl_pc_hit_raw[10] = sfp_sf_pc_hit_raw[10] && (|entry_cnt_10[1:0]) && entry_type[10];
assign sfp_vl_pc_hit_raw[11] = sfp_sf_pc_hit_raw[11] && (|entry_cnt_11[1:0]) && entry_type[11];

assign sfp_vl_pc_hit[0]      = sfp_sf_pc_hit[0]  && entry_type[0];
assign sfp_vl_pc_hit[1]      = sfp_sf_pc_hit[1]  && entry_type[1];
assign sfp_vl_pc_hit[2]      = sfp_sf_pc_hit[2]  && entry_type[2];
assign sfp_vl_pc_hit[3]      = sfp_sf_pc_hit[3]  && entry_type[3];
assign sfp_vl_pc_hit[4]      = sfp_sf_pc_hit[4]  && entry_type[4];
assign sfp_vl_pc_hit[5]      = sfp_sf_pc_hit[5]  && entry_type[5];
assign sfp_vl_pc_hit[6]      = sfp_sf_pc_hit[6]  && entry_type[6];
assign sfp_vl_pc_hit[7]      = sfp_sf_pc_hit[7]  && entry_type[7];
assign sfp_vl_pc_hit[8]      = sfp_sf_pc_hit[8]  && entry_type[8];
assign sfp_vl_pc_hit[9]      = sfp_sf_pc_hit[9]  && entry_type[9];
assign sfp_vl_pc_hit[10]     = sfp_sf_pc_hit[10] && entry_type[10];
assign sfp_vl_pc_hit[11]     = sfp_sf_pc_hit[11] && entry_type[11];

//read sp(including vsetvli)/bar low pc
// &CombBeg; @127
always @( entry_sf_pc_9[2:0]
       or entry_sf_pc_7[2:0]
       or entry_sf_pc_1[2:0]
       or entry_sf_pc_11[2:0]
       or entry_sf_pc_10[2:0]
       or entry_sf_pc_4[2:0]
       or sfp_sf_pc_hit_raw[11:0]
       or entry_sf_pc_6[2:0]
       or entry_sf_pc_2[2:0]
       or entry_sf_pc_5[2:0]
       or entry_sf_pc_3[2:0]
       or entry_sf_pc_8[2:0]
       or entry_sf_pc_0[2:0])
begin
case(sfp_sf_pc_hit_raw[11:0])
  12'b000000000001: sfp_fp_pc_lo[2:0] = entry_sf_pc_0[2:0];
  12'b000000000010: sfp_fp_pc_lo[2:0] = entry_sf_pc_1[2:0];
  12'b000000000100: sfp_fp_pc_lo[2:0] = entry_sf_pc_2[2:0];
  12'b000000001000: sfp_fp_pc_lo[2:0] = entry_sf_pc_3[2:0];
  12'b000000010000: sfp_fp_pc_lo[2:0] = entry_sf_pc_4[2:0];
  12'b000000100000: sfp_fp_pc_lo[2:0] = entry_sf_pc_5[2:0];
  12'b000001000000: sfp_fp_pc_lo[2:0] = entry_sf_pc_6[2:0];
  12'b000010000000: sfp_fp_pc_lo[2:0] = entry_sf_pc_7[2:0];
  12'b000100000000: sfp_fp_pc_lo[2:0] = entry_sf_pc_8[2:0];
  12'b001000000000: sfp_fp_pc_lo[2:0] = entry_sf_pc_9[2:0];
  12'b010000000000: sfp_fp_pc_lo[2:0] = entry_sf_pc_10[2:0];
  12'b100000000000: sfp_fp_pc_lo[2:0] = entry_sf_pc_11[2:0];
  default         : sfp_fp_pc_lo[2:0] = {3{1'bx}};
endcase
// &CombEnd; @143
end

// &CombBeg; @145
always @( entry_bar_pc_9[2:0]
       or entry_bar_pc_1[2:0]
       or entry_bar_pc_2[2:0]
       or entry_bar_pc_3[2:0]
       or entry_bar_pc_11[2:0]
       or entry_bar_pc_4[2:0]
       or entry_bar_pc_6[2:0]
       or sfp_bar_pc_hit[11:0]
       or entry_bar_pc_8[2:0]
       or entry_bar_pc_7[2:0]
       or entry_bar_pc_5[2:0]
       or entry_bar_pc_10[2:0]
       or entry_bar_pc_0[2:0])
begin
case(sfp_bar_pc_hit[11:0])
  12'b000000000001: sfp_bar_pc_lo[2:0] = entry_bar_pc_0[2:0];
  12'b000000000010: sfp_bar_pc_lo[2:0] = entry_bar_pc_1[2:0];
  12'b000000000100: sfp_bar_pc_lo[2:0] = entry_bar_pc_2[2:0];
  12'b000000001000: sfp_bar_pc_lo[2:0] = entry_bar_pc_3[2:0];
  12'b000000010000: sfp_bar_pc_lo[2:0] = entry_bar_pc_4[2:0];
  12'b000000100000: sfp_bar_pc_lo[2:0] = entry_bar_pc_5[2:0];
  12'b000001000000: sfp_bar_pc_lo[2:0] = entry_bar_pc_6[2:0];
  12'b000010000000: sfp_bar_pc_lo[2:0] = entry_bar_pc_7[2:0];
  12'b000100000000: sfp_bar_pc_lo[2:0] = entry_bar_pc_8[2:0];
  12'b001000000000: sfp_bar_pc_lo[2:0] = entry_bar_pc_9[2:0];
  12'b010000000000: sfp_bar_pc_lo[2:0] = entry_bar_pc_10[2:0];
  12'b100000000000: sfp_bar_pc_lo[2:0] = entry_bar_pc_11[2:0];
  default         : sfp_bar_pc_lo[2:0] = {3{1'bx}};
endcase
// &CombEnd; @161
end

assign sfp_vl_pred_en   = ~cp0_ifu_vsetvli_pred_disable && ~cp0_ifu_vsetvli_pred_mode;

//spec fail predictor hit
assign sfp_sf_hit       = (|sfp_sf_pc_hit[11:0]) && ~sfp_vl_hit_raw;
assign sfp_bar_hit      = |sfp_bar_pc_hit[11:0];
assign sfp_vl_hit_raw   = (|sfp_vl_pc_hit_raw[11:0]) && sfp_vl_pred_en;
assign sfp_vl_hit       = (|sfp_vl_pc_hit[11:0])     && sfp_vl_pred_en;

assign sfp_pc_hit       = sfp_vl_hit_raw 
                       || sfp_sf_hit && cp0_ifu_nsfe
                       || (sfp_rd_cur_state[1:0] == SF_RD ) && sfp_sf_hit  && cp0_ifu_nsfe
                       || (sfp_rd_cur_state[1:0] == BAR_RD) && sfp_bar_hit && cp0_ifu_nsfe;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sfp_rd_cur_state[1:0] <= SF_RD;
  else
    sfp_rd_cur_state[1:0] <= sfp_rd_next_state[1:0];
end

// &CombBeg; @184
always @( sfp_rd_cur_state[1:0]
       or sfp_bar_hit
       or sfp_sf_hit)
begin
case(sfp_rd_cur_state[1:0])
  SF_RD : if(sfp_sf_hit)
            sfp_rd_next_state[1:0] = BAR_RD;
          else
            sfp_rd_next_state[1:0] = SF_RD;
  BAR_RD : if(sfp_sf_hit)
            sfp_rd_next_state[1:0] = BAR_RD;
          else if(sfp_bar_hit)
            sfp_rd_next_state[1:0] = SF_RD;
          else
            sfp_rd_next_state[1:0] = BAR_RD;
  default : sfp_rd_next_state[1:0] = SF_RD;
endcase
// &CombEnd; @198
end


//read data
parameter SF     = 0;
parameter BAR    = 1; 
parameter VL     = 2;
parameter VL_RAW = 3;
assign sfp_hit_type[SF]     = sfp_sf_hit || sfp_rd_cur_state[1:0] == SF_RD;
assign sfp_hit_type[BAR]    = !sfp_sf_hit && sfp_bar_hit && (sfp_rd_cur_state[1:0] == BAR_RD);
assign sfp_hit_type[VL]     = sfp_vl_hit;
assign sfp_hit_type[VL_RAW] = sfp_vl_hit_raw;
assign sfp_hit_pc_lo[2:0]   = (sfp_sf_hit || sfp_rd_cur_state[1:0] == SF_RD || sfp_vl_hit_raw)  
                            ? sfp_fp_pc_lo[2:0]
                            : sfp_bar_pc_lo[2:0];
//output to ifdp
assign sfp_ifdp_pc_hit         = sfp_pc_hit;
assign sfp_ifdp_hit_type[3:0]  = sfp_hit_type[3:0];
assign sfp_ifdp_hit_pc_lo[2:0] = sfp_hit_pc_lo[2:0];

//==========================================================
//                 Spec Fail Predictor Write
//==========================================================
//write buffer maintainance
assign sfp_wr_buf_updt_vld = rtu_ifu_retire_inst0_no_spec_hit
                          || rtu_ifu_retire_inst1_no_spec_hit
                          || rtu_ifu_retire_inst2_no_spec_hit
                          || rtu_ifu_retire_inst0_no_spec_miss
                          || rtu_ifu_retire_inst1_no_spec_miss
                          || rtu_ifu_retire_inst2_no_spec_miss
                          || rtu_ifu_retire_inst0_no_spec_mispred
                          || rtu_ifu_retire_inst1_no_spec_mispred
                          || rtu_ifu_retire_inst2_no_spec_mispred
                          || rtu_ifu_retire_inst0_vl_pred
                          || rtu_ifu_retire_inst1_vl_pred
                          || rtu_ifu_retire_inst2_vl_pred
                          || rtu_ifu_retire_inst0_vl_miss;
assign sfp_inst0_updt_vld = rtu_ifu_retire_inst0_no_spec_hit
                         || rtu_ifu_retire_inst0_no_spec_miss
                         || rtu_ifu_retire_inst0_no_spec_mispred
                         || rtu_ifu_retire_inst0_vl_pred
                         || rtu_ifu_retire_inst0_vl_miss;
assign sfp_inst1_updt_vld = rtu_ifu_retire_inst1_no_spec_hit
                         || rtu_ifu_retire_inst1_no_spec_miss
                         || rtu_ifu_retire_inst1_no_spec_mispred
                         || rtu_ifu_retire_inst1_vl_pred; 
assign sfp_inst2_updt_vld = rtu_ifu_retire_inst2_no_spec_hit
                         || rtu_ifu_retire_inst2_no_spec_miss
                         || rtu_ifu_retire_inst2_no_spec_mispred
                         || rtu_ifu_retire_inst2_vl_pred; 
// &CombBeg; @248
always @( rtu_ifu_retire_inst0_vl_hit
       or rtu_ifu_retire_inst2_no_spec_miss
       or rtu_ifu_retire_inst0_no_spec_hit
       or rtu_ifu_retire_inst2_cur_pc[19:0]
       or rtu_ifu_retire_inst0_load
       or rtu_ifu_retire_inst1_vl_pred
       or rtu_ifu_retire_inst0_cur_pc[19:0]
       or rtu_ifu_retire_inst1_no_spec_miss
       or rtu_ifu_retire_inst0_vl_pred
       or rtu_ifu_retire_inst2_store
       or rtu_ifu_retire_inst2_load
       or sfp_inst0_updt_vld
       or rtu_ifu_retire_inst0_vl_miss
       or rtu_ifu_retire_inst0_vl_mispred
       or rtu_ifu_retire_inst2_vl_pred
       or sfp_inst1_updt_vld
       or rtu_ifu_retire_inst0_no_spec_mispred
       or rtu_ifu_retire_inst1_load
       or rtu_ifu_retire_inst2_no_spec_mispred
       or rtu_ifu_retire_inst1_store
       or rtu_ifu_retire_inst1_no_spec_mispred
       or rtu_ifu_retire_inst0_store
       or rtu_ifu_retire_inst1_no_spec_hit
       or sfp_inst2_updt_vld
       or rtu_ifu_retire_inst0_no_spec_miss
       or rtu_ifu_retire_inst1_cur_pc[19:0]
       or rtu_ifu_retire_inst2_no_spec_hit)
begin
casez({sfp_inst0_updt_vld,sfp_inst1_updt_vld,sfp_inst2_updt_vld})
  3'b1??: begin
    sfp_wr_buf_updt_type[2:0] = {rtu_ifu_retire_inst0_no_spec_hit  || rtu_ifu_retire_inst0_vl_hit,
                                 rtu_ifu_retire_inst0_no_spec_miss || rtu_ifu_retire_inst0_vl_miss,
                                 rtu_ifu_retire_inst0_no_spec_mispred||rtu_ifu_retire_inst0_vl_mispred};
    sfp_wr_buf_inst_type[2:0] = { rtu_ifu_retire_inst0_vl_pred || rtu_ifu_retire_inst0_vl_miss,
                                  rtu_ifu_retire_inst0_store,
                                  rtu_ifu_retire_inst0_load};
    sfp_wr_buf_updt_pc[19:0]  = rtu_ifu_retire_inst0_cur_pc[19:0];
  end
  3'b01?: begin
    sfp_wr_buf_updt_type[2:0] = {rtu_ifu_retire_inst1_no_spec_hit || rtu_ifu_retire_inst1_vl_pred,
                                 rtu_ifu_retire_inst1_no_spec_miss,
                                 rtu_ifu_retire_inst1_no_spec_mispred};
    sfp_wr_buf_inst_type[2:0] = {rtu_ifu_retire_inst0_vl_pred,
                                 rtu_ifu_retire_inst1_store,
                                 rtu_ifu_retire_inst1_load};
    sfp_wr_buf_updt_pc[19:0]  = rtu_ifu_retire_inst1_cur_pc[19:0];
  end
  3'b001: begin
    sfp_wr_buf_updt_type[2:0] = {rtu_ifu_retire_inst2_no_spec_hit || rtu_ifu_retire_inst2_vl_pred,
                                 rtu_ifu_retire_inst2_no_spec_miss,
                                 rtu_ifu_retire_inst2_no_spec_mispred};
    sfp_wr_buf_inst_type[2:0] = {rtu_ifu_retire_inst2_vl_pred,
                                 rtu_ifu_retire_inst2_store,
                                 rtu_ifu_retire_inst2_load};
    sfp_wr_buf_updt_pc[19:0]  = rtu_ifu_retire_inst2_cur_pc[19:0];
  end
  default: begin
    sfp_wr_buf_updt_type[2:0] = 3'b0;
    sfp_wr_buf_inst_type[2:0] = 3'b0;
    sfp_wr_buf_updt_pc[19:0]  = 20'b0;
  end
endcase
// &CombEnd; @283
end

// &Instance("gated_clk_cell","x_sfp_wr_buf_clk"); @285
gated_clk_cell  x_sfp_wr_buf_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sfp_wr_buf_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sfp_wr_buf_clk_en ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @286
//           .clk_out        (sfp_wr_buf_clk),//Out Clock @287
//           .external_en    (1'b0), @288
//           .global_en      (cp0_yy_clk_en), @289
//           .local_en       (sfp_wr_buf_clk_en),//Local Condition @290
//           .module_en      (cp0_ifu_icg_en) @291
//         ); @292
assign sfp_wr_buf_clk_en = sfp_wr_buf_updt_vld 
                        || wr_buf_updt_vld;

always @(posedge sfp_wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    wr_buf_updt_type_record[2:0] <= 3'b0;
    wr_buf_inst_type_record[2:0] <= 3'b0;
    wr_buf_updt_pc_record[19:0]  <= 20'b0;
  end
  else if(sfp_wr_buf_updt_vld)
  begin
    wr_buf_updt_type_record[2:0] <= sfp_wr_buf_updt_type[2:0];
    wr_buf_inst_type_record[2:0] <= sfp_wr_buf_inst_type[2:0];
    wr_buf_updt_pc_record[19:0]  <= sfp_wr_buf_updt_pc[19:0];
  end
  else
  begin
    wr_buf_updt_type_record[2:0] <= wr_buf_updt_type_record[2:0];
    wr_buf_inst_type_record[2:0] <= wr_buf_inst_type_record[2:0];
    wr_buf_updt_pc_record[19:0]  <= wr_buf_updt_pc_record[19:0];
  end
end

always @(posedge sfp_wr_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wr_buf_updt_vld <= 1'b0;
  else if(sfp_wr_buf_updt_vld)
    wr_buf_updt_vld <= 1'b1;
  else if(wr_buf_updt_vld)
    wr_buf_updt_vld <= 1'b0;
  else
    wr_buf_updt_vld <= wr_buf_updt_vld;
end


//sf address record
//for barrier inst update,use spec fail inst pc as index
//1. store hit
//2. store mispred
// &Instance("gated_clk_cell","x_sfp_sf_pc_clk"); @335
gated_clk_cell  x_sfp_sf_pc_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sfp_sf_pc_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sfp_sf_pc_clk_en  ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @336
//           .clk_out        (sfp_sf_pc_clk),//Out Clock @337
//           .external_en    (1'b0), @338
//           .global_en      (cp0_yy_clk_en), @339
//           .local_en       (sfp_sf_pc_clk_en),//Local Condition @340
//           .module_en      (cp0_ifu_icg_en) @341
//         ); @342
assign sfp_sf_pc_clk_en = sfp_inst0_updt_vld && rtu_ifu_retire_inst0_store
                       || sfp_inst1_updt_vld && rtu_ifu_retire_inst1_store
                       || sfp_inst2_updt_vld && rtu_ifu_retire_inst2_store;

always @(posedge sfp_sf_pc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sfp_sf_pc_record[16:0] <= 17'b0;
  else if(sfp_sf_pc_updt_vld)
    sfp_sf_pc_record[16:0] <= sfp_wr_buf_updt_pc[19:3];
 else
    sfp_sf_pc_record[16:0] <= sfp_sf_pc_record[16:0]; 
end


assign sfp_sf_pc_updt_vld = sfp_wr_buf_inst_type[1]; 

//write wbuf to sfp entry
assign entry_sf_pc_updt_bit  = wr_buf_updt_vld &&
                             (   wr_buf_inst_type_record[1] && wr_buf_updt_type_record[1] 
                              || wr_buf_inst_type_record[1] && wr_buf_updt_type_record[0]
                              || wr_buf_inst_type_record[2] && wr_buf_updt_type_record[1]);
assign entry_bar_pc_updt_bit = wr_buf_updt_vld &&
                              (   wr_buf_inst_type_record[0] && wr_buf_updt_type_record[1]
                               || wr_buf_inst_type_record[0] && wr_buf_updt_type_record[0]);

//st mispred: cnt:clear to zero
//ld miss   : cnt:2'b1
//ld mispred: entry hit: cnt-1
//ld hit    : cnt +1                               
assign entry_cnt_updt_bit    = wr_buf_updt_vld &&
                                  (wr_buf_inst_type_record[1] && wr_buf_updt_type_record[0]
                                || wr_buf_inst_type_record[2]
                                || wr_buf_inst_type_record[0] && wr_buf_updt_type_record[2]
                                || wr_buf_inst_type_record[0] && wr_buf_updt_type_record[1]
                                || wr_buf_inst_type_record[0] && wr_buf_updt_type_record[0]);

//update data
//entry hit:
//1. st miss    : use fifo bit
//2. st mispred : use st pc
//4. ld hit     : use st entry
//5. ld mispred : use st entry
//6. ld miss    : use st entry 
assign wr_buf_hit_sf_pc[0]  = ({entry_hi_pc_0[7:0] ,entry_sf_pc_0[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[1]  = ({entry_hi_pc_1[7:0] ,entry_sf_pc_1[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[2]  = ({entry_hi_pc_2[7:0] ,entry_sf_pc_2[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[3]  = ({entry_hi_pc_3[7:0] ,entry_sf_pc_3[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[4]  = ({entry_hi_pc_4[7:0] ,entry_sf_pc_4[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[5]  = ({entry_hi_pc_5[7:0] ,entry_sf_pc_5[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[6]  = ({entry_hi_pc_6[7:0] ,entry_sf_pc_6[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[7]  = ({entry_hi_pc_7[7:0] ,entry_sf_pc_7[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[8]  = ({entry_hi_pc_8[7:0] ,entry_sf_pc_8[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[9]  = ({entry_hi_pc_9[7:0] ,entry_sf_pc_9[11:3]}  == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[10] = ({entry_hi_pc_10[7:0],entry_sf_pc_10[11:3]} == wr_buf_updt_pc_record[19:3]);
assign wr_buf_hit_sf_pc[11] = ({entry_hi_pc_11[7:0],entry_sf_pc_11[11:3]} == wr_buf_updt_pc_record[19:3]);

//sf pc record hit
assign sf_pc_hit_sf_pc[0]  = ({entry_hi_pc_0[7:0] ,entry_sf_pc_0[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[1]  = ({entry_hi_pc_1[7:0] ,entry_sf_pc_1[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[2]  = ({entry_hi_pc_2[7:0] ,entry_sf_pc_2[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[3]  = ({entry_hi_pc_3[7:0] ,entry_sf_pc_3[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[4]  = ({entry_hi_pc_4[7:0] ,entry_sf_pc_4[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[5]  = ({entry_hi_pc_5[7:0] ,entry_sf_pc_5[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[6]  = ({entry_hi_pc_6[7:0] ,entry_sf_pc_6[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[7]  = ({entry_hi_pc_7[7:0] ,entry_sf_pc_7[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[8]  = ({entry_hi_pc_8[7:0] ,entry_sf_pc_8[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[9]  = ({entry_hi_pc_9[7:0] ,entry_sf_pc_9[11:3]}  == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[10] = ({entry_hi_pc_10[7:0],entry_sf_pc_10[11:3]} == sfp_sf_pc_record[16:0]);
assign sf_pc_hit_sf_pc[11] = ({entry_hi_pc_11[7:0],entry_sf_pc_11[11:3]} == sfp_sf_pc_record[16:0]);

//create entry select
//store miss
assign sfp_wr_fifo_select   = wr_buf_updt_type_record[1] 
                           && (|wr_buf_inst_type_record[2:1])
                           && wr_buf_updt_vld 
                           && !(|wr_buf_hit_sf_pc[11:0]); 

//store mispred
//store miss && entry hit
assign sfp_wr_sf_pc_select  = wr_buf_updt_type_record[0] && wr_buf_inst_type_record[1] && wr_buf_updt_vld
                           || wr_buf_updt_type_record[1] && wr_buf_inst_type_record[1] && wr_buf_updt_vld && (|wr_buf_hit_sf_pc[11:0])
                           || wr_buf_inst_type_record[2] && wr_buf_updt_vld && (|wr_buf_hit_sf_pc[11:0]);

//load inst
assign sfp_wr_record_select = wr_buf_inst_type_record[0] && wr_buf_updt_vld;


// &CombBeg; @431
always @( wr_buf_hit_sf_pc[11:0]
       or sfp_wr_record_select
       or sfp_wr_fifo_select
       or sfp_wr_sf_pc_select
       or sf_pc_hit_sf_pc[11:0]
       or sfp_entry_fifo[11:0])
begin
case({sfp_wr_fifo_select,sfp_wr_sf_pc_select,sfp_wr_record_select})
  3'b100: entry_write_en[11:0] = sfp_entry_fifo[11:0];
  3'b010: entry_write_en[11:0] = wr_buf_hit_sf_pc[11:0];
  3'b001: entry_write_en[11:0] = sf_pc_hit_sf_pc[11:0];
  default: entry_write_en[11:0] = 12'b0;
endcase
// &CombEnd; @438
end

//for timing consideration,simply gateclk en
assign sfp_wr_fifo_select_for_gate   = wr_buf_updt_type_record[1] 
                                    && (|wr_buf_inst_type_record[2:1])
                                    && wr_buf_updt_vld;

assign sfp_wr_sf_pc_select_for_gate  = wr_buf_updt_type_record[0] 
                                       && wr_buf_inst_type_record[1] 
                                       && wr_buf_updt_vld
                                    || wr_buf_updt_type_record[1] 
                                       && wr_buf_inst_type_record[1] 
                                       && wr_buf_updt_vld
                                    || wr_buf_inst_type_record[2] 
                                       && wr_buf_updt_vld;                           
assign sfp_wr_record_select_for_gate = sfp_wr_record_select;

assign entry_clk_en[11:0] =
   {12{sfp_wr_fifo_select_for_gate}}   & sfp_entry_fifo[11:0]
 | {12{sfp_wr_sf_pc_select_for_gate}}  & wr_buf_hit_sf_pc[11:0]
 | {12{sfp_wr_record_select_for_gate}} & sf_pc_hit_sf_pc[11:0];


//read cnt for use
assign entry_write_data[24]   = wr_buf_inst_type_record[2];
assign entry_write_data[23:4] = wr_buf_updt_pc_record[19:0];
assign entry_write_data[3:0]  = {wr_buf_inst_type_record[1] && wr_buf_updt_type_record[0], //st mispred
                                 (wr_buf_inst_type_record[2] || wr_buf_inst_type_record[0]) && wr_buf_updt_type_record[2], //ld/vl hit
                                 (wr_buf_inst_type_record[2] || wr_buf_inst_type_record[0]) && wr_buf_updt_type_record[1], //ld/vl miss
                                 (wr_buf_inst_type_record[2] || wr_buf_inst_type_record[0]) && wr_buf_updt_type_record[0]  //ld/vl mispred
                                };


//==========================================================
//                 FIFO   BIT
//==========================================================
// &Instance("gated_clk_cell", "x_sfp_fifo_clk"); @474
gated_clk_cell  x_sfp_fifo_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (sfp_fifo_create_clk),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (sfp_fifo_en        ),
  .module_en           (cp0_ifu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @475
//          .external_en (1'b0), @476
//          .global_en   (cp0_yy_clk_en), @477
//          .module_en   (cp0_ifu_icg_en), @478
//          .local_en    (sfp_fifo_en), @479
//          .clk_out     (sfp_fifo_create_clk) @480
//         ); @481
//only load miss will trigger fifo update
assign sfp_fifo_en = wr_buf_inst_type_record[0] && wr_buf_updt_type_record[1] && wr_buf_updt_vld;


always @(posedge sfp_fifo_create_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sfp_entry_fifo[11:0] <= 12'b1;
  else if(sfp_fifo_en)
    sfp_entry_fifo[11:0] <= {sfp_entry_fifo[10:0],sfp_entry_fifo[11]};
  else
    sfp_entry_fifo[11:0] <= sfp_entry_fifo[11:0];
end

//==========================================================
//                 Entry Maintanance
//==========================================================
// &ConnRule(s/_x$/[0]/); @499
// &ConnRule(s/_v$/_0/); @500
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_0"); @501
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_0 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_0       ),
  .entry_clk_en_x        (entry_clk_en[0]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_0          ),
  .entry_hi_pc_v         (entry_hi_pc_0        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_0        ),
  .entry_type_x          (entry_type[0]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[0]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[1]/); @503
// &ConnRule(s/_v$/_1/); @504
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_1"); @505
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_1 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_1       ),
  .entry_clk_en_x        (entry_clk_en[1]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_1          ),
  .entry_hi_pc_v         (entry_hi_pc_1        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_1        ),
  .entry_type_x          (entry_type[1]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[1]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[2]/); @507
// &ConnRule(s/_v$/_2/); @508
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_2"); @509
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_2 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_2       ),
  .entry_clk_en_x        (entry_clk_en[2]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_2          ),
  .entry_hi_pc_v         (entry_hi_pc_2        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_2        ),
  .entry_type_x          (entry_type[2]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[2]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[3]/); @511
// &ConnRule(s/_v$/_3/); @512
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_3"); @513
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_3 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_3       ),
  .entry_clk_en_x        (entry_clk_en[3]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_3          ),
  .entry_hi_pc_v         (entry_hi_pc_3        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_3        ),
  .entry_type_x          (entry_type[3]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[3]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[4]/); @515
// &ConnRule(s/_v$/_4/); @516
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_4"); @517
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_4 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_4       ),
  .entry_clk_en_x        (entry_clk_en[4]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_4          ),
  .entry_hi_pc_v         (entry_hi_pc_4        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_4        ),
  .entry_type_x          (entry_type[4]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[4]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[5]/); @519
// &ConnRule(s/_v$/_5/); @520
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_5"); @521
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_5 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_5       ),
  .entry_clk_en_x        (entry_clk_en[5]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_5          ),
  .entry_hi_pc_v         (entry_hi_pc_5        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_5        ),
  .entry_type_x          (entry_type[5]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[5]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[6]/); @523
// &ConnRule(s/_v$/_6/); @524
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_6"); @525
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_6 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_6       ),
  .entry_clk_en_x        (entry_clk_en[6]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_6          ),
  .entry_hi_pc_v         (entry_hi_pc_6        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_6        ),
  .entry_type_x          (entry_type[6]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[6]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[7]/); @527
// &ConnRule(s/_v$/_7/); @528
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_7"); @529
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_7 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_7       ),
  .entry_clk_en_x        (entry_clk_en[7]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_7          ),
  .entry_hi_pc_v         (entry_hi_pc_7        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_7        ),
  .entry_type_x          (entry_type[7]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[7]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[8]/); @531
// &ConnRule(s/_v$/_8/); @532
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_8"); @533
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_8 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_8       ),
  .entry_clk_en_x        (entry_clk_en[8]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_8          ),
  .entry_hi_pc_v         (entry_hi_pc_8        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_8        ),
  .entry_type_x          (entry_type[8]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[8]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[9]/); @535
// &ConnRule(s/_v$/_9/); @536
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_9"); @537
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_9 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_9       ),
  .entry_clk_en_x        (entry_clk_en[9]      ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_9          ),
  .entry_hi_pc_v         (entry_hi_pc_9        ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_9        ),
  .entry_type_x          (entry_type[9]        ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[9]    ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[10]/); @539
// &ConnRule(s/_v$/_10/); @540
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_10"); @541
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_10 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_10      ),
  .entry_clk_en_x        (entry_clk_en[10]     ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_10         ),
  .entry_hi_pc_v         (entry_hi_pc_10       ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_10       ),
  .entry_type_x          (entry_type[10]       ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[10]   ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ConnRule(s/_x$/[11]/); @543
// &ConnRule(s/_v$/_11/); @544
// &Instance("ct_ifu_sfp_entry","x_ct_ifu_sfp_entry_11"); @545
ct_ifu_sfp_entry  x_ct_ifu_sfp_entry_11 (
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_ifu_nsfe          (cp0_ifu_nsfe         ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .entry_bar_pc_updt_bit (entry_bar_pc_updt_bit),
  .entry_bar_pc_v        (entry_bar_pc_11      ),
  .entry_clk_en_x        (entry_clk_en[11]     ),
  .entry_cnt_updt_bit    (entry_cnt_updt_bit   ),
  .entry_cnt_v           (entry_cnt_11         ),
  .entry_hi_pc_v         (entry_hi_pc_11       ),
  .entry_sf_pc_updt_bit  (entry_sf_pc_updt_bit ),
  .entry_sf_pc_v         (entry_sf_pc_11       ),
  .entry_type_x          (entry_type[11]       ),
  .entry_write_data      (entry_write_data     ),
  .entry_write_en_x      (entry_write_en[11]   ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rtu_ifu_chgflw_vld    (rtu_ifu_chgflw_vld   ),
  .sfp_vl_pred_en        (sfp_vl_pred_en       )
);


// &ModuleEnd; @547
endmodule


