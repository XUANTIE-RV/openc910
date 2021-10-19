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
module clk_gen(
  clkrst_b,
  i_pad_clk,
  clk_en,
  psel,
  penable,
  prdata,
  pwdata,
  pwrite,

  gate_en0,
  gate_en1,

  pad_biu_clkratio,
  per_clk,
  cpu_clk
);


input           clkrst_b;        
input           i_pad_clk;       
input           penable;         
input           psel;            
input   [2 :0]  pwdata;          
input           pwrite;         
input           gate_en0;      
input           gate_en1;      
output          clk_en;          
output  [2 :0]  pad_biu_clkratio; 
output          per_clk;         
output          cpu_clk;         
output  [31:0]  prdata;          


wire    [31:0]  prdata;          


wire            clk_en;          
wire            clkrst_b;        
wire            i_pad_clk;       
wire    [2 :0]  pad_biu_clkratio; 
wire            penable;         
wire            per_clk;         
wire            cpu_clk;         
wire            psel;            
wire    [2 :0]  pwdata;          
wire            pwrite;          

// configure parameter for system clock dividor
// 0 not support
//
// default 1:1. all case can run in this configuration
// 1 = 1:1
//
// some case may run fail
// 2 = 2:1
// 3 = 3:1
// 4 = 4:1
// 5 = 5:1
//........
// 7 = 7:1
parameter  CLK_RATIO = 3'd1;


reg [2:0]  cnt; 
reg        cnt_zero; 
wire       sys_clk;
always @(posedge i_pad_clk or negedge clkrst_b)
begin
  if(!clkrst_b)
    cnt[2:0] <= 3'b0;
  else if(cnt == (CLK_RATIO - 1))
    cnt[2:0] <= 3'b0;
  else
    cnt[2:0] <= cnt[2:0] + 3'd1;
end

always @(posedge i_pad_clk or negedge clkrst_b)
begin
  if(!clkrst_b)
    cnt_zero <=  1'b1;
  else if(cnt == (CLK_RATIO - 1))
    cnt_zero <=  1'b1;
  else
    cnt_zero <=  1'b0;
end


assign sys_clk = (CLK_RATIO == 1) ?  i_pad_clk
                                 :  cnt_zero;

assign clk_en  = (CLK_RATIO == 1) ? 1'b1
               : (CLK_RATIO == 2) ? cnt_zero
                                  : (cnt == CLK_RATIO - 2);

assign  prdata[31:0]          = {29'b0,CLK_RATIO};
assign  pad_biu_clkratio[2:0] = CLK_RATIO;

reg [3:0] div_cnt;
reg       slow_clk; 
always @(posedge i_pad_clk or negedge clkrst_b) begin
  if (!clkrst_b) begin
    div_cnt     <= 4'hf;
    slow_clk    <= 1'b0;
  end
  else begin
    if(div_cnt != 4'h0) begin
      div_cnt   <= div_cnt - 1;
      slow_clk  <= slow_clk;
    end
    else begin
      div_cnt   <= 4'hf;
      slow_clk  <= ~slow_clk;
    end
  end
end

assign per_clk = sys_clk;
assign cpu_clk = gate_en0 ? slow_clk : (gate_en1 ? 1'b0 : i_pad_clk);
// assign cpu_clk = i_pad_clk;

endmodule


