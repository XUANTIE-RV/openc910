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
module ct_vfmau_lza_42(
  lza_p0,
  lza_p1,
  lza_precod,
  lza_vld
);

// &Ports; @24
input   [3:0]  lza_precod; 
output         lza_p0;    
output         lza_p1;    
output         lza_vld;   

// &Regs; @25

// &Wires; @26
wire           lza_p0;    
wire           lza_p1;    
wire    [3:0]  lza_precod; 
wire           lza_vld;   


assign lza_vld = |lza_precod[3:0];
assign lza_p0  = !lza_precod[3] && (lza_precod[2] || !lza_precod[1]);
assign lza_p1  = !(lza_precod[2] || lza_precod[3]);

// &ModuleEnd; @32
endmodule



