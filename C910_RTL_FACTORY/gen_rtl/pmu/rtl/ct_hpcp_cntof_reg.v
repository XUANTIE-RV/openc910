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
module ct_hpcp_cntof_reg(
  cntof_wen_x,
  cntof_x,
  counter_overflow_x,
  cpurst_b,
  hpcp_clk,
  hpcp_wdata_x,
  l2cnt_cmplt_ff
);

// &Ports; @23
input        cntof_wen_x;       
input        counter_overflow_x; 
input        cpurst_b;          
input        hpcp_clk;          
input        hpcp_wdata_x;      
input        l2cnt_cmplt_ff;    
output       cntof_x;           

// &Regs; @24
reg          cntof_x;           

// &Wires @25
wire         cntof_wen_x;       
wire         counter_overflow_x; 
wire         cpurst_b;          
wire         hpcp_clk;          
wire         hpcp_wdata_x;      
wire         l2cnt_cmplt_ff;    


always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
      cntof_x <= 1'b0;
  else if(cntof_wen_x && l2cnt_cmplt_ff) 
      cntof_x <= hpcp_wdata_x;
  else
      cntof_x <= cntof_x | counter_overflow_x;
end

// &Force("output","cntof_x"); @37
// &ModuleEnd; @38
endmodule


