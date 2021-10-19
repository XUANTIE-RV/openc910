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
module ct_f_spsram_128x16(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @26
input   [6 :0]  A;           
input           CEN;         
input           CLK;         
input   [15:0]  D;           
input           GWEN;        
input   [15:0]  WEN;         
output  [15:0]  Q;           

// &Regs; @27
reg     [6 :0]  addr_holding; 

// &Wires; @28
wire    [6 :0]  A;           
wire            CEN;         
wire            CLK;         
wire    [15:0]  D;           
wire            GWEN;        
wire    [15:0]  Q;           
wire    [15:0]  WEN;         
wire    [6 :0]  addr;        
wire            ram0_din;    
wire            ram0_dout;   
wire            ram0_wen;    
wire            ram10_din;   
wire            ram10_dout;  
wire            ram10_wen;   
wire            ram11_din;   
wire            ram11_dout;  
wire            ram11_wen;   
wire            ram12_din;   
wire            ram12_dout;  
wire            ram12_wen;   
wire            ram13_din;   
wire            ram13_dout;  
wire            ram13_wen;   
wire            ram14_din;   
wire            ram14_dout;  
wire            ram14_wen;   
wire            ram15_din;   
wire            ram15_dout;  
wire            ram15_wen;   
wire            ram1_din;    
wire            ram1_dout;   
wire            ram1_wen;    
wire            ram2_din;    
wire            ram2_dout;   
wire            ram2_wen;    
wire            ram3_din;    
wire            ram3_dout;   
wire            ram3_wen;    
wire            ram4_din;    
wire            ram4_dout;   
wire            ram4_wen;    
wire            ram5_din;    
wire            ram5_dout;   
wire            ram5_wen;    
wire            ram6_din;    
wire            ram6_dout;   
wire            ram6_wen;    
wire            ram7_din;    
wire            ram7_dout;   
wire            ram7_wen;    
wire            ram8_din;    
wire            ram8_dout;   
wire            ram8_wen;    
wire            ram9_din;    
wire            ram9_dout;   
wire            ram9_wen;    


parameter ADDR_WIDTH = 7;

//write enable
// &Force("nonport","ram0_wen"); @33
// &Force("nonport","ram1_wen"); @34
// &Force("nonport","ram2_wen"); @35
// &Force("nonport","ram3_wen"); @36
// &Force("nonport","ram4_wen"); @37
// &Force("nonport","ram5_wen"); @38
// &Force("nonport","ram6_wen"); @39
// &Force("nonport","ram7_wen"); @40
// &Force("nonport","ram8_wen"); @41
// &Force("nonport","ram9_wen"); @42
// &Force("nonport","ram10_wen"); @43
// &Force("nonport","ram11_wen"); @44
// &Force("nonport","ram12_wen"); @45
// &Force("nonport","ram13_wen"); @46
// &Force("nonport","ram14_wen"); @47
// &Force("nonport","ram15_wen"); @48
// &Force("bus","WEN",15,0); @49
assign ram0_wen  = !CEN && !WEN[0] && !GWEN;
assign ram1_wen  = !CEN && !WEN[1] && !GWEN;
assign ram2_wen  = !CEN && !WEN[2] && !GWEN;
assign ram3_wen  = !CEN && !WEN[3] && !GWEN;
assign ram4_wen  = !CEN && !WEN[4] && !GWEN;
assign ram5_wen  = !CEN && !WEN[5] && !GWEN;
assign ram6_wen  = !CEN && !WEN[6] && !GWEN;
assign ram7_wen  = !CEN && !WEN[7] && !GWEN;
assign ram8_wen  = !CEN && !WEN[8] && !GWEN;
assign ram9_wen  = !CEN && !WEN[9] && !GWEN;
assign ram10_wen = !CEN && !WEN[10] && !GWEN;
assign ram11_wen = !CEN && !WEN[11] && !GWEN;
assign ram12_wen = !CEN && !WEN[12] && !GWEN;
assign ram13_wen = !CEN && !WEN[13] && !GWEN;
assign ram14_wen = !CEN && !WEN[14] && !GWEN;
assign ram15_wen = !CEN && !WEN[15] && !GWEN;

//din
// &Force("nonport","ram0_din"); @68
// &Force("nonport","ram1_din"); @69
// &Force("nonport","ram2_din"); @70
// &Force("nonport","ram3_din"); @71
// &Force("nonport","ram4_din"); @72
// &Force("nonport","ram5_din"); @73
// &Force("nonport","ram6_din"); @74
// &Force("nonport","ram7_din"); @75
// &Force("nonport","ram8_din"); @76
// &Force("nonport","ram9_din"); @77
// &Force("nonport","ram10_din"); @78
// &Force("nonport","ram11_din"); @79
// &Force("nonport","ram12_din"); @80
// &Force("nonport","ram13_din"); @81
// &Force("nonport","ram14_din"); @82
// &Force("nonport","ram15_din"); @83
// &Force("bus","D",15,0); @84
assign ram0_din = D[0];
assign ram1_din = D[1];
assign ram2_din = D[2];
assign ram3_din = D[3];
assign ram4_din = D[4];
assign ram5_din = D[5];
assign ram6_din = D[6];
assign ram7_din = D[7];
assign ram8_din = D[8];
assign ram9_din = D[9];
assign ram10_din = D[10];
assign ram11_din = D[11];
assign ram12_din = D[12];
assign ram13_din = D[13];
assign ram14_din = D[14];
assign ram15_din = D[15];

//address
// &Force("nonport","addr"); @103
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];

