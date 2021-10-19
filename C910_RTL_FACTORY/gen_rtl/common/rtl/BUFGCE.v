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


module BUFGCE(
  I,
  CE,
  O
);

input  I;
input  CE ;
output O;

reg    clk_en_af_latch;
always @(I or CE)
begin
  if(!I)
    clk_en_af_latch <= CE;
end

reg clk_en ;
always @ (clk_en_af_latch )
begin
    clk_en <= clk_en_af_latch;
end
assign O = I && clk_en ;
   
endmodule   
