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

// &ModuleBeg; @24
module ct_idu_id_split_long(
  cp0_idu_icg_en,
  cp0_idu_vstart,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_split_long_id_inst_vld,
  ctrl_split_long_id_stall,
  dp_split_long_bkpta_inst,
  dp_split_long_bkptb_inst,
  dp_split_long_inst,
  dp_split_long_no_spec,
  dp_split_long_pc,
  dp_split_long_type,
  dp_split_long_vl,
  dp_split_long_vl_pred,
  dp_split_long_vlmul,
  dp_split_long_vsew,
  forever_cpuclk,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  split_long_ctrl_id_stall,
  split_long_ctrl_inst_vld,
  split_long_dp_dep_info,
  split_long_dp_inst0_data,
  split_long_dp_inst1_data,
  split_long_dp_inst2_data,
  split_long_dp_inst3_data
);

// &Ports; @25
input            cp0_idu_icg_en;                     
input   [6  :0]  cp0_idu_vstart;                     
input            cp0_yy_clk_en;                      
input            cpurst_b;                           
input            ctrl_split_long_id_inst_vld;        
input            ctrl_split_long_id_stall;           
input            dp_split_long_bkpta_inst;           
input            dp_split_long_bkptb_inst;           
input   [31 :0]  dp_split_long_inst;                 
input            dp_split_long_no_spec;              
input   [14 :0]  dp_split_long_pc;                   
input   [9  :0]  dp_split_long_type;                 
input   [7  :0]  dp_split_long_vl;                   
input            dp_split_long_vl_pred;              
input   [1  :0]  dp_split_long_vlmul;                
input   [2  :0]  dp_split_long_vsew;                 
input            forever_cpuclk;                     
input            iu_yy_xx_cancel;                    
input            pad_yy_icg_scan_en;                 
input            rtu_idu_flush_fe;                   
output           split_long_ctrl_id_stall;           
output  [3  :0]  split_long_ctrl_inst_vld;           
output  [16 :0]  split_long_dp_dep_info;             
output  [177:0]  split_long_dp_inst0_data;           
output  [177:0]  split_long_dp_inst1_data;           
output  [177:0]  split_long_dp_inst2_data;           
output  [177:0]  split_long_dp_inst3_data;           

// &Regs; @26
reg     [16 :0]  amo_012_dep_info;                   
reg     [16 :0]  amo_123_dep_info;                   
reg     [177:0]  amo_amoalu_inst_data;               
reg     [177:0]  amo_amoload_inst_data;              
reg     [177:0]  amo_amostore_inst_data;             
reg              amo_cur_state;                      
reg     [16 :0]  amo_dep_info;                       
reg     [177:0]  amo_fence_aq_inst_data;             
reg     [177:0]  amo_fence_rl_inst_data;             
reg     [177:0]  amo_inst0_data;                     
reg     [177:0]  amo_inst1_data;                     
reg     [177:0]  amo_inst2_data;                     
reg     [177:0]  amo_inst3_data;                     
reg     [177:0]  amo_lr_inst_data;                   
reg              amo_next_state;                     
reg     [177:0]  amo_sc_inst_data;                   
reg              fored_split_inst0_last;             
reg     [5  :0]  fored_split_inst0_split_cnt;        
reg              fored_split_inst1_last;             
reg     [5  :0]  fored_split_inst1_split_cnt;        
reg              fored_split_inst2_last;             
reg     [5  :0]  fored_split_inst2_split_cnt;        
reg              fored_split_inst3_last;             
reg     [5  :0]  fored_split_inst3_split_cnt;        
reg     [5  :0]  fored_w_split_inst0_split_cnt;      
reg     [31 :0]  fored_w_split_inst0_split_inst;     
reg              fored_w_split_inst1_last;           
reg     [5  :0]  fored_w_split_inst1_split_cnt;      
reg     [31 :0]  fored_w_split_inst1_split_inst;     
reg     [5  :0]  fored_w_split_inst2_split_cnt;      
reg     [31 :0]  fored_w_split_inst2_split_inst;     
reg              fored_w_split_inst3_last;           
reg     [5  :0]  fored_w_split_inst3_split_cnt;      
reg     [31 :0]  fored_w_split_inst3_split_inst;     
reg              funored_split_inst0_last;           
reg     [5  :0]  funored_split_inst0_split_cnt;      
reg              funored_split_inst1_last;           
reg     [5  :0]  funored_split_inst1_split_cnt;      
reg              funored_split_inst2_last;           
reg              funored_split_inst2_round_end;      
reg     [5  :0]  funored_split_inst2_split_cnt;      
reg              funored_split_inst3_last;           
reg     [5  :0]  funored_split_inst3_split_cnt;      
reg     [31 :0]  funored_w_split_inst0;              
reg              funored_w_split_inst0_last;         
reg     [5  :0]  funored_w_split_inst0_split_cnt;    
reg     [1  :0]  funored_w_split_inst0_vlmul;        
reg     [2  :0]  funored_w_split_inst0_vsew;         
reg     [31 :0]  funored_w_split_inst1;              
reg              funored_w_split_inst1_last;         
reg     [5  :0]  funored_w_split_inst1_split_cnt;    
reg     [1  :0]  funored_w_split_inst1_vlmul;        
reg     [2  :0]  funored_w_split_inst1_vsew;         
reg     [31 :0]  funored_w_split_inst2;              
reg              funored_w_split_inst2_last;         
reg     [5  :0]  funored_w_split_inst2_split_cnt;    
reg     [1  :0]  funored_w_split_inst2_vlmul;        
reg     [2  :0]  funored_w_split_inst2_vsew;         
reg     [31 :0]  funored_w_split_inst3;              
reg              funored_w_split_inst3_last;         
reg     [5  :0]  funored_w_split_inst3_split_cnt;    
reg     [1  :0]  funored_w_split_inst3_vlmul;        
reg     [2  :0]  funored_w_split_inst3_vsew;         
reg     [5  :0]  index_nf_reg_offset0;               
reg     [5  :0]  index_nf_reg_offset1;               
reg     [177:0]  split_long_dp_inst0_data;           
reg     [177:0]  split_long_dp_inst1_data;           
reg     [177:0]  split_long_dp_inst2_data;           
reg     [177:0]  split_long_dp_inst3_data;           
reg     [5  :0]  stride_nf_reg_offset0;              
reg     [5  :0]  stride_nf_reg_offset1;              
reg     [5  :0]  unit_nf_reg_offset0;                
reg     [5  :0]  unit_nf_reg_offset1;                
reg     [6  :0]  vec_amo_cnt;                        
reg     [1  :0]  vec_amo_cur_state;                  
reg     [1  :0]  vec_amo_next_state;                 
reg     [177:0]  vec_amo_split_inst0_data;           
reg     [177:0]  vec_amo_split_inst1_data;           
reg     [177:0]  vec_amo_split_inst2_data;           
reg     [2  :0]  vec_amo_vreg_offset;                
reg     [3  :0]  vec_fnorm_wf_cnt;                   
reg              vec_fnorm_wf_cur_state;             
reg              vec_fnorm_wf_next_state;            
reg     [177:0]  vec_fnorm_wf_split_inst0_data;      
reg     [177:0]  vec_fnorm_wf_split_inst1_data;      
reg     [177:0]  vec_fnorm_wf_split_inst2_data;      
reg     [177:0]  vec_fnorm_wf_split_inst3_data;      
reg     [3  :0]  vec_fnorm_wv_cnt;                   
reg              vec_fnorm_wv_cur_state;             
reg              vec_fnorm_wv_next_state;            
reg     [177:0]  vec_fnorm_wv_split_inst0_data;      
reg     [177:0]  vec_fnorm_wv_split_inst1_data;      
reg     [177:0]  vec_fnorm_wv_split_inst2_data;      
reg     [177:0]  vec_fnorm_wv_split_inst3_data;      
reg     [3  :0]  vec_fored_cnt;                      
reg              vec_fored_cur_state;                
reg              vec_fored_next_state;               
reg     [177:0]  vec_fored_split_inst0_data;         
reg     [177:0]  vec_fored_split_inst1_data;         
reg     [177:0]  vec_fored_split_inst2_data;         
reg     [177:0]  vec_fored_split_inst3_data;         
reg     [4  :0]  vec_fored_w_cnt;                    
reg              vec_fored_w_cur_state;              
reg              vec_fored_w_next_state;             
reg     [177:0]  vec_fored_w_split_inst0_data;       
reg     [177:0]  vec_fored_w_split_inst1_data;       
reg     [177:0]  vec_fored_w_split_inst2_data;       
reg     [177:0]  vec_fored_w_split_inst3_data;       
reg     [2  :0]  vec_funored_cnt;                    
reg              vec_funored_cur_state;              
reg              vec_funored_next_state;             
reg     [177:0]  vec_funored_split_inst0_data;       
reg     [177:0]  vec_funored_split_inst1_data;       
reg     [177:0]  vec_funored_split_inst2_data;       
reg     [177:0]  vec_funored_split_inst3_data;       
reg     [3  :0]  vec_funored_w_cnt;                  
reg              vec_funored_w_cur_state;            
reg              vec_funored_w_next_state;           
reg     [177:0]  vec_funored_w_split_inst0_data;     
reg     [177:0]  vec_funored_w_split_inst1_data;     
reg     [177:0]  vec_funored_w_split_inst2_data;     
reg     [177:0]  vec_funored_w_split_inst3_data;     
reg     [6  :0]  vec_index_cnt;                      
reg              vec_index_cur_state;                
reg              vec_index_next_state;               
reg     [177:0]  vec_index_split_inst0_data;         
reg     [177:0]  vec_index_split_inst1_data;         
reg     [177:0]  vec_index_split_inst2_data;         
reg     [177:0]  vec_index_split_inst3_data;         
reg     [2  :0]  vec_index_vreg_offset;              
reg     [2  :0]  vec_norm_cur_state;                 
reg     [16 :0]  vec_norm_dep_info;                  
reg     [177:0]  vec_norm_mtvr_data;                 
reg     [2  :0]  vec_norm_next_state;                
reg     [9  :0]  vec_norm_pipe;                      
reg     [177:0]  vec_norm_split_inst0_data;          
reg     [177:0]  vec_norm_split_inst1_data;          
reg     [177:0]  vec_norm_split_inst2_data;          
reg     [177:0]  vec_norm_split_inst3_data;          
reg     [177:0]  vec_perm_inst0_data_tmp;            
reg     [177:0]  vec_perm_inst1_data;                
reg     [177:0]  vec_perm_inst2_data;                
reg     [177:0]  vec_perm_inst3_data;                
reg     [3  :0]  vec_perm_inst_vld_tmp;              
reg     [177:0]  vec_perm_mtvr_data;                 
reg     [3  :0]  vec_perm_mtvr_fwd_inst;             
reg     [5  :0]  vec_stride_cnt;                     
reg              vec_stride_cur_state;               
reg              vec_stride_next_state;              
reg     [177:0]  vec_stride_split_inst0_data;        
reg     [177:0]  vec_stride_split_inst1_data;        
reg     [177:0]  vec_stride_split_inst2_data;        
reg     [177:0]  vec_stride_split_inst3_data;        
reg     [2  :0]  vec_stride_vreg_offset;             
reg     [1  :0]  vperm_cur_state;                    
reg     [3  :0]  vperm_idle_mtvr_fwd_inst;           
reg     [177:0]  vperm_inst0_data;                   
reg     [177:0]  vperm_inst1_data;                   
reg     [177:0]  vperm_inst2_data;                   
reg     [177:0]  vperm_inst3_data;                   
reg     [3  :0]  vperm_inst_vld;                     
reg     [3  :0]  vperm_mtvr_fwd_inst;                
reg     [1  :0]  vperm_next_state;                   
reg     [7  :0]  vperm_srcv0_index;                  
reg     [3  :0]  vpr_counter;                        
reg     [2  :0]  vrgather_cur_state;                 
reg     [177:0]  vrgather_inst0_data;                
reg     [177:0]  vrgather_inst1_data;                
reg     [177:0]  vrgather_inst2_data;                
reg     [177:0]  vrgather_inst3_data;                
reg     [3  :0]  vrgather_inst_split_last;           
reg     [3  :0]  vrgather_inst_vld;                  
reg     [3  :0]  vrgather_mtvr_fwd_inst;             
reg     [2  :0]  vrgather_next_state;                
reg     [2  :0]  vslide_cur_state;                   
reg     [177:0]  vslide_inst0_data;                  
reg     [177:0]  vslide_inst1_data;                  
reg     [177:0]  vslide_inst2_data;                  
reg     [177:0]  vslide_inst3_data;                  
reg     [3  :0]  vslide_inst_split_last;             
reg     [3  :0]  vslide_inst_vld;                    
reg     [3  :0]  vslide_mtvr_fwd_inst;               
reg     [2  :0]  vslide_next_state;                  
reg     [6  :0]  zvlsseg_index_cnt;                  
reg              zvlsseg_index_cur_state;            
reg              zvlsseg_index_next_state;           
reg     [1  :0]  zvlsseg_index_nf_cnt;               
reg     [177:0]  zvlsseg_index_split_inst0_data;     
reg     [177:0]  zvlsseg_index_split_inst1_data;     
reg     [177:0]  zvlsseg_index_split_inst2_data;     
reg     [177:0]  zvlsseg_index_split_inst3_data;     
reg     [2  :0]  zvlsseg_index_vreg_offset;          
reg     [6  :0]  zvlsseg_stride_cnt;                 
reg              zvlsseg_stride_cur_state;           
reg              zvlsseg_stride_next_state;          
reg     [1  :0]  zvlsseg_stride_nf_cnt;              
reg     [177:0]  zvlsseg_stride_split_inst0_data;    
reg     [177:0]  zvlsseg_stride_split_inst1_data;    
reg     [177:0]  zvlsseg_stride_split_inst2_data;    
reg     [177:0]  zvlsseg_stride_split_inst3_data;    
reg     [2  :0]  zvlsseg_stride_vreg_offset;         
reg     [6  :0]  zvlsseg_unit_cnt;                   
reg              zvlsseg_unit_cur_state;             
reg              zvlsseg_unit_next_state;            
reg     [1  :0]  zvlsseg_unit_nf_cnt;                
reg     [6  :0]  zvlsseg_unit_nf_offset_cnt;         
reg     [177:0]  zvlsseg_unit_split_inst0_data;      
reg     [177:0]  zvlsseg_unit_split_inst1_data;      
reg     [177:0]  zvlsseg_unit_split_inst2_data;      
reg     [2  :0]  zvlsseg_unit_vreg_offset;           

// &Wires; @27
wire             amo_add;                            
wire    [31 :0]  amo_amoalu_inst_op;                 
wire             amo_and;                            
wire             amo_aq;                             
wire             amo_dep_info_bit;                   
wire    [31 :0]  amo_fence_aq_inst_opcode;           
wire    [31 :0]  amo_fence_rl_inst_opcode;           
wire             amo_inst;                           
wire    [3  :0]  amo_inst_vld;                       
wire             amo_lr_or_sc;                       
wire             amo_max;                            
wire             amo_maxu;                           
wire             amo_min;                            
wire             amo_minu;                           
wire             amo_more_than_4;                    
wire             amo_or;                             
wire    [4  :0]  amo_rd;                             
wire             amo_rd_is_x0;                       
wire             amo_rl;                             
wire    [4  :0]  amo_rs1;                            
wire    [4  :0]  amo_rs2;                            
wire             amo_sm_start;                       
wire             amo_split_inst;                     
wire             amo_split_stall;                    
wire             amo_swap;                           
wire             amo_word;                           
wire             amo_xor;                            
wire             cp0_idu_icg_en;                     
wire    [6  :0]  cp0_idu_vstart;                     
wire             cp0_yy_clk_en;                      
wire             cpurst_b;                           
wire             ctrl_split_long_id_inst_vld;        
wire             ctrl_split_long_id_stall;           
wire             dp_split_fnorm_wf_vld;              
wire             dp_split_fnorm_wv_vld;              
wire             dp_split_fored_vld;                 
wire             dp_split_fored_w_vld;               
wire             dp_split_long_bkpta_inst;           
wire             dp_split_long_bkptb_inst;           
wire    [31 :0]  dp_split_long_inst;                 
wire             dp_split_long_no_spec;              
wire    [14 :0]  dp_split_long_pc;                   
wire    [9  :0]  dp_split_long_type;                 
wire    [7  :0]  dp_split_long_vl;                   
wire             dp_split_long_vl_pred;              
wire    [1  :0]  dp_split_long_vlmul;                
wire    [2  :0]  dp_split_long_vsew;                 
wire             dp_split_unfored_vld;               
wire             dp_split_unfored_w_vld;             
wire    [2  :0]  dp_split_w_vlmul;                   
wire    [2  :0]  dp_split_w_vsew;                    
wire    [31 :0]  fcvtw_inst;                         
wire             fnorm_wf_cnt_en;                    
wire             fnorm_wf_cnt_end;                   
wire             fnorm_wf_fst_round;                 
wire    [3  :0]  fnorm_wf_total_cnt_num;             
wire             fnorm_wv_cnt_en;                    
wire             fnorm_wv_cnt_end;                   
wire    [3  :0]  fnorm_wv_total_cnt_num;             
wire             fored_cnt_en;                       
wire             fored_cnt_end;                      
wire             fored_fst_round;                    
wire    [31 :0]  fored_inst;                         
wire    [2  :0]  fored_split_inst0_sew16_dy_lmul;    
wire    [2  :0]  fored_split_inst0_sew16_dy_splcnt;  
wire             fored_split_inst0_sew16_last;       
wire    [2  :0]  fored_split_inst0_sew32_dy_lmul;    
wire    [2  :0]  fored_split_inst0_sew32_dy_splcnt;  
wire             fored_split_inst0_sew32_last;       
wire    [2  :0]  fored_split_inst0_sew64_dy_lmul;    
wire    [2  :0]  fored_split_inst0_sew64_dy_splcnt;  
wire             fored_split_inst0_sew64_last;       
wire    [2  :0]  fored_split_inst1_sew16_dy_lmul;    
wire    [2  :0]  fored_split_inst1_sew16_dy_splcnt;  
wire             fored_split_inst1_sew16_last;       
wire    [2  :0]  fored_split_inst1_sew32_dy_lmul;    
wire    [2  :0]  fored_split_inst1_sew32_dy_splcnt;  
wire             fored_split_inst1_sew32_last;       
wire    [2  :0]  fored_split_inst1_sew64_dy_lmul;    
wire    [2  :0]  fored_split_inst1_sew64_dy_splcnt;  
wire             fored_split_inst1_sew64_last;       
wire    [2  :0]  fored_split_inst2_sew16_dy_lmul;    
wire    [2  :0]  fored_split_inst2_sew16_dy_splcnt;  
wire             fored_split_inst2_sew16_last;       
wire    [2  :0]  fored_split_inst2_sew32_dy_lmul;    
wire    [2  :0]  fored_split_inst2_sew32_dy_splcnt;  
wire             fored_split_inst2_sew32_last;       
wire    [2  :0]  fored_split_inst2_sew64_dy_lmul;    
wire    [2  :0]  fored_split_inst2_sew64_dy_splcnt;  
wire             fored_split_inst2_sew64_last;       
wire    [2  :0]  fored_split_inst3_sew16_dy_lmul;    
wire    [2  :0]  fored_split_inst3_sew16_dy_splcnt;  
wire             fored_split_inst3_sew16_last;       
wire    [2  :0]  fored_split_inst3_sew32_dy_lmul;    
wire    [2  :0]  fored_split_inst3_sew32_dy_splcnt;  
wire             fored_split_inst3_sew32_last;       
wire    [2  :0]  fored_split_inst3_sew64_dy_lmul;    
wire    [2  :0]  fored_split_inst3_sew64_dy_splcnt;  
wire             fored_split_inst3_sew64_last;       
wire    [5  :0]  fored_total_cnt_num;                
wire             fored_w_cnt_en;                     
wire             fored_w_cnt_end;                    
wire             fored_w_fst_round;                  
wire    [31 :0]  fored_w_split_inst0_sew16;          
wire    [2  :0]  fored_w_split_inst0_sew16_dy_lmul;  
wire    [2  :0]  fored_w_split_inst0_sew16_dy_splcnt; 
wire    [31 :0]  fored_w_split_inst0_sew32;          
wire    [2  :0]  fored_w_split_inst0_sew32_dy_lmul;  
wire    [2  :0]  fored_w_split_inst0_sew32_dy_splcnt; 
wire    [31 :0]  fored_w_split_inst1_sew16;          
wire    [2  :0]  fored_w_split_inst1_sew16_dy_lmul;  
wire    [2  :0]  fored_w_split_inst1_sew16_dy_splcnt; 
wire             fored_w_split_inst1_sew16_last;     
wire    [31 :0]  fored_w_split_inst1_sew32;          
wire    [2  :0]  fored_w_split_inst1_sew32_dy_lmul;  
wire    [2  :0]  fored_w_split_inst1_sew32_dy_splcnt; 
wire             fored_w_split_inst1_sew32_last;     
wire    [31 :0]  fored_w_split_inst2_sew16;          
wire    [2  :0]  fored_w_split_inst2_sew16_dy_lmul;  
wire    [2  :0]  fored_w_split_inst2_sew16_dy_splcnt; 
wire    [31 :0]  fored_w_split_inst2_sew32;          
wire    [2  :0]  fored_w_split_inst2_sew32_dy_lmul;  
wire    [2  :0]  fored_w_split_inst2_sew32_dy_splcnt; 
wire    [31 :0]  fored_w_split_inst3_sew16;          
wire    [2  :0]  fored_w_split_inst3_sew16_dy_lmul;  
wire    [2  :0]  fored_w_split_inst3_sew16_dy_splcnt; 
wire             fored_w_split_inst3_sew16_last;     
wire    [31 :0]  fored_w_split_inst3_sew32;          
wire    [2  :0]  fored_w_split_inst3_sew32_dy_lmul;  
wire    [2  :0]  fored_w_split_inst3_sew32_dy_splcnt; 
wire             fored_w_split_inst3_sew32_last;     
wire    [4  :0]  fored_w_total_cnt_num;              
wire             forever_cpuclk;                     
wire    [5  :0]  funct6;                             
wire             funored_cnt_en;                     
wire             funored_cnt_end;                    
wire             funored_fst_round;                  
wire    [2  :0]  funored_split_inst0_sew16_dy_lmul;  
wire    [2  :0]  funored_split_inst0_sew16_dy_splcnt; 
wire             funored_split_inst0_sew16_last;     
wire    [2  :0]  funored_split_inst0_sew32_dy_lmul;  
wire    [2  :0]  funored_split_inst0_sew32_dy_splcnt; 
wire             funored_split_inst0_sew32_last;     
wire    [2  :0]  funored_split_inst0_sew64_dy_lmul;  
wire    [2  :0]  funored_split_inst0_sew64_dy_splcnt; 
wire             funored_split_inst0_sew64_last;     
wire    [2  :0]  funored_split_inst1_sew16_dy_lmul;  
wire    [2  :0]  funored_split_inst1_sew16_dy_splcnt; 
wire             funored_split_inst1_sew16_last;     
wire    [2  :0]  funored_split_inst1_sew32_dy_lmul;  
wire    [2  :0]  funored_split_inst1_sew32_dy_splcnt; 
wire             funored_split_inst1_sew32_last;     
wire    [2  :0]  funored_split_inst1_sew64_dy_lmul;  
wire    [2  :0]  funored_split_inst1_sew64_dy_splcnt; 
wire             funored_split_inst1_sew64_last;     
wire    [2  :0]  funored_split_inst2_sew16_dy_lmul;  
wire    [2  :0]  funored_split_inst2_sew16_dy_splcnt; 
wire             funored_split_inst2_sew16_last;     
wire             funored_split_inst2_sew16_round_end; 
wire    [2  :0]  funored_split_inst2_sew32_dy_lmul;  
wire    [2  :0]  funored_split_inst2_sew32_dy_splcnt; 
wire             funored_split_inst2_sew32_last;     
wire             funored_split_inst2_sew32_round_end; 
wire    [2  :0]  funored_split_inst2_sew64_dy_lmul;  
wire    [2  :0]  funored_split_inst2_sew64_dy_splcnt; 
wire             funored_split_inst2_sew64_last;     
wire             funored_split_inst2_sew64_round_end; 
wire    [2  :0]  funored_split_inst3_sew16_dy_lmul;  
wire    [2  :0]  funored_split_inst3_sew16_dy_splcnt; 
wire             funored_split_inst3_sew16_last;     
wire    [2  :0]  funored_split_inst3_sew32_dy_lmul;  
wire    [2  :0]  funored_split_inst3_sew32_dy_splcnt; 
wire             funored_split_inst3_sew32_last;     
wire    [2  :0]  funored_split_inst3_sew64_dy_lmul;  
wire    [2  :0]  funored_split_inst3_sew64_dy_splcnt; 
wire             funored_split_inst3_sew64_last;     
wire    [2  :0]  funored_total_cnt_num;              
wire             funored_w_cnt_en;                   
wire             funored_w_cnt_end;                  
wire             funored_w_fst_round;                
wire    [3  :0]  funored_w_total_cnt_num;            
wire             iu_yy_xx_cancel;                    
wire             lr_inst;                            
wire             pad_yy_icg_scan_en;                 
wire    [31 :0]  perm_mtvr_inst_op;                  
wire             perm_split_clk;                     
wire             rtu_idu_flush_fe;                   
wire             sc_inst;                            
wire             split_clk;                          
wire             split_clk_en;                       
wire             split_long_ctrl_id_stall;           
wire    [3  :0]  split_long_ctrl_inst_vld;           
wire    [16 :0]  split_long_dp_dep_info;             
wire    [177:0]  split_long_inst0_data;              
wire    [177:0]  split_long_inst1_data;              
wire    [177:0]  split_long_inst2_data;              
wire    [177:0]  split_long_inst3_data;              
wire             vcompress;                          
wire    [31 :0]  vec_amo_add_inst;                   
wire    [16 :0]  vec_amo_dep_info;                   
wire             vec_amo_dst_v0;                     
wire    [31 :0]  vec_amo_ext_inst;                   
wire    [177:0]  vec_amo_inst0_data;                 
wire    [177:0]  vec_amo_inst1_data;                 
wire    [177:0]  vec_amo_inst2_data;                 
wire    [177:0]  vec_amo_inst3_data;                 
wire    [3  :0]  vec_amo_inst_vld;                   
wire             vec_amo_sm_start;                   
wire             vec_amo_split_clk;                  
wire             vec_amo_split_clk_en;               
wire    [177:0]  vec_amo_split_inst3_data;           
wire             vec_amo_split_last;                 
wire             vec_amo_split_stall;                
wire    [31 :0]  vec_amo_valu_inst;                  
wire    [31 :0]  vec_amo_vmv_inst;                   
wire             vec_amo_vreg_begin;                 
wire             vec_amo_vreg_end;                   
wire             vec_dstv_ovlp_vs2;                  
wire    [2  :0]  vec_fnorm_wf_base_cnt;              
wire    [16 :0]  vec_fnorm_wf_dep_info;              
wire    [4  :0]  vec_fnorm_wf_dest_vreg_1;           
wire    [4  :0]  vec_fnorm_wf_dest_vreg_3;           
wire    [177:0]  vec_fnorm_wf_inst0_data;            
wire    [177:0]  vec_fnorm_wf_inst1_data;            
wire    [177:0]  vec_fnorm_wf_inst2_data;            
wire    [177:0]  vec_fnorm_wf_inst3_data;            
wire    [3  :0]  vec_fnorm_wf_inst_vld;              
wire             vec_fnorm_wf_sm_start;              
wire             vec_fnorm_wf_split_busy;            
wire             vec_fnorm_wf_split_clk;             
wire             vec_fnorm_wf_split_clk_en;          
wire    [1  :0]  vec_fnorm_wf_split_inst0_lmul;      
wire    [2  :0]  vec_fnorm_wf_split_inst0_sew;       
wire    [1  :0]  vec_fnorm_wf_split_inst1_lmul;      
wire    [2  :0]  vec_fnorm_wf_split_inst1_sew;       
wire    [1  :0]  vec_fnorm_wf_split_inst2_lmul;      
wire    [2  :0]  vec_fnorm_wf_split_inst2_sew;       
wire    [1  :0]  vec_fnorm_wf_split_inst3_lmul;      
wire    [2  :0]  vec_fnorm_wf_split_inst3_sew;       
wire             vec_fnorm_wf_split_stall;           
wire    [4  :0]  vec_fnorm_wf_srcv0_vreg_1;          
wire    [4  :0]  vec_fnorm_wf_srcv0_vreg_3;          
wire    [4  :0]  vec_fnorm_wf_srcv1_vreg;            
wire    [16 :0]  vec_fnorm_wv_dep_info;              
wire    [4  :0]  vec_fnorm_wv_dest_vreg_1;           
wire    [4  :0]  vec_fnorm_wv_dest_vreg_3;           
wire    [177:0]  vec_fnorm_wv_inst0_data;            
wire    [177:0]  vec_fnorm_wv_inst1_data;            
wire    [177:0]  vec_fnorm_wv_inst2_data;            
wire    [177:0]  vec_fnorm_wv_inst3_data;            
wire    [3  :0]  vec_fnorm_wv_inst_vld;              
wire             vec_fnorm_wv_sm_start;              
wire             vec_fnorm_wv_split_busy;            
wire             vec_fnorm_wv_split_clk;             
wire             vec_fnorm_wv_split_clk_en;          
wire    [1  :0]  vec_fnorm_wv_split_inst0_lmul;      
wire    [2  :0]  vec_fnorm_wv_split_inst0_sew;       
wire    [1  :0]  vec_fnorm_wv_split_inst1_lmul;      
wire    [2  :0]  vec_fnorm_wv_split_inst1_sew;       
wire    [1  :0]  vec_fnorm_wv_split_inst2_lmul;      
wire    [2  :0]  vec_fnorm_wv_split_inst2_sew;       
wire    [1  :0]  vec_fnorm_wv_split_inst3_lmul;      
wire    [2  :0]  vec_fnorm_wv_split_inst3_sew;       
wire             vec_fnorm_wv_split_stall;           
wire    [4  :0]  vec_fnorm_wv_srcv0_vreg_1;          
wire    [4  :0]  vec_fnorm_wv_srcv0_vreg_3;          
wire    [4  :0]  vec_fnorm_wv_srcv1_vreg;            
wire    [16 :0]  vec_fored_dep_info;                 
wire    [4  :0]  vec_fored_destv_vreg;               
wire    [177:0]  vec_fored_inst0_data;               
wire    [177:0]  vec_fored_inst1_data;               
wire    [177:0]  vec_fored_inst2_data;               
wire    [177:0]  vec_fored_inst3_data;               
wire    [3  :0]  vec_fored_inst_vld;                 
wire             vec_fored_sm_start;                 
wire             vec_fored_split_busy;               
wire             vec_fored_split_clk;                
wire             vec_fored_split_clk_en;             
wire    [5  :0]  vec_fored_split_inst0_src0;         
wire    [5  :0]  vec_fored_split_inst0_src1;         
wire    [5  :0]  vec_fored_split_inst1_src0;         
wire    [5  :0]  vec_fored_split_inst1_src1;         
wire    [5  :0]  vec_fored_split_inst2_src0;         
wire    [5  :0]  vec_fored_split_inst2_src1;         
wire    [5  :0]  vec_fored_split_inst3_src0;         
wire    [5  :0]  vec_fored_split_inst3_src1;         
wire             vec_fored_split_stall;              
wire    [4  :0]  vec_fored_srcv0_vreg_0;             
wire    [4  :0]  vec_fored_srcv0_vreg_1;             
wire    [4  :0]  vec_fored_srcv0_vreg_2;             
wire    [4  :0]  vec_fored_srcv0_vreg_3;             
wire    [4  :0]  vec_fored_srcv1_vreg;               
wire             vec_fored_w_cnt_h;                  
wire    [2  :0]  vec_fored_w_cnt_l;                  
wire    [16 :0]  vec_fored_w_dep_info;               
wire    [4  :0]  vec_fored_w_destv_vreg;             
wire    [177:0]  vec_fored_w_inst0_data;             
wire             vec_fored_w_inst0_mul8;             
wire    [177:0]  vec_fored_w_inst1_data;             
wire    [177:0]  vec_fored_w_inst2_data;             
wire    [177:0]  vec_fored_w_inst3_data;             
wire    [3  :0]  vec_fored_w_inst_vld;               
wire             vec_fored_w_sm_start;               
wire             vec_fored_w_split_busy;             
wire             vec_fored_w_split_clk;              
wire             vec_fored_w_split_clk_en;           
wire    [1  :0]  vec_fored_w_split_inst0_lmul;       
wire    [2  :0]  vec_fored_w_split_inst0_sew;        
wire    [5  :0]  vec_fored_w_split_inst0_src0;       
wire    [5  :0]  vec_fored_w_split_inst0_src1;       
wire    [5  :0]  vec_fored_w_split_inst1_dest;       
wire    [1  :0]  vec_fored_w_split_inst1_lmul;       
wire    [2  :0]  vec_fored_w_split_inst1_sew;        
wire    [5  :0]  vec_fored_w_split_inst1_src0;       
wire    [5  :0]  vec_fored_w_split_inst1_src1;       
wire    [1  :0]  vec_fored_w_split_inst2_lmul;       
wire    [2  :0]  vec_fored_w_split_inst2_sew;        
wire    [1  :0]  vec_fored_w_split_inst3_lmul;       
wire    [2  :0]  vec_fored_w_split_inst3_sew;        
wire    [5  :0]  vec_fored_w_split_inst3_src0;       
wire    [5  :0]  vec_fored_w_split_inst3_src1;       
wire             vec_fored_w_split_stall;            
wire    [4  :0]  vec_fored_w_srcv0_vreg_0;           
wire    [4  :0]  vec_fored_w_srcv1_vreg;             
wire    [16 :0]  vec_fred_dep_info;                  
wire    [177:0]  vec_fred_inst0_data;                
wire    [177:0]  vec_fred_inst1_data;                
wire    [177:0]  vec_fred_inst2_data;                
wire    [177:0]  vec_fred_inst3_data;                
wire    [3  :0]  vec_fred_inst_vld;                  
wire             vec_fred_split_stall;               
wire             vec_fred_w_mul8;                    
wire    [16 :0]  vec_funored_dep_info;               
wire    [4  :0]  vec_funored_destv_vreg;             
wire    [177:0]  vec_funored_inst0_data;             
wire    [177:0]  vec_funored_inst1_data;             
wire    [177:0]  vec_funored_inst2_data;             
wire    [177:0]  vec_funored_inst3_data;             
wire    [3  :0]  vec_funored_inst_vld;               
wire             vec_funored_sm_start;               
wire             vec_funored_split_busy;             
wire             vec_funored_split_clk;              
wire             vec_funored_split_clk_en;           
wire    [5  :0]  vec_funored_split_inst1_dest;       
wire             vec_funored_split_stall;            
wire    [4  :0]  vec_funored_srcv0_vreg_0;           
wire    [4  :0]  vec_funored_srcv0_vreg_2;           
wire    [4  :0]  vec_funored_srcv1_vreg;             
wire             vec_funored_w_cnt_h;                
wire    [2  :0]  vec_funored_w_cnt_l;                
wire    [16 :0]  vec_funored_w_dep_info;             
wire    [4  :0]  vec_funored_w_destv_vreg;           
wire    [177:0]  vec_funored_w_inst0_data;           
wire    [177:0]  vec_funored_w_inst1_data;           
wire    [177:0]  vec_funored_w_inst2_data;           
wire    [177:0]  vec_funored_w_inst3_data;           
wire    [3  :0]  vec_funored_w_inst_vld;             
wire             vec_funored_w_sm_start;             
wire             vec_funored_w_split_busy;           
wire             vec_funored_w_split_clk;            
wire             vec_funored_w_split_clk_en;         
wire    [1  :0]  vec_funored_w_split_inst0_lmul;     
wire    [2  :0]  vec_funored_w_split_inst0_sew;      
wire    [1  :0]  vec_funored_w_split_inst1_lmul;     
wire    [2  :0]  vec_funored_w_split_inst1_sew;      
wire    [1  :0]  vec_funored_w_split_inst2_lmul;     
wire    [2  :0]  vec_funored_w_split_inst2_sew;      
wire    [1  :0]  vec_funored_w_split_inst3_lmul;     
wire    [2  :0]  vec_funored_w_split_inst3_sew;      
wire             vec_funored_w_split_stall;          
wire    [4  :0]  vec_funored_w_srcv0_vreg_0;         
wire    [4  :0]  vec_funored_w_srcv1_vreg;           
wire             vec_gpr_vld;                        
wire             vec_imm_vld;                        
wire    [31 :0]  vec_index_add_inst;                 
wire    [16 :0]  vec_index_dep_info;                 
wire    [31 :0]  vec_index_ext_inst;                 
wire    [177:0]  vec_index_inst0_data;               
wire    [177:0]  vec_index_inst1_data;               
wire    [177:0]  vec_index_inst2_data;               
wire    [177:0]  vec_index_inst3_data;               
wire    [3  :0]  vec_index_inst_vld;                 
wire             vec_index_sm_start;                 
wire             vec_index_split_clk;                
wire             vec_index_split_clk_en;             
wire             vec_index_split_last;               
wire             vec_index_split_stall;              
wire    [31 :0]  vec_index_vmv_inst;                 
wire             vec_index_vreg_begin;               
wire             vec_index_vreg_end;                 
wire    [31 :0]  vec_inst;                           
wire             vec_inst_adc;                       
wire             vec_inst_cmp;                       
wire             vec_inst_div;                       
wire             vec_inst_ereg;                      
wire             vec_inst_fmv;                       
wire             vec_inst_mac;                       
wire             vec_inst_madd;                      
wire             vec_inst_red;                       
wire             vec_inst_sat;                       
wire             vec_inst_sht;                       
wire             vec_ld;                             
wire             vec_ld_srcv2_vld;                   
wire             vec_ldst;                           
wire    [1  :0]  vec_lmul;                           
wire    [31 :0]  vec_mtvr_inst_op;                   
wire    [4  :0]  vec_mvvf_inst_cnt;                  
wire             vec_narr_sat;                       
wire             vec_narr_sht;                       
wire             vec_norm_cur_1st;                   
wire             vec_norm_cur_2nd;                   
wire             vec_norm_cur_mtvr;                  
wire    [11 :0]  vec_norm_destv_offset;              
wire    [11 :0]  vec_norm_destv_offset_tmp;          
wire    [4  :0]  vec_norm_destv_vreg_0;              
wire    [4  :0]  vec_norm_destv_vreg_1;              
wire    [4  :0]  vec_norm_destv_vreg_2;              
wire    [4  :0]  vec_norm_destv_vreg_3;              
wire             vec_norm_div;                       
wire    [177:0]  vec_norm_inst0_data;                
wire    [177:0]  vec_norm_inst1_data;                
wire    [177:0]  vec_norm_inst2_data;                
wire    [177:0]  vec_norm_inst3_data;                
wire             vec_norm_inst_0_finish;             
wire             vec_norm_inst_1_finish;             
wire             vec_norm_inst_3_finish;             
wire    [3  :0]  vec_norm_inst_vld;                  
wire             vec_norm_inst_vmla;                 
wire             vec_norm_mac;                       
wire             vec_norm_mul;                       
wire    [3  :0]  vec_norm_pipe_sel;                  
wire             vec_norm_require_2nd;               
wire             vec_norm_sat;                       
wire             vec_norm_sht;                       
wire             vec_norm_sm_start;                  
wire             vec_norm_split_clk;                 
wire             vec_norm_split_clk_en;              
wire    [3  :0]  vec_norm_split_num;                 
wire             vec_norm_split_slow_0;              
wire             vec_norm_split_slow_1;              
wire             vec_norm_split_stall;               
wire    [11 :0]  vec_norm_srcv0_offset;              
wire    [11 :0]  vec_norm_srcv0_offset_tmp;          
wire             vec_norm_srcv0_tmp;                 
wire             vec_norm_srcv0_vld;                 
wire    [4  :0]  vec_norm_srcv0_vreg_0;              
wire    [4  :0]  vec_norm_srcv0_vreg_0_tmp;          
wire    [4  :0]  vec_norm_srcv0_vreg_1;              
wire    [4  :0]  vec_norm_srcv0_vreg_1_tmp;          
wire    [4  :0]  vec_norm_srcv0_vreg_2;              
wire    [4  :0]  vec_norm_srcv0_vreg_2_tmp;          
wire    [4  :0]  vec_norm_srcv0_vreg_3;              
wire    [4  :0]  vec_norm_srcv0_vreg_3_tmp;          
wire    [11 :0]  vec_norm_srcv1_offset;              
wire             vec_norm_srcv1_tmp;                 
wire             vec_norm_srcv1_vld;                 
wire    [4  :0]  vec_norm_srcv1_vreg_0;              
wire    [4  :0]  vec_norm_srcv1_vreg_0_tmp;          
wire    [4  :0]  vec_norm_srcv1_vreg_1;              
wire    [4  :0]  vec_norm_srcv1_vreg_1_tmp;          
wire    [4  :0]  vec_norm_srcv1_vreg_2;              
wire    [4  :0]  vec_norm_srcv1_vreg_2_tmp;          
wire    [4  :0]  vec_norm_srcv1_vreg_3;              
wire    [4  :0]  vec_norm_srcv1_vreg_3_tmp;          
wire             vec_norm_srcv2_vld;                 
wire             vec_norm_srcvm_vld;                 
wire             vec_opfvf;                          
wire             vec_opfvv;                          
wire             vec_opivi;                          
wire             vec_opivv;                          
wire             vec_opivx;                          
wire             vec_opmvv;                          
wire             vec_opmvx;                          
wire    [16 :0]  vec_perm_dep_info;                  
wire    [177:0]  vec_perm_inst0_data;                
wire    [3  :0]  vec_perm_inst_vld;                  
wire             vec_perm_mtvr_sel;                  
wire             vec_perm_split_stall;               
wire    [1  :0]  vec_sew;                            
wire             vec_src_switch;                     
wire             vec_st;                             
wire    [31 :0]  vec_stride_add_inst;                
wire    [16 :0]  vec_stride_dep_info;                
wire             vec_stride_dst_v0;                  
wire             vec_stride_dstv0_ovlp;              
wire    [177:0]  vec_stride_inst0_data;              
wire    [177:0]  vec_stride_inst1_data;              
wire    [177:0]  vec_stride_inst2_data;              
wire    [177:0]  vec_stride_inst3_data;              
wire    [3  :0]  vec_stride_inst_vld;                
wire             vec_stride_sm_start;                
wire             vec_stride_split_clk;               
wire             vec_stride_split_clk_en;            
wire             vec_stride_split_last;              
wire             vec_stride_split_last_normal;       
wire             vec_stride_split_secd_to_last;      
wire             vec_stride_split_stall;             
wire             vec_stride_v0_begin;                
wire             vec_stride_v0_split_last;           
wire             vec_stride_vreg_begin;              
wire             vec_stride_vreg_end;                
wire             vec_type_cmp;                       
wire             vec_type_fcvt;                      
wire             vec_type_fcvt_narr;                 
wire             vec_type_fcvt_norm;                 
wire             vec_type_fcvt_wide;                 
wire             vec_type_fdiv;                      
wire             vec_type_fmac;                      
wire             vec_type_narr;                      
wire             vec_type_narr_0;                    
wire             vec_type_narr_1;                    
wire             vec_type_narr_2;                    
wire             vec_type_norm_0_2;                  
wire             vec_type_norm_0_3;                  
wire             vec_type_norm_0_4;                  
wire             vec_type_norm_0_5;                  
wire             vec_type_norm_0_7;                  
wire             vec_type_norm_0_9;                  
wire             vec_type_norm_0_a;                  
wire             vec_type_norm_0_b;                  
wire             vec_type_norm_1_0;                  
wire             vec_type_norm_1_1;                  
wire             vec_type_norm_1_2;                  
wire             vec_type_norm_1_3;                  
wire             vec_type_norm_2_1;                  
wire             vec_type_norm_2_2;                  
wire             vec_type_norm_2_3;                  
wire             vec_type_norm_2_4;                  
wire             vec_type_norm_2_5;                  
wire             vec_type_norm_2_6;                  
wire             vec_type_norm_2_7;                  
wire             vec_type_norm_2_9;                  
wire             vec_type_norm_2_a;                  
wire             vec_type_norm_2_b;                  
wire             vec_type_norm_2_c;                  
wire             vec_type_redu;                      
wire             vec_type_wide;                      
wire             vec_type_wide_0;                    
wire             vec_type_wide_1;                    
wire             vec_type_wide_2;                    
wire             vec_type_wide_3;                    
wire             vec_type_wide_4;                    
wire             vec_type_wide_5;                    
wire             vec_type_wide_6;                    
wire             vec_type_wide_7;                    
wire             vec_type_wide_8;                    
wire             vec_type_wide_9;                    
wire             vec_type_wide_narr;                 
wire             vec_wide_mac;                       
wire             vec_wide_mul;                       
wire             vec_wide_sat;                       
wire    [31 :0]  vfmvvf_inst;                        
wire             vperm_cur_idle;                     
wire             vperm_cur_mtvr;                     
wire    [6  :0]  vperm_inst1_not_vld;                
wire    [6  :0]  vperm_inst2_not_vld;                
wire    [4  :0]  vperm_inst3_not_vld;                
wire    [3  :0]  vperm_inst_split_last;              
wire    [1  :0]  vperm_require_mtvr;                 
wire             vperm_sm_start;                     
wire             vperm_split_clk_en;                 
wire             vperm_split_mtvr_vld;               
wire             vperm_split_stall;                  
wire    [2  :0]  vperm_srcv0_inc;                    
wire    [2  :0]  vperm_srcv0_inst0_count;            
wire    [2  :0]  vperm_srcv0_inst1_count;            
wire    [2  :0]  vperm_srcv0_inst2_count;            
wire    [2  :0]  vperm_srcv0_inst3_count;            
wire    [4  :0]  vperm_srcv1_reg;                    
wire             vpr_cnt_over;                       
wire             vpr_idle_inc;                       
wire    [3  :0]  vpr_inc_1;                          
wire    [3  :0]  vpr_inc_2;                          
wire             vrgather;                           
wire             vrgather_clk_en;                    
wire             vrgather_cur_idle;                  
wire    [31 :0]  vrgather_inst;                      
wire    [3  :0]  vrgather_inst0_fwd_inst;            
wire    [5  :0]  vrgather_inst0_split_num;           
wire    [4  :0]  vrgather_inst0_srcv0_reg;           
wire    [4  :0]  vrgather_inst0_vdst_offset;         
wire    [4  :0]  vrgather_inst0_vdst_reg;            
wire    [3  :0]  vrgather_inst1_fwd_inst;            
wire    [5  :0]  vrgather_inst1_split_num;           
wire    [4  :0]  vrgather_inst1_srcv0_reg;           
wire    [4  :0]  vrgather_inst1_vdst_offset;         
wire    [4  :0]  vrgather_inst1_vdst_reg;            
wire    [3  :0]  vrgather_inst2_fwd_inst;            
wire    [5  :0]  vrgather_inst2_split_num;           
wire    [4  :0]  vrgather_inst2_srcv0_reg;           
wire    [4  :0]  vrgather_inst2_vdst_offset;         
wire    [4  :0]  vrgather_inst2_vdst_reg;            
wire    [3  :0]  vrgather_inst3_fwd_inst;            
wire    [5  :0]  vrgather_inst3_split_num;           
wire    [4  :0]  vrgather_inst3_srcv0_reg;           
wire    [4  :0]  vrgather_inst3_vdst_offset;         
wire    [4  :0]  vrgather_inst3_vdst_reg;            
wire    [31 :0]  vrgather_inst_0;                    
wire    [31 :0]  vrgather_inst_1;                    
wire    [4  :0]  vrgather_inst_srcv1_reg;            
wire    [3  :0]  vrgather_inst_srcv1_tmp;            
wire    [3  :0]  vrgather_inst_vdst_tmp;             
wire             vrgather_split_clk;                 
wire             vrgather_split_stall;               
wire    [4  :0]  vrgather_srcv0_base;                
wire    [19 :0]  vrgather_srcv0_offset;              
wire             vrgather_start;                     
wire    [19 :0]  vrgather_vdst_offset;               
wire             vrgather_xi;                        
wire             vslide1_stride;                     
wire             vslide_clk_en;                      
wire             vslide_cur_idle;                    
wire    [3  :0]  vslide_inst0_srcv1_tmp;             
wire    [1  :0]  vslide_inst1_srcv1_tmp;             
wire             vslide_inst2_srcv1_tmp;             
wire    [1  :0]  vslide_inst3_srcv1_tmp;             
wire             vslide_one_start;                   
wire             vslide_split_clk;                   
wire             vslide_split_stall;                 
wire    [4  :0]  vslide_srcv0_base;                  
wire    [11 :0]  vslide_srcv0_offset;                
wire    [11 :0]  vslide_srcv1_offset;                
wire    [11 :0]  vslide_srcv1_slidedown_offset;      
wire    [11 :0]  vslide_srcv1_slideup_offset;        
wire             vslidedown;                         
wire             vslideup;                           
wire    [1  :0]  widden_split_inst0_vlmul;           
wire    [2  :0]  widden_split_inst0_vsew;            
wire    [1  :0]  widden_split_inst1_vlmul;           
wire    [2  :0]  widden_split_inst1_vsew;            
wire    [1  :0]  widden_split_inst2_vlmul;           
wire    [2  :0]  widden_split_inst2_vsew;            
wire    [1  :0]  widden_split_inst3_vlmul;           
wire    [2  :0]  widden_split_inst3_vsew;            
wire             widden_split_inst_vld;              
wire             x_vfunary0_vld_narr;                
wire             x_vfunary0_vld_norm;                
wire             x_vfunary0_vld_wide;                
wire    [3  :0]  zvlsseg_index_add_iid_plus;         
wire    [31 :0]  zvlsseg_index_add_inst;             
wire    [16 :0]  zvlsseg_index_dep_info;             
wire    [31 :0]  zvlsseg_index_ext_inst;             
wire    [177:0]  zvlsseg_index_inst0_data;           
wire    [177:0]  zvlsseg_index_inst1_data;           
wire    [177:0]  zvlsseg_index_inst2_data;           
wire    [177:0]  zvlsseg_index_inst3_data;           
wire    [3  :0]  zvlsseg_index_inst_vld;             
wire             zvlsseg_index_nf_first;             
wire             zvlsseg_index_nf_last;              
wire             zvlsseg_index_sm_start;             
wire             zvlsseg_index_split_clk;            
wire             zvlsseg_index_split_clk_en;         
wire    [5  :0]  zvlsseg_index_split_dstv_reg0;      
wire    [5  :0]  zvlsseg_index_split_dstv_reg1;      
wire             zvlsseg_index_split_last;           
wire             zvlsseg_index_split_stall;          
wire             zvlsseg_index_vreg_end;             
wire    [31 :0]  zvlsseg_stride_add_inst;            
wire    [3  :0]  zvlsseg_stride_add_interval;        
wire    [16 :0]  zvlsseg_stride_dep_info;            
wire    [177:0]  zvlsseg_stride_inst0_data;          
wire    [177:0]  zvlsseg_stride_inst1_data;          
wire    [177:0]  zvlsseg_stride_inst2_data;          
wire    [177:0]  zvlsseg_stride_inst3_data;          
wire    [3  :0]  zvlsseg_stride_inst_vld;            
wire    [1  :0]  zvlsseg_stride_nf_cycle;            
wire             zvlsseg_stride_nf_last;             
wire             zvlsseg_stride_sm_start;            
wire             zvlsseg_stride_split_clk;           
wire             zvlsseg_stride_split_clk_en;        
wire    [5  :0]  zvlsseg_stride_split_dstv_reg0;     
wire    [5  :0]  zvlsseg_stride_split_dstv_reg1;     
wire             zvlsseg_stride_split_last;          
wire             zvlsseg_stride_split_secd_to_last;  
wire             zvlsseg_stride_split_stall;         
wire    [31 :0]  zvlsseg_stride_vmv_inst;            
wire             zvlsseg_stride_vreg_end;            
wire             zvlsseg_stride_vreg_secd_to_end;    
wire    [16 :0]  zvlsseg_unit_dep_info;              
wire    [177:0]  zvlsseg_unit_inst0_data;            
wire    [177:0]  zvlsseg_unit_inst1_data;            
wire    [177:0]  zvlsseg_unit_inst2_data;            
wire    [177:0]  zvlsseg_unit_inst3_data;            
wire    [3  :0]  zvlsseg_unit_inst_vld;              
wire             zvlsseg_unit_nf_last;               
wire    [6  :0]  zvlsseg_unit_nf_offset_cnt1;        
wire             zvlsseg_unit_sm_start;              
wire             zvlsseg_unit_split_clk;             
wire             zvlsseg_unit_split_clk_en;          
wire    [5  :0]  zvlsseg_unit_split_dstv_reg0;       
wire    [5  :0]  zvlsseg_unit_split_dstv_reg1;       
wire    [177:0]  zvlsseg_unit_split_inst3_data;      
wire             zvlsseg_unit_split_last;            
wire             zvlsseg_unit_split_stall;           
wire    [31 :0]  zvlsseg_unit_vmv_inst;              
wire             zvlsseg_unit_vreg_end;              



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                 IR data path parameters
//----------------------------------------------------------
parameter IR_WIDTH            = 178;

parameter IR_VL_PRED          = 177;
parameter IR_VL               = 176;
parameter IR_VMB              = 168;
parameter IR_PC               = 167;
parameter IR_VSEW             = 152;
parameter IR_VLMUL            = 149;
parameter IR_FMLA             = 147;
parameter IR_SPLIT_NUM        = 146;
parameter IR_NO_SPEC          = 139;
parameter IR_MLA              = 138;
parameter IR_DST_X0           = 137;
parameter IR_ILLEGAL          = 136;
parameter IR_SPLIT_LAST       = 135;
parameter IR_VMLA             = 134;
parameter IR_IID_PLUS         = 133;
parameter IR_BKPTB_INST       = 129;
parameter IR_BKPTA_INST       = 128;
parameter IR_FMOV             = 127;
parameter IR_MOV              = 126;
parameter IR_EXPT             = 125;
parameter IR_LENGTH           = 118;
parameter IR_INTMASK          = 117;
parameter IR_SPLIT            = 116;
parameter IR_INST_TYPE        = 115;
parameter IR_DSTV_REG         = 105;
parameter IR_DSTV_VLD         = 99;
parameter IR_SRCVM_VLD        = 98;
parameter IR_SRCV2_VLD        = 97;
parameter IR_SRCV1_REG        = 96;
parameter IR_SRCV1_VLD        = 90;
parameter IR_SRCV0_REG        = 89;
parameter IR_SRCV0_VLD        = 83;
parameter IR_DSTE_VLD         = 82;
parameter IR_DSTF_REG         = 81;
parameter IR_DSTF_VLD         = 75;
parameter IR_SRCF2_REG        = 74;
parameter IR_SRCF2_VLD        = 68;
parameter IR_SRCF1_REG        = 67;
parameter IR_SRCF1_VLD        = 61;
parameter IR_SRCF0_REG        = 60;
parameter IR_SRCF0_VLD        = 54;
parameter IR_DST_REG          = 53;
parameter IR_DST_VLD          = 47;
parameter IR_SRC2_VLD         = 46;
parameter IR_SRC1_REG         = 45;
parameter IR_SRC1_VLD         = 39;
parameter IR_SRC0_REG         = 38;
parameter IR_SRC0_VLD         = 32;
parameter IR_OPCODE           = 31;

//----------------------------------------------------------
//                   Type parameters
//----------------------------------------------------------
parameter DEP_WIDTH             = 17;

parameter DEP_INST01_SRC0_MASK  = 0;
parameter DEP_INST01_SRC1_MASK  = 1;
parameter DEP_INST12_SRC0_MASK  = 2;
parameter DEP_INST12_SRC1_MASK  = 3;
parameter DEP_INST23_SRC0_MASK  = 4;
parameter DEP_INST23_SRC1_MASK  = 5;
parameter DEP_INST02_PREG_MASK  = 6;
parameter DEP_INST13_PREG_MASK  = 7;
parameter DEP_INST01_VREG_MASK  = 8;
parameter DEP_INST12_VREG_MASK  = 9;
parameter DEP_INST23_VREG_MASK  = 10;
parameter DEP_INST13_VREG_MASK  = 11;
parameter DEP_INST02_VREG_MASK  = 12;
parameter DEP_INST03_VREG_MASK  = 13;
parameter DEP_INST01_SRCV1_MASK = 14;
parameter DEP_INST12_SRCV1_MASK = 15;
parameter DEP_INST23_SRCV1_MASK = 16;

//----------------------------------------------------------
//                   Type parameters
//----------------------------------------------------------
parameter ALU      = 10'b0000000001;
parameter BJU      = 10'b0000000010;
parameter MULT     = 10'b0000000100;
parameter DIV      = 10'b0000001000;
parameter LSU_P5   = 10'b0000110000;
parameter LSU      = 10'b0000010000;
parameter PIPE67   = 10'b0001000000;
parameter PIPE6    = 10'b0010000000;
parameter PIPE7    = 10'b0100000000;
parameter SPECIAL  = 10'b1000000000;

//==========================================================
//                 Atomic (amo) instructions
//==========================================================
parameter AMO_IDLE  = 1'b0;
parameter AMO_SPLIT = 1'b1;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign split_clk_en = ctrl_split_long_id_inst_vld
                      && (dp_split_long_type[0])
                      || (amo_cur_state != AMO_IDLE);
// &Instance("gated_clk_cell", "x_split_gated_clk"); @137
gated_clk_cell  x_split_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (split_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (split_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @138
//          .external_en (1'b0), @139
//          .global_en   (cp0_yy_clk_en), @140
//          .module_en   (cp0_idu_icg_en), @141
//          .local_en    (split_clk_en), @142
//          .clk_out     (split_clk)); @143

//----------------------------------------------------------
//           amo split variables initial value
//----------------------------------------------------------
assign amo_sm_start       = ctrl_split_long_id_inst_vld
                            && dp_split_long_type[0]
                            && !ctrl_split_long_id_stall
                            && amo_more_than_4;

assign amo_inst           = {dp_split_long_inst[14:13],dp_split_long_inst[6:0]}
                            ==  9'b01_0101111;
assign amo_word           = !dp_split_long_inst[12];
assign amo_aq             = dp_split_long_inst[26];
assign amo_rl             = dp_split_long_inst[25];

assign lr_inst            = amo_inst
                            &&  (dp_split_long_inst[31:27]
                                ==  5'b00010);
assign sc_inst            = amo_inst
                            &&  (dp_split_long_inst[31:27]
                                ==  5'b00011);

assign amo_swap           = dp_split_long_inst[31:27] ==  5'b00001;
assign amo_add            = dp_split_long_inst[31:27] ==  5'b00000;
assign amo_xor            = dp_split_long_inst[31:27] ==  5'b00100;
assign amo_and            = dp_split_long_inst[31:27] ==  5'b01100;
assign amo_or             = dp_split_long_inst[31:27] ==  5'b01000;
assign amo_min            = dp_split_long_inst[31:27] ==  5'b10000;
assign amo_minu           = dp_split_long_inst[31:27] ==  5'b11000;
assign amo_max            = dp_split_long_inst[31:27] ==  5'b10100;
assign amo_maxu           = dp_split_long_inst[31:27] ==  5'b11100;

assign amo_split_inst     = amo_inst
                            &&  (amo_swap
                                ||  amo_add
                                ||  amo_xor
                                ||  amo_and
                                ||  amo_or
                                ||  amo_min
                                ||  amo_minu
                                ||  amo_max
                                ||  amo_maxu);

assign amo_rs1[4:0]       = dp_split_long_inst[19:15];
assign amo_rs2[4:0]       = dp_split_long_inst[24:20];
assign amo_rd[4:0]        = dp_split_long_inst[11:7];
assign amo_rd_is_x0       = amo_rd[4:0] == 5'b0;
assign amo_more_than_4    = amo_split_inst
                            &&  amo_aq
                            &&  amo_rl;

//----------------------------------------------------------
//              FSM of inst amo ctrl logic
//----------------------------------------------------------
// State Description:
// AMO_IDLE  : id stage instruction 0 is not multi load store
//            (amo) or the first cycle to start amo FSM
// AMO_SPLIT : the amo instruction is spliting

always @(posedge split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    amo_cur_state <= AMO_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    amo_cur_state <= AMO_IDLE;
  else
    amo_cur_state <= amo_next_state;
end

// &CombBeg; @213
always @( amo_sm_start
       or ctrl_split_long_id_stall
       or amo_cur_state)
begin
  case(amo_cur_state)
  AMO_IDLE  : if(amo_sm_start)
                amo_next_state = AMO_SPLIT;
              else
                amo_next_state = AMO_IDLE;
  AMO_SPLIT : if(!ctrl_split_long_id_stall)
                amo_next_state = AMO_IDLE;
              else
                amo_next_state = AMO_SPLIT;
  default   :   amo_next_state = AMO_IDLE;
  endcase
// &CombEnd; @225
end

//----------------------------------------------------------
//                     Contrl Signals
//----------------------------------------------------------
assign amo_inst_vld[0]  = 1'b1;
assign amo_inst_vld[1]  = (amo_cur_state  == AMO_IDLE)
                          &&  (amo_aq ||  amo_rl  ||  amo_split_inst);
assign amo_inst_vld[2]  = (amo_cur_state  == AMO_IDLE)
                          &&  (amo_aq &&  amo_rl
                              ||  amo_split_inst);
assign amo_inst_vld[3]  = (amo_cur_state  == AMO_IDLE)
                          &&  (amo_aq ||  amo_rl)
                          &&  amo_split_inst;

//----------------------------------------------------------
//                  Split Instruction fence
//----------------------------------------------------------
//split inst 0: fence iorw,iorw
assign amo_fence_rl_inst_opcode[31:20]                = 12'b0000_1111_1111;
assign amo_fence_rl_inst_opcode[19:12]                = 8'b00000_000;
assign amo_fence_rl_inst_opcode[11:7]                 = 5'b00000;
assign amo_fence_rl_inst_opcode[6:0]                  = 7'b0001111;

// &CombBeg; @249
always @( amo_fence_rl_inst_opcode[31:0])
begin
  amo_fence_rl_inst_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  amo_fence_rl_inst_data[IR_OPCODE:IR_OPCODE-31]      = amo_fence_rl_inst_opcode[31:0];
  amo_fence_rl_inst_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  amo_fence_rl_inst_data[IR_SPLIT]                    = 1'b1;
  amo_fence_rl_inst_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @257
end

//split inst last: fence iorw,iorw
assign amo_fence_aq_inst_opcode[31:20]                = 12'b0000_1111_1111;
assign amo_fence_aq_inst_opcode[19:12]                = 8'b00000_000;
assign amo_fence_aq_inst_opcode[11:7]                 = 5'b00000;
assign amo_fence_aq_inst_opcode[6:0]                  = 7'b0001111;

// &CombBeg; @265
always @( amo_fence_aq_inst_opcode[31:0])
begin
  amo_fence_aq_inst_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  amo_fence_aq_inst_data[IR_OPCODE:IR_OPCODE-31]      = amo_fence_aq_inst_opcode[31:0];
  amo_fence_aq_inst_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  amo_fence_aq_inst_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @272
end

//----------------------------------------------------------
//                  Split Instruction lr
//----------------------------------------------------------
//split inst 0: lr
// &CombBeg; @278
always @( amo_rs1[4:0]
       or amo_aq
       or amo_rd[4:0]
       or dp_split_long_inst[31:0])
begin
  amo_lr_inst_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  amo_lr_inst_data[IR_OPCODE:IR_OPCODE-31]      = dp_split_long_inst[31:0];
  amo_lr_inst_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  amo_lr_inst_data[IR_SRC0_VLD]                 = 1'b1;
  amo_lr_inst_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,amo_rs1[4:0]};
  amo_lr_inst_data[IR_DST_VLD]                  = 1'b1;
  amo_lr_inst_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,amo_rd[4:0]};
  amo_lr_inst_data[IR_SPLIT]                    = amo_aq;
  amo_lr_inst_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @290
end

//----------------------------------------------------------
//                  Split Instruction sc
//----------------------------------------------------------
//split inst 0: sc
// &CombBeg; @296
always @( amo_rs1[4:0]
       or amo_aq
       or amo_rs2[4:0]
       or amo_rd[4:0]
       or dp_split_long_inst[31:0])
begin
  amo_sc_inst_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  amo_sc_inst_data[IR_OPCODE:IR_OPCODE-31]      = dp_split_long_inst[31:0];
  amo_sc_inst_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU_P5;
  amo_sc_inst_data[IR_SRC0_VLD]                 = 1'b1;
  amo_sc_inst_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,amo_rs1[4:0]};
  amo_sc_inst_data[IR_SRC1_VLD]                 = 1'b1;
  amo_sc_inst_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,amo_rs2[4:0]};
  amo_sc_inst_data[IR_DST_VLD]                  = 1'b1;
  amo_sc_inst_data[IR_DST_REG:IR_DST_REG-5]     = {1'b0,amo_rd[4:0]};
  amo_sc_inst_data[IR_SPLIT]                    = amo_aq;
  amo_sc_inst_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @310
end

//----------------------------------------------------------
//                  Split Instruction amoload
//----------------------------------------------------------
// &CombBeg; @315
always @( amo_rs1[4:0]
       or amo_rs2[4:0]
       or amo_rd_is_x0
       or amo_rd[4:0]
       or dp_split_long_inst[31:0])
begin
  amo_amoload_inst_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  amo_amoload_inst_data[IR_OPCODE:IR_OPCODE-31]      = dp_split_long_inst[31:0];
  amo_amoload_inst_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU;
  amo_amoload_inst_data[IR_SRC0_VLD]                 = 1'b1;
  amo_amoload_inst_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,amo_rs1[4:0]};
  amo_amoload_inst_data[IR_SRC1_VLD]                 = 1'b1;
  amo_amoload_inst_data[IR_SRC1_REG:IR_SRC1_REG-5]   = {1'b0,amo_rs2[4:0]};
  amo_amoload_inst_data[IR_DST_VLD]                  = 1'b1;
  amo_amoload_inst_data[IR_DST_REG:IR_DST_REG-5]     = amo_rd_is_x0
                                                       ? 6'd32 : {1'b0,amo_rd[4:0]};
  amo_amoload_inst_data[IR_SPLIT]                    = 1'b1;
  amo_amoload_inst_data[IR_LENGTH]                   = 1'b1;
  amo_amoload_inst_data[IR_IID_PLUS:IR_IID_PLUS-3]   = 4'd2;
  end
// &CombEnd; @331
end

//----------------------------------------------------------
//                  Split Instruction amostore
//----------------------------------------------------------
//split inst 0: amostore
// &CombBeg; @337
always @( amo_rs1[4:0]
       or amo_aq
       or dp_split_long_inst[31:0])
begin
  amo_amostore_inst_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  amo_amostore_inst_data[IR_OPCODE:IR_OPCODE-31]      = dp_split_long_inst[31:0];
  amo_amostore_inst_data[IR_INST_TYPE:IR_INST_TYPE-9] = LSU_P5;
  amo_amostore_inst_data[IR_SRC0_VLD]                 = 1'b1;
  amo_amostore_inst_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,amo_rs1[4:0]};
  amo_amostore_inst_data[IR_SRC1_VLD]                 = 1'b1;
  amo_amostore_inst_data[IR_SRC1_REG:IR_SRC1_REG-5]   = 6'd32;
  amo_amostore_inst_data[IR_SPLIT]                    = amo_aq;
  amo_amostore_inst_data[IR_LENGTH]                   = 1'b1;
  end
// &CombEnd; @349
end

//----------------------------------------------------------
//                  Split Instruction amoalu
//----------------------------------------------------------
//split inst 0: lr
assign amo_amoalu_inst_op[31:25]      =   {7{amo_swap}} & 7'b0000000      //addi
                                        | {7{amo_add}}  & 7'b0000000      //add
                                        | {7{amo_xor}}  & 7'b0000000      //xor
                                        | {7{amo_and}}  & 7'b0000000      //and
                                        | {7{amo_or}}   & 7'b0000000      //or
                                        | {7{amo_min}}  & 7'b0100000      //min
                                        | {7{amo_minu}} & 7'b0100000      //minu
                                        | {7{amo_max}}  & 7'b0110000      //max
                                        | {7{amo_maxu}} & 7'b0110000;     //maxu
assign amo_amoalu_inst_op[24:20]      = 5'b0;
assign amo_amoalu_inst_op[19:15]      = 5'b0;
assign amo_amoalu_inst_op[14:12]      =   {3{amo_swap}} & 3'b000      //addi
                                        | {3{amo_add}}  & 3'b000      //add
                                        | {3{amo_xor}}  & 3'b100      //xor
                                        | {3{amo_and}}  & 3'b111      //and
                                        | {3{amo_or}}   & 3'b110      //or
                                        | {3{amo_min}}  & 3'b010      //min
                                        | {3{amo_minu}} & 3'b011      //minu
                                        | {3{amo_max}}  & 3'b010      //max
                                        | {3{amo_maxu}} & 3'b011;     //maxu

assign amo_amoalu_inst_op[11:7]       = 5'b0;
assign amo_amoalu_inst_op[6:4]        =   {3{amo_swap}} & 3'b001      //addi
                                        | {3{amo_add}}  & 3'b011      //add
                                        | {3{amo_xor}}  & 3'b011      //xor
                                        | {3{amo_and}}  & 3'b011      //and
                                        | {3{amo_or}}   & 3'b011      //or
                                        | {3{amo_min}}  & 3'b011      //min
                                        | {3{amo_minu}} & 3'b011      //minu
                                        | {3{amo_max}}  & 3'b011      //max
                                        | {3{amo_maxu}} & 3'b011;     //maxu

assign amo_amoalu_inst_op[3]          =     amo_swap  &&  1'b0
                                        ||  amo_add   &&  amo_word
                                        ||  amo_xor   &&  1'b0
                                        ||  amo_and   &&  1'b0
                                        ||  amo_or    &&  1'b0
                                        ||  amo_min   &&  amo_word
                                        ||  amo_minu  &&  amo_word
                                        ||  amo_max   &&  amo_word
                                        ||  amo_maxu  &&  amo_word;

assign amo_amoalu_inst_op[2:0]        = 3'b011;

// &CombBeg; @399
always @( amo_rs2[4:0]
       or amo_rd_is_x0
       or amo_rd[4:0]
       or amo_swap
       or amo_amoalu_inst_op[31:0])
begin
  amo_amoalu_inst_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  amo_amoalu_inst_data[IR_OPCODE:IR_OPCODE-31]      = amo_amoalu_inst_op[31:0];
  amo_amoalu_inst_data[IR_INST_TYPE:IR_INST_TYPE-9] = ALU;
  amo_amoalu_inst_data[IR_SRC0_VLD]                 = 1'b1;
  amo_amoalu_inst_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,amo_rs2[4:0]};
  amo_amoalu_inst_data[IR_SRC1_VLD]                 = !amo_swap;
  amo_amoalu_inst_data[IR_SRC1_REG:IR_SRC1_REG-5]   = amo_rd_is_x0
                                                      ? 6'd32 : {1'b0,amo_rd[4:0]};
  amo_amoalu_inst_data[IR_DST_VLD]                  = 1'b1;
  amo_amoalu_inst_data[IR_DST_REG:IR_DST_REG-5]     = 6'd32;
  amo_amoalu_inst_data[IR_SPLIT]                    = 1'b1;
  amo_amoalu_inst_data[IR_LENGTH]                   = 1'b1;
  amo_amoalu_inst_data[IR_IID_PLUS:IR_IID_PLUS-3]   = 4'd1;
  end
// &CombEnd; @415
end

//----------------------------------------------------------
//                 Split Instruction Data
//----------------------------------------------------------
assign amo_split_stall  = (amo_cur_state  ==  AMO_IDLE)
                          &&  amo_split_inst
                          &&  amo_aq
                          &&  amo_rl;

//dep info
assign amo_lr_or_sc = lr_inst  ||  sc_inst;
//avoid empty sensitive list
assign amo_dep_info_bit = 1'b1;

// &CombBeg; @430
always @( amo_dep_info_bit)
begin
  amo_012_dep_info[DEP_WIDTH-1:0]        = {DEP_WIDTH{1'b0}};
  if(1'b1) begin
  amo_012_dep_info[DEP_INST01_SRC0_MASK] = amo_dep_info_bit;
  amo_012_dep_info[DEP_INST12_SRC0_MASK] = amo_dep_info_bit;
  amo_012_dep_info[DEP_INST02_PREG_MASK] = amo_dep_info_bit;
  end
// &CombEnd; @437
end

// &CombBeg; @439
always @( amo_dep_info_bit)
begin
  amo_123_dep_info[DEP_WIDTH-1:0]        = {DEP_WIDTH{1'b0}};
  if(1'b1) begin
  amo_123_dep_info[DEP_INST12_SRC0_MASK] = amo_dep_info_bit;
  amo_123_dep_info[DEP_INST23_SRC0_MASK] = amo_dep_info_bit;
  amo_123_dep_info[DEP_INST13_PREG_MASK] = amo_dep_info_bit;
  end
// &CombEnd; @446
end

// &CombBeg; @448
always @( amo_123_dep_info[16:0]
       or amo_012_dep_info[16:0]
       or amo_lr_or_sc
       or amo_rl)
begin
casez({amo_lr_or_sc,amo_rl})
  2'b1?:amo_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};
  2'b00:amo_dep_info[DEP_WIDTH-1:0] = amo_012_dep_info[DEP_WIDTH-1:0];
  2'b01:amo_dep_info[DEP_WIDTH-1:0] = amo_123_dep_info[DEP_WIDTH-1:0];
  default:amo_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{{1{1'bx}}}};
endcase
// &CombEnd; @455
end

//----------------------------------------------------------
//              Pipedown Instrction Selection
//----------------------------------------------------------
// &CombBeg; @460
always @( amo_amostore_inst_data[177:0]
       or amo_aq
       or amo_amoload_inst_data[177:0]
       or lr_inst
       or amo_lr_inst_data[177:0]
       or amo_cur_state
       or sc_inst
       or amo_sc_inst_data[177:0]
       or amo_fence_aq_inst_data[177:0]
       or amo_fence_rl_inst_data[177:0]
       or amo_amoalu_inst_data[177:0]
       or amo_rl)
begin
casez({amo_cur_state,amo_aq,amo_rl,lr_inst,sc_inst})
  {AMO_SPLIT,1'b?,1'b?,1'b?,1'b?}://aq and rl split 2nd
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_fence_aq_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst2_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b?,1'b1,1'b0,1'b0}://aq and rl split 1st,rl split
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_fence_rl_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_amoload_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = amo_amoalu_inst_data[IR_WIDTH-1:0];
    amo_inst3_data[IR_WIDTH-1:0]  = amo_amostore_inst_data[IR_WIDTH-1:0];
  end
  {AMO_IDLE,1'b1,1'b0,1'b0,1'b0}://aq split
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_amoload_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_amoalu_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = amo_amostore_inst_data[IR_WIDTH-1:0];
    amo_inst3_data[IR_WIDTH-1:0]  = amo_fence_aq_inst_data[IR_WIDTH-1:0];
  end
  {AMO_IDLE,1'b0,1'b0,1'b0,1'b0}://only split
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_amoload_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_amoalu_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = amo_amostore_inst_data[IR_WIDTH-1:0];
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b1,1'b1,1'b1,1'b0}://aq rl lr
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_fence_rl_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_lr_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = amo_fence_aq_inst_data[IR_WIDTH-1:0];
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b1,1'b0,1'b1,1'b0}://aq lr
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_lr_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_fence_aq_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b0,1'b1,1'b1,1'b0}://rl lr
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_fence_rl_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_lr_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b0,1'b0,1'b1,1'b0}://lr
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_lr_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst2_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b1,1'b1,1'b0,1'b1}://aq rl sc
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_fence_rl_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_sc_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = amo_fence_aq_inst_data[IR_WIDTH-1:0];
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b1,1'b0,1'b0,1'b1}://aq sc
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_sc_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_fence_aq_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b0,1'b1,1'b0,1'b1}://rl sc
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_fence_rl_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = amo_sc_inst_data[IR_WIDTH-1:0];
    amo_inst2_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  {AMO_IDLE,1'b0,1'b0,1'b0,1'b1}://sc
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = amo_sc_inst_data[IR_WIDTH-1:0];
    amo_inst1_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst2_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{1'b0}};
  end
  default:
  begin
    amo_inst0_data[IR_WIDTH-1:0]  = {IR_WIDTH{{1{1'bx}}}};
    amo_inst1_data[IR_WIDTH-1:0]  = {IR_WIDTH{{1{1'bx}}}};
    amo_inst2_data[IR_WIDTH-1:0]  = {IR_WIDTH{{1{1'bx}}}};
    amo_inst3_data[IR_WIDTH-1:0]  = {IR_WIDTH{{1{1'bx}}}};
  end
endcase
// &CombEnd; @554
end


////========================================================
//// YES, IT IS PERMUTATION. -> Mainly for vrgather, vcompress, vslide
////========================================================
assign funct6[5:0] = vec_inst[31:26];

assign vslidedown = funct6[5:0] == 6'b001111;
assign vslideup   = funct6[5:0] == 6'b001110;

assign vslide1_stride = (vslideup || vslidedown) && vec_opmvx;

assign vcompress = (funct6[5:0] == 6'b010111) && vec_opmvv;
assign vrgather = funct6[5:0] == 6'b001100;

assign vec_gpr_vld = vec_opivx || vec_opmvx;
assign vec_imm_vld = vec_opivi;

assign vrgather_xi = vrgather && (vec_gpr_vld || vec_imm_vld);

assign perm_mtvr_inst_op[31:26]  = 6'b001101;//vslide1_stride ? 6'b010111 : 6'b001101; //vmv.s.x
assign perm_mtvr_inst_op[25]     = 1'b1;  //always unmask inst
assign perm_mtvr_inst_op[24:20]  = 5'b0;
assign perm_mtvr_inst_op[19:15]  = vec_inst[19:15];
assign perm_mtvr_inst_op[14:12]  = 3'b110;   //vslide1_stride ? 3'b100 : 3'b110;
assign perm_mtvr_inst_op[11: 7]  = 5'b0;
assign perm_mtvr_inst_op[6 : 0]  = 7'b1010111;

// &CombBeg; @583
always @( perm_mtvr_inst_op[31:0]
       or vec_perm_mtvr_fwd_inst[3:0]
       or vec_inst[19:15])
begin
  vec_perm_mtvr_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_perm_mtvr_data[IR_INST_TYPE:IR_INST_TYPE-9] = ALU;
  vec_perm_mtvr_data[IR_OPCODE:IR_OPCODE-31]      = perm_mtvr_inst_op[31:0];
  vec_perm_mtvr_data[IR_SRC0_VLD]                 = 1'b1;
  vec_perm_mtvr_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,vec_inst[19:15]};
  vec_perm_mtvr_data[IR_DSTV_VLD]                 = 1'b1;
  vec_perm_mtvr_data[IR_DSTV_REG:IR_DSTV_REG-5]   = 6'b100000;
  vec_perm_mtvr_data[IR_INTMASK]                  = 1'b1;
  vec_perm_mtvr_data[IR_SPLIT]                    = 1'b1;
  vec_perm_mtvr_data[IR_LENGTH]                   = 1'b1;
  vec_perm_mtvr_data[IR_IID_PLUS:IR_IID_PLUS-3]   = vec_perm_mtvr_fwd_inst[3:0];
  end
// &CombEnd; @597
end

// &CombBeg; @599
always @( vrgather_mtvr_fwd_inst[3:0]
       or vslide1_stride
       or vrgather_xi
       or vperm_mtvr_fwd_inst[3:0]
       or vslide_mtvr_fwd_inst[3:0])
begin
case({vslide1_stride,vrgather_xi})
  2'b10: vec_perm_mtvr_fwd_inst[3:0] = vslide_mtvr_fwd_inst[3:0];
  2'b01: vec_perm_mtvr_fwd_inst[3:0] = vrgather_mtvr_fwd_inst[3:0];
default: vec_perm_mtvr_fwd_inst[3:0] = vperm_mtvr_fwd_inst[3:0];
endcase
// &CombEnd; @605
end

// &CombBeg; @607
always @( vslide1_stride
       or vrgather_xi
       or vslide_inst_vld[3:0]
       or vrgather_inst_vld[3:0]
       or vperm_inst_vld[3:0])
begin
case({vslide1_stride,vrgather_xi})
  2'b10: vec_perm_inst_vld_tmp[3:0] = vslide_inst_vld[3:0];
  2'b01: vec_perm_inst_vld_tmp[3:0] = vrgather_inst_vld[3:0];
default: vec_perm_inst_vld_tmp[3:0] = vperm_inst_vld[3:0];
endcase
// &CombEnd; @613
end

assign vec_perm_mtvr_sel = (vperm_cur_idle && vslide_cur_idle && vrgather_cur_idle)
                         && vec_gpr_vld || vperm_cur_mtvr;

assign vec_perm_inst_vld[3:0] = vec_perm_mtvr_sel ? 4'b0001:vec_perm_inst_vld_tmp[3:0];

assign vec_perm_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};

// &CombBeg; @622
always @( vslide1_stride
       or vrgather_inst0_data[177:0]
       or vrgather_xi
       or vperm_inst0_data[177:0]
       or vslide_inst0_data[177:0])
begin
case({vslide1_stride,vrgather_xi})
  2'b10: vec_perm_inst0_data_tmp[IR_WIDTH-1:0] = vslide_inst0_data[IR_WIDTH-1:0];
  2'b01: vec_perm_inst0_data_tmp[IR_WIDTH-1:0] = vrgather_inst0_data[IR_WIDTH-1:0];
default: vec_perm_inst0_data_tmp[IR_WIDTH-1:0] = vperm_inst0_data[IR_WIDTH-1:0];
endcase
// &CombEnd; @628
end

assign vperm_split_mtvr_vld = dp_split_long_type[2] && vec_perm_mtvr_sel;

assign vec_perm_inst0_data[IR_WIDTH-1:0] = vec_perm_mtvr_sel 
                                         ? vec_perm_mtvr_data[IR_WIDTH-1:0]
                                         : vec_perm_inst0_data_tmp[IR_WIDTH-1:0];
// &CombBeg; @635
always @( vrgather_inst1_data[177:0]
       or vperm_inst1_data[177:0]
       or vslide1_stride
       or vrgather_xi
       or vslide_inst1_data[177:0])
begin
case({vslide1_stride,vrgather_xi})
  2'b10: vec_perm_inst1_data[IR_WIDTH-1:0] = vslide_inst1_data[IR_WIDTH-1:0];
  2'b01: vec_perm_inst1_data[IR_WIDTH-1:0] = vrgather_inst1_data[IR_WIDTH-1:0];
default: vec_perm_inst1_data[IR_WIDTH-1:0] = vperm_inst1_data[IR_WIDTH-1:0];
endcase
// &CombEnd; @641
end

// &CombBeg; @643
always @( vslide1_stride
       or vrgather_xi
       or vslide_inst2_data[177:0]
       or vrgather_inst2_data[177:0]
       or vperm_inst2_data[177:0])
begin
case({vslide1_stride,vrgather_xi})
  2'b10: vec_perm_inst2_data[IR_WIDTH-1:0] = vslide_inst2_data[IR_WIDTH-1:0];
  2'b01: vec_perm_inst2_data[IR_WIDTH-1:0] = vrgather_inst2_data[IR_WIDTH-1:0];
default: vec_perm_inst2_data[IR_WIDTH-1:0] = vperm_inst2_data[IR_WIDTH-1:0];
endcase
// &CombEnd; @649
end

// &CombBeg; @651
always @( vrgather_inst3_data[177:0]
       or vslide1_stride
       or vslide_inst3_data[177:0]
       or vrgather_xi
       or vperm_inst3_data[177:0])
begin
case({vslide1_stride,vrgather_xi})
  2'b10: vec_perm_inst3_data[IR_WIDTH-1:0] = vslide_inst3_data[IR_WIDTH-1:0];
  2'b01: vec_perm_inst3_data[IR_WIDTH-1:0] = vrgather_inst3_data[IR_WIDTH-1:0];
default: vec_perm_inst3_data[IR_WIDTH-1:0] = vperm_inst3_data[IR_WIDTH-1:0];
endcase
// &CombEnd; @657
end

assign vec_perm_split_stall = vslide_split_stall || vrgather_split_stall || vperm_split_stall;

//================================================================
//  SPLIT FSM FOR VRGATHER.VV VSLIDEUP/VSLIDEDOWN VCOMPRESS
//================================================================
parameter VPERM_IDLE = 2'b00; 
parameter VPERM_GMV  = 2'b01;
parameter VPERM_VPR  = 2'b10;

assign vperm_split_clk_en = ctrl_split_long_id_inst_vld 
                         && (dp_split_long_type[2]) && !vslide1_stride && !vrgather_xi
                         || (vperm_cur_state[1:0]!=VPERM_IDLE);

assign vperm_sm_start = ctrl_split_long_id_inst_vld 
                     && (dp_split_long_type[2]) && !vslide1_stride && !vrgather_xi;

// &Instance("gated_clk_cell", "x_vperm_split_clk_cell"); @675
gated_clk_cell  x_vperm_split_clk_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (perm_split_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vperm_split_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @676
//          .external_en (1'b0), @677
//          .global_en   (cp0_yy_clk_en), @678
//          .module_en   (cp0_idu_icg_en), @679
//          .local_en    (vperm_split_clk_en), @680
//          .clk_out     (perm_split_clk) @681
//        ); @682

always @(posedge perm_split_clk or negedge cpurst_b) begin
  if(!cpurst_b)
    vperm_cur_state[1:0] <= 2'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vperm_cur_state[1:0] <= 2'b0;
  else if(!ctrl_split_long_id_stall)
    vperm_cur_state[1:0] <= vperm_next_state[1:0];
  else
    vperm_cur_state[1:0] <= vperm_cur_state[1:0];
end

assign vperm_cur_idle = (vperm_cur_state[1:0]==VPERM_IDLE);
assign vperm_cur_mtvr = (vperm_cur_state[1:0]==VPERM_GMV);

assign vperm_split_stall = vperm_sm_start && (vperm_cur_state[1:0]==VPERM_IDLE)
                        && (vec_gpr_vld || |vec_lmul[1:0])
                        || (vperm_cur_state[1:0]==VPERM_GMV)
                        || (vperm_cur_state[1:0]==VPERM_VPR) && !vpr_cnt_over;  
//=================================
//  SPLIT FSM CONTROL
//=================================
// &CombBeg; @705
always @( vperm_cur_state[1:0]
       or vperm_require_mtvr[1:0]
       or vec_gpr_vld
       or vpr_cnt_over
       or vec_lmul[1:0]
       or vperm_sm_start)
begin
case(vperm_cur_state[1:0])
  VPERM_IDLE: begin
    if(vperm_sm_start && (vec_gpr_vld || |vec_lmul[1:0]))
      vperm_next_state[1:0] = VPERM_VPR;
    else
      vperm_next_state[1:0] = VPERM_IDLE;
  end
  VPERM_VPR: begin
    if(vpr_cnt_over)
      vperm_next_state[1:0] = VPERM_IDLE;
    else if(vec_gpr_vld && |vperm_require_mtvr[1:0])
      vperm_next_state[1:0] = VPERM_GMV;
    else
      vperm_next_state[1:0] = VPERM_VPR;
  end
  VPERM_GMV: begin
    vperm_next_state[1:0] = VPERM_VPR;
  end
  default:
    vperm_next_state[1:0] = VPERM_IDLE;
endcase
// &CombEnd; @727
end

assign vperm_require_mtvr[0] = vslideup && 
                             ((vpr_counter[3:0]==4'b0110) || (vpr_counter[3:0]==4'b1011));

assign vperm_require_mtvr[1] = vslidedown && 
                             ((vpr_counter[3:0]==4'b0011) || (vpr_counter[3:0]==4'b0111));

//=================================
//  VPR COUNTER MANAGE
//=================================
assign vpr_idle_inc = (vperm_cur_state[1:0]==VPERM_IDLE) 
                    && vperm_sm_start && !vec_gpr_vld && |(vec_lmul[1:0]);

assign vpr_inc_1[0] =  vpr_idle_inc && (vec_lmul[1:0]==2'b11) && !vslideup;

assign vpr_inc_1[1] = (vperm_cur_state[1:0]==VPERM_VPR) 
                   &&  vrgather && (vec_lmul[1:0]==2'b11);

assign vpr_inc_1[2] = (vperm_cur_state[1:0]==VPERM_VPR) 
                   && (vslidedown || vcompress) && (vec_lmul[1:0]==2'b11)
                   && !vpr_counter[3] && !(vpr_counter[3:0]==4'b0111);

assign vpr_inc_1[3] = (vperm_cur_state[1:0]==VPERM_VPR) 
                   &&  vslideup && (vec_lmul[1:0]==2'b11)
                   &&  vpr_counter[3];

assign vpr_inc_2[0] =  vpr_idle_inc && ((vec_lmul[1:0]!=2'b11) || vslideup);

assign vpr_inc_2[1] = (vperm_cur_state[1:0]==VPERM_VPR) 
                   && (vec_lmul[1:0]!=2'b11);

assign vpr_inc_2[2] = (vperm_cur_state[1:0]==VPERM_VPR) 
                   && (vslidedown || vcompress) && (vec_lmul[1:0]==2'b11)
                   && (vpr_counter[3] ||(vpr_counter[3:0]==4'b0111));

assign vpr_inc_2[3] = (vperm_cur_state[1:0]==VPERM_VPR) 
                   &&  vslideup && (vec_lmul[1:0]==2'b11)
                   && !vpr_counter[3];


assign vpr_cnt_over = (vperm_cur_state[1:0]==VPERM_VPR) && 
                     ((vpr_counter[3:0]==4'b0000) && (vec_lmul[1:0]==2'b00)
                    ||(vpr_counter[3:0]==4'b0010) && (vec_lmul[1:0]==2'b01)
                    ||(vpr_counter[3:0]==4'b0110) && (vec_lmul[1:0]==2'b10)
                    ||(vpr_counter[3:0]==4'b1111) && (vec_lmul[1:0]==2'b11));

always @(posedge perm_split_clk or negedge cpurst_b) begin
  if(!cpurst_b)
    vpr_counter[3:0] <= 4'b0;
  else if(rtu_idu_flush_fe || iu_yy_xx_cancel)
    vpr_counter[3:0] <= 4'b0;
  else if(!ctrl_split_long_id_stall && !vpr_cnt_over)
    vpr_counter[3:0] <= vpr_counter[3:0] + {2'b0,|vpr_inc_2[3:0],|vpr_inc_1[3:0]};
  else if(!ctrl_split_long_id_stall && vpr_cnt_over)
    vpr_counter[3:0] <= 4'b0;
  else
    vpr_counter[3:0] <= vpr_counter[3:0];
end

//=================================
//  INST VLD CONTROL
//=================================
assign vperm_inst1_not_vld[0] = (vec_lmul[1:0] == 2'b00);

assign vperm_inst1_not_vld[1] = (vpr_counter[3:0]==4'b0000) && vslideup;
assign vperm_inst1_not_vld[2] = (vpr_counter[3:0]==4'b1001) && vslideup;

assign vperm_inst1_not_vld[3] = (vpr_counter[3:0]==4'b0010) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b01);
assign vperm_inst1_not_vld[4] = (vpr_counter[3:0]==4'b0110) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b10);
assign vperm_inst1_not_vld[5] = (vpr_counter[3:0]==4'b0110) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b11);
assign vperm_inst1_not_vld[6] = (vpr_counter[3:0]==4'b1111) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b11);

assign vperm_inst2_not_vld[0] = (vec_lmul[1:0]==2'b01) && vrgather;

assign vperm_inst2_not_vld[1] = (vpr_counter[3:0]==4'b0010) && vslideup;
assign vperm_inst2_not_vld[2] = (vpr_counter[3:0]==4'b1011) && vslideup;

assign vperm_inst2_not_vld[3] = (vpr_counter[3:0]==4'b0000) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b01);
assign vperm_inst2_not_vld[4] = (vpr_counter[3:0]==4'b0100) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b10);
assign vperm_inst2_not_vld[5] = (vpr_counter[3:0]==4'b0100) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b11);
assign vperm_inst2_not_vld[6] = (vpr_counter[3:0]==4'b1101) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b11);

assign vperm_inst3_not_vld[0] = (vpr_counter[3:0]==4'b0100) && vslideup;
assign vperm_inst3_not_vld[1] = (vpr_counter[3:0]==4'b1101) && vslideup;

assign vperm_inst3_not_vld[2] = (vpr_counter[3:0]==4'b0010) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b10);
assign vperm_inst3_not_vld[3] = (vpr_counter[3:0]==4'b0010) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b11);
assign vperm_inst3_not_vld[4] = (vpr_counter[3:0]==4'b1011) && (vslidedown || vcompress) && (vec_lmul[1:0] == 2'b11);

// &CombBeg; @817
always @( vperm_inst2_not_vld[6:0]
       or vperm_inst1_not_vld[6:0]
       or vperm_inst3_not_vld[4:0])
begin
case({|vperm_inst3_not_vld[4:0],|vperm_inst2_not_vld[6:0],|vperm_inst1_not_vld[6:0]})
  3'b001:vperm_inst_vld[3:0] =4'b0001;  
  3'b010:vperm_inst_vld[3:0] =4'b0011;  
  3'b100:vperm_inst_vld[3:0] =4'b0111; 
 default:vperm_inst_vld[3:0] =4'b1111;
endcase  
// &CombEnd; @824
end

assign vperm_inst_split_last[0] = vperm_inst1_not_vld[0]
                               || vperm_inst1_not_vld[3]
                               || vperm_inst1_not_vld[4]
                               || vperm_inst1_not_vld[6];

assign vperm_inst_split_last[1] = vperm_inst2_not_vld[0] && (vpr_counter[3:0]==4'b0010)
                               || vperm_inst2_not_vld[1] && (vec_lmul[1:0]==2'b01);

assign vperm_inst_split_last[2] = 1'b0;

assign vperm_inst_split_last[3] = (vpr_counter[3:0]==4'b0110) && (vec_lmul[1:0]==2'b10) && (vslideup ||vrgather)
                               || (vpr_counter[3:0]==4'b1111) && (vslideup ||vrgather);

//=================================
//  MTVR INST INFO
//=================================
// &CombBeg; @842
always @( vslidedown
       or vec_lmul[1:0])
begin
case(vec_lmul[1:0])
  2'b00:vperm_idle_mtvr_fwd_inst[3:0] = 4'b0001;  
  2'b01:vperm_idle_mtvr_fwd_inst[3:0] = 4'b0011;  
  2'b10:vperm_idle_mtvr_fwd_inst[3:0] = 4'b1010;  
  2'b11:vperm_idle_mtvr_fwd_inst[3:0] = vslidedown ? 4'b1111:4'b1010;
default:vperm_idle_mtvr_fwd_inst[3:0] = {4{{1{1'bx}}}};
endcase  
// &CombEnd; @850
end

// &CombBeg; @852
always @( vperm_idle_mtvr_fwd_inst[3:0]
       or vpr_counter[3:0])
begin
case(vpr_counter[3:0])
  4'b0000:vperm_mtvr_fwd_inst[3:0] = vperm_idle_mtvr_fwd_inst[3:0];
  4'b0100:vperm_mtvr_fwd_inst[3:0] = 4'b1011;
  4'b1000:vperm_mtvr_fwd_inst[3:0] = 4'b1011;
  4'b1001:vperm_mtvr_fwd_inst[3:0] = 4'b1010;
  4'b1100:vperm_mtvr_fwd_inst[3:0] = 4'b1111;
  default:vperm_mtvr_fwd_inst[3:0] = {4{{1{1'bx}}}};
endcase
// &CombEnd; @861
end

//=================================
//  NORMAL INST INST INFO
//=================================

assign vperm_srcv1_reg[4:0] = {5{vcompress || vrgather}} & vec_inst[19:15]
                             |{5{vrgather}} & {2'b0,vpr_counter[3:1]};

assign vperm_srcv0_inc[0] = (vslidedown|| vcompress) && ((vpr_counter[3:0]==4'b0010)||(vpr_counter[3:0]==4'b1011));
assign vperm_srcv0_inc[1] = (vslidedown|| vcompress) && ((vpr_counter[3:0]==4'b0100)||(vpr_counter[3:0]==4'b1101));
assign vperm_srcv0_inc[2] = (vslidedown|| vcompress) && ((vpr_counter[3:0]==4'b0110)||(vpr_counter[3:0]==4'b1111));

// &CombBeg; @874
always @( vperm_srcv0_inc[2:0])
begin
case(vperm_srcv0_inc[2:0])
  3'b001:vperm_srcv0_index[7:0] ={2'b11,2'b11,2'b10,2'b01};  
  3'b010:vperm_srcv0_index[7:0] ={2'b11,2'b11,2'b11,2'b10};  
  3'b100:vperm_srcv0_index[7:0] ={2'b11,2'b11,2'b11,2'b11}; 
 default:vperm_srcv0_index[7:0] ={2'b11,2'b10,2'b01,2'b00};
endcase  
// &CombEnd; @881
end

assign vperm_srcv0_inst0_count[2:0] = {vpr_counter[0],vperm_srcv0_index[1:0]};
assign vperm_srcv0_inst1_count[2:0] = {vpr_counter[0],vperm_srcv0_index[3:2]};
assign vperm_srcv0_inst2_count[2:0] = {vpr_counter[0],vperm_srcv0_index[5:4]};
assign vperm_srcv0_inst3_count[2:0] = {vpr_counter[0],vperm_srcv0_index[7:6]};


// &CombBeg; @889
always @( vperm_srcv1_reg[4:0]
       or vperm_inst_split_last[0]
       or vec_gpr_vld
       or vperm_srcv0_inst0_count[2:0]
       or vec_inst[31:0]
       or vpr_counter[3:1]
       or vec_imm_vld)
begin
  vperm_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vperm_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vperm_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vperm_srcv0_inst0_count[2:0],vpr_counter[3:1]};
  vperm_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vperm_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  vperm_inst0_data[IR_SRCV1_VLD]                  = !vec_imm_vld;
  vperm_inst0_data[IR_SRCV2_VLD]                  = 1'b1;
  vperm_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vperm_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vperm_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vec_inst[24:20] | {2'b0,vperm_srcv0_inst0_count[2:0]} };
  vperm_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   ={vec_gpr_vld, vperm_srcv1_reg[4:0]};
  vperm_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     ={1'b0,vec_inst[11: 7] | {2'b0,vpr_counter[3:1]} };
  vperm_inst0_data[IR_VMLA]                       = 1'b1; 
  vperm_inst0_data[IR_INTMASK]                    = !vperm_inst_split_last[0]; 
  vperm_inst0_data[IR_SPLIT]                      = !vperm_inst_split_last[0];
  vperm_inst0_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @908
end

// &CombBeg; @910
always @( vperm_srcv1_reg[4:0]
       or vperm_inst_split_last[1]
       or vec_gpr_vld
       or vperm_srcv0_inst1_count[2:0]
       or vec_inst[31:0]
       or vpr_counter[3:1]
       or vec_imm_vld)
begin
  vperm_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vperm_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vperm_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vperm_srcv0_inst1_count[2:0],vpr_counter[3:1]};
  vperm_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vperm_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vperm_inst1_data[IR_SRCV1_VLD]                  = !vec_imm_vld;
  vperm_inst1_data[IR_SRCV2_VLD]                  = 1'b1;
  vperm_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vperm_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vperm_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vec_inst[24:20] | {2'b0,vperm_srcv0_inst1_count[2:0]} };
  vperm_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   ={vec_gpr_vld, vperm_srcv1_reg[4:0]};
  vperm_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     ={1'b0,vec_inst[11: 7] | {2'b0,vpr_counter[3:1]} };
  vperm_inst1_data[IR_VMLA]                       = 1'b1; 
  vperm_inst1_data[IR_INTMASK]                    = !vperm_inst_split_last[1]; 
  vperm_inst1_data[IR_SPLIT]                      = !vperm_inst_split_last[1];
  vperm_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @929
end

// &CombBeg; @931
always @( vperm_srcv1_reg[4:0]
       or vperm_srcv0_inst2_count[2:0]
       or vec_gpr_vld
       or vperm_inst_split_last[2]
       or vec_inst[31:0]
       or vpr_counter[3:1]
       or vec_imm_vld)
begin
  vperm_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vperm_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vperm_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vperm_srcv0_inst2_count[2:0],vpr_counter[3:1]};
  vperm_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vperm_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vperm_inst2_data[IR_SRCV1_VLD]                  = !vec_imm_vld;
  vperm_inst2_data[IR_SRCV2_VLD]                  = 1'b1;
  vperm_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vperm_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vperm_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vec_inst[24:20] | {2'b0,vperm_srcv0_inst2_count[2:0]} };
  vperm_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   ={vec_gpr_vld, vperm_srcv1_reg[4:0]};
  vperm_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     ={1'b0,vec_inst[11: 7] | {2'b0,vpr_counter[3:1]} };
  vperm_inst2_data[IR_VMLA]                       = 1'b1; 
  vperm_inst2_data[IR_INTMASK]                    = !vperm_inst_split_last[2]; 
  vperm_inst2_data[IR_SPLIT]                      = !vperm_inst_split_last[2];
  vperm_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @950
end

// &CombBeg; @952
always @( vperm_srcv1_reg[4:0]
       or vec_gpr_vld
       or vec_inst[31:0]
       or vperm_inst_split_last[3]
       or vperm_srcv0_inst3_count[2:0]
       or vpr_counter[3:1]
       or vec_imm_vld)
begin
  vperm_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vperm_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vperm_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vperm_srcv0_inst3_count[2:0],vpr_counter[3:1]};
  vperm_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vperm_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vperm_inst3_data[IR_SRCV1_VLD]                  = !vec_imm_vld;
  vperm_inst3_data[IR_SRCV2_VLD]                  = 1'b1;
  vperm_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vperm_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vperm_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vec_inst[24:20] | {2'b0,vperm_srcv0_inst3_count[2:0]} };
  vperm_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   ={vec_gpr_vld, vperm_srcv1_reg[4:0]};
  vperm_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     ={1'b0,vec_inst[11: 7] | {2'b0,vpr_counter[3:1]} };
  vperm_inst3_data[IR_VMLA]                       = 1'b1; 
  vperm_inst3_data[IR_INTMASK]                    = !vperm_inst_split_last[3]; 
  vperm_inst3_data[IR_SPLIT]                      = !vperm_inst_split_last[3];
  vperm_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @971
end
parameter VSLIDE_IDLE  = 3'b000;
parameter VSLIDE_ONE   = 3'b100;
parameter VSLIDE_TWO   = 3'b101;
parameter VSLIDE_THREE = 3'b110;
parameter VSLIDE_FOUR  = 3'b111;


assign vslide_clk_en = ctrl_split_long_id_inst_vld
                      && (dp_split_long_type[2]) && vslide1_stride 
                      || (vslide_cur_state[2:0] != VSLIDE_IDLE);

assign vslide_one_start = ctrl_split_long_id_inst_vld
                      && (dp_split_long_type[2]) && vslide1_stride;

// &Instance("gated_clk_cell", "x_vslide_split_clk_cell"); @986
gated_clk_cell  x_vslide_split_clk_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vslide_split_clk  ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vslide_clk_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @987
//          .external_en (1'b0), @988
//          .global_en   (cp0_yy_clk_en), @989
//          .module_en   (cp0_idu_icg_en), @990
//          .local_en    (vslide_clk_en), @991
//          .clk_out     (vslide_split_clk) @992
//        ); @993

always @(posedge vslide_split_clk or negedge cpurst_b) begin
  if(!cpurst_b)
    vslide_cur_state[2:0] <= 3'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)  
    vslide_cur_state[2:0] <= 3'b0;
  else if(!ctrl_split_long_id_stall)
    vslide_cur_state[2:0] <= vslide_next_state[2:0];
  else
    vslide_cur_state[2:0] <= vslide_cur_state[2:0];
end

assign vslide_cur_idle =  (vslide_cur_state[2:0]==VSLIDE_IDLE);

assign vslide_split_stall = vslide_one_start && (vslide_cur_state[2:0]==VSLIDE_IDLE)
                         ||(vslide_cur_state[2:0]==VSLIDE_ONE) && (& vec_lmul[1:0] ||vslidedown && |vec_lmul[1:0])
                         ||(vslide_cur_state[2:0]==VSLIDE_TWO) && vslidedown
                         ||(vslide_cur_state[2:0]==VSLIDE_THREE) && & vec_lmul[1:0];   
//-------------------
//THIS COMBINATIONAL BLOCK IS MAINLY FOR VSLIDE_ONE UP/DOWN INSTRUCTION
//-------------------

// &CombBeg; @1016
always @( vslide_one_start
       or vslidedown
       or vec_lmul[1:0]
       or vslide_cur_state[2:0])
begin
case(vslide_cur_state[2:0])
  VSLIDE_IDLE: begin
    if(vslide_one_start)
      vslide_next_state[2:0] = VSLIDE_ONE;
    else
      vslide_next_state[2:0] = VSLIDE_IDLE;
  end
  VSLIDE_ONE: begin
    if(vec_lmul[1:0] == 2'b11)
      vslide_next_state[2:0] = VSLIDE_TWO;
    else if(vslidedown && |vec_lmul[1:0]) 
      vslide_next_state[2:0] = VSLIDE_THREE;
    else
      vslide_next_state[2:0] = VSLIDE_IDLE;
  end
  VSLIDE_TWO: begin
    if(vslidedown)
      vslide_next_state[2:0] = VSLIDE_THREE;
    else
      vslide_next_state[2:0] = VSLIDE_IDLE;
  end
  VSLIDE_THREE: begin
    if(vec_lmul[1:0]==2'b11)
      vslide_next_state[2:0] = VSLIDE_FOUR;
    else
      vslide_next_state[2:0] = VSLIDE_IDLE;
  end
  VSLIDE_FOUR: begin
    vslide_next_state[2:0] = VSLIDE_IDLE;
  end
  default: begin
    vslide_next_state[2:0] = VSLIDE_IDLE;
  end
endcase
// &CombEnd; @1051
end

// &CombBeg; @1053
always @( vslidedown
       or vec_lmul[1:0])
begin
case(vec_lmul[1:0])
  2'b00:vslide_mtvr_fwd_inst[3:0] = 4'b0001; 
  2'b01:vslide_mtvr_fwd_inst[3:0] = vslidedown ? 4'b0011: 4'b0001; 
  2'b10:vslide_mtvr_fwd_inst[3:0] = vslidedown ? 4'b0111: 4'b0001;
  2'b11:vslide_mtvr_fwd_inst[3:0] = vslidedown ? 4'b1111: 4'b0001;
default:vslide_mtvr_fwd_inst[3:0] = {4{{1{1'bx}}}};
endcase
// &CombEnd; @1061
end

// &CombBeg; @1063
always @( vslide_cur_state[1:0]
       or vslidedown
       or vec_lmul[1:0])
begin
case(vec_lmul[1:0])
  2'b00:vslide_inst_vld[3:0] = 4'b0001; 
  2'b01:vslide_inst_vld[3:0] =( vslide_cur_state[1]  &&vslidedown)?4'b0001:4'b0011; 
  2'b10:vslide_inst_vld[3:0] =( vslide_cur_state[1]  &&vslidedown)?4'b0111:4'b1111; 
  2'b11:vslide_inst_vld[3:0] =(&vslide_cur_state[1:0]&&vslidedown)?4'b0111:4'b1111;
default:vslide_inst_vld[3:0] = {4{{1{1'bx}}}};
endcase
// &CombEnd; @1071
end

// &CombBeg; @1073
always @( vslide_cur_state[1:0]
       or vslideup
       or vec_lmul[1:0])
begin
case(vec_lmul[1:0])
  2'b00:vslide_inst_split_last[3:0] = 4'b0001; 
  2'b01:vslide_inst_split_last[3:0] = vslideup ? 4'b0010: {3'b0, vslide_cur_state[1]};  
  2'b10:vslide_inst_split_last[3:0] = vslideup ? 4'b1000: {1'b0, vslide_cur_state[1]  ,2'b0};
  2'b11:vslide_inst_split_last[3:0] = vslideup ?{vslide_cur_state[0],3'b000}: {1'b0,&vslide_cur_state[1:0],2'b0};
default:vslide_inst_split_last[3:0] = {4{{1{1'bx}}}};
endcase
// &CombEnd; @1081
end

assign vslide_inst0_srcv1_tmp[0] = vslideup && (vslide_cur_state[2:0]==VSLIDE_ONE);
assign vslide_inst0_srcv1_tmp[1] = vslidedown && (vec_lmul[1:0]==2'b00);
assign vslide_inst0_srcv1_tmp[2] = vslidedown && (vec_lmul[1:0]==2'b01) && vslide_cur_state[1];
assign vslide_inst0_srcv1_tmp[3] = vslidedown &&  vec_lmul[1] && vslide_cur_state[1];

assign vslide_inst1_srcv1_tmp[0] = vslidedown && (vec_lmul[1:0]==2'b01) && (vslide_cur_state[2:0]==VSLIDE_ONE);
assign vslide_inst1_srcv1_tmp[1] = vslidedown &&  vec_lmul[1] && vslide_cur_state[1];

assign vslide_inst2_srcv1_tmp    = vslidedown &&  vec_lmul[1] && vslide_cur_state[1];

assign vslide_inst3_srcv1_tmp[0] = vslidedown && (vec_lmul[1:0]==2'b10);
assign vslide_inst3_srcv1_tmp[1] = vslidedown && (vec_lmul[1:0]==2'b11) && !(vslide_cur_state[2:0]==VSLIDE_ONE);

assign vslide_srcv0_base[4:0] = vslide_cur_state[1] ? vec_inst[11: 7]: vec_inst[24:20];
assign vslide_srcv0_offset[11:0] = vslide_cur_state[0] 
                               ? {3'b111,3'b110,3'b101,3'b100} : {3'b011,3'b010,3'b001,3'b000};

assign vslide_srcv1_slideup_offset[11:0] = vslide_cur_state[0]
                                        ? {3'b110,3'b101,3'b100,3'b011} : {3'b010,3'b001,3'b000,3'b000};
assign vslide_srcv1_slidedown_offset[11:0] = vslide_cur_state[0]
                                        ? {3'b000,3'b111,3'b110,3'b101} : {3'b100,3'b011,3'b010,3'b001};

assign vslide_srcv1_offset[11:0] = vslideup ? vslide_srcv1_slideup_offset[11:0] 
                                            : vslide_srcv1_slidedown_offset[11:0];

// &CombBeg; @1108
always @( vslide_inst0_srcv1_tmp[3:0]
       or vslide_srcv0_base[4:0]
       or vslide_srcv0_offset[2:0]
       or vec_inst[31:0]
       or vslide_srcv1_offset[2:0]
       or vslide_inst_split_last[0]
       or vslide_cur_state[1])
begin
  vslide_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vslide_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vslide_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0, vslide_cur_state[1] ? vslide_srcv0_offset[2:0] :vslide_srcv1_offset[2:0], vslide_srcv0_offset[2:0]};
  vslide_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vslide_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  vslide_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vslide_inst0_data[IR_SRCV2_VLD]                  = 1'b1;
  vslide_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vslide_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vslide_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vslide_srcv0_base[4:0] | {2'b0,vslide_srcv0_offset[2:0]} };
  vslide_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   =|vslide_inst0_srcv1_tmp[3:0] ? 6'b100000:{1'b0,vec_inst[24:20]|{2'b0,vslide_srcv1_offset[2:0]} };
  vslide_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     ={1'b0,vec_inst[11: 7] | {2'b0,vslide_srcv0_offset[2:0]} };
  vslide_inst0_data[IR_VMLA]                       = 1'b1; 
  vslide_inst0_data[IR_INTMASK]                    = !vslide_inst_split_last[0]; 
  vslide_inst0_data[IR_SPLIT]                      = !vslide_inst_split_last[0];
  vslide_inst0_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @1127
end

// &CombBeg; @1129
always @( vslide_srcv1_offset[5:3]
       or vslide_inst_split_last[1]
       or vslide_srcv0_base[4:0]
       or vec_inst[31:0]
       or vslide_srcv0_offset[5:3]
       or vslide_cur_state[1]
       or vslide_inst1_srcv1_tmp[1:0])
begin
  vslide_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vslide_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vslide_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vslide_cur_state[1] ? vslide_srcv0_offset[5:3] :vslide_srcv1_offset[5:3], vslide_srcv0_offset[5:3]};
  vslide_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vslide_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vslide_inst1_data[IR_SRCV1_VLD]                  = 1'b1;
  vslide_inst1_data[IR_SRCV2_VLD]                  = 1'b1;
  vslide_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vslide_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vslide_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vslide_srcv0_base[4:0] | {2'b0,vslide_srcv0_offset[5:3]} };
  vslide_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   =|vslide_inst1_srcv1_tmp[1:0]? 6'b100000:{1'b0,vec_inst[24:20]|{2'b0,vslide_srcv1_offset[5:3]} };
  vslide_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     ={1'b0, vec_inst[11: 7] | {2'b0,vslide_srcv0_offset[5:3]} };
  vslide_inst1_data[IR_VMLA]                       = 1'b1; 
  vslide_inst1_data[IR_INTMASK]                    = !vslide_inst_split_last[1]; 
  vslide_inst1_data[IR_SPLIT]                      = !vslide_inst_split_last[1];
  vslide_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @1148
end

// &CombBeg; @1150
always @( vslide_inst2_srcv1_tmp
       or vslide_inst_split_last[2]
       or vslide_srcv0_base[4:0]
       or vec_inst[31:0]
       or vslide_srcv0_offset[8:6]
       or vslide_srcv1_offset[8:6]
       or vslide_cur_state[1])
begin
  vslide_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vslide_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vslide_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vslide_cur_state[1] ? vslide_srcv0_offset[8:6] :vslide_srcv1_offset[8:6], vslide_srcv0_offset[8:6]};
  vslide_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vslide_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vslide_inst2_data[IR_SRCV1_VLD]                  = 1'b1;
  vslide_inst2_data[IR_SRCV2_VLD]                  = 1'b1;
  vslide_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vslide_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vslide_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0, vslide_srcv0_base[4:0] | {2'b0,vslide_srcv0_offset[8:6]} };
  vslide_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vslide_inst2_srcv1_tmp ? 6'b100000:{1'b0,vec_inst[24:20]|{2'b0,vslide_srcv1_offset[8:6]} };
  vslide_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     ={1'b0, vec_inst[11: 7] | {2'b0,vslide_srcv0_offset[8:6]} };
  vslide_inst2_data[IR_VMLA]                       = 1'b1; 
  vslide_inst2_data[IR_INTMASK]                    = !vslide_inst_split_last[2]; 
  vslide_inst2_data[IR_SPLIT]                      = !vslide_inst_split_last[2];
  vslide_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @1169
end

// &CombBeg; @1171
always @( vslide_srcv0_offset[11:9]
       or vslide_srcv1_offset[11:9]
       or vslide_srcv0_base[4:0]
       or vec_inst[31:0]
       or vslide_cur_state[1]
       or vslide_inst3_srcv1_tmp[1:0]
       or vslide_inst_split_last[3])
begin
  vslide_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vslide_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vslide_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vslide_cur_state[1] ? vslide_srcv0_offset[11:9] :vslide_srcv1_offset[11:9], vslide_srcv0_offset[11:9]};
  vslide_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vslide_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vslide_inst3_data[IR_SRCV1_VLD]                  = 1'b1;
  vslide_inst3_data[IR_SRCV2_VLD]                  = 1'b1;
  vslide_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vslide_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vslide_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0, vslide_srcv0_base[4:0] | {2'b0,vslide_srcv0_offset[11:9]} };
  vslide_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   =|vslide_inst3_srcv1_tmp[1:0] ? 6'b100000:{1'b0, vec_inst[24:20]|{2'b0,vslide_srcv1_offset[11:9]} };
  vslide_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     ={1'b0, vec_inst[11: 7] | {2'b0,vslide_srcv0_offset[11:9]} };
  vslide_inst3_data[IR_VMLA]                       = 1'b1; 
  vslide_inst3_data[IR_INTMASK]                    = !vslide_inst_split_last[3]; 
  vslide_inst3_data[IR_SPLIT]                      = !vslide_inst_split_last[3];
  vslide_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @1190
end
parameter VRGATHER_IDLE  = 3'b000;
parameter VRGATHER_ONE   = 3'b100;
parameter VRGATHER_TWO   = 3'b101;
parameter VRGATHER_THREE = 3'b110;
parameter VRGATHER_FOUR  = 3'b111;

assign vrgather_clk_en = ctrl_split_long_id_inst_vld
                      && (dp_split_long_type[2]) && vrgather_xi 
                      || (vrgather_cur_state[2:0] != VRGATHER_IDLE);

assign vrgather_start = ctrl_split_long_id_inst_vld
                    && (dp_split_long_type[2]) && vrgather_xi;

// &Instance("gated_clk_cell", "x_vrgather_split_clk_cell"); @1204
gated_clk_cell  x_vrgather_split_clk_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vrgather_split_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vrgather_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1205
//          .external_en (1'b0), @1206
//          .global_en   (cp0_yy_clk_en), @1207
//          .module_en   (cp0_idu_icg_en), @1208
//          .local_en    (vrgather_clk_en), @1209
//          .clk_out     (vrgather_split_clk) @1210
//        ); @1211

always @(posedge vrgather_split_clk or negedge cpurst_b) begin
  if(!cpurst_b)
    vrgather_cur_state[2:0] <= 3'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)  
    vrgather_cur_state[2:0] <= 3'b0;
  else if(!ctrl_split_long_id_stall)
    vrgather_cur_state[2:0] <= vrgather_next_state[2:0];
  else
    vrgather_cur_state[2:0] <= vrgather_cur_state[2:0];
end

assign vrgather_cur_idle = (vrgather_cur_state[2:0]==VRGATHER_IDLE);

assign vrgather_split_stall = vrgather_start && (vrgather_cur_state[2:0]==VRGATHER_IDLE)
                           && (|vec_lmul[1:0] || vec_gpr_vld) 
                           || (vrgather_cur_state[2:0]== VRGATHER_ONE) && |vec_lmul[1:0]
                           || (vrgather_cur_state[2:0]== VRGATHER_TWO)
                           || (vrgather_cur_state[2:0]== VRGATHER_THREE) && &vec_lmul[1:0]; 
//-------------------
//THIS COMBINATIONAL BLOCK IS MAINLY FOR VRGATHER_ONE UP/DOWN INSTRUCTION
//-------------------

// &CombBeg; @1235
always @( vec_gpr_vld
       or vrgather_start
       or vrgather_cur_state[2:0]
       or vec_lmul[1:0]
       or vec_imm_vld)
begin
case(vrgather_cur_state[2:0])
  VRGATHER_IDLE: begin
    if(vrgather_start && vec_gpr_vld)
      vrgather_next_state[2:0] = VRGATHER_ONE;
    else if(vrgather_start && vec_imm_vld)
      vrgather_next_state[2:0] = (&vec_lmul[1:0]) ? VRGATHER_TWO:VRGATHER_THREE;
    else
      vrgather_next_state[2:0] = VRGATHER_IDLE;
  end
  VRGATHER_ONE: begin
    if(vec_lmul[1:0] == 2'b11)
      vrgather_next_state[2:0] = VRGATHER_TWO;
    else if(|vec_lmul[1:0]) 
      vrgather_next_state[2:0] = VRGATHER_THREE;
    else
      vrgather_next_state[2:0] = VRGATHER_IDLE;
  end
  VRGATHER_TWO: begin
      vrgather_next_state[2:0] = VRGATHER_THREE;
  end
  VRGATHER_THREE: begin
    if(vec_lmul[1:0]==2'b11)
      vrgather_next_state[2:0] = VRGATHER_FOUR;
    else
      vrgather_next_state[2:0] = VRGATHER_IDLE;
  end
  VRGATHER_FOUR: begin
    vrgather_next_state[2:0] = VRGATHER_IDLE;
  end
  default: begin
    vrgather_next_state[2:0] = VRGATHER_IDLE;
  end
endcase
// &CombEnd; @1269
end

// &CombBeg; @1271
always @( vec_lmul[1:0])
begin
case(vec_lmul[1:0])
  2'b00:vrgather_mtvr_fwd_inst[3:0] = 4'b0001; 
  2'b01:vrgather_mtvr_fwd_inst[3:0] = 4'b0100; 
  2'b10:vrgather_mtvr_fwd_inst[3:0] = 4'b0100;
  2'b11:vrgather_mtvr_fwd_inst[3:0] = 4'b1000;
default:vrgather_mtvr_fwd_inst[3:0] = {4{{1{1'bx}}}};
endcase
// &CombEnd; @1279
end

// &CombBeg; @1281
always @( vec_lmul[1:0])
begin
case(vec_lmul[1:0])
  2'b00:vrgather_inst_vld[3:0] = 4'b0001; 
  2'b01:vrgather_inst_vld[3:0] = 4'b0011; 
  2'b10:vrgather_inst_vld[3:0] = 4'b1111; 
  2'b11:vrgather_inst_vld[3:0] = 4'b1111;
default:vrgather_inst_vld[3:0] = {4{{1{1'bx}}}};
endcase
// &CombEnd; @1289
end

// &CombBeg; @1291
always @( vrgather_cur_state[1:0]
       or vec_lmul[1:0])
begin
case(vec_lmul[1:0])
  2'b00:vrgather_inst_split_last[3:0] = 4'b0001; 
  2'b01:vrgather_inst_split_last[3:0] ={2'b0,vrgather_cur_state[1],1'b0};  
  2'b10:vrgather_inst_split_last[3:0] ={ vrgather_cur_state[1]  ,3'b0};
  2'b11:vrgather_inst_split_last[3:0] ={&vrgather_cur_state[1:0],3'b0};
default:vrgather_inst_split_last[3:0] = {4{{1{1'bx}}}};
endcase
// &CombEnd; @1299
end

assign vrgather_inst_0[31:0]= {6'b010111,vec_inst[25:15],3'b000,vec_inst[11:7],vec_inst[6:0]};
assign vrgather_inst_1[31:0]= vec_inst[31:0] | {6'b0,|vec_lmul[1:0],25'b0};
assign vrgather_inst[31:0]  = vrgather_cur_state[1] ? vrgather_inst_0[31:0] : vrgather_inst_1[31:0];

assign vrgather_srcv0_base[4:0] = vrgather_cur_state[1] ? vec_inst[11: 7]:vec_inst[24:20];
assign vrgather_srcv0_offset[19:0] = {5'b00011,5'b00010,5'b00001,5'b00000}| {4{2'b0,vrgather_cur_state[0],2'b0}};

assign vrgather_inst0_srcv0_reg[4:0] = vrgather_srcv0_base[4:0] | vrgather_srcv0_offset[4 : 0];
assign vrgather_inst1_srcv0_reg[4:0] = vrgather_srcv0_base[4:0] | vrgather_srcv0_offset[9 : 5];
assign vrgather_inst2_srcv0_reg[4:0] = vrgather_srcv0_base[4:0] | vrgather_srcv0_offset[14:10];
assign vrgather_inst3_srcv0_reg[4:0] = vrgather_srcv0_base[4:0] | vrgather_srcv0_offset[19:15];

assign vrgather_vdst_offset[19:0]    = {5'b00011,5'b00010,5'b00001,5'b00000}| {4{2'b0,vrgather_cur_state[0],2'b0}};

assign vrgather_inst0_vdst_offset[4:0] = vrgather_vdst_offset[4 : 0] & {5{vrgather_cur_state[1]}};
assign vrgather_inst1_vdst_offset[4:0] = vrgather_vdst_offset[9 : 5] & {5{vrgather_cur_state[1]}};
assign vrgather_inst2_vdst_offset[4:0] = vrgather_vdst_offset[14:10] & {5{vrgather_cur_state[1]}};
assign vrgather_inst3_vdst_offset[4:0] = vrgather_vdst_offset[19:15] & {5{vrgather_cur_state[1]}};

assign vrgather_inst0_vdst_reg[4:0] = vec_inst[11: 7] | vrgather_srcv0_offset[4 : 0];
assign vrgather_inst1_vdst_reg[4:0] = vec_inst[11: 7] | vrgather_srcv0_offset[9 : 5];
assign vrgather_inst2_vdst_reg[4:0] = vec_inst[11: 7] | vrgather_srcv0_offset[14:10];
assign vrgather_inst3_vdst_reg[4:0] = vec_inst[11: 7] | vrgather_srcv0_offset[19:15];

assign vrgather_inst_srcv1_tmp[3:0]  = {4{vec_gpr_vld || vrgather_cur_state[1]}};
assign vrgather_inst_srcv1_reg[4:0]  = vrgather_cur_state[1] ? 5'b00001 :5'b00000;

assign vrgather_inst_vdst_tmp[0]     = !vrgather_cur_state[1] && |vec_lmul[1:0];
assign vrgather_inst_vdst_tmp[1]     = !vrgather_cur_state[1];
assign vrgather_inst_vdst_tmp[2]     = !vrgather_cur_state[1];
assign vrgather_inst_vdst_tmp[3]     = !vrgather_cur_state[1];

assign vrgather_inst0_split_num[5:0] = {vrgather_srcv0_offset[2 : 0] & {3{!vrgather_cur_state[1]}}, 
                                        vrgather_inst0_vdst_offset[2:0]};

assign vrgather_inst1_split_num[5:0] = {vrgather_srcv0_offset[7 : 5] & {3{!vrgather_cur_state[1]}}, 
                                        vrgather_inst1_vdst_offset[2:0]};

assign vrgather_inst2_split_num[5:0] = {vrgather_srcv0_offset[12:10] & {3{!vrgather_cur_state[1]}}, 
                                        vrgather_inst2_vdst_offset[2:0]};

assign vrgather_inst3_split_num[5:0] = {vrgather_srcv0_offset[17:15] & {3{!vrgather_cur_state[1]}}, 
                                        vrgather_inst3_vdst_offset[2:0]};

assign vrgather_inst0_fwd_inst[3:0] = {3'b0,|vec_lmul[1:0] && !vrgather_cur_state[1]};

assign vrgather_inst1_fwd_inst[3:0] = {2'b0,(vec_lmul[1:0]==2'b01) && !vrgather_cur_state[1],
                                             vec_lmul[1]&& !vrgather_cur_state[1]};
assign vrgather_inst2_fwd_inst[3:0] = {3'b0,|vec_lmul[1:0] && !vrgather_cur_state[1]};

assign vrgather_inst3_fwd_inst[3:0] = { (vec_lmul[1:0]==2'b11) && !vrgather_cur_state[1] && vrgather_cur_state[0],
                                        (vec_lmul[1:0]==2'b10) && !vrgather_cur_state[1],
                                         1'b0,
                                        (vec_lmul[1:0]==2'b11) && !vrgather_cur_state[1] &&!vrgather_cur_state[0]};  
  
// &CombBeg; @1356
always @( vrgather_inst0_vdst_reg[4:0]
       or vec_gpr_vld
       or vrgather_inst_srcv1_reg[4:0]
       or vrgather_inst_srcv1_tmp[0]
       or vrgather_inst0_fwd_inst[3:0]
       or vrgather_inst_vdst_tmp[0]
       or vrgather_inst_split_last[0]
       or vrgather_inst[31:0]
       or vec_inst[25]
       or vrgather_cur_state[1]
       or vrgather_inst0_split_num[5:0]
       or vrgather_inst0_srcv0_reg[4:0])
begin
  vrgather_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vrgather_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vrgather_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vrgather_inst0_split_num[5:0]};
  vrgather_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vrgather_inst[31:0];
  vrgather_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  vrgather_inst0_data[IR_SRCV1_VLD]                  = vec_gpr_vld || vrgather_cur_state[1];
  vrgather_inst0_data[IR_SRCV2_VLD]                  = 1'b1;
  vrgather_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vrgather_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vrgather_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vrgather_inst0_srcv0_reg[4:0]};
  vrgather_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = {vrgather_inst_srcv1_tmp[0],vrgather_inst_srcv1_reg[4:0]};
  vrgather_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     =  vrgather_inst_vdst_tmp[0] ? 6'b100001: {1'b0,vrgather_inst0_vdst_reg[4:0]};
  vrgather_inst0_data[IR_VMLA]                       = 1'b1; 
  vrgather_inst0_data[IR_INTMASK]                    = !vrgather_inst_split_last[0]; 
  vrgather_inst0_data[IR_SPLIT]                      = !vrgather_inst_split_last[0];
  vrgather_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = vrgather_inst0_fwd_inst[3:0];
  vrgather_inst0_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @1376
end

// &CombBeg; @1378
always @( vrgather_inst1_vdst_reg[4:0]
       or vec_gpr_vld
       or vrgather_inst_srcv1_reg[4:0]
       or vrgather_inst[31:0]
       or vrgather_inst1_srcv0_reg[4:0]
       or vec_inst[25]
       or vrgather_cur_state[1]
       or vrgather_inst1_split_num[5:0]
       or vrgather_inst_vdst_tmp[1]
       or vrgather_inst1_fwd_inst[3:0]
       or vrgather_inst_srcv1_tmp[1]
       or vrgather_inst_split_last[1])
begin
  vrgather_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vrgather_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vrgather_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vrgather_inst1_split_num[5:0]};
  vrgather_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vrgather_inst[31:0];
  vrgather_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vrgather_inst1_data[IR_SRCV1_VLD]                  = vec_gpr_vld || vrgather_cur_state[1];
  vrgather_inst1_data[IR_SRCV2_VLD]                  = 1'b1;
  vrgather_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vrgather_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vrgather_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vrgather_inst1_srcv0_reg[4:0]};
  vrgather_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   ={vrgather_inst_srcv1_tmp[1],vrgather_inst_srcv1_reg[4:0]};
  vrgather_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vrgather_inst_vdst_tmp[1]? 6'b100001:{1'b0,vrgather_inst1_vdst_reg[4:0]};
  vrgather_inst1_data[IR_VMLA]                       = 1'b1; 
  vrgather_inst1_data[IR_INTMASK]                    = !vrgather_inst_split_last[1]; 
  vrgather_inst1_data[IR_SPLIT]                      = !vrgather_inst_split_last[1];
  vrgather_inst1_data[IR_IID_PLUS:IR_IID_PLUS-3]     = vrgather_inst1_fwd_inst[3:0];
  vrgather_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @1398
end

// &CombBeg; @1400
always @( vrgather_inst_split_last[2]
       or vec_gpr_vld
       or vrgather_inst_srcv1_reg[4:0]
       or vrgather_inst2_split_num[5:0]
       or vrgather_inst_vdst_tmp[2]
       or vrgather_inst[31:0]
       or vec_inst[25]
       or vrgather_inst_srcv1_tmp[2]
       or vrgather_inst2_fwd_inst[3:0]
       or vrgather_cur_state[1]
       or vrgather_inst2_vdst_reg[4:0]
       or vrgather_inst2_srcv0_reg[4:0])
begin
  vrgather_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vrgather_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vrgather_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vrgather_inst2_split_num[5:0]};
  vrgather_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vrgather_inst[31:0];
  vrgather_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vrgather_inst2_data[IR_SRCV1_VLD]                  = vec_gpr_vld || vrgather_cur_state[1];
  vrgather_inst2_data[IR_SRCV2_VLD]                  = 1'b1;
  vrgather_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vrgather_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vrgather_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vrgather_inst2_srcv0_reg[4:0]};
  vrgather_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   ={vrgather_inst_srcv1_tmp[2],vrgather_inst_srcv1_reg[4:0]};
  vrgather_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vrgather_inst_vdst_tmp[2]?6'b100001: {1'b0,vrgather_inst2_vdst_reg[4:0]};
  vrgather_inst2_data[IR_VMLA]                       = 1'b1; 
  vrgather_inst2_data[IR_INTMASK]                    = !vrgather_inst_split_last[2]; 
  vrgather_inst2_data[IR_SPLIT]                      = !vrgather_inst_split_last[2];
  vrgather_inst2_data[IR_IID_PLUS:IR_IID_PLUS-3]     = vrgather_inst2_fwd_inst[3:0];
  vrgather_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @1420
end

// &CombBeg; @1422
always @( vrgather_inst_srcv1_tmp[3]
       or vec_gpr_vld
       or vrgather_inst3_fwd_inst[3:0]
       or vrgather_inst_srcv1_reg[4:0]
       or vrgather_inst3_vdst_reg[4:0]
       or vrgather_inst[31:0]
       or vrgather_inst_vdst_tmp[3]
       or vec_inst[25]
       or vrgather_cur_state[1]
       or vrgather_inst_split_last[3]
       or vrgather_inst3_split_num[5:0]
       or vrgather_inst3_srcv0_reg[4:0])
begin
  vrgather_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vrgather_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vrgather_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vrgather_inst3_split_num[5:0]};
  vrgather_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vrgather_inst[31:0];
  vrgather_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vrgather_inst3_data[IR_SRCV1_VLD]                  = vec_gpr_vld || vrgather_cur_state[1];
  vrgather_inst3_data[IR_SRCV2_VLD]                  = 1'b1;
  vrgather_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vrgather_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vrgather_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   ={1'b0,vrgather_inst3_srcv0_reg[4:0]};
  vrgather_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   ={vrgather_inst_srcv1_tmp[3],vrgather_inst_srcv1_reg[4:0]};
  vrgather_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vrgather_inst_vdst_tmp[3] ? 6'b100001: {1'b0,vrgather_inst3_vdst_reg[4:0]};
  vrgather_inst3_data[IR_VMLA]                       = 1'b1; 
  vrgather_inst3_data[IR_INTMASK]                    = !vrgather_inst_split_last[3]; 
  vrgather_inst3_data[IR_SPLIT]                      = !vrgather_inst_split_last[3];
  vrgather_inst3_data[IR_IID_PLUS:IR_IID_PLUS-3]     = vrgather_inst3_fwd_inst[3:0];
  vrgather_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @1442
end

//==========================================================
//                  vector instruction
//==========================================================
parameter VEC_NORM_IDLE = 3'b000;
parameter VEC_NORM_MTVR = 3'b001;
parameter VEC_NORM_1ST  = 3'b010;
parameter VEC_NORM_2ND  = 3'b100;

parameter VEC_NORM_TYPE = 1;
parameter VEC_FRED_TYPE = 3;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_norm_split_clk_en = ctrl_split_long_id_inst_vld
                           && (dp_split_long_type[VEC_NORM_TYPE])
                           ||!(vec_norm_cur_state[2:0] == VEC_NORM_IDLE);

// &Instance("gated_clk_cell", "x_vec_norm_split_gated_clk"); @1462
gated_clk_cell  x_vec_norm_split_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (vec_norm_split_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (vec_norm_split_clk_en),
  .module_en             (cp0_idu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in      (forever_cpuclk), @1463
//          .external_en (1'b0), @1464
//          .global_en   (cp0_yy_clk_en), @1465
//          .module_en   (cp0_idu_icg_en), @1466
//          .local_en    (vec_norm_split_clk_en), @1467
//          .clk_out     (vec_norm_split_clk)); @1468

always @(posedge vec_norm_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_norm_cur_state[2:0] <= VEC_NORM_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_norm_cur_state[2:0] <= VEC_NORM_IDLE;
  else
    vec_norm_cur_state[2:0] <= vec_norm_next_state[2:0];
end
assign vec_norm_sm_start       = ctrl_split_long_id_inst_vld
                              && dp_split_long_type[VEC_NORM_TYPE]
                              && !ctrl_split_long_id_stall;

assign vec_norm_split_slow_0 = (vec_opivx || vec_opmvx || vec_opfvf && !vec_inst_fmv);
assign vec_norm_split_slow_1 = vec_norm_require_2nd; 

assign vec_norm_split_stall =  vec_norm_sm_start &&
                              (vec_norm_cur_state[2:0]==VEC_NORM_IDLE) &&
                              (vec_norm_split_slow_0 || vec_norm_split_slow_1) ||
                              (vec_norm_cur_state[2:0]==VEC_NORM_1ST) &&
                               vec_norm_split_slow_1;

// &CombBeg; @1492
always @( vec_norm_sm_start
       or vec_norm_split_slow_0
       or ctrl_split_long_id_stall
       or vec_norm_split_slow_1
       or vec_norm_cur_state[2:0])
begin
  case(vec_norm_cur_state[2:0])
  VEC_NORM_IDLE  : if(vec_norm_sm_start && vec_norm_split_slow_0)
                     vec_norm_next_state[2:0] = VEC_NORM_1ST;
                   else if(vec_norm_sm_start && vec_norm_split_slow_1)
                     vec_norm_next_state[2:0] = VEC_NORM_2ND;
                   else
                     vec_norm_next_state[2:0] = VEC_NORM_IDLE;
  VEC_NORM_1ST  : if(!ctrl_split_long_id_stall && vec_norm_split_slow_1)
                     vec_norm_next_state[2:0] = VEC_NORM_2ND;
                   else if(!ctrl_split_long_id_stall)
                     vec_norm_next_state[2:0] = VEC_NORM_IDLE;
                   else
                     vec_norm_next_state[2:0] = VEC_NORM_1ST;
  VEC_NORM_2ND   : if(!ctrl_split_long_id_stall)
                     vec_norm_next_state[2:0] = VEC_NORM_IDLE;
                   else
                     vec_norm_next_state[2:0] = VEC_NORM_2ND;
  default        :   vec_norm_next_state[2:0] = VEC_NORM_IDLE;
  endcase
// &CombEnd; @1512
end

assign vec_norm_cur_mtvr = (vec_norm_cur_state[2:0]==VEC_NORM_IDLE) && vec_norm_split_slow_0; 
assign vec_norm_cur_1st  = (vec_norm_cur_state[2:0]==VEC_NORM_IDLE) &&!vec_norm_split_slow_0 
                         ||(vec_norm_cur_state[2:0]==VEC_NORM_1ST);
assign vec_norm_cur_2nd  = (vec_norm_cur_state[2:0]==VEC_NORM_2ND);
//----------------------------------------------------------
//           normal vector split variables initial value
//----------------------------------------------------------
assign vec_inst[31:0]     =  dp_split_long_inst[31:0];
assign vec_lmul[1 :0]     =  dp_split_long_vlmul[1 :0];
assign vec_sew[1 :0]      =  dp_split_long_vsew[1 :0];

assign vec_opivv          =  vec_inst[6] && (vec_inst[14:12] == 3'b000);
assign vec_opivx          =  vec_inst[6] && (vec_inst[14:12] == 3'b100);
assign vec_opivi          =  vec_inst[6] && (vec_inst[14:12] == 3'b011);
assign vec_opmvv          =  vec_inst[6] && (vec_inst[14:12] == 3'b010);
assign vec_opmvx          =  vec_inst[6] && (vec_inst[14:12] == 3'b110);
assign vec_opfvv          =  vec_inst[6] && (vec_inst[14:12] == 3'b001);
assign vec_opfvf          =  vec_inst[6] && (vec_inst[14:12] == 3'b101);

assign vec_ldst           = !vec_inst[6];
assign vec_ld             = !vec_inst[6] && !vec_inst[5];
assign vec_st             = !vec_inst[6] &&  vec_inst[5];

assign vec_ld_srcv2_vld   = !vec_inst[25] || |cp0_idu_vstart[6:0] || (dp_split_long_vl[7:0] == 8'b0) || (vec_inst[24:20] == 5'b10000);
//----------------------------------------------------------
//                  narrowing inst
//----------------------------------------------------------
assign vec_type_narr_0    = (vec_inst[31:27] == 5'b10110) && (vec_opivv || vec_opivx || vec_opivi);//narrow shift
assign vec_type_narr_1    = (vec_inst[31:27] == 5'b10111) && (vec_opivv || vec_opivx || vec_opivi);//sat narrow shift
assign vec_type_narr_2    = (vec_inst[31:26] == 6'b100010) && (x_vfunary0_vld_narr) && (vec_opfvv);//narrow fcvt
assign vec_type_narr      = (vec_type_narr_0 || vec_type_narr_1 || vec_type_narr_2); 
assign vec_narr_sat       =  vec_type_narr_1;
assign vec_narr_sht       =  vec_type_narr_0 || vec_type_narr_1;
//fcvt
assign x_vfunary0_vld_narr = (vec_inst[19:15] == 5'b10000) //vfncvt.xu.f.v
                           ||(vec_inst[19:15] == 5'b10001) //vfncvt.x.f.v
                           ||(vec_inst[19:15] == 5'b10010) //vfncvt.f.xu.v
                           ||(vec_inst[19:15] == 5'b10011) //vfncvt.f.x.v
                           ||(vec_inst[19:15] == 5'b10100);//vfncvt.f.f.v

assign vec_type_fcvt_narr = vec_type_narr_2;
//----------------------------------------------------------
//                  widening inst
//----------------------------------------------------------
assign vec_type_wide_0    = (vec_inst[31:28] == 4'b1111)  && (vec_opivv || vec_opivx);   //sat widening fix-point mac inst
assign vec_type_wide_1    = (vec_inst[31:28] == 4'b1100)  && (vec_opmvv || vec_opmvx);   //widening integer alu inst
assign vec_type_wide_2    = (vec_inst[31:28] == 4'b1101)  && (vec_opmvv || vec_opmvx);   //src widening integer alu inst
assign vec_type_wide_3    = (vec_inst[31:28] == 4'b1110)  && (vec_opmvv || vec_opmvx);   //widening integer mult inst
assign vec_type_wide_4    = (vec_inst[31:28] == 4'b1111)  && (vec_opmvv || vec_opmvx);   //widening integer mac inst
assign vec_type_wide_5    = (vec_inst[31:28] == 4'b1100)  && !vec_inst[26] && (vec_opfvv || vec_opfvf); //wide add/sub
assign vec_type_wide_6    = (vec_inst[31:28] == 4'b1101)  && (vec_opfvv || vec_opfvf); //src wide add/sub
assign vec_type_wide_7    = (vec_inst[31:26] == 6'b111000)&& (vec_opfvv || vec_opfvf); //vfwmul
assign vec_type_wide_8    = (vec_inst[31:28] == 4'b1111)  && (vec_opfvv || vec_opfvf);  //wide mac
assign vec_type_wide_9    = (vec_inst[31:26] == 6'b100010)&& (x_vfunary0_vld_wide) && (vec_opfvv);//widening fcvt

assign vec_type_wide      = (vec_type_wide_0 || vec_type_wide_1 || 
                             vec_type_wide_2 || vec_type_wide_3 ||
                             vec_type_wide_4 || vec_type_wide_5 ||
                             vec_type_wide_6 || vec_type_wide_7 || 
                             vec_type_wide_8 || vec_type_wide_9);

assign vec_wide_sat       =  vec_type_wide_0;
assign vec_wide_mac       =  vec_type_wide_0 || vec_type_wide_4;
assign vec_wide_mul       =  vec_type_wide_0 || vec_type_wide_3 || vec_type_wide_4;

assign x_vfunary0_vld_wide = (vec_inst[19:15] == 5'b01000) //vfwcvt.xu.f.v
                           ||(vec_inst[19:15] == 5'b01001) //vfwcvt.x.f.v
                           ||(vec_inst[19:15] == 5'b01010) //vfwcvt.f.xu.v
                           ||(vec_inst[19:15] == 5'b01011) //vfwcvt.f.x.v
                           ||(vec_inst[19:15] == 5'b01100);//vfwcvt.f.f.v

assign vec_type_fcvt_wide = vec_type_wide_9;
 
//----------------------------------------------------------
//                  normal inst
//----------------------------------------------------------
//assign vec_type_norm_0_0  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:29]== 3'b000) ; //add/sub max/min
//assign vec_type_norm_0_1  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:28]== 4'b0010); //and or xor
assign vec_type_norm_0_2  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:28]== 4'b0100); //adc
assign vec_type_norm_0_3  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:26]== 6'b010111); //merge mv
assign vec_type_norm_0_4  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:29]== 3'b011); //compare
assign vec_type_norm_0_5  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:28]== 4'b1000); //sat add
//assign vec_type_norm_0_6  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:26]== 6'b100100); //aadd
assign vec_type_norm_0_7  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:26]== 6'b100101); //sll
//assign vec_type_norm_0_8  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:26]== 6'b100110); //asub
assign vec_type_norm_0_9  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:26]== 6'b100111); //smul
assign vec_type_norm_0_a  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:27]== 5'b10100); //shift
assign vec_type_norm_0_b  = (vec_opivv || vec_opivx || vec_opivi) && (vec_inst[31:27]== 5'b10101); //sat shift
//assign vec_type_norm_0    = (vec_type_norm_0_0 || vec_type_norm_0_1 || 
//                             vec_type_norm_0_2 || vec_type_norm_0_3 ||
//                             vec_type_norm_0_4 || vec_type_norm_0_5 ||
//                             vec_type_norm_0_6 || vec_type_norm_0_7 ||
//                             vec_type_norm_0_8 || vec_type_norm_0_9 ||
//                             vec_type_norm_0_a || vec_type_norm_0_b);

assign vec_type_norm_1_0  = (vec_opmvv || vec_opmvx) && (vec_inst[31:28]== 4'b1000);//div
assign vec_type_norm_1_1  = (vec_opmvv || vec_opmvx) && (vec_inst[31:28]== 4'b1001);//mult
assign vec_type_norm_1_2  = (vec_opmvv || vec_opmvx) && (vec_inst[31:29]== 3'b101);//mac
assign vec_type_norm_1_3  = (vec_opmvv             ) && (vec_inst[31:26]== 6'b010110) 
                                                     && (vec_inst[19:16]== 4'b1000); //viota vid

//assign vec_type_norm_1    = (vec_type_norm_1_0 || vec_type_norm_1_1 ||
//                             vec_type_norm_1_2 || vec_type_norm_1_3 );

assign x_vfunary0_vld_norm = (vec_inst[19:15] == 5'b00000) //vfcvt.xu.f.v
                           ||(vec_inst[19:15] == 5'b00001) //vfcvt.x.f.v
                           ||(vec_inst[19:15] == 5'b00010) //vfcvt.f.xu.v
                           ||(vec_inst[19:15] == 5'b00011);//vfcvt.f.x.v

//assign vec_type_norm_2_0  = (vec_opfvv || vec_opfvf) && (vec_inst[31:29]== 3'b000) && !vec_inst[26];//add/sub max/min
assign vec_type_norm_2_1  = (vec_opfvv || vec_opfvf) && (vec_inst[31:28]== 4'b0010); //inject
assign vec_type_norm_2_2  = (             vec_opfvf) && (vec_inst[31:26]== 6'b010111); //fmerge/fmv
assign vec_type_norm_2_3  = (vec_opfvv || vec_opfvf) && (vec_inst[31:29]== 3'b011);//compare
assign vec_type_norm_2_4  = (vec_opfvv || vec_opfvf) && (vec_inst[31:26]== 6'b100000);//fdiv
assign vec_type_norm_2_5  = (             vec_opfvf) && (vec_inst[31:26]== 6'b100001);//frdiv
assign vec_type_norm_2_6  = (vec_opfvv             ) && (vec_inst[31:26]== 6'b100011) && !vec_inst[19];//fsqrt
assign vec_type_norm_2_7  = (vec_opfvv             ) && (vec_inst[31:26]== 6'b100011) &&  vec_inst[19];//fclass
//assign vec_type_norm_2_8  = (vec_opfvv || vec_opfvf) && (vec_inst[31:26]== 6'b100100);//vfmul
assign vec_type_norm_2_9  = (vec_opfvv || vec_opfvf) && (vec_inst[31:26]== 6'b100111);//vfrsub
assign vec_type_norm_2_a  = (vec_opfvv || vec_opfvf) && (vec_inst[31:28]== 4'b1011);//vfmac
assign vec_type_norm_2_b  = (vec_opfvv             ) && (vec_inst[31:26] == 6'b100010) &&(x_vfunary0_vld_norm);
assign vec_type_norm_2_c  = (vec_opfvv || vec_opfvf) && (vec_inst[31:28]== 4'b1010);//vfmadd

assign vec_type_fcvt_norm = vec_type_norm_2_b;

//assign vec_type_norm_2    = (vec_type_norm_2_0 || vec_type_norm_2_1 || 
//                             vec_type_norm_2_2 || vec_type_norm_2_3 ||
//                             vec_type_norm_2_4 || vec_type_norm_2_5 ||
//                             vec_type_norm_2_6 || vec_type_norm_2_7 ||
//                             vec_type_norm_2_8 || vec_type_norm_2_9 ||
//                             vec_type_norm_2_a || vec_type_norm_2_b);
//
//assign vec_type_norm      =  vec_type_norm_0 ||vec_type_norm_1 || vec_type_norm_2; 

assign vec_norm_mul       =  vec_type_norm_0_9 || vec_type_norm_1_1 || vec_type_norm_1_2;
assign vec_norm_sht       =  vec_type_norm_0_7 || vec_type_norm_0_a || vec_type_norm_0_b;
assign vec_norm_div       =  vec_type_norm_1_0;

assign vec_norm_sat       = vec_type_norm_0_5 || vec_type_norm_0_9;

assign vec_norm_mac       = vec_type_norm_1_2;

assign vec_type_fcvt      = vec_type_fcvt_norm || vec_type_fcvt_wide || vec_type_fcvt_narr;
assign vec_type_fmac      = vec_type_wide_8 || vec_type_norm_2_a;
assign vec_type_fdiv      = vec_type_norm_2_4 || vec_type_norm_2_5 || vec_type_norm_2_6;
//----------------------------------------------------------
//                  reduction inst
//----------------------------------------------------------
assign vec_type_redu      =(vec_inst[31:27]==5'b11000) && vec_opivv ||
                           (vec_inst[31:29]==3'b000)   && vec_opmvv;

//----------------------------------------------------------
//                  all normal inst info
//----------------------------------------------------------
assign vec_inst_sat       = vec_narr_sat || vec_wide_sat || vec_norm_sat;

assign vec_inst_mac       = vec_wide_mac || vec_norm_mac;

assign vec_inst_sht       = vec_narr_sht || vec_norm_sht;

assign vec_inst_div       = vec_norm_div || vec_type_fdiv; 

assign vec_inst_adc       = vec_type_norm_0_2;

assign vec_inst_red       = vec_type_redu;

assign vec_inst_cmp       = vec_type_norm_0_2 && vec_inst[26] || vec_type_norm_0_4;

assign vec_inst_madd      =  vec_type_norm_2_c;

assign vec_norm_inst_vmla = vec_inst_mac || vec_narr_sht || vec_inst_red 
                          ||vec_inst_cmp || vec_type_fmac || vec_type_fcvt;

assign vec_inst_ereg      =(vec_opfvv || vec_opfvf) 
                        && !vec_type_norm_2_1    //fsgnj
                        && !vec_type_norm_2_7;   //fclass

assign vec_inst_fmv       = (vec_inst[31:26]==6'b010111) && vec_opfvf;

assign vec_norm_pipe_sel[0] = vec_norm_mul || vec_type_fcvt;
assign vec_norm_pipe_sel[1] = vec_inst_red || vec_inst_sht || vec_inst_div;
assign vec_norm_pipe_sel[2] = vec_ld && !vec_ld_srcv2_vld;
assign vec_norm_pipe_sel[3] = vec_st || vec_ld && vec_ld_srcv2_vld;
// &CombBeg; @1697
always @( vec_norm_pipe_sel[3:0])
begin
case(vec_norm_pipe_sel[3:0])
 4'b0001:vec_norm_pipe[9:0] = PIPE7;
 4'b0010:vec_norm_pipe[9:0] = PIPE6;
 4'b0100:vec_norm_pipe[9:0] = LSU;
 4'b1000:vec_norm_pipe[9:0] = LSU_P5;
 default:vec_norm_pipe[9:0] = PIPE67;
endcase
// &CombEnd; @1705
end

assign vec_norm_split_num[3:0] = (vec_type_narr || vec_type_wide) 
                               ? (4'b0010 << vec_lmul[1:0])
                               : (4'b0001 << vec_lmul[1:0]);

assign vec_norm_inst_0_finish = vec_norm_cur_1st && (vec_norm_split_num[3:0]==4'b0001);
assign vec_norm_inst_1_finish = vec_norm_cur_1st && (vec_norm_split_num[3:0]==4'b0010);
assign vec_norm_inst_3_finish = vec_norm_cur_1st && (vec_norm_split_num[3:0]==4'b0100)
                              ||vec_norm_cur_2nd && (vec_norm_split_num[3:0]==4'b1000);

assign vec_type_wide_narr = (vec_inst[31:28]==4'b1011) && (vec_opivv || vec_opivx || vec_opivi) //narrow shift
                         || (vec_inst[31:26]==6'b100010) && vec_opfvv && (|vec_inst[19:18])     //narrow/widen fcnvt
                         || (vec_inst[31:30]==2'b11) && !((vec_inst[31:27]==5'b11000) && vec_opivv); //wide inst

assign vec_norm_require_2nd = vec_type_wide_narr && (vec_lmul[1:0]==2'b10) ||
                             !vec_type_wide_narr && (vec_lmul[1:0]==2'b11);

assign vec_norm_srcv0_vld = !(vec_type_norm_0_3 && vec_inst[25]) && //vmv
                            !(vec_type_norm_1_3 && vec_inst[15]) && //vid
                            !(vec_type_norm_2_2 && vec_inst[25]) && //vfmv
                            ! vec_ldst;

assign vec_norm_srcv1_vld = !vec_type_norm_1_3 && !vec_opivi  //viota,vid or V-I inst
             //            && !vec_type_fcvt     //fcvt
                         && !vec_type_norm_2_6  //fsqrt 
                         && !vec_type_norm_2_7 //fclass 
                         && !vec_inst_fmv 
                         && !vec_ldst;

assign vec_norm_srcv2_vld = (!vec_inst[25] && !vec_inst_red) || vec_norm_mac || vec_wide_mac || vec_type_fmac ||vec_st || vec_inst_madd || vec_ld && vec_ld_srcv2_vld;
assign vec_norm_srcvm_vld = !vec_inst[25] || vec_inst_adc;  

assign vec_type_cmp       = vec_inst_cmp || vec_type_norm_2_3;

assign vec_norm_srcv0_offset_tmp[11:0] =(vec_type_wide_0 || vec_type_wide_1 
                                      || vec_type_wide_3 || vec_type_wide_4 
                                      || vec_type_wide_5 || vec_type_wide_7 || vec_type_wide_8 ||
                                      vec_type_wide_9)
                                      ? {3'b001,3'b001,3'b000,3'b000}|{4{1'b0,vec_norm_cur_2nd,1'b0}} 
                                      : {3'b011,3'b010,3'b001,3'b000}|{4{     vec_norm_cur_2nd,2'b0}};

assign  vec_norm_srcv0_offset[11:0] = vec_type_norm_1_3 ? 12'b0 : vec_norm_srcv0_offset_tmp[11:0];

assign vec_norm_srcv1_offset[11:0] =(vec_type_wide || vec_type_narr)
                                   ? {3'b001,3'b001,3'b000,3'b000}|{4{1'b0,vec_norm_cur_2nd,1'b0}} 
                                   : {3'b011,3'b010,3'b001,3'b000}|{4{     vec_norm_cur_2nd,2'b0}};

assign vec_norm_destv_offset_tmp[11:0] =(vec_type_narr)
                                      ? {3'b001,3'b001,3'b000,3'b000}|{4{1'b0,vec_norm_cur_2nd,1'b0}} 
                                      : {3'b011,3'b010,3'b001,3'b000}|{4{     vec_norm_cur_2nd,2'b0}};

assign vec_norm_destv_offset[11:0] = (vec_type_cmp || vec_type_redu)
                                      ? 12'b0 : vec_norm_destv_offset_tmp[11:0];

assign vec_norm_srcv0_vreg_0_tmp[4:0] = vec_inst[24:20] | {2'b0,vec_norm_srcv0_offset[2 :0]};
assign vec_norm_srcv0_vreg_1_tmp[4:0] = vec_inst[24:20] | {2'b0,vec_norm_srcv0_offset[5 :3]};
assign vec_norm_srcv0_vreg_2_tmp[4:0] = vec_inst[24:20] | {2'b0,vec_norm_srcv0_offset[8 :6]};
assign vec_norm_srcv0_vreg_3_tmp[4:0] = vec_inst[24:20] | {2'b0,vec_norm_srcv0_offset[11:9]};

assign vec_norm_srcv1_vreg_0_tmp[4:0] = (vec_opivx || vec_opmvx || vec_opfvf) ? 5'b0:(vec_inst[19:15] | {2'b0,vec_norm_srcv1_offset[2 :0]});
assign vec_norm_srcv1_vreg_1_tmp[4:0] = (vec_opivx || vec_opmvx || vec_opfvf) ? 5'b0:(vec_inst[19:15] | {2'b0,vec_norm_srcv1_offset[5 :3]});
assign vec_norm_srcv1_vreg_2_tmp[4:0] = (vec_opivx || vec_opmvx || vec_opfvf) ? 5'b0:(vec_inst[19:15] | {2'b0,vec_norm_srcv1_offset[8 :6]});
assign vec_norm_srcv1_vreg_3_tmp[4:0] = (vec_opivx || vec_opmvx || vec_opfvf) ? 5'b0:(vec_inst[19:15] | {2'b0,vec_norm_srcv1_offset[11:9]});

assign vec_norm_srcv0_vreg_0[4:0] = vec_src_switch ?vec_norm_srcv1_vreg_0_tmp[4:0]:vec_norm_srcv0_vreg_0_tmp[4:0]; 
assign vec_norm_srcv0_vreg_1[4:0] = vec_src_switch ?vec_norm_srcv1_vreg_1_tmp[4:0]:vec_norm_srcv0_vreg_1_tmp[4:0]; 
assign vec_norm_srcv0_vreg_2[4:0] = vec_src_switch ?vec_norm_srcv1_vreg_2_tmp[4:0]:vec_norm_srcv0_vreg_2_tmp[4:0]; 
assign vec_norm_srcv0_vreg_3[4:0] = vec_src_switch ?vec_norm_srcv1_vreg_3_tmp[4:0]:vec_norm_srcv0_vreg_3_tmp[4:0]; 

assign vec_norm_srcv1_vreg_0[4:0] = vec_type_fcvt ? vec_norm_destv_vreg_0[4:0] : vec_src_switch ? vec_norm_srcv0_vreg_0_tmp[4:0]:vec_norm_srcv1_vreg_0_tmp[4:0]; 
assign vec_norm_srcv1_vreg_1[4:0] = vec_type_fcvt ? vec_norm_destv_vreg_1[4:0] : vec_src_switch ? vec_norm_srcv0_vreg_1_tmp[4:0]:vec_norm_srcv1_vreg_1_tmp[4:0]; 
assign vec_norm_srcv1_vreg_2[4:0] = vec_type_fcvt ? vec_norm_destv_vreg_2[4:0] : vec_src_switch ? vec_norm_srcv0_vreg_2_tmp[4:0]:vec_norm_srcv1_vreg_2_tmp[4:0]; 
assign vec_norm_srcv1_vreg_3[4:0] = vec_type_fcvt ? vec_norm_destv_vreg_3[4:0] : vec_src_switch ? vec_norm_srcv0_vreg_3_tmp[4:0]:vec_norm_srcv1_vreg_3_tmp[4:0]; 

assign vec_norm_destv_vreg_0[4:0] = vec_inst[11:7] | {2'b0,vec_norm_destv_offset[2 :0]};
assign vec_norm_destv_vreg_1[4:0] = vec_inst[11:7] | {2'b0,vec_norm_destv_offset[5 :3]};
assign vec_norm_destv_vreg_2[4:0] = vec_inst[11:7] | {2'b0,vec_norm_destv_offset[8 :6]};
assign vec_norm_destv_vreg_3[4:0] = vec_inst[11:7] | {2'b0,vec_norm_destv_offset[11:9]};

assign vec_src_switch = ((vec_inst[31:26]==6'b000010)    //vsub
                      || (vec_inst[31:26]==6'b010010)    //vsbc
                      || (vec_inst[31:26]==6'b010011)    //vmsbc
                      || (vec_inst[31:26]==6'b011010)    //vmsltu
                      || (vec_inst[31:26]==6'b011011)    //vmslt
                      || (vec_inst[31:26]==6'b100010)    //vssubu
                      || (vec_inst[31:26]==6'b100011)    //vssub
                      || (vec_inst[31:26]==6'b100110))   //vasub
                      && (vec_opivv || vec_opivx)
                      ||((vec_inst[31:26]==6'b110010)    //vwsubu
                      || (vec_inst[31:26]==6'b110011)    //vwsub
                      || (vec_inst[31:26]==6'b110110)    //vwsubu.w
                      || (vec_inst[31:26]==6'b110111)    //vwsub.w
                      || (vec_inst[31:26]==6'b101001)    //vmadd
                      || (vec_inst[31:26]==6'b101011))   //vmsub
                      && (vec_opmvv || vec_opmvx)
                      ||((vec_inst[31:26]==6'b011101)    //vmfgt
                      || (vec_inst[31:26]==6'b011111))   //vmfge
                      && (vec_opfvf)
                      ||((vec_inst[31:29]==3'b101   )    //vfmacc
                      || (vec_inst[31:28]==4'b1111  ))   //vfwmacc
                      && (vec_opfvf || vec_opfvv)        
                      ||  vec_type_norm_2_5              //frdiv
                      ||  vec_type_norm_2_9;             //frsub

//----------------------------------------------------------
//                 MTVR inst (vmv.v.x)
//----------------------------------------------------------
assign vec_mtvr_inst_op[31:26]  = 6'b010111; //vmv.v.x /vfmv.v.f
assign vec_mtvr_inst_op[25]     = 1'b1;  //always unmask inst
assign vec_mtvr_inst_op[24:20]  = 5'b0;
assign vec_mtvr_inst_op[19:15]  = vec_inst[19:15];
assign vec_mtvr_inst_op[14:12]  = vec_opfvf ? 3'b101 : 3'b100;
assign vec_mtvr_inst_op[11: 7]  = 5'b0;
assign vec_mtvr_inst_op[6 : 0]  = vec_inst[6:0];
// &CombBeg; @1820
always @( vec_norm_split_num[3:0]
       or vec_inst[19:15]
       or vec_mtvr_inst_op[31:0]
       or vec_opivx
       or vec_opfvf
       or vec_opmvx)
begin
  vec_norm_mtvr_data[IR_WIDTH-1:0]                = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_norm_mtvr_data[IR_INST_TYPE:IR_INST_TYPE-9] = vec_opfvf ? PIPE67 :ALU;
  vec_norm_mtvr_data[IR_OPCODE:IR_OPCODE-31]      = vec_mtvr_inst_op[31:0];
  vec_norm_mtvr_data[IR_SRC0_VLD]                 = vec_opivx || vec_opmvx;
  vec_norm_mtvr_data[IR_SRC0_REG:IR_SRC0_REG-5]   = {1'b0,vec_inst[19:15]};
  vec_norm_mtvr_data[IR_SRCF1_VLD]                = vec_opfvf;
  vec_norm_mtvr_data[IR_SRCF1_REG:IR_SRCF1_REG-5] = {1'b0,vec_inst[19:15]};
  vec_norm_mtvr_data[IR_DSTV_VLD]                 = 1'b1;
  vec_norm_mtvr_data[IR_DSTV_REG:IR_DSTV_REG-5]   = 6'b100000;
  vec_norm_mtvr_data[IR_INTMASK]                  = 1'b1;
  vec_norm_mtvr_data[IR_SPLIT]                    = 1'b1;
  vec_norm_mtvr_data[IR_LENGTH]                   = 1'b1;
  vec_norm_mtvr_data[IR_IID_PLUS:IR_IID_PLUS-3]   = vec_norm_split_num[3:0];
  end
// &CombEnd; @1836
end

assign vec_norm_srcv0_tmp = vec_src_switch && (vec_opivx || vec_opmvx || vec_opfvf && !vec_inst_fmv);

assign vec_norm_srcv1_tmp =!vec_src_switch && (vec_opivx || vec_opmvx || vec_opfvf && !vec_inst_fmv);
//----------------------------------------------------------
//                  normal inst 0/4
//----------------------------------------------------------
// &CombBeg; @1844
always @( vec_wide_mac
       or vec_norm_srcv1_tmp
       or vec_norm_pipe[9:0]
       or vec_ldst
       or vec_norm_inst_vmla
       or vec_norm_inst_0_finish
       or vec_norm_srcv1_vld
       or vec_inst_fmv
       or vec_norm_cur_2nd
       or vec_ld_srcv2_vld
       or vec_norm_srcv0_vld
       or vec_st
       or vec_norm_srcv2_vld
       or vec_inst_red
       or vec_norm_srcv1_vreg_0[4:0]
       or vec_wide_mul
       or vec_norm_srcvm_vld
       or vec_norm_srcv0_vreg_0[4:0]
       or vec_inst_sat
       or vec_ld
       or vec_inst[31:0]
       or vec_norm_destv_vreg_0[4:0]
       or vec_norm_srcv0_tmp
       or vec_type_narr
       or vec_inst_ereg
       or vec_type_cmp)
begin
  vec_norm_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_norm_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = (vec_wide_mul || vec_wide_mac) ? PIPE7 : vec_norm_pipe[9:0];
  vec_norm_split_inst0_data[IR_SPLIT_NUM-4:IR_SPLIT_NUM-6] ={vec_norm_cur_2nd,2'b00};
  vec_norm_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_norm_split_inst0_data[IR_SRC0_VLD]                   = vec_ldst;
  vec_norm_split_inst0_data[IR_SRC0_REG-1:IR_SRC0_REG-5]   = vec_inst[19:15];
  vec_norm_split_inst0_data[IR_SRCF1_VLD]                  = vec_inst_fmv;
  vec_norm_split_inst0_data[IR_SRCF1_REG:IR_SRCF1_REG-5]   ={1'b0,vec_inst[19:15]};
  vec_norm_split_inst0_data[IR_SRCV0_VLD]                  = vec_norm_srcv0_vld;
  vec_norm_split_inst0_data[IR_SRCV1_VLD]                  = vec_norm_srcv1_vld;
  vec_norm_split_inst0_data[IR_SRCV2_VLD]                  = vec_norm_srcv2_vld || vec_inst_red && vec_norm_cur_2nd || vec_type_narr || vec_type_cmp;
  vec_norm_split_inst0_data[IR_SRCVM_VLD]                  = vec_norm_srcvm_vld;
  vec_norm_split_inst0_data[IR_DSTV_VLD]                   =!vec_st;
  vec_norm_split_inst0_data[IR_SRCV0_REG]                  = vec_norm_srcv0_tmp;
  vec_norm_split_inst0_data[IR_SRCV1_REG]                  = vec_norm_srcv1_tmp;
  vec_norm_split_inst0_data[IR_SRCV0_REG-1:IR_SRCV0_REG-5] = vec_norm_srcv0_vreg_0[4:0];
  vec_norm_split_inst0_data[IR_SRCV1_REG-1:IR_SRCV1_REG-5] = vec_norm_srcv1_vreg_0[4:0];
  vec_norm_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vec_inst_red ? 6'b100001 : {1'b0,vec_norm_destv_vreg_0[4:0]};
  vec_norm_split_inst0_data[IR_DSTE_VLD]                   = vec_inst_sat || vec_inst_ereg;
  vec_norm_split_inst0_data[IR_VMLA]                       = vec_norm_inst_vmla;
  vec_norm_split_inst0_data[IR_INTMASK]                    = !vec_norm_inst_0_finish;
  vec_norm_split_inst0_data[IR_SPLIT]                      = !vec_norm_inst_0_finish;
  vec_norm_split_inst0_data[IR_IID_PLUS-3]                 = vec_inst_red;
  vec_norm_split_inst0_data[IR_LENGTH]                     = 1'b1;
  vec_norm_split_inst0_data[IR_VMB]                        = vec_ld && vec_ld_srcv2_vld;
  end
// &CombEnd; @1872
end

//----------------------------------------------------------
//                  normal inst 1/5
//----------------------------------------------------------
// &CombBeg; @1877
always @( vec_wide_mac
       or vec_norm_srcv1_tmp
       or vec_norm_inst_1_finish
       or vec_norm_pipe[9:0]
       or vec_ldst
       or vec_norm_inst_vmla
       or vec_norm_srcv1_vld
       or vec_inst_fmv
       or vec_norm_cur_2nd
       or vec_norm_srcv0_vreg_1[4:0]
       or vec_ld_srcv2_vld
       or vec_norm_srcv0_vld
       or vec_st
       or vec_norm_destv_vreg_1[4:0]
       or vec_norm_srcv2_vld
       or vec_inst_red
       or vec_wide_mul
       or vec_norm_srcvm_vld
       or vec_inst_sat
       or vec_ld
       or vec_inst[31:0]
       or vec_norm_srcv0_tmp
       or vec_type_narr
       or vec_inst_ereg
       or vec_type_cmp
       or vec_norm_srcv1_vreg_1[4:0])
begin
  vec_norm_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_norm_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = (vec_wide_mul || vec_wide_mac) ? PIPE6 : vec_norm_pipe[9:0];
  vec_norm_split_inst1_data[IR_SPLIT_NUM-4:IR_SPLIT_NUM-6] ={vec_norm_cur_2nd,2'b01};
  vec_norm_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_norm_split_inst1_data[IR_SRC0_VLD]                   = vec_ldst;
  vec_norm_split_inst1_data[IR_SRC0_REG-1:IR_SRC0_REG-5]   = vec_inst[19:15];
  vec_norm_split_inst1_data[IR_SRCF1_VLD]                  = vec_inst_fmv;
  vec_norm_split_inst1_data[IR_SRCF1_REG:IR_SRCF1_REG-5]   ={1'b0,vec_inst[19:15]};
  vec_norm_split_inst1_data[IR_SRCV0_VLD]                  = vec_norm_srcv0_vld;
  vec_norm_split_inst1_data[IR_SRCV1_VLD]                  = vec_norm_srcv1_vld;
  vec_norm_split_inst1_data[IR_SRCV2_VLD]                  = vec_norm_srcv2_vld || vec_inst_red || vec_type_narr || vec_type_cmp;
  vec_norm_split_inst1_data[IR_SRCVM_VLD]                  = vec_norm_srcvm_vld;
  vec_norm_split_inst1_data[IR_DSTV_VLD]                   =!vec_st;
  vec_norm_split_inst1_data[IR_SRCV0_REG]                  = vec_norm_srcv0_tmp;
  vec_norm_split_inst1_data[IR_SRCV1_REG]                  = vec_norm_srcv1_tmp;
  vec_norm_split_inst1_data[IR_SRCV0_REG-1:IR_SRCV0_REG-5] = vec_norm_srcv0_vreg_1[4:0];
  vec_norm_split_inst1_data[IR_SRCV1_REG-1:IR_SRCV1_REG-5] = vec_norm_srcv1_vreg_1[4:0];
  vec_norm_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vec_inst_red ? 6'b100001 : {1'b0,vec_norm_destv_vreg_1[4:0]};
  vec_norm_split_inst1_data[IR_DSTE_VLD]                   = vec_inst_sat || vec_inst_ereg;
  vec_norm_split_inst1_data[IR_VMLA]                       = vec_norm_inst_vmla;
  vec_norm_split_inst1_data[IR_INTMASK]                    =!vec_norm_inst_1_finish;
  vec_norm_split_inst1_data[IR_SPLIT]                      =!vec_norm_inst_1_finish;
  vec_norm_split_inst1_data[IR_IID_PLUS-3]                 = vec_inst_red;
  vec_norm_split_inst1_data[IR_LENGTH]                     = 1'b1;
  vec_norm_split_inst1_data[IR_VMB]                        = vec_ld && vec_ld_srcv2_vld;
  end
// &CombEnd; @1905
end

//----------------------------------------------------------
//                  normal inst 2/6
//----------------------------------------------------------
// &CombBeg; @1910
always @( vec_norm_destv_vreg_2[4:0]
       or vec_wide_mac
       or vec_norm_srcv1_tmp
       or vec_norm_pipe[9:0]
       or vec_ldst
       or vec_norm_inst_vmla
       or vec_norm_srcv1_vld
       or vec_norm_srcv1_vreg_2[4:0]
       or vec_inst_fmv
       or vec_norm_cur_2nd
       or vec_ld_srcv2_vld
       or vec_norm_srcv0_vld
       or vec_st
       or vec_norm_srcv2_vld
       or vec_inst_red
       or vec_wide_mul
       or vec_norm_srcvm_vld
       or vec_inst_sat
       or vec_ld
       or vec_inst[31:0]
       or vec_norm_srcv0_tmp
       or vec_type_narr
       or vec_inst_ereg
       or vec_type_cmp
       or vec_norm_srcv0_vreg_2[4:0])
begin
  vec_norm_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_norm_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   =(vec_wide_mul || vec_wide_mac) ? PIPE7 : vec_norm_pipe[9:0];
  vec_norm_split_inst2_data[IR_SPLIT_NUM-4:IR_SPLIT_NUM-6] ={vec_norm_cur_2nd,2'b10};
  vec_norm_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_norm_split_inst2_data[IR_SRC0_VLD]                   = vec_ldst;
  vec_norm_split_inst2_data[IR_SRC0_REG-1:IR_SRC0_REG-5]   = vec_inst[19:15];
  vec_norm_split_inst2_data[IR_SRCF1_VLD]                  = vec_inst_fmv;
  vec_norm_split_inst2_data[IR_SRCF1_REG:IR_SRCF1_REG-5]   ={1'b0,vec_inst[19:15]};
  vec_norm_split_inst2_data[IR_SRCV0_VLD]                  = vec_norm_srcv0_vld;
  vec_norm_split_inst2_data[IR_SRCV1_VLD]                  = vec_norm_srcv1_vld;
  vec_norm_split_inst2_data[IR_SRCV2_VLD]                  = vec_norm_srcv2_vld || vec_inst_red || vec_type_narr || vec_type_cmp;
  vec_norm_split_inst2_data[IR_SRCVM_VLD]                  = vec_norm_srcvm_vld;
  vec_norm_split_inst2_data[IR_DSTV_VLD]                   =!vec_st;
  vec_norm_split_inst2_data[IR_SRCV0_REG]                  = vec_norm_srcv0_tmp;
  vec_norm_split_inst2_data[IR_SRCV1_REG]                  = vec_norm_srcv1_tmp;
  vec_norm_split_inst2_data[IR_SRCV0_REG-1:IR_SRCV0_REG-5] = vec_norm_srcv0_vreg_2[4:0];
  vec_norm_split_inst2_data[IR_SRCV1_REG-1:IR_SRCV1_REG-5] = vec_norm_srcv1_vreg_2[4:0];
  vec_norm_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vec_inst_red ? 6'b100001 : {1'b0,vec_norm_destv_vreg_2[4:0]};
  vec_norm_split_inst2_data[IR_DSTE_VLD]                   = vec_inst_sat || vec_inst_ereg;
  vec_norm_split_inst2_data[IR_VMLA]                       = vec_norm_inst_vmla;
  vec_norm_split_inst2_data[IR_INTMASK]                    = 1'b1;
  vec_norm_split_inst2_data[IR_SPLIT]                      = 1'b1;
  vec_norm_split_inst2_data[IR_IID_PLUS-3]                 = vec_inst_red;
  vec_norm_split_inst2_data[IR_LENGTH]                     = 1'b1;
  vec_norm_split_inst2_data[IR_VMB]                        = vec_ld && vec_ld_srcv2_vld;
  end
// &CombEnd; @1938
end

//----------------------------------------------------------
//                  normal inst 3/7
//----------------------------------------------------------
// &CombBeg; @1943
always @( vec_wide_mac
       or vec_norm_srcv1_tmp
       or vec_norm_pipe[9:0]
       or vec_ldst
       or vec_norm_inst_vmla
       or vec_norm_srcv1_vld
       or vec_inst_fmv
       or vec_norm_cur_2nd
       or vec_ld_srcv2_vld
       or vec_norm_srcv0_vld
       or vec_norm_inst_3_finish
       or vec_st
       or vec_norm_srcv2_vld
       or vec_inst_red
       or vec_wide_mul
       or vec_norm_srcvm_vld
       or vec_norm_destv_vreg_3[4:0]
       or vec_norm_srcv0_vreg_3[4:0]
       or vec_inst_sat
       or vec_ld
       or vec_norm_srcv1_vreg_3[4:0]
       or vec_inst[31:0]
       or vec_norm_srcv0_tmp
       or vec_type_narr
       or vec_inst_ereg
       or vec_type_cmp)
begin
  vec_norm_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_norm_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   =(vec_wide_mul || vec_wide_mac) ? PIPE6 : vec_norm_pipe[9:0];
  vec_norm_split_inst3_data[IR_SPLIT_NUM-4:IR_SPLIT_NUM-6] ={vec_norm_cur_2nd,2'b11};
  vec_norm_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_norm_split_inst3_data[IR_SRC0_VLD]                   = vec_ldst;
  vec_norm_split_inst3_data[IR_SRC0_REG-1:IR_SRC0_REG-5]   = vec_inst[19:15];
  vec_norm_split_inst3_data[IR_SRCF1_VLD]                  = vec_inst_fmv;
  vec_norm_split_inst3_data[IR_SRCF1_REG:IR_SRCF1_REG-5]   ={1'b0,vec_inst[19:15]};
  vec_norm_split_inst3_data[IR_SRCV0_VLD]                  = vec_norm_srcv0_vld;
  vec_norm_split_inst3_data[IR_SRCV1_VLD]                  = vec_norm_srcv1_vld;
  vec_norm_split_inst3_data[IR_SRCV2_VLD]                  = vec_norm_srcv2_vld || vec_inst_red && !vec_norm_inst_3_finish || vec_type_narr||vec_type_cmp;
  vec_norm_split_inst3_data[IR_SRCVM_VLD]                  = vec_norm_srcvm_vld;
  vec_norm_split_inst3_data[IR_DSTV_VLD]                   =!vec_st;
  vec_norm_split_inst3_data[IR_SRCV0_REG]                  = vec_norm_srcv0_tmp;
  vec_norm_split_inst3_data[IR_SRCV1_REG]                  = vec_norm_srcv1_tmp || (vec_inst_red && vec_norm_inst_3_finish);
  vec_norm_split_inst3_data[IR_SRCV0_REG-1:IR_SRCV0_REG-5] = vec_norm_srcv0_vreg_3[4:0];
  vec_norm_split_inst3_data[IR_SRCV1_REG-1:IR_SRCV1_REG-5] =(vec_inst_red && vec_norm_inst_3_finish) ? 5'b00001 : vec_norm_srcv1_vreg_3[4:0];
  vec_norm_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     =(vec_inst_red && !vec_norm_inst_3_finish) ? 6'b100001 : {1'b0,vec_norm_destv_vreg_3[4:0]};
  vec_norm_split_inst3_data[IR_DSTE_VLD]                   = vec_inst_sat || vec_inst_ereg;
  vec_norm_split_inst3_data[IR_VMLA]                       = vec_norm_inst_vmla;
  vec_norm_split_inst3_data[IR_INTMASK]                    =!vec_norm_inst_3_finish;
  vec_norm_split_inst3_data[IR_SPLIT]                      =!vec_norm_inst_3_finish;
  vec_norm_split_inst3_data[IR_IID_PLUS-3]                 = vec_inst_red && !vec_norm_inst_3_finish;
  vec_norm_split_inst3_data[IR_LENGTH]                     = 1'b1;
  vec_norm_split_inst3_data[IR_VMB]                        = vec_ld && vec_ld_srcv2_vld;
  end
// &CombEnd; @1971
end


// &CombBeg; @1974
always @( vec_narr_sht
       or vec_norm_cur_mtvr)
begin
  vec_norm_dep_info[DEP_WIDTH-1:0]        = {DEP_WIDTH{1'b0}};
  if(1'b1) begin
  vec_norm_dep_info[DEP_INST01_SRCV1_MASK] = vec_narr_sht && !vec_norm_cur_mtvr;
  vec_norm_dep_info[DEP_INST23_SRCV1_MASK] = vec_narr_sht && !vec_norm_cur_mtvr;
  end
// &CombEnd; @1980
end

assign vec_norm_inst0_data[IR_WIDTH-1:0] = vec_norm_cur_mtvr ? vec_norm_mtvr_data[IR_WIDTH-1:0]
                                                             : vec_norm_split_inst0_data[IR_WIDTH-1:0];

assign vec_norm_inst1_data[IR_WIDTH-1:0] = vec_norm_split_inst1_data[IR_WIDTH-1:0];
assign vec_norm_inst2_data[IR_WIDTH-1:0] = vec_norm_split_inst2_data[IR_WIDTH-1:0];
assign vec_norm_inst3_data[IR_WIDTH-1:0] = vec_norm_split_inst3_data[IR_WIDTH-1:0];

assign vec_norm_inst_vld[0] = vec_norm_cur_mtvr || vec_norm_cur_1st || vec_norm_cur_2nd;
assign vec_norm_inst_vld[1] = vec_norm_cur_1st && !vec_norm_inst_0_finish ||  vec_norm_cur_2nd;
assign vec_norm_inst_vld[2] = vec_norm_cur_1st && !vec_norm_inst_0_finish && !vec_norm_inst_1_finish || vec_norm_cur_2nd;
assign vec_norm_inst_vld[3] = vec_norm_cur_1st && !vec_norm_inst_0_finish && !vec_norm_inst_1_finish || vec_norm_cur_2nd;

//==========================================================
//               NORMAL WIDDEN Instructions split
//==========================================================
parameter VEC_FNORM_WF_IDLE = 1'b0;
parameter VEC_FNORM_WF_BUSY = 1'b1;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_fnorm_wf_split_clk_en = ctrl_split_long_id_inst_vld
                           && dp_split_fnorm_wf_vld
                           ||!(vec_fnorm_wf_cur_state == VEC_FNORM_WF_IDLE);

// &Instance("gated_clk_cell", "x_vec_fnorm_wf_split_gated_clk"); @2007
gated_clk_cell  x_vec_fnorm_wf_split_gated_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (vec_fnorm_wf_split_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (vec_fnorm_wf_split_clk_en),
  .module_en                 (cp0_idu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect(.clk_in      (forever_cpuclk), @2008
//          .external_en (1'b0), @2009
//          .global_en   (cp0_yy_clk_en), @2010
//          .module_en   (cp0_idu_icg_en), @2011
//          .local_en    (vec_fnorm_wf_split_clk_en), @2012
//          .clk_out     (vec_fnorm_wf_split_clk)); @2013

always @(posedge vec_fnorm_wf_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_fnorm_wf_cur_state <= VEC_FNORM_WF_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_fnorm_wf_cur_state <= VEC_FNORM_WF_IDLE;
  else
    vec_fnorm_wf_cur_state <= vec_fnorm_wf_next_state;
end
//
always @(posedge vec_fnorm_wf_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_fnorm_wf_cnt[3:0] <= 4'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_fnorm_wf_cnt[3:0] <= 4'b0;
  else if(fnorm_wf_cnt_end)
    vec_fnorm_wf_cnt[3:0] <= 4'b0;
  else if(fnorm_wf_cnt_en)
    vec_fnorm_wf_cnt[3:0] <= vec_fnorm_wf_cnt[3:0] + 4'd1;
end
assign fnorm_wf_total_cnt_num[3:0] = (4'b1 << {dp_split_long_vlmul[1:0]});
                                                                      
assign fnorm_wf_cnt_end      = (vec_fnorm_wf_cnt[3:0] == fnorm_wf_total_cnt_num[3:0]) 
                               && !ctrl_split_long_id_stall;
assign fnorm_wf_fst_round    = vec_fnorm_wf_cnt[3:0] == 4'b0;

assign vec_fnorm_wf_sm_start    = ctrl_split_long_id_inst_vld
                              && dp_split_fnorm_wf_vld
                              && !ctrl_split_long_id_stall;


assign vec_fnorm_wf_split_busy  = vec_fnorm_wf_sm_start &&
                               (vec_fnorm_wf_cur_state ==VEC_FNORM_WF_IDLE) || 
                               (vec_fnorm_wf_cur_state ==VEC_FNORM_WF_BUSY);
assign vec_fnorm_wf_split_stall = vec_fnorm_wf_split_busy && !fnorm_wf_cnt_end;
assign fnorm_wf_cnt_en          = !ctrl_split_long_id_stall && vec_fnorm_wf_split_busy;
//


// &CombBeg; @2055
always @( vec_fnorm_wf_cur_state
       or ctrl_split_long_id_stall
       or fnorm_wf_cnt_end
       or vec_fnorm_wf_sm_start)
begin
  case(vec_fnorm_wf_cur_state)
  VEC_FNORM_WF_IDLE  : if(vec_fnorm_wf_sm_start&&!fnorm_wf_cnt_end)
                     vec_fnorm_wf_next_state = VEC_FNORM_WF_BUSY;
                   else
                     vec_fnorm_wf_next_state = VEC_FNORM_WF_IDLE;
  VEC_FNORM_WF_BUSY  : if(!ctrl_split_long_id_stall && fnorm_wf_cnt_end)
                     vec_fnorm_wf_next_state = VEC_FNORM_WF_IDLE;
                   else 
                     vec_fnorm_wf_next_state = VEC_FNORM_WF_BUSY;
  default        :   vec_fnorm_wf_next_state = VEC_FNORM_WF_IDLE;
  endcase
// &CombEnd; @2067
end

assign vec_fnorm_wf_srcv0_vreg_1[4:0] = vec_inst[24:20] | {1'b0,vec_fnorm_wf_cnt[2 :0]-3'b1,1'b0};
assign vec_fnorm_wf_dest_vreg_1[4:0]  = vec_inst[11:7]  | {1'b0,vec_fnorm_wf_cnt[2 :0]-3'b1,1'b0};
assign vec_fnorm_wf_dest_vreg_3[4:0]  = vec_inst[11:7]  | {1'b0,vec_fnorm_wf_cnt[2 :0]-3'b1,1'b1};
assign vec_fnorm_wf_srcv0_vreg_3[4:0] = vec_inst[24:20] | {1'b0,vec_fnorm_wf_cnt[2 :0]-3'b1,1'b1};


assign vec_fnorm_wf_srcv1_vreg[4:0]  = vec_inst[19:15] ;
assign vec_fnorm_wf_base_cnt[2:0]    = vec_fnorm_wf_cnt[2 :0]-3'b1;
assign vec_mvvf_inst_cnt[4:0]        = (5'b100 << {dp_split_long_vlmul[1:0]}) - 5'b1;
//----------------------------------------------------------
//                  float order split inst 0/4
//----------------------------------------------------------
assign vfmvvf_inst[31:0]             =  {6'b010111,1'b1,5'b0,vec_inst[19:15],3'b101,5'b00000,vec_inst[6:0]};
// &CombBeg; @2082
always @( vec_mvvf_inst_cnt[3:0]
       or vfmvvf_inst[31:0]
       or vec_fnorm_wf_srcv1_vreg[4:0]
       or fnorm_wf_fst_round
       or vec_inst[25]
       or vec_fnorm_wf_base_cnt[1:0]
       or fcvtw_inst[31:0])
begin
  vec_fnorm_wf_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fnorm_wf_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE7;
  vec_fnorm_wf_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = fnorm_wf_fst_round ? 7'b0 : {1'b0,3'b100,vec_fnorm_wf_base_cnt[1 :0],1'b0};
  vec_fnorm_wf_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = fnorm_wf_fst_round ? vfmvvf_inst[31:0] : fcvtw_inst[31:0];
  vec_fnorm_wf_split_inst0_data[IR_SRCV0_VLD]                  = !fnorm_wf_fst_round;
  vec_fnorm_wf_split_inst0_data[IR_SRCV1_VLD]                  = !fnorm_wf_fst_round;
  vec_fnorm_wf_split_inst0_data[IR_SRCV2_VLD]                  = !fnorm_wf_fst_round && !vec_inst[25];
  vec_fnorm_wf_split_inst0_data[IR_SRCVM_VLD]                  = !fnorm_wf_fst_round && !vec_inst[25];
  vec_fnorm_wf_split_inst0_data[IR_SRCF1_VLD]                  = fnorm_wf_fst_round;
  vec_fnorm_wf_split_inst0_data[IR_SRCF1_REG:IR_SRCF1_REG-5]   = {1'b0,vec_fnorm_wf_srcv1_vreg[4:0]};
  vec_fnorm_wf_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fnorm_wf_split_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = 6'b100000;
  vec_fnorm_wf_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = {1'b0,vec_fnorm_wf_srcv1_vreg[4:0]}; //tmp from first round
  vec_fnorm_wf_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = fnorm_wf_fst_round ? 6'b100000 : 6'b100001;
  vec_fnorm_wf_split_inst0_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fnorm_wf_split_inst0_data[IR_VMLA]                       = 1'b0;
  vec_fnorm_wf_split_inst0_data[IR_INTMASK]                    = 1'b1;
  vec_fnorm_wf_split_inst0_data[IR_SPLIT]                      = 1'b1;
  vec_fnorm_wf_split_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = fnorm_wf_fst_round ? vec_mvvf_inst_cnt[3:0] :4'b1;
  vec_fnorm_wf_split_inst0_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2105
end

//----------------------------------------------------------
//             /     fnorm_wfal inst 1/5
//----------------------------------------------------------
// &CombBeg; @2110
always @( vec_fnorm_wf_srcv0_vreg_1[4:0]
       or vec_inst[31:0]
       or vec_fnorm_wf_base_cnt[1:0]
       or vec_fnorm_wf_dest_vreg_1[4:0])
begin
  vec_fnorm_wf_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fnorm_wf_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fnorm_wf_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {4'b0,vec_fnorm_wf_base_cnt[1 :0],1'b0};
  vec_fnorm_wf_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_fnorm_wf_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fnorm_wf_split_inst1_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fnorm_wf_split_inst1_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fnorm_wf_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fnorm_wf_split_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fnorm_wf_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_fnorm_wf_srcv0_vreg_1[4:0]};
  vec_fnorm_wf_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = 6'b100001;
  vec_fnorm_wf_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = {1'b0,vec_fnorm_wf_dest_vreg_1[4:0]};
  vec_fnorm_wf_split_inst1_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fnorm_wf_split_inst1_data[IR_VMLA]                       = 1'b0;
  vec_fnorm_wf_split_inst1_data[IR_INTMASK]                    = 1'b1;
  vec_fnorm_wf_split_inst1_data[IR_SPLIT]                      = 1'b1;
  vec_fnorm_wf_split_inst1_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'b0;
  vec_fnorm_wf_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2131
end

//----------------------------------------------------------
//                  fnorm_wfal inst 2/6
//----------------------------------------------------------
// &CombBeg; @2136
always @( vec_fnorm_wf_srcv1_vreg[4:0]
       or vec_inst[25]
       or vec_fnorm_wf_base_cnt[1:0]
       or fcvtw_inst[31:0])
begin
  vec_fnorm_wf_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fnorm_wf_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE7;
  vec_fnorm_wf_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,3'b100,vec_fnorm_wf_base_cnt[1 :0],1'b1};
  vec_fnorm_wf_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = fcvtw_inst[31:0];
  vec_fnorm_wf_split_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fnorm_wf_split_inst2_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fnorm_wf_split_inst2_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fnorm_wf_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fnorm_wf_split_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fnorm_wf_split_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = 6'b100000;
  vec_fnorm_wf_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = {1'b0,vec_fnorm_wf_srcv1_vreg[4:0]};
  vec_fnorm_wf_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100001;
  vec_fnorm_wf_split_inst2_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fnorm_wf_split_inst2_data[IR_VMLA]                       = 1'b0;
  vec_fnorm_wf_split_inst2_data[IR_INTMASK]                    = 1'b1;
  vec_fnorm_wf_split_inst2_data[IR_SPLIT]                      = 1'b1;
  vec_fnorm_wf_split_inst2_data[IR_IID_PLUS-3]                 = 1'b1;
  vec_fnorm_wf_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2157
end

//----------------------------------------------------------
//                  fnorm_wfal inst 3/7
//----------------------------------------------------------

// &CombBeg; @2163
always @( vec_fnorm_wf_srcv0_vreg_3[4:0]
       or fnorm_wf_cnt_end
       or vec_fnorm_wf_dest_vreg_3[4:0]
       or vec_inst[31:0]
       or vec_fnorm_wf_base_cnt[1:0])
begin
  vec_fnorm_wf_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fnorm_wf_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fnorm_wf_split_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {4'b0,vec_fnorm_wf_base_cnt[1 :0],1'b1};
  vec_fnorm_wf_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_fnorm_wf_split_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fnorm_wf_split_inst3_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fnorm_wf_split_inst3_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fnorm_wf_split_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fnorm_wf_split_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fnorm_wf_split_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_fnorm_wf_srcv0_vreg_3[4:0]};
  vec_fnorm_wf_split_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = 6'b100001;
  vec_fnorm_wf_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = {1'b0,vec_fnorm_wf_dest_vreg_3[4:0]};
  vec_fnorm_wf_split_inst3_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fnorm_wf_split_inst3_data[IR_VMLA]                       = 1'b0;
  vec_fnorm_wf_split_inst3_data[IR_INTMASK]                    = !fnorm_wf_cnt_end;
  vec_fnorm_wf_split_inst3_data[IR_SPLIT]                      = !fnorm_wf_cnt_end;
  vec_fnorm_wf_split_inst3_data[IR_IID_PLUS-3]                 = 1'b0;
  vec_fnorm_wf_split_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2184
end

assign vec_fnorm_wf_dep_info[DEP_WIDTH-1:0]  = {DEP_WIDTH{1'b0}};

assign vec_fnorm_wf_inst0_data[IR_WIDTH-1:0] = vec_fnorm_wf_split_inst0_data[IR_WIDTH-1:0];
assign vec_fnorm_wf_inst1_data[IR_WIDTH-1:0] = vec_fnorm_wf_split_inst1_data[IR_WIDTH-1:0];
assign vec_fnorm_wf_inst2_data[IR_WIDTH-1:0] = vec_fnorm_wf_split_inst2_data[IR_WIDTH-1:0];
assign vec_fnorm_wf_inst3_data[IR_WIDTH-1:0] = vec_fnorm_wf_split_inst3_data[IR_WIDTH-1:0];
assign vec_fnorm_wf_split_inst0_sew[2:0]  = dp_split_long_vsew[2:0] ;
assign vec_fnorm_wf_split_inst1_sew[2:0]  = dp_split_w_vsew[2:0];
assign vec_fnorm_wf_split_inst2_sew[2:0]  = dp_split_long_vsew[2:0];
assign vec_fnorm_wf_split_inst3_sew[2:0]  = dp_split_w_vsew[2:0];

assign vec_fnorm_wf_split_inst0_lmul[1:0]  = dp_split_long_vlmul[1:0] ;
assign vec_fnorm_wf_split_inst1_lmul[1:0]  = dp_split_w_vlmul[1:0];
assign vec_fnorm_wf_split_inst2_lmul[1:0]  = dp_split_long_vlmul[1:0];
assign vec_fnorm_wf_split_inst3_lmul[1:0]  = dp_split_w_vlmul[1:0];

assign vec_fnorm_wf_inst_vld[0] = vec_fnorm_wf_split_busy;
assign vec_fnorm_wf_inst_vld[1] = !fnorm_wf_fst_round && vec_fnorm_wf_split_busy;
assign vec_fnorm_wf_inst_vld[2] = !fnorm_wf_fst_round && vec_fnorm_wf_split_busy;
assign vec_fnorm_wf_inst_vld[3] = !fnorm_wf_fst_round && vec_fnorm_wf_split_busy;

//==========================================================
//               NORMAL WIDDEN Instructions split
//==========================================================
parameter VEC_FNORM_WV_IDLE = 1'b0;
parameter VEC_FNORM_WV_BUSY = 1'b1;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_fnorm_wv_split_clk_en = ctrl_split_long_id_inst_vld
                           && dp_split_fnorm_wv_vld
                           ||!(vec_fnorm_wv_cur_state == VEC_FNORM_WV_IDLE);

// &Instance("gated_clk_cell", "x_vec_fnorm_wv_split_gated_clk"); @2220
gated_clk_cell  x_vec_fnorm_wv_split_gated_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (vec_fnorm_wv_split_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (vec_fnorm_wv_split_clk_en),
  .module_en                 (cp0_idu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect(.clk_in      (forever_cpuclk), @2221
//          .external_en (1'b0), @2222
//          .global_en   (cp0_yy_clk_en), @2223
//          .module_en   (cp0_idu_icg_en), @2224
//          .local_en    (vec_fnorm_wv_split_clk_en), @2225
//          .clk_out     (vec_fnorm_wv_split_clk)); @2226

always @(posedge vec_fnorm_wv_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_fnorm_wv_cur_state <= VEC_FNORM_WV_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_fnorm_wv_cur_state <= VEC_FNORM_WV_IDLE;
  else
    vec_fnorm_wv_cur_state <= vec_fnorm_wv_next_state;
end
//
always @(posedge vec_fnorm_wv_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_fnorm_wv_cnt[3:0] <= 4'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_fnorm_wv_cnt[3:0] <= 4'b0;
  else if(fnorm_wv_cnt_end)
    vec_fnorm_wv_cnt[3:0] <= 4'b0;
  else if(fnorm_wv_cnt_en)
    vec_fnorm_wv_cnt[3:0] <= vec_fnorm_wv_cnt[3:0] + 4'd1;
end
assign fnorm_wv_total_cnt_num[3:0] = (4'b1 << dp_split_long_vlmul[1:0]) - 4'b1;
                                                                      
assign fnorm_wv_cnt_end      = (vec_fnorm_wv_cnt[3:0] == fnorm_wv_total_cnt_num[3:0]) 
                                && !ctrl_split_long_id_stall;

assign vec_fnorm_wv_sm_start    = ctrl_split_long_id_inst_vld
                              && dp_split_fnorm_wv_vld
                              && !ctrl_split_long_id_stall;


assign vec_fnorm_wv_split_busy  = vec_fnorm_wv_sm_start &&
                               (vec_fnorm_wv_cur_state ==VEC_FNORM_WV_IDLE) || 
                               (vec_fnorm_wv_cur_state  ==VEC_FNORM_WV_BUSY);
assign vec_fnorm_wv_split_stall = vec_fnorm_wv_split_busy && !fnorm_wv_cnt_end;
assign fnorm_wv_cnt_en          = !ctrl_split_long_id_stall && vec_fnorm_wv_split_busy;
//


// &CombBeg; @2267
always @( ctrl_split_long_id_stall
       or vec_fnorm_wv_cur_state
       or vec_fnorm_wv_sm_start
       or fnorm_wv_cnt_end)
begin
  case(vec_fnorm_wv_cur_state)
  VEC_FNORM_WV_IDLE  : if(vec_fnorm_wv_sm_start && !fnorm_wv_cnt_end)
                     vec_fnorm_wv_next_state = VEC_FNORM_WV_BUSY;
                   else
                     vec_fnorm_wv_next_state = VEC_FNORM_WV_IDLE;
  VEC_FNORM_WV_BUSY  : if(!ctrl_split_long_id_stall && fnorm_wv_cnt_end)
                     vec_fnorm_wv_next_state = VEC_FNORM_WV_IDLE;
                   else 
                     vec_fnorm_wv_next_state = VEC_FNORM_WV_BUSY;
  default        :   vec_fnorm_wv_next_state = VEC_FNORM_WV_IDLE;
  endcase
// &CombEnd; @2279
end

assign vec_fnorm_wv_srcv0_vreg_1[4:0] = vec_inst[24:20] | {1'b0,vec_fnorm_wv_cnt[2 :0],1'b0};
assign vec_fnorm_wv_dest_vreg_1[4:0]  = vec_inst[11:7]  | {1'b0,vec_fnorm_wv_cnt[2 :0],1'b0};
assign vec_fnorm_wv_dest_vreg_3[4:0]  = vec_inst[11:7]  | {1'b0,vec_fnorm_wv_cnt[2 :0],1'b1};
assign vec_fnorm_wv_srcv0_vreg_3[4:0] = vec_inst[24:20] | {1'b0,vec_fnorm_wv_cnt[2 :0],1'b1};


assign vec_fnorm_wv_srcv1_vreg[4:0]  = vec_inst[19:15] | {1'b0,vec_fnorm_wv_cnt[3 :0]};

//----------------------------------------------------------
//                  float order split inst 0/4
//----------------------------------------------------------
// &CombBeg; @2292
always @( vec_inst[25]
       or vec_fnorm_wv_cnt[1:0]
       or vec_fnorm_wv_srcv1_vreg[4:0]
       or fcvtw_inst[31:0])
begin
  vec_fnorm_wv_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fnorm_wv_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE7;
  vec_fnorm_wv_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,3'b100,vec_fnorm_wv_cnt[1 :0],1'b0};
  vec_fnorm_wv_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = fcvtw_inst[31:0];
  vec_fnorm_wv_split_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fnorm_wv_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fnorm_wv_split_inst0_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fnorm_wv_split_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fnorm_wv_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fnorm_wv_split_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_fnorm_wv_srcv1_vreg[4:0]};
  vec_fnorm_wv_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = {1'b0,vec_fnorm_wv_srcv1_vreg[4:0]};
  vec_fnorm_wv_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100000;
  vec_fnorm_wv_split_inst0_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fnorm_wv_split_inst0_data[IR_VMLA]                       = 1'b0;
  vec_fnorm_wv_split_inst0_data[IR_INTMASK]                    = 1'b1;
  vec_fnorm_wv_split_inst0_data[IR_SPLIT]                      = 1'b1;
  vec_fnorm_wv_split_inst0_data[IR_IID_PLUS-3]                 = 1'b1;
  vec_fnorm_wv_split_inst0_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2313
end

//----------------------------------------------------------
//             /     fnorm_wval inst 1/5
//----------------------------------------------------------
// &CombBeg; @2318
always @( vec_fnorm_wv_dest_vreg_1[4:0]
       or vec_inst[31:0]
       or vec_fnorm_wv_cnt[1:0]
       or vec_fnorm_wv_srcv0_vreg_1[4:0])
begin
  vec_fnorm_wv_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fnorm_wv_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fnorm_wv_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {4'b0,vec_fnorm_wv_cnt[1 :0],1'b0};
  vec_fnorm_wv_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_fnorm_wv_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fnorm_wv_split_inst1_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fnorm_wv_split_inst1_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fnorm_wv_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fnorm_wv_split_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fnorm_wv_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_fnorm_wv_srcv0_vreg_1[4:0]};
  vec_fnorm_wv_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = 6'b100000;
  vec_fnorm_wv_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = {1'b0,vec_fnorm_wv_dest_vreg_1[4:0]};
  vec_fnorm_wv_split_inst1_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fnorm_wv_split_inst1_data[IR_VMLA]                       = 1'b0;
  vec_fnorm_wv_split_inst1_data[IR_INTMASK]                    = 1'b1;
  vec_fnorm_wv_split_inst1_data[IR_SPLIT]                      = 1'b1;
  vec_fnorm_wv_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2338
end

//----------------------------------------------------------
//                  fnorm_wval inst 2/6
//----------------------------------------------------------
// &CombBeg; @2343
always @( vec_inst[25]
       or vec_fnorm_wv_cnt[1:0]
       or vec_fnorm_wv_srcv1_vreg[4:0]
       or fcvtw_inst[31:0])
begin
  vec_fnorm_wv_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fnorm_wv_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE7;
  vec_fnorm_wv_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,3'b100,vec_fnorm_wv_cnt[1 :0],1'b1};
  vec_fnorm_wv_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = fcvtw_inst[31:0];
  vec_fnorm_wv_split_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fnorm_wv_split_inst2_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fnorm_wv_split_inst2_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fnorm_wv_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fnorm_wv_split_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fnorm_wv_split_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_fnorm_wv_srcv1_vreg[4:0]};
  vec_fnorm_wv_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = {1'b0,vec_fnorm_wv_srcv1_vreg[4:0]};
  vec_fnorm_wv_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100000;
  vec_fnorm_wv_split_inst2_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fnorm_wv_split_inst2_data[IR_VMLA]                       = 1'b0;
  vec_fnorm_wv_split_inst2_data[IR_INTMASK]                    = 1'b1;
  vec_fnorm_wv_split_inst2_data[IR_SPLIT]                      = 1'b1;
  vec_fnorm_wv_split_inst2_data[IR_IID_PLUS-3]                 = 1'b1;
  vec_fnorm_wv_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2364
end

//----------------------------------------------------------
//                  fnorm_wval inst 3/7
//----------------------------------------------------------

// &CombBeg; @2370
always @( vec_fnorm_wv_dest_vreg_3[4:0]
       or vec_fnorm_wv_srcv0_vreg_3[4:0]
       or fnorm_wv_cnt_end
       or vec_inst[31:0]
       or vec_fnorm_wv_cnt[1:0])
begin
  vec_fnorm_wv_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fnorm_wv_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fnorm_wv_split_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {4'b0,vec_fnorm_wv_cnt[1 :0],1'b1};
  vec_fnorm_wv_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_fnorm_wv_split_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fnorm_wv_split_inst3_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fnorm_wv_split_inst3_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fnorm_wv_split_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fnorm_wv_split_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fnorm_wv_split_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_fnorm_wv_srcv0_vreg_3[4:0]};
  vec_fnorm_wv_split_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = 6'b100000;
  vec_fnorm_wv_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = {1'b0,vec_fnorm_wv_dest_vreg_3[4:0]};
  vec_fnorm_wv_split_inst3_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fnorm_wv_split_inst3_data[IR_VMLA]                       = 1'b0;
  vec_fnorm_wv_split_inst3_data[IR_INTMASK]                    = !fnorm_wv_cnt_end;
  vec_fnorm_wv_split_inst3_data[IR_SPLIT]                      = !fnorm_wv_cnt_end;
  vec_fnorm_wv_split_inst3_data[IR_IID_PLUS-3]                 = 1'b0;
  vec_fnorm_wv_split_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2391
end


assign  vec_fnorm_wv_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};

assign vec_fnorm_wv_inst0_data[IR_WIDTH-1:0] = vec_fnorm_wv_split_inst0_data[IR_WIDTH-1:0];
assign vec_fnorm_wv_inst1_data[IR_WIDTH-1:0] = vec_fnorm_wv_split_inst1_data[IR_WIDTH-1:0];
assign vec_fnorm_wv_inst2_data[IR_WIDTH-1:0] = vec_fnorm_wv_split_inst2_data[IR_WIDTH-1:0];
assign vec_fnorm_wv_inst3_data[IR_WIDTH-1:0] = vec_fnorm_wv_split_inst3_data[IR_WIDTH-1:0];
assign vec_fnorm_wv_split_inst0_sew[2:0]  = dp_split_long_vsew[2:0] ;
assign vec_fnorm_wv_split_inst1_sew[2:0]  = dp_split_w_vsew[2:0];
assign vec_fnorm_wv_split_inst2_sew[2:0]  = dp_split_long_vsew[2:0];
assign vec_fnorm_wv_split_inst3_sew[2:0]  = dp_split_w_vsew[2:0];

assign vec_fnorm_wv_split_inst0_lmul[1:0]  = dp_split_long_vlmul[1:0] ;
assign vec_fnorm_wv_split_inst1_lmul[1:0]  = dp_split_w_vlmul[1:0];
assign vec_fnorm_wv_split_inst2_lmul[1:0]  = dp_split_long_vlmul[1:0];
assign vec_fnorm_wv_split_inst3_lmul[1:0]  = dp_split_w_vlmul[1:0];


assign vec_fnorm_wv_inst_vld[0] = vec_fnorm_wv_split_busy;
assign vec_fnorm_wv_inst_vld[1] = vec_fnorm_wv_split_busy;
assign vec_fnorm_wv_inst_vld[2] = vec_fnorm_wv_split_busy;
assign vec_fnorm_wv_inst_vld[3] = vec_fnorm_wv_split_busy;

//==========================================================
//               VECTOR FLOATING POINT REDUCTION INST
//==========================================================
assign vec_fred_inst_vld[3:0]            = vec_fored_inst_vld[3:0]     | vec_funored_inst_vld[3:0] 
                                         | vec_funored_w_inst_vld[3:0] | vec_fored_w_inst_vld[3:0] 
                                         | vec_fnorm_wv_inst_vld[3:0]  | vec_fnorm_wf_inst_vld[3:0];
assign vec_fred_split_stall              = vec_fored_split_stall      || vec_funored_split_stall 
                                         || vec_funored_w_split_stall || vec_fored_w_split_stall
                                         || vec_fnorm_wv_split_stall  || vec_fnorm_wf_split_stall;
assign vec_fred_dep_info[DEP_WIDTH-1:0]  = {DEP_WIDTH{dp_split_fored_vld}}        & vec_fored_dep_info[DEP_WIDTH-1:0]     |
                                           {DEP_WIDTH{dp_split_unfored_vld}}      & vec_funored_dep_info[DEP_WIDTH-1:0]   |
                                           {DEP_WIDTH{dp_split_unfored_w_vld}}    & vec_funored_w_dep_info[DEP_WIDTH-1:0] |
                                           {DEP_WIDTH{dp_split_fored_w_vld}}      & vec_fored_w_dep_info[DEP_WIDTH-1:0]   |
                                           {DEP_WIDTH{dp_split_fnorm_wv_vld}}     & vec_fnorm_wv_dep_info[DEP_WIDTH-1:0] |
                                           {DEP_WIDTH{dp_split_fnorm_wf_vld}}     & vec_fnorm_wf_dep_info[DEP_WIDTH-1:0];

assign vec_fred_inst0_data[IR_WIDTH-1:0] = {IR_WIDTH{vec_fored_inst_vld[0]}}      & vec_fored_inst0_data[IR_WIDTH-1:0]     | 
                                           {IR_WIDTH{vec_funored_inst_vld[0]}}    & vec_funored_inst0_data[IR_WIDTH-1:0]   |
                                           {IR_WIDTH{vec_funored_w_inst_vld[0]}}  & vec_funored_w_inst0_data[IR_WIDTH-1:0] |
                                           {IR_WIDTH{vec_fored_w_inst_vld[0]}}    & vec_fored_w_inst0_data[IR_WIDTH-1:0]   |
                                           {IR_WIDTH{vec_fnorm_wv_inst_vld[0]}}   & vec_fnorm_wv_inst0_data[IR_WIDTH-1:0]  |
                                           {IR_WIDTH{vec_fnorm_wf_inst_vld[0]}}   & vec_fnorm_wf_inst0_data[IR_WIDTH-1:0];

assign vec_fred_inst1_data[IR_WIDTH-1:0] = {IR_WIDTH{vec_fored_inst_vld[1]}}      & vec_fored_inst1_data[IR_WIDTH-1:0]     | 
                                           {IR_WIDTH{vec_funored_inst_vld[1]}}    & vec_funored_inst1_data[IR_WIDTH-1:0]   |
                                           {IR_WIDTH{vec_funored_w_inst_vld[1]}}  & vec_funored_w_inst1_data[IR_WIDTH-1:0] |
                                           {IR_WIDTH{vec_fored_w_inst_vld[1]}}    & vec_fored_w_inst1_data[IR_WIDTH-1:0]   |
                                           {IR_WIDTH{vec_fnorm_wv_inst_vld[1]}}   & vec_fnorm_wv_inst1_data[IR_WIDTH-1:0]  |
                                           {IR_WIDTH{vec_fnorm_wf_inst_vld[1]}}   & vec_fnorm_wf_inst1_data[IR_WIDTH-1:0];

assign vec_fred_inst2_data[IR_WIDTH-1:0] = {IR_WIDTH{vec_fored_inst_vld[2]}}      & vec_fored_inst2_data[IR_WIDTH-1:0]     | 
                                           {IR_WIDTH{vec_funored_inst_vld[2]}}    & vec_funored_inst2_data[IR_WIDTH-1:0]   |
                                           {IR_WIDTH{vec_funored_w_inst_vld[2]}}  & vec_funored_w_inst2_data[IR_WIDTH-1:0] |
                                           {IR_WIDTH{vec_fored_w_inst_vld[2]}}    & vec_fored_w_inst2_data[IR_WIDTH-1:0]   |
                                           {IR_WIDTH{vec_fnorm_wv_inst_vld[2]}}    & vec_fnorm_wv_inst2_data[IR_WIDTH-1:0] |
                                           {IR_WIDTH{vec_fnorm_wf_inst_vld[2]}}    & vec_fnorm_wf_inst2_data[IR_WIDTH-1:0];

assign vec_fred_inst3_data[IR_WIDTH-1:0] = {IR_WIDTH{vec_fored_inst_vld[3]}}      & vec_fored_inst3_data[IR_WIDTH-1:0]     | 
                                           {IR_WIDTH{vec_funored_inst_vld[3]}}    & vec_funored_inst3_data[IR_WIDTH-1:0]   |
                                           {IR_WIDTH{vec_funored_w_inst_vld[3]}}  & vec_funored_w_inst3_data[IR_WIDTH-1:0] |
                                           {IR_WIDTH{vec_fored_w_inst_vld[3]}}    & vec_fored_w_inst3_data[IR_WIDTH-1:0]   |
                                           {IR_WIDTH{vec_fnorm_wv_inst_vld[3]}}   & vec_fnorm_wv_inst3_data[IR_WIDTH-1:0]  |
                                           {IR_WIDTH{vec_fnorm_wf_inst_vld[3]}}   & vec_fnorm_wf_inst3_data[IR_WIDTH-1:0];

assign dp_split_fored_vld                = dp_split_long_type[VEC_FRED_TYPE] 
                                           && ((vec_inst[31:26] == 6'b000011) ||
                                             ((vec_inst[31:30] == 2'b00) && (vec_inst[28:26]==3'b001 
                                                                                   || vec_inst[28:26]==3'b101 
                                                                                   || vec_inst[28:26]==3'b111) 
                                                                                   && (dp_split_long_vsew[2:0] == 3'b011) ));
assign dp_split_fored_w_vld              = dp_split_long_type[VEC_FRED_TYPE] 
                                          && ((vec_inst[31:26] == 6'b110011) || (vec_inst[31:26] == 6'b110001) 
                                                                                && (dp_split_long_vsew[2:0] == 3'b010))  ;                                         
assign dp_split_unfored_vld              = dp_split_long_type[VEC_FRED_TYPE] 
                                           && (vec_inst[31:30] == 2'b00) && (vec_inst[28:26]==3'b001 
                                                                            || vec_inst[28:26]==3'b101 
                                                                            || vec_inst[28:26]==3'b111) && (dp_split_long_vsew[2:0] != 3'b011);
assign dp_split_unfored_w_vld             = dp_split_long_type[VEC_FRED_TYPE] 
                                           && (vec_inst[31:26] == 6'b110001) && (dp_split_long_vsew[2:0] != 3'b010) ;
assign dp_split_fnorm_wv_vld              = dp_split_long_type[VEC_FRED_TYPE]
                                           && (vec_inst[31:28] == 4'b1101) && vec_opfvv;
assign dp_split_fnorm_wf_vld              = dp_split_long_type[VEC_FRED_TYPE]
                                           && (vec_inst[31:28] == 4'b1101) && vec_opfvf;

assign dp_split_w_vsew[2:0]               = dp_split_long_vsew[2:0] + 3'b1;


assign widden_split_inst0_vsew[2:0]       = {3{vec_funored_w_inst_vld[0]}}& vec_funored_w_split_inst0_sew[2:0] | 
                                            {3{vec_fored_w_inst_vld[0]}}  & vec_fored_w_split_inst0_sew[2:0]   | 
                                            {3{vec_fnorm_wv_inst_vld[0]}} & vec_fnorm_wv_split_inst0_sew[2:0]  | 
                                            {3{vec_fnorm_wf_inst_vld[0]}} & vec_fnorm_wf_split_inst0_sew[2:0];
assign widden_split_inst1_vsew[2:0]       = {3{vec_funored_w_inst_vld[1]}}& vec_funored_w_split_inst1_sew[2:0] | 
                                            {3{vec_fored_w_inst_vld[1]}}  & vec_fored_w_split_inst1_sew[2:0]   | 
                                            {3{vec_fnorm_wv_inst_vld[1]}} & vec_fnorm_wv_split_inst1_sew[2:0]  | 
                                            {3{vec_fnorm_wf_inst_vld[1]}} & vec_fnorm_wf_split_inst1_sew[2:0];
assign widden_split_inst2_vsew[2:0]       = {3{vec_funored_w_inst_vld[2]}}& vec_funored_w_split_inst2_sew[2:0] | 
                                            {3{vec_fored_w_inst_vld[2]}}  & vec_fored_w_split_inst2_sew[2:0]   | 
                                            {3{vec_fnorm_wv_inst_vld[2]}} & vec_fnorm_wv_split_inst2_sew[2:0]  | 
                                            {3{vec_fnorm_wf_inst_vld[2]}} & vec_fnorm_wf_split_inst2_sew[2:0];
assign widden_split_inst3_vsew[2:0]       = {3{vec_funored_w_inst_vld[3]}}& vec_funored_w_split_inst3_sew[2:0] | 
                                            {3{vec_fored_w_inst_vld[3]}}  & vec_fored_w_split_inst3_sew[2:0]   | 
                                            {3{vec_fnorm_wv_inst_vld[3]}} & vec_fnorm_wv_split_inst3_sew[2:0]  | 
                                            {3{vec_fnorm_wf_inst_vld[3]}} & vec_fnorm_wf_split_inst3_sew[2:0];

assign dp_split_w_vlmul[2:0]              = {1'b0,dp_split_long_vlmul[1:0]} + 3'b1;

assign widden_split_inst0_vlmul[1:0]       = {2{vec_funored_w_inst_vld[0]}}& vec_funored_w_split_inst0_lmul[1:0] | 
                                            {2{vec_fored_w_inst_vld[0]}}  & vec_fored_w_split_inst0_lmul[1:0]   | 
                                            {2{vec_fnorm_wv_inst_vld[0]}} & vec_fnorm_wv_split_inst0_lmul[1:0]  | 
                                            {2{vec_fnorm_wf_inst_vld[0]}} & vec_fnorm_wf_split_inst0_lmul[1:0];
assign widden_split_inst1_vlmul[1:0]       = {2{vec_funored_w_inst_vld[1]}}& vec_funored_w_split_inst1_lmul[1:0] | 
                                            {2{vec_fored_w_inst_vld[1]}}  & vec_fored_w_split_inst1_lmul[1:0]   | 
                                            {2{vec_fnorm_wv_inst_vld[1]}} & vec_fnorm_wv_split_inst1_lmul[1:0]  | 
                                            {2{vec_fnorm_wf_inst_vld[1]}} & vec_fnorm_wf_split_inst1_lmul[1:0];
assign widden_split_inst2_vlmul[1:0]       = {2{vec_funored_w_inst_vld[2]}}& vec_funored_w_split_inst2_lmul[1:0] | 
                                            {2{vec_fored_w_inst_vld[2]}}  & vec_fored_w_split_inst2_lmul[1:0]   | 
                                            {2{vec_fnorm_wv_inst_vld[2]}} & vec_fnorm_wv_split_inst2_lmul[1:0]  | 
                                            {2{vec_fnorm_wf_inst_vld[2]}} & vec_fnorm_wf_split_inst2_lmul[1:0];
assign widden_split_inst3_vlmul[1:0]       = {2{vec_funored_w_inst_vld[3]}}& vec_funored_w_split_inst3_lmul[1:0] | 
                                            {2{vec_fored_w_inst_vld[3]}}  & vec_fored_w_split_inst3_lmul[1:0]   | 
                                            {2{vec_fnorm_wv_inst_vld[3]}} & vec_fnorm_wv_split_inst3_lmul[1:0]  | 
                                            {2{vec_fnorm_wf_inst_vld[3]}} & vec_fnorm_wf_split_inst3_lmul[1:0];

assign widden_split_inst_vld              = dp_split_unfored_w_vld || dp_split_fored_w_vld 
                                            || dp_split_fnorm_wv_vld  || dp_split_fnorm_wf_vld;
                                            
//==========================================================
//                  vector instruction
//==========================================================
parameter VEC_FORED_IDLE = 1'b0;
parameter VEC_FORED_BUSY = 1'b1;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_fored_split_clk_en = ctrl_split_long_id_inst_vld
                           && dp_split_fored_vld
                           ||!(vec_fored_cur_state == VEC_FORED_IDLE);

// &Instance("gated_clk_cell", "x_vec_fored_split_gated_clk"); @2535
gated_clk_cell  x_vec_fored_split_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (vec_fored_split_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (vec_fored_split_clk_en),
  .module_en              (cp0_idu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in      (forever_cpuclk), @2536
//          .external_en (1'b0), @2537
//          .global_en   (cp0_yy_clk_en), @2538
//          .module_en   (cp0_idu_icg_en), @2539
//          .local_en    (vec_fored_split_clk_en), @2540
//          .clk_out     (vec_fored_split_clk)); @2541

always @(posedge vec_fored_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_fored_cur_state <= VEC_FORED_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_fored_cur_state <= VEC_FORED_IDLE;
  else
    vec_fored_cur_state <= vec_fored_next_state;
end
//
always @(posedge vec_fored_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_fored_cnt[3:0] <= 4'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_fored_cnt[3:0] <= 4'b0;
  else if(fored_cnt_end)
    vec_fored_cnt[3:0] <= 4'b0;
  else if(fored_cnt_en)
    vec_fored_cnt[3:0] <= vec_fored_cnt[3:0] + 4'd1;
end
assign fored_total_cnt_num[5:0] = ((6'b1 << (3'b100-dp_split_long_vsew[2:0])) << dp_split_long_vlmul[1:0]) - 6'b1;
assign fored_cnt_end      = (vec_fored_cnt[3:0] == fored_total_cnt_num[5:2]) 
                                && !ctrl_split_long_id_stall;
assign fored_fst_round    = vec_fored_cnt[3:0] == 4'b0;

assign vec_fored_sm_start       = ctrl_split_long_id_inst_vld
                              && dp_split_fored_vld
                              && !ctrl_split_long_id_stall;


assign vec_fored_split_busy  = vec_fored_sm_start &&
                               (vec_fored_cur_state ==VEC_FORED_IDLE) || 
                               (vec_fored_cur_state  ==VEC_FORED_BUSY);
assign vec_fored_split_stall = vec_fored_split_busy && !fored_cnt_end;
assign fored_cnt_en          = !ctrl_split_long_id_stall && vec_fored_split_busy;
//


// &CombBeg; @2582
always @( fored_cnt_end
       or ctrl_split_long_id_stall
       or vec_fored_sm_start
       or vec_fored_cur_state)
begin
  case(vec_fored_cur_state)
  VEC_FORED_IDLE  : if(vec_fored_sm_start && !fored_cnt_end)
                     vec_fored_next_state = VEC_FORED_BUSY;
                   else
                     vec_fored_next_state = VEC_FORED_IDLE;
  VEC_FORED_BUSY  : if(!ctrl_split_long_id_stall && fored_cnt_end)
                     vec_fored_next_state = VEC_FORED_IDLE;
                   else 
                     vec_fored_next_state = VEC_FORED_BUSY;
  default        :   vec_fored_next_state = VEC_FORED_IDLE;
  endcase
// &CombEnd; @2594
end

assign fored_split_inst0_sew64_dy_lmul[2:0]    = {vec_fored_cnt[1:0],1'b0};
assign fored_split_inst0_sew64_dy_splcnt[2:0]  = 3'b0;
assign fored_split_inst0_sew64_last            = 1'b0;
assign fored_split_inst1_sew64_dy_lmul[2:0]    = {vec_fored_cnt[1:0],1'b0};
assign fored_split_inst1_sew64_dy_splcnt[2:0]  = 3'b1;
assign fored_split_inst1_sew64_last            = fored_cnt_end && (dp_split_long_vlmul[1:0] == 2'b00);
assign fored_split_inst2_sew64_dy_lmul[2:0]    = {vec_fored_cnt[1:0],1'b1};
assign fored_split_inst2_sew64_dy_splcnt[2:0]  = 3'b0;
assign fored_split_inst2_sew64_last            = 1'b0;
assign fored_split_inst3_sew64_dy_lmul[2:0]    = {vec_fored_cnt[1:0],1'b1};
assign fored_split_inst3_sew64_dy_splcnt[2:0]  = 3'b1;
assign fored_split_inst3_sew64_last            = fored_cnt_end && (dp_split_long_vlmul[1:0] != 2'b00);

assign fored_split_inst0_sew32_dy_lmul[2:0]    = {vec_fored_cnt[2:0]};
assign fored_split_inst0_sew32_dy_splcnt[2:0]  = 3'b0;
assign fored_split_inst0_sew32_last            = 1'b0;
assign fored_split_inst1_sew32_dy_lmul[2:0]    = {vec_fored_cnt[2:0]};
assign fored_split_inst1_sew32_dy_splcnt[2:0]  = 3'b1;
assign fored_split_inst1_sew32_last            = 1'b0;
assign fored_split_inst2_sew32_dy_lmul[2:0]    = {vec_fored_cnt[2:0]};
assign fored_split_inst2_sew32_dy_splcnt[2:0]  = 3'b10;
assign fored_split_inst2_sew32_last            = 1'b0;
assign fored_split_inst3_sew32_dy_lmul[2:0]    = {vec_fored_cnt[2:0]};
assign fored_split_inst3_sew32_dy_splcnt[2:0]  = 3'b11;
assign fored_split_inst3_sew32_last            = fored_cnt_end;

assign fored_split_inst0_sew16_dy_lmul[2:0]    = {vec_fored_cnt[3:1]};
assign fored_split_inst0_sew16_dy_splcnt[2:0]  = {vec_fored_cnt[0],2'b0};
assign fored_split_inst0_sew16_last            = 1'b0;
assign fored_split_inst1_sew16_dy_lmul[2:0]    = {vec_fored_cnt[3:1]};
assign fored_split_inst1_sew16_dy_splcnt[2:0]  = {vec_fored_cnt[0],2'b1};
assign fored_split_inst1_sew16_last            = 1'b0;
assign fored_split_inst2_sew16_dy_lmul[2:0]    = {vec_fored_cnt[3:1]};
assign fored_split_inst2_sew16_dy_splcnt[2:0]  = {vec_fored_cnt[0],2'b10};
assign fored_split_inst2_sew16_last            = 1'b0;
assign fored_split_inst3_sew16_dy_lmul[2:0]    = {vec_fored_cnt[3:1]};
assign fored_split_inst3_sew16_dy_splcnt[2:0]  = {vec_fored_cnt[0],2'b11};
assign fored_split_inst3_sew16_last            = fored_cnt_end;

// &CombBeg; @2635
always @( fored_split_inst2_sew16_dy_lmul[2:0]
       or fored_split_inst0_sew16_dy_splcnt[2:0]
       or fored_split_inst1_sew16_dy_splcnt[2:0]
       or fored_split_inst2_sew16_last
       or fored_split_inst3_sew16_dy_lmul[2:0]
       or fored_split_inst0_sew64_last
       or fored_split_inst3_sew16_dy_splcnt[2:0]
       or fored_split_inst0_sew16_last
       or fored_split_inst2_sew32_dy_splcnt[2:0]
       or fored_split_inst1_sew32_dy_lmul[2:0]
       or fored_split_inst2_sew32_last
       or fored_split_inst3_sew64_dy_lmul[2:0]
       or fored_split_inst3_sew64_dy_splcnt[2:0]
       or fored_split_inst0_sew64_dy_lmul[2:0]
       or fored_split_inst3_sew64_last
       or fored_split_inst1_sew32_dy_splcnt[2:0]
       or fored_split_inst1_sew32_last
       or fored_split_inst2_sew16_dy_splcnt[2:0]
       or fored_split_inst0_sew16_dy_lmul[2:0]
       or fored_split_inst0_sew32_last
       or fored_split_inst0_sew32_dy_lmul[2:0]
       or fored_split_inst0_sew64_dy_splcnt[2:0]
       or fored_split_inst1_sew64_dy_splcnt[2:0]
       or fored_split_inst3_sew32_last
       or fored_split_inst3_sew32_dy_lmul[2:0]
       or fored_split_inst3_sew32_dy_splcnt[2:0]
       or fored_split_inst2_sew64_dy_splcnt[2:0]
       or fored_split_inst1_sew64_dy_lmul[2:0]
       or fored_split_inst2_sew32_dy_lmul[2:0]
       or fored_split_inst2_sew64_dy_lmul[2:0]
       or fored_split_inst1_sew16_dy_lmul[2:0]
       or fored_split_inst0_sew32_dy_splcnt[2:0]
       or fored_split_inst3_sew16_last
       or fored_split_inst2_sew64_last
       or fored_split_inst1_sew64_last
       or dp_split_long_vsew[1:0]
       or fored_split_inst1_sew16_last)
begin
case(dp_split_long_vsew[1:0])
  2'b01: 
  begin
    fored_split_inst0_split_cnt[5:0]   = {fored_split_inst0_sew16_dy_splcnt[2:0],fored_split_inst0_sew16_dy_lmul[2:0]};
    fored_split_inst0_last             = fored_split_inst0_sew16_last; 
    fored_split_inst1_split_cnt[5:0]   = {fored_split_inst1_sew16_dy_splcnt[2:0],fored_split_inst1_sew16_dy_lmul[2:0]};
    fored_split_inst1_last             = fored_split_inst1_sew16_last; 
    fored_split_inst2_split_cnt[5:0]   = {fored_split_inst2_sew16_dy_splcnt[2:0],fored_split_inst2_sew16_dy_lmul[2:0]};
    fored_split_inst2_last             = fored_split_inst2_sew16_last; 
    fored_split_inst3_split_cnt[5:0]   = {fored_split_inst3_sew16_dy_splcnt[2:0],fored_split_inst3_sew16_dy_lmul[2:0]};
    fored_split_inst3_last             = fored_split_inst3_sew16_last; 
  end
  2'b10:
  begin
    fored_split_inst0_split_cnt[5:0]   = {fored_split_inst0_sew32_dy_splcnt[2:0],fored_split_inst0_sew32_dy_lmul[2:0]};
    fored_split_inst0_last             = fored_split_inst0_sew32_last; 
    fored_split_inst1_split_cnt[5:0]   = {fored_split_inst1_sew32_dy_splcnt[2:0],fored_split_inst1_sew32_dy_lmul[2:0]};
    fored_split_inst1_last             = fored_split_inst1_sew32_last; 
    fored_split_inst2_split_cnt[5:0]   = {fored_split_inst2_sew32_dy_splcnt[2:0],fored_split_inst2_sew32_dy_lmul[2:0]};
    fored_split_inst2_last             = fored_split_inst2_sew32_last; 
    fored_split_inst3_split_cnt[5:0]   = {fored_split_inst3_sew32_dy_splcnt[2:0],fored_split_inst3_sew32_dy_lmul[2:0]};
    fored_split_inst3_last             = fored_split_inst3_sew32_last; 
  end
  2'b11:
  begin
    fored_split_inst0_split_cnt[5:0]   = {fored_split_inst0_sew64_dy_splcnt[2:0],fored_split_inst0_sew64_dy_lmul[2:0]};
    fored_split_inst0_last             = fored_split_inst0_sew64_last; 
    fored_split_inst1_split_cnt[5:0]   = {fored_split_inst1_sew64_dy_splcnt[2:0],fored_split_inst1_sew64_dy_lmul[2:0]};
    fored_split_inst1_last             = fored_split_inst1_sew64_last; 
    fored_split_inst2_split_cnt[5:0]   = {fored_split_inst2_sew64_dy_splcnt[2:0],fored_split_inst2_sew64_dy_lmul[2:0]};
    fored_split_inst2_last             = fored_split_inst2_sew64_last; 
    fored_split_inst3_split_cnt[5:0]   = {fored_split_inst3_sew64_dy_splcnt[2:0],fored_split_inst3_sew64_dy_lmul[2:0]};
    fored_split_inst3_last             = fored_split_inst3_sew64_last; 
  end
  default:
  begin
    fored_split_inst0_split_cnt[5:0]   = {6{1'b0}}; 
    fored_split_inst0_last             = {1{1'b0}};
    fored_split_inst1_split_cnt[5:0]   = {6{1'b0}};
    fored_split_inst1_last             = {1{1'b0}};
    fored_split_inst2_split_cnt[5:0]   = {6{1'b0}};
    fored_split_inst2_last             = {1{1'b0}};
    fored_split_inst3_split_cnt[5:0]   = {6{1'b0}};
    fored_split_inst3_last             = {1{1'b0}};
  end
endcase
// &CombEnd; @2682
end

assign vec_fored_srcv0_vreg_0[4:0] = vec_inst[24:20] | {2'b0,fored_split_inst0_split_cnt[2 :0]};
assign vec_fored_srcv0_vreg_1[4:0] = vec_inst[24:20] | {2'b0,fored_split_inst1_split_cnt[2 :0]};
assign vec_fored_srcv0_vreg_2[4:0] = vec_inst[24:20] | {2'b0,fored_split_inst2_split_cnt[2 :0]};
assign vec_fored_srcv0_vreg_3[4:0] = vec_inst[24:20] | {2'b0,fored_split_inst3_split_cnt[2 :0]};

assign vec_fored_srcv1_vreg[4:0]  = vec_inst[19:15];
assign vec_fored_destv_vreg[4:0]  = vec_inst[11:7];
//----------------------------------------------------------
//                  float order split inst 0/4
//----------------------------------------------------------
assign vec_fored_split_inst0_src0[5:0]                      = {1'b0,vec_fored_srcv0_vreg_0[4:0]};
assign vec_fored_split_inst0_src1[5:0]                      = fored_fst_round ? {1'b0,vec_fored_srcv1_vreg[4:0]} : 6'b100000;

// &CombBeg; @2697
always @( vec_fored_split_inst0_src0[5:0]
       or fored_split_inst0_last
       or vec_inst[31:0]
       or fored_split_inst0_split_cnt[5:0]
       or vec_fored_split_inst0_src1[5:0])
begin
  vec_fored_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fored_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fored_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,fored_split_inst0_split_cnt[5:0]};
  vec_fored_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_fored_split_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fored_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fored_split_inst0_data[IR_SRCV2_VLD]                  = 1'b0;
  vec_fored_split_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fored_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fored_split_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {vec_fored_split_inst0_src0[5:0]};
  vec_fored_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = {vec_fored_split_inst0_src1[5:0]};
  vec_fored_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100000;
  vec_fored_split_inst0_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fored_split_inst0_data[IR_VMLA]                       = 1'b0;
  vec_fored_split_inst0_data[IR_INTMASK]                    = !fored_split_inst0_last;
  vec_fored_split_inst0_data[IR_SPLIT]                      = !fored_split_inst0_last;
  vec_fored_split_inst0_data[IR_IID_PLUS-3]                 = 1'b1;
  vec_fored_split_inst0_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2718
end

//----------------------------------------------------------
//             /     foredal inst 1/5
//----------------------------------------------------------
assign vec_fored_split_inst1_src0[5:0]                      = {1'b0,vec_fored_srcv0_vreg_1[4:0]};
assign vec_fored_split_inst1_src1[5:0]                      = 6'b100000;
// &CombBeg; @2725
always @( vec_fored_split_inst1_src1[5:0]
       or vec_fored_destv_vreg[4:0]
       or fored_split_inst1_split_cnt[5:0]
       or vec_fored_split_inst1_src0[5:0]
       or vec_inst[31:0]
       or fored_split_inst1_last)
begin
  vec_fored_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fored_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fored_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,fored_split_inst1_split_cnt[5:0]};
  vec_fored_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_fored_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fored_split_inst1_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fored_split_inst1_data[IR_SRCV2_VLD]                  = 1'b0;
  vec_fored_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fored_split_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fored_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_fored_split_inst1_src0[5:0];
  vec_fored_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_fored_split_inst1_src1[5:0];
  vec_fored_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = fored_split_inst1_last ? {1'b0,vec_fored_destv_vreg[4:0]} : 6'b100000;
  vec_fored_split_inst1_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fored_split_inst1_data[IR_VMLA]                       = 1'b0;
  vec_fored_split_inst1_data[IR_INTMASK]                    = !fored_split_inst1_last;
  vec_fored_split_inst1_data[IR_SPLIT]                      = !fored_split_inst1_last;
  vec_fored_split_inst1_data[IR_IID_PLUS-3]                 = !fored_split_inst1_last;
  vec_fored_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2746
end

//----------------------------------------------------------
//                  foredal inst 2/6
//----------------------------------------------------------
assign vec_fored_split_inst2_src0[5:0]                      = {1'b0,vec_fored_srcv0_vreg_2[4:0]};
assign vec_fored_split_inst2_src1[5:0]                      = 6'b100000;
// &CombBeg; @2753
always @( vec_fored_split_inst2_src1[5:0]
       or vec_fored_destv_vreg[4:0]
       or vec_inst[31:0]
       or fored_split_inst2_last
       or fored_split_inst2_split_cnt[5:0]
       or vec_fored_split_inst2_src0[5:0])
begin
  vec_fored_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fored_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fored_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,fored_split_inst2_split_cnt[5:0]};
  vec_fored_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_fored_split_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fored_split_inst2_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fored_split_inst2_data[IR_SRCV2_VLD]                  = 1'b0;
  vec_fored_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fored_split_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fored_split_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_fored_split_inst2_src0[5:0];
  vec_fored_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_fored_split_inst2_src1[5:0];
  vec_fored_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = fored_split_inst2_last ? {1'b0,vec_fored_destv_vreg[4:0]} : 6'b100000;
  vec_fored_split_inst2_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fored_split_inst2_data[IR_VMLA]                       = 1'b0;
  vec_fored_split_inst2_data[IR_INTMASK]                    = !fored_split_inst2_last;
  vec_fored_split_inst2_data[IR_SPLIT]                      = !fored_split_inst2_last;
  vec_fored_split_inst2_data[IR_IID_PLUS-3]                 = !fored_split_inst2_last;
  vec_fored_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2774
end

//----------------------------------------------------------
//                  foredal inst 3/7
//----------------------------------------------------------
assign vec_fored_split_inst3_src0[5:0]                      = {1'b0,vec_fored_srcv0_vreg_3[4:0]};
assign vec_fored_split_inst3_src1[5:0]                      = 6'b100000;
// &CombBeg; @2781
always @( vec_fored_destv_vreg[4:0]
       or vec_fored_split_inst3_src1[5:0]
       or vec_fored_split_inst3_src0[5:0]
       or vec_inst[31:0]
       or fored_split_inst3_split_cnt[5:0]
       or fored_split_inst3_last)
begin
  vec_fored_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fored_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fored_split_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,fored_split_inst3_split_cnt[5:0]};
  vec_fored_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_fored_split_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fored_split_inst3_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fored_split_inst3_data[IR_SRCV2_VLD]                  = 1'b0;
  vec_fored_split_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fored_split_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fored_split_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_fored_split_inst3_src0[5:0];
  vec_fored_split_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_fored_split_inst3_src1[5:0];
  vec_fored_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = fored_split_inst3_last ? {1'b0,vec_fored_destv_vreg[4:0]} : 6'b100000;
  vec_fored_split_inst3_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fored_split_inst3_data[IR_VMLA]                       = 1'b0;
  vec_fored_split_inst3_data[IR_INTMASK]                    = !fored_split_inst3_last;
  vec_fored_split_inst3_data[IR_SPLIT]                      = !fored_split_inst3_last;
  vec_fored_split_inst3_data[IR_IID_PLUS-3]                 = !fored_split_inst3_last;
  vec_fored_split_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @2802
end


assign vec_fored_dep_info[DEP_WIDTH-1:0]  = {DEP_WIDTH{1'b0}};

assign vec_fored_inst0_data[IR_WIDTH-1:0] = vec_fored_split_inst0_data[IR_WIDTH-1:0];
assign vec_fored_inst1_data[IR_WIDTH-1:0] = vec_fored_split_inst1_data[IR_WIDTH-1:0];
assign vec_fored_inst2_data[IR_WIDTH-1:0] = vec_fored_split_inst2_data[IR_WIDTH-1:0];
assign vec_fored_inst3_data[IR_WIDTH-1:0] = vec_fored_split_inst3_data[IR_WIDTH-1:0];

assign vec_fored_inst_vld[0] = vec_fored_split_busy;
assign vec_fored_inst_vld[1] = vec_fored_split_busy;
assign vec_fored_inst_vld[2] = vec_fored_split_busy && !fored_split_inst1_last;
assign vec_fored_inst_vld[3] = vec_fored_split_busy && !fored_split_inst2_last && !fored_split_inst1_last;

//==========================================================
//               WIDDEN ORDER Instructions split
//==========================================================
parameter VEC_FORED_W_IDLE = 1'b0;
parameter VEC_FORED_W_BUSY = 1'b1;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_fored_w_split_clk_en = ctrl_split_long_id_inst_vld
                           && dp_split_fored_w_vld
                           ||!(vec_fored_w_cur_state == VEC_FORED_W_IDLE);

// &Instance("gated_clk_cell", "x_vec_fored_w_split_gated_clk"); @2830
gated_clk_cell  x_vec_fored_w_split_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (vec_fored_w_split_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (vec_fored_w_split_clk_en),
  .module_en                (cp0_idu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.clk_in      (forever_cpuclk), @2831
//          .external_en (1'b0), @2832
//          .global_en   (cp0_yy_clk_en), @2833
//          .module_en   (cp0_idu_icg_en), @2834
//          .local_en    (vec_fored_w_split_clk_en), @2835
//          .clk_out     (vec_fored_w_split_clk)); @2836

always @(posedge vec_fored_w_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_fored_w_cur_state <= VEC_FORED_W_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_fored_w_cur_state <= VEC_FORED_W_IDLE;
  else
    vec_fored_w_cur_state <= vec_fored_w_next_state;
end
//
always @(posedge vec_fored_w_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_fored_w_cnt[4:0] <= 5'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_fored_w_cnt[4:0] <= 5'b0;
  else if(fored_w_cnt_end)
    vec_fored_w_cnt[4:0] <= 5'b0;
  else if(fored_w_cnt_en)
    vec_fored_w_cnt[4:0] <= vec_fored_w_cnt[4:0] + 5'd1;
end
assign fored_w_total_cnt_num[4:0] = (5'b00100<<dp_split_long_vlmul[1:0]) - 5'b1;
                                                                      
assign fored_w_cnt_end      = (vec_fored_w_cnt[4:0] == fored_w_total_cnt_num[4:0]) 
                                && !ctrl_split_long_id_stall;
assign fored_w_fst_round    = vec_fored_w_cnt[4:1] == 4'b0;

assign vec_fored_w_sm_start       = ctrl_split_long_id_inst_vld
                              && dp_split_fored_w_vld
                              && !ctrl_split_long_id_stall;


assign vec_fored_w_split_busy  = vec_fored_w_sm_start &&
                               (vec_fored_w_cur_state ==VEC_FORED_W_IDLE) || 
                               (vec_fored_w_cur_state  ==VEC_FORED_W_BUSY);
assign vec_fored_w_split_stall = vec_fored_w_split_busy && !fored_w_cnt_end;
assign fored_w_cnt_en          = !ctrl_split_long_id_stall && vec_fored_w_split_busy;
//


// &CombBeg; @2878
always @( vec_fored_w_cur_state
       or fored_w_cnt_end
       or vec_fored_w_sm_start
       or ctrl_split_long_id_stall)
begin
  case(vec_fored_w_cur_state)
  VEC_FORED_W_IDLE  : if(vec_fored_w_sm_start && !fored_w_cnt_end)
                     vec_fored_w_next_state = VEC_FORED_W_BUSY;
                   else
                     vec_fored_w_next_state = VEC_FORED_W_IDLE;
  VEC_FORED_W_BUSY  : if(!ctrl_split_long_id_stall && fored_w_cnt_end)
                     vec_fored_w_next_state = VEC_FORED_W_IDLE;
                   else 
                     vec_fored_w_next_state = VEC_FORED_W_BUSY;
  default        :   vec_fored_w_next_state = VEC_FORED_W_IDLE;
  endcase
// &CombEnd; @2890
end

assign vec_fored_w_cnt_l[2:0] = vec_fred_w_mul8 ? vec_fored_w_cnt[4:2]
                                                : vec_fored_w_cnt[3:1];
assign vec_fored_w_cnt_h      = vec_fred_w_mul8 && vec_fored_w_cnt[1];

assign fored_w_split_inst0_sew32_dy_lmul[2:0]    = {vec_fored_w_cnt_l[2:0]};
assign fored_w_split_inst0_sew32_dy_splcnt[2:0]  = vec_fored_w_cnt[0] ? {vec_fored_w_cnt_h,2'b0} : {1'b1,vec_fored_w_cnt_h,vec_fred_w_mul8};
assign fored_w_split_inst0_sew32[31:0]           = vec_fored_w_cnt[0] ? fored_inst[31:0] : fcvtw_inst[31:0];
assign fored_w_split_inst1_sew32_dy_lmul[2:0]    = {vec_fored_w_cnt_l[2:0]};
assign fored_w_split_inst1_sew32_dy_splcnt[2:0]  = {vec_fored_w_cnt_h,2'b1};
assign fored_w_split_inst1_sew32[31:0]           = fored_inst[31:0];
assign fored_w_split_inst1_sew32_last            = fored_w_cnt_end;

assign fored_w_split_inst2_sew32_dy_lmul[2:0]    = {vec_fored_w_cnt_l[2:0]};
assign fored_w_split_inst2_sew32_dy_splcnt[2:0]  = {vec_fored_w_cnt_h,2'b0};
//assign fored_w_split_inst2_sew32_last            = fored_w_cnt_end;
assign fored_w_split_inst2_sew32[31:0]           = fored_inst[31:0];

assign fored_w_split_inst3_sew32_dy_lmul[2:0]    = {vec_fored_w_cnt_l[2:0]};
assign fored_w_split_inst3_sew32_dy_splcnt[2:0]  = {vec_fored_w_cnt_h,2'b1};
assign fored_w_split_inst3_sew32_last            = fored_w_cnt_end;
assign fored_w_split_inst3_sew32[31:0]           = fored_inst[31:0];

assign fored_inst[31:0]                          = {6'b000011,vec_inst[25],5'b00000,5'b00000,3'b001,vec_inst[11:7],vec_inst[6:0]};
assign fcvtw_inst[31:0]                          = {6'b100010,vec_inst[25],5'b00000,5'b01100,3'b001,vec_inst[11:7],vec_inst[6:0]};
assign fored_w_split_inst0_sew16_dy_lmul[2:0]    = {vec_fored_w_cnt_l[2:0]};
assign fored_w_split_inst0_sew16_dy_splcnt[2:0]  = vec_fored_w_cnt[0] ? {vec_fored_w_cnt_h,2'b0} : {1'b1,vec_fored_w_cnt_h,vec_fred_w_mul8};
assign fored_w_split_inst0_sew16[31:0]           = vec_fored_w_cnt[0] ? fored_inst[31:0] : fcvtw_inst[31:0];

assign fored_w_split_inst1_sew16_dy_lmul[2:0]    = {vec_fored_w_cnt_l[2:0]};
assign fored_w_split_inst1_sew16_dy_splcnt[2:0]  = {vec_fored_w_cnt_h,2'b1};
assign fored_w_split_inst1_sew16_last            = 1'b0;
assign fored_w_split_inst1_sew16[31:0]           = fored_inst[31:0];

assign fored_w_split_inst2_sew16_dy_lmul[2:0]    = {vec_fored_w_cnt_l[2:0]};
assign fored_w_split_inst2_sew16_dy_splcnt[2:0]  = {vec_fored_w_cnt_h,2'b10};
//assign fored_w_split_inst2_sew16_last            = 1'b0;
assign fored_w_split_inst2_sew16[31:0]           = fored_inst[31:0];

assign fored_w_split_inst3_sew16_dy_lmul[2:0]    = {vec_fored_w_cnt_l[2:0]};
assign fored_w_split_inst3_sew16_dy_splcnt[2:0]  = {vec_fored_w_cnt_h,2'b11};
assign fored_w_split_inst3_sew16_last            = fored_w_cnt_end;
assign fored_w_split_inst3_sew16[31:0]           = fored_inst[31:0];


// &CombBeg; @2936
always @( fored_w_split_inst3_sew32_dy_lmul[2:0]
       or fored_w_split_inst0_sew32[31:0]
       or fored_w_split_inst1_sew16_dy_splcnt[2:0]
       or fored_w_split_inst3_sew16[31:0]
       or fored_w_split_inst1_sew32_last
       or fored_w_split_inst1_sew32_dy_lmul[2:0]
       or fored_w_split_inst2_sew16_dy_lmul[2:0]
       or fored_w_split_inst3_sew16_dy_splcnt[2:0]
       or fored_w_split_inst0_sew16[31:0]
       or fored_w_split_inst2_sew16_dy_splcnt[2:0]
       or fored_w_split_inst2_sew16[31:0]
       or fored_w_split_inst3_sew16_last
       or fored_w_split_inst0_sew32_dy_lmul[2:0]
       or fored_w_split_inst3_sew32_dy_splcnt[2:0]
       or fored_w_split_inst0_sew16_dy_lmul[2:0]
       or fored_w_split_inst0_sew32_dy_splcnt[2:0]
       or fored_w_split_inst3_sew32[31:0]
       or fored_w_split_inst2_sew32[31:0]
       or fored_w_split_inst1_sew32_dy_splcnt[2:0]
       or fored_w_split_inst2_sew32_dy_splcnt[2:0]
       or fored_w_split_inst1_sew32[31:0]
       or fored_w_split_inst1_sew16[31:0]
       or fored_w_split_inst1_sew16_dy_lmul[2:0]
       or fored_w_split_inst1_sew16_last
       or fored_w_split_inst0_sew16_dy_splcnt[2:0]
       or dp_split_long_vsew[1:0]
       or fored_w_split_inst3_sew16_dy_lmul[2:0]
       or fored_w_split_inst2_sew32_dy_lmul[2:0]
       or fored_w_split_inst3_sew32_last)
begin
case(dp_split_long_vsew[1:0])
  2'b01: 
  begin
    fored_w_split_inst0_split_cnt[5:0]   = {fored_w_split_inst0_sew16_dy_splcnt[2:0],fored_w_split_inst0_sew16_dy_lmul[2:0]};
    fored_w_split_inst0_split_inst[31:0] = fored_w_split_inst0_sew16[31:0];
    fored_w_split_inst1_split_cnt[5:0]   = {fored_w_split_inst1_sew16_dy_splcnt[2:0],fored_w_split_inst1_sew16_dy_lmul[2:0]};
    fored_w_split_inst1_last             = fored_w_split_inst1_sew16_last; 
    fored_w_split_inst1_split_inst[31:0] = fored_w_split_inst1_sew16[31:0];
    fored_w_split_inst2_split_cnt[5:0]   = {fored_w_split_inst2_sew16_dy_splcnt[2:0],fored_w_split_inst2_sew16_dy_lmul[2:0]};
//    fored_w_split_inst2_last             = fored_w_split_inst2_sew16_last; 
    fored_w_split_inst2_split_inst[31:0] = fored_w_split_inst2_sew16[31:0];
    fored_w_split_inst3_split_cnt[5:0]   = {fored_w_split_inst3_sew16_dy_splcnt[2:0],fored_w_split_inst3_sew16_dy_lmul[2:0]};
    fored_w_split_inst3_last             = fored_w_split_inst3_sew16_last; 
    fored_w_split_inst3_split_inst[31:0] = fored_w_split_inst3_sew16[31:0];
  end
  2'b10:
  begin
    fored_w_split_inst0_split_cnt[5:0]   = {fored_w_split_inst0_sew32_dy_splcnt[2:0],fored_w_split_inst0_sew32_dy_lmul[2:0]};
    fored_w_split_inst0_split_inst[31:0] = fored_w_split_inst0_sew32[31:0];
    fored_w_split_inst1_split_cnt[5:0]   = {fored_w_split_inst1_sew32_dy_splcnt[2:0],fored_w_split_inst1_sew32_dy_lmul[2:0]};
    fored_w_split_inst1_last             = fored_w_split_inst1_sew32_last; 
    fored_w_split_inst1_split_inst[31:0] = fored_w_split_inst1_sew32[31:0];
    fored_w_split_inst2_split_cnt[5:0]   = {fored_w_split_inst2_sew32_dy_splcnt[2:0],fored_w_split_inst2_sew32_dy_lmul[2:0]};
 //   fored_w_split_inst2_last             = fored_w_split_inst2_sew32_last; 
    fored_w_split_inst2_split_inst[31:0] = fored_w_split_inst2_sew32[31:0];
    fored_w_split_inst3_split_cnt[5:0]   = {fored_w_split_inst3_sew32_dy_splcnt[2:0],fored_w_split_inst3_sew32_dy_lmul[2:0]};
    fored_w_split_inst3_last             = fored_w_split_inst3_sew32_last; 
    fored_w_split_inst3_split_inst[31:0] = fored_w_split_inst3_sew32[31:0];
  end
  default:
  begin
    fored_w_split_inst0_split_inst[31:0] = {32{1'b0}};
    fored_w_split_inst0_split_cnt[5:0]   = {6{1'b0}}; 
    fored_w_split_inst1_split_inst[31:0] = {32{1'b0}};
    fored_w_split_inst1_split_cnt[5:0]   = {6{1'b0}};
    fored_w_split_inst1_last             = {1{1'b0}};
    fored_w_split_inst2_split_inst[31:0] = {32{1'b0}};
    fored_w_split_inst2_split_cnt[5:0]   = {6{1'b0}};
//    fored_w_split_inst2_last             = {1{1'bx}};
    fored_w_split_inst3_split_inst[31:0] = {32{1'b0}};
    fored_w_split_inst3_split_cnt[5:0]   = {6{1'b0}};
    fored_w_split_inst3_last             = {1{1'b0}};
  end
endcase
// &CombEnd; @2981
end

assign vec_fored_w_srcv0_vreg_0[4:0] = vec_inst[24:20] | {2'b0,vec_fored_w_cnt[4 :2]};

assign vec_fored_w_srcv1_vreg[4:0]  = vec_inst[19:15];
assign vec_fored_w_destv_vreg[4:0]  = vec_inst[11:7];
//----------------------------------------------------------
//                  float order split inst 0/4
//----------------------------------------------------------
assign vec_fored_w_split_inst0_src0[5:0]                      = vec_fored_w_cnt[0] ? 6'b100000 : {1'b0,vec_fored_w_srcv0_vreg_0[4:0]};
assign vec_fored_w_split_inst0_src1[5:0]                      = fored_w_fst_round ? vec_fored_w_cnt[0] ? {1'b0,vec_fored_w_srcv1_vreg[4:0]}
                                                                                                       : {1'b0,vec_fored_w_srcv0_vreg_0[4:0]}
                                                                                  : 6'b100001;
                                                                                 
assign vec_fored_w_inst0_mul8                                 = vec_fored_w_cnt[0] ? vec_fred_w_mul8 : 1'b0;
// &CombBeg; @2996
always @( fored_w_split_inst0_split_cnt[5:0]
       or vec_fored_w_split_inst0_src0[5:0]
       or vec_fored_w_split_inst0_src1[5:0]
       or vec_inst[25]
       or fored_w_split_inst0_split_inst[31:0]
       or vec_fored_w_cnt[0]
       or vec_fored_w_inst0_mul8)
begin
  vec_fored_w_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fored_w_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = vec_fored_w_cnt[0] ? PIPE67 : PIPE7;
  vec_fored_w_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_fored_w_inst0_mul8,fored_w_split_inst0_split_cnt[5:0]};
  vec_fored_w_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = fored_w_split_inst0_split_inst[31:0];
  vec_fored_w_split_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fored_w_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fored_w_split_inst0_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fored_w_split_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fored_w_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fored_w_split_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_fored_w_split_inst0_src0[5:0];
  vec_fored_w_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_fored_w_split_inst0_src1[5:0];
  vec_fored_w_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vec_fored_w_cnt[0] ? 6'b100001 : 6'b100000;
  vec_fored_w_split_inst0_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fored_w_split_inst0_data[IR_VMLA]                       = 1'b0;
  vec_fored_w_split_inst0_data[IR_INTMASK]                    = 1'b1;
  vec_fored_w_split_inst0_data[IR_SPLIT]                      = 1'b1;
  vec_fored_w_split_inst0_data[IR_LENGTH]                     = 1'b1;
  vec_fored_w_split_inst0_data[IR_IID_PLUS-3]                 = 1'b1;
  end
// &CombEnd; @3017
end

//----------------------------------------------------------
//             /     fored_wal inst 1/5
//----------------------------------------------------------
assign vec_fored_w_split_inst1_src0[5:0]                      = 6'b100000; //using tmp0
assign vec_fored_w_split_inst1_src1[5:0]                      = 6'b100001; //last round tmp
assign vec_fored_w_split_inst1_dest[5:0]                      = (dp_split_long_vsew[1:0] == 2'b10) ? 
                                                                                        fored_w_split_inst1_last ? {1'b0,vec_fored_w_destv_vreg[4:0]}
                                                                                                                 : 6'b100001  //next cycle
                                                                                        : 6'b100001;

// &CombBeg; @3029
always @( vec_fored_w_split_inst1_src0[5:0]
       or vec_fred_w_mul8
       or vec_fored_w_split_inst1_src1[5:0]
       or vec_inst[25]
       or fored_w_split_inst1_last
       or vec_fored_w_split_inst1_dest[5:0]
       or fored_w_split_inst1_split_cnt[5:0]
       or fored_w_split_inst1_split_inst[31:0])
begin
  vec_fored_w_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fored_w_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fored_w_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_fred_w_mul8,fored_w_split_inst1_split_cnt[5:0]};
  vec_fored_w_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = fored_w_split_inst1_split_inst[31:0];
  vec_fored_w_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fored_w_split_inst1_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fored_w_split_inst1_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fored_w_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fored_w_split_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fored_w_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_fored_w_split_inst1_src0[5:0]; //tmp0
  vec_fored_w_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_fored_w_split_inst1_src1[5:0];
  vec_fored_w_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vec_fored_w_split_inst1_dest[5:0];
  vec_fored_w_split_inst1_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fored_w_split_inst1_data[IR_VMLA]                       = 1'b0;
  vec_fored_w_split_inst1_data[IR_INTMASK]                    = !fored_w_split_inst1_last;
  vec_fored_w_split_inst1_data[IR_SPLIT]                      = !fored_w_split_inst1_last;
  vec_fored_w_split_inst1_data[IR_IID_PLUS-3]                 = !fored_w_split_inst1_last;
  vec_fored_w_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3050
end

//----------------------------------------------------------
//                  fored_wal inst 2/6
//----------------------------------------------------------
// &CombBeg; @3055
always @( fored_w_split_inst2_split_inst[31:0]
       or vec_fred_w_mul8
       or vec_inst[25]
       or fored_w_split_inst2_split_cnt[5:0])
begin
  vec_fored_w_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fored_w_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fored_w_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_fred_w_mul8,fored_w_split_inst2_split_cnt[5:0]};
  vec_fored_w_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = fored_w_split_inst2_split_inst[31:0];
  vec_fored_w_split_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fored_w_split_inst2_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fored_w_split_inst2_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fored_w_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fored_w_split_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fored_w_split_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = 6'b100000;
  vec_fored_w_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = 6'b100001;
  vec_fored_w_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100001;
  vec_fored_w_split_inst2_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fored_w_split_inst2_data[IR_VMLA]                       = 1'b0;
  vec_fored_w_split_inst2_data[IR_INTMASK]                    = 1'b1;
  vec_fored_w_split_inst2_data[IR_SPLIT]                      = 1'b1;
  vec_fored_w_split_inst2_data[IR_LENGTH]                     = 1'b1;
  vec_fored_w_split_inst2_data[IR_IID_PLUS-3]                 = 1'b1;
  end
// &CombEnd; @3076
end

//----------------------------------------------------------
//                  fored_wal inst 3/7
//----------------------------------------------------------
assign vec_fored_w_split_inst3_src0[5:0]                      = 6'b100000;
assign vec_fored_w_split_inst3_src1[5:0]                      = 6'b100001;


// &CombBeg; @3085
always @( vec_fored_w_split_inst3_src0[5:0]
       or vec_fred_w_mul8
       or vec_inst[25]
       or fored_w_split_inst3_split_inst[31:0]
       or fored_w_split_inst3_split_cnt[5:0]
       or fored_w_split_inst3_last
       or vec_fored_w_split_inst3_src1[5:0]
       or vec_fored_w_destv_vreg[4:0])
begin
  vec_fored_w_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_fored_w_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_fored_w_split_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_fred_w_mul8,fored_w_split_inst3_split_cnt[5:0]};
  vec_fored_w_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = fored_w_split_inst3_split_inst[31:0];
  vec_fored_w_split_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_fored_w_split_inst3_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_fored_w_split_inst3_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_fored_w_split_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_fored_w_split_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vec_fored_w_split_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_fored_w_split_inst3_src0[5:0];
  vec_fored_w_split_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_fored_w_split_inst3_src1[5:0];
  vec_fored_w_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = fored_w_split_inst3_last ? {1'b0,vec_fored_w_destv_vreg[4:0]} : 6'b100001;
  vec_fored_w_split_inst3_data[IR_DSTE_VLD]                   = 1'b1;
  vec_fored_w_split_inst3_data[IR_VMLA]                       = 1'b0;
  vec_fored_w_split_inst3_data[IR_INTMASK]                    = !fored_w_split_inst3_last;
  vec_fored_w_split_inst3_data[IR_SPLIT]                      = !fored_w_split_inst3_last;
  vec_fored_w_split_inst3_data[IR_IID_PLUS-3]                 = !fored_w_split_inst3_last;
  vec_fored_w_split_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3106
end


assign vec_fored_w_dep_info[DEP_WIDTH-1:0]  = {DEP_WIDTH{1'b0}};

assign vec_fored_w_inst0_data[IR_WIDTH-1:0] = vec_fored_w_split_inst0_data[IR_WIDTH-1:0];
assign vec_fored_w_inst1_data[IR_WIDTH-1:0] = vec_fored_w_split_inst1_data[IR_WIDTH-1:0];
assign vec_fored_w_inst2_data[IR_WIDTH-1:0] = vec_fored_w_split_inst2_data[IR_WIDTH-1:0];
assign vec_fored_w_inst3_data[IR_WIDTH-1:0] = vec_fored_w_split_inst3_data[IR_WIDTH-1:0];

assign vec_fored_w_split_inst0_sew[2:0]  = vec_fored_w_cnt[0] ?  dp_split_w_vsew[2:0] : dp_split_long_vsew[2:0] ;
assign vec_fored_w_split_inst1_sew[2:0]  = dp_split_w_vsew[2:0];
assign vec_fored_w_split_inst2_sew[2:0]  = dp_split_w_vsew[2:0];
assign vec_fored_w_split_inst3_sew[2:0]  = dp_split_w_vsew[2:0];

assign vec_fored_w_split_inst0_lmul[1:0]  = vec_fored_w_cnt[0] ?  vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0] : dp_split_long_vlmul[1:0] ;
assign vec_fored_w_split_inst1_lmul[1:0]  = vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];
assign vec_fored_w_split_inst2_lmul[1:0]  = vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];
assign vec_fored_w_split_inst3_lmul[1:0]  = vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];

assign vec_fored_w_inst_vld[0] = vec_fored_w_split_busy;
assign vec_fored_w_inst_vld[1] = vec_fored_w_split_busy && vec_fored_w_cnt[0];
assign vec_fored_w_inst_vld[2] = vec_fored_w_split_busy && vec_fored_w_cnt[0] && (dp_split_long_vsew[1:0] == 2'b01);
assign vec_fored_w_inst_vld[3] = vec_fored_w_split_busy && vec_fored_w_cnt[0] && (dp_split_long_vsew[1:0] == 2'b01);


//==========================================================
//               UNORDER Instructions split
//==========================================================
parameter VEC_FUNORED_IDLE = 1'b0;
parameter VEC_FUNORED_BUSY = 1'b1;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_funored_split_clk_en = ctrl_split_long_id_inst_vld
                           && dp_split_unfored_vld
                           ||!(vec_funored_cur_state == VEC_FUNORED_IDLE);

// &Instance("gated_clk_cell", "x_vec_funored_split_gated_clk"); @3145
gated_clk_cell  x_vec_funored_split_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (vec_funored_split_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (vec_funored_split_clk_en),
  .module_en                (cp0_idu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.clk_in      (forever_cpuclk), @3146
//          .external_en (1'b0), @3147
//          .global_en   (cp0_yy_clk_en), @3148
//          .module_en   (cp0_idu_icg_en), @3149
//          .local_en    (vec_funored_split_clk_en), @3150
//          .clk_out     (vec_funored_split_clk)); @3151

always @(posedge vec_funored_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_funored_cur_state <= VEC_FUNORED_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_funored_cur_state <= VEC_FUNORED_IDLE;
  else
    vec_funored_cur_state <= vec_funored_next_state;
end
//
always @(posedge vec_funored_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_funored_cnt[2:0] <= 3'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_funored_cnt[2:0] <= 3'b0;
  else if(funored_cnt_end)
    vec_funored_cnt[2:0] <= 3'b0;
  else if(funored_cnt_en)
    vec_funored_cnt[2:0] <= vec_funored_cnt[2:0] + 3'd1;
end
assign funored_total_cnt_num[2:0] = (dp_split_long_vsew[2:0] == 3'b11) ?
                                                     (dp_split_long_vlmul[1:0]==2'b00) ? 3'b0 
                                                                    : ((3'b1 << dp_split_long_vlmul[1:0])>>1) - 3'b1
                                                  :  (3'b1<< dp_split_long_vlmul[1:0]) - 3'b1;
assign funored_cnt_end      = (vec_funored_cnt[2:0] == funored_total_cnt_num[2:0]) 
                                && !ctrl_split_long_id_stall;
assign funored_fst_round    =  vec_funored_cnt[2:0] == 3'b0;

assign vec_funored_sm_start       = ctrl_split_long_id_inst_vld
                              && dp_split_unfored_vld
                              && !ctrl_split_long_id_stall;

assign vec_funored_split_busy  = vec_funored_sm_start &&
                               (vec_funored_cur_state ==VEC_FUNORED_IDLE) || 
                               (vec_funored_cur_state  ==VEC_FUNORED_BUSY);
assign vec_funored_split_stall = vec_funored_split_busy && !funored_cnt_end;
assign funored_cnt_en          = !ctrl_split_long_id_stall && vec_funored_split_busy;
//


// &CombBeg; @3194
always @( vec_funored_cur_state
       or vec_funored_sm_start
       or ctrl_split_long_id_stall
       or funored_cnt_end)
begin
  case(vec_funored_cur_state)
  VEC_FUNORED_IDLE  : if(vec_funored_sm_start && !funored_cnt_end)
                     vec_funored_next_state = VEC_FORED_BUSY;
                   else
                     vec_funored_next_state = VEC_FORED_IDLE;
  VEC_FUNORED_BUSY  : if(!ctrl_split_long_id_stall && funored_cnt_end)
                     vec_funored_next_state = VEC_FORED_IDLE;
                   else 
                     vec_funored_next_state = VEC_FORED_BUSY;
  default        :   vec_funored_next_state = VEC_FORED_IDLE;
  endcase
// &CombEnd; @3206
end

assign funored_split_inst0_sew64_dy_lmul[2:0]    = {vec_funored_cnt[1:0],1'b0};
assign funored_split_inst0_sew64_dy_splcnt[2:0]  = 3'b0;
assign funored_split_inst0_sew64_last            = 1'b0;

assign funored_split_inst1_sew64_dy_lmul[2:0]    = {vec_funored_cnt[1:0],1'b0};
assign funored_split_inst1_sew64_dy_splcnt[2:0]  = 3'b1;
assign funored_split_inst1_sew64_last            = funored_cnt_end && (dp_split_long_vlmul[1:0] == 2'b0);

assign funored_split_inst2_sew64_dy_lmul[2:0]    = {vec_funored_cnt[1:0],1'b1};
assign funored_split_inst2_sew64_dy_splcnt[2:0]  = 3'b0;
assign funored_split_inst2_sew64_last            = 1'b0;
assign funored_split_inst2_sew64_round_end       = 1'b0;

assign funored_split_inst3_sew64_dy_lmul[2:0]    = {vec_funored_cnt[1:0],1'b1};
assign funored_split_inst3_sew64_dy_splcnt[2:0]  = 3'b1;
assign funored_split_inst3_sew64_last            = funored_cnt_end && (dp_split_long_vlmul[1:0] != 2'b0);

assign funored_split_inst0_sew32_dy_lmul[2:0]    = {vec_funored_cnt[2:0]};
assign funored_split_inst0_sew32_dy_splcnt[2:0]  = 3'b0;
assign funored_split_inst0_sew32_last            = 1'b0;

assign funored_split_inst1_sew32_dy_lmul[2:0]    = {vec_funored_cnt[2:0]};
assign funored_split_inst1_sew32_dy_splcnt[2:0]  = 3'b1;
assign funored_split_inst1_sew32_last            = 1'b0;

assign funored_split_inst2_sew32_dy_lmul[2:0]    = {vec_funored_cnt[2:0]};
assign funored_split_inst2_sew32_dy_splcnt[2:0]  = 3'b10;
assign funored_split_inst2_sew32_last            = funored_cnt_end;
assign funored_split_inst2_sew32_round_end       = 1'b1;

assign funored_split_inst3_sew32_dy_lmul[2:0]    = {vec_funored_cnt[2:0]};
assign funored_split_inst3_sew32_dy_splcnt[2:0]  = 3'b11;
assign funored_split_inst3_sew32_last            = 1'b0;

assign funored_split_inst0_sew16_dy_lmul[2:0]    = {vec_funored_cnt[2:0]};
assign funored_split_inst0_sew16_dy_splcnt[2:0]  = {3'b0};
assign funored_split_inst0_sew16_last            = 1'b0;

assign funored_split_inst1_sew16_dy_lmul[2:0]    = {vec_funored_cnt[2:0]};
assign funored_split_inst1_sew16_dy_splcnt[2:0]  = {3'b1};
assign funored_split_inst1_sew16_last            = 1'b0;

assign funored_split_inst2_sew16_dy_lmul[2:0]    = {vec_funored_cnt[2:0]};
assign funored_split_inst2_sew16_dy_splcnt[2:0]  = {3'b10};
assign funored_split_inst2_sew16_last            = 1'b0;
assign funored_split_inst2_sew16_round_end       = 1'b0;
assign funored_split_inst3_sew16_dy_lmul[2:0]    = {vec_funored_cnt[2:0]};
assign funored_split_inst3_sew16_dy_splcnt[2:0]  = {3'b11};
assign funored_split_inst3_sew16_last            = funored_cnt_end;

// &CombBeg; @3258
always @( funored_split_inst1_sew16_dy_splcnt[2:0]
       or funored_split_inst3_sew16_last
       or funored_split_inst1_sew32_dy_lmul[2:0]
       or funored_split_inst3_sew64_dy_lmul[2:0]
       or funored_split_inst2_sew64_last
       or funored_split_inst0_sew16_last
       or funored_split_inst0_sew32_last
       or funored_split_inst3_sew64_dy_splcnt[2:0]
       or funored_split_inst0_sew32_dy_splcnt[2:0]
       or funored_split_inst2_sew16_round_end
       or funored_split_inst2_sew16_dy_lmul[2:0]
       or funored_split_inst3_sew16_dy_splcnt[2:0]
       or funored_split_inst2_sew16_dy_splcnt[2:0]
       or funored_split_inst2_sew64_round_end
       or funored_split_inst0_sew64_last
       or funored_split_inst0_sew64_dy_lmul[2:0]
       or funored_split_inst2_sew32_dy_lmul[2:0]
       or funored_split_inst2_sew32_round_end
       or funored_split_inst3_sew64_last
       or funored_split_inst2_sew32_dy_splcnt[2:0]
       or funored_split_inst0_sew16_dy_lmul[2:0]
       or funored_split_inst1_sew64_dy_splcnt[2:0]
       or funored_split_inst1_sew32_last
       or funored_split_inst2_sew16_last
       or funored_split_inst1_sew64_last
       or funored_split_inst2_sew64_dy_splcnt[2:0]
       or funored_split_inst3_sew16_dy_lmul[2:0]
       or funored_split_inst2_sew32_last
       or funored_split_inst3_sew32_last
       or funored_split_inst0_sew16_dy_splcnt[2:0]
       or funored_split_inst2_sew64_dy_lmul[2:0]
       or funored_split_inst1_sew16_last
       or funored_split_inst1_sew64_dy_lmul[2:0]
       or funored_split_inst3_sew32_dy_splcnt[2:0]
       or funored_split_inst1_sew16_dy_lmul[2:0]
       or funored_split_inst0_sew32_dy_lmul[2:0]
       or funored_split_inst3_sew32_dy_lmul[2:0]
       or funored_split_inst0_sew64_dy_splcnt[2:0]
       or dp_split_long_vsew[1:0]
       or funored_split_inst1_sew32_dy_splcnt[2:0])
begin
case(dp_split_long_vsew[1:0])
  2'b01: 
  begin
    funored_split_inst0_split_cnt[5:0]   = {funored_split_inst0_sew16_dy_splcnt[2:0],funored_split_inst0_sew16_dy_lmul[2:0]};
    funored_split_inst0_last             = funored_split_inst0_sew16_last; 
    funored_split_inst1_split_cnt[5:0]   = {funored_split_inst1_sew16_dy_splcnt[2:0],funored_split_inst1_sew16_dy_lmul[2:0]};
    funored_split_inst1_last             = funored_split_inst1_sew16_last; 
    funored_split_inst2_split_cnt[5:0]   = {funored_split_inst2_sew16_dy_splcnt[2:0],funored_split_inst2_sew16_dy_lmul[2:0]};
    funored_split_inst2_last             = funored_split_inst2_sew16_last; 
    funored_split_inst2_round_end        = funored_split_inst2_sew16_round_end;
    funored_split_inst3_split_cnt[5:0]   = {funored_split_inst3_sew16_dy_splcnt[2:0],funored_split_inst3_sew16_dy_lmul[2:0]};
    funored_split_inst3_last             = funored_split_inst3_sew16_last; 
  end
  2'b10:
  begin
    funored_split_inst0_split_cnt[5:0]   = {funored_split_inst0_sew32_dy_splcnt[2:0],funored_split_inst0_sew32_dy_lmul[2:0]};
    funored_split_inst0_last             = funored_split_inst0_sew32_last; 
    funored_split_inst1_split_cnt[5:0]   = {funored_split_inst1_sew32_dy_splcnt[2:0],funored_split_inst1_sew32_dy_lmul[2:0]};
    funored_split_inst1_last             = funored_split_inst1_sew32_last; 
    funored_split_inst2_split_cnt[5:0]   = {funored_split_inst2_sew32_dy_splcnt[2:0],funored_split_inst2_sew32_dy_lmul[2:0]};
    funored_split_inst2_last             = funored_split_inst2_sew32_last; 
    funored_split_inst2_round_end        = funored_split_inst2_sew32_round_end;
    funored_split_inst3_split_cnt[5:0]   = {funored_split_inst3_sew32_dy_splcnt[2:0],funored_split_inst3_sew32_dy_lmul[2:0]};
    funored_split_inst3_last             = funored_split_inst3_sew32_last; 
  end
  2'b11:
  begin
    funored_split_inst0_split_cnt[5:0]   = {funored_split_inst0_sew64_dy_splcnt[2:0],funored_split_inst0_sew64_dy_lmul[2:0]};
    funored_split_inst0_last             = funored_split_inst0_sew64_last; 
    funored_split_inst1_split_cnt[5:0]   = {funored_split_inst1_sew64_dy_splcnt[2:0],funored_split_inst1_sew64_dy_lmul[2:0]};
    funored_split_inst1_last             = funored_split_inst1_sew64_last; 
    funored_split_inst2_split_cnt[5:0]   = {funored_split_inst2_sew64_dy_splcnt[2:0],funored_split_inst2_sew64_dy_lmul[2:0]};
    funored_split_inst2_last             = funored_split_inst2_sew64_last; 
    funored_split_inst2_round_end        = funored_split_inst2_sew64_round_end;
    funored_split_inst3_split_cnt[5:0]   = {funored_split_inst3_sew64_dy_splcnt[2:0],funored_split_inst3_sew64_dy_lmul[2:0]};
    funored_split_inst3_last             = funored_split_inst3_sew64_last; 
  end
  default:
  begin
    funored_split_inst0_split_cnt[5:0]   = {6{1'b0}}; 
    funored_split_inst0_last             = {1{1'b0}};
    funored_split_inst1_split_cnt[5:0]   = {6{1'b0}};
    funored_split_inst1_last             = {1{1'b0}};
    funored_split_inst2_split_cnt[5:0]   = {6{1'b0}};
    funored_split_inst2_last             = {1{1'b0}};
    funored_split_inst2_round_end        = {1{1'b0}};
    funored_split_inst3_split_cnt[5:0]   = {6{1'b0}};
    funored_split_inst3_last             = {1{1'b0}};
  end
endcase
// &CombEnd; @3309
end

assign vec_funored_srcv0_vreg_0[4:0] = vec_inst[24:20] | {2'b0,funored_split_inst0_split_cnt[2 :0]};
assign vec_funored_srcv0_vreg_2[4:0] = vec_inst[24:20] | {2'b0,funored_split_inst2_split_cnt[2 :0]};
assign vec_funored_srcv1_vreg[4:0]  = vec_inst[19:15];
assign vec_funored_destv_vreg[4:0]  = vec_inst[11:7];
//----------------------------------------------------------
//                  float order split inst 0/4
//----------------------------------------------------------
// &CombBeg; @3318
always @( vec_funored_srcv0_vreg_0[4:0]
       or funored_fst_round
       or funored_split_inst0_last
       or vec_funored_srcv1_vreg[4:0]
       or vec_inst[31:0]
       or funored_split_inst0_split_cnt[5:0])
begin
  vec_funored_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_funored_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_funored_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,funored_split_inst0_split_cnt[5:0]}; 
  vec_funored_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_funored_split_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_funored_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_funored_split_inst0_data[IR_SRCV2_VLD]                  = 1'b0;
  vec_funored_split_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_funored_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_funored_split_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_funored_srcv0_vreg_0[4:0]};
  vec_funored_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = funored_fst_round ? {1'b0,vec_funored_srcv1_vreg[4:0]} : 6'b100001;
  vec_funored_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100000;
  vec_funored_split_inst0_data[IR_DSTE_VLD]                   = 1'b1;
  vec_funored_split_inst0_data[IR_VMLA]                       = 1'b0;
  vec_funored_split_inst0_data[IR_INTMASK]                    = !funored_split_inst0_last;
  vec_funored_split_inst0_data[IR_SPLIT]                      = !funored_split_inst0_last;
  vec_funored_split_inst0_data[IR_IID_PLUS-3]                 = !funored_split_inst0_last;
  vec_funored_split_inst0_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3339
end

//----------------------------------------------------------
//                  funoredal inst 1/5
//----------------------------------------------------------
assign vec_funored_split_inst1_dest[5:0]                      = dp_split_long_vsew[1:0] == 2'b11 ? 
                                                                      funored_split_inst1_last ? {1'b0,vec_funored_destv_vreg[4:0]} : 6'b100001
                                                                     : 6'b100000;
// &CombBeg; @3347
always @( funored_fst_round
       or funored_split_inst1_split_cnt[5:0]
       or vec_funored_srcv1_vreg[4:0]
       or vec_inst[31:0]
       or vec_funored_split_inst1_dest[5:0]
       or funored_split_inst1_last)
begin
  vec_funored_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_funored_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_funored_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,funored_split_inst1_split_cnt[5:0]};
  vec_funored_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_funored_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_funored_split_inst1_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_funored_split_inst1_data[IR_SRCV2_VLD]                  = 1'b0;
  vec_funored_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_funored_split_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vec_funored_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = 6'b100000;
  vec_funored_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = funored_fst_round ? {1'b0,vec_funored_srcv1_vreg[4:0]} : 6'b100001;
  vec_funored_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vec_funored_split_inst1_dest[5:0];
  vec_funored_split_inst1_data[IR_DSTE_VLD]                   = 1'b1;
  vec_funored_split_inst1_data[IR_VMLA]                       = 1'b0;
  vec_funored_split_inst1_data[IR_INTMASK]                    = !funored_split_inst1_last;
  vec_funored_split_inst1_data[IR_SPLIT]                      = !funored_split_inst1_last;
  vec_funored_split_inst1_data[IR_IID_PLUS-3]                 = !funored_split_inst1_last;
  vec_funored_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3368
end

//----------------------------------------------------------
//                  funoredal inst 2/6
//----------------------------------------------------------
// &CombBeg; @3373
always @( funored_fst_round
       or vec_funored_destv_vreg[4:0]
       or funored_split_inst2_split_cnt[5:0]
       or vec_inst[31:0]
       or vec_funored_srcv1_vreg[4:0]
       or funored_split_inst2_round_end
       or funored_split_inst2_last
       or vec_funored_srcv0_vreg_2[4:0]
       or dp_split_long_vsew[1:0])
begin
  vec_funored_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_funored_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_funored_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,funored_split_inst2_split_cnt[5:0]};
  vec_funored_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_funored_split_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_funored_split_inst2_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_funored_split_inst2_data[IR_SRCV2_VLD]                  = 1'b0;
  vec_funored_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_funored_split_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vec_funored_split_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = dp_split_long_vsew[1:0] == 2'b11 ? {1'b0,vec_funored_srcv0_vreg_2[4:0]} : 6'b100000;
  vec_funored_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = funored_fst_round && (dp_split_long_vsew[1:0] != 2'b11) ? {1'b0,vec_funored_srcv1_vreg[4:0]} : 6'b100001;
  vec_funored_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = funored_split_inst2_last ? {1'b0,vec_funored_destv_vreg[4:0]} : 
                                                                funored_split_inst2_round_end ? 6'b100001 : 6'b100000;
  vec_funored_split_inst2_data[IR_DSTE_VLD]                   = 1'b1;
  vec_funored_split_inst2_data[IR_VMLA]                       = 1'b0;
  vec_funored_split_inst2_data[IR_INTMASK]                    = !funored_split_inst2_last;
  vec_funored_split_inst2_data[IR_SPLIT]                      = !funored_split_inst2_last;
  vec_funored_split_inst2_data[IR_IID_PLUS:IR_IID_PLUS-3]     = funored_split_inst2_round_end ? funored_split_inst2_last ? 4'b0: 4'b11 : 4'b1;
  vec_funored_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3395
end

//----------------------------------------------------------
//                  funoredal inst 3/7
//----------------------------------------------------------
// &CombBeg; @3400
always @( funored_split_inst3_last
       or funored_fst_round
       or vec_funored_destv_vreg[4:0]
       or vec_inst[31:0]
       or vec_funored_srcv1_vreg[4:0]
       or funored_split_inst3_split_cnt[5:0]
       or dp_split_long_vsew[1:0])
begin
  vec_funored_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_funored_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_funored_split_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,funored_split_inst3_split_cnt[5:0]};
  vec_funored_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_funored_split_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_funored_split_inst3_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_funored_split_inst3_data[IR_SRCV2_VLD]                  = 1'b0;
  vec_funored_split_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_funored_split_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vec_funored_split_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = 6'b100000;
  vec_funored_split_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = funored_fst_round && (dp_split_long_vsew[1:0] != 2'b11) ? {1'b0,vec_funored_srcv1_vreg[4:0]} : 6'b100001;
  vec_funored_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = funored_split_inst3_last ? {1'b0,vec_funored_destv_vreg[4:0]} : 6'b100001;
  vec_funored_split_inst3_data[IR_DSTE_VLD]                   = 1'b1;
  vec_funored_split_inst3_data[IR_VMLA]                       = 1'b0;
  vec_funored_split_inst3_data[IR_INTMASK]                    = !funored_split_inst3_last;
  vec_funored_split_inst3_data[IR_SPLIT]                      = !funored_split_inst3_last;
  vec_funored_split_inst3_data[IR_IID_PLUS:IR_IID_PLUS-3]     = funored_split_inst3_last ? 4'b0 : 4'b100;
  vec_funored_split_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3421
end


assign vec_funored_dep_info[DEP_WIDTH-1:0]  = {DEP_WIDTH{1'b0}};

assign vec_funored_inst0_data[IR_WIDTH-1:0] = vec_funored_split_inst0_data[IR_WIDTH-1:0];
assign vec_funored_inst1_data[IR_WIDTH-1:0] = vec_funored_split_inst1_data[IR_WIDTH-1:0];
assign vec_funored_inst2_data[IR_WIDTH-1:0] = vec_funored_split_inst2_data[IR_WIDTH-1:0];
assign vec_funored_inst3_data[IR_WIDTH-1:0] = vec_funored_split_inst3_data[IR_WIDTH-1:0];

assign vec_funored_inst_vld[0] = vec_funored_split_busy;
assign vec_funored_inst_vld[1] = vec_funored_split_busy;
assign vec_funored_inst_vld[2] = vec_funored_split_busy && !funored_split_inst1_last;
assign vec_funored_inst_vld[3] = vec_funored_split_busy && !funored_split_inst2_last && !funored_split_inst2_round_end && !funored_split_inst1_last;


//==========================================================
//               Widden UNORDER Instructions split
//==========================================================
parameter VEC_FUNORED_W_IDLE = 1'b0;
parameter VEC_FUNORED_W_BUSY = 1'b1;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_funored_w_split_clk_en = ctrl_split_long_id_inst_vld
                           && dp_split_unfored_w_vld
                           ||!(vec_funored_w_cur_state == VEC_FUNORED_W_IDLE);

// &Instance("gated_clk_cell", "x_vec_funored_w_split_gated_clk"); @3450
gated_clk_cell  x_vec_funored_w_split_gated_clk (
  .clk_in                     (forever_cpuclk            ),
  .clk_out                    (vec_funored_w_split_clk   ),
  .external_en                (1'b0                      ),
  .global_en                  (cp0_yy_clk_en             ),
  .local_en                   (vec_funored_w_split_clk_en),
  .module_en                  (cp0_idu_icg_en            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Connect(.clk_in      (forever_cpuclk), @3451
//          .external_en (1'b0), @3452
//          .global_en   (cp0_yy_clk_en), @3453
//          .module_en   (cp0_idu_icg_en), @3454
//          .local_en    (vec_funored_w_split_clk_en), @3455
//          .clk_out     (vec_funored_w_split_clk)); @3456

always @(posedge vec_funored_w_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_funored_w_cur_state <= VEC_FUNORED_W_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_funored_w_cur_state <= VEC_FUNORED_W_IDLE;
  else
    vec_funored_w_cur_state <= vec_funored_w_next_state;
end
//
always @(posedge vec_funored_w_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_funored_w_cnt[3:0] <= 4'b0;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_funored_w_cnt[3:0] <= 4'b0;
  else if(funored_w_cnt_end)
    vec_funored_w_cnt[3:0] <= 4'b0;
  else if(funored_w_cnt_en)
    vec_funored_w_cnt[3:0] <= vec_funored_w_cnt[3:0] + 4'd1;
end
assign funored_w_total_cnt_num[3:0]     = (4'b0010 << dp_split_long_vlmul[1:0]) - 4'b1;
                                                                 
assign funored_w_cnt_end      = (vec_funored_w_cnt[3:0] == funored_w_total_cnt_num[3:0]) 
                                && !ctrl_split_long_id_stall;
assign funored_w_fst_round    = vec_funored_w_cnt[3:0] == 4'b0;

assign vec_funored_w_sm_start    = ctrl_split_long_id_inst_vld
                                   && dp_split_unfored_w_vld
                                   && !ctrl_split_long_id_stall;

assign vec_funored_w_split_busy  = vec_funored_w_sm_start &&
                                   (vec_funored_w_cur_state == VEC_FUNORED_W_IDLE) || 
                                   (vec_funored_w_cur_state  != VEC_FUNORED_W_IDLE);
assign vec_funored_w_split_stall = vec_funored_w_split_busy && !funored_w_cnt_end;
assign funored_w_cnt_en          = !ctrl_split_long_id_stall && vec_funored_w_split_busy;
//


// &CombBeg; @3497
always @( vec_funored_w_cur_state
       or vec_funored_w_sm_start
       or funored_w_cnt_end
       or ctrl_split_long_id_stall)
begin
  case(vec_funored_w_cur_state)
  VEC_FUNORED_W_IDLE  : if(vec_funored_w_sm_start &&  !funored_w_cnt_end)
                     vec_funored_w_next_state = VEC_FORED_BUSY;
                   else
                     vec_funored_w_next_state = VEC_FORED_IDLE;
  VEC_FUNORED_W_BUSY  : if(!ctrl_split_long_id_stall && funored_w_cnt_end)
                     vec_funored_w_next_state = VEC_FORED_IDLE;
                   else 
                     vec_funored_w_next_state = VEC_FORED_BUSY;
  default        :   vec_funored_w_next_state = VEC_FORED_IDLE;
  endcase
// &CombEnd; @3509
end

assign vec_fred_w_mul8       = dp_split_long_vlmul[1:0] == 2'b11;
assign vec_funored_w_cnt_l[2:0] = vec_fred_w_mul8 ? vec_funored_w_cnt[3:1]
                                                     : vec_funored_w_cnt[2:0];
assign vec_funored_w_cnt_h      = vec_fred_w_mul8 && vec_funored_w_cnt[0];
// &CombBeg; @3515
always @( vec_funored_w_cnt_h
       or vec_fred_w_mul8
       or dp_split_long_vlmul[1:0]
       or vec_inst[31:0]
       or fcvtw_inst[31:0]
       or vec_funored_w_cnt_l[2:0]
       or funored_w_cnt_end
       or dp_split_w_vlmul[1:0]
       or dp_split_long_vsew[1:0])
begin
case(dp_split_long_vsew[1:0])
  2'b01: 
  begin
    funored_w_split_inst0[31:0]            = fcvtw_inst[31:0];
    funored_w_split_inst0_split_cnt[5:0]   = {1'b1,vec_funored_w_cnt_h,vec_fred_w_mul8,vec_funored_w_cnt_l[2:0]};
    funored_w_split_inst0_last             = 1'b0;
    funored_w_split_inst1[31:0]            = vec_inst[31:0];
    funored_w_split_inst1_last             = 1'b0;
    funored_w_split_inst1_split_cnt[5:0]   = {vec_funored_w_cnt_h,2'b0,vec_funored_w_cnt_l[2:0]};
    funored_w_split_inst2[31:0]            = vec_inst[31:0];
    funored_w_split_inst2_last             = 1'b0;
    funored_w_split_inst2_split_cnt[5:0]   = {vec_funored_w_cnt_h,2'b1,vec_funored_w_cnt_l[2:0]};
    funored_w_split_inst3[31:0]            = vec_inst[31:0];
    funored_w_split_inst3_last             = funored_w_cnt_end;
    funored_w_split_inst3_split_cnt[5:0]   = {vec_funored_w_cnt_h,2'b10,vec_funored_w_cnt_l[2:0]};
    funored_w_split_inst0_vsew[2:0]        = 3'b001;
    funored_w_split_inst1_vsew[2:0]        = 3'b010;
    funored_w_split_inst2_vsew[2:0]        = 3'b010;
    funored_w_split_inst3_vsew[2:0]        = 3'b010;
    funored_w_split_inst0_vlmul[1:0]        = dp_split_long_vlmul[1:0];
    funored_w_split_inst1_vlmul[1:0]        = vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];
    funored_w_split_inst2_vlmul[1:0]        = vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];
    funored_w_split_inst3_vlmul[1:0]        = vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];
  end
  2'b10:
  begin
    funored_w_split_inst0[31:0]            = fcvtw_inst[31:0];
    funored_w_split_inst0_split_cnt[5:0]   = {1'b1,vec_funored_w_cnt_h,vec_fred_w_mul8,vec_funored_w_cnt_l[2:0]};
    funored_w_split_inst0_last             = 1'b0;
    funored_w_split_inst1[31:0]            = vec_inst[31:0];
    funored_w_split_inst1_last             = 1'b0;
    funored_w_split_inst1_split_cnt[5:0]   = {vec_funored_w_cnt_h,2'b0,vec_funored_w_cnt_l[2:0]};
    funored_w_split_inst2[31:0]            = vec_inst[31:0];
    funored_w_split_inst2_last             = funored_w_cnt_end;
    funored_w_split_inst2_split_cnt[5:0]   = {vec_funored_w_cnt_h,2'b1,vec_funored_w_cnt_l[2:0]};
    funored_w_split_inst3[31:0]            = vec_inst[31:0];
    funored_w_split_inst3_split_cnt[5:0]   = {vec_funored_w_cnt_h,2'b10,vec_funored_w_cnt_l[2:0]};
    funored_w_split_inst3_last             = 1'b0;
    funored_w_split_inst0_vsew[2:0]        =  3'b010;
    funored_w_split_inst1_vsew[2:0]        =  3'b011;
    funored_w_split_inst2_vsew[2:0]        =  3'b011;
    funored_w_split_inst3_vsew[2:0]        =  3'b011;
    funored_w_split_inst0_vlmul[1:0]        =  dp_split_long_vlmul[1:0];
    funored_w_split_inst1_vlmul[1:0]        =  vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];
    funored_w_split_inst2_vlmul[1:0]        =  vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];
    funored_w_split_inst3_vlmul[1:0]        =  vec_fred_w_mul8 ? 2'b11 : dp_split_w_vlmul[1:0];
  end
    default:
  begin
    funored_w_split_inst0[31:0]            = {32{1'bx}};
    funored_w_split_inst0_split_cnt[5:0]   = {6{1'bx}}; 
    funored_w_split_inst0_last             = {1{1'bx}};
    funored_w_split_inst0_vsew[2:0]        = {3{1'bx}};
    funored_w_split_inst0_vlmul[1:0]        = {2{1'bx}};
    funored_w_split_inst1[31:0]            = {32{1'bx}};
    funored_w_split_inst1_last             = {1{1'bx}};
    funored_w_split_inst1_vsew[2:0]        = {3{1'bx}};
    funored_w_split_inst1_vlmul[1:0]        = {2{1'bx}};
    funored_w_split_inst1_split_cnt[5:0]   =  {6{1'bx}};
    funored_w_split_inst2[31:0]            = {32{1'bx}};
    funored_w_split_inst2_last             = {1{1'bx}};
    funored_w_split_inst2_vsew[2:0]        = {3{1'bx}};
    funored_w_split_inst2_vlmul[1:0]        = {2{1'bx}};
    funored_w_split_inst2_split_cnt[5:0]   =  {6{1'bx}};
    funored_w_split_inst3[31:0]            = {32{1'bx}};
    funored_w_split_inst3_last             = {1{1'bx}};
    funored_w_split_inst3_vsew[2:0]        = {3{1'bx}};
    funored_w_split_inst3_vlmul[1:0]        = {2{1'bx}};
    funored_w_split_inst3_split_cnt[5:0]   =  {6{1'bx}};
  end
endcase
// &CombEnd; @3587
end

assign vec_funored_w_srcv0_vreg_0[4:0] = vec_inst[24:20] | {2'b0,vec_funored_w_cnt[3 :1]};
//assign vec_funored_w_srcv0_vreg_1[4:0] = vec_inst[24:20] | {2'b0,funored_w_split_inst1_split_cnt[2 :0]};
//assign vec_funored_w_srcv0_vreg_2[4:0] = vec_inst[24:20] | {2'b0,funored_w_split_inst2_split_cnt[2 :0]};
//assign vec_funored_w_srcv0_vreg_3[4:0] = vec_inst[24:20] | {2'b0,funored_w_split_inst3_split_cnt[2 :0]};

assign vec_funored_w_srcv1_vreg[4:0]  = vec_inst[19:15];
assign vec_funored_w_destv_vreg[4:0]  = vec_inst[11:7];
//----------------------------------------------------------
//                  float order split inst 0/4
//----------------------------------------------------------
// &CombBeg; @3599
always @( vec_inst[25]
       or funored_w_split_inst0_last
       or vec_funored_w_srcv0_vreg_0[4:0]
       or funored_w_split_inst0_split_cnt[5:0]
       or vec_funored_w_srcv1_vreg[4:0]
       or funored_w_split_inst0[31:0])
begin
  vec_funored_w_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_funored_w_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE7;
  vec_funored_w_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,funored_w_split_inst0_split_cnt[5:0]};
  vec_funored_w_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = funored_w_split_inst0[31:0];
  vec_funored_w_split_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_funored_w_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_funored_w_split_inst0_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_funored_w_split_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_funored_w_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_funored_w_split_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_funored_w_srcv0_vreg_0[4:0]};
  vec_funored_w_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = {1'b0,vec_funored_w_srcv1_vreg[4:0]};
  vec_funored_w_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100000;
  vec_funored_w_split_inst0_data[IR_DSTE_VLD]                   = 1'b1;
  vec_funored_w_split_inst0_data[IR_VMLA]                       = 1'b0;
  vec_funored_w_split_inst0_data[IR_INTMASK]                    = !funored_w_split_inst0_last;
  vec_funored_w_split_inst0_data[IR_SPLIT]                      = !funored_w_split_inst0_last;
  vec_funored_w_split_inst0_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3619
end

//----------------------------------------------------------
//                  funored_wal inst 1/5
//----------------------------------------------------------
// &CombBeg; @3624
always @( funored_w_split_inst1[31:0]
       or funored_w_split_inst1_last
       or vec_fred_w_mul8
       or vec_inst[25]
       or funored_w_split_inst1_split_cnt[5:0]
       or vec_funored_w_srcv1_vreg[4:0]
       or funored_w_fst_round)
begin
  vec_funored_w_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_funored_w_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_funored_w_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_fred_w_mul8,funored_w_split_inst1_split_cnt[5:0]};
  vec_funored_w_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = funored_w_split_inst1[31:0];
  vec_funored_w_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_funored_w_split_inst1_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_funored_w_split_inst1_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_funored_w_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_funored_w_split_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vec_funored_w_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = 6'b100000;
  vec_funored_w_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = funored_w_fst_round ? {1'b0,vec_funored_w_srcv1_vreg[4:0]}
                                                                                      : 6'b100001;
  vec_funored_w_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100000;
  vec_funored_w_split_inst1_data[IR_DSTE_VLD]                   = 1'b1;
  vec_funored_w_split_inst1_data[IR_VMLA]                       = 1'b0;
  vec_funored_w_split_inst1_data[IR_INTMASK]                    = !funored_w_split_inst1_last;
  vec_funored_w_split_inst1_data[IR_SPLIT]                      = !funored_w_split_inst1_last;
  vec_funored_w_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3645
end

//----------------------------------------------------------
//                  funored_wal inst 2/6
//----------------------------------------------------------
// &CombBeg; @3650
always @( funored_w_split_inst2[31:0]
       or vec_fred_w_mul8
       or vec_inst[25]
       or funored_w_split_inst2_last
       or vec_funored_w_destv_vreg[4:0]
       or dp_split_long_vsew[1]
       or vec_funored_w_srcv1_vreg[4:0]
       or funored_w_fst_round
       or funored_w_split_inst2_split_cnt[5:0])
begin
  vec_funored_w_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_funored_w_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_funored_w_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_fred_w_mul8,funored_w_split_inst2_split_cnt[5:0]};
  vec_funored_w_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = funored_w_split_inst2[31:0];
  vec_funored_w_split_inst2_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_funored_w_split_inst2_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_funored_w_split_inst2_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_funored_w_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_funored_w_split_inst2_data[IR_DSTV_VLD]                   = 1'b1;
  vec_funored_w_split_inst2_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = 6'b100000;
  vec_funored_w_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = funored_w_fst_round  
                                                                  ? {1'b0,vec_funored_w_srcv1_vreg[4:0]} : 6'b100001;
  vec_funored_w_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = dp_split_long_vsew[1] ? 
                                                                  funored_w_split_inst2_last ? {1'b0,vec_funored_w_destv_vreg[4:0]}
                                                                                             : 6'b100001
                                                                                        :  6'b100000;
  vec_funored_w_split_inst2_data[IR_DSTE_VLD]                   = 1'b1;
  vec_funored_w_split_inst2_data[IR_VMLA]                       = 1'b0;
  vec_funored_w_split_inst2_data[IR_INTMASK]                    = !funored_w_split_inst2_last;
  vec_funored_w_split_inst2_data[IR_SPLIT]                      = !funored_w_split_inst2_last;
  vec_funored_w_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3674
end

//----------------------------------------------------------
//                  funored_wal inst 3/7
//----------------------------------------------------------
// &CombBeg; @3679
always @( funored_w_split_inst3_split_cnt[5:0]
       or funored_w_split_inst3_last
       or vec_fred_w_mul8
       or vec_inst[25]
       or vec_funored_w_destv_vreg[4:0]
       or vec_funored_w_srcv1_vreg[4:0]
       or funored_w_fst_round
       or funored_w_split_inst3[31:0])
begin
  vec_funored_w_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_funored_w_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_funored_w_split_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_fred_w_mul8,funored_w_split_inst3_split_cnt[5:0]};
  vec_funored_w_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = funored_w_split_inst3[31:0];
  vec_funored_w_split_inst3_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_funored_w_split_inst3_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_funored_w_split_inst3_data[IR_SRCV2_VLD]                  = !vec_inst[25];
  vec_funored_w_split_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_funored_w_split_inst3_data[IR_DSTV_VLD]                   = 1'b1;
  vec_funored_w_split_inst3_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = 6'b100000;
  vec_funored_w_split_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = funored_w_fst_round  
                                                                  ? {1'b0,vec_funored_w_srcv1_vreg[4:0]} : 6'b100001;
  vec_funored_w_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = funored_w_split_inst3_last ? {1'b0,vec_funored_w_destv_vreg[4:0]} : 6'b100001;
  vec_funored_w_split_inst3_data[IR_DSTE_VLD]                   = 1'b1;
  vec_funored_w_split_inst3_data[IR_VMLA]                       = 1'b0;
  vec_funored_w_split_inst3_data[IR_INTMASK]                    = !funored_w_split_inst3_last;
  vec_funored_w_split_inst3_data[IR_SPLIT]                      = !funored_w_split_inst3_last;
  vec_funored_w_split_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3700
end


assign vec_funored_w_dep_info[DEP_WIDTH-1:0]  = {DEP_WIDTH{1'b0}};

assign vec_funored_w_inst0_data[IR_WIDTH-1:0] = vec_funored_w_split_inst0_data[IR_WIDTH-1:0];
assign vec_funored_w_inst1_data[IR_WIDTH-1:0] = vec_funored_w_split_inst1_data[IR_WIDTH-1:0];
assign vec_funored_w_inst2_data[IR_WIDTH-1:0] = vec_funored_w_split_inst2_data[IR_WIDTH-1:0];
assign vec_funored_w_inst3_data[IR_WIDTH-1:0] = vec_funored_w_split_inst3_data[IR_WIDTH-1:0];

assign vec_funored_w_split_inst0_sew[2:0]  = funored_w_split_inst0_vsew[2:0];
assign vec_funored_w_split_inst1_sew[2:0]  = funored_w_split_inst1_vsew[2:0];
assign vec_funored_w_split_inst2_sew[2:0]  = funored_w_split_inst2_vsew[2:0];
assign vec_funored_w_split_inst3_sew[2:0]  = funored_w_split_inst3_vsew[2:0];

assign vec_funored_w_split_inst0_lmul[1:0]  = funored_w_split_inst0_vlmul[1:0];
assign vec_funored_w_split_inst1_lmul[1:0]  = funored_w_split_inst1_vlmul[1:0];
assign vec_funored_w_split_inst2_lmul[1:0]  = funored_w_split_inst2_vlmul[1:0];
assign vec_funored_w_split_inst3_lmul[1:0]  = funored_w_split_inst3_vlmul[1:0];

assign vec_funored_w_inst_vld[0] = vec_funored_w_split_busy;
assign vec_funored_w_inst_vld[1] = vec_funored_w_split_busy;
assign vec_funored_w_inst_vld[2] = vec_funored_w_split_busy;
assign vec_funored_w_inst_vld[3] = vec_funored_w_split_busy && dp_split_long_vsew[0];

//==========================================================
//              vector stride ld/st split 
//==========================================================
parameter VEC_STRIDE_IDLE  = 1'b0;
parameter VEC_STRIDE_SPLIT = 1'b1;

parameter VEC_STRIDE_TYPE = 4;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------
assign vec_stride_split_clk_en = ctrl_split_long_id_inst_vld
                           && (dp_split_long_type[VEC_STRIDE_TYPE])
                           ||!(vec_stride_cur_state == VEC_STRIDE_IDLE);

// &Instance("gated_clk_cell", "x_vec_stride_split_gated_clk"); @3739
gated_clk_cell  x_vec_stride_split_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (vec_stride_split_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (vec_stride_split_clk_en),
  .module_en               (cp0_idu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in      (forever_cpuclk), @3740
//          .external_en (1'b0), @3741
//          .global_en   (cp0_yy_clk_en), @3742
//          .module_en   (cp0_idu_icg_en), @3743
//          .local_en    (vec_stride_split_clk_en), @3744
//          .clk_out     (vec_stride_split_clk)); @3745

always @(posedge vec_stride_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_stride_cur_state <= VEC_STRIDE_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_stride_cur_state <= VEC_STRIDE_IDLE;
  else
    vec_stride_cur_state <= vec_stride_next_state;
end
assign vec_stride_sm_start       = ctrl_split_long_id_inst_vld
                              && dp_split_long_type[VEC_STRIDE_TYPE]
                              && !ctrl_split_long_id_stall;


assign vec_stride_split_stall =  vec_stride_sm_start && !vec_stride_split_last;

// &CombBeg; @3763
always @( vec_stride_cur_state
       or vec_stride_split_last
       or ctrl_split_long_id_stall
       or vec_stride_sm_start)
begin
  case(vec_stride_cur_state)
  VEC_STRIDE_IDLE  : if(vec_stride_sm_start && !vec_stride_split_last)
                     vec_stride_next_state = VEC_STRIDE_SPLIT;
                     else
                     vec_stride_next_state = VEC_STRIDE_IDLE;
  VEC_STRIDE_SPLIT : if(!ctrl_split_long_id_stall && vec_stride_split_last)
                     vec_stride_next_state = VEC_STRIDE_IDLE;
                     else
                     vec_stride_next_state = VEC_STRIDE_SPLIT;
  default        :   vec_stride_next_state = VEC_STRIDE_IDLE;
  endcase
// &CombEnd; @3775
end

always @(posedge vec_stride_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_stride_cnt[5:0]  <= {6{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_stride_cnt[5:0] <= {6{1'b0}};
  else if(vec_stride_sm_start || vec_stride_cur_state &&!ctrl_split_long_id_stall)  
    vec_stride_cnt[5:0] <= vec_stride_split_last ? {6{1'b0}}: (vec_stride_cnt[5:0] + 1'b1);
end

always @(posedge vec_stride_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_stride_vreg_offset[2:0]  <= {3{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_stride_vreg_offset[2:0]  <= {3{1'b0}};
  else if(vec_stride_sm_start || vec_stride_cur_state &&!ctrl_split_long_id_stall)  
    vec_stride_vreg_offset[2:0] <= vec_stride_split_last ? {3{1'b0}}: (vec_stride_vreg_offset[2:0] + {2'b00,vec_stride_vreg_end});
end

assign vec_stride_vreg_begin = (vec_sew[1:0]==2'b00) && (vec_stride_cnt[2:0]==3'b000) 
                            || (vec_sew[1:0]==2'b01) && (vec_stride_cnt[1:0]==2'b00)
                            || (vec_sew[1:0]==2'b10) && (vec_stride_cnt[0]  ==1'b0)
                            || (vec_sew[1:0]==2'b11);

assign vec_stride_vreg_end   = (vec_sew[1:0]==2'b00) && (vec_stride_cnt[2:0]==3'b111)
                            || (vec_sew[1:0]==2'b01) && (vec_stride_cnt[1:0]==2'b11)
                            || (vec_sew[1:0]==2'b10) && (vec_stride_cnt[0]  ==1'b1)
                            || (vec_sew[1:0]==2'b11);

assign vec_stride_split_last_normal = (vec_lmul[1:0]==2'b00) && vec_stride_vreg_end 
                                   || (vec_lmul[1:0]==2'b01) && vec_stride_vreg_end &&  vec_stride_vreg_offset[0] 
                                   || (vec_lmul[1:0]==2'b10) && vec_stride_vreg_end && &vec_stride_vreg_offset[1:0] 
                                   || (vec_lmul[1:0]==2'b11) && vec_stride_vreg_end && &vec_stride_vreg_offset[2:0];

//for dstv0 overlap
assign vec_stride_dstv0_ovlp = vec_ld && (vec_inst[11:7] == 5'b0) && !vec_inst[25];
assign vec_stride_v0_begin   = !vec_stride_cur_state; 

assign vec_stride_v0_split_last = (vec_sew[1:0]==2'b00)    && (vec_stride_cnt[3:0]==4'b1111) 
                                  || (vec_sew[1:0]==2'b01) && (vec_stride_cnt[2:0]==3'b111)
                                  || (vec_sew[1:0]==2'b10) && (vec_stride_cnt[1:0]==2'b11)
                                  || (vec_sew[1:0]==2'b11) && vec_stride_cnt[0]; 
                                        
assign vec_stride_split_secd_to_last = (vec_sew[1:0]==2'b00)    && (vec_stride_cnt[3:0]==4'b1110) 
                                       || (vec_sew[1:0]==2'b01) && (vec_stride_cnt[2:0]==3'b110)
                                       || (vec_sew[1:0]==2'b10) && (vec_stride_cnt[1:0]==2'b10)
                                       || (vec_sew[1:0]==2'b11);

assign vec_stride_split_last = vec_stride_dstv0_ovlp ? vec_stride_v0_split_last : vec_stride_split_last_normal; 

assign vec_stride_add_inst[31:7] = {25{1'b0}};
assign vec_stride_add_inst[6 :0] = 7'b0110011;
//----------------------------------------------------------
//                  stride inst 0/4
//----------------------------------------------------------
// &CombBeg; @3833
always @( vec_index_vmv_inst[31:0]
       or vec_stride_cur_state
       or vec_inst[31:0]
       or vec_stride_dstv0_ovlp
       or vec_stride_vreg_offset[2:0]
       or vec_stride_v0_begin
       or vec_stride_vreg_begin
       or vec_stride_cnt[5:0])
begin
  vec_stride_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(vec_stride_dstv0_ovlp) begin
  vec_stride_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_stride_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_index_vmv_inst[31:0];  //vmv.vv
  vec_stride_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_stride_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_stride_v0_begin 
                                                               ? 6'b000_000
                                                               : 6'b100_000;
  vec_stride_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_stride_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100_000;
  vec_stride_split_inst0_data[IR_INTMASK]                    = 1'b1;
  vec_stride_split_inst0_data[IR_SPLIT]                      = 1'b1;
  vec_stride_split_inst0_data[IR_LENGTH]                     = 1'b1;
  vec_stride_split_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'd3;
  end
  else begin
  vec_stride_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = (vec_inst[5] || vec_stride_vreg_begin) ? LSU_P5 :LSU;
  vec_stride_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_stride_cnt[5:0],1'b0};
  vec_stride_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_stride_split_inst0_data[IR_SRC0_VLD]                   = 1'b1;
  vec_stride_split_inst0_data[IR_SRC0_REG:IR_SRC0_REG-5]     = vec_stride_cur_state ? 6'b100_000: {1'b0,vec_inst[19:15]};
  vec_stride_split_inst0_data[IR_SRCV2_VLD]                  = vec_stride_vreg_begin || vec_inst[5];
  vec_stride_split_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_stride_split_inst0_data[IR_DSTV_VLD]                   = !vec_inst[5] && vec_stride_vreg_begin;
  vec_stride_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = {1'b0,vec_inst[11:7]} | {3'b0,vec_stride_vreg_offset[2:0]};
  vec_stride_split_inst0_data[IR_INTMASK]                    = 1'b1;
  vec_stride_split_inst0_data[IR_SPLIT]                      = 1'b1;
  vec_stride_split_inst0_data[IR_LENGTH]                     = 1'b1;
  vec_stride_split_inst0_data[IR_VMB]                        = !vec_inst[5] && vec_stride_vreg_begin; 
  end
// &CombEnd; @3864
end

//----------------------------------------------------------
//                  stride inst 1/5
//----------------------------------------------------------
// &CombBeg; @3869
always @( vec_stride_cur_state
       or vec_stride_split_last
       or vec_inst[31:0]
       or vec_stride_dstv0_ovlp
       or vec_stride_v0_begin
       or vec_stride_cnt[5:0]
       or vec_stride_add_inst[31:0])
begin
  vec_stride_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(vec_stride_dstv0_ovlp) begin
  vec_stride_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = vec_stride_v0_begin ? LSU_P5 :LSU;
  vec_stride_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {1'b0,vec_stride_cnt[5:0]};
  vec_stride_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_stride_split_inst1_data[IR_SRC0_VLD]                   = 1'b1;
  vec_stride_split_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5]     = vec_stride_cur_state ? 6'b100_000: {1'b0,vec_inst[19:15]};
  vec_stride_split_inst1_data[IR_SRCV2_VLD]                  = vec_stride_v0_begin;
//  vec_stride_split_inst1_data[IR_SRCVM_VLD]                  = 1'b1;
  vec_stride_split_inst1_data[IR_SRCV1_VLD]                  = 1'b1;   //for lsu,use v1 renaming for vm
  vec_stride_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = 6'b100_000;
  vec_stride_split_inst1_data[IR_DSTV_VLD]                   = vec_stride_v0_begin;
  vec_stride_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b000_000;
  vec_stride_split_inst1_data[IR_INTMASK]                    = !vec_stride_split_last;
  vec_stride_split_inst1_data[IR_SPLIT]                      = !vec_stride_split_last;
  vec_stride_split_inst1_data[IR_LENGTH]                     = 1'b1;
  vec_stride_split_inst1_data[IR_VMB]                        = vec_stride_v0_begin;
  end
  else begin
  vec_stride_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = ALU;
  vec_stride_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_stride_add_inst[31:0];
  vec_stride_split_inst1_data[IR_SRC0_VLD]                   = 1'b1;
  vec_stride_split_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5]     = vec_stride_cur_state ? 6'b100_000: {1'b0,vec_inst[19:15]};
  vec_stride_split_inst1_data[IR_SRC1_VLD]                   = 1'b1;
  vec_stride_split_inst1_data[IR_SRC1_REG-1:IR_SRC1_REG-5]   = vec_inst[24:20];
  vec_stride_split_inst1_data[IR_DST_VLD]                    = 1'b1;
  vec_stride_split_inst1_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100000;
  vec_stride_split_inst1_data[IR_INTMASK]                    = 1'b1;
  vec_stride_split_inst1_data[IR_SPLIT]                      = 1'b1;
  vec_stride_split_inst1_data[IR_IID_PLUS:IR_IID_PLUS-3]     = vec_stride_split_last ? 4'b0001: 4'b0010;
  vec_stride_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3902
end

//----------------------------------------------------------
//                  stride inst 2/6
//----------------------------------------------------------
// &CombBeg; @3907
always @( vec_stride_split_secd_to_last
       or vec_stride_cur_state
       or vec_stride_split_last
       or vec_inst[31:0]
       or vec_stride_dstv0_ovlp
       or vec_stride_vreg_offset[2:0]
       or vec_stride_cnt[5:0]
       or vec_stride_add_inst[31:0])
begin
  vec_stride_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(vec_stride_dstv0_ovlp) begin
  vec_stride_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = ALU;
  vec_stride_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_stride_add_inst[31:0];
  vec_stride_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  vec_stride_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = vec_stride_cur_state ? 6'b100_000: {1'b0,vec_inst[19:15]};
  vec_stride_split_inst2_data[IR_SRC1_VLD]                   = 1'b1;
  vec_stride_split_inst2_data[IR_SRC1_REG-1:IR_SRC1_REG-5]   = vec_inst[24:20];
  vec_stride_split_inst2_data[IR_DST_VLD]                    = 1'b1;
  vec_stride_split_inst2_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100000;
  vec_stride_split_inst2_data[IR_INTMASK]                    = 1'b1;
  vec_stride_split_inst2_data[IR_SPLIT]                      = 1'b1;
  vec_stride_split_inst2_data[IR_IID_PLUS:IR_IID_PLUS-3]     = vec_stride_split_secd_to_last ? 4'b0010: 4'b0011;
  vec_stride_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
  else begin
  vec_stride_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = vec_inst[5] ? LSU_P5 :LSU;
  vec_stride_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {vec_stride_cnt[5:0],1'b1};
  vec_stride_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_stride_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  vec_stride_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  vec_stride_split_inst2_data[IR_SRCV2_VLD]                  = vec_inst[5];
  vec_stride_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_stride_split_inst2_data[IR_DSTV_VLD]                   = 1'b0;
  vec_stride_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = {1'b0,vec_inst[11:7]} | {3'b0,vec_stride_vreg_offset[2:0]};
  vec_stride_split_inst2_data[IR_INTMASK]                    = !vec_stride_split_last;
  vec_stride_split_inst2_data[IR_SPLIT]                      = !vec_stride_split_last;
  vec_stride_split_inst2_data[IR_LENGTH]                     = 1'b1;
  vec_stride_split_inst2_data[IR_VMB]                        = 1'b0;
  end
// &CombEnd; @3938
end

//----------------------------------------------------------
//                  stride inst 3/7
//----------------------------------------------------------
// &CombBeg; @3943
always @( vec_inst[24:20]
       or vec_stride_dstv0_ovlp
       or vec_stride_add_inst[31:0])
begin
  vec_stride_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(!vec_stride_dstv0_ovlp) begin
  vec_stride_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = ALU;
  vec_stride_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_stride_add_inst[31:0];
  vec_stride_split_inst3_data[IR_SRC0_VLD]                   = 1'b1;
  vec_stride_split_inst3_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  vec_stride_split_inst3_data[IR_SRC1_VLD]                   = 1'b1;
  vec_stride_split_inst3_data[IR_SRC1_REG-1:IR_SRC1_REG-5]   = vec_inst[24:20];
  vec_stride_split_inst3_data[IR_DST_VLD]                    = 1'b1;
  vec_stride_split_inst3_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100000;
  vec_stride_split_inst3_data[IR_INTMASK]                    = 1'b1;
  vec_stride_split_inst3_data[IR_SPLIT]                      = 1'b1;
  vec_stride_split_inst3_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'b0010;
  vec_stride_split_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @3959
end

assign vec_stride_inst0_data[IR_WIDTH-1:0] = vec_stride_split_inst0_data[IR_WIDTH-1:0];
assign vec_stride_inst1_data[IR_WIDTH-1:0] = vec_stride_split_inst1_data[IR_WIDTH-1:0];
assign vec_stride_inst2_data[IR_WIDTH-1:0] = vec_stride_split_inst2_data[IR_WIDTH-1:0];
assign vec_stride_inst3_data[IR_WIDTH-1:0] = vec_stride_split_inst3_data[IR_WIDTH-1:0];

assign vec_stride_inst_vld[0] = 1'b1;
assign vec_stride_inst_vld[1] = 1'b1;
assign vec_stride_inst_vld[2] = !(vec_stride_split_last && vec_stride_dstv0_ovlp);
assign vec_stride_inst_vld[3] = !vec_stride_split_last && !vec_stride_dstv0_ovlp;

assign vec_stride_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};
//==========================================================
//              vector index ld/st split 
//==========================================================
parameter VEC_INDEX_IDLE  = 1'b0;
parameter VEC_INDEX_SPLIT = 1'b1;

parameter VEC_INDEX_TYPE = 5;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_index_split_clk_en = ctrl_split_long_id_inst_vld
                           && (dp_split_long_type[VEC_INDEX_TYPE])
                           ||!(vec_index_cur_state == VEC_INDEX_IDLE);

// &Instance("gated_clk_cell", "x_vec_index_split_gated_clk"); @3987
gated_clk_cell  x_vec_index_split_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (vec_index_split_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (vec_index_split_clk_en),
  .module_en              (cp0_idu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in      (forever_cpuclk), @3988
//          .external_en (1'b0), @3989
//          .global_en   (cp0_yy_clk_en), @3990
//          .module_en   (cp0_idu_icg_en), @3991
//          .local_en    (vec_index_split_clk_en), @3992
//          .clk_out     (vec_index_split_clk)); @3993

always @(posedge vec_index_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_index_cur_state <= VEC_INDEX_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_index_cur_state <= VEC_INDEX_IDLE;
  else
    vec_index_cur_state <= vec_index_next_state;
end
assign vec_index_sm_start       = ctrl_split_long_id_inst_vld
                              && dp_split_long_type[VEC_INDEX_TYPE]
                              && !ctrl_split_long_id_stall;


assign vec_index_split_stall =  vec_index_sm_start && !vec_index_split_last;

// &CombBeg; @4011
always @( vec_index_split_last
       or vec_index_cur_state
       or ctrl_split_long_id_stall
       or vec_index_sm_start)
begin
  case(vec_index_cur_state)
  VEC_INDEX_IDLE  : if(vec_index_sm_start && !vec_index_split_last)
                     vec_index_next_state = VEC_INDEX_SPLIT;
                   else
                     vec_index_next_state = VEC_INDEX_IDLE;
  VEC_INDEX_SPLIT : if(!ctrl_split_long_id_stall && vec_index_split_last)
                     vec_index_next_state = VEC_INDEX_IDLE;
                   else
                     vec_index_next_state = VEC_INDEX_SPLIT;
  default        :   vec_index_next_state = VEC_INDEX_IDLE;
  endcase
// &CombEnd; @4023
end

always @(posedge vec_index_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_index_cnt[6:0] <= {7{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_index_cnt[6:0] <= {7{1'b0}};
  else if(vec_index_sm_start || vec_index_cur_state &&!ctrl_split_long_id_stall)  
    vec_index_cnt[6:0] <= vec_index_split_last ? {7{1'b0}}: (vec_index_cnt[6:0] + 1'b1);
end

always @(posedge vec_index_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_index_vreg_offset[2:0]  <= {3{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_index_vreg_offset[2:0]  <= {3{1'b0}};
  else if(vec_index_cur_state &&!ctrl_split_long_id_stall)  
    vec_index_vreg_offset[2:0] <= vec_index_split_last ? {3{1'b0}}: (vec_index_vreg_offset[2:0] + {2'b00,vec_index_vreg_end});
end

assign vec_index_vreg_begin  = (vec_sew[1:0]==2'b00) && (vec_index_cnt[3:0]==4'b0000) 
                            || (vec_sew[1:0]==2'b01) && (vec_index_cnt[2:0]==3'b000)
                            || (vec_sew[1:0]==2'b10) && (vec_index_cnt[1:0]==2'b00)
                            || (vec_sew[1:0]==2'b11) && (vec_index_cnt[0]  ==1'b0);

assign vec_index_vreg_end    = (vec_sew[1:0]==2'b00) && (vec_index_cnt[3:0]==4'b1111) 
                            || (vec_sew[1:0]==2'b01) && (vec_index_cnt[2:0]==3'b111)
                            || (vec_sew[1:0]==2'b10) && (vec_index_cnt[1:0]==2'b11)
                            || (vec_sew[1:0]==2'b11) && (vec_index_cnt[0]  ==1'b1);

assign vec_index_split_last  = (vec_lmul[1:0]==2'b00) && vec_index_vreg_end 
                            || (vec_lmul[1:0]==2'b01) && vec_index_vreg_end &&  vec_index_vreg_offset[0] 
                            || (vec_lmul[1:0]==2'b10) && vec_index_vreg_end && &vec_index_vreg_offset[1:0] 
                            || (vec_lmul[1:0]==2'b11) && vec_index_vreg_end && &vec_index_vreg_offset[2:0];

assign vec_index_vmv_inst[31:26]= 6'b010111;
assign vec_index_vmv_inst[25]   = 1'b1;   //vmerge no mask means vmv
assign vec_index_vmv_inst[24:15]= 10'b0;
assign vec_index_vmv_inst[14:12]= 3'b0;   //vv
assign vec_index_vmv_inst[11:7] = 5'b0;
assign vec_index_vmv_inst[6 :0] = 7'b1010111;

assign vec_index_add_inst[31:7] = {25{1'b0}};
assign vec_index_add_inst[6 :0] = 7'b0110011;

assign vec_index_ext_inst[31:26]= 6'b001100;
assign vec_index_ext_inst[25]   = 1'b1;
assign vec_index_ext_inst[24:20]= vec_inst[24:20]|{2'b0,vec_index_vreg_offset[2:0]};
assign vec_index_ext_inst[19:15]= {1'b0,vec_index_cnt[3:0] &(4'b1111>>vec_sew[1:0])};
assign vec_index_ext_inst[14:12]= 3'b010;
assign vec_index_ext_inst[11:7] = 5'b00000;
assign vec_index_ext_inst[6:0]  = 7'b1010111;

//for dst overlap
assign vec_stride_dst_v0 = (vec_inst[11:7] == 5'b0) && !vec_inst[5];

assign vec_dstv_ovlp_vs2 = (vec_inst[11:7] == vec_inst[24:20]);

//----------------------------------------------------------
//                  index inst 0/4
//----------------------------------------------------------
// &CombBeg; @4086
always @( vec_index_vmv_inst[31:0]
       or vec_inst[11:7]
       or vec_index_vreg_offset[2:0]
       or vec_index_vreg_begin)
begin
  vec_index_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_index_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_index_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_index_vmv_inst[31:0];  //vmv.vv
  vec_index_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_index_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_index_vreg_begin 
                                                              ? {1'b0,vec_inst[11:7]} | {3'b0,vec_index_vreg_offset[2:0]}
                                                              : 6'b100_000;
  vec_index_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_index_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100_000;
  vec_index_split_inst0_data[IR_INTMASK]                    = 1'b1;
  vec_index_split_inst0_data[IR_SPLIT]                      = 1'b1;
  vec_index_split_inst0_data[IR_LENGTH]                     = 1'b1;
  vec_index_split_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'd4;
  end
// &CombEnd; @4102
end
//----------------------------------------------------------
//                  index inst 1/5
//----------------------------------------------------------
// &CombBeg; @4106
always @( vec_inst[24:20]
       or vec_dstv_ovlp_vs2
       or vec_index_vreg_offset[2:0]
       or vec_index_ext_inst[31:0])
begin
  vec_index_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_index_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_index_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {3'b000,1'b1,3'b000};
  vec_index_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_index_ext_inst[31:0];
  vec_index_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_index_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_dstv_ovlp_vs2
                                                              ? 6'b100_000
                                                              : {1'b0,vec_inst[24:20]} | {3'b0,vec_index_vreg_offset[2:0]}; 
  vec_index_split_inst1_data[IR_DST_VLD]                    = 1'b1;
  vec_index_split_inst1_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100_001;
  vec_index_split_inst1_data[IR_INTMASK]                    = 1'b1;
  vec_index_split_inst1_data[IR_SPLIT]                      = 1'b1;
  vec_index_split_inst1_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'b0001;
  vec_index_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @4123
end

//----------------------------------------------------------
//                  index inst 2/6
//----------------------------------------------------------
// &CombBeg; @4128
always @( vec_index_add_inst[31:0]
       or vec_inst[19:15])
begin
  vec_index_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_index_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = ALU;
  vec_index_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_index_add_inst[31:0];
  vec_index_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  vec_index_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = {1'b0,vec_inst[19:15]};
  vec_index_split_inst2_data[IR_SRC1_VLD]                   = 1'b1;
  vec_index_split_inst2_data[IR_SRC1_REG:IR_SRC1_REG-5]     = 6'b100_001;
  vec_index_split_inst2_data[IR_DST_VLD]                    = 1'b1;
  vec_index_split_inst2_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100000;
  vec_index_split_inst2_data[IR_INTMASK]                    = 1'b1;
  vec_index_split_inst2_data[IR_SPLIT]                      = 1'b1;
  vec_index_split_inst2_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'b0001;
  vec_index_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @4144
end

//----------------------------------------------------------
//                  index inst 3/7
//----------------------------------------------------------
// &CombBeg; @4149
always @( vec_index_split_last
       or vec_stride_dst_v0
       or vec_index_cnt[6:0]
       or vec_inst[31:0]
       or vec_index_vreg_offset[2:0]
       or vec_index_vreg_begin)
begin
  vec_index_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  vec_index_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = (vec_inst[5] || vec_index_vreg_begin) ? LSU_P5 :LSU;
  vec_index_split_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = vec_index_cnt[6:0];
  vec_index_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_index_split_inst3_data[IR_SRC0_VLD]                   = 1'b1;
  vec_index_split_inst3_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  vec_index_split_inst3_data[IR_SRCV2_VLD]                  = vec_index_vreg_begin || vec_inst[5];
//  vec_index_split_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  vec_index_split_inst3_data[IR_SRCV1_VLD]                  = !vec_inst[25];   //for lsu,use v1 renaming for vm
  vec_index_split_inst3_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_stride_dst_v0 ? 6'b100_000 : 6'b000_000;
  vec_index_split_inst3_data[IR_DSTV_VLD]                   = !vec_inst[5] && vec_index_vreg_begin;
  vec_index_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = {1'b0,vec_inst[11:7]} | {3'b0,vec_index_vreg_offset[2:0]};
  vec_index_split_inst3_data[IR_INTMASK]                    = !vec_index_split_last;
  vec_index_split_inst3_data[IR_SPLIT]                      = !vec_index_split_last;
  vec_index_split_inst3_data[IR_LENGTH]                     = 1'b1;
  vec_index_split_inst3_data[IR_VMB]                        = !vec_inst[5] && vec_index_vreg_begin;
  end
// &CombEnd; @4168
end

//----------------------------------------------------------
//                  index inst select
//----------------------------------------------------------
assign vec_index_inst0_data[IR_WIDTH-1:0] = vec_index_split_inst0_data[IR_WIDTH-1:0];
assign vec_index_inst1_data[IR_WIDTH-1:0] = vec_index_split_inst1_data[IR_WIDTH-1:0];
assign vec_index_inst2_data[IR_WIDTH-1:0] = vec_index_split_inst2_data[IR_WIDTH-1:0];
assign vec_index_inst3_data[IR_WIDTH-1:0] = vec_index_split_inst3_data[IR_WIDTH-1:0];

assign vec_index_inst_vld[0] = 1'b1;
assign vec_index_inst_vld[1] = 1'b1;
assign vec_index_inst_vld[2] = 1'b1;
assign vec_index_inst_vld[3] = 1'b1;

assign vec_index_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};
//==========================================================
//              vector amo split 
//==========================================================
parameter VEC_AMO_IDLE  = 2'b00;
parameter VEC_AMO_INDEX = 2'b01;
parameter VEC_AMO_SPLIT = 2'b10;

parameter VEC_AMO_TYPE = 6;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign vec_amo_split_clk_en = ctrl_split_long_id_inst_vld
                           && (dp_split_long_type[VEC_AMO_TYPE])
                           ||!(vec_amo_cur_state[1:0] == VEC_AMO_IDLE);

// &Instance("gated_clk_cell", "x_vec_amo_split_gated_clk"); @4200
gated_clk_cell  x_vec_amo_split_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (vec_amo_split_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (vec_amo_split_clk_en),
  .module_en            (cp0_idu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in      (forever_cpuclk), @4201
//          .external_en (1'b0), @4202
//          .global_en   (cp0_yy_clk_en), @4203
//          .module_en   (cp0_idu_icg_en), @4204
//          .local_en    (vec_amo_split_clk_en), @4205
//          .clk_out     (vec_amo_split_clk)); @4206

always @(posedge vec_amo_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_amo_cur_state[1:0] <= VEC_AMO_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_amo_cur_state[1:0] <= VEC_AMO_IDLE;
  else
    vec_amo_cur_state[1:0] <= vec_amo_next_state[1:0];
end
assign vec_amo_sm_start     = ctrl_split_long_id_inst_vld
                              && dp_split_long_type[VEC_AMO_TYPE]
                              && (vec_amo_cur_state[1:0] == VEC_AMO_IDLE)
                              && !ctrl_split_long_id_stall;


assign vec_amo_split_stall  = !(vec_amo_cur_state[1] && vec_amo_split_last);

// &CombBeg; @4225
always @( vec_amo_sm_start
       or ctrl_split_long_id_stall
       or vec_amo_split_last
       or vec_amo_cur_state[1:0])
begin
  case(vec_amo_cur_state[1:0])
  VEC_AMO_IDLE  : if(vec_amo_sm_start)
                     vec_amo_next_state[1:0] = VEC_AMO_SPLIT;
                  else
                     vec_amo_next_state[1:0] = VEC_AMO_IDLE;
  VEC_AMO_INDEX : if(!ctrl_split_long_id_stall)
                     vec_amo_next_state[1:0] = VEC_AMO_SPLIT;
                  else
                     vec_amo_next_state[1:0] = VEC_AMO_INDEX;
  VEC_AMO_SPLIT : if(!ctrl_split_long_id_stall && vec_amo_split_last)
                     vec_amo_next_state[1:0] = VEC_AMO_IDLE;
                  else if(!ctrl_split_long_id_stall)
                     vec_amo_next_state[1:0] = VEC_AMO_INDEX;
                  else 
                     vec_amo_next_state[1:0] = VEC_AMO_SPLIT;
  default        :   vec_amo_next_state[1:0] = VEC_AMO_IDLE;
  endcase
// &CombEnd; @4243
end

always @(posedge vec_amo_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_amo_cnt[6:0] <= {7{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_amo_cnt[6:0] <= {7{1'b0}};
  else if(vec_amo_cur_state[1] &&!ctrl_split_long_id_stall)  
    vec_amo_cnt[6:0] <= vec_amo_split_last ? {7{1'b0}}: (vec_amo_cnt[6:0] + 1'b1);
end

always @(posedge vec_amo_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vec_amo_vreg_offset[2:0]  <= {3{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    vec_amo_vreg_offset[2:0]  <= {3{1'b0}};
  else if(vec_amo_cur_state[1] &&!ctrl_split_long_id_stall)  
    vec_amo_vreg_offset[2:0] <= vec_amo_split_last ? {3{1'b0}}: (vec_amo_vreg_offset[2:0] + {2'b00,vec_amo_vreg_end});
end

assign vec_amo_vreg_begin  = (vec_sew[1:0]==2'b00) && (vec_amo_cnt[3:0]==4'b0000) 
                            || (vec_sew[1:0]==2'b01) && (vec_amo_cnt[2:0]==3'b000)
                            || (vec_sew[1:0]==2'b10) && (vec_amo_cnt[1:0]==2'b00)
                            || (vec_sew[1:0]==2'b11) && (vec_amo_cnt[0]  ==1'b0);

assign vec_amo_vreg_end    = (vec_sew[1:0]==2'b00) && (vec_amo_cnt[3:0]==4'b1111) 
                            || (vec_sew[1:0]==2'b01) && (vec_amo_cnt[2:0]==3'b111)
                            || (vec_sew[1:0]==2'b10) && (vec_amo_cnt[1:0]==2'b11)
                            || (vec_sew[1:0]==2'b11) && (vec_amo_cnt[0]  ==1'b1);

assign vec_amo_split_last  = (vec_lmul[1:0]==2'b00) && vec_amo_vreg_end 
                            || (vec_lmul[1:0]==2'b01) && vec_amo_vreg_end &&  vec_amo_vreg_offset[0] 
                            || (vec_lmul[1:0]==2'b10) && vec_amo_vreg_end && &vec_amo_vreg_offset[1:0] 
                            || (vec_lmul[1:0]==2'b11) && vec_amo_vreg_end && &vec_amo_vreg_offset[2:0];

assign vec_amo_vmv_inst[31:26]= 6'b010111;
assign vec_amo_vmv_inst[25]   = 1'b1;   //vmerge no mask means vmv
assign vec_amo_vmv_inst[24:15]= 10'b0;
assign vec_amo_vmv_inst[14:12]= 3'b0;   //vv
assign vec_amo_vmv_inst[11:7] = 5'b0;
assign vec_amo_vmv_inst[6 :0] = 7'b1010111;

assign vec_amo_add_inst[31:7] = {25{1'b0}};
assign vec_amo_add_inst[6 :0] = 7'b0110011;

assign vec_amo_ext_inst[31:26]= 6'b001100;
assign vec_amo_ext_inst[25]   = 1'b1;
assign vec_amo_ext_inst[24:20]= vec_inst[24:20]|{2'b0,vec_amo_vreg_offset[2:0]};
assign vec_amo_ext_inst[19:15]= {1'b0,vec_amo_cnt[3:0] &(4'b1111>>vec_sew[1:0])};
assign vec_amo_ext_inst[14:12]= 3'b010;
assign vec_amo_ext_inst[11:7] = 5'b00000;
assign vec_amo_ext_inst[6:0]  = 7'b1010111;

assign vec_amo_valu_inst[31:26] =  {6{amo_swap}} & 6'b010111        //vmv
                                   | {6{amo_add}}  & 6'b000000      //vadd
                                   | {6{amo_xor}}  & 6'b001011      //vxor
                                   | {6{amo_and}}  & 6'b001001      //vand
                                   | {6{amo_or}}   & 6'b001010      //vor
                                   | {6{amo_min}}  & 6'b000101      //min
                                   | {6{amo_minu}} & 6'b000100      //minu
                                   | {6{amo_max}}  & 6'b000111      //max
                                   | {6{amo_maxu}} & 6'b000110;     //maxu

assign vec_amo_valu_inst[25]   = 1'b1;   //no vmask
assign vec_amo_valu_inst[24:15]= 10'b0;
assign vec_amo_valu_inst[14:12]= 3'b0;   //vv
assign vec_amo_valu_inst[11:7] = 5'b0;
assign vec_amo_valu_inst[6 :0] = 7'b1010111;

//for dst overlap
assign vec_amo_dst_v0 = (vec_inst[11:7] == 5'b0) && vec_inst[26];
//----------------------------------------------------------
//                 vec amo inst 0/4
//----------------------------------------------------------
// &CombBeg; @4319
always @( vec_amo_cur_state[1]
       or vec_amo_dst_v0
       or vec_inst[31:0]
       or vec_amo_cnt[6:0]
       or vec_amo_vreg_begin
       or vec_amo_vreg_offset[2:0]
       or vec_amo_vmv_inst[31:0])
begin
  vec_amo_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(vec_amo_cur_state[1]) begin
  vec_amo_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  vec_amo_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = vec_amo_cnt[6:0];
  vec_amo_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_amo_split_inst0_data[IR_SRC0_VLD]                   = 1'b1;
  vec_amo_split_inst0_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  vec_amo_split_inst0_data[IR_SRCV2_VLD]                  = 1'b1;
//  vec_amo_split_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_amo_split_inst0_data[IR_SRCV1_VLD]                  = !vec_inst[25];   //for lsu,use v1 renaming for vm
  vec_amo_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_amo_dst_v0 ? 6'b100_000 : 6'b000_000;
  vec_amo_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_amo_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = vec_inst[26] ? {1'b0,vec_inst[11:7]} | {3'b0,vec_amo_vreg_offset[2:0]} : 6'b100_001;
  vec_amo_split_inst0_data[IR_INTMASK]                    = 1'b1;
  vec_amo_split_inst0_data[IR_SPLIT]                      = 1'b1;
  vec_amo_split_inst0_data[IR_LENGTH]                     = 1'b1;
  vec_amo_split_inst0_data[IR_VMB]                        = 1'b1;
  vec_amo_split_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = vec_inst[26] ? 4'd0 : 4'd1;
  end
  else begin
  vec_amo_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_amo_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = vec_amo_vmv_inst[31:0];  //vmv.vv
  vec_amo_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_amo_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_amo_vreg_begin 
                                                            ? {1'b0,vec_inst[11:7]} | {3'b0,vec_amo_vreg_offset[2:0]}
                                                            : 6'b100_000;
  vec_amo_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  vec_amo_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100_000;
  vec_amo_split_inst0_data[IR_INTMASK]                    = 1'b1;
  vec_amo_split_inst0_data[IR_SPLIT]                      = 1'b1;
  vec_amo_split_inst0_data[IR_LENGTH]                     = 1'b1;
  vec_amo_split_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'd6;
  end
// &CombEnd; @4353
end

//----------------------------------------------------------
//                 vec amo inst 1/5
//----------------------------------------------------------
// &CombBeg; @4358
always @( vec_amo_cur_state[1]
       or vec_inst[24:20]
       or vec_inst[11:7]
       or vec_dstv_ovlp_vs2
       or vec_inst[26]
       or vec_amo_valu_inst[31:0]
       or vec_amo_vreg_offset[2:0]
       or vec_amo_ext_inst[31:0])
begin
  vec_amo_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(vec_amo_cur_state[1]) begin
  vec_amo_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_amo_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_amo_valu_inst[31:0];
  vec_amo_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_amo_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_inst[26] ? {1'b0,vec_inst[11:7]} | {3'b0,vec_amo_vreg_offset[2:0]} : 6'b100_001;
  vec_amo_split_inst1_data[IR_SRCV1_VLD]                  = 1'b1;
  vec_amo_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = 6'b100_000;
  vec_amo_split_inst1_data[IR_DSTV_VLD]                   = 1'b1;
  vec_amo_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100_001;
  vec_amo_split_inst1_data[IR_INTMASK]                    = 1'b1;
  vec_amo_split_inst1_data[IR_SPLIT]                      = 1'b1;
  vec_amo_split_inst1_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'b0001;
  vec_amo_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
  else begin
  vec_amo_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  vec_amo_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   ={3'b000,1'b1,3'b000};
  vec_amo_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = vec_amo_ext_inst[31:0];
  vec_amo_split_inst1_data[IR_SRCV0_VLD]                  = 1'b1;
  vec_amo_split_inst1_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = vec_dstv_ovlp_vs2
                                                            ? 6'b100_000
                                                            :{1'b0,vec_inst[24:20]} | {3'b0,vec_amo_vreg_offset[2:0]};
  vec_amo_split_inst1_data[IR_DST_VLD]                    = 1'b1;
  vec_amo_split_inst1_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100_001;
  vec_amo_split_inst1_data[IR_INTMASK]                    = 1'b1;
  vec_amo_split_inst1_data[IR_SPLIT]                      = 1'b1;
  vec_amo_split_inst1_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'b0001;
  vec_amo_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @4389
end

//----------------------------------------------------------
//                 vec amo inst 2/6
//----------------------------------------------------------
// &CombBeg; @4394
always @( vec_amo_cur_state[1]
       or vec_amo_dst_v0
       or vec_inst[31:0]
       or vec_amo_cnt[6:0]
       or vec_amo_add_inst[31:0]
       or vec_amo_split_last)
begin
  vec_amo_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(vec_amo_cur_state[1]) begin
  vec_amo_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  vec_amo_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = vec_amo_cnt[6:0];
  vec_amo_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_inst[31:0];
  vec_amo_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  vec_amo_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  vec_amo_split_inst2_data[IR_SRCV2_VLD]                  = 1'b1;
  vec_amo_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100_001;
//  vec_amo_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];
  vec_amo_split_inst2_data[IR_SRCV1_VLD]                  = !vec_inst[25];   //for lsu,use v1 renaming for vm
  vec_amo_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_amo_dst_v0 ? 6'b100_000 : 6'b000_000;
  vec_amo_split_inst2_data[IR_INTMASK]                    = !vec_amo_split_last;
  vec_amo_split_inst2_data[IR_SPLIT]                      = !vec_amo_split_last;
  vec_amo_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
  else begin
  vec_amo_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = ALU;
  vec_amo_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = vec_amo_add_inst[31:0];
  vec_amo_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  vec_amo_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = {1'b0,vec_inst[19:15]};
  vec_amo_split_inst2_data[IR_SRC1_VLD]                   = 1'b1;
  vec_amo_split_inst2_data[IR_SRC1_REG:IR_SRC1_REG-5]     = 6'b100_001;
  vec_amo_split_inst2_data[IR_DST_VLD]                    = 1'b1;
  vec_amo_split_inst2_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100000;
  vec_amo_split_inst2_data[IR_INTMASK]                    = 1'b1;
  vec_amo_split_inst2_data[IR_SPLIT]                      = 1'b1;
  vec_amo_split_inst2_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'b0011;
  vec_amo_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @4425
end

//----------------------------------------------------------
//                  vec inst 3/7
//----------------------------------------------------------
assign vec_amo_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};

assign vec_amo_inst0_data[IR_WIDTH-1:0] = vec_amo_split_inst0_data[IR_WIDTH-1:0];
assign vec_amo_inst1_data[IR_WIDTH-1:0] = vec_amo_split_inst1_data[IR_WIDTH-1:0];
assign vec_amo_inst2_data[IR_WIDTH-1:0] = vec_amo_split_inst2_data[IR_WIDTH-1:0];
assign vec_amo_inst3_data[IR_WIDTH-1:0] = vec_amo_split_inst3_data[IR_WIDTH-1:0];

assign vec_amo_inst_vld[0] = 1'b1;
assign vec_amo_inst_vld[1] = 1'b1;
assign vec_amo_inst_vld[2] = 1'b1;
assign vec_amo_inst_vld[3] = 1'b0;

assign vec_amo_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};
//==========================================================
//              zvlsseg unit stride ld/st split 
//==========================================================
parameter ZVLSSEG_UNIT_IDLE  = 1'b0;
parameter ZVLSSEG_UNIT_SPLIT = 1'b1;

parameter ZVLSSEG_UNIT_TYPE = 7;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign zvlsseg_unit_split_clk_en = ctrl_split_long_id_inst_vld
                                      && (dp_split_long_type[ZVLSSEG_UNIT_TYPE])
                                   || !(zvlsseg_unit_cur_state == ZVLSSEG_UNIT_IDLE);

// &Instance("gated_clk_cell", "x_zvlsseg_unit_split_gated_clk"); @4458
gated_clk_cell  x_zvlsseg_unit_split_gated_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (zvlsseg_unit_split_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (zvlsseg_unit_split_clk_en),
  .module_en                 (cp0_idu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect(.clk_in      (forever_cpuclk), @4459
//          .external_en (1'b0), @4460
//          .global_en   (cp0_yy_clk_en), @4461
//          .module_en   (cp0_idu_icg_en), @4462
//          .local_en    (zvlsseg_unit_split_clk_en), @4463
//          .clk_out     (zvlsseg_unit_split_clk)); @4464

always @(posedge zvlsseg_unit_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_unit_cur_state <= ZVLSSEG_UNIT_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_unit_cur_state <= ZVLSSEG_UNIT_IDLE;
  else
    zvlsseg_unit_cur_state <= zvlsseg_unit_next_state;
end
assign zvlsseg_unit_sm_start  = ctrl_split_long_id_inst_vld
                                && dp_split_long_type[ZVLSSEG_UNIT_TYPE]
                                && !ctrl_split_long_id_stall;


assign zvlsseg_unit_split_stall =  zvlsseg_unit_sm_start && !(zvlsseg_unit_split_last && zvlsseg_unit_nf_last);

// &CombBeg; @4482
always @( zvlsseg_unit_split_last
       or ctrl_split_long_id_stall
       or zvlsseg_unit_nf_last
       or zvlsseg_unit_sm_start
       or zvlsseg_unit_cur_state)
begin
  case(zvlsseg_unit_cur_state)
  ZVLSSEG_UNIT_IDLE  : if(zvlsseg_unit_sm_start)
                       zvlsseg_unit_next_state = ZVLSSEG_UNIT_SPLIT;
                       else
                       zvlsseg_unit_next_state = ZVLSSEG_UNIT_IDLE;
  ZVLSSEG_UNIT_SPLIT : if(!ctrl_split_long_id_stall && zvlsseg_unit_split_last && zvlsseg_unit_nf_last)
                       zvlsseg_unit_next_state = ZVLSSEG_UNIT_IDLE;
                       else
                       zvlsseg_unit_next_state = ZVLSSEG_UNIT_SPLIT;
  default        :     zvlsseg_unit_next_state = ZVLSSEG_UNIT_IDLE;
  endcase
// &CombEnd; @4494
end

always @(posedge zvlsseg_unit_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_unit_cnt[6:0] <= {7{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_unit_cnt[6:0] <= {7{1'b0}};
  else if((zvlsseg_unit_sm_start || zvlsseg_unit_cur_state) && zvlsseg_unit_nf_last && !ctrl_split_long_id_stall)  
    zvlsseg_unit_cnt[6:0] <= zvlsseg_unit_split_last ? {7{1'b0}}: (zvlsseg_unit_cnt[6:0] + 1'b1);
end

always @(posedge zvlsseg_unit_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_unit_vreg_offset[2:0]  <= {3{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_unit_vreg_offset[2:0]  <= {3{1'b0}};
  else if(zvlsseg_unit_cur_state && zvlsseg_unit_nf_last && !ctrl_split_long_id_stall)  
    zvlsseg_unit_vreg_offset[2:0] <= zvlsseg_unit_split_last ? {3{1'b0}}: (zvlsseg_unit_vreg_offset[2:0] + {2'b00,zvlsseg_unit_vreg_end});
end

//assign zvlsseg_unit_vreg_begin  = (vec_sew[1:0]==2'b00) && (zvlsseg_unit_cnt[3:0]==4'b0000) 
//                                  || (vec_sew[1:0]==2'b01) && (zvlsseg_unit_cnt[2:0]==3'b000)
//                                  || (vec_sew[1:0]==2'b10) && (zvlsseg_unit_cnt[1:0]==2'b00)
//                                  || (vec_sew[1:0]==2'b11) && (zvlsseg_unit_cnt[0]  ==1'b0);

assign zvlsseg_unit_vreg_end    = (vec_sew[1:0]==2'b00) && (zvlsseg_unit_cnt[3:0]==4'b1111) 
                                  || (vec_sew[1:0]==2'b01) && (zvlsseg_unit_cnt[2:0]==3'b111)
                                  || (vec_sew[1:0]==2'b10) && (zvlsseg_unit_cnt[1:0]==2'b11)
                                  || (vec_sew[1:0]==2'b11) && (zvlsseg_unit_cnt[0]  ==1'b1);

assign zvlsseg_unit_split_last  = (vec_lmul[1:0]==2'b00) && zvlsseg_unit_vreg_end 
                                  || (vec_lmul[1:0]==2'b01) && zvlsseg_unit_vreg_end &&  zvlsseg_unit_vreg_offset[0] 
                                  || (vec_lmul[1:0]==2'b10) && zvlsseg_unit_vreg_end && &zvlsseg_unit_vreg_offset[1:0] 
                                  || (vec_lmul[1:0]==2'b11) && zvlsseg_unit_vreg_end && &zvlsseg_unit_vreg_offset[2:0];

always @(posedge zvlsseg_unit_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_unit_nf_cnt[1:0] <= {2{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_unit_nf_cnt[1:0] <= {2{1'b0}};
  else if(zvlsseg_unit_sm_start || zvlsseg_unit_cur_state && !ctrl_split_long_id_stall)  
    zvlsseg_unit_nf_cnt[1:0] <= zvlsseg_unit_nf_last ? {2{1'b0}}: (zvlsseg_unit_nf_cnt[1:0] + 1'b1);
end

//for rf offset
always @(posedge zvlsseg_unit_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_unit_nf_offset_cnt[6:0] <= {7{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_unit_nf_offset_cnt[6:0] <= {7{1'b0}};
  else if(zvlsseg_unit_cur_state && zvlsseg_unit_split_last && zvlsseg_unit_nf_last && !ctrl_split_long_id_stall)
    zvlsseg_unit_nf_offset_cnt[6:0] <= {7{1'b0}};
  else if(zvlsseg_unit_sm_start || zvlsseg_unit_cur_state && !ctrl_split_long_id_stall)  
    zvlsseg_unit_nf_offset_cnt[6:0] <= zvlsseg_unit_inst_vld[2] ? zvlsseg_unit_nf_offset_cnt[6:0] + 7'd2 : zvlsseg_unit_nf_offset_cnt[6:0] + 7'd1;
end

assign zvlsseg_unit_nf_offset_cnt1[6:0] = zvlsseg_unit_nf_offset_cnt[6:0] + 7'd1;

assign zvlsseg_unit_nf_last = (zvlsseg_unit_nf_cnt[1:0] == vec_inst[31:30]); 

assign zvlsseg_unit_vmv_inst[31:26]= 6'b010111;
assign zvlsseg_unit_vmv_inst[25]   = 1'b1;   //vmerge no mask means vmv
assign zvlsseg_unit_vmv_inst[24:15]= 10'b0;
assign zvlsseg_unit_vmv_inst[14:12]= 3'b0;   //vv
assign zvlsseg_unit_vmv_inst[11:7] = 5'b0;
assign zvlsseg_unit_vmv_inst[6 :0] = 7'b1010111;

//for dst reg index
// &CombBeg; @4566
always @( zvlsseg_unit_nf_cnt[1:0]
       or vec_lmul[1:0])
begin
  case(vec_lmul[1:0])
  2'b00:   unit_nf_reg_offset0[5:0] = {3'b0,zvlsseg_unit_nf_cnt[1:0],1'b0}; 
  2'b01:   unit_nf_reg_offset0[5:0] = {2'b0,zvlsseg_unit_nf_cnt[1:0],2'b0}; 
  2'b10:   unit_nf_reg_offset0[5:0] = {1'b0,zvlsseg_unit_nf_cnt[1:0],3'b0}; 
//  2'b11:   unit_nf_reg_offset[5:0] = {zvlsseg_unit_nf_cnt[1:0],4'b0}; 
  default: unit_nf_reg_offset0[5:0] = 6'b0;
  endcase
// &CombEnd; @4574
end

// &CombBeg; @4576
always @( zvlsseg_unit_nf_cnt[1:0]
       or vec_lmul[1:0])
begin
  case(vec_lmul[1:0])
  2'b00:   unit_nf_reg_offset1[5:0] = {3'b0,zvlsseg_unit_nf_cnt[1:0],1'b1}; 
  2'b01:   unit_nf_reg_offset1[5:0] = {2'b0,zvlsseg_unit_nf_cnt[1:0],2'b10}; 
  2'b10:   unit_nf_reg_offset1[5:0] = {1'b0,zvlsseg_unit_nf_cnt[1:0],3'b100}; 
//  2'b11:   unit_nf_reg_offset[5:0] = {zvlsseg_unit_nf_cnt[1:0],4'b0}; 
  default: unit_nf_reg_offset1[5:0] = 6'b0;
  endcase
// &CombEnd; @4584
end

assign  zvlsseg_unit_split_dstv_reg0[5:0] = ({1'b0,vec_inst[11:7]} | {3'b0,zvlsseg_unit_vreg_offset[2:0]}) + unit_nf_reg_offset0[5:0];
assign  zvlsseg_unit_split_dstv_reg1[5:0] = ({1'b0,vec_inst[11:7]} | {3'b0,zvlsseg_unit_vreg_offset[2:0]}) + unit_nf_reg_offset1[5:0];
//----------------------------------------------------------
//                  zvlsseg_unit inst 0/4
//----------------------------------------------------------
// &CombBeg; @4591
always @( zvlsseg_unit_vmv_inst[31:0]
       or zvlsseg_unit_cur_state)
begin
  zvlsseg_unit_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  zvlsseg_unit_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  zvlsseg_unit_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = zvlsseg_unit_vmv_inst[31:0];  //vmv.vv
  zvlsseg_unit_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  zvlsseg_unit_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = !zvlsseg_unit_cur_state 
                                                                 ? 6'b000_000
                                                                 : 6'b100_000;
  zvlsseg_unit_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  zvlsseg_unit_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100_000;
  zvlsseg_unit_split_inst0_data[IR_INTMASK]                    = 1'b1;
  zvlsseg_unit_split_inst0_data[IR_SPLIT]                      = 1'b1;
  zvlsseg_unit_split_inst0_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_unit_split_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'd3;
  end
// &CombEnd; @4607
end
//----------------------------------------------------------
//                  zvlsseg_unit inst 1/5
//----------------------------------------------------------
// &CombBeg; @4611
always @( vec_stride_dst_v0
       or zvlsseg_unit_cnt[6:0]
       or vec_inst[6:0]
       or zvlsseg_unit_split_last
       or vec_inst[14:12]
       or zvlsseg_unit_split_dstv_reg0[5:0]
       or zvlsseg_unit_nf_last
       or zvlsseg_unit_nf_offset_cnt[6:0]
       or vec_inst[31:15])
begin
  zvlsseg_unit_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  zvlsseg_unit_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  zvlsseg_unit_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = zvlsseg_unit_cnt[6:0];
  zvlsseg_unit_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = {vec_inst[31:17],zvlsseg_unit_nf_offset_cnt[6:5],vec_inst[14:12],zvlsseg_unit_nf_offset_cnt[4:0],vec_inst[6:0]};
  zvlsseg_unit_split_inst1_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_unit_split_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5]     = {1'b0,vec_inst[19:15]};
  zvlsseg_unit_split_inst1_data[IR_SRCV2_VLD]                  = 1'b1;
//  zvlsseg_unit_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  zvlsseg_unit_split_inst1_data[IR_SRCV1_VLD]                  = !vec_inst[25];   //for lsu,use v1 renaming for vm
  zvlsseg_unit_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_stride_dst_v0 ? 6'b100_000 : 6'b000_000;
  zvlsseg_unit_split_inst1_data[IR_DSTV_VLD]                   = !vec_inst[5];
  zvlsseg_unit_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = zvlsseg_unit_split_dstv_reg0[5:0];
  zvlsseg_unit_split_inst1_data[IR_INTMASK]                    = !(zvlsseg_unit_split_last && zvlsseg_unit_nf_last && !vec_inst[29]);
  zvlsseg_unit_split_inst1_data[IR_SPLIT]                      = !(zvlsseg_unit_split_last && zvlsseg_unit_nf_last && !vec_inst[29]);
  zvlsseg_unit_split_inst1_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_unit_split_inst1_data[IR_VMB]                        = !vec_inst[5];
  end
// &CombEnd; @4630
end

//----------------------------------------------------------
//                  zvlsseg_unit inst 2/6
//----------------------------------------------------------
// &CombBeg; @4635
always @( vec_stride_dst_v0
       or zvlsseg_unit_cnt[6:0]
       or vec_inst[6:0]
       or zvlsseg_unit_split_last
       or zvlsseg_unit_nf_offset_cnt1[6:0]
       or vec_inst[14:12]
       or zvlsseg_unit_nf_last
       or zvlsseg_unit_split_dstv_reg1[5:0]
       or vec_inst[31:15])
begin
  zvlsseg_unit_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  zvlsseg_unit_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  zvlsseg_unit_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = zvlsseg_unit_cnt[6:0];
  zvlsseg_unit_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = {vec_inst[31:17],zvlsseg_unit_nf_offset_cnt1[6:5],vec_inst[14:12],zvlsseg_unit_nf_offset_cnt1[4:0],vec_inst[6:0]};
  zvlsseg_unit_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_unit_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = {1'b0,vec_inst[19:15]};
  zvlsseg_unit_split_inst2_data[IR_SRCV2_VLD]                  = 1'b1;
//  zvlsseg_unit_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  zvlsseg_unit_split_inst2_data[IR_SRCV1_VLD]                  = !vec_inst[25];   //for lsu,use v1 renaming for vm
  zvlsseg_unit_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_stride_dst_v0 ? 6'b100_000 : 6'b000_000;
  zvlsseg_unit_split_inst2_data[IR_DSTV_VLD]                   = !vec_inst[5];
  zvlsseg_unit_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = zvlsseg_unit_split_dstv_reg1[5:0];
  zvlsseg_unit_split_inst2_data[IR_INTMASK]                    = !(zvlsseg_unit_split_last && zvlsseg_unit_nf_last);
  zvlsseg_unit_split_inst2_data[IR_SPLIT]                      = !(zvlsseg_unit_split_last && zvlsseg_unit_nf_last);
  zvlsseg_unit_split_inst2_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_unit_split_inst2_data[IR_VMB]                        = !vec_inst[5];
  end
// &CombEnd; @4654
end

//----------------------------------------------------------
//                  zvlsseg_unit inst 3/7
//----------------------------------------------------------
assign zvlsseg_unit_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};

//----------------------------------------------------------
//                  zvlsseg_unit inst select
//----------------------------------------------------------
assign zvlsseg_unit_inst0_data[IR_WIDTH-1:0] = zvlsseg_unit_split_inst0_data[IR_WIDTH-1:0];
assign zvlsseg_unit_inst1_data[IR_WIDTH-1:0] = zvlsseg_unit_split_inst1_data[IR_WIDTH-1:0];
assign zvlsseg_unit_inst2_data[IR_WIDTH-1:0] = zvlsseg_unit_split_inst2_data[IR_WIDTH-1:0];
assign zvlsseg_unit_inst3_data[IR_WIDTH-1:0] = zvlsseg_unit_split_inst3_data[IR_WIDTH-1:0];

assign zvlsseg_unit_inst_vld[0] = 1'b1;
assign zvlsseg_unit_inst_vld[1] = 1'b1;
assign zvlsseg_unit_inst_vld[2] = !(zvlsseg_unit_nf_last && !vec_inst[29]);
assign zvlsseg_unit_inst_vld[3] = 1'b0;

assign zvlsseg_unit_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};
//==========================================================
//              zvlsseg stride ld/st split 
//==========================================================
parameter ZVLSSEG_STRIDE_IDLE  = 1'b0;
parameter ZVLSSEG_STRIDE_SPLIT = 1'b1;

parameter ZVLSSEG_STRIDE_TYPE = 8;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign zvlsseg_stride_split_clk_en = ctrl_split_long_id_inst_vld
                                      && (dp_split_long_type[ZVLSSEG_STRIDE_TYPE])
                                   || !(zvlsseg_stride_cur_state == ZVLSSEG_STRIDE_IDLE);

// &Instance("gated_clk_cell", "x_zvlsseg_stride_split_gated_clk"); @4690
gated_clk_cell  x_zvlsseg_stride_split_gated_clk (
  .clk_in                      (forever_cpuclk             ),
  .clk_out                     (zvlsseg_stride_split_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (zvlsseg_stride_split_clk_en),
  .module_en                   (cp0_idu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in      (forever_cpuclk), @4691
//          .external_en (1'b0), @4692
//          .global_en   (cp0_yy_clk_en), @4693
//          .module_en   (cp0_idu_icg_en), @4694
//          .local_en    (zvlsseg_stride_split_clk_en), @4695
//          .clk_out     (zvlsseg_stride_split_clk)); @4696

always @(posedge zvlsseg_stride_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_stride_cur_state <= ZVLSSEG_STRIDE_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_stride_cur_state <= ZVLSSEG_STRIDE_IDLE;
  else
    zvlsseg_stride_cur_state <= zvlsseg_stride_next_state;
end
assign zvlsseg_stride_sm_start  = ctrl_split_long_id_inst_vld
                                && dp_split_long_type[ZVLSSEG_STRIDE_TYPE]
                                && !ctrl_split_long_id_stall;


assign zvlsseg_stride_split_stall =  zvlsseg_stride_sm_start && !(zvlsseg_stride_split_last && zvlsseg_stride_nf_last);

// &CombBeg; @4714
always @( zvlsseg_stride_nf_last
       or zvlsseg_stride_sm_start
       or ctrl_split_long_id_stall
       or zvlsseg_stride_split_last
       or zvlsseg_stride_cur_state)
begin
  case(zvlsseg_stride_cur_state)
  ZVLSSEG_STRIDE_IDLE  : if(zvlsseg_stride_sm_start)
                       zvlsseg_stride_next_state = ZVLSSEG_STRIDE_SPLIT;
                       else
                       zvlsseg_stride_next_state = ZVLSSEG_STRIDE_IDLE;
  ZVLSSEG_STRIDE_SPLIT : if(!ctrl_split_long_id_stall && zvlsseg_stride_split_last && zvlsseg_stride_nf_last)
                       zvlsseg_stride_next_state = ZVLSSEG_STRIDE_IDLE;
                       else
                       zvlsseg_stride_next_state = ZVLSSEG_STRIDE_SPLIT;
  default        :     zvlsseg_stride_next_state = ZVLSSEG_STRIDE_IDLE;
  endcase
// &CombEnd; @4726
end

always @(posedge zvlsseg_stride_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_stride_cnt[6:0] <= {7{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_stride_cnt[6:0] <= {7{1'b0}};
  else if((zvlsseg_stride_sm_start || zvlsseg_stride_cur_state) && zvlsseg_stride_nf_last && !ctrl_split_long_id_stall)  
    zvlsseg_stride_cnt[6:0] <= zvlsseg_stride_split_last ? {7{1'b0}}: (zvlsseg_stride_cnt[6:0] + 1'b1);
end

always @(posedge zvlsseg_stride_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_stride_vreg_offset[2:0]  <= {3{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_stride_vreg_offset[2:0]  <= {3{1'b0}};
  else if(zvlsseg_stride_cur_state && zvlsseg_stride_nf_last && !ctrl_split_long_id_stall)  
    zvlsseg_stride_vreg_offset[2:0] <= zvlsseg_stride_split_last ? {3{1'b0}}: (zvlsseg_stride_vreg_offset[2:0] + {2'b00,zvlsseg_stride_vreg_end});
end

//assign zvlsseg_stride_vreg_begin  = (vec_sew[1:0]==2'b00) && (zvlsseg_stride_cnt[3:0]==4'b0000) 
//                                  || (vec_sew[1:0]==2'b01) && (zvlsseg_stride_cnt[2:0]==3'b000)
//                                  || (vec_sew[1:0]==2'b10) && (zvlsseg_stride_cnt[1:0]==2'b00)
//                                  || (vec_sew[1:0]==2'b11) && (zvlsseg_stride_cnt[0]  ==1'b0);

assign zvlsseg_stride_vreg_end    = (vec_sew[1:0]==2'b00) && (zvlsseg_stride_cnt[3:0]==4'b1111) 
                                  || (vec_sew[1:0]==2'b01) && (zvlsseg_stride_cnt[2:0]==3'b111)
                                  || (vec_sew[1:0]==2'b10) && (zvlsseg_stride_cnt[1:0]==2'b11)
                                  || (vec_sew[1:0]==2'b11) && (zvlsseg_stride_cnt[0]  ==1'b1);

assign zvlsseg_stride_split_last  = (vec_lmul[1:0]==2'b00) && zvlsseg_stride_vreg_end 
                                  || (vec_lmul[1:0]==2'b01) && zvlsseg_stride_vreg_end &&  zvlsseg_stride_vreg_offset[0] 
                                  || (vec_lmul[1:0]==2'b10) && zvlsseg_stride_vreg_end && &zvlsseg_stride_vreg_offset[1:0] 
                                  || (vec_lmul[1:0]==2'b11) && zvlsseg_stride_vreg_end && &zvlsseg_stride_vreg_offset[2:0];

assign zvlsseg_stride_vreg_secd_to_end    = (vec_sew[1:0]==2'b00) && (zvlsseg_stride_cnt[3:0]==4'b1110) 
                                            || (vec_sew[1:0]==2'b01) && (zvlsseg_stride_cnt[2:0]==3'b110)
                                            || (vec_sew[1:0]==2'b10) && (zvlsseg_stride_cnt[1:0]==2'b10)
                                            || (vec_sew[1:0]==2'b11) && (zvlsseg_stride_cnt[0]  ==1'b0);

assign zvlsseg_stride_split_secd_to_last  = (vec_lmul[1:0]==2'b00) && zvlsseg_stride_vreg_secd_to_end 
                                            || (vec_lmul[1:0]==2'b01) && zvlsseg_stride_vreg_secd_to_end &&  zvlsseg_stride_vreg_offset[0] 
                                            || (vec_lmul[1:0]==2'b10) && zvlsseg_stride_vreg_secd_to_end && &zvlsseg_stride_vreg_offset[1:0] 
                                            || (vec_lmul[1:0]==2'b11) && zvlsseg_stride_vreg_secd_to_end && &zvlsseg_stride_vreg_offset[2:0];

always @(posedge zvlsseg_stride_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_stride_nf_cnt[1:0] <= {2{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_stride_nf_cnt[1:0] <= {2{1'b0}};
  else if(zvlsseg_stride_sm_start || zvlsseg_stride_cur_state && !ctrl_split_long_id_stall)  
    zvlsseg_stride_nf_cnt[1:0] <= zvlsseg_stride_nf_last ? {2{1'b0}}: (zvlsseg_stride_nf_cnt[1:0] + 1'b1);
end


assign zvlsseg_stride_nf_last = (zvlsseg_stride_nf_cnt[1:0] == vec_inst[31:30]); 

//used for iid_plus
//cycles for a single structure
assign zvlsseg_stride_nf_cycle[1:0]     = vec_inst[31:30];  //0~3 means 1~4 cycles
// 3 is the least interval
assign zvlsseg_stride_add_interval[3:0] = {1'b0,vec_inst[31:29]} + {2'b0,zvlsseg_stride_nf_cycle[1:0]} + 4'd3;                     

assign zvlsseg_stride_vmv_inst[31:26]= 6'b010111;
assign zvlsseg_stride_vmv_inst[25]   = 1'b1;   //vmerge no mask means vmv
assign zvlsseg_stride_vmv_inst[24:15]= 10'b0;
assign zvlsseg_stride_vmv_inst[14:12]= 3'b0;   //vv
assign zvlsseg_stride_vmv_inst[11:7] = 5'b0;
assign zvlsseg_stride_vmv_inst[6 :0] = 7'b1010111;

assign zvlsseg_stride_add_inst[31:7] = {25{1'b0}};
assign zvlsseg_stride_add_inst[6 :0] = 7'b0110011;

//for dst reg index
// &CombBeg; @4803
always @( vec_lmul[1:0]
       or zvlsseg_stride_nf_cnt[1:0])
begin
  case(vec_lmul[1:0])
  2'b00:   stride_nf_reg_offset0[5:0] = {3'b0,zvlsseg_stride_nf_cnt[1:0],1'b0}; 
  2'b01:   stride_nf_reg_offset0[5:0] = {2'b0,zvlsseg_stride_nf_cnt[1:0],2'b0}; 
  2'b10:   stride_nf_reg_offset0[5:0] = {1'b0,zvlsseg_stride_nf_cnt[1:0],3'b0}; 
//  2'b11:   stride_nf_reg_offset[5:0] = {zvlsseg_stride_nf_cnt[1:0],4'b0}; 
  default: stride_nf_reg_offset0[5:0] = 6'b0;
  endcase
// &CombEnd; @4811
end

// &CombBeg; @4813
always @( vec_lmul[1:0]
       or zvlsseg_stride_nf_cnt[1:0])
begin
  case(vec_lmul[1:0])
  2'b00:   stride_nf_reg_offset1[5:0] = {3'b0,zvlsseg_stride_nf_cnt[1:0],1'b1}; 
  2'b01:   stride_nf_reg_offset1[5:0] = {2'b0,zvlsseg_stride_nf_cnt[1:0],2'b10}; 
  2'b10:   stride_nf_reg_offset1[5:0] = {1'b0,zvlsseg_stride_nf_cnt[1:0],3'b100}; 
//  2'b11:   stride_nf_reg_offset[5:0] = {zvlsseg_stride_nf_cnt[1:0],4'b0}; 
  default: stride_nf_reg_offset1[5:0] = 6'b0;
  endcase
// &CombEnd; @4821
end

assign  zvlsseg_stride_split_dstv_reg0[5:0] = ({1'b0,vec_inst[11:7]} | {3'b0,zvlsseg_stride_vreg_offset[2:0]}) + stride_nf_reg_offset0[5:0];
assign  zvlsseg_stride_split_dstv_reg1[5:0] = ({1'b0,vec_inst[11:7]} | {3'b0,zvlsseg_stride_vreg_offset[2:0]}) + stride_nf_reg_offset1[5:0];
//----------------------------------------------------------
//                  zvlsseg_stride inst 0/4
//----------------------------------------------------------
// &CombBeg; @4828
always @( zvlsseg_stride_vmv_inst[31:0]
       or zvlsseg_stride_cur_state
       or zvlsseg_stride_inst_vld[3])
begin
  zvlsseg_stride_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  zvlsseg_stride_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  zvlsseg_stride_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = zvlsseg_stride_vmv_inst[31:0];  //vmv.vv
  zvlsseg_stride_split_inst0_data[IR_SRCV1_VLD]                  = 1'b1;
  zvlsseg_stride_split_inst0_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = !zvlsseg_stride_cur_state 
                                                                 ? 6'b000_000
                                                                 : 6'b100_000;
  zvlsseg_stride_split_inst0_data[IR_DSTV_VLD]                   = 1'b1;
  zvlsseg_stride_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = 6'b100_000;
  zvlsseg_stride_split_inst0_data[IR_INTMASK]                    = 1'b1;
  zvlsseg_stride_split_inst0_data[IR_SPLIT]                      = 1'b1;
  zvlsseg_stride_split_inst0_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_stride_split_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = zvlsseg_stride_inst_vld[3] ? 4'd4 : 4'd3;
  end
// &CombEnd; @4844
end
//----------------------------------------------------------
//                  zvlsseg_stride inst 1/5
//----------------------------------------------------------
// &CombBeg; @4848
always @( vec_stride_dst_v0
       or vec_inst[6:0]
       or zvlsseg_stride_nf_last
       or vec_inst[31:10]
       or zvlsseg_stride_cnt[6:0]
       or zvlsseg_stride_split_last
       or zvlsseg_stride_split_dstv_reg0[5:0]
       or zvlsseg_stride_nf_cnt[1:0])
begin
  zvlsseg_stride_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  zvlsseg_stride_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  zvlsseg_stride_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = zvlsseg_stride_cnt[6:0];
  zvlsseg_stride_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = {vec_inst[31:10],zvlsseg_stride_nf_cnt[1:0],1'b0,vec_inst[6:0]};
  zvlsseg_stride_split_inst1_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_stride_split_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5]     = |zvlsseg_stride_cnt[6:0] ? 6'b100_000 : {1'b0,vec_inst[19:15]};
  zvlsseg_stride_split_inst1_data[IR_SRCV2_VLD]                  = 1'b1;
//  zvlsseg_stride_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  zvlsseg_stride_split_inst1_data[IR_SRCV1_VLD]                  = !vec_inst[25];   //for lsu,use v1 renaming for vm
  zvlsseg_stride_split_inst1_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_stride_dst_v0 ? 6'b100_000 : 6'b000_000;
  zvlsseg_stride_split_inst1_data[IR_DSTV_VLD]                   = !vec_inst[5];
  zvlsseg_stride_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = zvlsseg_stride_split_dstv_reg0[5:0];
  zvlsseg_stride_split_inst1_data[IR_INTMASK]                    = !(zvlsseg_stride_split_last && zvlsseg_stride_nf_last && !vec_inst[29]);
  zvlsseg_stride_split_inst1_data[IR_SPLIT]                      = !(zvlsseg_stride_split_last && zvlsseg_stride_nf_last && !vec_inst[29]);
  zvlsseg_stride_split_inst1_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_stride_split_inst1_data[IR_VMB]                        = !vec_inst[5];
  end
// &CombEnd; @4867
end

//----------------------------------------------------------
//                  zvlsseg_stride inst 2/6
//----------------------------------------------------------
// &CombBeg; @4872
always @( vec_stride_dst_v0
       or vec_inst[6:0]
       or zvlsseg_stride_nf_last
       or zvlsseg_stride_split_secd_to_last
       or zvlsseg_stride_split_dstv_reg1[5:0]
       or vec_inst[31:10]
       or zvlsseg_stride_add_interval[3:0]
       or zvlsseg_stride_cnt[6:0]
       or zvlsseg_stride_split_last
       or zvlsseg_stride_add_inst[31:0]
       or zvlsseg_stride_nf_cnt[1:0])
begin
  zvlsseg_stride_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(zvlsseg_stride_nf_last && !vec_inst[29]) begin
  zvlsseg_stride_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = ALU;
  zvlsseg_stride_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = zvlsseg_stride_add_inst[31:0];
  zvlsseg_stride_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_stride_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = |zvlsseg_stride_cnt[6:0] ? 6'b100_000 : {1'b0,vec_inst[19:15]};
  zvlsseg_stride_split_inst2_data[IR_SRC1_VLD]                   = 1'b1;
  zvlsseg_stride_split_inst2_data[IR_SRC1_REG-1:IR_SRC1_REG-5]   = vec_inst[24:20];
  zvlsseg_stride_split_inst2_data[IR_DST_VLD]                    = 1'b1;
  zvlsseg_stride_split_inst2_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100000;
  zvlsseg_stride_split_inst2_data[IR_INTMASK]                    = 1'b1;
  zvlsseg_stride_split_inst2_data[IR_SPLIT]                      = 1'b1;
  zvlsseg_stride_split_inst2_data[IR_IID_PLUS:IR_IID_PLUS-3]     = zvlsseg_stride_split_secd_to_last ? zvlsseg_stride_add_interval[3:0] - 1'b1 : zvlsseg_stride_add_interval[3:0];
  zvlsseg_stride_split_inst2_data[IR_LENGTH]                     = 1'b1;
  end
  else begin
  zvlsseg_stride_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  zvlsseg_stride_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = zvlsseg_stride_cnt[6:0];
  zvlsseg_stride_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = {vec_inst[31:10],zvlsseg_stride_nf_cnt[1:0],1'b1,vec_inst[6:0]};
  zvlsseg_stride_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_stride_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = |zvlsseg_stride_cnt[6:0] ? 6'b100_000 : {1'b0,vec_inst[19:15]};
  zvlsseg_stride_split_inst2_data[IR_SRCV2_VLD]                  = 1'b1;
//  zvlsseg_stride_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  zvlsseg_stride_split_inst2_data[IR_SRCV1_VLD]                  = !vec_inst[25];   //for lsu,use v1 renaming for vm
  zvlsseg_stride_split_inst2_data[IR_SRCV1_REG:IR_SRCV1_REG-5]   = vec_stride_dst_v0 ? 6'b100_000 : 6'b000_000;
  zvlsseg_stride_split_inst2_data[IR_DSTV_VLD]                   = !vec_inst[5];
  zvlsseg_stride_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = zvlsseg_stride_split_dstv_reg1[5:0];
  zvlsseg_stride_split_inst2_data[IR_INTMASK]                    = !(zvlsseg_stride_split_last && zvlsseg_stride_nf_last);
  zvlsseg_stride_split_inst2_data[IR_SPLIT]                      = !(zvlsseg_stride_split_last && zvlsseg_stride_nf_last);
  zvlsseg_stride_split_inst2_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_stride_split_inst2_data[IR_VMB]                        = !vec_inst[5];
  end
// &CombEnd; @4905
end

//----------------------------------------------------------
//                  zvlsseg_stride inst 3/7
//----------------------------------------------------------
// &CombBeg; @4910
always @( zvlsseg_stride_split_secd_to_last
       or zvlsseg_stride_add_interval[3:0]
       or vec_inst[24:15]
       or zvlsseg_stride_cnt[6:0]
       or zvlsseg_stride_add_inst[31:0])
begin
  zvlsseg_stride_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  zvlsseg_stride_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = ALU;
  zvlsseg_stride_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = zvlsseg_stride_add_inst[31:0];
  zvlsseg_stride_split_inst3_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_stride_split_inst3_data[IR_SRC0_REG:IR_SRC0_REG-5]     = |zvlsseg_stride_cnt[6:0] ? 6'b100_000 : {1'b0,vec_inst[19:15]};
  zvlsseg_stride_split_inst3_data[IR_SRC1_VLD]                   = 1'b1;
  zvlsseg_stride_split_inst3_data[IR_SRC1_REG-1:IR_SRC1_REG-5]   = vec_inst[24:20];
  zvlsseg_stride_split_inst3_data[IR_DST_VLD]                    = 1'b1;
  zvlsseg_stride_split_inst3_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100000;
  zvlsseg_stride_split_inst3_data[IR_INTMASK]                    = 1'b1;
  zvlsseg_stride_split_inst3_data[IR_SPLIT]                      = 1'b1;
  zvlsseg_stride_split_inst3_data[IR_IID_PLUS:IR_IID_PLUS-3]     = zvlsseg_stride_split_secd_to_last ? zvlsseg_stride_add_interval[3:0] - 1'b1 : zvlsseg_stride_add_interval[3:0];
  zvlsseg_stride_split_inst3_data[IR_LENGTH]                     = 1'b1;
  end
// &CombEnd; @4926
end

//----------------------------------------------------------
//                  zvlsseg_stride inst select
//----------------------------------------------------------
assign zvlsseg_stride_inst0_data[IR_WIDTH-1:0] = zvlsseg_stride_split_inst0_data[IR_WIDTH-1:0];
assign zvlsseg_stride_inst1_data[IR_WIDTH-1:0] = zvlsseg_stride_split_inst1_data[IR_WIDTH-1:0];
assign zvlsseg_stride_inst2_data[IR_WIDTH-1:0] = zvlsseg_stride_split_inst2_data[IR_WIDTH-1:0];
assign zvlsseg_stride_inst3_data[IR_WIDTH-1:0] = zvlsseg_stride_split_inst3_data[IR_WIDTH-1:0];

assign zvlsseg_stride_inst_vld[0] = 1'b1;
assign zvlsseg_stride_inst_vld[1] = 1'b1;
assign zvlsseg_stride_inst_vld[2] = !(zvlsseg_stride_split_last && zvlsseg_stride_nf_last && !vec_inst[29]);
assign zvlsseg_stride_inst_vld[3] = zvlsseg_stride_nf_last && !zvlsseg_stride_split_last && vec_inst[29];

assign zvlsseg_stride_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};
//==========================================================
//              zvlsseg index ld/st split 
//==========================================================
parameter ZVLSSEG_INDEX_IDLE  = 1'b0;
parameter ZVLSSEG_INDEX_SPLIT = 1'b1;

parameter ZVLSSEG_INDEX_TYPE = 9;
//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------

assign zvlsseg_index_split_clk_en = ctrl_split_long_id_inst_vld
                                      && (dp_split_long_type[ZVLSSEG_INDEX_TYPE])
                                   || !(zvlsseg_index_cur_state == ZVLSSEG_INDEX_IDLE);

// &Instance("gated_clk_cell", "x_zvlsseg_index_split_gated_clk"); @4957
gated_clk_cell  x_zvlsseg_index_split_gated_clk (
  .clk_in                     (forever_cpuclk            ),
  .clk_out                    (zvlsseg_index_split_clk   ),
  .external_en                (1'b0                      ),
  .global_en                  (cp0_yy_clk_en             ),
  .local_en                   (zvlsseg_index_split_clk_en),
  .module_en                  (cp0_idu_icg_en            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Connect(.clk_in      (forever_cpuclk), @4958
//          .external_en (1'b0), @4959
//          .global_en   (cp0_yy_clk_en), @4960
//          .module_en   (cp0_idu_icg_en), @4961
//          .local_en    (zvlsseg_index_split_clk_en), @4962
//          .clk_out     (zvlsseg_index_split_clk)); @4963

always @(posedge zvlsseg_index_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_index_cur_state <= ZVLSSEG_INDEX_IDLE;
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_index_cur_state <= ZVLSSEG_INDEX_IDLE;
  else
    zvlsseg_index_cur_state <= zvlsseg_index_next_state;
end
assign zvlsseg_index_sm_start  = ctrl_split_long_id_inst_vld
                                && dp_split_long_type[ZVLSSEG_INDEX_TYPE]
                                && !ctrl_split_long_id_stall;


assign zvlsseg_index_split_stall =  zvlsseg_index_sm_start && !(zvlsseg_index_split_last && zvlsseg_index_nf_last);

// &CombBeg; @4981
always @( zvlsseg_index_cur_state
       or ctrl_split_long_id_stall
       or zvlsseg_index_nf_last
       or zvlsseg_index_sm_start
       or zvlsseg_index_split_last)
begin
  case(zvlsseg_index_cur_state)
  ZVLSSEG_INDEX_IDLE  : if(zvlsseg_index_sm_start)
                       zvlsseg_index_next_state = ZVLSSEG_INDEX_SPLIT;
                       else
                       zvlsseg_index_next_state = ZVLSSEG_INDEX_IDLE;
  ZVLSSEG_INDEX_SPLIT : if(!ctrl_split_long_id_stall && zvlsseg_index_split_last && zvlsseg_index_nf_last)
                       zvlsseg_index_next_state = ZVLSSEG_INDEX_IDLE;
                       else
                       zvlsseg_index_next_state = ZVLSSEG_INDEX_SPLIT;
  default        :     zvlsseg_index_next_state = ZVLSSEG_INDEX_IDLE;
  endcase
// &CombEnd; @4993
end

always @(posedge zvlsseg_index_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_index_cnt[6:0] <= {7{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_index_cnt[6:0] <= {7{1'b0}};
  else if((zvlsseg_index_sm_start || zvlsseg_index_cur_state) && zvlsseg_index_nf_last && !ctrl_split_long_id_stall)  
    zvlsseg_index_cnt[6:0] <= zvlsseg_index_split_last ? {7{1'b0}}: (zvlsseg_index_cnt[6:0] + 1'b1);
end

always @(posedge zvlsseg_index_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_index_vreg_offset[2:0]  <= {3{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_index_vreg_offset[2:0]  <= {3{1'b0}};
  else if(zvlsseg_index_cur_state && zvlsseg_index_nf_last && !ctrl_split_long_id_stall)  
    zvlsseg_index_vreg_offset[2:0] <= zvlsseg_index_split_last ? {3{1'b0}}: (zvlsseg_index_vreg_offset[2:0] + {2'b00,zvlsseg_index_vreg_end});
end

//assign zvlsseg_index_vreg_begin  = (vec_sew[1:0]==2'b00) && (zvlsseg_index_cnt[3:0]==4'b0000) 
//                                  || (vec_sew[1:0]==2'b01) && (zvlsseg_index_cnt[2:0]==3'b000)
//                                  || (vec_sew[1:0]==2'b10) && (zvlsseg_index_cnt[1:0]==2'b00)
//                                  || (vec_sew[1:0]==2'b11) && (zvlsseg_index_cnt[0]  ==1'b0);

assign zvlsseg_index_vreg_end    = (vec_sew[1:0]==2'b00) && (zvlsseg_index_cnt[3:0]==4'b1111) 
                                  || (vec_sew[1:0]==2'b01) && (zvlsseg_index_cnt[2:0]==3'b111)
                                  || (vec_sew[1:0]==2'b10) && (zvlsseg_index_cnt[1:0]==2'b11)
                                  || (vec_sew[1:0]==2'b11) && (zvlsseg_index_cnt[0]  ==1'b1);

assign zvlsseg_index_split_last  = (vec_lmul[1:0]==2'b00) && zvlsseg_index_vreg_end 
                                  || (vec_lmul[1:0]==2'b01) && zvlsseg_index_vreg_end &&  zvlsseg_index_vreg_offset[0] 
                                  || (vec_lmul[1:0]==2'b10) && zvlsseg_index_vreg_end && &zvlsseg_index_vreg_offset[1:0] 
                                  || (vec_lmul[1:0]==2'b11) && zvlsseg_index_vreg_end && &zvlsseg_index_vreg_offset[2:0];

always @(posedge zvlsseg_index_split_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    zvlsseg_index_nf_cnt[1:0] <= {2{1'b0}};
  else if(rtu_idu_flush_fe  ||  iu_yy_xx_cancel)
    zvlsseg_index_nf_cnt[1:0] <= {2{1'b0}};
  else if(zvlsseg_index_sm_start || zvlsseg_index_cur_state && !ctrl_split_long_id_stall)  
    zvlsseg_index_nf_cnt[1:0] <= zvlsseg_index_nf_last ? {2{1'b0}}: (zvlsseg_index_nf_cnt[1:0] + 1'b1);
end


assign zvlsseg_index_nf_last  = (zvlsseg_index_nf_cnt[1:0] == vec_inst[31:30]); 
assign zvlsseg_index_nf_first = (zvlsseg_index_nf_cnt[1:0] == 2'b0); 

//used for iid_plus
// 2 is the least interval
assign zvlsseg_index_add_iid_plus[3:0] = {1'b0,vec_inst[31:29]} + 4'd2;                     

assign zvlsseg_index_add_inst[31:7] = {25{1'b0}};
assign zvlsseg_index_add_inst[6 :0] = 7'b0110011;

assign zvlsseg_index_ext_inst[31:26]= 6'b001100;
assign zvlsseg_index_ext_inst[25]   = 1'b1;
assign zvlsseg_index_ext_inst[24:20]= vec_inst[24:20]|{2'b0,zvlsseg_index_vreg_offset[2:0]};
assign zvlsseg_index_ext_inst[19:15]= {1'b0,zvlsseg_index_cnt[3:0] &(4'b1111>>vec_sew[1:0])};
assign zvlsseg_index_ext_inst[14:12]= 3'b010;
assign zvlsseg_index_ext_inst[11:7] = 5'b00000;
assign zvlsseg_index_ext_inst[6:0]  = 7'b1010111;

//for dst reg index
// &CombBeg; @5060
always @( vec_lmul[1:0]
       or zvlsseg_index_nf_cnt[1:0])
begin
  case(vec_lmul[1:0])
  2'b00:   index_nf_reg_offset0[5:0] = {3'b0,zvlsseg_index_nf_cnt[1:0],1'b0}; 
  2'b01:   index_nf_reg_offset0[5:0] = {2'b0,zvlsseg_index_nf_cnt[1:0],2'b0}; 
  2'b10:   index_nf_reg_offset0[5:0] = {1'b0,zvlsseg_index_nf_cnt[1:0],3'b0}; 
//  2'b11:   index_nf_reg_offset[5:0] = {zvlsseg_index_nf_cnt[1:0],4'b0}; 
  default: index_nf_reg_offset0[5:0] = 6'b0;
  endcase
// &CombEnd; @5068
end

// &CombBeg; @5070
always @( vec_lmul[1:0]
       or zvlsseg_index_nf_cnt[1:0])
begin
  case(vec_lmul[1:0])
  2'b00:   index_nf_reg_offset1[5:0] = {3'b0,zvlsseg_index_nf_cnt[1:0],1'b1}; 
  2'b01:   index_nf_reg_offset1[5:0] = {2'b0,zvlsseg_index_nf_cnt[1:0],2'b10}; 
  2'b10:   index_nf_reg_offset1[5:0] = {1'b0,zvlsseg_index_nf_cnt[1:0],3'b100}; 
//  2'b11:   index_nf_reg_offset[5:0] = {zvlsseg_index_nf_cnt[1:0],4'b0}; 
  default: index_nf_reg_offset1[5:0] = 6'b0;
  endcase
// &CombEnd; @5078
end

assign  zvlsseg_index_split_dstv_reg0[5:0] = ({1'b0,vec_inst[11:7]} | {3'b0,zvlsseg_index_vreg_offset[2:0]}) + index_nf_reg_offset0[5:0];
assign  zvlsseg_index_split_dstv_reg1[5:0] = ({1'b0,vec_inst[11:7]} | {3'b0,zvlsseg_index_vreg_offset[2:0]}) + index_nf_reg_offset1[5:0];
//----------------------------------------------------------
//                  zvlsseg_index inst 0/4
//----------------------------------------------------------
// &CombBeg; @5085
always @( zvlsseg_index_cnt[6:0]
       or vec_inst[6:0]
       or zvlsseg_index_vreg_offset[2:0]
       or zvlsseg_index_nf_first
       or vec_inst[31:10]
       or zvlsseg_index_ext_inst[31:0]
       or zvlsseg_index_split_dstv_reg0[5:0]
       or zvlsseg_index_nf_last
       or zvlsseg_index_nf_cnt[1:0]
       or zvlsseg_index_split_last)
begin
  zvlsseg_index_split_inst0_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(zvlsseg_index_nf_first) begin
  zvlsseg_index_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = PIPE67;
  zvlsseg_index_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = {3'b000,1'b1,3'b000};
  zvlsseg_index_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = zvlsseg_index_ext_inst[31:0];
  zvlsseg_index_split_inst0_data[IR_SRCV0_VLD]                  = 1'b1;
  zvlsseg_index_split_inst0_data[IR_SRCV0_REG:IR_SRCV0_REG-5]   = {1'b0,vec_inst[24:20]} | {3'b0,zvlsseg_index_vreg_offset[2:0]};
  zvlsseg_index_split_inst0_data[IR_DST_VLD]                    = 1'b1;
  zvlsseg_index_split_inst0_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100_001;
  zvlsseg_index_split_inst0_data[IR_INTMASK]                    = 1'b1;
  zvlsseg_index_split_inst0_data[IR_SPLIT]                      = 1'b1;
  zvlsseg_index_split_inst0_data[IR_IID_PLUS:IR_IID_PLUS-3]     = 4'b0001;
  zvlsseg_index_split_inst0_data[IR_LENGTH]                     = 1'b1;
  end
  else begin
  zvlsseg_index_split_inst0_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  zvlsseg_index_split_inst0_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = zvlsseg_index_cnt[6:0];
  zvlsseg_index_split_inst0_data[IR_OPCODE:IR_OPCODE-31]        = {vec_inst[31:10],zvlsseg_index_nf_cnt[1:0],1'b0,vec_inst[6:0]};
  zvlsseg_index_split_inst0_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_index_split_inst0_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  zvlsseg_index_split_inst0_data[IR_SRCV2_VLD]                  = 1'b1;
  zvlsseg_index_split_inst0_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  zvlsseg_index_split_inst0_data[IR_DSTV_VLD]                   = !vec_inst[5];
  zvlsseg_index_split_inst0_data[IR_DSTV_REG:IR_DSTV_REG-5]     = zvlsseg_index_split_dstv_reg0[5:0];
  zvlsseg_index_split_inst0_data[IR_INTMASK]                    = !(zvlsseg_index_split_last && zvlsseg_index_nf_last && !vec_inst[29]);
  zvlsseg_index_split_inst0_data[IR_SPLIT]                      = !(zvlsseg_index_split_last && zvlsseg_index_nf_last && !vec_inst[29]);
  zvlsseg_index_split_inst0_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_index_split_inst0_data[IR_VMB]                        = !vec_inst[5]; 
  end
// &CombEnd; @5115
end
//----------------------------------------------------------
//                  zvlsseg_index inst 1/5
//----------------------------------------------------------
// &CombBeg; @5119
always @( zvlsseg_index_add_iid_plus[3:0]
       or zvlsseg_index_cnt[6:0]
       or vec_inst[6:0]
       or zvlsseg_index_nf_first
       or vec_inst[31:10]
       or zvlsseg_index_nf_last
       or zvlsseg_index_nf_cnt[1:0]
       or zvlsseg_index_add_inst[31:0]
       or zvlsseg_index_split_dstv_reg1[5:0]
       or zvlsseg_index_split_last)
begin
  zvlsseg_index_split_inst1_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(zvlsseg_index_nf_first) begin
  zvlsseg_index_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = ALU;
  zvlsseg_index_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = zvlsseg_index_add_inst[31:0];
  zvlsseg_index_split_inst1_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_index_split_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5]     = {1'b0,vec_inst[19:15]};
  zvlsseg_index_split_inst1_data[IR_SRC1_VLD]                   = 1'b1;
  zvlsseg_index_split_inst1_data[IR_SRC1_REG:IR_SRC1_REG-5]     = 6'b100_001;
  zvlsseg_index_split_inst1_data[IR_DST_VLD]                    = 1'b1;
  zvlsseg_index_split_inst1_data[IR_DST_REG:IR_DST_REG-5]       = 6'b100000;
  zvlsseg_index_split_inst1_data[IR_INTMASK]                    = 1'b1;
  zvlsseg_index_split_inst1_data[IR_SPLIT]                      = 1'b1;
  zvlsseg_index_split_inst1_data[IR_IID_PLUS:IR_IID_PLUS-3]     = zvlsseg_index_add_iid_plus[3:0];
  zvlsseg_index_split_inst1_data[IR_LENGTH]                     = 1'b1;
  end
  else begin
  zvlsseg_index_split_inst1_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  zvlsseg_index_split_inst1_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = zvlsseg_index_cnt[6:0];
  zvlsseg_index_split_inst1_data[IR_OPCODE:IR_OPCODE-31]        = {vec_inst[31:10],zvlsseg_index_nf_cnt[1:0],1'b1,vec_inst[6:0]};
  zvlsseg_index_split_inst1_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_index_split_inst1_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  zvlsseg_index_split_inst1_data[IR_SRCV2_VLD]                  = 1'b1;
  zvlsseg_index_split_inst1_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  zvlsseg_index_split_inst1_data[IR_DSTV_VLD]                   = !vec_inst[5];
  zvlsseg_index_split_inst1_data[IR_DSTV_REG:IR_DSTV_REG-5]     = zvlsseg_index_split_dstv_reg1[5:0];
  zvlsseg_index_split_inst1_data[IR_INTMASK]                    = !(zvlsseg_index_split_last && zvlsseg_index_nf_last);
  zvlsseg_index_split_inst1_data[IR_SPLIT]                      = !(zvlsseg_index_split_last && zvlsseg_index_nf_last);
  zvlsseg_index_split_inst1_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_index_split_inst1_data[IR_VMB]                        = !vec_inst[5];
  end
// &CombEnd; @5150
end

//----------------------------------------------------------
//                  zvlsseg_index inst 2/6
//----------------------------------------------------------
// &CombBeg; @5155
always @( vec_inst[6:0]
       or zvlsseg_index_cnt[6:0]
       or vec_inst[31:10]
       or zvlsseg_index_split_dstv_reg0[5:0]
       or zvlsseg_index_nf_cnt[1:0])
begin
  zvlsseg_index_split_inst2_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  zvlsseg_index_split_inst2_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  zvlsseg_index_split_inst2_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = zvlsseg_index_cnt[6:0];
  zvlsseg_index_split_inst2_data[IR_OPCODE:IR_OPCODE-31]        = {vec_inst[31:10],zvlsseg_index_nf_cnt[1:0],1'b0,vec_inst[6:0]};
  zvlsseg_index_split_inst2_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_index_split_inst2_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  zvlsseg_index_split_inst2_data[IR_SRCV2_VLD]                  = 1'b1;
  zvlsseg_index_split_inst2_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  zvlsseg_index_split_inst2_data[IR_DSTV_VLD]                   = !vec_inst[5];
  zvlsseg_index_split_inst2_data[IR_DSTV_REG:IR_DSTV_REG-5]     = zvlsseg_index_split_dstv_reg0[5:0];
  zvlsseg_index_split_inst2_data[IR_INTMASK]                    = 1'b1;
  zvlsseg_index_split_inst2_data[IR_SPLIT]                      = 1'b1;
  zvlsseg_index_split_inst2_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_index_split_inst2_data[IR_VMB]                        = !vec_inst[5]; 
  end
// &CombEnd; @5172
end

//----------------------------------------------------------
//                  zvlsseg_index inst 3/7
//----------------------------------------------------------
// &CombBeg; @5177
always @( zvlsseg_index_cnt[6:0]
       or vec_inst[6:0]
       or vec_inst[31:10]
       or zvlsseg_index_nf_last
       or zvlsseg_index_nf_cnt[1:0]
       or zvlsseg_index_split_dstv_reg1[5:0]
       or zvlsseg_index_split_last)
begin
  zvlsseg_index_split_inst3_data[IR_WIDTH-1:0]                  = {IR_WIDTH{1'b0}};
  if(1'b1) begin
  zvlsseg_index_split_inst3_data[IR_INST_TYPE:IR_INST_TYPE-9]   = LSU_P5;
  zvlsseg_index_split_inst3_data[IR_SPLIT_NUM:IR_SPLIT_NUM-6]   = zvlsseg_index_cnt[6:0];
  zvlsseg_index_split_inst3_data[IR_OPCODE:IR_OPCODE-31]        = {vec_inst[31:10],zvlsseg_index_nf_cnt[1:0],1'b1,vec_inst[6:0]};
  zvlsseg_index_split_inst3_data[IR_SRC0_VLD]                   = 1'b1;
  zvlsseg_index_split_inst3_data[IR_SRC0_REG:IR_SRC0_REG-5]     = 6'b100_000;
  zvlsseg_index_split_inst3_data[IR_SRCV2_VLD]                  = 1'b1;
  zvlsseg_index_split_inst3_data[IR_SRCVM_VLD]                  = !vec_inst[25];   
  zvlsseg_index_split_inst3_data[IR_DSTV_VLD]                   = !vec_inst[5];
  zvlsseg_index_split_inst3_data[IR_DSTV_REG:IR_DSTV_REG-5]     = zvlsseg_index_split_dstv_reg1[5:0];
  zvlsseg_index_split_inst3_data[IR_INTMASK]                    = !(zvlsseg_index_split_last && zvlsseg_index_nf_last);
  zvlsseg_index_split_inst3_data[IR_SPLIT]                      = !(zvlsseg_index_split_last && zvlsseg_index_nf_last);
  zvlsseg_index_split_inst3_data[IR_LENGTH]                     = 1'b1;
  zvlsseg_index_split_inst3_data[IR_VMB]                        = !vec_inst[5];
  end
// &CombEnd; @5194
end

//----------------------------------------------------------
//                  zvlsseg_index inst select
//----------------------------------------------------------
assign zvlsseg_index_inst0_data[IR_WIDTH-1:0] = zvlsseg_index_split_inst0_data[IR_WIDTH-1:0];
assign zvlsseg_index_inst1_data[IR_WIDTH-1:0] = zvlsseg_index_split_inst1_data[IR_WIDTH-1:0];
assign zvlsseg_index_inst2_data[IR_WIDTH-1:0] = zvlsseg_index_split_inst2_data[IR_WIDTH-1:0];
assign zvlsseg_index_inst3_data[IR_WIDTH-1:0] = zvlsseg_index_split_inst3_data[IR_WIDTH-1:0];

assign zvlsseg_index_inst_vld[0] = 1'b1;
assign zvlsseg_index_inst_vld[1] = !(zvlsseg_index_nf_last && !zvlsseg_index_nf_first && !vec_inst[29]);
assign zvlsseg_index_inst_vld[2] = zvlsseg_index_nf_first;
assign zvlsseg_index_inst_vld[3] = zvlsseg_index_nf_first;

assign zvlsseg_index_dep_info[DEP_WIDTH-1:0] = {DEP_WIDTH{1'b0}};

//==========================================================
//               Split Instructions Selection
//==========================================================
//----------------------------------------------------------
//              MUX between split instructions
//----------------------------------------------------------
assign split_long_ctrl_inst_vld[3:0] =
         {4{dp_split_long_type[0]}}  & amo_inst_vld[3:0] 
        |{4{dp_split_long_type[1]}}  & vec_norm_inst_vld[3:0]
        |{4{dp_split_long_type[2]}}  & vec_perm_inst_vld[3:0]  
        |{4{dp_split_long_type[3]}}  & vec_fred_inst_vld[3:0]  
        |{4{dp_split_long_type[4]}}  & vec_stride_inst_vld[3:0]  
        |{4{dp_split_long_type[5]}}  & vec_index_inst_vld[3:0] 
        |{4{dp_split_long_type[6]}}  & vec_amo_inst_vld[3:0] 
        |{4{dp_split_long_type[7]}}  & zvlsseg_unit_inst_vld[3:0] 
        |{4{dp_split_long_type[8]}}  & zvlsseg_stride_inst_vld[3:0]
        |{4{dp_split_long_type[9]}}  & zvlsseg_index_inst_vld[3:0]; 

assign split_long_ctrl_id_stall =
            dp_split_long_type[0]  &&  amo_split_stall
          ||dp_split_long_type[1]  &&  vec_norm_split_stall
          ||dp_split_long_type[2]  &&  vec_perm_split_stall 
          ||dp_split_long_type[3]  &&  vec_fred_split_stall
          ||dp_split_long_type[4]  &&  vec_stride_split_stall
          ||dp_split_long_type[5]  &&  vec_index_split_stall
          ||dp_split_long_type[6]  &&  vec_amo_split_stall
          ||dp_split_long_type[7]  &&  zvlsseg_unit_split_stall
          ||dp_split_long_type[8]  &&  zvlsseg_stride_split_stall
          ||dp_split_long_type[9]  &&  zvlsseg_index_split_stall;

assign split_long_dp_dep_info[DEP_WIDTH-1:0] =
         {DEP_WIDTH{dp_split_long_type[0]}}  &      amo_dep_info[DEP_WIDTH-1:0]
        |{DEP_WIDTH{dp_split_long_type[1]}}  &      vec_norm_dep_info[DEP_WIDTH-1:0] 
        |{DEP_WIDTH{dp_split_long_type[2]}}  &      vec_perm_dep_info[DEP_WIDTH-1:0] 
        |{DEP_WIDTH{dp_split_long_type[3]}}  &      vec_fred_dep_info[DEP_WIDTH-1:0] 
        |{DEP_WIDTH{dp_split_long_type[4]}}  &      vec_stride_dep_info[DEP_WIDTH-1:0] 
        |{DEP_WIDTH{dp_split_long_type[5]}}  &      vec_index_dep_info[DEP_WIDTH-1:0]
        |{DEP_WIDTH{dp_split_long_type[6]}}  &      vec_amo_dep_info[DEP_WIDTH-1:0]
        |{DEP_WIDTH{dp_split_long_type[7]}}  &      zvlsseg_unit_dep_info[DEP_WIDTH-1:0]
        |{DEP_WIDTH{dp_split_long_type[8]}}  &      zvlsseg_stride_dep_info[DEP_WIDTH-1:0]
        |{DEP_WIDTH{dp_split_long_type[9]}}  &      zvlsseg_index_dep_info[DEP_WIDTH-1:0];

assign split_long_inst0_data[IR_WIDTH-1:0] =
         {IR_WIDTH{dp_split_long_type[0]}}  &      amo_inst0_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[1]}}  &      vec_norm_inst0_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[2]}}  &      vec_perm_inst0_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[3]}}  &      vec_fred_inst0_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[4]}}  &      vec_stride_inst0_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[5]}}  &      vec_index_inst0_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[6]}}  &      vec_amo_inst0_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[7]}}  &      zvlsseg_unit_inst0_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[8]}}  &      zvlsseg_stride_inst0_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[9]}}  &      zvlsseg_index_inst0_data[IR_WIDTH-1:0];

assign split_long_inst1_data[IR_WIDTH-1:0] =
         {IR_WIDTH{dp_split_long_type[0]}}  &      amo_inst1_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[1]}}  &      vec_norm_inst1_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[2]}}  &      vec_perm_inst1_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[3]}}  &      vec_fred_inst1_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[4]}}  &      vec_stride_inst1_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[5]}}  &      vec_index_inst1_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[6]}}  &      vec_amo_inst1_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[7]}}  &      zvlsseg_unit_inst1_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[8]}}  &      zvlsseg_stride_inst1_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[9]}}  &      zvlsseg_index_inst1_data[IR_WIDTH-1:0];

assign split_long_inst2_data[IR_WIDTH-1:0] =
         {IR_WIDTH{dp_split_long_type[0]}}  &      amo_inst2_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[1]}}  &      vec_norm_inst2_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[2]}}  &      vec_perm_inst2_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[3]}}  &      vec_fred_inst2_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[4]}}  &      vec_stride_inst2_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[5]}}  &      vec_index_inst2_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[6]}}  &      vec_amo_inst2_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[7]}}  &      zvlsseg_unit_inst2_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[8]}}  &      zvlsseg_stride_inst2_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[9]}}  &      zvlsseg_index_inst2_data[IR_WIDTH-1:0];

assign split_long_inst3_data[IR_WIDTH-1:0] =
         {IR_WIDTH{dp_split_long_type[0]}}  &      amo_inst3_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[1]}}  &      vec_norm_inst3_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[2]}}  &      vec_perm_inst3_data[IR_WIDTH-1:0] 
        |{IR_WIDTH{dp_split_long_type[3]}}  &      vec_fred_inst3_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[4]}}  &      vec_stride_inst3_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[5]}}  &      vec_index_inst3_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[6]}}  &      vec_amo_inst3_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[7]}}  &      zvlsseg_unit_inst3_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[8]}}  &      zvlsseg_stride_inst3_data[IR_WIDTH-1:0]
        |{IR_WIDTH{dp_split_long_type[9]}}  &      zvlsseg_index_inst3_data[IR_WIDTH-1:0];

//----------------------------------------------------------
//             Re-Pack into IR data path form
//----------------------------------------------------------
// &CombBeg; @5304
always @( widden_split_inst0_vlmul[1:0]
       or split_long_inst0_data[177:0]
       or dp_split_long_bkpta_inst
       or dp_split_long_bkptb_inst
       or dp_split_long_vlmul[1:0]
       or dp_split_long_no_spec
       or vperm_split_mtvr_vld
       or dp_split_long_vl_pred
       or widden_split_inst_vld
       or widden_split_inst0_vsew[2:0]
       or dp_split_long_vsew[2:0]
       or dp_split_long_pc[14:0]
       or dp_split_long_vl[7:0])
begin
  split_long_dp_inst0_data[IR_WIDTH-1:0]              = split_long_inst0_data[IR_WIDTH-1:0];
  if(1'b1) begin
  split_long_dp_inst0_data[IR_DST_X0]                 = (split_long_inst0_data[IR_DST_REG:IR_DST_REG-5]
                                                        == 6'd0);
  split_long_dp_inst0_data[IR_SPLIT_LAST]             = !split_long_inst0_data[IR_SPLIT];
  split_long_dp_inst0_data[IR_BKPTB_INST]             = dp_split_long_bkptb_inst;
  split_long_dp_inst0_data[IR_BKPTA_INST]             = dp_split_long_bkpta_inst;
  split_long_dp_inst0_data[IR_NO_SPEC]                = dp_split_long_no_spec;
  split_long_dp_inst0_data[IR_VLMUL:IR_VLMUL-1]       = widden_split_inst_vld ? widden_split_inst0_vlmul[1:0] : dp_split_long_vlmul[1:0];
  split_long_dp_inst0_data[IR_VSEW:IR_VSEW-2]         = widden_split_inst_vld ? widden_split_inst0_vsew[2:0] : (vperm_split_mtvr_vld ? 3'b011 : dp_split_long_vsew[2:0]);
  split_long_dp_inst0_data[IR_VL:IR_VL-7]             = dp_split_long_vl[7:0];
  split_long_dp_inst0_data[IR_VL_PRED]                = dp_split_long_vl_pred;
  split_long_dp_inst0_data[IR_PC:IR_PC-14]            = dp_split_long_pc[14:0];
  end
// &CombEnd; @5319
end

// &CombBeg; @5321
always @( dp_split_long_bkpta_inst
       or dp_split_long_bkptb_inst
       or dp_split_long_vlmul[1:0]
       or dp_split_long_no_spec
       or dp_split_long_vl_pred
       or widden_split_inst1_vlmul[1:0]
       or widden_split_inst_vld
       or dp_split_long_vsew[2:0]
       or widden_split_inst1_vsew[2:0]
       or split_long_inst1_data[177:0]
       or dp_split_long_pc[14:0]
       or dp_split_long_vl[7:0])
begin
  split_long_dp_inst1_data[IR_WIDTH-1:0]              = split_long_inst1_data[IR_WIDTH-1:0];
  if(1'b1) begin
  split_long_dp_inst1_data[IR_DST_X0]                 = (split_long_inst1_data[IR_DST_REG:IR_DST_REG-5]
                                                        == 6'd0);
  split_long_dp_inst1_data[IR_SPLIT_LAST]             = !split_long_inst1_data[IR_SPLIT];
  split_long_dp_inst1_data[IR_BKPTB_INST]             = dp_split_long_bkptb_inst;
  split_long_dp_inst1_data[IR_BKPTA_INST]             = dp_split_long_bkpta_inst;
  split_long_dp_inst1_data[IR_NO_SPEC]                = dp_split_long_no_spec;
  split_long_dp_inst1_data[IR_VLMUL:IR_VLMUL-1]       = widden_split_inst_vld ? widden_split_inst1_vlmul[1:0] : dp_split_long_vlmul[1:0];
  split_long_dp_inst1_data[IR_VSEW:IR_VSEW-2]         = widden_split_inst_vld ? widden_split_inst1_vsew[2:0] : dp_split_long_vsew[2:0];
  split_long_dp_inst1_data[IR_VL:IR_VL-7]             = dp_split_long_vl[7:0];
  split_long_dp_inst1_data[IR_VL_PRED]                = dp_split_long_vl_pred;
  split_long_dp_inst1_data[IR_PC:IR_PC-14]            = dp_split_long_pc[14:0];
  end
// &CombEnd; @5336
end

// &CombBeg; @5338
always @( dp_split_long_bkpta_inst
       or dp_split_long_bkptb_inst
       or dp_split_long_vlmul[1:0]
       or dp_split_long_no_spec
       or dp_split_long_vl_pred
       or widden_split_inst_vld
       or widden_split_inst2_vsew[2:0]
       or widden_split_inst2_vlmul[1:0]
       or dp_split_long_vsew[2:0]
       or split_long_inst2_data[177:0]
       or dp_split_long_pc[14:0]
       or dp_split_long_vl[7:0])
begin
  split_long_dp_inst2_data[IR_WIDTH-1:0]              = split_long_inst2_data[IR_WIDTH-1:0];
  if(1'b1) begin
  split_long_dp_inst2_data[IR_DST_X0]                 = (split_long_inst2_data[IR_DST_REG:IR_DST_REG-5]
                                                        == 6'd0);
  split_long_dp_inst2_data[IR_SPLIT_LAST]             = !split_long_inst2_data[IR_SPLIT];
  split_long_dp_inst2_data[IR_BKPTB_INST]             = dp_split_long_bkptb_inst;
  split_long_dp_inst2_data[IR_BKPTA_INST]             = dp_split_long_bkpta_inst;
  split_long_dp_inst2_data[IR_NO_SPEC]                = dp_split_long_no_spec;
  split_long_dp_inst2_data[IR_VLMUL:IR_VLMUL-1]       = widden_split_inst_vld ? widden_split_inst2_vlmul[1:0] : dp_split_long_vlmul[1:0];
  split_long_dp_inst2_data[IR_VSEW:IR_VSEW-2]         = widden_split_inst_vld ? widden_split_inst2_vsew[2:0] : dp_split_long_vsew[2:0];
  split_long_dp_inst2_data[IR_VL:IR_VL-7]             = dp_split_long_vl[7:0];
  split_long_dp_inst2_data[IR_VL_PRED]                = dp_split_long_vl_pred;
  split_long_dp_inst2_data[IR_PC:IR_PC-14]            = dp_split_long_pc[14:0];
  end
// &CombEnd; @5353
end

// &CombBeg; @5355
always @( widden_split_inst3_vsew[2:0]
       or dp_split_long_bkpta_inst
       or dp_split_long_bkptb_inst
       or dp_split_long_vlmul[1:0]
       or dp_split_long_no_spec
       or dp_split_long_vl_pred
       or widden_split_inst_vld
       or dp_split_long_vsew[2:0]
       or widden_split_inst3_vlmul[1:0]
       or split_long_inst3_data[177:0]
       or dp_split_long_pc[14:0]
       or dp_split_long_vl[7:0])
begin
  split_long_dp_inst3_data[IR_WIDTH-1:0]              = split_long_inst3_data[IR_WIDTH-1:0];
  if(1'b1) begin
  split_long_dp_inst3_data[IR_DST_X0]                 = (split_long_inst3_data[IR_DST_REG:IR_DST_REG-5]
                                                        == 6'd0);
  split_long_dp_inst3_data[IR_SPLIT_LAST]             = !split_long_inst3_data[IR_SPLIT];
  split_long_dp_inst3_data[IR_BKPTB_INST]             = dp_split_long_bkptb_inst;
  split_long_dp_inst3_data[IR_BKPTA_INST]             = dp_split_long_bkpta_inst;
  split_long_dp_inst3_data[IR_NO_SPEC]                = dp_split_long_no_spec;
  split_long_dp_inst3_data[IR_VLMUL:IR_VLMUL-1]       = widden_split_inst_vld ? widden_split_inst3_vlmul[1:0] : dp_split_long_vlmul[1:0];
  split_long_dp_inst3_data[IR_VSEW:IR_VSEW-2]         = widden_split_inst_vld ? widden_split_inst3_vsew[2:0] : dp_split_long_vsew[2:0];
  split_long_dp_inst3_data[IR_VL:IR_VL-7]             = dp_split_long_vl[7:0];
  split_long_dp_inst3_data[IR_VL_PRED]                = dp_split_long_vl_pred;
  split_long_dp_inst3_data[IR_PC:IR_PC-14]            = dp_split_long_pc[14:0];
  end
// &CombEnd; @5370
end


// &ModuleEnd; @5373
endmodule


