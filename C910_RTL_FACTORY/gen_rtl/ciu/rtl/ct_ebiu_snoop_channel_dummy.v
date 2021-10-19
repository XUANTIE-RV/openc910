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
module ct_ebiu_snoop_channel_dummy(
  ebiu_ebiuif_acaddr,
  ebiu_ebiuif_acid,
  ebiu_ebiuif_acprot,
  ebiu_ebiuif_acsnoop,
  ebiu_ebiuif_acvalid,
  ebiu_ebiuif_cd_grant,
  ebiu_ebiuif_cr_grant,
  ebiu_snoop_channel_no_op,
  ebiuif_ebiu_ac_grant,
  ebiuif_ebiu_cddata,
  ebiuif_ebiu_cdlast,
  ebiuif_ebiu_cdvalid,
  ebiuif_ebiu_crresp,
  ebiuif_ebiu_crvalid
);

// &Ports; @2
input            ebiuif_ebiu_ac_grant;    
input   [127:0]  ebiuif_ebiu_cddata;      
input            ebiuif_ebiu_cdlast;      
input            ebiuif_ebiu_cdvalid;     
input   [4  :0]  ebiuif_ebiu_crresp;      
input            ebiuif_ebiu_crvalid;     
output  [39 :0]  ebiu_ebiuif_acaddr;      
output  [4  :0]  ebiu_ebiuif_acid;        
output  [2  :0]  ebiu_ebiuif_acprot;      
output  [3  :0]  ebiu_ebiuif_acsnoop;     
output           ebiu_ebiuif_acvalid;     
output           ebiu_ebiuif_cd_grant;    
output           ebiu_ebiuif_cr_grant;    
output           ebiu_snoop_channel_no_op; 

// &Regs; @3

// &Wires; @4
wire    [39 :0]  ebiu_ebiuif_acaddr;      
wire    [4  :0]  ebiu_ebiuif_acid;        
wire    [2  :0]  ebiu_ebiuif_acprot;      
wire    [3  :0]  ebiu_ebiuif_acsnoop;     
wire             ebiu_ebiuif_acvalid;     
wire             ebiu_ebiuif_cd_grant;    
wire             ebiu_ebiuif_cr_grant;    
wire             ebiu_snoop_channel_no_op; 


parameter ADDRW = `PA_WIDTH;

// &Force("input","ebiuif_ebiu_ac_grant"); @8
// &Force("input","ebiuif_ebiu_cdvalid"); @9
// &Force("input","ebiuif_ebiu_cddata"); &Force("bus","ebiuif_ebiu_cddata",127,0); @10
// &Force("input","ebiuif_ebiu_cdlast"); @11
// &Force("input","ebiuif_ebiu_crvalid"); @12
// &Force("input","ebiuif_ebiu_crresp"); &Force("bus","ebiuif_ebiu_crresp",4,0); @13

assign ebiu_ebiuif_acvalid = 1'b0;
assign ebiu_ebiuif_acaddr[ADDRW-1:0] = {ADDRW{1'b0}};
assign ebiu_ebiuif_acid[4:0] = 5'b0;
assign ebiu_ebiuif_acprot[2:0] = 3'b0;
assign ebiu_ebiuif_acsnoop[3:0] = 4'b0;

assign ebiu_ebiuif_cr_grant = 1'b0;
assign ebiu_ebiuif_cd_grant = 1'b0;
assign ebiu_snoop_channel_no_op = 1'b1;

// &ModuleEnd; @25
endmodule


