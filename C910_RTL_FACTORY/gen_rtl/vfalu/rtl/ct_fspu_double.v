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

// &ModuleBeg; @19
module ct_fspu_double(
  ex1_op_fmvvf,
  ex1_op_fsgnj,
  ex1_op_fsgnjn,
  ex1_op_fsgnjx,
  ex1_oper0,
  ex1_oper1,
  ex1_result,
  mtvr_src0,
  result_fclass,
  result_fmfvr
);

// &Ports; @20
input           ex1_op_fmvvf;        
input           ex1_op_fsgnj;        
input           ex1_op_fsgnjn;       
input           ex1_op_fsgnjx;       
input   [63:0]  ex1_oper0;           
input   [63:0]  ex1_oper1;           
input   [63:0]  mtvr_src0;           
output  [63:0]  ex1_result;          
output  [63:0]  result_fclass;       
output  [63:0]  result_fmfvr;        

// &Regs; @21

// &Wires; @22
wire            ex1_doub_expnt0_max; 
wire            ex1_doub_expnt0_zero; 
wire            ex1_doub_frac0_all0; 
wire            ex1_doub_frac0_msb;  
wire            ex1_doub_neg_dn;     
wire            ex1_doub_neg_inf;    
wire            ex1_doub_neg_nm;     
wire            ex1_doub_neg_zero;   
wire            ex1_doub_op0_sign;   
wire            ex1_doub_pos_dn;     
wire            ex1_doub_pos_inf;    
wire            ex1_doub_pos_nm;     
wire            ex1_doub_pos_zero;   
wire            ex1_doub_qnan;       
wire            ex1_doub_snan;       
wire            ex1_op_fmvvf;        
wire            ex1_op_fsgnj;        
wire            ex1_op_fsgnjn;       
wire            ex1_op_fsgnjx;       
wire    [63:0]  ex1_oper0;           
wire    [63:0]  ex1_oper1;           
wire    [63:0]  ex1_result;          
wire    [63:0]  mtvr_src0;           
wire    [63:0]  result_fclass;       
wire    [63:0]  result_fclassd;      
wire    [63:0]  result_fmfvr;        
wire    [63:0]  result_fmfvrd;       
wire    [63:0]  result_fmtvrd;       
wire    [63:0]  result_fsgnjd;       
wire    [63:0]  result_fsgnjnd;      
wire    [63:0]  result_fsgnjxd;      

// &Force("bus","ex1_oper1",63,0); @23
//Sign bit prepare
assign ex1_doub_op0_sign      = ex1_oper0[63];

//exponent max
assign ex1_doub_expnt0_max    = &ex1_oper0[62:52];

//exponent zero
assign ex1_doub_expnt0_zero   = ~|ex1_oper0[62:52];

//fraction zero
assign ex1_doub_frac0_all0    = ~|ex1_oper0[51:0];

//freaction msb
assign ex1_doub_frac0_msb     = ex1_oper0[51];


//FCLASS.D 
assign ex1_doub_neg_inf  = ex1_doub_op0_sign   && ex1_doub_expnt0_max  && ex1_doub_frac0_all0;
assign ex1_doub_neg_nm   = ex1_doub_op0_sign   && !ex1_doub_expnt0_max && !ex1_doub_expnt0_zero;
assign ex1_doub_neg_dn   = ex1_doub_op0_sign   && ex1_doub_expnt0_zero && !ex1_doub_frac0_all0;
assign ex1_doub_neg_zero = ex1_doub_op0_sign   && ex1_doub_expnt0_zero && ex1_doub_frac0_all0;
assign ex1_doub_pos_zero = !ex1_doub_op0_sign  && ex1_doub_expnt0_zero && ex1_doub_frac0_all0;
assign ex1_doub_pos_dn   = !ex1_doub_op0_sign  && ex1_doub_expnt0_zero && !ex1_doub_frac0_all0; 
assign ex1_doub_pos_nm   = !ex1_doub_op0_sign  && !ex1_doub_expnt0_max && !ex1_doub_expnt0_zero;
assign ex1_doub_pos_inf  = !ex1_doub_op0_sign  && ex1_doub_expnt0_max  && ex1_doub_frac0_all0;
assign ex1_doub_snan     = ex1_doub_expnt0_max && !ex1_doub_frac0_all0 && !ex1_doub_frac0_msb;
assign ex1_doub_qnan     = ex1_doub_expnt0_max && ex1_doub_frac0_msb;
assign result_fclassd[63:0] = {
                               54'b0,
                               ex1_doub_qnan,
                               ex1_doub_snan,
                               ex1_doub_pos_inf,
                               ex1_doub_pos_nm,
                               ex1_doub_pos_dn,
                               ex1_doub_pos_zero,
                               ex1_doub_neg_zero,
                               ex1_doub_neg_dn,
                               ex1_doub_neg_nm,
                               ex1_doub_neg_inf
                              };


//FSGNJX.D
assign result_fsgnjxd[63:0] = {ex1_oper0[63]^ex1_oper1[63],ex1_oper0[62:0]};


//FSGNJN.D:
assign result_fsgnjnd[63:0] = {~ex1_oper1[63],ex1_oper0[62:0]};


//FSGNJ.D
assign result_fsgnjd[63:0]  = {ex1_oper1[63],ex1_oper0[62:0]};

//FMV.D.X
assign result_fmtvrd[63:0]  = mtvr_src0[63:0];


//FMV.X.D
assign result_fmfvrd[63:0]  = ex1_oper0[63:0];


assign result_fmfvr[63:0]   = result_fmfvrd[63:0];

assign result_fclass[63:0]  = result_fclassd[63:0];

//Final Result
assign ex1_result[63:0] = {64{ex1_op_fmvvf}}        & result_fmtvrd[63:0]  | 
                          {64{ex1_op_fsgnj}}       & result_fsgnjd[63:0]  | 
                          {64{ex1_op_fsgnjn}}      & result_fsgnjnd[63:0] | 
                          {64{ex1_op_fsgnjx}}      & result_fsgnjxd[63:0]; 

// &ModuleEnd; @95
endmodule











