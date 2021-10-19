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

module ct_fifo(
  clk,
  rst_b,
  fifo_create_en,
  fifo_create_en_dp,
  fifo_pop_en,
  fifo_create_data,
  fifo_pop_data,
  fifo_pop_data_vld,
  fifo_full,
  fifo_empty,
  pad_yy_icg_scan_en,
  fifo_icg_en
);
parameter DEPTH = 2;
parameter WIDTH = 6;
parameter PTR_W = 1;

input              clk;
input              rst_b;
input              fifo_create_en;
input              fifo_create_en_dp;
input              fifo_pop_en;
input  [WIDTH-1:0] fifo_create_data;
input              pad_yy_icg_scan_en;
input              fifo_icg_en;

output [WIDTH-1:0] fifo_pop_data;         
output             fifo_pop_data_vld;
output             fifo_full;
output             fifo_empty;

wire               ctrl_clk;
wire               ctrl_clk_en;
wire               pad_yy_icg_scan_en;
wire               fifo_icg_en;
wire   [DEPTH-1:0] fifo_entry_create;
wire   [DEPTH-1:0] fifo_entry_create_dp;
wire   [DEPTH-1:0] fifo_entry_pop;
wire               fifo_empty;
wire               fifo_full;
wire   [DEPTH-1:0] entry_clk;
wire   [DEPTH-1:0] fifo_pop_sel;
wire               fifo_not_empty;
wire               fifo_pop_data_vld;
wire   [WIDTH-1:0] fifo_pop_data;

reg    [DEPTH-1:0] fifo_entry_vld;
reg    [WIDTH-1:0] fifo_entry_cont [DEPTH-1:0];
reg    [DEPTH-1:0] fifo_create_ptr;
reg    [PTR_W  :0] fifo_pop_ptr;

assign ctrl_clk_en = fifo_create_en_dp | fifo_not_empty;
gated_clk_cell x_fifo_ctrl_gated_clk(
  .clk_in               (clk                 ),
  .clk_out              (ctrl_clk            ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (ctrl_clk_en         ),
  .module_en (fifo_icg_en       ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

always@(posedge ctrl_clk or negedge rst_b)
begin
  if (!rst_b)
    fifo_create_ptr[DEPTH-1:0] <= {{(DEPTH-1){1'b0}},1'b1};
  else if (fifo_create_en)
    fifo_create_ptr[DEPTH-1:0] <= {fifo_create_ptr[DEPTH-2:0],fifo_create_ptr[DEPTH-1]};
end

always@(posedge ctrl_clk or negedge rst_b)
begin
  if (!rst_b)
    fifo_pop_ptr[PTR_W:0] <= {(PTR_W+1){1'b0}};
  else if (fifo_pop_en & (fifo_pop_ptr[PTR_W-1:0] == (DEPTH-1)))
    fifo_pop_ptr[PTR_W:0] <= {(PTR_W+1){1'b0}};
  else if (fifo_pop_en)
    fifo_pop_ptr[PTR_W:0] <= fifo_pop_ptr[PTR_W:0] + {{PTR_W{1'b0}},1'b1};
end

assign fifo_pop_sel[DEPTH-1:0] = {{(DEPTH-1){1'b0}},1'b1} << fifo_pop_ptr[PTR_W-1:0];

assign fifo_entry_create[DEPTH-1:0] = 
                  {DEPTH{fifo_create_en}} & fifo_create_ptr[DEPTH-1:0];
assign fifo_entry_create_dp[DEPTH-1:0] = 
                  {DEPTH{fifo_create_en_dp}} & fifo_create_ptr[DEPTH-1:0];
assign fifo_entry_pop[DEPTH-1:0]   = 
                  {DEPTH{fifo_pop_en}} & fifo_pop_sel[DEPTH-1:0];

genvar i;
generate 
for(i=0; i<DEPTH; i=i+1) begin: DFIFO_VLD_GEN
always@(posedge ctrl_clk or negedge rst_b)
begin
  if (!rst_b)
    fifo_entry_vld[i] <= 1'b0;
  else if (fifo_entry_create[i])
    fifo_entry_vld[i] <= 1'b1;
  else if (fifo_entry_pop[i])
    fifo_entry_vld[i] <= 1'b0;
end
end
endgenerate 

generate
for(i=0; i<DEPTH; i=i+1) begin: DFIFO_GATED_CLK_GEN
gated_clk_cell x_entry_gated_clk(
  .clk_in               (clk                 ),
  .clk_out              (entry_clk[i]        ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (fifo_entry_create_dp[i]),
  .module_en (fifo_icg_en       ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
end
endgenerate

generate 
for(i=0; i<DEPTH; i=i+1) begin: DFIFO_CONT_GEN
always@(posedge entry_clk[i] or negedge rst_b)
begin
  if (!rst_b)
    fifo_entry_cont[i][WIDTH-1:0] <= {WIDTH{1'b0}};
  else if (fifo_entry_create_dp[i])
    fifo_entry_cont[i][WIDTH-1:0] <= fifo_create_data[WIDTH-1:0];
  else  
    fifo_entry_cont[i][WIDTH-1:0] <= fifo_entry_cont[i][WIDTH-1:0];
end
end
endgenerate

assign fifo_full      = &fifo_entry_vld[DEPTH-1:0];
assign fifo_not_empty = |fifo_entry_vld[DEPTH-1:0];
assign fifo_empty     = ~fifo_not_empty;

assign fifo_pop_data_vld        = |fifo_entry_vld[DEPTH-1:0];
assign fifo_pop_data[WIDTH-1:0] = fifo_entry_cont[fifo_pop_ptr[PTR_W-1:0]][WIDTH-1:0];

endmodule
