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

module sync_level2level(
  clk,
  rst_b,
  sync_in,
  sync_out
);

parameter SIGNAL_WIDTH = 1;
parameter FLOP_NUM     = 3;

input          clk;
input          rst_b;
input   [SIGNAL_WIDTH-1:0]   sync_in;
output  [SIGNAL_WIDTH-1:0]   sync_out;

reg     [SIGNAL_WIDTH-1:0]  sync_ff[FLOP_NUM-1:0];

wire           clk;
wire           rst_b;
wire    [SIGNAL_WIDTH-1:0]   sync_in;
wire    [SIGNAL_WIDTH-1:0]   sync_out;


genvar i;

always @ (posedge clk or negedge rst_b)
begin
  if (!rst_b)
    sync_ff[0][SIGNAL_WIDTH-1:0] <= {SIGNAL_WIDTH{1'b0}};
  else
    sync_ff[0][SIGNAL_WIDTH-1:0] <= sync_in[SIGNAL_WIDTH-1:0];
end


generate
for (i = 1; i < FLOP_NUM; i = i+1)
begin: FLOP_GEN
  always @ (posedge clk or negedge rst_b)
  begin
    if (!rst_b)
      sync_ff[i][SIGNAL_WIDTH-1:0] <= {SIGNAL_WIDTH{1'b0}};
    else
      sync_ff[i][SIGNAL_WIDTH-1:0] <= sync_ff[i-1][SIGNAL_WIDTH-1:0];
  end
end
endgenerate

assign sync_out[SIGNAL_WIDTH-1:0] = sync_ff[FLOP_NUM-1][SIGNAL_WIDTH-1:0];


endmodule


