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
module ct_fadd_top(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_vfalu_ex1_pipex_func,
  dp_vfalu_ex1_pipex_imm0,
  dp_vfalu_ex1_pipex_sel,
  dp_vfalu_ex1_pipex_srcf0,
  dp_vfalu_ex1_pipex_srcf1,
  fadd_ereg_ex3_forward_r_vld,
  fadd_ereg_ex3_result,
  fadd_forward_r_vld,
  fadd_forward_result,
  fadd_mfvr_cmp_result,
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
input   [63:0]  dp_vfalu_ex1_pipex_srcf1;   
input           forever_cpuclk;             
input           pad_yy_icg_scan_en;         
input           vfpu_yy_xx_dqnan;           
input   [2 :0]  vfpu_yy_xx_rm;              
output          fadd_ereg_ex3_forward_r_vld; 
output  [4 :0]  fadd_ereg_ex3_result;       
output          fadd_forward_r_vld;         
output  [63:0]  fadd_forward_result;        
output  [63:0]  fadd_mfvr_cmp_result;       

// &Regs; @23

// &Wires; @24
wire            cp0_vfpu_icg_en;            
wire            cp0_yy_clk_en;              
wire            cpurst_b;                   
wire    [19:0]  dp_vfalu_ex1_pipex_func;    
wire    [2 :0]  dp_vfalu_ex1_pipex_imm0;    
wire    [2 :0]  dp_vfalu_ex1_pipex_sel;     
wire    [63:0]  dp_vfalu_ex1_pipex_srcf0;   
wire    [63:0]  dp_vfalu_ex1_pipex_srcf1;   
wire            ex1_doub_cmp_result;        
wire            ex1_doub_half_cmp_result;   
wire            ex1_double;                 
wire            ex1_op_add;                 
wire            ex1_op_cmp;                 
wire            ex1_op_feq;                 
wire            ex1_op_fle;                 
wire            ex1_op_flt;                 
wire            ex1_op_fne;                 
wire            ex1_op_ford;                
wire            ex1_op_maxnm;               
wire            ex1_op_minnm;               
wire            ex1_op_sub;                 
wire            ex1_pipe_clk;               
wire            ex1_pipedown;               
wire            ex1_single;                 
wire            ex2_double;                 
wire            ex2_op_add;                 
wire            ex2_op_cmp;                 
wire            ex2_op_fle;                 
wire            ex2_op_flt;                 
wire            ex2_op_maxnm;               
wire            ex2_op_minnm;               
wire            ex2_op_sub;                 
wire            ex2_pipedown;               
wire            ex2_rm_rdn;                 
wire            ex2_rm_rmm;                 
wire            ex2_rm_rne;                 
wire            ex2_rm_rtz;                 
wire            ex2_rm_rup;                 
wire            ex2_single;                 
wire    [4 :0]  ex3_expt;                   
wire            ex3_pipedown;               
wire    [63:0]  ex3_result;                 
wire    [63:0]  fadd_ctrl_src0;             
wire    [63:0]  fadd_ctrl_src1;             
wire            fadd_ereg_ex3_forward_r_vld; 
wire    [4 :0]  fadd_ereg_ex3_result;       
wire            fadd_forward_r_vld;         
wire    [63:0]  fadd_forward_result;        
wire    [63:0]  fadd_mfvr_cmp_result;       
wire            forever_cpuclk;             
wire    [4 :0]  half_expt;                  
wire    [15:0]  half_result;                
wire            pad_yy_icg_scan_en;         
wire            vfpu_yy_xx_dqnan;           
wire    [2 :0]  vfpu_yy_xx_rm;              


// &Instance("ct_fadd_ctrl"); @27
// &Instance("ct_fadd_dp"); @28
// &ConnRule(s/ex3/set0_doub_ex3/); @30
// &ConnRule(s/ex1_cmp_result/set0_doub_ex1_cmp_result/); @31
// &ConnRule(s/ex2_result/set0_doub_ex2_result/); @32
// &ConnRule(s/fadd_ctrl_/dp_set0_doub_/); @33
// &ConnRule(s/ex2_src/set0_doub_ex2_src/); @34
// &ConnRule(s/ex2_r_/set0_doub_ex2_r_/); @35
// &Instance("ct_fadd_double_dp","x_set0_ct_fadd_double_dp"); @36
// &Connect(.ex2_double(set0_double_ex2_double)); @37
// &Connect(.ex2_single(set0_double_ex2_single)); @38
// &Connect(.ex1_double(fadd_set0_double)); @39
// &Connect(.ex1_single(fadd_set0_single)); @40
// &ConnRule(s/ex3/set0_doub_half_ex3/); @43
// &ConnRule(s/ex1_cmp_result/set0_doub_half_ex1_cmp_result/); @44
// &ConnRule(s/ex2_result/set0_doub_half_ex2_result/); @45
// &ConnRule(s/fadd_ctrl_/dp_set0_doub_half_/); @46
// &ConnRule(s/ex2_src/set0_doub_half_ex2_src/); @47
// &ConnRule(s/ex2_r_/set0_doub_half_ex2_r_/); @48
// &Instance("ct_fadd_half_dp",  "x_set0_ct_fadd_doub_half_dp"); @49
// &ConnRule(s/ex3/set0_half0_ex3/); @53
// &ConnRule(s/ex1_cmp_result/set0_half0_ex1_cmp_result/); @54
// &ConnRule(s/ex2_result/set0_half0_ex2_result/); @55
// &ConnRule(s/fadd_ctrl_/dp_set0_half0_/); @56
// &ConnRule(s/ex2_src/set0_half0_ex2_src/); @57
// &ConnRule(s/ex2_r_/set0_half0_ex2_r_/); @58
// &Instance("ct_fadd_half_dp",  "x_set0_ct_fadd_half0_dp"); @59
// &Connect(.ex1_scalar(1'b0)); @60
// &ConnRule(s/ex3/set0_sing_ex3/); @62
// &ConnRule(s/ex1_cmp_result/set0_sing_ex1_cmp_result/); @63
// &ConnRule(s/ex2_result/set0_sing_ex2_result/); @64
// &ConnRule(s/fadd_ctrl_/dp_set0_sing_/); @65
// &ConnRule(s/ex2_src/set0_sing_ex2_src/); @66
// &ConnRule(s/ex2_r_/set0_sing_ex2_r_/); @67
// &Instance("ct_fadd_single_dp","x_set0_ct_fadd_single_dp"); @68
// &Connect(.ex2_single(set0_single_ex2_single)); @69
// &ConnRule(s/ex3/set0_half1_ex3/); @72
// &ConnRule(s/ex1_cmp_result/set0_half1_ex1_cmp_result/); @73
// &ConnRule(s/ex2_result/set0_half1_ex2_result/); @74
// &ConnRule(s/fadd_ctrl_/dp_set0_half1_/); @75
// &ConnRule(s/ex2_src/set0_half1_ex2_src/); @76
// &ConnRule(s/ex2_r_/set0_half1_ex2_r_/); @77
// &Instance("ct_fadd_half_dp",  "x_set0_ct_fadd_half1_dp"); @78
// &Connect(.ex1_scalar(1'b0)); @79
// &ConnRule(s/ex3/set1_doub_ex3/); @81
// &ConnRule(s/ex1_cmp_result/set1_doub_ex1_cmp_result/); @82
// &ConnRule(s/ex2_result/set1_doub_ex2_result/); @83
// &ConnRule(s/fadd_ctrl_/dp_set1_doub_/); @84
// &ConnRule(s/ex2_src/set1_doub_ex2_src/); @85
// &ConnRule(s/ex2_r_/set1_doub_ex2_r_/); @86
// &Instance("ct_fadd_double_dp","x_set1_ct_fadd_double_dp"); @87
// &Connect(.ex2_double(set1_double_ex2_double)); @88
// &Connect(.ex2_single(set1_double_ex2_single)); @89
// &Connect(.ex1_double(fadd_set1_double)); @90
// &Connect(.ex1_single(fadd_set1_single)); @91
// &ConnRule(s/ex3/set1_doub_half_ex3/); @93
// &ConnRule(s/ex1_cmp_result/set1_doub_half_ex1_cmp_result/); @94
// &ConnRule(s/ex2_result/set1_doub_half_ex2_result/); @95
// &ConnRule(s/fadd_ctrl_/dp_set1_doub_half_/); @96
// &ConnRule(s/ex2_src/set1_doub_half_ex2_src/); @97
// &ConnRule(s/ex2_r_/set1_doub_half_ex2_r_/); @98
// &Instance("ct_fadd_half_dp",  "x_set1_ct_fadd_doub_half_dp"); @99
// &ConnRule(s/ex3/set1_half0_ex3/); @101
// &ConnRule(s/ex1_cmp_result/set1_half0_ex1_cmp_result/); @102
// &ConnRule(s/ex2_result/set1_half0_ex2_result/); @103
// &ConnRule(s/fadd_ctrl_/dp_set1_half0_/); @104
// &ConnRule(s/ex2_src/set1_half0_ex2_src/); @105
// &ConnRule(s/ex2_r_/set1_half0_ex2_r_/); @106
// &Instance("ct_fadd_half_dp",  "x_set1_ct_fadd_half0_dp"); @107
// &Connect(.ex1_scalar(1'b0)); @108
// &ConnRule(s/ex3/set1_sing_ex3/); @110
// &ConnRule(s/ex1_cmp_result/set1_sing_ex1_cmp_result/); @111
// &ConnRule(s/ex2_result/set1_sing_ex2_result/); @112
// &ConnRule(s/fadd_ctrl_/dp_set1_sing_/); @113
// &ConnRule(s/ex2_src/set1_sing_ex2_src/); @114
// &ConnRule(s/ex2_r_/set1_sing_ex2_r_/); @115
// &Instance("ct_fadd_single_dp","x_set1_ct_fadd_single_dp"); @116
// &Connect(.ex2_single(set1_single_ex2_single)); @117
// &ConnRule(s/ex3/set1_half1_ex3/); @119
// &ConnRule(s/ex1_cmp_result/set1_half1_ex1_cmp_result/); @120
// &ConnRule(s/ex2_result/set1_half1_ex2_result/); @121
// &ConnRule(s/fadd_ctrl_/dp_set1_half1_/); @122
// &ConnRule(s/ex2_src/set1_half1_ex2_src/); @123
// &ConnRule(s/ex2_r_/set1_half1_ex2_r_/); @124
// &Instance("ct_fadd_half_dp",  "x_set1_ct_fadd_half1_dp"); @125
// &Connect(.ex1_scalar(1'b0)); @126
// &Force("nonport","set1_half1_ex1_cmp_result"); @128
// &Force("nonport","set1_doub_half_ex1_cmp_result"); @129
// &Force("nonport","set1_sing_ex1_cmp_result"); @130
// &Force("nonport","set1_half0_ex1_cmp_result"); @131
// &Force("nonport","set1_doub_ex1_cmp_result"); @132
// &Force("nonport","set0_half1_ex1_cmp_result"); @134
// &Force("nonport","set0_doub_half_ex1_cmp_result"); @135
// &Force("nonport","set0_sing_ex1_cmp_result"); @136
// &Force("nonport","set0_half0_ex1_cmp_result"); @137
// &Force("nonport","set0_doub_ex1_cmp_result"); @138
// &Instance("ct_fadd_ctrl"); @140
ct_fadd_ctrl  x_ct_fadd_ctrl (
  .cp0_vfpu_icg_en        (cp0_vfpu_icg_en       ),
  .cp0_yy_clk_en          (cp0_yy_clk_en         ),
  .cpurst_b               (cpurst_b              ),
  .dp_vfalu_ex1_pipex_sel (dp_vfalu_ex1_pipex_sel),
  .ex1_pipe_clk           (ex1_pipe_clk          ),
  .ex1_pipedown           (ex1_pipedown          ),
  .ex2_pipedown           (ex2_pipedown          ),
  .ex3_pipedown           (ex3_pipedown          ),
  .forever_cpuclk         (forever_cpuclk        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Instance("ct_fadd_scalar_dp"); @141
ct_fadd_scalar_dp  x_ct_fadd_scalar_dp (
  .cp0_vfpu_icg_en             (cp0_vfpu_icg_en            ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .dp_vfalu_ex1_pipex_func     (dp_vfalu_ex1_pipex_func    ),
  .dp_vfalu_ex1_pipex_imm0     (dp_vfalu_ex1_pipex_imm0    ),
  .dp_vfalu_ex1_pipex_srcf0    (dp_vfalu_ex1_pipex_srcf0   ),
  .dp_vfalu_ex1_pipex_srcf1    (dp_vfalu_ex1_pipex_srcf1   ),
  .ex1_doub_cmp_result         (ex1_doub_cmp_result        ),
  .ex1_doub_half_cmp_result    (ex1_doub_half_cmp_result   ),
  .ex1_double                  (ex1_double                 ),
  .ex1_op_add                  (ex1_op_add                 ),
  .ex1_op_cmp                  (ex1_op_cmp                 ),
  .ex1_op_feq                  (ex1_op_feq                 ),
  .ex1_op_fle                  (ex1_op_fle                 ),
  .ex1_op_flt                  (ex1_op_flt                 ),
  .ex1_op_fne                  (ex1_op_fne                 ),
  .ex1_op_ford                 (ex1_op_ford                ),
  .ex1_op_maxnm                (ex1_op_maxnm               ),
  .ex1_op_minnm                (ex1_op_minnm               ),
  .ex1_op_sub                  (ex1_op_sub                 ),
  .ex1_pipe_clk                (ex1_pipe_clk               ),
  .ex1_pipedown                (ex1_pipedown               ),
  .ex1_single                  (ex1_single                 ),
  .ex2_double                  (ex2_double                 ),
  .ex2_op_add                  (ex2_op_add                 ),
  .ex2_op_cmp                  (ex2_op_cmp                 ),
  .ex2_op_fle                  (ex2_op_fle                 ),
  .ex2_op_flt                  (ex2_op_flt                 ),
  .ex2_op_maxnm                (ex2_op_maxnm               ),
  .ex2_op_minnm                (ex2_op_minnm               ),
  .ex2_op_sub                  (ex2_op_sub                 ),
  .ex2_pipedown                (ex2_pipedown               ),
  .ex2_rm_rdn                  (ex2_rm_rdn                 ),
  .ex2_rm_rmm                  (ex2_rm_rmm                 ),
  .ex2_rm_rne                  (ex2_rm_rne                 ),
  .ex2_rm_rtz                  (ex2_rm_rtz                 ),
  .ex2_rm_rup                  (ex2_rm_rup                 ),
  .ex2_single                  (ex2_single                 ),
  .ex3_expt                    (ex3_expt                   ),
  .ex3_pipedown                (ex3_pipedown               ),
  .ex3_result                  (ex3_result                 ),
  .fadd_ctrl_src0              (fadd_ctrl_src0             ),
  .fadd_ctrl_src1              (fadd_ctrl_src1             ),
  .fadd_ereg_ex3_forward_r_vld (fadd_ereg_ex3_forward_r_vld),
  .fadd_ereg_ex3_result        (fadd_ereg_ex3_result       ),
  .fadd_forward_r_vld          (fadd_forward_r_vld         ),
  .fadd_forward_result         (fadd_forward_result        ),
  .fadd_mfvr_cmp_result        (fadd_mfvr_cmp_result       ),
  .forever_cpuclk              (forever_cpuclk             ),
  .half_expt                   (half_expt                  ),
  .half_result                 (half_result                ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .vfpu_yy_xx_rm               (vfpu_yy_xx_rm              )
);

// &Instance("ct_fadd_double_dp"); @142
ct_fadd_double_dp  x_ct_fadd_double_dp (
  .cp0_vfpu_icg_en     (cp0_vfpu_icg_en    ),
  .cp0_yy_clk_en       (cp0_yy_clk_en      ),
  .cpurst_b            (cpurst_b           ),
  .ex1_as_double       (ex1_double         ),
  .ex1_as_single       (ex1_single         ),
  .ex1_cmp_result      (ex1_doub_cmp_result),
  .ex1_double          (ex1_double         ),
  .ex1_op_add          (ex1_op_add         ),
  .ex1_op_cmp          (ex1_op_cmp         ),
  .ex1_op_feq          (ex1_op_feq         ),
  .ex1_op_fle          (ex1_op_fle         ),
  .ex1_op_flt          (ex1_op_flt         ),
  .ex1_op_fne          (ex1_op_fne         ),
  .ex1_op_ford         (ex1_op_ford        ),
  .ex1_op_maxnm        (ex1_op_maxnm       ),
  .ex1_op_minnm        (ex1_op_minnm       ),
  .ex1_op_sub          (ex1_op_sub         ),
  .ex1_pipedown        (ex1_pipedown       ),
  .ex1_scalar          (1'b1               ),
  .ex1_single          (ex1_single         ),
  .ex2_double          (ex2_double         ),
  .ex2_op_add          (ex2_op_add         ),
  .ex2_op_cmp          (ex2_op_cmp         ),
  .ex2_op_fle          (ex2_op_fle         ),
  .ex2_op_flt          (ex2_op_flt         ),
  .ex2_op_maxnm        (ex2_op_maxnm       ),
  .ex2_op_minnm        (ex2_op_minnm       ),
  .ex2_op_sub          (ex2_op_sub         ),
  .ex2_pipedown        (ex2_pipedown       ),
  .ex2_rm_rdn          (ex2_rm_rdn         ),
  .ex2_rm_rmm          (ex2_rm_rmm         ),
  .ex2_rm_rne          (ex2_rm_rne         ),
  .ex2_rm_rtz          (ex2_rm_rtz         ),
  .ex2_rm_rup          (ex2_rm_rup         ),
  .ex2_single          (ex2_single         ),
  .ex3_expt            (ex3_expt           ),
  .ex3_result          (ex3_result         ),
  .fadd_ctrl_src0      (fadd_ctrl_src0     ),
  .fadd_ctrl_src1      (fadd_ctrl_src1     ),
  .forever_cpuclk      (forever_cpuclk     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en ),
  .vfpu_yy_xx_dqnan    (vfpu_yy_xx_dqnan   )
);

// &Connect(.ex1_cmp_result(ex1_doub_cmp_result)); @143
// &Connect(.ex1_as_double(ex1_double)); @144
// &Connect(.ex1_as_single(ex1_single)); @145
// &Connect(.ex1_scalar(1'b1)); @146
// &Instance("ct_fadd_half_dp","x_ct_fadd_double_half_dp"); @147
ct_fadd_half_dp  x_ct_fadd_double_half_dp (
  .cp0_vfpu_icg_en          (cp0_vfpu_icg_en         ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .ex1_cmp_result           (ex1_doub_half_cmp_result),
  .ex1_op_add               (ex1_op_add              ),
  .ex1_op_cmp               (ex1_op_cmp              ),
  .ex1_op_feq               (ex1_op_feq              ),
  .ex1_op_fle               (ex1_op_fle              ),
  .ex1_op_flt               (ex1_op_flt              ),
  .ex1_op_fne               (ex1_op_fne              ),
  .ex1_op_ford              (ex1_op_ford             ),
  .ex1_op_maxnm             (ex1_op_maxnm            ),
  .ex1_op_minnm             (ex1_op_minnm            ),
  .ex1_op_sub               (ex1_op_sub              ),
  .ex1_pipedown             (ex1_pipedown            ),
  .ex1_scalar               (1'b1                    ),
  .ex2_op_add               (ex2_op_add              ),
  .ex2_op_cmp               (ex2_op_cmp              ),
  .ex2_op_fle               (ex2_op_fle              ),
  .ex2_op_flt               (ex2_op_flt              ),
  .ex2_op_maxnm             (ex2_op_maxnm            ),
  .ex2_op_minnm             (ex2_op_minnm            ),
  .ex2_op_sub               (ex2_op_sub              ),
  .ex2_pipedown             (ex2_pipedown            ),
  .ex2_rm_rdn               (ex2_rm_rdn              ),
  .ex2_rm_rmm               (ex2_rm_rmm              ),
  .ex2_rm_rne               (ex2_rm_rne              ),
  .ex2_rm_rtz               (ex2_rm_rtz              ),
  .ex2_rm_rup               (ex2_rm_rup              ),
  .ex3_expt                 (half_expt               ),
  .ex3_result               (half_result             ),
  .fadd_ctrl_src0           (fadd_ctrl_src0          ),
  .fadd_ctrl_src1           (fadd_ctrl_src1          ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .vfpu_yy_xx_dqnan         (vfpu_yy_xx_dqnan        )
);

// &Connect(.ex1_cmp_result(ex1_doub_half_cmp_result)); @148
// &Connect(.ex3_result(half_result)); @149
// &Connect(.ex3_expt(half_expt)); @150
// &Connect(.ex1_scalar(1'b1)); @151

// &ModuleEnd; @154
endmodule


