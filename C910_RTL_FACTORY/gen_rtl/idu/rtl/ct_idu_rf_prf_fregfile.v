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

// &ModuleBeg; @25
module ct_idu_rf_prf_fregfile(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  dp_prf_rf_pipe5_srcv0_vreg,
  dp_prf_rf_pipe6_srcv0_vreg,
  dp_prf_rf_pipe6_srcv1_vreg,
  dp_prf_rf_pipe6_srcv2_vreg,
  dp_prf_rf_pipe7_srcv0_vreg,
  dp_prf_rf_pipe7_srcv1_vreg,
  dp_prf_rf_pipe7_srcv2_vreg,
  forever_cpuclk,
  lsu_idu_wb_pipe3_wb_vreg_data,
  lsu_idu_wb_pipe3_wb_vreg_expand,
  lsu_idu_wb_pipe3_wb_vreg_vld,
  pad_yy_icg_scan_en,
  prf_dp_rf_pipe5_srcv0_vreg_data,
  prf_dp_rf_pipe6_srcv0_vreg_data,
  prf_dp_rf_pipe6_srcv1_vreg_data,
  prf_dp_rf_pipe6_srcv2_vreg_data,
  prf_dp_rf_pipe7_srcv0_vreg_data,
  prf_dp_rf_pipe7_srcv1_vreg_data,
  prf_dp_rf_pipe7_srcv2_vreg_data,
  vfpu_idu_ex5_pipe6_wb_vreg_data,
  vfpu_idu_ex5_pipe6_wb_vreg_expand,
  vfpu_idu_ex5_pipe6_wb_vreg_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_data,
  vfpu_idu_ex5_pipe7_wb_vreg_expand,
  vfpu_idu_ex5_pipe7_wb_vreg_vld
);

// &Ports; @26
input           cp0_idu_icg_en;                   
input           cp0_yy_clk_en;                    
input   [5 :0]  dp_prf_rf_pipe5_srcv0_vreg;       
input   [5 :0]  dp_prf_rf_pipe6_srcv0_vreg;       
input   [5 :0]  dp_prf_rf_pipe6_srcv1_vreg;       
input   [5 :0]  dp_prf_rf_pipe6_srcv2_vreg;       
input   [5 :0]  dp_prf_rf_pipe7_srcv0_vreg;       
input   [5 :0]  dp_prf_rf_pipe7_srcv1_vreg;       
input   [5 :0]  dp_prf_rf_pipe7_srcv2_vreg;       
input           forever_cpuclk;                   
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_data;    
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_expand;  
input           lsu_idu_wb_pipe3_wb_vreg_vld;     
input           pad_yy_icg_scan_en;               
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_data;  
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_expand; 
input           vfpu_idu_ex5_pipe6_wb_vreg_vld;   
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_data;  
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_expand; 
input           vfpu_idu_ex5_pipe7_wb_vreg_vld;   
output  [63:0]  prf_dp_rf_pipe5_srcv0_vreg_data;  
output  [63:0]  prf_dp_rf_pipe6_srcv0_vreg_data;  
output  [63:0]  prf_dp_rf_pipe6_srcv1_vreg_data;  
output  [63:0]  prf_dp_rf_pipe6_srcv2_vreg_data;  
output  [63:0]  prf_dp_rf_pipe7_srcv0_vreg_data;  
output  [63:0]  prf_dp_rf_pipe7_srcv1_vreg_data;  
output  [63:0]  prf_dp_rf_pipe7_srcv2_vreg_data;  

// &Regs; @27
reg     [63:0]  prf_dp_rf_pipe5_srcv0_vreg_data;  
reg     [63:0]  prf_dp_rf_pipe6_srcv0_vreg_data;  
reg     [63:0]  prf_dp_rf_pipe6_srcv1_vreg_data;  
reg     [63:0]  prf_dp_rf_pipe6_srcv2_vreg_data;  
reg     [63:0]  prf_dp_rf_pipe7_srcv0_vreg_data;  
reg     [63:0]  prf_dp_rf_pipe7_srcv1_vreg_data;  
reg     [63:0]  prf_dp_rf_pipe7_srcv2_vreg_data;  

// &Wires; @28
wire            cp0_idu_icg_en;                   
wire            cp0_yy_clk_en;                    
wire    [5 :0]  dp_prf_rf_pipe5_srcv0_vreg;       
wire    [5 :0]  dp_prf_rf_pipe6_srcv0_vreg;       
wire    [5 :0]  dp_prf_rf_pipe6_srcv1_vreg;       
wire    [5 :0]  dp_prf_rf_pipe6_srcv2_vreg;       
wire    [5 :0]  dp_prf_rf_pipe7_srcv0_vreg;       
wire    [5 :0]  dp_prf_rf_pipe7_srcv1_vreg;       
wire    [5 :0]  dp_prf_rf_pipe7_srcv2_vreg;       
wire            forever_cpuclk;                   
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_data;    
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_expand;  
wire            lsu_idu_wb_pipe3_wb_vreg_vld;     
wire            pad_yy_icg_scan_en;               
wire    [63:0]  pipe3_wb_vld;                     
wire    [63:0]  pipe6_wb_vld;                     
wire    [63:0]  pipe7_wb_vld;                     
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_data;  
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_expand; 
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld;   
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_data;  
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_expand; 
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld;   
wire    [63:0]  vreg0_reg_dout;                   
wire    [2 :0]  vreg0_wb_vld;                     
wire    [63:0]  vreg10_reg_dout;                  
wire    [2 :0]  vreg10_wb_vld;                    
wire    [63:0]  vreg11_reg_dout;                  
wire    [2 :0]  vreg11_wb_vld;                    
wire    [63:0]  vreg12_reg_dout;                  
wire    [2 :0]  vreg12_wb_vld;                    
wire    [63:0]  vreg13_reg_dout;                  
wire    [2 :0]  vreg13_wb_vld;                    
wire    [63:0]  vreg14_reg_dout;                  
wire    [2 :0]  vreg14_wb_vld;                    
wire    [63:0]  vreg15_reg_dout;                  
wire    [2 :0]  vreg15_wb_vld;                    
wire    [63:0]  vreg16_reg_dout;                  
wire    [2 :0]  vreg16_wb_vld;                    
wire    [63:0]  vreg17_reg_dout;                  
wire    [2 :0]  vreg17_wb_vld;                    
wire    [63:0]  vreg18_reg_dout;                  
wire    [2 :0]  vreg18_wb_vld;                    
wire    [63:0]  vreg19_reg_dout;                  
wire    [2 :0]  vreg19_wb_vld;                    
wire    [63:0]  vreg1_reg_dout;                   
wire    [2 :0]  vreg1_wb_vld;                     
wire    [63:0]  vreg20_reg_dout;                  
wire    [2 :0]  vreg20_wb_vld;                    
wire    [63:0]  vreg21_reg_dout;                  
wire    [2 :0]  vreg21_wb_vld;                    
wire    [63:0]  vreg22_reg_dout;                  
wire    [2 :0]  vreg22_wb_vld;                    
wire    [63:0]  vreg23_reg_dout;                  
wire    [2 :0]  vreg23_wb_vld;                    
wire    [63:0]  vreg24_reg_dout;                  
wire    [2 :0]  vreg24_wb_vld;                    
wire    [63:0]  vreg25_reg_dout;                  
wire    [2 :0]  vreg25_wb_vld;                    
wire    [63:0]  vreg26_reg_dout;                  
wire    [2 :0]  vreg26_wb_vld;                    
wire    [63:0]  vreg27_reg_dout;                  
wire    [2 :0]  vreg27_wb_vld;                    
wire    [63:0]  vreg28_reg_dout;                  
wire    [2 :0]  vreg28_wb_vld;                    
wire    [63:0]  vreg29_reg_dout;                  
wire    [2 :0]  vreg29_wb_vld;                    
wire    [63:0]  vreg2_reg_dout;                   
wire    [2 :0]  vreg2_wb_vld;                     
wire    [63:0]  vreg30_reg_dout;                  
wire    [2 :0]  vreg30_wb_vld;                    
wire    [63:0]  vreg31_reg_dout;                  
wire    [2 :0]  vreg31_wb_vld;                    
wire    [63:0]  vreg32_reg_dout;                  
wire    [2 :0]  vreg32_wb_vld;                    
wire    [63:0]  vreg33_reg_dout;                  
wire    [2 :0]  vreg33_wb_vld;                    
wire    [63:0]  vreg34_reg_dout;                  
wire    [2 :0]  vreg34_wb_vld;                    
wire    [63:0]  vreg35_reg_dout;                  
wire    [2 :0]  vreg35_wb_vld;                    
wire    [63:0]  vreg36_reg_dout;                  
wire    [2 :0]  vreg36_wb_vld;                    
wire    [63:0]  vreg37_reg_dout;                  
wire    [2 :0]  vreg37_wb_vld;                    
wire    [63:0]  vreg38_reg_dout;                  
wire    [2 :0]  vreg38_wb_vld;                    
wire    [63:0]  vreg39_reg_dout;                  
wire    [2 :0]  vreg39_wb_vld;                    
wire    [63:0]  vreg3_reg_dout;                   
wire    [2 :0]  vreg3_wb_vld;                     
wire    [63:0]  vreg40_reg_dout;                  
wire    [2 :0]  vreg40_wb_vld;                    
wire    [63:0]  vreg41_reg_dout;                  
wire    [2 :0]  vreg41_wb_vld;                    
wire    [63:0]  vreg42_reg_dout;                  
wire    [2 :0]  vreg42_wb_vld;                    
wire    [63:0]  vreg43_reg_dout;                  
wire    [2 :0]  vreg43_wb_vld;                    
wire    [63:0]  vreg44_reg_dout;                  
wire    [2 :0]  vreg44_wb_vld;                    
wire    [63:0]  vreg45_reg_dout;                  
wire    [2 :0]  vreg45_wb_vld;                    
wire    [63:0]  vreg46_reg_dout;                  
wire    [2 :0]  vreg46_wb_vld;                    
wire    [63:0]  vreg47_reg_dout;                  
wire    [2 :0]  vreg47_wb_vld;                    
wire    [63:0]  vreg48_reg_dout;                  
wire    [2 :0]  vreg48_wb_vld;                    
wire    [63:0]  vreg49_reg_dout;                  
wire    [2 :0]  vreg49_wb_vld;                    
wire    [63:0]  vreg4_reg_dout;                   
wire    [2 :0]  vreg4_wb_vld;                     
wire    [63:0]  vreg50_reg_dout;                  
wire    [2 :0]  vreg50_wb_vld;                    
wire    [63:0]  vreg51_reg_dout;                  
wire    [2 :0]  vreg51_wb_vld;                    
wire    [63:0]  vreg52_reg_dout;                  
wire    [2 :0]  vreg52_wb_vld;                    
wire    [63:0]  vreg53_reg_dout;                  
wire    [2 :0]  vreg53_wb_vld;                    
wire    [63:0]  vreg54_reg_dout;                  
wire    [2 :0]  vreg54_wb_vld;                    
wire    [63:0]  vreg55_reg_dout;                  
wire    [2 :0]  vreg55_wb_vld;                    
wire    [63:0]  vreg56_reg_dout;                  
wire    [2 :0]  vreg56_wb_vld;                    
wire    [63:0]  vreg57_reg_dout;                  
wire    [2 :0]  vreg57_wb_vld;                    
wire    [63:0]  vreg58_reg_dout;                  
wire    [2 :0]  vreg58_wb_vld;                    
wire    [63:0]  vreg59_reg_dout;                  
wire    [2 :0]  vreg59_wb_vld;                    
wire    [63:0]  vreg5_reg_dout;                   
wire    [2 :0]  vreg5_wb_vld;                     
wire    [63:0]  vreg60_reg_dout;                  
wire    [2 :0]  vreg60_wb_vld;                    
wire    [63:0]  vreg61_reg_dout;                  
wire    [2 :0]  vreg61_wb_vld;                    
wire    [63:0]  vreg62_reg_dout;                  
wire    [2 :0]  vreg62_wb_vld;                    
wire    [63:0]  vreg63_reg_dout;                  
wire    [2 :0]  vreg63_wb_vld;                    
wire    [63:0]  vreg6_reg_dout;                   
wire    [2 :0]  vreg6_wb_vld;                     
wire    [63:0]  vreg7_reg_dout;                   
wire    [2 :0]  vreg7_wb_vld;                     
wire    [63:0]  vreg8_reg_dout;                   
wire    [2 :0]  vreg8_wb_vld;                     
wire    [63:0]  vreg9_reg_dout;                   
wire    [2 :0]  vreg9_wb_vld;                     
wire            vreg_clk_en;                      
wire            vreg_top_clk;                     



