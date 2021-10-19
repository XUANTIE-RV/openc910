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
module ct_idu_rf_prf_pregfile(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  dp_prf_rf_pipe0_src0_preg,
  dp_prf_rf_pipe0_src1_preg,
  dp_prf_rf_pipe1_src0_preg,
  dp_prf_rf_pipe1_src1_preg,
  dp_prf_rf_pipe2_src0_preg,
  dp_prf_rf_pipe2_src1_preg,
  dp_prf_rf_pipe3_src0_preg,
  dp_prf_rf_pipe3_src1_preg,
  dp_prf_rf_pipe4_src0_preg,
  dp_prf_rf_pipe4_src1_preg,
  dp_prf_rf_pipe5_src0_preg,
  forever_cpuclk,
  idu_had_wb_data,
  idu_had_wb_vld,
  iu_idu_ex2_pipe0_wb_preg_data,
  iu_idu_ex2_pipe0_wb_preg_expand,
  iu_idu_ex2_pipe0_wb_preg_vld,
  iu_idu_ex2_pipe1_wb_preg_data,
  iu_idu_ex2_pipe1_wb_preg_expand,
  iu_idu_ex2_pipe1_wb_preg_vld,
  lsu_idu_wb_pipe3_wb_preg_data,
  lsu_idu_wb_pipe3_wb_preg_expand,
  lsu_idu_wb_pipe3_wb_preg_vld,
  pad_yy_icg_scan_en,
  prf_dp_rf_pipe0_src0_data,
  prf_dp_rf_pipe0_src1_data,
  prf_dp_rf_pipe2_src0_data,
  prf_dp_rf_pipe2_src1_data,
  prf_dp_rf_pipe3_src0_data,
  prf_dp_rf_pipe3_src1_data,
  prf_dp_rf_pipe4_src0_data,
  prf_dp_rf_pipe4_src1_data,
  prf_dp_rf_pipe5_src0_data,
  prf_xx_rf_pipe1_src0_data,
  prf_xx_rf_pipe1_src1_data,
  rtu_yy_xx_dbgon
);

// &Ports; @26
input           cp0_idu_icg_en;                 
input           cp0_yy_clk_en;                  
input   [6 :0]  dp_prf_rf_pipe0_src0_preg;      
input   [6 :0]  dp_prf_rf_pipe0_src1_preg;      
input   [6 :0]  dp_prf_rf_pipe1_src0_preg;      
input   [6 :0]  dp_prf_rf_pipe1_src1_preg;      
input   [6 :0]  dp_prf_rf_pipe2_src0_preg;      
input   [6 :0]  dp_prf_rf_pipe2_src1_preg;      
input   [6 :0]  dp_prf_rf_pipe3_src0_preg;      
input   [6 :0]  dp_prf_rf_pipe3_src1_preg;      
input   [6 :0]  dp_prf_rf_pipe4_src0_preg;      
input   [6 :0]  dp_prf_rf_pipe4_src1_preg;      
input   [6 :0]  dp_prf_rf_pipe5_src0_preg;      
input           forever_cpuclk;                 
input   [63:0]  iu_idu_ex2_pipe0_wb_preg_data;  
input   [95:0]  iu_idu_ex2_pipe0_wb_preg_expand; 
input           iu_idu_ex2_pipe0_wb_preg_vld;   
input   [63:0]  iu_idu_ex2_pipe1_wb_preg_data;  
input   [95:0]  iu_idu_ex2_pipe1_wb_preg_expand; 
input           iu_idu_ex2_pipe1_wb_preg_vld;   
input   [63:0]  lsu_idu_wb_pipe3_wb_preg_data;  
input   [95:0]  lsu_idu_wb_pipe3_wb_preg_expand; 
input           lsu_idu_wb_pipe3_wb_preg_vld;   
input           pad_yy_icg_scan_en;             
input           rtu_yy_xx_dbgon;                
output  [63:0]  idu_had_wb_data;                
output          idu_had_wb_vld;                 
output  [63:0]  prf_dp_rf_pipe0_src0_data;      
output  [63:0]  prf_dp_rf_pipe0_src1_data;      
output  [63:0]  prf_dp_rf_pipe2_src0_data;      
output  [63:0]  prf_dp_rf_pipe2_src1_data;      
output  [63:0]  prf_dp_rf_pipe3_src0_data;      
output  [63:0]  prf_dp_rf_pipe3_src1_data;      
output  [63:0]  prf_dp_rf_pipe4_src0_data;      
output  [63:0]  prf_dp_rf_pipe4_src1_data;      
output  [63:0]  prf_dp_rf_pipe5_src0_data;      
output  [63:0]  prf_xx_rf_pipe1_src0_data;      
output  [63:0]  prf_xx_rf_pipe1_src1_data;      

// &Regs; @27
reg     [63:0]  prf_dp_rf_pipe0_src0_data;      
reg     [63:0]  prf_dp_rf_pipe0_src1_data;      
reg     [63:0]  prf_dp_rf_pipe2_src0_data;      
reg     [63:0]  prf_dp_rf_pipe2_src1_data;      
reg     [63:0]  prf_dp_rf_pipe3_src0_data;      
reg     [63:0]  prf_dp_rf_pipe3_src1_data;      
reg     [63:0]  prf_dp_rf_pipe4_src0_data;      
reg     [63:0]  prf_dp_rf_pipe4_src1_data;      
reg     [63:0]  prf_dp_rf_pipe5_src0_data;      
reg     [63:0]  prf_xx_rf_pipe1_src0_data;      
reg     [63:0]  prf_xx_rf_pipe1_src1_data;      

