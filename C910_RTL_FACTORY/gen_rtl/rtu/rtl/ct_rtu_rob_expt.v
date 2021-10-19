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

// &ModuleBeg; @27
module ct_rtu_rob_expt(
  cp0_rtu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  expt_entry_expt_vld_updt_val,
  expt_entry_iid,
  expt_entry_vld,
  forever_cpuclk,
  iu_rtu_pipe0_abnormal,
  iu_rtu_pipe0_bkpt,
  iu_rtu_pipe0_cmplt,
  iu_rtu_pipe0_efpc_vld,
  iu_rtu_pipe0_expt_vec,
  iu_rtu_pipe0_expt_vld,
  iu_rtu_pipe0_flush,
  iu_rtu_pipe0_high_hw_expt,
  iu_rtu_pipe0_iid,
  iu_rtu_pipe0_immu_expt,
  iu_rtu_pipe0_mtval,
  iu_rtu_pipe0_vsetvl,
  iu_rtu_pipe0_vstart,
  iu_rtu_pipe0_vstart_vld,
  iu_rtu_pipe2_abnormal,
  iu_rtu_pipe2_bht_mispred,
  iu_rtu_pipe2_cmplt,
  iu_rtu_pipe2_iid,
  iu_rtu_pipe2_jmp_mispred,
  lsu_rtu_da_pipe3_split_spec_fail_iid,
  lsu_rtu_da_pipe3_split_spec_fail_vld,
  lsu_rtu_da_pipe4_split_spec_fail_iid,
  lsu_rtu_da_pipe4_split_spec_fail_vld,
  lsu_rtu_wb_pipe3_abnormal,
  lsu_rtu_wb_pipe3_cmplt,
  lsu_rtu_wb_pipe3_expt_vec,
  lsu_rtu_wb_pipe3_expt_vld,
  lsu_rtu_wb_pipe3_flush,
  lsu_rtu_wb_pipe3_iid,
  lsu_rtu_wb_pipe3_mtval,
  lsu_rtu_wb_pipe3_spec_fail,
  lsu_rtu_wb_pipe3_vsetvl,
  lsu_rtu_wb_pipe3_vstart,
  lsu_rtu_wb_pipe3_vstart_vld,
  lsu_rtu_wb_pipe4_abnormal,
  lsu_rtu_wb_pipe4_cmplt,
  lsu_rtu_wb_pipe4_expt_vec,
  lsu_rtu_wb_pipe4_expt_vld,
  lsu_rtu_wb_pipe4_flush,
  lsu_rtu_wb_pipe4_iid,
  lsu_rtu_wb_pipe4_mtval,
  lsu_rtu_wb_pipe4_spec_fail,
  lsu_rtu_wb_pipe4_vstart,
  lsu_rtu_wb_pipe4_vstart_vld,
  pad_yy_icg_scan_en,
  retire_expt_inst0_abnormal,
  retire_expt_inst0_vld,
  retire_rob_flush,
  rob_expt_inst0_iid,
  rob_retire_inst0_bht_mispred,
  rob_retire_inst0_bkpt,
  rob_retire_inst0_efpc_vld,
  rob_retire_inst0_expt_vec,
  rob_retire_inst0_expt_vld,
  rob_retire_inst0_high_hw_expt,
  rob_retire_inst0_immu_expt,
  rob_retire_inst0_inst_flush,
  rob_retire_inst0_jmp_mispred,
  rob_retire_inst0_mtval,
  rob_retire_inst0_spec_fail,
  rob_retire_inst0_spec_fail_no_ssf,
  rob_retire_inst0_spec_fail_ssf,
  rob_retire_inst0_split,
  rob_retire_inst0_vsetvl,
  rob_retire_inst0_vstart,
  rob_retire_inst0_vstart_vld,
  rob_retire_split_spec_fail_srt,
  rob_retire_ssf_iid,
  rob_top_ssf_cur_state,
  rtu_yy_xx_flush
);