//dout
// &Force("nonport","ram0_dout"); @115
// &Force("nonport","ram1_dout"); @116
// &Force("nonport","ram2_dout"); @117
// &Force("nonport","ram3_dout"); @118
// &Force("nonport","ram4_dout"); @119
// &Force("nonport","ram5_dout"); @120
// &Force("nonport","ram6_dout"); @121
// &Force("nonport","ram7_dout"); @122
// &Force("nonport","ram8_dout"); @123
// &Force("nonport","ram9_dout"); @124
// &Force("nonport","ram10_dout"); @125
// &Force("nonport","ram11_dout"); @126
// &Force("nonport","ram12_dout"); @127
// &Force("nonport","ram13_dout"); @128
// &Force("nonport","ram14_dout"); @129
// &Force("nonport","ram15_dout"); @130
assign Q[0] = ram0_dout;
assign Q[1] = ram1_dout;
assign Q[2] = ram2_dout;
assign Q[3] = ram3_dout;
assign Q[4] = ram4_dout;
assign Q[5] = ram5_dout;
assign Q[6] = ram6_dout;
assign Q[7] = ram7_dout;
assign Q[8] = ram8_dout;
assign Q[9] = ram9_dout;
assign Q[10] = ram10_dout;
assign Q[11] = ram11_dout;
assign Q[12] = ram12_dout;
assign Q[13] = ram13_dout;
assign Q[14] = ram14_dout;
assign Q[15] = ram15_dout;

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

fpga_ram #(1,ADDR_WIDTH) ram7(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram7_din),
  .PortAWriteEnable(ram7_wen),
  .PortADataOut(ram7_dout));

fpga_ram #(1,ADDR_WIDTH) ram8(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram8_din),
  .PortAWriteEnable(ram8_wen),
  .PortADataOut(ram8_dout));

fpga_ram #(1,ADDR_WIDTH) ram9(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram9_din),
  .PortAWriteEnable(ram9_wen),
  .PortADataOut(ram9_dout));

fpga_ram #(1,ADDR_WIDTH) ram10(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram10_din),
  .PortAWriteEnable(ram10_wen),
  .PortADataOut(ram10_dout));

fpga_ram #(1,ADDR_WIDTH) ram11(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram11_din),
  .PortAWriteEnable(ram11_wen),
  .PortADataOut(ram11_dout));

fpga_ram #(1,ADDR_WIDTH) ram12(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram12_din),
  .PortAWriteEnable(ram12_wen),
  .PortADataOut(ram12_dout));

fpga_ram #(1,ADDR_WIDTH) ram13(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram13_din),
  .PortAWriteEnable(ram13_wen),
  .PortADataOut(ram13_dout));

fpga_ram #(1,ADDR_WIDTH) ram14(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram14_din),
  .PortAWriteEnable(ram14_wen),
  .PortADataOut(ram14_dout));

fpga_ram #(1,ADDR_WIDTH) ram15(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram15_din),
  .PortAWriteEnable(ram15_wen),
  .PortADataOut(ram15_dout));


// &ModuleEnd; @261
endmodule




