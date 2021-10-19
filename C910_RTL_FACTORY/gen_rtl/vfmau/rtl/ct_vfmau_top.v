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

// &ModuleBeg; @23
module ct_vfmau_top(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_vfmau_ex1_pipex_dst_vreg,
  dp_vfmau_ex1_pipex_imm0,
  dp_vfmau_ex1_pipex_sel,
  dp_vfmau_pipe6_mla_srcv2_vld,
  dp_vfmau_pipe6_mla_srcv2_vreg,
  dp_vfmau_pipe6_mla_type,
  dp_vfmau_pipe7_mla_srcv2_vld,
  dp_vfmau_pipe7_mla_srcv2_vreg,
  dp_vfmau_pipe7_mla_type,
  dp_vfmau_pipex_inst_type,
  dp_vfmau_pipex_sel,
  dp_vfmau_pipex_vfmau_sel,
  dp_vfmau_rf_pipex_sel,
  forever_cpuclk,
  idu_vfpu_rf_pipex_func,
  idu_vfpu_rf_pipex_gateclk_sel,
  idu_vfpu_rf_pipex_srcv0_fr,
  idu_vfpu_rf_pipex_srcv1_fr,
  idu_vfpu_rf_pipex_srcv2_fr,
  pad_yy_icg_scan_en,
  pipe6_pipex_ex4_fmla_fwd_vld,
  pipe6_pipex_ex5_ex1_fmla_fwd_vld,
  pipe6_pipex_ex5_ex2_fmla_fwd_vld,
  pipe6_vfmau_ex4_fmla_slice0_half0_data,
  pipe6_vfmau_ex5_fmla_slice0_data,
  pipe7_pipex_ex4_fmla_fwd_vld,
  pipe7_pipex_ex5_ex1_fmla_fwd_vld,
  pipe7_pipex_ex5_ex2_fmla_fwd_vld,
  pipe7_vfmau_ex4_fmla_slice0_half0_data,
  pipe7_vfmau_ex5_fmla_slice0_data,
  pipex_dp_ex1_mult_id,
  pipex_dp_ex3_vfmau_ereg_data,
  pipex_dp_ex3_vfmau_freg_data,
  pipex_dp_ex4_vfmau_ereg_data,
  pipex_dp_ex4_vfmau_freg_data,
  pipex_pipe6_ex4_fmla_fwd_vld,
  pipex_pipe6_ex5_ex1_fmla_fwd_vld,
  pipex_pipe6_ex5_ex2_fmla_fwd_vld,
  pipex_pipe7_ex4_fmla_fwd_vld,
  pipex_pipe7_ex5_ex1_fmla_fwd_vld,
  pipex_pipe7_ex5_ex2_fmla_fwd_vld,
  pipex_rbus_ex1_fmla_data_vld,
  pipex_rbus_ex1_fmla_data_vld_dup0,
  pipex_rbus_ex1_fmla_data_vld_dup1,
  pipex_rbus_ex1_fmla_data_vld_dup2,
  pipex_rbus_ex2_fmla_data_vld,
  pipex_rbus_ex2_fmla_data_vld_dup0,
  pipex_rbus_ex2_fmla_data_vld_dup1,
  pipex_rbus_ex2_fmla_data_vld_dup2,
  pipex_rbus_pipe6_fmla_no_fwd,
  pipex_rbus_pipe7_fmla_no_fwd,
  pipex_rbus_vfmau_ereg_wb_data,
  pipex_rbus_vfmau_ereg_wb_vld,
  pipex_rbus_vfmau_freg_wb_data,
  pipex_rbus_vfmau_vreg_wb_vld,
  pipex_vfmau_ex4_fmla_slice0_half0_data,
  pipex_vfmau_ex5_fmla_slice0_data,
  rtu_yy_xx_flush,
  vfpu_yy_xx_dqnan,
  vfpu_yy_xx_rm
);

