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

module wid_entry(
  biu_pad_awid,
  pad_cpu_rst_b,
  per_clk,
  wid,
  wid_entry_push
);


input   [7:0]  biu_pad_awid;  
input          pad_cpu_rst_b; 
input          per_clk;       
input          wid_entry_push; 
output  [7:0]  wid;           


reg     [7:0]  wid_f;         


wire    [7:0]  biu_pad_awid;  
wire           pad_cpu_rst_b; 
wire           per_clk;       
wire    [7:0]  wid;           
wire           wid_entry_push; 


always@(posedge per_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b)
    wid_f[7:0] <= 8'b0;
  else if (wid_entry_push)
    wid_f[7:0] <= biu_pad_awid[7:0];
end

assign wid[7:0] = wid_entry_push ? biu_pad_awid[7:0] : wid_f[7:0];


endmodule



