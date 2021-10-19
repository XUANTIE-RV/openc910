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

// &ModuleBeg; @22
module ct_rst_top(
  forever_coreclk,
  fpu_rst_b,
  had_rst_b,
  idu_rst_b,
  ifu_rst_b,
  lsu_rst_b,
  mmu_rst_b,
  pad_core_rst_b,
  pad_cpu_rst_b,
  pad_yy_mbist_mode,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b
);

// &Ports; @23
input        forever_coreclk;  
input        pad_core_rst_b;   
input        pad_cpu_rst_b;    
input        pad_yy_mbist_mode; 
input        pad_yy_scan_mode; 
input        pad_yy_scan_rst_b; 
output       fpu_rst_b;        
output       had_rst_b;        
output       idu_rst_b;        
output       ifu_rst_b;        
output       lsu_rst_b;        
output       mmu_rst_b;        

// &Regs; @24
reg          core_rst_ff_1st;  
reg          core_rst_ff_2nd;  
reg          core_rst_ff_3rd;  
reg          fpurst_b;         
reg          hadrst_b;         
reg          idurst_b;         
reg          ifurst_b;         
reg          lsurst_b;         
reg          mmurst_b;         

// &Wires; @25
wire         async_corerst_b;  
wire         corerst_b;        
wire         forever_coreclk;  
wire         fpu_rst_b;        
wire         had_rst_b;        
wire         idu_rst_b;        
wire         ifu_rst_b;        
wire         lsu_rst_b;        
wire         mmu_rst_b;        
wire         pad_core_rst_b;   
wire         pad_cpu_rst_b;    
wire         pad_yy_mbist_mode; 
wire         pad_yy_scan_mode; 
wire         pad_yy_scan_rst_b; 


//==============================================================================
//cpu reset
//==============================================================================
assign async_corerst_b = pad_core_rst_b & pad_cpu_rst_b & !pad_yy_mbist_mode;

always @(posedge forever_coreclk or negedge async_corerst_b)
begin
  if(!async_corerst_b)
  begin
    core_rst_ff_1st <= 1'b0;
    core_rst_ff_2nd <= 1'b0;
    core_rst_ff_3rd <= 1'b0;
  end
  else
  begin
    core_rst_ff_1st <= 1'b1;
    core_rst_ff_2nd <= core_rst_ff_1st;
    core_rst_ff_3rd <= core_rst_ff_2nd;
  end
end

assign corerst_b =  pad_yy_scan_mode ? pad_yy_scan_rst_b : core_rst_ff_3rd;

always @(posedge forever_coreclk or negedge corerst_b)
begin
  if (!corerst_b)
    ifurst_b <= 1'b0;
  else 
    ifurst_b <= corerst_b;
end

assign ifu_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : ifurst_b;

always @(posedge forever_coreclk or negedge corerst_b)
begin
  if (!corerst_b)
    idurst_b <= 1'b0;
  else 
    idurst_b <= corerst_b;
end

assign idu_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : idurst_b;

always @(posedge forever_coreclk or negedge corerst_b)
begin
  if (!corerst_b)
    lsurst_b <= 1'b0;
  else 
    lsurst_b <= corerst_b;
end

assign lsu_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : lsurst_b;

always @(posedge forever_coreclk or negedge corerst_b)
begin
  if (!corerst_b)
    fpurst_b <= 1'b0;
  else 
    fpurst_b <= corerst_b;
end

assign fpu_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : fpurst_b;

always @(posedge forever_coreclk or negedge corerst_b)
begin
  if (!corerst_b)
    mmurst_b <= 1'b0;
  else 
    mmurst_b <= corerst_b;
end

assign mmu_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : mmurst_b;

always @(posedge forever_coreclk or negedge corerst_b)
begin
  if (!corerst_b)
    hadrst_b <= 1'b0;
  else 
    hadrst_b <= corerst_b;
end

assign had_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : hadrst_b;

// &ModuleEnd; @110
endmodule