// &Wires; @28
wire            cp0_idu_icg_en;                 
wire            cp0_yy_clk_en;                  
wire    [6 :0]  dp_prf_rf_pipe0_src0_preg;      
wire    [6 :0]  dp_prf_rf_pipe0_src1_preg;      
wire    [6 :0]  dp_prf_rf_pipe1_src0_preg;      
wire    [6 :0]  dp_prf_rf_pipe1_src1_preg;      
wire    [6 :0]  dp_prf_rf_pipe2_src0_preg;      
wire    [6 :0]  dp_prf_rf_pipe2_src1_preg;      
wire    [6 :0]  dp_prf_rf_pipe3_src0_preg;      
wire    [6 :0]  dp_prf_rf_pipe3_src1_preg;      
wire    [6 :0]  dp_prf_rf_pipe4_src0_preg;      
wire    [6 :0]  dp_prf_rf_pipe4_src1_preg;      
wire    [6 :0]  dp_prf_rf_pipe5_src0_preg;      
wire            forever_cpuclk;                 
wire    [63:0]  idu_had_wb_data;                
wire            idu_had_wb_vld;                 
wire    [63:0]  iu_idu_ex2_pipe0_wb_preg_data;  
wire    [95:0]  iu_idu_ex2_pipe0_wb_preg_expand; 
wire            iu_idu_ex2_pipe0_wb_preg_vld;   
wire    [63:0]  iu_idu_ex2_pipe1_wb_preg_data;  
wire    [95:0]  iu_idu_ex2_pipe1_wb_preg_expand; 
wire            iu_idu_ex2_pipe1_wb_preg_vld;   
wire    [63:0]  lsu_idu_wb_pipe3_wb_preg_data;  
wire    [95:0]  lsu_idu_wb_pipe3_wb_preg_expand; 
wire            lsu_idu_wb_pipe3_wb_preg_vld;   
wire            pad_yy_icg_scan_en;             
wire    [95:0]  pipe0_wb_vld;                   
wire    [95:0]  pipe1_wb_vld;                   
wire    [95:0]  pipe3_wb_vld;                   
wire    [63:0]  preg0_reg_dout;                 
wire    [2 :0]  preg0_wb_vld;                   
wire    [63:0]  preg10_reg_dout;                
wire    [2 :0]  preg10_wb_vld;                  
wire    [63:0]  preg11_reg_dout;                
wire    [2 :0]  preg11_wb_vld;                  
wire    [63:0]  preg12_reg_dout;                
wire    [2 :0]  preg12_wb_vld;                  
wire    [63:0]  preg13_reg_dout;                
wire    [2 :0]  preg13_wb_vld;                  
wire    [63:0]  preg14_reg_dout;                
wire    [2 :0]  preg14_wb_vld;                  
wire    [63:0]  preg15_reg_dout;                
wire    [2 :0]  preg15_wb_vld;                  
wire    [63:0]  preg16_reg_dout;                
wire    [2 :0]  preg16_wb_vld;                  
wire    [63:0]  preg17_reg_dout;                
wire    [2 :0]  preg17_wb_vld;                  
wire    [63:0]  preg18_reg_dout;                
wire    [2 :0]  preg18_wb_vld;                  
wire    [63:0]  preg19_reg_dout;                
wire    [2 :0]  preg19_wb_vld;                  
wire    [63:0]  preg1_reg_dout;                 
wire    [2 :0]  preg1_wb_vld;                   
wire    [63:0]  preg20_reg_dout;                
wire    [2 :0]  preg20_wb_vld;                  
wire    [63:0]  preg21_reg_dout;                
wire    [2 :0]  preg21_wb_vld;                  
wire    [63:0]  preg22_reg_dout;                
wire    [2 :0]  preg22_wb_vld;                  
wire    [63:0]  preg23_reg_dout;                
wire    [2 :0]  preg23_wb_vld;                  
wire    [63:0]  preg24_reg_dout;                
wire    [2 :0]  preg24_wb_vld;                  
wire    [63:0]  preg25_reg_dout;                
wire    [2 :0]  preg25_wb_vld;                  
wire    [63:0]  preg26_reg_dout;                
wire    [2 :0]  preg26_wb_vld;                  
wire    [63:0]  preg27_reg_dout;                
wire    [2 :0]  preg27_wb_vld;                  
wire    [63:0]  preg28_reg_dout;                
wire    [2 :0]  preg28_wb_vld;                  
wire    [63:0]  preg29_reg_dout;                
wire    [2 :0]  preg29_wb_vld;                  
wire    [63:0]  preg2_reg_dout;                 
wire    [2 :0]  preg2_wb_vld;                   
wire    [63:0]  preg30_reg_dout;                
wire    [2 :0]  preg30_wb_vld;                  
wire    [63:0]  preg31_reg_dout;                
wire    [2 :0]  preg31_wb_vld;                  
wire    [63:0]  preg32_reg_dout;                
wire    [2 :0]  preg32_wb_vld;                  
wire    [63:0]  preg33_reg_dout;                
wire    [2 :0]  preg33_wb_vld;                  
wire    [63:0]  preg34_reg_dout;                
wire    [2 :0]  preg34_wb_vld;                  
wire    [63:0]  preg35_reg_dout;                
wire    [2 :0]  preg35_wb_vld;                  
wire    [63:0]  preg36_reg_dout;                
wire    [2 :0]  preg36_wb_vld;                  
wire    [63:0]  preg37_reg_dout;                
wire    [2 :0]  preg37_wb_vld;                  
wire    [63:0]  preg38_reg_dout;                
wire    [2 :0]  preg38_wb_vld;                  
wire    [63:0]  preg39_reg_dout;                
wire    [2 :0]  preg39_wb_vld;                  
wire    [63:0]  preg3_reg_dout;                 
wire    [2 :0]  preg3_wb_vld;                   
wire    [63:0]  preg40_reg_dout;                
wire    [2 :0]  preg40_wb_vld;                  
wire    [63:0]  preg41_reg_dout;                
wire    [2 :0]  preg41_wb_vld;                  
wire    [63:0]  preg42_reg_dout;                
wire    [2 :0]  preg42_wb_vld;                  
wire    [63:0]  preg43_reg_dout;                
wire    [2 :0]  preg43_wb_vld;                  
wire    [63:0]  preg44_reg_dout;                
wire    [2 :0]  preg44_wb_vld;                  
wire    [63:0]  preg45_reg_dout;                
wire    [2 :0]  preg45_wb_vld;                  
wire    [63:0]  preg46_reg_dout;                
wire    [2 :0]  preg46_wb_vld;                  
wire    [63:0]  preg47_reg_dout;                
wire    [2 :0]  preg47_wb_vld;                  
wire    [63:0]  preg48_reg_dout;                
wire    [2 :0]  preg48_wb_vld;                  
wire    [63:0]  preg49_reg_dout;                
wire    [2 :0]  preg49_wb_vld;                  
wire    [63:0]  preg4_reg_dout;                 
wire    [2 :0]  preg4_wb_vld;                   
wire    [63:0]  preg50_reg_dout;                
wire    [2 :0]  preg50_wb_vld;                  
wire    [63:0]  preg51_reg_dout;                
wire    [2 :0]  preg51_wb_vld;                  
wire    [63:0]  preg52_reg_dout;                
wire    [2 :0]  preg52_wb_vld;                  
wire    [63:0]  preg53_reg_dout;                
wire    [2 :0]  preg53_wb_vld;                  
wire    [63:0]  preg54_reg_dout;                
wire    [2 :0]  preg54_wb_vld;                  
wire    [63:0]  preg55_reg_dout;                
wire    [2 :0]  preg55_wb_vld;                  
wire    [63:0]  preg56_reg_dout;                
wire    [2 :0]  preg56_wb_vld;                  
wire    [63:0]  preg57_reg_dout;                
wire    [2 :0]  preg57_wb_vld;                  
wire    [63:0]  preg58_reg_dout;                
wire    [2 :0]  preg58_wb_vld;                  
wire    [63:0]  preg59_reg_dout;                
wire    [2 :0]  preg59_wb_vld;                  
wire    [63:0]  preg5_reg_dout;                 
wire    [2 :0]  preg5_wb_vld;                   
wire    [63:0]  preg60_reg_dout;                
wire    [2 :0]  preg60_wb_vld;                  
wire    [63:0]  preg61_reg_dout;                
wire    [2 :0]  preg61_wb_vld;                  
wire    [63:0]  preg62_reg_dout;                
wire    [2 :0]  preg62_wb_vld;                  
wire    [63:0]  preg63_reg_dout;                
wire    [2 :0]  preg63_wb_vld;                  
wire    [63:0]  preg64_reg_dout;                
wire    [2 :0]  preg64_wb_vld;                  
wire    [63:0]  preg65_reg_dout;                
wire    [2 :0]  preg65_wb_vld;                  
wire    [63:0]  preg66_reg_dout;                
wire    [2 :0]  preg66_wb_vld;                  
wire    [63:0]  preg67_reg_dout;                
wire    [2 :0]  preg67_wb_vld;                  
wire    [63:0]  preg68_reg_dout;                
wire    [2 :0]  preg68_wb_vld;                  
wire    [63:0]  preg69_reg_dout;                
wire    [2 :0]  preg69_wb_vld;                  
wire    [63:0]  preg6_reg_dout;                 
wire    [2 :0]  preg6_wb_vld;                   
wire    [63:0]  preg70_reg_dout;                
wire    [2 :0]  preg70_wb_vld;                  
wire    [63:0]  preg71_reg_dout;                
wire    [2 :0]  preg71_wb_vld;                  
wire    [63:0]  preg72_reg_dout;                
wire    [2 :0]  preg72_wb_vld;                  
wire    [63:0]  preg73_reg_dout;                
wire    [2 :0]  preg73_wb_vld;                  
wire    [63:0]  preg74_reg_dout;                
wire    [2 :0]  preg74_wb_vld;                  
wire    [63:0]  preg75_reg_dout;                
wire    [2 :0]  preg75_wb_vld;                  
wire    [63:0]  preg76_reg_dout;                
wire    [2 :0]  preg76_wb_vld;                  
wire    [63:0]  preg77_reg_dout;                
wire    [2 :0]  preg77_wb_vld;                  
wire    [63:0]  preg78_reg_dout;                
wire    [2 :0]  preg78_wb_vld;                  
wire    [63:0]  preg79_reg_dout;                
wire    [2 :0]  preg79_wb_vld;                  
wire    [63:0]  preg7_reg_dout;                 
wire    [2 :0]  preg7_wb_vld;                   
wire    [63:0]  preg80_reg_dout;                
wire    [2 :0]  preg80_wb_vld;                  
wire    [63:0]  preg81_reg_dout;                
wire    [2 :0]  preg81_wb_vld;                  
wire    [63:0]  preg82_reg_dout;                
wire    [2 :0]  preg82_wb_vld;                  
wire    [63:0]  preg83_reg_dout;                
wire    [2 :0]  preg83_wb_vld;                  
wire    [63:0]  preg84_reg_dout;                
wire    [2 :0]  preg84_wb_vld;                  
wire    [63:0]  preg85_reg_dout;                
wire    [2 :0]  preg85_wb_vld;                  
wire    [63:0]  preg86_reg_dout;                
wire    [2 :0]  preg86_wb_vld;                  
wire    [63:0]  preg87_reg_dout;                
wire    [2 :0]  preg87_wb_vld;                  
wire    [63:0]  preg88_reg_dout;                
wire    [2 :0]  preg88_wb_vld;                  
wire    [63:0]  preg89_reg_dout;                
wire    [2 :0]  preg89_wb_vld;                  
wire    [63:0]  preg8_reg_dout;                 
wire    [2 :0]  preg8_wb_vld;                   
wire    [63:0]  preg90_reg_dout;                
wire    [2 :0]  preg90_wb_vld;                  
wire    [63:0]  preg91_reg_dout;                
wire    [2 :0]  preg91_wb_vld;                  
wire    [63:0]  preg92_reg_dout;                
wire    [2 :0]  preg92_wb_vld;                  
wire    [63:0]  preg93_reg_dout;                
wire    [2 :0]  preg93_wb_vld;                  
wire    [63:0]  preg94_reg_dout;                
wire    [2 :0]  preg94_wb_vld;                  
wire    [63:0]  preg95_reg_dout;                
wire    [2 :0]  preg95_wb_vld;                  
wire    [63:0]  preg9_reg_dout;                 
wire    [2 :0]  preg9_wb_vld;                   
wire            rtu_yy_xx_dbgon;                



//==========================================================
//              Instance GPR Physical Registers
//==========================================================
//----------------------------------------------------------
//                         Preg 0
//----------------------------------------------------------
//treat preg0 as constant 0
// &Force ("nonport","preg0_wb_vld"); @38
assign preg0_reg_dout[63:0] = 64'b0;

//----------------------------------------------------------
//                       Other Pregs
//----------------------------------------------------------
// &ConnRule(s/^x_/preg1_/); @44
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg1"); @45
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg1 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg1_reg_dout               ),
  .x_wb_vld                      (preg1_wb_vld                 )
);

// &ConnRule(s/^x_/preg2_/); @46
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg2"); @47
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg2 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg2_reg_dout               ),
  .x_wb_vld                      (preg2_wb_vld                 )
);

// &ConnRule(s/^x_/preg3_/); @48
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg3"); @49
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg3 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg3_reg_dout               ),
  .x_wb_vld                      (preg3_wb_vld                 )
);

// &ConnRule(s/^x_/preg4_/); @50
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg4"); @51
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg4 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg4_reg_dout               ),
  .x_wb_vld                      (preg4_wb_vld                 )
);

// &ConnRule(s/^x_/preg5_/); @52
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg5"); @53
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg5 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg5_reg_dout               ),
  .x_wb_vld                      (preg5_wb_vld                 )
);

// &ConnRule(s/^x_/preg6_/); @54
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg6"); @55
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg6 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg6_reg_dout               ),
  .x_wb_vld                      (preg6_wb_vld                 )
);

// &ConnRule(s/^x_/preg7_/); @56
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg7"); @57
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg7 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg7_reg_dout               ),
  .x_wb_vld                      (preg7_wb_vld                 )
);

// &ConnRule(s/^x_/preg8_/); @58
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg8"); @59
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg8 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg8_reg_dout               ),
  .x_wb_vld                      (preg8_wb_vld                 )
);

// &ConnRule(s/^x_/preg9_/); @60
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg9"); @61
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg9 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg9_reg_dout               ),
  .x_wb_vld                      (preg9_wb_vld                 )
);

// &ConnRule(s/^x_/preg10_/); @62
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg10"); @63
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg10 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg10_reg_dout              ),
  .x_wb_vld                      (preg10_wb_vld                )
);

// &ConnRule(s/^x_/preg11_/); @64
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg11"); @65
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg11 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg11_reg_dout              ),
  .x_wb_vld                      (preg11_wb_vld                )
);

// &ConnRule(s/^x_/preg12_/); @66
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg12"); @67
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg12 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg12_reg_dout              ),
  .x_wb_vld                      (preg12_wb_vld                )
);

// &ConnRule(s/^x_/preg13_/); @68
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg13"); @69
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg13 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg13_reg_dout              ),
  .x_wb_vld                      (preg13_wb_vld                )
);

// &ConnRule(s/^x_/preg14_/); @70
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg14"); @71
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg14 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg14_reg_dout              ),
  .x_wb_vld                      (preg14_wb_vld                )
);

// &ConnRule(s/^x_/preg15_/); @72
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg15"); @73
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg15 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg15_reg_dout              ),
  .x_wb_vld                      (preg15_wb_vld                )
);

// &ConnRule(s/^x_/preg16_/); @74
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg16"); @75
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg16 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg16_reg_dout              ),
  .x_wb_vld                      (preg16_wb_vld                )
);

// &ConnRule(s/^x_/preg17_/); @76
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg17"); @77
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg17 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg17_reg_dout              ),
  .x_wb_vld                      (preg17_wb_vld                )
);

// &ConnRule(s/^x_/preg18_/); @78
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg18"); @79
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg18 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg18_reg_dout              ),
  .x_wb_vld                      (preg18_wb_vld                )
);

// &ConnRule(s/^x_/preg19_/); @80
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg19"); @81
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg19 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg19_reg_dout              ),
  .x_wb_vld                      (preg19_wb_vld                )
);

// &ConnRule(s/^x_/preg20_/); @82
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg20"); @83
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg20 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg20_reg_dout              ),
  .x_wb_vld                      (preg20_wb_vld                )
);

// &ConnRule(s/^x_/preg21_/); @84
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg21"); @85
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg21 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg21_reg_dout              ),
  .x_wb_vld                      (preg21_wb_vld                )
);

// &ConnRule(s/^x_/preg22_/); @86
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg22"); @87
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg22 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg22_reg_dout              ),
  .x_wb_vld                      (preg22_wb_vld                )
);

// &ConnRule(s/^x_/preg23_/); @88
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg23"); @89
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg23 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg23_reg_dout              ),
  .x_wb_vld                      (preg23_wb_vld                )
);

// &ConnRule(s/^x_/preg24_/); @90
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg24"); @91
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg24 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg24_reg_dout              ),
  .x_wb_vld                      (preg24_wb_vld                )
);

