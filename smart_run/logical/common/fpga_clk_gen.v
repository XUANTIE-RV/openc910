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
module fpga_clk_gen(
  clk_en,
  clkrst_b,
  i_pad_clk,
  pad_biu_clkratio,
  penable,
  per_clk,
  prdata,
  psel,
  pwdata,
  pwrite
);


input           clkrst_b;        
input           i_pad_clk;       
input           penable;         
input           psel;            
input   [2 :0]  pwdata;          
input           pwrite;          
output          clk_en;          
output  [2 :0]  pad_biu_clkratio; 
output          per_clk;         
output  [31:0]  prdata;          


reg     [2 :0]  input_clkratio;  
reg     [31:0]  prdata;          


wire            clk_en;          
wire            clkrst_b;        
wire            i_pad_clk;       
wire    [2 :0]  pad_biu_clkratio; 
wire            penable;         
wire            per_clk;         
wire            psel;            
wire    [2 :0]  pwdata;          
wire            pwrite;          


always@(posedge per_clk or negedge clkrst_b)
begin
  if (!clkrst_b)
    input_clkratio[2:0] <= 3'b0;
  else if(psel && pwrite && penable)
    input_clkratio[2:0] <= pwdata[2:0]; 
end


always @( input_clkratio[2:0]
       or psel
       or pwrite)
begin
if(psel && !pwrite)
begin
  prdata[31:0] <= {29'b0,input_clkratio[2:0]};
end

end

assign per_clk = i_pad_clk;

assign clk_en = 1'b1;
assign pad_biu_clkratio[2:0] = input_clkratio[2:0];





endmodule