// &Ports; @28
input           cp0_rtu_icg_en;                      
input           cp0_yy_clk_en;                       
input           cpurst_b;                            
input           forever_cpuclk;                      
input           iu_rtu_pipe0_abnormal;               
input           iu_rtu_pipe0_bkpt;                   
input           iu_rtu_pipe0_cmplt;                  
input           iu_rtu_pipe0_efpc_vld;               
input   [4 :0]  iu_rtu_pipe0_expt_vec;               
input           iu_rtu_pipe0_expt_vld;               
input           iu_rtu_pipe0_flush;                  
input           iu_rtu_pipe0_high_hw_expt;           
input   [6 :0]  iu_rtu_pipe0_iid;                    
input           iu_rtu_pipe0_immu_expt;              
input   [31:0]  iu_rtu_pipe0_mtval;                  
input           iu_rtu_pipe0_vsetvl;                 
input   [6 :0]  iu_rtu_pipe0_vstart;                 
input           iu_rtu_pipe0_vstart_vld;             
input           iu_rtu_pipe2_abnormal;               
input           iu_rtu_pipe2_bht_mispred;            
input           iu_rtu_pipe2_cmplt;                  
input   [6 :0]  iu_rtu_pipe2_iid;                    
input           iu_rtu_pipe2_jmp_mispred;            
input   [6 :0]  lsu_rtu_da_pipe3_split_spec_fail_iid; 
input           lsu_rtu_da_pipe3_split_spec_fail_vld; 
input   [6 :0]  lsu_rtu_da_pipe4_split_spec_fail_iid; 
input           lsu_rtu_da_pipe4_split_spec_fail_vld; 
input           lsu_rtu_wb_pipe3_abnormal;           
input           lsu_rtu_wb_pipe3_cmplt;              
input   [4 :0]  lsu_rtu_wb_pipe3_expt_vec;           
input           lsu_rtu_wb_pipe3_expt_vld;           
input           lsu_rtu_wb_pipe3_flush;              
input   [6 :0]  lsu_rtu_wb_pipe3_iid;                
input   [39:0]  lsu_rtu_wb_pipe3_mtval;              
input           lsu_rtu_wb_pipe3_spec_fail;          
input           lsu_rtu_wb_pipe3_vsetvl;             
input   [6 :0]  lsu_rtu_wb_pipe3_vstart;             
input           lsu_rtu_wb_pipe3_vstart_vld;         
input           lsu_rtu_wb_pipe4_abnormal;           
input           lsu_rtu_wb_pipe4_cmplt;              
input   [4 :0]  lsu_rtu_wb_pipe4_expt_vec;           
input           lsu_rtu_wb_pipe4_expt_vld;           
input           lsu_rtu_wb_pipe4_flush;              
input   [6 :0]  lsu_rtu_wb_pipe4_iid;                
input   [39:0]  lsu_rtu_wb_pipe4_mtval;              
input           lsu_rtu_wb_pipe4_spec_fail;          
input   [6 :0]  lsu_rtu_wb_pipe4_vstart;             
input           lsu_rtu_wb_pipe4_vstart_vld;         
input           pad_yy_icg_scan_en;                  
input           retire_expt_inst0_abnormal;          
input           retire_expt_inst0_vld;               
input           retire_rob_flush;                    
input   [6 :0]  rob_expt_inst0_iid;                  
input           rob_retire_inst0_split;              
input           rtu_yy_xx_flush;                     
output          expt_entry_expt_vld_updt_val;        
output  [6 :0]  expt_entry_iid;                      
output          expt_entry_vld;                      
output          rob_retire_inst0_bht_mispred;        
output          rob_retire_inst0_bkpt;               
output          rob_retire_inst0_efpc_vld;           
output  [3 :0]  rob_retire_inst0_expt_vec;           
output          rob_retire_inst0_expt_vld;           
output          rob_retire_inst0_high_hw_expt;       
output          rob_retire_inst0_immu_expt;          
output          rob_retire_inst0_inst_flush;         
output          rob_retire_inst0_jmp_mispred;        
output  [39:0]  rob_retire_inst0_mtval;              
output          rob_retire_inst0_spec_fail;          
output          rob_retire_inst0_spec_fail_no_ssf;   
output          rob_retire_inst0_spec_fail_ssf;      
output          rob_retire_inst0_vsetvl;             
output  [6 :0]  rob_retire_inst0_vstart;             
output          rob_retire_inst0_vstart_vld;         
output          rob_retire_split_spec_fail_srt;      
output  [6 :0]  rob_retire_ssf_iid;                  
output  [1 :0]  rob_top_ssf_cur_state;               

// &Regs; @29
reg     [69:0]  expt_entry_data;                     
reg     [69:0]  expt_entry_updt_data;                
reg             expt_entry_vld;                      
reg     [1 :0]  ssf_cur_state;                       
reg     [6 :0]  ssf_iid;                             
reg     [1 :0]  ssf_next_state;                      

