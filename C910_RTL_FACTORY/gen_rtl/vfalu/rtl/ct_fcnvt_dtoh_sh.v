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

// &ModuleBeg; @16
module ct_fcnvt_dtoh_sh(
  dtos_sh_cnt,
  dtos_sh_f_v,
  dtos_sh_f_x,
  dtos_sh_src
);

// &Ports; @17
input   [10:0]  dtos_sh_cnt; 
input   [51:0]  dtos_sh_src; 
output  [10:0]  dtos_sh_f_v; 
output  [53:0]  dtos_sh_f_x; 

// &Regs; @18
reg     [10:0]  dtos_sh_f_v; 
reg     [53:0]  dtos_sh_f_x; 

// &Wires; @19
wire    [10:0]  dtos_sh_cnt; 
wire    [51:0]  dtos_sh_src; 



// &CombBeg; @22
always @( dtos_sh_cnt[10:0]
       or dtos_sh_src[51:0])
begin
case(dtos_sh_cnt[10:0])
  11'h3f0: begin //-15
  dtos_sh_f_v[10:0] = {2'b1,dtos_sh_src[51:43]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[42:0],11'b0};
  end
  11'h3ef: begin //-16
  dtos_sh_f_v[10:0] = {3'b1,dtos_sh_src[51:44]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[43:0],10'b0};
  end
  11'h3ee: begin //-17
  dtos_sh_f_v[10:0] = {4'b1,dtos_sh_src[51:45]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[44:0],9'b0};
  end
  11'h3ed: begin //-18
  dtos_sh_f_v[10:0] = {5'b1,dtos_sh_src[51:46]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[45:0],8'b0};
  end
  11'h3ec: begin //-19
  dtos_sh_f_v[10:0] = {6'b1,dtos_sh_src[51:47]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[46:0],7'b0};
  end
  11'h3eb: begin //-20
  dtos_sh_f_v[10:0] = {7'b1,dtos_sh_src[51:48]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[47:0],6'b0};
  end
  11'h3ea: begin //-21
  dtos_sh_f_v[10:0] = {8'b1,dtos_sh_src[51:49]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[48:0],5'b0};
  end
  11'h3e9: begin //-22
  dtos_sh_f_v[10:0] = {9'b1,dtos_sh_src[51:50]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[49:0],4'b0};
  end
  11'h3e8: begin //-135
  dtos_sh_f_v[10:0] = {10'b1,dtos_sh_src[51]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[50:0],3'b0};
  end
  11'h3e7: begin //-136
  dtos_sh_f_v[10:0] = {11'b1};
  dtos_sh_f_x[53:0] = {dtos_sh_src[51:0],2'b0};
  end
  11'h3e6: begin //-137
  dtos_sh_f_v[10:0] = 11'b0;
  dtos_sh_f_x[53:0] = {1'b1,dtos_sh_src[51:0],1'b0};
  end
  11'h3e5: begin //-138
  dtos_sh_f_v[10:0] = 11'b0;
  dtos_sh_f_x[53:0] = {2'b1,dtos_sh_src[51:0]};
  end
  default: begin
  dtos_sh_f_v[10:0] = 11'b0;
  dtos_sh_f_x[53:0] = {3'b1,51'b0};
  end
endcase
// &CombEnd; @77
end


// &ModuleEnd; @80
endmodule