//==========================================================
//                 Top Mudule Gated Cell
//==========================================================
assign vreg_clk_en = vfpu_idu_ex5_pipe6_wb_vreg_vld
                     || vfpu_idu_ex5_pipe7_wb_vreg_vld
                     || lsu_idu_wb_pipe3_wb_vreg_vld;
// &Instance("gated_clk_cell", "x_vreg_gated_clk"); @37
gated_clk_cell  x_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vreg_top_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vreg_clk_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @38
//          .external_en (1'b0), @39
//          .global_en   (cp0_yy_clk_en), @40
//          .module_en   (cp0_idu_icg_en), @41
//          .local_en    (vreg_clk_en), @42
//          .clk_out     (vreg_top_clk)); @43

//==========================================================
//             Instance VGPR Physical Registers
//==========================================================
// &ConnRule(s/^x_/vreg0_/); @48
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg0"); @49
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg0 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg0_reg_dout                 ),
  .x_wb_vld                        (vreg0_wb_vld                   )
);

// &ConnRule(s/^x_/vreg1_/); @50
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg1"); @51
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg1 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg1_reg_dout                 ),
  .x_wb_vld                        (vreg1_wb_vld                   )
);

// &ConnRule(s/^x_/vreg2_/); @52
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg2"); @53
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg2 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg2_reg_dout                 ),
  .x_wb_vld                        (vreg2_wb_vld                   )
);

// &ConnRule(s/^x_/vreg3_/); @54
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg3"); @55
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg3 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg3_reg_dout                 ),
  .x_wb_vld                        (vreg3_wb_vld                   )
);

// &ConnRule(s/^x_/vreg4_/); @56
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg4"); @57
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg4 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg4_reg_dout                 ),
  .x_wb_vld                        (vreg4_wb_vld                   )
);

// &ConnRule(s/^x_/vreg5_/); @58
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg5"); @59
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg5 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg5_reg_dout                 ),
  .x_wb_vld                        (vreg5_wb_vld                   )
);

// &ConnRule(s/^x_/vreg6_/); @60
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg6"); @61
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg6 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg6_reg_dout                 ),
  .x_wb_vld                        (vreg6_wb_vld                   )
);

// &ConnRule(s/^x_/vreg7_/); @62
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg7"); @63
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg7 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg7_reg_dout                 ),
  .x_wb_vld                        (vreg7_wb_vld                   )
);

// &ConnRule(s/^x_/vreg8_/); @64
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg8"); @65
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg8 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg8_reg_dout                 ),
  .x_wb_vld                        (vreg8_wb_vld                   )
);

// &ConnRule(s/^x_/vreg9_/); @66
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg9"); @67
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg9 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg9_reg_dout                 ),
  .x_wb_vld                        (vreg9_wb_vld                   )
);

// &ConnRule(s/^x_/vreg10_/); @68
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg10"); @69
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg10 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg10_reg_dout                ),
  .x_wb_vld                        (vreg10_wb_vld                  )
);

// &ConnRule(s/^x_/vreg11_/); @70
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg11"); @71
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg11 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg11_reg_dout                ),
  .x_wb_vld                        (vreg11_wb_vld                  )
);

// &ConnRule(s/^x_/vreg12_/); @72
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg12"); @73
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg12 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg12_reg_dout                ),
  .x_wb_vld                        (vreg12_wb_vld                  )
);

// &ConnRule(s/^x_/vreg13_/); @74
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg13"); @75
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg13 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg13_reg_dout                ),
  .x_wb_vld                        (vreg13_wb_vld                  )
);

// &ConnRule(s/^x_/vreg14_/); @76
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg14"); @77
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg14 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg14_reg_dout                ),
  .x_wb_vld                        (vreg14_wb_vld                  )
);

// &ConnRule(s/^x_/vreg15_/); @78
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg15"); @79
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg15 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg15_reg_dout                ),
  .x_wb_vld                        (vreg15_wb_vld                  )
);

// &ConnRule(s/^x_/vreg16_/); @80
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg16"); @81
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg16 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg16_reg_dout                ),
  .x_wb_vld                        (vreg16_wb_vld                  )
);

// &ConnRule(s/^x_/vreg17_/); @82
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg17"); @83
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg17 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg17_reg_dout                ),
  .x_wb_vld                        (vreg17_wb_vld                  )
);

// &ConnRule(s/^x_/vreg18_/); @84
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg18"); @85
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg18 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg18_reg_dout                ),
  .x_wb_vld                        (vreg18_wb_vld                  )
);

// &ConnRule(s/^x_/vreg19_/); @86
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg19"); @87
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg19 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg19_reg_dout                ),
  .x_wb_vld                        (vreg19_wb_vld                  )
);

// &ConnRule(s/^x_/vreg20_/); @88
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg20"); @89
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg20 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg20_reg_dout                ),
  .x_wb_vld                        (vreg20_wb_vld                  )
);

// &ConnRule(s/^x_/vreg21_/); @90
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg21"); @91
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg21 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg21_reg_dout                ),
  .x_wb_vld                        (vreg21_wb_vld                  )
);

// &ConnRule(s/^x_/vreg22_/); @92
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg22"); @93
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg22 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg22_reg_dout                ),
  .x_wb_vld                        (vreg22_wb_vld                  )
);

// &ConnRule(s/^x_/vreg23_/); @94
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg23"); @95
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg23 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg23_reg_dout                ),
  .x_wb_vld                        (vreg23_wb_vld                  )
);

// &ConnRule(s/^x_/vreg24_/); @96
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg24"); @97
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg24 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg24_reg_dout                ),
  .x_wb_vld                        (vreg24_wb_vld                  )
);

// &ConnRule(s/^x_/vreg25_/); @98
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg25"); @99
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg25 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg25_reg_dout                ),
  .x_wb_vld                        (vreg25_wb_vld                  )
);

// &ConnRule(s/^x_/vreg26_/); @100
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg26"); @101
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg26 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg26_reg_dout                ),
  .x_wb_vld                        (vreg26_wb_vld                  )
);

// &ConnRule(s/^x_/vreg27_/); @102
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg27"); @103
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg27 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg27_reg_dout                ),
  .x_wb_vld                        (vreg27_wb_vld                  )
);

// &ConnRule(s/^x_/vreg28_/); @104
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg28"); @105
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg28 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg28_reg_dout                ),
  .x_wb_vld                        (vreg28_wb_vld                  )
);

// &ConnRule(s/^x_/vreg29_/); @106
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg29"); @107
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg29 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg29_reg_dout                ),
  .x_wb_vld                        (vreg29_wb_vld                  )
);

// &ConnRule(s/^x_/vreg30_/); @108
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg30"); @109
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg30 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg30_reg_dout                ),
  .x_wb_vld                        (vreg30_wb_vld                  )
);

// &ConnRule(s/^x_/vreg31_/); @110
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg31"); @111
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg31 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg31_reg_dout                ),
  .x_wb_vld                        (vreg31_wb_vld                  )
);

// &ConnRule(s/^x_/vreg32_/); @112
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg32"); @113
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg32 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg32_reg_dout                ),
  .x_wb_vld                        (vreg32_wb_vld                  )
);

// &ConnRule(s/^x_/vreg33_/); @114
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg33"); @115
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg33 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg33_reg_dout                ),
  .x_wb_vld                        (vreg33_wb_vld                  )
);

// &ConnRule(s/^x_/vreg34_/); @116
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg34"); @117
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg34 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg34_reg_dout                ),
  .x_wb_vld                        (vreg34_wb_vld                  )
);

// &ConnRule(s/^x_/vreg35_/); @118
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg35"); @119
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg35 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg35_reg_dout                ),
  .x_wb_vld                        (vreg35_wb_vld                  )
);

// &ConnRule(s/^x_/vreg36_/); @120
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg36"); @121
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg36 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg36_reg_dout                ),
  .x_wb_vld                        (vreg36_wb_vld                  )
);

