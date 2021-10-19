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
module ct_f_spsram_512x7(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @26
input   [8:0]  A;           
input          CEN;         
input          CLK;         
input   [6:0]  D;           
input          GWEN;        
input   [6:0]  WEN;         
output  [6:0]  Q;           

// &Regs; @27
reg     [8:0]  addr_holding; 

// &Wires; @28
wire    [8:0]  A;           
wire           CEN;         
wire           CLK;         
wire    [6:0]  D;           
wire           GWEN;        
wire    [6:0]  Q;           
wire    [6:0]  WEN;         
wire    [8:0]  addr;        
wire           ram0_din;    
wire           ram0_dout;   
wire           ram0_wen;    
wire           ram1_din;    
wire           ram1_dout;   
wire           ram1_wen;    
wire           ram2_din;    
wire           ram2_dout;   
wire           ram2_wen;    
wire           ram3_din;    
wire           ram3_dout;   
wire           ram3_wen;    
wire           ram4_din;    
wire           ram4_dout;   
wire           ram4_wen;    
wire           ram5_din;    
wire           ram5_dout;   
wire           ram5_wen;    
wire           ram6_din;    
wire           ram6_dout;   
wire           ram6_wen;    


parameter ADDR_WIDTH = 9;

//write enable
// &Force("nonport","ram0_wen"); @33
// &Force("nonport","ram1_wen"); @34
// &Force("nonport","ram2_wen"); @35
// &Force("nonport","ram3_wen"); @36
// &Force("nonport","ram4_wen"); @37
// &Force("nonport","ram5_wen"); @38
// &Force("nonport","ram6_wen"); @39
// &Force("bus","WEN",6,0); @40
assign ram0_wen = !CEN && !WEN[0] && !GWEN;
assign ram1_wen = !CEN && !WEN[1] && !GWEN;
assign ram2_wen = !CEN && !WEN[2] && !GWEN;
assign ram3_wen = !CEN && !WEN[3] && !GWEN;
assign ram4_wen = !CEN && !WEN[4] && !GWEN;
assign ram5_wen = !CEN && !WEN[5] && !GWEN;
assign ram6_wen = !CEN && !WEN[6] && !GWEN;

//din
// &Force("nonport","ram0_din"); @50
// &Force("nonport","ram1_din"); @51
// &Force("nonport","ram2_din"); @52
// &Force("nonport","ram3_din"); @53
// &Force("nonport","ram4_din"); @54
// &Force("nonport","ram5_din"); @55
// &Force("nonport","ram6_din"); @56
// &Force("bus","D",6,0); @57
assign ram0_din = D[0];
assign ram1_din = D[1];
assign ram2_din = D[2];
assign ram3_din = D[3];
assign ram4_din = D[4];
assign ram5_din = D[5];
assign ram6_din = D[6];

//address
// &Force("nonport","addr"); @67
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];

//dout
// &Force("nonport","ram0_dout"); @79
// &Force("nonport","ram1_dout"); @80
// &Force("nonport","ram2_dout"); @81
// &Force("nonport","ram3_dout"); @82
// &Force("nonport","ram4_dout"); @83
// &Force("nonport","ram5_dout"); @84
// &Force("nonport","ram6_dout"); @85
assign Q[0] = ram0_dout;
assign Q[1] = ram1_dout;
assign Q[2] = ram2_dout;
assign Q[3] = ram3_dout;
assign Q[4] = ram4_dout;
assign Q[5] = ram5_dout;
assign Q[6] = ram6_dout;

fpga_ram #(1,ADDR_WIDTH) ram0(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram0_din),
  .PortAWriteEnable(ram0_wen),
  .PortADataOut(ram0_dout));

fpga_ram #(1,ADDR_WIDTH) ram1(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram1_din),
  .PortAWriteEnable(ram1_wen),
  .PortADataOut(ram1_dout));

fpga_ram #(1,ADDR_WIDTH) ram2(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram2_din),
  .PortAWriteEnable(ram2_wen),
  .PortADataOut(ram2_dout));

fpga_ram #(1,ADDR_WIDTH) ram3(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram3_din),
  .PortAWriteEnable(ram3_wen),
  .PortADataOut(ram3_dout));

fpga_ram #(1,ADDR_WIDTH) ram4(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram4_din),
  .PortAWriteEnable(ram4_wen),
  .PortADataOut(ram4_dout));

fpga_ram #(1,ADDR_WIDTH) ram5(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram5_din),
  .PortAWriteEnable(ram5_wen),
  .PortADataOut(ram5_dout));

fpga_ram #(1,ADDR_WIDTH) ram6(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram6_din),
  .PortAWriteEnable(ram6_wen),
  .PortADataOut(ram6_dout));

// &ModuleEnd; @143
endmodule




