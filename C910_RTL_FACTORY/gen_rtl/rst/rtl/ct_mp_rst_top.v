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
module ct_mp_rst_top(
  apbrst_b,
  core0_fifo_rst_b,
  core0_rst_b,
  core1_fifo_rst_b,
  core1_rst_b,
  cpurst_b,
  forever_cpuclk,
  forever_jtgclk,
  pad_core0_rst_b,
  pad_core1_rst_b,
  pad_cpu_rst_b,
  pad_had_jtg_trst_b,
  pad_yy_dft_clk_rst_b,
  pad_yy_mbist_mode,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b,
  phl_rst_b,
  trst_b
);

// &Ports; @23
input        forever_cpuclk;      
input        forever_jtgclk;      
input        pad_core0_rst_b;     
input        pad_core1_rst_b;     
input        pad_cpu_rst_b;       
input        pad_had_jtg_trst_b;  
input        pad_yy_dft_clk_rst_b; 
input        pad_yy_mbist_mode;   
input        pad_yy_scan_mode;    
input        pad_yy_scan_rst_b;   
output       apbrst_b;            
output       core0_fifo_rst_b;    
output       core0_rst_b;         
output       core1_fifo_rst_b;    
output       core1_rst_b;         
output       cpurst_b;            
output       phl_rst_b;           
output       trst_b;              

// &Regs; @24
reg          core0_rst_1ff;       
reg          core0_rst_2ff;       
reg          core0_rst_3ff;       
reg          core1_rst_1ff;       
reg          core1_rst_2ff;       
reg          core1_rst_3ff;       
reg          cpurst_1ff;          
reg          cpurst_2ff;          
reg          cpurst_3ff;          
reg          cpurst_jtg_1ff;      
reg          cpurst_jtg_2ff;      
reg          cpurst_jtg_3ff;      
reg          trst_1ff;            
reg          trst_2ff;            
reg          trst_3ff;            

// &Wires; @25
wire         apbrst_b;            
wire         async_core0_rst_b;   
wire         async_core1_rst_b;   
wire         async_cpurst_b;      
wire         async_trst_b;        
wire         core0_fifo_rst_b;    
wire         core0_rst_b;         
wire         core1_fifo_rst_b;    
wire         core1_rst_b;         
wire         cpurst_b;            
wire         forever_cpuclk;      
wire         forever_jtgclk;      
wire         pad_core0_rst_b;     
wire         pad_core1_rst_b;     
wire         pad_cpu_rst_b;       
wire         pad_had_jtg_trst_b;  
wire         pad_yy_dft_clk_rst_b; 
wire         pad_yy_mbist_mode;   
wire         pad_yy_scan_mode;    
wire         pad_yy_scan_rst_b;   
wire         phl_rst_b;           
wire         trst_b;              


//=============================================================================
//cpu reset
//=============================================================================
// &Force("output", "cpurst_b"); @30

assign async_cpurst_b = pad_cpu_rst_b & !pad_yy_mbist_mode;

always @(posedge forever_cpuclk or negedge async_cpurst_b)
begin
  if (!async_cpurst_b)
  begin
    cpurst_1ff <= 1'b0;
    cpurst_2ff <= 1'b0;
    cpurst_3ff <= 1'b0;
  end
  else
  begin
    cpurst_1ff <= 1'b1;
    cpurst_2ff <= cpurst_1ff;
    cpurst_3ff <= cpurst_2ff;
  end
end

assign cpurst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : cpurst_3ff;

//=============================================================================
// Core reset
//=============================================================================
assign async_core0_rst_b = pad_core0_rst_b & !pad_yy_mbist_mode;

always @(posedge forever_cpuclk or negedge async_core0_rst_b)
begin
  if (!async_core0_rst_b)
  begin
    core0_rst_1ff <= 1'b0;
    core0_rst_2ff <= 1'b0;
    core0_rst_3ff <= 1'b0;
  end
  else
  begin
    core0_rst_1ff <= 1'b1;
    core0_rst_2ff <= core0_rst_1ff;
    core0_rst_3ff <= core0_rst_2ff;
  end
end

assign core0_rst_b      = pad_yy_scan_mode ? pad_yy_scan_rst_b : core0_rst_3ff;
assign core0_fifo_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : (core0_rst_3ff & cpurst_3ff);
assign async_core1_rst_b = pad_core1_rst_b & !pad_yy_mbist_mode;

always @(posedge forever_cpuclk or negedge async_core1_rst_b)
begin
  if (!async_core1_rst_b)
  begin
    core1_rst_1ff <= 1'b0;
    core1_rst_2ff <= 1'b0;
    core1_rst_3ff <= 1'b0;
  end
  else
  begin
    core1_rst_1ff <= 1'b1;
    core1_rst_2ff <= core1_rst_1ff;
    core1_rst_3ff <= core1_rst_2ff;
  end
end

assign core1_rst_b      = pad_yy_scan_mode ? pad_yy_scan_rst_b : core1_rst_3ff;
assign core1_fifo_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : (core1_rst_3ff & cpurst_3ff);

//=============================================================================
// APB reset
//=============================================================================

assign apbrst_b = cpurst_b;

//=============================================================================
//reset for clkgen
//=============================================================================
assign phl_rst_b = pad_yy_scan_mode ? pad_yy_dft_clk_rst_b : cpurst_3ff;

//=============================================================================
//jtag reset
//=============================================================================
assign async_trst_b = pad_had_jtg_trst_b & !pad_yy_mbist_mode;

always @(posedge forever_jtgclk or negedge async_trst_b)
begin
  if (!async_trst_b)
  begin
    trst_1ff <= 1'b0;
    trst_2ff <= 1'b0;
    trst_3ff <= 1'b0;
  end
  else
  begin
    trst_1ff <= 1'b1;
    trst_2ff <= trst_1ff;
    trst_3ff <= trst_2ff;
  end
end

always @(posedge forever_jtgclk or negedge async_cpurst_b)
begin
  if (!async_cpurst_b)
  begin
    cpurst_jtg_1ff <= 1'b0;
    cpurst_jtg_2ff <= 1'b0;
    cpurst_jtg_3ff <= 1'b0;
  end
  else
  begin
    cpurst_jtg_1ff <= 1'b1;
    cpurst_jtg_2ff <= cpurst_jtg_1ff;
    cpurst_jtg_3ff <= cpurst_jtg_2ff;
  end
end
assign trst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : trst_3ff & cpurst_jtg_3ff;

// &ModuleEnd; @193
endmodule


