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
module ct_ciu_snb_dp_sel_16(
  entry0_age_vect,
  entry10_age_vect,
  entry11_age_vect,
  entry12_age_vect,
  entry13_age_vect,
  entry14_age_vect,
  entry15_age_vect,
  entry1_age_vect,
  entry2_age_vect,
  entry3_age_vect,
  entry4_age_vect,
  entry5_age_vect,
  entry6_age_vect,
  entry7_age_vect,
  entry8_age_vect,
  entry9_age_vect,
  req_vld,
  sel
);

// &Ports; @19
input   [23:0]  entry0_age_vect; 
input   [23:0]  entry10_age_vect; 
input   [23:0]  entry11_age_vect; 
input   [23:0]  entry12_age_vect; 
input   [23:0]  entry13_age_vect; 
input   [23:0]  entry14_age_vect; 
input   [23:0]  entry15_age_vect; 
input   [23:0]  entry1_age_vect; 
input   [23:0]  entry2_age_vect; 
input   [23:0]  entry3_age_vect; 
input   [23:0]  entry4_age_vect; 
input   [23:0]  entry5_age_vect; 
input   [23:0]  entry6_age_vect; 
input   [23:0]  entry7_age_vect; 
input   [23:0]  entry8_age_vect; 
input   [23:0]  entry9_age_vect; 
input   [15:0]  req_vld;         
output  [15:0]  sel;             

// &Regs; @20

// &Wires; @21
wire    [23:0]  entry0_age_vect; 
wire    [23:0]  entry10_age_vect; 
wire    [23:0]  entry11_age_vect; 
wire    [23:0]  entry12_age_vect; 
wire    [23:0]  entry13_age_vect; 
wire    [23:0]  entry14_age_vect; 
wire    [23:0]  entry15_age_vect; 
wire    [23:0]  entry1_age_vect; 
wire    [23:0]  entry2_age_vect; 
wire    [23:0]  entry3_age_vect; 
wire    [23:0]  entry4_age_vect; 
wire    [23:0]  entry5_age_vect; 
wire    [23:0]  entry6_age_vect; 
wire    [23:0]  entry7_age_vect; 
wire    [23:0]  entry8_age_vect; 
wire    [23:0]  entry9_age_vect; 
wire    [15:0]  req_vld;         
wire    [15:0]  sel;             


// &Force("bus", "entry0_age_vect",23,0); @23
// &Force("bus", "entry1_age_vect",23,0); @24
// &Force("bus", "entry2_age_vect",23,0); @25
// &Force("bus", "entry3_age_vect",23,0); @26
// &Force("bus", "entry4_age_vect",23,0); @27
// &Force("bus", "entry5_age_vect",23,0); @28
// &Force("bus", "entry6_age_vect",23,0); @29
// &Force("bus", "entry7_age_vect",23,0); @30
// &Force("bus", "entry8_age_vect",23,0); @31
// &Force("bus", "entry9_age_vect",23,0); @32
// &Force("bus", "entry10_age_vect",23,0); @33
// &Force("bus", "entry11_age_vect",23,0); @34
// &Force("bus", "entry12_age_vect",23,0); @35
// &Force("bus", "entry13_age_vect",23,0); @36
// &Force("bus", "entry14_age_vect",23,0); @37
// &Force("bus", "entry15_age_vect",23,0); @38

parameter DEPTH = 16;

assign sel[0] = req_vld[0] && !(|(req_vld[DEPTH-1:0] & entry0_age_vect[DEPTH-1:0]));
assign sel[1] = req_vld[1] && !(|(req_vld[DEPTH-1:0] & entry1_age_vect[DEPTH-1:0]));
assign sel[2] = req_vld[2] && !(|(req_vld[DEPTH-1:0] & entry2_age_vect[DEPTH-1:0]));
assign sel[3] = req_vld[3] && !(|(req_vld[DEPTH-1:0] & entry3_age_vect[DEPTH-1:0]));
assign sel[4] = req_vld[4] && !(|(req_vld[DEPTH-1:0] & entry4_age_vect[DEPTH-1:0]));
assign sel[5] = req_vld[5] && !(|(req_vld[DEPTH-1:0] & entry5_age_vect[DEPTH-1:0]));
assign sel[6] = req_vld[6] && !(|(req_vld[DEPTH-1:0] & entry6_age_vect[DEPTH-1:0]));
assign sel[7] = req_vld[7] && !(|(req_vld[DEPTH-1:0] & entry7_age_vect[DEPTH-1:0]));
assign sel[8] = req_vld[8] && !(|(req_vld[DEPTH-1:0] & entry8_age_vect[DEPTH-1:0]));
assign sel[9] = req_vld[9] && !(|(req_vld[DEPTH-1:0] & entry9_age_vect[DEPTH-1:0]));
assign sel[10] = req_vld[10] && !(|(req_vld[DEPTH-1:0] & entry10_age_vect[DEPTH-1:0]));
assign sel[11] = req_vld[11] && !(|(req_vld[DEPTH-1:0] & entry11_age_vect[DEPTH-1:0]));
assign sel[12] = req_vld[12] && !(|(req_vld[DEPTH-1:0] & entry12_age_vect[DEPTH-1:0]));
assign sel[13] = req_vld[13] && !(|(req_vld[DEPTH-1:0] & entry13_age_vect[DEPTH-1:0]));
assign sel[14] = req_vld[14] && !(|(req_vld[DEPTH-1:0] & entry14_age_vect[DEPTH-1:0]));
assign sel[15] = req_vld[15] && !(|(req_vld[DEPTH-1:0] & entry15_age_vect[DEPTH-1:0]));

// &ModuleEnd; @59
endmodule



