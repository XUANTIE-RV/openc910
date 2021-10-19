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

// &Depend("cpu_cfig.h"); @22
// &ModuleBeg; @23
module ct_vfdsu_top(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_vfdsu_ex1_pipex_dst_ereg,
  dp_vfdsu_ex1_pipex_dst_vreg,
  dp_vfdsu_ex1_pipex_iid,
  dp_vfdsu_ex1_pipex_imm0,
  dp_vfdsu_ex1_pipex_sel,
  dp_vfdsu_ex1_pipex_srcf0,
  dp_vfdsu_ex1_pipex_srcf1,
  dp_vfdsu_fdiv_gateclk_issue,
  dp_vfdsu_idu_fdiv_issue,
  forever_cpuclk,
  idu_vfpu_rf_pipex_func,
  idu_vfpu_rf_pipex_gateclk_sel,
  pad_yy_icg_scan_en,
  pipex_dp_vfdsu_ereg,
  pipex_dp_vfdsu_ereg_data,
  pipex_dp_vfdsu_freg_data,
  pipex_dp_vfdsu_inst_vld,
  pipex_dp_vfdsu_vreg,
  rtu_yy_xx_flush,
  vfdsu_dp_fdiv_busy,
  vfdsu_dp_inst_wb_req,
  vfdsu_ifu_debug_ex2_wait,
  vfdsu_ifu_debug_idle,
  vfdsu_ifu_debug_pipe_busy,
  vfpu_yy_xx_dqnan,
  vfpu_yy_xx_rm
);

// &Ports; @24
input           cp0_vfpu_icg_en;              
input           cp0_yy_clk_en;                
input           cpurst_b;                     
input   [4 :0]  dp_vfdsu_ex1_pipex_dst_ereg;  
input   [6 :0]  dp_vfdsu_ex1_pipex_dst_vreg;  
input   [6 :0]  dp_vfdsu_ex1_pipex_iid;       
input   [2 :0]  dp_vfdsu_ex1_pipex_imm0;      
input           dp_vfdsu_ex1_pipex_sel;       
input   [63:0]  dp_vfdsu_ex1_pipex_srcf0;     
input   [63:0]  dp_vfdsu_ex1_pipex_srcf1;     
input           dp_vfdsu_fdiv_gateclk_issue;  
input           dp_vfdsu_idu_fdiv_issue;      
input           forever_cpuclk;               
input   [19:0]  idu_vfpu_rf_pipex_func;       
input           idu_vfpu_rf_pipex_gateclk_sel; 
input           pad_yy_icg_scan_en;           
input           rtu_yy_xx_flush;              
input           vfpu_yy_xx_dqnan;             
input   [2 :0]  vfpu_yy_xx_rm;                
output  [4 :0]  pipex_dp_vfdsu_ereg;          
output  [4 :0]  pipex_dp_vfdsu_ereg_data;     
output  [63:0]  pipex_dp_vfdsu_freg_data;     
output          pipex_dp_vfdsu_inst_vld;      
output  [6 :0]  pipex_dp_vfdsu_vreg;          
output          vfdsu_dp_fdiv_busy;           
output          vfdsu_dp_inst_wb_req;         
output          vfdsu_ifu_debug_ex2_wait;     
output          vfdsu_ifu_debug_idle;         
output          vfdsu_ifu_debug_pipe_busy;    

// &Regs; @25

