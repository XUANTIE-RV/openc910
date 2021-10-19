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
module ct_fcnvt_top(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_vfalu_ex1_pipex_func,
  dp_vfalu_ex1_pipex_imm0,
  dp_vfalu_ex1_pipex_sel,
  dp_vfalu_ex1_pipex_srcf0,
  fcnvt_ereg_forward_r_vld,
  fcnvt_ereg_forward_result,
  fcnvt_forward_r_vld,
  fcnvt_forward_result,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  vfpu_yy_xx_dqnan,
  vfpu_yy_xx_rm
);

// &Ports; @22
input           cp0_vfpu_icg_en;          
input           cp0_yy_clk_en;            
input           cpurst_b;                 
input   [19:0]  dp_vfalu_ex1_pipex_func;  
input   [2 :0]  dp_vfalu_ex1_pipex_imm0;  
input   [2 :0]  dp_vfalu_ex1_pipex_sel;   
input   [63:0]  dp_vfalu_ex1_pipex_srcf0; 
input           forever_cpuclk;           
input           pad_yy_icg_scan_en;       
input           vfpu_yy_xx_dqnan;         
input   [2 :0]  vfpu_yy_xx_rm;            
output          fcnvt_ereg_forward_r_vld; 
output  [4 :0]  fcnvt_ereg_forward_result; 
output          fcnvt_forward_r_vld;      
output  [63:0]  fcnvt_forward_result;     

// &Regs; @23

// &Wires; @24
wire            cp0_vfpu_icg_en;          
wire            cp0_yy_clk_en;            
wire            cpurst_b;                 
wire    [63:0]  dp_ex1_src;               
wire    [19:0]  dp_vfalu_ex1_pipex_func;  
wire    [2 :0]  dp_vfalu_ex1_pipex_imm0;  
wire    [2 :0]  dp_vfalu_ex1_pipex_sel;   
wire    [63:0]  dp_vfalu_ex1_pipex_srcf0; 
wire            ex1_dest_double;          
wire            ex1_dest_float;           
wire            ex1_dest_single;          
wire            ex1_narrow;               
wire            ex1_pipedown;             
wire    [4 :0]  ex1_rm;                   
wire            ex1_sover;                
wire            ex1_src_double;           
wire            ex1_src_float;            
wire            ex1_src_l16;              
wire            ex1_src_l32;              
wire            ex1_src_l64;              
wire            ex1_src_si;               
wire            ex1_src_single;           
wire            ex1_widden;               
wire            ex2_dest_double;          
wire            ex2_dest_float;           
wire            ex2_dest_half;            
wire            ex2_dest_l16;             
wire            ex2_dest_l32;             
wire            ex2_dest_l64;             
wire            ex2_dest_l8;              
wire            ex2_dest_si;              
wire            ex2_dest_single;          
wire            ex2_pipedown;             
wire            ex2_src_float;            
wire            ex3_pipedown;             
wire            fcnvt_ereg_forward_r_vld; 
wire    [4 :0]  fcnvt_ereg_forward_result; 
wire    [4 :0]  fcnvt_ex3_expt;           
wire    [63:0]  fcnvt_ex3_result;         
wire            fcnvt_forward_r_vld;      
wire    [63:0]  fcnvt_forward_result;     
wire            forever_cpuclk;           
wire            pad_yy_icg_scan_en;       
wire            vfpu_yy_xx_dqnan;         
wire    [2 :0]  vfpu_yy_xx_rm;            