// &ConnRule(s/^x_/preg25_/); @92
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg25"); @93
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg25 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg25_reg_dout              ),
  .x_wb_vld                      (preg25_wb_vld                )
);

// &ConnRule(s/^x_/preg26_/); @94
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg26"); @95
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg26 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg26_reg_dout              ),
  .x_wb_vld                      (preg26_wb_vld                )
);

// &ConnRule(s/^x_/preg27_/); @96
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg27"); @97
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg27 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg27_reg_dout              ),
  .x_wb_vld                      (preg27_wb_vld                )
);

// &ConnRule(s/^x_/preg28_/); @98
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg28"); @99
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg28 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg28_reg_dout              ),
  .x_wb_vld                      (preg28_wb_vld                )
);

// &ConnRule(s/^x_/preg29_/); @100
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg29"); @101
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg29 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg29_reg_dout              ),
  .x_wb_vld                      (preg29_wb_vld                )
);

// &ConnRule(s/^x_/preg30_/); @102
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg30"); @103
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg30 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg30_reg_dout              ),
  .x_wb_vld                      (preg30_wb_vld                )
);

// &ConnRule(s/^x_/preg31_/); @104
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg31"); @105
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg31 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg31_reg_dout              ),
  .x_wb_vld                      (preg31_wb_vld                )
);

// &ConnRule(s/^x_/preg32_/); @106
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg32"); @107
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg32 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg32_reg_dout              ),
  .x_wb_vld                      (preg32_wb_vld                )
);

// &ConnRule(s/^x_/preg33_/); @108
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg33"); @109
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg33 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg33_reg_dout              ),
  .x_wb_vld                      (preg33_wb_vld                )
);

// &ConnRule(s/^x_/preg34_/); @110
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg34"); @111
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg34 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg34_reg_dout              ),
  .x_wb_vld                      (preg34_wb_vld                )
);

// &ConnRule(s/^x_/preg35_/); @112
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg35"); @113
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg35 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg35_reg_dout              ),
  .x_wb_vld                      (preg35_wb_vld                )
);

// &ConnRule(s/^x_/preg36_/); @114
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg36"); @115
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg36 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg36_reg_dout              ),
  .x_wb_vld                      (preg36_wb_vld                )
);

// &ConnRule(s/^x_/preg37_/); @116
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg37"); @117
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg37 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg37_reg_dout              ),
  .x_wb_vld                      (preg37_wb_vld                )
);

// &ConnRule(s/^x_/preg38_/); @118
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg38"); @119
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg38 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg38_reg_dout              ),
  .x_wb_vld                      (preg38_wb_vld                )
);

// &ConnRule(s/^x_/preg39_/); @120
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg39"); @121
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg39 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg39_reg_dout              ),
  .x_wb_vld                      (preg39_wb_vld                )
);

// &ConnRule(s/^x_/preg40_/); @122
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg40"); @123
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg40 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg40_reg_dout              ),
  .x_wb_vld                      (preg40_wb_vld                )
);

// &ConnRule(s/^x_/preg41_/); @124
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg41"); @125
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg41 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg41_reg_dout              ),
  .x_wb_vld                      (preg41_wb_vld                )
);

// &ConnRule(s/^x_/preg42_/); @126
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg42"); @127
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg42 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg42_reg_dout              ),
  .x_wb_vld                      (preg42_wb_vld                )
);

// &ConnRule(s/^x_/preg43_/); @128
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg43"); @129
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg43 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg43_reg_dout              ),
  .x_wb_vld                      (preg43_wb_vld                )
);

// &ConnRule(s/^x_/preg44_/); @130
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg44"); @131
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg44 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg44_reg_dout              ),
  .x_wb_vld                      (preg44_wb_vld                )
);

// &ConnRule(s/^x_/preg45_/); @132
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg45"); @133
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg45 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg45_reg_dout              ),
  .x_wb_vld                      (preg45_wb_vld                )
);

// &ConnRule(s/^x_/preg46_/); @134
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg46"); @135
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg46 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg46_reg_dout              ),
  .x_wb_vld                      (preg46_wb_vld                )
);

// &ConnRule(s/^x_/preg47_/); @136
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg47"); @137
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg47 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg47_reg_dout              ),
  .x_wb_vld                      (preg47_wb_vld                )
);

// &ConnRule(s/^x_/preg48_/); @138
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg48"); @139
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg48 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg48_reg_dout              ),
  .x_wb_vld                      (preg48_wb_vld                )
);

// &ConnRule(s/^x_/preg49_/); @140
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg49"); @141
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg49 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg49_reg_dout              ),
  .x_wb_vld                      (preg49_wb_vld                )
);

// &ConnRule(s/^x_/preg50_/); @142
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg50"); @143
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg50 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg50_reg_dout              ),
  .x_wb_vld                      (preg50_wb_vld                )
);

// &ConnRule(s/^x_/preg51_/); @144
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg51"); @145
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg51 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg51_reg_dout              ),
  .x_wb_vld                      (preg51_wb_vld                )
);

// &ConnRule(s/^x_/preg52_/); @146
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg52"); @147
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg52 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg52_reg_dout              ),
  .x_wb_vld                      (preg52_wb_vld                )
);

// &ConnRule(s/^x_/preg53_/); @148
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg53"); @149
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg53 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg53_reg_dout              ),
  .x_wb_vld                      (preg53_wb_vld                )
);

// &ConnRule(s/^x_/preg54_/); @150
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg54"); @151
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg54 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg54_reg_dout              ),
  .x_wb_vld                      (preg54_wb_vld                )
);

// &ConnRule(s/^x_/preg55_/); @152
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg55"); @153
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg55 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg55_reg_dout              ),
  .x_wb_vld                      (preg55_wb_vld                )
);

// &ConnRule(s/^x_/preg56_/); @154
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg56"); @155
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg56 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg56_reg_dout              ),
  .x_wb_vld                      (preg56_wb_vld                )
);

// &ConnRule(s/^x_/preg57_/); @156
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg57"); @157
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg57 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg57_reg_dout              ),
  .x_wb_vld                      (preg57_wb_vld                )
);

// &ConnRule(s/^x_/preg58_/); @158
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg58"); @159
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg58 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg58_reg_dout              ),
  .x_wb_vld                      (preg58_wb_vld                )
);

// &ConnRule(s/^x_/preg59_/); @160
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg59"); @161
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg59 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg59_reg_dout              ),
  .x_wb_vld                      (preg59_wb_vld                )
);

// &ConnRule(s/^x_/preg60_/); @162
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg60"); @163
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg60 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg60_reg_dout              ),
  .x_wb_vld                      (preg60_wb_vld                )
);

// &ConnRule(s/^x_/preg61_/); @164
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg61"); @165
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg61 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg61_reg_dout              ),
  .x_wb_vld                      (preg61_wb_vld                )
);

// &ConnRule(s/^x_/preg62_/); @166
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg62"); @167
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg62 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg62_reg_dout              ),
  .x_wb_vld                      (preg62_wb_vld                )
);

// &ConnRule(s/^x_/preg63_/); @168
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg63"); @169
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg63 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg63_reg_dout              ),
  .x_wb_vld                      (preg63_wb_vld                )
);

// &ConnRule(s/^x_/preg64_/); @170
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg64"); @171
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg64 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg64_reg_dout              ),
  .x_wb_vld                      (preg64_wb_vld                )
);

// &ConnRule(s/^x_/preg65_/); @172
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg65"); @173
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg65 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg65_reg_dout              ),
  .x_wb_vld                      (preg65_wb_vld                )
);

// &ConnRule(s/^x_/preg66_/); @174
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg66"); @175
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg66 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg66_reg_dout              ),
  .x_wb_vld                      (preg66_wb_vld                )
);

// &ConnRule(s/^x_/preg67_/); @176
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg67"); @177
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg67 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg67_reg_dout              ),
  .x_wb_vld                      (preg67_wb_vld                )
);

// &ConnRule(s/^x_/preg68_/); @178
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg68"); @179
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg68 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg68_reg_dout              ),
  .x_wb_vld                      (preg68_wb_vld                )
);

// &ConnRule(s/^x_/preg69_/); @180
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg69"); @181
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg69 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg69_reg_dout              ),
  .x_wb_vld                      (preg69_wb_vld                )
);

// &ConnRule(s/^x_/preg70_/); @182
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg70"); @183
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg70 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg70_reg_dout              ),
  .x_wb_vld                      (preg70_wb_vld                )
);

// &ConnRule(s/^x_/preg71_/); @184
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg71"); @185
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg71 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg71_reg_dout              ),
  .x_wb_vld                      (preg71_wb_vld                )
);

// &ConnRule(s/^x_/preg72_/); @186
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg72"); @187
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg72 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg72_reg_dout              ),
  .x_wb_vld                      (preg72_wb_vld                )
);

// &ConnRule(s/^x_/preg73_/); @188
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg73"); @189
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg73 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg73_reg_dout              ),
  .x_wb_vld                      (preg73_wb_vld                )
);

// &ConnRule(s/^x_/preg74_/); @190
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg74"); @191
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg74 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg74_reg_dout              ),
  .x_wb_vld                      (preg74_wb_vld                )
);

// &ConnRule(s/^x_/preg75_/); @192
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg75"); @193
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg75 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg75_reg_dout              ),
  .x_wb_vld                      (preg75_wb_vld                )
);

// &ConnRule(s/^x_/preg76_/); @194
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg76"); @195
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg76 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg76_reg_dout              ),
  .x_wb_vld                      (preg76_wb_vld                )
);

// &ConnRule(s/^x_/preg77_/); @196
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg77"); @197
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg77 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg77_reg_dout              ),
  .x_wb_vld                      (preg77_wb_vld                )
);

// &ConnRule(s/^x_/preg78_/); @198
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg78"); @199
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg78 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg78_reg_dout              ),
  .x_wb_vld                      (preg78_wb_vld                )
);

// &ConnRule(s/^x_/preg79_/); @200
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg79"); @201
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg79 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg79_reg_dout              ),
  .x_wb_vld                      (preg79_wb_vld                )
);

// &ConnRule(s/^x_/preg80_/); @202
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg80"); @203
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg80 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg80_reg_dout              ),
  .x_wb_vld                      (preg80_wb_vld                )
);

// &ConnRule(s/^x_/preg81_/); @204
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg81"); @205
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg81 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg81_reg_dout              ),
  .x_wb_vld                      (preg81_wb_vld                )
);

// &ConnRule(s/^x_/preg82_/); @206
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg82"); @207
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg82 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg82_reg_dout              ),
  .x_wb_vld                      (preg82_wb_vld                )
);

// &ConnRule(s/^x_/preg83_/); @208
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg83"); @209
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg83 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg83_reg_dout              ),
  .x_wb_vld                      (preg83_wb_vld                )
);

// &ConnRule(s/^x_/preg84_/); @210
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg84"); @211
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg84 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg84_reg_dout              ),
  .x_wb_vld                      (preg84_wb_vld                )
);

// &ConnRule(s/^x_/preg85_/); @212
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg85"); @213
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg85 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg85_reg_dout              ),
  .x_wb_vld                      (preg85_wb_vld                )
);

// &ConnRule(s/^x_/preg86_/); @214
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg86"); @215
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg86 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg86_reg_dout              ),
  .x_wb_vld                      (preg86_wb_vld                )
);