// &ConnRule(s/^x_/vreg37_/); @122
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg37"); @123
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg37 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg37_reg_dout                ),
  .x_wb_vld                        (vreg37_wb_vld                  )
);

// &ConnRule(s/^x_/vreg38_/); @124
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg38"); @125
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg38 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg38_reg_dout                ),
  .x_wb_vld                        (vreg38_wb_vld                  )
);

// &ConnRule(s/^x_/vreg39_/); @126
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg39"); @127
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg39 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg39_reg_dout                ),
  .x_wb_vld                        (vreg39_wb_vld                  )
);

// &ConnRule(s/^x_/vreg40_/); @128
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg40"); @129
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg40 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg40_reg_dout                ),
  .x_wb_vld                        (vreg40_wb_vld                  )
);

// &ConnRule(s/^x_/vreg41_/); @130
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg41"); @131
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg41 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg41_reg_dout                ),
  .x_wb_vld                        (vreg41_wb_vld                  )
);

// &ConnRule(s/^x_/vreg42_/); @132
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg42"); @133
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg42 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg42_reg_dout                ),
  .x_wb_vld                        (vreg42_wb_vld                  )
);

// &ConnRule(s/^x_/vreg43_/); @134
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg43"); @135
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg43 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg43_reg_dout                ),
  .x_wb_vld                        (vreg43_wb_vld                  )
);

// &ConnRule(s/^x_/vreg44_/); @136
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg44"); @137
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg44 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg44_reg_dout                ),
  .x_wb_vld                        (vreg44_wb_vld                  )
);

// &ConnRule(s/^x_/vreg45_/); @138
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg45"); @139
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg45 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg45_reg_dout                ),
  .x_wb_vld                        (vreg45_wb_vld                  )
);

// &ConnRule(s/^x_/vreg46_/); @140
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg46"); @141
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg46 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg46_reg_dout                ),
  .x_wb_vld                        (vreg46_wb_vld                  )
);

// &ConnRule(s/^x_/vreg47_/); @142
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg47"); @143
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg47 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg47_reg_dout                ),
  .x_wb_vld                        (vreg47_wb_vld                  )
);

// &ConnRule(s/^x_/vreg48_/); @144
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg48"); @145
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg48 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg48_reg_dout                ),
  .x_wb_vld                        (vreg48_wb_vld                  )
);

// &ConnRule(s/^x_/vreg49_/); @146
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg49"); @147
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg49 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg49_reg_dout                ),
  .x_wb_vld                        (vreg49_wb_vld                  )
);

// &ConnRule(s/^x_/vreg50_/); @148
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg50"); @149
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg50 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg50_reg_dout                ),
  .x_wb_vld                        (vreg50_wb_vld                  )
);

// &ConnRule(s/^x_/vreg51_/); @150
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg51"); @151
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg51 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg51_reg_dout                ),
  .x_wb_vld                        (vreg51_wb_vld                  )
);

// &ConnRule(s/^x_/vreg52_/); @152
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg52"); @153
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg52 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg52_reg_dout                ),
  .x_wb_vld                        (vreg52_wb_vld                  )
);

// &ConnRule(s/^x_/vreg53_/); @154
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg53"); @155
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg53 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg53_reg_dout                ),
  .x_wb_vld                        (vreg53_wb_vld                  )
);

// &ConnRule(s/^x_/vreg54_/); @156
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg54"); @157
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg54 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg54_reg_dout                ),
  .x_wb_vld                        (vreg54_wb_vld                  )
);

// &ConnRule(s/^x_/vreg55_/); @158
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg55"); @159
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg55 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg55_reg_dout                ),
  .x_wb_vld                        (vreg55_wb_vld                  )
);

// &ConnRule(s/^x_/vreg56_/); @160
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg56"); @161
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg56 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg56_reg_dout                ),
  .x_wb_vld                        (vreg56_wb_vld                  )
);

// &ConnRule(s/^x_/vreg57_/); @162
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg57"); @163
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg57 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg57_reg_dout                ),
  .x_wb_vld                        (vreg57_wb_vld                  )
);

// &ConnRule(s/^x_/vreg58_/); @164
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg58"); @165
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg58 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg58_reg_dout                ),
  .x_wb_vld                        (vreg58_wb_vld                  )
);

// &ConnRule(s/^x_/vreg59_/); @166
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg59"); @167
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg59 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg59_reg_dout                ),
  .x_wb_vld                        (vreg59_wb_vld                  )
);

// &ConnRule(s/^x_/vreg60_/); @168
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg60"); @169
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg60 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg60_reg_dout                ),
  .x_wb_vld                        (vreg60_wb_vld                  )
);

// &ConnRule(s/^x_/vreg61_/); @170
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg61"); @171
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg61 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg61_reg_dout                ),
  .x_wb_vld                        (vreg61_wb_vld                  )
);

// &ConnRule(s/^x_/vreg62_/); @172
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg62"); @173
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg62 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg62_reg_dout                ),
  .x_wb_vld                        (vreg62_wb_vld                  )
);

// &ConnRule(s/^x_/vreg63_/); @174
// &Instance("ct_idu_rf_prf_gated_vreg", "x_ct_idu_rf_prf_vreg63"); @175
ct_idu_rf_prf_gated_vreg  x_ct_idu_rf_prf_vreg63 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .lsu_idu_wb_pipe3_wb_vreg_data   (lsu_idu_wb_pipe3_wb_vreg_data  ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data (vfpu_idu_ex5_pipe6_wb_vreg_data),
  .vfpu_idu_ex5_pipe7_wb_vreg_data (vfpu_idu_ex5_pipe7_wb_vreg_data),
  .vreg_top_clk                    (vreg_top_clk                   ),
  .x_reg_dout                      (vreg63_reg_dout                ),
  .x_wb_vld                        (vreg63_wb_vld                  )
);


//==========================================================
//                       Write Port 
//==========================================================
//3 write ports
assign pipe6_wb_vld[63:0] = {64{vfpu_idu_ex5_pipe6_wb_vreg_vld}}
                            & vfpu_idu_ex5_pipe6_wb_vreg_expand[63:0];
assign pipe7_wb_vld[63:0] = {64{vfpu_idu_ex5_pipe7_wb_vreg_vld}}
                            & vfpu_idu_ex5_pipe7_wb_vreg_expand[63:0];
assign pipe3_wb_vld[63:0] = {64{lsu_idu_wb_pipe3_wb_vreg_vld}}
                            & lsu_idu_wb_pipe3_wb_vreg_expand[63:0];