// &Instance("ct_fcnvt_ctrl"); @28
// &Instance("ct_fcnvt_dp"); @29
// &ConnRule(s/fcnvt_ex3/set0_doub_ex3/); @30
// &ConnRule(s/dp_ex1_src/dp_set0_doub_src/); @31
// &ConnRule(s/ex2_r_/set0_doub_ex2_r_/); @32
// &ConnRule(s/ex2_src2/set0_doub_ex2_src2/); @33
// &Instance("ct_fcnvt_double_dp","x_set0_ct_fcnvt_double_dp"); @34
// &Connect(.dp_ex1_widden_src(dp_set0_doub_widden_src)); @35
// &Connect(.ex1_vec_widden(dp_set0_doub_vec_widden)); @36
// &ConnRule(s/fcnvt_ex3/set0_half0_ex3/); @39
// &ConnRule(s/dp_ex1_src/dp_set0_half0_src/); @40
// &ConnRule(s/ex2_r_/set0_half0_ex2_r_/); @41
// &ConnRule(s/ex2_src2/set0_half0_ex2_src2/); @42
// &Instance("ct_fcnvt_half_dp",  "x_set0_ct_fcnvt_half0_dp"); @43
// &ConnRule(s/fcnvt_ex3/set0_sing_ex3/); @45
// &ConnRule(s/dp_ex1_src/dp_set0_sing_src/); @46
// &ConnRule(s/ex2_r_/set0_sing_ex2_r_/); @47
// &ConnRule(s/ex2_src2/set0_sing_ex2_src2/); @48
// &Instance("ct_fcnvt_single_dp","x_set0_ct_fcnvt_single_dp"); @49
// &ConnRule(s/fcnvt_ex3/set0_half1_ex3/); @51
// &ConnRule(s/dp_ex1_src/dp_set0_half1_src/); @52
// &ConnRule(s/ex2_src2/set0_half1_ex2_src2/); @53
// &ConnRule(s/ex2_r_/set0_half1_ex2_r_/); @54
// &Instance("ct_fcnvt_half_dp",  "x_set0_ct_fcnvt_half1_dp"); @55
// &ConnRule(s/fcnvt_ex3/set1_doub_ex3/); @57
// &ConnRule(s/dp_ex1_src/dp_set1_doub_src/); @58
// &ConnRule(s/ex2_src2/set1_doub_ex2_src2/); @59
// &ConnRule(s/ex2_r_/set1_doub_ex2_r_/); @60
// &Instance("ct_fcnvt_double_dp","x_set1_ct_fcnvt_double_dp"); @61
// &Connect(.dp_ex1_widden_src(dp_set1_doub_widden_src)); @62
// &Connect(.ex1_vec_widden(dp_set1_doub_vec_widden)); @63
// &ConnRule(s/fcnvt_ex3/set1_half0_ex3/); @65
// &ConnRule(s/dp_ex1_src/dp_set1_half0_src/); @66
// &ConnRule(s/ex2_src2/set1_half0_ex2_src2/); @67
// &ConnRule(s/ex2_r_/set1_half0_ex2_r_/); @68
// &Instance("ct_fcnvt_half_dp",  "x_set1_ct_fcnvt_half0_dp"); @69
// &ConnRule(s/fcnvt_ex3/set1_sing_ex3/); @71
// &ConnRule(s/dp_ex1_src/dp_set1_sing_src/); @72
// &ConnRule(s/ex2_src2/set1_sing_ex2_src2/); @73
// &ConnRule(s/ex2_r_/set1_sing_ex2_r_/); @74
// &Instance("ct_fcnvt_single_dp","x_set1_ct_fcnvt_single_dp"); @75
// &ConnRule(s/fcnvt_ex3/set1_half1_ex3/); @77
// &ConnRule(s/dp_ex1_src/dp_set1_half1_src/); @78
// &ConnRule(s/ex2_src2/set1_half1_ex2_src2/); @79
// &ConnRule(s/ex2_r_/set1_half1_ex2_r_/); @80
// &Instance("ct_fcnvt_half_dp",  "x_set1_ct_fcnvt_half1_dp"); @81
// &Instance("ct_fcnvt_ctrl"); @84
ct_fcnvt_ctrl  x_ct_fcnvt_ctrl (
  .cp0_vfpu_icg_en        (cp0_vfpu_icg_en       ),
  .cp0_yy_clk_en          (cp0_yy_clk_en         ),
  .cpurst_b               (cpurst_b              ),
  .dp_vfalu_ex1_pipex_sel (dp_vfalu_ex1_pipex_sel),
  .ex1_pipedown           (ex1_pipedown          ),
  .ex2_pipedown           (ex2_pipedown          ),
  .ex3_pipedown           (ex3_pipedown          ),
  .forever_cpuclk         (forever_cpuclk        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Instance("ct_fcnvt_scalar_dp"); @85
ct_fcnvt_scalar_dp  x_ct_fcnvt_scalar_dp (
  .cp0_vfpu_icg_en           (cp0_vfpu_icg_en          ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .dp_ex1_src                (dp_ex1_src               ),
  .dp_vfalu_ex1_pipex_func   (dp_vfalu_ex1_pipex_func  ),
  .dp_vfalu_ex1_pipex_imm0   (dp_vfalu_ex1_pipex_imm0  ),
  .dp_vfalu_ex1_pipex_srcf0  (dp_vfalu_ex1_pipex_srcf0 ),
  .ex1_dest_double           (ex1_dest_double          ),
  .ex1_dest_float            (ex1_dest_float           ),
  .ex1_dest_single           (ex1_dest_single          ),
  .ex1_narrow                (ex1_narrow               ),
  .ex1_pipedown              (ex1_pipedown             ),
  .ex1_rm                    (ex1_rm                   ),
  .ex1_sover                 (ex1_sover                ),
  .ex1_src_double            (ex1_src_double           ),
  .ex1_src_float             (ex1_src_float            ),
  .ex1_src_l16               (ex1_src_l16              ),
  .ex1_src_l32               (ex1_src_l32              ),
  .ex1_src_l64               (ex1_src_l64              ),
  .ex1_src_si                (ex1_src_si               ),
  .ex1_src_single            (ex1_src_single           ),
  .ex1_widden                (ex1_widden               ),
  .ex2_dest_double           (ex2_dest_double          ),
  .ex2_dest_float            (ex2_dest_float           ),
  .ex2_dest_half             (ex2_dest_half            ),
  .ex2_dest_l16              (ex2_dest_l16             ),
  .ex2_dest_l32              (ex2_dest_l32             ),
  .ex2_dest_l64              (ex2_dest_l64             ),
  .ex2_dest_l8               (ex2_dest_l8              ),
  .ex2_dest_si               (ex2_dest_si              ),
  .ex2_dest_single           (ex2_dest_single          ),
  .ex2_src_float             (ex2_src_float            ),
  .ex3_pipedown              (ex3_pipedown             ),
  .fcnvt_ereg_forward_r_vld  (fcnvt_ereg_forward_r_vld ),
  .fcnvt_ereg_forward_result (fcnvt_ereg_forward_result),
  .fcnvt_ex3_expt            (fcnvt_ex3_expt           ),
  .fcnvt_ex3_result          (fcnvt_ex3_result         ),
  .fcnvt_forward_r_vld       (fcnvt_forward_r_vld      ),
  .fcnvt_forward_result      (fcnvt_forward_result     ),
  .forever_cpuclk            (forever_cpuclk           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .vfpu_yy_xx_rm             (vfpu_yy_xx_rm            )
);

// &Instance("ct_fcnvt_double_dp","x_set0_ct_fcnvt_double_dp"); @86
ct_fcnvt_double_dp  x_set0_ct_fcnvt_double_dp (
  .cp0_vfpu_icg_en    (cp0_vfpu_icg_en   ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .cpurst_b           (cpurst_b          ),
  .dp_ex1_src         (dp_ex1_src        ),
  .ex1_dest_double    (ex1_dest_double   ),
  .ex1_dest_float     (ex1_dest_float    ),
  .ex1_dest_single    (ex1_dest_single   ),
  .ex1_narrow         (ex1_narrow        ),
  .ex1_pipedown       (ex1_pipedown      ),
  .ex1_rm             (ex1_rm            ),
  .ex1_scalar         (1'b1              ),
  .ex1_sover          (ex1_sover         ),
  .ex1_src_double     (ex1_src_double    ),
  .ex1_src_float      (ex1_src_float     ),
  .ex1_src_l16        (ex1_src_l16       ),
  .ex1_src_l32        (ex1_src_l32       ),
  .ex1_src_l64        (ex1_src_l64       ),
  .ex1_src_si         (ex1_src_si        ),
  .ex1_src_single     (ex1_src_single    ),
  .ex1_widden         (ex1_widden        ),
  .ex2_dest_double    (ex2_dest_double   ),
  .ex2_dest_float     (ex2_dest_float    ),
  .ex2_dest_half      (ex2_dest_half     ),
  .ex2_dest_l16       (ex2_dest_l16      ),
  .ex2_dest_l32       (ex2_dest_l32      ),
  .ex2_dest_l64       (ex2_dest_l64      ),
  .ex2_dest_l8        (ex2_dest_l8       ),
  .ex2_dest_si        (ex2_dest_si       ),
  .ex2_dest_single    (ex2_dest_single   ),
  .ex2_pipedown       (ex2_pipedown      ),
  .ex2_src_float      (ex2_src_float     ),
  .fcnvt_ex3_expt     (fcnvt_ex3_expt    ),
  .fcnvt_ex3_result   (fcnvt_ex3_result  ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .vfpu_yy_xx_dqnan   (vfpu_yy_xx_dqnan  )
);

// &Connect(.ex1_scalar(1'b1)); @87


// &ModuleEnd; @91
endmodule


