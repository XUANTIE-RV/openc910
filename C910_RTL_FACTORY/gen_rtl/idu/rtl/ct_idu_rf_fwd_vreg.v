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

// &ModuleBeg; @26
module ct_idu_rf_fwd_vreg(
  lsu_idu_da_pipe3_fwd_vreg,
  lsu_idu_da_pipe3_fwd_vreg_data,
  lsu_idu_da_pipe3_fwd_vreg_vld,
  lsu_idu_wb_pipe3_fwd_vreg,
  lsu_idu_wb_pipe3_fwd_vreg_vld,
  lsu_idu_wb_pipe3_wb_vreg_data,
  vfpu_idu_ex3_pipe6_fwd_vreg,
  vfpu_idu_ex3_pipe6_fwd_vreg_data,
  vfpu_idu_ex3_pipe6_fwd_vreg_vld,
  vfpu_idu_ex3_pipe7_fwd_vreg,
  vfpu_idu_ex3_pipe7_fwd_vreg_data,
  vfpu_idu_ex3_pipe7_fwd_vreg_vld,
  vfpu_idu_ex4_pipe6_fwd_vreg,
  vfpu_idu_ex4_pipe6_fwd_vreg_data,
  vfpu_idu_ex4_pipe6_fwd_vreg_vld,
  vfpu_idu_ex4_pipe7_fwd_vreg,
  vfpu_idu_ex4_pipe7_fwd_vreg_data,
  vfpu_idu_ex4_pipe7_fwd_vreg_vld,
  vfpu_idu_ex5_pipe6_fwd_vreg,
  vfpu_idu_ex5_pipe6_fwd_vreg_vld,
  vfpu_idu_ex5_pipe6_wb_vreg_data,
  vfpu_idu_ex5_pipe7_fwd_vreg,
  vfpu_idu_ex5_pipe7_fwd_vreg_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_data,
  x_srcv_data,
  x_srcv_no_fwd,
  x_srcv_reg
);