// &ConnRule(s/^x_/preg87_/); @216
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg87"); @217
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg87 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg87_reg_dout              ),
  .x_wb_vld                      (preg87_wb_vld                )
);

// &ConnRule(s/^x_/preg88_/); @218
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg88"); @219
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg88 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg88_reg_dout              ),
  .x_wb_vld                      (preg88_wb_vld                )
);

// &ConnRule(s/^x_/preg89_/); @220
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg89"); @221
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg89 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg89_reg_dout              ),
  .x_wb_vld                      (preg89_wb_vld                )
);

// &ConnRule(s/^x_/preg90_/); @222
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg90"); @223
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg90 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg90_reg_dout              ),
  .x_wb_vld                      (preg90_wb_vld                )
);

// &ConnRule(s/^x_/preg91_/); @224
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg91"); @225
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg91 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg91_reg_dout              ),
  .x_wb_vld                      (preg91_wb_vld                )
);

// &ConnRule(s/^x_/preg92_/); @226
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg92"); @227
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg92 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg92_reg_dout              ),
  .x_wb_vld                      (preg92_wb_vld                )
);

// &ConnRule(s/^x_/preg93_/); @228
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg93"); @229
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg93 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg93_reg_dout              ),
  .x_wb_vld                      (preg93_wb_vld                )
);

// &ConnRule(s/^x_/preg94_/); @230
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg94"); @231
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg94 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg94_reg_dout              ),
  .x_wb_vld                      (preg94_wb_vld                )
);

// &ConnRule(s/^x_/preg95_/); @232
// &Instance("ct_idu_rf_prf_gated_preg", "x_ct_idu_rf_prf_preg95"); @233
ct_idu_rf_prf_gated_preg  x_ct_idu_rf_prf_preg95 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .forever_cpuclk                (forever_cpuclk               ),
  .iu_idu_ex2_pipe0_wb_preg_data (iu_idu_ex2_pipe0_wb_preg_data),
  .iu_idu_ex2_pipe1_wb_preg_data (iu_idu_ex2_pipe1_wb_preg_data),
  .lsu_idu_wb_pipe3_wb_preg_data (lsu_idu_wb_pipe3_wb_preg_data),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .x_reg_dout                    (preg95_reg_dout              ),
  .x_wb_vld                      (preg95_wb_vld                )
);


//==========================================================
//                       Write Port 
//==========================================================
//3 write ports
assign pipe0_wb_vld[95:0] = {96{iu_idu_ex2_pipe0_wb_preg_vld}}
                            & iu_idu_ex2_pipe0_wb_preg_expand[95:0];
assign pipe1_wb_vld[95:0] = {96{iu_idu_ex2_pipe1_wb_preg_vld}}
                            & iu_idu_ex2_pipe1_wb_preg_expand[95:0];
assign pipe3_wb_vld[95:0] = {96{lsu_idu_wb_pipe3_wb_preg_vld}}
                            & lsu_idu_wb_pipe3_wb_preg_expand[95:0];

assign preg0_wb_vld[2:0]  = {pipe3_wb_vld[0], pipe1_wb_vld[0], pipe0_wb_vld[0]};
assign preg1_wb_vld[2:0]  = {pipe3_wb_vld[1], pipe1_wb_vld[1], pipe0_wb_vld[1]};
assign preg2_wb_vld[2:0]  = {pipe3_wb_vld[2], pipe1_wb_vld[2], pipe0_wb_vld[2]};
assign preg3_wb_vld[2:0]  = {pipe3_wb_vld[3], pipe1_wb_vld[3], pipe0_wb_vld[3]};
assign preg4_wb_vld[2:0]  = {pipe3_wb_vld[4], pipe1_wb_vld[4], pipe0_wb_vld[4]};
assign preg5_wb_vld[2:0]  = {pipe3_wb_vld[5], pipe1_wb_vld[5], pipe0_wb_vld[5]};
assign preg6_wb_vld[2:0]  = {pipe3_wb_vld[6], pipe1_wb_vld[6], pipe0_wb_vld[6]};
assign preg7_wb_vld[2:0]  = {pipe3_wb_vld[7], pipe1_wb_vld[7], pipe0_wb_vld[7]};
assign preg8_wb_vld[2:0]  = {pipe3_wb_vld[8], pipe1_wb_vld[8], pipe0_wb_vld[8]};
assign preg9_wb_vld[2:0]  = {pipe3_wb_vld[9], pipe1_wb_vld[9], pipe0_wb_vld[9]};
assign preg10_wb_vld[2:0] = {pipe3_wb_vld[10],pipe1_wb_vld[10],pipe0_wb_vld[10]};
assign preg11_wb_vld[2:0] = {pipe3_wb_vld[11],pipe1_wb_vld[11],pipe0_wb_vld[11]};
assign preg12_wb_vld[2:0] = {pipe3_wb_vld[12],pipe1_wb_vld[12],pipe0_wb_vld[12]};
assign preg13_wb_vld[2:0] = {pipe3_wb_vld[13],pipe1_wb_vld[13],pipe0_wb_vld[13]};
assign preg14_wb_vld[2:0] = {pipe3_wb_vld[14],pipe1_wb_vld[14],pipe0_wb_vld[14]};
assign preg15_wb_vld[2:0] = {pipe3_wb_vld[15],pipe1_wb_vld[15],pipe0_wb_vld[15]};
assign preg16_wb_vld[2:0] = {pipe3_wb_vld[16],pipe1_wb_vld[16],pipe0_wb_vld[16]};
assign preg17_wb_vld[2:0] = {pipe3_wb_vld[17],pipe1_wb_vld[17],pipe0_wb_vld[17]};
assign preg18_wb_vld[2:0] = {pipe3_wb_vld[18],pipe1_wb_vld[18],pipe0_wb_vld[18]};
assign preg19_wb_vld[2:0] = {pipe3_wb_vld[19],pipe1_wb_vld[19],pipe0_wb_vld[19]};
assign preg20_wb_vld[2:0] = {pipe3_wb_vld[20],pipe1_wb_vld[20],pipe0_wb_vld[20]};
assign preg21_wb_vld[2:0] = {pipe3_wb_vld[21],pipe1_wb_vld[21],pipe0_wb_vld[21]};
assign preg22_wb_vld[2:0] = {pipe3_wb_vld[22],pipe1_wb_vld[22],pipe0_wb_vld[22]};
assign preg23_wb_vld[2:0] = {pipe3_wb_vld[23],pipe1_wb_vld[23],pipe0_wb_vld[23]};
assign preg24_wb_vld[2:0] = {pipe3_wb_vld[24],pipe1_wb_vld[24],pipe0_wb_vld[24]};
assign preg25_wb_vld[2:0] = {pipe3_wb_vld[25],pipe1_wb_vld[25],pipe0_wb_vld[25]};
assign preg26_wb_vld[2:0] = {pipe3_wb_vld[26],pipe1_wb_vld[26],pipe0_wb_vld[26]};
assign preg27_wb_vld[2:0] = {pipe3_wb_vld[27],pipe1_wb_vld[27],pipe0_wb_vld[27]};
assign preg28_wb_vld[2:0] = {pipe3_wb_vld[28],pipe1_wb_vld[28],pipe0_wb_vld[28]};
assign preg29_wb_vld[2:0] = {pipe3_wb_vld[29],pipe1_wb_vld[29],pipe0_wb_vld[29]};
assign preg30_wb_vld[2:0] = {pipe3_wb_vld[30],pipe1_wb_vld[30],pipe0_wb_vld[30]};
assign preg31_wb_vld[2:0] = {pipe3_wb_vld[31],pipe1_wb_vld[31],pipe0_wb_vld[31]};
assign preg32_wb_vld[2:0] = {pipe3_wb_vld[32],pipe1_wb_vld[32],pipe0_wb_vld[32]};
assign preg33_wb_vld[2:0] = {pipe3_wb_vld[33],pipe1_wb_vld[33],pipe0_wb_vld[33]};
assign preg34_wb_vld[2:0] = {pipe3_wb_vld[34],pipe1_wb_vld[34],pipe0_wb_vld[34]};
assign preg35_wb_vld[2:0] = {pipe3_wb_vld[35],pipe1_wb_vld[35],pipe0_wb_vld[35]};
assign preg36_wb_vld[2:0] = {pipe3_wb_vld[36],pipe1_wb_vld[36],pipe0_wb_vld[36]};
assign preg37_wb_vld[2:0] = {pipe3_wb_vld[37],pipe1_wb_vld[37],pipe0_wb_vld[37]};
assign preg38_wb_vld[2:0] = {pipe3_wb_vld[38],pipe1_wb_vld[38],pipe0_wb_vld[38]};
assign preg39_wb_vld[2:0] = {pipe3_wb_vld[39],pipe1_wb_vld[39],pipe0_wb_vld[39]};
assign preg40_wb_vld[2:0] = {pipe3_wb_vld[40],pipe1_wb_vld[40],pipe0_wb_vld[40]};
assign preg41_wb_vld[2:0] = {pipe3_wb_vld[41],pipe1_wb_vld[41],pipe0_wb_vld[41]};
assign preg42_wb_vld[2:0] = {pipe3_wb_vld[42],pipe1_wb_vld[42],pipe0_wb_vld[42]};
assign preg43_wb_vld[2:0] = {pipe3_wb_vld[43],pipe1_wb_vld[43],pipe0_wb_vld[43]};
assign preg44_wb_vld[2:0] = {pipe3_wb_vld[44],pipe1_wb_vld[44],pipe0_wb_vld[44]};
assign preg45_wb_vld[2:0] = {pipe3_wb_vld[45],pipe1_wb_vld[45],pipe0_wb_vld[45]};
assign preg46_wb_vld[2:0] = {pipe3_wb_vld[46],pipe1_wb_vld[46],pipe0_wb_vld[46]};
assign preg47_wb_vld[2:0] = {pipe3_wb_vld[47],pipe1_wb_vld[47],pipe0_wb_vld[47]};
assign preg48_wb_vld[2:0] = {pipe3_wb_vld[48],pipe1_wb_vld[48],pipe0_wb_vld[48]};
assign preg49_wb_vld[2:0] = {pipe3_wb_vld[49],pipe1_wb_vld[49],pipe0_wb_vld[49]};
assign preg50_wb_vld[2:0] = {pipe3_wb_vld[50],pipe1_wb_vld[50],pipe0_wb_vld[50]};
assign preg51_wb_vld[2:0] = {pipe3_wb_vld[51],pipe1_wb_vld[51],pipe0_wb_vld[51]};
assign preg52_wb_vld[2:0] = {pipe3_wb_vld[52],pipe1_wb_vld[52],pipe0_wb_vld[52]};
assign preg53_wb_vld[2:0] = {pipe3_wb_vld[53],pipe1_wb_vld[53],pipe0_wb_vld[53]};
assign preg54_wb_vld[2:0] = {pipe3_wb_vld[54],pipe1_wb_vld[54],pipe0_wb_vld[54]};
assign preg55_wb_vld[2:0] = {pipe3_wb_vld[55],pipe1_wb_vld[55],pipe0_wb_vld[55]};
assign preg56_wb_vld[2:0] = {pipe3_wb_vld[56],pipe1_wb_vld[56],pipe0_wb_vld[56]};
assign preg57_wb_vld[2:0] = {pipe3_wb_vld[57],pipe1_wb_vld[57],pipe0_wb_vld[57]};
assign preg58_wb_vld[2:0] = {pipe3_wb_vld[58],pipe1_wb_vld[58],pipe0_wb_vld[58]};
assign preg59_wb_vld[2:0] = {pipe3_wb_vld[59],pipe1_wb_vld[59],pipe0_wb_vld[59]};
assign preg60_wb_vld[2:0] = {pipe3_wb_vld[60],pipe1_wb_vld[60],pipe0_wb_vld[60]};
assign preg61_wb_vld[2:0] = {pipe3_wb_vld[61],pipe1_wb_vld[61],pipe0_wb_vld[61]};
assign preg62_wb_vld[2:0] = {pipe3_wb_vld[62],pipe1_wb_vld[62],pipe0_wb_vld[62]};
assign preg63_wb_vld[2:0] = {pipe3_wb_vld[63],pipe1_wb_vld[63],pipe0_wb_vld[63]};
assign preg64_wb_vld[2:0] = {pipe3_wb_vld[64],pipe1_wb_vld[64],pipe0_wb_vld[64]};
assign preg65_wb_vld[2:0] = {pipe3_wb_vld[65],pipe1_wb_vld[65],pipe0_wb_vld[65]};
assign preg66_wb_vld[2:0] = {pipe3_wb_vld[66],pipe1_wb_vld[66],pipe0_wb_vld[66]};
assign preg67_wb_vld[2:0] = {pipe3_wb_vld[67],pipe1_wb_vld[67],pipe0_wb_vld[67]};
assign preg68_wb_vld[2:0] = {pipe3_wb_vld[68],pipe1_wb_vld[68],pipe0_wb_vld[68]};
assign preg69_wb_vld[2:0] = {pipe3_wb_vld[69],pipe1_wb_vld[69],pipe0_wb_vld[69]};
assign preg70_wb_vld[2:0] = {pipe3_wb_vld[70],pipe1_wb_vld[70],pipe0_wb_vld[70]};
assign preg71_wb_vld[2:0] = {pipe3_wb_vld[71],pipe1_wb_vld[71],pipe0_wb_vld[71]};
assign preg72_wb_vld[2:0] = {pipe3_wb_vld[72],pipe1_wb_vld[72],pipe0_wb_vld[72]};
assign preg73_wb_vld[2:0] = {pipe3_wb_vld[73],pipe1_wb_vld[73],pipe0_wb_vld[73]};
assign preg74_wb_vld[2:0] = {pipe3_wb_vld[74],pipe1_wb_vld[74],pipe0_wb_vld[74]};
assign preg75_wb_vld[2:0] = {pipe3_wb_vld[75],pipe1_wb_vld[75],pipe0_wb_vld[75]};
assign preg76_wb_vld[2:0] = {pipe3_wb_vld[76],pipe1_wb_vld[76],pipe0_wb_vld[76]};
assign preg77_wb_vld[2:0] = {pipe3_wb_vld[77],pipe1_wb_vld[77],pipe0_wb_vld[77]};
assign preg78_wb_vld[2:0] = {pipe3_wb_vld[78],pipe1_wb_vld[78],pipe0_wb_vld[78]};
assign preg79_wb_vld[2:0] = {pipe3_wb_vld[79],pipe1_wb_vld[79],pipe0_wb_vld[79]};
assign preg80_wb_vld[2:0] = {pipe3_wb_vld[80],pipe1_wb_vld[80],pipe0_wb_vld[80]};
assign preg81_wb_vld[2:0] = {pipe3_wb_vld[81],pipe1_wb_vld[81],pipe0_wb_vld[81]};
assign preg82_wb_vld[2:0] = {pipe3_wb_vld[82],pipe1_wb_vld[82],pipe0_wb_vld[82]};
assign preg83_wb_vld[2:0] = {pipe3_wb_vld[83],pipe1_wb_vld[83],pipe0_wb_vld[83]};
assign preg84_wb_vld[2:0] = {pipe3_wb_vld[84],pipe1_wb_vld[84],pipe0_wb_vld[84]};
assign preg85_wb_vld[2:0] = {pipe3_wb_vld[85],pipe1_wb_vld[85],pipe0_wb_vld[85]};
assign preg86_wb_vld[2:0] = {pipe3_wb_vld[86],pipe1_wb_vld[86],pipe0_wb_vld[86]};
assign preg87_wb_vld[2:0] = {pipe3_wb_vld[87],pipe1_wb_vld[87],pipe0_wb_vld[87]};
assign preg88_wb_vld[2:0] = {pipe3_wb_vld[88],pipe1_wb_vld[88],pipe0_wb_vld[88]};
assign preg89_wb_vld[2:0] = {pipe3_wb_vld[89],pipe1_wb_vld[89],pipe0_wb_vld[89]};
assign preg90_wb_vld[2:0] = {pipe3_wb_vld[90],pipe1_wb_vld[90],pipe0_wb_vld[90]};
assign preg91_wb_vld[2:0] = {pipe3_wb_vld[91],pipe1_wb_vld[91],pipe0_wb_vld[91]};
assign preg92_wb_vld[2:0] = {pipe3_wb_vld[92],pipe1_wb_vld[92],pipe0_wb_vld[92]};
assign preg93_wb_vld[2:0] = {pipe3_wb_vld[93],pipe1_wb_vld[93],pipe0_wb_vld[93]};
assign preg94_wb_vld[2:0] = {pipe3_wb_vld[94],pipe1_wb_vld[94],pipe0_wb_vld[94]};
assign preg95_wb_vld[2:0] = {pipe3_wb_vld[95],pipe1_wb_vld[95],pipe0_wb_vld[95]};

