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























module f_spsram_large(
  A,
  CEN,
  CLK,
  D,
  Q,
  WEN
);

parameter ADDR_WIDTH = 21;	// 2MB per ram, 16MB at all for f_spsram_large
parameter WRAP_WIDTH = 8;

input   [ADDR_WIDTH-1:0]  A;           
input           CEN;         
input           CLK;         
input   [127:0] D;           
input   [15:0]  WEN;         
output  [127:0] Q;           

reg     [ADDR_WIDTH-1:0]  addr_holding; 


wire    [ADDR_WIDTH-1:0]  A;           
wire            CEN;         
wire            CLK;         
wire    [127:0] D;           
wire    [127:0] Q;           
wire    [15:0]  WEN;         
wire    [ADDR_WIDTH-1:0]  addr;        
wire    [7 :0]  ram0_din;    
wire    [7 :0]  ram0_dout;   
wire            ram0_wen;    
wire    [7 :0]  ram1_din;    
wire    [7 :0]  ram1_dout;   
wire            ram1_wen;    
wire    [7 :0]  ram2_din;    
wire    [7 :0]  ram2_dout;   
wire            ram2_wen;    
wire    [7 :0]  ram3_din;    
wire    [7 :0]  ram3_dout;   
wire            ram3_wen;    
wire    [7 :0]  ram4_din;    
wire    [7 :0]  ram4_dout;   
wire            ram4_wen;    
wire    [7 :0]  ram5_din;    
wire    [7 :0]  ram5_dout;   
wire            ram5_wen;    
wire    [7 :0]  ram6_din;    
wire    [7 :0]  ram6_dout;   
wire            ram6_wen;    
wire    [7 :0]  ram7_din;    
wire    [7 :0]  ram7_dout;   
wire            ram7_wen;    
wire    [7 :0]  ram8_din;    
wire    [7 :0]  ram8_dout;   
wire            ram8_wen;    
wire    [7 :0]  ram9_din;    
wire    [7 :0]  ram9_dout;   
wire            ram9_wen;    
wire    [7 :0]  ram10_din;    
wire    [7 :0]  ram10_dout;   
wire            ram10_wen;    
wire    [7 :0]  ram11_din;    
wire    [7 :0]  ram11_dout;   
wire            ram11_wen;    
wire    [7 :0]  ram12_din;    
wire    [7 :0]  ram12_dout;   
wire            ram12_wen;    
wire    [7 :0]  ram13_din;    
wire    [7 :0]  ram13_dout;   
wire            ram13_wen;    
wire    [7 :0]  ram14_din;    
wire    [7 :0]  ram14_dout;   
wire            ram14_wen;    
wire    [7 :0]  ram15_din;    
wire    [7 :0]  ram15_dout;   
wire            ram15_wen;    







assign ram0_wen = !CEN && !WEN[0];
assign ram1_wen = !CEN && !WEN[1];
assign ram2_wen = !CEN && !WEN[2];
assign ram3_wen = !CEN && !WEN[3];
assign ram4_wen = !CEN && !WEN[4];
assign ram5_wen = !CEN && !WEN[5];
assign ram6_wen = !CEN && !WEN[6];
assign ram7_wen = !CEN && !WEN[7];
assign ram8_wen = !CEN && !WEN[8];
assign ram9_wen = !CEN && !WEN[9];
assign ram10_wen = !CEN && !WEN[10];
assign ram11_wen = !CEN && !WEN[11];
assign ram12_wen = !CEN && !WEN[12];
assign ram13_wen = !CEN && !WEN[13];
assign ram14_wen = !CEN && !WEN[14];
assign ram15_wen = !CEN && !WEN[15];






assign ram0_din[WRAP_WIDTH-1:0] = D[WRAP_WIDTH-1:0];
assign ram1_din[WRAP_WIDTH-1:0] = D[2*WRAP_WIDTH-1:WRAP_WIDTH];
assign ram2_din[WRAP_WIDTH-1:0] = D[3*WRAP_WIDTH-1:2*WRAP_WIDTH];
assign ram3_din[WRAP_WIDTH-1:0] = D[4*WRAP_WIDTH-1:3*WRAP_WIDTH];
assign ram4_din[WRAP_WIDTH-1:0] = D[5*WRAP_WIDTH-1:4*WRAP_WIDTH];
assign ram5_din[WRAP_WIDTH-1:0] = D[6*WRAP_WIDTH-1:5*WRAP_WIDTH];
assign ram6_din[WRAP_WIDTH-1:0] = D[7*WRAP_WIDTH-1:6*WRAP_WIDTH];
assign ram7_din[WRAP_WIDTH-1:0] = D[8*WRAP_WIDTH-1:7*WRAP_WIDTH];
assign ram8_din[WRAP_WIDTH-1:0] = D[9*WRAP_WIDTH-1:8*WRAP_WIDTH];
assign ram9_din[WRAP_WIDTH-1:0] = D[10*WRAP_WIDTH-1:9*WRAP_WIDTH];
assign ram10_din[WRAP_WIDTH-1:0] = D[11*WRAP_WIDTH-1:10*WRAP_WIDTH];
assign ram11_din[WRAP_WIDTH-1:0] = D[12*WRAP_WIDTH-1:11*WRAP_WIDTH];
assign ram12_din[WRAP_WIDTH-1:0] = D[13*WRAP_WIDTH-1:12*WRAP_WIDTH];
assign ram13_din[WRAP_WIDTH-1:0] = D[14*WRAP_WIDTH-1:13*WRAP_WIDTH];
assign ram14_din[WRAP_WIDTH-1:0] = D[15*WRAP_WIDTH-1:14*WRAP_WIDTH];
assign ram15_din[WRAP_WIDTH-1:0] = D[16*WRAP_WIDTH-1:15*WRAP_WIDTH];


