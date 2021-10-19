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
module ct_spsram_1024x64(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @23
input   [9 :0]  A;   
input           CEN; 
input           CLK; 
input   [63:0]  D;   
input           GWEN; 
input   [63:0]  WEN; 
output  [63:0]  Q;   

// &Regs; @24

// &Wires; @25
wire    [9 :0]  A;   
wire            CEN; 
wire            CLK; 
wire    [63:0]  D;   
wire            GWEN; 
wire    [63:0]  Q;   
wire    [63:0]  WEN; 

// &Depend("cpu_cfig.h"); @26
//**********************************************************
//                  Parameter Definition
//**********************************************************
parameter ADDR_WIDTH = 10;
parameter DATA_WIDTH = 64;
parameter WE_WIDTH   = 64;

// &Force("bus","Q",DATA_WIDTH-1,0); @34
// &Force("bus","WEN",WE_WIDTH-1,0); @35
// &Force("bus","A",ADDR_WIDTH-1,0); @36
// &Force("bus","D",DATA_WIDTH-1,0); @37

  //********************************************************
  //*                        FPGA memory                   *
  //********************************************************
  //{WEN[63:62],WEN[61:60],WEN[59:58],WEN[57:56],WEN[55:54],WEN[53:52],WEN[51:50],WEN[49:48],
  // WEN[47:46],WEN[45:44],WEN[43:42],WEN[41:40],WEN[39:38],WEN[37:36],WEN[35:34],WEN[33:32],
  // WEN[31:30],WEN[29:28],WEN[27:26],WEN[25:24],WEN[23:22],WEN[21:20],WEN[19:18],WEN[17:16],
  // WEN[15:14],WEN[13:12],WEN[11:10],WEN[ 9: 8],WEN[ 7: 6],WEN[ 5: 4],WEN[ 3: 2],WEN[ 1: 0]}
//   &Instance("ct_f_spsram_1024x64"); @47
ct_f_spsram_1024x64  x_ct_f_spsram_1024x64 (
  .A    (A   ),
  .CEN  (CEN ),
  .CLK  (CLK ),
  .D    (D   ),
  .GWEN (GWEN),
  .Q    (Q   ),
  .WEN  (WEN )
);

//   &Instance("ct_tsmc_spsram_1024x64"); @53

// &ModuleEnd; @69
endmodule