// &Ports; @24
input           cp0_vfpu_icg_en;                       
input           cp0_yy_clk_en;                         
input           cpurst_b;                              
input   [6 :0]  dp_vfmau_ex1_pipex_dst_vreg;           
input   [2 :0]  dp_vfmau_ex1_pipex_imm0;               
input           dp_vfmau_ex1_pipex_sel;                
input           dp_vfmau_pipe6_mla_srcv2_vld;          
input   [6 :0]  dp_vfmau_pipe6_mla_srcv2_vreg;         
input   [2 :0]  dp_vfmau_pipe6_mla_type;               
input           dp_vfmau_pipe7_mla_srcv2_vld;          
input   [6 :0]  dp_vfmau_pipe7_mla_srcv2_vreg;         
input   [2 :0]  dp_vfmau_pipe7_mla_type;               
input   [5 :0]  dp_vfmau_pipex_inst_type;              
input           dp_vfmau_pipex_sel;                    
input           dp_vfmau_pipex_vfmau_sel;              
input           dp_vfmau_rf_pipex_sel;                 
input           forever_cpuclk;                        
input   [19:0]  idu_vfpu_rf_pipex_func;                
input           idu_vfpu_rf_pipex_gateclk_sel;         
input   [63:0]  idu_vfpu_rf_pipex_srcv0_fr;            
input   [63:0]  idu_vfpu_rf_pipex_srcv1_fr;            
input   [63:0]  idu_vfpu_rf_pipex_srcv2_fr;            
input           pad_yy_icg_scan_en;                    
input           pipe6_pipex_ex4_fmla_fwd_vld;          
input           pipe6_pipex_ex5_ex1_fmla_fwd_vld;      
input           pipe6_pipex_ex5_ex2_fmla_fwd_vld;      
input   [15:0]  pipe6_vfmau_ex4_fmla_slice0_half0_data; 
input   [67:0]  pipe6_vfmau_ex5_fmla_slice0_data;      
input           pipe7_pipex_ex4_fmla_fwd_vld;          
input           pipe7_pipex_ex5_ex1_fmla_fwd_vld;      
input           pipe7_pipex_ex5_ex2_fmla_fwd_vld;      
input   [15:0]  pipe7_vfmau_ex4_fmla_slice0_half0_data; 
input   [67:0]  pipe7_vfmau_ex5_fmla_slice0_data;      
input           rtu_yy_xx_flush;                       
input           vfpu_yy_xx_dqnan;                      
input   [2 :0]  vfpu_yy_xx_rm;                         
output          pipex_dp_ex1_mult_id;                  
output  [4 :0]  pipex_dp_ex3_vfmau_ereg_data;          
output  [63:0]  pipex_dp_ex3_vfmau_freg_data;          
output  [4 :0]  pipex_dp_ex4_vfmau_ereg_data;          
output  [63:0]  pipex_dp_ex4_vfmau_freg_data;          
output          pipex_pipe6_ex4_fmla_fwd_vld;          
output          pipex_pipe6_ex5_ex1_fmla_fwd_vld;      
output          pipex_pipe6_ex5_ex2_fmla_fwd_vld;      
output          pipex_pipe7_ex4_fmla_fwd_vld;          
output          pipex_pipe7_ex5_ex1_fmla_fwd_vld;      
output          pipex_pipe7_ex5_ex2_fmla_fwd_vld;      
output          pipex_rbus_ex1_fmla_data_vld;          
output          pipex_rbus_ex1_fmla_data_vld_dup0;     
output          pipex_rbus_ex1_fmla_data_vld_dup1;     
output          pipex_rbus_ex1_fmla_data_vld_dup2;     
output          pipex_rbus_ex2_fmla_data_vld;          
output          pipex_rbus_ex2_fmla_data_vld_dup0;     
output          pipex_rbus_ex2_fmla_data_vld_dup1;     
output          pipex_rbus_ex2_fmla_data_vld_dup2;     
output          pipex_rbus_pipe6_fmla_no_fwd;          
output          pipex_rbus_pipe7_fmla_no_fwd;          
output  [4 :0]  pipex_rbus_vfmau_ereg_wb_data;         
output          pipex_rbus_vfmau_ereg_wb_vld;          
output  [63:0]  pipex_rbus_vfmau_freg_wb_data;         
output          pipex_rbus_vfmau_vreg_wb_vld;          
output  [15:0]  pipex_vfmau_ex4_fmla_slice0_half0_data; 
output  [67:0]  pipex_vfmau_ex5_fmla_slice0_data;      

// &Regs; @25