assign vreg0_wb_vld[2:0]  = {pipe3_wb_vld[0], pipe7_wb_vld[0], pipe6_wb_vld[0]};
assign vreg1_wb_vld[2:0]  = {pipe3_wb_vld[1], pipe7_wb_vld[1], pipe6_wb_vld[1]};
assign vreg2_wb_vld[2:0]  = {pipe3_wb_vld[2], pipe7_wb_vld[2], pipe6_wb_vld[2]};
assign vreg3_wb_vld[2:0]  = {pipe3_wb_vld[3], pipe7_wb_vld[3], pipe6_wb_vld[3]};
assign vreg4_wb_vld[2:0]  = {pipe3_wb_vld[4], pipe7_wb_vld[4], pipe6_wb_vld[4]};
assign vreg5_wb_vld[2:0]  = {pipe3_wb_vld[5], pipe7_wb_vld[5], pipe6_wb_vld[5]};
assign vreg6_wb_vld[2:0]  = {pipe3_wb_vld[6], pipe7_wb_vld[6], pipe6_wb_vld[6]};
assign vreg7_wb_vld[2:0]  = {pipe3_wb_vld[7], pipe7_wb_vld[7], pipe6_wb_vld[7]};
assign vreg8_wb_vld[2:0]  = {pipe3_wb_vld[8], pipe7_wb_vld[8], pipe6_wb_vld[8]};
assign vreg9_wb_vld[2:0]  = {pipe3_wb_vld[9], pipe7_wb_vld[9], pipe6_wb_vld[9]};
assign vreg10_wb_vld[2:0] = {pipe3_wb_vld[10],pipe7_wb_vld[10],pipe6_wb_vld[10]};
assign vreg11_wb_vld[2:0] = {pipe3_wb_vld[11],pipe7_wb_vld[11],pipe6_wb_vld[11]};
assign vreg12_wb_vld[2:0] = {pipe3_wb_vld[12],pipe7_wb_vld[12],pipe6_wb_vld[12]};
assign vreg13_wb_vld[2:0] = {pipe3_wb_vld[13],pipe7_wb_vld[13],pipe6_wb_vld[13]};
assign vreg14_wb_vld[2:0] = {pipe3_wb_vld[14],pipe7_wb_vld[14],pipe6_wb_vld[14]};
assign vreg15_wb_vld[2:0] = {pipe3_wb_vld[15],pipe7_wb_vld[15],pipe6_wb_vld[15]};
assign vreg16_wb_vld[2:0] = {pipe3_wb_vld[16],pipe7_wb_vld[16],pipe6_wb_vld[16]};
assign vreg17_wb_vld[2:0] = {pipe3_wb_vld[17],pipe7_wb_vld[17],pipe6_wb_vld[17]};
assign vreg18_wb_vld[2:0] = {pipe3_wb_vld[18],pipe7_wb_vld[18],pipe6_wb_vld[18]};
assign vreg19_wb_vld[2:0] = {pipe3_wb_vld[19],pipe7_wb_vld[19],pipe6_wb_vld[19]};
assign vreg20_wb_vld[2:0] = {pipe3_wb_vld[20],pipe7_wb_vld[20],pipe6_wb_vld[20]};
assign vreg21_wb_vld[2:0] = {pipe3_wb_vld[21],pipe7_wb_vld[21],pipe6_wb_vld[21]};
assign vreg22_wb_vld[2:0] = {pipe3_wb_vld[22],pipe7_wb_vld[22],pipe6_wb_vld[22]};
assign vreg23_wb_vld[2:0] = {pipe3_wb_vld[23],pipe7_wb_vld[23],pipe6_wb_vld[23]};
assign vreg24_wb_vld[2:0] = {pipe3_wb_vld[24],pipe7_wb_vld[24],pipe6_wb_vld[24]};
assign vreg25_wb_vld[2:0] = {pipe3_wb_vld[25],pipe7_wb_vld[25],pipe6_wb_vld[25]};
assign vreg26_wb_vld[2:0] = {pipe3_wb_vld[26],pipe7_wb_vld[26],pipe6_wb_vld[26]};
assign vreg27_wb_vld[2:0] = {pipe3_wb_vld[27],pipe7_wb_vld[27],pipe6_wb_vld[27]};
assign vreg28_wb_vld[2:0] = {pipe3_wb_vld[28],pipe7_wb_vld[28],pipe6_wb_vld[28]};
assign vreg29_wb_vld[2:0] = {pipe3_wb_vld[29],pipe7_wb_vld[29],pipe6_wb_vld[29]};
assign vreg30_wb_vld[2:0] = {pipe3_wb_vld[30],pipe7_wb_vld[30],pipe6_wb_vld[30]};
assign vreg31_wb_vld[2:0] = {pipe3_wb_vld[31],pipe7_wb_vld[31],pipe6_wb_vld[31]};
assign vreg32_wb_vld[2:0] = {pipe3_wb_vld[32],pipe7_wb_vld[32],pipe6_wb_vld[32]};
assign vreg33_wb_vld[2:0] = {pipe3_wb_vld[33],pipe7_wb_vld[33],pipe6_wb_vld[33]};
assign vreg34_wb_vld[2:0] = {pipe3_wb_vld[34],pipe7_wb_vld[34],pipe6_wb_vld[34]};
assign vreg35_wb_vld[2:0] = {pipe3_wb_vld[35],pipe7_wb_vld[35],pipe6_wb_vld[35]};
assign vreg36_wb_vld[2:0] = {pipe3_wb_vld[36],pipe7_wb_vld[36],pipe6_wb_vld[36]};
assign vreg37_wb_vld[2:0] = {pipe3_wb_vld[37],pipe7_wb_vld[37],pipe6_wb_vld[37]};
assign vreg38_wb_vld[2:0] = {pipe3_wb_vld[38],pipe7_wb_vld[38],pipe6_wb_vld[38]};
assign vreg39_wb_vld[2:0] = {pipe3_wb_vld[39],pipe7_wb_vld[39],pipe6_wb_vld[39]};
assign vreg40_wb_vld[2:0] = {pipe3_wb_vld[40],pipe7_wb_vld[40],pipe6_wb_vld[40]};
assign vreg41_wb_vld[2:0] = {pipe3_wb_vld[41],pipe7_wb_vld[41],pipe6_wb_vld[41]};
assign vreg42_wb_vld[2:0] = {pipe3_wb_vld[42],pipe7_wb_vld[42],pipe6_wb_vld[42]};
assign vreg43_wb_vld[2:0] = {pipe3_wb_vld[43],pipe7_wb_vld[43],pipe6_wb_vld[43]};
assign vreg44_wb_vld[2:0] = {pipe3_wb_vld[44],pipe7_wb_vld[44],pipe6_wb_vld[44]};
assign vreg45_wb_vld[2:0] = {pipe3_wb_vld[45],pipe7_wb_vld[45],pipe6_wb_vld[45]};
assign vreg46_wb_vld[2:0] = {pipe3_wb_vld[46],pipe7_wb_vld[46],pipe6_wb_vld[46]};
assign vreg47_wb_vld[2:0] = {pipe3_wb_vld[47],pipe7_wb_vld[47],pipe6_wb_vld[47]};
assign vreg48_wb_vld[2:0] = {pipe3_wb_vld[48],pipe7_wb_vld[48],pipe6_wb_vld[48]};
assign vreg49_wb_vld[2:0] = {pipe3_wb_vld[49],pipe7_wb_vld[49],pipe6_wb_vld[49]};
assign vreg50_wb_vld[2:0] = {pipe3_wb_vld[50],pipe7_wb_vld[50],pipe6_wb_vld[50]};
assign vreg51_wb_vld[2:0] = {pipe3_wb_vld[51],pipe7_wb_vld[51],pipe6_wb_vld[51]};
assign vreg52_wb_vld[2:0] = {pipe3_wb_vld[52],pipe7_wb_vld[52],pipe6_wb_vld[52]};
assign vreg53_wb_vld[2:0] = {pipe3_wb_vld[53],pipe7_wb_vld[53],pipe6_wb_vld[53]};
assign vreg54_wb_vld[2:0] = {pipe3_wb_vld[54],pipe7_wb_vld[54],pipe6_wb_vld[54]};
assign vreg55_wb_vld[2:0] = {pipe3_wb_vld[55],pipe7_wb_vld[55],pipe6_wb_vld[55]};
assign vreg56_wb_vld[2:0] = {pipe3_wb_vld[56],pipe7_wb_vld[56],pipe6_wb_vld[56]};
assign vreg57_wb_vld[2:0] = {pipe3_wb_vld[57],pipe7_wb_vld[57],pipe6_wb_vld[57]};
assign vreg58_wb_vld[2:0] = {pipe3_wb_vld[58],pipe7_wb_vld[58],pipe6_wb_vld[58]};
assign vreg59_wb_vld[2:0] = {pipe3_wb_vld[59],pipe7_wb_vld[59],pipe6_wb_vld[59]};
assign vreg60_wb_vld[2:0] = {pipe3_wb_vld[60],pipe7_wb_vld[60],pipe6_wb_vld[60]};
assign vreg61_wb_vld[2:0] = {pipe3_wb_vld[61],pipe7_wb_vld[61],pipe6_wb_vld[61]};
assign vreg62_wb_vld[2:0] = {pipe3_wb_vld[62],pipe7_wb_vld[62],pipe6_wb_vld[62]};
assign vreg63_wb_vld[2:0] = {pipe3_wb_vld[63],pipe7_wb_vld[63],pipe6_wb_vld[63]};

//==========================================================
//                       Read Port 
//==========================================================
//----------------------------------------------------------
//                 Read Port: pipe6 srcv0
//----------------------------------------------------------
// &CombBeg; @259
always @( vreg11_reg_dout[63:0]
       or vreg33_reg_dout[63:0]
       or vreg15_reg_dout[63:0]
       or vreg10_reg_dout[63:0]
       or vreg8_reg_dout[63:0]
       or vreg40_reg_dout[63:0]
       or vreg5_reg_dout[63:0]
       or vreg39_reg_dout[63:0]
       or vreg56_reg_dout[63:0]
       or vreg14_reg_dout[63:0]
       or vreg12_reg_dout[63:0]
       or vreg17_reg_dout[63:0]
       or vreg9_reg_dout[63:0]
       or vreg22_reg_dout[63:0]
       or vreg48_reg_dout[63:0]
       or vreg28_reg_dout[63:0]
       or vreg26_reg_dout[63:0]
       or vreg54_reg_dout[63:0]
       or dp_prf_rf_pipe6_srcv0_vreg[5:0]
       or vreg50_reg_dout[63:0]
       or vreg60_reg_dout[63:0]
       or vreg29_reg_dout[63:0]
       or vreg32_reg_dout[63:0]
       or vreg45_reg_dout[63:0]
       or vreg38_reg_dout[63:0]
       or vreg18_reg_dout[63:0]
       or vreg16_reg_dout[63:0]
       or vreg2_reg_dout[63:0]
       or vreg3_reg_dout[63:0]
       or vreg4_reg_dout[63:0]
       or vreg44_reg_dout[63:0]
       or vreg6_reg_dout[63:0]
       or vreg61_reg_dout[63:0]
       or vreg35_reg_dout[63:0]
       or vreg37_reg_dout[63:0]
       or vreg1_reg_dout[63:0]
       or vreg31_reg_dout[63:0]
       or vreg49_reg_dout[63:0]
       or vreg36_reg_dout[63:0]
       or vreg63_reg_dout[63:0]
       or vreg20_reg_dout[63:0]
       or vreg55_reg_dout[63:0]
       or vreg62_reg_dout[63:0]
       or vreg41_reg_dout[63:0]
       or vreg53_reg_dout[63:0]
       or vreg23_reg_dout[63:0]
       or vreg30_reg_dout[63:0]
       or vreg57_reg_dout[63:0]
       or vreg43_reg_dout[63:0]
       or vreg19_reg_dout[63:0]
       or vreg24_reg_dout[63:0]
       or vreg25_reg_dout[63:0]
       or vreg47_reg_dout[63:0]
       or vreg34_reg_dout[63:0]
       or vreg21_reg_dout[63:0]
       or vreg13_reg_dout[63:0]
       or vreg58_reg_dout[63:0]
       or vreg7_reg_dout[63:0]
       or vreg27_reg_dout[63:0]
       or vreg59_reg_dout[63:0]
       or vreg51_reg_dout[63:0]
       or vreg0_reg_dout[63:0]
       or vreg46_reg_dout[63:0]
       or vreg42_reg_dout[63:0]
       or vreg52_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe6_srcv0_vreg[5:0])
    6'd0   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg0_reg_dout[63:0];
    6'd1   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg1_reg_dout[63:0];
    6'd2   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg2_reg_dout[63:0];
    6'd3   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg3_reg_dout[63:0];
    6'd4   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg4_reg_dout[63:0];
    6'd5   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg5_reg_dout[63:0];
    6'd6   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg6_reg_dout[63:0];
    6'd7   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg7_reg_dout[63:0];
    6'd8   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg8_reg_dout[63:0];
    6'd9   : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg9_reg_dout[63:0];
    6'd10  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg10_reg_dout[63:0];
    6'd11  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg11_reg_dout[63:0];
    6'd12  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg12_reg_dout[63:0];
    6'd13  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg13_reg_dout[63:0];
    6'd14  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg14_reg_dout[63:0];
    6'd15  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg15_reg_dout[63:0];
    6'd16  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg16_reg_dout[63:0];
    6'd17  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg17_reg_dout[63:0];
    6'd18  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg18_reg_dout[63:0];
    6'd19  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg19_reg_dout[63:0];
    6'd20  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg20_reg_dout[63:0];
    6'd21  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg21_reg_dout[63:0];
    6'd22  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg22_reg_dout[63:0];
    6'd23  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg23_reg_dout[63:0];
    6'd24  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg24_reg_dout[63:0];
    6'd25  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg25_reg_dout[63:0];
    6'd26  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg26_reg_dout[63:0];
    6'd27  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg27_reg_dout[63:0];
    6'd28  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg28_reg_dout[63:0];
    6'd29  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg29_reg_dout[63:0];
    6'd30  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg30_reg_dout[63:0];
    6'd31  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg31_reg_dout[63:0];
    6'd32  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg32_reg_dout[63:0];
    6'd33  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg33_reg_dout[63:0];
    6'd34  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg34_reg_dout[63:0];
    6'd35  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg35_reg_dout[63:0];
    6'd36  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg36_reg_dout[63:0];
    6'd37  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg37_reg_dout[63:0];
    6'd38  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg38_reg_dout[63:0];
    6'd39  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg39_reg_dout[63:0];
    6'd40  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg40_reg_dout[63:0];
    6'd41  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg41_reg_dout[63:0];
    6'd42  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg42_reg_dout[63:0];
    6'd43  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg43_reg_dout[63:0];
    6'd44  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg44_reg_dout[63:0];
    6'd45  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg45_reg_dout[63:0];
    6'd46  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg46_reg_dout[63:0];
    6'd47  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg47_reg_dout[63:0];
    6'd48  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg48_reg_dout[63:0];
    6'd49  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg49_reg_dout[63:0];
    6'd50  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg50_reg_dout[63:0];
    6'd51  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg51_reg_dout[63:0];
    6'd52  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg52_reg_dout[63:0];
    6'd53  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg53_reg_dout[63:0];
    6'd54  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg54_reg_dout[63:0];
    6'd55  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg55_reg_dout[63:0];
    6'd56  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg56_reg_dout[63:0];
    6'd57  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg57_reg_dout[63:0];
    6'd58  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg58_reg_dout[63:0];
    6'd59  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg59_reg_dout[63:0];
    6'd60  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg60_reg_dout[63:0];
    6'd61  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg61_reg_dout[63:0];
    6'd62  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg62_reg_dout[63:0];
    6'd63  : prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = vreg63_reg_dout[63:0];
    default: prf_dp_rf_pipe6_srcv0_vreg_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @327
