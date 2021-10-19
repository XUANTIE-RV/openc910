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
module ct_fcnvt_htos_sh(
  htos_sh_cnt,
  htos_sh_f_v,
  htos_sh_src
);

// &Ports; @23
input   [9 :0]  htos_sh_src; 
output  [5 :0]  htos_sh_cnt; 
output  [10:0]  htos_sh_f_v; 

// &Regs; @24
reg     [5 :0]  htos_sh_cnt; 
reg     [10:0]  htos_sh_f_v; 

// &Wires; @25
wire    [9 :0]  htos_sh_src; 


// &CombBeg; @27
always @( htos_sh_src[9:0])
begin
casez(htos_sh_src[9:0])
  10'b1?????????: begin
    htos_sh_f_v[10:0] = {htos_sh_src[9:0],1'b0};
    htos_sh_cnt[5:0]  = 6'h31; //-15:
  end
  10'b01????????: begin
    htos_sh_f_v[10:0] = {htos_sh_src[8:0],2'b0};
    htos_sh_cnt[5:0]  = 6'h30; //-16
  end
  10'b001???????: begin
    htos_sh_f_v[10:0] = {htos_sh_src[7:0],3'b0};
    htos_sh_cnt[5:0]  = 6'h2f; //-17
  end
  10'b0001??????: begin
    htos_sh_f_v[10:0] = {htos_sh_src[6:0],4'b0};
    htos_sh_cnt[5:0]  = 6'h2e; //-18
  end
  10'b00001?????: begin
    htos_sh_f_v[10:0] = {htos_sh_src[5:0],5'b0};
    htos_sh_cnt[5:0]  = 6'h2d; //-19
  end
  10'b000001????: begin
    htos_sh_f_v[10:0] = {htos_sh_src[4:0],6'b0};
    htos_sh_cnt[5:0]  = 6'h2c; //-20
  end
  10'b0000001???: begin
    htos_sh_f_v[10:0] = {htos_sh_src[3:0],7'b0};
    htos_sh_cnt[5:0]  = 6'h2b; //-9
  end
  10'b00000001??: begin
    htos_sh_f_v[10:0] = {htos_sh_src[2:0],8'b0};
    htos_sh_cnt[5:0]  = 6'h2a; //-155
  end
  10'b000000001?: begin
    htos_sh_f_v[10:0] = {htos_sh_src[1:0],9'b0};
    htos_sh_cnt[5:0]  = 6'h29; //-155
  end
  10'b0000000001: begin
    htos_sh_f_v[10:0] = {htos_sh_src[0],10'b0};
    htos_sh_cnt[5:0]  = 6'h28; //-156
  end
  default: begin
    htos_sh_f_v[10:0] = 11'b0;
    htos_sh_cnt[5:0]  = 6'h0;
  end
endcase
// &CombEnd; @74
end


// &ModuleEnd; @77
endmodule


