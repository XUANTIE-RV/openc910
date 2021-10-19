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

module sync_level2pulse(
  clk,
  rst_b,
  sync_in,
  sync_out,
  sync_ack
);


input          clk;
input          rst_b;
input          sync_in;
output         sync_out;
output         sync_ack;

reg            sync_ff;

wire           clk;
wire           rst_b;
wire           sync_in;
wire           sync_out;
wire           sync_ack;

wire           sync_out_level;

sync_level2level x_sync_level2level (
  .clk      (clk),
  .rst_b    (rst_b),
  .sync_in  (sync_in),
  .sync_out (sync_out_level)
);

always @ (posedge clk or negedge rst_b)
begin
  if (!rst_b)
    sync_ff <= 1'b0;
  else
    sync_ff <= sync_out_level;
end

assign sync_out = sync_out_level & ~sync_ff;
assign sync_ack = sync_out_level;

endmodule


