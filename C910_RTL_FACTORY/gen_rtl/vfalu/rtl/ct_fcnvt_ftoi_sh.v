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
module ct_fcnvt_ftoi_sh(
  fsh_cnt,
  fsh_i_v_nm,
  fsh_i_x_nm,
  fsh_src
);

// &Ports; @23
input   [6 :0]  fsh_cnt;   
input   [52:0]  fsh_src;   
output  [63:0]  fsh_i_v_nm; 
output  [53:0]  fsh_i_x_nm; 

// &Regs; @24
reg     [63:0]  fsh_i_v_nm; 
reg     [53:0]  fsh_i_x_nm; 

// &Wires; @25
wire    [6 :0]  fsh_cnt;   
wire    [52:0]  fsh_src;   


// &CombBeg; @27
always @( fsh_cnt[6:0]
       or fsh_src[52:0])
begin
case(fsh_cnt[6:0])
  7'h7f : begin      //for actual exponent = -1, should consider rouding
    fsh_i_v_nm[63:0] = 64'd0;
    fsh_i_x_nm[53:0] = {fsh_src[52:0], 1'd0};
  end 
  7'd0 : begin
    fsh_i_v_nm[63:0] = {63'd0, fsh_src[52]};
    fsh_i_x_nm[53:0] = {fsh_src[51:0], 2'd0};
  end
  7'd1 : begin
    fsh_i_v_nm[63:0] = {62'd0, fsh_src[52:51]};
    fsh_i_x_nm[53:0] = {fsh_src[50:0], 3'd0};
  end
  7'd2 : begin
    fsh_i_v_nm[63:0] = {61'd0, fsh_src[52:50]};
    fsh_i_x_nm[53:0] = {fsh_src[49:0], 4'd0};
  end
  7'd3 : begin
    fsh_i_v_nm[63:0] = {60'd0, fsh_src[52:49]};
    fsh_i_x_nm[53:0] = {fsh_src[48:0], 5'd0};
  end
  7'd4 : begin
    fsh_i_v_nm[63:0] = {59'd0, fsh_src[52:48]};
    fsh_i_x_nm[53:0] = {fsh_src[47:0], 6'd0};
  end
  7'd5 : begin
    fsh_i_v_nm[63:0] = {58'd0, fsh_src[52:47]};
    fsh_i_x_nm[53:0] = {fsh_src[46:0], 7'd0};
  end
  7'd6 : begin
    fsh_i_v_nm[63:0] = {57'd0, fsh_src[52:46]};
    fsh_i_x_nm[53:0] = {fsh_src[45:0], 8'd0};
  end
  7'd7 : begin
    fsh_i_v_nm[63:0] = {56'd0, fsh_src[52:45]};
    fsh_i_x_nm[53:0] = {fsh_src[44:0], 9'd0};
  end
  7'd8 : begin
    fsh_i_v_nm[63:0] = {55'd0, fsh_src[52:44]};
    fsh_i_x_nm[53:0] = {fsh_src[43:0], 10'd0};
  end
  7'd9 : begin
    fsh_i_v_nm[63:0] = {54'd0, fsh_src[52:43]};
    fsh_i_x_nm[53:0] = {fsh_src[42:0], 11'd0};
  end
  7'd10 : begin
    fsh_i_v_nm[63:0] = {53'd0, fsh_src[52:42]};
    fsh_i_x_nm[53:0] = {fsh_src[41:0], 12'd0};
  end
  7'd11 : begin
    fsh_i_v_nm[63:0] = {52'd0, fsh_src[52:41]};
    fsh_i_x_nm[53:0] = {fsh_src[40:0], 13'd0};
  end
  7'd12 : begin
    fsh_i_v_nm[63:0] = {51'd0, fsh_src[52:40]};
    fsh_i_x_nm[53:0] = {fsh_src[39:0], 14'd0};
  end
  7'd13 : begin
    fsh_i_v_nm[63:0] = {50'd0, fsh_src[52:39]};
    fsh_i_x_nm[53:0] = {fsh_src[38:0], 15'd0};
  end
  7'd14 : begin
    fsh_i_v_nm[63:0] = {49'd0, fsh_src[52:38]};
    fsh_i_x_nm[53:0] = {fsh_src[37:0], 16'd0};
  end
  7'd15 : begin
    fsh_i_v_nm[63:0] = {48'd0, fsh_src[52:37]};
    fsh_i_x_nm[53:0] = {fsh_src[36:0], 17'd0};
  end
  7'd16 : begin
    fsh_i_v_nm[63:0] = {47'd0, fsh_src[52:36]};
    fsh_i_x_nm[53:0] = {fsh_src[35:0], 18'd0};
  end
  7'd17 : begin
    fsh_i_v_nm[63:0] = {46'd0, fsh_src[52:35]};
    fsh_i_x_nm[53:0] = {fsh_src[34:0], 19'd0};
  end
  7'd18 : begin
    fsh_i_v_nm[63:0] = {45'd0, fsh_src[52:34]};
    fsh_i_x_nm[53:0] = {fsh_src[33:0], 20'd0};
  end
  7'd19 : begin
    fsh_i_v_nm[63:0] = {44'd0, fsh_src[52:33]};
    fsh_i_x_nm[53:0] = {fsh_src[32:0], 21'd0};
  end
  7'd20 : begin
    fsh_i_v_nm[63:0] = {43'd0, fsh_src[52:32]};
    fsh_i_x_nm[53:0] = {fsh_src[31:0], 22'd0};
  end
  7'd21 : begin
    fsh_i_v_nm[63:0] = {42'd0, fsh_src[52:31]};
    fsh_i_x_nm[53:0] = {fsh_src[30:0], 23'd0};
  end
  7'd22 : begin
    fsh_i_v_nm[63:0] = {41'd0, fsh_src[52:30]};
    fsh_i_x_nm[53:0] = {fsh_src[29:0], 24'd0};
  end
  7'd23 : begin
    fsh_i_v_nm[63:0] = {40'd0, fsh_src[52:29]};
    fsh_i_x_nm[53:0] = {fsh_src[28:0], 25'd0};
  end
  7'd24 : begin
    fsh_i_v_nm[63:0] = {39'd0, fsh_src[52:28]};
    fsh_i_x_nm[53:0] = {fsh_src[27:0], 26'd0};
  end
  7'd25 : begin
    fsh_i_v_nm[63:0] = {38'd0, fsh_src[52:27]};
    fsh_i_x_nm[53:0] = {fsh_src[26:0], 27'd0};
  end
  7'd26 : begin
    fsh_i_v_nm[63:0] = {37'd0, fsh_src[52:26]};
    fsh_i_x_nm[53:0] = {fsh_src[25:0], 28'd0};
  end
  7'd27 : begin
    fsh_i_v_nm[63:0] = {36'd0, fsh_src[52:25]};
    fsh_i_x_nm[53:0] = {fsh_src[24:0], 29'd0};
  end
  7'd28 : begin
    fsh_i_v_nm[63:0] = {35'd0, fsh_src[52:24]};
    fsh_i_x_nm[53:0] = {fsh_src[23:0], 30'd0};
  end
  7'd29 : begin
    fsh_i_v_nm[63:0] = {34'd0, fsh_src[52:23]};
    fsh_i_x_nm[53:0] = {fsh_src[22:0], 31'd0};
  end
  7'd30 : begin
    fsh_i_v_nm[63:0] = {33'd0, fsh_src[52:22]};
    fsh_i_x_nm[53:0] = {fsh_src[21:0], 32'd0};
  end
  7'd31 : begin
    fsh_i_v_nm[63:0] = {32'd0,fsh_src[52:21]};
    fsh_i_x_nm[53:0] = {fsh_src[20:0], 33'd0};
  end
  7'd32 : begin
    fsh_i_v_nm[63:0] = {31'd0,fsh_src[52:20]};
    fsh_i_x_nm[53:0] = {fsh_src[19:0], 34'd0};
  end
  7'd33 : begin
    fsh_i_v_nm[63:0] = {30'd0,fsh_src[52:19]};
    fsh_i_x_nm[53:0] = {fsh_src[18:0], 35'd0};
  end
  7'd34 : begin
    fsh_i_v_nm[63:0] = {29'd0,fsh_src[52:18]};
    fsh_i_x_nm[53:0] = {fsh_src[17:0], 36'd0};
  end
  7'd35 : begin
    fsh_i_v_nm[63:0] = {28'd0,fsh_src[52:17]};
    fsh_i_x_nm[53:0] = {fsh_src[16:0], 37'd0};
  end
  7'd36 : begin
    fsh_i_v_nm[63:0] = {27'd0,fsh_src[52:16]};
    fsh_i_x_nm[53:0] = {fsh_src[15:0], 38'd0};
  end
  7'd37 : begin
    fsh_i_v_nm[63:0] = {26'd0,fsh_src[52:15]};
    fsh_i_x_nm[53:0] = {fsh_src[14:0], 39'd0};
  end
  7'd38 : begin
    fsh_i_v_nm[63:0] = {25'd0,fsh_src[52:14]};
    fsh_i_x_nm[53:0] = {fsh_src[13:0], 40'd0};
  end
  7'd39 : begin
    fsh_i_v_nm[63:0] = {24'd0,fsh_src[52:13]};
    fsh_i_x_nm[53:0] = {fsh_src[12:0], 41'd0};
  end
  7'd40 : begin
    fsh_i_v_nm[63:0] = {23'd0,fsh_src[52:12]};
    fsh_i_x_nm[53:0] = {fsh_src[11:0], 42'd0};
  end
  7'd41 : begin
    fsh_i_v_nm[63:0] = {22'd0,fsh_src[52:11]};
    fsh_i_x_nm[53:0] = {fsh_src[10:0], 43'd0};
  end
  7'd42 : begin
    fsh_i_v_nm[63:0] = {21'd0,fsh_src[52:10]};
    fsh_i_x_nm[53:0] = {fsh_src[9:0], 44'd0};
  end
  7'd43 : begin
    fsh_i_v_nm[63:0] = {20'd0,fsh_src[52:9]};
    fsh_i_x_nm[53:0] = {fsh_src[8:0], 45'd0};
  end
  7'd44 : begin
    fsh_i_v_nm[63:0] = {19'd0,fsh_src[52:8]};
    fsh_i_x_nm[53:0] = {fsh_src[7:0], 46'd0};
  end
  7'd45 : begin
    fsh_i_v_nm[63:0] = {18'd0,fsh_src[52:7]};
    fsh_i_x_nm[53:0] = {fsh_src[6:0], 47'd0};
  end
  7'd46 : begin
    fsh_i_v_nm[63:0] = {17'd0,fsh_src[52:6]};
    fsh_i_x_nm[53:0] = {fsh_src[5:0], 48'd0};
  end
  7'd47 : begin
    fsh_i_v_nm[63:0] = {16'd0,fsh_src[52:5]};
    fsh_i_x_nm[53:0] = {fsh_src[4:0], 49'd0};
  end
  7'd48 : begin
    fsh_i_v_nm[63:0] = {15'd0,fsh_src[52:4]};
    fsh_i_x_nm[53:0] = {fsh_src[3:0], 50'd0};
  end
  7'd49 : begin
    fsh_i_v_nm[63:0] = {14'd0,fsh_src[52:3]};
    fsh_i_x_nm[53:0] = {fsh_src[2:0], 51'd0};
  end
  7'd50 : begin
    fsh_i_v_nm[63:0] = {13'd0,fsh_src[52:2]};
    fsh_i_x_nm[53:0] = {fsh_src[1:0], 52'd0};
  end
  7'd51 : begin
    fsh_i_v_nm[63:0] = {12'd0,fsh_src[52:1]};
    fsh_i_x_nm[53:0] = {fsh_src[0], 53'd0};
  end
  7'd52 : begin
    fsh_i_v_nm[63:0] = {11'd0,fsh_src[52:0]};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd53 : begin
    fsh_i_v_nm[63:0] = {10'd0,fsh_src[52:0],1'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd54 : begin
    fsh_i_v_nm[63:0] = {9'd0,fsh_src[52:0],2'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd55 : begin
    fsh_i_v_nm[63:0] = {8'd0,fsh_src[52:0],3'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd56 : begin
    fsh_i_v_nm[63:0] = {7'd0,fsh_src[52:0],4'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd57 : begin
    fsh_i_v_nm[63:0] = {6'd0,fsh_src[52:0],5'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd58 : begin
    fsh_i_v_nm[63:0] = {5'd0,fsh_src[52:0],6'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd59 : begin
    fsh_i_v_nm[63:0] = {4'd0,fsh_src[52:0],7'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd60 : begin
    fsh_i_v_nm[63:0] = {3'd0,fsh_src[52:0],8'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd61 : begin
    fsh_i_v_nm[63:0] = {2'd0,fsh_src[52:0],9'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd62 : begin
    fsh_i_v_nm[63:0] = {1'd0,fsh_src[52:0],10'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  7'd63 : begin
    fsh_i_v_nm[63:0] = {fsh_src[52:0],11'd0};
    fsh_i_x_nm[53:0] = 54'd0;
  end
  default : begin
    fsh_i_v_nm[63:0] = {64{1'bx}};
    fsh_i_x_nm[53:0] = {54{1'bx}};
  end
endcase
// &CombEnd; @294
end

// &ModuleEnd; @296
endmodule


