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
module ct_f_spsram_256x23(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @26
input   [7 :0]  A;           
input           CEN;         
input           CLK;         
input   [22:0]  D;           
input           GWEN;        
input   [22:0]  WEN;         
output  [22:0]  Q;           

// &Regs; @27
reg     [7 :0]  addr_holding; 

// &Wires; @28
wire    [7 :0]  A;           
wire            CEN;         
wire            CLK;         
wire    [22:0]  D;           
wire            GWEN;        
wire    [22:0]  Q;           
wire    [22:0]  WEN;         
wire    [7 :0]  addr;        
wire    [22:0]  ram0_din;    
wire    [22:0]  ram0_dout;   
wire            ram0_wen;    


parameter ADDR_WIDTH = 8;
parameter WRAP_SIZE  = 23;

//write enable
// &Force("nonport","ram0_wen"); @34
// &Force("bus","WEN",22,0); @35
assign ram0_wen = !CEN && !WEN[0] && !GWEN;

//din
// &Force("nonport","ram0_din"); @39
// &Force("bus","D",WRAP_SIZE-1,0); @40
assign ram0_din[WRAP_SIZE-1:0] = D[WRAP_SIZE-1:0];
//address
// &Force("nonport","addr"); @43
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];
//dout
// &Force("nonport","ram0_dout"); @54

assign Q[WRAP_SIZE-1:0]             = ram0_dout[WRAP_SIZE-1:0];


fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram0(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram0_din),
  .PortAWriteEnable(ram0_wen),
  .PortADataOut(ram0_dout));

// &ModuleEnd; @66
endmodule