// &Wires; @26
wire            cp0_vfpu_icg_en;              
wire            cp0_yy_clk_en;                
wire            cpurst_b;                     
wire    [4 :0]  dp_vfdsu_ex1_pipex_dst_ereg;  
wire    [6 :0]  dp_vfdsu_ex1_pipex_dst_vreg;  
wire    [6 :0]  dp_vfdsu_ex1_pipex_iid;       
wire    [2 :0]  dp_vfdsu_ex1_pipex_imm0;      
wire            dp_vfdsu_ex1_pipex_sel;       
wire    [63:0]  dp_vfdsu_ex1_pipex_srcf0;     
wire    [63:0]  dp_vfdsu_ex1_pipex_srcf1;     
wire            dp_vfdsu_fdiv_gateclk_issue;  
wire            dp_vfdsu_idu_fdiv_issue;      
wire            ex1_data_clk;                 
wire            ex1_div;                      
wire            ex1_double;                   
wire            ex1_pipedown;                 
wire            ex1_scalar;                   
wire            ex1_single;                   
wire            ex1_sqrt;                     
wire    [63:0]  ex1_src0;                     
wire    [63:0]  ex1_src1;                     
wire    [2 :0]  ex1_static_rm;                
wire            ex2_data_clk;                 
wire            ex2_pipedown;                 
wire            ex2_srt_first_round;          
wire            ex3_data_clk;                 
wire            ex3_pipedown;                 
wire    [4 :0]  ex4_out_expt;                 
wire    [63:0]  ex4_out_result;               
wire            forever_cpuclk;               
wire    [19:0]  idu_vfpu_rf_pipex_func;       
wire            idu_vfpu_rf_pipex_gateclk_sel; 
wire            pad_yy_icg_scan_en;           
wire    [4 :0]  pipex_dp_vfdsu_ereg;          
wire    [4 :0]  pipex_dp_vfdsu_ereg_data;     
wire    [63:0]  pipex_dp_vfdsu_freg_data;     
wire            pipex_dp_vfdsu_inst_vld;      
wire    [6 :0]  pipex_dp_vfdsu_vreg;          
wire            rtu_yy_xx_flush;              
wire            srt_ctrl_rem_zero;            
wire            srt_ctrl_skip_srt;            
wire            srt_secd_round;               
wire            srt_sm_on;                    
wire            vfdsu_dp_fdiv_busy;           
wire            vfdsu_dp_inst_wb_req;         
wire            vfdsu_ex2_double;             
wire            vfdsu_ex2_single;             
wire            vfdsu_ifu_debug_ex2_wait;     
wire            vfdsu_ifu_debug_idle;         
wire            vfdsu_ifu_debug_pipe_busy;    
wire            vfpu_yy_xx_dqnan;             
wire    [2 :0]  vfpu_yy_xx_rm;                

