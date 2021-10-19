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
module ct_fadd_close_s1_h(
  close_adder0,
  close_adder1,
  close_op_chg,
  close_sum,
  close_sum_m1,
  ff1_pred,
  ff1_pred_onehot
);

// &Ports; @23
input   [11:0]  close_adder0;      
input   [11:0]  close_adder1;      
output          close_op_chg;      
output  [11:0]  close_sum;         
output  [11:0]  close_sum_m1;      
output  [5 :0]  ff1_pred;          
output  [11:0]  ff1_pred_onehot;   

// &Regs; @24
reg     [5 :0]  ff1_pred_t0;       
reg     [11:0]  ff1_pred_t0_onehot; 

// &Wires; @25
wire    [11:0]  close_adder0;      
wire    [11:0]  close_adder0_t0;   
wire    [11:0]  close_adder1;      
wire    [11:0]  close_adder1_t0;   
wire    [11:0]  close_ff1_a_t0;    
wire    [11:0]  close_ff1_b_t0;    
wire    [11:0]  close_ff1_c_t0;    
wire    [11:0]  close_ff1_f_t0;    
wire    [11:0]  close_ff1_g_t0;    
wire    [11:0]  close_ff1_t_t0;    
wire    [11:0]  close_ff1_z_t0;    
wire    [11:0]  close_m1_oper2;    
wire            close_op_chg;      
wire    [11:0]  close_sum;         
wire    [11:0]  close_sum_m1;      
wire    [11:0]  close_sum_m1_t0;   
wire    [11:0]  close_sum_t0;      
wire    [5 :0]  ff1_pred;          
wire    [11:0]  ff1_pred_onehot;   


//Three Type
//t0 : !src0_e_is_0 && !src1_e_is_0
//t1 : !src0_e_is_0 &&  src1_e_is_0
//t2 :  src0_e_is_0 &&  src1_e_is_0


//assign close_sum[11:0]    = {12{type0_sel}} & close_sum_t0[11:0] | 
//                            {12{type1_sel}} & close_sum_t1[11:0] | 
//                            {12{type2_sel}} & close_sum_t2[11:0];
//assign close_sum_m1[11:0] = {12{type0_sel}} & close_sum_m1_t0[11:0] | 
//                            {12{type1_sel}} & close_sum_m1_t1[11:0] | 
//                            {12{type2_sel}} & close_sum_m1_t2[11:0];
//assign ff1_pred[11:0]     = {12{type0_sel}} & ff1_pred_t0_onehot[11:0] | 
//                            {12{type1_sel}} & ff1_pred_t1_onehot[11:0] | 
//                            {12{type2_sel}} & ff1_pred_t2[11:0];                          

assign close_sum[11:0]       = close_sum_t0[11:0];
assign close_sum_m1[11:0]    = close_sum_m1_t0[11:0];
assign ff1_pred_onehot[11:0] = ff1_pred_t0_onehot[11:0];
assign ff1_pred[5:0]         = ff1_pred_t0[5:0];

assign close_op_chg       = close_sum[11];
// &Force("output","close_sum"); @49

assign close_adder0_t0[11:0] = close_adder0[11:0];
assign close_adder1_t0[11:0] = close_adder1[11:0];

assign close_m1_oper2[11:0] = 12'b10;
// &Force("nonport","close_sum_t0"); @55
// &Force("nonport","close_sum_m1_t0"); @56
// &Force("nonport","close_m1_oper2"); @57

//csky vperl_off
//close_sum0 for F0-F1
assign close_sum_t0[11:0] = $unsigned($signed(close_adder0_t0[11:0]) - $signed(close_adder1_t0[11:0]));
//close_sum0 for F1-F0
//close_sum select, keep sum not negative
//close_sum0_m1
assign close_sum_m1_t0[11:0] = $unsigned($signed(close_adder0_t0[11:0]) 
                                          - $signed(close_adder1_t0[11:0])
                                          + $signed(close_m1_oper2[11:0]));

//csky vperl_on

