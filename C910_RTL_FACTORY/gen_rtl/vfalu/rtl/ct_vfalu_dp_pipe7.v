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
module ct_vfalu_dp_pipe7(
  dp_vfalu_ex1_pipex_sel,
  fadd_ereg_ex3_forward_r_vld,
  fadd_ereg_ex3_result,
  fadd_forward_r_vld,
  fadd_forward_result,
  fadd_mfvr_cmp_result,
  fcnvt_ereg_forward_r_vld,
  fcnvt_ereg_forward_result,
  fcnvt_forward_r_vld,
  fcnvt_forward_result,
  fspu_forward_r_vld,
  fspu_forward_result,
  fspu_mfvr_data,
  pipex_dp_ex1_vfalu_mfvr_data,
  pipex_dp_ex3_vfalu_ereg_data,
  pipex_dp_ex3_vfalu_freg_data
);

// &Ports; @23
input   [2 :0]  dp_vfalu_ex1_pipex_sel;      
input           fadd_ereg_ex3_forward_r_vld; 
input   [4 :0]  fadd_ereg_ex3_result;        
input           fadd_forward_r_vld;          
input   [63:0]  fadd_forward_result;         
input   [63:0]  fadd_mfvr_cmp_result;        
input           fcnvt_ereg_forward_r_vld;    
input   [4 :0]  fcnvt_ereg_forward_result;   
input           fcnvt_forward_r_vld;         
input   [63:0]  fcnvt_forward_result;        
input           fspu_forward_r_vld;          
input   [63:0]  fspu_forward_result;         
input   [63:0]  fspu_mfvr_data;              
output  [63:0]  pipex_dp_ex1_vfalu_mfvr_data; 
output  [4 :0]  pipex_dp_ex3_vfalu_ereg_data; 
output  [63:0]  pipex_dp_ex3_vfalu_freg_data; 

// &Regs; @24
reg     [63:0]  pipex_dp_ex3_vfalu_freg_data; 

// &Wires; @25
wire    [2 :0]  dp_vfalu_ex1_pipex_sel;      
wire            fadd_ereg_ex3_forward_r_vld; 
wire    [4 :0]  fadd_ereg_ex3_result;        
wire            fadd_forward_r_vld;          
wire    [63:0]  fadd_forward_result;         
wire    [63:0]  fadd_mfvr_cmp_result;        
wire            fcnvt_ereg_forward_r_vld;    
wire    [4 :0]  fcnvt_ereg_forward_result;   
wire            fcnvt_forward_r_vld;         
wire    [63:0]  fcnvt_forward_result;        
wire            fspu_forward_r_vld;          
wire    [63:0]  fspu_forward_result;         
wire    [63:0]  fspu_mfvr_data;              
wire    [63:0]  pipex_dp_ex1_vfalu_mfvr_data; 
wire    [4 :0]  pipex_dp_ex3_vfalu_ereg_data; 


//assign pipex_dp_ex3_vfalu_expt_vec[4:0]    = 5'd30;
// &Force("output","pipex_dp_ex3_vfalu_ereg_data"); @28
assign pipex_dp_ex3_vfalu_ereg_data[4:0]   = {5{fadd_ereg_ex3_forward_r_vld}}  & fadd_ereg_ex3_result[4:0] | 
                                             {5{fcnvt_ereg_forward_r_vld}} & fcnvt_ereg_forward_result[4:0];
assign pipex_dp_ex1_vfalu_mfvr_data[63:0]  = {64{dp_vfalu_ex1_pipex_sel[1]}} & fadd_mfvr_cmp_result[63:0] |
                                             {64{dp_vfalu_ex1_pipex_sel[0]}} & fspu_mfvr_data[63:0];
// &Force("bus","dp_vfalu_ex1_pipex_sel",2,0);                                              @33
// &CombBeg; @35
// &CombEnd; @42
// &CombBeg; @44
// &CombEnd; @51

// &CombBeg; @57
always @( fspu_forward_result[63:0]
       or fspu_forward_r_vld
       or fadd_forward_r_vld
       or fadd_forward_result[63:0]
       or fcnvt_forward_result[63:0]
       or fcnvt_forward_r_vld)
begin
case({fadd_forward_r_vld,fcnvt_forward_r_vld,fspu_forward_r_vld})
  3'b100  : pipex_dp_ex3_vfalu_freg_data[63:0] = fadd_forward_result[63:0];
  3'b010  : pipex_dp_ex3_vfalu_freg_data[63:0] = fcnvt_forward_result[63:0];
  3'b001  : pipex_dp_ex3_vfalu_freg_data[63:0] = fspu_forward_result[63:0];
  default : pipex_dp_ex3_vfalu_freg_data[63:0] = {64{1'bx}};
endcase
// &CombEnd;   @64
end


// &ModuleEnd; @68
endmodule


