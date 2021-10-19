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























module uart_baud_gen(
  ctrl_baud_gen_divisor,
  ctrl_baud_gen_set_dllh_vld,
  receive_clk_en,
  rst_b,
  sys_clk,
  trans_clk_en
);


input   [15:0]  ctrl_baud_gen_divisor;     
input           ctrl_baud_gen_set_dllh_vld; 
input           rst_b;                     
input           sys_clk;                   
output          receive_clk_en;            
output          trans_clk_en;              


reg     [15:0]  clk_counter;               
reg             receive_clk_en;            
reg     [3 :0]  trans_clk_counter;         


wire            clk_divisor_start_en;      
wire            clk_negedge_en;            
wire    [15:0]  ctrl_baud_gen_divisor;     
wire            ctrl_baud_gen_set_dllh_vld; 
wire            divisor_more_then_3;       
wire            rst_b;                     
wire            sys_clk;                   
wire            trans_clk_en;              
wire            trans_clk_posedge_en;      
























assign clk_divisor_start_en = |ctrl_baud_gen_divisor[15:0];

assign clk_negedge_en  = (clk_counter[15:0] == ctrl_baud_gen_divisor[15:0]) ? 1 : 0 ;
 
always@(posedge sys_clk or negedge rst_b) 
begin 
  if(!rst_b) 
    clk_counter[15:0] <= 16'b1;
  else if(ctrl_baud_gen_set_dllh_vld)
    clk_counter[15:0] <= 16'b1;
  else if(clk_negedge_en)
    clk_counter[15:0] <= 1'b1; 
  else if(clk_divisor_start_en)
    clk_counter[15:0] <= clk_counter[15:0]+1;
  else
    clk_counter[15:0] <= clk_counter[15:0];
end
















assign divisor_more_then_3 = |ctrl_baud_gen_divisor[15:2];


always @( ctrl_baud_gen_divisor[1:0]
       or clk_negedge_en
       or divisor_more_then_3)
begin
casez({divisor_more_then_3,ctrl_baud_gen_divisor[1:0]})
  3'b000: receive_clk_en = 1'b0;
  3'b001: receive_clk_en = 1'b1;
  3'b010: receive_clk_en = clk_negedge_en;
  3'b011,
  3'b1??: receive_clk_en = clk_negedge_en;
  default: receive_clk_en = 1'b0;
endcase

end






always@(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
   trans_clk_counter[3:0] <= 4'b0;
  else if(receive_clk_en) 
   trans_clk_counter[3:0] <= trans_clk_counter[3:0] + 1'b1;
  else 
   trans_clk_counter[3:0] <= trans_clk_counter[3:0];
end

assign trans_clk_posedge_en = (trans_clk_counter[3:0] == 4'b1111) ? 1 : 0;

assign trans_clk_en  = receive_clk_en && trans_clk_posedge_en;
















endmodule


