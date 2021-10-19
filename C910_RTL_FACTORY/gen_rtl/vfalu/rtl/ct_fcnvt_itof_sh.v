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
module ct_fcnvt_itof_sh(
  ff1_sh_c_in,
  ff1_sh_cnt,
  ff1_sh_cnt_p1,
  ff1_sh_d_add_1,
  ff1_sh_d_c_eq_0p5,
  ff1_sh_d_c_gt_0p5,
  ff1_sh_d_c_zero,
  ff1_sh_f_v,
  ff1_sh_f_x,
  ff1_sh_h_add_1,
  ff1_sh_h_c_eq_0p5,
  ff1_sh_h_c_gt_0p5,
  ff1_sh_h_c_zero,
  ff1_sh_s_add_1,
  ff1_sh_s_c_eq_0p5,
  ff1_sh_s_c_gt_0p5,
  ff1_sh_s_c_zero,
  ff1_sh_src
);

// &Ports; @23
input   [63:0]  ff1_sh_src;       
output          ff1_sh_c_in;      
output  [5 :0]  ff1_sh_cnt;       
output  [5 :0]  ff1_sh_cnt_p1;    
output  [52:0]  ff1_sh_d_add_1;   
output          ff1_sh_d_c_eq_0p5; 
output          ff1_sh_d_c_gt_0p5; 
output          ff1_sh_d_c_zero;  
output  [23:0]  ff1_sh_f_v;       
output  [39:0]  ff1_sh_f_x;       
output  [52:0]  ff1_sh_h_add_1;   
output          ff1_sh_h_c_eq_0p5; 
output          ff1_sh_h_c_gt_0p5; 
output          ff1_sh_h_c_zero;  
output  [52:0]  ff1_sh_s_add_1;   
output          ff1_sh_s_c_eq_0p5; 
output          ff1_sh_s_c_gt_0p5; 
output          ff1_sh_s_c_zero;  

// &Regs; @24
reg             ff1_sh_c_in;      
reg     [5 :0]  ff1_sh_cnt;       
reg     [5 :0]  ff1_sh_cnt_p1;    
reg     [52:0]  ff1_sh_d_add_1;   
reg             ff1_sh_d_c_eq_0p5; 
reg             ff1_sh_d_c_gt_0p5; 
reg             ff1_sh_d_c_zero;  
reg     [23:0]  ff1_sh_f_v;       
reg     [39:0]  ff1_sh_f_x;       
reg     [52:0]  ff1_sh_h_add_1;   
reg             ff1_sh_h_c_eq_0p5; 
reg             ff1_sh_h_c_gt_0p5; 
reg             ff1_sh_h_c_zero;  
reg     [52:0]  ff1_sh_s_add_1;   
reg             ff1_sh_s_c_eq_0p5; 
reg             ff1_sh_s_c_gt_0p5; 
reg             ff1_sh_s_c_zero;  

// &Wires; @25
wire    [63:0]  ff1_sh_src;       



