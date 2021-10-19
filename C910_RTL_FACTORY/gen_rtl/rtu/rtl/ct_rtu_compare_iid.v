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
module ct_rtu_compare_iid(
  x_iid0,
  x_iid0_older,
  x_iid1
);

// &Ports; @25
input   [6:0]  x_iid0;          
input   [6:0]  x_iid1;          
output         x_iid0_older;    

// &Regs; @26

// &Wires; @27
wire           iid0_5_0_larger; 
wire    [5:0]  iid0_larger;     
wire           iid1_5_0_larger; 
wire    [5:0]  iid1_larger;     
wire           iid_msb_mismatch; 
wire    [6:0]  x_iid0;          
wire           x_iid0_older;    
wire    [6:0]  x_iid1;          


//==========================================================
//            Compare order of two 7 bits IIDs
//==========================================================
assign iid_msb_mismatch = x_iid0[6] ^ x_iid1[6];

assign iid0_larger[5] = x_iid0[5] && !x_iid1[5];
assign iid0_larger[4] = x_iid0[4] && !x_iid1[4];
assign iid0_larger[3] = x_iid0[3] && !x_iid1[3];
assign iid0_larger[2] = x_iid0[2] && !x_iid1[2];
assign iid0_larger[1] = x_iid0[1] && !x_iid1[1];
assign iid0_larger[0] = x_iid0[0] && !x_iid1[0];

assign iid1_larger[5] = !x_iid0[5] && x_iid1[5];
assign iid1_larger[4] = !x_iid0[4] && x_iid1[4];
assign iid1_larger[3] = !x_iid0[3] && x_iid1[3];
assign iid1_larger[2] = !x_iid0[2] && x_iid1[2];
assign iid1_larger[1] = !x_iid0[1] && x_iid1[1];
assign iid1_larger[0] = !x_iid0[0] && x_iid1[0];

assign iid0_5_0_larger =
     iid0_larger[5]
  || iid0_larger[4] && !iid1_larger[5]
  || iid0_larger[3] && !(|iid1_larger[5:4])
  || iid0_larger[2] && !(|iid1_larger[5:3])
  || iid0_larger[1] && !(|iid1_larger[5:2])
  || iid0_larger[0] && !(|iid1_larger[5:1]);

assign iid1_5_0_larger =
     iid1_larger[5]
  || iid1_larger[4] && !iid0_larger[5]
  || iid1_larger[3] && !(|iid0_larger[5:4])
  || iid1_larger[2] && !(|iid0_larger[5:3])
  || iid1_larger[1] && !(|iid0_larger[5:2])
  || iid1_larger[0] && !(|iid0_larger[5:1]);

assign x_iid0_older = !iid_msb_mismatch && iid1_5_0_larger
                  || iid_msb_mismatch && iid0_5_0_larger;

// &ModuleEnd; @67
endmodule