//==========================================================
//                       Write Port 
//==========================================================
assign idu_had_wb_vld = rtu_yy_xx_dbgon
                        && (iu_idu_ex2_pipe0_wb_preg_vld
                         || iu_idu_ex2_pipe1_wb_preg_vld
                         || lsu_idu_wb_pipe3_wb_preg_vld);
assign idu_had_wb_data[63:0] =
           {64{iu_idu_ex2_pipe0_wb_preg_vld}} & iu_idu_ex2_pipe0_wb_preg_data[63:0]
         | {64{iu_idu_ex2_pipe1_wb_preg_vld}} & iu_idu_ex2_pipe1_wb_preg_data[63:0]
         | {64{lsu_idu_wb_pipe3_wb_preg_vld}} & lsu_idu_wb_pipe3_wb_preg_data[63:0];

//==========================================================
//                       Read Port 
//==========================================================

//----------------------------------------------------------
//                 Read Port 1: pipe0 src0
//----------------------------------------------------------
// &CombBeg; @362
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or dp_prf_rf_pipe0_src0_preg[6:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe0_src0_preg[6:0])
    7'd0   : prf_dp_rf_pipe0_src0_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe0_src0_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe0_src0_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe0_src0_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe0_src0_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe0_src0_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe0_src0_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe0_src0_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe0_src0_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe0_src0_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe0_src0_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe0_src0_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe0_src0_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe0_src0_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe0_src0_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe0_src0_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe0_src0_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe0_src0_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe0_src0_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe0_src0_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe0_src0_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe0_src0_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe0_src0_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe0_src0_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe0_src0_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe0_src0_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe0_src0_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe0_src0_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe0_src0_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe0_src0_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe0_src0_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe0_src0_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe0_src0_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe0_src0_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe0_src0_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe0_src0_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe0_src0_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe0_src0_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe0_src0_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe0_src0_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe0_src0_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe0_src0_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe0_src0_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe0_src0_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe0_src0_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe0_src0_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe0_src0_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe0_src0_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe0_src0_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe0_src0_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe0_src0_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe0_src0_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe0_src0_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe0_src0_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe0_src0_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe0_src0_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe0_src0_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe0_src0_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe0_src0_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe0_src0_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe0_src0_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe0_src0_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe0_src0_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe0_src0_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe0_src0_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe0_src0_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe0_src0_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe0_src0_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe0_src0_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe0_src0_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe0_src0_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe0_src0_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe0_src0_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe0_src0_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe0_src0_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe0_src0_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe0_src0_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe0_src0_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe0_src0_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe0_src0_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe0_src0_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe0_src0_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe0_src0_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe0_src0_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe0_src0_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe0_src0_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe0_src0_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe0_src0_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe0_src0_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe0_src0_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe0_src0_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe0_src0_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe0_src0_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe0_src0_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe0_src0_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe0_src0_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe0_src0_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @462
end

//----------------------------------------------------------
//                 Read Port 2: pipe0 src1
//----------------------------------------------------------
// &CombBeg; @467
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or dp_prf_rf_pipe0_src1_preg[6:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe0_src1_preg[6:0])
    7'd0   : prf_dp_rf_pipe0_src1_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe0_src1_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe0_src1_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe0_src1_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe0_src1_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe0_src1_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe0_src1_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe0_src1_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe0_src1_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe0_src1_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe0_src1_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe0_src1_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe0_src1_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe0_src1_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe0_src1_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe0_src1_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe0_src1_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe0_src1_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe0_src1_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe0_src1_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe0_src1_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe0_src1_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe0_src1_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe0_src1_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe0_src1_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe0_src1_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe0_src1_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe0_src1_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe0_src1_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe0_src1_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe0_src1_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe0_src1_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe0_src1_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe0_src1_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe0_src1_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe0_src1_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe0_src1_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe0_src1_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe0_src1_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe0_src1_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe0_src1_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe0_src1_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe0_src1_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe0_src1_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe0_src1_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe0_src1_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe0_src1_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe0_src1_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe0_src1_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe0_src1_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe0_src1_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe0_src1_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe0_src1_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe0_src1_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe0_src1_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe0_src1_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe0_src1_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe0_src1_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe0_src1_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe0_src1_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe0_src1_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe0_src1_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe0_src1_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe0_src1_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe0_src1_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe0_src1_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe0_src1_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe0_src1_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe0_src1_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe0_src1_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe0_src1_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe0_src1_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe0_src1_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe0_src1_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe0_src1_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe0_src1_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe0_src1_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe0_src1_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe0_src1_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe0_src1_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe0_src1_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe0_src1_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe0_src1_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe0_src1_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe0_src1_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe0_src1_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe0_src1_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe0_src1_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe0_src1_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe0_src1_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe0_src1_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe0_src1_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe0_src1_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe0_src1_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe0_src1_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe0_src1_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe0_src1_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @567
end

