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

// &ModuleBeg; @3
module ct_f_spsram_64x108(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @4
input   [5  :0]  A;           
input            CEN;         
input            CLK;         
input   [107:0]  D;           
input            GWEN;        
input   [107:0]  WEN;         
output  [107:0]  Q;           

// &Regs; @5
reg     [5  :0]  addr_holding; 

// &Wires; @6
wire    [5  :0]  A;           
wire             CEN;         
wire             CLK;         
wire    [107:0]  D;           
wire             GWEN;        
wire    [107:0]  Q;           
wire    [107:0]  WEN;         
wire    [5  :0]  addr;        
wire    [26 :0]  ram_din0;    
wire    [26 :0]  ram_din1;    
wire    [26 :0]  ram_din2;    
wire    [26 :0]  ram_din3;    
wire    [26 :0]  ram_dout0;   
wire    [26 :0]  ram_dout1;   
wire    [26 :0]  ram_dout2;   
wire    [26 :0]  ram_dout3;   
wire             ram_wen0;    
wire             ram_wen1;    
wire             ram_wen2;    
wire             ram_wen3;    

// &Force("bus","Q",107,0); @7

parameter ADDR_WIDTH = 6;
parameter WRAP_SIZE  = 27;

//write enable
// &Force("nonport","ram_wen0"); @13
// &Force("nonport","ram_wen1"); @14
// &Force("nonport","ram_wen2"); @15
// &Force("nonport","ram_wen3"); @16

// &Force("bus","WEN",107,0); @18
assign ram_wen0 = !CEN && !WEN[26] && !GWEN;
assign ram_wen1 = !CEN && !WEN[53] && !GWEN;
assign ram_wen2 = !CEN && !WEN[80] && !GWEN;
assign ram_wen3 = !CEN && !WEN[107] && !GWEN;

//din
// &Force("nonport","ram_din0"); @25
// &Force("nonport","ram_din1"); @26
// &Force("nonport","ram_din2"); @27
// &Force("nonport","ram_din3"); @28
// &Force("bus","D",4*WRAP_SIZE-1,0); @29
assign ram_din0[WRAP_SIZE-1:0] = D[WRAP_SIZE-1:0];
assign ram_din1[WRAP_SIZE-1:0] = D[2*WRAP_SIZE-1:WRAP_SIZE];
assign ram_din2[WRAP_SIZE-1:0] = D[3*WRAP_SIZE-1:2*WRAP_SIZE];
assign ram_din3[WRAP_SIZE-1:0] = D[4*WRAP_SIZE-1:3*WRAP_SIZE];
//address
// &Force("nonport","addr"); @35
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];

//dout
// &Force("nonport","ram_dout0"); @47
// &Force("nonport","ram_dout1"); @48
// &Force("nonport","ram_dout2"); @49
// &Force("nonport","ram_dout3"); @50
assign Q[WRAP_SIZE-1:0]                = ram_dout0[WRAP_SIZE-1:0];
assign Q[2*WRAP_SIZE-1:WRAP_SIZE]      = ram_dout1[WRAP_SIZE-1:0];
assign Q[3*WRAP_SIZE-1:2*WRAP_SIZE]    = ram_dout2[WRAP_SIZE-1:0];
assign Q[4*WRAP_SIZE-1:3*WRAP_SIZE]    = ram_dout3[WRAP_SIZE-1:0];

fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram0(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram_din0),
  .PortAWriteEnable(ram_wen0),
  .PortADataOut(ram_dout0));

fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram1(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram_din1),
  .PortAWriteEnable(ram_wen1),
  .PortADataOut(ram_dout1));

fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram2(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram_din2),
  .PortAWriteEnable(ram_wen2),
  .PortADataOut(ram_dout2));

fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram3(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram_din3),
  .PortAWriteEnable(ram_wen3),
  .PortADataOut(ram_dout3));

// &ModuleEnd; @84
endmodule



