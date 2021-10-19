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

// &Depend("fpga_ram.v"); @23

// &ModuleBeg; @25
module ct_f_spsram_4096x128(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @26
input   [11 :0]  A;           
input            CEN;         
input            CLK;         
input   [127:0]  D;           
input            GWEN;        
input   [127:0]  WEN;         
output  [127:0]  Q;           

// &Regs; @27
reg     [11 :0]  addr_holding; 

// &Wires; @28
wire    [11 :0]  A;           
wire             CEN;         
wire             CLK;         
wire    [127:0]  D;           
wire             GWEN;        
wire    [127:0]  Q;           
wire    [127:0]  WEN;         
wire    [11 :0]  addr;        
wire    [127:0]  ram_din;     
wire    [127:0]  ram_dout;    
wire             ram_wen;     


parameter ADDR_WIDTH = 12;
parameter WRAP_SIZE  = 128;

//write enable
// &Force("nonport","ram_wen"); @34
// &Force("bus","WEN",127,0); @35
assign ram_wen = !CEN && !WEN[127] && !GWEN;
//din
// &Force("nonport","ram_din"); @38
// &Force("bus","D",WRAP_SIZE-1,0); @39
assign ram_din[WRAP_SIZE-1:0] = D[WRAP_SIZE-1:0];
//address
// &Force("nonport","addr"); @42
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];
//dout
// &Force("nonport","ram_dout"); @53
assign Q[WRAP_SIZE-1:0]                = ram_dout[WRAP_SIZE-1:0];
fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram_din),
  .PortAWriteEnable(ram_wen),
  .PortADataOut(ram_dout));

// &ModuleEnd; @62
endmodule