// &CombBeg; @28
always @( ff1_sh_src[63:0])
begin
casez(ff1_sh_src[63:0])
 64'b1???_????_????_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]     = 6'd63;
    ff1_sh_cnt_p1[5:0]  = 6'd0;
    ff1_sh_f_v[23:0]    = ff1_sh_src[63:40];
    ff1_sh_f_x[39:0]    = ff1_sh_src[39:0];
    ff1_sh_c_in         = &ff1_sh_src[63:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[10:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[10:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[10] &&  &ff1_sh_src[9:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[10] && ~&ff1_sh_src[9:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[39:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[39:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[39] &&  &ff1_sh_src[38:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[39] && ~&ff1_sh_src[38:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[52:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[52:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[52] &&  &ff1_sh_src[51:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[52] && ~&ff1_sh_src[51:0];
  end
 64'b01??_????_????_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd62;
    ff1_sh_cnt_p1[5:0]  = 6'd63;
    ff1_sh_f_v[23:0] = ff1_sh_src[62:39];
    ff1_sh_f_x[39:0] = {ff1_sh_src[38:0],1'd0};
    ff1_sh_c_in      = &ff1_sh_src[62:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[9:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[9:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[9] &&  &ff1_sh_src[8:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[9] && ~&ff1_sh_src[8:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[38:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[38:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[38] &&  &ff1_sh_src[37:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[38] && ~&ff1_sh_src[37:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[51:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[51:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[51] &&  &ff1_sh_src[50:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[51] && ~&ff1_sh_src[50:0];

  end
 64'b001?_????_????_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]     = 6'd61;
    ff1_sh_cnt_p1[5:0]  = 6'd62;
    ff1_sh_f_v[23:0] = ff1_sh_src[61:38];
    ff1_sh_f_x[39:0] = {ff1_sh_src[37:0],2'd0};
    ff1_sh_c_in      = &ff1_sh_src[61:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[8:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[8:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[8] &&  &ff1_sh_src[7:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[8] && ~&ff1_sh_src[7:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[37:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[37:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[37] &&  &ff1_sh_src[36:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[37] && ~&ff1_sh_src[36:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[50:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[50:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[50] &&  &ff1_sh_src[49:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[50] && ~&ff1_sh_src[49:0];

  end
 64'b0001_????_????_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd60;
    ff1_sh_cnt_p1[5:0]  = 6'd61;
    ff1_sh_f_v[23:0] = ff1_sh_src[60:37];
    ff1_sh_f_x[39:0] = {ff1_sh_src[36:0],3'd0};
    ff1_sh_c_in      = &ff1_sh_src[60:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[7:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[7:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[7] &&  &ff1_sh_src[6:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[7] && ~&ff1_sh_src[6:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[36:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[36:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[36] &&  &ff1_sh_src[35:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[36] && ~&ff1_sh_src[35:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[49:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[49:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[49] &&  &ff1_sh_src[48:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[49] && ~&ff1_sh_src[48:0];

  end
 64'b0000_1???_????_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd59;
    ff1_sh_cnt_p1[5:0]  = 6'd60;
    ff1_sh_f_v[23:0] = ff1_sh_src[59:36];
    ff1_sh_f_x[39:0] = {ff1_sh_src[35:0],4'd0};
    ff1_sh_c_in      = &ff1_sh_src[59:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[6:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[6:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[6] &&  &ff1_sh_src[5:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[6] && ~&ff1_sh_src[5:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[35:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[35:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[35] &&  &ff1_sh_src[34:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[35] && ~&ff1_sh_src[34:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[48:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[48:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[48] &&  &ff1_sh_src[47:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[48] && ~&ff1_sh_src[47:0];

  end
 64'b0000_01??_????_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd58;
    ff1_sh_cnt_p1[5:0]  = 6'd59;
    ff1_sh_f_v[23:0] = ff1_sh_src[58:35];
    ff1_sh_f_x[39:0] = {ff1_sh_src[34:0],5'd0};
    ff1_sh_c_in      = &ff1_sh_src[58:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[5:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[5:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[5] &&  &ff1_sh_src[4:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[5] && ~&ff1_sh_src[4:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[34:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[34:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[34] &&  &ff1_sh_src[33:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[34] && ~&ff1_sh_src[33:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[47:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[47:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[47] &&  &ff1_sh_src[46:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[47] && ~&ff1_sh_src[46:0];

  end
 64'b0000_001?_????_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd57;
    ff1_sh_cnt_p1[5:0]  = 6'd58;
    ff1_sh_f_v[23:0] = ff1_sh_src[57:34];
    ff1_sh_f_x[39:0] = {ff1_sh_src[33:0],6'd0};
    ff1_sh_c_in      = &ff1_sh_src[57:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[4:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[4:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[4] &&  &ff1_sh_src[3:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[4] && ~&ff1_sh_src[3:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[33:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[33:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[33] &&  &ff1_sh_src[32:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[33] && ~&ff1_sh_src[32:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[46:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[46:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[46] &&  &ff1_sh_src[45:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[46] && ~&ff1_sh_src[45:0];

  end
 64'b0000_0001_????_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd56;
    ff1_sh_cnt_p1[5:0]  = 6'd57;
    ff1_sh_f_v[23:0] = ff1_sh_src[56:33];
    ff1_sh_f_x[39:0] = {ff1_sh_src[32:0],7'd0};
    ff1_sh_c_in      = &ff1_sh_src[56:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[3:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[3:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[3] &&  &ff1_sh_src[2:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[3] && ~&ff1_sh_src[2:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[32:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[32:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[32] &&  &ff1_sh_src[31:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[32] && ~&ff1_sh_src[31:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[45:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[45:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[45] &&  &ff1_sh_src[44:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[45] && ~&ff1_sh_src[44:0];

  end
 64'b0000_0000_1???_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd55;
    ff1_sh_cnt_p1[5:0]  = 6'd56;
    ff1_sh_f_v[23:0] = ff1_sh_src[55:32];
    ff1_sh_f_x[39:0] = {ff1_sh_src[31:0],8'd0};
    ff1_sh_c_in      = &ff1_sh_src[55:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[2:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[2:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[2] &&  &ff1_sh_src[1:0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[2] && ~&ff1_sh_src[1:0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[31:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[31:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[31] &&  &ff1_sh_src[30:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[31] && ~&ff1_sh_src[30:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[44:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[44:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[44] &&  &ff1_sh_src[43:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[44] && ~&ff1_sh_src[43:0];

  end
 64'b0000_0000_01??_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd54;
    ff1_sh_cnt_p1[5:0]  = 6'd55;
    ff1_sh_f_v[23:0] = ff1_sh_src[54:31];
    ff1_sh_f_x[39:0] = {ff1_sh_src[30:0],9'd0};
    ff1_sh_c_in      = &ff1_sh_src[54:0];
    ff1_sh_d_add_1[52:0]= {52'b0,&ff1_sh_src[1:0]};
    ff1_sh_d_c_zero     = &ff1_sh_src[1:0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[1] &&  ff1_sh_src[0];
    ff1_sh_d_c_gt_0p5   = ff1_sh_src[1] && ~ff1_sh_src[0];
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[30:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[30:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[30] &&  &ff1_sh_src[29:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[30] && ~&ff1_sh_src[29:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[43:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[43:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[43] &&  &ff1_sh_src[42:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[43] && ~&ff1_sh_src[42:0];

  end
 64'b0000_0000_001?_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd53;
    ff1_sh_cnt_p1[5:0]  = 6'd54;
    ff1_sh_f_v[23:0] = ff1_sh_src[53:30];
    ff1_sh_f_x[39:0] = {ff1_sh_src[29:0],10'd0};
    ff1_sh_c_in      = &ff1_sh_src[53:0];
    ff1_sh_d_add_1[52:0]= {52'b0,ff1_sh_src[0]};
    ff1_sh_d_c_zero     = ff1_sh_src[0];
    ff1_sh_d_c_eq_0p5   = ~ff1_sh_src[0];
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[29:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[29:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[29] &&  &ff1_sh_src[28:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[29] && ~&ff1_sh_src[28:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[42:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[42:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[42] &&  &ff1_sh_src[41:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[42] && ~&ff1_sh_src[41:0];

  end
 64'b0000_0000_0001_????_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd52;
    ff1_sh_cnt_p1[5:0]  = 6'd53;
    ff1_sh_f_v[23:0] = ff1_sh_src[52:29];
    ff1_sh_f_x[39:0] = {ff1_sh_src[28:0],11'd0};
    ff1_sh_c_in      = &ff1_sh_src[52:0];
    ff1_sh_d_add_1[52:0]= {52'b0,1'b1};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[28:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[28:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[28] &&  &ff1_sh_src[27:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[28] && ~&ff1_sh_src[27:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[41:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[41:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[41] &&  &ff1_sh_src[40:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[41] && ~&ff1_sh_src[40:0];

  end
 64'b0000_0000_0000_1???_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd51;
    ff1_sh_cnt_p1[5:0]  = 6'd52;
    ff1_sh_f_v[23:0] = ff1_sh_src[51:28];
    ff1_sh_f_x[39:0] = {ff1_sh_src[27:0],12'd0};
    ff1_sh_c_in      = &ff1_sh_src[51:0];
    ff1_sh_d_add_1[52:0]= {53'b10};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[27:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[27:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[27] &&  &ff1_sh_src[26:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[27] && ~&ff1_sh_src[26:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[40:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[40:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[40] &&  &ff1_sh_src[39:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[40] && ~&ff1_sh_src[39:0];

  end
 64'b0000_0000_0000_01??_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd50;
    ff1_sh_cnt_p1[5:0]  = 6'd51;
    ff1_sh_f_v[23:0] = ff1_sh_src[50:27];
    ff1_sh_f_x[39:0] = {ff1_sh_src[26:0],13'd0};
    ff1_sh_c_in      = &ff1_sh_src[50:0];
    ff1_sh_d_add_1[52:0]= {53'h4};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[26:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[26:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[26] &&  &ff1_sh_src[25:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[26] && ~&ff1_sh_src[25:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[39:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[39:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[39] &&  &ff1_sh_src[38:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[39] && ~&ff1_sh_src[38:0];

  end
 64'b0000_0000_0000_001?_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd49;
    ff1_sh_cnt_p1[5:0]  = 6'd50;
    ff1_sh_f_v[23:0] = ff1_sh_src[49:26];
    ff1_sh_f_x[39:0] = {ff1_sh_src[25:0],14'd0};
    ff1_sh_c_in      = &ff1_sh_src[49:0];
    ff1_sh_d_add_1[52:0]= {53'h8};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[25:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[25:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[25] &&  &ff1_sh_src[24:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[25] && ~&ff1_sh_src[24:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[38:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[38:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[38] &&  &ff1_sh_src[37:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[38] && ~&ff1_sh_src[37:0];

  end
 64'b0000_0000_0000_0001_????_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd48;
    ff1_sh_cnt_p1[5:0]  = 6'd49;
    ff1_sh_f_v[23:0] = ff1_sh_src[48:25];
    ff1_sh_f_x[39:0] = {ff1_sh_src[24:0],15'd0};
    ff1_sh_c_in      = &ff1_sh_src[48:0];
    ff1_sh_d_add_1[52:0]= {53'h10};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[24:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[24:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[24] &&  &ff1_sh_src[23:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[24] && ~&ff1_sh_src[23:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[37:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[37:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[37] &&  &ff1_sh_src[36:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[37] && ~&ff1_sh_src[36:0];

  end
 64'b0000_0000_0000_0000_1???_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd47;
    ff1_sh_cnt_p1[5:0]  = 6'd48;
    ff1_sh_f_v[23:0] = ff1_sh_src[47:24];
    ff1_sh_f_x[39:0] = {ff1_sh_src[23:0],16'd0};
    ff1_sh_c_in      = &ff1_sh_src[47:0];
    ff1_sh_d_add_1[52:0]= {53'h20};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[23:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[23:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[23] &&  &ff1_sh_src[22:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[23] && ~&ff1_sh_src[22:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[36:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[36:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[36] &&  &ff1_sh_src[35:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[36] && ~&ff1_sh_src[35:0];

  end
 64'b0000_0000_0000_0000_01??_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd46;
    ff1_sh_cnt_p1[5:0]  = 6'd47;
    ff1_sh_f_v[23:0] = ff1_sh_src[46:23];
    ff1_sh_f_x[39:0] = {ff1_sh_src[22:0],17'd0};
    ff1_sh_c_in      = &ff1_sh_src[46:0];
    ff1_sh_d_add_1[52:0]= {53'h40};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[22:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[22:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[22] &&  &ff1_sh_src[21:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[22] && ~&ff1_sh_src[21:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[35:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[35:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[35] &&  &ff1_sh_src[34:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[35] && ~&ff1_sh_src[34:0];

  end
 64'b0000_0000_0000_0000_001?_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd45;
    ff1_sh_cnt_p1[5:0]  = 6'd46;
    ff1_sh_f_v[23:0] = ff1_sh_src[45:22];
    ff1_sh_f_x[39:0] = {ff1_sh_src[21:0],18'd0};
    ff1_sh_c_in      = &ff1_sh_src[45:0];
    ff1_sh_d_add_1[52:0]= {53'h80};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[21:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[21:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[21] &&  &ff1_sh_src[20:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[21] && ~&ff1_sh_src[20:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[34:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[34:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[34] &&  &ff1_sh_src[33:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[34] && ~&ff1_sh_src[33:0];

  end
 64'b0000_0000_0000_0000_0001_????_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd44;
    ff1_sh_cnt_p1[5:0]  = 6'd45;
    ff1_sh_f_v[23:0] = ff1_sh_src[44:21];
    ff1_sh_f_x[39:0] = {ff1_sh_src[20:0],19'd0};
    ff1_sh_c_in      = &ff1_sh_src[44:0];
    ff1_sh_d_add_1[52:0]= {53'h100};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[20:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[20:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[20] &&  &ff1_sh_src[19:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[20] && ~&ff1_sh_src[19:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[33:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[33:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[33] &&  &ff1_sh_src[32:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[33] && ~&ff1_sh_src[32:0];

  end
 64'b0000_0000_0000_0000_0000_1???_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd43;
    ff1_sh_cnt_p1[5:0]  = 6'd44;
    ff1_sh_f_v[23:0] = ff1_sh_src[43:20];
    ff1_sh_f_x[39:0] = {ff1_sh_src[19:0],20'd0};
    ff1_sh_c_in      = &ff1_sh_src[43:0];
    ff1_sh_d_add_1[52:0]= {53'h200};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[19:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[19:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[19] &&  &ff1_sh_src[18:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[19] && ~&ff1_sh_src[18:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[32:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[32:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[32] &&  &ff1_sh_src[31:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[32] && ~&ff1_sh_src[31:0];

  end
 64'b0000_0000_0000_0000_0000_01??_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd42;
    ff1_sh_cnt_p1[5:0]  = 6'd43;
    ff1_sh_f_v[23:0] = ff1_sh_src[42:19];
    ff1_sh_f_x[39:0] = {ff1_sh_src[18:0],21'd0};
    ff1_sh_c_in      = &ff1_sh_src[42:0];
    ff1_sh_d_add_1[52:0]= {53'h400};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[18:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[18:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[18] &&  &ff1_sh_src[17:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[18] && ~&ff1_sh_src[17:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[31:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[31:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[31] &&  &ff1_sh_src[30:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[31] && ~&ff1_sh_src[30:0];

  end
 64'b0000_0000_0000_0000_0000_001?_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd41;
    ff1_sh_cnt_p1[5:0]  = 6'd42;
    ff1_sh_f_v[23:0] = ff1_sh_src[41:18];
    ff1_sh_f_x[39:0] = {ff1_sh_src[17:0],22'd0};
    ff1_sh_c_in      = &ff1_sh_src[41:0];
    ff1_sh_d_add_1[52:0]= {53'h800};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[17:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[17:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[17] &&  &ff1_sh_src[16:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[17] && ~&ff1_sh_src[16:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[30:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[30:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[30] &&  &ff1_sh_src[29:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[30] && ~&ff1_sh_src[29:0];

  end
 64'b0000_0000_0000_0000_0000_0001_????_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd40;
    ff1_sh_cnt_p1[5:0]  = 6'd41;
    ff1_sh_f_v[23:0] = ff1_sh_src[40:17];
    ff1_sh_f_x[39:0] = {ff1_sh_src[16:0],23'd0};
    ff1_sh_c_in      = &ff1_sh_src[40:0];
    ff1_sh_d_add_1[52:0]= {53'h1000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[16:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[16:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[16] &&  &ff1_sh_src[15:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[16] && ~&ff1_sh_src[15:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[29:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[29:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[29] &&  &ff1_sh_src[28:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[29] && ~&ff1_sh_src[28:0];

  end
 64'b0000_0000_0000_0000_0000_0000_1???_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd39;
    ff1_sh_cnt_p1[5:0]  = 6'd40;
    ff1_sh_f_v[23:0] = ff1_sh_src[39:16];
    ff1_sh_f_x[39:0] = {ff1_sh_src[15:0],24'd0};
    ff1_sh_c_in      = &ff1_sh_src[39:0];
    ff1_sh_d_add_1[52:0]= {53'h2000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[15:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[15:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[15] &&  &ff1_sh_src[14:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[15] && ~&ff1_sh_src[14:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[28:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[28:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[28] &&  &ff1_sh_src[27:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[28] && ~&ff1_sh_src[27:0];

  end
 64'b0000_0000_0000_0000_0000_0000_01??_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd38;
    ff1_sh_cnt_p1[5:0]  = 6'd39;
    ff1_sh_f_v[23:0] = ff1_sh_src[38:15];
    ff1_sh_f_x[39:0] = {ff1_sh_src[14:0],25'd0};
    ff1_sh_c_in      = &ff1_sh_src[38:0];
    ff1_sh_d_add_1[52:0]= {53'h4000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[14:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[14:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[14] &&  &ff1_sh_src[13:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[14] && ~&ff1_sh_src[13:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[27:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[27:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[27] &&  &ff1_sh_src[26:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[27] && ~&ff1_sh_src[26:0];

  end
 64'b0000_0000_0000_0000_0000_0000_001?_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd37;
    ff1_sh_cnt_p1[5:0]  = 6'd38;
    ff1_sh_f_v[23:0] = ff1_sh_src[37:14];
    ff1_sh_f_x[39:0] = {ff1_sh_src[13:0],26'd0};
    ff1_sh_c_in      = &ff1_sh_src[37:0];
    ff1_sh_d_add_1[52:0]= {53'h8000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[13:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[13:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[13] &&  &ff1_sh_src[12:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[13] && ~&ff1_sh_src[12:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[26:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[26:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[26] &&  &ff1_sh_src[25:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[26] && ~&ff1_sh_src[25:0];

  end

 64'b0000_0000_0000_0000_0000_0000_0001_????_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd36;
    ff1_sh_cnt_p1[5:0]  = 6'd37;
    ff1_sh_f_v[23:0] = ff1_sh_src[36:13];
    ff1_sh_f_x[39:0] = {ff1_sh_src[12:0],27'd0};
    ff1_sh_c_in      = &ff1_sh_src[36:0];
    ff1_sh_d_add_1[52:0]= {53'h10000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[12:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[12:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[12] &&  &ff1_sh_src[11:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[12] && ~&ff1_sh_src[11:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[25:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[25:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[25] &&  &ff1_sh_src[24:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[25] && ~&ff1_sh_src[24:0];

  end
 64'b0000_0000_0000_0000_0000_0000_0000_1???_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd35;
    ff1_sh_cnt_p1[5:0]  = 6'd36;
    ff1_sh_f_v[23:0] = ff1_sh_src[35:12];
    ff1_sh_f_x[39:0] = {ff1_sh_src[11:0],28'd0};
    ff1_sh_c_in      = &ff1_sh_src[35:0];
    ff1_sh_d_add_1[52:0]= {53'h20000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[11:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[11:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[11] &&  &ff1_sh_src[10:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[11] && ~&ff1_sh_src[10:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[24:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[24:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[24] &&  &ff1_sh_src[23:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[24] && ~&ff1_sh_src[23:0];

  end
 64'b0000_0000_0000_0000_0000_0000_0000_01??_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd34;
    ff1_sh_cnt_p1[5:0]  = 6'd35;
    ff1_sh_f_v[23:0] = ff1_sh_src[34:11];
    ff1_sh_f_x[39:0] = {ff1_sh_src[10:0],29'd0};
    ff1_sh_c_in      = &ff1_sh_src[34:0];
    ff1_sh_d_add_1[52:0]= {53'h40000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[10:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[10:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[10] &&  &ff1_sh_src[9:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[10] && ~&ff1_sh_src[9:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[23:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[23:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[23] &&  &ff1_sh_src[22:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[23] && ~&ff1_sh_src[22:0];

  end
 64'b0000_0000_0000_0000_0000_0000_0000_001?_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd33;
    ff1_sh_cnt_p1[5:0]  = 6'd34;
    ff1_sh_f_v[23:0] = ff1_sh_src[33:10];
    ff1_sh_f_x[39:0] = {ff1_sh_src[9:0],30'd0};
    ff1_sh_c_in      = &ff1_sh_src[33:0];
    ff1_sh_d_add_1[52:0]= {53'h80000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[9:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[9:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[9] &&  &ff1_sh_src[8:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[9] && ~&ff1_sh_src[8:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[22:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[22:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[22] &&  &ff1_sh_src[21:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[22] && ~&ff1_sh_src[21:0];

  end
 64'b0000_0000_0000_0000_0000_0000_0000_0001_????_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd32;
    ff1_sh_cnt_p1[5:0]  = 6'd33;
    ff1_sh_f_v[23:0] = ff1_sh_src[32:9];
    ff1_sh_f_x[39:0] = {ff1_sh_src[8:0],31'd0};
    ff1_sh_c_in      = &ff1_sh_src[32:0];
    ff1_sh_d_add_1[52:0]= {53'h100000};
    ff1_sh_d_c_zero     =1'b1;
    ff1_sh_d_c_eq_0p5   =1'b0; 
    ff1_sh_d_c_gt_0p5   =1'b0; 
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[8:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[8:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[8] &&  &ff1_sh_src[7:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[8] && ~&ff1_sh_src[7:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[21:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[21:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[21] &&  &ff1_sh_src[20:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[21] && ~&ff1_sh_src[20:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_1???_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd31;
    ff1_sh_cnt_p1[5:0]  = 6'd32;
    ff1_sh_f_v[23:0] = ff1_sh_src[31:8];
    ff1_sh_f_x[39:0] = {ff1_sh_src[7:0],32'd0};
    ff1_sh_c_in      = &ff1_sh_src[31:0];
    ff1_sh_d_add_1[52:0]= {53'h200000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[7:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[7:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[7] &&  &ff1_sh_src[6:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[7] && ~&ff1_sh_src[6:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[20:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[20:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[20] &&  &ff1_sh_src[19:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[20] && ~&ff1_sh_src[19:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_01??_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd30;
    ff1_sh_cnt_p1[5:0]  = 6'd31;
    ff1_sh_f_v[23:0] = ff1_sh_src[30:7];
    ff1_sh_f_x[39:0] = {ff1_sh_src[6:0], 33'd0};
    ff1_sh_c_in      = &ff1_sh_src[30:0];
    ff1_sh_d_add_1[52:0]= {53'h400000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[6:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[6:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[6] &&  &ff1_sh_src[5:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[6] && ~&ff1_sh_src[5:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[19:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[19:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[19] &&  &ff1_sh_src[18:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[19] && ~&ff1_sh_src[18:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_001?_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd29;
    ff1_sh_cnt_p1[5:0]  = 6'd30;
    ff1_sh_f_v[23:0] = ff1_sh_src[29:6];
    ff1_sh_f_x[39:0] = {ff1_sh_src[5:0], 34'd0};
    ff1_sh_c_in      = &ff1_sh_src[29:0];
    ff1_sh_d_add_1[52:0]= {53'h800000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[5:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[5:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[5] &&  &ff1_sh_src[4:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[5] && ~&ff1_sh_src[4:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[18:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[18:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[18] &&  &ff1_sh_src[17:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[18] && ~&ff1_sh_src[17:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0001_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd28;
    ff1_sh_cnt_p1[5:0]  = 6'd29;
    ff1_sh_f_v[23:0] = ff1_sh_src[28:5];
    ff1_sh_f_x[39:0] = {ff1_sh_src[4:0], 35'd0};
    ff1_sh_c_in      = &ff1_sh_src[28:0];
    ff1_sh_d_add_1[52:0]= {53'h1000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[4:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[4:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[4] &&  &ff1_sh_src[3:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[4] && ~&ff1_sh_src[3:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[17:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[17:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[17] &&  &ff1_sh_src[16:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[17] && ~&ff1_sh_src[16:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_1???_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd27;
    ff1_sh_cnt_p1[5:0]  = 6'd28;
    ff1_sh_f_v[23:0] = ff1_sh_src[27:4];
    ff1_sh_f_x[39:0] = {ff1_sh_src[3:0], 36'd0};
    ff1_sh_c_in      = &ff1_sh_src[27:0];
    ff1_sh_d_add_1[52:0]= {53'h2000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[3:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[3:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[3] &&  &ff1_sh_src[2:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[3] && ~&ff1_sh_src[2:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[16:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[16:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[16] &&  &ff1_sh_src[15:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[16] && ~&ff1_sh_src[15:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_01??_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd26;
    ff1_sh_cnt_p1[5:0]  = 6'd27;
    ff1_sh_f_v[23:0] = ff1_sh_src[26:3];
    ff1_sh_f_x[39:0] = {ff1_sh_src[2:0], 37'd0};
    ff1_sh_c_in      = &ff1_sh_src[26:0];
    ff1_sh_d_add_1[52:0]= {53'h4000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[2:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[2:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[2] &&  &ff1_sh_src[1:0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[2] && ~&ff1_sh_src[1:0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[15:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[15:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[15] &&  &ff1_sh_src[14:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[15] && ~&ff1_sh_src[14:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_001?_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd25;
    ff1_sh_cnt_p1[5:0]  = 6'd26;
    ff1_sh_f_v[23:0] = ff1_sh_src[25:2];
    ff1_sh_f_x[39:0] = {ff1_sh_src[1:0], 38'd0};
    ff1_sh_c_in      = &ff1_sh_src[25:0];
    ff1_sh_d_add_1[52:0]= {53'h8000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,&ff1_sh_src[1:0],29'b0};
    ff1_sh_s_c_zero     = &ff1_sh_src[1:0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[1] &&  ff1_sh_src[0];
    ff1_sh_s_c_gt_0p5   = ff1_sh_src[1] && ~ff1_sh_src[0];
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[14:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[14:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[14] &&  &ff1_sh_src[13:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[14] && ~&ff1_sh_src[13:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0001_????_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd24;
    ff1_sh_cnt_p1[5:0]  = 6'd25;
    ff1_sh_f_v[23:0] = ff1_sh_src[24:1];
    ff1_sh_f_x[39:0] = {ff1_sh_src[0], 39'd0};
    ff1_sh_c_in      = &ff1_sh_src[24:0];
    ff1_sh_d_add_1[52:0]= {53'h10000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,ff1_sh_src[0],29'b0};
    ff1_sh_s_c_zero     = ff1_sh_src[0];
    ff1_sh_s_c_eq_0p5   = ~ff1_sh_src[0];
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[13:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[13:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[13] &&  &ff1_sh_src[12:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[13] && ~&ff1_sh_src[12:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1???_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd23;
    ff1_sh_cnt_p1[5:0]  = 6'd24;
    ff1_sh_f_v[23:0] = ff1_sh_src[23:0];
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[23:0];
    ff1_sh_d_add_1[52:0]= {53'h20000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {23'b0,1'b1,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[12:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[12:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[12] &&  &ff1_sh_src[11:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[12] && ~&ff1_sh_src[11:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_01??_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd22;
    ff1_sh_cnt_p1[5:0]  = 6'd23;
    ff1_sh_f_v[23:0] = {ff1_sh_src[22:0], 1'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[22:0];
    ff1_sh_d_add_1[52:0]= {53'h40000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h2,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[11:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[11:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[11] &&  &ff1_sh_src[10:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[11] && ~&ff1_sh_src[10:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_001?_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd21;
    ff1_sh_cnt_p1[5:0]  = 6'd22;
    ff1_sh_f_v[23:0] = {ff1_sh_src[21:0], 2'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[21:0];
    ff1_sh_d_add_1[52:0]= {53'h80000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h4,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[10:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[10:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[10] &&  &ff1_sh_src[9:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[10] && ~&ff1_sh_src[9:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001_????_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd20;
    ff1_sh_cnt_p1[5:0]  = 6'd21;
    ff1_sh_f_v[23:0] = {ff1_sh_src[20:0], 3'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[20:0];
    ff1_sh_d_add_1[52:0]= {53'h100000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h8,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[9:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[9:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[9] &&  &ff1_sh_src[8:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[9] && ~&ff1_sh_src[8:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1???_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd19;
    ff1_sh_cnt_p1[5:0]  = 6'd20;
    ff1_sh_f_v[23:0] = {ff1_sh_src[19:0], 4'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[19:0];
    ff1_sh_d_add_1[52:0]= {53'h200000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h10,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[8:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[8:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[8] &&  &ff1_sh_src[7:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[8] && ~&ff1_sh_src[7:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_01??_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd18;
    ff1_sh_cnt_p1[5:0]  = 6'd19;
    ff1_sh_f_v[23:0] = {ff1_sh_src[18:0], 5'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[18:0];
    ff1_sh_d_add_1[52:0]= {53'h400000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h20,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[7:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[7:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[7] &&  &ff1_sh_src[6:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[7] && ~&ff1_sh_src[6:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_001?_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd17;
    ff1_sh_cnt_p1[5:0]  = 6'd18;
    ff1_sh_f_v[23:0] = {ff1_sh_src[17:0], 6'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[17:0];
    ff1_sh_d_add_1[52:0]= {53'h800000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h40,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[6:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[6:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[6] &&  &ff1_sh_src[5:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[6] && ~&ff1_sh_src[5:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001_????_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd16;
    ff1_sh_cnt_p1[5:0]  = 6'd17;
    ff1_sh_f_v[23:0] = {ff1_sh_src[16:0], 7'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[16:0];
    ff1_sh_d_add_1[52:0]= {53'h1000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h80,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[5:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[5:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[5] &&  &ff1_sh_src[4:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[5] && ~&ff1_sh_src[4:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1???_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd15;
    ff1_sh_cnt_p1[5:0]  = 6'd16;
    ff1_sh_f_v[23:0] = {ff1_sh_src[15:0], 8'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[15:0];
    ff1_sh_d_add_1[52:0]= {53'h2000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h100,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[4:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[4:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[4] &&  &ff1_sh_src[3:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[4] && ~&ff1_sh_src[3:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_01??_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd14;
    ff1_sh_cnt_p1[5:0]  = 6'd15;
    ff1_sh_f_v[23:0] = {ff1_sh_src[14:0], 9'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[14:0];
    ff1_sh_d_add_1[52:0]= {53'h4000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h200,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[3:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[3:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[3] &&  &ff1_sh_src[2:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[3] && ~&ff1_sh_src[2:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_001?_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd13;
    ff1_sh_cnt_p1[5:0]  = 6'd14;
    ff1_sh_f_v[23:0] = {ff1_sh_src[13:0], 10'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[13:0];
    ff1_sh_d_add_1[52:0]= {53'h8000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h400,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[2:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[2:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[2] &&  &ff1_sh_src[1:0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[2] && ~&ff1_sh_src[1:0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001_????_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd12;
    ff1_sh_cnt_p1[5:0]  = 6'd13;
    ff1_sh_f_v[23:0] = {ff1_sh_src[12:0], 11'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[12:0];
    ff1_sh_d_add_1[52:0]= {53'h10000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h800,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,&ff1_sh_src[1:0],42'b0};
    ff1_sh_h_c_zero     = &ff1_sh_src[1:0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[1] &&  ff1_sh_src[0];
    ff1_sh_h_c_gt_0p5   = ff1_sh_src[1] && ~ff1_sh_src[0];

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1???_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd11;
    ff1_sh_cnt_p1[5:0]  = 6'd12;
    ff1_sh_f_v[23:0] = {ff1_sh_src[11:0], 12'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[11:0];
    ff1_sh_d_add_1[52:0]= {53'h20000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h1000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,ff1_sh_src[0],42'b0};
    ff1_sh_h_c_zero     = ff1_sh_src[0];
    ff1_sh_h_c_eq_0p5   = ~ff1_sh_src[0];
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_01??_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd10;
    ff1_sh_cnt_p1[5:0]  = 6'd11;
    ff1_sh_f_v[23:0] = {ff1_sh_src[10:0], 13'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[10:0];
    ff1_sh_d_add_1[52:0]= {53'h40000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h2000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {10'b0,1'b1,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_001?_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd9;
    ff1_sh_cnt_p1[5:0]  = 6'd10;
    ff1_sh_f_v[23:0] = {ff1_sh_src[9:0], 14'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[9:0];
    ff1_sh_d_add_1[52:0]= {53'h80000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h4000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h2,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001_????_???? : begin
    ff1_sh_cnt[5:0]  = 6'd8;
    ff1_sh_cnt_p1[5:0]  = 6'd9;
    ff1_sh_f_v[23:0] = {ff1_sh_src[8:0], 15'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[8:0];
    ff1_sh_d_add_1[52:0]= {53'h100000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h8000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h4,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1???_???? : begin
    ff1_sh_cnt[5:0]  = 6'd7;
    ff1_sh_cnt_p1[5:0]  = 6'd8;
    ff1_sh_f_v[23:0] = {ff1_sh_src[7:0], 16'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[7:0];
    ff1_sh_d_add_1[52:0]= {53'h200000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h10000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h8,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_01??_???? : begin
    ff1_sh_cnt[5:0]  = 6'd6;
    ff1_sh_cnt_p1[5:0]  = 6'd7;
    ff1_sh_f_v[23:0] = {ff1_sh_src[6:0], 17'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[6:0];
    ff1_sh_d_add_1[52:0]= {53'h400000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h20000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h10,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end

  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_001?_???? : begin
    ff1_sh_cnt[5:0]  = 6'd5;
    ff1_sh_cnt_p1[5:0]  = 6'd6;
    ff1_sh_f_v[23:0] = {ff1_sh_src[5:0], 18'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[5:0];
    ff1_sh_d_add_1[52:0]= {53'h800000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h40000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h20,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001_???? : begin
    ff1_sh_cnt[5:0]  = 6'd4;
    ff1_sh_cnt_p1[5:0]  = 6'd5;
    ff1_sh_f_v[23:0] = {ff1_sh_src[4:0], 19'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[4:0];
    ff1_sh_d_add_1[52:0]= {53'h1000000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h80000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h40,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1??? : begin
    ff1_sh_cnt[5:0]  = 6'd3;
    ff1_sh_cnt_p1[5:0]  = 6'd4;
    ff1_sh_f_v[23:0] = {ff1_sh_src[3:0], 20'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[3:0];
    ff1_sh_d_add_1[52:0]= {53'h2000000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h100000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h80,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_01?? : begin
    ff1_sh_cnt[5:0]  = 6'd2;
    ff1_sh_cnt_p1[5:0]  = 6'd3;
    ff1_sh_f_v[23:0] = {ff1_sh_src[2:0], 21'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[2:0];
    ff1_sh_d_add_1[52:0]= {53'h4000000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h200000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h100,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_001? : begin
    ff1_sh_cnt[5:0]  = 6'd1;
    ff1_sh_cnt_p1[5:0]  = 6'd2;
    ff1_sh_f_v[23:0] = {ff1_sh_src[1:0], 22'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = &ff1_sh_src[1:0];
    ff1_sh_d_add_1[52:0]= {53'h8000000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h400000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h200,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001 : begin
    ff1_sh_cnt[5:0]  = 6'd0;
    ff1_sh_cnt_p1[5:0]  = 6'd1;
    ff1_sh_f_v[23:0] = {ff1_sh_src[0], 23'd0};
    ff1_sh_f_x[39:0] = 40'd0;
    ff1_sh_c_in      = ff1_sh_src[0];
    ff1_sh_d_add_1[52:0]= {53'h10000000000000};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h800000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h400,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
  default : begin
    ff1_sh_cnt[5:0]  = 6'b0;
    ff1_sh_cnt_p1[5:0]  = 6'd0;
    ff1_sh_f_v[23:0] = 24'b0;
    ff1_sh_f_x[39:0] = 40'b0;
    ff1_sh_c_in      = 1'b0;
    ff1_sh_d_add_1[52:0]= {53'h0};
    ff1_sh_d_c_zero     = 1'b1;
    ff1_sh_d_c_eq_0p5   = 1'b0;
    ff1_sh_d_c_gt_0p5   = 1'b0;
    ff1_sh_s_add_1[52:0]= {24'h000000,29'b0};
    ff1_sh_s_c_zero     = 1'b1;
    ff1_sh_s_c_eq_0p5   = 1'b0;
    ff1_sh_s_c_gt_0p5   = 1'b0;
    ff1_sh_h_add_1[52:0]= {11'h0,42'b0};
    ff1_sh_h_c_zero     = 1'b1;
    ff1_sh_h_c_eq_0p5   = 1'b0;
    ff1_sh_h_c_gt_0p5   = 1'b0;

  end
endcase
// &CombEnd; @1332
end

// &ModuleEnd; @1334
endmodule