//----------------------------------------------------------
//                 Read Port 3: pipe1 src0
//----------------------------------------------------------
// &CombBeg; @572
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or dp_prf_rf_pipe1_src0_preg[6:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe1_src0_preg[6:0])
    7'd0   : prf_xx_rf_pipe1_src0_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_xx_rf_pipe1_src0_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_xx_rf_pipe1_src0_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_xx_rf_pipe1_src0_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_xx_rf_pipe1_src0_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_xx_rf_pipe1_src0_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_xx_rf_pipe1_src0_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_xx_rf_pipe1_src0_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_xx_rf_pipe1_src0_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_xx_rf_pipe1_src0_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_xx_rf_pipe1_src0_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_xx_rf_pipe1_src0_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_xx_rf_pipe1_src0_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_xx_rf_pipe1_src0_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_xx_rf_pipe1_src0_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_xx_rf_pipe1_src0_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_xx_rf_pipe1_src0_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_xx_rf_pipe1_src0_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_xx_rf_pipe1_src0_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_xx_rf_pipe1_src0_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_xx_rf_pipe1_src0_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_xx_rf_pipe1_src0_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_xx_rf_pipe1_src0_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_xx_rf_pipe1_src0_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_xx_rf_pipe1_src0_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_xx_rf_pipe1_src0_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_xx_rf_pipe1_src0_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_xx_rf_pipe1_src0_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_xx_rf_pipe1_src0_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_xx_rf_pipe1_src0_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_xx_rf_pipe1_src0_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_xx_rf_pipe1_src0_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_xx_rf_pipe1_src0_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_xx_rf_pipe1_src0_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_xx_rf_pipe1_src0_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_xx_rf_pipe1_src0_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_xx_rf_pipe1_src0_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_xx_rf_pipe1_src0_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_xx_rf_pipe1_src0_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_xx_rf_pipe1_src0_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_xx_rf_pipe1_src0_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_xx_rf_pipe1_src0_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_xx_rf_pipe1_src0_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_xx_rf_pipe1_src0_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_xx_rf_pipe1_src0_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_xx_rf_pipe1_src0_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_xx_rf_pipe1_src0_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_xx_rf_pipe1_src0_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_xx_rf_pipe1_src0_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_xx_rf_pipe1_src0_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_xx_rf_pipe1_src0_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_xx_rf_pipe1_src0_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_xx_rf_pipe1_src0_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_xx_rf_pipe1_src0_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_xx_rf_pipe1_src0_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_xx_rf_pipe1_src0_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_xx_rf_pipe1_src0_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_xx_rf_pipe1_src0_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_xx_rf_pipe1_src0_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_xx_rf_pipe1_src0_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_xx_rf_pipe1_src0_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_xx_rf_pipe1_src0_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_xx_rf_pipe1_src0_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_xx_rf_pipe1_src0_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_xx_rf_pipe1_src0_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_xx_rf_pipe1_src0_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_xx_rf_pipe1_src0_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_xx_rf_pipe1_src0_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_xx_rf_pipe1_src0_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_xx_rf_pipe1_src0_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_xx_rf_pipe1_src0_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_xx_rf_pipe1_src0_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_xx_rf_pipe1_src0_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_xx_rf_pipe1_src0_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_xx_rf_pipe1_src0_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_xx_rf_pipe1_src0_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_xx_rf_pipe1_src0_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_xx_rf_pipe1_src0_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_xx_rf_pipe1_src0_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_xx_rf_pipe1_src0_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_xx_rf_pipe1_src0_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_xx_rf_pipe1_src0_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_xx_rf_pipe1_src0_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_xx_rf_pipe1_src0_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_xx_rf_pipe1_src0_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_xx_rf_pipe1_src0_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_xx_rf_pipe1_src0_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_xx_rf_pipe1_src0_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_xx_rf_pipe1_src0_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_xx_rf_pipe1_src0_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_xx_rf_pipe1_src0_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_xx_rf_pipe1_src0_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_xx_rf_pipe1_src0_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_xx_rf_pipe1_src0_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_xx_rf_pipe1_src0_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_xx_rf_pipe1_src0_data[63:0] = preg95_reg_dout[63:0];
    default: prf_xx_rf_pipe1_src0_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @672
end

//----------------------------------------------------------
//                 Read Port 4: pipe1 src1
//----------------------------------------------------------
// &CombBeg; @677
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or dp_prf_rf_pipe1_src1_preg[6:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe1_src1_preg[6:0])
    7'd0   : prf_xx_rf_pipe1_src1_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_xx_rf_pipe1_src1_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_xx_rf_pipe1_src1_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_xx_rf_pipe1_src1_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_xx_rf_pipe1_src1_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_xx_rf_pipe1_src1_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_xx_rf_pipe1_src1_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_xx_rf_pipe1_src1_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_xx_rf_pipe1_src1_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_xx_rf_pipe1_src1_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_xx_rf_pipe1_src1_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_xx_rf_pipe1_src1_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_xx_rf_pipe1_src1_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_xx_rf_pipe1_src1_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_xx_rf_pipe1_src1_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_xx_rf_pipe1_src1_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_xx_rf_pipe1_src1_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_xx_rf_pipe1_src1_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_xx_rf_pipe1_src1_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_xx_rf_pipe1_src1_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_xx_rf_pipe1_src1_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_xx_rf_pipe1_src1_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_xx_rf_pipe1_src1_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_xx_rf_pipe1_src1_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_xx_rf_pipe1_src1_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_xx_rf_pipe1_src1_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_xx_rf_pipe1_src1_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_xx_rf_pipe1_src1_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_xx_rf_pipe1_src1_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_xx_rf_pipe1_src1_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_xx_rf_pipe1_src1_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_xx_rf_pipe1_src1_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_xx_rf_pipe1_src1_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_xx_rf_pipe1_src1_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_xx_rf_pipe1_src1_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_xx_rf_pipe1_src1_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_xx_rf_pipe1_src1_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_xx_rf_pipe1_src1_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_xx_rf_pipe1_src1_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_xx_rf_pipe1_src1_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_xx_rf_pipe1_src1_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_xx_rf_pipe1_src1_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_xx_rf_pipe1_src1_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_xx_rf_pipe1_src1_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_xx_rf_pipe1_src1_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_xx_rf_pipe1_src1_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_xx_rf_pipe1_src1_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_xx_rf_pipe1_src1_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_xx_rf_pipe1_src1_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_xx_rf_pipe1_src1_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_xx_rf_pipe1_src1_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_xx_rf_pipe1_src1_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_xx_rf_pipe1_src1_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_xx_rf_pipe1_src1_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_xx_rf_pipe1_src1_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_xx_rf_pipe1_src1_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_xx_rf_pipe1_src1_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_xx_rf_pipe1_src1_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_xx_rf_pipe1_src1_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_xx_rf_pipe1_src1_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_xx_rf_pipe1_src1_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_xx_rf_pipe1_src1_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_xx_rf_pipe1_src1_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_xx_rf_pipe1_src1_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_xx_rf_pipe1_src1_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_xx_rf_pipe1_src1_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_xx_rf_pipe1_src1_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_xx_rf_pipe1_src1_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_xx_rf_pipe1_src1_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_xx_rf_pipe1_src1_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_xx_rf_pipe1_src1_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_xx_rf_pipe1_src1_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_xx_rf_pipe1_src1_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_xx_rf_pipe1_src1_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_xx_rf_pipe1_src1_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_xx_rf_pipe1_src1_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_xx_rf_pipe1_src1_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_xx_rf_pipe1_src1_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_xx_rf_pipe1_src1_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_xx_rf_pipe1_src1_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_xx_rf_pipe1_src1_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_xx_rf_pipe1_src1_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_xx_rf_pipe1_src1_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_xx_rf_pipe1_src1_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_xx_rf_pipe1_src1_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_xx_rf_pipe1_src1_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_xx_rf_pipe1_src1_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_xx_rf_pipe1_src1_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_xx_rf_pipe1_src1_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_xx_rf_pipe1_src1_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_xx_rf_pipe1_src1_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_xx_rf_pipe1_src1_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_xx_rf_pipe1_src1_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_xx_rf_pipe1_src1_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_xx_rf_pipe1_src1_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_xx_rf_pipe1_src1_data[63:0] = preg95_reg_dout[63:0];
    default: prf_xx_rf_pipe1_src1_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @777
end

//----------------------------------------------------------
//                 Read Port 5: pipe2 src0
//----------------------------------------------------------
// &CombBeg; @782
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or dp_prf_rf_pipe2_src0_preg[6:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe2_src0_preg[6:0])
    7'd0   : prf_dp_rf_pipe2_src0_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe2_src0_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe2_src0_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe2_src0_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe2_src0_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe2_src0_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe2_src0_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe2_src0_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe2_src0_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe2_src0_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe2_src0_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe2_src0_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe2_src0_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe2_src0_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe2_src0_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe2_src0_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe2_src0_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe2_src0_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe2_src0_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe2_src0_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe2_src0_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe2_src0_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe2_src0_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe2_src0_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe2_src0_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe2_src0_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe2_src0_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe2_src0_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe2_src0_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe2_src0_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe2_src0_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe2_src0_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe2_src0_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe2_src0_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe2_src0_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe2_src0_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe2_src0_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe2_src0_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe2_src0_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe2_src0_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe2_src0_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe2_src0_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe2_src0_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe2_src0_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe2_src0_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe2_src0_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe2_src0_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe2_src0_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe2_src0_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe2_src0_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe2_src0_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe2_src0_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe2_src0_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe2_src0_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe2_src0_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe2_src0_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe2_src0_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe2_src0_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe2_src0_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe2_src0_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe2_src0_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe2_src0_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe2_src0_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe2_src0_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe2_src0_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe2_src0_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe2_src0_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe2_src0_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe2_src0_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe2_src0_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe2_src0_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe2_src0_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe2_src0_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe2_src0_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe2_src0_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe2_src0_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe2_src0_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe2_src0_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe2_src0_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe2_src0_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe2_src0_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe2_src0_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe2_src0_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe2_src0_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe2_src0_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe2_src0_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe2_src0_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe2_src0_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe2_src0_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe2_src0_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe2_src0_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe2_src0_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe2_src0_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe2_src0_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe2_src0_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe2_src0_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe2_src0_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @882
end

//----------------------------------------------------------
//                 Read Port 6: pipe2 src1
//----------------------------------------------------------
// &CombBeg; @887
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or dp_prf_rf_pipe2_src1_preg[6:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe2_src1_preg[6:0])
    7'd0   : prf_dp_rf_pipe2_src1_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe2_src1_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe2_src1_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe2_src1_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe2_src1_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe2_src1_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe2_src1_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe2_src1_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe2_src1_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe2_src1_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe2_src1_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe2_src1_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe2_src1_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe2_src1_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe2_src1_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe2_src1_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe2_src1_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe2_src1_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe2_src1_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe2_src1_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe2_src1_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe2_src1_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe2_src1_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe2_src1_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe2_src1_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe2_src1_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe2_src1_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe2_src1_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe2_src1_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe2_src1_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe2_src1_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe2_src1_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe2_src1_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe2_src1_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe2_src1_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe2_src1_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe2_src1_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe2_src1_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe2_src1_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe2_src1_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe2_src1_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe2_src1_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe2_src1_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe2_src1_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe2_src1_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe2_src1_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe2_src1_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe2_src1_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe2_src1_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe2_src1_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe2_src1_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe2_src1_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe2_src1_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe2_src1_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe2_src1_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe2_src1_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe2_src1_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe2_src1_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe2_src1_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe2_src1_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe2_src1_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe2_src1_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe2_src1_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe2_src1_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe2_src1_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe2_src1_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe2_src1_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe2_src1_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe2_src1_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe2_src1_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe2_src1_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe2_src1_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe2_src1_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe2_src1_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe2_src1_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe2_src1_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe2_src1_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe2_src1_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe2_src1_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe2_src1_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe2_src1_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe2_src1_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe2_src1_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe2_src1_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe2_src1_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe2_src1_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe2_src1_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe2_src1_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe2_src1_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe2_src1_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe2_src1_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe2_src1_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe2_src1_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe2_src1_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe2_src1_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe2_src1_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe2_src1_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @987
end