end

//----------------------------------------------------------
//                 Read Port: pipe6 srcv1
//----------------------------------------------------------
// &CombBeg; @332
always @( vreg11_reg_dout[63:0]
       or vreg33_reg_dout[63:0]
       or vreg15_reg_dout[63:0]
       or vreg10_reg_dout[63:0]
       or vreg8_reg_dout[63:0]
       or vreg40_reg_dout[63:0]
       or vreg5_reg_dout[63:0]
       or vreg39_reg_dout[63:0]
       or vreg56_reg_dout[63:0]
       or vreg12_reg_dout[63:0]
       or vreg14_reg_dout[63:0]
       or vreg17_reg_dout[63:0]
       or vreg9_reg_dout[63:0]
       or vreg48_reg_dout[63:0]
       or vreg22_reg_dout[63:0]
       or vreg28_reg_dout[63:0]
       or vreg26_reg_dout[63:0]
       or vreg54_reg_dout[63:0]
       or vreg50_reg_dout[63:0]
       or vreg60_reg_dout[63:0]
       or vreg32_reg_dout[63:0]
       or vreg29_reg_dout[63:0]
       or vreg45_reg_dout[63:0]
       or vreg38_reg_dout[63:0]
       or dp_prf_rf_pipe6_srcv1_vreg[5:0]
       or vreg18_reg_dout[63:0]
       or vreg16_reg_dout[63:0]
       or vreg2_reg_dout[63:0]
       or vreg3_reg_dout[63:0]
       or vreg4_reg_dout[63:0]
       or vreg44_reg_dout[63:0]
       or vreg6_reg_dout[63:0]
       or vreg35_reg_dout[63:0]
       or vreg61_reg_dout[63:0]
       or vreg37_reg_dout[63:0]
       or vreg1_reg_dout[63:0]
       or vreg31_reg_dout[63:0]
       or vreg36_reg_dout[63:0]
       or vreg49_reg_dout[63:0]
       or vreg63_reg_dout[63:0]
       or vreg20_reg_dout[63:0]
       or vreg55_reg_dout[63:0]
       or vreg41_reg_dout[63:0]
       or vreg62_reg_dout[63:0]
       or vreg30_reg_dout[63:0]
       or vreg23_reg_dout[63:0]
       or vreg53_reg_dout[63:0]
       or vreg43_reg_dout[63:0]
       or vreg57_reg_dout[63:0]
       or vreg19_reg_dout[63:0]
       or vreg25_reg_dout[63:0]
       or vreg24_reg_dout[63:0]
       or vreg21_reg_dout[63:0]
       or vreg34_reg_dout[63:0]
       or vreg47_reg_dout[63:0]
       or vreg13_reg_dout[63:0]
       or vreg7_reg_dout[63:0]
       or vreg58_reg_dout[63:0]
       or vreg27_reg_dout[63:0]
       or vreg51_reg_dout[63:0]
       or vreg59_reg_dout[63:0]
       or vreg0_reg_dout[63:0]
       or vreg46_reg_dout[63:0]
       or vreg42_reg_dout[63:0]
       or vreg52_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe6_srcv1_vreg[5:0])
    6'd0   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg0_reg_dout[63:0];
    6'd1   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg1_reg_dout[63:0];
    6'd2   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg2_reg_dout[63:0];
    6'd3   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg3_reg_dout[63:0];
    6'd4   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg4_reg_dout[63:0];
    6'd5   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg5_reg_dout[63:0];
    6'd6   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg6_reg_dout[63:0];
    6'd7   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg7_reg_dout[63:0];
    6'd8   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg8_reg_dout[63:0];
    6'd9   : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg9_reg_dout[63:0];
    6'd10  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg10_reg_dout[63:0];
    6'd11  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg11_reg_dout[63:0];
    6'd12  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg12_reg_dout[63:0];
    6'd13  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg13_reg_dout[63:0];
    6'd14  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg14_reg_dout[63:0];
    6'd15  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg15_reg_dout[63:0];
    6'd16  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg16_reg_dout[63:0];
    6'd17  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg17_reg_dout[63:0];
    6'd18  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg18_reg_dout[63:0];
    6'd19  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg19_reg_dout[63:0];
    6'd20  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg20_reg_dout[63:0];
    6'd21  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg21_reg_dout[63:0];
    6'd22  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg22_reg_dout[63:0];
    6'd23  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg23_reg_dout[63:0];
    6'd24  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg24_reg_dout[63:0];
    6'd25  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg25_reg_dout[63:0];
    6'd26  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg26_reg_dout[63:0];
    6'd27  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg27_reg_dout[63:0];
    6'd28  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg28_reg_dout[63:0];
    6'd29  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg29_reg_dout[63:0];
    6'd30  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg30_reg_dout[63:0];
    6'd31  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg31_reg_dout[63:0];
    6'd32  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg32_reg_dout[63:0];
    6'd33  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg33_reg_dout[63:0];
    6'd34  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg34_reg_dout[63:0];
    6'd35  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg35_reg_dout[63:0];
    6'd36  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg36_reg_dout[63:0];
    6'd37  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg37_reg_dout[63:0];
    6'd38  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg38_reg_dout[63:0];
    6'd39  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg39_reg_dout[63:0];
    6'd40  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg40_reg_dout[63:0];
    6'd41  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg41_reg_dout[63:0];
    6'd42  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg42_reg_dout[63:0];
    6'd43  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg43_reg_dout[63:0];
    6'd44  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg44_reg_dout[63:0];
    6'd45  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg45_reg_dout[63:0];
    6'd46  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg46_reg_dout[63:0];
    6'd47  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg47_reg_dout[63:0];
    6'd48  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg48_reg_dout[63:0];
    6'd49  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg49_reg_dout[63:0];
    6'd50  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg50_reg_dout[63:0];
    6'd51  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg51_reg_dout[63:0];
    6'd52  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg52_reg_dout[63:0];
    6'd53  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg53_reg_dout[63:0];
    6'd54  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg54_reg_dout[63:0];
    6'd55  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg55_reg_dout[63:0];
    6'd56  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg56_reg_dout[63:0];
    6'd57  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg57_reg_dout[63:0];
    6'd58  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg58_reg_dout[63:0];
    6'd59  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg59_reg_dout[63:0];
    6'd60  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg60_reg_dout[63:0];
    6'd61  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg61_reg_dout[63:0];
    6'd62  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg62_reg_dout[63:0];
    6'd63  : prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = vreg63_reg_dout[63:0];
    default: prf_dp_rf_pipe6_srcv1_vreg_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @400
end

