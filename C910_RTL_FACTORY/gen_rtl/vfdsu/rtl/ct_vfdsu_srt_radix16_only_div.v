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
module ct_vfdsu_srt_radix16_only_div(
  cpurst_b,
  initial_divisor_in,
  initial_remainder_in,
  initial_srt_en,
  last_sel_bit,
  qt_clk,
  srt_div_clk,
  srt_divisor_borrowed_val,
  srt_divisor_flop_borrow_in,
  srt_divisor_flop_borrow_vld,
  srt_qt_flop_borrow_in_0,
  srt_qt_flop_borrow_in_1,
  srt_qt_flop_borrow_vld,
  srt_qt_flop_borrowed_val_0,
  srt_qt_flop_borrowed_val_1,
  srt_rem_clk,
  srt_remainder_borrowed_val,
  srt_remainder_flop_borrow_in,
  srt_remainder_flop_borrow_vld,
  srt_remainder_neg,
  srt_remainder_out,
  srt_remainder_pos,
  srt_remainder_zero,
  srt_sm_on,
  total_qt_rt,
  total_qt_rt_minus
);

// &Ports; @23
input           cpurst_b;                     
input   [65:0]  initial_divisor_in;           
input   [70:0]  initial_remainder_in;         
input           initial_srt_en;               
input   [3 :0]  last_sel_bit;                 
input           qt_clk;                       
input           srt_div_clk;                  
input   [65:0]  srt_divisor_flop_borrow_in;   
input           srt_divisor_flop_borrow_vld;  
input   [63:0]  srt_qt_flop_borrow_in_0;      
input   [63:0]  srt_qt_flop_borrow_in_1;      
input           srt_qt_flop_borrow_vld;       
input           srt_rem_clk;                  
input   [65:0]  srt_remainder_flop_borrow_in; 
input           srt_remainder_flop_borrow_vld; 
input           srt_sm_on;                    
output  [65:0]  srt_divisor_borrowed_val;     
output  [67:0]  srt_qt_flop_borrowed_val_0;   
output  [67:0]  srt_qt_flop_borrowed_val_1;   
output  [65:0]  srt_remainder_borrowed_val;   
output  [70:0]  srt_remainder_neg;            
output  [70:0]  srt_remainder_out;            
output  [70:0]  srt_remainder_pos;            
output          srt_remainder_zero;           
output  [67:0]  total_qt_rt;                  
output  [67:0]  total_qt_rt_minus;            

// &Regs; @24
reg     [70:0]  cur_rem;                      
reg     [67:0]  qt_rt_const_shift_std;        
reg     [70:0]  rem_neg_nxt_0;                
reg     [70:0]  rem_neg_nxt_1;                
reg     [70:0]  rem_neg_nxt_2;                
reg     [70:0]  rem_neg_nxt_3;                
reg     [70:0]  rem_neg_nxt_4;                
reg     [70:0]  rem_neg_nxt_5;                
reg     [70:0]  rem_neg_nxt_6;                
reg     [70:0]  rem_neg_nxt_7;                
reg     [70:0]  rem_neg_nxt_8;                
reg     [70:0]  rem_neg_nxt_9;                
reg     [70:0]  rem_pos_nxt_0;                
reg     [70:0]  rem_pos_nxt_1;                
reg     [70:0]  rem_pos_nxt_2;                
reg     [70:0]  rem_pos_nxt_3;                
reg     [70:0]  rem_pos_nxt_4;                
reg     [70:0]  rem_pos_nxt_5;                
reg     [70:0]  rem_pos_nxt_6;                
reg     [70:0]  rem_pos_nxt_7;                
reg     [70:0]  rem_pos_nxt_8;                
reg     [70:0]  rem_pos_nxt_9;                
reg     [65:0]  srt_divisor;                  
reg     [70:0]  srt_remainder;                
reg     [70:0]  srt_remainder_minus;          
reg     [70:0]  srt_remainder_minus_nxt;      
reg     [70:0]  srt_remainder_neg;            
reg     [70:0]  srt_remainder_neg_nxt;        
reg     [70:0]  srt_remainder_pos;            
reg     [70:0]  srt_remainder_pos_nxt;        
reg     [67:0]  total_qt_rt;                  
reg     [67:0]  total_qt_rt_minus;            
reg     [67:0]  total_qt_rt_minus_next;       
reg     [67:0]  total_qt_rt_next;             