always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];





assign Q[WRAP_WIDTH-1:0]               = ram0_dout[WRAP_WIDTH-1:0];
assign Q[2*WRAP_WIDTH-1:WRAP_WIDTH]    = ram1_dout[WRAP_WIDTH-1:0];
assign Q[3*WRAP_WIDTH-1:2*WRAP_WIDTH]  = ram2_dout[WRAP_WIDTH-1:0];
assign Q[4*WRAP_WIDTH-1:3*WRAP_WIDTH]  = ram3_dout[WRAP_WIDTH-1:0];
assign Q[5*WRAP_WIDTH-1:4*WRAP_WIDTH]  = ram4_dout[WRAP_WIDTH-1:0];
assign Q[6*WRAP_WIDTH-1:5*WRAP_WIDTH]  = ram5_dout[WRAP_WIDTH-1:0];
assign Q[7*WRAP_WIDTH-1:6*WRAP_WIDTH]  = ram6_dout[WRAP_WIDTH-1:0];
assign Q[8*WRAP_WIDTH-1:7*WRAP_WIDTH]  = ram7_dout[WRAP_WIDTH-1:0];
assign Q[9*WRAP_WIDTH-1:8*WRAP_WIDTH]  = ram8_dout[WRAP_WIDTH-1:0];
assign Q[10*WRAP_WIDTH-1:9*WRAP_WIDTH]  = ram9_dout[WRAP_WIDTH-1:0];
assign Q[11*WRAP_WIDTH-1:10*WRAP_WIDTH]  = ram10_dout[WRAP_WIDTH-1:0];
assign Q[12*WRAP_WIDTH-1:11*WRAP_WIDTH]  = ram11_dout[WRAP_WIDTH-1:0];
assign Q[13*WRAP_WIDTH-1:12*WRAP_WIDTH]  = ram12_dout[WRAP_WIDTH-1:0];
assign Q[14*WRAP_WIDTH-1:13*WRAP_WIDTH]  = ram13_dout[WRAP_WIDTH-1:0];
assign Q[15*WRAP_WIDTH-1:14*WRAP_WIDTH]  = ram14_dout[WRAP_WIDTH-1:0];
assign Q[16*WRAP_WIDTH-1:15*WRAP_WIDTH]  = ram15_dout[WRAP_WIDTH-1:0];

ram #(WRAP_WIDTH,ADDR_WIDTH) ram0(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram0_din),
  .PortAWriteEnable(ram0_wen),
  .PortADataOut(ram0_dout));


ram #(WRAP_WIDTH,ADDR_WIDTH) ram1(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram1_din),
  .PortAWriteEnable(ram1_wen),
  .PortADataOut(ram1_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram2(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram2_din),
  .PortAWriteEnable(ram2_wen),
  .PortADataOut(ram2_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram3(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram3_din),
  .PortAWriteEnable(ram3_wen),
  .PortADataOut(ram3_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram4(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram4_din),
  .PortAWriteEnable(ram4_wen),
  .PortADataOut(ram4_dout));


ram #(WRAP_WIDTH,ADDR_WIDTH) ram5(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram5_din),
  .PortAWriteEnable(ram5_wen),
  .PortADataOut(ram5_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram6(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram6_din),
  .PortAWriteEnable(ram6_wen),
  .PortADataOut(ram6_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram7(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram7_din),
  .PortAWriteEnable(ram7_wen),
  .PortADataOut(ram7_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram8(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram8_din),
  .PortAWriteEnable(ram8_wen),
  .PortADataOut(ram8_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram9(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram9_din),
  .PortAWriteEnable(ram9_wen),
  .PortADataOut(ram9_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram10(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram10_din),
  .PortAWriteEnable(ram10_wen),
  .PortADataOut(ram10_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram11(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram11_din),
  .PortAWriteEnable(ram11_wen),
  .PortADataOut(ram11_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram12(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram12_din),
  .PortAWriteEnable(ram12_wen),
  .PortADataOut(ram12_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram13(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram13_din),
  .PortAWriteEnable(ram13_wen),
  .PortADataOut(ram13_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram14(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram14_din),
  .PortAWriteEnable(ram14_wen),
  .PortADataOut(ram14_dout));

ram #(WRAP_WIDTH,ADDR_WIDTH) ram15(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram15_din),
  .PortAWriteEnable(ram15_wen),
  .PortADataOut(ram15_dout));


endmodule