//----------------------------------------------------------
//                 Read Port: pipe6 srcv2
//----------------------------------------------------------
// &CombBeg; @405
always @( vreg11_reg_dout[63:0]
       or vreg33_reg_dout[63:0]
       or vreg15_reg_dout[63:0]
       or vreg10_reg_dout[63:0]
       or vreg8_reg_dout[63:0]
       or vreg40_reg_dout[63:0]
       or vreg5_reg_dout[63:0]
       or vreg39_reg_dout[63:0]
       or vreg56_reg_dout[63:0]
       or vreg12_reg_dout[63:0]
       or vreg14_reg_dout[63:0]
       or vreg17_reg_dout[63:0]
       or vreg9_reg_dout[63:0]
       or vreg48_reg_dout[63:0]
       or vreg22_reg_dout[63:0]
       or vreg28_reg_dout[63:0]
       or vreg26_reg_dout[63:0]
       or vreg54_reg_dout[63:0]
       or vreg50_reg_dout[63:0]
       or vreg60_reg_dout[63:0]
       or vreg32_reg_dout[63:0]
       or vreg29_reg_dout[63:0]
       or vreg45_reg_dout[63:0]
       or vreg38_reg_dout[63:0]
       or vreg18_reg_dout[63:0]
       or vreg16_reg_dout[63:0]
       or vreg2_reg_dout[63:0]
       or vreg3_reg_dout[63:0]
       or vreg4_reg_dout[63:0]
       or vreg44_reg_dout[63:0]
       or vreg6_reg_dout[63:0]
       or vreg35_reg_dout[63:0]
       or vreg61_reg_dout[63:0]
       or vreg37_reg_dout[63:0]
       or vreg1_reg_dout[63:0]
       or dp_prf_rf_pipe6_srcv2_vreg[5:0]
       or vreg31_reg_dout[63:0]
       or vreg36_reg_dout[63:0]
       or vreg49_reg_dout[63:0]
       or vreg63_reg_dout[63:0]
       or vreg20_reg_dout[63:0]
       or vreg55_reg_dout[63:0]
       or vreg41_reg_dout[63:0]
       or vreg62_reg_dout[63:0]
       or vreg30_reg_dout[63:0]
       or vreg23_reg_dout[63:0]
       or vreg53_reg_dout[63:0]
       or vreg43_reg_dout[63:0]
       or vreg57_reg_dout[63:0]
       or vreg19_reg_dout[63:0]
       or vreg25_reg_dout[63:0]
       or vreg24_reg_dout[63:0]
       or vreg21_reg_dout[63:0]
       or vreg34_reg_dout[63:0]
       or vreg47_reg_dout[63:0]
       or vreg13_reg_dout[63:0]
       or vreg7_reg_dout[63:0]
       or vreg58_reg_dout[63:0]
       or vreg27_reg_dout[63:0]
       or vreg51_reg_dout[63:0]
       or vreg59_reg_dout[63:0]
       or vreg0_reg_dout[63:0]
       or vreg46_reg_dout[63:0]
       or vreg42_reg_dout[63:0]
       or vreg52_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe6_srcv2_vreg[5:0])
    6'd0   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg0_reg_dout[63:0];
    6'd1   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg1_reg_dout[63:0];
    6'd2   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg2_reg_dout[63:0];
    6'd3   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg3_reg_dout[63:0];
    6'd4   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg4_reg_dout[63:0];
    6'd5   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg5_reg_dout[63:0];
    6'd6   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg6_reg_dout[63:0];
    6'd7   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg7_reg_dout[63:0];
    6'd8   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg8_reg_dout[63:0];
    6'd9   : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg9_reg_dout[63:0];
    6'd10  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg10_reg_dout[63:0];
    6'd11  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg11_reg_dout[63:0];
    6'd12  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg12_reg_dout[63:0];
    6'd13  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg13_reg_dout[63:0];
    6'd14  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg14_reg_dout[63:0];
    6'd15  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg15_reg_dout[63:0];
    6'd16  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg16_reg_dout[63:0];
    6'd17  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg17_reg_dout[63:0];
    6'd18  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg18_reg_dout[63:0];
    6'd19  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg19_reg_dout[63:0];
    6'd20  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg20_reg_dout[63:0];
    6'd21  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg21_reg_dout[63:0];
    6'd22  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg22_reg_dout[63:0];
    6'd23  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg23_reg_dout[63:0];
    6'd24  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg24_reg_dout[63:0];
    6'd25  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg25_reg_dout[63:0];
    6'd26  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg26_reg_dout[63:0];
    6'd27  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg27_reg_dout[63:0];
    6'd28  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg28_reg_dout[63:0];
    6'd29  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg29_reg_dout[63:0];
    6'd30  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg30_reg_dout[63:0];
    6'd31  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg31_reg_dout[63:0];
    6'd32  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg32_reg_dout[63:0];
    6'd33  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg33_reg_dout[63:0];
    6'd34  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg34_reg_dout[63:0];
    6'd35  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg35_reg_dout[63:0];
    6'd36  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg36_reg_dout[63:0];
    6'd37  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg37_reg_dout[63:0];
    6'd38  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg38_reg_dout[63:0];
    6'd39  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg39_reg_dout[63:0];
    6'd40  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg40_reg_dout[63:0];
    6'd41  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg41_reg_dout[63:0];
    6'd42  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg42_reg_dout[63:0];
    6'd43  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg43_reg_dout[63:0];
    6'd44  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg44_reg_dout[63:0];
    6'd45  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg45_reg_dout[63:0];
    6'd46  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg46_reg_dout[63:0];
    6'd47  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg47_reg_dout[63:0];
    6'd48  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg48_reg_dout[63:0];
    6'd49  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg49_reg_dout[63:0];
    6'd50  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg50_reg_dout[63:0];
    6'd51  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg51_reg_dout[63:0];
    6'd52  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg52_reg_dout[63:0];
    6'd53  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg53_reg_dout[63:0];
    6'd54  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg54_reg_dout[63:0];
    6'd55  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg55_reg_dout[63:0];
    6'd56  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg56_reg_dout[63:0];
    6'd57  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg57_reg_dout[63:0];
    6'd58  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg58_reg_dout[63:0];
    6'd59  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg59_reg_dout[63:0];
    6'd60  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg60_reg_dout[63:0];
    6'd61  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg61_reg_dout[63:0];
    6'd62  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg62_reg_dout[63:0];
    6'd63  : prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = vreg63_reg_dout[63:0];
    default: prf_dp_rf_pipe6_srcv2_vreg_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @473
end

//----------------------------------------------------------
//                 Read Port: pipe7 srcv0
//----------------------------------------------------------
// &CombBeg; @478
always @( vreg11_reg_dout[63:0]
       or vreg33_reg_dout[63:0]
       or vreg15_reg_dout[63:0]
       or vreg10_reg_dout[63:0]
       or vreg8_reg_dout[63:0]
       or vreg40_reg_dout[63:0]
       or vreg5_reg_dout[63:0]
       or vreg39_reg_dout[63:0]
       or vreg56_reg_dout[63:0]
       or vreg12_reg_dout[63:0]
       or vreg14_reg_dout[63:0]
       or vreg17_reg_dout[63:0]
       or vreg9_reg_dout[63:0]
       or vreg48_reg_dout[63:0]
       or vreg22_reg_dout[63:0]
       or vreg28_reg_dout[63:0]
       or vreg26_reg_dout[63:0]
       or vreg54_reg_dout[63:0]
       or vreg50_reg_dout[63:0]
       or vreg60_reg_dout[63:0]
       or vreg32_reg_dout[63:0]
       or vreg29_reg_dout[63:0]
       or vreg45_reg_dout[63:0]
       or vreg38_reg_dout[63:0]
       or vreg18_reg_dout[63:0]
       or vreg16_reg_dout[63:0]
       or vreg2_reg_dout[63:0]
       or vreg3_reg_dout[63:0]
       or vreg4_reg_dout[63:0]
       or vreg44_reg_dout[63:0]
       or vreg6_reg_dout[63:0]
       or vreg35_reg_dout[63:0]
       or vreg61_reg_dout[63:0]
       or dp_prf_rf_pipe7_srcv0_vreg[5:0]
       or vreg37_reg_dout[63:0]
       or vreg1_reg_dout[63:0]
       or vreg31_reg_dout[63:0]
       or vreg36_reg_dout[63:0]
       or vreg49_reg_dout[63:0]
       or vreg63_reg_dout[63:0]
       or vreg20_reg_dout[63:0]
       or vreg55_reg_dout[63:0]
       or vreg41_reg_dout[63:0]
       or vreg62_reg_dout[63:0]
       or vreg30_reg_dout[63:0]
       or vreg23_reg_dout[63:0]
       or vreg53_reg_dout[63:0]
       or vreg43_reg_dout[63:0]
       or vreg57_reg_dout[63:0]
       or vreg19_reg_dout[63:0]
       or vreg25_reg_dout[63:0]
       or vreg24_reg_dout[63:0]
       or vreg21_reg_dout[63:0]
       or vreg34_reg_dout[63:0]
       or vreg47_reg_dout[63:0]
       or vreg13_reg_dout[63:0]
       or vreg7_reg_dout[63:0]
       or vreg58_reg_dout[63:0]
       or vreg27_reg_dout[63:0]
       or vreg51_reg_dout[63:0]
       or vreg59_reg_dout[63:0]
       or vreg0_reg_dout[63:0]
       or vreg46_reg_dout[63:0]
       or vreg42_reg_dout[63:0]
       or vreg52_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe7_srcv0_vreg[5:0])
    6'd0   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg0_reg_dout[63:0];
    6'd1   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg1_reg_dout[63:0];
    6'd2   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg2_reg_dout[63:0];
    6'd3   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg3_reg_dout[63:0];
    6'd4   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg4_reg_dout[63:0];
    6'd5   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg5_reg_dout[63:0];
    6'd6   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg6_reg_dout[63:0];
    6'd7   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg7_reg_dout[63:0];
    6'd8   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg8_reg_dout[63:0];
    6'd9   : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg9_reg_dout[63:0];
    6'd10  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg10_reg_dout[63:0];
    6'd11  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg11_reg_dout[63:0];
    6'd12  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg12_reg_dout[63:0];
    6'd13  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg13_reg_dout[63:0];
    6'd14  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg14_reg_dout[63:0];
    6'd15  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg15_reg_dout[63:0];
    6'd16  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg16_reg_dout[63:0];
    6'd17  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg17_reg_dout[63:0];
    6'd18  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg18_reg_dout[63:0];
    6'd19  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg19_reg_dout[63:0];
    6'd20  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg20_reg_dout[63:0];
    6'd21  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg21_reg_dout[63:0];
    6'd22  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg22_reg_dout[63:0];
    6'd23  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg23_reg_dout[63:0];
    6'd24  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg24_reg_dout[63:0];
    6'd25  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg25_reg_dout[63:0];
    6'd26  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg26_reg_dout[63:0];
    6'd27  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg27_reg_dout[63:0];
    6'd28  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg28_reg_dout[63:0];
    6'd29  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg29_reg_dout[63:0];
    6'd30  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg30_reg_dout[63:0];
    6'd31  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg31_reg_dout[63:0];
    6'd32  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg32_reg_dout[63:0];
    6'd33  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg33_reg_dout[63:0];
    6'd34  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg34_reg_dout[63:0];
    6'd35  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg35_reg_dout[63:0];
    6'd36  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg36_reg_dout[63:0];
    6'd37  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg37_reg_dout[63:0];
    6'd38  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg38_reg_dout[63:0];
    6'd39  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg39_reg_dout[63:0];
    6'd40  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg40_reg_dout[63:0];
    6'd41  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg41_reg_dout[63:0];
    6'd42  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg42_reg_dout[63:0];
    6'd43  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg43_reg_dout[63:0];
    6'd44  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg44_reg_dout[63:0];
    6'd45  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg45_reg_dout[63:0];
    6'd46  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg46_reg_dout[63:0];
    6'd47  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg47_reg_dout[63:0];
    6'd48  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg48_reg_dout[63:0];
    6'd49  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg49_reg_dout[63:0];
    6'd50  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg50_reg_dout[63:0];
    6'd51  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg51_reg_dout[63:0];
    6'd52  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg52_reg_dout[63:0];
    6'd53  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg53_reg_dout[63:0];
    6'd54  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg54_reg_dout[63:0];
    6'd55  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg55_reg_dout[63:0];
    6'd56  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg56_reg_dout[63:0];
    6'd57  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg57_reg_dout[63:0];
    6'd58  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg58_reg_dout[63:0];
    6'd59  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg59_reg_dout[63:0];
    6'd60  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg60_reg_dout[63:0];
    6'd61  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg61_reg_dout[63:0];
    6'd62  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg62_reg_dout[63:0];
    6'd63  : prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = vreg63_reg_dout[63:0];
    default: prf_dp_rf_pipe7_srcv0_vreg_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @546