// &Ports; @27
input   [6 :0]  lsu_idu_da_pipe3_fwd_vreg;       
input   [63:0]  lsu_idu_da_pipe3_fwd_vreg_data;  
input           lsu_idu_da_pipe3_fwd_vreg_vld;   
input   [6 :0]  lsu_idu_wb_pipe3_fwd_vreg;       
input           lsu_idu_wb_pipe3_fwd_vreg_vld;   
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_data;   
input   [6 :0]  vfpu_idu_ex3_pipe6_fwd_vreg;     
input   [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_data; 
input           vfpu_idu_ex3_pipe6_fwd_vreg_vld; 
input   [6 :0]  vfpu_idu_ex3_pipe7_fwd_vreg;     
input   [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_data; 
input           vfpu_idu_ex3_pipe7_fwd_vreg_vld; 
input   [6 :0]  vfpu_idu_ex4_pipe6_fwd_vreg;     
input   [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_data; 
input           vfpu_idu_ex4_pipe6_fwd_vreg_vld; 
input   [6 :0]  vfpu_idu_ex4_pipe7_fwd_vreg;     
input   [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_data; 
input           vfpu_idu_ex4_pipe7_fwd_vreg_vld; 
input   [6 :0]  vfpu_idu_ex5_pipe6_fwd_vreg;     
input           vfpu_idu_ex5_pipe6_fwd_vreg_vld; 
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_data; 
input   [6 :0]  vfpu_idu_ex5_pipe7_fwd_vreg;     
input           vfpu_idu_ex5_pipe7_fwd_vreg_vld; 
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_data; 
input   [6 :0]  x_srcv_reg;                      
output  [63:0]  x_srcv_data;                     
output          x_srcv_no_fwd;                   

// &Regs; @28
reg     [63:0]  x_srcv_data;                     

// &Wires; @29
wire    [7 :0]  fwd_srcv_sel;                    
wire    [6 :0]  lsu_idu_da_pipe3_fwd_vreg;       
wire    [63:0]  lsu_idu_da_pipe3_fwd_vreg_data;  
wire            lsu_idu_da_pipe3_fwd_vreg_vld;   
wire    [6 :0]  lsu_idu_wb_pipe3_fwd_vreg;       
wire            lsu_idu_wb_pipe3_fwd_vreg_vld;   
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_data;   
wire    [6 :0]  vfpu_idu_ex3_pipe6_fwd_vreg;     
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_data; 
wire            vfpu_idu_ex3_pipe6_fwd_vreg_vld; 
wire    [6 :0]  vfpu_idu_ex3_pipe7_fwd_vreg;     
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_data; 
wire            vfpu_idu_ex3_pipe7_fwd_vreg_vld; 
wire    [6 :0]  vfpu_idu_ex4_pipe6_fwd_vreg;     
wire    [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_data; 
wire            vfpu_idu_ex4_pipe6_fwd_vreg_vld; 
wire    [6 :0]  vfpu_idu_ex4_pipe7_fwd_vreg;     
wire    [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_data; 
wire            vfpu_idu_ex4_pipe7_fwd_vreg_vld; 
wire    [6 :0]  vfpu_idu_ex5_pipe6_fwd_vreg;     
wire            vfpu_idu_ex5_pipe6_fwd_vreg_vld; 
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_data; 
wire    [6 :0]  vfpu_idu_ex5_pipe7_fwd_vreg;     
wire            vfpu_idu_ex5_pipe7_fwd_vreg_vld; 
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_data; 
wire            x_srcv_no_fwd;                   
wire    [6 :0]  x_srcv_reg;                      



//==========================================================
//                      Vreg Forward
//==========================================================
//0: pipe6 ex3, 1: pipe6 ex4, 2: pipe6 ex5, 3: pipe7 ex3,
//4: pipe7 ex4, 5: pipe7 ex5, 6: pipe3 da 7: pipe3 wb
assign fwd_srcv_sel[0] = vfpu_idu_ex3_pipe6_fwd_vreg_vld
                         && (x_srcv_reg[6:0] == vfpu_idu_ex3_pipe6_fwd_vreg[6:0]);
assign fwd_srcv_sel[1] = vfpu_idu_ex4_pipe6_fwd_vreg_vld
                         && (x_srcv_reg[6:0] == vfpu_idu_ex4_pipe6_fwd_vreg[6:0]);
assign fwd_srcv_sel[2] = vfpu_idu_ex5_pipe6_fwd_vreg_vld
                         && (x_srcv_reg[6:0] == vfpu_idu_ex5_pipe6_fwd_vreg[6:0]);
assign fwd_srcv_sel[3] = vfpu_idu_ex3_pipe7_fwd_vreg_vld
                         && (x_srcv_reg[6:0] == vfpu_idu_ex3_pipe7_fwd_vreg[6:0]);
assign fwd_srcv_sel[4] = vfpu_idu_ex4_pipe7_fwd_vreg_vld
                         && (x_srcv_reg[6:0] == vfpu_idu_ex4_pipe7_fwd_vreg[6:0]);
assign fwd_srcv_sel[5] = vfpu_idu_ex5_pipe7_fwd_vreg_vld
                         && (x_srcv_reg[6:0] == vfpu_idu_ex5_pipe7_fwd_vreg[6:0]);
assign fwd_srcv_sel[6] = lsu_idu_da_pipe3_fwd_vreg_vld 
                         && (x_srcv_reg[6:0] == lsu_idu_da_pipe3_fwd_vreg[6:0]);
assign fwd_srcv_sel[7] = lsu_idu_wb_pipe3_fwd_vreg_vld 
                         && (x_srcv_reg[6:0] == lsu_idu_wb_pipe3_fwd_vreg[6:0]);

assign x_srcv_no_fwd = !(|fwd_srcv_sel[7:0]);

// &CombBeg; @56
always @( vfpu_idu_ex4_pipe7_fwd_vreg_data[63:0]
       or vfpu_idu_ex5_pipe7_wb_vreg_data[63:0]
       or lsu_idu_da_pipe3_fwd_vreg_data[63:0]
       or vfpu_idu_ex5_pipe6_wb_vreg_data[63:0]
       or fwd_srcv_sel[7:0]
       or lsu_idu_wb_pipe3_wb_vreg_data[63:0]
       or vfpu_idu_ex3_pipe7_fwd_vreg_data[63:0]
       or vfpu_idu_ex4_pipe6_fwd_vreg_data[63:0]
       or vfpu_idu_ex3_pipe6_fwd_vreg_data[63:0])
begin
  case (fwd_srcv_sel[7:0])
    8'b00000001: x_srcv_data[63:0] = vfpu_idu_ex3_pipe6_fwd_vreg_data[63:0];
    8'b00000010: x_srcv_data[63:0] = vfpu_idu_ex4_pipe6_fwd_vreg_data[63:0];
    8'b00000100: x_srcv_data[63:0] = vfpu_idu_ex5_pipe6_wb_vreg_data[63:0];
    8'b00001000: x_srcv_data[63:0] = vfpu_idu_ex3_pipe7_fwd_vreg_data[63:0];
    8'b00010000: x_srcv_data[63:0] = vfpu_idu_ex4_pipe7_fwd_vreg_data[63:0];
    8'b00100000: x_srcv_data[63:0] = vfpu_idu_ex5_pipe7_wb_vreg_data[63:0];
    8'b01000000: x_srcv_data[63:0] = lsu_idu_da_pipe3_fwd_vreg_data[63:0];
    8'b10000000: x_srcv_data[63:0] = lsu_idu_wb_pipe3_wb_vreg_data[63:0];
    default    : x_srcv_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @68
end

// &ModuleEnd; @70
endmodule


