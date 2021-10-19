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
module ct_fcnvt_dtos_sh(
  dtos_sh_cnt,
  dtos_sh_f_v,
  dtos_sh_f_x,
  dtos_sh_src
);

// &Ports; @17
input   [10:0]  dtos_sh_cnt; 
input   [51:0]  dtos_sh_src; 
output  [23:0]  dtos_sh_f_v; 
output  [53:0]  dtos_sh_f_x; 

// &Regs; @18
reg     [23:0]  dtos_sh_f_v; 
reg     [53:0]  dtos_sh_f_x; 

// &Wires; @19
wire    [10:0]  dtos_sh_cnt; 
wire    [51:0]  dtos_sh_src; 



// &CombBeg; @22
always @( dtos_sh_cnt[10:0]
       or dtos_sh_src[51:0])
begin
case(dtos_sh_cnt[10:0])
  11'd896: begin //-127
  dtos_sh_f_v[23:0] = {2'b1,dtos_sh_src[51:30]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[29:0],24'b0};
  end
  11'd895: begin //-128
  dtos_sh_f_v[23:0] = {3'b1,dtos_sh_src[51:31]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[30:0],23'b0};
  end
  11'd894: begin //-129
  dtos_sh_f_v[23:0] = {4'b1,dtos_sh_src[51:32]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[31:0],22'b0};
  end
  11'd893: begin //-130
  dtos_sh_f_v[23:0] = {5'b1,dtos_sh_src[51:33]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[32:0],21'b0};
  end
  11'd892: begin //-131
  dtos_sh_f_v[23:0] = {6'b1,dtos_sh_src[51:34]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[33:0],20'b0};
  end
  11'd891: begin //-132
  dtos_sh_f_v[23:0] = {7'b1,dtos_sh_src[51:35]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[34:0],19'b0};
  end
  11'd890: begin //-133
  dtos_sh_f_v[23:0] = {8'b1,dtos_sh_src[51:36]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[35:0],18'b0};
  end
  11'd889: begin //-134
  dtos_sh_f_v[23:0] = {9'b1,dtos_sh_src[51:37]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[36:0],17'b0};
  end
  11'd888: begin //-135
  dtos_sh_f_v[23:0] = {10'b1,dtos_sh_src[51:38]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[37:0],16'b0};
  end
  11'd887: begin //-136
  dtos_sh_f_v[23:0] = {11'b1,dtos_sh_src[51:39]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[38:0],15'b0};
  end
  11'd886: begin //-137
  dtos_sh_f_v[23:0] = {12'b1,dtos_sh_src[51:40]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[39:0],14'b0};
  end
  11'd885: begin //-138
  dtos_sh_f_v[23:0] = {13'b1,dtos_sh_src[51:41]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[40:0],13'b0};
  end
  11'd884: begin //-139
  dtos_sh_f_v[23:0] = {14'b1,dtos_sh_src[51:42]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[41:0],12'b0};
  end
  11'd883: begin //-140
  dtos_sh_f_v[23:0] = {15'b1,dtos_sh_src[51:43]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[42:0],11'b0};
  end
  11'd882: begin //-141
  dtos_sh_f_v[23:0] = {16'b1,dtos_sh_src[51:44]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[43:0],10'b0};
  end
  11'd881: begin //-142
  dtos_sh_f_v[23:0] = {17'b1,dtos_sh_src[51:45]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[44:0],9'b0};
  end
  11'd880: begin //-143
  dtos_sh_f_v[23:0] = {18'b1,dtos_sh_src[51:46]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[45:0],8'b0};
  end
  11'd879: begin //-144
  dtos_sh_f_v[23:0] = {19'b1,dtos_sh_src[51:47]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[46:0],7'b0};
  end
  11'd878: begin //-145
  dtos_sh_f_v[23:0] = {20'b1,dtos_sh_src[51:48]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[47:0],6'b0};
  end
  11'd877: begin //-146
  dtos_sh_f_v[23:0] = {21'b1,dtos_sh_src[51:49]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[48:0],5'b0};
  end
  11'd876: begin //-147
  dtos_sh_f_v[23:0] = {22'b1,dtos_sh_src[51:50]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[49:0],4'b0};
  end
  11'd875: begin //-148
  dtos_sh_f_v[23:0] = {23'b1,dtos_sh_src[51]};
  dtos_sh_f_x[53:0] = {dtos_sh_src[50:0],3'b0};
  end
  11'd874: begin //-149
  dtos_sh_f_v[23:0] = 24'b1;
  dtos_sh_f_x[53:0] = {dtos_sh_src[51:0],2'b0};
  end
  11'd873: begin //-150
  dtos_sh_f_v[23:0] = 24'b0;
  dtos_sh_f_x[53:0] = {1'b1,dtos_sh_src[51:0],1'b0};
  end
  11'd872: begin //-151
  dtos_sh_f_v[23:0] = 24'b0;
  dtos_sh_f_x[53:0] = {2'b1,dtos_sh_src[51:0]};
  end
  default: begin
  dtos_sh_f_v[23:0] = 24'b0;
  dtos_sh_f_x[53:0] = {3'b1,51'b0};
  end
endcase
// &CombEnd; @129
end


// &ModuleEnd; @132
endmodule


