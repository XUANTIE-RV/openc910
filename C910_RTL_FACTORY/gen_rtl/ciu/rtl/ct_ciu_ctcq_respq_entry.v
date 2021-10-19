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
module ct_ciu_ctcq_respq_entry(
  ciu_icg_en,
  cpurst_b,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  respq_create_cmplt_init,
  respq_create_dvm,
  respq_create_en_x,
  respq_dvm_x,
  respq_ebiu_resp_create_en_x,
  respq_l2c_resp_create_en_x,
  respq_piu0_resp_create_en_x,
  respq_piu1_resp_create_en_x,
  respq_piu2_resp_create_en_x,
  respq_piu3_resp_create_en_x,
  respq_vld_x
);

// &Ports; @23
input          ciu_icg_en;                 
input          cpurst_b;                   
input          forever_cpuclk;             
input          pad_yy_icg_scan_en;         
input   [5:0]  respq_create_cmplt_init;    
input          respq_create_dvm;           
input          respq_create_en_x;          
input          respq_ebiu_resp_create_en_x; 
input          respq_l2c_resp_create_en_x; 
input          respq_piu0_resp_create_en_x; 
input          respq_piu1_resp_create_en_x; 
input          respq_piu2_resp_create_en_x; 
input          respq_piu3_resp_create_en_x; 
output         respq_dvm_x;                
output         respq_vld_x;                

// &Regs; @24
reg            respq_dvm;                  
reg            respq_ebiu_cmplt;           
reg            respq_l2c_cmplt;            
reg            respq_piu0_cmplt;           
reg            respq_piu1_cmplt;           
reg            respq_piu2_cmplt;           
reg            respq_piu3_cmplt;           
reg            respq_vld;                  

// &Wires; @25
wire           ciu_icg_en;                 
wire           cpurst_b;                   
wire           forever_cpuclk;             
wire           pad_yy_icg_scan_en;         
wire    [5:0]  respq_create_cmplt_init;    
wire           respq_create_dvm;           
wire           respq_create_en;            
wire           respq_create_en_x;          
wire           respq_dvm_x;                
wire           respq_ebiu_resp_create_en;  
wire           respq_ebiu_resp_create_en_x; 
wire           respq_entry_clk_en;         
wire           respq_l2c_resp_create_en;   
wire           respq_l2c_resp_create_en_x; 
wire           respq_piu0_resp_create_en;  
wire           respq_piu0_resp_create_en_x; 
wire           respq_piu1_resp_create_en;  
wire           respq_piu1_resp_create_en_x; 
wire           respq_piu2_resp_create_en;  
wire           respq_piu2_resp_create_en_x; 
wire           respq_piu3_resp_create_en;  
wire           respq_piu3_resp_create_en_x; 
wire           respq_pop_en;               
wire           respq_vld_x;                
wire           respqentyclk;               

//======================================
//    CTC resp queue(respq)
//entry content:
//| vld   |
//| cmplt |     [4]: L2 cmplt  
//              [3]: cpu3 cmplt
//              [2]: cpu2 cmplt
//              [1]: cpu1 cmplt
//              [0]: cpu0 cmplt
//======================================

assign respq_pop_en  = respq_l2c_cmplt
                     & respq_ebiu_cmplt 
                     & respq_piu3_cmplt
                     & respq_piu2_cmplt
                     & respq_piu1_cmplt
                     & respq_piu0_cmplt
                     & respq_vld;

