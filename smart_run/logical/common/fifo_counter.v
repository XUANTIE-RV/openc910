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



















module fifo_counter(
  counter_done,
  counter_en,
  counter_load,
  cpu_clk,
  cpu_rst_b
);


input           counter_en;   
input   [31:0]  counter_load; 
input           cpu_clk;      
input           cpu_rst_b;    
output          counter_done; 


reg     [31:0]  counter;      
reg             counter_en_ff; 


wire            counter_done; 
wire            counter_en;   
wire    [31:0]  counter_load; 
wire            cpu_clk;      
wire            cpu_rst_b;    
wire            load_cnt_en;  


always @(posedge cpu_clk or negedge cpu_rst_b)
begin
  if(!cpu_rst_b)
  begin
    counter_en_ff <= 1'b0;
  end
  else
  begin
    counter_en_ff <=counter_en ;
  end
end

assign load_cnt_en= (counter_en && !counter_en_ff);


always @(posedge cpu_clk or negedge cpu_rst_b)
begin
  if(!cpu_rst_b)
  begin
    counter[31:0] <= 32'h0;
  end
  else if (load_cnt_en)
  begin
    counter[31:0] <= counter_load[31:0];
  end
  else if (counter_done)
    counter[31:0] <= 32'b0;
  else 
    counter[31:0] <= counter[31:0] -1'b1;
 end

assign counter_done = (counter[31:0] == 32'b0) ;


endmodule