// &Wires; @25
wire            bound1_cmp_sign;              
wire            bound2_cmp_sign;              
wire            bound3_cmp_sign;              
wire            bound4_cmp_sign;              
wire            bound5_cmp_sign;              
wire            bound6_cmp_sign;              
wire            bound7_cmp_sign;              
wire            bound8_cmp_sign;              
wire            bound9_cmp_sign;              
wire    [8 :0]  bound_cmp_sign;               
wire    [6 :0]  bound_sel;                    
wire            cpurst_b;                     
wire    [70:0]  cur_rem_1;                    
wire    [70:0]  cur_rem_2;                    
wire    [70:0]  cur_rem_3;                    
wire    [70:0]  cur_rem_4;                    
wire    [70:0]  cur_rem_5;                    
wire    [70:0]  cur_rem_6;                    
wire    [70:0]  cur_rem_7;                    
wire    [70:0]  cur_rem_8;                    
wire    [70:0]  cur_rem_9;                    
wire    [11:0]  digit_bound_1;                
wire    [11:0]  digit_bound_2;                
wire    [11:0]  digit_bound_3;                
wire    [11:0]  digit_bound_4;                
wire    [11:0]  digit_bound_5;                
wire    [11:0]  digit_bound_6;                
wire    [11:0]  digit_bound_7;                
wire    [11:0]  digit_bound_8;                
wire    [11:0]  digit_bound_9;                
wire    [70:0]  div_qt_1_rem_add_op1;         
wire    [70:0]  div_qt_2_rem_add_op1;         
wire    [70:0]  div_qt_3_rem_add_op1_0;       
wire    [70:0]  div_qt_3_rem_add_op1_1;       
wire    [70:0]  div_qt_4_rem_add_op1;         
wire    [70:0]  div_qt_5_rem_add_op1_0;       
wire    [70:0]  div_qt_5_rem_add_op1_1;       
wire    [70:0]  div_qt_6_rem_add_op1_0;       
wire    [70:0]  div_qt_6_rem_add_op1_1;       
wire    [70:0]  div_qt_7_rem_add_op1_0;       
wire    [70:0]  div_qt_7_rem_add_op1_1;       
wire    [70:0]  div_qt_8_rem_add_op1;         
wire    [70:0]  div_qt_9_rem_add_op1_0;       
wire    [70:0]  div_qt_9_rem_add_op1_1;       
wire    [70:0]  div_qt_r1_rem_add_op1;        
wire    [70:0]  div_qt_r2_rem_add_op1;        
wire    [70:0]  div_qt_r3_rem_add_op1_0;      
wire    [70:0]  div_qt_r3_rem_add_op1_1;      
wire    [70:0]  div_qt_r4_rem_add_op1;        
wire    [70:0]  div_qt_r5_rem_add_op1_0;      
wire    [70:0]  div_qt_r5_rem_add_op1_1;      
wire    [70:0]  div_qt_r6_rem_add_op1_0;      
wire    [70:0]  div_qt_r6_rem_add_op1_1;      
wire    [70:0]  div_qt_r7_rem_add_op1_0;      
wire    [70:0]  div_qt_r7_rem_add_op1_1;      
wire    [70:0]  div_qt_r8_rem_add_op1;        
wire    [70:0]  div_qt_r9_rem_add_op1_0;      
wire    [70:0]  div_qt_r9_rem_add_op1_1;      
wire    [70:0]  div_rem_add1_op1;             
wire    [70:0]  div_rem_add2_op1;             
wire    [70:0]  div_rem_add3_op1_0;           
wire    [70:0]  div_rem_add3_op1_1;           
wire    [70:0]  div_rem_add4_op1;             
wire    [70:0]  div_rem_add5_op1_0;           
wire    [70:0]  div_rem_add5_op1_1;           
wire    [70:0]  div_rem_add6_op1_0;           
wire    [70:0]  div_rem_add6_op1_1;           
wire    [70:0]  div_rem_add7_op1_0;           
wire    [70:0]  div_rem_add7_op1_1;           
wire    [70:0]  div_rem_add8_op1;             
wire    [70:0]  div_rem_add9_op1_0;           
wire    [70:0]  div_rem_add9_op1_1;           
wire    [65:0]  initial_divisor_in;           
wire    [70:0]  initial_remainder_in;         
wire            initial_srt_en;               
wire    [3 :0]  last_sel_bit;                 
wire    [11:0]  part_rem;                     
wire            qt_clk;                       
wire    [70:0]  qt_rt_const_q1;               
wire    [70:0]  qt_rt_const_q10;              
wire    [70:0]  qt_rt_const_q11;              
wire    [70:0]  qt_rt_const_q12;              
wire    [70:0]  qt_rt_const_q13;              
wire    [70:0]  qt_rt_const_q14;              
wire    [70:0]  qt_rt_const_q15;              
wire    [70:0]  qt_rt_const_q2;               
wire    [70:0]  qt_rt_const_q3;               
wire    [70:0]  qt_rt_const_q4;               
wire    [70:0]  qt_rt_const_q5;               
wire    [70:0]  qt_rt_const_q6;               
wire    [70:0]  qt_rt_const_q7;               
wire    [70:0]  qt_rt_const_q8;               
wire    [70:0]  qt_rt_const_q9;               
wire    [67:0]  qt_rt_const_shift_std_next;   
wire    [70:0]  rem_add1_op1;                 
wire    [70:0]  rem_add2_op1;                 
wire    [70:0]  rem_add3_op1_0;               
wire    [70:0]  rem_add3_op1_1;               
wire    [70:0]  rem_add4_op1;                 
wire    [70:0]  rem_add5_op1_0;               
wire    [70:0]  rem_add5_op1_1;               
wire    [70:0]  rem_add6_op1_0;               
wire    [70:0]  rem_add6_op1_1;               
wire    [70:0]  rem_add7_op1_0;               
wire    [70:0]  rem_add7_op1_1;               
wire    [70:0]  rem_add8_op1;                 
wire    [70:0]  rem_add9_op1_0;               
wire    [70:0]  rem_add9_op1_1;               
wire    [70:0]  rem_minus_minus_4;            
wire    [70:0]  rem_minus_minus_6;            
wire            rem_sign;                     
wire    [70:0]  remainder_minus_nor_nxt_0;    
wire    [70:0]  remainder_minus_nor_nxt_1;    
wire    [70:0]  remainder_minus_nor_nxt_2;    
wire    [70:0]  remainder_minus_nor_nxt_3;    
wire    [70:0]  remainder_minus_nor_nxt_4;    
wire    [70:0]  remainder_minus_nor_nxt_5;    
wire    [70:0]  remainder_minus_nor_nxt_6;    
wire    [70:0]  remainder_minus_nor_nxt_7;    
wire    [70:0]  remainder_minus_nor_nxt_8;    
wire    [70:0]  remainder_minus_nor_nxt_9;    
wire    [70:0]  remainder_minus_shift;        
wire    [70:0]  remainder_shift;              
wire            srt_div_clk;                  
wire    [65:0]  srt_divisor_borrowed_val;     
wire    [65:0]  srt_divisor_flop_borrow_in;   
wire            srt_divisor_flop_borrow_vld;  
wire    [63:0]  srt_qt_flop_borrow_in_0;      
wire    [63:0]  srt_qt_flop_borrow_in_1;      
wire            srt_qt_flop_borrow_vld;       
wire    [67:0]  srt_qt_flop_borrowed_val_0;   
wire    [67:0]  srt_qt_flop_borrowed_val_1;   
wire            srt_rem_clk;                  
wire    [65:0]  srt_remainder_borrowed_val;   
wire    [65:0]  srt_remainder_flop_borrow_in; 
wire            srt_remainder_flop_borrow_vld; 
wire    [70:0]  srt_remainder_nxt;            
wire    [70:0]  srt_remainder_out;            
wire            srt_remainder_zero;           
wire            srt_sm_on;                    
wire    [67:0]  total_qt_rt_cur_0;            
wire    [67:0]  total_qt_rt_cur_1;            
wire    [67:0]  total_qt_rt_cur_2;            
wire    [67:0]  total_qt_rt_cur_3;            
wire    [67:0]  total_qt_rt_cur_4;            
wire    [67:0]  total_qt_rt_cur_5;            
wire    [67:0]  total_qt_rt_cur_6;            
wire    [67:0]  total_qt_rt_cur_7;            
wire    [67:0]  total_qt_rt_cur_8;            
wire    [67:0]  total_qt_rt_cur_9;            
wire    [67:0]  total_qt_rt_cur_m1;           
wire    [67:0]  total_qt_rt_cur_m10;          
wire    [67:0]  total_qt_rt_cur_m2;           
wire    [67:0]  total_qt_rt_cur_m3;           
wire    [67:0]  total_qt_rt_cur_m4;           
wire    [67:0]  total_qt_rt_cur_m5;           
wire    [67:0]  total_qt_rt_cur_m6;           
wire    [67:0]  total_qt_rt_cur_m7;           
wire    [67:0]  total_qt_rt_cur_m8;           
wire    [67:0]  total_qt_rt_cur_m9;           


parameter  DATA_WIDTH = 66;
parameter  QT_WIDTH   = 68;
parameter  REM_WIDTH  = 71;
//==========================================================
//    SRT Remainder & Divisor for Quotient/Root Generate
//==========================================================