//----------------------------------------------------------
//                 Read Port 7: pipe3 src0
//----------------------------------------------------------
// &CombBeg; @992
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or dp_prf_rf_pipe3_src0_preg[6:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe3_src0_preg[6:0])
    7'd0   : prf_dp_rf_pipe3_src0_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe3_src0_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe3_src0_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe3_src0_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe3_src0_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe3_src0_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe3_src0_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe3_src0_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe3_src0_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe3_src0_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe3_src0_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe3_src0_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe3_src0_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe3_src0_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe3_src0_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe3_src0_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe3_src0_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe3_src0_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe3_src0_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe3_src0_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe3_src0_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe3_src0_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe3_src0_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe3_src0_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe3_src0_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe3_src0_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe3_src0_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe3_src0_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe3_src0_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe3_src0_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe3_src0_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe3_src0_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe3_src0_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe3_src0_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe3_src0_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe3_src0_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe3_src0_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe3_src0_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe3_src0_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe3_src0_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe3_src0_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe3_src0_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe3_src0_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe3_src0_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe3_src0_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe3_src0_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe3_src0_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe3_src0_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe3_src0_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe3_src0_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe3_src0_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe3_src0_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe3_src0_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe3_src0_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe3_src0_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe3_src0_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe3_src0_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe3_src0_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe3_src0_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe3_src0_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe3_src0_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe3_src0_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe3_src0_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe3_src0_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe3_src0_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe3_src0_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe3_src0_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe3_src0_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe3_src0_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe3_src0_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe3_src0_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe3_src0_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe3_src0_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe3_src0_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe3_src0_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe3_src0_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe3_src0_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe3_src0_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe3_src0_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe3_src0_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe3_src0_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe3_src0_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe3_src0_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe3_src0_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe3_src0_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe3_src0_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe3_src0_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe3_src0_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe3_src0_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe3_src0_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe3_src0_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe3_src0_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe3_src0_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe3_src0_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe3_src0_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe3_src0_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe3_src0_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @1092
end

//----------------------------------------------------------
//                 Read Port 8: pipe3 src1
//----------------------------------------------------------
// &CombBeg; @1097
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or dp_prf_rf_pipe3_src1_preg[6:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe3_src1_preg[6:0])
    7'd0   : prf_dp_rf_pipe3_src1_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe3_src1_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe3_src1_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe3_src1_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe3_src1_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe3_src1_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe3_src1_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe3_src1_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe3_src1_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe3_src1_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe3_src1_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe3_src1_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe3_src1_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe3_src1_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe3_src1_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe3_src1_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe3_src1_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe3_src1_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe3_src1_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe3_src1_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe3_src1_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe3_src1_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe3_src1_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe3_src1_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe3_src1_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe3_src1_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe3_src1_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe3_src1_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe3_src1_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe3_src1_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe3_src1_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe3_src1_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe3_src1_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe3_src1_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe3_src1_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe3_src1_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe3_src1_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe3_src1_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe3_src1_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe3_src1_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe3_src1_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe3_src1_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe3_src1_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe3_src1_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe3_src1_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe3_src1_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe3_src1_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe3_src1_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe3_src1_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe3_src1_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe3_src1_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe3_src1_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe3_src1_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe3_src1_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe3_src1_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe3_src1_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe3_src1_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe3_src1_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe3_src1_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe3_src1_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe3_src1_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe3_src1_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe3_src1_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe3_src1_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe3_src1_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe3_src1_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe3_src1_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe3_src1_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe3_src1_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe3_src1_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe3_src1_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe3_src1_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe3_src1_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe3_src1_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe3_src1_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe3_src1_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe3_src1_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe3_src1_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe3_src1_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe3_src1_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe3_src1_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe3_src1_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe3_src1_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe3_src1_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe3_src1_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe3_src1_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe3_src1_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe3_src1_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe3_src1_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe3_src1_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe3_src1_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe3_src1_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe3_src1_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe3_src1_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe3_src1_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe3_src1_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe3_src1_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @1197
end

//----------------------------------------------------------
//                 Read Port 9: pipe4 src0
//----------------------------------------------------------
// &CombBeg; @1202
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or dp_prf_rf_pipe4_src0_preg[6:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe4_src0_preg[6:0])
    7'd0   : prf_dp_rf_pipe4_src0_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe4_src0_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe4_src0_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe4_src0_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe4_src0_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe4_src0_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe4_src0_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe4_src0_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe4_src0_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe4_src0_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe4_src0_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe4_src0_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe4_src0_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe4_src0_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe4_src0_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe4_src0_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe4_src0_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe4_src0_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe4_src0_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe4_src0_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe4_src0_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe4_src0_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe4_src0_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe4_src0_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe4_src0_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe4_src0_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe4_src0_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe4_src0_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe4_src0_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe4_src0_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe4_src0_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe4_src0_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe4_src0_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe4_src0_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe4_src0_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe4_src0_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe4_src0_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe4_src0_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe4_src0_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe4_src0_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe4_src0_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe4_src0_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe4_src0_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe4_src0_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe4_src0_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe4_src0_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe4_src0_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe4_src0_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe4_src0_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe4_src0_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe4_src0_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe4_src0_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe4_src0_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe4_src0_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe4_src0_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe4_src0_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe4_src0_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe4_src0_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe4_src0_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe4_src0_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe4_src0_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe4_src0_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe4_src0_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe4_src0_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe4_src0_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe4_src0_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe4_src0_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe4_src0_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe4_src0_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe4_src0_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe4_src0_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe4_src0_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe4_src0_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe4_src0_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe4_src0_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe4_src0_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe4_src0_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe4_src0_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe4_src0_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe4_src0_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe4_src0_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe4_src0_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe4_src0_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe4_src0_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe4_src0_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe4_src0_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe4_src0_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe4_src0_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe4_src0_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe4_src0_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe4_src0_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe4_src0_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe4_src0_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe4_src0_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe4_src0_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe4_src0_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe4_src0_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @1302
end

//----------------------------------------------------------
//                 Read Port 9: pipe4 src1
//----------------------------------------------------------
// &CombBeg; @1307
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or dp_prf_rf_pipe4_src1_preg[6:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe4_src1_preg[6:0])
    7'd0   : prf_dp_rf_pipe4_src1_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe4_src1_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe4_src1_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe4_src1_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe4_src1_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe4_src1_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe4_src1_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe4_src1_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe4_src1_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe4_src1_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe4_src1_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe4_src1_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe4_src1_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe4_src1_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe4_src1_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe4_src1_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe4_src1_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe4_src1_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe4_src1_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe4_src1_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe4_src1_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe4_src1_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe4_src1_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe4_src1_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe4_src1_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe4_src1_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe4_src1_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe4_src1_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe4_src1_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe4_src1_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe4_src1_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe4_src1_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe4_src1_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe4_src1_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe4_src1_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe4_src1_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe4_src1_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe4_src1_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe4_src1_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe4_src1_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe4_src1_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe4_src1_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe4_src1_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe4_src1_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe4_src1_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe4_src1_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe4_src1_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe4_src1_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe4_src1_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe4_src1_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe4_src1_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe4_src1_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe4_src1_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe4_src1_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe4_src1_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe4_src1_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe4_src1_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe4_src1_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe4_src1_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe4_src1_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe4_src1_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe4_src1_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe4_src1_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe4_src1_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe4_src1_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe4_src1_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe4_src1_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe4_src1_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe4_src1_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe4_src1_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe4_src1_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe4_src1_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe4_src1_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe4_src1_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe4_src1_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe4_src1_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe4_src1_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe4_src1_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe4_src1_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe4_src1_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe4_src1_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe4_src1_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe4_src1_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe4_src1_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe4_src1_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe4_src1_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe4_src1_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe4_src1_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe4_src1_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe4_src1_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe4_src1_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe4_src1_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe4_src1_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe4_src1_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe4_src1_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe4_src1_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe4_src1_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @1407
end

//----------------------------------------------------------
//                 Read Port 10: pipe5 src0
//----------------------------------------------------------
// &CombBeg; @1412
always @( preg60_reg_dout[63:0]
       or preg22_reg_dout[63:0]
       or preg10_reg_dout[63:0]
       or preg89_reg_dout[63:0]
       or preg24_reg_dout[63:0]
       or preg63_reg_dout[63:0]
       or preg38_reg_dout[63:0]
       or preg81_reg_dout[63:0]
       or preg42_reg_dout[63:0]
       or preg14_reg_dout[63:0]
       or preg44_reg_dout[63:0]
       or preg28_reg_dout[63:0]
       or preg93_reg_dout[63:0]
       or preg66_reg_dout[63:0]
       or preg65_reg_dout[63:0]
       or preg12_reg_dout[63:0]
       or dp_prf_rf_pipe5_src0_preg[6:0]
       or preg36_reg_dout[63:0]
       or preg53_reg_dout[63:0]
       or preg70_reg_dout[63:0]
       or preg1_reg_dout[63:0]
       or preg30_reg_dout[63:0]
       or preg29_reg_dout[63:0]
       or preg64_reg_dout[63:0]
       or preg59_reg_dout[63:0]
       or preg83_reg_dout[63:0]
       or preg31_reg_dout[63:0]
       or preg67_reg_dout[63:0]
       or preg48_reg_dout[63:0]
       or preg5_reg_dout[63:0]
       or preg23_reg_dout[63:0]
       or preg80_reg_dout[63:0]
       or preg26_reg_dout[63:0]
       or preg18_reg_dout[63:0]
       or preg69_reg_dout[63:0]
       or preg39_reg_dout[63:0]
       or preg3_reg_dout[63:0]
       or preg57_reg_dout[63:0]
       or preg6_reg_dout[63:0]
       or preg4_reg_dout[63:0]
       or preg7_reg_dout[63:0]
       or preg13_reg_dout[63:0]
       or preg56_reg_dout[63:0]
       or preg0_reg_dout[63:0]
       or preg20_reg_dout[63:0]
       or preg76_reg_dout[63:0]
       or preg91_reg_dout[63:0]
       or preg61_reg_dout[63:0]
       or preg84_reg_dout[63:0]
       or preg11_reg_dout[63:0]
       or preg88_reg_dout[63:0]
       or preg37_reg_dout[63:0]
       or preg45_reg_dout[63:0]
       or preg82_reg_dout[63:0]
       or preg41_reg_dout[63:0]
       or preg2_reg_dout[63:0]
       or preg73_reg_dout[63:0]
       or preg52_reg_dout[63:0]
       or preg15_reg_dout[63:0]
       or preg21_reg_dout[63:0]
       or preg94_reg_dout[63:0]
       or preg9_reg_dout[63:0]
       or preg78_reg_dout[63:0]
       or preg51_reg_dout[63:0]
       or preg68_reg_dout[63:0]
       or preg8_reg_dout[63:0]
       or preg40_reg_dout[63:0]
       or preg77_reg_dout[63:0]
       or preg49_reg_dout[63:0]
       or preg72_reg_dout[63:0]
       or preg17_reg_dout[63:0]
       or preg46_reg_dout[63:0]
       or preg85_reg_dout[63:0]
       or preg75_reg_dout[63:0]
       or preg55_reg_dout[63:0]
       or preg35_reg_dout[63:0]
       or preg74_reg_dout[63:0]
       or preg92_reg_dout[63:0]
       or preg87_reg_dout[63:0]
       or preg50_reg_dout[63:0]
       or preg62_reg_dout[63:0]
       or preg95_reg_dout[63:0]
       or preg54_reg_dout[63:0]
       or preg90_reg_dout[63:0]
       or preg79_reg_dout[63:0]
       or preg32_reg_dout[63:0]
       or preg25_reg_dout[63:0]
       or preg27_reg_dout[63:0]
       or preg34_reg_dout[63:0]
       or preg58_reg_dout[63:0]
       or preg86_reg_dout[63:0]
       or preg19_reg_dout[63:0]
       or preg16_reg_dout[63:0]
       or preg47_reg_dout[63:0]
       or preg71_reg_dout[63:0]
       or preg33_reg_dout[63:0]
       or preg43_reg_dout[63:0])
