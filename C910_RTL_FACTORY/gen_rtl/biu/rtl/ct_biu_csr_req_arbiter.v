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
module ct_biu_csr_req_arbiter(
  biu_cp0_cmplt,
  biu_cp0_rdata,
  biu_csr_cmplt,
  biu_csr_op,
  biu_csr_rdata,
  biu_csr_sel,
  biu_csr_wdata,
  biu_hpcp_cmplt,
  biu_hpcp_rdata,
  cp0_biu_op,
  cp0_biu_sel,
  cp0_biu_wdata,
  hpcp_biu_op,
  hpcp_biu_sel,
  hpcp_biu_wdata
);

// &Ports; @23
input            biu_csr_cmplt; 
input   [127:0]  biu_csr_rdata; 
input   [15 :0]  cp0_biu_op;    
input            cp0_biu_sel;   
input   [63 :0]  cp0_biu_wdata; 
input   [15 :0]  hpcp_biu_op;   
input            hpcp_biu_sel;  
input   [63 :0]  hpcp_biu_wdata; 
output           biu_cp0_cmplt; 
output  [127:0]  biu_cp0_rdata; 
output  [15 :0]  biu_csr_op;    
output           biu_csr_sel;   
output  [63 :0]  biu_csr_wdata; 
output           biu_hpcp_cmplt; 
output  [127:0]  biu_hpcp_rdata; 

// &Regs; @24
reg     [15 :0]  biu_csr_op;    
reg              biu_csr_sel;   
reg     [63 :0]  biu_csr_wdata; 

// &Wires; @25
wire             biu_cp0_cmplt; 
wire    [127:0]  biu_cp0_rdata; 
wire             biu_csr_cmplt; 
wire    [127:0]  biu_csr_rdata; 
wire             biu_hpcp_cmplt; 
wire    [127:0]  biu_hpcp_rdata; 
wire    [15 :0]  cp0_biu_op;    
wire             cp0_biu_sel;   
wire    [63 :0]  cp0_biu_wdata; 
wire    [15 :0]  hpcp_biu_op;   
wire             hpcp_biu_sel;  
wire    [63 :0]  hpcp_biu_wdata; 


// &CombBeg; @27
always @( hpcp_biu_op[15:0]
       or hpcp_biu_wdata[63:0]
       or cp0_biu_wdata[63:0]
       or cp0_biu_op[15:0]
       or cp0_biu_sel
       or hpcp_biu_sel)
begin
  if(cp0_biu_sel)
  begin
    biu_csr_sel         = 1'b1;
    biu_csr_op[15:0]    = cp0_biu_op[15:0];
    biu_csr_wdata[63:0] = cp0_biu_wdata[63:0];
  end
  else
  begin
    biu_csr_sel         = hpcp_biu_sel;
    biu_csr_op[15:0]    = hpcp_biu_op[15:0];
    biu_csr_wdata[63:0] = hpcp_biu_wdata[63:0];
  end
// &CombEnd; @40
end

assign biu_cp0_cmplt         = biu_csr_cmplt && cp0_biu_sel;
assign biu_cp0_rdata[127:0]  = biu_csr_rdata[127:0];
assign biu_hpcp_cmplt        = biu_csr_cmplt;
assign biu_hpcp_rdata[127:0] = biu_csr_rdata[127:0];

// &ModuleEnd; @47
endmodule


