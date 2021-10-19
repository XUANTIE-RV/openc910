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
module ct_fadd_onehot_sel_d(
  data_in,
  onehot,
  result
);

// &Ports; @23
input   [53:0]  data_in; 
input   [53:0]  onehot;  
output  [53:0]  result;  

// &Regs; @24
reg     [53:0]  result_d; 

// &Wires; @25
wire    [53:0]  data_in; 
wire    [53:0]  onehot;  
wire    [53:0]  result;  


// &Force("bus","data_in",53,0); @27
// &CombBeg; @28
always @( onehot[53:0]
       or data_in[53:0])
begin
case(onehot[53:0])
  54'h20_0000_0000_0000 : result_d[53:0] = data_in[53:0];
  54'h10_0000_0000_0000 : result_d[53:0] = {data_in[52:0],1'b0};
  54'h08_0000_0000_0000 : result_d[53:0] = {data_in[51:0],2'b0};
  54'h04_0000_0000_0000 : result_d[53:0] = {data_in[50:0],2'b0,1'b0};
  54'h02_0000_0000_0000 : result_d[53:0] = {data_in[49:0],2'b0,2'b0};
  54'h01_0000_0000_0000 : result_d[53:0] = {data_in[48:0],2'b0,3'b0};
  54'h00_8000_0000_0000 : result_d[53:0] = {data_in[47:0],2'b0,4'b0};
  54'h00_4000_0000_0000 : result_d[53:0] = {data_in[46:0],2'b0,5'b0};
  54'h00_2000_0000_0000 : result_d[53:0] = {data_in[45:0],2'b0,6'b0};
  54'h00_1000_0000_0000 : result_d[53:0] = {data_in[44:0],2'b0,7'b0};
  54'h00_0800_0000_0000 : result_d[53:0] = {data_in[43:0],2'b0,8'b0};
  54'h00_0400_0000_0000 : result_d[53:0] = {data_in[42:0],2'b0,9'b0};
  54'h00_0200_0000_0000 : result_d[53:0] = {data_in[41:0],2'b0,10'b0};
  54'h00_0100_0000_0000 : result_d[53:0] = {data_in[40:0],2'b0,11'b0};
  54'h00_0080_0000_0000 : result_d[53:0] = {data_in[39:0],2'b0,12'b0};
  54'h00_0040_0000_0000 : result_d[53:0] = {data_in[38:0],2'b0,13'b0};
  54'h00_0020_0000_0000 : result_d[53:0] = {data_in[37:0],2'b0,14'b0};
  54'h00_0010_0000_0000 : result_d[53:0] = {data_in[36:0],2'b0,15'b0};
  54'h00_0008_0000_0000 : result_d[53:0] = {data_in[35:0],2'b0,16'b0};
  54'h00_0004_0000_0000 : result_d[53:0] = {data_in[34:0],2'b0,17'b0};
  54'h00_0002_0000_0000 : result_d[53:0] = {data_in[33:0],2'b0,18'b0};
  54'h00_0001_0000_0000 : result_d[53:0] = {data_in[32:0],2'b0,19'b0};
  54'h00_0000_8000_0000 : result_d[53:0] = {data_in[31:0],2'b0,20'b0};
  54'h00_0000_4000_0000 : result_d[53:0] = {data_in[30:0],2'b0,21'b0};
  54'h00_0000_2000_0000 : result_d[53:0] = {data_in[29:0],2'b0,22'b0};
  54'h00_0000_1000_0000 : result_d[53:0] = {data_in[28:0],2'b0,23'b0};
  54'h00_0000_0800_0000 : result_d[53:0] = {data_in[27:0],2'b0,24'b0};
  54'h00_0000_0400_0000 : result_d[53:0] = {data_in[26:0],2'b0,25'b0};
  54'h00_0000_0200_0000 : result_d[53:0] = {data_in[25:0],2'b0,26'b0};
  54'h00_0000_0100_0000 : result_d[53:0] = {data_in[24:0],2'b0,27'b0};
  54'h00_0000_0080_0000 : result_d[53:0] = {data_in[23:0],2'b0,28'b0};
  54'h00_0000_0040_0000 : result_d[53:0] = {data_in[22:0],2'b0,29'b0};
  54'h00_0000_0020_0000 : result_d[53:0] = {data_in[21:0],2'b0,30'b0};
  54'h00_0000_0010_0000 : result_d[53:0] = {data_in[20:0],2'b0,31'b0};
  54'h00_0000_0008_0000 : result_d[53:0] = {data_in[19:0],2'b0,32'b0};
  54'h00_0000_0004_0000 : result_d[53:0] = {data_in[18:0],2'b0,33'b0};
  54'h00_0000_0002_0000 : result_d[53:0] = {data_in[17:0],2'b0,34'b0};
  54'h00_0000_0001_0000 : result_d[53:0] = {data_in[16:0],2'b0,35'b0};
  54'h00_0000_0000_8000 : result_d[53:0] = {data_in[15:0],2'b0,36'b0};
  54'h00_0000_0000_4000 : result_d[53:0] = {data_in[14:0],2'b0,37'b0};
  54'h00_0000_0000_2000 : result_d[53:0] = {data_in[13:0],2'b0,38'b0};
  54'h00_0000_0000_1000 : result_d[53:0] = {data_in[12:0],2'b0,39'b0};
  54'h00_0000_0000_0800 : result_d[53:0] = {data_in[11:0],2'b0,40'b0};
  54'h00_0000_0000_0400 : result_d[53:0] = {data_in[10:0],2'b0,41'b0};
  54'h00_0000_0000_0200 : result_d[53:0] = {data_in[9:0],2'b0,42'b0};
  54'h00_0000_0000_0100 : result_d[53:0] = {data_in[8:0],2'b0,43'b0};
  54'h00_0000_0000_0080 : result_d[53:0] = {data_in[7:0],2'b0,44'b0};
  54'h00_0000_0000_0040 : result_d[53:0] = {data_in[6:0],2'b0,45'b0};
  54'h00_0000_0000_0020 : result_d[53:0] = {data_in[5:0],2'b0,46'b0};
  54'h00_0000_0000_0010 : result_d[53:0] = {data_in[4:0],2'b0,47'b0};
  54'h00_0000_0000_0008 : result_d[53:0] = {data_in[3:0],2'b0,48'b0};
  54'h00_0000_0000_0004 : result_d[53:0] = {data_in[2:0],2'b0,49'b0};
  54'h00_0000_0000_0002 : result_d[53:0] = {data_in[1:0],2'b0,50'b0};
  54'h00_0000_0000_0001 : result_d[53:0] = {data_in[0]  ,2'b0,51'b0};
  54'h00_0000_0000_0000 : result_d[53:0] = 54'b0;
  default               : result_d[53:0] = {54{1'bx}};
endcase
// &CombEnd; @87
end

assign result[53:0] = result_d[53:0];

// &ModuleEnd; @91
endmodule