end

//----------------------------------------------------------
//                 Read Port: pipe7 srcv1
//----------------------------------------------------------
// &CombBeg; @551
always @( vreg11_reg_dout[63:0]
       or vreg33_reg_dout[63:0]
       or vreg15_reg_dout[63:0]
       or vreg10_reg_dout[63:0]
       or vreg8_reg_dout[63:0]
       or vreg40_reg_dout[63:0]
       or vreg5_reg_dout[63:0]
       or vreg39_reg_dout[63:0]
       or vreg56_reg_dout[63:0]
       or vreg12_reg_dout[63:0]
       or vreg14_reg_dout[63:0]
       or vreg17_reg_dout[63:0]
       or vreg9_reg_dout[63:0]
       or vreg48_reg_dout[63:0]
       or vreg22_reg_dout[63:0]
       or vreg28_reg_dout[63:0]
       or vreg26_reg_dout[63:0]
       or vreg54_reg_dout[63:0]
       or vreg50_reg_dout[63:0]
       or vreg60_reg_dout[63:0]
       or vreg32_reg_dout[63:0]
       or vreg29_reg_dout[63:0]
       or vreg45_reg_dout[63:0]
       or vreg38_reg_dout[63:0]
       or dp_prf_rf_pipe7_srcv1_vreg[5:0]
       or vreg18_reg_dout[63:0]
       or vreg16_reg_dout[63:0]
       or vreg2_reg_dout[63:0]
       or vreg3_reg_dout[63:0]
       or vreg4_reg_dout[63:0]
       or vreg44_reg_dout[63:0]
       or vreg6_reg_dout[63:0]
       or vreg35_reg_dout[63:0]
       or vreg61_reg_dout[63:0]
       or vreg37_reg_dout[63:0]
       or vreg1_reg_dout[63:0]
       or vreg31_reg_dout[63:0]
       or vreg36_reg_dout[63:0]
       or vreg49_reg_dout[63:0]
       or vreg63_reg_dout[63:0]
       or vreg20_reg_dout[63:0]
       or vreg55_reg_dout[63:0]
       or vreg41_reg_dout[63:0]
       or vreg62_reg_dout[63:0]
       or vreg30_reg_dout[63:0]
       or vreg23_reg_dout[63:0]
       or vreg53_reg_dout[63:0]
       or vreg43_reg_dout[63:0]
       or vreg57_reg_dout[63:0]
       or vreg19_reg_dout[63:0]
       or vreg25_reg_dout[63:0]
       or vreg24_reg_dout[63:0]
       or vreg21_reg_dout[63:0]
       or vreg34_reg_dout[63:0]
       or vreg47_reg_dout[63:0]
       or vreg13_reg_dout[63:0]
       or vreg7_reg_dout[63:0]
       or vreg58_reg_dout[63:0]
       or vreg27_reg_dout[63:0]
       or vreg51_reg_dout[63:0]
       or vreg59_reg_dout[63:0]
       or vreg0_reg_dout[63:0]
       or vreg46_reg_dout[63:0]
       or vreg42_reg_dout[63:0]
       or vreg52_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe7_srcv1_vreg[5:0])
    6'd0   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg0_reg_dout[63:0];
    6'd1   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg1_reg_dout[63:0];
    6'd2   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg2_reg_dout[63:0];
    6'd3   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg3_reg_dout[63:0];
    6'd4   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg4_reg_dout[63:0];
    6'd5   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg5_reg_dout[63:0];
    6'd6   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg6_reg_dout[63:0];
    6'd7   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg7_reg_dout[63:0];
    6'd8   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg8_reg_dout[63:0];
    6'd9   : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg9_reg_dout[63:0];
    6'd10  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg10_reg_dout[63:0];
    6'd11  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg11_reg_dout[63:0];
    6'd12  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg12_reg_dout[63:0];
    6'd13  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg13_reg_dout[63:0];
    6'd14  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg14_reg_dout[63:0];
    6'd15  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg15_reg_dout[63:0];
    6'd16  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg16_reg_dout[63:0];
    6'd17  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg17_reg_dout[63:0];
    6'd18  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg18_reg_dout[63:0];
    6'd19  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg19_reg_dout[63:0];
    6'd20  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg20_reg_dout[63:0];
    6'd21  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg21_reg_dout[63:0];
    6'd22  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg22_reg_dout[63:0];
    6'd23  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg23_reg_dout[63:0];
    6'd24  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg24_reg_dout[63:0];
    6'd25  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg25_reg_dout[63:0];
    6'd26  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg26_reg_dout[63:0];
    6'd27  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg27_reg_dout[63:0];
    6'd28  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg28_reg_dout[63:0];
    6'd29  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg29_reg_dout[63:0];
    6'd30  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg30_reg_dout[63:0];
    6'd31  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg31_reg_dout[63:0];
    6'd32  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg32_reg_dout[63:0];
    6'd33  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg33_reg_dout[63:0];
    6'd34  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg34_reg_dout[63:0];
    6'd35  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg35_reg_dout[63:0];
    6'd36  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg36_reg_dout[63:0];
    6'd37  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg37_reg_dout[63:0];
    6'd38  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg38_reg_dout[63:0];
    6'd39  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg39_reg_dout[63:0];
    6'd40  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg40_reg_dout[63:0];
    6'd41  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg41_reg_dout[63:0];
    6'd42  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg42_reg_dout[63:0];
    6'd43  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg43_reg_dout[63:0];
    6'd44  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg44_reg_dout[63:0];
    6'd45  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg45_reg_dout[63:0];
    6'd46  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg46_reg_dout[63:0];
    6'd47  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg47_reg_dout[63:0];
    6'd48  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg48_reg_dout[63:0];
    6'd49  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg49_reg_dout[63:0];
    6'd50  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg50_reg_dout[63:0];
    6'd51  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg51_reg_dout[63:0];
    6'd52  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg52_reg_dout[63:0];
    6'd53  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg53_reg_dout[63:0];
    6'd54  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg54_reg_dout[63:0];
    6'd55  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg55_reg_dout[63:0];
    6'd56  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg56_reg_dout[63:0];
    6'd57  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg57_reg_dout[63:0];
    6'd58  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg58_reg_dout[63:0];
    6'd59  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg59_reg_dout[63:0];
    6'd60  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg60_reg_dout[63:0];
    6'd61  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg61_reg_dout[63:0];
    6'd62  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg62_reg_dout[63:0];
    6'd63  : prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = vreg63_reg_dout[63:0];
    default: prf_dp_rf_pipe7_srcv1_vreg_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @619
end

