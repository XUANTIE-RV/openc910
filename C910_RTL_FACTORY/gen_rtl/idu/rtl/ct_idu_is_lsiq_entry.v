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
module ct_idu_is_lsiq_entry(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  dp_xx_rf_pipe0_dst_preg_dupx,
  dp_xx_rf_pipe1_dst_preg_dupx,
  forever_cpuclk,
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_vld_dupx,
  iu_idu_ex2_pipe1_mult_inst_vld_dupx,
  iu_idu_ex2_pipe1_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_vld_dupx,
  lq_full_clk,
  lsiq_bar_mode,
  lsu_idu_ag_pipe3_load_inst_vld,
  lsu_idu_ag_pipe3_preg_dupx,
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dupx,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx,
  lsu_idu_dc_pipe3_load_inst_vld_dupx,
  lsu_idu_dc_pipe3_preg_dupx,
  lsu_idu_dc_pipe3_vload_fwd_inst_vld,
  lsu_idu_dc_pipe3_vload_inst_vld_dupx,
  lsu_idu_dc_pipe3_vreg_dupx,
  lsu_idu_lq_not_full,
  lsu_idu_lsiq_pop_vld,
  lsu_idu_no_fence,
  lsu_idu_rb_not_full,
  lsu_idu_sq_not_full,
  lsu_idu_wb_pipe3_wb_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_vld_dupx,
  lsu_idu_wb_pipe3_wb_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_vld_dupx,
  pad_yy_icg_scan_en,
  rb_full_clk,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  sq_full_clk,
  tlb_busy_clk,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx,
  wait_fence_clk,
  wait_old_clk,
  x_already_da_set,
  x_alu0_reg_fwd_vld,
  x_alu1_reg_fwd_vld,
  x_bar,
  x_bar_type,
  x_bkpta_data_set,
  x_bkptb_data_set,
  x_create_agevec,
  x_create_agevec_all,
  x_create_data,
  x_create_dp_en,
  x_create_en,
  x_create_frz,
  x_create_gateclk_en,
  x_frz,
  x_frz_clr,
  x_frz_vld,
  x_issue_en,
  x_load,
  x_lq_full,
  x_lq_full_set,
  x_no_spec,
  x_other_aft_load,
  x_other_aft_store,
  x_other_bar,
  x_other_frz,
  x_other_load,
  x_other_no_spec,
  x_other_raw_rdy,
  x_other_store,
  x_pop_cur_entry,
  x_pop_other_entry,
  x_raw_rdy,
  x_rb_full,
  x_rb_full_set,
  x_rdy,
  x_rdy_clr,
  x_read_data,
  x_spec_fail_set,
  x_sq_full,
  x_sq_full_set,
  x_store,
  x_tlb_busy,
  x_tlb_busy_set,
  x_tlb_wakeup,
  x_unalign_2nd_set,
  x_unalign_gateclk_en,
  x_vld,
  x_vld_with_frz,
  x_wait_fence,
  x_wait_fence_set,
  x_wait_old,
  x_wait_old_set
);

