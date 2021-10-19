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
module ct_vfalu_top_pipe6(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_vfalu_ex1_pipex_func,
  dp_vfalu_ex1_pipex_imm0,
  dp_vfalu_ex1_pipex_mtvr_src0,
  dp_vfalu_ex1_pipex_sel,
  dp_vfalu_ex1_pipex_srcf0,
  dp_vfalu_ex1_pipex_srcf1,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  pipex_dp_ex1_vfalu_mfvr_data,
  pipex_dp_ex3_vfalu_ereg_data,
  pipex_dp_ex3_vfalu_freg_data,
  vfpu_yy_xx_dqnan,
  vfpu_yy_xx_rm
);

// &Ports; @23
input           cp0_vfpu_icg_en;             
input           cp0_yy_clk_en;               
input           cpurst_b;                    
input   [19:0]  dp_vfalu_ex1_pipex_func;     
input   [2 :0]  dp_vfalu_ex1_pipex_imm0;     
input   [63:0]  dp_vfalu_ex1_pipex_mtvr_src0; 
input   [2 :0]  dp_vfalu_ex1_pipex_sel;      
input   [63:0]  dp_vfalu_ex1_pipex_srcf0;    
input   [63:0]  dp_vfalu_ex1_pipex_srcf1;    
input           forever_cpuclk;              
input           pad_yy_icg_scan_en;          
input           vfpu_yy_xx_dqnan;            
input   [2 :0]  vfpu_yy_xx_rm;               
output  [63:0]  pipex_dp_ex1_vfalu_mfvr_data; 
output  [4 :0]  pipex_dp_ex3_vfalu_ereg_data; 
output  [63:0]  pipex_dp_ex3_vfalu_freg_data; 

// &Regs; @24

// &Wires; @25
wire            cp0_vfpu_icg_en;             
wire            cp0_yy_clk_en;               
wire            cpurst_b;                    
wire    [19:0]  dp_vfalu_ex1_pipex_func;     
wire    [2 :0]  dp_vfalu_ex1_pipex_imm0;     
wire    [63:0]  dp_vfalu_ex1_pipex_mtvr_src0; 
wire    [2 :0]  dp_vfalu_ex1_pipex_sel;      
wire    [63:0]  dp_vfalu_ex1_pipex_srcf0;    
wire    [63:0]  dp_vfalu_ex1_pipex_srcf1;    
wire            fadd_ereg_ex3_forward_r_vld; 
wire    [4 :0]  fadd_ereg_ex3_result;        
wire            fadd_forward_r_vld;          
wire    [63:0]  fadd_forward_result;         
wire    [63:0]  fadd_mfvr_cmp_result;        
wire            forever_cpuclk;              
wire            fspu_forward_r_vld;          
wire    [63:0]  fspu_forward_result;         
wire    [63:0]  fspu_mfvr_data;              
wire            pad_yy_icg_scan_en;          
wire    [63:0]  pipex_dp_ex1_vfalu_mfvr_data; 
wire    [4 :0]  pipex_dp_ex3_vfalu_ereg_data; 
wire    [63:0]  pipex_dp_ex3_vfalu_freg_data; 
wire            vfpu_yy_xx_dqnan;            
wire    [2 :0]  vfpu_yy_xx_rm;               


//&Instance("ct_fcnvt_top");
// &Instance("ct_fadd_top"); @28
ct_fadd_top  x_ct_fadd_top (
  .cp0_vfpu_icg_en             (cp0_vfpu_icg_en            ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .dp_vfalu_ex1_pipex_func     (dp_vfalu_ex1_pipex_func    ),
  .dp_vfalu_ex1_pipex_imm0     (dp_vfalu_ex1_pipex_imm0    ),
  .dp_vfalu_ex1_pipex_sel      (dp_vfalu_ex1_pipex_sel     ),
  .dp_vfalu_ex1_pipex_srcf0    (dp_vfalu_ex1_pipex_srcf0   ),
  .dp_vfalu_ex1_pipex_srcf1    (dp_vfalu_ex1_pipex_srcf1   ),
  .fadd_ereg_ex3_forward_r_vld (fadd_ereg_ex3_forward_r_vld),
  .fadd_ereg_ex3_result        (fadd_ereg_ex3_result       ),
  .fadd_forward_r_vld          (fadd_forward_r_vld         ),
  .fadd_forward_result         (fadd_forward_result        ),
  .fadd_mfvr_cmp_result        (fadd_mfvr_cmp_result       ),
  .forever_cpuclk              (forever_cpuclk             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .vfpu_yy_xx_dqnan            (vfpu_yy_xx_dqnan           ),
  .vfpu_yy_xx_rm               (vfpu_yy_xx_rm              )
);

// &Instance("ct_fspu_top"); @29
ct_fspu_top  x_ct_fspu_top (
  .cp0_vfpu_icg_en              (cp0_vfpu_icg_en             ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .dp_vfalu_ex1_pipex_func      (dp_vfalu_ex1_pipex_func     ),
  .dp_vfalu_ex1_pipex_mtvr_src0 (dp_vfalu_ex1_pipex_mtvr_src0),
  .dp_vfalu_ex1_pipex_sel       (dp_vfalu_ex1_pipex_sel      ),
  .dp_vfalu_ex1_pipex_srcf0     (dp_vfalu_ex1_pipex_srcf0    ),
  .dp_vfalu_ex1_pipex_srcf1     (dp_vfalu_ex1_pipex_srcf1    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .fspu_forward_r_vld           (fspu_forward_r_vld          ),
  .fspu_forward_result          (fspu_forward_result         ),
  .fspu_mfvr_data               (fspu_mfvr_data              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);

// &Instance("ct_vfalu_dp_pipe6"); @30
ct_vfalu_dp_pipe6  x_ct_vfalu_dp_pipe6 (
  .dp_vfalu_ex1_pipex_sel       (dp_vfalu_ex1_pipex_sel      ),
  .fadd_ereg_ex3_forward_r_vld  (fadd_ereg_ex3_forward_r_vld ),
  .fadd_ereg_ex3_result         (fadd_ereg_ex3_result        ),
  .fadd_forward_r_vld           (fadd_forward_r_vld          ),
  .fadd_forward_result          (fadd_forward_result         ),
  .fadd_mfvr_cmp_result         (fadd_mfvr_cmp_result        ),
  .fspu_forward_r_vld           (fspu_forward_r_vld          ),
  .fspu_forward_result          (fspu_forward_result         ),
  .fspu_mfvr_data               (fspu_mfvr_data              ),
  .pipex_dp_ex1_vfalu_mfvr_data (pipex_dp_ex1_vfalu_mfvr_data),
  .pipex_dp_ex3_vfalu_ereg_data (pipex_dp_ex3_vfalu_ereg_data),
  .pipex_dp_ex3_vfalu_freg_data (pipex_dp_ex3_vfalu_freg_data)
);

// &Force("nonport","fadd_ereg_ex3_forward_r_vld") @31
// &ModuleEnd; @32
endmodule


