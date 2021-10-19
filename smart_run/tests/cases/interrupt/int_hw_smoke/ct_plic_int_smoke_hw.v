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

module int_mnt();
  `define CPU_TOP           tb.x_soc.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top
  `define INTINCFG          `CPU_TOP.pad_plic_int_cfg[63:0]
  `define INTINVLD          `CPU_TOP.pad_plic_int_vld[63:0]
  `define FLUSH             `CPU_TOP.core0_pad_flush
  `define core0_retire0_pc  `CPU_TOP.core0_pad_retire0_pc[39:0]

  initial
  begin
  //cfg 1 pulse cfg 0 level
  force `INTINCFG = 64'h0;
  //iid 16
  force `INTINVLD = 64'h1;
  
  wait (`core0_retire0_pc == 40'he0)
  release `INTINVLD;
  release `INTINCFG;
  end
endmodule

