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
module ct_fadd_close_s0_h(
  close_adder0,
  close_adder1,
  close_eq,
  close_op_chg,
  close_sum,
  ff1_pred,
  ff1_pred_onehot
);

// &Ports; @23
input   [10:0]  close_adder0;        
input   [10:0]  close_adder1;        
output          close_eq;            
output          close_op_chg;        
output  [10:0]  close_sum;           
output  [3 :0]  ff1_pred;            
output  [10:0]  ff1_pred_onehot;     

// &Regs; @24
reg     [3 :0]  ff1_pred_8_0;        
reg     [10:0]  ff1_pred_onehot_8_0; 

// &Wires; @25
wire    [10:0]  close_adder0;        
wire    [10:0]  close_adder1;        
wire            close_eq;            
wire    [10:0]  close_ff1_a;         
wire    [10:0]  close_ff1_b;         
wire    [10:0]  close_ff1_c;         
wire    [10:0]  close_ff1_f;         
wire    [10:0]  close_ff1_g;         
wire    [10:0]  close_ff1_t;         
wire    [10:0]  close_ff1_z;         
wire            close_op_chg;        
wire    [10:0]  close_sum;           
wire    [11:0]  close_sum0;          
wire    [11:0]  close_sum1;          
wire    [3 :0]  ff1_pred;            
wire    [3 :0]  ff1_pred_10_9;       
wire    [3 :0]  ff1_pred_nz;         
wire    [10:0]  ff1_pred_nz_onehot;  
wire    [10:0]  ff1_pred_onehot;     
wire    [10:0]  ff1_pred_onehot_10_9; 

//close_sum0 for F0-F1
assign close_sum0[11:0]    = {1'b0,close_adder0[10:0]} - {1'b0,close_adder1[10:0]};
//close_sum0 for F1-F0
assign close_sum1[11:0]    = {1'b0,close_adder1[10:0]} - {1'b0,close_adder0[10:0]};
//close_sum select, keep sum not negative
assign close_sum[10:0]     = (close_sum0[11])
                           ? close_sum1[10:0]
                           : close_sum0[10:0];
assign close_op_chg        = close_sum0[11];
assign close_eq            = !close_sum0[11] && !close_sum1[11];
//FF1 Logic of Close Path S0
//If predict first 1 set at r[n]
//Actual first 1 may set at r[n+1] or r[n]
//A and B are to oprand
assign close_ff1_a[10:0] = close_adder0[10:0];
assign close_ff1_b[10:0] = close_adder1[10:0];

//C = B && act_add || ~B && act_sub
assign close_ff1_c[10:0] = ~close_ff1_b[10:0];
//T = A^C  G=A&C  Z=(~A)&(~C)
assign close_ff1_t[10:0] = close_ff1_a[10:0] ^ close_ff1_c[10:0];
assign close_ff1_g[10:0] = close_ff1_a[10:0] & close_ff1_c[10:0];
assign close_ff1_z[10:0] = (~close_ff1_a[10:0]) & (~close_ff1_c[10:0]);
//F :
//fn-1 = En[gi(~zi-1) + zi(~gi-1)] + (~En)[gi(~gi-1) + zi(~zi-1)], En=act_sub
//f0   = t1(g0En+z0) + (~t1)(z0En+g0)
//fi   = ti+1[gi(~zi-1) + zi(~gi-1)] + (~ti+1)[gi(~gi-1) + zi(~zi-1)]
assign close_ff1_f[10]   =  ( close_ff1_g[10] & (~close_ff1_z[9])) | 
                            ( close_ff1_z[10] & (~close_ff1_g[9]));                          
assign close_ff1_f[0]    = (( close_ff1_t[1]) & (close_ff1_g[0] | close_ff1_z[0])) | 
                           ((~close_ff1_t[1]) & (close_ff1_z[0] | close_ff1_g[0]));
assign close_ff1_f[9:1] = (( close_ff1_t[10:2]) & ((close_ff1_g[9:1] & (~close_ff1_z[8:0])) | 
                            ( close_ff1_z[9:1]  & (~close_ff1_g[8:0]))))                     | 
                           ((~close_ff1_t[10:2]) & ((close_ff1_g[9:1] & (~close_ff1_g[8:0])) | 
                            ( close_ff1_z[9:1]  & (~close_ff1_z[8:0]))));                            

// &CombBeg; @62
always @( close_ff1_f[8:0])
begin
casez(close_ff1_f[8:0])
  9'b1???????? : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00100_000000;
    ff1_pred_8_0[3:0]         = 4'd2;
  end
  9'b01??????? : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00010_000000;
    ff1_pred_8_0[3:0]         = 4'd3;
  end
  9'b001?????? : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00001_000000;
    ff1_pred_8_0[3:0]         = 4'd4;
  end
  9'b0001????? : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00000_100000;
    ff1_pred_8_0[3:0]         = 4'd5;
  end
  9'b00001???? : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00000_010000;
    ff1_pred_8_0[3:0]         = 4'd6;
  end
  9'b000001??? : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00000_001000;
    ff1_pred_8_0[3:0]         = 4'd7;
  end
  9'b0000001?? : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00000_000100;
    ff1_pred_8_0[3:0]         = 4'd8;
  end
  9'b00000001? : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00000_000010;
    ff1_pred_8_0[3:0]         = 4'd9;
  end
  9'b000000001 : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00000_000001;
    ff1_pred_8_0[3:0]         = 4'd10;
  end
  default : begin 
    ff1_pred_onehot_8_0[10:0] = 11'b00000_000000;
    ff1_pred_8_0[3:0]         = 4'd0;
  end
endcase
// &CombEnd; @105
end

assign ff1_pred_onehot_10_9[10:0] = (close_ff1_f[10])
                                   ? 11'b10000_000000
                                   : 11'b01000_000000;
assign ff1_pred_10_9[3:0]         = (close_ff1_f[10])
                                   ? 4'b0
                                   : 4'b1;

assign ff1_pred_nz_onehot[10:0] = (|close_ff1_f[10:9])
                                ? ff1_pred_onehot_10_9[10:0]
                                : ff1_pred_onehot_8_0[10:0];
assign ff1_pred_nz[3:0]         = (|close_ff1_f[10:9])
                                ? ff1_pred_10_9[3:0]
                                : ff1_pred_8_0[3:0];


assign ff1_pred_onehot[10:0] = ff1_pred_nz_onehot[10:0];
assign ff1_pred[3:0]         = ff1_pred_nz[3:0];
// &ModuleEnd; @124
endmodule


