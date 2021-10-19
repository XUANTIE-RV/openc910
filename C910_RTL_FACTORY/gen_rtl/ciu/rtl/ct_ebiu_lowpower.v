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
module ct_ebiu_lowpower(
  clk_en,
  cpurst_b,
  ebiu_pad_cactive,
  ebiu_pad_csysack,
  ebiu_read_channel_no_op,
  ebiu_snoop_channel_no_op,
  ebiu_write_channel_no_op,
  ebiu_xx_no_op,
  forever_cpuclk,
  pad_ebiu_csysreq
);

// &Ports; @24
input        clk_en;                  
input        cpurst_b;                
input        ebiu_read_channel_no_op; 
input        ebiu_snoop_channel_no_op; 
input        ebiu_write_channel_no_op; 
input        forever_cpuclk;          
input        pad_ebiu_csysreq;        
output       ebiu_pad_cactive;        
output       ebiu_pad_csysack;        
output       ebiu_xx_no_op;           

// &Regs; @25
reg          ebiu_pad_csysack;        

// &Wires; @26
wire         clk_en;                  
wire         cpurst_b;                
wire         ebiu_pad_cactive;        
wire         ebiu_read_channel_no_op; 
wire         ebiu_snoop_channel_no_op; 
wire         ebiu_write_channel_no_op; 
wire         ebiu_xx_no_op;           
wire         forever_cpuclk;          
wire         pad_ebiu_csysreq;        


//==========================================================
//  EBIU no_op
//==========================================================
assign ebiu_xx_no_op = ebiu_write_channel_no_op & ebiu_snoop_channel_no_op & ebiu_read_channel_no_op;

//==========================================================
// low power handshake with interconnect clock controller 
//==========================================================
assign ebiu_pad_cactive = 1'b1;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ebiu_pad_csysack <= 1'b1;
  else if(clk_en)
  begin
    if(~pad_ebiu_csysreq)
      ebiu_pad_csysack <= 1'b0;
    else
      ebiu_pad_csysack <= 1'b1;
  end
end


// &ModuleEnd; @52
endmodule