// &Wires; @26
wire            cp0_vfpu_icg_en;                       
wire            cp0_yy_clk_en;                         
wire            cpurst_b;                              
wire            ctrl_dp_ex5_fma_wb_vld;                
wire            ctrl_ex1_ex2_en;                       
wire            ctrl_ex1_inst_vld;                     
wire            ctrl_ex2_inst_vld;                     
wire            ctrl_ex3_inst_vld;                     
wire            ctrl_ex4_inst_vld;                     
wire            ctrl_ex5_inst_vld;                     
wire    [63:0]  dp_mult1_ex1_op0_slice0;               
wire    [31:0]  dp_mult1_ex1_op0_slice0_high;          
wire    [63:0]  dp_mult1_ex1_op1_slice0;               
wire    [31:0]  dp_mult1_ex1_op1_slice0_high;          
wire    [63:0]  dp_mult1_ex1_op2_slice0;               
wire    [31:0]  dp_mult1_ex1_op2_slice0_high;          
wire            dp_mult1_op2_slice0_vl_mask;           
wire            dp_mult1_op2_slice0_vm_mask;           
wire    [15:0]  dp_mult_ex1_op0_slice0_half0;          
wire    [47:0]  dp_mult_ex1_op0_slice0_half0_high;     
wire    [15:0]  dp_mult_ex1_op1_slice0_half0;          
wire    [47:0]  dp_mult_ex1_op1_slice0_half0_high;     
wire    [31:0]  dp_mult_ex1_op2_slice0_half0;          
wire    [47:0]  dp_mult_ex1_op2_slice0_half0_high;     
wire            dp_mult_op2_slice0_vl_half0_mask;      
wire            dp_mult_op2_slice0_vm_half0_mask;      
wire    [6 :0]  dp_vfmau_ex1_pipex_dst_vreg;           
wire    [2 :0]  dp_vfmau_ex1_pipex_imm0;               
wire            dp_vfmau_ex1_pipex_sel;                
wire            dp_vfmau_pipe6_mla_srcv2_vld;          
wire    [6 :0]  dp_vfmau_pipe6_mla_srcv2_vreg;         
wire    [2 :0]  dp_vfmau_pipe6_mla_type;               
wire            dp_vfmau_pipe7_mla_srcv2_vld;          
wire    [6 :0]  dp_vfmau_pipe7_mla_srcv2_vreg;         
wire    [2 :0]  dp_vfmau_pipe7_mla_type;               
wire    [5 :0]  dp_vfmau_pipex_inst_type;              
wire            dp_vfmau_pipex_sel;                    
wire            dp_vfmau_pipex_vfmau_sel;              
wire            dp_vfmau_rf_pipex_sel;                 
wire            dp_xx_ex1_double;                      
wire            dp_xx_ex1_fma;                         
wire            dp_xx_ex1_half;                        
wire            dp_xx_ex1_neg;                         
wire    [51:0]  dp_xx_ex1_op0_frac;                    
wire    [51:0]  dp_xx_ex1_op1_frac;                    
wire    [2 :0]  dp_xx_ex1_rm;                          
wire            dp_xx_ex1_simd;                        
wire            dp_xx_ex1_single;                      
wire            dp_xx_ex1_sub;                         
wire            dp_xx_ex1_widen;                       
wire            dp_xx_ex2_double;                      
wire            dp_xx_ex2_fma;                         
wire            dp_xx_ex2_half;                        
wire            dp_xx_ex2_mult_id;                     
wire            dp_xx_ex2_neg;                         
wire    [2 :0]  dp_xx_ex2_rm;                          
wire            dp_xx_ex2_simd;                        
wire            dp_xx_ex2_sub;                         
wire            dp_xx_ex2_widen;                       
wire            dp_xx_ex3_double;                      
wire            dp_xx_ex3_fma;                         
wire            dp_xx_ex3_half;                        
wire            dp_xx_ex3_mult_id;                     
wire    [2 :0]  dp_xx_ex3_rm;                          
wire            dp_xx_ex3_simd;                        
wire            dp_xx_ex3_widen;                       
wire            dp_xx_ex4_double;                      
wire            dp_xx_ex4_fma;                         
wire            dp_xx_ex4_half;                        
wire            dp_xx_ex4_mult_id;                     
wire    [2 :0]  dp_xx_ex4_rm;                          
wire            forever_cpuclk;                        
wire    [19:0]  idu_vfpu_rf_pipex_func;                
wire            idu_vfpu_rf_pipex_gateclk_sel;         
wire    [63:0]  idu_vfpu_rf_pipex_srcv0_fr;            
wire    [63:0]  idu_vfpu_rf_pipex_srcv1_fr;            
wire    [63:0]  idu_vfpu_rf_pipex_srcv2_fr;            
wire            mult1_ex1_ex2_pipedown;                
wire            mult1_ex2_ex3_pipedown;                
wire            mult1_ex3_ex4_pipedown;                
wire            mult1_ex4_ex5_pipedown;                
wire            mult_ex1_ex2_half_pipedown;            
wire            mult_ex2_ex3_half_pipedown;            
wire            mult_ex3_ex4_half_pipedown;            
wire            mult_ex4_ex5_half_pipedown;            
wire            pad_yy_icg_scan_en;                    
wire            pipe6_pipex_ex4_fmla_fwd_vld;          
wire            pipe6_pipex_ex5_ex1_fmla_fwd_vld;      
wire            pipe6_pipex_ex5_ex2_fmla_fwd_vld;      
wire    [15:0]  pipe6_vfmau_ex4_fmla_slice0_half0_data; 
wire    [67:0]  pipe6_vfmau_ex5_fmla_slice0_data;      
wire            pipe7_pipex_ex4_fmla_fwd_vld;          
wire            pipe7_pipex_ex5_ex1_fmla_fwd_vld;      
wire            pipe7_pipex_ex5_ex2_fmla_fwd_vld;      
wire    [15:0]  pipe7_vfmau_ex4_fmla_slice0_half0_data; 
wire    [67:0]  pipe7_vfmau_ex5_fmla_slice0_data;      
wire            pipex_dp_ex1_mult_id;                  
wire    [4 :0]  pipex_dp_ex3_vfmau_ereg_data;          
wire    [63:0]  pipex_dp_ex3_vfmau_freg_data;          
wire    [4 :0]  pipex_dp_ex4_vfmau_ereg_data;          
wire    [63:0]  pipex_dp_ex4_vfmau_freg_data;          
wire            pipex_pipe6_ex4_fmla_fwd_vld;          
wire            pipex_pipe6_ex5_ex1_fmla_fwd_vld;      
wire            pipex_pipe6_ex5_ex2_fmla_fwd_vld;      
wire            pipex_pipe7_ex4_fmla_fwd_vld;          
wire            pipex_pipe7_ex5_ex1_fmla_fwd_vld;      
wire            pipex_pipe7_ex5_ex2_fmla_fwd_vld;      
wire            pipex_rbus_ex1_fmla_data_vld;          
wire            pipex_rbus_ex1_fmla_data_vld_dup0;     
wire            pipex_rbus_ex1_fmla_data_vld_dup1;     
wire            pipex_rbus_ex1_fmla_data_vld_dup2;     
wire            pipex_rbus_ex2_fmla_data_vld;          
wire            pipex_rbus_ex2_fmla_data_vld_dup0;     
wire            pipex_rbus_ex2_fmla_data_vld_dup1;     
wire            pipex_rbus_ex2_fmla_data_vld_dup2;     
wire            pipex_rbus_pipe6_fmla_no_fwd;          
wire            pipex_rbus_pipe7_fmla_no_fwd;          
wire    [4 :0]  pipex_rbus_vfmau_ereg_wb_data;         
wire            pipex_rbus_vfmau_ereg_wb_vld;          
wire    [63:0]  pipex_rbus_vfmau_freg_wb_data;         
wire            pipex_rbus_vfmau_vreg_wb_vld;          
wire    [15:0]  pipex_vfmau_ex4_fmla_slice0_half0_data; 
wire    [67:0]  pipex_vfmau_ex5_fmla_slice0_data;      
wire            rtu_yy_xx_flush;                       
wire            slice0_dp_half0_mult_id;               
wire            slice0_dp_mult1_mult_id;               
wire    [4 :0]  slice0_mult1_dp_ex3_mult_expt;         
wire    [63:0]  slice0_mult1_dp_ex3_mult_result;       
wire    [4 :0]  slice0_mult1_dp_ex4_expt;              
wire    [15:0]  slice0_mult1_dp_ex4_half_fma_result;   
wire    [63:0]  slice0_mult1_dp_ex4_mult_result;       
wire    [4 :0]  slice0_mult1_dp_ex5_fma_expt;          
wire    [63:0]  slice0_mult1_dp_ex5_fma_result;        
wire    [67:0]  slice0_mult1_dp_ex5_fwd_data;          
wire            vfpu_yy_xx_dqnan;                      
wire    [2 :0]  vfpu_yy_xx_rm;                         


