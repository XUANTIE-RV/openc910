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

// &ModuleBeg; @23
module ct_lsu_idfifo_entry(
  cpurst_b,
  idfifo_clk,
  idfifo_create_id,
  idfifo_entry_create_vld_x,
  idfifo_entry_id_v
);

// &Ports; @24
input          cpurst_b;                 
input          idfifo_clk;               
input   [2:0]  idfifo_create_id;         
input          idfifo_entry_create_vld_x; 
output  [2:0]  idfifo_entry_id_v;        

// &Regs; @25
reg     [2:0]  idfifo_entry_id;          

// &Wires; @26
wire           cpurst_b;                 
wire           idfifo_clk;               
wire    [2:0]  idfifo_create_id;         
wire           idfifo_entry_create_vld;  
wire           idfifo_entry_create_vld_x; 
wire    [2:0]  idfifo_entry_id_v;        


//==========================================================
//                 Register
//==========================================================
always @(posedge idfifo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    idfifo_entry_id[2:0]  <= 3'b0;
  else if(idfifo_entry_create_vld)
    idfifo_entry_id[2:0]  <= idfifo_create_id[2:0];
end

//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
assign idfifo_entry_create_vld  = idfifo_entry_create_vld_x;
//------------------output----------------------------------
assign idfifo_entry_id_v[2:0]   = idfifo_entry_id[2:0];

// &ModuleEnd; @47
endmodule