//FF1 Logic of Close Path S0
//If predict first 1 set at r[n]
//Actual first 1 may set at r[n+1] or r[n]
//A and B are to oprand
assign close_ff1_a_t0[11:0] = close_adder0_t0[11:0];
assign close_ff1_b_t0[11:0] = close_adder1_t0[11:0];

//C = B && act_add || ~B && act_sub
assign close_ff1_c_t0[11:0] = ~close_ff1_b_t0[11:0];
//T = A^C  G=A&C  Z=(~A)&(~C)
assign close_ff1_t_t0[11:0] = close_ff1_a_t0[11:0] ^ close_ff1_c_t0[11:0];
assign close_ff1_g_t0[11:0] = close_ff1_a_t0[11:0] & close_ff1_c_t0[11:0];
assign close_ff1_z_t0[11:0] = (~close_ff1_a_t0[11:0]) & (~close_ff1_c_t0[11:0]);
//F :
//fn-1 = En[gi(~zi-1) + zi(~gi-1)] + (~En)[gi(~gi-1) + zi(~zi-1)], En=act_sub
//f0   = t1(g0En+z0) + (~t1)(z0En+g0)
//fi   = ti+1[gi(~zi-1) + zi(~gi-1)] + (~ti+1)[gi(~gi-1) + zi(~zi-1)]
assign close_ff1_f_t0[11]   =  ( close_ff1_g_t0[11] & (~close_ff1_z_t0[10])) | 
                               ( close_ff1_z_t0[11] & (~close_ff1_g_t0[10]));
assign close_ff1_f_t0[0]    = (( close_ff1_t_t0[1]) & (close_ff1_g_t0[0] | close_ff1_z_t0[0])) | 
                              ((~close_ff1_t_t0[1]) & (close_ff1_z_t0[0] | close_ff1_g_t0[0]));
assign close_ff1_f_t0[10:1] = (( close_ff1_t_t0[11:2]) & ((close_ff1_g_t0[10:1] & (~close_ff1_z_t0[9:0])) | 
                               ( close_ff1_z_t0[10:1]  & (~close_ff1_g_t0[9:0]))))                     | 
                              ((~close_ff1_t_t0[11:2]) & ((close_ff1_g_t0[10:1] & (~close_ff1_g_t0[9:0])) | 
                               ( close_ff1_z_t0[10:1]  & (~close_ff1_z_t0[9:0]))));                            

// &CombBeg; @97
always @( close_ff1_f_t0[11:0])
begin
casez(close_ff1_f_t0[11:0])
  12'b1?????_?????? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b100000_000000;
    ff1_pred_t0[5:0]         = 6'd0;
  end
  12'b01????_?????? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b010000_000000;
    ff1_pred_t0[5:0]         = 6'd1;
  end
  12'b001???_?????? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b001000_000000;
    ff1_pred_t0[5:0]         = 6'd2;
  end
  12'b0001??_?????? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000100_000000;
    ff1_pred_t0[5:0]         = 6'd3;
  end
  12'b00001?_?????? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000010_000000;
    ff1_pred_t0[5:0]         = 6'd4;
  end
  12'b000001_?????? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000001_000000;
    ff1_pred_t0[5:0]         = 6'd5;
  end
  12'b000000_1????? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000000_100000;
    ff1_pred_t0[5:0]         = 6'd6;
  end
  12'b000000_01???? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000000_010000;
    ff1_pred_t0[5:0]         = 6'd7;
  end
  12'b000000_001??? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000000_001000;
    ff1_pred_t0[5:0]         = 6'd8;
  end
  12'b000000_0001?? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000000_000100;
    ff1_pred_t0[5:0]         = 6'd9;
  end
  12'b000000_00001? : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000000_000010;
    ff1_pred_t0[5:0]         = 6'd10;
  end
  12'b000000_000001 : begin 
    ff1_pred_t0_onehot[11:0] = 12'b000000_000001;
    ff1_pred_t0[5:0]         = 6'd11;
  end
  default : begin 
  ff1_pred_t0_onehot[11:0] = {12{1'bx}};
  ff1_pred_t0[5:0]         = {6{1'bx}};
  end
endcase
// &CombEnd; @152
end


// &ModuleEnd; @155
endmodule


