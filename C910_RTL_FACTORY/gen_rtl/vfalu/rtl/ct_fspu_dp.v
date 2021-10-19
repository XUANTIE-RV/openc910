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
module ct_fspu_dp(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_vfalu_ex1_pipex_func,
  dp_vfalu_ex1_pipex_mtvr_src0,
  dp_vfalu_ex1_pipex_srcf0,
  dp_vfalu_ex1_pipex_srcf1,
  ex1_pipedown,
  ex2_pipedown,
  ex3_pipedown,
  forever_cpuclk,
  fspu_forward_r_vld,
  fspu_forward_result,
  fspu_mfvr_data,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           cp0_vfpu_icg_en;             
input           cp0_yy_clk_en;               
input           cpurst_b;                    
input   [19:0]  dp_vfalu_ex1_pipex_func;     
input   [63:0]  dp_vfalu_ex1_pipex_mtvr_src0; 
input   [63:0]  dp_vfalu_ex1_pipex_srcf0;    
input   [63:0]  dp_vfalu_ex1_pipex_srcf1;    
input           ex1_pipedown;                
input           ex2_pipedown;                
input           ex3_pipedown;                
input           forever_cpuclk;              
input           pad_yy_icg_scan_en;          
output          fspu_forward_r_vld;          
output  [63:0]  fspu_forward_result;         
output  [63:0]  fspu_mfvr_data;              

// &Regs; @24
reg     [63:0]  fspu_ex2_result;             
reg     [63:0]  fspu_ex3_result;             

// &Wires; @25
wire            cp0_vfpu_icg_en;             
wire            cp0_yy_clk_en;               
wire            cpurst_b;                    
wire    [63:0]  doub_mtvr_src0;              
wire    [19:0]  dp_vfalu_ex1_pipex_func;     
wire    [63:0]  dp_vfalu_ex1_pipex_mtvr_src0; 
wire    [63:0]  dp_vfalu_ex1_pipex_srcf0;    
wire    [63:0]  dp_vfalu_ex1_pipex_srcf1;    
wire            ex1_doub_op_fmv;             
wire            ex1_double;                  
wire    [63:0]  ex1_freg_result;             
wire            ex1_half_op_fmv;             
wire            ex1_op_class;                
wire            ex1_op_doub_fmvfx;           
wire            ex1_op_doub_fsgnj;           
wire            ex1_op_doub_fsgnjn;          
wire            ex1_op_doub_fsgnjx;          
wire            ex1_op_fmvfx;                
wire            ex1_op_fmvxf;                
wire            ex1_op_fsgnj;                
wire            ex1_op_fsgnjn;               
wire            ex1_op_fsgnjx;               
wire            ex1_op_half_fmvfx;           
wire            ex1_op_sing_fmvfx;           
wire            ex1_op_sing_fsgnj;           
wire            ex1_op_sing_fsgnjn;          
wire            ex1_op_sing_fsgnjx;          
wire            ex1_pipe_clk;                
wire            ex1_pipe_clk_en;             
wire            ex1_pipedown;                
wire    [63:0]  ex1_pipex_src0;              
wire    [63:0]  ex1_pipex_src1;              
wire    [63:0]  ex1_result;                  
wire    [63:0]  ex1_set0_doub_result;        
wire    [63:0]  ex1_set0_half0_result;       
wire    [63:0]  ex1_set0_sing0_result;       
wire            ex1_sing_op_fmv;             
wire            ex1_single;                  
wire            ex2_pipe_clk;                
wire            ex2_pipe_clk_en;             
wire            ex2_pipedown;                
wire            ex3_pipedown;                
wire            forever_cpuclk;              
wire    [63:0]  fspu_ex3_result_pre;         
wire            fspu_forward_r_vld;          
wire    [63:0]  fspu_forward_result;         
wire    [63:0]  fspu_mfvr_data;              
wire    [19:0]  func;                        
wire            pad_yy_icg_scan_en;          
wire    [63:0]  scalar_int_class_result;     
wire    [63:0]  scalar_int_mvxf_result;      
wire    [63:0]  scalar_x_result;             
wire    [63:0]  set0_doub_result_fclass;     
wire    [63:0]  set0_doub_result_fmfvr;      
wire    [15:0]  set0_half0_result_fclass;    
wire    [63:0]  set0_half0_result_fmfvr;     
wire    [63:0]  set0_oper0;                  
wire    [63:0]  set0_oper1;                  
wire    [31:0]  set0_sing0_result_fclass;    
wire    [63:0]  set0_sing0_result_fmfvr;     


parameter FMV_SI32_F32 = 0;
parameter FMV_SI64_F64 = 1;
parameter FMV_F32_SI32 = 2;
parameter FMV_F64_SI64 = 3; 
parameter FSGNJS       = 4;
parameter FSGNJD       = 5;
parameter FSGNJNS      = 6;
parameter FSGNJND      = 7;
parameter FSGNJXS      = 8;
parameter FSGNJXD      = 9;
parameter FCLASSS      = 10;
parameter FCLASSD      = 11;


//=====================ins_type generate====================
// &Force("bus","dp_vfalu_ex1_pipex_func",19,0); @42
assign func[19:0]            = dp_vfalu_ex1_pipex_func[19:0];
assign ex1_double      = func[16];
assign ex1_single      = func[15];
assign ex1_op_fsgnjx   = func[6] && func[2];
assign ex1_op_fsgnjn   = func[6] && func[1];
assign ex1_op_fsgnj    = func[6] && func[0];
assign ex1_op_fmvfx    = func[5] && func[0];
assign ex1_op_fmvxf    = func[5] && func[2]; 
assign ex1_op_class    = func[18];

assign ex1_op_sing_fsgnjx  = ex1_op_fsgnjx && ex1_single;
assign ex1_op_sing_fsgnjn  = ex1_op_fsgnjn && ex1_single;
assign ex1_op_sing_fsgnj   = ex1_op_fsgnj  && ex1_single;

assign ex1_op_doub_fsgnjx  = ex1_op_fsgnjx && ex1_double;
assign ex1_op_doub_fsgnjn  = ex1_op_fsgnjn && ex1_double;
assign ex1_op_doub_fsgnj   = ex1_op_fsgnj  && ex1_double;
assign ex1_op_sing_fmvfx   = ex1_op_fmvfx && ex1_single;
//assign ex1_op_sing_fmvxf   = ex1_op_fmvxf && ex1_single;
assign ex1_op_half_fmvfx   = ex1_op_fmvfx && !ex1_single && !ex1_double;
assign ex1_op_doub_fmvfx   = ex1_op_fmvfx && ex1_double;
//assign ex1_op_doub_fmvxf   = ex1_op_fmvxf && ex1_double;
// &Force("bus","dp_vfalu_ex1_pipex_srcv0",127,0); @93
// &Force("bus","dp_vfalu_ex1_pipex_srcv1",127,0); @94
// &Force("bus","dp_vfalu_ex1_pipex_mtvr_src0",63,0); @95
// &Force("bus","dp_vfalu_ex1_pipex_mtvr_src1",63,0); @96
// &Force("bus","dp_vfalu_ex1_pipex_srcv0",63,0); @104
// &Force("bus","dp_vfalu_ex1_pipex_srcv1",63,0); @105
// &Force("bus","dp_vfalu_ex1_pipex_mtvr_src0",63,0); @106
assign ex1_pipex_src0[63:0]  = dp_vfalu_ex1_pipex_srcf0[63:0];
assign ex1_pipex_src1[63:0]  = dp_vfalu_ex1_pipex_srcf1[63:0];


// &Force("nonport","set0_sing1_result_fmfvr"); @125
// &ConnRule(s/result/set0_doub_result/); @126
// &ConnRule(s/ex1_op_/ex1_op_doub_/); @127
// &Instance("ct_fspu_double","x_set0_ct_fspu_double"); @128
// &Connect(.ex1_oper0(set0_oper0[63:0])); @129
// &Connect(.ex1_oper1(set0_oper1[63:0])); @130
// &Connect(.mtvr_src0(doub_mtvr_src0)); @131
// &Connect(.ex1_op_fmvvf(ex1_doub_op_fmv)); @132
// &ConnRule(s/result/set0_sing0_result/); @134
// &ConnRule(s/ex1_op_/ex1_op_sing_/); @135
// &Instance("ct_fspu_single","x_set0_ct_fspu_single0"); @136
// &Connect(.ex1_oper0(set0_oper0[63:0])); @137
// &Connect(.ex1_oper1(set0_oper1[63:0])); @138
// &Connect(.mtvr_src0(doub_mtvr_src0[63:0])); @139
// &Connect(.ex1_op_fmvvf(ex1_sing_op_fmv)); @140
// &ConnRule(s/result/set0_sing1_result/); @144
// &ConnRule(s/ex1_op_/ex1_op_sing_/); @145
// &Instance("ct_fspu_single","x_set0_ct_fspu_single1"); @146
// &Connect(.ex1_oper0(set0_sing1_oper0[63:0])); @147
// &Connect(.ex1_oper1(set0_sing1_oper1[63:0])); @148
// &Connect(.mtvr_src0(set0_oper1[63:0])); @149
// &ConnRule(s/result/set0_half0_result/); @152
// &ConnRule(s/ex1_op_/ex1_op_half_/); @153
// &Instance("ct_fspu_half","x_set0_ct_fspu_half0"); @154
// &Connect(.ex1_oper0(set0_oper0[63:0])); @155
// &Connect(.ex1_oper1(set0_oper1[63:0])); @156
// &Connect(.mtvr_src0(doub_mtvr_src0[63:0])); @157
// &Connect(.ex1_op_fmvvf(ex1_half_op_fmv)); @158
// &ConnRule(s/result/set0_half1_result/); @162
// &ConnRule(s/ex1_op_/ex1_op_half_/); @163
// &Instance("ct_fspu_half","x_set0_ct_fspu_half1"); @164
// &Connect(.ex1_oper0(set0_half1_oper0[63:0])); @165
// &Connect(.ex1_oper1(set0_half1_oper1[63:0])); @166
// &Connect(.mtvr_src0(set0_oper1[63:0])); @167
// &ConnRule(s/result/set0_half2_result/); @171
// &ConnRule(s/ex1_op_/ex1_op_half_/); @172
// &Instance("ct_fspu_half","x_set0_ct_fspu_half2"); @173
// &Connect(.ex1_oper0(set0_half2_oper0[63:0])); @174
// &Connect(.ex1_oper1(set0_half2_oper1[63:0])); @175
// &Connect(.mtvr_src0(set0_oper1[63:0])); @176
// &ConnRule(s/result/set0_half3_result/); @180
// &ConnRule(s/ex1_op_/ex1_op_half_/); @181
// &Instance("ct_fspu_half","x_set0_ct_fspu_half3"); @182
// &Connect(.ex1_oper0(set0_half3_oper0[63:0])); @183
// &Connect(.ex1_oper1(set0_half3_oper1[63:0])); @184
// &Connect(.mtvr_src0(set0_oper1[63:0])); @185
// &Force("nonport","set1_doub_result_fmfvr"); @191
// &Force("nonport","set1_sing0_result_fmfvr"); @192
// &Force("nonport","set1_sing1_result_fmfvr"); @193
// &ConnRule(s/result/set1_doub_result/); @195
// &Instance("ct_fspu_double","x_set1_ct_fspu_double"); @196
// &Connect(.ex1_oper0(set1_oper0[63:0])); @197
// &Connect(.ex1_oper1(set1_oper1[63:0])); @198
// &Connect(.mtvr_src0(set1_oper1[63:0])); @199
// &ConnRule(s/result/set1_sing0_result/); @201
// &Instance("ct_fspu_single","x_set1_ct_fspu_single0"); @202
// &Connect(.ex1_oper0(set1_oper0[63:0])); @203
// &Connect(.ex1_oper1(set1_oper1[63:0])); @204
// &Connect(.mtvr_src0(set1_oper1[63:0])); @205
// &ConnRule(s/result/set1_sing1_result/); @209
// &Instance("ct_fspu_single","x_set1_ct_fspu_single1"); @210
// &Connect(.ex1_oper0(set1_sing1_oper0[63:0])); @211
// &Connect(.ex1_oper1(set1_sing1_oper1[63:0])); @212
// &Connect(.mtvr_src0(set1_oper1[63:0])); @213
// &ConnRule(s/result/set1_half0_result/); @215
// &Instance("ct_fspu_half","x_set1_ct_fspu_half0"); @216
// &Connect(.ex1_oper0(set1_oper0[63:0])); @217
// &Connect(.ex1_oper1(set1_oper1[63:0])); @218
// &Connect(.mtvr_src0(set1_oper1[63:0])); @219
// &ConnRule(s/result/set1_half1_result/); @223
// &Instance("ct_fspu_half","x_set1_ct_fspu_half1"); @224
// &Connect(.ex1_oper0(set1_half1_oper0[63:0])); @225
// &Connect(.ex1_oper1(set1_half1_oper1[63:0])); @226
// &Connect(.mtvr_src0(set1_oper1[63:0])); @227
// &ConnRule(s/result/set1_half2_result/); @231
// &Instance("ct_fspu_half","x_set1_ct_fspu_half2"); @232
// &Connect(.ex1_oper0(set1_half2_oper0[63:0])); @233
// &Connect(.ex1_oper1(set1_half2_oper1[63:0])); @234
// &Connect(.mtvr_src0(set1_oper1[63:0])); @235
// &ConnRule(s/result/set1_half3_result/); @239
// &Instance("ct_fspu_half","x_set1_ct_fspu_half3"); @240
// &Connect(.ex1_oper0(set1_half3_oper0[63:0])); @241
// &Connect(.ex1_oper1(set1_half3_oper1[63:0])); @242
// &Connect(.mtvr_src0(set1_oper1[63:0])); @243
// &Force("nonport","set0_half1_result_fmfvr"); @244
// &Force("nonport","set0_half2_result_fmfvr"); @245
// &Force("nonport","set0_half3_result_fmfvr"); @246
// &Force("nonport","set1_half0_result_fmfvr"); @247
// &Force("nonport","set1_half1_result_fmfvr"); @248
// &Force("nonport","set1_half2_result_fmfvr"); @249
// &Force("nonport","set1_half3_result_fmfvr"); @250

assign doub_mtvr_src0[63:0]    = ex1_op_fmvfx ? dp_vfalu_ex1_pipex_mtvr_src0[63:0]
                                              : ex1_pipex_src1[63:0];     
assign set0_oper0[63:0]        = ex1_pipex_src0[63:0];
assign set0_oper1[63:0]        = ex1_pipex_src1[63:0];
assign ex1_doub_op_fmv         = ex1_op_doub_fmvfx;
assign ex1_sing_op_fmv         = ex1_op_sing_fmvfx;
assign ex1_half_op_fmv         = ex1_op_half_fmvfx;
//double
// &Force("nonport","set0_sing1_result_fmfvr"); @315
// &ConnRule(s/result/set0_doub_result/); @316
// &ConnRule(s/ex1_op_/ex1_op_doub_/); @317
// &Instance("ct_fspu_double","x_set0_ct_fspu_double"); @318
ct_fspu_double  x_set0_ct_fspu_double (
  .ex1_op_fmvvf            (ex1_doub_op_fmv        ),
  .ex1_op_fsgnj            (ex1_op_doub_fsgnj      ),
  .ex1_op_fsgnjn           (ex1_op_doub_fsgnjn     ),
  .ex1_op_fsgnjx           (ex1_op_doub_fsgnjx     ),
  .ex1_oper0               (set0_oper0[63:0]       ),
  .ex1_oper1               (set0_oper1[63:0]       ),
  .ex1_result              (ex1_set0_doub_result   ),
  .mtvr_src0               (doub_mtvr_src0         ),
  .result_fclass           (set0_doub_result_fclass),
  .result_fmfvr            (set0_doub_result_fmfvr )
);

// &Connect(.ex1_oper0(set0_oper0[63:0])); @319
// &Connect(.ex1_oper1(set0_oper1[63:0])); @320
// &Connect(.mtvr_src0(doub_mtvr_src0)); @321
// &Connect(.ex1_op_fmvvf(ex1_doub_op_fmv)); @322
//single 0
// &ConnRule(s/result/set0_sing0_result/); @324
// &ConnRule(s/ex1_op_/ex1_op_sing_/); @325
// &Instance("ct_fspu_single","x_set0_ct_fspu_single0"); @326
ct_fspu_single  x_set0_ct_fspu_single0 (
  .check_nan                (1'b0                    ),
  .ex1_op_fmvvf             (ex1_sing_op_fmv         ),
  .ex1_op_fsgnj             (ex1_op_sing_fsgnj       ),
  .ex1_op_fsgnjn            (ex1_op_sing_fsgnjn      ),
  .ex1_op_fsgnjx            (ex1_op_sing_fsgnjx      ),
  .ex1_oper0                (set0_oper0[63:0]        ),
  .ex1_oper1                (set0_oper1[63:0]        ),
  .ex1_result               (ex1_set0_sing0_result   ),
  .ex1_scalar               (1'b1                    ),
  .mtvr_src0                (doub_mtvr_src0[63:0]    ),
  .result_fclass            (set0_sing0_result_fclass),
  .result_fmfvr             (set0_sing0_result_fmfvr )
);

// &Connect(.ex1_oper0(set0_oper0[63:0])); @327
// &Connect(.ex1_oper1(set0_oper1[63:0])); @328
// &Connect(.mtvr_src0(doub_mtvr_src0[63:0])); @329
// &Connect(.ex1_op_fmvvf(ex1_sing_op_fmv)); @330
// &Connect(.ex1_scalar(1'b1)); @331
// &Connect(.check_nan(1'b0)); @332
//half 0 
// &ConnRule(s/result/set0_half0_result/); @334
// &Instance("ct_fspu_half","x_set0_ct_fspu_half0"); @335
ct_fspu_half  x_set0_ct_fspu_half0 (
  .check_nan                (1'b0                    ),
  .ex1_op_fmvvf             (ex1_half_op_fmv         ),
  .ex1_op_fsgnj             (ex1_op_fsgnj            ),
  .ex1_op_fsgnjn            (ex1_op_fsgnjn           ),
  .ex1_op_fsgnjx            (ex1_op_fsgnjx           ),
  .ex1_oper0                (set0_oper0[63:0]        ),
  .ex1_oper1                (set0_oper1[63:0]        ),
  .ex1_result               (ex1_set0_half0_result   ),
  .ex1_scalar               (1'b1                    ),
  .mtvr_src0                (doub_mtvr_src0[63:0]    ),
  .result_fclass            (set0_half0_result_fclass),
  .result_fmfvr             (set0_half0_result_fmfvr )
);

// &Connect(.ex1_oper0(set0_oper0[63:0])); @336
// &Connect(.ex1_oper1(set0_oper1[63:0])); @337
// &Connect(.mtvr_src0(doub_mtvr_src0[63:0])); @338
// &Connect(.ex1_scalar(1'b1)); @339
// &Connect(.ex1_op_fmvvf(ex1_half_op_fmv)); @340
// &Connect(.check_nan(1'b0)); @341


assign scalar_int_mvxf_result[63:0]         = ex1_double ? set0_doub_result_fmfvr[63:0] :
                                              ex1_single ? set0_sing0_result_fmfvr[63:0]
                                                         :  set0_half0_result_fmfvr[63:0];
assign scalar_int_class_result[63:0]        = ex1_double ? set0_doub_result_fclass[63:0] :
                                              ex1_single ? {32'b0,set0_sing0_result_fclass[31:0]}
                                                         : {48'b0,set0_half0_result_fclass[15:0]} ;  
assign scalar_x_result[63:0]                = {64{ex1_op_class}} & scalar_int_class_result[63:0] |
                                              {64{ex1_op_fmvxf}}   & scalar_int_mvxf_result[63:0];
                             
//assign pipex_dp_ex1_vfalu_mfvr_data[63:0]   = scalar_x_result[63:0];
assign fspu_mfvr_data[63:0]                 = scalar_x_result[63:0];
assign ex1_freg_result[63:0]                = ex1_double ? ex1_set0_doub_result[63:0]  :
                                              ex1_single ? ex1_set0_sing0_result[63:0] :
                                                           ex1_set0_half0_result[63:0];
assign ex1_result[63:0]                     = ex1_freg_result[63:0];
  


//=======================Pipe to EX2========================
//gate clk
// &Instance("gated_clk_cell","x_ex1_pipe_clk"); @365
gated_clk_cell  x_ex1_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @366
//           .clk_out        (ex1_pipe_clk),//Out Clock @367
//           .external_en    (1'b0), @368
//           .global_en      (cp0_yy_clk_en), @369
//           .local_en       (ex1_pipe_clk_en),//Local Condition @370
//           .module_en      (cp0_vfpu_icg_en) @371
//         ); @372
assign ex1_pipe_clk_en = ex1_pipedown;

always @(posedge ex1_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    fspu_ex2_result[63:0]  <= 64'b0;
  end
  else if(ex1_pipedown)
  begin
    fspu_ex2_result[63:0]  <= ex1_result[63:0];
  end
  else
  begin
    fspu_ex2_result[63:0]  <= fspu_ex2_result[63:0];
  end
end
//=======================Pipe to EX3========================
//gate clk
// &Instance("gated_clk_cell","x_ex2_pipe_clk"); @421
gated_clk_cell  x_ex2_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @422
//           .clk_out        (ex2_pipe_clk),//Out Clock @423
//           .external_en    (1'b0), @424
//           .global_en      (cp0_yy_clk_en), @425
//           .local_en       (ex2_pipe_clk_en),//Local Condition @426
//           .module_en      (cp0_vfpu_icg_en) @427
//         ); @428
assign ex2_pipe_clk_en = ex2_pipedown;

always @(posedge ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    fspu_ex3_result[63:0]  <= 64'b0;
  else if(ex2_pipedown)
    fspu_ex3_result[63:0]  <= fspu_ex3_result_pre[63:0];
  else
    fspu_ex3_result[63:0]  <= fspu_ex3_result[63:0];
end
assign fspu_ex3_result_pre[63:0]  = fspu_ex2_result[63:0];
assign fspu_forward_result[63:0]   = fspu_ex3_result[63:0];
assign fspu_forward_r_vld      = ex3_pipedown;

// &ModuleEnd; @495
endmodule


