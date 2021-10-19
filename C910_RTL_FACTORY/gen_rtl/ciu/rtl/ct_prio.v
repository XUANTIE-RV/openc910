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

module ct_prio(
  clk,
  rst_b,
  valid,
  clr,
  sel
);
parameter NUM =2;

input            clk;
input            rst_b;
input  [NUM-1:0] valid;
input            clr;
output [NUM-1:0] sel;

reg    [NUM-1:0] prio [NUM-1:0];
reg    [NUM-1:0] unused [NUM-1:0];
wire   [NUM-1:0] sel;
wire   [NUM-1:0] clr_bus;

assign clr_bus[NUM-1:0] = {NUM{clr}} & sel[NUM-1:0];

genvar i;
generate
for(i=0; i<NUM; i=i+1) begin:PRIO_MATRIX_GEN
always@(posedge clk or negedge rst_b)
begin
  if (!rst_b)
    {prio[i][NUM-1:0], unused[i][NUM-1:0]} <= {{NUM{1'b0}}, {NUM{1'b1}}} << i;
  else if(|clr_bus[NUM-1:0]) begin
    prio[i][NUM-1:0] <= (clr_bus[NUM-1:0] == ({{(NUM-1){1'b0}},1'b1}<<i)) 
                      ? ~clr_bus[NUM-1:0] 
                      : prio[i][NUM-1:0] &~clr_bus[NUM-1:0];
  end
end
end
endgenerate

generate
for(i=0; i<NUM; i=i+1) begin: SEL_GEN
assign sel[i] = valid[i] && !(|(valid[NUM-1:0] & prio[i][NUM-1:0]));
end
endgenerate

endmodule
