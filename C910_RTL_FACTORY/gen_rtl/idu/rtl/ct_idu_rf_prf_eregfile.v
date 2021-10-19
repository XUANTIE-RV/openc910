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
module ct_idu_rf_prf_eregfile(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_cp0_fesr_acc_updt_val,
  idu_cp0_fesr_acc_updt_vld,
  pad_yy_icg_scan_en,
  rtu_idu_pst_ereg_retired_released_wb,
  rtu_idu_retire0_inst_vld,
  vfpu_idu_ex5_pipe6_wb_ereg,
  vfpu_idu_ex5_pipe6_wb_ereg_data,
  vfpu_idu_ex5_pipe6_wb_ereg_vld,
  vfpu_idu_ex5_pipe7_wb_ereg,
  vfpu_idu_ex5_pipe7_wb_ereg_data,
  vfpu_idu_ex5_pipe7_wb_ereg_vld
);

// &Ports; @26
input           cp0_idu_icg_en;                      
input           cp0_yy_clk_en;                       
input           cpurst_b;                            
input           forever_cpuclk;                      
input           pad_yy_icg_scan_en;                  
input   [31:0]  rtu_idu_pst_ereg_retired_released_wb; 
input           rtu_idu_retire0_inst_vld;            
input   [4 :0]  vfpu_idu_ex5_pipe6_wb_ereg;          
input   [5 :0]  vfpu_idu_ex5_pipe6_wb_ereg_data;     
input           vfpu_idu_ex5_pipe6_wb_ereg_vld;      
input   [4 :0]  vfpu_idu_ex5_pipe7_wb_ereg;          
input   [5 :0]  vfpu_idu_ex5_pipe7_wb_ereg_data;     
input           vfpu_idu_ex5_pipe7_wb_ereg_vld;      
output  [6 :0]  idu_cp0_fesr_acc_updt_val;           
output          idu_cp0_fesr_acc_updt_vld;           

// &Regs; @27
reg             fesr_acc_updt_vld_ff;                
reg     [31:0]  fesr_retired_released_wb_ff;         