always @(posedge srt_rem_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    srt_remainder[REM_WIDTH-1:0] <= {REM_WIDTH{1'b0}};
  else if(srt_remainder_flop_borrow_vld)
    srt_remainder[REM_WIDTH-1:0] <= {5'b0,srt_remainder_flop_borrow_in[DATA_WIDTH-1:0]};
  else if(initial_srt_en)
    srt_remainder[REM_WIDTH-1:0] <= initial_remainder_in[REM_WIDTH-1:0];
  else if(srt_sm_on)
    srt_remainder[REM_WIDTH-1:0] <= srt_remainder_nxt[REM_WIDTH-1:0];
  else
    srt_remainder[REM_WIDTH-1:0] <= srt_remainder[REM_WIDTH-1:0];
end
assign srt_remainder_borrowed_val[DATA_WIDTH-1:0] = srt_remainder[DATA_WIDTH-1:0];
assign srt_remainder_out[REM_WIDTH-1:0]           = srt_remainder_pos[REM_WIDTH-1:0];
// //&Force("output","srt_remainder"); @49
always @(posedge srt_rem_clk or negedge cpurst_b)
begin
  if(!cpurst_b)begin
    srt_remainder_pos[REM_WIDTH-1:0]    <= {REM_WIDTH{1'b0}};
    srt_remainder_neg[REM_WIDTH-1:0]    <= {REM_WIDTH{1'b0}};
    srt_remainder_minus[REM_WIDTH-1:0]  <= {REM_WIDTH{1'b0}};
  end
  else if(srt_sm_on)begin
    srt_remainder_pos[REM_WIDTH-1:0]    <= srt_remainder_pos_nxt[REM_WIDTH-1:0];
    srt_remainder_neg[REM_WIDTH-1:0]    <= srt_remainder_neg_nxt[REM_WIDTH-1:0];
    srt_remainder_minus[REM_WIDTH-1:0]  <= srt_remainder_minus_nxt[REM_WIDTH-1:0];
  end
  else begin
    srt_remainder_pos[REM_WIDTH-1:0]    <= srt_remainder_pos[REM_WIDTH-1:0];
    srt_remainder_neg[REM_WIDTH-1:0]    <= srt_remainder_neg[REM_WIDTH-1:0];
    srt_remainder_minus[REM_WIDTH-1:0]  <= srt_remainder_minus[REM_WIDTH-1:0];
  end
end
// &Force("output","srt_remainder_pos"); @68
// &Force("output","srt_remainder_neg"); @69

always @(posedge srt_div_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    srt_divisor[DATA_WIDTH-1:0] <= {DATA_WIDTH{1'b0}};
  else if(srt_divisor_flop_borrow_vld)
    srt_divisor[DATA_WIDTH-1:0] <= srt_divisor_flop_borrow_in[DATA_WIDTH-1:0];
  else if(initial_srt_en)
    srt_divisor[DATA_WIDTH-1:0] <= initial_divisor_in[DATA_WIDTH-1:0];
  else
    srt_divisor[DATA_WIDTH-1:0] <= srt_divisor[DATA_WIDTH-1:0];
end
assign srt_divisor_borrowed_val[DATA_WIDTH-1:0] = srt_divisor[DATA_WIDTH-1:0];
always @(posedge qt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    qt_rt_const_shift_std[QT_WIDTH-1:0]   <= {QT_WIDTH{1'b0}};
    total_qt_rt[QT_WIDTH-1:0]           <= {QT_WIDTH{1'b0}};
    total_qt_rt_minus[QT_WIDTH-1:0]     <= {QT_WIDTH{1'b0}};
  end
  else if(srt_qt_flop_borrow_vld)
  begin
    qt_rt_const_shift_std[QT_WIDTH-1:0] <= {4'b0,srt_qt_flop_borrow_in_1[QT_WIDTH-5:0]};
    total_qt_rt[QT_WIDTH-1:0]           <= {4'b0,srt_qt_flop_borrow_in_0[QT_WIDTH-5:0]};
    total_qt_rt_minus[QT_WIDTH-1:0]     <= total_qt_rt_minus[QT_WIDTH-1:0];
  end
  else if(initial_srt_en)
  begin
    qt_rt_const_shift_std[QT_WIDTH-1:0] <= {4'b0001,{(QT_WIDTH-4){1'b0}}};
    total_qt_rt[QT_WIDTH-1:0]           <= {QT_WIDTH{1'b0}};
    total_qt_rt_minus[QT_WIDTH-1:0]     <= {QT_WIDTH{1'b0}};
  end
  else if(srt_sm_on)
  begin
    qt_rt_const_shift_std[QT_WIDTH-1:0] <= qt_rt_const_shift_std_next[QT_WIDTH-1:0];
    total_qt_rt[QT_WIDTH-1:0]           <= total_qt_rt_next[QT_WIDTH-1:0];
    total_qt_rt_minus[QT_WIDTH-1:0]     <= total_qt_rt_minus_next[QT_WIDTH-1:0];
  end
  else
  begin
    qt_rt_const_shift_std[QT_WIDTH-1:0] <= qt_rt_const_shift_std[QT_WIDTH-1:0];
    total_qt_rt[QT_WIDTH-1:0]           <= total_qt_rt[QT_WIDTH-1:0];
    total_qt_rt_minus[QT_WIDTH-1:0]     <= total_qt_rt_minus[QT_WIDTH-1:0];
  end
end
assign srt_qt_flop_borrowed_val_1[QT_WIDTH-1:0] = qt_rt_const_shift_std[QT_WIDTH-1:0];
assign srt_qt_flop_borrowed_val_0[QT_WIDTH-1:0] = total_qt_rt[QT_WIDTH-1:0];
// &Force("output","total_qt_rt"); @118
// &Force("output","total_qt_rt_minus"); @119
assign qt_rt_const_shift_std_next[QT_WIDTH-1:0] = {4'b0, qt_rt_const_shift_std[QT_WIDTH-1:4]};

//====================================================
//  boundary  calculation
//====================================================
assign bound_sel[6:0]   = srt_divisor[DATA_WIDTH-1:DATA_WIDTH-7];

// &Instance("ct_vfdsu_srt_radix16_bound_table"); @127
ct_vfdsu_srt_radix16_bound_table  x_ct_vfdsu_srt_radix16_bound_table (
  .bound_sel            (bound_sel           ),
  .digit_bound_1        (digit_bound_1       ),
  .digit_bound_2        (digit_bound_2       ),
  .digit_bound_3        (digit_bound_3       ),
  .digit_bound_4        (digit_bound_4       ),
  .digit_bound_5        (digit_bound_5       ),
  .digit_bound_6        (digit_bound_6       ),
  .digit_bound_7        (digit_bound_7       ),
  .digit_bound_8        (digit_bound_8       ),
  .digit_bound_9        (digit_bound_9       ),
  .sqrt_first_round     (1'b0                ),
  .sqrt_secd_round      (1'b0                ),
  .sqrt_secd_round_sign (1'b0                )
);

// &Connect(.sqrt_secd_round_sign(1'b0)); @128
// &Connect(.sqrt_first_round(1'b0)); @129
// &Connect(.sqrt_secd_round(1'b0)); @130

assign rem_sign                = srt_remainder[REM_WIDTH-1];
assign part_rem[11:0]          = rem_sign
                                 ? ~srt_remainder[REM_WIDTH-5:REM_WIDTH-16]
                                 : srt_remainder[REM_WIDTH-5:REM_WIDTH-16];
// &Force("nonport","bound1_cmp_result");  @136
// &Force("nonport","bound2_cmp_result");                                @137
// &Force("nonport","bound3_cmp_result");                                @138
// &Force("nonport","bound4_cmp_result");                                @139
// &Force("nonport","bound5_cmp_result");                                @140
// &Force("nonport","bound6_cmp_result");                                @141
// &Force("nonport","bound7_cmp_result");                                @142
// &Force("nonport","bound8_cmp_result");                                @143
// &Force("nonport","bound9_cmp_result");                                @144
// &Force("bus","bound1_cmp_result",11,0); @145
// &Force("bus","bound2_cmp_result",11,0); @146
// &Force("bus","bound3_cmp_result",11,0); @147
// &Force("bus","bound4_cmp_result",11,0); @148
// &Force("bus","bound5_cmp_result",11,0); @149
// &Force("bus","bound6_cmp_result",11,0); @150
// &Force("bus","bound7_cmp_result",11,0); @151
// &Force("bus","bound8_cmp_result",11,0); @152
// &Force("bus","bound9_cmp_result",11,0); @153
// &Force("nonport","digit_bound_1"); @154
// &Force("nonport","digit_bound_2"); @155
// &Force("nonport","digit_bound_3"); @156
// &Force("nonport","digit_bound_4"); @157
// &Force("nonport","digit_bound_5"); @158
// &Force("nonport","digit_bound_6"); @159
// &Force("nonport","digit_bound_7"); @160
// &Force("nonport","digit_bound_8"); @161
// &Force("nonport","digit_bound_9"); @162
// &Force("nonport","part_rem"); @163
////csky vperl_off                                 
//assign bound1_cmp_result[11:0] = $unsigned($signed(part_rem[11:0]) 
//                                         + $signed(digit_bound_1[11:0]));
//assign bound2_cmp_result[11:0] = $unsigned($signed(part_rem[11:0])
//                                         + $signed(digit_bound_2[11:0]));
//assign bound3_cmp_result[11:0] = $unsigned($signed(part_rem[11:0]) 
//                                         + $signed(digit_bound_3[11:0]));
//assign bound4_cmp_result[11:0] = $unsigned($signed(part_rem[11:0])
//                                         + $signed(digit_bound_4[11:0]));
//assign bound5_cmp_result[11:0] = $unsigned($signed(part_rem[11:0])
//                                         + $signed(digit_bound_5[11:0]));
//assign bound6_cmp_result[11:0] = $unsigned($signed(part_rem[11:0])
//                                         + $signed(digit_bound_6[11:0]));
//assign bound7_cmp_result[11:0] = $unsigned($signed(part_rem[11:0])
//                                         + $signed(digit_bound_7[11:0]));
//assign bound8_cmp_result[11:0] = $unsigned($signed(part_rem[11:0])
//                                         + $signed(digit_bound_8[11:0]));
//assign bound9_cmp_result[11:0] = $unsigned($signed(part_rem[11:0])
//                                         + $signed(digit_bound_9[11:0]));
////csky vperl_on
//assign bound1_cmp_sign         = bound1_cmp_result[11];
//assign bound2_cmp_sign         = bound2_cmp_result[11];
//assign bound3_cmp_sign         = bound3_cmp_result[11];
//assign bound4_cmp_sign         = bound4_cmp_result[11];
//assign bound5_cmp_sign         = bound5_cmp_result[11];
//assign bound6_cmp_sign         = bound6_cmp_result[11];
//assign bound7_cmp_sign         = bound7_cmp_result[11];
//assign bound8_cmp_sign         = bound8_cmp_result[11];
//assign bound9_cmp_sign         = bound9_cmp_result[11];
assign bound1_cmp_sign         = part_rem[11:0] < digit_bound_1[11:0];
assign bound2_cmp_sign         = part_rem[11:0] < digit_bound_2[11:0];
assign bound3_cmp_sign         = part_rem[11:0] < digit_bound_3[11:0];
assign bound4_cmp_sign         = part_rem[11:0] < digit_bound_4[11:0];
assign bound5_cmp_sign         = part_rem[11:0] < digit_bound_5[11:0];
assign bound6_cmp_sign         = part_rem[11:0] < digit_bound_6[11:0];
assign bound7_cmp_sign         = part_rem[11:0] < digit_bound_7[11:0];
assign bound8_cmp_sign         = part_rem[11:0] < digit_bound_8[11:0];
assign bound9_cmp_sign         = part_rem[11:0] < digit_bound_9[11:0];
//====================================================
//  remainder calculation
//====================================================
// the root preparation
assign qt_rt_const_q1[REM_WIDTH-1:0]   = {3'b0,qt_rt_const_shift_std[QT_WIDTH-1:0]};
assign qt_rt_const_q2[REM_WIDTH-1:0]   = {2'b0,qt_rt_const_shift_std[QT_WIDTH-1:0],1'b0};
assign qt_rt_const_q4[REM_WIDTH-1:0]   = {1'b0,qt_rt_const_shift_std[QT_WIDTH-1:0],2'b0};
assign qt_rt_const_q8[REM_WIDTH-1:0]   = {qt_rt_const_shift_std[QT_WIDTH-1:0],3'b0};

assign qt_rt_const_q3[REM_WIDTH-1:0]          =  qt_rt_const_q1[REM_WIDTH-1:0]   
                                                |qt_rt_const_q2[REM_WIDTH-1:0];
assign qt_rt_const_q5[REM_WIDTH-1:0]          =  qt_rt_const_q1[REM_WIDTH-1:0]   
                                                |qt_rt_const_q4[REM_WIDTH-1:0];
assign qt_rt_const_q6[REM_WIDTH-1:0]          =  qt_rt_const_q2[REM_WIDTH-1:0]   
                                                |qt_rt_const_q4[REM_WIDTH-1:0];
assign qt_rt_const_q7[REM_WIDTH-1:0]          =  qt_rt_const_q1[REM_WIDTH-1:0]
                                                |qt_rt_const_q2[REM_WIDTH-1:0]   
                                                |qt_rt_const_q4[REM_WIDTH-1:0];
assign qt_rt_const_q9[REM_WIDTH-1:0]          =  qt_rt_const_q1[REM_WIDTH-1:0]
                                                |qt_rt_const_q8[REM_WIDTH-1:0];
assign qt_rt_const_q10[REM_WIDTH-1:0]         =  qt_rt_const_q2[REM_WIDTH-1:0]   
                                                |qt_rt_const_q8[REM_WIDTH-1:0];
assign qt_rt_const_q11[REM_WIDTH-1:0]         =  qt_rt_const_q1[REM_WIDTH-1:0]
                                                |qt_rt_const_q2[REM_WIDTH-1:0]   
                                                |qt_rt_const_q8[REM_WIDTH-1:0];
assign qt_rt_const_q12[REM_WIDTH-1:0]         =  qt_rt_const_q4[REM_WIDTH-1:0]
                                                |qt_rt_const_q8[REM_WIDTH-1:0];              
assign qt_rt_const_q13[REM_WIDTH-1:0]         =  qt_rt_const_q1[REM_WIDTH-1:0]
                                                |qt_rt_const_q4[REM_WIDTH-1:0]
                                                |qt_rt_const_q8[REM_WIDTH-1:0]; 
assign qt_rt_const_q14[REM_WIDTH-1:0]         =  qt_rt_const_q2[REM_WIDTH-1:0]
                                                |qt_rt_const_q4[REM_WIDTH-1:0]
                                                |qt_rt_const_q8[REM_WIDTH-1:0];
assign qt_rt_const_q15[REM_WIDTH-1:0]         =  qt_rt_const_q1[REM_WIDTH-1:0]
                                                |qt_rt_const_q2[REM_WIDTH-1:0]   
                                                |qt_rt_const_q4[REM_WIDTH-1:0]   
                                                |qt_rt_const_q8[REM_WIDTH-1:0]; 



//=====================================
// the div current remainder oprand b
//=====================================
//negative
assign div_qt_r1_rem_add_op1[REM_WIDTH-1:0]    = {5'b0,srt_divisor[DATA_WIDTH-1:0]};
assign div_qt_r2_rem_add_op1[REM_WIDTH-1:0]    = {4'b0,srt_divisor[DATA_WIDTH-1:0],1'b0};
assign div_qt_r4_rem_add_op1[REM_WIDTH-1:0]    = {3'b0,srt_divisor[DATA_WIDTH-1:0],2'b0};
assign div_qt_r8_rem_add_op1[REM_WIDTH-1:0]    = {2'b0,srt_divisor[DATA_WIDTH-1:0],3'b0};
assign div_qt_r3_rem_add_op1_0[REM_WIDTH-1:0]  = div_qt_r2_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r3_rem_add_op1_1[REM_WIDTH-1:0]  = div_qt_r1_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r5_rem_add_op1_0[REM_WIDTH-1:0]  = div_qt_r4_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r5_rem_add_op1_1[REM_WIDTH-1:0]  = div_qt_r1_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r6_rem_add_op1_0[REM_WIDTH-1:0]  = div_qt_r4_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r6_rem_add_op1_1[REM_WIDTH-1:0]  = div_qt_r2_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r7_rem_add_op1_0[REM_WIDTH-1:0]  = div_qt_r8_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r7_rem_add_op1_1[REM_WIDTH-1:0]  = ~div_qt_r1_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r9_rem_add_op1_0[REM_WIDTH-1:0]  = div_qt_r8_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_r9_rem_add_op1_1[REM_WIDTH-1:0]  = div_qt_r1_rem_add_op1[REM_WIDTH-1:0];
//positive 
assign div_qt_1_rem_add_op1[REM_WIDTH-1:0]     = ~div_qt_r1_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_2_rem_add_op1[REM_WIDTH-1:0]     = ~div_qt_r2_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_4_rem_add_op1[REM_WIDTH-1:0]     = ~div_qt_r4_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_8_rem_add_op1[REM_WIDTH-1:0]     = ~div_qt_r8_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_3_rem_add_op1_0[REM_WIDTH-1:0]   = div_qt_2_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_3_rem_add_op1_1[REM_WIDTH-1:0]   = div_qt_1_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_5_rem_add_op1_0[REM_WIDTH-1:0]   = div_qt_4_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_5_rem_add_op1_1[REM_WIDTH-1:0]   = div_qt_1_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_6_rem_add_op1_0[REM_WIDTH-1:0]   = div_qt_4_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_6_rem_add_op1_1[REM_WIDTH-1:0]   = div_qt_2_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_7_rem_add_op1_0[REM_WIDTH-1:0]   = div_qt_8_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_7_rem_add_op1_1[REM_WIDTH-1:0]   = ~div_qt_1_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_9_rem_add_op1_0[REM_WIDTH-1:0]   = div_qt_8_rem_add_op1[REM_WIDTH-1:0];
assign div_qt_9_rem_add_op1_1[REM_WIDTH-1:0]   = div_qt_1_rem_add_op1[REM_WIDTH-1:0];
assign div_rem_add1_op1[REM_WIDTH-1:0]         = rem_sign ? div_qt_r1_rem_add_op1[REM_WIDTH-1:0]
                                                          : div_qt_1_rem_add_op1[REM_WIDTH-1:0];
assign div_rem_add2_op1[REM_WIDTH-1:0]         = rem_sign ? div_qt_r2_rem_add_op1[REM_WIDTH-1:0]
                                                          : div_qt_2_rem_add_op1[REM_WIDTH-1:0];
assign div_rem_add4_op1[REM_WIDTH-1:0]         = rem_sign ? div_qt_r4_rem_add_op1[REM_WIDTH-1:0]
                                                          : div_qt_4_rem_add_op1[REM_WIDTH-1:0];
assign div_rem_add8_op1[REM_WIDTH-1:0]         = rem_sign ? div_qt_r8_rem_add_op1[REM_WIDTH-1:0]
                                                          : div_qt_8_rem_add_op1[REM_WIDTH-1:0];
assign div_rem_add3_op1_0[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r3_rem_add_op1_0[REM_WIDTH-1:0]
                                                 : div_qt_3_rem_add_op1_0[REM_WIDTH-1:0];
assign div_rem_add3_op1_1[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r3_rem_add_op1_1[REM_WIDTH-1:0]
                                                 : div_qt_3_rem_add_op1_1[REM_WIDTH-1:0];
assign div_rem_add5_op1_0[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r5_rem_add_op1_0[REM_WIDTH-1:0]
                                                 : div_qt_5_rem_add_op1_0[REM_WIDTH-1:0];
assign div_rem_add5_op1_1[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r5_rem_add_op1_1[REM_WIDTH-1:0]
                                                 : div_qt_5_rem_add_op1_1[REM_WIDTH-1:0];
assign div_rem_add6_op1_0[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r6_rem_add_op1_0[REM_WIDTH-1:0]
                                                 : div_qt_6_rem_add_op1_0[REM_WIDTH-1:0];
assign div_rem_add6_op1_1[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r6_rem_add_op1_1[REM_WIDTH-1:0]
                                                 : div_qt_6_rem_add_op1_1[REM_WIDTH-1:0];
assign div_rem_add7_op1_0[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r7_rem_add_op1_0[REM_WIDTH-1:0]
                                                 : div_qt_7_rem_add_op1_0[REM_WIDTH-1:0];
assign div_rem_add7_op1_1[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r7_rem_add_op1_1[REM_WIDTH-1:0]
                                                 : div_qt_7_rem_add_op1_1[REM_WIDTH-1:0];
assign div_rem_add9_op1_0[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r9_rem_add_op1_0[REM_WIDTH-1:0]
                                                 : div_qt_9_rem_add_op1_0[REM_WIDTH-1:0];
assign div_rem_add9_op1_1[REM_WIDTH-1:0]       = rem_sign 
                                                 ? div_qt_r9_rem_add_op1_1[REM_WIDTH-1:0]
                                                 : div_qt_9_rem_add_op1_1[REM_WIDTH-1:0];

//=====================================
// the remainder calculation
//=====================================
assign rem_add1_op1[REM_WIDTH-1:0]     = ( div_rem_add1_op1[REM_WIDTH-1:0]);
assign rem_add2_op1[REM_WIDTH-1:0]     = ( div_rem_add2_op1[REM_WIDTH-1:0]);
assign rem_add4_op1[REM_WIDTH-1:0]     = ( div_rem_add4_op1[REM_WIDTH-1:0]);
assign rem_add8_op1[REM_WIDTH-1:0]     = ( div_rem_add8_op1[REM_WIDTH-1:0]);
assign rem_add3_op1_0[REM_WIDTH-1:0]   = ( div_rem_add3_op1_0[REM_WIDTH-1:0]);
assign rem_add3_op1_1[REM_WIDTH-1:0]   = ( div_rem_add3_op1_1[REM_WIDTH-1:0]);
assign rem_add5_op1_0[REM_WIDTH-1:0]   = ( div_rem_add5_op1_0[REM_WIDTH-1:0]);
assign rem_add5_op1_1[REM_WIDTH-1:0]   = ( div_rem_add5_op1_1[REM_WIDTH-1:0]);
assign rem_add6_op1_0[REM_WIDTH-1:0]   = ( div_rem_add6_op1_0[REM_WIDTH-1:0]);
assign rem_add6_op1_1[REM_WIDTH-1:0]   = ( div_rem_add6_op1_1[REM_WIDTH-1:0]);
assign rem_add7_op1_0[REM_WIDTH-1:0]   = ( div_rem_add7_op1_0[REM_WIDTH-1:0]);
assign rem_add7_op1_1[REM_WIDTH-1:0]   = ( div_rem_add7_op1_1[REM_WIDTH-1:0]);
assign rem_add9_op1_0[REM_WIDTH-1:0]   = ( div_rem_add9_op1_0[REM_WIDTH-1:0]);
assign rem_add9_op1_1[REM_WIDTH-1:0]   = ( div_rem_add9_op1_1[REM_WIDTH-1:0]);
// remainder calculation for all of the remainders
assign remainder_shift[REM_WIDTH-1:0]  = {srt_remainder[REM_WIDTH-5:0],4'b0};
assign remainder_minus_shift[REM_WIDTH-1:0]  = {srt_remainder_minus[REM_WIDTH-5:0],4'b0};
// &Force("nonport","cur_rem_1"); @334
// &Force("nonport","cur_rem_2"); @335
// &Force("nonport","cur_rem_3"); @336
// &Force("nonport","cur_rem_4"); @337
// &Force("nonport","cur_rem_5"); @338
// &Force("nonport","cur_rem_6"); @339
// &Force("nonport","cur_rem_7"); @340
// &Force("nonport","cur_rem_8"); @341
// &Force("nonport","cur_rem_9"); @342
// &Force("nonport","remainder_shift"); @343
// &Force("nonport","rem_add1_op1"); @344
// &Force("nonport","rem_add2_op1"); @345
// &Force("nonport","rem_add3_op1_0"); @346
// &Force("nonport","rem_add3_op1_1"); @347
// &Force("nonport","rem_add4_op1"); @348
// &Force("nonport","rem_add5_op1_0"); @349
// &Force("nonport","rem_add5_op1_1"); @350
// &Force("nonport","rem_add6_op1_0"); @351
// &Force("nonport","rem_add6_op1_1"); @352
// &Force("nonport","rem_add7_op1_0"); @353
// &Force("nonport","rem_add7_op1_1"); @354
// &Force("nonport","rem_add8_op1"); @355
// &Force("nonport","rem_add9_op1_0"); @356
// &Force("nonport","rem_add9_op1_1"); @357
// &Force("nonport","rem_minus_minus_6"); @358
// &Force("nonport","rem_minus_minus_4"); @359
//csky vperl_off
assign cur_rem_1[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add1_op1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-1{1'b0}},~rem_sign}));   
assign cur_rem_2[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add2_op1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-1{1'b0}},~rem_sign}));  
assign cur_rem_4[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add4_op1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-1{1'b0}},~rem_sign}));   
assign cur_rem_8[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add8_op1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-1{1'b0}},~rem_sign}));  
assign cur_rem_3[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add3_op1_0[REM_WIDTH-1:0])
                                         + $signed(rem_add3_op1_1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-2{1'b0}},~rem_sign,1'b0}));
assign cur_rem_5[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add5_op1_0[REM_WIDTH-1:0])
                                         + $signed(rem_add5_op1_1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-2{1'b0}},~rem_sign,1'b0}));
assign cur_rem_6[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add6_op1_0[REM_WIDTH-1:0])
                                         + $signed(rem_add6_op1_1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-2{1'b0}},~rem_sign,1'b0}));
assign cur_rem_7[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add7_op1_0[REM_WIDTH-1:0])
                                         + $signed(rem_add7_op1_1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-1{1'b0}},1'b1}));
assign cur_rem_9[REM_WIDTH-1:0]        = $unsigned($signed(remainder_shift[REM_WIDTH-1:0])
                                         + $signed(rem_add9_op1_0[REM_WIDTH-1:0])
                                         + $signed(rem_add9_op1_1[REM_WIDTH-1:0])
                                         + $signed({{REM_WIDTH-2{1'b0}},~rem_sign,1'b0}));
//=====================================
// adder add for positive remainder
//=====================================
// remainder_mins - 6y
// remainder_mins - 4y
assign rem_minus_minus_6[REM_WIDTH-1:0]      = $unsigned($signed(remainder_minus_shift[REM_WIDTH-1:0])
                                             - $signed({div_qt_r4_rem_add_op1[REM_WIDTH-1:0]})
                                             - $signed({div_qt_r2_rem_add_op1[REM_WIDTH-1:0]}));
assign rem_minus_minus_4[REM_WIDTH-1:0]      = $unsigned($signed(remainder_minus_shift[REM_WIDTH-1:0])
                                             - $signed({div_qt_r4_rem_add_op1[REM_WIDTH-1:0]}));
//csky vperl_on
                                         
//====================================================
//  quotient selection
//==================================================== 
assign bound_cmp_sign[8:0] =  {bound1_cmp_sign,bound2_cmp_sign,bound3_cmp_sign,bound4_cmp_sign,
             bound5_cmp_sign,bound6_cmp_sign,bound7_cmp_sign,bound8_cmp_sign,bound9_cmp_sign};

assign total_qt_rt_cur_0[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0];
assign total_qt_rt_cur_1[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q1[QT_WIDTH-1:0];
assign total_qt_rt_cur_2[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q2[QT_WIDTH-1:0];
assign total_qt_rt_cur_3[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q3[QT_WIDTH-1:0];
assign total_qt_rt_cur_4[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q4[QT_WIDTH-1:0];
assign total_qt_rt_cur_5[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q5[QT_WIDTH-1:0];
assign total_qt_rt_cur_6[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q6[QT_WIDTH-1:0];
assign total_qt_rt_cur_7[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q7[QT_WIDTH-1:0];
assign total_qt_rt_cur_8[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q8[QT_WIDTH-1:0];
assign total_qt_rt_cur_9[QT_WIDTH-1:0]    = total_qt_rt[QT_WIDTH-1:0]
                                             |qt_rt_const_q9[QT_WIDTH-1:0];
assign total_qt_rt_cur_m1[QT_WIDTH-1:0]   = total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q15[QT_WIDTH-1:0];
assign total_qt_rt_cur_m2[QT_WIDTH-1:0]   = total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q14[QT_WIDTH-1:0];
assign total_qt_rt_cur_m3[QT_WIDTH-1:0]   = total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q13[QT_WIDTH-1:0];
assign total_qt_rt_cur_m4[QT_WIDTH-1:0]   = total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q12[QT_WIDTH-1:0];
assign total_qt_rt_cur_m5[QT_WIDTH-1:0]   = total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q11[QT_WIDTH-1:0];
assign total_qt_rt_cur_m6[QT_WIDTH-1:0]   = total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q10[QT_WIDTH-1:0];
assign total_qt_rt_cur_m7[QT_WIDTH-1:0]   = total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q9[QT_WIDTH-1:0];
assign total_qt_rt_cur_m8[QT_WIDTH-1:0]   = total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q8[QT_WIDTH-1:0];
assign total_qt_rt_cur_m9[QT_WIDTH-1:0]   =total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q7[QT_WIDTH-1:0];
assign total_qt_rt_cur_m10[QT_WIDTH-1:0]   =total_qt_rt_minus[QT_WIDTH-1:0]
                                             |qt_rt_const_q6[QT_WIDTH-1:0];

// &CombBeg; @451
always @( total_qt_rt_cur_9[67:0]
       or total_qt_rt_cur_5[67:0]
       or total_qt_rt_cur_2[67:0]
       or total_qt_rt_cur_6[67:0]
       or rem_sign
       or total_qt_rt_cur_m8[67:0]
       or bound_cmp_sign[8:0]
       or total_qt_rt_cur_7[67:0]
       or total_qt_rt_cur_m10[67:0]
       or total_qt_rt_cur_m6[67:0]
       or total_qt_rt_cur_1[67:0]
       or total_qt_rt_cur_8[67:0]
       or total_qt_rt_cur_m5[67:0]
       or total_qt_rt_cur_m9[67:0]
       or total_qt_rt_cur_3[67:0]
       or total_qt_rt_cur_m7[67:0]
       or total_qt_rt_cur_m3[67:0]
       or total_qt_rt_cur_m1[67:0]
       or total_qt_rt_cur_0[67:0]
       or total_qt_rt_cur_m4[67:0]
       or total_qt_rt_cur_4[67:0]
       or total_qt_rt_cur_m2[67:0])
begin
case({rem_sign,bound_cmp_sign[8:0]})
  10'b0111111111: //0
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_0[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m1[QT_WIDTH-1:0];
                                            
  end
  10'b0011111111: //1
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_1[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_0[QT_WIDTH-1:0];
  end
  10'b0001111111://2
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_2[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_1[QT_WIDTH-1:0];
                                            
  end
  10'b0000111111://3
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_3[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_2[QT_WIDTH-1:0];
                                            
  end
  10'b0000011111://4
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_4[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_3[QT_WIDTH-1:0];
                                            
  end
  10'b0000001111://5
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_5[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_4[QT_WIDTH-1:0];
                                            
  end
  10'b0000000111://6
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_6[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_5[QT_WIDTH-1:0];
                                            
  end
  10'b0000000011://7
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_7[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_6[QT_WIDTH-1:0];
                                            
  end
  10'b0000000001://8
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_8[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_7[QT_WIDTH-1:0];
                                            
  end
  10'b0000000000://9
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_9[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_8[QT_WIDTH-1:0];
                                            
  end
  10'b1111111111: //0
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_0[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m1[QT_WIDTH-1:0];
                                            
  end
  10'b1011111111: //-1
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m1[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m2[QT_WIDTH-1:0];
                                            
  end
  10'b1001111111://-2
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m2[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m3[QT_WIDTH-1:0];
                                            
  end
  10'b1000111111://-3
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m3[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m4[QT_WIDTH-1:0];
                                            
  end
  10'b1000011111://-4
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m4[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m5[QT_WIDTH-1:0];
                                            
  end
  10'b1000001111://-5
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m5[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m6[QT_WIDTH-1:0];
                                            
  end
  10'b1000000111://-6
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m6[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m7[QT_WIDTH-1:0];
                                            
  end
  10'b1000000011://-7
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m7[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m8[QT_WIDTH-1:0];
                                            
  end
  10'b1000000001://-8
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m8[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m9[QT_WIDTH-1:0];
                                            
  end
  10'b1000000000://-9
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = total_qt_rt_cur_m9[QT_WIDTH-1:0];
    total_qt_rt_minus_next[QT_WIDTH-1:0] = total_qt_rt_cur_m10[QT_WIDTH-1:0];
                                            
  end
  default :
  begin
    total_qt_rt_next[QT_WIDTH-1:0]       = {QT_WIDTH{1'bx}};
    total_qt_rt_minus_next[QT_WIDTH-1:0] = {QT_WIDTH{1'bx}};
  end
endcase
// &CombEnd; @578
end
//====================================================
//  remainder selection
//====================================================
// &CombBeg; @582
always @( bound_cmp_sign[8:0]
       or cur_rem_4[70:0]
       or cur_rem_9[70:0]
       or cur_rem_1[70:0]
       or remainder_shift[70:0]
       or cur_rem_3[70:0]
       or cur_rem_7[70:0]
       or cur_rem_2[70:0]
       or cur_rem_6[70:0]
       or cur_rem_8[70:0]
       or cur_rem_5[70:0])
begin
case(bound_cmp_sign[8:0])
  9'b111111111: cur_rem[REM_WIDTH-1:0]   = remainder_shift[REM_WIDTH-1:0]; //0
  9'b011111111: cur_rem[REM_WIDTH-1:0]   = cur_rem_1[REM_WIDTH-1:0];       //+-1          
  9'b001111111: cur_rem[REM_WIDTH-1:0]   = cur_rem_2[REM_WIDTH-1:0];       //+-2          
  9'b000111111: cur_rem[REM_WIDTH-1:0]   = cur_rem_3[REM_WIDTH-1:0];       //+-3          
  9'b000011111: cur_rem[REM_WIDTH-1:0]   = cur_rem_4[REM_WIDTH-1:0];       //+-4          
  9'b000001111: cur_rem[REM_WIDTH-1:0]   = cur_rem_5[REM_WIDTH-1:0];       //+-5          
  9'b000000111: cur_rem[REM_WIDTH-1:0]   = cur_rem_6[REM_WIDTH-1:0];       //+-6          
  9'b000000011: cur_rem[REM_WIDTH-1:0]   = cur_rem_7[REM_WIDTH-1:0];       //+-7          
  9'b000000001: cur_rem[REM_WIDTH-1:0]   = cur_rem_8[REM_WIDTH-1:0];       //+-8          
  9'b000000000: cur_rem[REM_WIDTH-1:0]   = cur_rem_9[REM_WIDTH-1:0];       //+-9          
  default :     cur_rem[REM_WIDTH-1:0]   = {REM_WIDTH{1'bx}};
endcase
// &CombEnd; @596
end
assign srt_remainder_nxt[REM_WIDTH-1:0]   = cur_rem[REM_WIDTH-1:0];
assign srt_remainder_zero                 = ~|srt_remainder[REM_WIDTH-1:0];
//assign srt_remainder_sign                 = srt_remainder_nxt[REM_WIDTH-1];
//for the last round, the quotient may be more than we need
//for quotient 9 
// &CombBeg; @602
always @( rem_sign
       or cur_rem_4[70:0]
       or cur_rem_9[70:0]
       or cur_rem_1[70:0]
       or remainder_shift[70:0]
       or rem_minus_minus_6[70:0]
       or cur_rem_3[70:0]
       or cur_rem_2[70:0]
       or cur_rem_7[70:0]
       or cur_rem_6[70:0]
       or remainder_minus_shift[70:0]
       or rem_minus_minus_4[70:0]
       or last_sel_bit[3:0]
       or cur_rem_5[70:0]
       or cur_rem_8[70:0])
begin
case({rem_sign,last_sel_bit[3:0]})
  5'b01000:  //means all 4 bits of last round are needed
  begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = remainder_minus_shift[REM_WIDTH-1:0];
    rem_neg_nxt_1[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0]; 
    rem_neg_nxt_2[REM_WIDTH-1:0]  = cur_rem_1[REM_WIDTH-1:0];
    rem_neg_nxt_3[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_neg_nxt_4[REM_WIDTH-1:0]  = cur_rem_3[REM_WIDTH-1:0];
    rem_neg_nxt_5[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_6[REM_WIDTH-1:0]  = cur_rem_5[REM_WIDTH-1:0];
    rem_neg_nxt_7[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_neg_nxt_8[REM_WIDTH-1:0]  = cur_rem_7[REM_WIDTH-1:0];
    rem_neg_nxt_9[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_0[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_1[REM_WIDTH-1:0]  = cur_rem_1[REM_WIDTH-1:0];
    rem_pos_nxt_2[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_pos_nxt_3[REM_WIDTH-1:0]  = cur_rem_3[REM_WIDTH-1:0];
    rem_pos_nxt_4[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_5[REM_WIDTH-1:0]  = cur_rem_5[REM_WIDTH-1:0];
    rem_pos_nxt_6[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_pos_nxt_7[REM_WIDTH-1:0]  = cur_rem_7[REM_WIDTH-1:0];
    rem_pos_nxt_8[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_9[REM_WIDTH-1:0]  = cur_rem_9[REM_WIDTH-1:0];
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_m1[DATA_WIDTH-1:0];
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_1[DATA_WIDTH-1:0];
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_2[DATA_WIDTH-1:0];
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_3[DATA_WIDTH-1:0];
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_5[DATA_WIDTH-1:0];
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_6[DATA_WIDTH-1:0];
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_7[DATA_WIDTH-1:0];
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_1[DATA_WIDTH-1:0];
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_2[DATA_WIDTH-1:0];
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_3[DATA_WIDTH-1:0];
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_5[DATA_WIDTH-1:0];
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_6[DATA_WIDTH-1:0];
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_7[DATA_WIDTH-1:0];
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_9[DATA_WIDTH-1:0];
  end
  5'b00100:  //means only high 3 bits of last round are needed
  begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = remainder_minus_shift[REM_WIDTH-1:0];
    rem_neg_nxt_1[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0]; 
    rem_neg_nxt_2[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_3[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_neg_nxt_4[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_neg_nxt_5[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_6[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_7[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_neg_nxt_8[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_neg_nxt_9[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_0[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_1[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_2[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_pos_nxt_3[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_pos_nxt_4[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_5[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_6[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_pos_nxt_7[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_pos_nxt_8[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_9[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_m2[DATA_WIDTH-1:0];
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_2[DATA_WIDTH-1:0];
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_2[DATA_WIDTH-1:0];
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_6[DATA_WIDTH-1:0];
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_6[DATA_WIDTH-1:0];
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_2[DATA_WIDTH-1:0];
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_2[DATA_WIDTH-1:0];
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_6[DATA_WIDTH-1:0];
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_6[DATA_WIDTH-1:0];
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
  end
  5'b00010:  //means only high 2 bits of last round are needed
  begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = remainder_minus_shift[REM_WIDTH-1:0];
    rem_neg_nxt_1[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];  
    rem_neg_nxt_2[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_3[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_4[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_5[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_6[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_7[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_8[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_9[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_0[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_1[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_2[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_3[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_4[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_5[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_6[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_7[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_8[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_9[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_4[DATA_WIDTH-1:0];
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
  end
  5'b00001:  //means only high 1 bit of last round is needed
  begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = remainder_minus_shift[REM_WIDTH-1:0];
    rem_neg_nxt_1[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0]; 
    rem_neg_nxt_2[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_3[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_4[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_5[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_6[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_7[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_8[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_neg_nxt_9[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_0[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_1[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_2[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_3[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_4[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_5[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_6[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_7[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_8[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_9[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_8[DATA_WIDTH-1:0];
  end
 5'b11000:  //means all 4 bits of last round are needed
  begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = cur_rem_1[REM_WIDTH-1:0];
    rem_neg_nxt_1[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0]; 
    rem_neg_nxt_2[REM_WIDTH-1:0]  = cur_rem_3[REM_WIDTH-1:0];
    rem_neg_nxt_3[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_4[REM_WIDTH-1:0]  = cur_rem_5[REM_WIDTH-1:0];
    rem_neg_nxt_5[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_neg_nxt_6[REM_WIDTH-1:0]  = cur_rem_7[REM_WIDTH-1:0];
    rem_neg_nxt_7[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_8[REM_WIDTH-1:0]  = cur_rem_9[REM_WIDTH-1:0];
    rem_neg_nxt_9[REM_WIDTH-1:0]  = rem_minus_minus_6[REM_WIDTH-1:0];
    rem_pos_nxt_0[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_1[REM_WIDTH-1:0]  = cur_rem_1[REM_WIDTH-1:0];
    rem_pos_nxt_2[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_pos_nxt_3[REM_WIDTH-1:0]  = cur_rem_3[REM_WIDTH-1:0];
    rem_pos_nxt_4[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_5[REM_WIDTH-1:0]  = cur_rem_5[REM_WIDTH-1:0];
    rem_pos_nxt_6[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_pos_nxt_7[REM_WIDTH-1:0]  = cur_rem_7[REM_WIDTH-1:0];
    rem_pos_nxt_8[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_9[REM_WIDTH-1:0]  = cur_rem_9[REM_WIDTH-1:0]; 
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_m1[DATA_WIDTH-1:0];
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_m2[DATA_WIDTH-1:0];
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_m3[DATA_WIDTH-1:0];
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_m5[DATA_WIDTH-1:0];
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_m6[DATA_WIDTH-1:0];
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_m7[DATA_WIDTH-1:0];
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_m9[DATA_WIDTH-1:0];
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_m10[DATA_WIDTH-1:0];
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_m2[DATA_WIDTH-1:0];
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_m3[DATA_WIDTH-1:0];
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_m5[DATA_WIDTH-1:0];
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_m6[DATA_WIDTH-1:0];
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_m7[DATA_WIDTH-1:0];
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_m9[DATA_WIDTH-1:0];
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_m10[DATA_WIDTH-1:0];

  end
  5'b10100:  //means high 3 bits of last round are needed
  begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_neg_nxt_1[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0]; 
    rem_neg_nxt_2[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_3[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_4[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_neg_nxt_5[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_neg_nxt_6[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_7[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_8[REM_WIDTH-1:0]  = rem_minus_minus_6[REM_WIDTH-1:0];
    rem_neg_nxt_9[REM_WIDTH-1:0]  = rem_minus_minus_6[REM_WIDTH-1:0];
    rem_pos_nxt_0[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_1[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_pos_nxt_2[REM_WIDTH-1:0]  = cur_rem_2[REM_WIDTH-1:0];
    rem_pos_nxt_3[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_4[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_5[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_6[REM_WIDTH-1:0]  = cur_rem_6[REM_WIDTH-1:0];
    rem_pos_nxt_7[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_8[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_9[REM_WIDTH-1:0]  = rem_minus_minus_6[REM_WIDTH-1:0]; 
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_m2[DATA_WIDTH-1:0];
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_m2[DATA_WIDTH-1:0];
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_m6[DATA_WIDTH-1:0];
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_m6[DATA_WIDTH-1:0];
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_m10[DATA_WIDTH-1:0];
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_m10[DATA_WIDTH-1:0];
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_m2[DATA_WIDTH-1:0];
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_m2[DATA_WIDTH-1:0];
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_m6[DATA_WIDTH-1:0];
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_m6[DATA_WIDTH-1:0];
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_m10[DATA_WIDTH-1:0];
  end
  5'b10010:  //means high 2 bits of last round are needed
  begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_1[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0]; 
    rem_neg_nxt_2[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_3[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_neg_nxt_4[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_5[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_6[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_7[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_8[REM_WIDTH-1:0]  = rem_minus_minus_4[REM_WIDTH-1:0];
    rem_neg_nxt_9[REM_WIDTH-1:0]  = rem_minus_minus_4[REM_WIDTH-1:0];
    rem_pos_nxt_0[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_1[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_2[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_3[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_4[REM_WIDTH-1:0]  = cur_rem_4[REM_WIDTH-1:0];
    rem_pos_nxt_5[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_6[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_7[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_8[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_9[REM_WIDTH-1:0]  = rem_minus_minus_4[REM_WIDTH-1:0]; 
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_m12[DATA_WIDTH-1:0];
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_m12[DATA_WIDTH-1:0];
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_m4[DATA_WIDTH-1:0];
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_cur_m12[DATA_WIDTH-1:0];

  end
  5'b10001:  //means only 1 bit of last round is needed
  begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_1[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0]; 
    rem_neg_nxt_2[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_3[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_4[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_5[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_6[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_7[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_neg_nxt_8[REM_WIDTH-1:0]  = remainder_minus_shift[REM_WIDTH-1:0];
    rem_neg_nxt_9[REM_WIDTH-1:0]  = remainder_minus_shift[REM_WIDTH-1:0];
    rem_pos_nxt_0[REM_WIDTH-1:0]  = remainder_shift[REM_WIDTH-1:0];
    rem_pos_nxt_1[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_2[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_3[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_4[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_5[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_6[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_7[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_8[REM_WIDTH-1:0]  = cur_rem_8[REM_WIDTH-1:0];
    rem_pos_nxt_9[REM_WIDTH-1:0]  = remainder_minus_shift[REM_WIDTH-1:0]; 
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_minus[DATA_WIDTH-1:0];
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_minus[DATA_WIDTH-1:0];
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = total_qt_rt_cur_0[DATA_WIDTH-1:0];
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = total_qt_rt_cur_m8[DATA_WIDTH-1:0];
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = total_qt_rt_minus[DATA_WIDTH-1:0];

  end
  default :
   begin
    rem_neg_nxt_0[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_1[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_2[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_3[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_4[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_5[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_6[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_7[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_8[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_neg_nxt_9[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_0[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_1[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_2[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_3[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_4[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_5[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_6[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_7[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_8[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
    rem_pos_nxt_9[REM_WIDTH-1:0]  = {REM_WIDTH{1'bx}}; 
//    qt_neg_lst_0[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_1[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_2[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_3[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_4[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_5[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_6[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_7[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_8[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_neg_lst_9[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_0[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_1[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_2[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_3[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_4[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_5[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_6[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_7[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_8[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
//    qt_pos_lst_9[DATA_WIDTH-1:0]  = {DATA_WIDTH{1'bx}};
   end
 endcase
// &CombEnd; @995
end

// &CombBeg; @997
always @( rem_pos_nxt_2[70:0]
       or bound_cmp_sign[8:0]
       or rem_pos_nxt_3[70:0]
       or rem_pos_nxt_0[70:0]
       or rem_pos_nxt_5[70:0]
       or rem_pos_nxt_8[70:0]
       or rem_pos_nxt_7[70:0]
       or rem_pos_nxt_4[70:0]
       or rem_pos_nxt_9[70:0]
       or rem_pos_nxt_1[70:0]
       or rem_pos_nxt_6[70:0])
begin
case({bound_cmp_sign[8:0]})
  9'b111111111: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_0[REM_WIDTH-1:0]; //  0
  9'b011111111: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_1[REM_WIDTH-1:0]; //+-1
  9'b001111111: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_2[REM_WIDTH-1:0]; //+-2
  9'b000111111: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_3[REM_WIDTH-1:0]; //+-3
  9'b000011111: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_4[REM_WIDTH-1:0]; //+-4
  9'b000001111: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_5[REM_WIDTH-1:0]; //+-5
  9'b000000111: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_6[REM_WIDTH-1:0]; //+-6
  9'b000000011: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_7[REM_WIDTH-1:0]; //+-7
  9'b000000001: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_8[REM_WIDTH-1:0]; //+-8
  9'b000000000: srt_remainder_pos_nxt[REM_WIDTH-1:0] = rem_pos_nxt_9[REM_WIDTH-1:0]; //+-9
  default :     srt_remainder_pos_nxt[REM_WIDTH-1:0] = {REM_WIDTH{1'bx}};
endcase
// &CombEnd; @1011
end
// here add for positive remainder calculation
assign remainder_minus_nor_nxt_0[REM_WIDTH-1:0]  = rem_sign ? cur_rem_1[REM_WIDTH-1:0]
						            : remainder_minus_shift[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_1[REM_WIDTH-1:0]  = rem_sign ? cur_rem_2[REM_WIDTH-1:0]
                                                            : remainder_shift[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_2[REM_WIDTH-1:0]  = rem_sign ? cur_rem_3[REM_WIDTH-1:0]
                                                            : cur_rem_1[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_3[REM_WIDTH-1:0]  = rem_sign ? cur_rem_4[REM_WIDTH-1:0]
                                                            : cur_rem_2[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_4[REM_WIDTH-1:0]  = rem_sign ? cur_rem_5[REM_WIDTH-1:0]
                                                            : cur_rem_3[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_5[REM_WIDTH-1:0]  = rem_sign ? cur_rem_6[REM_WIDTH-1:0]
                                                            : cur_rem_4[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_6[REM_WIDTH-1:0]  = rem_sign ? cur_rem_7[REM_WIDTH-1:0]
                                                            : cur_rem_5[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_7[REM_WIDTH-1:0]  = rem_sign ? cur_rem_8[REM_WIDTH-1:0]
                                                            : cur_rem_6[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_8[REM_WIDTH-1:0]  = rem_sign ? cur_rem_9[REM_WIDTH-1:0]
                                                            : cur_rem_7[REM_WIDTH-1:0];
assign remainder_minus_nor_nxt_9[REM_WIDTH-1:0]  = rem_sign ? rem_minus_minus_6[REM_WIDTH-1:0]
                                                            : cur_rem_8[REM_WIDTH-1:0];
// &CombBeg;                       @1033
always @( remainder_minus_nor_nxt_6[70:0]
       or remainder_minus_nor_nxt_0[70:0]
       or bound_cmp_sign[8:0]
       or remainder_minus_nor_nxt_2[70:0]
       or remainder_minus_nor_nxt_1[70:0]
       or remainder_minus_nor_nxt_9[70:0]
       or remainder_minus_nor_nxt_8[70:0]
       or remainder_minus_nor_nxt_7[70:0]
       or remainder_minus_nor_nxt_4[70:0]
       or remainder_minus_nor_nxt_3[70:0]
       or remainder_minus_nor_nxt_5[70:0])
begin
case({bound_cmp_sign[8:0]})
  9'b111111111: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_0[REM_WIDTH-1:0];//0
  9'b011111111: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_1[REM_WIDTH-1:0];//+-1
  9'b001111111: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_2[REM_WIDTH-1:0];//+-2
  9'b000111111: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_3[REM_WIDTH-1:0];//+-3
  9'b000011111: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_4[REM_WIDTH-1:0];//+-4
  9'b000001111: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_5[REM_WIDTH-1:0];//+-5
  9'b000000111: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_6[REM_WIDTH-1:0];//+-6
  9'b000000011: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_7[REM_WIDTH-1:0];//+-7
  9'b000000001: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_8[REM_WIDTH-1:0];//+-8
  9'b000000000: srt_remainder_minus_nxt[REM_WIDTH-1:0] = remainder_minus_nor_nxt_9[REM_WIDTH-1:0];//+-9
  default :     srt_remainder_minus_nxt[REM_WIDTH-1:0] = {REM_WIDTH{1'bx}};
endcase
// &CombEnd; @1047
end

// &CombBeg;                       @1049
always @( rem_neg_nxt_8[70:0]
       or rem_neg_nxt_1[70:0]
       or rem_neg_nxt_9[70:0]
       or bound_cmp_sign[8:0]
       or rem_neg_nxt_7[70:0]
       or rem_neg_nxt_5[70:0]
       or rem_neg_nxt_2[70:0]
       or rem_neg_nxt_4[70:0]
       or rem_neg_nxt_3[70:0]
       or rem_neg_nxt_6[70:0]
       or rem_neg_nxt_0[70:0])
begin
case({bound_cmp_sign[8:0]})
  9'b111111111: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_0[REM_WIDTH-1:0];
  9'b011111111: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_1[REM_WIDTH-1:0];
  9'b001111111: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_2[REM_WIDTH-1:0]; 
  9'b000111111: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_3[REM_WIDTH-1:0]; 
  9'b000011111: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_4[REM_WIDTH-1:0];
  9'b000001111: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_5[REM_WIDTH-1:0];
  9'b000000111: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_6[REM_WIDTH-1:0];
  9'b000000011: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_7[REM_WIDTH-1:0];
  9'b000000001: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_8[REM_WIDTH-1:0];
  9'b000000000: srt_remainder_neg_nxt[REM_WIDTH-1:0] = rem_neg_nxt_9[REM_WIDTH-1:0];
  default :     srt_remainder_neg_nxt[REM_WIDTH-1:0] = {REM_WIDTH{1'bx}};
endcase
// &CombEnd; @1063
end

// &ModuleEnd; @1065
endmodule


