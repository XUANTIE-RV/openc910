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
module ct_spsram_2048x32(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @23
input   [10:0]  A;   
input           CEN; 
input           CLK; 
input   [31:0]  D;   
input           GWEN; 
input   [31:0]  WEN; 
output  [31:0]  Q;   

// &Regs; @24

// &Wires; @25
wire    [10:0]  A;   
wire            CEN; 
wire            CLK; 
wire    [31:0]  D;   
wire            GWEN; 
wire    [31:0]  Q;   
wire    [31:0]  WEN; 


//**********************************************************
//                  Parameter Definition
//**********************************************************
parameter ADDR_WIDTH = 11;
parameter DATA_WIDTH = 32;
parameter WE_WIDTH   = 32;

// &Force("bus","Q",DATA_WIDTH-1,0); @34
// &Force("bus","WEN",WE_WIDTH-1,0); @35
// &Force("bus","A",ADDR_WIDTH-1,0); @36
// &Force("bus","D",DATA_WIDTH-1,0); @37

  //********************************************************
  //*                        FPGA memory                   *
  //********************************************************
  //{WEN[31:24],WEN[23:16],WEN[15:8],WEN[7:0]}
//   &Instance("ct_f_spsram_2048x32"); @44
ct_f_spsram_2048x32  x_ct_f_spsram_2048x32 (
  .A    (A   ),
  .CEN  (CEN ),
  .CLK  (CLK ),
  .D    (D   ),
  .GWEN (GWEN),
  .Q    (Q   ),
  .WEN  (WEN )
);

//   &Instance("ct_tsmc_spsram_2048x32"); @50

// &ModuleEnd; @66
endmodule