// &Wires; @28
wire            cp0_idu_icg_en;                      
wire            cp0_yy_clk_en;                       
wire            cpurst_b;                            
wire    [5 :0]  ereg0_acc_reg_dout;                  
wire            ereg0_retired_released_wb;           
wire    [1 :0]  ereg0_wb_vld;                        
wire    [5 :0]  ereg10_acc_reg_dout;                 
wire            ereg10_retired_released_wb;          
wire    [1 :0]  ereg10_wb_vld;                       
wire    [5 :0]  ereg11_acc_reg_dout;                 
wire            ereg11_retired_released_wb;          
wire    [1 :0]  ereg11_wb_vld;                       
wire    [5 :0]  ereg12_acc_reg_dout;                 
wire            ereg12_retired_released_wb;          
wire    [1 :0]  ereg12_wb_vld;                       
wire    [5 :0]  ereg13_acc_reg_dout;                 
wire            ereg13_retired_released_wb;          
wire    [1 :0]  ereg13_wb_vld;                       
wire    [5 :0]  ereg14_acc_reg_dout;                 
wire            ereg14_retired_released_wb;          
wire    [1 :0]  ereg14_wb_vld;                       
wire    [5 :0]  ereg15_acc_reg_dout;                 
wire            ereg15_retired_released_wb;          
wire    [1 :0]  ereg15_wb_vld;                       
wire    [5 :0]  ereg16_acc_reg_dout;                 
wire            ereg16_retired_released_wb;          
wire    [1 :0]  ereg16_wb_vld;                       
wire    [5 :0]  ereg17_acc_reg_dout;                 
wire            ereg17_retired_released_wb;          
wire    [1 :0]  ereg17_wb_vld;                       
wire    [5 :0]  ereg18_acc_reg_dout;                 
wire            ereg18_retired_released_wb;          
wire    [1 :0]  ereg18_wb_vld;                       
wire    [5 :0]  ereg19_acc_reg_dout;                 
wire            ereg19_retired_released_wb;          
wire    [1 :0]  ereg19_wb_vld;                       
wire    [5 :0]  ereg1_acc_reg_dout;                  
wire            ereg1_retired_released_wb;           
wire    [1 :0]  ereg1_wb_vld;                        
wire    [5 :0]  ereg20_acc_reg_dout;                 
wire            ereg20_retired_released_wb;          
wire    [1 :0]  ereg20_wb_vld;                       
wire    [5 :0]  ereg21_acc_reg_dout;                 
wire            ereg21_retired_released_wb;          
wire    [1 :0]  ereg21_wb_vld;                       
wire    [5 :0]  ereg22_acc_reg_dout;                 
wire            ereg22_retired_released_wb;          
wire    [1 :0]  ereg22_wb_vld;                       
wire    [5 :0]  ereg23_acc_reg_dout;                 
wire            ereg23_retired_released_wb;          
wire    [1 :0]  ereg23_wb_vld;                       
wire    [5 :0]  ereg24_acc_reg_dout;                 
wire            ereg24_retired_released_wb;          
wire    [1 :0]  ereg24_wb_vld;                       
wire    [5 :0]  ereg25_acc_reg_dout;                 
wire            ereg25_retired_released_wb;          
wire    [1 :0]  ereg25_wb_vld;                       
wire    [5 :0]  ereg26_acc_reg_dout;                 
wire            ereg26_retired_released_wb;          
wire    [1 :0]  ereg26_wb_vld;                       
wire    [5 :0]  ereg27_acc_reg_dout;                 
wire            ereg27_retired_released_wb;          
wire    [1 :0]  ereg27_wb_vld;                       
wire    [5 :0]  ereg28_acc_reg_dout;                 
wire            ereg28_retired_released_wb;          
wire    [1 :0]  ereg28_wb_vld;                       
wire    [5 :0]  ereg29_acc_reg_dout;                 
wire            ereg29_retired_released_wb;          
wire    [1 :0]  ereg29_wb_vld;                       
wire    [5 :0]  ereg2_acc_reg_dout;                  
wire            ereg2_retired_released_wb;           
wire    [1 :0]  ereg2_wb_vld;                        
wire    [5 :0]  ereg30_acc_reg_dout;                 
wire            ereg30_retired_released_wb;          
wire    [1 :0]  ereg30_wb_vld;                       
wire    [5 :0]  ereg31_acc_reg_dout;                 
wire            ereg31_retired_released_wb;          
wire    [1 :0]  ereg31_wb_vld;                       
wire    [5 :0]  ereg3_acc_reg_dout;                  
wire            ereg3_retired_released_wb;           
wire    [1 :0]  ereg3_wb_vld;                        
wire    [5 :0]  ereg4_acc_reg_dout;                  
wire            ereg4_retired_released_wb;           
wire    [1 :0]  ereg4_wb_vld;                        
wire    [5 :0]  ereg5_acc_reg_dout;                  
wire            ereg5_retired_released_wb;           
wire    [1 :0]  ereg5_wb_vld;                        
wire    [5 :0]  ereg6_acc_reg_dout;                  
wire            ereg6_retired_released_wb;           
wire    [1 :0]  ereg6_wb_vld;                        
wire    [5 :0]  ereg7_acc_reg_dout;                  
wire            ereg7_retired_released_wb;           
wire    [1 :0]  ereg7_wb_vld;                        
wire    [5 :0]  ereg8_acc_reg_dout;                  
wire            ereg8_retired_released_wb;           
wire    [1 :0]  ereg8_wb_vld;                        
wire    [5 :0]  ereg9_acc_reg_dout;                  
wire            ereg9_retired_released_wb;           
wire    [1 :0]  ereg9_wb_vld;                        
wire            ereg_clk_en;                         
wire            ereg_top_clk;                        
wire    [5 :0]  fesr_acc;                            
wire            fesr_acc_clk;                        
wire            fesr_acc_clk_en;                     
wire            fesr_acc_updt_vld;                   
wire    [6 :0]  fesr_acc_with_fcr;                   
wire            forever_cpuclk;                      
wire    [6 :0]  idu_cp0_fesr_acc_updt_val;           
wire            idu_cp0_fesr_acc_updt_vld;           
wire            pad_yy_icg_scan_en;                  
wire    [31:0]  pipe6_wb_vld;                        
wire    [31:0]  pipe7_wb_vld;                        
wire    [31:0]  rtu_idu_pst_ereg_retired_released_wb; 
wire            rtu_idu_retire0_inst_vld;            
wire    [4 :0]  vfpu_idu_ex5_pipe6_wb_ereg;          
wire    [5 :0]  vfpu_idu_ex5_pipe6_wb_ereg_data;     
wire    [31:0]  vfpu_idu_ex5_pipe6_wb_ereg_expand;   
wire            vfpu_idu_ex5_pipe6_wb_ereg_vld;      
wire    [4 :0]  vfpu_idu_ex5_pipe7_wb_ereg;          
wire    [5 :0]  vfpu_idu_ex5_pipe7_wb_ereg_data;     
wire    [31:0]  vfpu_idu_ex5_pipe7_wb_ereg_expand;   
wire            vfpu_idu_ex5_pipe7_wb_ereg_vld;      



