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

// &ModuleBeg; @24
module ct_f_spsram_256x196(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @25
input   [7  :0]  A;           
input            CEN;         
input            CLK;         
input   [195:0]  D;           
input            GWEN;        
input   [195:0]  WEN;         
output  [195:0]  Q;           

// &Regs; @26
reg     [7  :0]  addr_holding; 

// &Wires; @27
wire    [7  :0]  A;           
wire             CEN;         
wire             CLK;         
wire    [195:0]  D;           
wire             GWEN;        
wire    [195:0]  Q;           
wire    [195:0]  WEN;         
wire    [7  :0]  addr;        
wire    [3  :0]  ram0_din;    
wire    [3  :0]  ram0_dout;   
wire             ram0_wen;    
wire    [47 :0]  ram1_din;    
wire    [47 :0]  ram1_dout;   
wire             ram1_wen;    
wire    [47 :0]  ram2_din;    
wire    [47 :0]  ram2_dout;   
wire             ram2_wen;    
wire    [47 :0]  ram3_din;    
wire    [47 :0]  ram3_dout;   
wire             ram3_wen;    
wire    [47 :0]  ram4_din;    
wire    [47 :0]  ram4_dout;   
wire             ram4_wen;    


parameter ADDR_WIDTH   = 8;
parameter WRAP_SIZE_1  = 4;
parameter WRAP_SIZE_2  = 48;

//write enable
// &Force("nonport","ram0_wen"); @34
// &Force("nonport","ram1_wen"); @35
// &Force("nonport","ram2_wen"); @36
// &Force("nonport","ram3_wen"); @37
// &Force("nonport","ram4_wen"); @38
// &Force("bus","WEN",195,0); @39
assign ram0_wen = !CEN && !WEN[195] && !GWEN;
assign ram1_wen = !CEN && !WEN[191] && !GWEN;
assign ram2_wen = !CEN && !WEN[143] && !GWEN;
assign ram3_wen = !CEN && !WEN[ 95] && !GWEN;
assign ram4_wen = !CEN && !WEN[ 47] && !GWEN;

//din
// &Force("nonport","ram0_din"); @47
// &Force("nonport","ram1_din"); @48
// &Force("nonport","ram2_din"); @49
// &Force("nonport","ram3_din"); @50
// &Force("nonport","ram4_din"); @51
// &Force("bus","D",WRAP_SIZE_1+4*WRAP_SIZE_2-1,0); @52
assign ram0_din[WRAP_SIZE_1-1:0] = D[WRAP_SIZE_1+4*WRAP_SIZE_2-1:4*WRAP_SIZE_2];
assign ram1_din[WRAP_SIZE_2-1:0] = D[4*WRAP_SIZE_2-1:3*WRAP_SIZE_2];
assign ram2_din[WRAP_SIZE_2-1:0] = D[3*WRAP_SIZE_2-1:2*WRAP_SIZE_2];
assign ram3_din[WRAP_SIZE_2-1:0] = D[2*WRAP_SIZE_2-1:1*WRAP_SIZE_2];
assign ram4_din[WRAP_SIZE_2-1:0] = D[1*WRAP_SIZE_2-1:0*WRAP_SIZE_2];
//address
// &Force("nonport","addr"); @59
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];
//dout
// &Force("nonport","ram0_dout"); @70
// &Force("nonport","ram1_dout"); @71
// &Force("nonport","ram2_dout"); @72
// &Force("nonport","ram3_dout"); @73
// &Force("nonport","ram4_dout"); @74

assign Q[WRAP_SIZE_1+4*WRAP_SIZE_2-1:4*WRAP_SIZE_2] = ram0_dout[WRAP_SIZE_1-1:0];
assign Q[4*WRAP_SIZE_2-1:3*WRAP_SIZE_2]             = ram1_dout[WRAP_SIZE_2-1:0];
assign Q[3*WRAP_SIZE_2-1:2*WRAP_SIZE_2]             = ram2_dout[WRAP_SIZE_2-1:0];
assign Q[2*WRAP_SIZE_2-1:1*WRAP_SIZE_2]             = ram3_dout[WRAP_SIZE_2-1:0];
assign Q[1*WRAP_SIZE_2-1:0*WRAP_SIZE_2]             = ram4_dout[WRAP_SIZE_2-1:0];


fpga_ram #(WRAP_SIZE_1,ADDR_WIDTH) ram0(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram0_din),
  .PortAWriteEnable(ram0_wen),
  .PortADataOut(ram0_dout));

fpga_ram #(WRAP_SIZE_2,ADDR_WIDTH) ram1(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram1_din),
  .PortAWriteEnable(ram1_wen),
  .PortADataOut(ram1_dout));

fpga_ram #(WRAP_SIZE_2,ADDR_WIDTH) ram2(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram2_din),
  .PortAWriteEnable(ram2_wen),
  .PortADataOut(ram2_dout));

fpga_ram #(WRAP_SIZE_2,ADDR_WIDTH) ram3(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram3_din),
  .PortAWriteEnable(ram3_wen),
  .PortADataOut(ram3_dout));

fpga_ram #(WRAP_SIZE_2,ADDR_WIDTH) ram4(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram4_din),
  .PortAWriteEnable(ram4_wen),
  .PortADataOut(ram4_dout));

// &ModuleEnd; @118
endmodule


