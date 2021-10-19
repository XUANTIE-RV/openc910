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

// &ModuleBeg; @18
module ct_ciu_snb_dp_sel_8(
  entry16_age_vect,
  entry17_age_vect,
  entry18_age_vect,
  entry19_age_vect,
  entry20_age_vect,
  entry21_age_vect,
  entry22_age_vect,
  entry23_age_vect,
  req_vld,
  sel
);

// &Ports; @19
input   [23:0]  entry16_age_vect; 
input   [23:0]  entry17_age_vect; 
input   [23:0]  entry18_age_vect; 
input   [23:0]  entry19_age_vect; 
input   [23:0]  entry20_age_vect; 
input   [23:0]  entry21_age_vect; 
input   [23:0]  entry22_age_vect; 
input   [23:0]  entry23_age_vect; 
input   [7 :0]  req_vld;         
output  [7 :0]  sel;             

// &Regs; @20

// &Wires; @21
wire    [23:0]  entry16_age_vect; 
wire    [23:0]  entry17_age_vect; 
wire    [23:0]  entry18_age_vect; 
wire    [23:0]  entry19_age_vect; 
wire    [23:0]  entry20_age_vect; 
wire    [23:0]  entry21_age_vect; 
wire    [23:0]  entry22_age_vect; 
wire    [23:0]  entry23_age_vect; 
wire    [7 :0]  req_vld;         
wire    [7 :0]  sel;             


// &Force("bus", "entry16_age_vect", 23,0); @23
// &Force("bus", "entry17_age_vect", 23,0); @24
// &Force("bus", "entry18_age_vect", 23,0); @25
// &Force("bus", "entry19_age_vect", 23,0); @26
// &Force("bus", "entry20_age_vect", 23,0); @27
// &Force("bus", "entry21_age_vect", 23,0); @28
// &Force("bus", "entry22_age_vect", 23,0); @29
// &Force("bus", "entry23_age_vect", 23,0); @30

parameter DEPTH = 8;

assign sel[0] = req_vld[0] && !(|(req_vld[DEPTH-1:0] & entry16_age_vect[23:16]));
assign sel[1] = req_vld[1] && !(|(req_vld[DEPTH-1:0] & entry17_age_vect[23:16]));
assign sel[2] = req_vld[2] && !(|(req_vld[DEPTH-1:0] & entry18_age_vect[23:16]));
assign sel[3] = req_vld[3] && !(|(req_vld[DEPTH-1:0] & entry19_age_vect[23:16]));
assign sel[4] = req_vld[4] && !(|(req_vld[DEPTH-1:0] & entry20_age_vect[23:16]));
assign sel[5] = req_vld[5] && !(|(req_vld[DEPTH-1:0] & entry21_age_vect[23:16]));
assign sel[6] = req_vld[6] && !(|(req_vld[DEPTH-1:0] & entry22_age_vect[23:16]));
assign sel[7] = req_vld[7] && !(|(req_vld[DEPTH-1:0] & entry23_age_vect[23:16]));

// &ModuleEnd; @43
endmodule



