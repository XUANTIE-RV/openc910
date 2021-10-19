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

// * Non-Disclosure Agreement (NDA).                                           *
// *                                                                           *
// *****************************************************************************
// FILE NAME       : sync.vp
// AUTHOR          : Tao Jiang
// ORIGINAL TIME   : 2017.06.02
// FUNCTION        : sync signal
//                 :
//                 :   
//                 :   
// RESET           : Async reset
// DFT             :
// DFP             :
// VERIFICATION    :
// RELEASE HISTORY :
// *****************************************************************************


// &ModuleBeg; @20
module sync(
  fast_clk,
  in,
  out,
  pad_cpu_rst_b,
  slow_clk
);

// &Ports; @21
input        fast_clk;     
input        in;           
input        pad_cpu_rst_b; 
input        slow_clk;     
output       out;          

// &Regs; @22
reg          input_lv;     
reg          reg_clr;      

// &Wires; @23
wire         fast_clk;     
wire         in;           
wire         input_vld;    
wire         out;          
wire         pad_cpu_rst_b; 
wire         slow_clk;     




assign input_vld = in ;


always@(posedge fast_clk or negedge pad_cpu_rst_b )
begin
  if (!pad_cpu_rst_b)
    input_lv <= 1'b0;
  else if (input_vld)
    input_lv <= 1'b1;
  else if (reg_clr)
    input_lv <= 1'b0;
end

always@(posedge slow_clk or negedge pad_cpu_rst_b )
begin
  if (!pad_cpu_rst_b)
    reg_clr <= 1'b0;
  else 
    reg_clr <= 1'b1;
end


assign out = input_lv;
// &ModuleEnd; @50
endmodule