// &Wires; @30
wire            cp0_rtu_icg_en;                      
wire            cp0_yy_clk_en;                       
wire            cpurst_b;                            
wire            entry_clk;                           
wire            entry_clk_en;                        
wire            expt_cmplt;                          
wire            expt_entry_bht_mispred;              
wire            expt_entry_bkpt;                     
wire            expt_entry_efpc_vld;                 
wire    [3 :0]  expt_entry_expt_vec;                 
wire            expt_entry_expt_vld;                 
wire            expt_entry_expt_vld_updt_val;        
wire            expt_entry_flush;                    
wire            expt_entry_high_hw_expt;             
wire    [6 :0]  expt_entry_iid;                      
wire            expt_entry_immu_expt;                
wire            expt_entry_jmp_mispred;              
wire    [39:0]  expt_entry_mtval;                    
wire            expt_entry_spec_fail;                
wire            expt_entry_vsetvl;                   
wire    [6 :0]  expt_entry_vstart;                   
wire            expt_entry_vstart_vld;               
wire    [4 :0]  expt_entry_write_sel;                
wire            forever_cpuclk;                      
wire            iu_rtu_pipe0_abnormal;               
wire            iu_rtu_pipe0_bkpt;                   
wire            iu_rtu_pipe0_cmplt;                  
wire            iu_rtu_pipe0_efpc_vld;               
wire    [4 :0]  iu_rtu_pipe0_expt_vec;               
wire            iu_rtu_pipe0_expt_vld;               
wire            iu_rtu_pipe0_flush;                  
wire            iu_rtu_pipe0_high_hw_expt;           
wire    [6 :0]  iu_rtu_pipe0_iid;                    
wire            iu_rtu_pipe0_immu_expt;              
wire    [31:0]  iu_rtu_pipe0_mtval;                  
wire            iu_rtu_pipe0_vsetvl;                 
wire    [6 :0]  iu_rtu_pipe0_vstart;                 
wire            iu_rtu_pipe0_vstart_vld;             
wire            iu_rtu_pipe2_abnormal;               
wire            iu_rtu_pipe2_bht_mispred;            
wire            iu_rtu_pipe2_cmplt;                  
wire    [6 :0]  iu_rtu_pipe2_iid;                    
wire            iu_rtu_pipe2_jmp_mispred;            
wire    [6 :0]  lsu_rtu_da_pipe3_split_spec_fail_iid; 
wire            lsu_rtu_da_pipe3_split_spec_fail_vld; 
wire    [6 :0]  lsu_rtu_da_pipe4_split_spec_fail_iid; 
wire            lsu_rtu_da_pipe4_split_spec_fail_vld; 
wire            lsu_rtu_wb_pipe3_abnormal;           
wire            lsu_rtu_wb_pipe3_cmplt;              
wire    [4 :0]  lsu_rtu_wb_pipe3_expt_vec;           
wire            lsu_rtu_wb_pipe3_expt_vld;           
wire            lsu_rtu_wb_pipe3_flush;              
wire    [6 :0]  lsu_rtu_wb_pipe3_iid;                
wire    [39:0]  lsu_rtu_wb_pipe3_mtval;              
wire            lsu_rtu_wb_pipe3_spec_fail;          
wire            lsu_rtu_wb_pipe3_vsetvl;             
wire    [6 :0]  lsu_rtu_wb_pipe3_vstart;             
wire            lsu_rtu_wb_pipe3_vstart_vld;         
wire            lsu_rtu_wb_pipe4_abnormal;           
wire            lsu_rtu_wb_pipe4_cmplt;              
wire    [4 :0]  lsu_rtu_wb_pipe4_expt_vec;           
wire            lsu_rtu_wb_pipe4_expt_vld;           
wire            lsu_rtu_wb_pipe4_flush;              
wire    [6 :0]  lsu_rtu_wb_pipe4_iid;                
wire    [39:0]  lsu_rtu_wb_pipe4_mtval;              
wire            lsu_rtu_wb_pipe4_spec_fail;          
wire    [6 :0]  lsu_rtu_wb_pipe4_vstart;             
wire            lsu_rtu_wb_pipe4_vstart_vld;         
wire            pad_yy_icg_scan_en;                  
wire            pipe0_expt_cmplt;                    
wire    [69:0]  pipe0_expt_cmplt_data;               
wire            pipe0_older_e;                       
wire            pipe2_expt_cmplt;                    
wire    [69:0]  pipe2_expt_cmplt_data;               
wire            pipe2_older_0;                       
wire            pipe2_older_e;                       
wire            pipe3_expt_cmplt;                    
wire    [69:0]  pipe3_expt_cmplt_data;               
wire            pipe3_older_0;                       
wire            pipe3_older_2;                       
wire            pipe3_older_e;                       
wire            pipe4_expt_cmplt;                    
wire    [69:0]  pipe4_expt_cmplt_data;               
wire            pipe4_older_0;                       
wire            pipe4_older_2;                       
wire            pipe4_older_3;                       
wire            pipe4_older_e;                       
wire            retire_expt_inst0_abnormal;          
wire            retire_expt_inst0_vld;               
wire            retire_rob_flush;                    
wire    [6 :0]  rob_expt_inst0_iid;                  
wire            rob_retire_inst0_bht_mispred;        
wire            rob_retire_inst0_bkpt;               
wire            rob_retire_inst0_efpc_vld;           
wire    [3 :0]  rob_retire_inst0_expt_vec;           
wire            rob_retire_inst0_expt_vld;           
wire            rob_retire_inst0_high_hw_expt;       
wire            rob_retire_inst0_immu_expt;          
wire            rob_retire_inst0_inst_flush;         
wire            rob_retire_inst0_jmp_mispred;        
wire    [39:0]  rob_retire_inst0_mtval;              
wire            rob_retire_inst0_spec_fail;          
wire            rob_retire_inst0_spec_fail_no_ssf;   
wire            rob_retire_inst0_spec_fail_ssf;      
wire            rob_retire_inst0_split;              
wire            rob_retire_inst0_vsetvl;             
wire    [6 :0]  rob_retire_inst0_vstart;             
wire            rob_retire_inst0_vstart_vld;         
wire            rob_retire_split_spec_fail_srt;      
wire    [6 :0]  rob_retire_ssf_iid;                  
wire    [1 :0]  rob_top_ssf_cur_state;               
wire            rtu_yy_xx_flush;                     
wire            ssf_clk;                             
wire            ssf_clk_en;                          
wire    [6 :0]  ssf_iid_updt_val;                    
wire            ssf_inst_retire_no_split;            
wire            ssf_pipe3_iid_updt_vld;              
wire            ssf_pipe3_older_sm;                  
wire            ssf_pipe4_iid_updt_vld;              
wire            ssf_pipe4_older_3;                   
wire            ssf_pipe4_older_sm;                  
wire            ssf_sm_iid_updt_vld;                 
wire            ssf_sm_start;                        
wire            ssf_split_spec_fail_flush;           
wire            ssf_split_spec_fail_retire;          



parameter EXPT_WIDTH   = 70;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = expt_cmplt || expt_entry_vld;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @39
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @40
//          .external_en (1'b0), @41
//          .global_en   (cp0_yy_clk_en), @42
//          .module_en   (cp0_rtu_icg_en), @43
//          .local_en    (entry_clk_en), @44
//          .clk_out     (entry_clk)); @45

