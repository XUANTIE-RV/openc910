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
module ct_hpcp_event(
  cp0_hpcp_icg_en,
  cpurst_b,
  eventx_clk_en,
  eventx_value,
  eventx_wen,
  forever_cpuclk,
  hpcp_wdata,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           cp0_hpcp_icg_en;   
input           cpurst_b;          
input           eventx_clk_en;     
input           eventx_wen;        
input           forever_cpuclk;    
input   [63:0]  hpcp_wdata;        
input           pad_yy_icg_scan_en; 
output  [63:0]  eventx_value;      

// &Regs; @24
reg     [5 :0]  value;             

// &Wires @25
wire            cp0_hpcp_icg_en;   
wire            cpurst_b;          
wire            eventx_clk;        
wire            eventx_clk_en;     
wire    [63:0]  eventx_value;      
wire            eventx_wen;        
wire            forever_cpuclk;    
wire    [63:0]  hpcp_wdata;        
wire            pad_yy_icg_scan_en; 
wire            value_mask;        


//define total counter num
parameter HPMCNT_NUM   = 42;
parameter HPMEVT_WIDTH = 6;

// &Force("bus","hpcp_wdata",63,0); @31
//==========================================================
//                 Instance of Gated Cell  
//========================================================== 
// &Instance("gated_clk_cell", "x_gated_clk"); @35
gated_clk_cell  x_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (eventx_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (eventx_clk_en     ),
  .module_en          (cp0_hpcp_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @36
//          .external_en (1'b0), @37
//          .global_en   (1'b1), @38
//          .module_en   (cp0_hpcp_icg_en), @39
//          .local_en    (eventx_clk_en), @40
//          .clk_out     (eventx_clk)); @41

//==========================================================
//                 Implementation of counter  
//==========================================================
always @(posedge eventx_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    value[HPMEVT_WIDTH-1:0] <= {HPMEVT_WIDTH{1'b0}};
  else if(eventx_wen)
    value[HPMEVT_WIDTH-1:0] <= hpcp_wdata[HPMEVT_WIDTH-1:0] & {HPMEVT_WIDTH{value_mask}} ;
  else
    value[HPMEVT_WIDTH-1:0] <= value[HPMEVT_WIDTH-1:0];
end

assign value_mask = (!(|hpcp_wdata[63:HPMEVT_WIDTH])) 
                 && (hpcp_wdata[HPMEVT_WIDTH-1:0] <= HPMCNT_NUM);

//output
assign eventx_value[63:0] = {{64-HPMEVT_WIDTH{1'b0}},value[HPMEVT_WIDTH-1:0]};

// &ModuleEnd; @62
endmodule