always @(posedge respqentyclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    respq_vld <= 1'b0;
  else
  begin
    if(respq_create_en)
      respq_vld <= 1'b1;
    else if(respq_pop_en)
      respq_vld <= 1'b0;
    else
      respq_vld <= respq_vld;
  end
end

always @(posedge respqentyclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    respq_l2c_cmplt <= 1'b0;
  else if(respq_create_en)
    respq_l2c_cmplt <= respq_create_cmplt_init[5];
  else if(respq_l2c_resp_create_en)
    respq_l2c_cmplt <= 1'b1;
  else
    respq_l2c_cmplt <= respq_l2c_cmplt;
end
always @(posedge respqentyclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    respq_ebiu_cmplt <= 1'b0;
  else if(respq_create_en)
    respq_ebiu_cmplt <= respq_create_cmplt_init[4];
  else if(respq_ebiu_resp_create_en)
    respq_ebiu_cmplt <= 1'b1;
  else
    respq_ebiu_cmplt <= respq_ebiu_cmplt;
end
always @(posedge respqentyclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    respq_piu3_cmplt <= 1'b0;
  else if(respq_create_en)
    respq_piu3_cmplt <= respq_create_cmplt_init[3];
  else if(respq_piu3_resp_create_en)
    respq_piu3_cmplt <= 1'b1;
  else
    respq_piu3_cmplt <= respq_piu3_cmplt;
end
always @(posedge respqentyclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    respq_piu2_cmplt <= 1'b0;
  else if(respq_create_en)
    respq_piu2_cmplt <= respq_create_cmplt_init[2];
  else if(respq_piu2_resp_create_en)
    respq_piu2_cmplt <= 1'b1;
  else
    respq_piu2_cmplt <= respq_piu2_cmplt;
end
always @(posedge respqentyclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    respq_piu1_cmplt <= 1'b0;
  else if(respq_create_en)
    respq_piu1_cmplt <= respq_create_cmplt_init[1];
  else if(respq_piu1_resp_create_en)
    respq_piu1_cmplt <= 1'b1;
  else
    respq_piu1_cmplt <= respq_piu1_cmplt;
end
always @(posedge respqentyclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    respq_piu0_cmplt <= 1'b0;
  else if(respq_create_en)
    respq_piu0_cmplt <= respq_create_cmplt_init[0];
  else if(respq_piu0_resp_create_en)
    respq_piu0_cmplt <= 1'b1;
  else
    respq_piu0_cmplt <= respq_piu0_cmplt;
end

always @(posedge respqentyclk)
begin
  if (respq_create_en)
    respq_dvm <= respq_create_dvm;
  else
    respq_dvm <= respq_dvm;
end
//==========================================================
//                 Gated Clk EN
//==========================================================
assign respq_entry_clk_en =  respq_create_en 
                          || respq_pop_en
                          || respq_l2c_resp_create_en 
                          || respq_ebiu_resp_create_en
                          || respq_piu3_resp_create_en
                          || respq_piu2_resp_create_en
                          || respq_piu1_resp_create_en
                          || respq_piu0_resp_create_en;

// &Instance("gated_clk_cell","x_respq_entry_gated_cell"); @146
gated_clk_cell  x_respq_entry_gated_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (respqentyclk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (respq_entry_clk_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (forever_cpuclk          ), @147
//           .clk_out          (respqentyclk            ), @148
//           .external_en      (1'b0                    ), @149
//           .global_en        (1'b1                    ), @150
//           .local_en         (respq_entry_clk_en      ), @151
//           .module_en (ciu_icg_en       ) @152
//         ); @153

//==========================================================
//                    input/output
//==========================================================
//input
assign respq_create_en = respq_create_en_x;
assign respq_l2c_resp_create_en  = respq_l2c_resp_create_en_x;
assign respq_ebiu_resp_create_en = respq_ebiu_resp_create_en_x;
assign respq_piu3_resp_create_en = respq_piu3_resp_create_en_x;
assign respq_piu2_resp_create_en = respq_piu2_resp_create_en_x;
assign respq_piu1_resp_create_en = respq_piu1_resp_create_en_x;
assign respq_piu0_resp_create_en = respq_piu0_resp_create_en_x;

//output
assign respq_vld_x     = respq_vld;
assign respq_dvm_x     = respq_dvm;

// &ModuleEnd; @171
endmodule



