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
module ct_clk_top(
  biu_xx_dbg_wakeup,
  biu_xx_int_wakeup,
  biu_xx_normal_work,
  biu_xx_pmp_sel,
  biu_xx_snoop_vld,
  coreclk,
  cp0_xx_core_icg_en,
  forever_coreclk,
  had_xx_clk_en,
  pll_core_clk
);

// &Ports; @23
input        biu_xx_dbg_wakeup; 
input        biu_xx_int_wakeup; 
input        biu_xx_normal_work; 
input        biu_xx_pmp_sel;    
input        biu_xx_snoop_vld;  
input        cp0_xx_core_icg_en; 
input        had_xx_clk_en;     
input        pll_core_clk;      
output       coreclk;           
output       forever_coreclk;   

// &Regs; @24

// &Wires; @25
wire         biu_xx_dbg_wakeup; 
wire         biu_xx_int_wakeup; 
wire         biu_xx_normal_work; 
wire         biu_xx_pmp_sel;    
wire         biu_xx_snoop_vld;  
wire         core_clk_en;       
wire         cp0_xx_core_icg_en; 
wire         forever_coreclk;   
wire         had_xx_clk_en;     
wire         pll_core_clk;      


// &Force("output", "forever_coreclk"); @27

assign forever_coreclk = pll_core_clk;
//==============================================================================
//      global ICG for core 
//==============================================================================
assign core_clk_en = biu_xx_normal_work |
                     biu_xx_int_wakeup | 
                     biu_xx_dbg_wakeup | 
                     biu_xx_snoop_vld |
                     had_xx_clk_en | 
                     biu_xx_pmp_sel |
                     cp0_xx_core_icg_en ;
// &Force("nonport","core_clk_en"); @41
// &Force("output","coreclk"); @42
BUFGCE core_clk_buf
(.O   (coreclk),
 .I   (forever_coreclk),
 .CE  (core_clk_en)
);
// &Instance("gated_clk_cell", "x_core_gated_clk"); @49
// &Connect(.clk_in      (forever_coreclk     ), @50
//          .external_en (1'b0                ), @51
//          .global_en   (1'b1                ), @52
//          .module_en   (1'b0                ), @53
//          .local_en    (core_clk_en         ), @54
//          .clk_out     (coreclk             )); @55

// &ModuleEnd; @58
endmodule