// &Depend("cpu_cfig.h"); @28

// &Instance("ct_vfmau_ctrl","x_ct_vfmau_ctrl"); @30
ct_vfmau_ctrl  x_ct_vfmau_ctrl (
  .cp0_vfpu_icg_en            (cp0_vfpu_icg_en           ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .ctrl_dp_ex5_fma_wb_vld     (ctrl_dp_ex5_fma_wb_vld    ),
  .ctrl_ex1_ex2_en            (ctrl_ex1_ex2_en           ),
  .ctrl_ex1_inst_vld          (ctrl_ex1_inst_vld         ),
  .ctrl_ex2_inst_vld          (ctrl_ex2_inst_vld         ),
  .ctrl_ex3_inst_vld          (ctrl_ex3_inst_vld         ),
  .ctrl_ex4_inst_vld          (ctrl_ex4_inst_vld         ),
  .ctrl_ex5_inst_vld          (ctrl_ex5_inst_vld         ),
  .dp_vfmau_ex1_pipex_sel     (dp_vfmau_ex1_pipex_sel    ),
  .dp_xx_ex1_half             (dp_xx_ex1_half            ),
  .dp_xx_ex2_half             (dp_xx_ex2_half            ),
  .dp_xx_ex3_fma              (dp_xx_ex3_fma             ),
  .dp_xx_ex3_half             (dp_xx_ex3_half            ),
  .dp_xx_ex4_fma              (dp_xx_ex4_fma             ),
  .dp_xx_ex4_half             (dp_xx_ex4_half            ),
  .dp_xx_ex4_mult_id          (dp_xx_ex4_mult_id         ),
  .forever_cpuclk             (forever_cpuclk            ),
  .mult1_ex1_ex2_pipedown     (mult1_ex1_ex2_pipedown    ),
  .mult1_ex2_ex3_pipedown     (mult1_ex2_ex3_pipedown    ),
  .mult1_ex3_ex4_pipedown     (mult1_ex3_ex4_pipedown    ),
  .mult1_ex4_ex5_pipedown     (mult1_ex4_ex5_pipedown    ),
  .mult_ex1_ex2_half_pipedown (mult_ex1_ex2_half_pipedown),
  .mult_ex2_ex3_half_pipedown (mult_ex2_ex3_half_pipedown),
  .mult_ex3_ex4_half_pipedown (mult_ex3_ex4_half_pipedown),
  .mult_ex4_ex5_half_pipedown (mult_ex4_ex5_half_pipedown),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           )
);

