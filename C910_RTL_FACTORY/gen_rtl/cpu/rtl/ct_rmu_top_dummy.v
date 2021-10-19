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
module ct_rmu_top_dummy(
  apb_clk,
  apbrst_b,
  penable,
  perr_rmr,
  prdata_rmr,
  pready_rmr,
  psel_rmr
);

// &Ports; @3
input           apb_clk;   
input           apbrst_b;  
input           penable;   
input           psel_rmr;  
output          perr_rmr;  
output  [31:0]  prdata_rmr; 
output          pready_rmr; 

// &Regs; @4
reg             perr_rmr;  
reg             pready_rmr; 

// &Wires; @5
wire            acc_err;   
wire            apb_clk;   
wire            apbrst_b;  
wire    [31:0]  data_out;  
wire            penable;   
wire    [31:0]  prdata_rmr; 
wire            priv_err;  
wire            psel_rmr;  


always @(posedge apb_clk or negedge apbrst_b)
begin
  if(~apbrst_b)
    pready_rmr <= 1'b0;
  else if (psel_rmr & !penable)
    pready_rmr <= 1'b1;
  else 
    pready_rmr <= 1'b0;
end

always @(posedge apb_clk or negedge apbrst_b)
begin
  if(~apbrst_b)
    perr_rmr <= 1'b0;
  else if (psel_rmr & !penable & (acc_err | priv_err))
    perr_rmr <= 1'b1;
  else
    perr_rmr <= 1'b0;
end

assign prdata_rmr[31:0] = data_out[31:0];

assign acc_err  = 1'b1;
assign priv_err = 1'b1;

assign data_out[31:0] = 32'b0;

// &ModuleEnd; @34
endmodule