//----------------------------------------------------------
//                 Read Port: pipe7 srcv2
//----------------------------------------------------------
// &CombBeg; @624
always @( vreg11_reg_dout[63:0]
       or vreg33_reg_dout[63:0]
       or vreg15_reg_dout[63:0]
       or vreg10_reg_dout[63:0]
       or vreg8_reg_dout[63:0]
       or vreg40_reg_dout[63:0]
       or vreg5_reg_dout[63:0]
       or vreg39_reg_dout[63:0]
       or vreg56_reg_dout[63:0]
       or vreg12_reg_dout[63:0]
       or vreg14_reg_dout[63:0]
       or vreg17_reg_dout[63:0]
       or vreg9_reg_dout[63:0]
       or vreg48_reg_dout[63:0]
       or vreg22_reg_dout[63:0]
       or vreg28_reg_dout[63:0]
       or vreg26_reg_dout[63:0]
       or vreg54_reg_dout[63:0]
       or vreg50_reg_dout[63:0]
       or vreg60_reg_dout[63:0]
       or vreg32_reg_dout[63:0]
       or vreg29_reg_dout[63:0]
       or vreg45_reg_dout[63:0]
       or vreg38_reg_dout[63:0]
       or vreg18_reg_dout[63:0]
       or vreg16_reg_dout[63:0]
       or vreg2_reg_dout[63:0]
       or vreg3_reg_dout[63:0]
       or vreg4_reg_dout[63:0]
       or vreg44_reg_dout[63:0]
       or vreg6_reg_dout[63:0]
       or vreg35_reg_dout[63:0]
       or vreg61_reg_dout[63:0]
       or vreg37_reg_dout[63:0]
       or dp_prf_rf_pipe7_srcv2_vreg[5:0]
       or vreg1_reg_dout[63:0]
       or vreg31_reg_dout[63:0]
       or vreg36_reg_dout[63:0]
       or vreg49_reg_dout[63:0]
       or vreg63_reg_dout[63:0]
       or vreg20_reg_dout[63:0]
       or vreg55_reg_dout[63:0]
       or vreg41_reg_dout[63:0]
       or vreg62_reg_dout[63:0]
       or vreg30_reg_dout[63:0]
       or vreg23_reg_dout[63:0]
       or vreg53_reg_dout[63:0]
       or vreg43_reg_dout[63:0]
       or vreg57_reg_dout[63:0]
       or vreg19_reg_dout[63:0]
       or vreg25_reg_dout[63:0]
       or vreg24_reg_dout[63:0]
       or vreg21_reg_dout[63:0]
       or vreg34_reg_dout[63:0]
       or vreg47_reg_dout[63:0]
       or vreg13_reg_dout[63:0]
       or vreg7_reg_dout[63:0]
       or vreg58_reg_dout[63:0]
       or vreg27_reg_dout[63:0]
       or vreg51_reg_dout[63:0]
       or vreg59_reg_dout[63:0]
       or vreg0_reg_dout[63:0]
       or vreg46_reg_dout[63:0]
       or vreg42_reg_dout[63:0]
       or vreg52_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe7_srcv2_vreg[5:0])
    6'd0   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg0_reg_dout[63:0];
    6'd1   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg1_reg_dout[63:0];
    6'd2   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg2_reg_dout[63:0];
    6'd3   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg3_reg_dout[63:0];
    6'd4   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg4_reg_dout[63:0];
    6'd5   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg5_reg_dout[63:0];
    6'd6   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg6_reg_dout[63:0];
    6'd7   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg7_reg_dout[63:0];
    6'd8   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg8_reg_dout[63:0];
    6'd9   : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg9_reg_dout[63:0];
    6'd10  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg10_reg_dout[63:0];
    6'd11  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg11_reg_dout[63:0];
    6'd12  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg12_reg_dout[63:0];
    6'd13  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg13_reg_dout[63:0];
    6'd14  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg14_reg_dout[63:0];
    6'd15  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg15_reg_dout[63:0];
    6'd16  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg16_reg_dout[63:0];
    6'd17  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg17_reg_dout[63:0];
    6'd18  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg18_reg_dout[63:0];
    6'd19  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg19_reg_dout[63:0];
    6'd20  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg20_reg_dout[63:0];
    6'd21  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg21_reg_dout[63:0];
    6'd22  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg22_reg_dout[63:0];
    6'd23  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg23_reg_dout[63:0];
    6'd24  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg24_reg_dout[63:0];
    6'd25  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg25_reg_dout[63:0];
    6'd26  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg26_reg_dout[63:0];
    6'd27  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg27_reg_dout[63:0];
    6'd28  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg28_reg_dout[63:0];
    6'd29  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg29_reg_dout[63:0];
    6'd30  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg30_reg_dout[63:0];
    6'd31  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg31_reg_dout[63:0];
    6'd32  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg32_reg_dout[63:0];
    6'd33  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg33_reg_dout[63:0];
    6'd34  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg34_reg_dout[63:0];
    6'd35  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg35_reg_dout[63:0];
    6'd36  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg36_reg_dout[63:0];
    6'd37  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg37_reg_dout[63:0];
    6'd38  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg38_reg_dout[63:0];
    6'd39  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg39_reg_dout[63:0];
    6'd40  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg40_reg_dout[63:0];
    6'd41  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg41_reg_dout[63:0];
    6'd42  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg42_reg_dout[63:0];
    6'd43  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg43_reg_dout[63:0];
    6'd44  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg44_reg_dout[63:0];
    6'd45  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg45_reg_dout[63:0];
    6'd46  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg46_reg_dout[63:0];
    6'd47  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg47_reg_dout[63:0];
    6'd48  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg48_reg_dout[63:0];
    6'd49  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg49_reg_dout[63:0];
    6'd50  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg50_reg_dout[63:0];
    6'd51  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg51_reg_dout[63:0];
    6'd52  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg52_reg_dout[63:0];
    6'd53  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg53_reg_dout[63:0];
    6'd54  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg54_reg_dout[63:0];
    6'd55  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg55_reg_dout[63:0];
    6'd56  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg56_reg_dout[63:0];
    6'd57  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg57_reg_dout[63:0];
    6'd58  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg58_reg_dout[63:0];
    6'd59  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg59_reg_dout[63:0];
    6'd60  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg60_reg_dout[63:0];
    6'd61  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg61_reg_dout[63:0];
    6'd62  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg62_reg_dout[63:0];
    6'd63  : prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = vreg63_reg_dout[63:0];
    default: prf_dp_rf_pipe7_srcv2_vreg_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @692
end

//----------------------------------------------------------
//                 Read Port: pipe5 srcv0
//----------------------------------------------------------
// &CombBeg; @697
always @( vreg11_reg_dout[63:0]
       or vreg33_reg_dout[63:0]
       or vreg15_reg_dout[63:0]
       or vreg10_reg_dout[63:0]
       or vreg8_reg_dout[63:0]
       or vreg40_reg_dout[63:0]
       or vreg5_reg_dout[63:0]
       or vreg39_reg_dout[63:0]
       or vreg56_reg_dout[63:0]
       or vreg12_reg_dout[63:0]
       or vreg14_reg_dout[63:0]
       or vreg17_reg_dout[63:0]
       or vreg9_reg_dout[63:0]
       or vreg48_reg_dout[63:0]
       or vreg22_reg_dout[63:0]
       or dp_prf_rf_pipe5_srcv0_vreg[5:0]
       or vreg28_reg_dout[63:0]
       or vreg26_reg_dout[63:0]
       or vreg54_reg_dout[63:0]
       or vreg50_reg_dout[63:0]
       or vreg60_reg_dout[63:0]
       or vreg32_reg_dout[63:0]
       or vreg29_reg_dout[63:0]
       or vreg45_reg_dout[63:0]
       or vreg38_reg_dout[63:0]
       or vreg18_reg_dout[63:0]
       or vreg16_reg_dout[63:0]
       or vreg2_reg_dout[63:0]
       or vreg3_reg_dout[63:0]
       or vreg4_reg_dout[63:0]
       or vreg44_reg_dout[63:0]
       or vreg6_reg_dout[63:0]
       or vreg35_reg_dout[63:0]
       or vreg61_reg_dout[63:0]
       or vreg37_reg_dout[63:0]
       or vreg1_reg_dout[63:0]
       or vreg31_reg_dout[63:0]
       or vreg36_reg_dout[63:0]
       or vreg49_reg_dout[63:0]
       or vreg63_reg_dout[63:0]
       or vreg20_reg_dout[63:0]
       or vreg55_reg_dout[63:0]
       or vreg41_reg_dout[63:0]
       or vreg62_reg_dout[63:0]
       or vreg30_reg_dout[63:0]
       or vreg23_reg_dout[63:0]
       or vreg53_reg_dout[63:0]
       or vreg43_reg_dout[63:0]
       or vreg57_reg_dout[63:0]
       or vreg19_reg_dout[63:0]
       or vreg25_reg_dout[63:0]
       or vreg24_reg_dout[63:0]
       or vreg21_reg_dout[63:0]
       or vreg34_reg_dout[63:0]
       or vreg47_reg_dout[63:0]
       or vreg13_reg_dout[63:0]
       or vreg7_reg_dout[63:0]
       or vreg58_reg_dout[63:0]
       or vreg27_reg_dout[63:0]
       or vreg51_reg_dout[63:0]
       or vreg59_reg_dout[63:0]
       or vreg0_reg_dout[63:0]
       or vreg46_reg_dout[63:0]
       or vreg42_reg_dout[63:0]
       or vreg52_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe5_srcv0_vreg[5:0])
    6'd0   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg0_reg_dout[63:0];
    6'd1   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg1_reg_dout[63:0];
    6'd2   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg2_reg_dout[63:0];
    6'd3   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg3_reg_dout[63:0];
    6'd4   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg4_reg_dout[63:0];
    6'd5   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg5_reg_dout[63:0];
    6'd6   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg6_reg_dout[63:0];
    6'd7   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg7_reg_dout[63:0];
    6'd8   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg8_reg_dout[63:0];
    6'd9   : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg9_reg_dout[63:0];
    6'd10  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg10_reg_dout[63:0];
    6'd11  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg11_reg_dout[63:0];
    6'd12  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg12_reg_dout[63:0];
    6'd13  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg13_reg_dout[63:0];
    6'd14  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg14_reg_dout[63:0];
    6'd15  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg15_reg_dout[63:0];
    6'd16  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg16_reg_dout[63:0];
    6'd17  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg17_reg_dout[63:0];
    6'd18  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg18_reg_dout[63:0];
    6'd19  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg19_reg_dout[63:0];
    6'd20  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg20_reg_dout[63:0];
    6'd21  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg21_reg_dout[63:0];
    6'd22  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg22_reg_dout[63:0];
    6'd23  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg23_reg_dout[63:0];
    6'd24  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg24_reg_dout[63:0];
    6'd25  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg25_reg_dout[63:0];
    6'd26  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg26_reg_dout[63:0];
    6'd27  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg27_reg_dout[63:0];
    6'd28  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg28_reg_dout[63:0];
    6'd29  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg29_reg_dout[63:0];
    6'd30  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg30_reg_dout[63:0];
    6'd31  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg31_reg_dout[63:0];
    6'd32  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg32_reg_dout[63:0];
    6'd33  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg33_reg_dout[63:0];
    6'd34  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg34_reg_dout[63:0];
    6'd35  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg35_reg_dout[63:0];
    6'd36  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg36_reg_dout[63:0];
    6'd37  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg37_reg_dout[63:0];
    6'd38  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg38_reg_dout[63:0];
    6'd39  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg39_reg_dout[63:0];
    6'd40  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg40_reg_dout[63:0];
    6'd41  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg41_reg_dout[63:0];
    6'd42  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg42_reg_dout[63:0];
    6'd43  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg43_reg_dout[63:0];
    6'd44  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg44_reg_dout[63:0];
    6'd45  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg45_reg_dout[63:0];
    6'd46  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg46_reg_dout[63:0];
    6'd47  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg47_reg_dout[63:0];
    6'd48  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg48_reg_dout[63:0];
    6'd49  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg49_reg_dout[63:0];
    6'd50  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg50_reg_dout[63:0];
    6'd51  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg51_reg_dout[63:0];
    6'd52  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg52_reg_dout[63:0];
    6'd53  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg53_reg_dout[63:0];
    6'd54  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg54_reg_dout[63:0];
    6'd55  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg55_reg_dout[63:0];
    6'd56  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg56_reg_dout[63:0];
    6'd57  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg57_reg_dout[63:0];
    6'd58  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg58_reg_dout[63:0];
    6'd59  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg59_reg_dout[63:0];
    6'd60  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg60_reg_dout[63:0];
    6'd61  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg61_reg_dout[63:0];
    6'd62  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg62_reg_dout[63:0];
    6'd63  : prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = vreg63_reg_dout[63:0];
    default: prf_dp_rf_pipe5_srcv0_vreg_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @765
end


// &ModuleEnd; @768
endmodule