// &Instance("ct_vfmau_dp","x_ct_vfmau_dp"); @31
ct_vfmau_dp  x_ct_vfmau_dp (
  .cp0_vfpu_icg_en                        (cp0_vfpu_icg_en                       ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .ctrl_dp_ex5_fma_wb_vld                 (ctrl_dp_ex5_fma_wb_vld                ),
  .ctrl_ex1_ex2_en                        (ctrl_ex1_ex2_en                       ),
  .ctrl_ex1_inst_vld                      (ctrl_ex1_inst_vld                     ),
  .ctrl_ex2_inst_vld                      (ctrl_ex2_inst_vld                     ),
  .ctrl_ex3_inst_vld                      (ctrl_ex3_inst_vld                     ),
  .ctrl_ex4_inst_vld                      (ctrl_ex4_inst_vld                     ),
  .ctrl_ex5_inst_vld                      (ctrl_ex5_inst_vld                     ),
  .dp_mult1_ex1_op0_slice0                (dp_mult1_ex1_op0_slice0               ),
  .dp_mult1_ex1_op0_slice0_high           (dp_mult1_ex1_op0_slice0_high          ),
  .dp_mult1_ex1_op1_slice0                (dp_mult1_ex1_op1_slice0               ),
  .dp_mult1_ex1_op1_slice0_high           (dp_mult1_ex1_op1_slice0_high          ),
  .dp_mult1_ex1_op2_slice0                (dp_mult1_ex1_op2_slice0               ),
  .dp_mult1_ex1_op2_slice0_high           (dp_mult1_ex1_op2_slice0_high          ),
  .dp_mult1_op2_slice0_vl_mask            (dp_mult1_op2_slice0_vl_mask           ),
  .dp_mult1_op2_slice0_vm_mask            (dp_mult1_op2_slice0_vm_mask           ),
  .dp_mult_ex1_op0_slice0_half0           (dp_mult_ex1_op0_slice0_half0          ),
  .dp_mult_ex1_op0_slice0_half0_high      (dp_mult_ex1_op0_slice0_half0_high     ),
  .dp_mult_ex1_op1_slice0_half0           (dp_mult_ex1_op1_slice0_half0          ),
  .dp_mult_ex1_op1_slice0_half0_high      (dp_mult_ex1_op1_slice0_half0_high     ),
  .dp_mult_ex1_op2_slice0_half0           (dp_mult_ex1_op2_slice0_half0          ),
  .dp_mult_ex1_op2_slice0_half0_high      (dp_mult_ex1_op2_slice0_half0_high     ),
  .dp_mult_op2_slice0_vl_half0_mask       (dp_mult_op2_slice0_vl_half0_mask      ),
  .dp_mult_op2_slice0_vm_half0_mask       (dp_mult_op2_slice0_vm_half0_mask      ),
  .dp_vfmau_ex1_pipex_dst_vreg            (dp_vfmau_ex1_pipex_dst_vreg           ),
  .dp_vfmau_ex1_pipex_imm0                (dp_vfmau_ex1_pipex_imm0               ),
  .dp_vfmau_pipe6_mla_srcv2_vld           (dp_vfmau_pipe6_mla_srcv2_vld          ),
  .dp_vfmau_pipe6_mla_srcv2_vreg          (dp_vfmau_pipe6_mla_srcv2_vreg         ),
  .dp_vfmau_pipe6_mla_type                (dp_vfmau_pipe6_mla_type               ),
  .dp_vfmau_pipe7_mla_srcv2_vld           (dp_vfmau_pipe7_mla_srcv2_vld          ),
  .dp_vfmau_pipe7_mla_srcv2_vreg          (dp_vfmau_pipe7_mla_srcv2_vreg         ),
  .dp_vfmau_pipe7_mla_type                (dp_vfmau_pipe7_mla_type               ),
  .dp_vfmau_pipex_inst_type               (dp_vfmau_pipex_inst_type              ),
  .dp_vfmau_pipex_sel                     (dp_vfmau_pipex_sel                    ),
  .dp_vfmau_pipex_vfmau_sel               (dp_vfmau_pipex_vfmau_sel              ),
  .dp_vfmau_rf_pipex_sel                  (dp_vfmau_rf_pipex_sel                 ),
  .dp_xx_ex1_double                       (dp_xx_ex1_double                      ),
  .dp_xx_ex1_fma                          (dp_xx_ex1_fma                         ),
  .dp_xx_ex1_half                         (dp_xx_ex1_half                        ),
  .dp_xx_ex1_neg                          (dp_xx_ex1_neg                         ),
  .dp_xx_ex1_op0_frac                     (dp_xx_ex1_op0_frac                    ),
  .dp_xx_ex1_op1_frac                     (dp_xx_ex1_op1_frac                    ),
  .dp_xx_ex1_rm                           (dp_xx_ex1_rm                          ),
  .dp_xx_ex1_simd                         (dp_xx_ex1_simd                        ),
  .dp_xx_ex1_single                       (dp_xx_ex1_single                      ),
  .dp_xx_ex1_sub                          (dp_xx_ex1_sub                         ),
  .dp_xx_ex1_widen                        (dp_xx_ex1_widen                       ),
  .dp_xx_ex2_double                       (dp_xx_ex2_double                      ),
  .dp_xx_ex2_fma                          (dp_xx_ex2_fma                         ),
  .dp_xx_ex2_half                         (dp_xx_ex2_half                        ),
  .dp_xx_ex2_mult_id                      (dp_xx_ex2_mult_id                     ),
  .dp_xx_ex2_neg                          (dp_xx_ex2_neg                         ),
  .dp_xx_ex2_rm                           (dp_xx_ex2_rm                          ),
  .dp_xx_ex2_simd                         (dp_xx_ex2_simd                        ),
  .dp_xx_ex2_sub                          (dp_xx_ex2_sub                         ),
  .dp_xx_ex2_widen                        (dp_xx_ex2_widen                       ),
  .dp_xx_ex3_double                       (dp_xx_ex3_double                      ),
  .dp_xx_ex3_fma                          (dp_xx_ex3_fma                         ),
  .dp_xx_ex3_half                         (dp_xx_ex3_half                        ),
  .dp_xx_ex3_mult_id                      (dp_xx_ex3_mult_id                     ),
  .dp_xx_ex3_rm                           (dp_xx_ex3_rm                          ),
  .dp_xx_ex3_simd                         (dp_xx_ex3_simd                        ),
  .dp_xx_ex3_widen                        (dp_xx_ex3_widen                       ),
  .dp_xx_ex4_double                       (dp_xx_ex4_double                      ),
  .dp_xx_ex4_fma                          (dp_xx_ex4_fma                         ),
  .dp_xx_ex4_half                         (dp_xx_ex4_half                        ),
  .dp_xx_ex4_mult_id                      (dp_xx_ex4_mult_id                     ),
  .dp_xx_ex4_rm                           (dp_xx_ex4_rm                          ),
  .forever_cpuclk                         (forever_cpuclk                        ),
  .idu_vfpu_rf_pipex_func                 (idu_vfpu_rf_pipex_func                ),
  .idu_vfpu_rf_pipex_gateclk_sel          (idu_vfpu_rf_pipex_gateclk_sel         ),
  .idu_vfpu_rf_pipex_srcv0_fr             (idu_vfpu_rf_pipex_srcv0_fr            ),
  .idu_vfpu_rf_pipex_srcv1_fr             (idu_vfpu_rf_pipex_srcv1_fr            ),
  .idu_vfpu_rf_pipex_srcv2_fr             (idu_vfpu_rf_pipex_srcv2_fr            ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .pipex_dp_ex1_mult_id                   (pipex_dp_ex1_mult_id                  ),
  .pipex_dp_ex3_vfmau_ereg_data           (pipex_dp_ex3_vfmau_ereg_data          ),
  .pipex_dp_ex3_vfmau_freg_data           (pipex_dp_ex3_vfmau_freg_data          ),
  .pipex_dp_ex4_vfmau_ereg_data           (pipex_dp_ex4_vfmau_ereg_data          ),
  .pipex_dp_ex4_vfmau_freg_data           (pipex_dp_ex4_vfmau_freg_data          ),
  .pipex_pipe6_ex4_fmla_fwd_vld           (pipex_pipe6_ex4_fmla_fwd_vld          ),
  .pipex_pipe6_ex5_ex1_fmla_fwd_vld       (pipex_pipe6_ex5_ex1_fmla_fwd_vld      ),
  .pipex_pipe6_ex5_ex2_fmla_fwd_vld       (pipex_pipe6_ex5_ex2_fmla_fwd_vld      ),
  .pipex_pipe7_ex4_fmla_fwd_vld           (pipex_pipe7_ex4_fmla_fwd_vld          ),
  .pipex_pipe7_ex5_ex1_fmla_fwd_vld       (pipex_pipe7_ex5_ex1_fmla_fwd_vld      ),
  .pipex_pipe7_ex5_ex2_fmla_fwd_vld       (pipex_pipe7_ex5_ex2_fmla_fwd_vld      ),
  .pipex_rbus_ex1_fmla_data_vld           (pipex_rbus_ex1_fmla_data_vld          ),
  .pipex_rbus_ex1_fmla_data_vld_dup0      (pipex_rbus_ex1_fmla_data_vld_dup0     ),
  .pipex_rbus_ex1_fmla_data_vld_dup1      (pipex_rbus_ex1_fmla_data_vld_dup1     ),
  .pipex_rbus_ex1_fmla_data_vld_dup2      (pipex_rbus_ex1_fmla_data_vld_dup2     ),
  .pipex_rbus_ex2_fmla_data_vld           (pipex_rbus_ex2_fmla_data_vld          ),
  .pipex_rbus_ex2_fmla_data_vld_dup0      (pipex_rbus_ex2_fmla_data_vld_dup0     ),
  .pipex_rbus_ex2_fmla_data_vld_dup1      (pipex_rbus_ex2_fmla_data_vld_dup1     ),
  .pipex_rbus_ex2_fmla_data_vld_dup2      (pipex_rbus_ex2_fmla_data_vld_dup2     ),
  .pipex_rbus_pipe6_fmla_no_fwd           (pipex_rbus_pipe6_fmla_no_fwd          ),
  .pipex_rbus_pipe7_fmla_no_fwd           (pipex_rbus_pipe7_fmla_no_fwd          ),
  .pipex_rbus_vfmau_ereg_wb_data          (pipex_rbus_vfmau_ereg_wb_data         ),
  .pipex_rbus_vfmau_ereg_wb_vld           (pipex_rbus_vfmau_ereg_wb_vld          ),
  .pipex_rbus_vfmau_freg_wb_data          (pipex_rbus_vfmau_freg_wb_data         ),
  .pipex_rbus_vfmau_vreg_wb_vld           (pipex_rbus_vfmau_vreg_wb_vld          ),
  .pipex_vfmau_ex4_fmla_slice0_half0_data (pipex_vfmau_ex4_fmla_slice0_half0_data),
  .pipex_vfmau_ex5_fmla_slice0_data       (pipex_vfmau_ex5_fmla_slice0_data      ),
  .rtu_yy_xx_flush                        (rtu_yy_xx_flush                       ),
  .slice0_dp_half0_mult_id                (slice0_dp_half0_mult_id               ),
  .slice0_dp_mult1_mult_id                (slice0_dp_mult1_mult_id               ),
  .slice0_mult1_dp_ex3_mult_expt          (slice0_mult1_dp_ex3_mult_expt         ),
  .slice0_mult1_dp_ex3_mult_result        (slice0_mult1_dp_ex3_mult_result       ),
  .slice0_mult1_dp_ex4_expt               (slice0_mult1_dp_ex4_expt              ),
  .slice0_mult1_dp_ex4_half_fma_result    (slice0_mult1_dp_ex4_half_fma_result   ),
  .slice0_mult1_dp_ex4_mult_result        (slice0_mult1_dp_ex4_mult_result       ),
  .slice0_mult1_dp_ex5_fma_expt           (slice0_mult1_dp_ex5_fma_expt          ),
  .slice0_mult1_dp_ex5_fma_result         (slice0_mult1_dp_ex5_fma_result        ),
  .slice0_mult1_dp_ex5_fwd_data           (slice0_mult1_dp_ex5_fwd_data          ),
  .vfpu_yy_xx_rm                          (vfpu_yy_xx_rm                         )
);

// &ConnRule(s/slicex/slice0/); @33
// &Instance("ct_vfmau_mult1","x_ct_vfmau_mult1_slice0"); @34
// &Connect(.dp_mult1_slicem     (1'b1), @35
//          .dp_mult1_slicen     (1'b0), @36
//          .dp_mult1_ex1_clk_en (1'b1), @37
//          .dp_mult1_ex2_clk_en (1'b1), @38
//          .dp_mult1_ex3_clk_en (1'b1), @39
//          .dp_mult1_ex4_clk_en (1'b1) @40
//         ); @41
// &ConnRule(s/slicex/slice1/); @43
// &Instance("ct_vfmau_mult1","x_ct_vfmau_mult1_slice1"); @44
// &Connect(.dp_mult1_slicem     (1'b0), @45
//          .dp_mult1_slicen     (1'b1) @46
//          .dp_mult1_ex1_clk_en (dp_xx_ex1_simd), @47
//          .dp_mult1_ex2_clk_en (dp_xx_ex2_simd), @48
//          .dp_mult1_ex3_clk_en (dp_xx_ex3_simd), @49
//          .dp_mult1_ex4_clk_en (dp_xx_ex4_simd) @50
//         ); @51
// &ConnRule(s/slicex/slice0/);   @53
// &Instance("ct_vfmau_mult1","x_ct_vfmau_mult1_slice0"); @54
ct_vfmau_mult1  x_ct_vfmau_mult1_slice0 (
  .cp0_vfpu_icg_en                        (cp0_vfpu_icg_en                       ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .dp_mult1_ex1_clk_en                    (1'b1                                  ),
  .dp_mult1_ex1_op0_slicex                (dp_mult1_ex1_op0_slice0               ),
  .dp_mult1_ex1_op0_slicex_high           (dp_mult1_ex1_op0_slice0_high          ),
  .dp_mult1_ex1_op1_slicex                (dp_mult1_ex1_op1_slice0               ),
  .dp_mult1_ex1_op1_slicex_high           (dp_mult1_ex1_op1_slice0_high          ),
  .dp_mult1_ex1_op2_slicex                (dp_mult1_ex1_op2_slice0               ),
  .dp_mult1_ex1_op2_slicex_high           (dp_mult1_ex1_op2_slice0_high          ),
  .dp_mult1_ex2_clk_en                    (1'b1                                  ),
  .dp_mult1_ex3_clk_en                    (1'b1                                  ),
  .dp_mult1_ex4_clk_en                    (1'b1                                  ),
  .dp_mult1_op2_slicex_vl_mask            (dp_mult1_op2_slice0_vl_mask           ),
  .dp_mult1_op2_slicex_vm_mask            (dp_mult1_op2_slice0_vm_mask           ),
  .dp_mult_ex1_op0_slicex_half0           (dp_mult_ex1_op0_slice0_half0          ),
  .dp_mult_ex1_op0_slicex_half0_high      (dp_mult_ex1_op0_slice0_half0_high     ),
  .dp_mult_ex1_op1_slicex_half0           (dp_mult_ex1_op1_slice0_half0          ),
  .dp_mult_ex1_op1_slicex_half0_high      (dp_mult_ex1_op1_slice0_half0_high     ),
  .dp_mult_ex1_op2_slicex_half0           (dp_mult_ex1_op2_slice0_half0          ),
  .dp_mult_ex1_op2_slicex_half0_high      (dp_mult_ex1_op2_slice0_half0_high     ),
  .dp_mult_op2_slicex_vl_half0_mask       (dp_mult_op2_slice0_vl_half0_mask      ),
  .dp_mult_op2_slicex_vm_half0_mask       (dp_mult_op2_slice0_vm_half0_mask      ),
  .dp_xx_ex1_double                       (dp_xx_ex1_double                      ),
  .dp_xx_ex1_fma                          (dp_xx_ex1_fma                         ),
  .dp_xx_ex1_half                         (dp_xx_ex1_half                        ),
  .dp_xx_ex1_neg                          (dp_xx_ex1_neg                         ),
  .dp_xx_ex1_op0_frac                     (dp_xx_ex1_op0_frac                    ),
  .dp_xx_ex1_op1_frac                     (dp_xx_ex1_op1_frac                    ),
  .dp_xx_ex1_rm                           (dp_xx_ex1_rm                          ),
  .dp_xx_ex1_simd                         (dp_xx_ex1_simd                        ),
  .dp_xx_ex1_single                       (dp_xx_ex1_single                      ),
  .dp_xx_ex1_sub                          (dp_xx_ex1_sub                         ),
  .dp_xx_ex1_widen                        (dp_xx_ex1_widen                       ),
  .dp_xx_ex2_double                       (dp_xx_ex2_double                      ),
  .dp_xx_ex2_fma                          (dp_xx_ex2_fma                         ),
  .dp_xx_ex2_half                         (dp_xx_ex2_half                        ),
  .dp_xx_ex2_mult_id                      (dp_xx_ex2_mult_id                     ),
  .dp_xx_ex2_neg                          (dp_xx_ex2_neg                         ),
  .dp_xx_ex2_rm                           (dp_xx_ex2_rm                          ),
  .dp_xx_ex2_simd                         (dp_xx_ex2_simd                        ),
  .dp_xx_ex2_sub                          (dp_xx_ex2_sub                         ),
  .dp_xx_ex2_widen                        (dp_xx_ex2_widen                       ),
  .dp_xx_ex3_double                       (dp_xx_ex3_double                      ),
  .dp_xx_ex3_fma                          (dp_xx_ex3_fma                         ),
  .dp_xx_ex3_half                         (dp_xx_ex3_half                        ),
  .dp_xx_ex3_mult_id                      (dp_xx_ex3_mult_id                     ),
  .dp_xx_ex3_rm                           (dp_xx_ex3_rm                          ),
  .dp_xx_ex3_simd                         (dp_xx_ex3_simd                        ),
  .dp_xx_ex3_widen                        (dp_xx_ex3_widen                       ),
  .dp_xx_ex4_double                       (dp_xx_ex4_double                      ),
  .dp_xx_ex4_half                         (dp_xx_ex4_half                        ),
  .dp_xx_ex4_rm                           (dp_xx_ex4_rm                          ),
  .forever_cpuclk                         (forever_cpuclk                        ),
  .mult1_ex1_ex2_pipedown                 (mult1_ex1_ex2_pipedown                ),
  .mult1_ex2_ex3_pipedown                 (mult1_ex2_ex3_pipedown                ),
  .mult1_ex3_ex4_pipedown                 (mult1_ex3_ex4_pipedown                ),
  .mult1_ex4_ex5_pipedown                 (mult1_ex4_ex5_pipedown                ),
  .mult_ex1_ex2_half_pipedown             (mult_ex1_ex2_half_pipedown            ),
  .mult_ex2_ex3_half_pipedown             (mult_ex2_ex3_half_pipedown            ),
  .mult_ex3_ex4_half_pipedown             (mult_ex3_ex4_half_pipedown            ),
  .mult_ex4_ex5_half_pipedown             (mult_ex4_ex5_half_pipedown            ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .pipe6_pipex_ex4_fmla_fwd_vld           (pipe6_pipex_ex4_fmla_fwd_vld          ),
  .pipe6_pipex_ex5_ex1_fmla_fwd_vld       (pipe6_pipex_ex5_ex1_fmla_fwd_vld      ),
  .pipe6_pipex_ex5_ex2_fmla_fwd_vld       (pipe6_pipex_ex5_ex2_fmla_fwd_vld      ),
  .pipe6_vfmau_ex4_fmla_slicex_half0_data (pipe6_vfmau_ex4_fmla_slice0_half0_data),
  .pipe6_vfmau_ex5_fmla_slicex_data       (pipe6_vfmau_ex5_fmla_slice0_data      ),
  .pipe7_pipex_ex4_fmla_fwd_vld           (pipe7_pipex_ex4_fmla_fwd_vld          ),
  .pipe7_pipex_ex5_ex1_fmla_fwd_vld       (pipe7_pipex_ex5_ex1_fmla_fwd_vld      ),
  .pipe7_pipex_ex5_ex2_fmla_fwd_vld       (pipe7_pipex_ex5_ex2_fmla_fwd_vld      ),
  .pipe7_vfmau_ex4_fmla_slicex_half0_data (pipe7_vfmau_ex4_fmla_slice0_half0_data),
  .pipe7_vfmau_ex5_fmla_slicex_data       (pipe7_vfmau_ex5_fmla_slice0_data      ),
  .slicex_dp_half0_mult_id                (slice0_dp_half0_mult_id               ),
  .slicex_dp_mult1_mult_id                (slice0_dp_mult1_mult_id               ),
  .slicex_mult1_dp_ex3_mult_expt          (slice0_mult1_dp_ex3_mult_expt         ),
  .slicex_mult1_dp_ex3_mult_result        (slice0_mult1_dp_ex3_mult_result       ),
  .slicex_mult1_dp_ex4_expt               (slice0_mult1_dp_ex4_expt              ),
  .slicex_mult1_dp_ex4_half_fma_result    (slice0_mult1_dp_ex4_half_fma_result   ),
  .slicex_mult1_dp_ex4_mult_result        (slice0_mult1_dp_ex4_mult_result       ),
  .slicex_mult1_dp_ex5_fma_expt           (slice0_mult1_dp_ex5_fma_expt          ),
  .slicex_mult1_dp_ex5_fma_result         (slice0_mult1_dp_ex5_fma_result        ),
  .slicex_mult1_dp_ex5_fwd_data           (slice0_mult1_dp_ex5_fwd_data          ),
  .vfpu_yy_xx_dqnan                       (vfpu_yy_xx_dqnan                      )
);

// &Connect(.dp_mult1_ex1_clk_en (1'b1), @55
//          .dp_mult1_ex2_clk_en (1'b1), @56
//          .dp_mult1_ex3_clk_en (1'b1), @57
//          .dp_mult1_ex4_clk_en (1'b1) @58
//         ); @59

// &ModuleEnd; @62
endmodule