//==========================================================
//                 Exception Cmplt Order
//==========================================================
//----------------------------------------------------------
//                     Order Compare
//----------------------------------------------------------
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe4_older_3"); @53
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe4_older_3 (
  .x_iid0                    (lsu_rtu_wb_pipe4_iid[6:0]),
  .x_iid0_older              (pipe4_older_3            ),
  .x_iid1                    (lsu_rtu_wb_pipe3_iid[6:0])
);

// &Connect(.x_iid0       (lsu_rtu_wb_pipe4_iid[6:0]), @54
//          .x_iid1       (lsu_rtu_wb_pipe3_iid[6:0]), @55
//          .x_iid0_older (pipe4_older_3          )); @56
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe4_older_2"); @57
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe4_older_2 (
  .x_iid0                    (lsu_rtu_wb_pipe4_iid[6:0]),
  .x_iid0_older              (pipe4_older_2            ),
  .x_iid1                    (iu_rtu_pipe2_iid[6:0]    )
);

// &Connect(.x_iid0       (lsu_rtu_wb_pipe4_iid[6:0]), @58
//          .x_iid1       (iu_rtu_pipe2_iid[6:0]), @59
//          .x_iid0_older (pipe4_older_2          )); @60
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe4_older_0"); @61
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe4_older_0 (
  .x_iid0                    (lsu_rtu_wb_pipe4_iid[6:0]),
  .x_iid0_older              (pipe4_older_0            ),
  .x_iid1                    (iu_rtu_pipe0_iid[6:0]    )
);

// &Connect(.x_iid0       (lsu_rtu_wb_pipe4_iid[6:0]), @62
//          .x_iid1       (iu_rtu_pipe0_iid[6:0]), @63
//          .x_iid0_older (pipe4_older_0          )); @64
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe4_older_e"); @65
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe4_older_e (
  .x_iid0                    (lsu_rtu_wb_pipe4_iid[6:0]),
  .x_iid0_older              (pipe4_older_e            ),
  .x_iid1                    (expt_entry_iid[6:0]      )
);

// &Connect(.x_iid0       (lsu_rtu_wb_pipe4_iid[6:0]), @66
//          .x_iid1       (expt_entry_iid[6:0]    ), @67
//          .x_iid0_older (pipe4_older_e          )); @68
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe3_older_2"); @69
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe3_older_2 (
  .x_iid0                    (lsu_rtu_wb_pipe3_iid[6:0]),
  .x_iid0_older              (pipe3_older_2            ),
  .x_iid1                    (iu_rtu_pipe2_iid[6:0]    )
);

// &Connect(.x_iid0       (lsu_rtu_wb_pipe3_iid[6:0]), @70
//          .x_iid1       (iu_rtu_pipe2_iid[6:0]), @71
//          .x_iid0_older (pipe3_older_2          ));        @72
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe3_older_0"); @73
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe3_older_0 (
  .x_iid0                    (lsu_rtu_wb_pipe3_iid[6:0]),
  .x_iid0_older              (pipe3_older_0            ),
  .x_iid1                    (iu_rtu_pipe0_iid[6:0]    )
);

// &Connect(.x_iid0       (lsu_rtu_wb_pipe3_iid[6:0]), @74
//          .x_iid1       (iu_rtu_pipe0_iid[6:0]), @75
//          .x_iid0_older (pipe3_older_0          ));        @76
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe3_older_e"); @77
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe3_older_e (
  .x_iid0                    (lsu_rtu_wb_pipe3_iid[6:0]),
  .x_iid0_older              (pipe3_older_e            ),
  .x_iid1                    (expt_entry_iid[6:0]      )
);

// &Connect(.x_iid0       (lsu_rtu_wb_pipe3_iid[6:0]), @78
//          .x_iid1       (expt_entry_iid[6:0]    ), @79
//          .x_iid0_older (pipe3_older_e          ));        @80
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe2_older_0"); @81
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe2_older_0 (
  .x_iid0                (iu_rtu_pipe2_iid[6:0]),
  .x_iid0_older          (pipe2_older_0        ),
  .x_iid1                (iu_rtu_pipe0_iid[6:0])
);

// &Connect(.x_iid0       (iu_rtu_pipe2_iid[6:0]), @82
//          .x_iid1       (iu_rtu_pipe0_iid[6:0]), @83
//          .x_iid0_older (pipe2_older_0          )); @84
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe2_older_e"); @85
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe2_older_e (
  .x_iid0                (iu_rtu_pipe2_iid[6:0]),
  .x_iid0_older          (pipe2_older_e        ),
  .x_iid1                (expt_entry_iid[6:0]  )
);

// &Connect(.x_iid0       (iu_rtu_pipe2_iid[6:0]), @86
//          .x_iid1       (expt_entry_iid[6:0]    ), @87
//          .x_iid0_older (pipe2_older_e          )); @88
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_pipe0_older_e"); @89
ct_rtu_compare_iid  x_ct_rtu_compare_iid_pipe0_older_e (
  .x_iid0                (iu_rtu_pipe0_iid[6:0]),
  .x_iid0_older          (pipe0_older_e        ),
  .x_iid1                (expt_entry_iid[6:0]  )
);

// &Connect(.x_iid0       (iu_rtu_pipe0_iid[6:0]), @90
//          .x_iid1       (expt_entry_iid[6:0]    ), @91
//          .x_iid0_older (pipe0_older_e          )); @92