begin
  case (dp_prf_rf_pipe5_src0_preg[6:0])
    7'd0   : prf_dp_rf_pipe5_src0_data[63:0] = preg0_reg_dout[63:0];
    7'd1   : prf_dp_rf_pipe5_src0_data[63:0] = preg1_reg_dout[63:0];
    7'd2   : prf_dp_rf_pipe5_src0_data[63:0] = preg2_reg_dout[63:0];
    7'd3   : prf_dp_rf_pipe5_src0_data[63:0] = preg3_reg_dout[63:0];
    7'd4   : prf_dp_rf_pipe5_src0_data[63:0] = preg4_reg_dout[63:0];
    7'd5   : prf_dp_rf_pipe5_src0_data[63:0] = preg5_reg_dout[63:0];
    7'd6   : prf_dp_rf_pipe5_src0_data[63:0] = preg6_reg_dout[63:0];
    7'd7   : prf_dp_rf_pipe5_src0_data[63:0] = preg7_reg_dout[63:0];
    7'd8   : prf_dp_rf_pipe5_src0_data[63:0] = preg8_reg_dout[63:0];
    7'd9   : prf_dp_rf_pipe5_src0_data[63:0] = preg9_reg_dout[63:0];
    7'd10  : prf_dp_rf_pipe5_src0_data[63:0] = preg10_reg_dout[63:0];
    7'd11  : prf_dp_rf_pipe5_src0_data[63:0] = preg11_reg_dout[63:0];
    7'd12  : prf_dp_rf_pipe5_src0_data[63:0] = preg12_reg_dout[63:0];
    7'd13  : prf_dp_rf_pipe5_src0_data[63:0] = preg13_reg_dout[63:0];
    7'd14  : prf_dp_rf_pipe5_src0_data[63:0] = preg14_reg_dout[63:0];
    7'd15  : prf_dp_rf_pipe5_src0_data[63:0] = preg15_reg_dout[63:0];
    7'd16  : prf_dp_rf_pipe5_src0_data[63:0] = preg16_reg_dout[63:0];
    7'd17  : prf_dp_rf_pipe5_src0_data[63:0] = preg17_reg_dout[63:0];
    7'd18  : prf_dp_rf_pipe5_src0_data[63:0] = preg18_reg_dout[63:0];
    7'd19  : prf_dp_rf_pipe5_src0_data[63:0] = preg19_reg_dout[63:0];
    7'd20  : prf_dp_rf_pipe5_src0_data[63:0] = preg20_reg_dout[63:0];
    7'd21  : prf_dp_rf_pipe5_src0_data[63:0] = preg21_reg_dout[63:0];
    7'd22  : prf_dp_rf_pipe5_src0_data[63:0] = preg22_reg_dout[63:0];
    7'd23  : prf_dp_rf_pipe5_src0_data[63:0] = preg23_reg_dout[63:0];
    7'd24  : prf_dp_rf_pipe5_src0_data[63:0] = preg24_reg_dout[63:0];
    7'd25  : prf_dp_rf_pipe5_src0_data[63:0] = preg25_reg_dout[63:0];
    7'd26  : prf_dp_rf_pipe5_src0_data[63:0] = preg26_reg_dout[63:0];
    7'd27  : prf_dp_rf_pipe5_src0_data[63:0] = preg27_reg_dout[63:0];
    7'd28  : prf_dp_rf_pipe5_src0_data[63:0] = preg28_reg_dout[63:0];
    7'd29  : prf_dp_rf_pipe5_src0_data[63:0] = preg29_reg_dout[63:0];
    7'd30  : prf_dp_rf_pipe5_src0_data[63:0] = preg30_reg_dout[63:0];
    7'd31  : prf_dp_rf_pipe5_src0_data[63:0] = preg31_reg_dout[63:0];
    7'd32  : prf_dp_rf_pipe5_src0_data[63:0] = preg32_reg_dout[63:0];
    7'd33  : prf_dp_rf_pipe5_src0_data[63:0] = preg33_reg_dout[63:0];
    7'd34  : prf_dp_rf_pipe5_src0_data[63:0] = preg34_reg_dout[63:0];
    7'd35  : prf_dp_rf_pipe5_src0_data[63:0] = preg35_reg_dout[63:0];
    7'd36  : prf_dp_rf_pipe5_src0_data[63:0] = preg36_reg_dout[63:0];
    7'd37  : prf_dp_rf_pipe5_src0_data[63:0] = preg37_reg_dout[63:0];
    7'd38  : prf_dp_rf_pipe5_src0_data[63:0] = preg38_reg_dout[63:0];
    7'd39  : prf_dp_rf_pipe5_src0_data[63:0] = preg39_reg_dout[63:0];
    7'd40  : prf_dp_rf_pipe5_src0_data[63:0] = preg40_reg_dout[63:0];
    7'd41  : prf_dp_rf_pipe5_src0_data[63:0] = preg41_reg_dout[63:0];
    7'd42  : prf_dp_rf_pipe5_src0_data[63:0] = preg42_reg_dout[63:0];
    7'd43  : prf_dp_rf_pipe5_src0_data[63:0] = preg43_reg_dout[63:0];
    7'd44  : prf_dp_rf_pipe5_src0_data[63:0] = preg44_reg_dout[63:0];
    7'd45  : prf_dp_rf_pipe5_src0_data[63:0] = preg45_reg_dout[63:0];
    7'd46  : prf_dp_rf_pipe5_src0_data[63:0] = preg46_reg_dout[63:0];
    7'd47  : prf_dp_rf_pipe5_src0_data[63:0] = preg47_reg_dout[63:0];
    7'd48  : prf_dp_rf_pipe5_src0_data[63:0] = preg48_reg_dout[63:0];
    7'd49  : prf_dp_rf_pipe5_src0_data[63:0] = preg49_reg_dout[63:0];
    7'd50  : prf_dp_rf_pipe5_src0_data[63:0] = preg50_reg_dout[63:0];
    7'd51  : prf_dp_rf_pipe5_src0_data[63:0] = preg51_reg_dout[63:0];
    7'd52  : prf_dp_rf_pipe5_src0_data[63:0] = preg52_reg_dout[63:0];
    7'd53  : prf_dp_rf_pipe5_src0_data[63:0] = preg53_reg_dout[63:0];
    7'd54  : prf_dp_rf_pipe5_src0_data[63:0] = preg54_reg_dout[63:0];
    7'd55  : prf_dp_rf_pipe5_src0_data[63:0] = preg55_reg_dout[63:0];
    7'd56  : prf_dp_rf_pipe5_src0_data[63:0] = preg56_reg_dout[63:0];
    7'd57  : prf_dp_rf_pipe5_src0_data[63:0] = preg57_reg_dout[63:0];
    7'd58  : prf_dp_rf_pipe5_src0_data[63:0] = preg58_reg_dout[63:0];
    7'd59  : prf_dp_rf_pipe5_src0_data[63:0] = preg59_reg_dout[63:0];
    7'd60  : prf_dp_rf_pipe5_src0_data[63:0] = preg60_reg_dout[63:0];
    7'd61  : prf_dp_rf_pipe5_src0_data[63:0] = preg61_reg_dout[63:0];
    7'd62  : prf_dp_rf_pipe5_src0_data[63:0] = preg62_reg_dout[63:0];
    7'd63  : prf_dp_rf_pipe5_src0_data[63:0] = preg63_reg_dout[63:0];
    7'd64  : prf_dp_rf_pipe5_src0_data[63:0] = preg64_reg_dout[63:0];
    7'd65  : prf_dp_rf_pipe5_src0_data[63:0] = preg65_reg_dout[63:0];
    7'd66  : prf_dp_rf_pipe5_src0_data[63:0] = preg66_reg_dout[63:0];
    7'd67  : prf_dp_rf_pipe5_src0_data[63:0] = preg67_reg_dout[63:0];
    7'd68  : prf_dp_rf_pipe5_src0_data[63:0] = preg68_reg_dout[63:0];
    7'd69  : prf_dp_rf_pipe5_src0_data[63:0] = preg69_reg_dout[63:0];
    7'd70  : prf_dp_rf_pipe5_src0_data[63:0] = preg70_reg_dout[63:0];
    7'd71  : prf_dp_rf_pipe5_src0_data[63:0] = preg71_reg_dout[63:0];
    7'd72  : prf_dp_rf_pipe5_src0_data[63:0] = preg72_reg_dout[63:0];
    7'd73  : prf_dp_rf_pipe5_src0_data[63:0] = preg73_reg_dout[63:0];
    7'd74  : prf_dp_rf_pipe5_src0_data[63:0] = preg74_reg_dout[63:0];
    7'd75  : prf_dp_rf_pipe5_src0_data[63:0] = preg75_reg_dout[63:0];
    7'd76  : prf_dp_rf_pipe5_src0_data[63:0] = preg76_reg_dout[63:0];
    7'd77  : prf_dp_rf_pipe5_src0_data[63:0] = preg77_reg_dout[63:0];
    7'd78  : prf_dp_rf_pipe5_src0_data[63:0] = preg78_reg_dout[63:0];
    7'd79  : prf_dp_rf_pipe5_src0_data[63:0] = preg79_reg_dout[63:0];
    7'd80  : prf_dp_rf_pipe5_src0_data[63:0] = preg80_reg_dout[63:0];
    7'd81  : prf_dp_rf_pipe5_src0_data[63:0] = preg81_reg_dout[63:0];
    7'd82  : prf_dp_rf_pipe5_src0_data[63:0] = preg82_reg_dout[63:0];
    7'd83  : prf_dp_rf_pipe5_src0_data[63:0] = preg83_reg_dout[63:0];
    7'd84  : prf_dp_rf_pipe5_src0_data[63:0] = preg84_reg_dout[63:0];
    7'd85  : prf_dp_rf_pipe5_src0_data[63:0] = preg85_reg_dout[63:0];
    7'd86  : prf_dp_rf_pipe5_src0_data[63:0] = preg86_reg_dout[63:0];
    7'd87  : prf_dp_rf_pipe5_src0_data[63:0] = preg87_reg_dout[63:0];
    7'd88  : prf_dp_rf_pipe5_src0_data[63:0] = preg88_reg_dout[63:0];
    7'd89  : prf_dp_rf_pipe5_src0_data[63:0] = preg89_reg_dout[63:0];
    7'd90  : prf_dp_rf_pipe5_src0_data[63:0] = preg90_reg_dout[63:0];
    7'd91  : prf_dp_rf_pipe5_src0_data[63:0] = preg91_reg_dout[63:0];
    7'd92  : prf_dp_rf_pipe5_src0_data[63:0] = preg92_reg_dout[63:0];
    7'd93  : prf_dp_rf_pipe5_src0_data[63:0] = preg93_reg_dout[63:0];
    7'd94  : prf_dp_rf_pipe5_src0_data[63:0] = preg94_reg_dout[63:0];
    7'd95  : prf_dp_rf_pipe5_src0_data[63:0] = preg95_reg_dout[63:0];
    default: prf_dp_rf_pipe5_src0_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @1512
end

// &ModuleEnd; @1536
endmodule