//==========================================================
//                 Top Mudule Gated Cell
//==========================================================
assign ereg_clk_en = vfpu_idu_ex5_pipe6_wb_ereg_vld
                     || vfpu_idu_ex5_pipe7_wb_ereg_vld;
// &Instance("gated_clk_cell", "x_ereg_gated_clk"); @36
gated_clk_cell  x_ereg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ereg_top_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ereg_clk_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @37
//          .external_en (1'b0), @38
//          .global_en   (cp0_yy_clk_en), @39
//          .module_en   (cp0_idu_icg_en), @40
//          .local_en    (ereg_clk_en), @41
//          .clk_out     (ereg_top_clk)); @42

//==========================================================
//            Instance F expt Physical Registers
//==========================================================
// &ConnRule(s/^x_/ereg0_/); @47
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg0"); @48
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg0 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg0_acc_reg_dout             ),
  .x_retired_released_wb           (ereg0_retired_released_wb      ),
  .x_wb_vld                        (ereg0_wb_vld                   )
);

// &ConnRule(s/^x_/ereg1_/); @49
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg1"); @50
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg1 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg1_acc_reg_dout             ),
  .x_retired_released_wb           (ereg1_retired_released_wb      ),
  .x_wb_vld                        (ereg1_wb_vld                   )
);

// &ConnRule(s/^x_/ereg2_/); @51
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg2"); @52
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg2 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg2_acc_reg_dout             ),
  .x_retired_released_wb           (ereg2_retired_released_wb      ),
  .x_wb_vld                        (ereg2_wb_vld                   )
);

// &ConnRule(s/^x_/ereg3_/); @53
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg3"); @54
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg3 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg3_acc_reg_dout             ),
  .x_retired_released_wb           (ereg3_retired_released_wb      ),
  .x_wb_vld                        (ereg3_wb_vld                   )
);

// &ConnRule(s/^x_/ereg4_/); @55
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg4"); @56
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg4 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg4_acc_reg_dout             ),
  .x_retired_released_wb           (ereg4_retired_released_wb      ),
  .x_wb_vld                        (ereg4_wb_vld                   )
);

// &ConnRule(s/^x_/ereg5_/); @57
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg5"); @58
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg5 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg5_acc_reg_dout             ),
  .x_retired_released_wb           (ereg5_retired_released_wb      ),
  .x_wb_vld                        (ereg5_wb_vld                   )
);

// &ConnRule(s/^x_/ereg6_/); @59
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg6"); @60
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg6 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg6_acc_reg_dout             ),
  .x_retired_released_wb           (ereg6_retired_released_wb      ),
  .x_wb_vld                        (ereg6_wb_vld                   )
);

// &ConnRule(s/^x_/ereg7_/); @61
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg7"); @62
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg7 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg7_acc_reg_dout             ),
  .x_retired_released_wb           (ereg7_retired_released_wb      ),
  .x_wb_vld                        (ereg7_wb_vld                   )
);

