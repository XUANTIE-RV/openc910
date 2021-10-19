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

// &ModuleBeg; @22
module ct_fcnvt_stod_sh(
  stod_sh_cnt,
  stod_sh_f_v,
  stod_sh_src
);

// &Ports; @23
input   [22:0]  stod_sh_src; 
output  [11:0]  stod_sh_cnt; 
output  [23:0]  stod_sh_f_v; 

// &Regs; @24
reg     [11:0]  stod_sh_cnt; 
reg     [23:0]  stod_sh_f_v; 

// &Wires; @25
wire    [22:0]  stod_sh_src; 


// &CombBeg; @27
always @( stod_sh_src[22:0])
begin
casez(stod_sh_src[22:0])
  23'b1??????????????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[22:0],1'b0};
    stod_sh_cnt[11:0]  = 12'hf81; //-127
  end
  23'b01?????????????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[21:0],2'b0};
    stod_sh_cnt[11:0]  = 12'hf80; //-128
  end
  23'b001????????????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[20:0],3'b0};
    stod_sh_cnt[11:0]  = 12'hf7f; //-129
  end
  23'b0001???????????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[19:0],4'b0};
    stod_sh_cnt[11:0]  = 12'hf7e; //-130
  end
  23'b00001??????????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[18:0],5'b0};
    stod_sh_cnt[11:0]  = 12'hf7d; //-131
  end
  23'b000001?????????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[17:0],6'b0};
    stod_sh_cnt[11:0]  = 12'hf7c; //-132
  end
  23'b0000001????????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[16:0],7'b0};
    stod_sh_cnt[11:0]  = 12'hf7b; //-133
  end
  23'b00000001???????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[15:0],8'b0};
    stod_sh_cnt[11:0]  = 12'hf7a; //-134
  end
  23'b000000001??????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[14:0],9'b0};
    stod_sh_cnt[11:0]  = 12'hf79; //-135
  end
  23'b0000000001?????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[13:0],10'b0};
    stod_sh_cnt[11:0]  = 12'hf78; //-136
  end
  23'b00000000001????????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[12:0],11'b0};
    stod_sh_cnt[11:0]  = 12'hf77; //-137
  end
  23'b000000000001???????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[11:0],12'b0};
    stod_sh_cnt[11:0]  = 12'hf76; //-138
  end
  23'b0000000000001??????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[10:0],13'b0};
    stod_sh_cnt[11:0]  = 12'hf75; //-139
  end
  23'b00000000000001?????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[9:0],14'b0};
    stod_sh_cnt[11:0]  = 12'hf74; //-140
  end
  23'b000000000000001????????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[8:0],15'b0};
    stod_sh_cnt[11:0]  = 12'hf73; //-141
  end
  23'b0000000000000001???????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[7:0],16'b0};
    stod_sh_cnt[11:0]  = 12'hf72; //-142
  end
  23'b00000000000000001??????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[6:0],17'b0};
    stod_sh_cnt[11:0]  = 12'hf71; //-143
  end
  23'b000000000000000001?????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[5:0],18'b0};
    stod_sh_cnt[11:0]  = 12'hf70; //-144
  end
  23'b0000000000000000001????: begin
    stod_sh_f_v[23:0] = {stod_sh_src[4:0],19'b0};
    stod_sh_cnt[11:0]  = 12'hf6f; //-145
  end
  23'b00000000000000000001???: begin
    stod_sh_f_v[23:0] = {stod_sh_src[3:0],20'b0};
    stod_sh_cnt[11:0]  = 12'hf6e; //-146
  end
  23'b000000000000000000001??: begin
    stod_sh_f_v[23:0] = {stod_sh_src[2:0],21'b0};
    stod_sh_cnt[11:0]  = 12'hf6d; //-137
  end
  23'b0000000000000000000001?: begin
    stod_sh_f_v[23:0] = {stod_sh_src[1:0],22'b0};
    stod_sh_cnt[11:0]  = 12'hf6c; //-138
  end
  23'b00000000000000000000001: begin
    stod_sh_f_v[23:0] = {1'b1,23'b0};
    stod_sh_cnt[11:0]  = 12'hf6b; //-149
  end
  default: begin
    stod_sh_f_v[23:0] = 24'b0;
    stod_sh_cnt[11:0]  = 12'h0;
  end
endcase
// &CombEnd; @126
end


// &ModuleEnd; @129
endmodule