// &Ports; @28
input            cp0_idu_icg_en;                         
input            cp0_yy_clk_en;                          
input            cpurst_b;                               
input            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
input   [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
input            forever_cpuclk;                         
input            iu_idu_div_inst_vld;                    
input   [6  :0]  iu_idu_div_preg_dupx;                   
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
input            iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
input            iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
input   [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
input            iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
input            lq_full_clk;                            
input            lsiq_bar_mode;                          
input            lsu_idu_ag_pipe3_load_inst_vld;         
input   [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
input            lsu_idu_ag_pipe3_vload_inst_vld;        
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;             
input            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
input            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
input            lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
input            lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;             
input            lsu_idu_lq_not_full;                    
input            lsu_idu_lsiq_pop_vld;                   
input            lsu_idu_no_fence;                       
input            lsu_idu_rb_not_full;                    
input            lsu_idu_sq_not_full;                    
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
input            lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
input            pad_yy_icg_scan_en;                     
input            rb_full_clk;                            
input            rtu_idu_flush_fe;                       
input            rtu_idu_flush_is;                       
input            sq_full_clk;                            
input            tlb_busy_clk;                           
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
input            wait_fence_clk;                         
input            wait_old_clk;                           
input            x_already_da_set;                       
input   [1  :0]  x_alu0_reg_fwd_vld;                     
input   [1  :0]  x_alu1_reg_fwd_vld;                     
input            x_bkpta_data_set;                       
input            x_bkptb_data_set;                       
input   [10 :0]  x_create_agevec;                        
input   [10 :0]  x_create_agevec_all;                    
input   [162:0]  x_create_data;                          
input            x_create_dp_en;                         
input            x_create_en;                            
input            x_create_frz;                           
input            x_create_gateclk_en;                    
input            x_frz_clr;                              
input            x_issue_en;                             
input            x_lq_full_set;                          
input   [10 :0]  x_other_aft_load;                       
input   [10 :0]  x_other_aft_store;                      
input   [10 :0]  x_other_bar;                            
input   [10 :0]  x_other_frz;                            
input   [10 :0]  x_other_load;                           
input   [10 :0]  x_other_no_spec;                        
input   [10 :0]  x_other_raw_rdy;                        
input   [10 :0]  x_other_store;                          
input            x_pop_cur_entry;                        
input   [10 :0]  x_pop_other_entry;                      
input            x_rb_full_set;                          
input   [2  :0]  x_rdy_clr;                              
input            x_spec_fail_set;                        
input            x_sq_full_set;                          
input            x_tlb_busy_set;                         
input            x_tlb_wakeup;                           
input            x_unalign_2nd_set;                      
input            x_unalign_gateclk_en;                   
input            x_wait_fence_set;                       
input            x_wait_old_set;                         
output           x_bar;                                  
output  [3  :0]  x_bar_type;                             
output           x_frz;                                  
output           x_frz_vld;                              
output           x_load;                                 
output           x_lq_full;                              
output           x_no_spec;                              
output           x_raw_rdy;                              
output           x_rb_full;                              
output           x_rdy;                                  
output  [162:0]  x_read_data;                            
output           x_sq_full;                              
output           x_store;                                
output           x_tlb_busy;                             
output           x_vld;                                  
output           x_vld_with_frz;                         
output           x_wait_fence;                           
output           x_wait_old;                             

// &Regs; @29
reg     [10 :0]  agevec;                                 
reg     [10 :0]  agevec_all;                             
reg              already_da;                             
reg              bar;                                    
reg              bar_check;                              
reg     [3  :0]  bar_type;                               
reg              bkpta_data;                             
reg              bkptb_data;                             
reg     [6  :0]  dst_preg;                               
reg              dst_vld;                                
reg     [6  :0]  dst_vreg;                               
reg              dstv_vld;                               
reg              frz;                                    
reg     [6  :0]  iid;                                    
reg              load;                                   
reg              lq_full;                                
reg              no_spec;                                
reg              no_spec_check;                          
reg              no_spec_exist;                          
reg     [31 :0]  opcode;                                 
reg     [14 :0]  pc;                                     
reg              rb_full;                                
reg     [11 :0]  sdiq_entry;                             
reg              spec_fail;                              
reg              split;                                  
reg     [6  :0]  split_num;                              
reg              sq_full;                                
reg              src0_vld;                               
reg              src1_vld;                               
reg              srcvm_vld;                              
reg              staddr;                                 
reg              store;                                  
reg              tlb_busy;                               
reg              unalign_2nd;                            
reg     [7  :0]  vl;                                     
reg              vld;                                    
reg     [1  :0]  vlmul;                                  
reg              vmb;                                    
reg     [2  :0]  vsew;                                   
reg              wait_fence;                             
reg              wait_old;                               

// &Wires; @30
wire             bar_check_wakeup;                       
wire             bef_load;                               
wire             bef_store;                              
wire             cp0_idu_icg_en;                         
wire             cp0_yy_clk_en;                          
wire             cpurst_b;                               
wire             create_bar_clk;                         
wire             create_bar_clk_en;                      
wire             create_clk;                             
wire             create_clk_en;                          
wire             create_preg_clk;                        
wire             create_preg_clk_en;                     
wire             create_sdiq_clk;                        
wire             create_sdiq_clk_en;                     
wire    [9  :0]  create_src0_data;                       
wire             create_src0_gateclk_en;                 
wire    [9  :0]  create_src1_data;                       
wire             create_src1_gateclk_en;                 
wire    [9  :0]  create_srcvm_data;                      
wire             create_srcvm_gateclk_en;                
wire             create_vreg_clk;                        
wire             create_vreg_clk_en;                     
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire             entry_clk;                              
wire             entry_clk_en;                           
wire             forever_cpuclk;                         
wire             gateclk_entry_vld;                      
wire             iu_idu_div_inst_vld;                    
wire    [6  :0]  iu_idu_div_preg_dupx;                   
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire             iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire             iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire             iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire             lq_full_clk;                            
wire             lq_full_wakeup;                         
wire             lsiq_bar_mode;                          
wire             lsu_frz_clr;                            
wire             lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire             lsu_idu_ag_pipe3_vload_inst_vld;        
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;             
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire             lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire             lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
wire             lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;             
wire             lsu_idu_lq_not_full;                    
wire             lsu_idu_lsiq_pop_vld;                   
wire             lsu_idu_no_fence;                       
wire             lsu_idu_rb_not_full;                    
wire             lsu_idu_sq_not_full;                    
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire             lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
wire             no_spec_check_wakeup;                   
wire             old;                                    
wire             older_entry_rdy_mask;                   
wire             pad_yy_icg_scan_en;                     
wire             rb_full_clk;                            
wire             rb_full_wakeup;                         
wire    [11 :0]  read_src0_data;                         
wire    [11 :0]  read_src1_data;                         
wire    [11 :0]  read_srcvm_data;                        
wire             rtu_idu_flush_fe;                       
wire             rtu_idu_flush_is;                       
wire             sq_full_clk;                            
wire             sq_full_wakeup;                         
wire             src0_rdy_clr;                           
wire             src0_rdy_for_issue;                     
wire             src1_rdy_clr;                           
wire             src1_rdy_for_issue;                     
wire             srcvm_rdy_clr;                          
wire             srcvm_rdy_for_issue;                    
wire             tlb_busy_clk;                           
wire             unalign_clk;                            
wire             unalign_clk_en;                         
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
wire             wait_fence_clk;                         
wire             wait_fence_wakeup;                      
wire             wait_old_clk;                           
wire             wait_old_wakeup;                        
wire             x_already_da_set;                       
wire    [1  :0]  x_alu0_reg_fwd_vld;                     
wire    [1  :0]  x_alu1_reg_fwd_vld;                     
wire             x_bar;                                  
wire    [3  :0]  x_bar_type;                             
wire             x_bkpta_data_set;                       
wire             x_bkptb_data_set;                       
wire    [10 :0]  x_create_agevec;                        
wire    [10 :0]  x_create_agevec_all;                    
wire    [162:0]  x_create_data;                          
wire             x_create_dp_en;                         
wire             x_create_en;                            
wire             x_create_frz;                           
wire             x_create_gateclk_en;                    
wire             x_frz;                                  
wire             x_frz_clr;                              
wire             x_frz_vld;                              
wire             x_issue_en;                             
wire             x_load;                                 
wire             x_lq_full;                              
wire             x_lq_full_set;                          
wire             x_no_spec;                              
wire    [10 :0]  x_other_aft_load;                       
wire    [10 :0]  x_other_aft_store;                      
wire    [10 :0]  x_other_bar;                            
wire    [10 :0]  x_other_frz;                            
wire    [10 :0]  x_other_load;                           
wire    [10 :0]  x_other_no_spec;                        
wire    [10 :0]  x_other_raw_rdy;                        
wire    [10 :0]  x_other_store;                          
wire             x_pop_cur_entry;                        
wire    [10 :0]  x_pop_other_entry;                      
wire             x_raw_rdy;                              
wire             x_rb_full;                              
wire             x_rb_full_set;                          
wire             x_rdy;                                  
wire    [2  :0]  x_rdy_clr;                              
wire    [162:0]  x_read_data;                            
wire             x_spec_fail_set;                        
wire             x_sq_full;                              
wire             x_sq_full_set;                          
wire             x_store;                                
wire             x_tlb_busy;                             
wire             x_tlb_busy_set;                         
wire             x_tlb_wakeup;                           
wire             x_unalign_2nd_set;                      
wire             x_unalign_gateclk_en;                   
wire             x_vld;                                  
wire             x_vld_with_frz;                         
wire             x_wait_fence;                           
wire             x_wait_fence_set;                       
wire             x_wait_old;                             
wire             x_wait_old_set;                         



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                    LSIQ Parameters
//----------------------------------------------------------
parameter LSIQ_WIDTH             = 163;

parameter LSIQ_VL                = 162;
parameter LSIQ_VMB               = 154;
parameter LSIQ_SPLIT_NUM         = 153;
parameter LSIQ_VSEW              = 146;
parameter LSIQ_VLMUL             = 143;
parameter LSIQ_BKPTB_DATA        = 141;
parameter LSIQ_BKPTA_DATA        = 140;
parameter LSIQ_AGEVEC_ALL        = 139;
parameter LSIQ_ALREADY_DA        = 128;
parameter LSIQ_UNALIGN_2ND       = 127;
parameter LSIQ_SPEC_FAIL         = 126;
parameter LSIQ_NO_SPEC_EXIST     = 125;
parameter LSIQ_NO_SPEC           = 124;
parameter LSIQ_SPLIT             = 123;
parameter LSIQ_SDIQ_ENTRY        = 122;
parameter LSIQ_STADDR            = 110;
parameter LSIQ_PC                = 109;
parameter LSIQ_BAR_TYPE          = 94;
parameter LSIQ_BAR               = 90;
parameter LSIQ_STORE             = 89;
parameter LSIQ_LOAD              = 88;
parameter LSIQ_SRCVM_LSU_MATCH   = 87;
parameter LSIQ_SRCVM_DATA        = 86;
parameter LSIQ_SRCVM_VREG        = 86;
parameter LSIQ_SRCVM_WB          = 79;
parameter LSIQ_SRCVM_RDY         = 78;
parameter LSIQ_SRC1_LSU_MATCH    = 77;
parameter LSIQ_SRC1_DATA         = 76;
parameter LSIQ_SRC1_PREG         = 76;
parameter LSIQ_SRC1_WB           = 69;
parameter LSIQ_SRC1_RDY          = 68;
parameter LSIQ_SRC0_LSU_MATCH    = 67;
parameter LSIQ_SRC0_DATA         = 66;
parameter LSIQ_SRC0_PREG         = 66;
parameter LSIQ_SRC0_WB           = 59;
parameter LSIQ_SRC0_RDY          = 58;
parameter LSIQ_DST_VREG          = 57;
parameter LSIQ_DST_PREG          = 50;
parameter LSIQ_DSTV_VLD          = 43;
parameter LSIQ_DST_VLD           = 42;
parameter LSIQ_SRCVM_VLD         = 41;
parameter LSIQ_SRC1_VLD          = 40;
parameter LSIQ_SRC0_VLD          = 39;
parameter LSIQ_IID               = 38;
parameter LSIQ_OPCODE            = 31;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = x_create_gateclk_en || vld;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @91
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @92
//          .external_en (1'b0), @93
//          .global_en   (cp0_yy_clk_en), @94
//          .module_en   (cp0_idu_icg_en), @95
//          .local_en    (entry_clk_en), @96
//          .clk_out     (entry_clk)); @97

assign create_clk_en = x_create_gateclk_en;
// &Instance("gated_clk_cell", "x_create_gated_clk"); @100
gated_clk_cell  x_create_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_clk_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @101
//          .external_en (1'b0), @102
//          .global_en   (cp0_yy_clk_en), @103
//          .module_en   (cp0_idu_icg_en), @104
//          .local_en    (create_clk_en), @105
//          .clk_out     (create_clk)); @106

assign create_preg_clk_en = x_create_gateclk_en && x_create_data[LSIQ_DST_VLD];
// &Instance("gated_clk_cell", "x_create_preg_gated_clk"); @109
gated_clk_cell  x_create_preg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_preg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_preg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @110
//          .external_en (1'b0), @111
//          .global_en   (cp0_yy_clk_en), @112
//          .module_en   (cp0_idu_icg_en), @113
//          .local_en    (create_preg_clk_en), @114
//          .clk_out     (create_preg_clk)); @115

assign create_vreg_clk_en = x_create_gateclk_en && x_create_data[LSIQ_DSTV_VLD];
// &Instance("gated_clk_cell", "x_create_vreg_gated_clk"); @118
gated_clk_cell  x_create_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_vreg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_vreg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @119
//          .external_en (1'b0), @120
//          .global_en   (cp0_yy_clk_en), @121
//          .module_en   (cp0_idu_icg_en), @122
//          .local_en    (create_vreg_clk_en), @123
//          .clk_out     (create_vreg_clk)); @124

assign create_bar_clk_en = x_create_gateclk_en && x_create_data[LSIQ_BAR];
// &Instance("gated_clk_cell", "x_create_bar_gated_clk"); @127
gated_clk_cell  x_create_bar_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_bar_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_bar_clk_en ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @128
//          .external_en (1'b0), @129
//          .global_en   (cp0_yy_clk_en), @130
//          .module_en   (cp0_idu_icg_en), @131
//          .local_en    (create_bar_clk_en), @132
//          .clk_out     (create_bar_clk)); @133

assign create_sdiq_clk_en = x_create_gateclk_en;
// &Instance("gated_clk_cell", "x_create_sdiq_gated_clk"); @136
gated_clk_cell  x_create_sdiq_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_sdiq_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_sdiq_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @137
//          .external_en (1'b0), @138
//          .global_en   (cp0_yy_clk_en), @139
//          .module_en   (cp0_idu_icg_en), @140
//          .local_en    (create_sdiq_clk_en), @141
//          .clk_out     (create_sdiq_clk)); @142

assign unalign_clk_en = x_create_gateclk_en ||  x_unalign_gateclk_en;
// &Instance("gated_clk_cell", "x_unalign_gated_clk"); @145
gated_clk_cell  x_unalign_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (unalign_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (unalign_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @146
//          .external_en (1'b0), @147
//          .global_en   (cp0_yy_clk_en), @148
//          .module_en   (cp0_idu_icg_en), @149
//          .local_en    (unalign_clk_en), @150
//          .clk_out     (unalign_clk)); @151

//if entry is not valid, shut down dep info clock
assign gateclk_entry_vld = vld;

//==========================================================
//                  Create and Read Bus
//==========================================================
//force create and read bus width
// &Force("bus","x_create_data",LSIQ_WIDTH-1,0); @160
// &Force("bus","x_read_data",LSIQ_WIDTH-1,0); @161
// &Force("output","x_read_data"); @162

assign src0_rdy_clr              = x_rdy_clr[0];
assign src1_rdy_clr              = x_rdy_clr[1];
assign srcvm_rdy_clr             = x_rdy_clr[2];

//==========================================================
//                      Entry Valid
//==========================================================
assign x_vld = vld;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vld <= 1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    vld <= 1'b0;
  else if(x_create_en)
    vld <= 1'b1;
  else if(lsu_idu_lsiq_pop_vld && x_pop_cur_entry)
    vld <= 1'b0;
  else
    vld <= vld;
end

//==========================================================
//                        Freeze
//==========================================================
//inst cannot bypass freeze bar
assign x_vld_with_frz = vld && (!frz || bar);
assign x_frz_vld = vld && frz;
assign x_frz     = frz;

//issue en has higher priority because bar check
//is still 1 when issue en, frz should be set
//when issue en and frz clr in this case
//bar check will be 0 after issue en
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    frz <= 1'b0;
  else if(x_create_en)
    frz <= x_create_frz;
  else if(x_issue_en)
    frz <= 1'b1;
  else if(x_frz_clr || lsu_frz_clr)
    frz <= 1'b0;
  else
    frz <= frz;
end

//==========================================================
//                       Age Vector
//==========================================================
//agevec of same type (store and bar share same type),
//used for issue
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    agevec[10:0] <= 11'b0;
  else if(x_create_en)
    agevec[10:0] <= x_create_agevec[10:0];
  else if(lsu_idu_lsiq_pop_vld)
    agevec[10:0] <= agevec[10:0] & ~x_pop_other_entry[10:0];
  else
    agevec[10:0] <= agevec[10:0];
end

//agevec of all types, used for old and bar frz clear
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    agevec_all[10:0] <= 11'b0;
  else if(x_create_en)
    agevec_all[10:0] <= x_create_agevec_all[10:0];
  else if(lsu_idu_lsiq_pop_vld)
    agevec_all[10:0] <= agevec_all[10:0] & ~x_pop_other_entry[10:0];
  else
    agevec_all[10:0] <= agevec_all[10:0];
end

assign x_read_data[LSIQ_AGEVEC_ALL:LSIQ_AGEVEC_ALL-10] = agevec_all[10:0];

//==========================================================
//                 Instruction Information
//==========================================================
always @(posedge create_preg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dst_preg[6:0]      <= 7'b0;
  else if(x_create_dp_en)
    dst_preg[6:0]      <= x_create_data[LSIQ_DST_PREG:LSIQ_DST_PREG-6];
  else
    dst_preg[6:0]      <= dst_preg[6:0];
end

always @(posedge create_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dst_vreg[6:0]      <= 7'b0;
  else if(x_create_dp_en)
    dst_vreg[6:0]      <= x_create_data[LSIQ_DST_VREG:LSIQ_DST_VREG-6];
  else
    dst_vreg[6:0]      <= dst_vreg[6:0];
end

always @(posedge create_bar_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bar_type[3:0]      <= 4'b0;
  else if(x_create_dp_en)
    bar_type[3:0]      <= x_create_data[LSIQ_BAR_TYPE:LSIQ_BAR_TYPE-3];
  else
    bar_type[3:0]      <= bar_type[3:0];
end

always @(posedge create_sdiq_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sdiq_entry[11:0]   <= 12'b0;
  else if(x_create_dp_en)
    sdiq_entry[11:0]   <= x_create_data[LSIQ_SDIQ_ENTRY:LSIQ_SDIQ_ENTRY-11];
  else
    sdiq_entry[11:0]   <= sdiq_entry[11:0];
end


always @(posedge create_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    opcode[31:0]       <= 32'b0;
    iid[6:0]           <= 7'b0;
    src0_vld           <= 1'b0;
    src1_vld           <= 1'b0;
    srcvm_vld          <= 1'b0;
    dst_vld            <= 1'b0;
    dstv_vld           <= 1'b0;
    load               <= 1'b0;
    store              <= 1'b0;
    bar                <= 1'b0;
    staddr             <= 1'b0;
    split              <= 1'b0;
    pc[14:0]           <= 15'b0;
    no_spec            <= 1'b0;
    no_spec_exist      <= 1'b0;
    vlmul[1:0]         <= 2'b0;
    vsew[2:0]          <= 3'b0;
    vl[7:0]            <= 8'b0;
    split_num[6:0]     <= 7'b0;
    vmb                <= 1'b0;
  end
  else if(x_create_dp_en) begin
    opcode[31:0]       <= x_create_data[LSIQ_OPCODE:LSIQ_OPCODE-31];
    iid[6:0]           <= x_create_data[LSIQ_IID:LSIQ_IID-6];
    src0_vld           <= x_create_data[LSIQ_SRC0_VLD];
    src1_vld           <= x_create_data[LSIQ_SRC1_VLD];
    srcvm_vld          <= x_create_data[LSIQ_SRCVM_VLD];
    dst_vld            <= x_create_data[LSIQ_DST_VLD];
    dstv_vld           <= x_create_data[LSIQ_DSTV_VLD];
    load               <= x_create_data[LSIQ_LOAD];
    store              <= x_create_data[LSIQ_STORE];
    bar                <= x_create_data[LSIQ_BAR];
    staddr             <= x_create_data[LSIQ_STADDR];
    pc[14:0]           <= x_create_data[LSIQ_PC:LSIQ_PC-14];
    split              <= x_create_data[LSIQ_SPLIT];
    no_spec            <= x_create_data[LSIQ_NO_SPEC];
    no_spec_exist      <= x_create_data[LSIQ_NO_SPEC_EXIST];
    vlmul[1:0]         <= x_create_data[LSIQ_VLMUL:LSIQ_VLMUL-1];
    vsew[2:0]          <= x_create_data[LSIQ_VSEW:LSIQ_VSEW-2];
    vl[7:0]            <= x_create_data[LSIQ_VL:LSIQ_VL-7];
    split_num[6:0]     <= x_create_data[LSIQ_SPLIT_NUM:LSIQ_SPLIT_NUM-6];
    vmb                <= x_create_data[LSIQ_VMB];
  end
  else begin
    opcode[31:0]       <= opcode[31:0];
    iid[6:0]           <= iid[6:0];
    src0_vld           <= src0_vld;
    src1_vld           <= src1_vld;
    srcvm_vld          <= srcvm_vld;
    dst_vld            <= dst_vld;
    dstv_vld           <= dstv_vld;
    load               <= load;
    store              <= store;
    bar                <= bar;
    staddr             <= staddr;
    split              <= split;
    pc[14:0]           <= pc[14:0];
    no_spec            <= no_spec;
    no_spec_exist      <= no_spec_exist;
    vlmul[1:0]         <= vlmul[1:0];
    vsew[2:0]          <= vsew[2:0];
    vl[7:0]            <= vl[7:0];
    split_num[6:0]     <= split_num[6:0];
    vmb                <= vmb;
  end
end

//rename for read output
assign x_read_data[LSIQ_OPCODE:LSIQ_OPCODE-31]         = opcode[31:0];
assign x_read_data[LSIQ_IID:LSIQ_IID-6]                = iid[6:0];
assign x_read_data[LSIQ_SRC0_VLD]                      = src0_vld;
assign x_read_data[LSIQ_SRC1_VLD]                      = src1_vld;
assign x_read_data[LSIQ_SRCVM_VLD]                     = srcvm_vld;
assign x_read_data[LSIQ_DST_VLD]                       = dst_vld;
assign x_read_data[LSIQ_DSTV_VLD]                      = dstv_vld;
assign x_read_data[LSIQ_DST_PREG:LSIQ_DST_PREG-6]      = dst_preg[6:0];
assign x_read_data[LSIQ_DST_VREG:LSIQ_DST_VREG-6]      = dst_vreg[6:0];
assign x_read_data[LSIQ_LOAD]                          = load;
assign x_read_data[LSIQ_STORE]                         = store;
assign x_read_data[LSIQ_BAR]                           = bar;
assign x_read_data[LSIQ_BAR_TYPE:LSIQ_BAR_TYPE-3]      = bar_type[3:0];
assign x_read_data[LSIQ_PC:LSIQ_PC-14]                 = pc[14:0];
assign x_read_data[LSIQ_STADDR]                        = staddr;
assign x_read_data[LSIQ_SDIQ_ENTRY:LSIQ_SDIQ_ENTRY-11] = sdiq_entry[11:0];
assign x_read_data[LSIQ_SPLIT]                         = split;
assign x_read_data[LSIQ_NO_SPEC]                       = no_spec;
assign x_read_data[LSIQ_NO_SPEC_EXIST]                 = no_spec_exist;
assign x_read_data[LSIQ_VLMUL:LSIQ_VLMUL-1]            = vlmul[1:0];
assign x_read_data[LSIQ_VSEW:LSIQ_VSEW-2]              = vsew[2:0];
assign x_read_data[LSIQ_VL:LSIQ_VL-7]                  = vl[7:0];
assign x_read_data[LSIQ_SPLIT_NUM:LSIQ_SPLIT_NUM-6]    = split_num[6:0];
assign x_read_data[LSIQ_VMB]                           = vmb;

assign x_load                                          = load;
assign x_store                                         = store;
assign x_bar                                           = bar;
assign x_bar_type[3:0]                                 = bar_type[3:0];
assign x_no_spec                                       = no_spec;

//==========================================================
//              Barrier Freeze Clear Signals
//==========================================================
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bar_check            <=  1'b0;
  else if(x_create_en)
    bar_check            <=  lsiq_bar_mode;
  else if(bar_check_wakeup)
    bar_check            <=  1'b0;
  else
    bar_check            <=  bar_check;
end

assign bef_load  = bar_type[0];
assign bef_store = bar_type[1];

assign bar_check_wakeup =
//1.  lsiq exit or no bar mode
      !lsiq_bar_mode
//2.  if older entry is bar with after load (no matter raw ready),
//    not clear bar frz
  ||  load  && !(|(x_other_bar[10:0]    & agevec_all[10:0] & x_other_aft_load[10:0]))
//3.  if older entry is bar with after store (no matter raw ready),
//    not clear bar frz
  ||  store && !(|(x_other_bar[10:0]    & agevec_all[10:0] & x_other_aft_store[10:0]))
//4.1 if older entry is load and cur entry is bar with before load, not ready
  ||  bar   && (!(|(x_other_load[10:0]  & agevec_all[10:0])) && bef_load  || !bef_load)
//5.2 if older entry is store and cur entry is bar with before store, not ready
            && (!(|(x_other_store[10:0] & agevec_all[10:0])) && bef_store || !bef_store)
//6.3 if older entry is bar, not ready
            && !(|(x_other_bar[10:0]    & agevec_all[10:0]));

//==========================================================
//              No Speculation Signals
//==========================================================
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    no_spec_check <=  1'b0;
  else if(x_create_en)
    no_spec_check <=  x_create_data[LSIQ_NO_SPEC] && x_create_data[LSIQ_LOAD];
  else if(no_spec_check_wakeup)
    no_spec_check <=  1'b0;
  else
    no_spec_check <=  no_spec_check;
end

assign no_spec_check_wakeup =
  load && !(|(x_other_store[10:0] & x_other_no_spec[10:0]
               & agevec_all[10:0] & ~x_other_frz[10:0]));

//==========================================================
//                LSU Freeze Clear Signals
//==========================================================
//if all bits of age vec is 0, this entry is the oldest entry
assign old  = !(|agevec_all[10:0]);

assign x_lq_full  = lq_full;
always @(posedge lq_full_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lq_full             <=  1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    lq_full             <=  1'b0;
  else if(x_lq_full_set && vld)
    lq_full             <=  1'b1;
  else if(lq_full_wakeup)
    lq_full             <=  1'b0;
  else
    lq_full             <=  lq_full;
end

assign lq_full_wakeup = lsu_idu_lq_not_full ||  old;

assign x_sq_full  = sq_full;
always @(posedge sq_full_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sq_full             <=  1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    sq_full             <=  1'b0;
  else if(x_sq_full_set && vld)
    sq_full             <=  1'b1;
  else if(sq_full_wakeup)
    sq_full             <=  1'b0;
  else
    sq_full             <=  sq_full;
end

assign sq_full_wakeup = lsu_idu_sq_not_full ||  old;

assign x_rb_full  = rb_full;
always @(posedge rb_full_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rb_full             <=  1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    rb_full             <=  1'b0;
  else if(x_rb_full_set && vld)
    rb_full             <=  1'b1;
  else if(rb_full_wakeup)
    rb_full             <=  1'b0;
  else
    rb_full             <=  rb_full;
end

assign rb_full_wakeup = lsu_idu_rb_not_full ||  old;

assign x_wait_old = wait_old;
always @(posedge wait_old_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wait_old            <=  1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    wait_old            <=  1'b0;
  else if(x_wait_old_set && vld)
    wait_old            <=  1'b1;
  else if(wait_old_wakeup)
    wait_old            <=  1'b0;
  else
    wait_old            <=  wait_old;
end

assign wait_old_wakeup = old;

assign x_wait_fence = wait_fence;
always @(posedge wait_fence_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wait_fence            <=  1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    wait_fence            <=  1'b0;
  else if(x_wait_fence_set && vld)
    wait_fence            <=  1'b1;
  else if(wait_fence_wakeup)
    wait_fence            <=  1'b0;
  else
    wait_fence            <=  wait_fence;
end

assign wait_fence_wakeup = lsu_idu_no_fence;

assign x_tlb_busy = tlb_busy;
always @(posedge tlb_busy_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tlb_busy            <=  1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    tlb_busy            <=  1'b0;
  else if(x_tlb_busy_set && vld)
    tlb_busy            <=  1'b1;
  else if(x_tlb_wakeup)
    tlb_busy            <=  1'b0;
  else
    tlb_busy            <=  tlb_busy;
end

assign lsu_frz_clr  =  ( bar_check  || no_spec_check || lq_full
                      || sq_full    || rb_full       || wait_old
                      || wait_fence || tlb_busy)
                      && (!bar_check     || bar_check     && bar_check_wakeup)
                      && (!no_spec_check || no_spec_check && no_spec_check_wakeup)
                      && (!lq_full       || lq_full       && lq_full_wakeup)
                      && (!sq_full       || sq_full       && sq_full_wakeup)
                      && (!rb_full       || rb_full       && rb_full_wakeup)
                      && (!wait_old      || wait_old      && wait_old_wakeup)
                      && (!wait_fence    || wait_fence    && wait_fence_wakeup)
                      && (!tlb_busy      || tlb_busy      && x_tlb_wakeup);

//==========================================================
//                    LSU Pass Signals
//==========================================================
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    already_da          <=  1'b0;
  else if(x_create_en)
    already_da          <=  1'b0;
  else if(x_unalign_2nd_set)
    already_da          <=  1'b0;
  else if(x_already_da_set)
    already_da          <=  1'b1;
  else
    already_da          <=  already_da;
end

assign x_read_data[LSIQ_ALREADY_DA] = already_da;

always @(posedge unalign_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    unalign_2nd         <=  1'b0;
  else if(x_create_en)
    unalign_2nd         <=  1'b0;
  else if(x_unalign_2nd_set)
    unalign_2nd         <=  1'b1;
  else
    unalign_2nd         <=  unalign_2nd;
end

assign x_read_data[LSIQ_UNALIGN_2ND] = unalign_2nd;

always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    spec_fail           <=  1'b0;
  else if(x_create_en)
    spec_fail           <=  1'b0;
  else if(x_spec_fail_set)
    spec_fail           <=  1'b1;
  else
    spec_fail           <=  spec_fail;
end

assign x_read_data[LSIQ_SPEC_FAIL] = spec_fail;

always @(posedge unalign_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bkpta_data           <=  1'b0;
  else if(x_create_en)
    bkpta_data           <=  1'b0;
  else if(x_bkpta_data_set)
    bkpta_data           <=  1'b1;
  else
    bkpta_data           <=  bkpta_data;
end

assign x_read_data[LSIQ_BKPTA_DATA] = bkpta_data;

always @(posedge unalign_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bkptb_data           <=  1'b0;
  else if(x_create_en)
    bkptb_data           <=  1'b0;
  else if(x_bkptb_data_set)
    bkptb_data           <=  1'b1;
  else
    bkptb_data           <=  bkptb_data;
end

assign x_read_data[LSIQ_BKPTB_DATA] = bkptb_data;

//==========================================================
//              Source Dependency Information
//==========================================================
//------------------------source 0--------------------------
assign create_src0_gateclk_en = x_create_gateclk_en && x_create_data[LSIQ_SRC0_VLD];
assign create_src0_data[9]    = x_create_data[LSIQ_SRC0_LSU_MATCH];
assign create_src0_data[8:0]  = x_create_data[LSIQ_SRC0_DATA:LSIQ_SRC0_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_lsiq_src0_entry"); @643
ct_idu_dep_reg_entry  x_ct_idu_is_lsiq_src0_entry (
  .alu0_reg_fwd_vld                        (x_alu0_reg_fwd_vld[0]                  ),
  .alu1_reg_fwd_vld                        (x_alu1_reg_fwd_vld[0]                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (create_src0_data[9:0]                  ),
  .x_gateclk_idx_write_en                  (create_src0_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (src0_rdy_clr                           ),
  .x_read_data                             (read_src0_data[11:0]                   ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @644
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[0]), @645
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[0]), @646
//          .x_write_en               (x_create_dp_en), @647
//          .x_gateclk_write_en       (x_create_gateclk_en), @648
//          .x_gateclk_idx_write_en   (create_src0_gateclk_en), @649
//          .x_create_data            (create_src0_data[9:0]), @650
//          .x_read_data              (read_src0_data[11:0]), @651
//          .x_rdy_clr                (src0_rdy_clr) @652
//         ); @653
assign x_read_data[LSIQ_SRC0_WB]                    = read_src0_data[1];
assign x_read_data[LSIQ_SRC0_PREG:LSIQ_SRC0_PREG-6] = read_src0_data[8:2];
assign src0_rdy_for_issue                           = read_src0_data[9];
assign x_read_data[LSIQ_SRC0_RDY]                   = 1'b0;
assign x_read_data[LSIQ_SRC0_LSU_MATCH]             = 1'b0;

//------------------------source 1--------------------------
assign create_src1_gateclk_en = x_create_gateclk_en && x_create_data[LSIQ_SRC1_VLD];
assign create_src1_data[9]    = x_create_data[LSIQ_SRC1_LSU_MATCH];
assign create_src1_data[8:0]  = x_create_data[LSIQ_SRC1_DATA:LSIQ_SRC1_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_lsiq_src1_entry"); @664
ct_idu_dep_reg_entry  x_ct_idu_is_lsiq_src1_entry (
  .alu0_reg_fwd_vld                        (x_alu0_reg_fwd_vld[1]                  ),
  .alu1_reg_fwd_vld                        (x_alu1_reg_fwd_vld[1]                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (create_src1_data[9:0]                  ),
  .x_gateclk_idx_write_en                  (create_src1_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (src1_rdy_clr                           ),
  .x_read_data                             (read_src1_data[11:0]                   ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @665
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[1]), @666
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[1]), @667
//          .x_write_en               (x_create_dp_en), @668
//          .x_gateclk_write_en       (x_create_gateclk_en), @669
//          .x_gateclk_idx_write_en   (create_src1_gateclk_en), @670
//          .x_create_data            (create_src1_data[9:0]), @671
//          .x_read_data              (read_src1_data[11:0]), @672
//          .x_rdy_clr                (src1_rdy_clr) @673
//         ); @674
assign x_read_data[LSIQ_SRC1_WB]                    = read_src1_data[1];
assign x_read_data[LSIQ_SRC1_PREG:LSIQ_SRC1_PREG-6] = read_src1_data[8:2];
assign src1_rdy_for_issue                           = read_src1_data[9];
assign x_read_data[LSIQ_SRC1_RDY]                   = 1'b0;
assign x_read_data[LSIQ_SRC1_LSU_MATCH]             = 1'b0;

//-----------------------source v m-------------------------
//timing optimization: cannot fwd from vfpu to lsu srcvm
assign create_srcvm_gateclk_en = x_create_gateclk_en && x_create_data[LSIQ_SRCVM_VLD];
assign create_srcvm_data[9]    = x_create_data[LSIQ_SRCVM_LSU_MATCH];
assign create_srcvm_data[8:0]  = x_create_data[LSIQ_SRCVM_DATA:LSIQ_SRCVM_DATA-8];
// &Instance("ct_idu_dep_vreg_entry", "x_ct_idu_is_lsiq_srcvm_entry"); @686
ct_idu_dep_vreg_entry  x_ct_idu_is_lsiq_srcvm_entry (
  .cp0_idu_icg_en                       (cp0_idu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .gateclk_entry_vld                    (gateclk_entry_vld                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld      (lsu_idu_ag_pipe3_vload_inst_vld     ),
  .lsu_idu_ag_pipe3_vreg_dupx           (lsu_idu_ag_pipe3_vreg_dupx          ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld  (lsu_idu_dc_pipe3_vload_fwd_inst_vld ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx (lsu_idu_dc_pipe3_vload_inst_vld_dupx),
  .lsu_idu_dc_pipe3_vreg_dupx           (lsu_idu_dc_pipe3_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx        (lsu_idu_wb_pipe3_wb_vreg_dupx       ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx    (lsu_idu_wb_pipe3_wb_vreg_vld_dupx   ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx     (1'b0                                ),
  .vfpu_idu_ex1_pipe6_vreg_dupx         (7'b0                                ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx     (1'b0                                ),
  .vfpu_idu_ex1_pipe7_vreg_dupx         (7'b0                                ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx     (1'b0                                ),
  .vfpu_idu_ex2_pipe6_vreg_dupx         (7'b0                                ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx     (1'b0                                ),
  .vfpu_idu_ex2_pipe7_vreg_dupx         (7'b0                                ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx     (1'b0                                ),
  .vfpu_idu_ex3_pipe6_vreg_dupx         (7'b0                                ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx     (1'b0                                ),
  .vfpu_idu_ex3_pipe7_vreg_dupx         (7'b0                                ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx      (vfpu_idu_ex5_pipe6_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx      (vfpu_idu_ex5_pipe7_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx ),
  .x_create_data                        (create_srcvm_data[9:0]              ),
  .x_gateclk_idx_write_en               (create_srcvm_gateclk_en             ),
  .x_gateclk_write_en                   (x_create_gateclk_en                 ),
  .x_rdy_clr                            (srcvm_rdy_clr                       ),
  .x_read_data                          (read_srcvm_data[11:0]               ),
  .x_write_en                           (x_create_dp_en                      )
);

// &Connect(.gateclk_entry_vld                (gateclk_entry_vld), @687
//          .x_write_en                       (x_create_dp_en), @688
//          .x_gateclk_write_en               (x_create_gateclk_en), @689
//          .x_gateclk_idx_write_en           (create_srcvm_gateclk_en), @690
//          .x_create_data                    (create_srcvm_data[9:0]), @691
//          .x_read_data                      (read_srcvm_data[11:0]), @692
//          .x_rdy_clr                        (srcvm_rdy_clr), @693
//          .vfpu_idu_ex1_pipe6_data_vld_dupx (1'b0), @694
//          .vfpu_idu_ex2_pipe6_data_vld_dupx (1'b0), @695
//          .vfpu_idu_ex3_pipe6_data_vld_dupx (1'b0), @696
//          .vfpu_idu_ex1_pipe7_data_vld_dupx (1'b0), @697
//          .vfpu_idu_ex2_pipe7_data_vld_dupx (1'b0), @698
//          .vfpu_idu_ex3_pipe7_data_vld_dupx (1'b0), @699
//          .vfpu_idu_ex1_pipe6_vreg_dupx     (7'b0), @700
//          .vfpu_idu_ex2_pipe6_vreg_dupx     (7'b0), @701
//          .vfpu_idu_ex3_pipe6_vreg_dupx     (7'b0), @702
//          .vfpu_idu_ex1_pipe7_vreg_dupx     (7'b0), @703
//          .vfpu_idu_ex2_pipe7_vreg_dupx     (7'b0), @704
//          .vfpu_idu_ex3_pipe7_vreg_dupx     (7'b0) @705
//         ); @706
assign x_read_data[LSIQ_SRCVM_WB]                     = read_srcvm_data[1];
assign x_read_data[LSIQ_SRCVM_VREG:LSIQ_SRCVM_VREG-6] = read_srcvm_data[8:2];
assign srcvm_rdy_for_issue                            = read_srcvm_data[9];
assign x_read_data[LSIQ_SRCVM_RDY]                    = 1'b0;
assign x_read_data[LSIQ_SRCVM_LSU_MATCH]              = 1'b0;

//==========================================================
//                  Entry Ready Signal
//==========================================================
//------------------------raw ready-------------------------
//without older entry ready mask
// &Force ("output", "x_raw_rdy"); @718
assign x_raw_rdy = vld && !frz
                       && src0_rdy_for_issue
                       && src1_rdy_for_issue
                       && srcvm_rdy_for_issue;

//----------------------older ready-------------------------
//if older entry of same type raw ready, mask cur entry ready
assign older_entry_rdy_mask = |(agevec[10:0] & x_other_raw_rdy[10:0]);

//----------------------final ready-------------------------
//if older entry is ready, mask current entry ready
assign x_rdy = x_raw_rdy && !older_entry_rdy_mask;

// &ModuleEnd; @732
endmodule