// &ConnRule(s/^x_/ereg8_/); @63
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg8"); @64
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg8 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg8_acc_reg_dout             ),
  .x_retired_released_wb           (ereg8_retired_released_wb      ),
  .x_wb_vld                        (ereg8_wb_vld                   )
);

// &ConnRule(s/^x_/ereg9_/); @65
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg9"); @66
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg9 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg9_acc_reg_dout             ),
  .x_retired_released_wb           (ereg9_retired_released_wb      ),
  .x_wb_vld                        (ereg9_wb_vld                   )
);

// &ConnRule(s/^x_/ereg10_/); @67
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg10"); @68
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg10 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg10_acc_reg_dout            ),
  .x_retired_released_wb           (ereg10_retired_released_wb     ),
  .x_wb_vld                        (ereg10_wb_vld                  )
);

// &ConnRule(s/^x_/ereg11_/); @69
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg11"); @70
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg11 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg11_acc_reg_dout            ),
  .x_retired_released_wb           (ereg11_retired_released_wb     ),
  .x_wb_vld                        (ereg11_wb_vld                  )
);

// &ConnRule(s/^x_/ereg12_/); @71
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg12"); @72
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg12 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg12_acc_reg_dout            ),
  .x_retired_released_wb           (ereg12_retired_released_wb     ),
  .x_wb_vld                        (ereg12_wb_vld                  )
);

// &ConnRule(s/^x_/ereg13_/); @73
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg13"); @74
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg13 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg13_acc_reg_dout            ),
  .x_retired_released_wb           (ereg13_retired_released_wb     ),
  .x_wb_vld                        (ereg13_wb_vld                  )
);

// &ConnRule(s/^x_/ereg14_/); @75
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg14"); @76
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg14 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg14_acc_reg_dout            ),
  .x_retired_released_wb           (ereg14_retired_released_wb     ),
  .x_wb_vld                        (ereg14_wb_vld                  )
);

// &ConnRule(s/^x_/ereg15_/); @77
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg15"); @78
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg15 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg15_acc_reg_dout            ),
  .x_retired_released_wb           (ereg15_retired_released_wb     ),
  .x_wb_vld                        (ereg15_wb_vld                  )
);

// &ConnRule(s/^x_/ereg16_/); @79
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg16"); @80
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg16 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg16_acc_reg_dout            ),
  .x_retired_released_wb           (ereg16_retired_released_wb     ),
  .x_wb_vld                        (ereg16_wb_vld                  )
);

// &ConnRule(s/^x_/ereg17_/); @81
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg17"); @82
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg17 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg17_acc_reg_dout            ),
  .x_retired_released_wb           (ereg17_retired_released_wb     ),
  .x_wb_vld                        (ereg17_wb_vld                  )
);

// &ConnRule(s/^x_/ereg18_/); @83
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg18"); @84
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg18 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg18_acc_reg_dout            ),
  .x_retired_released_wb           (ereg18_retired_released_wb     ),
  .x_wb_vld                        (ereg18_wb_vld                  )
);

// &ConnRule(s/^x_/ereg19_/); @85
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg19"); @86
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg19 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg19_acc_reg_dout            ),
  .x_retired_released_wb           (ereg19_retired_released_wb     ),
  .x_wb_vld                        (ereg19_wb_vld                  )
);

// &ConnRule(s/^x_/ereg20_/); @87
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg20"); @88
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg20 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg20_acc_reg_dout            ),
  .x_retired_released_wb           (ereg20_retired_released_wb     ),
  .x_wb_vld                        (ereg20_wb_vld                  )
);

// &ConnRule(s/^x_/ereg21_/); @89
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg21"); @90
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg21 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg21_acc_reg_dout            ),
  .x_retired_released_wb           (ereg21_retired_released_wb     ),
  .x_wb_vld                        (ereg21_wb_vld                  )
);

// &ConnRule(s/^x_/ereg22_/); @91
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg22"); @92
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg22 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg22_acc_reg_dout            ),
  .x_retired_released_wb           (ereg22_retired_released_wb     ),
  .x_wb_vld                        (ereg22_wb_vld                  )
);