// &Instance("ct_vfdsu_ctrl"); @28
// &Instance("ct_vfdsu_dp"); @29
// &ConnRule(s/ex4_out/set0_doub_ex4/); @30
// &ConnRule(s/srt_ctrl/set0_doub_srt_ctrl/); @31
// &ConnRule(s/vfdsu_ex2_/dp_set0_double_ex2_/); @32
// &ConnRule(s/slice_x/slice_0/); @33
// &ConnRule(s/vfdsu_ex3_/dp_set0_double_ex3_/); @34
// &ConnRule(s/vfdsu_ex4_/dp_set0_double_ex4_/); @35
// &Instance("ct_vfdsu_double","x_ct_vfdsu_double_set0"); @36
// &Connect(.ex1_src0(ex1_src0[63:0])); @37
// &Connect(.ex1_src1(ex1_src1[63:0])); @38
// &Connect(.ex1_double(set0_ex1_double)); @39
// &Connect(.srt_secd_round(srt_secd_round[0])); @40
// &Connect(.ex2_srt_first_round(ex2_srt_first_round[0])); @41
// &ConnRule(s/ex4_out/set0_half0_ex4/); @43
// &ConnRule(s/_pipedown/_half_pipedown/); @44
// &ConnRule(s/srt_ctrl/set0_half0_srt_ctrl/); @45
// &ConnRule(s/vfdsu_ex2_/dp_set0_half0_ex2_/); @46
// &ConnRule(s/vfdsu_ex3_/dp_set0_half0_ex3_/); @47
// &ConnRule(s/vfdsu_ex4_/dp_set0_half0_ex4_/); @48
// &Instance("ct_vfdsu_half","x_ct_vfdsu_half0_set0"); @49
// &Connect(.ex1_src0(ex1_src0[31:16])); @50
// &Connect(.ex1_src1(ex1_src1[31:16])); @51
// &Connect(.srt_secd_round(srt_secd_round[1])); @52
// &Connect(.ex2_srt_first_round(ex2_srt_first_round[1])); @53
// &ConnRule(s/ex4_out/set0_sing_ex4/); @56
// &ConnRule(s/_pipedown/_sing_pipedown/); @57
// &ConnRule(s/srt_ctrl/set0_sing_srt_ctrl/); @58
// &ConnRule(s/slice_x/slice_0/); @59
// &Instance("ct_vfdsu_single","x_ct_vfdsu_single_set0"); @60
// &Connect(.ex1_src0(ex1_src0[63:32])); @61
// &Connect(.ex1_src1(ex1_src1[63:32])); @62
// &Connect(.srt_secd_round(srt_secd_round[1])); @63
// &Connect(.ex2_srt_first_round(ex2_srt_first_round[1])); @64
// &ConnRule(s/ex4_out/set0_half1_ex4/); @68
// &ConnRule(s/_pipedown/_half_pipedown/); @69
// &ConnRule(s/srt_ctrl/set0_half1_srt_ctrl/); @70
// &ConnRule(s/vfdsu_ex2_/dp_set0_half1_ex2_/); @71
// &ConnRule(s/vfdsu_ex3_/dp_set0_half1_ex3_/); @72
// &ConnRule(s/vfdsu_ex4_/dp_set0_half1_ex4_/); @73
// &Instance("ct_vfdsu_half","x_ct_vfdsu_half1_set0"); @74
// &Connect(.ex1_src0(ex1_src0[63:48])); @75
// &Connect(.ex1_src1(ex1_src1[63:48])); @76
// &Connect(.srt_secd_round(srt_secd_round[1])); @77
// &Connect(.ex2_srt_first_round(ex2_srt_first_round[1])); @78
// &ConnRule(s/ex4_out/set1_doub_ex4/); @81
// &ConnRule(s/srt_ctrl/set1_doub_srt_ctrl/); @82
// &ConnRule(s/vfdsu_ex2_/dp_set1_double_ex2_/); @83
// &ConnRule(s/slice_x/slice_1/); @84
// &ConnRule(s/vfdsu_ex3_/dp_set1_double_ex3_/); @85
// &ConnRule(s/vfdsu_ex4_/dp_set1_double_ex4_/); @86
// &Instance("ct_vfdsu_double","x_ct_vfdsu_double_set1"); @87
// &Connect(.ex1_src0(ex1_src0[127:64])); @88
// &Connect(.ex1_src1(ex1_src1[127:64])); @89
// &Connect(.ex1_double(set1_ex1_double)); @90
// &Connect(.srt_secd_round(srt_secd_round[2])); @91
// &Connect(.ex2_srt_first_round(ex2_srt_first_round[2])); @92
// &ConnRule(s/ex4_out/set1_half0_ex4/); @95
// &ConnRule(s/_pipedown/_half_pipedown/); @96
// &ConnRule(s/srt_ctrl/set1_half0_srt_ctrl/); @97
// &ConnRule(s/vfdsu_ex2_/dp_set1_half0_ex2_/); @98
// &ConnRule(s/vfdsu_ex3_/dp_set1_half0_ex3_/); @99
// &ConnRule(s/vfdsu_ex4_/dp_set1_half0_ex4_/); @100
// &Instance("ct_vfdsu_half","x_ct_vfdsu_half0_set1"); @101
// &Connect(.ex1_src0(ex1_src0[95:80])); @102
// &Connect(.ex1_src1(ex1_src1[95:80])); @103
// &Connect(.srt_secd_round(srt_secd_round[3])); @104
// &Connect(.ex2_srt_first_round(ex2_srt_first_round[3])); @105
// &ConnRule(s/ex4_out/set1_sing_ex4/); @108
// &ConnRule(s/_pipedown/_sing_pipedown/); @109
// &ConnRule(s/srt_ctrl/set1_sing_srt_ctrl/); @110
// &ConnRule(s/slice_x/slice_1/); @111
// &Instance("ct_vfdsu_single","x_ct_vfdsu_single_set1"); @112
// &Connect(.ex1_src0(ex1_src0[127:96])); @113
// &Connect(.ex1_src1(ex1_src1[127:96])); @114
// &Connect(.srt_secd_round(srt_secd_round[3])); @115
// &Connect(.ex2_srt_first_round(ex2_srt_first_round[3])); @116
// &ConnRule(s/ex4_out/set1_half1_ex4/); @119
// &ConnRule(s/_pipedown/_half_pipedown/); @120
// &ConnRule(s/srt_ctrl/set1_half1_srt_ctrl/); @121
// &ConnRule(s/vfdsu_ex2_/dp_set1_half1_ex2_/); @122
// &ConnRule(s/vfdsu_ex3_/dp_set1_half1_ex3_/); @123
// &ConnRule(s/vfdsu_ex4_/dp_set1_half1_ex4_/); @124
// &Instance("ct_vfdsu_half","x_ct_vfdsu_half1_set1"); @125
// &Connect(.ex1_src0(ex1_src0[127:112])); @126
// &Connect(.ex1_src1(ex1_src1[127:112])); @127
// &Connect(.srt_secd_round(srt_secd_round[3])); @128
// &Connect(.ex2_srt_first_round(ex2_srt_first_round[3])); @129
// &Instance("ct_vfdsu_ctrl"); @132
ct_vfdsu_ctrl  x_ct_vfdsu_ctrl (
  .cp0_vfpu_icg_en             (cp0_vfpu_icg_en            ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .dp_vfdsu_ex1_pipex_sel      (dp_vfdsu_ex1_pipex_sel     ),
  .dp_vfdsu_fdiv_gateclk_issue (dp_vfdsu_fdiv_gateclk_issue),
  .dp_vfdsu_idu_fdiv_issue     (dp_vfdsu_idu_fdiv_issue    ),
  .ex1_data_clk                (ex1_data_clk               ),
  .ex1_double                  (ex1_double                 ),
  .ex1_pipedown                (ex1_pipedown               ),
  .ex1_single                  (ex1_single                 ),
  .ex2_data_clk                (ex2_data_clk               ),
  .ex2_pipedown                (ex2_pipedown               ),
  .ex2_srt_first_round         (ex2_srt_first_round        ),
  .ex3_data_clk                (ex3_data_clk               ),
  .ex3_pipedown                (ex3_pipedown               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .pipex_dp_vfdsu_inst_vld     (pipex_dp_vfdsu_inst_vld    ),
  .rtu_yy_xx_flush             (rtu_yy_xx_flush            ),
  .srt_ctrl_rem_zero           (srt_ctrl_rem_zero          ),
  .srt_ctrl_skip_srt           (srt_ctrl_skip_srt          ),
  .srt_secd_round              (srt_secd_round             ),
  .srt_sm_on                   (srt_sm_on                  ),
  .vfdsu_dp_fdiv_busy          (vfdsu_dp_fdiv_busy         ),
  .vfdsu_dp_inst_wb_req        (vfdsu_dp_inst_wb_req       ),
  .vfdsu_ex2_double            (vfdsu_ex2_double           ),
  .vfdsu_ex2_single            (vfdsu_ex2_single           ),
  .vfdsu_ifu_debug_ex2_wait    (vfdsu_ifu_debug_ex2_wait   ),
  .vfdsu_ifu_debug_idle        (vfdsu_ifu_debug_idle       ),
  .vfdsu_ifu_debug_pipe_busy   (vfdsu_ifu_debug_pipe_busy  )
);

// &Instance("ct_vfdsu_double"); @133
ct_vfdsu_double  x_ct_vfdsu_double (
  .cp0_vfpu_icg_en     (cp0_vfpu_icg_en    ),
  .cp0_yy_clk_en       (cp0_yy_clk_en      ),
  .cpurst_b            (cpurst_b           ),
  .ex1_div             (ex1_div            ),
  .ex1_double          (ex1_double         ),
  .ex1_pipedown        (ex1_pipedown       ),
  .ex1_scalar          (ex1_scalar         ),
  .ex1_single          (ex1_single         ),
  .ex1_sqrt            (ex1_sqrt           ),
  .ex1_src0            (ex1_src0           ),
  .ex1_src1            (ex1_src1           ),
  .ex1_static_rm       (ex1_static_rm      ),
  .ex2_pipedown        (ex2_pipedown       ),
  .ex2_srt_first_round (ex2_srt_first_round),
  .ex3_pipedown        (ex3_pipedown       ),
  .ex4_out_expt        (ex4_out_expt       ),
  .ex4_out_result      (ex4_out_result     ),
  .forever_cpuclk      (forever_cpuclk     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en ),
  .srt_ctrl_rem_zero   (srt_ctrl_rem_zero  ),
  .srt_ctrl_skip_srt   (srt_ctrl_skip_srt  ),
  .srt_secd_round      (srt_secd_round     ),
  .srt_sm_on           (srt_sm_on          ),
  .vfpu_yy_xx_dqnan    (vfpu_yy_xx_dqnan   ),
  .vfpu_yy_xx_rm       (vfpu_yy_xx_rm      )
);

// &Instance("ct_vfdsu_scalar_dp"); @134
ct_vfdsu_scalar_dp  x_ct_vfdsu_scalar_dp (
  .cp0_vfpu_icg_en               (cp0_vfpu_icg_en              ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .dp_vfdsu_ex1_pipex_dst_ereg   (dp_vfdsu_ex1_pipex_dst_ereg  ),
  .dp_vfdsu_ex1_pipex_dst_vreg   (dp_vfdsu_ex1_pipex_dst_vreg  ),
  .dp_vfdsu_ex1_pipex_iid        (dp_vfdsu_ex1_pipex_iid       ),
  .dp_vfdsu_ex1_pipex_imm0       (dp_vfdsu_ex1_pipex_imm0      ),
  .dp_vfdsu_ex1_pipex_srcf0      (dp_vfdsu_ex1_pipex_srcf0     ),
  .dp_vfdsu_ex1_pipex_srcf1      (dp_vfdsu_ex1_pipex_srcf1     ),
  .ex1_data_clk                  (ex1_data_clk                 ),
  .ex1_div                       (ex1_div                      ),
  .ex1_double                    (ex1_double                   ),
  .ex1_pipedown                  (ex1_pipedown                 ),
  .ex1_scalar                    (ex1_scalar                   ),
  .ex1_single                    (ex1_single                   ),
  .ex1_sqrt                      (ex1_sqrt                     ),
  .ex1_src0                      (ex1_src0                     ),
  .ex1_src1                      (ex1_src1                     ),
  .ex1_static_rm                 (ex1_static_rm                ),
  .ex2_data_clk                  (ex2_data_clk                 ),
  .ex2_pipedown                  (ex2_pipedown                 ),
  .ex3_data_clk                  (ex3_data_clk                 ),
  .ex3_pipedown                  (ex3_pipedown                 ),
  .ex4_out_expt                  (ex4_out_expt                 ),
  .ex4_out_result                (ex4_out_result               ),
  .forever_cpuclk                (forever_cpuclk               ),
  .idu_vfpu_rf_pipex_func        (idu_vfpu_rf_pipex_func       ),
  .idu_vfpu_rf_pipex_gateclk_sel (idu_vfpu_rf_pipex_gateclk_sel),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pipex_dp_vfdsu_ereg           (pipex_dp_vfdsu_ereg          ),
  .pipex_dp_vfdsu_ereg_data      (pipex_dp_vfdsu_ereg_data     ),
  .pipex_dp_vfdsu_freg_data      (pipex_dp_vfdsu_freg_data     ),
  .pipex_dp_vfdsu_vreg           (pipex_dp_vfdsu_vreg          ),
  .vfdsu_ex2_double              (vfdsu_ex2_double             ),
  .vfdsu_ex2_single              (vfdsu_ex2_single             )
);


// &ModuleEnd; @137
endmodule


