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
module ct_mmu_sysmap_hit(
  addr_ge_bottom_x,
  addr_ge_upaddr_x,
  sysmap_comp_hit_x,
  sysmap_mmu_hit_x
);

// &Ports; @27
input        addr_ge_bottom_x; 
input        sysmap_comp_hit_x; 
output       addr_ge_upaddr_x; 
output       sysmap_mmu_hit_x; 

// &Regs; @28

// &Wires; @29
wire         addr_ge_bottom_x; 
wire         addr_ge_upaddr_x; 
wire         addr_ls_top;      
wire         sysmap_comp_hit_x; 
wire         sysmap_mmu_hit_x; 



assign addr_ls_top      = sysmap_comp_hit_x;

assign addr_ge_upaddr_x = !addr_ls_top;
assign sysmap_mmu_hit_x = addr_ge_bottom_x && addr_ls_top;

// &ModuleEnd; @37
endmodule