//----------------------------------------------------------
//                Expt cmplt select signals
//----------------------------------------------------------
assign pipe4_expt_cmplt = lsu_rtu_wb_pipe4_cmplt && lsu_rtu_wb_pipe4_abnormal;
assign pipe3_expt_cmplt = lsu_rtu_wb_pipe3_cmplt && lsu_rtu_wb_pipe3_abnormal;
assign pipe2_expt_cmplt = iu_rtu_pipe2_cmplt && iu_rtu_pipe2_abnormal;
assign pipe0_expt_cmplt = iu_rtu_pipe0_cmplt && iu_rtu_pipe0_abnormal;

assign expt_entry_write_sel[4] = pipe4_expt_cmplt
         && (!pipe3_expt_cmplt || pipe4_older_3)
         && (!pipe2_expt_cmplt || pipe4_older_2)
         && (!pipe0_expt_cmplt || pipe4_older_0)
         && (!expt_entry_vld   || pipe4_older_e);
assign expt_entry_write_sel[3] = pipe3_expt_cmplt
         && (!pipe4_expt_cmplt || !pipe4_older_3)
         && (!pipe2_expt_cmplt || pipe3_older_2)
         && (!pipe0_expt_cmplt || pipe3_older_0)
         && (!expt_entry_vld   || pipe3_older_e);
assign expt_entry_write_sel[2] = pipe2_expt_cmplt
         && (!pipe4_expt_cmplt || !pipe4_older_2)
         && (!pipe3_expt_cmplt || !pipe3_older_2)
         && (!pipe0_expt_cmplt || pipe2_older_0)
         && (!expt_entry_vld   || pipe2_older_e);
assign expt_entry_write_sel[1] = pipe0_expt_cmplt
         && (!pipe4_expt_cmplt || !pipe4_older_0)
         && (!pipe3_expt_cmplt || !pipe3_older_0)
         && (!pipe2_expt_cmplt || !pipe2_older_0)
         && (!expt_entry_vld   || pipe0_older_e);
assign expt_entry_write_sel[0] = expt_entry_vld
         && (!pipe4_expt_cmplt || !pipe4_older_e)
         && (!pipe3_expt_cmplt || !pipe3_older_e)
         && (!pipe2_expt_cmplt || !pipe2_older_e)
         && (!pipe0_expt_cmplt || !pipe0_older_e);

assign pipe4_expt_cmplt_data[69:63] = lsu_rtu_wb_pipe4_vstart[6:0];
assign pipe4_expt_cmplt_data[62]    = lsu_rtu_wb_pipe4_vstart_vld;
assign pipe4_expt_cmplt_data[61]    = 1'b0;
assign pipe4_expt_cmplt_data[60]    = 1'b0;
assign pipe4_expt_cmplt_data[59]    = lsu_rtu_wb_pipe4_spec_fail;
assign pipe4_expt_cmplt_data[58]    = 1'b0;
assign pipe4_expt_cmplt_data[57]    = lsu_rtu_wb_pipe4_flush;
assign pipe4_expt_cmplt_data[56]    = 1'b0;
assign pipe4_expt_cmplt_data[55]    = 1'b0;
assign pipe4_expt_cmplt_data[54:15] = lsu_rtu_wb_pipe4_mtval[39:0];
assign pipe4_expt_cmplt_data[14]    = 1'b0;
assign pipe4_expt_cmplt_data[13]    = 1'b0;
assign pipe4_expt_cmplt_data[12:8]  = lsu_rtu_wb_pipe4_expt_vec[4:0];
assign pipe4_expt_cmplt_data[7]     = lsu_rtu_wb_pipe4_expt_vld;
assign pipe4_expt_cmplt_data[6:0]   = lsu_rtu_wb_pipe4_iid[6:0];

assign pipe3_expt_cmplt_data[69:63] = lsu_rtu_wb_pipe3_vstart[6:0];
assign pipe3_expt_cmplt_data[62]    = lsu_rtu_wb_pipe3_vstart_vld;
assign pipe3_expt_cmplt_data[61]    = lsu_rtu_wb_pipe3_vsetvl;
assign pipe3_expt_cmplt_data[60]    = 1'b0;
assign pipe3_expt_cmplt_data[59]    = lsu_rtu_wb_pipe3_spec_fail;
assign pipe3_expt_cmplt_data[58]    = 1'b0;
assign pipe3_expt_cmplt_data[57]    = lsu_rtu_wb_pipe3_flush;
assign pipe3_expt_cmplt_data[56]    = 1'b0;
assign pipe3_expt_cmplt_data[55]    = 1'b0;
assign pipe3_expt_cmplt_data[54:15] = lsu_rtu_wb_pipe3_mtval[39:0];
assign pipe3_expt_cmplt_data[14]    = 1'b0;
assign pipe3_expt_cmplt_data[13]    = 1'b0;
assign pipe3_expt_cmplt_data[12:8]  = lsu_rtu_wb_pipe3_expt_vec[4:0];
assign pipe3_expt_cmplt_data[7]     = lsu_rtu_wb_pipe3_expt_vld;
assign pipe3_expt_cmplt_data[6:0]   = lsu_rtu_wb_pipe3_iid[6:0];

