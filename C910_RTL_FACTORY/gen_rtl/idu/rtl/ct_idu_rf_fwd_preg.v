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
module ct_idu_rf_fwd_preg(
  iu_idu_ex1_pipe0_fwd_preg,
  iu_idu_ex1_pipe0_fwd_preg_data,
  iu_idu_ex1_pipe0_fwd_preg_vld,
  iu_idu_ex1_pipe1_fwd_preg,
  iu_idu_ex1_pipe1_fwd_preg_data,
  iu_idu_ex1_pipe1_fwd_preg_vld,
  iu_idu_ex2_pipe0_wb_preg,
  iu_idu_ex2_pipe0_wb_preg_data,
  iu_idu_ex2_pipe0_wb_preg_vld,
  iu_idu_ex2_pipe1_wb_preg,
  iu_idu_ex2_pipe1_wb_preg_data,
  iu_idu_ex2_pipe1_wb_preg_vld,
  lsu_idu_da_pipe3_fwd_preg,
  lsu_idu_da_pipe3_fwd_preg_data,
  lsu_idu_da_pipe3_fwd_preg_vld,
  lsu_idu_wb_pipe3_wb_preg,
  lsu_idu_wb_pipe3_wb_preg_data,
  lsu_idu_wb_pipe3_wb_preg_vld,
  x_src_data,
  x_src_no_fwd,
  x_src_reg
);

// &Ports; @27
input   [6 :0]  iu_idu_ex1_pipe0_fwd_preg;     
input   [63:0]  iu_idu_ex1_pipe0_fwd_preg_data; 
input           iu_idu_ex1_pipe0_fwd_preg_vld; 
input   [6 :0]  iu_idu_ex1_pipe1_fwd_preg;     
input   [63:0]  iu_idu_ex1_pipe1_fwd_preg_data; 
input           iu_idu_ex1_pipe1_fwd_preg_vld; 
input   [6 :0]  iu_idu_ex2_pipe0_wb_preg;      
input   [63:0]  iu_idu_ex2_pipe0_wb_preg_data; 
input           iu_idu_ex2_pipe0_wb_preg_vld;  
input   [6 :0]  iu_idu_ex2_pipe1_wb_preg;      
input   [63:0]  iu_idu_ex2_pipe1_wb_preg_data; 
input           iu_idu_ex2_pipe1_wb_preg_vld;  
input   [6 :0]  lsu_idu_da_pipe3_fwd_preg;     
input   [63:0]  lsu_idu_da_pipe3_fwd_preg_data; 
input           lsu_idu_da_pipe3_fwd_preg_vld; 
input   [6 :0]  lsu_idu_wb_pipe3_wb_preg;      
input   [63:0]  lsu_idu_wb_pipe3_wb_preg_data; 
input           lsu_idu_wb_pipe3_wb_preg_vld;  
input   [6 :0]  x_src_reg;                     
output  [63:0]  x_src_data;                    
output          x_src_no_fwd;                  

// &Regs; @28
reg     [63:0]  x_src_data;                    

// &Wires; @29
wire    [5 :0]  fwd_src_sel;                   
wire    [6 :0]  iu_idu_ex1_pipe0_fwd_preg;     
wire    [63:0]  iu_idu_ex1_pipe0_fwd_preg_data; 
wire            iu_idu_ex1_pipe0_fwd_preg_vld; 
wire    [6 :0]  iu_idu_ex1_pipe1_fwd_preg;     
wire    [63:0]  iu_idu_ex1_pipe1_fwd_preg_data; 
wire            iu_idu_ex1_pipe1_fwd_preg_vld; 
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg;      
wire    [63:0]  iu_idu_ex2_pipe0_wb_preg_data; 
wire            iu_idu_ex2_pipe0_wb_preg_vld;  
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg;      
wire    [63:0]  iu_idu_ex2_pipe1_wb_preg_data; 
wire            iu_idu_ex2_pipe1_wb_preg_vld;  
wire    [6 :0]  lsu_idu_da_pipe3_fwd_preg;     
wire    [63:0]  lsu_idu_da_pipe3_fwd_preg_data; 
wire            lsu_idu_da_pipe3_fwd_preg_vld; 
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg;      
wire    [63:0]  lsu_idu_wb_pipe3_wb_preg_data; 
wire            lsu_idu_wb_pipe3_wb_preg_vld;  
wire            x_src_no_fwd;                  
wire    [6 :0]  x_src_reg;                     



//==========================================================
//                      Preg Forward
//==========================================================
//0: pipe0 ex1, 1: pipe0 ex2, 2: pipe1 ex1, 3: pipe1 ex2, 4: pipe3 da, 5: pipe3 wb
assign fwd_src_sel[0] = iu_idu_ex1_pipe0_fwd_preg_vld
                        && (x_src_reg[6:0] == iu_idu_ex1_pipe0_fwd_preg[6:0]);
assign fwd_src_sel[1] = iu_idu_ex2_pipe0_wb_preg_vld
                        && (x_src_reg[6:0] == iu_idu_ex2_pipe0_wb_preg[6:0]);
assign fwd_src_sel[2] = iu_idu_ex1_pipe1_fwd_preg_vld
                        && (x_src_reg[6:0] == iu_idu_ex1_pipe1_fwd_preg[6:0]);
assign fwd_src_sel[3] = iu_idu_ex2_pipe1_wb_preg_vld
                        && (x_src_reg[6:0] == iu_idu_ex2_pipe1_wb_preg[6:0]);
assign fwd_src_sel[4] = lsu_idu_da_pipe3_fwd_preg_vld 
                        && (x_src_reg[6:0] == lsu_idu_da_pipe3_fwd_preg[6:0]);
assign fwd_src_sel[5] = lsu_idu_wb_pipe3_wb_preg_vld 
                        && (x_src_reg[6:0] == lsu_idu_wb_pipe3_wb_preg[6:0]);

assign x_src_no_fwd = !(|fwd_src_sel[5:0]);

// &CombBeg; @51
always @( iu_idu_ex1_pipe1_fwd_preg_data[63:0]
       or lsu_idu_da_pipe3_fwd_preg_data[63:0]
       or iu_idu_ex2_pipe0_wb_preg_data[63:0]
       or iu_idu_ex1_pipe0_fwd_preg_data[63:0]
       or lsu_idu_wb_pipe3_wb_preg_data[63:0]
       or iu_idu_ex2_pipe1_wb_preg_data[63:0]
       or fwd_src_sel[5:0])
begin
  case (fwd_src_sel[5:0])
    6'b000001: x_src_data[63:0] = iu_idu_ex1_pipe0_fwd_preg_data[63:0];
    6'b000010: x_src_data[63:0] = iu_idu_ex2_pipe0_wb_preg_data[63:0];
    6'b000100: x_src_data[63:0] = iu_idu_ex1_pipe1_fwd_preg_data[63:0];
    6'b001000: x_src_data[63:0] = iu_idu_ex2_pipe1_wb_preg_data[63:0];
    6'b010000: x_src_data[63:0] = lsu_idu_da_pipe3_fwd_preg_data[63:0];
    6'b100000: x_src_data[63:0] = lsu_idu_wb_pipe3_wb_preg_data[63:0];
    default  : x_src_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @61
end


// &ModuleEnd; @64
endmodule