// &ConnRule(s/^x_/ereg23_/); @93
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg23"); @94
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg23 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg23_acc_reg_dout            ),
  .x_retired_released_wb           (ereg23_retired_released_wb     ),
  .x_wb_vld                        (ereg23_wb_vld                  )
);

// &ConnRule(s/^x_/ereg24_/); @95
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg24"); @96
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg24 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg24_acc_reg_dout            ),
  .x_retired_released_wb           (ereg24_retired_released_wb     ),
  .x_wb_vld                        (ereg24_wb_vld                  )
);

// &ConnRule(s/^x_/ereg25_/); @97
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg25"); @98
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg25 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg25_acc_reg_dout            ),
  .x_retired_released_wb           (ereg25_retired_released_wb     ),
  .x_wb_vld                        (ereg25_wb_vld                  )
);

// &ConnRule(s/^x_/ereg26_/); @99
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg26"); @100
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg26 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg26_acc_reg_dout            ),
  .x_retired_released_wb           (ereg26_retired_released_wb     ),
  .x_wb_vld                        (ereg26_wb_vld                  )
);

// &ConnRule(s/^x_/ereg27_/); @101
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg27"); @102
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg27 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg27_acc_reg_dout            ),
  .x_retired_released_wb           (ereg27_retired_released_wb     ),
  .x_wb_vld                        (ereg27_wb_vld                  )
);

// &ConnRule(s/^x_/ereg28_/); @103
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg28"); @104
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg28 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg28_acc_reg_dout            ),
  .x_retired_released_wb           (ereg28_retired_released_wb     ),
  .x_wb_vld                        (ereg28_wb_vld                  )
);

// &ConnRule(s/^x_/ereg29_/); @105
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg29"); @106
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg29 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg29_acc_reg_dout            ),
  .x_retired_released_wb           (ereg29_retired_released_wb     ),
  .x_wb_vld                        (ereg29_wb_vld                  )
);

// &ConnRule(s/^x_/ereg30_/); @107
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg30"); @108
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg30 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg30_acc_reg_dout            ),
  .x_retired_released_wb           (ereg30_retired_released_wb     ),
  .x_wb_vld                        (ereg30_wb_vld                  )
);