assign pipe2_expt_cmplt_data[69:63] = 7'b0;
assign pipe2_expt_cmplt_data[62]    = 1'b0;
assign pipe2_expt_cmplt_data[61]    = 1'b0;
assign pipe2_expt_cmplt_data[60]    = 1'b0;
assign pipe2_expt_cmplt_data[59]    = 1'b0;
assign pipe2_expt_cmplt_data[58]    = 1'b0;
assign pipe2_expt_cmplt_data[57]    = 1'b0;
assign pipe2_expt_cmplt_data[56]    = iu_rtu_pipe2_jmp_mispred;
assign pipe2_expt_cmplt_data[55]    = iu_rtu_pipe2_bht_mispred;
assign pipe2_expt_cmplt_data[54:15] = 40'b0;
assign pipe2_expt_cmplt_data[14]    = 1'b0;
assign pipe2_expt_cmplt_data[13]    = 1'b0;
assign pipe2_expt_cmplt_data[12:8]  = 5'b0;
assign pipe2_expt_cmplt_data[7]     = 1'b0;
assign pipe2_expt_cmplt_data[6:0]   = iu_rtu_pipe2_iid[6:0];

assign pipe0_expt_cmplt_data[69:63] = iu_rtu_pipe0_vstart[6:0];
assign pipe0_expt_cmplt_data[62]    = iu_rtu_pipe0_vstart_vld;
assign pipe0_expt_cmplt_data[61]    = iu_rtu_pipe0_vsetvl;
assign pipe0_expt_cmplt_data[60]    = iu_rtu_pipe0_efpc_vld;
assign pipe0_expt_cmplt_data[59]    = 1'b0;
assign pipe0_expt_cmplt_data[58]    = iu_rtu_pipe0_bkpt;
assign pipe0_expt_cmplt_data[57]    = iu_rtu_pipe0_flush;
assign pipe0_expt_cmplt_data[56]    = 1'b0;
assign pipe0_expt_cmplt_data[55]    = 1'b0;
assign pipe0_expt_cmplt_data[54:15] = {8'b0, iu_rtu_pipe0_mtval[31:0]};
assign pipe0_expt_cmplt_data[14]    = iu_rtu_pipe0_immu_expt;
assign pipe0_expt_cmplt_data[13]    = iu_rtu_pipe0_high_hw_expt;
assign pipe0_expt_cmplt_data[12:8]  = iu_rtu_pipe0_expt_vec[4:0];
assign pipe0_expt_cmplt_data[7]     = iu_rtu_pipe0_expt_vld;
assign pipe0_expt_cmplt_data[6:0]   = iu_rtu_pipe0_iid[6:0];

// &CombBeg; @192
always @( expt_entry_write_sel[4:0]
       or pipe4_expt_cmplt_data[69:0]
       or pipe2_expt_cmplt_data[69:0]
       or pipe0_expt_cmplt_data[69:0]
       or expt_entry_data[69:0]
       or pipe3_expt_cmplt_data[69:0])
begin
  case (expt_entry_write_sel[4:0])
    5'h01  : expt_entry_updt_data[EXPT_WIDTH-1:0] = expt_entry_data[EXPT_WIDTH-1:0];
    5'h02  : expt_entry_updt_data[EXPT_WIDTH-1:0] = pipe0_expt_cmplt_data[EXPT_WIDTH-1:0];
    5'h04  : expt_entry_updt_data[EXPT_WIDTH-1:0] = pipe2_expt_cmplt_data[EXPT_WIDTH-1:0];
    5'h08  : expt_entry_updt_data[EXPT_WIDTH-1:0] = pipe3_expt_cmplt_data[EXPT_WIDTH-1:0];
    5'h10  : expt_entry_updt_data[EXPT_WIDTH-1:0] = pipe4_expt_cmplt_data[EXPT_WIDTH-1:0];
    default: expt_entry_updt_data[EXPT_WIDTH-1:0] = {EXPT_WIDTH{1'bx}};
  endcase
// &CombEnd; @201
end

//==========================================================
//                 Exception Entry Valid
//==========================================================
// &Force("output","expt_entry_vld"); @206
assign expt_cmplt = pipe4_expt_cmplt
                    || pipe3_expt_cmplt
                    || pipe2_expt_cmplt
                    || pipe0_expt_cmplt;

always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    expt_entry_vld <= 1'b0;
  //flush with rob, if spec inst on wrong path set expt, flush again
  //when flush be
  else if(retire_rob_flush || rtu_yy_xx_flush)
    expt_entry_vld <= 1'b0;
  else if(expt_cmplt)
    expt_entry_vld <= 1'b1;
  else if(retire_expt_inst0_vld && retire_expt_inst0_abnormal)
    expt_entry_vld <= 1'b0;
  else
    expt_entry_vld <= expt_entry_vld;
end

//==========================================================
//                     Expt Cmplt Info
//==========================================================
assign expt_entry_expt_vld_updt_val = (expt_cmplt) ? expt_entry_updt_data[7]
                                                   : expt_entry_data[7];
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    expt_entry_data[EXPT_WIDTH-1:0] <= {EXPT_WIDTH{1'b0}};
  else if(expt_cmplt)
    expt_entry_data[EXPT_WIDTH-1:0] <= expt_entry_updt_data[EXPT_WIDTH-1:0];
  else
    expt_entry_data[EXPT_WIDTH-1:0] <= expt_entry_data[EXPT_WIDTH-1:0];
end

// &Force("output","expt_entry_iid"); @243
assign expt_entry_vstart[6:0]   = expt_entry_data[69:63];
assign expt_entry_vstart_vld    = expt_entry_data[62];
assign expt_entry_vsetvl        = expt_entry_data[61];
assign expt_entry_efpc_vld      = expt_entry_data[60];
assign expt_entry_spec_fail     = expt_entry_data[59];
assign expt_entry_bkpt          = expt_entry_data[58];
assign expt_entry_flush         = expt_entry_data[57];
assign expt_entry_jmp_mispred   = expt_entry_data[56];
assign expt_entry_bht_mispred   = expt_entry_data[55];
assign expt_entry_mtval[39:0]   = expt_entry_data[54:15];
assign expt_entry_immu_expt     = expt_entry_data[14];
assign expt_entry_high_hw_expt  = expt_entry_data[13];
//assign expt_entry_expt_vec[4] = expt_entry_data[12];
assign expt_entry_expt_vec[3:0] = expt_entry_data[11:8];
assign expt_entry_expt_vld      = expt_entry_data[7];
assign expt_entry_iid[6:0]      = expt_entry_data[6:0];

//----------------------------------------------------------
//                 Rename for output
//----------------------------------------------------------
// &Force("output","rob_retire_inst0_spec_fail_ssf"); @264
// &Force("output","rob_retire_inst0_spec_fail_no_ssf"); @265
assign rob_retire_inst0_expt_vld         = retire_expt_inst0_abnormal
                                           && expt_entry_expt_vld;
assign rob_retire_inst0_expt_vec[3:0]    = expt_entry_expt_vec[3:0];
assign rob_retire_inst0_immu_expt        = expt_entry_immu_expt;
assign rob_retire_inst0_high_hw_expt     = expt_entry_high_hw_expt;
assign rob_retire_inst0_inst_flush       = retire_expt_inst0_abnormal
                                           && !expt_entry_expt_vld
                                           && expt_entry_flush
                                        || !retire_expt_inst0_abnormal
                                           && ssf_split_spec_fail_flush;
assign rob_retire_inst0_jmp_mispred      = retire_expt_inst0_abnormal
                                           && expt_entry_jmp_mispred;
assign rob_retire_inst0_bht_mispred      = retire_expt_inst0_abnormal
                                           && expt_entry_bht_mispred;
assign rob_retire_inst0_mtval[39:0]      = expt_entry_mtval[39:0];
assign rob_retire_inst0_bkpt             = retire_expt_inst0_abnormal
                                           && expt_entry_bkpt;
assign rob_retire_inst0_spec_fail_no_ssf = retire_expt_inst0_abnormal
                                           && expt_entry_spec_fail;
assign rob_retire_inst0_spec_fail_ssf    = !retire_expt_inst0_abnormal
                                           && ssf_split_spec_fail_flush;
assign rob_retire_inst0_spec_fail        = rob_retire_inst0_spec_fail_no_ssf
                                        || rob_retire_inst0_spec_fail_ssf;
assign rob_retire_inst0_efpc_vld         = retire_expt_inst0_abnormal
                                           && expt_entry_efpc_vld;
assign rob_retire_inst0_vsetvl           = retire_expt_inst0_abnormal
                                           && expt_entry_vsetvl;
assign rob_retire_inst0_vstart_vld       = retire_expt_inst0_abnormal
                                           && expt_entry_vstart_vld;
assign rob_retire_inst0_vstart[6:0]      = expt_entry_vstart[6:0];

//==========================================================
//               Split instruction spec fail
//==========================================================
parameter IDLE        = 2'b00;
parameter WF_RETIRE   = 2'b10;
parameter RETIRING    = 2'b11;

//----------------------------------------------------------
//                Instance of Gated Cell  
//----------------------------------------------------------
assign ssf_clk_en = ssf_sm_start
                    || (ssf_cur_state[1:0] != IDLE);
// &Instance("gated_clk_cell", "x_ssf_gated_clk"); @309
gated_clk_cell  x_ssf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ssf_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ssf_clk_en        ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @310
//          .external_en (1'b0), @311
//          .global_en   (cp0_yy_clk_en), @312
//          .module_en   (cp0_rtu_icg_en), @313
//          .local_en    (ssf_clk_en), @314
//          .clk_out     (ssf_clk)); @315

//----------------------------------------------------------
//              control signal for ssf FSM
//----------------------------------------------------------
assign ssf_sm_start               = lsu_rtu_da_pipe4_split_spec_fail_vld
                                    || lsu_rtu_da_pipe3_split_spec_fail_vld;
assign ssf_split_spec_fail_retire = retire_expt_inst0_vld
                                    && (rob_expt_inst0_iid[6:0] == ssf_iid[6:0]);
assign ssf_inst_retire_no_split   = retire_expt_inst0_vld
                                    && !rob_retire_inst0_split;

//----------------------------------------------------------
//             FSM of inst ssf ctrl logic
//----------------------------------------------------------
// State Description:
// IDLE       : no split instruction speculation failed
// WF_RETIRE  : wait for split spec fail inst retire
// RETIRING   : split spec fail inst is retring

always @(posedge ssf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ssf_cur_state[1:0] <= IDLE;
  else if(retire_rob_flush || rtu_yy_xx_flush)
    ssf_cur_state[1:0] <= IDLE;
  else
    ssf_cur_state[1:0] <= ssf_next_state[1:0];
end


// &CombBeg; @346
always @( ssf_split_spec_fail_retire
       or ssf_cur_state[1:0]
       or ssf_sm_start
       or ssf_inst_retire_no_split)
begin
  case(ssf_cur_state[1:0])
  IDLE       : if(ssf_sm_start)
                 ssf_next_state[1:0] = WF_RETIRE;
               else
                 ssf_next_state[1:0] = IDLE;
  WF_RETIRE  : if(ssf_split_spec_fail_retire)
                 ssf_next_state[1:0] = RETIRING;
               else
                 ssf_next_state[1:0] = WF_RETIRE;
  RETIRING   : if(ssf_inst_retire_no_split)
                 ssf_next_state[1:0] = IDLE;
               else
                 ssf_next_state[1:0] = RETIRING;
  default    :   ssf_next_state[1:0] = IDLE;
  endcase
// &CombEnd; @362
end

//----------------------------------------------------------
//                   control signals
//----------------------------------------------------------
//if there is split inst spec fail, to simplify the design, enable srt
//wait for split inst retire
assign rob_retire_split_spec_fail_srt = ssf_cur_state[1];
//if in RETIRING state, wait for next no split inst and generate
//spec fail flush if it is not abnormal
assign ssf_split_spec_fail_flush      = ssf_cur_state[0]
                                        && ssf_inst_retire_no_split;
assign rob_top_ssf_cur_state[1:0]     = ssf_cur_state[1:0];

//----------------------------------------------------------
//                  Split Spec fail Age
//----------------------------------------------------------
//compare lsu pipe3/4/ssf split spec fail inst age
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_ssf_pipe4_older_3"); @380
ct_rtu_compare_iid  x_ct_rtu_compare_iid_ssf_pipe4_older_3 (
  .x_iid0                                    (lsu_rtu_da_pipe4_split_spec_fail_iid[6:0]),
  .x_iid0_older                              (ssf_pipe4_older_3                        ),
  .x_iid1                                    (lsu_rtu_da_pipe3_split_spec_fail_iid[6:0])
);

// &Connect(.x_iid0       (lsu_rtu_da_pipe4_split_spec_fail_iid[6:0]), @381
//          .x_iid1       (lsu_rtu_da_pipe3_split_spec_fail_iid[6:0]), @382
//          .x_iid0_older (ssf_pipe4_older_3      )); @383
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_ssf_pipe4_older_sm"); @384
ct_rtu_compare_iid  x_ct_rtu_compare_iid_ssf_pipe4_older_sm (
  .x_iid0                                    (lsu_rtu_da_pipe4_split_spec_fail_iid[6:0]),
  .x_iid0_older                              (ssf_pipe4_older_sm                       ),
  .x_iid1                                    (ssf_iid[6:0]                             )
);

// &Connect(.x_iid0       (lsu_rtu_da_pipe4_split_spec_fail_iid[6:0]), @385
//          .x_iid1       (ssf_iid[6:0]), @386
//          .x_iid0_older (ssf_pipe4_older_sm     )); @387
// &Instance("ct_rtu_compare_iid","x_ct_rtu_compare_iid_ssf_pipe3_older_sm"); @388
ct_rtu_compare_iid  x_ct_rtu_compare_iid_ssf_pipe3_older_sm (
  .x_iid0                                    (lsu_rtu_da_pipe3_split_spec_fail_iid[6:0]),
  .x_iid0_older                              (ssf_pipe3_older_sm                       ),
  .x_iid1                                    (ssf_iid[6:0]                             )
);

// &Connect(.x_iid0       (lsu_rtu_da_pipe3_split_spec_fail_iid[6:0]), @389
//          .x_iid1       (ssf_iid[6:0]), @390
//          .x_iid0_older (ssf_pipe3_older_sm     )); @391

//if older split spec fail occurs, update ssf_iid with older iid
//and hold ssf sm state if it is not idle
//because lsu should signal split spec fail before cmplt
assign ssf_pipe4_iid_updt_vld =
     lsu_rtu_da_pipe4_split_spec_fail_vld
  && (!lsu_rtu_da_pipe3_split_spec_fail_vld || ssf_pipe4_older_3)
  && ((ssf_cur_state[1:0] == IDLE)          || ssf_pipe4_older_sm);
assign ssf_pipe3_iid_updt_vld =
     lsu_rtu_da_pipe3_split_spec_fail_vld
  && (!lsu_rtu_da_pipe4_split_spec_fail_vld || !ssf_pipe4_older_3)
  && ((ssf_cur_state[1:0] == IDLE)          || ssf_pipe3_older_sm);
assign ssf_sm_iid_updt_vld =
     (ssf_cur_state[1:0] != IDLE)
  && (!lsu_rtu_da_pipe4_split_spec_fail_vld || !ssf_pipe4_older_sm)
  && (!lsu_rtu_da_pipe3_split_spec_fail_vld || !ssf_pipe3_older_sm);

//----------------------------------------------------------
//               Split spec fail inst iid
//----------------------------------------------------------
assign ssf_iid_updt_val[6:0] = 
    {7{ssf_pipe4_iid_updt_vld}} & lsu_rtu_da_pipe4_split_spec_fail_iid[6:0]
  | {7{ssf_pipe3_iid_updt_vld}} & lsu_rtu_da_pipe3_split_spec_fail_iid[6:0]
  | {7{ssf_sm_iid_updt_vld}}    & ssf_iid[6:0];

always @(posedge ssf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ssf_iid[6:0] <= 7'b0;
  else
    ssf_iid[6:0] <= ssf_iid_updt_val[6:0];
end

assign rob_retire_ssf_iid[6:0] = ssf_iid[6:0];

// &ModuleEnd @427
endmodule


