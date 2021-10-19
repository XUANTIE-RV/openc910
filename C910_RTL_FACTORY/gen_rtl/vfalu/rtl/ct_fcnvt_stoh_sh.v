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
module ct_fcnvt_stoh_sh(
  stoh_sh_cnt,
  stoh_sh_f_v,
  stoh_sh_f_x,
  stoh_sh_src
);

// &Ports; @17
input   [7 :0]  stoh_sh_cnt; 
input   [22:0]  stoh_sh_src; 
output  [10:0]  stoh_sh_f_v; 
output  [24:0]  stoh_sh_f_x; 

// &Regs; @18
reg     [10:0]  stoh_sh_f_v; 
reg     [24:0]  stoh_sh_f_x; 

// &Wires; @19
wire    [7 :0]  stoh_sh_cnt; 
wire    [22:0]  stoh_sh_src; 



// &CombBeg; @22
always @( stoh_sh_src[22:0]
       or stoh_sh_cnt[7:0])
begin
case(stoh_sh_cnt[7:0])
  8'h70: begin //-15
  stoh_sh_f_v[10:0] = {2'b1,stoh_sh_src[22:14]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[13:0],11'b0};
  end
  8'h6f: begin //-16
  stoh_sh_f_v[10:0] = {3'b1,stoh_sh_src[22:15]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[14:0],10'b0};
  end
  8'h6e: begin //-17
  stoh_sh_f_v[10:0] = {4'b1,stoh_sh_src[22:16]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[15:0],9'b0};
  end
  8'h6d: begin //-18
  stoh_sh_f_v[10:0] = {5'b1,stoh_sh_src[22:17]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[16:0],8'b0};
  end
  8'h6c: begin //-19
  stoh_sh_f_v[10:0] = {6'b1,stoh_sh_src[22:18]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[17:0],7'b0};
  end
  8'h6b: begin //-20
  stoh_sh_f_v[10:0] = {7'b1,stoh_sh_src[22:19]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[18:0],6'b0};
  end
  8'h6a: begin //-21
  stoh_sh_f_v[10:0] = {8'b1,stoh_sh_src[22:20]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[19:0],5'b0};
  end
  8'h69: begin //-22
  stoh_sh_f_v[10:0] = {9'b1,stoh_sh_src[22:21]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[20:0],4'b0};
  end
  8'h68: begin //-23
  stoh_sh_f_v[10:0] = {10'b1,stoh_sh_src[22]};
  stoh_sh_f_x[24:0] = {stoh_sh_src[21:0],3'b0};
  end
  8'h67: begin //-24
  stoh_sh_f_v[10:0] = {11'b1};
  stoh_sh_f_x[24:0] = {stoh_sh_src[22:0],2'b0};
  end
  8'h66: begin //-25
  stoh_sh_f_v[10:0] = 11'b0;
  stoh_sh_f_x[24:0] = {1'b1,stoh_sh_src[22:0],1'b0};
  end
  8'h65: begin //-26
  stoh_sh_f_v[10:0] = 11'b0;
  stoh_sh_f_x[24:0] = {2'b1,stoh_sh_src[22:0]};
  end
  default: begin
  stoh_sh_f_v[10:0] = 11'b0;
  stoh_sh_f_x[24:0] = {3'b1,22'b0};
  end
endcase
// &CombEnd; @77
end


// &ModuleEnd; @80
endmodule