// &ConnRule(s/^x_/ereg31_/); @109
// &Instance("ct_idu_rf_prf_gated_ereg", "x_ct_idu_rf_prf_ereg31"); @110
ct_idu_rf_prf_gated_ereg  x_ct_idu_rf_prf_ereg31 (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ereg_top_clk                    (ereg_top_clk                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data (vfpu_idu_ex5_pipe6_wb_ereg_data),
  .vfpu_idu_ex5_pipe7_wb_ereg_data (vfpu_idu_ex5_pipe7_wb_ereg_data),
  .x_acc_reg_dout                  (ereg31_acc_reg_dout            ),
  .x_retired_released_wb           (ereg31_retired_released_wb     ),
  .x_wb_vld                        (ereg31_wb_vld                  )
);


//==========================================================
//                       Write Port 
//==========================================================
// &ConnRule(s/^x_num/vfpu_idu_ex5_pipe6_wb_ereg/); @115
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_vfpu_idu_ex5_pipe6_wb_ereg"); @116
ct_rtu_expand_32  x_ct_rtu_expand_32_vfpu_idu_ex5_pipe6_wb_ereg (
  .x_num                             (vfpu_idu_ex5_pipe6_wb_ereg       ),
  .x_num_expand                      (vfpu_idu_ex5_pipe6_wb_ereg_expand)
);

// &ConnRule(s/^x_num/vfpu_idu_ex5_pipe7_wb_ereg/); @117
// &Instance("ct_rtu_expand_32","x_ct_rtu_expand_32_vfpu_idu_ex5_pipe7_wb_ereg"); @118
ct_rtu_expand_32  x_ct_rtu_expand_32_vfpu_idu_ex5_pipe7_wb_ereg (
  .x_num                             (vfpu_idu_ex5_pipe7_wb_ereg       ),
  .x_num_expand                      (vfpu_idu_ex5_pipe7_wb_ereg_expand)
);

//3 write ports
assign pipe6_wb_vld[31:0] = {32{vfpu_idu_ex5_pipe6_wb_ereg_vld}}
                            & vfpu_idu_ex5_pipe6_wb_ereg_expand[31:0];
assign pipe7_wb_vld[31:0] = {32{vfpu_idu_ex5_pipe7_wb_ereg_vld}}
                            & vfpu_idu_ex5_pipe7_wb_ereg_expand[31:0];

assign ereg0_wb_vld[1:0]  = {pipe7_wb_vld[0], pipe6_wb_vld[0]};
assign ereg1_wb_vld[1:0]  = {pipe7_wb_vld[1], pipe6_wb_vld[1]};
assign ereg2_wb_vld[1:0]  = {pipe7_wb_vld[2], pipe6_wb_vld[2]};
assign ereg3_wb_vld[1:0]  = {pipe7_wb_vld[3], pipe6_wb_vld[3]};
assign ereg4_wb_vld[1:0]  = {pipe7_wb_vld[4], pipe6_wb_vld[4]};
assign ereg5_wb_vld[1:0]  = {pipe7_wb_vld[5], pipe6_wb_vld[5]};
assign ereg6_wb_vld[1:0]  = {pipe7_wb_vld[6], pipe6_wb_vld[6]};
assign ereg7_wb_vld[1:0]  = {pipe7_wb_vld[7], pipe6_wb_vld[7]};
assign ereg8_wb_vld[1:0]  = {pipe7_wb_vld[8], pipe6_wb_vld[8]};
assign ereg9_wb_vld[1:0]  = {pipe7_wb_vld[9], pipe6_wb_vld[9]};
assign ereg10_wb_vld[1:0] = {pipe7_wb_vld[10],pipe6_wb_vld[10]};
assign ereg11_wb_vld[1:0] = {pipe7_wb_vld[11],pipe6_wb_vld[11]};
assign ereg12_wb_vld[1:0] = {pipe7_wb_vld[12],pipe6_wb_vld[12]};
assign ereg13_wb_vld[1:0] = {pipe7_wb_vld[13],pipe6_wb_vld[13]};
assign ereg14_wb_vld[1:0] = {pipe7_wb_vld[14],pipe6_wb_vld[14]};
assign ereg15_wb_vld[1:0] = {pipe7_wb_vld[15],pipe6_wb_vld[15]};
assign ereg16_wb_vld[1:0] = {pipe7_wb_vld[16],pipe6_wb_vld[16]};
assign ereg17_wb_vld[1:0] = {pipe7_wb_vld[17],pipe6_wb_vld[17]};
assign ereg18_wb_vld[1:0] = {pipe7_wb_vld[18],pipe6_wb_vld[18]};
assign ereg19_wb_vld[1:0] = {pipe7_wb_vld[19],pipe6_wb_vld[19]};
assign ereg20_wb_vld[1:0] = {pipe7_wb_vld[20],pipe6_wb_vld[20]};
assign ereg21_wb_vld[1:0] = {pipe7_wb_vld[21],pipe6_wb_vld[21]};
assign ereg22_wb_vld[1:0] = {pipe7_wb_vld[22],pipe6_wb_vld[22]};
assign ereg23_wb_vld[1:0] = {pipe7_wb_vld[23],pipe6_wb_vld[23]};
assign ereg24_wb_vld[1:0] = {pipe7_wb_vld[24],pipe6_wb_vld[24]};
assign ereg25_wb_vld[1:0] = {pipe7_wb_vld[25],pipe6_wb_vld[25]};
assign ereg26_wb_vld[1:0] = {pipe7_wb_vld[26],pipe6_wb_vld[26]};
assign ereg27_wb_vld[1:0] = {pipe7_wb_vld[27],pipe6_wb_vld[27]};
assign ereg28_wb_vld[1:0] = {pipe7_wb_vld[28],pipe6_wb_vld[28]};
assign ereg29_wb_vld[1:0] = {pipe7_wb_vld[29],pipe6_wb_vld[29]};
assign ereg30_wb_vld[1:0] = {pipe7_wb_vld[30],pipe6_wb_vld[30]};
assign ereg31_wb_vld[1:0] = {pipe7_wb_vld[31],pipe6_wb_vld[31]};

//==========================================================
//                       Read Port 
//==========================================================
////----------------------------------------------------------
////                Read Port : FESR Cur bit
////----------------------------------------------------------
//assign fesr_cur[6]   = |fesr_cur[5:0];
//assign fesr_cur[5:0] =
//           {6{rtu_idu_prf_f_ereg_expand[0]}}  & ereg0_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[1]}}  & ereg1_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[2]}}  & ereg2_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[3]}}  & ereg3_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[4]}}  & ereg4_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[5]}}  & ereg5_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[6]}}  & ereg6_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[7]}}  & ereg7_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[8]}}  & ereg8_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[9]}}  & ereg9_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[10]}} & ereg10_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[11]}} & ereg11_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[12]}} & ereg12_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[13]}} & ereg13_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[14]}} & ereg14_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[15]}} & ereg15_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[16]}} & ereg16_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[17]}} & ereg17_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[18]}} & ereg18_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[19]}} & ereg19_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[20]}} & ereg20_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[21]}} & ereg21_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[22]}} & ereg22_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[23]}} & ereg23_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[24]}} & ereg24_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[25]}} & ereg25_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[26]}} & ereg26_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[27]}} & ereg27_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[28]}} & ereg28_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[29]}} & ereg29_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[30]}} & ereg30_reg_dout[5:0]
//         | {6{rtu_idu_prf_f_ereg_expand[31]}} & ereg31_reg_dout[5:0];
//
//assign idu_cp0_fesr_cur[6:0] = fesr_cur[6:0];

//----------------------------------------------------------
//           Read Port : FESR Acc bit update value
//----------------------------------------------------------
assign ereg0_retired_released_wb  = fesr_retired_released_wb_ff[0];
assign ereg1_retired_released_wb  = fesr_retired_released_wb_ff[1];
assign ereg2_retired_released_wb  = fesr_retired_released_wb_ff[2];
assign ereg3_retired_released_wb  = fesr_retired_released_wb_ff[3];
assign ereg4_retired_released_wb  = fesr_retired_released_wb_ff[4];
assign ereg5_retired_released_wb  = fesr_retired_released_wb_ff[5];
assign ereg6_retired_released_wb  = fesr_retired_released_wb_ff[6];
assign ereg7_retired_released_wb  = fesr_retired_released_wb_ff[7];
assign ereg8_retired_released_wb  = fesr_retired_released_wb_ff[8];
assign ereg9_retired_released_wb  = fesr_retired_released_wb_ff[9];
assign ereg10_retired_released_wb = fesr_retired_released_wb_ff[10];
assign ereg11_retired_released_wb = fesr_retired_released_wb_ff[11];
assign ereg12_retired_released_wb = fesr_retired_released_wb_ff[12];
assign ereg13_retired_released_wb = fesr_retired_released_wb_ff[13];
assign ereg14_retired_released_wb = fesr_retired_released_wb_ff[14];
assign ereg15_retired_released_wb = fesr_retired_released_wb_ff[15];
assign ereg16_retired_released_wb = fesr_retired_released_wb_ff[16];
assign ereg17_retired_released_wb = fesr_retired_released_wb_ff[17];
assign ereg18_retired_released_wb = fesr_retired_released_wb_ff[18];
assign ereg19_retired_released_wb = fesr_retired_released_wb_ff[19];
assign ereg20_retired_released_wb = fesr_retired_released_wb_ff[20];
assign ereg21_retired_released_wb = fesr_retired_released_wb_ff[21];
assign ereg22_retired_released_wb = fesr_retired_released_wb_ff[22];
assign ereg23_retired_released_wb = fesr_retired_released_wb_ff[23];
assign ereg24_retired_released_wb = fesr_retired_released_wb_ff[24];
assign ereg25_retired_released_wb = fesr_retired_released_wb_ff[25];
assign ereg26_retired_released_wb = fesr_retired_released_wb_ff[26];
assign ereg27_retired_released_wb = fesr_retired_released_wb_ff[27];
assign ereg28_retired_released_wb = fesr_retired_released_wb_ff[28];
assign ereg29_retired_released_wb = fesr_retired_released_wb_ff[29];
assign ereg30_retired_released_wb = fesr_retired_released_wb_ff[30];
assign ereg31_retired_released_wb = fesr_retired_released_wb_ff[31];

assign fesr_acc[5:0] = ereg0_acc_reg_dout[5:0]
                     | ereg1_acc_reg_dout[5:0]
                     | ereg2_acc_reg_dout[5:0]
                     | ereg3_acc_reg_dout[5:0]
                     | ereg4_acc_reg_dout[5:0]
                     | ereg5_acc_reg_dout[5:0]
                     | ereg6_acc_reg_dout[5:0]
                     | ereg7_acc_reg_dout[5:0]
                     | ereg8_acc_reg_dout[5:0]
                     | ereg9_acc_reg_dout[5:0]
                     | ereg10_acc_reg_dout[5:0]
                     | ereg11_acc_reg_dout[5:0]
                     | ereg12_acc_reg_dout[5:0]
                     | ereg13_acc_reg_dout[5:0]
                     | ereg14_acc_reg_dout[5:0]
                     | ereg15_acc_reg_dout[5:0]
                     | ereg16_acc_reg_dout[5:0]
                     | ereg17_acc_reg_dout[5:0]
                     | ereg18_acc_reg_dout[5:0]
                     | ereg19_acc_reg_dout[5:0]
                     | ereg20_acc_reg_dout[5:0]
                     | ereg21_acc_reg_dout[5:0]
                     | ereg22_acc_reg_dout[5:0]
                     | ereg23_acc_reg_dout[5:0]
                     | ereg24_acc_reg_dout[5:0]
                     | ereg25_acc_reg_dout[5:0]
                     | ereg26_acc_reg_dout[5:0]
                     | ereg27_acc_reg_dout[5:0]
                     | ereg28_acc_reg_dout[5:0]
                     | ereg29_acc_reg_dout[5:0]
                     | ereg30_acc_reg_dout[5:0]
                     | ereg31_acc_reg_dout[5:0];

assign fesr_acc_with_fcr[4:0] = fesr_acc[4:0];
assign fesr_acc_with_fcr[5]   = |fesr_acc_with_fcr[4:0];
assign fesr_acc_with_fcr[6]   = fesr_acc[5];

assign idu_cp0_fesr_acc_updt_val[6:0] = fesr_acc_with_fcr[6:0];

//----------------------------------------------------------
//                    Update valid
//----------------------------------------------------------
assign fesr_acc_updt_vld      = rtu_idu_retire0_inst_vld
                                || vfpu_idu_ex5_pipe6_wb_ereg_vld
                                || vfpu_idu_ex5_pipe7_wb_ereg_vld;

assign fesr_acc_clk_en = fesr_acc_updt_vld || fesr_acc_updt_vld_ff;
// &Instance("gated_clk_cell", "x_ereg_acc_gated_clk"); @284
gated_clk_cell  x_ereg_acc_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fesr_acc_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fesr_acc_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @285
//          .external_en (1'b0), @286
//          .global_en   (cp0_yy_clk_en), @287
//          .module_en   (cp0_idu_icg_en), @288
//          .local_en    (fesr_acc_clk_en), @289
//          .clk_out     (fesr_acc_clk)); @290

always @(posedge fesr_acc_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    fesr_acc_updt_vld_ff              <= 1'b0;
    fesr_retired_released_wb_ff[31:0] <= 32'b0;
  end
  else if(fesr_acc_updt_vld) begin
    fesr_acc_updt_vld_ff              <= 1'b1;
    fesr_retired_released_wb_ff[31:0] <= rtu_idu_pst_ereg_retired_released_wb[31:0];
  end
  else begin
    fesr_acc_updt_vld_ff              <= 1'b0;
    fesr_retired_released_wb_ff[31:0] <= fesr_retired_released_wb_ff[31:0];
  end
end

assign idu_cp0_fesr_acc_updt_vld = fesr_acc_updt_vld_ff
                                   && (|fesr_retired_released_wb_ff[31:0]);

// &ModuleEnd; @311
endmodule


